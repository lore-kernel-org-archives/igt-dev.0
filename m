Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B1C10EA06
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 18:58:44 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 26 Apr 2023 18:58:41 +0000
Message-ID: <MW3PR11MB4748F814067C7881DDE97BEBAE659@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230425184003.3089338-1-janga.rahul.kumar@intel.com>
 <20230426101230.6ym5owacxguqkbas@zkempczy-mobl2>
In-Reply-To: <20230426101230.6ym5owacxguqkbas@zkempczy-mobl2>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/xe/xe_query: Add subtest
 query-invalid-extension
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> Sent: 26 April 2023 15:43
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: Re: [igt-dev] [PATCH] tests/xe/xe_query: Add subtest query-inval=
id-
> extension
>=20
> On Wed, Apr 26, 2023 at 12:10:03AM +0530, janga.rahul.kumar@intel.com
> wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > Check query with invalid extension returns expected error code.
> >
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  tests/xe/xe_query.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c index
> > 3f038225..6c35730c 100644
> > --- a/tests/xe/xe_query.c
> > +++ b/tests/xe/xe_query.c
> > @@ -435,6 +435,23 @@ test_query_invalid_size(int fd)
> >  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -
> 1);
> > }
> >
> > +/**
> > + * SUBTEST: query-invalid-extension
> > + * Description: Check query with invalid extension returns expected er=
ror
> code.
> > + */
> > +static void
> > +test_query_invalid_extension(int fd)
> > +{
> > +	struct drm_xe_device_query query =3D {
> > +		.extensions =3D -1,
> > +		.query =3D DRM_XE_DEVICE_QUERY_CONFIG,
> > +		.size =3D 0,
> > +		.data =3D 0,
> > +	};
> > +
> > +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -
> 1);
> > +}
> > +
> >  igt_main
> >  {
> >  	int xe;
> > @@ -468,6 +485,9 @@ igt_main
> >  	igt_subtest("query-invalid-size")
> >  		test_query_invalid_size(xe);
> >
> > +	igt_subtest("query-invalid-extension")
> > +		test_query_invalid_extension(xe);
> > +
>=20
> We need to start fixing those tests as they are not properly validating u=
api. See
> gem_mmap_offset@bad-extensions.
I think the best way here is to use the do_ioctl_err(..) wrapper. It will h=
elp in checking the expecting error as well.

-   igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), -1);
+   do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
>=20
> --
> Zbigniew
>=20
> >  	igt_fixture {
> >  		xe_device_put(xe);
> >  		close(xe);
> > --
> > 2.25.1
> >
