Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139E0F30930
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 10:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB37110E25E;
	Thu,  5 Mar 2026 10:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDVBhhE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC5F10E25E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 10:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772707557; x=1804243557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Y9p19a5mIAk5P8H76zHGxpe3jupY8Fh0rCLPzpkr91c=;
 b=TDVBhhE7jIwZuXKUEs0sOkxHbLQcrweLXC1oxhjleGwojI01KpBoxiJR
 WyiOWbvR6tnJJ5dwGb1X/n8i5IU8U7HfPpcpt8TWIOzFKlRZ3dkn1iCH8
 HSWZld9qpqDbbcxWXe6HpGGOSI+5bjcc4xoShYtApuhMdk2GQcPJxuw+4
 7DBYU+XbkxMIFApa6MQD2z/lBrBmxtSX7l/g1fDWaE/t8yGZ6UTQWP+Bs
 WJ7kP7JnqKk7Wpn8DvhtT6wnQgtUiSjzW573iuXgPcsuxbOIYCelkg9mE
 zqZ6qNs3o6IViHtinNL+svsFj/FwuGKEN3f0laH8Y0IVM9JkjbvNxq3wk Q==;
X-CSE-ConnectionGUID: PZa7M8ZqQui9qYTTUY59Iw==
X-CSE-MsgGUID: u7rZghf6QF23GLy5hhbBCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96407232"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="96407232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 02:45:56 -0800
X-CSE-ConnectionGUID: LLGRLK2MRmictE2z5wKwxQ==
X-CSE-MsgGUID: A6YW3lGLRH2xotSNfP9OfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="218603548"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 02:45:54 -0800
Date: Thu, 5 Mar 2026 11:45:38 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mark Yacoub <markyacoub@google.com>
Cc: igt-dev@lists.freedesktop.org,
	Sasha McIntosh <sashamcintosh@google.com>
Subject: Re: [PATCH i-g-t] include/android: Define additional types in glib.h
Message-ID: <20260305104538.ftzhwkra4zmegibn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org,
 Sasha McIntosh <sashamcintosh@google.com>
References: <20260304200809.2562643-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260304200809.2562643-1-markyacoub@google.com>
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

Hi Mark,
On 2026-03-04 at 15:08:09 -0500, Mark Yacoub wrote:
> From: Sasha McIntosh <sashamcintosh@google.com>
> 
> Define additional types to satisfy dependencies in kms_colorop.c to fix
> breakages in the Android build environment.
> 
> Bug: 442873283
> Test: kms_colorop

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  include/android/glib.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/include/android/glib.h b/include/android/glib.h
> index e12aaeebb..660386ca4 100644
> --- a/include/android/glib.h
> +++ b/include/android/glib.h
> @@ -8,6 +8,7 @@
>  
>  #define G_KEY_FILE_NONE 0
>  #define G_REGEX_OPTIMIZE 0
> +#define GINT_TO_POINTER(i) ((void *)(signed long)(i))
>  
>  typedef struct _GError {
>  	int code;
> @@ -23,6 +24,11 @@ typedef struct _GMatchInfo {
>  	int dummy;
>  } GMatchInfo;
>  
> +typedef struct _GHashTable {
> +  unsigned int hash_func;
> +  bool key_equal_func;
> +} GHashTable;
> +
>  typedef int gint;
>  typedef size_t gsize;
>  typedef char gchar;
> @@ -30,6 +36,9 @@ typedef unsigned char guchar;
>  typedef void GRegex;
>  typedef int GRegexMatchFlags;
>  typedef bool gboolean;
> +typedef unsigned int guint;
> +typedef guint (*GHashFunc)(const void *key);
> +typedef gboolean (*GEqualFunc)(const void *a, const void *b);
>  
>  static inline void g_clear_error(GError **error) { }
>  static inline void g_error_free(GError *error) { }
> @@ -52,5 +61,18 @@ static inline gboolean g_regex_match(GRegex *regex, const gchar *string,
>  	GRegexMatchFlags match_options, GMatchInfo **match_info) { return false; }
>  
>  static gchar *g_base64_encode(const guchar *data, gsize len) { return NULL; }
> +static guint g_direct_hash(const void *v) { return 0; }
> +static gboolean g_direct_equal(const void *v1, const void *v2) { return 0; }
> +static inline GHashTable *g_hash_table_new(GHashFunc hash_func,
> +                                           GEqualFunc key_equal_func) {
> +  return NULL;
> +}
> +static inline void g_hash_table_destroy(GHashTable *hash_table) { }
> +static inline gboolean g_hash_table_add(GHashTable *hash_table, void *key) {
> +  return false;
> +}
> +static inline gboolean g_hash_table_contains(GHashTable *hash_table, const void *key) {
> +  return false;
> +}
>  
>  #endif /* _IGT_ANDROID_GLIB_H */
> -- 
> 2.53.0.473.g4a7958ca14-goog
> 
