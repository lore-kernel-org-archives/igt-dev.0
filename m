Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D999CA0EE3
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 04:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA3910E143;
	Fri, 30 Aug 2024 04:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="US43CtJz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0A910E143;
 Fri, 30 Aug 2024 04:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724992125; x=1756528125;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=et/HagD+iDvX9fOa0xtmemvEGX02dmX2GKOgMf+T10k=;
 b=US43CtJz7G/6VaWlDmCRYn5RRgFFtVR46Pm/udcdZLT0GsB/NUzShZ9m
 Kns7UT86xx31x0QlgX+dX6cwQCDDUzJ0PJBI2iWUF3WBZ6Zx5bltKRae3
 TSy3LV4QuboAaNGGmLYeR/sgIZOvrs7MZFKYmCin1MBfSLrkYklnTbTIm
 iq72E5ni3nTONj2CzjBAseMjYpM77+AYU0zvq3dB84rFNVmPim2OVaFGA
 wXOWgNw/doncM7VqVvTF9IJ5nc5X4Dm7Kbs2s52US6IWU43SW3I7DYGh9
 q/oiyEpWEIHBPe/c2gHtWampGyYeP8bLsq546t30BmyxhmQJRBGdJX55w Q==;
X-CSE-ConnectionGUID: iXNcSVwWR5ei9/JEkLQ+Bg==
X-CSE-MsgGUID: Wmkt4eXuS1KBS+OBwUDbHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23759819"
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="23759819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 21:28:44 -0700
X-CSE-ConnectionGUID: 0+0cT+S6RTuVJF0bOlcqRw==
X-CSE-MsgGUID: ZOH6jHzzSDOAt6WxqKFPOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,187,1719903600"; d="scan'208";a="63418081"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO [10.251.220.231])
 ([10.251.220.231])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 21:28:43 -0700
Message-ID: <ce8275c7-de8c-4c14-be48-63c4b5b73e40@linux.intel.com>
Date: Fri, 30 Aug 2024 06:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeBAT=3A_failure_for_runner/executor?=
 =?UTF-8?Q?=2Ec=3A_Detect_tests_killed_by_a_signal_=28rev2=29?=
To: I915-ci-infra@lists.freedesktop.org,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <f7319a46-d6d4-4ea5-9863-99ccd7cea3a5@linux.intel.com>
 <172495306911.848780.14085544563134015986@2413ebb6fbb6>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172495306911.848780.14085544563134015986@2413ebb6fbb6>
Content-Type: text/plain; charset=UTF-8
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

Dear i915-ci,

[...]

> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11664_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
>     - bat-bmg-1:          [PASS][1] -> [SKIP][2] +12 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7997/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11664/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

These are unrelated to the change.

> 
>   
> #### Warnings ####
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-bmg-1:          [SKIP][3] ([Intel XE#2244]) -> [SKIP][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7997/bat-bmg-1/igt@kms_dsc@dsc-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11664/bat-bmg-1/igt@kms_dsc@dsc-basic.html

These are unrelated to the change.

[...]


Thank you,

Peter
