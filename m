Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F0DC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 07:54:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC37C10E4A2;
	Tue, 20 Aug 2024 07:54:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAqOhdhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8855D10E4A2
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 07:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724140456; x=1755676456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=foUSPFe6X/cuUR0bXLAfU3GDs/utqu1xHpmLCOCuDfo=;
 b=SAqOhdhf9ZVpY3TcJqYB2og0SYNoPQsb1HmmV2m8R9mhAmSpY687UHtS
 6HrUUo1XLmD/PMoHM+a2yz2p6jAB2cMcty+QV7fXlWpa0lwGtIDQVcG0i
 vnwSdSo+ogAk6G1LbvHIbntDEIwHm3zBeCxi6e5G/XRZkmB/fLNnqHK0C
 Bbx9x1kQ5gi6IVwpsSYVsNXzzrOKqLXX0ntT+Tzlki33twsCHucB6dwtG
 W/Ixp0h0EtVn6ttMrkKt52s2T7dalkzuhc3bDpPgpqFmVC0VK42Y4oTFa
 pTnUbUj4Z/yEs4IenW1Qw8kHbJ2eY8QfIGUmwcH/RrU7Rk71VJaPOhSoL w==;
X-CSE-ConnectionGUID: U4HYDEmtRbqSknuUWLIN+Q==
X-CSE-MsgGUID: tlTYRysNSsmBLecPR1Sc3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22560050"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22560050"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:54:10 -0700
X-CSE-ConnectionGUID: y4eC28awQeW2NtEpVvHUWg==
X-CSE-MsgGUID: LfIJg1x6R/WOQR/wZsVAMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="65592053"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.160])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 00:54:05 -0700
Date: Tue, 20 Aug 2024 09:54:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 03/14] lib/xe_ioctl: Add wrapper with vm_bind_op
 extension parameter
Message-ID: <20240820075401.oq4uafzira7ykbhy@zkempczy-mobl2>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-4-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809123813.109365-4-christoph.manszewski@intel.com>
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

On Fri, Aug 09, 2024 at 02:38:02PM +0200, Christoph Manszewski wrote:
> Currently there is no way to set drm_xe_vm_bind_op extension field. Add
> vm_bind wrapper that allows pass this field as a parameter.
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 20 ++++++++++++++++----
>  lib/xe/xe_ioctl.h |  5 +++++
>  2 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> index ae43ffd15..6d8388918 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -96,15 +96,17 @@ void xe_vm_bind_array(int fd, uint32_t vm, uint32_t exec_queue,
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
>  }
>  
> -int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> -		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> -		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> -		  uint32_t prefetch_region, uint8_t pat_index, uint64_t ext)
> +int  ___xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> +		   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		   uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> +		   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext,
> +		   uint64_t op_ext)
>  {
>  	struct drm_xe_vm_bind bind = {
>  		.extensions = ext,
>  		.vm_id = vm,
>  		.num_binds = 1,
> +		.bind.extensions = op_ext,
>  		.bind.obj = bo,
>  		.bind.obj_offset = offset,
>  		.bind.range = size,
> @@ -125,6 +127,16 @@ int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  	return 0;
>  }
>  
> +int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> +		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> +		  uint32_t prefetch_region, uint8_t pat_index, uint64_t ext)
> +{
> +	return ___xe_vm_bind(fd, vm, exec_queue, bo, offset, addr, size, op,
> +			     flags, sync, num_syncs, prefetch_region,
> +			     pat_index, ext, 0);
> +}
> +
>  void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  			  uint64_t offset, uint64_t addr, uint64_t size,
>  			  uint32_t op, uint32_t flags, struct drm_xe_sync *sync,
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index b27c0053f..18cc2b72b 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -20,6 +20,11 @@
>  uint32_t xe_cs_prefetch_size(int fd);
>  uint64_t xe_bb_size(int fd, uint64_t reqsize);
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
> +int  ___xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> +		   uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		   uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> +		   uint32_t prefetch_region, uint8_t pat_index, uint64_t ext,
> +		   uint64_t op_ext);
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
>  		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
>  		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
> -- 
> 2.34.1
> 

Ok, this is harmless and doesn't depend on eudebug uapi headers.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

