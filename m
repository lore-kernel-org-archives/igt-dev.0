Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D9DA3CD0
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jul 2022 09:41:23 +0000 (UTC)
Message-ID: <c6fa2cf0-357f-3a20-11d7-1ad760b3bd5a@intel.com>
Date: Thu, 14 Jul 2022 15:11:04 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220707174403.31879-3-mohammed.thasleem@intel.com>
 <20220714052634.35837-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220714052634.35837-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v5 2/2] tests/i915/kms_mmap_write_crc: Test
 Cleanup
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

On Thu-14-07-2022 10:56 am, Mohammed Thasleem wrote:
> Sanitize the system state before starting the subtest.
> 
> v2: Minor changes.
> v3: Moved cleanup_crtc in igt_dynamic_f.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/kms_mmap_write_crc.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index c732308c..3face2df 100644
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
> @@ -278,8 +281,8 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   				prepare_crtc(&data);
>   				for (i = 0; i < ROUNDS; i++)
>   					test(&data);
> +				cleanup_crtc(&data);
>   			}
> -			cleanup_crtc(&data);

Looks, this is introduced by patch [1/2] in this series. Please fix it.

>   			/* once is enough */
>   			break;
>   		}
> @@ -287,6 +290,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>   
>   		igt_stop_helper(&hog);
>   	}
