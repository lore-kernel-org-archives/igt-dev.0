Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68310E00D
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 11:08:40 +0000 (UTC)
Date: Fri, 1 Apr 2022 14:07:44 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <YkbdAPoH5urbjgev@platvala-desk.ger.corp.intel.com>
References: <20220401105103.17183-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401105103.17183-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Skip this test
 on DP MST config
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 04:21:03PM +0530, Jeevan B wrote:
> currently this test fails on dp-mst setup. so, with this fix
> test will skip which is expected for extended mode test case.

Why is it expected?

Just "this test fails" is not a good reason to introduce explicit
skips. You have to explain why that case is not a kernel bug.


-- 
Petri Latvala



> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index eff30cbb..4701c3ef 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -135,6 +135,8 @@ igt_main
>  	int valid_output = 0, i, j = 0;
>  	igt_output_t *output;
>  	int pipe[IGT_MAX_PIPES];
> +	struct kmstest_connector_config config;
> +	const char *encoder;
>  
>  	igt_fixture {
>  		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> @@ -146,6 +148,11 @@ igt_main
>  
>  			if (valid_output > 1)
>  				break;
> +
> +			kmstest_get_connector_config(data.drm_fd,
> +						     output->config.connector->connector_id,
> +						     -1, &config);
> +			encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
>  		}
>  
>  		data.n_pipes = 0;
> @@ -160,6 +167,10 @@ igt_main
>  
>  	igt_describe("Test for validating display extended mode with a pair of connected displays");
>  	igt_subtest_with_dynamic("extended-mode-basic") {
> +
> +		if (strcmp(encoder, "DP MST") == 0)
> +			igt_skip("Test dosen't support DP MST\n");
> +
>  		for (i = 0; i < data.n_pipes - 1; i++) {
>  			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
>  					kmstest_pipe_name(pipe[i+1]));
> -- 
> 2.35.1
> 
