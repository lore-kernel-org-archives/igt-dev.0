Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01723E77184
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 19:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0F510E65E;
	Tue, 17 Dec 2024 19:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHiIzgAS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB6210E65E
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2024 19:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734465503; x=1766001503;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=cESruD8/6AzHP+lS1snV1iBTAK/JhZPGIojNTajdHT4=;
 b=VHiIzgASsdtxw7VqRznQ8fsmAKt17v62oj7lRbSSD1TkMLnqzHRl/y9u
 coOekzatPMRC/T50lF86s5jnlcmc60onmXh8nljtel9dOEhi2J1q2Lc/U
 tnfOoQOK22lj1CyMwvAcZt0vRojynfxn+mO1PCo9fPVQJKZI2gLUARTyI
 CUxnnEEyOOcjSZ7ZphYEC5+AV12RBlSeFrD7LliDb83z+Hl0Y7snJj+D5
 pUZ3eRyD1CGSccVEnl1aCMhRWcKPidqxY5jsY2wZl0T6EAG+nW1ZsXphM
 JT+D2Z6ZyQCrZEry003P+hgXHT3XObTeofVHqRw2gkkwkW4eJlhXL/AWV A==;
X-CSE-ConnectionGUID: mcKn8QwVRgmg7+OBXixyfQ==
X-CSE-MsgGUID: ZcRFY1BRQ7WKAzn10qlyTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45915969"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45915969"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:58:23 -0800
X-CSE-ConnectionGUID: YpQSISGXRdSK5KV6ZZU61A==
X-CSE-MsgGUID: IrphJhwGQE2FWO3lBj60nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128613684"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.111.153])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:58:22 -0800
Date: Tue, 17 Dec 2024 13:58:17 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org, Ilia Levi <ilia.levi@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_core: Use suffix for casting to long to
 avoid overflow
Message-ID: <lfyc2nvvs6zrrprc2stzdaubx523uxkfhdeaykwt2o7m5c74tz@p4fwfgsxzcm5>
References: <20241217105807.94489-1-zbigniew.kempczynski@intel.com>
 <20241217164744.3phx2iddfzl3xwds@kamilkon-desk.igk.intel.com>
 <xftmhtseiintjbu3z7gkel6233bghjtagumlyamwox2yp2athh@m7fxvnl6cf7a>
 <20241217191747.47pdi56ikddqkvff@kamilkon-desk.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217191747.47pdi56ikddqkvff@kamilkon-desk.igk.intel.com>
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

On Tue, Dec 17, 2024 at 08:17:47PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-12-17 at 12:03:49 -0600, Lucas De Marchi wrote:
>> On Tue, Dec 17, 2024 at 05:47:44PM +0100, Kamil Konieczny wrote:
>> > Hi Zbigniew,
>> > On 2024-12-17 at 11:58:07 +0100, Zbigniew Kempczyński wrote:
>> >
>> > please improve subject, imho better something like:
>> >
>> > Avoid overflow in micro/nano-seconds calculations
>> > or
>> > Fix overflow in micro/nano-seconds calculations
>> >
>> > or propose yourself one line description.
>> >
>> > > Multiplication without using casting to long (long) for at least
>> > > one argument in expression may cause overflow especially when we're
>> > > using this for calculating timeouts in nanoseconds precision.
>> > >
>> > > Ensure we're picking valid ul/ull suffix for base definitions for
>> > > all dependents.
>> > >
>> > > Reported-by: Ilia Levi <ilia.levi@intel.com>
>> > > Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/163
>> > >
>> >
>> > I agree here with Lucas, remove this empty line.
>> >
>> > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > Cc: Ilia Levi <ilia.levi@intel.com>
>> > > ---
>> > >  lib/igt_core.h | 10 ++++++++--
>> > >  1 file changed, 8 insertions(+), 2 deletions(-)
>> > >
>> > > diff --git a/lib/igt_core.h b/lib/igt_core.h
>> > > index 90f57402f0..1b6e70182b 100644
>> > > --- a/lib/igt_core.h
>> > > +++ b/lib/igt_core.h
>> > > @@ -1517,11 +1517,17 @@ void igt_kmsg(const char *format, ...);
>> > >  #define le32_to_cpu(x)  (x)
>> > >  #endif
>> > >
>> > > -#define MSEC_PER_SEC (1000u)
>> > > +#if __WORDSIZE == 64
>> >
>> > I am not sure if this is defined on all platforms where igt
>> > is compiled, on musl and on non-Linux like FreeBSD,
>> > why not make #ifndef/#define/#endif for __WORDSIZE ?
>>
>> because if it's not defined, how are you going to decide which side of
>> them to use?
>>
>> from the tools/  include in kernel, one could do
>>
>> #ifndef __WORDSIZE
>> #define __WORDSIZE (__SIZEOF_LONG__ * 8)
>> #endif
>>
>> another possible solution is checking ULONG_MAX, like in dnf:
>>
>> https://github.com/rpm-software-management/libdnf/pull/1159/files
>>
>> but I think the kernel one is cleaner.
>>
>> Lucas De Marchi
>>
>
>Why not just 'sizeof(1ul) == 8' ?

that would work too

Lucas De Marchi

>Btw we still have problem here when sizeof(1ull) == 4
>(I hope such architectures are out of our interest though)
