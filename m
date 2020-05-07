Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDC06E910
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2020 06:05:28 +0000 (UTC)
References: <20200505132032.827-1-anshuman.gupta@intel.com>
 <20200505132032.827-6-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <50eb29eb-8e19-01be-858f-141ff69b59fd@intel.com>
Date: Thu, 7 May 2020 11:35:23 +0530
MIME-Version: 1.0
In-Reply-To: <20200505132032.827-6-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v6 5/6] tests/i915_pm_lpsp:
 screens-disabled subtest use igt_wait
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0730239365=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0730239365==
Content-Type: multipart/alternative;
 boundary="------------80576F5BC2C7EA29E1A99D78"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------80576F5BC2C7EA29E1A99D78
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 05-05-2020 18:50, Anshuman Gupta wrote:
> When all screens are disabled, it takes some time to release
> eDP/DP AUX IO power domain ref count. Also, delayed audio codec
> disabling takes time to release AUDIO power domain ref-count,
> using igt_wait to check lpsp after disabling all screens.
>
> v2:
> - Added a code comment for delay of igt_wait. [Animesh]
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>

Looks good to me.
Reviewed-by: Animesh Manna <animesh.manna@intel.com>

> ---
>   tests/i915/i915_pm_lpsp.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 56980de2..986bfc03 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -81,7 +81,9 @@ static void screens_disabled_subtest(data_t *data)
>   	}
>   
>   	igt_require_f(valid_output, "No connected output found\n");
> -	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
> +	/* eDP panel may have power_cycle_delay of 600ms, 1sec delay is safer */
> +	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
> +		     "lpsp is not enabled\n%s:\n%s\n",
>   		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
>   		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>   }

--------------80576F5BC2C7EA29E1A99D78
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
      cite="mid:20200505132032.827-6-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">When all screens are disabled, it takes some time to release
eDP/DP AUX IO power domain ref count. Also, delayed audio codec
disabling takes time to release AUDIO power domain ref-count,
using igt_wait to check lpsp after disabling all screens.

v2:
- Added a code comment for delay of igt_wait. [Animesh]

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a></pre>
    </blockquote>
    <pre>Looks good to me.
Reviewed-by: Animesh Manna <a class="moz-txt-link-rfc2396E" href="mailto:animesh.manna@intel.com">&lt;animesh.manna@intel.com&gt;</a>
</pre>
    <blockquote type="cite"
      cite="mid:20200505132032.827-6-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
---
 tests/i915/i915_pm_lpsp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 56980de2..986bfc03 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -81,7 +81,9 @@ static void screens_disabled_subtest(data_t *data)
 	}
 
 	igt_require_f(valid_output, "No connected output found\n");
-	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
+	/* eDP panel may have power_cycle_delay of 600ms, 1sec delay is safer */
+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),
+		     "lpsp is not enabled\n%s:\n%s\n",
 		     PWR_DOMAIN_INFO, data-&gt;pwr_dmn_info =
 		     igt_sysfs_get(data-&gt;debugfs_fd, PWR_DOMAIN_INFO));
 }
</pre>
    </blockquote>
  </body>
</html>

--------------80576F5BC2C7EA29E1A99D78--

--===============0730239365==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0730239365==--
