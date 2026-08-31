Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A869C624A5
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 07:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221FF10E5E4;
	Mon, 31 Aug 2026 07:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbrE/YYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3873210E61A
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 07:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788160363; x=1819696363;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=4asLm7OLZpX6Mdq73/iqEfgJM4/3vVoAN1KziCT7SV4=;
 b=NbrE/YYgLzVg7H3IWYZtI52pM4EYHR/3T9+rdiFISegzAwRS7U3BgJpu
 Mww1suOIA+xPg/e4e7D+P7QjAXPNp/RjwbHQscm8dhwLFyXdczEvs+yqP
 H/iuaHadiuDr/TQpjDA4WxAbW2K1wpigXirUR2vZF4ES6bBZ8twb4wZrJ
 Y5Wh7qd6d1RmZ4oAcgQoN0jC/8D5vRVBugv9USCsnam8wvA1rU7qdlR16
 LHg3EE9QWhU6pHOFnkRHSpiMiroSdK6di98FOIPhNYEaU0gBdoM3Aiqm6
 x46fyXi8U0dXSjn5u6eJCu5Og7WkFHPQm+Lvr3MgpLqMqIARSS9h1cn0U w==;
X-CSE-ConnectionGUID: snLjljJFQ7y7ju7xyyzV4Q==
X-CSE-MsgGUID: IkVzTgEwT+CuxsigUJYmUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92425164"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92425164"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:12:42 -0700
X-CSE-ConnectionGUID: uT/Y82OdSfaIQZQ0p2XfZA==
X-CSE-MsgGUID: wkbPjmk1SQeYwxxxjLLDPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="264983227"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:12:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_warm_boot: Add warm reboot test
In-Reply-To: <20260827015110.2426-1-mohammed.thasleem@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210114344.1535-1-mohammed.thasleem@intel.com>
 <20260827015110.2426-1-mohammed.thasleem@intel.com>
Date: Mon, 31 Aug 2026 10:12:38 +0300
Message-ID: <16f1dfc2c69c5100d7c54c90b5012f5a96f9d85c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 27 Aug 2026, Mohammed Thasleem <mohammed.thasleem@intel.com> wrote:
> This test validates display subsystem stability across warm reboot by
> capturing baseline display parameters (outputs, pipes, connectors, modes)
> before reboot and comparing them after reboot.

I think you need to be more elaborate than that. What does "stability
across warm reboot" mean? What is the goal here, and how does the
capture/compare achieve that goal?

>
>  1. Run pre-reboot test to save baseline.
>  2. Perform manual system reboot.

So there's no point in making this a test that gets run in CI?

>  3. Run post-reboot test to validate display parameters match baseline
>
> v2: Replace each_pipe_with_valid_output with for_each_valid_output_on_crt=
c.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_warm_boot.c | 202 +++++++++++++++++++++++++++++++++

Why intel specific?

>  tests/meson.build              |   1 +
>  2 files changed, 203 insertions(+)
>  create mode 100644 tests/intel/kms_pm_warm_boot.c
>
> diff --git a/tests/intel/kms_pm_warm_boot.c b/tests/intel/kms_pm_warm_boo=
t.c
> new file mode 100644
> index 000000000..d50656b91
> --- /dev/null
> +++ b/tests/intel/kms_pm_warm_boot.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms pm warm reboot
> + * Category: Display
> + * Description: This test validates warm reboot.
> + * Driver requirement: xe
> + * Mega feature: Display Power Management
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include <unistd.h>
> +#include <string.h>
> +#include <errno.h>
> +
> +#define PARAM_FILE "/var/tmp/igt_warm_reboot_params.txt"

This is not a great way to manage temp files.

> +#define BUF_SIZE 1024
> +
> +/**
> + * SUBTEST: warm-reboot-before
> + * Description: Save baseline display parameters before warm reboot.
> + *
> + * SUBTEST: warm-reboot-after
> + * Description: Validate display parameters after warm reboot.
> + *
> + */
> +
> +IGT_TEST_DESCRIPTION("This test validates warm reboot");

It really is an anti-pattern to have "This test validates" in test
descriptions. I see it elsewhere too, and it gets copy-pasted. Obviously
each test validates something.

> +
> +typedef struct {
> +	int fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb_test;
> +	enum pipe pipe;
> +} device_t;
> +
> +static void detect_primary_output(device_t *device)
> +{
> +	igt_output_t *output;
> +	igt_crtc_t *crtc;
> +	enum pipe pipe;
> +
> +	for_each_crtc(&device->display, crtc) {
> +		pipe =3D crtc->pipe;
> +		for_each_valid_output_on_crtc(&device->display, crtc, output) {
> +
> +			igt_display_reset(&device->display);
> +
> +			igt_output_set_crtc(output, igt_crtc_for_pipe(&device->display, pipe)=
);

You already have the crtc, there's no point in this crtc->pipe->crtc
dance.

> +			if (!intel_pipe_output_combo_valid(&device->display))
> +				continue;
> +
> +			device->output =3D output;
> +			device->mode =3D igt_output_get_mode(output);
> +			device->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_=
PRIMARY);
> +			device->pipe =3D pipe;

If you need to store something, store the crtc pointer, not the pipe.

> +
> +			break;
> +		}
> +	}
> +
> +	igt_require_f(device->output && device->mode, "No valid connected outpu=
t found\n");
> +}
> +
> +static void setup_primary(device_t *device)
> +{
> +	igt_plane_set_fb(device->primary, NULL);
> +
> +	igt_create_color_fb(device->fd,
> +			    device->mode->hdisplay,
> +			    device->mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.2, 0.3, 0.4,
> +			    &device->fb_test);
> +
> +	igt_plane_set_fb(device->primary, &device->fb_test);
> +	igt_display_commit(&device->display);
> +}
> +
> +static void save_baseline(device_t *device)
> +{
> +	int conn_type =3D -1;
> +	const char *conn_type_name =3D "unknown";
> +	FILE *fp =3D fopen(PARAM_FILE, "w");
> +
> +	igt_require_f(fp, "Unable to open param file for writing\n");
> +
> +	if (device->output->config.connector) {
> +		conn_type =3D device->output->config.connector->connector_type;
> +		conn_type_name =3D kmstest_connector_type_str(conn_type);
> +	}
> +
> +	fprintf(fp, "n_outputs=3D%d\n", device->display.n_outputs);
> +	fprintf(fp, "pipe=3D%d conn_id=3D%u type=3D%d(%s) mode=3D%dx%d@%d\n",
> +		device->pipe,

Pipe is an Intel thing, this should really use the CRTC index.

> +		device->output->config.connector ?
> +			device->output->config.connector->connector_id : 0,
> +		conn_type, conn_type_name,
> +		device->mode->hdisplay, device->mode->vdisplay,
> +		device->mode->vrefresh);
> +
> +	fclose(fp);
> +}
> +
> +static void collect_current(device_t *device, char *buf, size_t sz)
> +{
> +	int conn_type =3D -1, ret;
> +	const char *conn_type_name =3D "unknown";
> +	uint32_t conn_id =3D 0;
> +
> +	if (device->output->config.connector) {
> +		conn_type =3D device->output->config.connector->connector_type;
> +		conn_id =3D device->output->config.connector->connector_id;
> +		conn_type_name =3D kmstest_connector_type_str(conn_type);
> +	}
> +
> +
> +	/* Write display basic config details */
> +	ret =3D snprintf(buf, sz,
> +		       "n_outputs=3D%d\n"
> +		       "pipe=3D%d conn_id=3D%u type=3D%d(%s) mode=3D%dx%d@%d\n",
> +		       device->display.n_outputs,
> +		       device->pipe,
> +		       conn_id,
> +		       conn_type, conn_type_name,
> +		       device->mode->hdisplay,
> +		       device->mode->vdisplay,
> +		       device->mode->vrefresh);
> +
> +	if (ret < 0 || (size_t)ret >=3D sz)
> +		igt_warn("%s(): buffer truncated\n", __func__);
> +}
> +
> +static void read_baseline(char *buf, size_t sz)
> +{
> +	FILE *fp =3D fopen(PARAM_FILE, "r");
> +
> +	igt_require_f(fp, "Baseline missing. Run first time to create.\n");
> +
> +	fread(buf, 1, sz - 1, fp);
> +	buf[sz - 1] =3D '\0';
> +	fclose(fp);
> +}
> +
> +static void cleanup(device_t *device)
> +{
> +	igt_plane_set_fb(device->primary, NULL);
> +	igt_display_commit(&device->display);
> +	igt_remove_fb(device->fd, &device->fb_test);
> +}
> +
> +int igt_main(void)
> +{
> +	device_t device =3D {0};
> +	char saved[BUF_SIZE] =3D {0};
> +	char current[BUF_SIZE] =3D {0};
> +
> +	igt_fixture() {
> +		device.fd =3D drm_open_driver_master(DRIVER_ANY);
> +		igt_require(device.fd >=3D 0);
> +
> +		igt_display_require(&device.display, device.fd);
> +	}
> +
> +	igt_subtest("warm-reboot-before") {
> +		detect_primary_output(&device);
> +		setup_primary(&device);
> +		collect_current(&device, current, sizeof(current));
> +
> +		if (access(PARAM_FILE, F_OK) =3D=3D -1)
> +			save_baseline(&device);

So only save it when the file doesn't already exist?

> +
> +		cleanup(&device);
> +	}
> +
> +	igt_subtest("warm-reboot-after") {
> +		detect_primary_output(&device);
> +		setup_primary(&device);
> +		collect_current(&device, current, sizeof(current));
> +		read_baseline(saved, sizeof(saved));
> +
> +		igt_assert_f(strcmp(saved, current) =3D=3D 0, "Display parameters mism=
atched.\n");

I don't yet understand the idea of the test, really, but if there's a
mismatch, this is going to be incredibly unhelpful output for debugging
anything.

> +
> +		if (strcmp(saved, current) =3D=3D 0)
> +			remove(PARAM_FILE);

Only remove it when the comparison succeeded.

IOW, if there's a mismatch, for whatever reason, this test will never
recover on its own due to the non-overwrite and non-remove policies, and
will need a manual intervention?

> +
> +		cleanup(&device);
> +	}
> +
> +	igt_fixture() {
> +		igt_display_fini(&device.display);
> +		drm_close_driver(device.fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..084280081 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -271,6 +271,7 @@ intel_kms_progs =3D [
>  	'kms_pm_backlight',
>  	'kms_pm_dc',
>  	'kms_pm_lpsp',
> +        'kms_pm_warm_boot',
>  	'kms_pm_rpm',
>  	'kms_psr',
>  	'kms_psr2_sf',

--=20
Jani Nikula, Intel
