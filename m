Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C734FCFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 09:37:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661E110E1FB;
	Mon, 24 Nov 2025 09:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LcZnyIv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C3310E1FB
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 09:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763977048; x=1795513048;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=XAXcYIm4FFs7FV8znsIwzTsvAGqJK2RjnraxaiyKiY4=;
 b=LcZnyIv63M+3GWqtVmq7Qdg+yAaIZGSZP95rlXBb2vLN7w52A7HmOH4V
 uX4zsbPq1d25gzStTpLX9giLIfjRlwEN9SFMMg0ukm68N6b1X5WaBTOli
 gjku5RnXD4mF7pz5si3GStjmyZlyWCaq8CR1WkV8vVH9wt/7xp4MyDmnr
 qT4tYSqJEqW+tlSEs6Aq+6/KsJ3l1ln2ueE+PqwnQ6SvEx95Ncw4sLvGI
 Iw8qMelHJPszVneo9VtuVDnfiI1UPOBiw7eCmi6ANhGiaPLTvTRYEV39t
 T0yOGOwgaEnZ+Q0exCOeoxp0rCAop72atXHs2AchqrKK97C2KYTcDGYPK w==;
X-CSE-ConnectionGUID: 7I/1lsynTIGgCyNdF9108w==
X-CSE-MsgGUID: UZS5dBLYQMidmXjelKJpKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="66049489"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="66049489"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 01:37:28 -0800
X-CSE-ConnectionGUID: ptPC1nK2QKWXTin1zsSNmA==
X-CSE-MsgGUID: u0wBR/pMRPSI4YaHbUfRzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="192162234"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.177])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 01:37:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/8] igt: Name drmModeCrtc variables 'drm_crtc'
In-Reply-To: <20251121190633.24522-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251121190633.24522-1-ville.syrjala@linux.intel.com>
 <20251121190633.24522-2-ville.syrjala@linux.intel.com>
Date: Mon, 24 Nov 2025 11:37:23 +0200
Message-ID: <2a9ad8950036a45431774a6ab66b11d65a8a041f@intel.com>
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

On Fri, 21 Nov 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The current situation with pipes vs. crtcs is a giant mess.
> In order to untangle things properly I think we need to
> move away from the pipe stuff into a more pure crtc world.
>
> I suspect the best way to get there is by renaming igt_pipe_t
> into igt_crtc_t and making everyone use it instead of the raw
> index/pipe numbers. And presumable we'll want to call the
> igt_crtc_t variables 'crtc', so let's clear out the namespace
> for that by using 'drm_crtc' as the variable name for the
> lower level drmModeCrtc stuff.

For clarity, I suppose also s/crtc_offset/crtc_index/g for the member in
igt_pipe_t (igt_crtc_t) would be in order as follow-up.


BR,
Jani.


--=20
Jani Nikula, Intel
