Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1964BC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 06:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE2ED10E1C6;
	Thu, 23 Jan 2025 06:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGIy7N7R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495AB10E1C6
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 06:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737613433; x=1769149433;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=BoIKA4rROmm9kiJrVkbYnCjL0VWH5EY8GoKk3DMBAWc=;
 b=LGIy7N7RfjKqVWHjyUX/+eE0DmFhzmTuFjTKjSS9UuxgWSg9782a2yd8
 JfmFhATAM8KXRk2fSZZML12l1SWqM2ZmIlKlSSfct1Js23MAPSr89d8HH
 mn+IQgD4x83DyqGk/d2vgdyDYBTHpg/0wovwQrFkw6X9jDM9XapevRYCK
 rPahH6ATlz3nI1fXqRcpnsEvBKsfAIQmzV6X+Pv0WJhki7UntkhF7sRzs
 iYQuYeNgzxeAgVOjFo6Ti4ljE7aAtDreTcQpnJaLLRQ5SXp0n7otaIFWQ
 pcUGbv2/zuBjE9Bkb0tnJRiJ7zaOwN5vU+63rfsG9gd4HKhgi6cy11Mvq w==;
X-CSE-ConnectionGUID: 7/X0Na/vSLGYAlGBxIOt3g==
X-CSE-MsgGUID: oWcF5HI7TMG1hvQyHeCK+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49513803"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49513803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:23:52 -0800
X-CSE-ConnectionGUID: 05fNZD6eRbeQ9pkXw3f/YQ==
X-CSE-MsgGUID: 5Bk3AJ4nTI2eDpabCM/pZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; d="scan'208";a="107361319"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 22:23:52 -0800
Date: Thu, 23 Jan 2025 00:23:46 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 3/7] runner/settings: Drop extra strdup
Message-ID: <b3i67cnrhinttegakwojidl55gvtlkn3nt5nwiqqpy3b57bwmi@fcvr5opjxjpx>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-4-lucas.demarchi@intel.com>
 <173754566148.5500.17173352214428899355@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173754566148.5500.17173352214428899355@intel.com>
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

On Wed, Jan 22, 2025 at 08:34:21AM -0300, Gustavo Sousa wrote:
>Quoting Lucas De Marchi (2025-01-21 19:57:29-03:00)
>>No need to strdup() again since the fscanf() function is already
>>allocating the variable. Just set the pointer to NULL so we "leak" our
>>variable to be saved in the settings.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>> runner/settings.c | 6 +++++-
>> 1 file changed, 5 insertions(+), 1 deletion(-)
>>
>>diff --git a/runner/settings.c b/runner/settings.c
>>index 13694a51c..96377f1de 100644
>>--- a/runner/settings.c
>>+++ b/runner/settings.c
>>@@ -1164,7 +1164,11 @@ static unsigned long parse_ul(char **pval)
>>
>> static char *parse_str(char **pval)
>> {
>>-        return *pval ? strdup(*pval) : NULL;
>>+        char *ret = *pval;
>>+
>>+        *pval = NULL;
>
>Okay. This explains the need for char **pval in the previous patch.
>Maybe a heads up in #2's commit message would clarify things :-)

yeah, sorry. What about naming it "leak_str()"?

Lucas De Marchi

>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>>+
>>+        return ret;
>> }
>>
>> #define PARSE_LINE(s, name, val, field, _f)        \
>>--
>>2.48.0
>>
