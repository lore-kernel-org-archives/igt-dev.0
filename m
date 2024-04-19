Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B45C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC44910E261;
	Fri, 19 Apr 2024 14:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrGkEOqq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A036B10E261
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 14:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713537456; x=1745073456;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0mNTVp+y0Hr2p+CB/Bn1U13kRI76qZTzQuORl+RnDwY=;
 b=nrGkEOqqsCQsSjMqtQ1/c+31DUv3h4uHXl+1k42+rAK8yBKs5ef3Zcm4
 O/jC50HZNYRLY/7nLequsTES+JGJfUKFP/rx5jQsPZZOz/E4DH5RYadx2
 NhVxTqpClLR4glCAaX7tRuCAnM00ZXJw8F75C425PctTMdjGzXBo8IZzX
 U/kPIzFHYqn++gQwe5Fms9ve0POg/b4JNkp2PfTCqAQmuu1T9cacbEA3A
 GKt1Tfm4pD46bCz58xqDbMpBR/9LfI3XoNtFvoOHA+amKuCoMh47lr+D6
 JPiyWtpfgSiu9Y/m9E5ZE17lJVJuNlF0oxYlHAAgMimza9nrWoBCBWFm/ w==;
X-CSE-ConnectionGUID: UpCbqgCuTF+w3VpdM6pXjA==
X-CSE-MsgGUID: 7fW+RtvbSNWMMcnC1fDysw==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12932057"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12932057"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:37:35 -0700
X-CSE-ConnectionGUID: 27EycSfPRhGWpGcx1KCl8Q==
X-CSE-MsgGUID: rvHjdiCqQ1KHrjUAiiIhLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="27813222"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:37:30 -0700
Date: Fri, 19 Apr 2024 16:37:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <me@petersenna.com>, andi.shyti@linux.intel.com
Subject: Re: [PATCH i-g-t] tests/intel/gem_exec_capture: fix use of
 igt_allow_hang() / igt_disallow_hang()
Message-ID: <20240419143726.24mjecbdqcb6zrut@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <me@petersenna.com>,
 andi.shyti@linux.intel.com
References: <20240411191934.10368-1-me@petersenna.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240411191934.10368-1-me@petersenna.com>
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

Hi Peter,
On 2024-04-11 at 21:19:23 +0200, Peter Senna Tschudin wrote:

small nit on subject, you fixed uninitialized var used, so imho

[PATCH i-g-t] tests/intel/gem_exec_capture: fix use of igt_allow_hang() / igt_disallow_hang()

would be better and shorter with:

[PATCH i-g-t] tests/intel/gem_exec_capture: fix use of uninitialized hang var

> The function main has a variable igt_hang_t hang defined, and it is
> currently used by igt_disallow_hang(). However igt_disallow_hang() is
> using the variable uninitialized making valgrind unhappy:
> 
>  Syscall param ioctl(generic) points to uninitialised byte(s)
>     at 0x4ACD3ED: ioctl (in /usr/lib64/libc.so.6)
>     by 0x49ACF4F: drmIoctl (xf86drm.c:704)
>     by 0x488AF46: __gem_context_set_param (gem_context.c:260)
>     by 0x48A4D9F: context_set_ban (igt_gt.c:161)
>     by 0x48A53DC: igt_disallow_hang (igt_gt.c:228)
>     by 0x4013D7: __igt_unique____real_main959 (gem_exec_capture.c:1069)
>     by 0x401242: main (gem_exec_capture.c:959)
>   Address 0x1fff000170 is on thread 1's stack
>   in frame #3, created by context_set_ban (igt_gt.c:154)
>   Uninitialised value was created by a stack allocation
>     at 0x401340: __igt_unique____real_main959 (gem_exec_capture.c:960)
> 
>  Conditional jump or move depends on uninitialised value(s)
>     at 0x48A53E2: igt_disallow_hang (igt_gt.c:230)
>     by 0x4013D7: __igt_unique____real_main959 (gem_exec_capture.c:1069)
>     by 0x401242: main (gem_exec_capture.c:959)
>   Uninitialised value was created by a stack allocation
>     at 0x401340: __igt_unique____real_main959 (gem_exec_capture.c:960)
> 
>  Syscall param ioctl(generic) points to uninitialised byte(s)
>     at 0x4ACD3ED: ioctl (in /usr/lib64/libc.so.6)
>     by 0x49ACF4F: drmIoctl (xf86drm.c:704)
>     by 0x488AF46: __gem_context_set_param (gem_context.c:260)
>     by 0x48A540A: igt_disallow_hang (igt_gt.c:236)
>     by 0x4013D7: __igt_unique____real_main959 (gem_exec_capture.c:1069)
>     by 0x401242: main (gem_exec_capture.c:959)
>   Address 0x1fff0001b0 is on thread 1's stack
>   in frame #3, created by igt_disallow_hang (igt_gt.c:224)
>   Uninitialised value was created by a stack allocation
>     at 0x401340: __igt_unique____real_main959 (gem_exec_capture.c:960)

Good catch, could you leave only that 3rd report from valgrind
starting from 'Syscall param ...'? imho this should explain it.

With that,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> 
> This patch sets the content of the variable hang with the return value
> of igt_allow_hang() following what is used elsewhere in the codebase.
> After this patch valgrind does not complain about the  errors listed.
> 
> Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
> ---
>  tests/intel/gem_exec_capture.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
> index 8800fa586..e462aa96f 100644
> --- a/tests/intel/gem_exec_capture.c
> +++ b/tests/intel/gem_exec_capture.c
> @@ -990,7 +990,7 @@ igt_main
>  
>  			gem_context_set_param(fd, &param);
>  		}
> -		igt_allow_hang(fd, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
> +		hang = igt_allow_hang(fd, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
>  
>  		dir = igt_sysfs_open(fd);
>  		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
> -- 
> 2.44.0
> 
