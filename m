Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA2310E3B2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Sep 2022 04:53:12 +0000 (UTC)
Message-ID: <f88f56a1-97dc-aaf3-a582-7bb6bebe1fcf@intel.com>
Date: Wed, 14 Sep 2022 10:22:50 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220909140331.1041095-1-bhanuprakash.modem@intel.com>
 <20220909140331.1041095-26-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220909140331.1041095-26-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V3 25/52] tests/kms_plane_lowres: Add support
 for Bigjoiner
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

On 9/9/2022 7:33 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.
>
> V2: - Use updated helper name
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane_lowres.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index f37dbd16..9d60a196 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -277,6 +277,9 @@ static void run_test(data_t *data, uint64_t modifier)
>   			igt_display_reset(&data->display);
>   			igt_output_set_pipe(data->output, data->pipe);
>   
> +			if (!i915_pipe_output_combo_valid(&data->display))
> +				continue;
> +
>   			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
>   							  INTEL_PIPE_CRC_SOURCE_AUTO);
>   

