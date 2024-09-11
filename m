Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB95EE0214
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 08:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C7210E8DD;
	Wed, 11 Sep 2024 08:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AnmDN8g8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E9F910E8DD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726042373; x=1757578373;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lcBIUr0I6tKdfvwoBqORl3UDHa72u/R1QjX4x55+rIs=;
 b=AnmDN8g8xlhXxeYobDJAa1SQsTdopzxp30I+ozTcCzrTh0cNXcS116R9
 f45G3OfNcPHIyEMJN3QpmDnTM3iclYaWuqbTX99YZZNs8zy7btH+pMwhI
 ZpCuEZ1zfycxpPX5URfnuB9B6ASqfEz3Z8nX6n04C5wWkS96KdFV8Lhqv
 MsiknrfzrVQ+2CApALXPFgGSVewjGcD2TPNrN9lAcd3rYPopekMkNKPRU
 O3i9I14qb3jY4qdQ06o6WZnVx7xjSRX0YA4O/5PvXyqdWh4kEE5XNogav
 7Adl1SD0K71qKLKYDDS8vPajr5zm+K9p5AwO9ly4sKrYiMAX/OINCB3yf Q==;
X-CSE-ConnectionGUID: a7psVUpARLedPSTkfegtQA==
X-CSE-MsgGUID: i8n/orx+Q0mPxUilKM+rPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24322642"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24322642"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 01:12:51 -0700
X-CSE-ConnectionGUID: Adk/g4ltRdCpOOdRBW+JCg==
X-CSE-MsgGUID: 0E8c/WszScSqN9t8zLpd0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="97992571"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 01:12:51 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 01:12:50 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 01:12:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 01:12:50 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 01:12:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0SzUJktjEiZjNvFNN2W5gYsDsJy3k/5qGf9DPBU+EEV8+cAKwBzGIpYeyCgpzpjbVX1dEJeO5XA9QvDo7tVNo5PCo8C/6Rw7ydlmmw634BNPZ81O3yXxlZY3AD/eOYBwnhdi/k+HaNWSw7CGVHtkltwRPeKygIvY4cSkqhpNmR3RHHYE6TLgtlJpAWrAlJw0uNSMqbII5/xZ2LSf/gZVfTzvdHBFYdjMlPBspmC5RW4l2vzF38uWkuC+xBk+TBMC9spNBOerTXzc2T9MNiVB6z0IY7XpK2dl4lHjXOyywhJSmbseVN+7An6z8Hfbqw3gEkzJs8PqZ+vrgHR/W2+nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gj1cr+gC/htiCOBvjaX11XVwox0qbs22EHSqmhYjzyk=;
 b=XaUz+L15zHyBwhsWnguPIy3GQ5h+Zlop+ViadiVGm7G2gpDWC5FswO4/ZnJX8upPmvA3tBooJRwAOg6WiLxN7Isf58zIvvBBBIU4yHcOBwUl0z2YAvB93M4EhmuHGxFenCwiLldWdOYsPBnNFoHi4UFof23m2DYAdM5yPmu83if27dRHNIfOZPWCzAESbYvDMjdPByHgxVWurULhmKnpy/9T1GEEIwjC2LniucEsWmqH/trU9LjIhoOkvmW1N+P4abBxD1DED9OKCoorn1n4FCuc8U/KnxLT4Thvam146nUTI9EcQ3ueyTnm5XrJRIF1KL2CWnwySg/d2NYPE0Vy8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by DS7PR11MB7929.namprd11.prod.outlook.com (2603:10b6:8:e5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Wed, 11 Sep 2024 08:12:46 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 08:12:46 +0000
Message-ID: <7b01eba3-5f55-40f7-8fa0-248a0e3085f4@intel.com>
Date: Wed, 11 Sep 2024 13:42:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 2/2] Revert "lib/igt_psr: Fix PR state check for
 DisplayPort connectors"
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240911075745.635978-1-bhanuprakash.modem@intel.com>
 <20240911075745.635978-2-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
In-Reply-To: <20240911075745.635978-2-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::15) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|DS7PR11MB7929:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff3688a-1ed7-4f5f-b4e1-08dcd23984aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXNVNHZWZmNmdlR5VFR4ZTJaZmY0RTJsU3lDQ1U2bS9GRWlUR29jSVRhdDVi?=
 =?utf-8?B?Nlo0RmNMTWlEOWlkdlVCai9ucFVRNjVVL2g4dnRId2ZBN3NadkhpVkhNUHpT?=
 =?utf-8?B?Rjc2L3RtSElBTUcvaG1hZlgvL21lekRmeHZPbER3R1FvVjdDN25nZGswQ3Ju?=
 =?utf-8?B?Vk52K29MczRhNEhZeXM2STFhcE4zVjVSVmEydDFtdFdZWm9KcTIrbm5CRlFD?=
 =?utf-8?B?RnQzbFFnZm5CZDBlZ3krUWFTSFdhdjR6a01jQlVyVFI4UVBPRXpLdnlRVkFk?=
 =?utf-8?B?QWg4My84aE9OYURQYTNhd2xxMWZXUFdnN01KYmVudkpsQUwrM0U5ejlBYjZp?=
 =?utf-8?B?ODYwUnBCYUttdE1PVWNBc2Y5UW9uR3pqZ3FxeDZDSCtKVFJySFpTZGptMkdE?=
 =?utf-8?B?KzNpTFZ4cmpmZ0w3RXBnVDdvRjlXV21qczZBMWY1WGxCQWpueXhnaldyYTcz?=
 =?utf-8?B?T0twU1Q1U1pET0hqZ2Fic0NUVC9DWTZtckYzTDVNdE1ibkZHUXB6SzFxQWNs?=
 =?utf-8?B?VWx2dzNyOUljd0x1NFNlUkxYV2I4N3JnVFJ4WmltM2FWckhhS0VyWlllTlZV?=
 =?utf-8?B?RGVIMkVJL3Q2MFp2ZjdtN2ZBOEEvVzJJNUxWYUVsT1ZQZklOMEFjKzAzTjZu?=
 =?utf-8?B?azJxQ1pYUCtUTFFNQzlBSC9neFZjaUVwM21IUlNFc2N3Z0loRHpZM2hHYk9C?=
 =?utf-8?B?d3cwSHVJaGN2K2hxT0JVMkMwUmpnZzE0OHE0dll6b2dQWFFOQm1vTmNoeitF?=
 =?utf-8?B?STBXcllmb3VXd09zMEFrVGRFeElDOHQ4U2cyaHVFNEI1ZHplaFIwVXRiZGZK?=
 =?utf-8?B?UjZwWno1WDlITnQwb2UrcVlhcWV2WDB5MXlLL2t1eGhRSXRIV3plMWZEa2RH?=
 =?utf-8?B?dlJlL0JmclpWQ2V0b1pxSUdEMk1yZGxqaDFLUzJweVBRQjFlcDV5RXV6dDgx?=
 =?utf-8?B?ZkhuR0lWcU96dTI2L2dwejRTNkNNOHh6VGk0RW93UXVvTkdxdG5keE1iMWww?=
 =?utf-8?B?T3NmemN2eTNUbnBicDM1WWhTQ1lTVVFpck5vOWZCZ1BMcWF1S2I4SXczR0ZE?=
 =?utf-8?B?SjRZZ2dLU1pPSlM3RXpqd0kwR2RsYXh6K2Jtdi9ta3hZZy8xRDRLNlRpOEpP?=
 =?utf-8?B?cUtFQUNlSzlzT3M5RDFhaHNzazJsbHMvcENPUU52TUZjMUNpNG1aNFZDWVAz?=
 =?utf-8?B?RVg0RTdqWjJNcGw4cXVjR21ObkplSkVKMkhNTnZuOWpucmZJU3gwVTdmSE1G?=
 =?utf-8?B?V2FBVVc0enNIZUQ2TnhodFBwbVlpZDUyUVl3N1lVUWxnQ1RCdE5ObHFOMlZs?=
 =?utf-8?B?WTFJYWZIWXZMUDZLU0liM2xiUVY4ZFc1RlVUbXQ1UDJUNGZIdVdFcFhQbW1l?=
 =?utf-8?B?bkRSMnFwVnJ3ejJianhrMHREdWJ1VDM1eGRMT3YrZFF4dHdQckExNTZ4aWdv?=
 =?utf-8?B?UnJ4K01xanFVK21jNGZHQjM3bmNUOURBL09hakdLSEN4ZHZhelF2SVN6UW40?=
 =?utf-8?B?bWd1cjJIRVZDZDVFT1dMdlFtdDBJM01RY3lKVHVoS1g0YU82ajlZVkthYkRz?=
 =?utf-8?B?WEM0QTQrb1EwZGhlTThKcmpkZ3BqQ1VkdlBQWGw0L0hSNG5HNHJaUDcwNzQw?=
 =?utf-8?B?VlRsNi9WU2h1bExiWlRrNTB1N0t4RW5vK1ZEUlFUK000ZURYalcwajFJMVRx?=
 =?utf-8?B?ZFNpNjBRbGFTK2FjZ1RxWjhQN1lPNnNRdlQ0UkswTEgvS205LzlGdFJNTmty?=
 =?utf-8?Q?QBKRP6IQdJuZ8FbM4s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTgxd3hOYjNuVlczUnducHA1anp5VmtSZi9CWlowSVpGYUI0a0orQzVseEdD?=
 =?utf-8?B?VzlmVnlOVjJ3bDlueG1oQmk3NjNyd0YvTGl2azdTOGQ0cHppWW95ZkdZWm1D?=
 =?utf-8?B?eUlQNHcrVFpQajlPTzdiUms4VGlRRGxoTTFaSEdaQll1c2trQkE1Vi9MWnNk?=
 =?utf-8?B?MXpwdEN6TlQvakFBMVBaVzh4NzltbVo0Y1M3VWpsZUxhOFdwOCtPZWZ1L3BE?=
 =?utf-8?B?UVhSei83SmR5Um5DZjh4YWpUOUkyVG9jVndLL285djYyVHMwYTY0bVFhdUFp?=
 =?utf-8?B?SnFMbmlrc0JkK0RVMkNUOHA2ZlN1WUF3N1Y4aHNXeVYyNVBxR253QW4wTGRk?=
 =?utf-8?B?b0R4Y201UTQyZ1E3Y3ZySGJZTTE4cG5Od1kyODlqY1A0bjBNVlZocHZhSnVW?=
 =?utf-8?B?NzB2TXdLUmFQdndMSk0xN1J0cHA0M0duM2krd2ZKN0gzV2tXQjV6eFp0a05P?=
 =?utf-8?B?UlB0Vi9sQWF0ZC9tMFJiRythRE5UZUtLMytqZ2MvN05GS2lXK1poVXBlVzd4?=
 =?utf-8?B?VlR4UzdYTlZYejRaMEVZbWZrcG9LNTIwMnVNOEpTc3BPQ3A3dG4zWG5SclhC?=
 =?utf-8?B?VUd0cy9tSGEzaUhhUHhlekpLeEtDa2x0MkovOXpNU0dXNEdpOHhxRGI4M093?=
 =?utf-8?B?cFhDNWFsakFmeTVtNVlLUFBrK1BOOGljWklFLzVXSGRVYTBPL3FxWHhvMFI2?=
 =?utf-8?B?aXZCTmRLRXI3cFZNLzZBVUhQNDJCOXFMeE9PeHFkS1luQTFZUk4xeTNub1hS?=
 =?utf-8?B?d2x5ZTRrMWsxV243ZWhHbE51MEUyNkpFZ25ZaGo3WGR2MlB4ZFA0dC90YWph?=
 =?utf-8?B?R2JZcEFWeTdxTzFaR3VyWllIUkJtWDE0S1JHM0hIRkxDS0pWbmtBbkI2emp2?=
 =?utf-8?B?WFViaE9tQWtXbHpYVWJ3QitEaFp1a3VldVhUNG5MWUtaYmIvWnB4RmJHWFk1?=
 =?utf-8?B?dnBLYXhRUG44eklNNEJhaC9iZllOdzF0czBsemNpaXdoZk9nUXVMVlBRV3lG?=
 =?utf-8?B?SFVmQ280T0dKeEFZVWpSTGRLWjhyTnRCVEVGM1lVOUhTZ254SFYwT0Z3ZW5G?=
 =?utf-8?B?WDdYK1U5YTBPQkNjRVJ5YW1NcVhiajhYRVNNaVdMWFFyY0YxV1VuaHlLclJF?=
 =?utf-8?B?dnhEQ0pzM3FmSWhzWUZLU1B6VW1Pa1duZ2o5d1JsMzRnQ2JHMUZscDJ0clAr?=
 =?utf-8?B?SkZKd0lqL3IyMldFWGd5MFVvblBVV0tobGRmR2VnUGZQTjl5bDFUV3BscEQ1?=
 =?utf-8?B?bWE3Q05FYzBIMDRrbEpRZ3RzSk5DQnZ0RHV6Rms4QTFqZzl6dCszNzduY1NR?=
 =?utf-8?B?TEhyY0wwV1BWamdZOURnOTBaazM2VXJDWk1aYkFPaGhQMnN1WW1NUCt0OXFI?=
 =?utf-8?B?N3lKb3EvbmJrbHptczlPSDFhV2RJaER5RUc2aWlOaXA1UWlFbUZZVWFQUk4v?=
 =?utf-8?B?WDQ4V1A2L0M4VGQweWIwZExUb0NBd05HMHZrblY5NExNRkp5cEEyV29hVU4v?=
 =?utf-8?B?NTk4V0dvNzhGRDhHeGRya1BGSVo5RXZzOXpxWEw3NStWczd5ZFZHZkJPdk9l?=
 =?utf-8?B?dldCVUxHM0xYZS9jS2VUU0lIVENWbTN6eFFvVDJCYUFJZFF0Tk5vN25aUmJO?=
 =?utf-8?B?QU5CT3RXbjNHMDJLSHlxZ0VrT1o1R2p1ODBRN2oxYURVb0ZkZzRlWFNKZmxJ?=
 =?utf-8?B?c20zNU9HVXc1b3JDRDZWZC9vR2JjL090T2FtSHlVeUt0S1lJc3d5WDlyWVJB?=
 =?utf-8?B?c09SYXo0OC9LZDNNbStDK00xeDVkK0dIOUloSHc4MGk4TU9xM040NGRxK0g1?=
 =?utf-8?B?WXJwYjdnVU44ZzNYOFY2b3hCZmJGeU5sRzNhQWNoT0trR1pEWjRHOXg4OUF6?=
 =?utf-8?B?VHJCUkZxd1FVaE4zcnkzSjkxUEFzM29Tc0RQS2RpUHlQUUNOUm5jUXZHUExD?=
 =?utf-8?B?RThFRXhkU05PdWg2cEwydkgwNUVoQk1qcmcyYnFYV0ZLTUJvbGJwV09kSm8r?=
 =?utf-8?B?SGdDSjdZOGxMTVJlVlhua090R1hIWHd5NFdNWGl4a1lhQWJRVnl6NEUxNDBI?=
 =?utf-8?B?N3dvcFlCaFdiRmhlNzJUZDZmS2FBa2J1Tll3OXA0VXFsbG5BU1ZpL01rUEdD?=
 =?utf-8?B?VlR3SDVNa0ZhMXlJQTNlYjZNZ0s1UUpqcElYaktqZ1ZFcjh5QXQ5N28zYzRO?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff3688a-1ed7-4f5f-b4e1-08dcd23984aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 08:12:46.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lhs5pTBscjLWjNCCzG/BlRCcU5rbybDI1WxO+XS58bu1vRFbY8UHLTCSM1BkxJtmkdmn1oDUI788kXDK9jV3XxBs0H+m9md2X9IdiUYsgzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7929
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

Acked-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

On 9/11/2024 1:27 PM, Bhanuprakash Modem wrote:
> Causing regression in CI BAT.
> 
> This reverts commit 196c2cc9c945a66bb542fdefcf491ea62c1f885e.
> 
> Issue: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2748
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_psr.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 4e44f44e6..e3e7577eb 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -79,9 +79,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
>   		c = output->config.connector;
>   	}
>   
> -	if (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
> -		state = "SRDENT_ON";
> -	else if (mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
> +	if ((mode == PR_MODE || mode == PR_MODE_SEL_FETCH) &&
> +	    c && c->connector_type == DRM_MODE_CONNECTOR_eDP)
>   		state = "SLEEP";
>   	else if (mode == PSR_MODE_1 || mode == PR_MODE || mode == PR_MODE_SEL_FETCH)
>   		state = "SRDENT";

