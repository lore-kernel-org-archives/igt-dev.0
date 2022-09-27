Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4636C10E949
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 13:53:55 +0000 (UTC)
Message-ID: <cc7e2214-7bca-5063-1402-1f0a3b4e13ab@intel.com>
Date: Tue, 27 Sep 2022 19:23:49 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-3-kunal1.joshi@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220926185321.2897136-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 2/5] tests/i915/kms_pipe_b_c_ivb.c:
 test cleanup
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

Hi Kunal,

Same comments here too.
.c should not be there in subj.

On 27-Sep-22 12:23 AM, Kunal Joshi wrote:
> -> Sanitize the state before starting the subtest
> -> close drm_fd
> 
> Cc: Jeevan B <jeevan.b@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/i915/kms_pipe_b_c_ivb.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
> index 5823ae2a..4f49d7b2 100644
> --- a/tests/i915/kms_pipe_b_c_ivb.c
> +++ b/tests/i915/kms_pipe_b_c_ivb.c
> @@ -142,6 +142,12 @@ test_dpms(data_t *data)
>   	igt_output_t *output1, *output2;
>   	int ret;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
 >> Comment not required at all.
> +	igt_display_reset(&data->display);
> +
>   	find_outputs(data, &output1, &output2);
>   
>   	igt_info("Pipe %s will use connector %s\n",
> @@ -164,6 +170,12 @@ test_lane_reduction(data_t *data)
>   	igt_output_t *output1, *output2;
>   	int ret;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	find_outputs(data, &output1, &output2);
>   
>   	igt_info("Pipe %s will use connector %s\n",
> @@ -187,6 +199,12 @@ test_disable_pipe_B(data_t *data)
>   	igt_output_t *output1, *output2;
>   	int ret;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	find_outputs(data, &output1, &output2);
>   
>   	igt_info("Pipe %s will use connector %s\n",
> @@ -213,6 +231,12 @@ test_from_C_to_B_with_3_lanes(data_t *data)
>   	igt_output_t *output1, *output2;
>   	int ret;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	find_outputs(data, &output1, &output2);
>   
>   	igt_info("Pipe %s will use connector %s\n",
> @@ -236,6 +260,12 @@ test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
>   	igt_output_t *output1, *output2;
>   	int ret;
>   
> +	/*
> +	 * Reset basic pipes, connectors and planes on
> +	 * @display back to default values.
> +	 */
> +	igt_display_reset(&data->display);
> +
>   	find_outputs(data, &output1, &output2);
>   
>   	igt_info("Pipe %s will use connector %s\n",
> @@ -291,5 +321,6 @@ igt_main
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
> +		close(data.drm_fd);
>   	}
>   }

-- 
~Swati Sharma
