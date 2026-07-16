Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAE7C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 14:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2BCB10E327;
	Thu, 16 Jul 2026 14:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJaa674W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E797210E327
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 14:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784211562; x=1815747562;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FSBdbKBl9VNE5mOwc3qp4Ex4LyzReX8jdOq9kvhzx3s=;
 b=BJaa674W87cc9PLeRutcmB4/YnnjZa0m6gH3vFrIaVH3+FmPN8AmmFPE
 GS+9FZjepOj9tT1TPmhEbitkkKYVMaVnjxUvm+Qz0jYJBYrEcHXBQiYa1
 KWimx4nEdC9bAhj7EO1QBfxkO5rPIRFWB+8JZLC1vF3QjYClpH7QI7u3i
 F4yeh2QIEJSeCoSY4inXsjkcm6nPLVwPl8zFTZ4hV1KlFVxzPuGvaRikS
 vjYwRGovES2oY+ZELKqVyUBvJVEQ+4KOB32QPpjbG3nEgx9VMfVqY5Vv0
 gnBKTT0uMyoqE+lUyycMfdWp6T34lR5Kbl6pmQ3dOWT+XhpDF24IeZM8X w==;
X-CSE-ConnectionGUID: NLJizoIaRKe745GIlQajyg==
X-CSE-MsgGUID: 71QCKFPfSyidxwt6luFJow==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84649676"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84649676"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 07:19:21 -0700
X-CSE-ConnectionGUID: l5Mq9UJVRqaANcA0QHdiwA==
X-CSE-MsgGUID: 3oZGpg/wSyi1m40Io+47WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="260327629"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 07:10:16 -0700
Date: Thu, 16 Jul 2026 16:08:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Mark Yacoub <markyacoub@google.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 30/31] lib/igt_core: move igt_load_igtrc to
 igt_device_scan
Message-ID: <20260716140853.66ulgagvtzvp5mkh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com, Mark Yacoub <markyacoub@google.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <db4400f05ba72613df363cc62496319a5c0fed9b.1784117512.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <db4400f05ba72613df363cc62496319a5c0fed9b.1784117512.git.sebastian.brzezinka@intel.com>
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

Hi Sebastian,
On 2026-07-15 at 14:15:40 +0200, Sebastian Brzezinka wrote:
> igt_load_igtrc() is used exclusively by igt_device_scan internals to read
> per-device configuration from the igtrc file.  Moving it from igt_core.c
> to igt_device_scan.c co-locates the function with its primary user and
> makes it possible for lsgpu to link against lib_igt_device_scan without
> needing the rest of libigt.
> 
> Update the declaration accordingly: remove from igt_core.h and add to
> igt_device_scan.h where the implementation now lives.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_core.c        | 47 ------------------------------------------
>  lib/igt_core.h        |  2 --
>  lib/igt_device_scan.c | 48 +++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_device_scan.h |  2 ++
>  runner/executor.c     |  1 +

If this is used by igt_runner, maybe more proper solution
would be to move it to separate lib/igt_igtrc.[c|h]?

Look also into https://patchwork.freedesktop.org/series/170509/
with reimplementation of reading INI files

+cc Mark Yacoub <markyacoub@google.com>

Regards,
Kamil

>  5 files changed, 51 insertions(+), 49 deletions(-)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index a7c097d9e..2f737b01a 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -972,53 +972,6 @@ static void oom_adjust_for_doom(void)
>  
>  }
>  
> -/**
> - * load_igtrc:
> - *
> - * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
> - * home directory if that is not set. The returned keyfile needs to be
> - * deallocated using g_key_file_free().
> - *
> - * Returns: Pointer to the keyfile, NULL on error.
> - */
> -GKeyFile *igt_load_igtrc(void)
> -{
> -	char *key_file_env = NULL;
> -	char *key_file_loc = NULL;
> -	GError *error = NULL;
> -	GKeyFile *file;
> -	int ret;
> -
> -	/* Determine igt config path */
> -	key_file_env = getenv("IGT_CONFIG_PATH");
> -	if (key_file_env) {
> -		key_file_loc = key_file_env;
> -	} else {
> -		key_file_loc = malloc(100);
> -		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
> -	}
> -
> -	/* Load igt config file */
> -	file = g_key_file_new();
> -	ret = g_key_file_load_from_file(file, key_file_loc,
> -					G_KEY_FILE_NONE, &error);
> -	if (!ret) {
> -		g_error_free(error);
> -		g_key_file_free(file);
> -		file = NULL;
> -
> -		goto out;
> -	}
> -
> -	g_clear_error(&error);
> -
> - out:
> -	if (!key_file_env && key_file_loc)
> -		free(key_file_loc);
> -
> -	return file;
> -}
> -
>  static void common_init_config(void)
>  {
>  	GError *error = NULL;
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 3337293bc..afaf35aa8 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -95,8 +95,6 @@ extern const char* __igt_test_description __attribute__((weak));
>  extern bool __igt_plain_output;
>  extern char *igt_frame_dump_path;
>  
> -struct _GKeyFile *igt_load_igtrc(void);
> -
>  /**
>   * IGT_TEST_DESCRIPTION:
>   * @str: description string
> diff --git a/lib/igt_device_scan.c b/lib/igt_device_scan.c
> index 7c7995224..a15a4624e 100644
> --- a/lib/igt_device_scan.c
> +++ b/lib/igt_device_scan.c
> @@ -33,6 +33,7 @@
>  #include <ctype.h>
>  #include <dirent.h>
>  #include <fcntl.h>
> +#include <glib.h>
>  #include <libudev.h>
>  #ifdef __linux__
>  #include <linux/limits.h>
> @@ -2477,3 +2478,50 @@ int igt_device_prepare_filtered_view(const char *vendor)
>  
>  	return gpu_count;
>  }
> +
> +/**
> + * igt_load_igtrc:
> + *
> + * Load .igtrc from the path pointed to by #IGT_CONFIG_PATH or from
> + * home directory if that is not set. The returned keyfile needs to be
> + * deallocated using g_key_file_free().
> + *
> + * Returns: Pointer to the keyfile, NULL on error.
> + */
> +GKeyFile *igt_load_igtrc(void)
> +{
> +	char *key_file_env = NULL;
> +	char *key_file_loc = NULL;
> +	GError *error = NULL;
> +	GKeyFile *file;
> +	int ret;
> +
> +	/* Determine igt config path */
> +	key_file_env = getenv("IGT_CONFIG_PATH");
> +	if (key_file_env) {
> +		key_file_loc = key_file_env;
> +	} else {
> +		key_file_loc = malloc(100);
> +		snprintf(key_file_loc, 100, "%s/.igtrc", g_get_home_dir());
> +	}
> +
> +	/* Load igt config file */
> +	file = g_key_file_new();
> +	ret = g_key_file_load_from_file(file, key_file_loc,
> +					G_KEY_FILE_NONE, &error);
> +	if (!ret) {
> +		g_error_free(error);
> +		g_key_file_free(file);
> +		file = NULL;
> +
> +		goto out;
> +	}
> +
> +	g_clear_error(&error);
> +
> + out:
> +	if (!key_file_env && key_file_loc)
> +		free(key_file_loc);
> +
> +	return file;
> +}
> diff --git a/lib/igt_device_scan.h b/lib/igt_device_scan.h
> index f24a193cd..5b04033e3 100644
> --- a/lib/igt_device_scan.h
> +++ b/lib/igt_device_scan.h
> @@ -103,4 +103,6 @@ int igt_open_render(struct igt_device_card *card);
>  /* Add or use filters to match multiGPU devices */
>  int igt_device_prepare_filtered_view(const char *vendor);
>  
> +struct _GKeyFile *igt_load_igtrc(void);
> +
>  #endif /* __IGT_DEVICE_SCAN_H__ */
> diff --git a/runner/executor.c b/runner/executor.c
> index a8907c575..a2cf517df 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -35,6 +35,7 @@
>  
>  #include "igt_aux.h"
>  #include "igt_core.h"
> +#include "igt_device_scan.h"
>  #include "igt_facts.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
> -- 
> 2.53.0
> 
