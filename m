Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E42FFED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:56:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425AB10E5A0;
	Tue, 17 Mar 2026 15:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="C7HvU4Nw";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2097710E5A0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:56:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0F9D41A2E05;
 Tue, 17 Mar 2026 15:56:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D70D35FC9A;
 Tue, 17 Mar 2026 15:56:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA9B11045062C; Tue, 17 Mar 2026 16:56:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773763007; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=k14xXbhDjjPJ790PDutsGKcWuegovkdUap/ecVtOGwo=;
 b=C7HvU4NwI1Jcf4A0EHMwYxE6zgLKpwVSGa4sv6CflGSPTr0na/EgI6vOck+l37OIsBiprr
 xX+gRtealNiYtlh+EkYMoYut/79vg9LZi6LqoCGtow6/rMO0aZ3QqSj5xuu7K1o+6yYXAA
 UW4aJmnGQch/s90TH794s98m9BBKplHp2FfPQaCBJCL57w56OGRvuRSEqt3SRdTib7SP4D
 8fv/cPFxfMs3Wa2ycdyl2sdnBWtGJa3r/Ny9mxkSlZX5yX0YO1toMIi6URxufPPItuGO5p
 jaEjJ4xZ1YlQBC8znLchY0DMdWes1ENSvqbxadlJ0HDyQip6GaBD8S+CIsJ4GA==
Date: Tue, 17 Mar 2026 16:56:45 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 44/49] lib/igt_kms: Add helper to get a CRTC
 from an output
Message-ID: <20260317165645.47068cfe@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-44-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-44-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:18:05 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Grabbing a valid CRTC from a specific output is useful when testing
> the output.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
