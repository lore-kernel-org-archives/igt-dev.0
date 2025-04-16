Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D83C369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 12:10:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A63B10E8DF;
	Wed, 16 Apr 2025 12:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PNYGiM9g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B8B10E8DF
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 12:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744805432; x=1776341432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GE0ZtwUIugAX37ECzmus/egRxVzm+N3e/JQBrfA2Y3s=;
 b=PNYGiM9glwHMNTXjBLbIN8u9iGZvTRCgV48/xZwH4aoqvdjTlXK6Rfic
 0KuefAKrec2M0U3L+QJJfbir3e8UoaY6iIH/MvFqmLkesDTWnJq1QO1qa
 bfVnnePsTLlis49NSRLi8bMhLV9PR0NoJYAlDLt7MGSrhmMizVp6e8DGB
 pmstqUVqlmaufJdpQIdXch/cLAEtJ3BFzEH8vgPvkJYtaqUADl0R72tmp
 6Fo0G2IhUWzVBPZnvN5zJt+ck0Cnu33Rp/g6a/6mCXwqNm1gJJ2pDq+FN
 Iy6kH6YbD8ABtv+JRVMAlQthKsAHF4PYOJHARB74RvnHUIct3dNZxVHGz Q==;
X-CSE-ConnectionGUID: sPeyAuNLQNi/ZWsYJJgDSg==
X-CSE-MsgGUID: Qtvar/+hQw2hR1vJffRyAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46511544"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46511544"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 05:10:31 -0700
X-CSE-ConnectionGUID: teQXEWwYS7mWU25N+KJQHA==
X-CSE-MsgGUID: TmhegTJ0RYSJhMECO/6P8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131426627"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 05:10:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 05:10:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 05:10:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 05:10:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1mgLHRYQqPdbg4Dcc0/6OFBwNySHHmDgSK7v9IEjAO6xgOQnPShOi3tqKHGojzTm2cE9zeazNGfAZl4yA83lTtfEygd4QboNOofQly6Fht37417hm8KI43vegPTBsKFFrjNQxLXJ3qanKMLDHwS7tTLzP94LvRDot638eniSdqiDRnAl3JyBuqZ/jCjjK9Hg8bOapynDlh40JaGwUA+0dltRLwkUHXejO3+N5hT49njqASa74luFsmjaXOWmE/w0P4+ZVo/vawOu+IDM/ukml1EvU6jJbu9MECIYzJEXvMGT/doqZYaHR47dSAF9jMo16Ja6G9dY0z87tvq4qiVJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtL5QZi2oCrgwo1E2xmBo0nijrmbN8bpqoODcovxY3s=;
 b=AsiFrbDsI3IblbOaoxwM/pksg47BWS8pTwVcb06Ik8hdbrfUCbESReWgVOs/KPUw3dyKKCRnpJCdgRKlLc/JIRYIaHZJMwWBDIM7BR9tOD/+qBEDjtZYipdF8gQQiyPaOpY6B8YYqf8QyuoivGchbAzomFQvhgOyH9jVeOATMAcw5LyWV2iq9qtkQnYdYdOTtXc6hpR+bVxqp9J6iYQZ0YToX0m35AwVhQEHKZpnGgflIiGbi26iu5F2U6Sg/2xORUuB3t6N7secaD8YS80ESLDAKQT3y4hP4JKTu6Cxj9ALSmDOg1bssLQMMLUwavhztARg00Dv91D/lU3KkEq9Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB8569.namprd11.prod.outlook.com (2603:10b6:510:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 12:10:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 12:10:28 +0000
Message-ID: <22a2383a-5904-4347-a760-55be94b8e23a@intel.com>
Date: Wed, 16 Apr 2025 17:40:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] tests/kms_async_flips: Use tiling modifiers
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
 <20250415155136.2879045-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250415155136.2879045-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB8569:EE_
X-MS-Office365-Filtering-Correlation-Id: 7201d3c3-e128-4937-452a-08dd7cdfacfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjJLZXQ1c3dkUmtmRXNlTFNRT2JFV1BLMFJ6dnV3QkJDT1RzZ2xaTWorN1Bn?=
 =?utf-8?B?V2ZBQ3VER2NJNExyUldnMVpjNkZsMDg4MUFadmRlanlPbXI2VlJnV0VYbVRn?=
 =?utf-8?B?TmJ1cXd1NEJrMFg1QTdqcG9vTExFQWxCaU84bmE4eGhua2F2bTFhOHl0dlZO?=
 =?utf-8?B?Nk56NnpoOTdjdnp5WE1KREJEQXVjQzZSMmMvVVpob3RQSThKa015QUtrb0lx?=
 =?utf-8?B?dWM4eGF2ZDdSbS81NGhBZk5yMzhhRnZrazNtL080TmY3amhOUTJibmNYdlpq?=
 =?utf-8?B?SmRZYnBOQ21ocUVTdyttRERrdUcvUUQ2dmFPZDhLWDFHbnNpbVNqNHpVQ3hw?=
 =?utf-8?B?Y01FRXBhMUFkV1M5T2kvWTdraXdPcWdzaWxLcnFUK1hjSXdib2QyZWEyZkpu?=
 =?utf-8?B?QythazBkNk4wdWs5TldIRmdVMnQxR0RuVGYxNVRlUFZuUmtHdlorS08rYjZV?=
 =?utf-8?B?UXNzK1FOQUhtb2M4TXp5QTFKQVNrdEQ4azhRUVBONkFSLzlKck1sUUh6dkJZ?=
 =?utf-8?B?ZEJmNDhqdUF0N2VaNDlNQXV1SklFaG1kc21BMnRrOUxvU3pybkpFdFVJeXYw?=
 =?utf-8?B?ZDhiZHgzMkdPLzlYZktrVDdJSGw4VFQ5QnFQdzVKNnltZ2ZBa3J3YVRTaVNU?=
 =?utf-8?B?aGlTeml5VHlUTit4S1hGVHVCVTkvTytaUHplTE5iVlIzQ29XTzFKY3RlRERR?=
 =?utf-8?B?OCtkRGxUbHdXOE5uM0FHTEFIMWdZcXZnZzhPWW4yQ0lNZGhtTG5FME1OOW9p?=
 =?utf-8?B?bnFmUEx6WlpaUkVubjhVakU5TEJsMG9kelV5ejRYbXpaNnVna0dGcFRJVThM?=
 =?utf-8?B?WUFhMnhOaUsrcmhCRmg0djYzMnA1NTI1YVNxNlM5RmVFQ3gvcWRnQ0FNZGta?=
 =?utf-8?B?Q0I1RG4rUkQydE5idVhEdlJZRjZhN01IdnNVZDFmdEFKN1B0bjYrMEEzYjRG?=
 =?utf-8?B?SXZXeGtYbjE2ZVNzdkUzYzlJd0NxKzlsdFVmNGhJWGhaZFJlOFpuLzFvV1Nm?=
 =?utf-8?B?NUpkR2pzWTNacnQ2eTFBN3JkWlI2Zi8zbjg0M2dIMGxsOTlxYkdrcXVta2ZC?=
 =?utf-8?B?TFhlM2xzbTNZUVdzZGdiU3hZLzhmNTl1aEQ0dGNnTjZla1FNanJCbFYrVWRP?=
 =?utf-8?B?M2ZWMnhoenlxL2F1ZmlDdEJ6dGhtU1M1RjRKSDNZMFp6dk82UHF3eWhMUVBy?=
 =?utf-8?B?NXBzbEQ5V0tUREcxOWRwZUNINGZGZVE0N0N5ZFA1YmpJcFdMMVhKQ3Vyd3pB?=
 =?utf-8?B?c2N1MDJmTGtRYk1CR3hYRWoySS9laDJDSjlQOXJVSGlNMW1YQmNiT2ZwOXY0?=
 =?utf-8?B?Y1RJSmZmU2xNL2FJcUQ0bzgrZXkyc21aZk5URFkyZnVrVGhEd1Y0eGttaTN0?=
 =?utf-8?B?aFVPNmZOMkI4T25ZWWNrVzNMVWJra08zUlhQY0NaNitJTjAyTm1tNkhPTllG?=
 =?utf-8?B?OW9YZlhxZXhpT1JydlE2VUFEOFBkQks1UXZQQmlWdlNrV002eXZra2FJUnB6?=
 =?utf-8?B?ZitZZEtIdGw2OWNOVE05WEJnalIvN2EwMzFCS2NkU3l6SDJ5TVBiMTRmbFVt?=
 =?utf-8?B?eVgvSHQ3d3RHRlpja1ZEdlQxWjBEcXEzb2hBZllPVUpZVGt0cVd4cGRic0c2?=
 =?utf-8?B?bStwNWZRZ1M0b1NObzkySmNhRjJCTjNycnJVQk9mcHlMT1hpQ3ovOFgyYWxw?=
 =?utf-8?B?cHhZSDBBOFRqb24xZFBuZmdPeUlLWnlJLzV6SmF1ZmZ4czdLanVoM0VUalNZ?=
 =?utf-8?B?REN1ZCszTStiTnZUVEtIM1Y0RjVGUXFxY3NBNUd3MmlNbDd2bWxpeW5CUE1I?=
 =?utf-8?B?R2JQK1VPTGQ3UlMxaFNteTBsdmI3T2dIeWhyM0VBS0JCck9aR1pOYlZ1UDYy?=
 =?utf-8?B?NkRkMHZxejc4YW90Z1RhUU9SY0x0cjhrMVF1MzhLZHZ0WmozS2dQb3hXRk40?=
 =?utf-8?Q?X1cDIB+iTPM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTl2L1JWb29HQ1RUdVd5NzgrNGVQYW0vRHVtYy82SFQ4bno5R3JKaE1LZVE5?=
 =?utf-8?B?M0tvV2YwMnBISGpubzFJVjJWdm56NkN1azNybk1jL2RrY0NhQjZtSG0vWi9w?=
 =?utf-8?B?eWdiR3NTRUt4QWplVjE5TnhpOGZvbnRkQ2wrOFBMdjk5MkdxMUJxbFBsL2cx?=
 =?utf-8?B?ZG1HUWM3WmFYWm1nMnR3SWkvbnVNUGIrdVlZTy8wdHhqdmZLN1dCQzY2NnJK?=
 =?utf-8?B?OTNnenZEek1RV1pHdHlQY2xmNm1lenJ0eWtPeFRaek02ckIvcjBiTi9ZbmtF?=
 =?utf-8?B?djdtekNiby9UcEpVY2h5QmVIMEhQOG9VWnhVbkJTRkdabUhWRXhybCtKeVh5?=
 =?utf-8?B?aGRGM3gzcVh3UGpRcFlzVkxVUjQwNndBUkliV1dGdDNNOTFubFNPMUltM25V?=
 =?utf-8?B?Nmo2OGdBTng4amhBbEYxcG80MU1VSWxOQ21aTkk2SkRaZlFHdi9yR3FEbUxT?=
 =?utf-8?B?K0FYc0RETU1ROEhFU3dIbUVLSThRTndhU1dOTnFvK1B0K3pmWFBVQmF1Nk5U?=
 =?utf-8?B?dWpOWkpaYnFMcVdyTDNTWVFjNkI0VDBNQlVoSzNnWUMrVFBwVlF3SUJBaitK?=
 =?utf-8?B?dWpVd0hmT0JqUkhJZUhnYTY1Umx5UXdJSmhGWFlGYjdLRVFqQ0R6em0wVDYv?=
 =?utf-8?B?K1dETDJlQjVlanhJZUZuZURrMGN5aWhkQVdrWHhVajQ4VXA4MWNkcTVlQW85?=
 =?utf-8?B?Y09ESTFxUXlyaWZaT1ZQcjVGZ3llYVJYcXRrbW1YZ2FrL05VT0ZTSjBWTmZV?=
 =?utf-8?B?a0pwdzEyL3JYNkdZS0NCUVJPOHRtdjJ2WjRHSWdLVW5zUlNKQjJadVpqMUwy?=
 =?utf-8?B?MkNCL1RzU21PSnViSE1HMlZPd0JzN1RKVDA5bWN4ODZUMW9UYkY0SzlDR1BE?=
 =?utf-8?B?MDFmckZkUXk5VWZZbmcwbHcrZkdPSGFZSEdrcm5FM1k3RkhWNWNheHNBekFX?=
 =?utf-8?B?SmZFem41Y21idlRmamc4T0RUMnNnY2dJeWVOYXdjUEpwUjd0bTdJaHVTS2Fh?=
 =?utf-8?B?QnFCaXBSelB3ekhzK3JkMkQ1NmUwcEtKTnZ2RHV6dDBLSWxGd2Q5K3FVZmJm?=
 =?utf-8?B?ekMyZTFUWWx3MzVYTDFjT2sxUER6dmJteFBieHpQMkFsSVlhN2hLNGEvcC9R?=
 =?utf-8?B?eVc3YlVRclVTZ3RiajNCck9odVRLa3RlL1B1ZjBSeU9pY2pyd0pKRUFkZTdl?=
 =?utf-8?B?amhoZEJTaXhjam4rcFZBZnVBallhblRoRUJNVUtyU0I5RDVhbVU2dU50QkFB?=
 =?utf-8?B?WFpxUHZPU3pENTJBKy9vMXVEVjVKakt1SkllMTZWdGYrSjZncXFGS3RqeVZ0?=
 =?utf-8?B?VjZDK01aQXBZcitwUkJqajBkUW04ZGh2RndnZkltM2cvVVppamxHODhuVEs3?=
 =?utf-8?B?dGsxR1g2aUkxZS9SOVRtTGlNNFd6Y05NV1hVTTczZHRpSXpPNkY5RVB3MHpP?=
 =?utf-8?B?dVRScHp1V3FkNWsyZFUxNDk0ZU1OTm1mNm82Y1dxL0dLWG56UzNMRWRLWkpj?=
 =?utf-8?B?SWk3Mk9xaldHZlRPQ3N5ZW8zSHNtaU5NaUg5VEhyOEdyQ3ppN3NvbVJwYXpM?=
 =?utf-8?B?dnQ2dUQ3TUNpSlNCL3p4VUtqQzZhdVI5bDdrTm05UTBLRWVvQ1lWZnRCSFlt?=
 =?utf-8?B?S1JPRnNadEhFMmlKVGtEWmhhbitOUVltQm95Z2Z1c0hRS0NFUjY5YVhJRXNn?=
 =?utf-8?B?OVhHaEdqMVpFRHFKcVlzUXU0cG5xNWcycXBkOG9ZbkV1NjZZQUsya0NQaS9i?=
 =?utf-8?B?MmQvdHRCNHZGYnc4VENkbllLVnE3cnNBSXQ1aWp4Q21uRHpIcndUS2lZYmxT?=
 =?utf-8?B?U2pIclBHMWVPeTI4WitoZi8ySG9mdTJFUXliR1JGb0JNNGFZeXltUWhkRzlU?=
 =?utf-8?B?OTdHdjhDeldPRXdrVTdJeHBEcVFpNlhXU2JpQVBDWGNMVUh2TEVkTjZlZVRM?=
 =?utf-8?B?RE1xWnhGdWFiRndndkFzb05jMm1WRWpFOUNQanNxUWRaUXI1ejNvaGYreTNL?=
 =?utf-8?B?akJ2VU5ncXdDMmlHVVVOVDllL1JjeTY3RG9IQXFIWndNZk9Ydm5FMVhGS0ls?=
 =?utf-8?B?U3llWW91TElVTnpNaUNIaGJmc1BEc204a0NXRFAraUpheTVuWWhLeC9vYkd6?=
 =?utf-8?Q?33T2s2tFbP9m2V2oj66xIycXG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7201d3c3-e128-4937-452a-08dd7cdfacfb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:10:28.2480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9bCJcUezuI+ULiJuCYp7nWEZG/CA8vGjN5CyPrQZF5TQyyovWi5Tuh2kGV8e1RxRxAASxq8/JsKPm1S1cpuj1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8569
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

On 4/15/2025 9:21 PM, Santhosh Reddy Guddati wrote:
> As async with linear modifiers is not a practical and common use case,
> override the default modifier with tiled for all the async flip subtests
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index df3e136b7..5d84df49a 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -780,6 +780,10 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   		test_init(data);
>   		data->allow_fail = false;
>   		data->modifier = default_modifier(data);
> +
> +		if (is_intel_device(data->drm_fd) && data->modifier == DRM_FORMAT_MOD_LINEAR)
> +			data->modifier = I915_FORMAT_MOD_4_TILED;
> +

Can we handle this in the default_modifier function?

Regards,
Karthik.B.S
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
>   			/*
>   			 * FIXME: joiner+async flip is busted currently in KMD.
