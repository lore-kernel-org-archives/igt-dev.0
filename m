Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB0E89220
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 06:48:30 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Tue, 27 Jun 2023 06:48:26 +0000
Message-ID: <BYAPR11MB3413C7648FD2C6B685450851D027A@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230627061139.1989685-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230627061139.1989685-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_spin: Add support to create
 non-preemptive spin batch
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

Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

> -----Original Message-----
> From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Sent: Tuesday, June 27, 2023 11:42 AM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Ch, Sai Gowtham
> <sai.gowtham.ch@intel.com>
> Subject: [PATCH i-g-t] lib/xe/xe_spin: Add support to create non-preempti=
ve spin
> batch
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Add support to create non-preemptive batch during spinner creation.
>=20
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  lib/xe/xe_spin.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c index 9f511e14..529b7684=
 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -131,7 +131,11 @@ xe_spin_create(int fd, const struct igt_spin_factory
> *opt)
>  	addr =3D intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_siz=
e,
> 0, ALLOC_STRATEGY_LOW_TO_HIGH);
>  	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
>=20
> -	xe_spin_init(xe_spin, addr, true);
> +	if (!(opt->flags & IGT_SPIN_NO_PREEMPTION))
> +		xe_spin_init(xe_spin, addr, true);
> +	else
> +		xe_spin_init(xe_spin, addr, false);
> +
>  	exec.engine_id =3D spin->engine;
>  	exec.address =3D addr;
>  	sync.handle =3D spin->syncobj;
> --
> 2.25.1
