Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6E1C6ED98
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Sep 2021 17:55:38 +0000 (UTC)
Date: Thu, 23 Sep 2021 13:55:31 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210923175531.4ebytoonjlipdhr7@outlook.office365.com>
References: <20210916141827.17720-1-vidya.srinivas@intel.com>
 <20210920081702.19241-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210920081702.19241-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, Bhanuprakash.Modem@intel.com, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On 09/20, Vidya Srinivas wrote:
> Staring commit fea0e38e690c30c6 "Making the test more generic"
> test_resolution_with_output introduced setting igt_output_set_pipe
> to PIPE_NONE. This is triggering atomic check failure resulting in
> "enabled/connectors mismatch" under drm_atomic_helper_check_modeset.
> Patch fixes this issue.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_concurrent.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 25c67eb469d1..47c441a5a3f7 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -268,7 +268,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>  
>  		/* switch to lower resolution */
>  		igt_output_override_mode(output, mode_lo);
> -		igt_output_set_pipe(output, PIPE_NONE);
> +		if (is_amdgpu_device(data->drm_fd))
> +			igt_output_set_pipe(output, PIPE_NONE);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  
>  		/* switch back to higher resolution */
> -- 
> 2.33.0
> 

I checked this patch with AMD devices, and it works fine, for this
reason, feel free to add my:

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

Just a note, I think with this change, drivers based on tinyDrm might
pass this test.

Thanks

-- 
Rodrigo Siqueira
https://siqueira.tech
