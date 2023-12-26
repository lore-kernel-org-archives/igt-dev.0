Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081310E04E
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Dec 2023 06:59:10 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t 0/2] Add Persistent support.
Date: Tue, 26 Dec 2023 06:59:06 +0000
Message-ID: <MW3PR11MB47481E019AAEB9601C52A816AE98A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20231222105353.23355-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
> sai.gowtham.ch@intel.com
> Sent: Friday, December 22, 2023 4:24 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t 0/2] Add Persistent support.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> This series has two changes as followes:
> 1. Add persistent batch buffer instruction to the lib.
> 2. Add Persistent subtest to xe_exec_store.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

With the suggested minor nits done,
You can add my r-b.

Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

>=20
> Sai Gowtham Ch (2):
>   include/intel_gpu_commands: Add persistent batch buffer instruction.
>   intel/xe_exec_store: Add Persistent subtest
>=20
>  include/intel_gpu_commands.h |  1 +
>  tests/intel/xe_exec_store.c  | 86 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 87 insertions(+)
>=20
> --
> 2.39.1
