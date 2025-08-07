Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2058BC87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 08:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D503510E0A8;
	Thu,  7 Aug 2025 08:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="nA+vLt46";
	dkim-atps=neutral
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56E110E0A8
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 08:25:12 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1075143881;
 Thu,  7 Aug 2025 08:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754555111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jruro2DTgQ5eqt9g87ezRUXtXfb/Jw3BBcf4GuCVF5M=;
 b=nA+vLt46tUkyyQPa8ImaqEg7bD4/l1E74XTk1e/PE9zE5rVjN1QHdhwbsTSXZw2z5uECTV
 PK3N5/Yh5XQRU8oOmmpiro4ORugCCyiD5z4x9r7U+Y7JBG5Xsl7Bx8GE6OWGwd8IhIz0x1
 bbl32XJkHjE+dWVcPewZreHlOUClxVOlxjoqKkX4UsRf2LgglPk9vOMKKu+hrdJsrLTUJv
 ohRy6GFQzwY+vKusxrG79SwjO4GX+cFg9TlaEPcnhutqCkXx+EibANRUCV+VLhHTceJfu/
 CSFjHuhH+5SfOv7j/sTgtGeh1Icfa3KqZWFtjDeM+SgWmQaS2VZrTKSn1nY1kw==
Message-ID: <130599ca-539c-4a57-a599-27c4c9b6b313@bootlin.com>
Date: Thu, 7 Aug 2025 10:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Jim Shargo <jshargo@chromium.org>, Marius Vlad <marius.vlad@collabora.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <7d351560-2e44-47bb-a310-633a0f17469c@bootlin.com> <aJHMyZwbV4bV7zma@fedora>
 <20250805162944.vsk75aejhp5aeyjb@kamilkon-DESK.igk.intel.com>
 <75914ea6-0a33-4d3c-9ae7-7bd9096a7879@intel.com> <aJRaTBsiDcrzgA_R@fedora>
Content-Language: en-US
From: Louis Chauvet <louis.chauvet@bootlin.com>
In-Reply-To: <aJRaTBsiDcrzgA_R@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddtgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejgeejgedutdekhfffgfegudeutdetgfeuveegteeftddtfeevueffgfevgfevkeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemkedvtdgvmeekvghffeemleejgedvmeehsgeludenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemkedvtdgvmeekvghffeemleejgedvmeehsgeluddphhgvlhhopeglkffrggeimedvtddtudemkeeiudemgedugedtmegtkeeitdemkedvtdgvmeekvghffeemleejgedvmeehsgeludgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhmp
 dhrtghpthhtohepkhgrrhhthhhikhdrsgdrshesihhnthgvlhdrtghomhdprhgtphhtthhopehkrghmihhlrdhkohhnihgvtgiinhihsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopeiisghighhnihgvfidrkhgvmhhptgiihihnshhkihesihhnthgvlhdrtghomhdprhgtphhtthhopehjshhhrghrghhosegthhhrohhmihhumhdrohhrghdprhgtphhtthhopehmrghrihhushdrvhhlrggusegtohhllhgrsghorhgrrdgtohhm
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



On 8/7/25 9:48 AM, José Expósito wrote:
> Hi everyone,
> 
> On Thu, Aug 07, 2025 at 10:10:17AM +0530, Karthik B S wrote:
>>
>> On 8/5/2025 9:59 PM, Kamil Konieczny wrote:
>>> Hi José,
>>> On 2025-08-05 at 11:20:09 +0200, José Expósito wrote:
>>>> Hi Louis,
>>>>
>>>> On Wed, Jul 16, 2025 at 11:22:38AM +0200, Louis Chauvet wrote:
>>>>>
>>>>> Le 15/07/2025 à 12:24, José Expósito a écrit :
>>>>>> Create a library containing helpers for creating VKMS devices and
>>>>>> configuring them dynamically using configfs.
>>>>>> For the moment, add the minimal number of helpers to be able to start
>>>>>> testing VKMS's configfs support: Create device, destroy device and
>>>>>> destroy all devices.
>>>>>>
>>>>>> Also, include the simplest possible test using those helpers (checking
>>>>>> the device's default files) and the scaffolding required to generate
>>>>>> the documentation.
>>>>>>
>>>>>> Co-developed-by: Jim Shargo <jshargo@chromium.org>
>>>>>> Signed-off-by: Jim Shargo <jshargo@chromium.org>
>>>>>> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
>>>>>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>>>>>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>>>>>> ---
>>>>>>     docs/testplan/meson.build        |   7 +-
>>>>>>     lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
>>>>>>     lib/igt_vkms.h                   |  27 ++++
>>>>>>     lib/meson.build                  |   1 +
>>>>>>     meson.build                      |   8 ++
>>>>>>     tests/meson.build                |   2 +
>>>>>>     tests/vkms/meson.build           |  13 ++
>>>>>>     tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
>>>>>>     tests/vkms/vkms_test_config.json |  72 +++++++++++
>>>>>>     9 files changed, 467 insertions(+), 2 deletions(-)
>>>>>>     create mode 100644 lib/igt_vkms.c
>>>>>>     create mode 100644 lib/igt_vkms.h
>>>>>>     create mode 100644 tests/vkms/meson.build
>>>>>>     create mode 100644 tests/vkms/vkms_configfs.c
>>>>>>     create mode 100644 tests/vkms/vkms_test_config.json
>>>>>>
>>>>>> [...]
>>>>>> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
>>>>>> new file mode 100644
>>>>>> index 000000000..fa41f741e
>>>>>> --- /dev/null
>>>>>> +++ b/lib/igt_vkms.c
>>>>>> [...]
>>>>>> +static int detach_pipeline_items(const char *path, const struct stat *info,
>>>>>> +				 const int typeflag, struct FTW *pathinfo)
>>>>> As there will be a new "color pipeline" in DRM, can you rename this set of
>>>>> functions to avoid confusion? I don't have preference for the name, what do
>>>>> you think about "dc" for display controller?
>>> Could you give a link to lore.kernel.org for this 'color pipeline'?
>>>
>>>>> (ditto for the rest of the series)
>>>>>
>>>>> With this modification:
>>>>> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>> The "pipeline" here refers to the display pipeline as in the docs:
>>>> https://docs.kernel.org/gpu/drm-kms.html#overview
>>>>
>>>> Given that the VKMS driver is a display driver and that "enum vkms_pipeline_item"
>>>> contains those entites, I find easy to understand what we are talking about.
>>>>
>>>> What do you think about leaving the display pipeline as "pipeline" and, once we
>>>> add the color pipeline, use "color_pipeline"?
>>> These looks resonable. Karthik, could you comment on this?
>>
>> Yes, this looks good.
> 
> Thanks for your feedback. I sent v4 with all the requested changes,
> but at least for the moment, I didn't rename the pipeline:
> https://lore.kernel.org/igt-dev/20250807074550.6543-1-jose.exposito89@gmail.com/

I am ok to keep pipeline, don't worry!

I proposed this because I was reading about color pipeline just before 
reviewing your series and it was a bit surprising to read pipeline twice 
with different meaning.

I will finish to review the v4 next week.

Thanks a lot for your work!
Louis Chauvet

> Thanks to everyone for their reviews!
> Jose
> 
>> Thanks,
>> Karthik.B.S
>>>
>>>> I can rename all instances of "pipeline" to "display_pipeline" (with a lot of work,
>>>> 100 occurences in igt_vkms.c in 41 patches), but I find it too verbose for little
>>>> clarification.
>>> Well, you can use sed script for this but I am afraid that there
>>> are many other places in igt with 'pipeline' meaning
>>> 'display pipeline', so it would be a lot more work to do.
>>>
>>> Regards,
>>> Kamil
>>>
>>>> Jose
>>>>
>>>>>> [...]
>>>>> -- 
>>>>> Louis Chauvet, Bootlin
>>>>> Embedded Linux and Kernel engineering
>>>>> https://bootlin.com

