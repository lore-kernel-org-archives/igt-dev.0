Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61BD96ECDE
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2020 05:54:42 +0000 (UTC)
References: <20200716141557.15909-1-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <54af2290-3f1c-15b7-2f73-04d183f8f12a@intel.com>
Date: Fri, 17 Jul 2020 11:24:35 +0530
MIME-Version: 1.0
In-Reply-To: <20200716141557.15909-1-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_lpsp: Add igt_wait to
 test lpsp
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0112780699=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0112780699==
Content-Type: multipart/alternative;
 boundary="------------1D46025F48BE3E3FCE73791C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1D46025F48BE3E3FCE73791C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16-07-2020 19:45, Anshuman Gupta wrote:
> Sometimes LPSP test may fail due to HOTPLUG events,
> which initiates AUX transaction in order to detect a Connector
> status, these ongoing AUX transaction may fail the LPSP igt test.
> Adding a igt_wait will avoid such failures.
> Some eDP panel may have power_cycle_delay of 600ms,
> therefore 1sec delay is safer.
>
> Cc: Animesh Manna <animesh.manna@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

LGTM.
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>   tests/i915/i915_pm_lpsp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 12670f22..e9a59307 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -163,7 +163,8 @@ static void test_lpsp(data_t *data)
>   		    data->mode->vdisplay <= 2160);
>   
>   	setup_lpsp_output(data);
> -	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
> +	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
> +		     "%s: lpsp is not enabled\n%s:\n%s\n",
>   		     data->output->name, PWR_DOMAIN_INFO, data->pwr_dmn_info =
>   		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>   }

--------------1D46025F48BE3E3FCE73791C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16-07-2020 19:45, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200716141557.15909-1-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">Sometimes LPSP test may fail due to HOTPLUG events,
which initiates AUX transaction in order to detect a Connector
status, these ongoing AUX transaction may fail the LPSP igt test.
Adding a igt_wait will avoid such failures.
Some eDP panel may have power_cycle_delay of 600ms,
therefore 1sec delay is safer.

Cc: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a></pre>
    </blockquote>
    <pre>LGTM.
Reviewed-by: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200716141557.15909-1-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 tests/i915/i915_pm_lpsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 12670f22..e9a59307 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -163,7 +163,8 @@ static void test_lpsp(data_t *data)
 		    data-&gt;mode-&gt;vdisplay &lt;= 2160);
 
 	setup_lpsp_output(data);
-	igt_assert_f(lpsp_is_enabled(data), "%s: lpsp is not enabled\n%s:\n%s\n",
+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
+		     "%s: lpsp is not enabled\n%s:\n%s\n",
 		     data-&gt;output-&gt;name, PWR_DOMAIN_INFO, data-&gt;pwr_dmn_info =
 		     igt_sysfs_get(data-&gt;debugfs_fd, PWR_DOMAIN_INFO));
 }
</pre>
    </blockquote>
  </body>
</html>

--------------1D46025F48BE3E3FCE73791C--

--===============0112780699==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0112780699==--
