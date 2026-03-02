Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D70D58E4C
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 09:32:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDC710E209;
	Mon,  2 Mar 2026 09:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GR3uEX/p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E022A10E209
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 09:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772443963; x=1803979963;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=NvNvbOuDHHfokvFPxSdBMtVnYFCv7I5OstVTBXPkgs0=;
 b=GR3uEX/prpl3DcZSeJcSazMd3l2SoEFhY9VSfU9IgKHoj0mTqLRXPvUy
 IJPGrz5JAVf2FJCB0VsSDDqMYi5DE5Gk0r0xgKBP2wlYWsR0nPLruELn+
 GILPR96kawkAKi67CTVY8MKowIGMFiuo8/5qF6haONprmGqLnyuroNa4U
 7mkQXl9Ew48njDTatns5hIsL4bIITlUKDLPC603BJMjCUO3JyRxE3kgB9
 AKVqFdywi4+ib5drlkWStJm+mAXuR/bRuQ6BxIGkxP3+oi4URKnFCoQz8
 1rEcxwLOBjb36WRbCCBfhXyCRYxxJZZfq3Bhi8QUx+UCiLvtnRY1CRl2D w==;
X-CSE-ConnectionGUID: ESa+NIuyTHqRoBCwMI1h+Q==
X-CSE-MsgGUID: yzfWDLpQRu2du86RPWYhIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="72473684"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="72473684"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:32:42 -0800
X-CSE-ConnectionGUID: 4HDW5vg1Tpm/ZADBIdTILQ==
X-CSE-MsgGUID: XOeXgyeURaKRMnyqWp0s6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="217708830"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.55])
 ([172.28.182.55])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 01:32:41 -0800
Message-ID: <55530661-8050-4722-8cdc-c5c0a0af871b@linux.intel.com>
Date: Mon, 2 Mar 2026 10:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciB4ZV9zcmlvdl9m?=
 =?UTF-8?Q?lr=3A_basic_FLR_smoke_test?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20260227152734.256604-1-marcin.bernatowicz@linux.intel.com>
 <177227643444.299615.5996489730320556996@a3b018990fe9>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <177227643444.299615.5996489730320556996@a3b018990fe9>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 2/28/2026 12:00 PM, Patchwork wrote:
> == Series Details ==
>
> Series: xe_sriov_flr: basic FLR smoke test
> URL   : https://patchwork.freedesktop.org/series/162326/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8775_FULL -> XEIGTPW_14636_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_14636_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_14636_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (2 -> 2)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in XEIGTPW_14636_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_plane_cursor@primary:
>      - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8775/shard-bmg-6/igt@kms_plane_cursor@primary.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14636/shard-bmg-2/igt@kms_plane_cursor@primary.html
Unrelated
>
>    * {igt@xe_sriov_flr@flr-basic} (NEW):
>      - shard-lnl:          NOTRUN -> [SKIP][3]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14636/shard-lnl-7/igt@xe_sriov_flr@flr-basic.html

Expected skip.

---

marcin

>    
> New tests
> ---------
>
>    New tests have been introduced between XEIGT_8775_FULL and XEIGTPW_14636_FULL:
>
> ### New IGT tests (1) ###
>
>    * igt@xe_sriov_flr@flr-basic:
>      - Statuses : 1 skip(s)
>      - Exec time: [0.0] s
>    
>
> Known issues
> ------------
[...]
>
>
> Build changes
> -------------
>
>    * IGT: IGT_8775 -> IGTPW_14636
>    * Linux: xe-4632-568403859ba7182ce2a59553664b34d58467adeb -> xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1
>
>    IGTPW_14636: 14636
>    IGT_8775: 8775
>    xe-4632-568403859ba7182ce2a59553664b34d58467adeb: 568403859ba7182ce2a59553664b34d58467adeb
>    xe-4635-a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1: a0a6a2fc5a08dc2e936c43e5d181dd0975a251a1
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14636/index.html
>
