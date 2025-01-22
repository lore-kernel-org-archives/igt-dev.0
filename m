Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2FC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 14:54:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF7710E6FB;
	Wed, 22 Jan 2025 14:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O7gJsqL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E9310E6FB
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 14:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737557693; x=1769093693;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=p60IWQaxn9LOguckHMLsAkS3p9r6ivB10HApYw66i0A=;
 b=O7gJsqL8Ur3HousXtokNtP2VoGV4CuhSCZmX+c8r+xUNlBn2faUzXJCR
 QS6nnEm0XKjuerNcANIKMh6JYTwWfpuQKPwaobYEH2lZ6kqqvMM4IKWN9
 JoSeBB88qpMdqjd+FY9XA4mWw4wrPvmkGTk8FkU1I+8recQZjFKB14aCr
 ejFASJ14YxdmdpRxgywofWoTw6Ccvrwb0szoaL4b5rh3VteD/QZuc3Rx0
 zVhhDkKcY9Py6TuzuViGQi1YWHfhHtbzALuQMLDaw9ZNPmFL+AEdJN7wZ
 loBdd3XDw/Pu+d++oQU982RtT2atshFlrECFSa36t+PX8sAL/DcLH6fQK g==;
X-CSE-ConnectionGUID: vU2pijdHQTW1oxXxkQz0FQ==
X-CSE-MsgGUID: UViTXzq/SEKqEgXTQbig8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="41947347"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="41947347"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 06:54:53 -0800
X-CSE-ConnectionGUID: R+2MsebCQJiNA+7OspFCow==
X-CSE-MsgGUID: C6UQqgyqTyuQP3IckZugpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="107771585"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa009.fm.intel.com with ESMTP; 22 Jan 2025 06:54:52 -0800
Received: from [10.245.80.89] (mwajdecz-MOBL.ger.corp.intel.com [10.245.80.89])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id A4B7F2FC42;
 Wed, 22 Jan 2025 14:54:50 +0000 (GMT)
Message-ID: <d40d4dd7-ab68-4bfc-8a12-6ff5ddf7dea0@intel.com>
Date: Wed, 22 Jan 2025 15:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_mmio_send_recv
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250122073808.16288-1-satyanarayana.k.v.p@intel.com>
 <20250122073808.16288-2-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250122073808.16288-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi,

some late comments below:

On 22.01.2025 08:38, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at probe time when executing xe_guc_mmio_send_recv() so that
> more code paths are tested, such as error handling and unwinding.
> 
> Error can be injected using:
> igt@xe_fault_injection@inject-fault-probe-function-xe_guc_mmio_send_recv
> 
> v2: Sorted the entry xe_guc_mmio_send_recv in inject-fault-probe-function-* list
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..3a0e2aa29 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -163,6 +163,7 @@ static void set_retval(const char function_name[], long long retval)
>   * @xe_guc_ads_init:		xe_guc_ads_init
>   * @xe_guc_ct_init:		xe_guc_ct_init
>   * @xe_guc_log_init:		xe_guc_log_init
> + * @xe_guc_mmio_send_recv:     xe_guc_mmio_send_recv

hmm, I know that you are trying to follow existing comment style, but
what is the actual purpose of typing a function name twice here?

and why this sub-test documentation is so separate from the actual place
where this function is used (in igt_main far below) ?

>   * @xe_guc_relay_init:		xe_guc_relay_init
>   * @xe_pm_init_early:		xe_pm_init_early
>   * @xe_sriov_init:		xe_sriov_init
> @@ -294,6 +295,7 @@ igt_main
>  		{ "xe_guc_ads_init" },
>  		{ "xe_guc_ct_init" },
>  		{ "xe_guc_log_init" },
> +		{ "xe_guc_mmio_send_recv" },
>  		{ "xe_guc_relay_init" },
>  		{ "xe_pm_init_early" },
>  		{ "xe_sriov_init" },

