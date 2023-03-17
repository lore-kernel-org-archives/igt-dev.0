Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD9E910E096
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 06:31:18 +0000 (UTC)
Message-ID: <33dec22f-7723-7bae-aec1-30bc95fae46d@intel.com>
Date: Fri, 17 Mar 2023 12:01:03 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230223151018.2565040-1-bhanuprakash.modem@intel.com>
 <20230223151018.2565040-11-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230223151018.2565040-11-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v8 10/51] tests/kms_content_protection: Add
 support for Bigjoiner
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


On 2/23/2023 8:39 PM, Bhanuprakash Modem wrote:
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free.

Please add the revision history details.

With this added,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_content_protection.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index aa28b7bfd..638e1301a 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -174,7 +174,6 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>   	igt_plane_t *primary;
>   
>   	mode = igt_output_get_mode(output);
> -	igt_output_set_pipe(output, pipe);
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, &data.red);
> @@ -502,6 +501,11 @@ test_content_protection(enum igt_commit_style s, int content_type)
>   				continue;
>   
>   			igt_display_reset(display);
> +
> +			igt_output_set_pipe(output, pipe);
> +			if (!i915_pipe_output_combo_valid(display))
> +				continue;
> +
>   			modeset_with_fb(pipe, output, s);
>   
>   			if (!output_hdcp_capable(output, content_type))
