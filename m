Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610F7C54E58
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 12:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38AA10F40C;
	Tue, 12 Mar 2024 12:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T/eH+miV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABE110F40C
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710246257; x=1741782257;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e2s7vPxvbcx208it/h7dz3MJMu7x2w65zkWkk67EO5k=;
 b=T/eH+miVpp0P8wWVZNGAezf1Pg8rrgRJR9wz1Oi8V2hwdXTlq1FhDgEG
 owqOo93EzPm5VO2/xuTd8bSED3JO23Oqu2t0RTcpcCvPl2LYrBeTKG9HP
 5aBSaXdbjW6pINSKeySG168Z/suSjCWeDPn7SSTFFda5vJdwrtbglTbpK
 bgS5LORFr1AboGGYlEbB1/m4N3g/RbpuhOGsiY4OVpF70X2Hmyl2c2hqM
 9vtD6j2kH/rJrt9sJyOSHHDDDzQf2Q663vYDvsvauHKXa7ZuyXyHZ0ZQN
 jc5NwpjaViq+HHdh1FoVTQvgQ8exNj+o7GmMpHy/kdg7dpk2WBDLqcwqf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5076288"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5076288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="48964569"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.35.214])
 ([10.246.35.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 05:24:15 -0700
Message-ID: <0f9194b0-aafa-41b3-ab6a-48bb1832c22b@linux.intel.com>
Date: Tue, 12 Mar 2024 13:24:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/device_reset: Skip if no drm devices are
 preset
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Cc: kamil.konieczny@linux.intel.com
References: <20240312100757.14685-1-nirmoy.das@intel.com>
 <85522185.BzKH3j3Lxt@jkrzyszt-mobl2.ger.corp.intel.com>
 <87d94f4c-a484-422a-b443-ade32ca50e8d@intel.com>
 <1931795.gKo4GoxMFQ@jkrzyszt-mobl2.ger.corp.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <1931795.gKo4GoxMFQ@jkrzyszt-mobl2.ger.corp.intel.com>
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


On 3/12/2024 12:14 PM, Janusz Krzysztofik wrote:
> On Tuesday, 12 March 2024 11:54:32 CET Nirmoy Das wrote:
>> On 3/12/2024 11:43 AM, Janusz Krzysztofik wrote:
>>> Hi Nirmoy,
>>>
>>> On Tuesday, 12 March 2024 11:07:57 CET Nirmoy Das wrote:
>>>> Skip the test if no drm devices are preset.
>>> Did you mean present? (also in the subject line)
>> Right, another typo
>>>> v2: fix a typo.
>>>>
>>>> Closes:https://gitlab.freedesktop.org/drm/intel/-/issues/10087
>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>>> ---
>>>>    tests/device_reset.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/device_reset.c b/tests/device_reset.c
>>>> index 817cbc285..73531d696 100644
>>>> --- a/tests/device_reset.c
>>>> +++ b/tests/device_reset.c
>>>> @@ -198,7 +198,7 @@ static void init_device_fds(struct device_fds *dev)
>>>>    	 * a device file descriptor open for exit handler use.
>>>>    	 */
>>>>    	dev->fds.dev = __drm_open_driver(DRIVER_ANY);
>>>> -	igt_assert_fd(dev->fds.dev);
>>>> +	igt_require(dev->fds.dev != -1);
>>> What if __drm_open_driver() returns (unlikely) a negative value other than
> -1?
>> __drm_open_driverdoc says: "An open DRM fd or -1 on error" so that won't
> happen.
>
> That won't happen as long as there are no bugs in __drm_open_driver().
>
> If you don't want to skip on (fd < -1) then let's fail, but we should never
> succeed in that unlikely case, I believe.

No, we should take documented return value as a contract and shouldn't 
over worry about the function

breaking it.


Regards,

Nirmoy


>
> Thanks,
> Janusz
>
>>>    
>>> In IGT we used to verify validity of a file descriptor by checking if its
>>> value is not negative, i.e., >= 0 (see e.g. lib/igt_core:igt_assert_fd(),
>>> lib/drmtest.c:drm_open_driver()).  Please follow the same convention.
>> I can do s/igt_assert_fd/igt_require_fd
>>
>> Thanks,
>>
>> Nirmoy
>>
>>> Thanks,
>>> Janusz
>>>
>>>>    	if (is_i915_device(dev->fds.dev))
>>>>    		igt_require_gem(dev->fds.dev);
>>>>    
>>>>
>>>
>>>
>
>
>
