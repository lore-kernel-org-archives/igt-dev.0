Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00494CA0EFB
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 09:44:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64AD10E008;
	Fri, 30 Aug 2024 09:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPV7Y4iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED9710E008
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 09:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725011057; x=1756547057;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=dn8MtS9HlMgY89O4B8wRMCizjMhsCaUQWo12ZTbmZ7Y=;
 b=UPV7Y4iwnNGgwsvKh6zNEfJf6vvXih8IoiyHAoKCNM2HDvKhFs2ATAET
 vVDR5jXXgVR0HD3yGtpcmq1j0N1yt05eFGM2wDgruTgSA/ocqofu9C+em
 2sw3q2e7mHbTSs9jFtetrHP1yy2jY3OMdCaIooMH0y4jiwC3LVU4eaPum
 V8yqmF+MDf+dsEZqbKYeOjMn4EquCUD1qNFPe4OjX9zj+ViIw3MHZp1Jq
 D9XNLL4ZeEZ0t1UG4NGjP27rK1jT5EXV94CjIQD9FrFW8a3y23tgGFNBw
 DcXGRtvnbWVcUHpW/nzhLEtdZ3O7EQtHz5qYC5bCYo7EXmfxaA3jYqf96 Q==;
X-CSE-ConnectionGUID: jOj6AI3xQxuefEvl+xDqVg==
X-CSE-MsgGUID: +OCrIgzGS7+SUyOO8QR5SQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23800160"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="23800160"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:44:17 -0700
X-CSE-ConnectionGUID: BnwSnZf6Sfq/butXKmlhsg==
X-CSE-MsgGUID: PsQrOuTAS8+8alc56JX9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="101363509"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.103])
 ([10.245.246.103])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 02:44:14 -0700
Message-ID: <9fa037eb-379a-4272-8621-12555e90aa6d@intel.com>
Date: Fri, 30 Aug 2024 11:44:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 06/17] lib/intel_batchbuffer: Add helper to get
 pointer at specified offset
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-7-christoph.manszewski@intel.com>
 <20240830093630.jax6pxsqzlnmhzqh@zkempczy-mobl2>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240830093630.jax6pxsqzlnmhzqh@zkempczy-mobl2>
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

Hi Zbigniew,

On 30.08.2024 11:36, Zbigniew Kempczyński wrote:
> On Thu, Aug 29, 2024 at 04:45:36PM +0200, Christoph Manszewski wrote:
>> From: Andrzej Hajda <andrzej.hajda@intel.com>
>>
>> The helper will be used to access data placed in batchbuffer.
>>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
>> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> ---
>>   lib/intel_batchbuffer.h | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
>> index cb32206e5..b1670d23e 100644
>> --- a/lib/intel_batchbuffer.h
>> +++ b/lib/intel_batchbuffer.h
>> @@ -353,6 +353,13 @@ static inline uint32_t intel_bb_offset(struct intel_bb *ibb)
>>   	return (uint32_t) ((uint8_t *) ibb->ptr - (uint8_t *) ibb->batch);
>>   }
>>   
>> +static inline void *intel_bb_ptr_get(struct intel_bb *ibb, uint32_t offset)
>> +{
>> +	igt_assert(offset <= ibb->size);
> 
> I think it should be < only, == means we're outside the buffer.

Now that you say it - it makes sense. To be honest I just took a similar 
approach to intel_bb_ptr_set. But I will change it to '<' for 
intel_bb_ptr_get then.

Thanks,
Christoph
> 
> --
> Zbigniew
> 
>> +
>> +	return ((uint8_t *) ibb->batch + offset);
>> +}
>> +
>>   static inline void intel_bb_ptr_set(struct intel_bb *ibb, uint32_t offset)
>>   {
>>   	ibb->ptr = (void *) ((uint8_t *) ibb->batch + offset);
>> -- 
>> 2.34.1
>>
