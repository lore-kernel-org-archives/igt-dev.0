Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B818CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue, 11 Nov 2025 06:30:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31D310E097;
	Tue, 11 Nov 2025 06:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dV22vZNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D06310E097
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Nov 2025 06:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762842608; x=1794378608;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=78BXAR2kg1QOqv+GXgtaYdkKDdsJXXW0GGvplEnuwEA=;
 b=dV22vZNLkMj3dvB4mUqZNorxg+JDESEJ2ssnr337e4+nEfTj82AjmQbf
 BNdOxs1Ex+OnlODzeFJah6iwjvzDVr601HBfirmPhbxttNc1cswcgvWWn
 i1IYFyDJ5PE5xQ6pH6rXR0inSQep3tYj4VE77aELwqh2/ezqI08r3Zh7Y
 /T+i7yUNGg1qm7Zg79Pob6Wz1971PpMHDbeGNqcLiUgNRsTOPgJlGKwYe
 gLXmi1MXuAWqYJJZA6t5Z8cCMeJQjVVg4vUOBVYMAwqTl2XV1tK3Mo5gU
 /l/PpNU2rWY8hND/mOqgXwz4O658rBqykqNiOZ/ahYjJVrXUnCCKrEo2M g==;
X-CSE-ConnectionGUID: B7I67jRaT9OJtVYL9DmWYA==
X-CSE-MsgGUID: AMkvRHAfR52eqJ/gt+Qvzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64833889"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64833889"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:30:08 -0800
X-CSE-ConnectionGUID: Rkvt9lJpTtyQZNhsMIZteQ==
X-CSE-MsgGUID: zzbX6WUhR/qdBjz9VVTIXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="219532843"
Received: from sanbuman-mobl.gar.corp.intel.com (HELO [10.247.200.233])
 ([10.247.200.233])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 22:30:07 -0800
Message-ID: <68c27514-f3a6-41e9-bafc-ab688d881d87@intel.com>
Date: Tue, 11 Nov 2025 12:00:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,5/8] Revert "tests/intel/kms_psr2_sf: Enable the tests
 support variations based on the WAs"
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com
References: <20251110192454.44385-6-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20251110192454.44385-6-mohammed.thasleem@intel.com>
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


On 11-11-2025 00:54, Mohammed Thasleem wrote:
> This reverts commit eda8fda9f9451878cb16a4dab496fc2e9128a751.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
LGTM
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
