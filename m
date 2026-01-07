Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF3ACF6BE4
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 06:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A056E10E00B;
	Wed,  7 Jan 2026 06:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PX9uh4o/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297E610E00B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767767115; x=1799303115;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E543TFmPJELm4mvgvmbk1DYxErwaxzX1Cdz9HYufwIA=;
 b=PX9uh4o/E7vLsFRamDcATdBAIvJ8mjUv882/DclIbgd+2igfR1k78GBW
 iDSseHkqFMNu6B+Jt5WUTBjqCIdzEGpML9ma1VU0SkalCg4M1id8RHyUX
 0xhqTPtEbVM1uQoH2SVwac0jdFjrS7/OzDbfTInhJKSb6PClQt8qNmN68
 UP2psDbc+3UMW+bF2S882BUJ61JujP8rXVAqVP/5X9qywn3o+y2uNp8Vh
 kLAvGt0TK3XnrAiph+7MaGrJG49azwxPvpJWbnRe+Ucezib7cq+l4jjTM
 eFt9Lhw62h83BS4yTisZT90q7yp7Sh+LeSZ7ciOfyYJemYaWDRn7mwnoZ w==;
X-CSE-ConnectionGUID: mCKOnVj1TMK9X/WGjVV+kA==
X-CSE-MsgGUID: VNnWjHoKTbyPPFDaD+lshA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72987554"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="72987554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:25:14 -0800
X-CSE-ConnectionGUID: aradNXRRQtaVyQGYkj5w7w==
X-CSE-MsgGUID: sA1aE3X+RVihF+McmBip5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202856759"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 22:25:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:25:14 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 22:25:14 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 22:25:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiJmZe7cQz9h+IUYdsmG7Wz/Z3tKY/sfdpIBEgexc78t2Xss/dGXDo8tLxnfuyMiIrXhH5ZTy+0HbS7K2Wj/F6g13NQr58SjLd5+faB9XEzBuh5hcmFRDpuYln1KsKUS87RPMeYyTUARhOancP8TGRIctjcYuSU8Gh0deXk7eZ6AYIiHENij0PhR/4BxVwZp43okyY6YPMZ2aGOOg4r/Ect0GUyI+PmDCcgsfYuqLu8SKgsF/NrLWqSxiITJMmwY+890/FoS+2gQ1zfjc2WKyDlaQTi3SMTRmMYX9AiqUrl0sf3Rz4Yt2uE9H6MZrf8iWNL0K3JPA+V1l27yAVxYvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06oGBg9R93H+cfwDn7aTCkx9n32V20MJyYKA2GBA0Cw=;
 b=cxJit6fF703a30akC6cD5b1eqU4yzXsg36rWYMwwpVLEtm5gWHZ6VoZYn5i8NYbfj9lLzcKvBRwl/DvR0kf/ea7P4H4HS77KIHlCPc9sQxSko6C1tXv1f4zzN6XJYUd37ObHFCvyaOMZPtLwOTrZd4KBk7B2tgDo+GkWGB9kZ9Ua0dMnnWgqiXDymVM6itWYDiMeH+afEfanO8O66uO17Y75GvsmA0i1o6mJNDD3XlzA5GD2I6l3mEZVry91ir9n+MSR58QbJN0oq5PWEF9orWsneOokamwifxDeDG7mpZtBQXCwYHl2MayAWL9SplSzcYFri8fw3SCWJD1d3skeyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 06:25:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 06:25:06 +0000
Message-ID: <8d1cd710-50e4-432f-a13d-bdeaae5650b8@intel.com>
Date: Wed, 7 Jan 2026 11:54:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 2/2] tests/intel/xe_pm_residency: Add subtest
 for ASPM Link state residency
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20260106135154.33722-1-karthik.poosa@intel.com>
 <20260106135154.33722-3-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20260106135154.33722-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0163.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: fdd569db-4820-4806-834f-08de4db57fe0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2gyREdGSTlBSURNaXBPZEl6VSt5RTBQMGt6NmJaendOenpoQ29ObHlIc2tC?=
 =?utf-8?B?Uy9Ycmg3WlRXTVJhSFFDckU4amFIVGpRTWhWbUhpaEpIN1d2bkc3eDE4NmdK?=
 =?utf-8?B?YnhYd1J2WEV2aXlBb3FiNE9VMnlUcHFLbEVOZjJMV3VnOS9GVk9EUXlHSWtB?=
 =?utf-8?B?Qkgva2M5Vi80Y29UM3lHSXpWQVRscnd4bmV3SFNvcGtGK3lDVUM1RU5sMmpt?=
 =?utf-8?B?TVh3UzNidFY5Z25iclhMbDdYMGVkVllvNW8vbmxHWG13blUyK1Zyci8yMWxP?=
 =?utf-8?B?WWg1QnpYQUZPejFpY3pjeUNNbTllSkFnYlI3elRJd3VlL0N3dFdYYmlCZUVL?=
 =?utf-8?B?QWdYSUZ4YWpsUVRBQk8zdlZiZEtFYVpmMUNsT2paWHd3cTVaZlhOU2trY2pi?=
 =?utf-8?B?aG9SekFrOUUvZ1dVOEYyenUxK0puK3VrQjBLVm1INzVWc1E2dUw0U05YYzFk?=
 =?utf-8?B?U3Mxc0kxeUlzREQwOVh0a1VWSk1saGo4RkUwVCtnUWtQUXhCb0ZySllpK0Jq?=
 =?utf-8?B?YXpwdnd1UmhmVjdXekRhbmpqSmpzZ0d3V2ZLZkhlWlV4TjZnWE44RVF4MmNL?=
 =?utf-8?B?SGJPQU9uODFUMmFXYXZGa1dKK05HSktteFNybTBMSXRvUFFDb1ppOU9YMEhJ?=
 =?utf-8?B?L1VJRmM4djRvdm1ENWxOZmhpTGo0amRvVnVseUdlOERKQWYyM2RRKzQ4SU9O?=
 =?utf-8?B?bUMrMHV2aFJWUE1PL25sRFVNS2VBV3BTckpHMFVxd3RyRWxwYTd3clY3aWll?=
 =?utf-8?B?ME55RnJDZE9PeFdpRUQ1SkE2SVhYTjlSUTFuWWZTNmxNRmhJWjNES1J2UmZC?=
 =?utf-8?B?Q0YvVmVCVjJvYU54OHhlTDRoRE9tVTdWR0NIZVg0TXVkUnl2dDRHVHNjZ0Jy?=
 =?utf-8?B?QWZsN3d3NGRPUVhoMzZiM0R3TEtzUmpUR0NLSWF5b0pzQURFb1hEM3RIZUgw?=
 =?utf-8?B?Q0Ezei81NDhGNm1kbElnVFFRazdrUmZYRkZLOGdRRkJjMzZJTHEwQ3kwZjlF?=
 =?utf-8?B?bUxuN0VVcVFwcVRBNGVNV3c0K2c5ZFVBVU1BZXBxWEgrSHdBdWFLU243TEpn?=
 =?utf-8?B?V2lQaDliN1ZmUk12dVlZTzNMY3g4MWtFc05TV0taakpkWnJQMFFrN1A5THV1?=
 =?utf-8?B?U3luYWJTQUdPWnc3YVlUUUxuaWxES2UyVGgwODlFdlVyaU9uM2dtYTFmaHZz?=
 =?utf-8?B?YWVhMXZTRUxxNHlxcXEwMlk3SGlaV3V1bW9jSEx1MWdzWkorQzlyaFJ6UlVx?=
 =?utf-8?B?YjRuNGpSK2czVllFWEZESXpLMmlBVzl2SGg2UVZtTXFFR0JOamR5RmluOU1q?=
 =?utf-8?B?V1dzcTIya0VTNXdGOWdWekFCR1V4TytjbGJ2WUNraEk3TEZMeHUzZS9Mc0R6?=
 =?utf-8?B?Q0x0RFdGblZmSElObzVmSE4zSjZLNk9MSmg0NnoxaHNjZGRxdzBjeEg2QVJQ?=
 =?utf-8?B?Z0E1ZmdCUVZGeFQ3MXlyMlJBalZJeDZJRGh0SjdMcFNmd3B2eXVTc3RITzNs?=
 =?utf-8?B?MzhobzZMd0xYaGZYclAxTW1oNWRMWU1vRTZtR2ZIallYdnRHU2ZVSmx5NVZv?=
 =?utf-8?B?a2xZOFhwc3AwSitPWHJhcDRhWUlLdFY1NTZEdWI2UklKbTdhai9CYUpvVHpr?=
 =?utf-8?B?NWdxNW5LVjJDTHo0KzAzYnYzOHF0YXJNdytyQ2tyeWYwTTlZRkh0TkpoS1lv?=
 =?utf-8?B?RGU1S2NMOUFYL2tsMzk5d01wcnAvVFJTelBlVVdOK1ZsQ3BWTW92S2VFSXJO?=
 =?utf-8?B?dlV2VWhUWjROUVZURVdwUnpDMEJYblQwT2ZDTExZVnh2UUJuc3d1S00vYlhP?=
 =?utf-8?B?cmNUS3dWVEVpbjVrOTZGQjNURGxMSi9Qd0pJY3RwTVFKTzJxU1liQVlULzd0?=
 =?utf-8?B?akd0MjZHYmE4VU43clVjRlp2TEpnSFZEcDBWN0ZReHhIVWY0Vk84M3YzSERF?=
 =?utf-8?Q?ZqHOKTCowNSCWawf8WiYEWZMLNvAGgEh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1BZTmdNRVdwRjhuS3JMKzFLdHlYbnZFOHkxYjN1bURLaWtjNVI4WmkzeUpG?=
 =?utf-8?B?NFZxb2NsblA5Z05Gb3RYbmkvQndzYVBJT0NseGxIYmFFM0hJMFBxMzRCMEla?=
 =?utf-8?B?Y3RSczg1VS9ncXhJcUxBOVpJWUo4UXQ1dXE4T0tta2daMUR0WXJjSFBST1Nk?=
 =?utf-8?B?SldpdjltUGF5WWR6TCtSODFXVlpIVTd5cG9oZE00MzFKTUNZUG5NN204WWI1?=
 =?utf-8?B?ZG1NanVWMFgwYlZvRFBJRllMbWR5S0E4ajJ6MUp3L2RCbjJUQk5yb3A2anYv?=
 =?utf-8?B?czZZeHJNZHd1bFJrL1hRMW5paEdPajZGUjEydUZucnE3VmFMcUk0VmgzNEhP?=
 =?utf-8?B?RjFqZ3BUNVdxM2NBY2pSZWY2MXBTRmhyWXliTG9MZERHVHE1bGJKSG0wd1JC?=
 =?utf-8?B?RG5kVlcxQllvZnBCZzhpRy9KcnZvWjdrMDVyYjZMRC90aE1Oajd1a0VyVi81?=
 =?utf-8?B?L2ZKa1dqT21nS0pzeWdRaDJrNFp4YXNCdk1rWDF2VjhGTHVvZGE1eDVneEJp?=
 =?utf-8?B?Vm9YZkwwK0dodXVvNkMvTW1nUForQ0xwL2QxV3ZkaWsxVXY4VlBCdkptNjZF?=
 =?utf-8?B?UUVyLzhyKzlyZ2UyY0JnWDZNclJRdTBzdFA0a2w0SS9Na2RrbElraUFpY1RJ?=
 =?utf-8?B?aHpDYk9BL1dMWk14R1hqV0JRcVEvaUZKUGwzZDdnWkJaVWE5cDlwUC9wbUo2?=
 =?utf-8?B?RTh3b1N0c3cxc05XMGttNDdubkk3eDloR3hnRWQ1YzRlVzB1eCs4WldNMU1u?=
 =?utf-8?B?b05YUnpuNUx2THhHd2pDTFpReGIrdERmdHhad21TNmNTbDZCa1hoRHloMWFU?=
 =?utf-8?B?VmdhTlh1WUE1aDJDZDNFcXBiYm95NVNPTUNaMlFoKzdHT082ZW5PbmttcnNX?=
 =?utf-8?B?NFQwL0JjcDJFazN5S1NRdHFkUkdIZllSeDgyYXdqSElZTDA0S01jaDF5akl0?=
 =?utf-8?B?c0VXR0hybHBPTEptRks3ajFrWnJjU2dwa1RRaEJWbk1hdGRFUlFkSVRiL05L?=
 =?utf-8?B?UXJTRFdYNlJOYkhMRnNOcnhGNHhWSEtENy9lNVgvdzY0S3BuanN1K29sZkFa?=
 =?utf-8?B?ejRWbGdoNkdRdk90cllCbTFOa1l5OHAxNU0xM09pRGYvWHY4U1ZtYkNvQWxB?=
 =?utf-8?B?UHJKZ3plS2hrem81SVhCeTZpaWN1a1VpcDBhTStjYUNiWkhVZno5N0EzL1Jq?=
 =?utf-8?B?NUNranN0QnNCWHBzT2Frc1pxcGRkb0c1cVZUYTRVOXVVeHdrRzVURkhpZk1P?=
 =?utf-8?B?SisydFdtdlg4YTIwZUFDemhESWpEVDc1MFBLWXFDODVMd2t5TzhVNjJxWWNu?=
 =?utf-8?B?UEVQK01UZTlScDBwL0JzYkY2NUFGS3dmWWNJNlpDNGx4ZWh5aGRQRitNS1VF?=
 =?utf-8?B?VzdHYU8vY2pHa0lZVnpMbmtzczZodW93NUo2QWJucGQ1R2VlR0wrQ1d4V2U0?=
 =?utf-8?B?SGZaSWNGdHJKbXVRMFZ2a0pUUzFyUjQxUmpIcFNFRWFLakhnK1NBb1dnZmp4?=
 =?utf-8?B?bUduZHVEUUlTeUhneE1xUlRaOTVWN24yVFZnZGwzWEhvWTJpcVJzdVNlNlFs?=
 =?utf-8?B?WGQxNmoxcWM3VTd3aFdGcE5ROHppQWwzbXpqVDRINEhsekpoSUZWalg0TTZB?=
 =?utf-8?B?dXRCUjh3WGhnQXp4bGY2dkdSUk85YUdOVWVFWFBMY1Zpem0yek8ydzBObVF2?=
 =?utf-8?B?MGNFWS9oMUVndHNTRWhrMENoM1dTN3JnTmNSWmdpeStWZmFaYS9kVWJUOWNX?=
 =?utf-8?B?N0pPSXlQNy9GdVRvR0hNTTBLTit6TXZYZVl4OFBlaGtMc1pyU3MzTDFJOVRs?=
 =?utf-8?B?YmpJTmZRVzFYamVrV1A0dmhweTNtK1REOXFVbWVrSy9kMlRmcmxFNWZYVlRz?=
 =?utf-8?B?elFHSndSa1hkV2pKamZCd1Nva2lDR0RETU1ZczJGMnUrRmNkSHlMdWFCWXg0?=
 =?utf-8?B?YW10MXJkV3VVUVRFY0QwemdwWHRCODI0Wi9LQm1FK0c5cmxnMnhQSnhKQmFU?=
 =?utf-8?B?YzY4dHFPL0grRitockdabWlHOWs4SFFwZWFRTVNOc0g0Q1VFS1ZjU21iaE05?=
 =?utf-8?B?N0s5VUE4MXJ2b040NmlmeU5rV0twVkppYUNNWE1ZNFhjLy84US9HRlhsRFJY?=
 =?utf-8?B?a3Y4TCt1RHF4NUVOSFEyWEJJKzdrc2d2VjlycHlzeGNJM2lGNzlKdDVhZ01I?=
 =?utf-8?B?LzRObTBxQVpZMFZsQjVud3hoNHlhR1cxRG5WYTJlNVRrcjdDaVBVVjR0QVNk?=
 =?utf-8?B?Uis3OFRQK1gwTEVDbHBpQ2xDNitQNVhYQ1FoSU5QOUpXMVB0T0RTL1NkTU5C?=
 =?utf-8?B?SlhFYXNNQitsYVA2ZFFLNURTbWp3R1IvY1Uzcm51Q1JGaEY1cm5iZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd569db-4820-4806-834f-08de4db57fe0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 06:25:06.3997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5Y9KyhrxfD3UC14521EgwNV/lAzmGyeZeXCpLqCqSwFh67j5+KV37ufz9Es23Wkg85tTQHZmP9t3GwExKlc/Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

Hi Karthik

On 1/6/2026 7:21 PM, Karthik Poosa wrote:
> Add subtest aspm_link_residency to verify PCIe ASPM.
> Active State Power Management (ASPM) is a power management mechanism
> for PCI Express (PCIe) devices that aims to save power while the devices
> are in a fully active state.
> This test uses link state counters from the debugfs
> dgfx_pcie_link_residencies to verify this.
> 
> v2:
>   - Add dedicated function to get pcie endpoint upstream port. (Badal)
>   - Read residency counter as unsigned long long int instead of
>     unsigned long int.
>   - Print residency counter before sleep also.
>   - Don't assert if sysfs not corresponding to aspm_link_state
>     is not present. (Badal)
>   - Run workload before validation of aspm link residency. (Anshuman)
> 
> v3:
>   - Move igt_device_get_pci_usp to separate patch. (Kamil)
>   - Move reading of residency to separate function. (Badal)
> 
> v4:
>   - Add description about PCIe ASPM in commit message and code. (Kamil)
>   - Add a NULL check for the return value of igt_device_get_pci_usp().
>   - Resolve compilation warnings about using variable as format string
>     to sscanf.
> 
> v5:
>   - Use igt_device_get_pci_upstream_port() which is the renamed version
>     of igt_device_get_pci_usp().
> 
> v6:
>   - Refactor and enhance readability. (Badal)
>   - Move save and restore of link states to separate functions. (Badal)
> 
> v7:
>   - Skip aspm_link_residency on integrated platforms as it not supported.
> 
> v8:
>   - Address below review comments from Riana.
>   - Use igt_sysfs_has_attr() instead of faccess().
>   - Remove unnecessary spaces, debug logs, if checks.
>   - Wrap line length to 100 chars.
>   - Use spinner instead of mmap for workload.
> 
> v9:
>   - Address review comments from Kamil.
>   - Simplify couple of igt_asserts.
>   - Remove extra spaces.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 176 ++++++++++++++++++++++++++++++++++
>   1 file changed, 176 insertions(+)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index d33a87b13..0ff0e4821 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -37,6 +37,27 @@ enum test_type {
>   	TEST_IDLE,
>   };
>   
> +enum link_state_index {
> +	LINK_STATE_ASPM,
> +	LINK_STATE_ASPM_L1_1,
> +	LINK_STATE_ASPM_L1_2,
> +	LINK_STATE_PCIPM_L1_1,
> +	LINK_STATE_PCIPM_L1_2,
> +	MAX_LINK_STATES,
> +};
> +
> +struct link_state_info {
> +	const char *filename;
> +	char state;
> +	const char *parse_str;
> +} link_state_sysfs[] = {
> +	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
> +	{ "l1_1_aspm", 0, "NULL"},
> +	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
> +	{ "l1_1_pcipm", 0, NULL},
> +	{ "l1_2_pcipm", 0, NULL},
> +};
> +
>   /**
>    * SUBTEST: gt-c6-on-idle
>    * Description: Validate GT C6 state on idle
> @@ -64,6 +85,10 @@ enum test_type {
>    * SUBTEST: cpg-gt-toggle
>    * Description: Toggle GT coarse power gating states by acquiring/releasing
>    *		forcewake.
> + *
> + * SUBTEST: aspm_link_residency
> + * Description: Check for PCIe ASPM (Active State Power Management) link states
> + * entry while device is in D0.
>    */
>   IGT_TEST_DESCRIPTION("Tests for gtidle properties");
>   
> @@ -255,6 +280,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
>   	munmap(done, 4096);
>   }
>   
> +static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	igt_spin_t *spin;
> +	uint64_t vm, ahnd;
> +
> +	igt_info("Running spinner on %s:%d\n",
> +		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
> +	vm = xe_vm_create(fd, 0, 0);
> +	intel_allocator_init();
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
> +	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
> +	igt_measured_usleep(USEC_PER_SEC);
> +	igt_spin_free(fd, spin);
> +}
> +
>   static void measure_power(struct igt_power *gpu, double *power)
>   {
>   	struct power_sample power_sample[2];
> @@ -370,6 +410,127 @@ static void cpg_gt_toggle(int fd)
>   		powergate_status(fd, gt, "down");
>   }
>   
> +static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
> +{
> +	int fd_debugfs_dir = 0;
> +	int ret = 0;
> +	char *ptr = NULL;
> +	char path[256] = {0}, buf[1024] = {0};
> +	uint64_t residency = 0;
> +
> +	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
> +	igt_assert(fd_debugfs_dir >= 0);
> +	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf,
> +				      sizeof(buf));
> +	igt_assert_f(ret >= 0, "Cannot read link residency file, ret %d\n", ret);

Add line to improve readability

> +	ptr = strstr(buf, parse_str);
> +	igt_assert_f(ptr, "Cannot find residency string %s\n", parse_str);
> +	sprintf(path, "%s%%llu", parse_str);

This is never used

> +	ret = sscanf(ptr + strlen(parse_str), "%lu", &residency);
> +	igt_assert_f(ret > 0, "Couldn't read residency value, ret %d", ret);
> +	igt_info("Link residency %"PRIu64"\n", residency);
> +	close(fd_debugfs_dir);
> +
> +	return residency;
> +}
> +
> +static void save_and_disable_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
> +			continue;
> +		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename,
> +			  link_state_sysfs[i].state);
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
> +		igt_assert_lt(0, ret);
> +	}
> +}
> +
> +static void restore_link_states(int fd_pci_usp)
> +{
> +	int i = 0;
> +	int ret = 0;
> +	char path[256] = {0};
> +
> +	/* Restore saved states of L1 sysfs entries. */
> +	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
> +		sprintf(path, "%s", link_state_sysfs[i].filename);
> +		if (!igt_sysfs_has_attr(fd_pci_usp, path))
> +			continue;
> +		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
> +		igt_assert_lt(0, ret);
> +		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename,
> +			  link_state_sysfs[i].state);
> +	}
> +}
> +
> +static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
> +{
> +	struct pci_device *pci_dev;
> +	int fd_pci_usp = 0;
> +	char name[PATH_MAX];
> +	int ret = 0;
> +	char path[256] = {0};
> +	uint64_t residency_pre = 0, residency_post = 0;
> +
> +	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
> +
> +	/* Get upstream port pci_dev */
> +	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
> +	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");
> +	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
> +		  pci_dev->bus, pci_dev->dev, pci_dev->func);
> +
> +	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	fd_pci_usp = open(name, O_DIRECTORY);
> +	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
> +		     name, fd_pci_usp);
> +
> +	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
> +	igt_assert(igt_setup_runtime_pm(fd_xe));
> +	igt_disable_runtime_pm();
> +
> +	/* Check if ASPM sysfs is present. */
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, path), "%s is not present\n", path);

Can't you use the filename directly as  a parameter?

> +	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
> +	igt_assert_f((ret > 0), "Couldn't read residency for %s", path);
> +
> +	/* Save current state of all available link sysfs entries and disable all link states. */
> +	save_and_disable_link_states(fd_pci_usp);
> +
> +	/* Enable only the ASPM link state needed for test. */
> +	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
> +	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
> +	ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');

Same as above.

> +
> +	/* Read link state residencies before and after idle wait time. */
> +	residency_pre = get_link_state_residency(fd_xe,
> +						 link_state_sysfs[aspm_link_state].parse_str);
> +	igt_info("Waiting for link to enter idle....\n");
> +	sleep(SLEEP_DURATION);
> +	residency_post = get_link_state_residency(fd_xe,
> +						  link_state_sysfs[aspm_link_state].parse_str);
> +
> +	/* Restore saved link states. */
> +	restore_link_states(fd_pci_usp);
> +
> +	igt_restore_runtime_pm();

I think you need to add a exit handler otherwise if there is any assert 
the runtime pm state might affect the other tests

Thanks
Riana

> +	close(fd_pci_usp);
> +	close(fd_xe);
> +
> +	igt_assert_f(residency_post > residency_pre,
> +		     "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n", residency_pre,
> +		     residency_post);
> +}
>   int igt_main()
>   {
>   	uint32_t d3cold_allowed;
> @@ -444,6 +605,21 @@ int igt_main()
>   		cpg_gt_toggle(fd);
>   	}
>   
> +	igt_describe("ASPM Link residency validation");
> +	igt_subtest_with_dynamic("aspm_link_residency") {
> +		igt_require(xe_has_vram(fd));
> +		xe_for_each_gt(fd, gt) {
> +			xe_for_each_engine(fd, hwe) {
> +				if (gt == hwe->gt_id && !hwe->engine_instance) {
> +					igt_dynamic_f("gt%u-engine-%s", gt,
> +						      xe_engine_class_string(hwe->engine_class))
> +						do_spin(fd, hwe);
> +				}
> +			}
> +		}
> +		test_aspm_link_residency(fd, LINK_STATE_ASPM);
> +	}
> +
>   	igt_fixture() {
>   		close(fd);
>   	}

