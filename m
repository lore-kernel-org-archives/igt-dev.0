Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28309D66B9A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 19:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C256110E249;
	Wed, 17 Dec 2025 19:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DGTuVCWK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD89710E249
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765999225; x=1797535225;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=I1dLeb7NSj2sHGbIYc3Df7nomoaG/4jA9OWAEvHm98M=;
 b=DGTuVCWK3PpjCBU5t2DSi+k4We7c3Xe7f2jIFRbFZ3JX/aK8wK69N/Vf
 QURzNEzqN8Uz+Mh0MmqQyGWX/auPLg8TA9kjZjC32B0DL2HAJlxuz+/r/
 RjiMjr6CfzO5V+VSpseAScr6bTAOjXDyWD1pXRzR6EfNkvq6RtXB2LA2f
 clyL6rvp4aCzQX7IznLrm9kmmJTJkYujNsEvbD0NaCUJiRIQDE80IGzR+
 25CGJiNASJM717TwPUxqzTTzNeZYfyeNnFYub1vncnAuFsikfIEWWjRjq
 ZCrLJz8puMDOyHhrz+z/VcrwhdsF3stKJqSn7owEzu09lqiBhKgFF7uQ0 A==;
X-CSE-ConnectionGUID: PSoQXCweQRasjILexJjGjg==
X-CSE-MsgGUID: Pd1vZSNHTLOE3yDwjY3Vkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67888058"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; d="scan'208";a="67888058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:20:25 -0800
X-CSE-ConnectionGUID: 5LpKqYmXTleDCleiLSP2OQ==
X-CSE-MsgGUID: VKhEHjgiSEWrJs0uLLJFQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="203281477"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.216])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 11:20:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/11] lib/kms: Use '{old, new}_primary' variable
 names in plane swapping
In-Reply-To: <20251217153758.9369-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251217153758.9369-1-ville.syrjala@linux.intel.com>
 <20251217153758.9369-9-ville.syrjala@linux.intel.com>
Date: Wed, 17 Dec 2025 21:20:20 +0200
Message-ID: <4cda6ca48803d6ba954a613bf7e56ebab6a81c4e@intel.com>
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
> Make the primary plane swapping a bit less confusing by
> renaming the variables to '{old,new}_primary'
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  lib/igt_kms.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7ae166253a3f..ef3215332e29 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3022,10 +3022,10 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  		output =3D igt_get_single_output_for_pipe(display, i);
>=20=20
>  		if (pipe->num_primary_planes > 1) {
> -			igt_plane_t *primary =3D &pipe->planes[0];
> -			igt_plane_t *assigned_primary =3D
> +			igt_plane_t *old_primary =3D &pipe->planes[0];
> +			igt_plane_t *new_primary =3D
>  				igt_get_assigned_primary(output, pipe);
> -			int assigned_primary_index =3D assigned_primary->index;
> +			int new_primary_index =3D new_primary->index;
>=20=20
>  			/*
>  			 * If the driver-assigned primary plane isn't at
> @@ -3034,11 +3034,11 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
>  			 *
>  			 * This way, the primary plane is always at index 0.
>  			 */
> -			if (assigned_primary_index !=3D 0) {
> -				assigned_primary->index =3D 0;
> -				primary->index =3D assigned_primary_index;
> +			if (new_primary_index !=3D 0) {
> +				new_primary->index =3D 0;
> +				old_primary->index =3D new_primary_index;
>=20=20
> -				igt_swap(pipe->planes[assigned_primary_index],
> +				igt_swap(pipe->planes[new_primary_index],
>  					 pipe->planes[0]);
>  			}
>  		}

--=20
Jani Nikula, Intel
