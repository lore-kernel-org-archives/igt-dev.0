Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36386C54798
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4468112A9F;
	Tue,  5 Mar 2024 12:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPvVHU2i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C000C112A9F
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709642595; x=1741178595;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=uS4yZ+mM4mTs/TfaZYfurTkhxdqiIpeItbfktjp3dxw=;
 b=cPvVHU2iNJIMetQIh55hy8e0CYX4vNfWL94kfFLgwHhoAT7fFrRtZ2n9
 bW1+HgNP8cE8s3GvkFJ4MQgLVxK9p09bJD9QFHpynR3Gw4IVQE2tTcGUB
 NW1+AMplJ4Tb43yuc9C7BafFVp2lLUMZnAgMWadPdDWHUH+QY45Tbq9O/
 db1RJYRNidN0R8DiSM1ya3YG50mgcOY8ffWe3jiyETdRG5D/CaKlz99q6
 z/nesT06G3g4E6D/CMdNExRs3HOnnz+puQcjbUbEKZgsznnOrcuG8NefO
 /yz92xARWeiOBMsHyKud0/Euh0E8DLPuk5WiVSpbOy9y42XM7lPLp3CrU A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15331171"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15331171"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="40256410"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO [10.249.140.91])
 ([10.249.140.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:43:13 -0800
Message-ID: <5bc0a073-2388-4011-9eca-a1f30115a0db@intel.com>
Date: Tue, 5 Mar 2024 12:43:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/4] lib/intel_bufops: Use printf style filename
 formatting
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
 <20240305054056.139691-3-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240305054056.139691-3-zbigniew.kempczynski@intel.com>
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

On 05/03/2024 05:40, Zbigniew Kempczyński wrote:
> Dumping to png where we want to pass width, height and/or other
> values is much easier when we use printf style filename formatting
> instead preparing string with filename separately. Replace current
>   write to raw png from single string to string formatting.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

