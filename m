Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC6B10E064
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 10:01:49 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>
Date: Wed, 26 Apr 2023 10:01:39 +0000
Message-ID: <DM6PR11MB4492578F30201836AACD4A748D659@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230425184142.3089518-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20230425184142.3089518-1-janga.rahul.kumar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_query: Add subtest
 query-invalid-extension
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> janga.rahul.kumar@intel.com
> Sent: 26 April 2023 12:12 AM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [igt-dev] [PATCH i-g-t] tests/xe/xe_query: Add subtest query-inv=
alid-
> extension
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Check query with invalid extension returns expected error code.
>=20
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/xe/xe_query.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c index
> 3f038225..6c35730c 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -435,6 +435,23 @@ test_query_invalid_size(int fd)
>  	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> -1);  }
>=20
> +/**
> + * SUBTEST: query-invalid-extension
> + * Description: Check query with invalid extension returns expected erro=
r
> code.
> + */
> +static void
> +test_query_invalid_extension(int fd)
> +{
> +	struct drm_xe_device_query query =3D {
> +		.extensions =3D -1,
> +		.query =3D DRM_XE_DEVICE_QUERY_CONFIG,
> +		.size =3D 0,
> +		.data =3D 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query),
> -1); }
> +
>  igt_main
>  {
>  	int xe;
> @@ -468,6 +485,9 @@ igt_main
>  	igt_subtest("query-invalid-size")
>  		test_query_invalid_size(xe);
>=20
> +	igt_subtest("query-invalid-extension")
> +		test_query_invalid_extension(xe);
> +
LGTM
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>  	igt_fixture {
>  		xe_device_put(xe);
>  		close(xe);
> --
> 2.25.1
