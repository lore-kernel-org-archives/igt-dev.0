Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5899E68149
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 09:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A0310E4A5;
	Tue, 17 Feb 2026 09:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BBRr/KAH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD5910E4A5
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 09:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771319826; x=1802855826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZcER67Djh2STXlXcSHkVi4MAVSVYQRO9ulfC2dVxxY=;
 b=BBRr/KAHO5CgG5HC8We9c3e5dqtFYH3Mta26ScJ41HyOIe7ZGiEE12v7
 lTiApvD1w9E+xQvx+f42dzXT9yIsT4HLVN+Y3JZWwvDRWBvaeYYrJkiHN
 S0aTgMYpK3x24vrz4nZy2sjUVXRKcdcxHzBmC1Se6iYzTsL9l527k45tT
 mj5QhqmJytqfrpMYhGivCUsxVBZNRte1odVeLac23/12xVO0MMKjS+LXv
 jsEijxovL5Q0fvbYUVteCrqEdsbwt/X+MotGt56mamJnocdlsYimHO1Xn
 xXH58lnNjqhoRK1YiM6vHDkPZyZRtEOFXB6Jf4OibRdxaCM2DNNhLok8k Q==;
X-CSE-ConnectionGUID: 5mWhZDZZRIeMkUtQxMvHdw==
X-CSE-MsgGUID: 8lVvdk78SiC/JLEMJlPrBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="71582433"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="71582433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:17:06 -0800
X-CSE-ConnectionGUID: avYDKpUKR4WIFnXxskl3Fw==
X-CSE-MsgGUID: PGJkAiytQBa+GIjPTy6ApA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="218359841"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:17:05 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 01:17:05 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 01:17:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 01:17:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnVKH1JX9doYpuMURo0vpU6A+FKDx9m5lHnlH+NxgYo5mZgh1e95Q3OxrnMQLibtk8dYFZoW+6OK2MRCDRsQwPM7JMVXp3UuhqgIniqWG5CLJeVDktoJZwJz1bgDzfZHxCwNaHuqRWbnjrAjVp+L20an4I4uwd922/i9y31rpJsDcTgBCpODno7ob5XTJj5raVb/cW5kwkBBQ+Sd1Cbh2Ka9c3+neuy34Te+9SaMvpSNGd/NFXsWFydHkD0SUP8GMzIEM/RBGOw13WmmsrYeAXFcuRKM4jNLTB0B9AlqzAOo8T1ssG21Yw47WS2RzlGHE+0On49rak2fJBDDQARoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPsxPWgdkU+4gGtIRGSAFn81+UTg1hst9k41rl5PRnY=;
 b=Jzwr8HNtW6BsNOAvTTlbEh+3ajoFl7k2BgmDomP6OVZMLYy711eJK1w6+wv/6riUZn2hhUCkKhdBmZDjCrJFmWvUBgQhYoxu2w93CErDMGi34YqUx8MiBZZuc2TwcwWCxZyZ/vfkRisblnlRM0pQZprX0betIWgdtURjgW2C9KIDSfqPr66n2yaoN6Ej3cCKGjJLWS6bMKeYEOVpXL6dD/EwikJo5s2ywx8zx/cwGIqUJy0HF6UyizpUERk2+KjW6B9jWGO0Nr9dYzQuCgitHYK7OSnQvnzZIdQkx0nb/y/GKQ0pP/x7t82FttAMANPOAgEKO7/DhXceEEkIWEDPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CO1PR11MB5170.namprd11.prod.outlook.com (2603:10b6:303:91::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 09:17:03 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::45f:5907:efdb:cb5b%3]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 09:17:03 +0000
Message-ID: <e3e3b04a-6236-4906-b0f0-1377c5e8097d@intel.com>
Date: Tue, 17 Feb 2026 14:46:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/kms_color_pipeline: collect reference CRC
 once per pipe
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
 <20260202060415.2680288-4-chaitanya.kumar.borah@intel.com>
 <50051edf-337c-4cf4-9d2f-4bea28b5477b@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <50051edf-337c-4cf4-9d2f-4bea28b5477b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::15) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CO1PR11MB5170:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9ca140-35bd-49ea-c957-08de6e054fc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2FCWitsUjRSOSsxV0xtREYzd1U3ckc0OTF2aGJiOUxQWDlLR2R4Y2FPd0hC?=
 =?utf-8?B?blFQdHR3TDExbUlQMk1GWDZMSEJudzA5R09PdVlYd0FrWW02MlNCSXlOUERD?=
 =?utf-8?B?V2dkUnNXRUtmYzlObzgwdFI3amFSTW1TVGFPeUtQVEo3RXRXSmhvZHBmUUUy?=
 =?utf-8?B?Y2Q4bWF4YXFFUUtQUk9qRHN5S1pFbTZmN2d0ZTk5WmZjc3RtMTF0VmJkcHY2?=
 =?utf-8?B?Z2laRlYxRGdieGQ1NnE0SnA4eWVYOGZ4QUFrL2J4eUM3MEdrZkFjYm81UjNH?=
 =?utf-8?B?dmZjQ0Y0WEtpUDlTUmR5c0wvdEVlRTZ6YmxLcHVlRU14bEVFTisrRUs2MVZB?=
 =?utf-8?B?NmxhTVRZa2JmUjlxY3FnaU5qVGgyZXd2V3UxVERZRVhQSHIxODJZWVR3RzBy?=
 =?utf-8?B?TXNYVUR4WGRKajQ5R1AvSXJjazROK054YnJ4d2ZIbXRERG12VlhpMDM1bDd1?=
 =?utf-8?B?NHU5dW1DaFA3R0JKckJSNVQ3MFRPaHRsUXBBZWo2TUR3UzIra2tkNU9SeDAy?=
 =?utf-8?B?aGdnRnphVi8vdW9WNVpKMHZsRDZrU3RnMGR2TDhoQlJuVFZLL3NXaHdFR1FT?=
 =?utf-8?B?c29JTVZ4ZFlVODlaRTdCZzJQaGJMU2FVdzBOaFdwS2xraFRDZzkwd3hpWDk2?=
 =?utf-8?B?RGpzdUlYZ2Q4aW8rdWNWNDRyUHNtZGsvRnVCazZiUEhXTjFVR1hMMXhIcnBx?=
 =?utf-8?B?WFVqMnJEK3dhN2VjYkdYVTZjN1hwWGZRLytNYmFsK2VjSXVnK1VOK2VhaWFG?=
 =?utf-8?B?OTRGU0xKaWtSV0JYbjZWR0EwWmZWZmhrMHlKcjQ1TVlpcXdiOTNIbFdvWk1w?=
 =?utf-8?B?S1NGd3lXYlJPbVBlaEN0Rm9CYnN5emlwRjQ1amlLcG9wenNPWHlWaGlHMVdH?=
 =?utf-8?B?YXpQM1d3TkRJVWsxVVpkQXROQ0J3aTFjYTJqa0dEbjVwamdlcnBYUzI5bjRG?=
 =?utf-8?B?NHdiK0tqR2FHMXRLZExJbG5sek00YTJiTFdQcHgxSk9tMmhWdnlTNVAzZURT?=
 =?utf-8?B?OVlUc3FiQzBuVHFRSVNtUmpYNTJnNEhjN3ZUN2ZNazNuNFdXdkxSRGJuNFpD?=
 =?utf-8?B?ZVU3ZmQyQ0tOSCtwU1c3b0s3ZjlpVW9xNE9IaHhzVjBmNjhzVFIwWS9DeFZm?=
 =?utf-8?B?TXBCVS9iSkh1UG9FdmhEenFlQVRIZmJwS1BORTNQek9oNzFyL0RORGNxK3Ba?=
 =?utf-8?B?cEVNd1ZoQ3p6SmlhUGRiZFNOZ2EzNWxVaGRka3djY280WGR1T2lVbUU4Z3VX?=
 =?utf-8?B?TWgwM21kR2ZBOHB3MlA3RjR3UjY3TGRLOHhnUUNKZHlXSjdIRFFFUGhYRmxw?=
 =?utf-8?B?UDRJTk9rUFhEQVp1VGRFTkNYODhJeHFJN1Rwdzl3cExEQmJKSyttOTNLeGFx?=
 =?utf-8?B?Uk5qMks4dk9Kc2xnY2QzMTgrZkpuU2kyek9uVU93SUdZeWpWZVQvOHBKdisr?=
 =?utf-8?B?UURsK21zTUlId3FVeGMwSk1jWDBYRk9jU21LT0luN2JkTFYwYk5QYUNyWEp0?=
 =?utf-8?B?RFRjdmNoc1pZSDZZdm9YYTNQTHp0UWJCNmd1Tm5sQkJLL1lIc3Y1Z2pMMTVT?=
 =?utf-8?B?UWR2d1BlYXFSckxFQlkvZ0RxdnMvMFJ5cmRPUGx2SHJ6c3Z0Mk1YdGowMTh1?=
 =?utf-8?B?RFMrdThFSHMzem1UYVFCNVg0NVQwSWpIZGZlNStuUjFOcjRwTFJSVkd2MWxS?=
 =?utf-8?B?THdCeUxlWjV4NXFWZUhNZTdWTHlLTlEwWmhUYmJJOTZoanVCUXQ0bFZzMmcx?=
 =?utf-8?B?bE5saG9FdlhjUWhYZ0ltVDQxTWwwNE4zblpFblF2c1VYQmRqenRZR3Q5bHZy?=
 =?utf-8?B?YXRBOUhOQ3JjQ1h4aGFxcWRMVXBEd0o5TUxZRFRyekVCeTBmWVZWK2Q1ajVo?=
 =?utf-8?B?TklGYUtiSE40MjFtYW1vdnBxenduQm5OdWhaMUE1NWZLUjhYMWhOcEhFd3Az?=
 =?utf-8?B?MHVqZDhxZHpmdDQxMkhoWldGaWRMbjdBME1VM1dOV3RWejRTRTlWOEl4UU1O?=
 =?utf-8?B?M20zUUR3ZDR6cWh5V1lFVFhDbFJmTjJOUExxTG9XWUFjSlZyU281elFXY1Rw?=
 =?utf-8?B?cGVleUJzVE1pZXh4V2QySTVWRlBJZXM4NDRyWHhjdE1KVU5QTjR2aDZUMTlk?=
 =?utf-8?Q?vgsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjZvTXZWM3FyQy9URWtuL3FWUWdrQjMvbjNsVWtmYit3azZLYWMwdXFEdnZS?=
 =?utf-8?B?RnZ1aGlSZnVFaXRYYXRQdWc4WnRQN29Jc2E5M1ZTbEtIOGRzT1FNdlE5Mk1I?=
 =?utf-8?B?Slo0UER0em40dVV4a1FLZXlNbmZyZk53WXBGUlF5S2tDdHZtV1BYcjRMNzJQ?=
 =?utf-8?B?MjZUTHl6eEN6d3pQOVBKWFNGcDI3T25ucEhBWEZWMmx5SG5aSmtmZWQrZk94?=
 =?utf-8?B?VGllWWdFOGpMRElxOVVPR2tDWkNYMU8wUzdPU1Z1Ryt5empzejUrb2Q5WHdt?=
 =?utf-8?B?bXJDYkk4VHcyYVFuaHFmYlZWOEJycFNxMjhyNDZsalo4N0lVNnRLR3JXMDg5?=
 =?utf-8?B?VjNZSzU2RDNENHA3Q2JyWTd6TjJzMENSenJqczZjb1VUUkJrWGFpaGdNUWw1?=
 =?utf-8?B?RldZNUhPREIySjhOYnNoYnMwVVR3czhOTEV0M0JGTzlNaWlhODVpV05iMlNH?=
 =?utf-8?B?UHJWdFd0SXp4MUNGWUErZmwyQ2FVdXRSSEdYa2VhRC9SNGFPMTdkN3Jka3gw?=
 =?utf-8?B?YXVVeU1BYXppTkFwM3lPZXNKaDYwWUZqVDhuSGE3dVlIem54MlBKdm9TZU5Q?=
 =?utf-8?B?RDZkclhnR3I0d1pYRVVjYTdLa0xGSURJSU00Mm1nbjZXMUN0VTJRRXRhbkI5?=
 =?utf-8?B?TDVNeUdyUk54bmxOeGU2dy8yU2Y1aFA2OERLazVwTXRpR0tQU0hKQmRCekdp?=
 =?utf-8?B?MHNKbzAwTkFRTFlyVmdKYXdVUE9PZW8zYmtKU01xK21LZ1JLUjMwNDlVVEFP?=
 =?utf-8?B?R283L2NiQlIwcmNKSlBxODNaYlVvZ3RKSTZuK2RRTlpWRnI4WXE0QzA2OStu?=
 =?utf-8?B?S1JyVXVvekpkZjhxU3ZuVVpaMmlQTnJzREJQbjZCaUg4a3V6cFlud2lwa1Nu?=
 =?utf-8?B?dFh0MmV6ZGRNL1dOTytLT091azE2Uk5ML2dDK1VlUVJsZ1FpYnZWaWpSS1JV?=
 =?utf-8?B?Ry9yeEtxaG0rZDhzVFVkeE1sUUorWWptUmc3ekpFNk53eldjVk5JQmJLb1Yx?=
 =?utf-8?B?Vjl6TDljRDdySGJHNGVaNFhwRTNGbk9jWWpXVzY4ejdzUVFvSWhMS1ZEVkwv?=
 =?utf-8?B?aEtqS2dyWSswUkFWWDZXcVQxS0hXWlUvT01rYmtFMzh4Z1YrRjM3Y0RoMFhj?=
 =?utf-8?B?azBxUmdVL21WaVJkTHJnK0dJdzVia01XOVo5NTZmcHVaM0ZxZzdSUjJKaC85?=
 =?utf-8?B?REZxUXk5MUduWURxYkpUOUFaWHRJYS9PdkRPdUZPTjd4ZlZYRG9QOWFMY3NL?=
 =?utf-8?B?djlpZVl4L2FBT1NEdEoyL3BzRTVqdndiK2hZWjNYS092TFc4UGtCTzFSdWFJ?=
 =?utf-8?B?YlRIV3BjTGd4UkJlY2Y4ald2Q0pxZlJuN2tNSFBBSUw0WlVMT1dWOUNycnpN?=
 =?utf-8?B?cVVGTnM2ZkRpMFY4ZlVVaVNYR2xNSXlQdDJoS2Y0cE9SdkZEUzFMSjlLNWFp?=
 =?utf-8?B?b3Y1YnVpNitGRnVzbk1EMzIzNEpCKzNyTys4b1pCWEYwOVErN2w0TWNFMFc2?=
 =?utf-8?B?K2RJUTBFWUhGS0NsSGYxN1lWSHB3enVSMFhBUHo2akZGRlV3TzlRRm14NFNo?=
 =?utf-8?B?S2E4dmdmaUxOMDZVT1A5bWdmaTFMOFAzalhreUNRR0ZQT2xjVWRvWk5ySnBS?=
 =?utf-8?B?a0J4eTl6UGxkajZsZlVneGE3QzdJS25taGtqdzIvUmJjSndKdUQ0ZURLTkha?=
 =?utf-8?B?d0ZQbWowQzJrWmphSzB2clZ2bnlaa1NCdUJvMURlbDJvZnU5VEJiMzFmcElm?=
 =?utf-8?B?NkFnS3FKMXdvYmlkaGFtcldPeG1sS3NmM294LzBqR0VtT1FKZHZ0TkN2Witw?=
 =?utf-8?B?aFVKSUJWTmVHYkxQTC9pcEhtUjFPTlhsZGdReVdQMTBCc3dkbzE5Ky9KUXI2?=
 =?utf-8?B?QmhiWXNNemlIcTBnQmU3RFMwblU3dHQ5anY4MTEwSnJYL0xNeHIraHdZaHBz?=
 =?utf-8?B?cTd0Qnk4Z1hNZHBTdHFESEg3aGZXVEtiNmhPNTlvWGgwNmdQbFcwYWNCQ2dV?=
 =?utf-8?B?cUxNUnRJaVpDdHpIamx0ckEwekZ2dHREaXI1Z2dEM0IvNEEwTXpROUlJNmty?=
 =?utf-8?B?aVA1QjQ0SzAyV1RxWm9iSDRxOXgxc29scnVDQ2Q1Y0ZsVmR3THJIWm1ldWdB?=
 =?utf-8?B?ZkF4a2dZNUwyNkkyUzdwZFF0VVdodnJteURiM0MrWFhLNVJLOTZPM0dKM0Yz?=
 =?utf-8?B?KzV2cUVyQldsZlFhWkk3SVN1L1lxZ1I1bFhSZWRBVzUxZ0VMOHZ5NFR0a25v?=
 =?utf-8?B?RFp6Z2FYL0RrTStvc3B0bFBGam0wcmNmRTl1UmlTWFZxb3A5MzczSzE5QXYy?=
 =?utf-8?B?dmk3ZW10dXljNlhYNEFrZVNUYUcrUFVWcmNQZzVGKzdEQUxsVDNtZFE0Y1dH?=
 =?utf-8?Q?/QoSlXYLk8pXmyBg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9ca140-35bd-49ea-c957-08de6e054fc2
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:17:02.8414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dmd3QXMGUwNgiXXLYifEHUP8SLjfmQD/d4JDXUdzuQLHGkcOxqVAuNFn/2x5ZB+Shr2txydNbj+HRoXgzMpeU2kpoCxkY0cfp7/T+LsB5F0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5170
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



On 2/17/2026 2:18 AM, Sharma, Swati2 wrote:
> Hi Chaitanya
> 
> On 02-02-2026 11:34 am, Chaitanya Kumar Borah wrote:
>> The reference (software-equivalent) CRC was being recomputed
> s/was/is
>> for every plane even though it is identical across planes for
>> a given test configuration. Refactor the test to collect the
>> reference CRC once per pipe and reuse it for all planes.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> ---
>>   tests/kms_color_pipeline.c | 60 ++++++++++++++++++++++++++++----------
>>   1 file changed, 44 insertions(+), 16 deletions(-)
>>
>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>> index e15f4d79a..8cc055591 100644
>> --- a/tests/kms_color_pipeline.c
>> +++ b/tests/kms_color_pipeline.c
>> @@ -88,16 +88,52 @@ static bool ctm_colorop_only(kms_colorop_t 
>> *colorops[])
>>       return true;
>>   }
>> +static void
>> +test_grab_crc(data_t *data, igt_output_t *output,
>> +          const color_t *fb_color, igt_crc_t *crc /* out */)
> Function to be renamed to capture_ref_crc() ?
> 

Sure, I took some inspiration from igt@kms_plane but capture_ref_crc() 
sounds better.

> Also, shall we add some comment stating why we are capturing CRC of 
> primary plane as ref and not current plane?

Will adding it to commit message do?

> 
>> +{
>> +    struct igt_fb fb;
>> +    drmModeModeInfo *mode;
>> +    igt_plane_t *primary;
>> +    char *crc_str;
>> +    int ret;
>> +
>> +    primary = igt_output_get_plane(output, 0);
> Instead of 0, use DRM_PLANE_TYPE_PRIMARY
>> +
>> +    mode = igt_output_get_mode(output);
>> +    igt_assert_fd(igt_create_fb(data->drm_fd,
>> +                    mode->hdisplay, mode->vdisplay,
>> +                    DRM_FORMAT_XRGB8888,
>> +                    DRM_FORMAT_MOD_LINEAR,
>> +                    &fb));
>> +
>> +    paint_rectangles(data, mode, fb_color, &fb);
>> +    igt_plane_set_fb(primary, &fb);
>> +    ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
>> +    igt_skip_on(ret != 0);
> Shouldn't we have assert here instead?

I was just following the existing test_grab_crc in kms_plane but we can 
use an assert too.

>> +
>> +    igt_pipe_crc_collect_crc(data->pipe_crc, crc);
> Initially before collecting CRC, we were waiting for vblank, shouldn't 
> we add same?
>> +
>> +    igt_plane_set_fb(primary, NULL);
>> +    igt_display_commit_atomic(&data->display, 0, NULL);
>> +
>> +    igt_remove_fb(data->drm_fd, &fb);
>> +
>> +    crc_str = igt_crc_to_string(crc);
>> +    igt_debug("CRC for reference fb: %s\n", crc_str);
>> +    free(crc_str);
>> +}
>> +
>>   static void _test_plane_colorops(data_t *data, enum pipe pipe,
>>                    igt_plane_t *plane,
>>                    const color_t *fb_colors,
>> -                 const color_t *exp_colors,
>> +                 igt_crc_t *crc_ref,
>>                    kms_colorop_t *colorops[])
>>   {
>>       igt_display_t *display = &data->display;
>>       drmModeModeInfo *mode = data->mode;
>>       igt_colorop_t *color_pipeline;
>> -    igt_crc_t crc_ref, crc_pipe;
>> +    igt_crc_t crc_pipe;
>>       struct igt_fb fb;
>>       color_pipeline = get_color_pipeline(display, plane, colorops);
>> @@ -110,18 +146,6 @@ static void _test_plane_colorops(data_t *data, 
>> enum pipe pipe,
>>                    DRM_FORMAT_XRGB8888,
>>                    DRM_FORMAT_MOD_LINEAR,
>>                    &fb));
>> -    igt_plane_set_fb(plane, &fb);
>> -
>> -    igt_display_commit_atomic(&data->display, 0, NULL);
>> -
>> -    /* Reference (software-equivalent) CRC */
>> -    set_color_pipeline_bypass(plane);
>> -    paint_rectangles(data, mode, exp_colors, &fb);
>> -
>> -    igt_plane_set_fb(plane, &fb);
>> -    igt_display_commit_atomic(&data->display, 0, NULL);
>> -    igt_wait_for_vblank(plane->crtc);
>> -    igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
>>       /* Hardware pipeline CRC */
>>       set_color_pipeline(display, plane, colorops, color_pipeline);
>> @@ -139,7 +163,7 @@ static void _test_plane_colorops(data_t *data, 
>> enum pipe pipe,
>>       igt_wait_for_vblank(plane->crtc);
>>       igt_pipe_crc_collect_crc(data->pipe_crc, &crc_pipe);
>> -    igt_assert_crc_equal(&crc_ref, &crc_pipe);
>> +    igt_assert_crc_equal(crc_ref, &crc_pipe);
>>       /* Cleanup per-test state */
>>       set_color_pipeline_bypass(plane);
>> @@ -158,6 +182,9 @@ static void test_plane_colorops(data_t *data, enum 
>> pipe pipe,
>>       int n_planes = igt_crtc_for_pipe(&data->display, pipe)->n_planes;
>>       igt_output_t *output = data->output;
>>       igt_plane_t *plane;
>> +    igt_crc_t reference_crc;
> Can we make this as ref_crc?

Sure.

==
Chaitanya

>> +
>> +    test_grab_crc(data, output, exp_colors, &reference_crc);
>>       for (int plane_id = 0; plane_id < n_planes; plane_id++) {
>>           plane = igt_output_get_plane(output, plane_id);
>> @@ -166,7 +193,8 @@ static void test_plane_colorops(data_t *data, enum 
>> pipe pipe,
>>               continue;
>>           igt_dynamic_f("pipe-%s-plane-%u", kmstest_pipe_name(pipe), 
>> plane_id)
>> -            _test_plane_colorops(data, pipe, plane, fb_colors, 
>> exp_colors, colorops);
>> +            _test_plane_colorops(data, pipe, plane, fb_colors,
>> +                         &reference_crc, colorops);
>>       }
>>   }

