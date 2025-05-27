Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1067C54F30
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 07:55:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F8710E416;
	Tue, 27 May 2025 07:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjyWPr0o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E877D10E416
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 07:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748332515; x=1779868515;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MPnL68dCFu7aH0TXLoWK1FlFbFqDt0kPvTx+R+wiJKA=;
 b=EjyWPr0oiXDGPFEP/mNLv4iW0K7O/Vv2G5g+DopQFLrqo3Zw/pcIN/JR
 6It9X1tdZaqet/e2tCPV4Y6vznkn8BxGIfzre9orgdAhiTwZw7a/PVpjh
 bbIOQPZ/co8zne+hI7shmNoiJ9D4x+h8S7oGRqY18q5u5mqFdTwswVoC+
 72xfifCBSax1DCIyXDeTnFWQhus9TZVFxwhQ23nFhjPDb2NQXP9P0zVG/
 LxvI0n8VGSW/jHNG4yHPcV1PTUPfY/HeBNO7hlV8yv36XT+r9xk6+k3EN
 OMNrB4VDEIwlnFq6M1ti2CfDpfWUKxk/VT5EOm50groqFRhr2vtAVgoOY g==;
X-CSE-ConnectionGUID: qQ4z7MhHQ62rlks/lbr66g==
X-CSE-MsgGUID: k9hsNz2iT8iGHeELHwgNwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="49421713"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="49421713"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 00:55:07 -0700
X-CSE-ConnectionGUID: cfmLKnKPQf6gsEqlcbOo6Q==
X-CSE-MsgGUID: W1WkFwDDQD2tOJ/Du6U9IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; d="scan'208";a="142691437"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 00:55:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 00:55:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 00:55:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.76) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 00:55:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giYqnNn7ISzeJqAOYNibIjQvTkwM4BeV7b6SFI9OH0ICkJQfMtZVAS7vTl35EjetSh30wC+Il0Bej6uh6FbZ/aj3HpHe/pR0YrdZN3GPPzXwd3K3IR0aE4MISNl+U0Nhgt21w7NWkldlQ2clWdG4/c+CT82zStOonjEwBOVkqDvtbxqZZDR+hk5bMKP96R0rDq8RubSQ69sGo+vqfztH88qqBJCFWr5GphbRKLNJ9zIHuFDqGXkfVEg0NgKLE1PN1OJ5gQKL3DK3G7S2B+6gvrNMqGp618iHRspxxm4KW8WAojApDaOTzMcC2rih5pujFKvpytFoy/kx8LLDcEUVnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WGpN3KXL8QhnZIXI89MZjP6W5xXu2hAnVqA/4NxjYio=;
 b=ZLaICjlNZznvp0lp6XrMXgQs3Yrvsx2FbbNj8LGYzXSQBWQqHWio2GAziXyZUa5r+aQVxEgnT1cCnOmCvB4QeSvXl1VG7LRL2r14QbRKQlTLedu6K667BaXXTENS7bjECHjmpmY2nApc5Jbp8TISa+VufKNHcaiN45L/i4I1JSNaJ2c8/NyUe2T8lZsGCOBmkGCCW9+d5mTC2RwnGTdFTbAa3TKIYV4Alko6Bi/OygVd7FPh5EFYaOM7hnxM7xDCBIen3gBVrdCRxClRwhDAEKcMzSsW7QHzWHbeFEuxZ9rHKvltAthH5lEVNV1LwdR+qai2Oes1/3ScpxeUyDVOUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH8PR11MB6610.namprd11.prod.outlook.com (2603:10b6:510:1cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 07:55:05 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%3]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 07:55:04 +0000
Message-ID: <ce9c56ba-f7ac-42fc-9a8b-f5715995b563@intel.com>
Date: Tue, 27 May 2025 09:55:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel: skip subtests using "mocs" debugfs if
 it's not present
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20250526072723.7704-1-lukasz.laguna@intel.com>
 <20250526154602.zhgzid5q6luwn53p@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250526154602.zhgzid5q6luwn53p@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:803:1::17) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH8PR11MB6610:EE_
X-MS-Office365-Filtering-Correlation-Id: d916e99c-2430-4860-5640-08dd9cf3ca6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXBzbTUzd2lPTHlNb2pBQmlNMU5OaHZuNGNmYlV1MnMwSUVJNElhMTVTbmFT?=
 =?utf-8?B?NysxU2FGZVNaZ0JzRVRwZ1Q1Y1Z4QmM0K1BzVDV1SFVKWnNxZUlsNHY2MmtO?=
 =?utf-8?B?OU0yQkgrZS9aeThvYzJUYkxKSGtNd3VEU2lxaEorMU5lVmY2Yk9GUHZGZ1Vv?=
 =?utf-8?B?T2NKbEVXd2UzY1R1Q2NyWEs4K2t3ckpjenhSamttUU40VDlXZWJ0Ylk3Uy9I?=
 =?utf-8?B?U0lmS01Vc0tlNDNHcFprR3dTTk1QL2FxWHRWMGxoSUJhREszZ3BoTUk5MGp4?=
 =?utf-8?B?eHg4RnlCWnFQQXlVU1AxRm94WGZvUnJkVTJMdHFkVUtQSGtKbTU1T05pTjQy?=
 =?utf-8?B?MXhBZk9VckNscm52T2JuS1gzZy9paDB5RXc5c0pNMzNEdHk0SjE5ZGUzaDJy?=
 =?utf-8?B?Wk9pOFdaZW56SmJKelNhVHB6SXlNRk9MUmE4VFdCRm4wQVpMemZlMGM1dnlx?=
 =?utf-8?B?NWlldFVKTnJsY1dDT2xuU1JQMGdhdFpnZ0VLUDVjSElxSVRjUU01dEVvY3hr?=
 =?utf-8?B?bUl4U3VCVVV2MHJyVXQvZFduOHZyTVNmZ201WVR5NVNHOWN5VFhjcE9jWUtX?=
 =?utf-8?B?UGk2U3d2dGpsUE1tYkk2MXl3OGsybGxlSXMxNFRDbFkrOVJXcmRCdG03ZnVW?=
 =?utf-8?B?MXBhN3VGOHNaSnBaaUppMmlpVW1keXd2aUM4ODZ0R2tYY3BiRTdMdU5STXkz?=
 =?utf-8?B?RjVlWUZaNmtCSE5OYnBjNHZybnIyU2dUTkd1RGZCSW1LYmEzT2hxTHorZFNt?=
 =?utf-8?B?eEhkQkZMM0MrcXl6Q1N1TGYrQXBoalBYVkVEeHBIYWJldlpCL2w3amtCbkdI?=
 =?utf-8?B?QTgwNFk1SEZXN3RaTnM3a0l6eVhNMFlZNkQ4UURIVXZmNitXQ0IwSkNQVDQ4?=
 =?utf-8?B?azNkYTB4b3cyYnlyZStPY1R0MGoyYlhWZXBoYUJKN1FROWd6dzV1WWNoU0sx?=
 =?utf-8?B?UjJZcGgweExHa2FMREFtUEpndWRRTFQ4ME15SU9BNW8zeHJ0eTN2c0xhZytW?=
 =?utf-8?B?SVM5TUhCOFVuZ2JpblkyaUNmUTdxM3VEZWhHOVpPWkNFcXRKVk1ZMFYwWkh6?=
 =?utf-8?B?YlpSNG5jVHBYSWJPTEhla0FiSmlxUHB1VXRGRDFBZXN1UEJuSlB0dVlyUUhU?=
 =?utf-8?B?eW9JajdBSHZ4Z2JaeE1TcXZFZW5oRUFSY2d6Y1V5Vmc1aWE1QUZMMjd4MDZE?=
 =?utf-8?B?bkNGS0RTdnhEMVBmY0dZSHY4KzBKL0FQaVk1NmUxaGVtdGdMVDlhcnFvTEhR?=
 =?utf-8?B?SUdYSks3enltamVKV0daNThxMHBmbHBKTWQyL0YrWThERk0vcEYzY2xQVHFY?=
 =?utf-8?B?Y3NsbnMrK05tdVJ1SGt0M0Jhd25JbXFXQWlPYTlaWWRYV0hUSHhTdnYxalNO?=
 =?utf-8?B?MTlUVkcwZXNuMDFUV0pJY0dDT1Vac3ZJb1kyQnFkdFBaK0xkenFsY0YySm5v?=
 =?utf-8?B?bFFPYXU3d205WUQxZHp5V2RnWTQ5VUthbklIZEpXeEVzMVFsQWl0cTNmME1w?=
 =?utf-8?B?cXlDUUxQTmpHeUZGU3VHSDNiZU1sVE54eGRNVDNjd3NETW9wVnhoOUdaZENU?=
 =?utf-8?B?T1oyWXJkeVV5RWF4eWlSakhZZHUwTnJIMWxvc3daMzNrWVBaSGVCYnpCYkFv?=
 =?utf-8?B?aTZKWEVpVHE3V005ZGtsYVk4RXJHaTJ5b3hVWGpOVGhFNmg5bDgvbkU0ZkY1?=
 =?utf-8?B?RDk0RHJIbklwQ2lzK1djZDhmVEt1MjlTREQzSGNrU3dCSG5Tcmk3aWpCdk1h?=
 =?utf-8?B?bWFXL1RZcno2TkdQTWZ6MytKeXFoRWxrdUFvMG8wcnI0dzFTdm56ZDIwMUky?=
 =?utf-8?B?cFZWNHJkWVVQcFBuZ1FwSnRWRzRGM1k2cWtPYnRNQ1A1OUp1a2xBQU5mVm1h?=
 =?utf-8?B?SWcwSFZ2cWxvc2tSNWpUV0RNOWdCbmZ2MVFxTzRuNDI0a0tuY2dIdndjTlgv?=
 =?utf-8?Q?yOIEP4QrBXo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3ppbmNhVDQ2dEFzY0VNMTc4SjZkRFNtbTh5cWRxM3FjUUV4UU1aak5acXQw?=
 =?utf-8?B?QkM1bDF5bEl1bmlRRkN6bjhPcFBJU2dENHNFdnp0Qy9SbmxMS2srQk4xL3FS?=
 =?utf-8?B?dW5CTDlKaVQvMlYwYXF4NkZJRzN3TkFKM0VCT3ltSW1abW5BVDNkMW1SWjlj?=
 =?utf-8?B?cTJPNm9sdCs1Y3RTcHpGTWFMQTZ0a3Q4RHhkcXFVY3ZzWDJZNzA3eUZHTkxB?=
 =?utf-8?B?QXBNaHNhbFhHTE5oQU1nUGFQWmJlNnkrN21ncnNTVXhNN1EzTXdzdjNMMTVN?=
 =?utf-8?B?SGJYSStwbFU4am5veU1JUmRnZWZXbUdhRHhNVitWSmxxdk5uT20vZnVQandU?=
 =?utf-8?B?dU55RDkrSEtlemNrRG1TT3kySGdNdEZoVTl2cyt5UG15ajFJSHRlaGlOQjhB?=
 =?utf-8?B?V21nemZHS3dwV09JZW9Xd25KR2pkME9HcDVGck5PbjV5YWFBcVFKRjlTdmtU?=
 =?utf-8?B?NUlaclRNZkhrN1NNY1I4SlcrQUNFVXFIUEVRQ3VoWTRiVWFjSHpROTF0MzlF?=
 =?utf-8?B?RkJoNGc4SU9BbDZKeUd5TlBESzA3aW9jMW1tc1BHZzYrSzZwWldOTmRJN2hm?=
 =?utf-8?B?dnpjV0FEbWxQeEo3aCtJS0JxWG1aZHlZUzRYNk42d2ZRQXE1WnJXeU03Rjg5?=
 =?utf-8?B?ZDhoRzc5TDdLUEdmTno1N0NpNDRRUnptMW9NTmRVSFpWcVlNcHZEZnh2b2Ur?=
 =?utf-8?B?MjVUNnp3ZzZ5S0l2a216dy9pbkZoSXEyYmxBdlo3a2lveU5DTkRZTFRIaHJx?=
 =?utf-8?B?Y2J5L25WdXphMWJtNW1rN0J1dW9IN3hmNTFZT09nUXdTUFJROXo1T1cvWGU2?=
 =?utf-8?B?dFNGUUF5a2ZnL0RXd1BUUnZxOVIza29SR1E4Q3JpUnVaWW8yRGVnRDl2MWJH?=
 =?utf-8?B?OUFDaGVXUysvUVVZRzlHZExGTk9lUk9OZmlPQ0pZL0JYdTV4VDlsZ2JDN2ZL?=
 =?utf-8?B?Y2tRc0xNVDVJNDZ4bVo0Y1FzYk1hazFLNXI2U1AybjRJTEVGRzYrN0o0Z0M2?=
 =?utf-8?B?VTFwVHRYeXY4WTh4aWFUOFQ5V1BnNWNlOVAwQVVIZmZmVDl3OGFxUklPaHFN?=
 =?utf-8?B?Nmw3VWlseHMrNnpTa3IyQ09tamQ5MUt2cDEwK1g1SkpHdDhWcm10UlZtVXdB?=
 =?utf-8?B?bTFZUUNIY3RsRkJnbVI5ZFpBN0sxV3hiRkZEM1Iwa2dPb1ZoQWNCbkpIY3Jw?=
 =?utf-8?B?WmZzendzNXpqSC9yUCsvdDVjVlBoN2ZvUjY2TjZlYlFZYmtvMUNicHN2eldQ?=
 =?utf-8?B?aXZaZTI2dTBNMldGcjUxcVROOGNvU3VVaVd1MUplV2M4VjRpWHBCTEprSUcy?=
 =?utf-8?B?ZVlBWG1UUVNTcU5pUWhTcHA0MkVUdWE2RFdaeEdlT1lLT2h3Zm1kbVpiSTRn?=
 =?utf-8?B?dWZKMWhHbW85VWwwdnJaZkhWNi9FZ2gyb3BNODQ3YzlHdUR4bStuK3VSSlhM?=
 =?utf-8?B?Z2NWZXd1dzMzemdOTm02YjNNMDZEMjlTTnpDMStwOENrbksrWjVlL3FGRnpx?=
 =?utf-8?B?cXlxVTV4M29jWDFXZWhqaEIxTUM4UVZtMnJQZWh6aVVlSUJEQ3dwSGxNS2Qy?=
 =?utf-8?B?OGM4TkpkRnpZRExRbUJuWU1Fa0g3MFkxblBaeDNmem9sYy92SkFMYTFTRUs0?=
 =?utf-8?B?ZFZGSGxYYUFsNFJxdStVZ2xRV2l1WGdKeUM3L05KUklLRXc5MHJlbzFFOVhk?=
 =?utf-8?B?WjFCRXpFRVdnem8weDhiUDBqMTFzdTlmdUtzcDVjK3lMNjdDdFlRRFhpa1lT?=
 =?utf-8?B?bXJ5OEdiMWtaWDJhSXZjalJXNXpsREpkWjZCU0NXb0VETWc5cVBVZHFyUXli?=
 =?utf-8?B?SGFtcVBCQUwyT1Q4MjN6QWN2ZkY1N3B2L2tQQ1J5bGY3NHhRZ1lyL2oxUTZn?=
 =?utf-8?B?RmFoQW5LOTBqL2JXOVJUeVVCaDBFWHROeVFUWmdNeVdpL1lVdm9PWXBTYmtu?=
 =?utf-8?B?M2k3V3REd3hKTlZMNTlOWWtSRTJNSEhjZ0FuTTdOQ1dGZEMyYkpYelUrSlJz?=
 =?utf-8?B?SzhMSWM2S1dTQWxRZ0p2b25leElzaW9iUDJ0d201ZFkwK3FPYmYrZUdpNXpy?=
 =?utf-8?B?VCtRTTZKOVNnZWYxaTlVcHZFOWZhOURRbnN0MmpzNy9NZTZieWhaUUVrN1hB?=
 =?utf-8?Q?OIiW/tCSW6/sQxl9R2t08tuIt?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d916e99c-2430-4860-5640-08dd9cf3ca6c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 07:55:04.7857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ShSU74gO6H54iSxYIBXjPJPeSmSvk2zOpFpIjF9xbVkDUTfjxRLulxOWLB/QLhbuBHhWkrTnMgsCi8PMYM9KHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6610
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


On 5/26/2025 17:46, Kamil Konieczny wrote:
> Hi Lukasz,
> On 2025-05-26 at 09:27:23 +0200, Lukasz Laguna wrote:
>> The "mocs" debugfs entry is expected to be missing on VFs, so instead of
>> asserting its presence, skip the subtests if it is not available.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_exec_reset.c | 11 +++++++----
>>   tests/intel/xe_pm.c         |  4 +++-
>>   2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>> index 67b7bb826..e757141cb 100644
>> --- a/tests/intel/xe_exec_reset.c
>> +++ b/tests/intel/xe_exec_reset.c
>> @@ -597,19 +597,22 @@ static void
>>   gt_mocs_reset(int fd, int gt)
>>   {
>>   	char path[256];
>> +	char *mocs_content_pre, *mocs_contents_post;
>> +
>> +	sprintf(path, "gt%d/mocs", gt);
>> +	igt_require_f(igt_debugfs_exists(fd, path, O_RDONLY),
>> +		      "Failed to open required \"mocs\" debugfs entry\n");
> Good idea, imho just print which one you couldn't open:
> 		      "Failed to open required debugfs entry: %s\n", path);

Good point, thanks for review.

Regards,
Lukasz

> Same apply below.
>
> Regards,
> Kamil
>
>>   
>>   	/* Mocs debugfs contents before and after GT reset.
>>   	 * Allocate memory to store 10k characters sufficient enough
>>   	 * to store global mocs and lncf mocs data.
>>   	 */
>> -	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
>> -	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
>> +	mocs_content_pre = (char *)malloc(10000 * sizeof(char));
>> +	mocs_contents_post = (char *)malloc(10000 * sizeof(char));
>>   
>>   	igt_assert(mocs_content_pre);
>>   	igt_assert(mocs_contents_post);
>>   
>> -	sprintf(path, "gt%d/mocs", gt);
>> -	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
>>   	igt_debugfs_dump(fd, path);
>>   	igt_debugfs_read(fd, path, mocs_content_pre);
>>   
>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>> index 6eb21d5ec..6cf532a88 100644
>> --- a/tests/intel/xe_pm.c
>> +++ b/tests/intel/xe_pm.c
>> @@ -743,7 +743,9 @@ static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_s
>>   		igt_debug("Running on GT%d\n", gt);
>>   
>>   		sprintf(path, "gt%d/mocs", gt);
>> -		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
>> +		igt_require_f(igt_debugfs_exists(device.fd_xe, path, O_RDONLY),
>> +			      "Failed to open required \"mocs\" debugfs entry\n");
>> +
>>   		igt_debugfs_dump(device.fd_xe, path);
>>   		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
>>   
>> -- 
>> 2.40.0
>>
