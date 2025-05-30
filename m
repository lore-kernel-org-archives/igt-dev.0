Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A6BC5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 18:21:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1F910E1BF;
	Fri, 30 May 2025 18:21:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVHsOMka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D1E10E1BF
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 18:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748629285; x=1780165285;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=yENwhUf7yRJk3JJC+oQMC99P/wB6vdunKd5ncOzKMSs=;
 b=eVHsOMkasR+fizK5extwePVl+Wiir6Plx/K26bwKHTWoL2nsIUriO9il
 15yjxGBUR3OXVGCIpuN1WtckpEX/FvIOoG1i/macpgIvRbeibcG3eL17N
 IPndYjaRFXz5Nic+lgUy7nax2+4MOShNKpHg1hVWwqhjcFkjnngC0Xvrq
 LzsQ8JjDX1+lKYU4Xtpw0fjVWuALvRLBLeQAbyAlkwt6KVu4ahwLsCc/H
 UOuEw7EsVlqo9r7RimoZ5xFxOXjTbTwSf7jgTIPx9cyaJGYtBYFtEjmAs
 dAj6NffAtlmwSJbdE7DYARN+CVZ59v3BKigVmZCBnDdY0HzH6TMDKD36p g==;
X-CSE-ConnectionGUID: 6Uyh2WwYTF2SJ1uQ5iOjhA==
X-CSE-MsgGUID: SPPp3JdLQ4upl9krlMxAww==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="60987818"
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="60987818"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 11:21:24 -0700
X-CSE-ConnectionGUID: b8G97+TtRlqaJmDIphAy8A==
X-CSE-MsgGUID: 6NIekppcS6aAtKm29rg7Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,196,1744095600"; d="scan'208";a="148806796"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 11:21:23 -0700
Date: Fri, 30 May 2025 20:21:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
Subject: Re: [PATCH i-g-t v11 1/7] Add stub for procps and glib
Message-ID: <20250530182120.fm2ph2wp7hyai43e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, markyacoub@google.com,
 seanpaul@google.com, carlos.santa@intel.com, sapna1.singh@intel.com
References: <20250529171246.74375-1-jeevaka.badrappan@intel.com>
 <20250529171246.74375-2-jeevaka.badrappan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250529171246.74375-2-jeevaka.badrappan@intel.com>
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
On 2025-05-29 at 17:12:40 +0000, Jeevaka Prabu Badrappan wrote:
> From: Sapna <sapna1.singh@intel.com>

imho this should be: From: Sapna Singh <sapna1.singh@intel.com>

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

This should be:

Signed-off-by: Sapna Singh <sapna1.singh@intel.com>

> ---
>  include/android/glib.h     | 42 ++++++++++++++++++++++++++++++++++
>  include/android/procps.h   | 46 ++++++++++++++++++++++++++++++++++++++

Please split it into new patch with subject:

[PATCH i-g-t vNN 1/7] include/android: Add stubs for procps and glib

>  lib/intel_batchbuffer.c    |  3 +++

This also in separate patch:
[PATCH i-g-t vNN 2/7] lib/intel_batchbuffer: handle base64 encode fail

>  tests/intel/api_intel_bb.c |  3 +++
>  tests/intel/xe_intel_bb.c  |  3 +++

Same here, these two also in separate one:
[PATCH i-g-t vNN 3/7] tests/intel/*_intel_bb: handle base64 encode fail

If you will make your changes, add also your s-o-b to modified patches.

>  5 files changed, 97 insertions(+)
>  create mode 100644 include/android/glib.h
>  create mode 100644 include/android/procps.h
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> new file mode 100644
> index 000000000..4d0a63098
> --- /dev/null
> +++ b/include/android/glib.h
> @@ -0,0 +1,42 @@
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

I am not sure here, imho this should be some user related path
or path where igt binaries are installed, if you are ok with
this it could stay.

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
> +#ifndef _IGT_ANDROID_PROCPS_H
> +#define _IGT_ANDROID_PROCPS_H
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
> +	return NULL;
> +}
> +
> +#endif /* _IGT_ANDROID_PROCPS_H */
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index f7569e768..03ce65ded 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -2348,6 +2348,9 @@ static void intel_bb_dump_base64(struct intel_bb *ibb, int linelen)
>  
>  	igt_info("--- bb ---\n");
>  	pos = str = g_base64_encode((const guchar *) ibb->batch, ibb->size);
> +	if (str == NULL)
> +		return;
> +
>  	outsize = strlen(str);
>  
>  	while (outsize > 0) {
> diff --git a/tests/intel/api_intel_bb.c b/tests/intel/api_intel_bb.c
> index 4a1c9be91..39bc2525c 100644
> --- a/tests/intel/api_intel_bb.c
> +++ b/tests/intel/api_intel_bb.c
> @@ -944,7 +944,10 @@ static int dump_base64(const char *name, struct intel_buf *buf)
>  
>  		igt_info("--- %s ---\n", name);
>  		pos = str = g_base64_encode(destbuf, outsize);
> +		if (str == NULL)
> +			return -1;

Add newline here.

>  		outsize = strlen(str);
> +

Remove newline.

>  		while (pos) {
>  			char line[LINELEN + 1];
>  			int to_copy = min(LINELEN, outsize);
> diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
> index d8bd7b519..caa17498f 100644
> --- a/tests/intel/xe_intel_bb.c
> +++ b/tests/intel/xe_intel_bb.c
> @@ -595,7 +595,10 @@ static int dump_base64(const char *name, struct intel_buf *buf)
>  
>  		igt_info("--- %s ---\n", name);
>  		pos = str = g_base64_encode(destbuf, outsize);
> +		if (str == NULL)
> +			return -1;

Add newline here.

>  		outsize = strlen(str);
> +

Remove this empty line.

Regards,
Kamil

>  		while (pos) {
>  			char line[LINELEN + 1];
>  			int to_copy = min(LINELEN, outsize);
> -- 
> 2.49.0
> 
