Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C9E6EC7F
 for <igt-dev@lists.freedesktop.org>; Wed, 19 May 2021 07:01:43 +0000 (UTC)
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
 <20210512170536.4778-12-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <544e3df9-a914-3172-98dc-3fb728a7ae06@intel.com>
Date: Wed, 19 May 2021 12:31:38 +0530
MIME-Version: 1.0
In-Reply-To: <20210512170536.4778-12-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v6 i-g-t 11/14] tests/kms_plane_lowres: Reset the
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 5/12/2021 10:35 PM, Bhanuprakash Modem wrote:
> Before starting the next subtest, clean up the states to default
> values, those are assumed by other tests. This patch will also fix
> few redundant checks.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_plane_lowres.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 5cfe53c8b..95346e289 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -270,16 +270,13 @@ test_planes_on_pipe(data_t *data, uint64_t modifier)
>   	igt_info("Testing connector %s using pipe %s\n",
>   		 igt_output_name(data->output), kmstest_pipe_name(data->pipe));
>   
> -	for_each_plane_on_pipe(&data->display, data->pipe, plane) {
> -		data->output = igt_get_single_output_for_pipe(&data->display, data->pipe);
> -		igt_require(data->output);
> -
> +	for_each_plane_on_pipe(&data->display, data->pipe, plane)
>   		tested += test_planes_on_pipe_with_output(data, plane, modifier);
> -	}
>   
> -	igt_assert(tested > 0);
>   	igt_output_set_pipe(data->output, PIPE_NONE);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_assert(tested > 0);
>   }
>   
>   igt_main
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
