Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C8210EB79
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 15:48:57 +0000 (UTC)
Message-ID: <7127cc83-5abb-cca5-0cd3-8ee8a7e0333a@intel.com>
Date: Wed, 29 Mar 2023 21:18:51 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230328123210.3781976-1-bhanuprakash.modem@intel.com>
 <20230328123210.3781976-4-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230328123210.3781976-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [i-g-t V2 3/6] tests/i915/kms_dsc: Update bigjoiner
 pipe constraint
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

Hi Bhanu,

Shouldn't we use i915_pipe_output_combo_valid()?

On 28-Mar-23 6:02 PM, Bhanuprakash Modem wrote:
> Instead of writing own logic at test level, use existing IGT
> helper to check the bigjoiner support.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
> tests/i915/kms_dsc.c        | 17 ++++++++---------
> tests/i915/kms_dsc_helper.h |  2 --
> 2 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index b3c5e60c773..9c6a7780acd 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -47,7 +47,6 @@ typedef struct {
>     unsigned int plane_format;
>     igt_output_t *output;
>     int input_bpc;
> -    int n_pipes;
>     int disp_ver;
>     enum pipe pipe;
> } data_t;
> @@ -76,15 +75,19 @@ static bool 
> check_big_joiner_pipe_constraint(data_t *data)
> {
>     igt_output_t *output = data->output;
>     drmModeModeInfo *mode = get_highres_mode(output);
> +    bool ret = true;
>
> -    if (mode->hdisplay >= HDISPLAY_5K &&
> -        data->pipe == (data->n_pipes - 1)) {
> +    igt_output_set_pipe(output, data->pipe);
> +    igt_output_override_mode(output, mode);
> +
> +    if (!igt_check_bigjoiner_support(&data->display)) {
>         igt_debug("Pipe-%s not supported due to bigjoiner limitation\n",
>                kmstest_pipe_name(data->pipe));
> -        return false;
> +        ret = false;
>     }
> +    igt_output_set_pipe(output, PIPE_NONE);
>
> -    return true;
> +    return ret;
> }
>
> static void test_cleanup(data_t *data)
> @@ -206,7 +209,6 @@ static void test_dsc(data_t *data, enum 
> dsc_test_type test_type, int bpc,
> igt_main
> {
>     data_t data = {};
> -    int i;
>
>     igt_fixture {
>         data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> @@ -217,9 +219,6 @@ igt_main
>         igt_display_require(&data.display, data.drm_fd);
>         igt_display_require_output(&data.display);
>         igt_require(data.disp_ver >= 11);
> -        data.n_pipes = 0;
> -        for_each_pipe(&data.display, i)
> -            data.n_pipes++;
>     }
>
>     igt_describe("Tests basic display stream compression functionality 
> if supported "
> diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
> index fe479dac472..b3828dcd44a 100644
> --- a/tests/i915/kms_dsc_helper.h
> +++ b/tests/i915/kms_dsc_helper.h
> @@ -21,8 +21,6 @@
> #include <fcntl.h>
> #include <termios.h>
>
> -#define HDISPLAY_5K    5120
> -
> void force_dsc_enable(int drmfd, igt_output_t *output);
> void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int 
> input_bpc);
> void save_force_dsc_en(int drmfd, igt_output_t *output);
