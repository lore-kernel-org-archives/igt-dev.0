Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87120606A321
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3kOixi0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3283C10E92E;
	Tue, 10 Nov 2026 11:55:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7748810E92E
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 11:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794311692; x=1825847692;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=55DSMsJvV/NyA7e3cMriqw5cf+ChBk82sRLJx74xOCo=;
 b=N3kOixi02pFeaUBeVTOiK38UdPEqtxq+MJU4DT6/HeD4BHsE0W8DYXP5
 Xmh4QatZ4gWGgU8pNVJkox1dixYjuvX4fDHj56u0lAjQKOhrqUiMRIqsG
 iQ5hChOIwloY3myP7peVjeNI6EzWcItoxrE4Vi1hN+PDvzd+gl5BnJUBb
 NacqhTF/zVIpEYO9lVmXmAgfJCL8KZogX7IArwc6zoQpVH7MZjnp4EV9x
 d6YI6/I7I1gc++TqKUj39tiqAUvINieB7OxEYPwBTeK+LUSNQ4vlVtxar
 fyB5z79o8jzUBmpXI/GZb9s3bX3BswRUynKcx+G2/Y+HxmmkPg6H7cLHv Q==;
X-CSE-ConnectionGUID: LMHWwegrQT64oU+kAUc7MQ==
X-CSE-MsgGUID: Uwvh0NMDSMaM/ANJIQZ8dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3088056"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3088056"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:54:51 -0800
X-CSE-ConnectionGUID: O1RCaiRrQJOo8M7DLSV4cA==
X-CSE-MsgGUID: aoM9AZ2BSOuBfpAiqtB4dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7961542"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 03:54:50 -0800
Date: Tue, 10 Nov 2026 12:54:47 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
Cc: igt-dev@lists.freedesktop.org, niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH i-g-t v6 3/3] tests/intel/xe_exec_threads: Add
 multi-queue CGP_SYNC replay subtests
Message-ID: <olahnebt7bud4pfreujrj44tdqdnzygyn76ptfjucrjiwvkvxv@jhqp4bnafwpb>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com
References: <20261106183246.14482-1-jagmeet.randhawa@intel.com>
 <20261106183246.14482-4-jagmeet.randhawa@intel.com>
 <7qstl6a3reqbsaweguauxk5xlczlivzskgwldvent6armei5iq@67tngcevxhs7>
 <9b99f4ef-1f2c-459f-9dca-14e0b10933b7@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b99f4ef-1f2c-459f-9dca-14e0b10933b7@intel.com>
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
On 2026-11-09 at 10:33:31 -0800, Randhawa, Jagmeet wrote:
> 
> On 11/9/2026 6:44 AM, Kamil Konieczny wrote:
> > Hi Jagmeet,
> > On 2026-11-06 at 18:32:46 +0000, Jagmeet Randhawa wrote:
> > > Add coverage for the replay paths introduced by "drm/xe/multi_queue: Handle
> > > lost message during VF migration":
> > > https://patchwork.freedesktop.org/series/165324/
> > > 
> > > A CGP_SYNC message can be lost during VF migration and is replayed by the
> > > KMD on recovery. Exercising that needs a CGP_SYNC queued or outstanding on
> > > a live multi-queue group when the migration lands.
> > > 
> > > A group serialises on one outstanding sync, so both CGP sources are needed:
> > > queue creation for registration updates, MULTI_QUEUE_PRIORITY for dynamic
> > > ones. Both are driven from the legacy and the compute mode paths, so a
> > > mixed mode run spreads the groups and the updates across both.
> > > 
> > > A group holds at most MULTI_QUEUE_GROUP_SIZE queues, so asking for more
> > > queues than that spans several groups and registers them in parallel.
> > > 
> > > Add MULTI_QUEUE_PRIORITY to issue a short burst of priority updates after
> > > each exec, alternating the values since the KMD ignores a set to the
> > > current value.
> > > 
> > > Add three subtests built from these sources, repeated under
> > > igt_until_timeout() with a bounded wall clock:
> > > 
> > >    multi-queue-many-groups                registers several full groups in
> > >                                           parallel from multiple workers
> > >                                           per engine
> > >    multi-queue-mixed-many-groups          the same across legacy and
> > >                                           compute mode workers
> > >    multi-queue-mixed-many-groups-priority drives dynamic updates on those
> > >                                           groups from a single worker per
> > >                                           engine
> > There are skips on LNL, PTL and BMG for these new subtests,
> > please add a follow-up patch 'intel-ci: Block ...'
> > as a last one in this series, or as a separate one, up to you.
> > 
> > Regards,
> > Kamil
> Thanks for looking.
> 
> The three core blocklists already carry a wildcard that covers these
> subtests:
> 
>   tests/intel-ci/xe.lnl.core.blocklist.txt
>   tests/intel-ci/xe.ptl.core.blocklist.txt
>   tests/intel-ci/xe.bmg.core.blocklist.txt
> 
>     # Multi-queue is not supported on platforms older than xe3p
>     igt@.*multi.queue.*
> 
> That was added in 758f22d62 and it matches all three new subtests:
> 
>   igt@xe_exec_threads@threads-multi-queue-many-groups
>   igt@xe_exec_threads@threads-multi-queue-mixed-many-groups
>   igt@xe_exec_threads@threads-multi-queue-mixed-many-groups-priority
> 
> They are also not in xe.fast-feedback.testlist.
> 
> If the run you are looking at uses a list that does not read those files,
> let me
> 
> know which one and I will send a separate 'intel-ci: Block ...' patch for
> it.

Hmm, sorry for noise, you are right, I forgot  about them
being already blocked. Just make sure you did not see skips
for these new tests in a Xe CI report.


Regards,
Kamil

> 
> If appropriate, Can you merge this patch series, Thanks!
> 
> Jagmeet
> 
> > 
> > > Registration and dynamic traffic are kept apart. Driving dynamic updates
> > > alongside many parallel registrations makes an update wait long enough to
> > > exceed the KMD sync timeout, which bans the group instead of leaving the
> > > update to be replayed.
> > > 
> > > v6:
> > >   - Issue the priority burst from the compute mode path as well, and make
> > >     the priority subtest a mixed mode one.
> > > 
> > > v5:
> > >   - Rename the worker count to MULTI_QUEUE_THREADS_PER_ENGINE.
> > >   - Move the dynamic array allocation to its own patch, it is not specific
> > >     to multi-queue.
> > >   - Place queues the same way in test_compute_mode() so the group limit is
> > >     honoured there too, and add multi-queue-mixed-many-groups.
> > > 
> > > v4:
> > >   - Keep the multi-queue extension at its only use site.
> > >   - Mask instead of dividing in multi_queue_group_value().
> > > 
> > > v3:
> > >   - Use the MULTI_QUEUE prefix.
> > >   - Drop the many groups flag and derive the group layout from the queue
> > >     count, since a group is limited to MULTI_QUEUE_GROUP_SIZE queues.
> > >   - Take the worker and queue counts from the section rather than deriving
> > >     them from flags.
> > >   - No subtest destroys queues, so the churn flag and the queue recreate
> > >     path are dropped: registration traffic comes from the repeated runs
> > >     under igt_until_timeout().
> > > 
> > > v2:
> > >   - Drop the secondary churn. A secondary cannot be replaced within a live
> > >     group.
> > > 
> > > Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
> > > ---
> > >   tests/intel/xe_exec_threads.c | 83 +++++++++++++++++++++++++++++++++--
> > >   1 file changed, 80 insertions(+), 3 deletions(-)
> > [cut]
