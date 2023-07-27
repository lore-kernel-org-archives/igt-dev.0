Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DAE10E584
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 13:51:29 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 13:32:26 +0000
Message-ID: <SJ1PR11MB620426DC40AD52BD03A9024C8101A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
 <20230720120147.1057467-4-priyanka.dandamudi@intel.com>
In-Reply-To: <20230720120147.1057467-4-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] xe-fast-feedback.testlist: Add
 sysfs tests to BAT
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Thursday, July 20, 2023 5:32 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 3/3] xe-fast-feedback.testlist: Add sysfs tests to =
BAT
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Add sysfs_scheduler and sysfs_defaults to BAT.
> This validates the basic sysfs scheduler parameters.

Once KMD patch is merged, this can go in.
Acked-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index 2799d9cfb..c994d29e9 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -164,6 +164,16 @@ igt@xe_query@query-invalid-query
> igt@xe_query@query-invalid-size  igt@xe_spin_batch@spin-basic
> igt@xe_spin_batch@spin-batch
> +igt@xe_sysfs_defaults@engine-defaults
> +igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
> +igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
> +igt@xe_sysfs_scheduler@preempt_timeout_us-nonprivileged-user
> +igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
> +igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
> +igt@xe_sysfs_scheduler@timeslice_duration_us-nonprivileged-user
> +igt@xe_sysfs_scheduler@job_timeout_ms-invalid
> +igt@xe_sysfs_scheduler@job_timeout_ms-min-max
> +igt@xe_sysfs_scheduler@job_timeout_ms-nonprivileged-user
>  #igt@xe_vm@bind-once
>  #igt@xe_vm@scratch
>  igt@xe_vm@shared-pte-page
> --
> 2.25.1
