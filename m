Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AE7D77899
	for <igt-dev@archiver.kernel.org>; Fri, 23 Jan 2026 17:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF8B10EB8C;
	Fri, 23 Jan 2026 17:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XoJ/GuqN";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76BE110EB86
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 86B9BC1F1D0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jan 2026 17:40:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 35DBE6070A;
 Fri, 23 Jan 2026 17:40:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1775B119A80FC; Fri, 23 Jan 2026 18:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769190013; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xt3Vw0AliAl1qEGmAfczA0RV3n7QX3CO1dOQ0St0z3g=;
 b=XoJ/GuqNjKOZl81g/rAikdMbajdR/fSk0y/ElWJM9rqxI7YKUsv/aqnSDAcBtrM2lSbA+N
 VfpcKLzsCq87quHyIyKUT+l0IalnKirrBz2hA7w28DdegnL3ta8mu4LB0rcTxXshEFAHvH
 Wuf+Vp821skPwtWrU9HCMXCBT6abh26bJMIneK+UL+Lv80pd1UPDWFx4In8ZA47qpybvr9
 ZmDJwdVgxI+MGTAWOJ2m+Ao84NKYnU7Dbnuarnl2EAwK1c3QxNr5bsWhfSn2rxZ/cI9EOD
 GpG17bhCAat2hx5EhKpSRkEZa9tgpFQite+1LiC2fKjdQDDyIsZjJnNq/iq2Ug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 18:40:12 +0100
Message-Id: <DFW5INMNP1DE.CNN8OF8A2SYN@bootlin.com>
Subject: Re: [PATCH i-g-t v4 26/46] lib/unigraf: Add plug/unplug helpers
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-26-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-26-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> The unigraf can emulate a full cable plug/unplug, so add helper to emulat=
e
> this.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>



--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
