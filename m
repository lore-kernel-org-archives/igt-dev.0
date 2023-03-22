Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CE1D10E925
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 12:24:31 +0000 (UTC)
Date: Wed, 22 Mar 2023 13:24:27 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <20230322132427.4c3c209f@maurocar-mobl2>
In-Reply-To: <20230322120628.z524vkuhfauujdxx@kamilkon-desk1>
References: <20230321144614.1676419-1-mauro.chehab@linux.intel.com>
 <20230321144614.1676419-3-mauro.chehab@linux.intel.com>
 <20230322120628.z524vkuhfauujdxx@kamilkon-desk1>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] xe/xe_module_load: add a test to
 load/unload Xe driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 22 Mar 2023 13:06:28 +0100
Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:

> Hi Mauro,
>=20
> On 2023-03-21 at 15:46:14 +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >=20
> > This is helpful to allow IGT to check if there are issues
> > during module load/unload.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  tests/intel-ci/xe-fast-feedback.testlist |   3 +
> >  tests/meson.build                        |   1 +
> >  tests/xe/xe_module_load.c                | 163 +++++++++++++++++++++++
> >  3 files changed, 167 insertions(+)
> >  create mode 100644 tests/xe/xe_module_load.c
> >=20
> > diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/=
xe-fast-feedback.testlist
> > index 6525b1676b6f..3140d648833a 100644
> > --- a/tests/intel-ci/xe-fast-feedback.testlist
> > +++ b/tests/intel-ci/xe-fast-feedback.testlist
> > @@ -1,3 +1,6 @@
> > +# Should be the first test
> > +igt@xe_module_load@force-load
> > +
> >  igt@xe_compute@compute-square
> >  igt@xe_debugfs@base
> >  igt@xe_debugfs@gt
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 632e36e059d8..f9fef103a736 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -256,6 +256,7 @@ xe_progs =3D [
> >  	'xe_huc_copy',
> >  	'xe_mmap',
> >  	'xe_mmio',
> > +	'xe_module_load',
> >  	'xe_pm',
> >  	'xe_prime_self_import',
> >  	'xe_query',
> > diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
> > new file mode 100644
> > index 000000000000..00302be561c1
> > --- /dev/null
> > +++ b/tests/xe/xe_module_load.c
> > @@ -0,0 +1,163 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright =C2=A9 2023 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: Tests the xe module loading
> > + * Category: Sofware building block
> > + * Sub-category: driver
> > + * Test category: functionality test
> > + */
> > +
> > +#include "igt.h"
> ------------ ^
> Move this after system includes.
>=20
> > +#include <dirent.h>
> > +#include <sys/utsname.h>
> > +#ifdef __linux__
> > +#include <linux/limits.h>
> > +#endif
> > +#include <signal.h>
> ------------ ^
> > +#include <libgen.h>
> > +#include <signal.h>
> ------------ ^
> Duplicated.
>=20
> > +#include <sys/ioctl.h>
> > +#include <fcntl.h>
>=20
> Consider sorting system include aplhabetically.
>=20
> > +
> > +#include "igt_debugfs.h"
> > +#include "igt_aux.h"
> > +#include "igt_kmod.h"
> > +#include "igt_sysfs.h"
> > +#include "igt_core.h"
>=20
> These also may be sorted.

Ok.

>=20
> Please add global description here, for example:
>=20
> IGT_TEST_DESCRIPTION("Check Xe module loading.");

With regards to IGT documentation, it is provided already, via the
comments, which, in turn, already produces documentation:

> > +/**
> > + * TEST: Tests the xe module loading
> > + * Category: Sofware building block
> > + * Sub-category: driver
> > + * Test category: functionality test
> > + */

Which is more complete than what IGT_TEST_DESCRIPTION() would allow.

IMO, keeping both will just duplicate information for no good reason,
and it makes harder to maintain, as the same descriptions will be on
two parts of the test file.

> > +
> > +#define BAR_SIZE_SHIFT 20
> > +#define MIN_BAR_SIZE 256
> > +
> > +static void
> > +hda_dynamic_debug(bool enable)
>=20
> Please write it on one line:
>=20
> static void hda_dynamic_debug(bool enable)
>=20
> > +{
> > +	FILE *fp;
> > +	const char snd_hda_intel_on[] =3D "module snd_hda_intel +pf";
> ------- ^
> Add static to const char*, here and below.
>=20
> > +	const char snd_hda_core_on[] =3D "module snd_hda_core +pf";
> > +
> > +	const char snd_hda_intel_off[] =3D "module snd_hda_core =3D_";
> > +	const char snd_hda_core_off[] =3D "module snd_hda_intel =3D_";
> > +
> > +	fp =3D fopen("/sys/kernel/debug/dynamic_debug/control", "w");
> > +	if (!fp) {
> > +		igt_debug("hda dynamic debug not available\n");
> > +		return;
> > +	}
> > +
> > +	if (enable) {
> > +		fwrite(snd_hda_intel_on, 1, sizeof(snd_hda_intel_on), fp);
> > +		fwrite(snd_hda_core_on, 1, sizeof(snd_hda_core_on), fp);
> > +	} else {
> > +		fwrite(snd_hda_intel_off, 1, sizeof(snd_hda_intel_off), fp);
> > +		fwrite(snd_hda_core_off, 1, sizeof(snd_hda_core_off), fp);
> > +	}
> > +
> > +	fclose(fp);
> > +}
> > +
> > +static void load_and_check_xe(const char *opts)
> > +{
> > +	int error;
> > +	int drm_fd;
> > +
> > +	hda_dynamic_debug(true);
> > +	error =3D igt_xe_driver_load(opts);
> > +	hda_dynamic_debug(false);
> > +
> > +	igt_assert_eq(error, 0);
> > +
> > +	/* driver is ready, check if it's bound */
> > +	drm_fd =3D __drm_open_driver(DRIVER_XE);
> > +	igt_fail_on_f(drm_fd < 0, "Cannot open the xe DRM driver after modpro=
bing xe.\n");
> > +}
> > +
> > +/**
> > + * SUBTEST: force-load
> > + * Description: Load the Xe driver passing ``force_probe=3D*`` paramet=
er
> > + * Run type: BAT
> > + *
> > + * SUBTEST: load
> > + * Description: Load the Xe driver
> > + * Run type: FULL
> > + *
> > + * SUBTEST: unload
> > + * Description: Unload the Xe driver
> > + * Run type: FULL
> > + *
> > + * SUBTEST: reload
> > + * Description: Reload the Xe driver
> > + * Run type: FULL
> > + *
> > + * SUBTEST: reload-no-display
> > + * Description: Reload the Xe driver passing ``enable_display=3D0`` pa=
rameter
> > + * Run type: FULL
> > + *
> > + * SUBTEST: many-reload
> > + * Description: Reload the Xe driver many times
> > + * Run type: FULL
> > + */
> > +igt_main
> > +{
> > +	igt_describe("Check if xe and friends are not yet loaded, then load t=
hem.");
> > +	igt_subtest("load") {
> > +		const char * unwanted_drivers[] =3D {
> --------------- ^ --------- ^
> 		static const char *unwanted_drivers[] =3D {
>=20
> > +			"xe",
> > +			"i915",
> > +			NULL
> > +		};
> > +
> > +		for (int i =3D 0; unwanted_drivers[i] !=3D NULL; i++) {
> > +			igt_skip_on_f(igt_kmod_is_loaded(unwanted_drivers[i]),
> > +			              "%s is already loaded\n", unwanted_drivers[i]);
> -- ^
> Use more tabs.
>=20
> > +		}
> > +
> > +		load_and_check_xe(NULL);
> > +	}
> > +
>=20
> Add here description with igt_describe.

Same comment about the description: those are at the subtest comment:

> > +/**
> > + * SUBTEST: force-load
> > + * Description: Load the Xe driver passing ``force_probe=3D*`` paramet=
er
> > + * Run type: BAT
> > + *
> > + * SUBTEST: load
> > + * Description: Load the Xe driver
> > + * Run type: FULL
> > + *
> > + * SUBTEST: unload
> > + * Description: Unload the Xe driver
> > + * Run type: FULL
> > + *
> > + * SUBTEST: reload
> > + * Description: Reload the Xe driver
> > + * Run type: FULL
> > + *
> > + * SUBTEST: reload-no-display
> > + * Description: Reload the Xe driver passing ``enable_display=3D0`` pa=
rameter
> > + * Run type: FULL
> > + *
> > + * SUBTEST: many-reload
> > + * Description: Reload the Xe driver many times
> > + * Run type: FULL
> > + */

I'll address the remaining comments. Should send a new version soon.

Regards,
Mauro
