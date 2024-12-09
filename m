Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09E3E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 16:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DCB610E4B6;
	Mon,  9 Dec 2024 16:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JCatMlNE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F5710E4B6
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 16:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733763431; x=1765299431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=af2mjRawDnhrazh5CcFnZIYQRDD8cRuQqqvpsGmWZqs=;
 b=JCatMlNENkjBMWwiJlwzK66ybJXeg0iwK8u81MQTbmS5no5rqSuDNVq5
 DkbAwLAp5yLZCf/MzG2IDm+WglvM5piXrNzkEoLVhESrS5yRx6jNqoIOC
 5EPoJuz7/7Er6ATz5WpJw60KtXzuixtcGkOyUmLgH288642pXB+0tjp3v
 /AzMGn3yPh9/HYStIAkp5kjHLtldguQ7U1bnTZW4+8D3GHo8uKpsn/akU
 w8qJ2SXohw+CTZld7Gp0XzsXFtxtnPUUn7kytdMbolsp0OZqXbvDY5MzL
 4bnqPVBjFFij7jcH8PeCQFyMGJH428cQJpl8LCxvUk0649KxIZHHTq7lX w==;
X-CSE-ConnectionGUID: qv8+hhHTRJyBRYi5vbORhw==
X-CSE-MsgGUID: N8QTJSCPSeO783UTmyA0CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34130004"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34130004"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:57:09 -0800
X-CSE-ConnectionGUID: WhAGNj9HT6mSNE3XMtAU4w==
X-CSE-MsgGUID: yAWHs69YSTWkNexZApYyrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; d="scan'208";a="99942651"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 08:56:58 -0800
Date: Mon, 9 Dec 2024 17:56:41 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Animesh Manna <animesh.manna@intel.com>
Cc: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/lobf: Remove lobf supported check
Message-ID: <20241209165641.65gauh4ismln6u5o@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>
References: <20241129084006.3448688-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241129084006.3448688-1-animesh.manna@intel.com>
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

Hi Animesh,
On 2024-11-29 at 14:10:06 +0530, Animesh Manna wrote:

one nit about subject, it is now:

[PATCH i-g-t] tests/intel/lobf: Remove lobf supported check

imho it should be:

[PATCH i-g-t] tests/kms_vrr: Remove LOBF supported check

Btw this could be corrected at merge time.
Please also check CI failure reports and check them, then replay
to igt-dev ML with Cc to CI.

Regards,
Kamil

> From kernel driver debugfs support is not present so remove
> the lobf supported check from igt.
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Animesh Manna <animesh.manna@intel.com>
> ---
>  tests/kms_vrr.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index f0564bb6a..e7d2ff1db 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -890,11 +890,6 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> -
> -		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
> -			igt_info("%s: LOBF not supported.\n", igt_output_name(output));
> -			return false;
> -		}
>  	}
>  
>  	/* Reset output */
> -- 
> 2.29.0
> 
