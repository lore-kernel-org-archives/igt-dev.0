Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71504E7717F
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 18:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1270210E421;
	Tue, 17 Dec 2024 18:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqcqcDi4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843D510E421
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 18:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734458635; x=1765994635;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=Up7Jvz/v1kLznnpjjKJSaAP1Eb5OXD1WAbfll6z8WvE=;
 b=XqcqcDi4XdwyqIOPosCCj6CSt62FL9tqfGikcQbO8QxJK5eZ5lIG/vpQ
 wZF9MIAzo8kwn3NExv/lQlfeNHz2Dkv0q6D4UR/NW1GJm5clHU21IzWiV
 QDLEfg8U/V42bxHieZkSNYhmuIA2eckMH7uRsnfaDAVmv4Vx+a28Yul5s
 +3t4e2v98o4qmsi5npdc7OvWfDYJnCgVXHGgeoajWpGCliksux0hT+jNW
 t5JXoWmy5eYQ9+QiEGoC5nDMXE1T2L5GpSMm4QxIWrJ8322IgveCZIz14
 e2IhNnYfMcq8HGOQIkxDbYr9wzjadRC4BWuBsoi3yXQlN3BN/ZfsEvSVG Q==;
X-CSE-ConnectionGUID: p0vQu5zyS26t9FxN/tH6Ag==
X-CSE-MsgGUID: SHeKXjQPSQCYYxYaV4L+Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38837027"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38837027"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:03:55 -0800
X-CSE-ConnectionGUID: icM8lOJ/TS+0zdhXXPob+g==
X-CSE-MsgGUID: Q7yPG/aVSZKdF5hEECCAsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102680353"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.153])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 10:03:55 -0800
Date: Tue, 17 Dec 2024 12:03:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <xftmhtseiintjbu3z7gkel6233bghjtagumlyamwox2yp2athh@m7fxvnl6cf7a>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
 <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
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

On Tue, Dec 17, 2024 at 05:47:44PM +0100, Kamil Konieczny wrote:
>Hi Zbigniew,
>On 2024-12-17 at 11:58:07 +0100, Zbigniew Kempczyński wrote:
>
>please improve subject, imho better something like:
>
>Avoid overflow in micro/nano-seconds calculations
>or
>Fix overflow in micro/nano-seconds calculations
>
>or propose yourself one line description.
>
>> Multiplication without using casting to long (long) for at least
>> one argument in expression may cause overflow especially when we're
>> using this for calculating timeouts in nanoseconds precision.
>>
>> Ensure we're picking valid ul/ull suffix for base definitions for
>> all dependents.
>>
>> Reported-by: Ilia Levi <ilia.levi@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
>>
>
>I agree here with Lucas, remove this empty line.
>
>> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Ilia Levi <ilia.levi@intel.com>
>> ---
>>  lib/igt_core.h | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_core.h b/lib/igt_core.h
>> index 90f57402f0..1b6e70182b 100644
>> --- a/lib/igt_core.h
>> +++ b/lib/igt_core.h
>> @@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
>>  #define le32_to_cpu(x)  (x)
>>  #endif
>>
>> -#define MSEC_PER_SEC (1000u)
>> +#if __WORDSIZE == 64
>
>I am not sure if this is defined on all platforms where igt
>is compiled, on musl and on non-Linux like FreeBSD,
>why not make #ifndef/#define/#endif for __WORDSIZE ?

because if it's not defined, how are you going to decide which side of
them to use?

from the tools/  include in kernel, one could do

#ifndef __WORDSIZE
#define __WORDSIZE (__SIZEOF_LONG__ * 8)
#endif

another possible solution is checking ULONG_MAX, like in dnf:

https://github.com/rpm-software-management/libdnf/pull/1159/files

but I think the kernel one is cleaner.

Lucas De Marchi

>
>BTW is it just sizeof(1ul) == 8 ?
>
>With this fixed and subject improved
>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>Regards,
>Kamil
>
>> +#define MSEC_PER_SEC (1000ul)
>> +#define USEC_PER_MSEC (1000ul)
>> +#else
>> +#define MSEC_PER_SEC (1000ull)
>> +#define USEC_PER_MSEC (1000ull)
>> +#endif
>> +
>>  #define USEC_PER_SEC (1000u * MSEC_PER_SEC)
>>  #define USEC_PER_DECISEC (100u * MSEC_PER_SEC)
>>  #define NSEC_PER_SEC (1000u * USEC_PER_SEC)
>> -#define USEC_PER_MSEC (1000u)
>>  #define NSEC_PER_MSEC (1000u * USEC_PER_MSEC)
>>
>>  #define for_if(expr__) if (!(expr__)) {} else
>> --
>> 2.34.1
>>
