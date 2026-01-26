Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6923CF65DB
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 11:28:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5764410E1B9;
	Mon, 26 Jan 2026 11:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KxpUF/zD";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5C710E1B9
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 11:28:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id C6F241A2995;
 Mon, 26 Jan 2026 11:28:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8140C60717;
 Mon, 26 Jan 2026 11:28:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1EB38119A8121; Mon, 26 Jan 2026 12:28:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769426883; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=is+1MYtjqZA1mGek0m8AuP2NoYEoYORjitz3Rm3wYiY=;
 b=KxpUF/zDsXnfCDdJXLG04m26sQK7oLijvAmZ5rhavo9OwW9B7igxa9DxJavSA2RpZZV6k0
 WLv1JoBuEPKNLXjRuXrGHlY+8wRCUQp/QjmLGVJnleyRe0nyE830llpuwMDUEd1RQ+i0AD
 7QptyVfy0qXxqVYJ0m7b3UBvViIx3lKCO6nhXRt9zT4FQHKLl6IRyaBJ3VIjzxvTkt9rtU
 sXNCdoYrKAi0dgOSvP0JVL+RE6/D2MAfKfF8QD11FdNhqEZ8+ZMCtpISybbERA6j2T6wyP
 gu47S5bHeed8M+kLGL5dEWuVRwifOOHP3YDHv4T+83zIGWEY0kjk/NxtFRt+/g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:28:01 +0100
Message-Id: <DFYHHBGAMIU0.3FT3KQXROEAEK@bootlin.com>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 24/46] lib/unigraf: Add reset function
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-24-0fc7bb1b4101@bootlin.com>
 <DFW5HW67WXYW.5H7F04N5IRML@bootlin.com>
 <1e59262b-560a-4d58-b9e1-de14c92d1bba@bootlin.com>
In-Reply-To: <1e59262b-560a-4d58-b9e1-de14c92d1bba@bootlin.com>
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

On Mon Jan 26, 2026 at 11:45 AM CET, Louis Chauvet wrote:
>
>
> On 1/23/26 18:39, Luca Ceresoli wrote:
>> On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
>>> To have a consistent state at the beginning of tests, add a unigraf_res=
et
>>> function that will restore a known state.
>>>
>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>> ---
>>>   lib/unigraf/unigraf.c | 5 +++++
>>>   lib/unigraf/unigraf.h | 9 +++++++++
>>>   2 files changed, 14 insertions(+)
>>>
>>> diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
>>> index 59a85e1b84c9..e96c7fc3a91e 100644
>>> --- a/lib/unigraf/unigraf.c
>>> +++ b/lib/unigraf/unigraf.c
>>> @@ -278,6 +278,8 @@ bool unigraf_open_device(int drm_fd)
>>>   	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
>>>   	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
>>>
>>> +	unigraf_reset();
>>> +
>>>   	return true;
>>>   }
>>>
>>> @@ -285,3 +287,6 @@ void unigraf_require_device(int drm_fd)
>>>   {
>>>   	igt_require(unigraf_open_device(drm_fd));
>>>   }
>>> +
>>> +void unigraf_reset(void)
>>> +{}
>>
>> Weird implementation :) But OK, code is added in patch 26.
>
> Patch 26 also introduce a different set of features. I wanted to avoid
> mixing the reset creation with it to simplify review and rebases.

Yes, sure, make sense! I was just looking funny :)

>>> diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
>>> index a93bd464bac3..76f4f8878c2c 100644
>>> --- a/lib/unigraf/unigraf.h
>>> +++ b/lib/unigraf/unigraf.h
>>> @@ -48,4 +48,13 @@ bool unigraf_open_device(int drm_fd);
>>>    */
>>>   void unigraf_require_device(int drm_fd);
>>>
>>> +/**
>>> + * unigraf_reset() - Reset the Unigraf device
>>> + *
>>> + * This function performs a hardware reset of the Unigraf device, rest=
oring it to a
>>> + * default state. This includes resetting all configuration parameters=
, stream settings,
>>> + * and link parameters to default values.
>>> + */
>>> +void unigraf_reset(void);
>>
>> Why declaring it in a header file when it's implemented and used in the
>> same .c file? It should rather be static.
>
> Because I use it in the last patch of the series in
> tests/unigraf/unigraf_lt and I wanted to avoid changing the function late=
r.

Ah, OK, it's fine then. I still haven't reached patch 46.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
