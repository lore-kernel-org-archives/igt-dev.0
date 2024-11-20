Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DECD63926
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 10:53:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E9110E701;
	Wed, 20 Nov 2024 10:53:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VwLxXrET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3201010E700
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 10:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100013; x=1763636013;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=XNz1aZqIhEtf3UtFz/J9tPcKj2aFb5+yR7LRhsLflR0=;
 b=VwLxXrETLk4XnJci+z7+dXGUdWhlprtwaLK+fuFL+4iwUohHQrJEUiFU
 t+ZFUzF99pqCmlXjTfDmWZ81oZpImwT40VDf9MCxheRT722v58kFZxneU
 ZWZuliQCK3vJYEAhuFQhUXXtG5R8HX4IwOBTUvi7OJiB3kRGybxx4PFlC
 VPu2FKGEw8Q6WWfe6P+jRy5jpISdu9JLIR340hRFqOMIYvzNtulExCR5E
 /XypSmvY7V4wdfX9iwxKJS3z8pr3jeo9/TliJCzO5BoELJI43sZaZIVMx
 t0eOJRE2xoEjU0IlMoybw8VJNKq11u1up+RxRq1AsNLJMeP63xaCEuvfK g==;
X-CSE-ConnectionGUID: oU8Mv1DPQXG2oylHK20XkQ==
X-CSE-MsgGUID: WjCnZWb6RA+99hafEaLGlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42771718"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208,217";a="42771718"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 02:53:33 -0800
X-CSE-ConnectionGUID: l4rYCdf8TTq13rEX1TisZA==
X-CSE-MsgGUID: tUl8J4veTu2B9+yGKGalKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208,217";a="94941034"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 02:53:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 02:53:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 02:53:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 02:53:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvIhwv+ddp03HYXN5466Eo+iOfLLlHk3ndLah9MM8TZX1S2SJRwCRY7hWeJdFElcUaeUBdjXqSM4TaDg8T957e/z5IxQEDE0ehy3r19Mf7t8BEkqCZRnDbUOD5XStVf/+qmcVMjTI0gZ/DA3yOjqi+AulsnzBvktNuj3kYVjmJhggtemExhELBLxWNbHAZ2+oaMprDDQijgvoPqZybdfOaaTStHgD9iVJmF0PQLOOcCCpix19ZbRapydPmTzzE7NHx8afL6LmCVRUmaP8NiTW6uDoEXp7SjYSFzK0/nZNUkt6vNfPNhWzqDeCk6zXpmtHQCQp+KttaE0XIiaoMjlBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4WV9FsZJdy+nASyx+4PloEekLvUpj2dPwu0MipQp30=;
 b=L/WixcY/QZRbXoBR6kXstprWFvhJYXPoyG2BgN90/sY19+SWgFDNpUUuZ5ENosrC8FpISvgsjrBuGWYtz3aCyCSrFcez3JsaAuuiXTr7SgKJ+KTG15pEuiNB2eR0FO9y2+aRddn5G3q3QKN3YWZe3NvK3EOZfz3laxc2+Hqz+9VfplKPsdJ4vzOvlKmWAH3ATlwmjgYv4AxE8ICE5QRoTLJiwA2QFyi0GAceVPCQvg/kNwR5OHPc8gXjZyyJIMu3b+GfuKtTtECdu3zbZUqVvk4sTEEwfZFvu5JM0Dt/M/wDWOEn0KlBg2UjBrsc8eQNQ5HSVxB1GTCqpE+D2P4Gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by MN2PR11MB4584.namprd11.prod.outlook.com (2603:10b6:208:264::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Wed, 20 Nov
 2024 10:53:29 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 10:53:29 +0000
Content-Type: multipart/alternative;
 boundary="------------dyHMO5Yd0D1oGLiB0qh48M8E"
Message-ID: <a0865a0a-40ad-478a-b930-f67e73676b82@intel.com>
Date: Wed, 20 Nov 2024 11:53:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/3] tests/xe/xe_sriov_flr: Improve clear-ggtt
 subcheck initialization
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
 <20241119155538.605000-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241119155538.605000-4-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: ZR0P278CA0166.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::13) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|MN2PR11MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: ecca6505-34ff-4d84-efd3-08dd09519162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aFg0VWNXenJyeXo1Y1hLak1vV2NZVmdmZitOWkkxNGhoSG5UL3h4YTdjcS8w?=
 =?utf-8?B?YUUwQUJDNmdVNmFCZTVIUXE0dkVXQndncUtoYWtsVGF6S01wUU5WalFTZ1dn?=
 =?utf-8?B?WnJjc2twZTI5TktKV3JqTWQvcHM1VkJ6VHpKQS9NeGZYM0FMT29SMUE3K201?=
 =?utf-8?B?RXUzWnJSc0U5MFU4UnpmY2ovUDlKVjZndGx3R0ROSGlPUVZPYmxKdXZTSmRq?=
 =?utf-8?B?Sld3L2s5YXhzUXppRTd5eVhSa0xiTCtsM25TT3pCZGErazJTS3BPMlpGSnlQ?=
 =?utf-8?B?a2MzcFNSWnY1NWdHclZIMVgweG1teWpRTkUzdWMxU0EzeVZURnIwTkFUV0h5?=
 =?utf-8?B?TlNBc0lQSWljREtaaXpreUNpOWE5LzhvVFZRYjlqaVBqUzVEL2dneDlUNDFh?=
 =?utf-8?B?endCMWt4cnlhM003Ynd1c2M4Rzh2WFdJWDFlNWpzNmFsY1NhZ2VDNDdZbGd2?=
 =?utf-8?B?eE5HQlEwbWNsOFUycE5wUkVnY0NkUEwvMFhXRE9ySnE0Rk1XdlZsMml6Yldj?=
 =?utf-8?B?T1NEUXIxWHYwaXdlYnZMNU9RdjZWdEo5RnFXdnRralNBaFM1eGZvL0x5SG5I?=
 =?utf-8?B?S0V5OGlBT2FOOWJyaUdpN0psejZMbi9FOFFQTHgzMWxwdTFxWStPWkVZNGpF?=
 =?utf-8?B?a0ZSREdCT254elYxcEM2WEQyQUYwWitKUFJ6R0dtUm5oRDRESHdYSXh1dzhS?=
 =?utf-8?B?bVZkZEhrUnRacWZ2dXpMbC9HZ2tjcFZKRVgzRWdLVDJUZU5ScHNWMXltWXhh?=
 =?utf-8?B?TjlaNCtmQzNqZWpzZkNDL2NpdWRVb3RDMnpEb2srRitPTjFZak5sd0VjcUFD?=
 =?utf-8?B?b1hhY0p0S00yUzl3YXNoelRTd3ZYWnBFMDRhVmRkaTNMaEhkNk5uS1ExQU9s?=
 =?utf-8?B?QlhsNW11eDZaVWV6bXFxbUE2NVhxR2RTSjRyOFY5eEgrWFpPZk02NndvL1VO?=
 =?utf-8?B?dHhDeS9IL09QZy9hUVI0eHR3RGNNNUNaN0xXSXE1Q0ZTNzM4UnZjaWdQb29Z?=
 =?utf-8?B?RWR0WmFJdmxrSFZyR0hPVnQvNnRtUTJ4OUxEK3JzM3NvemRXbFJSbGJ2eGlk?=
 =?utf-8?B?L2xNQlNXVTNSZi9jbDJ6Mk1HS0hMMTZyelQ3WGR6bmg1aHJ1Zzh3Q0ppdjND?=
 =?utf-8?B?QmZ2QStaMFVaVDJNQm9VUWhCMkZZRDJaeHJPUnZsR2JIUDc3WHNnYU84anVR?=
 =?utf-8?B?RTlCc054cmNtNlNnQ25FdHYvNWlUcHh4ai9EdHlqa1RlUHcrWkg3OTB1RUdj?=
 =?utf-8?B?S0poL1RqbDZUWWV2aXhacFBqeWJuSkwwd3NkeTlKY3B4NTRkV2dYbElzSE95?=
 =?utf-8?B?TmhKbkJTeVlQU29qVWhLdnpzMEFwTkh2TXNnMzN6V2RTNTZkMFE4T0c1VHNJ?=
 =?utf-8?B?a0NYSjhVTjhEOVNqSFd0bEVJejl6RHk3bXk5SHkyU2E0d24zU0JHNlpTRldu?=
 =?utf-8?B?UXcxYlFua2JFTXRndWV4bW5SWjY3cWVVUTUrMWl3STNPYUp3YXU3aE9vbTY5?=
 =?utf-8?B?UVZwN1FwYWprdHA4OXZKZTN6YlUzUVcwVEwwM0svbnlBOFRDcG5RM0xHelNr?=
 =?utf-8?B?SUF0Z0dtWjdOWEpDNWN3Wm02QktWelRvMGk2Y1R6VVNNbmZKT0xDWkxOdzg1?=
 =?utf-8?B?Z20wREx0OFlGMytrMXBjVDN6TDFLelBhQnhRTzJpb0xRNDBBYitoMnozYlcx?=
 =?utf-8?B?TjROYk9LNytxeHJpR1lBRDE3M3lCMW1qVFlpRXVtYkNmaVJ0TlQwWmlib3Fi?=
 =?utf-8?Q?MPApOZW6+r8yRDyEb4TOrSMn3clZ0smkIKJW6Ot?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1VCWmg2UUVLMEd6Q3pLSytNa29OUElYaFJLWXpMcXoxVUNNSXZkRHFhYVR1?=
 =?utf-8?B?YXB0dmVkR0hTZ3g2cFM1VGtjN3Q3K3UwM2czcVc5emN2YmlLSUJod0xIWjNl?=
 =?utf-8?B?ek5yWm1VcnlPQld5RWVSN0dJMUVvaDkrUTBZUlRISGV0YmVnWnMwK1pqbUlT?=
 =?utf-8?B?ckFFdld0QWtZSGxJZmZzMnVISnZ5bk43K2d5N1haQVlETityQ24rdkJFSzlD?=
 =?utf-8?B?NnF5VXNhRzNHdE1oOHd5bzZ2YmE3VDRYdE54cXZ3RHh2QmVvcmVMRUUzSXkr?=
 =?utf-8?B?aHdBckhPcDY3Rms2eU1nUm1VQ3pjeUlEZ0JrNmljNzJnNXdNOGJjdnBEQzNR?=
 =?utf-8?B?VUlPZmxybXFxUzRrTGNWVmp1Ymo4Sjk4UFNOQ21kNHZBY1pRTmZVRXVWSWti?=
 =?utf-8?B?d0dxMkFKUy9vR3FyTVpJREJpajVXdXNJbk51c0tPcjRmRkhjZ1JDblNyVm1U?=
 =?utf-8?B?RHFtVGx3bXpZNlNnZk5GMGRsN0wzbElDckFrVUlaUFZsTWxqR3czY0wwRld3?=
 =?utf-8?B?dlFqZDAxZ0tEd2lDOGkyZ0ZoQk1iRG5sVHRVQUk3Q2RxVHhkZkRBMkgySVVw?=
 =?utf-8?B?SzF5a1FUUStWb3h5TjdNOUszd1gxL2FIQXBuam5teTVGSU83T1ZXM3c2bHpH?=
 =?utf-8?B?ZkFLOHZ1ZE9mU00wMjhYYURlSkt2UnN2ck85Q0FLTXo1dHloOENCdGtrNE1o?=
 =?utf-8?B?YmdJM2d4OGNJUUs0NVJIUWNFVWEwZWNFalpRRjNHZkZVZ0NRYllCTi9RUlVK?=
 =?utf-8?B?UGtQYXJEZENMS1czTXZiQ2oxeTYxUWRmZlFuOVNUQ1RuQWxmRk80MUxEMUI4?=
 =?utf-8?B?QnZSdGZPZ29Kdkw2NDJiUlNzNlpqWE1xaStQV2lUaU1aRFVyL2M3WnJJUllk?=
 =?utf-8?B?QVg2TjMrNExONXZmcmFic3hPTHFKdmF4UEM3Z2VLYzNtVzlkcWk2ZWdvU2M5?=
 =?utf-8?B?YlJDMDJPSHRYWjhndzZGODlhQmZCTUNIRHFWQzF4RkxwUTVEaW5RbU1aNkJE?=
 =?utf-8?B?YndwOXVpU2ZBTVhYa1pOSEoxK2lScVJ3bUJLK1h4MnFVcnpQK1dmQXVJTk5O?=
 =?utf-8?B?MkZ5YUtvcEJVTnNaU0dNd1NyZEtJNjdZZ2pMMEdaSlB0clY4VWJ5cXBoRWpu?=
 =?utf-8?B?OGlyRkcyRnZLQ0kzOXp1L01CWlFwU0hNalFWRzMxUEt2TWh1aTlHU05wTnBQ?=
 =?utf-8?B?MUxFTWVXQWoxZkp3eFllWEg5cFQrWC9ZNE1idjdrZmtoUWNkOC9lT3NRQkxB?=
 =?utf-8?B?VGUycUVHRDBRYk5abDVmSlY3Zkl2Yi9PS09sUXhpVU5LL25kNTZ5NXNOcWht?=
 =?utf-8?B?U2hlMUtpOHY1UkNCL3laUFRyWE13S0Z0SzlNTUpzMzdUVE9NZTVDWVkxQlcz?=
 =?utf-8?B?RkZvbFhycFpYZHV1aWZVVHh1Z0M3R1ZWYzd5UWZqYklUOEhBN21CYVNGSmJy?=
 =?utf-8?B?ZFZPTHpaOTdRcjNVTXpPcWhyYWUwVU16czJlZ2RkOGJRaTM4cjNMV1psU2NP?=
 =?utf-8?B?UDJZQnpKSi95RXVuTy83aGZPYTh4T2NSVUFIQitkck5Fcko3elZvWjYvb2NK?=
 =?utf-8?B?T0wzNVpqdURNMFBoVlBNcmVQMGwxMEw3ejB5U29mUEp5Y3A4bEtibHBQeURR?=
 =?utf-8?B?SUdXUkdnelVLNDUzdkhGMmRwajlxS0NqRzZnUFVuRmVtanp1b1VGY0Z4T0dE?=
 =?utf-8?B?aEdqdVNuYnJ1WHd5VTg0Y1ZZREp5cDhFSWhUU1c0NWRTR3VQOXVpR2tBZStJ?=
 =?utf-8?B?TGdNeUxMZ0k1S1NLc1ZZSTY2VU9FZjU0ZjY3VkprOHV5YW9xcVhzVlB5Slc5?=
 =?utf-8?B?dzdRM1phUFpYeGVLaFpHWWtidmtsV1Q5bTBtQzNiRzI0NEZ4dFNyWXlSKzBj?=
 =?utf-8?B?WmhIbXl2UnhlaEVIazFKRzBwV29LcDZPWXpjT0trUTlkZEduOUVBVW1EOE1L?=
 =?utf-8?B?K2VaN1lBMmo0ZHduYWlJNjJydS81dU9ZWVdlUWtWN0RKckUweDZObW8vQUZu?=
 =?utf-8?B?QVZFaFY4OWdWeWlFaDZPYzlQby9TeE82ZDhlTzRtS1FMeWtKWnRQaXlEUEMr?=
 =?utf-8?B?Q0ZhdE1QZDNaSGZBL3pWdUZtU0RHQm1TMk1FYVBrejl1OTVadVpTMWEvazVl?=
 =?utf-8?B?aVFMeFJrWmlNU01yRzF6OGRnTWNwVUhUQ1ZOTGNuUjcrckI5dks0UEtybDRN?=
 =?utf-8?B?WFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ecca6505-34ff-4d84-efd3-08dd09519162
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 10:53:29.4664 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXknKfFxibeCKloKGpyA1miW9j2W1bKkWB1NjaPVFKzIWyeCOxkIa9ef4IKnfOSXJkA7no5VzzoP1AfL5HrrTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4584
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

--------------dyHMO5Yd0D1oGLiB0qh48M8E
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/2024 16:55, Marcin Bernatowicz wrote:
> Mark the ggtt-clear subcheck as SKIP when prerequisites, such as scanning
> GGTT provisioned offsets, are not met. Asserting in these cases falsely
> implies that FLR is broken, while the test has not even started.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: C V Narasimha<narasimha.c.v@intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana<satyanarayana.k.v.p@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 1049cffec..502691765 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   		if (vf_id == 0)
>   			continue;
>   
> -		igt_assert(vf_id >= 1 && vf_id <= num_vfs);
> +		if (vf_id < 1 || vf_id > num_vfs) {
> +			set_skip_reason(&gdata->base, "Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n",

nit: Unexpected VF ID (%u)...

> +					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
> +			free(ranges);
> +			return -1;
> +		}
>   
>   		if (gdata->pte_offsets[vf_id].end) {
>   			set_skip_reason(&gdata->base, "Duplicate GGTT PTE offset range for VF%u\n",
> @@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
>   
>   	for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
>   		if (!gdata->pte_offsets[vf_id].end) {
> -			set_fail_reason(&gdata->base,
> +			set_skip_reason(&gdata->base,
>   					"Failed to find VF%u provisioned GGTT PTE offset range\n",
>   					vf_id);
>   			return -1;
> @@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
>   
>   		populate_ggtt_pte_offsets(gdata);
>   	} else {
> -		set_fail_reason(data, "xe_mmio is NULL\n");
> +		set_skip_reason(data, "xe_mmio is NULL\n");
>   	}
>   }
>   

Looks good overall,but I see that we still fail in case of other 
prerequisites not met (LMEM, GGTT write/read, no access to MMIO, etc). 
Maybe we should skip in these cases too?

Lukasz


--------------dyHMO5Yd0D1oGLiB0qh48M8E
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/19/2024 16:55, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241119155538.605000-4-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Mark the ggtt-clear subcheck as SKIP when prerequisites, such as scanning
GGTT provisioned offsets, are not met. Asserting in these cases falsely
implies that FLR is broken, while the test has not even started.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: C V Narasimha <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: K V P Satyanarayana <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 tests/intel/xe_sriov_flr.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 1049cffec..502691765 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -393,7 +393,12 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 		if (vf_id == 0)
 			continue;
 
-		igt_assert(vf_id &gt;= 1 &amp;&amp; vf_id &lt;= num_vfs);
+		if (vf_id &lt; 1 || vf_id &gt; num_vfs) {
+			set_skip_reason(&amp;gdata-&gt;base, &quot;Unexpected VF%u at range entry %u [%#lx-%#lx], num_vfs=%u\n&quot;,</pre>
    </blockquote>
    <br>
    nit: Unexpected VF ID (%u)...<br>
    <br>
    <blockquote type="cite" cite="mid:20241119155538.605000-4-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+					vf_id, i, ranges[i].start, ranges[i].end, num_vfs);
+			free(ranges);
+			return -1;
+		}
 
 		if (gdata-&gt;pte_offsets[vf_id].end) {
 			set_skip_reason(&amp;gdata-&gt;base, &quot;Duplicate GGTT PTE offset range for VF%u\n&quot;,
@@ -410,7 +415,7 @@ static int populate_ggtt_pte_offsets(struct ggtt_data *gdata)
 
 	for (int vf_id = 1; vf_id &lt;= num_vfs; ++vf_id)
 		if (!gdata-&gt;pte_offsets[vf_id].end) {
-			set_fail_reason(&amp;gdata-&gt;base,
+			set_skip_reason(&amp;gdata-&gt;base,
 					&quot;Failed to find VF%u provisioned GGTT PTE offset range\n&quot;,
 					vf_id);
 			return -1;
@@ -440,7 +445,7 @@ static void ggtt_subcheck_init(struct subcheck_data *data)
 
 		populate_ggtt_pte_offsets(gdata);
 	} else {
-		set_fail_reason(data, &quot;xe_mmio is NULL\n&quot;);
+		set_skip_reason(data, &quot;xe_mmio is NULL\n&quot;);
 	}
 }
 </pre>
    </blockquote>
    <br>
    Looks good overall,<span lang="en-US"> but I see that we still fail
      in case of other prerequisites not met (LMEM, GGTT write/read, no
      access to MMIO, etc). Maybe we should skip in these cases too?<br>
      <br>
      Lukasz<br>
      <br>
      <br>
    </span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------dyHMO5Yd0D1oGLiB0qh48M8E--
