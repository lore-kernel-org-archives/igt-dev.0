Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32466C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 14:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9A11324D;
	Wed,  6 Mar 2024 14:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RUgHt4tl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C09611324D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 14:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709736457; x=1741272457;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ZZ7V51Lse9WWfVnn4p7DBIUp+qmWv/LwuxPLHRcsr1U=;
 b=RUgHt4tl+T02SqiGiwTwP2CS2PKtsYO34IJZx757QMBdtqorQ/LSCAsB
 4CtWw7GF+3LUkPOA5KbKShhdhwJtSZOeyj7xQM03blCMxMt06S2cVjiMO
 7zmdJUOn+o23xzLZ2Kh64pwbyOkT6Myc7SsEYpfLak1goxBDvJl9axZeb
 vMEstxogX+kpS1xvSwHS04JPBwJJJV603exc4bojs9+gBrzgk8NBaN6Dr
 aqE8V2RGcRnNJr3qXSI5A7fPi6DPtzEE51HTvhFxFahH4DUMseu4V0LzL
 qZCpRYXstp2CTBMmNtdclltpVIaP4A7FL5w0Ji9wAFc73+uQzoFJLD51i g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="15761912"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="15761912"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="10198482"
Received: from dawidzix-mobl1.ger.corp.intel.com (HELO [10.249.140.92])
 ([10.249.140.92])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 06:47:36 -0800
Message-ID: <f9fda386-de6f-4a69-9873-b058896ae9eb@intel.com>
Date: Wed, 6 Mar 2024 14:47:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/rendercopy_gen9: Add Tile64 support for
 render-copy
Content-Language: en-GB
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240305054056.139691-1-zbigniew.kempczynski@intel.com>
 <20240305054056.139691-4-zbigniew.kempczynski@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240305054056.139691-4-zbigniew.kempczynski@intel.com>
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
> Refactor a bit handling different tilings in render-copy pipeline
> and add Tile64 which I want to exercise in xe_render_copy test.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>

