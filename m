Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B0710E184
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:08:47 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 31 Oct 2022 10:08:19 +0000
Message-ID: <CY5PR11MB6211BAC08F51B2CFA3F8F30995379@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20221031095521.3749655-1-riana.tauro@intel.com>
 <20221031095521.3749655-2-riana.tauro@intel.com>
In-Reply-To: <20221031095521.3749655-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/debugfs_test: Add basic-hwmon
 test
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
> Sent: Monday, October 31, 2022 3:25 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Nilawar, Badal <badal.nilawar@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/debugfs_test: Add basic-hwmon test
>=20
> Add a testcase that verifies hwmon directory in dgfx and prints all the e=
ntries
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/debugfs_test.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/debugfs_test.c b/tests/debugfs_test.c index
> 0b4b6e23..99fef354 100644
> --- a/tests/debugfs_test.c
> +++ b/tests/debugfs_test.c
> @@ -24,12 +24,13 @@
>=20
>  #include "i915/gem.h"
>  #include "igt.h"
> +#include "igt_hwmon.h"
>  #include "igt_sysfs.h"
>  #include <fcntl.h>
>  #include <sys/types.h>
>  #include <dirent.h>
>=20
> -IGT_TEST_DESCRIPTION("Read entries from debugfs and sysfs paths.");
> +IGT_TEST_DESCRIPTION("Read entries from debugfs,hwmon and sysfs
> +paths.");
>=20
>  static void read_and_discard_sysfs_entries(int path_fd, int indent)  { @=
@ -
> 178,7 +179,7 @@ retry:
>=20
>  igt_main
>  {
> -	int fd =3D -1, debugfs, sysfs;
> +	int fd =3D -1, debugfs, sysfs, hwmon_fd;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver_master(DRIVER_INTEL);
> @@ -196,6 +197,15 @@ igt_main
>  	igt_subtest("read_all_entries")
>  		read_and_discard_sysfs_entries(debugfs, 0);
>=20
> +	igt_describe("Read all entries from hwmon path");
> +	igt_subtest("basic-hwmon") {
> +		igt_require_f(gem_has_lmem(fd), "Test applicable only for
> dgfx\n");
> +		hwmon_fd =3D igt_hwmon_open(fd);
> +		igt_assert(hwmon_fd >=3D 0);
> +		read_and_discard_sysfs_entries(hwmon_fd, 0);
> +		close(hwmon_fd);
> +	}
> +
>  	igt_describe("Read all debugfs entries with display on/off.");
>  	igt_subtest_group
>  		kms_tests(fd, debugfs);
> --
> 2.25.1
