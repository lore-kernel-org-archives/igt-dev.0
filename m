Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6146CD3F098
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 16:59:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158F410E739;
	Wed, 28 Jan 2026 16:59:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aj6f4E2S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BA410E739
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769619581; x=1801155581;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NjkdQEqfJTFZP+Rc9NB/g8i7TwSQvaEsolr3XEA5NKc=;
 b=aj6f4E2SPGxRxHVg9X3CepvIa+9B4rG5grIxVy6xMJOEqruG6GCRDePR
 4zt3Kas7S9qtImAmxeKgc55FHjsUVc25tsF/tCSSqZkVIEEjkyQFWmjXV
 QkVj3ouluMCfB1VvTiYq4R/Oqi+m3LgtWMGAhMo00NEL9eVA3zVekuuDn
 IGhQc4T51+6P9WGwJo4I7jtgGVdsqMsT8k7YXEL93U2nvp83FVwcHAXUd
 1r0ztwPzGzOD3YSoLSQqIoptu67ytaQmQzE/yysQ8LbuMmkQ4T+uXP4H/
 60qDfLwVf0rojRuEwt6x35fIM6uk1bb95zoOtMzW5PHIAu/PNluA6bCyO w==;
X-CSE-ConnectionGUID: VsAs+2dcRei4cie9B4S2dg==
X-CSE-MsgGUID: u7TdWbN6QsWcCEbJ/uL1AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70812886"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="70812886"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:59:40 -0800
X-CSE-ConnectionGUID: tl9brtNJRMyHlu5dlU5QAQ==
X-CSE-MsgGUID: hNGkwYsATN+qzn8Lg5EPVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208555508"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 08:59:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 0/8] lib/igt_kms: pipe vs CRTC index cleanups
In-Reply-To: <aXo-3HMDhUlUoCcR@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1769514879.git.jani.nikula@intel.com>
 <aXon4Dk6azuIFd4w@intel.com>
 <d6530c2859f5e77f84be1e69aa48625a036a0c76@intel.com>
 <aXo-3HMDhUlUoCcR@intel.com>
Date: Wed, 28 Jan 2026 18:59:35 +0200
Message-ID: <5939a9a4a24dd14e875951e0d8687c1ec86ca5fe@intel.com>
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

On Wed, 28 Jan 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> Yeah, The next set tries to convert the for_each_pipe*()
> stuff to crtcs. Just doing some (hopefully) final tweaks
> to catch a few more stragglers...

I forget, are you aiming for making it iterate igt_crtc_t instead of
crtc index? If feasible, I think it would make a ton of sense all over
the place.


BR,
Jani.

--=20
Jani Nikula, Intel
