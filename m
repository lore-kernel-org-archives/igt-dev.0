Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8257C54E67
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 14:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F36810FC27;
	Wed, 27 Mar 2024 14:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ooy7cxcD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8458C10FC27
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711548923; x=1743084923;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=NYa3n2AMejZ+aapr4WkiySX6P70udqfCLmoQHQemeRM=;
 b=Ooy7cxcDR8Fo7ZaWCWvALEAZOQEkOj3MBafbhDDA15rDMyHTs2dTersc
 Z9zvN+CDE5oSsIFbN2jgbBFBCM9g3RbROJG/F0+m63yzCeOG6QbWD/9rW
 PlXyaxOs9nGWgflEKmulneM8ObRgy8JJ3lwSQz+RTfrKjqi4GDbHGYJ3r
 vyGjmo6INrohF6uZ9Vl34PKTMDbt4GMK4ydJBaXONQHB2yLbF38zw9dTN
 pSISKASTLY9lqgmal/ITd1qfFGtQkLfJZAr0HSr0zkcggvCoDGYybPNjf
 4SkW1DEbR7P3FjRUWhDaVBvWJZXXLDSLefvqxZQPWlwzxRoMDJY4O6om4 w==;
X-CSE-ConnectionGUID: tHp0jYL+RxidjQNJcllQZQ==
X-CSE-MsgGUID: CU9DnLgESei3SdTXE6y5hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6786215"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6786215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 07:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; d="scan'208";a="16150121"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 07:15:11 -0700
Date: Wed, 27 Mar 2024 15:14:52 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
Subject: Re: [PATCH] tests/amdgpu: add gem create fuzzing test
Message-ID: <20240327141452.6w273hwwnlmfvllv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, vitaly.prosyak@amd.com,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Joonkyo Jung <joonkyoj@yonsei.ac.kr>,
 Jesse Zhang <Jesse.Zhang@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>
References: <20240327040055.457898-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327040055.457898-1-vitaly.prosyak@amd.com>
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

Hi Vitaly,

On 2024-03-27 at 00:00:55 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> The bug in amdgpu was found using customized Syzkaller and with Kazan enabled.
> Report a slab-use-after-free bug in the AMDGPU DRM driver.
> Ftrace enablement is mandatory precondition to reproduce the error once after boot.
> The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
> 
> The following scenario is a different reproduction of same issue:
> BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu]
> https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646.
-------------------------------------------------------------------^

Please no dots at end of https links, so:
https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646

> 
> Fix Christian König ckoenig.leichtzumerken at gmail.com
> https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html.

Same here, remove dot at end of link.

> 
> The issue is visible only when Kazan enables and dumps to the kernel log:
> BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90.
> We accessed the freed memory during the ftrace enablement in a
> amdgpu_bo_move_notify.
> 
> The test amd_gem_create_fuzzing does amdgpu_bo_reserve 2 times.
> 

imho add here:

Reported-by: Christian König <ckoenig.leichtzumerken@gmail.com>
Reported-by: Joonkyo Jung <joonkyoj@yonsei.ac.kr>

> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Joonkyo Jung <joonkyoj@yonsei.ac.kr>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jesse Zhang <Jesse.Zhang@amd.com>
> Cc: Tvrtko Ursulin <tursulin@igalia.com>
> ---
>  tests/amdgpu/amd_fuzzing.c | 69 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
> index 69c9e8dad..dccac8cc1 100644
> --- a/tests/amdgpu/amd_fuzzing.c
> +++ b/tests/amdgpu/amd_fuzzing.c
> @@ -95,6 +95,67 @@ void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
>  	}
>  }
>  
> +static int
> +amdgpu_ftrace_enablement(const char *function, bool enable)
> +{
> +	char cmd[128];
> +	int ret;
> +
> +	snprintf(cmd, sizeof(cmd),
> +			"echo %s > /sys/kernel/debug/tracing/events/amdgpu/%s/enable",
> +			enable == true ? "1":"0", function);
> +	ret = igt_system(cmd);
> +
> +	return ret;
> +}
> +
> +/* The bug was found using customized Syzkaller and with Kazan enabled.
> + * Report a slab-use-after-free bug in the AMDGPU DRM driver.
> + * Ftrace enablement is mandatory precondition to reproduce the error once after boot.
> + * The bug was reported by Joonkyo Jung <joonkyoj@yonsei.ac.kr>.
> + *
> + * BUG: KFENCE: use-after-free read in amdgpu_bo_move+0x1ce/0x710 [amdgpu]
> + * https://gitlab.freedesktop.org/drm/amd/-/issues/3171#note_2287646
> + *
> + * Fix Christian König ckoenig.leichtzumerken at gmail.com
> + * https://lists.freedesktop.org/archives/amd-gfx/2024-March/105680.html
> + *
> + * The issue is visible only when Kazan enables and dumps to the kernel log:
> + * BUG: KASAN: slab-use-after-free in amdgpu_bo_move+0x974/0xd90
> + * We accessed the freed memory during the ftrace enablement in a
> + * amdgpu_bo_move_notify.
> + * The test amd_gem_create_fuzzing does amdgpu_bo_reserve
> + */
> +static void
> +amd_gem_create_fuzzing(int fd)
> +{
> +	static const char function_amdgpu_bo_move[] = "amdgpu_bo_move";
> +	union drm_amdgpu_gem_create arg;
> +	int ret;
> +
> +	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, true);
> +	igt_assert_eq(ret, 0);
> +	arg.in.bo_size = 0x8;
> +	arg.in.alignment = 0x0;
> +	arg.in.domains = 0x4;
> +	arg.in.domain_flags = 0x9;
> +	ret = drmIoctl(fd, 0xc0206440
> +			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
> +	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
> +
> +	arg.in.bo_size = 0x7fffffff;
> +	arg.in.alignment = 0x0;
> +	arg.in.domains = 0x4;
> +	arg.in.domain_flags = 0x9;
> +	ret = drmIoctl(fd, 0xc0206440
> +			/* DRM_AMDGPU_GEM_CREATE amdgpu_gem_create_ioctl */, &arg);
> +	igt_info("drmCommandWriteRead DRM_AMDGPU_GEM_CREATE ret %d\n", ret);
> +
> +	ret = amdgpu_ftrace_enablement(function_amdgpu_bo_move, false);
> +	igt_assert_eq(ret, 0);
> +
> +}
> +
>  igt_main
>  {
>  	int fd = -1;
> @@ -114,6 +175,14 @@ igt_main
>  	igt_subtest("cs-wait-fuzzing")
---------------- ^
>  		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
------- ^
>  
> +	igt_describe("Check cs wait fuzzing");
> +	igt_subtest("cs-wait-fuzzing")
---------------- ^
You have that exact subtest above? is it copy-paste?

> +		amd_cs_wait_fuzzing(fd, arr_types, ARRAY_SIZE(arr_types));
------- ^
Same as above.

> +
> +	igt_describe("Check gem create fuzzing");
> +	igt_subtest("gem-create-fuzzing")
> +		amd_gem_create_fuzzing(fd);
> +

Just curious, will it work with --r ?

sudo tests/amd_fuzzing --r cs-wait-fuzzing
and
sudo tests/amd_fuzzing --r gem-create-fuzzing

Regards,
Kamil

>  	igt_fixture {
>  		drm_close_driver(fd);
>  	}
> -- 
> 2.25.1
> 
