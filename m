Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DDDC0218F
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 12:59:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5A110E33D;
	Thu, 30 Jan 2025 12:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3RjYVge";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D74810E22E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 12:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738241982; x=1769777982;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AVY//o7lTIN+OGm9Uvf//32O6rrP8ZIcw44jaAKFA9Q=;
 b=E3RjYVgeNZN6ADcVDK0UfaABrCVcJuYPyEOLvaU4LD9BFG4A7iK8GAOM
 rp3B61og1Cz3PXlsHmo702dLszZYkyurgLWLHBN5vRCf/FZrSXHPscXxr
 ZwGXn/z20yru7qPvt2D7fjM3hrrSzUG4eFWeRrTdPwAtiIwaYAp53yLPH
 HCyD/rr+KCszyizukiZBYkKI4l2Qd+49Myo2mm/mHoy8YRQvCQrUKZUaU
 s8JyLAGrgmAebUnxTxfc7Sx/knLlU3VutRFGak2YXDyIE5XZne7f0vidI
 njIEniPepsBYza0jRs5ld4+bsS61JiLzPJyGF2qY3htXvZ3x+fIAGWiWt w==;
X-CSE-ConnectionGUID: pcKvCpxWQs2tSF4SDL+qdQ==
X-CSE-MsgGUID: rbZEsg0NREiD2AF02XEzbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56321749"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="56321749"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 04:59:41 -0800
X-CSE-ConnectionGUID: p/0n4vl4Q0K8Al4Vh0NVhQ==
X-CSE-MsgGUID: rBvOsqwoQv6/A95qFOXyKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="114347570"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2025 04:59:39 -0800
Date: Thu, 30 Jan 2025 13:59:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 quic_abhinavk@quicinc.com, igt-dev@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>
Subject: Re: [PATCH i-g-t v5 2/3] lib/igt_kms: loosen duplicate check in
 igt_display_refresh
Message-ID: <20250130125937.mp6trwnb2tzcas4f@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 quic_abhinavk@quicinc.com, igt-dev@lists.freedesktop.org,
 Alex Hung <alex.hung@amd.com>,
 Esha Bharadwaj <quic_ebharadw@quicinc.com>
References: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
 <20250128-igt-cwb-v5-2-82652cec29a3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128-igt-cwb-v5-2-82652cec29a3@quicinc.com>
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

Hi Jessica,
On 2025-01-28 at 19:29:48 -0800, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

See one nit about documentaion below.

> 
> Change the duplicate check in igt_display_refresh() so it allows for
> pipes to be shared by encoders that are valid clones of each other.
> 

please correct Bhanuprakash e-mail
Cc: Bhanuprakash Modem <bhanuprakash.modem@gmail.com>

Juha-Pekka or Swati or Karthik - could you find someone from KMS team and
help with review of this and next patch? Thanks!

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  lib/igt_kms.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
>  lib/igt_kms.h |  1 +
>  2 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 4b14c94e226a9a103bc3a3bc26099566a6eb274b..5471f906a98f62aec285bf50d9c48f2ec6c1009e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3339,6 +3339,48 @@ int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
>  	igt_assert(0);
>  }
>  

Please document each new library function.

Reagrds,
Kamil

> +bool igt_output_is_valid_clone(int drm_fd, igt_output_t *target, igt_output_t *clone)
> +{
> +	drmModeEncoder *target_enc;
> +	drmModeEncoder *clone_enc;
> +	drmModeRes *resources = drmModeGetResources(drm_fd);
> +	uint32_t clone_mask;
> +
> +	if (!target || !clone)
> +		return false;
> +
> +	target_enc = target->config.encoder;
> +	clone_enc = clone->config.encoder;
> +
> +	if (!target_enc || !clone_enc)
> +		return false;
> +
> +	clone_mask = 1 << kmstest_get_encoder_idx(resources, clone_enc);
> +
> +	return ((target_enc->possible_clones & clone_mask) == clone_mask);
> +}
> +
> +static bool igt_output_has_duplicates(igt_display_t *display, igt_output_t *output,
> +				      unsigned long pipes_in_use, int start_idx)
> +{
> +	igt_output_t *clone_output;
> +
> +	for (int j = start_idx + 1; j < display->n_outputs; j++) {
> +		clone_output = &display->outputs[j];
> +
> +		/*
> +		 * Check that any encoders with duplicated pipes
> +		 * are possible clones of each other. If they
> +		 * aren't, report the pipe as duplicated
> +		 */
> +		if ((pipes_in_use & (1 << output->pending_pipe)) &&
> +		    !igt_output_is_valid_clone(display->drm_fd, output, clone_output))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void igt_display_refresh(igt_display_t *display)
>  {
>  	igt_output_t *output;
> @@ -3346,13 +3388,14 @@ static void igt_display_refresh(igt_display_t *display)
>  
>  	unsigned long pipes_in_use = 0;
>  
> -       /* Check that two outputs aren't trying to use the same pipe */
> +	/* Check that two non-clone outputs aren't trying to use the same pipe */
>  	for (i = 0; i < display->n_outputs; i++) {
>  		output = &display->outputs[i];
>  
>  		if (output->pending_pipe != PIPE_NONE) {
> -			if (pipes_in_use & (1 << output->pending_pipe))
> -				goto report_dup;
> +			if (igt_output_has_duplicates(display, output,
> +						      pipes_in_use, i))
> +					goto report_dup;
>  
>  			pipes_in_use |= 1 << output->pending_pipe;
>  		}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e4f7b6c62fd536aa4ea3eb3153d8e1935cf560fd..932e5818364ca74cb86b1ba58c5f3ede0b8abf18 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -554,6 +554,7 @@ igt_plane_t *igt_output_get_plane_type_index(igt_output_t *output,
>  					     int plane_type, int index);
>  igt_output_t *igt_output_from_connector(igt_display_t *display,
>      drmModeConnector *connector);
> +bool igt_output_is_valid_clone(int drm_fd, igt_output_t *target, igt_output_t *clone);
>  void igt_output_refresh(igt_output_t *output);
>  drmModeModeInfo *igt_std_1024_mode_get(int vrefresh);
>  void igt_output_set_writeback_fb(igt_output_t *output, struct igt_fb *fb);
> 
> -- 
> 2.34.1
> 
