Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1EFD16270
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 13:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA0B10E2C6;
	Mon, 14 Oct 2024 13:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fa3YYNzN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB3C10E2C6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 13:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728913971; x=1760449971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OOPu7rBlNry8sZjHDrt+zKovnS1V2ixGCmjohgbnTDY=;
 b=fa3YYNzNorGUlicfNwKJ8bvpV/BWN/92MQfP7m18sTftHgr7KSPNrlIW
 UPNOwqsS+k9cDLGSAGFZScaW1gDUo2QtHMTc25x249ym/n8vWGC1LuNaN
 WFZX8VyondBOZzSNq/JM7HbcPieMIMbCtPz1YlTwRQrTPYSxCNxWFu0n4
 Jn6NCPEqZ8sRQf6r8/E8bYLgwPbb8KSk15vX4t0tp/lJx9hP39xtb+kbI
 ciHFynXzCWF3MhEt+Qah0CevcUZFCVJJQt4H+P1N/naMUjs71X1EzUbFV
 KTsVOTJ8OAyXf+vnTGffAWtAUzjEARU3JXnBz/tUw4EcGBnhTpBJ89HBe A==;
X-CSE-ConnectionGUID: RWHCIzgWR1KfkSrahbVkkA==
X-CSE-MsgGUID: CUZHE0zpQtWOL4XnCFxPOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="28353668"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="28353668"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 06:52:51 -0700
X-CSE-ConnectionGUID: xaeIovSVS8i7I8jdErxjSQ==
X-CSE-MsgGUID: Tpwkq4ilQTecRVJBBT63DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="81562905"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 06:52:48 -0700
Date: Mon, 14 Oct 2024 15:52:33 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, Alex Hung <alex.hung@amd.com>
Subject: Re: [PATCH i-g-t v4 1/4] tests/kms_writeback: clear writeback
 properties in teardown path
Message-ID: <20241014135233.eshijf2ovgo54ntg@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Alex Hung <alex.hung@amd.com>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
 <20240925-igt-cwb-v4-1-e516cd1e888e@quicinc.com>
 <6e23b2b9-0e1c-4789-8de3-4a17e2a1e0c6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6e23b2b9-0e1c-4789-8de3-4a17e2a1e0c6@quicinc.com>
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

Hi Abhinav,
On 2024-09-25 at 13:46:32 -0700, Abhinav Kumar wrote:
> 
> 
> On 9/25/2024 1:37 PM, Jessica Zhang wrote:
> > Drop the WRITEBACK_FB_ID property check and refactor detach_crtc() so
> > that it properly clears all writeback-related properties before calling
> > a NULL commit.
> > 
> > The current WRITEBACK_FB_ID check in detach_crtc() will always return 0
> > due to the return value being hardcoded to 0 in the framework [1].
> > Because of this, detach_crtc() will never call the NULL commit to clean
> > up the atomic state.
> > 
> > Since the NULL commit is failing for cases where the WRITEBACK_FB_ID and
> > OUT_FENCE_PTR haven't been cleared by a non-NULL commit, let's
> > explicitly clear these properties before calling the NULL commit.
> > 
> > [1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_atomic_uapi.c#L853
> > 
> > Fixes: 7c3ceb08b ("tests/kms_writeback: Add helper method to detach pipe from output when test finishes")
> > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > ---
> >   tests/kms_writeback.c | 14 +++++---------
> >   1 file changed, 5 insertions(+), 9 deletions(-)
> > 
> 
> 
> This fixes a long pending issue today where kms_writeback does not clear the
> crtc it was using. Hence,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

I will merge this now as in our CI this test skips.

As for rest patches in series please re-work and resend and make sure
CI will be green (as 2/4 and 3/4 touch lib/kms).

Regards,
Kamil

