Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABFDC369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 11:56:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144DC10E0B0;
	Wed, 23 Apr 2025 11:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0aTSjAZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4750B10E0B0
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745409392; x=1776945392;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=L+zStUxXSBDk29yrtEhvtQaFT9U+cxnYVxcdwWz1VEg=;
 b=R0aTSjAZoLkE9BEH/+VIOCiQ1He+6JPDCypSa56ndtmRKvplKkw9ww2h
 WIT+gJElIxOxRi/z4FuNjTYt99NMJGmE/V//sFuch+92rU1IagiKlRgJZ
 MRlLq38J+YO7eqgEy7PGyTqQigrUBdymtUXPy0o+/3WIhAMdCVnfuUulg
 hTu0hIcPNmmxK4giq0amd2b861q5pFn+tmkFlwM6m1ROM59BHl34uYmke
 WYx/S7ZxAPHLZHnMR/LLBPIOCwjc64ZGwrjaTmko39EuQLrpYT/dcR640
 eFXHihVr6g8KmV0rcM4wKT5RWuig8EuNxZuZTrtsdCJZVbyjuWbyi9md5 Q==;
X-CSE-ConnectionGUID: fQoQnq+dTW+UAJOmUXH+XA==
X-CSE-MsgGUID: FmZhYbhkT2+87NGqx3RgCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="34613450"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208,217";a="34613450"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:56:32 -0700
X-CSE-ConnectionGUID: ZNYa7OQ8SPus7MsdKiuDyw==
X-CSE-MsgGUID: lPeSlIhEQxK02acgeKFiPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
 d="scan'208,217";a="132830012"
Received: from nniranja-mobl2.gar.corp.intel.com (HELO [10.247.208.41])
 ([10.247.208.41])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:56:30 -0700
Content-Type: multipart/alternative;
 boundary="------------TY8JOa6GyOLxKDz0Hjs8ZyiJ"
Message-ID: <f520c35d-060f-49fb-a035-a6b7ace4ae3d@intel.com>
Date: Wed, 23 Apr 2025 17:26:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,2/5] lib/igt_sysfs: Rename debug level APIs/variables
 to debug mask
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com
References: <20250401092015.818465-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250401092015.818465-3-pranay.samala@intel.com>
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
--------------TY8JOa6GyOLxKDz0Hjs8ZyiJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Pranay,

Please find comments inline,

On 01-04-2025 14:50, Pranay Samala wrote:
> The debug log mask is a mask rather than level. Rename each level
> occurance to mask.
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 32 ++++++++++++++++----------------
>   lib/igt_sysfs.h |  6 +++---
>   2 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 9643aab43..e6058a1dd 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -446,15 +446,15 @@ int igt_sysfs_drm_module_params_open(void)
>   static int original_debug_mask = -1;
>   
>   /**
> - * igt_drm_debug_level_get:
> + * igt_drm_debug_mask_get:
>    *
> - * This reads the current debug log level of the machine on
> + * This reads the current debug mask of the machine on
>    * which the test is currently executing.
>    *
>    * Returns:
> - * The current log level, or -1 on error.
> + * The current debug mask, or -1 on error.
>    */
> -int igt_drm_debug_level_get(int dir)
> +int igt_drm_debug_mask_get(int dir)
>   {
>   	char buf[20];
>   
> @@ -468,13 +468,13 @@ int igt_drm_debug_level_get(int dir)
>   }
>   
>   /**
> - * igt_drm_debug_level_reset:
> + * igt_drm_debug_mask_reset:
>    *
> - * This modifies the current debug log level of the machine
> + * This modifies the current debug mask of the machine
>    * to the default value post-test.
>    *
>    */
> -void igt_drm_debug_level_reset(void)
> +void igt_drm_debug_mask_reset(void)
>   {
>   	char buf[20];
>   	int dir;
> @@ -486,25 +486,25 @@ void igt_drm_debug_level_reset(void)
>   	if (dir < 0)
>   		return;
>   
> -	igt_debug("Resetting DRM debug level to %d\n", original_debug_mask);
> +	igt_debug("Resetting DRM debug mask to %d\n", original_debug_mask);
>   	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
>   }
>   
> -static void igt_drm_debug_level_reset_exit_handler(int sig)
> +static void igt_drm_debug_mask_reset_exit_handler(int sig)
>   {
> -	igt_drm_debug_level_reset();
> +	igt_drm_debug_mask_reset();
>   }
>   
>   /**
> - * igt_drm_debug_level_update:
> - * @debug_level: new debug level to set
> + * igt_drm_debug_mask_update:
> + * @debug_level: new debug mask to set
Rename to mask,
>    *
> - * This modifies the current drm debug log level to the new value.
> + * This modifies the current drm debug mask to the new value.
>    */
> -void igt_drm_debug_level_update(unsigned int new_log_level)
> +void igt_drm_debug_mask_update(unsigned int new_log_level)
Rename new_log_level to |new_debug_mask| or |requested_debug_mask|
>   {
>   	char buf[20];
>   	int dir;
> @@ -513,13 +513,13 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>   	if (dir < 0)
>   		return;
>   
> -	original_debug_mask = igt_drm_debug_level_get(dir);
> +	original_debug_mask = igt_drm_debug_mask_get(dir);
>   	if (original_debug_mask < 0) {
>   		close(dir);
>   		return;
>   	}
>   
> -	igt_debug("Setting DRM debug level to %d\n", new_log_level);
> +	igt_debug("Setting DRM debug mask to %d\n", new_log_level);
>   	snprintf(buf, sizeof(buf), "%d", new_log_level);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
> index 86345f3d1..2f4d25bf6 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -143,9 +143,9 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
>   void bind_fbcon(bool enable);
>   void fbcon_blink_enable(bool enable);
>   
> -void igt_drm_debug_level_update(unsigned int new_log_level);
> -void igt_drm_debug_level_reset(void);
> -int igt_drm_debug_level_get(int dir);
> +void igt_drm_debug_mask_update(unsigned int new_log_level);
> +void igt_drm_debug_mask_reset(void);
> +int igt_drm_debug_mask_get(int dir);
>   int igt_sysfs_drm_module_params_open(void);
>   
>   /**
--------------TY8JOa6GyOLxKDz0Hjs8ZyiJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Pranay,<br>
      <br>
      Please find comments inline,</p>
    <div class="moz-cite-prefix">On 01-04-2025 14:50, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">The debug log mask is a mask rather than level. Rename each level
occurance to mask.

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 lib/igt_sysfs.c | 32 ++++++++++++++++----------------
 lib/igt_sysfs.h |  6 +++---
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9643aab43..e6058a1dd 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -446,15 +446,15 @@ int igt_sysfs_drm_module_params_open(void)
 static int original_debug_mask = -1;
 
 /**
- * igt_drm_debug_level_get:
+ * igt_drm_debug_mask_get:
  *
- * This reads the current debug log level of the machine on
+ * This reads the current debug mask of the machine on
  * which the test is currently executing.
  *
  * Returns:
- * The current log level, or -1 on error.
+ * The current debug mask, or -1 on error.
  */
-int igt_drm_debug_level_get(int dir)
+int igt_drm_debug_mask_get(int dir)
 {
 	char buf[20];
 
@@ -468,13 +468,13 @@ int igt_drm_debug_level_get(int dir)
 }
 
 /**
- * igt_drm_debug_level_reset:
+ * igt_drm_debug_mask_reset:
  *
- * This modifies the current debug log level of the machine
+ * This modifies the current debug mask of the machine
  * to the default value post-test.
  *
  */
-void igt_drm_debug_level_reset(void)
+void igt_drm_debug_mask_reset(void)
 {
 	char buf[20];
 	int dir;
@@ -486,25 +486,25 @@ void igt_drm_debug_level_reset(void)
 	if (dir &lt; 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", original_debug_mask);
+	igt_debug("Resetting DRM debug mask to %d\n", original_debug_mask);
 	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
 }
 
-static void igt_drm_debug_level_reset_exit_handler(int sig)
+static void igt_drm_debug_mask_reset_exit_handler(int sig)
 {
-	igt_drm_debug_level_reset();
+	igt_drm_debug_mask_reset();
 }
 
 /**
- * igt_drm_debug_level_update:
- * @debug_level: new debug level to set
+ * igt_drm_debug_mask_update:
+ * @debug_level: new debug mask to set</pre>
    </blockquote>
    Rename to mask,
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
  *
- * This modifies the current drm debug log level to the new value.
+ * This modifies the current drm debug mask to the new value.
  */
-void igt_drm_debug_level_update(unsigned int new_log_level)
+void igt_drm_debug_mask_update(unsigned int new_log_level)</pre>
    </blockquote>
    Rename new_log_level to <code data-start="12431" data-end="12453">new_debug_mask</code>
    or <code data-start="12431" data-end="12453">requested_debug_mask</code>
    <br>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
 {
 	char buf[20];
 	int dir;
@@ -513,13 +513,13 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir &lt; 0)
 		return;
 
-	original_debug_mask = igt_drm_debug_level_get(dir);
+	original_debug_mask = igt_drm_debug_mask_get(dir);
 	if (original_debug_mask &lt; 0) {
 		close(dir);
 		return;
 	}
 
-	igt_debug("Setting DRM debug level to %d\n", new_log_level);
+	igt_debug("Setting DRM debug mask to %d\n", new_log_level);
 	snprintf(buf, sizeof(buf), "%d", new_log_level);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h
index 86345f3d1..2f4d25bf6 100644
--- a/lib/igt_sysfs.h
+++ b/lib/igt_sysfs.h
@@ -143,9 +143,9 @@ void igt_sysfs_set_boolean(int dir, const char *attr, bool value);
 void bind_fbcon(bool enable);
 void fbcon_blink_enable(bool enable);
 
-void igt_drm_debug_level_update(unsigned int new_log_level);
-void igt_drm_debug_level_reset(void);
-int igt_drm_debug_level_get(int dir);
+void igt_drm_debug_mask_update(unsigned int new_log_level);
+void igt_drm_debug_mask_reset(void);
+int igt_drm_debug_mask_get(int dir);
 int igt_sysfs_drm_module_params_open(void);
 
 /**
</pre>
    </blockquote>
  </body>
</html>

--------------TY8JOa6GyOLxKDz0Hjs8ZyiJ--
