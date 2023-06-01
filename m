Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF7510E0E3
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 10:51:30 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 1 Jun 2023 10:51:20 +0000
Message-ID: <MW3PR11MB4748C55D3ED51F979EFA17FBAE499@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230601100250.747088-1-andrzej.hajda@intel.com>
In-Reply-To: <20230601100250.747088-1-andrzej.hajda@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] gem_exec_balancer: move no-GuC
 requirement to test functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Das, Nirmoy" <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Andrzej Hajda
> Sent: 01 June 2023 15:33
> To: igt-dev@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] gem_exec_balancer: move no-GuC
> requirement to test functions
>=20
> Requirements put into igt_subtest_group/igt_fixture are checked for all
> tests in the file.
This comment is misleading, it is not checked for all the tests in the file=
. igt_fixture inside of subtest_group will get executed even when you run a=
 test outside of it. Suggest you to change it.
=20
Even if they do not influence test execution they print
> misleading infos.
>=20
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

LGTM
Acked-by : Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/i915/gem_exec_balancer.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/gem_exec_balancer.c
> b/tests/i915/gem_exec_balancer.c index 004ba9a14fe..9190fc2383f 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -1525,6 +1525,7 @@ bonded_runner(int i915,
>  	 * submission across multiple engines.
>  	 */
>  	igt_require(gem_scheduler_has_preemption(i915));
> +	igt_require(!gem_using_guc_submission(i915));
>=20
>  	cycles =3D mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -
> 1, 0);
>=20
> @@ -1996,6 +1997,7 @@ static void sliced(int i915)
>=20
>  	igt_require(gem_scheduler_has_preemption(i915));
>  	igt_require(gem_scheduler_has_semaphores(i915));
> +	igt_require(!gem_using_guc_submission(i915));
>=20
>  	for (int class =3D 0; class < 32; class++) {
>  		struct i915_engine_class_instance *ci; @@ -3605,7 +3607,6
> @@ igt_main
>=20
>  	igt_subtest_group {
>  		igt_fixture {
> -			igt_require(!gem_using_guc_submission(i915));
>  			intel_allocator_multiprocess_start();
>  		}
>=20
> --
> 2.34.1
