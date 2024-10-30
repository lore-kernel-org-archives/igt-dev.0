Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9ADD74963
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 06:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA12F10E085;
	Wed, 30 Oct 2024 06:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N7vxfAlm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9310210E085
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730270094; x=1761806094;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=v6oynUQvWusn1RSUe6TflxSqroied+gbP23hIDxkLsM=;
 b=N7vxfAlmp/mDnfbJU/CTX74iKZewzAlCsGHnxcwDpII0ilmNZTQBc5YV
 tc7ED5xKspLJp89MuRhrbSMoSX65pFJ83BAqNM0mj6qT6+OyZHFm8n22B
 mbXjBtGIUhEB/+YexXtqckjExGJTuNzSGXo6IG/jf0UD+hmRzfWq4LdfG
 iREetL0zyYFM9eI619qa5BQ70fpsxYFcz8IQvB7d8J5pQuDhSbByCCEuU
 a/mIFHblEo/gtBirHMK84Sw6QjYQiYWUFKuhYdRvUPGA9zsqSeqWwgl0K
 f42fHHjZuJzHtWN8wCVKoBfP/iaP3B/J6raDTn6d3PU4Mrjm5w95FYRnG g==;
X-CSE-ConnectionGUID: jI5a7L28QUicpRoC8yjvww==
X-CSE-MsgGUID: xuAYDc13TqWqVSsSkD7J3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33648865"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33648865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 23:34:53 -0700
X-CSE-ConnectionGUID: 3bSTbjUkTdmhnzkVAU9HGw==
X-CSE-MsgGUID: YWry6H03TpyChLLHGLJkDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="86817183"
Received: from vbabum-mobl.gar.corp.intel.com (HELO [10.213.114.159])
 ([10.213.114.159])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 23:34:51 -0700
Message-ID: <f73524fe-eab2-4965-be31-9b51c2b29aa7@intel.com>
Date: Wed, 30 Oct 2024 12:04:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v2] tests/kms_async_flips: Skip Async flips on joiner
 output
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com
References: <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
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


On 24-10-2024 16:41, Santhosh Reddy Guddati wrote:
> Async flips are disallowed with joiner, but the test commit still
> goes through and causes failures. Update the tests to skip on
> joiner outputs.
>
> V2: Skip tests only on joiner outputs (Kunal).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
