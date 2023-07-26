Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20230725205626.346256-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230725205626.346256-1-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Wed, 26 Jul 2023 09:28:36 +0100
Message-ID: <CAM0jSHNOjGrrNhxYF_8H-jYUNjMPKyPzBpVejKtKQC_1=i0AMw@mail.gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] xe: Align uapi after removal of
 XE_QUERY_CONFIG_FLAGS_USE_GUC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 25 Jul 2023 at 21:56, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> drm-xe-next commit ("drm/xe/uapi: Remove XE_QUERY_CONFIG_FLAGS_USE_GUC")
>
> Also this is the header generated with:
> make -j21 headers_install  INSTALL_HDR_PATH=3D.
> ,as it should,
> what explains some other unrelated changes that are appearing
> in the diff below.
>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Does IGT build here? The second patch is still depending on
XE_QUERY_CONFIG_FLAGS_USE_GUC? Should the order be switched around or
maybe everything squashed into a single patch?

Otherwise for the series,
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 9 ++++-----
>  tests/xe/xe_query.c       | 3 ---
>  2 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 02419c1d5..1ea453737 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -3,8 +3,8 @@
>   * Copyright =C2=A9 2023 Intel Corporation
>   */
>
> -#ifndef _UAPI_XE_DRM_H_
> -#define _UAPI_XE_DRM_H_
> +#ifndef _XE_DRM_H_
> +#define _XE_DRM_H_
>
>  #include "drm.h"
>
> @@ -180,7 +180,7 @@ struct drm_xe_query_mem_region {
>          * zero.
>          */
>         __u64 used;
> -       /*
> +       /**
>          * @cpu_visible_size: How much of this region can be CPU
>          * accessed, in bytes.
>          *
> @@ -246,7 +246,6 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID      0
>  #define XE_QUERY_CONFIG_FLAGS                  1
>         #define XE_QUERY_CONFIG_FLAGS_HAS_VRAM          (0x1 << 0)
> -       #define XE_QUERY_CONFIG_FLAGS_USE_GUC           (0x1 << 1)
>  #define XE_QUERY_CONFIG_MIN_ALIGNEMENT         2
>  #define XE_QUERY_CONFIG_VA_BITS                        3
>  #define XE_QUERY_CONFIG_GT_COUNT               4
> @@ -1051,4 +1050,4 @@ struct drm_xe_vm_madvise {
>  }
>  #endif
>
> -#endif /* _UAPI_XE_DRM_H_ */
> +#endif /* _XE_DRM_H_ */
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index 47aa98a8f..a4e40afdd 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -371,9 +371,6 @@ test_query_config(int fd)
>         igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
>                 config->info[XE_QUERY_CONFIG_FLAGS] &
>                 XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
> -       igt_info("  XE_QUERY_CONFIG_FLAGS_USE_GUC\t\t%s\n",
> -               config->info[XE_QUERY_CONFIG_FLAGS] &
> -               XE_QUERY_CONFIG_FLAGS_USE_GUC ? "ON":"OFF");
>         igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
>                 config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
>         igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
> --
> 2.41.0
>
