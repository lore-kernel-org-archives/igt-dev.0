Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2921E10E59D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 05:11:11 +0000 (UTC)
Message-ID: <e5897a47-095b-6695-93d7-5858771c1266@intel.com>
Date: Fri, 13 Oct 2023 10:40:48 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231011092833.66391-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231011092833.66391-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: drop planes from
 dynamic subtest name
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


On 10/11/2023 2:58 PM, Swati Sharma wrote:
> Drop planes from dynamic subtest name.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9a515559c..edaddd928 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1307,7 +1307,7 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   			continue;
>   
>   		igt_output_set_pipe(data->output, PIPE_NONE);
> -		igt_dynamic_f("pipe-%s-planes", kmstest_pipe_name(pipe))
> +		igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe))
>   			test(data, pipe);
>   
>   		if (is_pipe_limit_reached(++count))
