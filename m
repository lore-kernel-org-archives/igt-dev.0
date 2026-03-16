Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74112F013CC
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:35:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0753810E1CE;
	Mon, 16 Mar 2026 08:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TA5KDWvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9DD410E4C0
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773650102; x=1805186102;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=hyRX/hBPEuy1frkEFCM83NdeL+TBT1LPmDIuB/L4wQE=;
 b=TA5KDWvBaMNz6ZKPkNGGK+gWN+n4hqz3FW/p+CkIY2RzucC4EEu+8km2
 J639h439mhcO04SH2iesrafdIIV8pvTjIb4yjyiwK9eueaRnw8pQQMPLm
 1cIb2bVFkVy6gmR98Cgxd0oHQQzpvu/Pr3oSN5xLnwuQn/PlddfVzZhdM
 BHwvZtqAou5lC6osXmyfuUu0jzzwNBPXzwAW6X/4E0a+IXXgf7o/PRlxS
 zb3Bfx0Cwt0xOYViTMnYG1cVV55VhBIfgWGxLuM6dry5k5dmOJJqJcvJK
 dbmocHLYSo6d431P75z2z1aYDfnV3YKWfHF24xSELZacWj6fCgHKic0Po g==;
X-CSE-ConnectionGUID: sgqIUB3jTZ2Afq9rU7JKcA==
X-CSE-MsgGUID: O1eHnCZPSv2Ve8QBjL08pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="73844213"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="73844213"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:35:01 -0700
X-CSE-ConnectionGUID: 12lRpAZeQf6oBZy8RkwQlA==
X-CSE-MsgGUID: Yz/JkKN1QfuE8uSlxM4G/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="244881403"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.99.13])
 ([10.66.99.13])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:35:00 -0700
Message-ID: <741cdeb8-e126-4040-b788-74fc962160e4@intel.com>
Date: Mon, 16 Mar 2026 14:04:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v1] lib/igt_kms: Fix invalid mode timing in
 igt_kms_get_full_edid()
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
References: <20260311081049.3220303-1-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260311081049.3220303-1-mohammed.bilal@intel.com>
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


On 11-03-2026 13:40, Mohammed Bilal wrote:
> The mode timing values for 2288x1287 were invalid,
> causing an incorrect refresh rate to be calculated.
>
> Fixed by using proper timing values with correct blanking periods.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
>
>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
