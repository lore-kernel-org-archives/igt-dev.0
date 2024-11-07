Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844BDD5AE6B
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1A510E7BD;
	Thu,  7 Nov 2024 07:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rd6tNbXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130B010E7C6
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730962996; x=1762498996;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HPfjGzRDg7XEPJ62kJ422WQLFHQd7f6pLiJBVQvwgKQ=;
 b=Rd6tNbXLeWbh+iPE0kfgevWLPrSFpHKe8c2fNV9JRHFcn1RcByiqVsyk
 u5AqbmM49Li408nQXd26imO6xhuh1QGqbrIekebhMbf9bglrTuMB1aD+W
 l6KK0aGxRUnNjuDwlSIE+qGOGDpZ8ILL6e19GG18vRVJx9kzL+MEcMMNt
 YoQQEXgvdizWDUXkw3+H4ogr3ARH8f2PiyYA+qdTULe2VJKXwIuJ/kqb1
 jg5IxMdmbkquZRapmzEkLVP9f3SS3pUMBsiqq29SKEgUU5vEb9wqQMo4g
 6j16lBr8Q8AWlOZGrKIDHh8LxXxrL1qPdrKy2mCgMRPNKwjqOuW3Jgp3n A==;
X-CSE-ConnectionGUID: 4f4i7rroRpSLSXeEQpa5tA==
X-CSE-MsgGUID: EJT8DcXXQgWvzipG+LJNog==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="34714598"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="34714598"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:03:16 -0800
X-CSE-ConnectionGUID: 1rQc6mVyQYGd1ZREbJ7jRQ==
X-CSE-MsgGUID: hMwW8WO/TYemC2GcgEqx3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="108236203"
Received: from ogreene-mobl1.amr.corp.intel.com (HELO [10.213.195.176])
 ([10.213.195.176])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:03:14 -0800
Message-ID: <5d8e05af-292f-47df-8eae-433c48365f96@linux.intel.com>
Date: Thu, 7 Nov 2024 08:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] igt-runner fact checking
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, luciano.coelho@intel.com
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <8c573469-ff48-49bf-a3ab-ddcfaef83e95@linux.intel.com>
 <20241106124413.swtucaj5yjj6o3ou@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <20241106124413.swtucaj5yjj6o3ou@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Hi Kamil,

Thank you for your review. Please see my comment below:

[...]

>> diff --git a/lib/igt_facts.h b/lib/igt_facts.h
>> new file mode 100644
>> index 000000000..b649f93b3
>> --- /dev/null
>> +++ b/lib/igt_facts.h
>> @@ -0,0 +1,55 @@
>> +// SPDX-License-Identifier: MIT
> 
> In headers use /* SPDX-.... */

Checkpatch can't decide itself. No matter the format, it complains...

WARNING: Improper SPDX comment style for 'lib/igt_facts.c', please use '//' instead
#70: FILE: lib/igt_facts.c:1:
+/* SPDX-License-Identifier: MIT */

[...]
