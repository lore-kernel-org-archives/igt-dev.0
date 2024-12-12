Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F45E7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 19:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F1A10EE7A;
	Thu, 12 Dec 2024 19:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T9RloCJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2B710EE78;
 Thu, 12 Dec 2024 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734030628; x=1765566628;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1bln6oaaADL9LtShsRNUv6FJBB7pk7KEZAZ3ylj6Zfs=;
 b=T9RloCJ9IIzZelnaYWsDXPI3qXNAux3WzWtMIvbcvv9Okg4d9a4s7VuC
 qll4kpjqNHSawehLZymlr6ET0IBjQuyq81xm2lnVcJnxYUeAipS1kGaWr
 AgFjndwmMxy6URpDf8btWZMFB1veNvJfgBDcZUGoWCxQrPIr4AExhIFdb
 ABGHh4Qnam3o2G3v9oCvyvSX0lQ33yqF+9yKzSjirKmsZN7GIF6Pxx9Nx
 /yvKwFl7MaG3kyTGgDNkja14k6SI/hdlA+BRatvbE9QljoTtcc54WK/hH
 7aXMhm5yTPfo4QegSzAwdZfPqsWdO2iChtup9wUdyXmqPqbSZICT4PA2W w==;
X-CSE-ConnectionGUID: uDXa143eQZ61FeMAIXsi5Q==
X-CSE-MsgGUID: zJLCapjWQqmDgxBRMrXRfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59866203"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="59866203"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:10:27 -0800
X-CSE-ConnectionGUID: c1AL1cBETA6LMLTd1uthgA==
X-CSE-MsgGUID: R6e1DvLtSLSPpcHImS5Wmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97129502"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:10:26 -0800
Date: Thu, 12 Dec 2024 20:10:23 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 scripts/generate_iga64_codes: fix path of iga64_macros.h
Message-ID: <20241212191023.4i6x7nh3a3nmbniv@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20241212-fix_iga64_macros_path-v1-1-9e8d149c8667@intel.com>
 <173402935984.1677800.17320766180568489589@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173402935984.1677800.17320766180568489589@b555e5b46a47>
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
On 2024-12-12 at 18:49:19 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: scripts/generate_iga64_codes: fix path of iga64_macros.h
> URL   : https://patchwork.freedesktop.org/series/142480/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8150_full -> XEIGTPW_12306_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12306_full absolutely need to be
>   verified manually.

Unrelated.

Regards,
Kamil

>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12306_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12306_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128:
>     - shard-bmg:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-5/igt@kms_plane_cursor@overlay@pipe-a-dp-2-size-128.html
> 
>   * igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-2/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_ccs@suspend-resume@xmajor-compressed-compfmt0-system-vram01.html
> 
>   * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
>     - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12306_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>     - shard-lnl:          [PASS][7] -> [FAIL][8] ([Intel XE#911]) +3 other tests fail
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> 
>   * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][9] ([Intel XE#3781]) +2 other tests incomplete
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/shard-bmg-3/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html
> 
...cut...
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8150 -> IGTPW_12306
>   * Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -> xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5
> 
>   IGTPW_12306: 12306
>   IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292
>   xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5: 7b441ab54824526dd570dfbfbef51bcd2ba4c5b5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12306/index.html
