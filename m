Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CCD1C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 06:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4D10E09F;
	Wed, 12 Mar 2025 06:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDNj9RkV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B298A10E09F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 06:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741759899; x=1773295899;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1TfgG0exyjKIx7OLNMWFVFxuti9qfsCcysJZIKLZ3S8=;
 b=IDNj9RkVf9YVeF0OEiGqb7XOSoxYv4DWVpvCFs2N0SaP6NcTvAoHLYsh
 HWozpemIgTLkpBGnXVZ736uFztjRvanQkc5YmzBa9M1BsbcF52zE+yoOR
 EQ3I/Y5osH0bO9TkfJjKJs9Z2JeaAJtgvGWsWG7xCRiQbljqNqD+hTlp2
 e5j+UBilT33YR8VIdBAn4SV7FHy1WcFpUeQz8ub14EDWV6HEhvjOcqC8z
 tp2rL8tdz03EAioXETGdgDMSa8LSHLAvJISf6CfTdE83KBbrzgpuwrfB+
 ITgB2EkmWjkZHjGsZPm8J/yDDlEXoldE+wO74C6iAHpawrse4zlod4bhZ A==;
X-CSE-ConnectionGUID: niMFvMAASmiM1AEjLStvpA==
X-CSE-MsgGUID: TkQfL+jtSw6wji2oKrepow==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42861443"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="42861443"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:11:38 -0700
X-CSE-ConnectionGUID: h9pgeZZnQ3aDCO86uV8Kwg==
X-CSE-MsgGUID: EeiqrPeuSu6+8IOToIenjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="125575727"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2025 23:11:38 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Mar 2025 23:11:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Mar 2025 23:11:37 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 23:11:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1iIkVsNWgIfOTpAB4Au8nQktCTCvb8aOZWTOwGhsp+MmNgQJp/RUki849POiNR3FEgcn/XZqQeAvZ2yanHvQvAGv48t5zzql7knFIZkJ9aidpDypQx+7OFgXmFAJJnJHgXfUWMulXRLULT0Fgpqp8Xk+fRnVz8cR7sTf40AIK/SFVFx0bhXkRCj44tEhgYEVE+o/RZDLbELuUV3sXDZiwGctwTVkvwjKDlMY8updNd1xvnLvPNMc2mZkYnkwxFRk0qyM6+0+JFPd9GmMzZXHh2Nj5Fsk1RKGfp2yWASV68WETxGYhJGEeMV1ZUl1KF3C04+Fcei946Ilec041gzeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=anwmpdKOfGoxa0Id3cm5gCSh74u+ry7KCuApxgNTLrc=;
 b=d/K+3TT/r38UVcfdCFh/XmzFFwe/nTOE/rfgPJS7yq5MUvJ6z0zkSBMdqfR6QLM1/k8Xh7+zF0b9MzAYtV3LdeB0nUHlAktIIG1WUiVD2YROqN4JdyPjJBUytvz20nwYAoQMSaFdTf9gcp2s3q1xU3BxN7lNd4vqy5GkrzXBfLFOrGE5EqujqIb2NspJbjKxT8SEY17gksqKlwPGKlTXReTtHgtRc2DAjfvIdfGVsm1ZSjq0akNIwYFxLEHjiTH98tPVgo+61t67uU6rWP6nFjmfklYvh8Xi/mRmPuaUCatdXX/o9OGvw0dk/3tIFKc5pOgjyFlRkSCcsw977TBQuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Wed, 12 Mar
 2025 06:11:07 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Wed, 12 Mar 2025
 06:11:07 +0000
Message-ID: <ef492188-c3b0-48b8-9e54-b18d55738557@intel.com>
Date: Wed, 12 Mar 2025 11:41:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: Store valid DSC outputs
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250218130337.431624-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250218130337.431624-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0108.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::13) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf2baf3-4dd0-490e-90c0-08dd612cad59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGxLN1BUUDVDNHdVNmRDVW1zK3dlQjg0UHNPZW1wcHNqZ25OUWVYV29YeWZE?=
 =?utf-8?B?K2VIUGcvVnVRdkpKWDJwell4elp4L0YwcE1kb0NuN3cyTmNudy83UFRqWXBB?=
 =?utf-8?B?b1o4bUpGLzlNelNnQ1ZIb0xId2ZjYWVNc2xlYVhRS3RlQVhwcTN3akk0aWRO?=
 =?utf-8?B?bS9xOEJkbnYwNEpSczNJdXBRRHdTTCtNeDhZZENEb3daaDBLZlJCVTFBWk44?=
 =?utf-8?B?K3QzTU9qRFVLS0tncnZ2aEZnZDNBWHBjSTluNkZPT29kM0M5cUVadGRLSEVx?=
 =?utf-8?B?SkVTOExVK29kbDNkazFCQUZ0a0doek1OOTdMRHdtZ2tjNVZUelNiTVlJS0FP?=
 =?utf-8?B?bWxHMnRLTmNRSHdsY0M4WHA0QlVPczZURjRudUdubldGa1hxVklka1hrSWlq?=
 =?utf-8?B?M3ptSU5ZTmNzK3ZLN0pPeGQyNWNjTWhtVytqdGJCcEViVTlyUjhVNDFyZWRh?=
 =?utf-8?B?NkMzVlpvb2hNbGF1TEluU0xSY21hR2xKTjBTcWlPN2dOSkU1N243dnQxYmNT?=
 =?utf-8?B?dWdUdWpEUUw0bi92T0NqaW1hdnlZemNDcnZtd3dvZXR4ZVVtUHorcVM4TlJy?=
 =?utf-8?B?c1lSUGkwQ1k2VXo5UDJwZEVpajhRWFlCY1hoVlNQOXF0SW5HTW0rWWd0L3FS?=
 =?utf-8?B?aFp5c0ZwejdSNENhQ015VjVmKytuL2NaNENNZGIrYlU5Wmo3a0szWFhTMzd6?=
 =?utf-8?B?bzc4SlozV09DUGRldm1oVkRMbXZCZFp2SHpQYU9iSHExdkFCR21qT1hPdjNL?=
 =?utf-8?B?NkhieDFxQThWU1VzbVJFcFVzRHpmR0UyQzNobi9kZlR1SEtKVWRWZTVkRlA5?=
 =?utf-8?B?clpRam5kU3hWRnZXMGZNRDh1ZVdTM0NZSWluRVp1TlExeFZEVHhnMmJkSnNi?=
 =?utf-8?B?dDNDWG1qUThndENWTXRmb2hNb3lJVHJWNFdjVFFkdEZMNnFVRlpLMzkvZ2pD?=
 =?utf-8?B?U0JWbmZxV2J1QmUzZFBJQ052V211WURYQWxJZjJjVHVoL2RFV3ZWYmpOTTZD?=
 =?utf-8?B?QkxtMGdpREZkZXJQeXE1bWZNQjFDTkZFeGVGM01vRGdWVHl5TGZxLzFDN2o4?=
 =?utf-8?B?YWMraG9FKzA4Zy9HL05FWlhyL0o5OTlLV1MydkRvY2lhK1c3bGZDREZXdGgw?=
 =?utf-8?B?Sy9pVXc1MnNBdU1FbVpQY0RaTzdXVjFMZGxxTmlodWZXVHA4MWVXVXlrT2ZK?=
 =?utf-8?B?d294eTAxN1FVM0w5WDUrOFptOTFzZjdQeHh4V24rUFIyQndBOExSZXpaSFBv?=
 =?utf-8?B?OXg0ZlhzRFNEajNacXBXeDRTa2s5b0lHaW1UTWhxODJKQ0pGblFlOU1XenJh?=
 =?utf-8?B?TU9TL3NFU2orV3lMSnJGK3lWNnRwaTNSSW14bVRlQVR3bkR5bHpaZXF0eWV3?=
 =?utf-8?B?OGR1SjhVanpsLzlBOWg1ZHpNcHJvbkxJd2w4eWlrYlliaDlFUVM5cUl4MzdM?=
 =?utf-8?B?N01LT0dzNTJLVWwyOFRVek01TVRBS01NSDZkUXQ2b2dPRW5VWTRGb1grMThX?=
 =?utf-8?B?UnFEMFVoN2c1MFgxTXFQWjhadCtzTE53d0tpanpTdHJOYk0zSkVaZmY4azR6?=
 =?utf-8?B?OVlGRG41SlNJR2lFMmk2ZVlZZFpZb3UxemNqK1RuYTl4NHpYbHFVOGMzQVNp?=
 =?utf-8?B?RTZ4WHhwaDc3ZlhCYVQ1bVYxL0NXNlBQMTBDMTgxakdCZmpnaUZ4bEJQWnBJ?=
 =?utf-8?B?WXMvR3IxM0VXYkZ1Y1RieWlueTkrYkNVcnhZV1pQUUpxV3Rwemluajk3ME1w?=
 =?utf-8?B?dDBpY3ZycUFTZ1NSeTRYOFRRMGU3OXdwa0tOQWw5TnI3NzRnNmF1ZXVON2o4?=
 =?utf-8?B?NWxVMG5meHRsWkdMLzhpT2VqV1JZSWlBSXZnL0ZoWDAvT2RsNTZhTlVtZWVy?=
 =?utf-8?Q?0Vv4tBEFGUypU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3BvZ0R3bEFJNWRyQWkzUWdSVzU4NkgrSno0OU5iWUt0V3VLdHFEdytQcmps?=
 =?utf-8?B?T3dwVzFzU1N2WndPUGlZdG9lbW4waTdQWXo0RkRQbVNMQTJqUzF4Kzh3bmJ4?=
 =?utf-8?B?UG53ZDNtRGh3M3hPb0M3UGQzVDRyazM5VkYycGFiUFRBL3M1TVdRMXdGcmNZ?=
 =?utf-8?B?eUtpd2MySjZsaEJNOFNMRXpvcTJCSDZVU0lLQUh0VjFpTW1xZ21zOCtsakNp?=
 =?utf-8?B?OERBaWcrZDM2YmQ4dlorZHdtK1M4NGlQZ3RraVM0Z1M4cFNlYVd0Tnlab3NR?=
 =?utf-8?B?U1UrWWFIK0pZOXR0WDQvREI5VTJRZWs3WjNIZ1VhTkptbmViQ096QkwzVy9H?=
 =?utf-8?B?WWo2NlNNZDdybm45cFRveSs5alZtRURCRE5YR3JqTCtQYlpaRlpWVm41MjhQ?=
 =?utf-8?B?d1hPWG1KbXJ5ZHpiRjk0ZHZxOG1sT2RPc3c0S2VTMGVyVmtSdG5zaG1YRmR6?=
 =?utf-8?B?M3g4RE1wOFBqSmxuckRLaVZPWjMxUC8rcWZ0VGRqeGs5VVNZbHZudU8yMzFT?=
 =?utf-8?B?K2VVOUVUU1pXd3d4VTRjV00weGJ4TnVxZlhhdGoyY3NxaTBsVUlINmJKZmtY?=
 =?utf-8?B?SUJnQzg5M3ZMUHVYOW0wYThwL3NYMTVmK2grNk05Vktia2lsR3NaT3pkWEUr?=
 =?utf-8?B?cXJRTnhrdHpxWVRwUlFLRnhwUHAxeTFzckh4RXJrcEdSL21tRUlLdituUk1t?=
 =?utf-8?B?U0xUZnM5cXdEVGRwdElMM1NsTkdYV2U4MExlUk5FOFA3R3d1OFIvdm1WeDQz?=
 =?utf-8?B?c0NSYllrL1Z5emo3czEyZ0c1T2wxVmRCMk5ibkNlck9FamhtN2lyRTJGS3U0?=
 =?utf-8?B?MVZyU3JNWGQzWjdUMjdOSW9Ga24wYjg2RStmZWpzVUVTSENPOUF3VWJCY3R2?=
 =?utf-8?B?VUdPSVFDZW1Fd3dsUE4yRlRhSWNFRlZkWExOeVo5Qm56dDA3bk5selpCa0h4?=
 =?utf-8?B?eDU1cDFneTQ2VjlhUmxrVm9abTR0aU9aOFRNZHFLTTM2UE53d1g2YnhCcXp0?=
 =?utf-8?B?cE5JdUk2TUxsb01NUWd1Vm11ME40b1Y0bFhKaWhLSm5yaWU0N2diQWdrVktI?=
 =?utf-8?B?RjdLV0Y1YXplT2lqVmt6b0JOamhCaGxmN2w0cDJnZjJuZVMvSE0zWE11L3My?=
 =?utf-8?B?TU5BQWVjZTAydWdoSmlWTWtXL3QrRzFXUUpKc0x5cEV2Y1pQNGc1WFZvODVE?=
 =?utf-8?B?UzNLbzlyQlU2UjU4SGlIRjFKVTBwbjBzZDlDZzkzRGdXZ21WUmFkYUhLRVhI?=
 =?utf-8?B?WHF5N21lcitXKzVYcGFWU0c5aVp6VEJXWnNodHdZdlpFQThWaVRISzB2SmlI?=
 =?utf-8?B?elBrbDB6S1RtaFFFUHhDc0lFRThhUmhOQzlRK3dYRjhHZFBPWmkwNUxNODJi?=
 =?utf-8?B?MFBzeVdpamppZ3JmQ3hiMGFRQk1jNTEzS3BZaGdIZWVzWGhoaHdGWWtrVUVV?=
 =?utf-8?B?L2RMOEVZWEl4bGhxeDRyMDNZYVlCR2tRMms5TjQwUERRaW43eDBrdVkxeFU5?=
 =?utf-8?B?aHFvV285S3BXVEVWOVI1WlVOWEdwbi9pa0RWWWYrU2szL1d2TytkNmdTOUdr?=
 =?utf-8?B?Mkx5OERwTXdmb0hlUTE4dUxWQ3V2ZVNHS3RMOENvWlk2MlRHVnNkNEdRaElD?=
 =?utf-8?B?WUtVZHFIZFdPT0d6YXc3WnlsVFRvN1djZ2RqcmsvQW1qSm1pMXJQYmNmZmxS?=
 =?utf-8?B?cklYKzRSaVkvT0FUdjZ3VFpsTW5vZWpiWGtFamV5Wm1ZRU1Wdk4zRlZKRG5n?=
 =?utf-8?B?T1dueVIwd1pKRWFoNGxqR1BuWUhnRDRQNGV4OHNWTnNPSDBGRWhibU9JV3NI?=
 =?utf-8?B?cWdFQjREbVA1Y29Wb2ZNblpmTWdtMEV2VDF3aDZoaUtiU21SblkzbHJ4RUEw?=
 =?utf-8?B?bXZuSFRWazBmTUM4aWhFVFR5NGIyaEtiT3RCUE9ZQXVVUXplSlV6NlR5aWdu?=
 =?utf-8?B?UVp0TVFFQmtUV2d0Y2ZrSkg2cmN2emlYSGl4TVJwSTFWMFlwZExQb3FRRkw2?=
 =?utf-8?B?RXlFWUJUWWpQTEtJNnp2ei9lei9qRzl1aGpxYXJ6KzBaTXhqczN0R25UNGFT?=
 =?utf-8?B?NXpnb0poRlQrZ2pPZXJzbmVqbmFkZTNjYm13MXlSekhYZjRDYWdhdHhWNHJ4?=
 =?utf-8?B?TGpFQy9jRkNFSXEyTDdZVlBPSmVjNjZzb0t2RTd5WTMwSUhwUXZVTms0Tjg4?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf2baf3-4dd0-490e-90c0-08dd612cad59
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 06:11:07.4699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMvXFoOk97wtGdroocMn/dcfYFdoLJC1KukDk0WdyTvBYUg/H7Q7N9Qmta0zJk7285pKZkJbIf/2zhuOJ6JwIgUsE9Nwh93S69AvAtIAd9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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


On 2/18/2025 6:33 PM, Swati Sharma wrote:
> Instead of repeatedly checking debugfs to determine if a panel
> supports DSC, perform the check once and store valid outputs (those
> that support DSC and meet the required constraints) in an array.

Makes sense.

Patch looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 32 +++++++++++++++++---------------
>   1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 5508e7a9e..3f1c93094 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -73,12 +73,14 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   typedef struct {
>   	int drm_fd;
> +	int count;
>   	uint32_t devid;
>   	igt_display_t display;
>   	struct igt_fb fb_test_pattern;
>   	enum dsc_output_format output_format;
>   	unsigned int plane_format;
>   	igt_output_t *output;
> +	igt_output_t *valid_output[IGT_MAX_PIPES];
>   	int input_bpc;
>   	int disp_ver;
>   	enum pipe pipe;
> @@ -262,32 +264,21 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
>   		     enum dsc_output_format output_format)
>   {
> -	igt_display_t *display = &data->display;
> -	igt_output_t *output;
> -	enum pipe pipe;
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
>   				{0},
>   			    };
>   
> +	igt_require_f(data->count > 0, "No dsc output found that meets all constraints\n");
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
> -	for_each_pipe_with_valid_output(display, pipe, output) {
> +	for (int i = 0; i < data->count; i++) {
>   		data->output_format = output_format;
>   		data->plane_format = plane_format;
>   		data->input_bpc = bpc;
> -		data->output = output;
> -		data->pipe = pipe;
> -
> -		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
> -		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> -			continue;
> -
> -		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC) {
> -			igt_info("Output %s doesn't support min %d-bpc\n", igt_output_name(data->output), MIN_DSC_BPC);
> -			continue;
> -		}
> +		data->output = data->valid_output[i];
> +		data->pipe = i;
>   
>   		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
>   		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> @@ -337,15 +328,26 @@ data_t data = {};
>   
>   igt_main_args("l", NULL, help_str, opt_handler, &data)
>   {
> +	igt_output_t *output;
> +	enum pipe pipe = PIPE_A;
> +
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		data.disp_ver = intel_display_ver(data.devid);
> +		data.count = 0;
>   		kmstest_set_vt_graphics_mode();
>   		igt_install_exit_handler(kms_dsc_exit_handler);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
> +
> +		for_each_valid_output_on_pipe(&data.display, pipe, output) {
> +			if (is_dsc_supported_by_sink(data.drm_fd, output) &&
> +			    check_gen11_dp_constraint(data.drm_fd, output, pipe) &&
> +		            igt_get_output_max_bpc(data.drm_fd, output->name) > MIN_DSC_BPC)
> +					data.valid_output[data.count++] = output;
> +		}
>   	}
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
