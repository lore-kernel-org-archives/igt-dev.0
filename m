Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3ABC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 08:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BDF10E076;
	Tue, 15 Apr 2025 08:40:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AyTTpE5a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48DF10E076
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 08:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744706450; x=1776242450;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JDXhRXBWRviEq1MK0S60Mjc0q8xgkgLkxPHnsz+acDA=;
 b=AyTTpE5aGbgtLxxODJpYkfrnKajziJianPmgqUsB07OJMXNFe7eCDPSY
 9jls2BUJHGl4JcuW2d3OvIynbzTfI/LwR/tlT4P+iA/0ZijzlJB/j5FZx
 1itFB43L1dbPiwtWs3c3PO5KWHi9C8TX0Gr7238JMgm3xIRbc5wwFq7jt
 sQNHw/bTcDon8/Y+Rur5d2E8KM2a9595Yj0kpBpGhHqnbrHM/1GvBwwSG
 3qqt6cvJ+O6Wxw4M+Wc66likjgEtirtc/IaQaMi7YpTnf0KwJDd5+3fIz
 OUep3B3WTdWwRVWtZJQqOV8sy/sZR4NqyMSaPMsL1UX24c8j3gkPLMfax g==;
X-CSE-ConnectionGUID: InFBkCs1SG2VyRv3OFLnUw==
X-CSE-MsgGUID: ct/TKp5cTYis1nyMA5+d3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="63744717"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63744717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:40:49 -0700
X-CSE-ConnectionGUID: +5fkDztaRv+o22FY0oU6aA==
X-CSE-MsgGUID: wSFQpNsESmWdszdrptlClQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130593125"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 01:40:48 -0700
Date: Tue, 15 Apr 2025 10:40:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: Re: [PATCH i-g-t v5 0/2] rename drm_fdinfo into i915_fdinfo
Message-ID: <20250415084029.hperb7esqiqwttrl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
References: <20250414172336.59158-1-kamil.konieczny@linux.intel.com>
 <frxvr3oqixkv6p5mmaxr23vlmxbtqyqfnmtnqgqrdotiwuxk3n@xn5x4ztji6ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <frxvr3oqixkv6p5mmaxr23vlmxbtqyqfnmtnqgqrdotiwuxk3n@xn5x4ztji6ai>
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

Hi Lucas,
On 2025-04-14 at 16:32:22 -0500, Lucas De Marchi wrote:
> On Mon, Apr 14, 2025 at 07:23:33PM +0200, Kamil Konieczny wrote:
> >      This test opens i915 drm card and will not work for other drivers.
> > Hence rename it to avoid confusion.
> > 
> > See also discussion at
> > https://patchwork.freedesktop.org/series/139451/
> > i915/drm_fdinfo: Quiesce GPU prior to running some tests
> > 
> > v2: corrected Tvrtko e-mail and corrected xe.blocklist
> > v3: squashed patch 2 into 1, resulting in removing drm_fdinfo
> >  from xe.blocklist, added r-b (Lucas)
> > v4: corrected dependency for lib in meson.build (Kamil)
> > v5: drop sorting other tests in meson.build (Kamil)
> > 
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > 
> > Kamil Konieczny (2):
> >  tests/intel: rename drm_fdinfo into i915_fdinfo
> >  HAX/DO_NOT_MERGE: test drm/i915_fdinfo
> > 
> > tests/intel-ci/fast-feedback.testlist |   56 ++
> > tests/intel-ci/xe.blocklist.txt       |    1 -
> > tests/intel/drm_fdinfo.c              |   68 +-
> > tests/intel/i915_fdinfo.c             | 1112 +++++++++++++++++++++++++
> 
> The xe equivalent is xe_drm_fdinfo, so maybe just use the same naming
> scheme?

Good point, I will change the name, thank you for suggestion.

Regards,
Kamil

> 
> Lucas De Marchi
