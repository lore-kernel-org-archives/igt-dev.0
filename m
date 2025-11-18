Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA6CCEE343
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 17:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 435F210E516;
	Tue, 18 Nov 2025 17:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyMXt29v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8916310E50B
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 17:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763487913; x=1795023913;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WlgwqEONp2PhTF4WIBurNc9+SxxbzUg4qqsilnIroYM=;
 b=jyMXt29vT7gq3mPiTLzOQKfgHiGnWZMeel40cvf2FIeyWqM6mvum7OR4
 X9Q/USAyOwxNTkzFWfQDn6YlWmPcHQirJR3iTmImGMeFvKQMtaGVAR9ZN
 c0HAcKuA4XtqF0gV/Z1TFnORsODD5WV+yuaYePNH2/9n4QNASFbenRoBN
 mwoEogxX7tUYq6z0aDdM8LaOKiixMlIPh4VMfhL8bHnYMUZDF4huFq3b7
 Jir4M8lLFipB99oPhr+rqJmGVxEud2cnLp4HGdtjyDE44WSlo5huzE/LB
 znEfJcAB13qVJN2JGVP81eTCkyVlgQv3bLii68aM51Fsjbbu8V0erSFRS w==;
X-CSE-ConnectionGUID: RWpFcEgNS6Ky8jmthUhUnQ==
X-CSE-MsgGUID: NgFfp5FCSAejUj//+QZZhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65608574"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65608574"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:45:13 -0800
X-CSE-ConnectionGUID: +2o9i8SZRVacyOAB7hIX7g==
X-CSE-MsgGUID: jZxcrUCJSeuDSXkFydUx8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195735765"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 09:45:12 -0800
Date: Tue, 18 Nov 2025 18:45:09 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevaka.badrappan@intel.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com
Subject: Re: [PATCH i-g-t v2 1/3] tools/intel_gpu_frequency: Add proper
 checks as R/W not supported simaltaneously
Message-ID: <20251118174509.r3kw2tgzmlmgml4p@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 S Sebinraj <s.sebinraj@intel.com>, igt-dev@lists.freedesktop.org,
 jeevaka.badrappan@intel.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@intel.com
References: <20251030152405.3422044-1-s.sebinraj@intel.com>
 <20251030152405.3422044-2-s.sebinraj@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030152405.3422044-2-s.sebinraj@intel.com>
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
On 2025-10-30 at 20:54:03 +0530, S Sebinraj wrote:
> Add conditions properly for Read and write operations as they are not
> supported simaltaneously, since a file-pointer once opened in read
> mode, cannot be used for write, the same goes vice-versa.
> 
> Error: set_frequency:
> 	Assertion `fprintf(freq_info->filp, "%d", val) > 0' failed.

imho it could work if options will break down, first reading/parsing,
then acting on options one after another. Or checking if there are
read and write and opening in proper mode beforehand.

Regards,
Kamil

> 
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  tools/intel_gpu_frequency.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
> index de0c6ddba..3378f3927 100644
> --- a/tools/intel_gpu_frequency.c
> +++ b/tools/intel_gpu_frequency.c
> @@ -155,6 +155,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  {
>  	int c, tmp;
>  	bool write = false;
> +	bool reader = false;
>  
>  	/* No args means -g" */
>  	if (argc == 1) {
> @@ -182,13 +183,17 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  
>  		switch (c) {
>  		case 'g':
> -			if (write == true)
> -				fprintf(stderr, "Read and write operations not support simultaneously.\n");
> +			if (write == true) {
> +				fprintf(stderr,
> +					"Read and write operations not support simultaneously.\n");
> +				exit(EXIT_FAILURE);
> +			}
>  			{
>  				int i;
>  				for (i = 0; i < act_upon_n; i++)
>  					act_upon[i] = true;
>  			}
> +			reader = true;
>  			break;
>  		case 's':
>  			if (!optarg)
> @@ -199,6 +204,12 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
>  				exit(EXIT_FAILURE);
>  			}
>  
> +			if (reader == true) {
> +				fprintf(stderr,
> +					"Read and write operations not support simultaneously.\n");
> +				exit(EXIT_FAILURE);
> +			}
> +
>  			write = true;
>  			act_upon[MIN] = true;
>  			act_upon[MAX] = true;
> -- 
> 2.43.0
> 
