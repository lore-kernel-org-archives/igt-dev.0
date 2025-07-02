Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A450C83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:59:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF73F10E00B;
	Wed,  2 Jul 2025 05:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1O2ArJ4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2F410E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751435972; x=1782971972;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=TXSslf7y9bjzT2iUv99qSJ5KukVV+/yjBmR+MndEyXc=;
 b=W1O2ArJ4Vn/j4q8RJUS0/4WslxTSWt2nJbhOZE/TRsDiQOA6UW2dbOx1
 D3hKumqcR77k8+OQjWa7FVhTCyNlhFaw2CmJD9sHNuYzWZzxX+EBag+L6
 j2jLQJQq4dmBG7UnumzNqHlobz3foALhXFH9qq7zWmoYrieSBHkaoEBE5
 k5izs6oR3n3j0T18IbLSxR10BSka+m8/spHbxjhuSnWnLkuDUqINciLGX
 +LgHHnS5pQjnAUwzXdkE5QNGfJqj8WHF+oBIDs9/3QaR3BOUa+kAWsW5H
 6OZnoLXpOlgrD0drj3ZurD9UsF45Q1rceU26gRcEz1rPRB5t5e6k88VFA w==;
X-CSE-ConnectionGUID: o7Koum97Sd+l9PhkD7yvog==
X-CSE-MsgGUID: L8MVFze/Rye1APxEOOF90A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="65067425"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="65067425"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:59:32 -0700
X-CSE-ConnectionGUID: PwzzvImbTqiapqt49so+xw==
X-CSE-MsgGUID: tqYxO3sfQuK1u3uLWljIiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="154713462"
Received: from supriya2-mobl6.gar.corp.intel.com (HELO [10.247.250.202])
 ([10.247.250.202])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 22:59:30 -0700
Message-ID: <dbb0f8e2-47a5-4a57-aa3c-e215fe806df4@intel.com>
Date: Wed, 2 Jul 2025 11:29:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4,4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20250630134145.836-5-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250630134145.836-5-mohammed.thasleem@intel.com>
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


On 30-06-2025 19:11, Mohammed Thasleem wrote:
> This update stops skipping fbc-* tests support variations based on the WAs.
>
> v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)
> v3: Updated logic at igt_skip_on_f. (Kamil)
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

LGTM, Consider RB for patch 4-7 of this series.
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

