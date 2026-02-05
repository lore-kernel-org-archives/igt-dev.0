Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B926ECD993
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 17:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C141610E3AB;
	Thu,  5 Feb 2026 17:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CnwGDq7X";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 193A910E3AB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 17:42:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D8E821A2C33
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 17:42:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A74CC6074D;
 Thu,  5 Feb 2026 17:42:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1C9D5119D16A7; Thu,  5 Feb 2026 18:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770313332; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xsv2rHkdO2Zedw0eYb37ECITMT7Q1+iSnB4LwwoVUV0=;
 b=CnwGDq7X25rXmBcAVmc1QusvmR4IwDNp5HVJzGmdZpPUeebGL/IUi0K90rQ1q4IxfhMLjD
 GvQlZbNgEgNT+bNkRHlqB0N4ZYaj6Rale2PWHiIz5YMCVCsVAT80S26hoYONmbF75VdUD2
 YHRXBhfII6gxnnFxVCfX5UjsIkvh2i2c2+fc+ZlimR333mQvZqDERy/abvgraVuwEgUSYP
 qdyQDGVJH6mxH5K3z1JbEBZc8RLwSDfeMDkXplhd5PJPDZWIYJpgrQNquTDQzDhmpnIeHJ
 HOW6pA86XDwWIrYN7ekRbZ1+FNFb8Supq35SPu0VZCcir8MDM2sIjDwFzxm8Zw==
Date: Thu, 5 Feb 2026 18:42:08 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 29/48] lib/unigraf: Add connector and EDID
 configuration
Message-ID: <20260205184208.19b80208@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-29-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-29-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:08 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> As multiple connectors can be present on the DUT, add a configuration to
> tell which connector is used by the Unigraf and which EDID to use on the
> Unigraf.
>=20
> Complete list of EDID name supported can be found in
> lib/monitor_edids/{dp,hdmi}_edids.h
>=20
> The configuration will look like:
>=20
> [Unigraf]
> Device=3DUCD-500 [2434C620]
> Role=3DDisplayPort Source and Sink
> Input=3DDP RX
> Connector=3DDP-4
> EDID=3DDEL_16543_DELL_P2314T_DP
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

...

> +	newly_connected_count =3D kms_wait_for_new_connectors(&newly_connected,
> +
> already_connected,
> +
> already_connected_count,
> +							    drm_fd);
> +
> +	diff_len =3D get_list_diff(newly_connected, newly_connected_count,
> +				 already_connected, already_connected_count,
> &diff); +
> +	if (diff_len =3D=3D 0) {

if (!diff_len)

...

> +	if (!unigraf_connector_name) {
> +		unigraf_hpd_deassert();
> +		unigraf_set_sst();
> +		unigraf_hpd_assert();
> +		sleep(1);

Why? Please add comment before sleep to understand why it is required.

> +		unigraf_autodetect_connector(drm_fd);
> +	}
> +
>  	unigraf_reset();
> =20
> -	return true;
> +	return unigraf_connector_name !=3D NULL;
>  }
> =20
>  /**
> @@ -362,6 +483,9 @@ void unigraf_reset(void)
>  	unigraf_plug();
>  	unigraf_set_mst_stream_count(1);
>  	unigraf_set_sst();
> +	unigraf_load_default_edid();
> +	unigraf_hpd_assert();
> +	sleep(1);

Same.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
