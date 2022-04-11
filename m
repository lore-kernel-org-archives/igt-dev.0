Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Message-ID: <5b8cc915-3549-06a6-f994-3304bca536ef@intel.com>
Date: Mon, 11 Apr 2022 10:38:16 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH] tests/drm_buddy: Add drm buddy test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 11/04/2022 08:28, Arunpravin Paneer Selvam wrote:
> Add a set of drm buddy test cases to validate the
> drm/drm_buddy.c memory allocator.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   tests/drm_buddy.c | 14 ++++++++++++++
>   tests/meson.build |  1 +
>   2 files changed, 15 insertions(+)
>   create mode 100644 tests/drm_buddy.c
> 
> diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> new file mode 100644
> index 00000000..06876e0c
> --- /dev/null
> +++ b/tests/drm_buddy.c
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2019 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_kmod.h"
> +
> +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
> +
> +igt_main
> +{
> +	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index b0eab3d6..4ed8e610 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -10,6 +10,7 @@ test_progs = [
>   	'device_reset',
>   	'drm_import_export',
>   	'drm_mm',
> +	'drm_buddy',

Nit: Should be kept sorted. No need to resend though.

Reviewed-by: Matthew Auld <matthew.auld@intel.com>


>   	'drm_read',
>   	'fbdev',
>   	'feature_discovery',
> 
> base-commit: 016a7169e66b710a6720ed8ff94815a7e8076541
