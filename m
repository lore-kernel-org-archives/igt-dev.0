Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92410E446
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 20:31:19 +0000 (UTC)
Message-ID: <58e72002-e40a-7557-ea8c-f5fe1c315c96@amd.com>
Date: Mon, 7 Nov 2022 13:31:11 -0700
To: Melissa Wen <mwen@igalia.com>, igt-dev@lists.freedesktop.org
References: <20221107195227.1741453-1-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20221107195227.1741453-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_color: check degamma and
 gamma props in CTM subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 2022-11-07 12:52, Melissa Wen wrote:
> Some CTM subtests generate and set degamma/gamma LUTs without checking
> if these properties are supported by the driver. Therefore, if degamma
> and gamma are used in the subtest, check the color properties before
> generate and set LUTs. If these properties are not supported, these
> subtests will skip instead of failing.
> 
> v2:
> - remove unnecessary set_luts check (Alex Hung)
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_color.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index e4dc2465..1902cd0c 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -472,9 +472,6 @@ static bool test_pipe_ctm(data_t *data,
>   
>   	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
>   
> -	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
> -	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
> -
>   	igt_output_set_pipe(output, primary->pipe->pipe);
>   	igt_output_override_mode(output, mode);
>   
> @@ -502,6 +499,12 @@ static bool test_pipe_ctm(data_t *data,
>   	 * rounding issues and inaccuracies leading to crc mismatch.
>   	 */
>   	if (memcmp(before, after, sizeof(color_t))) {
> +		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> +		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> +
> +		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
> +		gamma_linear = generate_table(data->gamma_lut_size, 1.0);
> +
>   		set_degamma(data, primary->pipe, degamma_linear);
>   		set_gamma(data, primary->pipe, gamma_linear);
>   	} else {

Reviewed-by: Alex Hung <alex.hung@amd.com>
