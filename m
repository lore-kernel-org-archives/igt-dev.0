Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96927C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 10:54:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2925010E4A2;
	Wed,  5 Jun 2024 10:54:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/Qo1Q2l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35EB910E4A2
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 10:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717584865; x=1749120865;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oJW7XjuavN0YDXfEKSr9l8QCEHjI0qeK4GLxMloReLg=;
 b=H/Qo1Q2lhTJilTcDcogAvYYXZO5c0cEzLbObXiDpZa5saOGP/2KDWMmB
 0FT/mvnMuRWbHvkQ5W4WmEm3cdFO92Q/VAjwMVovJTMb3km0t9qLI2Lm0
 7HymNvHcbkB9SgcD1NZr/4zAEfM5CEsK5PN2X+fkRYR9CLRUZIhjVhX5v
 uKjMYMmhiprHVEkCe32yo4mTGvPuVKDJxsXmdK4Yr5hOcoqNPVJNsJo1r
 KQu3QyXd4wL7z5W2P8gSWuW1023pPUdm0C+iwDN7c1LYB1MuR0NDmx8K3
 zsF89eYT9b+k6/Jo+YIaa72PsoQD1Y+3rGh++hiUfkACmznxRhpFo6Zkp A==;
X-CSE-ConnectionGUID: xhkwp0uHQaKqzeSrYRSb4Q==
X-CSE-MsgGUID: IScP2bSSS2WRskh6GclC3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36707094"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="36707094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 03:54:24 -0700
X-CSE-ConnectionGUID: g1x5LSbzTmGHgqC3qhydqA==
X-CSE-MsgGUID: HwF4O7KyTRO4VXnA4ajB/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; d="scan'208";a="37683116"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 03:54:23 -0700
Date: Wed, 5 Jun 2024 12:54:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Subject: Re: [PATCH] tests/intel/xe_exec_fault_mode: enable copy engine
 testing for invalid-va
Message-ID: <20240605105405.wi4ykabj4ernpbfo@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>
References: <20240604-xe_exec_fault_mode-invalid-va_enable_bcs-v1-1-43e032d63353@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604-xe_exec_fault_mode-invalid-va_enable_bcs-v1-1-43e032d63353@intel.com>
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

Hi Andrzej,
On 2024-06-04 at 17:12:44 +0200, Andrzej Hajda wrote:
> Testing copy engine was skipped due to kernel bug. Since bug was
------------------------- ^^^^^^^^^^^^^^^^^^^^^^^^^
imho we should not skip a test due to kernel bug, what we can do
is to add it temporarily to blocklist or just keep it as gitlab
ticket to be fixed. Or we were not sure if it was a bug?

> fixed in kernel [1] we can test all engines.
> 
> [1]: 38007fa96419 ("drm/xe: flush gtt before signalling user fence on all engines")
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_exec_fault_mode.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index f3d2e07ecb32..26d339f5aa58 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -448,11 +448,8 @@ igt_main
>  	}
>  
>  	igt_subtest("invalid-va")
> -		xe_for_each_engine(fd, hwe) {
> -			if (hwe->engine_class == DRM_XE_ENGINE_CLASS_COPY)
> -			       continue;	
> +		xe_for_each_engine(fd, hwe)
>  			test_exec(fd, hwe, 1, 1, INVALID_VA);
> -		}
>  
>  	igt_subtest("invalid-va-scratch-nopagefault")
>  		xe_for_each_engine(fd, hwe)
> 
> ---
> base-commit: f3006a13799e3bc45d754aa8ad318394277d69ac
> change-id: 20240522-xe_exec_fault_mode-invalid-va_enable_bcs-5b82ba2badfc
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
