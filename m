Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71E3F8D753
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:48:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986CF10E8DB;
	Thu, 16 Apr 2026 15:48:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YNG07ToF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2A010E8E9
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776354474; x=1807890474;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=+RT+3D+KTHcDAdyuVtfNMJPp/80IeQ+9eZP+itI10K8=;
 b=YNG07ToFyEmlnOeC1R+ol8U1ne08TFVnsYQPx7vIESQTJdr0LMqnkWq5
 rlBfSafPIpPWxFgQ1r6ebDKL/MQeePWCwyohIF+mZQtt97CsvgHSvSJ5s
 mCPfUpEOFMz2ntcyNmpVk6e7mMnca8s9wvXgSnDFPmi9OOaJCd6qhE6rV
 x1tkv38mOMHxEMpGra3DTnLc+nRD5uiAgzDdvryn/5uT16j47IXo6B99K
 5az9EvGLHJJCQCa6rkQXlELW42RQ5P1e1WW6CqYDKZAaZpXH4O0fVe4ih
 XwpD5tEnTwUGmwiN+PBAU8C+lKm8w9a6IUlE9x8/4MJAOIBvmxypRXDiY Q==;
X-CSE-ConnectionGUID: NrODQOb9R7Cr1juswFUGDQ==
X-CSE-MsgGUID: hEKBPMKxQAexom287TSyRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="94764721"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="94764721"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:47:54 -0700
X-CSE-ConnectionGUID: jbelZTYfScuGBYg7gOkPlw==
X-CSE-MsgGUID: zCt7x2NNTUu1745W69c7bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="254009499"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.108])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 08:47:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH i-g-t 2/3] lib/kms: Use for_each_plane_format() for the
 msm scaler counting
In-Reply-To: <20260416141334.20086-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260416141334.20086-1-ville.syrjala@linux.intel.com>
 <20260416141334.20086-2-ville.syrjala@linux.intel.com>
Date: Thu, 16 Apr 2026 18:47:48 +0300
Message-ID: <bc5ceb33e75b01bb6a560ad097e665d5a68ec2ba@intel.com>
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

On Thu, 16 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently the scaler counting loop iterates over the entire
> format_mod blob format list. That list may contain a lot of duplicate
> formats (one for each modifier supported with that format), so this
> is a bit inefficient. Iterate the plane's format list instead which
> has no duplicates.
>
> Cc: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

I think this is probably fine, but would be nice to get rb from Rob.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  lib/igt_kms.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2d758b63c043..4cc7c06812c8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7504,10 +7504,11 @@ int igt_crtc_num_scalers(igt_crtc_t *crtc)
>  		 * as a rough approximation of the # of scalars.. it may
>  		 * undercount on some hw, but it will not overcount
>  		 */
> -		for_each_plane_on_crtc(crtc,
> -				       plane) {
> -			for (unsigned i =3D 0; i < plane->format_mod_count; i++) {
> -				if (igt_format_is_yuv(plane->formats[i])) {
> +		for_each_plane_on_crtc(crtc, plane) {
> +			uint32_t format;
> +
> +			for_each_plane_format(plane, format) {
> +				if (igt_format_is_yuv(format)) {
>  					num_scalers++;
>  					break;
>  				}

--=20
Jani Nikula, Intel
