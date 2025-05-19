Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D97EC2D0CD
	for <igt-dev@archiver.kernel.org>; Mon, 19 May 2025 08:35:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E44BB10E20C;
	Mon, 19 May 2025 08:35:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJ3Caw7E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70B110E20C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 May 2025 08:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747643715; x=1779179715;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Lv/+DY+9wWnkYZ/ogUT+sthNWBfUKXA822KHOjjFZPM=;
 b=UJ3Caw7ERvRikAcMaMWcZWRQMJt7eGsBqg/pL5Bd7THGGKZ0/MpBnhB7
 lPv+JeYF1A2yv8l3A6ymPGdTGp67wEQgpvYq5COlcdV6IXu3nEvKeZwWE
 3tkKcOejrvNvjBkBj4+x1Ef6x1R+9YkoEjIWwYf9C8CeLQqHAh/vkCagg
 EaoEgJahmfIaraJ52a7IUn++9cgHp1BeTIsNz6USOa7tERSnZhdKoJlWx
 RYLjMFvWD1uobsCmK9v/X7xba/i5pbyJhhg76yfn0/uh8Wxxtlijwrlx0
 ITwODNPZjBZZPm9d82TVO/JOgojx+kV+9XyaSWr3rOdxUL67J0ZgURMna A==;
X-CSE-ConnectionGUID: RoGAmUpMRy+6j3mA5BKXSg==
X-CSE-MsgGUID: BOCO2+6+TbmthkTnJydW1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49670611"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="49670611"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:35:14 -0700
X-CSE-ConnectionGUID: QEyFeULiRXCPs0UXE7O4Jw==
X-CSE-MsgGUID: +XDPYhZNSa6L2NP/BCikrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="140202272"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2025 01:35:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 01:35:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 01:35:14 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 01:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acHQoTKOTv3Xnl53Dmo+GxqPitGF10kqKpLapLjnjA26vFwG+eVNlvQcrzQO59YQx6c3nU6vVV2p5SfZbaYFCt5SkirmgpeqAqQpLdoJ0d4pRLq60Jov/JZiWdUR3kQ03dLB03oOgW3aIL5bqVL9vMMaGiqE0AbJBoKYwsKAFZZsUaixgzpZag5cLPtBUaYaGw8QY7K5lgkTvPY2PyuMS78LiaA6XvG4WqZKWVNu0pKaLCkCToJdIauqiNdC8/uI5Auea5OEzCWsoGj6rqWof0VTR+pgNPEvlYCsWswj2r6Ytwr64ruGGjMUGOtah5p5jOQF7bih8tZ5H37oTrxL8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JB+3POfo8kcMJLi/kFwyncrJuh2VB+AbssXc76s7kyM=;
 b=N5VhbZmYi7Sj7YliKeZtKiCLFulRuzLpUbe3PCNoWkuJgboED9e7txasYWwXRY0KDx3/ON/AZoARW0frov+bnO1TqHe3BthisXc+4rfZd/Ikn8xV7HJ8cgxUG8qWUk9IkCgBCiATUfS2whDAnf3SrmXOLx/cXxOdaSX0sVzQjm4utsz3WSne1ffErKNnAcMYW0/RVcWXPWrNCqZ3deQ1pHB8KmRtgBSPzNdtDgwEgBKOJcxHqpUGPEdN6GbW6gfNJVvcfrDKvDjgAzvRHD+fgaByOS43srsoYX7Fd3E7ahheI8cqfzmD2gxvi8N10V9Ueoz/A6eVGD92L4YGDlX7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4975.namprd11.prod.outlook.com (2603:10b6:a03:2d0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 08:35:11 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 08:35:11 +0000
Date: Mon, 19 May 2025 10:35:07 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 06/15] lib/intel_blt: separate mem-copy and mem-set
Message-ID: <aCrtO06XEGY-7zbU@fdugast-desk>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
 <20250513185811.897232-7-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250513185811.897232-7-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0100.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::8) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4975:EE_
X-MS-Office365-Filtering-Correlation-Id: 66eba40f-04bc-4d9b-e309-08dd96b01180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU4ySVVRcnNXVXVHV1d3WUJLMVRiSFgwbzkwZnJoanZtNjlYZDg0c01KdndQ?=
 =?utf-8?B?Tjlub1J4S3VNTkR6ODg4dWxKZ2pibHB4akp6L21rSDNCclRXTU5UcWFxeTMw?=
 =?utf-8?B?c3VvR0N2VTVHanc5OWZuRmtleDBDZkJtYjU1RiswZVl0bVE1djFaYWhURFZ1?=
 =?utf-8?B?V1UxcHByWkxPRDlHMkczekdMLzk4SFFRK01KVjM3V0tkNzZBbndNeEJxWkZD?=
 =?utf-8?B?OTUzSXE4Ym1vWFUza29lcStHVTNkM0tvbm9QaWU4cDRSRFROd0pNbk8yeEdG?=
 =?utf-8?B?MVJQVlFvODl1QWxDMkJ6SG1vRVNsbGRRcFlmYm1YSllLbXpPNVdCL2RNc2to?=
 =?utf-8?B?NmFSL2dLNldtb21oQTlibkJkeGVEWVZLN3pLemZ3dFNoWmc4NUh1YUdRUTRo?=
 =?utf-8?B?N202ZmplcnlOVTU4SmtEejBIRzQ5aUN6YytJdlQxVUhvZ1U4cG5IUHFwb0U0?=
 =?utf-8?B?bGMwNUQ1UjlXeVNEbmphRVZ3K3YwNnRTako0MmJhUTdZSlJzRGYrcU5YMTVp?=
 =?utf-8?B?aEZvRjdwbUtweno5eHdFdlpJWTVvMUo4d3RrbjVST25CQXlvcHBXclU0dHpr?=
 =?utf-8?B?Rk95YUdPY0p4SU8xSEp0ODJmWXRSRjloeURNL3B3TzFnODlTSGFweE9nTEt6?=
 =?utf-8?B?eVJ0NUlsUlVpVTM4NFVMWmtIVzdRNytGRWlaTmlmNkw4OURZeFJEeHFCSGt3?=
 =?utf-8?B?STZveVNOV2hGTVQrMU1RV0lOMTA1dzJpSUhkcGRKbjNTUG4rRGFVcTRSMVhh?=
 =?utf-8?B?WkZpa0ZGcW0zd2NLckRuRkZBazZzUzVXeStScFdlM3Rvcmt3T1I2SlBNb25k?=
 =?utf-8?B?N0RyOTNPS3lTaFl0RksvdXlqTGQxOWs2SnlDUm1sMjZRUXp3RjFza0ZwOHpY?=
 =?utf-8?B?ZjBqejArQzAvZXBpRjFZWCtPN0I2ZjVQT0VZY0V3Ukwxbi9BN3BWWVNBbEZZ?=
 =?utf-8?B?aEpRVFRndFdFM2VoeHlPaU43UDJPR1c3Y0ZCQitsVlJ5K0h4cXdpWENuMUhU?=
 =?utf-8?B?dk1hRUF0SkNBVVpTMG1XMWlQVXZZNnFkWnFmKzlQMTU3MjUwRStaZnlETXEx?=
 =?utf-8?B?a09vSktkSk5VdzlmakltdEk5VDBGZWVxWUJxRWJsOFlRREJ0RnJ5YU9BWTZt?=
 =?utf-8?B?bDZCNmU2NEU2bVB3T00wajJQYytENHBYZUdNWHc4YzFjSkd5Tm9wYnRtYTZ0?=
 =?utf-8?B?dllYcHpqSkk2Wk1MRTFLZmZUemxtTnZxRlhJVk4ydGp0ZTFCdnR5Ung0OUFK?=
 =?utf-8?B?cUdaR2t0TThwN3NDeHduRG56RHVJTlZocEFwQU9JdUUySk1LM1ZwTXlySzFV?=
 =?utf-8?B?QnlKQ0hsRlRCQVl3c25kOHUxQXBOcVd1NVd2dFZxZE1kTmZEK1JDMHZtYjNX?=
 =?utf-8?B?eHZvWWllSkUrelZXUXdtMnl3WFYxMG9PQ3pmc00wbG1EMC9mekFNRE5JWkJS?=
 =?utf-8?B?d2xFYjdwY2l1ZnAyamZDZDdvV0ZuVmdhNEx4Z2tHRXJnWUJGbzcwdjdGV1Bm?=
 =?utf-8?B?QVVuL1BhY0VLZTlDK0JVR01CM3h2TlNiTzBjN2dra1NHWWpTaVRQUjJOZGdj?=
 =?utf-8?B?S1NOUTlKbjFET0xWOU9id283czQxKzYrTm92K1owY3F5bTBsSHNiS3ZONTZ6?=
 =?utf-8?B?b2JJVTh6UG9yUUM4Qi8xQm9GMDRsOGF2NTRQbzd0cCttelgzdkVXVGN6MDFO?=
 =?utf-8?B?T2I2Rm4wbHNLc3BPY0dTRE9abk8xU2RtUVFiNXphQU5HQmtGNlVjWUgweFBn?=
 =?utf-8?B?NEM1ZThSTHR1VWtoZUROWkFaQTBFdisxQkdEQ1hiY3FlTE1hSU8zUXNiaEFj?=
 =?utf-8?B?QXlvTHpEQTVTZFkvWnpuMWlYalpySzRIK2o4eW5qaW5JcmlXZDJPamRXQmFT?=
 =?utf-8?B?dUlqejU0a2JhVy9RMzJiaWJmc1NRSXdtTTgxRCtUNjF0Q04xUlc0bDhjK1pP?=
 =?utf-8?Q?tQsb/4fPHIg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1hZUVpGQWVNNEJ5YmxJZHlENktqemNiUk5NL1lrR2h2emJaY1k1NmxUcDVI?=
 =?utf-8?B?elZnWm1PcXcyUVBRdUhTa2VVK21GeFZyZWVwTml2TnJROVpmb3RXU1FiajJI?=
 =?utf-8?B?MFJzcU8wUGVHZ3FTS0VJWnlHdW9KSk1HUUdWN0FQWHBaMFRtZnBVaGJzV2lk?=
 =?utf-8?B?NWtITHZnaEJUVFowZlFVdU55WEozdXM3WStEMEM3RUNhMmRJT3d4UHNhYit2?=
 =?utf-8?B?N0c1dTBEZFFkbmxJUVlpOTBjUDUyUTZMTHhlL29yYTdxeDB4bml1RGFTOTR1?=
 =?utf-8?B?N3Fhcmo0SFJsQ1JhclBmem1MaFUxSitVWGdCSmp1dFpzMlBQODh2UFdHd0R4?=
 =?utf-8?B?anpSVWNiTUtNbG5GL244bkdkWUZ0NTR0d0VFYVBGeWN6RXFoa0IyaVplQ3By?=
 =?utf-8?B?WVY2WDExNVVid3U5RStwTmdncWFLSktieG9aNll5YUtwRzZ0ZmczVnlwMzZl?=
 =?utf-8?B?S0dGT0srR3JCZ2V5bmVKejNXQzhNalNZa2U4T21qb0p6ME1MNnNsL0x5Q29o?=
 =?utf-8?B?ZkZMcXlRbzczNm5IS21uZnEyL1VadHlaZUpBeWJmN053YUJKRkp0MFpiWGpN?=
 =?utf-8?B?QzZjSWx3cHpEMS9IZW1ESG41QkdaanVlNnZFZkMvNVBOVDNxOFlCZXRTUStj?=
 =?utf-8?B?YkxsYlpvT2NVRlhOYnlhd043TWgrWHJkNUxvQ1cyd3kyTTJ4TzhLcTZnbExV?=
 =?utf-8?B?MXJkSkV6bnV1dnVRUW4rRGhkYU5kdjhpR0NNT2h0VnRja0Y4bjJvL3ErMGhr?=
 =?utf-8?B?UHpsMDkrSmRVdHJ2Um9tTVBsWWxIWGNGVkIrb3hxbzdCNVVNTmNxU3V4Uloy?=
 =?utf-8?B?Y3UvYmtYNnF0K1Q0VHJxVTVHNEN4cXA4OFVERmlmSWJRUlB2RnlHUTlSUjF0?=
 =?utf-8?B?YjdSbjBiNXc3ZFpMVmpDTGhKRWRwNXlnWGlXcWdDcTZ0WnhRTDJNckVIQm9C?=
 =?utf-8?B?OUNCem9oYm9pMGQwN2s1VEdJT3hBOFQ1dWltNVBqSXVJZm5Eb3lEOFZMZzZh?=
 =?utf-8?B?THhHRWY0M3JlQTluZDI3bHRObUczaC8wbmVWRVNIV2JNcTFCTjVZeXRMclY4?=
 =?utf-8?B?MG1MQUlSbzhTOTZCTlBHdzZoOVkxSUplbjBDaStHdnJ1eUo5TUtDMEp3S2Fw?=
 =?utf-8?B?MFpncXV3aXJiNmFkQ3haYkdtMlF1SzdESXJudklxYncwWkVWWWNNeFV3T1pR?=
 =?utf-8?B?SW9uUVN1OTZ6Mk9zcWVsUzdmczE1emJ3cGF4b1NHWmVSbUFoRzVnWEdFd2Ft?=
 =?utf-8?B?Sm5aN09Cb0V4SGNuR0FMTFdESWsyNnp2UTlsc093VXV0dFYvV2NRTkI1UlVD?=
 =?utf-8?B?cmlpbHBCZlJja2xwTnB4bHFYZG9CY0YvOEJPRk9zSnE4QkxOMkZSbGFacGdN?=
 =?utf-8?B?dWViYUtLOVlqeFF0bWJIclNwMUNRdis1UkljM05lbHo0MGp3ejVQZ0FpdzlS?=
 =?utf-8?B?WC8wRVJKTUY3STZ2VUJySXdWSlFMUEZXcTdTbWNkTkdGb3BTd25vTHRhdkRz?=
 =?utf-8?B?QWpWcUpGaXBxcnRVdHRMZVhqMGRpS3NMNllWTzdDTmJITHpheHpiNnRuL0tX?=
 =?utf-8?B?S0hkZDV2L0hLZHF6aXE5bEpoZzgyYTZYSTBuVlI2dkJQQ2h3azdPUy9JcUtM?=
 =?utf-8?B?RnRrbG1yQVNkRlZjYzZUOXJRTGRkcW1tVXg5TG1wVDEzbzFmNGhZcXdSTkxY?=
 =?utf-8?B?Kzd6bVVmK1VPVDJCUUsrYVo5bEhoN3ZrUHcxUU5VeGZtT0RCdGFUN3NLSmNF?=
 =?utf-8?B?N2F2RXJkdXFKKzhpaHdWVUVFOUc5SVFCYjYybGlyeHA0aWR2VVQ2SWwwa21L?=
 =?utf-8?B?aVpJaFZBcktRdU55cDN5WEpWWU1aTUFxb1hmWVV1YVhEU1prZXJBL0o3UE1S?=
 =?utf-8?B?R1dLSEk2akRuT2NsU3FDS24vZjFma1QzQU0yVTYxeFZjaU8zRUpBaUYreDF6?=
 =?utf-8?B?VG9YVnc3SUdOczIwdkdsUEs3OGxHWldkUHBPcjNDNFhhM0xKOHNvWkcyVXQy?=
 =?utf-8?B?ODlTdEtaZEhBVVdRTFlqbmdDNmU4bzRnaW9lS09PQ3JDY0Z1S2tZcGkxaS8w?=
 =?utf-8?B?UDZYTWN5WkdFWkR6TU9Qa0czWk94bytlNTN6ZklIMnBmaHFxWCtwRkxDVE90?=
 =?utf-8?B?OVE2MTdoVFVTS3dBd0dCSGlaQ0hKOEdyaVVsLzZsZFJpNmllREFGNkRVSjdO?=
 =?utf-8?B?a2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eba40f-04bc-4d9b-e309-08dd96b01180
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 08:35:11.0713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +KJ7vPo23z4y0odmYGg7IrGjioCLyP9kmA7IdjBUfmElG2S7dZuTNqe3lWgMSjMenN7ZV/R2ByzJ81syHvpGn52r84sZfMdNiuo57SiwX8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4975
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

On Tue, May 13, 2025 at 08:58:01PM +0200, Zbigniew Kempczyński wrote:
> Move operation type (linear or matrix) from buffer to command part.
> Mem-copy additionally uses mode (byte or page) so separate them
> for extending them independently.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_blt.c              | 39 +++++++++++++++++++++++++++---------
>  lib/intel_blt.h              | 24 ++++++++++++++++------
>  tests/intel/xe_copy_basic.c  | 16 +++++++--------
>  tests/intel/xe_render_copy.c |  4 ++--
>  tests/intel/xe_spin_batch.c  |  6 ++----
>  5 files changed, 59 insertions(+), 30 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 33efbf1038..4c90d157c9 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -1799,22 +1799,25 @@ int blt_fast_copy(int fd,
>  }
>  
>  /**
> - * blt_mem_init:
> + * blt_mem_copy_init:
>   * @fd: drm fd
>   * @mem: structure for initialization
> + * @copy_type: linear or matrix
>   *
>   * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
>   * INTEL_DRIVER_XE).
>   */
> -void blt_mem_init(int fd, struct blt_mem_data *mem)
> +void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> +		       enum blt_memop_type copy_type)
>  {
>  	memset(mem, 0, sizeof(*mem));
>  
>  	mem->fd = fd;
>  	mem->driver = get_intel_driver(fd);
> +	mem->copy_type = copy_type;
>  }
>  
> -static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem)
> +static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_copy_data *mem)
>  {
>  	uint64_t dst_offset, src_offset;
>  	int i;
> @@ -1827,7 +1830,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  					  0, mem->dst.pat_index);
>  
>  	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
> -	optype = mem->src.type == TYPE_MATRIX ? 1 << 17 : 0;
> +	optype = mem->copy_type == TYPE_MATRIX ? 1 << 17 : 0;
>  
>  	i = 0;
>  	batch[i++] = MEM_COPY_CMD | optype;
> @@ -1861,7 +1864,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>  int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e,
>  		 uint64_t ahnd,
> -		 const struct blt_mem_data *mem)
> +		 const struct blt_mem_copy_data *mem)
>  {
>  	struct drm_i915_gem_execbuffer2 execbuf = {};
>  	struct drm_i915_gem_exec_object2 obj[3] = {};
> @@ -1902,7 +1905,26 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  	return ret;
>  }
>  
> -static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *mem,
> +/**
> + * blt_mem_set_init:
> + * @fd: drm fd
> + * @mem: structure for initialization
> + *
> + * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
> + * INTEL_DRIVER_XE).
> + */
> +void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
> +		      enum blt_memop_type fill_type)
> +{
> +	memset(mem, 0, sizeof(*mem));
> +
> +	mem->fd = fd;
> +	mem->driver = get_intel_driver(fd);
> +	mem->fill_type = fill_type;
> +}
> +
> +static void emit_blt_mem_set(int fd, uint64_t ahnd,
> +			     const struct blt_mem_set_data *mem,
>  			     uint8_t fill_data)
>  {
>  	uint64_t dst_offset;
> @@ -1945,7 +1967,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *m
>  int blt_mem_set(int fd, const intel_ctx_t *ctx,
>  		const struct intel_execution_engine2 *e,
>  		uint64_t ahnd,
> -		const struct blt_mem_data *mem,
> +		const struct blt_mem_set_data *mem,
>  		uint8_t fill_data)
>  {
>  	struct drm_i915_gem_execbuffer2 execbuf = {};
> @@ -2101,14 +2123,13 @@ void blt_set_mem_object(struct blt_mem_object *obj,
>  			uint32_t handle, uint64_t size, uint32_t pitch,
>  			uint32_t width, uint32_t height, uint32_t region,
>  			uint8_t mocs_index, uint8_t pat_index,
> -			enum blt_memop_type type, enum blt_compression compression)
> +			enum blt_compression compression)
>  {
>  	obj->handle = handle;
>  	obj->region = region;
>  	obj->size = size;
>  	obj->mocs_index = mocs_index;
>  	obj->pat_index = pat_index;
> -	obj->type = type;
>  	obj->compression = compression;
>  	obj->width = width;
>  	obj->height = height;
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index 4bae0b47b3..9efa799881 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -101,7 +101,6 @@ struct blt_mem_object {
>  	uint64_t size;
>  	uint8_t mocs_index;
>  	uint8_t pat_index;
> -	enum blt_memop_type type;
>  	enum blt_compression compression;
>  	uint32_t width;
>  	uint32_t height;
> @@ -128,14 +127,23 @@ struct blt_copy_data {
>  	bool print_bb;
>  };
>  
> -struct blt_mem_data {
> +struct blt_mem_copy_data {
>  	int fd;
>  	enum intel_driver driver;
> +	enum blt_memop_type copy_type;
>  	struct blt_mem_object src;
>  	struct blt_mem_object dst;
>  	struct blt_copy_batch bb;
>  };
>  
> +struct blt_mem_set_data {
> +	int fd;
> +	enum intel_driver driver;
> +	enum blt_memop_type fill_type;
> +	struct blt_mem_object dst;
> +	struct blt_copy_batch bb;
> +};
> +
>  enum blt_surface_type {
>  	SURFACE_TYPE_1D,
>  	SURFACE_TYPE_2D,
> @@ -265,16 +273,20 @@ int blt_fast_copy(int fd,
>  		  uint64_t ahnd,
>  		  const struct blt_copy_data *blt);
>  
> -void blt_mem_init(int fd, struct blt_mem_data *mem);
> +void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
> +		       enum blt_memop_type copy_type);
> +
> +void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
> +		      enum blt_memop_type fill_type);
>  
>  int blt_mem_copy(int fd, const intel_ctx_t *ctx,
>  			 const struct intel_execution_engine2 *e,
>  			 uint64_t ahnd,
> -			 const struct blt_mem_data *mem);
> +			 const struct blt_mem_copy_data *mem);
>  
>  int blt_mem_set(int fd, const intel_ctx_t *ctx,
>  			const struct intel_execution_engine2 *e, uint64_t ahnd,
> -			const struct blt_mem_data *mem, uint8_t fill_data);
> +			const struct blt_mem_set_data *mem, uint8_t fill_data);
>  
>  void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
>  		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
> @@ -302,7 +314,7 @@ void blt_set_mem_object(struct blt_mem_object *obj,
>  			uint32_t handle, uint64_t size, uint32_t pitch,
>  			uint32_t width, uint32_t height, uint32_t region,
>  			uint8_t mocs_index, uint8_t pat_index,
> -			enum blt_memop_type type, enum blt_compression compression);
> +			enum blt_compression compression);
>  
>  void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
>  			uint8_t compression_format,
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index a9e9bd2359..5681d4d6ab 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -44,7 +44,7 @@ static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
>  	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
>  {
> -	struct blt_mem_data mem = {};
> +	struct blt_mem_copy_data mem = {};
>  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
> @@ -56,13 +56,11 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
> -	blt_mem_init(fd, &mem);
> +	blt_mem_copy_init(fd, &mem, TYPE_LINEAR);
>  	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
> -			   region, src_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
> -			   COMPRESSION_DISABLED);
> +			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> -			   region, dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
> -			   COMPRESSION_DISABLED);
> +			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
>  
> @@ -97,7 +95,7 @@ static void
>  mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	uint32_t width, uint32_t height, uint8_t fill_data, uint32_t region)
>  {
> -	struct blt_mem_data mem = {};
> +	struct blt_mem_set_data mem = {};
>  	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
>  	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
>  						  INTEL_ALLOCATOR_SIMPLE,
> @@ -107,9 +105,9 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
>  	uint8_t *result;
>  
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
> -	blt_mem_init(fd, &mem);
> +	blt_mem_set_init(fd, &mem, TYPE_LINEAR);
>  	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
> -			   dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR, COMPRESSION_DISABLED);
> +			   dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
>  	blt_set_batch(&mem.bb, bb, bb_size, region);
>  	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index f0a90e320c..cafc05e19b 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -470,10 +470,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   TYPE_LINEAR, COMPRESSION_DISABLED);
> +			   COMPRESSION_DISABLED);
>  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   TYPE_LINEAR, COMPRESSION_DISABLED);
> +			   COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
>  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
>  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 06c5f9d3f9..21b08ba067 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -350,11 +350,9 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
>  	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
> -			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   TYPE_LINEAR, COMPRESSION_DISABLED);
> +			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
> -			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
> -			   TYPE_LINEAR, COMPRESSION_DISABLED);
> +			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
>  	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
>  	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
> -- 
> 2.43.0
> 
