Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E1DCD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 00:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F1210E851;
	Wed, 10 Apr 2024 00:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4D1d5BA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D403110E851
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 00:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712709181; x=1744245181;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8s3FoYAr9jtWc+svNAhMbQ1fev/UQq6oIjhoqL74KMk=;
 b=B4D1d5BAGoC6Gu3X6mVOZsSNBr0zUb9JTferk9FsPlM3O+7pmwDL7cGK
 iqdkHJD3mnvb4Z/dGxI6jcE5jPMUD1EzU9+nbQ9JmJ2hVdCWNWzjFZyqU
 0b9nQgaenEQoAes2GXZKwa88mu3CHjFcb4681SCFJ8JmR9P+SEVrTFhtx
 ayySL4lmKikKq/XDoNc4rFmrvcuTzmPBRNeliCfRCXYiJaePG9g5F9p3t
 lQdhiBL0AhoNH0/jVkpKlCWFQmhiW6E4SLtCUJTMpTvpLuZqC0vEzRE1+
 rCwW14qGRwMella6Ceb1uDWCYERhZM7BUS0xOyQ5Leh6Ww/ceYxLvWHyh Q==;
X-CSE-ConnectionGUID: g+dvparvRd2205TzY/6dcA==
X-CSE-MsgGUID: zErigFpXQo+CnG0Hh1cjTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11825201"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11825201"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 17:32:48 -0700
X-CSE-ConnectionGUID: m9XFJXY8SfqB+Q3c4Yu2kw==
X-CSE-MsgGUID: W1pKt3LjQOSCXpjvObaJZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20417530"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 17:32:47 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 17:32:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 17:32:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 17:32:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAKX+2RFUlcDkx26PdbORYeIqlace8sUpN1Eg+tv6t5UAXA7sEbSqYqFOqn68yC1aSi8P0qiHvfyV1usYe/N7v7sxiVtMt3IUkK6mh94iZlP1uGiAImKxwV3cgTHoXWm/+dBkOCDdGMmZz43GTzt0Cgmsr2dP+LVyfv67SLKW/sxjin9AICEqUOHuAQW7AmdlZD39JXfQHEF9nQwMpJ1f98laSkvQykuQdlNXhmF4r5taeOnomvuTK/L4TDl+cp8662y2GF9pwRvPBHGB6nVoLSIc16RnKh0tA066h6/nNA0NB+RIe+5ankkfuz2BVVoRC8V/NrQ2O9nzMAgizU22g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXS7OKdd/UhQDqKin9A8E0A/UQ8z1V5/7whLKigLKxQ=;
 b=GkK+IXTtZw1VchOKJ/tQzuCXB2usBShB1q7A9/E1a739ZSm1D5Pr+6Ba55MWTwIcw6U2X65ZwcxX8FeQAiDRVCGMLiQWp35jw9H/X02TWxcONKqEOjoOVexuQpN1N0Col3JkLEk1102xGh4zs2PxD5hJvthMjAnTuSnu/Gs2BZt8ed/YkaaccKS8m6r6HXkjHZ+Re2fBrgvfaGeFuugZzprnaxzrISLzgOllPPG1p1QQd/Rl6ow1kaDa0vRvCbxi1UDiz9cCnVfTZl2WBsYC2zZxXv2gERMuTLj43B/ek0jdkMEGFdxTWg1/BR9EGYwS3FBapczkUeuj/ulWpcPHzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8278.namprd11.prod.outlook.com (2603:10b6:806:25b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 00:32:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 00:32:45 +0000
Date: Wed, 10 Apr 2024 00:31:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_store: fix sync usage
Message-ID: <ZhXd3lKD77Qv24FY@DUT025-TGLU.fm.intel.com>
References: <20240408174113.73617-1-matthew.auld@intel.com>
 <ZhQvjBlfDy3Lgr8k@DUT025-TGLU.fm.intel.com>
 <42ed0aab-c00a-4a80-91bb-899625277b36@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <42ed0aab-c00a-4a80-91bb-899625277b36@intel.com>
X-ClientProxiedBy: SJ0PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8278:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJ+S/p/EG3dLRvyi+p2Q9wkY9IqJVw0b+KtQvv4e4r3eets4mCICYl6Dp4H+K1ykoQcNrFlEbfwdz0vSSKMWlL1RFX6c1qvuqc6AU379g0krgtBSdVCCxLgKCfDBlg3tdMo7JqSoE+jiZq6Fz+Od9NTJogEVhXEAwSPfcDO0GoqWIVwgp7CNGYERePstBHyb/AufBT1yZKNXANNksixVHj2dHfHE0zoBeK15+CUOCjlCQ+UtUgdQp2dr3JrBg01xj/cuXdaLv+PC5fL97bGBBYgIS8Op+58qlU0Uh+BkPCNgnTh1sHMouZOGXLzod3YWekUycGCC5EHMPZ2/Hc+T7u33nPnt88/Mi+jVFcNnaP+jczVjXm5yg46deS3vXzt3j3I0E6XIrmiQa2n1EugPcoqkLBO8fIcq1kyF0CmGu5/JXPDTsG0RWp0+Mh//6gP9vx0bAKLlyXTMNtvFoXgi9n/EUIbZlKpr7kY3mFS3Aaw18o1QM16mLnY4ngdETLCCiC8B+YUDSNTeKg3oUIYTJtDRYkqiSZV3MAd5y1+X+dDNcYNtVriy0A5XNP4Ud7dKJaKbCKyJTOAb/81ZwbIsDz+wRFTJmU566WXmjFpDB/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S1Fh8mBsU1C5dD5BamgEmQFAehC5/jSb9il9ksiGLnmVfAvt2OLgtAhH9Bxy?=
 =?us-ascii?Q?YkUENu/uinT6Yc+MZsMAOmDfQ6waIGDzQe+ZTAdsaKlZj1k1Mk0Mw2Q6SGaG?=
 =?us-ascii?Q?VtmPkWv/slin3qh+sABvijhIHdbxMLOvY22BuDnmdYMOMvxn2Oy/qGuf4ECI?=
 =?us-ascii?Q?16xPRPgrdhpFa8Zc4wVpS3HDq3eqq5sr2X6mgcOpLCKnckpMMzqhNvGI0W3a?=
 =?us-ascii?Q?qpeogRLAhPOfpy+j9XIfB+tnqzdwxv4+fue7zI2A29WAHMzHLeHJ1aDan/Rj?=
 =?us-ascii?Q?PPCSZqqedh7brofYKk+Iau4oHY3ZwpeWwXHcsSxxptbyEEsJS2o5bQeMQ6uE?=
 =?us-ascii?Q?t0/A4nQuB7iPZHx9UlXhF2atkJaKKua+LwX3+RZDjjLCKjefGu6X0iLcfav5?=
 =?us-ascii?Q?+7gnKZyUsO9dTOzG221+ur2jttJOlY9gohTYBbk43OH5KrDM5V0qCirUmdaw?=
 =?us-ascii?Q?BEhIT82XEr7XmMMx6Gy0POFFgbq7OjkyI6GgpANLuu93KbsfCyVT2Is8Ip8e?=
 =?us-ascii?Q?Bs35SlGlMoS8M/Is8YT3nxU5NdTi1jZyEI7u+sORBDGT3YFZ5VYMd7/tnrsH?=
 =?us-ascii?Q?EfRM3FXEbuaFarece/3cofpOF4yM0PjkA6bsbQA9ivZgNE5knKODT9i/MEcs?=
 =?us-ascii?Q?j0qfLUFmVLAF+dPYHdwywa/IMKeenSZZ7pEOhabbmUFZES7bwSzqdTSjys3B?=
 =?us-ascii?Q?qQhayuXxDMhJe4XNlbZ1U+OTGg9doksWYqCs6anr9pfMEAPBjmcB2PYaQ/fy?=
 =?us-ascii?Q?jp33NNAfUnvmyij53BWm494c6xvzKLCxUXNNRgfalAJnvzGe863ROy4HTWuX?=
 =?us-ascii?Q?I15xhL9gaKqNRmNOjNnC/Mg5u6XSywvcHACHN60AU9j1xe8sIlDfBwZldoFB?=
 =?us-ascii?Q?T+Uyy4sV5Iz7aaWEJqiatitBz+c7AyUeMyVnddfaysZazTC724O/QDFpgtQF?=
 =?us-ascii?Q?VaeKOuDuMGTaC2N2nAode5Swgrwcdw5L/GEhV28HgMyOFfIW4le0mpDiOC7C?=
 =?us-ascii?Q?FLK+jLxD8YJRmnqOp/ZzzI5Un4kKzApeVwlX7dRkRV3SX5oKiIWncmRH+hrQ?=
 =?us-ascii?Q?QII9m1d9QAtEKvbYFXumylqnhEejDs6C0tilBj22HI6HZYIyOOJchUyk7e2G?=
 =?us-ascii?Q?A55LKR/XLsO3N9FATcYs9Tw2cSdXf7lB8VF2GVEP1REATv93mHl8iUYXm4Tt?=
 =?us-ascii?Q?R6lnxBhVppzSbSxocokRRTLGFx4beucVXki3+V7Cvkb4XZg280GI+rJM+CaO?=
 =?us-ascii?Q?gPASdGzNC+iCIFOnWPa/aJ/mYBO/zyr1im7dguQYPEUjawhUXI4ar8ZkVwnc?=
 =?us-ascii?Q?SkUn1AUscZ6B0mstTEVHLzgGx7OX8pPg+GZUCWmLrjaOmHIm3Smz6G2LrWna?=
 =?us-ascii?Q?PdrYpvL9RSmAjnAjTtrPtP0G1SZUCOZDsZgvF9DfP5G8wjBHtnRryRytRnWm?=
 =?us-ascii?Q?lRmJGXZmoin1D7e/ic+JihmuVeigCwj3Du6Vuzp5tdLp8VSNDyVejmBfYzpO?=
 =?us-ascii?Q?8H5R799CVypDKwB2TBQ1rK/zSzWTOMpolEv2yjBfdH2YyHHcLFBxw+Y7i3oi?=
 =?us-ascii?Q?Jb4gOCZguh8rqkZP82FdJpjx3RdQfEuHBlLk1ZivdW3e/peHcpdUHZCPBZSL?=
 =?us-ascii?Q?Yg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f3c8ef-0955-40d1-e467-08dc58f5bd75
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 00:32:44.9866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTfGsliFEY2BirVrU4ChD7pIPi28tHIRd8lGPRymPiOcylMZlqTJd+nOnS2JrWJEBMmeWulXYdicAzYT4jZYhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8278
X-OriginatorOrg: intel.com
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

On Mon, Apr 08, 2024 at 07:09:05PM +0100, Matthew Auld wrote:
> On 08/04/2024 18:55, Matthew Brost wrote:
> > On Mon, Apr 08, 2024 at 06:41:13PM +0100, Matthew Auld wrote:
> > > If using async binds it looks like an in-fence for the exec is needed to
> > > ensure the exec happens after the out-fence from the binds are complete.
> > > Therefore we need to unset DRM_XE_SYNC_FLAG_SIGNAL after doing the
> > > binds, but before the exec, otherwise the sync is rather treated
> > > as an out-fence and the binds can then happen after the exec, leading to
> > > various failures. In addition it looks like async unbind should be
> > > waited on before tearing down the queue/vm which has the bind engine
> > > attached, since the scheduler timeout is immediately set to zero on
> > > destroy, which might then trigger job timeouts. However it looks like
> > > it's also fine to rather just destroy the object and leave KMD to unbind
> > > everything itself. Update the various subtests here to conform to this.
> > > 
> > > In the case of the persistent subtest it looks simpler to use sync
> > > vm_bind since we don't have another sync for the in-fence at hand, plus
> > > we don't seem to need a dedicated bind engine.
> > > 
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1270
> > > Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > 
> > Changes LGTM but IMO we jus delete this test as I'm unsure what coverage
> > this test is providing.
> 
> Do you mean just delete the entire xe_exec_store?
> 

Yea, not sure how this test ever got added as basically every test in
the suite does a dword store. Probably along the lines of lets port i915
tests to Xe! Not seeing a ton of value in this one... Probably above my
pay grade to make those types od decessions though.

Matt

> > 
> > Anyways:
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > > ---
> > >   tests/intel/xe_exec_store.c | 22 ++++++++++++----------
> > >   1 file changed, 12 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> > > index c57bcb852..728ce826b 100644
> > > --- a/tests/intel/xe_exec_store.c
> > > +++ b/tests/intel/xe_exec_store.c
> > > @@ -102,13 +102,13 @@ static void persistance_batch(struct data *data, uint64_t addr)
> > >    */
> > >   static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
> > >   {
> > > -	struct drm_xe_sync sync = {
> > > -		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> > > -		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
> > > +	struct drm_xe_sync sync[2] = {
> > > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> > > +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
> > >   	};
> > >   	struct drm_xe_exec exec = {
> > >   		.num_batch_buffer = 1,
> > > -		.num_syncs = 1,
> > > +		.num_syncs = 2,
> > >   		.syncs = to_user_pointer(&sync),
> > >   	};
> > >   	struct data *data;
> > > @@ -122,7 +122,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   	uint32_t bo = 0;
> > >   	syncobj = syncobj_create(fd, 0);
> > > -	sync.handle = syncobj;
> > > +	sync[0].handle = syncobj_create(fd, 0);
> > > +	sync[1].handle = syncobj;
> > >   	vm = xe_vm_create(fd, 0, 0);
> > >   	bo_size = sizeof(*data);
> > > @@ -134,7 +135,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> > >   	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
> > > -	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
> > > +	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, sync, 1);
> > >   	data = xe_bo_map(fd, bo, bo_size);
> > >   	if (inst_type == STORE)
> > > @@ -149,12 +150,14 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
> > >   	exec.exec_queue_id = exec_queue;
> > >   	exec.address = data->addr;
> > > -	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > >   	xe_exec(fd, &exec);
> > >   	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> > >   	igt_assert_eq(data->data, value);
> > > +	syncobj_destroy(fd, sync[0].handle);
> > >   	syncobj_destroy(fd, syncobj);
> > >   	munmap(data, bo_size);
> > >   	gem_close(fd, bo);
> > > @@ -232,7 +235,7 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
> > >   		batch_map[b++] = value[n];
> > >   	}
> > >   	batch_map[b++] = MI_BATCH_BUFFER_END;
> > > -	sync[0].flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> > > +	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> > >   	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> > >   	sync[1].handle = syncobjs;
> > >   	exec.exec_queue_id = exec_queues;
> > > @@ -250,7 +253,6 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
> > >   	for (i = 0; i < count; i++) {
> > >   		munmap(bo_map[i], bo_size);
> > > -		xe_vm_unbind_async(fd, vm, 0, 0, dst_offset[i], bo_size, sync, 1);
> > >   		gem_close(fd, bo[i]);
> > >   	}
> > > @@ -300,7 +302,7 @@ static void persistent(int fd)
> > >   			      vram_if_possible(fd, engine->instance.gt_id),
> > >   			      DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > > -	xe_vm_bind_async(fd, vm, 0, sd_batch, 0, addr, batch_size, &sync, 1);
> > > +	xe_vm_bind_sync(fd, vm, sd_batch, 0, addr, batch_size);
> > >   	sd_data = xe_bo_map(fd, sd_batch, batch_size);
> > >   	prt_data = xe_bo_map(fd, prt_batch, batch_size);
> > > -- 
> > > 2.44.0
> > > 
