Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E62CAC5B0
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 19:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8953910E845;
	Thu,  2 Oct 2025 19:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="foh6KaIs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0304810E845
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759434918; x=1790970918;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=HoOJ3cFa/fqQ5swomo9ULokWbXsVDQ+XY9AorDjmwSI=;
 b=foh6KaIs4WI8LIgMh5rtaVey/8AYQjp2mhtYdovSgeyZICU3fRmF9zjY
 KzO2IneJCYQNHav7/NdrGNuSgxZ9eVv5LicWT+JtLJkCoYT7/bE4Btjuj
 HsJzjC6rYnD4SPF79eM3GlSCMvRvtiJC6b9VciZxaaN+k3iUCyPA+UHBg
 0qWcNaqhmdvrTmVtA5skGsKqLsgJOGteZbOOoSvZ0Lh6shylkZ+jHK6rp
 urO3ei5jik+x5mtxPMUdwyGNDg697seqbXHqwBKL3yMm6ZAyVDH3zmId/
 7JkjYfU3nuyDiIjAKzZuSqV9YKQateIq3jVrDxZLgOwnZlW0KLeHk4jdx g==;
X-CSE-ConnectionGUID: U0G9ZkLXTpu7AmOVytPdOw==
X-CSE-MsgGUID: eu5lKzkaSw2R06XSAQ+tnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79153132"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79153132"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:55:18 -0700
X-CSE-ConnectionGUID: nBXFi1tfSZWjzZmq5O8WcQ==
X-CSE-MsgGUID: ckerXINoTmOELI4yreMYtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="179562916"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 12:55:17 -0700
Date: Thu, 2 Oct 2025 21:55:15 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 7/7] tools/intel_display_poller: Add --dsb-id/-d
 command line option
In-Reply-To: <20250922160950.27250-8-ville.syrjala@linux.intel.com>
Message-ID: <ea0b5ceb-4a65-0e12-edcc-b97ce92fd57b@intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
 <20250922160950.27250-8-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="8323329-1531497796-1759433314=:1357965"
Content-ID: <b31cdbe4-5b74-0b35-d5ba-7eeea957d288@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1531497796-1759433314=:1357965
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <341aade9-b345-c71e-c970-a30157aea60a@intel.com>

On Mon, 22 Sep 2025, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Add a new command line option (--dsb-id/-d) to select the
> DSB engine (0-2) for DSB related tests.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>
--8323329-1531497796-1759433314=:1357965--
