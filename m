Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9F56E1E2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2020 08:39:15 +0000 (UTC)
Date: Mon, 20 Jul 2020 11:39:10 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200720083910.j63rzkjsblylvgt6@ahiler-desk1.fi.intel.com>
References: <20200717154101.8849-1-mohammed.khajapasha@intel.com>
 <20200717154101.8849-5-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200717154101.8849-5-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 04/11] tests/kms_lease: Get pipe from
 crtc for enable pipes
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
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com, kishore.kunche@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 03:40:54PM +0000, Mohammed Khajapasha wrote:
> Get pipe from drm crtc for enabled pipes only.
> 
> v2:
>     Using for_each_pipe() macro for enable pipes <Hiler, Arkadiusz>
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  tests/kms_lease.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 2e6cf9b0..0481bba7 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -683,7 +683,10 @@ static void lease_unleased_crtc(data_t *data)
>  
>  	/* Find another CRTC that we don't control */
>  	bad_crtc_id = 0;
> -	for (p = 0; bad_crtc_id == 0 && p < data->master.display.n_pipes; p++) {
> +
> +	for_each_pipe(&data->master.display, p) {
> +		if (bad_crtc_id != 0)
> +			continue;

Would be better to make it 'break' as it would short circuit the whole
loop instead of going though al all the noop interation with 'continue',
but in the end it donesn't really matter that much.

>  		if (pipe_to_crtc_id(&data->master.display, p) != data->crtc_id)
>  			bad_crtc_id = pipe_to_crtc_id(&data->master.display, p);
>  	}
> -- 
> 2.25.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
