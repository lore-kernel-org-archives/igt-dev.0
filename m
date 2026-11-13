Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26F606A891
	for <igt-dev@archiver.kernel.org>; Fri, 13 Nov 2026 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l4yuojoU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C4510E7E5;
	Fri, 13 Nov 2026 16:12:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F6E112697
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Nov 2026 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794586297; x=1826122297;
 h=date:from:to:subject:message-id:references:mime-version:
 content-transfer-encoding:in-reply-to;
 bh=kRwWiCcoeSwB5+iVSvddPQzUWLI7H4ql1Qf6gsAPnLw=;
 b=l4yuojoUbGvPCnAAwwRW8hGsUZGC3abSmDEhrqcaCj7Tn2arftn32bkL
 vLKQLUpERo2Ot3B+D3JcOJxK14U510E0yQPDwsQU72E8RnufKTUwgM7JE
 QcqdvoWt9q4V/Mu9Yky9PPxPfWKZBu+GWv+J54+eN7gIZuDSvk6MwBPe3
 Oc3JTQoASdj+rR72caQuT0USjp7WXrIZP+2qIaZa8U94UPxoDutbFeDbB
 sXKqlAcBKvRRMsVNZlvPdgS4Bbf/p2xKH+FNGBWePtbX5DfYSEE5p0LtC
 +n/7k7pZifJ/ZFzjtrZLGpcXDjTvqgFcGJi8DvD66Gwh4x9D6JMDZpJN4 g==;
X-CSE-ConnectionGUID: UxFRHvk5R0uSvZ9F42uNIQ==
X-CSE-MsgGUID: ll1nMWldQd2i8a0Dvr6Arw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3298484"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3298484"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:11:37 -0800
X-CSE-ConnectionGUID: h1ZiSV+MSQ62UITX3CqETQ==
X-CSE-MsgGUID: XsMl9cZ5SdSy1TuNk6AIDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8968215"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2026 08:11:36 -0800
Date: Fri, 13 Nov 2026 17:11:20 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, 
 igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v6 3/3] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <iqfbmktmouv5zss5osryitmkeh6hcirazxtrfwpikvz42lnyos@ekcc3of3w27d>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-4-jagmeet.randhawa@intel.com>
 <7qstl6a3reqbsaweguauxk5xlczlivzskgwldvent6armei5iq@67tngcevxhs7>
 <9b99f4ef-1f2c-459f-9dca-14e0b10933b7@intel.com>
 <olahnebt7bud4pfreujrj44tdqdnzygyn76ptfjucrjiwvkvxv@jhqp4bnafwpb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <olahnebt7bud4pfreujrj44tdqdnzygyn76ptfjucrjiwvkvxv@jhqp4bnafwpb>
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

Hi Randhawa,,
On 2026-11-10 at 12:54:47 +0100, Kamil Konieczny wrote:
> Hi Randhawa,,
> On 2026-11-09 at 10:33:31 -0800, Randhawa, Jagmeet wrote:
> > 
> > On 11/9/2026 6:44 AM, Kamil Konieczny wrote:
> > > Hi Jagmeet,
> > > On 2026-11-06 at 18:32:46 +0000, Jagmeet Randhawa wrote:
> > > > Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
> > > > lost message during VF migration":
> > > > https://patchwork.freedesktop.org/series/165324/
> > > > 
> > > > A CGP_SYNC message can be lost during VF migration and is replayed by the
> > > > KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
> > > > a live multi-queue group when the migration lands.
> > > > 
> > > > A group serialises on one outstanding sync, so both CGP sources are needed:
> > > > queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
> > > > ones. Both are driven from the legacy and the compute mode paths, so a
> > > > mixed mode run spreads the groups and the updates across both.
> > > > 
> > > > A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
> > > > queues than that spans several groups and registers them in parallel.
> > > > 
> > > > Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
> > > > each exec, alternating the values since the KMD ignores a set to the
> > > > current value.
> > > > 
> > > > Add three subtests built from these sources, repeated under
> > > > igt_until_timeout() with a bounded wall clock:
> > > > 
> > > >    multi-queue-many-groups                registers several full groups in
> > > >                                           parallel from multiple workers
> > > >                                           per engine
> > > >    multi-queue-mixed-many-groups          the same across legacy and
> > > >                                           compute mode workers
> > > >    multi-queue-mixed-many-groups-priority drives dynamic updates on those
> > > >                                           groups from a single worker per
> > > >                                           engine
> > > There are skips on LNL, PTL and BMG for these new subtests,
> > > please add a follow-up patch 'intel-ci: Block ...'
> > > as a last one in this series, or as a separate one, up to you.
> > > 
> > > Regards,
> > > Kamil
> > Thanks for looking.
> > 
> > The three core blocklists already carry a wildcard that covers these
> > subtests:
> > 
> >   tests/intel-ci/xe.lnl.core.blocklist.txt
> >   tests/intel-ci/xe.ptl.core.blocklist.txt
> >   tests/intel-ci/xe.bmg.core.blocklist.txt
> > 
> >     # Multi-queue is not supported on platforms older than xe3p
> >     igt@.*multi.queue.*
> > 
> > That was added in 758f22d62 and it matches all three new subtests:
> > 
> >   igt@xe_exec_threads@threads-multi-queue-many-groups
> >   igt@xe_exec_threads@threads-multi-queue-mixed-many-groups
> >   igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority
> > 
> > They are also not in xe.fast-feedback.testlist.
> > 
> > If the run you are looking at uses a list that does not read those files,
> > let me
> > 
> > know which one and I will send a separate 'intel-ci: Block ...' patch for
> > it.
> 
> Hmm, sorry for noise, you are right, I forgot  about them
> being already blocked. Just make sure you did not see skips
> for these new tests in a Xe CI report.
> 
> 
> Regards,
> Kamil
> 
> > 
> > If appropriate, Can you merge this patch series, Thanks!
> > 
> > Jagmeet

Applied, thanks!


Regards,
Kamil

> > 
> > > 
> > > > Registration and dynamic traffic are kept apart. Driving dynamic updates
> > > > alongside many parallel registrations makes an update wait long enough to
> > > > exceed the KMD sync timeout, which bans the group instead of leaving the
> > > > update to be replayed.
> > > > 
> > > > v6:
> > > >   - Issue the priority burst from the compute mode path as well, and make
> > > >     the priority subtest a mixed mode one.
> > > > 
> > > > v5:
> > > >   - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
> > > >   - Move the dynamic array allocation to its own patch, it is not specific
> > > >     to multi-queue.
> > > >   - Place queues the same way in test_compute_mode() so the group limit is
> > > >     honoured there too, and add multi-queue-mixed-many-groups.
> > > > 
> > > > v4:
> > > >   - Keep the multi-queue extension at its only use site.
> > > >   - Mask instead of dividing in multi_queue_group_value().
> > > > 
> > > > v3:
> > > >   - Use the MULTI_QUEUE prefix.
> > > >   - Drop the many groups flag and derive the group layout from the queue
> > > >     count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
> > > >   - Take the worker and queue counts from the section rather than deriving
> > > >     them from flags.
> > > >   - No subtest destroys queues, so the churn flag and the queue recreate
> > > >     path are dropped: registration traffic comes from the repeated runs
> > > >     under igt_until_timeout().
> > > > 
> > > > v2:
> > > >   - Drop the secondary churn. A secondary cannot be replaced within a live
> > > >     group.
> > > > 
> > > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > > > ---
> > > >   tests/intel/xe_exec_threads.c | 83 +++++++++++++++++++++++++++++++++--
> > > >   1 file changed, 80 insertions(+), 3 deletions(-)
> > > [cut]
