Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170F0C5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 01:51:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEDD210E070;
	Wed, 19 Aug 2026 01:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDJNPKko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4329D10E070
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 01:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787104260; x=1818640260;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WRA2unS4CsOyLUXxSSXmy9S9s4v7yzaBL6oLCzTer3A=;
 b=GDJNPKkoedOt0fyzLa6YqDB1p4hcC4J7iNMTQmuU2pTK+bifzJUl7Ze0
 gFa1/GWO1HwLdFwRG+fbyn4L26vPkbqEM2bwIp6esrhzNJ6MfIsm6blz1
 +gPpbzVDVuULFGEy/22kPDhFsCd+wYYo2V0Ie7d1PgwcwqRVvGG4BJ2AJ
 f1V0XivfUl5JZjqq1GbwJKyb+QIdMscuNiGsfCu24TTljrDPZqezxNYbh
 D3aMu3jx6Hw+O1G71KqR92C3yuLIU9p+l8xUoZf+35I1u4cxihfE3z4Zh
 ButcF7jmurIO03kCvc1XVNaWrBHJ8oybag8UtvE/xDmseFvlUuDNUMdPr g==;
X-CSE-ConnectionGUID: 7f3aGpGiTAKFNXgtnUhuoQ==
X-CSE-MsgGUID: fTG4U7y+QD6Vu8ikJPjbKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="98969489"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; d="scan'208";a="98969489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 18:50:59 -0700
X-CSE-ConnectionGUID: cM/0/8O8RuSTb9jZihKjSw==
X-CSE-MsgGUID: N16Evcn2TCOSqGbTdL0eSg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2026 18:51:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 18:50:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 18 Aug 2026 18:50:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 18 Aug 2026 18:50:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROVOoCGt+nvgC+8P5a+hfD3oqh+kRCmqwAwYqo7/q8qq0flX8pGeB0NB0Wpg0cxuj+3Wd1noW1SdLSa0nzSXv3HBNzPzGg9LTRMgXSZbPpek9SdH5xx259iNK0mEYK72FMm0fVvSr/NqHR6sfhn8pVfILuc3ef5S9iIVywhVc82E3UasF3xuGYWu2OSRPoYnAQULc0enEuI1RKVdozelHX6e/J+cNu/t1CQmsyYfgQdMxmfWGXs2gmbRlZ/9loNYVUP5alF5iF3F55qrShuZaRSq2mCe6+BH2skNIeXonArtN7+M9CwDuyTIVuSYEUr7EBhjnpjj62UfvedTkJL4HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsGEZvJmO456FqMLqo4FJNjs8lOZYbMcvGhZZBV3GxA=;
 b=QxSRkUaQIlOL1MM7w1+mLkF96Fmpm1QsjHz6fD/zTpbyHLjLnNNG0tYdr9uEsz4FGumako/Q25M2142e8KQKIimU1gq0Y5XBEvlvBOO9v8jhh+Qg2DKYoWAbk72i0SUxUz16YCZtu09TrX2GqyJAiBfrr/vrTqMUAV9ctxSCXkYImTm0Y8Qph+iJOjkSSh7rw9C++V+qWsKAFxUYX/SvEhUOPI4rYDHUatHo2EW3/yWPXLRIdPbQ2QbGPrpn7F/MDf+JkrZr972itjxtH+Odueax+cFiLjmUhSSoyGJACLElmA4KEsi0cLKfBHZ3+71wFUrUpLyIQrvKuEDopfwqkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by SJ2PR11MB8469.namprd11.prod.outlook.com (2603:10b6:a03:57b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 01:50:54 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%4]) with mapi id 15.21.0315.014; Wed, 19 Aug 2026
 01:50:54 +0000
Date: Tue, 18 Aug 2026 18:50:51 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t] tests/intel/xe_exec_mix_modes: Add multi-queue LR
 spinner switch subtest
Message-ID: <aoUL-8TzCIdTWFn0@nvishwa1-desk>
References: <20260817200029.16006-1-jagmeet.randhawa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260817200029.16006-1-jagmeet.randhawa@intel.com>
X-ClientProxiedBy: SJ2P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5da::8) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|SJ2PR11MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: dab38d15-bb19-442f-2cc8-08defd944e05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|22082099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: QRY9J/hFNOoWTB5cJcJiqBFKCflmxoBTcDKdERPB61YN/E1EHZvaXvsUGCve6Dla5SnDgVD7FyyCkoSJTZjtbMgnMyyJJqQzn94H/4D73ZikCHWLqluGP6TrbvS7WspXPn5DniaITHRp6W7EdZkt8Oe6IOoPMSHFCCMpHJKyvPzKvTkVM2t27N+tVatr5qxZ8mZnBcB9q8T6lMesdVG5iye1eQYmNn0Ic4MzmEhirv030bdz3IekRlFMW7IJrz8Fi9Q8ptdHZJzfaqDMUiBqn558RRXZECwB/ht6F56vOXRUIqL+rlX+UXahM61ExU8Jm6YTCMoYwvqtZCCSNZ9VmmtDtexmBC+vlcONpZ5bQ6oCAWD/rxu8NUbgC8UP7rLgroN30fzyE8V5SDFMvjlnqq5pg+iFRbm63t6YseGD9ktpO8GWHFgX+UyD9bNwVjF6bBxyCfyl/weFbGaRb5CoRnawpxrRqKCNRFXSfFUxHzd7RFKFA7ZhvlryVNkNCXOkhfknqmx+IwryKFHsCmq93/EByCpXM2X2BD8fXuY2DhGfkN7rXptTLZP6CjvHHLNns2LdNnqauKv/YlLWGOSLk5+6529ERTKunmc87vw7AOf8xU7vEzPvB7EZ7TVSILZMKVoUqHCnZFj0FzKZ/B7TWzquHyzEnNmXAsdmDTRg6yU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(22082099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?K56Qz5n+e3UwLglI79IlRz/D6IOq9QEkqMFO81XjdXnJo0nb05TOA9M3mGgR?=
 =?us-ascii?Q?gb4xU0++at82o+uVJEPu7H8gGHDZ0WIbFev6R+Pbe7Xnah4NCl7bBKPmfuto?=
 =?us-ascii?Q?3G0e+7vepxyCv9aVtpNnMU1zp3SMwGDAR/TM7FDgotmXExj7gyitfiFNNrir?=
 =?us-ascii?Q?9pBiWhXH7s/g8otqoUicRI4aZXNuDTxIqGXRLq4VgA9aklmi6xB3DmLaUkAo?=
 =?us-ascii?Q?l9cfigEOEG3Vn9hXeNtGDkZeR5evAf+6754J5lh04wLv+xzF3dRaxgnOnvNu?=
 =?us-ascii?Q?r2vkqDntC0rsPBCRsSd/eGzZvqgDMkxSLq7VNBeAGnK7cgrzOcYzjYEl7WVZ?=
 =?us-ascii?Q?hHow4MQ9gm+/0toFaRtDvxfTg6QbqrEzOdO0K1Ds2YvcOdlPDOQMdwTzwu7S?=
 =?us-ascii?Q?QGMsh1H/x/oxksctJb1O6PWJbQmzVqCSJLlSgCc4lfwHk/ymTEQeEl4aQSiJ?=
 =?us-ascii?Q?bYkKmJFvIxzss8s0h87wx2MhirKo3EEneo+O/aFeMcOjriV0eKlEtV81sQO3?=
 =?us-ascii?Q?ZQUqh6QiB5IiMpUmMkMXpjcwGYZ3DwugAqZLgSvcWqLYnhzYXRtB1qqXiYNg?=
 =?us-ascii?Q?Cmz8KrDi2hCWDFLN4A17dJdyT95qN8HsWpHiFFOLf8unq+4BxVbR1gNPvyRn?=
 =?us-ascii?Q?7J4cHOhbTUvm05uWaCecUy0JsGMNbE+OtFUT4SweycX8xs/cibVWtxSqE1rM?=
 =?us-ascii?Q?yZjl6TMK4OWW4xNZbdao+MrILTowwLdiIcDMjgCxg/YH6bSkadFc85HFuqe9?=
 =?us-ascii?Q?AqJDYuWgZKhYxQeps29oufll831O+hL1sHcopGwrhii71g6r1dA6VVFiAhfr?=
 =?us-ascii?Q?2P7uoBU0Cn/sCtiVp0JLD1kqt3K2xQkOxuKVBMYIRr8wjE9B8N/txhTBIMXN?=
 =?us-ascii?Q?dcsoQyiz4XDUJgkpIFbSTlK5csMoIyZfMCmcE5bKVGyufi+RRFbMETkUBprT?=
 =?us-ascii?Q?M3QqQ5yej9E2v/HfiokAvS45elgSGhAZMOnaOOEJHOn6WK6bo6JD3KtwRG4O?=
 =?us-ascii?Q?vSBzdmPPII7jLkivMwYbT3CtrpkCmiX0/TeOYhMWpYHYFlTL6fbaJkSmSXNn?=
 =?us-ascii?Q?ome0np5UD0SSR9VJVPUNWS0tb+66Vlni/+PTsr+o9lg+2x6hkQobveHKKZb0?=
 =?us-ascii?Q?ThC7bOtT88PzYTTg2WlbN+lqDKQfeEDIdtWQuSslXjJR6T+TINHal+fqYaxj?=
 =?us-ascii?Q?kgxHW6RO2z0N1HOgg5vSVgzogteHLrS2rcI2krGBFVkKDRxT+1sFUZu8OgyM?=
 =?us-ascii?Q?MoPzwPzyRTSYbjvQfZDOl1rgbNmLRdmGHUd2X0RfoK/3Klokk50NLogxkmJj?=
 =?us-ascii?Q?ei143HB+t65vQDEFfudqC9whBqt6EiAGUDzVjfKyvgk72HitpWaQ4XAMBga8?=
 =?us-ascii?Q?8cLDtlRGrDwx1VmAehzzWHA7zoA2SPL+B59myJemQRNUssGPTd6hOPpdsO9p?=
 =?us-ascii?Q?HjBX2kuZ5ygYOSUAFG+79j2sxX+lIJnX5RIkeLzFltzaTtNDcClEKnVIQDnZ?=
 =?us-ascii?Q?0Zk5iXPVo5PKo7XRCUo2y/SfgnV/0F81Bsr66ZvgVsL9VqOmXfSwJD+fGzQT?=
 =?us-ascii?Q?ch+mzE+9l4uQoteWSR4V3xgss42VqQx2lILHY5imsGWhKc+ryMEDoqwwGkFm?=
 =?us-ascii?Q?YEqla+HfF36E6CCtiakBriPNRyIfGBKeNSRjT50oBP+Dq8nXsIu2PUpMUtiD?=
 =?us-ascii?Q?3war0U4IDClJvg8WXKTXLaXg3rGKXV1ALbGJcMXyiUwyHoQzf+PgIGIZdGMy?=
 =?us-ascii?Q?YsfshO0K68LfwNnRkk6HuawEneZykwbmajPKTZHiRL30iKNLRTtI?=
X-Exchange-RoutingPolicyChecked: FwDnMfEz3NJTujhudPHn/ASjz5ZhHGLhgVt6MNgQ9dQPc84dyFYmIZ6/CSqzFZWhFISbTLeoZXcjmLK4YXE22eL+SjdvTGiwiCzdxjuaxlU+6i7pnlgEpcA5Et94aRQDhAyccQmlCLBmceU1BmbBT9NRwhIgDx1OhVe1vOGBHh27Tx02P4Ml1LUipo7iaw/G5IaKDGlhEE7DpVMIVFzGLpP8txZk0CWsulZzYCe30IFVt55fEVQt92cYUcjMIMlYVbAk5rT9h20gKasb9zmq1yVe31sSaD7cidpo3MNX6G00N5L7aFUE0K18UN/zGcsMKcJrNyj9xkcoA4YYiZgYaA==
X-MS-Exchange-CrossTenant-Network-Message-Id: dab38d15-bb19-442f-2cc8-08defd944e05
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 01:50:54.2640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QIPVwbATo7JjvXWSeQWI7A5ThtwXLOGOsLpsk2tOetFplwyWsvcpoimAbI/mSvRZheOqF3EHFW1twA3n4oAwDbCx4ZaxUT7PUGrEaZxFXnmzb1xVwxaL1OBcl6ugk+Sq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8469
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

On Mon, Aug 17, 2026 at 08:00:28PM +0000, Jagmeet Randhawa wrote:
>Add exec-multi-queue-spinner-interrupted-lr, which runs preemptible
>spinners on every queue in a multi-queue exec queue group in long
>running mode, then submits a dma-fence job on the same engine to force
>the group from FAULT into DMA_FENCE mode.
>
>Each spinner is armed with a queue-switch semaphore
>(multi_queue_switch_on_wait + xe_spin_preempt_wait) so it yields the
>shared engine to its sibling once scheduled, instead of busy-looping
>and starving the rest of the group. This lets every queue in the group
>be genuinely resident when the interrupting job forces the mode
>switch, exercising suspend/resume of the secondary queues rather than
>just the primary.
>
>The dma-fence and LR (preempt) multi-queue suspend/resume paths are
>already covered by the userptr-invalidation tests; this adds the
>missing FAULT-mode coverage.
>
>Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
>---
> tests/intel/xe_exec_mix_modes.c | 111 ++++++++++++++++++++++++++++++++
> 1 file changed, 111 insertions(+)
>
>diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
>index 209825f58..d9ebb8283 100644
>--- a/tests/intel/xe_exec_mix_modes.c
>+++ b/tests/intel/xe_exec_mix_modes.c
>@@ -27,6 +27,7 @@
>
> #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
>+#define FLAG_MULTI_QUEUE	(0x1 << 2)
>
> #define NUM_INTERRUPTING_JOBS	1
> #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>@@ -34,6 +35,7 @@
> #define SPIN_DATA		1
> #define EXEC_DATA		2
> #define DATA_COUNT		3
>+#define N_GROUP_QUEUES		2
>
> struct data {
> 	struct xe_spin spin;
>@@ -221,6 +223,104 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
> 	xe_vm_destroy(fd, vm);
> }
>
>+static void
>+run_job_multi_queue(int fd, struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct drm_xe_sync sync = {
>+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>+		.timeline_value = USER_FENCE_VALUE,
>+	};
>+	struct drm_xe_exec exec = {
>+		.num_batch_buffer = 1,
>+		.num_syncs = 1,
>+		.syncs = to_user_pointer(&sync),
>+	};
>+	uint32_t exec_queues[N_GROUP_QUEUES];
>+	struct xe_spin *spin[N_GROUP_QUEUES];
>+	uint64_t addr[N_GROUP_QUEUES];
>+	uint64_t base_addr = 0x1a0000;
>+	int64_t fence_timeout = NSEC_PER_SEC;
>+	int64_t timeout_short = 1;
>+	uint64_t vm_sync = 0;
>+	size_t bo_size, spin_size;
>+	uint32_t vm, bo;
>+	void *map;
>+	int i;
>+
>+	igt_require(xe_has_multi_queue_engine(fd));
>+
>+	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>+			      DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>+
>+	/* exec_queues[0] is the primary, the rest join its group. */
>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		struct drm_xe_ext_set_property multi_queue = {
>+			.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+			.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+		};
>+		uint64_t ext = to_user_pointer(&multi_queue);
>+
>+		multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
>+		exec_queues[i] = xe_exec_queue_create(fd, vm, hwe, ext);
>+	}
>+
>+	spin_size = xe_bb_size(fd, sizeof(struct xe_spin));
>+	bo_size = spin_size * N_GROUP_QUEUES;
>+	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, hwe->gt_id),
>+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+	map = xe_bo_map(fd, bo, bo_size);
>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		spin[i] = (struct xe_spin *)((char *)map + i * spin_size);
>+		addr[i] = base_addr + i * spin_size;
>+	}
>+
>+	sync.addr = to_user_pointer(&vm_sync);
>+	xe_vm_bind_async(fd, vm, 0, bo, 0, base_addr, bo_size, &sync, 1);
>+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>+	vm_sync = 0;
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		/* Yield the shared engine at a switch point instead of busy-spinning. */
>+		xe_spin_init_opts(spin[i], .addr = addr[i], .preempt = true,
>+				  .multi_queue_switch_on_wait = true);

I think here 'multi_queue_switch = true' is enough probably (as we have 'preempt = true')
instead of 'multi_queue_switch_on_wait = true'. With that, we also don't need the
xe_spin_preempt_wait/nowait() calls below as well. Can you check?

>+		xe_spin_preempt_wait(spin[i]);
>+		sync.addr = addr[i] + (char *)&spin[i]->exec_sync - (char *)spin[i];
>+		exec.exec_queue_id = exec_queues[i];
>+		exec.address = addr[i];
>+		xe_exec(fd, &exec);
>+		xe_spin_wait_started(spin[i]);
>+	}
>+
>+	/* Force the group from FAULT into DMA_FENCE mode. */
>+	run_job(fd, hwe, EXEC_MODE_DMA_FENCE, SIMPLE_BATCH_STORE, false, NULL);
>+
>+	/* Spinners must have been suspended, not completed, during the switch. */
>+	for (i = 0; i < N_GROUP_QUEUES; i++)
>+		igt_assert_neq(0, __xe_wait_ufence(fd, &spin[i]->exec_sync,
>+						   USER_FENCE_VALUE, exec_queues[i],
>+						   &timeout_short));
>+

This check doesn't mean much as we are ending the spinner below. ie., job is known
to be not complete as we have not ended the spinner. But I see you want to keep it
similar to other existing tests. Perhaps we can remove it as are sure that spinner
job won't be complete unless we end it.

>+	for (i = 0; i < N_GROUP_QUEUES; i++) {
>+		xe_spin_end(spin[i]);
>+		xe_spin_preempt_nowait(spin[i]);
>+	}
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++)
>+		xe_wait_ufence(fd, &spin[i]->exec_sync, USER_FENCE_VALUE,
>+			       exec_queues[i], fence_timeout);
>+
>+	sync.addr = to_user_pointer(&vm_sync);
>+	xe_vm_unbind_async(fd, vm, 0, 0, base_addr, bo_size, &sync, 1);
>+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
>+
>+	for (i = 0; i < N_GROUP_QUEUES; i++)
>+		xe_exec_queue_destroy(fd, exec_queues[i]);
>+	munmap(map, bo_size);
>+	gem_close(fd, bo);
>+	xe_vm_destroy(fd, vm);
>+}
>+
> /**
>  * SUBTEST: exec-simple-batch-store-lr
>  * Description: Execute a simple batch store job in long running mode
>@@ -235,6 +335,11 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>  * SUBTEST: exec-spinner-interrupted-dma-fence
>  * Description: Spin in dma fence mode then get interrupted by a simple
>  *              batch store job in long running mode
>+ *
>+ * SUBTEST: exec-multi-queue-spinner-interrupted-lr
>+ * Description: Run preemptible spinners on a multi-queue exec queue group
>+ *              in long running mode, then get interrupted by a simple
>+ *              batch store job in dma fence mode
>  */
> static void
> test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
>@@ -243,6 +348,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
> 	enum engine_execution_mode engine_execution_mode;
> 	enum job_type job_type;
>
>+	if (flags & FLAG_MULTI_QUEUE) {
>+		run_job_multi_queue(fd, hwe);
>+		return;
>+	}
>+

Actually, we should call
igt_require(xe_engine_class_supports_multi_queue(fd, hwe->engine_class));
here instead of calling 'igt_require(xe_has_multi_queue_engine(fd));' in
run_job_multi_queue. Earlier in the call chain we do it, it is better.

Also, add an assert here that FLAG_EXEC_MODE_LR is set as that is the
only test MULTI_QUEUE case supports currently.

Niranjana

> 	if (flags & FLAG_EXEC_MODE_LR)
> 		engine_execution_mode = EXEC_MODE_LR;
> 	else
>@@ -267,6 +377,7 @@ int igt_main()
> 		{ "simple-batch-store-dma-fence", FLAG_JOB_TYPE_SIMPLE },
> 		{ "spinner-interrupted-lr", FLAG_EXEC_MODE_LR },
> 		{ "spinner-interrupted-dma-fence", 0 },
>+		{ "multi-queue-spinner-interrupted-lr", FLAG_EXEC_MODE_LR | FLAG_MULTI_QUEUE },
> 		{ NULL },
> 	};
> 	int fd;
>-- 
>2.43.0
>
