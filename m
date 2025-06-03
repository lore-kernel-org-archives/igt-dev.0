Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FECC5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 09:17:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B6C10E8CA;
	Tue,  3 Jun 2025 09:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HiZDj8a2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7210E743
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 09:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748942271; x=1780478271;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Zmmz5ZoM2eG3opN0dn1pznYVOAj7k2Yfx3m/s1oF1l8=;
 b=HiZDj8a2DZhO/kamt9blLXa1xlLWov5DVXUOtfcHHA2KT7B0HKcQOgfB
 kymMz9P4Q3ol2La1fI77P73quduxjMiIoYEkZioCcDLsXhNyVz4wYFHBB
 Eiy5UItM36xFZhzxf2WtAa/eZsereID1gaDzq1wrsRHT0/LgboZV5PXUO
 VQ4OFYF0h3ciKwxaCFbmBEF9RxvLdn+COSwrucThjUf8+JNjN1hichWYR
 BpIGWq6vHHpVga/hTzFOcu+2HVbkInrR6uJLZsS19k5ygWytDQZhYl4DI
 UlvP9ZY+c9QmnsyIeYSur99qJqMphqxdANdj2XhAuUxwtcDZPEQzDiMEN Q==;
X-CSE-ConnectionGUID: tNHJFLb3QR20FeWkrJhL6g==
X-CSE-MsgGUID: LtwFlSj3R22Y8o+zFjWHeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50845878"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50845878"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:17:51 -0700
X-CSE-ConnectionGUID: WIXP50+6R/CSbcDNeC49kA==
X-CSE-MsgGUID: yvZHUfnwQmuqrbGSXhUinA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="150092440"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.98.161])
 ([10.66.98.161])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 02:17:48 -0700
Message-ID: <6c3135f4-8196-4cfc-b68d-850a0f0ee5f2@intel.com>
Date: Tue, 3 Jun 2025 14:47:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 0/2] whitelist for HDCP panels
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, suraj.kandpal@intel.com,
 mohammed.thasleem@intel.com, kamil.konieczny@intel.com
References: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20250529015522.298460-1-santhosh.reddy.guddati@intel.com>
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


On 29-05-2025 07:25, Santhosh Reddy Guddati wrote:
> Add whitelist functionality for monitor EDID checks.
> Introduce a whitelist mechanism to handle specific monitors
> that are known to face issues with certain features, such as HDCP.
>
> This change is intended to skip test on those panels which are
> blacklisted.
>
> Santhosh Reddy Guddati (2):
>    lib/igt_panel: Skip hdcp tests on unsupported panels
>    tests/kms_content_protection: Whitelist check for panel support
>
>   lib/igt_edid.c                 | 27 +++++++++++++++++++
>   lib/igt_edid.h                 |  1 +
>   lib/igt_panel.c                | 35 +++++++++++++++++++++++++
>   lib/igt_panel.h                | 17 ++++++++++++
>   lib/meson.build                |  1 +
>   tests/kms_content_protection.c | 47 ++++++++++++++++++++++++++++++++++
>   6 files changed, 128 insertions(+)
>   create mode 100644 lib/igt_panel.c
>   create mode 100644 lib/igt_panel.h
Acked-by: Kunal Joshi <kunal1.joshi@intel.com>
