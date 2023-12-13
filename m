Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5871210E773
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Dec 2023 11:47:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231208002944.1290951-2-matthew.d.roper@intel.com>
References: <20231208002944.1290951-1-matthew.d.roper@intel.com>
 <20231208002944.1290951-2-matthew.d.roper@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] drm-uapi/xe: Add IP version to GT query
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 13 Dec 2023 08:47:13 -0300
Message-ID: <170246803388.7223.8732979325490264301@gjsousa-mobl2>
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

Quoting Matt Roper (2023-12-07 21:29:43-03:00)
>Align with commit ("drm/xe/uapi: Add IP version and stepping to GT list
>query")
>
>v2:
> - s/revid/rev/ to match rename on kernel series
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> include/drm-uapi/xe_drm.h | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>index 590f7b7af..19048956b 100644
>--- a/include/drm-uapi/xe_drm.h
>+++ b/include/drm-uapi/xe_drm.h
>@@ -396,8 +396,16 @@ struct drm_xe_gt {
>          * memory and memory living in a different tile.
>          */
>         __u64 far_mem_regions;
>+        /** @ip_ver_major: Graphics/media IP major version on GMD_ID plat=
forms */
>+        __u16 ip_ver_major;
>+        /** @ip_ver_minor: Graphics/media IP minor version on GMD_ID plat=
forms */
>+        __u16 ip_ver_minor;
>+        /** @ip_ver_rev: Graphics/media IP revision version on GMD_ID pla=
tforms */
>+        __u16 ip_ver_rev;
>+        /** @pad2: MBZ */
>+        __u16 pad2;
>         /** @reserved: Reserved */
>-        __u64 reserved[8];
>+        __u64 reserved[7];
> };
>=20
> /**
>--=20
>2.43.0
>
