Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54376E1B1
 for <igt-dev@lists.freedesktop.org>; Wed, 19 May 2021 06:42:10 +0000 (UTC)
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
 <20210512170536.4778-14-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <163acb24-25a7-687e-449a-62569549186c@intel.com>
Date: Wed, 19 May 2021 12:12:05 +0530
MIME-Version: 1.0
In-Reply-To: <20210512170536.4778-14-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v6 i-g-t 13/14] tests/kms_flip_scaled_crc: Reset the
 state before exiting the test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 5/12/2021 10:35 PM, Bhanuprakash Modem wrote:
> Before starting the next subtest, clean up the states to default
> values, those are assumed by other tests.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_flip_scaled_crc.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/kms_flip_scaled_crc.c b/tests/kms_flip_scaled_crc.c
> index 4923f1235..671ba7367 100644
> --- a/tests/kms_flip_scaled_crc.c
> +++ b/tests/kms_flip_scaled_crc.c
> @@ -156,6 +156,7 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
>   	int ret;
>   
>   	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	igt_debug("running on output %s pipe %s\n", output->name,
>   		  kmstest_pipe_name(pipe));
> @@ -246,6 +247,10 @@ static void test_flip_to_scaled(data_t *data, uint32_t index, enum pipe pipe,
>   	data->pipe_crc = NULL;
>   
>   	clear_lut(data, pipe);
> +
> +	igt_output_set_pipe(output, pipe);

Shouldn't it be PIPE_NONE instead of pipe in the args?

Otherwise:

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> +	igt_plane_set_fb(primary, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
>   igt_main
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
