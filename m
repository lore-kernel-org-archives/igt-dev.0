Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700A710E458
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Apr 2022 12:08:12 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Date: Fri, 22 Apr 2022 12:08:10 +0000
Message-ID: <bc5f7d440229422fbb59c1403185e0fe@intel.com>
References: <20220418125048.7969-1-anshuman.gupta@intel.com>
 <20220418125048.7969-6-anshuman.gupta@intel.com> <YmKB5D9Y8FpX9VNN@intel.com>
In-Reply-To: <YmKB5D9Y8FpX9VNN@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/9] tools: Add intel_pm_rpm tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Friday, April 22, 2022 3:52 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Nilawar, Badal <badal.nilawar@intel.co=
m>
> Subject: Re: [igt-dev] [PATCH i-g-t 5/9] tools: Add intel_pm_rpm tool
>=20
> On Mon, Apr 18, 2022 at 06:20:44PM +0530, Anshuman Gupta wrote:
> > intel_pm_rpm tool is a debug tool. It can be use to setup and prepare
> > the gfx card to go to D3Cold.
> > It also provide the debug option to disable all display and prepare
> > device to enter to runtime suspend.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tools/intel_pm_rpm.c | 209
> +++++++++++++++++++++++++++++++++++++++++++
> >  tools/meson.build    |   1 +
> >  2 files changed, 210 insertions(+)
> >  create mode 100644 tools/intel_pm_rpm.c
> >
> > diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c new file mode
> > 100644 index 000000000..df9cfa632
> > --- /dev/null
> > +++ b/tools/intel_pm_rpm.c
> > @@ -0,0 +1,209 @@
> > +/*
> > + * Copyright (c) 2022 Intel Corporation
> > + *
> > + * Permission is hereby granted, free of charge, to any person
> > +obtaining a
> > + * copy of this software and associated documentation files (the
> > +"Software"),
> > + * to deal in the Software without restriction, including without
> > +limitation
> > + * the rights to use, copy, modify, merge, publish, distribute,
> > +sublicense,
> > + * and/or sell copies of the Software, and to permit persons to whom
> > +the
> > + * Software is furnished to do so, subject to the following conditions=
:
> > + *
> > + * The above copyright notice and this permission notice (including
> > +the next
> > + * paragraph) shall be included in all copies or substantial portions
> > +of the
> > + * Software.
> > + *
> > + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> > +EXPRESS OR
> > + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> > +MERCHANTABILITY,
> > + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO
> EVENT
> > +SHALL
> > + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
> DAMAGES
> > +OR OTHER
> > + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> > +ARISING
> > + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> > +OTHER DEALINGS
> > + * IN THE SOFTWARE.
> > + *
> > + */
> > +
> > +#include <errno.h>
> > +#include <getopt.h>
> > +#include <glib.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <stdbool.h>
> > +#include "igt.h"
> > +#include "igt_device.h"
> > +#include "igt_device_scan.h"
> > +#include "igt_pm.h"
> > +
> > +typedef struct {
> > +	int drm_fd;
> > +	int debugfs_fd;
> > +	uint32_t devid;
> > +	drmModeResPtr res;
> > +	igt_display_t display;
> > +} data_t;
> > +
> > +const char *help_str =3D
> > +	"  --disable-display\t\tDisable all screen and try to go into runtime
> pm.\n"
> > +	"  --setup-d3cold\t\tPrepare dgfx gfx card to enter runtime D3Cold.\n=
"
> > +	"  --help\t\tProvide help. Provide card name with
> > +IGT_DEVICE=3Ddrm:/dev/dri/card*."; static struct option long_options[]=
 =3D {
> > +	{"disable-display", 0, 0, 'd'},
> > +	{"setup-d3cold", 0, 0, 's'},
> > +	{"help", 0, 0, 'h'},
> > +	{ 0, 0, 0, 0 }
> > +};
> > +
> > +const char *optstr =3D "dsh";
> > +
> > +static void usage(const char *name)
> > +{
> > +	igt_info("Usage: %s [options]\n", name);
> > +	igt_info("%s\n", help_str);
> > +}
> > +
> > +static void disable_all_displays(data_t *data) {
> > +	igt_output_t *output;
> > +
> > +	for (int i =3D 0; i < data->display.n_outputs; i++) {
> > +		output =3D &data->display.outputs[i];
> > +		igt_output_set_pipe(output, PIPE_NONE);
> > +		igt_display_commit(&data->display);
> > +	}
> > +}
> > +
> > +static void setup_gfx_card_d3cold(data_t *data) {
> > +	struct pci_device *root;
> > +	int d_state;
> > +
> > +	/* igfx does not support d3cold */
> > +	if (!IS_DGFX(data->devid))
> > +		return;
>=20
> I believe the if below will already take care of this since the real_powe=
r_state
> won't show up. However, let's keep this check here to be really clear on =
the
> expectations and to avoid navigating the tree in vain...
>=20
> > +
> > +	root =3D igt_device_get_pci_root_port(data->drm_fd);
> > +
> > +	if (!igt_pm_acpi_d3cold_supported(root)) {
> > +		igt_info("D3Cold isn't supported on Root port
> %04x:%02x:%02x.%01x\n",
> > +			 root->domain, root->bus, root->dev, root->func);
> > +		return;
> > +	}
> > +
> > +	disable_all_displays(data);
> > +	igt_pm_setup_pci_card_runtime_pm(root);
> > +	sleep(1);
> > +	d_state =3D igt_pm_get_acpi_real_d_state(root);
> > +
> > +	if (d_state =3D=3D IGT_ACPI_D3Cold) {
> > +		igt_info("D3Cold achieved for root port
> %04x:%02x:%02x.%01x\n",
> > +			 root->domain, root->bus, root->dev, root->func);
> > +	} else {
> > +		igt_pm_print_pci_card_runtime_status();
> > +		igt_info("D3Cold not achieved yet. Please monitor
> %04x:%02x:%02x.%01x real_power_state\n",
> > +			 root->domain, root->bus, root->dev, root->func);
> > +	}
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	bool disable_display =3D false, setup_d3cold =3D false;
> > +	struct igt_device_card card;
> > +	char *env_device =3D NULL;
> > +	int c, option_index =3D 0;
> > +	data_t data =3D {};
> > +	int ret =3D 0;
> > +
> > +	if (argc <=3D 1) {
> > +		usage(argv[0]);
> > +		return EXIT_SUCCESS;
> > +	}
> > +
> > +	env_device =3D getenv("IGT_DEVICE");
> > +	igt_devices_scan(false);
> > +
> > +	if (env_device) {
> > +		if (!igt_device_card_match(env_device, &card)) {
> > +			igt_warn("No device found for the env_device\n");
> > +			ret =3D EXIT_FAILURE;
> > +			goto exit;
> > +		}
> > +	} else {
> > +		if (!igt_device_find_first_i915_discrete_card(&card)) {
> > +			igt_warn("No discrete gpu found\n");
> > +			ret =3D EXIT_FAILURE;
> > +			goto exit;
> > +		}
> > +	}
> > +
> > +	while ((c =3D getopt_long(argc, argv, optstr,
> > +				long_options, &option_index)) !=3D -1) {
> > +		switch (c) {
> > +		case 'd':
> > +			disable_display =3D true;
> > +			break;
> > +		case 's':
> > +			setup_d3cold =3D true;
> > +			break;
> > +		default:
> > +		case 'h':
> > +			usage(argv[0]);
> > +			ret =3D EXIT_SUCCESS;
> > +			goto exit;
> > +		}
> > +	}
> > +
> > +	data.drm_fd =3D igt_open_card(&card);
> > +	if (data.drm_fd  >=3D 0) {
> > +		igt_info("Device %s successfully opened\n", card.card);
> > +	} else {
> > +		igt_warn("Cannot open card %s device\n", card.card);
> > +		ret =3D EXIT_FAILURE;
> > +		goto exit;
> > +	}
> > +
> > +	data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> > +	data.devid =3D intel_get_drm_devid(data.drm_fd);
> > +	igt_setup_runtime_pm(data.drm_fd);
> > +
> > +	data.res =3D drmModeGetResources(data.drm_fd);
> > +	if (data.res) {
> > +		kmstest_set_vt_graphics_mode();
> > +		igt_display_require(&data.display, data.drm_fd);
> > +
> > +		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
> > +			igt_warn("dmc fw is not loaded, no runtime pm\n");
> > +			ret =3D EXIT_FAILURE;
> > +			goto exit;
> > +		}
> > +	}
>=20
> Do we really need this? It is only for checking if DMC is there in case w=
e have
> display right?
> Should deserve a comment at least...
>=20
> but already can use my:
>=20
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Thanks for Review.
I will add below comment, with respect to https://cgit.freedesktop.org/drm-=
tip/tree/drivers/gpu/drm/i915/display/intel_dmc.c#n791.
/* i915 disables RPM in case DMC is not loaded on display supported cards *=
/
Br,
Anshuman Gupta
>=20
> if explained with reply here or with comment if you see it fits
>=20
> > +
> > +	if (disable_display) {
> > +		disable_all_displays(&data);
> > +		if
> (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> > +			__igt_debugfs_dump(data.drm_fd,
> "i915_runtime_pm_status", IGT_LOG_INFO);
> > +			ret =3D EXIT_FAILURE;
> > +			goto exit;
> > +		}
> > +
> > +		igt_info("Device runtime suspended, Useful for debugging.\n"
> > +			 "Hit CTRL-C to exit\n");
> > +		/* Don't return useful for debugging */
> > +		while (1)
> > +			sleep(600);
> > +	}
> > +
> > +	if (setup_d3cold)
> > +		setup_gfx_card_d3cold(&data);
> > +
> > +exit:
> > +	igt_restore_runtime_pm();
> > +
> > +	if (data.res)
> > +		igt_display_fini(&data.display);
> > +
> > +	close(data.debugfs_fd);
> > +	close(data.drm_fd);
> > +	igt_devices_free();
> > +
> > +	return ret;
> > +}
> > diff --git a/tools/meson.build b/tools/meson.build index
> > 771d0b9e3..24d0ea714 100644
> > --- a/tools/meson.build
> > +++ b/tools/meson.build
> > @@ -28,6 +28,7 @@ tools_progs =3D [
> >  	'intel_lid',
> >  	'intel_opregion_decode',
> >  	'intel_panel_fitter',
> > +	'intel_pm_rpm',
> >  	'intel_reg_checker',
> >  	'intel_residency',
> >  	'intel_stepping',
> > --
> > 2.26.2
> >
