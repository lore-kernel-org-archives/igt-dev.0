Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC6BE10E7A4
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 11:52:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231208002944.1290951-3-matthew.d.roper@intel.com>
References: <20231208002944.1290951-1-matthew.d.roper@intel.com>
 <20231208002944.1290951-3-matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/xe_query: Query and sanity-check GT ip
 versions
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Dec 2023 08:52:18 -0300
Message-ID: <170246833854.7223.1917836669854933971@gjsousa-mobl2>
MIME-Version: 1.0
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

Quoting Matt Roper (2023-12-07 21:29:44-03:00)
>Update the query test to include the GT's IP version in the output and
>to also perform some simple sanity checks on the version received.  We
>don't want to try to match any specific version numbers (since we expect
>new versions to show up in the future), but we do know that the uapi
>should never return version numbers older than 12.70 for the primary GT
>or 13.00 for the media GT since those were the first IP versions to
>include GMD_ID support.  We also know that MTL/ARL are the only pre-Xe2
>platforms to support GMD_ID, so if we're not running on MTL/ARL, the
>version numbers must always be 20.00 or greater.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

I would only replace "Query" with "Print" in the commit subject, as we
are not extending the query (or making a new one) to get ip versions -
they are going to be there by default for the platforms that contain
GMD_ID.

Other than that,

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tests/intel/xe_query.c | 28 ++++++++++++++++++++++++++++
> 1 file changed, 28 insertions(+)
>
>diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
>index 338ef6151..0e66b2eec 100644
>--- a/tests/intel/xe_query.c
>+++ b/tests/intel/xe_query.c
>@@ -259,6 +259,7 @@ test_query_mem_regions(int fd)
> static void
> test_query_gt_list(int fd)
> {
>+        uint16_t dev_id =3D intel_get_drm_devid(fd);
>         struct drm_xe_query_gt_list *gt_list;
>         struct drm_xe_device_query query =3D {
>                 .extensions =3D 0,
>@@ -278,13 +279,40 @@ test_query_gt_list(int fd)
>         igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0=
);
>=20
>         for (i =3D 0; i < gt_list->num_gt; i++) {
>+                int verx100 =3D 100 * gt_list->gt_list[i].ip_ver_major +
>+                        gt_list->gt_list[i].ip_ver_minor;
>+
>                 igt_info("type: %d\n", gt_list->gt_list[i].type);
>                 igt_info("gt_id: %d\n", gt_list->gt_list[i].gt_id);
>+                igt_info("IP version: %d.%02d, stepping %d\n",
>+                         gt_list->gt_list[i].ip_ver_major,
>+                         gt_list->gt_list[i].ip_ver_minor,
>+                         gt_list->gt_list[i].ip_ver_rev);
>                 igt_info("reference_clock: %u\n", gt_list->gt_list[i].ref=
erence_clock);
>                 igt_info("near_mem_regions: 0x%016llx\n",
>                        gt_list->gt_list[i].near_mem_regions);
>                 igt_info("far_mem_regions: 0x%016llx\n",
>                        gt_list->gt_list[i].far_mem_regions);
>+
>+                /* Sanity check IP version. */
>+                if (verx100) {
>+                        /*
>+                         * First GMD_ID platforms had graphics 12.70 and =
media
>+                         * 13.00 so we should never see non-zero values l=
ower
>+                         * than those.
>+                         */
>+                        if (gt_list->gt_list[i].type =3D=3D DRM_XE_QUERY_=
GT_TYPE_MEDIA)
>+                                igt_assert_lte(1300, verx100);
>+                        else
>+                                igt_assert_lte(1270, verx100);
>+
>+                        /*
>+                         * Aside from MTL/ARL, all version numbers should=
 be
>+                         * 20.00 or higher.
>+                         */
>+                        if (!IS_METEORLAKE(dev_id))
>+                                igt_assert_lte(20, gt_list->gt_list[i].ip=
_ver_major);
>+                }
>         }
> }
>=20
>--=20
>2.43.0
>
