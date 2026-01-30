Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2B4D49C9B
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3752310E996;
	Fri, 30 Jan 2026 10:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="muvsftEY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E57910E996
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769769861; x=1801305861;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RGkdl4lphF/POSxfhWfJCwkxmi7Mfgan0xL3cRFTLH8=;
 b=muvsftEY1/t8bwj1UusOK2gYV+5HbzI+5fi3IHC/Ph42RAVf7IKMXy/X
 6Y0+iFgucdGOy+qWx1XzC6rxiiQCxnvelGv+Qs2KT+si7TzvXYb3i8d2J
 66Raw5YpcSZ0MNVrs8W838sRBW+OPqHvat5NDtOM5DNK5CnrCJc1izqXz
 F1fnul8tBxRDexXRiW9WEZcVlGkIwFwLBx+rPOkuUptyeudQQT9mGynbz
 r1+TCkanwutvis35L55RSpWyZSRHFJWoK7iTG8QscRpHwOLkEG+3VnqEf
 28CEqZngv/9SeQPiKadQv+cu6P/cISjnucHzx7v1wP21GBxeFIgkLSHx4 w==;
X-CSE-ConnectionGUID: 3n1ZPkEnRGe7jUvYkDD+jg==
X-CSE-MsgGUID: zK6ndnKNQ1mdyON5aA1L1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96482841"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="96482841"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:44:20 -0800
X-CSE-ConnectionGUID: NL59CY+3SVmllZJv4Kj+/g==
X-CSE-MsgGUID: Y6E1D4uKQKy6Dp/ai4oE9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="212903308"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 02:44:19 -0800
Date: Fri, 30 Jan 2026 11:44:16 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel-ci: Update NVL display blocklist
Message-ID: <20260130104416.uojnj6bruwllczyt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260129114440.155214-1-swati2.sharma@intel.com>
 <d9703fc1-5c55-410d-9001-e57d386db8f1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d9703fc1-5c55-410d-9001-e57d386db8f1@intel.com>
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
On 2026-01-29 at 18:02:39 +0530, Karthik B S wrote:
> Hi Swati,
> 
> Nit: Good to have a unique commit subject line so that we don't have
> multiple commits with duplicate subject line.

Good point, what about:

[PATCH i-g-t] intel-ci: Block deep-pkgc in NVL display

or

[PATCH i-g-t] intel-ci: Block kms_pm_rpm@deep-pkgc in NVL display

Regards,
Kamil

> 
> Can be updated during merge.
> 
> With this updated,
> 
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> 
> On 1/29/2026 5:14 PM, Swati Sharma wrote:
> > Add deep-pkgc test to xe.nvl.display blocklist as valid skip.
> > 
> > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > ---
> >   tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> > index 41d9eed3e..749514129 100644
> > --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> > +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> > @@ -130,3 +130,7 @@ igt@kms_psr2_sf@fbc-(psr2|pr)-.*
> >   ##############################################################################
> >   igt@kms_pm_rpm@package-g7
> >   ##############################################################################
> > +# Valid skip: Deep-pkgc IGT not applicable
> > +##############################################################################
> > +igt@kms_pm_dc@deep-pkgc
> > +##############################################################################
