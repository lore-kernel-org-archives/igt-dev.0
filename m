Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E04C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 20:32:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE1110E587;
	Mon,  2 Jun 2025 20:32:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KALQas6K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DB610E587
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 20:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748896350; x=1780432350;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VccYlNqOc+gt2kLOliNL7H2waPs+h+YvM+J1kJDAQPI=;
 b=KALQas6KXjoYkpuWJJkrDFEvUsDmTla2+yA7JYlru2ihdLMOSPobekz/
 Cu8N+XALHIFXTtrGZNQUD2YF9pYQBV4OdbkOhkeoDRy6j2TfkRANCurVt
 fUd+h6kWas8j4NcRmZq4NJSSF1qE9+R/J9y6eLmXHWanjy4PyvC+TiSFr
 d/ZizeYOCelSiEqPuuKrjm52vj3lr8ovZrPghrhFGZKdhaN73I8VWr8or
 u5CoiQrZyPTDflO2Y4Ufe86VhxdBLcS1P6vF/K0q39Le+37ENge3hITrT
 8D1enmEe8sOxDqP4g+z9MDoEHPSqbTHwqHErcV4PyF0VVQbCZ3z8tvuTp g==;
X-CSE-ConnectionGUID: jIfsWqpmT+yoUVlV3rNyqw==
X-CSE-MsgGUID: g18QOz9qSgG66N6N0LnJ7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="68470747"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="68470747"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 13:32:28 -0700
X-CSE-ConnectionGUID: 0AJOeXtWS2W6Zul5Rcft2w==
X-CSE-MsgGUID: Xa5VSaiMSIyHkCSvu14MbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="175481249"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 13:32:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 13:32:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 13:32:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 13:32:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBb9JCyCrBAM85Co4MkAgo6FgJSmBSnxpyMhSzp38Ry3lq2bPRhf/UvnGnQmT/D3lBotkogbE+QYIJ+RIRcytJB0RL8bosqtiF56+yy87DraxQ0vvvQyszzBc5WOCLtN0k3EWsepKSeYORHa6YzZ3MDxACCI8a9bsDcUk/t844Bd+OI/x5RY0jCdhQFEKkrOB7wnmHS/6afDFu0mp2FPj6LgmX+8CgKskSYb1MsDxdRzEaqLKE3uNIRCubREMZrBxhtKaSF981Fgt3HIElGJ2RryzkemB+dNWqDNxeVG0A9xIT0tR3TgOm0LazZE09VTFI5KSWlHnHeXtRAsDjOecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHLJGSwofxZ7b4TWH4uLxRf1RSs8ll61Tvuh99X7MyE=;
 b=uGl8YwB5pKFNIUPzukJioF1tg5qYFe7OxDjcEFe5UbT3QfiPIUND7Fcl456gLHYtwc8fpL3nmUQEz2r2Zb8dfxYA5jKzjBJDKXrgcqDkX/CFX7xPACTdXJia7P+05iZsSmGDV+KBddxzL4dCHKE7/RpPuNmryGax8Et188z3Fg6AD11xy/DEAC/Qi2Lhws/PltqH2ojd2wlBhPQrfI0YcbNli39+l4QWmKi3VIirkWDURTzuPA/FV4zPMD01/3AKVjOVeuv14UE0wQw7hF2mUQ7oqotmUYi1z5GvxHbvttV6aqnZhzJOyhqKbzVdjQTp9eeOgHzjywELSIHSXCEmdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Mon, 2 Jun
 2025 20:31:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 20:31:41 +0000
Message-ID: <157b95f4-4090-4740-9c0c-48f10661ce15@intel.com>
Date: Mon, 2 Jun 2025 13:31:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <b9aa7f22-aa4e-4f9a-9c5d-98d58066fcbb@intel.com>
 <0d4c919f-88a1-497d-84f5-25b8cb854d50@intel.com>
 <74ce12fa-b60b-4103-b92b-6f54a3696c44@intel.com>
 <CH0PR11MB5444AA07F3B7B81735949572E562A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <CH0PR11MB5444AA07F3B7B81735949572E562A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0027.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 4eb8ec40-cd26-4178-3e11-08dda2147bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUw0bnQxeStjOGVOakh2VVpuSTZzOWJ4VXBxajBlUUc0NmpZbXVBTUdSbHh6?=
 =?utf-8?B?QUsxakR2b2JTa3JlVEx5SGo1am9EeWVJNWZpaU9CdlpSdmtlb2FHelYzcDR3?=
 =?utf-8?B?QmlrZE43Z29hVmpTWTlxQXZnZTVrR2Z0TXFyaVRUNlMyUExOSjBNcXVBbUtk?=
 =?utf-8?B?blQ1dVBhd09oN3prR2JKNmRiQVlKRzQ1WlB4WDJuWVBnVGoya0F5emk0ZGhT?=
 =?utf-8?B?VHViNCt6RFRRM0UzS0x3SzM5UktvKzNmaC9VeG0vS0o0ZjdMVFE4SzdjVTl5?=
 =?utf-8?B?SHRRZUNieVY5OFRPblYwZTNuUUkvRHdDMmlUZEZqaUtZUXYwU3cyVGdrSEVa?=
 =?utf-8?B?ZGdBTGF5Q0c0ei9LNWZWUGxFeWhIL0p2Z2ZHU253R1VQcnNYa20wK0U0aVA1?=
 =?utf-8?B?VGt1VW5temhCUkVwNUdUbFZHUUhBVUJubHpXUmdBREo5dmlKOEFCLzk2YUxZ?=
 =?utf-8?B?ZThxNEVyT1A0VWNTaG56dWwzc1pxK0VCUmp1dmk5TjRENnJKNWM0Z0x3b05F?=
 =?utf-8?B?Z28rZFl3cS9wMWdyeVF5UC9rU2dXeFVSOXJ1ZEdGei9JUHBmVE0wQ296ZW5Y?=
 =?utf-8?B?NXFhVHlId3hKMkw4MFlIV25hbXJvQjRsYTdBUW1USVhKWE93U3NSdTdSS2ps?=
 =?utf-8?B?Vml5NFBheFNmazgzdEpSYSt4TVhaQkl3dFVQZ244QnphMDFyeXlsL2NCOWs5?=
 =?utf-8?B?RjRXa0QrSjJJMEJSczh4V1VnSzdhazNWRUtTZGNMcXA4anRqY2h1M0h0Qmt6?=
 =?utf-8?B?amIxRUxSNzI0SHovbkI1dWticzFhQTY4eHdZaTllVUFsa2R0bVNaOFg4cXZJ?=
 =?utf-8?B?MTNRSFd2b0VoS2hXMU12dUZqR1lEd2Y2WjY4MExvSDU2eVo4VzM2UW1POFBv?=
 =?utf-8?B?Q25rUWNCWGZSTm5vVEFuOXErU2w4SWJVaHo1eEZEN0M5b2ovMGFsWll5SUtJ?=
 =?utf-8?B?bEZpN3NWbzJwaFl5U2x5Wjhzem5IWTFPZ25Md1BjdEtWUi9RaDhPTGI1N3JW?=
 =?utf-8?B?cGRyY2dnd2JWSGdiRFAxd24wSTFFdDN2WEI0RngzZmhoSXQyL3ExWmVkRW85?=
 =?utf-8?B?MlpIVFlGSVc5NW1veWhCQkJPK1A1bTZIVFNteTF4VDJ0Y1Q0ZUhyUE5aaUtE?=
 =?utf-8?B?WHFaMkxZUVhrVkFtSmNoc2pJUEJPUUNtOHdZbGZuQmt4emFGSytJazFybDRh?=
 =?utf-8?B?OFhnUU1KMnRyOGhVVmgxRy9JWHZRaXM5VUwvNGxGNENDbGhIdjNnVnBYSzFE?=
 =?utf-8?B?QmlyZ1Z3N01NaGJPclNhMm84VFFyNDlKcTdXMWpCWElEMU1nSHc3ZFU2QVhk?=
 =?utf-8?B?ay9OcmhMZDVCYTAyK2NuVHIxVEpJTldHRUpzUkl2OVhiUzU3SDdPcWJhS2Iv?=
 =?utf-8?B?LzF0WUY3dlgzTTJCNlZydmcrTFl5L1lncjhQVlpkUFZRN3VGOEE4NHdReUZD?=
 =?utf-8?B?TU9SVVpVYllhSkFZaEp1enlmMWgyK1FwLzJyMXBVUEN0SThLNE1XZUxMRUtP?=
 =?utf-8?B?MUhRc2VLMzU4V2lHbktTbGdtc1JmclRvYVAyNElnRzIreGFoTnI3aWpGcjhm?=
 =?utf-8?B?SzNHZjFzL3NuTEQ2dXlzc3lPN05xcG9TQ3N5T3pUcXl2SHJtbDQ4N0tBMUpW?=
 =?utf-8?B?WTJpaE9YMDJyYmNmR21iaVVkaXBNeDR2alRCV0dKSlhnUSswaXgxU1JOSjZ5?=
 =?utf-8?B?aEx3elBRcWc3K3FZQysrUWpKVWFZOVl0Z244bm5yMzU2SzYwNlJXOTdQQm92?=
 =?utf-8?B?Uml5cjZPMTdYc3NVUUdoSVl2YjYxdjZoN0Yxa3g4N0Zkd0xZYjliVEE0SjhS?=
 =?utf-8?B?QmNRdXdBbUVCWHNPY0RZWWpKOWtmUklOMzlLRDhDdGwxYkcxbFF2aDJtL2xS?=
 =?utf-8?B?MlhGSWNEZkwyeHlSYWRKbWRQZzFrQzhNL3BTZ0RrcVJwK2ZuaVF2OHlTMlk4?=
 =?utf-8?Q?CvI43rzn1j4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVZES24vcGR4YmlPQ1NidzI5SUtTcGFWRUNka3UrYmJXdFRkVHNPU0l6Ymo3?=
 =?utf-8?B?SHZINUsvRE1ja29yZTdWcGtPd056TUdUNzVHcUtyczZxeFprbGJ0a3NtcFYw?=
 =?utf-8?B?WEl0UFNYSU1wRnVUQ2RxcFJ5Q0hEa3N5aWRJY212MzFFYUhST3pqY09iUzAz?=
 =?utf-8?B?YWIza0dqUGxxaXVUbVdFU0NFTW1uUlkzZDZvWVlRaVR2QThMb09mcGxDZkdR?=
 =?utf-8?B?YUx2UUI4S1NMZ0VVWlM2WW5rTEw5VmZ3TmxNbVdtR0pyVjl1MGlFS1JjQWxs?=
 =?utf-8?B?SzJjVGNlRTlwZkdacE1wL1g1dVBWRGRTSzBva0lwUHl6dnlEMHRiaGRucDJt?=
 =?utf-8?B?UklvUUdNRG51ZERBVEtRYTN0RW9FSkJlVVhWQnRCOG9yV2t6ZWhaR3AxdE1G?=
 =?utf-8?B?OElMSnc5TjBxQ3NqMWx1OTl2djJYdTJkWndCL0VrMjBRcU1OaDlQQjJoOFVq?=
 =?utf-8?B?Z2ptQTlIcDg3LytHYU54SDkvWmhxVDNEcktJZURqR2pVRldGTXBoV2o0T2dM?=
 =?utf-8?B?SmZ6RzhIU1pYSDMzdW1XVU5WQ2xrdXZDRnIvaS9SV0wwVEdodGlidTJJQmU4?=
 =?utf-8?B?dWhUaFBNMmlUVCt4VkFtZ0Q3QW1yS3Q3RkZ4SWZ6Z3ZzaHlzSXA0aC9TYzlK?=
 =?utf-8?B?cTBiOU5KZXV0RzJSaFB6RDJLVXpMY1RIWEFJWnNxZGp0SlM2SkNmWjVWVEEv?=
 =?utf-8?B?dXRPaXQ5bGFua09jUHFxVEl1ZDVBVE5KR3NlKzd3MUlDUzlSR3lFV3VNKzFp?=
 =?utf-8?B?ckg3SkIxYVZBR1ZHNlVCeFhhcEowR2toWG12NG5tQ3FaRXdtbGZ5bHlad1dq?=
 =?utf-8?B?WjZiK3V4WEs1WXUzVStxdkZUVXk5VTJOajIyYUNCblpUcTJPdWdFd2RpUXdv?=
 =?utf-8?B?K2NPNWRGNGNHSXBFdmxiYUJaUC9HU0NCaVk5dWtXT1RrcUZBYkVMWEFhaXdy?=
 =?utf-8?B?dW1Fb0ZKTTliOUVzY2g5QmJ4VTZnakswTGdUUUVXYWY5bUF3VlRmN2JwY3lV?=
 =?utf-8?B?TFlRUjRtMFl0VlIzanlZcUs5Qk5ESG4vV3NNOVFCbXoxcXl5NnFoRFV2eW91?=
 =?utf-8?B?QXRvWWkvUVZZVkpOQ2I0WFRJbG83bUc1dGhjZzlFbVk5NkpNQ3h0eTV1eU9U?=
 =?utf-8?B?QnZhYXdXRkpZdjQ5WDM4RlhTS1Zva3VkUjNmZERiRjdsVDJkSHNYZkdVY1ZJ?=
 =?utf-8?B?MXdHSGNTdWtLeWhGMDI0c3VaU0NIMzYxTVArZmo5ODVFK0c0aCthU1JZRGlY?=
 =?utf-8?B?bXlvUzc1eHB6Q2hoeVYxb21oK0thQnA3aGxQVGNLTDJoQWozaGs1N1ZBQjdR?=
 =?utf-8?B?QUw5TDJueUhIZWp0ZW9ybnpLL2dBTSswcHhFYlUxOWJnOHpNUWRueW1sQjYz?=
 =?utf-8?B?bkhVOU8xL0UvSjB0WUJrc0QvaVAyTzRNMkc2Uk03ZTFQSDZ2cVZSd1pYNTE0?=
 =?utf-8?B?b0tieE5FUit6Ykg5a0hjQ0NFZ0RQUmdFYU5Kam9CeUQ4ZkNYZXRnZ0s4dWo3?=
 =?utf-8?B?dXgyQWJaTDA3UFYxamZYUEZ6Z2lKYVpkL0JNTVRhaEtJcGtQdEtOL1I2TUoy?=
 =?utf-8?B?bjZJRmRHeXkyTjZlT1NaTVpFVlBiTmdTVmtrTWlmTEtQMDhjNlZCenV3Q0pw?=
 =?utf-8?B?Ykw1Q2VTQXc3QUhoQ1NLVG00YmdqaFIyWWZIdU4xSzV2eVZkNzdvUEF6dXpk?=
 =?utf-8?B?OGt4b0N1Qk83blJ5ZE1PVVhHSWF5d2dWZ0JVNCtqdmpHUEhBK2ZpbWFHWXZV?=
 =?utf-8?B?RU5WRUJPMzNCV0RES0ZyOS8xTXJqazNmTVVUcFhhQ3IrOW5MWUxFRWxOeDRt?=
 =?utf-8?B?am1DbFR2RFRxL2ZSUnpGT09RTU9qL2p6MDVwbllEaVhiYUVPSnV1UmpTSDhB?=
 =?utf-8?B?QnFqUDAzdUcxQ0YwU01jUm5xN3VpWFRHTk9kb0phZkFLdmppQ3U4eVZVMHFR?=
 =?utf-8?B?TXh3ZERVQ0VaLzJaRVZFM09iUzhoREVUM2pGM3dVSHJ5RTdheWtyVkYvSmUz?=
 =?utf-8?B?czk2YlE5ODBRTVVlNTBHZHR2RlQ1U01GVzZBUUphbSt2RE4xRDdqMWNocVpL?=
 =?utf-8?B?MW9EUDc0RHYveUFGSVBZMzNZdE1JZ3dZSVFOOUU1blVVaW55VU5ORWh6dUxp?=
 =?utf-8?B?TE9DRkZ4YXNpN2ozN29JYVdsRmVTMnV1UklUNkFqY0lYeURHeHdXU0R0Q0VV?=
 =?utf-8?Q?MWGjxg0zZ1G+VaHyOPd34Pk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4eb8ec40-cd26-4178-3e11-08dda2147bac
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 20:31:41.6213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 28lcqMmwNr0wl1zpULEOHEhbColu4JrXek/iqVW24czip+4UUemSs4mxq4UEabEMz/FO3pNGXoyQe+A4CJbz8N9lTKEzpGO7QPbHKNVHXYI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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



On 6/2/2025 11:30 AM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> Sent: Monday, June 2, 2025 11:26 AM
> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors while injecting fault
>> On 5/29/2025 1:29 PM, Michal Wajdeczko wrote:
>>> On 29.05.2025 18:23, Daniele Ceraolo Spurio wrote:
>>>> On 5/29/2025 6:31 AM, Satyanarayana K V P wrote:
>>>>> Currently, numerous fault messages have been included in the dmesg
>>>>> ignore list,
>>>>> and this list continues to expand. Each time a new fault injection
>>>>> point is
>>>>> introduced or a new feature is activated, additional fault messages
>>>>> appear,
>>>>> making it cumbersome to manage the dmesg ignore list.
>>>>>
>>>>> This new patch automatically ignores all error messages from dmesg,
>>>>> eliminating
>>>>> the need to add or maintain a dmesg ignore message list.
>>>> This would make the test almost meaningless. If the test finds an actual
>>>> bug (i.e., an error we didn't expect), how would CI detect and report it
>>> but how can you tell upfront, without actually running a test, which
>>> error is expected and which is not?
>>>
>>>> if all errors are ignored? The only situations we would still fail on is
>>>> when the kernel just dies.
>>> and that perfectly fins, sine we should look only for BUG and WARNs, as
>>> it's quite natural and expected that once we inject an error, the driver
>>> will likely fail to load or proceed, and/or may report some error
>>> messages, or even try to silently recover, *but* it shouldn't ever crash
>>>
>>> and that should be taken as a test goal, not that we look for specific
>>> error messages that could be changed, omitted, replaced by the different
>>> driver release or when running on different platform or function
>> The patch does not look for WARNs though, it ignores all errors with a
>> "*" filter, even WARNs. I'm still not fully convinced about ignoring
>> anything, but I can understand the POV of ignoring just messages with
>> the "ERROR" tag, as suggested in the other replies. I'd be happy with
>> that kind of solution.
> Huh?  I thought the alignment was that we were to ignore all messages
> that *don't* have the ERROR tag, not the other way around?
> -Jonathan Cavitt

We are injecting an error, so some messages with the ERROR tag are 
expected and should be ignored. The question is whether we should ignore 
all of them or keep a list if expected ones and ignore just those ones.

We definitely can't ignore warnings or asserts, as those signal that 
something is going very wrong.

Daniele

>
>> Daniele
>>
>>> Michal
>>>
>>>> Daniele
>>>>
>>

