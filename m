Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E385BC3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 13:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9538310E68E;
	Tue,  6 May 2025 13:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KkEwo0nv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BA310E6A7
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 13:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746536753; x=1778072753;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PN+N9eQLu5q0YiSWQuvWSPr0a1aCQPrnxId/TW7Fqo8=;
 b=KkEwo0nvbpXHN1Tglqwa87w3CgJYSIgYDa7G/t24horibDCm92JQLVqH
 fPnccsjdTew2zxwGgFeLrmpe9o0/ACjvFKWhWIfJ+Uj3jb8RCGYBUj14I
 r0iyvquQ4xCHrP8S64IkjIlYpgqSabrCsgo9jiKBRngIQV9UdYfkuJXMM
 JAyLqwDz8LKc8SPaa54rgAsw2jpwh5uhDmXv8MgyeTBKpi4dq7ltUNBkL
 YAblbcG6TIYYyi71YgyIVhRYDtDeMhYw4zwJywlO1OnvbJH0snYuf13RL
 XW4cvn1x2/boNdUfMocBxiVQ4Fa9BP/wo1fyopbFUPRrjpUyp/fdtf+m9 g==;
X-CSE-ConnectionGUID: qGgbZynzSXyOj3rG6bWIMA==
X-CSE-MsgGUID: 76ZSfvKJSaSXTrXF5ru07Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="51852451"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="51852451"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:05:52 -0700
X-CSE-ConnectionGUID: YrulYAyhRJ+t65GLc6zl5Q==
X-CSE-MsgGUID: 7ElPjLJxS52HE6G7lDml0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="136610501"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.101.99])
 ([10.245.101.99])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 06:05:50 -0700
Message-ID: <19df39b5-933f-4dac-9240-daa44194faf0@linux.intel.com>
Date: Tue, 6 May 2025 15:05:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
 <20250506101554.629218-2-marcin.bernatowicz@linux.intel.com>
 <LV3PR11MB86959312120282B055C39F93F989A@LV3PR11MB8695.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <LV3PR11MB86959312120282B055C39F93F989A@LV3PR11MB8695.namprd11.prod.outlook.com>
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



On 5/6/2025 2:51 PM, K V P, Satyanarayana wrote:
> Hi.
>> -----Original Message-----
>> From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Sent: Tuesday, May 6, 2025 3:46 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Kolakowski,
>> Jakub1 <jakub1.kolakowski@intel.com>; Tauro, Riana
>> <riana.tauro@intel.com>; K V P, Satyanarayana
>> <satyanarayana.k.v.p@intel.com>
>> Subject: [PATCH i-g-t 1/2] tests/intel/xe_pmu: Unprovision VFs on cleanup
>>
>> Unprovision VFs to ensure a clean state for subsequent tests.
>> Rename disable_vfs() to unprovision_and_disable_vfs() to reflect the
>> additional cleanup steps.
>>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 11 +++++++----
>>   1 file changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 094dc0c6c..8cbbf6916 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -497,12 +497,15 @@ static unsigned int enable_and_provision_vfs(int
>> fd)
>>   	return num_vfs;
>>   }
>>
>> -static void disable_vfs(int fd)
>> +static void unprovision_and_disable_vfs(int fd)
>>   {
>> -	unsigned int gt;
>> +	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
>>
>> -	xe_for_each_gt(fd, gt)
>> +	xe_for_each_gt(fd, gt) {
>>   		xe_sriov_set_sched_if_idle(fd, gt, 0);
>> +		for (int fn = 0; fn <= num_vfs; fn++)
>> +			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
>> +	}
>>
> Do we need to set exec quantum for VFs, when un-provisioning and disabling VFs?
> Any specific reason for doing this?
> -Satya.

The settings stored by PF persist across VF enable/disable cycles.
--
marcin

>>   	igt_sriov_disable_vfs(fd);
>>   	/* abort to avoid execution of next tests with enabled VFs */
>> @@ -596,7 +599,7 @@ igt_main
>>   		}
>>
>>   		igt_fixture
>> -			disable_vfs(fd);
>> +			unprovision_and_disable_vfs(fd);
>>   	}
>>
>>   	igt_subtest_group {
>> --
>> 2.31.1
> 

