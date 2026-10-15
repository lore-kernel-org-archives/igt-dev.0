Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5755CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 15:53:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C40B10EC16;
	Thu, 15 Oct 2026 15:53:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750B910EC40
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 15:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079556; x=1823615556;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=abfFNMfZl0CuLgWQHM20JIj0SBAN6On5VRwg5QPuxaA=;
 b=RwCeWOjpTZz9X/MYRiU49hPLogXJgCDmAMoIooADttufhQsx2ha/2c0x
 hQ6bxNXZilMV+Z3ht739PRMEHGGKtGTlSXRTqc9KWDcJYhgvUe49rk6sG
 bTbE6YjVs2hbGkZ6mkIjY/WeIqOzKUr3FR0iuLZSvZ3Sm45UecDLzK68S
 cmbqfY5rR7658NtIzh/mBA7e69yofjVB1LecEaryrp8Fe9wyfn+g8ZWYe
 6SRglOEgW7RfXoVnk+cELKw2a+4q4b/N6Y4WTxo4xEsC0GXta+LOdyWlp
 QrtpRN83iclZvVTZ06cn9+B1v/h6JLzpHTZEdnF12SmMDUaQQdLOLjqQ1 Q==;
X-CSE-ConnectionGUID: oyeyHddQSyauvqz4ho9iLA==
X-CSE-MsgGUID: ai7i1+JcTfixMk0WRX80Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="749912"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="749912"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:52:32 -0700
X-CSE-ConnectionGUID: MADbhv9NR76IFlsfqBrM4w==
X-CSE-MsgGUID: b2utJIIMRfql/up1s6U6Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1657547"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:52:30 -0700
Date: Thu, 15 Oct 2026 17:52:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Daniel Stone <daniels@collabora.com>
Cc: igt-dev@lists.freedesktop.org, boris.brezillon@collabora.com,
 laura.nao@collabora.com, adrian.larumbe@collabora.com,
 daniel.almeida@collabora.com, liviu.dudau@arm.com
Subject: Re: [PATCH 2/4] panthor: Add igt_panthor_get_arch() helper
Message-ID: <20261015155228.cz3riyd3i5pemwmi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniel Stone <daniels@collabora.com>, igt-dev@lists.freedesktop.org,
 boris.brezillon@collabora.com, laura.nao@collabora.com,
 adrian.larumbe@collabora.com, daniel.almeida@collabora.com,
 liviu.dudau@arm.com
References: <20261015130837.710795-1-daniels@collabora.com>
 <20261015130837.710795-3-daniels@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261015130837.710795-3-daniels@collabora.com>
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

Hi Daniel,
On 2026-10-15 at 14:05:47 +0100, Daniel Stone wrote:

could you change subject and add a lib prefix? like

[PATCH 2/4] lib/igt_panthor: Add igt_panthor_get_arch() helper

This apply to 1...3 patches from series.

> This will identify the major architecture revision.
> 
> Signed-off-by: Daniel Stone <daniels@collabora.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_panthor.c | 17 +++++++++++++++++
>  lib/igt_panthor.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> diff --git a/lib/igt_panthor.c b/lib/igt_panthor.c
> index cd6b6b7fd..f5c6859e2 100644
> --- a/lib/igt_panthor.c
> +++ b/lib/igt_panthor.c
> @@ -370,3 +370,20 @@ void igt_panthor_free_bo(int fd, struct panthor_bo *bo)
>  
>  	gem_close(fd, bo->handle);
>  }
> +
> +/**
> + * igt_panthor_get_arch:
> + * @fd: panthor device file descriptor
> + *
> + * Get the architecture major version for this device.
> + *
> + * Returns: The Mali architecture major version
> + */
> +int igt_panthor_get_arch(int fd)
> +{
> +	struct drm_panthor_gpu_info gpu_info = { 0 };
> +
> +	igt_panthor_query(fd, DRM_PANTHOR_DEV_QUERY_GPU_INFO,
> +			  &gpu_info, sizeof(gpu_info), 0);
> +	return DRM_PANTHOR_ARCH_MAJOR(gpu_info.gpu_id);
> +}
> diff --git a/lib/igt_panthor.h b/lib/igt_panthor.h
> index 63c4f2bf4..3056ebd75 100644
> --- a/lib/igt_panthor.h
> +++ b/lib/igt_panthor.h
> @@ -36,6 +36,7 @@ void igt_panthor_group_submit_simple(int fd, uint32_t group_handle,
>  				     uint32_t queue_index, uint64_t stream_addr,
>  				     uint32_t stream_size, uint32_t syncobj_handle,
>  				     int err);
> +int igt_panthor_get_arch(int fd);
>  
>  static inline void igt_panthor_vm_bind(int fd, uint32_t vm_id, uint32_t bo_handle,
>  				       uint64_t va, uint64_t size, uint32_t flags, int err)
> -- 
> 2.47.3
> 
