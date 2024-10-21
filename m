Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8706D15DB3
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 15:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8001A10E547;
	Mon, 21 Oct 2024 15:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kEon1Juu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2932010E547
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729525274; x=1761061274;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=K03rqJeowcJwEpAv381BhPgBn255J7Kwxma8x1RFFGw=;
 b=kEon1JuuoDTVU5Mr1h6bfDc+5LQitruE1eCMSzTu321s0X6k8wFERmQK
 6F5aZqCYwosOJVDNX2L0oZevfMl3ZeC9uTbQgmKJJzmpgH8bRkXG+P7gz
 bzGe22L35fN2BYcOF/rWOC6Ex6iP0RH/zLQjeSjHWrzyzeIpcQ/0DssPO
 6AWUe+RN1FP69XB4XFpIaMHWU26mGTtQ6z2n43pgQQ82bK6rgRLUhEAbk
 VZYdjJonHXAvENq6by8bPzC3evZuAJafsTTO7W0lt4Ln8uO1EaCvWs8X3
 u3dXx73BuXyJAhcoU3wcpiSKzKFktWTSQBwD2Lwn6df+Gjtm5u/1JvnUj g==;
X-CSE-ConnectionGUID: n76CQhxIRYa710tBzMZMIg==
X-CSE-MsgGUID: MKPZNlRyTtOCbTICrq6gqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="28894612"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="28894612"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 08:41:14 -0700
X-CSE-ConnectionGUID: 0hDt4CaJR8Wqc5PlVh06Gg==
X-CSE-MsgGUID: vU0tI0ofTSWQE3qBib/kxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; d="scan'208";a="79199553"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 08:41:12 -0700
Date: Mon, 21 Oct 2024 17:40:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: Use
 xe_find_engine_by_class
Message-ID: <20241021154057.prfzslhuxmrbo6z4@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
References: <20241016101933.4191790-1-pravalika.gurram@intel.com>
 <20241016101933.4191790-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241016101933.4191790-3-pravalika.gurram@intel.com>
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

Hi Pravalika,
On 2024-10-16 at 15:49:33 +0530, Pravalika Gurram wrote:
> Use 'xe_find_engine_by_class' helper to get the engine info with the
> required engine class.  Stop assuming engine id is equal to 1
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 82e607848..b238503ea 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -461,7 +461,10 @@ static void lr_mode_workload(int fd)
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = xe_bb_size(fd, sizeof(*spin));
> -	engine = xe_engine(fd, 1);
> +
> +	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COPY);
> +	igt_assert(engine);

Instead of igt_assert it could be better to use
	igt_skip_on(!engine, "message...\n")

also move that to begin of this function (before vm_create or other inits)

Regards,
Kamil

> +
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
> -- 
> 2.34.1
> 
