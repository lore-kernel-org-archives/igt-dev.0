Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77492C4450F
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 06:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A2E10F44B;
	Fri, 17 Jul 2026 06:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n57XMZ4/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A7510F44B
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 06:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784269494; x=1815805494;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=yHpXPdB0VgTrNlgss4lPEV6mPtbRtGfQxiXIrACNkmc=;
 b=n57XMZ4//eqe5JziOy6VCcnZJCKie3Z5fR/uxW6kHGm/H3gwYBoxioHk
 SV7VQljQfKvKS95HekF355Dgsphy5KDUwOMjVjngXMac6s8mtmMmZeYlQ
 mh/jdQ1L1WFneL1//5PuJ0y4bPhCNudul3Mtd88fsiwhkKMxCKqqYBK1a
 uO5mpUazNxOXprGvWbWNcThldRoIvkaKkbAOd3LxZQdC4CwPJ/rYw09ee
 aOpIJc/BQMGodYRUN4dHhMRdn0fS95+1Xl1M3IZ8RedBzRCG6hVRrj5eL
 SM3mgYCudxYRKk/+s7eY2AEaR3vV6+VjdDPps5QUv1Qz89z8baMqQKBJM A==;
X-CSE-ConnectionGUID: GsOTHI5mQ6asLsUQTT+ZBA==
X-CSE-MsgGUID: puLBXON9TtujpFgpDfnIkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="87485246"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; d="scan'208,217";a="87485246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 23:24:54 -0700
X-CSE-ConnectionGUID: 1Dmwe7PiStOUYRFjlFaCrg==
X-CSE-MsgGUID: gVH5BhY0Rri1srxH8NdDyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
 d="scan'208,217";a="258698709"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 23:24:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 23:24:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 23:24:53 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.34)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 23:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkRxpG00XEE5ML9UQAObalbXq1IDEPiDvn6rZJDc8jSkee976pMY9+SDaOM7UVQ6NUyQtMeWxmw+inB9LDeUDR7X6vyuhYhq1gAJNsStBd+3WJMOxoyGhU6UNp19PaxYkITuzeT2DEqsGQ2yqZDitUycNzRI/QVWx36xpaOHlN2120jMmodS87T/p2Ii0MmTVCjmxpiswUOq9nxXrUU2skNjaRuPv+WSF5SqOO+EOcl09cZRYBrbPSWFFJ0AQ4cK3p8Sv+zVoNCSgLRYCzlifQWamuudO6H2AxioOI95YVIqOISHPxA4dw5pi4SLFviMer9l0cQYXmtea0YNW+v+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kslvXRNj18tEIm5LJsc4EAywm0/TI35NcZcaV0NWhcw=;
 b=q2nZY3ApX1xTYL2+yAobu88sKJisz9KUb7JnfGCRrxj6YvyxwW2VxV2hubzP/1HsjEfAHzQuRXRb8wTJ2fPQ5X2Ch+3Mgit+pbRu2j6oP/DwQnmFAgf1SHTejLPEprJ6pVzCthRiFErELOQ7baU+ZV7TmYt06rgbvbzzPLDPTOdjGmXmdRXlfAxGybGS30nWSfrcP64g1Auts5oVaK5iNVNbLFdaLgbCwV1BLCj51Pe4OblKBu5sx9pVn6bWGCSPezL7XFWKzFyT2gSEMzcqqbkCp2zAB/MqjLJe1N61P0qXbKs+HesK4CaksSzvZG2C+YOC1iPfVKkF4NpvOk6NWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 06:24:21 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 06:24:21 +0000
Content-Type: multipart/alternative;
 boundary="------------cxXCLpyU6qEAODX50bijy4M0"
Message-ID: <6210de7a-a70d-4817-9d0e-8e69a72ace81@intel.com>
Date: Fri, 17 Jul 2026 11:54:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: FW: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc: Fix PSR/PR entry
 timeout in dynamic subtests
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260717035658.857405-1-jeevan.b@intel.com>
 <20260717035658.857405-2-jeevan.b@intel.com>
 <CO1PR11MB4913D78D03AD2A61DB0505ECE4C62@CO1PR11MB4913.namprd11.prod.outlook.com>
Content-Language: en-GB
CC: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <CO1PR11MB4913D78D03AD2A61DB0505ECE4C62@CO1PR11MB4913.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5PR01CA0273.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::12) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|SJ5PPF57F27BA08:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2ff2b5-47ba-42a6-dfb3-08dee3cc09be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|3023799007|4143699003|5023799004|18002099003|56012099006|11063799006|22082099003|8096899003|10067099003;
X-Microsoft-Antispam-Message-Info: Cu5w1rD43Mk9BBd2EYJy156vUMc/IhzgIm2TCgTfKUuQDert4M99zOUODI4O+X8N8Hzpksi227sVMMKg9bRTEdcK6EHAxFgIVSUeSLeicTjEIbnbuhC4DwzV2tVv8rlwD/FBykeRTlWJRbNSeFt391hi8rznGKrqEayCd62jaTL/FTF9iNFrRnKAx88nGwN+IJVI65b79fUa7dH8ECsyvVhBUWkPcLUB4bFxw1eZac2MCWEksEW2xi2B2AL1X5lTomKsMzyNHh/2mqJWmQCmmwfrgJMRnLn1ZQ6qzaJyj6qIJXGj2FXITrHA5Sq9lN+fF14LewFfGqdjRE5FJz6bU73Z2anDR5VY/r5mMOdjoSY8aq6R/w2YFo6reDMhhvktEUpVSkY8qs243A7NBk+Avoqn4kqZSZ1ep63UfAtGOVJ8QgWqnFC/uJiwAUS12SJTElG2R+izEEkflTlxNFP8LLRuDdhK2XlXuMUs7L7H5+x5AvztEOtz2LXb8ERHbk7bWq0eiZKvTsSppzajvAQg/cL1lWztlMJ/3hT89G7resLuWgCzIN6T6Mv3p4ncXr1mpcUzplw9dmMdOfcl5eHquP1qCh5459CbGV2lBu6LT8d3uFgT7E3sK5Wvgy50t9vxo46+YewGXeAtuk0qmYvBA+CUIGE4rBb1+dDhlVIsYSA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(3023799007)(4143699003)(5023799004)(18002099003)(56012099006)(11063799006)(22082099003)(8096899003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmdXemxjWW8yZWk5UWtpOHVPcm40R1haMDhqNTdpZzE4cW93K0wwQmlwd3lo?=
 =?utf-8?B?dHY4dFA3MmdlYVM1amhkR005MjMySkF4R0lmWlY5eVVlYU5KSHYvTWxPV1NZ?=
 =?utf-8?B?Rkk3ajM2K0JxL0p4c0taR3ZiVzhZSWorWTA5c1Y0YXZuTWFhM0Rrd3dET21Y?=
 =?utf-8?B?TExtbkRHZWdJY1doY2RLb1Rzak9JeXpBZndtRkM2R0p5UTBTTE9PdERxVFBV?=
 =?utf-8?B?ZzBmejh0Z1M2VHo5RDd6S25EbUZZa3E3OVA4RVUwbjNhVGk1aisvbFRQQ0p1?=
 =?utf-8?B?ckw0NHM1YytuYzJLektuQU5wRU1vTFBtTTV1YUQ5TzIwNmJ3ZGV2emEvUk1G?=
 =?utf-8?B?dnpUbGo2VDU1dStxb2dYSmQyZXB6RUxwRTNlR0hTWHF3em5SMWNPMDBWS1da?=
 =?utf-8?B?dHBGODNGdGFOTVdrYzNzRDlxS3g3T3lHdm0rR2dGSlhHT2JCUm5IeWphSnZx?=
 =?utf-8?B?T0pSakdTaFoxNW0vVTNwS3cxWnFTVzJTMDZNQnVNTVc3WTBuMVlLZEtyV3VO?=
 =?utf-8?B?RXRwb2Jxdm5uVVpXWWVzemRzRDhGNHdTVkpvM1hJaHdlOW1zamlSU1RJR1Ix?=
 =?utf-8?B?bG5IUFNPNi9WR3lyS2srd1NKSDk3b2kvdkQxUXdodnV4WG51K3F4YkswbnU0?=
 =?utf-8?B?LzUwN1p0ZzByT3FUSmlrMnovcWdvK3VUaElRWVNYQXBCdVp3aERiTldiU3Va?=
 =?utf-8?B?TSt4TGNuY0MzeU9NbUphMTRHQVJUWUZOYi9hUDRzclBTMHozYjM2SVNxMWt2?=
 =?utf-8?B?cVd1TktJNERVMklQaFlFRXlqQnAzbDVNYk9FN2lmR1BKby9rcGc0bFQ5OE9K?=
 =?utf-8?B?SmpNZW1uTm9MVDNqMUVuWDl3ZmNWc1NrUFc4U2MwdTV5azFiM0wyVDE1NlE4?=
 =?utf-8?B?ai9weHQycHZBV3NMTU1iK3R6bkhvb0ZKdEVyQmZqNHpFaTN2eTVZTU90QmdK?=
 =?utf-8?B?RmJGSHhCRzNrOWE2cS9JVjRkM0syeGhrQlluQzJudmJqU3ByTEVMMVpjNWJs?=
 =?utf-8?B?K0tjNGhaelA0c3M3YzJYSGc2dUVZMi9GUlN5WkdnMzBVOU9KbWpDT2NQN1F1?=
 =?utf-8?B?VmlCWGN0Zm1DTStvMEx1aVhEbDgzWFpURWM3VkI0SWR6eFVUbkRzdC9oQmZO?=
 =?utf-8?B?UFFPdUJmTm9acUg5c0NXZk52OVJuV2lGOUg3Rm05d0hsRUtIcGxMU0JlU2Fl?=
 =?utf-8?B?ZXpERFhINDh6bGVYeU1CK3dpT3ZjbmFnaW1LbUtsZVMxOVczUjRTS013VDh1?=
 =?utf-8?B?alJYQkVyRzVvRklYR3BEMHBMMFUxdWRzRmdveXpVakhhTXJQWjJsLzM5eEJa?=
 =?utf-8?B?MytKWG1DNEZuMzVwY1hMNVZWVEtmbW9nSHRjK3JJS0owdFJqS3FWdFNuYW5P?=
 =?utf-8?B?THlKang0Ym9GNWQzdm5VQzArSmF6OXBKb2lLTUlaQzVxOVFSdEloQUZNV294?=
 =?utf-8?B?M1NvRDRaN29hbHpGblpMV0dlYUVSa0lOSHpLcDZXeHRXdENoenNXYXoyeTlz?=
 =?utf-8?B?MGFqaGp5dzA0T0VyUldKQW04QjlJa1lpb1h3SmhwSGNXa0QxLzd0VmUwcm1s?=
 =?utf-8?B?VnhBUzAxVG5xc0IveCtzL29CaFJhcHV0NEpZd1B2Y3U2UFF4eHQyTjdEYmlp?=
 =?utf-8?B?TFRXZXF6L2NJdmxvd0dieHB2MHNBaGdncWtrT3ZyYXJYcWYxZWF2c2Q4WGZ2?=
 =?utf-8?B?SG02Z29CRzUrVkhHb0pMVjhQV3FzUk42MjFqNVJwZ09zRWM5NlZUSzlxREh4?=
 =?utf-8?B?SGs3bWFZWVVObnpKWDBQWTJYVzBKZ2VTRkxmWEovMzQ0d0pqbjBVTytQUGgv?=
 =?utf-8?B?VW5uVmM3WUJKc1cvKzFBWUJiOElLSFdwMC9FMitJQW1Pdk1vUS8wM1NTYUxW?=
 =?utf-8?B?Skh2L3M5NlQ5QzEzMHFPeXlTMVVraUNhQk9QVGVaTEpRaUdCajh2Z2d6azcv?=
 =?utf-8?B?YjgrSnFDaFhKWkVEV1pLcnc3aHg5RXlqQkpmNGZUcTJjU0F3eStPNHBQdVky?=
 =?utf-8?B?cVp3UG9KY1p2VUcyQnNDNktUak5TaTNRRG1oUmRXWjdBUnRtb1VkWGFlb3BX?=
 =?utf-8?B?Q2hJWXlyOVY0cStzSVVQdEJNTkVGV0JzUjlTcTFXTlFuazBGaXBIQm1mZFRi?=
 =?utf-8?B?S0lHZ3VaNHE0dkxqRC94cU9IOXdkY1JoZzVYbEtEOUVtWVFIQktuSlhrSUth?=
 =?utf-8?B?VnVVVGg4eldaMTRoWmNRYlZkTXA0K1JUMmI4MXpzaTJaWWdUZjQ4SmdQc0po?=
 =?utf-8?B?anJtSVNqUSsxd1BmN0x0ZDhrMjloeksvUTY2MG5odWZPOHZ6c283UVVzNnJI?=
 =?utf-8?B?bXlIbTgvRnR5VkZBWWZRT3hyRXh3VnRFT2ZMaVZMMk5wYmt0elZqSTFLTzlm?=
 =?utf-8?Q?b08FYOiSz5n4Ar88=3D?=
X-Exchange-RoutingPolicyChecked: Zjw8pGW7ZjLNZJKxIKoqXc2S5acB3gSula5RKoZoXLW0ej458C6+ETtm5C4l9J1iYZO/lxe5XTv8uU+pgVPuLyuloILZMYjkRvzxRHYyBqhvRTTGfiu/jeCVD4rO4kxEl8+t0Cw2VCuw5qsQCNwr2IsQi2h0vWIfZ/HqrVYG9LPuvbbvtgKSooSi4ElhV9BpSDx/7fR03JezhdReYiZTpXSNHQQGOoLO/1pmzU+xdDhbmOhhc8qOnYZwyQt7mNF3tGoGAEQyLG4urqAqhK/Qq6+2hIgvhsYRETMCuyyDOEygk1U4LtdCy7PdWua9XSJ1LacaRGkHyK2Igm/zWQCj0A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2ff2b5-47ba-42a6-dfb3-08dee3cc09be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 06:24:21.0431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2b7St2nah2MDukTPbw2MWXTdM4V4NSY1spBurCyS+bRvuROwVFz5VwYVnHHbxngF4i3NbkVeEmmzbxnEutb67wgq1XIdrA0UNyZChqmuoMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF57F27BA08
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

--------------cxXCLpyU6qEAODX50bijy4M0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 17-07-2026 11:28 am, Thasleem, Mohammed wrote:
> -----Original Message-----
> From: igt-dev<igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
> Sent: 17 July 2026 09:27 AM
> To:igt-dev@lists.freedesktop.org
> Cc: Dibin Moolakadan Subrahmanian<dibin.moolakadan.subrahmanian@intel.com>; Naladala, Ramanaidu<ramanaidu.naladala@intel.com>; B, Jeevan<jeevan.b@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc: Fix PSR/PR entry timeout in dynamic subtests

LGTM:

Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

> After cleanup_dc3co_fbs disables the primary plane, later dynamic subtests can wait for PSR2/Panel Replay entry without any valid plane content, causing entry checks to time out.
>
> Add commit_initial_dc3co_frame and call it before setup_dc3co in all DC3CO test paths to ensure a valid framebuffer is present when PSR2/Panel Replay entry is verified.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index ef53c5f96..018def5e4 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -315,6 +315,16 @@ static void setup_videoplayback(data_t *data)
>   	create_color_fb(data, &data->fb_rgr, red_green_red);  }
>   
> +static void commit_initial_dc3co_frame(data_t *data) {
> +	igt_plane_t *primary;
> +
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &data->fb_rgb);
> +	igt_display_commit(&data->display);
> +}
> +
>   static void check_dc3co_with_videoplayback_like_load(data_t *data)  {
>   	igt_plane_t *primary;
> @@ -356,8 +366,9 @@ static void test_dc3co_vpb_simulation(data_t *data)  {
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   	setup_output(data);
> -	setup_dc3co(data);
>   	setup_videoplayback(data);
> +	commit_initial_dc3co_frame(data);
> +	setup_dc3co(data);
>   	check_dc3co_with_videoplayback_like_load(data);
>   	cleanup_dc3co_fbs(data);
>   }
> @@ -436,8 +447,9 @@ static void test_dc3co_framedrop(data_t *data)  {
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   	setup_output(data);
> -	setup_dc3co(data);
>   	setup_videoplayback(data);
> +	commit_initial_dc3co_frame(data);
> +	setup_dc3co(data);
>   	detect_dc3co_framedrop(data);
>   	cleanup_dc3co_fbs(data);
>   }
> @@ -493,8 +505,9 @@ static void test_dc3co_vpb_framegap(data_t *data)  {
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
>   	setup_output(data);
> -	setup_dc3co(data);
>   	setup_videoplayback(data);
> +	commit_initial_dc3co_frame(data);
> +	setup_dc3co(data);
>   	check_dc3co_with_framegap_load(data);
>   	cleanup_dc3co_fbs(data);
>   }
> @@ -706,9 +719,10 @@ static void test_dc3co_after_dc6(data_t *data)
>   	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC6);
>   
>   	setup_output(data);
> +	setup_videoplayback(data);
> +	commit_initial_dc3co_frame(data);
>   	setup_dc3co(data);
>   	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
> -	setup_videoplayback(data);
>   	check_dc3co_with_videoplayback_like_load(data);
>   	cleanup_dc3co_fbs(data);
>   }
> --
> 2.43.0
>
--------------cxXCLpyU6qEAODX50bijy4M0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 17-07-2026 11:28 am, Thasleem,
      Mohammed wrote:</div>
    <blockquote type="cite" cite="mid:CO1PR11MB4913D78D03AD2A61DB0505ECE4C62@CO1PR11MB4913.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">
-----Original Message-----
From: igt-dev <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev-bounces@lists.freedesktop.org">&lt;igt-dev-bounces@lists.freedesktop.org&gt;</a> On Behalf Of Jeevan B
Sent: 17 July 2026 09:27 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
Cc: Dibin Moolakadan Subrahmanian <a class="moz-txt-link-rfc2396E" href="mailto:dibin.moolakadan.subrahmanian@intel.com">&lt;dibin.moolakadan.subrahmanian@intel.com&gt;</a>; Naladala, Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>; B, Jeevan <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_dc: Fix PSR/PR entry timeout in dynamic subtests
</pre>
    </blockquote>
    <pre wrap="" class="moz-quote-pre">
<span style="white-space: normal">LGTM:</span></pre>
    <p class="MsoPlainText">Reviewed-by: Mohammed Thasleem &lt;<a href="mailto:mohammed.thasleem@intel.com" class="moz-txt-link-freetext">mohammed.thasleem@intel.com</a>&gt;</p>
    <blockquote type="cite" cite="mid:CO1PR11MB4913D78D03AD2A61DB0505ECE4C62@CO1PR11MB4913.namprd11.prod.outlook.com">
      <pre wrap="" class="moz-quote-pre">After cleanup_dc3co_fbs disables the primary plane, later dynamic subtests can wait for PSR2/Panel Replay entry without any valid plane content, causing entry checks to time out.

Add commit_initial_dc3co_frame and call it before setup_dc3co in all DC3CO test paths to ensure a valid framebuffer is present when PSR2/Panel Replay entry is verified.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index ef53c5f96..018def5e4 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -315,6 +315,16 @@ static void setup_videoplayback(data_t *data)
 	create_color_fb(data, &amp;data-&gt;fb_rgr, red_green_red);  }
 
+static void commit_initial_dc3co_frame(data_t *data) {
+	igt_plane_t *primary;
+
+	primary = igt_output_get_plane_type(data-&gt;output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &amp;data-&gt;fb_rgb);
+	igt_display_commit(&amp;data-&gt;display);
+}
+
 static void check_dc3co_with_videoplayback_like_load(data_t *data)  {
 	igt_plane_t *primary;
@@ -356,8 +366,9 @@ static void test_dc3co_vpb_simulation(data_t *data)  {
 	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
 	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
+	setup_dc3co(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
 }
@@ -436,8 +447,9 @@ static void test_dc3co_framedrop(data_t *data)  {
 	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
 	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
+	setup_dc3co(data);
 	detect_dc3co_framedrop(data);
 	cleanup_dc3co_fbs(data);
 }
@@ -493,8 +505,9 @@ static void test_dc3co_vpb_framegap(data_t *data)  {
 	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
 	setup_output(data);
-	setup_dc3co(data);
 	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
+	setup_dc3co(data);
 	check_dc3co_with_framegap_load(data);
 	cleanup_dc3co_fbs(data);
 }
@@ -706,9 +719,10 @@ static void test_dc3co_after_dc6(data_t *data)
 	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC6);
 
 	setup_output(data);
+	setup_videoplayback(data);
+	commit_initial_dc3co_frame(data);
 	setup_dc3co(data);
 	test_dc_state_dpms(data, IGT_INTEL_CHECK_DC6);
-	setup_videoplayback(data);
 	check_dc3co_with_videoplayback_like_load(data);
 	cleanup_dc3co_fbs(data);
 }
--
2.43.0

</pre>
    </blockquote>
  </body>
</html>

--------------cxXCLpyU6qEAODX50bijy4M0--
