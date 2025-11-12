Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224DCCCF9F8
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 10:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5AF10E08E;
	Wed, 12 Nov 2025 10:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q0+9PgZ3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A2810E08E;
 Wed, 12 Nov 2025 10:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762943130; x=1794479130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DaXPieHiNQ1U3UaHBJArkQaAO5NZgTlhI4BuQSW0ECg=;
 b=Q0+9PgZ3V7N/9R8LUDiESSDf1l/S+drGd0KFHFigqnKFk5R7gbG74sEp
 HrKlJbAiZrd6QCiZZ6wrUCcsg9/KHBQQhB+W/tH3GMobcRLYWxhQMwIuq
 ieaLGUkmoVDJ0A1oSghDg4rUukZJW+hDzYIUZ00HbLygE91bxSRibvypw
 bgtUjYNAVPXBc0M1u4waer7HmacPB51RaskFMcUvmVPMA6atnYrDuhTBi
 DgeL3u9h11+IX06QHoivHUg66CRVy6A/RIfqAdgwQ4h9Mb9avLcEq3/uG
 1Dsn3+sm272+jFzKSRJVX6+6gKoXaP2gzXm++F2m7CctutPnGaCLPq5Mc A==;
X-CSE-ConnectionGUID: KjJzOI9LQjC9g/7qjrBcwA==
X-CSE-MsgGUID: 1gcAbVMQQMW3JoaNzUji8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="65039098"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="65039098"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:25:30 -0800
X-CSE-ConnectionGUID: oywryyY3R/KYS8uEN0i0wQ==
X-CSE-MsgGUID: trjR5wbTRSyGWQkY+orGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="189620447"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.63])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 02:25:29 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Subject: Re: =?UTF-8?B?4pyX?= i915.CI.Full: failure for tests/dmabuf: Avoid
 soft lockups on slow platforms (rev2)
Date: Wed, 12 Nov 2025 11:22:56 +0100
Message-ID: <1969470.eGJsNajkDb@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <176264564673.33229.10496747398313496958@10055242dc62>
References: <20251104112116.432508-2-janusz.krzysztofik@linux.intel.com>
 <176264564673.33229.10496747398313496958@10055242dc62>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Hi I915-ci-infra@lists.freedesktop.org,

On Sunday, 9 November 2025 00:47:26 CET Patchwork wrote:
> == Series Details ==
> 
> Series: tests/dmabuf: Avoid soft lockups on slow platforms (rev2)
> URL   : https://patchwork.freedesktop.org/series/156999/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17515_full -> IGTPW_14024_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_14024_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_14024_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14024/index.html
> 
> Participating hosts (12 -> 10)
> ------------------------------
> 
>   Missing    (2): shard-snb-0 shard-dg2-set2 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_14024_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@panthor/panthor_vm@vm_unbind:
>     - shard-dg1:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14024/shard-dg1-15/igt@panthor/panthor_vm@vm_unbind.html
> 
>   * igt@panthor/panthor_vm@vm_unbind_invalid_address:
>     - shard-dg2:          NOTRUN -> [SKIP][2] +3 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14024/shard-dg2-3/igt@panthor/panthor_vm@vm_unbind_invalid_address.html

The scope of the change under this pre-merge testing is limited to dmabuf test 
and i915_selftest to some extent, then the above failures are not related to 
this change.  Please update CBL filters and re-report.

Please also note those are new tests for non-Intel platform, then should be 
rather blocklisted.  Opening a request for them to be added to the blocklist 
seems to be a good idea.

Thanks,
Janusz

> 
>   
> #### Warnings ####
> 
>   * igt@panthor/panthor_vm@vm_create_destroy:
>     - shard-rkl:          [SKIP][3] ([i915#14544]) -> [SKIP][4] +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17515/shard-rkl-6/igt@panthor/panthor_vm@vm_create_destroy.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14024/shard-rkl-8/igt@panthor/panthor_vm@vm_create_destroy.html
> 
>   
> New tests
> ---------
...


