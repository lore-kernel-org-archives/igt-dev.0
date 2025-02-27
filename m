Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C732CC021BE
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 11:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F0D10EA64;
	Thu, 27 Feb 2025 11:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQ52pl7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADD210EA64
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 11:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740654796; x=1772190796;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=scJg9SUpx13FOVCnqIrQvIeJEuHjwslDgSlWG0TWp3c=;
 b=QQ52pl7F+N4mQ+v0MHx1HOt1EU/vkgetkmfM3Rx+I5/F+z4b3oosGd47
 cI5QlyG62rpXuD4ngWH7EP6WLdjT5RJLFmCn66/Vlfj8TPOZfnJijZc7l
 D98l2c34hev5mugcKxkNPAHVLcq8ypsDD9QyjeEE/SNEbB03gAEQSn/kX
 ZNHoOdS7SseaKyxqKY4rxtEbFDoRvvdow46qy54O80Eu1RAxbHTqJzkAw
 1gf4SwOT5mOzi2NxwjcIiB+WYdxnUZwwPNtcBIcICH1Jec4vk26uDnbot
 J5WQsCvqddYxMc39woovN6DUuIIlJ81MOezONOe8xj+Gz67x3l+uD2FIy g==;
X-CSE-ConnectionGUID: 6EzWpqWCTomEdxS9le2vXQ==
X-CSE-MsgGUID: W1WwzisTSIyttoFaLA6xEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52934251"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52934251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:13:15 -0800
X-CSE-ConnectionGUID: XA5IG1YMQCSzath0WQN2Cg==
X-CSE-MsgGUID: RdU2VcsuT7mPiXaMCQRSBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="147813980"
Received: from ykhaled-mobl.ger.corp.intel.com (HELO [10.245.114.21])
 ([10.245.114.21])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 03:13:13 -0800
Message-ID: <b73547d3-0190-466c-84c2-d620842a653c@linux.intel.com>
Date: Thu, 27 Feb 2025 12:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/amd: add memleak functions
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly prosyak <vprosyak@amd.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
 <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
 <9c5d27e4-12b2-4597-97cd-da72bc07d1dc@linux.intel.com>
 <20250226100926.2qkfqmrm4e5qsunb@zkempczy-mobl2>
 <1ec35fc8-92a5-4e69-a562-142745f59659@linux.intel.com>
 <2a494d9e-d771-4bd6-b328-517b7cc7dc50@amd.com>
 <dc46ac89-04da-49eb-be06-ce700d9c780e@linux.intel.com>
 <20250227105314.uuyemk5zhnjonr7r@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20250227105314.uuyemk5zhnjonr7r@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Kamil,

[...]

>>>
>>> sudo ./scripts/run-tests.sh -t -v /home/vprosyak/src/igt-gpu-tools/build/tests/amd/amd_basic
>>
>> I'm assuming this script calls igt_runner. If so, please add -keach as an
>> additional command-line argument to igt_runner.
>>
> 
> This is igt script and you can find it in igt sources.
> One way would be to extend it to accept -k option,
> the other to extend igtrc reading in runner/resume.
> Or both.

I was slow to understand that. But then I sent another
revision of the series to expand scripts/run-tests.sh
to support -K, as -k was already taken. You can see it
here:

https://patchwork.freedesktop.org/series/143996/

Thanks!
