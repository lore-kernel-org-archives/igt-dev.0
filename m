Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A2BC531DC
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 07:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C413B10E41C;
	Wed, 14 Aug 2024 07:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fN0gpC+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7642010E41C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723619486; x=1755155486;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=waHZalODXWTFhGqfB9/WY75xWQKQqc9aoVb0fI9DBOo=;
 b=fN0gpC+OvcAVwQ+LF3mP6DJ8M1ulEEI9hKJSsfnfx33OAfAFGAQQXhiV
 VEhp22pmZONnzeowgt2DBQIXe8A7ms/jUIYLUfjbBQXcJU14MDJ3jIghj
 kp7+MCod05+KASf3+RXbDWxBRMslq3gxDECsZUWQeHGyfI3ww0/C4Ie3u
 uiinBZx9Y2vA9zNcimcDcCTyFOuTL4EzRlp7/ya4t5HMWMUpnsNPghVaC
 kuH2PryeMa6MzkUtMMOSTd5bMzQ3qDdD//GNZ0BtyPKBKo2D9tdcgcBwF
 x4BeH9RF2mfGKuCx1hxmUxpIMGMy3SMPbfW0OtcF+RG+ES7w9XEIUnsDW g==;
X-CSE-ConnectionGUID: lD440RVeTBKQqP6DvDUcoQ==
X-CSE-MsgGUID: Pvwluz84TIScheJTUNlVxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32442405"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="32442405"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 00:11:26 -0700
X-CSE-ConnectionGUID: Q+BGgKbdQvuXwrCMxIzriw==
X-CSE-MsgGUID: GkQFXGNyQ7S9mQ9ZCrdZkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; d="scan'208";a="58557840"
Received: from sbeckman-mobl.ger.corp.intel.com (HELO [10.251.219.110])
 ([10.251.219.110])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 00:11:25 -0700
Message-ID: <b2fba84c-281e-4d0c-ae4f-0e5542a0de19@linux.intel.com>
Date: Wed, 14 Aug 2024 09:11:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib|tests: Don't dereference engine outside
 for_each_ctx_engine macro
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240813124536.66551-1-zbigniew.kempczynski@intel.com>
 <e4d675ba-944b-4aa2-9803-edadb2b2f403@linux.intel.com>
 <20240813135652.2jhw2edamqjpvk3d@zkempczy-mobl2>
 <e53f5016-c1ea-4401-91e2-efd025bde585@linux.intel.com>
 <Zru5TDSV47bEHjmo@ashyti-mobl2.lan>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <Zru5TDSV47bEHjmo@ashyti-mobl2.lan>
Content-Type: text/plain; charset=UTF-8
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



On 13.08.2024 21:51, Andi Shyti wrote:
> Hi Peter and Zbigniew,
> 
> On Tue, Aug 13, 2024 at 04:12:30PM +0200, Peter Senna Tschudin wrote:
>> On 13.08.2024 15:56, Zbigniew Kempczyński wrote:
>>> On Tue, Aug 13, 2024 at 03:36:50PM +0200, Peter Senna Tschudin wrote:
>>>> Please do not apply this patch. I am working on a proper fix.
>>>
>>> Applying fix stops you from working on a your fix?
>>
>> Please do not fix a pothole just before I replace the road.
> 
> The patch is correct and Zbigniew's fix looks straight forward.
> 
> What is your fix aiming at? Can it go on top of this one?

Please ignore this. I have reviewed and compile tested the patch. Sorry for the noise.
