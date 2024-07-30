Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2195EC3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 23:09:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB9310E5A8;
	Tue, 30 Jul 2024 23:09:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OllfVwdF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD7810E5A8
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722380945; x=1753916945;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DBIOfRKkrHLFqFC878AUUcO7ZCJ3ykEf9uBzrzzAv1Q=;
 b=OllfVwdFgPtzjt75aMiDPyvAcI4OgPSm2B8xWn8FFkwsTyya0rHda07H
 Ztfq5QEB0GNkUSUXmE9RRACSERi5WH/mOxoQagCJ5VKBo53VMFtjAWT+M
 jm/V3ytmsFfNRsEV58d5WUKepcSOB3r9dgj9t3vgX07mH7VCoUjq1tibj
 fuNGmXjhijQ+QFLpPjHRQdcLwSTGAuIaHhZC2YlmVBQtrKW4UXNpbXHjl
 gorR8MbjTAAK71H/2GSIQjxwNKdgPLioIbVyYqfrFxk08td2mM5Iu1UMq
 ql6NM2G3cp7XZuw7FoP3WY2waTvefLtnUKWVhpDaLbGWjRWwOlbYXgaDr Q==;
X-CSE-ConnectionGUID: u7v3Hj8hQi6sR5c4NTA7tA==
X-CSE-MsgGUID: pX/DhxU9QVembEgWAXH9aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20039417"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20039417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 16:09:05 -0700
X-CSE-ConnectionGUID: Sjv3IG0KQ6WhGPZm32TPPg==
X-CSE-MsgGUID: zZnZEK6AQiiwMzCcYs2mbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="59576345"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 16:09:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 16:09:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 16:09:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 16:09:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 16:09:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXcgKEDMDQAL882ZbRWOXcRa3FLzXIlhXvCHjvcH7BBt1zfoAUjaMxv3sxDXI3RBeQam1Oj3vVF+H5wdlXoCIlXh3XT9dE/DxCBPZ5zBlTOUyEqLJvPzWs5VBhQbOrA6yf62QYXeYJXakXAjY8QKyrgjfAUlZSFChgBghWfumRilFWaEZfIcIarnEN4zHamIYD5HT6Rx1rPnXlVZczyt1Qb8RgRRoKKRd99cQcgJA+HuO6k8gJwbAEhqFy1xyEbHoioYQLJ08r2sYLAyNG4dmrrtHnG4NCl2x2RI9r88zSTH/UocEYIFnxuDPoP8VUGoU/B2mn2j77bW6eS9NBI4KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iL06KmuuO34FyNKnUocxG6DC4liE9/mrNFNbbXIp4Vc=;
 b=kxJpyHrSRQl0Kc8ZDx26LepefYYbwP3AnI/si06HJ9/PVwHbTTda7St+eZ7+uoLQ6tzm0SNd8uR4vgpUm8qb2fk3/ShTkPo6wZzhfGduaf4kFwouLNQef2ZzSamfAu/GYN+Dcug27d+Zh1WH5sNHI00zfwXcMEqw/PfMy3+wgysqYgCE1bG8wBiIlWrLVLqh/EoEf1R1IOZRH/PQ2gvkIrbZZCzUQO1Us/TcQlLRhRxApwJXeivTzxd8nwnzzpr3yteylKo/hIrBgtxelWlRYA62YM8SchO4xqey7BjXPQXpGm5dKhPyiZfTmO6xFraRcsvGJ41UISeICk8MRW8kCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DS0PR11MB8082.namprd11.prod.outlook.com (2603:10b6:8:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 23:08:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 23:08:31 +0000
Date: Tue, 30 Jul 2024 16:08:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: Pallavi Mishra <pallavi.mishra@intel.com>
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?=
 =?utf-8?Q?e_for_tests=2Fintel=2Fxe=5Fexec=5Fstore?= =?utf-8?Q?=3A?= Modify
 test for Priority Mem Read feature (rev2)
Message-ID: <20240730230828.GF2685051@mdroper-desk1.amr.corp.intel.com>
References: <20240729222434.1643521-1-pallavi.mishra@intel.com>
 <172230815782.426880.7360482555151535712@2413ebb6fbb6>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <172230815782.426880.7360482555151535712@2413ebb6fbb6>
X-ClientProxiedBy: SJ0PR03CA0138.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::23) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DS0PR11MB8082:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f6c55f-eaac-4f5b-faa0-08dcb0ec8767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eqnkVm3kePe0V6TxynuCGxeSdaNPgstm7Uk4NltBJ3gR0O81N4JoXbKdVo6L?=
 =?us-ascii?Q?Fw7ek0W8dV7igTsNxYLpbMpJtt5t72Ece4g4RXCX0k2bDDhBF0EykSlKnd26?=
 =?us-ascii?Q?578zNPxC9XNaYpwtne6P3ybMrL1HfhRGUZCzkZp2YtlvR1Or1oahG1qm/vNi?=
 =?us-ascii?Q?lMHZSJe4RtAhhAuGxQt9JyR4940eNkOLADlMuVzaDykIyEIjNlQyrZXiUWM7?=
 =?us-ascii?Q?1YwoHHiREVi0jdtgcYHesSYrvI4T3lyPMQ1JqHDyA/C/n9n6JGi2S2nageGu?=
 =?us-ascii?Q?EIUWl9NyhDKoZ//oWuAlwPcsqDOPJP384dlcRHUOi3UcN5wtvWc7KKqNE60+?=
 =?us-ascii?Q?G6hLssFpeGF1glEIybpyLtsURqaC9HmEO/buhamQe0Mhz1rD5gTrcu55q2r3?=
 =?us-ascii?Q?pbRj20/TrU76Hs+U7wvlUoJ6nLeIcpe1tEdyuku9JnA/OJ+W6x0nS/nCgv4s?=
 =?us-ascii?Q?nBvxwEYunlWzJkDHTdB4/XEOPDkgC0g8cdtmQu4SndWOlzpzVv3TvN6wNlzo?=
 =?us-ascii?Q?Vhy0CzEsLMyTgGZAJdrLSSBWRiJLsJEJESAR64s6JxAIu03utl5o1563Iz4q?=
 =?us-ascii?Q?tosphObtDUt2u9q8fzsQJP9Qmgt25xYAZTiIyNNtzbj+9R8RDDv1o2H5juau?=
 =?us-ascii?Q?pTnhKIbjMbPLLRCmp7URKG1N+ColTOvjbxI6YBmQUc0Qes5Ki67YAGB7+6SA?=
 =?us-ascii?Q?FcVMTiW0nQgHK0g5dT1elxTzkNK+UXy1A6ZI0jryO52tGWxltqd/XM/FelOl?=
 =?us-ascii?Q?HcgJkfuBfGR+9axtgH93+bu3V5ClSxYftHXDaKqzp2a4OARPJptx7RDl6wUl?=
 =?us-ascii?Q?FiuFmUxFMhSn73sVlyaWZMnigXm0h8zS53fV8qaUX/rj7GZJzTBk4+Soap9/?=
 =?us-ascii?Q?4r5LCVK3Wnym01sK6zcX/D9D7Mea+bl0qNNCpIN4iAtAJdEt9D/ogPm9ODJX?=
 =?us-ascii?Q?UzwU8I4sNurZrZNcX12+u1outjmapH6UiTLCBl5zQbWmBJc/G1AVAcUgxuLh?=
 =?us-ascii?Q?JSbbTVgvEI0gMKDcOl4RMqwR9mpta4B1oK5HxnuZak08QyElYbeQb0GjaCC6?=
 =?us-ascii?Q?2Pef4Vd5Iy4AMb5ppq3rch8oPmWAvPV5UlBUGFNitg4AhGt42FUrvw1X0pSD?=
 =?us-ascii?Q?EJjFGrDTNtII99m0ISpmjwblNuuYN6h9NldkiGYxF5ufbYu/ccYoG+PTjJfs?=
 =?us-ascii?Q?fdjHW2ZVy99bJCrgfJDkMuJ8UdSZHvS4cz5IH0SOTVUXqRu9M1gooEhXlf1z?=
 =?us-ascii?Q?OFU+JN4d3fKuULAEGp9mPVpsNls7VtmHVfHVbXQK7GlibhC/DcNGtyjVvfMr?=
 =?us-ascii?Q?DNE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KljSjpx7jdowdTM2+4rOqim1ncuyNISBmlh34c3nTic6pfUXNUlhS0X/qlCV?=
 =?us-ascii?Q?LWNl9FnNxeQQEloCIeqCgqzJMf0rcT3ibwGiRd+SV/wEdGPi5mwamnkKnyxa?=
 =?us-ascii?Q?huc0/P0Jn2IqFsHDTvFiiCoFBbqA6O2TrL+4KsbPpH8qeYJzZF3wlZSYupWI?=
 =?us-ascii?Q?jzHZcirvjVdPi3kvf5t3kjVDAoRTBhQYWcWnQxuXV3DdeoX2652cAzwwvTAv?=
 =?us-ascii?Q?SNxh4wKHfaEU3lyVrUZvjWoN0wU+8kohAypKl5Gt/9h8dGO65S7m9ib7iD4f?=
 =?us-ascii?Q?QWHCi2kdzmFPR1btmsB81MqRIJYmXo1sAMjVA2xs9nG7s7hahW9GknWAUS0j?=
 =?us-ascii?Q?e3sGCJu2RYznOnSyhHGJiRrQCw/Sxw0upiWA0frPkgWEB7irypUj8mNRzzna?=
 =?us-ascii?Q?ZY55boj3x+mh72mvhfxPb5jELXIGRV35+0rQ3/mJ9aXNsDFQbAMQ2ZiR8TJ8?=
 =?us-ascii?Q?O423qR0vnB1nntykmfmCfILeiz57mUiWbtkFPV2qvQf9Z0xxYU2VhdTf7tfH?=
 =?us-ascii?Q?1XhH9Qec4/Af/5bgaFt8RcEhb7a1IT7sbVmdm+psKLy9E38JWjyDHLF6E9BR?=
 =?us-ascii?Q?Xxs07IUJ8m5GCwOl1kRDhYYZNXz7cpYGzU/K2StaezJXC51oQ9aH0QwWJV2j?=
 =?us-ascii?Q?CN5P4YMuEcSFvvavzlLd4FAvk551Hj8T8kxyqeNk3fNLEBZaGW7EHD8SW98h?=
 =?us-ascii?Q?mp48tSoQ2Sgk72HxUuyOsV56pw8UpvO8fPuvRty06zD7Ffza4VEv0+4aofO5?=
 =?us-ascii?Q?p3SgJg7vlGDArlz4eP8f0jSYwVKjCYAWsv9zlPOcxFc6q+tQuIGj/0ISqJWK?=
 =?us-ascii?Q?1wMue8vvymkCytSUPAkqg6let/CQr3KUJft37bjl73pspWfVXfV0WUwyGubT?=
 =?us-ascii?Q?b3PGcqp8p9PoVSfbOiq0qT3fShsWhppuYy0ZKwVjAqnGrNWw4XWTPLQ0ORSC?=
 =?us-ascii?Q?DipEu001tFMZykGiR/pc63ep4ufJOw27KkSJ0NsfKE0p1WV2rCS2KvfF3tcP?=
 =?us-ascii?Q?GCx/vm58BMYP92KoPM3GXqZ45b44r0/Q0T83GJMUnPTVEHuqnnh98ZDC1KDV?=
 =?us-ascii?Q?ahAdOWdfttM9JoVFzjtSsCvrcyV2BV2XORWlvihiqPLvfIq6iQcEog0Kb/+i?=
 =?us-ascii?Q?H5vDYnL0CiTNS7/cM8+h14MmekVXONOOkzxG8TwkLF/q5T8wsLDQ5fYULZ2S?=
 =?us-ascii?Q?VG72ZvdTMJUsuii5sn1iN4eHTxY5BKYftO16jZSqzwMHDSrjalYnpY+irfw7?=
 =?us-ascii?Q?so2HzIZMv6NDPwpf0d5lVJJ50DSGI9SlcMs1cWm1yatJ6lgGw3xF8ajEkVHP?=
 =?us-ascii?Q?v2AKuLlaxEF5gjwAd6QvUkVz3LreTZUAQnFDOBfH7QjD8oq+De5RzxtewHSG?=
 =?us-ascii?Q?mfN1x6lgOa7mMMxinXfBSidoPYo4xbd4SgpPGW3F8mLLroyACxHcNrsYH8Ep?=
 =?us-ascii?Q?2jWu0TjhJsIlBlSn0gPHF5UnXCF1uePVTogVzlIQQnoYgLBarNoo8XBB4lCA?=
 =?us-ascii?Q?3jca2hLPcpjiMbDh6sgmp2lOd8DpxnfZhJVIXNFP1zqqc2lLlxcyd5Qummr/?=
 =?us-ascii?Q?F1vR92cqS+bPdQuE6qHK6jdjHT0O5fbOfCzf96o1RnxqQbvqhxxGG8WwqgOZ?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f6c55f-eaac-4f5b-faa0-08dcb0ec8767
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 23:08:31.3381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C278HAo6VbVbSdSSS1w38LUuoMLATXbz4SGSy7Lp8KtC1TOOPsGm/DyvwvYYiRztTkGvZ1YvSsqzv9A+IVcwksMMxyvCAA23mqRHq3HMFYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8082
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

On Tue, Jul 30, 2024 at 02:55:57AM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/xe_exec_store: Modify test for Priority Mem Read feature (rev2)
> URL   : https://patchwork.freedesktop.org/series/136457/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7942_full -> XEIGTPW_11489_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_11489_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11489_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11489_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@d-hdmi-a6.html

Unexpected incomplete with no error messages.  Wouldn't be caused by an
IGT change.

> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
>     - shard-lnl:          NOTRUN -> [SKIP][2] +21 other tests skip
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

These skips are showing up on a bunch of series; it looks like the PCI
device becomes unusable after the xe_module_load test tries to
unload/reload it, and then all further tests skip.  Not related to to
this series.

> 
>   * igt@kms_invalid_mode@uint-max-clock:
>     - shard-lnl:          [PASS][3] -> [SKIP][4] +57 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_invalid_mode@uint-max-clock.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_invalid_mode@uint-max-clock.html

Ditto

> 
>   * igt@kms_pm_rpm@system-suspend-modeset:
>     - shard-lnl:          [PASS][5] -> [INCOMPLETE][6]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_pm_rpm@system-suspend-modeset.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_pm_rpm@system-suspend-modeset.html

Panic during system-level suspend/resume.  Not related to the graphics
driver or to this IGT patch.

Applied to master; thanks for the patch.


Matt

> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-lnl:          [SKIP][7] ([Intel XE#1466]) -> [SKIP][8]
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>     - shard-lnl:          [FAIL][9] ([Intel XE#1659]) -> [SKIP][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-lnl:          [SKIP][11] ([Intel XE#1407]) -> [SKIP][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-lnl:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14] +3 other tests skip
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>     - shard-lnl:          [SKIP][15] ([Intel XE#1399]) -> [SKIP][16] +5 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html
> 
>   * igt@kms_chamelium_color@ctm-max:
>     - shard-lnl:          [SKIP][17] ([Intel XE#306]) -> [SKIP][18] +3 other tests skip
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_chamelium_color@ctm-max.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_chamelium_color@ctm-max.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-fast:
>     - shard-lnl:          [SKIP][19] ([Intel XE#373]) -> [SKIP][20] +4 other tests skip
>    [19]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_chamelium_hpd@vga-hpd-fast.html
>    [20]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-lnl:          [SKIP][21] ([Intel XE#1424]) -> [SKIP][22] +3 other tests skip
>    [21]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>    [22]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>     - shard-lnl:          [SKIP][23] ([Intel XE#309]) -> [SKIP][24]
>    [23]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
>    [24]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-lnl:          [SKIP][25] ([Intel XE#599]) -> [SKIP][26] +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html
>    [26]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>     - shard-lnl:          [SKIP][27] ([Intel XE#1421]) -> [SKIP][28]
>    [27]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
>    [28]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
>     - shard-lnl:          [SKIP][29] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][30] +1 other test skip
>    [29]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
>    [30]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-lnl:          [SKIP][31] ([Intel XE#1401] / [Intel XE#1745]) -> [SKIP][32] +1 other test skip
>    [31]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [32]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>     - shard-lnl:          [SKIP][33] ([Intel XE#651]) -> [SKIP][34] +2 other tests skip
>    [33]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
>    [34]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-lnl:          [SKIP][35] ([Intel XE#1469]) -> [SKIP][36]
>    [35]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [36]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
>     - shard-lnl:          [SKIP][37] ([Intel XE#656]) -> [SKIP][38] +16 other tests skip
>    [37]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
>    [38]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-lnl:          [SKIP][39] ([Intel XE#356]) -> [SKIP][40]
>    [39]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [40]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
>     - shard-lnl:          [SKIP][41] ([Intel XE#2318]) -> [SKIP][42]
>    [41]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
>    [42]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-lnl:          [FAIL][43] ([Intel XE#2029]) -> [SKIP][44]
>    [43]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_pm_dc@deep-pkgc.html
>    [44]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp-stress:
>     - shard-lnl:          [SKIP][45] ([Intel XE#1439]) -> [SKIP][46]
>    [45]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
>    [46]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-lnl:          [SKIP][47] ([Intel XE#1128]) -> [SKIP][48]
>    [47]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_psr2_su@page_flip-nv12.html
>    [48]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-lnl:          [SKIP][49] ([Intel XE#1406]) -> [SKIP][50] +1 other test skip
>    [49]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [50]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-lnl:          [SKIP][51] ([Intel XE#1127]) -> [SKIP][52]
>    [51]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [52]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-lnl:          [SKIP][53] ([Intel XE#1437]) -> [SKIP][54] +1 other test skip
>    [53]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [54]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p}:
>     - shard-lnl:          [SKIP][55] ([Intel XE#1512]) -> [SKIP][56]
>    [55]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
>    [56]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
> 
>   * {igt@xe_oa@invalid-remove-userspace-config}:
>     - shard-lnl:          NOTRUN -> [SKIP][57] +4 other tests skip
>    [57]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_oa@invalid-remove-userspace-config.html
> 
>   * {igt@xe_oa@mmio-triggered-reports}:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][58]
>    [58]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_oa@mmio-triggered-reports.html
> 
>   * {igt@xe_oa@non-system-wide-paranoid}:
>     - shard-dg2-set2:     [SKIP][59] ([Intel XE#1201]) -> [SKIP][60] +7 other tests skip
>    [59]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_oa@non-system-wide-paranoid.html
>    [60]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_oa@non-system-wide-paranoid.html
> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11489_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_atomic@plane-invalid-params-fence:
>     - shard-dg2-set2:     [PASS][61] -> [SKIP][62] ([Intel XE#1201] / [i915#2575]) +27 other tests skip
>    [61]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html
>    [62]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_atomic@plane-invalid-params-fence.html
> 
>   * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>     - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#1407]) +2 other tests skip
>    [63]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-32bpp-rotate-180:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201]) +19 other tests skip
>    [64]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_big_fb@linear-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
>    [65]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
>     - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1124]) +6 other tests skip
>    [66]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
>    [67]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#610])
>    [68]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#1201] / [Intel XE#367])
>    [69]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
>     - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#367])
>    [70]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
> 
>   * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#787]) +90 other tests skip
>    [71]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
>    [72]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +20 other tests skip
>    [73]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
>     - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1399]) +5 other tests skip
>    [74]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#787]) +13 other tests skip
>    [75]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_chamelium_color@degamma:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
>    [76]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_chamelium_color@degamma.html
>     - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#306])
>    [77]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_chamelium_color@degamma.html
> 
>   * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
>     - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#373]) +5 other tests skip
>    [78]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
> 
>   * igt@kms_chamelium_frames@hdmi-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#373])
>    [79]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
> 
>   * igt@kms_chamelium_frames@vga-frame-dump:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
>    [80]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_chamelium_frames@vga-frame-dump.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x21:
>     - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1424])
>    [81]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-64x21.html
> 
>   * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
>     - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#309]) +1 other test skip
>    [82]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#323])
>    [83]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#323])
>    [84]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions:
>     - shard-lnl:          [PASS][85] -> [FAIL][86] ([Intel XE#1541])
>    [85]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
>    [86]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions.html
> 
>   * igt@kms_cursor_legacy@torture-bo@pipe-a:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][87] ([Intel XE#877])
>    [87]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_cursor_legacy@torture-bo@pipe-a.html
> 
>   * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [i915#3804])
>    [88]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_fbcon_fbt@psr:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#1201] / [Intel XE#776])
>    [89]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
> 
>   * igt@kms_flip@2x-flip-vs-suspend-interruptible:
>     - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1421]) +2 other tests skip
>    [90]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][91] ([Intel XE#2049])
>    [91]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][92] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
>    [92]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
> 
>   * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][93] ([Intel XE#1551]) +2 other tests dmesg-warn
>    [93]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
> 
>   * igt@kms_flip@flip-vs-suspend@c-dp4:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][94] ([Intel XE#1195] / [Intel XE#2049])
>    [94]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_flip@flip-vs-suspend@c-dp4.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1397] / [Intel XE#1745])
>    [95]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1397]) +2 other tests skip
>    [96]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
>     - shard-lnl:          [PASS][97] -> [SKIP][98] ([Intel XE#2351])
>    [97]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
>    [98]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>     - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
>    [99]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#455]) +1 other test skip
>    [100]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
>    [101]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>     - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1401]) +2 other tests skip
>    [102]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#651]) +5 other tests skip
>    [103]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
>    [104]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
>     - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#651]) +6 other tests skip
>    [105]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
>     - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#1201]) +13 other tests skip
>    [106]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
>    [107]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#656]) +18 other tests skip
>    [108]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#653]) +3 other tests skip
>    [109]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#653]) +19 other tests skip
>    [110]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#1201] / [i915#2575]) +9 other tests skip
>    [111]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_hdmi_inject@inject-audio.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc:
>     - shard-dg2-set2:     [PASS][112] -> [DMESG-WARN][113] ([Intel XE#1162])
>    [112]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
>    [113]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc.html
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4:
>     - shard-dg2-set2:     [PASS][114] -> [DMESG-WARN][115] ([Intel XE#2019])
>    [114]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
>    [115]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-dp-4.html
> 
>   * igt@kms_plane@plane-position-covered:
>     - shard-lnl:          [PASS][116] -> [DMESG-FAIL][117] ([Intel XE#324])
>    [116]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@kms_plane@plane-position-covered.html
>    [117]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_plane@plane-position-covered.html
> 
>   * igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64:
>     - shard-dg2-set2:     [PASS][118] -> [FAIL][119] ([Intel XE#616]) +1 other test fail
>    [118]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
>    [119]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_plane_cursor@viewport@pipe-a-hdmi-a-6-size-64.html
> 
>   * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#599]) +3 other tests skip
>    [120]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#498]) +6 other tests skip
>    [121]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
>    [122]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#2318]) +6 other tests skip
>    [123]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-b-edp-1.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [124]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_pm_rpm@modeset-non-lpsp:
>     - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#1439])
>    [125]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1201] / [Intel XE#1489])
>    [126]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#1489])
>    [127]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@page_flip-p010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1122] / [Intel XE#1201])
>    [128]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
>     - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1128])
>    [129]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_psr2_su@page_flip-p010.html
> 
>   * igt@kms_psr@fbc-psr2-suspend:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#929])
>    [130]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr@fbc-psr2-suspend.html
> 
>   * igt@kms_psr@pr-cursor-plane-onoff:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
>    [131]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_psr@pr-cursor-plane-onoff.html
> 
>   * igt@kms_psr@pr-primary-blt:
>     - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1406])
>    [132]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_psr@pr-primary-blt.html
> 
>   * igt@kms_psr@psr2-suspend:
>     - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#2028]) +2 other tests fail
>    [133]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@kms_psr@psr2-suspend.html
>    [134]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_psr@psr2-suspend.html
> 
>   * igt@kms_rmfb@close-fd@pipe-a-edp-1:
>     - shard-lnl:          NOTRUN -> [FAIL][135] ([Intel XE#294])
>    [135]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_rmfb@close-fd@pipe-a-edp-1.html
> 
>   * igt@kms_rmfb@close-fd@pipe-b-dp-4:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][136] ([Intel XE#294]) +1 other test fail
>    [136]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_rmfb@close-fd@pipe-b-dp-4.html
> 
>   * igt@kms_vblank@ts-continuation-suspend:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][137] ([Intel XE#2019]) +3 other tests dmesg-warn
>    [137]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#1201] / [Intel XE#756])
>    [138]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#756])
>    [139]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1123])
>    [140]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfffe:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#1126] / [Intel XE#1201])
>    [141]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
> 
>   * igt@xe_evict@evict-beng-cm-threads-large:
>     - shard-dg2-set2:     NOTRUN -> [TIMEOUT][142] ([Intel XE#1473] / [Intel XE#392])
>    [142]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_evict@evict-beng-cm-threads-large.html
> 
>   * igt@xe_evict@evict-beng-large-external-cm:
>     - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#688]) +6 other tests skip
>    [143]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@xe_evict@evict-beng-large-external-cm.html
> 
>   * igt@xe_evict@evict-mixed-many-threads-small:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#1473])
>    [144]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
> 
>   * igt@xe_evict@evict-threads-large:
>     - shard-dg2-set2:     [PASS][145] -> [TIMEOUT][146] ([Intel XE#1473] / [Intel XE#392])
>    [145]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-threads-large.html
>    [146]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_evict@evict-threads-large.html
> 
>   * igt@xe_exec_basic@many-execqueues-rebind:
>     - shard-lnl:          NOTRUN -> [SKIP][147] ([Intel XE#1130]) +11 other tests skip
>    [147]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@xe_exec_basic@many-execqueues-rebind.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>     - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1392]) +5 other tests skip
>    [148]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#288]) +1 other test skip
>    [149]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [150]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> 
>   * igt@xe_live_ktest@xe_dma_buf:
>     - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#1192])
>    [151]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
>    [152]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_live_ktest@xe_dma_buf.html
> 
>   * igt@xe_module_load@force-load:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1201] / [Intel XE#378])
>    [153]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_module_load@force-load.html
> 
>   * igt@xe_pat@pat-index-xelpg:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1201] / [Intel XE#979])
>    [154]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_pat@pat-index-xelpg.html
>     - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#979])
>    [155]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@xe_pat@pat-index-xelpg.html
> 
>   * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
>     - shard-dg2-set2:     NOTRUN -> [FAIL][156] ([Intel XE#1173])
>    [156]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html
> 
>   * igt@xe_pm@s2idle-vm-bind-prefetch:
>     - shard-lnl:          [PASS][157] -> [FAIL][158] ([Intel XE#1924] / [Intel XE#2028])
>    [157]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
>    [158]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-prefetch.html
> 
>   * igt@xe_pm@s3-vm-bind-userptr:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][159] ([Intel XE#1551] / [Intel XE#569]) +1 other test dmesg-warn
>    [159]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html
>     - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#584])
>    [160]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@xe_pm@s3-vm-bind-userptr.html
> 
>   * igt@xe_query@multigpu-query-topology-l3-bank-mask:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#944])
>    [161]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
> 
>   * igt@xe_query@multigpu-query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
>    [162]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
>     - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#944]) +2 other tests skip
>    [163]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@xe_query@multigpu-query-uc-fw-version-huc.html
> 
>   * igt@xe_query@query-uc-fw-version-huc:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1130] / [Intel XE#1201]) +24 other tests skip
>    [164]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_query@query-uc-fw-version-huc.html
> 
>   * igt@xe_vm@large-split-binds-16777216:
>     - shard-lnl:          [PASS][165] -> [SKIP][166] ([Intel XE#1130]) +74 other tests skip
>    [165]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_vm@large-split-binds-16777216.html
>    [166]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_vm@large-split-binds-16777216.html
> 
>   * igt@xe_vm@munmap-style-unbind-many-either-side-partial:
>     - shard-dg2-set2:     [PASS][167] -> [SKIP][168] ([Intel XE#1130] / [Intel XE#1201]) +47 other tests skip
>    [167]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
>    [168]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_vm@munmap-style-unbind-many-either-side-partial.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@core_hotunplug@hotunplug-rescan:
>     - shard-dg2-set2:     [SKIP][169] ([Intel XE#1201] / [Intel XE#1885]) -> [PASS][170]
>    [169]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@core_hotunplug@hotunplug-rescan.html
>    [170]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@core_hotunplug@hotunplug-rescan.html
> 
>   * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-dg2-set2:     [DMESG-WARN][171] -> [PASS][172]
>    [171]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
>    [172]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-64x64:
>     - shard-dg2-set2:     [SKIP][173] ([Intel XE#1201] / [i915#2575]) -> [PASS][174] +43 other tests pass
>    [173]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html
>    [174]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-64x64.html
> 
>   * igt@kms_cursor_legacy@forked-move:
>     - shard-lnl:          [SKIP][175] ([Intel XE#2366]) -> [PASS][176]
>    [175]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_cursor_legacy@forked-move.html
>    [176]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_cursor_legacy@forked-move.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
>     - shard-dg2-set2:     [INCOMPLETE][177] ([Intel XE#1195] / [Intel XE#2049]) -> [PASS][178]
>    [177]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
>    [178]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][179] ([Intel XE#1201]) -> [PASS][180] +21 other tests pass
>    [179]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
>    [180]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt:
>     - shard-lnl:          [SKIP][181] -> [PASS][182] +62 other tests pass
>    [181]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
>    [182]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-msflip-blt.html
> 
>   * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
>     - shard-lnl:          [FAIL][183] ([Intel XE#2028]) -> [PASS][184] +1 other test pass
>    [183]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
>    [184]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
> 
>   * {igt@kms_plane@plane-position-hole@pipe-a-plane-2}:
>     - shard-lnl:          [DMESG-FAIL][185] ([Intel XE#324]) -> [PASS][186]
>    [185]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
>    [186]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][187] ([Intel XE#361]) -> [PASS][188]
>    [187]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
>    [188]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-move:
>     - shard-lnl:          [SKIP][189] ([Intel XE#2351]) -> [PASS][190]
>    [189]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html
>    [190]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-move.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak:
>     - shard-dg2-set2:     [FAIL][191] ([Intel XE#771] / [Intel XE#899]) -> [PASS][192]
>    [191]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak.html
>    [192]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
> 
>   * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
>     - shard-dg2-set2:     [FAIL][193] ([Intel XE#899]) -> [PASS][194] +1 other test pass
>    [193]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
>    [194]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
> 
>   * igt@xe_evict@evict-mixed-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][195] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [PASS][196]
>    [195]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
>    [196]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-dg2-set2:     [SKIP][197] ([Intel XE#1130] / [Intel XE#1201]) -> [PASS][198] +74 other tests pass
>    [197]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-basic.html
>    [198]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_reset@parallel-gt-reset:
>     - shard-dg2-set2:     [TIMEOUT][199] ([Intel XE#2105]) -> [PASS][200]
>    [199]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
>    [200]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html
> 
>   * igt@xe_exec_threads@threads-userptr-rebind-err:
>     - shard-lnl:          [SKIP][201] ([Intel XE#1130]) -> [PASS][202] +88 other tests pass
>    [201]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_threads@threads-userptr-rebind-err.html
>    [202]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@xe_exec_threads@threads-userptr-rebind-err.html
> 
>   * igt@xe_gt_freq@freq_reset_multiple:
>     - shard-lnl:          [INCOMPLETE][203] ([Intel XE#1620] / [Intel XE#1760]) -> [PASS][204]
>    [203]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_gt_freq@freq_reset_multiple.html
>    [204]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html
> 
>   * igt@xe_live_ktest@xe_bo:
>     - shard-dg2-set2:     [SKIP][205] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][206]
>    [205]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
>    [206]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
> 
>   * igt@xe_pm@s2idle-basic:
>     - shard-lnl:          [FAIL][207] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][208]
>    [207]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_pm@s2idle-basic.html
>    [208]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_pm@s2idle-basic.html
> 
>   * igt@xe_pm@s3-basic-exec:
>     - shard-dg2-set2:     [DMESG-WARN][209] ([Intel XE#1551] / [Intel XE#569]) -> [PASS][210] +1 other test pass
>    [209]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_pm@s3-basic-exec.html
>    [210]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
> 
>   * igt@xe_pm@s4-multiple-execs:
>     - shard-lnl:          [ABORT][211] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][212]
>    [211]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
>    [212]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html
> 
>   * igt@xe_pm@s4-vm-bind-prefetch:
>     - shard-dg2-set2:     [DMESG-WARN][213] ([Intel XE#2019]) -> [PASS][214]
>    [213]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html
>    [214]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - shard-dg2-set2:     [SKIP][215] ([Intel XE#623]) -> [SKIP][216] ([Intel XE#1201] / [i915#2575])
>    [215]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
>    [216]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>     - shard-lnl:          [SKIP][217] ([Intel XE#599]) -> [SKIP][218] ([Intel XE#2366])
>    [217]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
>    [218]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][219] ([Intel XE#316]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
>    [219]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html
>    [220]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-270.html
> 
>   * igt@kms_big_fb@linear-16bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][222] ([Intel XE#1201])
>    [221]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
>    [222]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
> 
>   * igt@kms_big_fb@linear-8bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][223] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][224] ([Intel XE#316]) +2 other tests skip
>    [223]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
>    [224]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>     - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201]) -> [SKIP][226] ([Intel XE#316])
>    [225]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [226]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>     - shard-lnl:          [SKIP][227] -> [SKIP][228] ([Intel XE#1407]) +1 other test skip
>    [227]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
>    [228]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
> 
>   * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>     - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201]) -> [SKIP][230] ([Intel XE#1201] / [Intel XE#316])
>    [229]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
>    [230]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
> 
>   * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][231] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][232] ([Intel XE#1201]) +2 other tests skip
>    [231]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
>    [232]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html
> 
>   * igt@kms_big_fb@y-tiled-addfb:
>     - shard-lnl:          [SKIP][233] -> [SKIP][234] ([Intel XE#1467])
>    [233]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html
>    [234]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_big_fb@y-tiled-addfb.html
> 
>   * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>     - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][236] ([Intel XE#607])
>    [235]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
>    [236]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> 
>   * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
>     - shard-dg2-set2:     [SKIP][237] ([Intel XE#1124]) -> [SKIP][238] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
>    [237]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
>    [238]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> 
>   * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
>     - shard-lnl:          [SKIP][239] -> [SKIP][240] ([Intel XE#1124]) +4 other tests skip
>    [239]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
>    [240]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>     - shard-dg2-set2:     [SKIP][241] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][242] ([Intel XE#1124]) +4 other tests skip
>    [241]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
>    [242]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb:
>     - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][244] ([Intel XE#619])
>    [243]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html
>    [244]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb.html
> 
>   * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
>     - shard-lnl:          [SKIP][245] -> [SKIP][246] ([Intel XE#1428])
>    [245]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
>    [246]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>     - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201]) -> [SKIP][248] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
>    [247]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
>    [248]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> 
>   * igt@kms_big_joiner@basic:
>     - shard-dg2-set2:     [SKIP][249] ([Intel XE#1201]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#346]) +1 other test skip
>    [249]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_big_joiner@basic.html
>    [250]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_big_joiner@basic.html
>     - shard-lnl:          [SKIP][251] -> [SKIP][252] ([Intel XE#346]) +1 other test skip
>    [251]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_big_joiner@basic.html
>    [252]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_big_joiner@basic.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>     - shard-dg2-set2:     [SKIP][253] ([Intel XE#367]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#367])
>    [253]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
>    [254]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
> 
>   * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
>     - shard-dg2-set2:     [SKIP][255] ([Intel XE#367]) -> [SKIP][256] ([Intel XE#1201] / [i915#2575])
>    [255]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
>    [256]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
> 
>   * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [i915#2575]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#367])
>    [257]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [258]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>     - shard-lnl:          [SKIP][259] -> [SKIP][260] ([Intel XE#367])
>    [259]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
>    [260]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
> 
>   * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
>     - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][262] ([Intel XE#367]) +2 other tests skip
>    [261]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
>    [262]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][263] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
>    [263]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
>    [264]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][265] ([Intel XE#787]) -> [SKIP][266] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
>    [265]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
>    [266]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][268] ([Intel XE#1252])
>    [267]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
>    [268]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
>     - shard-dg2-set2:     [SKIP][269] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][270] ([Intel XE#1201]) +4 other tests skip
>    [269]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
>    [270]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
> 
>   * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][272] ([Intel XE#1201])
>    [271]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
>    [272]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][273] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][274] ([Intel XE#787]) +41 other tests skip
>    [273]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
>    [274]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
> 
>   * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201]) -> [SKIP][276] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +4 other tests skip
>    [275]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
>    [276]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
>     - shard-lnl:          [SKIP][277] -> [SKIP][278] ([Intel XE#1399]) +7 other tests skip
>    [277]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
>    [278]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
> 
>   * igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs:
>     - shard-dg2-set2:     [SKIP][279] ([Intel XE#1252]) -> [SKIP][280] ([Intel XE#1201] / [Intel XE#1252])
>    [279]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
>    [280]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs.html
> 
>   * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>     - shard-dg2-set2:     [SKIP][281] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][282] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
>    [281]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
>    [282]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201]) -> [SKIP][284] ([Intel XE#1201] / [Intel XE#314])
>    [283]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
>    [284]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_cdclk@mode-transition-all-outputs.html
>     - shard-lnl:          [SKIP][285] -> [SKIP][286] ([Intel XE#314])
>    [285]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html
>    [286]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
>     - shard-dg2-set2:     [SKIP][287] ([Intel XE#1152] / [Intel XE#1201]) -> [SKIP][288] ([Intel XE#1152]) +3 other tests skip
>    [287]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
>    [288]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
> 
>   * igt@kms_chamelium_color@ctm-0-50:
>     - shard-dg2-set2:     [SKIP][289] ([Intel XE#306]) -> [SKIP][290] ([Intel XE#1201] / [i915#2575])
>    [289]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
>    [290]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
> 
>   * igt@kms_chamelium_color@gamma:
>     - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][292] ([Intel XE#1201] / [i915#2575]) +1 other test skip
>    [291]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_chamelium_color@gamma.html
>    [292]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_chamelium_color@gamma.html
> 
>   * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][293] ([Intel XE#373]) -> [SKIP][294] ([Intel XE#1201] / [i915#2575])
>    [293]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
>    [294]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>     - shard-lnl:          [SKIP][295] -> [SKIP][296] ([Intel XE#373]) +5 other tests skip
>    [295]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
>    [296]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-read:
>     - shard-dg2-set2:     [SKIP][297] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][298] ([Intel XE#373]) +5 other tests skip
>    [297]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_edid@hdmi-edid-read.html
>    [298]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-read.html
> 
>   * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>     - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [i915#2575]) -> [SKIP][300] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
>    [299]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
>    [300]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd:
>     - shard-dg2-set2:     [SKIP][301] ([Intel XE#373]) -> [SKIP][302] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
>    [301]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd.html
>    [302]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html
> 
>   * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>     - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][304] ([Intel XE#1201] / [i915#2575]) +2 other tests skip
>    [303]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
>    [304]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
> 
>   * igt@kms_content_protection@dp-mst-type-0:
>     - shard-dg2-set2:     [SKIP][305] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][306] ([Intel XE#307])
>    [305]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html
>    [306]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html
> 
>   * igt@kms_cursor_crc@cursor-offscreen-512x512:
>     - shard-dg2-set2:     [SKIP][307] ([Intel XE#1201] / [i915#2575]) -> [SKIP][308] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
>    [307]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [308]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>     - shard-lnl:          [SKIP][309] -> [SKIP][310] ([Intel XE#1413]) +1 other test skip
>    [309]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
>    [310]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>     - shard-lnl:          [SKIP][311] -> [SKIP][312] ([Intel XE#1424]) +2 other tests skip
>    [311]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
>    [312]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html
> 
>   * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>     - shard-dg2-set2:     [SKIP][313] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][314] ([Intel XE#1201] / [i915#2575]) +6 other tests skip
>    [313]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
>    [314]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
> 
>   * igt@kms_cursor_crc@cursor-sliding-512x512:
>     - shard-dg2-set2:     [SKIP][315] ([Intel XE#308]) -> [SKIP][316] ([Intel XE#1201] / [Intel XE#308])
>    [315]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html
>    [316]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-512x512.html
> 
>   * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>     - shard-lnl:          [SKIP][317] -> [SKIP][318] ([Intel XE#309]) +3 other tests skip
>    [317]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
>    [318]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - shard-lnl:          [SKIP][319] -> [SKIP][320] ([Intel XE#323]) +1 other test skip
>    [319]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
>    [320]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
>     - shard-dg2-set2:     [SKIP][321] ([Intel XE#1201] / [i915#2575]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#323])
>    [321]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
>    [322]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> 
>   * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>     - shard-dg2-set2:     [SKIP][323] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][324] ([Intel XE#323])
>    [323]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
>    [324]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
> 
>   * igt@kms_cursor_legacy@torture-bo:
>     - shard-dg2-set2:     [SKIP][325] ([Intel XE#1201] / [i915#2575]) -> [DMESG-WARN][326] ([Intel XE#877])
>    [325]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_cursor_legacy@torture-bo.html
>    [326]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_cursor_legacy@torture-bo.html
> 
>   * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>     - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201]) -> [SKIP][328] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
>    [327]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
>    [328]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
> 
>   * igt@kms_dsc@dsc-with-bpc-formats:
>     - shard-dg2-set2:     [SKIP][329] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][330] ([Intel XE#1201]) +1 other test skip
>    [329]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
>    [330]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
> 
>   * igt@kms_dsc@dsc-with-output-formats-with-bpc:
>     - shard-dg2-set2:     [SKIP][331] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][332] ([Intel XE#455]) +9 other tests skip
>    [331]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
>    [332]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
> 
>   * igt@kms_fbcon_fbt@psr-suspend:
>     - shard-dg2-set2:     [SKIP][333] ([Intel XE#1201] / [Intel XE#776]) -> [SKIP][334] ([Intel XE#776])
>    [333]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html
>    [334]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_fbcon_fbt@psr-suspend.html
> 
>   * igt@kms_feature_discovery@chamelium:
>     - shard-dg2-set2:     [SKIP][335] ([Intel XE#701]) -> [SKIP][336] ([Intel XE#1201] / [Intel XE#701])
>    [335]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_feature_discovery@chamelium.html
>    [336]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
> 
>   * igt@kms_feature_discovery@display-4x:
>     - shard-dg2-set2:     [SKIP][337] ([Intel XE#1201] / [i915#2575]) -> [SKIP][338] ([Intel XE#1138] / [Intel XE#1201])
>    [337]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_feature_discovery@display-4x.html
>    [338]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_feature_discovery@display-4x.html
>     - shard-lnl:          [SKIP][339] -> [SKIP][340] ([Intel XE#1138])
>    [339]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_feature_discovery@display-4x.html
>    [340]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_feature_discovery@display-4x.html
> 
>   * igt@kms_feature_discovery@psr1:
>     - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [i915#2575]) -> [SKIP][342] ([Intel XE#1135] / [Intel XE#1201])
>    [341]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_feature_discovery@psr1.html
>    [342]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_feature_discovery@psr1.html
> 
>   * igt@kms_feature_discovery@psr2:
>     - shard-dg2-set2:     [SKIP][343] ([Intel XE#1135] / [Intel XE#1201]) -> [SKIP][344] ([Intel XE#1201] / [i915#2575])
>    [343]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_feature_discovery@psr2.html
>    [344]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_feature_discovery@psr2.html
> 
>   * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>     - shard-lnl:          [SKIP][345] -> [SKIP][346] ([Intel XE#1421]) +1 other test skip
>    [345]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
>    [346]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
> 
>   * igt@kms_flip@flip-vs-suspend-interruptible:
>     - shard-dg2-set2:     [INCOMPLETE][347] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049]) -> [DMESG-WARN][348] ([Intel XE#1551])
>    [347]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html
>    [348]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_flip@flip-vs-suspend-interruptible.html
> 
>   * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
>     - shard-dg2-set2:     [SKIP][349] ([Intel XE#455]) -> [SKIP][350] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
>    [349]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
>    [350]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>     - shard-lnl:          [SKIP][351] -> [SKIP][352] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
>    [351]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
>    [352]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>     - shard-lnl:          [SKIP][353] -> [SKIP][354] ([Intel XE#1401] / [Intel XE#1745])
>    [353]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
>    [354]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> 
>   * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>     - shard-dg2-set2:     [SKIP][355] ([Intel XE#455]) -> [SKIP][356] ([Intel XE#1201])
>    [355]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
>    [356]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> 
>   * igt@kms_force_connector_basic@force-edid:
>     - shard-lnl:          [SKIP][357] -> [SKIP][358] ([Intel XE#352])
>    [357]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html
>    [358]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
>     - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][360] ([Intel XE#651]) +14 other tests skip
>    [359]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
>    [360]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][361] ([Intel XE#1201]) -> [SKIP][362] ([Intel XE#651]) +1 other test skip
>    [361]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
>    [362]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
>     - shard-lnl:          [SKIP][363] -> [SKIP][364] ([Intel XE#656]) +22 other tests skip
>    [363]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
>    [364]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbc-tiling-y:
>     - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][366] ([Intel XE#1201])
>    [365]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
>    [366]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
>     - shard-lnl:          [SKIP][367] -> [SKIP][368] ([Intel XE#651]) +4 other tests skip
>    [367]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
>    [368]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
>     - shard-dg2-set2:     [SKIP][369] ([Intel XE#651]) -> [SKIP][370] ([Intel XE#1201] / [Intel XE#651]) +15 other tests skip
>    [369]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
>    [370]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][371] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][372] ([Intel XE#1201]) +10 other tests skip
>    [371]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
>    [372]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
>     - shard-dg2-set2:     [SKIP][373] ([Intel XE#1201]) -> [SKIP][374] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
>    [373]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
>    [374]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
>     - shard-dg2-set2:     [SKIP][375] ([Intel XE#1201]) -> [SKIP][376] ([Intel XE#653]) +4 other tests skip
>    [375]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
>    [376]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
>     - shard-dg2-set2:     [SKIP][377] ([Intel XE#1201]) -> [SKIP][378] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
>    [377]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
>    [378]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> 
>   * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>     - shard-dg2-set2:     [SKIP][379] ([Intel XE#658]) -> [SKIP][380] ([Intel XE#1201] / [Intel XE#658])
>    [379]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
>    [380]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc:
>     - shard-dg2-set2:     [SKIP][381] ([Intel XE#653]) -> [SKIP][382] ([Intel XE#1201])
>    [381]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html
>    [382]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-mmap-wc.html
> 
>   * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
>     - shard-dg2-set2:     [SKIP][383] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][384] ([Intel XE#1201]) +10 other tests skip
>    [383]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
>    [384]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render:
>     - shard-dg2-set2:     [SKIP][385] ([Intel XE#653]) -> [SKIP][386] ([Intel XE#1201] / [Intel XE#653]) +12 other tests skip
>    [385]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
>    [386]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-draw-render.html
> 
>   * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
>     - shard-dg2-set2:     [SKIP][387] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][388] ([Intel XE#653]) +7 other tests skip
>    [387]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
>    [388]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
> 
>   * igt@kms_getfb@getfb-reject-ccs:
>     - shard-lnl:          [SKIP][389] -> [SKIP][390] ([Intel XE#605])
>    [389]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_getfb@getfb-reject-ccs.html
>    [390]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html
>     - shard-dg2-set2:     [SKIP][391] ([Intel XE#1201] / [i915#2575]) -> [SKIP][392] ([Intel XE#1201] / [Intel XE#605])
>    [391]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_getfb@getfb-reject-ccs.html
>    [392]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html
> 
>   * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>     - shard-dg2-set2:     [SKIP][393] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][394] ([Intel XE#1201] / [i915#2575])
>    [393]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
>    [394]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> 
>   * igt@kms_panel_fitting@legacy:
>     - shard-dg2-set2:     [SKIP][395] ([Intel XE#1201] / [i915#2575]) -> [SKIP][396] ([Intel XE#455])
>    [395]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_panel_fitting@legacy.html
>    [396]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_panel_fitting@legacy.html
> 
>   * igt@kms_plane_lowres@tiling-x:
>     - shard-lnl:          [SKIP][397] -> [SKIP][398] ([Intel XE#599]) +1 other test skip
>    [397]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_plane_lowres@tiling-x.html
>    [398]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>     - shard-dg2-set2:     [SKIP][399] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) -> [SKIP][400] ([Intel XE#455] / [Intel XE#498]) +1 other test skip
>    [399]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
>    [400]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][401] ([Intel XE#1201] / [Intel XE#498]) -> [SKIP][402] ([Intel XE#498]) +2 other tests skip
>    [401]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
>    [402]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c-hdmi-a-6.html
> 
>   * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
>     - shard-lnl:          [SKIP][403] ([Intel XE#2366]) -> [SKIP][404] ([Intel XE#498])
>    [403]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
>    [404]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
> 
>   * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25:
>     - shard-lnl:          [SKIP][405] -> [SKIP][406] ([Intel XE#2318])
>    [405]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
>    [406]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>     - shard-dg2-set2:     [SKIP][407] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][408] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
>    [407]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
>    [408]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
> 
>   * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
>     - shard-dg2-set2:     [SKIP][409] ([Intel XE#2318]) -> [SKIP][410] ([Intel XE#1201] / [Intel XE#2318]) +2 other tests skip
>    [409]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
>    [410]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
> 
>   * igt@kms_pm_backlight@fade:
>     - shard-dg2-set2:     [SKIP][411] ([Intel XE#870]) -> [SKIP][412] ([Intel XE#1201] / [Intel XE#870])
>    [411]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_pm_backlight@fade.html
>    [412]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_pm_backlight@fade.html
> 
>   * igt@kms_pm_backlight@fade-with-dpms:
>     - shard-dg2-set2:     [SKIP][413] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][414] ([Intel XE#1201])
>    [413]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_pm_backlight@fade-with-dpms.html
>    [414]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
> 
>   * igt@kms_pm_dc@dc3co-vpb-simulation:
>     - shard-dg2-set2:     [SKIP][415] ([Intel XE#1201]) -> [SKIP][416] ([Intel XE#1122] / [Intel XE#1201])
>    [415]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [416]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html
>     - shard-lnl:          [SKIP][417] -> [SKIP][418] ([Intel XE#736])
>    [417]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
>    [418]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
> 
>   * igt@kms_pm_dc@dc5-dpms-negative:
>     - shard-lnl:          [SKIP][419] -> [SKIP][420] ([Intel XE#1131])
>    [419]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_pm_dc@dc5-dpms-negative.html
>    [420]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_pm_dc@dc5-dpms-negative.html
> 
>   * igt@kms_pm_dc@dc5-psr:
>     - shard-dg2-set2:     [SKIP][421] ([Intel XE#1201]) -> [SKIP][422] ([Intel XE#1129] / [Intel XE#1201])
>    [421]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
>    [422]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_pm_dc@dc5-psr.html
> 
>   * igt@kms_pm_dc@dc6-dpms:
>     - shard-dg2-set2:     [SKIP][423] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][424] ([Intel XE#908])
>    [423]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_pm_dc@dc6-dpms.html
>    [424]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
> 
>   * igt@kms_pm_dc@deep-pkgc:
>     - shard-dg2-set2:     [SKIP][425] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][426] ([Intel XE#1201])
>    [425]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
>    [426]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
> 
>   * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][427] ([Intel XE#1201]) -> [SKIP][428] ([Intel XE#1201] / [Intel XE#1489])
>    [427]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
>    [428]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
>     - shard-dg2-set2:     [SKIP][429] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][430] ([Intel XE#1201])
>    [429]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
>    [430]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html
> 
>   * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
>     - shard-dg2-set2:     [SKIP][431] ([Intel XE#1489]) -> [SKIP][432] ([Intel XE#1201])
>    [431]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
>    [432]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
> 
>   * igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area:
>     - shard-dg2-set2:     [SKIP][433] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][434] ([Intel XE#1489]) +1 other test skip
>    [433]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
>    [434]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-update-sf-dmg-area.html
> 
>   * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
>     - shard-dg2-set2:     [SKIP][435] ([Intel XE#1489]) -> [SKIP][436] ([Intel XE#1201] / [Intel XE#1489])
>    [435]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
>    [436]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
> 
>   * igt@kms_psr2_su@frontbuffer-xrgb8888:
>     - shard-dg2-set2:     [SKIP][437] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][438] ([Intel XE#1122])
>    [437]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_psr2_su@frontbuffer-xrgb8888.html
>    [438]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr2_su@frontbuffer-xrgb8888.html
> 
>   * igt@kms_psr2_su@page_flip-nv12:
>     - shard-dg2-set2:     [SKIP][439] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][440] ([Intel XE#1201])
>    [439]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
>    [440]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> 
>   * igt@kms_psr@fbc-pr-dpms:
>     - shard-dg2-set2:     [SKIP][441] ([Intel XE#1201]) -> [SKIP][442] ([Intel XE#929]) +1 other test skip
>    [441]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html
>    [442]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr@fbc-pr-dpms.html
>     - shard-lnl:          [SKIP][443] -> [SKIP][444] ([Intel XE#1406]) +2 other tests skip
>    [443]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_psr@fbc-pr-dpms.html
>    [444]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-4/igt@kms_psr@fbc-pr-dpms.html
> 
>   * igt@kms_psr@fbc-pr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][445] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][446] ([Intel XE#1201]) +3 other tests skip
>    [445]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
>    [446]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
> 
>   * igt@kms_psr@fbc-psr2-primary-blt:
>     - shard-dg2-set2:     [SKIP][447] ([Intel XE#929]) -> [SKIP][448] ([Intel XE#1201] / [Intel XE#929]) +8 other tests skip
>    [447]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-blt.html
>    [448]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-blt.html
> 
>   * igt@kms_psr@pr-basic:
>     - shard-dg2-set2:     [SKIP][449] ([Intel XE#1201]) -> [SKIP][450] ([Intel XE#1201] / [Intel XE#929]) +3 other tests skip
>    [449]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_psr@pr-basic.html
>    [450]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_psr@pr-basic.html
>     - shard-lnl:          [SKIP][451] ([Intel XE#2351]) -> [SKIP][452] ([Intel XE#1406])
>    [451]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@kms_psr@pr-basic.html
>    [452]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_psr@pr-basic.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - shard-dg2-set2:     [SKIP][453] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][454] ([Intel XE#929]) +4 other tests skip
>    [453]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@kms_psr@psr-sprite-plane-onoff.html
>    [454]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>     - shard-dg2-set2:     [SKIP][455] ([Intel XE#1201]) -> [SKIP][456] ([Intel XE#1149] / [Intel XE#1201])
>    [455]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
>    [456]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-dg2-set2:     [SKIP][457] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][458] ([Intel XE#1149])
>    [457]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
>    [458]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 
>   * igt@kms_rmfb@close-fd:
>     - shard-dg2-set2:     [SKIP][459] ([Intel XE#1201] / [i915#2575]) -> [FAIL][460] ([Intel XE#294])
>    [459]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rmfb@close-fd.html
>    [460]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_rmfb@close-fd.html
>     - shard-lnl:          [SKIP][461] -> [FAIL][462] ([Intel XE#294])
>    [461]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@kms_rmfb@close-fd.html
>    [462]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_rmfb@close-fd.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>     - shard-dg2-set2:     [SKIP][463] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][464] ([Intel XE#1201] / [i915#2575])
>    [463]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
>    [464]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>     - shard-dg2-set2:     [SKIP][465] ([Intel XE#1201] / [i915#2575]) -> [SKIP][466] ([Intel XE#1127])
>    [465]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
>    [466]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>     - shard-lnl:          [SKIP][467] -> [SKIP][468] ([Intel XE#1127]) +1 other test skip
>    [467]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [468]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>     - shard-dg2-set2:     [SKIP][469] ([Intel XE#1201] / [i915#2575]) -> [SKIP][470] ([Intel XE#1127] / [Intel XE#1201])
>    [469]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
>    [470]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>     - shard-dg2-set2:     [SKIP][471] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][472] ([Intel XE#1201] / [i915#2575])
>    [471]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
>    [472]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
> 
>   * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>     - shard-dg2-set2:     [SKIP][473] ([Intel XE#327]) -> [SKIP][474] ([Intel XE#1201] / [i915#2575])
>    [473]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
>    [474]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
> 
>   * igt@kms_setmode@invalid-clone-single-crtc-stealing:
>     - shard-lnl:          [SKIP][475] -> [SKIP][476] ([Intel XE#1435])
>    [475]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
>    [476]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
> 
>   * igt@kms_writeback@writeback-check-output-xrgb2101010:
>     - shard-lnl:          [SKIP][477] -> [SKIP][478] ([Intel XE#756])
>    [477]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@kms_writeback@writeback-check-output-xrgb2101010.html
>    [478]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@kms_writeback@writeback-check-output-xrgb2101010.html
> 
>   * igt@kms_writeback@writeback-fb-id:
>     - shard-dg2-set2:     [SKIP][479] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][480] ([Intel XE#756])
>    [479]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@kms_writeback@writeback-fb-id.html
>    [480]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
> 
>   * igt@kms_writeback@writeback-invalid-parameters:
>     - shard-dg2-set2:     [SKIP][481] ([Intel XE#756]) -> [SKIP][482] ([Intel XE#1201] / [Intel XE#756])
>    [481]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
>    [482]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-435/igt@kms_writeback@writeback-invalid-parameters.html
> 
>   * igt@xe_compute_preempt@compute-preempt:
>     - shard-dg2-set2:     [SKIP][483] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][484] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
>    [483]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html
>    [484]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html
> 
>   * igt@xe_copy_basic@mem-copy-linear-0x3fff:
>     - shard-dg2-set2:     [SKIP][485] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][486] ([Intel XE#1123])
>    [485]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
>    [486]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0x369:
>     - shard-dg2-set2:     [SKIP][487] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][488] ([Intel XE#1126])
>    [487]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0x369.html
>    [488]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x369.html
> 
>   * igt@xe_copy_basic@mem-set-linear-0xfd:
>     - shard-dg2-set2:     [SKIP][489] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][490] ([Intel XE#1130] / [Intel XE#1201])
>    [489]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfd.html
>    [490]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html
> 
>   * igt@xe_evict@evict-beng-large-multi-vm-cm:
>     - shard-lnl:          [SKIP][491] ([Intel XE#688]) -> [SKIP][492] ([Intel XE#1130]) +5 other tests skip
>    [491]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_evict@evict-beng-large-multi-vm-cm.html
>    [492]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_evict@evict-beng-large-multi-vm-cm.html
> 
>   * igt@xe_evict@evict-beng-mixed-many-threads-large:
>     - shard-dg2-set2:     [TIMEOUT][493] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][494] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
>    [493]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html
>    [494]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html
> 
>   * igt@xe_evict@evict-beng-threads-small:
>     - shard-lnl:          [SKIP][495] ([Intel XE#1130]) -> [SKIP][496] ([Intel XE#688]) +3 other tests skip
>    [495]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_evict@evict-beng-threads-small.html
>    [496]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-2/igt@xe_evict@evict-beng-threads-small.html
> 
>   * igt@xe_evict@evict-cm-threads-large:
>     - shard-dg2-set2:     [INCOMPLETE][497] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392]) -> [SKIP][498] ([Intel XE#1130] / [Intel XE#1201])
>    [497]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-433/igt@xe_evict@evict-cm-threads-large.html
>    [498]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_evict@evict-cm-threads-large.html
> 
>   * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>     - shard-lnl:          [SKIP][499] ([Intel XE#1392]) -> [SKIP][500] ([Intel XE#1130]) +4 other tests skip
>    [499]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
>    [500]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
> 
>   * igt@xe_exec_basic@multigpu-no-exec-basic:
>     - shard-lnl:          [SKIP][501] ([Intel XE#1130]) -> [SKIP][502] ([Intel XE#1392]) +5 other tests skip
>    [501]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-6/igt@xe_exec_basic@multigpu-no-exec-basic.html
>    [502]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-basic.html
> 
>   * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
>     - shard-dg2-set2:     [SKIP][503] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][504] ([Intel XE#1130] / [Intel XE#1201]) +6 other tests skip
>    [503]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
>    [504]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html
> 
>   * igt@xe_exec_fault_mode@many-userptr:
>     - shard-dg2-set2:     [SKIP][505] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][506] ([Intel XE#288]) +9 other tests skip
>    [505]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_exec_fault_mode@many-userptr.html
>    [506]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_exec_fault_mode@many-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>     - shard-dg2-set2:     [SKIP][507] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][508] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
>    [507]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
>    [508]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> 
>   * igt@xe_exec_fault_mode@once-userptr:
>     - shard-dg2-set2:     [SKIP][509] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][510] ([Intel XE#288]) +3 other tests skip
>    [509]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_exec_fault_mode@once-userptr.html
>    [510]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr.html
> 
>   * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
>     - shard-dg2-set2:     [SKIP][511] ([Intel XE#288]) -> [SKIP][512] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
>    [511]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
>    [512]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html
> 
>   * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch:
>     - shard-dg2-set2:     [SKIP][513] ([Intel XE#288]) -> [SKIP][514] ([Intel XE#1130] / [Intel XE#1201])
>    [513]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
>    [514]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch.html
> 
>   * igt@xe_media_fill@media-fill:
>     - shard-dg2-set2:     [SKIP][515] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][516] ([Intel XE#1130] / [Intel XE#1201])
>    [515]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_media_fill@media-fill.html
>    [516]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_media_fill@media-fill.html
>     - shard-lnl:          [SKIP][517] ([Intel XE#560]) -> [SKIP][518] ([Intel XE#1130])
>    [517]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-7/igt@xe_media_fill@media-fill.html
>    [518]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_media_fill@media-fill.html
> 
>   * igt@xe_module_load@reload:
>     - shard-dg2-set2:     [DMESG-FAIL][519] ([Intel XE#2019]) -> [FAIL][520] ([Intel XE#2136])
>    [519]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_module_load@reload.html
>    [520]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_module_load@reload.html
> 
>   * igt@xe_pat@pat-index-xe2:
>     - shard-dg2-set2:     [SKIP][521] ([Intel XE#1201] / [Intel XE#977]) -> [SKIP][522] ([Intel XE#977])
>    [521]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_pat@pat-index-xe2.html
>    [522]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
> 
>   * igt@xe_peer2peer@read:
>     - shard-dg2-set2:     [FAIL][523] ([Intel XE#1173]) -> [SKIP][524] ([Intel XE#1061] / [Intel XE#1201])
>    [523]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_peer2peer@read.html
>    [524]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_peer2peer@read.html
> 
>   * igt@xe_peer2peer@write:
>     - shard-dg2-set2:     [SKIP][525] ([Intel XE#1061] / [Intel XE#1201]) -> [FAIL][526] ([Intel XE#1173])
>    [525]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_peer2peer@write.html
>    [526]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@xe_peer2peer@write.html
> 
>   * igt@xe_pm@d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][527] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][528] ([Intel XE#2284] / [Intel XE#366])
>    [527]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
>    [528]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
>     - shard-lnl:          [SKIP][529] ([Intel XE#1130]) -> [SKIP][530] ([Intel XE#2284] / [Intel XE#366])
>    [529]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-8/igt@xe_pm@d3cold-basic-exec.html
>    [530]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-7/igt@xe_pm@d3cold-basic-exec.html
> 
>   * igt@xe_pm@s2idle-d3cold-basic-exec:
>     - shard-dg2-set2:     [SKIP][531] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][532] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
>    [531]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html
>    [532]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html
> 
>   * igt@xe_pm@s4-vm-bind-unbind-all:
>     - shard-dg2-set2:     [DMESG-WARN][533] ([Intel XE#2019] / [Intel XE#2280]) -> [SKIP][534] ([Intel XE#1130] / [Intel XE#1201])
>    [533]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html
>    [534]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_pm@s4-vm-bind-unbind-all.html
> 
>   * igt@xe_prime_self_import@reimport-vs-gem_close-race:
>     - shard-dg2-set2:     [SKIP][535] ([Intel XE#1130] / [Intel XE#1201]) -> [INCOMPLETE][536] ([Intel XE#1195])
>    [535]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
>    [536]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-433/igt@xe_prime_self_import@reimport-vs-gem_close-race.html
> 
>   * igt@xe_query@multigpu-query-config:
>     - shard-dg2-set2:     [SKIP][537] ([Intel XE#1130] / [Intel XE#1201]) -> [SKIP][538] ([Intel XE#944]) +1 other test skip
>    [537]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-435/igt@xe_query@multigpu-query-config.html
>    [538]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_query@multigpu-query-config.html
> 
>   * igt@xe_query@multigpu-query-cs-cycles:
>     - shard-dg2-set2:     [SKIP][539] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][540] ([Intel XE#944])
>    [539]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html
>    [540]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-engines:
>     - shard-lnl:          [SKIP][541] ([Intel XE#944]) -> [SKIP][542] ([Intel XE#1130]) +3 other tests skip
>    [541]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-4/igt@xe_query@multigpu-query-engines.html
>    [542]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_query@multigpu-query-engines.html
> 
>   * igt@xe_query@multigpu-query-hwconfig:
>     - shard-dg2-set2:     [SKIP][543] ([Intel XE#944]) -> [SKIP][544] ([Intel XE#1201] / [Intel XE#944])
>    [543]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-432/igt@xe_query@multigpu-query-hwconfig.html
>    [544]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html
> 
>   * igt@xe_query@multigpu-query-invalid-cs-cycles:
>     - shard-dg2-set2:     [SKIP][545] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][546] ([Intel XE#1130] / [Intel XE#1201]) +1 other test skip
>    [545]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
>    [546]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-434/igt@xe_query@multigpu-query-invalid-cs-cycles.html
> 
>   * igt@xe_query@multigpu-query-invalid-size:
>     - shard-lnl:          [SKIP][547] ([Intel XE#1130]) -> [SKIP][548] ([Intel XE#944]) +1 other test skip
>    [547]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-3/igt@xe_query@multigpu-query-invalid-size.html
>    [548]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-5/igt@xe_query@multigpu-query-invalid-size.html
> 
>   * igt@xe_wedged@wedged-at-any-timeout:
>     - shard-dg2-set2:     [DMESG-FAIL][549] ([Intel XE#1760]) -> [SKIP][550] ([Intel XE#1130] / [Intel XE#1201])
>    [549]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>    [550]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-dg2-463/igt@xe_wedged@wedged-at-any-timeout.html
>     - shard-lnl:          [DMESG-FAIL][551] ([Intel XE#1760]) -> [SKIP][552] ([Intel XE#1130])
>    [551]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7942/shard-lnl-1/igt@xe_wedged@wedged-at-any-timeout.html
>    [552]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
>   [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
>   [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
>   [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
>   [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
>   [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
>   [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
>   [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
>   [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
>   [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
>   [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
>   [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
>   [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
>   [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
>   [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
>   [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
>   [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
>   [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
>   [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
>   [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
>   [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
>   [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
>   [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
>   [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
>   [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
>   [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
>   [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
>   [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
>   [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
>   [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
>   [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
>   [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
>   [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
>   [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
>   [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
>   [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
>   [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
>   [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
>   [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
>   [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
>   [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
>   [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
>   [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
>   [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
>   [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
>   [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
>   [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
>   [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
>   [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
>   [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
>   [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
>   [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
>   [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
>   [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
>   [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
>   [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
>   [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
>   [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
>   [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
>   [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
>   [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
>   [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
>   [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
>   [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
>   [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
>   [Intel XE#2366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2366
>   [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
>   [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
>   [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
>   [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
>   [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
>   [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
>   [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
>   [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
>   [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
>   [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
>   [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
>   [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
>   [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
>   [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
>   [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
>   [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
>   [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
>   [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
>   [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
>   [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
>   [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
>   [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
>   [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
>   [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
>   [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
>   [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
>   [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
>   [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
>   [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
>   [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
>   [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
>   [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
>   [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
>   [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
>   [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
>   [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
>   [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
>   [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
>   [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
>   [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
>   [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
>   [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
>   [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
>   [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
>   [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
>   [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
>   [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
>   [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
>   [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
>   [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
>   [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
>   [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
>   [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
> 
> 
> Build changes
> -------------
> 
>   * IGT: IGT_7942 -> IGTPW_11489
>   * Linux: xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d -> xe-1686-b6f9528c7fffc2f65c8e4969d35d9346fd503c9b
> 
>   IGTPW_11489: 11489
>   IGT_7942: 0f02dc176959e6296866b1bafd3982e277a5e44b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1684-3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d: 3a93d4a1f4872fbdfe43e9b7f1a7dfd9236a642d
>   xe-1686-b6f9528c7fffc2f65c8e4969d35d9346fd503c9b: b6f9528c7fffc2f65c8e4969d35d9346fd503c9b
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11489/index.html

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
