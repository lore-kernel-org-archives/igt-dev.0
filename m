Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69D2EE49BC
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 14:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6378910EA2F;
	Wed, 11 Sep 2024 14:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ie2e/TAW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1023410EA2F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726066214; x=1757602214;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=VPQW8guk9mEni1vn7yurV/UlZCi5obqRc/aGX8Rn4eQ=;
 b=ie2e/TAW7yLqd6aabB7HLtBzcbjAOY+vDH6vabAN+2P8oryk9IcDWVyM
 L0YO/u+PsLoBN2ZLzylUd+EyXHbQDqThC0w75LfEIMQ1+xuxdSAwq7Bwa
 hCdLtx9KROlnGUr22EcI6UoP16abl1tcbnUWYy3dC2oGyPEA1/Up7uBnQ
 CFzoqrCMt6xIqCmz5TU5lKE5tdTvltdSQZN+cgAmUFnBdoE6EE5uHGirm
 3qAp+zmNjM0jnTN/zJPl8OdFAw9xcx2rtfhW8SDTOtPlOs9pC1O9STOPN
 AsBMbkOLGy9KKmLt5NiPWU+CStrcCkcVchkbEJkV91VCOIJzPNwalC2Y3 Q==;
X-CSE-ConnectionGUID: Hhf2T01BSEWDbfnABq+2Fw==
X-CSE-MsgGUID: TcFPGaxgR/ieRqXBXpfEFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="35465469"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="35465469"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 07:50:13 -0700
X-CSE-ConnectionGUID: tVlSQzhsTSy48n/o5so07A==
X-CSE-MsgGUID: z84iGDP4TE6BK/vzVN3S9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="67900793"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.245.84.149])
 ([10.245.84.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 07:50:11 -0700
Message-ID: <8273c690-6371-44f9-ad0c-58021fad6062@linux.intel.com>
Date: Wed, 11 Sep 2024 16:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/xe/xe_mmio: Fix assertion logic in
 xe_mmio_vf_access_init
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 K V P Satyanarayana <satyanarayana.k.v.p@intel.com>,
 C V Narasimha <narasimha.c.v@intel.com>
References: <20240904084701.186664-1-marcin.bernatowicz@linux.intel.com>
 <20240904084701.186664-3-marcin.bernatowicz@linux.intel.com>
 <20240909154845.gab7r5u7qv72lrxp@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20240909154845.gab7r5u7qv72lrxp@kamilkon-DESK.igk.intel.com>
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

Hi,

On 9/9/2024 5:48 PM, Kamil Konieczny wrote:
> Hi Marcin,
> On 2024-09-04 at 10:47:00 +0200, Marcin Bernatowicz wrote:
>> Ensure igt_mmio is not null before proceeding.
>>
> 
> Please change order of patches in patchseries, first fixes
> then addition of new test(s). Or this can be changed at merge
> or I could merge patches 2/3 and 3/3 first?

Please ignore the test patch. We need just the fixes to be merged.

> 
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
>> Cc: C V Narasimha <narasimha.c.v@intel.com>
>> ---
>>   lib/xe/xe_mmio.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
>> index 57526d7cb..3e42b2e1c 100644
>> --- a/lib/xe/xe_mmio.c
>> +++ b/lib/xe/xe_mmio.c
>> @@ -25,7 +25,7 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
>>   
>>   	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
>>   
>> -	igt_assert(!mmio->intel_mmio.igt_mmio);
>> +	igt_assert(mmio->intel_mmio.igt_mmio);
> 
> Good catch, there is also "bool safe" in that struct,
> it could help to document the meaning of this field.

I guess it has to do with

* @safe: use safe register access tables

description to intel_register_access_init

> 
> LGTM
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> 
Thanks for review
Marcin
>>   
>>   	mmio->fd = pf_fd;
>>   	mmio->intel_mmio.safe = false;
>> -- 
>> 2.31.1
>>

