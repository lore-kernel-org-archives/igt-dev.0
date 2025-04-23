Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F61C369CB
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 12:23:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB9F10E1C5;
	Wed, 23 Apr 2025 12:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d0qrPZXy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB24F10E1C5
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745411022; x=1776947022;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=baokpCmPNe7gXAADc0RAapI4EIP1HvIAiwBfyYgU6pI=;
 b=d0qrPZXy3NYKvVd90RenPK9tcCt74A8k8o21p9qWiYO2k4XqagE477R7
 DVr20tjwcw7txd01UKA8FTvx7kuUgIfhbbt92+fqBm5u273naDL/WAVLM
 Ql4SioMm2rB2GCS3jLw5ByAoQYQLfeo8tZA5mN6wyK6JbQnsL0ixmk+pB
 CEsQ4nJMJbscm4T7YEOmHThvYByZdgkPhp3bXG/dbfB/zvtweKJph3Lyy
 R1WdUJ0zkX3/gA3y9E1XvXtQZgh3iq0npIZJSY8+aKNiHSwOiVh8stkMJ
 CYv+g5EfuICL39T8agwS16k+MyrSAjIcXZLUe8ekMed3VJqEIbAA59rsz w==;
X-CSE-ConnectionGUID: KX/mASsOSjuBZ5DrFSUO9A==
X-CSE-MsgGUID: pJpKB1rbQCeMuepUzEVwTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50800292"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208,217";a="50800292"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 05:23:41 -0700
X-CSE-ConnectionGUID: 2o4xcLrtR1imv9cz1Wf1Zw==
X-CSE-MsgGUID: z8JEMlgZT4S6ay3pKDujeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
 d="scan'208,217";a="137376951"
Received: from rishavra-mobl.gar.corp.intel.com (HELO [10.247.252.246])
 ([10.247.252.246])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 05:23:38 -0700
Content-Type: multipart/alternative;
 boundary="------------zCAegVr8YQKVVcu0RsY2DueK"
Message-ID: <ec6a0143-dae2-4d3f-a889-717188347c45@intel.com>
Date: Wed, 23 Apr 2025 17:53:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,4/5] tests/kms: Add parse_bitmask support for user
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com
References: <20250401092015.818465-5-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250401092015.818465-5-pranay.samala@intel.com>
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
--------------zCAegVr8YQKVVcu0RsY2DueK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Pranay,

The new command-line option isn’t necessary. Anyone running a single 
test can already change the DRM debug mask on the fly with

echo 0x… > /sys/module/drm/parameters/debug

For CI jobs—where disk space is tight—add an environment variable such 
as |IGT_CI_RUN=1|.
Test cases known to exceed the predefined CI log limits should switch 
from the default verbose mask provided in boot parameters (for example 
|0x1E|) to a lighter mask that still captures the essentials logs.

Also have different masks documented somewhere so others also can do for 
the tests they are looking after.
Bit 0  (0x01) CORE      – DRM core paths
Bit 1  (0x02) DRIVER    – driver-specific code
Bit 2  (0x04) KMS       – modesetting
Bit 3  (0x08) PRIME     – dma-buf sharing
Bit 4  (0x10) ATOMIC    – atomic commits
Bit 5  (0x20) VBLANK    – vblank handling
Bit 7  (0x80) LEASE     – leasing infrastructure
Bit 8  (0x100) DP       – DisplayPort plumbing

Thanks and Regards
Kunal Joshi

On 01-04-2025 14:50, Pranay Samala wrote:
> The user can dynamically provide a mask during execution, giving them
> more control over the debug mask. This is useful in scenarios where
> different masks are needed for different tests or configurations without
> modifying the code itself.
>
> If the user does not provide a mask, the system defaults to 0x04. This
> ensures that the test can still run without requiring any extra input.
>
> Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
> Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
> Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 37 +++++++++++++++++++------
>   tests/kms_atomic_transition.c           | 24 ++++++++--------
>   tests/kms_cursor_legacy.c               | 37 ++++++++++++++++++-------
>   3 files changed, 68 insertions(+), 30 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..a6f7b586f 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -608,12 +608,33 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
>   	return ran;
>   }
>   
> -igt_main
> +static unsigned int parse_bitmask;
> +static unsigned int def_mask = 0x4;
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'b':
> +		parse_bitmask = strtoul(optarg, NULL, 16);
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "bitmask", .has_arg = true, .val = 'b', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
> +
> +igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   {
>   	data_t data = {};
>   
>   	igt_fixture {
> -		int dir, current_log_level;
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
>   						     DRIVER_XE);
>   		kmstest_set_vt_graphics_mode();
> @@ -621,14 +642,12 @@ igt_main
>   		igt_display_require_output(&data.display);
>   		for_each_pipe(&data.display, data.pipe)
>   			data.n_pipes++;
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
>   
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		if (parse_bitmask)
> +			igt_drm_debug_mask_update(parse_bitmask);
> +		else
> +			igt_drm_debug_mask_update(def_mask);
> +
>   		/*
>   		 * Some environments may have environment
>   		 * variable set to ignore long hpd, disable it for this test
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 2b64424ce..a92edc2b1 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1096,6 +1096,9 @@ static bool pipe_output_combo_valid(igt_display_t *display,
>   	return ret;
>   }
>   
> +static unsigned int parse_bitmask;
> +static unsigned int def_mask = 0x4;
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -1104,6 +1107,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   	case 'e':
>   		data->extended = true;
>   		break;
> +	case 'b':
> +		parse_bitmask = strtoul(optarg, NULL, 16);
> +		break;
>   	}
>   
>   	return IGT_OPT_HANDLER_SUCCESS;
> @@ -1111,11 +1117,13 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   
>   static const struct option long_opts[] = {
>   	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{ .name = "bitmask", .has_arg = true, .val = 'b', },
>   	{}
>   };

>   
>   static const char help_str[] =
> -	"  --extended\t\tRun the extended tests\n";
> +	"  --extended\t\tRun the extended tests\n"
> +	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
>   
>   static data_t data;
>   
> @@ -1174,8 +1182,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	int pipe_count = 0;
>   
>   	igt_fixture {
> -		int dir, current_log_level;
> -
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
>   		kmstest_set_vt_graphics_mode();
> @@ -1188,14 +1194,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		for_each_connected_output(&data.display, output)
>   			count++;
>   
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		if (parse_bitmask)
> +			igt_drm_debug_mask_update(parse_bitmask);
> +		else
> +			igt_drm_debug_mask_update(def_mask);
>   	}
>   
>   	igt_describe("Check toggling of primary plane with vblank");
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 44f031e7b..09d511935 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1823,7 +1823,29 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
>   	igt_remove_fb(display->drm_fd, &cursor_fb);
>   }
>   
> -igt_main
> +static unsigned int parse_bitmask;
> +static unsigned int def_mask = 0x4;
> +
> +static int opt_handler(int opt, int opt_index, void *_data)
> +{
> +	switch (opt) {
> +	case 'b':
> +		parse_bitmask = strtoul(optarg, NULL, 16);
> +		break;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "bitmask", .has_arg = true, .val = 'b', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
> +
> +igt_main_args("", long_opts, help_str, opt_handler, NULL)
>   {
>   	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
>   	igt_display_t display = { .drm_fd = -1 };
> @@ -1839,7 +1861,6 @@ igt_main
>   	};
>   
>   	igt_fixture {
> -		int dir, current_log_level;
>   		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -1851,14 +1872,10 @@ igt_main
>   		 */
>   		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>   
> -		dir = igt_sysfs_drm_module_params_open();
> -		if (dir >= 0) {
> -			current_log_level = igt_drm_debug_level_get(dir);
> -			close(dir);
> -
> -			if (current_log_level > 10)
> -				igt_drm_debug_level_update(10);
> -		}
> +		if (parse_bitmask)
> +			igt_drm_debug_mask_update(parse_bitmask);
> +		else
> +			igt_drm_debug_mask_update(def_mask);
>   	}
>   
>   	igt_describe("Test checks how many cursor updates we can fit between vblanks "
--------------zCAegVr8YQKVVcu0RsY2DueK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hello Pranay,<br>
      <br>
      The new command-line option isn’t necessary. Anyone running a
      single test can already change the DRM debug mask on the fly with<br>
    </p>
    <p>echo 0x… &gt; /sys/module/drm/parameters/debug<br>
      <br>
      For CI jobs—where disk space is tight—add an environment variable
      such as <code data-start="296" data-end="311">IGT_CI_RUN=1</code>.<br>
      Test cases known to exceed the predefined CI log limits should
      switch from the default verbose mask provided in boot parameters
      (for example <code data-start="403" data-end="409">0x1E</code>)
      to a lighter mask that still captures the essentials logs.<br>
      <br>
      Also have different masks documented somewhere so others also can
      do for the tests they are looking after.<br>
      Bit 0  (0x01) CORE      – DRM core paths<br>
      Bit 1  (0x02) DRIVER    – driver-specific code<br>
      Bit 2  (0x04) KMS       – modesetting<br>
      Bit 3  (0x08) PRIME     – dma-buf sharing<br>
      Bit 4  (0x10) ATOMIC    – atomic commits<br>
      Bit 5  (0x20) VBLANK    – vblank handling<br>
      Bit 7  (0x80) LEASE     – leasing infrastructure<br>
      Bit 8  (0x100) DP       – DisplayPort plumbing<br>
      <br>
      Thanks and Regards<br>
      Kunal Joshi</p>
    <div class="moz-cite-prefix">On 01-04-2025 14:50, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">The user can dynamically provide a mask during execution, giving them
more control over the debug mask. This is useful in scenarios where
different masks are needed for different tests or configurations without
modifying the code itself.

If the user does not provide a mask, the system defaults to 0x04. This
ensures that the test can still run without requiring any extra input.

Fixes: a2ab0ec12ef4 ("tests/kms_atomic_transition: Reducing debug loglevel dynamically")
Fixes: 4baeb7397d71 ("tests/intel/kms_dp_linktrain_fallback: Reduce debug loglevel dynamically")
Fixes: 7a8a3744466f ("tests/kms_cursor_legacy: Reduce debug loglevel dynamically")
Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/intel/kms_dp_linktrain_fallback.c | 37 +++++++++++++++++++------
 tests/kms_atomic_transition.c           | 24 ++++++++--------
 tests/kms_cursor_legacy.c               | 37 ++++++++++++++++++-------
 3 files changed, 68 insertions(+), 30 deletions(-)

diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 6a872efd2..a6f7b586f 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -608,12 +608,33 @@ static bool run_dsc_sst_fallaback_test(data_t *data)
 	return ran;
 }
 
-igt_main
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "bitmask", .has_arg = true, .val = 'b', },
+	{}
+};
+
+static const char help_str[] =
+	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
+
+igt_main_args("", long_opts, help_str, opt_handler, NULL)
 {
 	data_t data = {};
 
 	igt_fixture {
-		int dir, current_log_level;
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
 						     DRIVER_XE);
 		kmstest_set_vt_graphics_mode();
@@ -621,14 +642,12 @@ igt_main
 		igt_display_require_output(&amp;data.display);
 		for_each_pipe(&amp;data.display, data.pipe)
 			data.n_pipes++;
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir &gt;= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
 
-			if (current_log_level &gt; 10)
-				igt_drm_debug_level_update(10);
-		}
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
+
 		/*
 		 * Some environments may have environment
 		 * variable set to ignore long hpd, disable it for this test
diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 2b64424ce..a92edc2b1 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1096,6 +1096,9 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1104,6 +1107,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'e':
 		data-&gt;extended = true;
 		break;
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
 	}
 
 	return IGT_OPT_HANDLER_SUCCESS;
@@ -1111,11 +1117,13 @@ static int opt_handler(int opt, int opt_index, void *_data)
 
 static const struct option long_opts[] = {
 	{ .name = "extended", .has_arg = false, .val = 'e', },
+	{ .name = "bitmask", .has_arg = true, .val = 'b', },
 	{}
 };</pre>
    </blockquote>
    <br>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
 
 static const char help_str[] =
-	"  --extended\t\tRun the extended tests\n";
+	"  --extended\t\tRun the extended tests\n"
+	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
 
 static data_t data;
 
@@ -1174,8 +1182,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &amp;data)
 	int pipe_count = 0;
 
 	igt_fixture {
-		int dir, current_log_level;
-
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		kmstest_set_vt_graphics_mode();
@@ -1188,14 +1194,10 @@ igt_main_args("", long_opts, help_str, opt_handler, &amp;data)
 		for_each_connected_output(&amp;data.display, output)
 			count++;
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir &gt;= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level &gt; 10)
-				igt_drm_debug_level_update(10);
-		}
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
 	}
 
 	igt_describe("Check toggling of primary plane with vblank");
diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 44f031e7b..09d511935 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1823,7 +1823,29 @@ static void modeset_atomic_cursor_hotspot(igt_display_t *display)
 	igt_remove_fb(display-&gt;drm_fd, &amp;cursor_fb);
 }
 
-igt_main
+static unsigned int parse_bitmask;
+static unsigned int def_mask = 0x4;
+
+static int opt_handler(int opt, int opt_index, void *_data)
+{
+	switch (opt) {
+	case 'b':
+		parse_bitmask = strtoul(optarg, NULL, 16);
+		break;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = "bitmask", .has_arg = true, .val = 'b', },
+	{}
+};
+
+static const char help_str[] =
+	"  --bitmask\t\tSpecify a bitmask in hexadecimal\n";
+
+igt_main_args("", long_opts, help_str, opt_handler, NULL)
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	igt_display_t display = { .drm_fd = -1 };
@@ -1839,7 +1861,6 @@ igt_main
 	};
 
 	igt_fixture {
-		int dir, current_log_level;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
@@ -1851,14 +1872,10 @@ igt_main
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
 
-		dir = igt_sysfs_drm_module_params_open();
-		if (dir &gt;= 0) {
-			current_log_level = igt_drm_debug_level_get(dir);
-			close(dir);
-
-			if (current_log_level &gt; 10)
-				igt_drm_debug_level_update(10);
-		}
+		if (parse_bitmask)
+			igt_drm_debug_mask_update(parse_bitmask);
+		else
+			igt_drm_debug_mask_update(def_mask);
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
</pre>
    </blockquote>
  </body>
</html>

--------------zCAegVr8YQKVVcu0RsY2DueK--
