Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794C2C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 09:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F58810E0D4;
	Fri, 18 Apr 2025 09:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlTkgjWx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F35510E0D4;
 Fri, 18 Apr 2025 09:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744968062; x=1776504062;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=BtFDHg8epKVr7+S+aBY3slHDEgLO07bsopH2ZhLobik=;
 b=VlTkgjWxm8rTVAkpxfVVJiuC51VTTeQAhpL79ihyKPbalt1u5XAsuF1v
 Lildcjd09uxWWElYu7nWTRIbe2nzo2Cza+5+HN8kppiH/1IaAXS8WeWT6
 HLP3lTCHkZam1kfXnBvfCai1ORhEzflAWLt/n1CItitvpZr1l+DQu1kDa
 BOdi7abSCsjmWOVe7N1ey9yieuXqqhAjQxrprOQSXkbfs1l7fcq8VX18O
 Zh/aEi079aTDyeXKC0gqiCi7HJLfpABsu4dP+uP+2EzUPJGJR0B6sFwJh
 6MUM0RkmnB0RLpS9Np6Fwiy6Q65qG+pnm7RP9myVHT9v/CefTNBf5U2Z6 w==;
X-CSE-ConnectionGUID: lpbm+4WESvurICgEuIfjXA==
X-CSE-MsgGUID: KGOwYEYcQA6zb6iJAIcG5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50261067"
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="50261067"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 02:21:01 -0700
X-CSE-ConnectionGUID: 1zTLGfUmQViokY2M2Ch3mA==
X-CSE-MsgGUID: x0Q/QAiETzSILVCVfhzSqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,221,1739865600"; d="scan'208";a="162029903"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 02:21:00 -0700
Message-ID: <6e47ccae-5219-4a8c-8d70-7b1fa7a20ddc@linux.intel.com>
Date: Fri, 18 Apr 2025 11:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGxpYi94ZS94ZV9s?=
 =?UTF-8?Q?egacy=3A_Move_test=5Flegacy=5Fmode_to_lib/?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250417193032.329-1-peter.senna@linux.intel.com>
 <174492724911.16387.17476383132774158865@b68e5b3b99e1>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174492724911.16387.17476383132774158865@b68e5b3b99e1>
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

On 4/18/2025 12:00 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_legacy: Move test_legacy_mode to lib/
> URL   : https://patchwork.freedesktop.org/series/147939/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8326_BAT -> XEIGTPW_13004_BAT
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13004_BAT absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13004_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (8 -> 8)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13004_BAT:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_pipe_crc_basic@nonblocking-crc:
>     - bat-dg2-oem2:       [PASS][1] -> [DMESG-WARN][2] +56 other tests dmesg-warn
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13004/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
> 
>   
> #### Warnings ####
> 
>   * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries:
>     - bat-lnl-2:          [ABORT][3] ([Intel XE#4749]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8326/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13004/bat-lnl-2/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries.html
> 
>   
>   [Intel XE#4749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4749
> 

These are unrelated. Please fix and re-run.
