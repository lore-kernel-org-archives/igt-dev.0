Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5491E98DF0
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 07:17:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE5210E262;
	Mon, 23 Feb 2026 07:17:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+T488Nm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371BA10E262
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 07:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771831059; x=1803367059;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ej4zaxDiTi9axmuQdzluWrqaE7rcMXE3pbXp9v7H/gM=;
 b=c+T488NmNCfSNPB8QSMW8M+OtA5dBjgJk6QOKoUtqEkVbJu/Uve0YR/y
 vhaWg1mJR9VM2IU8RftuRaojLNdvtWV+6ctGX9pFW6/ED0UNlvyqJb1+T
 OxIZupiiKYhSM6p7zc09lzaL7ErfkAaimhd3gvgcDeGxrzMs7Uv+xk3SD
 HlNcnH9hPobpOqKQVxJMrAcydiI+b5PnRrJAM5g9uEUBGPCPa2LI8msWm
 s9ok6353VqUN3ih5h8WZm28TaifESlRLl8LG4CNAd3zskbDWnv50OKj8f
 BYNmxQLtJ38ue3UK6ZJJksDYvv4tC+aH0NErXzj66r6UclxbfxWi95R4q w==;
X-CSE-ConnectionGUID: /NEv+RvbTwOrbdoRY8COlQ==
X-CSE-MsgGUID: CXnmqYa+RO+sDCdJniOTzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76681369"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="76681369"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:17:39 -0800
X-CSE-ConnectionGUID: 4PxfaZRfTHaYzXvbw80YEw==
X-CSE-MsgGUID: ww5JDiFXTweulvv+nzL6Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="246070145"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:17:39 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:17:38 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 23:17:38 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:17:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcjMSQWKkgYCBIkEFzu8LkOEq/gq9qxT5Rt+wkIIXKNBQjwNOEH9RtH7BTNeqxrJnLcjuiPTg3GvOOdLMXB6I+ZO5rc3+DKSaQd0gfb2Y9OrV2ScmySKFvgHmQDlkHr6XBup9OOxsCc2KTNR3Wlo/5i+stnN730WuowLF3sKPgQeR/OMv+/vXmHu/lhMDVeWTOnd9zj0HNL3kswXBj0+03cbFFhIp/KI6FLkRuD98SD6l4PUmBHnOGrPFg5FSOUgB9OSCZIiN3+vM+avGOoemgb9jpTkp6NK4pzWKF5aaY4fsfw3OR4sxIThUWqvRO28TvB9vhly20xJ71eQ/60g/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3dJLh28Q1FlULCfxrMkC3bra2kAudPlJzdy86hWjvc=;
 b=HEuNikfqnx6dWLIg1mLTZdpYJ2KkL2sXgzPcGOQm2bgZKDajEys11Xo8r48s/YrP0NwkL/wLpQhVefD7yi6hgQxEBNzmtKyUxVtHE937loZRuzHixiPk7+jJSevGyZ0FescF8eRhemUB9133znZWyqGcW2xF4Vl2mFdpsjzCYwjvu2UEGYwJ7wrfmRuT4/l89falaW2UQXkt999/x9f6MRg0DxLIer7WyeTOlJKB1kVVqZrixwLThU425RUK9hNPAre+8jkKNRDemg0ACBxz7Z2xR25geyTHF9LfTXP793Q65wU+boNVAIiNkm4/+Tw6AOPw/qwz6ZJX1U1HddhT5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH8PR11MB6854.namprd11.prod.outlook.com (2603:10b6:510:22d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 07:17:33 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:17:33 +0000
Message-ID: <e9e69621-1ea5-4b9f-b908-425f565035c1@intel.com>
Date: Mon, 23 Feb 2026 12:47:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 7/8] tests/intel/xe_madvise: Add per-vma-tracking
 subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-8-arvind.yadav@intel.com>
 <BL1PR11MB55254273B6A331543901C8328477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB55254273B6A331543901C8328477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0214.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::10) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH8PR11MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 460eebe8-a62a-4851-2cc8-08de72ab9cad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WkZlZkl2UmlxUFNndURWSnhpazhCeGYwVHFvdzdhV3daUFJLTlJUayswTEJQ?=
 =?utf-8?B?ZndXTytxR0duME9FcnBlN0IybVhSOEh3dG9YOUw0VlB4M2FyTmYwUDQ2c1NT?=
 =?utf-8?B?M3VTL05kNDV0MDR4WXpvZXJkS09kTzQzeXJ6cWNvQWhrTEZwL0ZtVVVZT0M1?=
 =?utf-8?B?L1gzL0lPbDNnVTlyK2lPOER0TUxJdkN0OWt3ZEh0dTZycll3dlRUUEVHUGti?=
 =?utf-8?B?ekN3WGFhNjBhNUZiVTJMeHFsdEtHUGV5VEVPblFQckFYeHE4a2I5Uk1XOHJ1?=
 =?utf-8?B?UTBZMjdKaDNDeFFTNGRNWHg5R1lFRmVib2ZuYzdVanNpQnJYUUFzazZFYmto?=
 =?utf-8?B?UDZHSGhPUm5QbWd4UEd0dXJHakRVSWphTE9RcEVHK090RDR2bTVaUy9HS2Nt?=
 =?utf-8?B?M1dDK1NjS0I5b3BCUDUxUFhSUnpZdlc3TlhXTGVGaFJKcDVwanZLTWhjVWdI?=
 =?utf-8?B?Vm51L0djZ0dXcDN4NUlmYUpsMTZUNnU4U0hXemhlNFdpM0NKeGpERnJlNHVP?=
 =?utf-8?B?TVdOTGhQcEJ6MzRTQUZPRWZKemNNWFFoUjBZODIrZzZRTHNkWjhVTGNrZWdS?=
 =?utf-8?B?WUM4Z093aFBjZlR6SDkyODBLN2FDVVlzV3dFL0RZN0hOZmd0TnNDNXVKaEJU?=
 =?utf-8?B?VEdDSUE4dW93ZzZTcnN3YStaMVFwSGxESXFVc2J2WWE0Zkx3dEhyRERwYXBH?=
 =?utf-8?B?K1ZGWHVPb3B1QVFZSUdYVVR0WTVidEpVSVNPK3lZa2FFaGFGWkVGTlh2Y3V5?=
 =?utf-8?B?L2M2anJxbXJGTWNtTmJMdXVSeU9TTnZiK2l2UWM4THFWNm4xb3picDZxWUt3?=
 =?utf-8?B?UXh4OEJHR2szckdTcVdnNkNUWlI5cHdreWZtYUZKOHpaQW1yUnlSYkJBUTUz?=
 =?utf-8?B?b2ViNUF3K0FzbEo1T1NmMENaNHBYUnlPa2hUemJRSlN1bTVIakxIaHpGZm83?=
 =?utf-8?B?N1RnSWRjaVQ5dU5YakIvYVlmM2RQZTdNM3Y2NjVwUDVZRmZEd1BNbWYwK2Vr?=
 =?utf-8?B?YXBtMGZoL2RTbXZ2OTE1Y1J0MXl1cmFCdU9YMHNEaVNDTlkyem9mazFqYXpT?=
 =?utf-8?B?Y284bHBtSzJwb3QwcmxmT05OeWJNcTRzZ1ZNRmZXV3A2RHZieEFSUGZOdndR?=
 =?utf-8?B?eDEwZjdqelhGcW9RRmJRUkVxR3hTcXdZbCtoYklnRW1LaGdyd2MyQit5UjIv?=
 =?utf-8?B?SklOeUxRem9HTmtZMi9nNEZ3aitwM3dDdVA0cDVLaFB6dWJ0M0dpcklxVHQ4?=
 =?utf-8?B?NWtrM3RVclo2eW1PeEhiTlA1b2c5dG1rb281MFBuZ1UxdGtRT1FUYU1EQ0F1?=
 =?utf-8?B?UG14aDJoVmxCUTRMZmxvU0JiUEd1bHBCY0pOLzhHY25YcjBGQ2tqYXNnTzh0?=
 =?utf-8?B?VmNYR2pMSGVhaHdkUlBUR05hdHBBQjFBUVhKS0ttTzVWajhrd3lwRXlYSkMv?=
 =?utf-8?B?TVU1ZXhRWXhITTVTbVpFaG9BNzhuMGFRUWxRMmdDdXl1dUpLQTUrdFhwbHZk?=
 =?utf-8?B?bDNDMnQzeWFXYXQ2a2FRMHRjNTJzQVFFZUhPNWQvNHpEWEFXcEF5bFRaS1k2?=
 =?utf-8?B?YldxWEhjQ3dLNHpYNVEwc1liOTZlZXIxSWpWT1JPSng4RC94WlpXSktpbTE5?=
 =?utf-8?B?WWhJZFdvWmRXNHppaUxTNng3WnRGKzB5OFNHWU1zQitBZUdReHlrcm1PZDBO?=
 =?utf-8?B?TENTNS8vMkZIZEgzbXg4TEtZQTE1b2kxRGpoRUN4ZjYvalFiNmdFVDFFOTRa?=
 =?utf-8?B?WUZ2RnJDaysxNkE5MDlhZHN5MjNuV1g3Y0pITy9saENSTDIxeHJpMjZjZUJE?=
 =?utf-8?B?RW5halFRYWJBaFFIOGxpaGtlRDRsU3doaGdmNjF5bFhVSURDOTdQUDdFTi8y?=
 =?utf-8?B?SXd2L2ZIemFzVXlmUDllaDNWcUZ0Tllwc01nbXptTzd5LzVtQWduSjdrcC9H?=
 =?utf-8?B?RStkNTRXSjZ5OVBYQzdRSFZxa0JHRmdzMlV5SGdzQU9YRThhcEd6bTd6L1Ra?=
 =?utf-8?B?K05LQ25adEJiTEhpQTJBS1phNys0eFZOZEZNRDQ5UXdVSkVudkxoVUo2Q3lG?=
 =?utf-8?B?S29DNWFHYTF6cFN3enNGeDFRU0g1M0d6cVBqYXlhVWpkNGVUL3NTQmpDWWk0?=
 =?utf-8?Q?uYJc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmFsNzd1byt0c0dpeGl6WjBtQVVsbUFhWU5uN2ZRNmE2TE8rWENkZUEvNlc4?=
 =?utf-8?B?Mjd4aG9QQWVaMUs3UEo3aVZuTGVhTlM4anllb1BwL1BRTzhnK0JIU2Z6cGJ3?=
 =?utf-8?B?OUlaenlSbXVzd1lTTUJaTjl4RXVqREp3RUh2ZVptemNSMEtRQlZ1cXlrQ0N3?=
 =?utf-8?B?eTQrZEV6WDFGbEVtK21WZTRNdks3RHRKR1NlQVJGTDBlVlJOUGkyQ0owMXI0?=
 =?utf-8?B?RjMyUk1yUHJXUkxEcE9lV0RPTUFGYXgwTlVjN0RUNTdHMFBzd1lpcUVlQVoy?=
 =?utf-8?B?d0ZvS2cvVXl6alBnRGhOWmgzRzRJSzQ0V2wrSmRQVjJ6RkJXeEdxN2N0bDlq?=
 =?utf-8?B?QjBYQUpIdXc2VHdGZENvSUlUajZuNCtDcjl1MXBIbWN4dllpYklzNm85VkYw?=
 =?utf-8?B?ay9ocVk1akVVTkplb1ZHNDEyVy9sR0hyYVVCV1RORnFYZ0Y4cEloQlN1ZWRa?=
 =?utf-8?B?Tis1ZnhneXQyY21ZL2pVbzNDUXdrQ1RFUEtQM1VvWGRIaXd0U2drSEdRRGc1?=
 =?utf-8?B?c2U4K1h3a2tFNDd6SktBQU9leTZxVkRXODFXZlkrR3ExNWs0K09YWlNHQzhB?=
 =?utf-8?B?WmRxUGMwWlJYaGRueHZERVM4TXJWcHFtZkVWUENBSmlpUGdqaGpHOWdwQWJQ?=
 =?utf-8?B?NGdEdlJCSlZNNm9WTXVJNUV2bi8zOU9LLzBEbndVbm43MnVTR3FsNXY3VEVv?=
 =?utf-8?B?ZnNoRCsyb3BDQzFzYTVnZFQwbUR2ZE9NeENWV1c5dlRBa2NpZ01HbUs5aWJQ?=
 =?utf-8?B?MEpqdUExb2UwVjFEK284bzYydFdvZTMvUzhMSU15OHk2NlFzT3drdFBnaC9M?=
 =?utf-8?B?SVpZclFUYk5RWnRrVG0vUnE4VUVWMVp5dVlLSGxPcHJ5WlBDb1Yvb25BZEhT?=
 =?utf-8?B?eUZzZHpuN2JoUDdIbndoYkFQYWtyejF4Y0tNRng1TDN6eGVXTEZ3c1hQUXgx?=
 =?utf-8?B?OWNMNWpUcWVCTitUUWdzbGxQZEpoRHI3MElsZTMzWnV4Nng1QWN2QXlobXlV?=
 =?utf-8?B?REF0NFFMUzFKaVFjQWhOQnhnTnhCbmg3SHVMdExBTWNZVFltS09kMlZ2T2Zr?=
 =?utf-8?B?SzNPcXc5VFJ3V2NvbnN5WmJSRjV0ODJVcVVMeFl4ZFc0UTdwelpEMzNNRHBu?=
 =?utf-8?B?QmRBVFBIK1UrWWlRMkl2ZVFIU25YWHMxdmN3cVFkWURmeDU2RGxEZzRYOFFu?=
 =?utf-8?B?dzlyQnVXYlhlR3F1NGttSU1pa1Z5c1RXK0lzem9qREV4dUkxZ3RTa2Rkc1pn?=
 =?utf-8?B?MEdiUEtKRVcrR1pnRXlJcUp2RDFLMWVMalFEY1NNS2NmdFhTeFpSZXgrbjh5?=
 =?utf-8?B?dFhVbkF6bE94aHRsUVdid2xLWjdtZWYxZjlSekVOWk5kb3crVTBGa1Z4QmEx?=
 =?utf-8?B?RmZQeGREZGJwU0p2QlhZa00zWTB0SmR2NU5UZ1hTL0YzWGoyNVdoUGl2djRG?=
 =?utf-8?B?ZVVaWjNTdDNlVFpjWk5ieHBieThubjZQcXR3bS9JaFBGVFB6YW1WM09sWXNE?=
 =?utf-8?B?UHBva2Nld2tqcm9zcHVSaWZRNUZUOTRvN3JWWDVpYk52bEtFa3pVd2R5S2Q0?=
 =?utf-8?B?Y0pDdzBYL2FzMnloeWlUUVd3Z3ZURlFEeFc3aittc1c1TnF2TWNpbDJsUk54?=
 =?utf-8?B?b2tZWW8rYnhnVk9HNXFFb2FVMENUUzZRaXh5YjRBWXdhQ1N3Z3pOWTRMc0ly?=
 =?utf-8?B?Z0VPQjJSdkJtOEx1QThTWVltL2s3ay9GUVg2SFd4ZVcwL0d2VXVLRUJYa3RU?=
 =?utf-8?B?dk9wS2dYaDlDOTVWclF1RjdqUE1OQjBybjY1S243MytXK1lzM0M0YjUwbEE0?=
 =?utf-8?B?TUo0aGlhOGVEVFFZd3d4NWNPOGNOZjloYXhiZzVnN0FLdVMyZGNoSm0xMUpm?=
 =?utf-8?B?aFpvcWxwWjk3WVdIL010dzA3K1c5S2ROZS9Tc2pUY3F1TVdIa0JlZTBjZmor?=
 =?utf-8?B?RFNaY3JHYThqVmlHQ1hiaCtMS0pCZzc1MXNCM0crVVlqSWVtTzFlbytacWZa?=
 =?utf-8?B?emVpcFUxYUZPdDNMZFVrUzBMUUxremVpTUdhcHprdUVaOHRZanRXYWRTNW5E?=
 =?utf-8?B?bzRNeU5JejAxWDFDWXpPdUFhOFJXSlEvdVVJMDYvelZFdGZlMVNPWlVEUzds?=
 =?utf-8?B?b2MwaENCemxQZWFqWGdmb2hOT3RZOFpDSmJvYUpvTGp6anlkV3U5MlY4UUNn?=
 =?utf-8?B?M3NXSExhWHp5bjJwY0pINjduS0NGQ0F1eFh6TDlqQ1dwc3lQYnZKcGozNjQ3?=
 =?utf-8?B?L0NCb3ZFU1E4d3RLakV6eE0rQWJEaE1vZjJjOVZIVkdrOW1pR1NFVlJSSUt2?=
 =?utf-8?B?VzJYRFNkR0F6dElpWjk4ZWRmS2M0ZHpYU3F1OVZ4ckc3SEdmdnN3RG1qY3pO?=
 =?utf-8?Q?ofuEwT4Rd7vLTTtQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 460eebe8-a62a-4851-2cc8-08de72ab9cad
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:17:32.9636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaJjQ8T52qT38Et+GoK8SVNdJFM0TXcn2NS3USfzOQ1qSGqttVyE7AcO4gvUhQnn0qYLEO6HwsXiqt9jQ3CjDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6854
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


On 2/23/2026 10:41 AM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 7/8] tests/intel/xe_madvise: Add per-vma-tracking
>> subtest
>>
>> This test validates that purgeable state is tracked per-VMA when a single BO is
>> bound in multiple VMs. The test creates one BO shared across two VMs at
>> different virtual addresses. It verifies that marking only one VMA as
>> DONTNEED does not make the BO purgeable, but marking both VMAs as
>> DONTNEED allows the kernel to purge the shared BO. This ensures proper per-
>> VMA tracking for shared memory.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 109
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 109 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>> 51ef4fad3..4e7df54a7 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -20,6 +20,7 @@
>>
>>   /* Purgeable test constants */
>>   #define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_ADDR2		0x2b0000
>>   #define PURGEABLE_BATCH_ADDR	0x3c0000
>>   #define PURGEABLE_BO_SIZE	4096
>>   #define PURGEABLE_FENCE_VAL	0xbeef
>> @@ -205,6 +206,58 @@ static void purgeable_setup_batch_and_data(int fd,
>> uint32_t *vm,
>>   	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);  }
>>
>> +/**
>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared
>> BO
>> + * @fd: DRM file descriptor
>> + * @vm1: Output first VM handle
>> + * @vm2: Output second VM handle
>> + * @bo: Output shared BO handle
>> + * @addr1: Virtual address in VM1
>> + * @addr2: Virtual address in VM2
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag for VMs
>> + *
>> + * Helper to create two VMs and bind one shared BO in both VMs.
>> + * Returns mapped pointer to the BO.
>> + */
>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1,
>> uint32_t *vm2,
>> +					       uint32_t *bo, uint64_t addr1,
>> +					       uint64_t addr2, size_t size,
>> +					       bool use_scratch)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +	void *map;
>> +
>> +	/* Create two VMs */
>> +	*vm1 = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*vm2 = xe_vm_create(fd, use_scratch ?
>> +DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +
>> +	/* Create shared BO */
>> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	map = xe_bo_map(fd, *bo, size);
>> +	memset(map, 0xAB, size);
>> +
>> +	/* Bind BO in VM1 */
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	/* Bind BO in VM2 */
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	return map;
>> +}
>> +
>>   /**
>>    * SUBTEST: dontneed-before-mmap
>>    * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>> SIGBUS on access @@ -465,6 +518,56 @@ static void
>> test_dontneed_after_exec(int fd, struct drm_xe_engine_class_instance
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * SUBTEST: per-vma-tracking
>> + * Description: One BO in two VMs becomes purgeable only when both
>> VMAs
>> +are DONTNEED
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_tracking(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm1, vm2;
>> +	uint64_t addr1 = PURGEABLE_ADDR;
>> +	uint64_t addr2 = PURGEABLE_ADDR2;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	uint32_t retained;
>> +	void *map;
>> +
>> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +						addr1, addr2,
>> +						bo_size, false);
>> +
>> +	/* Mark VMA1 as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Mark both VMAs as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure and verify BO was purged */
>> +	trigger_memory_pressure(fd, vm1);
Triggering pressure on single VM is fine as both VMAs are DONTNEED. You 
can mention in comment otherwise fine.
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -499,6 +602,12 @@
>> int igt_main()
>>   			break;
>>   		}
>>
>> +	igt_subtest("per-vma-tracking")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_tracking(fd, hwe);
>> +			break;
>> +		}
>> +
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
