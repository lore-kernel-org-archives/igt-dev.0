Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8088089686
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 05:56:38 +0000 (UTC)
References: <20200505132032.827-1-anshuman.gupta@intel.com>
 <20200505132032.827-2-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <2118909e-914e-d15a-5384-233c87cdf4e1@intel.com>
Date: Thu, 7 May 2020 11:26:32 +0530
MIME-Version: 1.0
In-Reply-To: <20200505132032.827-2-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v6 1/6] tests/i915_pm_lpsp: Nuke the
 panel-fitter test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0023257025=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0023257025==
Content-Type: multipart/alternative;
 boundary="------------49AF6A6769FAAE5389E901A4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------49AF6A6769FAAE5389E901A4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05-05-2020 18:50, Anshuman Gupta wrote:
> panel-fitter subtest is only applicable to HASWELL/BROADWELL.
> It just tests non-lpsp(lpsp disabled) when panel fitter is
> enforced by std 1024x768 mode.
> There is no ROI to test non-lpsp kind of thing,
> If HSW_GLOBAL power well is not enabled we would see
> other display issues in other display tests.
>
> Gen9+ platform has display scaling feature in built per
> pipe, as lpsp is all about low power single pipe (PIPE A)
> usage, gen9+ platforms also don't require panel-fitter subtest.
> This should save some CI cycles.
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Changes looks good to me.
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>   tests/i915/i915_pm_lpsp.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 42938e10..08f82e7c 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -219,8 +219,6 @@ igt_main
>   		screens_disabled_subtest(drm_fd, drm_res);
>   	igt_subtest("edp-native")
>   		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
> -	igt_subtest("edp-panel-fitter")
> -		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);
>   	igt_subtest("non-edp")
>   		non_edp_subtest(drm_fd, drm_res, drm_connectors);
>   

--------------49AF6A6769FAAE5389E901A4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 05-05-2020 18:50, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200505132032.827-2-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">panel-fitter subtest is only applicable to HASWELL/BROADWELL.
It just tests non-lpsp(lpsp disabled) when panel fitter is
enforced by std 1024x768 mode.
There is no ROI to test non-lpsp kind of thing,
If HSW_GLOBAL power well is not enabled we would see
other display issues in other display tests.

Gen9+ platform has display scaling feature in built per
pipe, as lpsp is all about low power single pipe (PIPE A)
usage, gen9+ platforms also don't require panel-fitter subtest.
This should save some CI cycles.

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a></pre>
    </blockquote>
    <pre>Changes looks good to me.
Reviewed-by: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200505132032.827-2-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 tests/i915/i915_pm_lpsp.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 42938e10..08f82e7c 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -219,8 +219,6 @@ igt_main
 		screens_disabled_subtest(drm_fd, drm_res);
 	igt_subtest("edp-native")
 		edp_subtest(drm_fd, drm_res, drm_connectors, devid, false);
-	igt_subtest("edp-panel-fitter")
-		edp_subtest(drm_fd, drm_res, drm_connectors, devid, true);
 	igt_subtest("non-edp")
 		non_edp_subtest(drm_fd, drm_res, drm_connectors);
 
</pre>
    </blockquote>
  </body>
</html>

--------------49AF6A6769FAAE5389E901A4--

--===============0023257025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0023257025==--
