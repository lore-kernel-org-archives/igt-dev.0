Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D82ECA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:23:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D0B10E9C5;
	Tue, 29 Sep 2026 10:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BU/w+zR4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C68410E9C5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790677360; x=1822213360;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b/Qhfcd92g75WmtXYOgowL4Hllpk5nDuxyX69GCqKBM=;
 b=BU/w+zR4twG+jfJ41YqOvOvglgCHt3wJzIQsoh16PDenEqh7bp3Bi5Tz
 hqxRZUDu0WDNQdwDMC5LaeBnn0gnt/lyN4Fa4plpshNGufFhnAxZTJzPg
 o0M+wqKvzkKQvGBCuYLAS31vNibMc7HqxQ6VZ+aYFsxKLddN/fHg5+krE
 rdGpemLnhbfVNFE2+89dxPlB6DhWCb4R4CJNKSKXRbUrOlKm8l9S/E6G6
 ak1AzIi92zYtkOOY1QGHpXgk9VfZ0VnmWsjQF38Po8x41U8vtaU/4SbDq
 Zwo4A5o7o8OTzPA1Kho0K9023OtweyD+CA8W9bcXlimZr79+23qPrvEsq Q==;
X-CSE-ConnectionGUID: 2+Gzdt+3QpK5zWS1Rr1QyQ==
X-CSE-MsgGUID: n1dmBcvgQuKGy0jGk99hRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90611635"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90611635"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:22:39 -0700
X-CSE-ConnectionGUID: qNfbg3mqTwCIaavVCpPv8g==
X-CSE-MsgGUID: nEX3pSc9R4ez5qXCAe4StQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="303291972"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:22:37 -0700
Date: Tue, 29 Sep 2026 12:22:35 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH 1/2] lib/tests: Preserve string const qualifiers
Message-ID: <20260929102235.vnxxxa72lmhgngz3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260925193642.2627600-1-alex.hung@amd.com>
 <20260925193642.2627600-2-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925193642.2627600-2-alex.hung@amd.com>
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
On 2026-09-25 at 13:36:41 -0600, Alex Hung wrote:

please split this into separate lib and tests changes, see below.

> With glibc 2.43, string searches on const input return const pointers.
> Storing these results in char * variables causes compiler warnings.
> For example, parse_region() reports:
> 
>   warning: assignment discards 'const' qualifier
>     from pointer target type [-Wdiscarded-qualifiers]
> 
> Use const char * for results that are only read. Keep char * in the MSM
> test where the buffer is modified. In the fdinfo parser, use a separate
> end pointer for strtoull() so the input pointer can remain const.
> 
> Assisted-by: Copilot:GPT-6-Astra
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  lib/i915/i915_dp.c         |  2 +-
>  lib/igt_core.c             |  2 +-
>  lib/igt_drm_fdinfo.c       |  7 ++++---
>  lib/igt_pm.c               | 10 +++++-----
>  lib/igt_pm.h               |  2 +-

Please make lib changes in one patch.

>  tests/intel/i915_pm_sseu.c |  8 ++++----

Make this in separate patch.

>  tests/msm/msm_mapping.c    |  6 +++---

And this should be last patch. Smaller changes will make backporting
a little easier.

Regards,
Kamil

>  7 files changed, 19 insertions(+), 18 deletions(-)
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
> diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
> index 5dd571a45..a4b92791c 100644
> --- a/tests/intel/i915_pm_sseu.c
> +++ b/tests/intel/i915_pm_sseu.c
> @@ -120,7 +120,7 @@ dbg_get_status_section(const char *title, char **first, char **last)
>  static bool
>  dbg_has_line(const char *first, const char *last, const char *name)
>  {
> -	char *pos = strstr(first, name);
> +	const char *pos = strstr(first, name);
>  
>  	return pos != NULL && pos < last;
>  }
> @@ -128,7 +128,7 @@ dbg_has_line(const char *first, const char *last, const char *name)
>  static int
>  dbg_get_int(const char *first, const char *last, const char *name)
>  {
> -	char *pos;
> +	const char *pos;
>  
>  	pos = strstr(first, name);
>  	igt_assert(pos != NULL);
> @@ -137,13 +137,13 @@ dbg_get_int(const char *first, const char *last, const char *name)
>  	pos += 2;
>  	igt_assert(pos != last);
>  
> -	return strtol(pos, &pos, 10);
> +	return strtol(pos, NULL, 10);
>  }
>  
>  static bool
>  dbg_get_bool(const char *first, const char *last, const char *name)
>  {
> -	char *pos;
> +	const char *pos;
>  
>  	pos = strstr(first, name);
>  	igt_assert(pos != NULL);
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index 05960627c..52b494abf 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -102,7 +102,7 @@ wait_for_stall_on_fault(int drm_fd)
>   * Helper to find named buffer address
>   */
>  
> -static const char *
> +static char *
>  get_line(char **buf)
>  {
>  	char *ret, *eol;
> @@ -123,7 +123,7 @@ get_line(char **buf)
>  }
>  
>  static bool
> -endswith(const char *str, const char *end)
> +endswith(char *str, const char *end)
>  {
>  	char *p = strstr(str, end);
>  
> @@ -166,7 +166,7 @@ get_bo_addr(int drm_fd, const char *name)
>  	 */
>  
>  	while (*p) {
> -		const char *line = get_line(&p);
> +		char *line = get_line(&p);
>  
>  		if (endswith(line, name)) {
>  			uint64_t addr, dummy;
> -- 
> 2.43.0
> 
