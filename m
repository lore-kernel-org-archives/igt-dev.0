Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66825FC97F3
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1298C10E033;
	Mon, 30 Mar 2026 15:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTsvvpKr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B338410E235
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774882936; x=1806418936;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AS8ZP54gO/KTGG0Bl2LEpbkjC7SW7pKcK0b7uf3Z/DA=;
 b=jTsvvpKr41s+Jx4lHdylLvuf9XIjtmFXgYCPGnRHBSeMgr1o6neYrCFQ
 w48faKDoJAr8kVq+AihPUFNUmxU+EttDgoZETr6Ra+3iHx+sh+yI72xdx
 HnlZ9LTSb+F7Wh9WxgAE9Y6Quk5lCpRQDrB4BFTf8eeHcvCyzZ27sucHO
 KVdEZ5bO9HaXoQNksBUqV5DhLEoJFzzxMANBz04E1X2jOW0oMU1otrKKe
 UjihZ+w6LloVuGMnoo3gOVMDCZUyuhwDU5DHhIiQx9e7IS6xU4APOiJk5
 uxpYAP6Dh1yiDxpIgJvsx0fdhiowHIZ7CLKcYLXMv33kOhkvT5QJcLpd0 w==;
X-CSE-ConnectionGUID: N/LlfInATlif7C2GVVGyFw==
X-CSE-MsgGUID: vAmqKko/TI25gHaZG/zdBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79480019"
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="79480019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:02:15 -0700
X-CSE-ConnectionGUID: 5rC2DA3TQ9G+a9nfPJjgcA==
X-CSE-MsgGUID: noLPWAOMSi+m1h7huCKTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,150,1770624000"; d="scan'208";a="219430963"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.245.123])
 ([10.245.245.123])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 08:02:13 -0700
Message-ID: <fc3548a3-25a4-42cf-94ba-86b7a9245d60@intel.com>
Date: Mon, 30 Mar 2026 16:02:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 4/5] tests/xe_pat: Verify PTA PAT entries contain
 expected values
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20260330144032.1954771-7-zbigniew.kempczynski@intel.com>
 <20260330144032.1954771-11-zbigniew.kempczynski@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260330144032.1954771-11-zbigniew.kempczynski@intel.com>
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

On 30/03/2026 15:40, Zbigniew Kempczyński wrote:
> Debugfs exposes PTA PAT entries for different GTs so verify they
> contain expected values. Verify they are correct also in reset
> and suspend scenarios.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

