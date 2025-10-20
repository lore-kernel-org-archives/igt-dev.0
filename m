Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC44ACCD193
	for <igt-dev@archiver.kernel.org>; Mon, 20 Oct 2025 15:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE4310E2A0;
	Mon, 20 Oct 2025 15:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M498VHFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C5010E2A0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760973496; x=1792509496;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=obkENEJHwXrVueUJIZbgX+dk5brHZN93+yMGfW83KY4=;
 b=M498VHFcFf4NXUOAdCK+wRPJ+G0TfGKB8Z3HSkcyAbxy59DIbLKVUyZD
 vQUB+lI6kYlndEv5pchTW3GZEU0hfFl0iaZyF+AlksvWCKVTitw3LDyY8
 58wAAZIKQn2A9YNsFYEQhdRNt1TgeEvGzXWfgqDhBsppEbPHW3OGMDIsc
 aKzYSVfALTXvj1IGzA9Q09GYwTxX6prTSnOc5XWlQITV73WjGR/Cfb5PO
 pQWW83jjsSA97frUFgJ1xlFy13+WtPnAFUENj9hq9Xn8whd8zFZCrwHO4
 T+RaouF3sRAPBuzgjyCmZ0cd142AH6/GUEUbyp3iqSjx9r5P7srkKibFv w==;
X-CSE-ConnectionGUID: CfX5/uEHSJq80+KB4sRC1A==
X-CSE-MsgGUID: /g5+lKJzRiK5kqkFBobmOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62994826"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62994826"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 08:18:15 -0700
X-CSE-ConnectionGUID: HXAn9GjzSLKgZNLS4WTrCQ==
X-CSE-MsgGUID: Y8KA7J7wRnqCHtTpedUXCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="184120537"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.182.166])
 ([172.28.182.166])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 08:18:14 -0700
Message-ID: <8161d610-7031-4ab1-b0cb-f24b260c3131@linux.intel.com>
Date: Mon, 20 Oct 2025 17:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBTUi1JT1Y6IFBG?=
 =?UTF-8?Q?_restore=5Fauto=5Fprovisioning_helpers?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20251018161549.999459-1-marcin.bernatowicz@linux.intel.com>
 <176082370691.30981.16394640354978802411@97596180aaec>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <176082370691.30981.16394640354978802411@97596180aaec>
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


On 10/18/2025 11:41 PM, Patchwork wrote:
> == Series Details ==
>
> Series: SR-IOV: PF restore_auto_provisioning helpers
> URL   : https://patchwork.freedesktop.org/series/156164/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from XEIGT_8592_FULL -> XEIGTPW_13919_FULL
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with XEIGTPW_13919_FULL absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in XEIGTPW_13919_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    
>
> Participating hosts (4 -> 3)
> ------------------------------
>
>    Missing    (1): shard-adlp
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in XEIGTPW_13919_FULL:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@xe_pm@s4-basic-exec:
>      - shard-bmg:          [PASS][1] -> [FAIL][2]
>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8592/shard-bmg-4/igt@xe_pm@s4-basic-exec.html
>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13919/shard-bmg-1/igt@xe_pm@s4-basic-exec.html
>      - shard-dg2-set2:     [PASS][3] -> [FAIL][4]
>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8592/shard-dg2-434/igt@xe_pm@s4-basic-exec.html
>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13919/shard-dg2-433/igt@xe_pm@s4-basic-exec.html
>      - shard-lnl:          [PASS][5] -> [FAIL][6]
>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8592/shard-lnl-5/igt@xe_pm@s4-basic-exec.html
>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13919/shard-lnl-8/igt@xe_pm@s4-basic-exec.html

not related

--

marcin

>
>    
> Known issues
> ------------
>
>    Here are the changes found in XEIGTPW_13919_FULL that come from known issues:
>
> ### IGT changes ###
>
> #### Issues hit ####
>
>    * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>      - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316]) +4 other tests skip
>     [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13919/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
>
> [...]
