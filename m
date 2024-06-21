Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7C5C27C4F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Jun 2024 09:22:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C221610F11E;
	Fri, 21 Jun 2024 09:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ji2cy6aD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4F910F11E
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Jun 2024 09:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718961771; x=1750497771;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GV9jA6ZWI4mku+fCF/IRnPBA8HLuBMUkFAPA7c+i5b0=;
 b=ji2cy6aDAE9i7kdLijEKmivr05AJC23dvJHupdCehAxRcuaRSMc5p5zj
 x7Opuecrtov0H+Wej9f5l8vYJTBqQ5VamfUZNaEEToiTnkrtn6Qo1eBZ/
 hbu2N4vjHn060QzVKVHSCP9BEDFOwyEz2cUJkSFTwdpFO/k00qSV74uCY
 ptRz3ECWwjBy66wb2NCBKYnGSqnrn3Ostgjox665pYgIuxyCWOfzYl6dk
 /e0j1NFS9cW8n/3oeztL3eh8LS7bI3yq2+yZCQ8II+BnSlStMYIx3hb9Y
 gI7Tm2mXD1JpWvSFuWd2v0cCQuoAYjuoOWJ4C1nlvQ1RBfqPGsWmWojwF w==;
X-CSE-ConnectionGUID: qcxlVJjOTEKwBqqOXwPNNw==
X-CSE-MsgGUID: Gnk49ZUDQcmlfpJ9aZ4TBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="33530220"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="33530220"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:22:37 -0700
X-CSE-ConnectionGUID: PCQ/Cm0MTc6NONh1rwKo6w==
X-CSE-MsgGUID: eFg9EThASuG9/Ch9rpyZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; d="scan'208";a="73285569"
Received: from unknown (HELO [10.66.103.214]) ([10.66.103.214])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2024 02:22:35 -0700
Message-ID: <232cdaf4-00e0-4400-b4a6-45a0a7cc98f8@intel.com>
Date: Fri, 21 Jun 2024 14:52:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,7/7] lib/igt_psr: Adjust igt_wait intervals
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com
References: <20240614053839.1822879-8-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240614053839.1822879-8-jouni.hogander@intel.com>
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


On 6/14/2024 11:08 AM, Jouni Högander wrote:
> Currently we are observing problems with psr_wait_update. Poll interval is
> 10 ms. With eDP Panel Replay we are seeing scenario where on first poll PSR
> status haven't yet changed to !SLEEP. Then we are waiting 10ms before next
> check. During this 10ms sleep status changes to !SLEEP and back to SLEEP
> and this is not noticed by psr_wait update and causing failure.
>
> Fix this by adjusting poll intervals to 1ms.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
