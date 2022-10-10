Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754F410E1AB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Oct 2022 09:47:54 +0000 (UTC)
Date: Mon, 10 Oct 2022 12:47:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <Y0PqNQ6XlUqa6fhB@platvala-desk.ger.corp.intel.com>
References: <20221010093547.14296-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010093547.14296-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] RFC: kms_content_protection: Add a test
 for HDCP-MST with suspend resume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 10, 2022 at 03:05:47PM +0530, Jeevan B wrote:
> adding new test to validate HDCP-MST with suspend resume
> test check for valid output which supports MST and HDCP
> then commits and check if the content protection is enabled
> before and after suspend-resume.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_content_protection.c | 90 +++++++++++++++++++++++++++++++++-
>  1 file changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index aa28b7bf..701c65fc 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -48,6 +48,7 @@ struct data {
>  #define CP_MEI_RELOAD				(1 << 2)
>  #define CP_TYPE_CHANGE				(1 << 3)
>  #define CP_UEVENT				(1 << 4)
> +#define SUSPEND_RESUME				(1 << 5)
>  
>  #define CP_UNDESIRED				0
>  #define CP_DESIRED				1
> @@ -686,6 +687,85 @@ test_content_protection_mst(int content_type)
>  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
>  }
>  
> +static void
> +test_content_protection_mst_suspend_resume(int content_type)
> +{
> +	igt_display_t *display = &data.display;
> +	igt_output_t *output;
> +	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0;
> +	enum pipe pipe;
> +	igt_output_t *mst_output[IGT_MAX_PIPES], *hdcp_mst_output[IGT_MAX_PIPES];
> +
> +	for_each_pipe(display, pipe)
> +		max_pipe++;
> +
> +	pipe = PIPE_A;
> +
> +	for_each_connected_output(display, output) {
> +		if (!output_is_dp_mst(output, dp_mst_outputs))
> +			continue;
> +
> +		igt_assert_f(igt_pipe_connector_valid(pipe, output), "Output-pipe combination invalid\n");
> +
> +		igt_output_set_pipe(output, pipe);
> +		prepare_modeset_on_mst_output(output);
> +		mst_output[dp_mst_outputs++] = output;
> +
> +		pipe++;
> +
> +		if (pipe > max_pipe)
> +			break;


The pipes aren't necessarily contiguous. A valid set of pipes on the
system can be A, B, D.


-- 
Petri Latvala
