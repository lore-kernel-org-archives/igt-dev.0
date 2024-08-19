Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384F6C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 15:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C9910E2E4;
	Mon, 19 Aug 2024 15:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zho333XI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5867A10E2E4
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724082460; x=1755618460;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R2NwfzQxhoHaNfaFy1UzpaicH47eyw34PsMEvCOeinE=;
 b=Zho333XIgzZ1x1uqfb3xD1BVqTJRcGzjw1Irpo98jYKT4G+PcNkb0N8h
 GnsWVt42FmBr02PJw1+1rDmj58ocxXyG9uWAMHUOZJBXBgB3ooaW+oX5U
 2GsaXhO43FNlr9BaobkSlQ6UwZHO4cEFB6tyImFBT9HRxGb5GMy/0zSZA
 xUjrZ7Cy+hMd5ceGYlyBzdLrphZ/49souYgIM/J0/mXWWwNlgR12mOtJJ
 e0xTu6AOhlLvgTEXjYsItxU3NkwLpNhTA+1Gfx8WcfKTsjkR+R37Pg8Ki
 pcX1TR8kAnuwVyN0X2Xj7Qn+lMWdFmzDmrln9t3T7fYHhcDVaUAZ78B90 A==;
X-CSE-ConnectionGUID: HzDtRNcMTVeYzn/ilyHboQ==
X-CSE-MsgGUID: JS6ktgExTFaqV0X9/o8qwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22222749"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22222749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:47:40 -0700
X-CSE-ConnectionGUID: vRcsi+z2Tv2k1yVw5KRhxA==
X-CSE-MsgGUID: zljcrOlsQ4KSfzAQzMPB1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="64577229"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.49.79])
 ([10.246.49.79])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:47:38 -0700
Message-ID: <88be445a-0b20-4c9a-824a-8b1fbcceea2d@linux.intel.com>
Date: Mon, 19 Aug 2024 17:47:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/gem_spin_batch: Skip compute engines on
 DG2 due to w/a
To: Jonathan-Cavitt <jonathan.cavitt@intel.com>, igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, nirmoy.das@intel.com,
 chris.p.wilson@linux.intel.com, john.c.harrison@intel.com
References: <20240816213110.718186-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240816213110.718186-1-jonathan.cavitt@intel.com>
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


On 8/16/2024 11:31 PM, Jonathan-Cavitt wrote:
> Much like MTL, there's a w/a on DG2 that prevent the execution of
> multiple non-preemptible processes on RCS and CCS.  So, prevent the
> running of CCS engines in the 'spin-all-new' test, extending the MTL
> solution to DG2.
>
> Suggested-by: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
> CC: Nirmoy Das <nirmoy.das@intel.com>
> CC: Chris Wilson <chris.p.wilson@linux.intel.com>


LGTM now that DG2 and MTL are handled in the same func

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   tests/intel/gem_spin_batch.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/gem_spin_batch.c b/tests/intel/gem_spin_batch.c
> index 682a062180..85408a4c0d 100644
> --- a/tests/intel/gem_spin_batch.c
> +++ b/tests/intel/gem_spin_batch.c
> @@ -161,16 +161,24 @@ spin_on_all_engines(int fd, const intel_ctx_t *ctx,
>   }
>   
>   /*
> - * Wa_14019159160:
> - * An RCS/CCS workaround on MTL means that contexts from different address spaces
> - * cannot run in parallel, they must be timesliced. However, a non-preemptible
> - * spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX test cannot be run
> - * across both RCS and CCS engines, one or other must be skipped for the test to
> - * not hit a heartbeat timeout and be killed.
> + * Wa_14019159160:MTL
> + * Wa_114014494547:DG2
> + * An RCS/CCS workaround on some platforms means that contexts from different
> + * address spaces cannot run in parallel, they must be timesliced. However, a
> + * non-preemptible spinner cannot be timesliced. Thus the PARALLEL_SPIN_NEW_CTX
> + * test cannot be run across both RCS and CCS engines, one or other must be
> + * skipped for the test to not hit a heartbeat timeout and be killed.
>    */
>   static bool skip_bad_engine(int fd, const struct intel_execution_engine2 *e)
>   {
> -	return IS_METEORLAKE(intel_get_drm_devid(fd)) && (e->class == I915_ENGINE_CLASS_COMPUTE);
> +	uint32_t devid = intel_get_drm_devid(fd);
> +
> +	if (IS_METEORLAKE(devid) && (e->class == I915_ENGINE_CLASS_COMPUTE))
> +		return true;
> +	else if (IS_DG2(devid) && (e->class == I915_ENGINE_CLASS_COMPUTE))
> +		return true;
> +	else
> +		return false;
>   }
>   
>   static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
