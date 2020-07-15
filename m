Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB2C6EB70
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2020 14:21:57 +0000 (UTC)
Date: Wed, 15 Jul 2020 17:21:54 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200715142154.rnghcgqisyquncep@ahiler-desk1.fi.intel.com>
References: <20200711200602.3217-1-mohammed.khajapasha@intel.com>
 <20200711200602.3217-5-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711200602.3217-5-mohammed.khajapasha@intel.com>
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Jul 12, 2020 at 01:35:55AM +0530, Mohammed Khajapasha wrote:
> Get pipe from drm crtc for enabled pipes only.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  tests/kms_lease.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 2e6cf9b0..75a1149c 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -684,6 +684,8 @@ static void lease_unleased_crtc(data_t *data)
>  	/* Find another CRTC that we don't control */
>  	bad_crtc_id = 0;
>  	for (p = 0; bad_crtc_id == 0 && p < data->master.display.n_pipes; p++) {
> +		if(!(data->master.display.pipes[p].enabled))
> +			continue;
>  		if (pipe_to_crtc_id(&data->master.display, p) != data->crtc_id)
>  			bad_crtc_id = pipe_to_crtc_id(&data->master.display, p);

this also can be turned into for_each_pipe, which is a bit better than
adding enabled checks everywhere


>  	}
> -- 
> 2.24.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
