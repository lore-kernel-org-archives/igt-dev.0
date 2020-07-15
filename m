Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB06EB70
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 14:19:51 +0000 (UTC)
Date: Wed, 15 Jul 2020 17:19:47 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200715141947.6s7escmm5qd2vxog@ahiler-desk1.fi.intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
 <20200711200602.3217-6-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711200602.3217-6-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 05/11] tests/kms_lease: Read crtc id for
 a valid pipe
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
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Jul 12, 2020 at 01:35:56AM +0530, Mohammed Khajapasha wrote:
> Read crtc id for enabled pipes only.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  tests/kms_lease.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 75a1149c..4045fbca 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -136,9 +136,11 @@ static enum pipe crtc_id_to_pipe(igt_display_t *display, uint32_t crtc_id)
>  {
>  	enum pipe pipe;
>  
> -	for (pipe = 0; pipe < display->n_pipes; pipe++)
> -		if (display->pipes[pipe].crtc_id == crtc_id)
> +	for (pipe = 0; pipe < display->n_pipes; pipe++) {
> +		if (display->pipes[pipe].enabled &&
> +				display->pipes[pipe].crtc_id == crtc_id)

for_each_pipe is already iterating over enabled pipes only, you could
use just that instead of hand-rolling iteration here

-- 
Cheers,
Arek

>  			return pipe;
> +	}
>  	return -1;
>  }
>  
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
