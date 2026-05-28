Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDD4CD6E44
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 10:44:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B607B10EFFE;
	Thu, 28 May 2026 10:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dd7GDEn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F6A610EFFC
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779965044; x=1811501044;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CjML1sgHzQQHjaLQ3moMXCqt6l8h54C8v4m4jE4p4ck=;
 b=Dd7GDEn/km9XwXVXCaVRzWigT5/fCFcnJf9bGeNzNf0rKOGPjBHpL9ki
 jvI/M5mugWeDVTNJA8PYEkazycKx/Xgr3DPr0tsZ3GRKSgPeOZrdNCWVn
 0bvhLC65IhdKWswOWivmlDOYdV7Fb3TeXWdl25VOafBfqp98KGPPBwB7J
 x4/A/zS3JuvHDqAknLcqjkyCiley4QZMO3Krz6BLMwvwhn9hw42ttS8Ha
 101ZkMV4b+lC8Ir30bWfFF9Rt7MGIb5hbK7RZzJJaUAlE5WDoYEpanybh
 MawM0EmFPGng2ZoEdIy722lpFe1C8Atm/71ugTJH1c6lmQnSWsN4946my w==;
X-CSE-ConnectionGUID: t4Ec2/fOTRmM2H7UoaP1/w==
X-CSE-MsgGUID: tSQ8lMa9TLuhf9FHItTABg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="84693204"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="84693204"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 03:44:03 -0700
X-CSE-ConnectionGUID: F+0FcmchRgCVUkvPTG+1pg==
X-CSE-MsgGUID: H43QyP6mTN2JncwbUabnVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247460165"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 03:44:02 -0700
Date: Thu, 28 May 2026 12:43:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
Cc: igt-dev@lists.freedesktop.org, jia.yao@intel.com, x.wang@intel.com
Subject: Re: [PATCH i-g-t 1/2] intel-ci: Add pat-index-auto to Xe BAT testlist
Message-ID: <20260528104359.nzk67w4wqt5w27n7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Zongyao Bai <zongyao.bai@intel.com>, igt-dev@lists.freedesktop.org,
 jia.yao@intel.com, x.wang@intel.com
References: <20260527210052.161768-1-zongyao.bai@intel.com>
 <20260527210052.161768-2-zongyao.bai@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260527210052.161768-2-zongyao.bai@intel.com>
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

Hi Zongyao,
On 2026-05-27 at 21:00:51 +0000, Zongyao Bai wrote:
> Add igt@xe_pat@pat-index-auto to xe.fast-feedback.testlist so that
> the new dynamic PAT index subtest is included in Xe BAT runs.

This should be second patch, after a new test. With that
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  tests/intel-ci/xe.fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> index acff025fa..6851c1f49 100644
> --- a/tests/intel-ci/xe.fast-feedback.testlist
> +++ b/tests/intel-ci/xe.fast-feedback.testlist
> @@ -211,6 +211,7 @@ igt@xe_pat@pat-index-xelp
>  igt@xe_pat@pat-index-xehpc
>  igt@xe_pat@pat-index-xelpg
>  igt@xe_pat@pat-index-xe2
> +igt@xe_pat@pat-index-auto
>  igt@xe_waitfence@abstime
>  igt@xe_waitfence@engine
>  igt@xe_waitfence@reltime
> -- 
> 2.43.0
> 
