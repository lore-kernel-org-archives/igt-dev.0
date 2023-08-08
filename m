Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F99B10E0C8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 14:19:01 +0000 (UTC)
From: "Dec, Katarzyna" <katarzyna.dec@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 8 Aug 2023 14:18:58 +0000
Message-ID: <IA1PR11MB6097BD42060E26B149E2FB89E20DA@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20230808140426.591392-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230808140426.591392-1-himal.prasad.ghimiray@intel.com>
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

Hello @Ghimiray, Himal Prasad ,

Good to see doc update. However when I applied both patches IGT do not buil=
d. Error I see:

kdec5@kdec5-desk:~/Projects/igt-gpu-tools$ make
ninja -C build
ninja: Entering directory `build'
[5/7] Generating docs/testplan/xe_tests.rst with a custom command
FAILED: docs/testplan/xe_tests.rst
/home/kdec5/Projects/igt-gpu-tools/scripts/igt_doc.py --config /home/kdec5/=
Projects/igt-gpu-tools/tests/xe/xe_test_config.json --rest docs/testplan/xe=
_tests.rst --check-testlist --igt-build-path /home/kdec5/Projects/igt-gpu-t=
ools/build
/home/kdec5/Projects/igt-gpu-tools/tests/xe/xe_sysfs_tile.c:10: Error: unre=
cognized line. Need to add field at /home/kdec5/Projects/igt-gpu-tools/test=
s/xe/xe_test_config.json?
        =3D=3D> Sub-category : Total vram per tile
[7/7] Generating docs/testplan/i915_tests.rst with a custom command
ninja: build stopped: subcommand failed.
make: *** [Makefile:10: all] Error 1

Kasia

-----Original Message-----
From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>=20
Sent: Tuesday, August 8, 2023 4:04 PM
To: igt-dev@lists.freedesktop.org
Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Dec, Katarzyn=
a <katarzyna.dec@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.c=
om>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 0/2] Add documentation details in tests

Add documentation details in tests.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>

Himal Prasad Ghimiray (2):
  tests/xe_sysfs_tile: Update documentation fields.
  tests/xe_uevent: Update documentation fields.

 tests/xe/xe_sysfs_tile.c | 2 ++
 tests/xe/xe_uevent.c     | 2 ++
 2 files changed, 4 insertions(+)

--=20
2.25.1
