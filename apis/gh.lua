
function query_notifications()
    local command = [[  gh api -X GET notifications --cache=20s \
        -f per_page="$local_page_size" -f all="$include_all_flag" \
        -f participating="$only_participating_flag" -f page="$page_num" ]]
    local handle = io.popen(command)
    local res = handle:read("*a")
    handle:close()
    return res
end

function parse_notifications(notifications)
    notif =  vim.fn.json_decode(notifications)
    local out = {tasks = {}}
    -- make a little table for these guys, then vomit out text
    for _, n in pairs(notif) do
        local project = n.repository.full_name
        local s = n.subject
        local context = s.reason
        local type = s.type
        local url = s.url
        local item = s.title
    end
end

xx = query_notifications()
vim.pretty_print(parse_notifications(xx)[1])
