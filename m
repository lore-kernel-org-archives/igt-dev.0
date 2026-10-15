Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE1ECC6B39
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 15:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F2C10E181;
	Thu, 15 Oct 2026 15:45:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8595410E181
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079075; x=1823615075;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ERU8xIGtbiT8I24xk3/Wk+wU6i6+hUwcfVWFnnCTykM=;
 b=EvJ8ToTQ2C44wkXtg8fvMllNk9GjuFadDo6Bj8IPFGnW8pwVbpbMEhQ/
 xhUylHzEKuzgmse35ru0xzTUrJHF3w4Qxr9Teg0jEbucYCEAfw1DcP/+W
 rIFBtzh8QE//GEjYLYIQjSwBIBIBq7jAAgBvWC+H/DALaPlISywKl1MDN
 /cq7QQNQ1d0Pjy533bhdBUDfDYbqEQ4n0hQt1sZGClScT08YvqkceTHm4
 rK2501HZGnByoGHZLVENbtkvyfsgGyVJ0Fl4Fod3gqmupmeavp5r+Idbt
 bq7mmY/kJBLS1YYK/0zrlyEl4XEKsNUJx5PgB6XpD6Lj9GJNUSwhqiEVj g==;
X-CSE-ConnectionGUID: PKA4Ga/LQ56uUNQ9A+YHuw==
X-CSE-MsgGUID: 65a+xj9tRm+gw8Pd4z1SkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="865330"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="865330"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:44:34 -0700
X-CSE-ConnectionGUID: 0plgN5MuQ1++uDgpZ4FQcA==
X-CSE-MsgGUID: wSEnDwsURa6Ta07FTngObw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3500989"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:44:33 -0700
Date: Thu, 15 Oct 2026 17:44:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: David Francis <David.Francis@amd.com>, igt-dev@lists.freedesktop.org,
 tvrtko.ursulin@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>
Subject: Re: [PATCH] tests/intel: Add edge case and race condition tests for
 GEM_CHANGE_HANDLE
Message-ID: <20261015154407.yykpsnl2zlbl6txn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 David Francis <David.Francis@amd.com>,
 igt-dev@lists.freedesktop.org, tvrtko.ursulin@igalia.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian Konig <christian.koenig@amd.com>,
 Simona Vetter <simona@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20261007141209.2928162-1-David.Francis@amd.com>
 <DM4GOOY2F8D7.1RBHG2IGLKI7N@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4GOOY2F8D7.1RBHG2IGLKI7N@intel.com>
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

Hi Sebastian,
On 2026-10-14 at 11:42:28 +0200, Sebastian Brzezinka wrote:
> Hi David,
> 
> On Wed Oct 7, 2026 at 4:12 PM CEST, David Francis wrote:
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Add a GPU-agnostic GEM_CHANGE_HANDLE tests. These test for basic
> > functionality, edge cases, and race conditions of this ioctl against
> > itself, gem close, gem create, and prime import and export.
> >
> > GEM_CHANGE_HANDLE is currently wired to drm_invalid_op in DRM core. This IGT
> > coverage is a prerequisite for validating the eventual kernel-side ioctl
> > implementation and makes fixing its security bugs safer.
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> > Cc: Christian Konig <christian.koenig@amd.com>
> > Cc: Simona Vetter <simona@ffwll.ch>
> > Cc: Alex Deucher <alexander.deucher@amd.com>
> > Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> > Signed-off-by: David Francis <David.Francis@amd.com>
> > ---
> >  tests/intel/gem_change_handle.c | 747 ++++++++++++++++++++++++++++++++
> >  tests/meson.build               |   1 +
> >  2 files changed, 748 insertions(+)
> >  create mode 100644 tests/intel/gem_change_handle.c
> >
> > diff --git a/tests/intel/gem_change_handle.c b/tests/intel/gem_change_handle.c
> > new file mode 100644
> > index 000000000..23f2f8b39
> > --- /dev/null
> > +++ b/tests/intel/gem_change_handle.c
> > @@ -0,0 +1,747 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright 2026 Advanced Micro Devices, Inc.
> > + * Copyright 2026 Intel Corporation
> > + *
> > + * GPU-agnostic race condition tests for GEM_CHANGE_HANDLE ioctl
> > + *
> > + * NOTE: This test is located in tests/intel/ directory because:
> > + * 1. All gem_* tests are traditionally placed in tests/intel/ regardless
> > + *    of GPU vendor, following IGT convention for GEM-related tests
> > + * 2. The test uses i915/gem.h and i915/gem_create.h for GEM object creation
> > + *    on Intel platforms, though it works vendor-agnostically via DRM core
> > + * 3. Some subtest designs (noop-same-handle, invalid-*, edge-*, functional-*)
> > + *    were proposed by Simona Vetter (Intel), hence Intel copyright header
> > + *
> > + */
> > +
[cut]
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 4f5c9be7b..ab083916d 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -104,6 +104,7 @@ intel_i915_progs = [
> >  	'gem_blits',
> >  	'gem_busy',
> >  	'gem_caching',
> > +	'gem_change_handle',
> >  	'gem_create',
> >  	'gem_ccs',
> >
> Overall, this series looks much better now. One open question for Kamil:
> since these tests exercise functionality that's currently disabled in
> the kernel (drm_invalid_op), and the IGT coverage is meant to be a
> prerequisite for bringing this feature back, how do we properly test it
> in the meantime?

Developer send changes to igt, after they compile and run then he/she
can resend kernel change with the added 'Test-with: message-id' line,
so it will be tested using igt with that igt series applied. Currently
afaik it works for i915 only.

https://intel-gfx-ci.01.org/test-with.html

Regards,
Kamil

> 
> Also can you look at patchwork this changes currently failed to git am
> https://patchwork.freedesktop.org/series/175696/#rev3
> 
> 
> -- 
> Best regards,
> Sebastian
> 
