Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43F210E95E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 06:41:39 +0000 (UTC)
Date: Fri, 10 Mar 2023 07:41:35 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Message-ID: <20230310074135.5609c2a8@maurocar-mobl2>
In-Reply-To: <874jqtmdas.wl-ashutosh.dixit@intel.com>
References: <20230307221236.913429-1-zbigniew.kempczynski@intel.com>
 <20230307221236.913429-3-zbigniew.kempczynski@intel.com>
 <875yb9mdn4.wl-ashutosh.dixit@intel.com>
 <874jqtmdas.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v7 2/7] lib/xe: Introduce Xe library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 09 Mar 2023 20:38:03 -0800
"Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:

> On Thu, 09 Mar 2023 20:30:39 -0800, Dixit, Ashutosh wrote:
> >
> > On Tue, 07 Mar 2023 14:12:31 -0800, Zbigniew Kempczy=C5=84ski wrote: =20
> > > =20
> >
> > Hi Zbyzsek,
> > =20
> > > +#define for_each_gt(__fd, __gt) \
> > > +	for (__gt =3D 0; __gt < xe_number_gt(__fd); ++__gt) =20
> >
> > This for_each_gt conflicts with for_each_gt in our internal i915 tree
> > (which were planning to post upstream soon). How do you want to resolve
> > this? =20
>=20
> Can we can just do this?
>=20
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index fe1343f6161..72ee6c9478b 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -66,6 +66,7 @@ struct xe_device {
>  #define for_each_hw_engine_class(__class) \
>         for (__class =3D 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>              ++__class)
> +#undef for_each_gt
>  #define for_each_gt(__fd, __gt) \
>         for (__gt =3D 0; __gt < xe_number_gt(__fd); ++__gt)
>=20
>=20

My two cents there: this works, but it is painful if the i915-specific
version is placed on a header used by both Xe and i915 drivers.

I can see two possible solutions:

1. ensure that the i915-specific version is placed on a lib/i915*
   header;

2. name such kind of macros after the name of the driver, e. g.:

	sed s,for_each_gt,xe_for_each_gt, -i lib/xe/* tests/xe/*
	sed s,for_each_gt,i915_for_each_gt, -i lib/i915/* tests/i915/*=20

They're not mutually exclusive.

Regards,
Mauro
