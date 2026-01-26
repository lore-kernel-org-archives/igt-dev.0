Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F951CF65DB
	for <igt-dev@archiver.kernel.org>; Mon, 26 Jan 2026 12:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8473B10E405;
	Mon, 26 Jan 2026 12:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DSMSWaKY";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF6D10E405
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jan 2026 12:00:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 7E2084E42297;
 Mon, 26 Jan 2026 12:00:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 401EC60717;
 Mon, 26 Jan 2026 12:00:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F3A3C119A80E2; Mon, 26 Jan 2026 13:00:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769428803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Zaxb0qdD3QOXu/6o/ofrRQC9b9La7/oPq8tQK1abLQw=;
 b=DSMSWaKYjv6Dr+tP/Y66nFOUHww2WAcsV07OZuXcS5AInm4EvtAs6fUceMI7mDGxjoEQGi
 rB+RuaRNPawBYZ7VcS0fhfdd1t/8HpPDEpClw4BQvSGq37OHQfp+WDlyacGlWRVvRt5ip9
 Et3qMC3HkhA+64cROz+Ht9tVgbdl6EUsPdKJOUWNOg+WtqDq9+ayJiubKC2URMcc/tlx/Y
 z2guJ6tUcvviepO8d836FqDIFHvVSS3GmcMgQcfQR0EQ///eFCxBB9wZeT5gUsd2fW0nDb
 DBeHVr8l9rY1P29Ju/CffXoTThMYyCjnCrscz/qoh8M/9ituwwJYciiX2SFKIQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Jan 2026 13:00:01 +0100
Message-Id: <DFYI5TJ00BEZ.HCPELZ9X41TV@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH i-g-t v4 30/46] tests/unigraf: Add basic unigraf tests
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-30-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-30-0fc7bb1b4101@bootlin.com>
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

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> Adds two tests to validate unigraf communication.
>
> unigraf-connected checks if the device is connected and if the EDID is
> properly applied.
>
> ungiraf-disconnect checks if the device can be connected/reconnected usin=
g
> SST and MST configurations.

Nit: why not using the same verb tense for the tewo tests? Either both
imperative ("connect" and "disconnect") or both past participle
("connected" and "disconnected"). Perhaps the imperative is better unless
there are different conventions in IGT.

> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: MIT
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
> + * SUBTEST: unigraf-open
> + * Description: Make sure that a unigraf device can be accessed
> + *
> + * SUBTEST: unigraf-connected
> + * Description: Make sure that the unigraf device is connected to the DU=
T

The "unigraf-open" test does not exist, and you missed the
"unigraf-disconnect[ed]" test.

> +IGT_TEST_DESCRIPTION("Test basic unigraf connectivity");
> +igt_main
> +{
> +	int drm_fd;
> +
> +	igt_fixture {
> +		drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device is connected to the DUT=
");
> +	igt_subtest("unigraf-connected") {
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
> +
> +		unigraf_edid =3D unigraf_read_edid(0, &unigraf_edid_len);
> +
> +		for_each_connected_output(&display, output) {
> +			if (output->config.connector->connector_type =3D=3D
> +			    DRM_MODE_CONNECTOR_DisplayPort) {
> +				igt_assert(kmstest_get_property(drm_fd,
> +								output->config.connector->connector_id,
> +								DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +								NULL, &edid_blob_id, NULL));
> +				edid_blob =3D drmModeGetPropertyBlob(drm_fd, edid_blob_id);
> +				if (!edid_blob)
> +					continue;
> +
> +				found |=3D memcmp(unigraf_edid, edid_blob->data,
> +						min(edid_blob->length, unigraf_edid_len)) =3D=3D 0;

Even though it would work, using a bitwise OR is strange here. @found is
not really a bitmask, and the =3D=3D operator does not return one. I'd use =
a
more intuitive form:

				if (memcmp(...) =3D=3D 0)
					  found =3D true;

> +
> +				drmModeFreePropertyBlob(edid_blob);

Why not breaking the loop when found?

	if (found)
		break;

> +			}
> +		}
> +		igt_assert_f(found, "No output with the correct EDID was found\n");
> +
> +		free(unigraf_edid);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device can be deconnected/reco=
nnected");
                                                               disconnected

> +	igt_subtest("ungiraf-disconnect") {
> +		int newly_connected_count, already_connected_count, diff_len;
> +		uint32_t *newly_connected =3D NULL, *already_connected =3D NULL, *diff=
 =3D NULL;
> +		int max_count;
> +
> +		unigraf_require_device(drm_fd);
> +		max_count =3D unigraf_get_mst_stream_max_count();
> +
> +		unigraf_hpd_deassert();
> +
> +		already_connected_count =3D igt_get_connected_connectors(drm_fd, &alre=
ady_connected);
> +
> +		igt_debug("Already connected count: %d\n", already_connected_count);
> +
> +		// i =3D 0 is SST

If I got what you mean with this comment, I'd clarify it as:

		// i =3D 0 is SST so we need to process max_count + 1 streams

Otherwise looks good.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
