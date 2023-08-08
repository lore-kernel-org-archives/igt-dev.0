Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEFDD10E0A1
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 14:36:16 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dec, Katarzyna" <katarzyna.dec@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 14:36:13 +0000
Message-ID: <MW4PR11MB705626EF4F74BFE45B09D6BAB30DA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230808140426.591392-1-himal.prasad.ghimiray@intel.com>
 <IA1PR11MB6097BD42060E26B149E2FB89E20DA@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6097BD42060E26B149E2FB89E20DA@IA1PR11MB6097.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/2] Add documentation details in tests
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

Hi Kasha,

> -----Original Message-----
> From: Dec, Katarzyna <katarzyna.dec@intel.com>
> Sent: 08 August 2023 19:49
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>
> Subject: RE: [PATCH i-g-t 0/2] Add documentation details in tests
>=20
> Hello @Ghimiray, Himal Prasad ,
>=20
> Good to see doc update. However when I applied both patches IGT do not
> build. Error I see:

Sorry for typo. Fixing and updating new patch.=20
>=20
> kdec5@kdec5-desk:~/Projects/igt-gpu-tools$ make ninja -C build
> ninja: Entering directory `build'
> [5/7] Generating docs/testplan/xe_tests.rst with a custom command
> FAILED: docs/testplan/xe_tests.rst
> /home/kdec5/Projects/igt-gpu-tools/scripts/igt_doc.py --config
> /home/kdec5/Projects/igt-gpu-tools/tests/xe/xe_test_config.json --rest
> docs/testplan/xe_tests.rst --check-testlist --igt-build-path
> /home/kdec5/Projects/igt-gpu-tools/build
> /home/kdec5/Projects/igt-gpu-tools/tests/xe/xe_sysfs_tile.c:10: Error:
> unrecognized line. Need to add field at /home/kdec5/Projects/igt-gpu-
> tools/tests/xe/xe_test_config.json?
>         =3D=3D> Sub-category : Total vram per tile [7/7] Generating
> docs/testplan/i915_tests.rst with a custom command
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:10: all] Error 1
>=20
> Kasia
>=20
> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Tuesday, August 8, 2023 4:04 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Dec,
> Katarzyna <katarzyna.dec@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Dixit, Ashutosh
> <ashutosh.dixit@intel.com>
> Subject: [PATCH i-g-t 0/2] Add documentation details in tests
>=20
> Add documentation details in tests.
>=20
> Cc: Katarzyna Dec <katarzyna.dec@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>=20
> Himal Prasad Ghimiray (2):
>   tests/xe_sysfs_tile: Update documentation fields.
>   tests/xe_uevent: Update documentation fields.
>=20
>  tests/xe/xe_sysfs_tile.c | 2 ++
>  tests/xe/xe_uevent.c     | 2 ++
>  2 files changed, 4 insertions(+)
>=20
> --
> 2.25.1
