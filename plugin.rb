#!/bin/env ruby
# encoding: utf-8
# name: app.vpop-pro.com Onebox
# version: 0.1
# authors: vpop


register_css <<CSS
.onebox-vpop-frame{
    width: 100%;
    height: 800px;
    border: 1px solid #F7F7F7;
    background: #F7F7F7;
    margin-bottom: 1em;
}
CSS


Onebox = Onebox
class Onebox::Engine::VpopOnebox
    include Onebox::Engine

    def self.priority
        0
    end

    REGEX = /^https?:\/\/app.vpop-pro\.com\/cases\/([0-9a-z\-]+)$/

    matches_regexp REGEX

    def id
        @url.match(REGEX)[1]
    end

    def url
        "https://app.vpop-pro.com/cases/#{id}"
    end

    def to_html
        <<HTML
        <aside class="onebox">
            <header class="source">
                <a href="https://app.vpop-pro.com/cases/#{id}" target="_blank" rel="noopener">app.vpop-pro.com</a>
            </header>
            <article class="onebox-body">
                <h4><a href="https://app.vpop-pro.com/cases/#{id}" target="_blank" rel="noopener">cases/#{id}</a></h4>
                <iframe class="onebox-vpop-frame" src="https://app.vpop-pro.com/cases/#{id}"></iframe>
            </article>
            <div class="onebox-metadata"></div>
            <div style="clear: both"></div>
        </aside>
HTML
    end
end

