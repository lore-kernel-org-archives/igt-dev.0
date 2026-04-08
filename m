Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B002510F9964
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 17:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5521110E086;
	Wed,  8 Apr 2026 17:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UI8eaQXz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CEC10E086
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775668911; x=1807204911;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=OeTemqqTBO1l+3fMuAdJpkfi095d1bOCngSSPGWUiAc=;
 b=UI8eaQXzrav3tkIZoNkJG+eJsoEdj+HO5z3clhnmA97EM7KBBcVc1Hcr
 jxieY4n8litIVM7o5xVuIva7bMApRaSb0lY1bTNxOgC/0io6r6ROkKH+k
 gQB/u/+pI63hicR9fNyezKN8vblabhQUXSZ3+dvXPkXn7Y+bdlEZ7LKt5
 3v6E07VycePLX4262YEol+RgdgJtZSAvQUowDfrLe7BZmX6I/iE4ebnbH
 9fqvA3n+7s017fti52289Yv+dRxNGM79WWuwzpJ2cXCZdnV1zsGq/PASI
 ktWANgh1MNEu7eHN3jeMa21BjudmtMsxjpu4rOi0juWKF5qjMImvkdOQO Q==;
X-CSE-ConnectionGUID: Af2a9vFgQX+LuS3WzPQ+7Q==
X-CSE-MsgGUID: NLKSCEzVRkS4UUmy9hVj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="87737114"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="87737114"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:21:50 -0700
X-CSE-ConnectionGUID: Oh/A+gPFSVifh6F0esKuSQ==
X-CSE-MsgGUID: 1HbjovHSTM+hFgxq6G4Zsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="232902133"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 10:21:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Harshdeep Dhatt <harshdeepdhatt@gmail.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: rob.clark@oss.qualcomm.com, igt-dev@lists.freedesktop.org,
 lumag@kernel.org, Harshdeep Dhatt <harshdeepdhatt@gmail.com>, 
Subject: Re: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
In-Reply-To: <20260408162505.2131099-1-harshdeepdhatt@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <8e61be678da46c7ec762d9d4c3069ce141d7aea1@intel.com>
 <20260408162505.2131099-1-harshdeepdhatt@gmail.com>
Date: Wed, 08 Apr 2026 20:21:44 +0300
Message-ID: <910f940a2aa6ba76976e9b8d1eb4c7171c3a1a05@intel.com>
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

On Wed, 08 Apr 2026, Harshdeep Dhatt <harshdeepdhatt@gmail.com> wrote:
> Thanks for the feedback.
>
> Yes, this quirk is specifically for the downstream MSM DRM driver used on
> Android devices. The upstream MSM driver does not need this, and the inte=
nt
> is not to modify or affect upstream MSM behavior in any way.
>
> The goal here is to allow IGT to run on Qualcomm-based Android platforms,
> which currently expose writeback connectors differently (as VIRTUAL
> connectors with a custom "FB_ID" property). Without assigning a writeback
> FB, the driver rejects the atomic commit, causing several IGT tests to fa=
il
> early.
>
> All of the logic in this patch is fully isolated behind detection of the
> downstream Android MSM driver (`"msm_drm"`). Upstream MSM continues to use
> the existing code paths unchanged.
>
> IGT=E2=80=99s documentation states that it aims to be a universal test su=
ite for
> DRM/KMS drivers on Linux *and similar platforms*. Supporting the downstre=
am
> MSM driver helps extend IGT coverage to a widely deployed class of devices
> without impacting upstream users.
>
> If it would be preferable, I can restructure this into a dedicated
> =E2=80=9Cmsm-android quirk=E2=80=9D helper or move the detection/handling=
 into a separate
> file so that the core paths remain untouched.=20
>
> This keeps all non-upstream behavior contained in one place, avoids
> polluting the main code paths, and provides a maintainable structure for
> any future quirks that may be needed for other platforms. Upstream MSM
> remains unaffected, and the quirk only activates when running on the
> downstream Android MSM driver.
>
> I=E2=80=99m happy to adjust the approach based on your guidance.

Cc'd some more folks.

As a contributor, I'm not very fond of the idea of tiptoeing around code
in IGT that caters for some downstream vendor kernels. I'm not going to
go hunting for those sources. Hardly anyone will.

I'm not an IGT maintainer. I'm not making decisions on what is, and is
not, acceptable new maintenance burden to take on.

But the maintainers do have a decision to make. The options are to
support either 0 or N downstream kernels. If you take one, you can't
reasonably refuse anything after that. Even if the patch at hand is
benign, the precedent it sets is emphatically not.


BR,
Jani.


--=20
Jani Nikula, Intel
