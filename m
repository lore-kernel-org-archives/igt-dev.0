Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35AC10FC80
 for <igt-dev@lists.freedesktop.org>; Tue,  3 May 2022 14:27:43 +0000 (UTC)
Message-ID: <0ab54fb1-f3c0-c68d-8b85-2fbbd37987d0@amd.com>
Date: Tue, 3 May 2022 10:27:24 -0400
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, swati2.sharma@intel.com
References: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
 <20220411094147.1650859-6-bhanuprakash.modem@intel.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220411094147.1650859-6-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V2 5/5] tests/amdgpu: Adopt to use updated debugfs
 functions
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


On 2022-04-11 05:41, Bhanuprakash Modem wrote:
> Instead of writing our own wrappers of debugfs read,
> use updated functions from lib.
> 
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  tests/amdgpu/amd_dp_dsc.c  | 56 ++------------------------------------
>  tests/amdgpu/amd_max_bpc.c | 47 ++------------------------------
>  2 files changed, 5 insertions(+), 98 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index e3f3a39f..8a18df3b 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -43,12 +43,6 @@ typedef struct data {
>  	int fd;
>  } data_t;
>  
> -/* BPC connector state. */
> -typedef struct output_bpc {
> -	unsigned int current;
> -	unsigned int maximum;
> -} output_bpc_t;
> -
>  /* Common test cleanup. */
>  static void test_fini(data_t *data)
>  {
> @@ -431,51 +425,6 @@ static void test_dsc_link_settings(data_t *data)
>      test_fini(data);
>  }
>  
> -/* Returns the current and maximum bpc from the connector debugfs. */
> -static output_bpc_t get_output_bpc(int data_fd, char *connector_name)
> -{
> -	char buf[256];
> -	char *start_loc;
> -	int fd, res;
> -	output_bpc_t info;
> -
> -	fd = igt_debugfs_connector_dir(data_fd, connector_name, O_RDONLY);
> -	igt_assert(fd >= 0);
> -
> -	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> -
> -	igt_require(res > 0);
> -
> -	close(fd);
> -
> -	igt_assert(start_loc = strstr(buf, "Current: "));
> -	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
> -
> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
> -
> -	return info;
> -}
> -
> -/* Verifies that connector has the correct output bpc */
> -static void assert_output_bpc(int data_fd, char *connector_name, unsigned int bpc)
> -{
> -	output_bpc_t info = get_output_bpc(data_fd, connector_name);
> -
> -	igt_require_f(info.maximum >= bpc,
> -		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
> -		      info.maximum);
> -
> -	igt_assert_eq(info.current, bpc);
> -}
> -
> -/* Returns the highest bpc this dispaly supports */
> -static int get_max_supported_bpc(int data_fd, char *connector_name)
> -{
> -	output_bpc_t info = get_output_bpc(data_fd, connector_name);
> -	return info.maximum;
> -}
> -
>  static void test_dsc_bpc(data_t *data)
>  {
>  	igt_output_t *output;
> @@ -494,7 +443,7 @@ static void test_dsc_bpc(data_t *data)
>  		if (!output || !igt_output_is_connected(output))
>  			continue;
>  		igt_info("Checking bpc support of conn %s\n", output->name);
> -		max_supported_bpc[i] = get_max_supported_bpc(data->fd, output->name);
> +		max_supported_bpc[i] = igt_get_output_max_bpc(data->fd, output->name);
>  	}
>  
>      /* Setup all outputs */
> @@ -538,7 +487,8 @@ static void test_dsc_bpc(data_t *data)
>  
>  			/* Check current bpc */
>  			igt_info("Verifying display %s has correct bpc\n", output->name);
> -			assert_output_bpc(data->fd, output->name, bpc_vals[bpc]);
> +			igt_assert_output_bpc_equal(data->fd, data->pipe_id[i],
> +						    output->name, bpc_vals[bpc]);
>  
>  			/* Log current mode and DSC status */
>  			dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index 4eb759ee..982a91e2 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -40,12 +40,6 @@ typedef struct data {
>  	int h;
>  } data_t;
>  
> -/* BPC connector state. */
> -typedef struct output_bpc {
> -	unsigned int current;
> -	unsigned int maximum;
> -} output_bpc_t;
> -
>  static drmModeModeInfo uhd_mode = {
>  	  594000,
>  	  3840, 4016, 4104, 4400, 0,
> @@ -55,44 +49,6 @@ static drmModeModeInfo uhd_mode = {
>  	  "3840x2160@60", /* VIC 107 */
>  	  };
>  
> -/* Returns the current and maximum bpc from the connector debugfs. */
> -static output_bpc_t get_output_bpc(data_t *data)
> -{
> -	char buf[256];
> -	char *start_loc;
> -	int fd, res;
> -	output_bpc_t info;
> -
> -	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> -
> -	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
> -
> -	igt_require(res > 0);
> -
> -	close(fd);
> -
> -	igt_assert(start_loc = strstr(buf, "Current: "));
> -	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
> -
> -	igt_assert(start_loc = strstr(buf, "Maximum: "));
> -	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
> -
> -	return info;
> -}
> -
> -/* Verifies that connector has the correct output bpc. */
> -static void assert_output_bpc(data_t *data, unsigned int bpc)
> -{
> -	output_bpc_t info = get_output_bpc(data);
> -
> -	igt_require_f(info.maximum >= bpc,
> -		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
> -		      info.maximum);
> -
> -	igt_assert_eq(info.current, bpc);
> -}
> -
>  /* Common test setup. */
>  static void test_init(data_t *data)
>  {
> @@ -120,7 +76,8 @@ static void test_init(data_t *data)
>  
>  	data->mode = igt_output_get_mode(data->output);
>  	igt_assert(data->mode);
> -	assert_output_bpc(data, 8);
> +	igt_assert_output_bpc_equal(data->fd, data->pipe_id,
> +				    data->output->name, 8);
>  
>  	data->primary =
>  		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
