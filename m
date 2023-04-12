Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA04C10E520
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 12:53:10 +0000 (UTC)
Date: Wed, 12 Apr 2023 14:53:06 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230412125306.zxycg52csbopvidd@kamilkon-desk1>
References: <20230411132946.17459-1-mcanal@igalia.com>
 <20230411132946.17459-4-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230411132946.17459-4-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] tests/vkms: Remove tests that are
 skipping
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

On 2023-04-11 at 10:29:46 -0300, Maíra Canal wrote:
> Currently, vkms doesn't support plane scaling. Therefore, all the
> kms_plane_scaling tests are skipping with the exception to the sub-test
> invalid-parameters. In order to have a testlist with only tests that are
> passing, remove all the tests that skipping.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/vkms_ci/vkms.testlist | 16 +---------------
>  1 file changed, 1 insertion(+), 15 deletions(-)
> 
> diff --git a/tests/vkms_ci/vkms.testlist b/tests/vkms_ci/vkms.testlist
> index cb15ded1..c3333bcb 100644
> --- a/tests/vkms_ci/vkms.testlist
> +++ b/tests/vkms_ci/vkms.testlist
> @@ -182,21 +182,7 @@ igt@kms_plane_cursor@primary
>  igt@kms_plane_cursor@viewport
>  igt@kms_plane_lowres@tiling-none
>  igt@kms_plane_multiple@tiling-none
> -igt@kms_plane_scaling@planes-downscale-factor-0-25
> -igt@kms_plane_scaling@planes-downscale-factor-0-5
> -igt@kms_plane_scaling@planes-downscale-factor-0-75
> -igt@kms_plane_scaling@planes-scaler-unity-scaling
> -igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
> -igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
> -igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
> -igt@kms_plane_scaling@planes-upscale-20x20
> -igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
> -igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
> -igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
> -igt@kms_plane_scaling@planes-upscale-factor-0-25
> -igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
> -igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
> -igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
> +igt@kms_plane_scaling@invalid-parameters
>  igt@kms_prop_blob@basic
>  igt@kms_prop_blob@blob-multiple
>  igt@kms_prop_blob@blob-prop-core
> -- 
> 2.39.2
> 
