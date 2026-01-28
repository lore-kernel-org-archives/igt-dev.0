Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D0DD3F083
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:52:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C455B10E1D6;
	Wed, 28 Jan 2026 16:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RoMoZNu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E4F10E1D6
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769619157; x=1801155157;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QK9yCuPWtoZaZWj6xUCdo/Vu4V5TrkprZlCX3D5xRMw=;
 b=RoMoZNu92kNIWUTksGSoxfJIfzwRUFMREC524+KU9gg8tDhlLmf+2w4y
 BX0NyX04We2V22oweEJsDUT5njKD7ss3HbVWWoWONInuN+wtFops3D7Hd
 tezxbjmQ57dTqtEOdNonCMucwS7gtkSktalOGJoQTXWzG3pC7k/XmT/5h
 XSra3Va3Ry6xkXrvIZehr96QRitt439CkBGaPWbWEBqK+XddVFIhpzyLC
 s1FKE38XmzNcVm5JEfQYI1ckj4q6+CPCxzRM6IJOkDejVhJvRfbKT9Vg6
 tN+ya39TgPvGuiYzJepuSb3QsrQf7hU09R5K1pkyYjPKnVhj/DuiPczHb Q==;
X-CSE-ConnectionGUID: wJUDSQLMS0yX/QolwkZk7g==
X-CSE-MsgGUID: 45p7NR7ISrKA6DKc0g/Wjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="88413394"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="88413394"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:52:37 -0800
X-CSE-ConnectionGUID: bN98mKQORgC5GsF6Em+48g==
X-CSE-MsgGUID: Q9b6yuGdReauC7sCQiAi6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="207926398"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 08:52:35 -0800
Date: Wed, 28 Jan 2026 17:52:33 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/xe_exec_system_allocator: Don't leave
 bo_flags uninitialized
Message-ID: <20260128165233.4y4ph3mamwpp45hj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260128164224.932886-4-zbigniew.kempczynski@intel.com>
 <20260128164224.932886-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128164224.932886-5-zbigniew.kempczynski@intel.com>
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

Hi Zbigniew,
On 2026-01-28 at 17:42:26 +0100, Zbigniew Kempczyński wrote:
> Currently it works by accident because compiler optimization initializes
> bo_flags to DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM (even if this
> should happen conditionally) so consecutive xe_bo_create() succeeds.
> But without optimization many subtests start to fail.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> ---
>  tests/intel/xe_exec_system_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 412ad0384e..fc987ac7f4 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1417,7 +1417,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  	};
>  	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>  	struct test_exec_data *data, *next_data = NULL, *original_data = NULL;
> -	uint32_t bo_flags;
> +	uint32_t bo_flags = 0;
>  	uint32_t bo = 0, bind_sync = 0;
>  	void **pending_free;
>  	u64 *exec_ufence = NULL, *bind_ufence = NULL;
> -- 
> 2.43.0
> 
