Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43B0E83068
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 08:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A7B10E570;
	Tue,  3 Feb 2026 08:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="0d1FcB56";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72EE910E4E5
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:51:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3893E4E423CA
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:51:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0F4E860767;
 Mon,  2 Feb 2026 14:51:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 075C8119A8891; Mon,  2 Feb 2026 15:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770043904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=S4u3JCNFUB3KW3t+vOACW9qGIlz0jfPDQnnKmbmVbUU=;
 b=0d1FcB561Wy1u2YY5FHh08E82A7ZGpBhzq5TLUyuf4FEIeRjGnLvIP529cYqJarPyIk5GS
 7bH0Q7SjTNf6JrfTy4i1MB4mfW+d7s4NWp5PL96zVWPTkhzvLCElDBWR7JfgtMzq8ojR5C
 ytVMRnQN8PI4KLVsSaTZiW0u0WSh9oQTkxzgIAoHN55Gfwj2e1V20i9r5qYH6bXr6iEbqQ
 eDgZMgwP0OLwQjbcZuW1n4osGcdl/ZIPeoEAEXQoccQb/fXWOClKmz4UGN3agSYN1gtDon
 SN2thyWKAznameas040ErAQMRlLIiCF++NkYywTVUu/JM9FQapeB4NBhA1j58A==
Date: Mon, 2 Feb 2026 15:51:41 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 01/48] lib/igt_kms: Add a detect timeout value
Message-ID: <20260202155141.2ccb634a@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-1-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-1-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:32:40 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  lib/igt_core.c |  4 ++++
>  lib/igt_kms.c  | 35 +++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h  |  9 +++++++++
>  3 files changed, 48 insertions(+)
>=20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ee670a41a91..da2453cc1028 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -271,6 +271,10 @@
>   *	&num; It is not mandatory and allows overriding default values.
>   *	[DUT]
>   *	SuspendResumeDelay=3D10
> + *
> + *	&num; The following option define the timeout for detection feature
> + *	&num; (waiting for a connector status)
> + *	DisplayDetectTimeout=3D10.0

I am new to igt tools but it would be nice to have the timeout unit describ=
ed
here.

...

> +
> +/**
> + * igt_default_display_detect_timeout:
> + *
> + * Get the default timeout value for detection feature
> + *
> + * Some tests requires to wait for a specific connector status. This val=
ue
> will determine the
> + * timeout value for this waiting.
> + */
> +double igt_default_display_detect_timeout(void)
> +{
> +	static double timeout =3D 0.0;
> +	static bool first_call =3D true;
> +	GError *error =3D NULL;
> +
> +	if (first_call) {
> +		if (igt_key_file) {
> +			timeout =3D g_key_file_get_double(igt_key_file, "DUT",
> "DisplayDetectTimeout",
> +							&error);
> +			if (error) {
> +				igt_debug("Failed to read
> DisplayDetectTimeout, defaulting to %f\n",
> +					  DEFAULT_DETECT_TIMEOUT);
> +				g_clear_error(&error);
> +				timeout =3D DEFAULT_DETECT_TIMEOUT;
> +			}
> +		} else {
> +			timeout =3D DEFAULT_DETECT_TIMEOUT;
> +		}
> +
> +		first_call =3D false;
> +	}
> +
> +	return timeout;
> +}

The function common_init_config() is managing the parsing of the igt config.
You should use it to parse this new config instead of adding a new function.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
