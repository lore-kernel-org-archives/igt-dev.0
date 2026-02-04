Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852A6E9D3E8
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 14:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BED10E671;
	Wed,  4 Feb 2026 14:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Khe/pIx2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140410E671
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 14:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770215967; x=1801751967;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DHj5zua5M+Noo/vE+LyZspSOfIL0KhEWk4Uksc0EOg8=;
 b=Khe/pIx2Ps24KFy3iZnmBG0HIQs0viAJvTM+Uzx5g81Ocy5r2LhxR5Es
 TpXbOPbWTVCt9F330UFGH+H2REgwatBcLOJDDp8VeVAYT6PYbmrDgflRA
 Wan7y4pnzvAoh3e+GDHRYDMQtggCOuOh0FNZGlJtLosqERYNlth45GP83
 a/yKzRvyzqy1M6J7IgRwm28gTRJh/Zynxr/EAkkoV9JRZehYLQgQezyfT
 SAj1kg0/Sk+KIz6wszxbtBkNGQVKwoMSGieP2yNt4qx9zWuqakbuY796N
 nBC6tSgGF8fO3ocfsORUwwQMZClTh5PalzZx3BleWCaSV0Q6VbCa9KDTC w==;
X-CSE-ConnectionGUID: LWv1cZ+LQIW3LHOckmydOA==
X-CSE-MsgGUID: 4NdLiQNpSquHJgubJfLhyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="88980644"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="88980644"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:39:27 -0800
X-CSE-ConnectionGUID: 1P1s8CB/Qxmda39chzUCvw==
X-CSE-MsgGUID: vQFzvKrRSzi00ALCxzfKnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210213751"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.232])
 ([10.245.245.232])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 06:39:26 -0800
Message-ID: <82a83ea4-8d14-4f98-ae6e-6741cdae608d@intel.com>
Date: Wed, 4 Feb 2026 14:39:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_aux: Protect expressions from premature
 casting in aux macros
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260204135500.311469-2-zbigniew.kempczynski@intel.com>
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

On 04/02/2026 13:55, Zbigniew Kempczyński wrote:
> Missing brackets around expressions might cause undesired behavior
> during type casting, for example:
> 
> objs = 4096;
> objs = min_t(int, objs, vram_size() / SZ_4K)
> 
> If vram_size() is 0x80000000 casting to int gives negative number,
> so min_t also will be negative even if it wasn't our intention.
> 
> Add round brackets to ensure casting refers to whole expression.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
