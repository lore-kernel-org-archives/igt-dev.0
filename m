Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6A910F7F4
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 05:03:48 +0000 (UTC)
Message-ID: <c8e74faa-83d3-addb-4266-857d087f8de8@intel.com>
Date: Fri, 15 Jul 2022 10:33:29 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220714213306.70050-1-mohammed.thasleem@intel.com>
 <20220714213306.70050-3-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220714213306.70050-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v6 2/2] tests/i915/kms_mmap_write_crc: Test
 Cleanup
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

On Fri-15-07-2022 03:03 am, Mohammed Thasleem wrote:
> Sanitize the system state before starting the subtest.
> 
> v2: Minor changes.
> v3: Moved cleanup_crtc in igt_dynamic_f.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/i915/kms_mmap_write_crc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index 4e5b8146..7e5dbd66 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -169,6 +169,8 @@ static void prepare_crtc(data_t *data)
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode;
>   
> +	igt_display_reset(display);
> +
>   	/* select the pipe we want to use */
>   	igt_output_set_pipe(output, data->pipe);
>   
> @@ -204,7 +206,7 @@ static void cleanup_crtc(data_t *data)
>   
>   	igt_plane_set_fb(data->primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> +	igt_output_set_pipe(output, PIPE_NONE);
>   	igt_display_commit(display);
>   
>   	igt_remove_fb(data->drm_fd, &data->fb[0]);
> @@ -262,6 +264,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   		igt_require_pipe_crc(data.drm_fd);
>   
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>   
>   		fork_cpuhog_helper();
>   	}
> @@ -290,6 +293,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>   
>   		igt_stop_helper(&hog);
>   	}
