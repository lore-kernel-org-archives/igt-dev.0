Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E4510E0D3
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 20:14:40 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3f39fc06acaso323091cf.1
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 13:14:38 -0700 (PDT)
Message-ID: <26f900893730fe8876ffa7b417ae2262efa3473c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 janga.rahul.kumar@intel.com
Date: Tue, 16 May 2023 16:14:36 -0400
In-Reply-To: <20230516165058.4047595-8-bhanuprakash.modem@intel.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-8-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t 07/20] tests/nouveau_crc: Close the fd before
 exit
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

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2023-05-16 at 22:20 +0530, Bhanuprakash Modem wrote:
> Close the file descriptor before exiting the test.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/nouveau_crc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/nouveau_crc.c b/tests/nouveau_crc.c
> index 785d39bde..d5aa0e650 100644
> --- a/tests/nouveau_crc.c
> +++ b/tests/nouveau_crc.c
> @@ -409,7 +409,9 @@ igt_main
>  =09=09=09close(data.nv_crc_dir);
>  =09=09}
>  =09}
> -=09igt_fixture
> -=09=09igt_display_fini(&data.display);
> =20
> +=09igt_fixture {
> +=09=09igt_display_fini(&data.display);
> +=09=09drm_close_driver(data.drm_fd);
> +=09}
>  }

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
