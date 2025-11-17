Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97799CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 08:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE96510E306;
	Mon, 17 Nov 2025 08:51:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JepJaOrB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079710E306
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 08:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763369520; x=1794905520;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WOIzpLLZTs5rx/7MLiyTJFAVKdULLcnj8gGIBZNu3fU=;
 b=JepJaOrBJOr6vnRNRbotcCMzLGB88olf/fTXeDDQTdWsPLTIEB6c6k6x
 XLVZGECdmZr50fZtsWf3HCMlgBOKC6OB4QpfcwM2KeLsSjZlKgQjnFeyt
 OC2LPW1Iw6BDw00TPBwLaca63Zt8yCSOH/m4sWLPqeBuQnraa8n+Cf5AH
 qYyy+gQ5yJ3rJGgoHemU5mwsMMeGq6RsPj8Q4qynsQBYLEnLgguEq6Ckb
 XwsLo9dXbkw4grAQ0T5/cbZh0BXBWPNT+ZsSZqhkjkidIrUGAAr1VlNvZ
 uHxNso6SHJ9A8YGWeFxQgZf9qux+ljEguIza6621fYwD1vqSOOSVeqjV0 Q==;
X-CSE-ConnectionGUID: DVsOG44HSmyeNBbiaiiQmg==
X-CSE-MsgGUID: Gb0l1ZbVRmmx9hhNlJJLdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="68983958"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="68983958"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:51:59 -0800
X-CSE-ConnectionGUID: hA0KhoLbQTCIeRQlq3YUYQ==
X-CSE-MsgGUID: LnSlhYP0SiCUFCo7Mkll1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="213796853"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.91])
 ([172.28.180.91])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 00:51:57 -0800
Message-ID: <0c16591a-85a1-4126-8399-0da06b849f43@linux.intel.com>
Date: Mon, 17 Nov 2025 09:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_sriov_scheduling: Prefer SR-IOV
 admin sysfs accessors
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
 <20251114190757.2295174-6-marcin.bernatowicz@linux.intel.com>
 <a0dd45e6-1f01-485a-859f-959fbecb7363@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <a0dd45e6-1f01-485a-859f-959fbecb7363@intel.com>
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


On 11/14/2025 8:57 PM, Michal Wajdeczko wrote:
>
> On 11/14/2025 8:07 PM, Marcin Bernatowicz wrote:
>> Use SR-IOV admin bulk setters for scheduling parameters when present,
>> falling back to debugfs attributes.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   tests/intel/xe_sriov_scheduling.c | 55 ++++++++++++++++++++-----------
>>   1 file changed, 36 insertions(+), 19 deletions(-)
>>
>> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
>> index 3a0c0d438..1e5e19334 100644
>> --- a/tests/intel/xe_sriov_scheduling.c
>> +++ b/tests/intel/xe_sriov_scheduling.c
>> @@ -9,6 +9,7 @@
>>   #include "xe_drm.h"
>>   #include "xe/xe_ioctl.h"
>>   #include "xe/xe_spin.h"
>> +#include "xe/xe_sriov_admin.h"
>>   #include "xe/xe_sriov_provisioning.h"
>>   
>>   /**
>> @@ -374,27 +375,43 @@ struct vf_sched_params {
>>   static int __set_vfs_scheduling_params(int pf_fd, int num_vfs,
>>   				       const struct vf_sched_params *p)
>>   {
>> -	unsigned int gt;
>> -	int vf, ret;
>> -
>> -	xe_for_each_gt(pf_fd, gt) {
>> -		for (vf = 0; vf <= num_vfs; ++vf) {
>> -			ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
>> -							     p->exec_quantum_ms);
>> -			if (igt_warn_on_f(ret,
>> -					  "Failed to set exec_quantum_ms=%u (VF%d GT%u): %d\n",
>> -					  p->exec_quantum_ms, vf, gt, ret))
>> -				return ret;
>> -
>> -			ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
>> -								p->preempt_timeout_us);
>> -			if (igt_warn_on_f(ret,
>> -					  "Failed to set preempt_timeout_us=%u (VF%d GT%u): %d\n",
>> -					  p->preempt_timeout_us, vf, gt, ret))
>> -				return ret;
>> +	int ret = 0;
>> +
>> +	if (xe_sriov_admin_is_present(pf_fd)) {
> is there any expectation / requirement to run latest IGT suite on
> kernel older than 6.19 ? otherwise this will be always true
If the attribute is missing, tests are expected to SKIP or provide a
fallback when possible. I can SKIP in test fixture with 
igt_require(xe_sriov_admin_is_present(pf_fd));
and remove the fallback.
>
>
>> +		ret = __xe_sriov_bulk_set_exec_quantum_ms(pf_fd, p->exec_quantum_ms);
>> +		if (igt_warn_on_f(ret,
>> +				  "Failed to bulk set exec quantum=%u: %d\n",
>> +				  p->exec_quantum_ms, ret))
>> +			return ret;
>> +
>> +		ret = __xe_sriov_bulk_set_preempt_timeout_us(pf_fd, p->preempt_timeout_us);
>> +		if (igt_warn_on_f(ret,
>> +				  "Failed to bulk set preempt timeout=%u: %d\n",
>> +				  p->preempt_timeout_us, ret))
>> +			return ret;
>> +	} else {
>> +		unsigned int gt;
>> +
>> +		xe_for_each_gt(pf_fd, gt) {
>> +			for (int vf = 0; vf <= num_vfs; ++vf) {
>> +				ret = __xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt,
>> +								     p->exec_quantum_ms);
>> +				if (igt_warn_on_f(ret,
>> +						  "Failed to set exec quantum=%u (VF%d GT%u): %d\n",
>> +						  p->exec_quantum_ms, vf, gt, ret))
>> +					return ret;
>> +
>> +				ret = __xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt,
>> +									p->preempt_timeout_us);
>> +				if (igt_warn_on_f(ret,
>> +						  "Failed to set preempt timeout=%u (VF%d GT%u): %d\n",
>> +						  p->preempt_timeout_us, vf, gt, ret))
>> +					return ret;
>> +			}
>>   		}
>>   	}
>> -	return 0;
>> +
>> +	return ret;
>>   }
>>   
>>   static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
