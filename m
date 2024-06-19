Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D0EAC27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 10:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD5510EC22;
	Wed, 19 Jun 2024 10:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJCN70yT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 890E810EC22
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718793708; x=1750329708;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=TFDwCVcc6hzTUcWYqItrapwqUCDDKR0HaA2XQ7lRuT8=;
 b=AJCN70yTtCq2+ehR5MOeIX4cg19p73iSqT+KR6c8xnxChS80s+BXMD6R
 DlBPimRkNNE9+3NWCRl5Ab7vUJsd1M2OwcveH5ogS+2vchWzajaAz8Q7t
 yu+NpK7CrAh5uQ607oDaggW1g8fdBcpEFp+EV0tdIj3gO1YALRfF3tM7L
 pA4efW+7/GQj5tMF+OI/fOstd83bChaz4FfxRpkoaoiqniU3XWKYV0kRf
 HOjeAiaEiSJRUoRLotMfY3sxQrOgTyH0UoCGH9ZcF+h7W9ZEuvA7buVQ9
 n4q+JQrY6udHbuSiREheBqSOoXqsO/tHzPffEf5QXMX5fqfFn1nYcsFuQ A==;
X-CSE-ConnectionGUID: HeRfON3tSKORZE8m61DVCQ==
X-CSE-MsgGUID: NJNljdJKQ8So0OAb6YuJ1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="38239232"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="38239232"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:41:48 -0700
X-CSE-ConnectionGUID: fo4EtwAoQt+Oh1tBFx2msw==
X-CSE-MsgGUID: ZXJBpHWLQPieg8ALeBaL9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="46251334"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 03:41:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [i-g-t] tests/intel-ci: Block unsupported KMS tests for i915
In-Reply-To: <515d6191-11cd-4b65-a142-ecfa7b5bb739@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
 <87frt9fdwh.fsf@intel.com>
 <515d6191-11cd-4b65-a142-ecfa7b5bb739@intel.com>
Date: Wed, 19 Jun 2024 13:41:43 +0300
Message-ID: <878qz1fc48.fsf@intel.com>
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

On Wed, 19 Jun 2024, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:
> On 19-06-2024 03:33 pm, Jani Nikula wrote:
>> On Wed, 19 Jun 2024, Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:
>>> Block KMS tests those are specific to (display_ver > 14)
>>> are not applicable for i915.
>> 
>> Feels a bit wrong to list features like this in a block list. IMO the
>> tests themselves should be aware of what's supported and what's not. I
>> imagine the rationale is performance? What's the impact?
>
> I believe there is no point in running this test for i915, as it will 
> always be skipped. The test already knows which platforms it supports 
> and which it doesn't.

The question is whether it's worth it to start maintaining the info in
two places, the individual tests based on dynamic info obtained from the
driver, and a manually updated static block list.

Are you also filtering xe testing for tests applicable to old platforms
only? Is the manual work worth the effort?

BR,
Jani.


>
> - Bhanu
>
>> 
>> BR,
>> Jani.
>> 
>>>
>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>> ---
>>>   tests/intel-ci/blacklist.txt | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
>>> index f6e9bb474..d01ef5e16 100644
>>> --- a/tests/intel-ci/blacklist.txt
>>> +++ b/tests/intel-ci/blacklist.txt
>>> @@ -140,3 +140,6 @@ igt@device_reset@reset-bound
>>>   
>>>   # not working for i915
>>>   igt@kms_bw@.*
>>> +
>>> +# Tests specific to (Display_ver > 14) are not applicable for i915
>>> +igt@kms_vrr@cmrr
>> 

-- 
Jani Nikula, Intel
