Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF2210E0E9
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Dec 2022 14:07:02 +0000 (UTC)
Message-ID: <207d323b-a590-89c1-f164-7f61ddeea583@intel.com>
Date: Fri, 30 Dec 2022 19:36:57 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221115170855.196572-45-bhanuprakash.modem@intel.com>
 <20221229051736.2888478-1-bhanuprakash.modem@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20221229051736.2888478-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t v6 44/52] tests/i915/kms_flip_scaled_crc: Add
 support for Bigjoiner
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

This patch LGTM.

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 29-Dec-22 10:47 AM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
> 
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
> 
> V2: - Use updated helper name
> V3: - Fix dangling pointer
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_flip_scaled_crc.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 10465ca7..7f7a59b9 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -648,8 +648,13 @@ igt_main
>   			for_each_pipe(&data.display, pipe) {
>   				bool found = false;
>   				for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +					igt_display_reset(&data.display);
> +
>   					modetoset = find_mode(&data, output);
> -					if (modetoset) {
> +					igt_output_set_pipe(output, pipe);
> +					igt_output_override_mode(output, modetoset);
> +
> +					if (modetoset && i915_pipe_output_combo_valid(&data.display)) {
>   						found = true;
>   						igt_dynamic_f("pipe-%s-valid-mode", kmstest_pipe_name(pipe))
>   							run_tests(&data, index, pipe, output, modetoset);
> @@ -658,6 +663,13 @@ igt_main
>   				}
>   				if (!found) {
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +						igt_display_reset(&data.display);
> +
> +						igt_output_set_pipe(output, pipe);
> +						if (!i915_pipe_output_combo_valid(&data.display))
> +							continue;
> +
> +						modetoset = NULL;
>   						igt_dynamic_f("pipe-%s-default-mode", kmstest_pipe_name(pipe))
>   							run_tests(&data, index, pipe, output, modetoset);
>   					}

-- 
~Swati Sharma
