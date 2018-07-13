Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
 <20180712105958.12953-8-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <9132d480-72bc-1504-de87-54c6cc526da8@Intel.com>
Date: Fri, 13 Jul 2018 00:00:08 -0700
MIME-Version: 1.0
In-Reply-To: <20180712105958.12953-8-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 7/9] trace.pl: Fix incomplete request
 handling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0431028378=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0431028378==
Content-Type: multipart/alternative;
 boundary="------------5D2E44DC25F417D88408E40F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5D2E44DC25F417D88408E40F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Incomplete requests (no notify, no context complete) have to be corrected
> by looking at the engine timeline, and not the sorted-by-start-time view
> as was previously used.
>
> Per-engine timelines are generated on demand and cached for later use.
>
> v2: Find end of current context on the engine timeline instead of just
>      using the next request for adjusting the incomplete start time.
>
> v3: Improve scaling with large datasets by only walking each engine
>      timeline once and some caching. (John Harrison)
>
> v4:
>   * Fix logic fail from v3.
>   * Refactor the code a bit to separate the stages better.
>   * Do not account batches with unknown duration in avg stats.
>   * Handle two user interrupts with the same seqno.
>   * Handle user interrupt arriving after request_out.
>
> v5:
>   * Update for class:instance.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@intel.com>
> ---
>

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>



--------------5D2E44DC25F417D88408E40F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180712105958.12953-8-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

Incomplete requests (no notify, no context complete) have to be corrected
by looking at the engine timeline, and not the sorted-by-start-time view
as was previously used.

Per-engine timelines are generated on demand and cached for later use.

v2: Find end of current context on the engine timeline instead of just
    using the next request for adjusting the incomplete start time.

v3: Improve scaling with large datasets by only walking each engine
    timeline once and some caching. (John Harrison)

v4:
 * Fix logic fail from v3.
 * Refactor the code a bit to separate the stages better.
 * Do not account batches with unknown duration in avg stats.
 * Handle two user interrupts with the same seqno.
 * Handle user interrupt arriving after request_out.

v5:
 * Update for class:instance.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@intel.com">&lt;John.C.Harrison@intel.com&gt;</a>
---

</pre>
    </blockquote>
    <br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>


</pre>
  </body>
</html>

--------------5D2E44DC25F417D88408E40F--

--===============0431028378==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0431028378==--
