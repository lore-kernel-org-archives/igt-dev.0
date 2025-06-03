Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F5B7C5AE59
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 06:40:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45A310E0B9;
	Tue,  3 Jun 2025 06:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SyAnWRTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A1C10E0B9
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 06:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748932825; x=1780468825;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TWmOWY1PLCqelg43Xykc5VzGbjR2JW/JMieMhKDOwiU=;
 b=SyAnWRTcCgS+k/OXL2TRHIvwy6UO+Qfjl/PK/Ng/Hy4PBSlhuY1OSDbS
 VyCAtDcVTa4cJn3FFvwpcb3hnCLjgXrXoXEgDosiSi0hB4AXsjWYVI0xd
 q+vy6Y6zgUQUb3VbnqdMPkB8iKol/r52Ucysk0Jk9pxMbEO+utZQaSWd9
 lXvt3RCrdjRFQkn96vct1D62DbwGxwKUzDh+l9IJa/jj99QLIl7qGF//8
 Bkd9h7dOMfY6K0eP1t5Zrwwe35HoXzNRXKH2JnPLiOYIhRSknzMUCvU8c
 ajmODk5lEfa+lUINw6AJ6QDUK0OOs/2Rfl/HsOd+YfCJMekFaKaoXi1nK A==;
X-CSE-ConnectionGUID: hpiKOZncS+WZ7fiF+HRQuA==
X-CSE-MsgGUID: 5zeKa2N5S3OiHX7NRQvv7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="38585883"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="38585883"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:40:25 -0700
X-CSE-ConnectionGUID: zJiamv1aTSOQSDJ/g+PP/A==
X-CSE-MsgGUID: 3xFeoka1RJSyOlUzV9jKWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="148625294"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 23:40:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 23:40:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 23:40:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.62)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 23:40:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JrArwJSO06aGVV/AdQOylzdhvVfDndIP92lJeAwgQKceuRgqIMGbch5kZ8B+46dZygg/4KNedmvZNSPoeaYPuIfXlZiAbBcSpCqRXq6F/OWj2FcWO6W8BZI1EPMvqZDC0E9iz9TXKze5PlBr//PVy/ZRu/ECgKpDvxXF0VysbGDKzWfNaQ7/KvBIMXJTU2d8B3bRpStGyfHfjO7yUK7Cr3cWI4MAnlaL1CwtIkEqCQLeGxq4fYbWcTqYl5gaGkTi4Cybn/JhlQAme+k1sgJ58fWNZROmpl6tnwAzdc6QAcWLVnL/ndSiKj1Rf9MJGpZkHY0Nl9YJdFKXDryrij4cCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zg59wacvq2GNoL5uL2/qEPpj7Ktm0kCSWZK3VZpMa44=;
 b=K2HXjZBZg28EO+Ozm3oy7Dyjoz52cM4AbRfLsmrveqrna+pMwsC3W+sg4NSoMO/unplim0mV9Rg5PYAf5C0VXJCFu1LekZTC7femTYCL4NRClQuknSmItuy9Rhd5pgsArEUqBI2ZDINCUfFpfDBmPZtIh1wLDm7s0NxY91XoOeINT0RvwdLZdVM8A7mgkDwmOjxQ+h2KFPW4Vc5U4N4uMkQcavJPWK7wT4tybX5xtB6PPyvZExhO91DOBzb0VpQT0RE0iFG/fRl+yRyy4cjjIh3/kWVhr2Ezj935w05lg/Qy9OKEMsKLSapvlpv4FMhSWUZzT1QWK4roHBxxy3cOTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS4PPF69154114F.namprd11.prod.outlook.com (2603:10b6:f:fc02::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.25; Tue, 3 Jun
 2025 06:40:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8769.025; Tue, 3 Jun 2025
 06:40:09 +0000
Message-ID: <f3360c11-922b-4ddb-81b8-d7758c409901@intel.com>
Date: Tue, 3 Jun 2025 12:10:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] tests/intel/xe_pmu: Add tests to validate
 engine activity on render node
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <soham.purkait@intel.com>
References: <20250529065359.915117-1-riana.tauro@intel.com>
 <20250529065359.915117-3-riana.tauro@intel.com>
 <aDia89E6rojh0tMp@unerlige-desk.amr.corp.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <aDia89E6rojh0tMp@unerlige-desk.amr.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS4PPF69154114F:EE_
X-MS-Office365-Filtering-Correlation-Id: dff47711-828d-47e0-70a5-08dda2697bcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVZkNG16TWc1MGRtcU9PMnpNbXhraU1mdDlLd3BaOGNacXJQRDRXT1Y4emxm?=
 =?utf-8?B?NUF2TGRaclJsOHRiZU5uZit4bVFwNUZDNFFEZzhHbGtRbU9yYVB6dmRKaW5I?=
 =?utf-8?B?RzFISGJTSVNhdW8vSGJjdmk0NXJ5TEpsVUdXYThYUjNlb3J0ckE1OXBpejd6?=
 =?utf-8?B?YjFId3RUcmdNdmttUXpYWWVBTzUydlJqM0Z3emVod3ErYmZ4cnM4elFOeWNZ?=
 =?utf-8?B?QnVMMGU5a3loZ0ppUkdsQkRuemd0OC9xTUN1S3hMdXRBcDFRa3k4QS81akNW?=
 =?utf-8?B?SVE4cEJvY3Z0T1pwcThSeGRjMVF0SHc1YlZLdTBjZDk1Z2xTQS9MMlFVZEUv?=
 =?utf-8?B?dDFWK3NGZjMvVnZyMlBDdXIwYlF3d0Q1aDFEbHZ6OXJaeUlXVjZYdWpjZHJi?=
 =?utf-8?B?b3UrbUtySmZVV29jS1JsNGZOdFNxVTRGdm41RkFxUS9kZ3F0alY1VU5DT1E2?=
 =?utf-8?B?bVloSkxzQ2M4YUJ2ZTVWQlpFOHA4aC8xZVpkSGRVRjZTSGt6VGhpNTZCeExF?=
 =?utf-8?B?NnR4bjZNRE9uaHNUTGNjVTMvQStmSXpZSExsM013MzhsUFNDd3l1UUc4bitM?=
 =?utf-8?B?VTNCd0tmSmFPSXNhdGN1WU81OEtkWjR5SHYzbUxyNUcveDlmR2ZVNGkvVXhm?=
 =?utf-8?B?YW9RUVNxbXJRcXk0RXBObGhXdHFNYVJsNGhEM0pSMkZ1M0ZIV25tcTlZTCt3?=
 =?utf-8?B?bTVibm40Nk1Fd0JYbjI1cVRMNmxEK3pab3NhM081NWpUaGtZOURpNXNsa1JH?=
 =?utf-8?B?NW0yVnlmOUxvT0JpdHY2UXZGT0p6MndHb2ZWOG03bmFBQ1c0L3gxdUR5ejVk?=
 =?utf-8?B?SlBZZDA4SkoyVE9GWENRTjVMalJBM29janl2bVVjaEhRSitjT01EaXRkUDJJ?=
 =?utf-8?B?a0ZnQS9SS0VVVDhuZGFZZEx2a1dOcEZOeWUyRGhZNVZIK2Evc0ExZUxXckg3?=
 =?utf-8?B?UmNNNEozRkhaVWVCS2dLd2ZXMTFqOXVUMlFjS1dTMURMcDVEamE5UGFjRVIy?=
 =?utf-8?B?OWFyNDJ5QzVDWWM4bCtTZVp1OGhRVGJ4aVlNbVI3ZVRHamg1R1BqYytRV3pG?=
 =?utf-8?B?b2hJOUpNOERiRjhhd3FnblQ5ZTVseFp0VzE0bC9KdDF6c3pwdDZTRXYrU0ZW?=
 =?utf-8?B?VWxxWDNHOGJDUG9zcGRKMHpJQU9CSzBTU0Q5MHovMU9PbkgvdmFPTnlZaWtM?=
 =?utf-8?B?ekJocGswQ3lDd3FTOEJoR1h0T1dPUkJFYldIbksybDhISGlSK2RBeVhxd3RB?=
 =?utf-8?B?Tnd4V0JNcnpFanVWVzB1OWkvUUZkZEFvNzc4VFFBMTZUbnpnZFpzTnJtdlJ3?=
 =?utf-8?B?b3h3aXpQanhmTEZ5bTdDV0pVbjhycm03bG9tRWovenlFaCtFdFBrRjNGSDkr?=
 =?utf-8?B?VzNOL2ZXSXhIWlJCMHNtaWc1S2dianZ6REdXTWs4KzRpNjY1dDZ3N0JXZjFh?=
 =?utf-8?B?eTB4dkdnemg4blVMWVAzdUVQVXdPNGY2dUVUcVZuZWoydTNrcVNmRDJ1dWsv?=
 =?utf-8?B?dTFVeFI3NmlicDc0Y2Q5SjZ2ZmkwYWZKSGdpalp2V042Y1UxOC9vNm1ndytM?=
 =?utf-8?B?OWxjZUJVS2llT2F0WnVDZ2taeXpHd1pIM21wNUVhNTN2RHZwc2JJR0ovQzZE?=
 =?utf-8?B?UDVxRHJvYXEvcGloUlNVeVhIVmpjc2wvSUJKdkJKcUdsN05QVlJsTGNVYnM2?=
 =?utf-8?B?alhEWU45dXhLZG4xZkFUSnpFVUYzTUJabzVGYzZtMnhwL3hjeXgxV0gzR0Yv?=
 =?utf-8?B?RlpHSXJyYitORGtXQ3NKL0NjTmZrcWxueXFhV0lBTjlWSUMxNDNFaEwrQ0pp?=
 =?utf-8?B?WHhZYnNSTFpWckhNZFltTnNZRkFKdUxTUHF3OFUzUml5Wkd0cmNOUGpueWFL?=
 =?utf-8?B?UkF2alpuU1l1cDlieC82OUttS3dsY20yUnUzTU5oM3EzenljTVViWWVzK1Ev?=
 =?utf-8?Q?OEcncY9RiEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWtCNzBqeXBHOWlZL0d6Slg3Yk8yR20yam00eHN3S1hyV3B6YVFOYVczaWE2?=
 =?utf-8?B?VHJhTC8wTjViR2NlQzhBamo4ZWdnbXBSdU02VTBpcmFYRWJwVld1eEl4a25Y?=
 =?utf-8?B?U2syejFob1o1MkUrMkMrTGcyOW5qYmZuNTRiZXc4UVV6bk9ERDJTbVVjZVM3?=
 =?utf-8?B?SlVocU56cWtLRlViYys3Wk1LTUsvc1J5bnVGbUpvYTVIQ2ZLbGNZTGJLNFRO?=
 =?utf-8?B?Zk1SRitPMVorcXllNjZEVDVLTEdKS3ZndnE4NHhRMG54NDVoNnFxelR3M1ky?=
 =?utf-8?B?OXUzUktudXhsUkp6VEdBM0txWFdpZ0JjcHN1QjJNdGQ5ZzFlaWNCT3JZdlVP?=
 =?utf-8?B?MkRUR2JiME9uYnFBZG5oSmYvTkZ5Z1N0elRNREVRQ1NITFhhL1FkQThBNThL?=
 =?utf-8?B?VEF5UGtCVkwvcWpqamJMcVpKQmtNUU91ZlczOUhQV2p0SWkzNStNSWdYRzNW?=
 =?utf-8?B?T29ZaTRIazA1N0t5UkRDWnZFa1o5Mkt2WVY5Z3RYYVlQQVBpZko2cFBUSExH?=
 =?utf-8?B?RUlPMU5GbUc1M1JpamZLQ1lyRTh4Q2FqRnh3aXFQemNmWUdWVlVtL01QSTRJ?=
 =?utf-8?B?NjlNN1dXWnBZSXpCSEpoWi9QYXJVOXJZOGszOXowTjFHSy9MRXFwcnF4NU9T?=
 =?utf-8?B?cTFWR09OaVp2SnFIVjNLSkhyN2d6NmNJRllLZlo5b3dpek9kakY4UkRpNTY1?=
 =?utf-8?B?OGdLQzFMN2RHWnBRS1o2UGVtZllMVGgvNUZ2NGU1dXlyZnRmTEtiYUxhZmUx?=
 =?utf-8?B?RitpWEMxa2k1WTFtdklVZHo5N1YwbjJDZWY1MkllOXFORlAxR05nZ2lSalFi?=
 =?utf-8?B?UUNSbEpOVlpsdDVSTWppMHhGUG9YM1lZVGwyeGt2SjdPbTRHbnh4Q0xDd3Vi?=
 =?utf-8?B?M2tvUjRHZXlZclhZMWw5Y1pXMVBzUjJBUmZkTDc3MzFDaXZwcUg3R0xpWlVa?=
 =?utf-8?B?SkxtRW92c0xDMExudThJK2V2ZWVLeHRxYnZWSk5RT2pZWWRUTi9UelZEQW1G?=
 =?utf-8?B?alhUajFqUVM1QVVINlViclRFWmd1ck9WNHExSlIvY2txb0szaHpaTkxQdWc5?=
 =?utf-8?B?aDZiVWptMk4vOVc5QmVLU0xnc1haSVgyQUhkZGJSMlJhYTBnejlpeVhkbllJ?=
 =?utf-8?B?aExuL2Fpd1gvZ3REZCs2aDdITm85YW9hQkpwankreDYxamxHcDN2MSt3TDh0?=
 =?utf-8?B?R1RiZHZyRTFDajRtZXFub1d0dk9KWjcyanZLN3MwLzVoVE9XZGlXQ3Jmck1w?=
 =?utf-8?B?a2RLVGlEaHN5RzNGWGNyemhZMy9ObW9HQmkvUjcyZUhGcFB1TEtBOWxjMmdR?=
 =?utf-8?B?bmZhQ2Z0MmVaKzRlNUZvTkdqVmtqM3JSUDJnL0lVQWM1dFZZV1dqQnVXS3BZ?=
 =?utf-8?B?eUd6Rmk2Y3kyR1I0b3BKaWpOM1liQmtJMDNPbVRyUzFyNFRzMDl1M3pZUVF3?=
 =?utf-8?B?YThLd3ViY0tLK09pNW5haFcvTFNRZlVBZXJnd29JZ3owczUveUFZWTdzWFBW?=
 =?utf-8?B?eXhpSTZJRm0rdmQ2cjRScW5nL3hHdjE1Q2dlbVNkZTR2Mi9WSFMvU2hKcWxM?=
 =?utf-8?B?WTF3STIxR1RING03d2ErRlp4TjkwSS9sUnpMZjFQZ3ZaVE02NEJMREQ5Wm5o?=
 =?utf-8?B?MmMza0J4UmVOWnovRVorZ2NoZ0VGL0FzZForTFdrNlZKRUpNejA3ejA2Slls?=
 =?utf-8?B?anJkUkNNL0hnS09jTVRjNW5sUVhoRWtWV00ySldSQUU4ZWxVd3V0QU9OTHUw?=
 =?utf-8?B?T1dGYndUS05vOVRBcWpyQ3FzdlRnNU5JeGdXeFUxa3NpUzZPaUMxSDdkU1Fm?=
 =?utf-8?B?NDh5N2lOc0N4UDJ0ejg5bTltRUUwVUZlN1BLQ3o5bEFONGR0cUJPZW5zZWdS?=
 =?utf-8?B?NTVveWVZcWNMUHlGT1dpTGthTHZLZTNaZjk3dWk3R2xqNWVGT3BTeHBZdW85?=
 =?utf-8?B?ampTRzZpMDF4dVFFOTlDa3oxSnpoODlnQ1RGVHBxMjlPMHNmUWxvSGtqcE92?=
 =?utf-8?B?a2d6b25kYndrck1yT1dxaDRhRXVWeDRJb2JEOTZhZ0U3ZG9xOS80c3hhNjVS?=
 =?utf-8?B?ZncySGtsbzcxcDJRQW44dU83OThDMVpSbDRWWmtzY0NnTDd5RWdwbmVRK1BN?=
 =?utf-8?Q?yoHBI+XAWLGVPjbdK6SaRnguc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dff47711-828d-47e0-70a5-08dda2697bcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 06:40:09.3595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jAKlbc5BZGEnjid2GUsrkn5lkVUAv55mn8tS8aELEugR8g8cMx4LYyqZw7ZjvHI+lK8M9jSYOnuLIc6dI/ap8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF69154114F
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



On 5/29/2025 11:05 PM, Umesh Nerlige Ramappa wrote:
> On Thu, May 29, 2025 at 12:23:57PM +0530, Riana Tauro wrote:
>> Add idle, load and trailing idle tests to validate engine activity on
>> render node
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 33 +++++++++++++++++++++++++++++++++
>> 1 file changed, 33 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 15b4b82d8..198470365 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -53,6 +53,15 @@
>>  * Description: Test to validate engine activity by running workload 
>> and trailing idle on all engines
>>  *         except one
>>  *
>> + * SUBTEST: engine-activity-render-node-idle
>> + * Description: Test to validate engine activity on render node shows 
>> no load when idle
>> + *
>> + * SUBTEST: engine-activity-render-node-load
>> + * Description: Test to validate engine activity on render node by 
>> running workload
>> + *
>> + * SUBTEST: engine-activity-render-node-load-idle
>> + * Description: Test to validate engine activity on render node by 
>> running workload and trailing idle
>> + *
>>  * SUBTEST: all-fn-engine-activity-load
>>  * Description: Test to validate engine activity by running load on 
>> all functions simultaneously
>>  *
>> @@ -833,6 +842,30 @@ igt_main
>>         engine_activity_load_all(fd, num_engines, TEST_LOAD);
>>     }
>>
>> +    igt_subtest_group {
>> +        int render_fd;
>> +
>> +        igt_fixture {
>> +            render_fd = __drm_open_driver_render(DRIVER_XE);
>> +            igt_require(render_fd);
>> +        }
>> +
>> +        igt_describe("Validate engine activity on render node when 
>> idle");
>> +        test_each_engine("engine-activity-render-node-idle", fd, eci)
>> +            engine_activity(fd, eci, 0);
>> +
>> +        igt_describe("Validate engine activity on render node when 
>> loaded");
>> +        test_each_engine("engine-activity-render-node-load", fd, eci)
>> +            engine_activity(fd, eci, TEST_LOAD);
>> +
>> +        igt_describe("Validate engine activity on render node with 
>> load and trailing idle");
>> +        test_each_engine("engine-activity-render-node-load-idle", fd, 
>> eci)
>> +            engine_activity(fd, eci, TEST_LOAD | TEST_TRAILING_IDLE);
> 
> I think you need to pass render_fd in the above tests. They are still 
> using fd.

Oh.. sorry sent the fd again. Wanted to send rev2 fixing this but ended 
up applying same patch again.

Thank you for catching this

Thanks
Riana

> 
>> +
>> +        igt_fixture
>> +            drm_close_driver(render_fd);
>> +    }
>> +
>>     igt_subtest_group {
>>         unsigned int num_fns;
>>
>> -- 
>> 2.47.1
>>

