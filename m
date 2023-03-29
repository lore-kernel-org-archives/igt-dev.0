Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF00010E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 22:39:42 +0000 (UTC)
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 29 Mar 2023 22:39:34 +0000
Message-ID: <CY8PR11MB6940C8CB7BC7C968DCBD0632C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230329222331.32734-1-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20230329222331.32734-1-niranjana.vishwanathapura@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/2] tests/xe/xe_guc_pc: Skip RC6
 tests on PVC
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

Looks good to me.

Reviewed-by: Bruce Chang <yu.bruce.chang@intel.com>

> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Wednesday, March 29, 2023 3:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>; mchehab@kernel.org;
> Chang, Yu bruce <yu.bruce.chang@intel.com>
> Subject: [PATCH i-g-t v2 0/2] tests/xe/xe_guc_pc: Skip RC6 tests on PVC
>=20
> Add IS_PONTEVECCHIO() library routine and Skip rc6 subtests on PVC.
>=20
> v2: Add proper PVC library support and fix assert check in xe_guc_pc
>=20
> Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
>=20
> Niranjana Vishwanathapura (2):
>   lib: Add Pontevecchio platform
>   tests/xe/xe_guc_pc: Skip RC6 tests for PVC
>=20
>  lib/i915/intel_cmds_info.c | 20 ++++++++++++++++++++
> lib/i915/intel_cmds_info.h |  1 +
>  lib/i915_pciids.h          | 13 +++++++++++++
>  lib/intel_chipset.h        |  2 ++
>  lib/intel_device_info.c    | 10 ++++++++++
>  tests/xe/xe_guc_pc.c       |  2 ++
>  6 files changed, 48 insertions(+)
>=20
> --
> 2.21.0.rc0.32.g243a4c7e27
