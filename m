Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D54310E4D0
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Feb 2022 07:43:03 +0000 (UTC)
Message-ID: <95b59b4e-a4a7-5590-82a2-78eeb168d574@intel.com>
Date: Mon, 28 Feb 2022 13:12:47 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220228051409.9887-1-nidhi1.gupta@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220228051409.9887-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] IGT cleanup
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

On Mon-28-02-2022 10:44 am, Nidhi Gupta wrote:
> Before starting the next subtest, clean up the states to default
> values, those are assumed by other tests.

Also, before running the subtest we need to sanitize the system state to 
default, since we can't trust the state of previous subtest.

Using igt_display_reset() (or equalent) before starting the subtest is 
the recommendation.

- Bhanu

> 
> Below tests are modified:
> 	tests/kms_concurrent.c
> 	tests/kms_sequence.c
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c | 3 ++-
>   tests/kms_sequence.c   | 4 ++--
>   2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 1b8f4b04..83513ff1 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -82,7 +82,8 @@ static void test_fini(data_t *data, enum pipe pipe, int n_planes,
>   	}
>   
>   	/* reset the constraint on the pipe */
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	free(data->plane);
>   	data->plane = NULL;
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9c287480..baa29da5 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -109,8 +109,8 @@ static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> -	igt_display_commit(display);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   }
>   
>   static int crtc_get_sequence(int fd, struct drm_crtc_get_sequence *cgs)
