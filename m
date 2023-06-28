Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DA410E0E9
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 12:42:34 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
Date: Wed, 28 Jun 2023 12:42:22 +0000
Message-ID: <MW3PR11MB47487387842270DDF7DE04DFAE24A@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230628095239.615655-1-priyanka.dandamudi@intel.com>
 <20230628095239.615655-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230628095239.615655-2-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_sysfs: Add support to
 iterate over engines
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
> Sent: 28 June 2023 15:23
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; igt-dev@lists.freedesktop.org; Gandi, Ramadev=
i
> <ramadevi.gandi@intel.com>; Dandamudi, Priyanka
> <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/3] lib/igt_sysfs: Add support to iterate over eng=
ines
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> It helps to test engines by iterating over sysfs/engines.
>=20
> v2: Updated a parameter to accept array of strings to make dynamic for al=
l
> schedulers.
> Updated engine to engine_fd for better readability.(rahul) Added descript=
ion for
> lib function.(Kamil)
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  lib/igt_sysfs.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_sysfs.h |  3 +++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c index 35a4faa9a..3a4bf6f97=
 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -856,3 +856,50 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *r=
w)
>  	igt_assert_eq(get, prev);
>  	igt_assert(!ret);
>  }
> +
> +/**
> + * igt_sysfs_engines:
> + * @xe: fd of the device
> + * @engines: fd of the directory engine
> + * @property: property array
> + * @test: Dynamic engine test
> + *
> + * It iterates over sysfs/engines and runs a dynamic engine test.
> + *
> + */
> +void igt_sysfs_engines(int xe, int engines, const char **property,
> +		       void (*test)(int, int, const char **)) {
> +	struct dirent *de;
> +	DIR *dir;
> +
> +	lseek(engines, 0, SEEK_SET);
> +
> +	dir =3D fdopendir(engines);
> +	if (!dir)
> +		close(engines);
> +
> +	while ((de =3D readdir(dir))) {
> +		int engine_fd;
> +
> +		if (*de->d_name =3D=3D '.')
> +			continue;
> +
> +		engine_fd =3D openat(engines, de->d_name, O_RDONLY);
> +		if (engine < 0)
> +			continue;
> +
> +		igt_dynamic(de->d_name) {
> +			if (property) {
> +				struct stat st;
> +
> +				igt_require(fstatat(engine_fd, property[0], &st,
> 0) =3D=3D 0);
> +				igt_require(fstatat(engine_fd, property[1], &st,
> 0) =3D=3D 0);
> +				igt_require(fstatat(engine_fd, property[2], &st,
> 0) =3D=3D 0);
> +			}
> +			errno =3D 0;
> +			test(xe, engine_fd, property);
> +		}
> +		close(engine_fd);
> +	}
> +}
> diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index 978b6906e..5635fc690=
 100644
> --- a/lib/igt_sysfs.h
> +++ b/lib/igt_sysfs.h
> @@ -147,4 +147,7 @@ typedef struct igt_sysfs_rw_attr {
>=20
>  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
>=20
> +void igt_sysfs_engines(int xe, int engines, const char **property,
> +		       void (*test)(int, int, const char **));
> +
>  #endif /* __IGT_SYSFS_H__ */
> --
> 2.25.1

LGTM
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Thanks,
Rahul

