Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
 <20180712105958.12953-5-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <a07380db-058d-c236-51b8-8ac7ecf14835@Intel.com>
Date: Thu, 12 Jul 2018 17:51:07 -0700
MIME-Version: 1.0
In-Reply-To: <20180712105958.12953-5-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t 4/9] trace.pl: Improve context
 colouring for large context id's
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0146069168=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0146069168==
Content-Type: multipart/alternative;
 boundary="------------82F410EC14B95CE9B319424C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------82F410EC14B95CE9B319424C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> John reports that on a long runnning systems the huge disparity between
> kernel context and user context id's causes all interesting colours to be
> clustered too close together.
>
> Fix this by assigning colours to seen contexts instead of basing purely
> on context id's.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Suggested-by: John Harrison <John.C.Harrison@Intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>



--------------82F410EC14B95CE9B319424C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180712105958.12953-5-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

John reports that on a long runnning systems the huge disparity between
kernel context and user context id's causes all interesting colours to be
clustered too close together.

Fix this by assigning colours to seen contexts instead of basing purely
on context id's.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Suggested-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
---

</pre>
    </blockquote>
    <br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
</pre>
    <br>
  </body>
</html>

--------------82F410EC14B95CE9B319424C--

--===============0146069168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0146069168==--
