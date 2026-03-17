Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34D2FED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 15:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7920810E6CA;
	Tue, 17 Mar 2026 15:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XnBDxJcS";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C3110E62E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:46:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9B63FC5505C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 15:46:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7AB2C5FC9A;
 Tue, 17 Mar 2026 15:46:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A685810450603; Tue, 17 Mar 2026 16:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773762379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5RXeZYgKTcJjtFzXbjljx94T2I8VTgzrbdwNYV9oQJ4=;
 b=XnBDxJcS09BbrfHgyvgQoE9SV2y23E9v7M0ZVGcOYXEtbEEVGV/3EuYQnYND9p9jIZ+VGW
 Zisb/Pg16hc3rtI1/CU2lgGjyaK89J2zmiXVymFIg8ly+sejww4u1nn3WApOFmbUEqB0IR
 aYXo0iEWgrXwkL9hk0C12Ki5gxKJ7twxmaN/2rvca5VtuQm6IrIOYE9tzUNA3vJLD+4Ps1
 J4csnsh1QlfXPpcpDl/wI08xp2l+MPxZHNeCgZ3Wssi7jkMhv54VpBKZthOko1k7pPTMBk
 X8RyM9s+59F7h88jpL4b3fKtMwwQDro/oy0M1mGqjXOI4n3r6d8Hkn8wXNEsxw==
Date: Tue, 17 Mar 2026 16:46:16 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 31/49] tests/unigraf: Add basic unigraf tests
Message-ID: <20260317164616.1ec0f5a3@kmaincent-XPS-13-7390>
In-Reply-To: <20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-31-a01dffc3b0cb@bootlin.com>
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

On Mon, 16 Mar 2026 17:17:52 +0100
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
>  tests/meson.build                    |   4 +
>  tests/unigraf/meson.build            |  12 +++
>  tests/unigraf/unigraf_connectivity.c | 138
> +++++++++++++++++++++++++++++++++++ 3 files changed, 154 insertions(+)
>=20
> diff --git a/tests/meson.build b/tests/meson.build
> index cecb4a8ae34a..4d3399d0eff4 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -475,6 +475,10 @@ foreach prog : intel_progs
>  	endif
>  endforeach
> =20
> +if libtsi.found()
> +	subdir('unigraf')
> +endif
> +
>  if chamelium.found()
>  	foreach prog : chamelium_progs
>  		testexe =3D executable(prog,
> diff --git a/tests/unigraf/meson.build b/tests/unigraf/meson.build
> new file mode 100644
> index 000000000000..4ef8c32151e4
> --- /dev/null
> +++ b/tests/unigraf/meson.build
> @@ -0,0 +1,12 @@
> +unigraf_progs =3D [
> +	'unigraf_connectivity',
> +]
> +
> +foreach prog : unigraf_progs
> +	test_executables +=3D executable(prog, prog + '.c',
> +				       dependencies : test_deps,
> +				       install_dir : unigrafdir,
> +				       install_rpath : unigraf_rpathdir,
> +				       install : true)
> +	test_list +=3D join_paths('unigraf', prog)
> +endforeach
> diff --git a/tests/unigraf/unigraf_connectivity.c
> b/tests/unigraf/unigraf_connectivity.c new file mode 100644
> index 000000000000..b35149a4de9a
> --- /dev/null
> +++ b/tests/unigraf/unigraf_connectivity.c
> @@ -0,0 +1,138 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Google
> + *
> + * Authors:
> + *   Louis Chauvet <louis.chauvet@bootlin.com>
> + */
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
> +		/*
> +		 * Sleep are required to allow hardware to configure/detect
> the current
> +		 * configuration
> +		 */
> +		unigraf_require_device(drm_fd);
> +		unigraf_hpd_deassert();
> +		sleep(igt_default_display_detect_timeout());

The default display detect timeout is 10 second so you are waiting 10s here?

> +		unigraf_set_sst();
> +		unigraf_hpd_assert();
> +		sleep(igt_default_display_detect_timeout());

10 more seconds?

> +		igt_display_require(&display, drm_fd);
> +		sleep(igt_default_display_detect_timeout());

again!

Does the hardware so slow that it need 30s to configure and detect the
configuration?

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
> +				if (!memcmp(unigraf_edid, edid_blob->data,
> +					    min(edid_blob->length,
> unigraf_edid_len)))
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
> +		free(unigraf_edid);
> +	}
> +
> +	igt_describe("Make sure that the unigraf device can be used as a MST
> device");
> +	igt_subtest("unigraf-connect-mst") {
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

10s?

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

10s?

> +
> +			newly_connected_count =3D
> kms_wait_for_new_connectors(&newly_connected,
> +
> already_connected,
> +
> already_connected_count,
> +
> drm_fd); +
> +			diff_len =3D get_array_diff(newly_connected,
> newly_connected_count,
> +						  already_connected,
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
