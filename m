Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D5410EB43
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 09:27:39 +0000 (UTC)
Message-ID: <e16b87db-b009-56f6-8921-b0178f97502f@intel.com>
Date: Wed, 25 May 2022 14:57:33 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20220524120722.1756689-1-ananya.sharma@intel.com>
 <20220524120722.1756689-3-ananya.sharma@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220524120722.1756689-3-ananya.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/2]
 tests/kms_universal_plane:sanitize the system state between subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nidhi1.gupta@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Please refer https://cbea.ms/git-commit/
Regarding subj
  tests/kms_universal_plane:sanitize the system state between subtests
Add space after :
Subj u can simply write as IGT cleanup and in commit u can add about 
sanitation part.

On 24-May-22 5:37 PM, Ananya Sharma wrote:
> Before running the subtestwe need to sanitize the system state
> to default,used igt_display_reset() to sanitize the state.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/kms_universal_plane.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 2bc722d2..72e4832c 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -107,7 +107,7 @@ functional_test_fini(functional_test_t *test, igt_output_t *output)
>   	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>   	igt_remove_fb(test->data->drm_fd, &test->yellow_fb);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>   }
>   
> @@ -135,6 +135,7 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int num_primary = 0, num_cursor = 0;
>   	int i;
>   
> +	igt_display_reset(&data->display);
>   	igt_require_pipe(display, pipe);
>   
>   	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
> @@ -345,7 +346,7 @@ sanity_test_fini(sanity_test_t *test, igt_output_t *output)
>   	igt_remove_fb(test->data->drm_fd, &test->undersized_fb);
>   	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>   }
>   
> @@ -364,6 +365,7 @@ sanity_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int i;
>   	int expect;
>   
> +	igt_display_reset(&data->display);
>   	igt_require_pipe(&data->display, pipe);
>   
>   	igt_output_set_pipe(output, pipe);
> @@ -462,7 +464,7 @@ pageflip_test_fini(pageflip_test_t *test, igt_output_t *output)
>   	igt_remove_fb(test->data->drm_fd, &test->red_fb);
>   	igt_remove_fb(test->data->drm_fd, &test->blue_fb);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>   }
>   
> @@ -477,6 +479,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	fd_set fds;
>   	int ret = 0;
>   
> +	igt_display_reset(&data->display);
>   	igt_require_pipe(&data->display, pipe);
>   
>   	igt_output_set_pipe(output, pipe);
> @@ -544,7 +547,7 @@ cursor_leak_test_fini(data_t *data,
>   	for (i = 0; i < 10; i++)
>   		igt_remove_fb(data->drm_fd, &curs[i]);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   }
>   
>   static int
> @@ -578,6 +581,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   	int r, g, b;
>   	int count1, count2;
>   
> +	igt_display_reset(&data->display);
>   	igt_require_pipe(display, pipe);
>   	igt_require(display->has_cursor_plane);
>   	igt_require_intel(data->drm_fd);
> @@ -690,7 +694,7 @@ gen9_test_fini(gen9_test_t *test, igt_output_t *output)
>   	igt_remove_fb(test->data->drm_fd, &test->smallred_fb);
>   	igt_remove_fb(test->data->drm_fd, &test->smallblue_fb);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit2(&test->data->display, COMMIT_LEGACY);
>   }
>   
> @@ -706,6 +710,7 @@ gen9_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   
>   	int ret = 0;
>   
> +	igt_display_reset(&data->display);
>   	igt_require_intel(data->drm_fd);
>   	igt_skip_on(data->display_ver < 9);
>   	igt_require_pipe(&data->display, pipe);

-- 
~Swati Sharma
