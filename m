Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2E9E6816B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 11:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBC410E21C;
	Tue, 17 Feb 2026 11:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TePYFqqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F9C10E21C
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 11:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771327741; x=1802863741;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6M/HeJOeFrwLqJXVv6vPLRFXpj1Fme3yQ5+9WPTEhQM=;
 b=TePYFqqptQfvIQkD8au1TfM5cv3sMpPcDVq2gWDk/4MjMtPpK+2ygG9L
 j5q4luqJZHLQu3clpuOflsJcfCKkcgQj4cSoTF+ukWdunY2W5vxnuVa4z
 stYOevHxudcFXlpJqgr1abKDwLZAb6hsyKDVO9Cl7aYf11m6fIhCReITZ
 Yij3n6uZRkOVwCdzSfAo0ibFvD67kOOUvQ7pmFZo+OtW7OaoJiKH+CpaZ
 0BUJXoeV85Zf7xB5FtQCypgCJmS45V9rePIkF3PhxG4rk9DCQBTon1V7S
 KbNsXFN7/a9c6WGup6BCM2++uy2sUec8J9mTJOvyQDXUzXeD4urBc+BZD w==;
X-CSE-ConnectionGUID: hjPIrqR6RzaJc0Ym6wEBtA==
X-CSE-MsgGUID: I4OAcTTySuKV6AuO50HAXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83493745"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="83493745"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:29:00 -0800
X-CSE-ConnectionGUID: a81DbstsQ0CyXRGaSc6GYg==
X-CSE-MsgGUID: IvrmVJuuRh6yqM/eXFmsdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="212584953"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 03:29:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:28:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 03:28:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 03:28:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMSjtQ9zVLoN++MT1fPXUKVY+1gXg+Fsz8y8kp/5FTOvrshL/D4uh5kqlMCQMPmvZmOOCMeyxVcbRTWAVaWJl+KH+SKcC+7fY50hmqK8dV999r89DhhwEIdmnu9Wi0ZOTE0TnbZoWYC+NQ4B9itq083P+T8020O79VOMLTUGrBMzZoyYEVcTzs4iN6vqQv60htfcI4Eegb6eZItR1PR8L/abUvB1dy/W7bBMX3GADSpo0oEysPBeZezJnzULkQDggu6EB0MeTrY5UpXySoJQvy9n4MsgxDdKeqSkOJtb144Cg87zD7mXWCs6IL3ckKdVCvNU/7hJGdF+Zwzf+nzCXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxN75qqTuc2K4qVu6sa1NQuEXsVLZcq+Yw0SKsyAKVU=;
 b=LPiesjgHZtT7/ZGFOfLOM04wHg5oDMcRdugGLfpsIPGTGhCpA5BH6M2miCnJOFsL72wz8B0XQXTGOX7HlCdEt/Q2gDHneGagDrsumJEchLroNjoLyHZB9du3tZWYN6Av83a8PcOK9cgWVg8O9BfN6f25gRSsqLtTFYQdATmTViUALRRK7zCOgzs7K2hgmlOm5q2Bg3ebIsyqJO6Ju0BmjdcsRbcCfso7wvVHDPkL+we9DTo9QhOtJEzj6/0ZfF4ARG4ijoAuVCmD7ZyPIRJyFmVno9Vkcge3tsziIc4DbyddyEu7OIK6ythlewcIJBOPWxWNvDZ17d1HlU0WPI5eNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 11:28:57 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 11:28:56 +0000
Message-ID: <175512e2-00da-4c70-8d34-fa25fcaaddc1@intel.com>
Date: Tue, 17 Feb 2026 16:58:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] intel-ci: Remove chamelium testlist symlinks
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260217091838.2508942-1-mohammed.bilal@intel.com>
 <20260217091838.2508942-2-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260217091838.2508942-2-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0182.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c3fa1f-aea6-4ea5-3d84-08de6e17bcec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1BYcHVCTlZJTDRoMWI0dWdFM3J1ZWdoMXRyaCtwM2ZCbU5DUy8zYkg2WXB2?=
 =?utf-8?B?cDhNNHdNSklUdFRNWkgyVWNxZUNJRFcrQzdacGV6bWdvUWVHdkk0N0Z4SVNG?=
 =?utf-8?B?Zm5CNks4bHZ4cDZVamtaYmtXKzdWM0VMZ1d5bDlrV291eWYrYXBSR1c5anBv?=
 =?utf-8?B?QnJpLzZPdFRtZXVuOXN4Z0R1aDB3dW1Nczg1SGpYS0hrTEFCaUhLMjFYdENx?=
 =?utf-8?B?T0FFR0xmTnFMdGxzVXQ4WkluZkoyajVxZE5CZ3psNGxaUWtwd1JHdUNjMnpQ?=
 =?utf-8?B?aXlvRlQveVEwQnFyQzAvdmw4VGhsL2xWTk9Eek9DY1FkeGowdXcvK3RIZ3BP?=
 =?utf-8?B?UXlPWDJISTdZOWw4dE90YmNjN25hK2RCaU9SWmVoV3F2dnZkSWtGZmJqcjFW?=
 =?utf-8?B?L0Y2L3hnWUsxblVobU43ZCtoR0VKWmdGS1dOaTYrWGlvYkkzcUZBdVRiZWxO?=
 =?utf-8?B?dXBIUWpzWSt4Mk5mZm13Ry81dVp4SWdudk4zWGhPQk5tTFFuZ3liWFNzc2xM?=
 =?utf-8?B?VmFCeEdXWkFNQ1RXMjlvUjJaaEc1QStQa2dkTmM5WElUbmViaStXK2NrQ3ZB?=
 =?utf-8?B?WUwySFNxbnU3VFRIbVIySUtsMTVrcTFmL05TbjVJM0VMNFNsTzRhUE1WYmwz?=
 =?utf-8?B?dzNQV2VkZUhreS9TWFhDU244KzhCeHBtUEtOZGJFRjJyb0FjaFNRTnhCZmxv?=
 =?utf-8?B?aDhldXFwektSalFKL3AvTFBsdk0zMjBNVStTSVNQNFp0VG9tcnN2NFoyanJS?=
 =?utf-8?B?Um0xNG9ISTBJelJFUlFtd3BuMXp0Z1hGd2w0eUVUcnV4a0dQTjlFTlYrK2t2?=
 =?utf-8?B?YUJFTi95MHppakZ0bkg2QmZRSm9JeXpna003cGRPK1d1TGdIWmF0a2ZFcGtq?=
 =?utf-8?B?WFIwMVVyTGNiMXNFWVpSMmJ2ZjNETTV2UFM2SmpQYmtIalhXdXdpalBBakRF?=
 =?utf-8?B?NTM1WTVPMmY3YkFCaUx0ZXMzK2FFN0RLd1FwLzZLbFEvMUJsMlptWlc2M2U4?=
 =?utf-8?B?eXF3eUtsd2tJYjl1bExPS3BLTFJaaWl0SU9OUE1sR2pMY2J4T2RkZkdWOFpB?=
 =?utf-8?B?cnVuclhqMnNsVGdYOWJybURreGtFTEJ2T0ZYSmRoTzZvdG5DdUFyeCtrK2lh?=
 =?utf-8?B?SzJiTG5aM2h4aFJkL1hxV00rVzFiK0FEbGFrNHFSSHZHU2NTZmI3OHVRN0xj?=
 =?utf-8?B?WW9yZUUvcVNIZ1NDSG5FMWszZWhwZjM2dEI1cDFoSGFNU2JBTGQvUkl5RzJJ?=
 =?utf-8?B?Y1o1SkVvTmF5WlNoS3F0NFB1VG1tUEEvNVE4NXBoaHMxNndaMTRGbTZjWHJh?=
 =?utf-8?B?a215Tm9kZlkwU3R4M0ppSHJhczJmZWJ1eFpndTdPVzhYSGNJZzRCK2pyOWVC?=
 =?utf-8?B?ZHptaU5GUFg1eThMMkhkejBlWDA0SVZJSFh2YTVGR0ExMC9wZGg4Q3Q2U1hm?=
 =?utf-8?B?OE5IYWpSUkM5aGc5VnJEUXE5LzkwMHNWNzJiTGpSQ1dhY3BxYVZpalFWa09K?=
 =?utf-8?B?NHBmVmQ0MEdiTWZreGUxZG55aEc0UHZ4QXAvZmRIMmtrMWJSUG1WSU9hZTla?=
 =?utf-8?B?NUtuVEJ0RE9VdGhnOHJsV0RJVmZjOFNQK0NTU1l1aVJDL00yQU81SjNoT1kr?=
 =?utf-8?B?WEVZQXJWcHQ3MTYwaVdZaVdpMlM2T3p0Zi95TnZrQ2I2cjJ3STRES2R4SHVT?=
 =?utf-8?B?RUVXWGVUNHV2YWVURnNZWEtUMDVEbDdXUlYwd3hkczN1bUFJdTVJNFhqY3Qw?=
 =?utf-8?B?eHQxRkpqNW5lL3Z4aTU0L0pGQzRDMkNZeUoreFkwQ0Vaa0x2WDNvZGtPcXpt?=
 =?utf-8?B?L2NSVmdBUzY3NU50ZVA3R2xZNGMraTIycllEdmZJOE5kT2JjWWlwbm1uclFl?=
 =?utf-8?B?WE1aeDZUemU3MkR2TDVXMUhPdHlaVGlWNlZhSFFVcUZHdi8zeG1NcDREelZZ?=
 =?utf-8?B?L1JIWk1EdHYzeDdmR1h4U29QZVViMVBWV0E4c3Z2Y1JyN1kzNWp4eFNmeCsy?=
 =?utf-8?B?V0ZBUHkwWFJxTlB6QWszUWxJWjN2dTgwMjJrSDFzMUlnTEI2Nk5Mb0VBTGdJ?=
 =?utf-8?B?UzY5QndpVTBGR1MwSENzQktwRy9IejNtcTRmcmxYaUZSQ01yQS9jT1BZL3VF?=
 =?utf-8?Q?8fww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUlqZlMvVUQzUVBBZnpnRlJiTjhrU3pKTXFYdDdpRjdVdTQ3MDZ2dmpmOC94?=
 =?utf-8?B?TjdKcTg2M0VXK2htRXNLUkFMN3JLdjNxY21BWXlRSzZONC9LRVJhWFVKQVVE?=
 =?utf-8?B?YUNLUnllMk1xdEZSWnB2cTNsa0JPN09PNlk4MXoyVTd3QXRMQlRCdUJOUEMr?=
 =?utf-8?B?YmFpdGNpM0NZSFc0UGlpbkhIYjhjTjFmSi8va1NpYjdrcm1xWGN6OXVETllY?=
 =?utf-8?B?WG5GVkdLVzFlTnNZVWNiMEZJTWgyUFY2OHhRYXhyNllZaCtzT3hXRW5OUTMw?=
 =?utf-8?B?U3NNZE9tWnBlUjRlNFdnQUd4bVo3anAvcmdWK3IrT2tHbG5Ed0ZIUldESUZ4?=
 =?utf-8?B?SGtBamdDL2hEYWlUbEZQcEN3dmZ6VWVUOHpWdXAwSEh6TVlDd2dMSlpaUlJL?=
 =?utf-8?B?dCtBTTFZckxHRXdjUjlEVnFISG5YYmpCL0szY0NjV0Z4NVBYblAxcG1vbWlY?=
 =?utf-8?B?UHJwaUFKa0oxNW1tSmRtS080YUlkV2wzZkI1aHVQRStKRjJqT2xjMGQ4ZzFY?=
 =?utf-8?B?S3ZzZk5vclRJZlJSWWMxRXFIS2w3Zk1QK3R4T25yV1Y3bzRxNDdHYjhOMHpZ?=
 =?utf-8?B?TGs4Q0R4VlpBbFpiQ3FOTjZWSk9CdXBDWkRVcGFZUEhVWi83TzdHUDJyYUVL?=
 =?utf-8?B?bkNDcndnRFg4NmVOd3pjU1grbTI2WUtYY1dXV1h6R0d1Q0pvVUZZbG5RV0d6?=
 =?utf-8?B?dEdZVjR0TnpDZ0lLam5IeXY2bmpOVVBzNzduVjJMQnVWS3FXQ1dDZU9PdUw0?=
 =?utf-8?B?ZG5YSFRta1RKLzJEMGlnQXBnRmJBVVFWMXhUVEdvYnlKL2hDSjFzZ2hKSURT?=
 =?utf-8?B?VXV2VFNoT0dQNXl0WjZmeUF4YTZscFg2MHRJRlBMbWVvMGtTRENsWU1wMjRW?=
 =?utf-8?B?cmhpQzdwQTZ5QmhoUm53ejZHaEdHZ2RtcmZDRW8vVXRxbDlnalErbGhmWVJI?=
 =?utf-8?B?WE9VZExkbjYvR1hNQVRCdVY4ei8zeWYvWVpsS0MzWDVxQXlWK1A5Qmx3WXdF?=
 =?utf-8?B?MWJGdUhJVURhcVY3ZnFhK2hCblJXNi9vQ3Q3eWMrenBranNGT2tVMGhhTkQ4?=
 =?utf-8?B?d3hmMWthNFArNld1aU9hb0hKa2kwR3JsNjFhSUlxT2RyYWxRY2VkUnVnRjM5?=
 =?utf-8?B?NitXOXhIejdVTkhZTVhGRHJHTUVTNkloaTV4UmdIb0RzYXhoMjhxNW1WK0lF?=
 =?utf-8?B?TVNMQVFXbnBYK3BLSTFrd2pmM2dBL09OdzdxMFZiZ2NjTG1OZi9oK0NpaERn?=
 =?utf-8?B?YWFhL3NPaEpuSUprQm42Ui9mQVlGOTV2ZVpWOWh2Qk5SOTczQ3EzRGRqbVdw?=
 =?utf-8?B?S3B3TnRHZGxlK2s5SXMyL3Rwb3BtaFRGSXdjUDhXSURoVWdEcjNVR0lMaGNp?=
 =?utf-8?B?c0NhNTdaMEhkdXJlVVJRejlSeWRHTFJpaUFES1IzWmFvTFdqeCtqNXZNUjd5?=
 =?utf-8?B?YmozNjMxRjBXMHRnWGJuNnBLSzVYdUpxa29QQW5BbnNTSmlmanNSYmJ0clZT?=
 =?utf-8?B?cUg5NlBFanFsOXRjZ0xKaFBEdUJFR2xLUlBSdWR2THE2SFFKYTU3MnFLTDZU?=
 =?utf-8?B?QzBQbG50c1FscFFjL21iMytjZk1kRGhBMHpaQWNLQnJyQk9TNTR3T3A4QjNY?=
 =?utf-8?B?NitSb05PUjNQN0FqQmw1WGZteDdsb1N0b0JIOTNRMFgyTjhBRnhPVTRteVZp?=
 =?utf-8?B?RHRlc2tvWlp3UGVDYTdJZnNoS3hSNmk5eUtxQjRtelE1akxQRTRqSmF2aHpI?=
 =?utf-8?B?OHYzZTFVWUJGaE4vdjNlNmJ2d3h3bnQ5eG15UnNlSlFsTmpJc3RvbWpMeEg2?=
 =?utf-8?B?eDBUalJHOElCbi93WVJiM2dJNWV5VHY1TUN4SUh2Zi9WNWV5Y1oyMzR0MHVR?=
 =?utf-8?B?dnoyc00vUDdqU29xOEdTK2pJUjcySnFSKzdGd0RtbHRmZ0p5aXVuMmR5dEVG?=
 =?utf-8?B?dkJHZHVZdE5NWmtqeS9MWVY2WWQ3bk1KL00yRmhycFhnT1BGSkFPZGQ3Y2JH?=
 =?utf-8?B?bUdEQjRDRmxTcTBYb0V4UUtXZGpWcEZ4VFhnYXdRY0ViallXazFJZGoxMXgy?=
 =?utf-8?B?dzZvWlczOHhmSjRONUFVbE00QnI5YXdoU0gzSVpVOHlUaUlPY3YxWUdwUnJT?=
 =?utf-8?B?Y3YycEZpcWpPSkRqUWZJTXBQTHJtQU5ac0pRMUppUHE2b1RVNGdDOHJKek10?=
 =?utf-8?B?QUZXYVFKNFBKQld3TCsvS1VpRHZqLzJKZWI4VGxjUk1CVnFRNEp2WEJ6UTk5?=
 =?utf-8?B?c01mVWhEbVhjWVRQR0l1K3JtRjBOT3RpR1pZempMbTdrZDRzQXFPSnBmaW1E?=
 =?utf-8?B?Y1I3b1NwQTU2SzhOdXJDYWdHOGJvbWx4R2l5Q1lZa0thWWZDOUtiZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c3fa1f-aea6-4ea5-3d84-08de6e17bcec
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 11:28:56.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: guWqIqtEFuzjHQVeT5ZzqXF1DE5amiWxJysmGmqQ5kYCrFOybwctkKJiI0vr6bw9VyoIjsBYNVpY4YlzAKCMeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
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

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 17-02-2026 02:48 pm, Mohammed Bilal wrote:
> Remove symlinks before splitting into driver-specific testlists.
>
> v2:
> -Remove symlinks first before renaming (Kamil)
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/i915.chamelium-only.testlist | 1 -
>   tests/intel-ci/xe.chamelium-only.testlist   | 1 -
>   2 files changed, 2 deletions(-)
>   delete mode 120000 tests/intel-ci/i915.chamelium-only.testlist
>   delete mode 120000 tests/intel-ci/xe.chamelium-only.testlist
>
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> deleted file mode 120000
> index d7c492973..000000000
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> deleted file mode 120000
> index d7c492973..000000000
> --- a/tests/intel-ci/xe.chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -chamelium-only.testlist
> \ No newline at end of file
