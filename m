Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FC2EB362F
	for <igt-dev@archiver.kernel.org>; Wed,  4 Mar 2026 07:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3FD10E95B;
	Wed,  4 Mar 2026 07:59:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJhEwTFP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32710E95B
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2026 07:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772611195; x=1804147195;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Cbz4wa7gKc7xMY56/2+3LR4MSEHyGmyh/Wsabs0jfNA=;
 b=TJhEwTFPOLg3puA53ZUMS5/aJ040Pbw4mhid574M0e+lrGn8a5wSgFxs
 +oAq7es4rZH5WWC+Aol8DJU299K5myNU1mawAKKquwEQ6clMLxSAXIxO7
 bh+yacYWScoulKUO6WJk40o0JlVEIXfpVDgFIgjTq5AJfEF0F4puIsq4Z
 3QCyGmJA4HZ1hPWBdWQP+TaC65uCQjbtxv+QPaZAggeoM2qbJ81FUXJ/L
 4UjrnKdHwoTpVd2XC77R6Kt8rFOFeA6ta1RLwcZ8CwQ9ggpv82ZSFqle1
 vcIN/91GEyc5p4R0xT2hFfEELWPVaicA63eJHMZaoQFACNElpWVHX9Ff+ A==;
X-CSE-ConnectionGUID: mitYCQEaQbqD/IyB7z2Nuw==
X-CSE-MsgGUID: BwvgiklyRhexaGfw19zH7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84000950"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="84000950"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:59:55 -0800
X-CSE-ConnectionGUID: kROhzMv2TN6mYKAE4EdhvQ==
X-CSE-MsgGUID: vNyYUmJdSfu6X3zFF2lvVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="241273135"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 23:59:54 -0800
Date: Wed, 4 Mar 2026 08:59:51 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org, Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t v4 0/5] Extend compute userenv to support user
 passed buffers
Message-ID: <it5st2musbvaco6ux6grs7dtmqehtwsmbw7vsjn2cqu5vfipsr@kqx7m5lxudxc>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
 <d99df782-2a3c-4189-975a-a39d0d2fbf6f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d99df782-2a3c-4189-975a-a39d0d2fbf6f@intel.com>
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

On Tue, Mar 03, 2026 at 08:26:18PM +0530, Sharma, Nishit wrote:
> Hi,
> 
> Can we have description like:
> This patch series enhances the compute test coverage in IGT by introducing
> new subtests for compute workload.
> 
> The new subtests exercise various buffer allocation and mapping strategies,
> including classic buffer objects (BOs),
> 
> user environment (userenv) buffers, and system-allocated (SVM) buffers.

Sure, I reprase the description as you suggested.

--
Zbigniew

> 
> Otherwise LGTM
> 
> Acked-by: Nishit Sharma <nishit.sharma@intel.com>
> 
> On 3/3/2026 7:17 PM, Zbigniew Kempczyński wrote:
> > Add support for user passed buffers in compute userenv. This allows
> > users to pass their own input and output buffers to compute tests, which
> > can be useful for testing specific scenarios.
> > 
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Nishit Sharma <nishit.sharma@intel.com>
> > 
> > Zbigniew Kempczyński (4):
> >    lib/intel_compute: Add types for input and output buffers
> >    lib/intel_compute: Extend userenv by adding input and output bos
> >    lib/intel_compute: Use user offsets and loop size if provided
> >    tests/xe_compute: Exercise user passed buffers
> >    tests/xe_compute: Use appropriate feature in compute-square tests
> > 
> >   lib/intel_compute.c      | 191 ++++++++++++++++++++++++++++-----------
> >   lib/intel_compute.h      |   4 +
> >   tests/intel/xe_compute.c | 154 ++++++++++++++++++++++++++++++-
> >   3 files changed, 294 insertions(+), 55 deletions(-)
> > 
