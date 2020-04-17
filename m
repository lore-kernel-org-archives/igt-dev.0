Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730FB6EC24
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 14:27:55 +0000 (UTC)
References: <20200409053951.26929-1-anshuman.gupta@intel.com>
 <20200409053951.26929-5-anshuman.gupta@intel.com>
From: "Manna, Animesh" <animesh.manna@intel.com>
Message-ID: <ce12e4fc-a782-6375-da94-25371c47ed0e@intel.com>
Date: Fri, 17 Apr 2020 19:57:47 +0530
MIME-Version: 1.0
In-Reply-To: <20200409053951.26929-5-anshuman.gupta@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/5] tests/i915_pm_lpsp:
 screens-disabled subtest use igt_wait
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2018515117=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>, igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============2018515117==
Content-Type: multipart/alternative;
 boundary="------------1D784696E36E2DFDE594FEFC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1D784696E36E2DFDE594FEFC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09-04-2020 11:09, Anshuman Gupta wrote:
> When all screens are disabled, it takes some time to release
> eDP/DP AUX IO power domain ref count. Also, delayed audio codec
> disabling takes time to release AUDIO power domain ref-count,
> using igt_wait to check lpsp after disabling all screens.
>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   tests/i915/i915_pm_lpsp.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
> index 7be23e6c..e05d3791 100644
> --- a/tests/i915/i915_pm_lpsp.c
> +++ b/tests/i915/i915_pm_lpsp.c
> @@ -79,7 +79,8 @@ static void screens_disabled_subtest(data_t *data)
>   	}
>   
>   	igt_require_f(valid_output, "No connected output found\n");
> -	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
> +	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),

Better to add code-comment here how the above time is calculated. Is it based on observation or captured anywhere?

Regards,
Animesh

> +		     "lpsp is not enabled\n%s:\n%s\n",
>   		     PWR_DOMAIN_INFO, data->pwr_dmn_info =
>   		     igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>   }

--------------1D784696E36E2DFDE594FEFC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09-04-2020 11:09, Anshuman Gupta
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200409053951.26929-5-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">When all screens are disabled, it takes some time to release
eDP/DP AUX IO power domain ref count. Also, delayed audio codec
disabling takes time to release AUDIO power domain ref-count,
using igt_wait to check lpsp after disabling all screens.

Signed-off-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
 tests/i915/i915_pm_lpsp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 7be23e6c..e05d3791 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -79,7 +79,8 @@ static void screens_disabled_subtest(data_t *data)
 	}
 
 	igt_require_f(valid_output, "No connected output found\n");
-	igt_assert_f(lpsp_is_enabled(data), "lpsp is not enabled\n%s:\n%s\n",
+	igt_assert_f(igt_wait(lpsp_is_enabled(data), 1000, 100),</pre>
    </blockquote>
    <pre>Better to add code-comment here how the above time is calculated. Is it based on observation or captured anywhere? 
</pre>
    <pre>Regards,
Animesh
</pre>
    <blockquote type="cite"
      cite="mid:20200409053951.26929-5-anshuman.gupta@intel.com">
      <pre class="moz-quote-pre" wrap="">
+		     "lpsp is not enabled\n%s:\n%s\n",
 		     PWR_DOMAIN_INFO, data-&gt;pwr_dmn_info =
 		     igt_sysfs_get(data-&gt;debugfs_fd, PWR_DOMAIN_INFO));
 }
</pre>
    </blockquote>
  </body>
</html>

--------------1D784696E36E2DFDE594FEFC--

--===============2018515117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============2018515117==--
