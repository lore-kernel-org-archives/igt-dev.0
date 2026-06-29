Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62946C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 12:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6DA10E033;
	Mon, 29 Jun 2026 12:38:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxkvgdrZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF2410E033
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782736664; x=1814272664;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=t34dxOwGV3ZzvkMYAKTA5kTVedfI92g6HMrC3K5Agek=;
 b=CxkvgdrZ+3CRdXs1/gM0F2xTTvSU+0rNWQA81wPivZ5/Cz5oZmjD9iDx
 a/OmU8xBUe3G22476kyp+bZL6OjNOZmfT0Tn4HtGCgCrUiQANo7Jmmtye
 L3CKYUEhukQXnOe07PbbbEtwKw9NI+PjC8l1e8+Ik1XN5sbCQZjZo56xE
 HwlTm+CbLzzxP6/EVtT8AnjrpFxrJe2nof/hpEd0voA3/I8opjLp97jaK
 MpLrnal6cJ7/eii4oVlQrQl2ROhom1gslX/Ji8dLn8Qm8AjMKQxlkWpsS
 FSfw6oG5fSJ48P3EKBcO3lMrW8yFTZyz8YzDn+mepuLWb+ngmPueI4mMK A==;
X-CSE-ConnectionGUID: RRaebQFeTJeFK3UiO1CTvQ==
X-CSE-MsgGUID: anB1kClGTBKuKE1b9znB5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="83472808"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="83472808"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:37:43 -0700
X-CSE-ConnectionGUID: UHPl8zWEQeGDJB6+hHvkvA==
X-CSE-MsgGUID: NQIyvTDNTLygEx9xasnvkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="256353682"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.253])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 05:37:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Gustavo Sousa
 <gustavo.sousa@intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
In-Reply-To: <8839c171056ebba69ab979bb3b43dbacc0c76a0e@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
 <8839c171056ebba69ab979bb3b43dbacc0c76a0e@intel.com>
Date: Mon, 29 Jun 2026 15:37:38 +0300
Message-ID: <c896ffe0caa582ca186f60d825ee6df8984e83ab@intel.com>
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

On Mon, 29 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> On Mon, 29 Jun 2026, Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@inte=
l.com> wrote:
>> Doubling test name size might be not enough for realloc if target name
>> length is larger than test/subtest name size.
>
> Might one to point out (if) this is the cause for the segfaults we've
> been seeing in CI.

Also, Fixes: ?

>
> BR,
> Jani.
>
>>
>> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
>> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>> Cc: Ryszard Knop <ryszard.knop@intel.com>
>> ---
>>  lib/igt_hook.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
>> index b8f25b6c7a..a44b852da1 100644
>> --- a/lib/igt_hook.c
>> +++ b/lib/igt_hook.c
>> @@ -300,7 +300,7 @@ static void igt_hook_update_test_name_pre_call(struc=
t igt_hook *igt_hook, struct
>>  	if (len + 1 > *size_ptr) {
>>  		size_t fullname_size;
>>=20=20
>> -		*size_ptr *=3D 2;
>> +		*size_ptr +=3D len + 1;
>>  		*name_ptr =3D realloc(*name_ptr, *size_ptr);
>>=20=20
>>  		fullname_size =3D igt_hook_calc_test_fullname_size(igt_hook);

--=20
Jani Nikula, Intel
