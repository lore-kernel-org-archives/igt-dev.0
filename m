Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B00CCD68BF6
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 09:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6043D10E941;
	Thu, 18 Dec 2025 09:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OomlsEh0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCB710E941
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 09:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766049382; x=1797585382;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1tQ1zFQ0YCp3CgpKlP1HCNbD5BVDB6IqEWxMwK274dk=;
 b=OomlsEh0FNyQVnOl1n+BGIqypU0rVunswHYtiGRTb7WzjP3CGXcj9f/M
 74sIBmXqgbrUiXGR716fe5f3az/07x7yG88Y6V3shJOEUF4v8kM3Ve885
 /B++AKUYgHs8oEpfPL7LVCkMKNFfgQfJZjWymxUwnAWV1jWwQfTLL5s1k
 I+p6ZdabRbBJpvb2Xe3KpGuqPsEgE8gX5TtDlcQEAMbX2jiSAwAVWamQG
 Ya+Ztyv6waSfL+wB1wxZTM+c2yb7xQ0CHYqpFP11Is8CG86xrA39rZ0Ew
 WCtpcS+NWo1VoA+U970nN+q0iMOJUmLrpZKI892ISARL/KHKft/YdfOEi Q==;
X-CSE-ConnectionGUID: MvaHOHMQRPKi3epQZ7dlRA==
X-CSE-MsgGUID: utVxdqLuSteTvEgxNfQG4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67750994"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="67750994"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:16:21 -0800
X-CSE-ConnectionGUID: NH66pFlTSE+TDZ/5DwBohA==
X-CSE-MsgGUID: tbC/0AkHTW+JcFgWLUaYrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="198542323"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.58])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 01:16:19 -0800
Date: Thu, 18 Dec 2025 10:16:16 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Wang, X" <x.wang@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>, igt-dev@lists.freedesktop.org, 
 alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com, 
 kamil.konieczny@intel.com, ravi.kumar.vodapalli@intel.com, 
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/2] lib/intel_pat: read Xe PAT config from debugfs
Message-ID: <zdagolp4fkoklgy3uq5h25f33t3hmhfkb63d55wpycdvoxcqc7@ikyi44pkfsgg>
References: <20251217080732.266257-1-x.wang@intel.com>
 <20251217080732.266257-2-x.wang@intel.com>
 <20251217191535.GB1180203@mdroper-desk1.amr.corp.intel.com>
 <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec15d0f9-149b-45fb-b499-420d76f1f258@intel.com>
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

On Wed, Dec 17, 2025 at 06:43:42PM -0800, Wang, X wrote:

<cut>

> 
> > > +	static __thread struct intel_pat_cache cached_pat;
> > > +
> > > +	/* Return cached value if already read for this thread */
> > > +	if (cached_pat.max_index != 0) {
> > > +		*xe_pat_cache = cached_pat;
> > > +		return cached_pat.max_index + 1;
> > > +	}
> > I'm not sure we really need to worry about caching the results here.  Is
> > this getting re-called repeatedly in a single test to the point where
> > it's creating a real performance problem for our tests?  If not, we can
> > probably just keep it simple and re-read the debugfs if this function
> > gets called multiple times.
> The main reason for caching in xe_get_pat_sw_config() is not performance,
> but
> correctness in the presence of privilege changes. In
> 
> igt@xe_oa@unprivileged-single-ctx-counters
> igt@xe_oa@mmio-triggered-reports
> igt@xe_oa@mmio-triggered-reports-read
> 
> these tests drop root privileges mid-run; after that, accessing debugfs can
> legitimately fail, and without caching the PAT layout we can end up
> re-parsing
> (or failing to parse) the table later in the same test run even though it
> was
> available earlier.

Using static in library code also generates the problem using in
multigpu scenarios. If you need to cache the result, do this before
dropping root privileges. IMO xe_get_pat_sw_config() should assert
if it can't get the PAT table. So whole responsibility of handling
this will be on the test owner, who will have no other choice than
caching the result before dropping privileges.

--
Zbigniew

