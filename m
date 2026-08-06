Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00EF9C56207
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 15:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A4AF10F211;
	Thu,  6 Aug 2026 15:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzJrZHmE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FB910F214
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 15:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786028538; x=1817564538;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ZwRdehJV6vyDbTwYL+ipLITNYoK36sy647UQkR0GmaA=;
 b=JzJrZHmE9e9x2/bcICgvNrAVOx9EEimKA9doXtMnRp+Ot3DUDAci6uUO
 uFK1yzEEjtveovqESyDSbMmMXfSBCWoiTKUKM17De+n6lL3PiZuzrykmy
 OmV8YrGpNFGR+x38CaSEskL27+GIV1u7KEwk0mu9MT4CJvSTCIOxtrZJQ
 mNONixZtU6QJoztvUWLvXcYcZjgmmaiyxyY3AYcUO/vldz64ZJ4a3wuu5
 9NdiarhWSy2ATczyVk85HKQQ+ueS2Szs3asU75WfosFYf72IOjf90mTcF
 s6tyAGNMF3MG4TXgO4wI47WPjip9vjfAcUgvO6h8mMZVTfpALxxM08Kkm w==;
X-CSE-ConnectionGUID: 0rKmGMNESe+EHNFaM2xqBQ==
X-CSE-MsgGUID: sZvZECW9St6cSrQhWUkCCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="96976340"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="96976340"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 08:02:18 -0700
X-CSE-ConnectionGUID: ATWZyvDGQfiXKABtEq1keg==
X-CSE-MsgGUID: DduFZiMWR6iPg61ccrHRDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="265973927"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.228])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 08:02:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 6/6] tests/kms_chamelium_color_pipeline: Add
 FIXED_MATRIX colorop tests
In-Reply-To: <20260806120345.19406-7-swati2.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260806120345.19406-1-swati2.sharma@intel.com>
 <20260806120345.19406-7-swati2.sharma@intel.com>
Date: Thu, 06 Aug 2026 18:02:13 +0300
Message-ID: <7c65906a371fc98bb38597ef0ee9e2d7a73e9e9c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 06 Aug 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
> +static void
> +test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
> +				 const color_t *fb_colors,
> +				 kms_colorop_t *colorops[],
> +				 uint32_t input_format,
> +				 enum igt_color_encoding encoding,
> +				 enum igt_color_range range,
> +				 int port_idx)
> +{
> +	int n_planes = crtc->n_planes;
> +	igt_output_t *output = data->output;
> +	igt_plane_t *plane;
> +
> +	for (int plane_id = 0; plane_id < n_planes; plane_id++) {
> +		plane = igt_output_get_plane(output, plane_id);
> +
> +		if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(crtc->pipe), plane_id)

Please use igt_crtc_name().


-- 
Jani Nikula, Intel
