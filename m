Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4C5D711BF
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 16:21:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C26210E0ED;
	Wed, 20 Nov 2024 16:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PsxJxrOc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBEFD10E0ED
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732119662; x=1763655662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=V43SaOxA28dVSVoVdBhqMK9D+jYhpQJyzqh71R3kkUs=;
 b=PsxJxrOcXnP+oJhJbWVmOXQS4xwJUKQx/QkJR/cdJGbVFt90eMxh0abG
 xn2TciPXNtglcIASOf24/ZbpgdkaCoFqtHMT8xGY313eNUmb+Ds3f7OBC
 dgMxG1TT9Fw2n4KwNLVQQJFqtgGKUHz1NBHBy0hiX3V9wj3o8kZQWNFho
 HBtM800r2CVsYoFcBDFS1qo2hWob34+ojoIhlBg4grzPAUJtVygBVhIEd
 QXnZZ7UCYKoV2eG8ugAo38N3Q9Z1GDkqJb8+npKaSWJKPGf3p9SOLiDDQ
 VHLZqM/wmt5r79NpR8G6RtcTz6RGJTKwMVzKQz6I4xpr+G/bIbj2YiP7Q Q==;
X-CSE-ConnectionGUID: xW2UkKvFT5abG5CMC2XmMA==
X-CSE-MsgGUID: tDoa7T/fRwK1rOe2XDjvtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="36102382"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="36102382"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 08:21:02 -0800
X-CSE-ConnectionGUID: Rd2oTGYETxm/AYmdknCypQ==
X-CSE-MsgGUID: nyag6RrfS0OrU0KrLnSbaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="94784808"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.97.199])
 ([10.245.97.199])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 08:21:00 -0800
Message-ID: <b69ab053-064c-47d9-8c2c-7ad2fd6ce60f@linux.intel.com>
Date: Wed, 20 Nov 2024 17:20:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/xe/xe_sriov_flr: Improve clear-ggtt
 subcheck initialization
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>, igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, michal.wajdeczko@intel.com,
 michal.winiarski@intel.com, narasimha.c.v@intel.com,
 piotr.piorkowski@intel.com, satyanarayana.k.v.p@intel.com,
 tomasz.lis@intel.com
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
 <20241119155538.605000-4-marcin.bernatowicz@linux.intel.com>
 <a0865a0a-40ad-478a-b930-f67e73676b82@intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <a0865a0a-40ad-478a-b930-f67e73676b82@intel.com>
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



On 11/20/2024 11:53 AM, Laguna, Lukasz wrote:
> On 11/19/2024 16:55, Marcin Bernatowicz wrote:
>> Mark the ggtt-clear subcheck as SKIP when prerequisites, such as scanning
>> GGTT provisioned offsets, are not met. Asserting in these cases falsely
>> implies that FLR is broken, while the test has not even started.
>>
>> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
>> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
>> Cc: C V Narasimha<narasimha.c.v@intel.com>
>> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
>> Cc: K V P Satyanarayana<satyanarayana.k.v.p@intel.com>
>> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
>> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
>> Cc: Michał Winiarski<michal.winiarski@intel.com>
>> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
>> Cc: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   tests/intel/xe_sriov_flr.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
>> index 1049cffec..502691765 100644
>> --- a/tests/intel/xe_sriov_flr.c
>> +++ b/tests/intel/xe_sriov_flr.c
>> @@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>>   		if (vf_id == 0)
>>   			continue;
>>   
>> -		igt_assert(vf_id >= 1 && vf_id <= num_vfs);
>> +		if (vf_id < 1 || vf_id > num_vfs) {
>> +			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",
> 
> nit: Unexpected VF ID (%u)...
> 
>> +					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
>> +			free(ranges);
>> +			return -1;
>> +		}
>>   
>>   		if (gdata->pte_offsets[vf_id].end) {
>>   			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
>> @@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>>   
>>   	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
>>   		if (!gdata->pte_offsets[vf_id].end) {
>> -			set_fail_reason(&gdata->base,
>> +			set_skip_reason(&gdata->base,
>>   					"Failed to find VF%u provisioned GGTT PTE offset range\n",
>>   					vf_id);
>>   			return -1;
>> @@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>>   
>>   		populate_ggtt_pte_offsets(gdata);
>>   	} else {
>> -		set_fail_reason(data, "xe_mmio is NULL\n");
>> +		set_skip_reason(data, "xe_mmio is NULL\n");
>>   	}
>>   }
>>   
> 
> Looks good overall,but I see that we still fail in case of other 
> prerequisites not met (LMEM, GGTT write/read, no access to MMIO, etc). 
> Maybe we should skip in these cases too?

Makes sense, I'll extend the skips to the init/prepare phase for all checks.

Marcin

> 
> Lukasz
> 
> 

