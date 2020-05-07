Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA0C7896E9
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 06:26:33 +0000 (UTC)
References: <20200505132032.827-1-anshuman.gupta@intel.com>
 <20200505132032.827-5-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <332e41a9-ba71-cc52-0b8c-20fc64ea206e@intel.com>
Date: Thu, 7 May 2020 11:56:28 +0530
MIME-Version: 1.0
In-Reply-To: <20200505132032.827-5-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v6 4/6] test/i915_pm_lpsp: Skip
 screens-disabled test for DC state platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1487735707=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1487735707==
Content-Type: multipart/alternative;
 boundary="------------2CE182C3B8CC9990746CDA97"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2CE182C3B8CC9990746CDA97
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05-05-2020 18:50, Anshuman Gupta wrote:
> screens-disabled test is only valid for the plaforms like HSW/BDW
> where PG1 is Always-ON power domain, so these platform test lpsp
> with all screen disabled i.e validate PG2 when all screen are
> disabled.
> DC state i.e DMC f/w supported platforms don't have any ROI to validate
> screen-disabled subtest as existing dc*-dpms i915_pm_dc subtest
> already validate it implicitly.
> This should save some CI-Cycles.
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/i915/i915_pm_lpsp.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 8d2e23fe..56980de2 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -172,8 +172,11 @@ igt_main
>   	}
>   
>   	igt_describe("This test validates lpsp while all crtc are disabled");
> -	igt_subtest("screens-disabled")
> +	igt_subtest("screens-disabled") {
> +		igt_skip_on_f(openat(data.debugfs_fd, "i915_dmc_info", O_RDONLY) > 0,
> +			      "DC states supported platform don't have ROI for this subtest\n");
>   		screens_disabled_subtest(&data);
> +	}

I agree from gen9 onward dmc support is present and same time we have multiple power-well having different pipe.
To avoid platform specific change I feel ok to check dmc info. Changes looks good to me.
Can you please club together the changes of this patch with previous one (3/6) where screens_disabled_subtest is implemented to give a better clarity on which platform it is targeted for.

Regards,
Animesh
  

>   
>   	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
>   	igt_subtest_with_dynamic_f("kms-lpsp") {

--------------2CE182C3B8CC9990746CDA97
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
      cite="mid:20200505132032.827-5-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">screens-disabled test is only valid for the plaforms like HSW/BDW
where PG1 is Always-ON power domain, so these platform test lpsp
with all screen disabled i.e validate PG2 when all screen are
disabled.
DC state i.e DMC f/w supported platforms don't have any ROI to validate
screen-disabled subtest as existing dc*-dpms i915_pm_dc subtest
already validate it implicitly.
This should save some CI-Cycles.

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
 tests/i915/i915_pm_lpsp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 8d2e23fe..56980de2 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -172,8 +172,11 @@ igt_main
 	}
 
 	igt_describe("This test validates lpsp while all crtc are disabled");
-	igt_subtest("screens-disabled")
+	igt_subtest("screens-disabled") {
+		igt_skip_on_f(openat(data.debugfs_fd, "i915_dmc_info", O_RDONLY) &gt; 0,
+			      "DC states supported platform don't have ROI for this subtest\n");
 		screens_disabled_subtest(&amp;data);
+	}</pre>
    </blockquote>
    <pre>I agree from gen9 onward dmc support is present and same time we have multiple power-well having different pipe.
To avoid platform specific change I feel ok to check dmc info. Changes looks good to me.
Can you please club together the changes of this patch with previous one (3/6) where screens_disabled_subtest is implemented to give a better clarity on which platform it is targeted for.

Regards,
Animesh 
 </pre>
    <blockquote type="cite"
      cite="mid:20200505132032.827-5-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
 
 	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
 	igt_subtest_with_dynamic_f("kms-lpsp") {
</pre>
    </blockquote>
  </body>
</html>

--------------2CE182C3B8CC9990746CDA97--

--===============1487735707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1487735707==--
