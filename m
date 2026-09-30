Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98051CA5FC4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 19:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A33910F4CF;
	Wed, 30 Sep 2026 19:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="BcW4RxnX";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88E510F4CF
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 19:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
 MIME-Version:Date:Message-ID:From:Reply-To;
 bh=OswMy3y5koXlcLLT+8itOFRXZDE4p7/XJ6nETecF9n0=; b=BcW4RxnXx5GG8dQUCpNjUFJK/K
 tG+5SD+xHMMcf037j3xK05IQA1XJ1LwIBAfD284/HUCLaoTJc/J0W2vaj1TNQVDqKQMdbKmy9uBjH
 QFaatLsJuXxFc+06Q1NHb3A09rMPUSd5OdzFa2F2xhSi3qGSkuZcC3LziSPPq/l+mVgNH6wOthjXg
 2ikJpi6+bAyLhYpX/J55j4huc1AowG/TLOvt6GuFCoN6S5+r61RCohvlnNV6rTFbliz3AgJblPKAQ
 tjp7j7z9ydmwfRszxKjUcW3gXYQuAkxSkqzqhG0EU+BfprhKgJwmrfnr/XK1/eKutnvHuVDiGG6Vg
 pk38Km0Q==;
Received: from ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca
 ([142.127.77.63] helo=[10.21.51.192])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1xC073-009aXl-0l; Wed, 30 Sep 2026 21:37:09 +0200
Message-ID: <9845a127-4b17-4ffa-afc5-582acaf5a64e@igalia.com>
Date: Wed, 30 Sep 2026 15:37:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 4/8] tests/kms_properties: give non-primary
 planes their own fb
To: Harry Wentland <harry.wentland@amd.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-5-mwen@igalia.com>
 <a68bfa15-1a1b-4ba8-aab6-7a8089d13b3f@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <a68bfa15-1a1b-4ba8-aab6-7a8089d13b3f@amd.com>
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



On 30/09/2026 18:06, Harry Wentland wrote:
>
>
> On 2026-09-02 13:58, Melissa Wen wrote:
>> On AMD drivers, a CRTC remains active only while its primary plane is
>> enabled; therefore, handing the primary's fb over to a non-primary plane
>> would take the CRTC down with it. Create a dedicated fb for each
>> non-primary plane before testing its colorops and discard it again
>> afterward, leaving the primary plane and its prepare_crtc() fb intact.
>> This is groundwork for the next commit, which checks colorop properties
>> on an active color pipeline.
>>
>
> This patch confuses me a bit. You mention that amdgpu needs an
> FB on primary planes for a crtc to be active, which makes sense.
> But this patch then only deals with non-primary planes. Does
> amdgpu have a need for (non-primary) planes to have an attached
> FB before allowing a COLOR_PIPELINE?

Sorry, reading it again I see I could have explained better what I'm 
actually changing.

The issue this commit wants to solve is: we can only test/change colorop 
properties of a given color pipeline if its color pipeline is active 
(set in COLOR PIPELINE plane prop) which also means its plane has to be 
active too.
In the original version, the primary plane is active, but other planes 
in a given CRTC isn't.

Before iterating over planes in a given CRTC, a frame buffer is already 
attached to the primary plane (by prepare_crtc), yes.
But then, when iterating over planes to check their color pipelines, if 
it's not a primary plane, we need to set a separate fb to activate it 
before setting the COLOR PIPELINE prop, keeping the primary plane active 
with their own fb.
I guess this confusing commit message came from my attempts to solve it 
by initially reusing the "prepare_crtc" fb on overlay planes to activate 
it >.<

I hope I was able to explain it better now. I'll rewrite the commit message.

Melissa


>
> Harry
>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>
>> v2:
>> - detach different changes from a single commit (Chaitanya)
>> v3:
>> - move hunk from next patch to fix mem leak (Alex H/Chaitanya)
>> ---
>>   tests/kms_properties.c | 20 +++++++++++++++++++-
>>   1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
>> index 2b4cb152b..c55a271da 100644
>> --- a/tests/kms_properties.c
>> +++ b/tests/kms_properties.c
>> @@ -237,7 +237,7 @@ static void 
>> run_colorop_property_tests(igt_display_t *display,
>>                          igt_crtc_t *crtc, igt_output_t *output,
>>                          bool atomic)
>>   {
>> -    struct igt_fb fb;
>> +    struct igt_fb fb, afb;
>>       igt_plane_t *plane;
>>       igt_colorop_t *colorop;
>>       int i;
>> @@ -255,6 +255,18 @@ static void 
>> run_colorop_property_tests(igt_display_t *display,
>>                igt_crtc_name(crtc), plane->index,
>>                kmstest_plane_type_name(plane->type), output->name);
>>   +        /* A non-primary plane needs an fb of its own: AMD keeps the
>> +         * CRTC active only while the primary plane is enabled.
>> +         */
>> +        if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> +            drmModeModeInfo *mode = igt_output_get_mode(output);
>> +
>> +            igt_create_pattern_fb(display->drm_fd, mode->hdisplay, 
>> mode->vdisplay,
>> +                          DRM_FORMAT_XRGB8888, 
>> DRM_FORMAT_MOD_LINEAR, &afb);
>> +
>> +            igt_plane_set_fb(plane, &afb);
>> +        }
>> +
>>           /* iterate over all color pipelines on plane */
>>           for (i = 0; i < plane->num_color_pipelines; ++i) {
>>               /* iterate over all colorops in pipeline*/
>> @@ -272,6 +284,12 @@ static void 
>> run_colorop_property_tests(igt_display_t *display,
>>                   colorop = igt_find_colorop(display, colorop_id);
>>               }
>>           }
>> +
>> +        /* only the fb created above needs to go away here */
>> +        if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>> +            igt_plane_set_fb(plane, NULL);
>> +            igt_remove_fb(display->drm_fd, &afb);
>> +        }
>>       }
>>         cleanup_crtc(display, crtc, output,
>

