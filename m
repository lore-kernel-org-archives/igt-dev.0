Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F948C35FF1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 05:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EC410E19B;
	Wed, 19 Mar 2025 05:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drG47mrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A997910E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 05:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742361973; x=1773897973;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=thk5lxh2v9IpVQvhKcPUAS1+i/cOYO99/55M+Lk+Wj4=;
 b=drG47mrLQgg9CbaPqErNZ2PenxKxptPTMrYuSpp02ZdYaBRdkzVFU9NW
 K5gxhxPV/Boqerw1/OqvNGRRk9W9cB3FCQruULBYtBADPRihn5/zqPGdY
 2dSLKOIvw6GMfOxTCuSesbBDXsYsc/iiFxvbL2CNdjc5LsudfApDqak1S
 ra2DiLNADk5KvHvgmVfeQ9K5K7+ITEdMWFKxYHfEpYZgiDcFGmcXa3WrK
 sS7FDI+p3c/eoTS+fnlg9kzihgtpwwl5/Ww5fqRjLQWLvV/wArFyjEdyr
 8FOjIwCbKZPaMjbStJX4fUYXUFtFxeN+gwnkmknUnjgZrmzpGwaGt7PDD w==;
X-CSE-ConnectionGUID: T8X44hufRMSHYOhQqZtMFQ==
X-CSE-MsgGUID: sfuikGksQWijp6yrBG9Vdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="46292112"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="46292112"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 22:26:10 -0700
X-CSE-ConnectionGUID: bI9BsiICTIG60SQeI41ZMg==
X-CSE-MsgGUID: opqLZRUcSdqm1sebSnKeoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="122492722"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2025 22:26:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Mar 2025 22:26:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 22:26:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 22:26:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFCGk+Irg5c4XQOjlvsTvbTih7QpnubhVqnHRadXqJKhBPyIS3xhE+fyVEFNilJF5NwM3D37Sv7KB6rAX7bs3wVxcqg2WJJNGWn8NUEV5ka6Y0skNNWbiuCVs4J2PFEGxrax3V9jdDDrtrFCIq3y4SpeusYo7iKiKXto2T8cdn+lbzdCDDXPubVD7SiRIIQVs4m0704R3k7NgoIC7lpFBCh8EngPkmgMe2L43UUiXq95QhlKyD93HDZ3fM3dkhgqlah6VOrgSBdyqtpx/PV/6/rMK5XwDqXZRBJ/bAolKTfYAKw/P37xY2HO2T+QGD1olvZHtNk3IU6oHa1p30KuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFbGe/URRLOzRuJX8jQRXPUjZ/GpKEiA09widEly83Y=;
 b=OxWo2z8YuiKbR5+yLHAEAFlR+rp/jxVWcnN1ijE/4SQr6Ph6QJZTt1TvGVI7/KELy9rz1FKdn+IvuGDFo3aKqD+0Sq2P2HxzHpQidpDIWGJ9AbCvm/d/Jgrplsom5E2RCRRxUqt32win9q0XueKDcG5iDTi180+/eIUAYpb2GqMEgJLDB0sP+hpYneNp3o4CDozm6Z75vCBpVnRYPbGt6jgDOU/CBoMCyNQ8rLggY7q+A82+VGgFboEBMJaAw4Osygn36pu9juxC/A81PprAHfkN6LOmzAhb9iv8D+FgRxLMbDabPx6082sVzc2w9lXhwPeuQhXr9QWtXn15IS+k1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 05:26:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 05:26:07 +0000
Message-ID: <c05c4125-09b2-4570-9fd2-f5e54e837b66@intel.com>
Date: Wed, 19 Mar 2025 10:56:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v3 09/11]
 tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
 <20250221165749.460347-10-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250221165749.460347-10-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fff0f3a-5657-4b60-275e-08dd66a68ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2taeEpubENvY3lsMFl6dU1ybEMvd0V4TmRmVWlWWlJ3dmNrbkNXSXlZVUdw?=
 =?utf-8?B?NXhJdFZsVGtlcDkrditIT0JmanJXcmlVRGhkYk4wY2NUNVZwekNEc2xPbjNm?=
 =?utf-8?B?K3JySHBTcUkzbkw1WFUvaTI1WTVxZzN6c0NIaG83d2JoN3VBeGlUR0ZPVU9n?=
 =?utf-8?B?c0JsY3hxcUp2UHBSU2tmQzZyK1gvaTNFMmJyZlNRcmFKVnhmUXRtem1rNFZI?=
 =?utf-8?B?ZXBYdnUvYTJ3bExXWmgraWJyS3o0a3o2N1hrT1k2MWZ1ZkMzQlBnRGhOK0sr?=
 =?utf-8?B?L1JLY1FJWnJLVnhnY0lJQ2o1T3IzajdQMldsQWR3Nmg2aXU0RmNuSG5ES0lQ?=
 =?utf-8?B?VVIyTHVlVVUyQ29PM1VnTzZMSEcvZmQ4aHNxMVlEclByTS9YNE1EV2NXWjdD?=
 =?utf-8?B?Z3FRSURSbnhZeXlQcFVHQ2pUMHg1a1c5Q1Y5NXBQWXZrdjhFVEEvb0ppaUlP?=
 =?utf-8?B?ODRGdkhOTHg0UnZSK0tlcjNNWTFEcm5XYW1UVHkyVGpNQ0RHUlZBTXdVa0FL?=
 =?utf-8?B?dHRacmFlejJ3c0lrdHBGZ1hBbVZtR1VSbnV0ZXpuUUJ2U1BSaVMvenRUOUVz?=
 =?utf-8?B?ZVBSalAzaWpTZzRQVjBBV3h3YUxJaDdUdFE2NU94L3lqV1czQzh5OGRhTjJH?=
 =?utf-8?B?Uy9vYkpXOHFYUTdFaTdGUmhRbW1BVkdrZzN2K3lJbGlSUXVYWFlrMHdrcUZ2?=
 =?utf-8?B?dEZHbjRUNEVhQVpKcVB2ZXhhTnVBRzZ0NVdGRXl6cjdSRmxHR0lSdENKalhK?=
 =?utf-8?B?QVlFUlNxT3hxMllsM2JnRU5YYUJxL3llVmJZSGNVY3RoOXhpbmhIMGJqY2g1?=
 =?utf-8?B?dnBFUWp5QmRYTDRldEE4bTRabDY4d25ZMHkwRytGdXR2Q3FpQk9ha29ySjNY?=
 =?utf-8?B?OGJhNmJiNlo5VFpJYXpUVjJyUFgxdW83T0Z1aVM0d1FyL3c1T0dnN09BNndH?=
 =?utf-8?B?NDB4Sld0eTd5aWhaZkMxdGUwYlozNGxXanVndEIzU0E3Rm5jTHRZcEdWVTNq?=
 =?utf-8?B?aUJkdzBwUWc1S3hlSUhaR0hicTdqZUo2TUxneURBUjlvcFVtbG9WZ3RHcFc4?=
 =?utf-8?B?YnJuT1RjYWx5c3BBTFF6eDJEKzJaMWJrOXpleUlUMzdIZDJ5L3laaG5sVlZY?=
 =?utf-8?B?T2NJbDMzQjY0V0VPaDhSMmtVNkYxZ0ZCcjVMLytLVHNiZ2U5NTN3bzB4cXdy?=
 =?utf-8?B?M25SUW5DcTFjOFFqWVpMa2ZYaWVpSmp0aS9mMWN2Sk93TGdEb0w1TTdMMmxx?=
 =?utf-8?B?US9VRmtjTnpmVGk2aFVKbk5nSjVOS3pNNko4cGtpTXBMc1dLckQ0Wm85RDMv?=
 =?utf-8?B?b0M1Qzkya29TYWJJajJsRzVkcHp2L0pFV1c1cFJ6ZkI0NWxoK3ZLT20xTEVI?=
 =?utf-8?B?ZHhFc05iUzZVdnd1TTVnTnRFQk5pNlY5cmUyclJXVHhKeldaS0g2VUUvaFZ2?=
 =?utf-8?B?Q2h6NCtvT1o2dUNrOTZ0dUxYUUxwZ0RIQVNOOFdpSXVkNWJXa01ubWpkWThz?=
 =?utf-8?B?Y29TNmIrUStXVWt3V3dYeEVNRkxlNFE1YVRSYWNRSXBBV00yMXBGa1FmZytS?=
 =?utf-8?B?ZUNjYmlQYzFFWHJMNVBVYktGMjJRUkJaOEN4WVIvbWdWK3gvUGZXbUlrNU8x?=
 =?utf-8?B?bVVabVY0S3c2R0ZkeVJYU2Z3eW5PSDlidll2RHgxS3E1RStvTEIxUnNZV0F5?=
 =?utf-8?B?WFNVT21UN3E4UDI1VElOdWdzUUF3Q3BUNGZUMyt2aklBTE5MZjF6bU0vWDFY?=
 =?utf-8?B?RUk0WDUvRGVVbWN5aFJGcGVUcDlIcjhhVUllWFB0U1RWNTJSTnhnL0srcTYr?=
 =?utf-8?B?TXU4d3hNTUVZYXcwWVVRbURncnlJRDF1aEIzQThtYWQ0TDdOU1NSOTQ2K0x1?=
 =?utf-8?Q?orjPPJlouuoq5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zk5JUkphYlExa2drditOWUIwOGQ4dmU3di90QWNaaWRJZ2lkK05QUXFnS3RQ?=
 =?utf-8?B?OXNTaXRYNTluVFRCcU9EQlc2THVyd1lwODNDS3kzSnZMTWdSRE5tdWdjU0dT?=
 =?utf-8?B?WHdvSFQ5MFEwejJoWFRnK251Q3pxSXo3K29sTkExVVM0Qm5yTmo1SjZhbmZ1?=
 =?utf-8?B?ZytYc2h3STZ6cWU1WnBURVpiWmVpN0tFSnRzdzRCajZjR0lUaG1oWm1ucjVm?=
 =?utf-8?B?bllCNHRXR05HZSt5WW9LNWJDcXhvMmZOT25TWTkwNEJ4UEJOakNJNzc5bkNx?=
 =?utf-8?B?dHZQT0NObGlpeVRDeElsNGRqK0VZalZ2NWduMnNNemdMQTNxRmdlb3NSY1Ra?=
 =?utf-8?B?MzJLOFpFYnVjdTNFT1RkNDVEcitTQzJYSjFud1ZTRTFjQ1JRdHJyOVBGNzRO?=
 =?utf-8?B?MWRpUmszelJtcG4vNWZXVXJCZ2VyRFNHMU95TWZkQm1qVVA2MU5tVENLR1Jq?=
 =?utf-8?B?M3pjNG9IRjV5WEtCTTVZTmVaRTUzN1BPb0JuZEhYWkxZVisza21jQk0yenVH?=
 =?utf-8?B?RjVYd3ZId21wMmlQWHA0R1JzaTVnOGlDajJTNUJ6a2ZOcTlSR2VnMEZYU2Jk?=
 =?utf-8?B?NWNiKy94UlpTdEpqeGs1MnhYekpIZzVWckJHU1B4UTMvOEVaYlJhVEpDeVU2?=
 =?utf-8?B?YzBMc0NTNitDNnVKZjFVUXJpa2Q0TzEwNVA5YVdBamRvMENYbG85YlVvdXV1?=
 =?utf-8?B?N3BmSzBDNnh4QUMweDI0dGJNblliTzRPL3NKTUN4NGpQQlMweHM4NnQra0Zp?=
 =?utf-8?B?VFNUKzV4bTJVYlFEazR5K2tDUFZhYVlhaVIzWElRKytEYjJKMDdUM0FNL0Qz?=
 =?utf-8?B?SXEzdDFiSmtFSU01ZFE0aFRWT3daWTJma3QyUi9jSDBVdXBPN3hnK01MR3hz?=
 =?utf-8?B?V095aURMT0hKODEvWVdGRkNQQSswUEtjeGZKL1NEV2NKTFQ5RGg4dG9lMVpi?=
 =?utf-8?B?SjhYS3FSVHE5TC9NZndZOTJUSm5lQXBIMkxwY2d0cDVYeEdPNWw3ZGsraWFp?=
 =?utf-8?B?VUlyQXdzV0gweDlOV1h6REU3eFJ1eEZ5THVSenN5Z2ZMcVhtdjgrdFF0RUF6?=
 =?utf-8?B?azVCai9WaXdBaTBGQVI2NWpQV09LdXFlTnZCanJ1ekEvRXpkUXlRU240Q24y?=
 =?utf-8?B?MXliNGRFZmQ4K3YvTHQvNjJGTnUvVnZqY0oralBjWkR0N1lheXdRRkRnRE9J?=
 =?utf-8?B?cVU0UEhONWc4VHZEYmo2QkZKVnJpR2d4QnZpa1Bta1ViWEZpRDZlbEpmZ01m?=
 =?utf-8?B?djdWZytwaW9YL3p0ZEl0V2haa1lBWDdqcDlNaGdjV2hBNE9JTWpEVFV1WkV3?=
 =?utf-8?B?ZlpoNEM3bmFpaU5pVU8zdmR4ejcybTRmVFBjdmJvMHhiQ1J6b3dvemJBL3Mz?=
 =?utf-8?B?cUhNeVEvNDlCTVZnRkJXdmV5dkZkdXV3NHdid2UrdldNclp3VWcvQjJTMGs3?=
 =?utf-8?B?d29pOWRFd09ocWMyWlVEQlQyUXczSjk3NjJlKzF6MXJaVnFPWjVzRmsyOGw2?=
 =?utf-8?B?WFl2Vlh1azltckxtNnJCMzF6ckUzbGlGckJPNm8zZm9NM3c1WnJtTzhURGEy?=
 =?utf-8?B?dXV6R2pMTkxYbEl6cmlwRDhHMCtmUzkwMGVCOVBRSTdCa0lLalRSRkM1SVll?=
 =?utf-8?B?eFM5KzMxOVd4aHJNdmJXK0kvdkhmUDJURUZ3dC9TYjA4ZTNJWUxzQ3pKSXVt?=
 =?utf-8?B?SUZXMzFMbGt6dk1COHRCSGt4enFPRWtpT0JMZkx2c1poZ2RmcGJiOFpSUHZo?=
 =?utf-8?B?bDl2akVDb3pkOHlwVHlMZDQ4eGFLSk94NEdkTUJENndZcG05RnI2aHAxRGV1?=
 =?utf-8?B?Yi9xUnJiL2hoT0poU3A2T05Qa2dmektSdDUrQ3VoTFBjQWh5VVhZd3E3eGhD?=
 =?utf-8?B?cWMwZE1oaGE3a3FOOEFVMHgyYjFlNHFsa2I3Vjc4NjgxWFFEUWNvUkZBdjBn?=
 =?utf-8?B?Qm5HbGhobGdjY1pSOEdKNytZdTM3QTdOVXZFTHdRNXcyUWlsVE82WC8rNVJZ?=
 =?utf-8?B?VDBaaDBacHpTMWREU1d2UGo1ZGhCbEt4a2QvUkNkYWMzanVaNVR6NHg3RkEz?=
 =?utf-8?B?NEFCY3JKV1orMFMwUXdJek9UeHdrVTJFd2FET2M0V09iblo4dmpsREtNbHhE?=
 =?utf-8?B?QlhZeU02YTQ0L2ozdGVOQmJlUit1L3VpbmFGL3MzWTdUcitjd1M1N3hoSG5E?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fff0f3a-5657-4b60-275e-08dd66a68ce5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 05:26:07.4770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0XgI7q0BfsIidBha4Hv3Z16gibh+vho7bEhj/ENbysRg5KupnpQWrI76flTclRf7ZZ+l7Ty3eNQqJzhSsEAkECgrZGQIkwy5qgmSvV9WbBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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


On 2/21/2025 10:27 PM, Swati Sharma wrote:
> Add new chamelium based sharpness test. Basic test is added where
> we have tried comparing frame dump of unsharped and sharped image.
> After, sharpness filter is applied its expected both frame dumps
> will be different.
>
> v2: -removed MIN/MAX_FILTER_STRENGTH (Ankit)
>      -fixed alignment (Ankit)
>      -removed commit with fb_ref (Ankit)
>      -set data->pipe_id (Ankit)
>      -removed disable_filter_strength_on_pipe()
>      -fixed CRASH
>      -fixed assert condition
> v3: -minor fixes
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   .../kms_chamelium_sharpness_filter.c          | 236 ++++++++++++++++++
>   tests/meson.build                             |   2 +
>   2 files changed, 238 insertions(+)
>   create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
>
> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c b/tests/chamelium/kms_chamelium_sharpness_filter.c
> new file mode 100644
> index 000000000..70903b5f8
> --- /dev/null
> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
> @@ -0,0 +1,236 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms chamelium sharpness filter
> + * Category: Display
> + * Description: Test to validate content adaptive sharpness filter using Chamelium
> + * Driver requirement: xe
> + * Functionality: chamelium, casf
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +/**
> + * SUBTEST: filter-basic
> + * Description: Verify basic content adaptive sharpness filter.
> + */
> +
> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter using Chamelium");
> +
> +#define MID_FILTER_STRENGTH		128
> +
> +typedef struct {
> +	int drm_fd;
> +	enum pipe pipe_id;
> +	struct igt_fb fb, fb_ref;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +	int filter_strength;
> +	struct chamelium *chamelium;
> +	struct chamelium_port **ports;
> +	int port_count;
> +} data_t;
> +
> +static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
> +{
> +	bool ret = true;
> +
> +	igt_output_set_pipe(data->output, pipe);
> +	if (!intel_pipe_output_combo_valid(&data->display))
> +		ret = false;
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +
> +	return ret;
> +}
> +
> +static void set_filter_strength_on_pipe(data_t *data)
> +{
> +	igt_pipe_set_prop_value(&data->display, data->pipe_id,
> +				IGT_CRTC_SHARPNESS_STRENGTH,
> +				data->filter_strength);
> +}
> +
> +static void paint_image(igt_fb_t *fb)
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	int img_x, img_y, img_w, img_h;
> +	const char *file = "1080p-left.png";
> +
> +	img_x = img_y = 0;
> +	img_w = fb->width;
> +	img_h = fb->height;
> +
> +	igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
> +
> +	igt_put_cairo_ctx(cr);
> +}
> +
> +static void setup_fb(int fd, int width, int height, uint32_t format,
> +		     uint64_t modifier, struct igt_fb *fb)
> +{
> +	int fb_id;
> +
> +	fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
> +	igt_assert(fb_id);
> +
> +	paint_image(fb);
> +}
> +
> +static void cleanup(data_t *data)
> +{
> +	igt_remove_fb(data->drm_fd, &data->fb);
> +	igt_remove_fb(data->drm_fd, &data->fb_ref);
> +	igt_output_set_pipe(data->output, PIPE_NONE);
> +	igt_output_override_mode(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +static bool test_t(data_t *data, igt_plane_t *primary,
> +		   struct chamelium_port *port)
> +{
> +	struct chamelium_frame_dump *dump;
> +	drmModeModeInfo *mode;
> +	int height, width;
> +	bool ret = false;
> +
> +	igt_output_set_pipe(data->output, data->pipe_id);
> +
> +	mode = igt_output_get_mode(data->output);
> +	height = mode->hdisplay;
> +	width = mode->vdisplay;
> +
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb_ref);
> +	setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +
> +	igt_plane_set_fb(data->primary, &data->fb);
> +	set_filter_strength_on_pipe(data);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);


Instead of setting the pipe and the property together, we can set the 
pipe and commit in the first step.

After that, we can set the property and commit with the 
DRM_MODE_ATOMIC_ALLOW_MODESET flag set.

This approach aligns with the general use case where the pipe is set 
first, followed by enabling sharpness, and this should occur without 
requiring a modeset.

Otherwise, I agree with the test.

Regards,

Ankit

> +
> +	igt_debug("Reading frame dumps from Chamelium...\n");
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	dump = chamelium_read_captured_frame(data->chamelium, 0);
> +
> +	ret = chamelium_frame_match_or_dump(data->chamelium, port,
> +					    dump, &data->fb_ref,
> +					    CHAMELIUM_CHECK_ANALOG);
> +	chamelium_destroy_frame_dump(dump);
> +	cleanup(data);
> +
> +	return ret;
> +}
> +
> +static int test_setup(data_t *data, enum pipe p)
> +{
> +	igt_pipe_t *pipe;
> +	int i = 0;
> +
> +	igt_display_reset(&data->display);
> +
> +	pipe = &data->display.pipes[p];
> +	igt_require(pipe->n_planes >= 0);
> +
> +	data->primary = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
> +	igt_assert(data->primary);
> +
> +	/*
> +	 * Prefer to run this test on HDMI connector if its connected, since on DP we
> +	 * sometimes face DP FSM issue
> +	 */
> +        for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		data->pipe_id = p;
> +		for (i = 0; i < data->port_count; i++) {
> +			if ((data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> +			     data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) &&
> +			     strcmp(data->output->name, chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	for_each_valid_output_on_pipe(&data->display, p, data->output) {
> +		data->pipe_id = p;
> +		for (i = 0; i < data->port_count; i++) {
> +			if (strcmp(data->output->name,
> +				   chamelium_port_get_name(data->ports[i])) == 0)
> +				return i;
> +		}
> +	}
> +
> +	return -1;
> +}
> +
> +static void test_sharpness_filter(data_t *data,  enum pipe p)
> +{
> +	int port_idx = test_setup(data, p);
> +
> +	igt_require(port_idx >= 0);
> +	igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], IGT_CRTC_SHARPNESS_STRENGTH));
> +
> +	if (!pipe_output_combo_valid(data, p))
> +		return;
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), data->output->name)
> +		igt_assert_f((test_t(data, data->primary, data->ports[port_idx]) == 1), "No sharpness observed.\n");
> +}
> +
> +static void
> +run_sharpness_filter_test(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	enum pipe pipe;
> +
> +	igt_describe("Verify basic content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-basic") {
> +		for_each_pipe(display, pipe) {
> +			data->filter_strength = MID_FILTER_STRENGTH;
> +			test_sharpness_filter(data, pipe);
> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_require(data.display.is_atomic);
> +
> +		igt_chamelium_allow_fsm_handling = false;
> +
> +		/* we need to initalize chamelium after igt_display_require */
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
> +		igt_require(data.chamelium);
> +
> +		data.ports = chamelium_get_ports(data.chamelium,
> +						 &data.port_count);
> +
> +		if (!data.port_count)
> +			igt_skip("No ports connected\n");
> +		/*
> +		 * We don't cause any harm by plugging
> +		 * discovered ports, just incase they are not plugged
> +		 * we currently skip in test_setup
> +		 */
> +		for(int i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
> +
> +		kmstest_set_vt_graphics_mode();
> +	}
> +
> +	run_sharpness_filter_test(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index aac3b4e10..09f7ed24b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -345,6 +345,7 @@ chamelium_progs = [
>   	'kms_chamelium_edid',
>   	'kms_chamelium_frames',
>   	'kms_chamelium_hpd',
> +	'kms_chamelium_sharpness_filter',
>   ]
>   
>   test_deps = [ igt_deps ]
> @@ -370,6 +371,7 @@ extra_sources = {
>   	'kms_chamelium_edid': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
> +	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
>              join_paths ('intel', 'kms_mst_helper.c'),
>              join_paths ('intel', 'kms_dsc_helper.c') ],
