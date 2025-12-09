Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 885C2D3B996
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C48E10E212;
	Tue,  9 Dec 2025 21:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fgNRDjpH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128DB10E656
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765314577; x=1796850577;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=6K6qo4YiYeSBCMc6LM1iRe2scyDVLoHfZgjaiaro69M=;
 b=fgNRDjpHsGEFz5taqwgqEWrUMaauDVtOwWrLeZKSOGVcr6AEd1hI0oYM
 4fHqFHrFR+3EvgskV3Ex3cADJ4HzseXeZ6+ov5cV62iUMNF0bQOJ2RZM2
 8O/J1Fc8X7oPhdhS8+1b09uwTl7GFACPxSLFPfreEZHhvwdVXCnM8jeev
 WXwfd+q03Jw/E8QBplhtrVFn1/C20/YewVeTVy07KwOYmxAYhsxEtalgj
 u8HQOxvjkXTnOya+mbBxZzB7/KWzcNYm+Hq4OHeaQgTa/hOHim72PX8Ry
 zo0ORJvkWjNGozf3cdQ4pdV2zkt770G+HtJpP+Hv4nIQnDLdUiviUxvPq g==;
X-CSE-ConnectionGUID: 6mIuxaKtSNaywPjf84yfuQ==
X-CSE-MsgGUID: lCD6X4peSUuydgxILskrQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71145675"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="71145675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:09:37 -0800
X-CSE-ConnectionGUID: 2o3o/Bn/Rg2zeyz+hSHZAg==
X-CSE-MsgGUID: xws/sua5R4aPnbMOyVsH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200811651"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:09:36 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:09:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:09:36 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.14) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:09:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7Myo4gHzzKzt0Si6n+XkvbuKJvoIgy13DiWVuCVljgZNuiBxv4oK1e+LiKsplmwYSxfjxs9yWh9acf7peBXAMX2ofuPzK4rf2GUn9ptOTolsTAnawHQ2loHMYx719ERepzowptubsFhS9yCFJ+OOjW/o8ODBNzwmrTUErOI6mFTvwE8Na2Aac9fk/TVfFkyFQ/EwNf1V/4BzBChwQTJc00DSOmVgAHVSXxeAqyvZB48ZOuXzlCN6DyFertgMEUbfB1N3lYH14IdXCZSotT+6jcwFtlVQJPVbfeQIpHRC/7QK1QEP7z7H2S7Cs+cDFyDrEwMxw5bgtdoeqb+jtt84w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKAGB0xLtHt+84Xwj9ILK15z/ylBv2Z8QisMHyx38Uc=;
 b=OkoPgxXKSFt5mExQuihO5cRo6MQVxT/njgQuC0naAgLqsIir6EbpffTiv1A7op5vgC6iEng1tM3yC+/JJP6cwSL5StT8b85AGOipBC2ZYER0kjVgIMLZYJsTRYlbQNyQXgjO2dqYftpEl3OC8RZlpz3esosArC+GeeT5VyeKzyosibrN6RenYQmq5fCSkeUjfG9ZVRu5NkS4fxUu4GSqYMwS0e9xBKnB5ZApYoBLXB7PU7yR9DVFuH7JQdL8XW+YZxctR7IQJeHz6DFmKVfg6xUQwHm1WJYZysZRTwQ6mxMiyacJXnfZGTt1PndttRBxBze1r6nBdZIhaYkkTiEfgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA4PR11MB9105.namprd11.prod.outlook.com (2603:10b6:208:564::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:09:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%3]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 21:09:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251120123437.467347-1-priyanka.dandamudi@intel.com>
References: <20251120123437.467347-1-priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs:  Test gt_types_allowed
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <igt-dev@lists.freedesktop.org>, <priyanka.dandamudi@intel.com>
Date: Tue, 9 Dec 2025 18:09:30 -0300
Message-ID: <176531457028.22151.3366462834822236213@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0060.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::35) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA4PR11MB9105:EE_
X-MS-Office365-Filtering-Correlation-Id: 30309303-4f5b-4be1-e7ca-08de376740a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|366016|1800799024|16122699012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uko4ZlVjekJDdlQzWXFnNkhBNUxYVWYwWmErbWZ3STBSdEZvTXVVL2JXWXRy?=
 =?utf-8?B?b1N2SzZjL1A3K20vb1NZekNSQWtJYzVCV2ZhQmNtS0MwYXA0VmVpdXZsYWJz?=
 =?utf-8?B?WUE5ekp6L3hacnBhZ2RsU0hpcTI5NHN1Vkp1dlVtZ1VIaklSNUFDeFhxOUU4?=
 =?utf-8?B?Ty83djF3QlUwalBYYWF5MStocHc5TXQybi9ERkxiVTNRQVdaTytPTFBxZ0Ry?=
 =?utf-8?B?bXljWXEvRHd1Tm5uaU9tdnlBS3JCOUI1Yi9Fcmw5ZVBWdlFHMnZiajJYVHdF?=
 =?utf-8?B?S0NNVlpOWThWeHA0a0Q3R05LTzFubWc1cUZlcUFYUUkrQUVuTy84VzMvMjl1?=
 =?utf-8?B?cjFmNURKN1Y4aWU1Ny92TDJBdGVnVkEyL0JBdFRJVkYyOUIxVHJCVmlVSENO?=
 =?utf-8?B?V05DanAzQUlFZDZUeXRJdHNORHVKVjl2bWNDZ2FudlhIaDVlRmN2bmdWQlhN?=
 =?utf-8?B?VmJ2Nk1kWkNua1JTT3hsRDZVVXAvODRocDVwVm5qL3hvRG5oaUdWbDVHWnFi?=
 =?utf-8?B?UFMxVlBRdS9IWmxEWm5RcWJITitlZkl5TmNGNmlOanBlcHRocmlxdlhTV25O?=
 =?utf-8?B?MTRjT0dwMGFkZEtaSVhrekg0MDlFU2NiQTJ4ZTJkRUtrRC8vUkFtWXpwdnBk?=
 =?utf-8?B?NjVObEtaRGQ5UU9WMUhoQWxpcHRxL0pzdm8rc0FOQUU0QXlHSlc1WXVNQ1U1?=
 =?utf-8?B?dzNzT0JXVVNjdkdXRlpBR2ZhQzVSRTlBbUxGaWZVSEpOY1l5YmNmQ0FnQUN4?=
 =?utf-8?B?Y0kyaGVyczlTRHA5MXZoUFJRaEJwNkRZUDkyaHczQm9QTHpvc25FR0RYYmpa?=
 =?utf-8?B?S0w5Y2JWV1R2YlZMRXN1S2ovamttZWRIM1pVczFlL3ZzUG9PVG9sSS9OMmQ3?=
 =?utf-8?B?T25UaCt0YjZ3TnY3MXVERFNvNXJFcXZ6WXp6SVRRaWNZQTE0bmtwcktRQ2Y5?=
 =?utf-8?B?TkR0cEkzY05vL1ZHcjEzdnJkeGdmbTFtRWkva3Z1dFlKVHRvSG5lSkFQS0Ey?=
 =?utf-8?B?LzhwUk8rc2xaYjlqSm5OVzRxNnJNa2h6R0NYL2g1YTJ3eTFieVlXV0FzWWNh?=
 =?utf-8?B?ZkN4SHppU1BkNldVN1FqMFRLQ1NUNFg4dG5TQ05TNVQwYTdJMk9RN2lrZDUr?=
 =?utf-8?B?WC9TMG9ON0pIQkR0cWNPSFNQYWt6NGorbWpic1puQ2RNeDFQNTBKQy9yajNS?=
 =?utf-8?B?UU9wck5MSGZVbTRvY3UyQWNCQnhiczZkcVRBd01lanVvT2hMQklxOTMwZkNG?=
 =?utf-8?B?VFJpS0JLUm0yZGEycXdaaThTT09wY3lzNnBoc2NBQ0YyRVp5NktvVDBTMTlW?=
 =?utf-8?B?Z25pL2g4dyswbldOVUhwdkd0ME9DemVQb0RmL3BZZnBzdDdCaVNVeWF0dzZZ?=
 =?utf-8?B?aHdqSEZsYWZqWGZHSmtSZmtVcXhjTmp3NTdFZVNBVnltekFzUW8zTWhFMS81?=
 =?utf-8?B?SWtZd1o0VjZvTG1rTlFYUUFycXVmQkRlTHJlT2ZXdnMvbUVvRDVDSXhoS0JL?=
 =?utf-8?B?UmtqT1VjNndLeEFBNGtpMk5Zc2hFZW01V3B1VmRuc3NwaitqT05OV04zcHdB?=
 =?utf-8?B?NkhPOTdCR1B1QUlrN2FJdGkyV1ZLd1VLaUhtZ2tCOFY5VVd1aElLTk90TzFI?=
 =?utf-8?B?R3VUUVdQUzdnd2ZLb2RVQktvVWR6YjVEeWJNei9rUDFuT0lIV0Z1SFpKYVBq?=
 =?utf-8?B?YVVCdFNVL1pRWGZ4aWNnZzFBaUZhWXlhR0MxV2ZaWlVDbGY3R281cHNFbzVr?=
 =?utf-8?B?RXRJSEJML2tOZmNHWWtiR1hyc2Z3TGRDdHZIenJPcnk1OHdtc296VkE0YWYx?=
 =?utf-8?B?NWFMcWpzZGNydkpOV0VZdWJ6ZWdPYkRGOGFUS0Nna0VLR1UzL3FuR2pqZUJv?=
 =?utf-8?B?elU3ampOU2lIb0pUcEFWNlY0bXptNTZFbGtTa0lVeENjN3ljTC9pMEpLRUZQ?=
 =?utf-8?B?QnM1K3NUWWxiOWZoZENQY1F5UUpRU21RbG0wVG1pSlpqY2dQSU16L0NBOXh1?=
 =?utf-8?B?cHZjQ0c3cmFoVGxGWnNPdDU3VE5RYkZJNDYwbnJWd0p5TDBEU2tlNEliandk?=
 =?utf-8?Q?P7CPoZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(16122699012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1Vzc1NoNTFyanIxM1E0NHZzTzFSVmY3TWJiejhaQmF2L2haRnJzODREcEhi?=
 =?utf-8?B?bDFicE05SlNhenBDVDV6emZPS3JaeFVVNzdZZGVGZ1BpRmxjZ3FZUWJvYzE0?=
 =?utf-8?B?azFDcm05dVg0dmtydFhONEV4alFxbFh0Wk54SG5NK05qZFFBRXN0MGpvVi9v?=
 =?utf-8?B?cU5FaHdsZ1ZxbFRPbW9sbnZFY1NOOEhZSitEZjRwUFdrQ1NoeGdvZ1ZTUFlr?=
 =?utf-8?B?Wm9qaXVjdCtxTi9ZUVNWZFNXVXNydUsxVTdXZVd6eDZZTlcvc3R5NXZRd01l?=
 =?utf-8?B?YklrQ1V0TjlRaFZxRzUreFlRZk5oREg2eGVsV2JtN2R0cmxubkZHY1MyT1Vo?=
 =?utf-8?B?OHoyOUw2eWh1TDM2Rkk0ZkZXUDZxUERBNzFLSWxid3FINm9YWjdwRnBmQS9U?=
 =?utf-8?B?b0VMRXlnL1F5bUdSZ09zZUxTSE82TlBZTVRWQmVBWjQza3NTLzdIZ3MydkZV?=
 =?utf-8?B?WEtPcUJkY3NBQTVXSjlkK1JMT2lPc2NSaHVXWWYvdGIvZTI1bzc3SXNrTTRJ?=
 =?utf-8?B?MnFmSUxlM1dxajA0d1hNS2pMUHMwS0JJTWZ5R3lobjBmT0ZpdjNLRGo0TlNF?=
 =?utf-8?B?aXdKYW5pSlBYWUZPRVl4V2dURkE2MktLU2ZJdHRON2lCR1kwYnpWUGlzVjJr?=
 =?utf-8?B?K0lybHlDaHpNRkg5RHptbjNTeUpTeU5nSmY3Qm9XelNxa3J6Z2Evdmh0TmVI?=
 =?utf-8?B?Uk1zK1VLVWRRMFFndkpHSXpFT3RreXhnM25JSXFvM3JSd2oxRXl3NS9tQUFC?=
 =?utf-8?B?QTNaQkFhY3MrMWxrQVg4aVphT00wek9WbkZLamhmcm02QkNCUTNMcmpkZnNo?=
 =?utf-8?B?RGtkS3djYnFOdDNGektOVW9jdTJnVVhYazI5dzBsUWRubjI2dUtTRW1YeWxU?=
 =?utf-8?B?cmc5OEpvU21UT2o0WkIwaVpVd1lYeFkzWjRrTXNvaDR6SlZZU2hxZUhsVkJW?=
 =?utf-8?B?cmlNUEVUb1UzNUZCcTArZTgrcS9QMWhLTjRJT2hwRXFMdndPZGpXTXp3RFBT?=
 =?utf-8?B?eU4rWlVFOHBRNVVvaTNRc21uVXQxNUk3b0c1Rlpjd0RHZjA1SUx5bFBtVHhG?=
 =?utf-8?B?U2poV0o0V29iTWY0aS85OUFOWTExTUlIQWNJK21TZHYxdUhweTIwanVhWFJ0?=
 =?utf-8?B?ckR6WUtFbC9yc2pUd2pYdXpvZ1VFWUFHSXlsVldUdDZHallvcmdRM2FNUjBr?=
 =?utf-8?B?dlQ4R1Nza0ZyWU5BZk9kVUJKc1ozZUJrRHk5N2JUWVFKeWRGT2JtVlUrWXJh?=
 =?utf-8?B?MFR3Q2VsT0JNTVp1bEFvYkRoWkpLemc1WERGZlNCNTZSZmE0aWVJdXE0T3hB?=
 =?utf-8?B?K2ZZSmUzbFdUK0M5dDZUNzFJdTg0STZnNmw2SGpIdFNIb09PSFM0ZVNoS0tH?=
 =?utf-8?B?TkZBanN5NFlXR2VtZEpMcnRlSGYwZ2pqQ2ZQL3dLRU1acjZGMDJrNElTSW4y?=
 =?utf-8?B?RkNjVUtCNHBhczFkL2s4eFNKUHUvaHR1MWR6alZmR2wxZVI5UmE4VTZIakZ5?=
 =?utf-8?B?NmVxUTZucU04d2JxVVFuM1RhQVhiQnBUa0QrNkRRZEQ1UHJmNitKVU1BbHZZ?=
 =?utf-8?B?TjNoK09UbVpNS3dWa082akRqNm00TWMxOTFsUHVkRmxuempYQWxZR0ZoejhE?=
 =?utf-8?B?b21DTUJRejY4UEUvcE9LRkJwMUVJZU9BSGJhM0tmVWYwQlY2SEd5cGc1STQx?=
 =?utf-8?B?VGRkeTZSd1RBL1lEd0hQeXVtM3ZlTm51NjhlUTJKUjBBdUpEendwOFJEcXdN?=
 =?utf-8?B?Rk9idFdXZFZHSlhzcnIrMjJROHJvd1A5YzVZejRuRXBJOHZEWGdNaWhzSkhk?=
 =?utf-8?B?MGpRU3VQRWgrV3dXeTVVN25vL2xhcXI5Z21Gc09EeDlXNXFZY1JmY2FORWpj?=
 =?utf-8?B?QXJWYmdiNGF0eWlCUjFiZEtUdEM3SlJ0ZWFmanFBWjRDTlhCb0FrUTE5NGVx?=
 =?utf-8?B?WVJnVHBNVnhZN2xER0JGL0pUYzNhTG1XbmQ0STJsSStWSnhyRGx6UWp4TVJQ?=
 =?utf-8?B?U2k0SHh2d2tYQVdUcmN0UUhwdW5tN3N6TktpUlNheW02YlRWeDNNWjhLS2l5?=
 =?utf-8?B?VVVkVTBNSlBybnJRS2NlWEt4d1RqTHMrVjdoMlNDRFAyNXUwdXFKd2tpYnkr?=
 =?utf-8?B?TmN3MVF2VWlsMFUxVXlSSkNlMGZZemwyM0RsaWdMNE0zSUo3Z1BnTGRRdy84?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30309303-4f5b-4be1-e7ca-08de376740a7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 21:09:34.1650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bgMvxZaT4kuj0AjF7Xj70CFOZVT1onHaDyqEFQuFGQq1UXalH2UhgrcgnudIDKQpXJatukg4C9FCX0CuCzL8wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9105
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

Quoting priyanka.dandamudi@intel.com (2025-11-20 09:34:37-03:00)
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add test for the parsing of gt_types_allowed configfs.
>Validate different gt types like primary, media gt types
>and check if it can be set or not. Also try to set invalid values.
>
>v2: Tried to validate gt types in different orders and ways.
>Removed kmod_unbind before checking invalid values. (Sousa).
>
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>`

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tests/intel/xe_configfs.c | 41 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 41 insertions(+)
>
>diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>index 911e18965..da1879bb2 100644
>--- a/tests/intel/xe_configfs.c
>+++ b/tests/intel/xe_configfs.c
>@@ -149,6 +149,43 @@ static void test_engines_allowed(int configfs_device_=
fd)
>         }
> }
>=20
>+/**
>+ * SUBTEST: gt-types-allowed
>+ * Description: Validate gt_types_allowed attribute
>+ */
>+static void test_gt_types_allowed(int configfs_device_fd)
>+{
>+        static const char *values[] =3D {
>+                "primary,media", "primary", "media", "",
>+                "media,primary", "primary\n", "primary\nmedia",
>+                "media\n", "media\nprimary\n",
>+        };
>+
>+        static const char *invalid_values[] =3D {
>+                "check",
>+        };
>+
>+        /*
>+         * These only test if gt type parsing is correct, so just make su=
re
>+         * there's no device bound
>+         */
>+        igt_kmod_unbind("xe", bus_addr);
>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) {
>+                const char *v =3D values[i];
>+
>+                igt_debug("Writing '%s' to gt_types_allowed\n", v);
>+                igt_assert(igt_sysfs_set(configfs_device_fd, "gt_types_al=
lowed", v));
>+        }
>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(invalid_values); i++) {
>+                const char *v =3D invalid_values[i];
>+
>+                igt_debug("Writing '%s' to gt_types_allowed\n", v);
>+                igt_assert(!igt_sysfs_set(configfs_device_fd, "gt_types_a=
llowed", v));
>+        }
>+}
>+
> /**
>  * SUBTEST: ctx-restore-post-bb-invalid
>  * Description: Validate ctx_restore_post_bb attribute for invalid values
>@@ -343,6 +380,10 @@ igt_main
>         igt_subtest("engines-allowed")
>                 test_engines_allowed(configfs_device_fd);
>=20
>+        igt_describe("Validate gt_types_allowed");
>+        igt_subtest("gt-types-allowed")
>+                test_gt_types_allowed(configfs_device_fd);
>+
>         igt_describe("Validate ctx_restore_post_bb with invalid options")=
;
>         igt_subtest("ctx-restore-post-bb-invalid")
>                 test_ctx_restore_invalid(configfs_device_fd, "post");
>--=20
>2.43.0
>
