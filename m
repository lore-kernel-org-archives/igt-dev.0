Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20384E9B269
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 14:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF26510E0AC;
	Tue, 24 Feb 2026 14:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VagGpMOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A698810E0AC
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 14:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771942018; x=1803478018;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=Y27Q36CZehABocxlFk7A5AdLdJHP2oXFq/Kf6Wc1SKs=;
 b=VagGpMOBOwBPo9WFsi2ZibeKbQPfWbI3Qy2m3Z2neWI4XmDMKaQCmlpJ
 qkjivrWglyc8XmdlWLZicBRvM+5sb8Bt+RydsdHKNpta4dGPtPQNj6KzC
 Tkhp/hwzLjJN+iW9icTtktgnxO8wo081su73N2TS7453qlEbqms97X7Fe
 Tmyq5oa2+yJQtVIh3bEEAG7i1wY4OyNrK+CU0OQMid9yj9ALWoSCx2sjf
 7C/sWH8Hv4S0ZDB3yYX0FrgOssKE674hEITMQ3agTaxDRg6aCME1e2JtL
 1NM9h8HysYTynHzi/aONGm09zuquljAi6mMtozuhHxxtNYJOJ8w+x6jeM w==;
X-CSE-ConnectionGUID: n5pP6ak+Sqmi29Y0STTi8w==
X-CSE-MsgGUID: 7jI+uKX6RA6+8Nh55ymVTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="76817215"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="76817215"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:06:58 -0800
X-CSE-ConnectionGUID: o0/ufpIRQxm4DImxzyz1cg==
X-CSE-MsgGUID: UaiauFYXSamIs1wXzq5cKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="213152717"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.20])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:06:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 23/23] tests/kms: Use igt_crtc_t instead of
 enum pipe, part 4
In-Reply-To: <20260221032003.30936-24-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-24-ville.syrjala@linux.intel.com>
Date: Tue, 24 Feb 2026 16:06:54 +0200
Message-ID: <4de5b20c04a4935c81bbae8866a3eadd3af59ece@intel.com>
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
> of enum pipe. This covers the remaining simple
> cases.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
