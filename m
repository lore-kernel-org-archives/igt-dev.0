Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF66CE9B263
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 13:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C6810E5A3;
	Tue, 24 Feb 2026 13:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODx1wuH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F9A10E5A3
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771941404; x=1803477404;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=STrPvFZ6KLat9RWahCYebkHyY2Rla1kespq2gg/3cJ4=;
 b=ODx1wuH7EEjOD67cZbsBSyOGi2Bzd9VjAZHp+PLW4Naf1cVFUO3vjyFA
 tpubqL9w/4YLHFuYHLF4l6QjFMHt3l7+fpUBsZS6DhGvIjL6wjYZ4Xc2e
 onl6368Ww8P0ptkdmdLGBIUbWzvjWTpj6lN1JVX6vjsHUyLBN8ALY55Dj
 uyXdpRwGF+SM7ji3Og7ubOMs6MbSaiIkVh14GjDyO+D6fVrQPnQBsVjOI
 RFW3322Ob0AN2IyfJPapRq0d2xlQjo55LTnjf1DesrwhhBKDUVMvTB+LY
 /ZFD/cfcRcng5g9xAlySNLPA7P/Crtq7uspH1zZSqFy55zgX7BrxosDQs Q==;
X-CSE-ConnectionGUID: qCm8zruIR0+JuuZznhsiag==
X-CSE-MsgGUID: Rim5XKgZQGGJYdUScC0g9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84411719"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="84411719"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:56:44 -0800
X-CSE-ConnectionGUID: QLoFFaWlRfCaKACgngXIYw==
X-CSE-MsgGUID: EU3tnUx2QcOrUC59ZJbHZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="246482745"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 05:56:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 20/23] tests/kms: Use igt_crtc_t instead of
 enum pipe, part 1
In-Reply-To: <20260221032003.30936-21-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-21-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 15:56:39 +0200
Message-ID: <5f935ff219a0804b9214aafc48ea020b56c54967@intel.com>
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
> of enum pipe. These specific tests already track the
> crtc alongside the pipe in their data structure. Remove
> the redundant pipe infromation and just rely on the crtc.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
