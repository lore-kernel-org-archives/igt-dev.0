Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7696DC0218D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 05:52:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE34410E333;
	Tue, 28 Jan 2025 05:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCZJcjkm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62F110E333
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 05:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738043541; x=1769579541;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mJ/KeCOKQCXzh7ROeG7FuUDiZwKmhT37CTBbZInLHqs=;
 b=DCZJcjkmUl2culUOVPtGpoCa9nsht5q0kA8OAf5aTo2QxT6YJBecddMJ
 FaVn0HcnuuYJvsEl1PMBHVL13vbdhM7PYkfuehfWYqgCcSWdgq9ZQ9/7r
 fiFtA+gT7hzRDBERhlT8B78K9Dm/3pgJ+K6BlO2QB782PvIqxW5ovrk0T
 zeZMx1TN+LgLmCOzHLah9JpG7t/TeR6BCdLv2OSMqeH+tHqqz4tNH9NIf
 qmP0XeOjPIDAS+yJ/El9R6+Tl2EQRXVeRAWO5fFwnYYC0eukX0npcYl0H
 o/BbjMhzthLzobPGy2eGNzHfqMDDiJ8SBqjjKBy1Pg3+n2Rz2uQD2V1YV w==;
X-CSE-ConnectionGUID: WJKOL69NS46VVyDDMa8cTQ==
X-CSE-MsgGUID: KGHkD+kVQnez4eK9rPTqcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="56057682"
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="56057682"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 21:52:20 -0800
X-CSE-ConnectionGUID: 6mcagtecQ2GLnGBPa+W1SA==
X-CSE-MsgGUID: 94i4jzy0RimSyJWJSDHTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,240,1732608000"; d="scan'208";a="113688254"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 21:52:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 21:52:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 21:52:19 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 21:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YxzzOGTyRsF7vBV7D3hHkEm6+OPo5lrqQp2yBFv1wbo19pNrfp3I3/bL3qb7VNNsXZmyawLPtvQjp7x6dYej3LSrmaPJciZMOG3AIdXtjGkb7wxdkrufgNrevxWRRitWCNYX81mdyS4ApRjQwrGMkr0NS70AXrF5d7K+OR1iy276K33Xa5zlrBy0u3OOG4+FOQfW17TJxJJG82LS5rmY2UnQzgGRzIAHytyAqnJnLqYxpD9qtzUudd9FsL+PA0BAGM3dCDIcn9QHcD+0ZGSZukNXtKAIE/CeqU5wiBMLrzR9DpJcnR1pncX5eKpvc7s/VrF4bQnLKA80peeH9a2SJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTiC7GAdgjA2vQNzZJnbKtIotlLDN6f8jjgaugVwPCk=;
 b=BE+YCV3ClZlOB9dXKdn2RlL88gp5HvKQWWAhsvNLDwkaF37/s401NPS4Gnwe1uf92dHLEI3rSx/ztbpaYKlrdh+r8RP7fpDzE8sF5XuzXfA12+GScJWkWfRfnzGbUJQu8Uag7IV4Nix0baaDgj5Uyny1suVKhdFxgC0h+qyZJp22X9Mnx44JwkljghrlMS+UHZfXryX6Ey6aCjm6d6XUnl5GHsv0dvgitrvYAkLvWwQh//P7vrhoGWgRTUJCETbQ5SyNqWfFfSmoRN7X4RSym0X11EDcW/4LAn3JOcd2x36c4OEsO/t2kf3RbP1RehMU/3MEqFaslDzzVikbSMTaQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by SA1PR11MB6661.namprd11.prod.outlook.com (2603:10b6:806:255::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 05:51:44 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 05:51:44 +0000
Message-ID: <eb1a2b4f-2a60-40b1-ab0d-2529c71f1f90@intel.com>
Date: Tue, 28 Jan 2025 11:21:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func
To: <igt-dev@lists.freedesktop.org>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
 <20241230190315.48821-2-swati2.sharma@intel.com>
 <SN6PR11MB27042CD0D6A738304905546FDBEC2@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SN6PR11MB27042CD0D6A738304905546FDBEC2@SN6PR11MB2704.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::13) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|SA1PR11MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 279a58ec-737d-4aae-9537-08dd3f5fd833
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHd2d25kTmh0cUREdCtwZm9uMTcrS2FpY0hvVWpYSFFFV2xmYnVKaW8rUVF3?=
 =?utf-8?B?alNGdW9mekUyMEFlTkg5bER2K2pac05obFRYTG9pdExaZENNcko2RmY2eXpy?=
 =?utf-8?B?TTlUZDZzemxyS1FhVlZQZUF0ekVyVnJTbUNzUE1aVzVLZGJySHVmT3FwTGVP?=
 =?utf-8?B?QXN6R0MyQUN6eUkyeElaTXVCRWZ2Y3FXQTRCMWYxdGh0bDNKZ2NCS2h3R09v?=
 =?utf-8?B?RHVhU0N0NDRkaVFEN255d0FEMlVhS09jUk1DT2lCdXFwOWJCUGFZeE40ejlZ?=
 =?utf-8?B?OUJBUTY5THA1dUVHSkphRmFPbEIzUkpjWDFiR09ETlhtQ3ZicUo5QmplWVVh?=
 =?utf-8?B?ZngyRHBlcG9YWXAwOTlsTFkyUU5qbUNLVDNjNENuZ3FHR1QxUTcrUXFrWWNB?=
 =?utf-8?B?RG02WENkT0NTNklzdVFBTGMvM2JSYnc2VnBFY1REL0JrQld5UWp5VVF6WE8r?=
 =?utf-8?B?K1ZJTE9rdnNPRm82OGxsUEM0bzBsS2F1THZlTHBWdzJnZlhMVW5QcEZOL1kz?=
 =?utf-8?B?cmdEb1JaUTJsZHdPY25IMHVuWDRoalhBZlJlcDdqcWpZWmlrVEVPR05kODJC?=
 =?utf-8?B?NGxMQjFuU1FtUGRkWkJHRlpyYmVGVXZqazBaSjBNejR5UFJFMmlEU2x0YzNE?=
 =?utf-8?B?cCszNlhkTjVVV2dnNkNmZitkK1N1WUhtTGI5Tm1JOVI3VytvSTVoT0c3bERr?=
 =?utf-8?B?eDJ3bzVjOFJaQ0lpVG5TSWo5K2VIQXNWQXJUOExyNVB4VnZSd0ltTkhqRXYw?=
 =?utf-8?B?VEpIdTR2L1hpNHdPdnJ0U01uTHluZ3BLV05sS2RuaVFEUXEvRnlsd2FaWS9M?=
 =?utf-8?B?dE5nVEtLQnltdkxjUTI5TExlVXpwRWRjTlIrbVRMM285eFJMd1hrTlJyRHM4?=
 =?utf-8?B?ZmFOMURRSjY3N1JpMnNaelB2TmVPT2E0MisrM01aRkY0T0loc1hOclJCcUk1?=
 =?utf-8?B?NUJ2YTJNVHIrbXk4RUkrcVFIY0RpSzh5ZGJhWU93cHVOTXRaVUtYWURqcTlr?=
 =?utf-8?B?WXh0SnpJdGkwdHhMS0VlUkxVc2hPMFNxWi9rcjVqYmZpaG1xc0ZhaVZuM3ZH?=
 =?utf-8?B?WlVZTXdNcENyM002bGVKUUo4TjZpaHJKT3QvL2IzWGFUWEVpMEo0UkpHRStt?=
 =?utf-8?B?NE44T0VUMGE0NWRTWXFyTzlYVEhINXgxbGQ1WjROdWNNbVFsZkRGMldBTStW?=
 =?utf-8?B?U3laQVBzTWV6dFdBZ093eDdLVzB1VTBJLzJUZUFyby83SEU3Nkc5NTNkM3VM?=
 =?utf-8?B?T0tkUEszOVJuQzI3cWttOUxMbjJZQnArQXYvNGdJbGNFS2poU3YwRHhpQUhK?=
 =?utf-8?B?bEN6dVY2QzZQR3JWYlptVnVRVW1LTjM3TmdsOEZJN3dkRWFJVmZDRGs4RXJz?=
 =?utf-8?B?ejZjYkhvMG5od2Q0aHJRRTVsTkJvRHFORGx5WXg5U25KcWFoT0Q5VVZ1WDJG?=
 =?utf-8?B?UDJwcVViTUFXVnRUak9RUkhnQk1WblRmSERacE5lcDlUZithaVdJZnJYM2VO?=
 =?utf-8?B?OXIzQ1VvWGdxMnNtdjIwTkVJU0Vwd2xpcU1wT2YrWWhFRTcwdUFsaU1hRGNI?=
 =?utf-8?B?M3p4cjFFTEwxQWlUU2dieStGZVd5NGRlUCsva29NeGRYSjNVbEEveWliTWJs?=
 =?utf-8?B?cWFadFpySWFpUnh4SjdyVkZsb2FqQ2ZVZHQyUVptSy9DcDVsMWE3REk0VWMz?=
 =?utf-8?B?YjR0QkVSTzA2RVUvR1BubE1mS0FzTnhBaHF5cGdkM0M5eGNvVCsyN1VDbmVZ?=
 =?utf-8?B?Qkl6OXQxU2hZT1UzOUloZDg5OURzSTZpeFpLU1hwQ3RpVmEyWStnRTNUSHJU?=
 =?utf-8?B?QTQyUmN0YzkxWmRJdzN1TmNWR1RHNUpIMVU3WjJiNlVpK29UZ09KQ24ydG00?=
 =?utf-8?Q?431MlEvQaH8nP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXZlbTlKZ1IvcEZDSXpST3BjSnI2RXRNUEdtR2FMenJrZWRBOFF3K0xmWHVk?=
 =?utf-8?B?MWwvdWQxNXdLalNrL3FXRW1EWjBCdU1ZZjRBc3JUL0cwd29pbSs3OHdVYkNV?=
 =?utf-8?B?WXlIbGRGbmxEbmxJSit6Wm5sMnJXVmhIWlVCZ2lrN1RFNlB6VDh0YWhDZ0gw?=
 =?utf-8?B?S0V3b09lTTNGdFVtbzByS0RpQkFCZnpUTFlUNVcrS1RNMU5HY0ZQT3VpNkJH?=
 =?utf-8?B?ZklXYVZCbFZVY3lLZmVLNkNaVmIxWUIyVGZVSzUzVENYRGpQR3JJMm1OMWNi?=
 =?utf-8?B?N05mS0pTbTluWWhNU1pCWUwrN252YzkxVVZ2WFBFQlVsbnE2YjlLdCs5bVZJ?=
 =?utf-8?B?RXJCL0dnd1hMVzBEQmZWbVpYR1JqYzRQQUpWTFgxd1NXWXltb1QyMnNCN1Ux?=
 =?utf-8?B?ODlRSXFka1NuNXd3ZXFwVU9meXZudldqS1pqR3FzNlFXRDBEbTgwTlZDejhE?=
 =?utf-8?B?WW1tS1JUb0pyOGNERjNTU2JkbG5ScE13bERPUTRVandYNVFVdzQweVVDcVFZ?=
 =?utf-8?B?eEw3Qi9oc1ovZDNFeFh0Q1RWaVVtL2I5NHRwcDlxeUw0anRXdHZ1YTJSeGNy?=
 =?utf-8?B?TldIUTBsQWpIWDQ2Y1dRSWtYbytlT090ZkhTNWxqMVVlM1ZIOXlrbHFXeFFz?=
 =?utf-8?B?cytDTFdRYUhRbXczWjlkQmZwOUloVjc2LzAxbVgxc2loK0NrZVE4NThTcTE1?=
 =?utf-8?B?KzRBTHY1andSemFwTjNOZnRzd0dmdFZIZE9JV2xyUlQzZ0lmUTc5UEZ3OXlu?=
 =?utf-8?B?Mk5aV05MNXB6UzRqUjRaL1Y1T3RSdWM3dGtEV1oxa3Q5TEEyL0tYQ2kwTlZC?=
 =?utf-8?B?ajZBNE5SZ0ZXazZTZkJKaUtmYXc5blE4Rnp2bGt2akg2OG5zdkNmdW1YbjhG?=
 =?utf-8?B?UGZtNjJCcDl4RXNKQjl5TjZ2RE53SHdYSmR1bUt3eVR6dGVFZXNxWWhoaU1z?=
 =?utf-8?B?YVdaRGVkeS82TFB0QlFZT2Faa3lGZHN0aVV5dDk1UllKMmRqMG8wMHI2MFlU?=
 =?utf-8?B?amNUa2NEQlhsZDlHMFpwT0p1VFg0eDEwbzV1TTdlMElyb0xBeWRVTjUwc0lz?=
 =?utf-8?B?Q3VYeDlHNG5ZMlk3VHRKdC9YdStpNlA4UHVMaS91eHNlNkJuTzBkZ2Y1MGFz?=
 =?utf-8?B?OGNETlFaSHBrNDVNbU13T1NaSU13YzFCSUQ4QURYV3FWd1VIaFBuMFo1aEJm?=
 =?utf-8?B?VzQwTUJxWkpuemk5RkhSREVGM1VWZm1uYXpWY3NYRHUvamozdHdMbk9DaFdn?=
 =?utf-8?B?UHZySVJQRzR1bjFMZTJudTZ4a3drVUNsYlROK2RjZ3JueXF1akgwUkNMbjZu?=
 =?utf-8?B?L25aY0dDKzJPcUl1dVorMGlvM2RuTjFyT2FleFRrTUk3SDREWmQ1T2U1VVRx?=
 =?utf-8?B?VURjc3EzNXA3ei95YTRMall1N0dWSkwzbStHQUg4MjZpQ3BHMkdlL1I2TkFB?=
 =?utf-8?B?ai83RnczZU11UThSQnhrUXVYdFpYV1BuNUFvanptSGFOc2ZxblIwM1BkYVN5?=
 =?utf-8?B?amx1SllYMmFNdTRSMSsrLzdEaDBOcUpJMkRydWRJK0VnelEzMU56U0NBVmdi?=
 =?utf-8?B?Z0NtaFFmY3RDNVh1M3R5Ny9YM3FiR0dDNGljbzhHQVhBSk9GSHZ1Q1pMYmRU?=
 =?utf-8?B?alY0WWZrTzlpdDRDeEIxelVFZExWN2R2U3E0eGEwcGluV3R2aHpId2tDQXdZ?=
 =?utf-8?B?bXZBeXRzK1BsQy9OcFhWR29BRzRaZkVqdjNPYmI1N1E5N2NsMnF1ZEMwb1oy?=
 =?utf-8?B?b3M5YzJGekY3cW40c05KaVJjV3Jxa0REUWFRaHgvdzJxOFZvVVk5cWxMRk1k?=
 =?utf-8?B?V2d2RytQTXArNjBIcW94K3R1Zm04TUd2VUVoNDcrUjBybkN3RFBIWlBMUDk5?=
 =?utf-8?B?bzc3ZmF2OEJIdzVQME0vS3ZKMmNFVEE4V3dPRkJUMjZPTUtWZ1o4UzhSTDZw?=
 =?utf-8?B?TmJxOGNTZEdIWHJTd25xckVwWHBJOGdyYmlUcmlCR0Q0dU5MbUNTY3o0MnYw?=
 =?utf-8?B?Sk83K1hialpxSHVETkRyVm9NQ3VwbWZCWXVCZVhsQmtyenYydHpEdTlEYmhG?=
 =?utf-8?B?M0luemNvNHBYaXpNTGl0Sk0wZ3VjYzhhU0hDbUpyVGNkNklyTnBRdWJBZ3JD?=
 =?utf-8?B?Y2ExQm85YTFoRlpCbExhS1ZFRmg2RHJPZ2d1OGxQNkdqWEh3TExTTS9PbTBj?=
 =?utf-8?Q?SPFQUMPKObKLCSxTGw5uvBE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a58ec-737d-4aae-9537-08dd3f5fd833
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 05:51:44.1688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ODtVR9qSdB1j2IAPRbNihz/fTiuiSVTI2pVo6vw8PyNpqaXed5J9hQXTFqa3Q+AnSw2Pkvw7HR5vsj9LyfGPrBiFkQ65VwbEOKPTBfHJwxco7HItsrIzEGPSQJjwm3PC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6661
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



On 27-01-2025 17:02, Reddy Guddati, Santhosh wrote:
> Hi Swati,
> 
> ------------------------------------------------------------------------
> *From:* Sharma, Swati2 <swati2.sharma@intel.com>
> *Sent:* Tuesday, December 31, 2024 12:33 AM
> *To:* igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> *Cc:* Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Reddy Guddati, 
> Santhosh <santhosh.reddy.guddati@intel.com>; Sharma, Swati2 
> <swati2.sharma@intel.com>
> *Subject:* [PATCH i-g-t 1/6] lib/igt_kms: Add highres() and lowres() func
> Functions returning highest and lowest mode are added to lib.
> Corresponding changes are done in relevant binaries.
> 
> LGTM
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_kms.c             | 34 +++++++++++++++++
>   lib/igt_kms.h             |  2 +
>   tests/intel/kms_cdclk.c   | 77 +++++++++++++++++----------------------
>   tests/intel/kms_dsc.c     | 14 +------
>   tests/kms_display_modes.c | 14 +------
>   5 files changed, 72 insertions(+), 69 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a67d17c4f..4f2a5ca0f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4851,6 +4851,40 @@ drmModeModeInfo *igt_output_get_mode(igt_output_t 
> *output)
>                   return &output->config.default_mode;
>   }
> 
> +/**
> + * igt_output_get_highres_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the highest mode
> + */
> +drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output)
> +{
> +       drmModeConnector *connector = output->config.connector;
> +       drmModeModeInfo *highest_mode = NULL;
> +
> +       igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +       highest_mode = &connector->modes[0];
> +
> +       return highest_mode;
> +}
> +
> +/**
> + * igt_output_get_lowres_mode:
> + * @output: Target output
> + *
> + * Returns: A #drmModeModeInfo struct representing the lowest mode
> + */
> +drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output)
> +{
> +       drmModeConnector *connector = output->config.connector;
> +       drmModeModeInfo *lowest_mode = NULL;
> +
> +       igt_sort_connector_modes(connector, sort_drm_modes_by_res_asc);
> +       lowest_mode = &connector->modes[0];
> +
> +       return lowest_mode;
> +}
> +
>   /**
>    * igt_output_override_mode:
>    * @output: Output of which the mode will be overridden
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 1e2a927ab..18c480ce5 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -546,6 +546,8 @@ void 
> igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
> 
>   const char *igt_output_name(igt_output_t *output);
>   drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
> +drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
>   void igt_output_override_mode(igt_output_t *output, const 
> drmModeModeInfo *mode);
>   int igt_output_preferred_vrefresh(igt_output_t *output);
>   void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 382b3e9d1..f1a019eb7 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -110,24 +110,6 @@ static __u64 get_mode_data_rate(drmModeModeInfo *mode)
>           return data_rate;
>   }
> 
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -       drmModeModeInfo *highest_mode = NULL;
> -       drmModeConnector *connector = output->config.connector;
> -       int j;
> -
> -       for (j = 0; j < connector->count_modes; j++) {
> -               if (connector->modes[j].vdisplay == VDISPLAY_4K &&
> -                   connector->modes[j].hdisplay == HDISPLAY_4K &&
> -                   connector->modes[j].vrefresh == VREFRESH) {
> -                       highest_mode = &connector->modes[j];
> -                       break;
> -               }
> -       }
> -
> -       return highest_mode;
> -}
> -
>   static drmModeModeInfo *get_lowres_mode(igt_output_t *output)
>   {
>           drmModeModeInfo *lowest_mode = NULL;
> @@ -172,7 +154,7 @@ static void test_plane_scaling(data_t *data, enum 
> pipe pipe, igt_output_t *outpu
>           int cdclk_ref, cdclk_new;
>           struct igt_fb fb;
>           igt_plane_t *primary;
> -       drmModeModeInfo *mode;
> +       drmModeModeInfo mode;
>           int scaling = 50;
>           int ret;
>           bool test_complete = false;
> @@ -182,14 +164,17 @@ static void test_plane_scaling(data_t *data, enum 
> pipe pipe, igt_output_t *outpu
>                   igt_display_reset(display);
> 
>                   igt_output_set_pipe(output, pipe);
> -               mode = get_highres_mode(output);
> -               igt_require(mode != NULL);
> -               igt_output_override_mode(output, mode);
> +               mode = *igt_output_get_highres_mode(output);
> +               igt_require_f(mode.hdisplay == HDISPLAY_4K && 
> mode.vdisplay == VDISPLAY_4K &&
> +                             mode.vrefresh == VREFRESH, "4K mode not 
> found on output %s.\n",
> +                             igt_output_name(output));
> +
> +               igt_output_override_mode(output, &mode);
> 
>                   primary = igt_output_get_plane_type(output, 
> DRM_PLANE_TYPE_PRIMARY);
> 
>                   igt_create_color_pattern_fb(display->drm_fd,
> -                                           mode->hdisplay, mode->vdisplay,
> +                                           mode.hdisplay, mode.vdisplay,
>                                               DRM_FORMAT_XRGB8888,
>                                               DRM_FORMAT_MOD_LINEAR,
>                                               0.0, 0.0, 0.0, &fb);
> @@ -225,18 +210,20 @@ static void test_mode_transition(data_t *data, 
> enum pipe pipe, igt_output_t *out
>           int cdclk_ref, cdclk_new;
>           struct igt_fb fb;
>           igt_plane_t *primary;
> -       drmModeModeInfo *mode_hi, *mode_lo, *mode;
> +       drmModeModeInfo mode_hi, mode_lo, *mode;
> 
>           do_cleanup_display(display);
>           igt_display_reset(display);
> 
>           igt_output_set_pipe(output, pipe);
>           mode = igt_output_get_mode(output);
> -       mode_lo = get_lowres_mode(output);
> -       mode_hi = get_highres_mode(output);
> -       igt_require(mode_hi != NULL);
> +       mode_lo = *get_lowres_mode(output);
> +       mode_hi = *igt_output_get_highres_mode(output);
> +       igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && 
> mode_hi.vdisplay == VDISPLAY_4K &&
> +                     mode_hi.vrefresh == VREFRESH, "4K mode not found 
> on output %s.\n",
> +                     igt_output_name(output));
> 
> -       igt_skip_on_f(mode_hi->hdisplay == mode_lo->hdisplay && mode_hi- 
>  >vdisplay == mode_lo->vdisplay,
> +       igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && 
> mode_hi.vdisplay == mode_lo.vdisplay,
>                         "Highest and lowest mode resolutions are same; 
> no transition\n");
> 
>           primary = igt_output_get_plane_type(output, 
> DRM_PLANE_TYPE_PRIMARY);
> @@ -248,13 +235,13 @@ static void test_mode_transition(data_t *data, 
> enum pipe pipe, igt_output_t *out
>                                       0.0, 0.0, 0.0, &fb);
> 
>           /* switch to lower resolution */
> -       igt_output_override_mode(output, mode_lo);
> +       igt_output_override_mode(output, &mode_lo);
>           igt_plane_set_fb(primary, &fb);
>           igt_display_commit_atomic(display, 
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>           cdclk_ref = get_current_cdclk_freq(debugfs_fd);
> 
>           /* switch to higher resolution */
> -       igt_output_override_mode(output, mode_hi);
> +       igt_output_override_mode(output, &mode_hi);
>           igt_plane_set_fb(primary, &fb);
>           igt_display_commit_atomic(display, 
> DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>           cdclk_new = get_current_cdclk_freq(debugfs_fd);
> @@ -273,7 +260,7 @@ static void 
> test_mode_transition_on_all_outputs(data_t *data)
>   {
>           igt_display_t *display = &data->display;
>           int debugfs_fd = data->debugfs_fd;
> -       drmModeModeInfo *mode, *mode_hi, *mode_lo;
> +       drmModeModeInfo *mode, mode_hi, mode_lo;
>           igt_output_t *output;
>           int valid_outputs = 0;
>           int cdclk_ref, cdclk_new;
> @@ -297,11 +284,13 @@ static void 
> test_mode_transition_on_all_outputs(data_t *data)
>                   width = max(width, mode->hdisplay);
>                   height = max(height, mode->vdisplay);
> 
> -               mode_hi = get_highres_mode(output);
> -               igt_require(mode_hi != NULL);
> +               mode_hi = *igt_output_get_highres_mode(output);
> +               igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && 
> mode_hi.vdisplay == VDISPLAY_4K &&
> +                             mode_hi.vrefresh == VREFRESH, "4K mode not 
> found on output %s.\n",
> +                             igt_output_name(output));
> 
>                   igt_output_set_pipe(output, i);
> -               igt_output_override_mode(output, mode_hi);
> +               igt_output_override_mode(output, &mode_hi);
>                   i++;
>           }
>           igt_require(intel_pipe_output_combo_valid(display));
> @@ -320,12 +309,12 @@ static void 
> test_mode_transition_on_all_outputs(data_t *data)
>                   mode = igt_output_get_mode(output);
>                   igt_assert(mode);
> 
> -               mode_lo = get_lowres_mode(output);
> +               mode_lo = *get_lowres_mode(output);
> 
> -               igt_output_override_mode(output, mode_lo);
> +               igt_output_override_mode(output, &mode_lo);
>                   igt_plane_set_fb(plane, &fb);
> -               igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo- 
>  >vdisplay);
> -               igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo- 
>  >vdisplay);
> +               igt_fb_set_size(&fb, plane, mode_lo.hdisplay, 
> mode_lo.vdisplay);
> +               igt_plane_set_size(plane, mode_lo.hdisplay, 
> mode_lo.vdisplay);
>                   i++;
>           }
> 
> @@ -343,13 +332,15 @@ static void 
> test_mode_transition_on_all_outputs(data_t *data)
>                   mode = igt_output_get_mode(output);
>                   igt_assert(mode);
> 
> -               mode_hi = get_highres_mode(output);
> -               igt_require(mode_hi != NULL);
> +               mode_hi = *igt_output_get_highres_mode(output);
> +               igt_require_f(mode_hi.hdisplay == HDISPLAY_4K && 
> mode_hi.vdisplay == VDISPLAY_4K &&
> +                             mode_hi.vrefresh == VREFRESH, "4K mode not 
> found on output %s.\n",
> +                             igt_output_name(output));
> 
> -               igt_output_override_mode(output, mode_hi);
> +               igt_output_override_mode(output, &mode_hi);
>                   igt_plane_set_fb(plane, &fb);
> -               igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi- 
>  >vdisplay);
> -               igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi- 
>  >vdisplay);
> +               igt_fb_set_size(&fb, plane, mode_hi.hdisplay, 
> mode_hi.vdisplay);
> +               igt_plane_set_size(plane, mode_hi.hdisplay, 
> mode_hi.vdisplay);
>                   j++;
>           }
> 
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 5508e7a9e..1392e1cd4 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -94,18 +94,6 @@ static inline void manual(const char *expected)
>           igt_debug_interactive_mode_check("all", expected);
>   }
> 
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -       drmModeConnector *connector = output->config.connector;
> -       drmModeModeInfo *highest_mode = NULL;
> -
> -       igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> -
> -       highest_mode = &connector->modes[0];
> -
> -       return highest_mode;
> -}
> -
>   static drmModeModeInfo *get_next_mode(igt_output_t *output, int index)
>   {
>           drmModeConnector *connector = output->config.connector;
> @@ -184,7 +172,7 @@ static void update_display(data_t *data, uint32_t 
> test_type)
>           igt_skip_on(!igt_plane_has_format_mod(primary, data->plane_format,
>                       DRM_FORMAT_MOD_LINEAR));
> 
> -       mode = get_highres_mode(output);
> +       mode = igt_output_get_highres_mode(output);
> 
>           do {
>                   if (data->output_format != DSC_FORMAT_RGB && index > 0)
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
> index e41c60cc0..6ea44944a 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -60,18 +60,6 @@ typedef struct {
>           int n_pipes;
>   } data_t;
> 
> -/* Get higher mode supported by panel. */
> -static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> -{
> -       drmModeConnector *connector = output->config.connector;
> -       drmModeModeInfo *highest_mode = NULL;
> -
> -       igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> -       highest_mode = &connector->modes[0];
> -
> -       return highest_mode;
> -}
> -
>   /* Get the 4k or less then 4k mode of connected panel. */
>   static drmModeModeInfo *get_mode(igt_output_t *output)
>   {
> @@ -344,7 +332,7 @@ igt_main
>                   igt_require_f(dp_mst_outputs > 1, "MST not found more 
> then one\n");
> 
>                   memcpy(&data.mode_mst[0], 
> get_mode(data.mst_output[0]), sizeof(drmModeModeInfo));
> -               memcpy(&data.mode_mst[1], 
> get_highres_mode(data.mst_output[1]),
> +               memcpy(&data.mode_mst[1], 
> igt_output_get_highres_mode(data.mst_output[1]),
>                                   sizeof(drmModeModeInfo));
>                   igt_require_f((data.mode_mst[1].hdisplay >= HDISPLAY_4K &&
>                                  data.mode_mst[1].vdisplay >= 
> VDISPLAY_4K), "4k panel not found\n");
> --
> 2.25.1
> 

