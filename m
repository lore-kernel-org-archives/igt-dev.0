Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2A21121A0
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 04:36:21 +0000 (UTC)
Message-ID: <8c1b48e7-4e39-6666-020c-8284b3e3a755@intel.com>
Date: Thu, 7 Jul 2022 10:06:01 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220628133554.37768-1-mohammed.thasleem@intel.com>
 <20220628133554.37768-3-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220628133554.37768-3-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 2/2] tests/i915/kms_mmap_write_crc: Test
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

On Tue-28-06-2022 07:05 pm, Mohammed Thasleem wrote:
> Sanitize the system state before starting the subtest.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/kms_mmap_write_crc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index 50aa434d..3309f359 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -169,6 +169,8 @@ static void prepare_crtc(data_t *data)
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode;

Can we re-use this mode in test() too?
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
> @@ -292,6 +294,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>

Please add igt_display_require_output() to igt_fixture.

Also, from patch 1/2, we are running this test 10 times.
for_loop(10) {
	prepare();
	test();
	cleanup();
}
Do we really need to use prepare() & cleanup() everytime, since we are 
using same pipe/output combination?

- Bhanu

>   	igt_fixture {
>   		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>   
>   		igt_stop_helper(&hog);
>   	}
