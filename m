Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006EBF588F2
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 16:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BE210E0C6;
	Mon, 20 Apr 2026 16:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="iBqXY+ou";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2C110E0C6
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 16:49:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 757C24E42A74;
 Mon, 20 Apr 2026 16:49:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4CBFC5FFA5;
 Mon, 20 Apr 2026 16:49:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C10410460A04; 
 Mon, 20 Apr 2026 18:49:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1776703793; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=I8EeMuNiVE21WaW4b/FVtIcH+sn+qJeo3X1auKYi8rI=;
 b=iBqXY+oubTLAknKXXOgHVpN6bXlzR2/AF4CMdXpIo1ROvtZXZu2nghwuvM7+7NB5VYysq0
 pejJcCf0HeDHWnBkAjQWp9iWNZm18ORr3e43Ch+Fxw3K9x9lL46ufDt7i1TDvQxtMdA7EZ
 kycPUuoy1reswReb7xOjkVSIjj61gB18px4vXAvh2U+B9lgfhlNfp0m8ZyvnXq3V6t+Vwk
 SUa2Ic36mQVqPkcjsqRd+C8/rpi4rD9BLV8aUmQaZAaCs2wZjMPZS2FTgyRZtDru1ccT+7
 HQmGw9Aj7ltFXQvv/0ixgOqSOQc+e64YV7AG2YStiXcSpZ9IrCDwqlRErmPUig==
Date: Mon, 20 Apr 2026 18:49:51 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, markyacoub@google.com,
 khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v10 31/49] tests/unigraf: Add basic unigraf tests
Message-ID: <20260420184951.0adfd89c@kmaincent-XPS-13-7390>
In-Reply-To: <20260331-unigraf-integration-v10-31-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
 <20260331-unigraf-integration-v10-31-12266c34cc1d@bootlin.com>
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

On Tue, 31 Mar 2026 19:11:48 +0200
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Adds two tests to validate unigraf communication.
>=20
> unigraf-connect checks if the device is connected and if the EDID is
> properly applied.
>=20
> ungiraf-reconnect checks if the device can be connected/reconnected
> using SST and MST configurations.
>=20

Only nitpicking here.

With these fixed you can add my Rd-by.

...

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
> +		unigraf_set_sst();
> +		unigraf_hpd_assert();
> +		sleep(igt_default_display_detect_timeout());
> +		igt_display_require(&display, drm_fd);
> +		sleep(igt_default_display_detect_timeout());
> +
> +		unigraf_edid =3D unigraf_read_edid(0, &unigraf_edid_len);
> +
> +		for_each_connected_output(&display, output) {
> +			if (output->config.connector->connector_type =3D=3D
> +			    DRM_MODE_CONNECTOR_DisplayPort) {

Will there be other connector type check added in the future?
Else you could simply do:=20
if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_Displa=
yPort)
	continue;

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

/* ... */
I don't know the igt rules but in kernel /* ... */ is preferable.

> +		for (int i =3D 0; i <=3D max_count; i++) {
> +			unigraf_hpd_deassert();
> +			// Let the hardware detect the new state

Same.

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

Same

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
