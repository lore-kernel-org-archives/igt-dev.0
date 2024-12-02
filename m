Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B7D78321
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 14:48:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 647CE10E77A;
	Mon,  2 Dec 2024 14:48:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grQI2Iof";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EF8E10E77A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 14:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733150904; x=1764686904;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=4XO2132bQUnh4Q6WiKlUxNewc6THZ8JWOI9aoFzi82I=;
 b=grQI2IofKN0KLsJirVhMTRcIhb2YpxRf/BTU3TjSJLR/RNJxGxRvH7vh
 jE1uMlVwJOVmmw7oAAeHqV+HU/V+njaIXBimq0EILrXmbnK0/wPDJ4zKF
 uuR1rC/4Ui7ICrmwbXBYHTWSaYdIX2UIyXK+k9fb9sk7HnO3GFo+/TEMn
 zHowZJzma93wv/XK6xVdzCHVkSRzNU76QfHzR1Nga7vCBqe//mDf+Mork
 2MKj2YKygWnTBTWYOFiJgfEkjGT/Ki9c2/jFWIGmxVrkIWV5p/war227o
 SzRSzhf2nF4l+NiFV76Zx8PfmhOnTjjmS3u0LwBAKoYoOsMCjIzqsXlxb w==;
X-CSE-ConnectionGUID: rgGoHWbxQMeSPOQtWqzm1w==
X-CSE-MsgGUID: VEIh5sUxTxarDLJZitS+bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="55811961"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="55811961"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 06:48:24 -0800
X-CSE-ConnectionGUID: ObtNViI8TmW5hBvGU+m9zw==
X-CSE-MsgGUID: 8DoqcgeYS/CtcVO9z4gqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="116386288"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 06:48:23 -0800
Date: Mon, 2 Dec 2024 15:48:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for
 runner: Allow limits at dumping dmesg (rev3)
Message-ID: <20241202144820.tbnbgcdtfkke2cbi@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20241129204550.116355-1-kamil.konieczny@linux.intel.com>
 <173295065814.662016.3177914236934497026@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173295065814.662016.3177914236934497026@b555e5b46a47>
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
On 2024-11-30 at 07:10:58 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: runner: Allow limits at dumping dmesg (rev3)
> URL   : https://patchwork.freedesktop.org/series/140182/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8132_full -> XEIGTPW_12223_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12223_full absolutely need to be
>   verified manually.

Below regressions are unrelated to change in igt_runner.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12223_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12223_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12223/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +2 other tests dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12223/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
>     - shard-bmg:          [DMESG-FAIL][5] ([Intel XE#3468]) -> [FAIL][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8132/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12223/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
> 
>   
> New tests
> ---------
> 
>   New tests have been introduced between XEIGT_8132_full and XEIGTPW_12223_full:
> 
> ### New IGT tests (1) ###
> 
>   * igt@kms_atomic@crtc-invalid-params-fence@pipe-b-hdmi-a-3:
>     - Statuses : 1 pass(s)
>     - Exec time: [0.70] s
> 
>   
> 
> Known issues
> ------------
> 

...cut...

> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8132 -> IGTPW_12223
> 
>   IGTPW_12223: 12223
>   IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2295-108f610005f88de624c1a8c4f85d5cab9f530ddb: 108f610005f88de624c1a8c4f85d5cab9f530ddb
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12223/index.html
