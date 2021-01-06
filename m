Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4698D89BF5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Jan 2021 05:56:49 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Wed, 6 Jan 2021 05:56:44 +0000
Message-ID: <18a8fa5830ea40a9a24707f57d8348e7@intel.com>
References: <20201229074604.24064-1-jeevan.b@intel.com>
In-Reply-To: <20201229074604.24064-1-jeevan.b@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_rotation_crc: reduce
 execution time
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Tuesday, December 29, 2020 1:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_rotation_crc: reduce execution time
> 
> Restricting the execution to 2 pipes.

Please add some more details here. Would be good to add the actual execution time
improvement.

With that added, this is
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_rotation_crc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> ffcc2cc2..07639236 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -409,6 +409,10 @@ static void test_plane_rotation(data_t *data, int
> plane_type, bool test_bad_form
>  		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>  			continue;
> 
> +		/* restricting the execution to 2 pipes to reduce execution time*/
> +		if (pipe > PIPE_B && !data->extended)
> +			break;
> +
>  		igt_output_set_pipe(output, pipe);
> 
>  		plane = igt_output_get_plane_type(output, plane_type);
> --
> 2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
