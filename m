Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF50D74ED9
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 14:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610D910EAF1;
	Fri, 23 Jan 2026 14:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WhqrdHaX";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51FF410EAF1;
 Fri, 23 Jan 2026 14:04:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A12771A2A0C;
 Fri, 23 Jan 2026 14:04:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 75CD26070A;
 Fri, 23 Jan 2026 14:04:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B2E0119A8547; Fri, 23 Jan 2026 15:04:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769177068; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Jzi1/1XyIUDUmNkbjy+7L4iL/YfgsT2k6WE3wXx9pBg=;
 b=WhqrdHaXAjof1Fkq9HAa1kE0oeczYiSm2viGYF+KRvxflMU99lbS+gRcsbszOcr06ETsbU
 9GC3z5F0xbUAL+Q05oe9yWQlI19UuHY47BZPHZWixO56kioxl2YkMBwR+ftQdb58GuLS1Z
 LpXg/KSWEiyApW7m5JaNJ8LwPYBxt3pv8285h0+sA22mEKcmFlOcYLIkoZCsXjFupCBIke
 kuj/stsRMqrTq+4wUHPXmfQtcYXK4v49Xhz3FHHkBuexUrA7DxvP6aJ8jYCVSZLhE0fao/
 JcgQdX743yHzktDFAx1mKDAuwNeATIRkbVTLU944GSIRPooieYMmCspccQGT8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 15:04:24 +0100
Message-Id: <DFW0XFDLYBJL.2UQ9UK8JXH9EW@bootlin.com>
Subject: Re: [PATCH i-g-t v4 18/46] lib/unigraf: Add TSI.h
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-18-0fc7bb1b4101@bootlin.com>
 <DFUGGVHPISTJ.ZSMBM3NR3UBZ@bootlin.com>
 <9376f3ad-2202-4eb7-9c74-bb57b30e21bf@bootlin.com>
In-Reply-To: <9376f3ad-2202-4eb7-9c74-bb57b30e21bf@bootlin.com>
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

Hi Louis,

On Thu Jan 22, 2026 at 5:53 PM CET, Louis Chauvet wrote:
>>> + */
>>> +TSI_RESULT TSI_Clean(void);
>>> +
>>> +/**
>>> + * TSI_MISC_GetErrorDescription() - Get a human readable error message
>>> + * @ErrorCode: Error code for which you want the message
>>> + * @ErrorString: Pointer where to copy the message
>>> + * @StringMaxLen: Size of the allocated string @ErrorString
>>> + *
>>> + * The official documentation states: If the function succeeds, the
>>> + * return value is the number of characters required for the complete
>>> + * error description string.
>>> + * In reality, this function always returns 0 or error, so there is no=
 way to
>>
>> On error it returns 0...
>
> 0 *or* error (<0):

Aaah, sorry for the noise, I must have misread "0 on error".

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
