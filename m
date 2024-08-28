Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80C8C636EE
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 18:04:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954C489FD4;
	Wed, 28 Aug 2024 18:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAqJrrSC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A5989FD4
 for <IGT-Dev@lists.freedesktop.org>; Wed, 28 Aug 2024 18:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724868253; x=1756404253;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VIypgdwNwP0OfMZ/WUx0+fyoWJNrmiZy/JHWOkopwWk=;
 b=NAqJrrSCjRQxReRRIYMTF+G9fS/brm6xxiK0LVuyd11ubrHhj1+GSFFd
 k8+6nSuWy4Io1VMTjHNN4Vio+DjAwFoaOSUQwhHyek7ZyCS6Phi04n/AQ
 8KggyEbISAtYaoyegLvmfJPvLgncFBxJQp3hRUWcikyh/SlAxKpqE7uNI
 yyYKrG7kPgmf7LMW0VNd4AYGMQ0Ic1CIgd8YuxgjZ3sOHT8t9nBDohaUx
 Tbjk29iDoMfVSvMG9Cj0RjJ1kywdhTKqVih5dsL+m0JACmlZc8lHB+3A4
 DL+gtoLZ0TKA1/uBJuLLkEfUoAPk9K3Ux6OJcBp16KlXuLyrIXe2KS6tn w==;
X-CSE-ConnectionGUID: H9JQNrGcRNu9JrRfbr5s4A==
X-CSE-MsgGUID: YvjaW4CMRNWg3s9Ku2Sw7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="33986255"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="33986255"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 11:04:13 -0700
X-CSE-ConnectionGUID: IywLirigRPaavql5IfV+bA==
X-CSE-MsgGUID: KADGGN8JQSa3W/SPdGS8aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; d="scan'208";a="68104611"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 11:04:13 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 11:04:12 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 11:04:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 11:04:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPnCkP42Zhai6650olSDQ6o16vI8glRxlZiaUoW/MKXmkcjCz/6iWXHBn76PCd191wWBGzxNUgdPjP8CcPUjGqi7pZ3LFmLI+/zckEvmWJ2JdKpdQaj08rfMHGzajwolSoln5JX/IRCU7IkOzEUG0/lNccKSANML4BDcnLB6fEwwJobEwOp2IAPxZq75yT9ORONcCrge1eHu+iA8V9XJK8nFeCqerWEozhziSHlv3epZY22lmo3ybvZKhkUGDeCTKEvbcg1d1anOPvgNyo/V9lYO1nDcfObtPRx7mBHRO8wGi/+S4B5vkZPE/eb/ty4HjjPO4UkT6kg/9NBOLkuZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOJbuufiwH4JktleXv/86upJV365GqajGilz974OOWk=;
 b=mzCc3FBtPDt0QzDX2mxj7J/LFwlNfSN+FDXqG/OrtnhI3Xg10yvSGzbRfybgzrE37zxQh+stzTwrYNKpUdet6x0GBPO3P34Nk+Wy5XCSvsxXMXhKr46Z0AbeDiMMZp5aKfCrQo397GzLPpiR/akxUCzQLVFa8XmD8fBS4wPHCqltgqzxYb28BMTOD5J0lImJwAUe9OvY1rBf72hKDO893F7q962epukWmAz/WNAgyC2zk8E6G/qwMgG2m8zRNM+AH1rVkTDnl44a7+kDe0k6n8CRqwDz9IRwUwW5l1jvuP4+ZamdmXt5tSS8y/NF1M/pSBiz3UNpTYjZWKX7999awA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SA1PR11MB8490.namprd11.prod.outlook.com (2603:10b6:806:3a7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 18:04:09 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%7]) with mapi id 15.20.7875.019; Wed, 28 Aug 2024
 18:04:09 +0000
Message-ID: <abec4930-3ad9-4a90-97be-20a21a3e841c@intel.com>
Date: Wed, 28 Aug 2024 11:04:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC i-g-t] kunit: Remove hard-coded test list from xe_live_ktest
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
CC: <IGT-Dev@lists.freedesktop.org>, Katarzyna Piecielska
 <katarzyna.piecielska@intel.com>
References: <20240823182418.1771456-1-John.C.Harrison@Intel.com>
 <20240826114645.76jn7mlknpirgoml@kamilkon-DESK.igk.intel.com>
 <1941664.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <1941664.taCxCBeP46@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SA1PR11MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a10ad14-39d5-47a9-a587-08dcc78bd03b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFFMd1prM1lRSG1jWW52WFRUZy9JWWtCem9sQUw0ZSs2Zyt0L1dkMnBHRmlW?=
 =?utf-8?B?aFFoV1ppUW5Iei9pZU51SDFEWE0wMTVUZVBEVXo4VUNQZGRKV0YzQWZ1YVpi?=
 =?utf-8?B?bWp3UTV5N0tiWmlidllrS1NjWStoM2xrdHhZZVg4UzNvOUVzTkljbHI3T0kw?=
 =?utf-8?B?N29NSDNmMS92QmcxbEJVZTZsem84Z3d6ODIxMExLQkxIL0orbjVwVXNuOE9L?=
 =?utf-8?B?TmRDTWt4MkVWTERMRjVNYUttN0lPaDJxNGZEeVhPV29LSTlmekk3VFpRUHl0?=
 =?utf-8?B?bGdFVEpLQzdwWW5TQXhFaVhla25mVldnNXR6SlFoRVh2SThkWGQ1OUVLMCtS?=
 =?utf-8?B?ek5WMGJ2di9GWVI2V3lSRHpjczc1NUZaNjZxenF1Wit3RWRqemJsTlJiaE9U?=
 =?utf-8?B?Yy8rM0tmajF4ZGxKSXp0VUtjQTE3NWszUkYwWGhWWUxRL3FIV25TcG5DeDBn?=
 =?utf-8?B?VVBLNXg3cTR4VUErbWNJWDFoR3U4QnJNc1E1RUZ2TmlBY0kxaW5ycmwrTlZF?=
 =?utf-8?B?b3dvdHVMWmkxeHhWb1pFQWpRaTdITS9GU3JUS1laNURqMnVvQldjMTlWL3ZZ?=
 =?utf-8?B?Q0lhbkEycXNHSURWM3J5cnpCY2J1TmZ6bVg1MWI5WGxHM2NPS0pKMGU5U0xJ?=
 =?utf-8?B?dzJydDVBVHUySTRlbzQ3NDNhUWZacHMzTWRzVEM3L3JheDJsQk1rdi9ON1Ny?=
 =?utf-8?B?QlhGcitzd3RmNTd6b1ZGV2FoaCt0MTFZVWVaZit6S2p4OVJhOERvUXl6NkJH?=
 =?utf-8?B?YjdWM0xpYkZpZkRwNS9zbEkwL1N1eFFOdk0vQXRuQndreFMwZ2dKS2x0Z25r?=
 =?utf-8?B?ZFVXT2dIYjFDWlFzUnhsWEt5YVBSano0RWt3M2NRc1RId2NPamJiNERFaWFU?=
 =?utf-8?B?MTlxTnlWZFVvd3hLVWphZVRzbkNKVkZveGNsY1EwTk1CcHdFZGp0YUtBYUQv?=
 =?utf-8?B?WTRudTA2SThUeGJtcWgwSEozLzlFVEZqRVkyMm1OOGh0NERBMTZBdWxsNU13?=
 =?utf-8?B?MHlxMkR5alRMRGs1QzVQY3I0cnJrSmZ3MlRZVVYvWGpuVllJdHhOamlVemdR?=
 =?utf-8?B?Q1NTaHp5VFdIUWRsQVUwYmtWK0tCRVRSclplc1ZOYStkUDFWallUMEhzeGx1?=
 =?utf-8?B?K1A4Mjh4aVYzcWtqdVBRbTljZC9leS9iZzU0R2ZObGRFTyt3VWttVTJlQzMx?=
 =?utf-8?B?T1N2RDZ6amNFQ1gzM1FIK1hzUnEyU1NQbDRhbVNwcGZKTVJ5VFRSL2NMMVF2?=
 =?utf-8?B?UzVsR1lZanJ3bVNJbDJDZWxSZk1rdVFSY0tOZlFpVy9HWW9MWjJFcytzMjZD?=
 =?utf-8?B?RUdpbWNFSWNjWDBxbktZdVA1bStUMGdvWW9FVG95S2J2dnArUkYxS2loOEpP?=
 =?utf-8?B?VEk1czV5cEl1TmNKclF5eWRxS0poTGFLcTByRUFDaDBPMEh5MFNZN0hDYkJP?=
 =?utf-8?B?OThCZHN5aWlmTDl4VFVmUXdRYWljNHlPS3hUMDhFN3A2Qm8xYm91akhZYUw1?=
 =?utf-8?B?REVHaldJcm8wUThOQnQxNEVadWNMZU1UeGVnbGM2d292UENJNWFOeFhucHFn?=
 =?utf-8?B?bnI5dWFzWlpLRkhkY0VhK2p0UUJzQmxMR1J6MThBOHJFcG1TZjh4WG0zN25a?=
 =?utf-8?B?dGtTTk9vVDhTOTZJS3FTaFBrNkJ5UFlSSzZVM2VxSDZiT3NtcUU1QlF2bGNP?=
 =?utf-8?B?ODRYY1lUbkhYQ0tsOEtrZXpzcTZoL2pFUUpueWF3d2laTkI3V1RJd2V2T28v?=
 =?utf-8?B?T2I4QUZpTnZhZmZpSGYwNzB5Y216WU1Ia090cEVNckUxdXR6MTM1QnNXcGFp?=
 =?utf-8?B?eFlQOVVZQU1yUlR3MDgzZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3M1Q0tVKzVWYUdqeHpjV1NWTEd4cGJQZWZFWFB3QmZFMjkza2tVbDBQQi9B?=
 =?utf-8?B?bk0xcmNLSlVvT0w1aG1XVENVeENFVlVmaTRqMnU1YkZJdmZ0NEhMSWRjK3Y0?=
 =?utf-8?B?NFc3aTZyWXpwZ3phZGM3Vk5XWCt1b2ppYkVaSUQ3NnhPbjZldnYvOTJOY01N?=
 =?utf-8?B?eFBmUHZOSXAvWW42dUppZmNkSGN5TVpaTDh2N091QjRqdUJoZUV4ZzFhbXlI?=
 =?utf-8?B?ZGt0d2kxV3d4TGhvYnpDVFRvTHN1bHA2RjZ1NnZ6RnZDSnpYblkwcVM0Y0Ri?=
 =?utf-8?B?REVibWxJaW02Rit6YjFYS2trVndwSGNsanZkcEdNVUlHRks0RDdOcEMrQ0Zz?=
 =?utf-8?B?QUV1N1hFRkt5RjlSa1ZPMGQyVlBUakpKSkplMG1Ed2Rnd3lFQy91U3Nzb0Q3?=
 =?utf-8?B?SU5Fcko1bVcrZnhMajVRYy9ZUkZrdklIeWF1dWJ4S3VOWlQ4Z1pPL2l0alph?=
 =?utf-8?B?Z0o5SWV0SW1YS0hSZTNzZm94VnkxcWFUVWtMeklvdWZTMFNLb21CNkJlekNv?=
 =?utf-8?B?c2xvbFB6WERlbWNycWQ3TW5sTlN1ZFkwOG5iNzJ3Z1FGbU9EdTFYd2VrQUho?=
 =?utf-8?B?bHJBTS9hMXNxSWFxZ1Q4UlJHYnNCbGR1WVFQd2tUS1RONXFSS0xQWEFwOHov?=
 =?utf-8?B?blF6aVRrT2R5ZjRrYk1KcVVSTGMxMVk0Ly8xaUVEZjA5dDByM2VLNDJMU0tS?=
 =?utf-8?B?U2lVOHhmN0diZVhWN0FRUStBR3o2dWZMNmJOZFpxSGtma3NIK3VscWI5NVBG?=
 =?utf-8?B?RFBFTW9NaWVDei9wN2o5V0thV0gyd0ZxSnN6SU5sTHNJZitiUFpCczQ4eWxV?=
 =?utf-8?B?RWJCa2tQeHBGREQyd3hPTDNibjhDaEVmNWFzQSswWTZsSGh4NitrODVZR2lQ?=
 =?utf-8?B?SWdHR2xFMURqOHhGU3gyUlNzRm90eS9kcmFZbHZpQ3hFT2V2ODJuOGplVndG?=
 =?utf-8?B?V1Q0a3FhT2RnMlhWdVpoL0psTzNxQ0VpOVBGSkd0VUIxenBnbnNFa1kyNWJm?=
 =?utf-8?B?ZEwybUFyUWZYYXk2U2V4WGIxNTRjU1AzU2JPbVU0aERTbWxNS01VSUl1TTRz?=
 =?utf-8?B?WWtleXRvdWFIdnpCUjJCemRRYkJjQkRsd0k3OFB5S0FiUGRDYXZoR0JRS1Ny?=
 =?utf-8?B?MTcyTEUyb0NaU1g5WGZqQTJaMnp3amRvSWZqajdXZVpYSFdPSGxaaW8wTG1U?=
 =?utf-8?B?am5uVEIvR0dkOHNnOXoxSVVmWUZtcTk0NmcyM3ZWZGI5Z3pKUXdwYUlCMWpH?=
 =?utf-8?B?VzFiejVydHVxU2g0RFR5MWh1V3hheGdNZmlOdzRGNnhXU2hKdEFmWmI2Uy90?=
 =?utf-8?B?ZnEzNHZ4ZHRNR3IzYXR5aDZhVXEvMVVlbkViOUtOQW1sTk5Wejd6cExTMUNm?=
 =?utf-8?B?Zm02QlFsT1Z6dUtFdU1Day9mV09wUGEraUFhWXdydnhzVURUTGdKS21sWldl?=
 =?utf-8?B?U01GYVdBTjhPeWlJNXFtOFcvYVovU1lxdHJUdUJIZ2Yya1RNYnFPSXBpOGp5?=
 =?utf-8?B?eVZYU2FqSmNlRGEzYkt0ZG9pT3BaZzgyYmpoSVhVdGRCb3pzNnJibndJK3l2?=
 =?utf-8?B?cXNKOFNpK0IwYjNlanp2WWJDMmNDdytoUzl6UkYvR0V4YVN4QlpzMlYyK0g2?=
 =?utf-8?B?Tlc0Q3lhK2l0S2VYSVBkRW5MUlFKZHNwd3lpNzNuSFhnckVlaklvSDFQME9m?=
 =?utf-8?B?TFFRc1I5ZXhpeFZOUHdPWDRsalB1aXZzK29tT1d3cFB0bXEvTUU4cEpqdU9N?=
 =?utf-8?B?TGxCUkdDeFkwdnVDMGVkdXBtSkZhRzVxWVNPbWZJM21vUXNvOVhFazVWUGFw?=
 =?utf-8?B?Rlg0M0Jmd2QwdngwcGdRck1JTkluYmg1RVpZdWdiVDVhL3R3akxHMU9YU2Vn?=
 =?utf-8?B?SnJ0QmZuN3F2UnExUkgyN0NSd3NXZDFiek1jSjIwdFZhREpUTDIvZTdnRk1l?=
 =?utf-8?B?S3RoT2pvV2hiYU80K1pvUk85akpHOSt5Vm9kNC9vcWV3ZllCeVc4NDREQWgw?=
 =?utf-8?B?ZFFYM2VUY0FlcHlYbjZZV08xa0VrRHFWeFNEREdUVHQ3OXdlWnl5QUo3UUQ1?=
 =?utf-8?B?T2Zrb3FHdWVMTVdJL1p1MS9TSmNUWWFxQ1dobHBkM05JeVRYb0JVOWxxQXpK?=
 =?utf-8?B?UWdacWcvK3pGOGV1amVDbElGekdmMGVRNUg3Wk5zTnI3dHowVi9sOVBHUkZv?=
 =?utf-8?B?QXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a10ad14-39d5-47a9-a587-08dcc78bd03b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 18:04:08.9253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRNeqjngj2XDGxR3wsU0uJg1ct4zTtlbPLtdtVEN2MGODgoZhpEAlh36qvdVQSlLuAFcRybSSGuz4RBAMmEe8L9bwPYzxrY56EzV/KXgtPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8490
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

On 8/26/2024 06:07, Janusz Krzysztofik wrote:
> Hi John, Kamil,
>
> On Monday, 26 August 2024 13:46:45 GMT+2 Kamil Konieczny wrote:
>> Hi John.C.Harrison,
>> On 2024-08-23 at 11:24:18 -0700, John.C.Harrison@Intel.com wrote:
>>> From: johnharr <johnharr@invalid-email.com>
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> Again invalid e-mail here.
>>
>>> The list of supported kunit tests is currently hard coded.
> That pattern originates from i915_selftest, where there are 3 stable subtests,
> "mock", "live" and "perf", each of them executing a (possibly long) list of
> dynamic sub-subtests actually provided by the module for each category.  Also,
> IIRC there was a separate module for each Xe test suite before, each mapped to
> a separate IGT test, later merged into one module with multiple suites and one
> test with multiple corresponding subtests.
Not sure if you are just explaining the history of the test or making a 
suggestion as to how it should evolve next?

>
>>> Which means
>>> that adding a new test to the kernel also requires patches to IGT as
>>> well.
>>>
>>> The list of available kunit tests is already exported by the kernel.
>>> So there is no need to bake a list into the IGT source code. So, add
>>> support for querying the test list dynamically.
>>>
>>> NB: Currently, the test list can only be queried by root but the IGT
>>> build system queries all tests at compile time. In theory this should
>>> not be a problem. However, the kunit helper code is all written to run
>>> inside a test and not inside the prep code, which means that when it
>>> fails to open the root only interfaces, it calls 'skip'. And skip is
>>> not allowed outside of running a test. Hence the build fails with:
>>>    skipping is allowed only in fixtures, subtests or igt_simple_main
>> Looks like we should fix it, move out skips from kunit libs.
> I suggest you consider a different approach: for a module, call igt_kunit()
> only once, with NULL suite argument.  As a result, you'll get results from one
> IGT subtest called "<module_name>" with a bunch of IGT dynamic sub-subtests
> called "<test_suite>-<test_case>", one for each test case provided by the
> module.
I'm not following. This is what my patch does, isn't it? There is a 
single call to igt_kunit_get_test_names() which returns a list of 
'suite/case' name pairs having already registered those as dynamic 
sub-tests. Then it loops through the list running the suites (with any 
command line filtering being automatically applied to filter out sub-tests).


>
>>> And of course, putting all the query code inside an igt_fixture block
>>> means it doesn't get run as part of --show-testlist or --list-subtests.
>>>
>>> Reworking the kunit code to fail cleanly rather than skipping
>>> everywhere seems much more invasive. It is also not clear why the
>>> kunit code is considered 'library' when it is execlusively used from
>>> the kunit test alone!?
> Current users:
> 	igt$ grep -rl igt_kunit tests/
> 	tests/intel/xe_live_ktest.c
> 	tests/kms_selftest.c
> 	tests/drm_mm.c
> 	tests/drm_buddy.c
>
> The other 3 were first converted from i915_selftest standard to KUnit still
> before Xe KUnit IGT tests started appearing.

Argh, I must have been inside the 'intel' directory when I did my 
search! Oops.

The KMS one has another hard coded test list. The drm_mm one has a 
commented hard coded test list but actually just runs everything with no 
compiled in lists and the drm_buddy test has no test lists at all. Not 
sure what tests/sub-tests they actually run because all three of those 
just skip for me. Not sure why. The xe_live_ktest one runs everything 
fine so I definitely have the ktest system compiled in to the kernel. 
And this is running with a stock IGT tree, not with my patch, so it's 
not that my patch is breaking it.

John.

>
> Thanks,
> Janusz
>
>>> So posting this as an RFC before going too far
>>> down the possible rabbit hole.
>>>
>> As I see this, it is a lib because some other vendor (like amdpgu)
>> could use it.
>>
>> +cc Janusz
>> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>
>> btw could you split this into two patches, one for lib/* and
>> one for tests/intel/xe_live_ktest ?
>>
>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>> ---
>>>   lib/igt_kmod.c              | 68 +++++++++++++++++++++++++++++++++++++
>>>   lib/igt_kmod.h              |  6 ++++
>>>   tests/intel/xe_live_ktest.c | 60 ++++++++++++++++----------------
>>>   3 files changed, 103 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>>> index 464c0dcf484a..69c1254b397c 100644
>>> --- a/lib/igt_kmod.c
>>> +++ b/lib/igt_kmod.c
>>> @@ -1414,6 +1414,74 @@ static void __igt_kunit(struct igt_ktest *tst,
>>>   	}
>>>   }
>>>   
>>> +/**
>>> + * igt_kunit:
>>> + * @module_name: the name of the module
>>> + * @suite: the name of test suite to be executed, also used as subtest name;
>>> + *	   if NULL then test cases from all test suites provided by the module
>>> + *	   are executed as dynamic sub-subtests of one IGT subtest, which name
>>> + *	   is derived from the module name by cutting off its optional trailing
>>> + *	   _test or _kunit suffix
>>> + * @opts: options to load the module
>>> + *
>>> + * Loads the test module, parses its (k)tap dmesg output, then unloads it
>>> + */
>>> +void igt_kunit_get_test_names(const char *module_name, const char *opts, struct igt_list_head *names)
>>> +{
>>> +	char debugfs_path[PATH_MAX] = { '\0', };
>>> +	struct igt_ktest tst = { .kmsg = -1, };
>>> +	struct igt_ktap_results *ktap = NULL;
>>> +	const char *subtest;
>>> +	char *suite_name = NULL, *case_name = NULL;
>>> +	DIR *debugfs_dir = NULL;
>>> +	IGT_LIST_HEAD(tests);
>>> +
>>> +	subtest = strdup(module_name);
>>> +	if (!igt_debug_on(!subtest)) {
>>> +		char *suffix = strstr(subtest, "_test");
>>> +
>>> +		if (!suffix)
>>> +			suffix = strstr(subtest, "_kunit");
>>> +
>>> +		if (suffix)
>>> +			*suffix = '\0';
>>> +	}
>>> +
>>> +	igt_require(subtest);
>>> +
>>> +	igt_require(!igt_ktest_init(&tst, module_name));
>>> +	igt_require(!igt_ktest_begin(&tst));
>>> +
>>> +	igt_ignore_warn(igt_kmod_load("kunit", NULL));
>>> +
>>> +	kunit_debugfs_path(debugfs_path);
>>> +	igt_info("kunit path: %s\n", debugfs_path);
>>> +	if (igt_debug_on(!*debugfs_path) ||
>>> +	    !kunit_get_tests(&tests, &tst, NULL, opts, debugfs_path, &debugfs_dir, &ktap)) {
>>> +		igt_info("kunit - no tests found!?\n");
>>> +	} else {
>>> +		struct igt_ktap_result *t;
>>> +		igt_info("kunit tests:\n");
>>> +		igt_list_for_each_entry(t, &tests, link) {
>>> +			struct igt_kunit_names *name = malloc(sizeof(*name));
>>> +			name->suite = strdup(t->suite_name);
>>> +			name->sub = strdup(t->case_name);
>>> +			igt_info("  %s / %s\n", t->suite_name, t->case_name);
>>> +			igt_list_add(&name->link, names);
>>> +		}
>>> +	}
>>> +
>>> +	igt_ktap_free(&ktap);
>>> +
>>> +	kunit_results_free(&tests, &suite_name, &case_name);
>>> +
>>> +	if (debugfs_dir)
>>> +		closedir(debugfs_dir);
>>> +
>>> +	igt_ktest_end(&tst);
>>> +	igt_ktest_fini(&tst);
>>> +}
>>> +
>>>   /**
>>>    * igt_kunit:
>>>    * @module_name: the name of the module
>>> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>>> index efb46da128d4..2f608eb69d48 100644
>>> --- a/lib/igt_kmod.h
>>> +++ b/lib/igt_kmod.h
>>> @@ -71,7 +71,13 @@ static inline int igt_xe_driver_unload(void)
>>>   int igt_amdgpu_driver_load(const char *opts);
>>>   int igt_amdgpu_driver_unload(void);
>>>   
>>> +struct igt_kunit_names {
>>> +	char *suite;
>>> +	char *sub;
>>> +	struct igt_list_head link;
>>> +};
>>>   void igt_kunit(const char *module_name, const char *name, const char *opts);
>>> +void igt_kunit_get_test_names(const char *module_name, const char *opts, struct igt_list_head *names);
>>>   
>>>   void igt_kselftests(const char *module_name,
>>>   		    const char *module_options,
>>> diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
>>> index 4376d5df7751..13265e87ba9d 100644
>>> --- a/tests/intel/xe_live_ktest.c
>>> +++ b/tests/intel/xe_live_ktest.c
>>> @@ -9,40 +9,38 @@
>>>    * Sub-category: kunit
>>>    * Functionality: kunit test
>>>    * Test category: functionality test
>>> - *
>>> - * SUBTEST: xe_bo
>>> - * Description:
>>> - *	Kernel dynamic selftests to check if GPU buffer objects are
>>> - *	being handled properly.
>>> - * Functionality: bo
>>> - *
>>> - * SUBTEST: xe_dma_buf
>>> - * Description: Kernel dynamic selftests for dmabuf functionality.
>>> - * Functionality: dmabuf test
>>> - *
>>> - * SUBTEST: xe_migrate
>>> - * Description:
>>> - *	Kernel dynamic selftests to check if page table migrations
>>> - *	are working properly.
>>> - * Functionality: migrate
>>> - *
>>> - * SUBTEST: xe_mocs
>>> - * Description:
>>> - *	Kernel dynamic selftests to check mocs configuration.
>>> - * Functionality: mocs configuration
>>>    */
>>>   
>> Does that mean we will not have any subtests here? The point
>> into moving subtests names into documentation was to have a testlist
>> generated during compilation, so it will not depend on running
>> test with --list option. Adding also Katarzyna to cc.
>> Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
>>
>> Regards,
>> Kamil
>>
>>> -static const char *live_tests[] = {
>>> -	"xe_bo",
>>> -	"xe_dma_buf",
>>> -	"xe_migrate",
>>> -	"xe_mocs",
>>> -};
>>> -
>>>   igt_main
>>>   {
>>> -	int i;
>>> +	IGT_LIST_HEAD(names);
>>> +	IGT_LIST_HEAD(done);
>>> +	struct igt_kunit_names *name, *cmp;
>>> +
>>> +	igt_kunit_get_test_names("xe_live_test", NULL, &names);
>>> +
>>> +	while (!igt_list_empty(&names)) {
>>> +		bool found = false;
>>> +
>>> +		name = igt_list_first_entry(&names, name, link);
>>> +		igt_list_del(&name->link);
>>> +
>>> +		/*
>>> +		 * Retuned list is sub-tests.
>>> +		 * So, need filter out duplicated top level names.
>>> +		 */
>>> +		igt_list_for_each_entry(cmp, &done, link) {
>>> +			if (strcmp(name->suite, cmp->suite) != 0)
>>> +				continue;
>>> +
>>> +			found = true;
>>> +		}
>>> +
>>> +		if (found)
>>> +			continue;
>>> +
>>> +		igt_list_add(&name->link, &done);
>>>   
>>> -	for (i = 0; i < ARRAY_SIZE(live_tests); i++)
>>> -		igt_kunit("xe_live_test", live_tests[i], NULL);
>>> +		igt_kunit("xe_live_test", name->suite, NULL);
>>> +	}
>>>   }
>
>
>

