Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4BE9C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 12:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 862C510E46D;
	Tue, 18 Mar 2025 12:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMqJAGsn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78A710E46D;
 Tue, 18 Mar 2025 12:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742301289; x=1773837289;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=31lyr6I1bNimzw3BLwctI58cH7ovLOsCCgdqUzxLopQ=;
 b=eMqJAGsnQtBWhvAPU7u/C5j86AN1Cq7JC4eEL7DplD+w2HLRHtRYuNgG
 aXwBrjxn3mTfrPe/4BSsDIBjpAqKiyXJkVfBtYkPaFlmz2kW+6tftr0it
 Pnm73j7+i6B9ZXhlfGbxwc/IBXMD+kXE8UpzYDOyAHodyKG+8rNVQ90lf
 toOkcCFThKtoWdqOKzf6pO+zHS9CQVN+kO6NE20oYl+XV/GLYwix6ZRPV
 jmOM/WB3eLUILsYvsQPvsWkmXZ7SalfYor3tCDAy2tslcS//V1NA2QGqU
 KZqa4ynM5Ffw1Jx/ejCqhrCp93DGkVCwJSBZ4uFAxj1zf4Eeo060aCMSE w==;
X-CSE-ConnectionGUID: YrhsbA3WSXCj9doCPJYcfg==
X-CSE-MsgGUID: iGZxW1sWQX+vEH7mJDmccg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="46203221"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="46203221"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 05:34:47 -0700
X-CSE-ConnectionGUID: eb8W3ZUbQzCw530Et5QheQ==
X-CSE-MsgGUID: Ae13N0IIRuKjTFBi+uWOKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="145426556"
Received: from unknown (HELO [10.245.252.104]) ([10.245.252.104])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 05:34:47 -0700
Message-ID: <3f3101e8-e588-4e16-8a25-c12b926c1a9f@linux.intel.com>
Date: Tue, 18 Mar 2025 13:34:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Close_sysfs?=
 =?UTF-8?Q?_and_debugfs_test_gap_between_i915_and_Xe?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250318095350.57133-1-peter.senna@linux.intel.com>
 <174229641111.48082.4211209057816650529@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174229641111.48082.4211209057816650529@18a75f3d1eae>
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

Dear I915,

On 18.03.2025 12:13, Patchwork wrote:
> == Series Details ==
> 
> Series: Close sysfs and debugfs test gap between i915 and Xe
> URL   : https://patchwork.freedesktop.org/series/146433/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8276_full -> XEIGTPW_12790_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12790_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12790_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12790_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_alpha_blend@constant-alpha-max:
>     - shard-dg2-set2:     [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-464/igt@kms_plane_alpha_blend@constant-alpha-max.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_plane_alpha_blend@constant-alpha-max.html
> 
>   * igt@kms_properties@connector-properties-atomic:
>     - shard-dg2-set2:     [PASS][3] -> [FAIL][4] +1 other test fail
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8276/shard-dg2-434/igt@kms_properties@connector-properties-atomic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@kms_properties@connector-properties-atomic.html
> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-bmg:          NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-bmg-4/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
>     - shard-dg2-set2:     NOTRUN -> [SKIP][6]
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-dg2-434/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
>     - shard-lnl:          NOTRUN -> [SKIP][7]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12790/shard-lnl-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 

These are unrelated to my change.

Thank you,

Peter
