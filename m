Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B79010E143
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 14:15:58 +0000 (UTC)
Date: Thu, 1 Jun 2023 15:49:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230601134912.duu3obxobjtbt2hz@kamilkon-desk1>
References: <20230531065407.362625-1-swati2.sharma@intel.com>
 <20230531065407.362625-3-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230531065407.362625-3-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests:
 s/check_dsc_on_connector/is_dsc_supported_by_sink
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

On 2023-05-31 at 12:24:06 +0530, Swati Sharma wrote:
> Rename function.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/kms_dsc.c        | 2 +-
>  tests/i915/kms_dsc_helper.c | 2 +-
>  tests/i915/kms_dsc_helper.h | 2 +-
>  tests/i915/kms_psr2_sf.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 3ce28f84..d142fae2 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -227,7 +227,7 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>  		data->output = output;
>  		data->pipe = pipe;
>  
> -		if (!check_dsc_on_connector(data->drm_fd, data->output))
> +		if (!is_dsc_supported_by_sink(data->drm_fd, data->output))
>  			continue;
>  
>  		if (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> diff --git a/tests/i915/kms_dsc_helper.c b/tests/i915/kms_dsc_helper.c
> index 1adf920b..c90d833d 100644
> --- a/tests/i915/kms_dsc_helper.c
> +++ b/tests/i915/kms_dsc_helper.c
> @@ -53,7 +53,7 @@ void kms_dsc_exit_handler(int sig)
>  	restore_force_dsc_en();
>  }
>  
> -bool check_dsc_on_connector(int drmfd, igt_output_t *output)
> +bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output)
>  {
>  	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
>  		igt_debug("DSC not supported on connector %s\n",
> diff --git a/tests/i915/kms_dsc_helper.h b/tests/i915/kms_dsc_helper.h
> index 198f5afa..f66191c7 100644
> --- a/tests/i915/kms_dsc_helper.h
> +++ b/tests/i915/kms_dsc_helper.h
> @@ -26,7 +26,7 @@ void force_dsc_enable_bpc(int drmfd, igt_output_t *output, int input_bpc);
>  void save_force_dsc_en(int drmfd, igt_output_t *output);
>  void restore_force_dsc_en(void);
>  void kms_dsc_exit_handler(int sig);
> -bool check_dsc_on_connector(int drmfd, igt_output_t *output);
> +bool is_dsc_supported_by_sink(int drmfd, igt_output_t *output);
>  bool check_gen11_dp_constraint(int drmfd, igt_output_t *output, enum pipe pipe);
>  bool check_gen11_bpc_constraint(int drmfd, igt_output_t *output, int input_bpc);
>  void force_dsc_output_format(int drmfd, igt_output_t *output,
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index 4cf98644..ffc41f98 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -934,7 +934,7 @@ igt_main
>  				pipes[n_pipes] = data.pipe;
>  				outputs[n_pipes] = data.output;
>  
> -				if (check_dsc_on_connector(data.drm_fd, data.output))
> +				if (is_dsc_supported_by_sink(data.drm_fd, data.output))
>  					coexist_features[n_pipes] |= FEATURE_DSC;
>  
>  				n_pipes++;
> -- 
> 2.25.1
> 
