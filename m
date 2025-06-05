Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E13C5B559
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 10:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2016710E995;
	Thu,  5 Jun 2025 10:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GtHGMRKU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFB310E995
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749117647; x=1780653647;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Bzz1ngkYJGQ4c1HIsn//q+6zIFW4S1ef9vUGzmbK2i4=;
 b=GtHGMRKUkOdbXcgZOaQ5TjLHEtJzxoEGOZlhjktRc7oYqX0E88mK4eMU
 TW/lnv2QUgsXCYscvzuIcHXQ+kTXewFJzr6GRBea0N3TMSsL/7Y9RVbeM
 jEzG5QDpcsJXbFMCCWrTJpNc0FOS+ZSEcV2cPLPpzbCeYYdn6U3vOgVJW
 wuLCwwQMENKWFBGoFyGB0G4g9zFbqtY/DbdqYdzPkxrqvk0MOlr1L7kFC
 8RofEdthtjzTYoEK0GqAQVp4BciKdo6LoiMUZk47n0exYkND6Vz+tgX/w
 zpQGr7ZqyQUpMeAAlrdxfw1AV61NGbl+4WkZO9uXraVElF8qqDw8TDfgf Q==;
X-CSE-ConnectionGUID: iowHSBIlSsW4OeqVMfWvaA==
X-CSE-MsgGUID: yQJG1NkaRmaWtqX48Fanpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="61895034"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="61895034"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 03:00:42 -0700
X-CSE-ConnectionGUID: EvTSofAjTgSdfesgKLLAOA==
X-CSE-MsgGUID: YcsU60v9S+aimY+61Xn1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; d="scan'208";a="145359577"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 03:00:40 -0700
Date: Thu, 5 Jun 2025 12:00:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH v15 1/9] include/android: Add stub for glib
Message-ID: <20250605100024.pvjr3x735y6o2gut@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250604171656.31559-1-jeevaka.badrappan@intel.com>
 <20250604171656.31559-2-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250604171656.31559-2-jeevaka.badrappan@intel.com>
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

Hi Jeevaka,
On 2025-06-04 at 17:16:48 +0000, Jeevaka Prabu Badrappan wrote:
> From: Sapna Singh <sapna1.singh@intel.com>
> 
> As glib is not available in Android, not able to build igt for Android.
> 
> Provided stub implementations so igt can be compiled for both Android
> and linux from same code base. In case of linux systems, system
> libraries will be used whereas for Android stubs will be used with
> reduced test coverage.
> 
> Signed-off-by: Sapna Singh <sapna1.singh@intel.com>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  include/android/glib.h | 55 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 include/android/glib.h

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> new file mode 100644
> index 000000000..8540d3514
> --- /dev/null
> +++ b/include/android/glib.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef _IGT_ANDROID_GLIB_H
> +#define _IGT_ANDROID_GLIB_H
> +
> +#include <stdbool.h>
> +#include <stdlib.h>
> +
> +#define G_KEY_FILE_NONE 0
> +#define G_REGEX_OPTIMIZE 0
> +
> +typedef struct _GError {
> +	int code;
> +	char *message;
> +} GError;
> +
> +typedef struct _GKeyFile {
> +	char *key;
> +	char *value;
> +} GKeyFile;
> +
> +typedef struct _GMatchInfo {
> +	int dummy;
> +} GMatchInfo;
> +
> +typedef int gint;
> +typedef size_t gsize;
> +typedef char gchar;
> +typedef unsigned char guchar;
> +typedef void GRegex;
> +typedef int GRegexMatchFlags;
> +
> +static inline void g_clear_error(GError **error) { }
> +static inline void g_error_free(GError *error) { }
> +
> +static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }
> +
> +static inline void g_key_file_free(GKeyFile *file) { }
> +static inline GKeyFile *g_key_file_new(void) { return NULL; }
> +static inline int g_key_file_get_integer(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return 0; }
> +static inline char *g_key_file_get_string(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return NULL; }
> +static inline bool g_key_file_load_from_file(GKeyFile *key_file,
> +	const char *file, int flags, GError **error) { return false; }
> +
> +static inline GRegex *g_regex_new(const char *pattern, int compile_options,
> +	int match_options, GError **error) { return NULL; }
> +static inline void g_regex_unref(GRegex *pattern) { };
> +static inline gboolean g_regex_match(GRegex *regex, const gchar *string,
> +	GRegexMatchFlags match_options, GMatchInfo **match_info) { return false; }
> +
> +static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
> +
> +#endif /* _IGT_ANDROID_GLIB_H */
> -- 
> 2.49.0
> 
