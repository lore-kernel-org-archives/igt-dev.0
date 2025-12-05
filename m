Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7416DD2F7FD
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 14:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892E10E144;
	Fri,  5 Dec 2025 14:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GyzhAT6/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC7710E144
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764944160; x=1796480160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Hh9d45/cqpo3i3NYON+6We8Fi3WErsXAjKmLi+5GLaY=;
 b=GyzhAT6/QbgHvGXEahjnDlef9FFwM5Cy84+LJ3O9LQ5Fz48pt2MJzTXn
 aP2DqkeDyORFD/Nu6oeOPe/ljJlXDrY5s3x1O8CovS6/rnmphMRu7KM8Q
 8hwQut4tp9S/49X1NMd6dXUyCUt+DNPTk69i6i+BKMlOpa8Qzj8nQVU6a
 /JaqvL4A7uX8AcQK60O3NqVb1mIxWOsYmrDRho1apQjQgqU8rGKXBaEVU
 2FPh35+0NFYiC9WAZQhp5scTXdWLvvsskh2q5wWaEGWGie8EXFMSNgPdV
 XiOOz/eA22NYYdYeiMdfobqAM9LCea9MjIQfpCWguw0FynAWnKVkudL10 w==;
X-CSE-ConnectionGUID: uoxikBmST3uD9L+/WnrSIg==
X-CSE-MsgGUID: FQTJbnJxRGqwTcPhkf2STw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77300957"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77300957"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 06:15:48 -0800
X-CSE-ConnectionGUID: YYCyittcQXywjUjHaI4YUw==
X-CSE-MsgGUID: D5auUBTgTXOM0LIEEqC5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="199785687"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 06:15:46 -0800
Date: Fri, 5 Dec 2025 15:15:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 krzysztof.karas@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t v6 1/3] tools/intel_gpu_frequency: Add support for
 get, set in order & vice-versa
Message-ID: <20251205141529.mrljimvasavpfcad@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com, krzysztof.karas@intel.com,
 x.wang@intel.com
References: <20251205093130.3428648-1-s.sebinraj@intel.com>
 <20251205093130.3428648-2-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251205093130.3428648-2-s.sebinraj@intel.com>
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

Hi S,
On 2025-12-05 at 15:01:28 +0530, S Sebinraj wrote:
> Add proper conditions for handling get and set in order (also
> vice-versa), as the same was failing before with the below error.
> To note here, In this scenario w.r.t set operation, only
> writable sysfs path has to be used ie. [min, max].
> 
> Error: set_frequency:
>         Assertion `fprintf(freq_info->filp, "%d", val) > 0' failed.
> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tools/intel_gpu_frequency.c | 63 ++++++++++++++++++++++++-------------
>  1 file changed, 41 insertions(+), 22 deletions(-)
> 
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index 6316c2e58..6b6997ab1 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -63,6 +63,11 @@ static struct freq_info info[] = {
>  	{ "RPn", "r" }
>  };
>  
> +struct parse_result {
> +	bool write;
> +	bool read;
> +};
> +
>  static char *
>  get_sysfs_path(const char *which)
>  {
> @@ -319,16 +324,17 @@ parse_version_or_help(int argc, char *argv[])
>  }
>  
>  /* Returns read or write operation */
> -static bool
> +static struct parse_result
>  parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  {
>  	int c, tmp;
> -	bool write = false;
> +	struct parse_result result = { .write = false, .read = false };
>  
>  	/* No args means -g" */
>  	if (argc == 1) {
>  		for (c = 0; c < act_upon_n; c++)
>  			act_upon[c] = true;
> +		result.read = true;
>  		goto done;
>  	}
>  	while (1) {
> @@ -351,24 +357,23 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  
>  		switch (c) {
>  		case 'g':
> -			if (write == true)
> -				fprintf(stderr, "Read and write operations not support simultaneously.\n");
>  			{
>  				int i;
>  				for (i = 0; i < act_upon_n; i++)
>  					act_upon[i] = true;
>  			}
> +			result.read = true;

imho this could lead to a mess, especially when mixing different
operations. What you think about renaming this function and just
do the desired action in place here and in other parsing places?
For both write and read, also later for setting freq for specific
GT like GT1?

One more thing to consider would be to allow printing all freq
for all Intel GPUs, be it i915 or Xe. New option for it could be
named -a|--all

Last thing - please keep old way of display only few freqs for
one operation, so it will keep compatibility with old behaviour.

Regards,
Kamil

>  			break;
>  		case 's':
>  			if (!optarg)
>  				usage(argv[0], EXIT_FAILURE);
>  
> -			if (write == true) {
> +			if (result.write == true) {
>  				fprintf(stderr, "Only one write may be specified at a time\n");
>  				exit(EXIT_FAILURE);
>  			}
>  
> -			write = true;
> +			result.write = true;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
>  			sscanf(optarg, "%d", &new_freq[MAX]);
> @@ -378,12 +383,12 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			if (!optarg)
>  				usage(argv[0], EXIT_FAILURE);
>  
> -			if (write == true) {
> +			if (result.write == true) {
>  				fprintf(stderr, "Only one write may be specified at a time\n");
>  				exit(EXIT_FAILURE);
>  			}
>  
> -			write = true;
> +			result.write = true;
>  
>  			if (!strncmp("min=", optarg, 4)) {
>  				act_upon[MIN] = true;
> @@ -408,7 +413,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
> +			result.write = true;
>  			break;
>  		case 'i': /* mIn */
>  			tmp = get_frequency(&info[RPn]);
> @@ -416,7 +421,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
> +			result.write = true;
>  			break;
>  		case 'm': /* max */
>  			tmp = get_frequency(&info[RP0]);
> @@ -424,14 +429,14 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
> +			result.write = true;
>  			break;
>  		case 'd': /* defaults */
>  			new_freq[MIN] = get_frequency(&info[RPn]);
>  			new_freq[MAX] = get_frequency(&info[RP0]);
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
> +			result.write = true;
>  			break;
>  		default:
>  			fprintf(stderr, "Error: unknown option\n");
> @@ -440,14 +445,15 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  	}
>  
>  done:
> -	return write;
> +	return result;
>  }
>  
>  int main(int argc, char *argv[])
>  {
>  
> -	bool write, fail, targets[MAX+1] = {false};
> +	bool fail, targets[MAX+1] = {false};
>  	int i, fd, try = 1, set_freq[MAX+1] = {0};
> +	struct parse_result result;
>  
>  	parse_version_or_help(argc, argv);
>  
> @@ -461,8 +467,8 @@ int main(int argc, char *argv[])
>  		close(fd);
>  	}
>  
> -	write = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
> -	fail = write;
> +	result = parse(argc, argv, targets, ARRAY_SIZE(targets), set_freq);
> +	fail = result.write;
>  
>  	/* If we've previously locked the frequency, we need to make sure to set things
>  	 * in the correct order, or else the operation will fail (ie. min = max = 200,
> @@ -478,18 +484,24 @@ again:
>  		fprintf(stderr, "Did not achieve desired freq.\n");
>  		exit(EXIT_FAILURE);
>  	}
> -	for (i = 0; i < ARRAY_SIZE(targets); i++) {
> -		if (targets[i] == false)
> -			continue;
>  
> -		if (write) {
> +	if (result.write) {
> +		/* only reset and set max & min act_upons flags if a read operation is also requested */
> +		if (result.read) {
> +			for (int j = 0; j < ARRAY_SIZE(targets); j++)
> +				targets[j] = false;
> +			targets[MIN] = true;
> +			targets[MAX] = true;
> +		}
> +
> +		for (i = 0; i < ARRAY_SIZE(targets); i++) {
> +			if (targets[i] == false)
> +				continue;
>  			set_frequency(&info[i], set_freq[i]);
>  			if (get_frequency(&info[i]) != set_freq[i])
>  				fail = true;
>  			else
>  				fail = false;
> -		} else {
> -			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
>  		}
>  	}
>  
> @@ -498,6 +510,13 @@ again:
>  		goto again;
>  	}
>  
> +	if (result.read) {
> +		for (i = 0; i < ARRAY_SIZE(targets); i++) {
> +			/* loop for all frequencies for get operations */
> +			printf("%s: %d MHz\n", info[i].name, get_frequency(&info[i]));
> +		}
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(targets); i++) {
>  		if (info[i].filp) {
>  			fclose(info[i].filp);
> -- 
> 2.43.0
> 
