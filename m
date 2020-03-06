Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 229286ECCF
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 10:54:51 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Fri, 6 Mar 2020 10:54:43 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8242772A@BGSMSX104.gar.corp.intel.com>
References: <20200306084550.12618-1-karthik.b.s@intel.com>
In-Reply-To: <20200306084550.12618-1-karthik.b.s@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_dp_tiled_display: Increase
 the time limit to receive all page flips
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
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Friday, March 6, 2020 2:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Navare, Manasi D <manasi.d.navare@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t v2] tests/kms_dp_tiled_display: Increase the time limit to
> receive all page flips
> 
> Increasing the time limit from 10us to 20us, within which page flip events must be
> received from all the tiles.
> 
> We've seen that in a few corner cases the test fails with the existing time limit of
> 10us. Increasing the time limit to 20us to accommodate this.
> 
> As the increased time limit of 20us is still in the same blanking interval, there is no
> change in the test functionality.
> 
> v2: Add more justification in the commit message. (uma)

Change looks good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_dp_tiled_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c index
> b1160fee..6d19fea6 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -362,9 +362,9 @@ static void page_flip_handler(int fd, unsigned int seq,
> 
>  	/*
>  	 * For seamless tear-free display, the page flip event timestamps
> -	 * from all the tiles should not differ by more than 10us.
> +	 * from all the tiles should not differ by more than 20us.
>  	 */
> -	igt_fail_on_f(labs(usec) >= 10, "Delayed page flip event from CRTC:%d at
> %u:%u\n",
> +	igt_fail_on_f(labs(usec) >= 20, "Delayed page flip event from CRTC:%d
> +at %u:%u\n",
>  		      crtc_id, tv_sec, tv_usec);
>  }
> 
> --
> 2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
