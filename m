Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08786CD4F3C
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 13:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF11E10E1B0;
	Wed, 20 May 2026 13:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LdacpR4v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D92310E44C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 13:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779284962; x=1810820962;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Qd+7/EOCv3LxLv3a6cqg2gXXUiucbIRlXnz5DwAQlGc=;
 b=LdacpR4vyL6i83YwafMr2e2JS5lmDbWomNGuicyzYy0vJxqCXCvw1zaZ
 WJwphkKY30+qoF/Ni0OyhHF3cpkAYoh5XMBXAb9bUp26aMuguDriB5e80
 Ko6ht3TYBuzFie8Kd1iAVLmm3ftyYC/sSTUvibkCz2ILzgFp5dylLwxwH
 YvdoP0/KrUP5UOWWuvArRQROFuHg3VXf8VorLBL+FPSQNngyU7FwOClHh
 W2p6W/3jjnPk9FD7RLddu1FpZ+olYwbDPVyxAadechdC5YEIlMSeHiw+O
 C9Kw6jzUwzZREWPeyVOicpeRLML7AodPr/Lo/0Coz1K1U0zuu4qGG4pI7 A==;
X-CSE-ConnectionGUID: VyYjRkUeSO62QTVy8OmUFA==
X-CSE-MsgGUID: Njwz2xn1TqqvjNb2vadPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80085323"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80085323"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:49:20 -0700
X-CSE-ConnectionGUID: XtjD87RyS0K7HgYSDYuOvw==
X-CSE-MsgGUID: VCyQ5oRhQKSM32BU7fr3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="245171589"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.189])
 ([172.28.182.189])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 06:49:20 -0700
Message-ID: <2523ec2f-eb8b-4a15-b4a3-3f7a15cdd2e0@linux.intel.com>
Date: Wed, 20 May 2026 15:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tests/intel/xe_sriov_vfio: Query only BAR regions in
 region-info
To: Lukasz Laguna <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, jakub1.kolakowski@intel.com
References: <20260519120055.201038-1-lukasz.laguna@intel.com>
 <20260519120055.201038-2-lukasz.laguna@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20260519120055.201038-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 5/19/2026 2:00 PM, Lukasz Laguna wrote:
> The region-info subtest iterates over all regions reported by
> VFIO_DEVICE_GET_INFO. Not all regions are queryable on every device,
> which can lead to false failures. To avoid this, query only BAR regions,
> but check if number of regions returned by VFIO is correct.
>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>   tests/intel/xe_sriov_vfio.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
> index f42deaea6..bb1c02696 100644
> --- a/tests/intel/xe_sriov_vfio.c
> +++ b/tests/intel/xe_sriov_vfio.c
> @@ -30,7 +30,7 @@
>    * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
>    *
>    * SUBTEST: region-info
> - * Description: Bind VF to xe-vfio-pci, open VFIO device and query VFIO region info (BAR sizes).
> + * Description: Bind VF to xe-vfio-pci, open VFIO device and query BAR regions info.
>    */
>   
>   IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
> @@ -254,7 +254,10 @@ static void vfio_dump_region_info(int device_fd)
>   	igt_info("VFIO device: flags=0x%x num_regions=%u num_irqs=%u\n",
>   		 dinfo.flags, dinfo.num_regions, dinfo.num_irqs);
>   
> -	for (uint32_t i = 0; i < dinfo.num_regions; i++) {
> +	igt_assert(dinfo.num_regions >= VFIO_PCI_NUM_REGIONS);
> +
> +	/* Query BAR regions only */
> +	for (uint32_t i = 0; i <= VFIO_PCI_BAR5_REGION_INDEX; i++) {
>   		struct vfio_region_info rinfo = {
>   			.argsz = sizeof(rinfo),
>   			.index = i,
LGTM,
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>

