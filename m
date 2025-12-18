Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD137D6ACF5
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 13:19:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7504A10E282;
	Thu, 18 Dec 2025 13:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIH6nWDq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A12210E282
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 13:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766063947; x=1797599947;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mS9GMaoEM2YpzKsgNQ3HcPkzPTB9TSVxMlrNcgoh/z8=;
 b=bIH6nWDqpGkhlIdkHayx33LBQBupNR0ViucJbPEiYh9fY1PcKr/i1nPC
 Ueio85RCckJDMQyrL6yImU6EDMiNMGxifaIVP1wqNx1xQww7QmHgfhHUs
 8cV67FzZ/KS9d8PnL0vBFTxtU0dO9I6MilTuKlNF9u3Y1dGRzmEhIDXqO
 ENuwMnlUMatVgcITZ4k5DzIhlEKMxs+2ffJH/+KbKb93JoZuorpxAa3aI
 mae1+m83Jb1AJdI9a0xCr9o3MoLY3yXxXfYMaggTWpKomxGl2ppbsYJD+
 fKLVt7gs8Lden6sexvGZyKroQriVy3xBMeaGrtx6WPP7d3JtnDE8cQoIN g==;
X-CSE-ConnectionGUID: QXp8TYgNQcysvPrJJD4XXQ==
X-CSE-MsgGUID: nAo9roGGSDeNyL42SpMIPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78331486"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78331486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 05:19:07 -0800
X-CSE-ConnectionGUID: exyVzZ8KR7St/Y6tAA8M5w==
X-CSE-MsgGUID: 1wOFsZ2DR3GqF0cjRC4kyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="229640768"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 05:19:05 -0800
Date: Thu, 18 Dec 2025 14:19:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, sameer.lattannavar@intel.com
Subject: Re: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Enable
 additional Chamelium tests
Message-ID: <20251218131903.msckcor4btbsrjlm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, sameer.lattannavar@intel.com
References: <20251216091433.1245664-1-mohammed.bilal@intel.com>
 <20251216173653.knmo2oyysxzu2ohk@kamilkon-DESK.igk.intel.com>
 <d3489b40-82a8-465d-ac58-1b8a4f22106c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3489b40-82a8-465d-ac58-1b8a4f22106c@intel.com>
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

Hi Karthik,
On 2025-12-18 at 17:00:41 +0530, Karthik B S wrote:
> Hi Kamil,
> 
> On 12/16/2025 11:06 PM, Kamil Konieczny wrote:
> > Hi Mohammed,
> > On 2025-12-16 at 14:44:33 +0530, Mohammed Bilal wrote:
> > 
> > please simplify subject, just write:
> > 
> > [PATCH i-g-t] intel-ci: Enable additional Chamelium tests
> > 
> > > Enable additional Chamelium tests, including hibernate-related
> > > subtests and random plane comparison tests.
> > > 
> > > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> > > ---
> > >   tests/intel-ci/chamelium-only.testlist | 7 +++++++
> > >   1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> > > index 99d2f2409..50cba517a 100644
> > > --- a/tests/intel-ci/chamelium-only.testlist
> > > +++ b/tests/intel-ci/chamelium-only.testlist
> > > @@ -67,3 +67,10 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> > >   igt@kms_chamelium_hpd@vga-hpd-without-ddc
> > >   igt@kms_chamelium_sharpness_filter@filter-basic
> > >   igt@kms_tiled_display@basic-test-pattern-with-chamelium
> > > +igt@kms_chamelium_edid@dp-edid-change-during-hibernate
> > > +igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
> > > +igt@kms_chamelium_frames@hdmi-cmp-planes-random
> > > +igt@kms_chamelium_frames@hdmi-crc-planes-random
> > > +igt@kms_chamelium_hpd@common-hpd-after-hibernate
> > > +igt@kms_chamelium_hpd@dp-hpd-after-hibernate
> > > +igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
> > Instead of adding it at end, please keep this list sorted
> > alphabetically.
> 
> IMHO, better to have hibernate tests at the end of the list(at least
> initially) so that even if any issues are seen on these it doesn't affect
> the other tests. Would this be fine?

Yes, imho it would be good to have  a comment for that, like:

#
# Place hibernate tests at end
#

Regards,
Kamil

> 
> Thanks and Regards,
> Karthik.B.S
> > 
> > Regards,
> > Kamil
> > 
> > > -- 
> > > 2.48.1
> > > 
