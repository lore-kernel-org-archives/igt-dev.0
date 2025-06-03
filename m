Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79B6C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 15:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4179910E05D;
	Tue,  3 Jun 2025 15:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DBendO4h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E6C10E05D
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 15:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748964887; x=1780500887;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZxRAuTiYMnyc5jg/83yCysYszfyeOOtGl36j78hCKAc=;
 b=DBendO4hsAVIW3qi4BRc64gq4Ck2HH7z9jR1fwfC8SQx35NmD0MMpzq0
 DTKmkhrCYxAvSBIBAYqAGu1ENhnPUcXFQUYctCcyHDof4PntCSmS3fmSR
 Cyu/I0GVVTITMykV6NyhcQ/2LLRXt1UcOewUJXh1ePMbIp7OlbPUZMeHA
 S1Hzzl0cobm7GHsT2kkgnvTnlH2vNs/P8NvlxuuRk9z4bmTlwAo5Kw81T
 NRCxoQcZb5HqnlzR3+5Otza4kKYIxfYEGMVbcagqHLhuZkmq80bOQRzvh
 0fqBS7HdioMEtCTuHaSynIkIvsmQNZRtAUFks5wC4ZnfXaOklA3AydlIP g==;
X-CSE-ConnectionGUID: 8j7ZjcGaSXaZunrKw0JnJQ==
X-CSE-MsgGUID: 3aVE1GEdSCWrrKhZ4ete2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61632317"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61632317"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 08:34:46 -0700
X-CSE-ConnectionGUID: VQY7NgIZR6SPyKKnwpPDAg==
X-CSE-MsgGUID: UNPznJOnTumuurG6r9cOkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149670375"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 08:34:44 -0700
Date: Tue, 3 Jun 2025 17:34:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v12 01/11] include/android: Add stub for procps and
 glib
Message-ID: <20250603153441.f7v2fgj63oadvpib@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250602192515.95309-1-jeevaka.badrappan@intel.com>
 <20250602192515.95309-2-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250602192515.95309-2-jeevaka.badrappan@intel.com>
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
On 2025-06-02 at 19:25:05 +0000, Jeevaka Prabu Badrappan wrote:
> From: Sapna Singh <sapna1.singh@intel.com>
> 
> As procps, glib are not available in Android, not able to build igt
> for Android.
> 
> Provided stub implementations so igt can be compiled for both Android
> and linux from same code base. Incase of linux systems, system libraries

s/Incase/In case/

> will be used whereas for Android stubs will be used with reduced
> test coverage.
> 
> Signed-off-by: Sapna Singh <sapna1.singh@intel.com>
> Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
> ---
>  include/android/glib.h   | 42 ++++++++++++++++++++++++++++++++++++
>  include/android/procps.h | 46 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+)
>  create mode 100644 include/android/glib.h
>  create mode 100644 include/android/procps.h
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> new file mode 100644
> index 000000000..4d0a63098
> --- /dev/null
> +++ b/include/android/glib.h
> @@ -0,0 +1,42 @@

Add SPDX MIT here. Imho you could use MIT as you are only adding stubs.
In case you will copy-paste any code you should use same licence as
original, so:

/* SPDX-License-Identifier: MIT */

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
> +static inline const char *g_get_home_dir(void) { return "/data/local/tmp/igt"; }
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
> +static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
> +
> +#endif /* _IGT_ANDROID_GLIB_H */
> diff --git a/include/android/procps.h b/include/android/procps.h
> new file mode 100644
> index 000000000..327c9bcc5
> --- /dev/null
> +++ b/include/android/procps.h
> @@ -0,0 +1,46 @@

Same here, add SPDX MIT here.

> +#ifndef _IGT_ANDROID_PROCPS_H
> +#define _IGT_ANDROID_PROCPS_H
> +
> +enum pids_item {
> +	PIDS_CMD     = 13, /* str stat: comm or status: Name */
> +	PIDS_ID_EGID = 29, /* u_int status: Gid */
> +	PIDS_ID_EUID = 31, /* u_int status: Uid */
> +	PIDS_ID_PID  = 39, /* s_int from /proc/<pid> */

No need for this as this is stub only, add some dummy,
for example:

	PIDS_NOT_IMPLEMENTED = 0

> +};

Add newline.

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

Do you really need this? imho use largest ones like:
	union {
		unsigned long long ull_int;
		double real;
	} result;

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

This emits compiler warning so make a workaround like:
	((info & 0) | (stack)->head[relative_enum].result.type)


Regards,
Kamil

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
