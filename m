Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9990C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 12:06:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AD110E1AD;
	Mon, 10 Feb 2025 12:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XwmeyXEC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC4210E1AD
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 12:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739189181; x=1770725181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mFYyirOBJC56xCdTY1DIfgDnnKDhLRahpYS0oewlF/w=;
 b=XwmeyXEC/kU2xIQlf70cd8YlynoHb/SbQRFtmqVN2dishQuUKy616Zbr
 DzB8qPAYBL8c6zR0pBjjPHfA3aK7kwN8sRKlyXZ1V2azLv6ht6cQP4DuU
 PWOllUIVyzjEi0QuaKCrEDOvwVRyK8eMT0m/cvcwBMq/DgqaKRxcDqKPV
 CwzHj6PGqv1zrhxVpqd10Iu5IJVFqotz4l+O45mzXG2wxtTAyZxYzgWjq
 ZmypNCXOGaUBLpy3zOJl2MIp1ndav99d/tihPjjqMhr6g4zXdNEbNqzUf
 vXb7NdjlRehJ0eEG+1dlbKSd8bh/Z8rvlcZJGmJtwXcjEzozh/20akbdW Q==;
X-CSE-ConnectionGUID: Pmc13I2VRqepYmGea7Cw0g==
X-CSE-MsgGUID: /9rfAM9zQaecPUi1uTF4/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50750217"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="50750217"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 04:06:21 -0800
X-CSE-ConnectionGUID: Xhgq8xmVRjmR1f5GGSwylg==
X-CSE-MsgGUID: ZSdZqf9aSK2uBcmIr6YN2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112613105"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 04:06:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 04:06:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 04:06:20 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 04:06:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbypBDWvCxNZDMFuP828oYICDCLNhLUDpYHv2zEsOi32fFC3cfR+QowZ2j96XPAQndiVhLtMuAHHWDiJix8o1hZ+cvsvlLBi4cv+Ji111FXrFqAwfLnI+V7+55EIszciljO9Ii0UQWgjSj7V76wVc9BXT5S+JxNYopWJAJBid65sxpLSk3g2tKioCIWefo0Mc8gK0q4lXvZMDVg+JgL5ilWPPCbevsPdWIJSMEoac1R0/1vAY5ybCo7kHX0A3j79JZXrEm7umVVtKdGdrbGjfFZRqWEyQFctzoZF/ZK78hN3lbsEMWSTYw6oxAzONBOABc11hYgE/637c6rpM6BJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mjNHUoL821eFNIwARj3pTOYTB5FmxD7jy9Q1vYWk5E=;
 b=fO91kMee4uV+p1PhGSS8hW5+/ox7Jrhf0p6S34u3GwHNe0bweaohT04mgJLUEMNnvXFCYvIRLT2vmzOSsqJtAnRwJ4KjcxZsgggaFw0jsp1O0lVFSP1+T4UVw0qjIxRmvIwRz5uY5YiiAQjzmJtmsARMszrFIbnFp0+IxyDD9P5rXfrRcOg2yr0E7GetCCluoRtTBqfLndkMuzg3dD+sqHkqPIaFh4DZVG2Pccz8pQKHTpu+CbeJIX4RwUJJ5Ah3CjfmuTILrQQCSgX8SeN6+at6SnLbjujwLgcrjH08C7pRMP1rBHcW9tkpVRcIqFKwn8qlf7GSySyReS2VCciJTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 IA1PR11MB6467.namprd11.prod.outlook.com (2603:10b6:208:3a5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 12:05:47 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::a32b:dcc1:6314:b7b4]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::a32b:dcc1:6314:b7b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 12:05:47 +0000
Message-ID: <03447e41-33cb-4c5c-8557-c941e49669d3@intel.com>
Date: Mon, 10 Feb 2025 17:35:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/3] lib/igt_kms: Add helper to get encoder index
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>
References: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
 <20250128-igt-cwb-v5-1-82652cec29a3@quicinc.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250128-igt-cwb-v5-1-82652cec29a3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To LV2PR11MB5999.namprd11.prod.outlook.com
 (2603:10b6:408:17d::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|IA1PR11MB6467:EE_
X-MS-Office365-Filtering-Correlation-Id: ef362230-70d0-4d54-5215-08dd49cb4035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STVNUWcwNnUzN3pjSTVNVUpWTk9sTHVKb2VvUG9KYkRnMCsxSzBDeUFFREhW?=
 =?utf-8?B?c2w1UFUwdVN4RnUwNTh1R3NUV05OYVR1MzBVSnZaaTNlU29FQjNxeWtLbitv?=
 =?utf-8?B?dDZFbFoxNzZuSHVxc3A1RVlXcDRsakJobGRjYUE5dDNNRW93d1B2R1FPVGhF?=
 =?utf-8?B?NkNpOHJUcnYzQmdVTHNNTWlnUVNqWW5qMGt5SC85VUQ1LytFcmpQclZWUURS?=
 =?utf-8?B?MW9PTXhGU0kwOTNzL3d1bDRqZEJxcDg3Q2JhT21wUE5aRzZGbFhWbHFReFVZ?=
 =?utf-8?B?akFvZ094dXVoY2J4WlBUV3RDMmFheXNoV29LY0QwY1JKT0dtUXJUY21pekc0?=
 =?utf-8?B?ODFRdDRkTSt3Z3c1Qm1jTHVxczJkeXhwMFhHYTRuc29Rd2pPeWp5WlpyUFQ4?=
 =?utf-8?B?OThUNEFMUUkrNndTaDY0K0JVOWJMUVFCdmQ2MDRLQUtIdEVHR0JOSitKbjJB?=
 =?utf-8?B?a2tSZUdVL01jeUd6bTllcktBTmhJc0hnSndnYjFTRVRvKzFyUmsySEZSSTI1?=
 =?utf-8?B?bGhyaDkwdW9vcWZFRHM2eVQ5OWpBbzNKYUFHczQwbHdQZm9hMGFsUWhqd1M2?=
 =?utf-8?B?ZlRjRzR1eEQrNFhBSHloUGZrNFo3MU1iNjJ0VFgwU3dnallhRnNITjB2WStG?=
 =?utf-8?B?amJJa2lYaHJaL2V0TUI4cGMrR0RGY0VYOFozTG9yQ1lJczN2RmhzTjRGT3NJ?=
 =?utf-8?B?aU1IRUV5b2d3TGo2cXZVMTJ3Zjdldkl3Rlgxb2ZPa3N2UFZpZERmRlVXQkhr?=
 =?utf-8?B?T1RMQmxjU3l5U21YUHRiMHl1YUNuRFBzYkNNWTVWYzFXay9wY1pmS0hPN0VZ?=
 =?utf-8?B?eFQwNmM4VytvZzlGVTFBa0lTOGV2NXNVWldWdzVieG4xb0E5Q2VnaFNiVmsw?=
 =?utf-8?B?aGpEMjdDMzN1eHhTemN5K0FPTTdHZE5qbDg2d3hBNnNGSVB3TUFhc1J3T0lU?=
 =?utf-8?B?ejFxc3JKQTRuVmd5anVRL2ZxV0dnUFh0VENFWHB4eDhUWm5QeWk4aDZkcFpU?=
 =?utf-8?B?REJMVDFQRGZCd3BweUFhOFZQbk5EaGxCb0NxSExRaS90dGF5SFd3cnNsMSt5?=
 =?utf-8?B?bFZONWhFQkxJcTg1SnNlL2ozbWJSR09DQnBONTNOUDI2WS9lTHEzbUZqblpJ?=
 =?utf-8?B?WVhLdCtOb09Jb2hIL1lSMGZVTU81VFlxZ2R5eDdvQVNWU3p3MkRsZVRZSFR1?=
 =?utf-8?B?a3pSaG5oR2dBakhLSTBENy93TWRCTmVYQkFOQnl0eTl0QVhnRkNSajlRcmpG?=
 =?utf-8?B?c0RIbS9rcVFEWG0xazZrVEh3TElBZjNMVkx6clkrUzN1RFdPQS9va3l1TUd2?=
 =?utf-8?B?VndNUnZQcUNRbkhWbklKakNiVHUxN1pOdlNqaG9yYSszWHBVU093My8wK3Mr?=
 =?utf-8?B?NENoRVdsY2toQ1BhOVhIaUM1elIyandsMnNQVDN3MW9TcThUSGlFd0U0RDZQ?=
 =?utf-8?B?SytSVkh6bS9sbitKOWJSbW1zNWROd2dtcHN4YmRqbTV3ekMvM1krZWhvblRp?=
 =?utf-8?B?YXBzT2hQNS9KS2ExOXpRWVFOdUd2Um4xZlJ6aFhlbXlwNmlyWmJTQk1ya2VC?=
 =?utf-8?B?YlJsQWl4dm1PakcyZk4vUHpPdFY0cFhIVGJEM1pGbndmM24wNHpnWnd0MFda?=
 =?utf-8?B?OENqZ3ozelBVSWNwbXhmNFc0NXlPRjEwN0IrSG1ncnBONUdkZDRkcFdHNUxr?=
 =?utf-8?B?MFFmRUYzMUpNL2NVQThHM0kwS3VJMUhjY0hPVzUvWFlseVVZTEt6R0paZGc4?=
 =?utf-8?B?VWdwcFdRa0d5UWRIY2pmWUl2TWtQR0RKdjZMU0FZTjNIcWduT0J1NHQzMlJB?=
 =?utf-8?B?cm91cnIzdmNwRzcySmNxZjNDT2hPdlkxcVRzN1puUm02VGpPWElPaFNhRDdi?=
 =?utf-8?Q?wWIPYaYQhC7eq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEtKcDhrMFhZZXN3Y0hNdisyK0xQMTRRS1pmMXZ6YXlqS3JScjhFYWNPSXhv?=
 =?utf-8?B?UnFRUkt5ZERCK1Z3VmNJSll4aUtCR0g5YnBwSi8rOTlkbmtHYWZ1Q051ZUlO?=
 =?utf-8?B?WXRtcDFWSkFuN1JzVXpSNXk2SnBXa3lIek5Sb1JCS3ZDOGZ2Q013NHBDM3F1?=
 =?utf-8?B?dDRXT0dqVHp3RThuVTdtd3BVSmVobWZqSE1iL0JmaXNQTUhCbU5mNmxvSFpq?=
 =?utf-8?B?WWpzek9aQW4xcXloT3RpOWc1djhReFc4ZmVLcHZJeDBncXg1MDZCa1hJQW5L?=
 =?utf-8?B?RE83Vmk0dUxxamJ5UTE3K0d5NjIrOVlkaVE4S1Awc2x4TWs0NFp1aEd2MGc3?=
 =?utf-8?B?R2pzS3lzdGVNYXNHeG1CNktocXhIMlpCejl4OTVpTjlPZFBGYTUrb2E1dG1N?=
 =?utf-8?B?WEZ5ci9EUDEzQU1QRDZNL1VTeUZ2T3pLenBGSGk2eFlHeDdkUHh1UFpadXlu?=
 =?utf-8?B?a2RyY0ZvTE9TenRLa21WUFg5dXVzQ3cxWnVGc1g1cGVYUHI4aUR1WTlmelA3?=
 =?utf-8?B?N0VRRk1lY1pIR0lYeWw4OXRpcWN0dVRjbTloU2RyT2Y5NmcyV3ZDR1ZPL3gx?=
 =?utf-8?B?cXd2UDNxR0djWk9NSHpUcWcrVmJkSGJ3NWUrZldoZFJwV210UEk0ZmdwdGFn?=
 =?utf-8?B?WmRJQm8ycEoySFRUNjlTZlJsLzVCWGd0UXdSVW40bnBydVd5WGQ2R2M5Qjdl?=
 =?utf-8?B?Q1FtQWRYM2grNitmcHV4cVNjQTNNUWZqTGF5VGdkMitEMllzVTJTSnlvaWVx?=
 =?utf-8?B?Q1lZTFZOYzFNdEhsVlhnWHZtM2Jid1J3aU9HRldjMjhtcWZ1OXZ3Z0ljcUw2?=
 =?utf-8?B?dE5nbjNNY3R1ZlI5RWs2V3IwNjFSN09ieUJQVktHQUVjQTRxZzJOckxwaTU2?=
 =?utf-8?B?OTQyTHNmMHlXRkpzYWFmWGhqdHVuWW9JVWZVR0Z4TG9sR1JmS1lBTy9DKzBo?=
 =?utf-8?B?K3ZzWDhXTk44VTg3aTNZcEk2Y25IR2ZhNGJuOFB5M1RYVk5LclM1eTN4S3lw?=
 =?utf-8?B?REgvY3RhSGdPSWVib2p6WUNDU09EZ0RPOVUva2dIN3h4VmV1MHhMNml1NGha?=
 =?utf-8?B?aVJGVXpta3E2eGY4dUpicmI4WXdJZXNwUE5lanhFdkt4ZDRTNTNPbEs1dEZt?=
 =?utf-8?B?bXU5K3FMZkYrdFk5QnZiYTZzMlY1VU9SRGtrRmF1RHVmd29xTFlQNWpxMHNh?=
 =?utf-8?B?OU1uLzVJTmI0eGliTFpKcStZQTFDbllGQUp3SklXMzJ3a0tiZUFoSk81TUZC?=
 =?utf-8?B?VGszbmRqZWdpRGdkaWdNKzhDYjErSWZxMDMydXNSdUZkVTYxS0p1akhCS2tL?=
 =?utf-8?B?V05VaG1vbWNBT096VlZNV0ZmMWNVSzAwWmh0VDJTNWN1NGlRVmdnY3hIRWVP?=
 =?utf-8?B?ZjNRTWJ5Vm56ck5aRWR0MkFiZEJ6TGVXczNxdlJSTThldWI4Q1ZvOHFPcUdo?=
 =?utf-8?B?U1Q3YVBJSFlUNFg0UGJBbnlHYjNqMk0rZTIyQW5FNjhpaVZZRzQzcWxEVDF5?=
 =?utf-8?B?dVNmZk1ZWFUzQkpOdjRESTIrcnpKQXNHN2xpcnMzdzJiMStPbGc3WE5CM052?=
 =?utf-8?B?K3hibVJjOXVyWTFZeG5PNzBCZThyRHR6WDBmdG1mRXdyT0VtUEY1Nm0wZWsw?=
 =?utf-8?B?cWdhZ2Fzd2pJVndmcFRWUmpINDZuV3U4ZFk3ZFJFVHlwR0FxSEhCdS9CTnQx?=
 =?utf-8?B?MWtqekZVUVkrWWJaeE1RRGhIVWQwd29vQ0w4ZFhFQi9vWG1tZUUxaVJZY1BK?=
 =?utf-8?B?U1Y0d1pad2l1Z0tySWowQkM3dVplOEdrWXI2VHNHZyt3WjF1ZkJCcjZCTmZ2?=
 =?utf-8?B?K0FZODFZOHRWbUIzc2libGJ6T0NnSVEzbU1MQ0J5Vk1nNlJZOHh5MXhiYllU?=
 =?utf-8?B?MDh2RERlZG1iWXY1NHZDVm14VGVTbmNzVS9JRDJLd3lRRXEvai9JYzg1UjJ0?=
 =?utf-8?B?MVNZMUQvR09qSEFGeTE3OUFWUkdjOXNQSUI1Ukw1WmdyMnNKTjE4THU1WG9U?=
 =?utf-8?B?V1NiYlBnR010THFtUkNQV1hFUDhxSUc5QkZmREFBT2x2MVEwdXA1aTl3SXBn?=
 =?utf-8?B?NlF5Z3dOSUFJcTR1eHFKTGdjVGpxNFZ2Nk1pdmpQUCtxWGI1bE9ZdVpwNkd3?=
 =?utf-8?B?VVMxME9yWVBXT0svdSt2dDNqRFpoNmdidUJGWW5vUkZkbDdFMnlQTmU0L2tE?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef362230-70d0-4d54-5215-08dd49cb4035
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB5999.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 12:05:47.0766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GnB5Hc8fdDjhqY0Jv37wlmLU9qHkhPzv+2Fr8MZx2RNBCB+zw7gRgNrEz0jWbxEk3owoc4RDdIC8LAXvT2T/EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6467
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

Hi Jessica,


On 29-01-2025 08:59 am, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
>
> Move the get_encoder_idx() helper within the kms_setmode test to
> lib/igt_kms
>
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   lib/igt_kms.c       | 15 +++++++++++++++
>   lib/igt_kms.h       |  1 +
>   tests/kms_setmode.c | 14 ++------------
>   3 files changed, 18 insertions(+), 12 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 90f44b4d3a8607d1caedccf50691fae7aaf2d079..4b14c94e226a9a103bc3a3bc26099566a6eb274b 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -3324,6 +3324,21 @@ void igt_display_fini(igt_display_t *display)
>   	display->planes = NULL;
>   }
>   
> +/**
> + * kmstest_get_encoder_idx:
> + * @resources: libdrm resources pointer
> + * @encoder: libdrm encoder pointer
> + *
> + * Get encoder index from encoder_id
> + */
> +int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
> +{
> +	for (int i = 0; i < resources->count_encoders; i++)
> +		if (resources->encoders[i] == encoder->encoder_id)
> +			return i;
> +	igt_assert(0);
> +}
> +
>   static void igt_display_refresh(igt_display_t *display)
>   {
>   	igt_output_t *output;
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8810123fbebeb68f5c549c434d6ca69a123cfb90..e4f7b6c62fd536aa4ea3eb3153d8e1935cf560fd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -314,6 +314,7 @@ void kmstest_dumb_destroy(int fd, uint32_t handle);
>   void kmstest_wait_for_pageflip(int fd);
>   void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
>   unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
> +int kmstest_get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder);
>   
>   bool kms_has_vblank(int fd);
>   
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index d61cfeb9af22c12ae1f5aad5d06ccb9e01fc52d3..600524d98359fbf713be99de931e53b8ecf167b0 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -268,16 +268,6 @@ found:
>   	*mode_ret = *mode;
>   }
>   
> -static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
> -{
> -	int i;
> -
> -	for (i = 0; i < resources->count_encoders; i++)
> -		if (resources->encoders[i] == encoder->encoder_id)
> -			return i;
> -	igt_assert(0);
> -}
> -
>   static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
>   				size_t buf_size)
>   {
> @@ -370,7 +360,7 @@ static void setup_crtcs(const struct test_config *tconf,
>   			config_valid &= !!(encoder->possible_crtcs &
>   					  (1 << crtc->crtc_idx));
>   
> -			encoder_mask |= 1 << get_encoder_idx(resources,
> +			encoder_mask |= 1 << kmstest_get_encoder_idx(resources,
>   							     encoder);
Fix indentation here. Alignment should match open parenthesis.

With this fixed,

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>   			config_valid &= !(encoder_mask &
>   					  ~encoder->possible_clones);
> @@ -396,7 +386,7 @@ static void setup_crtcs(const struct test_config *tconf,
>   			idx = cconf[i].crtc_idx;
>   
>   		encoder = drmModeGetEncoder(drm_fd, connector->encoders[idx]);
> -		encoder_usage_count[get_encoder_idx(resources, encoder)]++;
> +		encoder_usage_count[kmstest_get_encoder_idx(resources, encoder)]++;
>   		drmModeFreeEncoder(encoder);
>   	}
>   	for (i = 0; i < resources->count_encoders; i++)
>

