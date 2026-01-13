Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E567D2D10A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0074F89906;
	Tue, 13 Jan 2026 14:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S6KslJZl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831489906
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768315065; x=1799851065;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=fhGe/dVzjOqRs0ENZ+UfT4SsrJR/dVqsP6AoPePREi4=;
 b=S6KslJZleRGPaept9GSz/daR8lnp0dD89dFvoUoDzN65wP279aLeqyZ+
 XWn9ESuG7Tnkg3T8YXJ0ULE0aE/mpytLGAe8merK7wL2BtW65oPNFteG9
 yCQflZ5llGEk4WXKRutNgybY36r9Mv1pA5OtWf3OUA2DAeup+PK0z2mN8
 xghcB3xHGvg2jKwPC1ZfVzeaP8BJzx6dY+h7kuJmXNOAlP5Y2O2aIK1aH
 VG6sAxulZe/g+fBOEspUGKSC23PXinOy9WUWVruos6B22SMZv8bIxo+2d
 EHFcL/GxDfNTS/CeBbBUKuavuBkvHb9MLyEcJ1yn+NPCcGvjgzd32h+5f A==;
X-CSE-ConnectionGUID: vwaAnCAySFO8KiEzzkBYSQ==
X-CSE-MsgGUID: YMKplHcTS5G45rgnkCjWig==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68606877"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="68606877"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:37:45 -0800
X-CSE-ConnectionGUID: wD5qblbMRK6GDPeCnouINA==
X-CSE-MsgGUID: p72fuakSSTu4KMb/Aj8vqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204808955"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:37:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/8] tests/kms_async_flips: Use designated
 initializers in wait_for_vblank()
In-Reply-To: <20260113120439.12577-7-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-7-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:37:41 +0200
Message-ID: <9b8eb5a4c72be70f1e280f671c27eeb30aaee531@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Tue, 13 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Clean up wait_vblank() by using designated initializers.
> The non-blocking queue_vblank() counterpart already does
> it this way.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_async_flips.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 71570385c32e..92246037ca87 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -555,18 +555,14 @@ static void test_async_flip(data_t *data)
>=20=20
>  static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsig=
ned int *seq)
>  {
> -	drmVBlank wait_vbl;
> -	uint32_t pipe_id_flag;
> -	int pipe;
> -
> -	memset(&wait_vbl, 0, sizeof(wait_vbl));
> -	pipe =3D kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
> -	pipe_id_flag =3D kmstest_get_vbl_flag(pipe);
> -
> -	wait_vbl.request.type =3D DRM_VBLANK_RELATIVE | pipe_id_flag;
> -	wait_vbl.request.sequence =3D 1;
> +	int pipe =3D kmstest_get_pipe_from_crtc_id(data->drm_fd, data->crtc_id);
> +	drmVBlank wait_vbl =3D {
> +		.request.type =3D DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe),

I'll note that passing pipe to kmstest_get_vbl_flag() is wrong, but the
patch at hand is just non-functional cleanup. We'll need to revisit
this.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +		.request.sequence =3D 1,
> +	};
>=20=20
>  	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
> +
>  	*vbl_time =3D wait_vbl.reply.tval_sec * 1000000 + wait_vbl.reply.tval_u=
sec;
>  	*seq =3D wait_vbl.reply.sequence;
>  }

--=20
Jani Nikula, Intel
