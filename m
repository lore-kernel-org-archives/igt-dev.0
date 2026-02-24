Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E87CFE9B265
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:58:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9905010E5A5;
	Tue, 24 Feb 2026 13:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YuOMEZTV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA74710E5A5
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941509; x=1803477509;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=3PXKAAa2hj0X1+9BR2Ghmart0RaUJy56bmoIIy60Qug=;
 b=YuOMEZTV/Hx+W6OlIVnw0OgNYJnat7IXOC2npm9LfXiz40geMWFM2qnS
 2rVmGL5oEmVeSVlimR9ab9TOh7V9bqKvTe4gsa2vynLAw9snSJhYivK0H
 KOMwxHwXoV3jaRcPBc+pU6fcp/7+KiPitD5CDUmsT6DvyzAq6H5BWLa98
 UxWBqkJ0IrgF1yH0B8qrQiuAQ0Wszq6fy2/dilckzQQeuZOjvQIVnpQeV
 8XiagPZj460/EBD9TOotodLb/5ljo4mYP+VQm1vlryQEvQoRhVudZFC0a
 QIkAo/4rLRmbNh4UVbdteSnpboF2XrC2lumYhb8ZS2McIlVMeBqpwGkxk A==;
X-CSE-ConnectionGUID: K9MaPZS1RAu51t2yp24xhw==
X-CSE-MsgGUID: kHid8I93TRGPCskYX9+PNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83277921"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83277921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:58:28 -0800
X-CSE-ConnectionGUID: KrlAnCrvQBWdv8x7Q2St2Q==
X-CSE-MsgGUID: DMBhHF+MS/ev4nHxNMDtfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213716950"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:58:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 21/23] tests/kms: Use igt_crtc_t instead of
 enum pipe, part 2
In-Reply-To: <20260221032003.30936-22-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-22-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:58:24 +0200
Message-ID: <ef590671b41c2d757c742053e98cf474f7c0222c@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert several kms tests to use igt_crtc_t instead
> of enum pipe. These specific tests already track crtcs
> alongside pipes (both in arrays) in their data structure.
> Remove the redundant pipe information and just rely on the
> crtcs.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

--=20
Jani Nikula, Intel
