Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51752C28B20
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 03:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3268110E00C;
	Fri, 28 Mar 2025 03:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="STC4D+8q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7BC10E00C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 03:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743134297; x=1774670297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Uxfn4kWQWLqyad9gyYgh4JUd13T2mBV+6jrzr3oCC5g=;
 b=STC4D+8qnlz7nGeOtFzR26bs0vjiq8vvWQDjRg46e84Xxo6Ouht1Oo2K
 UF7Cor+6BIV0Lhg5aGXw5sFQ6YhWmsy+8RH7WxBK9wapDEVAb6km3gG1X
 3W+AFBBO1Cv7a7svaLCqAp6Zvc3xz/lF8vDOCB+BBKM1FFHFRF46fHb9b
 Uxz7+6QGgydyvc6vpp82IOyZ/KLiMfUxkx5LR/8nXN43fsYl47JbhI8sE
 GGxzNL/thJgd3rfO2xjV80Jpz9cactZ11dSmEeEiTAicHQOwUzvBeo4IC
 rUxPS3/jfSB6WVRjthY7MaSrAQkcm3PdltlBXreCRvaiB/j5oP4LXM+dg g==;
X-CSE-ConnectionGUID: WTmkEUc5SFGuGMse3agoDA==
X-CSE-MsgGUID: fF/AC9X1SAuUYdQsowRJew==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48271409"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="48271409"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:58:16 -0700
X-CSE-ConnectionGUID: Qxxgz+SrQQuTULZpN/hCAQ==
X-CSE-MsgGUID: zuFgCtBCSOmPWs9eTmPl4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; d="scan'208";a="130047433"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 20:58:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 20:58:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 20:58:15 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 20:58:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSaTX+NB5mljCoBKfU9Wf2KbGF7eFUB+PKqvg+e9gN+nxr4r4EIgKuvLR4INTbt4egSku79fP4EgnhrOrI0ZRc7QrMYDMF1X3Sf14LhXZ/p5yrbRhHXh9j2NVocKWESpzRENzzyn/y06nHr3h00ghncqGwY+7y3s7WSD4XhW/5tsO2o6XU0/Q46NXi55T5trpBAgIeTaXxY7rBRle2BCSN83w9XCKLD/Xv5xIm2w/0vzH8It1R6IIi2pJ0/SQD363g4wKxSEjaUmz3rP6Bj3sRK7oM7ooBGaZVNjrj7ZYmbC6QCpDfYyX4CxF/RYHw6tTXuRa90cFIszoUjK+6aprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWXHZ5+fLHxbeMRPrY6/pDiUiEBXjh/VUtmkykPEvkY=;
 b=QpZyeVHuT8U6UxaHqs0zs03hv9f9NRW+3qHNvgSrFd3OsXGi0jHCoGpjYatQZGClf7T1Za+b6W57m+1jW0YWGPYbfiIheEy8p90xUUgnPyVfc7iOz1dtEgeG20n1gCDZiPCCyZSe7FvCbhdCoWj+H+Wg1uLBwETjgQXFZ6rwiBggmjc9Z3AdmwzKc1s0Tg4BOv02iewhcYjhVCciAVTGzrqLG9/BVe4Xxr9iD//+mfNWYgRk5DVYBYYsjsbcBue6x9VNBMbu+OneuW6Z2/i0OwJV+KYL2ezzloK96djOhBGHbl22pXOTRycn+YyyhChHFE8IhgT6RSuSSO59tsNqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 03:58:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 03:58:12 +0000
Message-ID: <14e58368-11d1-4e47-9a8e-0d5d4d865cb1@intel.com>
Date: Fri, 28 Mar 2025 09:28:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: df1a1c7f-710e-44a9-8895-08dd6dacc22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjRBYnJzRjQ5Y05mVzBHd2U5MzJSZFlBSys2LzhRazI0bTJDaDc4U0dKbVlS?=
 =?utf-8?B?OVNXYjRtSUxpK3E4OVE0TzB2dFpXWGJ3MktCajNSSFQ1cDZMUmJ2Nnl4bzVK?=
 =?utf-8?B?L0lndlhQTnNJL3YrbWJsQVppek9Ya0prZTVQc3F6NGxTNXppTGl5VWg5UFlv?=
 =?utf-8?B?Yy8yRDYyRkZxM0pISlBYYlpsRndaeEptT01mL2ZCc0xsd3ZCSGp1bUFDVWVL?=
 =?utf-8?B?QXZIazlTRFlQK0NRUHlMNzJ2QjcrbXZxOWl0OXF3T0ZHMEljbG1xUE54Ky82?=
 =?utf-8?B?T0k0S1puSE8rZlI0VDFmdXByZW9IV2dCdXpPV0dYSDhUUzlFNmhyU2l3ZHE3?=
 =?utf-8?B?MVJOd3RaNE1Qb3drMHRDRnhFN1YrM3QyZ2xNaFErZHM0UzNCdVR0czVwbGY5?=
 =?utf-8?B?U0xnWkNmd3NaaFFtZXAxNlozdkN5K2t3TElrRWlOYVhJUzJ2dnVtTGZsMUpC?=
 =?utf-8?B?SlJrTnV6UForQXZHdGNNb0kzM042UkFQWFlTcS9GclIzaFpuWndESnM1bVdr?=
 =?utf-8?B?WS9DSFNJNjVlZ0xXZnhSTU03UWNXa1lFRHRQSkFQYXZyazZWdWh3ZDQxV2dr?=
 =?utf-8?B?aDVLR2dJMXY2UnhTOUZEaUNvTVVwK04yRHIyQktJUEdoUFloU2tWNkNnN0Ru?=
 =?utf-8?B?UU1Makl3aXl2bHk5b3JPQ29ucFZybGxPZktuYzIySUwreGZ3Zi9jUUZIOGpm?=
 =?utf-8?B?WXRlbGRUMnM2aEdzSjExa1dNN2ROc21IZ3M3SEF1OTdVVVp5cUpoWVk5TGJZ?=
 =?utf-8?B?RzA2YWZ5dzM3bklybUxlNWUzLzJTd2JKSk01YjA5RUUrUGhUVzMxdnNtOWcw?=
 =?utf-8?B?VFpRYUNpelZWMkVrSi9ObVovOGFVVlVsSWx0bDY3KzhJeC9UcnJIa2JjcVFH?=
 =?utf-8?B?dEJTTktpREs5SWJ5cC92QXdybXdPMXNmKzN1SVpjcmV0c0J1eW1iMnYvNlhN?=
 =?utf-8?B?NjJrYTQ3L0laREdMK3pwczJzRmNxWEI1TTBMZjB4MWFyWEFFRm50Z0g3QS9s?=
 =?utf-8?B?WFpRRUVRK1A0OVhoQlF0eVI5U05DbXBlYk9TSUJ6Y1IvRGNjdGE1TW05ekFX?=
 =?utf-8?B?SmRhWWFlRHBhRE84dGVjYkMzd1RiWm5Fc0U4ZE1LMTFobUt3Qm1wcmpzNXhq?=
 =?utf-8?B?YTBjNTFsc2tXK2tuQnJiRExWbmdVZnRQaGpWK2dwOVoyaU5iZHlvblRwTXhY?=
 =?utf-8?B?bVJLT1VCWkp3RUhPZkRCYU80K0tqSVNsSHVacjZZZXJxd3pEUENXcWQvdG9J?=
 =?utf-8?B?TkhQR210WURhTzJyU1o4QUdGKzg2V0dqeHZJcnEwZDRkYldJdHpIaEthWGRQ?=
 =?utf-8?B?bHFEQUR3MkRHZHl6LzlHT0d2Tkh6VllIWjFzby8xdG1EL3VXcUxZeG9OaTcy?=
 =?utf-8?B?WDlLT2lRa2lzNkZuRVVCWk5mdEZyS3Nrc0V4bkhoSnZPclFGajlGbWpzeUsv?=
 =?utf-8?B?N0Z5cldhNTZ2QllHTGhyeHVQbDMxUFFIaEVwbXB4b0h5eWYzc0hHcmJ6eThy?=
 =?utf-8?B?TC9WZDZsRnZvRDRoU0I2YmsvK3JiK1JsOXVBRUYyc1NFck13a1hxb1ZnU2M0?=
 =?utf-8?B?Ym9mV2IvVFBGSFB3N0lDV0dVZ1UxcndxYTl2dE5GZm5DRDZQZHd0YkRYanky?=
 =?utf-8?B?QWJQcHRNdkNBNTlTbkd2aHBWd2tDcFdrR3l3MkpCK0E2T3BWQ2ZwMHMrZTFz?=
 =?utf-8?B?M0VsajFiL1VCOG4wL1ZWSmgwWUNqOHF6NzJWeUNzQWtub3hVZU1hVW01bFdB?=
 =?utf-8?B?YkZxaERNaUNyQ210NGtyWTdpOC9kTncvenJIaC9jNWMrZnMvRWtwZVluK01S?=
 =?utf-8?B?VUcvbVU4eWdQdzdjZlFnazMvQ25GWW9iWk1HcVlicURBcHhaSmpXdUVZa3Ar?=
 =?utf-8?B?TmlvVndjbklicFU1VEtxK2l0THo4VnhQUW82aUkyMnZwUmFHRTF1N2NnMDlZ?=
 =?utf-8?Q?khRWZXH22j8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUJ6YjkzU3lmbjJpTm9zNXloQ1lWTE1mUjlGTTZGd0xNc1E0Nk9aNm1qM003?=
 =?utf-8?B?Y0NGREptb1d5MGNFalQ4UXhxSUlSUG5MMEkxOWVRNGdUQitpYnpTOHdTeUNX?=
 =?utf-8?B?TzNXU3Q5c3RJTDZnYkMzTThtbHB2WHZQVnliM2xzMU42YTRkbzlaMWtweTUz?=
 =?utf-8?B?QVRISG5QRmRvSXhEeWtnaENJTDhWRUY3V1VaTkpKODdsUTJKZnZLdXdyc09I?=
 =?utf-8?B?V1dwbTJya3hEWExKeTZZbmtES0N2cUZwcmJYWmZ4Q01RRzgwVWx6UitraGxu?=
 =?utf-8?B?VVZGMVFMNlhnemlqd3k2QjRyMlhGYjMrNjl6NXplM2hsdDlTS1pHZ3Vud3Vv?=
 =?utf-8?B?L3hPR3JOZTlxbHplWG1adm9wZFpVYnd4dnozUXBrN3dHYzRUaG1ZM1FDUU9x?=
 =?utf-8?B?ak9UTHJPZ0l1bmlTR0JYamFudnFybVZXck8xQ0pvQ1JMY0VrVEJkVTAvdHNU?=
 =?utf-8?B?RzBYUUdsWVBlYkNGOEdpRG56UVgzQndDYUZ3VEYvL3JrT3hiRlRncHlKUExr?=
 =?utf-8?B?dXZOTW1YWnhVZ0ExQXlKOUJGK0xMK0hIek5kdXc3eXFmYXY4L3YxVkxJTnkx?=
 =?utf-8?B?ZlBHenRocDF0YTEvRkw3Qk51aEtSTk9IYnArcXQ1MVJkcFA2VXpyNXAwMExJ?=
 =?utf-8?B?ZTZCTUFvSC9BMGZJckpSb3hQYzMrWkR3NU44SUFoNWpUVzc5U0FZOFNBVXVT?=
 =?utf-8?B?Q21XR1hDZlFOcTUxMldqT0FUZ3JXNUhjSHZjYjhSdmorTmpmd0EzYnlMenBy?=
 =?utf-8?B?YkFnZ1VZamtGTTc2N25nOC9pQTRNTHNGQ0F3Rk1qMStDaDc3b3FtS3VuWVhK?=
 =?utf-8?B?S2VPVkM4Ukg0T09Qd3RWY3hmZkovSTFsNXFNd1I3L1JkSjFOdDZKTDhyb0xt?=
 =?utf-8?B?Mzd4UFNlTkJXOVgyeE5QRkRDL2ZtTjF5ekwzQjZXRVhsRFNPOVZLQ3ZFbTZh?=
 =?utf-8?B?cHJ6dHYvRUZUYXJ3b0xLdWZtOFcvckNDSzlVc0FMUm1vWFRNV1RZaWQ1RXY1?=
 =?utf-8?B?Unc5cDRSOERGR2Z4QldBMllLK2lnOFkyL3dpLzZPdGt5dUhlY3NTdzZSWlRy?=
 =?utf-8?B?amE4TUh0UkVxK1Z5NEk5TnBrTC9oYVgwVWpSYnhRMndocjFQOTh0R0hMWWtB?=
 =?utf-8?B?SzJOMGFpdURTUEs3eUFBcEdOQnhMMG9ZSkpseGd0Znl2OTRYYVN2V0M1VURT?=
 =?utf-8?B?WU9hRStCbGhlVUlmQlZ4cWUyREhBWWhTdW9zVmJLdnY1d3RLSjRGUVBwQkE4?=
 =?utf-8?B?V1pXVWJjOEoyYVdsRGFnams4MXRrZnB4ZjgzZVQxcXZkQ1E0cDhsNGY4V0Nl?=
 =?utf-8?B?RlJ3NVFpMzl1VG5XeUVscm4xNEdtV0hqYnBkemVVOUxEc0IwcC9KYk1VMHBn?=
 =?utf-8?B?SGQrRFplVlRpYUVoazFDNlJDS1JBSDM1dXVTNFYxSUZmUllnVDQ5OTFNUzZR?=
 =?utf-8?B?czMrbEVzR253ZlZ5OXp6d1U1bVdGQlI5TEJJdkVYbERoY200b1pzVXpJODNQ?=
 =?utf-8?B?Zld6T0tGem43blZqQ1EyQjkwWE1ZbHZFVmU4eHU3czllUE5uMndmQXpHbzJJ?=
 =?utf-8?B?UjFjditLRTUvbUZuRWNiVDk5M1pyRThLNjJtMGhZOXpiWjlkRlFtTzBCakln?=
 =?utf-8?B?dFM4V3dKejBNeUVxZ3B4cmltRXJXOGRiRDNLS2hyUjVpSXZ2aHNlYXpGZ1d6?=
 =?utf-8?B?ME5zSEp6ajZ1MEovdTBDd2dDckQ0b1JDbWtXT0xTMnZPTE4yYnRlZHI5T0Vq?=
 =?utf-8?B?bWc1Y01GT215SzhnZEtUWjRUTTgweVE4azVHRTZVWnFuOVM2c0pnaEtHZXc0?=
 =?utf-8?B?SUNsYlVqNTBIV0s2cWYxZEMvcC9jbldEZTF6RUd5cloxK290UlozWmtEL2Jl?=
 =?utf-8?B?MjlwSk52dWJkQ1V5dnpsdWFudHdzeHJTT0xZczNYNzl5SE45WjArU3hiNWc2?=
 =?utf-8?B?Uy9aZ1ZnVE9wY25GQlMwUEZ2bU9QazBDcllGaW92eUdHU0dLejF5QVJqKzJ5?=
 =?utf-8?B?NFV1V0ZnMnUxOGpOYTZabXh6MXhkK3ZnclFVTythM1F6c3NybmJSbzNuTUVk?=
 =?utf-8?B?RFByckt4T0xFbVJPRDNPdFNRK1UrSE0yVEtJcG9KbkpaWWRtcWg0ODJjZU5n?=
 =?utf-8?Q?ztYWcA/iWfsWUW5LPELhS8YSU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df1a1c7f-710e-44a9-8895-08dd6dacc22d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 03:58:12.0316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrGJoxBullbPef3TeHGchF5GshRMFBajyJrhf2obnhvsdvzXPsZE7JLlXtFmYGXkqVPjd9s0UnxpL5IR67Sf8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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

Hi Santhosh,

On 3/24/2025 9:43 PM, Santhosh Reddy Guddati wrote:
> Add a new subtest to verify async flips does not cause PSR exit.
> Enable PSR and execute async flips to verify system remains in
> PSR mode after async flips.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index da426f753..cf6b63b3e 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -85,6 +85,9 @@
>    *
>    * SUBTEST: async-flip-suspend-resume
>    * Description: Verify the async flip functionality with suspend and resume cycle
> + *
> + * SUBTEST: psr-async-flip
> + * Description: Verify that async flips do not cause PSR exit
>    */
>   
>   #define CURSOR_POS 128
> @@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
>   
>   typedef struct {
>   	int drm_fd;
> +	int debugfs_fd;
>   	uint32_t crtc_id;
>   	uint32_t refresh_rate;
>   	struct igt_fb bufs[NUM_FBS];
> @@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   	}
>   }
>   
> +static bool psr_wait_entry_if_enabled(data_t *data)
> +{
> +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
> +		      "enable_psr modparam doesn't allow PSR mode 1\n");
> +
> +	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data->output);
> +}
> +
> +static void test_psr_async_flip(data_t *data)
> +{
> +	if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, data->output))
> +		igt_skip("PSR mode 1 is not supported on this output\n");
> +
> +	psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
> +	igt_display_commit(&data->display);
> +
> +	/* Confirm PSR entry before starting async flips */
> +	igt_assert_f(psr_wait_entry_if_enabled(data),
> +			 "PSR is not enabled before async flip test\n");
> +
> +	test_async_flip(data);
> +
> +	/* Confirm PSR is still active after async flips */
> +	igt_assert_f(psr_wait_entry_if_enabled(data),
> +			 "PSR is not enabled after async flip test\n");

We need to be using the 'psr_active_check' here directly instead of 
waiting for PSR entry as this contradicts the comment above the check.

This test will mostly fail once we have that check async flips should 
ideally trigger PSR exit?

Thanks,
Karthik.B.S
> +}
> +
>   static data_t data;
>   
>   igt_main
> @@ -748,6 +779,7 @@ igt_main
>   
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_display_require_output(&data.display);
> @@ -896,6 +928,12 @@ igt_main
>   		run_test(&data, test_async_flip);
>   	}
>   
> +	igt_describe("Verify that async flips do not cause PSR exit");
> +	igt_subtest_with_dynamic("psr-async-flip") {
> +		data.atomic_path = false;
> +		run_test(&data, test_psr_async_flip);
> +	}
> +
>   	igt_fixture {
>   		for (i = 0; i < NUM_FBS; i++)
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
