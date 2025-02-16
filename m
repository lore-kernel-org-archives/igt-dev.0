Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8AA0C02198
	for <igt-dev@archiver.kernel.org>; Sun, 16 Feb 2025 11:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FA410E1D9;
	Sun, 16 Feb 2025 11:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H7bKiDxc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2936010E1D9
 for <igt-dev@lists.freedesktop.org>; Sun, 16 Feb 2025 11:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739703942; x=1771239942;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=3MtoW3MqZcZaOAsvAoXULWwbBLh1XA3JfGYtlb/Pl/U=;
 b=H7bKiDxclIz7GGW9aWlveEY08AT/5Ku/FefWWKok1+ptnJovLjR+Ygt6
 jaaRqpGCFBpfdh64Cczyzp7qDVw/45GNFIvjsY0Xwe+mOF1UKOvYCsODs
 HYcS/PksjSZkvzkDxm16y4T+7Y3Z+za6BxHL8yoCcOjy6VAVd9gm4M15G
 Oe1x4FJDNoGxGi5AfY3aWd6OyVTwTSswrvVgd7cZtgVnSieMd2enE6uza
 rP0Tw9PKYBHBkUqeCxDQrXUccvBeCIY0tO5GP4BMoaWCAm33xuXRE2i5F
 vm6oqNmHknVdnK84ryVyunco4Z3PMlPTCkHqwywq+tP/OuA3Q8l+DC6Gl g==;
X-CSE-ConnectionGUID: IDINeJwlSdOBpZSUsI4Iww==
X-CSE-MsgGUID: r5pKw2RLRLC0gyRaO8Oixg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="62872041"
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="62872041"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 03:05:42 -0800
X-CSE-ConnectionGUID: GlQpV5bJQT6ZeoJtjVgC3A==
X-CSE-MsgGUID: I10aWQiiSbqPaDs3dS36fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,290,1732608000"; d="scan'208";a="114066964"
Received: from pshyamkx-mobl.gar.corp.intel.com (HELO [10.247.229.94])
 ([10.247.229.94])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 03:05:39 -0800
Message-ID: <cd71d99a-2bd0-4192-9c92-e99cad954c40@intel.com>
Date: Sun, 16 Feb 2025 16:35:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/7] add dsc-fallback test
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 igt-dev@lists.freedesktop.org, "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <c0f26dfe-0591-4ac9-8d2f-4e61084947bc@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <c0f26dfe-0591-4ac9-8d2f-4e61084947bc@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


Hello,

On 13-02-2025 11:23, Nautiyal, Ankit K wrote:
>
> On 2/11/2025 11:35 PM, Kunal Joshi wrote:
>> Add test to check we fallback to dsc when current
>> link params cannot accomadate bw required by
>> the current mode.
>>
>> Kunal Joshi (7):
>>    tests/intel/kms_dp_linktrain_fallback: refactor find_mst_outputs
>>    tests/intel/kms_mst_helper: add helper for MST-related functions
>>    tests/intel/kms_dp_linktrain_fallback: refactor dp-fallback subtest
>>    tests/intel/kms_dp_linktrain_fallback: fix typo
>>    tests/intel/kms_dp_linktrain_fallback: add dsc-fallback test
>>    tests/intel/kms_dp_linktrain_fallback: disable ignore long hpd
>
> The series looks good to me.
>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
Thank you Ankit for the feedback and the review.
Thanks Swati for getting styling right and typo's fixed.

Below failures are not related to the series and skips are expected.

**Xe.CI.BAT**

- igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):
     - bat-lnl-1: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-lnl-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html) +1 
other test skip
     - bat-bmg-1: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-bmg-1/igt@kms_dp_linktrain_fallback@dsc-fallback.html) +1 
other test skip
     - bat-dg2-oem2: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/bat-dg2-oem2/igt@kms_dp_linktrain_fallback@dsc-fallback.html)


**Xe.CI.Full**

- igt@kms_dp_linktrain_fallback@dp-fallback:
     - 
shard-lnl: [SKIP](https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8228/shard-lnl-3/igt@kms_dp_linktrain_fallback@dp-fallback.html) ([Intel 
XE#3070](https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070)) 
-> [SKIP](https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12576/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html)


**i915.CI.BAT**

- igt@kms_dp_linktrain_fallback@dp-fallbck:

     - Statuses : 40 skip(s)
     - Exec time: [0.0] s
- igt@kms_dp_linktrain_fallback@dsc-fallback:

     - Statuses : 2 pass(s) 38 skip(s)
     - Exec time: [0.0, 1.40] s


**i915.CI.Full**

- igt@gem_mmap_offset@open-flood:

     - 
shard-rkl: [PASS](https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16110/shard-rkl-1/igt@gem_mmap_offset@open-flood.html) -> [DMESG-WARN](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-rkl-5/igt@gem_mmap_offset@open-flood.html)
- igt@i915_suspend@debugfs-reader:

     - shard-glk: NOTRUN 
-> [INCOMPLETE](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-glk1/igt@i915_suspend@debugfs-reader.html)
- igt@kms_dp_linktrain_fallback@dp-fallback:

     - shard-dg2: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-dg2-3/igt@kms_dp_linktrain_fallback@dp-fallback.html) +1 
other test skip
     - shard-rkl: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-rkl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html)
     - shard-tglu-1: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-tglu-1/igt@kms_dp_linktrain_fallback@dp-fallback.html)
     - shard-dg1: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-dg1-17/igt@kms_dp_linktrain_fallback@dp-fallback.html) +1 
other test skip
     - shard-mtlp: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-mtlp-7/igt@kms_dp_linktrain_fallback@dp-fallback.html) +1 
other test skip
- igt@kms_dp_linktrain_fallback@dsc-fallback (NEW):

     - shard-tglu: NOTRUN 
-> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-tglu-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html)
- igt@perf_pmu@rc6@runtime-pm-gt0:

     - 
shard-rkl: [PASS](https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16110/shard-rkl-1/igt@perf_pmu@rc6@runtime-pm-gt0.html) -> [SKIP](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-rkl-7/igt@perf_pmu@rc6@runtime-pm-gt0.html)
- igt@sysfs_heartbeat_interval@nopreempt@vcs0:

     - 
shard-mtlp: [PASS](https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16110/shard-mtlp-5/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html) -> [DMESG-WARN](https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12576/shard-mtlp-7/igt@sysfs_heartbeat_interval@nopreempt@vcs0.html)

Series is merged now.

Thanks and Regards
Kunal Joshi

>
>>    HAX: Do not merge
>>
>>   tests/intel-ci/fast-feedback.testlist    |   3 +-
>>   tests/intel-ci/xe-fast-feedback.testlist |   3 +-
>>   tests/intel/kms_dp_linktrain_fallback.c  | 356 +++++++++++++++++++----
>>   tests/intel/kms_mst_helper.c             |  48 +++
>>   tests/intel/kms_mst_helper.h             |  15 +
>>   tests/meson.build                        |   3 +
>>   6 files changed, 367 insertions(+), 61 deletions(-)
>>   create mode 100644 tests/intel/kms_mst_helper.c
>>   create mode 100644 tests/intel/kms_mst_helper.h
>>
