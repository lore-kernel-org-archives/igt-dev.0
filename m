Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CCBD5AE6E
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429E310E305;
	Thu,  7 Nov 2024 07:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+6+rE1r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B0D10E305
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 07:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730963937; x=1762499937;
 h=message-id:date:mime-version:subject:to:cc:references:
 in-reply-to:from:content-transfer-encoding;
 bh=i/mFgPrvIOOKC23hG0PkI0hWuDEDIH/TTjNXBYwbKGQ=;
 b=g+6+rE1rCFhoaPo26gkg0/QLWUDSj9nTnILWBs4vdr8oYQFQk2iH4bF6
 2a0qfymqqs+HH0iO5QkJZdXZ5jjcYv7QObYAMzZMSGratJQhPjXen59Cb
 gQDXEECB+VN1gYIC8be3rkwm1NTr3Z4/Sm4BZLIDzQah318LRuHyP9AQ0
 S2QGEimGUgsIPaiJmN2Bsdv48yBR5JvGlexbg3TMoigx6HHtKoPBh0rPs
 guz/wlLdGOxeUnANzsszcJnK9/5DeENZDetsQ1p6SkUh8P0MRgvh/Z7sR
 DfBT0mFLZB2F7e54uW20QjWVjX3ySpLCK2QdiLLi34DD0soADrPJzhBcE w==;
X-CSE-ConnectionGUID: fGAJ+lXrTEStI0f+zsggSQ==
X-CSE-MsgGUID: XLERmbVURpima6NPmtvgKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34488449"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="34488449"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:18:56 -0800
X-CSE-ConnectionGUID: KFGAncZzR12QfIaWEx4pRA==
X-CSE-MsgGUID: MxDSkZduRiyV+6lklclLnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="84933049"
Received: from ogreene-mobl1.amr.corp.intel.com (HELO [10.213.195.176])
 ([10.213.195.176])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:18:55 -0800
Message-ID: <8029d6ce-2d38-40a6-a574-00b6607805d8@linux.intel.com>
Date: Thu, 7 Nov 2024 08:18:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] igt-runner fact checking
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <tmbhd2nam5xibqejlcpqo53zeiv543jkfokfh4yly63yjhpqf7@ruf6limclqyh>
Content-Language: en-US
In-Reply-To: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
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

Hi Lucas,

Thank you! I somehow missed your message, so V3 went out before I read it. Please see my comments below and let me know how to move forward.

Thank you!

On 06.11.2024 15:13, Lucas De Marchi wrote:

>> diff --git a/lib/igt_facts.c b/lib/igt_facts.c
>> new file mode 100644
>> index 000000000..90b362c5e
>> --- /dev/null
>> +++ b/lib/igt_facts.c
>> @@ -0,0 +1,443 @@
>> +// SPDX-License-Identifier: MIT
>> +
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice (including the next
>> + * paragraph) shall be included in all copies or substantial portions of the
>> + * Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
>> + * IN THE SOFTWARE.
> 
> we shouldn't be copying this in new files. Just SPDX + Copyright is
> sufficient.
Fixed in V3.
 
>> + *
>> + */
>> +
>> +#include <stdio.h>
>> +#include <glib.h>
>> +#include <libudev.h>
>> +#include "igt_core.h"
>> +#include "igt_kmod.h"
>> +#include "igt_facts.h"
>> +#include "igt_device_scan.h"
>> +
>> +
>> +/* Report new facts and fact changes
>> + * - new: new_value is NULL
>> + * - change: new_value is not NULL
>> + * - delete: delete is true
>> + */
>> +static void report_fact_change(igt_fact *fact, const char *new_value,
>> +                               const char *last_test, bool delete)
>> +{
>> +    struct timespec uptime_ts;
>> +    char *uptime = NULL;
>> +
>> +    if (last_test == NULL)
>> +        last_test = g_strdup("before any test");
> 
> why are we using glib? I only see functions that could be replaced by
> libc like strdup() and asprintf()

The why is "safety", but I dropped this in V3 as I made a mistake: last_test is static for a good reason.


[...]

> 
>> +
>> +void igt_facts(igt_fact_list *list, const char *last_test)
>> +{
>> +    scan_pci_for_gpus(list, last_test);
> 
> ok, this uses udev to scan for vga/display
> 
>> +    scan_pci_drm_cards(list, last_test);
> 
> this seems rather to be scan_drm_cards, i.e. any device that has a
> loaded driver registered with drm subsystem. This would also show
> vgem, usb, etc

Nah, I ask udev to give me only drm cards that are associated with PCI GPUs. I tested in a place where we have a drm card for a GPU that is a platform device and the code(V2 at least) ignores it. How can I test vgem, usb, etc?

> 
>> +    scan_kernel_loaded_kmods(list, last_test);
> 
> 
> So... igt_facts() hardcodes what is the info collected. Maybe we
> should rather plug this into the hooks framework as part of
> "built-in hooks".

I do not follow what you are trying to communicate here. Also, please see what Zbigniew said here*. Facts are not test requirements, but the line is blurry. In the context here a fact is something in the environment that can change but that should not. An example is the disappearing GPU.

So I suggest we start with the hardcoded simple code to assess the potential value of these facts. If the facts turns out to be useful in helping us debug corner cases, then we evaluate how to extend it.

Any other fact you want to add? Asking because I miss this code in our CI to debug two issues that are on my queue...

> 
> This way it's easier to control what and when info is collected,
> allowing developers (and CI) to pick and choose what gets executed.

The original idea was to have static and dynamic facts. The dynamic idea suggested a convenient mechanism for each test to define facts as needed. Zbigniew did not appreciate the potential to bloating.

> 
> +Gustavo
> 
> Lucas De Marchi

* - https://patchwork.freedesktop.org/patch/621849/?series=140566&rev=1

