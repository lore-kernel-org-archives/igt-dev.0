Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF842C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 13:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A4C110E2FB;
	Fri, 25 Apr 2025 13:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EF09augA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F62C10E980
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745587083; x=1777123083;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=TXqAJzyqbwxcJoKg9DfVTLRhVBrQhQmmbaAcED8OrGE=;
 b=EF09augARQdd+xrJcL/rKMnn7LpKYcNVe9ZdnLPrpTnpGAhPlyYWG0eh
 gxtrAZ0iG+CXH7NYol4D7alxQnBWgtmGxw5z0PktRu9E+CNyXHpTXKXJK
 xtcbgwjzX8hbxDBDjgpWdx0p8m2QIQR9CiDvZYmdtxLEqe6UHHUX+IcJQ
 1Adtyjih/+qVpXiqyQBtVOofO7vm/UhAW+d+BvYulwYRjRb+2BpBYQSAc
 nYASmjz9lUncAy2UXHYGiG5u7aHEwZD0N+e+SlYyO2JnORvGpixbc7KK6
 NXjggHNA5ewyWR4kw1MqbXMM/UcccQrZnquRPccjrjY5fHc6q9H859foR Q==;
X-CSE-ConnectionGUID: NjNfCPAZSsqu2cHTYvOu8Q==
X-CSE-MsgGUID: NB+DoLoVQeaPuaPEakrpeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47123612"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="47123612"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 06:18:03 -0700
X-CSE-ConnectionGUID: po5Z54pVQMKABel4rvDZbA==
X-CSE-MsgGUID: KOF2qyH4T2CX+qJ7pE9QRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="136960905"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 06:18:02 -0700
Date: Fri, 25 Apr 2025 15:17:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/igt_facts: Remove unnecessary extern from
 header
Message-ID: <20250425131759.fah44bhqab2k7fqe@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250425094904.221857-1-peter.senna@linux.intel.com>
 <20250425094904.221857-2-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425094904.221857-2-peter.senna@linux.intel.com>
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

Hi Peter,
On 2025-04-25 at 11:49:03 +0200, Peter Senna Tschudin wrote:
> There was an unnecessary extern on the header. Remove it.
> 
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/igt_facts.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
> index e96f88083..109f0d3bd 100644
> --- a/lib/igt_facts.h
> +++ b/lib/igt_facts.h
> @@ -37,7 +37,6 @@ struct igt_facts_config {
>  	bool enabled;
>  	bool disable_udev;
>  };
> -extern struct igt_facts_config igt_facts_config;
>  
>  void igt_facts_lists_init(void);
>  void igt_facts(const char *last_test);
> -- 
> 2.43.0
> 
