Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
 <20180719093601.11788-2-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <33c68593-3dd7-83d3-744a-1b9375b234e0@Intel.com>
Date: Fri, 27 Jul 2018 14:37:12 -0700
MIME-Version: 1.0
In-Reply-To: <20180719093601.11788-2-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 1/4] trace.pl: Context save
 only applies to last request of a bunch
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2135062285=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2135062285==
Content-Type: multipart/alternative;
 boundary="------------A03531C0A574878EBD2F3BB5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A03531C0A574878EBD2F3BB5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/2018 2:35 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Skip accounting the context save time for anything but the last request of
> the coalesced bunch, and also skip drawing those boxes on the timeline.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>   scripts/trace.pl | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
>
>
Not sure if you are not getting some of my replies? I have definitely 
sent an R-B to this patch at least twice already. Maybe they are getting 
caught by some kind of mailing list filter? I know your patches appear 
randomly in one of three mailboxes for me - inbox, IGT or IntelGFX 
according to which rule happens to take precedence on any given second 
:(. Anyway...

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


--------------A03531C0A574878EBD2F3BB5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/19/2018 2:35 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180719093601.11788-2-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Skip accounting the context save time for anything but the last request of
the coalesced bunch, and also skip drawing those boxes on the timeline.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
---
 scripts/trace.pl | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)


</pre>
    </blockquote>
    Not sure if you are not getting some of my replies? I have
    definitely sent an R-B to this patch at least twice already. Maybe
    they are getting caught by some kind of mailing list filter? I know
    your patches appear randomly in one of three mailboxes for me -
    inbox, IGT or IntelGFX according to which rule happens to take
    precedence on any given second :(. Anyway...<br>
    <br>
    Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E"
      href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a><br>
    <br>
  </body>
</html>

--------------A03531C0A574878EBD2F3BB5--

--===============2135062285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2135062285==--
