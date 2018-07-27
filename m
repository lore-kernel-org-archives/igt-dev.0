Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180719093601.11788-1-tvrtko.ursulin@linux.intel.com>
 <20180719093601.11788-3-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <4312586c-13a4-2661-a4b4-0097ff0d4747@Intel.com>
Date: Fri, 27 Jul 2018 14:43:51 -0700
MIME-Version: 1.0
In-Reply-To: <20180719093601.11788-3-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] trace.pl: Fix request split mode
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0719064063=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0719064063==
Content-Type: multipart/alternative;
 boundary="------------D366B47DE875E479C416B3DB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D366B47DE875E479C416B3DB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/19/2018 2:35 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Request split mode had several bugs, both in the original version and also
> after the recent refactorings.
>
> One big one was that it wasn't considering different submit ports as a
> reason to split execution, and also that it was too time based instead of
> looking at relevant timelines.
>
> In this refactoring we address the former by using the engine timelines
> introduced in the previous patch. Secondary port submissions are moved
> to follow the preceding submission as a first step in the correction
> process.
>
> In the second step, we add context timelines and use then in a similar
> fashion to separate start and end time of coalesced requests. For each
> coalesced request we know its boundaries by looking at the engine
> timeline (via global seqnos), and we know the previous request it should
> only start after, by looking at the context timeline.
>
> v2:
>   * Remove some dead code.
>   * Fix !port0 shifting logic.
>
> v3:
>   * Refactor for less list walking as with incomplete handling.
>
> v4:
>   * Database of context timelines should not contain duplicates!
>     (Converted from array into a hash.)
>
> v5:
>   * Avoid over-accounting runnable time for a coalesced group by recording
>     the time first request entered the GPU and ending the execute delay at
>     that point for the whole group.
>
> v6:
>   * Update for engine class:instance.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@intel.com>
> ---
>   scripts/trace.pl | 138 ++++++++++++++++++++++++++++++++++++-----------
>   1 file changed, 108 insertions(+), 30 deletions(-)
>
>

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


--------------D366B47DE875E479C416B3DB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/19/2018 2:35 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180719093601.11788-3-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Request split mode had several bugs, both in the original version and also
after the recent refactorings.

One big one was that it wasn't considering different submit ports as a
reason to split execution, and also that it was too time based instead of
looking at relevant timelines.

In this refactoring we address the former by using the engine timelines
introduced in the previous patch. Secondary port submissions are moved
to follow the preceding submission as a first step in the correction
process.

In the second step, we add context timelines and use then in a similar
fashion to separate start and end time of coalesced requests. For each
coalesced request we know its boundaries by looking at the engine
timeline (via global seqnos), and we know the previous request it should
only start after, by looking at the context timeline.

v2:
 * Remove some dead code.
 * Fix !port0 shifting logic.

v3:
 * Refactor for less list walking as with incomplete handling.

v4:
 * Database of context timelines should not contain duplicates!
   (Converted from array into a hash.)

v5:
 * Avoid over-accounting runnable time for a coalesced group by recording
   the time first request entered the GPU and ending the execute delay at
   that point for the whole group.

v6:
 * Update for engine class:instance.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@intel.com">&lt;John.C.Harrison@intel.com&gt;</a>
---
 scripts/trace.pl | 138 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 108 insertions(+), 30 deletions(-)


</pre>
    </blockquote>
    <br>
    Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E"
      href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a><br>
    <br>
  </body>
</html>

--------------D366B47DE875E479C416B3DB--

--===============0719064063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0719064063==--
