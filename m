Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEB8CA0FED
	for <igt-dev@archiver.kernel.org>; Fri,  5 Sep 2025 16:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 174AF10EC09;
	Fri,  5 Sep 2025 16:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q/anp0Jp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9051F10EC08
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Sep 2025 16:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757088303; x=1788624303;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+mGfWsNcBwhPEQl7R7WTqt3YLU52WPJ5N3U10+Fd90A=;
 b=Q/anp0JpPibusjnDf9S4ArNq1NeNRFURfL89culggTdgFxbgvax8s1NG
 Z0gQzHRSuCprTZOyLICpIBw1tADI59i4geqhngSCDH4jZqteG9/RJ9imo
 BmOzrYYMWj6rdUDjR0lyxgs3Aoz0J9qHVsewNVPhHeHvyTy0kmIP54M+X
 RUFge54u6W+iRKs1uPey6MQ4EGekKm7vMZo3qBaNUghDMutjmOHsoaYZl
 yAmRSBMaOSEpusgjmSWGsnchDShR1BYByUtq/w4r30cTb2tFGNroD8UFs
 difp3SHxi9jlGL7I/BK30OCN7RwKZKGtpTNhxKMXvnSgqyBcBxgQ964YC A==;
X-CSE-ConnectionGUID: Gzhwtwt7RUas6olsrzgXkQ==
X-CSE-MsgGUID: ES+9MgJBTzy2hemgJDSQJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59141315"
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="59141315"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2025 09:05:03 -0700
X-CSE-ConnectionGUID: qBMFkM0JS+qAh0ZHL5KcJg==
X-CSE-MsgGUID: eK5M5xxwSayu+O/f7lNY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,241,1751266800"; d="scan'208";a="172077848"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 09:05:02 -0700
Date: Fri, 5 Sep 2025 18:04:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Pawel Sikora <pawel.sikora@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v7 3/5] docs: rename cross-building.txt to .md
Message-ID: <20250905160459.xkzkvchdxelcxoce@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250905134735.132119-1-pawel.sikora@intel.com>
 <20250905134735.132119-4-pawel.sikora@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905134735.132119-4-pawel.sikora@intel.com>
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

Hi Pawel,
On 2025-09-05 at 15:47:31 +0200, Pawel Sikora wrote:
> Rename cross-building.txt to cross-building.md
> in order to be properly processed by the mkdocs
> documentation tool.
> 
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  docs/{cross-building.txt => cross-building.md} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename docs/{cross-building.txt => cross-building.md} (100%)
> 
> diff --git a/docs/cross-building.txt b/docs/cross-building.md
> similarity index 100%
> rename from docs/cross-building.txt
> rename to docs/cross-building.md
> -- 
> 2.51.0
> 
