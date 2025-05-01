Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F55C369DC
	for <igt-dev@archiver.kernel.org>; Thu,  1 May 2025 17:59:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5115E10E377;
	Thu,  1 May 2025 17:59:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="hatNwrbZ";
	dkim-atps=neutral
X-Greylist: delayed 2716 seconds by postgrey-1.36 at gabe;
 Thu, 01 May 2025 17:59:11 UTC
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB60D10E0ED
 for <igt-dev@lists.freedesktop.org>; Thu,  1 May 2025 17:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QzNsDZa5hn8KdWcMc5Dp0zk9nQsS9RWic9OnaGjIyqI=; b=hatNwrbZRVCoEQ055TjmFwIplN
 u8zsIA5/SfM0rxMUBr2ZXstBuRpAXCpB4DkanIQ0jPjJB1OYrlsPs0qItguuvr515u/S0WMMq6U+O
 FhTmCZeN49a5w7xp0WntAShawEmuRR9cRnRtDSU4RGn31AZatpsqW4Z8s0YY/aqZgPuj+ZKjMpCnK
 kYPn6EFVqOyukyPTE5pvf/vpWreiWyzdRr5hEvpmA5sqi1c4p3GAIWpszNpYKZ85Y+8Jejvi2CKF0
 JHOtsw5ZiE4n5RaO7pCHYjAK2EKzgF4cs7z0iwtcfN1zXJspi5bp1zJvH1ny+Im3QHW423WT6cbSM
 SyRZEFpg==;
Received: from [189.6.35.67] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uAXSO-001cQA-Tk; Thu, 01 May 2025 19:13:49 +0200
Message-ID: <4e78c6e4-e4d5-454f-8e21-986b0f72a220@igalia.com>
Date: Thu, 1 May 2025 14:13:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid
 driver-specific condition
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>
Cc: Development mailing list for IGT GPU Tools
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Andre Almeida <andrealmeid@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Simon Ser <contact@emersion.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 Xaver Hugl <xaver.hugl@gmail.com>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
References: <20250415200529.31722-1-mwen@igalia.com>
 <7177d94a-a2ca-4cb6-bbd8-894f489ac676@intel.com>
 <6c4ldbye7jjui25kofiv6itma6icf6xhouv7btnjuocmmbpsqb@kkvhwivs7nho>
 <SJ1PR11MB6129D560A5106418F6D977A1B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <SJ1PR11MB6129D560A5106418F6D977A1B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
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



On 21/04/2025 13:59, Borah, Chaitanya Kumar wrote:
> Hi Melissa,
>
>> -----Original Message-----
>> From: Melissa Wen <mwen@igalia.com>
>> Sent: Monday, April 21, 2025 8:35 PM
>> To: B S, Karthik <karthik.b.s@intel.com>
>> Cc: Development mailing list for IGT GPU Tools <igt-
>> dev@lists.freedesktop.org>; Petri Latvala <adrinael@adrinael.net>; Arkadiusz
>> Hiler <arek@hiler.eu>; Kamil Konieczny <kamil.konieczny@linux.intel.com>;
>> Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>; Bhanuprakash
>> Modem <bhanuprakash.modem@gmail.com>; Dixit, Ashutosh
>> <ashutosh.dixit@intel.com>; Thadeu Lima de Souza Cascardo
>> <cascardo@igalia.com>; Rodrigo Siqueira <siqueira@igalia.com>; Andre
>> Almeida <andrealmeid@igalia.com>; Alex Hung <alex.hung@amd.com>; Leo
>> Li <sunpeng.li@amd.com>; Simon Ser <contact@emersion.fr>; Dmitry
>> Baryshkov <dmitry.baryshkov@linaro.org>; Ville Syrjala
>> <ville.syrjala@linux.intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Xaver Hugl <xaver.hugl@gmail.com>;
>> kernel-dev@igalia.com
>> Subject: Re: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid driver-
>> specific condition
>>
>> On 04/17, Karthik B S wrote:
>>> Hi Melissa,
>>>
>>> Although I agree that async flips can be rejected for multiple
>>> driver-specific reasons, my concern here is that there could
>>> potentially be a genuine failure(as EINVAL is a very generic failure
>>> check) as well which might get caught in this category and be treated
>>> as expected skip, whereas it ideally was something which should've been
>> allowed by the driver.
>>> IMHO, if we need to have this, we need to have some more checks
>>> together with EINVAL (though I'm not aware of what this could be
>>> currently) to treat it as a valid skip.
>> Hi Karthik,
>>
>> Thanks for raising these points. I understand your concerns and I agree that
>> we should not ignore genuine failures, but I don't see a way to currently get
>> from the kernel a more accurate reason for async flip failures.
>>
>> Also, I don't think the current test implementation prevents misleading skips
>> even for i915 drivers. While the test attempts to meet all valid conditions for
>> i915 drivers, it allows the test to ignore the first flip failure, which can be
>> questionable when a driver advertises that it can do async flip, but then the
>> first flip fails (EINVAL) and we cannot guarantee (control) that the cause is one
>> or another unsupported modifier or what else.
>>
> We will be removing this quirk soon. With the addition of IN_FORMAT_ASYNC [1]
> we won't need to "allow_fail" for the first frame. Please see [2].
So, I think that case is in line with what I'm trying to discuss.
For example, why did you add the quirk and skip the test instead of 
letting the test fail when [1] wasn't available?

>
> The idea behind falling back to a sync flip for an unsupported modifier was that, in view
> of user-space, it is still performing just a flip with a new FB (albeit with a new modifier)
> without changing any other parameters. It is a valid expectation for an async flip.
>
> With [1],  user space can check which modifiers are supported for ASYNC and flip appropriately.
>
> However, there needs to be a larger discussion regarding what should be the "uapi contract"
> for async flips. Some of it going on here [3]
>
>
>> Unfortunately, cataloging all failure conditions and create a valid and generic
>> enough test configuration for all drivers in the subsystem doesn't seem a
>> feasible task.
>>
>> So, if the current setup are suitable for validating i915 drivers, but are not
>> accurate for other drivers, an alternative may be limiting this patch chane to
>> AMD or any non-Intel device. WDYT?
>>
> Won't all drivers be interested in knowing when async failed (particularly because there can be
> so many reasons for it)? At least, it has helped us debug some issues.

My concern here is that we cannot guarantee that the EINVAL is actually 
a driver bug or a hw restriction.
So, why are we asserting something that isn't well-defined?
And every time we figure out that EINVAL is a hw restriction and not a 
bug, we will add another quirk, similar to the one that intel added for 
unsupported modifiers... and we can end up with a test with multiple 
quirks for multiple hw vendors and versions.

Melissa
>
> Downgrade to sync is anyway covered by the flip per frame test criteria.
>
> Regards
>
> Chaitanya
>
> [1] https://patchwork.freedesktop.org/series/140935/
> [2] https://patchwork.freedesktop.org/series/146853/
> [3] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834
>
>> Anyway, I can't think of anything better right now, but I'm open to other
>> suggestions that make the test cases valid for more vendors and their
>> hardware versions.
>>
>> BR,
>>
>> Melissa
>>
>>
>>> Regards,
>>> Karthik.B.S
>>> On 4/16/2025 1:17 AM, Melissa Wen wrote:
>>>> Async page flips can fail for any driver-specific reasons, i.e. when
>>>> the driver can't commit to async page flip request for hw
>>>> limitations, the commit is rejected with -EINVAL since there is one
>>>> or more conditions that make the request invalid. These limitations
>>>> varies between vendors and hw versions. Skip a subtest if any
>>>> invalid driver-specific condition happens. This behavior is in line
>>>> with userspace expectations and fits better the plurality of drivers in the
>> DRM subsystem.
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>>
>>>> ---
>>>>
>>>> Hi,
>>>>
>>>> Recent changes to async page flip conditions and limitations in the
>>>> DRM subsystem shed light on unexpected restrictions of async page
>>>> flip tests. The current approach doesn't make the test generic
>>>> enough to correctly deal with the diversity of reasons for a async
>>>> page flip being rejected by drivers of any HW vendor.
>>>>
>>>> As an example, AMD display driver can't perform async flip when the
>>>> memory type changes [1][2][3]. After further investigation performed
>>>> by my colleague Thadeu Cascardo, he elucidated that this situation
>>>> can happen whenever there is not enough space for FBs in VRAM, so
>>>> they are allocated in GTT. Moreover, the space available in VRAM
>>>> varies between hw families and other system needs. Therefore, the
>>>> driver rejects the async flip due to memory type change, instead of
>>>> silently downgrade the page flip from async to sync - which seems correct.
>>>>
>>>> The userspace expects the rejection (-EINVAL), but not the downgrade.
>>>> So, I understand the test_async_flip should just validate if async
>>>> page flips aren't downgrade in acceptable conditions and skip for
>>>> any invalid driver-specific condition.
>>>>
>>>> [1]
>>>> https://lore.kernel.org/amd-gfx/20230621202459.979661-2-
>> andrealmeid@
>>>> igalia.com/ [2]
>>>> https://lore.kernel.org/amd-gfx/20230804182054.142988-1-
>> hamza.mahfoo
>>>> z@amd.com/ [3]
>>>> https://lore.kernel.org/amd-gfx/20250107152855.2953302-17-chiahsuan.
>>>> chung@amd.com/
>>>>
>>>> Let me know your thoughts!
>>>>
>>>> Melissa
>>>>
>>>> ---
>>>>    tests/kms_async_flips.c | 8 +++++---
>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>>>> 031417ed8..0de299c2b 100644
>>>> --- a/tests/kms_async_flips.c
>>>> +++ b/tests/kms_async_flips.c
>>>> @@ -397,8 +397,10 @@ static void test_async_flip(data_t *data)
>>>>    		ret = perform_flip(data, frame, flags);
>>>> -		if (frame == 1 && data->allow_fail)
>>>> -			igt_skip_on(ret == -EINVAL);
>>>> +		if (data->allow_fail)
>>>> +			igt_skip_on_f(ret == -EINVAL,
>>>> +				      "Skipping, async flip not supported at
>> frame %d " \
>>>> +				      "due to invalid driver-specific
>> conditions.\n", frame);
>>>>    		else
>>>>    			igt_assert_eq(ret, 0);
>>>> @@ -768,7 +770,7 @@ static void run_test(data_t *data, void
>> (*test)(data_t *))
>>>>    			continue;
>>>>    		test_init(data);
>>>> -		data->allow_fail = false;
>>>> +		data->allow_fail = true;
>>>>    		data->modifier = default_modifier(data);
>>>>    		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data-
>>> pipe), data->output->name) {
>>>>    			/*

