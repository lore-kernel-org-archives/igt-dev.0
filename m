Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B72DC25B79
	for <igt-dev@archiver.kernel.org>; Thu, 23 May 2024 10:00:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF71810E1AE;
	Thu, 23 May 2024 10:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMWWQsey";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F9710E1AE
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2024 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716458410; x=1747994410;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=kLEnnI2WhGmebu+FTdkLHH5XIj62AGvohfsup26j62g=;
 b=CMWWQseycp674pOQkZA1sPmQlSPFF/WuxDtuYLH+FZmGg0GdTzYzlyPe
 UCAD1r43ERqbTI0A0eDvctPj6Ll4Xl/y3FK7PfxAVDIGnsryNrazB9cSU
 KUgCk3pF/bKhqQ5ePJGRmUnhgDtHWWdCC7xDthMvApZ0I6/ihDf7Qak8R
 6BVDMmPci4jnN7cJOePrOsRFQk6NOc35WVGCMsCOatet7SccS09isfwvn
 /xPTIPOx/nHxN/9xo5KF5oB9pm1RQeNmtY3XM10JcJvUjpHq5EoDmrmwy
 C8WxUEQUQ9ktwxtC3opCrtSAg3uE0+0XpeKEqIk8bB0oTrBLb3RiOlLvK w==;
X-CSE-ConnectionGUID: SS/+kHQfS6K1TvzgBsvR6A==
X-CSE-MsgGUID: g0DU+dbBRpujeQAxQ9Jk+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="16601586"
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="16601586"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:00:08 -0700
X-CSE-ConnectionGUID: PhhVeqIHTiSRNCHq3zvjzg==
X-CSE-MsgGUID: 5iUKTVx5Q++WJQjt2r9iog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,182,1712646000"; d="scan'208";a="71016450"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.236.39])
 ([10.247.236.39])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 03:00:07 -0700
Message-ID: <f98db6ef-1538-45a8-af16-ea5442ea45aa@intel.com>
Date: Thu, 23 May 2024 15:29:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,1/4] lib/igt_psr: Set Panel Replay disable bit for PSR
 modes
To: =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240521090233.1998323-2-jouni.hogander@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240521090233.1998323-2-jouni.hogander@intel.com>
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


On 5/21/2024 2:32 PM, Jouni Högander wrote:
> Set Panel Replay disable bit for PSR_MODE_* to prevent using Panel Replay
> for panels supporting it.
>
> Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
