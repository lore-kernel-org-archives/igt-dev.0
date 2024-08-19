Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A0BC52D6F
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 15:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 227A910E2C6;
	Mon, 19 Aug 2024 15:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4ptWKuy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC9510E2C6
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 15:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724081472; x=1755617472;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=sWTz3QNeIgXCgWmCzHPyt1Rf/fKnNgFKXxXPoZtsAPA=;
 b=O4ptWKuy4e533u6DlfEqd57mJYdpYC0H7B0ortNgB5962+xe1p+ZT+1D
 OJKdg+dpAjVKeVve8s6Cyrj/3Ch5a+vjCZRQzadjHqOFe6VrLfDKjhUnc
 moUBeL2NPKkOMwh6Fs3Jrebxo2x0MAgDm2ldBedu1Cl0wNCPEjdfI29pw
 cw17vZyLwWILeDrwgAwGvsUO6OrA1anna0PPKBnJI1keW1Uzu4/Q63jQ5
 r2AabD3EQgwPOmXcG84DfKintpAtX9fUXkCkA9AWxdslpKG4gWcir6Fbh
 NWMGL/V9t2aCy9QdKo+TuQLeNQO8FYEihcZlsQudvYeHAWbI8Wol+JsKU g==;
X-CSE-ConnectionGUID: ztKRyQC4RWipDopo12h9qQ==
X-CSE-MsgGUID: qMmoaE+YQLCZ8nn52JA/9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22181959"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="22181959"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:31:11 -0700
X-CSE-ConnectionGUID: mgaKI833TcyhlMLH6B8V6Q==
X-CSE-MsgGUID: zGdB3wpjTLWm/Ks5/pXhQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; d="scan'208";a="60982584"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.246.81])
 ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 08:31:08 -0700
Message-ID: <5432f094-db2c-4a95-ba56-7e91ef6fc100@intel.com>
Date: Mon, 19 Aug 2024 17:31:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 13/14] tests/xe_eudebug_online: Debug client
 which runs workloads on EU
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
References: <20240809123813.109365-1-christoph.manszewski@intel.com>
 <20240809123813.109365-14-christoph.manszewski@intel.com>
 <20240809143844.qwmrhabypfgpubxh@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240809143844.qwmrhabypfgpubxh@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On 9.08.2024 16:38, Kamil Konieczny wrote:
> Hi Christoph,
> On 2024-08-09 at 14:38:12 +0200, Christoph Manszewski wrote:
>> From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>>
>> For typical debugging under gdb one can specify two main usecases:
>> accessing and manupulating resources created by the application and
>> manipulating thread execution (interrupting and setting breakpoints).
>>
>> This test adds coverage for the latter by checking that:
>> - EU workloads that hit a instruction with breakpoint bit set will stop
>>    halt execution and the debugger will report this via attention events,
>> - the debugger is able to interrupt workload execution by issuing a
>>    'interrupt_all' ioctl call,
>> - the debugger is able to resume selected workloads that are stopped.
>>
>> Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
>> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
>> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
>> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Signed-off-by: Kolanupaka Naveena <kolanupaka.naveena@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 2203 +++++++++++++++++++++++++++++++
>>   tests/meson.build               |    1 +
>>   2 files changed, 2204 insertions(+)
>>   create mode 100644 tests/intel/xe_eudebug_online.c
> [...cut...]
> 
> Please use checkpatch.pl from linux kernel, watch out for
> whitespace errors, unbalanced braces '{/}' in if...else
> and few other problems.
> 
> A few useful options for checkpatch.pl are in CONTRIBUTE.md

Thanks, I will address these issues in the next revision.

Christoph

> 
> Regards,
> Kamil
> 
