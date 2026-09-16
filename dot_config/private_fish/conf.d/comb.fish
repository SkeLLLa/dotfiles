if status is-interactive
    comb g public_ip.body >/dev/null 2>>/tmp/comb-warmup.log &
end
