Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1006AC5DF74
	for <igt-dev@archiver.kernel.org>; Tue, 18 Aug 2026 13:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B671A10EB88;
	Tue, 18 Aug 2026 13:55:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="lLE09TT+";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F72710EB88
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Aug 2026 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=nDZ5YPZOgNHUhC7d0StdomFTkkJtIRrarlWAGbeQulM=; b=lLE09TT+GAvU4u/yytirx40ZA8
 k1m3lRm0kg3oLkdsqiIGX6M4O2k/VEWC8pzARQhI05qjof0lSFbuwMft0NxnPFSl7G6QDYf2/1tHL
 y67KaxQwtzySPZdKrdF2lO0CaHpLLO/jm2lgcYJ3wkbAT/frM8sg8fcnY/AoNxSWA8Rx9W77SxDG8
 XHd9Ce/oMGBATpbKiUzycCycov8CPNBeP8xGhS06hBlRfid89dk/wYaoxLvPEtD8iGSlgPwyzTkzu
 CULZ6Gecub/14bgTdbfk/XKRRvLPjcG8dqnaBTC7xEIlGpiVSXPXH+lKAS9a1RdJPztwhfzR6S0jj
 orKfzAuA==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=[192.168.1.203]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wwKGx-005dpw-7i; Tue, 18 Aug 2026 15:54:35 +0200
Message-ID: <4a5e0dea-1a44-4e5a-97c5-530e61a92ee3@igalia.com>
Date: Tue, 18 Aug 2026 15:54:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 6/6] tests/kms_color_pipeline: skip if not an
 intel device
To: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-7-mwen@igalia.com>
 <62e1b4a3-ba46-4117-a3e3-05f9866aa614@amd.com>
 <83fb4a66-cf7a-4ebb-be39-d3f51da4baa6@igalia.com>
 <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <9e390216-298b-45c5-9ca7-f8b65ae957da@amd.com>
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



On 17/08/2026 17:39, Harry Wentland wrote:
>
> On 2026-08-17 11:19, Melissa Wen wrote:
>>
>> On 14/08/2026 05:55, Alex Hung wrote:
>>>
>>> On 8/11/26 08:23, Melissa Wen wrote:
>>>>   From documentation, the test requires i915 or xe driver, so make sure it
>>>> only runs with intel devices. In addition, it's a CRC-based test, making
>>> Should this test be moved to tests/intel/?
>> I kept it as a KMS test because kms_colorop relies on writeback support, but writeback isn't present in many drivers AFAIK.
>> So these CRC tests can be used by other drivers if they don't support writeback but support colorop.
>>
> In that case the test shouldn't have an igt_require(is_intel_device...). It should
> use a generic check to determine whether it runs or not.

What would be this generic check? Something like "CRC support && 
!writeback"?

I took this `is_intel_device` path because on one hand I think the test 
could be an
alternative to other drivers that doesn't support writeback, on the 
other hand I see
that the current design is not generic enough and I can't ensure it runs 
well in
other drivers - for example, rn it doesn't meet AMD's requirements.

My reasoning was: "the test with writeback support is preferable 
(kms_colorop); if your
driver doesn't support writeback, work on the kms_color_pipeline test to 
meet the
requirements of your driver".

I can check how it goes with VKMS and what's needed to make it run on 
AMD (probably
the active primary plane is missing here too). I just don't think those 
drivers need
kms_color_pipeline since they support writeback and color tests work 
better by
checking writeback output instead of CRC.

Melissa

>
> Harry
>
>> Melissa
>>
>>>> kms_colorop with writeback more aligned with color testing and
>>>> validation. Other drivers should work on adapting this test to their
>>>> needs if they are looking for CRC validation.
>>>>
>>>> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>> ---
>>>>    tests/kms_color_pipeline.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>>> index 78860a845..3978745a5 100644
>>>> --- a/tests/kms_color_pipeline.c
>>>> +++ b/tests/kms_color_pipeline.c
>>>> @@ -372,6 +372,7 @@ int igt_main()
>>>>            igt_display_require(&data.display, data.drm_fd);
>>>>            data.display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>>            igt_require(data.display.is_atomic);
>>>> +        igt_require(is_intel_device(data.drm_fd));
>>>>        }
>>>>          igt_subtest_group()

