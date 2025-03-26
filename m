Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5B2C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 06:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A938410E2B9;
	Wed, 26 Mar 2025 06:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUdF5MJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D65010E2B9
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 06:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742968950; x=1774504950;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=uEX97EQEveSmtjG5j1DOoqOiJtf/zv5l7Tr2X0lDGqY=;
 b=WUdF5MJ9Z8WN8z3LUM6m+4RNU/zQqADjlGE8DLOfxYVyVCMewrOdMQtC
 96fY4dhXHLNPJNz2MhtrAbOfKLxD9wxQTzmaEy1tJGcujpsM1ycpfZqA6
 +hZ9C5w1Lbr+t1oJUSo1MoiEju9Kz4TJpaA0k+SXxeZ71vYE4FWebXjnH
 SkRTuGdKAWZeDH8IovbA4Ppl+Lglc7IX03fYEZCVxEy6W6BBOkoOGT8vR
 EWu45S7bt4EU21Rnw9rCZR8EXsQMatDPNrHZD6dSeOp9g9wOvyIhpRerQ
 29IphxhsY0jLTSI7294nLCJARrON+jLv5tBQ2UBhbNPbORcrh4rK2CGJo Q==;
X-CSE-ConnectionGUID: ZVnuqAqBTFei3klWIcLJtA==
X-CSE-MsgGUID: JPY+KX00QHOFBwvGJBjDiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="43394875"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="43394875"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:02:29 -0700
X-CSE-ConnectionGUID: bkNwv978QYi7cd6eYd/7hA==
X-CSE-MsgGUID: QPmiAoOmQ3+m4i7XiJy0Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="129501936"
Received: from bguduru-mobl1.gar.corp.intel.com (HELO [10.247.178.138])
 ([10.247.178.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 23:02:28 -0700
Message-ID: <8e1abe97-ac9e-4eff-ad1a-75a5b7db6b2b@intel.com>
Date: Wed, 26 Mar 2025 11:32:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,11/11] lib/igt_frame: Use igt_dynamic_subtest_name()
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com
References: <20250221165749.460347-12-swati2.sharma@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250221165749.460347-12-swati2.sharma@intel.com>
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
