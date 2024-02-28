Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229D4C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 16:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D036010E547;
	Wed, 28 Feb 2024 16:10:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NTKi0grz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBDE10E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709136616; x=1740672616;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uBs06lN+ro5JRyBIPqY4ui7X6z24kx6XwPigYi7CiII=;
 b=NTKi0grzzO20MpKJs7xQ3sKmCujQlF3FTItdnOJKFRF/fBUV9qPXZSdV
 2xTYYwPSWjfmvg6nSO5RYMB/306c8tXLRORnz9KVD3QvjbJ+6NI3fJwlk
 /wmzbLL7brGqUVFa13fp+JgV6L75NMXdV5YxDKGG9LyUgoGBQikPcRHoF
 jlVVE7fvofcM6oSsvYoTpQMVsJq8axi0cPbDYktaen6qz8k+DhcApZa8Q
 7P3AyI8cgPwSppq1iaQMIwm1I8QDyQ/YQZuAk4UGE2tTVmPSn7bEH2TKo
 1trm+RfjQpvMsHnNxe2Sd4bnggy/Uz47RxIOWNlYp5HAnlXybunP7Stym A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14255651"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="14255651"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:10:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7589088"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 08:10:14 -0800
Message-ID: <067c8d96-50f4-4e56-ace7-711caea29d25@intel.com>
Date: Wed, 28 Feb 2024 16:10:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/7] lib/intel_bufops: Add width and height to
 intel_buf
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-4-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-4-zbigniew.kempczynski@intel.com>
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
> While width calculated as division of stride and bpp/8 is correct
> it limits its use to linear buffers (tiled requires stride is
> tile width multiplied).
> 
>  From now on width and height are independent so partial blit (render)
> should be now possible.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
