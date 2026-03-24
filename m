Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD495F54AB0
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 13:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B5410E6D7;
	Tue, 24 Mar 2026 13:56:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pstXRBDx";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E3810E6D7
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 13:56:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 857141A2FCA;
 Tue, 24 Mar 2026 13:55:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5AAA66011D;
 Tue, 24 Mar 2026 13:55:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C75B010450E72; Tue, 24 Mar 2026 14:55:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774360558; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=euoyAl4YoPnYtNvQts2CBMBMe4Dj8cvbrU1C8pb9G3o=;
 b=pstXRBDx8UyljKm6Kz6tkFnEmX7isfTWZhHbkeEefk9hNWG/Ct5BjgNX76fVH4h5i2GPQu
 oBO0IthYwJ29ev477ZiczWBnQY95HSCpwsNUlNxyB/RMyiCQAOyd1HIBSw4X5fx+iMeE53
 1vLYJcR6kkEdCfAu3ff++QvLSQ1deIYjNp6WZteHeCYAQ0xa9LmLQO50dw2wsFY2SWPtUU
 j4+NcIVK9DcklRUgZaqy/MpnmLz8SrQTN+TfgZVRyoaPHhaWKi1HZQ+sltfesPJTSu1/09
 SjHlUyRasU30XqMIo+gp+zZm0TqtuYl219wYFAllPhUMdtAY1HfJL7ONP7IEkQ==
Message-ID: <ac19d33d-f1ec-435c-bcf4-37cf048795be@bootlin.com>
Date: Tue, 24 Mar 2026 14:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 03/49] lib/igt_kms: Add function to list
 connected connectors
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-3-a01dffc3b0cb@bootlin.com>
 <20260324103402.oslsmbm6zkglw2kg@kamilkon-DESK.igk.intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260324103402.oslsmbm6zkglw2kg@kamilkon-DESK.igk.intel.com>
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



On 3/24/26 11:34, Kamil Konieczny wrote:
> Hi Louis,
> On 2026-03-16 at 17:17:24 +0100, Louis Chauvet wrote:
>> Introduce the igt_get_connected_connectors() function, which returns a
>> list of connector IDs that are currently connected according to DRM.
>>
>> This function includes a timeout mechanism because connectors can be
>> unplugged at any time. Also, especially with MST, the connector can be
>> listed by drmModeGetResources() but not yet accessible with
>> drmModeGetConnector().
>>
>> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/igt_kms.c | 80 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 4a496ab256f0..72a38334f921 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -8094,6 +8094,31 @@ igt_crtc_t *igt_random_crtc(igt_display_t *display)
>>   	return crtcs[rand() % n];
>>   }
>>   
>> +static drmModeConnectorPtr igt_wait_for_connector(int drm_fd, unsigned int connector_id,
>> +						  double timeout)
>> +{
>> +	drmModeConnectorPtr connector = NULL;
>> +	struct timespec start, end;
>> +
>> +	connector = drmModeGetConnector(drm_fd, connector_id);
>> +	/*
>> +	 * This time is required as sometimes some id in the connector list are not totally
>> +	 * ready or can disappear
>> +	 */
>> +	igt_assert_eq(igt_gettime(&start), 0);
>> +	end = start;
>> +
>> +	while (!connector &&
>> +	       igt_time_elapsed(&start, &end) <= timeout) {
>> +		drmModeFreeConnector(connector);
>> +		connector = drmModeGetConnector(drm_fd, connector_id);
>> +		usleep(10000);
> 
> Same here, use defined constant.
> 
>> +		igt_assert_eq(igt_gettime(&end), 0);
>> +	}
>> +
>> +	return connector;
>> +}
>> +
>>   /**
>>    * igt_wait_for_connector_status:
>>    * @drm_fd: drm file descriptor
>> @@ -8134,3 +8159,58 @@ bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double
>>   
>>   	return false;
>>   }
>> +
>> +/**
>> + * igt_get_connected_connectors:
>> + *
>> + * @drm_fd: DRM file descriptor
>> + * @connector_ids: Out pointer for the array of connector ids connected. The function
>> + * will allocate and store the pointer in this out pointer. The caller is
>> + * responsible to free the inner pointer using free(*connector_ids). caller.
> 
> s/ caller.//
> 
>> + *
>> + * This will probe all the connectors and return the list of all
>> + * connected connectors.
> 
> Document that this could assert. Also add newline here.
> 
>> + * Returns: The number of connectors in @connector_ids
>> + */
>> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids)
>> +{
>> +	uint32_t *tmp_alloc;
>> +	int connected_count = 0;
>> +	double timeout = igt_default_display_detect_timeout();
>> +	drmModeResPtr resources;
>> +
>> +	igt_assert(drm_fd);
> 
> -1 is invalid but will not assert.
> 
>> +	*connector_ids = NULL;
>> +
>> +	resources = drmModeGetResources(drm_fd);
>> +	igt_assert(resources);
> 
> Cannot you just return 0 instead of asserting?
> Or at least use igt_assert_f() with explanation message.

If the drmModeGetResources fails, it means that there is a big kernel 
issue or that the drm_fd is not a DRM file descriptor. In either case I 
think it is useless to continue or try to handle the error in the test case.

>> +	for (int j = 0; j < resources->count_connectors; j++) {
>> +		int status = DRM_MODE_UNKNOWNCONNECTION;
>> +
>> +		drmModeConnectorPtr connector = igt_wait_for_connector(drm_fd,
>> +								       resources->connectors[j],
>> +								       timeout);
>> +
>> +		if (connector)
>> +			status = connector->connection;
>> +		drmModeFreeConnector(connector);
>> +
>> +		if (status == DRM_MODE_CONNECTED) {
>> +			tmp_alloc = reallocarray(*connector_ids,
>> +						 connected_count
>> +						 + 1, sizeof(**connector_ids));
> 
> Why this line breaks? imho better:
> 			tmp_alloc = reallocarray(*connector_ids,
> 						 connected_count + 1,
> 						 sizeof(**connector_ids));

I agree, it was probably the autowrap of my editor.

>> +			if (tmp_alloc) {
>> +				*connector_ids = tmp_alloc;
>> +			} else {
>> +				free(*connector_ids);
>> +				drmModeFreeResources(resources);
>> +				igt_assert(false);
> 
> Use igt_assert_f() with explanation message.
> 
>> +			}
> 
> Btw better flow is with error check first:
> 			if (!tmp_alloc) {
> 				...handle error here with assert
> 			}
> 
> 			*connector_ids = tmp_alloc;

Right, done for the next iteration.

> Regards,
> Kamil
> 
>> +			(*connector_ids)[connected_count] = resources->connectors[j];
>> +			connected_count++;
>> +		}
>> +	}
>> +	drmModeFreeResources(resources);
>> +
>> +	return connected_count;
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 934f24d5915b..4efd40a3ad08 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1303,5 +1303,6 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
>>   
>>   bool igt_wait_for_connector_status(int drm_fd, unsigned int connector_id, double timeout,
>>   				   int drm_mode);
>> +int igt_get_connected_connectors(int drm_fd, uint32_t **connector_ids);
>>   
>>   #endif /* __IGT_KMS_H__ */
>>
>> -- 
>> 2.52.0
>>

