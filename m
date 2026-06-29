Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71AD5C43458
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 15:41:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2674410E977;
	Mon, 29 Jun 2026 15:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S/ftX7tc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B437310E977
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 15:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782747661; x=1814283661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=5ZMW0qsOd1Av4tRE1xovmsFXdMk2JWfwm7Ei2m5iGK0=;
 b=S/ftX7tca9CwTli0yedXikYN1Z9LtJRjUyK6bOPZK2dYbSa5wY4w070j
 Lxtq055ppeOws2u1kUIR81vS2Ya6F2RYJKwI/dA7zZOaJZFYvTM+ZzrE5
 fKyS2gnyXqY8WwkhGs+CqzB5MvN2ZSpnon5hGgMxZS4bc2SkoPkU57V3e
 6A6Z0dmoVuSJ1z/bI/mdnf+6p3SYVU4aAz7t7Bk5Wp/t7mIoI1Sc6zdme
 6oIljtByZP1Gl/VtsqSr7ZGf1I6vJfgcE8Q8Qjmh+QeNXRVRTEvB3hc8l
 9kwsnpSHMl+mOWEJutP0pqFEsvpPVL7Ufqj07UGv2GjCiXkh2FKNNI57r g==;
X-CSE-ConnectionGUID: hHKh3BT4RUWNmkSCn6vemA==
X-CSE-MsgGUID: SZCaTAWOS56DCDUJy9YRGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="83490765"
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="83490765"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 08:41:00 -0700
X-CSE-ConnectionGUID: 7IXhIfjbQxazx5T0oMmjtg==
X-CSE-MsgGUID: YQLV5yZHQ8y02jO5JosfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,232,1774335600"; d="scan'208";a="282063297"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.40])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 08:40:58 -0700
Date: Mon, 29 Jun 2026 17:40:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_hook: Fix realloc size to avoid memory
 overwriting
Message-ID: <ch5p37bjvo35nux5azdtlb2d2qmr2ft7ccsbcau2vsv6k6xxx5@3ia72mvxaaer>
References: <20260629115408.158220-2-zbigniew.kempczynski@intel.com>
 <8839c171056ebba69ab979bb3b43dbacc0c76a0e@intel.com>
 <c896ffe0caa582ca186f60d825ee6df8984e83ab@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c896ffe0caa582ca186f60d825ee6df8984e83ab@intel.com>
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

On Mon, Jun 29, 2026 at 03:37:38PM +0300, Jani Nikula wrote:
> On Mon, 29 Jun 2026, Jani Nikula <jani.nikula@intel.com> wrote:
> > On Mon, 29 Jun 2026, Zbigniew Kempczyński <zbigniew.kempczynski@intel.com> wrote:
> >> Doubling test name size might be not enough for realloc if target name
> >> length is larger than test/subtest name size.
> >
> > Might one to point out (if) this is the cause for the segfaults we've
> > been seeing in CI.
> 
> Also, Fixes: ?

I'm sorry, I wasn't aware of this issue id, just got link to failing
job so I wanted to fix it quickly. I promise I'll behave decent in
the future and will check this id before sending the patch.

--
Zbigniew

> 
> >
> > BR,
> > Jani.
> >
> >>
> >> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> >> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> >> Cc: Ryszard Knop <ryszard.knop@intel.com>
> >> ---
> >>  lib/igt_hook.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> >> index b8f25b6c7a..a44b852da1 100644
> >> --- a/lib/igt_hook.c
> >> +++ b/lib/igt_hook.c
> >> @@ -300,7 +300,7 @@ static void igt_hook_update_test_name_pre_call(struct igt_hook *igt_hook, struct
> >>  	if (len + 1 > *size_ptr) {
> >>  		size_t fullname_size;
> >>  
> >> -		*size_ptr *= 2;
> >> +		*size_ptr += len + 1;
> >>  		*name_ptr = realloc(*name_ptr, *size_ptr);
> >>  
> >>  		fullname_size = igt_hook_calc_test_fullname_size(igt_hook);
> 
> -- 
> Jani Nikula, Intel
