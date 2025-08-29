Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026D5CA0FF0
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 20:57:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BA710E129;
	Fri, 29 Aug 2025 20:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVGnfqPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0573A10E129
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756501035; x=1788037035;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rVQjW+ntfoYe262sj1UFZtfUuYP95kTdb0JeKjsM2rg=;
 b=AVGnfqPMSHVB4cvFffFa5OzP4Ib982ZUl813HLNPOv8+nbZGII0Ybg9T
 8PI+G7sC6SmynEk3F7HTW+nJN7rYx65fBUqAdZ3Ms64/HjxlMWjRQjH88
 +/7njrAN9nA1ZDYFT80WdBFL2hut8z6u1BPhsmJipf+H/xzJ2oNEtGQ6d
 2YxkwWyLFd71MJ0NKHaFKYSP+IHG11reLOMrryySHelKNvqaDrtUG0EU3
 m/O72Cx/xEdJ6Vxg12kbkotYRaawTlJ6Ewm+v/wLKVRp2bCsj8hK7X4gZ
 POSVtYyVdWZ3QpvewnQgLPecDES4Td0a5ixrQGMevKNPKC6IDnB4YWL2Y Q==;
X-CSE-ConnectionGUID: MvlgXQ3fRJWlZV6LOvoAmQ==
X-CSE-MsgGUID: IYtOCTeQRBKwH0sK6W9QZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58719587"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58719587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:57:14 -0700
X-CSE-ConnectionGUID: SyM8+U9NTSCua43ThY7u3w==
X-CSE-MsgGUID: O4lwZs3MTJWtKBWF/KPisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174641862"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 13:57:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 13:57:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 13:57:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.78) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 13:57:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYQDKrB0O0chgh3tS7BZ+BWdniV9B+4KoNl7GMKXmhZpNeUwXav7yTAHaCzwM4GZr6aGFpzW22Xe1a5/uq9yap9ADBKXYAOMFiD3iMB7sudApyEz3qkeOn0RbamEetwZIR3TL5XyfX5LeiVIRB7z2EEx8/aGof6wwRMedB9zXcYRsrdoxkekeKc3yy3QbZgt3HDx0UAoM2klFdppT0JV47sx40DgK+2T6s6VXqezW/DRwC0KKbOiMVdRqx/rO1itbmr+bk3W0/IGsV9B8AytqaDCzqunOTBVT+Hq9RLIynocsajmSgAVMtnwphzxUr43OSTiyYumvaloY6xPE9RMAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T60crwYy23nbFR+Azyhj85wLoxQ/8/DcPq2GzEx4Jis=;
 b=WNpTWC+WT1lYwNdvX7IfQWIwT6anVRJx0YsHCawwQZua1m5izygh6GAh8IGrW8nTUQETTOzqtZE2Qsc7iKLj1Eb8JuYWLKgKVQGrI91U+l3/Fjki+OGd/V9NohXdMHlZWJmEh/wQ4ogNpTIe1ZIRavpxRgWVX+C8qkZLZhbIoQ1KEwhiu4G3ZPzGti8fqfa8ucARKKkx7UVh+WfFIu2k/RP0WbAm7Zu5yAJrAga6WUUwETzrf/IafuNx7rwg5ImKAy5RxJJsBEJVKTbRaE9Lj4T832A5ULDotwCkuCtsP4E2dWTp7RuIEEZiFMeilAr8V2fQZZU+vAFc7yoJJRdR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB7001.namprd11.prod.outlook.com (2603:10b6:510:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 20:57:07 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 20:57:07 +0000
Date: Fri, 29 Aug 2025 13:57:05 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH i-g-t 0/4] Updates for OA media
Message-ID: <aLIUISopEl0VPEE_@unerlige-desk.amr.corp.intel.com>
References: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:303:16d::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: 01edaa84-730b-4492-fd63-08dde73e9d31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1FaMVpkYVlpc2c0OTZDYytVYi8zcE5xT2xTZUxOZExnK0M1MEQxZE9MMEtV?=
 =?utf-8?B?ME5MSFFlTWgrbExVUVB6Skw2NnhYKzdTd2FiUHkzZVAvc3VSNE5kb1N4cWlj?=
 =?utf-8?B?ZWdCSDN3QVpBR2V2clg2UnJFYmgwamFETUhqdkhXeVBteXV3U0VJZ2daMVJZ?=
 =?utf-8?B?azZYMmlmRkpRR0M3OFlSVUZSVURKT1lqY0tZK3k3NU9jMXRDeWFDU2QzWGpw?=
 =?utf-8?B?dkQ2QkEwTUJ3eGNXNWhUeTRsK21IOUo5Um5lYkFyT0x6RnFoZ2JDcWtZRXJ4?=
 =?utf-8?B?KzdXUnMzRG9UaVhNWnpGbks5Zk9QZW5la1NCSkxmUXRVRTNLQkZGNWVHZkdF?=
 =?utf-8?B?N2RTWG9haXRCSk5Zd2l6OUF4MmlKSUpGYTdkUEVnaTVaYUJSMHV0VEhjU202?=
 =?utf-8?B?K2pIWUdaZG8rZHZkcWdWZTQzV2NHcmxTOHVDL0lTV0lCbWZ6aW9VNzVITHov?=
 =?utf-8?B?MDUweFA5R2EzaDJxZWlHUVFNNWxmVUNMeHM0T2t5WDFKRHdqTUR4SkZaR1V0?=
 =?utf-8?B?RHFjcStJYXhsMnpqanU2Q0ZjeXVRL2FXSTRkZjFjSUdiTitqN2djcHZKaytj?=
 =?utf-8?B?eEp2MzVTMWdvTjJWellRSnlTNU92REJ1V0I1a1NRdlh6by9JWTY1V1ozQUdi?=
 =?utf-8?B?RVhvVVRwdVllNjBDdDJJcGorV2dMWGhOQnRWU2t1VFZ2Y3VETmJlS05zekZj?=
 =?utf-8?B?ZFZiSDhpQy96Q2h5NFBKb0ErWlV3anJxdStrb29YeVpGaytSYjM4WmJRdXBC?=
 =?utf-8?B?UE53eW5XZXFmUGR6eSs1U2E0eUxxMHN3UCt4UitkMHV5WWs5NmFjYnlTeGJD?=
 =?utf-8?B?Qko5M1FSenRoNHNuU0ZyL2V4R3MrVElZMWh6WElMOG1QdHBBTUhnRVVDcllU?=
 =?utf-8?B?TjhVRUNpbUprYWVTMW1tUnNKUDV4cWxLeVUxWU85MTJtSjhyeWlmYzFMb1Q1?=
 =?utf-8?B?WURJMlpGeWZLaWk2aG5tTm13TTE5K0xabENkSW5QbUZXcWJnSVMvRnJBUTNZ?=
 =?utf-8?B?SUtVYkV5Q08yOEkwT1RsUUd1aEhqVmVXLzRsQ0Vwb0dMVFJDcDRReWZSQmd3?=
 =?utf-8?B?ZkRZcFM0SGpYd0xKUEEzbjVyTUh5MTlwUGJLZ2ZPbkdQU2FVSExjSWlMRy9Q?=
 =?utf-8?B?U1R0MThPYTZOUkdUKzE3dkdsQTE1dngvcnFNQXpacExtQUpvOFZMam1hOGZv?=
 =?utf-8?B?T1UvbFBrZUlaOU9iQTlmQVhtV2NQdFVXUGkrcEowcGxyR3NTMnh6R2s4b212?=
 =?utf-8?B?NFo0K0VZZlJyNXpNQzBBQWRMUE9MTGdGeml2QWttMTU2R2YxRGZkZ211RXYx?=
 =?utf-8?B?L1VEb0cvWFExQmdWNVB4UVhIbjJMcEFnY3grVWJnTGJoU2VDbFNGenhDSk0y?=
 =?utf-8?B?eWtzczk3aGhWS0JuTGZFUWsvNnovSUI3SzFiOUJPQjBia0ZuNjczRUlHT016?=
 =?utf-8?B?S2ZDQ3JOSVQyWXBOcjVydnJDWjgrTXBxZDdXZjMxVlVZSWtGSEpNQ29TVGJa?=
 =?utf-8?B?dTc2WVZuNWorVXE2elRJSFdHSlRNeHpiZ3BvVEllcXBNdWhvQ3duaWFLRG1U?=
 =?utf-8?B?VDdFNHdjQStpV1ZuRmRLSytpNm85a3JJZk9jVmJFZk11eE41cmY3RmlPSGw3?=
 =?utf-8?B?VGJQQlpBQXFmQUM2REFaSElaR3J2OHRINUs5d1h3c3NNWEoxOGxsWmQrcWI5?=
 =?utf-8?B?QWxHSnlCRDFFNllRVERHS2tsQy9nSFZHVGoxdzh3Qk5paitQSndmVnY2QVZD?=
 =?utf-8?B?ZGMybFpHbHFoNTFubVM4OFlyZk8rbitLZWsvVnpBSXp6MDNWZlZ2ckxsZHJ5?=
 =?utf-8?B?amlTckpva3BGdnRQY2xDS2poTnhIYVU0TzVyalBpeEMwbWxEZ2xQOTlEaUVT?=
 =?utf-8?B?dndKaTAra21mMFBzcG8xUFBBN2wvL3ZRQUF5UDJjYkoybDBWM2RBT1FTWEZY?=
 =?utf-8?Q?/Y4Vka+21bk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHB2d05uS1hlRkNTRWNmR0ZSa2pXWmRtVEt6Q0tFbE5LSkQ4ZG9ic1dkVzVN?=
 =?utf-8?B?S1h1QnM2cmQ0NkpHbnFYQUxxQll5aDBNaWVJU1dwT1laczFwVitPWlBldHZh?=
 =?utf-8?B?ckRrY2lNNXdZcENNWGRINks1Njg1UFhRUEM1STlxMEw2VjZKODdocTMyVGF4?=
 =?utf-8?B?NEdubGlMK1VPMHpFMU1icVF5Y21DRUdyZGxzRVdiZzdUTTIvRlZoSWRvZmFw?=
 =?utf-8?B?dFFENldvNDdlUEFIdlkySlYyZTJkU1krRG84TWpkYXBQVlNBZGk5REdEeDBT?=
 =?utf-8?B?Y0M3c3dmdTdoSTl6N0ZMcFdYOFBRMjh4b1BndEJvenBLbVpXQkJpYnZYWkFC?=
 =?utf-8?B?cE9TTGY4ZmNYY1JYM1dyQUFTcWNCU2xpNXdOSWFseGRvazF5VHhYNDZlMVVV?=
 =?utf-8?B?OFB2K2JRUE82Yzl4KzMyQ0t5VXA3RWRwTHovMFdDYzZKMk12dEZWaGdiVW1a?=
 =?utf-8?B?ZytNaytVazdkbmx5bjJyYUwzdUhGYjhCVFJXbU5YeE00OGhLeG1mdUJVTDMy?=
 =?utf-8?B?UG4zcEJVN0krdTMwTDhoUWxoTGxsUEY3R2s5enFEd0plSVJmTDJoYTVFUDg4?=
 =?utf-8?B?eFh1dzl0cldTczN6SkttUDhvaHZTL2FWYkVINFZ4V0dzUVRnekdDelhKQjNi?=
 =?utf-8?B?VlRnZHhUVFFHMEh4QWV0aGlRRUxXQ1dZaStqOVkrQlp1cTJOSDRqQTArRG5q?=
 =?utf-8?B?Qll4RkwxY2tZWnUwVVBoU0IxZG82eFQxcEJjUFlKbWNNWVBtaGxpVWZEOHdP?=
 =?utf-8?B?MVNLajlZaHdVbW4vN2xvaE5GNkU1dnA4alhYU2Znb3ZJOSs2WVUzMzN1aUE0?=
 =?utf-8?B?N3FqNXVqVndGT3ZMMnprbmphcGVWWStnUWJvaStZczNrUnkrZGdxbWhiM1gz?=
 =?utf-8?B?Q3JHOWhCSk11WDNjSE1xSzR2clJEd3lKUFNJblYyb0ZBY0o0L2FLL1lBdnJ4?=
 =?utf-8?B?VGZSSVNrSzlLTzRnQWlVRGxQVS9OYkFuTDdyRitEb1hUOFpTcDY1aCszdFBQ?=
 =?utf-8?B?amJjQXlORjRSaVUveDUyZDhhaXRNTUdIWjJHTVU1d25mVjdmQXBXWmZtR3Mv?=
 =?utf-8?B?MVFSNE1pVE1rUkF6dkJDMEVzMlVoMUlraENVM1Z5NlBDeHJwTnRTdE5Nd005?=
 =?utf-8?B?RHFlQnkzZkQ2dUQxVXVDL2JhREZ5a1lkbEU4NGxodFBIZWU3NW5WTXlaMGl1?=
 =?utf-8?B?S2IzeDNzN1BIVEl5eWFTWklJSEVzYzFERlNiR0psR3ZjcC9pQjVRZ2pzWm52?=
 =?utf-8?B?TlhMNDFxb0lrdCtrUCs1Y2hrQ2xpRlh0amdUV20yR2hhMUJicVhsVUI5Qzh2?=
 =?utf-8?B?WGo0RG0vQTZiTkJoQit0L1NFekZsbUtrUXZuZzVVTXhTRy9YUHMrRVVQajc0?=
 =?utf-8?B?TUFaQlBlU3Q0TXFiNkZXZSsxQ3RuRFIvYUZWOFRSU0JQMHE3eTMvTEIzaTdZ?=
 =?utf-8?B?WGVoMDVucG1vSWRDNVBLTzRudlYyOXRYV2lUaitGZHRXdkRTOGpJanB1SzJs?=
 =?utf-8?B?bVFpRHJITDBmMlAzUVI2alFzVE1aV1V0RlpJSG8ybHFVZ3ZFM21PenZ0UGd4?=
 =?utf-8?B?cktYVTlLcTR0QjBvVm9SbHM2R3NWbmZzLzJua2ovTUo0Q0hnSmlyM1FQWGdH?=
 =?utf-8?B?TVZ6aW85Znd0VE0wRWhKV05WTEhHdnpGdTIxSHZaUFlTbmtYajgxbnRLczNO?=
 =?utf-8?B?MjhlTFRueWk5OUQySDgxQTMxOEkyRU5Xa3NmSDcrai9LWWh0cTZkdCtRYjVS?=
 =?utf-8?B?VS8rUncxTC81TmlKbzAvZHVSMTRtR0FxMzZ2OWE4UkZ1L2pFR0dudkJWRE0w?=
 =?utf-8?B?cHk2dDFueitsSjMzSXdKeDU4a0I4QWwwQjJEeXdDM0ZsQno5Z3FXRmdNOVR0?=
 =?utf-8?B?K0J2cWNORWNaZmtNZ0ZQUTMrNjVFQkRnNHYyTFR4Q3VvQzhHVXVjUUt1ME81?=
 =?utf-8?B?N0lBTkRLazUxMUVadERFeVNFOXBaY1pra3MrMi8rd2RxaWRkWm5uZy9CdTRR?=
 =?utf-8?B?RTdqRFBIcEh1ZU1CbHl3MzdHOWFrZ2lTUlJkYXZRbWQrVkRWY00rSWpYSml5?=
 =?utf-8?B?YnRwVVc0djBybUhtZ2trMUg4dDQrcERXMHdNRWE1c0tHWXU4Y2lQSjAyQzBy?=
 =?utf-8?B?cVJDanF3ZnFVbjMxL1E0VG5HbTcxOW5UdSt3NWpzRk4ybHhCajRzL0tMQUtE?=
 =?utf-8?Q?WJStDuRZ+ESOdnyBnLBNcuU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01edaa84-730b-4492-fd63-08dde73e9d31
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 20:57:06.9848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ7UwCU4QNJ+fT1SkaoNcMz/oMkqGc86J2cB8WcrudelkML7O3ZRFCVMgnVbgvUARa9CD4sSIYBL4lXkBi9MgTpMgdRZC7IqML/JMsp6cmw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7001
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

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

On Fri, Aug 29, 2025 at 10:15:02AM -0700, Ashutosh Dixit wrote:
>Ashutosh Dixit (4):
>  lib/xe/oa: Update LNL XML's
>  lib/xe/oa: Update BMG XML's
>  lib: Update BMG/PTL device info
>  lib/xe/oa: Fix OA media metric set properties
>
> lib/intel_device_info.c                   |    2 +
> lib/xe/oa-configs/guids.xml               |    8 +
> lib/xe/oa-configs/oa-bmg.xml              | 1755 ++++++++++++++++++++-
> lib/xe/oa-configs/oa-lnl.xml              | 1755 ++++++++++++++++++++-
> lib/xe/oa-configs/oa-metricset-codegen.py |   26 +-
> 5 files changed, 3419 insertions(+), 127 deletions(-)
>
>-- 
>2.48.1
>
