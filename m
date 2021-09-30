Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681646E3EC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 12:42:21 +0000 (UTC)
From: "Bhatt, Jigar" <jigar.bhatt@intel.com>
Date: Thu, 30 Sep 2021 12:42:17 +0000
Message-ID: <DM8PR11MB5608F87EAE2A354919D6142BFDAA9@DM8PR11MB5608.namprd11.prod.outlook.com>
References: <20210930122050.2033508-1-jigar.bhatt@intel.com>
 <YVWvYKMFfbR/RxiM@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YVWvYKMFfbR/RxiM@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Changing sysfs
 open attribute to O_RDONLY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Varide,
 Nischal" <nischal.varide@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com>=20
Sent: Thursday, September 30, 2021 6:07 PM
To: Bhatt, Jigar <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org; Varide, Nischal <nischal.varide@intel.co=
m>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Changing sysfs =
open attribute to O_RDONLY

On Thu, Sep 30, 2021 at 05:50:50PM +0530, Jigar Bhatt wrote:
> Opening /sys/module/drm_kms_helper/parameters/ in read only mode to=20
> avoid permission issue in dc9-dpms test.
>=20
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index=20
> d70ee060..4c9b871c 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -419,7 +419,7 @@ static void setup_dc9_dpms(data_t *data, int=20
> dc_target)  {
>  	int prev_dc, sysfs_fd;
> =20
> -	igt_require((sysfs_fd =3D open(KMS_HELPER, O_RDWR)) >=3D 0);
> +	igt_require((sysfs_fd =3D open(KMS_HELPER, O_RDONLY)) >=3D 0);
>  	kms_poll_saved_state =3D igt_sysfs_get_boolean(sysfs_fd, "poll");
>  	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>  	close(sysfs_fd);
> @@ -449,7 +449,7 @@ static void kms_poll_state_restore(int sig)  {
>  	int sysfs_fd;
> =20
> -	sysfs_fd =3D open(KMS_HELPER, O_WRONLY);
> +	sysfs_fd =3D open(KMS_HELPER, O_RDONLY);
>  	if (sysfs_fd >=3D 0) {
>  		igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);

Shouldn't this stay WRONLY?


--
Petri Latvala

Hi Petri,
Here since we are opening a directory, it needs to open as read-only.
This is the same scenario with other test cases too example,
igt_aux.c     igt_require((power_dir =3D open("/sys/power", O_RDONLY)) >=3D=
 0);


thanks and regards,=20
Jigar Bhatt
>  		close(sysfs_fd);
> --=20
> 2.25.1
>=20
