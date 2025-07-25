Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD53CC87FCA
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 10:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA0C10E1A6;
	Fri, 25 Jul 2025 10:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oE/w+rUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BB210E1A6
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 10:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753439357; x=1784975357;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=yFyiQ0RN6oTL3Vk2xRg0Zw890rwB/5jXKuvxvjys4xI=;
 b=oE/w+rUsxUAJkmVQZcTRn2jI6PA/PU93vRx2t7QRMAApWKQeM1+/74Sj
 n8hsEcnvF7+jwwD2UA597TI2oCrmo6w52UlLhRAyYZ3j9MbwIlrtHEtVH
 iJgeagaQ2npysDCSeik6eL6+keJ3oUfDySSym7M1ZEhNF+CLA6GJ6GgPt
 OgNSd2pZ3vbEhQQX35TwVP902Y/vyZx5FDquaKe8wAlsUR2WzIO5f6ktu
 C/OTr745XUn5JvUwXBQtZTD9f2IDzAx4Ka+M2l2Lvu8y/nYmz5CCXGcCI
 NBQ67RnSLv/QkivoTUc+Urv58Dd8DvjJyIKgdfINIXYNi9BH/Tt5/CNlp g==;
X-CSE-ConnectionGUID: wPoHROsoRt6SXT5br9tFow==
X-CSE-MsgGUID: 1REFKwrFRwmmQicfWgGe+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66470527"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208,217";a="66470527"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:29:16 -0700
X-CSE-ConnectionGUID: OMg9KErzTQucOJbI8arSMw==
X-CSE-MsgGUID: OwbVR2d8T8mEpJb/lfBu/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
 d="scan'208,217";a="164901552"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:29:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 03:29:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 03:29:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 03:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fn+gM6MXtsVgeELLjIZdfwlqSt6nEcKpRHBzQdDUy0MWi9w3iDT4cDgeqP/gOS2/OdAupHYn3KtblJfO8Ol0B65mE4xaV72l9FDVSJKIVplsBk0j4lgBCE5IcuQKBMKI5V2vWMjrTw08HlkgrlO0ZENQTSBiECvwND8nphlpNCQ+Yi+SaLnAaQPZwwFEqs6BE0uerzJyY5IChqofLm5ac8vlTsp8wX7S4YwfndMGMiYK2YdQE1bhnlf/2ONooHF9vkI6Hzv/JlUVIDQLSamRrSFMVcWddsgKPv2imxGn0EYIS3zh9Gq86lnvx/SkSy7CyL7eZwOBy3OAeISlBgGlIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4nlQfa1oCMYGPEnJmovHZtr34gxat5BAv+N0a2EcV/4=;
 b=eQCVFxxDcHF/c1UHyjig6HMhv/t50Ys929tnCvaLA78/abzIZ1qQZzsmjtDJve0GZT2TnV9MM8f1gC/geqwkQ3Bt5Cl21VO6rRzFuNzRebEWYkNrHs6rMCYOoqfQGnXOD0z3xyN7LzeQK8dsYSrTqDmDgu+Xgsx3Na5KBZTh9JwzjqKB2sEqzW4gfDOY7+Fa3wey9PLd2qbcStIRaV3GZH3+En4pprwPip/tbhsh12WZTvxDmiaz1PIHTGRlNRUuw/JQa7QB3eSn8ltYaD9P+uCD0cRaXPlllUsHUockCsuxOBOHqr6soe8cg8aVltsftac6BoNMKWvAUA/pcmBp9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by MW3PR11MB4571.namprd11.prod.outlook.com (2603:10b6:303:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.23; Fri, 25 Jul
 2025 10:29:01 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 10:29:00 +0000
Content-Type: multipart/alternative;
 boundary="------------1QbGxKRNbMFftcUkanWxiqRp"
Message-ID: <12a291cb-ddda-49b8-84fe-f86045e3c004@intel.com>
Date: Fri, 25 Jul 2025 15:58:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250724185040.3163412-1-soham.purkait@intel.com>
 <BL1PR11MB544584E2D9C75D9DC47B627DE55EA@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <BL1PR11MB544584E2D9C75D9DC47B627DE55EA@BL1PR11MB5445.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::6) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|MW3PR11MB4571:EE_
X-MS-Office365-Filtering-Correlation-Id: 15eacede-3048-498a-12f2-08ddcb6611e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0hTeXIzb0IrbEFFMHc0dmp4Z2c2THpGUTg5U1R3MTdUbGNLVDFhaDJiMzF4?=
 =?utf-8?B?cEVPVjREQmFzOHc3eklWUVlacFl2cXM3L1F1WkkycmhjRXBYanNKZ2xOMWQ0?=
 =?utf-8?B?dFBvVWVNMTUwTnFlMjJ0NTlVb0s2UGVQWWRONW9yaUlnUXRnS00yeTJ5azMv?=
 =?utf-8?B?QThoZjNmTUVObmM1c0xWSTAwN2M2WUlRWk14VTJyYVRPYUhOazBXeWdiajJN?=
 =?utf-8?B?Y01tanFrbnZ5bVFxS1dOd0FaRTgwMmQ0K2locWVpc0ZWUUkzTUtSTmlEZ0FU?=
 =?utf-8?B?YVk0VUpsRnBNQnNudTIxYzUvM3VuZWQ3WXFTcjhmL1dPcEVHdWdnbmtiR1Nt?=
 =?utf-8?B?aDM1d1JvU3IwMXVnUG5BeEh2a1FLTHZEUEFrbDZYK05NUnpnTjRBbDZ2UkRC?=
 =?utf-8?B?ZVpUN3ZvY1ZPRk1kREFMV3czNXl6eEFSTENwRzBzRkhmNFpFeWFJL3p5QU5U?=
 =?utf-8?B?US8zWkVCdGtldHFVTnFjV0J1UTl2VGVmSmNJd2NWQ2oxcUJaWDFTaGxmNnJM?=
 =?utf-8?B?aDZJTTYra1AzNU9YN3MzbUpNVGZ3aWFmVE1vbjVIZk1JM3E5a3FvNHE3Sk9n?=
 =?utf-8?B?SlU4cVgreE1wRTFGNTUwQ0VKT05FZXRyQndpNTQwakROTVY1WWJqUnVUZUpU?=
 =?utf-8?B?dFJxUWk2dU5LLy9MWEUwQ0x2QW5BbW1XS2hvYVBpeVlLbk5paUo5Vjc4QUN1?=
 =?utf-8?B?RUhQNUlQcC96Z0tpMkd0ZGx5aTdBY0xTbi9HanoyMGQ0anY1ZC9IcUVLOFRw?=
 =?utf-8?B?TUhVeFplNWV5RG1iSHNNa1BwS21zZm9ueGV2UjdBbUdUNGZNYjFYblBUaHpX?=
 =?utf-8?B?d1RIMVpzVWdYdmV1UGN5SVFTWWFYdUplTjNCNkdhaXRYVlBnaDJCc1BwV0pN?=
 =?utf-8?B?UHhrM1R2dkNUdUQxUjRyR3RDaHYzTDZWZlZBR0R4UUNMbTczbVcxN0NMQnRY?=
 =?utf-8?B?b3B3VWdMM2Q2akVPNnBYcEk2cktQSVorMnE2cVp5Mk9VK0Y5QmF3WjcwY1pQ?=
 =?utf-8?B?cE1mVlMxR0tIcDR4ZGpkVk9GaUpsa1ZENC9UaUt1b25aNjM3bXNSYXpPd2Jx?=
 =?utf-8?B?aVZUa2xqTXdQU1FPaHo5RGovYXVPazJrL0ZWWldidzZtcHhvOXNyNzA2RlhD?=
 =?utf-8?B?eEhqV1l5bFpHNGRRYTlRY2wycWtVUnd5UzVYeHo1dFAxRWFJamJHbmtGYklF?=
 =?utf-8?B?ZXZ1bTZJZFB2OWlhRW5Yb0pDNjVRcWUrWEFZVGJ6QlI1WGhFSnBPM2JGQWNG?=
 =?utf-8?B?Wm4yZkpkUzlYWWpROXZmWmdGMVJPcHRQcHFYKzhzYk9NUHNDT0VZZ1BSZ3pm?=
 =?utf-8?B?bFFHOHY4cnBxUDAwaG5nNTdmYlZ6V2JkMGpJYStJVndqa0dMN01vUTZ2a1dR?=
 =?utf-8?B?UkNuR3BMYjM3WHN4cXRPSkdiUS91OUJ2Q09RNEw4SS9zbTlwcEVUd3hQN1Yv?=
 =?utf-8?B?YzZLeXYzVDBTcCtuMSszcUhyK3QxVzBsVlJYS1NVMEVHbTlRYTlUbEFlNE5V?=
 =?utf-8?B?UGQ0Q0RZV1ZEQjNZQlNPZlJuYWJNb3JaWHJITmlhTjJvU3pIZmJCUUl4TEQ3?=
 =?utf-8?B?Tmk1V0Z6NDNtTXRUcXcrdTE1S2pQOTBuQjNoY2Rob1hZOGVZbCtVRWxIT0pz?=
 =?utf-8?B?SXJBUEYva3UraUZzUDM3SFY2Z1A3YU9lbDVZVVJHUFMzY3BlNEJYdnROY2Fw?=
 =?utf-8?B?L1JTcVk3SDNkanoxbS8zdG5vcW1reVRjV3BoVWRobnl5clphbHFLRE5LRmps?=
 =?utf-8?B?Wmg2cEJEK0tYRFpjOCtZT0RjYXhDejVSUUJRQ1N3UFFKWWJPR0lEUFI0MFFD?=
 =?utf-8?B?RVN0VU9aRmNtQlVxcm5odEVzY2lNaEtrRHpsSXh4RG9nRHFjdnVXR0paaFhP?=
 =?utf-8?B?TklaSlBQS3BxMVc5aGVMdnBxcjAxcWVpZVNKaDV5Nm1ZQ3d2djM0UmVSMnNj?=
 =?utf-8?Q?zaC2Vrb5LgI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVViWFpuWGhTRS9XY2ZqZk1ESzQwcmR1Mmpqc3dWb09DVktwbkdDVkRjRWZo?=
 =?utf-8?B?Skhxdi96dzZXcWg1Vlprd2piQzNZQ3luMk5aM2pZcXdYRHR6KzBId1pkL1pm?=
 =?utf-8?B?ZzcyMFBoU3FFc0FXV25UMjQ4SmhlSkJDMDF1MW1xQXBPUmExZjgzNlNtUng5?=
 =?utf-8?B?azkrN0tOTFV0NTBBMVkwNHdtTTNqbXE0NUdEL3lKYWpBc3pPYU9pZDVucUFh?=
 =?utf-8?B?elM5MVc1MDF3amNIVlRNcGMwQkYrVG9YSnBlaXdQMVhRMk15YTlvQ1lqcUpk?=
 =?utf-8?B?RVNRUTlXeXYxMjR5VnVpV2NOdDlKN0hEUUlXcTBXL2xXRzQwSkdPK29naks3?=
 =?utf-8?B?V2lDL3N5WTZYYnhieS96MGpCTHQwby94WEtZTEFlNThpVVIwSVRCRE1pOWxH?=
 =?utf-8?B?UWZuVE9HYldYSjFOQWZBMXdDNnJnUlR1TGVHanJPdmZWTHl6MHU0M3ZTQ21G?=
 =?utf-8?B?bW9pdy9Ud3RWWjFCZW5KU2ZacUlacW1OUmduMEd6SHU0dFJReFNOQy9hT3hm?=
 =?utf-8?B?S2VFd21Udit0WVJQUUg3WTVZMi9pVE0xNko1aTY3SmVKd05CdE4wbGVBUlpu?=
 =?utf-8?B?bGNOelkrM1RmTFRuaTNRZmFPVzVsd2RUYVZJWUVLM21pOG5LVzVXM1daSzlq?=
 =?utf-8?B?c2U0MWI4TUp4R2k5L2kyTk12RHdYNm9RSU1BZ2pQd3ZET3Zid01ibFk0elNY?=
 =?utf-8?B?dEx4RHR4UzQ5NzEyazdRUTRLc2tIMTFVc0hoeXoxOVNiWnd0eDhiQWxKc0hN?=
 =?utf-8?B?WExjOUxGR2Z5UUR5L2ZnTzZLUzVJM0oxWXdxRlZwUkFWMythY2hubGdxb0lI?=
 =?utf-8?B?M3kwaHRFWlhqb0tzNUIvUitsaVVCeHJvZ0M0UUV6djg3Sjl4UGg1U1NMSlMr?=
 =?utf-8?B?WGFMSGk1YzhQd1FUZ1A5SUFZRUVUaXVqb1U2OVRyT2hhYk1JL3A4eDhWQzA2?=
 =?utf-8?B?WWZoOCtnMU9GeFFQeS9YSHpINm54WmlTd1JqdnV2Ym8xSjZoaE9FRGlpNlhw?=
 =?utf-8?B?bVUyVmFReTNGelVSMGRHNlJXRXhCOC9jWUlIbFVhb1BzWDRPS2h4REsyb0VB?=
 =?utf-8?B?RlhTY0JZRDZCYkRCdkdNUlB1N2dmMFN4clFoQUZCdnJJOUxKUXBkTVlCNUdJ?=
 =?utf-8?B?dEV3UUdoY3l5Uko0TDY0SUhRaHlWWVQ3VkRVTDFkeklFeHIzTDhmVWZ4QXZu?=
 =?utf-8?B?cHBSZTZXQW9jZFF2SExCZCtaV2hlR0VoMjRsTkdKUTJ1Y1hadGNnVDVRbFMv?=
 =?utf-8?B?VTl1a3I4K2Zzc1BnYmRuSWkzeEZRWGVpeVQ3STA2UTVkWGtUK1B0K0Rpb3NP?=
 =?utf-8?B?Yng2a2tBZXNOQjBtak9MUnFiLzFiZ0IzUjVidE9IQ0VMK3NTTmlzRThwd2Fx?=
 =?utf-8?B?QTJxUlhIK29EWGZ1TmRzVGdza3FYbldYMzFwbTJSRTlOOCtRWnZzTVA2eGpm?=
 =?utf-8?B?Q3lTbGhxeVhMY0hyZmlIY3YxSmR5SkdBbXZFNEVhOTlBVHlFWEpuOWhCb0lH?=
 =?utf-8?B?bUhPaG9ySVRXLzRDeGJkbG9zS0R5SjkvSS9seWtnZ1lQWnZ4MEtmbHZaVVhH?=
 =?utf-8?B?eDIyN0Q0SmhSTnZKWXIyVCtEd214MEZxa3puMk1zSHZOTzlSOU9YU1NwTmtS?=
 =?utf-8?B?SUt3SWVVUWJ6bVo2amJMZStHaWJqbVRIaXErSU1rdHFUU2VNOFpyQUwzNUhs?=
 =?utf-8?B?Zjk4ckhsTkFvL21kVXVwQThhL3VVVmFOZEduRm9ocDlMVjl3UTBLaENnVTZC?=
 =?utf-8?B?M3I3aGh4WGxmWEt2dS9xMzQzcGc1V2cxaE85ck5YZFpmNDlOR1VkVllyMHRB?=
 =?utf-8?B?MUZ4cnlrcnhmNUp1a083Mi9VdEhvd2E5c1VKOFp5aXBFYU8xeWE2Wnc2UDVH?=
 =?utf-8?B?Z25yVlI3eFBmMTFSenR6MnFVckFjR1BtdWJmdDFlTlh3RUc4YmVWNG1oUDlP?=
 =?utf-8?B?cjcyUTQvSzZyOG1vVTl2aUJFUkpOV090YStvd1BpazY2WXZxQ21NL1N4U1gv?=
 =?utf-8?B?NTVud1I5Zk1Cd0Z6aS84WkZwekJSUkd4QzBIODF6L0pLSXlOd1JDb0locWZI?=
 =?utf-8?B?Yit2NDhFVkdNUEwzTkpKWkNHd3pyekxoZkQzdmhJNVJYVVc2T2NSSDkzTGVs?=
 =?utf-8?B?TnRRNGtTL2J5QnZNQkh6Q1BZVkRaVVYxa1BobFRlZ0pIeFhncVJuOTRpaFUw?=
 =?utf-8?B?S2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15eacede-3048-498a-12f2-08ddcb6611e8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 10:29:00.8173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZoM+0bbmooCtN6qo6sN8eydfGmnFKxpKS0DFRyNwoidAvwxKt71KAZxgn/rDrVa8JkWzV3qN5Z0Ff8aCvUl7Gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4571
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

--------------1QbGxKRNbMFftcUkanWxiqRp
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jonathan,

On 25-07-2025 02:51, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev<igt-dev-bounces@lists.freedesktop.org> On Behalf Of Soham Purkait
> Sent: Thursday, July 24, 2025 11:51 AM
> To:igt-dev@lists.freedesktop.org; Gupta, Anshuman<anshuman.gupta@intel.com>
> Cc: Purkait, Soham<soham.purkait@intel.com>; Tauro, Riana<riana.tauro@intel.com>; De Marchi, Lucas<lucas.demarchi@intel.com>
> Subject: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity percentage between 0 and 100
>> Engine activity percentage within the valid range of 0 to 100 prevents
>
> s/Engine activity percentage/Clamping engine activity percentage to
>
> There's also a nit below, but it's non-blocking, so:
> Reviewed-by: Jonathan Cavitt<jonathan.cavitt@intel.com>
>
>
>> out-of-bound values that could lead to undefined behavior during runtime.
>>
>> Signed-off-by: Soham Purkait<soham.purkait@intel.com>
>> ---
>>   tools/gputop/xe_gputop.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
>> index 9757369a8..ced427c0c 100644
>> --- a/tools/gputop/xe_gputop.c
>> +++ b/tools/gputop/xe_gputop.c
>> @@ -281,6 +281,12 @@ static double pmu_active_percentage(struct xe_engine *engine)
>>   	double percentage;
>>   
>>   	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
>> +
>> +	if (percentage > 100)
>> +		percentage = 100;
>> +	else if (percentage < 0)
>> +		percentage = 0;
>> +
> NIT:
> This clamping operation can be compressed using the fmin and fmax functions:
>
> """
> 	return fmax(0, fmin(percentage, 100));
> """
>
> However, it's not particularly important that this be compressed, and doing so might
> obfuscate what the code does (on top of possibly being slower due to the function
> calls), so I'm fine with either way of performing the clamp.
>
> I should also note that we normally shouldn't clamp the percentage like this generally,
> but since this is just a helper function used to pass a value into a pretty-print operation
> for data visualization purposes, I suppose it's okay.  On the other hand, maybe we should
> be printing the true, raw value separately?  Maybe as an extension of
> print_percentage_bar?
What could be the possible usages of the raw values ? Thanks, Soham
>
> (Though, I guess at that point, we'd want to do the clamping there, rather than in
> pmu_active_percentage...).
>
> Sorry.  I'm just thinking aloud.  You can take this advice or leave it.
>
> -Jonathan Cavitt
>
>>   	return percentage;
>>   }
>>   
>> -- 
>> 2.43.0
>>
>>
--------------1QbGxKRNbMFftcUkanWxiqRp
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi&nbsp;Jonathan,</p>
    <div class="moz-cite-prefix">On 25-07-2025 02:51, Cavitt, Jonathan
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:BL1PR11MB544584E2D9C75D9DC47B627DE55EA@BL1PR11MB5445.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: igt-dev <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev-bounces@lists.freedesktop.org">&lt;igt-dev-bounces@lists.freedesktop.org&gt;</a> On Behalf Of Soham Purkait
Sent: Thursday, July 24, 2025 11:51 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>; Gupta, Anshuman <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
Cc: Purkait, Soham <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>; Tauro, Riana <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>; De Marchi, Lucas <a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>
Subject: [PATCH i-g-t] tools/gputop/xe_gputop: Keep engine activity percentage between 0 and 100
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Engine activity percentage within the valid range of 0 to 100 prevents
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">

s/Engine activity percentage/Clamping engine activity percentage to

There's also a nit below, but it's non-blocking, so:
Reviewed-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">out-of-bound values that could lead to undefined behavior during runtime.

Signed-off-by: Soham Purkait <a class="moz-txt-link-rfc2396E" href="mailto:soham.purkait@intel.com">&lt;soham.purkait@intel.com&gt;</a>
---
 tools/gputop/xe_gputop.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
index 9757369a8..ced427c0c 100644
--- a/tools/gputop/xe_gputop.c
+++ b/tools/gputop/xe_gputop.c
@@ -281,6 +281,12 @@ static double pmu_active_percentage(struct xe_engine *engine)
 	double percentage;
 
 	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
+
+	if (percentage &gt; 100)
+		percentage = 100;
+	else if (percentage &lt; 0)
+		percentage = 0;
+
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
NIT:
This clamping operation can be compressed using the fmin and fmax functions:

&quot;&quot;&quot;
	return fmax(0, fmin(percentage, 100));
&quot;&quot;&quot;

However, it's not particularly important that this be compressed, and doing so might
obfuscate what the code does (on top of possibly being slower due to the function
calls), so I'm fine with either way of performing the clamp.

I should also note that we normally shouldn't clamp the percentage like this generally,
but since this is just a helper function used to pass a value into a pretty-print operation
for data visualization purposes, I suppose it's okay.  On the other hand, maybe we should
be printing the true, raw value separately?  Maybe as an extension of
print_percentage_bar?</pre>
    </blockquote>
    What could be the possible usages of the&nbsp;<span style="white-space: pre-wrap">raw values ? 

Thanks,
Soham</span>
    <blockquote type="cite" cite="mid:BL1PR11MB544584E2D9C75D9DC47B627DE55EA@BL1PR11MB5445.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">

(Though, I guess at that point, we'd want to do the clamping there, rather than in
pmu_active_percentage...).

Sorry.  I'm just thinking aloud.  You can take this advice or leave it.

-Jonathan Cavitt

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> 	return percentage;
 }
 
-- 
2.43.0


</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------1QbGxKRNbMFftcUkanWxiqRp--
