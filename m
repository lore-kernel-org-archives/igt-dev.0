Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D0F103E301
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F3D10E99F;
	Thu, 12 Mar 2026 10:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0oUPrB7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3234A10E99F
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773312115; x=1804848115;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6gNwxESUv0aryNH9qr90kJfiNztsZnlIVfrgavfvMZE=;
 b=X0oUPrB7TY/N30kc/7Mmejl4xI8dWu80Uvqi5Ttk7RfeHCY0yRSj0tuV
 XnmAE4yvxtFJ4Ep/11odwQAWV1ZzNqu3FLbw0wwOnJ2L327bjkvSROnFi
 Cfgc9WPnyPoXp+u3nTfS4QhWBdF2jVodtFuuttE7WokWRCYQba8YiARjp
 jHPddjIqL1cnxRsoEMj9Ckd9LNr3UUk0uqSSKfksTUkRBfZgb46KQhjrD
 B8cRr3tJfNGVGr+bfpVrEcDkCaGTvZQmCY9w/zuxUT01VOQaQYGqpg5p5
 cEqv9Zkot+ggOE6jzpibGO5ex2TNg4rm4swIx1WLryEW5K+hmo+zFAaq6 g==;
X-CSE-ConnectionGUID: H4ilhwxDS2W8lgwkQON5JA==
X-CSE-MsgGUID: 5wrdH0wQR5mQt25xn2Qdfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84717104"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="84717104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:41:55 -0700
X-CSE-ConnectionGUID: zr5oHAG5QmiMM7gDimvArQ==
X-CSE-MsgGUID: hwsySPLSTzeOSq7GzWM8Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="220732244"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:41:53 -0700
Date: Thu, 12 Mar 2026 11:41:50 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Aditya Chauhan <aditya.chauhan@intel.com>, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v2 i-g-t 2/2] tests/ci: Add NVL Display blocklist to
 meson.build
Message-ID: <20260312104150.w5b7zuxxtjsapxr7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>, ramadevi.gandi@intel.com,
 himanshu.girotra@intel.com, igt-dev@lists.freedesktop.org
References: <20260312074832.51575-1-aditya.chauhan@intel.com>
 <20260312074832.51575-3-aditya.chauhan@intel.com>
 <8f9c5b0f-a7dc-41b1-a65b-d7480abd119a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8f9c5b0f-a7dc-41b1-a65b-d7480abd119a@intel.com>
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
On 2026-03-12 at 13:38:51 +0530, Sharma, Swati2 wrote:
> Hi Aditya,
> 
> Subject should be intel-ci:
> 
> On 12-03-2026 01:18 pm, Aditya Chauhan wrote:
> > Add NVL display blocklist to meson.build so that this can
> > be used in execution.
> > 
> > Fixes: 04db3b26c52b ("intel-ci: Add NVL display blocklist")
> > Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> > ---
> >   tests/intel-ci/meson.build | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> > index a1e9dff55..2e40b2179 100644
> > --- a/tests/intel-ci/meson.build
> > +++ b/tests/intel-ci/meson.build
> > @@ -26,6 +26,7 @@ intelci_files = [
> >     'xe.ptl.core.blocklist.txt',
> >     'xe.ptl.display.blocklist.txt',
> >     'xe.nvl.core.blocklist.txt',
> > +  'xe.nvl.display.blocklist.txt',
> Alphabetical order.

As Swati said, please correct this and move both to correct place
(after xe.multigpu), , so it will be in alphabetical order.

Regards,
Kamil

> >     'xe.sriov-vf.blocklist.txt',
> >     'xe-sriov-vf.blocklist.txt',
> >     'xe.sriov-vm.blocklist.txt',
