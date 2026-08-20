Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AA6C5DF82
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 10:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10B410EFC6;
	Thu, 20 Aug 2026 10:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GzCMLuq4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62CA210EFC6
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Aug 2026 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787221222; x=1818757222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=53sDTyhqxNlFcV8MU8NQyg2PgnN8ZRhZ0YopQitHcFw=;
 b=GzCMLuq4C1szUxIEZrcNeRjXC8KigEmKjonVfxy6MgoZPDP4yhdUK+J7
 NDw3hOBUKG0oli4Ip09leTPB2uICzlFVoIeyNaTIiwOz4ejZJSFi0OASu
 6UmWOxtZIGFRRGI09wOh4Y7QzMKOWqIypx3zAOjceFZXR18PwH/IsSc8x
 +C/25Fbmq4nm/RbzVmCKoD2xTyNW1R7tZM2Bac9H5hjReVzy7WrYMQEKg
 BIjHVnWPwvUBUBp87unC5z6bdri7d0CXE4nRDTSGe/pCJ5C0rQWK665E0
 BaJza37+wuEi7jqdm2kbZUeiBf50GE8buipYiAmpZvyzJPqDRIlwu2lRA w==;
X-CSE-ConnectionGUID: d2oaaCGxQuWpmLjMivGiJQ==
X-CSE-MsgGUID: D4BE5pZVQOeobsPmSoXvJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87515435"
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="87515435"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 03:20:21 -0700
X-CSE-ConnectionGUID: z0iy5P/LQruIQYVe1F1jbA==
X-CSE-MsgGUID: 7TNQxSZkSIe5CQFthGwgOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,233,1779174000"; d="scan'208";a="262192052"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 03:20:19 -0700
Date: Thu, 20 Aug 2026 12:20:16 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Cc: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "krzysztof.karas@intel.com" <krzysztof.karas@intel.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v6 1/4] lib: Add generic platform filtering framework
Message-ID: <20260820102016.zkvbbqop6iaureye@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "krzysztof.karas@intel.com" <krzysztof.karas@intel.com>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20260820012820.129589-1-vitaly.prosyak@amd.com>
 <20260820012820.129589-2-vitaly.prosyak@amd.com>
 <DM4PR12MB5152AA3A4BBF83BBE3239F9BE3A42@DM4PR12MB5152.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5152AA3A4BBF83BBE3239F9BE3A42@DM4PR12MB5152.namprd12.prod.outlook.com>
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

Hi Zhang,,
On 2026-08-20 at 02:03:00 +0000, Zhang, Jesse(Jie) wrote:
> AMD General
> 
> Review-by: Jesse Zhang <jesse.zhang@amd.com>

One nit: it should be Reviewed-by:

so our tooling could work on patch.

Regards,
Kamil

> 
> > -----Original Message-----
> > From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> > Sent: Thursday, August 20, 2026 9:27 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: kamil.konieczny@linux.intel.com; jani.nikula@linux.intel.com;
> > krzysztof.karas@intel.com; krzysztof.kozlowski@canonical.com; Zhang,
> > Jesse(Jie) <Jesse.Zhang@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
> > Subject: [PATCH v6 1/4] lib: Add generic platform filtering framework
> >
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Implement vendor-agnostic platform filtering system that allows any vendor to plug
> > in platform-specific test skipping logic via callbacks.
> >
> > Key design elements:
> > - struct platform_filter_ops: vendor callback interface
> > - struct platform_skip_entry: vendor-neutral skip rule representation
> > - enum skip_source: three-tier priority (built-in, config, env)
> > - API functions: init, should_skip, require, dump
> >
> > Platform filtering is automatic - tests only need to call
> > platform_filter_init() once in igt_fixture. The IGT framework automatically checks
> > each subtest before execution via __igt_run_subtest().
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Jani Nikula <jani.nikula@linux.intel.com>
> > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > Cc: Jesse Zhang <jesse.zhang@amd.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  lib/igt_platform_filter.c | 575 ++++++++++++++++++++++++++++++++++++++
> >  lib/igt_platform_filter.h | 124 ++++++++
> >  lib/meson.build           |   1 +
> >  3 files changed, 700 insertions(+)
> >  create mode 100644 lib/igt_platform_filter.c  create mode 100644
> > lib/igt_platform_filter.h
> >
[cut]
