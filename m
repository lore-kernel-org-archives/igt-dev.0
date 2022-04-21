Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B030110E8BE
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 11:05:19 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 21 Apr 2022 11:05:16 +0000
Message-ID: <DM6PR11MB44925E790041A937C960C8C38DF49@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <85c51c99da76e3fe286ed28e80fa964e148f6020.1650435058.git.ashutosh.dixit@intel.com>
In-Reply-To: <85c51c99da76e3fe286ed28e80fa964e148f6020.1650435058.git.ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_sysfs: Add helpers to
 iterate over GTs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Ashutosh Dixit
> Sent: 20 April 2022 11:43 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 1/3] lib/igt_sysfs: Add helpers to iterat=
e over
> GTs
>=20
> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>=20
> Provide iterators to:
> - construct the subdirectory string for a gt
> - obtain fd for the subdirectory of the interface
>=20
> v2: Separated out RPS functionality into seaparate patch (Ashutosh)
>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa
> <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/igt_sysfs.c | 71
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h | 13 +++++++++
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index f8ef23e2c8e2..b167c0=
507039
> 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -54,6 +54,21 @@
>   * provides basic support for like igt_sysfs_open().
>   */
>=20
> +/**
> + * igt_sysfs_has_attr:
> + * @dir: sysfs directory fd
> + * @attr: attr inside sysfs dir that needs to be checked for existence
> + *
> + * This checks if specified attr exists in device sysfs directory.
> + *
> + * Returns:
> + * true if attr exists in sysfs, false otherwise.
> + */
> +bool igt_sysfs_has_attr(int dir, const char *attr) {
> +	return !faccessat(dir, attr, F_OK, 0); }
> +
>  /**
>   * igt_sysfs_path:
>   * @device: fd of the device
> @@ -104,6 +119,62 @@ int igt_sysfs_open(int device)
>  	return open(path, O_RDONLY);
>  }
>=20
> +/**
> + * igt_sysfs_gt_path:
> + * @device: fd of the device
> + * @gt: gt number
> + * @path: buffer to fill with the sysfs gt path to the device
> + * @pathlen: length of @path buffer
> + *
> + * This finds the sysfs directory corresponding to @device and @gt. If
> +the gt
> + * specific directory is not available and gt is 0, path is filled with
> +sysfs
> + * base directory.
> + *
> + * Returns:
> + * The directory path, or NULL on failure.
> + */
> +char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen) {
> +	struct stat st;
> +
> +	if (device < 0)
> +		return NULL;
> +
> +	if (igt_debug_on(fstat(device, &st)) ||
> igt_debug_on(!S_ISCHR(st.st_mode)))
> +		return NULL;
> +
> +	snprintf(path, pathlen, "/sys/dev/char/%d:%d/gt/gt%d",
> +		 major(st.st_rdev), minor(st.st_rdev), gt);
> +
> +	if (!igt_debug_on(access(path, F_OK)))
> +		return path;
> +	else if (!igt_debug_on(gt !=3D 0))
> +		return igt_sysfs_path(device, path, pathlen);
> +
> +	return NULL;
> +}
> +
> +/**
> + * igt_sysfs_gt_open:
> + * @device: fd of the device
> + * @gt: gt number
> + *
> + * This opens the sysfs gt directory corresponding to device and gt for
> +use
> + * with igt_sysfs_set() and igt_sysfs_get().
> + *
> + * Returns:
> + * The directory fd, or -1 on failure.
> + */
> +int igt_sysfs_gt_open(int device, int gt) {
> +	char path[96];
> +
> +	if (igt_debug_on(!igt_sysfs_gt_path(device, gt, path, sizeof(path))))
> +		return -1;
> +
> +	return open(path, O_RDONLY);
> +}
> +
>  /**
>   * igt_sysfs_write:
>   * @dir: directory for the device from igt_sysfs_open() diff --git
> a/lib/igt_sysfs.h b/lib/igt_sysfs.h index 56741a0a37e3..33317a969619 1006=
44
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -28,8 +28,21 @@
>  #include <stdbool.h>
>  #include <stdarg.h>
>=20
> +#define for_each_sysfs_gt_path(i915__, path__, pathlen__) \
> +	for (int gt__ =3D 0; \
> +	     igt_sysfs_gt_path(i915__, gt__, path__, pathlen__) !=3D NULL; \
> +	     gt__++)
> +
> +#define for_each_sysfs_gt_dirfd(i915__, dirfd__, gt__) \
> +	for (gt__ =3D 0; \
> +	     (dirfd__ =3D igt_sysfs_gt_open(i915__, gt__)) !=3D -1; \
> +	     close(dirfd__), gt__++)
> +
>  char *igt_sysfs_path(int device, char *path, int pathlen);  int
> igt_sysfs_open(int device);
> +char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
> +int igt_sysfs_gt_open(int device, int gt); bool igt_sysfs_has_attr(int
> +dir, const char *attr);
>=20
>  int igt_sysfs_read(int dir, const char *attr, void *data, int len);  int
> igt_sysfs_write(int dir, const char *attr, const void *data, int len);
> --
> 2.34.1
[Dandamudi, Priyanka]=20
LGTM:
Reviewed-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>
