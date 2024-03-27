Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F37C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 14:37:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AF7710EF25;
	Wed, 27 Mar 2024 14:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y7q5GZB5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E4910FD3D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 14:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711550259; x=1743086259;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M61HVAadbnU8XFNG99eadS3x6EgbTXDBjlMD7wrt8WA=;
 b=Y7q5GZB5v9m1h7wuEcOBPWwgrZl31tX5XRdkWpl2yB1kkFKnvKI7kMJo
 jxzieDOKEaHKGAakPqDW8az2wc9XhC9jrSVEwGzLWlHe3dAKxu/fubcb0
 Du4u7fWHDRG1/hktowwVtLcvuLlKcObyQ+ZkXA1U5SMuq43qy+y/1oxpJ
 JmwGF8P9ac3asCW/gD1WSfjo8pqTAOlo7xDbbvUiFy/bFCPRKD2NqtuCZ
 Q1et0iQlXi3CzmZD9dNR94BP9RSDLGjVl4zZED6inIZkwCEw9koc2szHr
 i94dyvPkhnb2qeoukD8OjNZlKmNPkwb6FGzBSylCubGU13t5Dtf2K6OVA g==;
X-CSE-ConnectionGUID: R3q0e+hOSgCOlcU6H0Kf3A==
X-CSE-MsgGUID: ovfzMeAvRBeuK6EuYMhd+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17287811"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="17287811"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:37:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16350073"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 07:37:36 -0700
Date: Wed, 27 Mar 2024 15:37:34 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Oak Zeng <oak.zeng@intel.com>
Subject: Re: [PATCH i-g-t, v2] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
Message-ID: <20240327143734.hnbyih45abxw2gds@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Oak Zeng <oak.zeng@intel.com>
References: <20240326181628.130143-1-jagmeet.randhawa@intel.com>
 <20240326181628.130143-2-jagmeet.randhawa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240326181628.130143-2-jagmeet.randhawa@intel.com>
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

Hi Jagmeet,
On 2024-03-26 at 11:16:28 -0700, Jagmeet Randhawa wrote:
> Ensure we set a suitable default pat_index, which is always compatible
> with any CPU caching mode, like intel_get_pat_idx_wb(). For example,
> currently we are blindly selecting pat_index=0 which has COH_NONE on LNL
> and then attempting to use that with CPU caching mode WB, which is not
> supported by the KMD.
> 

You got also r-b from Oak, so:
Reviewed-by: Oak Zeng <oak.zeng@intel.com>

Please also look at his reply regarding commit description.

Regards,
Kamil

> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_vm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 7c061c497..1f458174d 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
>  	bind.bind.range = bo_size;
>  	bind.bind.addr = addr;
>  	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
> +	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
>  	bind.num_syncs = 1;
>  	bind.syncs = (uintptr_t)sync;
>  
> -- 
> 2.25.1
> 
