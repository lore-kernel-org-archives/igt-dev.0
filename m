Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 096B4EA4FCF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 15:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9F010E2F1;
	Mon, 23 Feb 2026 15:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oQrg9LI3";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE2F10E2F1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:11:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D20BCC143CB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 15:12:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8A3C55FD59;
 Mon, 23 Feb 2026 15:11:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0886310368FBA; Mon, 23 Feb 2026 16:11:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771859510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=OIP8IbjHcLUxEPcMr1AfobI3oxKmGF03L6JXSRSXlcI=;
 b=oQrg9LI30lAGTNEMYX7s65Xw2naiubBEUvY2LfPj2K8h02bg3cAP72y823REBSm6X3Fgjp
 FRhCCZ/XDUjBA22Yffi0Wd7Wot1O4XGexvcBQCYhAjdsbl2gtXVvynSmB8yEebN0r1ripY
 LL0VD0Dl2oxmUHQelhfhLrMsHy4aM9tB7+zPl5KkdJU7YoZmu0zpjI1EPlqFDAgVSzqdQb
 22TTtWREKcvKb4YYtqZ6W1KHYriVULpc4OMPHo2lOG1yKKgvAks8Kn427FOGkQMiBpz5BG
 xvEf2vfiXN2SKumLoz/hEW0Pm+asaElH+JJ2EzHhIuOusDnsB/c0xkJItS8HHg==
Date: Mon, 23 Feb 2026 16:11:47 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v7 30/48] tests/unigraf: Add basic unigraf tests
Message-ID: <20260223161147.238c9dcd@kmaincent-XPS-13-7390>
In-Reply-To: <20260223-unigraf-integration-v7-30-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
 <20260223-unigraf-integration-v7-30-73dc9143c8c1@bootlin.com>
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

On Mon, 23 Feb 2026 13:09:37 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Adds two tests to validate unigraf communication.
>=20
> unigraf-connect checks if the device is connected and if the EDID is
> properly applied.
>=20
> ungiraf-reconnect checks if the device can be connected/reconnected
> using SST and MST configurations.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

...

> +
> +	igt_describe("Make sure that the unigraf device can be used as a MST
> device");
> +	igt_subtest("ungiraf-connect-mst") {

*unigraf*
Else I don't think the test will be triggered right?

> +		int newly_connected_count, already_connected_count, diff_len;
> +		uint32_t *newly_connected =3D NULL, *already_connected =3D NULL,
> *diff =3D NULL;
> +		int max_count;
> +
> +		unigraf_require_device(drm_fd);
> +		max_count =3D unigraf_get_mst_stream_max_count();
> +
> +		unigraf_hpd_deassert();
> +
> +		already_connected_count =3D
> igt_get_connected_connectors(drm_fd, &already_connected); +
> +		igt_debug("Already connected count: %d\n",
> already_connected_count); +
> +		// i =3D 0 is SST so we need to process max_count + 1 streams
> +		for (int i =3D 0; i <=3D max_count; i++) {
> +			unigraf_hpd_deassert();
> +			// Let the hardware detect the new state
> +			sleep(igt_default_display_detect_timeout());
> +
> +			unigraf_set_mst_stream_count(max(i, 1));
> +			if (!i)
> +				unigraf_set_sst();
> +			else
> +				unigraf_set_mst();
> +
> +			unigraf_hpd_assert();
> +			// Let the hardware detect the new state
> +			sleep(igt_default_display_detect_timeout());
> +
> +			newly_connected_count =3D
> kms_wait_for_new_connectors(&newly_connected,
> +
> already_connected,
> +
> already_connected_count,
> +
> drm_fd); +
> +			diff_len =3D get_list_diff(newly_connected,
> newly_connected_count,
> +						 already_connected,
> already_connected_count, &diff); +
> +			igt_assert_f(diff_len =3D=3D max(i, 1),
> +				     "Invalid connected connector count,
> expected %d found %d\n",
> +				     max(i, 1), diff_len);
> +		}
> +	}
> +}
>=20



--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
