Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF9EC71136
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 21:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B863810E740;
	Wed, 11 Jun 2025 21:51:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UTr81uYD";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA0610E740
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 21:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M058a7MeftsxDvmh/pd0XQ7yjKNLGvL5kFZSNAbZ9d8=; b=UTr81uYD+ttR84R67Cn4GKt0CY
 H0VTwXukABy/d37aIUjcLJ5wWBL/GKY0bMRjYkajP/ib36JvTVqSnlf3cAdzJG0bUs+js54U8A883
 uTL906pA9hTm3bkerXahwMB6uyXJq007K+o8y7w4+QIWsVQ0OruKETaSQeDm5onPiCCI4KS+pZCBn
 mo1UUeExE6YZXXkPEJ/gcy0KOYYr7n8ao3Ky0KurBSodWVlJFVgrfxdj55W85V7L+AUuhnnglqRjs
 LGONs7mL5GrYkfo/y6sIOzZ3p1N+oVfIu5phQhW3o5JFNKzR4NdqEsIqimgr+GJWP7c+PE2+IOy3H
 jfz6WDEg==;
Received: from [189.6.13.79] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPTM2-002NaY-6C; Wed, 11 Jun 2025 23:51:30 +0200
Message-ID: <046d8f69-8eb3-497b-a2fe-798aa91773b6@igalia.com>
Date: Wed, 11 Jun 2025 18:51:22 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/kms_async_flip: skip subtest on AMD if
 invalid condition
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
References: <20250601191459.46759-1-mwen@igalia.com>
 <20250601191459.46759-4-mwen@igalia.com>
 <20250611101605.tql5ik4th75t762a@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <20250611101605.tql5ik4th75t762a@kamilkon-DESK.igk.intel.com>
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



On 11/06/2025 07:16, Kamil Konieczny wrote:
> Hi Melissa,
> On 2025-06-01 at 16:14:46 -0300, Melissa Wen wrote:
>> Async page flips can fail for any driver-specific reasons, i.e. when the
>> driver can't commit to async page flip request due to hw limitations,
>> the commit is rejected with -EINVAL since there is one or more
>> conditions that make the request invalid. These limitations vary between
>> vendors and hw versions. In case of AMD devices, async page flip cannot
>> be perfomed if fb memory type changes (VRAM vs GTT), but framebuffer
>> allocation type cannot be controlled by any userspace configuration.
>>
>> Allow EINVAL failures on AMD device and skip the test. Async flips can
>> be still validated by the performance comparison assert if no EINVAL.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Are you ok with merging this one patch first?
> This should also be tested again, as i915.Full were not run.
Yes, sounds good.

Thanks,

Melissa

>
> Regards,
> Kamil
>
>> ---
>>   tests/kms_async_flips.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 97128cfad..065ac9c49 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -410,7 +410,12 @@ static void test_async_flip(data_t *data)
>>   
>>   		ret = perform_flip(data, frame, flags);
>>   
>> -		if (frame == 1 && data->allow_fail)
>> +		/* AMD cannot perform async page flip if fb mem type changes,
>> +		 * and this condition cannot be controlled by any userspace
>> +		 * configuration. Therefore allow EINVAL failure and skip the
>> +		 * test for AMD devices.
>> +		 */
>> +		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
>>   			igt_skip_on(ret == -EINVAL);
>>   		else
>>   			igt_assert_eq(ret, 0);
>> -- 
>> 2.47.2
>>

