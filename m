Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF3FC369D7
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 11:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDE610E085;
	Wed, 23 Apr 2025 11:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YRS6F9X8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84710E085
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745409003; x=1776945003;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=5kVcH2AITvx20p1KuCfieruZDsYqkcKDlBOggG7SLeI=;
 b=YRS6F9X8gC4ASUo5riODppYX/UJy3ndLbpDTwKOFf2nwscvmKsL7t9nu
 B1YYS2GHTgVGvAuR89QYgAQJvoi5vcxBS4kSTU5zWkeSYpvArTBqSp3uH
 6UqJGdbVHbfof4bF6i3odwqXTiLgmi6jtTofqS5Qutr0MBrwoEqxxd5kr
 PzS+R79EXHOWDm2opJfxsugPWvWa/M6PdP4se2nIqF7lxhHhISkB7Ux30
 XLf9tEBm8itSH/ORMbk9W9t6JObw7Z3v/vyIVqnPNye61Z/79yrepV6bf
 LwOLh5AJL19xmBBjykZi5FoLziwSTAkii/zWcUaCpXmeeRsomQHrtz9IG g==;
X-CSE-ConnectionGUID: U+f6BXCLRk+8ZFDhwTeAmA==
X-CSE-MsgGUID: 5BYJgr73Sg21qQbMGQ7zgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="64408498"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208,217";a="64408498"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:50:03 -0700
X-CSE-ConnectionGUID: KwkQZ5t3S5yr3pxaCjDnwA==
X-CSE-MsgGUID: +5D4H5VERVaC5eCdE33luA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
 d="scan'208,217";a="137284396"
Received: from nniranja-mobl2.gar.corp.intel.com (HELO [10.247.208.41])
 ([10.247.208.41])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 04:50:00 -0700
Content-Type: multipart/alternative;
 boundary="------------tF56M2TLnntoRBt7qV64hnv2"
Message-ID: <6c33666f-8d7d-4ec1-8f08-ebc671960c8c@intel.com>
Date: Wed, 23 Apr 2025 17:19:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,1/5] lib/igt_sysfs: Usage of Original debug mask to
 read/reset
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com
References: <20250401092015.818465-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250401092015.818465-2-pranay.samala@intel.com>
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
--------------tF56M2TLnntoRBt7qV64hnv2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Pranay,

Please find comments inline,

On 01-04-2025 14:50, Pranay Samala wrote:
> Original debug mask holds the mask before the test and will be
> used to reset the debug mask post test.
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2e4c2ee63..9643aab43 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
>   	return open(path, O_RDONLY);
>   }
>   
> -static int log_level = -1;
> +static int original_debug_mask = -1;
>   
>   /**
>    * igt_drm_debug_level_get:
> @@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
>   {
>   	char buf[20];
>   
> -	if (log_level >= 0)
> -		return log_level;
> +	if (original_debug_mask >= 0)
> +		return original_debug_mask;
Rename original_debug_mask to saved_drm_debug_mask for clarity that it's 
saved to be restored later.
>   
>   	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
>   		return -1;
> @@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
>   	char buf[20];
>   	int dir;
>   
> -	if (log_level < 0)
> +	if (original_debug_mask < 0)
>   		return;
>   
>   	dir = igt_sysfs_drm_module_params_open();
>   	if (dir < 0)
>   		return;
>   
> -	igt_debug("Resetting DRM debug level to %d\n", log_level);
> -	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_debug("Resetting DRM debug level to %d\n", original_debug_mask);

Change level to mask in igt_info


Thanks and Regards
Kunal Joshi

> +	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
> @@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>   	if (dir < 0)
>   		return;
>   
> -	log_level = igt_drm_debug_level_get(dir);
> -	if (log_level < 0) {
> +	original_debug_mask = igt_drm_debug_level_get(dir);
> +	if (original_debug_mask < 0) {
>   		close(dir);
>   		return;
>   	}
--------------tF56M2TLnntoRBt7qV64hnv2
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
      <pre wrap="" class="moz-quote-pre">Original debug mask holds the mask before the test and will be
used to reset the debug mask post test.

Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 lib/igt_sysfs.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2e4c2ee63..9643aab43 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
 	return open(path, O_RDONLY);
 }
 
-static int log_level = -1;
+static int original_debug_mask = -1;
 
 /**
  * igt_drm_debug_level_get:
@@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
 {
 	char buf[20];
 
-	if (log_level &gt;= 0)
-		return log_level;
+	if (original_debug_mask &gt;= 0)
+		return original_debug_mask;</pre>
    </blockquote>
    Rename <span style="white-space: pre-wrap">original_debug_mask to <span
    style="white-space: normal">saved_drm_debug_mask for clarity that it's saved to be restored later.</span></span>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
 
 	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) &lt; 0)
 		return -1;
@@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
 	char buf[20];
 	int dir;
 
-	if (log_level &lt; 0)
+	if (original_debug_mask &lt; 0)
 		return;
 
 	dir = igt_sysfs_drm_module_params_open();
 	if (dir &lt; 0)
 		return;
 
-	igt_debug("Resetting DRM debug level to %d\n", log_level);
-	snprintf(buf, sizeof(buf), "%d", log_level);
+	igt_debug("Resetting DRM debug level to %d\n", original_debug_mask);</pre>
    </blockquote>
    <p>Change level to mask in igt_info</p>
    <p><br>
    </p>
    <p>Thanks and Regards<br>
      Kunal Joshi</p>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
+	snprintf(buf, sizeof(buf), "%d", original_debug_mask);
 	igt_assert(igt_sysfs_set(dir, "debug", buf));
 
 	close(dir);
@@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
 	if (dir &lt; 0)
 		return;
 
-	log_level = igt_drm_debug_level_get(dir);
-	if (log_level &lt; 0) {
+	original_debug_mask = igt_drm_debug_level_get(dir);
+	if (original_debug_mask &lt; 0) {
 		close(dir);
 		return;
 	}
</pre>
    </blockquote>
  </body>
</html>

--------------tF56M2TLnntoRBt7qV64hnv2--
