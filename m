Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8889C10E68B
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 15:00:28 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Date: Fri, 22 Sep 2023 15:00:13 +0000
Message-ID: <CY5PR11MB621176F7C16BB616A2D366DB95FFA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230922132401.177284-1-anshuman.gupta@intel.com>
 <20230922132401.177284-2-anshuman.gupta@intel.com>
 <ZQ2jM/JDmkaizMeS@intel.com>
In-Reply-To: <ZQ2jM/JDmkaizMeS@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/3] tests/xe_pm: Add d3-mmap IGT test
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
> Sent: Friday, September 22, 2023 7:53 PM
> To: Gupta, Anshuman <anshuman.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Tauro, Riana <riana.tauro@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: Re: [PATCH i-g-t v2 1/3] tests/xe_pm: Add d3-mmap IGT test
>=20
> On Fri, Sep 22, 2023 at 06:53:59PM +0530, Anshuman Gupta wrote:
> > Adding a test to validate mmap memory mappings along with runtime
> > suspend and resume for both xe device and it's pci parent bridge in
> > device hierarchy.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  tests/intel/xe_pm.c | 94
> > +++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> > fd28d5630..5495da154 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -39,6 +39,7 @@ typedef struct {
> >  } device_t;
> >
> >  uint64_t orig_threshold;
> > +int fw_handle =3D -1;
> >
> >  /* runtime_usage is only available if kernel build
> > CONFIG_PM_ADVANCED_DEBUG */  static bool
> > runtime_usage_available(struct pci_device *pci) @@ -166,6 +167,14 @@
> static bool out_of_d3(device_t device, enum igt_acpi_d_state state)
> >  	return true;
> >  }
> >
> > +static void close_fw_handle(int sig)
> > +{
> > +	if (fw_handle < 0)
> > +		return;
> > +
> > +	close(fw_handle);
> > +}
>=20
> it took me a while to understand why global fw_handle here and the exit
> handler install at the end and then the conversion of the second patch. I=
t
> makes total sense to ensure that we don't leave the fw awake after a test
> issue.
> But could you please do this in a separated patch before the addition of =
this
> new test?
Sure I will do that.
>=20
> > +
> >  /**
> >   * SUBTEST: %s-basic
> >   * Description: set GPU state to %arg[1] and test suspend/autoresume
> > @@ -437,6 +446,68 @@ static void test_vram_d3cold_threshold(device_t
> device, int sysfs_fd)
> >  	igt_assert(in_d3(device, IGT_ACPI_D3Cold));  }
> >
> > +/**
> > + * SUBTEST: d3-mmap-%s
> > + * Description:
> > + *	Validate mmap memory mapping with d3 state, for %arg[1] region,
> > + *	if supported by device.
> > + * arg[1]:
> > + *
> > + * @vram:	vram region
> > + * @system:	system region
> > + *
> > + * Functionality: pm-d3
> > + * Run type: FULL
> > + */
> > +static void test_mmap(device_t device, uint32_t flags) {
> > +	size_t bo_size =3D 8192;
> > +	uint8_t *map =3D NULL;
> > +	uint32_t bo;
> > +	int i;
> > +
> > +	igt_require_f(flags, "Device doesn't support such memory region\n");
> > +
> > +	bo =3D xe_bo_create_flags(device.fd_xe, 0, bo_size, flags);
> > +	map =3D xe_bo_map(device.fd_xe, bo, bo_size);
> > +	igt_assert(map);
> > +
> > +	fw_handle =3D igt_debugfs_open(device.fd_xe, "forcewake_all",
> O_RDONLY);
> > +	igt_assert(fw_handle >=3D 0);
> > +	igt_assert(igt_get_runtime_pm_status() =3D=3D
> > +IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +
> > +	for (i =3D 0; i < bo_size; i++)
> > +		map[i] =3D i & 0xFF;
> > +
> > +	for (i =3D 0; i < bo_size; i++)
> > +		igt_assert(map[i] =3D=3D (i & 0xFF));
> > +
> > +	/* Runtime suspend and validate the pattern and clear the pattern */
> > +	close(fw_handle);
> > +
> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSP
> ENDED));
> > +
> > +	for (i =3D 0; i < bo_size; i++)
> > +		igt_assert(map[i] =3D=3D (i & 0xFF));
> > +
> > +
> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSP
> ENDED));
> > +
> > +	for (i =3D 0; i < bo_size; i++)
> > +		map[i] =3D (~i & 0xFF);
> > +
> > +
> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSP
> ENDED));
> > +
> > +	/* Runtime resume and check the pattern */
> > +	fw_handle =3D igt_debugfs_open(device.fd_xe, "forcewake_all",
> O_RDONLY);
> > +	igt_assert(fw_handle >=3D 0);
> > +	igt_assert(igt_get_runtime_pm_status() =3D=3D
> > +IGT_RUNTIME_PM_STATUS_ACTIVE);
>=20
> You are using the forcewake to wake the gpu up, but  I wonder if what we
> want here is to also give a time to get to the suspend, then assert SUSPE=
NDED,
> and then do the read to the mapped area and ensure that we are ACTIVE
> because of the read?
> I mean, with this we would be really testing the Badal's case of exit on =
page
> fault, right?
This test is just validating the pattern in the bo during runtime suspend a=
nd resume, this test is agnostic for vram region and system region.
Bo.=20
To validate the page fault case, we would need a test specific to vram regi=
on. I will do that change.=20

Thanks,
Anshuman.
 =20
>=20
> > +	for (i =3D 0; i < bo_size; i++)
> > +		igt_assert(map[i] =3D=3D (~i & 0xFF));
>=20
> should we have some kind of 0xc0ffee check instead?
> I'm afraid of some cases that we might read garbage 1s and be okay with i=
t.
>=20
> > +
> > +	igt_assert(munmap(map, bo_size) =3D=3D 0);
> > +	gem_close(device.fd_xe, bo);
> > +	close(fw_handle);
> > +}
> > +
> >  igt_main
> >  {
> >  	struct drm_xe_engine_class_instance *hwe; @@ -542,6 +613,29 @@
> > igt_main
> >  		test_vram_d3cold_threshold(device, sysfs_fd);
> >  	}
> >
> > +	igt_subtest_group {
> > +		igt_fixture {
> > +			igt_install_exit_handler(close_fw_handle);
> > +		}
> > +
> > +		igt_describe("Validate mmap memory mappings with system
> region,"
> > +			     "when device along with parent bridge in d3");
> > +		igt_subtest("d3-mmap-system") {
> > +			test_mmap(device, system_memory(device.fd_xe));
> > +		}
> > +
> > +		igt_describe("Validate mmap memory mappings with vram
> region,"
> > +			     "when device along with parent bridge in d3");
> > +		igt_subtest("d3-mmap-vram") {
> > +			if (device.pci_root !=3D device.pci_xe) {
> > +
> 	igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> > +
> 	igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
> > +			}
> > +
> > +			test_mmap(device,
> visible_vram_memory(device.fd_xe, 0));
> > +		}
> > +	}
> > +
> >  	igt_fixture {
> >  		close(sysfs_fd);
> >  		igt_pm_set_d3cold_allowed(device.pci_slot_name,
> d3cold_allowed);
> > --
> > 2.25.1
> >
