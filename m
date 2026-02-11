Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2162AEB5954
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74E210E359;
	Wed, 11 Feb 2026 09:32:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cg1wTSg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041E310E359
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770802321; x=1802338321;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=vsruIyW5CMEdHBlqr6HlpxTX9Cc6PZAudmmxmhC/1pQ=;
 b=Cg1wTSg5N6cq0bArzAxABZuhEdOhm3GZYmDX4XVaHepiHSPyeloZ7W42
 6uy62oUY0jSi+Z7+YWIezLpFIhN5gby1JcCFPlyTDb52rIGkgMF/SmlaQ
 NDTuOz0tkGhaNu+dEecRco6WINxU91KWLPSVp61FakTP4fpjm+yksqcLv
 cUZKNNRgKmOiH2WLWdi62JtBLL/sr8ob3COwLxNEhnhR0L9XOp4gkw2dA
 HRWvYz/KyR0stKNLrZ7cGsepZY2i4O0YDA/WzseHyEoGKaqpo0CNSfAPg
 8+Wr6Uu+pEqCY6dyDcyRl0mHCDiiddSVvGP8G+zdY1K+ZBeA8RKNru4MQ w==;
X-CSE-ConnectionGUID: huLVw0sER1eypPwm9ExX1w==
X-CSE-MsgGUID: K+9cAc9LQuyZp5T7tHhbqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75571375"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75571375"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:32:01 -0800
X-CSE-ConnectionGUID: 32zdM8IGSR2vS59TqkGjKA==
X-CSE-MsgGUID: n+xoDJ4wQ6G3ZzwzioHN+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212228165"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:32:00 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/5] tests/kms: Clean up display varaibles used
 for igt_crtc_for_pipe()
In-Reply-To: <20260210161016.29459-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
 <20260210161016.29459-2-ville.syrjala@linux.intel.com>
Date: Wed, 11 Feb 2026 11:31:56 +0200
Message-ID: <02e8dfc3181278e077db2ebd253e8a5b11256722@intel.com>
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

On Tue, 10 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently the 'display' parameter passed to igt_crtc_for_pipe()
> calls is a bit inconsistent. Reuse the local 'display' variable
> in case have one, and otherwise try to grab it from out typical
> 'data' structure.

*our perhaps?

*variables in the subject.

> Having a bit more common structure in the code will help
> subsequent cocci cleanups around igt_crtc_for_pipe() usage.
>
>  #include "scripts/iterators.cocci"
>
> @find_data@
> type T;
> T DATA;
> identifier DISPLAY;
> @@
> igt_display_require(&DATA.DISPLAY, ...);

Yeah, it's a bit weird that we have ~100 local definitions for data_t. I
did not manually check that each of them has display member
initialized. Instead, I checked a few, and trust this cocci snippet and
the compiler.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


--=20
Jani Nikula, Intel
