Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F31EB1053
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 11:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458CB10E262;
	Tue, 10 Mar 2026 11:52:54 +0000 (UTC)
Received: from mgamail.intel.com (unknown [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7285E10E262
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 11:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773143568; x=1804679568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cLIdPd0MK9Df8PwxuIrRMNoE8X0PyZCsGCWOdyCMuWQ=;
 b=fvbO1T+476F49tNHcXRjTSNL3n8jjxFAFqWmqpF55Xz9fq/wHnlZLL5d
 dvo1bGdWk7bs2iWAclC0uhu20FMjm3YebIGKkMtk56Phq9BW5m3XbdVKz
 XLg5LrF2nhAr9LQLRTnE0v/gRGjBQya9FNeL9RcMr3oFz983qIzmNAdhi
 Dr0sB3T1idVhvYLvX5K2/hORxrjG6/QYSYdnJgukJZr6jt7PAIV5u3d4p
 /0HKMME9EVsplHL0OtD39gTKbS6woSVisGonludCU2HaXljzGl/qLuWuk
 EFFcxoxkNe4Mo2GZP76G8429TyEQUeWnWw26yLf9tVhWKK2Qjc5xTfQo3 w==;
X-CSE-ConnectionGUID: u1eWd01qTWagLJHjSt7tMw==
X-CSE-MsgGUID: JQuaPIAsRC6R9FCN6pLrRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74376849"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74376849"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 04:52:37 -0700
X-CSE-ConnectionGUID: 7/295EKoTIqzZhamua9BZA==
X-CSE-MsgGUID: mimmP+CPSTewbnM2YQcu9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="225025652"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 04:52:36 -0700
Date: Tue, 10 Mar 2026 12:52:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Cc: igt-dev@lists.freedesktop.org, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com
Subject: Re: [PATCH] lib/vmwgfx: Fix null mob in vmw_ioctl_buffer_create.
Message-ID: <20260310115232.j5j22bzqhzmavmmu@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
 igt-dev@lists.freedesktop.org, ian.forbes@broadcom.com,
 zack.rusin@broadcom.com
References: <20260309223937.1581808-1-maaz.mombasawala@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260309223937.1581808-1-maaz.mombasawala@broadcom.com>
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

Hi Maaz,
On 2026-03-09 at 15:39:37 -0700, Maaz Mombasawala wrote:
> vmw_ioctl_buffer_create() may be called with a null mob, and this
> causes a null dereference when trying to get the buffer handle.
> In the case of a null mob, pass an invalid buffer handle instead,
> and the kernel will create a backing mob for the surface object
> when we call surface create ioctl.
> 
> Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
> ---
>  lib/igt_vmwgfx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
> index 94d255655..6d021045a 100644
> --- a/lib/igt_vmwgfx.c
> +++ b/lib/igt_vmwgfx.c
> @@ -415,9 +415,10 @@ struct vmw_surface *vmw_ioctl_buffer_create(int fd, SVGA3dSurfaceAllFlags flags,
>  					    uint32_t size, struct vmw_mob *mob)
>  {
>  	SVGA3dSize surface_size = { .width = size, .height = 1, .depth = 1 };
> +	const uint32_t buffer_handle = mob ? mob->handle : SVGA3D_INVALID_ID;
>  
>  	return vmw_create_surface_simple(fd, flags, SVGA3D_BUFFER, surface_size,
> -					 mob->handle);
> +					 buffer_handle);

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

PS. I will merge it without a dot at end
[PATCH] lib/vmwgfx: Fix null mob in vmw_ioctl_buffer_create

>  }
>  
>  /**
> -- 
> 2.53.0
> 
