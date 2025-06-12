Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050A5C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 11:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DEA10E0F0;
	Thu, 12 Jun 2025 11:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBczxijN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9483510E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 11:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749726791; x=1781262791;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P5npPD+uX/y5630Jol63gHBKAhj/H2m4G+Q/YuLLYCI=;
 b=jBczxijNBhfE52dGAQvpJrr4bJdkGV7g6ZisasN0Y9RVG68RvFObMFxS
 kmezTCpjnOLTU3v4jZkRNJ24D+LnXS31MP7qYjpVNLTtoRQIthhVF5+7c
 +9LQ4DpcNRd47mHVtKHXg/Bbgwr0lugQ5xGxG49gxZ5pgpgHbVP0FDJmr
 eXcmxDXMcwbKfeTml3bff3G73jNkTNN26POiuDToKRxNRKM+95rAV+xeL
 6miFFFZPgLXnUVLiGhwvbVG5XVj/QrhV8OQ55guapDAOr1UzxAugWzGSM
 HKprlHxj8UmmHJmOArgCeQpar28iWEq2PMcX4Ct3bQ5e6TyWXkK2ARohx w==;
X-CSE-ConnectionGUID: Mh6t99t/TE6uAuRV4fnpwA==
X-CSE-MsgGUID: sfaiP0HAQuC3v+5+AAKCXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="55702625"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="55702625"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 04:13:11 -0700
X-CSE-ConnectionGUID: TjtdjN/HR9egr1d1jRgWoQ==
X-CSE-MsgGUID: J5/1tIfYR6CtL1cy4qv7ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="148398889"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 04:13:07 -0700
Date: Thu, 12 Jun 2025 13:12:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik B S <karthik.b.s@intel.com>
Cc: Melissa Wen <mwen@igalia.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Alex Hung <alex.hung@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t 3/3] tests/kms_async_flip: skip subtest on AMD if
 invalid condition
Message-ID: <20250612111249.gmeasmosktlbmiic@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Melissa Wen <mwen@igalia.com>,
 Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Alex Hung <alex.hung@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 kernel-dev@igalia.com
References: <20250601191459.46759-1-mwen@igalia.com>
 <20250601191459.46759-4-mwen@igalia.com>
 <569895c3-f864-48ef-b26f-51f590303be5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <569895c3-f864-48ef-b26f-51f590303be5@intel.com>
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
On 2025-06-03 at 09:25:19 +0530, Karthik B S wrote:
> 
> On 6/2/2025 12:44 AM, Melissa Wen wrote:
> > Async page flips can fail for any driver-specific reasons, i.e. when the
> > driver can't commit to async page flip request due to hw limitations,
> > the commit is rejected with -EINVAL since there is one or more
> > conditions that make the request invalid. These limitations vary between
> > vendors and hw versions. In case of AMD devices, async page flip cannot
> > be perfomed if fb memory type changes (VRAM vs GTT), but framebuffer
> > allocation type cannot be controlled by any userspace configuration.
> > 
> > Allow EINVAL failures on AMD device and skip the test. Async flips can
> > be still validated by the performance comparison assert if no EINVAL.
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> Acked-by: Karthik B S <karthik.b.s@intel.com>

Thank you, I merged this one.

Regards,
Kamil

> > ---
> >   tests/kms_async_flips.c | 7 ++++++-
> >   1 file changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> > index 97128cfad..065ac9c49 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -410,7 +410,12 @@ static void test_async_flip(data_t *data)
> >   		ret = perform_flip(data, frame, flags);
> > -		if (frame == 1 && data->allow_fail)
> > +		/* AMD cannot perform async page flip if fb mem type changes,
> > +		 * and this condition cannot be controlled by any userspace
> > +		 * configuration. Therefore allow EINVAL failure and skip the
> > +		 * test for AMD devices.
> > +		 */
> > +		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
> >   			igt_skip_on(ret == -EINVAL);
> >   		else
> >   			igt_assert_eq(ret, 0);
