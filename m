Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1B8C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 19:51:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D7210E3F4;
	Tue, 13 Aug 2024 19:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXeH/5DV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5214D10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 19:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723578705; x=1755114705;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dEz3XAK9LoKI8RTsRcqUBYOg0djR/ZHXTw/j0lmJkfE=;
 b=hXeH/5DVLkCZq4x55TU3oTs8O/GxhrbEZA2adsv6hGau/P5QH6vg5biz
 RFCsqPIFze/88ViX1FW60mTqixPCGI2zFZF732o2O+Ebqzt73XuwO9lvB
 1kqasseV4nV8LRxbP/nCzuIGq7cN67Qmifg4Z8J+x3F9pF6mAmaje7I4e
 2ultugyXVc858c/+2E3/m6hkqF5d9tzY+7MitMGhZupZyWpsLRMjvlYb6
 lVSFPq8lias/GT334XUVdriE9PIyn+GyHRGd29l0vp2s9hJVBXgm19tjB
 gAhFIc1vSO7d1S7x6l622AzAXetd9+qBcNULilSjHDu2RX5oZNmLBa18y w==;
X-CSE-ConnectionGUID: 7vY2u2p1QyeGAyP1UaOi4A==
X-CSE-MsgGUID: aNai4ZN0TI+OIyDU7neYxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="12992153"
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="12992153"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:51:45 -0700
X-CSE-ConnectionGUID: HIcgSZ9nQC6R8EVwUse3zA==
X-CSE-MsgGUID: SxACl5CJQd+UBHHOkNjCmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,286,1716274800"; d="scan'208";a="58414289"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.4])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 12:51:43 -0700
Date: Tue, 13 Aug 2024 21:51:40 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
Message-ID: <Zru5TDSV47bEHjmo@ashyti-mobl2.lan>
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
 <20240813135652.2jhw2edamqjpvk3d@zkempczy-mobl2>
 <e53f5016-c1ea-4401-91e2-efd025bde585@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e53f5016-c1ea-4401-91e2-efd025bde585@linux.intel.com>
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

Hi Peter and Zbigniew,

On Tue, Aug 13, 2024 at 04:12:30PM +0200, Peter Senna Tschudin wrote:
> On 13.08.2024 15:56, Zbigniew Kempczyński wrote:
> > On Tue, Aug 13, 2024 at 03:36:50PM +0200, Peter Senna Tschudin wrote:
> >> Please do not apply this patch. I am working on a proper fix.
> > 
> > Applying fix stops you from working on a your fix?
> 
> Please do not fix a pothole just before I replace the road.

The patch is correct and Zbigniew's fix looks straight forward.

What is your fix aiming at? Can it go on top of this one?

Andi
