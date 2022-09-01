Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F8089048
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 09:16:22 +0000 (UTC)
Message-ID: <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
Date: Thu, 1 Sep 2022 14:45:57 +0530
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, <igt-dev@lists.freedesktop.org>
References: <20220831101100.1242315-1-mwen@igalia.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220831101100.1242315-1-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: fix crc assert
 condition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
> In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was replaced by
> 
> ret = !igt_skip_crc_compare || igt_check_crc_equal()
> and then igt_assert(ret)
> 
> where igt_check_crc_equal returns !mismatch, and therefore we can
> translate as:
> 
> ret = !igt_skip_crc_compare || !mismatch
> 
> However, the original igt_assert_crc_equal() assertion does:
> 
> igt_assert(!mismatch || igt_skip_crc_compare)
> 
> That means, the replacement changes the original assertion. Moreover,
> negating `igt_skip_crc_compare` makes the test assertion to be always
> true (sucessful) by default and reverses the logic of
> --skip-crc-compare.
> 
> Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
> Signed-off-by: Melissa Wen <mwen@igalia.com>

LGTM
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> ---
>   tests/kms_color.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index c202547e..ab285af8 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -99,7 +99,7 @@ static bool test_pipe_degamma(data_t *data,
>   	 * Verify that the CRC of the software computed output is
>   	 * equal to the CRC of the degamma LUT transformation output.
>   	 */
> -	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
> +	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
>   
>   	disable_degamma(primary->pipe);
>   	igt_plane_set_fb(primary, NULL);
> @@ -188,7 +188,7 @@ static bool test_pipe_gamma(data_t *data,
>   	 * Verify that the CRC of the software computed output is
>   	 * equal to the CRC of the gamma LUT transformation output.
>   	 */
> -	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
> +	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
>   
>   	disable_gamma(primary->pipe);
>   	igt_plane_set_fb(primary, NULL);
> @@ -289,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	 * Verify that the CRC of the software computed output is
>   	 * equal to the CRC of the gamma LUT transformation output.
>   	 */
> -	ret = !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
> +	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc_fullcolors);
>   
>   	/* Reset output. */
>   	for (i = 1; i < legacy_lut_size; i++)
> @@ -534,7 +534,7 @@ static bool test_pipe_ctm(data_t *data,
>   	 * Verify that the CRC of the software computed output is
>   	 * equal to the CRC of the CTM matrix transformation output.
>   	 */
> -	ret &= !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
> +	ret &= igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &crc_hardware);
>   
>   	igt_plane_set_fb(primary, NULL);
>   	igt_output_set_pipe(output, PIPE_NONE);
