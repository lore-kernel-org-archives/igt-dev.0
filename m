Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B4CE7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 07:57:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABD610E154;
	Wed, 11 Dec 2024 07:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqMdpeqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA0710E154
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 07:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733903861; x=1765439861;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cati+PywLERJpJQY1rDfjarxk84ivxSOtQnIv6V0+t4=;
 b=JqMdpeqIwbY3C7GGQfI9hM0s+73uhNgMwnW/59p+kYW5xj36092SueYs
 jlciVFeIm/VpJMP4PVm0HdDsVLLckW5YRTnMpinqPp5oayLzybcxbXQ8v
 zgUAOM51WRESmmlkiyv8x8EE3AvPmDvuNDfokEZHATXXO0Y36qIXsft6W
 e34cwfPvGCaiFr4M6TYWmSLvttNUocXD/fIo3fJvSwpxcP31C6CWE9B3K
 JXnr57Owv3CT/+wW74wzAMjw+z0QR9NEItFG1GUWiuaC2MbVHKYXLPSiN
 tGzyTQyY5hYwc+E/fSn/va23z6ceWyTGGdjGiUiuTeqipHTJUR88iGqxW w==;
X-CSE-ConnectionGUID: YhbTvBc9QN6ZUmtSUro2fQ==
X-CSE-MsgGUID: TCwbWn11RNya3bmlLqE8Mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34412312"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="34412312"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 23:57:41 -0800
X-CSE-ConnectionGUID: hZ1bLUjnQ/On6gYR3P+Njw==
X-CSE-MsgGUID: a5FLNmlET16wfyY0+hjLwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118946929"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 23:57:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 23:57:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 23:57:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 23:57:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPxUVr2H36WmeH4OakqUTZ7KMALP5RQY1BHSW5R8qR0vRROPlopDxcbroOxdLQmWtey+yKdycwpOMpNYOOzh+tRXz0K4VFLkeIIsSA8Uy3TYMfynVGFtVTyXYAFCxKRAy5eZpO2taz4I2rfJ7kh8CyYJLcOAPgu3RnvnkAmWMicYX6roVP+zUSjU03M2ajYDFtHBnC9yjN7GsZpAturQudkhv8+JK/OpF8T9XcBYoPytAOBsMaAmOk6YJDRLt4yU+f/50nS6DTey2LIBya3dP3+3gptVklmhMgZwhqs5OYaBdqQUZnoBtqVbsVip3KVrgWSAEv4zHIQsui8dzm7J3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6G4r3aPHdrcCpS4FcWbcLeFgzj7OSuqOIY9Tc1i3Q3A=;
 b=W/xn6RohVY2jo1nya2ODiBkuGNyWmhsgmIN6GaeBV0GP5omOsFHRrxJg/oc1IkMt0BVC2Ml0v3Vvx+UluUBU7KKb1eFZSbhxOokzMKoQmocvn3EnCXwh70ZyInoszqX9ddYyya9uE2soWBTvj35TwFVdr+j+gJVJ/zuJTeNVvOfJqRJs6EqIw3duvGwKGOKOB869g4fHutzbOYEqFck0SIFdAIO+JcS1Sa0DCseTwzthi3nd0RQajtB9LMpnVxi77oROj4cYxqupYPQZ+mr443N58MxCzX4JF1ZxnRB5MonEO2J3UxkvP+FED9LSvnR8trGfVQfGDV9r8ihsx3jfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.14; Wed, 11 Dec
 2024 07:57:34 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.008; Wed, 11 Dec 2024
 07:57:34 +0000
Message-ID: <70d41b8c-1efc-4491-9281-7b85d55e51be@intel.com>
Date: Wed, 11 Dec 2024 13:27:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/9] tests/kms_sharpness_filter: Add toggle subtest
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
 <20241209114623.1843033-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241209114623.1843033-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 3484c75c-fd17-4c2b-10f8-08dd19b97880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmo5R1dtQ3ZCR0VpUXhTUW1XSEcybUY5TmtGdU0xZ2JwcE9kK2xzODlCY0U5?=
 =?utf-8?B?Q3dZMHEwRjczQU42TWxSR3lyekNkOHd0eEtPQzZEWWhQVjlqZ0RzWFhNbnhJ?=
 =?utf-8?B?MFJidC9BL05Yd2xKZ3NnajB6ejF6amxPZk1ZNHFJc0hOY0taMU55YUxaMlJH?=
 =?utf-8?B?QTF0RUhCZWZhdXIvVkNqMzU2eGNNNk5TUjVvUTZkMHNBVkJFc3FETUZkS3hS?=
 =?utf-8?B?VzA4RUNDWkQzVkJJWDFVb1RqMklzN25TSm9CcEI2Y0JxNXVhT2ErYkVVV0N6?=
 =?utf-8?B?aE9kM05lTlBMMUZkVzFXbUJiLzltbWMrMHA3Q2xRSmdlVDRTYTdHTlNiUUhX?=
 =?utf-8?B?c3B5ZzVwWGtZS1RJTGhtcG1yd0U3b1VLLytiNzcvUm1lU010RlJsV1lQbnd4?=
 =?utf-8?B?SmxQVG90NnRlZ0dORmw4dG5QYkdvNzRUM2pJYm52dCttdWtnc1U1UnYvcTBG?=
 =?utf-8?B?bmljZzJTL0VKQ0t5MStidlNUSndrR2haT2VqbzIzMXlubW8xUnlseE8xUDNa?=
 =?utf-8?B?Q29URzY1aDNCTG9SaUN5UWFPdWNtMHRWazk0aFNZYzhtVzJxcTI2cTNORlVt?=
 =?utf-8?B?cEN4ejdnN2xNQzJwWkpZWUNuNzVKZVVVeDBMWWYxMUNHSElXRFVtdStKeEdt?=
 =?utf-8?B?TDhIYVJWbFJqRVJLdU91dlRRZGVSYUJzZEsyTno2dG1KSk4zalZGOSt1eFBE?=
 =?utf-8?B?WjhsMENSaTNWZ05WcXRLeStFbkJCZHhRcjJSZE5uYmJ0VGEyMld6Rm8zSFpq?=
 =?utf-8?B?TGFOZzM0dUpINDg5MW15NWZGN1drYXl3cERUQ2p5OGJGeHlKaHk0V29YU1Fr?=
 =?utf-8?B?STcyMGlLOUFLSzBVTUJML3QrZlZRcVdzTVdKZkNBMlNYMFNZUUZydzRZS0JO?=
 =?utf-8?B?czhlZ3NpYTJlSVhsd09wS3A5VGRmYjRSVmEvbkVHSVVwL2tWR24rdDNleHk3?=
 =?utf-8?B?U1JqcGxzYjRtTFQ5amxhTkpUNGFaNDh3VlFBNXRIa1RuNHVHZzUvSG9DWTIr?=
 =?utf-8?B?UlJmb2FNalNveThuN0pUMGZ5SXpMdk0xRitjNFJrbjY1WEFUNzJHQkd4K3Qr?=
 =?utf-8?B?NDd3OExRaHordVk1SHFlSE83ZWJLb2orcjliQzRualZCKzkxZFNQUW1wRW5j?=
 =?utf-8?B?QTZNaGtjQ2tVc1VMMkdYQWhNdW1LOUJNNEx0UUkrbCs4OU8vMUJydjVYSUZh?=
 =?utf-8?B?NnU3QmlSR2JSNUNhL3hWNTh4Y25JY1ZqQnNEanZXN3lMaU5tRzhEcTI3Y0kv?=
 =?utf-8?B?WGZldDhaTm5TUnNYZ2Q2T09uWVF4MC9FYmdhRkFLN01IRzdsVTJ4NitXVHpD?=
 =?utf-8?B?S2R2TkdlaUFHdnpaL1hoWFgvbi9ycDY1Y3JQWWZseGg4SkFxeWpPVE50dVk4?=
 =?utf-8?B?bzVDbnNQOVRFUkxZWUpIUDl1Slhrem9CNkx6bkVXZXI4ZWNEUnpKSWFnT3Bj?=
 =?utf-8?B?MFhuazFQZnJ3OTJFeTZEK1VzbjZQVXU2SVZxQjBRV1dkaTR1VVc1akZnb21P?=
 =?utf-8?B?R3N1NE5rSVdWTzdHYzFNK0xUa1hxVDluVTRYUjlIUUtWY0VKUWNGZ0k0UVpO?=
 =?utf-8?B?NjlhazdOcGR2NTRFUVkwYVUwYkYrdVZqdWNnSU1iYk5ieS9ydUxNbmNpc3Y1?=
 =?utf-8?B?RnVhaFhpWHRvdlFHNDkrZEZzQndnYlVTaXM0U2FOdzFHOURyM2I0WC9nOFVu?=
 =?utf-8?B?UFJXdEU5OUQ5dTd6YWZSd3paU1E1bDcrVGVacWpXNS9iKzJsZEZNZzAxRkIz?=
 =?utf-8?B?ZUtVazVJeU9lbEsrdGtJck5CMERyWTVVSGhYQXFObEJ2cFA3dm1QSk1OaU5n?=
 =?utf-8?B?QVY5MUt6QzJwZmZSbmU1QT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXVoZFVqUFJDcmVPQVFTTGtCdlFYY3hPbW9MNCtEbTFNT3pTRkpzMzI2Mm9x?=
 =?utf-8?B?eXB4RnVDeDFjN1ZhazlhTVVFSlRna1pwdXRPSmtxdVo2b2FGcDEzYUhINEpk?=
 =?utf-8?B?eXlXc1JiTFovZHdVeDFHVy95L2pDNlhZNWJYYloyQ2s0dzViV0ZZQ2J1V1ln?=
 =?utf-8?B?QkNjaU42NFR3TnBJaE9lWkFienlLOVRTS1JzcHRDKzIxUG1OYVVWTFVEdTRX?=
 =?utf-8?B?SGlBcjV5cUVjWU9NNERxUjhDVmxFTU9jNnpWOXhPN216UUdTVTc1K2JMRlEz?=
 =?utf-8?B?WDFPSWFPNWxXMEhvWkgyajdpNTVSaGJZcmhtcnpZa3dGL0hTZklUVXFUZGZv?=
 =?utf-8?B?R3JxSjJ6MWk3aGpyR2JxYmRrT1VwaXRFZmRmbXFrV0p6LzI5MzJGRGtnOU5n?=
 =?utf-8?B?V0xVMktDcnFpaE5JU2NpUjRzVE5iV3pVMDduYVZNTWtCR1VBUTZYNmw1N3lr?=
 =?utf-8?B?ZEpXUG5qbTB0a2tWTlAvK1VjYjN0Q1ZGY3dyL3ZyZnBtZVhEdURwWUNvTWw1?=
 =?utf-8?B?QldqbXhhZmk4NUZDdkFHbFFMTzNvOXh5ZkRSNDMwK04zb08xbm5LRGlTaC9t?=
 =?utf-8?B?U2E0R0k3WURseGFCeEVlM3RxRWNUdGc5SWw1cDI3K0xOOVRrOEY3UFk2OVZP?=
 =?utf-8?B?L3RsTHYvcjgvQldDRnBTZGdYckF3aDNSY21STzZvTnBJWitFM3YrbWlmOHRv?=
 =?utf-8?B?SXdMWkpsY05vSW1DT21KSm8yWldGbGVFcmNYMlNVcEJ1VUVrb043aXNNQzVP?=
 =?utf-8?B?ODMyaDJXWXBUZnB4Qms4Um1sUHBxYTF6K2dzR2llczVGNDBQQXp3cjBUWHRn?=
 =?utf-8?B?VngzZlJMM04yai8ydkd0MUIrSVhwQXg0UE5JVlB6SzVsRG1SUmV2T0xsNXBi?=
 =?utf-8?B?c2dGWjAyUVg2K2F4aHZKSEdzMjc1Q3JTVGlVSFZhMlJzem9JZCtUSStyZEFQ?=
 =?utf-8?B?VFFEZUwwYkhGSjcyOTNsRU5maGtjeVliOWZmWUs5SXAvRGlLUVFtNU5mdytG?=
 =?utf-8?B?ek1aVG1rWUluNXB4U3JLeEdXZDRXL2U1WE1zYldZaVlnczByOUdQUm40eEZl?=
 =?utf-8?B?ZzdLT3JyMDd4S3ViV3VDeFh1U29jcmJXK0Q1NFVlVGpqL2Qra1BDZjEwYUlF?=
 =?utf-8?B?TVlxNXlPMWNRWGs0cVBXSjl5aEN6bUd6ZDhCdGduSWdaNXR6bWRBZXdpbW5x?=
 =?utf-8?B?Ym5kNVdVdDN3MjBmdG54MlVyRlBhYjFnUXhuNklsSFpHb3N3VUE2cDgyKzRu?=
 =?utf-8?B?VThOMG84QklhWnpRS0gxSmRBK2p5aTJZY2hLMDh6ODVJKy9JOHZIVFVCNTgr?=
 =?utf-8?B?amFXYUF0OHhXV3o2TUw3ZlJzQlZXUmxXclVxaXNpbHhKMUNPNnFPcjdOem45?=
 =?utf-8?B?NzdTNnZoaDBLaHV2MnBSWjBKTklJRXlqdVY1Q25hN1pRQlBZNHRRT2kvM2tY?=
 =?utf-8?B?dkYxRTdpSHh4My95UVRSbmtVN3c4VUdOMXRGeEhmb3ZFMVovYjZndk9rVWdD?=
 =?utf-8?B?VlNpdi9zazdITUk4VUJEWjFMUG45NFdySmtlTnNoUFk4V25rT1Vyd1F1MDA3?=
 =?utf-8?B?YlFUaFJLcG9iVW5zc1ZZN0dpWGNFOWkvNXVPdThCM3NjUHBZLzREZytNNHIv?=
 =?utf-8?B?MXZJRmplcnBoMGh5b0NtQU1IOS8yblptV2t4R3JpR3hwU0xJWkwyK3Q1U0Ix?=
 =?utf-8?B?ejYrYnc1Q0FZeXFraVdGeTBTMjRLRVkvY0ozZUVWZFJ1a0FkVnI5TmppUmRM?=
 =?utf-8?B?NW44Z3BQTTkzT0o5dUI3Vlh3U0pUSTUwMUpUZ3N1cTFOcDRhT3RtUU81UGRz?=
 =?utf-8?B?aC9SQ2E3TlNqUGt0eUMrL2dtMTJtRlFTTmRJWnZrWW0xdituSDAxdDBFYXBa?=
 =?utf-8?B?SWh1V0h2N09yVWtvaDRSb3h5T1AvajNFV1Q0bTk0dEJGR0F4U3hZQ2JGOWVr?=
 =?utf-8?B?NnVtbnk0S1Q3Z3ZJZHhSSGtSN2Y2cjJMZUg4d2RFUmVCc1BiNC9KaGQ0azlT?=
 =?utf-8?B?WklxTGdSMXRwNWsveGJmQ1VYY3dkVHBrL0EzNDMyUnRmL1JnanRwZzlPb0lQ?=
 =?utf-8?B?MnR1K0UyU3JZak5XcXlpbDZybjZzOGxLWmVnY1UyMUFwL1RTajR0OG5YWWw3?=
 =?utf-8?B?b2M3akEyNnNDeHZRVHArcXpTTkZ6VUVEZFZPTU5LL0VrQzFuZ0JXS2dzZVlS?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3484c75c-fd17-4c2b-10f8-08dd19b97880
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 07:57:34.1120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnezQKvdbL2LJ6lN1XZUe1fdza2oVF5CbfYbRmgBXwuQYV8rGWoIh4EocmzR7bm9P2R/Ixix6tMwjEogjPKGbc+xhVlXmQBO2OdQS8coLR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
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


On 12/9/2024 5:16 PM, Swati Sharma wrote:
> Subtest is added to verify toggling/switching between enabling
> and disabling of content adaptive sharpness filter.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Use imperative mood in commit message.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> ---
>   tests/kms_sharpness_filter.c | 40 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
>
> diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
> index bf660cb02..aa200b16a 100644
> --- a/tests/kms_sharpness_filter.c
> +++ b/tests/kms_sharpness_filter.c
> @@ -34,6 +34,9 @@
>    * SUBTEST: filter-formats
>    * Description: Verify content adaptive sharpness filter with varying formats.
>    * Functionality: casf, pixel-format
> + *
> + * SUBTEST: filter-toggle
> + * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
>   */
>   
>   IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
> @@ -44,9 +47,11 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
>    * is seen without corruption for each subtest.
>    */
>   
> +#define DISABLE_FILTER			0
>   #define MIN_FILTER_STRENGTH		1
>   #define MID_FILTER_STRENGTH		128
>   #define MAX_FILTER_STRENGTH		255
> +#define NROUNDS				10
>   
>   enum test_type {
>   	TEST_FILTER_BASIC,
> @@ -54,6 +59,7 @@ enum test_type {
>   	TEST_FILTER_ROTATION,
>   	TEST_FILTER_FORMATS,
>   	TEST_FILTER_STRENGTH,
> +	TEST_FILTER_TOGGLE,
>   };
>   
>   const int filter_strength_list[] = {
> @@ -145,6 +151,23 @@ static void cleanup(data_t *data)
>   	cleanup_fbs(data);
>   }
>   
> +static int test_filter_toggle(data_t *data)
> +{
> +	int ret = 0;
> +
> +	for (int k = 0; k < NROUNDS; k++) {
> +		if (k % 2 == 0)
> +			data->filter_strength = DISABLE_FILTER;
> +		else
> +			data->filter_strength = MAX_FILTER_STRENGTH;
> +
> +		set_filter_strength_on_pipe(data);
> +		ret |= igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +	}
> +
> +	return ret;
> +}
> +
>   static void test_sharpness_filter(data_t *data,  enum test_type type)
>   {
>   	drmModeModeInfo *mode = data->mode;
> @@ -171,6 +194,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
>   
>   	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   
> +	if (type == TEST_FILTER_TOGGLE)
> +		ret |= test_filter_toggle(data);
> +
>   	igt_assert_eq(ret, 0);
>   
>   	cleanup(data);
> @@ -227,6 +253,9 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
>   			case TEST_FILTER_STRENGTH:
>   				snprintf(name, sizeof(name), "-strength-%d", data->filter_strength);
>   				break;
> +			case TEST_FILTER_TOGGLE:
> +				snprintf(name, sizeof(name), "-toggle");
> +				break;
>   			default:
>   				igt_assert(0);
>   			}
> @@ -339,6 +368,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		}
>   	}
>   
> +	igt_describe("Verify toggling between enabling and disabling "
> +		     "content adaptive sharpness filter.");
> +	igt_subtest_with_dynamic("filter-toggle") {
> +		data.modifier = DRM_FORMAT_MOD_LINEAR;
> +		data.rotation = IGT_ROTATION_0;
> +		data.format = DRM_FORMAT_XRGB8888;
> +
> +		data.filter_strength = MAX_FILTER_STRENGTH;
> +		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
