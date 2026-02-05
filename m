Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C336ECD994
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 17:55:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D148A10E8DB;
	Thu,  5 Feb 2026 17:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="sjjPuK4n";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5A410E8DB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 17:55:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B82874E42424;
 Thu,  5 Feb 2026 17:55:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 68D786074D;
 Thu,  5 Feb 2026 17:55:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C4D18102F1B6D; Thu,  5 Feb 2026 18:55:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770314146; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=T9rQpq0dIjbaI5V+mmp+x15OKa6CbnBxqOGD0oylgBU=;
 b=sjjPuK4nltzmySDiBYM3XX3VmfU1IW5lsoGfbHMD8WEFiiDZUqaCbHs5D/ZdhBA9iWFRwu
 QEitnSkN1KLZjVtS3HDKBLn2YYNq7XVsfEs3Tj7qfpCqlXSmiurVjwAwoVIfObkIxaulG7
 nyMTPWPdgQDirZH+f3BbOqeVjtSXdMNLu+lUTxvg5b81rMWzodQEmofxcakjhqK3g9htXa
 Jcr4nR/460UNEu+Ztm0KfylckRx3nYgdoPt67CH574dTpv8nGfA7ctRWz6qDU3s8cJkX8s
 vf13siMmY0/cKZ99Yx1SJsntZIKpf4ScdKvcpGBV3nr3oox7Vvjz3tE26ozHqA==
Date: Thu, 5 Feb 2026 18:55:44 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v6 30/48] tests/unigraf: Add basic unigraf tests
Message-ID: <20260205185544.41e93475@kmaincent-XPS-13-7390>
In-Reply-To: <20260202-unigraf-integration-v6-30-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
 <20260202-unigraf-integration-v6-30-834af822eee7@bootlin.com>
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

On Mon, 02 Feb 2026 15:33:09 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Adds two tests to validate unigraf communication.
>=20
> unigraf-connect checks if the device is connected and if the EDID is
> properly applied.
>=20
> ungiraf-reconnect checks if the device can be connected/reconnected
> using SST and MST configurations.

...

> diff --git a/tests/unigraf/unigraf_connectivity.c
> b/tests/unigraf/unigraf_connectivity.c new file mode 100644
> index 000000000000..be7c428a63fc
> --- /dev/null
> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT

Copyright?

> +
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <xf86drmMode.h>
> +
> +#include "drmtest.h"
> +#include "igt_aux.h"
> +#include "igt_core.h"
> +#include "igt_kms.h"
> +#include "unigraf/unigraf.h"
> +
> +/**
> + * TEST: unigraf connectivity
> + * Category: Core
> + * Description: Testing connectivity with a unigraf device
> + *
> + * SUBTEST: unigraf-connect-edid
> + * Description: Verify that the unigraf device is properly connected to =
the
> DUT
> + *              and that the correct EDID is detected and read.
> + *
> + * SUBTEST: unigraf-connect-mst
> + * Description: Ensure that the DUT can correctly detect and handle the
> unigraf device
> + *              when it is configured to operate in MST mode.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
> +int igt_main()
> +{
> +	int drm_fd;
> +
> +	igt_fixture() {
> +		drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device is connected to the
> DUT and EDID is properly detected");
> +	igt_subtest("unigraf-connect-edid") {
> +		drmModePropertyBlobPtr edid_blob =3D NULL;
> +		struct igt_display display;
> +		uint64_t edid_blob_id;
> +		igt_output_t *output;
> +		uint32_t unigraf_edid_len;
> +		void *unigraf_edid;
> +		bool found =3D false;
> +
> +		unigraf_require_device(drm_fd);
> +		unigraf_hpd_deassert();
> +		sleep(1);
> +		unigraf_set_sst();
> +		unigraf_hpd_assert();
> +
> +		sleep(5);
> +
> +		igt_display_require(&display, drm_fd);
> +		sleep(5);

Please add a comment to explain the sleep.

> +
> +		unigraf_edid =3D unigraf_read_edid(0, &unigraf_edid_len);
> +
> +		for_each_connected_output(&display, output) {
> +			if (output->config.connector->connector_type =3D=3D
> +			    DRM_MODE_CONNECTOR_DisplayPort) {
> +				igt_assert(kmstest_get_property(drm_fd,
> +
> output->config.connector->connector_id,
> +
> DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +								NULL,
> &edid_blob_id, NULL));
> +				edid_blob =3D drmModeGetPropertyBlob(drm_fd,
> edid_blob_id);
> +				if (!edid_blob)
> +					continue;
> +
> +				if (memcmp(unigraf_edid, edid_blob->data,
> +					   min(edid_blob->length,
> unigraf_edid_len)) =3D=3D 0)

if (!memcmp(...))

> +					found =3D true;
> +
> +				drmModeFreePropertyBlob(edid_blob);
> +
> +				if (found)
> +					break;
> +			}
> +		}
> +		igt_assert_f(found, "No output with the correct EDID was
> found\n"); +

I think you could change the code to remove the "found" flag. It adds a lev=
el of
complexity which could be avoided.

> +		free(unigraf_edid);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device can be used as a MST
> device");
> +	igt_subtest("ungiraf-connect-mst") {
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
> +
> +			sleep(1);
> +			unigraf_set_mst_stream_count(max(i, 1));
> +			if (i =3D=3D 0)

if (!i)

> +				unigraf_set_sst();
> +			else
> +				unigraf_set_mst();
> +
> +			unigraf_hpd_assert();
> +
> +			sleep(5);

Comment?

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
