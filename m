Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C506E835
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Oct 2021 09:12:30 +0000 (UTC)
Date: Sat, 02 Oct 2021 09:12:20 +0000
From: Simon Ser <contact@emersion.fr>
Message-ID: <EYLQrjWdqM5qIMGMglwgXHEW-DExt3MmhTjSWtbdzxP0d6UT20JJ6eYHthZc22HsmG-HE3EUJlTFqfpkk3wBOErE_n3vTZwiLX2Ye05lyA4=@emersion.fr>
In-Reply-To: <20210903123027.1433-1-contact@emersion.fr>
References: <20210903123027.1433-1-contact@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [RFC i-g-t] tests/kms_lease: add empty lease test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Simon Ser <contact@emersion.fr>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arek@hiler.eu>, Mohammed Khajapasha <mohammed.khajapasha@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>
List-ID: <igt-dev@lists.freedesktop.org>

CC Petri, Arek, Mohammed, Boris

The kernel patch has been reviewed:
https://patchwork.freedesktop.org/patch/452368/

Anybody up for a review? :)

> This is an update for a kernel change currently being reviewed.
>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  tests/kms_lease.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index c5c88e145e1a..b69d99389de0 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -250,6 +250,15 @@ static void simple_lease(data_t *data)
>  =09terminate_lease(&lease);
>  }
>
> +static void empty_lease(data_t *data)
> +{
> +=09struct drm_mode_create_lease mcl =3D {0};
> +
> +=09igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +
> +=09close(mcl.fd);
> +}
> +
>  static void page_flip_implicit_plane(data_t *data)
>  {
>  =09uint32_t object_ids[3];
> @@ -842,16 +851,10 @@ static void run_test(data_t *data, void (*testfunc)=
(data_t *))
>  static void invalid_create_leases(data_t *data)
>  {
>  =09uint32_t object_ids[4];
> -=09struct drm_mode_create_lease mcl;
> +=09struct drm_mode_create_lease mcl =3D {0};
>  =09drmModeRes *resources;
>  =09int tmp_fd, ret;
>
> -=09/* empty lease */
> -=09mcl.object_ids =3D 0;
> -=09mcl.object_count =3D 0;
> -=09mcl.flags =3D 0;
> -=09igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);
> -
>  =09/* NULL array pointer */
>  =09mcl.object_count =3D 1;
>  =09igt_assert_eq(create_lease(data->master.fd, &mcl), -EFAULT);
> @@ -1221,6 +1224,7 @@ igt_main
>  =09=09const char *desc;
>  =09} funcs[] =3D {
>  =09=09{ "simple_lease", simple_lease, "Check if create lease ioctl call =
works" },
> +=09=09{ "empty_lease", empty_lease, "Check that creating an empty lease =
works" },
>  =09=09{ "lessee_list", lessee_list, "Check if listed lease is same as cr=
eated one" },
>  =09=09{ "lease_get", lease_get, "Tests getting the required contents of =
a lease" },
>  =09=09{ "lease_unleased_connector", lease_unleased_connector, "Negative =
test by trying to"
> --
> 2.33.0
