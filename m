Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6B0FED9E2
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A027910E4AF;
	Tue, 17 Mar 2026 15:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sTxlvh3g";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86DA810E4AF
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:00:30 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 912FDC55059
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:00:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7E3B35FC9A;
 Tue, 17 Mar 2026 15:00:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9740810450604; Tue, 17 Mar 2026 16:00:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773759628; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VMcXAzIC7el4qKiJDuYUElpIrbwTFerLvSPL883M/6c=;
 b=sTxlvh3gKEnlax0Wi5NIK36qP4m+hG9nnp0qQ1dGEmXluh6VOF0QTO3I/9GKMwsZnpeww+
 DPjUtl/wpHojtegbeb+51RfugomHPdmBpnbZ81CfmDAtbmr4exFAqBFEMOkaZNqysL2Ex0
 DBJJyQ4KZfKqhUE4I8xcaw+oOvuZIomAGUqQ/CSJGCs7gNdW4TUKCajWKB/3DChRBKDYPa
 5qxFl7vRZVTe61VgkbB6Koj8vP1sjZY9brjoD1sXSZIq58uGGv050TCD1Vb44U27tMVvnJ
 xhuGTX+4KaQskR1gq9izwWmSPbPDJ8CC8Td6S43I4852xZBDbbvHyogXH2O6Gg==
Date: Tue, 17 Mar 2026 16:00:25 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 06/49] lib/tests: Add tests for array
 manipulations
Message-ID: <20260317160025.1440463b@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-6-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-6-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:27 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As array manipulation functions are not trivial, add few tests to ensure
> they work properly.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
