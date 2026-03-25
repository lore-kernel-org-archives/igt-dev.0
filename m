Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333F2109C04E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 17:37:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D049D10E7DC;
	Wed, 25 Mar 2026 17:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHIxmYIp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F63F10E7DC
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 17:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774460265; x=1805996265;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=29UYzDSRKzVRAYFakaTE6XJWHxlC/yXiyK8rIyJgKm8=;
 b=mHIxmYIpNQWZX1AgIaPghsMoXmFc9oImEdRzeHGK5ksimea5EkTdzSNT
 X8mVVgmzstZLOP80rqKFsl6rpvN6n/hwO7I0KIUXagSd0n/TIK29g6QWs
 cBWaEQPPPJI4dd1paQPu5GSErJxvw8GGURlZYnAWO2P6zg/g+TgZWKq05
 hIo9qe/Fr+4Q7IyDSWNrvf1sEEbIkZERPefYjdamL7vQHXjRW8a+DsTg8
 T2tSjLLLl3j2qwz4SU+eWqiUcQkBKEAXwuTJ/iSvSVooe+dJCVMpxXxgN
 ES6OYxVuTKol56LOZn+ewxyz3X5/SYHn2ydWkLSzDa3HCAC3pm/LnO42s Q==;
X-CSE-ConnectionGUID: W0IPAH08RYi7IgLqFJmHGQ==
X-CSE-MsgGUID: kxf4nPuxRFCd9fd7s48nlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75527018"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75527018"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:37:44 -0700
X-CSE-ConnectionGUID: K/KvSD8tTCiqz9AfXIbXwg==
X-CSE-MsgGUID: rEJzd65sTkm5g0I9gcB0gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="220346978"
Received: from amilburn-desk.amilburn-desk (HELO [10.245.245.107])
 ([10.245.245.107])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 10:37:44 -0700
Message-ID: <cbbe4e8d-ca07-4afa-91ae-588da41f9f00@intel.com>
Date: Wed, 25 Mar 2026 17:37:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/xe_pat: Add subtests for validating cached
 pagetables
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260317193756.1266825-2-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260317193756.1266825-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 17/03/2026 19:37, Zbigniew Kempczyński wrote:
> For platforms where pagetables might be cached (WB and 2-way coherency)
> verify there're no pagefaults when walker goes over partially valid
> cachelines.
> 
> Introduced subtests utilize pagetables on different levels with different
> offset selection strategies - sequential and randomized. Sequential
> binds two PTEs per same cacheline whereas randomized distributes binds
> "equally" (with the respect of level set size). Additionally PAT+PTE
> subtest rebinds on same PTE replacing normal bind to NULL and vice-versa
> validating pagetable walk uses updated entries and objects underneath
> contain expected data.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
