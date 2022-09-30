Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F6610EBC7
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Sep 2022 08:45:05 +0000 (UTC)
Date: Fri, 30 Sep 2022 11:44:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <YzasUOR/CISPcl4x@platvala-desk.ger.corp.intel.com>
References: <20220929143018.2502653-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929143018.2502653-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] lib/igt_kms: New api to iterate over all
 outputs
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

On Thu, Sep 29, 2022 at 08:00:18PM +0530, Bhanuprakash Modem wrote:
> Few KMS tests are trying to run on all outputs irrespective of

Make this "A few" instead. English is funky.

(A few = some, whereas few = not many, emphasis on the amount being
really small)



> their connection status. So add a new helper to iterate over all
> outputs.
> 
> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.h | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3d78c37f..e0786aad 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -544,16 +544,26 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>  #define for_each_if(condition) if (!(condition)) {} else
>  
>  /**
> - * for_each_connected_output:
> + * for_each_output:
>   * @display: a pointer to an #igt_display_t structure
>   * @output: The output to iterate.
>   *
>   * This for loop iterates over all outputs.
>   */
> -#define for_each_connected_output(display, output)		\
> +#define for_each_output(display, output)		\
>  	for (int i__ = 0;  assert(igt_can_fail()), i__ < (display)->n_outputs; i__++)	\
> -		for_each_if ((((output) = &(display)->outputs[i__]), \
> -			      igt_output_is_connected((output))))
> +		for_each_if (((output) = (&(display)->outputs[i__])))
> +
> +/**
> + * for_each_connected_output:
> + * @display: a pointer to an #igt_display_t structure
> + * @output: The output to iterate.
> + *
> + * This for loop iterates over all connected outputs.
> + */
> +#define for_each_connected_output(display, output)		\
> +	for_each_output((display), (output))	\
> +		for_each_if ((igt_output_is_connected((output))))
>  

Ah, misunderstood the purpose on that other patch. Fair enough.

With the commit message change from above,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


>  /**
>   * for_each_pipe_static:
> -- 
> 2.37.3
> 
