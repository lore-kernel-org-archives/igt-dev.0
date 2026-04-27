Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6974FFF8860
	for <igt-dev@archiver.kernel.org>; Mon, 27 Apr 2026 12:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A6310E718;
	Mon, 27 Apr 2026 12:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l80+aRrS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C035F10E718
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2026 12:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777292684; x=1808828684;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=e8dr6bCmSzYhc5JHN3hQ0HkLyN46oyzrBignHolCOjY=;
 b=l80+aRrSi0bcud6HwUoXEeFeOhhDm3PbkuZVR5HUA+FxeQJ5F+gO6P0M
 wijs4sfUMNyCIZLs/VBN2c0qubCxDFFxVOPCItR7YB2DK9/n8/HqGfv29
 PqeWts8BreKLfnuj3XMAhENN91KEj+XdZQCS5/MC+gTmYZ2qlXKce90NN
 aMCohrLtYmT2n8eMLFuBEZl3BUjQKkjYrR/oq8fHcz0CAiMtHam+Wbler
 5DFAwE7QCbEbGi8Ds6t/gkCBOn9HrFA0boVIXOqp7ioGpC4LAdCJjeecR
 1Ad2ELcEOJoPdnYB+MYpAln/iyt2LM1tDotFjkocZjS/eovPmqJ3nC5tS Q==;
X-CSE-ConnectionGUID: zQxIN3b0RO+tYvbY28UhGw==
X-CSE-MsgGUID: uq3cMi3fQre3mkTCV4+H9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="81786961"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="81786961"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:24:43 -0700
X-CSE-ConnectionGUID: xXJv1YcXQFOFejPN6UMyfw==
X-CSE-MsgGUID: RzilKVqFS/uKjcHrIzbLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; d="scan'208";a="235392738"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.116])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2026 05:24:41 -0700
Date: Mon, 27 Apr 2026 15:24:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@chromium.org>,
 Lyude Paul <lyude@redhat.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH i-g-t 0/3] Few fixes for igt_display_reset_outputs() in
 lib/igt_kms
Message-ID: <ae9VhmJF5yFrBRR4@intel.com>
References: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260424151355.129423-1-kamil.konieczny@linux.intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Fri, Apr 24, 2026 at 05:13:52PM +0200, Kamil Konieczny wrote:
> Discussion around a fix for asserts in
> 
> https://patchwork.freedesktop.org/series/165136/
> tests/kms: correct index validation logic
> 
> lead to conclusion that the missing part was additional
> swap of pointers. While looking at code I also spot one
> more potential problem, fixed in 3rd commit.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Kamil Konieczny (3):
>   Revert "tests/kms: correct index validation logic"
>   lib/igt_kms: Fix assert in igt_display_reset_outputs()
>   lib/igt_kms: Fix cleanup in igt_display_reset_outputs()

For the series
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> 
>  lib/igt_kms.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> -- 
> 2.54.0

-- 
Ville Syrjälä
Intel
