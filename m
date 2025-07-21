Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A34C83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 10:32:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1544910E4D1;
	Mon, 21 Jul 2025 10:32:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J0e0ZPqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8ACD10E4D0
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753093949; x=1784629949;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=F5lwxY8BqD5l0OjFpH3yjDk1WmlzVXp6vgKSjDx0JXQ=;
 b=J0e0ZPqfxn7SCHFvq06cOkV/q5tVz4Z3yeda/vWw3qED3FYyAMn5ExWa
 wvgqdgkw6No9p7/XXk1yFma0qDzU8KNJD8l41rG+kkHFtD9iO8Sm+ajtu
 u+pMo3mUZ8wbRXXTItSV2VtysFRbBKe349DUCBsoyK6KDlGYJofBw9o2c
 VmwaGLU4BaQKOcqmhT9chVFRLPOVcJp0hIJer0WPKfbQFG8i0dLnefsym
 LwBYaDu3ZO59USZ6q2wKeKJXbmssjsSXtQ56Zfkr0Rqu8P226NJBkVsHj
 6VY0/7Xd8WWUApw5Sk/tZ9owxLUjxbn1LW7SnH/p7wcZ6MuGYQIO5IhXZ Q==;
X-CSE-ConnectionGUID: i/K+R+1lSmOWD1bGRvLcnw==
X-CSE-MsgGUID: GsphAeLKQ9iHZ3ol+ctD3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="77843821"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="77843821"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2025 03:32:29 -0700
X-CSE-ConnectionGUID: nVeGifEeTUWDa87drPmMFw==
X-CSE-MsgGUID: QH+hRsOzSUaP87fg3EhHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="158863509"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 03:32:27 -0700
Date: Mon, 21 Jul 2025 12:32:24 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.blocklist: block unsupported test
Message-ID: <20250721103224.ociz2gbhw73v7p3w@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org,
 Karthik B S <karthik.b.s@intel.com>
References: <20250721051353.934493-1-kunal1.joshi@intel.com>
 <3c63e271-bb4f-49e2-8704-d786862b8519@intel.com>
 <8e4ba609-70a8-4d22-9a0d-7c6e37c22603@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e4ba609-70a8-4d22-9a0d-7c6e37c22603@intel.com>
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

Hi Sharma,,
On 2025-07-21 at 13:19:09 +0530, Sharma, Swati2 wrote:
> Hi Kunal,
> 
> Sorry missed one comment. Please use either tests/intel-ci: or intel-ci:
> in subject, no need to specify blocklist name.
> 
> ++ Kamil

Yes it could be shorter, also this should be blocked in i915?

Better subject:

[PATCH i-g-t] intel-ci: Block unsupported test on chamelium v1

Regards,
Kamil

> 
> On 21-07-2025 12:28 pm, Sharma, Swati2 wrote:
> > Hi Kunal,
> > 
> > 
> > On 21-07-2025 10:43 am, Kunal Joshi wrote:
> > > Chamelium V1 HDMI reciever can support max 4k@30
> > > Test forces EDID with 4k@60 which isn't supported
> > > Blocklist test untill we have newer V3 boards
> > > 
> > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > > ---
> > >   tests/intel-ci/xe.blocklist.txt | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/tests/intel-ci/xe.blocklist.txt
> > > b/tests/intel-ci/xe.blocklist.txt
> > > index a21c8a3d3..050c89970 100644
> > > --- a/tests/intel-ci/xe.blocklist.txt
> > > +++ b/tests/intel-ci/xe.blocklist.txt
> > > @@ -115,3 +115,8 @@ igt@xe_evict@.*-multi-vm-cm.*
> > >   igt@xe_evict@.*-threads-.*
> > >   # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
> > > ##################################################################
> > > +# Chamelium V1 HDMI reciever can support max 4k@30
> > > +# Test forces EDID with 4k@60 which isn't supported
> > > +# Blocklist test untill we have newer V3 boards
> > > +##################################################################
> > > +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> > Prefix with KMS
> > Fix typo : s/untill/until
> > Re-phrase
> > /*
> >  * Chamelium V1 HDMI receiver supports a maximum resolution of 4K @ 30Hz.
> >  * This test enforces an EDID with 4K @ 60Hz, which exceeds the
> > capabilities
> >  * of V1 hardware and results in failures.
> >  * Temporarily blocklist this test until V3 Chamelium boards (which
> > support 4K @ 60Hz)
> >  * are available in the test environment.
> >  */
> > 
> > 
> 
