Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2810E81BA8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 12:05:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E2F10E3CA;
	Mon,  9 Feb 2026 12:05:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHsiXUpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126410E3CA
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770638740; x=1802174740;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lSB7vAvz2JlOYAWN/s7nkJ8ywzYDsTzdPF3fXCKG6/M=;
 b=MHsiXUppJXnft/LONs2OO64HxVxF3zUCT2uxy6fSltig0X1Wyade7vxD
 THzTm00TrYfw0kWUgyxshGStVcpvACpoAhC8eXz3Fr6mKKby6xyXWnbS/
 /UVGV8ej+NDryLJAE3WUHjfayTmMPLr1x/fjQHM06GcAJmmyr+hyN/6Pg
 1HWH1BwOPHm9NbLtd1mpeB+PhY21AlppToDZdx8r/zmJhTXBZ0b1/FoYs
 6BFiCkbZjLR/sbb7BoAqxsuyNsPBPLiqUFx93/UrJKfq64xXZBL/g5SI3
 t6INAmn0e02zirlBW1XX2vj9Pdqq7U+5DSPy2Nx3LSKksxxPxRKFyrclL Q==;
X-CSE-ConnectionGUID: WAY6wygsT4WHcwoZuomvXg==
X-CSE-MsgGUID: AT5LBGi0RISjq7Hn1duesg==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71641581"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="71641581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:05:39 -0800
X-CSE-ConnectionGUID: GPyUicEQQuint8t2/KoRMw==
X-CSE-MsgGUID: dEN5V62jSA+wOYa9vDmGHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="211628247"
Received: from jthakur-mobl.gar.corp.intel.com (HELO [10.247.183.166])
 ([10.247.183.166])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:05:38 -0800
Message-ID: <c59bad85-cd6d-4330-9a14-c82fb529dded@intel.com>
Date: Mon, 9 Feb 2026 17:35:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v7,3/3] tests/chamelium: Rename connector_test to
 connector_subtest
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20260203034546.1516152-4-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260203034546.1516152-4-mohammed.bilal@intel.com>
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


On 03-02-2026 09:15, Mohammed Bilal wrote:
> Remove the old connector_subtest macro and rename connector_test to
> connector_subtest everywhere, consolidating on a single macro name
> while keeping the improved implementation that properly handles
> connector iteration and skipping.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
