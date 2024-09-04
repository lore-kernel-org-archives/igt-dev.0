Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4524CD3431
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 10:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6120A10E745;
	Wed,  4 Sep 2024 10:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gWTDfvyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1B310E745
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725445419; x=1756981419;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=evyGmPcUptaks1heY7Nle9NOyysxWI1Wsca19Qvb4Tg=;
 b=gWTDfvyPnm0rPHamD3USXsDcL2aAX5wrJPClkZwE8juvuSzz41TS91ig
 5oRIlaxMs3R6EK0sz3Urjehc0c+fT5c1k1BK/5i58GPFlYPf3QdQo/rCj
 ECuLpAzu/ysPxtdFA5HsPkwCykNv2NJdNmi+IMW3OwbUIZK7r+YzBbZRS
 Fthkc31MuOUwHnw+KHB0GymcqQKSNN/wnJ79NV02ozJ6sC7cVhhR25L4P
 /a6jRJRq7uX7UmCJUNfT56PnWu8xijBmO73q1j2q4tNT0CIvjJVlqM5Gv
 BhWKOfBe1gZ0MdHwgSLdH08Gluwyg/3IFio/0zz1c7jflKG80IUNZ6NF7 A==;
X-CSE-ConnectionGUID: 04Jy7Jx1RCeBE0zrrl/Prw==
X-CSE-MsgGUID: joSjwLjzQFGqi8K8TATuHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24259375"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="24259375"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:23:39 -0700
X-CSE-ConnectionGUID: QdwntRNOQASZZqzI6mrOkg==
X-CSE-MsgGUID: LDC9nMfyRBygQ0IuvKq/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; d="scan'208";a="95959371"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.18])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 03:23:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] lib/xe/oa: simplify device id array
 initialization
In-Reply-To: <874j6wzckn.wl-ashutosh.dixit@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240902134907.2186238-1-jani.nikula@intel.com>
 <874j6wzckn.wl-ashutosh.dixit@intel.com>
Date: Wed, 04 Sep 2024 13:23:21 +0300
Message-ID: <87a5gnsoo6.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 03 Sep 2024, "Dixit, Ashutosh" <ashutosh.dixit@intel.com> wrote:
> On Mon, 02 Sep 2024 06:49:06 -0700, Jani Nikula wrote:
>>
>> Stop abusing INTEL_VGA_DEVICE when we can simply define our own macro
>> for initializing uint16_t arrays.
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks for the review, pushed both.

BR,
Jani.

-- 
Jani Nikula, Intel
