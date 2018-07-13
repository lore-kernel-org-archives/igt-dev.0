Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
References: <20180712105958.12953-1-tvrtko.ursulin@linux.intel.com>
 <20180712105958.12953-4-tvrtko.ursulin@linux.intel.com>
From: John Harrison <John.C.Harrison@Intel.com>
Message-ID: <52ac60f9-ea11-cbd2-6f72-2bae0656d19a@Intel.com>
Date: Thu, 12 Jul 2018 17:51:20 -0700
MIME-Version: 1.0
In-Reply-To: <20180712105958.12953-4-tvrtko.ursulin@linux.intel.com>
Content-Language: en-US
Subject: Re: [Intel-gfx] [PATCH i-g-t 3/9] trace.pl: Improve readability of
 graphical timeline representation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1637774817=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1637774817==
Content-Type: multipart/alternative;
 boundary="------------23EC9C757F9B393FD151CEB1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------23EC9C757F9B393FD151CEB1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> We add stripes for different stages of request execution so it is easier
> to follow one context in the multi-colour mode.
>
> Vertical stripe pattern indicates pipeline "blockages" - requests waiting
> for dependencies before they are runnable.
>
> Diagonal stripes indicate runnable requests waiting for GPU time.
>
> Horizontal strips are requests executing on the GPU.
>
> Also use this new multi-coloured mode from media-bench.pl.
>
> v2:
>   John Harrison:
>   * Mention media-bench.pl in the commit.
>   * Fix HTML for single colour mode.
>
> v3:
>   * Rebase.
>   * Apply stripes to legacy colouring as well.
>
> v4:
>   John Harrison:
>   * Use per context colours for ctxsave and incomplete boxes.
>   * Clearer timeline legend.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: John Harrison<John.C.Harrison@Intel.com>


--------------23EC9C757F9B393FD151CEB1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 7/12/2018 3:59 AM, Tvrtko Ursulin wrote:<br>
    <blockquote type="cite"
      cite="mid:20180712105958.12953-4-tvrtko.ursulin@linux.intel.com">
      <pre wrap="">From: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>

We add stripes for different stages of request execution so it is easier
to follow one context in the multi-colour mode.

Vertical stripe pattern indicates pipeline "blockages" - requests waiting
for dependencies before they are runnable.

Diagonal stripes indicate runnable requests waiting for GPU time.

Horizontal strips are requests executing on the GPU.

Also use this new multi-coloured mode from media-bench.pl.

v2:
 John Harrison:
 * Mention media-bench.pl in the commit.
 * Fix HTML for single colour mode.

v3:
 * Rebase.
 * Apply stripes to legacy colouring as well.

v4:
 John Harrison:
 * Use per context colours for ctxsave and incomplete boxes.
 * Clearer timeline legend.

Signed-off-by: Tvrtko Ursulin <a class="moz-txt-link-rfc2396E" href="mailto:tvrtko.ursulin@intel.com">&lt;tvrtko.ursulin@intel.com&gt;</a>
Cc: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>
</pre>
    </blockquote>
    <br>
    <pre wrap="">Reviewed-by: John Harrison <a class="moz-txt-link-rfc2396E" href="mailto:John.C.Harrison@Intel.com">&lt;John.C.Harrison@Intel.com&gt;</a>

</pre>
  </body>
</html>

--------------23EC9C757F9B393FD151CEB1--

--===============1637774817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============1637774817==--
