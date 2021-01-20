Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2097D6E3E3
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jan 2021 12:20:41 +0000 (UTC)
Date: Wed, 20 Jan 2021 14:20:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20210120122036.GJ7444@platvala-desk.ger.corp.intel.com>
References: <20210120114144.25368-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210120114144.25368-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_rotation_crc: reduce
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
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 20, 2021 at 05:11:43PM +0530, Jeevan B wrote:
> Restricting the execution to 2 pipes
> with this change we see 50% improvement in time efficiency.
> 
> v2: Updated commit message.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  tests/kms_rotation_crc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 33a97cca..cc404a61 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -421,6 +421,10 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>  		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>  			continue;
>  
> +		/* restricting the execution to 2 pipes to reduce execution time*/
> +		if (pipe > PIPE_B && !data->extended)
> +			break;
> +

What's the plan for platforms that might have two pipes as A+C?


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
