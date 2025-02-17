Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8049C021A6
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:50:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E77E10E39D;
	Mon, 17 Feb 2025 08:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fU+xE9ev";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA3C10E26D;
 Mon, 17 Feb 2025 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739782234; x=1771318234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=enZB+iq6TQ5WvO6XJ2sVPdYat80xr1nXJaKiZJEV/88=;
 b=fU+xE9ev5Jju7miFG3utXWbSkffBOktKYN0z3tjvnh3fz1Gjfq7AMl+w
 GOXWNGqJ9zHrXzSOQDsSyP6Y7CuqNRCOEXU5j9f5DhtTxGwon4MBZb/ZK
 ZS1wS1kabgXdgMMSMvHwIHXlJGRxQiMfV16P19M5DS7hYhTsvomeQ52KN
 Zt34lFgCXK9HhpnMrr7PJ/t5UviTkdhBgVL0DmnhAxTOAIARnF9mloTfl
 +kx3nWdKlaWHUnup2JVie6oie6OqVVwrD6qnjha8tFGaZ8WHz5emTJ1kV
 moN18+jmX4A9GIj6QzX671eG088fPomdLn2p7x64wNoToQbWdqmvMMW2M Q==;
X-CSE-ConnectionGUID: CnEckKRCRbqlxeKiQMHt2g==
X-CSE-MsgGUID: Q7+CA5QDQquWJTrKRzqDeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="51102096"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="51102096"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:50:33 -0800
X-CSE-ConnectionGUID: gwYbrJLaS5qASxvLU6JdaA==
X-CSE-MsgGUID: 6qLMpJU7RLWM2TfYTO3dSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119274884"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:50:33 -0800
Date: Mon, 17 Feb 2025 09:50:30 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 igt_runner: Bump network ping deadline to 40 seconds
Message-ID: <20250217085030.2bwfmprepcw4pbwq@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250214190416.145374-1-kamil.konieczny@linux.intel.com>
 <173967852896.2837794.12907911138151700943@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173967852896.2837794.12907911138151700943@b555e5b46a47>
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
On 2025-02-16 at 04:02:08 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: igt_runner: Bump network ping deadline to 40 seconds
> URL   : https://patchwork.freedesktop.org/series/144902/
> State : failure

Unrelated,

Regards,
Kamil

> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8230_full -> XEIGTPW_12603_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12603_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12603_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12603_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@alternate-sync-async-flip:
>     - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8230/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/shard-dg2-466/igt@kms_async_flips@alternate-sync-async-flip.html
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_pipe_stress@stress-xrgb8888-ytiled}:
>     - shard-bmg:          NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
>     - shard-lnl:          NOTRUN -> [SKIP][8]
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12603_full that come from known issues:
> 
...cut...

>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8230 -> IGTPW_12603
>   * Linux: xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9 -> xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd
> 
>   IGTPW_12603: d1cdbcc1841b595ebe56c3ab3c9a87d036a53d46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8230: 8230
>   xe-2665-57457d93f156d8b4bdff8d138127d81b8f97d8c9: 57457d93f156d8b4bdff8d138127d81b8f97d8c9
>   xe-2669-cbd747025a1ef985e1ebfa040aa0da4a5d77aacd: cbd747025a1ef985e1ebfa040aa0da4a5d77aacd
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12603/index.html
