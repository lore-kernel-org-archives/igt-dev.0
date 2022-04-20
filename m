Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3410E27F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 19:07:20 +0000 (UTC)
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 20 Apr 2022 19:07:18 +0000
Message-ID: <671434dd9c4241e481bcf4abb0f2666c@intel.com>
References: <20220420184628.412506-1-rodrigo.vivi@intel.com>
In-Reply-To: <20220420184628.412506-1-rodrigo.vivi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+
 dependency from DC9.
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, April 20, 2022 11:46 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Deak, Imre
> <imre.deak@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Srivatsa, Anusha <anusha.srivatsa@intel.com>
> Subject: [PATCH i-g-t] tests/i915/i915_pm_dc.c: Remove PC8+ dependency
> from DC9.
>=20
> Different from DC6, DC9 does not depend on the BIOS/PCU to execute save
> and restore or any other sequence when going to PC9/PC10.
>=20
> DC9 actually depends on D3 and PCODE simply remove power if SW allowed.

Is this the case for both igfx and dgfx?

Anusha

> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c index
> 2c2c5086..9a22246c 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -531,8 +531,6 @@ int main(int argc, char *argv[])
>=20
>  	igt_describe("This test validates display engine entry to DC9 state");
>  	igt_subtest("dc9-dpms") {
> -
> 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> -				"PC8+ residencies not supported\n");
>  		test_dc9_dpms(&data);
>  	}
>=20
> --
> 2.34.1
