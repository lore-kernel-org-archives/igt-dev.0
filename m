Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F45F10F10F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Apr 2022 13:37:58 +0000 (UTC)
Message-ID: <39e38d6e-9666-f7ec-50c3-62366da6cc60@intel.com>
Date: Wed, 20 Apr 2022 19:07:44 +0530
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20211012105300.27890-1-mohammed.thasleem@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20211012105300.27890-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] [i-g-t] tests/kms: IGT cleanup
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

Hi Thasleem,

Thanks for the patch. I think, commit subject shouldn't be the same for 
all commits in this series. Please try to follow: 
https://cbea.ms/git-commit/

Also commit subject should start with "tests/<test_name>:"
Ex: tests/kms_vrr: Introduce dynamic subtests

As you started to cleanup the IGT, please try to make sure below points:
- Convert to dynamic subtests
- Sanitize the state before starting the subtest. (igt_display_reset)
- Clear the states before exiting the subtest.
- Update existing libdrm APIs with IGT kms APIs.
- Other misc (Ex: update deprecated APIs/macros/enums, FB leaks etc..)

- Bhanu

On Tue-12-10-2021 04:22 pm, Mohammed Thasleem wrote:
> Before starting the subtest, clean up the states to default
> by igt_display_reset().
> 
> Replace newly defined function in particular test with existing
> library function.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/kms_mmap_write_crc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index b17e5fdb..f8825284 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -169,6 +169,8 @@ static void prepare_crtc(data_t *data)
>   	igt_output_t *output = data->output;
>   	drmModeModeInfo *mode;
>   
> +	igt_display_reset(&data->display);
> +
>   	/* select the pipe we want to use */
>   	igt_output_set_pipe(output, data->pipe);
>   
> @@ -204,8 +206,8 @@ static void cleanup_crtc(data_t *data)
>   
>   	igt_plane_set_fb(data->primary, NULL);
>   
> -	igt_output_set_pipe(output, PIPE_ANY);
> -	igt_display_commit(display);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
>   	igt_remove_fb(data->drm_fd, &data->fb[0]);
>   	igt_remove_fb(data->drm_fd, &data->fb[1]);
