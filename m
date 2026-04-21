Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E49F8FA65
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 12:02:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BAD10E88E;
	Tue, 21 Apr 2026 12:02:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A+Sy7b0H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B585A10E88E
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 12:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776772926; x=1808308926;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=urPbo1upKPRcH/k8VeMN1Xh1kMk4UAxtAF9Ha24u+lw=;
 b=A+Sy7b0HQqbcDlsiAh8qX1w6gzm1sPquAswf7zy/m/Jb6Y9bFs1FaGa8
 OPaD32+tJHXxSLMQtX/cGf5PZJ0VLzj9xLzvDbTZluZCuZ5MNYWpdn9I5
 wIc7VMsrXg0fZLu/seuMVEFXZncw3lARf4jbPvPdHQZpl5IHhonrhBY+Z
 sumVodH0KcGDkXwHp6aqbhtUPOq2Z/PqBqFG/tU5OScYxDH9INtuPOT2v
 dNrhOn4OYx7iq3GxHVZAOVpUAbX30xe4V2WKHcO8Pe78r2pW7o8tkhHn8
 7DmABkK7mn4bAZSitQtOvdw+SuIDvBfjlwvoG5kUuLYB0xRfppBB2dGeJ w==;
X-CSE-ConnectionGUID: rg99REMQR0GpE4ygXWCFwA==
X-CSE-MsgGUID: JTuZdN7nScSvIltKIdL+XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76734503"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="76734503"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:02:05 -0700
X-CSE-ConnectionGUID: iKmb0kXwQ06hIk+5TkRRCA==
X-CSE-MsgGUID: P4KXj4W6TBSKzhzan9F7Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="225516230"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.38])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:02:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jing-Ping Jan <jingpingjan@google.com>, igt-dev@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Jing-Ping Jan <jingpingjan@google.com>
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
In-Reply-To: <20260421064342.2851479-2-jingpingjan@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
 <20260421064342.2851479-2-jingpingjan@google.com>
Date: Tue, 21 Apr 2026 15:02:01 +0300
Message-ID: <eb51511e2445b2cd19dda662bf1f402ed92887e1@intel.com>
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

On Tue, 21 Apr 2026, Jing-Ping Jan <jingpingjan@google.com> wrote:
> Based on the original implementation and the comment above the function,
> it appears the expected behavior is for the plane indices to remain
> consistent with those in crtc->planes. Therefore, after swapping the old
> and new primary planes, we must update the index in igt_plane_t to
> ensure it matches the corresponding index in crtc->planes.
>
> Therefore, we should expect the indices of the old and new primary
> planes to remain unchanged after swapping them.
>
> Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")

With Fixes: it's customary to Cc the author and reviewer(s).

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

> Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> ---
> v2:
>   - Add Fixes tag to the commit message.
>  lib/igt_kms.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index bec96f267..405a04640 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *displ=
ay)

The whole context here is:

			if (new_primary->index !=3D 0) {
				igt_assert(old_primary !=3D new_primary);

				igt_assert_eq(old_primary->index, 0);
				igt_assert_neq(new_primary->index, 0);

>  				igt_swap(*old_primary, *new_primary);
>  				igt_swap(old_primary->index, new_primary->index);
>=20=20
> -				igt_assert_neq(old_primary->index, 0);
> -				igt_assert_eq(new_primary->index, 0);
> +				igt_assert_eq(old_primary->index, 0);
> +				igt_assert_neq(new_primary->index, 0);

Why do you expect these to remain the same as before the swapping?
That's why we are swapping.

>  			} else {
>  				igt_assert(old_primary =3D=3D new_primary);

--=20
Jani Nikula, Intel
