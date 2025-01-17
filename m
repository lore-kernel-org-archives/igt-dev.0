Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812EAC02188
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 10:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C57A10EAD7;
	Fri, 17 Jan 2025 10:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qu2FUwZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F258410EAD1
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 10:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737110232; x=1768646232;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=JWZ3AJqLi8zY8YlE0r6DcTf4D8O9eyrIoOCwZ07k6jc=;
 b=Qu2FUwZXXqUUBHRTZdO17RrfJ2r59KObi6KIZt65UbXQnovosaMZZ8vR
 5Bjag8g0okAwSdWGFFIuyYMmnCNYUQunxDiQcH+uKAukXAnhVU04nkT5i
 g8OvFwpO3ACvEKxv9R1wbsHVUyhsYSfC4/4J9hY68yaFCT37IhWMD1bDv
 mBvJ7v8MRgRtIlL1V6J4BB7pPpIwXNIDYrdebMcg4ahYhFFqFJ0n9/IV9
 XNk1VRzu2HneOIF11CM1FlRN7T6uj/axoNt/c3bPXOKcxrbEsV1/q7wlW
 eoS3Q94hS2x96h1PeydmhOgVSi0ISMXmHmgJoFHZ96K+osY75r3WRkwps Q==;
X-CSE-ConnectionGUID: +hgEnrhRT7a4pLejWgfsXg==
X-CSE-MsgGUID: AuGrmNEdTYyRNu6RXuR7KQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37656188"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37656188"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 02:37:12 -0800
X-CSE-ConnectionGUID: a+KA4zAMTe+GgHYTjCm7dA==
X-CSE-MsgGUID: sqPhtFPJSrCnivQHWmlHMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; d="scan'208";a="106361986"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.214])
 ([10.245.246.214])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 02:37:11 -0800
Message-ID: <269bc5f4-fe4a-41c9-b11b-ea2ca8c6824d@intel.com>
Date: Fri, 17 Jan 2025 11:36:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_eudebug: refactor
 exec-queue-placements test
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
References: <20250116125738.146610-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250116125738.146610-1-jan.sokolowski@intel.com>
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

Hi Jan,

On 16.01.2025 13:57, Jan Sokolowski wrote:
> In some cases, ccs_mode_all_engines can fail,
> which will cause test fixture to not execute properly
> and put the rest of the tests in an unstable state. Also,
> ccs_mode_all_engines changes the state of the card for
> other tests as well, thus it should clean after itself too,
> which until now it didn't do.
> 
> Move the test to the end in the execution list and add
> a proper cleanup method, ccs_mode_restore;
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
> 
> v2: Forgot proper path in title
> 
> ---
>   tests/intel/xe_eudebug.c | 46 ++++++++++++++++++++++++++++++----------
>   1 file changed, 35 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 91e9ae885..c93b55857 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2805,6 +2805,25 @@ static void ccs_mode_all_engines(int num_gt)
>   	igt_require(num_gts_with_ccs_mode > 0);
>   }
>   
> +static void ccs_mode_restore(int num_gt)
> +{
> +	int fd, gt, gt_fd, ccs_mode, num_slices;
> +
> +	for (gt = 0; gt < num_gt; gt++) {
> +		fd = drm_open_driver(DRIVER_XE);
> +		gt_fd = xe_sysfs_gt_open(fd, gt);
> +		close(fd);
> +
> +		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
> +			continue;
> +
> +		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", 1) > 0);

Well - this doesn't really restore the previous value, rather sets it to 1.

> +		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> +		igt_assert(ccs_mode == 1);
> +		close(gt_fd);
> +	}
> +}
> +
>   igt_main
>   {
>   	bool was_enabled;
> @@ -2919,17 +2938,6 @@ igt_main
>   	igt_subtest("discovery-empty-clients")
>   		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			drm_close_driver(fd);
> -			ccs_mode_all_engines(gt_count);
> -			fd = drm_open_driver(DRIVER_XE);
> -		}
> -
> -		igt_subtest("exec-queue-placements")
> -			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
> -	}
> -
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   		drm_close_driver(fd);
> @@ -2984,4 +2992,20 @@ igt_main
>   			free(multigpu_was_enabled);
>   		}
>   	}
> +
> +	igt_subtest_group {
> +		igt_fixture {
> +			ccs_mode_all_engines(gt_count);
> +		}
> +
> +		igt_subtest("exec-queue-placements") {
> +			fd = drm_open_driver(DRIVER_XE);
> +
> +			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
> +
> +			ccs_mode_restore(gt_count);

This looks weird - the fixture sets something, that the test unsets. I 
think this should be symmetric - either we want the setting to apply for 
a subtest_group and we set/unset it in a fixture, or we want it to be 
subtest specific so we set/unset it in a subtest. The original placement 
in the fixture indicates the former, though for now we only have a 
single subtest and I am not sure what the plans for future tests are.

I am also not convinced about moving the subtest group to work around 
the fact, that the skip from 'ccs_mode_all_engines' could leave the 
device closed. You could just fix it by either returning an appropriate 
value based on which you skip after reopening the driver in the fixture, 
or let the function handle the closing and opening by passing in the fd, 
and returning a new one. In the end I am also not sure why we need that 
close/open in the first place though I assume it is there for a reason.

Thanks,
Christoph

> +			drm_close_driver(fd);
> +		}
> +	}
> +
>   }
