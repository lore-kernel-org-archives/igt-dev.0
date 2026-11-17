Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFDC606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 10:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z+++VzBU
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F57310E501;
	Tue, 17 Nov 2026 10:18:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E1910E501
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794910661; x=1826446661;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=dunQfROT3QZ60w7ZSAfOfKqEb35YAObncgHK0CJrG3U=;
 b=Z+++VzBUVU4hjn6IucrGI+O304jUDvK8y0tlPBR2ZXKgmeqkbsiT5IJQ
 pU70q37V5e9fmRnrjX6gx8VhP3b7HmLN10O7cyoXeQls57mFD1gB4ue7g
 ATXY3h9pVBpjN4m31K/xpwPB30W0AT04sIm7+ShPT9QY7GBI74pDQqzIL
 I12jak2prU88vJJWKfeQIy5eP1yP/bONthtKoqXDw8KNeahqfdxTRxKWN
 n0Z272WBE12HM0i/xWSPZ/Civp9wwG/ztHlpgvKvL5YH7yXC7YzcPEP07
 hmMX3lM6/NftZwN3WXfRXMPA1g21FrP5Cb+YbRBN6s3BWfhin5RKseTEd Q==;
X-CSE-ConnectionGUID: MqzU+JqoTsK8AKSUq89hrg==
X-CSE-MsgGUID: ixmX4FknTh+2ZyXmsalqbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3713430"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3713430"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 02:17:40 -0800
X-CSE-ConnectionGUID: gNgM4LXNRR+N+mKU3Gt0JA==
X-CSE-MsgGUID: JoXtXBIJQpSQ+0GqM4t7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; d="scan'208";a="10122184"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 02:17:39 -0800
Date: Tue, 17 Nov 2026 11:17:35 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Luigi Santivetti <luigi.santivetti@imgtec.com>
Cc: igt-dev@lists.freedesktop.org, alessio.belle@imgtec.com, 
 brajesh.gupta@imgtec.com
Subject: Re: [PATCH i-g-t] tests/imagination: add more heap info and static
 areas query tests
Message-ID: <5tjtwks5twc7y2k6ml4ha6t5k3rdg6276zr7qezmyvp5eznoij@2qrgteacllem>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, igt-dev@lists.freedesktop.org,
 alessio.belle@imgtec.com, brajesh.gupta@imgtec.com
References: <20261105-b4-heap-static-area-info-get-v1-1-8d5aa15a5e30@imgtec.com>
 <h6d6q4b7dn7spx2txawcqhw4kyryongkpwr6rlj7nmrvci6dl5@bsghmrdtlldo>
 <f665c6b38198de5b9fcd82e1f20bc6a124f3c7b1.camel@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f665c6b38198de5b9fcd82e1f20bc6a124f3c7b1.camel@imgtec.com>
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

Hi Luigi,
On 2026-11-16 at 17:13:39 +0000, Luigi Santivetti wrote:
> Hi Kamil,
> 
> On Mon, 2026-11-09 at 12:50 +0100, Kamil Konieczny wrote:
> > Hi Luigi,
> > On 2026-11-05 at 15:41:22 +0000, Luigi Santivetti wrote:
> > > Test the following combination of properties:
> > > 
> > >   P01. Make 1 ioctl call to query either heaps or static data
[cut]
> > > 
> > > Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
> > > ---
> > > This patch depends on one kernel series that is not yet merged:
> > > 
> > >   https://lore.kernel.org/all/20261104-ioctl-query-count-stride-fixes-v1-0-2bf86dd7cf29@imgtec.com/
> > 
> > LGTM
> > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > 
> > Regards,
> > Kamil
> > 
> > PS. ping me when you will want this merged, here on on irc.
> 
> I sent out a v3 with your Acked-by. This can go in now, for reference in 
> drm-misc-next we now have:
> 
> 17a180572ca5 drm/imagination: clamp count of heaps and static areas ...
> 2751fa2bc364 drm/imagination: clamp stride of heaps and static areas ...
> 
> Thank you!
> 
> PS. for my education, do I need to send a new version for tagging reviewers?
> 

Hmm, I already merged v2 with Alessio r-b so no need for more
actions. I see that there are quite a few Imagination developers
so I will stop sending acks and will wait for a review.

Regards,
Kamil

> > 
> > > ---
> > >  tests/imagination/pvr_heap_info.c | 585 ++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 585 insertions(+)
> > > 
> > [cut]
> 
