Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E10B10E5D9
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jun 2023 10:46:07 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dec,
 Katarzyna" <katarzyna.dec@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Ch, Sai Gowtham"
 <sai.gowtham.ch@intel.com>
Date: Fri, 16 Jun 2023 10:46:02 +0000
Message-ID: <MW3PR11MB474862760315D4150AAF1FABAE58A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230616102821.20168-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230616102821.20168-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 xe_spin_batch test.
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
> Sent: 16 June 2023 15:58
> To: igt-dev@lists.freedesktop.org; Dec, Katarzyna <katarzyna.dec@intel.co=
m>;
> kamil.konieczny@linux.intel.com; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
> xe_spin_batch test.
please do not put dot at the end of subject:

>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Add xe_spin_batch tests to the test list.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index 53c6be0e..11e64fde 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -198,6 +198,10 @@ igt@xe_query@query-topology
> igt@xe_query@query-invalid-extension
>  igt@xe_query@query-invalid-query
>  igt@xe_query@query-invalid-size
> +igt@xe_spin_batch@spin-basic
> +igt@xe_spin_batch@spin-batch
> +igt@xe_spin_batch@spin-basic-all
> +igt@xe_spin_batch@spin-all
Sort based on subtest name as well.
>  #igt@xe_vm@bind-once
>  #igt@xe_vm@scratch
>  igt@xe_vm@shared-pte-page
> --
> 2.39.1

With above minor changes done
Acked-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

