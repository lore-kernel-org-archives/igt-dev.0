Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D025DCF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 21:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FA7910E0A0;
	Mon, 23 Sep 2024 21:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mo7zaiCV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E24910E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 21:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727127137; x=1758663137;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aHIvRlA0OEOIgejyZdrOJve0cDC5VjTOkHbHwyqGiQo=;
 b=Mo7zaiCVD/IomafqWHBtmHqUHn1EzpOI+rOG8uSfpuAb6Q/yUzNgilVy
 HsOFZ+iaa7UEU3qaxJQED15Bfs4ootz2xTtlaP2lgS0SNLunfA3xY80h5
 3r4bezTXmU3/O7a1/KzX1NLi4AX2073GeDg4ME2BOq1KDHHxfyxQj+PUN
 5Anw9VNAtB51aid4jwzEnKTkAk2S+nJ4lFUgC1TFXoSCKQSzizhPg5kwF
 eLEoqIVtm4Mfx6tMPJdPC86kyvnftXJ+XrTh/dg6KGhpOcGSTxK2ogrwc
 InkkHnjqJcq15E7tMwHDwPhWcat4QsrYNhhQXLkXOS7Pz1E5krmAocy0I g==;
X-CSE-ConnectionGUID: 0gQZ6uvFRvW9CNWTJzw8/Q==
X-CSE-MsgGUID: g+5GN+urSnOzob7g409auA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43612645"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="43612645"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 14:32:17 -0700
X-CSE-ConnectionGUID: fEgpnZ0lTRSggWC2ZNjxkg==
X-CSE-MsgGUID: I1M9VK1YSXeMM0E1jJHxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="71337089"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 23 Sep 2024 14:32:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 24 Sep 2024 00:32:14 +0300
Date: Tue, 24 Sep 2024 00:32:14 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/6] tests/kms_ccs: Use logical && instead of
 bitwise &
Message-ID: <ZvHeXjNdzz0IiFC3@intel.com>
References: <20240923204557.32123-1-ville.syrjala@linux.intel.com>
 <20240923204557.32123-4-ville.syrjala@linux.intel.com>
 <qziedgc6uoxqm4px4jquizuouiznolm3udkbaj7n4mrxtagibe@5rvdyzyuiwwt>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <qziedgc6uoxqm4px4jquizuouiznolm3udkbaj7n4mrxtagibe@5rvdyzyuiwwt>
X-Patchwork-Hint: comment
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

On Mon, Sep 23, 2024 at 04:01:21PM -0500, Lucas De Marchi wrote:
> On Mon, Sep 23, 2024 at 11:45:54PM GMT, Ville Syrjälä wrote:
> >From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> >The code appears to want to use a logical AND instead
> >of a bitwise AND. Make it so.
> >
> >Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >---
> > tests/intel/kms_ccs.c | 4 ++--
> > 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> >index 835a3fe5aed2..8be8ac58e576 100644
> >--- a/tests/intel/kms_ccs.c
> >+++ b/tests/intel/kms_ccs.c
> >@@ -394,8 +394,8 @@ static void access_flat_ccs_surface(struct igt_fb *fb, bool verify_compression)
> > 	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
> > 	uint8_t uc_mocs = intel_get_uc_mocs_index(fb->fd);
> > 	uint8_t comp_pat_index = intel_get_pat_idx_wt(fb->fd);
> >-	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &
> >-						xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
> >+	uint32_t region = (AT_LEAST_GEN(intel_get_drm_devid(fb->fd), 20) &&
> >+			   xe_has_vram(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
> 
> nit: first parenthesis is also pointless and it'd read better without
> breaking the line in the middle of the condition.

This code should probably be refactored more heavily anyway
since we seem to be repeating ourselves many times.

> 
> Anyway,
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> >
> > 	struct drm_xe_engine_class_instance inst = {
> > 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> >-- 
> >2.44.2
> >

-- 
Ville Syrjälä
Intel
