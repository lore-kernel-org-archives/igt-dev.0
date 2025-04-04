Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE83C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 09:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8C610E0FC;
	Fri,  4 Apr 2025 09:04:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RgnM/DD/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89F5E10E0FC
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743757484; x=1775293484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=70sS5zZiWSIpMV2+imbo7zCeOwrKncsUvru6T1AAuxg=;
 b=RgnM/DD/pqYmW0mQu+q63t30OWYr9dxSPNqXmstBWAYAQMDEGxF2VeiI
 cSCXy2mYOjdvQdu7ysyAbgFBAKfYXUWvYplnIApfPBJRB6/ShmVSwm9N1
 bXmW/p9mmiNRDbiW6yElsksXlzBVpi+NK4yYbTnAazQtWV60qRbqZO6eG
 X22kR8Wtjo144H2MnzI88goRBC+EZnGGYNHfgKWiQD3NcrSpNEdQdhops
 uQOSa9e1SzJ56fH2yNDmiLi3rDDKaDmZf4pol7Syr7PXta7hmMIsiqB5i
 sN2IDLsxGOP6Z9jWoZXmigYDMAOuR0Kthwyjpxt2twNO8/OIDetbgRs7L g==;
X-CSE-ConnectionGUID: K8P55RluQU+K3O7h/GIPhA==
X-CSE-MsgGUID: qx88GdOuRH2aCy8+iSoSaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55384232"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="55384232"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 02:04:40 -0700
X-CSE-ConnectionGUID: wnO1ghu/R1+2cacDUPoPLg==
X-CSE-MsgGUID: SRNVY3auQCKqXuI4InP1gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127760177"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:04:38 -0700
Date: Fri, 4 Apr 2025 11:04:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 vinod.govindapillai@intel.com, karthik.b.s@intel.com
Subject: Re: [PATCH i-g-t] tests/intel/kms_dirtyfb: Fix misplaced parenthesis
 in display version check
Message-ID: <20250404090420.g6ncsbyittglosic@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 vinod.govindapillai@intel.com, karthik.b.s@intel.com
References: <20250404051503.2095885-1-jeevan.b@intel.com>
 <c999853c-522a-453e-aecb-93e2b3d085d7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c999853c-522a-453e-aecb-93e2b3d085d7@intel.com>
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

Hi Sharma,,
On 2025-04-04 at 14:11:57 +0530, Sharma, Swati2 wrote:
> Hi Jeevan
> 
> On 04-04-2025 10:45 am, Jeevan B wrote:
> > Fixed a misplaced parenthesis in the FBC display version check to ensure
> > correct tiling format selection.
> > 
> > Fixes: f0b66883398b4a07bb8fcaa3663a2140129d9a58
> Fixes tag is used like this
>  Fixes: 25039689b609 ("tests/kms: Drop 'Functionality' and 'Test category'
> from
>     documentation")

And please do not split this Fixes: line, it should be one-liner.

Regards,
Kamil

> Also, do git log to get reference :)
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >   tests/intel/kms_dirtyfb.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
> > index 8efa14447..a5707c5b1 100644
> > --- a/tests/intel/kms_dirtyfb.c
> > +++ b/tests/intel/kms_dirtyfb.c
> > @@ -386,7 +386,7 @@ igt_main
> >   					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
> >   					if (data.feature == FEATURE_FBC &&
> > -					    intel_display_ver(intel_get_drm_devid(data.drm_fd) <= 8))
> > +					    intel_display_ver(intel_get_drm_devid(data.drm_fd)) <= 8)
> >   						data.modifier = I915_FORMAT_MOD_X_TILED;
> >   					else
> >   						data.modifier = DRM_FORMAT_MOD_LINEAR;
> 
