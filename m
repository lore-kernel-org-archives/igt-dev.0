Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD7CD609B1
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 15:41:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096BB10E809;
	Tue, 16 Dec 2025 15:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S02X04Gh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66CFF10E809
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 15:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765899677; x=1797435677;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fYkoyQoaAYqjpqzPWQBNZ7ObI5qiAj9Khbe1fkPbf84=;
 b=S02X04GhrERuxAhLAWbv8TD/p/aNvPSCLUCO0ztJl+4sx0pgFQfbsHNj
 3nQ09sIQGd2A0TUjx2aLTc6fmt38eS8cKCYjjXsuIkeC+bcXjqLc7zE1n
 hxN4roXK/PoPctfoSyEs1hy2Y85dN0d22g3fo8IZtx3/Cps3pw4+zmvgF
 vDpwO+uha4TgVm1my9gaTwgMwYP6efujgk/qAWS/RC0mD+xHJ39IpNSBH
 U6imLroFb0hvlVk+4kd4AySeg8TJVUCVpFkdACPJPAgGt2woyb3eghUNw
 rp9gTo09NaYq4/3FovglAzZlxP/hyoulK2dYS9nIot2dOx6IS+kEuKM1O w==;
X-CSE-ConnectionGUID: el236HrFQ9Oi6cc65wu2zQ==
X-CSE-MsgGUID: pOUc0WyDQ6ueLWEsvyJNdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="79188810"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="79188810"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 07:41:17 -0800
X-CSE-ConnectionGUID: lNyZ8fySSTuAAOfJKBvg1A==
X-CSE-MsgGUID: Zsa/7Cm2TRSYQP0wdoPjFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="202461657"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 07:41:16 -0800
Date: Tue, 16 Dec 2025 16:40:59 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] Various fixes for prime_udl test
Message-ID: <20251216154059.mtewdcrz5imazfdh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <8e1ad796-fbb4-4a66-968c-d1acac4609a1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8e1ad796-fbb4-4a66-968c-d1acac4609a1@intel.com>
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
On 2025-12-16 at 09:03:11 +0530, Karthik B S wrote:
> Hi Kamil,
> 
> On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> > Refactor this test into proper opening fixup, then tests and
> > last closing fixup. Also fix few error checks and make sure
> > opened device is handled by i915 driver as there are now also
> > one handled by Xe.
> > 
> > Cc: Karthik B S <karthik.b.s@intel.com>
> > Cc: Swati Sharma <swati2.sharma@intel.com>
> 
> The series LGTM overall, but one open I've is if this test should be moved
> to intel folder rather than the generic tests folder?

Yes, you are right, before that I would like to add proper * TEST:
and other descriptions and I will test it in trybot.
Imho proper name would be tests/intel/i915_prime_udl.c unless
this will run also on Xe? Btw is this test covered by some other
KMS one?

Regards,
Kamil

> 
> Regards,
> Karthik.B.S
> > 
> > Kamil Konieczny (4):
> >    tests/prime_udl: Fix opening
> >    tests/prime_udl: Create subtests
> >    tests/prime_udl: Fix error handling
> >    tests/prime_udl: Fix i915 device opening
> > 
> >   tests/prime_udl.c | 38 ++++++++++++++++++++++++--------------
> >   1 file changed, 24 insertions(+), 14 deletions(-)
> > 
