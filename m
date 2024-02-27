Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F2CC5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 18:22:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C081010E968;
	Tue, 27 Feb 2024 18:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIH9+0xe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E80410E968
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 18:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709058145; x=1740594145;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=0TR6ooXeT5wu0OWw8BbxTWr2ZMdU2Ju60iUa1Z7tP4o=;
 b=nIH9+0xema92Y646uOU1GUNGeYYXFeaAIWna71cSyO2prh2SvSAO/oZx
 b5ptZTL6eSwyEBwXE69OW/UqnHF80Owqv4oVATzSbjdb4a3xaFEnpwb9b
 qie+epQEvqGLwfMutskiebjaKX8skPC8UfBr3xho3JhQXArv1R+tkkKvO
 RQTNUw9+E48i90LmHvdCvxdGZpxf99ysv/fvJt4CBKJeY1WOtwaWDYeA4
 pnfKyPDpEEqWuAfkNa2R54hoHqG0yHtketWp7o2O89cuLtMflgkpjuTH5
 nqcxh5oQhgNzauhlrGi/DmE/fj/NIqqn5S36SvDzJFqfwzfKwZxC5xThj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3291829"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3291829"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:22:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="38175373"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.48.109])
 ([10.246.48.109])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 10:22:24 -0800
Message-ID: <e8ef4bc7-0de7-4d8b-acc8-cc1b7da7e730@linux.intel.com>
Date: Tue, 27 Feb 2024 19:22:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_compute_preempt: Add
 compute-preempt-many
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Janga Rahul Kumar <janga.rahul.kumar@intel.com>
References: <20240223193919.31331-1-nirmoy.das@intel.com>
 <20240227163905.pgyzgvancxjsyaey@zkempczy-mobl2>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240227163905.pgyzgvancxjsyaey@zkempczy-mobl2>
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


On 2/27/2024 5:39 PM, Zbigniew Kempczyński wrote:
> On Fri, Feb 23, 2024 at 08:39:19PM +0100, Nirmoy Das wrote:
>> Add compute-preempt-many which should exercise multiple
>> mid-thread preemption at a time for multiple contexts.
>>
>> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>> ---
>>   lib/intel_compute.c              | 24 +++++++++++++++---------
>>   lib/intel_compute.h              |  4 +++-
>>   tests/intel/xe_compute_preempt.c | 27 ++++++++++++++++++++++++---
>>   3 files changed, 42 insertions(+), 13 deletions(-)
>>
>> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
>> index c5d253ebc..8853b5cd3 100644
>> --- a/lib/intel_compute.c
>> +++ b/lib/intel_compute.c
>> @@ -1686,7 +1686,8 @@ static const struct {
>>   };
>>   
>>   static bool __run_intel_compute_kernel_preempt(int fd,
>> -		struct drm_xe_engine_class_instance *eci)
>> +		struct drm_xe_engine_class_instance *eci,
>> +		unsigned int count)
>>   {
>>   	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
>>   	unsigned int batch;
>> @@ -1719,12 +1720,16 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>>   	if (!kernels->kernel || !kernels->sip_kernel || !kernels->long_kernel)
>>   		return 0;
>>   
>> -	intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
>> -							  kernels->long_kernel_size,
>> -							  kernels->kernel, kernels->size,
>> -							  kernels->sip_kernel,
>> -							  kernels->sip_kernel_size,
>> -							  eci);
>> +	igt_fork(child, count) {
>> +		intel_compute_preempt_batches[batch].compute_exec(fd, kernels->long_kernel,
>> +								  kernels->long_kernel_size,
>> +								  kernels->kernel, kernels->size,
>> +								  kernels->sip_kernel,
>> +								  kernels->sip_kernel_size,
>> +								  eci);
>> +	}
>> +
>> +	igt_waitchildren();
> Generally it will work, but my personal preferences is to not forking
> inside library part. I mean I would fork in the test itself, keeping
> run_intel_compute_kernel_preempt() intact.

Yes, that makes sense.  I will resend.

Thanks,

Nirmoy

>
> --
> Zbigniew
>
>>   
>>   	return true;
>>   }
>> @@ -1737,7 +1742,8 @@ static bool __run_intel_compute_kernel_preempt(int fd,
>>    * Returns true on success, false otherwise.
>>    */
>>   bool run_intel_compute_kernel_preempt(int fd,
>> -		struct drm_xe_engine_class_instance *eci)
>> +		struct drm_xe_engine_class_instance *eci,
>> +		unsigned int count)
>>   {
>> -	return __run_intel_compute_kernel_preempt(fd, eci);
>> +	return __run_intel_compute_kernel_preempt(fd, eci, count);
>>   }
>> diff --git a/lib/intel_compute.h b/lib/intel_compute.h
>> index fe9637b91..430bae562 100644
>> --- a/lib/intel_compute.h
>> +++ b/lib/intel_compute.h
>> @@ -37,5 +37,7 @@ extern const struct intel_compute_kernels intel_compute_square_kernels[];
>>   
>>   bool run_intel_compute_kernel(int fd);
>>   bool xe_run_intel_compute_kernel_on_engine(int fd, struct drm_xe_engine_class_instance *eci);
>> -bool run_intel_compute_kernel_preempt(int fd, struct drm_xe_engine_class_instance *eci);
>> +bool run_intel_compute_kernel_preempt(int fd,
>> +				      struct drm_xe_engine_class_instance *eci,
>> +				      unsigned int count);
>>   #endif	/* INTEL_COMPUTE_H */
>> diff --git a/tests/intel/xe_compute_preempt.c b/tests/intel/xe_compute_preempt.c
>> index a4e0e1454..fd245b655 100644
>> --- a/tests/intel/xe_compute_preempt.c
>> +++ b/tests/intel/xe_compute_preempt.c
>> @@ -22,11 +22,18 @@
>>    * Description:
>>    *      Exercise compute walker mid thread preemption scenario
>>    * Functionality: compute openCL kernel
>> + *
>> + * SUBTEST: compute-preempt-many
>> + * GPU requirement: LNL
>> + * Description:
>> + *      Exercise parallel compute walker mid thread preemption scenario
>> + * Functionality: compute openCL kernel
>>    */
>>   static void
>> -test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe)
>> +test_compute_preempt(int fd, struct drm_xe_engine_class_instance *hwe,
>> +		     unsigned int count)
>>   {
>> -	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe), "GPU not supported\n");
>> +	igt_require_f(run_intel_compute_kernel_preempt(fd, hwe, count), "GPU not supported\n");
>>   }
>>   
>>   igt_main
>> @@ -44,7 +51,21 @@ igt_main
>>   				continue;
>>   
>>   			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
>> -				test_compute_preempt(xe, hwe);
>> +				test_compute_preempt(xe, hwe, 1);
>> +		}
>> +	}
>> +
>> +	igt_subtest_with_dynamic("compute-preempt-many") {
>> +		xe_for_each_engine(xe, hwe) {
>> +			/*
>> +			 * TODO: Render engine is getting timed out when count is high,
>> +			 * so for now only test with compute engine
>> +			 */
>> +			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +				continue;
>> +
>> +			igt_dynamic_f("engine-%s", xe_engine_class_string(hwe->engine_class))
>> +				test_compute_preempt(xe, hwe, 100);
>>   		}
>>   	}
>>   
>> -- 
>> 2.42.0
>>
