Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20220411185042.24338-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220411185042.24338-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 12 Apr 2022 09:26:39 +0100
Message-ID: <CAM0jSHOemXQz+qFWOY3ztGeJE4xstvYhXKdW6Kr2PVKppHKKqQ@mail.gmail.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/drm_buddy: Add drm buddy test
 cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, igt-dev@lists.freedesktop.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
 alexander.deucher@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 11 Apr 2022 at 19:51, Arunpravin Paneer Selvam
<Arunpravin.PaneerSelvam@amd.com> wrote:
>
> Add a set of drm buddy test cases to validate the
> drm/drm_buddy.c memory allocator.
>
> v2: sorted in alphabetical order
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Tests look to be passing in CI sharded runs. Pushed. Thanks.

> ---
>  tests/drm_buddy.c | 14 ++++++++++++++
>  tests/meson.build |  1 +
>  2 files changed, 15 insertions(+)
>  create mode 100644 tests/drm_buddy.c
>
> diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> new file mode 100644
> index 00000000..06876e0c
> --- /dev/null
> +++ b/tests/drm_buddy.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struc=
t drm_buddy)");
> +
> +igt_main
> +{
> +       igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index b0eab3d6..7261e9aa 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -8,6 +8,7 @@ test_progs =3D [
>         'debugfs_test',
>         'dmabuf',
>         'device_reset',
> +       'drm_buddy',
>         'drm_import_export',
>         'drm_mm',
>         'drm_read',
> --
> 2.25.1
>
