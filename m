Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B375BC7883B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 12:57:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD3D10E835;
	Fri, 20 Sep 2024 12:57:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlJiozuV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D06010E833
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726837042; x=1758373042;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ApIpHGU1WLH7KoH87aGHj4TecIHQgnabtnr0oU/Jxfs=;
 b=jlJiozuVRLMhr0xXvFqm1q3UEsAsPWIefr57Xeleo6oHnSRPdRaXlH3x
 07DDXZX+dKpgpG4RAFDGyQiL8sAWvhB+5xs2hXbWvrObdt62+qwZzaYkX
 NBG50Ej/toMbnqocUgtuENDf2j6hXEG8AXNQ/EG7cKujAfTHFd5Gdpsdx
 RT+FEZFHx8+xLkuezuE25glZuEvW5ExL7JLE6ZWMoy5OesXbTYEf6qM5V
 +72lvpM9zXTLmyYhW5/5m1Umjd7LQXKycGco+df4+LqtwMuaPfOpfI+eH
 zKBPNti085H5XrxlB7qao6u4/VULoueT7tQCgLEf70DG0tYmASyIYPzxX w==;
X-CSE-ConnectionGUID: p8TJUHLLScab13vAlCUSnQ==
X-CSE-MsgGUID: Vky8K4EDSkG1msMJD2LRfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43312076"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43312076"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 05:57:22 -0700
X-CSE-ConnectionGUID: t0RirV2SQMWyS8uBoosjFw==
X-CSE-MsgGUID: ZtTmOP9fTIuxKfBK+yyVNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="101121554"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO [10.245.246.188])
 ([10.245.246.188])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 05:57:18 -0700
Message-ID: <9dc49f36-4a59-4503-83e7-aed67a305017@intel.com>
Date: Fri, 20 Sep 2024 14:57:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 00/16] Test coverage for GPU debug support
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Jan Sokolowski <jan.sokolowski@intel.com>,
 "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
 <857cb77c9n.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <857cb77c9n.wl-ashutosh.dixit@intel.com>
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

Hi Ashutosh,

On 19.09.2024 20:02, Dixit, Ashutosh wrote:
> On Wed, 18 Sep 2024 04:30:01 -0700, Christoph Manszewski wrote:
>>
>> Hi,
>>
>> In this series the eudebug kernel and validation team would like to
>> add test coverage for GPU debug support recently proposed as an RFC.
>> (https://patchwork.freedesktop.org/series/136572/)
>>
> 
> Something got merged from this series but seems there are a bunch of
> warnings. Please fix.
> 
> $ ninja -C build
> ninja: Entering directory `build'
> [427/1905] Generating lib/iga64_generated_codes.c with a custom command
> iga64 assemblies not changed, reusing pre-compiled file ../lib/iga64_generated_codes.c.
> [1899/1905] Generating docs/testplan/xe_tests.rst with a custom command
> xe_exec_sip_eudebug.testlist: Testlist file not found.
> xe_eudebug_online.testlist: Testlist file not found.
> xe_eudebug.testlist: Testlist file not found.

These were removed by 'scripts/test_list: Don't log missing testlist' 
(for not compiled tests).

> INFO: Found documentation for 'xe_eudebug_online' but no binary
> INFO: Found documentation for 'xe_eudebug' but no binary
> INFO: Found documentation for 'xe_exec_sip_eudebug' but no binary

This is an info log, that was added by Kamil's patch (which I slightly 
modified).

Thanks,
Christoph
