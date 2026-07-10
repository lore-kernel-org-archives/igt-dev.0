Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA401C43458
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 05:44:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7054310E135;
	Fri, 10 Jul 2026 05:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XhJ8LzIx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471FA10F765
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 05:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783662234; x=1815198234;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dvn6e70q/9K2u61kuWWGVMj0cTsi59MkQELtcNtVe+k=;
 b=XhJ8LzIxgZRQGL0+J7W8EVaN03fp2h9vmEAx/dbN093wFt/enh6n53Yf
 38sGNdEtGI8W5zTfQzqQAmgkE4GLgDfiYPPvCDZ2ZE6QGLn3BxTInW8vN
 zxt5jDV5sFIvdKIVtz8Mth8AKZc9oz1Q3CPL/ABFfjJHXOUWqrxqBq9QX
 5Am/297rgU8gTnLQESGZ2M4ZZnpevMZZCs+yKb+aokHFZYhABjzcVQnLB
 f6WYEYf4VxOQjEyBhlz8gNe33v3uKwsOSi2KpnTyI9uiI7OTTOIh8dDXl
 UdMlA1UitoCqhFfEO/QfFlvUQ2T9HXkrIxp1LNqvt3WJyLhZxB6H2uswc Q==;
X-CSE-ConnectionGUID: QdpmDKUMT4Whpy48T+DFMA==
X-CSE-MsgGUID: zUmwgKeTSHSjJrfGqHD6NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84550160"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="84550160"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:43:39 -0700
X-CSE-ConnectionGUID: MORcVwR9SXaNDD9Jg+pTIQ==
X-CSE-MsgGUID: OHqDMYXcT7Sre9QSftdDnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="278027818"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 22:43:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:43:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 22:43:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 22:43:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MONwHu5//FTCmaZ2qiQ7WM5naR1aLraQIYFtnA4rDU0KBP1SZO9cbd5EkIrgnKyWCqaeJ7NcEAcJcLzvh8z2S3IR7sBVjNZ2xGco8+osMtKE49eYns/EEe40iMikEglfsDJKyQYUFDrayBRmxprGZRO9WKksRBQFZ/Rz1Xw5xCcJhYvJiS/IztqpbZEzas6UabNceBg/xx4Kg8qAQ/iANgqCCo0KFEXEIYU9FUwk1slSIXiLSN3CKw2wQy7ZQ55/Om0zMyxHDWKSNlCbNpqCtsqKs+KY+7CjObT4sImFj9n4uEmPdi33NSM6kbvwIT0BIOXtRhyMddeDDqkyz92DdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdJx4GGhL4p49s8vMvXf+wPHQcWDTHqb6vZWuyxhqmY=;
 b=oT7NhVD993SMc98j5HBhF0qjtPifR5iyTKoJ2sho1zzrHb2g6cLUZyIVLJIWWOO/9lNP2UYTGUw/CBQg2KkjrHtDr29y6OsPBrm3EXmAVnUnCnZWJJUCln96D89Fj1hnEW49NmYeRQaTYFYPHrD0djcMP4xfSQUdI23/DkxduH9UUbEF5GsffjOhvnaCyVazM3Cfx5HDdTlfYbKAHjaJhEFQ5nwJImxhdmD9RqIyHwk1J1NocBLkmyP7l7P1L96wS2bap1KvbfOA+qhw7/jpwSfOCYfdk3Rqn4OB+GwWu8Dit4Rp37TrhmiS8HslqXdqHep+QHVoaNMMqC2jYJqZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SJ1PR11MB6251.namprd11.prod.outlook.com (2603:10b6:a03:458::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Fri, 10 Jul 2026 05:43:34 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 05:43:34 +0000
Message-ID: <06216e47-270a-40df-a43c-f7ef067625d6@intel.com>
Date: Fri, 10 Jul 2026 11:13:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 08/12] tests/intel/kms_fbcon_fbt: refactor the
 code to get the right fbc status
To: Vinod Govindapillai <vinod.govindapillai@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20260601204407.39934-1-vinod.govindapillai@intel.com>
 <20260601204407.39934-9-vinod.govindapillai@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260601204407.39934-9-vinod.govindapillai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0239.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f4::16) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SJ1PR11MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: eb898627-be67-49ae-7061-08dede462e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 2HpzpmVEFKGjXCqR5tVkmzDh2QC5QW/u+VrQ2vjJiwZoJoz/wbgE85pfY7gwsg/CIqxdJpYAVa18UtfWzhRV3+3DilvJSPaL79zxs+lQgEOy2f42iqIbFmK0jRMogY8qjfmRPoYQX2ft1RbLNitXB5ZDw4KtFDsgwY8DHx+FkshjwmPTZVLMNI4+1Qx5W6sgQEeeBZDGtbE7UtDIBYqPy8vbcuTNOKKoh03oRfxHdT/3iINxn1tfUuM5iqx1cZmu6922PkPZ6EBa4b9DegFi5WVAL10zjYH0xvFFImZ3Kc/drnnH9e6aIlpw1GqJoIKaLCNpESAPdMwR9xYLkYXhpPoYjzTFt8mQpgcqyobIcf320Bg2d61OZ46C6tS8E0DBDe0vPPsany5B478fGTwGYxa7cMaGfIB16DJhjN8fU/jgfB6EkqHy9xJFj7ve8vgcfXfbj4Ir8c1bZIyACaSWyWF8aFu41MbwLPbtrcxO9foT3kUdH+mUSbZF+ZOopFZAKRtAu7NpBRP7LHN3JU3PRWFKSwoBahioSIQw5ccVPk+TYwQXddO4bKSpFaCnp4nKS2v/3T5ZV0orwq8Fec7LNViF9rZ86ceGPMZC2/EZXgU7/YrbLC3QcWkx3V/vZZDHh8RdPe5mOcc6PdfMXciRrEm8PMkQf9Jdn6m0zmbg1oY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3BFbzBERVRiVVYxMjhTTTIvc1BiVnRsY0k3T2NYWkhPZ2pxMkd4MnRNcUVo?=
 =?utf-8?B?UVN0cVNnNEVsd2pNNnViNXdLMEthaHQwNlU3bVhmSUF4U2haWnNPVG5ZcmZP?=
 =?utf-8?B?cGJzZStxRG9RNm9Ma3NqaWIzUVl6MDJHaFVwY2kvdTJBUWhGQmZmYzBpWnJn?=
 =?utf-8?B?NGh4YTc0T1dvZWQ3dy92Zm5pWHFmVDZ2WWRORmF2dy9BVGwzMUNONnFNa0Rj?=
 =?utf-8?B?RkNoWE9uT1F5TE93RkJTN3Z5dHNFcmZLQ3YwV3l3bmpjQktDcTRkaTFWQ1lr?=
 =?utf-8?B?MlpBVGN6S1FsSkh3ZWNmZGZPRit6S3p6ZUMwYlhkVVFWZzJBZHpYbjByUnlQ?=
 =?utf-8?B?ZVB1alZPVWVob09xUUtuUEpabVRTVGxzNnZYMHYxMmxGbnZOaXpTdHpZekw5?=
 =?utf-8?B?MHJQWTJ3bzZEay9YMEpUdkNvSmc1V3FhSG9YZGRFRVV5cWcwZFNaeS8zbjJX?=
 =?utf-8?B?dDNTN2sxbHdncUlrR1RhUXgxeXhUL2tlZVllRHMyY2xtT2VDT0o5SzB2YXF4?=
 =?utf-8?B?UVBic3VPK3d3MEU3dDBCdmxodVZsNHVwbGJlR1daMnpURytWaExlRmt5dEpH?=
 =?utf-8?B?TE9ZbkZjQUVHMFZkd2RLNC9kK0dUQy9uWG9KVkF1L0hYZ2k0Ukk5RVVNRDNX?=
 =?utf-8?B?SkFPbS9mK2dXN0QzTlB2d21oeTRPTGV1aGVpWkI1ak1nME1JUzVTenRWeXor?=
 =?utf-8?B?eHFlcXFvNDRtMjBaOWJtK1d4ZWdFSXBWNkhNa3loVXpmMERrUGVKdEVrenNJ?=
 =?utf-8?B?anlCdko4Y0QxcXJ6Tk9zWlhiQ3Q5TXJwMjJtdE1ydVFTaS9RVlhzMDZmSWg0?=
 =?utf-8?B?V0dLTDBIdGFVSDd3elF2ZDgrY3c3YkFlYy9PcFM4cm9OVHNxaDFLZGVYVVdB?=
 =?utf-8?B?bHl1TWs2ejFxako0OTBUOGpXUUJiaTZLQU9sMmpiN2svb2NndHdMZEE1WTJr?=
 =?utf-8?B?Ty9tTVBDWHAvck15eWFoQWt0SjNETXR3TFVpS1VmR3Z4a2R1d1Rwa2NURytm?=
 =?utf-8?B?M1dENlVkTCtpL0dOUVh2TTJ5cDlWTFR4THIrUXphaEJ5d1ptZlFOS0tSQzIw?=
 =?utf-8?B?Slk5Y2srT2t4L3VjeGc3VDArR21zVnMrb3p1SXFSZE5lbm8zUFp1T3J5RjdY?=
 =?utf-8?B?aVdvTEZGRVBpdTh3UGdmemRPUVNMQU12UjNKQXRwaGpOdWQzOHRzci81RTlk?=
 =?utf-8?B?dExHMWkyZ2JNMmFueDV0WVk5MHE3UVJubXk4M0dzMlBwSEJzc1FnTy9YZkdS?=
 =?utf-8?B?M3dSbW9DbzRRaENVZHhOT3dEQURFdEpVKzE0eVM4dzBJallOdTd3ekkrY0gr?=
 =?utf-8?B?eis5YW5VRXVYN2ZrVTNNamUwRWNOTDlDeUlXMFBWbWpucUMwY0NUSzZ3L1ZU?=
 =?utf-8?B?Y0M3eUJQS3NmZXY0S09NSHllNTVlUzBldGtpVHB0Tis5QUxsaWN5T3lwNmY1?=
 =?utf-8?B?L2NGZklldUQvaEZEdlFBcmNRYlNJYm1TQUxsc3hDWDFSZFBFNTYxaklMQm5a?=
 =?utf-8?B?NFRQOFY4NFVTMFg4ZTNkcUZWRU1ZeXBNb1AzcUQxUTAvOGJVTUFpVlVQTEpG?=
 =?utf-8?B?VkZ0eTJBa3hqMHBpRWFpM2JQaWZsTHhiWlFuTW5aOXhQM3hWZElUTllnNEVJ?=
 =?utf-8?B?WEdQTHNXalVUYS8zQzNXZnhWQ3RCeDBHK0ozZDlseGhNb04vM3F4bjRRZUpV?=
 =?utf-8?B?OEkyRXkvdkQ1aGZiRjdNdE5GNmNJekZ1dnVqTlJNZmZBUmlvdzVvWlVlQXY5?=
 =?utf-8?B?ZDQxZlVzM2RsbWhlVHdHbHEybW9QK21BRzlUS2ordVdoUlAyZGJiOUcrSlps?=
 =?utf-8?B?cElxVy9JdjNwMGEwdGloejZTa0U1bjNrSjM4cjdUWmo5ei90MHUwazlTM0VT?=
 =?utf-8?B?eHlLUzdzZjNIaGpURkVzODQ0d3poQzhiOFJGYVV4YVRPNVY3UXM0NUVUYnY5?=
 =?utf-8?B?SVVPUUllM1BDZFFWcElnb3BWRHdZYjVtNXlBN294dDNiZ1Jpc2twZ1lacUdF?=
 =?utf-8?B?Y3ptWTNFbTB3SEdWY1BMMnYzbGo4WGRibEk3dTA0NmVUblJteUw4Q01aeHVv?=
 =?utf-8?B?VEdFbmRIUzZPWGhEamxUR1pUZ1hqR3JKa0E0RFpWc1FxNUtWekxWQ0JyOXR0?=
 =?utf-8?B?cGJvNmlnU0pRaTA1TDM4TERoUXUyYWR5RTlWcDkvdmFsVmtmVTdnMlRvRU9l?=
 =?utf-8?B?ZWpYcmJuVk14YlVUTWVnNEMzcWxHMStEVU1UdW90dmgxOTFiUW5HM1YvVzFE?=
 =?utf-8?B?R1dzKzFtd2ZwdUtDemNZMWM2T3gwQWp4UnJzaTdrWjBHQW9QRTd2S0VjSjU1?=
 =?utf-8?B?dW4zTFAyNmFUdkt4Q25IT2hCWlUwS3ZWZUdrSmV2M3RGcWRHNkRSUnNWc1Ez?=
 =?utf-8?Q?fZEy6asPCDSapaB8=3D?=
X-Exchange-RoutingPolicyChecked: WoUFbLy1uOSjDkiXLB8tiL/yMD/eY+ltIMh/m8MPziUo/Y9Fz3gedHlCT2sPDXr6Vo42qm5TRwKOKhkhxGOKumhcGcuFCOvQvT/0u0zpzVqX1oTYAyldGasXeDw2RNOz7D7zXQmhUYcu5kquyISQ43oX/EJSZB464P5SH9uocgYwe2iePgzpjvd60JqxQ5hE84KxzRgvtHQNzmJyMQ6Y2OhMIUQDT1Y/EMjEUZ3ZPMDSwEkpUJCMpiixLoVqx/gIcUNvNl1DRYQ4y2+jyoGC5nr8iUhT9ilTE0W+BeZ419EZJcFG22rGzebn0u38vM3lwCX6eFytJ0iC9Xkc3Sdpgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: eb898627-be67-49ae-7061-08dede462e46
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 05:43:33.9756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: esk9IQdfLJMZ5r7cTq/LVjbN2XxUleAhSywFunv32p7ZgRKZSQKBDWsYJos30KqFHH5ldCLFG/GRMAZsEti/4t9rau4XAJAETk5LTVCaP3aonc8+EaeB8CF66Hs4G7Fx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6251
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



On 02-06-2026 02:14, Vinod Govindapillai wrote:
> As FBC can be enabled in multiple pipes, to check the fbc status of a pipe,
> we need to read the FBC status from the corresponding crtc debugfs entry.
> As a step towards that, update all the feature virtual function definitions
> so that we can access all the relevant parameters needed for reading the
> crtc debugfs entry.
> 
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>

Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/intel/kms_fbcon_fbt.c | 102 ++++++++++++++++++------------------
>   1 file changed, 52 insertions(+), 50 deletions(-)
> 
> diff --git a/tests/intel/kms_fbcon_fbt.c b/tests/intel/kms_fbcon_fbt.c
> index 78c6cc4b2..5863c9e68 100644
> --- a/tests/intel/kms_fbcon_fbt.c
> +++ b/tests/intel/kms_fbcon_fbt.c
> @@ -80,12 +80,12 @@ static void wait_user(const char *msg)
>   	igt_debug_wait_for_keypress("fbt");
>   }
>   
> -static bool fbc_supported_on_chipset(int device, int debugfs_fd)
> +static bool fbc_supported_on_chipset(struct drm_info *drm)
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
>   	int ret;
>   
> -	ret = igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status",
> +	ret = igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status",
>   				      buf, sizeof(buf));
>   	if (ret < 0)
>   		return false;
> @@ -99,20 +99,20 @@ static bool connector_can_fbc(drmModeConnectorPtr connector)
>   	return true;
>   }
>   
> -static void fbc_print_status(int debugfs_fd)
> +static void fbc_print_status(struct drm_info *drm)
>   {
>   	static char buf[FBC_STATUS_BUF_LEN];
>   
> -	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
> +	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
>   				sizeof(buf));
>   	igt_debug("FBC status: %s\n", buf);
>   }
>   
> -static bool fbc_check_status(int debugfs_fd, bool enabled)
> +static bool fbc_check_status(struct drm_info *drm, bool enabled)
>   {
>   	char buf[FBC_STATUS_BUF_LEN];
>   
> -	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf,
> +	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf,
>   				sizeof(buf));
>   	if (enabled)
>   		return strstr(buf, "FBC enabled\n");
> @@ -120,25 +120,27 @@ static bool fbc_check_status(int debugfs_fd, bool enabled)
>   		return strstr(buf, "FBC disabled");
>   }
>   
> -static bool fbc_wait_until_enabled(int debugfs_fd)
> +static bool fbc_wait_until_enabled(struct drm_info *drm)
>   {
> -	bool r = igt_wait(fbc_check_status(debugfs_fd, true), 5000, 1);
> -	fbc_print_status(debugfs_fd);
> +	bool r = igt_wait(fbc_check_status(drm, true), 5000, 1);
> +
> +	fbc_print_status(drm);
>   	return r;
>   }
>   
> -static bool fbc_is_disabled(int debugfs_fd)
> +static bool fbc_is_disabled(struct drm_info *drm)
>   {
> -	bool r = fbc_check_status(debugfs_fd, false);
> +	bool r = fbc_check_status(drm, false);
>   
> -	fbc_print_status(debugfs_fd);
> +	fbc_print_status(drm);
>   	return r;
>   }
>   
> -static bool fbc_wait_until_disabled(int debugfs_fd)
> +static bool fbc_wait_until_disabled(struct drm_info *drm)
>   {
> -	bool r = igt_wait(fbc_check_status(debugfs_fd, false), 5000, 1);
> -	fbc_print_status(debugfs_fd);
> +	bool r = igt_wait(fbc_check_status(drm, false), 5000, 1);
> +
> +	fbc_print_status(drm);
>   	return r;
>   }
>   
> @@ -181,7 +183,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
>   	 * relies on a tiled and fenceable framebuffer to track modifications.
>   	 */
>   	if (intel_gen(intel_get_drm_devid(drm->fd)) >= 9) {
> -		if (!fbc_wait_until_enabled(drm->debugfs_fd))
> +		if (!fbc_wait_until_enabled(drm))
>   			return false;
>   		/*
>   		 * Skip cursor blinking check when running in simulation mode.
> @@ -193,7 +195,7 @@ static bool fbc_wait_until_update(struct drm_info *drm)
>   
>   		return fbc_check_cursor_blinking(drm);
>   	} else {
> -		return fbc_wait_until_disabled(drm->debugfs_fd);
> +		return fbc_wait_until_disabled(drm);
>   	}
>   }
>   
> @@ -242,34 +244,34 @@ static bool connector_can_psr(drmModeConnectorPtr connector)
>   	return (connector->connector_type == DRM_MODE_CONNECTOR_eDP);
>   }
>   
> -static void psr_print_status(int debugfs_fd)
> +static void psr_print_status(struct drm_info *drm)
>   {
>   	static char buf[PSR_STATUS_MAX_LEN];
>   
> -	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
> +	igt_debugfs_simple_read(drm->debugfs_fd, "i915_edp_psr_status", buf,
>   				sizeof(buf));
>   	igt_debug("PSR status: %s\n", buf);
>   }
>   
> -static bool psr_wait_until_enabled(int debugfs_fd)
> +static bool psr_wait_until_enabled(struct drm_info *drm)
>   {
> -	bool r = psr_wait_entry(debugfs_fd, PSR_MODE_1, NULL);
> +	bool r = psr_wait_entry(drm->debugfs_fd, PSR_MODE_1, NULL);
>   
> -	psr_print_status(debugfs_fd);
> +	psr_print_status(drm);
>   	return r;
>   }
>   
> -static bool psr_is_disabled(int debugfs_fd)
> +static bool psr_is_disabled(struct drm_info *drm)
>   {
> -	bool r = psr_disabled_check(debugfs_fd);
> +	bool r = psr_disabled_check(drm->debugfs_fd);
>   
> -	psr_print_status(debugfs_fd);
> +	psr_print_status(drm);
>   	return r;
>   }
>   
> -static bool psr_supported_on_chipset(int device, int debugfs_fd)
> +static bool psr_supported_on_chipset(struct drm_info *drm)
>   {
> -	return psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL);
> +	return psr_sink_support(drm->fd, drm->debugfs_fd, PSR_MODE_1, NULL);
>   }
>   
>   static bool psr_wait_until_update(struct drm_info *drm)
> @@ -277,24 +279,24 @@ static bool psr_wait_until_update(struct drm_info *drm)
>   	return psr_long_wait_update(drm->debugfs_fd, PSR_MODE_1, NULL);
>   }
>   
> -static void disable_features(int device, int debugfs_fd)
> +static void disable_features(struct drm_info *drm)
>   {
> -	igt_set_module_param_int(device, "enable_fbc", 0);
> -	if (psr_sink_support(device, debugfs_fd, PSR_MODE_1, NULL))
> -		psr_disable(device, debugfs_fd, NULL);
> +	igt_set_module_param_int(drm->fd, "enable_fbc", 0);
> +	if (psr_sink_support(drm->fd, drm->debugfs_fd, PSR_MODE_1, NULL))
> +		psr_disable(drm->fd, drm->debugfs_fd, NULL);
>   }
>   
> -static inline void fbc_modparam_enable(int device, int debugfs_fd)
> +static inline void fbc_modparam_enable(struct drm_info *drm)
>   {
> -	igt_set_module_param_int(device, "enable_fbc", 1);
> +	igt_set_module_param_int(drm->fd, "enable_fbc", 1);
>   }
>   
> -static inline void psr_debugfs_enable(int device, int debugfs_fd)
> +static inline void psr_debugfs_enable(struct drm_info *drm)
>   {
> -	psr_enable(device, debugfs_fd, PSR_MODE_1, NULL);
> +	psr_enable(drm->fd, drm->debugfs_fd, PSR_MODE_1, NULL);
>   }
>   
> -static void fbc_skips_on_fbcon(int debugfs_fd)
> +static void fbc_skips_on_fbcon(struct drm_info *drm)
>   {
>   	const char *reasons[] = {
>   		"pixel format not supported",
> @@ -312,7 +314,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
>   	char buf[FBC_STATUS_BUF_LEN];
>   	int i;
>   
> -	igt_debugfs_simple_read(debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
> +	igt_debugfs_simple_read(drm->debugfs_fd, "i915_fbc_status", buf, sizeof(buf));
>   	if (strstr(buf, "FBC enabled\n"))
>   		return;
>   
> @@ -322,7 +324,7 @@ static void fbc_skips_on_fbcon(int debugfs_fd)
>   	igt_skip_on_f(skip, "fbcon modeset is not compatible with FBC\n");
>   }
>   
> -static void psr_skips_on_fbcon(int debugfs_fd)
> +static void psr_skips_on_fbcon(struct drm_info *drm)
>   {
>   	/*
>   	 * Unless fbcon enables interlaced mode all other PSR restrictions
> @@ -334,14 +336,14 @@ static void psr_skips_on_fbcon(int debugfs_fd)
>   }
>   
>   struct feature {
> -	bool (*supported_on_chipset)(int device, int debugfs_fd);
> -	bool (*wait_until_enabled)(int debugfs_fd);
> -	bool (*is_disabled)(int debugfs_fd);
> +	bool (*supported_on_chipset)(struct drm_info *drm);
> +	bool (*wait_until_enabled)(struct drm_info *drm);
> +	bool (*is_disabled)(struct drm_info *drm);
>   	bool (*wait_until_update)(struct drm_info *drm);
>   	bool (*connector_possible_fn)(drmModeConnectorPtr connector);
> -	void (*enable)(int device, int debugfs_fd);
> +	void (*enable)(struct drm_info *drm);
>   	/* skip test if feature can't be enabled due fbcon modeset */
> -	void (*skips_on_fbcon)(int debugfs_fd);
> +	void (*skips_on_fbcon)(struct drm_info *drm);
>   } fbc = {
>   	.supported_on_chipset = fbc_supported_on_chipset,
>   	.wait_until_enabled = fbc_wait_until_enabled,
> @@ -372,24 +374,24 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
>   {
>   	kmstest_set_vt_graphics_mode();
>   
> -	igt_require(feature->supported_on_chipset(drm->fd, drm->debugfs_fd));
> +	igt_require(feature->supported_on_chipset(drm));
>   
> -	disable_features(drm->fd, drm->debugfs_fd);
> -	feature->enable(drm->fd, drm->debugfs_fd);
> +	disable_features(drm);
> +	feature->enable(drm);
>   
>   	kmstest_unset_all_crtcs(drm->fd, drm->res);
>   	wait_user("Modes unset.");
> -	igt_assert(feature->is_disabled(drm->debugfs_fd));
> +	igt_assert(feature->is_disabled(drm));
>   
>   	set_mode_for_one_screen(drm, feature->connector_possible_fn);
>   	wait_user("Screen set.");
> -	igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
> +	igt_assert(feature->wait_until_enabled(drm));
>   
>   	if (suspend) {
>   		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>   					      SUSPEND_TEST_NONE);
>   		sleep(5);
> -		igt_assert(feature->wait_until_enabled(drm->debugfs_fd));
> +		igt_assert(feature->wait_until_enabled(drm));
>   	}
>   
>   	restore_fbcon(drm);
> @@ -398,7 +400,7 @@ static void subtest(struct drm_info *drm, struct feature *feature, bool suspend)
>   	sleep(3);
>   
>   	wait_user("Back to fbcon.");
> -	feature->skips_on_fbcon(drm->debugfs_fd);
> +	feature->skips_on_fbcon(drm);
>   	igt_assert(feature->wait_until_update(drm));
>   
>   	if (suspend) {

