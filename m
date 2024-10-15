Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371ABD1D882
	for <igt-dev@archiver.kernel.org>; Tue, 15 Oct 2024 15:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E487188E45;
	Tue, 15 Oct 2024 15:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYaxh10m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445B488E45
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Oct 2024 15:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729007648; x=1760543648;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tquNbPAmxprYEwG06JdodEa/ibsqbJtXFOpvzdIyG9Y=;
 b=LYaxh10mk/J7bmXUWl5seWjnEL4XOZaUaoTlC7cLF6eSIg78G4JV11BQ
 cK2M9d9JsHJK1s7x+9ISI9NiBKL3MeNfHibtkKUIMQ4skDed9BcXXuq99
 q6CEDFBr/vSRtPRmMphq5ftY8WdWZxOdIvM0pKWz8IlpT36QnpNs2txXT
 GdKn36V3ZE+z3o8PUrglWy1/cL3dWes+o1vF0It2ua1TkosZGn1HNYxX2
 WT4RmKYnw1QXwXG80g12OJayK78YF3kkN9p8xQJWgXsJPF6jP4MTY1S3x
 PBYLEX4DlVXG5I4/jlfajoqAsF2YWvDDBq8owo7maF59wa0N40pskHNNZ g==;
X-CSE-ConnectionGUID: krqsxXZvSduTo2tnNgaz5g==
X-CSE-MsgGUID: mV18TmHbTe++5UOi7C218w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38962593"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="38962593"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:54:08 -0700
X-CSE-ConnectionGUID: kuwkArSgT4auxKLVgd63hw==
X-CSE-MsgGUID: 4IHK3CPDRuuxGJOtY5vskg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77603212"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 08:54:06 -0700
Date: Tue, 15 Oct 2024 17:54:02 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Pravalika Gurram <pravalika.gurram@intel.com>
Cc: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 katarzyna.piecielska@intel.com
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_compute_mode: LR mode
 should use command or render
Message-ID: <20241015155402.bhptmvssdpm34osj@zkempczy-mobl2>
References: <20241015141826.4186247-1-pravalika.gurram@intel.com>
 <20241015141826.4186247-3-pravalika.gurram@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241015141826.4186247-3-pravalika.gurram@intel.com>
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

On Tue, Oct 15, 2024 at 07:48:26PM +0530, Pravalika Gurram wrote:
> Spinner which has to run in LR mode should be
> executed on compute or render command streamer.
> Stop assuming engine id is equal to 1
> and use 'xe_find_engine_by_class'
> helper to find engine by its class.
> use 'xe_find_engine_by_class' with required engine class
> to get the engine info.

Use 'fmt -w 76' to format above paragraph (pipe to fmt via !
if you're using vim).

> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> ---
>  tests/intel/xe_exec_compute_mode.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
> index 82e607848..f62859689 100644
> --- a/tests/intel/xe_exec_compute_mode.c
> +++ b/tests/intel/xe_exec_compute_mode.c
> @@ -457,11 +457,18 @@ static void lr_mode_workload(int fd)
>  	uint64_t ahnd;
>  	uint32_t bo;
>  	uint32_t ts_1, ts_2;
> +	uint32_t num_engines;
>  
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = xe_bb_size(fd, sizeof(*spin));
> -	engine = xe_engine(fd, 1);
> +
> +	num_engines = xe_number_engines(fd);

This value isn't useful.

> +	engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_COMPUTE);
> +	if (engine == NULL)
> +		engine = xe_find_engine_by_class(fd, DRM_XE_ENGINE_CLASS_RENDER);
> +	igt_skip_on_f((engine == NULL), "num_engines %d\n", num_engines);

igt_skip_on_f(engine == NULL,
	      "No compute/render engine found to run in LR mode.\n");

--
Zbigniew

> +
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, engine->instance.gt_id), 0);
>  	spin = xe_bo_map(fd, bo, bo_size);
>  
> -- 
> 2.34.1
> 
