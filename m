Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A9E91299
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 09:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E3B10E815;
	Thu,  5 Feb 2026 09:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LbaS3v+p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ABCA10E815
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770282604; x=1801818604;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=9MghnsrvpPtE7xIiD3YTFwnZ0DjQ2as5ShCJqVLb94w=;
 b=LbaS3v+pnCbi/ndZkrs0kxV1wzCRXrf/uNGtXIEKFs8FUL3nobBk1UVx
 7po7oezk7kaRKv/iWF1ey6etesWt4tGp6UL0oz8eisy2uL9SZjmvTRSWn
 oLo/e+TU6FVKxC5vQ2jNyKzqgo+f/giz1bwWhcuTr/5kphkNMHrfdQ8mh
 AQiacGPtgNukKd8Z1Q1kWczvQ0Vir31MOX3pZSbH85lKjq7AjLm/RWV3c
 xJOiQjc5AdD0fC0clzZLwHcdel+QU1jW20twexFySBFMCZRLEroe47dnn
 nSd6uKc9B7gWlMGSfFYQkNUZl8xKVHsl0KJdhvhxuPCgEswCr4YdUlk/U w==;
X-CSE-ConnectionGUID: 0pFRUclJRha4erm8yl1IRg==
X-CSE-MsgGUID: XN7yP1myQi6BNxaSY+9mbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82916882"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="82916882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:10:03 -0800
X-CSE-ConnectionGUID: oaIY+KwwTCOEva3m6R9DBw==
X-CSE-MsgGUID: GhTDjY/TRgK2iCv9M8Wl/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="209732632"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.69])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 01:10:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Xin Wang <x.wang@intel.com>, igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Matt Roper <matthew.d.roper@intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Ravi Kumar V <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH v2 2/3] lib/intel: add fd-based
 intel_gen/intel_graphics_ver via Xe query
In-Reply-To: <20260122071530.1629046-3-x.wang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260122071530.1629046-1-x.wang@intel.com>
 <20260122071530.1629046-3-x.wang@intel.com>
Date: Thu, 05 Feb 2026 11:09:57 +0200
Message-ID: <e766ce6319b2a59447f4397f1abe3f8e3ce80d00@intel.com>
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

On Thu, 22 Jan 2026, Xin Wang <x.wang@intel.com> wrote:
> +/**
> + * intel_gen:
> + * @fd: DRM device file descriptor.
> + *
> + * Attempts to determine the graphics "generation" by querying the Xe driver for
> + * the main GT IP version major. If unavailable (e.g., not an Xe device or no IP
> + * version reported), falls back to retrieving the DRM device ID and mapping it
> + * to a legacy graphics version.
> + *
> + * Return: The graphics generation/major IP version for the device.
> + */
> +unsigned intel_gen(int fd)
> +{
> +	uint16_t devid;
> +	const struct drm_xe_gt* main_gt = xe_get_main_gt(fd);
> +
> +	if (main_gt && main_gt->ip_ver_major)
> +		return main_gt->ip_ver_major;
> +
> +	devid = intel_get_drm_devid(fd);
> +	return intel_gen_legacy(devid);
> +}

Why stick with the "gen" naming when the kernel side has completely
moved to "ver" naming?

Also, you won't get build failures if any remaining (or new one, racing
to get merged) call sites pass in devid to this.

BR,
Jani.

-- 
Jani Nikula, Intel
