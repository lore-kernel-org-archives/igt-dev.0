Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F35D10E345
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 08:34:38 +0000 (UTC)
Message-ID: <b7ee0653-8f1e-283f-b099-7efa21a239aa@intel.com>
Date: Wed, 28 Sep 2022 14:04:23 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
 <20220909140331.1041095-21-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220909140331.1041095-21-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V3 20/52] tests/kms_multipipe_modeset: Find
 the suitable mode instead of using default
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

On 9/9/2022 7:32 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_multipipe_modeset.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index 6358d930..6ba6943e 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -46,6 +46,15 @@ static void run_test(data_t *data, int valid_outputs)
>   	drmModeModeInfo *mode;
>   	int i = 0;
>   
> +	/* Find suitable mode/resolution combo */
> +	for_each_connected_output(display, output) {
> +		pipe = &display->pipes[i];
> +		igt_output_set_pipe(output, i);
> +
> +		i++;
> +	}
> +	igt_require(igt_override_all_active_output_modes_to_fit_bw(display));
> +
Agree with the idea of the patch. Please update the commit message for 
this subtest as here we're actually reducing the mode from 8k to a mode 
that can be supported on single pipe.
With this updated the patch LGTM.

Thanks,
Karthik.B.S
>   	for_each_connected_output(display, output) {
>   		mode = igt_output_get_mode(output);
>   		igt_assert(mode);

