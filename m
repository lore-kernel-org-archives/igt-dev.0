Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336EACA5FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 13:47:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC95510F411;
	Wed, 30 Sep 2026 13:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XdzEt7Yz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A78810F411
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790776014; x=1822312014;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4P9hTFx1rNcy2H6LbEXxJoOyHTJpXcX51d3wg6sZe4s=;
 b=XdzEt7YzG0Q+IGzL6S+gzCdchGTvLPlJqXgrgBaYIZXuh4K7gaN5B2oT
 JyVVupl/i723+Da7Ajc5GLQ3/WFvUParHA2I8DDyUh1PTLKv4dOmmAHNA
 /sKkOxjlFsbOuD7Ay8ziHjha9RSDUZR93NFqa5HGKybctajoFPCOXV+rr
 poFjYaWHNgKoSO/aEw53oEqzkJGr8rutPHyvwqrso/SML4NLAm8YYy7vY
 2va0TAgayTINArZ2jiK5Q5i7q4kFZVWum/+vlaDDOYTzT5I1VavkNaIWl
 +dM0l9QQYkLzAbnNLGzjx/3/x52HDrLmdlTn7xiT06PuiTq7jIqIcGvoa g==;
X-CSE-ConnectionGUID: k6XUDgDCTS2xhEJW7P9Gzg==
X-CSE-MsgGUID: 5BM+SpcwRq+Hlf7VD4pKZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95323499"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="95323499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 06:46:54 -0700
X-CSE-ConnectionGUID: bKYZ+o/iTrOaabZ0V0al9Q==
X-CSE-MsgGUID: 9LNxfRoeRXGGuw2Wxt509g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="278906990"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:46:53 -0700
Date: Wed, 30 Sep 2026 15:46:50 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 3/5] lib: Preserve string const qualifiers
Message-ID: <20260930134650.ctqshmrsys5ck2ar@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260929154950.838280-1-alex.hung@amd.com>
 <20260929154950.838280-4-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260929154950.838280-4-alex.hung@amd.com>
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

Hi Alex,
On 2026-09-29 at 11:49:48 -0400, Alex Hung wrote:
> With glibc 2.43, string searches on const input return const pointers.
> Storing these results in char * variables causes compiler warnings.
> 
> The following warning is observed on Ubuntu 26.04 (wrapped):
> 
>   ../lib/igt_drm_fdinfo.c: In function 'parse_region':
>   ../lib/igt_drm_fdinfo.c:122:4: warning:
>     assignment discards 'const' qualifier from pointer target type
>     [-Wdiscarded-qualifiers]
> 
> Use const char * for read-only search results and preserve const in
> igt_get_dc6_counter() and its callers. Give strtoull() a separate
> end pointer in the fdinfo parser so its input pointer can remain
> const without a cast.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/i915/i915_dp.c   |  2 +-
>  lib/igt_core.c       |  2 +-
>  lib/igt_drm_fdinfo.c |  7 ++++---
>  lib/igt_pm.c         | 10 +++++-----
>  lib/igt_pm.h         |  2 +-
>  5 files changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/lib/i915/i915_dp.c b/lib/i915/i915_dp.c
> index 3d570f7cc..595010140 100644
> --- a/lib/i915/i915_dp.c
> +++ b/lib/i915/i915_dp.c
> @@ -49,7 +49,7 @@
>   */
>  static int i915_dp_parse_marked_value(const char *buf, char marked_char, int *result)
>  {
> -	char *marked_ptr, *val_ptr;
> +	const char *marked_ptr, *val_ptr;
>  
>  	/*
>  	 * Look for the marked character
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index d5dc5324d..b1d045161 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -1141,7 +1141,7 @@ static int common_init(int *argc, char **argv,
>  
>  	/* Check for conflicts and calculate space for passed-in extra long options */
>  	for  (extra_opt_count = 0; extra_long_opts && extra_long_opts[extra_opt_count].name; extra_opt_count++) {
> -		char *conflicting_char;
> +		const char *conflicting_char;
>  
>  		/* check for conflicts with standard long option values */
>  		for (i = 0; long_options[i].name; i++) {
> diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
> index 74a90c437..056eb2ca8 100644
> --- a/lib/igt_drm_fdinfo.c
> +++ b/lib/igt_drm_fdinfo.c
> @@ -114,7 +114,8 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
>  			const char **region_map, unsigned int region_entries,
>  			uint64_t *val)
>  {
> -	char *p;
> +	const char *p;
> +	char *end;
>  	ssize_t name_len;
>  	int found = -1;
>  	unsigned int i;
> @@ -160,8 +161,8 @@ static int parse_region(const char *name, struct drm_client_fdinfo *info,
>  		goto out;
>  
>  	p++;
> -	*val = strtoull(p, &p, 10);
> -	p = (char *)ignore_space(p);
> +	*val = strtoull(p, &end, 10);
> +	p = ignore_space(end);
>  	if (!*p)
>  		goto out;
>  
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 7905deb8d..1e3cc7757 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1555,7 +1555,7 @@ uint32_t igt_get_dc_counter(const char *dc_data)
>  {
>  	char *e;
>  	long ret;
> -	char *s = strchr(dc_data, ':');
> +	const char *s = strchr(dc_data, ':');
>  
>  	igt_assert(s);
>  	s++;
> @@ -1586,9 +1586,9 @@ bool igt_support_dc6(int debugfs_fd)
>   *
>   * Searches for DC6 counter information in the DMC info buffer.
>   */
> -char *igt_get_dc6_counter(const char *buf)
> +const char *igt_get_dc6_counter(const char *buf)
>  {
> -	char *str;
> +	const char *str;
>  
>  	str = strstr(buf, "DC5 -> DC6 count");
>  	if (!str)
> @@ -1607,7 +1607,7 @@ char *igt_get_dc6_counter(const char *buf)
>  uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag)
>  {
>  	char buf[4096];
> -	char *str;
> +	const char *str;
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info", buf, sizeof(buf));
>  
> @@ -1669,7 +1669,7 @@ const char *igt_dc_state_name(int dc_flag)
>   */
>  void igt_require_dc_counter(int debugfs_fd, int dc_flag)
>  {
> -	char *str;
> +	const char *str;
>  	char buf[4096];
>  
>  	igt_debugfs_simple_read(debugfs_fd, "i915_dmc_info",
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h
> index cd9dceb1e..328875f9c 100644
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -108,7 +108,7 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
>  void igt_pm_dpms_toggle(igt_output_t *output);
>  uint32_t igt_get_dc_counter(const char *dc_data);
>  bool igt_support_dc6(int debugfs_fd);
> -char *igt_get_dc6_counter(const char *buf);
> +const char *igt_get_dc6_counter(const char *buf);
>  uint32_t igt_read_dc_counter(int debugfs_fd, int dc_flag);
>  bool igt_dc_state_wait_entry(int debugfs_fd, int dc_flag, int prev_dc_count);
>  const char *igt_dc_state_name(int dc_flag);
> -- 
> 2.53.0
> 
