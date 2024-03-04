Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AA1C5478C
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 16:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE26410E9FE;
	Mon,  4 Mar 2024 16:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHfcFHGS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9330C10E9FE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 16:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709568530; x=1741104530;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e6HY/y0cgQN1HKmlWYqleSHVpVJi9yYYs9qOz/CfjVw=;
 b=UHfcFHGSDnpA4khZ2jOylSvqUmEfsUX7+SJR6p03QITakrSbOPN2/RV7
 ZrKZr+kzcC9tU/DqptvoLWRpn21l42mNI4Rk8OAN6WtJuxptOJ1y/kWVN
 R6/Gdt9W9Pz9cDQAEYOLZaI0mUUF1x3RGen4KOdtiSnGDJRO42Wvey5kP
 RWUYERqRz8HA9lBTX7bTwCa6DlqIotWsnchwqPXQJTiKWjqer8jAzHXo0
 BfPbDBKbW3fR7Ob6C8ZRW1ekvZyR10naYEZgksLTP2uLl4bEWgrA2Ubt5
 E9NBDqd1URkxtTwZrk7fS1kUor7OaS1vYYgaJuCkE8JMCDGvkRFhlXqRj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="14645912"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; d="scan'208";a="14645912"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 08:08:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9638232"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2024 08:08:47 -0800
Date: Mon, 4 Mar 2024 17:08:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, badal.nilawar@intel.com,
 sujaritha.sundaresan@intel.com
Subject: Re: [PATCH i-g-t 2/2] HAX: Add freq tests to xe-fast-feedback.testlist
Message-ID: <20240304160844.n7ak25dmna5slspt@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Riana Tauro <riana.tauro@intel.com>, igt-dev@lists.freedesktop.org,
 anshuman.gupta@intel.com, aravind.iddamsetty@intel.com,
 badal.nilawar@intel.com, sujaritha.sundaresan@intel.com
References: <20240227093337.1151505-1-riana.tauro@intel.com>
 <20240227093337.1151505-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240227093337.1151505-3-riana.tauro@intel.com>
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

Hi Riana,
On 2024-02-27 at 15:03:37 +0530, Riana Tauro wrote:
> Add freq_fixed_exec and freq_range_exec to fast feedback
> testlist.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

CI is no longer managing our f-f testlists, so imho:

HAX: Add freq tests to xe-fast-feedback.testlist

should be:

tests/intel-ci: Add freq_fixed/range_exec to xe-fast-feedback

Regards,
Kamil

> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
> index 17863b6b1..b1e769e56 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -87,6 +87,8 @@ igt@xe_exec_threads@threads-mixed-fd-basic
>  igt@xe_exec_threads@threads-mixed-userptr-invalidate
>  igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
>  igt@xe_gpgpu_fill@basic
> +igt@xe_gt_freq@freq_fixed_exec
> +igt@xe_gt_freq@freq_range_exec
>  igt@xe_gt_freq@freq_basic_api
>  igt@xe_gt_freq@freq_fixed_idle
>  igt@xe_gt_freq@freq_range_idle
> -- 
> 2.40.0
> 
