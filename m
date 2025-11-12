Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A095CD342F
	for <igt-dev@archiver.kernel.org>; Wed, 12 Nov 2025 18:08:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB32710E788;
	Wed, 12 Nov 2025 18:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j0qe88yo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF1910E788
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Nov 2025 18:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762970886; x=1794506886;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ad1DGoY63Ig339UzmMRV5RP70ya6xIC5157nrV/5hb8=;
 b=j0qe88yoIkLMyUUhMBPyAZa1HVyj5UWvUIALNdpLYY9teR8u760Rx5Ex
 xVTLrjwXgfqTgw3L5Uvqv+QB0O78itCNnguTw05PD7HaOxsXgAeaMNLHm
 PrKgNK8FBj2hmqbwgRb2ZoGOqE83yE2iPgU1BhFJW/UT6UDj9AikM/1Yj
 HD6oTHpC9hEleMDzdcukgAPlA1YXCYuUWIFMG0oOtZnluZrusjWLlVULF
 ruqIrUYsNTg8cM2kyDHQ9LrzN/wu+BvzPtEbVPCUV2Unj4tdQSNP4ZFN7
 /nmr7LY/PX+yAEaEGMjPG2opkjE6CM9yyfcJ5pH2S3cwAbEzjbX8U51tv g==;
X-CSE-ConnectionGUID: +HlivWUBRa2R5uy2tfX4KQ==
X-CSE-MsgGUID: d19oBIDeRYmyFkDIV+eHTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64948444"
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="64948444"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:08:05 -0800
X-CSE-ConnectionGUID: i8mG4mwoQ8SLD0Q5wI2Orw==
X-CSE-MsgGUID: lQ0MsQ6iSAaid6UtzlNReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,300,1754982000"; d="scan'208";a="189462509"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 10:08:04 -0800
Message-ID: <7e47b018-dcd0-4850-b772-0c1f246cc5dc@intel.com>
Date: Wed, 12 Nov 2025 23:38:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v16,3/3] lib/igt_fb: Apply NEEDS_VISIBLE_VRAM in missing
 igt_fb
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, anshuman.gupta@intel.com, matthew.auld@intel.com,
 kamil.konieczny@intel.com, nidhi1.gupta@intel.com
References: <20251104085640.795121-4-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251104085640.795121-4-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 04-11-2025 14:26, Santhosh Reddy Guddati wrote:
> Extend the fix from commit b9a5a4d03955 ("tests/intel/xe_*: Use
> NEEDS_VISIBLE_VRAM flag where it's missing")
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
