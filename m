Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6657010E176
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 02:31:54 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 4 Dec 2023 02:31:46 +0000
Message-ID: <DM6PR11MB42043D06FF65B13EFC3669CA8986A@DM6PR11MB4204.namprd11.prod.outlook.com>
References: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20231201141703.3013801-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V4 0/7] tests/kms_vrr: Add new subtest to
 switch RR without modeset
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

Tested-by: Vidya Srinivas <vidya.srinivas@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Friday, December 1, 2023 7:47 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t V4 0/7] tests/kms_vrr: Add new subtest to switc=
h RR
> without modeset
>=20
> Add new subtest to switch between low refresh rate to high refresh rate a=
nd
> vice versa seamlessly without modeset.
>=20
> V2: Minor cleanups
> V3: Fix few condition checks
> V4: Fix Negative subtest
>=20
> Bhanuprakash Modem (7):
>   tests/kms_vrr: Use lib helper to print connector modes
>   tests/kms_vrr: Clear VRR before exit
>   tests/kms_vrr: Move all config constaints to new function
>   tests/kms_vrr: Fix bigjoiner constraint
>   tests/kms_vrr: Fix the logic to calculate expected rate
>   tests/kms_vrr: Add new subtest to switch RR without modeset
>   HAX: DO_NOT_MERGE: test only seamless-rr-switch
>=20
>  tests/intel-ci/fast-feedback.testlist    | 178 +--------------
>  tests/intel-ci/xe-fast-feedback.testlist | 265 +----------------------
>  tests/kms_vrr.c                          | 214 ++++++++++++++----
>  3 files changed, 184 insertions(+), 473 deletions(-)
>=20
> --
> 2.40.0
