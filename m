Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FF7D767F5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5921010EF69;
	Fri, 19 Dec 2025 12:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgHtk5A5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4326610EF69
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145623; x=1797681623;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=JX0suZUXJQHphiLiY6DtwYzDlAHHb1iv1CcGFAXT94M=;
 b=YgHtk5A5Kx36wC66qPBfC2VGpKASeS/o1GteTdPHWIwVpPWQBx+iDI/j
 Cwc3V5k+YliDqwAW7FNeWIMhApT7jCSb4OqrSzUcYynFjTtrg0PCCOROg
 bORyGthCV7d9kxCq8mWCjooNwp9ALEHf/jAa/SEqfu3+TlOagNzldpv9z
 R0nvi85PKOGR2t15xSdd/7GQKzy9guLDtKF5l3YXdeoqbA3GY3OhrG+AA
 JoA+Atm0fCgmhA+0Jc+inucffgvNX8J1/sF/4hnn7XsIyPn+Pox7uZckX
 +DylqNdGo9j+CworyfNcyF4p002EMgcuvGwBpgEyAalRdq8RMD55u0hLD g==;
X-CSE-ConnectionGUID: 2KL49luUSM6XJLItddv2xw==
X-CSE-MsgGUID: TMlxAzgxSLSqs+wB2HvcBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473762"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:00:23 -0800
X-CSE-ConnectionGUID: eoX9sNE1Qbi8Cnlkg9PVog==
X-CSE-MsgGUID: 1UmgWPlsQ4C+CyL0pQT2vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203243320"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.34])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:00:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 09/11] lib/kms: Pimp the priamry plane swapping
In-Reply-To: <20251217153758.9369-10-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-10-ville.syrjala@linux.intel.com>
Date: Fri, 19 Dec 2025 14:00:18 +0200
Message-ID: <cd18fda8f7ff8c322899d9d8b7eda049c635fb8d@intel.com>
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

On Wed, 17 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Do the primary plane swap a bit more cleanly with a pair of
> igt_swap()s. And while at it sprinkle some asserts around
> to make sure we didn't screw anything up.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Subject, *primary

> ---
>  lib/igt_kms.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index ef3215332e29..69a430f01e21 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3025,7 +3025,6 @@ void igt_display_reset_outputs(igt_display_t *displ=
ay)
>  			igt_plane_t *old_primary =3D &pipe->planes[0];
>  			igt_plane_t *new_primary =3D
>  				igt_get_assigned_primary(output, pipe);
> -			int new_primary_index =3D new_primary->index;
>=20=20
>  			/*
>  			 * If the driver-assigned primary plane isn't at
> @@ -3034,12 +3033,21 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  			 *
>  			 * This way, the primary plane is always at index 0.
>  			 */
> -			if (new_primary_index !=3D 0) {
> -				new_primary->index =3D 0;
> -				old_primary->index =3D new_primary_index;
> +			if (new_primary->index !=3D 0) {
> +				igt_assert(old_primary !=3D new_primary);
>=20=20
> -				igt_swap(pipe->planes[new_primary_index],
> -					 pipe->planes[0]);
> +				igt_assert_eq(old_primary->index, 0);
> +				igt_assert_neq(new_primary->index, 0);

Nitpick, this is redundant as we're in new_primary->index !=3D 0 branch,
but then again it's symmetric with the post-swap checks. *shrug*.

Anyway I'm glad the asserts are there, because the swaps on *&foo are a
bit hard for the reader.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +
> +				igt_swap(*old_primary, *new_primary);
> +				igt_swap(old_primary->index, new_primary->index);
> +
> +				igt_assert_neq(old_primary->index, 0);
> +				igt_assert_eq(new_primary->index, 0);
> +			} else {
> +				igt_assert(old_primary =3D=3D new_primary);
> +
> +				igt_assert_eq(old_primary->index, 0);
>  			}
>  		}
>  	}

--=20
Jani Nikula, Intel
