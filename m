Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2685FC54FB3
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 15:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DE5A10E3B4;
	Mon, 26 May 2025 15:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JlCP7ONF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8872110E3B4
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748275059; x=1779811059;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mPEO9rXQKnrXFhU+kxxvJ94xsX+YhsGv42D2ZVY7Jlc=;
 b=JlCP7ONFN9Hf8jVEUfMuBhl5QzDRYrefDklLVSP7wWk3l2hIkgXtt9pt
 G2U1CxFGMdcSUpoykdcYykxGi/NSOBiz9ekVLXrA8HV5/0SBYShDJAzY2
 lc854+BhPCbV1ALbmpUimKR5UU57CiGMjOo0Zvr/qcIfKEGKILnO8AMtX
 nwfcvr7okl/6Nom9nBzl3+PlMzQAJQhTxz6VN1TgrLZULKO6tVzbNaB3C
 dWiFfd6ta6QKkYmnN2xc5oCJw/c4POsTL/3dadwThgm5EaKocViqtLMWx
 fSc7EMU4sI2Mr1NGPcRbcJQgHfR9V+J2D4axUyCLkY3htPPSRTI+nTWMi w==;
X-CSE-ConnectionGUID: FjCg5X1eTxiXvxGR1i+4rQ==
X-CSE-MsgGUID: Df46J+IrQ/KR+SjO3MIFVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="52880789"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="52880789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 08:57:39 -0700
X-CSE-ConnectionGUID: XntWOs90Q/Kns6ZG2EKmhg==
X-CSE-MsgGUID: zePWBAtkQDu84y2uVHy8NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; d="scan'208";a="142350152"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 08:57:37 -0700
Date: Mon, 26 May 2025 17:57:34 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v10 1/7] Add stub for procps and glib
Message-ID: <20250526155734.uc2y6z67f4jnkkij@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250522143419.28888-1-jeevaka.badrappan@intel.com>
 <20250522143419.28888-2-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522143419.28888-2-jeevaka.badrappan@intel.com>
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
On 2025-05-22 at 14:34:13 +0000, Jeevaka Prabu Badrappan wrote:
> From: Sapna <sapna1.singh@intel.com>
> 
> As procps, glib are not available in Android, not able to build igt
> for Android.
> 
> Provided stub implementations so igt can be compiled for both Android
> and linux from same code base. Incase of linux systems, system libraries
> will be used whereas for Android stubs will be used with reduced
> test coverage.
> 
> Signed-off-by: Sapna <sapna1.singh@intel.com>
> ---
>  include/android/glib.h   | 49 ++++++++++++++++++++++++++++++++++++++++
>  include/android/procps.h | 47 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+)
>  create mode 100644 include/android/glib.h
>  create mode 100644 include/android/procps.h
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> new file mode 100644
> index 000000000..84654f33b
> --- /dev/null
> +++ b/include/android/glib.h
> @@ -0,0 +1,49 @@
> +#ifndef _ANDROID_GLIB_H
> +#define _ANDROID_GLIB_H

imho better: _IGT_ANDROID_GLIB_H

> +
> +#include <stdbool.h>
> +#include <stdlib.h>

Add newline.

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
> +static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }

This looks incorrect, why not just NULL?

> +static inline void g_key_file_free(GKeyFile *file) { }
> +static inline GKeyFile *g_key_file_new(void) { return NULL; }
> +static inline int g_key_file_get_integer(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return 0; }
> +static inline char *g_key_file_get_string(GKeyFile *key_file,
> +	const char *group_name, const char *key, GError **error) { return NULL; }
> +static inline bool g_key_file_load_from_file(GKeyFile *key_file,
> +	const char *file, int flags, GError **error) { return false; }
> +static inline GRegex *g_regex_new(const char *pattern, int compile_options,
> +	int match_options, GError **error) { return NULL; }
> +static inline void g_regex_unref(GRegex *pattern) { };
> +static gchar *g_base64_encode(const guchar *data, gsize len)
> +{
> +	gchar *str = (gchar *)malloc(1);  /* Allocate memory for an empty string */
> +
> +	if (str)
> +		str[0] = '\0';  /* Set the string to be empty */

This also looks incorrect, either implement it or return NULL.

> +
> +	return str;
> +}
> +
> +#endif /* _ANDROID_GLIB_H */
> diff --git a/include/android/procps.h b/include/android/procps.h
> new file mode 100644
> index 000000000..b428ebe20
> --- /dev/null
> +++ b/include/android/procps.h
> @@ -0,0 +1,47 @@
> +#ifndef _ANDROID_PROCPS_H
> +#define _ANDROID_PROCPS_H

Same as above, better _IGT_ANDROID_PROCPS_H

> +
> +enum pids_item {
> +	PIDS_CMD     = 13, /* str stat: comm or status: Name */
> +	PIDS_ID_EGID = 29, /* u_int status: Gid */
> +	PIDS_ID_EUID = 31, /* u_int status: Uid */
> +	PIDS_ID_PID  = 39, /* s_int from /proc/<pid> */
> +};
> +enum pids_fetch_type {
> +	PIDS_FETCH_TASKS_ONLY,
> +	PIDS_FETCH_THREADS_TOO
> +};
> +
> +struct pids_result {
> +	enum pids_item item;
> +	union {
> +		signed char s_ch;
> +		signed int s_int;
> +		unsigned int u_int;
> +		unsigned long ul_int;
> +		unsigned long long ull_int;
> +		char *str;
> +		char **strv;
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
> +	stack->head[relative_enum].result.type
> +
> +int procps_pids_new(struct pids_info **info, enum pids_item *items, int numitems) { return 0; }
> +int procps_pids_unref(struct pids_info **info) { return 0; }
> +
> +struct pids_stack *procps_pids_get(struct pids_info *info, enum pids_fetch_type which)
> +{
> +	struct pids_stack *ps = NULL;
> +	return ps;

Also looks incorrect, you should allocate it and return allocated
memory or just

	return NULL;

Regards,
Kamil

> +}
> +
> +#endif /* _ANDROID_PROCPS_H */
> -- 
> 2.49.0
> 
