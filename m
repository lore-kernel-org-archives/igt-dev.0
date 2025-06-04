Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B62C5B543
	for <igt-dev@archiver.kernel.org>; Wed,  4 Jun 2025 12:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B00F10E67B;
	Wed,  4 Jun 2025 12:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkMMBcP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3F1F10E67B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Jun 2025 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749041495; x=1780577495;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gnFtmCgvyg5dcn9Y6No0r6+DMuVYWVfQKHTBUb85BAU=;
 b=VkMMBcP2w4pIEoH8f7Fo0HS0pHivDg4Ctxay7JLljTwCA+q2PV09WQyY
 hHYUVLjabXNgKsKiW8pOhimNPbLCQBD8+QTaHwZmWjZh1Ab4Xcz79dsca
 cg6tar49iTZrFhXeVgbGSviSu5NxKsRbzwV+9P3mrvVReHET46aBWzMpL
 k/mcUgTM4VXA8+CxIq2+LNINp2KrCddoMjPCyWJYf5Td1i8JEZM48rc9S
 0SszCgeUe8YylkD2pvLHUQHLvPZK4+HFur9lI5ZbQi7uxfFThVKJX+kXd
 Uwcr9vSgJqji18kjX8JnapthRL+46+6Ws6D5EZlonbLI3LcbrKwRPT7Fn A==;
X-CSE-ConnectionGUID: kUYhjfwJR3CnxzhUCxJD8A==
X-CSE-MsgGUID: TqXmtoqIRHionDAl1FLnWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62173599"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="62173599"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:51:34 -0700
X-CSE-ConnectionGUID: teizotzxRCKf0mlr5cRRbA==
X-CSE-MsgGUID: GtjdFDJgRqap1PakeqKUKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="145510538"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:51:31 -0700
Date: Wed, 4 Jun 2025 14:51:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com,
 Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <ryszard.knop@linux.intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: Re: [PATCH i-g-t v14 03/11] include/android: Add stub for procps and
 glib
Message-ID: <20250604125114.zq4ujnaonajtduwg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com,
 Petri Latvala <adrinael@adrinael.net>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <ryszard.knop@linux.intel.com>,
 Ryszard Knop <rk@dragonic.eu>
References: <20250603192355.77019-1-jeevaka.badrappan@intel.com>
 <20250603192355.77019-4-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250603192355.77019-4-jeevaka.badrappan@intel.com>
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
On 2025-06-03 at 19:23:46 +0000, Jeevaka Prabu Badrappan wrote:
> From: Sapna Singh <sapna1.singh@intel.com>
> 
> As procps, glib are not available in Android, not able to build igt
> for Android.
> 
> Provided stub implementations so igt can be compiled for both Android
> and linux from same code base. In case of linux systems, system
> libraries will be used whereas for Android stubs will be used with
> reduced test coverage.
> 
> Signed-off-by: Sapna Singh <sapna1.singh@intel.com>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  include/android/glib.h   | 44 ++++++++++++++++++++++++++++++++++++++++
>  include/android/procps.h | 40 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 include/android/glib.h
>  create mode 100644 include/android/procps.h
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> new file mode 100644
> index 000000000..c80a16e47
> --- /dev/null
> +++ b/include/android/glib.h
> @@ -0,0 +1,44 @@
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
> +typedef int gint;
> +typedef size_t gsize;
> +typedef char gchar;
> +typedef unsigned char guchar;
> +typedef void GRegex;
> +
> +static inline void g_clear_error(GError **error) { }
> +static inline void g_error_free(GError *error) { }

Please add newline here, so it will separate different
functionality.

> +static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }

Add newline.

> +static inline void g_key_file_free(GKeyFile *file) { }
> +static inline GKeyFile *g_key_file_new(void) { return NULL; }
> +static inline int g_key_file_get_integer(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return 0; }
> +static inline char *g_key_file_get_string(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return NULL; }
> +static inline bool g_key_file_load_from_file(GKeyFile *key_file,
> +	const char *file, int flags, GError **error) { return false; }

Add newline.

Regex part is missing g_regex_match(), please add it.

imho in our GitLab we could try to add at least compilation
checks, using debian image without glib and libproc.

+cc Ryszard Knop and Petri Latvala

> +static inline GRegex *g_regex_new(const char *pattern, int compile_options,
> +	int match_options, GError **error) { return NULL; }
> +static inline void g_regex_unref(GRegex *pattern) { };

Add newline.

Regards,
Kamil

> +static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
> +
> +#endif /* _IGT_ANDROID_GLIB_H */
> diff --git a/include/android/procps.h b/include/android/procps.h
> new file mode 100644
> index 000000000..f859dffe1
> --- /dev/null
> +++ b/include/android/procps.h
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +#ifndef _IGT_ANDROID_PROCPS_H
> +#define _IGT_ANDROID_PROCPS_H
> +
> +enum pids_item {
> +	PIDS_NOT_IMPLEMENTED = 0,
> +};
> +
> +enum pids_fetch_type {
> +	PIDS_FETCH_TASKS_ONLY,
> +	PIDS_FETCH_THREADS_TOO
> +};
> +
> +struct pids_result {
> +	enum pids_item item;
> +	union {
> +		unsigned long long ull_int;
> +		double real;
> +	} result;
> +};
> +
> +struct pids_stack {
> +	struct pids_result *head;
> +};
> +
> +struct pids_info;
> +
> +#define PIDS_VAL(relative_enum, type, stack, info) \
> +	((info & 0) | (stack)->head[relative_enum].result.type)
> +
> +int procps_pids_new(struct pids_info **info, enum pids_item *items, int numitems) { return 0; }
> +int procps_pids_unref(struct pids_info **info) { return 0; }
> +
> +struct pids_stack *procps_pids_get(struct pids_info *info, enum pids_fetch_type which)
> +{
> +	return NULL;
> +}
> +
> +#endif /* _IGT_ANDROID_PROCPS_H */
> -- 
> 2.49.0
> 
