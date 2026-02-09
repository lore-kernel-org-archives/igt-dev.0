Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF013E81BA8
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 12:04:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9470D10E3CC;
	Mon,  9 Feb 2026 12:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoNTdlku";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE1710E3CC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770638662; x=1802174662;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kD0C5dwGNvWfuc48kYmMVdhlMxaeZRZNVwow/RDHiVA=;
 b=MoNTdlkuPK6v+ATwDzmDhczJdMdbvCqkfm9+LgaAasjMdlJtyfN4Xe3g
 1zKtdeUkdHANhGOt0ibbLVMOuJhm2jVau1/sbONTdp0XYI9VkVKLhf+dq
 s7BPQn96n+TyT+IPBu8JqckKUxfTLf+88DdprIJ00ZVpl2HWgMApamgDG
 r5dpKqYPuMyq8yYdtVkdGhpMSCOcf00VaNprpW8vKlSk0WX3Y/1xD5SmT
 P+dVOeAlR33GfRx5omlNF0IS0UeSxZOCGflqVrI/nHUCJAJGLsgUPAzSw
 zX2NyvWFRdr33tXA9fopeaO9jk5TW7HBSjN1oZH8F5hdY+9bTORmYRKd0 w==;
X-CSE-ConnectionGUID: eDb1p5KVSbSe3Cl/B0jKcw==
X-CSE-MsgGUID: 752Ctv48S+SoZAURP3QomQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="83118492"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="83118492"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:04:21 -0800
X-CSE-ConnectionGUID: mzhfZoqGQD6Vujte0tXl5Q==
X-CSE-MsgGUID: hIvfVNzaQwO2PJKpjYfM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="210874714"
Received: from jthakur-mobl.gar.corp.intel.com (HELO [10.247.183.166])
 ([10.247.183.166])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 04:04:19 -0800
Message-ID: <9f0a5b0c-e154-4eab-9b87-048ce6b9f8e7@intel.com>
Date: Mon, 9 Feb 2026 17:34:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v7,1/3] tests/chamelium/kms_chamelium: Add
 connector_test() macro
To: Mohammed Bilal <mohammed.bilal@intel.com>, igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, sameer.lattannavar@intel.com
References: <20260203034546.1516152-2-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260203034546.1516152-2-mohammed.bilal@intel.com>
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
> Introduce a unified connector_test() helper macro that iterates over all
> matching connected ports and executes tests accordingly, ensuring clean
> skipping when no matching connector is present and avoiding unintended
> fixture execution.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
