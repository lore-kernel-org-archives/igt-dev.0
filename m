Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAF510E172
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 09:36:34 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>
Date: Wed, 5 Jul 2023 09:36:30 +0000
Message-ID: <DM6PR11MB449221CDAE0308CF128565E98D2FA@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230705092254.22269-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20230705092254.22269-1-sai.gowtham.ch@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
 xe_exec_store@ basic-store subtest in fastfeedback.
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
> Sent: 05 July 2023 02:53 PM
> To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: Add
> xe_exec_store@ basic-store subtest in fastfeedback.
>=20
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>=20
> Adding basic-store subtest to the fast feedback list.
>=20
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index c6734b9c7..1e3fb4937 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -145,6 +145,7 @@ igt@xe_exec_fault_mode@twice-invalid-userptr-fault
>  igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
> +igt@xe_exec_store@basic-store
>  #igt@xe_exec_threads@threads-basic
>  igt@xe_exec_threads@threads-shared-vm-basic
>  igt@xe_exec_threads@threads-fd-basic
> --
LGTM
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 2.39.1
