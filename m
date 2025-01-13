Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40708C02180
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 14:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0FF510E6A1;
	Mon, 13 Jan 2025 14:47:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LnJi4GUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05E7010E6A0
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 14:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736779678; x=1768315678;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DkrbGcUxnrc070Cn9rn5vDxBSlxJ/SqTh8r//RlEFqs=;
 b=LnJi4GUvu7CGezFg4BSGdex/r9DGXbkMxVDk3CF268rPtW8apNtbXEDy
 ap+sUyEp3l7fbyE51X6j+Qdaswhh2ma8ZzpdBPYtSKvzpw9aXjBoJ62Y/
 Gw4oxM54dEGWrVaYcbNncm0mdqdWs73C8y2zQQn4lmWTo7RriwKHkigRp
 +o8zoZ/XKY+PlVsW3nYoFU7bCDIjfEzTV5G87truwr2fJHHVfkLiSTZTg
 BqhEAFT1fb/JoMiBlVCBseuFBdJBnir4D4M5+plbs71F4HMKThGDg7ajS
 06B242JqTEEII0qMjjm29v6HErXS3F5PvELF578vFYebxSxjWHk+uRTl9 g==;
X-CSE-ConnectionGUID: M3bV+Ih+Tm20GX6ZfMFDSA==
X-CSE-MsgGUID: zG6skzWzQTmtRO83sG1k1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36952333"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="36952333"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 06:47:57 -0800
X-CSE-ConnectionGUID: m7bJiesLRA2gifUlzWV11A==
X-CSE-MsgGUID: VQEeyCBxQ/u4YocU35LRuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104583963"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jan 2025 06:47:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 06:47:56 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 06:47:56 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 06:47:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwmwCuNItyRKTz1WwtCVKeppOgS+8hLu/X83jxyhIoY8tmvmZzkNA56C05IXB4EQG1iHThaEiyx9Xp5gCIZWGYp9UjU5Y1JLSE+UX12ffU0XkH/OLPTAvJHI7JqMhE5LIZBAFk3ENeLwNguK186fib/CW+NHucRp04Q9WlnsqxnV/J/Jf29Ei3Ec2kvxFVXabHiBTxD9vVdXatcr+8y7SxJ++rpzTzfjNYRCzavFo1o0QjD5+fW97vZ7oExzJTBsKjCaNF2OGwixjAMW2evba/mx9/akY4zQwIDfnxAtGX5XsiFAUPq8MMkvtJk2HkTsopst+nEN1fBTiuYVcePUOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TX99YJ5CoE0eobeH004Vp9bR+wdVL5tm6RpQ89fd0go=;
 b=qqQRuQdfqVTshoYxpTKtt1+/1BFDd+PJZZKrdFoUkTbLGHk0Sa9xrGQ24cWLCRyvmMFX24yJkW+rD5/kKCmZvaJ4g+EY8fc/ylrsHFWRSqasXbL1e42tGsGFVELFWzTQBw15UvoS6O3PeGKgMRhEdlqyA0zlpyDPCU9qkP93tD41QGuGnVD0zA8YW9VN5xl4PI2ijFGOq/bc79nYSm457veJ3LYWeEcBgRukJRrvAdyQ0T8hWLcZxhVjRDxdkgcw8l5Vwg12vBiOWbK+zx5PE97rFx+ois3XqEKAbjpzi7dILuz7QUrov3RIMEIf2FK0GGSmf9Nti7GkatzmPi8bSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH7PR11MB6793.namprd11.prod.outlook.com (2603:10b6:510:1b7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Mon, 13 Jan
 2025 14:47:54 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 14:47:54 +0000
Message-ID: <a20e943f-99a0-4382-b513-59b4979042ac@intel.com>
Date: Mon, 13 Jan 2025 09:47:52 -0500
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_tests/inte?=
 =?UTF-8?Q?l/xe=5Fexec=5Fcapture=3A_Add_xe=5Fexec=5Fcapture_test_=28rev10=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250109004403.58162-1-zhanjun.dong@intel.com>
 <173638721304.1474787.12996179438277855344@b555e5b46a47>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <173638721304.1474787.12996179438277855344@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH7PR11MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: a3050b47-aa2c-42f3-2366-08dd33e1431c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c3hERXQ2M1ZUay8veHFBaVpWWURBdkJyZlJoQW1veVBISDJGVWo1MGxhK1I2?=
 =?utf-8?B?dzcvcXl1ZHFCaEs2T3FyeGtWM2VrNHV2amtNMUw5bmpISkFFeE9VWTV4V2Js?=
 =?utf-8?B?ckZrR3B4aHJwOVNWWWEzbkdwOExFYXgvOGNNbXFTVitROG9naEorZ244TXB6?=
 =?utf-8?B?cGZ4TkxWUVQvTkl0MTRXZlFFVGQ1OGdTWW9WYlVvampLc0ZDOERpRjd4amY4?=
 =?utf-8?B?QVd4WGZtYzRkSE9hWm00NjdRRys0NUhuY0pPeVlIK1FsTjgvNVhOdGVQZU45?=
 =?utf-8?B?YkVCZmllT3lVQUZYeTlHVjBUNE9nM1JleHQxSVFWUDRmMFBweHIyZlpiK0NQ?=
 =?utf-8?B?ZllkNzIzeDF3blVZWUVZSUl3NHBXQUJmU0pmcWx2eUhCWG9qWGlKbU9pd21Z?=
 =?utf-8?B?amtvSldDTGh5M2xRQU9PcTA0WmRUeDl5Z2FKNVljeUwwbndYeWRyNTFoaXlj?=
 =?utf-8?B?MzE4WGNmSStWYTE2RVpaY24wWG5LenR6OE9NNTl5cHJ3dm1JVnByeTJrTE5Q?=
 =?utf-8?B?NnNiZTNoVnhmU0xwYlNYM1lVNTVWcklENTNNakRGM1RqT0xmbFMrSXFCS3pT?=
 =?utf-8?B?LzlPdWk4UEZxVFA5SzYyblBQMzZoSEN6Q2lLdVN4V010cU1NSU9XZE5jZlh0?=
 =?utf-8?B?RjlCQkV3OTY1a2FsZXZIUHN0RjM1SGttVDgzMzJZMU5xc0xWeTR3NUF3OW1W?=
 =?utf-8?B?TVRCT1Y5eGZaNXRiTkdBVHZPVnk1eXdVVis0VlQ3QkRNZnY2YTN6S2tqZ1lw?=
 =?utf-8?B?YlE3LzQwMWJwRDNoaGFlWDJIcXo2Y3lIMVRpWXRGVWswcGdLcGZnZWkwK0Ji?=
 =?utf-8?B?cHBLc3pFdFIyQ1NCWEthOGVaSGdlNDJUbllBSE9rbnZBaDAzRkM5WXp3M0dh?=
 =?utf-8?B?RFVVRm1GaUdVWXlPTUI0SXAwYkVTdWhCSzdMUE02S2F3OXdRY3FVLzcrRHAz?=
 =?utf-8?B?Y0Q0cU1vRzk5dTFLYmN5UGE1U1BqRCt1YldYbityQ0tqTno2TVhsY0Z3dmx3?=
 =?utf-8?B?Y0pOdnAwR2Z5YjQ3WXNyMjJXckI0cWZzUmp4WlkyaFg3TjR2c2h4eE80L2gz?=
 =?utf-8?B?TEpRS0FyMkxyNzRRNVdtRzEyRmpVVmpOSDF3K09Qb0Z5a2Z2YS9oa1ZLVEFN?=
 =?utf-8?B?WU1OK2N1OHZFSWJFMkVvZitCM1JRbUl4Sy9iUGhwdnZzaE9YMEFxRlF4VGdU?=
 =?utf-8?B?WmhuVE5vUmFUa2ZmZDFqNnlRaXd2aHoxVHk4ZksyZldzWnpXZWFySWdiaU5P?=
 =?utf-8?B?LzNvRDM5ZjIrb3h6TUlOODc3TDhSNHJ3bDlNNm0xUjNnMXE3bDluYWRCd29N?=
 =?utf-8?B?YlpVWGF2SGgwZDZ3Mm5yUEJQUEpYU1VqQUt2b3VlengzY3U5dFlybzVtMVUy?=
 =?utf-8?B?S0ptM3ZvdDdlZWlJckZvb21qR09NUGx2WlVmZ0pXb1BIck14OEozeVE4SDRF?=
 =?utf-8?B?eG54cXp2aTBmejR6SnZvNzRhTERXSy9XZVRZbGE1QkMvWUxxdHprRlJzU0M2?=
 =?utf-8?B?WHBtMTVKOVhxUzJVbUVtOE1YVERiWVNseFY0NzRPWE4yMEp0ZXJvUEluZ3hU?=
 =?utf-8?B?QmVyTlhGV0NtVFNIaU5JL254L3NYcmNNYjRMR1RmN1Avb05hRGs1OE8xL01X?=
 =?utf-8?B?dElZMDhWM3FQSWJKZDl6amwrNU0vZEVvdVp1UEdMWlJPR2JJWDlUZXJRbk9T?=
 =?utf-8?B?akFCYTRXTEYzeW5qMHNueXlReVh5NnduOXEvQXB2Z3B1WTZadFBCeTQ5cE5m?=
 =?utf-8?B?KzlCdkpmcHFMSG5uMnBaSFgxczVXL1R2L3grbHg1SkpvWlNNa01jQUVHdWZ0?=
 =?utf-8?B?WllDamIzREgxNWNBTU40UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M09mMXF0Z2JFdGxuNHhEYmZoSmQ0MDFhSzRwZ2IxZUJlekVwUnRHZTh5a3ZJ?=
 =?utf-8?B?NWwvY2szOUhWenpEZm9CWWs4L1pTSVdOWGVDUmxUclVyU1REOWFCaEFzV2o5?=
 =?utf-8?B?cExGMDJtVXNOV254ZFFVNkhWK1J4QUdiVEEzZmt0bmx1M3o0RzBHVEtmdHMz?=
 =?utf-8?B?aFI3ZXYxdzdpUnIxT2lDTm5HWlRQRVBzWlpZRjJ6Y0plUjg3NjRqVGxuWFNk?=
 =?utf-8?B?UTVwVlJtUzRDNW5qUUVqMXl4VUt6SU9Bc3Z3QVZDRUQzR05YYnJNN2poNVNG?=
 =?utf-8?B?R2RrM0ZjNlNHMWZ5ZHNpb29sckdqTU10emhRbzRrZXNvR05ORzVnTkhXMVN0?=
 =?utf-8?B?M00zbS9GVWhtK3JmMFlDNnlUZTNaV1I3bWNRdnlPNWI0ZHE3S0t6K3JDOUN5?=
 =?utf-8?B?U3VnenFPRHpNTWl3WnBUQk91TUdHdko0RVR1YTdVdGNUbERrWFJTaUwvK3Ra?=
 =?utf-8?B?SXY0bmN0WllGUHhMUlFMTDRaTEhaTVBCZk5QTEZyNVFzUHZqTC82NmNNV1BB?=
 =?utf-8?B?STVodk9DOUl1czNlU0NCMCtoZ2Z6M0lHZUJ6bEdjRDMwd1B1SGhxL2ZERERq?=
 =?utf-8?B?MkJDSzRNRFYwUlJtSzhtWGpKcVJWQVpKYWRHcjN4U1ZrMnFhdkozUEV6d3FE?=
 =?utf-8?B?bVR2WG83NlFtd1lqZVZ4eDRyNVEwUjhXRzVsdGNLaUk0N3pJM3U0SjViWEpF?=
 =?utf-8?B?cU8xRVdJSHZIMWliOThMckd2YnhnOFUybnMxVk1QdkdYTmZrVUhxOEI1WXA4?=
 =?utf-8?B?WUxNd1V6SC9vVnZYSS8rdSs4dUFHcE8xUCtDa0FES1IyYXo0bkhuNVlnLzJI?=
 =?utf-8?B?SU4xVm0xeEJPQjVRdlltV0xyY2xrVmh3VFkzdDJWTUFidysyalU4MFRndVBw?=
 =?utf-8?B?MkU5UC9JMWlFeGliNG8rcUk3N1p0V1ZMTG10TE1tWmZIVWwzcjduZlI1d252?=
 =?utf-8?B?cWZBOFZQTTVMNXhuOTZsaWtqbDVjSUNTMnRTTnZIYk9sSFJ6Tjk5RDMvbHJ2?=
 =?utf-8?B?Umx3MjMxbmhxcUVuQnV1RStTZ3NVTS9DbzUzbS84VVRWNDNCcGRjNXhPdjly?=
 =?utf-8?B?S3l6Y0x2SlU5ODEvUFVVZmdzeDhOanJXd0EyeVdjczl6THlTYnlScllGS3RW?=
 =?utf-8?B?a0JnQXZYWlVyNm9UNFRSTFpEQ01yZnMwd3ovN25ubGRnUmhvYnZFbmVOVS9r?=
 =?utf-8?B?SXl5eStDeWZtM2k4c3ByYUVvK0xxQWd0eHpkMjZYZDJVYVl4NDl6NmhnUlg5?=
 =?utf-8?B?aTlzMGZESUFReWJoZ3JRa09mUk1HZy9Fc0FBTHp4RnZUNVdMbGE1TmFRTlFC?=
 =?utf-8?B?OTRCSWJMSHZXVHhwVWdhQVRDS0NIVmduWHVnODdKN25hSVI0ZFpBYnV2OXhU?=
 =?utf-8?B?VmwzeHR3Rk9Ed0cvTzhMWUlrT3cxc1k5bVg0MmlvdHNnRmdOZGhRZzZmMlRt?=
 =?utf-8?B?M2VZSDVlT3BJNUNlWm0yN1ZJcjZhazRvV1RVTnZKam02Qm9TbVUrN2QvZFhR?=
 =?utf-8?B?QUh4VEJKR2JEVWFoRlVFanhGMG5PNFpmNFZDVzVXUXNEY3JJVHZtMHNNLzhs?=
 =?utf-8?B?SWc3YmNWTHdLUVE2SXhQNVhxT1h3WmozQ2RVeGt2b0svcXJxVkdwNnZtVjc1?=
 =?utf-8?B?NmVFWEVPYms4S3FuMEt2dWlpOTlyTUd3REJySVZNSFpleVBOa1d1ejFHZ3U4?=
 =?utf-8?B?a3RpK09zM1BDL3d0UUIzSkplNUMySEg2ejM2cllHY1puSUxBeTBsSGtVYjli?=
 =?utf-8?B?dFd4VnVkY1pSQTNraXFWaThIekpsNU1KcWlvR3lkZWt6d2lReWc1dTlDZlRx?=
 =?utf-8?B?dTZvNC9WSE1RQVBZb25CbE5ZYWRSMkRHMVZEYmM1SjY4OTVPRTVQRC9tak9V?=
 =?utf-8?B?Ti9ydzREWGRQVmlkYXQxTjRGY3l5dURneDhzc1ZSOHFDZ0x6amZsK3MvM05t?=
 =?utf-8?B?T005Qy9ydExsTjQvRkxyWGR6MGVLZ1BTRHRRYSt2bWRKdnY5WlBhUUFBZkVw?=
 =?utf-8?B?MFdTOEhuWTFsa2E5eXUvMnFlMUpRNmJtMHlZUkRRNTYrVEJDTjNLcUFoTXBW?=
 =?utf-8?B?Q0psM2UwOVNTRFhXMENFNlpoTHdxZlgzU2hDOHA3ZTFJSVk4VTNrWkZ3a3B1?=
 =?utf-8?B?TmNaWGJRa0UrNVRuMTFTejRrUU5xaVRxWFlpTG5GSGtUcVFHb1JnQXN1clh6?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3050b47-aa2c-42f3-2366-08dd33e1431c
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 14:47:54.4942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1xmIQteMvCKYgzlWoW3hWOw2lRDSMiB7cp3GjClg9GNQBx0B9WkKAc3CvohUUqvS9L+c9smJf4R1E8j84eCqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6793
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

My change is to add xe_exec_capture test, all i915 BAT failures is not 
related to my changes.

Regards,
Zhanjun Dong

On 2025-01-08 8:46 p.m., Patchwork wrote:
> *Patch Details*
> *Series:*	tests/intel/xe_exec_capture: Add xe_exec_capture test (rev10)
> *URL:*	https://patchwork.freedesktop.org/series/140007/ <https:// 
> patchwork.freedesktop.org/series/140007/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12407/ 
> index.html <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12407/index.html>
> 
> 
>   CI Bug Log - changes from IGT_8182 -> IGTPW_12407
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_12407 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12407, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12407/ 
> index.html
> 
> 
>     Participating hosts (38 -> 37)
> 
> Missing (1): fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_12407:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@i915_pm_rpm@module-reload:
>       o bat-rpls-4: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGT_8182/bat-rpls-4/igt@i915_pm_rpm@module-reload.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12407/bat-rpls-4/igt@i915_pm_rpm@module-reload.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_12407 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   * igt@i915_selftest@live@workarounds:
>       o bat-arlh-2: PASS <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGT_8182/bat-arlh-2/igt@i915_selftest@live@workarounds.html> ->
>         DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/
>         IGTPW_12407/bat-arlh-2/igt@i915_selftest@live@workarounds.html>
>         (i915#13393 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13393>) +1 other test dmesg-fail
> 
> 
>         Possible fixes
> 
>   * igt@i915_selftest@live@workarounds:
>       o {bat-mtlp-9}: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGT_8182/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>         (i915#13393 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13393>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12407/bat-mtlp-9/igt@i915_selftest@live@workarounds.html>
>       o {bat-arls-6}: DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGT_8182/bat-arls-6/igt@i915_selftest@live@workarounds.html>
>         (i915#13393 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/13393>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-
>         tip/IGTPW_12407/bat-arls-6/
>         igt@i915_selftest@live@workarounds.html> +1 other test pass
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8182 -> IGTPW_12407
>   * Linux: CI_DRM_15924 -> CI_DRM_15927
> 
> CI-20190529: 20190529
> CI_DRM_15924: 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 @ git:// 
> anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_15927: 9e5828f71dbb3bf6dff6a2bcfaa761d048344b2a @ git:// 
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_12407: 0afa7b205dd6a755ad29c432e9bcca2d0d552917 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8182: 8911eff2c6c06d2929c6072f3ba72d2d991985ea @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 

