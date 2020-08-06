Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6567489D5B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2020 13:37:41 +0000 (UTC)
References: <20200806133337.8482-1-petri.latvala@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <11452e95-c104-db89-c8cd-58858f7dfdcc@intel.com>
Date: Thu, 6 Aug 2020 19:07:37 +0530
MIME-Version: 1.0
In-Reply-To: <20200806133337.8482-1-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_pipe_crc_basic: Remove
 redundant igt_require_pipe
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

LGTM.
Acked-by: Karthik B S <karthik.b.s@intel.com>

On 8/6/2020 7:03 PM, Petri Latvala wrote:
> The plan was to remove the call while merging a6b258448837
> ("tests/kms_pipe_crc_basic: Sanity check for CRC mismatches")
> according to the review feedback, but that was forgotten. Remove it
> now.
> 
> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_pipe_crc_basic.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index c3c4cdd8..bb66bc6c 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -177,7 +177,6 @@ static void test_compare_crc(data_t *data, enum pipe pipe)
>   	igt_require_f(output, "No connector found for pipe %s\n",
>   			kmstest_pipe_name(pipe));
>   
> -	igt_require_pipe(display, pipe);
>   	igt_display_reset(display);
>   	igt_output_set_pipe(output, pipe);
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
