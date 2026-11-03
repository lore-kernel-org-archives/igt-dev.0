Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50642606A324
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 17:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KiAFPy3C
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3CE410E631;
	Tue,  3 Nov 2026 17:22:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257FB10F738
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 17:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793726494; x=1825262494;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+5CObbCsQZREFLbb3xnjEsqBeDMftAcwOkIhmFUn0FU=;
 b=KiAFPy3CV79kyXboOvd5lcT+O6Bw4TDgc5EieJRTm+8aFIRLpSHpBjpF
 sFjI16wwVjwxjo1mx5UVUcKkpkHKDrCHxztIHFduxtn9/1WAh+upGY2/z
 4Aj8yyVBLgFuZWkDsHGHr+j84ENZd/VmktsUQIMo4KNBeMTw6TzualIKg
 riLNGPBRZDbIzLuhcM38Tzx41tE5XRMWQ8w4hU26xzXBTZUMW8hj4y30F
 gojl0rvPIaD1/zTkN+4Jo/AqpZtWOy7ZHMyFHNNPlI0eFA8pw0Fz32Bey
 wu3hmjAJ49FPAecUWqXMhth8eaJM9lPxJME7uHCtlcbRGJSGjNK/6UDuV A==;
X-CSE-ConnectionGUID: V7F+GsfmTwqqVXNSp6GKrw==
X-CSE-MsgGUID: H5nZGFWLRQKC5rU5qCiNEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2340162"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2340162"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 09:21:33 -0800
X-CSE-ConnectionGUID: yTaxOqEcTcWRc+R9QA4EbQ==
X-CSE-MsgGUID: 0gDNwfF3SkaELkgJ9ta64g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6475152"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 09:21:31 -0800
Date: Tue, 3 Nov 2026 18:21:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: himanshu.girotra@intel.com
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com, 
 varun.gupta@intel.com, nishit.sharma@intel.com, riana.tauro@intel.com, 
 matthew.d.roper@intel.com, rodrigo.vivi@intel.com, vitaly.prosyak@amd.com
Subject: Re: [RFC PATCH i-g-t] runner/resultgen: Don't flag local errors
 caused by CAT errors on CRI
Message-ID: <qd7m6edpuzdge2kvgklf34eeoxiwctsnrtttbl7ekfmlxes7zn@d5rjafradsjs>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org,
 ramadevi.gandi@intel.com, 
 varun.gupta@intel.com, nishit.sharma@intel.com, riana.tauro@intel.com, 
 matthew.d.roper@intel.com, rodrigo.vivi@intel.com, vitaly.prosyak@amd.com
References: <20261103114048.3302874-1-himanshu.girotra@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103114048.3302874-1-himanshu.girotra@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Himanshu,
On 2026-11-03 at 17:10:48 +0530, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
> 
> On CRI, a memory CAT error triggered by userspace is followed by an
> error-level GuC report:
> 
>   Engine memory CAT error [18]: class=bcs, ..., guc_id=4
>   *ERROR* Tile0: GT0: GuC: Uncorrectable local error! guc_id=4 ...
> 
> Every test that deliberately causes a CAT error therefore ends up
> as dmesg-warn. Track CAT errors per subtest by device, GT and guc_id,
> and skip the local error only when it matches one. Unmatched or
> unknown-guc_id local errors are still reported.
> 
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  runner/resultgen.c | 51 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index 94cdd0e2e..8e7b7bb7c 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -1018,6 +1018,36 @@ static void add_empty_dmesgs_where_missing(struct json_t *tests,
>  
>  }
>  
> +/*
> + * A memory CAT error is user-triggerable and on CRI GuC follows it
> + * with an "Uncorrectable local error" for the same exec queue. Such
> + * local errors are expected; Don't flag these as warnings.
> + */
> +static const char xe_cat_error_regex[] =
> +	"^(.*)\\[drm\\] (\\*ERROR\\* )?((Tile[0-9]+: )?GT[0-9]+: )"
> +	"(Engine memory CAT error.*|GuC: Uncorrectable local error! )guc_id=([0-9]+)";

Why not a test exception injected by test itself?

If it is really needed here, maybe rather some
dynamically readed regex file for re_ignore and
also this one? Then any vendor could adjust this
to their needs.


Regards,
Kamil

+cc Vitaly Prosyak <vitaly.prosyak@amd.com>

> +
> +static bool is_expected_local_error(GRegex *re, GHashTable *cat_errors,
> +				    const char *message)
> +{
> +	GMatchInfo *info;
> +	bool expected = false;
> +
> +	if (g_regex_match(re, message, 0, &info)) {
> +		char *key = g_match_info_expand_references(info, "\\1\\3\\6", NULL);
> +
> +		if (strstr(message, "CAT error")) {
> +			g_hash_table_add(cat_errors, key);
> +		} else {
> +			expected = g_hash_table_remove(cat_errors, key);
> +			g_free(key);
> +		}
> +	}
> +	g_match_info_free(info);
> +
> +	return expected;
> +}
> +
>  static bool fill_from_dmesg(int fd,
>  			    struct settings *settings,
>  			    char *binary,
> @@ -1038,6 +1068,8 @@ static bool fill_from_dmesg(int fd,
>  	size_t i;
>  	GRegex *re;
>  	GRegex *re_ignore; /* regex for dynamically ignored dmesg line */
> +	GRegex *re_cat;
> +	GHashTable *cat_errors;
>  
>  	if (!f) {
>  		return false;
> @@ -1048,6 +1080,13 @@ static bool fill_from_dmesg(int fd,
>  		return false;
>  	}
>  
> +	if (!init_dmesg_regex(&re_cat, xe_cat_error_regex, "xe CAT error regex")) {
> +		g_regex_unref(re);
> +		fclose(f);
> +		return false;
> +	}
> +	cat_errors = g_hash_table_new_full(g_str_hash, g_str_equal, g_free, NULL);
> +
>  	re_ignore = NULL;
>  	while (getline(&line, &linelen, f) > 0) {
>  		char *formatted;
> @@ -1055,6 +1094,7 @@ static bool fill_from_dmesg(int fd,
>  		unsigned long long ts_usec;
>  		char continuation;
>  		char *message, *subtest, *dynamic_subtest, *ignore;
> +		bool expected;
>  
>  		if (!parse_dmesg_line(line, &flags, &ts_usec, &continuation, &message))
>  			continue;
> @@ -1085,6 +1125,7 @@ static bool fill_from_dmesg(int fd,
>  			generate_piglit_name(binary, subtest, piglit_name, sizeof(piglit_name));
>  			current_test = get_or_create_json_object(tests, piglit_name);
>  			clean_regex(&re_ignore);
> +			g_hash_table_remove_all(cat_errors);
>  		}
>  
>  		if (current_test != NULL &&
> @@ -1103,15 +1144,19 @@ static bool fill_from_dmesg(int fd,
>  			generate_piglit_name_for_dynamic(piglit_name, dynamic_subtest, dynamic_piglit_name, sizeof(dynamic_piglit_name));
>  			current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
>  			clean_regex(&re_ignore);
> +			g_hash_table_remove_all(cat_errors);
>  		}
>  
>  		if ((ignore = strstr(message, IGT_ADD_IGNORED_REGEX_DMESG)) != NULL)
>  			add_ignored_regex(&re_ignore, ignore + strlen(IGT_ADD_IGNORED_REGEX_DMESG));
>  
> +		expected = continuation != 'c' &&
> +			   is_expected_local_error(re_cat, cat_errors, message);
> +
>  		if (settings->piglit_style_dmesg) {
>  			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
>  			    g_regex_match(re, message, 0, NULL) &&
> -			    not_ignored(re_ignore, message)) {
> +			    not_ignored(re_ignore, message) && !expected) {
>  				append_line(&warnings, &warningslen, formatted);
>  				if (current_test != NULL)
>  					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
> @@ -1119,7 +1164,7 @@ static bool fill_from_dmesg(int fd,
>  		} else {
>  			if ((flags & 0x07) <= settings->dmesg_warn_level && continuation != 'c' &&
>  			    !g_regex_match(re, message, 0, NULL) &&
> -			    not_ignored(re_ignore, message)) {
> +			    not_ignored(re_ignore, message) && !expected) {
>  				append_line(&warnings, &warningslen, formatted);
>  				if (current_test != NULL)
>  					append_line(&dynamic_warnings, &dynamic_warnings_len, formatted);
> @@ -1167,6 +1212,8 @@ static bool fill_from_dmesg(int fd,
>  	free(warnings);
>  	free(dynamic_warnings);
>  	clean_regex(&re_ignore);
> +	g_regex_unref(re_cat);
> +	g_hash_table_destroy(cat_errors);
>  	g_regex_unref(re);
>  	fclose(f);
>  	return true;
> -- 
> 2.53.0
> 
