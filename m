Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FBBE77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 19:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02DF110E76E;
	Tue,  7 Jan 2025 19:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lsTmcz0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B7E10E76E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736276822; x=1767812822;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bCfjgWeD5sgiNQtOv1lijQO4nbqPh0RAlHNFH7ZX/2A=;
 b=lsTmcz0BweCvVaaIyBXh1K8igfEpUcSBPcpvV71G5ewtzWvQHV3yViBj
 hD6CUPewvvhoVPIfRtnT7djoI1eYsv3Gw6MVrfZgyqCaO66bEW58vEAYu
 M39NTmlxU9NgBOTPtYIDXDsXGKS6JXTRXnpGYB4nHWO8sbDGRPDSsc86R
 FGXxBdDpKh/bXVHc3cKEbwaRrwPTqQMpXVyGM8MSyslf37XasGwyB2BUI
 cr/gHzOFzwemGBsqbJQzrATnSpNdU3PObXFqLkSLQFX5stupWczoVEj0b
 6S1oZobptUhfYHiaZ9QSX6TWUw4fGlv/0ywvNMaWlp4bkBMvXPk6qcVpv Q==;
X-CSE-ConnectionGUID: 3JOfkUeUQ1yI+S/qXzkI3A==
X-CSE-MsgGUID: QGUtWJY9SJe6pI9xNEIh3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="24084895"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="24084895"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 11:07:02 -0800
X-CSE-ConnectionGUID: PtEWDDN2T7CP2M47Yx05xA==
X-CSE-MsgGUID: zxnMQ1nASM+sQy+6oQ308w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="133710556"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.171])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 11:07:02 -0800
Date: Tue, 7 Jan 2025 13:06:54 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Stop asserting on
 usage percentage
Message-ID: <akco7iuptjbgq4bkysj4vzdlf22alilycmdn4by5mimte3tmoi@qu5fo7nnxl6v>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-8-lucas.demarchi@intel.com>
 <CH0PR11MB54446EFE4FE2FA4E88C65025E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54446EFE4FE2FA4E88C65025E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
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

On Mon, Jan 06, 2025 at 10:58:34PM +0000, Cavitt, Jonathan wrote:
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De Marchi
>Sent: Friday, January 3, 2025 11:16 PM
>To: igt-dev@lists.freedesktop.org
>Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>
>Subject: [PATCH i-g-t 8/8] tests/intel/xe_drm_fdinfo: Stop asserting on usage percentage
>>
>> It's unreliable to assert on the usage percentage considering 2 data
>> points as it still depends on the CPU scheduling not preempting tasks in
>> the wrong moment. On a normal use case of a top-like application, the
>> value not accounted for would simply show up in the next sample without
>> much issue. For a test assertion, it's better to check that the value
>> reported via fdinfo is reasonably close to the one saved by the GPU in
>> the spin. It's still allowed some error because there are a few GPU
>> ticks of difference due to the **GPU** scheduling the contexts.
>>
>> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>There's a few nits/questions below, but I trust that everything is in
>order, so nothing below is particularly blocking.  If I did manage to
>catch something that needs fixing, then of course that should be
>fixed, but otherwise:
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>
>> ---
>>  tests/intel/xe_drm_fdinfo.c | 49 +++++++++++++++++++++++--------------
>>  1 file changed, 31 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> index 1089e5119..120436fbe 100644
>> --- a/tests/intel/xe_drm_fdinfo.c
>> +++ b/tests/intel/xe_drm_fdinfo.c
>> @@ -3,6 +3,8 @@
>>   * Copyright (c) 2023 Intel Corporation
>>   */
>>
>> +#include <math.h>
>> +
>>  #include "igt.h"
>>  #include "igt_core.h"
>>  #include "igt_device.h"
>> @@ -371,7 +373,8 @@ static void basic_engine_utilization(int xe)
>>
>>  static void
>>  check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>> -	      int class, int width, enum expected_load expected_load)
>> +	      int class, int width, uint32_t spin_stamp,
>> +	      enum expected_load expected_load)
>>  {
>>  	double percent;
>>  	u64 den, num;
>> @@ -383,12 +386,9 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>
>>  	num = s2[class].cycles - s1[class].cycles;
>>  	den = s2[class].total_cycles - s1[class].total_cycles;
>> -	percent = (num * 100.0) / (den + 1);
>> -
>> -	/* for parallel submission scale the busyness with width */
>> -	percent /= width;
>>
>> -	igt_debug("%s: percent: %f\n", engine_map[class], percent);
>> +	percent = (num * 100.0) / (den + 1) / width;
>
>Nit:
>There's probably an argument to be made that we didn't need to modify
>the calculation here because the end result is still the same and it loses
>a (presumably) helpful comment, but I won't block on it.

ok, adding that back

>
>Also, is this percentage correct given the test modifications?
>Maybe we should be dividing by spin_stamp + 1 instead, since that's what
>we're using to calculate the percentage later?

nah.. there are 2 percentages here. This one I decided to leave as a
debug print... it's still useful to check we are ~100% utilization. I
just don't want the test to assert that anymore as it's noisy when there
are things disrupting the test execution.

>
>> +	igt_debug("%s: percent: %.2f%%\n", engine_map[class], percent);
>>
>>  	switch (expected_load) {
>>  	case EXPECTED_LOAD_IDLE:
>> @@ -396,11 +396,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
>>  		break;
>>  	case EXPECTED_LOAD_FULL:
>>  		/*
>> -		 * We are still relying on CPU sleep time and there could be
>> -		 * some imprecision when calculating the load. Use a 5% margin.
>> +		 * percentage error between value saved by gpu in xe_spin and what
>> +		 * is reported via fdinfo
>
>Nit:
>s/percentage/Percentage
>
>>  		 */
>> -		igt_assert_lt_double(95.0, percent);
>> -		igt_assert_lt_double(percent, 105.0);
>> +		percent = fabs((num - spin_stamp) * 100.0) / (spin_stamp + 1);
>
>Nit:
>Shouldn't we also be dividing by width here?  I'm just asking because that's

actually spin_stamp should be multiplied by width, which should also
fix the errors reported by CI - I happened to test it only on machines
that had 1 CCS so didn't reproduce any issue on virtual/parallel. My
bad.  I'm adding a fix and sending as v2.

thanks
Lucas De Marchi

>what we were doing before, and it looks like spin_stamp is being used here
>as a stand-in for the "den" variable in the earlier percent calculation.
>
>> +		igt_debug("%s: error: %.2f%%\n", engine_map[class], percent);
>> +		igt_assert_lt_double(percent, 5.0);
>>  		break;
>>  	}
>>  }
>> @@ -438,14 +439,17 @@ utilization_single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned in
>>
>>  	expected_load = flags & TEST_BUSY ?
>>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>> -	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1, expected_load);
>> +
>> +	check_results(pceu1[0], pceu2[0], hwe->engine_class, 1,
>> +		      cork ? cork->spin->timestamp : 0, expected_load);
>>
>>  	if (flags & TEST_ISOLATION) {
>>  		/*
>>  		 * Load from one client shouldn't spill on another,
>>  		 * so check for idle
>>  		 */
>> -		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, EXPECTED_LOAD_IDLE);
>> +		check_results(pceu1[1], pceu2[1], hwe->engine_class, 1, 0,
>> +			      EXPECTED_LOAD_IDLE);
>>  		close(new_fd);
>>  	}
>>
>> @@ -461,6 +465,7 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>>  	struct pceu_cycles pceu1[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct pceu_cycles pceu2[DRM_XE_ENGINE_CLASS_COMPUTE + 1];
>>  	struct xe_cork *cork;
>> +	uint32_t timestamp;
>>  	uint32_t vm;
>>
>>  	vm = xe_vm_create(fd, 0, 0);
>> @@ -472,13 +477,15 @@ utilization_single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hw
>>
>>  	/* destroy queue before sampling again */
>>  	xe_cork_sync_end(fd, cork);
>> +	timestamp = cork->spin->timestamp;
>>  	xe_cork_destroy(fd, cork);
>>
>>  	read_engine_cycles(fd, pceu2);
>>
>>  	xe_vm_destroy(fd, vm);
>>
>> -	check_results(pceu1, pceu2, hwe->engine_class, 1, EXPECTED_LOAD_FULL);
>> +	check_results(pceu1, pceu2, hwe->engine_class, 1, timestamp,
>> +		      EXPECTED_LOAD_FULL);
>>  }
>>
>>  static void
>> @@ -503,7 +510,8 @@ utilization_others_idle(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		enum expected_load expected_load = hwe->engine_class != class ?
>>  			EXPECTED_LOAD_IDLE : EXPECTED_LOAD_FULL;
>>
>> -		check_results(pceu1, pceu2, class, 1, expected_load);
>> +		check_results(pceu1, pceu2, class, 1, cork->spin->timestamp,
>> +			      expected_load);
>>  	}
>>
>>  	xe_cork_destroy(fd, cork);
>> @@ -547,7 +555,8 @@ utilization_others_full_load(int fd, struct drm_xe_engine_class_instance *hwe)
>>  		if (!cork[class])
>>  			continue;
>>
>> -		check_results(pceu1, pceu2, class, 1, expected_load);
>> +		check_results(pceu1, pceu2, class, 1, cork[class]->spin->timestamp,
>> +			      expected_load);
>>  		xe_cork_destroy(fd, cork[class]);
>>  	}
>>
>> @@ -585,7 +594,9 @@ utilization_all_full_load(int fd)
>>  		if (!cork[class])
>>  			continue;
>>
>> -		check_results(pceu1, pceu2, class, 1, EXPECTED_LOAD_FULL);
>> +		check_results(pceu1, pceu2, class, 1,
>> +			      cork[class]->spin->timestamp,
>> +			      EXPECTED_LOAD_FULL);
>>  		xe_cork_destroy(fd, cork[class]);
>>  	}
>>
>> @@ -657,14 +668,16 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>>
>>  	expected_load = flags & TEST_BUSY ?
>>  	       EXPECTED_LOAD_FULL : EXPECTED_LOAD_IDLE;
>> -	check_results(pceu[0], pceu[1], class, width, expected_load);
>> +
>> +	check_results(pceu[0], pceu[1], class, width,
>> +		      cork ? cork->spin->timestamp : 0, expected_load);
>>
>>  	if (flags & TEST_ISOLATION) {
>>  		/*
>>  		 * Load from one client shouldn't spill on another,
>>  		 * so check for idle
>>  		 */
>> -		check_results(pceu_spill[0], pceu_spill[1], class, width,
>> +		check_results(pceu_spill[0], pceu_spill[1], class, width, 0,
>>  			      EXPECTED_LOAD_IDLE);
>>  		close(fd_spill);
>>  	}
>> --
>> 2.47.0
>>
>>
