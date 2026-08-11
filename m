Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986D4C5B56A
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 11:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190810E27F;
	Tue, 11 Aug 2026 11:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLqpOUKJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE0610E27F
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 11:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786449548; x=1817985548;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=56dQcHCiQKWckcNeoz7oXwkbVn2ju0rKxKJ608gLvdc=;
 b=JLqpOUKJL7Y7FrcrSoZT/0Yxn1cJPewtaGa4UV9t0YOpLOaOmiOYSWLF
 c5Rdx1WY5bayN7MUuR4OcS2Ztu8/jL5DDxAl94hsXNr6VCT116Pu3FZmO
 tfmBUxCJ0MoGhtmE6tCKsXQqNb4WzCLnyRdRqYMagHgya8pMVhYT+4cTB
 Nqc8EOxv4TyhvHyVomxnC9WFUxOHFkgqYlmUYcj31MYTkpwx/R10ab3Z3
 PHhJr+DzQBnU4Zkxxbt3VMFx3DyjHhk9dc+5cPD8w0Cu9Is9ZjVOCRRKZ
 EDJ81dJSNp9/pMF+4F4AQ9s+al/qZZgxftQlN/dZqDLcU7RELrA1jaKPo w==;
X-CSE-ConnectionGUID: FTaL0u+GTpm4r2lfVZaczw==
X-CSE-MsgGUID: YsGiiWMnRQmE532SIxguyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="85940008"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="85940008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:59:08 -0700
X-CSE-ConnectionGUID: TbSWllTvTlKzmQVeJaeQUA==
X-CSE-MsgGUID: tbcI20OpSiioayX67Z1Tdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="261557295"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 04:59:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:59:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 04:59:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 04:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZF02IhsWAu2whMWqrWZL+WKmIYfhUKAxkZMMuOU6mYTghgkgOzQeEqMrI62mU+rd1W6UNGsK90Pq9ZhgyvJVWbjteMGogrmKQRXxgl1kqGKI8zXKJRVMvsSqddSazED45mFAypfFfO3ruE1InPnnbrR+aGgnG1mSWNSd4U/rZCjSXF5JgPS+SAKyxMAFFzBc8ymwDr6oe7kS8SPo8IZZh0rRx7fcJVmVOpUbOpEr/aqTLzQNZ68d9osKXoc1r0k4WM+/GggBMnOrX88Lp01/0nLaql8Qi/5xVzSB8TY+zHbddt2s3BPtPMLSZv4hz9yaDhMg+hmi5PaihHUJcfe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6tVtCoZVD1vTC0Lg9Tl8ffbHV3N5V/zn3jRDULAmJc=;
 b=sJjYNALzzgj8spPC5MDnkW0exMfNm2HksTckvngzKKj75v5zVeBQgORzG8cUOvl5O5BqanAuwYLZjr4ZGIlUugd80V8iwB9yhHsr66K05rJ4awFqpGBT6+yGiwm8/CGjeE6KSPTboY8BLLtuvMU203yrWy2Z2wCgwjL4Un/QTSlpWeIo4WYE7WO4wONBy89MUSKwplW1zZDu7x/sYo5CrThbwnY5qhIOVZWKqEAid8lKKIfftg/4wY1vG1itZkIadJzM8MBB3QLRmPTWHSqXTQI6m5bC51BcZVUOMx0MsImugnk6bwbfNbCzRAaa3KD807jyZmTcARY18yFMREDJoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 IA0PR11MB7861.namprd11.prod.outlook.com (2603:10b6:208:3de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 11:59:04 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 11:59:04 +0000
Message-ID: <f51c9354-4a9a-40f9-b835-69c9e63f9e72@intel.com>
Date: Tue, 11 Aug 2026 17:28:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] tests/intel/xe_err_injection: Add GT UC Unicast GAM
 Walker Command Parity Error Injection
To: Harish Chegondi <harish.chegondi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <mallesh.koujalagi@intel.com>,
 <raag.jadav@intel.com>
References: <20260729121959.603890-1-ravi.kishore.koppuravuri@intel.com>
 <20260729121959.603890-6-ravi.kishore.koppuravuri@intel.com>
 <anpQmAnfj_dY8Ekp@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <anpQmAnfj_dY8Ekp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0339.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21f::11) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|IA0PR11MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d746e13-1572-4014-72f4-08def79ff0b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|23010399003|22082099003|18002099003|56012099006|11063799006|6133799003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: EgX5spwRa83KcMnXI12KBNxRQyNlShbORflbvHxYXSQnkrqItdF6MDDnGTXxmIj2ncXc19WcD+0OtAtHs3Tr8u+Ay/uOABdBuJahhHFAEAJluoZkYqWdrNhS240/WxdYCcA1Vd5nPeXY7+x6nWQp7uARMDBDcqlxsuHs4+PPpF+8yQ6RjfInZ/RTCH0IJcMz8hIy1zE/iue0BxbgdxXRX3lcqHgu9JXZDSyqNzU1oB13IiEzv74Up+4kSCM2tQbuNBZl6ajLRmaETX28IyEtmWGqAIzE3q7BnUNEFv6Lol1ZnOhUSyt5FIIUwhD9I7kUsBPVmnzXznsPLDFxwZxyWzp/nO5o57JP0kYHU81TJWc47JKgQ1pV8AlmqhOuolg5f1Akxeffar2Gdc9wdBjvgMWCvbYKRtUGh3Fhyqo2InhH1M+94tEcwSgMsMkFlUJ0uWs5cimYWO5lEYsp2kYXMxwwtVC+d1xVbbsQ9GXQZhQ58XPHZQ/afqa2rj7Qu26IAncQS/AeGTDN7HNTfXpWJI3JKW+QonStWVYi+BqqVAFS7gcqVF3JpytBEksCqrt2GI49moaCN5xT1snkJ7BTyrvWaoaULMsPhxjd44Kn3IXVh73devF5/uORYQc5aXOjSNbr1fN7HdyfaLMQ1vh0lkyI2MYAV7nm4GszK5fKFQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(22082099003)(18002099003)(56012099006)(11063799006)(6133799003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZkVvUDQ1ajVPYVJYSk9xWmFnYU5uS2FkVVcwWjFiT01qZDRWR0NQcjczY2g3?=
 =?utf-8?B?ZXRLMVRRaEdPMU5iemFpZWwyZCtwQ1ZMQkVGa0wzUDJkVFVVTFM2L2czVDFU?=
 =?utf-8?B?elJqUm9CZzV0STZBSXZzUCtENXorNWJMV0Fwclk5TWtpV2E3dmVBTFM1YkpV?=
 =?utf-8?B?VEFyR2laMElMcDlsTk1FcGV3SjhqMmhxR3JzYXJ3U3ljbDZoQkNNd2tlNEUw?=
 =?utf-8?B?TlNkWFdQaU9DclcyNXdGQzJ2U01pZ3NpQWhsTmlsdVlPSmsvSGl5Z2Q0OGJ2?=
 =?utf-8?B?KzZiTHgwRjZVQnNtRkUwTml1YnpuZTJXUFAvWFFHZDIrV2hQb1N3bndRS3Iy?=
 =?utf-8?B?VFRueElaaldnNTQ5ZDVabEhVUXZhL2ViOTlETWJtSVNwd2JuU1lMQjRtbm9a?=
 =?utf-8?B?bjdacnNjVEhmUjlEamhFK0tPcUtsV2U1MENsWm9ab1habGtTQnpvMkhaM2M3?=
 =?utf-8?B?MGNpWUR4L2RUS0RWVUt2b3BORWJ0eWZxNVBtM2lnOGlESGJtYnZlaU10TTFM?=
 =?utf-8?B?TDZNZGpHS25weThHdWlIU0g2M3kyZk1IWkZQd3JBRTk1eGF0R0FPb2dNMlht?=
 =?utf-8?B?cVMyVnFONlRuQm9EYVUyM2IrZlRvWUZMZUhGeHdCWWNQSjd4Z0dxTHBUODdC?=
 =?utf-8?B?bk9ndjdWaHR2VGZ4YVBPRVJOSzY3WW1zZVVGcC9hTmU4UnI0ZGhvbkwxdkMr?=
 =?utf-8?B?Wkh0ZzVwbTJWRE9GTTNzZjZmekk3T3haWVJhMGpPM0tVTmlkMlNCUnRTc3lI?=
 =?utf-8?B?cUp1UXdxLzk1bmxvUCt5RjBmbGF0K0tySmRVdVdRMVg3Si9yK1U5azI4SmFr?=
 =?utf-8?B?ZEZWQTAra1k0L0h3dkJVSEUwR09aY1hQeloxNWhWL0lNZmJHdytFWFVpNk5O?=
 =?utf-8?B?dXlYTk40UHJBaHpMVTREd2xzNWl4RFFRUk5hL3lBYU5DL2pIenh1RS9YVG1D?=
 =?utf-8?B?L09TWktpTHh6M08ybTNhUHNZQU9yMThjbmdtR2JQYWlrci9FaUx5ckJsSGsx?=
 =?utf-8?B?YTB1SEdySWN4aGN2SmtPNEtkNWJZWGxkZGF0bmRwSlFCQ0E4aTBYMnBqS2Zz?=
 =?utf-8?B?dG0zM1BSNmk5dFJDbzdYQThLQWVCTHo4NVZad3hkdkN1NmtRdXVOKzIrR1VD?=
 =?utf-8?B?WmNGeDdFS1M4dWxTMFdyZDNkVGZ4cE1FRFFxOUttMTdMTUJJZm9yRi82YWd6?=
 =?utf-8?B?VkpUTTBlNk9veUsrMGVFTjU1SXlpRnlSVHlGenRhSENBT0tNWWc0NUtwYXp3?=
 =?utf-8?B?MjF3NmtmZm9XMlRVZU5VaU03ZmVWQkVtdStBbTNTYkxRRXVBa1M3dVp6ZXRY?=
 =?utf-8?B?TTRoWXl6eVRLZW1YS1BJRXE0d24yTndneFAxS3FXSDY1ekM1eEh4WWNrSW56?=
 =?utf-8?B?VHdlWnExSzllRHJTMDhma2w5STZlc1d5QjdhK0Z3Wlp3bEl2TW5TNWFpNnh3?=
 =?utf-8?B?NUNCdFdOTWF4aFd2UFQrTUprOGZlbDRvcjdyclF5cEgwQXZXZ1NZMkRqOGta?=
 =?utf-8?B?a2RRZFFZRGo1NW5TWnZRSUdxL2huR3VVV3VNTHBURHdxTVBROEtuV3dwaVhO?=
 =?utf-8?B?SGNBazFDc0pIc01zbEhaa1VTY21sK3lPMEc3c2xuTGJkNEhTaHB6QlpnS1pE?=
 =?utf-8?B?emFvTU4xQTBZdWxyaXBJV29Mc0EzcGNzcmJ0ZVF1RXBoTlNlZG5nL1pIOXE0?=
 =?utf-8?B?V0xtaDdFUC9qWGViRWlVVjlJaHV1Uk9mTndvamhtVDFxMEljRlI0ZDA1QlVI?=
 =?utf-8?B?T3NQSHhhVnlxb2VQWXEvSmoweHZQS0s3VlZ4VnZXU3FkcWUwVG5vZHRmeXNi?=
 =?utf-8?B?WFlGSmJ0ZU1vZlQ2VnJ0SndBSEtkTDN3QTNudHR4RGlPQVhUUEg5WVR0RTl0?=
 =?utf-8?B?YUpYSXg0Y0o0OHQ1TjVrTDZoZnpRTGcwWnZtS2hMZm1mUDVxU1YydDFVMUVU?=
 =?utf-8?B?QXpUUGJqdW8yeFRyaTdSM2VZemYrY0xsb25iSWwwY3pEc3JGTjh2OHBaZkIy?=
 =?utf-8?B?dlV1VG14SFpOS3NmTVBzck96cGxHUUpCMHN3MVJJZnF5THhRSXd6YmJUR205?=
 =?utf-8?B?cUdmUmVhaEZYV3AyZ0FtZ2tzSFBmL0h1UWtzYWZ2Y1FxRi9XRXBYMDROYXlP?=
 =?utf-8?B?ZVc2b0JjMTJMQVNpQkI2UTRjZHcrSTlpTGZMZklqRVcxNzhQbWY4NEsyU0dZ?=
 =?utf-8?B?MWY0Ykg4LzU0Y0J6MjlteE5MQVF4Q1VWVkE3MjkwZS9rVmkvOUlkZkFRQ3Ja?=
 =?utf-8?B?OU01M1RrblJnclRmTmxnQ0FLaTZ5Nys4SUR5eUhlR205M3c4aTJkUE05d1Z2?=
 =?utf-8?B?UXZWL0NnZ2ZEeEhYZXFnbndBZUNJZXlqazc2WjkyU3d4cXI0MkVndlM0cVQ4?=
 =?utf-8?Q?fP+MUZu6I/Rx0mkSB2BHyhCbWLA/95eck60og?=
X-Exchange-RoutingPolicyChecked: m8bgJeE/l8ctiR9kLaBYEHbCQT+dlvp6BFOf3GN7nTRDOrggovK1ZXdCkujpq/kHlAiihcmI2Y3QS4gJB7xNb9zIP5ZY/JyjXyL4I6beZL+LiT546OEEOUPU1jvMAH/VbMUu2Aic/EVUSybsBM8bw+V4dtk/xBsSQMiTS2r4Uj6t4JaNe/4f8wzwEhB+7a6RbL1W/X1Q16oseN1jq810cakpdlJ7YKOJ4F1PB8WM88J+l28P+zeTSFTadIXoZBMIOc1ukua3hBBgu88mpnhziF6InecT/mbYIYvE2+FCFHsERbsLAtJKo8S4uYKbHyxR9H/tlOI+o1qH3f4OcqKPPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d746e13-1572-4014-72f4-08def79ff0b5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 11:59:04.6913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w25E8UEJZZ+JRrAnDSy124iGo9jgzjsOGPDxHDh4hammkr++OZmwkNvYQ04yKTKy76xya8f32VMD+/JR0mH7IB8zqsQLezp7AByHFWVJ9t66olrsKfqendBCsPo6uqYg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7861
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


On 11-08-2026 03:58, Harish Chegondi wrote:
> On Wed, Jul 29, 2026 at 05:49:56PM +0530, Ravi Kishore Koppuravuri wrote:
>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>> injection to verify the Xe driver error handling and recovery flows with
>> the help of DRM Netlink API suite
>>
>> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
>> ---
>>   tests/intel/xe_err_injection.c | 313 +++++++++++++++++++++++++++++++++
>>   tests/intel/xe_err_injection.h |  18 ++
>>   tests/meson.build              |   1 +
>>   3 files changed, 332 insertions(+)
>>   create mode 100644 tests/intel/xe_err_injection.c
>>   create mode 100644 tests/intel/xe_err_injection.h
>>
>> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
>> new file mode 100644
>> index 000000000..afbaf0646
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.c
>> @@ -0,0 +1,313 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: MMIO based Error Injection
>> + * Category: RAS
>> + * Mega feature: Telemetry
>> + * Sub-category: Driver
>> + * Test category: Error Injection
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdlib.h>
>> +#include <string.h>
>> +#include <time.h>
>> +#include <fcntl.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_drm_netlink.h"
>> +#include "lib/intel_reg.h"
>> +#include "lib/intel_compute.h"
>> +
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_mmio.h"
>> +#include "xe/xe_query.h"
>> +#include "xe_err_injection.h"
>> +
>> +enum {
>> +	RECOVERY_SUCCESS = 1,
>> +	RECOVERY_FAILED = 2,
>> +	RECOVERY_TIMEOUT = 3,
>> +};
> nitpick: don't have to initialize RECOVERY_FAILED and RECOVERY_TIMEOUT
>> +
>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +
>> +	if (state == POST_ARMING_INJECTION_WL)
>> +		igt_info("Running compute-square on all engines post injection\n");
>> +	else if (state == POST_RECOVERY_WL)
>> +		igt_info("Running compute-square on all engines post recovery\n");
>> +
>> +	xe_for_each_engine(fd, hwe) {
>> +		if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>> +			continue;
>> +
>> +		igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
>> +								    EXECENV_PREF_SYSTEM),
>> +								    "GPU does not support "
>> +								    "compute on engine\n");
>> +	}
>> +}
>> +
>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t value)
>> +{
>> +	xe_mmio_write32(mmio, reg, value);
>> +}
> write_reg is called from one location. You might as well call
> xe_mmio_write32() from there and eliminate write_reg().
planning to add support for other injections such as GT local UC error 
injection tests. IMO, keeping this as a separate function would help to 
call it in other tests.
>> +
>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>> +			   uint32_t bit_mask, bool set)
>> +{
>> +	uint32_t regval;
>> +
>> +	regval = xe_mmio_read32(mmio, reg_addr);
>> +	if (set)
>> +		regval |= bit_mask;
>> +	else
>> +		regval &= ~bit_mask;
>> +
>> +	xe_mmio_write32(mmio, reg_addr, regval);
>> +}
>> +
>> +static int acquire_forcewake(int fd)
>> +{
>> +	int fw_handle;
>> +
>> +	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>> +	igt_assert_lte(0, fw_handle);
>> +	return fw_handle;
>> +}
>> +
>> +static void release_forcewake(int fw_handle)
>> +{
>> +	if (fw_handle >= 0)
>> +		close(fw_handle);
>> +}
> Both acquire_forcewake() and release_forcewake() are being called from
> only one function. You might as well eliminate the two functions and
> directly call igt_debugfs_open() and close().
planning to add support for other injections such as GT local UC error 
injection tests. IMO, keeping these as separate functions would help to 
call them in other tests as well.
>> +
>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>> +{
>> +	struct app_context ctx;
>> +	int ret;
>> +	uint32_t error_value = UINT32_MAX;
>> +
>> +	ret = init_nl_socket(&ctx);
>> +	if (ret < 0) {
>> +		igt_warn("Failed to initialize netlink socket for error command (ret=%d)\n", ret);
>> +		return error_value;
>> +	}
>> +
>> +	ctx.node_id = node_id;
>> +	ctx.error_id = error_id;
>> +
>> +	ret = get_error_counter(&ctx);
>> +	if (ret < 0) {
>> +		igt_warn("get_error_counter failed from error command path (ret=%d)\n", ret);
>> +	} else {
>> +		error_value = ctx.error_value;
>> +		igt_info("get_error_counter: node_id=%u error_id=%u value=%u\n",
>> +			 ctx.node_id, ctx.error_id, ctx.error_value);
>> +	}
>> +
>> +	cleanup_nl_socket(&ctx);
>> +
>> +	return error_value;
>> +}
>> +
>> +static int check_dmesg_for_recovery(const char *marker, int elapsed_secs)
>> +{
>> +	char *buff = NULL;
>> +	size_t buff_size = 0;
>> +	ssize_t line_len;
>> +	FILE *fp;
>> +	const char *success = "AER: device recovery successful";
>> +	const char *failed = "AER: device recovery failed";
>> +	bool marker_seen = false;
>> +
>> +	fp = popen("dmesg", "r");
>> +	if (!fp) {
>> +		igt_warn("Unable to open dmesg to check recovery status\n");
>> +		return -1;
>> +	}
>> +
>> +	while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>> +		(void)line_len;
>> +		if (!marker_seen) {
>> +			if (strstr(buff, marker))
>> +				marker_seen = true;
>> +			continue;
>> +		}
>> +
>> +		if (strstr(buff, success)) {
>> +			igt_info("Found \"%s\" in dmesg after %d secs\n", success, elapsed_secs);
>> +			free(buff);
>> +			pclose(fp);
>> +			return RECOVERY_SUCCESS;
>> +		}
>> +		if (strstr(buff, failed)) {
>> +			igt_info("Found \"%s\" in dmesg after %d secs\n", failed, elapsed_secs);
>> +			free(buff);
>> +			pclose(fp);
>> +			return RECOVERY_FAILED;
>> +		}
>> +	}
>> +
>> +	free(buff);
>> +	pclose(fp);
>> +	return RECOVERY_TIMEOUT;
> If the code flow reaches here, it means neither success nor failed
> message was not found in the dmesg log. So, there is no timeout here,
> even though the above return seem to indicate that there is a timeout. I
> also see that the calling function doesn't care about RECOVERY_TIMEOUT,
> so it may be okay. But probably another enum say RECOVERY_NOT_FOUND may
> be more appropriate here?
>> +}
>> +
>> +static int check_err_recovery(void)
>> +{
>> +	time_t start_time = time(NULL);
>> +	time_t timeout = 5 * 60;
>> +	int time_interval = 30;
>> +	time_t elapsed_time;
>> +	int status;
>> +	char marker[128];
>> +
>> +	snprintf(marker, sizeof(marker),
>> +		 "IGT xe_err_injection recovery marker pid=%d start=%lld",
>> +		 getpid(), (long long)start_time);
>> +	igt_kmsg(KMSG_INFO "%s\n", marker);
>> +
>> +	while (1) {
>> +		elapsed_time = time(NULL) - start_time;
>> +		status = check_dmesg_for_recovery(marker, elapsed_time);
>> +		if (status < 0) {
>> +			igt_warn("Failed to query dmesg for recovery status\n");
>> +			return RECOVERY_FAILED;
>> +		}
>> +		if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>> +			return status;
>> +
>> +		if (elapsed_time >= timeout) {
>> +			igt_warn("Timed out while waiting for error recovery\n");
>> +			return RECOVERY_TIMEOUT;
>> +		}
>> +
>> +		sleep(time_interval);
>> +	}
>> +}
>> +
>> +static void print_aer_recovery_status(void)
>> +{
>> +	int recovery_ret;
>> +
>> +	recovery_ret = check_err_recovery();
>> +	igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>> +		     "AER error recovery timed out\n");
>> +	igt_assert_f(recovery_ret != RECOVERY_FAILED,
>> +		     "AER device recovery failed\n");
>> +	if (recovery_ret == RECOVERY_SUCCESS)
>> +		igt_info("AER device recovery successful\n");
>> +}
>> +
>> +static void log_status(bool val, const char *err_name)
>> +{
>> +	if (val)
>> +		igt_info("Injection status SET: %s\n", err_name);
>> +	else
>> +		igt_info("Injection status NOT SET: %s\n", err_name);
>> +}
>> +
>> +static bool gt_uc_wkr_parity_recovered;
>> +
>> +/**
>> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err
>> + * Description: GT Uncorrectable Unicast Walker Command parity error injection
>> + * Functionality: error injection
>> + */
>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>> +{
>> +	int fw_handle;
>> +	uint32_t error_counter_before_inj;
>> +	uint32_t error_counter_after_inj;
>> +	uint32_t node_id = 1;
>> +	uint32_t error_id = 1;
>> +
>> +	fw_handle = acquire_forcewake(fd);
>> +
>> +	error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +	/* Arm the injection sequence. */
>> +	write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>> +	modify_reg_bit(mmio,
>> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>> +		       WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>> +		       true);
>> +	modify_reg_bit(mmio,
>> +		       MC_PKT_CTRL_MGSR_3D_ADDRESS,
>> +		       MC_PKT_CTRL_MGSR_3D_VALUE,
>> +		       true);
>> +	igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity error\n");
>> +
>> +	run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>> +
>> +	release_forcewake(fw_handle);
>> +	print_aer_recovery_status();
>> +	error_counter_after_inj = get_counter(node_id, error_id);
>> +
>> +	igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>> +		     error_counter_after_inj != UINT32_MAX,
>> +		     "Failed to fetch valid error counters: before=%u after=%u\n",
>> +		     error_counter_before_inj, error_counter_after_inj);
>> +
>> +	igt_info("error counter: before injection=%u after injection=%u\n",
>> +		 error_counter_before_inj, error_counter_after_inj);
>> +
>> +	igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>> +		     "GT Uncorrectable Unicast Walker Cmd parity error injection "
>> +		     "failed: before injection=%u after injection=%u\n",
>> +		     error_counter_before_inj, error_counter_after_inj);
>> +	igt_info("GT Uncorrectable Unicast Walker Cmd parity error injection successful\n");
>> +	gt_uc_wkr_parity_recovered = true;
>> +}
>> +
>> +static void inject_error(const char *injection, struct xe_mmio *mmio, int fd)
>> +{
>> +	igt_info("Starting Error Injection test: %s\n", injection);
>> +	if (strcmp(injection, "GT-UC-unicast-wkr-cmd-parity-err") == 0)
>> +		wkr_cmd_parity_err_injection(mmio, fd);
>> +	else
>> +		igt_info("Invalid Error Injection specified\n");
>> +}
>> +
>> +/**
>> + * SUBTEST: GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>> + * Description: Run a post-recovery Xe workload after parity error injection.
>> + * Functionality: workload validation
>> + */
>> +
>> +int igt_main()
>> +{
>> +	int fd;
>> +	struct xe_mmio mmio;
>> +
>> +	igt_fixture() {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		igt_require(igt_debugfs_exists(fd, "forcewake_all", O_RDONLY));
>> +		xe_mmio_access_init(fd, &mmio);
>> +		igt_require(xe_mmio_is_initialized(&mmio));
>> +	}
>> +
>> +	igt_describe("Inject GT uncorrectable unicast worker command parity error.");
>> +	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err")
>> +		inject_error("GT-UC-unicast-wkr-cmd-parity-err", &mmio, fd);
>> +
>> +	igt_describe("Run post-recovery workload after GT parity error injection test.");
>> +	igt_subtest("GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>> +		igt_require_f(gt_uc_wkr_parity_recovered,
>> +			      "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>> +		run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>> +	}
>> +
>> +	igt_fixture() {
>> +		xe_mmio_access_fini(&mmio);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/intel/xe_err_injection.h b/tests/intel/xe_err_injection.h
>> new file mode 100644
>> index 000000000..d7efc2fd2
>> --- /dev/null
>> +++ b/tests/intel/xe_err_injection.h
>> @@ -0,0 +1,18 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef XE_ERR_INJECTION_H
>> +#define XE_ERR_INJECTION_H
>> +
>> +/* GT Uncorrectable unicast worker command parity error injection */
>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>> +
>> +#define POST_RECOVERY_WL 1
>> +#define POST_ARMING_INJECTION_WL 0
>> +
>> +#endif /* XE_ERR_INJECTION_H */
>> diff --git a/tests/meson.build b/tests/meson.build
>> index a62f447df..0f090dcee 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>   	'xe_debugfs',
>>   	'xe_dma_buf_sync',
>>   	'xe_drm_fdinfo',
>> +	'xe_err_injection',
>>   	'xe_eu_stall',
>>   	'xe_evict',
>>   	'xe_evict_ccs',
>> -- 
>> 2.34.1
>>
