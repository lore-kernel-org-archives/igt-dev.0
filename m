Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D977510E4D4
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 09:44:33 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 2 May 2023 09:44:29 +0000
Message-ID: <MW3PR11MB4748B4937FBF0B72D8CAB76CAE6F9@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230502085307.3341569-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20230502085307.3341569-1-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_create: Exercise oversized
 object detection
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
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: 02 May 2023 14:23
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t] tests/xe/xe_create: Exercise oversized object dete=
ction
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Create an oversized object and try to check if it throws an error.
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_create.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c index
> ae841f80..a4dc6a12 100644
> --- a/tests/xe/xe_create.c
> +++ b/tests/xe/xe_create.c
> @@ -82,6 +82,13 @@ static void create_invalid_size(int fd)
>  			}
>  			igt_assert_eq(ret, -EINVAL);
>  		}
> +		/* Try creating size greater than available */
I will recommend you to add this as a separate subtest as it is not checkin=
g for any invalid error.
Add the new subtest to XE BAT as well.
> +		ret =3D __create_bo(fd, vm, -1ULL << 32, region, &handle);
> +		if (!ret) {
> +			gem_close(fd, handle);
> +			xe_vm_destroy(fd, vm);
> +		}
> +		igt_assert_eq(ret, -ENOSPC);
>  	}
>=20
>  	xe_vm_destroy(fd, vm);
> --
> 2.25.1

With above suggested minor changes.
Acked-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
