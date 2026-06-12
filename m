Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA41CD98CE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 14:36:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF28E10EA4B;
	Fri, 12 Jun 2026 14:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g3cW4lpb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D134410EA4B
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781274978; x=1812810978;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RaLr+HqK38VHOFhYSLkBldpxD+agfu51XxOi5LCeE6c=;
 b=g3cW4lpbefenkAZiyJnM4ZqlJUpmIGXIpU2hSMjIKXt1nAOGNaOwbe4w
 R2+r9l9NqbXw9pOYtiUvtGTa5bR9hmzqrg1Qr0WCTuSkwed8XNGfqw3KU
 ArFl3AsE1djQQCmelXHWky1lzco3wsvBIZOUDe7jpVYU7O50zJh4i0AEr
 2h0/aq441uCFxY4VXgMYbWqdKzOlsIdp23h0x6oxS+VhIFmIrTrafT071
 vsdk51/JKZEWJZB4Q27lxJg9NPV/ZrGIhYq8GzHxY0jKDOlsAjDmf+/3S
 6YVcW4FNut+J1Rf3/p65B8hCRvj3DYblNTw3VH3CV992oNzQFkUHVRVHf w==;
X-CSE-ConnectionGUID: wmaVrxCURl6hZSddaWQsDA==
X-CSE-MsgGUID: 5nG7/ETaRGWjijzk3iejVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="85735664"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="85735664"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 07:36:17 -0700
X-CSE-ConnectionGUID: Xn4unKnYRqWogCt4ssH6mg==
X-CSE-MsgGUID: 7CWi7WrHTgaIKddkRh6yuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="242457733"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 07:36:16 -0700
Date: Fri, 12 Jun 2026 16:36:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to
 xe.fastfeedback.testlist.
Message-ID: <20260612143613.7oh2br33phhhik6n@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Muppidi, Venkateswara Rao" <venkateswara.rao.muppidi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com
References: <20260612130659.5129-1-venkateswara.rao.muppidi@intel.com>
 <aiwH5qdwccT780lH@fdugast-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aiwH5qdwccT780lH@fdugast-desk>
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

Hi Rao,
On 2026-06-12 at 15:21:42 +0200, Francois Dugast wrote:
> On Fri, Jun 12, 2026 at 06:36:59PM +0530, Muppidi, Venkateswara Rao wrote:

please subscribe to igt-dev mailing list, you can do it here:

https://lists.freedesktop.org/mailman/listinfo/igt-dev

This is also listed in CONTRIBUTING.md

In subject, please do not add dot at end, also you could simplify
it a little:

[PATCH i-g-t] intel-ci: Add SVM, multi_queue tests to Xe fastfeedback

Regards,
Kamil

> > Add SVM,render copy,ccs,compute_preempt,exercise_blt,exec_mix_modes,
> > access_counter,fault_mode,multi_queue tests to xe.fastfeedback.testlist
> > 
> > Signed-off-by: Muppidi, Venkateswara Rao <venkateswara.rao.muppidi@intel.com>
> > ---
> >  tests/intel-ci/xe.fast-feedback.testlist | 36 ++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
> > index acff025fa..de71cacef 100644
> > --- a/tests/intel-ci/xe.fast-feedback.testlist
> > +++ b/tests/intel-ci/xe.fast-feedback.testlist
[cut]
