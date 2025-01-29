Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39E9BC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 13:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA06310E04F;
	Wed, 29 Jan 2025 13:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RcppwkJ1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479810E04F;
 Wed, 29 Jan 2025 13:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738156733; x=1769692733;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Fggjq5rkbcIHc1sCddBxqeFz/Wr2CBbXb76KP5pNfVA=;
 b=RcppwkJ1P6MQphL+BKc2ogjiFaZZt3pY8smwpoYaOc+cGIQBWMgBb6N7
 r0G0cZH0cULUijs9GlimOQj0oHQ1rsWasKlVsruQZICzZixTzqKlhWSip
 4L/izrGLtZr21cbYfPWp/1PY77g9yZ1dQfIoG25N5z4AnypYZsh5hvRHz
 OKmFrZb145RGzGLy3a9xpYFUQeSTqo6/iMnkSNTtuDd8Vw3cVDxRTBJAN
 /WKFh8YdXe//RuH6blDq94rl3kHX21qAZcXJ7EUObJqb3hDFE5YgIdC3k
 XFy4QueMX12pnZhda0ZQoumwXRXUtDUWNoNMeSviLEF0FSHNPq0g0hm5n A==;
X-CSE-ConnectionGUID: y0KFNa9VQCWGjzIZZ1tROw==
X-CSE-MsgGUID: NwPZ6uh3T5K+nMk2uNbU0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38573387"
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="38573387"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 05:18:52 -0800
X-CSE-ConnectionGUID: DjJ9Pc1sQkeXrvrgi28lNA==
X-CSE-MsgGUID: j1kuM3YoSyK+ytdxeSOwKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,243,1732608000"; d="scan'208";a="109619415"
Received: from nwochtma-mobl.ger.corp.intel.com (HELO [10.245.83.54])
 ([10.245.83.54])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 05:18:51 -0800
Message-ID: <26c38219-f262-42a2-9d72-9d07eeaebb81@linux.intel.com>
Date: Wed, 29 Jan 2025 14:18:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Integrate_k?=
 =?UTF-8?Q?memleak_scans_in_igt=5Frunner_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <173814723907.2353200.17234814925376517560@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173814723907.2353200.17234814925376517560@b555e5b46a47>
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

On 29.01.2025 11:40, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrate kmemleak scans in igt_runner (rev2)
> URL   : https://patchwork.freedesktop.org/series/143996/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8212_full -> XEIGTPW_12508_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12508_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12508_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12508_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8212/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12508/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@xe_pm_residency@gt-c6-freeze:
>     - shard-dg2-set2:     [PASS][3] -> [ABORT][4] +1 other test abort
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8212/shard-dg2-435/igt@xe_pm_residency@gt-c6-freeze.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12508/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html

These are unrelated to my change. Please fix and re-run.
