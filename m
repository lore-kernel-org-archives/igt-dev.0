Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6133CC43327
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 13:48:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9D510F39A;
	Thu,  2 Jul 2026 13:48:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nVy6P3LF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC7210F398
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783000097; x=1814536097;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4jUdQaVnoXWIiKly6uZpcwFUiq5qiB9KlKkD090bU0c=;
 b=nVy6P3LFKa2EZgFAVlLbhGEVSc2d02PhFRuHvB+LtgmYXOEtrrWkTkhz
 I9O21z5Yy8WqD3bPkieLP3y4a0sd1BrNSeE+0xNo9kdI+6shrNqXPIc+I
 3gCyt1C4koJ4SSYhmnQoY4UFdeiru34e6PfMk2fN4amK0xzHPrIT8lLfn
 bfDcri3wPFKcQA43pn/6mBLa270ZKsywDa5lix/aIi4GmeO70Zpt8dkPf
 W1RqmJ3lLDMiUJs0k/boJmZKWcx+AMFOkPwNENGHlCT/+2C3/DWbF9Tib
 PtBMwMQvzBrED5F85ngSXE7ugUEVUH/0jLcYlRJIgIxYEB8OZcg6DFE+M Q==;
X-CSE-ConnectionGUID: SFllY6BJSjKaBnJuIP6W5A==
X-CSE-MsgGUID: v6N8+79KSd6C9EyqDYszrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95259784"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="95259784"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:48:17 -0700
X-CSE-ConnectionGUID: OohaPXV7QvWGKBdN3PiR0Q==
X-CSE-MsgGUID: zVTjtQsVSJ2LyMDuMk6kSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="251147655"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.26])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 06:48:14 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, vitaly.prosyak@amd.com
Cc: igt-dev@lists.freedesktop.org, Jesse Zhang <jesse.zhang@amd.com>,
 Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>
Subject: Re: [PATCH 3/7] lib/amdgpu: Add AMD platform filtering backend
In-Reply-To: <20260702134233.joyngzudno5jenk7@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-3-vitaly.prosyak@amd.com>
 <20260702134233.joyngzudno5jenk7@kamilkon-DESK.igk.intel.com>
Date: Thu, 02 Jul 2026 16:48:10 +0300
Message-ID: <448ec82f897ee4a3f7a2ab9bcae2e1734d9349a2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 02 Jul 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi vitaly.prosyak,
> On 2026-06-29 at 23:23:22 -0400, vitaly.prosyak@amd.com wrote:
>> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>=20
>> Implement the AMD-specific backend for the generic platform filtering
>> framework, providing:
>>=20
>> - ASIC identification via amdgpu family_id and chip_rev ranges
>> - ASIC name table mapping (navi10, navi48, arcturus, etc.)
>> - AMD-specific built-in skip rules
>> - amd_platform_filter_init() convenience function for AMD tests
>>=20
>> This is a pluggable backend accessed through platform_filter_ops
>> callbacks. The core framework has zero AMD-specific knowledge.
>>=20
>> To add support for another vendor (e.g., Intel):
>> 1. Create lib/i915/intel_platform.c/h
>> 2. Implement platform_filter_ops callbacks
>> 3. Define Intel platform data (platform_id, stepping ranges)
>> 4. Call intel_platform_filter_init() from Intel tests
>>=20
>> Usage in AMD tests:
>>     amd_platform_filter_init(&gpu_info);
>>     igt_platform_require(igt_test_name(), "my-subtest");
>>=20
>> Example skip via environment variable:
>>     export IGT_PLATFORM_SKIP_CONFIG=3Dnavi48:amd_basic:*-UMQ:unstable
>>=20
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Cc: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
>> ---
>>  lib/amdgpu/amd_platform.c | 318 ++++++++++++++++++++++++++++++++++++++
>>  lib/amdgpu/amd_platform.h |  53 +++++++
>>  lib/meson.build           |   1 +
>>  3 files changed, 372 insertions(+)
>>  create mode 100644 lib/amdgpu/amd_platform.c
>>  create mode 100644 lib/amdgpu/amd_platform.h
>
> Please make sure that you patch series compile patch after patch,
> so it will not break bisecting. For example run:
>
> git rebase origin -x ./compile.sh
>
> with script which will remove build folder before each build.

Why should the build folder be removed? Is there reason to believe
dependency tracking and incremental builds are failing?

I only ever do git rebase -i origin -x 'ninja -C build'.

BR,
Jani.


--=20
Jani Nikula, Intel
