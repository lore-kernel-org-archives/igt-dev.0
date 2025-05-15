Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E0AC2D0CD
	for <igt-dev@archiver.kernel.org>; Thu, 15 May 2025 09:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB7E10E7DB;
	Thu, 15 May 2025 09:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b0gtmqza";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576CA10E7D5
 for <igt-dev@lists.freedesktop.org>; Thu, 15 May 2025 09:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747299872; x=1778835872;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=B+Watr6RQoXIIZvYhzRRuMnvBl4x5ZIMkgiRYut+wfM=;
 b=b0gtmqzaM8v7ABlEDv9CrXEbG8TofTx0p4joyzQUo+gNRmahdjOwZfJ3
 T2bx9ssjeQ3YGn15GORbS5G/H6R5cggdVJkPlkdbtdX3w/dtddUhpFDOt
 JIbqLKWbFprfL8ohB7BJhId1v00G8ufHG6QPxBWQqxNU7D9BLPv5mBehn
 pdRqIJ3cauQfB/saDZvRWXZtlRm0TKxzetMmj8marKVQiagalKstnfYUi
 GLKbQ3iNOsTXyHK+PrlATRYO2pFjaTt9oreO2kt59anGZPu+SwGs2UdJL
 d2q0yQOXGAzeUgJCnVxjEdx33BjRVm0yxCf0871hDPr6fgLEnzBMs9HnK A==;
X-CSE-ConnectionGUID: liA6r1aoQb2H76wr+YmD3A==
X-CSE-MsgGUID: 11x+j6DfQkeHUyddE2M+IA==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60237135"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="60237135"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:04:32 -0700
X-CSE-ConnectionGUID: LsIeH9C9QRGPFRLP76Zw+g==
X-CSE-MsgGUID: P8Rr8TQ3RQCcg/xlMa0rAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; d="scan'208";a="138208643"
Received: from amiron-mobl1.ger.corp.intel.com (HELO [10.245.81.154])
 ([10.245.81.154])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 02:04:30 -0700
Message-ID: <659d25f9-e052-4206-b1f9-15fe6a87728d@linux.intel.com>
Date: Thu, 15 May 2025 11:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC i-g-t 2/5] lib/igt_dir_explorer: Add function to recursively
 read all files in a directory
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@intel.com,
 himanshu.girotra@intel.com, aditya.chauhan@intel.com,
 pravalika.gurram@intel.com, sai.gowtham.ch@intel.com,
 ramadevi.gandi@intel.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250514175140.115033-3-peter.senna@linux.intel.com>
 <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <ogha6otctbafhcqe5pokhjszogz6rzm2h7cdpxjssvvpiyf5md@xygjmjrvzcgd>
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



On 5/15/2025 10:51 AM, Zbigniew Kempczyński wrote:
> On Wed, May 14, 2025 at 07:51:34PM +0200, Peter Senna Tschudin wrote:
>> Introduces igt_dir_explorer_read_and_discard_all(), a function that
>> performs a recursive scan of all files within a directory. Each file is
>> read, and its content is discarded.
>>
>> This functionality is utilized in the following tests:
>> - core_debugfs
>> - core_debugfs_display_on_off
>> - core_sysfs
>>
>> This addition enhances the ability to efficiently handle directory
>> traversal and file processing in tests.
>>
>> Cc: marcin.bernatowicz@intel.com
>> Cc: himanshu.girotra@intel.com
>> Cc: aditya.chauhan@intel.com
>> Cc: pravalika.gurram@intel.com
>> Cc: sai.gowtham.ch@intel.com
>> Cc: ramadevi.gandi@intel.com
>> Cc: lucas.demarchi@intel.com
>> Cc: rodrigo.vivi@intel.com
>> Cc: kamil.konieczny@linux.intel.com
>> Cc: katarzyna.piecielska@intel.com
>> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> ---
>>  lib/igt_dir_explorer.c | 72 ++++++++++++++++++++++++++++++++++++++++++
>>  lib/igt_dir_explorer.h | 10 ++++++
>>  lib/meson.build        |  1 +
>>  3 files changed, 83 insertions(+)
>>  create mode 100644 lib/igt_dir_explorer.c
>>  create mode 100644 lib/igt_dir_explorer.h
>>
>> diff --git a/lib/igt_dir_explorer.c b/lib/igt_dir_explorer.c
>> new file mode 100644
>> index 000000000..d47e08535
>> --- /dev/null
>> +++ b/lib/igt_dir_explorer.c
>> @@ -0,0 +1,72 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <dirent.h>
>> +#include <fcntl.h>
>> +
>> +#include "igt.h"
>> +#include "igt_dir_explorer.h"
>> +
>> +void igt_dir_explorer_read_and_discard_all(int path_fd, int indent)
> 
> Just loose thought - if you're doing recursive directory traversal,
> wouldn't be better to pass function (kind of callback) which would be
> called for each file/dir entry? I mean single traversal code, and
> multiple callbacks for different use cases.

I like the idea. Can you help me create a spec for it? There is more than
just what to do. There are cases where we may want to test only specific
files, and cases where we do not want to test specific files. Ideas:
 - Accept a callback that performs the action on each file. Read or write
   for example
 - Accept specification for which files to read, and which not to read.
 - Maybe an optional blocking callback? do not proceed to the next file
   until this one returns. This is useful for an async reset for example.
 - Limits? Depth, number of files, wait between reads?
 - Concurrency? Try read them all at the same time?
 - Random order for doing the action on the file?

Which ones of these make sense, and what else can we customize?

Would it be ok to delay these improvements to a next iteration? There is
some urgency in solving the issues I created with intel_sysfs_debugfs.
