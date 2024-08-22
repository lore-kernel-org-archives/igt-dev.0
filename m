Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424C6C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 17:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4FA10EBB9;
	Thu, 22 Aug 2024 17:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nr7rz9DV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC42310EBBF
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 17:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724348726; x=1755884726;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=O945xdn+pDETf38SBBDBA2Ewrz+6U7sx9dZnDhkAt7c=;
 b=Nr7rz9DVTJROxDp5uxxLGTT/cCMGiDvDdA+QT9+wUKGoSXoQ0GP3kZua
 ZSsFT+0xnMNNToUayu8+JnyPT1pM6ky/2Gm26SoHaPQvD88NqaCeQ5i7H
 bDbAraTUmgX1/IXIpmsqr3gvf3+sHP/LyV5L61PHdkK1U2shBJ54hIdxs
 Jr6wWjZvoidgJofW+tLZ1BsLI76YB/cI5xB2pSt3EPI4cD0R0USMiA09Z
 czc3/b4pwYw+6wugfeOIbWda57egDO/rLvhXeJapIcV+Jlzc2ok1TU4sh
 WY2Bn4176O7WJXyPqw4KUqxVfa1itpDkeeU8XXsEkxsZo/I11XpgkNE4x A==;
X-CSE-ConnectionGUID: zSQj3Un5QA6e7LK3Vx9Y6g==
X-CSE-MsgGUID: gARneEChTseHcyhryxCvpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="48179135"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="48179135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 10:45:25 -0700
X-CSE-ConnectionGUID: zBIEqU2JSf67uDjXH1acdw==
X-CSE-MsgGUID: SOEmmnKjTvO7VmbaMYR50Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; d="scan'208";a="65730803"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 10:45:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 10:45:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 10:45:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 10:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQob/aWPLhSp4LyvbuSjx7P4YfF8n1Tr6hGN6POgVo+jv3U69UmBreGVxwIparbeGVs1QQ5wm4W6LnaWDq85FZHSIbD6D/yD3zmFoHeKMAxlRlxoi7dxNqSKs1t08Z9OczUs/UcqqL78CSKSzWQ3ahDTI1Ek9X/h2xDv4uMjGYkzP/X3+pE2cYbctQ+RRTbsc2I6YbgQSuMBYhLoqM/+48+ANJvHy1taZDxM78Gtcck5PUeh5/bhlKoi+OfAFrwUauHEy9+OFpGRTnncELqzWaanS5erlDere9LotWVRRXI86wYM11w7PkEuJJDoDegbQUJxhf26NwfDMerEmnlrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hEKG+Hqc91ieDvPNElXAEFa3TBR1dZHCH44LYem1mJ4=;
 b=xpSY+in3oOqrLefXKpvYU/Xgt9h0hhMB6l8QTzgwXFuhFS6eH5IS7PvcMibG5vQ58Pesb4ffqk0TuPfVR7xsjYjL/iRyCZ/sQtqgKTJo3oXy/zpiIO8DJ6IyPhNS9BIlHk9XBSNI6GJFvOVQhax5eoSxnoJ+YU/6NVqZPtS9LclQUX6PmwRC4RR1Z8cHM6UlI5qMmfD4qunbDcD6uIcJ42Kw10yPydVUk36yz0qo2cSzes1HWncVYj8Ml/PMN2324NqzgPqKv5HlfJAc8BXyXrRTAc0aZkn43aQljXR9QFKT19V6Atn1wcKs/T6HR/CQk19CFT85prZ+XrMFR2IxlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Thu, 22 Aug
 2024 17:45:22 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 17:45:21 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
Subject: Re: [PATCH i-g-t,
 v4] tests/intel/xe_pm: Add tests for suspend without display
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <katarzyna.piecielska@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>
Date: Thu, 22 Aug 2024 14:45:15 -0300
Message-ID: <172434871596.2055.1015145340873010177@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0193.namprd03.prod.outlook.com
 (2603:10b6:303:b8::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7127:EE_
X-MS-Office365-Filtering-Correlation-Id: f1a6b032-a7a1-4b37-f6bc-08dcc2d231f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFNvVllxVmkyV1JhVTB0UEpaZ1h3RE95eVMwWVZ0RVcxcjVubC9kWUxHd3lC?=
 =?utf-8?B?bTAzakRIRVB2dWV4dkpPSjhJems4eTlKcnNGVVlyNnk0WTU0cCtDcVdSWmpr?=
 =?utf-8?B?Tzg0UlpTeVArSzIxR2NyQzc2N2REUDFvWE5pa2tZc0ttNERYOU8zN3lpSENa?=
 =?utf-8?B?RHh5cHBRRjNGcHJ2Q1BJU0NrM2c3OS90MkNwczFhWmMwZjJWM2UvWldaSys0?=
 =?utf-8?B?eklaeVplZmlVSVZMTWVYdXlIRmt6c1hCVmdveHhjVHNIT0tPTHd1UE5JaWIx?=
 =?utf-8?B?VkNiQ0huaFJ4dk1EeTAwNytLSDZsYnFqaUZDQzJyeVltbml0d1JSNGhyME5T?=
 =?utf-8?B?TndBMXFVVDVNZTFGWVZ0UUJrNGlXK0Y5MzdIY3F0d3FNUmpnVVVZRTUrdFox?=
 =?utf-8?B?MG9WSXk5UThsMElvb2hoZEw2LytjR3ZLdW5GamViMVZOZERQM1NGSGs5SmdZ?=
 =?utf-8?B?eUg3Ui9wblMrcjI3bXcyVStRVndZbWhnK1BvV0RsYUFHcXU0ajBXSXVURzU4?=
 =?utf-8?B?d2RaOXFLcEY2d1Q3djhraGxkc05uQ2JhZllqSVUxSmlXa0w2WGYwSlJHRGQ5?=
 =?utf-8?B?TGlrZUp2S3hKelA2VDlLM2FJQjcwTGlWOHZOV1ZVa2VrSmJWTzBNblBTSVh5?=
 =?utf-8?B?MHVXTEVtRmltSGx2WmRQdGlvOWZ2a0J4dUZwZXVvVHlkaklOZW1BM3FKQ0lI?=
 =?utf-8?B?R2h1dERVejNod05COWNBUGtGUFFSTThRT0t1THI2bDRxWVJFMElJZTVISzdl?=
 =?utf-8?B?anI5UG9ja2czVTk5blMzSmg4Rm9JVU9BY2J6VjlGdG9JNjFybmwxem5TU2hW?=
 =?utf-8?B?NFlRc3F4NG5oVmFZcXU1OTFPd3dBZnY1aU5qUFZiL0RidG1JTVZ6TUwzdDZ2?=
 =?utf-8?B?cFJKZ0V6bXcxZm42TGJtbmNPQzVjdWxObE9xN001a0dLM0hYeHN4T2J4eHFD?=
 =?utf-8?B?TlcxZGJpaktVZUs3Yk9scHZwZ1F0Qzg0NzUvUXR6QjJvM2FPRHNQRDZra1ht?=
 =?utf-8?B?dmRYUFJhby9zK3pYSkhROE8vQjQySlJ5bnQvc2hRdEdvRUd5cVJ1M1I5U0hM?=
 =?utf-8?B?ZmNFUkRLQ2VueTd6dFBaNG9LM0N0Q1ByYWlNVU51M2FYdG1Gb0ZDM2Fma0FF?=
 =?utf-8?B?dHh0anVqK3FDb3dkZnVLSzRISWZiZ0hBcnlBODZYOWVOV3lPenp3bE53eXQy?=
 =?utf-8?B?ZHdEY3R6SDl5SlhmdmdBRjFtbXBBUzRheVpvZ3Q0ZzRqbUh3TkNRNlg0VXlk?=
 =?utf-8?B?NUsxYnBWTjdrZXVvUUZpQk5Yak9GUGFKUzZzY0NseTJTZDc0amVEeG9LWmVm?=
 =?utf-8?B?UjJ2NnM5c0g1SzhvakRzb3FJTzRPRXNWRFZvUkVJK2c2OC9JbGdHaDJwVW4w?=
 =?utf-8?B?QTZ4UTBjcVJMV2E4bkM0THZCSlRqdjB3S0RaMWVGU2N1MitEY09pdktFVGZa?=
 =?utf-8?B?T0d5V3ZLditxWlkraXg1QzRXVHpYaFpCNVkyOGFDZnRuWERPZ01yS2ZTeUhV?=
 =?utf-8?B?Vm5KY1N5WnYvWXhsdGdpNE12L0xOYjBrdWlrNDN1QW0za3liVzBaVUtNQ1pp?=
 =?utf-8?B?SEt0ZnU1dXBXWjArNk5jUEpSU0lwbWJjeTdPbjNwcFozbHJHcTYzMnhtRDlq?=
 =?utf-8?B?bFJYZVhiL0NDL1c2dXZCL0djV3dtK2NRTUdBVDFIVXBKRy9VZmlmZlhGc0p6?=
 =?utf-8?B?cnVUWG9hd2sya1NaL1JQQ0FxeGlxT0RNblNMVXZ3a2Roc1NCakQyN1RiYjNC?=
 =?utf-8?Q?5GFPYEqtsorTeUtGpE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3BCV002WTk3ZXJlNHJRNys0MHJ3SWNzSG9KS2t6c202WHRLTnV6NUsxV3J3?=
 =?utf-8?B?NjNRaWd0NEdSK1NSaGU1dmVua3ZuaEdQOVF6cHV2YUJVWTJZRzg2Mms3ajdQ?=
 =?utf-8?B?cFM1eGdVK3VVRkNlT3hUZmVjVmpzTW5WOENvOG1qVDdyRFowdUJjMXR5UEJj?=
 =?utf-8?B?YW9CejN3TGMxc0Y3WURCWTlBNFBPREhVenp5d3hmdStDbXM5am9yTVQ0aVRq?=
 =?utf-8?B?RkhUQTIyQ1o3WVhUaENscVowbndjVlRLdW1oTXM0V25OTWtmZ2RhYzdNYWor?=
 =?utf-8?B?eW5KbUtBVExqK2dkOTZHVy9ScGd4MHE3Sjl3OUZub2VKWVVzT1dsdmJWdlhC?=
 =?utf-8?B?MlluclNQd2txYVpiSDhpM2MxcGxLQVZUalhUMEVHMXhJM1lhcmRSOHBDZzRV?=
 =?utf-8?B?NmVnT3luaU42VXBMVndJeDdmbFJ3WDJJalZxVU4zaG5vSWNTdEV1MTBjeStK?=
 =?utf-8?B?MGN6ZWp0R1lxV3J3OTJWV1NYNUFaSmpDek1HMENZK3ZsY1pUcjI2SENkdnM3?=
 =?utf-8?B?empKYmMzdktncDFYTGpqYjhseEtTM3Q5SU90c2FpSkl1UkVNVjF6dDhQZ0Y1?=
 =?utf-8?B?ejhQTmlzOTg4T1o3THpuM0hZQ2E5Qno0Zmx6S0p1bkpWcVltV0RvYU5wTnc2?=
 =?utf-8?B?N2VWcEpQRlhUSFpodlY4RG03b0Zuckc0MzRkVjRmeE1TK3c2REFLYmpDRFJ2?=
 =?utf-8?B?YWIwbDJqM3lYS3c2a2x5c29OcGp5RytMRUVmWlBvbkVKL09QUmhBOHpDRlRo?=
 =?utf-8?B?cDUvUVhJZEtBTUU5aEluOHdtclZvek84NDlVWC94cUU0dzExdGNoaTVoU0pX?=
 =?utf-8?B?M3loYmtQVnIvQVhKK2c4R3BOUnpMdlZmN2ZvMGF4cjNWK2liRjB4elVpSkpu?=
 =?utf-8?B?NDlOc2FxQkRYQ2NRWlpqckUzRjVqcUtnRWU2M2Mra2NWUzNwR3pQaElIUU80?=
 =?utf-8?B?bURqSU1MdjFFdTlkQ2Y0MUJJSnM5N0NpcXpnR2tVeEpNR1UxaUJ1WkRyc1Nk?=
 =?utf-8?B?K0FzUEV6UW1JbHQ3VkpyQjdxU2hwN0FtVFJjZ1dVb0ZCWndFdzNENHhoamc2?=
 =?utf-8?B?RVhzMGRnRmhFTjNGZVBRam9YVEhzNm0wTS9TNldwaTZGUnlDa25pdlJFK21y?=
 =?utf-8?B?T2JZeC9mY25CZWl2UmRNMWdESlFyV2s1cW43TWRKamtaWXI5SDhxbVdTUmdY?=
 =?utf-8?B?aEw5bjVIbC9vd214akROMWpiVmhuMmRrbm1UK20yZG4vWVZmekNQRkt0SFRX?=
 =?utf-8?B?UXBGOG45Vm5WN3pDcVBCYTJ2NXBCblhsZS9jTTc1MjZnNUpob2VPcDNyNGJH?=
 =?utf-8?B?aEFrUS8wdzlPRGZNUW9SNFV2dXFERFpONGM4WXlUbEczMjBzVWRZRHBUai9x?=
 =?utf-8?B?Vm5PNThDbmFqVUczMVVmMGJFRjU2UHBDa09vTjk3dFVQTzNCVThPZ0V1RjlU?=
 =?utf-8?B?eksrVXRnYW1oUEd5T09pSzJZWUc4MFptZE52NFFKN01IaGdvOHVqZzdIRXpY?=
 =?utf-8?B?WVlPc0grYVpRVXkvZUYwOVl3eSsyblBlN21PazJQcWNBUTMrVTN5bUdhb2Q1?=
 =?utf-8?B?OG1MM3BOQmQxckpsNGVWbUMzcWg3YnpUU1QwdHJUdTI4TDkyM1l2bkQ4TDJB?=
 =?utf-8?B?Q0FNY0pzcjhtVXQ4aUsrbTF5dXIwUWEwRFJScHN6ZjF5WWo5OHpOYTVadUd5?=
 =?utf-8?B?MTE5N09oOW85U2dwTUxHT2pBK0JyWnRPV1JlSm5FUlcxdEh6WkQvSFJBamIw?=
 =?utf-8?B?SWNUUWZudEIwaHppdzhHNWxjaVk0R3FIbUFwOE0rVFlwdEkvckNhaEhjQXlv?=
 =?utf-8?B?M2N1OHgwTUxoMWVNaXBMMzdUL2Nqb2U4dnNVNHRNWmtyVTVJV2NyL0xCODM3?=
 =?utf-8?B?YkpHVFBDV0RISFpxalJwMWpJY2dpS2tJRDY1dU9kZWdNQ1ZRYXBTZlBvSVRj?=
 =?utf-8?B?V1VscnRrMWd0aHN6eE5DL05ndGx2Z1VWVi9Sdms3QXFSMHNHNFFmOU5CbGdS?=
 =?utf-8?B?aVBDZTlVQzljU0tXbWhjUVlzQ1VPbTRqcUE5TkNQbTRhQVNrUmFtTHJUR2Jh?=
 =?utf-8?B?c2U0cHUxU3hxbk5uakgyKzNsR1I2M00rZ2NJTDJwak5zSVpaamIvbWVkNnF0?=
 =?utf-8?B?ays4dVRtTnQ1Y2RwY1JtNlN1Q3pSZm8yNWdqeStDdlRJOXdVSEJrMkc4bmpD?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a6b032-a7a1-4b37-f6bc-08dcc2d231f3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 17:45:21.8962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqTO354ygxynQaFJiFiUJ6ZyaE8xuwZ8pH9XVehenaDzQSaDmFimehQ2SrAi7sIzZSL/ce9Xy2fLQCQx3RZnpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>Hi Sujaritha,
>On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>> Add tests to validate basic execution suspend/resume cycle
>> without display module to rule out display related issues
>> from the suspend/resume stack.
>>=20
>> v2: Add normal reload cycle after running test (Anshuman)
>>=20
>> v3: Rebase
>>=20
>> v4: Change commit name/header (Kamil)
>>=20
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> Acked-by: Katarzyna Piecielska Katarzyna.piecielska@intel.com<Katarzyna.=
piecielska@intel.com>
>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>> ---
>>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 34 insertions(+)
>>=20
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index eee89428c..1623a56c7 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -17,6 +17,7 @@
>> =20
>>  #include "igt.h"
>>  #include "lib/igt_device.h"
>> +#include "lib/igt_kmod.h"
>>  #include "lib/igt_pm.h"
>>  #include "lib/igt_sysfs.h"
>>  #include "lib/igt_syncobj.h"
>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>   * Functionality: pm - %arg[1]
>>   *
>> + * SUBTEST: %s-without-display
>> + * Description: suspend/autoresume on %arg[1] state without display
>> + * Functionality: pm - %arg[1]
>> + *
>>   * arg[1]:
>>   *
>>   * @s2idle:        s2idle
>> @@ -681,6 +686,7 @@ igt_main
>>          struct drm_xe_engine_class_instance *hwe;
>>          device_t device;
>>          uint32_t d3cold_allowed;
>> +        const char *opts;
>>          int sysfs_fd;
>> =20
>>          const struct s_state {
>> @@ -757,6 +763,34 @@ igt_main
>>                                            NO_RPM, 0);
>>                  }
>> =20
>> +                igt_subtest_f("%s-without-display", s->name) {
>> +
>> +                        if (!drmModeGetResources(device.fd_xe))
>> +                                return;
>
>This should be skip or save it (as global?) and run test on headless.
>
>> +
>> +                        xe_for_each_engine(device.fd_xe, hwe) {
>> +
>> +                                igt_debug("Reload w/o display\n");
>> +
>> +                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>> +                                igt_assert_eq(igt_xe_driver_unload(), 0=
);
>> +
>> +                                igt_kmsg(KMSG_INFO "Re-loading Xe witho=
ut display\n");
>> +                                igt_assert_eq(igt_xe_driver_load("enabl=
e_display=3D0"), 0);
>
>This param was renamed to probe_display, see
>https://patchwork.freedesktop.org/series/137096/
>tests/intel/xe_module_load: Rename enable_display module param
>Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>
>+Cc Lucas

And disable_display=3D1 might be more appropriate, because probe_display
would simply skip the probe for display?

--
Gustavo Sousa

>
>Regards,
>Kamil
>
>> +
>> +                                test_exec(device, hwe, 1, 2, s->state,
>> +                                          NO_RPM, 0);
>> +
>> +                                igt_debug("Reload as normal\n");
>> +
>> +                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>> +                                igt_assert_eq(igt_xe_driver_unload(), 0=
);
>> +
>> +                                igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>> +                                igt_assert_eq(igt_xe_driver_load(opts),=
 0);
>> +                        }
>> +                }
>> +
>>                  for (const struct vm_op *op =3D vm_op; op->name; op++) =
{
>>                          igt_subtest_f("%s-vm-bind-%s", s->name, op->nam=
e) {
>>                                  xe_for_each_engine(device.fd_xe, hwe)
>> --=20
>> 2.34.1
>>
