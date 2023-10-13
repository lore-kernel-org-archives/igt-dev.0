Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585FE10E5E9
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 12:06:35 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-323ef9a8b59so1945046f8f.3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:06:35 -0700 (PDT)
Message-ID: <7ef46b76-33f2-25fe-2b9f-97be81febce1@gmail.com>
Date: Fri, 13 Oct 2023 15:06:26 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20231013102346.95872-1-swati2.sharma@intel.com>
 <20231013102346.95872-3-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231013102346.95872-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_kms: add get_num_scalers()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 13.10.2023 13.23, Swati Sharma wrote:
> Add get_num_scalers(), which will return no. of scalers/CRTC.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c | 39 +++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 40 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 8dc0edc89..666a69495 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6084,3 +6084,42 @@ int igt_get_dp_mst_connector_id(igt_output_t *output)
>   
>   	return connector_id;
>   }
> +
> +/**
> + * get_num_scalers:
> + * @drm_fd: drm file descriptor
> + * @pipe: display pipe
> + *
> + * Returns: num_scalers supported/pipe.
> + */
> +int get_num_scalers(int drm_fd, enum pipe pipe)
> +{
> +	char buf[8120];
> +	char *start_loc1, *start_loc2;
> +	int dir, res;
> +	int num_scalers = 0;
> +	char dest[20] = ":pipe ";
> +
> +	strcat(dest, kmstest_pipe_name(pipe));
> +
> +	if (is_intel_device(drm_fd) &&
> +	    intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
> +
> +		dir = igt_debugfs_dir(drm_fd);
> +		igt_assert(dir >= 0);
> +
> +		res = igt_debugfs_simple_read(dir, "i915_display_info", buf, sizeof(buf));
> +		close(dir);
> +		igt_require(res > 0);
> +
> +		start_loc1 = strstr(buf, dest);
> +		printf("start_loc1=%s\n", start_loc1);

this printf I think doesn't belong here. Otherwise patch look ok.

> +
> +		if ((start_loc1 = strstr(buf, dest))) {
> +			igt_assert(start_loc2 = strstr(start_loc1, "num_scalers="));
> +			igt_assert_eq(sscanf(start_loc2, "num_scalers=%d", &num_scalers), 1);
> +		}
> +	}
> +
> +	return num_scalers;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 4bcaf3f73..356620dc6 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1016,5 +1016,6 @@ bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool i915_pipe_output_combo_valid(igt_display_t *display);
>   bool igt_check_output_is_dp_mst(igt_output_t *output);
>   int igt_get_dp_mst_connector_id(igt_output_t *output);
> +int get_num_scalers(int drm_fd, enum pipe pipe);
>   
>   #endif /* __IGT_KMS_H__ */
