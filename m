Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D53EC3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 17:02:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BE510E4EC;
	Wed, 14 Aug 2024 17:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jrV70dnw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BB610E4EC
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723654922; x=1755190922;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NRmdf13SjhYK+VFGZNHtz0cPRVlYywSVfmuM0sVId5c=;
 b=jrV70dnwAbRknUhlr8sxGPdg/s4r5yCnFw196d87rt0fwqZ053PXNGPd
 eyzGDcFHveM5UtUVEi/iIscvQSYOdgguPRuTU4VQSh0X7/Zdt2PJZ8J0z
 TX2jNaofJODzmj62Zebvj6fso3UUYJbN5EtrJkir73mwxIJMvM+wMtGg0
 wJxmUNfNFys3K/YzcO1/OcT46Tjepq0VKDzqYYr8St1g41lCtZF47Dc1T
 kCYY918s8r+9lt0YvuSg18IeTwOta/UImWU4t4DLnGGZ7k4xg6+DrVylc
 fsOlvEkoJT40VX3jAXD9snjsMa8QrE5O4OMSDkwtMCsGQk6Vi486bNQT0 w==;
X-CSE-ConnectionGUID: DWyUv2mBTM6FGhD63dvJJA==
X-CSE-MsgGUID: 29HSz533QYCMSxxZPCK3Ww==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22026196"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="22026196"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 10:01:59 -0700
X-CSE-ConnectionGUID: 9WEKPyRkS9mrlp35Yr46Bg==
X-CSE-MsgGUID: SQFlqjIKTXeJwBxjCvuR7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="63738674"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Aug 2024 10:01:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 10:01:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 10:01:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 10:01:41 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 10:01:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MdPesDdwXceDhY9M48BR03+fyvrP4ocBRAxux+AqyAkm+UAglH9MbML179KSI3IPdrwSb1IAXwSY5VRDBrVJFSoL8o1TBFoG8PStx/QqVn4NebZdAlu2FlnLBciQ1FyU7DgvEH4Z+gNLECsNwOVUpPelREdBDd/TtvLqpLL/RjLFF/tzGR2K3YY4FJXusoULw1JpYF6k39IQyYhCtFjQybEjOfUu7wyHATv3dKrB3PUO5f+W141ps4+dN/dVsuhCVZyAPVvW1KTTKY4XtKXvIZPDAcH4kE9wqcaQKhH8SkFVQCmtzM6kLK7gYDPMeuHny+p+Q4frXaNDpaJDbBC3FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTZaJwfBuewgoGGLecYVvVYBBgiXXJ/Gz0iIAnaJ4/U=;
 b=ZafELDrGRoNt9YLu96BhL60S1QwuMYMyLXI8mu3VaAVDqPLyYYphyab/rZAIrIW3PlvWH4hJGrwpDsRY1fTASzp3Rf3VCI/2fPWEvIQQzZERGxqpzIXLr+7VXi0x6ED6k5R5kZSTrSvDFH7c8LPTiydOxbgWjeWa1M++TTnpiNzZ4JT0221NLUxQVb09l1jrWFR8MT4ETr+RcmD8EF+8lr2GGRINRLITVUyUy3NJzkgoBhM1O1qKo32sqijdGIeQMjfjY8XoHVQdoPvgwRa2JmcHOLBXp6OEY6DbyYpD26UfcGwWZR+gJZa9MI6dIrqTPuwOujU3Ir6gmsZb9MynkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6833.namprd11.prod.outlook.com (2603:10b6:510:1ec::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.17; Wed, 14 Aug
 2024 17:01:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7828.031; Wed, 14 Aug 2024
 17:01:28 +0000
Date: Wed, 14 Aug 2024 17:00:26 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH] tests/intel/xe_vm: Add BO partial mmap test
Message-ID: <Zrziqop1SbeXjKRc@DUT025-TGLU.fm.intel.com>
References: <20240814155854.3846990-1-matthew.brost@intel.com>
 <65bdf684-e606-41e1-8744-dafb878c809a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <65bdf684-e606-41e1-8744-dafb878c809a@intel.com>
X-ClientProxiedBy: BY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6833:EE_
X-MS-Office365-Filtering-Correlation-Id: 94cb19b4-14c4-4151-d926-08dcbc82bd3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?76nYbfBfAVQ2FmqhrUpBImsh42P2Y032GLTFHsjAFOzMNiCQ2pbh6OqdmTNb?=
 =?us-ascii?Q?0G/xVSaaMIm578NN+hPvppR42i6+1YJ+U9cmc9dX7F1xmutVKQurtYUrSWhA?=
 =?us-ascii?Q?aYbnWoo28o1ANiYGlUu9Ap93HVVVTKaPzihsEOCcEovm+K1b0doJOixEFSNA?=
 =?us-ascii?Q?c9N5OUvD7wspbhhF5vKR3sR3uQZ5SKaGVvOQfYF0axdGCRFSVHkzj1S5R1Kq?=
 =?us-ascii?Q?p41Ei1brs1/Flkcr1XttFVzFRnWUGWzixFM50Qi1vMNn6D6dZ9ZwQwCg3dMp?=
 =?us-ascii?Q?t/urqh5MCotcEadGL1QvXoCVqWdOrqHud00cE0+5CIap72r7cepH1zIn+YFm?=
 =?us-ascii?Q?nry5DLpw38D+NonXYa9QoG3AorQLvQJ9gcXMoreYcnZ2UiXy10BCDOdihZJn?=
 =?us-ascii?Q?gPRlcbpt9ff2qPMMBUI+CAih3NsZUKpecmyN9QjsbcScTRAuEAAEQ8wZ49By?=
 =?us-ascii?Q?PosF8IeOHdS4mpDJlDHRpNFk/28htioTqTQPf2s05apNpqo2qthVCHEYxnzd?=
 =?us-ascii?Q?07CgG/FOUq1GdTH6KHsUtBR8w3a5fzfwkBYFu7ozO6QyVtX6jnM/kI5asTXR?=
 =?us-ascii?Q?qNNuDqUIhowin1rM+cj2vIsh6HZ0dOkM8CahvOD2ua+LEENsObIySeQ8HaSp?=
 =?us-ascii?Q?r++D0/uPx/j6pLCJkJDSUDAsOQx1STeAzLJ4CsbagXwLZe8rAqUHaaj21kl4?=
 =?us-ascii?Q?LBSgHvnGobIe6oPBhHXBEcJcCbNTc5zQesPMSjlCaHwFUPtXs2iH7+W//QBo?=
 =?us-ascii?Q?AWeCYp1dHYczTMsp3nsO3RNy0G2nIwWKfZOmijvF0BxJkUCmSdM0exdKCpwP?=
 =?us-ascii?Q?gS3ETo6clissKTdVre+YpU/AIO1aEHgGdEi/TOBzyCYB9mjOTQlXojNyqvHD?=
 =?us-ascii?Q?k3MOe71rT2x2AcGfJUy5h7zF4XkNOWXT+NDiilqIjrna4E/6E7KsRVhRZs2J?=
 =?us-ascii?Q?v8iuOh7GapRgEIwBCkfE9YTSiiDjedoDY9PFI+cSdVPXDhQ0QJhf0sCgeS/w?=
 =?us-ascii?Q?iP7SfCMZV5vwn3q2qLlTKyLkOYueK0K6jkDC2MLfOoHTzfM6+LFi+XFvx7Dw?=
 =?us-ascii?Q?Bj96peNFGspCCEnQrMdDXit7G//aigWDUPg1MaFT6uMg/o5wPdoyqglVk9Vw?=
 =?us-ascii?Q?dr6yMuddeQpktWwCDvigZuY1Ll8xKnVOIOWCQGoDpxBDC5aJZcpYIkWevYxU?=
 =?us-ascii?Q?me+arZo9kxYOeErJPqieel4FikU5AoiQ7/+L2TtGpaGYwnN6hupotQAjMi/D?=
 =?us-ascii?Q?t6MNvq0Mvh5e/tsQY0p4Rtjfb/TbSRS2bVtocPcn2LZkeDwfKVFHRUdSlBie?=
 =?us-ascii?Q?H2A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ruk8Vd2wt4uTyQPDt8/pKpewPkZo60OywQYkZXKP8zNaFAMqW3nx99BgM0hs?=
 =?us-ascii?Q?pvckPSPDoxP+7uZik81hbXfhgqmWCHF3DgLj0gmad/8K6oZC+HAAo9lINhOt?=
 =?us-ascii?Q?Ru1i7Pzfc1abhPmAErY1UWdMaNGaSDg6WaunKBP2fvWZyVmLOYBEGucfUC01?=
 =?us-ascii?Q?zuhG6lKk5za0NkIuj1uO8YA+JSVgDyYM3uDOLEm8U/wCAq3f66a2nM6BmO7G?=
 =?us-ascii?Q?1buHVtN6/Dmc4mAyj86Ky54HTNcgE6Zjai3rgwMSgJ+rU2CBs/zppXx4zi33?=
 =?us-ascii?Q?ubp7sl0T2b8ao+4nLfa+Km5yxv6w0h7m95Sm2Ms+DTmo3qWPQYhUIhotB3nF?=
 =?us-ascii?Q?fZY3vLAvl+hHZIlfj7yWpT+TOfxvk287cFD0zVwIJjV++dVQGuYoqsWL4jo+?=
 =?us-ascii?Q?7kw9P6ZTpF1FJFsIHtN9ZXk7Yp61JWD9kQ70AS1kyeaBWPgiRYge6faCZ2R0?=
 =?us-ascii?Q?yju+PjU/4Qkosb9PP09s1aggHeRivbsflPA1Z4HQhbVt3R0IrMkcei+SBJjs?=
 =?us-ascii?Q?7eKYJIzQC4wIq360b4nU/LP/V1CC6CT/9SstHMWIyggEQfKWwflvq+/EWoKo?=
 =?us-ascii?Q?1dRDUQkxbq49Mp/Bq6cNzW6k5XstaZteYftvokgXOBLcU0w9i9kLEc0y02Ba?=
 =?us-ascii?Q?7m3y+sxC7W7389v6TIQR6tODv48y48xX30XP1oo3u0ipWyFZ1XyPTUYQLc8k?=
 =?us-ascii?Q?A97ZNSghYhyLLZxel3RZSR7/KwDeLregMpzU6jkLzUWuusjLU5fDZRWnjoy/?=
 =?us-ascii?Q?bN8eL4ew1ui/ggZ2XhOsk+CT3JmoED34DlQ7sUpndakglnEroDDm1xnRla11?=
 =?us-ascii?Q?49hRHBJ/F8EarR7I82kEtzVqQ56txLp1UP3jk7YuwGDt3RSkcD1Zu56O68Qy?=
 =?us-ascii?Q?A7J7LnTh47Rd1uySFg7iC34ep+FZBf2dqykXAyTaFi67eiOZA1Xog7Rliw4t?=
 =?us-ascii?Q?DyhJXBPIhFFhaJcpYSQY3b66AmLMZD/jJ2uHkBItEu6x+iYJIsNc0t3heUq0?=
 =?us-ascii?Q?DuRKg7Q1ThI1TjpgZhXFBPP2tQznQG5pTT2O7oqTG0O0WhD67wmxEjFRKoTm?=
 =?us-ascii?Q?hzTyJWJJcDnrFUnXXfo0cJzvYHoX+JsgVt/FdCbJAxrEPhO4l3HweKhyYaPY?=
 =?us-ascii?Q?DNhfnGGIyabVjCcrF2X5TmP4gwacfiT6Y8PK5cl5ymlIj7s3QS4MWA2cexY8?=
 =?us-ascii?Q?ym/W4YFbIAIZ5/UHioa6UAEGlOBSiSHBrHBbmzh2MjuGb7TIZWIj2Qc8Q/tg?=
 =?us-ascii?Q?I5+MsEk/lcdkXmEXZdIpqGFqUieyObVncTgRYTHUskhM+LFQgh5PqDeK5sdN?=
 =?us-ascii?Q?1HhK7PvSZe7qWL2hq+kNqsBnU2kqGJavoMbra+ynYCOihm/kTawgaYgjm8Dp?=
 =?us-ascii?Q?j/DiJE7RE+iQ+b42TgVbhmGt9xUkOP124Al62OlahHymUdc4guNOVqSDwVoB?=
 =?us-ascii?Q?jT2WdkGUYwwdDATGnTbaA+M7Gc4CN+nPq8ONEbTo+GSmYeHui0fLH28l9N1J?=
 =?us-ascii?Q?gLPoTtwBxyIVfptws3SjsoNexQqw+edOoZmT5llGQeDDEPD7kmEeB+y2AQsg?=
 =?us-ascii?Q?t1aFW3gegSou25n9vMiEUqy5AHkmAVAiFDQDXHuB5iuM2/XuFMTy8ybRiOKq?=
 =?us-ascii?Q?kQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94cb19b4-14c4-4151-d926-08dcbc82bd3f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 17:01:28.7719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7s206JgotXFA3nN2Nx7LOHgFDwkMhu0nk7zl+g7ZZ/3kEY7iBvgOgayup1KiCKvOAMcG+4Y8060WyIc4sFJUdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6833
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

On Wed, Aug 14, 2024 at 05:48:19PM +0100, Matthew Auld wrote:
> On 14/08/2024 16:58, Matthew Brost wrote:
> > Ensure BO partial mmap works by setting a BO to 0, partially mmap BO and
> > setting to a canned value, and then mmap entire BO ensure data
> > integrity.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   tests/intel/xe_vm.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 53 insertions(+)
> > 
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index c3960fedee..57534a2a8c 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -106,6 +106,56 @@ test_scratch(int fd)
> >   	xe_vm_destroy(fd, vm);
> >   }
> > +/**
> > + * SUBTEST: bo-mmap-partial
> > + * Description: Test partially mmap of a BO
> > + * Functionality: BO mmap
> > + * Test category: functionality test
> > + */
> > +
> > +static void test_bo_mmap_partial(int fd, size_t bo_size)
> > +{
> > +#define MMAP_VALUE(idx)	((0xdeadull << 32) | idx)
> > +	uint32_t bo;
> > +	uint64_t offset;
> > +	uint64_t *ptr;
> > +	size_t partial_size = bo_size / 2;
> > +	void *map;
> > +	int i, j;
> > +
> > +	bo = xe_bo_create(fd, 0, bo_size, vram_if_possible(fd, 0),
> > +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> > +
> > +	/* Set to zero */
> > +	map = xe_bo_map(fd, bo, bo_size);
> > +	memset(map, 0, bo_size);
> > +	munmap(map, bo_size);
> > +
> > +	/* Partial map */
> > +	offset = xe_bo_mmap_offset(fd, bo);
> > +	map = mmap(NULL, partial_size, PROT_WRITE, MAP_SHARED, fd,
> > +		   offset + partial_size);
> 
> So does this also then fail with:
> 

Indeed it does fail. I pushed this as reference to the following series [1].

Sima brought it to our attention that Xe doesn't support this, confirmed
via this quick IGT. Discussion is ongoing it this is needed in the i915,
if it is, then it also need in Xe. See all the replies to the cover
letter on the list.

[1] https://patchwork.freedesktop.org/series/137307/

> > +	map = mmap(NULL, partial_size, PROT_WRITE, MAP_SHARED, fd,
> > +		   offset);
> 
> Or it that allowed? From looking at the kernel side it looks like it's maybe
> not rejected?
> 

The kernel currently rejects. A quick fix is [2] in
drm_gem.c:drm_gem_mmap.

[2] s/drm_vma_offset_exact_lookup_locked/drm_vma_offset_lookup_locked

> Also you can get partial mapping with partial munmap, should we also test
> that to make sure nothing blows up?
> 

For sure, the test needs to be robust if we decide to support this.

Matt

> > +	igt_assert(map != MAP_FAILED);
> > +	ptr = map;
> > +	for (i = 0, j = partial_size / sizeof(uint64_t);
> > +	     j < bo_size / sizeof(uint64_t); ++i, ++j)
> > +		ptr[i] = MMAP_VALUE(j);
> > +	munmap(map, partial_size);
> > +
> > +	/* Map entire BO and check */
> > +	map = xe_bo_map(fd, bo, bo_size);
> > +	ptr = map;
> > +	for (i = 0; i < bo_size / sizeof(uint64_t); ++i) {
> > +		if (i < partial_size / sizeof(uint64_t))
> > +			igt_assert_eq(ptr[i], 0);
> > +		else
> > +			igt_assert_eq(ptr[i], MMAP_VALUE(i));
> > +	}
> > +	munmap(map, bo_size);
> > +	gem_close(fd, bo);
> > +#undef MMAP_VALUE
> > +}
> > +
> >   static void
> >   __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
> >   {
> > @@ -2354,6 +2404,9 @@ igt_main
> >   			}
> >   	}
> > +	igt_subtest("bo-mmap-partial")
> > +		test_bo_mmap_partial(fd, SZ_2M);
> > +
> >   	igt_subtest("bind-once")
> >   		test_bind_once(fd);
