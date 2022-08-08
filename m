Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9731418AD24
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Aug 2022 21:15:10 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>
Date: Mon, 8 Aug 2022 21:15:06 +0000
Message-ID: <BYAPR11MB341333EEEC37C0AF69480823D0639@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20220808175458.156815-1-ashutosh.dixit@intel.com>
 <DM4PR11MB54226DDB989772A1B7E74A7286639@DM4PR11MB5422.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB54226DDB989772A1B7E74A7286639@DM4PR11MB5422.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/perf_pmu: Use correct
 context id in "enable-race"
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ashuto=
sh
> Dixit
> Sent: Monday, August 8, 2022 10:55 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/i915/perf_pmu: Use correct context=
 id in
> "enable-race"
>=20
> Use correct context id in "enable-race" test.
>=20
> Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/5490
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  tests/i915/perf_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c index
> e2b13540e76e..f363db2ba135 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -1809,7 +1809,7 @@ test_enable_race(int gem_fd, const intel_ctx_t *ctx=
,
>  	int fd;
>=20
>  	igt_require(gem_scheduler_has_engine_busy_stats(gem_fd));
> -	igt_require(gem_context_has_engine(gem_fd, 0, e->flags));
> +	igt_require(gem_context_has_engine(gem_fd, ctx->id, e->flags));
>=20
>  	obj.handle =3D gem_create(gem_fd, 4096);
>  	gem_write(gem_fd, obj.handle, 0, &bbend, sizeof(bbend));
> --
> 2.34.1
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
