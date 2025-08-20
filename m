Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A11CA0EDC
	for <igt-dev@archiver.kernel.org>; Wed, 20 Aug 2025 09:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B0010E251;
	Wed, 20 Aug 2025 09:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FfjlhZfo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB9810E251
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Aug 2025 09:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755680984; x=1787216984;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=n2f89vYwZ2rsohoHQCn9OZWZFRzuRgsg068FY1j2xYI=;
 b=FfjlhZfoAe5Y0995iIkAtflmkbjiWcYmA1GC7kVi1ynCtVig0CN2pzKU
 64sbvsc3E+HA9KYqi+dSE/qlt20y7P+4AVCMg3zKKIxG7jHaQb7JRtdXW
 C2qR9MzgRFqjiJLlhoFsF7VO74MmHGmi/6Zps1tfZK1ln6J/coUAbG8KZ
 iF+DsbHhKC7FXlmenx68ExMPHCG0Wj96HBMzQA13OhsjYX/CSEm2BmeFv
 erE3eMKOKngDxgOXrt6dpFIqBUa3/dRqG87uiFOpq6J3PJzkCEBQct39u
 Xp9Zqi2ft7PvEp0WQGXZCotNExiMYz3Fno8QgnuNNYbCI+VSTPsyWGXmF g==;
X-CSE-ConnectionGUID: JVq6vP+uQJGpKko3U55hBA==
X-CSE-MsgGUID: /IEh4ekXS4aELkUsQIMFGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="69389269"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="69389269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 02:09:44 -0700
X-CSE-ConnectionGUID: Pzr+ry5oTHW4DwWtIje8BA==
X-CSE-MsgGUID: BIngjo51RnmMbqcjphvd1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="172303685"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.58])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 02:09:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2] tools/intel_vbt_decode: convert copyright
 signs from latin1 to utf8
In-Reply-To: <20250820085803.nryt4obuw5wgjkva@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250820072405.3518554-1-jani.nikula@intel.com>
 <20250820085803.nryt4obuw5wgjkva@kamilkon-DESK.igk.intel.com>
Date: Wed, 20 Aug 2025 12:09:39 +0300
Message-ID: <517d5f2b8a5703753be356036392854358a71f28@intel.com>
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

On Wed, 20 Aug 2025, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrot=
e:
> Hi Jani,
> On 2025-08-20 at 10:24:05 +0300, Jani Nikula wrote:
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
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Thank you for a fix, I will merge it soon with small change in
> subject, s/sings/sign/ as this is only one file and one char.

Thanks!

BR,
Jani.


>
> Regards,
> Kamil
>
>>=20
>> ---
>>=20
>> v2: Rebase, intel_bios.h no longer exists.
>>=20
>> I'll be trying 'git send-email --8bit-encoding=3Diso-8859-1' on this
>> one. Fingers crossed.
>> ---
>>  tools/intel_vbt_decode.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index 6882ae1d2f63..a4e76b7559d2 100644
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
