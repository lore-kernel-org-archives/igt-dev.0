Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC1E7F44845
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 11:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A012410E21F;
	Fri, 10 Apr 2026 11:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRdd4Dgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A108110E21F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 11:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775822206; x=1807358206;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=A9W7jYFxUk60NTJ9ZR7mrYXaBtAhZILPhu+h+k3cDYs=;
 b=mRdd4DgsuphCtX+WBQVyZlc2SXN8GDeSFqK+wtkuY1PAL+zUTeGEoLsq
 jeL9XP1XLwQnsNr0KqfJQdofhuNY6EKEA+Vi3vHlb68AUlEdZ1NrGXhDs
 UXf6bYxNa+j69zCpTHR8hHRH+88h7FeNh7gmg2eB5RGslHsZ0FVmlqSkU
 HLjelzanXwinctjsDMXRht7D6tgLSKU4q2sktVU7iJ+BVNaVNQF0M1Vfd
 FndImmOEwKghBZhT4I9H6FK30sWUxgTnrXPFy+UAhjJ/SC+9YHBqsFcCT
 q9X4rt5aTvKdYCS6DrT1hDUWkFY5FJAj24CzSmUaFBN4aXHbFQ5ooLpYN g==;
X-CSE-ConnectionGUID: VktueslcSSW09Dj96dAaDw==
X-CSE-MsgGUID: z9FOK4KBS1GC5i4Kl2RIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76857198"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76857198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 04:56:45 -0700
X-CSE-ConnectionGUID: ZOiDJ6ixRHiUa7YL8S+FLg==
X-CSE-MsgGUID: ocpg29UMQqy5erN8kXzBUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="252433166"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 04:56:42 -0700
Date: Fri, 10 Apr 2026 13:56:40 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Harshdeep Dhatt <harshdeepdhatt@gmail.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, rob.clark@oss.qualcomm.com,
 igt-dev@lists.freedesktop.org, lumag@kernel.org,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_kms: Identify writeback connectors in msm
 driver on android
Message-ID: <20260410115640.kgykepdeomc4rgl2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Harshdeep Dhatt <harshdeepdhatt@gmail.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, rob.clark@oss.qualcomm.com,
 igt-dev@lists.freedesktop.org, lumag@kernel.org,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <8e61be678da46c7ec762d9d4c3069ce141d7aea1@intel.com>
 <20260408162505.2131099-1-harshdeepdhatt@gmail.com>
 <910f940a2aa6ba76976e9b8d1eb4c7171c3a1a05@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <910f940a2aa6ba76976e9b8d1eb4c7171c3a1a05@intel.com>
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

Hi Jani,
On 2026-04-08 at 20:21:44 +0300, Jani Nikula wrote:
> On Wed, 08 Apr 2026, Harshdeep Dhatt <harshdeepdhatt@gmail.com> wrote:
> > Thanks for the feedback.
> >
> > Yes, this quirk is specifically for the downstream MSM DRM driver used on
> > Android devices. The upstream MSM driver does not need this, and the intent
> > is not to modify or affect upstream MSM behavior in any way.
> >
> > The goal here is to allow IGT to run on Qualcomm-based Android platforms,
> > which currently expose writeback connectors differently (as VIRTUAL
> > connectors with a custom "FB_ID" property). Without assigning a writeback
> > FB, the driver rejects the atomic commit, causing several IGT tests to fail
> > early.

Why is it different from mainstream Linux?
imho better way would be to bring that changes to upstream MSM driver
or just fork IGT source for your testing purposes.

> >
> > All of the logic in this patch is fully isolated behind detection of the
> > downstream Android MSM driver (`"msm_drm"`). Upstream MSM continues to use
> > the existing code paths unchanged.
> >
> > IGT’s documentation states that it aims to be a universal test suite for
> > DRM/KMS drivers on Linux *and similar platforms*. Supporting the downstream
> > MSM driver helps extend IGT coverage to a widely deployed class of devices
> > without impacting upstream users.
> >
> > If it would be preferable, I can restructure this into a dedicated
> > “msm-android quirk” helper or move the detection/handling into a separate
> > file so that the core paths remain untouched. 
> >
> > This keeps all non-upstream behavior contained in one place, avoids
> > polluting the main code paths, and provides a maintainable structure for
> > any future quirks that may be needed for other platforms. Upstream MSM
> > remains unaffected, and the quirk only activates when running on the
> > downstream Android MSM driver.
> >
> > I’m happy to adjust the approach based on your guidance.
> 
> Cc'd some more folks.
> 
> As a contributor, I'm not very fond of the idea of tiptoeing around code
> in IGT that caters for some downstream vendor kernels. I'm not going to
> go hunting for those sources. Hardly anyone will.
> 
> I'm not an IGT maintainer. I'm not making decisions on what is, and is
> not, acceptable new maintenance burden to take on.
> 
> But the maintainers do have a decision to make. The options are to
> support either 0 or N downstream kernels. If you take one, you can't
> reasonably refuse anything after that. Even if the patch at hand is
> benign, the precedent it sets is emphatically not.
> 
> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel

Added few more KMS devs on Cc
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

Regards,
Kamil
