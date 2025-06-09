Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02EFC5B552
	for <igt-dev@archiver.kernel.org>; Mon,  9 Jun 2025 10:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8903110E02E;
	Mon,  9 Jun 2025 10:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLMG25om";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0FB10E02E
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Jun 2025 10:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749466346; x=1781002346;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jZRpZh2KVvBJdd7c8vjK6Q2U7Ih8QxUTJEbQgiJYA8Q=;
 b=JLMG25omU/ZLcXu3wp5I7xCjUXS8cR6Wjt6u2jVqJyMkHYig94vnXxdY
 p4IRZJOSfMQRNVJbWh2pzyloZW8iJdJTaAEJ0zioVhun/9dBxUb8dKD/T
 82r/mfeQ9r1m6yIciko3KiUfo3ksKeiWlbV2JTgqZZim9/RMBRXmUcdGh
 Yde/unRTqEXXtPhplyuAXztxme0ZLxYHptXwtuqQLyzxDK26GEzmSiD4X
 hSryVOmS8mu7R1VDedxgHhnyODbE0oHrtLyBqmbpQnPC9ZTIXLOsTPDRd
 E0O2BE3FiPO1C1v4SthfyTHAQTMKLisVpqpQfaIJrJQsBalGWe8bxmB74 A==;
X-CSE-ConnectionGUID: HWExMs1lT8ezOc0I1yHxuQ==
X-CSE-MsgGUID: L9EFig0WSyGaqdzRjoUfMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62940866"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="62940866"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 03:52:26 -0700
X-CSE-ConnectionGUID: DC2XbhuMSm+wfzo6mFh+zg==
X-CSE-MsgGUID: 8wc9XqN0TKqkkLkE/fliaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="151296349"
Received: from unknown (HELO [10.66.97.100]) ([10.66.97.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 03:52:25 -0700
Message-ID: <4fddf697-f3a1-4269-a9b5-4d4e3217879d@intel.com>
Date: Mon, 9 Jun 2025 16:22:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,2/2] tests/intel/kms_frontbuffer_tracking: Enable the tests
 support variations based on the WAs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20250601124355.16351-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250601124355.16351-1-mohammed.thasleem@intel.com>
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

Hello Thasleem,

On 01-06-2025 18:13, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests support variations based on the WAs.
>
> v2: Use WA_FBC_DISABLED instead CHECK_WA. (Vinod)
>      Update igt_skip_on_f discription. (Vinod)
> v3: Remove platform check and make it for xe specific. (Vinod)
>      Rename function name with is_fbc_support. (Vinod)
> v4: Update function name and add igt_skip_on_f at calling function. (Vinod)
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>   tests/intel/kms_frontbuffer_tracking.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> index 0809352cb..66a5177fe 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -781,6 +781,7 @@
>    */
>   
>   #define TIME SLOW_QUICK(1000, 10000)
> +#define WA_FBC_DISABLED "16023588340"
>   
>   IGT_TEST_DESCRIPTION("Test the Kernel's frontbuffer tracking mechanism and "
>   		     "its related features: FBC, PSR and DRRS");
> @@ -2248,6 +2249,16 @@ static void do_flush(const struct test_mode *t)
>   
>   #define ASSERT_NO_IDLE_GPU		(1 << 11)
>   
> +static bool is_fbc_supported(int devid, const struct test_mode *t)
> +{
> +	int wa;
> +
> +	wa = igt_has_intel_wa(drm.fd, WA_FBC_DISABLED);
> +	igt_assert_f(wa >= 0, "WA path not found on GTs\n");
> +
> +	return wa != 1;
> +}
Better to move this to a new helper (kms_fbc_helper.c) or some library
since kms_dirtyfb, kms_fbcon_fbt, kms_psr and kms_psr2_sf may require
similar check.

Apart from that LGTM, you can have my rb on both patch of the series.
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> +
>   static int adjust_assertion_flags(const struct test_mode *t, int flags)
>   {
>   	if (!(flags & DONT_ASSERT_FEATURE_STATUS)) {
> @@ -2610,8 +2621,8 @@ static void prepare_subtest_data(const struct test_mode *t,
>   static void prepare_subtest_screens(const struct test_mode *t)
>   {
>   	/* FBC disabled: Wa_16023588340 */
> -	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> -		      "FBC isn't supported on BMG\n");
> +	igt_skip_on_f(t->feature == FEATURE_FBC && !is_fbc_supported(drm.devid, t),
> +		     "WA has disabled FBC on BMG\n");
>   
>   	if (t->pipes == PIPE_DUAL)
>   		enable_both_screens_and_wait(t);
> @@ -2658,8 +2669,8 @@ static void prepare_subtest(const struct test_mode *t,
>   static void rte_subtest(const struct test_mode *t)
>   {
>   	/* FBC disabled: Wa_16023588340 */
> -	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
> -		      "FBC isn't supported on BMG\n");
> +	igt_skip_on_f(t->feature == FEATURE_FBC && !is_fbc_supported(drm.devid, t),
> +		     "WA has disabled FBC on BMG\n");
>   
>   	prepare_subtest_data(t, NULL);
>   
> @@ -4157,8 +4168,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			t.tiling = opt.tiling;
>   
>   			/* FBC disabled: Wa_16023588340 */
> -			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
> -				      "FBC isn't supported on BMG\n");
> +			igt_skip_on_f(t.feature == FEATURE_FBC && !is_fbc_supported(drm.devid, &t),
> +				     "WA has disabled FBC on BMG\n");
>   
>   			for_each_pipe(&drm.display, pipe) {
>   				if (pipe == default_pipe) {
