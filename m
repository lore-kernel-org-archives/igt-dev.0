Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278C96E1B1
 for <igt-dev@lists.freedesktop.org>; Wed, 19 May 2021 06:50:11 +0000 (UTC)
References: <20210512170536.4778-1-bhanuprakash.modem@intel.com>
 <20210512170536.4778-10-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <635a0162-e2b8-b5fb-edd7-8475b5a1eca7@intel.com>
Date: Wed, 19 May 2021 12:20:06 +0530
MIME-Version: 1.0
In-Reply-To: <20210512170536.4778-10-bhanuprakash.modem@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [v6 i-g-t 09/14] tests/kms_plane_alpha_blend: Reset
 the state before exiting the test
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
> values, those are assumed by other tests. This patch will also fix
> few redundant checks.
>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 5e80ae36e..a37cb27c7 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -237,8 +237,6 @@ static void prepare_crtc(data_t *data, igt_output_t *output, enum pipe pipe)
>   	}
>   
>   	igt_plane_set_fb(primary, &data->black_fb);
> -	/* reset alpha property to default */
> -	reset_alpha(display, pipe);

This is indeed redundant.

LGTM

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>   }
>   
>   static void basic_alpha(data_t *data, enum pipe pipe, igt_plane_t *plane)
> @@ -507,6 +505,9 @@ static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
>   		igt_plane_set_fb(plane, NULL);
>   	}
>   
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
>   	igt_require_f(found, "No planes with %s property found\n",
>   		      blend ? "pixel blending mode" : "alpha");
>   	igt_require_f(multiply, "Multiplied (plane x pixel) alpha not available\n");
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
