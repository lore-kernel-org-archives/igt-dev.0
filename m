Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9C1C3DA5D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 09:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9690710E481;
	Mon, 22 Jul 2024 09:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9D3u7tq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8126F10E481
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721639169; x=1753175169;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=BAQMMUFKkDR6bNfVYQ73DInjpOnifhA3v/stt4V93y8=;
 b=P9D3u7tqRvyG+pSBw9m/hJ6mW4wZfSudH85lPWTJfLNwlUraictfl+uM
 I/r72ZZr+rEweF8BFHACaBKWNAnNzXupvUpQBLk/co8S1sQL6LsGcaxpv
 Q6O2/gR9/Qb35rvwRgG4SfraFPwaw6mfappSJ2PsPuKSH76eTvuu0I/nu
 0ks7o7lm2CS/mW6g9wqed7S+H4PmBNqsZCmukZERpBpvLK2ZEqoASEP0S
 FsQgK7Fn6djNzoyuaP1Wd4e4+MpmAtB8JVk3z+ujpLzE3PrrT7ut+jZ+t
 gflLBENkrapoLnWLstosKy/2SqMNCb4GxWTNmVRbDcUsbeafNOI8TP3fM w==;
X-CSE-ConnectionGUID: 4x42hcxGSaWANu8b/EWWhg==
X-CSE-MsgGUID: LNUKXk4tSDGsJHy6YLN3MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18815398"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208,217";a="18815398"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:06:08 -0700
X-CSE-ConnectionGUID: ggiKMVGVQHelBRHCqf3cpg==
X-CSE-MsgGUID: bpW3zPCPS7yKAhkZotIAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208,217";a="52548235"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.250.237])
 ([10.247.250.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 02:06:07 -0700
Content-Type: multipart/alternative;
 boundary="------------GiwskgaKaNiViOvlTiSBm7CG"
Message-ID: <98a5a02a-d5d9-4666-baf6-57022742671f@intel.com>
Date: Mon, 22 Jul 2024 14:35:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] lib/igt_kms: Added library functions for LOBF status
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com
References: <20240722075048.2616411-2-jeevan.b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240722075048.2616411-2-jeevan.b@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------GiwskgaKaNiViOvlTiSBm7CG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jeevan

On 7/22/2024 1:20 PM, Jeevan B wrote:
> Added helper functions to check LOBF status to check weather
> it is enabled or disabled.
>
> v2: rename function name.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 23 +++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 24 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 64318ef7f..e030b35a6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6071,6 +6071,29 @@ void igt_dump_crtcs_fd(int drmfd)
>   	drmModeFreeResources(mode_resources);
>   }
>   
> +/**
> + * igt_get_i915_edp_lobf_status
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Return: True if its enabled.
> + */
> +bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
> +{
> +	char buf[24];
> +	int fd, res;
> +
> +	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);

Do we have any constraints for i915_edp_lobf_inf, like platform etc etc? 
If so lets have has_i915_edp_lobf_infoso we can skip instead of asserting.

Apart from that, LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> +
> +	res = igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf));
> +	igt_require(res > 0);
> +
> +	close(fd);
> +
> +	return strstr(buf, "LOBF status: enabled");
> +}
> +
>   /**
>    * igt_get_output_max_bpc:
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 501d48763..e8582a45b 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1195,6 +1195,7 @@ void igt_require_pipe(igt_display_t *display,
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> +bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>   void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
--------------GiwskgaKaNiViOvlTiSBm7CG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Jeevan<br>
    </p>
    <div class="moz-cite-prefix">On 7/22/2024 1:20 PM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Added helper functions to check LOBF status to check weather
it is enabled or disabled.

v2: rename function name.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 64318ef7f..e030b35a6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6071,6 +6071,29 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
+/**
+ * igt_get_i915_edp_lobf_status
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Return: True if its enabled.
+ */
+bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
+{
+	char buf[24];
+	int fd, res;
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert(fd &gt;= 0);</pre>
    </blockquote>
    <pre class="moz-quote-pre" wrap=""></pre>
    Do we have any constraints for <span style="white-space: pre-wrap">i915_edp_lobf_inf, like platform etc etc?
If so lets have has_</span><span style="white-space: pre-wrap">i915_edp_lobf_info</span>so
    we can skip instead of asserting.<br>
    <br>
    Apart from that, LGTM<br>
    Reviewed-by: Kunal Joshi <a class="moz-txt-link-rfc2396E" href="mailto:kunal1.joshi@intel.com">&lt;kunal1.joshi@intel.com&gt;</a>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">
+
+	res = igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf));
+	igt_require(res &gt; 0);
+
+	close(fd);
+
+	return strstr(buf, "LOBF status: enabled");
+}
+
 /**
  * igt_get_output_max_bpc:
  * @drmfd: A drm file descriptor
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 501d48763..e8582a45b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1195,6 +1195,7 @@ void igt_require_pipe(igt_display_t *display,
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
</pre>
    </blockquote>
  </body>
</html>

--------------GiwskgaKaNiViOvlTiSBm7CG--
