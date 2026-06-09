Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88185CD6E79
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 03:14:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FFE110E06A;
	Tue,  9 Jun 2026 03:14:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5oaM5b0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F79A10E064
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 03:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780974837; x=1812510837;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=tyj631ITiuafgYYDkJgeGwuoVeOHtJkMxTy+yQ1uc1s=;
 b=l5oaM5b0dIk53w3ySqQtRsGiqa74i1+hK/qSqXMhu1ZQ+nae0v0mp6Rb
 7WDq1DhH02dfP0ur4zdnq6Ng/jaz/CEUvoydOa11iPhXWcOMOK4o/1n6N
 FoZeoEh4NYzOKTQ9d7uDg5OuiZA+yzPN2/LMPeg3FQrsYGw4ZEBtvlf53
 w1rHSIOkyPr/7dj2p8Mwnhc7GcT/mpj73JQlA8S2jQyjmcNrGSA0kY2tX
 YnCgQA8cOh8OpPiMFs881sPi3GPoI5JBD4VJ5J5cN2MxDSUR39VhnnkQs
 PQf4YoCLANp9RM+jW5u2oi8Xth+7ug9+xZlbIgMojqsVj/SFU9FGrQ2CF Q==;
X-CSE-ConnectionGUID: spMo9m/GSO2cs4aIsWnmbw==
X-CSE-MsgGUID: rnib0+pfSfeW0uk2y9IXeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="85579420"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208,217";a="85579420"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:13:55 -0700
X-CSE-ConnectionGUID: PXyyCUwTQOqID6aQECMDKA==
X-CSE-MsgGUID: RZf3Gc6NQ3a64/5OJrZhig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; 
 d="scan'208,217";a="239399402"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 20:13:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 20:13:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 20:13:53 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 20:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ar81fyuThPop5sXMzYdulBPiS6QkXIpmDCpXVZXn3/p+iCQAQwsCkMcJ/BHuFsQd64Us0lPUvZXZWOAQoqsrYbKEVaooV7kEXWNd3SJIxtAfa4mAu1g9aTLzTEl0xACIVby+1P/GlOBCcsLq/DgpzovQ4jq+DInBlgpsOzFxZm1AlhMYB/tqG8lRJuvGSu6W3NOSXobkCbplhBgvtE+uzuvLF2mhtXxi8N3Qu+T5S5MmyVfGFBRx3ygV957X9qC91RVpoqwn/IEwWzW2XCWSBxAcP6QsVYM2PbN9OmJcY8dEbsVgXFkzV15LshOS3/pobzCTMtkPBtwpHTH2c772vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bKTnCmhBQ/ROPDSmqiOZqOocxlWdiYIHCra/TucaTp4=;
 b=HM9On9uiu7rwxzXXGXQUAIWNTM/ueAiPjpa45xdaGi1tH2+ETbJRWYHIOqikJxCUzONwFWL7wfSCraxhw75veBufnFkETWLmJmX+aEvxYSCkLllqBZVmi8NvG6wS8pzrxq8kU5Nf4r+UTrzqOUwPpsL5BxijL4rbVRrBd/UqHBcFKx79htkt0Tcubko5IfNVTNf3Y2wSnTOvQ8rTA+p84JjHaWPi/+J2A1bgiCfS24WKL6aFvGDK7ZtOPw7N7JMnfjrcW6cq5WU2I7neh+PZGNobpWG6IDU1wAEGNdN/xIem4oK7Lp9npD2omv+dNw5JYlMgcUHrprMEIhefDIOF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 03:13:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 03:13:50 +0000
Content-Type: multipart/alternative;
 boundary="------------Hy7GZFgRj56G5cnbb814QWUw"
Message-ID: <02d9721a-5036-4477-b8d1-0d39377aa345@intel.com>
Date: Tue, 9 Jun 2026 08:43:43 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBpbnRlbC1jaTog?=
 =?UTF-8?Q?Blocklist_kms=5Fdsc_ultrajoiner_tests?=
To: <igt-dev@lists.freedesktop.org>
References: <20260608051759.2787899-1-karthik.b.s@intel.com>
 <178092587626.54361.17997616499822232370@6beec6c84f66>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <178092587626.54361.17997616499822232370@6beec6c84f66>
X-ClientProxiedBy: MA5PR01CA0088.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CO1PR11MB4977:EE_
X-MS-Office365-Filtering-Correlation-Id: 953be442-caac-47bb-c002-08dec5d5206b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|11063799006|56012099006|5023799004|8096899003|4143699003|13003099007|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: TbNrmb+eq2dyU+spQMQSXEda+Dn4GG2Z5bXMvSYhOyP6BDN2er6CQB792wMY8anvahaIUBXhKMuDRAkbBv4QV2G4uw8xC2JRbWobFrbDd0/i7WKFjtACGW00E9KGsMcPWHBW0aNeaTHGPQmUS81Go+uAd90xTwbaH2H+w8ltIBfU+fpyPimBHsvva64JW+2bQ02LNMY9DaRAvUSCkdwkj3PV0Jb5IlD69WRruOpR0c2DrSniLRHhrI47M+p9b8gipc8Qmpu3cFKwssLKh02EEe9hEtSuCzbcLPK1FHt+uBQalUaTuCPDWLdAZgBJPyE8G54ruluuug9i8tVnpVw1AMDhVLMFRQTmSrliZHc+vmaPayfjjuoADnklEFJj+WOrPCRz8s4ICNHzqv9rFCcY+5GoJG6bkAYLlS7HGUfbgKUKsiIOczgO3TsIw+3JbYcrlNGXIMWU7YFvcp3B9g0YNogtyH/bZxgdMVRixoXhZ2XoDVsnVTddpgejg28Tb6v5aLC0Adt8NLEcwR0vAHcl+clATBb21CrX//VZTpYQUQA/jaNohhF20hNEaaGBSmsnq+4QZSwAdsRxh5JoIkEaF8EXE9gT12OYRlmD+OV2k2DW9sMjGWcZx6EUBBU7u6uP40AJjeGf5zp1rmlKJEWX8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(11063799006)(56012099006)(5023799004)(8096899003)(4143699003)(13003099007)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdrNnFjL2lrWlRjRVVmTzk0MTc3M3BFSE1MdWNESHpEYWl0MzlTU0xBcWZ3?=
 =?utf-8?B?ckRLWU1SY0hFMFNVTEhGNzBNUUdUdW1Qck1rbmZwTWVGYk1sdEtOWnhyOS9y?=
 =?utf-8?B?ZDAwR1BBbVZRMEY2YWJJNFZIbFhWTyswS0VVaG5Cc3RHWUZpZmZHT3ZGSUZR?=
 =?utf-8?B?eDJIeDJ3QmdLVTdGSCszejBtVkp5RUJyZzBPOWhnaDc3b0JWQUdMQTJVZS9E?=
 =?utf-8?B?L2c5QWlOVUZWVkxiNG9oWFBiKzlIT3A1d2pyS1AxVlluOCt4S0crUUdmYmRx?=
 =?utf-8?B?ZXplK3pYVFkvamI3a3ltTEI3dWxrU0hkR3ZLcjJ2REYrMmZ6TVlGcDdrU1Y5?=
 =?utf-8?B?NzhUN2RzcFBXZG9CWktBT0hCS0l4TXlJTlE3K0MzSkJzL29ydVdmQktRcHcz?=
 =?utf-8?B?Yms4UG0rL1FLQmpWRzNPT2o2ZytpZTd0cTBtclozWTI5M1pib0VjdGlJa2Ns?=
 =?utf-8?B?NnNuVFViaFlyVmFFblRqdEdaNlRiRFllSWptcHhvTXVKYUFtSnZZVUdDZWls?=
 =?utf-8?B?VldLY2M1QXc3NDdUbElRWW0yQVlOTE51WU9pUkxBUElhaHVxWVBUMS9sUVNK?=
 =?utf-8?B?aFdXRjZtb1QveThoQ0Flb0ozU1JoMzZ4c0hHR1lWYXhQYkpLWGZ5V3Eydjd5?=
 =?utf-8?B?a3hmeW1GS1FkalJ0WGZoT0EySDF6Uk1Ebi9ZTlB6N1kvMFJtVXdxY3ZIaW1s?=
 =?utf-8?B?RUFTbjcyeGdZd0RFQ1BpeUtFeFJPN0Ryb2pGTldXTXU3R3hlV3JEL2w1M05Q?=
 =?utf-8?B?UUs3RzE1d1hsL2VMTmJVa0FRYWtyTWFibEE5REh5dlM1anZJcXptVVZqVUJS?=
 =?utf-8?B?ekFMOTQ4WDhCYjZ2TmE2M3pnN2duYS9QWWxGL2xnbnhISGxQZUZINUptZlRV?=
 =?utf-8?B?SUdEa29hUFc0WVhvSFVpZnNZMkJQcG91NDVCU0JGekV5TTdGYXhxWXVwSWQ3?=
 =?utf-8?B?a21vME9ZOGdUamt0UjB2dGtZZnJSYnRpZUpCWUtXNU9YMzJRNWxiOU1GT3pu?=
 =?utf-8?B?SUZDWm8vVnVERnZPSHhzdk1LZXNhRFVUdUx2QVRDUVl2VFlhelhYN0RqZjZj?=
 =?utf-8?B?UE5aZEpoNzJvUTV1RDFJck1seFJleEIwQ3cvUE1ZejNWZFZGWlB4TFRwakQr?=
 =?utf-8?B?MSsyeGJDSWlPR2U3QkFOWjdoejlhK1hmSmt3QUFPeFpRWlF6T2xtZjRDaW5G?=
 =?utf-8?B?UzVUTXlBblVLZHljNStjNWQveURXaUFyQjA4ZGxmTnE3ZXZmaHZWQWNqV3JM?=
 =?utf-8?B?c0RRbjFMS2tzeUhGWEZUN1BEMzFLM3ZxWHg2VmFKc0pTMS9ubjZlMWloNlNF?=
 =?utf-8?B?S0RBS1lyZHFxc0VkOE5ZS0dHRGV1RG5lWEg2RjJxSm4xOEY3eFE1UW45SS96?=
 =?utf-8?B?cmw0USt0cURJWUxhWFZuaHN6TnZkUEFMa2t0RjRsUGFnMzFoQjE1YTdqekQ1?=
 =?utf-8?B?bERTS2lsTHhRdE42UENRRjU1TGgwVjJyS0kxTWd2NHhnR21meklKOXY3RUxk?=
 =?utf-8?B?c05iS3hMN0NSZWxJd3BSUGQzRFdUUEx0eWo0blQvSk1JRUgwNG0yZ1E5M0hL?=
 =?utf-8?B?eUVhTTRzNFVUYXBGVzhJb0xRYUZsZVRzdFkyWjBnc3pKaEJ1QXZZc2tGVmRh?=
 =?utf-8?B?ZDZZOVdOanFNOHhsSlRmU3Q5bDhGMmhDUjBVUnRkNGorV3ZwaHdQNzVOUVM3?=
 =?utf-8?B?NjdEM3p5cjFwQ3NKaWN5ZmgwbGgwUFEyZmdBdlM2bFlEd296RWtYYTZ4Ymcr?=
 =?utf-8?B?TFZYL1o4OFZCNTEvTXhIM1U1ekZWSktHeDdkZnFjOFQ3VWFKWUc1cDR5clVm?=
 =?utf-8?B?QUx3TkVMWmJYbnp4R3hSY1NLOGR1eTFTSVRCUzNOc0VRZzNJQnZYdWIvRWdh?=
 =?utf-8?B?bWxhNnVlUFFOR3d2Q3Q2RUY4T1JyblRaU29vZkRJL0FBY2NpeFkxU0tlWFVv?=
 =?utf-8?B?eGEyWm1vWVU2Q2xhaE00VCtMSEk5eTZNcFJXODUwK0tBTFlYT3pMNWh0SjdH?=
 =?utf-8?B?SE5SMGFyWmQ1blFNOFVKdTQraE1EK2hMS2lsUjhKeW43cEJqMHVwaUZvMU5o?=
 =?utf-8?B?RTJhVWNHSml3SGRJb2RzUTVHbytDU1BoUjl6eXpleGh3VDVIN2tjVkV5MEU1?=
 =?utf-8?B?R3FCVVhLVG1Yc0UvSFBScjBrUFRobFlHT0JCSExuaktEVCs1VmdhcG91bnBT?=
 =?utf-8?B?UTQ2ZGdlcFV3cFk0dXAxYVMrazBSV253Mmk0QU9UNmkvdXZCSlo5cDk5NVBs?=
 =?utf-8?B?cFZHVTI2MEJHNFA2RVo4N1EveE5HSWVKWUI1SXBWTUdzR0RGc1lVek1jWjJL?=
 =?utf-8?B?dDMwUExDdE04bGdOY3paVEFPQWlRK0tOUjFDVHNoZExBT3hJTENydz09?=
X-Exchange-RoutingPolicyChecked: D6vOi8edDDAjddMUdcnGKPcpaOVoLrvqqBdq8Bx8vZ+Q6mrDbX2o286dFZHYsT38jnOxUZ1sOyWpJ1TINWWChFINZLFlt9jiJUyn2ZKGX5eDId7Ml5+oTCTevZhU5R8uvGBlahhjz9B7F9lQAvF4f1OLGqDNz/7c0bwci1OZFS3+PRBBuh9WAYMX7yXb8Vb008l7N4ZSViznwVaVQVaYoZ87SaGCi7yNZ8iWtWm5x9bFyR7nXsj1COPNrMTzR1Hfux4oSUsK0uxzS+4XvfjysJSXffjyXzmP2r6/UY4NcY5R6W1IYCtfEhfq1WiZEYfTWnEZF1+b/0QO5X2wPuD8Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 953be442-caac-47bb-c002-08dec5d5206b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 03:13:50.0580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NbeCQ6TPQgaHK9Thh+XuMndMPQQiuzQB8tPmdEX7c69LqudMjIKDWijsjIjXC8CDLni80/ycm5shmItUnJ39A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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

--------------Hy7GZFgRj56G5cnbb814QWUw
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Failure is unrelated as this is a blocklist patch and will not affect 
test results. Merging this.

Thanks and Regards,
Karthik.B.S

On 6/8/2026 7:07 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	intel-ci: Blocklist kms_dsc ultrajoiner tests
> *URL:* 	https://patchwork.freedesktop.org/series/168043/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/index.html
>
>
>   CI Bug Log - changes from XEIGT_8952_FULL -> XEIGTPW_15317_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_15317_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15317_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_15317_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_vblank@query-forked-hang:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-9/igt@kms_vblank@query-forked-hang.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_vblank@query-forked-hang.html>
>         +1 other test incomplete
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_15317_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610> /
>         Intel XE#7387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html>
>         (Intel XE#7679
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-negative:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325> /
>         Intel XE#7358
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html>
>         (Intel XE#6974
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974>)
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2
>         other tests skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@c-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7351
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html>
>         (Intel XE#7178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178> /
>         Intel XE#7349
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html>
>         (Intel XE#7061
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061> /
>         Intel XE#7356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +12 other tests skip
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         (Intel XE#7915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915>) +1
>         other test skip
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#6901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>
>         (Intel XE#7283
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283>) +1
>         other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021> /
>         Intel XE#7377
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377>)
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340> /
>         Intel XE#7504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504>)
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#7794
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794>)
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +2
>         other tests skip
>  *
>
>     igt@kms_sharpness_filter@filter-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_sharpness_filter@filter-toggle.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-9/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html>
>         (Intel XE#7992
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992>)
>         +28 other tests fail
>  *
>
>     igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html>
>         (Intel XE#7636
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322> /
>         Intel XE#7372
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372>) +1
>         other test skip
>  *
>
>     igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html>
>         (Intel XE#7136
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new.html>
>         (Intel XE#7893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893>)
>  *
>
>     igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html>
>         (Intel XE#7138
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138>) +2
>         other tests skip
>  *
>
>     igt@xe_multigpu_svm@mgpu-migration-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-basic.html>
>         (Intel XE#6964
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964>)
>  *
>
>     igt@xe_page_reclaim@invalid-1g:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html>
>         (Intel XE#7793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-9/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#7370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_flr@flr-twice:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#3718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718> /
>         Intel XE#6078
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html>
>         (Intel XE#7308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html>
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#7340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html>
>         +1 other test pass
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>  *
>
>     igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html>
>         (Intel XE#8058
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html>
>  *
>
>     igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled@pf-pt_us-20000:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-7/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled@pf-pt_us-20000.html>
>         (Intel XE#8280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8280>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled@pf-pt_us-20000.html>
>  *
>
>     igt@xe_sriov_vram@vf-access-beyond:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-7/igt@xe_sriov_vram@vf-access-beyond.html>
>         (Intel XE#7992
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@xe_sriov_vram@vf-access-beyond.html>
>         +1 other test pass
>  *
>
>     igt@xe_wedged@wedged-mode-toggle:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html>
>         (Intel XE#8007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#8007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007>)
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html>
>         (Intel XE#8007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343> /
>         Intel XE#7935
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309> /
>         Intel XE#7343
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#7814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729> /
>         Intel XE#7424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426> /
>         Intel XE#5848
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848>)
>
>
>     Build changes
>
>   * IGT: IGT_8952 -> IGTPW_15317
>
> IGTPW_15317: 96a15a9593327add69065fd8d64d30b213d1b3fe @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8952: 475b1c61f2f23f573e17e4f8d10c46d635ad4346 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-5218-0375ba98c1fdf69bc3a05ffa80591f9ffe910330: 
> 0375ba98c1fdf69bc3a05ffa80591f9ffe910330
>
--------------Hy7GZFgRj56G5cnbb814QWUw
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>Failure is unrelated as this is a blocklist patch and will not
      affect test results. Merging this.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 6/8/2026 7:07 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:178092587626.54361.17997616499822232370@6beec6c84f66">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>intel-ci: Blocklist kms_dsc ultrajoiner tests</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/168043/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/168043/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8952_FULL -&gt;
        XEIGTPW_15317_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_15317_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_15317_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_15317_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_vblank@query-forked-hang:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-9/igt@kms_vblank@query-forked-hang.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_vblank@query-forked-hang.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_15317_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send="true">Intel XE#610</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387" moz-do-not-send="true">Intel XE#7387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679" moz-do-not-send="true">Intel XE#7679</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-negative:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358" moz-do-not-send="true">Intel XE#7358</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_chamelium_sharpness_filter@filter-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507" moz-do-not-send="true">Intel XE#6507</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974" moz-do-not-send="true">Intel XE#6974</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351" moz-do-not-send="true">Intel XE#7351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178" moz-do-not-send="true">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349" moz-do-not-send="true">Intel XE#7349</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061" moz-do-not-send="true">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356" moz-do-not-send="true">Intel XE#7356</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915" moz-do-not-send="true">Intel XE#7915</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901" moz-do-not-send="true">Intel XE#6901</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283" moz-do-not-send="true">Intel XE#7283</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021" moz-do-not-send="true">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377" moz-do-not-send="true">Intel XE#7377</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340" moz-do-not-send="true">Intel XE#7340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7504" moz-do-not-send="true">Intel XE#7504</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794" moz-do-not-send="true">Intel XE#7794</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_psr@fbc-psr2-primary-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_sharpness_filter@filter-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@kms_vrr@seamless-rr-switch-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-4/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-9/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-7.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992" moz-do-not-send="true">Intel XE#7992</a>) +28 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636" moz-do-not-send="true">Intel XE#7636</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372" moz-do-not-send="true">Intel XE#7372</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136" moz-do-not-send="true">Intel XE#7136</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7893" moz-do-not-send="true">Intel XE#7893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138" moz-do-not-send="true">Intel XE#7138</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964" moz-do-not-send="true">Intel XE#6964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_page_reclaim@invalid-1g:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@xe_page_reclaim@invalid-1g.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793" moz-do-not-send="true">Intel XE#7793</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-9/igt@xe_pm@s2idle-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370" moz-do-not-send="true">Intel XE#7370</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-twice:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-6/igt@xe_sriov_flr@flr-twice.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569" moz-do-not-send="true">Intel XE#6569</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718" moz-do-not-send="true">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078" moz-do-not-send="true">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308" moz-do-not-send="true">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340" moz-do-not-send="true">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_pm_dc@dc6-psr.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-10/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8058" moz-do-not-send="true">Intel XE#8058</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-1/igt@xe_exec_system_allocator@threads-many-stride-mmap-huge-nomemset.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled@pf-pt_us-20000:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-7/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled@pf-pt_us-20000.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8280" moz-do-not-send="true">Intel XE#8280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-6/igt@xe_sriov_admin@preempt-timeout-write-readback-vfs-disabled@pf-pt_us-20000.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-beyond:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-7/igt@xe_sriov_vram@vf-access-beyond.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992" moz-do-not-send="true">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@xe_sriov_vram@vf-access-beyond.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_wedged@wedged-mode-toggle:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007" moz-do-not-send="true">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007" moz-do-not-send="true">Intel XE#8007</a>)</li>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007" moz-do-not-send="true">Intel XE#8007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343" moz-do-not-send="true">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935" moz-do-not-send="true">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343" moz-do-not-send="true">Intel XE#7343</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send="true">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-do-not-send="true">Intel XE#3149</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7814" moz-do-not-send="true">Intel XE#7814</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8952/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729" moz-do-not-send="true">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424" moz-do-not-send="true">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15317/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848" moz-do-not-send="true">Intel XE#5848</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8952 -&gt; IGTPW_15317</li>
      </ul>
      <p>IGTPW_15317: 96a15a9593327add69065fd8d64d30b213d1b3fe @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8952: 475b1c61f2f23f573e17e4f8d10c46d635ad4346 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-5218-0375ba98c1fdf69bc3a05ffa80591f9ffe910330:
        0375ba98c1fdf69bc3a05ffa80591f9ffe910330</p>
    </blockquote>
  </body>
</html>

--------------Hy7GZFgRj56G5cnbb814QWUw--
