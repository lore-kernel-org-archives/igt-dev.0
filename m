Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D59C2BD09
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 10:16:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3D710E0D1;
	Wed,  3 Jul 2024 10:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODmoF020";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0310E0D1
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 10:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720001766; x=1751537766;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CEUrAHVs9yD6lMtaxpb+hDDyDkarquBdNpvKJvsyNas=;
 b=ODmoF020pQ6tTsSKo0gRxWoLMNTvhNokCU5Gt4cAdZeVip3S0lHQ9Eyu
 1H9cyaE1zmzK3RCmmru28YN2HJVkQmNnurYb3yd/LsI5qAAN40TScNZLq
 j3y6C30QbCyZJhFV/L+1qOfrb4oXoL4iDbVe32R60/G9rEDN2HdtK/Ksb
 XJtj5NOXRtKC+W4ezgK1UBRcyXfnvnjcKsxSOD0R/85f6WatxtFsWGOQ2
 rKOMBnchbqXOBnYjknJ24uCKlXRnwxSSzk33PLtKOZOlQaipDl/6XS7jf
 WXvKCNkh44DL+gxD+qqsMHlrVRmh+/znn9JX/5S+QRwvAFmgfWQopZ+f2 w==;
X-CSE-ConnectionGUID: Arjvlo9fQwShw9JQH90sVw==
X-CSE-MsgGUID: miPF3U5BTMi+FYVxKYeVTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="27826433"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="27826433"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 03:16:06 -0700
X-CSE-ConnectionGUID: lWFHF8u0RbWpRuw4tSVUAA==
X-CSE-MsgGUID: 98d/ts8PSruHDhvICKFBYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="46081304"
Received: from joshikun-mobl.gar.corp.intel.com (HELO [10.247.250.237])
 ([10.247.250.237])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 03:16:03 -0700
Message-ID: <c7df35c7-d641-414d-b032-2cd3d8a47401@intel.com>
Date: Wed, 3 Jul 2024 15:46:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,2/2] RFC: tests/kms_vrr: Add new test to validate LOBF
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: animesh.manna@intel.com
References: <20240626191537.1507452-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20240626191537.1507452-3-jeevan.b@intel.com>
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


On 6/27/2024 12:45 AM, Jeevan B wrote:
> Validate pseudo static refresh rate changes in the VRR with
> fixed refresh rate framework.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
Hello Jeevan,

Can you add a HAX patch including this test in fast-feedback for both xe 
and i915,
So we can get results from CI.


Thanks and Regards
Kunal Joshi
