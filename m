Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD281C52D73
	for <igt-dev@archiver.kernel.org>; Thu,  8 Aug 2024 06:55:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4DC10E660;
	Thu,  8 Aug 2024 06:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5EkO7HI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC4F10E660;
 Thu,  8 Aug 2024 06:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723100100; x=1754636100;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to:content-transfer-encoding;
 bh=YuIbGn7vI8TQ3y3juqQ15LYA/fcsIhZL6YHhznydX9Y=;
 b=h5EkO7HIrsUdbsLZg2jd9jApvKMmS6Z1sVgXmfRuKeO9p3638fR+NPSd
 6oel2vpVmrvvf8iI7hJm6/OhsrEFSpeJS1YO8VHMkoMaldrLxmp+4be9s
 ScNS2jbSeyYN6E2cnzKVvavaPeK/yBo+VTD7k9LYoPsKOdT8tcvq8jeEl
 V+4VTUYsr0yQXCgQalpLVN4ZSEQV7npV5XHuuyDlUyvLepNfwqvdJG+vS
 97uA4l/fZFijk1SX4hwxwDfOIqhj6sA9LVMH9Wh+OWlXKDZi+qYeJXcpU
 OwHotXW1pxkFSRF6SIrlM9K8q4lDTccLapa3IplE3AtcMylp4D7SQqF8n A==;
X-CSE-ConnectionGUID: nLMcvV+eQwqYEQRXk+UBXQ==
X-CSE-MsgGUID: 6C5EKmZjRi64CIaGfC1Yyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21358105"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="21358105"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:54:59 -0700
X-CSE-ConnectionGUID: thYo28lDTGi2r1wMNLLLYg==
X-CSE-MsgGUID: rcvwJWeZQ+mpIBeXamLLYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; d="scan'208";a="94672286"
Received: from jgulati-mobl.ger.corp.intel.com (HELO [10.251.218.220])
 ([10.251.218.220])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2024 23:54:58 -0700
Message-ID: <93bb48a0-f1f4-4c43-8ebd-ff17f9219e17@linux.intel.com>
Date: Thu, 8 Aug 2024 08:54:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_CI=2ExeFULL=3A_failure_for_lib/xe/xe=5Fqu?=
 =?UTF-8?Q?ery=3A_Do_not_require_QUERY=5FOA=5FUNITS_for_all_Xe_tests_=28rev6?=
 =?UTF-8?Q?=29?=
To: I915-ci-infra@lists.freedesktop.org
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
 <172259476895.502952.14859408568672929532@2413ebb6fbb6>
Content-Language: en-US
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <172259476895.502952.14859408568672929532@2413ebb6fbb6>
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



On 02.08.2024 12:32, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev6)
> URL   : https://patchwork.freedesktop.org/series/136499/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7952_full -> XEIGTPW_11522_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11522_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11522_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_11522_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> 
>   * igt@kms_plane_cursor@primary:
>     - shard-lnl:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7952/shard-lnl-3/igt@kms_plane_cursor@primary.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11522/shard-lnl-5/igt@kms_plane_cursor@primary.html

Dear I915-ci-infra@lists.freedesktop.org,

The above does not seem to be related to my series.

Thank you!
