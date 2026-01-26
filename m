Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46297CF65DC
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 10:45:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E3E10E3BF;
	Mon, 26 Jan 2026 10:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="gmMadJFQ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C411210E3BF;
 Mon, 26 Jan 2026 10:45:36 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0C7664E42260;
 Mon, 26 Jan 2026 10:45:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D286560717;
 Mon, 26 Jan 2026 10:45:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2EA7D119A8642; Mon, 26 Jan 2026 11:45:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769424334; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=bOXnHUJgd4p3W7J9ZahDM6W2tHFXLxSCrP2k/EVLiC8=;
 b=gmMadJFQPQvnwGqi7lItP0TVENwQ3IGS9XSn+fJWsZ96O0CDSd4mXuzx8jNGRXYi7kIfyX
 3a5S7PjStIPvOhxB11Bp4oO/q1CBqpNl46tqXEIasF1c381CNgUKGfCweeAlXlKMUJ7Jps
 GIIFRn5VM0/sAHVLJLCfWMD1n3Gvnnj6ucDwqz54CAVE6SqhEfLgbAsfUSOrEk4cBGZpZ6
 qUqREwwre2cvK+4v79aQZVedSm+/XCho3ScgslUjwOQ+tFzKTc/E93LCTNyDrj1lcPy8RT
 oxl+9R2N7U+ZV91u/+jsgwriJxr8h2Fa2rImUszhpbxuoQZP5q8AKkRnJigljA==
Message-ID: <1e59262b-560a-4d58-b9e1-de14c92d1bba@bootlin.com>
Date: Mon, 26 Jan 2026 11:45:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 24/46] lib/unigraf: Add reset function
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com, igt-dev <igt-dev-bounces@lists.freedesktop.org>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-24-0fc7bb1b4101@bootlin.com>
 <DFW5HW67WXYW.5H7F04N5IRML@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DFW5HW67WXYW.5H7F04N5IRML@bootlin.com>
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



On 1/23/26 18:39, Luca Ceresoli wrote:
> On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
>> To have a consistent state at the beginning of tests, add a unigraf_reset
>> function that will restore a known state.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/unigraf/unigraf.c | 5 +++++
>>   lib/unigraf/unigraf.h | 9 +++++++++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
>> index 59a85e1b84c9..e96c7fc3a91e 100644
>> --- a/lib/unigraf/unigraf.c
>> +++ b/lib/unigraf/unigraf.c
>> @@ -278,6 +278,8 @@ bool unigraf_open_device(int drm_fd)
>>   	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
>>   	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
>>
>> +	unigraf_reset();
>> +
>>   	return true;
>>   }
>>
>> @@ -285,3 +287,6 @@ void unigraf_require_device(int drm_fd)
>>   {
>>   	igt_require(unigraf_open_device(drm_fd));
>>   }
>> +
>> +void unigraf_reset(void)
>> +{}
> 
> Weird implementation :) But OK, code is added in patch 26.

Patch 26 also introduce a different set of features. I wanted to avoid 
mixing the reset creation with it to simplify review and rebases.

>> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
>> index a93bd464bac3..76f4f8878c2c 100644
>> --- a/lib/unigraf/unigraf.h
>> +++ b/lib/unigraf/unigraf.h
>> @@ -48,4 +48,13 @@ bool unigraf_open_device(int drm_fd);
>>    */
>>   void unigraf_require_device(int drm_fd);
>>
>> +/**
>> + * unigraf_reset() - Reset the Unigraf device
>> + *
>> + * This function performs a hardware reset of the Unigraf device, restoring it to a
>> + * default state. This includes resetting all configuration parameters, stream settings,
>> + * and link parameters to default values.
>> + */
>> +void unigraf_reset(void);
> 
> Why declaring it in a header file when it's implemented and used in the
> same .c file? It should rather be static.

Because I use it in the last patch of the series in 
tests/unigraf/unigraf_lt and I wanted to avoid changing the function later.

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

