Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF46710E180
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Apr 2023 07:48:04 +0000 (UTC)
Message-ID: <f2fe1467-29fd-1f81-26ac-20da064e925b@intel.com>
Date: Fri, 14 Apr 2023 13:17:52 +0530
To: <igt-dev@lists.freedesktop.org>
References: <20230412103448.826946-1-bhanuprakash.modem@intel.com>
 <20230414050830.1176272-1-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20230414050830.1176272-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2] tests/kms:
 s/i915_frequency_info/i915_cdclk_info/
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

On 4/14/2023 10:38 AM, Bhanuprakash Modem wrote:
> Read display specific clock frequency info from debugfs
> "i915_cdclk_info".
> 
> V2: - For older Kernels, readback from i915_frequency_info
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/i915/kms_cdclk.c   | 10 +++++++++-
>   tests/kms_invalid_mode.c | 23 +++++++++++++++++++----
>   2 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
> index 23d9d3b02e2..bb003680229 100644
> --- a/tests/i915/kms_cdclk.c
> +++ b/tests/i915/kms_cdclk.c
> @@ -61,8 +61,16 @@ static int get_current_cdclk_freq(int debugfs_fd)
>   	char *start_loc;
>   	int res;
>   
> -	res = igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
> +	/*
> +	 * Display specific clock frequency info is moved to i915_cdclk_info,
> +	 * On older kernels if this debugfs is not found, fallback to read from
> +	 * i915_frequency_info.
> +	 */
> +	res = igt_debugfs_simple_read(debugfs_fd, "i915_cdclk_info",
>   				      buf, sizeof(buf));
> +	if (res <= 0)
> +		res = igt_debugfs_simple_read(debugfs_fd, "i915_frequency_info",
> +					      buf, sizeof(buf));
>   	igt_require(res > 0);
>   
>   	igt_assert(start_loc = strstr(buf, "Current CD clock frequency: "));
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 86f529e88b1..6ef36d3cc98 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -217,14 +217,29 @@ static int i915_max_dotclock(data_t *data)
>   {
>   	char buf[4096];
>   	char *s;
> -	int max_dotclock = 0;
> +	int dir, res, max_dotclock = 0;
>   
>   	if (!is_i915_device(data->drm_fd))
>   		return 0;
>   
> -	igt_debugfs_read(data->drm_fd, "i915_frequency_info", buf);
> -	s = strstr(buf, "Max pixel clock frequency:");
> -	igt_assert(s);
> +	dir = igt_debugfs_dir(data->drm_fd);
> +	igt_require(dir);
> +
> +	/*
> +	 * Display specific clock frequency info is moved to i915_cdclk_info,
> +	 * On older kernels if this debugfs is not found, fallback to read from
> +	 * i915_frequency_info.
> +	 */
> +	res = igt_debugfs_simple_read(dir, "i915_cdclk_info",
> +				      buf, sizeof(buf));
> +	if (res <= 0)
> +		res = igt_debugfs_simple_read(dir, "i915_frequency_info",
> +					      buf, sizeof(buf));
> +	close(dir);
> +
> +	igt_require(res > 0);
> +
> +	igt_assert(s = strstr(buf, "Max pixel clock frequency:"));
>   	igt_assert_eq(sscanf(s, "Max pixel clock frequency: %d kHz", &max_dotclock), 1);
>   
>   	/* 100 Mhz to 5 GHz seem like reasonable values to expect */
