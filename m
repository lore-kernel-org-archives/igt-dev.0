Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39B4CDB46B
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 09:57:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7DF10E5D2;
	Mon, 22 Jun 2026 09:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4YRfreh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206B110E5D2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782122229; x=1813658229;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EXiseQEW6BdrxC/KCvyo4vV/1xu4ReFkbegHvwD8KVE=;
 b=B4YRfrehDYO+gOjoRcXXQwnD8XgXSGniQ5vz3wr7kKx3tZRRDCj5+Ghb
 I8D6Ju/B//2revOs+gcDxCgK6AcohQBpX3OAsCFWk0Ne9j2+4UlFt89fn
 zgQlEZPKlmdcqNflThA6383T/ZxtuYSmoGsXcDg+8w/k6mWy581KNz0dF
 IWyqdOixN6WfdxU/ZjPsFd1Qz5tlVMxFJZKt5a6oQtiqMMEtBuvq66m5Z
 lR3zuUQhLihyuiys9XITGgQIki6bRZtH/1rDQSz5k0QGeJsiGT9KQbzb3
 6yN+ISmo0584j1Dq8YN/hOo36XRPDSj0MgMAnvvMW6Si4Knk+FzsaAIuj g==;
X-CSE-ConnectionGUID: ivVMrplcSYOVv5TBhvYmfQ==
X-CSE-MsgGUID: 6ARBNMOpRxKsLuKUwOPHdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="70362164"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="70362164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 02:57:09 -0700
X-CSE-ConnectionGUID: YMA3BDHHTSKKKeTdsZUExg==
X-CSE-MsgGUID: sG7GaUj+QXq4fXOoM2qlSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; d="scan'208";a="245038224"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 02:57:07 -0700
Date: Mon, 22 Jun 2026 11:57:05 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, matthew.brost@intel.com
Subject: Re: [PATCH 1/2] tests/intel/xe_exec_basic: Add timeline syncobj exec
 tests
Message-ID: <20260622095705.ykndrja63nwmmicr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jan Maslak <jan.maslak@intel.com>, igt-dev@lists.freedesktop.org,
 matthew.brost@intel.com
References: <20260622085159.3318909-1-jan.maslak@intel.com>
 <20260622085159.3318909-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622085159.3318909-2-jan.maslak@intel.com>
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
On 2026-06-22 at 10:51:58 +0200, Jan Maslak wrote:
> Add Xe-specific timeline syncobj coverage for xe_exec.
> 
> The input test covers waiting on an older completed timeline point
> after the same syncobj has already advanced to a later point. This is
> the shape that exposed the historical xe_exec regression when exec
> parsing reached an input timeline sync with no backing fence.
> 
> Also add a timeline syncobj output test to verify Xe signals the
> requested timeline point when execution completes.
> 
> Keep the coverage in xe_exec_basic so the test exercises the Xe exec
> uAPI directly instead of only the generic syncobj timeline helpers.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>  tests/intel/xe_exec_basic.c | 233 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 233 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
> index 5335bffc41..98d44484c4 100644
> --- a/tests/intel/xe_exec_basic.c
> +++ b/tests/intel/xe_exec_basic.c
> @@ -31,6 +31,219 @@
>  #define DEFER_BIND		(0x1 << 6)
>  #define SPARSE			(0x1 << 7)
>  
> +static bool has_syncobj_timeline(int fd)
> +{
> +	uint64_t value;
> +
> +	if (drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE, &value))
> +		return false;
> +
> +	return value;
> +}
> +

Use igt function for this:
lib/ioctl_wrappers.h:int igt_has_drm_cap(int fd, uint64_t capability);

Regards,
Kamil

> +static void write_store_dword_batch(uint32_t *batch, size_t batch_size,
> +				    uint64_t addr, uint32_t value)
> +{
> +	int b = 0;
[cut]
