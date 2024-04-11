Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804AFCD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 06:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DCD10EE6A;
	Thu, 11 Apr 2024 06:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSb+I0n3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED0110EE6A
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 06:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712816163; x=1744352163;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=F/zW/thqua4F3aBqtRzscRK1d5vpvmGGaUtlPFsroP0=;
 b=OSb+I0n3C8B6tFHa1gt04CsQkRLsdSvJWvk/x/WP2Pd+X7J6tVcfPz9o
 dXmcRzeOIi/6FXJApUsq8zn9UeGVa4q+YzQbLjYgQHjB9R6KVWvAgxOpv
 xFuiqNHE6vsiSs70dHqQ+gNKqsJmqteasLUPpKhwtpQfwdbzfzv2PX3kY
 GAef65SBQzTErmoU8eie3VfG+7LJL4ofsZh35a0ROvNd0kM0gyqDN8Afa
 Tu4yHdfmqftGlCXs1zjeUg92D0mUX5Y+QBaW3ssa86/kBI2LsxEMHeR9+
 gDESjx0Z1crYG070PeQRKpETzAmF9tRcl3BOTruh4QZR6Y/OmAaK2UD2I g==;
X-CSE-ConnectionGUID: 9WI/g3nlSIKtNvJeBtqhHg==
X-CSE-MsgGUID: AZ4+vOe6TAuuVwkXycUXgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8770001"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8770001"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 23:16:02 -0700
X-CSE-ConnectionGUID: 4f72wEzgSlq8nMQXnAKQ5A==
X-CSE-MsgGUID: QgsVD9qgQPCjpgyEic4AuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; d="scan'208";a="21231816"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.209.96])
 ([10.247.209.96])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 23:16:00 -0700
Message-ID: <61c3379d-3ad6-41ea-90d1-7914eda2823b@intel.com>
Date: Thu, 11 Apr 2024 11:45:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/3] lib/kms: Simplify force_connectors[] error handling
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240410150229.28922-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240410150229.28922-2-ville.syrjala@linux.intel.com>
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


On 4/10/2024 8:32 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The failure to allocate a forced_connector entry is entirely
> our own fault. If we hit this then we've screwd up and made
> the array too small. Skip the error handling and just assert
> that we must have enough room in the array.
>
> Cc: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
