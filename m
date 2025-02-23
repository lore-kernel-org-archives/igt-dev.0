Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB07C021B2
	for <igt-dev@archiver.kernel.org>; Sun, 23 Feb 2025 12:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCA210E0CA;
	Sun, 23 Feb 2025 12:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGhUvgSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2C910E0CA
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Feb 2025 12:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740312766; x=1771848766;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Ss3/DwIHTmj6gHH54CYGODFgoWJftLVrGCkukseTmLI=;
 b=cGhUvgSyq/XOn+MECYY03Va/oHHieIh4PGF+6KFVNDdW3wfVAxYgAD9C
 OY+UtaBXA1IqmaB4EZsdkWbpwOrhVxaGVmagsKU5q8ZwU8muKmePqh/gs
 uOumybrXME0O7X4BJYKfJwjLY7un/L+9cJurYlsySEsLLzx7lgSYubdUt
 lduFdoG49AoPMlnvHztEPJHBvpH0QRqTCro2oHXKC0XtR+YvmVhh+F2L+
 2TDCgeD9u5RvLGbxGTqndtObEVeVy9DjJDDiD3mxpyI04uHJySsddJAKh
 6EVHSJK2zUCl3MQRg2/Rd38QStjFV2hpX0iwfL0BsqNAwUT/XrtBXGPw1 w==;
X-CSE-ConnectionGUID: MBzRsHLDT4Wh3/+0VACDpA==
X-CSE-MsgGUID: qq795EB8RruHTdIdMlKTNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="52065945"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="52065945"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 04:12:42 -0800
X-CSE-ConnectionGUID: BkRc5H05Qw6ydNsufp4cFg==
X-CSE-MsgGUID: Mks+kLc5Rb2KpE+1to3JBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146711258"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2025 04:12:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 23 Feb 2025 04:12:41 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 23 Feb 2025 04:12:41 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 23 Feb 2025 04:12:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBwrVmn9YMGuHnskgO/OV2m94kBasHXTiQVTkuTF1SS/rpDwa7USkMN1DRmKu7uBMoCYtdjMeiR0FuhXoIkuz6c3gchKeBOQBrqBU6tHgwL4GfAKTJ+NRPYvAb693DegGD3yrFu02EVzLef/jJUH12UGI39H3HxQMh0dLO7aHytZtZm/bcQb7qUvnAslvr4ZUQDxsulrL2dwS0mgHePj0XPp1rkvxEkBlbCWnZF2KPdF7zwpxgb+ByzRs4OwRaPxruXeo0qYTJk63m21ratVZNUjBTP+GgWi822p7gAe0dVLCtklM/MXpHPmAfDdBZMbmv5hda6Kch3gflrzSmmlTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rps3PUb5MJ109tJbWeE4ggMaheRe9U4HP8W/XY1fUq4=;
 b=kL/n9oiKjeeRykd9kEv1lPypyvTw57hWmbpWkkOhofHKVzjkuJlGZxyTd6yuBonep1aZEpHsBIn73+msc6EWVAlELbi9GMbaSLDczfO2eF+8Z9larXQPdj4M4t/p/WZe0XPjSvXr8BkBYayVMrBMObeNU0mfpjr2QRwDqR+Pauway/kIR8Dff6Pcy2w70FJfcswingTSizX1Zf2titybcdP2nIgl3AzRoZg0aX3qhWPWmKDFheS0OLSA0pFpfksN18nfuPn9PYB89JpqhZLZHm9GTRcNJzuUQE4Bs5kWJt2nWUADF1j3DmTJYWU2NrDpNOPjQGl2qLfcKel5mCat+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SJ0PR11MB6814.namprd11.prod.outlook.com (2603:10b6:a03:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Sun, 23 Feb
 2025 12:11:52 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 12:11:52 +0000
Message-ID: <f14e0202-7f5c-4d31-a420-ed0d02f0694c@intel.com>
Date: Sun, 23 Feb 2025 17:41:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 0/5] tests/intel/kms_cdclk: Refactor mode setting
 and CD clock verification
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250217213531.402162-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250217213531.402162-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0107.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::25) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SJ0PR11MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: ee57bee7-8930-4730-ebda-08dd540341db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVl2NWtXWnBVeGNaVWdHZHdoODYwaXlZaW11d3BkOUhqZ0tuV2pjTDN5WC9U?=
 =?utf-8?B?SGJJUGVoRlIzcWJnQkZXTVdzTUU3WUZrRzh6dnhDOVhBZ1lzTXJGbkx2Qm12?=
 =?utf-8?B?L2p5R0xRVitQRW8wUVd0WEtCQzJwUWRUM0dUL1dJbmpPQnA2bldCY3F1QUNS?=
 =?utf-8?B?UE93QzR6cGVjY25iL0RpOU54d3V0YllPS3ViZWdhUTFRTVRzSVN2NG52K0Y1?=
 =?utf-8?B?QVdoVUdtV00wV1dkUlRTSmFOK2lhalVpdnc4VUZQYkdiOUlUZUR2UVFiSlVI?=
 =?utf-8?B?V0dZREJmYU9ZZXdncm5xakFPRE8zMkJJR1JpU1NpZm9ZRG1La21xSHBYWWwz?=
 =?utf-8?B?SGIzaS9tdTQ5NlNlcjY5MGlTNGY0NUF2SHhSR2JsaWN0Y3dxcFpqam1tMEFB?=
 =?utf-8?B?VXBoNVd5S3g0ODMydXFyR2hQN0V5TGRWWkFFQTQ3c05hQWk3QnlDTUVwb3Ux?=
 =?utf-8?B?cmdGTlJ5ZEhyMDNCSTdMOVpnQk1USWU4R1VHVVdCSjEzeUVGaTNUbzZjeTkr?=
 =?utf-8?B?dG96bFptSzFnRXoyc3ZKYXk1VVFmMjhJbk1RYTNNV2ZtT2hSL2pvT1hQUDdw?=
 =?utf-8?B?THRnZGFTRFZDRGJybkNDeEJuSUxERGJhVkE0WGJrMVdhK0FDNU1SZTZ6eGp1?=
 =?utf-8?B?TUdocTN3YitIOENodW1UbEtoR0JMZU5QcXRZTUlBUjlHZS9FaG14eUJ1TUNj?=
 =?utf-8?B?SEROTS82MEtLOVd3c3VyU3lrSnNpNzJ1RDNTS3h5eEdPL05pUG51bFBFWHBv?=
 =?utf-8?B?RjF0ZExGdlRDSTNiZU9mcExvVkRZSVRmNFFxQW01SG5RN3N3QkxIRzFHZFZ0?=
 =?utf-8?B?UTdrYlRVU0ZNYlVpNldNSXZnRWdsVmp5VE1wWmx0bXJLdDUxckNsRkU3b1ZP?=
 =?utf-8?B?UjNlc0xSRitRd2lIdFF1T2txcWFYU29nSFpXazBZOEh1T1BiaGpiM1VESGJk?=
 =?utf-8?B?S25WZzJzNXRNODNicm51S3JQUktTV1pjVU9Yem5URDJYTjUvOEVSZmdJQUhG?=
 =?utf-8?B?NUZLT2prYVZ2VzBPemxDaWtibnhiTHNDNXZvQWdPTXIrYUxLdXVkVDlyOVdS?=
 =?utf-8?B?RXFCaEFKSGxHcWR2eTVBZWl3N3RWSGJuUjludlJVblk0d1dscVplWVFLZTFa?=
 =?utf-8?B?N2ZzWGIwNlBiN0d5M0JKK0hvNmFEa2NYODF0djNEbGJnWVNnb2I1VktTK0lX?=
 =?utf-8?B?ZW1aWUFXZjhQNVhBemFaT1gxeVRTMVh3UTBHangwZFp5QmJNZExnWVcvTTBP?=
 =?utf-8?B?b2xEc3BBaFRFNXVFWFY2SE5seXhyNGJiZFV0Q013Vm1YQkpFekFSSWxsaWpI?=
 =?utf-8?B?cG9tbm1iUTEzRmUzZlBSdXVLMnl6R1ZkVmVKN2FxMEpTdlNORHl5VWp3ZE10?=
 =?utf-8?B?MGtPQ3FCeTJ2QTl5NHk2S2paL3F1K2llQzdTekY4VzZraVdpMDNlSk5QME1C?=
 =?utf-8?B?MHVPSXl2cHkyTmpENDFSK2Z1S2xJdEc4TVJQdXJrTlpYTnB0VnkxNmhGbHZS?=
 =?utf-8?B?UTN5a3NnWGN5bXhJdDlEbG5SSm5La0swWnJrQnVNUmEzclNMS3BuVXVBRk5J?=
 =?utf-8?B?MmczNXlYVmxmYzhMd0Fxby81b2ZWc3grR3JJSTlhUDhuc2NoTUx5ZlQ1cld0?=
 =?utf-8?B?NVJOOE1Kc2g2OFBDbExPZisxd3M2MUZRellUVzFYbnUwT1plK2pBTE92YVEx?=
 =?utf-8?B?WjlVTlZwcWcyS2d6bU1qWDNsQzNmWVByY05JMFBBdmg0OGVTTXBFNkdsMmpl?=
 =?utf-8?B?Y2NZQUlVS0dkaWxNV0d1Rmx4TVlPQ2NvNHlKblhiYWZUcDc1bEJYZFJtV1N3?=
 =?utf-8?B?eThTWkdONlhCUmhKSDI5OXJQQUJCMEl2UXErV3ArSmIxQzVDU2FSVEJCNHJt?=
 =?utf-8?Q?4r6SW202XZGXn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHpwYXc0WTVqdEtNWWxDWmVhTW9qckNFV1E0YmhpalEyUVpTa1pnTlQvZ25u?=
 =?utf-8?B?QXlZdnZiQTFjZEp0TzFrbnExc0QydEhmTmRFYmNCdGdWU2ZzOUlxTkdqYlVV?=
 =?utf-8?B?cWk5ajRzZ1pZeXR1cng3RURKQVR0UmV6NDJmNi9POWpxbUV0a1ozQlNpdXJH?=
 =?utf-8?B?WWN4NWc5b0l1K2UwZnd5RkxVd2k0czRweTRyalA2OS95bU03WGV0U2FqNTFM?=
 =?utf-8?B?MDlnLzNIam1IL3VvNDFHT0xjbWxkRmJjdFp2UnhBQllRUk5LRGRLbitPYWwv?=
 =?utf-8?B?c1c0YzBHcWc2NThyVXF2MVNtUGovaDRQSnMvdjJBYXdZb2RXaG8wWjNsOE1C?=
 =?utf-8?B?RDJ2S1B5TFlVOWFmQ3k1NlVKNWlpT3ZYMTRxa0NyckVuelJIZUx5NjI5OUxy?=
 =?utf-8?B?WWJWVUNxQnVmZnZHZU03U1k0VGQyT2lQZnZMWWZpMGpHc0VZRHlYTEY1UzJw?=
 =?utf-8?B?NHg2MzEzNlRHeVNFTFdPNEdMV2c2S0h4ejRqQmVtdDlVZmJmNTNGVm45ZVB6?=
 =?utf-8?B?NG5vNEh3cGwzMWpCQ1k1dVpkd0RMYTE3ZmhJcjRBS3E5K1ZQVWxNb1B5ZXVt?=
 =?utf-8?B?OUkxZm1JdHFCRkl2bjl2a282Rm4yMUh6RG5YTGNkUU0wYUxwK1UrWU1OcDRZ?=
 =?utf-8?B?clgxTHJ1M3IraUZWT0J5NTBnUWZaVzE3OE9uZ0NPZmU3OEVMbnN5SFo5RElu?=
 =?utf-8?B?cW5icjdCMjh1V1dGZWNwMlFaM2MyeHZ6OWZmTHYzS2U3WXc2ZjltSWFlM2Zv?=
 =?utf-8?B?Wms0Kzl2dW9zdSsxejNoWVZIamwzaG5nbnF0bjJvNkFNcGpkKzBqRSswOVJD?=
 =?utf-8?B?cnlKajV5amxLdGw3d2F0U0FYZFp2UEo1YTFMdlkwQ3N5MFB4Zzd2V1FMdkZP?=
 =?utf-8?B?OG1kZVgrK0VTcXpBYmMzNzZhbUI1dHgwM2tnclF3cWVkS1NNRCs3Z2dROUps?=
 =?utf-8?B?SkJqV291TDFpRm9EK2NjcVVsd1VtZEZkNHhHTUNRU0VubGZqUXE0MjZnN2xB?=
 =?utf-8?B?UFM0TDQzSW5YMU5sWUtON3B3amxlVzdwVURFbjI4NU1GbW9xeVdscllkTnZF?=
 =?utf-8?B?d090bUxESTNtZGxDS0tvVHVlMG43azlraFR3eStsck5vdVlOQzlaQWN6c2Jx?=
 =?utf-8?B?MHlad0VvUFdCZFNPZ01VVVRjWXcyNFZKdXdEVmFVLy93Ym1wRWoxVTAvUTZp?=
 =?utf-8?B?bUZScUQwcTF2WUFGTmJZVEF1Y2Jna2tOd2RlRzVaRmNRZThYZU9sQUxwZnQ4?=
 =?utf-8?B?Q2pDSkpTUTlyTlVLUzg4VHI5eUk1d3g0b3dXMi9yaDdvOGw2NHlYOGlwaVps?=
 =?utf-8?B?V0dJaWo1YUZDeWJnQkl3c0lTUTZTdmlYYUZMaWVpM08xSW0rRUtEclpLYXQz?=
 =?utf-8?B?djNYSU9pN0JhQ1hSY0NLWUNMV0V1VndPTUpCcUdwYTJOcmpKOUYrbDlRMGxx?=
 =?utf-8?B?ZW9hSEZBV2x3dWdUVDNKWEhER0x5cjVPaGF6cUU4empWOS8wanZydit4L2t6?=
 =?utf-8?B?dmJJbWVmRU1LVzBudTNtdzgvL2VhMVpma2MyYmVOcXYvUlJzRnBFRjR6bng2?=
 =?utf-8?B?cnhpNkg2bmpVWUVNTXcwTzgxSXhmYjVJdUdodWdhRlNJNXJZY1dmNWlpRUVz?=
 =?utf-8?B?My9wbVpYNXF0YmF4ZnBpS1huQ3pUOSt4M05CWmhUSkxibWEzZzlJYVpDZFJS?=
 =?utf-8?B?TXpqY0J5NDlCcWRYeHRaaFJzQkVZZzBDT0RXbWZvQ2U5MmdNRkgwN2l1VGg2?=
 =?utf-8?B?MEpjczJmMXRPM2FKUkFLTmZDSnNwZjVROUljelFTMjV3YlZHbTk3ZkZlUk5U?=
 =?utf-8?B?ZEVFRDZhbDhaZExuU005WHpYOHBwVEVpVkd5eUpWL21LcGRRSUJvZHFaQVRJ?=
 =?utf-8?B?dXhQTXVrM3gvSHRBOEVESmZvZEp4VVhVRlM2c2VTZXlrVURsREFDa3Uxaldt?=
 =?utf-8?B?S2p1eFBuajh4clBXbFBZOFdxbUV1bE9xa0Jrc2xzS3o3N0tWWkZqY0VIRGJ3?=
 =?utf-8?B?Tkw5bGptUTBRQXdpMXNCY05NRGZaaTlNQlBlZ1pScFR3d29EL1g2MDVzTXNU?=
 =?utf-8?B?dFRCSUtNbCtMN21RdzMzQnlWc2Z4YW5YcDZGWU9mVmZ5N2QrMHpkaG4vckZ5?=
 =?utf-8?B?Y3VXN1BlYVlwbVBqeGpnRVNMWXExNGRBbU12YTg2NXdqdVg5ZDRPVThNZFY0?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee57bee7-8930-4730-ebda-08dd540341db
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2025 12:11:52.6152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMMAkCajmLuu8YAjJHU+O3qRz5B4fiLdM+fZ3bEREy/WvAOYNhjbkUpMuI4wycuEkWErbj1jhCPQ3DODPxQ53XXCRVWk7NiHqwV0oMmwyus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6814
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


On 2/18/2025 3:05 AM, Swati Sharma wrote:
> Based on the review comments received, add highres and lowres
> functions to lib and made corresponding changes in the lib.
> On top, broken initial patches into smaller patches to better
> review.
>
> Swati Sharma (5):
>    lib/igt_kms: Add func() to read and parse cdclk debugfs
>    lib/igt_kms: Add highres() and lowres() func
>    tests/intel/kms_cdclk: Add conditions to filter valid outputs
>    tests/intel/kms_cdclk: Introduce set_mode()
>    tests/intel/kms_cdclk: Use igt_get_max_cdclk()

Minor changes suggested in Patch#1.

Series looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>
>   lib/igt_kms.c             | 110 ++++++++++++++++----
>   lib/igt_kms.h             |   4 +
>   tests/intel/kms_cdclk.c   | 207 +++++++++++++++-----------------------
>   tests/intel/kms_dsc.c     |  14 +--
>   tests/kms_display_modes.c |  14 +--
>   5 files changed, 177 insertions(+), 172 deletions(-)
>
