Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22AFDCE8E63
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 11:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1D910E904;
	Thu, 24 Oct 2024 11:27:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ra/eCK7t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFCC10E904
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 11:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729769256; x=1761305256;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p9mvGplT0og/RPsNKAXufaYquSaH8Ld9d3Jv50GlTqA=;
 b=Ra/eCK7tZeFoHxd5+UPnBedZHx/n43yxqyALmGYiVc+ENqllaEWRM+YM
 SX1CuhLSIMFGMtQ3g8l6TtxxwtAEqCnT22RNymrcTMg2p4jFt9hxoK8WU
 huH9ZaudfMJd8iurygy94w9/UHOcRbMkxw/LoXMUXArEEp9QET1SdVuie
 Jv8HIf33Ky2Er6gZOy1LMV1WYsn+a9tREfx6Yz/sSPsGUCCvoR7cGamaJ
 0wSxUkdZYlU1XohaQ/ITisK04GSSQRjJDHP3mvoxT+VwGN+Van6/D3gyf
 JsL7ZJcR0DpePo6gypqdb8YbclGFI6sUVzxQcwn8iWzu4ih0IP8Bcr1r2 Q==;
X-CSE-ConnectionGUID: qOtCsqMyQvSoJQYsjUC5Rw==
X-CSE-MsgGUID: DjLpL5v9R02Q9sXYqzXVyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40510526"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40510526"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:27:35 -0700
X-CSE-ConnectionGUID: zromJfgPQd+Q78WFPDSFtw==
X-CSE-MsgGUID: +6pyh//gT428Kfq2K/o3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="103877520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 04:27:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 04:27:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 04:27:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 04:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNXB3mfdMO9TeXWskTD/GIf+WgTuA+je5DLFn9K6SXCvymkPw1MEfOWWuznxAuOWYqg6j+rxO2bo9uKeZ12ed4eRHC7WjrgEAxHQL2w+RoP///6WnEFnb6bsXC+Zmpl+Vof+X8mGDZgBV95Xd61HiEu+5wpzs5C6dMi/VHD8pHbjy6+ZJWhLD6XV1cZ2Ux7UDHpTGxUcdf6meCGIulJrI6qb3prUkIiFPkcFMJsnOdcCga26skhrQy3PlM1jH5jEoduJkzq5oRKNuosis+Mv0zc6N3Ygc1a61n7TL2T9WBVKgO0W9yD7rXbMTv78USen9tyy0nOYGiUrczNpmE1Oug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OyFHKuKoNt6SHLkqAdps3BZf+WQbGLnmzv1vDQO788=;
 b=dnySilmZYlqlhgntVTyJv/Kt3M9SL2C6qltQG0cbv3QXpS3AGYhc7IH78fl977PM3C2mqSpSZh0SLyVwDAEKN5ddEyJ4Bs18pB90mATI1gOhbTmPYGf7nLylRc9fUJT2tF7yMSYmb/nYPZsLPUNUs1kafF+rN/AJH3ioJIDnp2UH2xcB7QciEH4/F2cm5htIy+SMI1ZMoEkzucIWnIkoZLu/FAq4kaJiHIcMRsK5CxOfM0JvuY9CDdDmAcUK+ibv5xMaGIqZ1JeIFawTIjkgpCP9OoABIIr4+ms9seuf89luu1KaG4RmpBmwSZ0QoCVUdiVOVDMtrhMNJBCEbF5xBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6737.namprd11.prod.outlook.com (2603:10b6:303:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 11:27:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 11:27:30 +0000
Message-ID: <ec77c198-18b3-4f90-8873-f7aeae7af30a@intel.com>
Date: Thu, 24 Oct 2024 16:57:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/psr: fix documentation
To: <igt-dev@lists.freedesktop.org>
References: <20241024112011.1387980-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20241024112011.1387980-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6737:EE_
X-MS-Office365-Filtering-Correlation-Id: 2877045b-58e6-47ee-c1fc-08dcf41ed885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXdlRnAxdW5IdkV0SHlpdUloK0crKzZMT0QwSm1sMkJqRjExVU41alU2L2xM?=
 =?utf-8?B?S2hLMjF4MEdGNjEzMzZmM01BOG5kUStoa2VLZzRqWG9rYnhIdGZPeDQ2b0NC?=
 =?utf-8?B?blFNWnFQaDZKMk9mN0ZwSG5GVGZiQlRiaXl1NHJIM01lbTNYNWN6Q2x5UHlF?=
 =?utf-8?B?L2s3dis2bUc1LzNpenp6YUg2VGNOeFc0Szl0TXNleVF6ZUFwUk1mQTdCSmtK?=
 =?utf-8?B?SXE1djFncFZ4UEg3Tm9TYzF4OFE2K2tmeGo2YS9GbXhrQUo3ME9odkxvM29F?=
 =?utf-8?B?M3YzWitkM3MrUERNVUZHM0VVM0FSRllmUUJGbm8rcDhOWksrSTM4ZmRyak5V?=
 =?utf-8?B?aXhIMUNuYkhaTzRNbm80WE1wSVEyK1pnWS9xbnJPOUVDZnBhM21JSWduQ05M?=
 =?utf-8?B?a1F4RGdER09MOS9KQmZEMmlsTzRNcDZqSlNiNmsyVlo2WkM2ZlpWQmhZcldX?=
 =?utf-8?B?aXZaZUdsY3VxSXBNQ1gyMXRNRzFhNEF4Q054Mm5nWitHWG1GeHpyYTVvUmR4?=
 =?utf-8?B?a0w2dGo2V3BBUXQrZEwvVURWRVlIMHRXVS80aHUxSldMMVJTVFo2MDU4ek1H?=
 =?utf-8?B?RUdUQ2lmTFQ3RkRsUFhJTGZnSVdPTDhGWFVMcTNBOUVJeC9jdU5INWJMUk5U?=
 =?utf-8?B?OStxN2U0T0dHc2RXTEFTc2RISmZBbERkWjVxdjc5RHNhcXZqb2FOcXk1RXQ4?=
 =?utf-8?B?VTRvSW9qSnRKaTcydXdtS1hoQldmQkFuRGw5M09WMkxTMjladTJlYnVyVHpv?=
 =?utf-8?B?NkFlNDM0Ry9TUldsOURWNGdrdllRNHV1K29QZTkyTmM1ckFWOFRxRk55MWhI?=
 =?utf-8?B?ell5SktGSG12NmhoRWE2Sm95ODNJOWg4cnFwYUxtblg1aEhyanFDWGFrWkFq?=
 =?utf-8?B?c0IrNjZ6ejUyNTEvMU9IdzQxZFFmeE45S0l1YnQ2eDIwYmJCMUsrKzJlOW9m?=
 =?utf-8?B?QnN3RktXWVE4cjkvT3BqK1gvSGdMa2pSbE0yRWlpelNHb0twdGVkVS9BMjln?=
 =?utf-8?B?cWxPdUhOOWE1TXlCaEZVb0FVb3JnS1Qva1JDcXlyRkovTkw0dCtCWUUvNWdD?=
 =?utf-8?B?RzZRN0luM3Y2MGVxSXV4UjVZeVNYS3MybjMwWUJMQjh6VlYzd0dFWU93NlNy?=
 =?utf-8?B?RFRGK05BMGtUN2FEQWpzVHlCYVF2UDhKV0Y1TkFHZ09aaU9FYkRweUFNMWox?=
 =?utf-8?B?a1hHbkdBVy9uSzVvNHJHWlBJZ2pqR29KRThjS2piN0NPK1NqQWhBNE8rWWpr?=
 =?utf-8?B?eHBVUkd4azJXemFGQitkM2RNRWl4NldjN213dDhvalE1cTRrcHFyakcrdXJF?=
 =?utf-8?B?eTFuSGwrUldXUzdDVkF2WVdlVEtsNG1kMHh5SlFKKzNJUjBrVlRHNXN1Um5I?=
 =?utf-8?B?NU5GNGU1Z1lPM3hDSTJuMGN4QjA1bFRDZ2pDTU05NVRvMHNSSzY1QXpSTHNx?=
 =?utf-8?B?WnJuSWE2UzdvaFNPU2xTS0RmZ0pIYzc3ODkvaXUrZVJWbWgzUENwTVBRc1k3?=
 =?utf-8?B?U2k3b3MxcU12ME40OUVDNSs3bHp1SWdvU3EvMHRqemdOdjNvRnVLbUF0QlZT?=
 =?utf-8?B?Q09oV1ZVYWk3NURCRHl5VkQycVJBVUNaSEIzZHhNOThZK0oxenVKVmIyS0li?=
 =?utf-8?B?dVVBTmNUeXo2TFNQZkx6UmYxUjR4eXQwRlRRZUF2TFZONEpnbm41UVd2alVV?=
 =?utf-8?B?K05ySDZud1dRUDkrcHh3YndBREo5bXVwQXZCcTY2Z0NBWGFSTGtlOUxCRkNN?=
 =?utf-8?Q?uw68iWJSnmPCnHL0YM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpXbE53ZFhIMFREMEFYeXlnR2ZPYnBkWGoxaDZSVldFcnVZc1NFNnRNZ2dB?=
 =?utf-8?B?TUNwWjVuTXFkUGFpSEZYYTZpRk1DWmJpOXR0dHUzKzEvYkcyRWs0TUd6RGlX?=
 =?utf-8?B?V0V0Q3lFUERRcmJvNnQ2WC9QTzBYRUpBQTBZTDdiZldwaWRMOTFWMFhxeFA0?=
 =?utf-8?B?WmlCRW0rWmZrZDh6dUxpOTNSaEhOTis4MmgvODd0WStHdU93QUdySDRMSDBx?=
 =?utf-8?B?QjBaSFBKdkxsMEhSUkZyUG40OVVnQVVxendGK0hieWNtVFFKYXNrcW1wUlhD?=
 =?utf-8?B?RmdXcDV0NFBFV3BaWHBLdmhqaFNCYkYyMHBJRnRwekJudHI0Z3pGNThMTXZM?=
 =?utf-8?B?VnlPMVNldWh0VDlkclFHSG5SWkh0MmVqSGUvc3dBZDM3OG9WbDFzakVMVXJ0?=
 =?utf-8?B?MC9jWVdXL3BXTnFDVHFHdXhXVisvNGppUTZPY2tlaTZJYnZTUUNBdldKcHRQ?=
 =?utf-8?B?VkRhdkF4ZmZPckpHQnZxZUoyZCtVSGs5REV4K3ZCVkZXRjVZT0ZuN3RaT0hX?=
 =?utf-8?B?amJ4QU9sRjBIVWsrdDhOSGVGY0JkNk1uOUxpL2xiWXczczdTcVBWZHNtdU1v?=
 =?utf-8?B?cE5zalY1Mm9tSUNsWm5ZcGdsMk1aK2RITTkydU1hL3Nsd0V5WlBaZi80Qjdj?=
 =?utf-8?B?aDI4MG14RG1PQXF2S3J3UmdlMnpQVmR3K0RTVXhxR25LYlBQRENlOHpMOGNB?=
 =?utf-8?B?M1V5QWhIZ2ZmWEZqUGpoWVNSQ0hOdm9JcHU3UkdtZitjSVloYXNlSmc4UXVS?=
 =?utf-8?B?ZkFvUm1mTDkyOUlDWmNLaTdyVVB6b1FzVFhsNDk4WDFucFo3b0x5UVZOQzVk?=
 =?utf-8?B?Ym51WncvcXNEeGJTWDJWRmQvN01DN0d0SDMxendrYUd1TXhpQU5Kd3ZrL0pP?=
 =?utf-8?B?SnZpWkVUeUNwci9jUC9ac1VKWlNYYk1yVTIvUTBNRUVxcDNPU0VxVFR0cVZn?=
 =?utf-8?B?dzErakRzWXloSWVVOXZMRjgxT2l4TWU5d3dVZVVLdzM1ZzFwMVFHMjM3WkFy?=
 =?utf-8?B?Qjk0V1h0NElnVk5HUzNaelV1aXd3Y2RDekNLQ2czMkhyNlJOSlMzcEZoR2g3?=
 =?utf-8?B?eVJQZDNXZ2RIajdzdEtyUE5rczJhUTJjVVpWemEwamlONDF0MkdMNjRjOXk5?=
 =?utf-8?B?eDRQTkhxTnpHWVhVRWwyYkVMeVhhcEtrRmVkcVlHcjdUd0pmdmNiSm1jTWRL?=
 =?utf-8?B?NitRK0h1KzNsbWZOMno2dFZSSTh6eVN1eFMrRjVIYzFPRWc1cW1HN2dwVWYy?=
 =?utf-8?B?VloxNG9kN0Z5dHRBYkxOYmszWGFqV0ZQaHVCR3hDQUh1a1ZjTHJ3YTdjcFFF?=
 =?utf-8?B?bXRtKzRiMGV5L2ZGUTlmaTd1L2pPVUJ6SEcvRENKeXprOXNrSGt6MHUxenpB?=
 =?utf-8?B?ZzhhdEhzbk1xMGUreE1mUy9aaEdpVG1mWTk3eG53VGt0NHNEWmMyQkl1WTJZ?=
 =?utf-8?B?LzFxY1N0Q2dQU1NaZEJKT3hvWE02NTNvNUhPUWg2dnMrV25GTlR6NzZGbUY4?=
 =?utf-8?B?L3N5ZWN0Rjl5RTdYZjV0SEM2UWtuOUZzL1pYMEtxNURjL1ZWaWVJcTB0Zjlr?=
 =?utf-8?B?dXhYQ0V5RzNtNXZpWndsd1Q1WEVIUDUyUnU1OHBJREZnMzE0WFBTemJlZGww?=
 =?utf-8?B?ZFRxL284Q2ZZV3k5OFZZK2RLeVAxUlVNbk5qdmR5TFF4WEI2cGdsd1p1UmRy?=
 =?utf-8?B?NU1uakRRc2dEZXFyYXhzc3ZqUjllWERSUVhVTDFRRTIzdGpPVWpzUmk0QXh5?=
 =?utf-8?B?UWQzT1RJYjZWU1dzeWQxQk13UnZJcUo2NTAweWl2eVE3Q21HdklnTzdyRHVO?=
 =?utf-8?B?dFh3VTdGWmo4Mk1zaW1Ia2lTcDlZL0NXZ3pVSjM0c1MvdHQ1Z1cwaHdnT2R6?=
 =?utf-8?B?VmZ3SUwxd3BteHZyK3h0VVEyUFVzQWdleDVNTmRoZXhjVStlV01UT3pMQURm?=
 =?utf-8?B?RG45NnpicXF3bWFMczRkOTVuVnVoRXJuT0F3SE9lU2ZzRUhNLzZWMVVKMkNo?=
 =?utf-8?B?VmdpU2tqM1pOaGcvSXg5WDd0Qmt6aC9YRWhVV3BRanZwU3BRVWYrcCtwdFhB?=
 =?utf-8?B?dUJ2Zi96RjVwUXAwK0tWbVdQSDJ4cGFISlBUdlVIb3U1THE1RE51dHhLTVVk?=
 =?utf-8?Q?sbT1yNQdyTBQFy95V5VauPLPG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2877045b-58e6-47ee-c1fc-08dcf41ed885
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 11:27:30.2598 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oUzH60nuCHFgD4TFyjDgem3j+dJ3EMGQ4g/HS3221yUPDJ1fKUGWgl2oP5oadimlWnHlo2I7RF8HE/SaHianiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6737
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


On 10/24/2024 4:50 PM, Swati Sharma wrote:
> Add missing mega feature for panel replay subtest.
>
> Fixes: 31475ea8f ("tests/intel/psr: update documentation")
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_psr2_sf.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
> index e9a8dc141..cd4226070 100644
> --- a/tests/intel/kms_psr2_sf.c
> +++ b/tests/intel/kms_psr2_sf.c
> @@ -125,6 +125,7 @@
>    * Functionality: plane, psr2, selective_fetch, fbc
>    *
>    * SUBTEST: fbc-pr-overlay-plane-update-continuous-sf
> + * Mega feature: Panel Replay
>    * Description: Test that fbc with selective fetch works on overlay plane
>    * Functionality: plane, pr, selective_fetch, fbc
>    *
