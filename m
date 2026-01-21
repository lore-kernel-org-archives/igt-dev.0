Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C278D4694A
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 15:29:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5284610E801;
	Wed, 21 Jan 2026 15:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WIzayIKj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F268E10E819
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769009344; x=1800545344;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/kUZISceQnZ+tfBDDTWhkT5zl90aflW2A5R4t0KeJpM=;
 b=WIzayIKjCYRT2WkRTfcE2WVO3iaMiJUCg5k+hfq1T2jVkBQxru4ltSKy
 TzZ5Fl3LVsBS0mBkKVqSGcFaalTVEa7TyUPfMDEPesBfRHUIQGZl+1R9K
 DP0wvZweaoX9HC4EioaA5TVPau70R2mmlG1BgOmXQZVAQAST2Tavsy1YD
 3catklqe4NKNkzB+1VOmOrGjGMmHsFDJkzKSTxjP0cgRCdeC+ny0r0NBx
 8/06U5l/ja4pBBS8P+TUo5ZXKdcbfpE5AJOQSuGoHw7kOCcYqmQgbRM6O
 U5Q8QyQ36/CA9fGgNlJw1xHCrlejb6wG78bCMIcq0VywJ9eXopQhFVmMd g==;
X-CSE-ConnectionGUID: 4U3cJwfISH6MxKwj1cPHPA==
X-CSE-MsgGUID: yWfuPPQaRYOWVhVWSeYrDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70151130"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="70151130"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 07:29:03 -0800
X-CSE-ConnectionGUID: tOqi1LmAQ5WzJpjC2TLyfA==
X-CSE-MsgGUID: sFixvUBKRge2i+47EkRqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; d="scan'208";a="206714639"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 07:29:01 -0800
Date: Wed, 21 Jan 2026 16:28:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, krzysztof.karas@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 Soham Purkait <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v5] tools/gputop: Add GPU frequencies to the client
 headers
Message-ID: <20260121152846.cag7mv7go3anufsa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 krzysztof.karas@intel.com, kamil.konieczny@intel.com,
 zbigniew.kempczynski@intel.com,
 Soham Purkait <soham.purkait@intel.com>
References: <20260121083424.99006-1-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260121083424.99006-1-s.sebinraj@intel.com>
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

Hi,
On 2026-01-21 at 14:04:24 +0530, S Sebinraj wrote:
> Enhance gputop to display GPU frequency information (current/actual)
> for each GT in the client header line alongside the DRM minor number.
> 
> Key changes:
> - Add get_gt_frequencies() function to read GT frequency values
> - Support both i915 and Xe drivers using appropriate sysfs paths
> - Display format: "DRM minor X  Freq(cur/act) GT0-freq/freq GT1-freq/freq"
> - Driver-agnostic sysfs access
> 
> The frequency information helps users monitor GPU performance states
> in real-time while observing client workload utilization.
> 
> Example output:
>   DRM minor 0          Freq(cur/act) GT0-1800/1800 GT1-400/400
>   DRM minor 128        Freq(cur/act) GT0-400/400 GT1-400/400
> 
> v2:
> - To use macro to suffix strings
> - To skip failure loops
> 
> v3:
> - To keep error logs
> 
> v4:
> - Removed RFC from Subject
> 
> v5:
> - Fallback to normal sysfs read instead of using lib api's
>   as it increased the dependencies highly

Thank you for this change.

> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> Tested-by: Karas Krzysztof <krzysztof.karas@intel.com>
> Reviewed-by: Karas Krzysztof <krzysztof.karas@intel.com>

When you made a big change which was not agreed by reviewer,
you should remove its 'Reviewed-by' from new version. Same
apply for the Tested-by.

> ---
>  tools/gputop.c | 145 ++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 143 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/gputop.c b/tools/gputop.c
> index f577a1750..fb6c9e13c 100644
> --- a/tools/gputop.c
> +++ b/tools/gputop.c
> @@ -30,13 +30,20 @@
>  #include "igt_drm_clients.h"
>  #include "igt_drm_fdinfo.h"
>  #include "igt_profiling.h"
> -#include "drmtest.h"
>  
>  enum utilization_type {
>  	UTILIZATION_TYPE_ENGINE_TIME,
>  	UTILIZATION_TYPE_TOTAL_CYCLES,
>  };
>  
> +#define XE_FREQ_CUR_SUFFIX "/freq0/cur_freq"
> +#define XE_FREQ_ACT_SUFFIX "/freq0/act_freq"
> +#define I915_FREQ_CUR_SUFFIX "/rps_cur_freq_mhz"
> +#define I915_FREQ_ACT_SUFFIX "/rps_act_freq_mhz"
> +
> +#define MAX_GTS 8
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +

These are driver-specific and should go into xe_gputop.c
in a patchseries sent by Soham, see
https://patchwork.freedesktop.org/series/158161/
Close any open drm device after engine initialization in GPUTOP

+cc Soham Purkait <soham.purkait@intel.com>

>  static const char *bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
>  
>  #define ANSI_HEADER "\033[7m"
> @@ -76,17 +83,151 @@ static void print_percentage_bar(double percent, int max_len)
>  	putchar('|');
>  }
>  
> +/* Detect if this is a Xe driver by checking for Xe-specific sysfs structure */
> +static bool detect_xe_driver(unsigned int drm_minor)
> +{
> +	char path[256];
> +	struct stat st;
> +
> +	/* Xe driver has device/tile0 directory */
> +	snprintf(path, sizeof(path), "/sys/class/drm/card%u/device/tile0", drm_minor);
> +	return (stat(path, &st) == 0 && S_ISDIR(st.st_mode));
> +}
> +
> +/* Count the number of GTs by checking which gt* directories exist */
> +static int get_num_gts(unsigned int drm_minor, bool is_xe)
> +{
> +	char path[256];
> +	struct stat st;
> +	int gt_count = 0;
> +
> +	/* Check for gt0, gt1, gt2, etc. up to a reasonable maximum */
> +	for (int i = 0; i < MAX_GTS; i++) {
> +		if (is_xe)
> +			/* For Xe, all GTs are under tile0 */
> +			snprintf(path, sizeof(path), "/sys/class/drm/card%u/device/tile0/gt%d",
> +				 drm_minor, i);
> +		else
> +			snprintf(path, sizeof(path), "/sys/class/drm/card%u/gt/gt%d",
> +				 drm_minor, i);
> +
> +		if (stat(path, &st) == 0 && S_ISDIR(st.st_mode))
> +			gt_count++;
> +		else
> +			break;  /* Assume GTs are numbered sequentially */
> +	}
> +
> +	return gt_count > 0 ? gt_count : 1;  /* At least 1 GT should exist */
> +}
> +
> +/* Read a single frequency value from sysfs */
> +static bool read_freq_value(const char *path, unsigned int *freq)
> +{
> +	FILE *fp;
> +	char buf[32];
> +	bool success = false;
> +
> +	fp = fopen(path, "r");
> +	if (fp) {
> +		if (fgets(buf, sizeof(buf), fp)) {
> +			*freq = atoi(buf);
> +			success = true;
> +		}
> +		fclose(fp);
> +	}
> +
> +	return success;
> +}
> +
> +static char *get_gt_frequencies(unsigned int drm_minor)
> +{
> +	char freq_str[512] = "";
> +	char gt_info[64];
> +	int num_gts;
> +	int gt;
> +	bool is_xe;
> +	bool first = true;
> +
> +	/* Detect driver type from sysfs structure */
> +	is_xe = detect_xe_driver(drm_minor);
> +
> +	/* Get GT count from sysfs */
> +	num_gts = get_num_gts(drm_minor, is_xe);
> +	if (num_gts <= 0)
> +		return NULL;
> +
> +	/* Read frequencies for each GT */
> +	for (gt = 0; gt < num_gts; gt++) {
> +		char freq_path[256];
> +		unsigned int cur_freq = 0, act_freq = 0;
> +		bool has_cur = false, has_act = false;
> +
> +		/* Read current/requested frequency */
> +		if (is_xe)
> +			snprintf(freq_path, sizeof(freq_path),
> +				 "/sys/class/drm/card%u/device/tile0/gt%d%s",
> +				 drm_minor, gt, XE_FREQ_CUR_SUFFIX);
> +		else
> +			snprintf(freq_path, sizeof(freq_path),
> +				 "/sys/class/drm/card%u/gt/gt%d%s",
> +				 drm_minor, gt, I915_FREQ_CUR_SUFFIX);
> +
> +		has_cur = read_freq_value(freq_path, &cur_freq);
> +
> +		/* Read actual frequency */
> +		if (is_xe)
> +			snprintf(freq_path, sizeof(freq_path),
> +				 "/sys/class/drm/card%u/device/tile0/gt%d%s",
> +				 drm_minor, gt, XE_FREQ_ACT_SUFFIX);
> +		else
> +			snprintf(freq_path, sizeof(freq_path),
> +				 "/sys/class/drm/card%u/gt/gt%d%s",
> +				 drm_minor, gt, I915_FREQ_ACT_SUFFIX);
> +
> +		has_act = read_freq_value(freq_path, &act_freq);
> +
> +		/* Skip this GT if we couldn't read any frequency */
> +		if (!has_cur && !has_act)
> +			continue;
> +
> +		/* Append to frequency string */
> +		if (!first)
> +			strcat(freq_str, " ");
> +		else
> +			first = false;
> +
> +		snprintf(gt_info, sizeof(gt_info), "GT%d-%u/%u", gt, cur_freq, act_freq);
> +		strcat(freq_str, gt_info);
> +	}
> +
> +	if (strlen(freq_str) > 0)
> +		return strdup(freq_str);
> +
> +	return NULL;
> +}
> +
>  static int
>  print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
>  		    int *engine_w)
>  {
>  	int ret, len;
> +	char *freq_info = NULL;
>  
>  	if (lines++ >= con_h)
>  		return lines;
>  
>  	printf(ANSI_HEADER);
> -	ret = printf("DRM minor %u", c->drm_minor);
> +
> +	/* Get frequency information */
> +	freq_info = get_gt_frequencies(c->drm_minor);

Better:
	freq_info = get_frequencies(c->drm_minor);

> +
> +	if (freq_info) {
> +		ret = printf("DRM minor %u          Freq(cur/act) %s", c->drm_minor, freq_info);

It looks driver dependent, imho better:

ret = printf("DRM minor %u  Frequency(MHz) %s", c->drm_minor, freq_info);

Regards,
Kamil

> +		free(freq_info);
> +	} else {
> +		ret = printf("DRM minor %u", c->drm_minor);
> +	}
> +
>  	n_spaces(con_w - ret);
>  
>  	if (lines++ >= con_h)
> -- 
> 2.43.0
> 
