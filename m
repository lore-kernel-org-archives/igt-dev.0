Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3113410E0EC
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jul 2023 15:18:31 +0000 (UTC)
Message-ID: <47ec7785-442a-1f63-424d-a268bfdcc546@amd.com>
Date: Tue, 25 Jul 2023 11:21:02 -0400
To: Stylon Wang <stylon.wang@amd.com>, igt-dev@lists.freedesktop.org
References: <20230713141830.335019-1-stylon.wang@amd.com>
Content-Language: en-US
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230713141830.335019-1-stylon.wang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] test/amdgpu/amd_color: Add test
 description to amd_color tests
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



On 7/13/23 10:18, Stylon Wang wrote:
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>   tests/amdgpu/amd_color.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 34002ed88..4a98df3be 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -22,6 +22,8 @@
>   
>   #include "igt.h"
>   
> +IGT_TEST_DESCRIPTION("Test Color Features for DRM conformance");
> +
>   /* (De)gamma LUT. */
>   typedef struct lut {
>   	struct drm_color_lut *data;
> @@ -409,8 +411,11 @@ igt_main
>   		igt_display_require_output(&data.display);
>   	}
>   
> +	igt_describe("Tests correctness of linear degamma on CRTC");
>   	igt_subtest("crtc-linear-degamma") test_crtc_linear_degamma(&data);
> +	igt_describe("Tests correctness of linear regamma on CRTC");
>   	igt_subtest("crtc-linear-regamma") test_crtc_linear_regamma(&data);
> +	igt_describe("Tests color accuracy of CRTC degamma and regamma");
>   	igt_subtest("crtc-lut-accuracy") test_crtc_lut_accuracy(&data);
>   
>   	igt_fixture

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
