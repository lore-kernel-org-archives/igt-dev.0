Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15908E9380A
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 01:18:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4C710E2E8;
	Mon, 13 Apr 2026 01:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UynA6jHK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B5ED10E2E8
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 01:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776043072; x=1807579072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P4FbKfwgoard6Vt9xuLHbicb7AtDXbKSpkdtfF5Q4Wo=;
 b=UynA6jHKYNjFnip3uFOHKJhtYIbP59Cr8B+xCuhmfjgpR5NDPgteRDo+
 oBwNCcqm2h3K4NLRz32gAG/+pnmKoIj8pZp9s1VlaUyt+9cU9FdmA+kdN
 g94hU8STpvlbxzgNVfloPCziKnQt/ZgXzsaeJ5SFZBiDV2h5vyz9nIh09
 pO023tkRYWshHOi6DvlmKeI9dURKRnjbepBnBDUXpQZl1Wsp2nC8n5/6z
 P/jKTLDilcrYcKVEVhODqbtKkO8pcqiu+lN7wMjuXZ2fYpeYq1P84yKot
 sqMhNfNGOtXS67xQ4uv8HJcBYFjXIuFW9IGBDCoebO5fOR0mr4AGWUVDr A==;
X-CSE-ConnectionGUID: gJmTZwAcQcGlFQMdTJxAbA==
X-CSE-MsgGUID: wPtALZ6NSVC3fsbYGiYljw==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="77088418"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; d="scan'208";a="77088418"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 18:17:51 -0700
X-CSE-ConnectionGUID: 8VChOFJEQXiLqjAoah56GA==
X-CSE-MsgGUID: 27WTlkxMTpqZijxjmPAKmA==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2026 18:17:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 18:17:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 18:17:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 18:17:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OY/g0G7I7eDZxte8ZeNC0Bl845z7ori7LcprNKTFnaxctN1+fvz4ebxhPth8pD71VCdfWoLKvPUY909tgqRYSM2Tsv4R+Y7U7puspafBCIFJU60be9NadrRxeJB2B6NN3h5g3bcRDiivKNJH4aCRNbnoa8GpdPiOPJI51Cj5E3kZZHpptWdlhtSXinjVEpL5TFbNPV9b8XthdDexgRrZVULkCyuVRiODHEJxoa0id9la1Z6Ii1S2BiMo0YCKiPTRXJSlgfGkk8i54H0TYpLBn5FVXx9/BanZ1cwSKZXDt7nvreM5WqKQusv1gq6C3MSpQd4o7M1hKdiac7CxgI4jUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTjaJ23zlFFm0bQNAGSnBkK4wcdAyK9v2RE2b6O2Owo=;
 b=cdLVXimQRTtHqCCemUl8QcdzxIBFZt12njs9AqSX8t9wr2q4il2kq1UCNQhKWjRmOdccQOkcF8zbmi3vxWwanyZxCcr0Btj6MgvN8HR0/I8DexxXXuKUEJEvGXA2jtAVOKRxIgkamRMWAlBtalQf4K2ZCtyLjuKIZ8mtGw4L3WX7bDdmuQ/h+6+rP02zRCqynkp0k7uixTt3KiCoxfD6uCawXIFE6Sjt4hMNQ9VRxAK7s5+wZc7WQG/XsAPiTiYip7VABDdo2uF30vmEYcSqv/zHFSBa9PndJ47pK8zaAZh0Pf2+Vrre5WiA++I4Yvw+IZGsVK8Yj6qJqrcdbjDJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by LV3PR11MB8673.namprd11.prod.outlook.com (2603:10b6:408:21c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 01:17:45 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%6]) with mapi id 15.20.9769.018; Mon, 13 Apr 2026
 01:17:38 +0000
Date: Sun, 12 Apr 2026 18:17:36 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_reset: Remove CANCEL logic for
 CM variants
Message-ID: <adxEMP0Ttn5UnIO-@nvishwa1-desk>
References: <20260406220043.42823-1-stuart.summers@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260406220043.42823-1-stuart.summers@intel.com>
X-ClientProxiedBy: SJ0PR05CA0076.namprd05.prod.outlook.com
 (2603:10b6:a03:332::21) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|LV3PR11MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: d788d0cb-7bf7-4971-56ea-08de98fa73c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: i5maDzqrlJOk2VeXukZ6mEUv8gwOLX3NhKhC68AmlYytBtCtCgFvQ+mzQh+fVPcdW3rIqBe+Tpzteg77HebeF92qasA0h0/NhwKSX9dCT7nFVC7TIdn4daQbLFneA8JrCqCD57byVhngwKKfChK3YeftHkdeoKB64DQSHsQJPR7dQ7B6oVHG2j82v5NtdjTHAFFdc8JvVfYkhaYMKBYcVaGIpVjKODL1PuRSPGPTljDsi5xIg8UvuRfqaLQzkxGqB2PV3WpZryW2hOk5pAPtGhS9w00hSu1AehZN6Eec+k7ybeAh6gS2OOPRJKTzJUqt7kvrH7A+bWjxFCsvsze1UriHcC8QFDzHtkhZJ58WOuqKCOIQnlEBboUEVAm73xfvrzge2tbMewqrwDoXG7ewnHeAx7LVRfsiKA43eIC6w120xiOn+EYgXyVWStFZX2ZMrppjIe32tSxTKZ6oC7nFbUMkIxCpUtm7Yx9Y9GMlsEUhWQwKJzTzypjiwWax7KYOeaR1B02qYlKdZNNolyDa3uebrI9YicszQqf7IOAG4qkI8Ydb4IK4F/4FmFDWAgkHRwGIZBod/aHX8nwgur7AqsyHitljX9P/fqCPsTQjyWuL6wLXmLou6JopfzCpjcm809HERoy4MLcG7zGtKV8n5eqfMNMzyN0WwgKoxDACE5mhMpfjxnbjI6toc9xXMSbNzUEjv4C/PMMqQK4UL3O2vslDkqHuwMKNT219YP83Q/s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3HvKLY2rLPa61ywhroeVXj8fenWChZD1WiAQYuG26bE1y3bXFhJSw2SBiwwv?=
 =?us-ascii?Q?YirwK9+lsGiPRDXWz6Vd8Mb8YvskqP9Hlq+4OKoLFgP9xQSDtqHBRZe0bFfu?=
 =?us-ascii?Q?gl/Wg5ri+k733U9sNod/uchbewhdeo9cml+nhblqd++V5+W+/A6zP07gemzJ?=
 =?us-ascii?Q?JzhYmZfbGDjUwPaHpeCHo2Tj2+k46ezd7mwoWFrjd05I7PG+2IKEU5yPbfM1?=
 =?us-ascii?Q?72hIeYLwJQtofug+LYWZpofxgs/ClnH1g/UFmKDoXlJ2PCSSvCKca+Mmh+Wl?=
 =?us-ascii?Q?8XXDGiFlSTHI2rWAodcDvftWjLY/m3B0rtHfvrSVpKnlFIFjK0L3QHwEFFT+?=
 =?us-ascii?Q?BoVxWWYZ6lDkgn3D4AbG0DlEl3HmlJxp7U3xWP3D6S8sdY5mLnpZHCnIpIOE?=
 =?us-ascii?Q?F31nl3WTZc17nK4JkLnD7FHF+cvz+dfa14bcFg2b3IeyPrquP0DxRHAfazIQ?=
 =?us-ascii?Q?bCgmqaPZFJkXxl81Kq7zOx1MjP5/X6XmBR0pfyUb8zOkWMv72YitnbrE4Uto?=
 =?us-ascii?Q?8L1GNVMrT/SWXTV8zwpUI6y9js6ByMYPmVAv0S/No1SfosqNwctfi1TOk7Lt?=
 =?us-ascii?Q?Ch/HZKws00k1B5uTPlm9I6dMjWd5xVDLknCPTI8XX6mepizaPMjvfjRh9MZd?=
 =?us-ascii?Q?qzo+D/xWJKHpElvPqEktw+dbZglQ7VsJISpAbZeHBwynbnDNA2b/SxcyYN3J?=
 =?us-ascii?Q?M6LMoWq3CfkShQmneQRLPpn8XQ9LSxmuYbOShkJJU+gjLM/k/Yu7dg1TJ3gH?=
 =?us-ascii?Q?952w1/ayxOoDULINd9qYcFy/W11bAbHU7cLgSObpS9Eh166hc3T9b9WUoh2j?=
 =?us-ascii?Q?spKa50sT/7zbuO34uvK4dpdauUKfrFU4p7SWBvNydnTbZbGl3zL1ggnics8S?=
 =?us-ascii?Q?CX+kCzgNhhss01Bt4t1u5pE8Aj8n4ykAXHqb3ADrgLEzsc2JjXhTSp3Y20eP?=
 =?us-ascii?Q?QYiLhIUSlQDm/Z9sBqjiOm8RoY7K3wlepM8UrBUeToHwcrnkiGgZwA73dxk4?=
 =?us-ascii?Q?fwBesTC94itg8jJfiDhgtBqdbs8YpO1JON6r4tgxtzZusz/HuuBXuehkxrL6?=
 =?us-ascii?Q?/iYpaGVBS7l1h04tg1V4NyqrGSJ2FmKiaRp5aNLzONFTjFfaGTjwNew8ZyGy?=
 =?us-ascii?Q?EObwQ488/yhklfLVI03Ymz8+cSulWyz4xNCXAROzyfm02eIKQgaonTeXxdgI?=
 =?us-ascii?Q?XpmMcuXz/WG85vHQ4imFXQjaE9m3yhl7htTVB8Mjug4FKCgiqFt+mnn6307w?=
 =?us-ascii?Q?Og8Smr+x/7kn5c+IfLFpzD4v018gX0xCb3tQWeL/mEn4LaZrGnyhhaPV+ZzS?=
 =?us-ascii?Q?voAMx2zfOU4H8Xj23Osz/A4tka1/ggnPwTfT/yLvCIs9wUYB/W8plCLQ8p6O?=
 =?us-ascii?Q?CS2wDH0DEhCEYve06h0Y+ou/N3zzVbbGSjAqftqpenp5juA/E1SsJnYD8cTL?=
 =?us-ascii?Q?sq2BnaTlx9HhDEfhc5U2+fsmTz2yHDSjt2kgA6Orvre2m3afuszL8ONIJhXQ?=
 =?us-ascii?Q?NSKMDRHe+u1QJqzZj01fJ3IiJF9MncUkPnf/d1lRcXGCfS9CJ0TiIFhyXOfI?=
 =?us-ascii?Q?Gr08tx+r2k9tagVgllRhQMjt1bdlJDQGESaDVuRG0IpTjs+QOSU33I80FqPB?=
 =?us-ascii?Q?xNP3Apjz+IgGu3MaWVswB8Xw69Lq5FHSADcJXpnd4+00+WQRM3H09lNq41n/?=
 =?us-ascii?Q?fMdNgv8M2PSHHKgjO6egP1j3PW2KZPGZ1yrXcRhITAr+LP+Pnp0SKg2cSEzz?=
 =?us-ascii?Q?6VSuCUz7wePWSijtGqLUXC7bspZFVFCAIEbMN0tAE+kSdMxosGZ3?=
X-Exchange-RoutingPolicyChecked: naC0fbC/rPPVr/sZ22Nkq7ZlbISe1KPFN4952P1Cb1HrKvWKVE8egs+z6ByKKjH9MzDHglY+mE0Ydjpk3vveYKsGedpVLPXY/Q1iuK5TMmmXZidCQOoZLadCBOQghLdXf3ChRr6jL1PedbUhk/Qi5YVHvTiXo9sHyaH5a6eB+QIamvg65lrAwjaaUwwLY3lozatVvBid3593G3AHjD//IbrsBoTT6hxU4iFlcLB45MA+anKTABcfp88m8IXNzqY7GYK1kZCy+mP9DncqLWCHgMNRAYeu9fmrmVjrKkVyj+0GTOQ9BUMS4t2cmSMhj06GvYYxqhANBCZWRFFRNF1M0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: d788d0cb-7bf7-4971-56ea-08de98fa73c7
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 01:17:38.6029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TqoVnCcgzzcoRN3PY2vu0dT+SKpap/lj7ndRaQY91ONYtUl2r36zQbdZe93nywkK4OiNAVbilpUGBd6Obm/ZS+KfIZJmpZiQUisyqxdH3SfSICXi6K1s1stxt/BH1je
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673
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

On Mon, Apr 06, 2026 at 10:00:42PM +0000, Stuart Summers wrote:
>The compute mode tests are expected to be long running and will
>not trigger the TDR logic in the KMD. This is illustrated in
>the test in that the legacy cases implement the CANCEL case,
>which is meant to trigger the TDR based resets vs the CM
>cases which do not support this.
>
>Remove the CANCEL logic from the CM tests since it isn't actually
>used in any of the test cases here.
>
>Signed-off-by: Stuart Summers <stuart.summers@intel.com>
>---
> tests/intel/xe_exec_reset.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index 7aaee31dd..4493a56fc 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -421,7 +421,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		uint64_t exec_addr;
> 		int e = i % n_exec_queues;
>
>-		if (!i || flags & CANCEL) {
>+		if (!i) {
> 			spin_opts.addr = base_addr + spin_offset;
> 			xe_spin_init(&data[i].spin, &spin_opts);
> 			exec_addr = spin_opts.addr;
>@@ -478,7 +478,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
>
>-	if (!(flags & (GT_RESET | CANCEL))) {
>+	if (!(flags & GT_RESET)) {
> 		for (i = 1; i < n_execs; i++)
> 			igt_assert_eq(data[i].data, 0xc0ffee);
> 	}
>-- 

LGTM
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

>2.43.0
>
