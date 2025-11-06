Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B3BCCFA05
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 11:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73B410E5DC;
	Thu,  6 Nov 2025 11:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJns5Ey8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A069F10E5DC
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 11:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762430319; x=1793966319;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1IA3516wF7Wu/gEJnWtLpMaI4QCuPgDw3CdJYIp1mf0=;
 b=kJns5Ey8Gj+eZNRenacrwvOOb35efx8UbBSWYcTmTMomAlGCanQUW0id
 oySZybZEMKECFrol3F9gTxPpQ3P4WRB2peeGkqpfL9MThnC878yKtKAqT
 Iuo5JPAtAS6lo4mKeAoCWQSCF8aOXH57naloOJ7Jffcfv2alQCarO8QvS
 lKkEeRgYGeoypmSjCzK0WpmXcIRNkKfPZFffF/wciBleHy36+e042RodQ
 yY0+cftgBqRxf4rxg1s+AjZPC2vPVDZV05JyY5G4obXKYLiY9cMtSKEkG
 0Jgi3N0MtRcCuqfepWhazG/HAQz5U9oFADUOcYdVkbcb88XrKrtfdwGJG w==;
X-CSE-ConnectionGUID: xN1PlVi5Sq+dt2qjlHGX8Q==
X-CSE-MsgGUID: pV+0ISUjSQW5gtnVVDSU0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75249901"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75249901"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 03:58:39 -0800
X-CSE-ConnectionGUID: BJ7qbyE/ShWGPont84R2GA==
X-CSE-MsgGUID: AhWgjP0ATUOVXTo3ND+gMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="188459010"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:58:38 -0800
Date: Thu, 6 Nov 2025 12:58:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
Subject: Re: [PATCH i-g-t v1 3/3] lib/intel_pat: Define pat indices for
 xe3p_xpc
Message-ID: <20251106115836.napgvtcuyjkgsivg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shekhar Chauhan <shekhar.chauhan@intel.com>,
 igt-dev@lists.freedesktop.org, lucas.demarchi@intel.com,
 balasubramani.vivekanandan@intel.com
References: <20251106053425.1731151-1-shekhar.chauhan@intel.com>
 <20251106053425.1731151-4-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106053425.1731151-4-shekhar.chauhan@intel.com>
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

Hi Shekhar,
On 2025-11-06 at 11:04:25 +0530, Shekhar Chauhan wrote:
> From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Right PAT indices selected for xe3p_xpc.
> 
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/intel_pat.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 156b1ee5d..e3588110a 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -19,8 +19,12 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>  {
>  	uint16_t dev_id = intel_get_drm_devid(fd);
>  
> -	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -	    intel_get_device_info(dev_id)->graphics_ver == 20) {
> +	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> +		pat->uc = 3;
> +		pat->wb = 2;
> +		pat->max_index = 31;
> +	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> +		   intel_get_device_info(dev_id)->graphics_ver == 20) {
>  		pat->uc = 3;
>  		pat->wt = 15; /* Compressed + WB-transient */
>  		pat->wb = 2;
> -- 
> 2.51.1
> 
