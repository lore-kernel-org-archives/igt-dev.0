Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5843CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 22:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE0710E0B4;
	Wed,  5 Nov 2025 22:40:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TtPRV+s9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C205B10E0B4
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 22:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762382411; x=1793918411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q3DmhEDBBP429nClSsogKUEV+a6LAIzYRcuv78Lkthc=;
 b=TtPRV+s97YKVPeGsL+dREIHcpL/W5EpZE7ot3p+ZVIjtGUrMfjQGWxXc
 0iSrTA6ZMePFwzoY1RWtAHFVWm2bRp2TzMmmoNp2aWs3G7jXFTJ6w6ws/
 lTKMvPii1W70EBDDUE4QduA+XEkAC6eacUl7vuIqJW/PvJFJYFMyr40Ox
 WV5esHFxh+34M+ITkMj5FAatJBBFSiq+JBWpd1cjIAMB4jDJpHlOS0seN
 E0kQksVoIcmhZVsKvtVrsjpLCTSDW1OM552PZhjJfHLyRLMmcwP8C8aCa
 cD7MKk/OmkISBDwWqcOEGUXWZr7mS9JIwrhgJvOArmANvyXINxaOheTDY A==;
X-CSE-ConnectionGUID: SUkL7frXTXCaHUbjJ+z+Sg==
X-CSE-MsgGUID: fd79cP4xS+W48fUurzEpXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="74801455"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="74801455"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 14:40:11 -0800
X-CSE-ConnectionGUID: FBUe1gQ5TQmj0wZBGdi8ew==
X-CSE-MsgGUID: xEIioJD+TgClHGXqePYp4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="186834202"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 14:40:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 14:40:11 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 14:40:11 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.4) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 14:40:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMfbVrxzJUSXGP+xWkwskr2QNU25JdKpX1edAwAoNVc/Eb7jghplH1wjjD27lq6g0/hWPSh3HA6o3HnNeqYe3ePcHhxEGh9Fq9LIe2Mr1AePhAl6NLTGyr7JAwj0VGqgkJG5LyIu2nXf60fVrGUEZC2J8CzeFcEyb5HTwMGWMh7aixS0Cfba3rJfx1s0sVSoqeiUhRp/LsJik5o86VyvX5jZO4UWBKkaaFdY6eEvcwqzs+pdWUvDBjGPPhvuDK6TLTyx+E0kLQJmcXSsCtyBn+nmT04atpc/koy4hI+pFrOfJB5a1I+Ikm0acUj8py+FhRRYOo4Net5ldsXKak1EuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrkpquxe9csYCt4RwzM6KiEx3RKZe6eYCpzi0OGFKAA=;
 b=CTI51s1UA7Qkq8QxDJJqqf1FIJ7vKPqiJZta37QhGVrBQX8u+I+VfCH3+K7dGshL6lbRvRVoGpXcJaTra89LoIxLFE+U9lD8oeCXoZ4brBehJLMHRFrPS0RlBQH62WOewiSk1Z85HkBCUXE+hgQMEVxYXlmG/Fuo8TP693DRjk7FewCyW8yHg2Tty1FrB5533T0gjGtAgljP3ptwerIyXEgxsUeoLday/MEqOU63DBzMlcX6oP7ruwQmp++O7WsObhlKaC+QkWgsC42++PHilMIzt6XhwvGY4CA1X7i18LHu4ZzeuS808j52JCihDwnNCi3wEMIxQ95bC3rzWpfhqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 22:40:03 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 22:40:02 +0000
Message-ID: <3766e36a-11b1-4603-b86b-de320a4f110e@intel.com>
Date: Wed, 5 Nov 2025 23:39:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pmu: Reset sched_if_idle value smartly
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20251105184108.161889-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251105184108.161889-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0045.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6bab38-5159-4610-a78b-08de1cbc424f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTZmTVloZXgzTEszR1o1NFdYV0EzdDRyZXE2enlVQVdkQ3RhV2VKcjY1ZTQx?=
 =?utf-8?B?STVnWE1BYjJhWjRqVW9CNlBYNVQ3c0J5SzlFSVJTL0xRaUNvYmpKZDN1T1B0?=
 =?utf-8?B?MFBJc2R2eHRXaE9sTzlBSjJhanpwSDRwcFpZSmkzcGJuckdPZlMwc2MxUUZN?=
 =?utf-8?B?dm42NzNZeU40ZEtGcFRhanE0aWFuTmZDRUdwNEZ1bGV0ditMNm1QZ2h5eTI0?=
 =?utf-8?B?bTF6bkFGOEp5anc3S0NMQjBUb0xSTi9hdTF1c1JZdHVJM2tkVjNyQ0R3U1Zx?=
 =?utf-8?B?NFRWNm0rSm9vWStUWlV5WlZidytzWlcrSnMvb3Q0N25EOWhMQktvem1YQVFH?=
 =?utf-8?B?TUhSeEs5V0ZvbmdWd29ITmx3TXNDbVhtdjBZS29VQzNEMlpFRTUzcUtEb2Qy?=
 =?utf-8?B?WGVRT2xka0VKUW4vTXpnR2pURWh3ZTZFNnVRck5uMVdmRTduc3ZmWW4wemtE?=
 =?utf-8?B?V3RLZ3FZeDhNSGZ0WFlLNlpSSmE4eHB4SEU0OHFNMFFneXlzZytEMTZYKzBJ?=
 =?utf-8?B?Yy94U05JZHhubHlVL1NaTm5HSy9CdnBoRVZOeE1vUGZBUnQwUG5nRXliSWNP?=
 =?utf-8?B?Z1hkK3JMemdXR3N4OXpDV0Nib051ay8zWjZrTm0xMDZtUzcrT2dnUVFGcTBv?=
 =?utf-8?B?aVowRzU0NjhRR0ZaQVg5WDdEaWhKSkRKbnVnVzRLcnpyQ3BVTDBUamEzVjR2?=
 =?utf-8?B?eGdSTUFTOUxoSlZLM012UWtPT1RjbnFMVVZPbi8vVHh2aUlXTllQZEkzNXZh?=
 =?utf-8?B?QUQ5YkxJeDNGUmRJWXRIVHRVZ29CK1V3eXVsMmFxTWUzRGxVUFNKNGc4aE05?=
 =?utf-8?B?bTJ0VkNyeG04c01qMGhyaEkySnlXMElVNXg2eVhQdFpXcmc4cDhYcGNRVVl6?=
 =?utf-8?B?QkRQMklDWS9wZG9PWDVVWmRXbWY0eTdocWdXa21Xd3Z3MjlsTm1SYWJUUTBx?=
 =?utf-8?B?Q3QyeEk1MzVoaG5CUFZVWWEwYzZmSzltaXdha0QraDJOcHVyTTVQbU0ycU9s?=
 =?utf-8?B?SExva2RYTkM3Nm9IZW42QVBZcjc2NWNSVEIvdDNqV2JWUUdHVnErVTdsc2lC?=
 =?utf-8?B?N21jajh0clJCVUs5RVpWck9NbTZOTFEzU2Z0MjNIdU1KMjM1bnJ6YnZnWi9U?=
 =?utf-8?B?M2VlUEVDYi9tdU03anRoUCs3Qlh4TG5ObkV6T2E0bDBxa0NLVzBHRmVoMC9v?=
 =?utf-8?B?dCt4NzFJNEpIU3dpdDEwbzA2TVhQbURxUUxpSGJmZy8rYjFDWmtVcnlyUWta?=
 =?utf-8?B?RFF6NUo3bzZiTTd1MHg5di9lWElFSWVSNWc4eFJoNnRyb1BjbXkzMUhTdzI0?=
 =?utf-8?B?Lzl2T3FMWFBOZU1SVW1hczFDazVac0RXU3pDeDhNNUhSb2wxZUlnL1QzUmR4?=
 =?utf-8?B?aTI4Y1B3c2Jvb3V5a2svRktsQVZTUm9ZN1NOK3dhL3BoMDBBcWRUeEllTEJJ?=
 =?utf-8?B?UDU2TXJiNUwyMktHdWl6dFdGVUhTMW5XRHVXNjNsNUdYSlVEeWdIcllaTXBt?=
 =?utf-8?B?UmFKTmFCWFFjYW8wOEhTdDU5WEs0QWlyZEZtWk0xeW1lVEpINWszWHcyN09q?=
 =?utf-8?B?UWJWRTRvMS8rUllRNTA1NVc0Z3pSMmZ6dFJ1dDkwTlhHQjFIanJQK2NUNWNO?=
 =?utf-8?B?RmE0WUl3cFdIUkUrQkM0VnVqZVQ1bUpZNThwdkcvazZNbmVlcmFwQThMY1Mx?=
 =?utf-8?B?NFptdEJqOGtkcjFpa1d1dUJHZitqcTZtYjhyb1VsbVl3cGFqYXNyUE9NbUhp?=
 =?utf-8?B?M0ttQnVQcEV6bWlWUzJSQjNTdnIwQ3BKQmZHZDJnZVFQRVJza0FyaWRDZkJt?=
 =?utf-8?B?djhGOUJ6aWZIei9tQzdZb2pGY2syRXJJbmt5VGFRby83UXYrTlpmSW9YQndY?=
 =?utf-8?B?VUhKdUlNM3h3MEo3Y0o1bTQydSt2Qjh0emFNT0hUamtyNWFBcjRIV0ppN1Qy?=
 =?utf-8?Q?772LOMUEE/5HLteEaxt/EPo3g9UgF76R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1NYdWJPK1E2aVV2Ulprd3RranVXT3BvMkZsUE1VMlpLK3lGZ1hqSTRiZTRi?=
 =?utf-8?B?V2JzbnFTb05YYkhmVzFUQUdRTnowNlFZL2JSTCtXUnAvUXRQTERVWGRxb0Zi?=
 =?utf-8?B?N3ptVFVRTkk5MzFYM3kwREhrMjVZLzhISmRWaEtPUVZKOVJ0UGhRZnA1S0dV?=
 =?utf-8?B?M2NQSmxuNkdjK0FUSkxhSVV2M2FkRkJpK0pHK202MFJ3cjA0bmZzdGU3M05k?=
 =?utf-8?B?VnNaVmpyUGFQa0MxN0Zkb2FmRmVSVzd2NHBxRkltZGhTWjUyZVcxTTlCU1BI?=
 =?utf-8?B?ZGlOTlhxeVRXc29OT3RzR3c0TXBvK0hJVHBwd2Vxa1hJZHkrNWN4M1JWQVpy?=
 =?utf-8?B?NzREbUYvSEIrM2E5ZW9xWkg3Q2M2VHFhSHdRbkIwWHJNZFZ5Sy9CVDVRNmcz?=
 =?utf-8?B?eXd0d2tlTDhCYUxvSHJNeHNEMXo1MEtnTVUxVG52UUQ3ZlJQR0RjamFod3gz?=
 =?utf-8?B?Z0pCaTFodWMrZ1RwQU9uMTlpQURLb2dhVHFLY0lLdWNCbGRKUGhjWnFhcjgy?=
 =?utf-8?B?SWJnY2tXVEdaTVRSV0EwdFRNUmJVNVA0L2UwS0tqZHlnNWdHM3YzQWF1ZVpT?=
 =?utf-8?B?a2ZHNkpPV29BOXp4YVRJWENvRjYrdXl1czRrYmlBOUtaS0ZGY3B1WTZFRGh0?=
 =?utf-8?B?WUdwWGRiVlNYTXZKWm5OaTRuNkw5dkRLb00rWnRsZ0piVU5jMmZWUDFPTTFp?=
 =?utf-8?B?WWdrbk5EaTYrSEQ0bHRuT3lmM0IxV2IvVWtvM01LdngrSjZBcjlhSDNacXhJ?=
 =?utf-8?B?U2svVjlTVlJJMUhnZ2N0U3pZYzR5S01oQkZJbm03Q1dyTkpxTDhWRE1yZG1L?=
 =?utf-8?B?bkJ2S2l2R2hFc2xnSGY1NUR3bENPd2YrRlprejZ0USsxb3REdDNiNGJ6UmJH?=
 =?utf-8?B?ZkFFekZ4N29YTTdaNlBEQlp5WTlRSjFZU2JCRE92UWhuaTJZa3VYbmlFQmxS?=
 =?utf-8?B?NUpiL0RiNE5zTDJnZG1sWWJwcUp1emVVU1JDRnBnWW1PNmNCMytlK2dqN0ZF?=
 =?utf-8?B?RFVKbUZCbVdha2FmTTYxTno3RG5icXVLOXN0T0gra2VVSFdDVFdEaXo4UmFh?=
 =?utf-8?B?TlNpRG5acHJpVDNTT0VQZXZqZ1RmNi8zV3lDRWFGTTFmekZlb08vY0duZEVL?=
 =?utf-8?B?MU5kVE9tWlpkOTMvYkliMkRkYjVDWlJDMGh2ZHRwSkhuOXRJWGswWjVseGx1?=
 =?utf-8?B?ZjNYNWVscThJNnhZcENKRTRhZjlLTDNYekJPejJyZU9ORjU0c1B2NnpaVTNZ?=
 =?utf-8?B?VGVaK2ZoaktOdjhIV3hidFVZZU5mOVo5N1FNMmM3ZTZZWVVaclAvYTBmVlFY?=
 =?utf-8?B?dGZ4UlpjdkRyQzhITHoxajloVFFqeFlXZ1M0Q1UyM1pXck9qMnpqYzlEVm44?=
 =?utf-8?B?RTk4aTBKWE1tcWhDZGZmRVhCM0F6Tk14cjFQQTc4c0hUUkszUkR6RTZVUmcx?=
 =?utf-8?B?bk5tRkJGVlA4RStqS1ZVQzRZUVpOam9TMmhqTFlEL2RHNWprTzl6WGVNdEd6?=
 =?utf-8?B?SjQ1bmlsVjBQUTNncmNXOTBRd2JZelBCcE5INm5UaDVaN3JUTTZ6T1hjUzVZ?=
 =?utf-8?B?L2xaYVFIRWNFeWRTYUJ2ZFFlaUR5WDhMa1JVZXhJWjh3ODJveDgyQm1QWlBa?=
 =?utf-8?B?UStwNlVLc29EdFVSdm5PM3JjNVdFeWMvZE9CUEJjOWNvemJaalNNUUFPWDdH?=
 =?utf-8?B?dmRxRGtwS1JBNzZReHBuVFJvaEpWeDEyNjZIKzJKcjZPSzNURnlvZ0tnN0RE?=
 =?utf-8?B?K0dpWW9QaGw3M3Noa0MrdGhVaHZaOVFTSzVPTWwyZkprR3c3VEE5WUdxUURu?=
 =?utf-8?B?VEd4enBvbE5wc0taVUlaR0tweUpnN1dSMU02Yjg1aktka0h6clR6NmF5QmhR?=
 =?utf-8?B?VkFYQjh5VG5DU1haZnhTaHdVREpMMjFHdVNKTWRRMjBUWTVrd1Q0RDM3TVdK?=
 =?utf-8?B?QnljTFBlVHhnTnhRVGlmL0FxNTdFY1VaL0lKWTI1LzBSbWg1M01MUmx0NzhG?=
 =?utf-8?B?L0lvTVgzY0ZBVTRBUWtlM1ZHV2RTSU1SRTNCR0VsUmRLYWcraTlLeGR1cnFT?=
 =?utf-8?B?bjBhS1lvcXhtSUZaR3N3azFHNmZ0ZXBOQU1jUWoxb09aaWFFMWJJMEdmWHNk?=
 =?utf-8?B?UXA2N1RnY3p0WWl6bmZiNG1zNnRvYkljV244TitrajVhNEpKY0R2S1FzeExS?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6bab38-5159-4610-a78b-08de1cbc424f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 22:40:02.7754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1jiEry0aourVphphWPQ3j4fi5qz4H2oI1f1LUTRlN4fyzH/iH486StIUCO62PGsXrJ9JK2GrksI+hO5lJFVrXVJJcS+k2l3VgCG4uV3yY3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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



On 11/5/2025 7:41 PM, Jonathan Cavitt wrote:
> Only reset the sched_if_idle value in unprovision_and_disable_vfs if
> doing so is necessary (I.E. if sched_if_idle has been changed).

sounds like optimization, is this a goal of the patch?
> 
> Additionally, there may be some delay in processing the value reset
> request, so add a short usleep after resetting the value via

what kind of delay? what problem it causes?

> xe_sriov_set_sched_if_idle.  This will presently only have a performance
> impact on the fn-engine-activity-sched-if-idle subtest because of the
> first change.
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_pmu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba2..f3dc85bb1b 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -1010,7 +1010,10 @@ static void unprovision_and_disable_vfs(int fd)
>  	unsigned int gt, num_vfs = igt_sriov_get_enabled_vfs(fd);
>  
>  	xe_for_each_gt(fd, gt) {
> -		xe_sriov_set_sched_if_idle(fd, gt, 0);

changing legacy policy "sched_if_idle=0" is equivalent to resetting all VFs priority to "low" and should be harmless for all cases

> +		if (xe_sriov_get_sched_if_idle(fd, gt)) {
> +			xe_sriov_set_sched_if_idle(fd, gt, 0);

and while we can _optimize_ and skip it, it shouldn't have any impact on tests

> +			usleep(100000);

and kmd shouldn't need any additional delay,
if that solves your problem, then you're rather hide it

> +		}
>  		for (int fn = 0; fn <= num_vfs; fn++)
>  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);

what is actually dangerous, and maybe even the root of the undisclosed problem you're trying to solve here, is leaving the default PT=infinity while enabling "sched_if_idle=1"
so here, in addition to EQ, the PT should also be restored back to 0, and we must make sure it's set to relatively small value together with EQ during the test

>  	}

