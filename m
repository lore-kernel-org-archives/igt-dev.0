Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC1ECA0EEB
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 13:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC0E410E44A;
	Mon, 18 Aug 2025 13:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJFqgluQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5476E10E44A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755524524; x=1787060524;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yIqb8YqZtxw0ix2BnK+5qmddZYQR6hJzVBxGGk5U2k0=;
 b=MJFqgluQ4aRA/iCW3OqC2m7ulzXP3aaqWflRIQPH6qCRXH6I+W6y0I69
 pSm1AfgxbA5M/DfwxLJM49ujbp0EEvKLbfQNFVKefzBEHH/807dGfirgB
 JJVDu/jBGAfkpsGnaWGe20yTpNBDupmwq5NOCdffA8+tTbDngDyB1X45u
 2e+QuyxbvBBhPyAGaPonUNWrOF+GfAaXsb+3pCM+neGBN8x+Cmn0V3lF6
 pBjwPw/tC/Y0BwfG7kuystvnCYAa6Wo+MLWwoYOeXEIfJfAXLAKD66xr9
 hDlUhAzO5Ym84bEeqOa4YsOFKLpMXsf5H37unc0U8jCV5hNtv4GKZtPCG w==;
X-CSE-ConnectionGUID: 6BGM/zgySS+mYxNVjp9CDw==
X-CSE-MsgGUID: QaM3c5lvT9Cvu5FlT7kfGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69196144"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="69196144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:42:04 -0700
X-CSE-ConnectionGUID: NnGbNDlNSqOd7jTy1IaV2Q==
X-CSE-MsgGUID: U3DbhL3FSVGdh3Ks9QBnsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="191266516"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.188])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 06:42:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tools/intel_vbt_decode: convert copyright signs
 from latin1 to utf8
In-Reply-To: <20250818130936.qhgblto66rbobjnj@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250818105133.2676928-1-jani.nikula@intel.com>
 <20250818130936.qhgblto66rbobjnj@kamilkon-DESK.igk.intel.com>
Date: Mon, 18 Aug 2025 16:41:59 +0300
Message-ID: <ed8c988c5bedb37b04e8e7df575c46d9ce5824ad@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 18 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2025-08-18 at 13:51:33 +0300, Jani Nikula wrote:
>> Various tools trip over with latin1 characters in the source, as
>> nowadays everything pretty much expects utf8.
>>=20
>> For example, [1] fails to apply in both Patchwork and b4, because
>> somewhere along the way, the latin1 copyright sign has in fact been
>> automagically converted to utf8, and the source still has latin1.
>>=20
>> Instead of debugging legacy encodings and conversions, just convert the
>> remaining latin1 files to utf8 using iconv.
>>=20
>> [1] https://lore.kernel.org/all/7090e70d712c94aed53f52c49a8155eb4c6b966c=
.1755175663.git.jani.nikula@intel.com/
>>=20
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> This still do not apply, now it looks strange even in patchwork,
> two chars 'A^' '(c)' instead of one '(c)'.
>
> With old file:
>
> $ echo $LANG
> C
> $ grep -n Copyright tools/intel_bios.h
> 2: * Copyright =EF=BF=BD 2006 Intel Corporation
>
> $ export LANG=3DC.UTF-8
> $ grep -n Copyright tools/intel_bios.h
> grep: tools/intel_bios.h: binary file matches
>
> $ export LANG=3DC
> $ head -n2 tools/intel_bios.h|tail -n1|od -tx1a
> 0000000  20  2a  20  43  6f  70  79  72  69  67  68  74  20  a9  20  32
> 	 sp   *  sp   C   o   p   y   r   i   g   h   t  sp   )  sp   2
> 0000020  30  30  36  20  49  6e  74  65  6c  20  43  6f  72  70  6f  72
> 	  0   0   6  sp   I   n   t   e   l  sp   C   o   r   p   o   r
> 0000040  61  74  69  6f  6e  0a
> 	  a   t   i   o   n  nl
> 0000046
>
> Your patch now downloaded from patchwork:
>
> $ grep Copyright  /tmp/tools-convert-to-utf8.mbox
> - * Copyright =C2=A9 2006 Intel Corporation
> + * Copyright =C3=82=C2=A9 2006 Intel Corporation
> - * Copyright =C2=A9 2006 Intel Corporation
> + * Copyright =C3=82=C2=A9 2006 Intel Corporation
>
> $ grep Copyright  /tmp/tools-convert-to-utf8.mbox |head -n1|od -tx1a
> 0000000  2d  20  2a  20  43  6f  70  79  72  69  67  68  74  20  c2  a9
>           -  sp   *  sp   C   o   p   y   r   i   g   h   t  sp   B   )
> 0000020  20  32  30  30  36  20  49  6e  74  65  6c  20  43  6f  72  70
> 	 sp   2   0   0   6  sp   I   n   t   e   l  sp   C   o   r   p
> 0000040  6f  72  61  74  69  6f  6e  0a
> 	  o   r   a   t   i   o   n  nl
>
> so in your patch file already has 'c2' 'a9' and that is changed to yet
> another chars?
>
> You could look into your patch here in patchwork:
> https://patchwork.freedesktop.org/patch/669076/?series=3D153057&rev=3D1
>
> and compare with another which adds new file also with (c):
> https://patchwork.freedesktop.org/patch/668316/?series=3D152889&rev=3D1

Locally the git format-patch patches are fine, and apply fine. Somewhere
between git send-email, various servers, mailing lists, patchwork and
public-inbox it goes south.

I'm sorry, but I can't be bothered to figure out what hoops I have to
jump through to send this patch in a way that all the tools in the
pipeline will understand. Life is too short.

Bottom line, intel_bios.h and intel_vbt_decode.c have latin1 copyright
characters in the repo, and we should get rid of them.

I can push the changes directly from my repo, or you can run 'iconv
--from-code=3Dlatin1 --to-code=3Dutf8' on the files yourself, and make it
happen.


BR,
Jani.


>
> Regards,
> Kamil
>
>>=20
>> ---
>>=20
>> I'll be trying 'git send-email --8bit-encoding=3Diso-8859-1' on this
>> one. Fingers crossed.
>> ---
>>  tools/intel_bios.h       | 2 +-
>>  tools/intel_vbt_decode.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tools/intel_bios.h b/tools/intel_bios.h
>> index 01de2246e147..d874a268fe70 100644
>> --- a/tools/intel_bios.h
>> +++ b/tools/intel_bios.h
>> @@ -1,5 +1,5 @@
>>  /*
>> - * Copyright =C2=A9 2006 Intel Corporation
>> + * Copyright =C3=82=C2=A9 2006 Intel Corporation
>>   *
>>   * Permission is hereby granted, free of charge, to any person obtainin=
g a
>>   * copy of this software and associated documentation files (the "Softw=
are"),
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index 7bb3c19c3340..85bda78a2a54 100644
>> --- a/tools/intel_vbt_decode.c
>> +++ b/tools/intel_vbt_decode.c
>> @@ -1,5 +1,5 @@
>>  /*
>> - * Copyright =C2=A9 2006 Intel Corporation
>> + * Copyright =C3=82=C2=A9 2006 Intel Corporation
>>   *
>>   * Permission is hereby granted, free of charge, to any person obtainin=
g a
>>   * copy of this software and associated documentation files (the "Softw=
are"),
>> --=20
>> 2.47.2
>>=20

--=20
Jani Nikula, Intel
