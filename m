Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8F9C0218B
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jan 2025 00:14:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B8010EA52;
	Sat, 25 Jan 2025 00:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3+7+cTh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D10EE10EA52
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jan 2025 00:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737764050; x=1769300050;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eTZapRwj/PUI28+bJ9ZBUY8wFzKQT9yQbyvbFAgoQQg=;
 b=J3+7+cThKRFJZpyyP/7kY32Z4of2769FkAVyOUBVRlkxmExB1tnT5yN5
 G1aNHpsBWwUxiYPt2CXINujYzCoLx2wSEbbzMSezzI9conGe5lMfN3Fcs
 BgWZZQdkTDIbQkKKvPcbAh9sAPzayAwcuvYTM4JS/cia8bM+UcFv4Zva6
 skKoTRJsrX8yvWehDO6g6yPhot1rWD9eduHHkbpJb3zqmupu2tfzvf9A9
 AveAh81CSJKOO80OIrfZ1A7j2a2HV6F9IHQyzzaBm1hZ1I0dxw7O2PYI1
 SWYehykkO2GZZDw+Zq+fP8EGmQA9caMx8X31GmSZMfsoeVtoDofOZc9dP Q==;
X-CSE-ConnectionGUID: /gQWWNm4T9WA6vXzihPvjA==
X-CSE-MsgGUID: z2FKzliWSc24ilczfeFGLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="49299889"
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; d="scan'208";a="49299889"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 16:14:10 -0800
X-CSE-ConnectionGUID: rPmz5znmQ+mg8yS0LXd9uA==
X-CSE-MsgGUID: Hrw1haxnRJCNSgn1LwwnqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,232,1732608000"; d="scan'208";a="112927330"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 16:14:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 16:14:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 16:14:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 16:14:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPuWKex4FxKJNA0w3MJtXhGgx3RjZFkseWCWQijxUoTuWmaQfwbAcGJTnNhVmGLBRngLmuyvg6oFaEimddcpq0gnt1pAL7xCGrh4tozQMrQw6c32tYh48xj9KawZFxVvcPVXyQYCHmMQSBVd2Kpnnh3pGBTKpq0rK2oeY24bHwk999ye10C7Fj416cL01W+/B0NhGSYQ5rXP/5RmLBmkJyjO+bIyEw/doGI3Oj/0ik7G5eAcu1OrXlHrTBIu+qHC/GuZ36OT7QY7JD/k0c4EF6+jQoc2AoUzqVP2UP6VYXR3TMSkv7d2LRRTLC8sT2Tqq43R124ONrBaU7GEM9QZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9y6glnFbWr2xjh8siJUel3DtwYqTq7jSY+X/ywRZFo=;
 b=HLxN0RLCdBnhBO4x+M77xjDAscM24sZxfFHLy2T09vPP6stV9U4qp9GcogryOM23z2C5ZrYk7PtJ4+mQ0B+RIQteme8BePo0AjMuGZie73bT4AXSRg1PdJluddKJ3psCTArAjvbpS5UxwbzXgKoL9PVVcCnF+kklTHIQmNuX3KryELKStinf7woKPD3t9ihIvPuW4O1g3NtuLk3WaWavcMEAbeyLCkKWEkmt6cofiKCeFGkUeIbriJ7zYPOA+5McmQEGC0UmIQAfO17BtDXoFfmlnERa8ssC9EejjpOMNLZzsedoiSRMtzvbOhyeWGAi9bozqna+f1OX9/teeWmaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Sat, 25 Jan
 2025 00:13:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%3]) with mapi id 15.20.8377.009; Sat, 25 Jan 2025
 00:13:40 +0000
Date: Fri, 24 Jan 2025 16:13:33 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t] tests/intel/perf_pmu: Drop cpu-hotplug subtest
Message-ID: <Z5Qsre521lABn90k@orsosgc001>
References: <20250123053039.1948302-1-lucas.demarchi@intel.com>
 <3espfbwzjk7b6hapbi5pgdlrtketnlbidyclxezzpdbq22cybe@t2otyvqm7cdi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <3espfbwzjk7b6hapbi5pgdlrtketnlbidyclxezzpdbq22cybe@t2otyvqm7cdi>
X-ClientProxiedBy: MW4PR03CA0145.namprd03.prod.outlook.com
 (2603:10b6:303:8c::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 481e19c1-2abd-473a-e580-08dd3cd51ecd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bXpwdnBkZGJsM21zdFlFZmFGZnA1Y0ptU1A1Q3lVb3RsVXhhRkpHMDdRUmw1?=
 =?utf-8?B?bFFLQW9aUDUyQzBMT1JDd28vZThXYWllSGg4Rjg5N0hVU3hNcXliZ3NsaTdU?=
 =?utf-8?B?M0RTU3ZWYlFJY294V21sNlJvS1N0RjREajY2ckZjK25CTDBKaGpWaVlZYk9m?=
 =?utf-8?B?anF1YWhEOEkxd1JIVEt6cnlLcHdRSFNkTmk1d3pYdkptdUJJQ1lSUHlNWW1T?=
 =?utf-8?B?aU9NVmJaRXV2YVpud0FBeGF5bldseVNHRmZLOEtBUG5zMTUwcThwWVh6cVh5?=
 =?utf-8?B?YUVqZUZwdHdEVXBDaFhvL0VOQ2Rja0N4UDRVaC9NZVBMN0xUTWJ4R3dMMW4x?=
 =?utf-8?B?TXV1WVRkVklzL213UTFnRTYzK0s5bktNdWNXd1RPc2VWNTN0M0oyZDl0cFRO?=
 =?utf-8?B?ak9MK3FTQjAza1NrTmc0NktaakFpNnRVa0JHN1FXa2N6UkF6VlU2a0ZIMFh2?=
 =?utf-8?B?eVVPdlRBSUFkZHhuMEQzWEJ1SXg3c1V6a3A3enp1WUVFa2FLdHdZQ0E1eU9k?=
 =?utf-8?B?d01ybkFkZWxBODd2OUhIN2RQNU9ZZEZYSkRLOXR2Q2p3ZHBzNGE2WHVZU0gv?=
 =?utf-8?B?NzArbDlpM1Y1dEJINDJ6Q3hGZk9ZTmVLVzRxVzFHM1JyT1BzdXZTSlN4emhX?=
 =?utf-8?B?dENvZkxQUGlFWFIyZkpJbHBoT29EeVcrRTlPSnNMTFJDS2tKVW1sdzZSTnc5?=
 =?utf-8?B?ODk0bk5SLzlXVUFhaUd1OXFIVG9WNVErWUdON0FkSkNZZzFINDM1dStzcmFs?=
 =?utf-8?B?NXltUlhyV05Kdy9nNGk4Y1VBai95RlhOWWJpZHE0Uzl4REhkQjZ3MkluMkJo?=
 =?utf-8?B?ak9oR1J6R0N5NEYzdkVlWm5MUTd0MENsVmJCbkM1ZjRFSUV6RTBvYW9od2lD?=
 =?utf-8?B?WDBFdkkwNEZ3M0RFMTFEa0FzYzVpdk9jMjI4ejd3WU4ydkkrMEtLbCtXb1gw?=
 =?utf-8?B?eTlCYlN5eStvMER4NkVtNDhIUGhEYk5PYm45cnIzSGlUZ1JadVRhNlR6Uy9H?=
 =?utf-8?B?Z3p1RnIvb1NwT0dJVnkvMjF1TnZxT2doUlFkQjdhM0FlNFMybVU5dW9LRlQ1?=
 =?utf-8?B?NTFUcmJ3TmtYRlRtL1J4OWxzYlRPQUtmYmlTVUNCNFFaZmVzaFhkUkJ5WFNl?=
 =?utf-8?B?QVVYbnhpRUMyL3U4Yzk2c3FkemF5d2JHcEtvcU9wekNBWWs1aXdQMTEwYlp4?=
 =?utf-8?B?Sm91Y3lFd3hLVkJxZFluS3Naa2pFdUlaY3R5WHRIRzVWNklXYlQ5MXhzVDJl?=
 =?utf-8?B?NGg1bEwvNVVsejdqNzljbEo4eXpmUFMxbEVPSFQrWnNoTFpIWlZDTnpPMi96?=
 =?utf-8?B?QlVzQnBWTitzNzQvb2hMRUVlbGZjdU5kKzRVdnNHSDl1MkxnS2srV21teUNC?=
 =?utf-8?B?S3VkeTA5RDRScnltcHpSZkl3MlA4QmJCZDI1SDZXdm5yS3NvdGlTaXg1SERL?=
 =?utf-8?B?RjhXbUVWSitrZWt0aGhxVDkva1k2cWswRXUyK1VYZTd0M2JGRldVT0RlQko2?=
 =?utf-8?B?YjJITXdwTGFiR2FleVhXVjBwcWM0OUloYVNiMFd2aFVCYzFnbGY5MXo2aHN5?=
 =?utf-8?B?NHdTeHZZR29uNUdsMy8vUXpPSGt2K0NVYXZDdG9DVm1kN1hvdTR0dWFIQmdZ?=
 =?utf-8?B?MHUzYW1odmlMMHJ3dXQzSkFLYXlBK2ZCWVVwWkxWV0JIOFd2OFdlRlVvNUda?=
 =?utf-8?B?enlseFpPdDV6WEFUSlcxdXpmUkNMSDIyTVhnU080ZUhyMHgwdS9IM0NXakRG?=
 =?utf-8?B?c21IUlVOQjRLd2kzNzFNWTVTZnJZUVI2dXJ6V09SOEsvelpRNkRkQkJEVXlw?=
 =?utf-8?B?UkhCaXRybEo5WWczQlV0dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWJ6Y0QzQ3ZoZ2RZUXdGY2hPMVQwRGl5S1BsR3RYWnV3YzJ5VG0vVE5NUkVk?=
 =?utf-8?B?QXdVS1VXR2dSMGtMUEM4TkhzTXNPU3N6eGRMbGJjVmc4L0s5K0Jad0gzL1RK?=
 =?utf-8?B?c1cveVlNWXFPMFpEUEsyZk9FU3ZNb2h5bm5ERjh4c2NhTlhWZVJsTVBRNGZZ?=
 =?utf-8?B?VG8vY2lPSXNraGVOTEp3djU5a1REQ2c1MGtZQTlEM1MxVTJCaG5xaFlNZGhE?=
 =?utf-8?B?MGRCNXh1ZFNjRUdPQUo1VFk1Tnhxcm5lb2RoL3huanVFaFZhdEtacU53dFdC?=
 =?utf-8?B?NEkxdXVma3RIOUkrR3Y0bkxxd2dCa0tFa1lac09wenp6bmNOZ082VFpnVHQ0?=
 =?utf-8?B?cTFVRFc3TWUxajlSazNmYjZ5ak1SY3FrTUIza21MSE9FWkZOTVRCYlhTNG9h?=
 =?utf-8?B?azAvMWMxT1RSd0NOZ0dobURxeHB1b29LSlRENWRQZ3ZTanJVR1cwVzFoRlpV?=
 =?utf-8?B?enhQSlhiVlJLd1haZ2plVkwzb2ZnOSt3VnhORlVEcVcyV3BvWXdES3dwMUky?=
 =?utf-8?B?cUxYOHB1MDA5YmRMZlU2a3JGYk5kcW9MSm1IMlRDemhOdnlFTXhzZUZiVk4y?=
 =?utf-8?B?MTJGbGM0U1g2U2xGT0ExYlUzZGkzYjU3YURzWVFKaTVuSytEd0lvS2MzWTFv?=
 =?utf-8?B?K3JyaW8ra0pFdzhoTEVhUnB2ZjMrYUtiNzlYL2FtV3RyYkw3NFBJR21sOEJU?=
 =?utf-8?B?TmprbDFmNHJHZTcwZ2NwYXM2dlJpNHQ5N1YxUlpzQVZ2czJaelExZzJtUVVZ?=
 =?utf-8?B?UWRrK0FETkJWRHUwL1lHSHFyU0pwRmt2ZTNuK3huLzdjWjFRR1NKOENtOXcw?=
 =?utf-8?B?WWhaeGs5RDdpaHU1VENwRnBpVmRwTGZvL1N5cUxDTFBFVVVkOEkwZ0NFK3M5?=
 =?utf-8?B?T0lsdndWWTJoM1gzZGlMSG1vaGhFcnoyUFU4SXlRK2h0RHgyNitBbmdXcWdH?=
 =?utf-8?B?d0ZSZFFLVEs5VkNGMi9JNUE5VFhFYWthVUNKNXRrMmJZVWo5eVBPNzlpdnRl?=
 =?utf-8?B?SElhRXM1eXBpeFc3MGRtYnEvZGdMUU1qQ2VWZUl6bXBmbWsyWC9saDE5MmlW?=
 =?utf-8?B?eFdsL1d3MTN3NEh4ZDBhNExrQlZrRU1GR0VsUkYvYko2eU1kcXh3dFhUS3h1?=
 =?utf-8?B?bHlaQ3Y1Y3g1Z29vTWJkTEp1SjJyd1BPYlliQ1owcWhqQVNiWnBsbGtuWEsv?=
 =?utf-8?B?d01BRHRyRVIrdzV1Z1F2UzFpZ1lJMnlaZkdYR2Iyd3o2a3NENVdoR3hnSjBY?=
 =?utf-8?B?a3F6UUk0QzduZXFUTVg3dGdwRkVZTDJYWkVpUGpkMERGSjY5cTJvQXJ5RFZN?=
 =?utf-8?B?UVF6SFQ3dW81U1VTZFlVOVV0K3BoMk16VitRZ3gyaHRIeGdCWVdyL0oyM1lw?=
 =?utf-8?B?QzMyUUM1WCt1YjdhN1R2blNIWDhSNndXRE1mSHBONStRY1BqL2l1ZUJSeU9v?=
 =?utf-8?B?REhWR1V5S1ZBSU5DbFd0UzZJTkJzMS9ybXl4Njkvdlc3cjNxK2pCVW9pc3B4?=
 =?utf-8?B?WkZWdEJqQU50YTAwc2xvaU94ZkxBVGN6UTAwSGloVnlOTFlLTGpvVWtka2x4?=
 =?utf-8?B?dVpMRnBZbDhvRVE5cGJWUjZOZUx3SnFQTVJiVTBFK1hRVzhtdG5aYytuVSti?=
 =?utf-8?B?ZlFJRytNLzQ3cDBEMnFZQmMvSFFnY3BLK2o0RTJlSmVmQmJFU2w2NHFSU2dm?=
 =?utf-8?B?dHNyL2ZOaDF2a0RXek83ckNrd0ZZMDV4NWdJZHQ3dEtIUEFuVnVJU3Byc1RX?=
 =?utf-8?B?cDVXaCsrVEhEbVdpTzJzdHZSQXVyVzMydGtuY3YzcE5SYWpHVGx4M1dmczdk?=
 =?utf-8?B?KzZjVFhqbXVsMEN5MUxObEJ1VWk1S2YvOUNJVyt5dWpBcjhRM1hnWWtvQU1I?=
 =?utf-8?B?d2E5Y2Rrem11SEZyV3lPMHA4cG5EWDRjMHdmNzBmaTYyb1EwcDRvOUtuc0FY?=
 =?utf-8?B?a2pWcVRZTUJqd2NaQ1J3OXlGbGtndDJ4ZW1LdzMzczVSOFd2bHRSZk1wUlJu?=
 =?utf-8?B?NUZkOVNMeEhmb1daQjZyWDYxcVg3OGxJcU4xdGthK2Rja0ZvYi9qMmpxY0s2?=
 =?utf-8?B?OHNNajBENk53cHlrS3JCTFlQZTJlb1VRNGlaSmdFRTFnTWgrdk5qK0FhVFo4?=
 =?utf-8?B?VlpkMzRvTmw1OFBLeUZDVXgyU3dlalpzUVg5V1g5TVpXUVQ2WmNVV3dObGVz?=
 =?utf-8?Q?fo6fLzo9RF70O/0+fkOAhEQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 481e19c1-2abd-473a-e580-08dd3cd51ecd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2025 00:13:40.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTIjbX3kMHYaLy+xaMBdrGW0antjit+0T6s95krZQlYFZFRWwrgw1UrxVlihPmd/BBpTnjUL2FwaVrkMhmzuEWLcFlBxnR4R9wIYjZMDCHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

On Thu, Jan 23, 2025 at 11:45:55AM -0600, Lucas De Marchi wrote:
>On Wed, Jan 22, 2025 at 09:30:39PM -0800, Lucas De Marchi wrote:
>>This test has been skipping since a long time (forever?) in CI. The
>
>s/(forever?)//
>
>looking at the CI repo it was actually tested because it had a kconfig
>set for making CPU0 hotpluggable. That capability went way in the kernel
>by ...
>
>>reason is that cpu0 is not really hot pluggable. There was an initial
>>attempt that got removed with kernel commits 5475abbde77f ("x86/smpboot:
>>Remove the CPU0 hotplug kludge") and e59e74dc48a3 ("x86/topology: Remove
>>CPU0 hotplug option").
>
>^ these commits, so it's dead code since then.

Hmm, at some point I did enable the kconfig setting and was wondering 
why it still didn't work!!

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh
>
>Lucas De Marchi
>
>>
>>With those commits there are no more cpu0_hotplug kernel parameter and
>>no more BOOTPARAM_HOTPLUG_CPU0 build config.
>>
>>The current i915 pmu integration always returns the first cpu in the
>>system, which means that it's always cpu0.  The cpu migration is also
>>currently wrong and was never detected by this test: it tries to find a
>>sibling cpu rather than allowing to migrate to any cpu in the system.
>>In order to clean up the i915 side, the hotplug code is being removed in
>>favor of the generic one, provided by perf infra. That too has the same
>>"issue" that there's no easy way to test, but hopefully receives more
>>visibility since it's shared by several drivers.
>>
>>If we ever find a way to instrument the kernel to test the hotplug, this
>>code can be partially restored.
>>
>>References: https://lore.kernel.org/all/20250116222426.77757-1-lucas.demarchi@intel.com/
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>tests/intel/perf_pmu.c | 142 -----------------------------------------
>>1 file changed, 142 deletions(-)
>>
>>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>>index 5d0467c02..084ef9631 100644
>>--- a/tests/intel/perf_pmu.c
>>+++ b/tests/intel/perf_pmu.c
>>@@ -101,9 +101,6 @@
>> * SUBTEST: busy-start
>> * Description: Test to verify gpu busyness through engine business pmu counters
>> *
>>- * SUBTEST: cpu-hotplug
>>- * Description: Test the i915 pmu perf interface
>>- *
>> * SUBTEST: enable-race
>> * Description: Test the i915 pmu perf interface
>> *
>>@@ -1362,139 +1359,6 @@ static void open_invalid(int i915)
>>	igt_assert_lt(fd, 0);
>>}
>>
>>-static bool cpu0_hotplug_support(void)
>>-{
>>-	return access("/sys/devices/system/cpu/cpu0/online", W_OK) == 0;
>>-}
>>-
>>-static void cpu_hotplug(int gem_fd)
>>-{
>>-	igt_spin_t *spin[2];
>>-	uint64_t ts[2];
>>-	uint64_t val;
>>-	int link[2];
>>-	int fd, ret;
>>-	int cur = 0;
>>-	char buf;
>>-	uint64_t ahnd = get_reloc_ahnd(gem_fd, 0);
>>-
>>-	igt_require(cpu0_hotplug_support());
>>-
>>-	fd = open_pmu(gem_fd,
>>-		      I915_PMU_ENGINE_BUSY(I915_ENGINE_CLASS_RENDER, 0));
>>-
>>-	/*
>>-	 * Create two spinners so test can ensure shorter gaps in engine
>>-	 * busyness as it is terminating one and re-starting the other.
>>-	 */
>>-	spin[0] = igt_spin_new(gem_fd, .ahnd = ahnd,
>>-			       .engine = I915_EXEC_DEFAULT);
>>-	spin[1] = __igt_spin_new(gem_fd, .ahnd = ahnd,
>>-				 .engine = I915_EXEC_DEFAULT);
>>-
>>-	val = __pmu_read_single(fd, &ts[0]);
>>-
>>-	ret = pipe2(link, O_NONBLOCK);
>>-	igt_assert_eq(ret, 0);
>>-
>>-	/*
>>-	 * Toggle online status of all the CPUs in a child process and ensure
>>-	 * this has not affected busyness stats in the parent.
>>-	 */
>>-	igt_fork(child, 1) {
>>-		int cpu = 0;
>>-
>>-		close(link[0]);
>>-
>>-		for (;;) {
>>-			char name[128];
>>-			int cpufd;
>>-
>>-			igt_assert_lt(snprintf(name, sizeof(name),
>>-					       "/sys/devices/system/cpu/cpu%d/online",
>>-					       cpu), sizeof(name));
>>-			cpufd = open(name, O_WRONLY);
>>-			if (cpufd == -1) {
>>-				igt_assert_lt(0, cpu);
>>-				/*
>>-				 * Signal parent that we cycled through all
>>-				 * CPUs and we are done.
>>-				 */
>>-				igt_assert_eq(write(link[1], "*", 1), 1);
>>-				break;
>>-			}
>>-
>>-			/* Offline followed by online a CPU. */
>>-
>>-			ret = write(cpufd, "0", 2);
>>-			if (ret < 0) {
>>-				/*
>>-				 * If we failed to offline a CPU we don't want
>>-				 * to proceed.
>>-				 */
>>-				igt_warn("Failed to offline cpu%u! (%d)\n",
>>-					 cpu, errno);
>>-				igt_assert_eq(write(link[1], "s", 1), 1);
>>-				break;
>>-			}
>>-
>>-			usleep(1e6);
>>-
>>-			ret = write(cpufd, "1", 2);
>>-			if (ret < 0) {
>>-				/*
>>-				 * Failed to bring a CPU back online is fatal
>>-				 * for the sanity of a test run so stop further
>>-				 * testing.
>>-				 */
>>-				igt_warn("Failed to online cpu%u! (%d)\n",
>>-					 cpu, errno);
>>-				igt_fatal_error();
>>-			}
>>-
>>-			close(cpufd);
>>-			cpu++;
>>-		}
>>-	}
>>-
>>-	close(link[1]);
>>-
>>-	/*
>>-	 * Very long batches can be declared as GPU hangs so emit shorter ones
>>-	 * until the CPU core shuffler finishes one loop.
>>-	 */
>>-	for (;;) {
>>-		usleep(500e3);
>>-		end_spin(gem_fd, spin[cur], 0);
>>-
>>-		/* Check if the child is signaling completion. */
>>-		ret = read(link[0], &buf, 1);
>>-		if ( ret == 1 || (ret < 0 && errno != EAGAIN))
>>-			break;
>>-
>>-		igt_spin_free(gem_fd, spin[cur]);
>>-		spin[cur] = __igt_spin_new(gem_fd, .ahnd = ahnd,
>>-					   .engine = I915_EXEC_DEFAULT);
>>-		cur ^= 1;
>>-	}
>>-
>>-	val = __pmu_read_single(fd, &ts[1]) - val;
>>-
>>-	end_spin(gem_fd, spin[0], FLAG_SYNC);
>>-	end_spin(gem_fd, spin[1], FLAG_SYNC);
>>-	igt_spin_free(gem_fd, spin[0]);
>>-	igt_spin_free(gem_fd, spin[1]);
>>-	igt_waitchildren();
>>-	close(fd);
>>-	close(link[0]);
>>-	put_ahnd(ahnd);
>>-
>>-	/* Skip if child signals a problem with offlining a CPU. */
>>-	igt_skip_on(buf == 's');
>>-
>>-	assert_within_epsilon(val, ts[1] - ts[0], tolerance);
>>-}
>>-
>>static int target_num_interrupts(int i915)
>>{
>>	const intel_ctx_cfg_t cfg = intel_ctx_cfg_all_physical(i915);
>>@@ -2650,12 +2514,6 @@ igt_main
>>		all_busy_check_all(fd, ctx, num_engines,
>>				   TEST_BUSY | TEST_TRAILING_IDLE);
>>
>>-	/**
>>-	 * Test counters are not affected by CPU offline/online events.
>>-	 */
>>-	igt_subtest("cpu-hotplug")
>>-		cpu_hotplug(fd);
>>-
>>	/**
>>	 * Test GPU frequency.
>>	 */
>>-- 
>>2.48.0
>>
