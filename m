Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8F2C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 19:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E63A10E0BD;
	Mon,  1 Jul 2024 19:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nX2CNltT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC4210E0BD
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 19:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719863573; x=1751399573;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5df07K83bxP/cHoT1LBcYehALA6gb3Y0rvyRxzIaizU=;
 b=nX2CNltTC4nPLarG6gXPpiJ+6m8CPb6CqSzSI0mAaRuhVFeYki8NPicj
 UHLLwC6NgjoFKJQuxK4KlSCSlgOWg0jtYE4VDPy/pkRYgqPSi2umQuKQC
 NAQD+X4XBc8nk1F6yG2pcHDl1Zn0coPP4PEsvLY+zgaxhE++i1yaHEPZq
 2oPtOef68yttGxC8hAVcfG60zv6dZ0XCEX5pEwG2Lw5sFt/UldimqmskJ
 2f6VBABYduJUUtDoMcbn0x8WxGWo2UhCwXjts/HAk2+5GrztuwenJ13ap
 bt3GiGsmxn3Ow4t8MrPhDFTewBSBcErrq2BRtbVOaDbf9sFAhgoOHac7Y w==;
X-CSE-ConnectionGUID: iIGTAzTqQpiDOEKg5MekIg==
X-CSE-MsgGUID: 6SVbAGBNT+mBOCbVpgVu8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34460078"
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="34460078"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 12:52:52 -0700
X-CSE-ConnectionGUID: VdtLlCsdRKakBbpA7K7HxQ==
X-CSE-MsgGUID: M492iBKkRqifuyH1CxVzvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,177,1716274800"; d="scan'208";a="45440920"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 12:52:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:52:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 12:52:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 12:52:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 12:52:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eb0Gcfz7w7hn3/pZfso5g7HUO6LFs8tenv100YqZSLhKKdoi0KKTKs/I1+U8g/uTCx0LYNGtNfFBT80P3MVfP1gmTK29hClKhtgmYgptkkMJ8qdKWo5ydexzVESGMJ0BtN0lSCvBWKjU7RabwJkRkONAFreWFyEuCj0FtXrtEGY+kNA7MnUlb2A49Pyr6e9BCUBe8CZTPdUW9Ml+t7ZPC4nTgkHrE0cAFwtVbtM1p+INpNDrI495PZAsIISSHRwX0/4Vx9jjMhptuCBfI/cRDIY+PuC5A6lTXSmOKmrDab0Wxh7oIv+VIXUumznumew0bvI+VDEL86ElCA/hs8rgFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Hp8K6AZB0l/c0QU+iNnaRz95Zh8sZhvjNhcoxJlhBQ=;
 b=HwrSCDxztpcNGZ7d4RXYLZRq+bgoJDsBYH7B6lr3B7vAlp9Srk8uE3WWs5sbtZMicEv8z2zTntGWHgaWxTm/bLgG4Q4vWI6LilUQjoDxQ4X6v/fmvcdJloC9XnOFD07zgshO6DcFiHWyJ2KnFN6nezgKV9v8lJG+9Bcx1wCKURqMaMEUV2Kr9imDHIi+Y8cQ4v99lviGFT4uq6eLdZmRYNb2MgZYMALV54i4dLuaPftr2bJKozJmkqIRaZP50HuKUsOHjZhR/g2vPWN1LhHcNZVbERDjoNwTjB6ImNKTiXm9UIG/L0dQ2k20vWOThqHGDCG7L+NjqEKK2by1fMFIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB8541.namprd11.prod.outlook.com (2603:10b6:806:3a9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 19:52:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 19:52:40 +0000
Date: Mon, 1 Jul 2024 12:52:38 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 01/14] lib/xe/oa: Add PVC support
Message-ID: <ZoMJBufP80Iwguib@orsosgc001>
References: <20240701025309.2416653-1-ashutosh.dixit@intel.com>
 <20240701025309.2416653-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240701025309.2416653-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0211.namprd04.prod.outlook.com
 (2603:10b6:303:87::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB8541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d730eeb-874a-4a1b-5031-08dc9a075d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWk0NDZFUU43bTdQR3dkem55b2RvUGxsQndEWlgxWk5pcHdsRW45eDdCTm1L?=
 =?utf-8?B?NkNMUnRKUGtBK2hPRnVvc2RDNENHMXR4MHVwRmwvQ1VqSEwwdStZZlkrVkJG?=
 =?utf-8?B?S21jamVya0tJOWpRbWczbkxBWDhmZkcwcXFhS1l1ZXZEdVR2L0FCMWgzZExz?=
 =?utf-8?B?VktXMEhEdEdsbXJYN25vbFRkOWZtQTZ2YmFhS2F0SStZdW4vYjRZNy9IbUJ1?=
 =?utf-8?B?S2dDMjBhSzNzZ2FKL1ZxZGd4aFlQeEUxV2k5cngrZ1hHSi9SbGtVaWZCMDNS?=
 =?utf-8?B?VS9DR2lpVGdaMnppNW1YaFhiYTBWTmQ0eERnZFVaTmQrZzlqVHRjNEMyZkZ2?=
 =?utf-8?B?Vko1N09XaWlzNysvaUJWUHN5SVJ0SGhOOUMrQjUyZElUc1FLY2pZaERTNFdS?=
 =?utf-8?B?NCticmJLUC9iNHJmN1BKSlB5elpab2xNcjlWRVBSVDN3WE1CZDZxc01FZTBo?=
 =?utf-8?B?R0RGWS80SytWbk5HbVdYYlQ3L1BQVDZ2cWpnOEVodmVQUWlPaDM1cytreW43?=
 =?utf-8?B?Q1pvSXZZdHh4Rno5Y1ZVNUVqQlU5VFI2OFRnU1ArSTJoaU1TL1U5cHFSKzRH?=
 =?utf-8?B?TGJ2VDBwVEQ4Q3BLdC9ENHZ3NTB3OEN3RVZOS3Z2RWU1SUUrbnBlZ0VTNDl1?=
 =?utf-8?B?VU42dkwxOHJLeUU0K1FrM2RCV2laM1BLNkZDNmU1OXQxdVROT0Q3WVlLcUFW?=
 =?utf-8?B?emtNKzJPaGp2QTgwWUUxS05UL2w2a0tpSFdCeWRoVG9uUHVoSDBOUHNRNnNI?=
 =?utf-8?B?NWQyMnRSdlBOU3crQnV1NVNPL1kxVWhPNElLRE52NmtSaHQ0alpoUEk2VlJV?=
 =?utf-8?B?SnJGSjVGcC9sM2pIdlFVSm1WS2hQdlJJam4wU25scUc4MkpKdnVYMFArR1FV?=
 =?utf-8?B?T0VLdzB1TThuVVl5MjVRS0FiYmFselZnYmdpU1NuWGI1QnlrVWZHbnB3ZHJv?=
 =?utf-8?B?ME40dTNza1pDUm1OeFVEV3pXQmk1MjNjQnRSNHdJUU9lbXUxQ2RJSk5ZTk1w?=
 =?utf-8?B?ZGtiYlV0TFdWa1lWc084KzYyZ1h1NGp5R0dQMkRmWDNKR0xwclZ3T0ZLcEYz?=
 =?utf-8?B?VVEzK1luNWlVUWVReUNUUzVvQjY3eDlTSHNDSkFIeTc4K1NjOGpvb01DMDdl?=
 =?utf-8?B?WmFESWlnRkZrMTJYRWJ5Y01wbjI2WktDbHZ0cTJCY1Bwek92U1ZSbmhaMXg5?=
 =?utf-8?B?Z1A0cDRnSTIyY1dUMzN0Q0kxQW1lQS9TUm5HSVd6RmJFRDg4M0NPMVFOZ1JK?=
 =?utf-8?B?eUUxYVhEbFMyUy92WWcyRjBJak0zR09mQ203Qjd2NDhJc2dkRGJKSGhLNXUw?=
 =?utf-8?B?bVVOQkdCMFNoV0Z6dHdRSXh0UXVjbHcxWUg0V1VNUXhQWUIvTUFkWEprcVlr?=
 =?utf-8?B?T2tZeXhMTkExSnZ2QXAxWGxVQTYxQThkdHVRWDMwYW82WjhKRkUxSDc4dWtZ?=
 =?utf-8?B?dUtxNGlMV0JOQXNsdjBTRU0yNkI3aTEyZjhEaWtZRzFiVWJLMnhoVnhYdGNX?=
 =?utf-8?B?NW9CK1QvZ291VjNHS3FCb1NZekVsOEtwbGRxNU1xeS8vdHFNUUF2SXdXMXh5?=
 =?utf-8?B?NzBzR3BlRzk4OHd6cDU1UXpqVjBuWUc0Qjh5Y2dIUExHQkprblBYSGRVcDBa?=
 =?utf-8?B?U2tkeTcvQ3RBOFA0SFo2dnZRcUZoVHJkZkJ6dUxJd2hGUDc2dXliMTB1bGNF?=
 =?utf-8?B?YWhLMlZLQVhySkt4d2l3M0dPc0NlVWJvM1N2WTBkc3NJNmoyeGt5eGg5R2hq?=
 =?utf-8?B?RHYvZGxIbGxtZDY4M1pmVVhPWWZucnpmZmFIU2J4aHd4YVdvVW80a29aVlp1?=
 =?utf-8?B?d09MN2o1Zi9pOTZqb1M1QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXFKZmw1aEMvVy9LZGNKekIwWVNVS28wRlZUS0duWlEzRmV5dmlUQ3lCNWp6?=
 =?utf-8?B?UGpJalF0TTFFb01NektZRXpuYk45V2xUaHBCYmNWU2xrTFltN0lIZjUrVWtC?=
 =?utf-8?B?WVBMdzlRVmdpQlRtdzFFQUlNcEdIZ3lrNnR4UitKcDFleXVFL3pyZGRIdXE4?=
 =?utf-8?B?dTNvL3JpZWZuejJPOFMyaFZDbTA0R3dua2g2N0l2N3N2V3R1aDl2K2FEVWU4?=
 =?utf-8?B?S0NwU1VjemkvNU9sMklaUTVuNXc2SW1jMUVQT2FHRzJ4QUVBanY1SzBsTWxm?=
 =?utf-8?B?YzF4M2t6NXc3WFNjeWdvdFgzTnVFWEQyNmJKNlZmMkVHZms1bUV6dmd4eXpj?=
 =?utf-8?B?OGxkRnk3blBsMHIxai9LRk1Rc3lCN3U5OElkcC9IeUxDZXdvbVZsbWlydGRT?=
 =?utf-8?B?S085cXc5UFdMejlHeFh3akpGRmx0VnB3TDdPYk5LV2JNaWlVbWpESHQ3T1VH?=
 =?utf-8?B?VnhxU1hzanhyVlQxWTNIQmNCMzJrZzhRVC9HSXgwbGV6M0dma0NkcVRDWXdY?=
 =?utf-8?B?UW1hVTg5N1JCbWFXU2gydEgrZTYzb0Q5YWU2R3dJVzBLU1NLbEkwanB6ZDJs?=
 =?utf-8?B?Q0xhMFlzOGU0aTFNeFV1bjNrSnRBS2x4VFJyUndqRnRDVnhROVZjNTBiZkVP?=
 =?utf-8?B?REVLYjFMSGEvR3NpbCtMVUtOY29FQ2I0bXRhZldKY1luMHlVanY3TFJPWHU5?=
 =?utf-8?B?Zm5mR2FBaW8zeEI4VWtzSWR3TnRoQ0JBbEFaMjl2NmIvVUpNVFBjYlZzMnZw?=
 =?utf-8?B?NzJNN0g2bXY2MkhGNUx2LzFLR2hrajF6WHdlZGN3V0sxYUtwM1JCMVlqQWZu?=
 =?utf-8?B?M3g4bDFzTDZNWmxuU21sbTc0RFRHRTFnbnBxclAxandlZUJJWkFQdm9rdW9h?=
 =?utf-8?B?eDdzL25RZ1ZjZlJjYUdtMkVDMDEwdTRuTVZxSzNRY0xZU1kxWWE3T3dsS1VP?=
 =?utf-8?B?MUdmL2tFKzJvaWFlbkNLSlUvQS91VXRnNmFRUnJHQU1NZU1LNnRpVDgreWZz?=
 =?utf-8?B?UENSb1d6Wnl3ZnVyeHpZYXNDQi82cDFRRVpwOE5BL3Nvc01PNTU2amNwVkUy?=
 =?utf-8?B?OVJrN2lCOVVaRWFnMlFWdUdOd3NpTUQrY3FXYkFXWGtRd1A1OGJYb1NxN0RT?=
 =?utf-8?B?NVR1Z0pGMzlNa0FSNnRSSDYrVzBza3FvQWxxYVpOUnRqS2ZvbGtLcHJTWVFE?=
 =?utf-8?B?aUtzVXIyd0V5WmU5bVNxdUNvbElkcmI5V3VZaVNoOEc3b25wK0dzZUNxNzRD?=
 =?utf-8?B?cEFCRWVwaW9JSEVJNHZMakhmN3J3cnJVTXlhZ1hmRTRtNHU1akdabW4wQjZs?=
 =?utf-8?B?eFFxNzFJOHJVS3p5S3RISXFoZGtYMk0xVVVSTjFIUjlYdmFZUmdjY2l5b0k4?=
 =?utf-8?B?VzZsM3ZZQVRrTzE0cTZtUWJreWorOG5RTEszd3ZnTkRuVy9Od21GNUIzUG9q?=
 =?utf-8?B?RkpMV1QzWVNhcEk1ZFJtK2Y5ZHlQQTVVbGJPOUNldHBNUDhjWG5RT2lUdVo1?=
 =?utf-8?B?NmsybGVVQnV6MWpON2dDM2xFbTI5QXUyVG9sSG9NUy9kcE0zWGpJcU95bFN6?=
 =?utf-8?B?NW9BbWVYUUZIREQzcnJhdlBRMEFlcVEzNlB1SUQyc1R6b0Iyb25RQlVMeVBF?=
 =?utf-8?B?eUJIbnM2WklqazJrTU5rb0FFRzJ6cDBCY2MrY3p0cnRWRWcxcEZlT0IrN00w?=
 =?utf-8?B?NVBmSncxZmxlcU94TW0wUHVzOFlWTksrRFRsYThPNDFCamZqNUthSWoxc3pk?=
 =?utf-8?B?S1d3aEVNMndDZUFBL2EzSmdEVys4bnhZaVJ5K2xXVkh6R2prUGRqaXhsL1k2?=
 =?utf-8?B?VjZVeWs5NlFQcFkvTTh4d1lYcEpsamh5UHg0U2tCTnRUR1lHVzlYOHRmbXhR?=
 =?utf-8?B?WS9vQ1V3bUx2WGhqd3dVcjdyVUpHWStPM2NpTjg3bXg1YVc1WitlWWtwZWUz?=
 =?utf-8?B?TkgveFBFU2N4M3BXNVRwRUd0MEwwYzNaY1U3U3JkdVFtK2dTV1hvNU5ia1lI?=
 =?utf-8?B?VS9ZVFhLeWpHeDNTcmtLMFRMMzNiVFBNdkVqbmFFaWYwU3c5WHpSc0R3K0lw?=
 =?utf-8?B?U0FCNmZTcEtVeEExOVZlQ2FzT1NVVWh3TGRVcjVJdjhmSFFKQTIweHZTdzVE?=
 =?utf-8?B?V1l0WllPTUZTdUZpWUg3eXdFdlBXTUZsNlYvaldFbXNNVm11L09KdWZGWVpI?=
 =?utf-8?Q?qTpD08ydvddwGYvBO7yhotQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d730eeb-874a-4a1b-5031-08dc9a075d50
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 19:52:40.2334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 47PX8gpS+4nbZYxm2Q1ZfLHss6Nq1kKOGHMwarUy93rsJyyoPEVhHughtteK0ppMQPXbqFLcBb+n1anHLUe0GYUC6iTC6DejFjLn4gW6/VI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8541
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

On Sun, Jun 30, 2024 at 07:52:56PM -0700, Ashutosh Dixit wrote:
>Add oa-pvc.xml and enable support for PVC.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/meson.build              |    5 +-
> lib/xe/oa-configs/oa-pvc.xml | 1018 ++++++++++++++++++++++++++++++++++
> lib/xe/xe_oa.c               |    4 +
> 3 files changed, 1024 insertions(+), 3 deletions(-)
> create mode 100644 lib/xe/oa-configs/oa-pvc.xml
>
>diff --git a/lib/meson.build b/lib/meson.build
>index 4d51402163..c70ca89602 100644
>--- a/lib/meson.build
>+++ b/lib/meson.build
>@@ -385,10 +385,9 @@ xe_oa_files = [
>
> xe_oa_hardware = [
>   'tglgt1', 'tglgt2',
>-  'dg1',
>-  'rkl',
>-  'adl',
>+  'dg1', 'rkl', 'adl',
>   'acmgt1', 'acmgt2', 'acmgt3',
>+  'pvc',
>   'mtlgt2', 'mtlgt3',
>   'lnl',
> ]
>diff --git a/lib/xe/oa-configs/oa-pvc.xml b/lib/xe/oa-configs/oa-pvc.xml
>new file mode 100644
>index 0000000000..9d212e65ad
>--- /dev/null
>+++ b/lib/xe/oa-configs/oa-pvc.xml
>@@ -0,0 +1,1018 @@
>+<?xml version="1.0"?>
>+<metrics version="1619079818" merge_md5="">
>+  <set name="Compute Metrics Basic"
>+       chipset="PVC"
>+       symbol_name="ComputeBasic"
>+       underscore_name="compute_basic"
>+       mdapi_supported_apis="VK OGL OCL IO"
>+       hw_config_guid="8d637649-e8f5-4f80-83a4-6575b05d52d8"
>+       >
>+    <counter name="GPU Time Elapsed"
>+             symbol_name="GpuTime"
>+             underscore_name="gpu_time"
>+             description="Time elapsed on the GPU during the measurement."
>+             data_type="uint64"
>+             units="ns"
>+             semantic_type="duration"
>+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU Core Clocks"
>+             symbol_name="GpuCoreClocks"
>+             underscore_name="gpu_core_clocks"
>+             description="The total number of GPU core clocks elapsed during the measurement."
>+             data_type="uint64"
>+             units="cycles"
>+             semantic_type="event"
>+             equation="GPU_CLOCK 0 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="AVG GPU Core Frequency"
>+             symbol_name="AvgGpuCoreFrequency"
>+             underscore_name="avg_gpu_core_frequency"
>+             description="Average GPU Core Frequency in the measurement."
>+             data_type="uint64"
>+             max_equation="$GpuMaxFrequency"
>+             units="hz"
>+             semantic_type="event"
>+             equation="$GpuCoreClocks 1000000000 UMUL $GpuTime UDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU Busy"
>+             symbol_name="GpuBusy"
>+             underscore_name="gpu_busy"
>+             description="The percentage of time in which the GPU has been processing GPU commands."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Overview System Frame"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="CS Threads Dispatched"
>+             symbol_name="CsThreads"
>+             underscore_name="cs_threads"
>+             description="The total number of compute shader hardware threads dispatched."
>+             data_type="uint64"
>+             units="threads"
>+             semantic_type="event"
>+             equation="A 4 READ"
>+             mdapi_group="EU Array/Compute Shader"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="Shader Memory Accesses"
>+             symbol_name="ShaderMemoryAccesses"
>+             underscore_name="shader_memory_accesses"
>+             description="The total number of shader memory accesses to L3."
>+             data_type="uint64"
>+             units="messages"
>+             semantic_type="event"
>+             equation="A 32 READ"
>+             mdapi_group="L3/Data Port"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="Shader Atomic Memory Accesses"
>+             symbol_name="ShaderAtomics"
>+             underscore_name="shader_atomics"
>+             description="The total number of shader atomic memory accesses."
>+             data_type="uint64"
>+             units="messages"
>+             semantic_type="event"
>+             equation="A 34 READ"
>+             mdapi_group="L3/Data Port/Atomics"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="Shader Barrier Messages"
>+             symbol_name="ShaderBarriers"
>+             underscore_name="shader_barriers"
>+             description="The total number of shader barrier messages."
>+             data_type="uint64"
>+             units="messages"
>+             semantic_type="event"
>+             equation="A 35 READ"
>+             mdapi_group="EU Array/Barrier"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SLM Reads"
>+             symbol_name="SlmReads"
>+             underscore_name="slm_reads"
>+             description="The total number of reads from shared local memory."
>+             data_type="uint64"
>+             max_equation="$GpuCoreClocks $EuSubslicesTotalCount UMUL"
>+             units="events"
>+             semantic_type="event"
>+             equation="A 30 READ"
>+             mdapi_group="L3/Data Port/SLM"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SLM Writes"
>+             symbol_name="SlmWrites"
>+             underscore_name="slm_writes"
>+             description="The total number of writes to shared local memory."
>+             data_type="uint64"
>+             max_equation="$GpuCoreClocks $EuSubslicesTotalCount UMUL"
>+             units="events"
>+             semantic_type="event"
>+             equation="A 31 READ"
>+             mdapi_group="L3/Data Port/SLM"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GTI Read Throughput"
>+             symbol_name="GtiReadThroughput"
>+             underscore_name="gti_read_throughput"
>+             description="The total number of GPU memory bytes read from GTI."
>+             data_type="uint64"
>+             max_equation="$GpuCoreClocks 64 UMUL"
>+             units="bytes"
>+             semantic_type="throughput"
>+             equation="128  A 36 READ UMUL"
>+             mdapi_group="GTI"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GTI Write Throughput"
>+             symbol_name="GtiWriteThroughput"
>+             underscore_name="gti_write_throughput"
>+             description="The total number of GPU memory bytes written to GTI."
>+             data_type="uint64"
>+             max_equation="$GpuCoreClocks 64 UMUL"
>+             units="bytes"
>+             semantic_type="throughput"
>+             equation="128  A 37 READ UMUL"
>+             mdapi_group="GTI"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU Active"
>+             symbol_name="EU_ACTIVE_CYCLES"
>+             underscore_name="eu_active_cycles"
>+             description="The percentage of time in which the Execution Units were actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU Stall"
>+             symbol_name="EU_STALL_CYCLES"
>+             underscore_name="eu_stall_cycles"
>+             description="The percentage of time in which the Execution Units were stalled."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU FPU Pipe Active"
>+             symbol_name="EU_INST_EXECUTED_ALU0_ALL"
>+             underscore_name="eu_inst_executed_alu0_all"
>+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EM Pipe Active"
>+             symbol_name="EU_INST_EXECUTED_ALU1_ALL"
>+             underscore_name="eu_inst_executed_alu1_all"
>+             description="The percentage of time in which EU EM INT pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 10 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SYS Pipe Active"
>+             symbol_name="EU_INST_EXECUTED_SYSTOLIC_ALL"
>+             underscore_name="eu_inst_executed_systolic_all"
>+             description="The percentage of time in which EU SYS pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="Send Pipe Active"
>+             symbol_name="EU_INST_EXECUTED_SEND_ALL"
>+             underscore_name="eu_inst_executed_send_all"
>+             description="The percentage of time in which EU send pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EM JEU Instruction"
>+             symbol_name="EU_INST_EXECUTED_CONTROL_ALL"
>+             underscore_name="eu_inst_executed_control_all"
>+             description="The percentage of time in which JEU instruction were processed actively on EM INT pipeline."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EM And FPU Pipes Active"
>+             symbol_name="EU_PIPE_ALU0_AND_ALU1_ACTIVE_CYCLES"
>+             underscore_name="eu_pipe_alu0_and_alu1_active_cycles"
>+             description="The percentage of time in which EU EM INT and FPU INT64 pipelines were actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 15 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SYS And FPU Pipes Active"
>+             symbol_name="EU_PIPE_ALU0_AND_SYSTOLIC_ACTIVE_CYCLES"
>+             underscore_name="eu_pipe_alu0_and_systolic_active_cycles"
>+             description="The percentage of time in which EU Systolic and FPU INT64 pipelines were actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU Thread Occupancy"
>+             symbol_name="EU_THREADS_OCCUPANCY_ALL"
>+             underscore_name="eu_threads_occupancy_all"
>+             description="The percentage of time in which hardware threads occupied EUs."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="8 A 16 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SYSMEM_TRANSACTION_READ"
>+             symbol_name="SYSMEM_TRANSACTION_READ"
>+             underscore_name="sysmem_transaction_read"
>+             description="The number of system memory reads (upstream)"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 7 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SYSMEM_TRANSACTION_WRITE"
>+             symbol_name="SYSMEM_TRANSACTION_WRITE"
>+             underscore_name="sysmem_transaction_write"
>+             description="The number of system memory writes  (upstream)"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 6 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="HOST_TO_GPUMEM_TRANSACTION_READ"
>+             symbol_name="HOST_TO_GPUMEM_TRANSACTION_READ"
>+             underscore_name="host_to_gpumem_transaction_read"
>+             description="Host reads to GPU local (HBM) memory (downstream)"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 5 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="HOST_TO_GPUMEM_TRANSACTION_WRITE"
>+             symbol_name="HOST_TO_GPUMEM_TRANSACTION_WRITE"
>+             underscore_name="host_to_gpumem_transaction_write"
>+             description="Host writes to GPU local (HBM) memory (downstream)"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 4 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI0"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI0"
>+             underscore_name="gpu_memory_request_queue_full_sqidi0"
>+             description="The The percentage of time in which SQ 0 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI1"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI1"
>+             underscore_name="gpu_memory_request_queue_full_sqidi1"
>+             description="The The percentage of time in which SQ 1 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="C 2 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI2"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI2"
>+             underscore_name="gpu_memory_request_queue_full_sqidi2"
>+             description="The The percentage of time in which SQ 2 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="C 1 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI3"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI3"
>+             underscore_name="gpu_memory_request_queue_full_sqidi3"
>+             description="The The percentage of time in which SQ 3 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="C 0 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI4"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI4"
>+             underscore_name="gpu_memory_request_queue_full_sqidi4"
>+             description="The The percentage of time in which SQ 4 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="B 7 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI8"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI8"
>+             underscore_name="gpu_memory_request_queue_full_sqidi8"
>+             description="The The percentage of time in which SQ 8 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU_MEMORY_REQUEST_QUEUE_FULL _SQIDI12"
>+             symbol_name="GPU_MEMORY_REQUEST_QUEUE_FULL_SQIDI12"
>+             underscore_name="gpu_memory_request_queue_full_sqidi12"
>+             description="The The percentage of time in which SQ 12 is filled above a threshold (usually 48 entries)"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <register_config type="NOA">
>+        <register type="NOA" address="0x00000D04" value="0x00000200" />
>+        <register type="NOA" address="0x00009884" value="0x0000000C" />
>+        <register type="NOA" address="0x00009888" value="0x14307FC0" />
>+        <register type="NOA" address="0x00009888" value="0x04306000" />
>+        <register type="NOA" address="0x00009888" value="0x14003400" />
>+        <register type="NOA" address="0x00009888" value="0x14013400" />
>+        <register type="NOA" address="0x00009888" value="0x14023400" />
>+        <register type="NOA" address="0x00009888" value="0x14033400" />
>+        <register type="NOA" address="0x00009888" value="0x14083400" />
>+        <register type="NOA" address="0x00009888" value="0x140C3400" />
>+        <register type="NOA" address="0x00009888" value="0x14043400" />
>+        <register type="NOA" address="0x00009888" value="0x1A100090" />
>+        <register type="NOA" address="0x00009888" value="0x1A110009" />
>+        <register type="NOA" address="0x00009888" value="0x00142000" />
>+        <register type="NOA" address="0x00009888" value="0x0050FFE0" />
>+        <register type="NOA" address="0x00009888" value="0x00300240" />
>+        <register type="NOA" address="0x00009888" value="0x0E300695" />
>+        <register type="NOA" address="0x00009888" value="0x10300824" />
>+        <register type="NOA" address="0x00009888" value="0x02300000" />
>+        <register type="NOA" address="0x00009888" value="0x00000002" />
>+        <register type="NOA" address="0x00009888" value="0x0E000080" />
>+        <register type="NOA" address="0x00009888" value="0x04000000" />
>+        <register type="NOA" address="0x00009888" value="0x00010002" />
>+        <register type="NOA" address="0x00009888" value="0x0E010002" />
>+        <register type="NOA" address="0x00009888" value="0x04010000" />
>+        <register type="NOA" address="0x00009888" value="0x00020002" />
>+        <register type="NOA" address="0x00009888" value="0x0C020080" />
>+        <register type="NOA" address="0x00009888" value="0x04020000" />
>+        <register type="NOA" address="0x00009888" value="0x00030002" />
>+        <register type="NOA" address="0x00009888" value="0x0C030002" />
>+        <register type="NOA" address="0x00009888" value="0x04030000" />
>+        <register type="NOA" address="0x00009888" value="0x00080002" />
>+        <register type="NOA" address="0x00009888" value="0x0A080002" />
>+        <register type="NOA" address="0x00009888" value="0x04080000" />
>+        <register type="NOA" address="0x00009888" value="0x00128000" />
>+        <register type="NOA" address="0x00009888" value="0x00160800" />
>+        <register type="NOA" address="0x00009888" value="0x000C0002" />
>+        <register type="NOA" address="0x00009888" value="0x080C0080" />
>+        <register type="NOA" address="0x00009888" value="0x040C0000" />
>+        <register type="NOA" address="0x00009888" value="0x00040002" />
>+        <register type="NOA" address="0x00009888" value="0x0A040080" />
>+        <register type="NOA" address="0x00009888" value="0x04040000" />
>+        <register type="NOA" address="0x00009888" value="0x2C500000" />
>+        <register type="NOA" address="0x00009888" value="0x2E500400" />
>+        <register type="NOA" address="0x00009888" value="0x30500000" />
>+        <register type="NOA" address="0x00009888" value="0x18500000" />
>+        <register type="NOA" address="0x00009888" value="0x32500A05" />
>+        <register type="NOA" address="0x00009888" value="0x20500030" />
>+        <register type="NOA" address="0x00009888" value="0x22500603" />
>+        <register type="NOA" address="0x00009888" value="0x24500030" />
>+        <register type="NOA" address="0x00009888" value="0x26500603" />
>+        <register type="NOA" address="0x00009884" value="0x00000008" />
>+        <register type="NOA" address="0x00009888" value="0x01404400" />
>+        <register type="NOA" address="0x00009888" value="0x01414400" />
>+        <register type="NOA" address="0x00009888" value="0x030755A0" />
>+        <register type="NOA" address="0x00009888" value="0x0308AA00" />
>+        <register type="NOA" address="0x00009888" value="0x01000040" />
>+        <register type="NOA" address="0x00009888" value="0x01010040" />
>+        <register type="NOA" address="0x00009888" value="0x01021000" />
>+        <register type="NOA" address="0x00009888" value="0x01036400" />
>+        <register type="NOA" address="0x00009888" value="0x0104A800" />
>+        <register type="NOA" address="0x00009888" value="0x03045555" />
>+        <register type="NOA" address="0x00009888" value="0x0305555A" />
>+        <register type="NOA" address="0x00009888" value="0x0106FC00" />
>+        <register type="NOA" address="0x00009888" value="0x01190400" />
>+        <register type="NOA" address="0x00009888" value="0x011B0400" />
>+        <register type="NOA" address="0x00009888" value="0x011C4800" />
>+        <register type="NOA" address="0x00009888" value="0x011E4000" />
>+        <register type="NOA" address="0x00009888" value="0x01108000" />
>+    </register_config>
>+    <register_config type="OA">
>+        <register type="OA" address="0x0000D920" value="0x00000000" />
>+        <register type="OA" address="0x0000D900" value="0x00000000" />
>+        <register type="OA" address="0x0000D904" value="0x00800000" />
>+        <register type="OA" address="0x0000D910" value="0x00000000" />
>+        <register type="OA" address="0x0000D914" value="0x00800000" />
>+        <register type="OA" address="0x0000DC40" value="0x00000000" />
>+        <register type="OA" address="0x00002B2C" value="0x00000000" />
>+    </register_config>
>+    <register_config type="FLEX">
>+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
>+        <register type="FLEX" address="0x0000E558" value="0x00001000" />
>+        <register type="FLEX" address="0x0000E658" value="0x00001002" />
>+        <register type="FLEX" address="0x0000E758" value="0x0000A009" />
>+        <register type="FLEX" address="0x0000E45C" value="0x00008003" />
>+    </register_config>
>+  </set>
>+
>+  <set name="TestOa"
>+       chipset="PVC"
>+       symbol_name="TestOa"
>+       underscore_name="test_oa"
>+       mdapi_supported_apis="VK OGL OCL IO"
>+       hw_config_guid="339a376a-4696-4e0d-812a-5fd13b0e1aa8"
>+       >
>+    <counter name="GPU Time Elapsed"
>+             symbol_name="GpuTime"
>+             underscore_name="gpu_time"
>+             description="Time elapsed on the GPU during the measurement."
>+             data_type="uint64"
>+             units="ns"
>+             semantic_type="duration"
>+             equation="GPU_TIME 0 READ 1000000000 UMUL $GpuTimestampFrequency UDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU Core Clocks"
>+             symbol_name="GpuCoreClocks"
>+             underscore_name="gpu_core_clocks"
>+             description="The total number of GPU core clocks elapsed during the measurement."
>+             data_type="uint64"
>+             units="cycles"
>+             semantic_type="event"
>+             equation="GPU_CLOCK 0 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="TestCounter0"
>+             symbol_name="Counter0"
>+             underscore_name="counter0"
>+             description="HW test counter 0. Factor: 0.0"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="B 0 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="TestCounter1"
>+             symbol_name="Counter1"
>+             underscore_name="counter1"
>+             description="HW test counter 1. Factor: 1.0"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="B 1 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="TestCounter3"
>+             symbol_name="Counter3"
>+             underscore_name="counter3"
>+             description="HW test counter 3. Factor: 0.5"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="B 2 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="TestCounter4"
>+             symbol_name="Counter4"
>+             underscore_name="counter4"
>+             description="HW test counter 4. Factor: 0.3333"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="B 3 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="TestCounter5"
>+             symbol_name="Counter5"
>+             underscore_name="counter5"
>+             description="HW test counter 5. Factor: 0.3333"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="B 4 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="TestCounter8"
>+             symbol_name="Counter8"
>+             underscore_name="counter8"
>+             description="HW test counter 8. Should be equal to 1 in IOStream or in OAG query mode"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 7 READ"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="L3_BANK_INPUT_AVAILABLE _L3BANK0"
>+             symbol_name="L3_BANK_INPUT_AVAILABLE_L3BANK0"
>+             underscore_name="l3_bank_input_available_l3_bank0"
>+             description="The percentage of time in which l3 bank 0 input is available"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="C 6 READ 100 UMUL $GpuCoreClocks FDIV"
>+             availability="1"
>+             mdapi_group="GTI/L3"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="subslice_bank"
>+             />
>+    <counter name="L3_OUTPUT_READY _L3BANK0"
>+             symbol_name="L3_OUTPUT_READY_L3BANK0"
>+             underscore_name="l3_output_ready_l3_bank0"
>+             description="The percentage of time in which l3 bank 0 output is ready"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="C 3 READ 100 UMUL $GpuCoreClocks FDIV"
>+             availability="1"
>+             mdapi_group="GTI/L3"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="subslice_bank"
>+             />
>+    <counter name="L3_READ _L3BANK0"
>+             symbol_name="L3_READ_L3BANK0"
>+             underscore_name="l3_read_l3_bank0"
>+             description="The number of L3 bank 0 read requests"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 5 READ"
>+             availability="1"
>+             mdapi_group="GTI/L3"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="subslice_bank"
>+             />
>+    <counter name="L3_WRITE _L3BANK0"
>+             symbol_name="L3_WRITE_L3BANK0"
>+             underscore_name="l3_write_l3_bank0"
>+             description="The number of L3 Bank 0 write requests"
>+             data_type="uint64"
>+             units="events"
>+             semantic_type="event"
>+             equation="C 4 READ"
>+             availability="1"
>+             mdapi_group="GTI/L3"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="subslice_bank"
>+             />
>+    <counter name="THREADGROUP_DISPATCH_QUEUE0_ACTIVE_CYCLES _DUALSUBSLICE0"
>+             symbol_name="THREADGROUP_DISPATCH_QUEUE0_ACTIVE_CYCLES_DUALSUBSLICE0"
>+             underscore_name="threadgroup_dispatch_queue0_active_cycles_dualsubslice0"
>+             description="The percentage of time in which non-PS thread is ready for dispatch in thread dispatcher 0 queue 0"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="B 5 READ 100 UMUL $GpuCoreClocks FDIV"
>+             availability="$DualSubsliceMask 1 AND"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="dualsubslice"
>+             />
>+    <counter name="THREADGROUP_DISPATCH_QUEUE1_ACTIVE_CYCLES _DUALSUBSLICE0"
>+             symbol_name="THREADGROUP_DISPATCH_QUEUE1_ACTIVE_CYCLES_DUALSUBSLICE0"
>+             underscore_name="threadgroup_dispatch_queue1_active_cycles_dualsubslice0"
>+             description="The percentage of time in which non-PS thread is ready for dispatch in thread dispatcher 0 queue 1"
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="B 6 READ 100 UMUL $GpuCoreClocks FDIV"
>+             availability="$DualSubsliceMask 1 AND"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="dualsubslice"
>+             />
>+    <counter name="EU Active"
>+             symbol_name="EuActive"
>+             underscore_name="eu_active"
>+             description="The percentage of time in which the Execution Units were actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 7 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU Stall"
>+             symbol_name="EuStall"
>+             underscore_name="eu_stall"
>+             description="The percentage of time in which the Execution Units were stalled."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 8 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU Thread Occupancy"
>+             symbol_name="EuThreadOccupancy"
>+             underscore_name="eu_thread_occupancy"
>+             description="The percentage of time in which hardware threads occupied EUs."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="8 A 10 READ FMUL $EuThreadsCount FDIV $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array"
>+             mdapi_usage_flags="Tier2 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EU FPU Pipe Active"
>+             symbol_name="FpuActive"
>+             underscore_name="fpu_active"
>+             description="The percentage of time in which EU FPU INT64 pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 11 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EM Pipe Active"
>+             symbol_name="EmActive"
>+             underscore_name="em_active"
>+             description="The percentage of time in which EU EM INT pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 12 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SYS Pipe Active"
>+             symbol_name="SysActive"
>+             underscore_name="sys_active"
>+             description="The percentage of time in which EU SYS pipeline was actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 13 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="EM And FPU Pipes Active"
>+             symbol_name="EmFpuActive"
>+             underscore_name="em_fpu_active"
>+             description="The percentage of time in which EU EM INT and FPU INT64 pipelines were actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 9 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="SYS And FPU Pipes Active"
>+             symbol_name="SysFpuActive"
>+             underscore_name="sys_fpu_active"
>+             description="The percentage of time in which EU Systolic and FPU INT64 pipelines were actively processing."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 14 READ $EuCoresTotalCount UDIV 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="EU Array/Pipes"
>+             mdapi_usage_flags="Tier3 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="CS Threads Dispatched"
>+             symbol_name="CsThreads"
>+             underscore_name="cs_threads"
>+             description="The total number of compute shader hardware threads dispatched."
>+             data_type="uint64"
>+             units="threads"
>+             semantic_type="event"
>+             equation="A 4 READ"
>+             mdapi_group="EU Array/Compute Shader"
>+             mdapi_usage_flags="Tier3 Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GPU Busy"
>+             symbol_name="GpuBusy"
>+             underscore_name="gpu_busy"
>+             description="The percentage of time in which the GPU has been processing GPU commands."
>+             data_type="float"
>+             max_equation="100"
>+             units="percent"
>+             semantic_type="duration"
>+             equation="A 0 READ 100 UMUL $GpuCoreClocks FDIV"
>+             mdapi_group="GPU"
>+             mdapi_usage_flags="Tier1 Overview System Frame"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="Gti Read Transactions"
>+             symbol_name="GtiReadTransactions"
>+             underscore_name="gti_read_transactions"
>+             description="The total number of read transactions sent to GTI interfaces"
>+             data_type="uint64"
>+             max_equation="$GpuCoreClocks $EuSlicesTotalCount 4 UGT 8 UMUL $EuSlicesTotalCount 4 ULTE $EuSlicesTotalCount 1 UADD 0x6 AND UMUL UADD UMUL"
>+             units="messages"
>+             semantic_type="event"
>+             equation="A 36 READ"
>+             mdapi_group="GTI"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <counter name="GTI Write Transactions"
>+             symbol_name="GtiWriteTransactions"
>+             underscore_name="gti_write_transactions"
>+             description="The total number of write transactions sent to GTI interfaces"
>+             data_type="uint64"
>+             max_equation="$GpuCoreClocks $EuSlicesTotalCount 4 UGT 8 UMUL $EuSlicesTotalCount 4 ULTE $EuSlicesTotalCount 1 UADD 0x6 AND UMUL UADD UMUL"
>+             units="messages"
>+             semantic_type="event"
>+             equation="A 37 READ"
>+             mdapi_group="GTI"
>+             mdapi_usage_flags="Tier1 Overview System Frame Batch Draw"
>+             mdapi_supported_apis=""
>+             mdapi_hw_unit_type="gpu"
>+             />
>+    <register_config type="NOA">
>+        <register type="NOA" address="0x00000D04" value="0x00000200" />
>+        <register type="NOA" address="0x00009884" value="0x00000008" />
>+        <register type="NOA" address="0x00009888" value="0x3B410000" />
>+        <register type="NOA" address="0x00009888" value="0x0140000A" />
>+        <register type="NOA" address="0x00009888" value="0x33406A80" />
>+        <register type="NOA" address="0x00009888" value="0x07410006" />
>+        <register type="NOA" address="0x00009888" value="0x17410033" />
>+        <register type="NOA" address="0x00009888" value="0x03410000" />
>+        <register type="NOA" address="0x00009888" value="0x4F410000" />
>+        <register type="NOA" address="0x00009888" value="0x01030005" />
>+        <register type="NOA" address="0x00009888" value="0x03035540" />
>+        <register type="NOA" address="0x00009888" value="0x0104000A" />
>+        <register type="NOA" address="0x00009888" value="0x0304AA80" />
>+        <register type="NOA" address="0x00009888" value="0x1D500003" />
>+        <register type="NOA" address="0x00009888" value="0x02E71540" />
>+        <register type="NOA" address="0x00009888" value="0x02EA2A80" />
>+        <register type="NOA" address="0x00009888" value="0x02E82A80" />
>+        <register type="NOA" address="0x00009888" value="0x00F07803" />
>+        <register type="NOA" address="0x00009888" value="0x00F10005" />
>+        <register type="NOA" address="0x00009888" value="0x02F12A80" />
>+        <register type="NOA" address="0x00009888" value="0x00F20003" />
>+        <register type="NOA" address="0x00009888" value="0x22F30012" />
>+        <register type="NOA" address="0x00009888" value="0x26F32490" />
>+        <register type="NOA" address="0x00009888" value="0x00F4000A" />
>+        <register type="NOA" address="0x00009888" value="0x22D3003F" />
>+        <register type="NOA" address="0x00009884" value="0x00000004" />
>+        <register type="NOA" address="0x00009888" value="0x044C2000" />
>+        <register type="NOA" address="0x00009888" value="0x064C6000" />
>+        <register type="NOA" address="0x00009888" value="0x004C0010" />
>+        <register type="NOA" address="0x00009888" value="0x0E4C0180" />
>+        <register type="NOA" address="0x00009888" value="0x104C0305" />
>+        <register type="NOA" address="0x00009888" value="0x124C0007" />
>+        <register type="NOA" address="0x00009884" value="0x0000000C" />
>+        <register type="NOA" address="0x00009888" value="0x0050F803" />
>+        <register type="NOA" address="0x00009888" value="0x1C500000" />
>+        <register type="NOA" address="0x00009888" value="0x1E500000" />
>+        <register type="NOA" address="0x00009888" value="0x28500000" />
>+        <register type="NOA" address="0x00009888" value="0x18500000" />
>+        <register type="NOA" address="0x00009888" value="0x20500000" />
>+        <register type="NOA" address="0x00009888" value="0x22500C06" />
>+        <register type="NOA" address="0x00009888" value="0x24500060" />
>+        <register type="NOA" address="0x00009888" value="0x26501606" />
>+        <register type="NOA" address="0x00009884" value="0x00000000" />
>+        <register type="NOA" address="0x00009888" value="0x28036400" />
>+        <register type="NOA" address="0x00009888" value="0x2A030080" />
>+        <register type="NOA" address="0x00009888" value="0x06031300" />
>+        <register type="NOA" address="0x00009888" value="0x08030FB0" />
>+        <register type="NOA" address="0x00009888" value="0x00030000" />
>+        <register type="NOA" address="0x00009888" value="0x00C00005" />
>+        <register type="NOA" address="0x00009888" value="0x00C1000F" />
>+        <register type="NOA" address="0x00009888" value="0x00C2000F" />
>+        <register type="NOA" address="0x00009888" value="0x00C3001B" />
>+        <register type="NOA" address="0x00009884" value="0x00000000" />
>+        <register type="NOA" address="0x00009888" value="0x5C030002" />
>+    </register_config>
>+    <register_config type="OA">
>+        <register type="OA" address="0x0000D920" value="0x00000000" />
>+        <register type="OA" address="0x0000D900" value="0x00000000" />
>+        <register type="OA" address="0x0000D904" value="0xF0800000" />
>+        <register type="OA" address="0x0000D910" value="0x00000000" />
>+        <register type="OA" address="0x0000D914" value="0x70800000" />
>+        <register type="OA" address="0x0000DC40" value="0x007F0000" />
>+        <register type="OA" address="0x0000D940" value="0x00000004" />
>+        <register type="OA" address="0x0000D944" value="0x0000FFFF" />
>+        <register type="OA" address="0x0000DC00" value="0x00000004" />
>+        <register type="OA" address="0x0000DC04" value="0x0000FFFF" />
>+        <register type="OA" address="0x0000D948" value="0x00000003" />
>+        <register type="OA" address="0x0000D94C" value="0x0000FFFF" />
>+        <register type="OA" address="0x0000DC08" value="0x00000003" />
>+        <register type="OA" address="0x0000DC0C" value="0x0000FFFF" />
>+        <register type="OA" address="0x0000D950" value="0x00100002" />
>+        <register type="OA" address="0x0000D954" value="0x0000FFFB" />
>+        <register type="OA" address="0x0000DC10" value="0x00100002" />
>+        <register type="OA" address="0x0000DC14" value="0x0000FFFB" />
>+        <register type="OA" address="0x0000D958" value="0x00100002" />
>+        <register type="OA" address="0x0000D95C" value="0x0000FFE7" />
>+        <register type="OA" address="0x0000DC18" value="0x00100002" />
>+        <register type="OA" address="0x0000DC1C" value="0x0000FFE7" />
>+        <register type="OA" address="0x0000D960" value="0x00100042" />
>+        <register type="OA" address="0x0000D964" value="0x0000FFF7" />
>+        <register type="OA" address="0x0000DC20" value="0x00100042" />
>+        <register type="OA" address="0x0000DC24" value="0x0000FFF7" />
>+        <register type="OA" address="0x0000D968" value="0x00000002" />
>+        <register type="OA" address="0x0000D96C" value="0x0000FFFE" />
>+        <register type="OA" address="0x0000DC28" value="0x00000002" />
>+        <register type="OA" address="0x0000DC2C" value="0x0000FFFE" />
>+        <register type="OA" address="0x0000D970" value="0x00000002" />
>+        <register type="OA" address="0x0000D974" value="0x0000FFFD" />
>+        <register type="OA" address="0x0000DC30" value="0x00000002" />
>+        <register type="OA" address="0x0000DC34" value="0x0000FFFD" />
>+        <register type="OA" address="0x00002B2C" value="0x00000000" />
>+    </register_config>
>+    <register_config type="FLEX">
>+        <register type="FLEX" address="0x0000E458" value="0x00005004" />
>+        <register type="FLEX" address="0x0000E558" value="0x00008003" />
>+        <register type="FLEX" address="0x0000E658" value="0x00001000" />
>+        <register type="FLEX" address="0x0000E758" value="0x0000A009" />
>+    </register_config>
>+  </set>
>+
>+</metrics>
>diff --git a/lib/xe/xe_oa.c b/lib/xe/xe_oa.c
>index 576358fe22..d2d0687d9a 100644
>--- a/lib/xe/xe_oa.c
>+++ b/lib/xe/xe_oa.c
>@@ -36,6 +36,7 @@
> #include "xe_oa_metrics_acmgt3.h"
> #include "xe_oa_metrics_mtlgt2.h"
> #include "xe_oa_metrics_mtlgt3.h"
>+#include "xe_oa_metrics_pvc.h"
> #include "xe_oa_metrics_lnl.h"
>
> static struct intel_xe_perf_logical_counter_group *
>@@ -296,6 +297,9 @@ intel_xe_perf_for_devinfo(uint32_t device_id,
> 			intel_xe_perf_load_metrics_acmgt3(perf);
> 		else
> 			return unsupported_xe_oa_platform(perf);
>+	} else if (devinfo->is_pontevecchio) {
>+		perf->devinfo.eu_threads_count = 8;
>+		intel_xe_perf_load_metrics_pvc(perf);
> 	} else if (intel_graphics_ver(device_id) >= IP_VER(20, 0)) {
> 		intel_xe_perf_load_metrics_lnl(perf);
> 	} else {
>-- 
>2.41.0
>
