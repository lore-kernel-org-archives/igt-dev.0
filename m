Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A898BEB48EE
	for <igt-dev@archiver.kernel.org>; Thu, 12 Feb 2026 09:42:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4239510E70A;
	Thu, 12 Feb 2026 09:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUpgX4QP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0210E70A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Feb 2026 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770889367; x=1802425367;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=szSQ4MH+R7rmOMV78fkqoCT9WA1P/PwnHAPgZWG/oRU=;
 b=YUpgX4QPtNbXbkiKdMC84HMES7u9biF9EI4tuq9sDA14VpxKJ89A+aKc
 wKgnHUNGzYnx3m6Nu/KGxNRVmMgjmy06x4+cN39p7rE4zwAMO+SAEA+Ef
 tTkasbzJbPqBBa7TpIz8j9N7qJiEqSeQRjNFL85AM+tXRcKOSr+cezaqO
 6poJxyVyBSLLuWdO5hGzrKK3EaqowXYWiSa/kMQmXtokjET2L+h3BhqDt
 V1pObYkaWv2y339i36Yq2huH/aCRRzAMIhNuDwypNsV7etA+72lOasyZY
 iGZ53z7YVDnwYqrq/WmUW6CdU32+XCcUDj3+h3u1PmN6MGZS/xyueW01Z A==;
X-CSE-ConnectionGUID: UDSJHcvKSK2FLoXakT+c/A==
X-CSE-MsgGUID: 5U+99gIITb6kwdhZrH/hJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72241644"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="72241644"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:42:09 -0800
X-CSE-ConnectionGUID: JFzUt3xcRJ2C5RweiR5UtQ==
X-CSE-MsgGUID: JBkgLxuMQGKBEdHW0Idj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; d="scan'208";a="211379448"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.114])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2026 01:42:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 00/17] tests/kms: Use igt_crtc_t instead of enum pipe
In-Reply-To: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260211163404.2018-1-ville.syrjala@linux.intel.com>
Date: Thu, 12 Feb 2026 11:42:00 +0200
Message-ID: <aab4c580c0a468ced6b518482c25c27d41051d84@intel.com>
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

On Wed, 11 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert a bunch of tests to use 'igt_crtc_t' instead of
> 'enum pipe'.
>
> Afterwards there are still quite a few unconverted tests
> left that will need stringer cocci magic or manual conversion...

Read through it all, it's mostly straightforward and mechanic, but I'm
also trusting the compiler here quite a bit.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I also realize I think there now remains igt_require_pipe(crtc->pipe)
checks on crtc that originate from for_each_crtc() which will always be
valid. More future cleanup, but there's no functional impact.

BR,
Jani.


--=20
Jani Nikula, Intel
