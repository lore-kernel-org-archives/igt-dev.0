Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14622CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 11:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3CB810E3A4;
	Mon, 17 Nov 2025 11:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYc819lQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B99D810E3A4
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763377216; x=1794913216;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=xDh2ASmul0IBsrgffzjabRUgGD/NFtCDvtInGMtZmrE=;
 b=PYc819lQhXqZtjE/+iyQ8ST4Hs9n765hawiq+gS9Ql6neKWzaGjzvdbI
 hLUcPSlwxNRxjwYewrKM1CL1cm6LUYftiBFvFQ0ANDRbNLLUjhpPT2khQ
 EdZzYgbedRxuFPIOhvNkm8Wuz7lWIOfWfTzyQ5IS2IMQjaXl91GkpX97t
 rLcZZqtGGQL+gKaBz7Y1E3bdSBNGutI2ciOyiy+fc9S4+v9pzn6WxFy0H
 FFc1VhqU/MOIg7M84L4NNO7azGfbuAdPC6MEHn6Di+4GcJw/+9czTnrYD
 lBp10iVlTwXV9GKJalMZaGGkorNRsavwSwlnm0ouYTWQvwomU+s/m99jk A==;
X-CSE-ConnectionGUID: XgbE0Rn+SO+sofdNb+G6Ng==
X-CSE-MsgGUID: Ci37/oGySRy0a1M4tIsbVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="65406572"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="65406572"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 03:00:16 -0800
X-CSE-ConnectionGUID: pEIKXViYRAiA8eOzANXkCQ==
X-CSE-MsgGUID: SMhcJo8pQ/KDQZtPS4P4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="227759860"
Received: from soc-5cg43972f8.clients.intel.com (HELO [172.28.180.91])
 ([172.28.180.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 03:00:14 -0800
Message-ID: <1a594c0a-d921-42bd-a4cd-21d7f99b1806@linux.intel.com>
Date: Mon, 17 Nov 2025 12:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] lib/xe/xe_sriov_provisioning: Add sched
 priority mask to string helper
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com
References: <20251114190757.2295174-1-marcin.bernatowicz@linux.intel.com>
 <20251114190757.2295174-3-marcin.bernatowicz@linux.intel.com>
 <7ae62677-eb16-4e8f-b55a-8c1356697a3d@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <7ae62677-eb16-4e8f-b55a-8c1356697a3d@intel.com>
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


On 11/14/2025 9:15 PM, Michal Wajdeczko wrote:
>
> On 11/14/2025 8:07 PM, Marcin Bernatowicz wrote:
>> Introduce xe_sriov_sched_priority_mask_to_string() to format a
>> scheduling priority bitmask as a space-separated list of priority names.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   lib/xe/xe_sriov_provisioning.c | 54 ++++++++++++++++++++++++++++++++++
>>   lib/xe/xe_sriov_provisioning.h | 11 +++++++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/lib/xe/xe_sriov_provisioning.c b/lib/xe/xe_sriov_provisioning.c
>> index 532335abe..da0df4d31 100644
>> --- a/lib/xe/xe_sriov_provisioning.c
>> +++ b/lib/xe/xe_sriov_provisioning.c
>> @@ -693,6 +693,60 @@ int xe_sriov_sched_priority_from_string(const char *s,
>>   	return -EINVAL;
>>   }
>>   
>> +_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_LOW) == XE_SRIOV_SCHED_PRIORITY_MASK_LOW,
>> +	       "LOW mask bit must match enum order");
>> +_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_NORMAL) == XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL,
>> +	       "NORMAL mask bit must match enum order");
>> +_Static_assert(BIT(XE_SRIOV_SCHED_PRIORITY_HIGH) == XE_SRIOV_SCHED_PRIORITY_MASK_HIGH,
>> +	       "HIGH mask bit must match enum order");
> see below
>
>> +
>> +/**
>> + * xe_sriov_sched_priority_mask_to_string - Format priority mask as text
>> + * @mask: Priority bitmask.
>> + * @sel: Optional selected priority (NULL for none).
>> + * @buf: Output buffer.
>> + * @buf_sz: Size of @buf.
>> + *
>> + * Converts @mask to a space-separated string of priority names. If @sel is
>> + * non-NULL and present in @mask, that priority is wrapped in brackets, e.g.
>> + * "low [normal] high". Writes "none" if the mask is empty.
>> + *
>> + * Returns: @buf.
>> + */
>> +const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask,
>> +						   const enum xe_sriov_sched_priority *sel,
> this shouldn't be "SR-IOV priority" only function, as such pattern is planned
> to be used also for other attributes
>
> you may just pass array of strings and index to the one you want to highlight

Ok, I'll add a generic helper to igt_sysfs:

     const char *igt_sysfs_format_mask(char *buf, size_t buf_sz,
                                       const char * const *names,
                                       unsigned int mask,
                                       int selected_idx);

and keep xe_sriov_sched_priority_mask_to_string() as a thin wrapper
passing the SR-IOV priority names and the selected enum.

>> +						   char *buf, size_t buf_sz)
>> +{
>> +	size_t n = buf_sz;
>> +	bool first = true;
>> +	char *p = buf;
>> +
>> +	igt_assert(buf && buf_sz);
>> +
>> +	for (enum xe_sriov_sched_priority prio = XE_SRIOV_SCHED_PRIORITY_LOW;
>> +	     prio <= XE_SRIOV_SCHED_PRIORITY_HIGH; prio++) {
>> +		const char *name = xe_sriov_sched_priority_to_string(prio);
>> +		unsigned int bit = BIT(prio);
>> +
>> +		if (mask & bit) {
>> +			bool highlight = sel && (*sel == prio);
>> +
>> +			p += snprintf(p, n, "%s%s%s%s",
>> +				      first ? "" : " ",
>> +				      highlight ? "[" : "",
>> +				      name ?: "?",
>> +				      highlight ? "]" : "");
>> +			n = buf_sz - (p - buf);
>> +			first = false;
>> +		}
>> +	}
>> +
>> +	if (first)
>> +		snprintf(buf, buf_sz, "none");
> if there is nothing then why not just return an empty string ?
I'll drop the "none" literal and return an empty string.
>> +
>> +	return buf;
>> +}
>> +
>>   /**
>>    * __xe_sriov_get_sched_priority - Get the scheduling priority for a given VF
>>    * @pf: PF device file descriptor
>> diff --git a/lib/xe/xe_sriov_provisioning.h b/lib/xe/xe_sriov_provisioning.h
>> index 65f0597fe..9305eceec 100644
>> --- a/lib/xe/xe_sriov_provisioning.h
>> +++ b/lib/xe/xe_sriov_provisioning.h
>> @@ -75,6 +75,14 @@ enum xe_sriov_sched_priority {
>>   	XE_SRIOV_SCHED_PRIORITY_HIGH
>>   };
>>   
>> +#define XE_SRIOV_SCHED_PRIORITY_MASK_LOW    (1u << XE_SRIOV_SCHED_PRIORITY_LOW)
>> +#define XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL (1u << XE_SRIOV_SCHED_PRIORITY_NORMAL)
>> +#define XE_SRIOV_SCHED_PRIORITY_MASK_HIGH   (1u << XE_SRIOV_SCHED_PRIORITY_HIGH)
> can't you use BIT() here?
>
> then above _Static_assert() could be dropped
Ok
>> +#define XE_SRIOV_SCHED_PRIORITY_MASK_ALL \
>> +	(XE_SRIOV_SCHED_PRIORITY_MASK_LOW | \
>> +	 XE_SRIOV_SCHED_PRIORITY_MASK_NORMAL | \
>> +	 XE_SRIOV_SCHED_PRIORITY_MASK_HIGH)
>> +
>>   /**
>>    * struct xe_sriov_provisioned_range - Provisioned range for a Virtual Function (VF)
>>    * @vf_id: The ID of the VF
>> @@ -143,6 +151,9 @@ int xe_sriov_sched_priority_from_string(const char *s, enum xe_sriov_sched_prior
>>   int __xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>>   				  unsigned int gt_num,
>>   				  enum xe_sriov_sched_priority *value);
>> +const char *xe_sriov_sched_priority_mask_to_string(unsigned int mask,
>> +						   const enum xe_sriov_sched_priority *sel,
>> +						   char *buf, size_t buf_sz);
>>   enum xe_sriov_sched_priority xe_sriov_get_sched_priority(int pf, unsigned int vf_num,
>>   							 unsigned int gt_num);
>>   int __xe_sriov_set_sched_priority(int pf, unsigned int vf_num, unsigned int gt_num,
