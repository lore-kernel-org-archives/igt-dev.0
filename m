Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB10910E646
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 14:03:59 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Nilawar, Badal" <badal.nilawar@intel.com>
Date: Mon, 19 Sep 2022 14:03:56 +0000
Message-ID: <CY5PR11MB621170F9BD7E9B7299C358E6954D9@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220914140721.3500129-1-riana.tauro@intel.com>
In-Reply-To: <20220914140721.3500129-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/7] Add hwmon energy support for dgfx
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
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, September 14, 2022 7:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Nilawar, Badal <badal.nilawar@intel.com>
> Subject: [PATCH i-g-t v2 0/7] Add hwmon energy support for dgfx
It seems we don't have DG2/DG1 in shards CI execution.
Could you please temporary move the IGT subtest used by HWMON to BAT list i=
n order to get CI results.
Please follow section " Forcing Tests In BAT And Changing Configuration" fr=
om https://intel-gfx-ci.01.org/
@Nilawar, Badal you may need to re-float the hwmon kernel series again with=
 Test-with updated IGT series to get
the CI result.

Thanks,
Anshuman Gupta.
>=20
> Introduce igt_power library that reads energy from hwmon & rapl interface=
s.
> Replace igt_rapl with igt_power.
>=20
> Modify the existing tests that use igt_rapl to igt_power.
>=20
> Rev2 : Re-order patches to fix compilation
>=20
> Riana Tauro (7):
>   lib/igt_hwmon: Introduce library igt_hwmon
>   lib/igt_power: Rename lib igt_rapl with igt_power
>   lib/igt_power: Add hwmon interface to igt_power
>   i915/i915_pm_rc6_residency: Add energy support for dgfx
>   i915/gem_exec_schedule: Add energy support for dgfx
>   i915/gem_exec_whisper: Add energy support for dgfx
>   lib/igt_power: clean-up igt_power library
>=20
>  lib/igt_hwmon.c                    |  73 ++++++++++
>  lib/igt_hwmon.h                    |  12 ++
>  lib/igt_power.c                    | 211 +++++++++++++++++++++++++++++
>  lib/{igt_rapl.h =3D> igt_power.h}    |  78 +++--------
>  lib/igt_rapl.c                     |  69 ----------
>  lib/meson.build                    |   3 +-
>  tests/i915/gem_exec_fair.c         |   1 -
>  tests/i915/gem_exec_schedule.c     |  51 ++++---
>  tests/i915/gem_exec_whisper.c      |  16 ++-
>  tests/i915/i915_pm_rc6_residency.c |  65 +++++----
>  10 files changed, 390 insertions(+), 189 deletions(-)  create mode 10064=
4
> lib/igt_hwmon.c  create mode 100644 lib/igt_hwmon.h  create mode 100644
> lib/igt_power.c  rename lib/{igt_rapl.h =3D> igt_power.h} (51%)  delete m=
ode
> 100644 lib/igt_rapl.c
>=20
> --
> 2.25.1
