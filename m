Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596B3FED9E3
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:09:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E2310E08B;
	Tue, 17 Mar 2026 15:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UKeRzS2w";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF2D10E08B
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:09:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 07475C55059;
 Tue, 17 Mar 2026 15:10:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E338A5FC9A;
 Tue, 17 Mar 2026 15:09:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DAF7D10450611; Tue, 17 Mar 2026 16:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773760176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Z96IgCUEb60a/jowpVPT5OL5/grlIx/ZH7otoqGgvOc=;
 b=UKeRzS2wV3rsLuIosg6o4JB/JdaKEnDWSivY5zCg8HFmYGs443HubsCI3m08sRe1cXVO83
 SH8a718m4algc3+foKEDBUvU8d8/9DEEhakEnvzmrfimCyNC+6rSTw5++Ky/i84NPxIUhi
 BhQeG9e+dhvRgHfg0RZGIVREhL+nx50gIUFadlohol20WvSu4ZtFFVDdminQIuS/pcdR/X
 CTChpBSIcOx21shl/SnmTyjDf3PPdagRZwIQB9ZLKRABu2yn7bPV9phEZGvSlkBVpi1Rvr
 tkivIvqCqEtixpu2yAbgWhhl8P6f/AvZwS6g8VOSf+IoFnXYsK3iw8d9GcSVqg==
Date: Tue, 17 Mar 2026 16:09:33 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 15/49] lib/monitor_edids: Add helper functions
 for using monitor_edid objects
Message-ID: <20260317160933.61f484ae@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-15-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-15-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:36 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce the functions edid_from_monitor_edid() and
> get_edids_for_connector_type(). The former converts a monitor_edid object
> to a struct edid, which can then be utilized by igt_kms helpers. The
> latter returns a list of monitor_edid objects for a specific connector
> with certain characteristics
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

...

> +
> +/**
> + * get_edids_for_connector_type:
> + * @type: The connector type to get the EDIDs from
> + * @count: Used to store the number of EDIDs in the returned list
> + * @four_k: Use true to fetch 4k EDIDs, false to fetch non-4k EDIDs
> + *
> + * Get the list of EDIDS for a specific connector type. This returns a
> pointer to a static list,
> + * so no need to free the pointer.
> + */
> +struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t
> *count, bool four_k)

Return a const struct monitor_edid to prevent any modification as it is a
static list.

With this fixed you can add my R-by.=20

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
