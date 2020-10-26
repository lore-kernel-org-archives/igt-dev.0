Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 910C36E87E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2020 08:35:01 +0000 (UTC)
Date: Mon, 26 Oct 2020 10:34:56 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201026083456.GW7444@platvala-desk.ger.corp.intel.com>
References: <20201023231151.383909-1-jose.souza@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201023231151.383909-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Skip frontbuffer
 test in TGL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Oct 23, 2020 at 04:11:51PM -0700, Jos=E9 Roberto de Souza wrote:
> Due the commit 71c1a4998320 ("drm/i915/tgl/psr: Fix glitches when
> doing frontbuffer modifications"), frontbuffer test is expected to
> fail on TGL, so here skiping this test on TGL.
> When PSR issues is fixed the patch above will be reverted and we
> can revert this skip too.

How does the previous failure behave? I mean in the sense that what
does this skip gain? The skip will have to be cibuglog-filtered too so
no gain on that side.

Did the fail kill the machine, or is this just for saving runtime?


-- =

Petri Latvala



> =

> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Signed-off-by: Jos=E9 Roberto de Souza <jose.souza@intel.com>
> ---
>  tests/kms_psr2_su.c | 5 +++++
>  1 file changed, 5 insertions(+)
> =

> diff --git a/tests/kms_psr2_su.c b/tests/kms_psr2_su.c
> index d549d9a31..d554052f0 100644
> --- a/tests/kms_psr2_su.c
> +++ b/tests/kms_psr2_su.c
> @@ -279,6 +279,11 @@ igt_main
>  =

>  	for (data.op =3D PAGE_FLIP; data.op < LAST; data.op++) {
>  		igt_subtest_f("%s", op_str(data.op)) {
> +			if (data.op =3D=3D FRONTBUFFER) {
> +				const uint16_t devid =3D intel_get_drm_devid(data.drm_fd);
> +				igt_require(!IS_TIGERLAKE(devid));
> +			}
> +
>  			prepare(&data);
>  			run(&data);
>  			cleanup(&data);
> -- =

> 2.29.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
