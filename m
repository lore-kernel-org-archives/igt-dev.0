Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AC810E3AD
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 08:02:14 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 08:02:10 +0000
Message-ID: <CY5PR11MB621176B36E90090D1F3DE685950DA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230804103111.21214-1-riana.tauro@intel.com>
 <20230804103111.21214-3-riana.tauro@intel.com>
In-Reply-To: <20230804103111.21214-3-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] lib/igt_pm: change
 d3cold_allowed function parameters
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
> Subject: [PATCH i-g-t v2 2/4] lib/igt_pm: change d3cold_allowed function
> parameters
>=20
> The existing d3cold_allowed get/set function in igt_pm uses igt_device_ca=
rd as
> a function argument.
> Xe tests cannot use this function as they need to pass pci_device as para=
meter.
> To have a common library function for both i915 and xe, use a common
> parameter between igt_device_card and pci_device ie.pci_slot_name.
>=20
> Change function parameter of d3cold_allowed get/set functions to pci slot
> name.
> Change the data type of value from char to uint32_t as it is more appropr=
iate.
>=20
> Modify i915_suspend to use these functions.
> No Functional Changes.
>=20
> v2: Add justification for change  in commit message (Anshuman)
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  lib/igt_pm.c              | 22 +++++++++++-----------
>  lib/igt_pm.h              |  4 ++--
>  tests/i915/i915_suspend.c |  8 ++++----
>  3 files changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c index ba591f0f8..11cf82950 10064=
4
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -1204,47 +1204,47 @@ void igt_pm_setup_pci_card_runtime_pm(struct
> pci_device *pci_dev)
>=20
>  /**
>   * igt_pm_get_d3cold_allowed:
> - * @igt_device_card: device card
> - * @val: value to be read into
> + * @pci_slot_name: slot name of the pci device
> + * @value: value to be read into
>   *
>   * Reads the value of d3cold_allowed attribute
>   * of the pci device
>   */
> -void igt_pm_get_d3cold_allowed(struct igt_device_card *card, char *val)
> +void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t
> +*value)
>  {
>  	char name[PATH_MAX];
>  	int fd;
>=20
>  	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%s",
> -		 card->pci_slot_name);
> +		 pci_slot_name);
>=20
>  	fd =3D open(name, O_RDONLY);
>  	igt_assert_f(fd >=3D 0, "Can't open %s\n", name);
>=20
> -	igt_sysfs_read(fd, "d3cold_allowed", val, sizeof(val));
> +	__igt_sysfs_get_u32(fd, "d3cold_allowed", value);
>=20
>  	close(fd);
>  }
>=20
>  /**
> - * igt_pm_get_d3cold_allowed:
> - * @igt_device_card: device card
> - * @val: value to be written
> + * igt_pm_set_d3cold_allowed:
> + * @pci_slot_name: slot name of pci device
> + * @value: value to be written
>   *
>   * writes the value to d3cold_allowed attribute of pci device
>   */
> -void igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char =
*val)
> +void igt_pm_set_d3cold_allowed(const char *pci_slot_name, uint32_t
> +value)
>  {
>  	char name[PATH_MAX];
>  	int fd;
>=20
>  	snprintf(name, PATH_MAX, "/sys/bus/pci/devices/%s",
> -		 card->pci_slot_name);
> +		 pci_slot_name);
>=20
>  	fd =3D open(name, O_RDONLY);
>  	igt_assert_f(fd >=3D 0, "Can't open %s\n", name);
>=20
> -	igt_sysfs_write(fd, "d3cold_allowed", val, sizeof(val));
> +	__igt_sysfs_set_u32(fd, "d3cold_allowed", value);
>  	close(fd);
>  }
>=20
> diff --git a/lib/igt_pm.h b/lib/igt_pm.h index 71ec2f239..306a9eb46 10064=
4
> --- a/lib/igt_pm.h
> +++ b/lib/igt_pm.h
> @@ -79,8 +79,8 @@ enum igt_acpi_d_state
>  igt_pm_get_acpi_real_d_state(struct pci_device *pci_dev);  void
> igt_pm_enable_pci_card_runtime_pm(struct pci_device *root,
>  				       struct pci_device *i915);
> -void igt_pm_get_d3cold_allowed(struct igt_device_card *card, char *val);=
 -void
> igt_pm_set_d3cold_allowed(struct igt_device_card *card, const char *val);
> +void igt_pm_get_d3cold_allowed(const char *pci_slot_name, uint32_t
> +*value); void igt_pm_set_d3cold_allowed(const char *pci_slot_name,
> +uint32_t value);
>  void igt_pm_setup_pci_card_runtime_pm(struct pci_device *pci_dev);  void
> igt_pm_restore_pci_card_runtime_pm(void);
>  void igt_pm_print_pci_card_runtime_status(void);
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c index
> 851e797c2..c25805584 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -283,7 +283,7 @@ static void
>  test_suspend_without_i915(int state)
>  {
>  	struct igt_device_card card;
> -	char d3cold_allowed[2];
> +	uint32_t d3cold_allowed;
>  	int fd;
>=20
>  	fd =3D __drm_open_driver(DRIVER_INTEL);
> @@ -297,8 +297,8 @@ test_suspend_without_i915(int state)
>  	 */
>  	if (state =3D=3D SUSPEND_STATE_FREEZE &&
>  	    igt_device_find_first_i915_discrete_card(&card)) {
> -		igt_pm_get_d3cold_allowed(&card, d3cold_allowed);
> -		igt_pm_set_d3cold_allowed(&card, "0\n");
> +		igt_pm_get_d3cold_allowed(card.pci_slot_name,
> &d3cold_allowed);
> +		igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
>  	}
>  	drm_close_driver(fd);
>=20
> @@ -308,7 +308,7 @@ test_suspend_without_i915(int state)
>  	igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
>=20
>  	if (state =3D=3D SUSPEND_STATE_FREEZE && strlen(card.card))
> -		igt_pm_set_d3cold_allowed(&card, d3cold_allowed);
> +		igt_pm_set_d3cold_allowed(card.pci_slot_name,
> d3cold_allowed);
>=20
>  	igt_kmsg(KMSG_INFO "Re-loading i915 \n");
>  	igt_assert_eq(igt_i915_driver_load(NULL), 0);
> --
> 2.40.0
