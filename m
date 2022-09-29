Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F6110EABF
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Sep 2022 16:34:42 +0000 (UTC)
Message-ID: <5f3267f3-af7e-fe43-2231-023b97cf05b3@intel.com>
Date: Thu, 29 Sep 2022 22:04:17 +0530
Content-Language: en-US
To: Ananya Sharma <ananya.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220907091712.409527-1-ananya.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220907091712.409527-1-ananya.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_fence_pin_leak: Test
 cleanup
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

On Wed-07-09-2022 02:47 pm, Ananya Sharma wrote:
> Before running the subtest we need to sanitize the system
> state to default,used igt_display_reset() to sanitize the state.
> 
> Signed-off-by: Ananya Sharma <ananya.sharma@intel.com>
> ---
>   tests/i915/kms_fence_pin_leak.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
> index 16eb595f..906b3708 100644
> --- a/tests/i915/kms_fence_pin_leak.c
> +++ b/tests/i915/kms_fence_pin_leak.c
> @@ -124,6 +124,7 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	struct igt_fb fb[2];
>   	int i;
>   
> +	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
>   
>   	mode = igt_output_get_mode(output);
> @@ -180,8 +181,8 @@ static void run_single_test(data_t *data, enum pipe pipe, igt_output_t *output)
>   	}
>   
>   	igt_plane_set_fb(primary, NULL);
> -	igt_output_set_pipe(output, PIPE_ANY);
> -	igt_display_commit(display);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);

Why do we need an atomic?

- Bhanu

>   
>   	igt_remove_fb(data->drm_fd, &fb[1]);
>   	igt_remove_fb(data->drm_fd, &fb[0]);
