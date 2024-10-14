Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1776FD16279
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 14:47:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB9210E190;
	Mon, 14 Oct 2024 14:47:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmeW+svH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE0710E190
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 14:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728917234; x=1760453234;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=W80WUhc3pDVQANjeQiZI8CrnfBiY0RcusiRUMkf+R3o=;
 b=TmeW+svHemQc3cpSeA3aziUdAZYfiungMvw+EWtfro1Y3C92CBh+rycb
 FlXhCctbXGM869GwnA5Gtm52gUPN5aUILD6zUTIiN7usbfAdtFKKuc73+
 0dzxGcdbapebi9TbOCKLCNpryuyvLrHhEatg3xrTxDPhBlpPeCAcMJL2z
 uD3q/+yDed73bx+x3hgZ39K/N0Geha/tWjAHOVa2I3rBFBIuF1xtQSZWK
 NyM9bbmgjHVhpvEu9McUYAG3eC5hnd9TjUhMrax/U9MKBSLAm98qV7fcl
 KkbVCjeAjyUcIacdfgU3G5MZFjTMLBAkKPypPzFEDwRG8vkijGsC/p2eY w==;
X-CSE-ConnectionGUID: fyGF/kbNRkif60WkB9AF2Q==
X-CSE-MsgGUID: VkUExpBGRla8fX/w4/HJQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38822673"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="38822673"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:47:13 -0700
X-CSE-ConnectionGUID: RbM5sTXvTWCo4SGlaqmFEw==
X-CSE-MsgGUID: 36i03lP5SLOyCJPrm68TJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="108329641"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 07:47:13 -0700
Date: Mon, 14 Oct 2024 16:47:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t] i915/drm_fdinfo: Quiesce GPU prior to running some
 tests
Message-ID: <20241014144710.cxz27k2zjczsba74@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
 <85ploi6qkc.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85ploi6qkc.wl-ashutosh.dixit@intel.com>
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

Hi Dixit,,
On 2024-10-02 at 16:19:31 -0700, Dixit, Ashutosh wrote:
> On Wed, 02 Oct 2024 14:20:49 -0700, Umesh Nerlige Ramappa wrote:
> >
> > Sometimes render is still running a remnant of a prior workload when we
> > expect it to be idle. This throws some tests off. Ensure that these
> > tests wait for a quiescent state prior to checking if render is idle.
> >
> > Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12179
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Not related to this patch but little bit confusing, since I thought
> drm_fdinfo is driver/vendor agnostic. But this file is i915 specific?
> Should probably be named i915_fdinfo.c? Or if it's in intel/ directory
> should at least probably work for both i195 and xe? Anyway.

We should definitly rename it and/or write driver agnostic one.

Regards,
Kamil

