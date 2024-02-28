Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915BAC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 17:16:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C81B10E5F0;
	Wed, 28 Feb 2024 17:16:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCnJXK9K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB9F10E6CE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 17:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709140571; x=1740676571;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=MzlEqOAlvH2Vy/QS6moXHSV1mZFPMET17W3iXgUE4VM=;
 b=BCnJXK9KcF0wybsJWengG9hxPziTs4SFnhFoZ0l5LaVkUSFvkyIviord
 dB+JmFw0eoGHH9/PIHvIlPD5GOiDlkMxT5MMVs84tWKG/tue3O0bYsA0V
 bMzECVutocAYWjBVg7nY0eIOxD2Rjci8xWnnuP7h80iJH8U9aqezoesrK
 hDZcQiI/kTxDaaWGf0kMRcHe7ZAv6EfbIp0svloDM+68vT+4MMfd1Lu1k
 aok58il1ObIAt2all2tNPJHrdrNQHizxEqA/r7YYtOSmnJydohy2AvpRu
 1nZ5rfiBu51rhp7yi6mlw9RMy+KIYMQNGDKlfKUeRrppOxbK1PG4KBdL9 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26019815"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="26019815"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:16:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="45025038"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:16:09 -0800
Message-ID: <0ad4df0b-394f-432b-a9b9-99ee72c02498@intel.com>
Date: Wed, 28 Feb 2024 17:16:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/7] lib/intel_bufops: Simplify buffer dimension
 calculations
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-5-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-5-zbigniew.kempczynski@intel.com>
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

On 28/02/2024 14:54, Zbigniew Kempczyński wrote:
> When caller wants to create a buffer in the library it doesn't
> care about hardware requirements of stride and height.
> Lets simplify calculation and use aligned stride and height
> according to buffer tiling type.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
