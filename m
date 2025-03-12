Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDFBC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 10:11:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07EA10E755;
	Wed, 12 Mar 2025 10:11:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgDgC3N7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B8110E755
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 10:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741774285; x=1773310285;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=Wu2XrPri1r68xgvLiOlJjnd2TREtOjqm+8/bQ7UrmvE=;
 b=KgDgC3N7ZaJwK5kMhJdVSGrbKMl8TM+NDRhmmAOAUXj6bU2YNDh8ZudB
 nZwv0eIF4P2mjb1uEARefxLaAxQKHmw9s1WN7n1hjYsGELibiAAD+1sTM
 lOA3iEZxR9O42nIGd3UZRkwqE6z4m1ak7ESwWOPWEBxT1ZpAbaXnpSpZO
 MIdhZvqkdwo/OZIFkLfb3b6W/vgmVWvkCFIk7MnCiD7qqBAuk9uuOBDGZ
 qMZ+AiqaVCemWr+xGVzNdyVr9BqUjdeFLYjmW8Ln3S2ca2DuVtRV9B9RH
 6DUPCogHAjKS91tBH/c+kdnotkfuTQumpANJlxIACOUOZVHwBLyhYnx1A A==;
X-CSE-ConnectionGUID: QLP4/Cd5RFaeHYkElwHdnA==
X-CSE-MsgGUID: AwK+X5vQQ/WViMh/9ySceg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42882380"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="42882380"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:11:25 -0700
X-CSE-ConnectionGUID: BP4sXuYdR9iy2JRi8riI7g==
X-CSE-MsgGUID: ZV04sufNRUuR+48zQy+qCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125233604"
Received: from dkhokhar-mobl.gar.corp.intel.com (HELO [10.247.217.6])
 ([10.247.217.6])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 03:11:22 -0700
Message-ID: <19a5e089-6d2a-4a53-baf9-1e61e630b1a5@intel.com>
Date: Wed, 12 Mar 2025 15:41:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3,
 1/5] lib/chamelium/v3: Introduce the foundation for the
 Chamelium v3 wrapper
To: Louis Chauvet <louis.chauvet@bootlin.com>, igt-dev@lists.freedesktop.org, 
 ihf@google.com, markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com,
 20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com,
 20241022-b4-cv3-02-monitor-edids-v2-0-7634786c21e6@bootlin.com,
 20241022-b4-cv3-03-cv2-split-v1-0-9f7cc8591ff9@bootlin.com
References: <20241022-dev-remove-static-ports-v3-1-bfbc7b2a83b9@bootlin.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241022-dev-remove-static-ports-v3-1-bfbc7b2a83b9@bootlin.com>
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

Hello,

On 22-10-2024 22:01, Louis Chauvet wrote:
> Adds a build option to enable building the Chamelium v3 wrapper.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   lib/chamelium/v3/igt_chamelium.c |  9 +++++++++
>   lib/chamelium/v3/igt_chamelium.h |  8 ++++++++
>   lib/igt_kms.c                    |  8 ++++++++
>   lib/meson.build                  | 12 +++++++++++-
>   lib/tests/meson.build            |  4 ++++
>   meson.build                      | 15 ++++++++++++++-
>   meson_options.txt                |  4 ++++
>   tests/meson.build                | 25 +++++++++++++++++++++++++
>   8 files changed, 83 insertions(+), 2 deletions(-)
>
Can you please sent all below series together, need to test changes once 
before reviewing.

[1] [https://patchwork.freedesktop.org/series/137915/]

[2] [https://patchwork.freedesktop.org/series/137925/]

  [3] [https://patchwork.freedesktop.org/series/140319/]

  [4] [https://patchwork.freedesktop.org/series/140328/]

Thanks and Regards
Kunal Joshi
