Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6B5C48297
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 14:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DA810E7E9;
	Mon, 12 Feb 2024 14:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZ8OH4cI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B62E10E7A9
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 14:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707749941; x=1739285941;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+JimjEszgRw0kZJyA/7th2LEPYtmMHJ05rb8E83FgrU=;
 b=jZ8OH4cI14wDg+rwfLGiPFPlZt62/g3cBjrj3JyzLaUGS1yeThQ0M4k3
 K2heEmkrw9nwKHs+6jPTIxGrKR98hYpoxnYJLaZtTemUgsze4Uo1VGF4/
 Ni8xH8pwx50wf3cb6asA4AG+NvFUHGdupaS2PxxevzoVaCO6mu2/ApNvF
 bgx8SIXNG4Q19csGgYw2OgoktYdXZjyqCvk5xm90VcggtdwbTU/fB/cfB
 LkK3Ps4CabQuFVR5/7HB2EBOofw0MOFAn3InVDyiXIYpugPAInsb6b2q6
 QVPtoHKjoaT+BbP2NR1ho2eqeMK1QboidMf/lrOLBWsJZPN9jSpYMcLfN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="24197391"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="24197391"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:59:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="2904807"
Received: from unknown (HELO localhost) ([10.245.86.45])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 06:59:00 -0800
Date: Mon, 12 Feb 2024 15:58:57 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/8] tests/intel/kms_dirtyfb: pass the bo_size
Message-ID: <20240212145857.yzuxovqvliu7vgkq@zkempczy-mobl2>
References: <20240209183433.375099-1-matthew.auld@intel.com>
 <20240209183433.375099-6-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240209183433.375099-6-matthew.auld@intel.com>
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

On Fri, Feb 09, 2024 at 06:34:31PM +0000, Matthew Auld wrote:
> Looks possible for the derived bo_size to not be page aligned leading to
> broken behaviour when vm_binding it. Pass through the real bo_size,
> instead of leaving as zero. This will be enforced in the next patch.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> index 7bf49cb15..26b82e50a 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -254,7 +254,7 @@ static void run_test(data_t *data)
>  				    igt_drm_format_to_bpp(data->fbs[1].drm_format),
>  				    0,
>  				    igt_fb_mod_to_tiling(data->fbs[1].modifier),
> -				    0, 0, 0, is_xe_device(data->drm_fd) ?
> +				    0, data->fbs[1].size, 0, is_xe_device(data->drm_fd) ?
>  				    system_memory(data->drm_fd) : 0,
>  				    intel_get_pat_idx_uc(data->drm_fd));
>  	dst = intel_buf_create_full(data->bops, data->fbs[2].gem_handle,
> @@ -262,7 +262,7 @@ static void run_test(data_t *data)
>  				    data->fbs[2].height,
>  				    igt_drm_format_to_bpp(data->fbs[2].drm_format),
>  				    0, igt_fb_mod_to_tiling(data->fbs[2].modifier),
> -				    0, 0, 0, is_xe_device(data->drm_fd) ?
> +				    0, data->fbs[2].size, 0, is_xe_device(data->drm_fd) ?
>  				    system_memory(data->drm_fd) : 0,
>  				    intel_get_pat_idx_uc(data->drm_fd));
>  	ibb = intel_bb_create(data->drm_fd, PAGE_SIZE);
> -- 
> 2.43.0
> 

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
