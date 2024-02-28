Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C12C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 17:21:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6B210E744;
	Wed, 28 Feb 2024 17:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UcW//aLt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA4310E505
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 17:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709140877; x=1740676877;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jfLXvNbT5MlxC53atIzJYlO+MmU9P/WKpaNZ6oftnQE=;
 b=UcW//aLtxf0K8hZYJGk030ng3kOCSAYz5WXPPpx8v+Z/4YphNKTmzkLZ
 4PZjvddx/Igtw2pLi8C0A3f3PnBxXZVtSArB4ruiczS1gXRCezlyWupJN
 D9yvfI56cuMEza3GLqGn2zp5U57LRcRQPn/8NivHPJNF7EVsVOiSj0nxl
 1+5Ci9F5f0Pn8DnxJrf4ZZ9kDEbOyJ4+asisi1bO8G9eVAksJG0CjiQyz
 Q7iGCyf8ZmXabenh6QmT+uLmbu/f/l4Xp4QuKAo3cyBTmX2Gzu0LWubxG
 gRBGRifHfty3oJ6aACFVQQvpz/FtGnEOOd/MBrEOFvbwfWYCShlVgHgVb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3475701"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3475701"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:21:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12071462"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:21:15 -0800
Message-ID: <5ce3d14d-1702-497a-b871-cd89495ddf0e@intel.com>
Date: Wed, 28 Feb 2024 17:21:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 6/7] lib/intel_bufops: Add png dump helper without
 detiling
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-7-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-7-zbigniew.kempczynski@intel.com>
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

On 28/02/2024 14:54, Zbigniew Kempczyński wrote:
> Sometimes we need to visualy inspect tiled surface. Add appropriate
> function which doesn't detile surface before writing to png.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
