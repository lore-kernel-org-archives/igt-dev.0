Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36637F9EDF3
	for <igt-dev@archiver.kernel.org>; Wed, 22 Apr 2026 14:52:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AAF10EA55;
	Wed, 22 Apr 2026 14:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLNOtyXM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5EE10EA55
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Apr 2026 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776869551; x=1808405551;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QgDJXnO4zDcTbvdo0hNoiF4/cgv/N3t5OfAQ2jEQflc=;
 b=XLNOtyXM5hs3mjKtTd6dXYXS+4Eyw+WX6KKxwgfZKYCzs1Udbe6LdfmZ
 +PtQtxF+Ob50bPwbL4cAjywoBLfcNXZA6XK+Iz6Q4bW4AHJ99/KqR0Myh
 ovB1i8IFZvJ6gUPLQR+6UboS3eJdssufHXhvat9ZUYHsEgiVqKZzLfmp0
 8wnitTnsa3tKTkycqCS4LDWTwpLD8Je+3dyW2CZPK6s7wpHA4mNQr5Rqo
 5KjFBPYIPg2fv9lbOhNjtZ8xK5vcMxSA0R9YuM/Vps8DyVzUGLdoyrqb0
 AYA3aZ+z73jGjlzM6GyaxJ47PacoM35s85xQcrja3tGavwBJApInbUfST g==;
X-CSE-ConnectionGUID: hisHUPw4Q6KqT08bgNz1lA==
X-CSE-MsgGUID: QvBDam5pStacQfuSq3V+Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="95385880"
X-IronPort-AV: E=Sophos;i="6.23,193,1770624000"; d="scan'208";a="95385880"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 07:52:31 -0700
X-CSE-ConnectionGUID: fnzktXD2RoCXbAJY+VA2rQ==
X-CSE-MsgGUID: 4xC3kH7yT5KH0obkj+JrLA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 07:52:30 -0700
Date: Wed, 22 Apr 2026 16:52:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t v1 0/4] Various fixes for prime_udl test
Message-ID: <20260422145228.3rwznbgurep2julr@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
 <8e1ad796-fbb4-4a66-968c-d1acac4609a1@intel.com>
 <20251216154059.mtewdcrz5imazfdh@kamilkon-DESK.igk.intel.com>
 <1fe45045-44a7-4a4f-a87a-a8476de38d2a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1fe45045-44a7-4a4f-a87a-a8476de38d2a@intel.com>
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

Hi Karthik,
On 2025-12-17 at 09:24:17 +0530, Karthik B S wrote:
> Hi Kamil,
> 
> On 12/16/2025 9:10 PM, Kamil Konieczny wrote:
> > Hi Karthik,
> > On 2025-12-16 at 09:03:11 +0530, Karthik B S wrote:
> > > Hi Kamil,
> > > 
> > > On 12/16/2025 4:06 AM, Kamil Konieczny wrote:
> > > > Refactor this test into proper opening fixup, then tests and
> > > > last closing fixup. Also fix few error checks and make sure
> > > > opened device is handled by i915 driver as there are now also
> > > > one handled by Xe.
> > > > 
> > > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > > Cc: Swati Sharma <swati2.sharma@intel.com>
> > > The series LGTM overall, but one open I've is if this test should be moved
> > > to intel folder rather than the generic tests folder?
> > Yes, you are right, before that I would like to add proper * TEST:
> > and other descriptions and I will test it in trybot.
> > Imho proper name would be tests/intel/i915_prime_udl.c unless
> > this will run also on Xe? Btw is this test covered by some other
> > KMS one?
> 
> Agreed on the test name. No this is not covered. We only have kms_prime for
> kms specific validation.

I will send a new version with this rename. I also spotted a bug,
I forgot to change igt_simple_main() into igt_main().

Regards,
Kamil

> 
> Regards,
> Karthik.B.S
> > 
> > Regards,
> > Kamil
> > 
> > > Regards,
> > > Karthik.B.S
> > > > Kamil Konieczny (4):
> > > >     tests/prime_udl: Fix opening
> > > >     tests/prime_udl: Create subtests
> > > >     tests/prime_udl: Fix error handling
> > > >     tests/prime_udl: Fix i915 device opening
> > > > 
> > > >    tests/prime_udl.c | 38 ++++++++++++++++++++++++--------------
> > > >    1 file changed, 24 insertions(+), 14 deletions(-)
> > > > 
