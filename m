Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27647D32D96
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 15:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89FB10EB52;
	Fri,  5 Dec 2025 15:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aiAoTUzy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ABE010EB50
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 15:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764947857; x=1796483857;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i9YrtLHd6XO0FNr+7gFqdCRzwAOofIfNBOQuD3d4iM8=;
 b=aiAoTUzyUCo7ZivvlLQ97/LVbF6tWiIC8NyW6TmjuquN1zJKMKjSq+4V
 CDgbVg25YQ6M6lsHuYB+KCVR1Qm+O3GOAJAW5aIzVhquDllMo9A3ll4jT
 HkkI/okW+e9ZrCiEp7zDfTHdP02tCAiSzgZeOcX5MtftDgHum3wr6oBFN
 w2yjfoj6R2LCf9mtJh3uqWf0TyhQSRf4bfs1j7fjUD4/C1rTecyFnMNDt
 yzrjkajpHFMq1TdB3TsNGF+6KeSUeSXgA3I3oF3Se5Lr60ogxK/j0lQLl
 bnK0MMhEyNJ38FJHSRp41v/W8aoWkuif4PpHZ8MlxC/sZrVtKAOSAdXVg g==;
X-CSE-ConnectionGUID: Q9Rb7k18R0a3EWVUKEbAFg==
X-CSE-MsgGUID: qQFROXCzQAGiZRcma/vB/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78448709"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="78448709"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 07:17:37 -0800
X-CSE-ConnectionGUID: tZuFMSg6SuWLIA4L6P7XoA==
X-CSE-MsgGUID: 7liCC2wxSsmzkvsuICnC9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195397476"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:17:34 -0800
Date: Fri, 5 Dec 2025 16:17:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t v6 3/3] tools/intel_gpu_frequency: Add Xe driver
 support
Message-ID: <20251205151732.ir4kv2ywn5pmla4z@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, krzysztof.karas@intel.com,
 x.wang@intel.com
References: <20251205093130.3428648-1-s.sebinraj@intel.com>
 <20251205093130.3428648-4-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251205093130.3428648-4-s.sebinraj@intel.com>
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
On 2025-12-05 at 15:01:30 +0530, S Sebinraj wrote:
> This change enhances intel_gpu_frequency to add compatibility with
> Xe drivers.
> 
> Key improvements:
> - Add runtime GT detection using xe_number_gt()
> - Auto-detect driver type using is_xe_device()
> - Driver-agnostic frequency management with unified interface
> 
> Driver-specific implementations:
> - Automatic frequency name mapping (RP1→rpe, RP0→rp0, RPn→rpn for Xe)
> 
> The tool now auto-detects Xe drivers and uses appropriate
> interfaces.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tools/intel_gpu_frequency.c | 81 ++++++++++++++++++++++++++++++-------
>  1 file changed, 66 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index 695a483fd..9eeaa1223 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -35,11 +35,13 @@
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
>  #include "intel_chipset.h"
> +#include "xe/xe_query.h"

Please do not use it, see below.

>  
>  #define VERSION "1.0"
>  #define SYSFS_PATH_MAX 96
>  
>  static int device, devid;
> +static bool is_xe;

This is a global, imho this should be a part of structure,
same for devid above.

>  
>  enum {
>  	CUR=0,
> @@ -61,10 +63,10 @@ struct freq_info {
>  static struct freq_info info[] = {
>  	{ "cur", "r"  },
>  	{ "min", "rb+" },
> -	{ "RP1", "r" },
> +	{ "RP1", "r" },    /* i915: RP1, xe: rpe */

imho better extend it into two variants, one for i915
second for Xe.

>  	{ "max", "rb+" },
> -	{ "RP0", "r" },
> -	{ "RPn", "r" }
> +	{ "RP0", "r" },    /* i915: RP0, xe: rp0 */
> +	{ "RPn", "r" }     /* i915: RPn, xe: rpn */
>  };
>  
>  typedef struct parse_result {
> @@ -72,21 +74,49 @@ typedef struct parse_result {
>  	bool read;
>  } parse_result_t;
>  
> +static int driver_get_num_gts(int fd)
> +{
> +	if (is_xe) {
> +		return xe_number_gt(fd);
> +	} else {
> +		return igt_sysfs_get_num_gt(fd);

Do not use any of this just read sysfs yourself.

Regards,
Kamil

> +	}
> +}
> +
>  static char *
>  get_sysfs_path(int fd, int gt_id, const char *which)
>  {
>  	static char path[SYSFS_PATH_MAX];
>  	char *gt_path;
>  	int path_len, ret;
> +	const char *freq_name;
> +
> +	/* Get driver-specific GT path */
> +	if (is_xe)
> +		gt_path = xe_sysfs_gt_path(fd, gt_id, path, sizeof(path));
> +	else
> +		gt_path = igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
>  
> -	gt_path = igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));
>  	if (gt_path == NULL) {
> -		fprintf(stderr, "igt_sysfs_gt_path returned NULL for GT%d\n", gt_id);
> +		fprintf(stderr, "sysfs_gt_path returned NULL for GT%d\n", gt_id);
>  		return NULL;
>  	}
> +
>  	path_len = strlen(gt_path);
> -	ret = snprintf(path + path_len, sizeof(path) - path_len,
> -		       "/rps_%s_freq_mhz", which);
> +
> +	if (is_xe) {
> +		/* Xe uses /freq0/ directory with different file names */
> +		freq_name = !strcmp(which, "RP1") ? "rpe" :
> +			    !strcmp(which, "RP0") ? "rp0" :
> +			    !strcmp(which, "RPn") ? "rpn" : which;
> +
> +		ret = snprintf(path + path_len, sizeof(path) - path_len,
> +			       "/freq0/%s_freq", freq_name);
> +	} else {
> +		/* i915 uses /rps_*_freq_mhz files */
> +		ret = snprintf(path + path_len, sizeof(path) - path_len,
> +			       "/rps_%s_freq_mhz", which);
> +	}
>  
>  	if (ret >= sizeof(path) - path_len) {
>  		fprintf(stderr, "Path truncated\n");
> @@ -140,6 +170,11 @@ is_intel_card(int card)
>  			found = 1;
>  			break;
>  		}
> +
> +		if (!strcmp(entry->d_name, "pci:xe")) {
> +			found = 1;
> +			break;
> +		}
>  	}
>  
>  	closedir(dirp);
> @@ -298,6 +333,8 @@ usage(const char *prog, int err)
>  	printf("   intel_gpu_frequency --get --gt 1\tGet frequencies for GT1\n");
>  	printf("   intel_gpu_frequency --list\t\tList all available GTs\n");
>  	printf("\n");
> +	printf("Auto-detects i915 vs Xe driver and uses appropriate interfaces.\n");
> +	printf("\n");
>  	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
>  	exit(err);
>  }
> @@ -417,7 +454,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
>  			}
>  			break;
>  		case 'e': /* efficient */
> -			if (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid)) {
> +			if (!is_xe && (IS_VALLEYVIEW(devid) || IS_CHERRYVIEW(devid))) {
>  				/* the LP parts have special efficient frequencies */
>  				fprintf(stderr,
>  					"FIXME: Warning efficient frequency information is incorrect.\n");
> @@ -533,8 +570,13 @@ static void list_available_gts(int fd, int num_gts)
>  	for (i = 0; i < num_gts; i++) {
>  		char path[SYSFS_PATH_MAX];
>  
> -		if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
> -			printf("  GT%d: %s\n", i, path);
> +		if (is_xe) {
> +			if (xe_sysfs_gt_path(fd, i, path, sizeof(path)))
> +				printf("  GT%d: %s\n", i, path);
> +		} else {
> +			if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
> +				printf("  GT%d: %s\n", i, path);
> +		}
>  	}
>  }
>  
> @@ -563,7 +605,7 @@ static void execute_frequency_operations(int argc, int fd, int specified_gt, par
>  		process_gt_frequencies(argc, fd, specified_gt, result, targets, set_freq);
>  	} else {
>  		/* Process all GTs */
> -		int num_gts = igt_sysfs_get_num_gt(fd);
> +		int num_gts = driver_get_num_gts(fd);
>  
>  		for (target_gt = 0; target_gt < num_gts; target_gt++)
>  			process_gt_frequencies(argc, fd, target_gt, result, targets, set_freq);
> @@ -647,10 +689,19 @@ int main(int argc, char *argv[])
>  	if (device < 0)
>  		exit_error("No Intel card found in /dev/dri\n", 0);
>  
> -	fd = __drm_open_driver(DRIVER_INTEL);
> -	devid = intel_get_drm_devid(fd);
> -	device = igt_device_get_card_index(fd);
> -	num_gts = igt_sysfs_get_num_gt(fd);
> +	fd = __drm_open_driver(DRIVER_INTEL | DRIVER_XE);
> +	is_xe = is_xe_device(fd);
> +
> +	if (is_xe) {
> +		igt_debug("Using Xe driver\n");
> +		device = igt_device_get_card_index(fd);
> +	} else {
> +		devid = intel_get_drm_devid(fd);
> +		device = igt_device_get_card_index(fd);
> +		igt_debug("Using i915 driver\n");
> +	}
> +
> +	num_gts = driver_get_num_gts(fd);
>  
>  	result = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq,
>  		      &specified_gt, &list_gts, fd);
> -- 
> 2.43.0
> 
