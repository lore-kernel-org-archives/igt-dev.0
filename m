Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA22C3DA42
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 04:45:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6112610E8D8;
	Wed, 17 Jul 2024 04:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLJm1rLx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F1EE10E8E7
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 04:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721191542; x=1752727542;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=D+XdaVgefc0l5v3ZQugBmq+79TZWi/U7Sw3X4gKNp6A=;
 b=PLJm1rLx9M+iDftCAcP9InsZjLywcvApV8JTp7gLIqNKd7fG9aO+Ud4x
 0OT+1xmRQX/guIkVdkhkWGq2bZ4ZfwLlANmbYv5y+4+o7ZiuKa7M/JfGB
 N+Zl56F9jctVSkfPMhSTcI8KHPSK09EKyPeb5H7WKgv5Ps2R0g3uaSvWo
 kgHomIbrtnEV8m4EU++E2LXs/XTAcQ7B4r3dpWunJ89YBb5Kab6lLKFKH
 xn0DHNZBwYGVAAaaD8LMlVw/0/uy3fmX92kKe4Sar6fFO65/ClJpkaMpk
 uDZ0WKk9I24+4++vdZJdKYtfphu0cJxUrvH8/GmF35M8Z1XqS+W6wn+Kh w==;
X-CSE-ConnectionGUID: FoB9F/UUS0uiesqOcehMdg==
X-CSE-MsgGUID: tiVCR1haQ8yv9AuSRZiA9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="29823940"
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208,217";a="29823940"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 21:45:37 -0700
X-CSE-ConnectionGUID: zDDcbC0NQPW4NDIupNHvIA==
X-CSE-MsgGUID: xOqoveAGRjKlb3hwVhhiXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,213,1716274800"; d="scan'208,217";a="50054458"
Received: from unknown (HELO [10.66.104.174]) ([10.66.104.174])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 21:45:35 -0700
Content-Type: multipart/alternative;
 boundary="------------ngtJxBy42Kj9y0uOaxltlwUO"
Message-ID: <b95d46cb-ef23-4ea7-a3c9-74a6234f2ee5@intel.com>
Date: Wed, 17 Jul 2024 10:15:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/2] lib/igt_kms: Added library functions for LOBF status
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com
References: <20240626191537.1507452-2-jeevan.b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240626191537.1507452-2-jeevan.b@intel.com>
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
--------------ngtJxBy42Kj9y0uOaxltlwUO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Jeevan,

On 6/27/2024 12:45 AM, Jeevan B wrote:
> Added helper functions to check LOBF status to check weather
> it is enabled or disabled.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   lib/igt_kms.c | 23 +++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 24 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 174bbe6c4..1f0243eb6 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6071,6 +6071,29 @@ void igt_dump_crtcs_fd(int drmfd)
>   	drmModeFreeResources(mode_resources);
>   }
>   
> +/**
> + * igt_get_i915_edp_lobf_info
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Return: True if its enabled.
> + */
> +bool igt_get_i915_edp_lobf_info(int drmfd, char *connector_name)
Small nitpick, can this be igt_get_i915_edp_lobf_status, since we are 
not reading other info. Also do we need to use aux wake alpm / aux less 
alpm status or that doesn't matter? Animesh any thoughts from you here? 
Thanks and Regards Kunal Joshi
> +{
> +	char buf[24];
> +	int fd, res;
> +
> +	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
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
> index 01604dac9..5b1591631 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1195,6 +1195,7 @@ void igt_require_pipe(igt_display_t *display,
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
> +bool igt_get_i915_edp_lobf_info(int drmfd, char *connector_name);
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>   void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
--------------ngtJxBy42Kj9y0uOaxltlwUO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Jeevan,<br>
    </p>
    <div class="moz-cite-prefix">On 6/27/2024 12:45 AM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">Added helper functions to check LOBF status to check weather
it is enabled or disabled.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 lib/igt_kms.c | 23 +++++++++++++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 174bbe6c4..1f0243eb6 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6071,6 +6071,29 @@ void igt_dump_crtcs_fd(int drmfd)
 	drmModeFreeResources(mode_resources);
 }
 
+/**
+ * igt_get_i915_edp_lobf_info
+ * @drmfd: A drm file descriptor
+ * @connector_name: Name of the libdrm connector we're going to use
+ *
+ * Return: True if its enabled.
+ */
+bool igt_get_i915_edp_lobf_info(int drmfd, char *connector_name)</pre>
    </blockquote>
    Small nitpick, can this be <span style="white-space: pre-wrap">igt_get_i915_edp_lobf_status, since we are not reading other info.

Also do we need to use aux wake alpm / aux less alpm status or that doesn't matter?
Animesh any thoughts from you here?

Thanks and Regards
Kunal Joshi
</span>
    <blockquote type="cite">
      <pre class="moz-quote-pre" wrap="">
+{
+	char buf[24];
+	int fd, res;
+
+	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
+	igt_assert(fd &gt;= 0);
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
index 01604dac9..5b1591631 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1195,6 +1195,7 @@ void igt_require_pipe(igt_display_t *display,
 void igt_dump_connectors_fd(int drmfd);
 void igt_dump_crtcs_fd(int drmfd);
 bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
+bool igt_get_i915_edp_lobf_info(int drmfd, char *connector_name);
 unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
 unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
 void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
</pre>
    </blockquote>
  </body>
</html>

--------------ngtJxBy42Kj9y0uOaxltlwUO--
