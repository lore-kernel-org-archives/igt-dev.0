Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D83C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 06:01:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC80112B56;
	Wed,  6 Mar 2024 06:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0qLKdmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3186A112B56
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 06:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709704871; x=1741240871;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=+P6RH7MLoyq9V8u7UKEBUX66BiCPmaSKA0SmYzrysQg=;
 b=b0qLKdmDQ4x+UTm49rXWhC4nH5BfT2MMoNIzWbna1I71cRBwggg2D4u1
 cmqhjA3KkZUbWoHSGrOBEK11atGI/RQ+MI5IblZNu72afCWP433Quz5wJ
 ysewswWgZ1VTOiGXrTHJKKsefUgwmdRTKEa8/aCbeGh2YjWm+rJ3f4eJt
 o+CLJARRjpT69mZAC2DLazJ4n1u9YXXGflY0BN2gxPSGv89uRR4zPwPe1
 goOIa3eGOsLowKJTNewYBZ2+Lq33dh2wfEC1y1Lem1d3+JkC3pElNFgTL
 aPvGZCfravIW0Bi+svQC6LVf1ijDTuWvTqDZ64jNjBHyJuK8DQ5nJoy8F Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21824028"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="21824028"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 22:01:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="47168715"
Received: from unknown (HELO localhost) ([10.245.244.139])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 22:01:08 -0800
Date: Wed, 6 Mar 2024 07:01:05 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/6] lib/gpu_cmds: default to uc MOCS index
Message-ID: <20240306060105.3xwjdknn7b7omcin@zkempczy-mobl2>
References: <20240305121754.182425-1-matthew.auld@intel.com>
 <20240305121754.182425-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240305121754.182425-2-matthew.auld@intel.com>
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

On Tue, Mar 05, 2024 at 12:17:50PM +0000, Matthew Auld wrote:
> Currently we just default to index=0, but that can have different
> meaning between HW versions. Rather just default to UC mocs index.

Makes sense to me:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/gpu_cmds.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
> index 49ba364f9..d909efde8 100644
> --- a/lib/gpu_cmds.c
> +++ b/lib/gpu_cmds.c
> @@ -214,10 +214,10 @@ gen9_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
> -	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
> -	else if (mocs == INTEL_BUF_MOCS_WB)
> +	if (mocs == INTEL_BUF_MOCS_WB)
>  		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
> +	else
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -275,10 +275,10 @@ gen11_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = vertical_alignment; /* align 4 */
>  	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
>  
> -	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
> -	else if (mocs == INTEL_BUF_MOCS_WB)
> +	if (mocs == INTEL_BUF_MOCS_WB)
>  		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
> +	else
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> @@ -931,10 +931,10 @@ xehp_fill_surface_state(struct intel_bb *ibb,
>  	ss->ss0.vertical_alignment = 1; /* align 4 */
>  	ss->ss0.horizontal_alignment = 1; /* align 4 */
>  
> -	if (mocs == INTEL_BUF_MOCS_UC)
> -		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
> -	else if (mocs == INTEL_BUF_MOCS_WB)
> +	if (mocs == INTEL_BUF_MOCS_WB)
>  		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
> +	else
> +		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
>  
>  	if (buf->tiling == I915_TILING_X)
>  		ss->ss0.tiled_mode = 2;
> -- 
> 2.43.2
> 
