Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E87C30653
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 11:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4AB10E841;
	Wed, 26 Jun 2024 11:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgoMqwKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286DE10E840;
 Wed, 26 Jun 2024 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719399754; x=1750935754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hUD1PsXL1KWfxIKnFZtViBEjGtMpK3NHgBOCt2SvCrQ=;
 b=fgoMqwKL2zDdpd2xik2SXF/Xd+vo60HoDzNHihm45mm47vBQi65GEfR8
 LxvQTXTGYio8Tg2NIIvc2yfgIY+91abaPDNxLkhrCH0VND9O2KMTB7LLv
 RUbLOXrM2l1tnh/Whqg//xGr5yB75ivDpaqh3guAbxaqnHu0x4VYYZhBq
 IBtm0ZEaED83Djc65U383uYZFmR3qgJS6xJ5JZNLt59ZDdQju36+AAsHT
 2CDuSV1BLaSXR5xhCnd8lyT38Rn2PEIGGxMb6kI+zb1qfELQX+77XEUn7
 uFQtNese80qYJmvrPxlaiHNoS2HsYnmTlQOngAcRC7Qf1feS76LxthQCB A==;
X-CSE-ConnectionGUID: wdvvuPMCSBCZvqHJ9Jskcw==
X-CSE-MsgGUID: Qm0GDh2rTumbkvfNaLomeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16147593"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16147593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 04:02:33 -0700
X-CSE-ConnectionGUID: 7ZgyI+7DT3ez45p3sWxgeg==
X-CSE-MsgGUID: amnlxJrpS+OZCR0i5XCg4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48574160"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 04:02:32 -0700
Date: Wed, 26 Jun 2024 12:55:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlQkFU?= =?utf-8?Q?=3A?= failure for
 lib/gpu_cmds: Fix hardcoded buffer size (rev2)
Message-ID: <20240626105541.ywhvrfwyahpp7747@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
 <171939775724.160231.17353664223743341333@a6498e030952>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171939775724.160231.17353664223743341333@a6498e030952>
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

Hi igt-dev,
On 2024-06-26 at 10:29:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/gpu_cmds: Fix hardcoded buffer size (rev2)
> URL   : https://patchwork.freedesktop.org/series/135294/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7901_BAT -> XEIGTPW_11316_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11316_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11316_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (5 -> 1)
> ------------------------------
> 
>   ERROR: It appears as if the changes made in XEIGTPW_11316_BAT prevented too many machines from booting.
> 
>   Missing    (4): bat-adlp-7 bat-dg2-oem2 bat-lnl-1 bat-atsm-2 

Unlikly for igt, it is rather new xe kernel.

Regards,
Kamil

> 
> 
> Changes
> -------
> 
>   No changes found
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7901 -> IGTPW_11316
>   * Linux: xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d -> xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356
> 
>   IGTPW_11316: 11316
>   IGT_7901: dceed442a14a0abd09065cbade94cefe11e00422 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1527-edccdf441f1e061f81e0d1d172aa0f37511bbe4d: edccdf441f1e061f81e0d1d172aa0f37511bbe4d
>   xe-1530-4e4d42f54537b821c3aea17ef8b669a36ac09356: 4e4d42f54537b821c3aea17ef8b669a36ac09356
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11316/index.html
