Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7088C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 11:37:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597EE88C11;
	Thu, 13 Mar 2025 11:37:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OhlvzY/n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7330910E84D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 11:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741865868; x=1773401868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=QJHZoN8nVkiIDVjBLO0v7jUNp5yft73D6QKoMYWg5MY=;
 b=OhlvzY/nawt0IIBnR5fKnLB/ZR5JrNwBjZEtIIVTlD2Q5xJj6dSxTRrD
 oRkyCD6BEKSauB81tLsU+cxsFh938Exty7x5da/dOT5hq6IPuf+bPWl/O
 pWDLXq0LfwENPZOrOZBo6Zx2NFNK4k5bC9ypzBFbi3YfqYrj2gOqRYD8g
 95WWyv68pvJ28NmJY4quta9G21uMXARM9BFq/AcWvaZT4Ls5NQHYu7yU4
 gayTOl160LbH7thGb/XyySdVXmm5H4JgMdfGfTgOSphQpeeZdD4KT3DEv
 SGbKM2wl+yFK3SAUvsEvzv6IYCVG8xPEq1YB9hTwEHN/wpoczvB7hzY9c A==;
X-CSE-ConnectionGUID: F0bI8pVWRn+jx3yiWh7kzg==
X-CSE-MsgGUID: JWFwon02SJWBGh16KmOyag==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43176750"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="43176750"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:37:47 -0700
X-CSE-ConnectionGUID: n36ItPnCQm6hsLH0SVuLxA==
X-CSE-MsgGUID: ahCYBEF8Rki9iDqYWpfM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120722143"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 04:37:44 -0700
Date: Thu, 13 Mar 2025 12:37:42 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_drm_fdinfo: Group utilization
 tests and skip when no utilization data
Message-ID: <20250313113742.jbj5u7xmrmkzcgef@zkempczy-mobl2>
References: <20250304185640.1333849-1-marcin.bernatowicz@linux.intel.com>
 <20250304185640.1333849-2-marcin.bernatowicz@linux.intel.com>
 <ip3lgnjby4aeplweqxvtcjubj27hktvzciqvvu5r7u7vkzqs4n@y7uomewtoetr>
 <f78e21cc-d1f4-4974-92b8-b3d497a5c50f@linux.intel.com>
 <snev4fbltcxduu46wsngqfpynsm73vr4vq6vmmdr4nchgeiefp@42jbrrbro6tl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <snev4fbltcxduu46wsngqfpynsm73vr4vq6vmmdr4nchgeiefp@42jbrrbro6tl>
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

On Wed, Mar 12, 2025 at 11:19:24PM -0500, Lucas De Marchi wrote:

<cut>

> > 
> > Yes, it is executed in addition to the outer fixture (but if the outer
> > fixture fails, this one should not run), so xe is already opened. This
> > fixture applies at the group scope - if it fails or is skipped, all
> > tests in the group will also fail or be skipped.
> > 
> > However, as Kamil pointed out, fixtures are executed even if no test
> > from the group is selected for execution. This means that if we run
> > igt@xe_drm_fdinfo@basic-mem (which is outside this group), the fixture
> > from the utilization group still runs, potentially logging an unmet
> > requirement.
> 
> ok, that's unfortunate. it would probably make sense to change that
> behavior.

I've stared to this few years ago and whole igt's would require
rewriting. Test selection by name is by matching in iterational
code, so until we get that point (subtest matching) we never
know what fixtures before should be executed or not. Unfortunately
test selection allows globbing, so we can't stop executing fixtures
after first match where group ends, because another glob match in
another group may be met.

Subtests, groups, fixtures should be registered first, then igt
logic should process subtest lists according to their groups/fixtures
calling registered fixtures before entering/after exiting groups.
Generally not so complicated, but time consuming to do this right.

--
Zbigniew

> 
> > 
> > IIUC, the only solution is to move the checks inside the subtests.
> 
> yeah, I see you went with that approach. Looks good to me too.
> 
> thanks
> Lucas De Marchi
> 
> > 
> > > 
> > > Lucas De Marchi
> > 
