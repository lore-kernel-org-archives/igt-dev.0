Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F5F9C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 07:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F114C10E274;
	Mon, 10 Mar 2025 07:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PY+uaVN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3EF10E274
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 07:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741590441; x=1773126441;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+LfgiKU8EpJFfDUEXmGYcjU7we8t06F53ji5RKc18M4=;
 b=PY+uaVN+xwWBzEr68DIe62ysQLFm5IsTHYgsNZyh8/CCa5V0vE2QHA/K
 eadBo/I6SLUtre/kIC1xL68X2YTjf6QMLUPnJydsDjz0pAzLUkyqouxva
 0Yu1J5AJDJI2RIrKct1e9bGoMHojM+jcgXks3H3Orqi0koSXOlVpCUueB
 +VXbTmhrbkVQ2XF9mN5T2ML0lEpXAb9PzxEsgD8A9SNkwTFTi9Jk0iDvJ
 xTMFmMicCaHxrSuoy+MziOD+ULpCf20wtzxleIcrDNvweeytvWMf9nfaw
 A8cz6hDZTXKw57x+DvLZxcUUqtjiZJldvk4A+Ix2uDowXQc8UjC+C+IOm Q==;
X-CSE-ConnectionGUID: MOtimMGdQXCdmjCO5dnoYw==
X-CSE-MsgGUID: 63NDq2nKRKW/8QSwdRszIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="60122992"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="60122992"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 00:07:21 -0700
X-CSE-ConnectionGUID: koiAFnQoQzq+8Vh2IrFkmA==
X-CSE-MsgGUID: tUqlmy9NRaqfekBgz9WbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="120064503"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 00:07:18 -0700
Message-ID: <58d922a6-d24e-4b2c-a3da-1de97e2b065c@linux.intel.com>
Date: Mon, 10 Mar 2025 08:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to
 kmemleak and igt_facts
To: vitaly prosyak <vprosyak@amd.com>, igt-dev@lists.freedesktop.org
Cc: vitaly.prosyak@amd.com, christian.koenig@amd.com,
 alexander.deucher@amd.com, jesse.zhang@amd.com, harry.wentland@amd.com,
 zbigniew.kempczynski@intel.com, kamil.konieczny@linux.intel.com,
 ryszard.knop@intel.com, lucas.demarchi@intel.com,
 katarzyna.piecielska@intel.com
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <20250307093426.90479-4-peter.senna@linux.intel.com>
 <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <0ed20d8c-532f-43f2-ac16-82866b641670@amd.com>
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

Hi Vitaly,

On 10.03.2025 04:07, vitaly prosyak wrote:
> Hi Peter,
> 
> Version 8 of your three patches looks good to me. However, I haven't tested them locally.
> Let me know if you’d like us to run them locally ( not CI)

I ran local tests before sending the patches, so I’m confident there are no major issues.
That said, if you’re able to test them locally as well, it would help confirm that
everything is working as expected. I’d appreciate it if you could run the tests.

> 
> Thanks for the improvements!

Thank you for reviewing the patches!

Peter

[...]
