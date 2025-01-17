Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280FEC02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 12:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61BF10EAD4;
	Fri, 17 Jan 2025 12:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Km3IvVtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAD810EAD4
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737115322; x=1768651322;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AFFFg1M0NLndTtA8j/gNO7pzhB8ymh8P0bBzBu5LS7A=;
 b=Km3IvVtK88fJApfF874KnYRWt7Svk7QhGRe8ewb9ikVBgsfdIUVxDnkW
 DEP1XdEjRdmQHZVGeXQavzlwdig5Nne/IvJj5KsfPoAnEk671KGdkhkYb
 u8besZsC6xoShX3zij0uiBpX/IYO0+zmy6cDQRTVUNwHUCm0UdgULEPQN
 rQpFu12Nr+paeIFKYGf0YRh2NEJMw1k55dIs0yayS8c8GV2KAat8AOOqJ
 FJDHlY+Kt7GXagpa1X+xlg1yeJ89EQGYS9A9dHh41xQ6OxUmw3T6fmGMp
 Ko01e0kzwTQ6HsgFUawi74/0v1a9CfUue6AelleG0dzu3oFWGRIZSYI58 A==;
X-CSE-ConnectionGUID: YrKjg5y7Qe2vu2OHBG+vIA==
X-CSE-MsgGUID: YtIhUqAjS32FdXEnGH+yRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37425613"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="37425613"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 04:01:48 -0800
X-CSE-ConnectionGUID: PgSxQ3byT2OvszQMCACtCg==
X-CSE-MsgGUID: BUgg7VJ6RAqJNQrLJl8zzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; d="scan'208";a="106345637"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.214])
 ([10.245.246.214])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 04:01:46 -0800
Message-ID: <a881b452-4e0c-421f-8c7f-37ffca824c50@intel.com>
Date: Fri, 17 Jan 2025 13:01:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/intel/xe_eudebug: refactor
 exec-queue-placements test
To: Jan Sokolowski <jan.sokolowski@intel.com>, igt-dev@lists.freedesktop.org
References: <20250117082055.154635-1-jan.sokolowski@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250117082055.154635-1-jan.sokolowski@intel.com>
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

On 17.01.2025 09:20, Jan Sokolowski wrote:
> In some cases, ccs_mode_all_engines can fail,
> which will cause test fixture to not execute properly
> and put the rest of the tests in an unstable state. Also,
> ccs_mode_all_engines changes the state of the card for
> other tests as well, thus it should clean after itself too,
> which until now it didn't do.
> 
> Refactor exec-queue-placements test so that all possible
> failure paths are serviced, and add a proper cleanup method,
> ccs_mode_restore.
> 
> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
> ---
> 
> v2: Forgot proper path in title
> v3: More changes. Moved test back to where it originally was

Sorry I missed that version and replied to v2 earlier, though some of my 
comments still stand.

> 
> ---
> 
>   tests/intel/xe_eudebug.c | 41 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
> index 91e9ae885..9787183ed 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -2797,7 +2797,7 @@ static void ccs_mode_all_engines(int num_gt)
>   
>   		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
>   		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> -		igt_assert(num_slices == ccs_mode);
> +		igt_require(num_slices == ccs_mode);

Can you explain this change? We successfully write ccs_mode but we 
expect to don't read back the written value? I admit that I don't know 
how this setting works, but that looks suspicious at first glance.

>   		close(gt_fd);
>   	}
>   
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

See my comment from v2.

> +		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
> +		igt_assert(ccs_mode == 1);
> +		close(gt_fd);
> +	}
> +}
> +
>   igt_main
>   {
>   	bool was_enabled;
> @@ -2920,16 +2939,26 @@ igt_main
>   		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
>   
>   	igt_subtest_group {
> -		igt_fixture {
> +		bool restore_ccs = false;
> +
> +		igt_subtest("exec-queue-placements") {
>   			drm_close_driver(fd);
> +			fd = -1;
>   			ccs_mode_all_engines(gt_count);
> +			restore_ccs = true;

Do we need this flag? I would assume, that we always want to restore the 
previous state. It would just have no effect at worst.


>   			fd = drm_open_driver(DRIVER_XE);
> -		}
> -
> -		igt_subtest("exec-queue-placements")
>   			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
> +		}
> +		igt_fixture {
> +			if (restore_ccs) {
> +				drm_close_driver(fd);
> +				fd = -1;
> +				ccs_mode_restore(gt_count);
> +			}
> +			if (fd == -1)
> +				fd = drm_open_driver(DRIVER_XE);

Like in my comment in v2 - that looks like a weird workaround for 
skipping too early in the fixture.

Thanks,
Christoph
> +		}
>   	}
> -
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   		drm_close_driver(fd);
