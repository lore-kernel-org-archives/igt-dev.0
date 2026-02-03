Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93633E87845
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 16:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF3F10E6E9;
	Tue,  3 Feb 2026 16:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mRREeIns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D38110E6E9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770134403; x=1801670403;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=C6t2RbjxvKOovCITd1ZNd1y5uEXFy3PkswG83qHOZCU=;
 b=mRREeIns+pBe2K2GXKqjW/897/Ci+2IFrKSFzxE/qRQ3/v6wTnNRZ7gb
 kVGwC6xkSRgLr8bexRVn9jBNtz7EN1nmqEIifhhBA4qLXqscbG59vCCWO
 HDI5XFvnzh16uy2EfNe96JKtZRfGWxWyY4tGMwgx/mqDoS31Xn5Vp71M9
 KqyMq4NdBgFcrE3dXoZmx/FCMTD3khQWMPldZo+XLtraOd74xirOoMUV4
 oiPQ2+Kq61TQWg/sQIQTZ+vzV4gzqgGsgCPLH30lWI9y/Z95F2f+SWTMw
 e1zQ6cVZhx+CjnIQu7MsHSeCTIGs3HJsafWlsVFQIgXT0LAHz0BJCMDI2 A==;
X-CSE-ConnectionGUID: UAo0c53NTAG0FGshA5kKoA==
X-CSE-MsgGUID: 0riO56qSTT6PWPUbIzLO0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75165521"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75165521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:59:58 -0800
X-CSE-ConnectionGUID: VZnIMSbBTpCfqeW7XhfQiQ==
X-CSE-MsgGUID: M4eg2CDwQhSnwWFXYaEgog==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 07:59:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 07:59:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 3 Feb 2026 07:59:58 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 3 Feb 2026 07:59:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXaAEnM3pWeo2fIld8cW5IJZt6F9GiuoTZmyEKNiiXO9U12nSitlhXAlULFi+gN82lJd0i4jx+83ztiZS4VBl4YDZME1+eVFPCZDcC3UO7+1ltIegV7bmJ5RyGuDyYbVH8Oe6QwUmGztnSu0BotYpZbTweHNui+vyItDRpzoGJeE+t8GT8p5+7vaM/PjdaRYBZAcILTktSfSdx6oZHejdwg+3U2ivhZAmtQ1bMQRqT5+kGRSww/PvFruc8uEpM8d1tpYa1JctFMYRBdWzJQ9YGGMlDdpjpTf4iGs4zc2hj2xX5MwywUC/yB7mhV+OkwjlzLzIM4WV6+ZZYDv43Rc+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMK2d9AVFZQbplkVzKb7zg2c3a86i5Mi8NyA1BAE2MU=;
 b=AaBTn/0qqMwalgCgxUas7Jhvq2rbIeVbIWgVWff7El9M1cAzp3AoEK9QR/WFl9W02KxTdCBq3b2gsK4MyeLwdpWa14h2zjHDVd6lCpgBMW2o80sCKAC8G7kfxPlko4bBU6xYdxYo2Up7ZBj3L/o51WVGK5rufXyl0l8RReH1xtIsKQxgMsmkund00v9gcgR3clHDfuKzVH3F/lZORQ2zBpN8uA6YRoE8gjMiHXU2q7UsLHfjnosRGm6WlTWI9vyK0U/fydkwtEycNmzlC/SNBVt7RSWaiD0TeiiCE/ZZ34ulWNdzUznee0e5M7T4vB/Rzk82fkS0HHgPgBHY6m6KIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7577.namprd11.prod.outlook.com (2603:10b6:8:142::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 15:59:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 15:59:54 +0000
Message-ID: <18337fd1-572e-4cce-ab04-8ef92c56d11e@intel.com>
Date: Tue, 3 Feb 2026 16:59:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_configfs: Reset configfs attributes after
 subtests
To: Nitin Gote <nitin.r.gote@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260203150645.401837-2-nitin.r.gote@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260203150645.401837-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0017.eurprd02.prod.outlook.com
 (2603:10a6:803:14::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: abb7ac87-1f3f-4b87-b604-08de633d4549
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2p1a0dyKzNvdXNNdFcwM3p0TUdkWWZKbm1TWUtaUHBZc2NrbWNueW9tdUp6?=
 =?utf-8?B?VzVvcGhMcU5qZytUNWg5Ymo5bWtVUHp5Y2U4eDJ0V0xocEFKdTdvajdZR0dp?=
 =?utf-8?B?blJDdGxGVHlBYlFTR2FuWTErdG5PZ09lZmZuVzNMN2ErVVVOYXRYMEpnSytE?=
 =?utf-8?B?aFFjL0FLYUt1Wk56NDIvTlRlMmtiU3pnUTJHMWEzRXhscWd2M0UrSW0vZnYy?=
 =?utf-8?B?RXYwTzRoZzRZOFJvMTdZMEI4cFRWVDZ4MStsbFdEL1JOVytVM0c1NVNJOGp3?=
 =?utf-8?B?dGxjTFVBbkRjTTlmNjZyWXRnaEo4SVR1WVM1MldIYzFqc2dqRlVPZG9CUzhs?=
 =?utf-8?B?REN5QnlPLzZneHJNMWVQMHJVMkJ2WWRrcDBjYzFDVEN1bE9xWFphSTFDV3dh?=
 =?utf-8?B?N28yZUhSQlpZdWdaVkgxSTVOWU1NWjliWit4WGxEY1pBUC9vQzAwc1JtdFVV?=
 =?utf-8?B?d0JxWkJxZms3V2lCVFlwOFdmUmMxZzFHbW1EY2FkeVlSUy90NllqQjVDVDFQ?=
 =?utf-8?B?dEpDdXhoR0JKZkJBcmswcm1BaWxnUWJHL2FoYXUrQVZXdGNhd3B0MGREcHZk?=
 =?utf-8?B?SVR3Vkw4RWdxekJDSHNoZkV5bFJuWUpzQ3dUZ3BlNmJ4bE9HQllhQk9rZ0hu?=
 =?utf-8?B?Ly91Y2liM04yY3RucjNQTVVDRXdHN2ZXRjBuREw1dDVxRE1DWW00VWVtc09n?=
 =?utf-8?B?clExcTFNYlIwYjFzZU9XUDdVU0tIZ3lpOW1vNnROaWRMKytiblpCbXZvVCtj?=
 =?utf-8?B?U3hod1lQajRHRmdEUXVLY1NVM05Sd3lKZGNKcXpsMWNNaDFoMm5KWENvTy9a?=
 =?utf-8?B?OTg0VUE5T0tOekVVVTAxd2RNbDg5dlRIS05EMWEwQXdFOFZwazhacVFNWkR4?=
 =?utf-8?B?NEtHaHVLSmJzZTBLTWwxNll4ZkFXOURQR082aWZKQW1aY1V1ZUJuRmVSZ2hy?=
 =?utf-8?B?RDM5WFZ5RnMxUW5RMVA4aGJQMUlydmJDcnc2bWJndHpCdjNrUjJXRUZiRDhj?=
 =?utf-8?B?S3JJczN2ZTlWQjc0N0RTalBaWVJiek44RE84N1hVdWptL2psbElQMXZxdThI?=
 =?utf-8?B?ZGNFYlFwMmdrR0x1TTVCaCt1bDU5ZStud2E2aHc4SUdkZm94aDBkdmJoTXhV?=
 =?utf-8?B?eUlINEYvQzB5M2h1RldWWHdlb0UrUWpYMkRacm84OTNXN0NVNnFUOHhXU0RQ?=
 =?utf-8?B?ODk5MEEyNTlNUHgvOFdoK2FLbHY0WW9SRVowRjk1Y0NudG1FdlI2TWl1S3hT?=
 =?utf-8?B?MXBxZFVnSmZ2Z3c2dW53aUpRa3BaNjBNR0FJUFB2TW96UmorVHVzMEFnenpk?=
 =?utf-8?B?bU50VjU5WkFzM1NicG94L1hDbjF1cGhIOWdicm5ibmdLUnkyQ0pKVEdNdmRv?=
 =?utf-8?B?ZHc3U2QwWkFDc1o3aklGWGdxWlhtVURieUNmTTlLcHJrSWNmOU1rUldNc25F?=
 =?utf-8?B?eTR1OVNSRGlaN0FZWFFPeXl1T1hkTWx2N3JUUXFaQzFhTTBIOU1LLzl5LzJk?=
 =?utf-8?B?MSsvQWRJVExCSktsUnlaWU12OTJqV3hZK253MUd6NjZNSzJqeVRsQ1JxTlVn?=
 =?utf-8?B?K1NDZVA4VlZydzhJNjg3OUE2c0xGZXJRY3JTeFFMVVdLUWpvanlKdXlyWGhP?=
 =?utf-8?B?RDVxaGM3SE0xMlUvNWxZdTlFd0ZjVHdEekUvMjV4YU1LVGQvemtnUUZEOUhi?=
 =?utf-8?B?MXh0SXZ3b2NiOFU1M282UFYrUUpSS3VjRjhhUUViMEFwbTY2cXNyeSs3b0Yy?=
 =?utf-8?B?UnRaSnlFZ29hYWsyRUJyY2ZsWW5vZzVFbkdUcHhiNkcrUGZwb2ZrWVdiU3hN?=
 =?utf-8?B?dWVtRHFnSkJBc0FWdFBsWUlKcGtQK0FVSjVONFhiQkIvSFR6MnoyWWVHK21U?=
 =?utf-8?B?a1R5YW5DRW00dzJ6eE5HRXhYZktyR0tZUGVHY1V4NGwwUi9OV1FOdlo0ZnZU?=
 =?utf-8?B?aDlNQlBJNXYxTzNTNTE5QWJZK2FGM0hlNGprRWRRN3ZjZUQrdlYwMnZnZHBX?=
 =?utf-8?B?bFlIbnBJajNlVDliaDNiRWVwS1VIbjlDeFdJdVpZVEozNzBqeGM0c21wRUJL?=
 =?utf-8?B?U1hMc2VnUDQrQU1mUlNOWnY1RU5vZlVtV0Jtalk2cjIzVVU2Z1BwWitXaEVI?=
 =?utf-8?Q?1m5w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEd0bmJjQllZU2IwK3prZUFqMHZFVEZnaUUydm9QWVZDdzZFcjlOSEx0eWlM?=
 =?utf-8?B?M1RNS1paZDdBVzVTb3JFckxDNXg1eWZrandxd2djbXZvZEdEb0JXWG9TSmNz?=
 =?utf-8?B?eTJaZjlSajdmV1lzbEJHS0d5SjMzRlRJOUowVzh3RjI2VjNvZUVDbXhualpG?=
 =?utf-8?B?R1o1SzRkNTBrRHVvOFVmdVZDS1YxY3g3MTRsTHNTZGpQMSs2cnlDa29jUldl?=
 =?utf-8?B?d0NyYm5EenNpbm5BazB5L0F1b2ZrREdzeEkvN3dLRHhCVWoxRjl2a0VVZ2R1?=
 =?utf-8?B?bU9KN00wQXRuVi9aT2VveERPcjhjNFNaZlpPbTRPdi9QdG14Tzd1UkxWaWhn?=
 =?utf-8?B?eGdKQnZHN0R4WVdYdE0zbzBvRER0eVhYYzR5MzlIY2VDdmp1bjh1UTNZV0tT?=
 =?utf-8?B?MGFMV3NCNHlCSzI5Nkk1ZEd2eitMa2dZWS9KQUZkTUpOSzNJYnFGUnM0cE1P?=
 =?utf-8?B?V2l4YmJHZzI5aDVVa0JnN0hNc0U0MVhpemVmM29FaEdJNS9PUDVGbVhobHJ5?=
 =?utf-8?B?bEpmQWNBYkVKMmVZUkE3RTY2T0hkUTF0cll6N2VkQ2hzQml2RW5wY1h2OGNm?=
 =?utf-8?B?ZytIYXVqOENJQzVIWlptM09VMkV4b0NlQngyUjVoL2ZTYXFEN3JmSmgySkI1?=
 =?utf-8?B?dis5dFRVMjVoR1dGRnlsUmdZdzJKaE1md252c3JhaWhmYUttSkhNUWloVVI3?=
 =?utf-8?B?OW4rQVhHSHRibTlPRk9DdTYwdnNadGtwVkc0bDNLYjFpN3lFY1V5SXJtRGk4?=
 =?utf-8?B?U25DcEdZNThZaXNCV25mbzNOOExTU3hOU3Y2aUF6bVpGRSsxOGh2bVh6VGdw?=
 =?utf-8?B?VlFxdFlwM0loSklLK3FPcTFIQm5nZkp1bkNjOVRuSHVYRTZMVVRERlBtUmZJ?=
 =?utf-8?B?NmxtazdwYUFGVjhxMVExNFdURTJBMzQ5VmtOcVJUUjV2RGs1R0p5TGdyM2pk?=
 =?utf-8?B?ZytYRlRneURCVDRSOEc2VEUwdFFVUGcrK2hJeUhSVGY4encwMldNZktJNnBa?=
 =?utf-8?B?VUtOZ1lQUEtqVGV6MWVMM3g0R1lqdllkWWJaQXdQSlhpc0FhOWxrQTUyZDNr?=
 =?utf-8?B?bTh6cHNBeDJPUFN1bjBndUtwcVh2MWlDSFFFMXcvbGFwTW01dFdmeW1id1lX?=
 =?utf-8?B?S3o2TE9PZkdHZ25UcXRzbStGSi84T1ZQTXg4Zk5kdXZBempiVnBqL096Z2FD?=
 =?utf-8?B?ZmJJZUl4dWdkellPVjllVkt6OElZQ01xTnZjcGxtSkg5NVo5VDV6Z3VSU2R0?=
 =?utf-8?B?andDVFF1N3RzTGhwU0p5a2J4TUZsaG1hQmxlRzAxTWtGRG5Tc2VzaG0vcDVv?=
 =?utf-8?B?NFNub0o4MmNldjIyamRLZzBXMEV1NlUxdUIrOVl0SDdxV0tUemtMdUlIOVdL?=
 =?utf-8?B?QXBoa3dCVmswK0xEcGpmTFAveC9hcVhVQUVJb3lWMjkxVFNVc2xoRGFNVCtX?=
 =?utf-8?B?SHlRUFNzUWFxTVVLdDVnMms2MDIxdVdCNTBabk5UM2IrSlVMRm9LM0lRaExH?=
 =?utf-8?B?VWpDUVNGWXNDb0hHdStCUjJyWlkxbFFNanpIUlhUTFpFUDJwekM2Z20wWUpz?=
 =?utf-8?B?aENIVkVzRVpKT0ZHQ3RnRlZFMUp6dHBucHRXVGVSVllnWWQ5L01DWVI2Z01s?=
 =?utf-8?B?N2NmaFNCVjk2VFR2eUpnYXo0eXhTQVg0dTNyRnRicS9aK1paNnRJbU9hbGc2?=
 =?utf-8?B?Z24xM3NQQXlKakswSWwxeXlvcy9JWW5nc0hEdjVYVldJeDBjQWdNdTVhZTQw?=
 =?utf-8?B?KzBHY0l5QXJibGVlc2RNUEFESGtYV2F2TUJQODRVOXJ6MlpBRS9MRUJrVlBr?=
 =?utf-8?B?dGJPdzArL010Qm9yQytwOHNibXRDbzlTK3NNVTVxWUtueW9PODVMdkZ4SWNk?=
 =?utf-8?B?MmVzL2hHTUcyTlhIUkhON090YTdoNTRxa3JlampmcS9MalZmRUtiU2s4aFZP?=
 =?utf-8?B?SnZ2VjBodVFBSjRCVUYvTVRROUpJQW5wdGVRZGY4UmRiMDk3OStQdjdYbll0?=
 =?utf-8?B?dHVnVXBjUkJLeE9Rak9XN2doMFRETGxXNEJvM21FSFdIdUYveWVBdEdvYXRS?=
 =?utf-8?B?TXVDQlhmMkFNTFJON1FmZFlQUjdqT1UxU2lWL1RuUnc3VzljSmUyNTlzNUFs?=
 =?utf-8?B?bGVoN045NFhGL3Q2SUxZVGY3Z2FKUUcyWlBxaWgxK05DTXZXRG8xMVBNWmNw?=
 =?utf-8?B?aTBEZ3ZrZDQvNEQyZy9RNC8zRGhkbVhPYWF6bjg5cmhBR2krWFpLbmJiSFgz?=
 =?utf-8?B?bVV4WkxhOVh1YTJBVUhMekt3ZTNPMnZuVzMrL0hYdnhwbFJ1bi9PVW1RRnRr?=
 =?utf-8?B?QmphM3QySm5mdlBpdjVyQXJaUEFpY3JZaHNsd2hWVmIyRGMyZWZRMTFremdk?=
 =?utf-8?Q?mMdfoSsM/M9gMDWA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abb7ac87-1f3f-4b87-b604-08de633d4549
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 15:59:54.1968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0kcmPZc5EvL8fHyk+SAUI+s4IEL/3MoDhKiNHQfhP0fMWW/i8Sp7Mzloi8NgxBrBkUFCerdCp2USixmnRQEL5eCxenBGUndhi/S3G4fKOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7577
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



On 2/3/2026 4:06 PM, Nitin Gote wrote:
> The xe_configfs test uses a shared configfs group across all subtests.
> When subtests modify configfs attributes without resetting them, the
> modified values persist and affect subsequent subtests. For example,
> ctx-restore-mid-bb reports register value mismatches due to
> stale batch buffer data from previous subtests.
> 
> Fix three isolation issues:
> - survivability-mode: Disable survivability_mode at end to prevent driver
>   from entering survivability mode for subsequent tests.
> - engines-allowed: Reset engine mask to allow all engines after testing
>   restrictive values.
> - ctx-restore: Clear both batch buffers before each test since post_bb
>   executes after mid_bb during context restore, and stale post_bb data
>   overwrites mid_bb register values.

IMO you should rather remove device directory from configfs after each subtest
and let each subtest recreate it again to get default values as hardcoded in the driver

Michal
