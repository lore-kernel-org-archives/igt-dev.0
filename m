Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB47910E301
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 17:22:11 +0000 (UTC)
Message-ID: <aa6f236e-3263-6841-5663-b4363a81270e@amd.com>
Date: Tue, 20 Jun 2023 11:21:30 -0600
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, stylon.wang@amd.com,
 hamza.mahfooz@amd.com
References: <20230620135425.32639-1-hersenxs.wu@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230620135425.32639-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_color: fix test
 crash within crtc_lut_accuracy
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



On 2023-06-20 07:54, Hersen Wu wrote:
> Add reading degamma_lut_size and regamma_lut_size from Linux kernel.
> Test crash when lut_size equals to zero.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_color.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 9eed1da38..97a3c16ec 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -340,6 +340,14 @@ static void test_crtc_lut_accuracy(data_t *data)
>   	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT));
>   	igt_require(igt_pipe_obj_has_prop(data->pipe, IGT_CRTC_GAMMA_LUT));
>   
> +	data->degamma_lut_size =
> +		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_DEGAMMA_LUT_SIZE);
> +	igt_assert_lt(0, data->degamma_lut_size);
> +
> +	data->regamma_lut_size =
> +		igt_pipe_obj_get_prop(data->pipe, IGT_CRTC_GAMMA_LUT_SIZE);
> +	igt_assert_lt(0, data->regamma_lut_size);
> +
>   	lut_init(&lut_degamma, data->degamma_lut_size);
>   	lut_gen_degamma_srgb(&lut_degamma, 0xffff);
>   

The size check can be placed in "lut_init" so they aren't duplicated at 
various places since both data->degamma_lut_size and 
data->regamma_lut_size are past to lut_init.

Then similar checks in other functions can also be removed as well.
