Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ABBD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 16:44:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E9B10E3F9;
	Mon,  1 Dec 2025 16:44:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fd3yXuO1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183CE10E2BB
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764607476; x=1796143476;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mLB1Om1xKnSPKptTOEdFaJhnd7iLu/KpjQQLPqCv9NY=;
 b=Fd3yXuO1m1QN6r9KTzS0ICIXKTTdaUETazSMWAGdOLA/xKnZJ52+rZ3w
 nGnvVnD4wNO0KM5lHt2P0lKK6cFQOvS+ShSJf9krCbuA7lZEGaWBI0qL9
 uGCM59/ePSdkfkViLj44wKIHsR+upvKHmKH+cepgAhwinXKm7j6q1Nj58
 bR1rEdkDOrPqBP0Ir1eKWuTzPV5OIjeTTSaUF7gMaFIlUJGsV4eEPtBcq
 sGqXlfYACLfay69zEVMpPoAb9b7QqvXtaQ+Pxh5tAwIyTE5yhfvIi6ahB
 p4C14YF07ZYG+xA/B+Nc17Gz3sPsx4gOub0oN1EpA3JWIdk9DQbCwIfi7 g==;
X-CSE-ConnectionGUID: EKJBK7tnTjWDNZ9LkajDaQ==
X-CSE-MsgGUID: Eezs/s+nScu7KSIYyfHm1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66629176"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66629176"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 08:44:35 -0800
X-CSE-ConnectionGUID: VMRGDeSSTOK8h+eo3zk5EA==
X-CSE-MsgGUID: r1n0H5ZMSJW7/uVGkWYnqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="198587397"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 08:44:35 -0800
Date: Mon, 1 Dec 2025 17:44:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Kostiantyn Naddur <kostianaddur@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Pawel Sikora <pawel.sikora@linux.intel.com>
Subject: Re: [PATH i-g-t v1 1/1] tools/intel_gpu_frequency: prevent failure
 w/o root by properly specifying the write mode
Message-ID: <20251201164432.u5ct2ic5q5sm5fp4@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kostiantyn Naddur <kostianaddur@gmail.com>,
 igt-dev@lists.freedesktop.org,
 Pawel Sikora <pawel.sikora@linux.intel.com>
References: <20251128161832.24515-1-kostianaddur@gmail.com>
 <20251128161832.24515-2-kostianaddur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251128161832.24515-2-kostianaddur@gmail.com>
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

Hi Kostiantyn,
On 2025-11-28 at 17:18:25 +0100, Kostiantyn Naddur wrote:
> Running intel_gpu_frequency without properly specified write
> modes leads to core dump.
> 
> printf("%s %s\n", freq_info->path, freq_info->mode) was used in
> initialize_freq_info() to understand what was going on.

This should be below after '---' line, it should not be a part
of description of commit. Or you could add it cover letter
about how you debugged it.

> 
> To fix core dump while keeping the workability of read-only functions,
> the verify_write_cond() was added, which checks whether the program is
> running with root and what write mode the functions are using, and then
> changes the "min" and "max" modes to "rb+".

Description should try to write why and how, but 'how' part
should not be C code in english. For pointers look into
links in CONTRIBUTING.md, especially 'Sending patches'
https://drm.pages.freedesktop.org/igt-gpu-tools/CONTRIBUTING/#sending-patches

> 
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/184

We usally use 'Closes:' tag, fixes for a commits.

> 
> Signed-off-by: Kostiantyn Naddur <kostianaddur@gmail.com>
> ---
>  tools/intel_gpu_frequency.c | 38 +++++++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index 8c3c91313..8f5719265 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -24,6 +24,7 @@
>  #include <assert.h>
>  #include <getopt.h>
>  #include <stdio.h>
> +#include <stdlib.h>
>  #include <time.h>
>  #include <unistd.h>
>  
> @@ -52,10 +53,10 @@ struct freq_info {
>  };
>  
>  static struct freq_info info[] = {
> -	{ "cur", "r"  },
> -	{ "min", "rb+" },
> +	{ "cur", "r" },
> +	{ "min", "r" },
>  	{ "RP1", "r" },
> -	{ "max", "rb+" },
> +	{ "max", "r" },
>  	{ "RP0", "r" },
>  	{ "RPn", "r" }
>  };
> @@ -117,6 +118,21 @@ static int get_frequency(struct freq_info *freq_info)
>  	return val;
>  }
>  
> +static void verify_write_cond(bool write)
> +{
> +	if (getuid() != 0) {
> +		fprintf(stderr, "Failed to initialize! (Permission denied)\n");
> +		exit(EXIT_FAILURE);
> +	}

The problem with this check is that a non-root user could
still access those files when he/she is in a group. So imho
better solution was to open and check for error. There is
already a proposed solution to this issue, see my series

https://patchwork.freedesktop.org/series/157834/
intel_gpu_frequency: Allow printing frequencies by regular user

especially patch 3/3,
[i-g-t,v3,3/3] tools/intel_gpu_frequency: Allow printing by regular user

Regards,
Kamil

PS. what is still left todo is to replace all asserts 
with proper error reporting.

> +
> +	if (write == true) {
> +		if (strcmp(info[1].mode, "r") == 0)
> +			info[1].mode = "rb+";
> +		if (strcmp(info[3].mode, "r") == 0)
> +			info[3].mode = "rb+";
> +	}
> +}
> +
>  static void __attribute__((noreturn))
>  usage(const char *prog, int err)
>  {
> @@ -225,6 +241,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			}
>  
>  			write = true;
> +			verify_write_cond(write);
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
>  			sscanf(optarg, "%d", &new_freq[MAX]);
> @@ -240,6 +257,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  			}
>  
>  			write = true;
> +			verify_write_cond(write);
>  
>  			if (!strncmp("min=", optarg, 4)) {
>  				act_upon[MIN] = true;
> @@ -259,35 +277,39 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  					"FIXME: Warning efficient frequency information is incorrect.\n");
>  				exit(EXIT_FAILURE);
>  			}
> +			write = true;
> +			verify_write_cond(write);
>  			tmp = get_frequency(&info[EFF]);
>  			new_freq[MIN] = tmp;
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
>  			break;
>  		case 'i': /* mIn */
> +			write = true;
> +			verify_write_cond(write);
>  			tmp = get_frequency(&info[RPn]);
>  			new_freq[MIN] = tmp;
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
>  			break;
>  		case 'm': /* max */
> +			write = true;
> +			verify_write_cond(write);
>  			tmp = get_frequency(&info[RP0]);
>  			new_freq[MIN] = tmp;
>  			new_freq[MAX] = tmp;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
>  			break;
>  		case 'd': /* defaults */
> +			write = true;
> +			verify_write_cond(write);
>  			new_freq[MIN] = get_frequency(&info[RPn]);
>  			new_freq[MAX] = get_frequency(&info[RP0]);
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -			write = true;
>  			break;
>  		default:
>  			fprintf(stderr, "Error: unknown option\n");
> @@ -301,7 +323,6 @@ done:
>  
>  int main(int argc, char *argv[])
>  {
> -
>  	bool write, fail, targets[MAX+1] = {false};
>  	int i, fd, try = 1, set_freq[MAX+1] = {0};
>  
> @@ -334,6 +355,7 @@ again:
>  			continue;
>  
>  		if (write) {
> +			verify_write_cond(write);
>  			set_frequency(&info[i], set_freq[i]);
>  			if (get_frequency(&info[i]) != set_freq[i])
>  				fail = true;
> -- 
> 2.52.0
> 
