Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E66DC88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 08:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F88F10E17E;
	Wed, 16 Sep 2026 08:06:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L46G07RH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9810E4FB
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 08:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789545926; x=1821081926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PLfsUn8SvwU9GWNB5lS/xFYw0hXooM7L1Eq/VLHm+8U=;
 b=L46G07RHxcvUc4HfPMoFfpzHImN4ARyGlEOxZcduxSwAeLaiNOQtz3Dj
 KeuGFYWsA52J4Yye6NHkyVwoCG05m45MmrumKESQHtNcQmtwsSaPe9Fwy
 pJOgCdA7hXGF2mdTneexQLT6/ldgErvaTLOjhx9GzRqeDLauBxH2M5H0J
 ZrNT1/crrl6fFHNQM/VOdE2jg0EZDjDQJPhZEErdMmSmGDjb7GWsMc4He
 /9uryfy1wvX5Uxeeh1qnclL44w+UBzpAlCuK8AC9qNTGyN8tcBMpNsX2P
 CwAERnXnxxKOXCobKKTnBhsqHYjljbNx4b5BvhnXv3YrPPcsu45j35TQL g==;
X-CSE-ConnectionGUID: e1l/ZaKtS3qqIefyAiBS/Q==
X-CSE-MsgGUID: nfGEdToaSSuRaw52bTKXog==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101071184"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="101071184"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:05:26 -0700
X-CSE-ConnectionGUID: 3C0q40r9Sgax/lDeJ9Fj4w==
X-CSE-MsgGUID: UKSIzQxJQDWkGUAiR1TH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277011402"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 01:05:25 -0700
Date: Wed, 16 Sep 2026 10:05:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: shivtej.eknath.patil@intel.com
Cc: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Subject: Re: [PATCH v4] tests/intel-ci: blocklist multi-queue tests on NVL
Message-ID: <20260916080521.uv7xahuo6tuf6kkr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 shivtej.eknath.patil@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@intel.com, nishit.sharma@intel.com,
 smitha.balasubramanyam@intel.com
References: <20260915101414.66216-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915101414.66216-1-shivtej.eknath.patil@intel.com>
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
On 2026-09-15 at 10:14:14 +0000, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>

one more nit for future CI changes, you can use short prefix,
'intel-ci:' is enough:

[PATCH v4] intel-ci: blocklist multi-queue tests on NVL

It can be fixed at merge, no need for resend.



Regards,
Kamil

> 
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
>  
> On NVL platforms these tests are expected to skip because
> multi-queue engine support is not available.
>  
> Add blocklist entries to suppress expected CI failures.
> 
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>  tests/intel-ci/xe.nvl.core.blocklist.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..71715235b 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,3 +107,8 @@ igt@xe_exec_sip@.*
>  igt@xe_exec_sip_eudebug@.*
>  igt@xe_live_ktest@xe_eudebug
>  ##################################################################
> +# Expected skip on NVL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +##################################################################
> -- 
> 2.43.0
> 
