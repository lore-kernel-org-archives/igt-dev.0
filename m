Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC7AE7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 05:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2688110E17C;
	Mon, 16 Dec 2024 05:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKJ5iMa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74FE10E17C
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734328674; x=1765864674;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2AmdICXnmuR9XoiUHtJuqHGTqym93EwJAsDZiVlvASA=;
 b=jKJ5iMa4j9xjr169ykloqCJvOMOk+dMzVpFWw5XB9g0z/D/bP8Db0S5v
 lswmZDPTeBr4+1ajTnhtsvN4NtBKr5yhyklis9r1xvnqA+ReAppKKLhIO
 0NFQhfEX/alQSuiYlv0SvwJkSo6BHmY4RlsUIQNwyCwCz6DziCoGPAhEc
 h75y6+n8F+QJ1XnLUlO10QKiaS/Lv8dckGlBHEXGtquSf0kmk/yXGIPgC
 RKm+RQRqTCdhkZ6kUQNNaeaathwwiJ6fkxCax7clkcjYmNuuoX+YBCkIC
 K0L5aMXl5/TCBAWa8lGT26M0d8+CMcix40RCywgUCFG6MEyUe61R34BtW Q==;
X-CSE-ConnectionGUID: y2hDWw20T6enCqDg1lp6OQ==
X-CSE-MsgGUID: m6z3NhaAQh+bMekHo03hfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="57185318"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; d="scan'208";a="57185318"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 21:57:53 -0800
X-CSE-ConnectionGUID: jafUaH+0Q+Ski7Y3Wyz6kA==
X-CSE-MsgGUID: 0wpMNXkmQOmJE1WEOg9gRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102187521"
Received: from soc-dcgdq34.clients.intel.com (HELO [10.66.97.73])
 ([10.66.97.73])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2024 21:57:51 -0800
Message-ID: <a5d73cd9-af40-4202-8378-5ebe00acfa4e@intel.com>
Date: Mon, 16 Dec 2024 11:27:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/chamelium/kms_chamelium_edid: Limit the number of
 EDIDs tested to prevent CI timeout.
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 Mark Yacoub <markyacoub@chromium.org>, Mark Yacoub <markyacoub@google.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20241213095432.2323965-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241213095432.2323965-1-pranay.samala@intel.com>
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


On 13-12-2024 15:24, Pranay Samala wrote:
> This patch reduces the number of non-4K HDMI EDIDs to 25 when
> the extended flag is not used, as CI does not use this flag.
> DP EDID tests are not reduced due to existing limited EDIDs.
> The change ensures that only HDMI non-4K EDIDs are limited,
> improving test efficiency and avoiding CI timeouts.
>
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Louis Chauvet <louis.chauvet@bootlin.com>
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
