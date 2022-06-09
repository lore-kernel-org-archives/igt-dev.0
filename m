Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3631133B2
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 07:37:58 +0000 (UTC)
Date: Thu, 9 Jun 2022 10:35:22 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Rohith Iyer <quic_rohiiyer@quicinc.com>
Message-ID: <YqGiujHSDJOt4LGi@platvala-desk.ger.corp.intel.com>
References: <20220607213629.5031-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607213629.5031-1-quic_rohiiyer@quicinc.com>
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Iterate over
 only non-null pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jun 07, 2022 at 02:36:29PM -0700, Rohith Iyer wrote:
> Currently, kms_writeback_get_output iterates over all entries of
> display->pipes, regardless of if the pipe is valid. This could lead to a
> null dereference in igt_output_set_pipe() as the loop does not check for
> null pipes. To avoid this issue, use the for_each_pipe method to iterate
> over only non-null pipes.
> 
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
> ---
>  tests/kms_writeback.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index b6c815db..d416d510 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -110,21 +110,21 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
>  static igt_output_t *kms_writeback_get_output(igt_display_t *display)
>  {
>  	int i;
> +	enum pipe pipe;
>  
>  	for (i = 0; i < display->n_outputs; i++) {
>  		igt_output_t *output = &display->outputs[i];
> -		int j;
>  
>  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>  			continue;
>  
> -		for (j = 0; j < igt_display_get_n_pipes(display); j++) {
> -			igt_output_set_pipe(output, j);
> +		for_each_pipe(display, pipe){

Space needed before the {

with that editorial change, this is

Reviewed-by: Petri Latvala <petri.latvala@intel.com>



> +			igt_output_set_pipe(output, pipe);
>  
>  			if (check_writeback_config(display, output)) {
>  				igt_debug("Using connector %u:%s on pipe %d\n",
>  					  output->config.connector->connector_id,
> -					  output->name, j);
> +					  output->name, pipe);
>  				return output;
>  			}
>  		}
> -- 
> 2.17.1
> 
