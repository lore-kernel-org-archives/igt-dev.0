Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9018928D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 08:37:37 +0000 (UTC)
From: "Chauhan, Aditya" <aditya.chauhan@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Wed, 25 Oct 2023 08:37:19 +0000
Message-ID: <BN9PR11MB527332D600C7846A5594DDFD99DEA@BN9PR11MB5273.namprd11.prod.outlook.com>
References: <20231023151918.26842-1-aditya.chauhan@intel.com>
 <IA1PR11MB60970F5551263E4E1EF090EB86DFA@IA1PR11MB6097.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB60970F5551263E4E1EF090EB86DFA@IA1PR11MB6097.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel-ci: Move fault_mode tests
 to the end of xe ffb
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Thank You ,
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>

> -----Original Message-----
> From: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>
> Sent: Tuesday, October 24, 2023 11:52 AM
> To: Chauhan, Aditya <aditya.chauhan@intel.com>; igt-
> dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel-ci: Move fault_mode tests to the e=
nd of
> xe ffb
>=20
> LGTM
> Acked-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>=20
> Kasia
>=20
> -----Original Message-----
> From: Chauhan, Aditya <aditya.chauhan@intel.com>
> Sent: Monday, October 23, 2023 5:19 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Piecielska, Katarzyna
> <katarzyna.piecielska@intel.com>
> Cc: Chauhan, Aditya <aditya.chauhan@intel.com>
> Subject: [PATCH i-g-t] tests/intel-ci: Move fault_mode tests to the end o=
f xe
> ffb
>=20
> From: Aditya Chauhan <aditya.chauhan@intel.com>
>=20
> Move xe_exec_fault_mode tests to the end of xe fast-feedback testlist to
> unblock execution.
>=20
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 68 ++++++++++++------------
>  1 file changed, 35 insertions(+), 33 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index 0cf28baf9..c981d7eff 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -70,39 +70,6 @@ igt@xe_exec_compute_mode@twice-
> bindexecqueue-userptr
>  igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
>  igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
> -igt@xe_exec_fault_mode@twice-basic
> -igt@xe_exec_fault_mode@many-basic
> -igt@xe_exec_fault_mode@twice-userptr
> -igt@xe_exec_fault_mode@twice-rebind
> -igt@xe_exec_fault_mode@twice-userptr-rebind
> -igt@xe_exec_fault_mode@twice-userptr-invalidate
> -igt@xe_exec_fault_mode@twice-bindexecqueue
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr
> -igt@xe_exec_fault_mode@twice-bindexecqueue-rebind
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate
> -igt@xe_exec_fault_mode@twice-basic-imm
> -igt@xe_exec_fault_mode@twice-userptr-imm
> -igt@xe_exec_fault_mode@twice-rebind-imm
> -igt@xe_exec_fault_mode@twice-userptr-rebind-imm
> -igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
> -igt@xe_exec_fault_mode@twice-basic-prefetch
> -igt@xe_exec_fault_mode@twice-userptr-prefetch
> -igt@xe_exec_fault_mode@twice-rebind-prefetch
> -igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch
> -igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch
> -igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch
> -igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch
> -igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
> prefetch
> -igt@xe_exec_fault_mode@twice-invalid-fault
> -igt@xe_exec_fault_mode@twice-invalid-userptr-fault
>  igt@xe_exec_reset@close-fd-no-exec
>  igt@xe_exec_reset@cm-close-fd-no-exec
>  igt@xe_exec_reset@virtual-close-fd-no-exec
> @@ -251,3 +218,38 @@ igt@core_hotunplug@unbind-rebind
> igt@xe_live_ktest@bo  igt@xe_live_ktest@dmabuf
> igt@xe_live_ktest@migrate
> +
> +# Move fault_mode tests at the end to unblock execution
> +igt@xe_exec_fault_mode@twice-basic
> +igt@xe_exec_fault_mode@many-basic
> +igt@xe_exec_fault_mode@twice-userptr
> +igt@xe_exec_fault_mode@twice-rebind
> +igt@xe_exec_fault_mode@twice-userptr-rebind
> +igt@xe_exec_fault_mode@twice-userptr-invalidate
> +igt@xe_exec_fault_mode@twice-bindexecqueue
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr
> +igt@xe_exec_fault_mode@twice-bindexecqueue-rebind
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate
> +igt@xe_exec_fault_mode@twice-basic-imm
> +igt@xe_exec_fault_mode@twice-userptr-imm
> +igt@xe_exec_fault_mode@twice-rebind-imm
> +igt@xe_exec_fault_mode@twice-userptr-rebind-imm
> +igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
> +igt@xe_exec_fault_mode@twice-basic-prefetch
> +igt@xe_exec_fault_mode@twice-userptr-prefetch
> +igt@xe_exec_fault_mode@twice-rebind-prefetch
> +igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch
> +igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch
> +igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch
> +igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch
> +igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-
> prefetch
> +igt@xe_exec_fault_mode@twice-invalid-fault
> +igt@xe_exec_fault_mode@twice-invalid-userptr-fault
> --
> 2.39.0
