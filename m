Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53259C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 05:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E2510E092;
	Thu, 13 Feb 2025 05:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aCR/mH0m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872C410E092
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 05:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739422830; x=1770958830;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=XeJnGuLjpVlxc18+oKT3hYqSIu6bqBYEDjGeXWbIkSY=;
 b=aCR/mH0mne25XNledQDCJYoeyN40RDWdo+VyVslFO0pXI4fv8YZ15W2m
 lPIuikXTGjXLvRX0rzO9Wb3ThwWUGYTMRcl2xCaAysIEaH34P6w1z77am
 /gY8Wh+Ho8zRSOoisAtYCLNF5YVOAhiy2ok8PmBtpZSHH8GC7zl2GPanr
 3ZtuN5cq7jbvt8nRFD94j73nYjZofJXw4U+arXh3sqJ+riCYDX6BPdcNs
 YEn+TAUxu+BkZ6z2WwzMi1YEL8ADfeoJAssiAW3waH+fY9ausXi1Igke/
 7FVo3ow4R0KfM/2HuRvWP7zNz6IXnxiaTze2HkwvepHcwoAgVF0+rRE4p w==;
X-CSE-ConnectionGUID: qkdlBESfSQG4Zwl5kAl+yg==
X-CSE-MsgGUID: MHRq08p6QteyegNQx8EmfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40260349"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="40260349"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 21:00:27 -0800
X-CSE-ConnectionGUID: iZSQ2613Q06mGMN0n0k0Jg==
X-CSE-MsgGUID: B74HmatmSzizCACjmW/5HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="113225112"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 21:00:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 21:00:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 21:00:26 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 21:00:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dY94mgdIO0AYmya7cBLBHpGvLUs0yWaxOMP/aHbEtsqU5BaGczEtuxIaMYwrCR0gQnOKwzWBJx6msa3MR/EnH0XTLniFmSahmSuQIaPydb9GtSDN8WLISghtqIXAyIkQPzy/KliaVJuhql3Lt9t9smEd8lpdgpfEmQzgBA1k9JquBIh9UUZBxQljAySV8cQJOsLwo2gDzd59EGoPLb/5iJEYEqVZdnVerjGCgKPAXDSP8WsVaSPDpYCdVRL7pPL9k42/3k47IPMSHGgGUvrpwRifnEjNK4crXRm7hbj5SnzKWuHxgsaXIzi980uYBpBnXOmLI1zbPRa4Z/N8HuurSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtkF5h5JhKiITGrB+QREcs7w6noL+8KT2c1Hk1csIl8=;
 b=DKEew2WBuKzCzl0Z3W9tc0Lb7rx/tclqHCORmFll83pL+kS7ZlzLalPP9ewzFYYGW6b3WpTvDW7OqV+975fuYEXRZt7snynUYRvEwdYxIwKQOUoyhDlxdeUa3Pxp0gih3taaK1fb0qY4V8AyiqBBVFK7ypU4UVYHAruTFCMd7pdKKJ1Gq9b+j6htKkwGOJBGZYC5LQUPWL1vMdzVxIJLHfzoVFQfRPEkyjtqKcIBhpuyzqOGnN2w/kjUnfmzS5pKN6SHchMaBDujUShGwwHf0FiOdaXHqiKlJm9XHb6KVN7XU0bqCINpP/FXwvVuv9fY3ipC6cRi+mdqpMUIZ+rNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB6217.namprd11.prod.outlook.com (2603:10b6:208:3eb::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 05:00:08 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 05:00:07 +0000
Message-ID: <9f63b2f2-1b0a-4079-aa0f-efe8cf8404e1@intel.com>
Date: Thu, 13 Feb 2025 10:30:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/7] tests/intel/kms_dp_linktrain_fallback: refactor
 find_mst_outputs
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250211180542.1430676-1-kunal1.joshi@intel.com>
 <20250211180542.1430676-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250211180542.1430676-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 1080afe8-6eb1-4a9d-aaf0-08dd4beb493c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dStrV29pbEFGdFQyTmpjRTRkWm1kd2IxcWkrcWkvcjRGZFhxTWJPZmhvT1Iz?=
 =?utf-8?B?MG82ejVaWEE3eHQ2QjcrbVppVVVHVlgyUE92RU9NRFB3YnMzZEtLUjBwdm1F?=
 =?utf-8?B?cVFzK0hlMCtBRCtKNzMzRVFlbTVZSEQ2VjVMVTIrQkltVW5lSWVDeWk5VnFE?=
 =?utf-8?B?dlZIZUNSNDVZRCsybU5YWE11M0lscEZzbDNCKzlsZ2U5ZGdkd1lWZ2F4U1Mz?=
 =?utf-8?B?cjVmc1RBS09Pc3RVSTdwY0lONUFJRnVtNEcyS3U4MW5ZR2h4M080SzZsbktt?=
 =?utf-8?B?bkd4NE9LR3hiR2gvdWhFSlBWbWk1UFZ0THdJMnN3dkpneDVDaWZVM0pKaXdS?=
 =?utf-8?B?T0JYSmtzeUIxdmNSR2xUTWttOU9TcCtPMHdXQ0J2ZFcyRlB2c2dEWVJlVm8x?=
 =?utf-8?B?bi9MM3RuS1RlbWRlbHVDU3hOd1pYQldmTFpoakI1NmFiT1RrTk1zUWRBemZo?=
 =?utf-8?B?VGx2R1B0a093TnlYRFVWeEU2OEZiSXluSWs4VjFoV2UzanF0b09EallHVE5V?=
 =?utf-8?B?SWlTMjhFeDIyaG02cTVKTlhPQmVJaldLOWtWVGQ4U1BvdUtVS0lXL3hrN1Zo?=
 =?utf-8?B?cjk4YlpsSHNpTHpNWFZYanZSNE02cDMzaW5Fa1FvRzhkU25xeWljT3NLbVM4?=
 =?utf-8?B?OU1kcy9Eb3IvTEhqQ3JBVzhESEo5WEdRM0JiUXMzUFRybDFOd0FBV3VLNnNu?=
 =?utf-8?B?V0EzcDhyUVdtTWJsMG9KN21ITk02MklXcjFBU3lxcEZqREVZWDRHdWVaZCtL?=
 =?utf-8?B?YndmTno3L3ZNOW5HUnBKMjBUTGlzMW9XZ3ZtQ1dRWW0rY3M1VU85NEZORGl0?=
 =?utf-8?B?VEVwRHVGdUh2Q3k1emFZTnhTaEpuallBbUtJM0F5blFQS3JWeWtjZWc3UDJQ?=
 =?utf-8?B?UWwzSFRCRnhnaE1VNHpOelFjaXJaNXZvYlc3RDZLaVdQSk9FMDRYNVhMdllW?=
 =?utf-8?B?K0p5anBIbkxkRDdNaGJmMEJPRERxM2VCY2hmeUNQL21MOHVucEZZZEhkTFo0?=
 =?utf-8?B?TlNDQm1xUHlnclFLRUNZak1pdk5qZWJVc2h6a3kydjJTUnhnbFRVT2treTRG?=
 =?utf-8?B?MjNjanFzcVhmRlBONnBIWk8xTTl5MFBKMU1GejBRRkpZREt0MmhMRW11NHdp?=
 =?utf-8?B?bnQ2U1EvOVFJcy90YThGWGVTTHd0UTNEVDRUSEhCdXBjUWxta0EvM1VNbTVa?=
 =?utf-8?B?aGRNSjJrQUJMSGlJSFBORlhCL0ZqTHcyVzVsd3VldDFkcFJZdEJYOEl3SGxN?=
 =?utf-8?B?ZUJKUm1sblVmaDNPZkhwYUxjK1d2OW83N2FyaGIzYkRpZ0RFZ0djajgvK1JW?=
 =?utf-8?B?TTZZL0VTTFBKTko5VGtPVUd0UkdicGczaTA0ZEhEeCtlblRZbUpsWjRxUW9T?=
 =?utf-8?B?WElHSkVFQUxwS0V6Q3p4VnM3UzdENkFmNW8yL0VhTGMzTWhvcU5SQjZ5TERu?=
 =?utf-8?B?c1BwT21sdkJoS0UvdEZ1aVlqbnd5ZnpWLzNJTDlNaVZaYjNxZmFYeVY1QUhp?=
 =?utf-8?B?R0dXL3Z4ZXljeW51aHQ0VDVYNWR6NlJ0cEwxMWdvaklXT0NDT2t6dmxSLzNJ?=
 =?utf-8?B?VTJtQ2tWOUwrcWkvNk1tNnVCQjJXb3Zzd3V2K3I1emVFZVo3a2FVVE5tZnNT?=
 =?utf-8?B?VFo3S2N5V2ZrRUNpTmh6czBBRkF4L0lYQUd5TjJhYXZRVnYySnl4WDBFMlNB?=
 =?utf-8?B?Y2JubzBqYkNSQW01Q0E1RmoxOGlDZXlDSCtiTW5zeC84Zk5GQlhYVXZlK1BD?=
 =?utf-8?B?eElwVEx3RXVSelpIQnY1cU9yUGxVTk93MHR6c0p4aElqWE1xYUk1bGpvOEh1?=
 =?utf-8?B?elJqeU5UYnVMLzl0WHNGRHZ3bG14VjJPQk1uREVKTEdFZHM2VDRpbm82dmdM?=
 =?utf-8?Q?zOCEzSL4nNp8b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2UxdjFFNjFldXJ6TUlpRzNWeFN5TC9mOFVONzNwUFBBZG45bnFIZFBjVEhr?=
 =?utf-8?B?Z0VXaHF2R05lb1FuOFdyNmlRZE5hQmtWdjZObXpMR3VXUXV5QThXeHB0cjRD?=
 =?utf-8?B?SXJtYXZMUW9zdXR6NnRlVkV1aFVMYVlIZVZ6d3hqeXBmbkpmL3ZXbnd0S3A5?=
 =?utf-8?B?NitPaTcxakl0Y3puVjdQV3BGSFpiOUFNWFF4VmdTc09zT1dZSFBvWXBmTDZW?=
 =?utf-8?B?bHZ2dExyQ3RxNVZpREtqODVEbHlWaXdTSllBcy9FS0ZpWnpqbVQxdmxSTEZU?=
 =?utf-8?B?YmliMng4MnJ0bnlTdHU2VGVIZnYwbTJxKzBXWEtHZGZ3OTBOWDdiWkZCVnFt?=
 =?utf-8?B?ZEVTQjVYK2owODRxMGo3UHhEUkQrc3dZUGxKcGNWbnJDbk4xckhPcStqc2Fo?=
 =?utf-8?B?d1pFZmFiUHdRRE9tcmxqcjJ5VXBKWHEyYkk2ZmxpdlgvYlRhWGx3NWl2NklG?=
 =?utf-8?B?T3U2S0trNDM1LzRjSjZpM0RYKzZETmNhSWlKb1NzdjJ0dzdFVDh6WWxNaGo1?=
 =?utf-8?B?SDRveVB1UStYS3dITzF3YWs0RlZ1Z05pNXJoTEE0dUpGWHNGUlZUek5PWW1S?=
 =?utf-8?B?MmRTL3g0aG9QVEFRUisxRWVqUzF6YVhpVGY4MHdQbHMySlI3Y3hpWFJleFdR?=
 =?utf-8?B?djk5Q3V6MlBIL2UzRmdrbDJ6SHVnSjUzbGxpcVdLYUlNZWlSemtOVnRPZ1NZ?=
 =?utf-8?B?RUxqeUQrTWUxUitVdS9uN3FQQjhseDNqeTJwdnFBcmUxelNpSlJuYXB3Tk92?=
 =?utf-8?B?WFJCd2l6TDNhOU9adGRubGJqNm5vQUkvRVdnWkZ2dUZzUVZ5L3VsdTNXM3hG?=
 =?utf-8?B?K04ybU9yNGo1emF0M2tTZDFDczgxWUFTVEJmblBFdlFGa3VZL1l2TXpWU1J2?=
 =?utf-8?B?ejFrYTFOaVRjSmFOQnVyQ3l0bGZ0cXpoZ2RRQVFXNnh2RXBYK1ZCTnJrdUJS?=
 =?utf-8?B?Ly9ML0lnMDJ5OCtmS2tIQW9ycUpjVms5QmhFK3ZsdFY1RlpydGtkWDBidXZI?=
 =?utf-8?B?eERDMlU2d3hKZHJBTmtsT01ZOGNFMFdiOWNYN0hUMkZmVUFQSlp1U3U5M0pD?=
 =?utf-8?B?UEQvV0tJV21rMDVMczlmUWR2Z1BQUHpjUlAxUlUzMEV3REQvTTJKMVNyUEZI?=
 =?utf-8?B?d01TYXhrbktXa1VZNzEycFpERlhmTXRxL3ZUL1NMMlYzeDRDYzB6blR2T0dQ?=
 =?utf-8?B?Zkxqeks0V2FWVDhoczVveFhEWTZTOFhUeFlDTnFlTXA5T3NUUG11SUdJOVpV?=
 =?utf-8?B?cWdqcWpWb1JEUmJJN2lBcTBXQ0pjcUJrL2hOWmJhY3oxbTRmOVhIQjUwdkVm?=
 =?utf-8?B?Qm5ORjZwS1ppVEE5YUJBb2RIQWF4eElxY1RkNUJNZjNZUHdvb3ZNQ2xKUnlO?=
 =?utf-8?B?enBFU3dvR2Zpd2E4SlgrbGxqdzQyRm9MaEFuMlI5cVUwNmVBSWVNTEc5QTNK?=
 =?utf-8?B?WjRsS01zYXNheVcxb015VW5YN3kyaTlqaS9zV1R4cGp5MG40Zzg1ZVZXZHIx?=
 =?utf-8?B?TGVxVjI2RzlCbnZZRmFGSzV3VEMxWGliRXhsRnluZkJRVG8xOFl1bzZYNDRz?=
 =?utf-8?B?djBQQzloOFJVUnBXZUJUZlBZVHVTMjF5elpSNExZUEFvZ05Ha2o5bmRrV05I?=
 =?utf-8?B?RWtSbnVTeHIzVmsyMkttYjFWaDFvcGxsUkgveTJiUW1FVW1vbytrdU11MlB3?=
 =?utf-8?B?RmROTzN1M0pZdXhEUEVxbDBweE9qd1JYTGJCcCsyUy9JY2FmaUVkbllxR1lO?=
 =?utf-8?B?WFI4Z0lOdmQ5eDRYZG1KTi8vdEI0ajJqaDcvS0ZEN2ZvMUVrU25nYTFONWxY?=
 =?utf-8?B?MFljT1NtcnluRjJaQWQrelJReWRZb1dya2dlSEVnK1NIYlVDdWZ6K1BFdGZP?=
 =?utf-8?B?bkFBMWR0VzdtdzlZbE84aE92VDJjVDVSOGlwQnRRZGJ2NkowbG05WGdDYXFB?=
 =?utf-8?B?c1RBdEQ5OEFKelhDTEJZdzlrNmxPdFAxTTZzTU5kSkY3ZUJ0NHJqZzZ1clR4?=
 =?utf-8?B?aU5iRlRTZis5NWFqbmlIS29BNWFDUEgwTkd6NlFRVmVxK1BQNUgxSHJwb0tC?=
 =?utf-8?B?cWtqKzFiKy9uRWQySDlnSUNSL3ZXejgzaE9CbGJqSk5CVmhqQ2tmcFVPREVo?=
 =?utf-8?B?Q2hETU1BVVhxTGx3dVJONzd6TWl4ZHliSnhpakEzYXdVZU5vZ01KQVVxOWxF?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1080afe8-6eb1-4a9d-aaf0-08dd4beb493c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:00:07.9121 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xGZWIzTY+NGLFEiVKhGeihLvu+YzuPsTlA1JxyadTcj9Wz7GilDo+xxFmk1xMAkcc0jALvv2r/11X50iOxFYGGmZrldZ46GT1eJkp4huKb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6217
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


On 2/11/2025 11:35 PM, Kunal Joshi wrote:
> refactor find_mst_outputs to improve error handling
>
> v2: change return type to int (Ankit)
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 23 ++++++++++++++++-------
>   1 file changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 415005774..edf9409b6 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -47,26 +47,33 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> +static int find_mst_outputs(int drm_fd, igt_display_t *display,
> +			    igt_output_t *output,
> +			    igt_output_t *mst_outputs[],
> +			    int *num_mst_outputs)
>   {
>   	int output_root_id, root_id;
>   	igt_output_t *connector_output;
>   
> +	if (!igt_check_output_is_dp_mst(output))
> +		return -EINVAL;
> +
>   	output_root_id = igt_get_dp_mst_connector_id(output);
> +	if (output_root_id == -EINVAL)
> +		return -EINVAL;
>   	/*
>   	 * If output is MST check all other connected output which shares
>   	 * same path and fill mst_outputs and num_mst_outputs
>   	 */
> -	for_each_connected_output(&data->display, connector_output) {
> +	for_each_connected_output(display, connector_output) {
>   		if (!igt_check_output_is_dp_mst(connector_output))
>   			continue;
> +
>   		root_id = igt_get_dp_mst_connector_id(connector_output);
>   		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
>   			mst_outputs[(*num_mst_outputs)++] = connector_output;
>   	}
> +	return 0;
>   }
>   
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
> @@ -83,8 +90,10 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +	igt_assert_f(find_mst_outputs(data->drm_fd, &data->display,
> +				      data->output, mst_output,
> +				      output_count) == 0,
> +				      "Unable to find mst outputs or given optput is not mst\n");
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
