Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B564C19F32
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 19:30:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80D610E2A9;
	Wed,  5 Mar 2025 19:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hu61mcUu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79BB10E2A9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 19:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741203058; x=1772739058;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=vMR1Vkyq/wnm1jypXgX30WRudvsMIzE2O0h4H/Pqy/8=;
 b=hu61mcUug64zmSFFvxoSipbrUyMFFabIXBdgEPvGyNGKKbKsi+iIvYY7
 2c5pR78l1e4+KK32zIk/cM3+n7IWRMaq0xuZFmnTeCWnMhnzCg5dsZN+N
 /HVsbNeiZHyNE8Z0ll1hPp84hwQoGGu1ynWVHAtZi0+rJ1XRtYEhEYWv2
 MFMMvoRuAOsaybfZEDWJcR9jygTaoDy4BIaNoRrWeN6W9akY+FkWvKOCd
 VA/We3Y0oubFXwTNNW8HcwjC+i9FqCNG6M3urrNhnu0oX/pz1XFauR9bt
 7K5LUTS0d94cwpQ77nLnQ4+9MbFImDx8/vocek3PXHMC9Dxf44Z87YuZD Q==;
X-CSE-ConnectionGUID: /8/99t2OQIakaVPHqoIaZA==
X-CSE-MsgGUID: LfYL70s0TqC5Af5nZnWKIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53584499"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="53584499"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 11:30:43 -0800
X-CSE-ConnectionGUID: /+Np6Ej2SMOZfA181Iy74A==
X-CSE-MsgGUID: +DUiQtRlTny5hswd1W0tNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; d="scan'208";a="118586214"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 11:30:33 -0800
Date: Wed, 5 Mar 2025 20:30:14 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH v3 i-g-t] runner: Parse results harder
Message-ID: <20250305193014.jrb6z4wjnd7gnil6@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250303171029.70318-1-kamil.konieczny@linux.intel.com>
 <w7oziq7mhwv7r6bpfcox2rb7icbwyqmphdjpf7guf5t7qj7mpy@oplkrucp2skl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <w7oziq7mhwv7r6bpfcox2rb7icbwyqmphdjpf7guf5t7qj7mpy@oplkrucp2skl>
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

Hi Krzysztof,
On 2025-03-04 at 09:41:20 +0000, Krzysztof Karas wrote:
> Hi Kamil,
> 
> >   Sometimes an error happens in kernel or in test that leaves
> > output files in corrupted or incorrect state. While runner or
> > resume will just move on to executing next test, when generating
> > results it could end up with no results.json
> > 
> >   Try processing outputs a little more persistently and use any
> > output file left there, even if only dmesg.txt. Also, when no
> > useful output files were present, instead of breaking out add
> > notrun.
> > 
> >   Inform about processing results for each test so a problem
> > could be spotted more easily.
> > 
> > v2: removed ')' from 'notrun\n)' (Kamil)
> >  using bool var, added more prints about errors (Ryszard)
> > v3: reused open_for_reading, removed bool var (Krzysztof)
> >  closing only positive fds[] in close_outputs(), checking
> >  file sizes also if all opens succeeded (Kamil)
> 
> Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
> 
> Best Regards,
> Krzysztof

Thank you for review, unfortunatly this didn't pass checks:
meson test -C build

see results in gitlab for v3:
https://patchwork.freedesktop.org/series/145520/#rev3

I sent v4 but after more checks and more code reading I wrote
new revision today and will send v5 soon, please check and
review.

Regards,
Kamil

