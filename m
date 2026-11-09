Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A4606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 14:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OP0SzB9a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D01410E066;
	Mon,  9 Nov 2026 14:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F243510E090
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794235475; x=1825771475;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5KsRhVwRYivzpe0zkFR/h20DlMI/bhvhv1x8KyQ6t0k=;
 b=OP0SzB9aDgFc8zCFmm2R1vsDY105vzlc5kdu8c4XzKjDPuGi4N3HjY/t
 +4kX2Cbe1BCYQ08uGS0pKSpDyphnYMcLl6hshYmt0DwXjcS+sAHatgBz0
 ipEZ1XpRNISPMk/cAppIR0IpdnPkoVfEIXIbgVoViPRf9Fw4ZGsitdNxT
 cD2hhC5yYxURPjcG7sODysE2o/OOeXWuA7ImuwGtSHHZBHnaTYPin3qck
 jrvhnxV0aJnbuZsSrDEaaDa29Tk1n9m1bLUurNYDq+sRmdLALmWRXPnJu
 ODCih7TTimPEIyiLbyxxC3D5A8G84SjS32qqGAmfv/uRvge30fkek1LYl g==;
X-CSE-ConnectionGUID: XLf4EfnmQOu4nBMMgDtyPQ==
X-CSE-MsgGUID: tFYsBJmxQGOffU3AUtoeOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2960463"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2960463"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:44:34 -0800
X-CSE-ConnectionGUID: A7jkWYO8QCqePijEgTUUEQ==
X-CSE-MsgGUID: xNzZ/TZgQHqs6tN1Yvbw1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8207899"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2026 06:44:15 -0800
Date: Mon, 9 Nov 2026 15:44:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v6 3/3] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <7qstl6a3reqbsaweguauxk5xlczlivzskgwldvent6armei5iq@67tngcevxhs7>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>, igt-dev@lists.freedesktop.org, 
 niranjana.vishwanathapura@intel.com
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-4-jagmeet.randhawa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261106183246.14482-4-jagmeet.randhawa@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jagmeet,
On 2026-11-06 at 18:32:46 +0000, Jagmeet Randhawa wrote:
> Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
> lost message during VF migration":
> https://patchwork.freedesktop.org/series/165324/
> 
> A CGP_SYNC message can be lost during VF migration and is replayed by the
> KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
> a live multi-queue group when the migration lands.
> 
> A group serialises on one outstanding sync, so both CGP sources are needed:
> queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
> ones. Both are driven from the legacy and the compute mode paths, so a
> mixed mode run spreads the groups and the updates across both.
> 
> A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
> queues than that spans several groups and registers them in parallel.
> 
> Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
> each exec, alternating the values since the KMD ignores a set to the
> current value.
> 
> Add three subtests built from these sources, repeated under
> igt_until_timeout() with a bounded wall clock:
> 
>   multi-queue-many-groups                registers several full groups in
>                                          parallel from multiple workers
>                                          per engine
>   multi-queue-mixed-many-groups          the same across legacy and
>                                          compute mode workers
>   multi-queue-mixed-many-groups-priority drives dynamic updates on those
>                                          groups from a single worker per
>                                          engine

There are skips on LNL, PTL and BMG for these new subtests,
please add a follow-up patch 'intel-ci: Block ...'
as a last one in this series, or as a separate one, up to you.

Regards,
Kamil

> 
> Registration and dynamic traffic are kept apart. Driving dynamic updates
> alongside many parallel registrations makes an update wait long enough to
> exceed the KMD sync timeout, which bans the group instead of leaving the
> update to be replayed.
> 
> v6:
>  - Issue the priority burst from the compute mode path as well, and make
>    the priority subtest a mixed mode one.
> 
> v5:
>  - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
>  - Move the dynamic array allocation to its own patch, it is not specific
>    to multi-queue.
>  - Place queues the same way in test_compute_mode() so the group limit is
>    honoured there too, and add multi-queue-mixed-many-groups.
> 
> v4:
>  - Keep the multi-queue extension at its only use site.
>  - Mask instead of dividing in multi_queue_group_value().
> 
> v3:
>  - Use the MULTI_QUEUE prefix.
>  - Drop the many groups flag and derive the group layout from the queue
>    count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
>  - Take the worker and queue counts from the section rather than deriving
>    them from flags.
>  - No subtest destroys queues, so the churn flag and the queue recreate
>    path are dropped: registration traffic comes from the repeated runs
>    under igt_until_timeout().
> 
> v2:
>  - Drop the secondary churn. A secondary cannot be replaced within a live
>    group.
> 
> Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> ---
>  tests/intel/xe_exec_threads.c | 83 +++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 3 deletions(-)
[cut]
