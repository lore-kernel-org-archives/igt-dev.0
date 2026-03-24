Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F7E9A74D
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:35:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289A210E110;
	Tue, 24 Mar 2026 09:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JCWRVXE/";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB74A10E110
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:35:20 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0873A1A2FC1;
 Tue, 24 Mar 2026 09:35:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE8E56011D;
 Tue, 24 Mar 2026 09:35:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 973A510450EAE; Tue, 24 Mar 2026 10:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774344918; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=QYr/7V2vBrjrQsLggY1NHIBQlrw8s4lWOJPPZ3FV3Sg=;
 b=JCWRVXE/a9Vz6beKIzll42UW7MVoyhkT8unxbdphTvlT/K5i4tKglS/4OYJuNfMUWTnPaz
 B4qckyIfTMEWMa1e1WpsqJbBbYeVZIKuV3XeTJIdzDy2zbXJsSj9+RwwxC379EZ6fLCqza
 zk16alftghWI4hQfGpI58U7DR7vYRt3tgbQ9Skl3mZIZ2ohl9sQlKl1FibsW/ZXPuqheNk
 ZrteenpM3EuXBAeN4mVTc7f8QdQv7dCF8zrDA1v4zo0g1OvYGyV2nvXWg9TxcObuOs2S/Y
 ZNd6Kii6K69RGE837IC16d6VE96kCERUA61Ohzy6nuPZ1dpRYRSAZgXisAPnPg==
Message-ID: <2132e6c3-3341-4145-9a66-66d4b1e1ba1d@bootlin.com>
Date: Tue, 24 Mar 2026 10:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 29/49] lib/unigraf: Add helpers to read and write
 edid
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-29-a01dffc3b0cb@bootlin.com>
 <20260323162610.guykjqlaqut5aeq4@kamilkon-DESK.igk.intel.com>
 <a2d4b73c-8716-40be-8b3d-3e76aa58b393@bootlin.com>
Content-Language: en-US
In-Reply-To: <a2d4b73c-8716-40be-8b3d-3e76aa58b393@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



On 3/23/26 18:34, Louis Chauvet wrote:
> 
> 
> On 3/23/26 17:26, Kamil Konieczny wrote:
>> Hi Louis,
>> On 2026-03-16 at 17:17:50 +0100, Louis Chauvet wrote:
>>> Read and writing EDID on unigraf can be useful to emulate different
>>> screens, add helpers to read and write them.
>>>
>>> There is a limitation on the libTSI.so, it is only possible to read EDID
>>> using buffers of size multiple of 128 bytes, and there is no way to 
>>> query
>>> the actual EDID size. The current implementation can only read EDID 
>>> up to
>>> 2048 bytes.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>>> ---
>>>   lib/unigraf/unigraf.c | 59 ++++++++++++++++++++++++++++++++++++++++ 
>>> +++++++++++
>>>   lib/unigraf/unigraf.h |  4 ++++
>>
>> Please move all unigraf libs into lib/vendors/unigraf/
>> similar to uwildmat use case.
> 
> Ack, I will do it for the next iteration.
> 
>>>   2 files changed, 63 insertions(+)
>>>
>>> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
>>> index b752ff573ace..d06da6742e95 100644
>>> --- a/lib/unigraf/unigraf.c
>>> +++ b/lib/unigraf/unigraf.c
>>> @@ -56,6 +56,11 @@ static char *unigraf_connector_name;
>>>    */
>>>   #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
>>> +/**
>>> + * EDID_MAX_SIZE - Max EDID size that can be read from the unigraf. The
>>> + */
>>> +#define EDID_MAX_SIZE 2048
>>> +
>>
>> Is this unigraf specific? For local def maybe UNIGRAF_EDID_MAX_SIZE?
> 
> This is a limitation of my unigraf hardware. My current implementation was:

s/current/first/ sorry...

>      size = TSIX_TS_GetConfigItem(dev,EDID_TE_INPUT,0,0);
>      buf = malloc(size)
>      TSIX_TS_GetConfigItem(dev,EDID_TE_INPUT,buf,size);
> 
> but TSIX_TS_GetConfigItem don't give the real size but min(buf_size, 
> real_edid_size) (and sometimes worse: if size is not % 128, it can do 
> buffer overflow...)
> 
> That why I always allocate a "big" buffer to ensure the %128 and to get 
> the real_size.
> 
> I will rename the constant, thanks!
> 
>> Regards,
>> Kamil
>>
>>>   static void unigraf_close_device(void)
>>>   {
>>>       if (!unigraf_device)
>>> @@ -127,6 +132,20 @@ static void unigraf_init(void)
>>>           value;                                                \
>>>       })
>>> +/**
>>> + * unigraf_write() - Helper to write a value to unigraf
>>> + * @config: config id to write
>>> + * @data: data to write
>>> + * @data_len: length of the data
>>> + * Returns
>>> + */
>>> +static void unigraf_write(TSI_CONFIG_ID config, const void *data, 
>>> size_t data_len)
>>> +{
>>> +    unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
>>> +
>>> +    unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, 
>>> data, data_len));
>>> +}
>>> +
>>>   /**
>>>    * unigraf_device_count() - Return the number of scanned devices
>>>    *
>>> @@ -329,6 +348,46 @@ void unigraf_reset(void)
>>>       unigraf_set_sst();
>>>   }
>>> +/**
>>> + * unigraf_read_edid() - Read the EDID from the specified stream
>>> + * @stream: The stream ID to read the EDID from
>>> + * @edid_size: Pointer to an integer where the size of the EDID will 
>>> be stored
>>> + *
>>> + * Returns: A pointer to the EDID structure, or NULL if the 
>>> operation failed. The caller
>>> + * is responsible to free this pointer.
>>> + */
>>> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
>>> +{
>>> +    void *edid;
>>> +
>>> +    unigraf_debug("Read EDID for stream %d...\n", stream);
>>> +
>>> +    edid = calloc(EDID_MAX_SIZE, sizeof(char));
>>> +
>>> +    unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
>>> +    *edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
>>> +                              TSI_EDID_TE_INPUT,
>>> +                              edid, EDID_MAX_SIZE));
>>> +
>>> +    return edid;
>>> +}
>>> +
>>> +/**
>>> + * unigraf_write_edid() - Write EDID data to the specified stream
>>> + * @stream: The stream ID to write the EDID to
>>> + * @edid: Pointer to the EDID structure to write
>>> + * @edid_size: Size of the EDID data in bytes
>>> + *
>>> + * This function writes the provided EDID data to the specified stream.
>>> + */
>>> +void unigraf_write_edid(uint32_t stream, const struct edid *edid, 
>>> uint32_t edid_size)
>>> +{
>>> +    unigraf_debug("Write EDID for stream %d...\n", stream);
>>> +
>>> +    unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
>>> +    unigraf_write(TSI_EDID_TE_INPUT, edid, 2048);
>>> +}
>>> +
>>>   /**
>>>    * unigraf_hpd_assert() - Assert Hot Plug Detect signal
>>>    *
>>> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
>>> index c2caa9c2c54c..40f706ebd483 100644
>>> --- a/lib/unigraf/unigraf.h
>>> +++ b/lib/unigraf/unigraf.h
>>> @@ -42,6 +42,10 @@ void unigraf_require_device(int drm_fd);
>>>   void unigraf_reset(void);
>>> +struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
>>> +
>>> +void unigraf_write_edid(uint32_t stream, const struct edid *edid, 
>>> uint32_t edid_size);
>>> +
>>>   void unigraf_hpd_deassert(void);
>>>   void unigraf_hpd_pulse(int duration);
>>>
>>> -- 
>>> 2.52.0
>>>
> 

