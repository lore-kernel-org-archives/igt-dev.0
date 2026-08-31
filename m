Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC60C61DD3
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 07:20:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5662D10E167;
	Mon, 31 Aug 2026 07:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpI6iAnZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A4610E62B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 07:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788160765; x=1819696765;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zayGJkrXDKCFtOjfxjA4QXtsA0Jt7+9f1gKE8jAo5gs=;
 b=YpI6iAnZq9T5s6NMzQIqoHDeUrUfe2mEWUiVq9YNxOla2uPvVkdpAPGC
 EYo714HrgmKiWFnaGC7yts4upQ3QTRjwVfqBrRP+L6WEpZ59AwC88Vag0
 QRPc4YbD1E1PSbsME3Sgt8UteSIrnaMA1mCdayiW3e/FEFmghoJ/z7mRW
 fI13zFvl50zDtgrzOAocV56sCi9143Fft4OZrWX7EtDobMwbbG4rvGByP
 RtDb+oW47qvqZfKtregfhnhW1usudgE9ImdPU4wAgTlqcqOVCcCupte+l
 xujKsDgcNfcavp/hxhv+MHrebsDqXSSw91bZ7LjzVHbSv96r4kjUP5XC+ g==;
X-CSE-ConnectionGUID: ptcCjZHHRHeyvRhTUYTmxw==
X-CSE-MsgGUID: b6fffhG1RmWWC4jCtiTsWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92370784"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="92370784"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:19:25 -0700
X-CSE-ConnectionGUID: Zt3OiwKVTFOgTbhmOPtJhQ==
X-CSE-MsgGUID: WFpq9lMuTASHUPon/svk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="268754630"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.22])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 00:19:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t, v4 7/7] tests/kms_chamelium_color_pipeline: Add
 FIXED_MATRIX colorop tests
In-Reply-To: <20260826183932.351933-8-swati2.sharma@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260826183932.351933-1-swati2.sharma@intel.com>
 <20260826183932.351933-8-swati2.sharma@intel.com>
Date: Mon, 31 Aug 2026 10:19:21 +0300
Message-ID: <dc610f3981dc5b4416b77d0d56873389d2ee898a@intel.com>
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

On Thu, 27 Aug 2026, Swati Sharma <swati2.sharma@intel.com> wrote:
> @@ -345,6 +382,191 @@ run_tests_for_plane(data_t *data)
>  	}
>  }
>  
> +static void
> +test_plane_fixed_matrix_colorops(data_t *data, igt_crtc_t *crtc,
> +				 const color_t *fb_colors,
> +				 kms_colorop_t *colorops[],
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

Please use igt_crtc_name() instead of kmstest_pipe_name(crtc->pipe).

> +			_test_plane_colorops(data, plane, fb_colors,
> +					     NULL, colorops,
> +					     data->ports[port_idx],
> +					     DRM_FORMAT_YUYV,
> +					     encoding, range);
> +	}
> +}

-- 
Jani Nikula, Intel
