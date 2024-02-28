Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A704C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 17:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C3910E318;
	Wed, 28 Feb 2024 17:24:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aFNiA3cv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2630810E318
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709141080; x=1740677080;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=iEkFwOY560ORvntPIRRCqj6q3jpge9H9aCojDk7VMVc=;
 b=aFNiA3cvLc7H6olXi8ZIm0H5b6fXfO5uBtlEZb6p4nG8peNuoGP9DsRi
 7aXCPNiykXT763WZpFqDeHPAmDrwq/5uiho4CofFkiC1wfRBPZ6E5bDsv
 i8W7M4ITRjc6+U6lxrvAkujs0Jcm/fZNXan87BDpzzX2YL6nlbPUfk7u+
 iPWKQ3Me+iwIe4ucxNXTHXF1in0bp8H9VUk0a72Ay29ifjafU0ESdnHYj
 POKjuDuw1+AOMwOwQoZvUmOpiS0NUOxf8A4XArMxe0weJRHwQd9F9Y6o9
 Xa4CIri3fA9+HQ+byB+tM3D3G0Rd7HOBaWZSOD2311RxJv+2JUNvWFg2r A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="26021031"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="26021031"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="45027786"
Received: from mshirdel-mobl.ger.corp.intel.com (HELO [10.252.23.117])
 ([10.252.23.117])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 09:24:39 -0800
Message-ID: <dd856958-bc1e-4a5c-9dfe-46104c2e5a37@intel.com>
Date: Wed, 28 Feb 2024 17:24:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] lib/intel_batchbuffer: Add I915_TILING_64
 definition
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
 <20240228145407.370325-2-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240228145407.370325-2-zbigniew.kempczynski@intel.com>
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
> Add Tile64 format previously not defined in igt.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
