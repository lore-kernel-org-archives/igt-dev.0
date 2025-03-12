Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641B5C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 11:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C72A10E6EF;
	Wed, 12 Mar 2025 11:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ChQmqHQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04A610E6EF
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741778935; x=1773314935;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wV3rzE6DP2+VuLIVM3DHLPs66QfT90YDfk98HpYHfKw=;
 b=ChQmqHQJaIqJseRDIIuKw4kg2tWtlU97rsMr4b7aOjiRjfl+31bksfwl
 UYobiKFPgttyu11Gudb4DRmwaDYH2EspSmdg7F5/QkExJRjzHMTv7WGnq
 OlVCZBAUO8c9UHMW7vGcAa/jBCzwGSG4aQHmrJjQ/18w1t2YfpgkrM36J
 6rpCwKhsrXeEpts9Q61fO3z5hdiAfA1KlFLfJkvCW9LPca87KTLEfDhp/
 BVVNbTbAU1aC+Y2cQaq0S0YO/izXT/AMVnLeSpfPFu1G7qlnG1BvLxdRl
 U36aubSOKbK2bMJwa2XVBBs/24ibf7VbrJ+W3uoxhi50ZPdUaZsPvPE7r A==;
X-CSE-ConnectionGUID: N76vuMKgT4K6GVBiOQ3Yuw==
X-CSE-MsgGUID: Ocff4lE/Sein7lYwMDz81w==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53493265"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="53493265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 04:28:54 -0700
X-CSE-ConnectionGUID: ig2yipIXQXW1ToCjdSh/6w==
X-CSE-MsgGUID: ikv+6/TISkOdZcM5PBaJHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125797890"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 12 Mar 2025 04:28:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Mar 2025 13:28:51 +0200
Date: Wed, 12 Mar 2025 13:28:51 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
Subject: Re: [PATCH v2] tests/kms_cursor_crc.: Test async cursor crc
Message-ID: <Z9Fv8w9qmnBS4i7a@intel.com>
References: <20250311043002.127979-1-shekhar.chauhan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311043002.127979-1-shekhar.chauhan@intel.com>
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

On Tue, Mar 11, 2025 at 10:00:02AM +0530, Shekhar Chauhan wrote:
> +	/* get the screen refresh rate, then wait for vblank, and
> +	 * wait for 1/5 of time of screen refresh and change image.
> +	 * change it mid screen to validate that the change happens
> +	 * at the end of the current frame.

The legacy cursor uapi doesn't specify whether the cursor updates
are synchronized to vblank or not. So this is testing for
hardware/driver specific behaviour.

> +	 */
> +	usleep(1.0f / data->refresh / 5.0f * 1e6);
> +
> +	changefunc(data, SECONDIMAGE);
> +	igt_display_commit(&data->display);
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc2);
> +
> +	igt_assert_crc_equal(&crc1, &crc2);
> +
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc2);
> +
> +	/* check next frame will be different as expected*/
> +	igt_assert_f(igt_find_crc_mismatch(&crc1, &crc2, NULL),
> +		     "crc values were not supposing to match!\n");

This could fail due to a false positive. If you really want to test
for CRC inequality I think you'd first have to make sure such an
inequality actually exists.

-- 
Ville Syrjälä
Intel
