Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20419C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 13:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F6210E286;
	Wed, 12 Feb 2025 13:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NY0reMRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD86510E286
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739367718; x=1770903718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Lh66j6qutJfwSCSOr7WN9l341cDyEuTHYVkRC9JypHo=;
 b=NY0reMRDjnuAVLmb9Ivf0tmSCMi1jH5kzg/gsoxxMJ94DxjF06wrWZaU
 2qpITGQloAokthg+LVRE9+LYhhteRpQtn41fRdXZLrWw6Q7XqBoLgBBJX
 0DkoT160QGF0GnsPro/yHn9HhFw7QOlp0afvZ+KzRTmq45BDvHRYTHhb1
 52hD59CQOvZ6jLGuEjUKQRTzc/JHGRjxhpddsWNEFtukTqgP0fvPfKZHe
 b2oq2ixPEc213PC0LKG6xEiu47WsYjtxkLl6NAXHWa+nxKhYO123USbrd
 Mr9lvUN86RchviwX7L0TknKpXvuV8zuPcUwehMbdvoAZ8lhZsThDwjbv3 A==;
X-CSE-ConnectionGUID: +4RLnJPBS3SZXXRapTr4xw==
X-CSE-MsgGUID: 7pTg1y74Qw6X79Qtq124Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="40285980"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="40285980"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:41:57 -0800
X-CSE-ConnectionGUID: O8urqbqvSI6sV6JPmoPTQw==
X-CSE-MsgGUID: bn/mEhU9QcyscycaAn7QFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136091124"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:41:56 -0800
Date: Wed, 12 Feb 2025 14:41:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t v4 1/2] lib/igt_kmemleak: library to interact with
 kmemleak
Message-ID: <20250212134137.wiccesysfk2aylmb@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
References: <20250128151537.515639-1-peter.senna@linux.intel.com>
 <20250128151537.515639-2-peter.senna@linux.intel.com>
 <20250131123454.ilhzogs6a2w7s3on@kamilkon-desk.igk.intel.com>
 <17fe9952-7b2e-46fd-af1f-cd7cbea2cebd@linux.intel.com>
 <20250211161734.nm6dsq3ahhcn7hvz@zkempczy-mobl2>
 <5f9f0b38-343b-4b1a-b5c7-ad1706fa2ddd@linux.intel.com>
 <20250212083614.w6nmqvkblab3ha4c@zkempczy-mobl2>
 <5bbb923f-e81a-4c54-b1f7-10e6d8561369@linux.intel.com>
 <20250212100157.zgzmorbk7rd3ogd3@zkempczy-mobl2>
 <af2caad1-7daf-4ffb-8e04-fe6b69f9f233@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <af2caad1-7daf-4ffb-8e04-fe6b69f9f233@linux.intel.com>
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

Hi Peter,
On 2025-02-12 at 14:12:44 +0100, Peter Senna Tschudin wrote:
> 
> 
> On 12.02.2025 11:01, Zbigniew Kempczyński wrote:
> > On Wed, Feb 12, 2025 at 10:18:17AM +0100, Peter Senna Tschudin wrote:

[...]

> >> Resume: I prefer to wait until the initial feedback from CI and developers.
> >> I will be happy to move this to runner later if we decide to not walk the
> >> unknown road of trying to catch as many transient leaks as we can.
> >>
> >> That being said, let me know how to move forward.
> > 
> > Question is to CI folks, for me this scan should be executed as
> > dedicated CI run with kmemleak on. And I repeat - I don't see reason
> > we should add this support to the tests, as few line script which
> > wraps around test by kmemleak clear/scan is enough. We already have
> > scripts directory so it is good place for such wrapper.
> 
> So I am moving the code to the runner directory, and using printf() instead
> of igt_warn(). Any other request for the series?
> 
> [...]
> 

or fprintf() or write() so you could write to a file instead
of stdout, as stdout isn't collected now by runner itself (it
goes to igt_runnerNN.txt but that is another story).

I also want to see ack from CI, on ML or in any other way.

Regards,
Kamil

