Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88ED0C982D1
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 17:12:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47E10E907;
	Fri, 16 Jan 2026 17:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zt2vo7tz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E7810E907
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768583557; x=1800119557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=asF49F0D3+IaXTXpfaOH6GDxH2uIqdn1WFvYa0W08oI=;
 b=Zt2vo7tzBRo5ap0MLHQFBtWxCqdD5uuORNXP213pFb24PKnMWvLtyc05
 rCdnvWKIdp7sC6ZBVmpUJY8dSE40TNNoTOKU3QIox1TVj44lJzQUzWRlh
 0qPX3HXwYTJy4IsAS/sIY4pucdM83eml/BnVu1V3Zo7MVW0E8VLxaTiu5
 GZ0LwGez7iBuQ000IHhfmTpRXaHGomurxDTEdQsOWKU8se1kAqrSDAX5k
 KjXa6KFoMTO1DZ9bDdooaIGYO038jdTza3Q76TBQqLPZxodg45Mwo9ZcH
 F60zrSIl+bmlkihS3GURSbnaLy2Jcus8jSSlyHrYEHPgCepbvJEiF18Rq g==;
X-CSE-ConnectionGUID: ABSqd2QmRXurmgRQcumczQ==
X-CSE-MsgGUID: ee0D/ShOQz+QavPbeyKLwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="92564456"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="92564456"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 09:12:37 -0800
X-CSE-ConnectionGUID: BN1Hf8XpQmGJ2pYp0c6xzA==
X-CSE-MsgGUID: YNLYtpQtS32asWkaP8rnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; d="scan'208";a="209774188"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 09:12:35 -0800
Date: Fri, 16 Jan 2026 18:12:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2] lib/xe/xe_legacy: Cleanups in xe_legacy_test_mode()
Message-ID: <20260116171233.ysaqxft5nshpkmgo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Shuicheng Lin <shuicheng.lin@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260115222938.330490-1-shuicheng.lin@intel.com>
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

Hi Shuicheng,
On 2026-01-15 at 22:29:38 +0000, Shuicheng Lin wrote:
> This commit performs a set of small cleanups in xe_legacy_test_mode():
> 1. Remove a duplicate comment for BATCH_DW_COUNT.
> 2. Move LONG_SPIN ctx_ticks initialization to after the fd is opened.
> 3. Add an assertion for CLOSE_FD to prevent fd leaks.
> 4. Unmap data before returning to avoid a VM leak.
> 5. As i start from n_execs, which always will be non-zero, base_addr always
>    will be assgined with addr.

Please split it into five patches, name few of them as a fix.

Regards,
Kamil

> 
> Except for item 4, these changes should have no functional impact.
> 
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  lib/xe/xe_legacy.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
> index 084445305..dcd7e2075 100644
> --- a/lib/xe/xe_legacy.c
> +++ b/lib/xe/xe_legacy.c
> @@ -22,7 +22,6 @@
>  #define CAT_ERROR			(0x1 << 5)
>  #define CLOSE_EXEC_QUEUES		(0x1 << 2)
>  #define CLOSE_FD			(0x1 << 1)
> -/* Batch buffer element count, in number of dwords(u32) */
>  #define GT_RESET			(0x1 << 0)
>  #define MAX_N_EXECQUEUES		16
>  
> @@ -65,9 +64,6 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	} *data;
>  	struct xe_spin_opts spin_opts = {
>  		.preempt = flags & PREEMPT,
> -#define THREE_SEC	(3 * 1000000000ull)
> -		.ctx_ticks = flags & LONG_SPIN ?
> -			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
>  	};
>  	int i, b;
>  	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
> @@ -77,8 +73,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	if (flags & COMPRESSION)
>  		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>  
> -	if (flags & CLOSE_FD)
> +	if (flags & CLOSE_FD) {
> +		igt_assert_eq(fd, -1);
>  		fd = drm_open_driver(DRIVER_XE);
> +	}
> +
> +#define THREE_SEC	(3 * 1000000000ull)
> +	if (flags & LONG_SPIN)
> +		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, THREE_SEC);
>  
>  	vm = xe_vm_create(fd, 0, 0);
>  	bo_size = sizeof(*data) * (n_execs + extra_execs);
> @@ -175,6 +177,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  			for (i = 0; i < n_exec_queues; i++)
>  				xe_exec_queue_destroy(fd, exec_queues[i]);
>  		}
> +		munmap(data, bo_size);
>  		drm_close_driver(fd);
>  		/* FIXME: wait for idle */
>  		usleep(150000);
> @@ -187,8 +190,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>  	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>  
>  	for (i = n_execs; i < n_execs + extra_execs; i++) {
> -		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
> -			? (addr + bo_size * 128) : addr;
> +		u64 base_addr = addr;
>  		u64 batch_offset = (char *)&data[i].batch - (char *)data;
>  		u64 batch_addr = base_addr + batch_offset;
>  		u64 sdi_offset = (char *)&data[i].data - (char *)data;
> -- 
> 2.34.1
> 
