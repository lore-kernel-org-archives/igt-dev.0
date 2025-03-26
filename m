Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D77B3C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 06:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8769910E078;
	Wed, 26 Mar 2025 06:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gAvTts6s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F85810E078
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 06:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742968831; x=1774504831;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uEX97EQEveSmtjG5j1DOoqOiJtf/zv5l7Tr2X0lDGqY=;
 b=gAvTts6ss4+XnpKWwVKUswliIevKHY3CE0T2YKemwbRF8VnbgRRfXKxB
 xRxKXh8//cIgP16bKDUig/p/dMhu5jMFPajzg0YRF8vhqwA38OglF+Xqq
 ZE9N7ZUxRURx8EtmGcosnaerc46NzaaxHqdvwg8LY49S1orrox55DsjQ5
 Laphlb8+SGZxQpZ5z7dXarxMNu2Elxm7/m2r3LkvXuIpU8mfdfVsdwDvs
 qwmi9onEEBeZMm9JDeT3kxSyXcyILX9o3UJtnY1k2RZ7pYwJOwdHf6pgj
 tNIAm6jHBomTuNIne9gLAlK1jA7BKqPWwD0OrnN8qD67izydh5bKPzAye g==;
X-CSE-ConnectionGUID: Vxkilq30RZKgijYVeqhp4A==
X-CSE-MsgGUID: q07eHnamRU+sqt8usyoZnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="48116362"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="48116362"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:00:30 -0700
X-CSE-ConnectionGUID: GFTeqnETRWGtEQsmpvqpag==
X-CSE-MsgGUID: 0ejxj3l0RLqCtz5+CvMZKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="125453263"
Received: from bguduru-mobl1.gar.corp.intel.com (HELO [10.247.178.138])
 ([10.247.178.138])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:00:29 -0700
Message-ID: <20697dd1-2124-4fe1-a9da-c93cb503d662@intel.com>
Date: Wed, 26 Mar 2025 11:30:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,10/11] lib/igt_core: Add igt_dynamic_subtest_name()
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com
References: <20250221165749.460347-11-swati2.sharma@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250221165749.460347-11-swati2.sharma@intel.com>
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

Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
