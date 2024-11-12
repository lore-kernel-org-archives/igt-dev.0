Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D42D41D53
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 05:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D26E510E233;
	Tue, 12 Nov 2024 05:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RJYic/yD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4998310E233
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 05:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731388582; x=1762924582;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2gy1SY8cXeS5AfPpZPo9YOoC9gpPNmiVl0bRUrn1QkQ=;
 b=RJYic/yDT4f8Pxd1IluYsR4vpEhBgDqCxXBmQjUVPmvjKiYoa273vnf6
 Undd7eqGlTw6H0O+rXZ2FmpTZjnrkJbKhJv8vhuyIEIyrX/uT1XiHtnAw
 heYfHw1YtxDpNBx9w1K4InKzrRzwV+Kixix/R4t+bQt6Trj1sOkkQrk1t
 CGwSwpNmU9zHZGstyq/0in4nn8QBS8LXnePv6Znjy90bZIeqMrRX3I2mQ
 71G2eyCvaY9iAZOib5N2iIPZ1YAPVgHyaMFFmEVytV0Bor/Wcra+SYN+n
 v9SGb1351z2ZjDs/Z3uBFFy0aS7igVm5XL9wEs5UOWHsuSueXt8x7CwMB g==;
X-CSE-ConnectionGUID: e7Q3p2gOTCmUSwpCD/IU4g==
X-CSE-MsgGUID: axylBlibT/W4tI4SD7KU7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35141372"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="35141372"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:12:38 -0800
X-CSE-ConnectionGUID: 2ngigxtaQnCbvDQCHM7hOw==
X-CSE-MsgGUID: Zn45SXolT8S1GS+9b5yKqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="87229436"
Received: from jayarakr-mobl1.gar.corp.intel.com (HELO [10.247.246.122])
 ([10.247.246.122])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:12:36 -0800
Message-ID: <6ba99545-4c70-4636-b05f-947338d3f5b8@intel.com>
Date: Tue, 12 Nov 2024 10:42:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 1/3] tests/chamelium/kms_chamelium_edid: Use
 extended flag to reduce the number of edid
To: Pranay Samala <pranay.samala@intel.com>, igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com
References: <20241112050442.1854319-1-pranay.samala@intel.com>
 <20241112050442.1854319-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20241112050442.1854319-2-pranay.samala@intel.com>
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


On 12-11-2024 10:34, Pranay Samala wrote:
> This test iterates on all the available edids of HDMI.
> Due to CI test timeut limitation, we are reducing the
> number of edids to execute to avoid result as timeout.
>
> Using extended flag to achieve this. The test will execute
> only 25 edids when this flag is not used as CI doesnt uses
> this flag.
> In local execution to execute on all edids, we have to give
> this flag at the runtime.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
