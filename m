Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3711D3EE86
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 15:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A209310E9E5;
	Thu, 22 Jan 2026 15:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kDzwz20M";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46710E9E8
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 15:49:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 55D9EC21AA6;
 Thu, 22 Jan 2026 15:49:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6FFB460711;
 Thu, 22 Jan 2026 15:49:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6F7DD119B834F; Thu, 22 Jan 2026 16:49:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769096990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=VTKgaEauLgny547bGFBG4htFb4lOc7FbXTv4kZ69Ves=;
 b=kDzwz20MYebwUWVZLgZQ5gyz62Sgl9rUdJYLd9TS+kt/yL1GxXoTuZPcVQeKBvTLGSqiwY
 bLIPuctRtjPczbg8yfsu+h43FtSUMJvZKpLuF03Vs4C03txKNsvO5I+zO7Rfa0dnA/ZpMH
 4LFXhrUmnBXPJhdRfQNvtrU1p2EHufuHJrIDvukX0U4bLnNipZKAGqvldWDIbhaaXVVplz
 9JQXTmt7bTlZTwDXu9l1+RovjZHBbblTfmAGDoaH5BiZCceBg4nlOwsjqYSol+vcOb7Z0o
 fSeLrPGSPiJ8HQ0uwOaneYsk6vPC1Adj5lLEus8w1eFAJ64873IZeRmOlE4hQQ==
Message-ID: <08eae940-7ad6-446e-8c8d-46b35891789b@bootlin.com>
Date: Thu, 22 Jan 2026 16:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 06/46] lib/igt_kms: Add helper to get a pipe from
 a connector
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com, igt-dev <igt-dev-bounces@lists.freedesktop.org>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-6-0fc7bb1b4101@bootlin.com>
 <DFTQ42U8ZZXG.30IIDPS52E787@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DFTQ42U8ZZXG.30IIDPS52E787@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
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



On 1/20/26 22:10, Luca Ceresoli wrote:
> On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
>> Currently there is no way to get a pipe from the connector. Add this tiny
>> helper that will try to get the currently used pipe for a specific
>> connector.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  8 ++++++++
>>   2 files changed, 42 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index c77c94d7c437..f8d4037a68bf 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7926,3 +7926,37 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>>
>>   	return newly_connected_count;
>>   }
>> +
>> +enum pipe igt_get_pipe_from_connector(int drm_fd, int connector_id)
> 
> The function name suggests it takes a connector (a drmModeConnectorPtr
> perhaps), but it takes a connector ID. I suggest renaming the function to
> igt_get_pipe_from_connector_id() so that in case you need in the future a
> function that takes a connector it will be intuitively named
> igt_get_pipe_from_connector().

Ack

>> +{
>> +	drmModeObjectPropertiesPtr proplist;
>> +	drmModePropertyPtr crtc_id_prop;
>> +	drmModePropertyPtr prop;
>> +	uint32_t crtc_id;
>> +	enum pipe pipe_id;
>> +	int i;
>> +
>> +	proplist = drmModeObjectGetProperties(drm_fd, connector_id, DRM_MODE_OBJECT_CONNECTOR);
>> +	crtc_id_prop = NULL;
>> +
>> +	for (i = 0; i < proplist->count_props; i++) {
>> +		prop = drmModeGetProperty(drm_fd, proplist->props[i]);
>> +
>> +		if (strcmp(prop->name, "CRTC_ID") == 0) {
>> +			crtc_id_prop = prop;
>> +			break;
>> +		}
>> +		drmModeFreeProperty(prop);
>> +	}
>> +
>> +	igt_assert(crtc_id_prop);
>> +	igt_assert((crtc_id_prop->flags & DRM_MODE_PROP_EXTENDED_TYPE) == DRM_MODE_PROP_OBJECT);
>> +	crtc_id = proplist->prop_values[i];
>> +	drmModeFreeProperty(crtc_id_prop);
>> +	drmModeFreeObjectProperties(proplist);
>> +	if (crtc_id != 0) {
>> +		pipe_id = kmstest_get_pipe_from_crtc_id(drm_fd, crtc_id);
>> +		return pipe_id;
>> +	}
>> +	return PIPE_NONE;
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 7b1d01efebf2..4184c3930cbd 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1315,4 +1315,12 @@ int kms_wait_for_new_connectors(uint32_t **newly_connected,
>>   int
>>   get_list_diff(const uint32_t *list_a, int list_a_len, const uint32_t *list_b, int list_b_len,
>>   	      uint32_t **diff);
>> +/**
>> + * igt_get_pipe_from_connector() - Get a pipe from the connector id
>> + * @drm_fd: drm file descriptor to which the connector belongs
>> + * @connector_id: connector to inspect
>> + *
>> + * Returns PIPE_NONE if the connector is not connected to any pipe
>> + */
> 
> Documentation is before the function definition (.c) elsewhere, why at the
> declaration in this case?

There are no reason at all, I just wrote it in the wrong place.

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

