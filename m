Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C19ACA0FED
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 07:23:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8E9310E638;
	Tue,  9 Sep 2025 07:23:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F16ELdkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0FD810E638
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 07:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757402597; x=1788938597;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y++mL/4eRzOTKKwAQgOod3XIiQtfc4kXOS4w+feut50=;
 b=F16ELdkVkOPViMHGxJc22K6o8flwq440KBYwtCf7qW03mbiRwwvEeL6a
 M0HepSpdy+EVEwteeN1TUrQtf6COEN1dE4xEB3tqumndZ3pYy4MkACMb/
 zhKkMXbr2vkkG3k9W90Z6nqIRQuCq0BpwNyzFWHOcSrQsY7Sb4WJbhwxx
 wzfba2H/uAJPQjQmPxYXuv+gE48S4rORLsuOsLYmMtqWVXAByWXF5Kd4j
 Lk7NdLNiYrPYMMiUi42G2HGG08sZnod9fvRZLKucX/BC4ymtMoL9er/a2
 /PP0RXtrv1CDF5GXSsN7b0JtExUCNDCwCb123vTdFLnTWO2Mb65cuZ3Kh A==;
X-CSE-ConnectionGUID: b0PWy//7QDaV5DoSXSDqFA==
X-CSE-MsgGUID: BJP4wvEnQueyctUPifaHtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59626532"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59626532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 00:23:17 -0700
X-CSE-ConnectionGUID: qrqBrIMfQpKSqRXvllwTYg==
X-CSE-MsgGUID: cl7kY6HTRo62PpGBGlQ/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,250,1751266800"; d="scan'208";a="173394476"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.82])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 00:23:15 -0700
Date: Tue, 9 Sep 2025 09:23:12 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: stop using l3 enabled PAT index
Message-ID: <obup452b5kpktfxhgadbzrcviy3mtlq6tpttzluz2ztmnkurfn@5o6xnpf7iiml>
References: <20250908182045.66769-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250908182045.66769-2-matthew.auld@intel.com>
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

On Mon, Sep 08, 2025 at 07:20:46PM +0100, Matthew Auld wrote:
> When populating the fb using an l3 compression enabled PAT index some or
> all of the data may end up cached. However the HW looks to only perform
> the compression step in this case upon evicting those entries, when also
> trying to write them back to VRAM. This seems to be the cause of this
> test randomly failing on BMG with the CCS state appearing to sometimes
> be zeroed even after doing a compression enabled copy. From
> experimentation adding a sleep before the surface copy cures the
> failure, which fits since this will give plenty of time to enter rc6
> which will indirectly also nuke the l3.  Grabbing a forcewake around the
> sleep brings back the failure which also makes sense since this will
> inhibit the flush and also rules out missing synchronisation hidden by
> the sleep. Using a large fb also cures the issue, which also fits since
> the fb will now be larger than the entire l3, so some data will have to
> be compressed when evicted.
> 
> To fix this don't use an l3 enabled PAT index prior to taking a snapshot
> of the raw CCS state. Probably this also means the test is maybe too
> much looking at implementation details, by assuming that zeroed CCS
> state must also imply that there is no compression, even if compression
> is merely delayed until the data is evicted.

Display is reading directly from vram, so IIUC at moment of scanout
to properly decompress fb it should have an access to flushed surface
and its CCS data, am I right? Blit to WT surface with delayed flush of
CCS data creates such race - WT surface is flushed, but CCS is not.
What causes access_flat_ccs_surface() called before cache flush is a
problem and there's no problem with scanout? For me access (regardless
surf-copy or scanout) looks similar, only timing may vary.

I don't understand why WT in this case causes delayed CCS flush,
where UC_COMP is not. Does UC_COMP applies to CCS data as well?

--
Zbigniew

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5941
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5376
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/intel/kms_ccs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index cb0c80f03..ab081aa75 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -812,7 +812,7 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
>  		fb = get_fb(data, modifier, r, g, b, width, height,
>  			    data->format);
>  
> -		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_wt(fb->fd));
> +		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_uc_comp(fb->fd));
>  		access_flat_ccs_surface(fb, true);
>  		return fb;
>  
> -- 
> 2.51.0
> 
