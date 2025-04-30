Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFA8C369D9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 17:04:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC9510E100;
	Wed, 30 Apr 2025 17:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Se3zfiIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC54710E100
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 17:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746032679; x=1777568679;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JtpiLpaQcggE/1Cg8IQ23v8k73e747hq2aipUwJK9xc=;
 b=Se3zfiIzhzYeHGVG7uxl294lbtOT144qjAMXlk5e+lw7GpoiL7ahU3sj
 4PrHBo2DmSevRWS4qPhQx4yIZQyW2CgJd3mtQEbXj0/4sENOA/kk0QG2n
 FuVe3PBRDATzBKOnIPiCoNhrQLOfS8jGqNSpjCQTvmfIXflRfEoC8m7Hf
 YZZiGwmkeLfb2VLy8jfpgK+re8exySB7ZflZHL1R7b2ptgYf3fk98MpFL
 ZMH9NRQlwu698kRDiLf+0UnHDQsDPJ3UKjWUHPiffqLrV7Dq00BSepnaE
 Khfwe7/Ml+qjwPPcwZs8IGTz9h9Tq+xqFBBtd0rD10uTESclZ3uJuJVdp w==;
X-CSE-ConnectionGUID: ZAxOoLZ8Q4OQllbn1MAE5Q==
X-CSE-MsgGUID: 3bRuKsyfR3GHnP4WSFl7tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65117601"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="65117601"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 10:04:30 -0700
X-CSE-ConnectionGUID: 70u1aEGxQMO4mhfr2a+p0g==
X-CSE-MsgGUID: KhmKuhRVSiyo0DhWvejAVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134677200"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 10:04:29 -0700
Date: Wed, 30 Apr 2025 19:04:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, sapna1.singh@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH 1/5] Add stub for libunwind, procps and glib
Message-ID: <20250430170411.d63ecpv4detyrcsn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, sapna1.singh@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
References: <20250429204000.41537-1-jeevaka.badrappan@intel.com>
 <20250429204000.41537-2-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250429204000.41537-2-jeevaka.badrappan@intel.com>
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
On 2025-04-29 at 20:39:56 +0000, Jeevaka Prabu Badrappan wrote:
> From: Sapna <sapna1.singh@intel.com>
> 
> As libunwind, procps, glib are not available in Android, not able to
> build igt for Android.
> 
> Provided stub implementations so igt can be compiled for both Android
> and linux from same code base. Incase of linux systems, system libraries
> will be used whereas for Android stubs will be used with reduced
> test coverage.
> 
> Signed-off-by: Sapna <sapna1.singh@intel.com>
> ---
>  include/stub/glib.h          | 43 ++++++++++++++++++++++++++++++++++++
>  include/stub/libproc2/pids.h | 41 ++++++++++++++++++++++++++++++++++
>  include/stub/libunwind.h     | 20 +++++++++++++++++

I would prefer to have this in libs itself as:

lib/igt_glib.h
lib/igt_procps.h
lib/igt_unwind.h

and fall back to system includes in case of non-Android,
like

#ifndef ANDROID

#include <glib.h>

#else

... here Android staff ...

#endif /* ANDROID */

>  3 files changed, 104 insertions(+)
>  create mode 100644 include/stub/glib.h
>  create mode 100644 include/stub/libproc2/pids.h
>  create mode 100644 include/stub/libunwind.h
> 
> diff --git a/include/stub/glib.h b/include/stub/glib.h
> new file mode 100644
> index 000000000..0bd862fa2
> --- /dev/null
> +++ b/include/stub/glib.h
> @@ -0,0 +1,43 @@
> +#pragma once

Do not use pragmas, do it C-style with:

#ifndef IGT_GLIB_H
#define IGT_GLIB_H

...

#endif

Regards,
Kamil

> +#include <stdbool.h>
> +#include <stdlib.h>
> +#define G_KEY_FILE_NONE 0
> +#define G_REGEX_OPTIMIZE 0
> +
> +typedef struct _GError {
> +    int code;
> +    char *message;
> +} GError;
> +
> +typedef struct _GKeyFile {
> +    char *key;
> +    char *value;
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
> +    const char *group_name, const char *key, GError **error) { return 0; }
> +static inline char *g_key_file_get_string(GKeyFile *key_file,
> +    const char *group_name, const char *key, GError **error) { return NULL; }
> +static inline bool g_key_file_load_from_file(GKeyFile *key_file,
> +    const char *file, int flags, GError **error) { return false; }
> +static inline GRegex* g_regex_new(const char *pattern, int compile_options,
> +    int match_options, GError **error) { return NULL; }
> +static inline void g_regex_unref(GRegex *pattern) { };
> +static gchar* g_base64_encode(const guchar* data, gsize len) {
> +    gchar* str = (gchar*)malloc(1);  // Allocate memory for an empty string
> +    if (str) {
> +        str[0] = '\0';  // Set the string to be empty
> +    }
> +    return str;
> +}
> diff --git a/include/stub/libproc2/pids.h b/include/stub/libproc2/pids.h
> new file mode 100644
> index 000000000..bcdd095e0
> --- /dev/null
> +++ b/include/stub/libproc2/pids.h
> @@ -0,0 +1,41 @@
> +enum pids_item {
> +    PIDS_CMD     = 13,           //      str        stat: comm or status: Name
> +    PIDS_ID_EGID = 29,           //    u_int        status: Gid
> +    PIDS_ID_EUID = 31,           //    u_int        status: Uid
> +    PIDS_ID_PID  = 39,           //    s_int        from /proc/<pid>
> +};
> +enum pids_fetch_type {
> +    PIDS_FETCH_TASKS_ONLY,
> +    PIDS_FETCH_THREADS_TOO
> +};
> +
> +struct pids_result {
> +    enum pids_item item;
> +    union {
> +        signed char         s_ch;
> +        signed int          s_int;
> +        unsigned int        u_int;
> +        unsigned long       ul_int;
> +        unsigned long long  ull_int;
> +        char               *str;
> +        char              **strv;
> +        double              real;
> +    } result;
> +};
> +
> +struct pids_stack {
> +    struct pids_result *head;
> +};
> +
> +struct pids_info;
> +
> +#define PIDS_VAL( relative_enum, type, stack, info) \
> +    stack -> head [ relative_enum ] . result . type
> +
> +int procps_pids_new   (struct pids_info **info, enum pids_item *items, int numitems) { return 0; }
> +int procps_pids_unref (struct pids_info **info) { return 0;}
> +
> +struct pids_stack *procps_pids_get(struct pids_info *info, enum pids_fetch_type which) {
> +    struct pids_stack *ps = NULL;
> +    return ps;
> +}
> diff --git a/include/stub/libunwind.h b/include/stub/libunwind.h
> new file mode 100644
> index 000000000..168c31c14
> --- /dev/null
> +++ b/include/stub/libunwind.h
> @@ -0,0 +1,20 @@
> +#define UNW_TDEP_CURSOR_LEN     127
> +typedef struct unw_cursor
> +{
> +   int opaque[UNW_TDEP_CURSOR_LEN];
> +}
> +unw_cursor_t;
> +
> +
> +typedef struct unw_context
> +{
> +   int ctx;
> +}
> +unw_context_t;
> +
> +typedef uint32_t unw_word_t;
> +
> +int unw_getcontext(unw_context_t *uc) { return 0; }
> +int unw_init_local (unw_cursor_t *cur, unw_context_t *uc) { return 0; }
> +int unw_step (unw_cursor_t *cur) { return 0; }
> +int unw_get_proc_name (unw_cursor_t *cur, char *ch, size_t size, unw_word_t *word) { return 0; }
> -- 
> 2.49.0
> 
