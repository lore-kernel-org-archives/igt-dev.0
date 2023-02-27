Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DB810E15A
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 06:43:40 +0000 (UTC)
Message-ID: <bee1a161-44cb-d189-29a1-b45c35ba00a0@intel.com>
Date: Mon, 27 Feb 2023 12:13:20 +0530
Content-Language: en-US
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230227055409.136175-1-ankit.k.nautiyal@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230227055409.136175-1-ankit.k.nautiyal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_lease: Set Aspect ratio
 client cap in case of legacy commit
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

Hi Ankit,

On Mon-27-02-2023 11:24 am, Ankit Nautiyal wrote:
> For clients setting DRM_CLIENT_CAP_ATOMIC, the support for aspect ratio
> bits in mode flags is enabled by default. For legacy commit, clients need
> to set the aspect ratio cap explicitly, if they want to set aspect ratio
> bits in the mode flags.
> Currently in case of setcrtc_implicit_plane, the client using the lease
> does not set the aspect-ratio property before using setcrtc ioctl. This
> creates a problem, when there are aspect-ratio bits present in the mode
> flags. In such a case the setcrtc ioctl fails, as driver expects the
> aspect ratio bits unset.
> 
> So set DRM_CLIENT_CAP_ASPECT_RATIO, if the mode flags do have aspect
> ratio bits set, before calling the setcrtc ioctl.
> 
> v2: Set the aspect ratio client cap only for lesse.
-----------------------------------------------^
Nit: typo s/lesse/lease/

> 
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/kms_lease.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 67e8d3bec700..61e1f7dccde7 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -345,6 +345,14 @@ static void setcrtc_implicit_plane(data_t *data)
>   	do_or_die(create_lease(data->master.fd, &mcl));
>   	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>   
> +	/*
> +	 * For Legacy commit, If userspace wants to send modes with aspect-ratio bits
> +	 * then the client cap for aspect-ratio bits must be set.
> +	 */
> +	if (mode->flags & DRM_MODE_FLAG_PIC_AR_MASK) {
> +		drmSetClientCap(mcl.fd, DRM_CLIENT_CAP_ASPECT_RATIO, 1);
> +	}

As drm_mode_setcrtc loctl checks for the lease access before checking 
the aspect-ratio bits, similar change is not required at [1].

[1]: 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_lease.c#L364

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> +
>   	/* Set a mode on the leased output */
>   	igt_assert_eq(0, prepare_crtc(&data->master, data));
>   
