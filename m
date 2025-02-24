Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB9CC021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 13:44:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36C610E44B;
	Mon, 24 Feb 2025 13:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZE3mqig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24F810E20F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740393689; x=1771929689;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MpfmxE90PsqHjjec4MhDH1ttm6OaNyNpW6AFh4tgfcw=;
 b=VZE3mqigrnevHoOKUnWQtoEcU+OlC3tvisAOC4tVq4nM43Qtvcz3jHB8
 2uBemOEM0Q4phpHz4/cXVVLlN4g/3MDtpI5+PQ9UYq/Avv9b4EEeQXMfD
 5Rx5hYpKzovSz0s5w7kb+SB/ZdulN3Qs50xnQROI2DN1pMtAJvKj9FK1y
 mb/+BdVdDxtGijXmxXTR1O80CMfzfVaG82hCbmOTlLONOIxmjvwx9NFOw
 3bWHNBt0XE4vXgs8ccHbYlxBPU4hj+jM9sGjgfXxxOUMNRibSEY1c3BVi
 pfDrnWgkRKMMVxYSucdVjjL8HHCzQWkBl1gmYLZ9bPODYEwTYOuPZg/v5 w==;
X-CSE-ConnectionGUID: xUZ9KN/ERQSXxxz1G/yn1g==
X-CSE-MsgGUID: K3ytsvZdTuiJYTncIFCekg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58559093"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="58559093"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 02:41:28 -0800
X-CSE-ConnectionGUID: LOA15oQJThGPUjy/dEKQ2g==
X-CSE-MsgGUID: TGljZFc2S8uHuc9t8hjJEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="146874123"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Feb 2025 02:41:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 24 Feb 2025 02:41:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 24 Feb 2025 02:41:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Feb 2025 02:41:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yZZOFQF9Z9rE90SFawolBm0GYfIhIHl6Pn3uBeHGVaXhlBnyr9rNB3SwoXaqfSwYdIPCojvE2nBtiYEbbg8n0yK/jPOFduTOtLirB4TmITO5hIbXshzadE/T4RR4U60aEr56jU0/qbzdQ2LxWy4RXxSzkoXGM36ZfazUxhhB82dnDcBKQyloDtW+Jo//2Lasn6oxNAUZBbR0WyTZi5ae3JxcEscv6j4ohAmcD4HZx/abGorcypa3B1ZC8jr/8wsD0sblGGKnfyEZVf4UBUs7REAcVj12WisuV8BqeGU4oxJAaREo3bKhHnDkkuDvFlZY7YjWSe9WbW/PFofZsFICwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwzzRhoHLScmCTsmb9VRrVVBfe4AHMWRgfWaOiZp4jk=;
 b=wtC/e317OJPtS226I3LO/XWpq83zwFAVKluu2tTooYOKvGtyp1ELirzkoReGuAMXfrsV+VX4cMDQbz78VGK7SiQZx88hRoxKAIfunj33fQc7CWaqgP2W79mDw+zHofYqGKHxihkyRhbajv27nf50P3g8dIDn1dJZSLSGjzraecdvQUMRaA/ey6FqzkmLPiNtds//GpytHSCb2mYdnadppQ8dXQTFzZDSEBsQSY3JhYVF6gtk0JsYOik352brErNzCrRQSiTy0qq0kta1PdEXeLx3rKibwRX2INhwio04J9VgC9nycCJrely68fDh91a3iORsUMoIqPLn0HPhe6svSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 10:41:19 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:41:18 +0000
Date: Mon, 24 Feb 2025 10:41:10 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2] lib/igt_core: Add ftrace logs at test boundaries
Message-ID: <yqq7fmt5wlznb2znqcfrtn62qoci5hpteuqmgspqfxl6qzgdue@od4r56ryjayo>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250221223823.2336228-1-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250221223823.2336228-1-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: ZR2P278CA0078.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::13) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BL4PR11MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fac8fa-e66c-4f62-7af4-08dd54bfc5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXhJMnlvYVRxWWFPN3ptM244RFEzYUFKQkJicHprd0c3dlh1eVJxR0x4UFJR?=
 =?utf-8?B?VTdiWThuMGhhdlkvUk0rdGRQa2ZvUmw2YndPTHh4bzhKeldOU2tkRFBkVE13?=
 =?utf-8?B?L1QyNERLZTZ0ZGFJYWhDelZ3dXhTQW52S1F3emJTZkdLTzBjNnVyeHFLVmZG?=
 =?utf-8?B?WDZhaC96OFAwUndYNU5QWWtFSEdTMERGTHkzdlNSSjdtZVcwL1RvdFF3eHpK?=
 =?utf-8?B?SzlUOHg1VTFNYzdWaURGelA2Lys0YWFkbDdOVVhxa1BwMldDVVJ4YU9CMnBJ?=
 =?utf-8?B?Z25GQmp1aERsbXdJNjh1UjgwaWZFYTlWdFJBYkxTbWpLYmpLL2xaN3YzYnA4?=
 =?utf-8?B?bmN2NkI5S1B4d0duVC9UbXlMY2NEREdkL2JxWkdxL2RtOXNMMGNQNElTQmp4?=
 =?utf-8?B?bXVKdGRPNXNlQkgydlE1MUM2WCtvUis5akp1TVB1QnhEM2Uwczl3RTE5eEhW?=
 =?utf-8?B?ejBaZG52Wkhma3RVSWpZYm8wOStacVVFUjlvczNyVjRUSUpqTCtqcDNJdnJF?=
 =?utf-8?B?UEFIV3ViTkR1d1ZhSXZJVjg2YmUvOEpHdzRLNkdTeXc4WEhsek1aWHJJTXkz?=
 =?utf-8?B?clJxb1Z5RlU1cEM1ZnRXaTd6MXY5dDcxMDlCSzdCL25oNjdPWGdDb3lqbk8w?=
 =?utf-8?B?aFdjNzV3eS92bUpJT1luUHd3SnlaL3FucnFIUlF4MnE4aXIxcnNOU0llbzdm?=
 =?utf-8?B?Y3czWjU5YmRvdFNkd24rQXB4ZzA2d0dqSFEzSjNxcEFZczVHdWRRQ215K0hs?=
 =?utf-8?B?T1ZXNlBlVkdaYnFpTUhQYzZJcXNzVWV2cDZ3MUQwYjVyQlcwS0U5d2xNVXNR?=
 =?utf-8?B?U1dFU1h6ekN0K3JGKzM2QnN1MHR5RTFaZFlzM2ZIWFVJTWdZVjlQaGxEcFZH?=
 =?utf-8?B?bFBtTDhNQU9rZmhycFdZMVpOaTFZR3dTNVFlZ0VGVHdmNThPQjVneXZJVUt3?=
 =?utf-8?B?UWVSU3ZKK1IrMnN4QUdTbU9ZcnVnaUpxbWx5STlCdFo2eUFaekdwUHZNV1Rw?=
 =?utf-8?B?enZJOEk5eXhJcmlCWExqYTU3WmczaFpTQk84dWpVNTVmMnY3blRRTHdFRi9L?=
 =?utf-8?B?alBuSWQ4SGRkMWpETllsYTk0ZEJETHVPNVdBRXZoWitZTHdBWU04UG95aGlN?=
 =?utf-8?B?eXl3U2x6MXl0eVNVZlZxQnRNYkY1K3lpb25oN0dqOEdLSFhnQ215VlhYYWpI?=
 =?utf-8?B?NHZQb0tuWmpUbVJ5TXc0MzdNWUZBem92VXVDbWh0bEI3aHlNTEZ4ZkJwa2xM?=
 =?utf-8?B?RG5UVmRoMDJtUzdQL1g2QXNPOU9MSjJYTk1hRWNheENkZEdTdy9KU2pLaHRG?=
 =?utf-8?B?aDk4c0x4U3pGZlZzUXRsakdoS3dMbmQ0S1RwaWEvaUtmUWFwVlBEZVUxbWRk?=
 =?utf-8?B?dEozS01vUnRiSTQyNTB3UGpmQUpCSENvQmR6dW9laHdwVEVIT2w0WEtPT0ZS?=
 =?utf-8?B?aXNnQmdpMjdVbWdHaVdSU3MyTjllTEhOVitINHFiK3JOVFpNamtjbHhhV2tp?=
 =?utf-8?B?cEVMclBveFo0Tk4xZW01c3RSdWg0Y0ZCcTc2NUlMVmM5OVozNHk1cG4zNlNJ?=
 =?utf-8?B?aDRLMWVISWdxc2FoRUdDT2d0dlB2czRqWXVCRzZjK0VYem1sYlJUMVBwektx?=
 =?utf-8?B?N0NrZkZSQ1N6bTkvcG9Jdm9rdmxDUFQ2SlRKck9RNWFhQzI2YmpiRmpUMkQ2?=
 =?utf-8?B?WC9LYUgxNWY3MVZ4eWNERGpzOEJoSTN6eFpwRGFiVmNhK0wwMkM3ZVJFbWE2?=
 =?utf-8?B?Ui9TdlV5eGl2cVl1blROMzdzYXBTVnhtUUx6TG9IemZqbTRGUXljRkFPait4?=
 =?utf-8?B?MFplMS9tUm5uWE8wcDlQMFFmMTVYWWtucnlaRU9RZ2lpY01FdStzbVZ0STV1?=
 =?utf-8?Q?Ecw8zu4zJ/x+8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZWaVRsMGoyQ3RqZHQ0UkZlek5nMFk3OFdpd3JycU1Pb3FOejNJNC9RK3E5?=
 =?utf-8?B?MmJhTDRENER0bERBekx4bmE3WXBJRDV5MDhSYTN3bkxaSHVvVmQzWktOOEh4?=
 =?utf-8?B?NDJjYjBuQjhjczhxT0dOYzY5Y3NvU0xjelBRdmtNYlhWay9vOWRmc2Q0RlFn?=
 =?utf-8?B?Vk42NU5rdWplcHdMSDJXUXVrYjM5Tjc4dk1yYWcwQ21YUU5iTGYyYUlrMzlJ?=
 =?utf-8?B?UXBxdzlVaWloNnBsYjV5bTVSeFJON1FEQnJIQ2orbXJMS29yQWxMN3lFZERH?=
 =?utf-8?B?c2hvV3pheHhGQ1BMUzFmL1Z5aHdvTzhwdnhkSkxMaWZFUmpOcU45YlI0SUF0?=
 =?utf-8?B?aW5xSEhHOTN1elh5WW11RzhSOHlNYk1DYlFYb3dyZjVnY0FWM3NrSEQ5aWx1?=
 =?utf-8?B?aVVQek5pdUx2WmVPTWtDVm44b1lnTFRIQThVYUlKamxmY1FzOUdBVEd6RTZO?=
 =?utf-8?B?elR0ZzREcjZ2NUFjb1BwSW9tVEVoejNsQzdTSytRa25WWFVRQ0pobGNwRkZ0?=
 =?utf-8?B?NEV3dUVkU0t3OEoxQnpsQkxzaXZvWFZMT0l6VSsvS0tGZ3UwSDkyL1lKWHVX?=
 =?utf-8?B?Zyt2dnN1M3V5cElGRFk4NXJ1bldOU2lzL1Jhc0s4THN5SW40MnpVc29hRUdp?=
 =?utf-8?B?d1VxRlRHSG5PeHhnelkxc3RaSG9uZk9VNTRsZlR1WkFXOHJjSU8xZy9vUExY?=
 =?utf-8?B?dEcrWWkrZzEwM0xZR0l0blFGRUU4WEVXUFErVURwSHNBTTJzYVYzTzNWZmxm?=
 =?utf-8?B?RS9SRytnUzZXbmFWdDVrcW0xMVltU1p2RHlZQUJweEE1Rk15eldPRFpOTEZm?=
 =?utf-8?B?UVB2dDkxUDZySTU3VzY2QTlyRkdxNUEybWJRRnlJeVZuYVZZQ2NWaTNYYnk4?=
 =?utf-8?B?ZVozQjRyaDcxL3h6aFJnWTRhWWFzVWxFSnY0OWFLVkc2R2xwUmlwOXhvUEI3?=
 =?utf-8?B?N1NzNHFpNTJ4MTlhdXp4c3dYTkZKd3dLRm1aaDE3YXE2UCtxYzBVRHNQT2lZ?=
 =?utf-8?B?VFdwRnA5Q2srRm8wb2J4SE9WTVh6YWgwZ1pueFdpN01EVUY5RFNxL2hGbmpa?=
 =?utf-8?B?QmNneGVyM01UbUJzaUtDaUNoaC9yYWVwU2tpQXFzYmtqNmxodGhiNmVNMUFO?=
 =?utf-8?B?M2x6WWZxL2Y5Ly9vRXFnZnZZek9tdFZoRUgxUExHMVVyVHRZVnJxQzJzejhv?=
 =?utf-8?B?SHB3VG9SWE1UVlppUXpTVFNzZThkV3lqRTVmOVBWcEJVbXJlQUkzOGgwdGUr?=
 =?utf-8?B?dno2ZHZ3bFJpTzFjR2dRd1lqRnNFMVhTaksvbER5dDBYUFVOSnJmUnFwZFl2?=
 =?utf-8?B?eXBxb3NxOVdyK09mYndhQjVWMXZLRjdOK0hhUVlpeXRHVERlcjdyRlgrV2Rt?=
 =?utf-8?B?M3FHQUJzQzZqT0NqMERMS0I0blZ3YSt1aWFCUDl0ZXV5OW55MHhHTitvVThn?=
 =?utf-8?B?bDdGMmtSZGFiYWhwZ2hzYUpZL1hDQ08wV20rRlpNWG82ZHZ6Z2NRVE5hdnJl?=
 =?utf-8?B?YzAxSTQ5NTFrbW1MR1ZuSmpsY2VKYm1qSTl4dUQrNjE5QU4za2dzN2lZODYz?=
 =?utf-8?B?T3JCYWJKR083bmJyZ2NJU0tkY1JJaTVzdXlOdy9QUGdrbk1GbWZwSG5ZVnM5?=
 =?utf-8?B?VUpUWHdlNituZ1VHUVRJM3Z6TG1HUlF1Zk9wazRxUllJenk3bm5LWWs2SjlC?=
 =?utf-8?B?cFR2QXJvbjd4V3VEQ0JsbnVzMlNKdDRDZnhZZ1lvNUE5cjBwTkpkRERMTVNv?=
 =?utf-8?B?T2w4OHRqdWdUaGVCV0Q0NjlQc2t2dlNteGE2YU1HdGhZV24rdEN0RWljbGk1?=
 =?utf-8?B?cmpxenFyQk1Qenl5UHl2UGljTXo2NXY3REdCeFk1RHM1Z0RjSjJUVTlhRCt3?=
 =?utf-8?B?NVZsWm45TXQ1OHhuKzgzdGozcHpmTFJMUEdFeCtSUmdpVUdtTC9oTmRTZ3Q5?=
 =?utf-8?B?eUJHc283MExjYStYMm9NVktPZnN1WThzZ0pPSDNkbUgrZG9LR25nWEZLeUQ1?=
 =?utf-8?B?TnZBMHorVFRjbDdLWHVOaTZ5V3RORTAwT3l2dWdabFlHVXRFRWd1bFhGbUlW?=
 =?utf-8?B?ZkJqcFZ2MTBNTlRVOVZvWlRPcXpuczdyZVZlVk5wK3J2a29raFM0Rk85bk5a?=
 =?utf-8?B?dVRNNFJqZlVPY01KOU5oQVVXWXp2d3Mra1BESDBLd2hReTlxUERPWEpPdDNu?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fac8fa-e66c-4f62-7af4-08dd54bfc5a6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:41:18.9344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lujXZ8SzUxttPPnb7tkZ4C0xRotZjDqxVzSG/B/bNeTIZ4UCAMR7s609x0MMJHIGzkZpTYS7hY+LwsC56X1SlHr4ZTNhBrgxgUFYyyxUHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
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

Hi Umesh,

> When looking at kernel ftrace output, it would really help to see the
> test start/exit boundaries.
> 
> v2: Fix copy paste error
>

[...]

> +	igt_trace("%s: finished subtest %s, %s\n",
> +		  command_str, *subtest_name, result);
You could fit this on one line.

Apart from that LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

Best Regards,
Krzysztof
  
