Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4272CFED9E3
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:19:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B5210E580;
	Tue, 17 Mar 2026 15:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eDaqJZXQ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A71210E580
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:19:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 89449C5505A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:19:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 772E75FC9A;
 Tue, 17 Mar 2026 15:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8404510450615; Tue, 17 Mar 2026 16:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773760764; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+hVnaLWycdUyL5X4APLLYeYwy9qcynDLJIHR+xXKePQ=;
 b=eDaqJZXQKqCoBDC9g7Dd0cg5x9jiIIzOkSVU4p+fCjZYNU8eegMSqXghnBLaSfM+uSqgOa
 56HEI/kcrXY4fnYuKZFivGpzfTMRzVpdnbNHagGEqoZOFYaWWL0dEDrmDYzy7XnwPLxkrP
 gr49mqc/Aci7MwUFxDSWsEQRJXaiiUGBYFcHSEEXgv6aDEc9KyrnqglF4vB92YCxjwv806
 HArWOJkly7CsMWxIJzKzMkTlKlLL38LY5JYOhqWcE9XhVByrGILPIbDiB1psNvJgqbeIwi
 Pl69fIAMC6OSE2UcgcqDanvoAWVHy9q6sy2ylUao+AoSSxsoqcTZRCRrxxYXtg==
Date: Tue, 17 Mar 2026 16:19:22 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 23/49] lib/unigraf: Introduce role configuration
Message-ID: <20260317161922.58cde3bb@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-23-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-23-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:44 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some unigraf devices, like the UCD-500 can have multiple hardware
> configurations: displayport input/output, usbc input/output.
>=20
> The device configuration can look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
