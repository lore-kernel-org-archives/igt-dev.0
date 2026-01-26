Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC876CF65DB
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 11:28:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724CF10E1B9;
	Mon, 26 Jan 2026 11:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="b/sQ70vl";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5D10E1B9
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 11:28:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 71F40C225BA
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 11:28:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D8F3060717;
 Mon, 26 Jan 2026 11:28:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65D81119A80E2; Mon, 26 Jan 2026 12:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769426894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AEtsueM26DY3+FtzPo0ug7Yfs2FR5EwH75/6N/lLGqE=;
 b=b/sQ70vlQq2uJ7tyBSBVHwe41Z/GvHwygpfCklosnc9IukqzGPOlCj/6S3x9V8f0S+8wAZ
 uw5vGGfHd2bGOvd4UNtrZZQylESAffaFPelAvoGwV/P/ru3Pzk5dclx+ZEItVumO7jCyAy
 TXzm5UE7QIOzv5JD9rItuoUyRiApx+V9OzDg/aGS75fMiS1uHiXeiViaQECYtPtxxKG1CS
 N39JN1zoKXMT0ObO3PJLSFbwvACA5ru3G0LpjLlzQ6XchM2jZLImu/uh80hdj9XBoRl2d4
 Rjfk9Q1LC2AFLeKYEY6C22ON1uDu9xkfPZ4eP7BNkAzTXq6XZzT1lCD3hOHezw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 12:28:13 +0100
Message-Id: <DFYHHGY3402I.18FX3QM3Q9INH@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 26/46] lib/unigraf: Add plug/unplug helpers
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-26-0fc7bb1b4101@bootlin.com>
 <DFW5INMNP1DE.CNN8OF8A2SYN@bootlin.com>
In-Reply-To: <DFW5INMNP1DE.CNN8OF8A2SYN@bootlin.com>
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

On Fri Jan 23, 2026 at 6:40 PM CET, Luca Ceresoli wrote:
> On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
>> The unigraf can emulate a full cable plug/unplug, so add helper to emula=
te
>> this.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Oops, missing line in my reply, sorry about that!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
