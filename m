Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340A1CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 18:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4A410E084;
	Tue, 28 Oct 2025 18:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lNz7KLt3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8AA10E084
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 18:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761676994; x=1793212994;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=j6XArnLHu6HxLlTzBU0btdKxjJP0vYWeoPSxsapDOdo=;
 b=lNz7KLt3CWhe+J8pTUSHuQnhF5xuGDsrkFoYX21bDkF7LtN+IhjWmtQk
 bRpXglBzh+iQ72yPEYYm1cxswK0pJ3aVykhGZM0JmpWGeJNsDtsVcv8Tu
 O4SK0PLHGVOfK45nLfAQPX7fSp2dj3lYU9c+XXJVN5S/UvrzxhEIxavF5
 7zJjZSR9LCKW437Zw33nW2bRy7UCIbXpmy29embzshMz6da24LmsX8/7W
 UD3IlZ867aUDjwccgqElVuTn0gBluMnX5K+m28HD1wsyn6Ljynu+zfrn/
 XVnx9DUrXHIDPW4/xoutE29xC1xHXUs4i13scoi5BNqRBqOtpibRAgsXM Q==;
X-CSE-ConnectionGUID: HWvDT6MhTs6eCTsxXMciMg==
X-CSE-MsgGUID: f+5w72RTRPOeGbTAQ13yIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63490422"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="63490422"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:43:14 -0700
X-CSE-ConnectionGUID: M6Qe57WBTFG+2J6y61PNXA==
X-CSE-MsgGUID: WteWMaKCT4eudxhQDm72kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185514877"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 11:43:12 -0700
Date: Tue, 28 Oct 2025 19:43:10 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: =?ISO-8859-15?Q?Juha-Pekka_Heikkil=E4?= <juhapekka.heikkila@gmail.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 igt-dev@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 1/1] tests/kms_big_fb: Open compatible driver for
 the platform
In-Reply-To: <CAJ=qYWSqX2SBgbggxAreGsGRaVzXgu4MoY7jFoVVRogH2=VnVg@mail.gmail.com>
Message-ID: <5a2342fd-403b-c0e6-d382-3c0a1245ed5c@intel.com>
References: <20251027130025.1771523-1-michal.grzelak@intel.com>
 <CAJ=qYWSqX2SBgbggxAreGsGRaVzXgu4MoY7jFoVVRogH2=VnVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-124243592-1761674439=:1781973"
Content-ID: <3199e964-26d1-8945-c638-e70ea2580fa2@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-124243592-1761674439=:1781973
Content-Type: text/plain; CHARSET=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <b28a9922-ce65-4e22-6e5c-96ae54bb1385@intel.com>

Hi J-P,

On Mon, 27 Oct 2025, Juha-Pekka Heikkilä wrote:
> On Mon, Oct 27, 2025 at 3:00 PM Michał Grzelak <michal.grzelak@intel.com> wrote:
>> On platforms older than ADL-P, tests should be executed with i915 loaded
>> before xe. Currently, when tests are executed and xe is loaded first,
>> failures are reported in multiple subtests along errors in the dmesg.
>>
>> Check if i915 has been loaded before xe. If not, open and optionally
>> reload proper driver according to platform's display version.
>
> I was wondering what is the problem you are solving with this? adlp
> you mention is supported by both xe and i915 and I don't think it is
> good idea test silently switches the driver. If xe is loaded when
> running with adlp I'd expect it is done with force probing and it is
> intentional; ie test is wanted to be run against xe driver.

Should have added a Link: or Fixes: tag. The issue I am working on is
bug [1], and it is seen almost entirely on adlp. The dmesg warnings /
errors come from IOMMU, and they can be switched off with
intel_iommu=igfx_off (or similar), but even with this param several
subtests still fail, namely:
kms_big_fb@x-tiled-8bpp-rotate-0,
kms_big_fb@x-tiled-8bpp-rotate-180,
kms_big_fb@x-tiled-max-hw-stride-8bpp-rotate-180,
kms_big_fb@y-tiled-64bpp-rotate-0,
kms_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling,
kms_flip_change@flip-change-tiling, etc.

Both failures and dmesg errors disappear as long as i915 was loaded
before xe. Loading i915 after xe still reproduces the failures; that's
why I try to switch the driver.

I thought the fails were expected as I presumed that platforms before
adlp shouldn't be testing against xe but against i915. Since you say
that adlp should support both xe and i915, does it mean that there might
be a bug in xe and not in i915 which causes the tests to fail? Or should
I contact CI team to alter the testlist e.g. so that these tests won't
be run after xe_module_load@load, but after i915_module_load@load on
adlp?

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4543

BR,
Michał
--8323329-124243592-1761674439=:1781973--
