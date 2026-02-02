Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D25EE8306C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C2710E576;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="15H82UPH";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B66F10E523
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 16:53:26 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CCBD64E423C1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 16:53:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9AE1460767;
 Mon,  2 Feb 2026 16:53:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 14CB0119A8888; Mon,  2 Feb 2026 17:53:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770051204; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Md9WcN3glEnb2iwWyeLbNWmX1GUEb9vJFavlMNUsof8=;
 b=15H82UPHvi0xJHh8KMDkoLd5Jjetzo9O/ajpl3hXTwfTkO9g76yVj81stofV3OUOMLpPki
 HgZsNREiSenLisFAByRnCKQvYG6JrimWjpnmlBDI0OOuQ/VGKmn9pWBAF05yfPHsO+nvTi
 CtbpzVyBE3+W0BdcrMOUo5FS70CWOk2VOQfm5gwRav1IgSA7Ezbc5cqCBcbkPhslaDJEJa
 5x6bFe2Ugwr70O1AG2w6B0xvOBSXk3ZYXPnENnGlc+gWcUUyig6WTjNWhE5/LIZ4OG6WYv
 Sx9iDrbX0FuNvDOlnVHNOc+8pIdzuGCI+QrAwpikXNBZM2KBQs8e7nfsGSXTlg==
Date: Mon, 2 Feb 2026 17:53:22 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 15/48] lib/monitor_edids: Add helper to get an
 EDID by its name
Message-ID: <20260202175322.5be07f87@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-15-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-15-834af822eee7@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Tue, 03 Feb 2026 08:01:01 +0000
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

On Mon, 02 Feb 2026 15:32:54 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> For testing specific EDID, it is useful to be able to retrieve an EDID by
> a verbose name.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/monitor_edids/monitor_edids_helper.c | 30 ++++++++++++++++++++++++++=
++++
>  lib/monitor_edids/monitor_edids_helper.h |  1 +
>  2 files changed, 31 insertions(+)
>=20
> diff --git a/lib/monitor_edids/monitor_edids_helper.c
> b/lib/monitor_edids/monitor_edids_helper.c index 6043e7a084b3..01feb34a55=
16
> 100644 --- a/lib/monitor_edids/monitor_edids_helper.c
> +++ b/lib/monitor_edids/monitor_edids_helper.c
> @@ -20,6 +20,16 @@
>  #include "drmtest.h"
>  #include "hdmi_edids.h"
> =20
> +struct {
> +	struct monitor_edid *edid_list;
> +	int list_size;
> +} ALL_EDIDS[] =3D {
> +	{DP_EDIDS_NON_4K,	DP_EDIDS_NON_4K_COUNT},
> +	{DP_EDIDS_4K,		DP_EDIDS_4K_COUNT},
> +	{HDMI_EDIDS_NON_4K,	HDMI_EDIDS_NON_4K_COUNT},
> +	{HDMI_EDIDS_4K,		HDMI_EDIDS_4K_COUNT},
> +};
> +
>  static uint8_t convert_hex_char_to_byte(char c)
>  {
>  	if (c >=3D '0' && c <=3D '9')
> @@ -170,3 +180,23 @@ struct monitor_edid
> *get_edids_for_connector_type(uint32_t type, size_t *count, }
>  	}
>  }
> +
> +/**
> + * get_edid_by_name:
> + * @name: Name to search in available EDIDs
> + *
> + * Return the struct edid associated with a specific name. As with
> edid_from_monitor_edid, the
> + * caller must ensure to free the EDID after use. If no EDID with the ex=
act
> name is found, returns
> + * NULL.
> + */
> +struct edid *get_edid_by_name(const char *name)
> +{
> +	for (int i =3D 0; i < ARRAY_SIZE(ALL_EDIDS); i++) {
> +		for (int j =3D 0; j < ALL_EDIDS[i].list_size; j++) {
> +			if (strcmp(ALL_EDIDS[i].edid_list[j].name, name) =3D=3D
> 0)

It is advised to use strncmp over strcmp.
With this fixed:
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>

Thank you!

> +				return
> edid_from_monitor_edid(&ALL_EDIDS[i].edid_list[j]);
> +		}
> +	}
> +
> +	return NULL;
> +}
> diff --git a/lib/monitor_edids/monitor_edids_helper.h
> b/lib/monitor_edids/monitor_edids_helper.h index e5069868683d..6d9e3fc895=
92
> 100644 --- a/lib/monitor_edids/monitor_edids_helper.h
> +++ b/lib/monitor_edids/monitor_edids_helper.h
> @@ -34,5 +34,6 @@ void free_chamelium_edid_from_monitor_edid(struct
> chamelium_edid *edid);=20
>  struct edid *edid_from_monitor_edid(const monitor_edid *monitor_edid);
>  struct monitor_edid *get_edids_for_connector_type(uint32_t type, size_t
> *count, bool four_k); +struct edid *get_edid_by_name(const char *name);
> =20
>  #endif /* TESTS_CHAMELIUM_MONITOR_EDIDS_MONITOR_EDIDS_HELPER_H_ */
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
