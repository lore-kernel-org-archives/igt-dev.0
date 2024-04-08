Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC8C67861
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 10:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35FD10E084;
	Mon,  8 Apr 2024 10:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZB4s3B/V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11DDF10E084
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 10:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712573012; x=1744109012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=96giHvJI7z9cz/3MRzR/jd1EtzGYijjQViO6hM2SuoU=;
 b=ZB4s3B/VoOaeikSPihsRmfCdTmw+5fXqCkHmP04e7QfrUuK5wP/hrQte
 2X84mfte0SLxFFtPd2X5aHoloKVQb4saEHnBgIX9wUYOPo9qSpODn7G69
 LX8Ahw+tBHV8yQzA+DLKlv38n3bxjSV5D9T30WOOI2TtExXHEbivjkZ99
 gJbP8612Hmxv8ZH5WCdCpgAZV0oHS6stNoYmcCgbPQJKw+Dl4ZRrXjonQ
 Ig44InJX13rssAYPhWYKghZ64zUCXRrPyC2FvrQbJDbzGKnjvZlPShoGK
 avCBISv5h6jWz1CB8QTpalmkRTQEPv1GJVDA8Pc+7UpQY+e2H0uLQ5B8J g==;
X-CSE-ConnectionGUID: CkIrLkTSSXeCc3E+dzCldQ==
X-CSE-MsgGUID: 8tRZJxN1SJy4q+d0PZ3RzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="8422075"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="8422075"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 03:43:31 -0700
X-CSE-ConnectionGUID: H2Jcq+AWQwufSe2Gkl/wEQ==
X-CSE-MsgGUID: Qx50R2KIRKaUJKd/2TWLbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19936630"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 03:43:31 -0700
Date: Mon, 8 Apr 2024 12:43:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@igalia.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVA==?= =?utf-8?Q?=3A?= failure for
 tools/gputop: Fix engine columns with amdgpu
Message-ID: <20240408104318.26lnsprn7zz2acw7@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tursulin@igalia.com>
References: <20240403150057.25765-1-tursulin@igalia.com>
 <171222386298.1209302.9037990426748979597@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171222386298.1209302.9037990426748979597@8e613ede5ea5>
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
On 2024-04-04 at 09:44:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/gputop: Fix engine columns with amdgpu
> URL   : https://patchwork.freedesktop.org/series/131997/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7798_full -> IGTPW_10973_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10973_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10973_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10973/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10973_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - shard-rkl:          [PASS][1] -> [DMESG-FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7798/shard-rkl-3/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10973/shard-rkl-4/igt@i915_selftest@live@gt_pm.html
> 
>   * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-1:
>     - shard-snb:          [PASS][3] -> [INCOMPLETE][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7798/shard-snb5/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-1.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10973/shard-snb6/igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-a-hdmi-a-1.html
> 

This is unrelated to change in tools/gputop,
no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10973_full that come from known issues:
> 
> ### IGT changes ###
> 

...cut...

> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7798 -> IGTPW_10973
> 
>   CI-20190529: 20190529
>   CI_DRM_14522: 406e10d886a22211d2866bfa9322aec1727171f8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10973: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10973/index.html
>   IGT_7798: 5e3263748a636ebc91ecfafbd339870c77e3eed6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10973/index.html
