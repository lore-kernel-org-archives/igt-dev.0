Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581B0D2ECE9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 14:16:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F28B10E5F3;
	Tue, 20 Jan 2026 14:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eStHLHyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE3110E5F3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 14:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768918616; x=1800454616;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=rQbHAdtK0dcHBk9jW69uZRwoylUR0rPix+6Jbvd+ysA=;
 b=eStHLHylBsFQIGrlrI9w3RkA3tSo9E6pQZQ3lxkstq3XL955Xbmbc48Q
 YQuOR3EFHqie1T5i+Kxx6Qx5Ho1jxn4RX0tWzGWZ1HueGDhyRWwaCPCfV
 ft7EvF3byENzqkJseEXUow8wpmo2SPGbuOXL+oVo8N+4MWfSLMvfMz3J0
 sSmETm9Vk2BgE102mhByUhewh5D/XHBT45na+LzaXFqEK4TdF8ajcciNi
 ZUTgZ31VrGKBtylYdHWnuo99cdzZrv03aNHEyIng/qtIML55zgvwdYDHo
 TrTz6Bjcf4+ZqLZaAAjNdpvPtdpR3K5MqcENYzpK/QActi3jky4zZ4cJF g==;
X-CSE-ConnectionGUID: qs+/i1EFRZOl4JH6BlYNlA==
X-CSE-MsgGUID: Gb4us/EDRhWmmyvuPBNsew==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70099526"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="70099526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:16:56 -0800
X-CSE-ConnectionGUID: uc9QZzVWT92Eh04Ab8E50w==
X-CSE-MsgGUID: nPgLj2DcTyCBxHwKKY/cwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; d="scan'208";a="243718650"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.241])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 06:16:54 -0800
Date: Tue, 20 Jan 2026 15:16:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, 
 Shuicheng Lin <shuicheng.lin@intel.com>
Subject: Re: [PATCH i-g-t v6 0/5] Add xe3p compute kernels and preemption
 support
Message-ID: <czjite2gjqc6ugkvqsj5szylnh3fjw45kpi4xbfqrdxue77bzz@ny4yyzmewwir>
References: <20260120110108.84369-7-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260120110108.84369-7-zbigniew.kempczynski@intel.com>
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

On Tue, Jan 20, 2026 at 12:01:09PM +0100, Zbigniew Kempczyński wrote:
> Enable compute-square + preemption tests for CrescentIsland.
> 
> v2: reorder, loop_kernel_duration requires loop kernel added before
> v3: drop kernel_addr variable and reuse XE2_ADDR_STATE_CONTEXT_DATA_BASE
> v4: use variables instead of hardcoded sizes
> v5: add missing loop_noopt.cl file

I skipped testing this series as it was already done in v4.

--
Zbigniew

> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Shuicheng Lin <shuicheng.lin@intel.com>
> 
> Shuicheng Lin (1):
>   lib/intel_compute: Add loop_kernel_duration support for xe3p
> 
> Zbigniew Kempczyński (4):
>   lib/intel_compute: Add compute-square for xe3p
>   lib/intel_compute: Add loop and loop-count shaders for xe3p
>   lib/intel_compute: Add xe3p SIP support
>   lib/intel_compute: Enable xe3p preemption testing
> 
>  lib/intel_compute.c                |  397 +++-
>  lib/intel_compute_krn_loop.h       |   36 +
>  lib/intel_compute_krn_loop_count.h |   34 +
>  lib/intel_compute_krn_sip.h        | 3127 ++++++++++++++++++++++++++++
>  lib/intel_compute_krn_square.h     |   41 +
>  lib/intel_compute_square_kernels.c |   11 +
>  lib/xehp_media.h                   |    1 +
>  opencl/loop_noopt.cl               |   15 +
>  8 files changed, 3661 insertions(+), 1 deletion(-)
>  create mode 100644 opencl/loop_noopt.cl
> 
> -- 
> 2.43.0
> 
