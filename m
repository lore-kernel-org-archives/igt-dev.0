Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0A0C02190
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 04:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E06B10E031;
	Fri, 31 Jan 2025 04:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lFvjcCd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD9E10E031
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 04:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738298007; x=1769834007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z9MzMUppU1niFTakg33RG5iobycVKfBCHN7COQDt0Nc=;
 b=lFvjcCd1S5uayb6uhu+JS6wj4gIkF8lCzZhf3B7C6nHgJrkQhRtkW/GN
 7LYNHiSB4HKaGdGG71XLrLJuNEQ2tcnQlCdTnV3GTIof91Y+X7lZ/OVXu
 bMjX05aLvSXvRlFQCv3d5GLe9wiWIrE36eNoHtLcD1ud1mPsSTXELz+5w
 WFpMkM0g4w03Ff4Clncn1E82itgyC7d7Ixq2LC3HYlundXJgJif0WLsm6
 nYgRlbpCjxpJ7QMNTf0VH1rdvIIlT7gYsZgGHVUc1LnEsv+DSeg0yh0cq
 a/lkTQu0I6PwtiAC1iWY42xAaaHKtO1B8SFK/ee+RRMwy6tY9FlI1DoiH w==;
X-CSE-ConnectionGUID: sZvksXvBSuCBWRP/N2EIqA==
X-CSE-MsgGUID: wirKh1FIR9KMYH3cmy32xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38768531"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208";a="38768531"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 20:33:27 -0800
X-CSE-ConnectionGUID: bx5MOl77QHOlZVY7Z91FZA==
X-CSE-MsgGUID: 9tfW+urVS3CH3K5iDCEriA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="114526135"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 20:33:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 20:33:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 20:33:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 20:33:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VlaNT3UV+A+MhdKQxqBSW5Bu6LrYjw6Crzq3YQ2pGy/YwD0+qu5hDURu0kxBZwbzKhmhkQwpmlRQtQTk+SyIbkq83p3I5XIQQJXDTcxQCZLwXDe8DjeYNNCyeklybI1qV5uvTuAww52f1az1YDT2ejnnWB23zPaLr3K7jde38i2SI2KMta09IJB2reEmrXwAAX6XzQJtPqbKH7cI7HrjIHtER1yYtg0fl14AU4IZ5iFO7sA5pTZ+VpQscALuMzOAYb+9G5QDjRfuWa2uJHylf5F9N/D0kDFuUTX10bavqVsWXRo0vMIeNksgHv2EjoyYBZmDlH0KItpvMgIDiHS/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpwF9H82mOTwTRLLgcVyqpI60AFcHeo0ZRkFQZZc73c=;
 b=pdhvzkIJ033sIbH6/2XT/t2E6yV6f9bLrf/LQaaqIkDyaTbPDShYxUE0HwOeP56oR+cTORwNYtZAxX1tcRgBp8XAZ9LjXjzxgm2thmw7bRw8hlxtm+Os0mDjUhXSL7lkO1fTiGNTe4BuDOrH/MQW/v8QbPnve/5MvJPLkeCmgO45+zE13mq0Aet+mIwsYlnHBEvzxA9nd/78a/lB2YVYcxAM7natChoql9ZNwAbu2HuiRAVmtL948K+tVSNPPrK9QA5DAezh9yF3zz1YnzIsMSjzZ7J/aZnIR8eGf2eGXtJYCms6ue7yyo+kIoZ4E8yF0s8jz5kuDix1ZPW8LOLJSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 04:33:22 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 04:33:22 +0000
Message-ID: <a35132cf-2f08-4d9c-b04f-084bf74027fb@intel.com>
Date: Fri, 31 Jan 2025 10:03:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] tests/intel/kms_joiner_helper: Add lib changes
 to check joiner is enabled
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20250130172031.4126606-1-jeevan.b@intel.com>
 <20250130172031.4126606-5-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250130172031.4126606-5-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::18) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: b77195e5-ec7b-4039-492a-08dd41b064e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?enNjaytINWlDUmt4RVNuSUZmSXUrTnZHYTFDVU1tSXJXazQ2V3llMC9XWFUw?=
 =?utf-8?B?NGRRWVhJRHREREc0dEMzVFdVWkFCN29Da3hIRzR0Z2JlQ2JKZHpqa0c4VGsr?=
 =?utf-8?B?TGNSSHVFSGFmRlNycENNSHFlTHpacDRyTXowdGtCMVZhcStDL3FrVURrMVhy?=
 =?utf-8?B?TXRoS0Z5dzNNVFdvOFdGaDg0VXFoVkZnc2ZWYWtlcVFaOStIbW9IOHBOZWFG?=
 =?utf-8?B?VmlMTXQ0QW5EckNHeDhTd0VuemJaMzBIVDJYYWVrUWE0N0cvMHVGRU5FUWI3?=
 =?utf-8?B?L05xQWF0d2JNUXU3dm1ZSmhqc2FKNUx3RVFWMk9XRitzSk1WdUpBNXlOYnJH?=
 =?utf-8?B?MU5PVEVGRm1haVZaQUJmTS9aL1NJb0tPWHEzTS9qUEtaQ2JmT213ZkhRWkNC?=
 =?utf-8?B?ckNBN1lFaStKblZmM09oSTVCU1kvSEdyV0UxTHVlSWF3TjlVNmN6bkwyM1dj?=
 =?utf-8?B?bkVBNitveVBqRWUyS09UMm4rTFVMekk0UmR3cGJWQm1oeDFDWGl4KzJsKzRK?=
 =?utf-8?B?bmdPSHA5SUkyN1JCTmc1OXVCNmpKMVpxUStLTEd4VE80Szhvdm5nWGh0dkNz?=
 =?utf-8?B?T1NKV2N1RXk0cy9ocTkwc2ZEeUk2NUd1WFJFeXo0U3pqTlNuTTRPRGtPWmZm?=
 =?utf-8?B?bUdyUk1WQ1hKaVhadE9vVmV4M2VNM25vdUNNZU56bXV1NkNFNGd6NmtaZVA1?=
 =?utf-8?B?bENHcXVnQ21ONHc2ZStFanQ1N2dVQjJtS1RMSkh5TGU2NjFwelk5cEp2MjQ5?=
 =?utf-8?B?QVE3ZG00L0U5djYwWlQ3M1N2azBOV0Z4cVV2aTFQbVFwbUk2ZkdYdnlWbHR5?=
 =?utf-8?B?czBFdGVLUjNNL1laa1U2L1F6TFlNdW5PVEViUWZwTXBoTnRTMGUyRWVGS09p?=
 =?utf-8?B?Y0hwTjIxbUdwZ1NIWHAwRm0vZTB2ZUVoaktLYUxWdTk0SFZHdmdvb3BYR2Vw?=
 =?utf-8?B?dVYwRE00S1RGQWtRL2IyNnJCL1hVQjMxQ3I4R0dIQUN2aTJ1TzdMalptRUVL?=
 =?utf-8?B?U0prWnQ4RXE0TnI5Q3JNMjBGckhROWw0Uk5yN015akx1TFZNYktPQWpIMitK?=
 =?utf-8?B?Mno5dGhCalI4V01oZFphSHRpKzN1Ui9WUFppdzNYSTY4M0gzQjNKak5MY0N5?=
 =?utf-8?B?dEMvN3VhYm5DbWlOVDBlODl2RDM1ZVFKTmV5REpESlR3bnVhUGtmbEJTSXEz?=
 =?utf-8?B?clhSSExRNVJ3MW15M0VWQnpuOGdjU2kvK29OQUQyZ3V1MGZzWUpRNW9LN2xI?=
 =?utf-8?B?R0QzV0lwbFJNQzRwVlNwd280dmREQTdLUmRnckZJQWlPNGJvSHBZZUZIL3R3?=
 =?utf-8?B?MkVVZ09HRXd3cWtSNU9LQUtKOVdVT3lUbWtHVlBTT09zMVBWdDVPTzhKaTZa?=
 =?utf-8?B?eVFsK0hySFdCeXN5UkJha0oxc3VHZDlNem8vaUVHY21hdzJSSUhCcVRpOSt1?=
 =?utf-8?B?MVZqZmhSK0Z6REw1UmNWZ3IvL3NuME1GZ1Y4dnpGdCs4ZW1KY3Y2a0dDQlV2?=
 =?utf-8?B?QmdEZzcxNHgvTFZpcTJtczQ3VGl0Y2ovaXNqSXkzQWRJbXJwRDcxZVVLZWRr?=
 =?utf-8?B?Skp3bjJoQkozN2EydE5KcU5uaUNGSWVYeDNwdXA5ZldiMGpPVWdWQU5jeW5P?=
 =?utf-8?B?VkQ3KytLbWh5YlJhQzM4QnB2QWhYTHplNDNBcjlsdGRmUEpaa1RTdnY4a0Nt?=
 =?utf-8?B?eTFkeEZYdVA1NXJJN1Rza0dYcG5Id2FlYmg2azdFdGxLVGdMMjJFczVvU08v?=
 =?utf-8?B?VG82Rks3aGxtb01PRmxPQkk1TUxrdHFCY1I1azc1VVpNRzMwbk8yZUtleEVB?=
 =?utf-8?B?akNrajliNzBXOWpwMmYzMTB6NGFPd01KYWJsVVYwYjU0Q0IybU1Lak1TZ3No?=
 =?utf-8?Q?wcpM7uUaphQwO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFFqSW95aDlURGtkZFNMeFp3VmhOUVBoQ2NVMEhZVDRIbXoxZWtDSXppS2Vm?=
 =?utf-8?B?U2tJZmFpMm1hTG43ek9ObEVxR216NkpDWEZHL2VuMEt1dzVUYXJVMThpZ3ZM?=
 =?utf-8?B?VjBaWWdYVC9Idlp5bjVvaUh0ZDE0eFN1TVgzNXpjREpWUjFSaHBvNHZhTDRp?=
 =?utf-8?B?cTAwOFdOSHY2M0p2ZUo0UzJQbTMyRVMxR2xNc0FEd0RFOTV6UzVRYWZmcGJL?=
 =?utf-8?B?cThXQjlKSzRoNTVtbkRrRjBGdEhESTFTYWJoNjNFS0NueVlJUUNNNnBod2Mz?=
 =?utf-8?B?WHBsaWJiYTlhSTB4WXhyaGhaVktMNFo5K0pTa0JWdHExR3pZYTd6VTFWaFVN?=
 =?utf-8?B?MXpPdm02NFg2ejUyMTlFMCtXSVhsQzFXekZVdi9SNzJhVTRqbVUyUDVQVmRG?=
 =?utf-8?B?emc3c0FOZnNzUWxsZE9URjJ0bnkxZUVDVDBrZXBZa1N3ajV2emJ4YXRBK3d1?=
 =?utf-8?B?MFEyVy81bDRTMERDR3hUZ0RYS3gySjJNSmlkc2ZBUXM3UjBBNUplUkE2TkJB?=
 =?utf-8?B?Q1lYb1FyWXhSdlBZT01BbFJkZkl4eEcxK0Fha1RxRVcwdFdENzZZRmhsRzF2?=
 =?utf-8?B?MHZ4U2wzT2NpOEFadnFVWTlaK0NPczcrUHhBS3ZGd0w4WjRGL1RMUS9YM1FN?=
 =?utf-8?B?SWZkZWsyODhkcFdtVDRwZEs0eERkNHl2VFdpTlBidVRjVGZiMjR0djhzQlNL?=
 =?utf-8?B?MkVSY0lwVjA3ejFBcEd4dVIwMjNGTjBGMW50ckZjcDR1eTM3UnV1MVA2S0xl?=
 =?utf-8?B?VTNrRi9sWjhLRmtNRnNPYjRHeldERFNXVENuUzRPRUJhQmRVdVZpd09nY1Bt?=
 =?utf-8?B?MDFuQ3p4U2hrb0VsUU5qSlp0SzhicXNDVGRRMFJhUFdDN0hTZmlQRHJiTWln?=
 =?utf-8?B?Yk8zSkI3RUJsUTRDMkRLUXozdWt6OEgwbEk3YjFXSHlpUll3NlR0UkZTREpz?=
 =?utf-8?B?OUViWFBlRUJMRDg5LzRPWHExWVZzRVF3emQrRUhJTUNFWlZ0VjJURlNtUTM4?=
 =?utf-8?B?eFlGTXNIejEvM3pqdUpvc09yZTNCOXEyTHJxa3RRb1N3c0ZWTEk3ZGJoZWZ0?=
 =?utf-8?B?M29nSFNhazdkNlQyMzg0dXNRRVVHeDRLWjE0Q0JoNys5SExBMkExNEFGZ01n?=
 =?utf-8?B?aHFNZFhwekZlamsyR0Vnekt5aE52ZVl0aW5vcEhBTG9xSUphcDIwbGI5a05n?=
 =?utf-8?B?R1hOT1R3aDBlb0pSNEN3MTVGbVhPdmc3aUQ1VXoyenNFME1ZTXJIanNEbm5Z?=
 =?utf-8?B?bzNXOFJkQURZdHBBK2FkcXp3NHZZczVyWjIrNUJ3amVNQjBQNFQraHRZNWVa?=
 =?utf-8?B?QVFHbU54TjVnNXJFeG9nQWhUZ3duRzR4Rkdqc284VTJ4NnF4ZE5uR3pGL01i?=
 =?utf-8?B?MlE0UU1mbUVCcTJKSDFTU0x3TUtXd3FWVXFtM2JUWGVoTC9JVGJ3cTlxMWRy?=
 =?utf-8?B?dGJ4WC90S3BCQ1JmY1VjSTAvdkxjdkdaelBJb1d6NjlML1hnY1AyaWh5eFlY?=
 =?utf-8?B?cjI3Wlh6SWhVUnpVb1p3RnpQektTcWIyQXMrcHZCTlhMM0E1SWhBeGNiemM5?=
 =?utf-8?B?MkFEV1AvcGdrRTVWRklGN0RlaDRwQUNNUDdNeFNpY09QQTkvbktSck1maVps?=
 =?utf-8?B?aStleFlwb3c3TnN6c212MEVXbnJUbGFRQVE3N0pkRGlFVDZRSVlITHd5UjBt?=
 =?utf-8?B?cUw2dDhDb3dZUHphZW5NeUVXNk1LR0pncHZyVk1rSHN0azEyblRRM3cyazZi?=
 =?utf-8?B?ZXo5c1daQXFVeGpiWndRZVhEWVgrblBnaHJGZzhuV0I5Q2cwZ1pnZCt6OUt4?=
 =?utf-8?B?QjNOK0hvWWNxWlNJQzA5WmZCSytIZ2l1T29PTndpa2RIWW1LR0Y4ME1aUzhp?=
 =?utf-8?B?d3YzM3VUU21yS3JvZjNqeTgrS3FtaXZobUhwbTdjbHBnaHdDSDNaVVpMMjF5?=
 =?utf-8?B?UVM5ZVVFZ2VtbzdYM1V3Y0R5RUVMWE1TVE93ZWJ1VlJZRjNZd3ZxNThDalor?=
 =?utf-8?B?bXpHUDEvdVBDTEg3R3JNcEEwR25Yemh5cSs1RFUwTUNaSng2MXpQQzlmVTND?=
 =?utf-8?B?RWtvNHJNVzV0cE1TaVNmSkMrSXZ0c244Q0RUTWRLUGpCZUpIYTYwMGhKSk01?=
 =?utf-8?Q?Tis2b7iIq+uT4+skEdT6MscNG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b77195e5-ec7b-4039-492a-08dd41b064e6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 04:33:22.2574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFvyXAic78vWkiZlH83Gp6JOu2ceH4PXxWmBMSZWxEeWjzZi8uFT6ZUnJdy1c0wm4y8x9mTfvaHVVxdJ9vBkaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6824
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

Hi,

On 1/30/2025 10:50 PM, Jeevan B wrote:
> Added a library change where we if joiner is enabled or not.
Please fix the commit message.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_joiner_helper.c | 38 +++++++++++++++++++++++++++++++++
>   tests/intel/kms_joiner_helper.h |  2 ++
>   2 files changed, 40 insertions(+)
>
> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> index af89be777..a86099fb7 100644
> --- a/tests/intel/kms_joiner_helper.c
> +++ b/tests/intel/kms_joiner_helper.c
> @@ -3,6 +3,44 @@
>   #include "igt_kms.h"
>   #include "intel_chipset.h"
>   
> +/**
> + * is_joiner_has
> + * @drmfd: A drm file descriptor
> + *
> + * Returns: True if joiner is enabled, false otherwise.
> + */
> +bool is_joiner_has(int drmfd)
> +{
> +	if (!igt_check_joiner_enabled(drmfd)) {
> +		igt_debug("Joiner is NOT Enabled\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
Is this wrapper adding any additional value?
> +
> +/**
> + * igt_check_joiner_enabled:
> + * @drmfd: A drm file descriptor
> + *
> + * Returns: True if joiner is enabled, false otherwise.
> + */
> +bool igt_check_joiner_enabled(int drmfd)
> +{
> +	char buf[4096];
> +	int dir, res;
> +
> +	dir = igt_debugfs_dir(drmfd);
> +	igt_assert(dir >= 0);
> +
> +	res = igt_debugfs_simple_read(dir, "i915_display_info",
> +					    buf, sizeof(buf));
> +	close(dir);
> +
> +	return res > 0 ? (strstr(buf, "pipes as a master") &&
> +			  strstr(buf, "pipes as a slave")) : 0;

Please make the check more specific by checking for the exact pipe we're 
committing on.

Thanks,
Karthik.B.S
> +}
> +
>   /*
>    * Detect if the output needs 1, 2, or 4 pipes (non-joiner, big joiner, ultra).
>    * This re-uses your existing logic from:
> diff --git a/tests/intel/kms_joiner_helper.h b/tests/intel/kms_joiner_helper.h
> index 95e71a229..e38b9f61b 100644
> --- a/tests/intel/kms_joiner_helper.h
> +++ b/tests/intel/kms_joiner_helper.h
> @@ -3,6 +3,8 @@
>   
>   #include "igt_kms.h"
>   
> +bool is_joiner_has(int drmfd);
> +bool igt_check_joiner_enabled(int drmfd);
>   void igt_set_all_master_pipes_for_platform(igt_display_t *display,
>   					   uint32_t *master_pipes);
>   bool igt_assign_pipes_for_outputs(int drm_fd,
