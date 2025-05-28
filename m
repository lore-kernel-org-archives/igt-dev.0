Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1029C5AE59
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 08:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E53C10E5AC;
	Wed, 28 May 2025 08:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9ZRUMkG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A547C10E5BA
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 08:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748420812; x=1779956812;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Wd+GTP+bMYxk+J4p9hU7i8abwxrnMCkb6NKoWzj90rQ=;
 b=n9ZRUMkGrU3dvlt4YZzeoKDe8LFBGmlMkO93Ts4mlooQaFKmArrqTReq
 7P3kNVaSDAijNUfP834yNyYeOnfk0TzCmFNRwwjal733n12qhO7DaabEE
 J/8mvi6syJZ5BqZkcTlnwwLuvI97Pohx3w+wbzUplKJjjaAnE6pxGNWDH
 uH0On9mPEAWoHnC0jJ/CeIDVruYN3ENUvGLzvv9tFT3dM3c6uqG42VY8O
 LP/zRCdZekZm9/rLr1QlkWErTrwoasFfgcrmJl4RUrMSb4AdyTRI2GLxR
 x/xYiig4p3K/Dxwi3BtFZj8lUprOuMnaDCeWl4kbMDXyx1/w0s3pmeMYb A==;
X-CSE-ConnectionGUID: N52vHh/eT06pOu4sVFL3vw==
X-CSE-MsgGUID: S67GFIf7RkG4c2hoqpey9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50135253"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="50135253"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:26:33 -0700
X-CSE-ConnectionGUID: 51jsBZu4TA+cdVQlnJh6MA==
X-CSE-MsgGUID: ReHMvdGmT3+wLrSAMuhQFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="144147130"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 01:26:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 01:26:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 01:26:32 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.40)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 01:26:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alS3wz8XW7DYWEgCXSfIxs409aP1U3vlpiHCX9GHSOLrOyS6/bI/8+DQ8+dqLYXfyvucdqtHjWGi9xrgVp3b46vzOkwZFlxuCxN1Oi2QuKS9vCZC85Qs8nBsCeTBsSXeK8nvuMntVgTV366RHyXpcHOTaqs+soipcGmzcHzfEhNI10NWfdbr6QUjZrt1ffbJjWa+bVn28gTFczT5iNKCktkCTvaj/whDR0OCecDO4xOBpEU8UoU853PLmEJriWsosz/sEKd/xA8PxFp1S4l8AKE4yOZSVlaame02b+K5kZkCrKlHoFOTiBDCLS0izlZSd3pc4YDsEwCVCxgb4qekNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfZrzOyjlBCftGDm0nuYClOHz1PcOs6u16KY9+Zzw2Q=;
 b=oYbtEzvJ9aGOmXPernASdt99KBQJ1v0oGPMrvcJtFG5ysxNHAycju3tEmavOXD438ebyMPJfwZA046hKC8lIX3x0qqrLKBasqbG1TBNf8GI+NT7NczkicE3kCXUNIqTtdh1JDM+Ipi95O/B1I7WP7FH2CRXisAh3299RX+pCEkNU/KdypTcQxitRNDYsWG8sofqKbNz8b6kjh+hLP1xUyBjtGcIs/XWNhQ+GNZc9Yeg/tn4/Ztmlawg6LPEd4f4RL4sQ/78WUSme+ST6G5uRIuphl9zQBOE6nYEOMgcVSLqxGySUY8L8GMLx0+dLBs7E7y1C0UMNle7nwVSGkjyHiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ0PR11MB4813.namprd11.prod.outlook.com (2603:10b6:a03:2df::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 08:26:30 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 08:26:30 +0000
Date: Wed, 28 May 2025 10:26:26 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 10/11] tests/xe_copy_basic: add mem-copy matrix
 subtests
Message-ID: <aDbIsqKR-e2Pk9L-@fdugast-desk>
References: <20250523080126.75295-1-zbigniew.kempczynski@intel.com>
 <20250523080126.75295-11-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523080126.75295-11-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DBBPR09CA0016.eurprd09.prod.outlook.com
 (2603:10a6:10:c0::28) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ0PR11MB4813:EE_
X-MS-Office365-Filtering-Correlation-Id: cc485969-9639-47f9-e1be-08dd9dc158ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzFtekl4SEVFdG1Hbm1jL0h6Smx5dVR4Q29CeHhVYmxROWpHVDNUWGs4bDJs?=
 =?utf-8?B?dDhsV3o2TUVVUTRJNGlGc3lZbVpVWU0xWkZUZmVSNUV5eDVRWWxlRFRuWThQ?=
 =?utf-8?B?SHNORVh6ajlEUU5QSVFCT3RtUkFpVmRtTzI3VmpNTmdLallHL1M1TnpUVENZ?=
 =?utf-8?B?a2dmUlNBUVFuSEpTMXUwSEN1RFdOTTIzY3dpQW96bzhzaXNya2xia3NxWjVW?=
 =?utf-8?B?Si9OZTkvYUd4V1pRdmFMYzVnTU92VUtXK0hnYWVEWFBFVzRRd2hCWVltUGl6?=
 =?utf-8?B?VFZNUUVoQ04wZEROVGhzSS9qT3BYQTNKT2p6WktIY1RqaHdWS2lGWjlsSE1I?=
 =?utf-8?B?N1NqU3dUWnJCTWJNQ1RSWXk0ZlgySUF3NWs1MEozUXNXQlgrUUNUQVJudmJy?=
 =?utf-8?B?eEV1bzY5VXlxYk1EK01oSjN4aGhwWnNJamFvODJXN1pacUF1S0xtZEs0ZWRL?=
 =?utf-8?B?aGNvN29CcnVNWGIxUVdHemJqMDhpRlV1OGFRMnFFUFJXL0xwaGNBU1hLdFJa?=
 =?utf-8?B?dEJwY21OWDI5cElPL3p1dlRmUW9nZklPOXlQelNHai9EWEg3MExEZ0hrL1ls?=
 =?utf-8?B?RkR3MmFvWG5pU3FGN3pSOU1iYUQvdHVHeXU4VjZ0dno2SUJUNUkza2FNU2xj?=
 =?utf-8?B?emc3MmRnZ3VDNHZSWGxJRXNEQXRlTDJZbVVqbG1FN2NmZWhISnBGK0w1NEFy?=
 =?utf-8?B?NERxb0lxSEJabXk5b3N5cnc0S2pWM1RMbWMyZUNXVU9jZjBRRzE4MkJHYzBK?=
 =?utf-8?B?WDlGRkNFVm9vUkVYbmdEZWxiUFlGeE5jTjlOSUk2WFplZithdVRLWVVhVloz?=
 =?utf-8?B?VTVveERQYlhVdENJYzk5MldEWjc2SDNwRGo5OGdFbDFyTk9VeDR2ZmtsbWVh?=
 =?utf-8?B?b0ZIbFltbDVzTnE2WUdSZ1NIMmlpTHBSZkVKaWVURVFZcXp2N1ZrSUxuS0xl?=
 =?utf-8?B?UHM5R2J6SmdCNnN3akJkUHkwYjdnTG5PaGlsdzNVTFpHUEVUY0k1bjJnNnF6?=
 =?utf-8?B?U1BINC9hUVNQNlNyOTcramVvZFNoSUNtRkZGTVFXVHRlU3NXREgzWk9JODdq?=
 =?utf-8?B?Tm9UbjNBTUUyY2hYRkJSdUh5R0NHUGdhUlV6ZHpKSG1QMlpuUm9iS0REdFBq?=
 =?utf-8?B?YVBWb2djVXkzZzJvQ0RZTnlsbGZ5T0FTaUp6UU52bTkwdVpFalltaU93a1Vr?=
 =?utf-8?B?akhLcCtPNVA4QVJvZlRLZ1RuVzhWSXBhM2puTEM2WDhlc01CRUh2N1FIZDNR?=
 =?utf-8?B?RTE0ZmZ2OEcrNnpTdDh4RXFudDRud1J2ZFRJZXo0MXkwdDd2V3VpSkE0a2Za?=
 =?utf-8?B?bE9ZdTB2Q2c2K05rOEhWY2FmSk9kVkd1UUlWaEhGQncxWU15WnlISmFhYzhy?=
 =?utf-8?B?Q3kwZzM4bXNzdzlhWUVwMURPL1NwaFFkVHVVZFg5RHlYUXdvTDlyN3NabVFQ?=
 =?utf-8?B?VEdpbDdGYlpEMVR1dnZvRStYUW9DVWhpTG1EOEVHZXY2Y1ZZcCtGd2VRNndB?=
 =?utf-8?B?WndxU3c3SVV4ejVYQmtHQlFUSnJrbTVLblpUc0tRZ3lBRkpYaUxOUldyeXFa?=
 =?utf-8?B?RVVEZFNTbmlzWkJXMVRnMEJqb0laZjZBSHdjNHpnR0xUZ2lVaVJxMzJqcDBo?=
 =?utf-8?B?d1Jla0F5NjlJZm5ETE9lVWxiN1c2cWZrQ3dGV2tyVyt0dmNHL2xJNEs3SU5N?=
 =?utf-8?B?ckVuYWRzK2ZtRXBkeDV1TG9nYjAzdFVjRXB4d0NoQ1hVMUFHR1NoM01HRzFB?=
 =?utf-8?B?aXlac2hnbzlSeGY0Q0ZFNHB4SkJYTCsvMUp6bXhOcHdMaVB4NmtRTHE2TURC?=
 =?utf-8?B?WE9abmtBYUNCZFYyeHF0MjFKM29RcllZYmFoWGxkVjdKMHN0b3VWbEtkYlNC?=
 =?utf-8?B?S04yb1crY3k4UEpLL1VJRTllUTZDWEIxMVM0WGhjS001aWhnc2d0VHR6bDNB?=
 =?utf-8?Q?XuMWKaKbQAU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXNlTFowL0hZQzlvcjJVSmhZemRWZjBWUUQ0NU9FVmVIcDBFL2N0NExBbUU4?=
 =?utf-8?B?a05vOEdidGtTNVpQT0g1SHh4WVgySEM0NUJjNzFTNm9xSnRGalFoNm9jVFRU?=
 =?utf-8?B?bUFJMUlpT3JEb2l3L01yb1hDczRRZTBSRUcvQUN3M0dQZGlXOHBxT2RPK3JQ?=
 =?utf-8?B?RWVKSDZrRlVucThZY3VuVzJhRGQvZWZ6aDBySWxkdmJUZmhuZ1hHMWM1Slhk?=
 =?utf-8?B?UEVRVkZHR0tPNXNwRTRGZi9JWGxXOXllaG0yR1pxa1ZlN0N1eklVRkJOemRn?=
 =?utf-8?B?czJDbWRQRW1sWVhxcXk3bnhHUTEyWFE2QkVxN1NxSUs0QzNWQjd6a0FQRGtj?=
 =?utf-8?B?M0ZSRnhZOVh6TkJtV1NseWYzeEVyTGwxenBoS3dYVG5hMGxFSjBEVzVhU0xZ?=
 =?utf-8?B?dzdQQXluc25ESjh1VWY0SFdLYVpVSkdoeU9RZWhTSCsrWGJoTm5aZTIvaG83?=
 =?utf-8?B?dXJ6U1JubVFrcGNtUGYvNzR1QS9BaGZ6MjMxaWxydlljK2ZLVVMwbk9hVG5z?=
 =?utf-8?B?cU9aWE11TnY2N3BhYVg3UmpKVkdIK0FWQnZvTFNNRU5ZNHM5dDVZcmgwNkdW?=
 =?utf-8?B?QXB6TG0rNEZNMjlhSDRRQVdtZDBybXlkNDVSd2h3aWtxTkhsU1h6REE1NXV5?=
 =?utf-8?B?Skc1L2ErbWZDaHo2amxJbEVpM3lINnZGNXdLRElhL2d6UVN0UE56amFTOGpR?=
 =?utf-8?B?TmgzVU9ONzNUUGtwcHNsN0hTOTYwRzN5bHJ1VXFFYUszamRiT1JHYjYyY09F?=
 =?utf-8?B?eXY0d3ZRN01jbTM1U1VFTFRxeElvM2RQMWYxWUowdGF0VWxmZnVzR0pCMU42?=
 =?utf-8?B?VUxpZzF6WDY5c3drVmZSZjA0SUZ5alBxeVRtUjJZS1I3UjRVNy9Ibm5jQURn?=
 =?utf-8?B?ZnBUeFRiRXBoZGlWVmNJQ3pTNmNZUFhBaU5Oa3JzQy9DSGxiN0psWnFabWhw?=
 =?utf-8?B?bWtveitPdkNlWjBqcjlWOFNQMEpLQVVHTWo3Y2QrZWVRQ21MWFRzdm1iNU5x?=
 =?utf-8?B?WE5XZlFuVjJQVE13U3c0d0s0d2wwWkZSRTVSaC81UGhDNjVTZTFCMm5sZWc4?=
 =?utf-8?B?cmltK1AxV2J2SWlJTUd5VHpKbnk4RVZsRENFeHk3OWpxenArVEJuVGhLYy85?=
 =?utf-8?B?N3dFUVMwalIrQjExcnptZ29PQTJFc2ZPcEV0NWtRWDlFR0NHKzNYd3NFdVpK?=
 =?utf-8?B?WFA0Z1pSdmROcFUrckxrblgvaGZuK0MwT3pJS2FNTVV3MXVyWkUzcVU4T3dT?=
 =?utf-8?B?YVgxN0dWN1JqeWVBdnhTcW8vVDNZMllxdXRrOGw1SytyL3l4QTFzRmdwd1Y1?=
 =?utf-8?B?OXNEKzFUaE5qVTBGbWpQQVc2WmExeHpBa3lYNndFZUxBQUFRbWpPVGhpZGk3?=
 =?utf-8?B?cG5Cbi9YQWt1UWlSVExHUkc1UnZzbnZMbFBQaEZDRXVJOVdSdWZYM3liM0dX?=
 =?utf-8?B?RmhwTTFJc0xEV0lETkd4VmMxKy9FOFlhOGcvbGVhc1pDcDR5VFd2NXZnYlFW?=
 =?utf-8?B?b3U5MllwdEUyVVc0UkM4M2hjZ3RDandqdm5vMUswK3BhQXVhS2h3ZmVXUnpE?=
 =?utf-8?B?WFc5N2M3QnQrSG5RemgvbHg4WmFJaGU5THNQdlhRMjJncjF5TXpLM2Q4SWgw?=
 =?utf-8?B?Vmg5YldrVWE2K1ZKWlhaa1ozRkNXdFZaYSszdWJYc29SU3JXdUo5SENNd2RB?=
 =?utf-8?B?TjN0MHVXUzR0a3RDcjMxcVBiZmVCSHN1VVZpZUxzNyt5dVlIRjBKdzNkQVAr?=
 =?utf-8?B?bUFseCsrK05CTWNNTFBRYlJRY0pLam1CRXA5MFJtb2pBZnZoWkt3ejdZRnVh?=
 =?utf-8?B?NGxFcG1Fa3lleEVZY3YreDNYZTdmU1FaYUVZOVFjS3Bpc0N0TTRBZUlwNzZR?=
 =?utf-8?B?N2g3M3o2SGJNaVh1VCtLc0V3Z2pINTRFMmtPNzQ0d3h0UDJEcXdBamxNVkN0?=
 =?utf-8?B?bXZvOWxIQkk1TkV6RmlXeDlVdnNqOUIzTFR5NUNvUW9hTnhpYzhYanFBMk9S?=
 =?utf-8?B?VHFFRVpFV09pOGdCZ0UvcEJldzBWMkxzWlVPNENaM1BoTkVJWVdVZ0hhdXFJ?=
 =?utf-8?B?NWpud2RFQUNkQlRiNmJCRmJMNCszUDlQZlpia2dNeDBSbnhaQ3JWTm5NODJl?=
 =?utf-8?B?VlhzaEt2QldBbWN1ZkdMdUJvdFFjOGQrZjgvNlBjVjdTb082c1ZzSTZvdXBk?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc485969-9639-47f9-e1be-08dd9dc158ca
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 08:26:30.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NOK+5tnRkdjgej7DML50DSyav2R101cGzpM+Yza5xpEXZ4MUn0mZ0Rbw3K4mYLwlc+j0jrJXkPUxbUx1LsiSVSc04pW9rnT0y/iyQ6MTrAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4813
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

On Fri, May 23, 2025 at 10:01:25AM +0200, Zbigniew Kempczyński wrote:
> Verify intel_blt is able to properly copy matrix from one buffer
> to another.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_copy_basic.c | 52 +++++++++++++++++++++++++++++++++----
>  1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
> index 404fe7f50a..be400e3175 100644
> --- a/tests/intel/xe_copy_basic.c
> +++ b/tests/intel/xe_copy_basic.c
> @@ -62,6 +62,19 @@ struct rect {
>   * @17: 17
>   */
>  
> +/**
> + *
> + * SUBTEST: mem-matrix-copy-%s
> + * Description: Test validates MEM_COPY command, it takes various
> + *              parameters needed for the filling batch buffer for MEM_COPY command
> + *              with size %arg[1].

Please see comment on test description in patch #8.

With that:

    Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> + * Test category: functionality test
> + *
> + * arg[1]:
> + * @2x2: 2x2
> + * @200x127: 200x127
> + */
> +
>  static void
>  mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
>  	 enum blt_memop_type type, enum blt_memop_mode mode,
> @@ -79,13 +92,17 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  	uint8_t *psrc, *pdst;
>  	int result, i;
>  
> +	igt_debug("size: %u, pitch: %u, width: %u, height: %u (type: %d, mode: %d)\n",
> +		  size, pitch, width, height, type, mode);
> +
>  	bb = xe_bo_create(fd, 0, bb_size, region, 0);
>  
>  	blt_mem_copy_init(fd, &mem, mode, type);
> -	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
> +	blt_set_mem_object(&mem.src, src_handle, size, pitch, width, height,
>  			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
> -	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
> +	blt_set_mem_object(&mem.dst, dst_handle, size, pitch, width, height,
>  			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
> +
>  	mem.src.ptr = xe_bo_map(fd, src_handle, size);
>  	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
>  	psrc = (uint8_t *) mem.src.ptr;
> @@ -112,8 +129,20 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
>  				break;
>  			}
>  		}
> -	} else {
> +	} else if (type == TYPE_LINEAR && mode == MODE_PAGE) {
>  		result = memcmp(psrc, pdst, pitch << 8);
> +	} else {
> +		result = 0;
> +
> +		for (i = 0; i < pitch * height; i++) {
> +			if (i % pitch > width && pdst[i] != 0) {
> +				result = -1;
> +				break;
> +			} else if (i % pitch < width && psrc[i] != pdst[i]) {
> +				result = -1;
> +				break;
> +			}
> +		}
>  	}
>  
>  	intel_allocator_bind(ahnd, 0, 0);
> @@ -190,8 +219,10 @@ static void copy_test(int fd, struct rect *rect, enum blt_cmd_type cmd, uint32_t
>  	ctx = intel_ctx_xe(fd, vm, exec_queue, 0, 0, 0);
>  
>  	if (cmd == MEM_COPY)
> -		mem_copy(fd, src_handle, dst_handle, ctx, TYPE_LINEAR, rect->mode,
> -			 bo_size, pitch, rect->width, rect->height, region);
> +		mem_copy(fd, src_handle, dst_handle, ctx,
> +			 rect->height > 1 ? TYPE_MATRIX : TYPE_LINEAR,
> +			 rect->mode, bo_size, pitch,
> +			 rect->width, rect->height, region);
>  	else if (cmd == MEM_SET)
>  		mem_set(fd, dst_handle, ctx, bo_size, rect->width, 1, MEM_FILL, region);
>  
> @@ -214,6 +245,7 @@ igt_main
>  				 { 0, 0x8fffe, 1 } };
>  	struct rect page[] = { { 0, 1, 1, MODE_PAGE },
>  			       { 0, 17, 1, MODE_PAGE }};
> +	struct rect matrix[] = { { 4, 2, 2 }, { 256, 200, 127 } };
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
> @@ -243,6 +275,16 @@ igt_main
>  		}
>  	}
>  
> +	for (int i = 0; i < ARRAY_SIZE(matrix); i++) {
> +		igt_subtest_f("mem-matrix-copy-%ux%u", matrix[i].width, matrix[i].height) {
> +			igt_require(blt_has_mem_copy(fd));
> +			for_each_variation_r(regions, 1, set) {
> +				region = igt_collection_get_value(regions, 0);
> +				copy_test(fd, &matrix[i], MEM_COPY, region);
> +			}
> +		}
> +	}
> +
>  	for (int i = 0; i < ARRAY_SIZE(linear); i++) {
>  		igt_subtest_f("mem-set-linear-0x%x", linear[i].width) {
>  			igt_require(blt_has_mem_set(fd));
> -- 
> 2.43.0
> 
