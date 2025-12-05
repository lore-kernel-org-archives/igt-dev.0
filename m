Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852CD32D98
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 15:03:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359C010EB2C;
	Fri,  5 Dec 2025 15:03:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPgI13nL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A577610EB2C
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 15:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764947024; x=1796483024;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LID1btu6ew/h+66EJulIdgT5Ivzf+XrY+vywKfpQED8=;
 b=jPgI13nLDb3WrBQ+5NBcpImSnk33esM5qIZSC/1tffG/i0yCQC/iAVMH
 paaDCKpfNIxd6NnzqDK3xtX01GFhgNnNbBu+7o9qRmeFCq44SJKDI+Gb1
 pmJVl7/k77gsLZrqx+v9wh6hFkr3V4HQ1n3xIt4D2QH1FtyyXIIwiaTQn
 YEzvY8QNdwT8zHMKyYKE0a6binZ91lpux2aYcaQuSPPg4IJomH73yhvke
 RWIxLS9FJo4qDyrYifM54H4zHQd884tR6IaGOmz/dgBnUXd6ZFcvfhwqw
 Cv81Tvn5kEsLRVgglguddAMrZAOlfuIAlbyRykCievnGsjkJW5v2H+RMi g==;
X-CSE-ConnectionGUID: 9lSveWDSSu6NWlfXUpwT5A==
X-CSE-MsgGUID: svFxwYiIRy+we8jSRIb8vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77599263"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77599263"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 07:03:43 -0800
X-CSE-ConnectionGUID: eQhgpd0STZ60IF8TlVifOw==
X-CSE-MsgGUID: IA9AMrvmRrWbMJtwOnSOPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195755098"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 07:03:42 -0800
Date: Fri, 5 Dec 2025 16:03:39 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t v6 2/3] tools/intel_gpu_frequency: Add multi-GT
 support
Message-ID: <20251205150339.qhe6scoeockm3jlo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, krzysztof.karas@intel.com,
 x.wang@intel.com
References: <20251205093130.3428648-1-s.sebinraj@intel.com>
 <20251205093130.3428648-3-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205093130.3428648-3-s.sebinraj@intel.com>
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
On 2025-12-05 at 15:01:29 +0530, S Sebinraj wrote:
> This change enhances intel_gpu_frequency to support Intel GPUs
> with multiple Graphics Technology (GT) units.
> 
> Key improvements:
> - Add runtime GT detection using igt_sysfs_get_num_gt()
> - New --gt/-t option to specify target GT (defaults to GT0)
> - New --list/-l option to display available GTs
> - Update sysfs path generation to use igt_sysfs_gt_path()
> - Update the man page for new options
> 
> Usage examples:
>   intel_gpu_frequency --get --gt 1     # Get GT1 frequencies
>   intel_gpu_frequency --set 400 --gt 0 # Set GT0 frequency
>   intel_gpu_frequency --list           # List available GTs
> 
> The tool now dynamically detects available GTs at runtime and provides
> error messages when invalid GT numbers are specified. Also by default
> for set / get operations it acts upon all available GTs unless
> specified.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> Signed-off-by: Jeevaka Badrappan <jeevaka.badrappan@intel.com>
> ---
>  man/intel_gpu_frequency.rst |  34 ++++-
>  tools/intel_gpu_frequency.c | 270 ++++++++++++++++++++++++++++--------
>  2 files changed, 238 insertions(+), 66 deletions(-)
> 
> diff --git a/man/intel_gpu_frequency.rst b/man/intel_gpu_frequency.rst
> index 92f039645..0daa22ba5 100644
> --- a/man/intel_gpu_frequency.rst
> +++ b/man/intel_gpu_frequency.rst
> @@ -38,7 +38,8 @@ OPTIONS
>      Lock frequency to the most efficient frequency.
>  
>  -g, --get
> -    Get all the current frequency settings.
> +    Get all the current frequency settings. Displays results
> +    showing all GTs with their corresponding frequencies.
>  
>  -s FREQUENCY, --set=FREQUENCY
>      Lock frequency to an absolute value (MHz).
> @@ -55,6 +56,14 @@ OPTIONS
>  -d, --defaults
>      Return the system to hardware defaults.
>  
> +-t GT_NUMBER, --gt=GT_NUMBER
> +    Specify which GT (Graphics Technology) to operate on. GT numbers start from 0.
> +    If not specified, operations apply to all available GTs. Use with --list
> +    to see available GTs.
> +
> +-l, --list
> +    List all available GTs in the system with their sysfs paths.
> +
>  -h, --help
>      Show help.
>  
> @@ -64,14 +73,29 @@ OPTIONS
>  EXAMPLES
>  ========
>  
> -intel_gpu_frequency -gmin,cur
> -    Get the current and minimum frequency.
> +intel_gpu_frequency
> +    Display frequency information for all GTs in table format.
> +
> +intel_gpu_frequency -g
> +    Get frequency settings for all GTs (displays in table format).
> +
> +intel_gpu_frequency --list
> +    List all available GTs in the system.
> +
> +intel_gpu_frequency --get --gt 1
> +    Get frequency settings for GT1 only.

This will make it hard to apply more commands in same line,
imho better way would be to have it like:

intel_gpu_frequency -g
    Get frequency settings for GT0.
so this will keep old behaviour.

intel_gpu_frequency -g --gt 1
    Print frequencies for GT0 and then GT1.

intel_gpu_frequency --gt 1 -g
    Print frequency for GT1.

>  
>  intel_gpu_frequency -s 400
> -    Lock frequency to 400Mhz.
> +    Lock frequency to 400Mhz for all GTs.
> +
> +intel_gpu_frequency -s 400 --gt 0
> +    Lock frequency to 400Mhz for GT0 only.
>  
>  intel_gpu_frequency -c max=750
> -    Set the max frequency to 750MHz
> +    Set the max frequency to 750MHz for all GTs.

This should be reserved to only one selected GT.
What about:

intel_gpu_frequency -a -c max
    Set max freq for all tiles and GTs.

> -    Set the max frequency to 750MHz
> +    Set the max frequency to 750MHz for all GTs.
> +
> +intel_gpu_frequency -c max=750 --gt 1
> +    Set the max frequency to 750MHz for GT1 only.
>  
>  REPORTING BUGS
>  ==============
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index 6b6997ab1..695a483fd 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -26,14 +26,18 @@
>  #include <fcntl.h>
>  #include <getopt.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
>  #include <time.h>
>  #include <unistd.h>
>  
>  #include "drmtest.h"
>  #include "igt_device.h"
> +#include "igt_sysfs.h"

This is not a good choice, also note drmtest.h above should
be removed as well.

>  #include "intel_chipset.h"
>  
>  #define VERSION "1.0"
> +#define SYSFS_PATH_MAX 96
>  
>  static int device, devid;
>  
> @@ -63,22 +67,31 @@ static struct freq_info info[] = {
>  	{ "RPn", "r" }
>  };
>  
> -struct parse_result {
> +typedef struct parse_result {
>  	bool write;
>  	bool read;
> -};
> +} parse_result_t;
>  
>  static char *
> -get_sysfs_path(const char *which)
> +get_sysfs_path(int fd, int gt_id, const char *which)
>  {
> -	static const char fmt[] = "/sys/class/drm/card%1d/gt_%3s_freq_mhz";
> -	char *path;
> -	int ret;
> +	static char path[SYSFS_PATH_MAX];
> +	char *gt_path;
> +	int path_len, ret;
> +
> +	gt_path = igt_sysfs_gt_path(fd, gt_id, path, sizeof(path));

This library function uses fd for opened card/render, imho
we should not using it. I will explain reasons in reply to 3rd
patch.

Reagrds,
Kamil

> +	if (gt_path == NULL) {
> +		fprintf(stderr, "igt_sysfs_gt_path returned NULL for GT%d\n", gt_id);
> +		return NULL;
> +	}
> +	path_len = strlen(gt_path);
> +	ret = snprintf(path + path_len, sizeof(path) - path_len,
> +		       "/rps_%s_freq_mhz", which);
>  
> -#define STATIC_STRLEN(string) (sizeof(string) / sizeof(string [0]))
> -	ret = asprintf(&path, fmt, device, which);
> -	assert(ret == (STATIC_STRLEN(fmt) - 3));
> -#undef STATIC_STRLEN
> +	if (ret >= sizeof(path) - path_len) {
> +		fprintf(stderr, "Path truncated\n");
> +		return NULL;
> +	}
>  
>  	return path;
>  }
> @@ -193,28 +206,24 @@ get_intel_card(void)
>  }
>  
>  static void
> -initialize_read_info(struct freq_info *freq_info)
> +initialize_read_info(struct freq_info *freq_info, int fd, int gt_id)
>  {
>  	if (freq_info->filp)
> -		return;
> +		fclose(freq_info->filp);
>  
> -	freq_info->path = get_sysfs_path(freq_info->name);
> +	freq_info->path = get_sysfs_path(fd, gt_id, freq_info->name);
>  	assert(freq_info->path);
>  	freq_info->filp = fopen(freq_info->path, "r");
>  	assert(freq_info->filp);
>  }
>  
>  static void
> -initialize_write_info(struct freq_info *freq_info)
> +initialize_write_info(struct freq_info *freq_info, int fd, int gt_id)
>  {
> -	if (freq_info->write)
> -		return;
> -
>  	if (freq_info->filp)
>  		fclose(freq_info->filp);
> -	else
> -		freq_info->path = get_sysfs_path(freq_info->name);
>  
> +	freq_info->path = get_sysfs_path(fd, gt_id, freq_info->name);
>  	assert(freq_info->path);
>  	freq_info->filp = fopen(freq_info->path, freq_info->mode);
>  	if (!(freq_info->filp)) {
> @@ -222,8 +231,6 @@ initialize_write_info(struct freq_info *freq_info)
>  			freq_info->path, freq_info->mode, errno, strerror(errno));
>  		exit(EXIT_FAILURE);
>  	}
> -
> -	freq_info->write = true;
>  }
>  
>  static void wait_freq_settle(void)
> @@ -236,20 +243,20 @@ static void wait_freq_settle(void)
>  	clock_nanosleep(CLOCK_MONOTONIC, 0, &ts, NULL);
>  }
>  
> -static void set_frequency(struct freq_info *freq_info, int val)
> +static void set_frequency(struct freq_info *freq_info, int val, int fd, int gt_id)
>  {
> -	initialize_write_info(freq_info);
> +	initialize_write_info(freq_info, fd, gt_id);
>  	rewind(freq_info->filp);
>  	assert(fprintf(freq_info->filp, "%d", val) > 0);
>  
>  	wait_freq_settle();
>  }
>  
> -static int get_frequency(struct freq_info *freq_info)
> +static int get_frequency(struct freq_info *freq_info, int fd, int gt_id)
>  {
>  	int val;
>  
> -	initialize_read_info(freq_info);
> +	initialize_read_info(freq_info, fd, gt_id);
>  	rewind(freq_info->filp);
>  	assert(fscanf(freq_info->filp, "%d", &val)==1);
>  
> @@ -270,7 +277,7 @@ usage(const char *prog, int err)
>  	const char *shortname = get_shortname(prog);
>  
>  	printf("%s A program to manipulate Intel GPU frequencies.\n\n", shortname);
> -	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz]\n\n", shortname);
> +	printf("Usage: %s [-e] [--min | --max] [--get] [--set frequency_mhz] [--gt GT_NUM] [--list]\n\n", shortname);
>  	printf("Options: \n");
>  	printf("  -e		Lock frequency to the most efficient frequency\n");
>  	printf("  -g, --get     Get all the frequency settings\n");
> @@ -279,6 +286,8 @@ usage(const char *prog, int err)
>  	printf("  -m  --max     Lock frequency to max frequency\n");
>  	printf("  -i  --min     Lock frequency to min (never a good idea, DEBUG ONLY)\n");
>  	printf("  -d  --defaults  Return the system to hardware defaults\n");
> +	printf("  -t  --gt      Specify GT number to operate on (default: all GTs)\n");
> +	printf("  -l  --list    List all available GTs\n");
>  	printf("  -h  --help    Returns this\n");
>  	printf("  -v  --version Version\n");
>  	printf("\n");
> @@ -286,6 +295,8 @@ usage(const char *prog, int err)
>  	printf("   intel_gpu_frequency --get\t\tGet the current and minimum frequency\n");
>  	printf("   intel_gpu_frequency --set 400\tLock frequency to 400Mhz\n");
>  	printf("   intel_gpu_frequency --custom max=750\tSet the max frequency to 750MHz\n");
> +	printf("   intel_gpu_frequency --get --gt 1\tGet frequencies for GT1\n");
> +	printf("   intel_gpu_frequency --list\t\tList all available GTs\n");
>  	printf("\n");
>  	printf("Report bugs to https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues\n");
>  	exit(err);
> @@ -324,11 +335,13 @@ parse_version_or_help(int argc, char *argv[])
>  }
>  
>  /* Returns read or write operation */
> -static struct parse_result
> -parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
> +static parse_result_t
> +parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq,
> +      int *specified_gt, bool *list_gts, int fd)
>  {
>  	int c, tmp;
> -	struct parse_result result = { .write = false, .read = false };
> +	parse_result_t result = { .write = false, .read = false };
> +	bool gtt_specified = false;
>  
>  	/* No args means -g" */
>  	if (argc == 1) {
> @@ -346,12 +359,14 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			{ "min", no_argument, NULL, 'i' },
>  			{ "max", no_argument, NULL, 'm' },
>  			{ "defaults", no_argument, NULL, 'd' },
> +			{ "gt", required_argument, NULL, 't' },
> +			{ "list", no_argument, NULL, 'l' },
>  			{ "help", no_argument, NULL, 'h' },
>  			{ "version", no_argument, NULL, 'v' },
>  			{ NULL, 0, NULL, 0}
>  		};
>  
> -		c = getopt_long(argc, argv, "egs:c:midh", long_options, &option_index);
> +		c = getopt_long(argc, argv, "egs:c:midt:lhv", long_options, &option_index);
>  		if (c == -1)
>  			break;
>  
> @@ -408,7 +423,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  					"FIXME: Warning efficient frequency information is incorrect.\n");
>  				exit(EXIT_FAILURE);
>  			}
> -			tmp = get_frequency(&info[EFF]);
> +			tmp = get_frequency(&info[EFF], fd,
> +					    *specified_gt >= 0 ? *specified_gt : 0);
>  			new_freq[MIN] = tmp;
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
> @@ -416,7 +432,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			result.write = true;
>  			break;
>  		case 'i': /* mIn */
> -			tmp = get_frequency(&info[RPn]);
> +			tmp = get_frequency(&info[RPn], fd,
> +					    *specified_gt >= 0 ? *specified_gt : 0);
>  			new_freq[MIN] = tmp;
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
> @@ -424,7 +441,8 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			result.write = true;
>  			break;
>  		case 'm': /* max */
> -			tmp = get_frequency(&info[RP0]);
> +			tmp = get_frequency(&info[RP0], fd,
> +					    *specified_gt >= 0 ? *specified_gt : 0);
>  			new_freq[MIN] = tmp;
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
> @@ -432,12 +450,36 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			result.write = true;
>  			break;
>  		case 'd': /* defaults */
> -			new_freq[MIN] = get_frequency(&info[RPn]);
> -			new_freq[MAX] = get_frequency(&info[RP0]);
> +			new_freq[MIN] = get_frequency(&info[RPn], fd,
> +						      *specified_gt >= 0 ? *specified_gt : 0);
> +			new_freq[MAX] = get_frequency(&info[RP0], fd,
> +						      *specified_gt >= 0 ? *specified_gt : 0);
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
>  			result.write = true;
>  			break;
> +		case 't': /* gt */
> +			if (!optarg)
> +				usage(argv[0], EXIT_FAILURE);
> +
> +			if (gtt_specified) {
> +				fprintf(stderr, "Only one GT may be specified at a time\n");
> +				exit(EXIT_FAILURE);
> +			}
> +			*specified_gt = atoi(optarg);
> +			if (*specified_gt < 0) {
> +				fprintf(stderr, "Invalid GT number: %d\n", *specified_gt);
> +				exit(EXIT_FAILURE);
> +			}
> +			gtt_specified = true;
> +			break;
> +		case 'l': /* list */
> +			*list_gts = true;
> +			break;
> +		case 'v':
> +			version(argv[0]);
> +			exit(0);
> +		case 'h':
>  		default:
>  			fprintf(stderr, "Error: unknown option\n");
>  			usage(argv[0], EXIT_FAILURE);
> @@ -448,27 +490,92 @@ done:
>  	return result;
>  }
>  
> -int main(int argc, char *argv[])
> +static void print_freq_table_header(void)
>  {
> +	printf("%-15s %-15s %6s %6s %6s %6s %6s %6s %3s\n",
> +	       "card/tile/GT", "BDF", "min", "curr", "RP1", "max", "RP0", "RPn", "(MHz)");
> +	printf("%-15s %-15s %6s %6s %6s %6s %6s %6s\n",
> +	       "------------", "------------", "----", "----", "----", "----", "----", "----");
> +}
>  
> -	bool fail, targets[MAX+1] = {false};
> -	int i, fd, try = 1, set_freq[MAX+1] = {0};
> -	struct parse_result result;
> +static void print_freq_table_row(int fd, int card, int gt_id)
> +{
> +	char bdf[16] = "N/A";
> +	char gt_label[16];
> +	int freqs[ARRAY_SIZE(info)];
> +	int i;
> +
> +	/* Get BDF (Bus:Device.Function) for this device */
> +	igt_device_get_pci_slot_name(fd, bdf);
> +
> +	/* Format GT label as card/tile/GT */
> +	snprintf(gt_label, sizeof(gt_label), "%d/t0/GT%d", card, gt_id);
> +
> +	/* Read all frequencies */
> +	for (i = 0; i < ARRAY_SIZE(info); i++)
> +		freqs[i] = get_frequency(&info[i], fd, gt_id);
> +
> +	/* Print the row: GT label, BDF, and all frequencies */
> +	printf("%-15s %-15s %6d %6d %6d %6d %6d %6d\n",
> +	       gt_label, bdf,
> +	       freqs[MIN], freqs[CUR], freqs[EFF],
> +	       freqs[MAX], freqs[RP0], freqs[RPn]);
> +}
>  
> -	parse_version_or_help(argc, argv);
> +static void process_gt_frequencies(int argc, int fd, int gt_id, parse_result_t result,
> +						bool *targets, int *set_freq);
>  
> -	device = get_intel_card();
> -	if (device < 0)
> -		exit_error("No Intel card found in /dev/dri\n", 0);
> +static void list_available_gts(int fd, int num_gts)
> +{
> +	int i;
>  
> -	fd = __drm_open_driver(DRIVER_INTEL);
> -	if (fd >= 0) {
> -		devid = intel_get_drm_devid(fd);
> -		close(fd);
> +	printf("Available GTs: %d\n", num_gts);
> +	for (i = 0; i < num_gts; i++) {
> +		char path[SYSFS_PATH_MAX];
> +
> +		if (igt_sysfs_gt_path(fd, i, path, sizeof(path)))
> +			printf("  GT%d: %s\n", i, path);
> +	}
> +}
> +
> +static void validate_specified_gt(int fd, int specified_gt, int num_gts)
> +{
> +	if (specified_gt >= 0) {
> +		if (specified_gt >= num_gts) {
> +			fprintf(stderr, "Error: GT%d does not exist. Available GTs: 0-%d\n",
> +				specified_gt, num_gts - 1);
> +			close(fd);
> +			exit(EXIT_FAILURE);
> +		}
> +		igt_debug("Operating on GT%d (Total GTs: %d)\n", specified_gt, num_gts);
> +	} else {
> +		igt_debug("Operating on all GTs (Total GTs: %d)\n", num_gts);
> +	}
> +}
> +
> +static void execute_frequency_operations(int argc, int fd, int specified_gt, parse_result_t result,
> +								bool *targets, int *set_freq)
> +{
> +	int target_gt;
> +
> +	if (specified_gt >= 0) {
> +		/* Process single specified GT */
> +		process_gt_frequencies(argc, fd, specified_gt, result, targets, set_freq);
> +	} else {
> +		/* Process all GTs */
> +		int num_gts = igt_sysfs_get_num_gt(fd);
> +
> +		for (target_gt = 0; target_gt < num_gts; target_gt++)
> +			process_gt_frequencies(argc, fd, target_gt, result, targets, set_freq);
>  	}
> +}
>  
> -	result = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
> -	fail = result.write;
> +static void process_gt_frequencies(int argc, int fd, int gt_id, parse_result_t result,
> +						bool *targets, int *set_freq)
> +{
> +	int i, try = 1;
> +	bool fail = result.write;
> +	static bool table_header_printed = false;
>  
>  	/* If we've previously locked the frequency, we need to make sure to set things
>  	 * in the correct order, or else the operation will fail (ie. min = max = 200,
> @@ -481,24 +588,27 @@ int main(int argc, char *argv[])
>  	 */
>  again:
>  	if (try > 2) {
> -		fprintf(stderr, "Did not achieve desired freq.\n");
> +		fprintf(stderr, "Did not achieve desired freq on GT%d.\n", gt_id);
>  		exit(EXIT_FAILURE);
>  	}
>  
>  	if (result.write) {
> -		/* only reset and set max & min act_upons flags if a read operation is also requested */
> -		if (result.read) {
> -			for (int j = 0; j < ARRAY_SIZE(targets); j++)
> +		/* only reset and set max & min act_upons flags
> +		 * if a read operation is also requested
> +		 */
> +		if (result.read != false) {
> +			for (int j = 0; j < ARRAY_SIZE(info); j++)
>  				targets[j] = false;
>  			targets[MIN] = true;
>  			targets[MAX] = true;
>  		}
>  
> -		for (i = 0; i < ARRAY_SIZE(targets); i++) {
> +		for (i = 0; i < ARRAY_SIZE(info); i++) {
>  			if (targets[i] == false)
>  				continue;
> -			set_frequency(&info[i], set_freq[i]);
> -			if (get_frequency(&info[i]) != set_freq[i])
> +
> +			set_frequency(&info[i], set_freq[i], fd, gt_id);
> +			if (get_frequency(&info[i], fd, gt_id) != set_freq[i])
>  				fail = true;
>  			else
>  				fail = false;
> @@ -510,19 +620,57 @@ again:
>  		goto again;
>  	}
>  
> -	if (result.read) {
> -		for (i = 0; i < ARRAY_SIZE(targets); i++) {
> -			/* loop for all frequencies for get operations */
> -			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
> +	if (result.read || argc == 1) {
> +		/* Print table header only once for all GTs */
> +		if (!table_header_printed) {
> +			print_freq_table_header();
> +			table_header_printed = true;
>  		}
> +
> +		/* Print frequency row for this GT */
> +		print_freq_table_row(fd, device, gt_id);
> +	}
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +
> +	bool list_gts = false, targets[MAX+1] = {false};
> +	int i, fd, set_freq[MAX+1] = {0};
> +	int specified_gt = -1;
> +	int num_gts;
> +	parse_result_t result;
> +
> +	parse_version_or_help(argc, argv);
> +
> +	device = get_intel_card();
> +	if (device < 0)
> +		exit_error("No Intel card found in /dev/dri\n", 0);
> +
> +	fd = __drm_open_driver(DRIVER_INTEL);
> +	devid = intel_get_drm_devid(fd);
> +	device = igt_device_get_card_index(fd);
> +	num_gts = igt_sysfs_get_num_gt(fd);
> +
> +	result = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq,
> +		      &specified_gt, &list_gts, fd);
> +
> +	if (list_gts) {
> +		list_available_gts(fd, num_gts);
> +		close(fd);
> +		return EXIT_SUCCESS;
>  	}
>  
> +	validate_specified_gt(fd, specified_gt, num_gts);
> +
> +	execute_frequency_operations(argc, fd, specified_gt, result, targets, set_freq);
> +
>  	for (i = 0; i < ARRAY_SIZE(targets); i++) {
>  		if (info[i].filp) {
>  			fclose(info[i].filp);
> -			free(info[i].path);
>  		}
>  	}
>  
> +	close(fd);
>  	return EXIT_SUCCESS;
>  }
> -- 
> 2.43.0
> 
