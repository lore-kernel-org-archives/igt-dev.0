Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23690CD5BB0
	for <igt-dev@archiver.kernel.org>; Fri, 22 May 2026 15:57:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45F610E262;
	Fri, 22 May 2026 15:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="FIfHF8vo";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A4A10F642
 for <igt-dev@lists.freedesktop.org>; Fri, 22 May 2026 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1779465440;
 bh=yly3vWjZllRIW/3JjgNuBo/Eeb7CzuVqk1fI0nm0++c=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=FIfHF8vo9BA8ouKhjRONgo96HuVh75ZP40nlHtZxwsrJdn4AD898cx4ai6obspf6y
 BMz5TybgWad2UHty8pSYOA1bfBYVtYlTrAI0de/by8KLtUAngMzQcWUglWpxhsrIKj
 EPiwKV/82fMZOlNc80QBEuz5THT1I3wL2SMhapCq3XVIUeU9acdM/ekGqtwzaDsnyg
 4Bncqt/ZdWr8ZDEJvN7JnpWGlZw156uNrpny3DpZFNu7GSQxdg07s3ybs6RGAZs2Dz
 qP8sOD7XEDBJR8bcz/ISB6MtljeL8LKkilHROtVQqlUKIV68qeHsErqEVbBKLIqyGR
 OrU49TnJGTB0A==
Message-ID: <b97913b5-16d5-4a9e-8b21-d991e3b18528@lankhorst.se>
Date: Fri, 22 May 2026 17:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
 BACKGROUND_COLOR property.
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <PH7PR11MB60537336D612475147EEC667E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <PH7PR11MB60537336D612475147EEC667E7002@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
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



Den 2026-05-19 kl. 14:07, skrev Samala, Pranay:
> Hi Maarten,
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>> Maarten Lankhorst
>> Sent: Wednesday, May 6, 2026 1:14 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> Subject: [PATCH i-g-t 1/4] lib/igt_kms: Add support for the
>> BACKGROUND_COLOR property.
>>
>> The background color is a 64-bits property that contains the ARGB values of
>> the background with 16 bits for each component.
>>
>> Add support for the BACKGROUND_COLOR property, and set to pitch black as
>> the default.
>>
>> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>>  lib/igt_kms.c | 4 ++++
>>  lib/igt_kms.h | 1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 99fc9fa05c..b70aefe697 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -731,6 +731,7 @@ const char * const
>> igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
>>  	[IGT_CRTC_VRR_ENABLED] = "VRR_ENABLED",
>>  	[IGT_CRTC_SCALING_FILTER] = "SCALING_FILTER",
>>  	[IGT_CRTC_SHARPNESS_STRENGTH] = "SHARPNESS_STRENGTH",
>> +	[IGT_CRTC_BACKGROUND_COLOR] = "BACKGROUND_COLOR",
>>  };
>>
>>  const char * const
>> igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = { @@ -2737,6
>> +2738,9 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
>>  	if (igt_crtc_has_prop(crtc, IGT_CRTC_SHARPNESS_STRENGTH))
>>  		igt_crtc_set_prop_value(crtc,
>> IGT_CRTC_SHARPNESS_STRENGTH, 0);
>>
>> +	if (igt_crtc_has_prop(crtc, IGT_CRTC_BACKGROUND_COLOR))
>> +		igt_crtc_set_prop_value(crtc,
>> IGT_CRTC_BACKGROUND_COLOR,
>> +0xffff000000000000ULL);
> 
> Imho, add a short inline comment to clarify the channel packing.
> /* BACKGROUND_COLOR is ARGB16161616; set opaque black (A=0xffff, RGB=0) */
> 
Using the DRM_ARGB64_PREP() macro directly is likely equally informative. I'll do that instead and reorder patch 1 and 3.

>> +
>>  	crtc->out_fence_fd = -1;
>>  }
>>
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index a58cb5cd34..71f908d4f5
>> 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -165,6 +165,7 @@ enum igt_atomic_crtc_properties {
>>         IGT_CRTC_VRR_ENABLED,
>>         IGT_CRTC_SCALING_FILTER,
>>         IGT_CRTC_SHARPNESS_STRENGTH,
>> +       IGT_CRTC_BACKGROUND_COLOR,
> 
> Please use tab for indentation.
> Along with Kamil's suggestion, changes LGTM.
> 
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>


