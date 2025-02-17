Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F26C021A0
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 06:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D77CC10E142;
	Mon, 17 Feb 2025 06:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V78UiPBn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6198A10E142
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 06:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739775561; x=1771311561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XBsFqKI3skrCQwP7C08SBvPO6gb7osiXXxzMt/0Y4Po=;
 b=V78UiPBnPtT5cGs/zkWjbxBtp2sM2n9S5r9vCgkGKtFb3oVyfZIi94hh
 h3E2fxSNM5YL9/UeXmmyPgUpHZR40VFDinCmQm8vx6cAp/91d5l14E222
 cpE9z1xTkTk+14Hfvv9CvNOTKlU374HyavhQBWmJURmBh1Op6+i+O1gQS
 QQ9s30G+6L3u+0pmzqBlwNvCMrrrx8bfMv/fqVnz3xqdO1GnVZMswdxlc
 RS2Mxr6ME/OEJaTOwTjX8vOuzg1Vr5hgitZVAYv83mDwYK7EaZmN1o/FJ
 mxroskv5lDnfOr+l3YiRhD/MydezhweYHOBixDPQ2GMiceRN+4c39ur/X g==;
X-CSE-ConnectionGUID: u60eBIoNTFiOGRatLxv+dQ==
X-CSE-MsgGUID: 6XQ8dxA5QTud2fm1gSsbAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="43277542"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="43277542"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2025 22:59:21 -0800
X-CSE-ConnectionGUID: 6UJr/fH1TZSZRg2jXJGbYQ==
X-CSE-MsgGUID: iNl9Aql8RRSNkwPjalWkog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118671611"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Feb 2025 22:59:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 16 Feb 2025 22:59:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Feb 2025 22:59:20 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Feb 2025 22:59:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuPxNgBprFiN81QpFyDGwPl7Lt8trcpILZzz5618RVnlw6QqQwXZirPkaomEnEiF74JQRgORobnW3pr8jt9N68Ilw3LQsA4fLGoxeKZO41RmeYfn2UJxF1uPyXdc8Xf3HcRMSJZd/cxEmO3b1c3/GH+WEweGk/+ebzAzLM9TSNlCKr0PqnCFLx6Pz2GBiLURBmnohsy23w9/gkS/gYRhwRzo1+qwgQqF5wGnXEEnlgZE38Y2WD23jcpZhKfg1gGVn1Jj9URd+folxtXCbZ6Qp2MXTO688F1b75BZensEoD+6YKqZB/FUWfeJxrF46h1TpsMx70g8Y5Aez8+xcSh+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0+HD/3JT4TuV1/kA+ILO4URfuTwr2yPwOovR44UxBw=;
 b=ZGYwIWJv4KqPYn7Nzj5k98dEO2KgIDFeNz6I3Qs+lFgC+ewMBl4RGTa7QZ1FuZAUfhElw64nBO7YLQFbX7KsosfUhoD0BvJkzYu4V0+IzDMWriDAK3zQCrOjhzU5zEtYVCpcVkcOIu7xNOPzm3eAeecOhHIKlZr0iUNy7T1CnPU7rt84w63B88+cim2kJkg0onhg7R1Coe4aGtKxFHIWIEE71KeamfAzOf/kb0pFifLzuBo3pIIc9seUSKnsZp1+LP3LpvITsk16iTtGc0J5XMPuuc+3snQPb43x7Lvaf2V1u61E37aUwZtOHgzDZ/PqIvPOz49Z4q5EbJZ/E0ogkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SJ0PR11MB4974.namprd11.prod.outlook.com (2603:10b6:a03:2d6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 06:58:36 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%5]) with mapi id 15.20.8445.017; Mon, 17 Feb 2025
 06:58:36 +0000
Message-ID: <b0d46f96-204d-4efb-88dd-883eb808e191@intel.com>
Date: Mon, 17 Feb 2025 12:28:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Add idle engine activity
 test
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>
References: <20250212095834.384508-1-riana.tauro@intel.com>
 <20250212095834.384508-4-riana.tauro@intel.com> <Z6+UnNfsGcQ3QkFf@orsosgc001>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z6+UnNfsGcQ3QkFf@orsosgc001>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SJ0PR11MB4974:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd2e828-bd45-4350-b314-08dd4f207f87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tlg2YUNGYmV5RFpzaEw2OCsyR3RZbEcvYjBkSFQ5b05hSjRxb2cyU0R6L0t2?=
 =?utf-8?B?U25YdjRuRDN5Qm9aZndKbk5hOEpFeFYwZFBUNHpuSHVSSmd2bm1ucExQNnZI?=
 =?utf-8?B?T2NBMjZLeXhqUzc0WllHckk0WTk1Unl3UUdINUhCRWtJRFhwcXpQSnZRTkVG?=
 =?utf-8?B?RUNkSVJ2NVYwZ3hXOVlvTWdKSTNXeUNOZjM2a2JNS2tsZHFDa2xkWTYrT0Jw?=
 =?utf-8?B?REJ1TVpjcENHajQwbVRUOTR3Zi8vQWg0RlNTdGExN1lIaDNrM24yZ24rVGI3?=
 =?utf-8?B?WnZ6ZjdqQjBTN1BWVk1EQy9rZ2c4azR6YnM0T2ZOWW54N1pwZ2R3OXIyUzhY?=
 =?utf-8?B?QlEyZGM5TUtGOVNjQlYxK3NyeCtMTDZNVUUxclpldDFSUC9rZTh3ckhLV2VE?=
 =?utf-8?B?YTg5VzBodVREdE05SmlKOS95ektxZ2JvV2dxZ1hoUFpOQlFBZ3VXOGFSK0Mr?=
 =?utf-8?B?T0FCQWx0UStxNFMxWVptT1o1c1dJNzZ5M3B2Z0FZb0o3Y3g0MEZmMmY1a2ND?=
 =?utf-8?B?ZzFhVzljbmVKOXlHb2lXSGJROEIvbS9lMGg4QVF3bUh0MzV1MXYxa1JBOE0w?=
 =?utf-8?B?WmNkMFdkb3B4QnVDOEF3MlA5a2xKYmNDM3FLZlp5bVBkSURUV09HQ2h5dzZm?=
 =?utf-8?B?Yk8rZ1ZlU3k2OFpOVEpneEJhMU52L3RWMnBOYlA4NVhZNzZIVkFzVWlvT3lD?=
 =?utf-8?B?c01GU0o1dG10L3dkaWhWcy9RVDk3YVhKNFdLTTV4bUMyRzgxQ3lXVGFJUzVQ?=
 =?utf-8?B?TEZNdlZmaGx1WVBHUWZFUjVwVUQvTHdDalI4UFpRN243ckJTRDg5Qlc4c0Zy?=
 =?utf-8?B?UGxIVDNqdjN6UXFLaWVMM0pieVlja0RyVmRiQmE3UHZKWTkyUTlodVIwQm82?=
 =?utf-8?B?L3lSdzNZRnZHczR5b2o3UGV6Z0k1OWZRcnBFZmxoUWR4enlnT01nbjF6REVh?=
 =?utf-8?B?RHRmdzkxV2FHaGlWTDdTY1Q1VjZoZ3VRMWxEMTNIbzlqVkUxQkVMUEZVcndY?=
 =?utf-8?B?YmtLZ0ZBTzlCU2E4L0lXY1ovdnZVQ1RZUFZqdnNXRVp3N2hLYWpGNnNKbkoz?=
 =?utf-8?B?VHcvM2NPK09EQkRRRjl5eGJ0VjIrSjNOZk5iVTY3bm8wZ3lPQitzZGRwcFpG?=
 =?utf-8?B?SUR0dlBBUHRuWXFlYzhmVTZ2MStCQzhGMG96a0hTR3lsdTdQa2lMWGMzN0ph?=
 =?utf-8?B?UkRUZUtSUExrNnFQWFhVZTZyUmMvTFRYaWs4V2dVK1FJQ2xNaDZQTk4wc0xz?=
 =?utf-8?B?a1VBRlV4ZkdPdnJXK3ZaSmdicm9lOThPejVKV2NOOXBVc1NkNFVDOHRjdm9m?=
 =?utf-8?B?djVlekVyQTl1WHdpWmRKN2JHN04xMlBIWHFNVzROdTJoblZlb2pnM1JMM1cx?=
 =?utf-8?B?dFhhU1ViemJxY1hscTJKcXp2ZndmUFZVdDh4MkgrS2dtdmFpNzN5U2VVMzI1?=
 =?utf-8?B?YzVzTXdjZVBCV2NBUkNZT1JGNGZlckxwRXVyZFdpeXl6anFIRVJRQ2dvbWJE?=
 =?utf-8?B?bDZ0WmZiSmdsdkdVVFNENGZzTEVHZ1NvRUZvY3hWd0JlUWt4NERyOHAxdkhp?=
 =?utf-8?B?WDBBMWN1S09CZ055MFdWTTRYTVJrRHd3L1ZjakVjYmpjOWVvS3JxekVOWElB?=
 =?utf-8?B?N25jUzZSQVpNUmhVc2F6Rm1jMURHMzc0T2N4NDJlcEtIKzRMUHlMZ1o4LzFt?=
 =?utf-8?B?T0RVN1Fvb3RvT3BWVU1ia1ZBcUllYjYwYjVIRGcvVGpJNFdBRlpQS3E3elZs?=
 =?utf-8?B?TjIxaTdkUzVhaGZaNzdIeDVCSUdXdFkyaUUzQmpWcnpIYlZGVWlmMkt4RTE1?=
 =?utf-8?B?OVRCMk14bUxra1RBWjRkMmxsa2hhRThlcStDTlpVMjRJNEZTVHpNbFpYTlpq?=
 =?utf-8?Q?sDHnum3cPlSa5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFhkRE5zRkVPVFhyUjBNM2lsdVhaTGswOGhWalRjZ3ZSSzhVZXFoT2RpVWo1?=
 =?utf-8?B?b292anNZekhPa2xWMnMrVHRTanVwU2Mvb3dYVHdjSExNMG1WVGVsMzR4Rm50?=
 =?utf-8?B?Y3RqV3V5ZmdxOW5YS2xhZGxIRE0wMFpZWEh0dk1xQkExSXNBTG9ZN21UZmpr?=
 =?utf-8?B?d0hYenZCTGQ0NFl0V1QweTZlMzB1azJFTW02QTV5L056YS9LTXhaRFN1SFF0?=
 =?utf-8?B?bkt3S2RhYTJBeWtwdkx4ZmJrQTNoRzRlbWRDQkxOeUhIb0E5Tk1JL01CWm9E?=
 =?utf-8?B?WHhDOGsxRUE4Vk1GbGlmYzJnZ0I2S3BZR2NSVDZqOXU0cDh0N2xSbFhHVUF2?=
 =?utf-8?B?bGt3L0FTbWhHVWc2bHhsZDJxbHROMFhZMWtxaTNYZ1paclhkcXc0YW53WUZJ?=
 =?utf-8?B?MTdzYlJnVE5SeThWMFEvaUw0VXRBK2FBU0h4Y2c4RlZLbEk2VTkrYzNVa1J0?=
 =?utf-8?B?TVBzVjI3Wm9hOGg2M0pOZC81MFgxa2RKclZ2T3d4Vi9NY2dFZ3E1cTNyWEt3?=
 =?utf-8?B?S0tZTm1EWUhOYzBnNmR5SDVwQmhEMXZ2RzE4K0ZnT3E2RDkwZmxKbFBjSlYw?=
 =?utf-8?B?cmtYcmloL0JQaC9lbnVvYmhhelphMTVCcnJGOWhubHd3MzdsaU1BUTZHbGxB?=
 =?utf-8?B?MjczUEJkTzNkZmdSNXBOSVNtdXoydmtoUlU4cUlqOS9NeENYUUltUTBmYjBP?=
 =?utf-8?B?dGlQUGpsT2h0U2pUYm4wYlliejE4ditBbS9NQjZDQi9IWm13RWVtMGNHNTYz?=
 =?utf-8?B?bmFHSnZSdCtBRUdFU1gyTlZtbjIvZUEwOWxseEEwUkh1bHkvRUJaR2Rkd0FC?=
 =?utf-8?B?b2tZb3Q3YStnblEyVjk0Y3Y0RHJ6dGdxRHEyZVEzckVDaHRncThmdnFxajRr?=
 =?utf-8?B?M2hKbk9NRVplUHl5anM4NDRMbHU5TVAyWVY2VUtZRXNKT2xrbW5MVTJ0QnVM?=
 =?utf-8?B?R25sL3pUZm02OFRUanNTblpuWEs3OVRNTExNeFZPT1lsUTMwVTdpeitIbm5i?=
 =?utf-8?B?c2hvRjdsc1JaVkIzeGtaMkVONmVPaFBQRjc5RVFSaU82SnF4S1VQRXAyOWI5?=
 =?utf-8?B?YkpzbmkrdEg3czd0SENxM0VHWGxDS2RubktvWmVDNmxCaURkVWJ2M2thd0tR?=
 =?utf-8?B?M3pkSGdlOXVVcTFhellLVjF3VmpsaVp1NkYrQ3lHZVVHMDZqVjRFTVVNSTVT?=
 =?utf-8?B?Um52ZHIvRGdRZVRaaG5Qc2ppRmVxQ3p3T2xpZzFwSjFxcFFUNTNVWUJTSTlX?=
 =?utf-8?B?Tnc0ekVOUEdrOTZ4eXd0TTAxY1FaZiswYzYxMGlKVmU4S1RuTm53Q1czYW1W?=
 =?utf-8?B?L29iY2wwUmdzdXFsZlNmZUFpYnNHNmUvN1RGbCt3S3BXVVhUNERxRS81aGNh?=
 =?utf-8?B?UU9ZQVlldTgxNE51TlVnMUdzaWxOMjlDVFVoMHZYZy80Y1p1Q2VLWU5UbU9l?=
 =?utf-8?B?ZmRHT1h3bTBjOSt5LzRpMGRSRWdJNjFXam1Zc2lrd2VDN1o0WkFYOERKci9G?=
 =?utf-8?B?ZjlyMmY5Zzh0VWxpU1AxcEF5L2luVlFuUjlVYUI2U0VLakFtYkJYOVRQeEdn?=
 =?utf-8?B?ZkRMUSsxRXJMWjI5VFBCa1hIUW1kVU5aRHlHd25CQmhFcUtHRGNwQWFVS1ln?=
 =?utf-8?B?ZERMSGVFdzk1ektlVkUrVGQzZ2VKYWJJYU51b2hybUtLdFk0cHBEYzkxNEhV?=
 =?utf-8?B?Z3JWTW05Y1lpdFMzNmhPb0IwUWY2TmNVa1JnRTBmVTQ0aXZvQTE3Rnp5TGsx?=
 =?utf-8?B?TjJORFNrRW5lL0p0OElwelZvTFRISEQyYkNYVEF5ay83dVJaaUNNazRsWk5P?=
 =?utf-8?B?YU5HSURjbEtpWWZDTGo4MStnSjRjOFl3ckxWaDRSRGZZclNKY0xZWGFMSDc4?=
 =?utf-8?B?TEFGUk5OejBaT1VrV25Sa0FPZUhwMHBMOFdSeUJRMWlhV0lpamQ0VGpPejVx?=
 =?utf-8?B?NzZIZnNBOFJZS0VxeXBNZ3BQZVludUE4aStFYWF4Zml4aHJvOHo3VGRXa2Ir?=
 =?utf-8?B?dU5sa3ZJY3NUcjdjelM5NVkrbDdhaFpWaThEemxKa3VIelB0WlRsK3ptRWFN?=
 =?utf-8?B?MXFvbGMrczUzQlFjOEZ5VnBPbjJpT3ZZdGFwVGFZaG1VOVNidXNGV3VLblVr?=
 =?utf-8?Q?D6EjhagJJRgwok8zcT5Rg4X2r?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd2e828-bd45-4350-b314-08dd4f207f87
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 06:58:35.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NbGy6q77ij+oFXYp8IplRuitYcipNuCCou7alFod6vgxI6inA4EL8PLBfwq6hM0NwWM/h2ji7b7GyTyMh1zYoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4974
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

Hi Umesh

On 2/15/2025 12:38 AM, Umesh Nerlige Ramappa wrote:
> On Wed, Feb 12, 2025 at 03:28:29PM +0530, Riana Tauro wrote:
>> Add a test to validate engine is idle by reading PMU counters
>> (engine-active-ticks, engine-total-ticks) when idle
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 35 +++++++++++++++++++++++++++--------
>> 1 file changed, 27 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index cbb825755..b47be23ac 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -21,6 +21,9 @@
>> #define SLEEP_DURATION 2 /* in seconds */
>> const double tolerance = 0.1;
>>
>> +/* flag masks */
>> +#define TEST_BUSY    BIT(0)
> 
> s/BUSY/ACTIVE/
Will fix this. copied the i915 names
Will change it throughout the tests
> 
>> +
>> #define assert_within_epsilon(x, ref, tolerance) \
>>     igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
>>              (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
>> @@ -79,11 +82,13 @@ static uint64_t get_event_config(int xe, unsigned 
>> int gt, struct drm_xe_engine_c
>> }
>>
>> /**
>> + * SUBTEST: engine-activity-idle
>> + * Description: Test to validate engine activity shows no load when idle
>> + *
>>  * SUBTEST: engine-activity
>> - * Description: Test to validate engine activity stats by running a 
>> workload and
>> - *              reading the active ticks and total ticks PMU counters
>> + * Description: Test to validate engine activity stats by running 
>> full load
>>  */
>> -static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>> +static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, unsigned int flags)
>> {
>>     uint64_t config, busy_ticks, total_ticks, before[2], after[2];
>>     struct xe_cork *cork = NULL;
>> @@ -97,14 +102,18 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>>     pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>>
>>     vm = xe_vm_create(fd, 0, 0);
>> -    cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>> -    xe_cork_sync_start(fd, cork);
>> +
>> +    if (flags & TEST_BUSY) {
>> +        cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>> +        xe_cork_sync_start(fd, cork);
>> +    }
>>
>>     pmu_read_multi(pmu_fd[0], 2, before);
>>     usleep(SLEEP_DURATION * USEC_PER_SEC);
> 
> Usually, I see 3 cases for a single type of test
> 
> 1) idle (no spinner is run)
> 2) active (spinner is run, both samples are captured while running).
> 3) active, then idle (spinner is run, capture second sample after ending 
> spinner)
> 
> Can you also please add case (3). Rest looks good.
Sure will add the trailing idle case

Thanks
Riana
> 
> Thanks,
> Umesh
>>     pmu_read_multi(pmu_fd[0], 2, after);
>>
>> -    xe_cork_sync_end(fd, cork);
>> +    if (flags & TEST_BUSY)
>> +        xe_cork_sync_end(fd, cork);
>>
>>     busy_ticks = after[0] - before[0];
>>     total_ticks = after[1] - before[1];
>> @@ -122,7 +131,10 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>>     close(pmu_fd[0]);
>>     close(pmu_fd[1]);
>>
>> -    assert_within_epsilon(busy_ticks, total_ticks, tolerance);
>> +    if (flags & TEST_BUSY)
>> +        assert_within_epsilon(busy_ticks, total_ticks, tolerance);
>> +    else
>> +        igt_assert(!busy_ticks);
>> }
>>
>> igt_main
>> @@ -134,12 +146,19 @@ igt_main
>>         fd = drm_open_driver(DRIVER_XE);
>>     }
>>
>> +    igt_describe("Validate there is no engine activity when idle");
>> +    igt_subtest_with_dynamic("engine-activity-idle")
>> +        xe_for_each_engine(fd, hwe)
>> +            igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe- 
>> >engine_class),
>> +                      hwe->engine_instance)
>> +                engine_activity(fd, hwe, 0);
>> +
>>     igt_describe("Validate engine activity with workload running by 
>> reading pmu counters");
>>     igt_subtest_with_dynamic("engine-activity")
>>         xe_for_each_engine(fd, hwe)
>>             igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe- 
>> >engine_class),
>>                       hwe->engine_instance)
>> -                engine_activity(fd, hwe);
>> +                engine_activity(fd, hwe, TEST_BUSY);
>>
>>     igt_fixture {
>>         close(fd);
>> -- 
>> 2.47.1
>>

