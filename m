Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF47C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 22 May 2024 17:13:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A92F10E135;
	Wed, 22 May 2024 17:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYoxMLzG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5736610E135
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2024 17:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716398009; x=1747934009;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qQGb+6Fv+2XI5t+LQTQacs90ES/v18AJuhR0LthvAd0=;
 b=MYoxMLzGUJUGE08mLDXOV0NX0sQv0vd/kbPSYKlGlaDlEjla7lofLbAq
 VR5b1lpsDgqdtnq8/3mxFU9rjUgWlrCu23/EajYXGd8asZRs3j3RrOIof
 qQf4RTqwOvxNlfNGzE3dRpT8PoOesg9wM/pthoC1iCCnZJCeh+EcbOU31
 2gEzRDhVR/vHo2YsXgC1rnds3xSyHsQsgPzW6h1cGuvDC/CcMfR8t/fHe
 iwSx4yQc7DCoWqOrwRiDJj4s0peUnS3/5VoKnpRbG7YhCbGGh8xgx6L9E
 OgCg6MiYlUv6MiyOqXqmVuxW1pnt3xrthE8puLYeV+ioiYzZILPz5hQXf g==;
X-CSE-ConnectionGUID: QEKCnZwbTR+9o0Y01Ga03g==
X-CSE-MsgGUID: /bmoArFRSqmCsxe0cPXTVQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12608407"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12608407"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:13:28 -0700
X-CSE-ConnectionGUID: HcPrFYlEQ5GX3pHWcbGK2A==
X-CSE-MsgGUID: wjtxacMaQPSx4uaNu8xt3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33361333"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.230])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:13:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 10/10] lib: switch i915_pciids_local.h to xe
 driver style PCI ID macros
In-Reply-To: <Zk4bch_ZlDFZWW6W@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1716373923.git.jani.nikula@intel.com>
 <dca416158698f28ba603e804467b2bee6c2e5d59.1716373923.git.jani.nikula@intel.com>
 <Zk4bch_ZlDFZWW6W@intel.com>
Date: Wed, 22 May 2024 20:13:24 +0300
Message-ID: <871q5trcqz.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 22 May 2024, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> On Wed, May 22, 2024 at 01:35:23PM +0300, Jani Nikula wrote:
>> Follow-up the kernel i915_pciids.h switching to xe driver style PCI ID
>> macros, and do the same for i915_pciids_local.h. This is a clear
>> improvement in the perf code, for example.
>
> I'm confused now on why do we need this i915_pciids_local.h o.O
> but anyway, the change is good and right:

We'd need to split the MTL macros up kernel side to match IGT perf.c
needs, even if we don't need that kernel side. But might as well do it
for Single Point of Truth.

Ditto for PVC, we should use XE_PVC_IDS from xe_pciids.h, but there's a
diff between those and what's in i915_pciids_local.h. Needs some
analysis why.

Anyway, all this can come as follow-up.

Thanks for the review,
Jani.


>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  lib/i915/perf.c         | 12 +++--------
>>  lib/i915_pciids_local.h | 44 ++++++++++++++++++++---------------------
>>  lib/intel_device_info.c |  2 +-
>>  3 files changed, 26 insertions(+), 32 deletions(-)
>> 
>> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
>> index 4b00ba5de9d4..ee950b3c03e4 100644
>> --- a/lib/i915/perf.c
>> +++ b/lib/i915/perf.c
>> @@ -204,13 +204,10 @@ is_acm_gt3(const struct intel_perf_devinfo *devinfo)
>>  static bool
>>  is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
>>  {
>> -#undef INTEL_VGA_DEVICE
>> -#define INTEL_VGA_DEVICE(_id, _info) _id
>>  	static const uint32_t devids[] = {
>> -		INTEL_MTL_M_IDS(NULL),
>> -		INTEL_MTL_P_GT2_IDS(NULL),
>> +		INTEL_MTL_M_IDS(ID),
>> +		INTEL_MTL_P_GT2_IDS(ID),
>>  	};
>> -#undef INTEL_VGA_DEVICE
>>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>  		if (devids[i] == devinfo->devid)
>>  			return true;
>> @@ -222,12 +219,9 @@ is_mtl_gt2(const struct intel_perf_devinfo *devinfo)
>>  static bool
>>  is_mtl_gt3(const struct intel_perf_devinfo *devinfo)
>>  {
>> -#undef INTEL_VGA_DEVICE
>> -#define INTEL_VGA_DEVICE(_id, _info) _id
>>  	static const uint32_t devids[] = {
>> -		INTEL_MTL_P_GT3_IDS(NULL),
>> +		INTEL_MTL_P_GT3_IDS(ID),
>>  	};
>> -#undef INTEL_VGA_DEVICE
>>  	for (uint32_t i = 0; i < ARRAY_SIZE(devids); i++) {
>>  		if (devids[i] == devinfo->devid)
>>  			return true;
>> diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
>> index 0043b0cd9b34..92879704aa8e 100644
>> --- a/lib/i915_pciids_local.h
>> +++ b/lib/i915_pciids_local.h
>> @@ -9,41 +9,41 @@
>>  
>>  /* MTL perf */
>>  #ifndef INTEL_MTL_M_IDS
>> -#define INTEL_MTL_M_IDS(info) \
>> -	INTEL_VGA_DEVICE(0x7D60, info), \
>> -	INTEL_VGA_DEVICE(0x7D67, info)
>> +#define INTEL_MTL_M_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D60, ## __VA_ARGS__), \
>> +	MACRO__(0x7D67, ## __VA_ARGS__)
>>  #endif
>>  
>>  #ifndef INTEL_MTL_P_GT2_IDS
>> -#define INTEL_MTL_P_GT2_IDS(info) \
>> -	INTEL_VGA_DEVICE(0x7D45, info)
>> +#define INTEL_MTL_P_GT2_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D45, ## __VA_ARGS__)
>>  #endif
>>  
>>  #ifndef INTEL_MTL_P_GT3_IDS
>> -#define INTEL_MTL_P_GT3_IDS(info) \
>> -	INTEL_VGA_DEVICE(0x7D55, info), \
>> -	INTEL_VGA_DEVICE(0x7DD5, info)
>> +#define INTEL_MTL_P_GT3_IDS(MACRO__, ...) \
>> +	MACRO__(0x7D55, ## __VA_ARGS__), \
>> +	MACRO__(0x7DD5, ## __VA_ARGS__)
>>  #endif
>>  
>>  #ifndef INTEL_MTL_P_IDS
>> -#define INTEL_MTL_P_IDS(info) \
>> -	INTEL_MTL_P_GT2_IDS(info), \
>> -	INTEL_MTL_P_GT3_IDS(info)
>> +#define INTEL_MTL_P_IDS(MACRO__, ...) \
>> +	INTEL_MTL_P_GT2_IDS(MACRO__, ## __VA_ARGS__), \
>> +	INTEL_MTL_P_GT3_IDS(MACRO__, ## __VA_ARGS__)
>>  #endif
>>  
>>  /* PVC */
>>  #ifndef INTEL_PVC_IDS
>> -#define INTEL_PVC_IDS(info) \
>> -	INTEL_VGA_DEVICE(0x0BD0, info), \
>> -	INTEL_VGA_DEVICE(0x0BD1, info), \
>> -	INTEL_VGA_DEVICE(0x0BD2, info), \
>> -	INTEL_VGA_DEVICE(0x0BD5, info), \
>> -	INTEL_VGA_DEVICE(0x0BD6, info), \
>> -	INTEL_VGA_DEVICE(0x0BD7, info), \
>> -	INTEL_VGA_DEVICE(0x0BD8, info), \
>> -	INTEL_VGA_DEVICE(0x0BD9, info), \
>> -	INTEL_VGA_DEVICE(0x0BDA, info), \
>> -	INTEL_VGA_DEVICE(0x0BDB, info)
>> +#define INTEL_PVC_IDS(MACRO__, ...) \
>> +	MACRO__(0x0BD0, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD1, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD2, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD5, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD6, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD7, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD8, ## __VA_ARGS__), \
>> +	MACRO__(0x0BD9, ## __VA_ARGS__), \
>> +	MACRO__(0x0BDA, ## __VA_ARGS__), \
>> +	MACRO__(0x0BDB, ## __VA_ARGS__)
>>  #endif
>>  
>>  #endif /* _I915_PCIIDS_LOCAL_H */
>> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
>> index 30aca2abd7be..e80ea54707de 100644
>> --- a/lib/intel_device_info.c
>> +++ b/lib/intel_device_info.c
>> @@ -617,7 +617,7 @@ static const struct pci_id_match intel_device_match[] = {
>>  
>>  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &intel_meteorlake_info),
>>  
>> -	INTEL_PVC_IDS(&intel_pontevecchio_info),
>> +	INTEL_PVC_IDS(INTEL_VGA_DEVICE, &intel_pontevecchio_info),
>>  
>>  	XE_LNL_IDS(INTEL_VGA_DEVICE, &intel_lunarlake_info),
>>  
>> -- 
>> 2.39.2
>> 

-- 
Jani Nikula, Intel
