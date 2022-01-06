Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362D910EF95
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Jan 2022 04:28:03 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
Date: Thu, 6 Jan 2022 04:27:58 +0000
Message-ID: <DM6PR11MB4492777150BAEC664188C33E8D4C9@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20220105101022.1604358-1-priyanka.dandamudi@intel.com>
 <87r19la8lq.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87r19la8lq.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/i915/gem_ctx_exec: Skip test
 for RCS+CCS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: 06 January 2022 08:12 AM
To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
Cc: igt-dev@lists.freedesktop.org; Melkaveri, Arjun <arjun.melkaveri@intel.=
com>; Harrison, John C <john.c.harrison@intel.com>; Gupta, saurabhg <saurab=
hg.gupta@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/i915/gem_ctx_exec: Skip test for RCS+CC=
S

On Wed, 05 Jan 2022 02:10:22 -0800, <priyanka.dandamudi@intel.com> wrote:
>
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c=20
> index a1270a88..7b2aa390 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -276,6 +276,8 @@ static void nohangcheck_hostile(int i915)
>	int err =3D 0;
>	int dir;
>	uint64_t ahnd;
> +	bool rcs0 =3D false;
> +	bool ccs0 =3D false;
>
>	/*
>	 * Even if the user disables hangcheck during their context,  @@=20
>-292,6 +294,20 @@ static void nohangcheck_hostile(int i915)
>	ahnd =3D get_reloc_ahnd(i915, ctx->id);
>
>	igt_require(__enable_hangcheck(dir, false));
> +	/* Skips for RCS+CCS combination when nopreemption batch submitted*/
> +	for_each_ctx_engine (i915, ctx, e) {
> +		if (rcs0 && ccs0)
> +			break;
> +		else if (!rcs0) {

As I said before I don't see any point of these 'if (!rcs0)' and 'if (!ccs0=
)' checks.

Then will check the instance number as well along with class or else the cl=
ass condition gets satisfied every time and same flag gets updated.

Priyanka

Also isn't this functionality (both rcs and ccs preset detection) needed el=
sewhere where dependent resets need to be handled? In that case, this funct=
ionality should be moved to lib/ so it can be shared between multiple tests=
.

Yeah, will move to library.

Priyanka



> +			if (e->class =3D=3D I915_ENGINE_CLASS_RENDER)
> +				rcs0 =3D true;
> +		}
> +		else if (!ccs0) {
> +			if (e->class =3D=3D I915_ENGINE_CLASS_COMPUTE)
> +				ccs0 =3D true;
> +		}
> +	}
> +	igt_require(!(rcs0 && ccs0));
