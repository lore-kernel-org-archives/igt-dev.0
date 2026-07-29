Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC70C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 13:38:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 475ED10E04D;
	Wed, 29 Jul 2026 13:38:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CtjQQ/2m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EFCE10E04F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 13:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785332263; x=1816868263;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0IHfHPv7uXKFicNAJAptw70OO9WQFfItKz7Y+8BLwqo=;
 b=CtjQQ/2mF/Rb9Fzw6ZfC8oAntzFMJxpokRL7FEP5kCJ92OrGdS7TsUxp
 sOUuxxV1dZX0if8R1qjuRK5wt5kgG4o1GV55xmFRJfzqXz4bhUjEPRXD4
 Mm1wvw/0Wg4CHYxPkSU2jNU4YtzyUTd/RNxw/YPmqKzKV6I6zz6NwIczT
 rLSru9oBTKTQwKI4821uzmX99Fy7MBoBjb3/cyJCi1XC54r43rHLNpJpG
 qlY2Iwg+9SU6rO0ke7PW9+1vHYnqm/h4jYv3LAxbIPlUG1pq8O0y37B8x
 AbuH5kXA5pb2u2f94pjumdhADk/c7yG5HUyqnx2F3tVZ9OIMaaBI/BexZ Q==;
X-CSE-ConnectionGUID: zGtKl4xRRA2MY/6q6rgzKg==
X-CSE-MsgGUID: AHMEwER6T7KfMMUJoIYegA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85883797"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="85883797"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 06:37:42 -0700
X-CSE-ConnectionGUID: s14lSE3VSa+Axw/Z4og9Fg==
X-CSE-MsgGUID: +vy2T3tgRVKUkVjNgXgojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="265046248"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 06:37:40 -0700
Date: Wed, 29 Jul 2026 15:37:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
Subject: Re: [PATCH i-g-t v4 30/31] lib/igt_core: move igt_load_igtrc to igt_rc
Message-ID: <20260729133722.qa26gf5iwzdkdlfg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 krzysztof.niemiec@intel.com
References: <cover.1785152675.git.sebastian.brzezinka@intel.com>
 <dc06fc3a7bbec6314046d0cc9f2294853beef539.1785152675.git.sebastian.brzezinka@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc06fc3a7bbec6314046d0cc9f2294853beef539.1785152675.git.sebastian.brzezinka@intel.com>
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
On 2026-07-27 at 15:22:58 +0200, Sebastian Brzezinka wrote:
> igt_load_igtrc() reads device configuration from the igtrc file and
> is used by igt_core, igt_chamelium(_stream), the runner and lsgpu.
> The associated global, igt_key_file, is already declared in lib/igt_rc.h,
> so move the loader implementation there too instead of igt_core.c.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/igt_core.c    | 47 -----------------------------------
>  lib/igt_core.h    |  2 --
>  lib/igt_rc.c      | 62 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_rc.h      |  2 ++
>  lib/meson.build   |  4 ++-
>  runner/executor.c |  1 +
>  6 files changed, 68 insertions(+), 50 deletions(-)
>  create mode 100644 lib/igt_rc.c

I applied 1...29, thank you all!

Btw this one patch didn't compile when I used:

git rebase origin -x ./compile.sh

I got an error:
168 |         GKeyFile *key_file = igt_load_igtrc();
    |                              ^~~~~~~~~~~~~~
../tools/lsgpu.c:168:30: warning: nested extern declaration of 'igt_load_igtrc' [-Wnested-externs]
../tools/lsgpu.c:168:30: error: initialization of 'GKeyFile *' {aka 'struct _GKeyFile *'} from 'int' makes pointer from integer without a cast [-Werror=int-conversion]
cc1: some warnings being treated as errors

git status
interactive rebase in progress; onto 2613ddf77
Last commands done (60 commands done):
	pick 393be03c9 # lib/igt_core: move igt_load_igtrc to igt_rc
	exec ./compile.sh
(see more in file .git/rebase-merge/done)
Next commands to do (2 remaining commands):
	pick f1ecd9dd0 # tools/lsgpu: link with minimal sub-libraries
	exec ./compile.sh
(use "git rebase --edit-todo" to view and edit)

Regards,
Kamil

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
> diff --git a/lib/igt_rc.c b/lib/igt_rc.c
> new file mode 100644
> index 000000000..b7f1731fe
> --- /dev/null
> +++ b/lib/igt_rc.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#ifndef ANDROID
> +#include <glib.h>
> +#else
> +#include "android/glib.h"
> +#endif
> +
> +#include "igt_rc.h"
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
> diff --git a/lib/igt_rc.h b/lib/igt_rc.h
> index d871b3b26..3b7179808 100644
> --- a/lib/igt_rc.h
> +++ b/lib/igt_rc.h
> @@ -33,4 +33,6 @@
>  
>  extern GKeyFile *igt_key_file;
>  
> +struct _GKeyFile *igt_load_igtrc(void);
> +
>  #endif /* IGT_RC_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index aa8eae68b..9bd484c98 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -37,6 +37,7 @@ lib_sources = [
>  	'igt_os.c',
>  	'igt_params.c',
>  	'igt_perf.c',
> +	'igt_rc.c',
>  	'igt_pipe_crc.c',
>  	'igt_power.c',
>  	'igt_primes.c',
> @@ -379,8 +380,9 @@ lib_igt_device_scan_build = static_library('igt_device_scan',
>  	'igt_map.c',
>  	'intel_device_info.c',
>  	'intel_cmds_info.c',
> +	'igt_rc.c',
>  	],
> -	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub],
> +	dependencies : [scan_dep, lib_igt_drm_stub, lib_igt_tools_stub, glib],
>  	include_directories : inc)
>  
>  lib_igt_device_scan = declare_dependency(link_with : lib_igt_device_scan_build,
> diff --git a/runner/executor.c b/runner/executor.c
> index a8907c575..1592feee2 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -36,6 +36,7 @@
>  #include "igt_aux.h"
>  #include "igt_core.h"
>  #include "igt_facts.h"
> +#include "igt_rc.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> -- 
> 2.53.0
> 
