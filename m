Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B570E6816F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 11:05:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D930F10E228;
	Tue, 17 Feb 2026 11:05:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d6McBIBh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2409A10E228
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771326321; x=1802862321;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=4UTLfoSl3mT8VE4cIiAUeTEdV1NJVU6+MFQUT1JCPww=;
 b=d6McBIBh/BmYT2ircEqw5u6qDPVOOTiO8Pp8lvxoB82AM2CWMmrUCbFy
 /zD/maDNhI8jkIcPS1l+W1ksFStRzNW17QsaVHmK6GM5yug/xIdfxbVjZ
 qWi56DN8q7CvbKxaXySYjnl97YJeNTkzxcWXt/LWVfonLOBTpJEcw+cc5
 u3cxNlcrpG6zvVh8dYgGEDfwgInLSpoWjSnQLnjKFjGqkaDBAx1VHSc9K
 lIQBJz2gg+zzW2My1gg5l+r/6rpeDD1a0QrfqRLvdwA4HVGj6VxZ58+uF
 vxTCVZMkWXU09iBWaQipTIv2G4dTDA5CqkFmmKfhoBt/4LqcTGpu0oZYH w==;
X-CSE-ConnectionGUID: SCcGYSdbTIyMrK+u/lig7A==
X-CSE-MsgGUID: 6bH7nIW2Tt+/Q+nccr4qvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="59959127"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="59959127"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:05:07 -0800
X-CSE-ConnectionGUID: YC3M09Z9RlyrBj6rrSasow==
X-CSE-MsgGUID: 84cL62OeS2iKe67TEygNQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="218384499"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.125])
 ([10.245.245.125])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:05:05 -0800
Message-ID: <56487750-bcf1-4cc7-b064-f2d4e6f598ec@intel.com>
Date: Tue, 17 Feb 2026 11:05:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] tests/intel/xe_pat: Use
 intel_get_defer_to_pat_mocs_index() to exercise coherency
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
References: <20260213084603.1404162-1-priyanka.dandamudi@intel.com>
 <20260213084603.1404162-5-priyanka.dandamudi@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260213084603.1404162-5-priyanka.dandamudi@intel.com>
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

On 13/02/2026 08:46, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> With the existing moc indices the render and blit with be uncached on GPU side,
> cached MOCS setting need to be selected specifically for blitter and render.
> Otherwise the caching in the PAT index is overridden which means GPU vs CPU coherency
> will not be exercised completely.
> So, used intel_get_defer_to_pat_mocs_index() for xe2 and above versions
> otherwise keep the existing UC MOCS setting.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
