Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0E2C0219B
	for <igt-dev@archiver.kernel.org>; Sun,  9 Feb 2025 18:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 861BB10E02D;
	Sun,  9 Feb 2025 18:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DhrSY/3Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2510E02D
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Feb 2025 18:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739127157; x=1770663157;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HCJmXWF+xoYtcsZza/r+eri7b3e7XPMuMV/EiogzR4c=;
 b=DhrSY/3Y7Apq3Ef8Ce1ETHDzQJBiyVtdMPOikguLjcuDLjGDvt1HfX0L
 l2GiHtVMSF6NeYY/qv2mRMUTVYXVeZn+a2ZxCbqOmEe507nR4C6At6Fzk
 4vTQDmkP255LL8kuxY1FcKstg/IfZt1O+sQbj+vZyWNKFp/QVPIY+gvOq
 rDFSUrfTk9PDGoYcF5obL3IMqoPSj00pfW6eohp+5ZuRjQSKyO1KRe6Sc
 JfSQjCrDqHDhsKuYp12pItiL4sSAxUiZii0CEkSKY9XKpEKxSuUFmUEjD
 GjFCvpCovGJin8BgHEdYLPSJajlS/FwOO0TPecH/69lxyiyFEkAq8kwoF Q==;
X-CSE-ConnectionGUID: ryDIurAnRQSv/9XagfSTKQ==
X-CSE-MsgGUID: pCa9q+MYQ+iINHzEyDFxrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39822860"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39822860"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 10:52:37 -0800
X-CSE-ConnectionGUID: 8oqzgWI4ReC5qOgiyO+SvQ==
X-CSE-MsgGUID: 5zODuULtSq+/6ApAhvlUuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="116935523"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 10:52:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 10:52:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 10:52:35 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 10:52:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+JjH1SPur4zrg0EJySj0pDJkAXMatcb/ypTjiP2uFusAI1PS5f7B6sDqt093CINL6JEbfocJoy91anHGg9SXTxc4HPT9LfGQgTn570IEvU7d0fTpeFk5fZq6wc73X1oJRLbFZP7M/kmApT9HxzIJWQIeLo9mBNuzxB/vUnsemsF6A7gIaXdMqeRJWP/x656lifXYIZes8T7+gdWOaYYdyj0/5ydeOcka1POU+tB3PJFjPNrRLH3bdUbW656e4pkPWRcpjZicfULpDJnAb0pIFuvQFmpy8hu3LkAhrJskYjVnq4EVtyyp7jBfOeJIkjUOJn6AAFVJ/Hd+03s5EfILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmR8PTqGAlZqm9VVTFkuta2TxqsfUHveeReHNuPv8r8=;
 b=ra4ba6/kZHeCWMz/T1WU2ei/3Kwp3fGUU+VLIZXZcDLPQ/D1vQ7Z4chY8rrKuLRREQH3C7aG2Wsp3GalkjO5D+fBsZBn5iuaZifByEW71fE/I4LWwJ7XduJJMp90ckuZeLM2pkTr6EsMLAPXk/YlQ8Urv1rGGWDMnhnqBGphmCAzip+t/rxZP2kzspOrLlbU/9BbMj59JvWT9BNQlX5CJRrJdDf62pHQvcV6HJ83nIF2G6ug+UTv9rx+9QJ/e1C/1rqeao8EVn4dt2XnDxCvNmsioensyl74dmtNFEpEwiQkQnkJKEn6b9mmqIsdFNS2oiC2z6ghnVqvrBzrtlWFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Sun, 9 Feb
 2025 18:52:28 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8422.012; Sun, 9 Feb 2025
 18:52:28 +0000
Message-ID: <0a0f625b-ee37-4a0b-a46f-a0b813e0e0a5@intel.com>
Date: Mon, 10 Feb 2025 00:22:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_atomic: Add necessary checks to
 ensure proper cleanup
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250131191613.447979-1-ramanaidu.naladala@intel.com>
 <20250131191613.447979-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250131191613.447979-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0012.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::11) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: e01a8cbe-17c8-4db4-d66e-08dd493ae646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkhJSmVaRmVFWmc2SXhOTlJJV0oxaU8vSHQzcFc4NkJkOEZUK2lZeFlvL1dj?=
 =?utf-8?B?dmhHeUpkSEdBWFlUZWh4Q3dQdHlhMGhUdmlaK3FDZlRqVmRwS0cycXVOY2NJ?=
 =?utf-8?B?ZDUrZTZWRThHVFdRdXg0MVBTOUVaa1JvNXFYdE1pUzA1WEM5NHJ4c29FZWdp?=
 =?utf-8?B?SFhveUxWT3lRN283VHBSR0Y5OU1HVElmKzJ2eEFZZnpKRTJGdzZYaFM3OFhu?=
 =?utf-8?B?RVlCS2EzeDhkblcyOGUyMnFIYW5NRzczcDAzK3I3ejFIOHFqOW1zemMyZE9O?=
 =?utf-8?B?bnlZZy9XWlVHRitKd2pYNTQwdGJsZDZ6clQrb3JqVG5KOC96TmE5N0NjZTg3?=
 =?utf-8?B?Z00wUURCbHlZNENhUFV3UEhLdUxMdGpyZ0JTTzFDbTAydWhwNlRSUGppZGlS?=
 =?utf-8?B?M0xCMC95QkMzRnM4bUhPNVBmeGg0eUVvdTlEcnYrZkN3d3J0dDJ6cjM3aEhW?=
 =?utf-8?B?SThzR2F2N1ZvOGdOeDErTHFJOWdWUnV5NmtwNDdvWHRHYU9vM0V4Yk1MalRR?=
 =?utf-8?B?ZjVSeW5lRWVPUlhNcGhFU1p1aUFWbW9KZ2cxTWl6dVIvMkRwWUl0NSsxWWFO?=
 =?utf-8?B?ay9LakJrbWd3MlgrcGpSamlENENTei9tVkI1NE5PeGFhS1lFVHZrRDZobkpl?=
 =?utf-8?B?cGxEUk5WRUNRUnErY0VtVEVDL2ZNNXRNazluUGo3K3cwSjZzSWZ3OElyNlN5?=
 =?utf-8?B?VXI1bEc1VzFXV1ByWWFrL0pVUVkvK0lxNEdCbGlsa0JzdWo2RjFibkR1UUVx?=
 =?utf-8?B?aHJQMmVJKy9iYkFEUnhOMU9EN2FqTVRhOTAwNVh0bkRDT0d4RjBxeElpWVl2?=
 =?utf-8?B?OGNnS1NWeTlIenBaUXoyV3B6QkRUTjJrVzNFT0F6NmNPZ1pHaVZJazkvZTJ2?=
 =?utf-8?B?dFMxT2MrYzRiLzJYVzhVT1BoM0tXQzlBelZzd2dsY0loTzMwQ1ltMVl3NGJ0?=
 =?utf-8?B?ajZnQTNzRWZIaVk5MWZ5OUdvMEswU3ZoUlJQQkszb0RNSFZhTEp6WkhIQXlh?=
 =?utf-8?B?RnhPRXJaZU9icHdOOUVkZ3gweVViZHN1Y2IwVmtITnhUT3BSeHE5RVhpSGRt?=
 =?utf-8?B?REQwMEx4RlF2MmZQTjhYdjR6eEwxZ2h2NW0yOUdZRmhVTVlQL0hvYzJlUnJN?=
 =?utf-8?B?YVhQazEwa0dGbXBwSnpBVUd4YjR0M0h1UHdUQXpDMGpscCtJcG1neUhxOUNV?=
 =?utf-8?B?SGRnSmphT2JMU2tDNWcvUnpZMXVsNmpmNUQ0NGhMcUFFQ3dUMC9PSENUcjR2?=
 =?utf-8?B?M05tUWdsTURSdGFqTWErVVhXM2p4ckR6cXdUckluUGI2ZjMzblQwMU9Ba2Ru?=
 =?utf-8?B?N1JydUwzUG9xQUVsY2ZHVHNxWitqM3NIdG5MRzFVbkJNNktmM05WdmxPQUVo?=
 =?utf-8?B?elg0aUp2dE1yLzBUdW1ueEVZTmVVY0lnYVpEWVIwWHZkbHdVblQzTzhqMVUw?=
 =?utf-8?B?L0UxVXJvQVNybjk2YWJ2N0o5N0F2ejJHcTVrR2J2UE5YeGt5SUlKUW5qZklF?=
 =?utf-8?B?SjBpTy8wVkJ0WEFacEFTdGRkeFpaM3pWTGJHeDN2bWdhY2J3R3IyS001UFUx?=
 =?utf-8?B?UjVOMnYvUStxeStneURjcHRGbTEwYzFTQWY2WGYzcG9SSE5IT09pRGFxNjdn?=
 =?utf-8?B?OFpMemgvWUZraW9CT3htcDZJTEQ3UCt6azRkWUxrSDd4NFhsTkIyeGFNSXNp?=
 =?utf-8?B?UVZnMGxMaStxVlQ3UWU4ZSsyWXJqRGRXL3pBUGgxdXpJZXZ5akV2S2p6VHlM?=
 =?utf-8?B?a2d6aXJqbUI1ZVlMNi94NmpwVDBQUFpHKzVsVXg1U29uU0JsREwvbnkwMGdI?=
 =?utf-8?B?SmRZcFYxQTlBdXNkZlNUM2hTL1lPRGdpYkgxeFBVekF2Q3dlcEtJZWtRcHdh?=
 =?utf-8?Q?2GA9bpcYp9tQq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDZSK1JWelNESmwrSndqTzNtZ0cyUDlIaEw5emdlM0ZBVC9vbERrYjE3Vkh6?=
 =?utf-8?B?Uyt0eTJBWGZvdkU5Zk9kYlJOanNZRDVmWC9zS2xJY3lYcE9WSDlmWHVab0FL?=
 =?utf-8?B?K2R6YzNyaXVuck9pcTNyNkJpbFk1VTVIMExNQkozcWFwemlYZHlyc1phQnY1?=
 =?utf-8?B?a3RnTkQxY2RRUnpuSjJXYm5KdDNONmF1dUhyTFN6VGRSZFJjMEkremRBYXRr?=
 =?utf-8?B?VlN0bjgrR3BlSUkzV1pLdHllVnhnaUJsTkxXM2puMC9uZGZGSGk1REgzNU1y?=
 =?utf-8?B?VXZEZ0YrdDJPQjZ0SitLc1loN2hqOG5EajI2dDVSZ2dhU3NUTGNKV1BFUDEv?=
 =?utf-8?B?aDZIWDBGb3lDZk5Id1pIN1cxRmNSNmozeEg3NGVnUWU2SG9NNStKZjN3M3JH?=
 =?utf-8?B?b1QzV083bVZiTmg4SU80T3dEK3hLSkJvMjBFY2ltam1SOTJXalRoT01mUmMx?=
 =?utf-8?B?MVI4S1BXVU5VYjgvUHpEbkFpelAzZDB2R1lnY1RGbzJQODlnamtKc1FtQUhu?=
 =?utf-8?B?cUZCaVdzTGt5Z3krZHRxaEZSdWxESFdob2pZbzhFblRGcDFaOFBGSG1nd1Zr?=
 =?utf-8?B?bWVySjlDejgvaTVhbXRQei9UY1N2WTlYQVhKRVhGaHE5b3dhWEtPeEhnZENq?=
 =?utf-8?B?VjdlMmxHQVBjQ1VFVWlDY1EvR3duczNNS3VUNGZNa2YyT1pxZ010YWV5eDNS?=
 =?utf-8?B?U3A3cXJKOXFkaVZHNTFHVW56ZFArZ0tieU9xRE1xMVloM1hLZEYwajJrMk5k?=
 =?utf-8?B?QnI3VmVObkV2TVBHVWsveWx2U2xURjczK0srSk5SSlplK1JSSnp2MXc5SmVH?=
 =?utf-8?B?RTYwU0t1aSt2RVAwSGZaMUtINFRGV25hRGlGUlIyaTY0d2tuajgyZmNIWEs4?=
 =?utf-8?B?MFlOajk4NGlPbEp2bmlKWlptYXVYQlEvcWUwRG83RjhGS1ZhaDNZZzJVMzI3?=
 =?utf-8?B?NFBraVJ0YTNaanNxWFVkamdmRHR2YTRyTzdGZ0M5dkIvVkFsZ3JoYTFnRjJI?=
 =?utf-8?B?UWFUOUpwSmZOU2c3TFMxMU1YUDJrYkZEV0xnVTNzeDk2U1o5V09jMXdFNS9n?=
 =?utf-8?B?THIyL1NkRUlaaHh1cFNWNkFpTXRpSUQ4K0UrcmxhTThOK01nOFpabVJVQnNC?=
 =?utf-8?B?NDlsTytnU2FlVzNEeDZsTnpUVmdsZld1bkdzaERjUGFlbHNuRm40dk5DMXBB?=
 =?utf-8?B?VFVITmJKd3hsWnZ3MWFJRkQrdFlhOEE1TitCeDlXem9jMlNqT2FNMkdGUWF0?=
 =?utf-8?B?U2hhYnMyZDNxZndZMEE1VkRDeXRDbGpHcmJyeU5PL1FUSm1QYTdiNE9mMFBm?=
 =?utf-8?B?Q2YxcXdFU1JOdjVHVHlDNVQyVDB2bkRHUjR2ZTJDVmFwYVZRaTE5bmFIbVp0?=
 =?utf-8?B?cnQ4ZFJVNENFeG95TE4yQi9qMStFMXRpNVpaZW1OQjExV1dZT0NZUkRzVEti?=
 =?utf-8?B?cWpvemdEbWdxSGQ3SjlLTzBONFNNT2JURVFXd2M0UFVoaFkxTWN3RHNsRndh?=
 =?utf-8?B?OCs4elczckhQcjBMRWhUaVF6NjRZVVZ3MFJoTG1qTVFWNHc2MUxFdmxVck90?=
 =?utf-8?B?S2x5ZlFJblVUdjFhUEQxbS9xVTh4Qkdsbyt1bVRzR2VBYktmcDJsOXNiSVFj?=
 =?utf-8?B?ZHBocGhtTkFpQ1pPSHRUSDJ5MzF3OUNzSkRPc2RiQit1R2lBcU5RY09Ba0gx?=
 =?utf-8?B?ZEVWbDc1ZXRNczhLSGJUaTQvbTdSeENFcTJyWkVPUlJqemdKcmhJMjdjbjdN?=
 =?utf-8?B?QXg5WEMvcWtKeWpnMkNjY2NnZEw1TTA2bVZ5djRkL3ZNMUh1SFJ2eVBtNElN?=
 =?utf-8?B?cTJkOEQrczU3aUpzQUlrakNUOXg1enlUbXZHM3gxZW0wdmxtUU5JZDVjSlNF?=
 =?utf-8?B?QXZWakJyUzd2cEdjbWhyY3dEdEV3SjVmUlo5cjlubklJWVZuSTEyOUpvemta?=
 =?utf-8?B?NUhaMGlEaVhRV05TQjduQ2g0TTZGU3M0UFdCUVI4V0hjVGdWTVpyZGFRNFFw?=
 =?utf-8?B?TVVqbnl4RmV0QjBpSWJtckFwRzVGcmpiTGtKbWhPcXJ5eXpmSTVab2cwd29L?=
 =?utf-8?B?QXBJMnUveDdzWUpxOWpmRWh6NlYzOTVCL2R4YWk5YmMxTldMazV1MC9LamRS?=
 =?utf-8?B?WVplVENxYWxwVGtnYVl5dzhTdTh3K3ZVa0dDbGlxdklkaUNMN0FjQ2w3bCtP?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e01a8cbe-17c8-4db4-d66e-08dd493ae646
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 18:52:28.0396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Knr9aq8eIbSBK8V4/gUrfOHPHjYm5QPYGDAI8sjSzYpNy5tKG77L9hzkmT4ESWzq9A5dQ/k/us2OT5DIQKa3yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
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

Hi Ramanaidu,

Patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

If possible add gitlab# in closes tag.

On 01-02-2025 12:46 am, Naladala Ramanaidu wrote:
> Stop CRC and free up CRC resources to prevent memory leaks.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_atomic.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 489b0d709..8fb26a079 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -506,6 +506,10 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
>   					  DRM_FORMAT_XRGB8888,
>   					  DRM_FORMAT_MOD_LINEAR,
>   					  0.0, 0.0, 1.0, &fb_lower);
> +	if (!fb_id_lower) {
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +	}
>   	igt_assert(fb_id_lower);
>   
>   	fb_id_upper = igt_create_color_fb(data->drm_fd,
> @@ -513,6 +517,10 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
>   					  DRM_FORMAT_XRGB8888,
>   					  DRM_FORMAT_MOD_LINEAR,
>   					  1.0, 1.0, 0.0, &fb_upper);
> +	if (!fb_id_upper) {
> +		igt_pipe_crc_stop(pipe_crc);
> +		igt_pipe_crc_free(pipe_crc);
> +	}
>   	igt_assert(fb_id_upper);
>   
>   	/*
> @@ -560,6 +568,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
>   		igt_plane_set_fb(plane_upper, NULL);
>   	}
>   
> +	igt_pipe_crc_stop(pipe_crc);
> +	igt_pipe_crc_free(pipe_crc);
>   	igt_remove_fb(data->drm_fd, &fb_ref);
>   	igt_remove_fb(data->drm_fd, &fb_lower);
>   	igt_remove_fb(data->drm_fd, &fb_upper);
