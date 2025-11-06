Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B88CCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 22:35:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070A510E9E6;
	Thu,  6 Nov 2025 22:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OFOh15Z9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A1110E9E6
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 22:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762468537; x=1794004537;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3lFdMqWyq7aQsTG2ks/g1/P23smzjKhZqg8rBFn69Jg=;
 b=OFOh15Z9RWBUs+qDlZK4CKubZyLDv2fgwyXLxBtLyyT8TiTO0VGQFOJr
 XYBM0Xd5rcA87hZYW4rauLMtCWIbzWZHnAXJ9Zvmf1U6DGvjf6Xhqwpbg
 frs51lZJbGBjDlpJVVY8rg0xvdp4B/Zx1cmfafpz0tNEAIUiXSmkxc9K3
 XhumJNDAaJmNvk1Rm3P7ZoOuQq0HcwIGqhWWNoKNK8sPiceN/Ijnp2/6n
 1eIUCF88Q/F1lTSMZP86ZfIvEDEKu897R53DBb73hJBgQ/MV6JxfhcV3Y
 7NP0UUoLTAzYyZCibwB/S7d0DEkiQvlL8e7+x+mW0DigWSyjPwCMA+uR+ Q==;
X-CSE-ConnectionGUID: b4uJ5kHATMeiIBKzwwzvHg==
X-CSE-MsgGUID: lhWmrq7eTfeg4yHc7JCCSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="76068055"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="76068055"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:35:36 -0800
X-CSE-ConnectionGUID: xBEgSx8rT4mntNqB4PhY4A==
X-CSE-MsgGUID: BCdvFzXeR8WiFrX4oIzg3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="187602940"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:35:36 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:35:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 14:35:35 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:35:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qC/v1H9/AI2C5VDIQ4WTZyf0yo+uEUjuA6zNnd01dweHR5qBn6zTWyRuZqugnOqeTkSHdESA49jMuq7zBeQw5/FulM+AZg6U00BU58nQOhju6Rr6PGBGAegM8qubyX9jvIdn102V0y1eUywup3eyQXVG7dSpKQEBuxaL2qnbz7g6DF3apX0442KQ3LxGxEbSP+jDlwJq/f16+49rEcuvP7z0Hzr0U/jgALsGh8UoT+JPCmaJG/iBnbc4TO4zzq8jSkh3l/wKTv5yJG4STdnG12O3K8V3gU3vJIA5zDRXu6EndqhVKiFJQg3OjsVlPBCN8TzUcgWcEXr5jvUaaU8qKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cX8Cs6TmVcl9ess3IOZq/wS5AdyBHUU0ZnlOgQRL9z0=;
 b=Oz7OKd6aqWhrml8f/0toRy3WOYr3jRAdirI7UaEFGFOntb1dCMpEj9TIe7xHv/9oJMhu2xb3ulSl+MDSBFQYb3Q8iuZMZlUVTvPF4mZ9MiYW53n56wSNnsfqpy3JUIbOKOhJGlPw9u3MFvtyrbZhA20vtSu5fGEN9gLrrGOrQikjCeLhMQtGIyD6ZxrzCYHQ7/5wYLuA6fbJ9zgerUMQ1k2tld5QN9YpRBl3GxGFxLdecoE1JlCy2T0AGYksg5bsjLy5K0oHg5T08aj5Pg/050rVftx2E5o2rXkZZZBZxDyCw7KDJC0VkeTCbMGFSEn1Zd2Hq/8UhnrzLHGTgZ4KQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW4PR11MB7080.namprd11.prod.outlook.com (2603:10b6:303:21a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 22:35:33 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9275.015; Thu, 6 Nov 2025
 22:35:33 +0000
Message-ID: <45313f47-c6dc-4fba-87e2-ec7a7e71f7b1@intel.com>
Date: Thu, 6 Nov 2025 23:35:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pmu: Tie preempt timeout to exec quantum
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20251106221248.260255-2-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251106221248.260255-2-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0473.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::12) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW4PR11MB7080:EE_
X-MS-Office365-Filtering-Correlation-Id: 23667ad6-a900-4f41-abe2-08de1d84cc01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RjkzeXNDUnlKZnB3cTRhRlYzNE5keDVKOEx3bEtTMy95WStPSEx3YXBhZVNR?=
 =?utf-8?B?Q1JtMktzOFh3aFRnYmJwNnlCZWhPZXFvUjZvQU1LWm92cmpVcUVVaWpDTGZ6?=
 =?utf-8?B?RFlKUHNvOXRwWEp4ZWRTbnFKeksreWR6anh1NC9wMWhRWTMzM2hpbytvaXMz?=
 =?utf-8?B?RU1YUER1S1pDOFJUY1pCMUVYRTNjOWtBVC9TemJ6RTZ6WEQwVSthdHVxNmov?=
 =?utf-8?B?SVRBSHRLU2VCZ0pVVmFsNWxZdjRwYTZId1lHdDIvMnNCengwWEFKOS9MT1pN?=
 =?utf-8?B?MTBKZG9RbGFZL1R4S0VlbURsd0pNQWJyWHJ3OVNqZU9RUkxuSlpWNjNwSXBE?=
 =?utf-8?B?aXY2Mzk0S2kxV3hvaXdERVNCY0pJRlkrdzQ2c3FIdHYrcE9SMGw0OVZLYjNu?=
 =?utf-8?B?SXlYK0REZEpOd2xyYWhZS0dtUGFzN3E4REh2SkpjbkVQeEFodlE0c1Rxb2Nu?=
 =?utf-8?B?VlZ2RVVTcGhDK1c0RFd1dWNNOUFsM2liaTF3V1QxOXo4VXBmNnljdElObVdR?=
 =?utf-8?B?bEVWSzIrejgzQnhod3FGWFBHa0YyYytKV08yZE9pT3h0MFlHamJwTDJMWjNq?=
 =?utf-8?B?MlBhaitpT1huajVTM1BSQkhyN1dhWUZiRjF6Nk5RL3ErSFRuaUNKL2p4ZGhm?=
 =?utf-8?B?N2MrL3V4ZW5EZ1pVMkxBV05UU1VtaDZadnBkZU1ERGg2YUxxazZjSXgrekVM?=
 =?utf-8?B?SG95Z2VUWUF5d2JDelJ1QXB5cnJOVVVXSllrTVdMbnE3ejBwd0xiT3laTGc4?=
 =?utf-8?B?MmtaTnlhcUtqN21WcnNhc3dPZmFHb1h5c1RDR21oUUFzSG5YQVZiWkcvWldU?=
 =?utf-8?B?UC82Mm83aWl0S1d4SW9mcnJtWUY5S0VURUc4L25nZzV0djExYUY3YTEvTlVP?=
 =?utf-8?B?TWhROVRBRk9jY1NPcVN5SzVkcEJEZHhnT1NEekVmRWZLUjV4K1lIbWxaMU5a?=
 =?utf-8?B?czEwN3NXQ1JYWEdyd2d4UVhQTkh4L3VJSGpSc0dUbFBIaTZXRHBKYnY1eE5C?=
 =?utf-8?B?OUtZM3ova05RcUN5elMrOGtSZldGNVd2ZGtIdzA1d0NiTmlrVDlvODFxMk9l?=
 =?utf-8?B?RkhNU2o2UmVRaXpXajRCWXA0VHpzUnBWT1laRlllNFVmS3dSemg5R3Nud3Y5?=
 =?utf-8?B?Y0pkL2R5dk1lSEdjeDFQQnhMUkE2bVhNZmtaNjZTYTFzdFFydjZsbVNLNlh0?=
 =?utf-8?B?RlBLQ2l3VWRRSjlFYWVRc3FSU1JMbmQzVDBwaUhNakN4TXVNckdTSjNGRlpB?=
 =?utf-8?B?dnF2dHpNdVlYNTlHbkRFbTdVQTc2WjIySTErSTZnVHNacENiSm5ZaVBKdXEw?=
 =?utf-8?B?elN6OEJqR04vVy9GaENjTWVVVWlEUS84Qms3QzhKRVlQeU5HWWdGZW5JcU1x?=
 =?utf-8?B?L2MySEIydnhmOWZ6Szk1bWVmaWxXQk52Yko4SkR5NjNCQk53ZWpCUC84RlZR?=
 =?utf-8?B?ZHhiYzI1SzdaUWFrREJPSFpuNDFNUlc5Njg5MEdmUExGZmhVeU1aKy90c0hW?=
 =?utf-8?B?Z3JKRE40a0NMYlM4QmJaekFKakh5N1NEUTYxNHE5SllQQXB4dHJaYnpwVnN0?=
 =?utf-8?B?K3pwSnNXT1NaZXgrSTFoWmNqeWhmZ2d4WEFjR2V0SDFjSnJIN3RUdm5HKzls?=
 =?utf-8?B?MmJzRUloOFI5T2t4U2tiOWEzMUNDKzhvK2duRkNyMndRNUVkSHVFcVBiNEtS?=
 =?utf-8?B?emZXMnFXNGJGYXUyWjVXN2ZFelIyNXR3TitoenpyOVFveVQ2NU0vcVRLRW1u?=
 =?utf-8?B?Tk0ramRVL0I3MGtoWWdiRDJxeWlUQldsaTJIbHZ2WVVsU29kbEtIZTZ4dDll?=
 =?utf-8?B?VjVSdHVYVFFmNFJNRThjdHprclpUMUtDSW1xSHZrUGlSQW9uTDFEcWlvNVdT?=
 =?utf-8?B?TTBNakdISVgwL3prc1RiN2ZOQ2ZCT2RpSUhJL3FaRHpnVEIxek4vOHhUS01s?=
 =?utf-8?Q?f5cSVkT529NFjol2y7XuF4y9anC+H/dp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yitab0pFWHJkNTR5SzlIRHJaKzZxWXh6YUpIa3AzQi9jTURyUkc5aEVPM3lM?=
 =?utf-8?B?UXh4ZDgwUjB5ZmJScWk3d3d5b3ZnVisrRmhnK084NWczeEhucXNneUE0Ukcw?=
 =?utf-8?B?bWloa1lwZGsvZ1RRZVZnZE9qc2Fta1VzWmEyVVFrNmFvV1FEQ0NnWXZaZU10?=
 =?utf-8?B?cU1mREg5cTUzTlpGTjZKRXlZMndRT29KZi9hNzBwc3hCR0w0cDFOYWZuZjZy?=
 =?utf-8?B?SFAyR1oxZU96c0liUndXWnNOTmxjbWNSVWxMTFhGQ2JycVJpUnI3dHdNNWRK?=
 =?utf-8?B?aGNORUp4YUJRUmhqNXZpc0s5dmFxUURYNTJEa3JFRy8zLzlmTU41MExScEYv?=
 =?utf-8?B?Y0lEUUdWQ2cySVprV0R6dDNxNk5TWmdKVkJYanUrMCtJN1hjY0ZmemViRnlk?=
 =?utf-8?B?WnF1WFJmVjZUWWp4Zy9TZXQ4OE9CamdScDVmVE1mQWVEWkxiZFNiNEJpZ0xh?=
 =?utf-8?B?ckhUcVdaaVl5TGhYaXdldXZzWUNiK2tEdG5FbDFiWjQyMElzcmlFTGgrOGJR?=
 =?utf-8?B?d2JxRjZqbTBrRk03b1FlVnA3M1JSZ2pJdllSUTBhTW9sVmcrckcvYUtBNHI1?=
 =?utf-8?B?M1J0N0VRVC9SOFdHVFRJMWc1emU4NSt5bUV6SmVRQ2RxKytDL0hKRUJFM3lK?=
 =?utf-8?B?Qkh1alc4cUdZNEtOM2prVzdwVE83Qmp4ZnhSaHZQdEF0Ry9pU1Z2cmpYeVVQ?=
 =?utf-8?B?Z2VOblFvTmZwOHpHMjhQQlgwL3ZmaGwreEhHY2VZbEtTalNWWHBjQjV3MU9x?=
 =?utf-8?B?dWVRRThQWFRyNEZWTWhEc2NmVVgvWm1OeG9zVWxVdGZDRnBhc3hwdHVjNkEr?=
 =?utf-8?B?K25qSVR4NUpEODdTQkp5R3ZIQnJodkxNc0M0T21KNnA3dTlvc0tEQWJ1cFhC?=
 =?utf-8?B?ajJLUjRsTndERFR3NzVjdzRZYi9sdkVBLzBhcy8yTGVjMU5tSUFJamtNQ3ly?=
 =?utf-8?B?ZWxQcVBiUlN2MG9HemVtd0VFN1lTN3E0KzJOZnhXMjBYOVJyTC9UVDNweFg5?=
 =?utf-8?B?WFh3blJ2NUUzUm9ybVBSUzJaTUUzemRmRHlkV2dMSE0rZnhBcFNKNnFyckV1?=
 =?utf-8?B?QWlGNjljWm5HVlhVQnRwb1RQcVBJVDdrZDNoY0NRSDMrQWx6ZGh6NmxUQmYx?=
 =?utf-8?B?bUxrc0hQTzVyM3VmOEYrd1VvdnJhTGxXR2JsOXJXdnRSeGg0dlo4YWZrYVU0?=
 =?utf-8?B?bEpHakxPeklXbm51SnQzNE1ONkxFa1pxWURGZTNYMDl5c1RTSm1JaGQ2dmlq?=
 =?utf-8?B?Q0pHbnJCZU44a20ySmZPWEJzQTJBWHc3M3o5TVowczNIeGF4MlhIMVlTeFlr?=
 =?utf-8?B?QlhVUTM4cWNkcUhQbm9FYVliQTZmblhKYWtWZGZ5Q0lORVJnVTdaK2RGUFFx?=
 =?utf-8?B?NHBmcGt1eFFyUlJHaXZUYjJGWmplZGRkcDRzZlJuNW1MdGw2SENmalNucThS?=
 =?utf-8?B?NUx5dG1LbjRTU3F5SEZXQXVFUFM4UzdpenpiRGFHelBjMmdvUm5PSWY4MVVC?=
 =?utf-8?B?QXJteFNKSlJMZXhtcitFNFhmeCtMVWl0d1RZK1RTbHQ4ODdVTGlyNXRCek9t?=
 =?utf-8?B?WFUvSklGS0tJZDdPTU44UTFhNjZVdmEra1RXd0ZLeEphWGd6NFhRRGVuSkly?=
 =?utf-8?B?Z20zL1lxOCtaZmpXbVZDS2hzMW5WSjBUVTZOZnhLeE45N0hjRjF0eHBtVEJK?=
 =?utf-8?B?RVBhQnhNODhEalVmOE81K3FzbFAxNVNQZDU2enpUUlgzcGhKaDJLSEFyNUpJ?=
 =?utf-8?B?SE1HUEpEV3ZSTEhCazlCL0V1ZTc4dDNOQ0FnWWhIdVRTbjRtY3dXZDRzNng3?=
 =?utf-8?B?bkFDUmFVVWdpVEpzbUg4dVlzSzEzaFlHeVNqYWVHWHFpbStQQTFPOFdRZGtx?=
 =?utf-8?B?SWc5NjZMVWlzLzBlZHZZL0xQWnJ6RnBjYlFOWk4vTGRNVHdmL3AzU0xBZXM0?=
 =?utf-8?B?OW1lUUFaUTRJc3lFS1JYYWU3NE5uNUFpamNZOE4zdmZLMTV1aTJOb1M3cTRI?=
 =?utf-8?B?azNGVlRXcjZjQWh5VmNXUFQyQ041RFpjYkRVY2ptS2FPNFZkaVlEeTdMT0I0?=
 =?utf-8?B?NzZ3UnpQWlRBY1h1V0tmcGZtYk8xcURRVW5VVEtxVnFKbk5sazUvckljSjhQ?=
 =?utf-8?B?QzB1NFdRTDRJN0tMNmpHZytDdUdSSWg1aEQ4Um0zSXNrMDhkK2wvSnpaVTM3?=
 =?utf-8?B?R1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23667ad6-a900-4f41-abe2-08de1d84cc01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 22:35:33.0987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6tCVCBSN+UJTmvQEDA+y9djZJmd/TAKje4Q1Ist/FJtSsG4mVlNc0Y5knyPKC4TfkB/Ur58gk79upb0VQx+VgrpWo9NwLFxMbgkrslMkr/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7080
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



On 11/6/2025 11:12 PM, Jonathan Cavitt wrote:
> When updating the exec quantum in enable_and_provision_vfs, update the
> preempt timeout value to be double the exec quantum value.  Also, reset
> the preempt timeout value on test end in unprovision_and_disable_vfs.
> The value for the preempt timeout here was chosen because it's what
> we've used historically for cases like this.

while PT = 2x EQ was a common setting for VFs expected to run regular WLs,
I'm not sure that this would be a correct value for this particular test,
which verifies reporting of the engine activity - maybe PT shall be very
small or equal PT (depending on actual WL's type submitted by the test)

> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  tests/intel/xe_pmu.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 9525655ba2..e7c2d82da4 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -987,12 +987,18 @@ static unsigned int enable_and_provision_vfs(int fd)
>  	num_vfs = igt_sriov_get_enabled_vfs(fd);
>  	igt_require(num_vfs == 2);
>  
> -	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
> +	/*
> +	 * Set 32ms for VF execution quantum and 64ms for PF execution quantum.
> +	 * Set the preempt timeout for the VF and PF to be double their execution quantum.
> +	 */
>  	xe_for_each_gt(fd, gt) {
>  		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn = 0; fn <= num_vfs; fn++)
> +		for (int fn = 0; fn <= num_vfs; fn++) {
>  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
>  						     pf_exec_quantum);
> +			xe_sriov_set_preempt_timeout_us(fd, fn, gt, 2000 *
> +							(fn ? vf_exec_quantum : pf_exec_quantum));

maybe better to have some temp vars/const with these pf/vf preempt_timeout values
like it is done for vf/pf exec_quantum
so we will have them defined together

> +		}
>  	}
>  
>  	/* probe VFs */
> @@ -1011,8 +1017,10 @@ static void unprovision_and_disable_vfs(int fd)
>  
>  	xe_for_each_gt(fd, gt) {
>  		xe_sriov_set_sched_if_idle(fd, gt, 0);
> -		for (int fn = 0; fn <= num_vfs; fn++)
> +		for (int fn = 0; fn <= num_vfs; fn++) {
>  			xe_sriov_set_exec_quantum_ms(fd, fn, gt, 0);
> +			xe_sriov_set_preempt_timeout_us(fd, fn, gt, 0);
> +		}
>  	}
>  
>  	xe_sriov_disable_vfs_restore_auto_provisioning(fd);

