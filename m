Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C6E81BD2
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:39:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 392C310E110;
	Wed, 11 Feb 2026 09:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cepAQWwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8A610E35F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770802770; x=1802338770;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=l6Y5a1Fr5MBTybVCaeLtZKX5tZ9LQZ9Ylgb0Rzh3bTM=;
 b=cepAQWweg0/capjusAuFSQCgBTEKWWy4KHRZCfX+LiGqMFAOXvDWsm11
 dG3Ygk+eN8KHlYazzt9+02E457wvwuqdT9hxWcWZ31aqVKzE/PWH2MKvq
 CqIrQplE97Rfnrt4GT8Gp3DSMIGQEmfpNuVNBK5RN6Dh6HoyWLn2p3wOU
 VpAp6HYY7IV4AM2+JKnCmgkkxITWcM8l7S6cJafzI8hewDKoz2sIATiBN
 6BtxcEzgx4MquVBZQSHFL1cj33QkTNSPDLfoVpI0VBiuNwz40jm70atok
 6Ay6OUtC6UYq8oJ7kGdDoawRgtUq3WHHC8GZM/9z7bBw36bFCMEyyMC1m Q==;
X-CSE-ConnectionGUID: vsgjA8YqQ4aqUnl/X0IYtA==
X-CSE-MsgGUID: RBllcNhxSuWkxkQoruVaVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75572120"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="75572120"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:39:28 -0800
X-CSE-ConnectionGUID: nHKBil6oTAyZTlEr5hB3RA==
X-CSE-MsgGUID: lZpGx5SmTfmMuy+mzk8+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216705948"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:39:27 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/5] tests/kms: Introduce more local 'display'
 variables
In-Reply-To: <20260210161016.29459-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260210161016.29459-1-ville.syrjala@linux.intel.com>
 <20260210161016.29459-3-ville.syrjala@linux.intel.com>
Date: Wed, 11 Feb 2026 11:39:24 +0200
Message-ID: <36f04c0fb1a94428a8503e52444c1e3dd59422b4@intel.com>
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
> Add some more local 'display' variables for the purpose
> of passing them to igt_crtc_for_pipe().
>
> Having a bit more common structure in the code will help
> subsequent cocci cleanups around igt_crtc_for_pipe() usage.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

--=20
Jani Nikula, Intel
