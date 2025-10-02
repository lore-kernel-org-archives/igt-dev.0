Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127ABCAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 15:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B766A10E1BE;
	Thu,  2 Oct 2025 15:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vg924EY6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA6910E1BE
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759417931; x=1790953931;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fnB0oC9QY8HufOCauT7fSt1cNePGhLEM+djzOkUMXrM=;
 b=Vg924EY6XWH64NHY6pr5POJxFetrKBmuCgnB9HV0E86kOQKulvMGyMfd
 i4Jvcxt/WZxUquMCzNoO9dicgofNPZt9ESSEb91anKz4mEif3nnQB4dwA
 hdHI1FYijkp/NJcJphTeL9f602Ngn+YtrVCaJsY5CFA8+TQbxcxJc2T3U
 hHxaTfYcxdAXl8XDXyA27iF02QSFTajp0aqFAf1Sz8cKBJF7MKxkpHRYH
 sp2aFaPyapUSksBRBTfnVQWgAXX59rpMt9dzt1UI0ExDVudm1QblRLA8d
 nwd88A1rJlI0teRLCmC1jo7Xxolhum2+4CROd/FtmilMuOSX79Cn+aYGA g==;
X-CSE-ConnectionGUID: xsqUAhyxQPCsaHaYI7LIIg==
X-CSE-MsgGUID: QGYnI4WLRY6VT5WThMeA2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61413490"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61413490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 08:12:11 -0700
X-CSE-ConnectionGUID: fmsWalg4Q0OX1U0fatX0kQ==
X-CSE-MsgGUID: qcvnqtRBRh2Ia8bFvnwlzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178170386"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 08:12:09 -0700
Date: Thu, 2 Oct 2025 17:11:52 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com, leo.liu@amd.com
Subject: Re: [PATCH V10 02/30] lib/igt_kms: Introduce
 DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
Message-ID: <20251002151152.24whdoghdyiwpsjv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Alex Hung <alex.hung@amd.com>, harry.wentland@amd.com,
 leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-3-alex.hung@amd.com>
 <5efb9dc9-6007-4d0b-bf84-950cbf208362@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5efb9dc9-6007-4d0b-bf84-950cbf208362@bootlin.com>
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

Hi all,
On 2025-09-30 at 12:37:17 +0200, Louis Chauvet wrote:
> 
> 
> Le 15/08/2025 à 06:06, Alex Hung a écrit :
> > From: Harry Wentland <harry.wentland@amd.com>
> > 
> > Setting the COLOR_PIPELINE plane prop is only allowed when the
> > DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is set.
> > 
> > Setting COLOR_RANGE and COLOR_ENCODING is only allowed when the
> > DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE is NOT set.
> > 
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> > ---
> >   include/drm-uapi/drm.h | 15 ++++++++++
> >   lib/igt_kms.c          | 63 ++++++++++++++++++++++++++++++++++--------
> >   lib/igt_kms.h          |  1 +
> >   tests/kms_properties.c | 20 ++++++++++----
> >   4 files changed, 81 insertions(+), 18 deletions(-)
> > 
> > diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
> > index 4e4f7c2c3..6b9af3348 100644
> > --- a/include/drm-uapi/drm.h
> > +++ b/include/drm-uapi/drm.h
> > @@ -869,6 +869,21 @@ struct drm_get_cap {
> >    */
> >   #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
> > +/**
> > + * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
> > + *
> > + * If set to 1, the DRM core will
> > + * - expose plane COLOR_PIPELINE properties for pre-blending color management.
> > + * - reject setting of these plane properties:
> > + *   - COLOR_ENCODING
> > + *   - COLOR_RANGE
> > + *
> > + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> > + *
> > + * This capability is currently in development.
> > + */
> > +#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
> > +
> 
> I think this should go in a separate commit ("inclde/drm-uapi: sync with
> color pipeline series")
> 

O even shorter:

drm-uapi/drm: sync with color pipeline commit

and in description give a sha1 for drm-next commit which
introduces COLOROP changes. See log with

git log -- include/drm-uapi/drm.h

Please make uapi change in separate patch(es). You
could also read about it in igt README.md

Regards,
Kamil

[cut]
