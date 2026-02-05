Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1286CECD993
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 17:43:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD21810E93E;
	Thu,  5 Feb 2026 17:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bZpSndKD";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 788F710E93E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 17:43:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 94774C243B0
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 17:43:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68F9E6074D;
 Thu,  5 Feb 2026 17:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E2F4F119D1696; Thu,  5 Feb 2026 18:43:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770313425; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=kBKGoejXQb3aWYFIIyzsQxaHe1Pdch22/YtN9UhaIKI=;
 b=bZpSndKDmbNmgOtrkgpNjIhGMiWjgfQ6/h+/5RKiLwvmte9R2HlPTNuY2Y3zf5qxbfb57h
 88waQIGeoZ27HnzAOOt2N/oAku6F+28j+qrP21o1Dp/CCnGem+ZSM9olm4VFipSGeP1eE7
 +2DN/ik33v1N1Zb5zbZzINpoBmxBL0lq7jds/1NRqqkHf9ob5ek0wcWQJKcULNjqUWLuil
 fLU4ZbisgPNib/V5hOc1xM8jrUvegZ7r6Ka7f2L1MJIGToK00tG8gB+uIpPRmvYcaEROuy
 LNKXEQnASzT1AiId0ghMun7Jmvb4W7gKeb6ydXeVK93w2dApF85V/BXPr1UQ4A==
Message-ID: <6605e2a9-0f2e-40b1-b1c1-8c4577e206c3@bootlin.com>
Date: Thu, 5 Feb 2026 18:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 27/48] lib/unigraf: Allows sst/mst configuration
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-27-834af822eee7@bootlin.com>
 <20260205175628.45b09939@kmaincent-XPS-13-7390>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260205175628.45b09939@kmaincent-XPS-13-7390>
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



On 2/5/26 17:56, Kory Maincent wrote:
> On Mon, 02 Feb 2026 15:33:06 +0100
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
>> Unigraf devices can emulate both SST and MST display port. In order to
>> write tests using both, add fews helper to manipulate them.
>>
>> The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
>> python SDK, as it was not defined by the C sdk nor documented.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   lib/unigraf/unigraf.c | 109
>> ++++++++++++++++++++++++++++++++++++++++++++++++++ lib/unigraf/unigraf.h |
>> 12 ++++++ 2 files changed, 121 insertions(+)
>>
>> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
>> index 966e7d2a5077..4a3b0a5fc28e 100644
>> --- a/lib/unigraf/unigraf.c
>> +++ b/lib/unigraf/unigraf.c
>> @@ -105,6 +105,23 @@ static void _unigraf_write_u32(TSI_CONFIG_ID config_id,
>> uint32_t value) _unigraf_write_u32(config_id, v);
>> 	\ })
>>   
>> +static uint32_t _unigraf_read_u32(TSI_CONFIG_ID config_id)
>> +{
>> +	uint32_t value;
>> +
>> +	igt_assert(unigraf_device);
>> +	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, config_id,
>> &value, sizeof(value)));
>> +	return value;
>> +}
>> +
>> +#define unigraf_read_u32(config_id)
>> 	\
>> +	({
>> 	\
>> +		uint32_t value;
>> 		\
>> +		value = _unigraf_read_u32((config_id));
>> 		\
>> +		unigraf_debug("Value read: " #config_id "=%d\n",
>> value);	\
>> +		value;
>> 		\
>> +	})
> 
> Why is there a define and a function that are doing the same thing ?
> Same question for the write part patch 25. I missed it in the review.

I use macro so unigraf_debug will print the "good" line (i.e the caller 
of unigraf_read_u32) and not a line in unigraf_read_u32. This make debug 
way easier.

And I created a function because originally my function was a bit more 
complex (if/else) and I prefer to avoid complex code inside macro.

> Regards,

