Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46759EE20A8
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 14:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC26C10E7F6;
	Fri,  6 Feb 2026 14:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IDBESgJz";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01A610E7F6
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 14:42:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 970891A2C51;
 Fri,  6 Feb 2026 14:42:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6DEFA60729;
 Fri,  6 Feb 2026 14:42:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D5F95119D1A09; Fri,  6 Feb 2026 15:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770388935; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=dBaasnkkcZi0T6unAnQownbPXfIdL0EkQWoMHKDgVtg=;
 b=IDBESgJz7oXkfXREUeSw4ezMWSGyhUVeooEn3POHscTxE750gDakeDOj5PzXriq9kiFAIM
 ieCyIKFf0Z5cYIDyf1By2wtN5OFVfA7hkWa0DkZWsF5IdHl+bR/2gLmv3RcOBwHPk/PH4N
 GKcefXVWnhgw8uWz1+O+5e1CkajzMfxawf2wP/aK7+HpiZpWIczVCAR68La1k7uCPEz23e
 E1OShQDgMzogEmKxFmwORgoOY+rXI10D7vaQNKbJ+STq/EK1vdBYvPeMAVGGt7uA3TItfm
 64ky5oT1DQ7ja/8ljq6/pysDS/ImaPH1HshtLRrWYCTKYbCMELToDXgWwh240A==
Date: Fri, 6 Feb 2026 15:42:14 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 34/48] lib/unigraf: Add helper to check timings
 received by unigraf
Message-ID: <20260206154214.677e6812@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-34-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-34-834af822eee7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 02 Feb 2026 15:33:13 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Unigraf device can check that some input video parameters.
> Add a function to compare a mode with the actual signal
> received by the unigraf.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
