Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4018.proton.ch (mail-4018.proton.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6849310E450
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jul 2023 09:43:13 +0000 (UTC)
Date: Wed, 26 Jul 2023 09:43:07 +0000
To: Erik Kurzinger <ekurzinger@nvidia.com>
From: Simon Ser <contact@emersion.fr>
Message-ID: <rOMfgyv59TFDh11y6sCRvXRsQpKuVPfkmXhk4KMtAHZNO0D6VhudiLseaz-V1uXMq7b5jjwg1NsWeEkLe4gcNzRy6ezOSOQ4TIqcYyQTYWs=@emersion.fr>
In-Reply-To: <2aafc4e6-0ba7-5d78-4adb-0a0368f74792@nvidia.com>
References: <2aafc4e6-0ba7-5d78-4adb-0a0368f74792@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH] tests/syncobj_sync_file: new test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Austin Shafer <ashafer@nvidia.com>,
 James Jones <jajones@nvidia.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Overall looks pretty good to me, a few comments below.

On Tuesday, July 25th, 2023 at 00:33, Erik Kurzinger <ekurzinger@nvidia.com=
> wrote:

> diff --git a/lib/igt_syncobj.h b/lib/igt_syncobj.h
> index e6725671d..01f5f062b 100644
> --- a/lib/igt_syncobj.h
> +++ b/lib/igt_syncobj.h
> @@ -34,7 +34,9 @@ int __syncobj_handle_to_fd(int fd, struct drm_syncobj_h=
andle *args);
>  int __syncobj_fd_to_handle(int fd, struct drm_syncobj_handle *args);
>  int syncobj_handle_to_fd(int fd, uint32_t handle, uint32_t flags);
>  uint32_t syncobj_fd_to_handle(int fd, int syncobj_fd, uint32_t flags);
> +int __syncobj_import_sync_file(int fd, struct drm_syncobj_sync_file *arg=
s);
>  void syncobj_import_sync_file(int fd, uint32_t handle, int sync_file);
> +int __syncobj_export_sync_file(int fd, struct drm_syncobj_sync_file *arg=
s);

Hm, this is a bit confusing because the old transfer logic and the new IOCT=
L
both have the same name modulo the "__" prefix. Usually IGT uses a pattern
where the function without the "__" prefix just calls the one with the pref=
ix
and asserts that it succeeds. Maybe we should rename the old functions in a
separate patch? Or find a different name for the new functions?

Optional nit: maybe it would be more ergonomic if the new function took
arguments instead of a struct drm_syncobj_sync_file. Callers wouldn't have =
to
init the struct.

> +const char *test_binary_import_export_desc =3D
> +=09"Verifies importing and exporting a sync file with a binary syncobj."=
;
> +static void
> +test_binary_import_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09int timeline =3D sw_sync_timeline_create();
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 1);
> +=09args.point =3D 0;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
> +=09close(args.fd);
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
> +
> +=09igt_assert(!syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
> +=09igt_assert_eq(sync_fence_status(args.fd), 0);
> +
> +=09sw_sync_timeline_inc(timeline, 1);
> +=09igt_assert(syncobj_wait(fd, &args.handle, 1, 0, 0, NULL));
> +=09igt_assert_eq(sync_fence_status(args.fd), 1);
> +
> +=09close(args.fd);
> +=09close(timeline);
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +const char *test_timeline_import_export_desc =3D
> +=09"Verifies importing and exporting sync files with a timeline syncobj.=
";
> +static void
> +test_timeline_import_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09int timeline =3D sw_sync_timeline_create();
> +=09int fence1, fence2;
> +=09uint64_t point1 =3D 1, point2 =3D 2;
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 1);
> +=09args.point =3D 1;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
> +=09close(args.fd);
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
> +=09fence1 =3D args.fd;
> +
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 2);
> +=09args.point =3D 2;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), 0);
> +=09close(args.fd);
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), 0);
> +=09fence2 =3D args.fd;
> +
> +=09igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0,=
 NULL));
> +=09igt_assert_eq(sync_fence_status(fence1), 0);
> +=09igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0,=
 NULL));
> +=09igt_assert_eq(sync_fence_status(fence2), 0);
> +
> +=09sw_sync_timeline_inc(timeline, 1);
> +=09igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, =
NULL));
> +=09igt_assert_eq(sync_fence_status(fence1), 1);
> +=09igt_assert(!syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0,=
 NULL));
> +=09igt_assert_eq(sync_fence_status(fence2), 0);
> +
> +=09sw_sync_timeline_inc(timeline, 1);
> +=09igt_assert(syncobj_timeline_wait(fd, &args.handle, &point1, 1, 0, 0, =
NULL));
> +=09igt_assert_eq(sync_fence_status(fence1), 1);
> +=09igt_assert(syncobj_timeline_wait(fd, &args.handle, &point2, 1, 0, 0, =
NULL));
> +=09igt_assert_eq(sync_fence_status(fence2), 1);
> +
> +=09close(fence1);
> +=09close(fence2);
> +=09close(timeline);
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +const char *test_invalid_handle_import_desc =3D
> +=09"Verifies that importing a sync file to an invalid syncobj fails.";
> +static void
> +test_invalid_handle_import(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09int timeline =3D sw_sync_timeline_create();
> +
> +=09args.handle =3D 0;
> +=09args.point =3D 0;
> +=09args.fd =3D sw_sync_timeline_create_fence(timeline, 1);
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);

Shouldn't this be ENOENT?

drm_syncobj_import_sync_file_fence() returns ENOENT when drm_syncobj_find()
fails.

> +
> +=09close(args.fd);
> +=09close(timeline);
> +}
> +
> +const char *test_invalid_handle_export_desc =3D
> +=09"Verifies that exporting a sync file from an invalid syncobj fails.";
> +static void
> +test_invalid_handle_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +
> +=09args.handle =3D 0;
> +=09args.point =3D 0;
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);

Ditto

> +}
> +
> +const char *test_invalid_fd_import_desc =3D
> +=09"Verifies that importing an invalid sync file fails.";
> +static void
> +test_invalid_fd_import(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.point =3D 0;
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_import_sync_file(fd, &args), -EINVAL);
> +
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +const char *test_unsubmitted_export_desc =3D
> +=09"Verifies that exporting a sync file for an unsubmitted point fails."=
;
> +static void
> +test_unsubmitted_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +
> +=09args.handle =3D syncobj_create(fd, 0);
> +=09args.point =3D 0;
> +=09args.fd =3D -1;
> +=09igt_assert_eq(__syncobj_export_sync_file(fd, &args), -EINVAL);
> +
> +=09syncobj_destroy(fd, args.handle);
> +}
> +
> +static bool has_syncobj_timeline(int fd)
> +{
> +=09uint64_t value;
> +=09return drmGetCap(fd, DRM_CAP_SYNCOBJ_TIMELINE,
> +=09=09=09 &value) =3D=3D 0 && value;
> +}
> +
> +static bool has_syncobj_sync_file_import_export(int fd)
> +{
> +=09struct drm_syncobj_sync_file args =3D { 0 };
> +=09args.handle =3D 0xffffffff;

0 is guaranteed to always be an invalid drm_syncobj handle, while in theory
0xffffffff could be a valid one. So it's a bit safer to just leave the hand=
le
to zero here.

> +=09/* if sync file import/export is supported this will fail with ENOENT=
,
> +=09 * otherwise it will fail with EINVAL */
> +=09return __syncobj_export_sync_file(fd, &args) =3D=3D -ENOENT;
> +}
