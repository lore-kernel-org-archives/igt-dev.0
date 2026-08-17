Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA153C5DF66
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930EF10E853;
	Mon, 17 Aug 2026 15:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="XP4ooN6W";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747B510E851
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=AxDADKVHiBGK07o9jZxXnm6SeCfh9vxewMUGjf2GkGc=; b=XP4ooN6W2h6+wKSNN4QyIoA1tn
 9bbT2qdLzr2DY42Pd5ZrTR0MidbSQJnmykuLmVVCzab2QRucm7eHzNk2Tt3N+14Vwwxn+bqCBv35s
 64BotLnrQFH8cC7Kmvq1Zx7zsdOwJkrmt/EM4wp7dcpr82MNOFCqSkfXkmNOowHcGBLUw8Cp9fgkd
 5vU4neQejkXluOJWUA3+7RafVdGdI53gqY7zrWGVbCfIa/QjN0QSePaGwwztNW5v3AOcDupJTXsMy
 5FfNcITfxRexlv/m/KZKZu+E9gu4plVrmoIk+kcHyEgLzJgf2i0TXVk+cgKy7qM2nXvhyiCPHVJSs
 BBW1yD1g==;
Received: from 154.red-79-147-121.dynamicip.rima-tde.net ([79.147.121.154]
 helo=[192.168.1.202]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1wvz4h-004edl-Q7; Mon, 17 Aug 2026 17:16:31 +0200
Message-ID: <c43101a2-a019-4522-803e-a3e3e9f4cae7@igalia.com>
Date: Mon, 17 Aug 2026 17:16:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/6] tests/kms_properties: keep primary plane
 enabled for each CRTC
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-5-mwen@igalia.com>
 <09f130b9-5b9f-4791-ba50-d7ea6311a0a1@amd.com>
 <dafb89ca-6a60-4d1c-af84-96e0cb87991f@intel.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <dafb89ca-6a60-4d1c-af84-96e0cb87991f@intel.com>
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



On 14/08/2026 08:20, Borah, Chaitanya Kumar wrote:
>
>
> On 8/14/2026 9:35 AM, Alex Hung wrote:
>>
>>
>> On 8/11/26 08:23, Melissa Wen wrote:
>>> For AMD, a primary plane must be active to keep CRTC active. So stop
>>> reusing primary plane fb for overlays, give the latter its own fb.
>>>
>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>>>
>>> ---
>>>
>>> v2:
>>> - detach different changes from a single commit (Chaitanya)
>>
>> Were patches 4 & 5 a single patch? I think they belong to a single 
>> patch.
>>
>> Ignore me if this was discussed before.
>>
>
> When I suggested splitting the patch, I meant separating the "needs 
> primary plane" change from the "set color pipeline" change.
>
> So I guess the last hunk (excluding set bypass) of patch 5 moves here.

Sorry, my fault. I just sent a v4 fixing this and addressing more comments:
https://lore.kernel.org/igt-dev/20260817150749.66509-1-mwen@igalia.com/T/#u

>
> ==
> Chaitanya
>
>>> ---
>>>   tests/kms_properties.c | 12 +++++++++++-
>>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>>> index 292a04a2a..87614346a 100644
>>> --- a/tests/kms_properties.c
>>> +++ b/tests/kms_properties.c
>>> @@ -237,7 +237,7 @@ static void 
>>> run_colorop_property_tests(igt_display_t *display,
>>>                          igt_crtc_t *crtc, igt_output_t *output,
>>>                          bool atomic)
>>>   {
>>> -    struct igt_fb fb;
>>> +    struct igt_fb fb, afb;
>>>       igt_plane_t *plane;
>>>       igt_colorop_t *colorop;
>>>       int i;
>>> @@ -255,6 +255,16 @@ static void 
>>> run_colorop_property_tests(igt_display_t *display,
>>>                igt_crtc_name(crtc), plane->index,
>>>                kmstest_plane_type_name(plane->type), output->name);
>>> +        /* AMD requires primary plane enabled to keep CRTC enabled */
>>> +        if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>>> +            drmModeModeInfo *mode = igt_output_get_mode(output);
>>> +
>>> +            igt_create_pattern_fb(display->drm_fd, mode->hdisplay, 
>>> mode->vdisplay,
>>> +                          DRM_FORMAT_XRGB8888, 
>>> DRM_FORMAT_MOD_LINEAR, &afb);
>>> +
>>> +            igt_plane_set_fb(plane, &afb);
>>> +        }
>>> +
>>>           /* iterate over all color pipelines on plane */
>>>           for (i = 0; i < plane->num_color_pipelines; ++i) {
>>>               /* iterate over all colorops in pipeline*/
>>
>

