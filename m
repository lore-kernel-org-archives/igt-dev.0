Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E5CC48260
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 09:34:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA60E10E1E4;
	Tue, 13 Feb 2024 09:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="brh5OqK5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB41B10E1E4
 for <IGT-Dev@lists.freedesktop.org>; Tue, 13 Feb 2024 09:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707816863; x=1739352863;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=6IAyaJjtAR8fvtsTodNxEfRPhGLoTiAngMTKII/ySgA=;
 b=brh5OqK5sRhd1dQ8qPrx8SsXmqa/MxtqotCLdTuZn9ju1iXqIW2Yohhl
 92+BUftW967APT9sHjk/+4/iitpqLO2Bxk82cZS3l2+mT0wzr6vuPxtjJ
 yiIL+8cOtc9F9CgGz+mQ7/njiahoehFCVRdE0465GlBh1gj/Zvp3BGiBp
 jCCRPLa8ANyqyBhyNZNgV5sW3hgomG3eZApxiEDYvouHoMYC+YmHs9fTq
 i9cw5GKlcBlQCBcBhIxSTPISlDZklg7fhGPImpnZULmW0ywNWS8Ic5B29
 XgzlaIl7WpDAk/D/RAPuKigjbIxulWRD5q9opLWwAFbVCUEQOpLbRiylN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1959583"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="1959583"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 01:34:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="935309421"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="935309421"
Received: from lmcoquer-mobl.ger.corp.intel.com (HELO [10.213.230.64])
 ([10.213.230.64])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 01:34:21 -0800
Message-ID: <fc965672-a30a-4f5a-98af-2cdab1f53153@linux.intel.com>
Date: Tue, 13 Feb 2024 09:34:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/gem_watchdog: Reduced timeouts for
 worst case scenario
Content-Language: en-US
To: John.C.Harrison@Intel.com, IGT-Dev@Lists.FreeDesktop.Org
References: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20240212212328.3794573-1-John.C.Harrison@Intel.com>
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


On 12/02/2024 21:23, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The watchdog test reduces the watchdog timer from 20s to 1s and then
> uses a 5s timeout waiting for the watchdog to do its stuff. This works
> fine in general, but if an engine reset is required by a context that
> is actually dead for real then a pre-emption timeout must be factored
> in. For RCS/CCS engines, that timeout is 7.5 seconds by default. Thus,
> the test timeout expires first and the test fails.
> 
> Normally, the system is not so dead when running this test as to
> require an engine reset. A simple pre-emption works fine for the
> spinner contexts that is uses. However, there is a hardware workaround
> coming which prevents context switches when both RCS and CCS are busy.
> 
> So add an explicit override of the pre-emption timeout as well as the
> watchdog timeout. That will allow the test to keep working after the
> new w/a lands.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   tests/intel/gem_watchdog.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/tests/intel/gem_watchdog.c b/tests/intel/gem_watchdog.c
> index 1e4c350214c0..c9dd0deb51aa 100644
> --- a/tests/intel/gem_watchdog.c
> +++ b/tests/intel/gem_watchdog.c
> @@ -577,6 +577,16 @@ igt_main
>   
>   		i915 = drm_reopen_driver(i915); /* Apply modparam. */
>   		ctx = intel_ctx_create_all_physical(i915);
> +
> +		for_each_ctx_engine(i915, ctx, e) {
> +			/*
> +			 * Context termination by watchdog may require an engine reset. That only
> +			 * occurs after a pre-emption attempt has expired. For RCS/CCS engines,
> +			 * the pre-emption timeout is longer than this test is wanting to wait.
> +			 * So reduce that timeout in addition to the watchdog timeout itself.
> +			 */
> +			gem_engine_property_printf(i915, e->name, "preempt_timeout_ms", "%d", 640);
> +		}

Restore at test exit for subsequent tests to be in a known environment?

Regards,

Tvrtko

>   	}
>   
>   	igt_subtest_group {
