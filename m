Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0110E41B
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jun 2023 09:00:42 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Jun 2023 09:00:38 +0000
Message-ID: <MW3PR11MB4748389214D298270D692A11AE5DA@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Himal
> Prasad Ghimiray
> Sent: 13 June 2023 19:07
> To: igt-dev@lists.freedesktop.org
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT.
please do not put dot at the end of subject:
>=20
> With seperation of GT and tiles in KMD, we will have sysfs entries for pr=
operties
> associated with tile and gtX sysfs parent will be moving under tileX. Thi=
s series
> provides helper functions for accessing tile associated sysfs entries and=
 gt
> specific sysfs under respective tile.
>=20
> series addresses gt related sysfs path change for xe_guc_pc.c test case a=
nd
> introduces new test to verify addr_range for each vram.
>=20
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>=20
> Himal Prasad Ghimiray (4):
>   lib/igt_sysfs: Add support to query number of tiles.
>   lib/igt_sysfs: Handling gt related sysfs uapi changes.
>   test/xe_guc_pc: Change the sysfs paths.
>   tests/xe/xe_tile_prop: adds new test to verify per tile vram
>     addr_range
>=20
>  lib/igt_sysfs.c         |  28 ++++++
>  lib/igt_sysfs.h         |  11 +++
>  tests/meson.build       |   1 +
>  tests/xe/xe_guc_pc.c    | 199 ++++++++++++++++++++--------------------
>  tests/xe/xe_tile_prop.c |  66 +++++++++++++
>  5 files changed, 206 insertions(+), 99 deletions(-)  create mode 100644
> tests/xe/xe_tile_prop.c
>=20
> --
> 2.25.1
