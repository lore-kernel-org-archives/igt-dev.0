Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B188E10E3BB
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 08:26:07 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 08:25:58 +0000
Message-ID: <CY5PR11MB62111255905877B20754C8BE950DA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230804103111.21214-1-riana.tauro@intel.com>
 <20230804103111.21214-4-riana.tauro@intel.com>
In-Reply-To: <20230804103111.21214-4-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] tests/xe: use igt_pm library
 functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Friday, August 4, 2023 4:01 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Sundaresan, Sujaritha
> <sujaritha.sundaresan@intel.com>
> Subject: [PATCH i-g-t v2 3/4] tests/xe: use igt_pm library functions
>=20
> Modify xe_pm tests to use the d3cold_allowed get/set functions from igt_p=
m
> library.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/xe/xe_pm.c | 43 +++++++------------------------------------
>  1 file changed, 7 insertions(+), 36 deletions(-)
>=20
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c index 16af38883..2126cbb=
38
> 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -33,6 +33,7 @@ typedef struct {
>  	int fd_xe;
>  	struct pci_device *pci_xe;
>  	struct pci_device *pci_root;
> +	char pci_slot_name[NAME_MAX];
>  } device_t;
>=20
>  /* runtime_usage is only available if kernel build
> CONFIG_PM_ADVANCED_DEBUG */ @@ -44,47 +45,16 @@ static bool
> runtime_usage_available(struct pci_device *pci)
>  	return access(name, F_OK) =3D=3D 0;
>  }
>=20
> -static int open_d3cold_allowed(struct pci_device *pci) -{
> -	char name[PATH_MAX];
> -	int fd;
> -
> -	snprintf(name, PATH_MAX,
> "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/d3cold_allowed",
> -		 pci->domain, pci->bus, pci->dev, pci->func);
> -
> -	fd =3D open(name, O_RDWR);
> -	igt_assert_f(fd >=3D 0, "Can't open %s\n", name);
> -
> -	return fd;
> -}
> -
> -static void get_d3cold_allowed(struct pci_device *pci, char *d3cold_allo=
wed) -{
> -	int fd =3D open_d3cold_allowed(pci);
> -
> -	igt_assert(read(fd, d3cold_allowed, 2));
> -	close(fd);
> -}
> -
> -static void set_d3cold_allowed(struct pci_device *pci,
> -			       const char *d3cold_allowed)
> -{
> -	int fd =3D open_d3cold_allowed(pci);
> -
> -	igt_assert(write(fd, d3cold_allowed, 2));
> -	close(fd);
> -}
> -
>  static bool setup_d3(device_t device, enum igt_acpi_d_state state)  {
>  	switch (state) {
>  	case IGT_ACPI_D3Cold:
>  		igt_require(igt_pm_acpi_d3cold_supported(device.pci_root));
>  		igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
> -		set_d3cold_allowed(device.pci_xe, "1\n");
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
>  		return true;
>  	case IGT_ACPI_D3Hot:
> -		set_d3cold_allowed(device.pci_xe, "0\n");
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name, 0);
>  		return true;
>  	default:
>  		igt_debug("Invalid D3 Selection\n");
> @@ -350,7 +320,7 @@ igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	device_t device;
> -	char d3cold_allowed[2];
> +	uint32_t d3cold_allowed;
>  	const struct s_state {
>  		const char *name;
>  		enum igt_suspend_state state;
> @@ -374,12 +344,13 @@ igt_main
>  		device.fd_xe =3D drm_open_driver(DRIVER_XE);
>  		device.pci_xe =3D igt_device_get_pci_device(device.fd_xe);
>  		device.pci_root =3D igt_device_get_pci_root_port(device.fd_xe);
> +		igt_device_get_pci_slot_name(device.fd_xe,
> device.pci_slot_name);
>=20
>  		/* Always perform initial once-basic exec checking for health */
>  		xe_for_each_hw_engine(device.fd_xe, hwe)
>  			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
>=20
> -		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
> +		igt_pm_get_d3cold_allowed(device.pci_slot_name,
> &d3cold_allowed);
>  		igt_assert(igt_setup_runtime_pm(device.fd_xe));
>  	}
>=20
> @@ -441,7 +412,7 @@ igt_main
>  	}
>=20
>  	igt_fixture {
> -		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
> +		igt_pm_set_d3cold_allowed(device.pci_slot_name,
> d3cold_allowed);
>  		igt_restore_runtime_pm();
>  		drm_close_driver(device.fd_xe);
>  	}
> --
> 2.40.0
