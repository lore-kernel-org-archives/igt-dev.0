Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F0EC5B543
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 13:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACCA10E7C5;
	Fri, 30 May 2025 13:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="La1y88oI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B8FE10E7C5
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748610359; x=1780146359;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KoccxFc36UG7iUNfr2oKDpIz2ds3+WkRPIeq9oOxKzU=;
 b=La1y88oIJQmsr9DgecjO+Ml3XZcHEraAlQ5uOrwLuTznhHsxUOzIyRG2
 QgcRB0SXGRW3khffveEXBmcGyBHP/m1p3ZGTVuO8H6fyl8lLMsvfwuEoF
 uZrnHt3JjVov6lfkDCLNDqAs0dphezZo5Xfz0RSciweQ2dUOBK8I9V+UI
 ppLbceTpcUYvakh2NCZfbEtqye5L35sxQZQYTidrx2fZCQ5palynU3Nck
 JKVPPat8kO4n/tC7F9K7B0fCAMByb1QR0liQqre5P0wClLgOc0axk+ckx
 k/7FvBh3RJ/ClnrEQK10rJg6KzeAbSO/4Qdg6hjw0naFuOyq+v38FIEw9 A==;
X-CSE-ConnectionGUID: qFKNvD47Q/CJZE6ZvcxkLQ==
X-CSE-MsgGUID: P2u8UFiwTpC8Eb+U0okyaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="53329650"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="53329650"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:05:54 -0700
X-CSE-ConnectionGUID: nrmXU27ERuOoUZiDpldwjQ==
X-CSE-MsgGUID: akCvP4t1Ri+9jq1KS/x0Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="144343927"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 06:05:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 30 May 2025 06:05:53 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 30 May 2025 06:05:53 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.80) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 30 May 2025 06:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IICkJgzohHiJ4n2940xELMYxdXNUfoK/CeDEGlIpTVOWzs3rgDFQ+aDxa/sXkAPrlLyrTeXU9Pi1G2eMG1qGbgZROjZZ/FnYofApiIyOPQ1vmhfWXCLCC4SMtbPLj47PfHma85wr/cNgZ4PQiFz5MOoEFAZ1GhlRloO0pszkF71TII+lJuOI1RWS7I94XtiADpg1YTs7Tl6ivdNipDyRo+AmY4InjJUIkQtdRNUXcapk3xL5gs6A+aOqBs1Hrxqv8tTMt+HAkj2zPh23gRxkVbhkUoMitHSk/UEDyYhrTeTkigYALARzF2CYfcUw4eNJyXu2cOYV7nd4PvbXlfCAiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXp1hphtaAA8f0QcXOm0DXsKoRfeZAWC5NdXq3ES4bc=;
 b=NoItiJPB2QSJlS1NbZSvmhyfffHI95yKHRwKXEems4fq+w/vHYMaOnuWszv0cNJaImklImSZHaN/uExPaxF84Lj9qRbOuBEmeXG2fSTnX0OxgnUMTLiCMgQzwqMiNhCl93wrTfbkjXJvfG6cPBKIpg7QbNAxGwRfl50rgDykmFlPu6xcRn04RMMHmAluNgFUzh7bnQl4vy0/aiG+bWUtoGQ+btNS+ui33ifTgc0juMWqRzX0RABLPdbXb9vyA/CrPjKQAKjY9tCT1wpaFm2OnEZ72iCfC/cTYnDeZCU/cciOjBaJAt9/9egjI1/LySydP+JrKV0LmWcDX10hnc0pRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by CY8PR11MB6913.namprd11.prod.outlook.com (2603:10b6:930:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 30 May
 2025 13:05:50 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%4]) with mapi id 15.20.8769.021; Fri, 30 May 2025
 13:05:50 +0000
Message-ID: <65a6d61d-6799-4c0c-a6b6-17872dd32f59@intel.com>
Date: Fri, 30 May 2025 15:05:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/meson: refactor GPGPU assembly build process
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
References: <20250529-refactor_gpgpu_asms-v1-1-cdbec40cdc15@intel.com>
 <20250530111019.joox3buihntmvsez@kamilkon-DESK.igk.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250530111019.joox3buihntmvsez@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR02CA0064.eurprd02.prod.outlook.com
 (2603:10a6:802:14::35) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|CY8PR11MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: f719165d-e434-4c15-b74a-08dd9f7ab304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEl3bW9oVEYxQ2drZURBOS90WHMzNTIzZTlqQnE2UmltcWpHZXNKeVpBRDVE?=
 =?utf-8?B?QVJQUzdVREkxYWpsYUhSQUlVUThPc2FjWHZFbUp5cFlBdm9vUEhJL3lHWk1h?=
 =?utf-8?B?VWVZQzRQOEprZk9NWWZ4YzNIRGtkUXNjL3JaQm1ldnRaR0IvMTVpWDhZK1dX?=
 =?utf-8?B?NS95dzNYS0NSZHJaNzZoS1RMTnNqcUg4MXo5Wm84djlJWVNUY3pRb2U3a1lj?=
 =?utf-8?B?SHB3TkRWbkpIMzFGcUdNWnpadXJjanZiRUN4Zjk2dk5UV1ZWbUJydVNOZk5l?=
 =?utf-8?B?TjQ4dXEwL2ZhQnRaQncyTlpaczRJMnpOOHZHVldyZ1hwNGxCN1UwOGxlRkl2?=
 =?utf-8?B?c1lNZWxjazBNbHY0SHhGZ1NXSk5ZdjF3ZU5va3V2OExJQnBLVDN3dk9QN2hG?=
 =?utf-8?B?OFVUOWNFRU9ZTzY0VzhUMHNWS2FDcWRGaGxNbWdUMTNoWkprZTVORk5YYkgz?=
 =?utf-8?B?Q2R1YmYyc2RCV3Ara1QvZzJaRTIrWnQxTldDSk1ub3VnWHBjT0duc2tac3Zj?=
 =?utf-8?B?WERLSWZDNjBLNDYvc2E5eFVqd2M2QkNuNlB6ZHQzSjdDNjhZWEUrSHE0a2xn?=
 =?utf-8?B?Z0FEWFpISzc2LzB1Z3JQMWtMWEM3WUxNWDRWRW0xY05EVXREVjROejlCdnJF?=
 =?utf-8?B?Q29keTQyOEtNREFFaUd0UjF3Z245bUREQ1BTMHpUMXNoTE9VOSszOUNHTFpQ?=
 =?utf-8?B?WDloR0N2WDMyNCtjeFVrdTZDL2JiRk11TTFDbGo3ODIvcUkxQ0Z5T09hdkdw?=
 =?utf-8?B?QmdiVXRYcU4veXZpbk1OWnM0d05TQURoTVBGK1NBMnVGMUI4YkNVUEtJeHU2?=
 =?utf-8?B?eUszQktreTl5MCttOE00aFo3S2ZVbkFBTHFGaEtqSlFsL1V5d1B6UzdKY2h6?=
 =?utf-8?B?eGV1MWFieHZrQnRjOTVZSWRma0N2TndrVXQyNU5ObHRjMldYKzR5eEtGRHUw?=
 =?utf-8?B?NjRTT0J0cnRsSXJZZ0ZTaE9BQU5GQmpWRTUzTU1GczBEazdvNllPVEd5Vjk3?=
 =?utf-8?B?d0ZiMEwvU3lvYUxVck13Z0dzTzNzb012VmU3RVlZM1I5bFhjekNGUmhqcmFG?=
 =?utf-8?B?czczc1JocWl5MzJFeUlaZjFkckR0d1J3ekswUFNXKzVtQUpBNmlYQUhLTkYw?=
 =?utf-8?B?aTJQNjZKOXYrYlJSTUs4Rm9zci9WWGtIOU5jdm10ZkJTc00vL3lLTWhVSEJr?=
 =?utf-8?B?cTlSMUxGRG9Sd2JQZW42YzVCcCtFdCtWTitCVHR1VHdIcFQ1SUlEM1g0ZUtz?=
 =?utf-8?B?RlVCRWtRdEk3NHBxTzNkNG9KQjBRKzd5dXd6cnNwSUFYTU8zL3VyNHpkSTVv?=
 =?utf-8?B?eHk1RU5VOERRa1NERm9mMEFuU1E2WjlNUGU4OVBUV2xuUVVWZEJqREpqWVZP?=
 =?utf-8?B?Ym8xSExvcHl1dXpJTFF4RG5Wd3hhMEVPby9ueXhmdW1mc2Q2eHVqSndOb2Fz?=
 =?utf-8?B?S1FneEV1bTU0cGtqZlZVR3d0MHNtNDFaY2NZSUNaUDlZU00yNTNoVThvcTk5?=
 =?utf-8?B?cXhlbnhpVEZNY2FxbWlIclQwZUVFZGFQWGxlMG5ZUlFzWjFXcW93a015U2c5?=
 =?utf-8?B?eUpZYVUxb0hFczNEeFY5aFBpWnI3VStUbkE4dFQxR0NhSmIremkwZnFIRzhv?=
 =?utf-8?B?VEs4aWVBNDJpUTlFNmI4c0hvUjhqbHFSZDJpZGpUU2VQTkNsUHBrbFhkOGhC?=
 =?utf-8?B?N0xjY0JOVDBRQWV0cGh1N2pNRUFRSVZsemRrTDJRZlhLMEg1b0FsTWdWdXJ5?=
 =?utf-8?B?L1ZzYkE0UUx4bUY5VTc1WFdIZUhrYXRQakluVHZuVnBiQzdYUGtpZW1vUXJo?=
 =?utf-8?B?cFh5MDJUdHZUanhsYVlQbHNsWVVQOUt5aFNtdkZhTEUyaEd2WTNteTlRRzc1?=
 =?utf-8?B?WTV0WS9tMG1RT09nOFAxQ1JTYjluaVptNmpNZEloNEw2R1NMeDFHUk9mUUU5?=
 =?utf-8?Q?S4a9O0EAiSc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RElxeDYxVTQvLzRCVEJCU0ZIWElpLzY3SURWMFdmT2V2MUJVcHdKK1cxTVNY?=
 =?utf-8?B?aHQ1cVNXYWFyMXJHYVZ6NC9GMExZQ3pLblE3ZVhUVkE0SzlZY1o5aTV6bUNS?=
 =?utf-8?B?SnNLckYxL21PeHRLS3RTbFo4SlpTZkhwbmxRcXJFMFJwYXJ1QVkrd0tFODVB?=
 =?utf-8?B?SFVZdlBWak4yL05NS001OUNzZW5TN0NEUG1RRnBmVlg4cXZ4N0FHcmJlcWlx?=
 =?utf-8?B?STJMdEFpWmE4cmtZRFJZZ1N5SUMvb05RUjVhcC9VendGcWZMZ3owSDVrZUJS?=
 =?utf-8?B?R0pORkE2V1IwVHVEUDUrZzJBUC84M25rS3Yyb0VTSlN5ZmpFN2lreWxFcjJU?=
 =?utf-8?B?Tjh2eHM2QjNzYmhXMk9SbGl4cjFSekUvMkhHYnB0cmRVY296L1lEK3p1S08r?=
 =?utf-8?B?MXRlSkxyL1duQmY4eUZFaHpqZ2RHMUlVSVplL0NTdjdHWWllYWxnWXQ0RjhC?=
 =?utf-8?B?L0krWnhGK204cFd0dlNOQkJQNnZzcndpV0FSTWk5eU81N1VSUHUyS2RNTmNm?=
 =?utf-8?B?QTFMcnZWMjZibnJSM055aGRWd1p6OHJ4SHVSbzVKSU1ZRDFOdFdLMUZGazQr?=
 =?utf-8?B?TXA3MXU4LzJCZnhFZ3RVOXlKNVVveDlOZDZmbXpJSzJ0QzE5a05TRXZSTG9C?=
 =?utf-8?B?MmxsWnd0WCtNUDdRNW5kalVnVk9KelhSczE3bU1hUG1KbjhZd1N0aXpvQ2Iw?=
 =?utf-8?B?TWZnN3FUcFk4c2xuaGs4UGJhd3ljTjJyUGhzckw3ZnFDUlJxUEUzK2dyMU1V?=
 =?utf-8?B?OXZmbWhoYUNiZnNQMUFaYWh2YTlPbnBsTHhDVFp0L0NCaEtTSUgxL2ZNL1dX?=
 =?utf-8?B?a1VBdk5BY1UxbWk4VHZuVkMzd01lRTBFeHZaeFdOWWkyWnZFWjNFMkx3OFh3?=
 =?utf-8?B?SlJ0TmFROW91U3I4aE1GRkgzbU5uSlJlYU42Z0VweHhUN3FUcElJb011Nm9a?=
 =?utf-8?B?TGNQVWZCdUw3bkQ0UldqWk9Ud3JPMWc4WGpId3ptR3hreG04UGJ6Y3YxS2hO?=
 =?utf-8?B?VzZNKzJTcFVHNnUzMHVhMlVpaExIaWtVNStDVmYxVXBPOHAwd0NodXM5ek1n?=
 =?utf-8?B?ZzJQbmlzazYyQm01Y3JuMHJjSlRHQjI1b3NEdFhqdjNUcnNRK0VuMWZBWGp2?=
 =?utf-8?B?V3hXcVhobE9DRTJyWTEvNUhhRk1sRTZvb0tUM2FIdlZpUEdBN2FLZTREaXpT?=
 =?utf-8?B?QXA1clVERGw2aVhicCtYK0IvZHJoYkRna0xsUlVVY2RvWFNKWHFKRXpOMFUv?=
 =?utf-8?B?UGNqMXEyUzlEdUdKR3ZreXhZZzdLV253MjE4bFVRdEdNWG9UVzcxTC9RL1lv?=
 =?utf-8?B?bGJ3eVhMcDZDUTUvRW13VnV3K2xyTG93eUIzbzRWUnVRN3JhdUdJKzRqSWsv?=
 =?utf-8?B?RTcrbVd5aVJpYmVRT2NCT2R3dzMxaXpERWdlZ25uRjdQdHNvMGV5NVEyRkZn?=
 =?utf-8?B?OXY1WTgvZzJCcjRvTzNGNmhONGErV1U1d1YzYkNtVnBpWkEvbzZPWCtDZVVy?=
 =?utf-8?B?ZTlNeEdtZEVhQ1FjQldhSldERCszbmJtc0xWTklvbFFodHVVN1ZUazVCbWdF?=
 =?utf-8?B?NkJhbFJDbkFTSTdWQ0V0WitkNHp5UEV5R0lKQld3TGo1MnI4T05taVBqTFVm?=
 =?utf-8?B?VnFUWm1Cblh4UDZZL1dmazZvVnZXam5hL1B4REJLUTZCdjBOeWVoTm92MWwv?=
 =?utf-8?B?Y3EvR3pzVTBHQTBMZHpvM3Q1OFJna1ZFWndFMTRGVWU5ZDhyak8ycUQzWTVz?=
 =?utf-8?B?eFR1TXpXM1E2dThKZURCbmJIYUVOaXorVFpwOU1LUXhpRTVOdWhic0RiOUgw?=
 =?utf-8?B?ZXhqaDFBaS9TOU50MnprckRwcCt0eGUwMndQMGVQU2liQnFMVjc5dUNObWZO?=
 =?utf-8?B?M2N6dnNaSnJmZ2MxWGNOVHFTS2VyVTFLSEdnSjNJWjluWXF5RHFPWnFmK2U3?=
 =?utf-8?B?bS9KaGd2dmprSHhLbDZ5a01kclJ2K0JZcWREN1MzYWpjN2hmZFVOS3RTUnVt?=
 =?utf-8?B?SGFtYW5pV2g5b25PZzhxd1dGY1RhamxzZCt5eHBsNENkalIzSmVlUVVOMXJs?=
 =?utf-8?B?YWFpMFUwR09ocW1WMmNxbFp1RkVPU1VXL1hBTWx6QlRtVGZ2akNndzgzZitq?=
 =?utf-8?Q?es2lkDRoZffiPX8T1gWscv7ZF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f719165d-e434-4c15-b74a-08dd9f7ab304
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 13:05:49.8483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d95QRGct1byKNd3QmmXeGDiQqXuUF2VJa8KB07NUch5aSOfaxlgTLOYvMJ3iOX+tIUSkNm5mnWH9KLdquvKsOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6913
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


W dniu 30.05.2025 o 13:10, Kamil Konieczny pisze:
> Hi Andrzej,
> On 2025-05-29 at 14:32:23 +0200, Andrzej Hajda wrote:
>> GPGPU inline assembly was build into one big code file
>> inside libigt library. This approach has few drawbacks:
> Add newline here.
>
>> 1. Only files from the library can contain assembly.
>> 2. Change of one assembly chunk results in re-build of
>> all chunks.
>> 3. Most shaders lands in lib/gpgpu_shader.c.
> Add newline.
>
>> With this change assembly codes are generated and stored
>> in files relative to files containing asms. For example
>> lib/gpgpu_shader.c will have codes in
>> lib/gpgpu_shader.c.gen.iga64_codes.c.
> Remove last dot from filename, add newline.
>
>> It will allow to move asms specific for particular test
>> into the test files, instead of putting them to lib/gpgpu_shader.c.
> What about a little more explanation here, like:
>
> It will allow to move asms specific for particular test
> into the test files, instead of putting all of them into
> lib/gpgpu_shader.c. In result, GPGPU fill assemblies will
> be sparated into new one.
>
> Up to you.
>
>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


Thx, adjusted and pushed.


Regards

Andrzej



>
>> ---
>> This is just upstreamed version of internal patch.
>> ---
>>   lib/gpgpu_fill.c.gen.iga64_codes.c                 | 80 ++++++++++++++++++++++
>>   ...ed_codes.c => gpgpu_shader.c.gen.iga64_codes.c} | 76 +-------------------
>>   lib/meson.build                                    | 40 ++++++-----
>>   scripts/generate_iga64_codes                       | 14 ++--
>>   4 files changed, 112 insertions(+), 98 deletions(-)
>>
>> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
>> new file mode 100644
>> index 000000000000..b223425d049a
>> --- /dev/null
>> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
>> @@ -0,0 +1,80 @@
>> +// SPDX-License-Identifier: MIT
>> +// Generated using Intel Graphics Assembler 1.1.0-int
>> +
>> +#include "gpgpu_shader.h"
>> +
>> +#define MD5_SUM_IGA64_ASMS 8304c8bb11385470bfd6ac32e1c36840
>> +
>> +struct iga64_template const iga64_code_gpgpu_fill[] = {
>> +	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
>> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
>> +		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
>> +		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
>> +		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
>> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +	}},
>> +	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
>> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
>> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
>> +		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
>> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
>> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
>> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> +		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +	}},
>> +	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
>> +		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>> +		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>> +		0x00000061, 0x02150220, 0x00000064, 0x00000000,
>> +		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
>> +		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
>> +		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
>> +		0x00000061, 0x04450220, 0x00000054, 0x00000000,
>> +		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +	}},
>> +	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
>> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
>> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
>> +		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
>> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
>> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
>> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> +		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> +	}},
>> +	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
>> +		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>> +		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>> +		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
>> +		0x00030061, 0x04054220, 0x00000000, 0x00000000,
>> +		0x00040461, 0x05050220, 0x00000104, 0x00000000,
>> +		0x00010361, 0x04050220, 0x00220205, 0x00000000,
>> +		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
>> +		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
>> +		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
>> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> +	}}
>> +};
>> diff --git a/lib/iga64_generated_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
>> similarity index 89%
>> rename from lib/iga64_generated_codes.c
>> rename to lib/gpgpu_shader.c.gen.iga64_codes.c
>> index 551dead2be17..fffe242fe138 100644
>> --- a/lib/iga64_generated_codes.c
>> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
>> @@ -3,81 +3,7 @@
>>   
>>   #include "gpgpu_shader.h"
>>   
>> -#define MD5_SUM_IGA64_ASMS 22a5a4671242c3257209f4051f1c0c7e
>> -
>> -struct iga64_template const iga64_code_gpgpu_fill[] = {
>> -	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>> -		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>> -		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>> -		0x00000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
>> -		0x00041b61, 0x04550220, 0x00220205, 0x00000000,
>> -		0x00000061, 0x04754550, 0x00000000, 0x000f000f,
>> -		0x00132031, 0x00000000, 0xd00e0494, 0x04000000,
>> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> -	}},
>> -	{ .gen_ver = 1270, .size = 52, .code = (const uint32_t []) {
>> -		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>> -		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>> -		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
>> -		0x00030061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
>> -		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
>> -		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
>> -		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
>> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> -	}},
>> -	{ .gen_ver = 1260, .size = 48, .code = (const uint32_t []) {
>> -		0x00080061, 0x01050000, 0x00000104, 0x00000000,
>> -		0x00000069, 0x02058220, 0x02000014, 0x00000004,
>> -		0x00000061, 0x02150220, 0x00000064, 0x00000000,
>> -		0x000c0061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x00101c61, 0x05050220, 0x00000104, 0x00000000,
>> -		0x00041b61, 0x04050220, 0x00220205, 0x00000000,
>> -		0x00000061, 0x04254220, 0x00000000, 0x0000000f,
>> -		0x00000061, 0x04450220, 0x00000054, 0x00000000,
>> -		0x00132031, 0x00000000, 0xc0000414, 0x02a00000,
>> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> -	}},
>> -	{ .gen_ver = 1250, .size = 52, .code = (const uint32_t []) {
>> -		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>> -		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>> -		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
>> -		0x00030061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x00041c61, 0x05050220, 0x00000104, 0x00000000,
>> -		0x00011b61, 0x04050220, 0x00220205, 0x00000000,
>> -		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
>> -		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>> -		0x00044031, 0x00000000, 0xc0000414, 0x02a00000,
>> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> -		0x80000901, 0x00010000, 0x00000000, 0x00000000,
>> -	}},
>> -	{ .gen_ver = 0, .size = 48, .code = (const uint32_t []) {
>> -		0x00020061, 0x01050000, 0x00000104, 0x00000000,
>> -		0x00000069, 0x02058220, 0x02000024, 0x00000004,
>> -		0x00000061, 0x02250220, 0x000000c4, 0x00000000,
>> -		0x00030061, 0x04054220, 0x00000000, 0x00000000,
>> -		0x00040461, 0x05050220, 0x00000104, 0x00000000,
>> -		0x00010361, 0x04050220, 0x00220205, 0x00000000,
>> -		0x00000061, 0x04454220, 0x00000000, 0x0000000f,
>> -		0x00000061, 0x04850220, 0x000000a4, 0x00000000,
>> -		0x00049031, 0x00000000, 0xc0000414, 0x02a00000,
>> -		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>> -		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>> -		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>> -	}}
>> -};
>> +#define MD5_SUM_IGA64_ASMS f5d2183439f5e7b18097c3c2c2957dbb
>>   
>>   struct iga64_template const iga64_code_read_a64_d32[] = {
>>   	{ .gen_ver = 2000, .size = 40, .code = (const uint32_t []) {
>> diff --git a/lib/meson.build b/lib/meson.build
>> index f5419805177f..c903aaa14bc9 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -236,9 +236,30 @@ lib_version = vcs_tag(input : 'version.h.in', output : 'version.h',
>>   		      command : vcs_command )
>>   
>>   iga64_assembly_sources = [ 'gpgpu_shader.c', 'gpgpu_fill.c' ]
>> +libiga64_asms = static_library('iga64_asms',
>> +	iga64_assembly_sources,
>> +	include_directories: inc,
>> +	dependencies : lib_deps,
>> +	c_args : [
>> +	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>> +	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>> +	    '-DIGT_LOG_DOMAIN="gpu_codes"',
>> +	    '-ffat-lto-objects' ]
>> +)
>> +
>> +iga64_codes_targets = []
>> +foreach f: iga64_assembly_sources
>> +	name = f.underscorify() + '.gen.iga64_codes.c'
>> +	iga64_codes_targets += custom_target(name,
>> +		input: [ f + '.gen.iga64_codes.c', libiga64_asms.extract_objects(f) ],
>> +		output: name,
>> +		depend_files: [ 'iga64_macros.h', generate_iga64_codes.path() ],
>> +		command: [ 'env', 'IGT_SRCDIR=@SOURCE_ROOT@', generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT0@', '@INPUT1@' ],
>> +		console: true,
>> +	)
>> +endforeach
>>   
>>   lib_intermediates = []
>> -iga64_assembly_libs = []
>>   foreach f: lib_sources
>>       name = f.underscorify()
>>       lib = static_library('igt-' + name,
>> @@ -249,25 +270,12 @@ foreach f: lib_sources
>>   	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>>   	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>>   	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
>> -	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>> +	])
>>   
>>       lib_intermediates += lib
>> -    if iga64_assembly_sources.contains(f)
>> -	iga64_assembly_libs += lib
>> -    endif
>>   endforeach
>>   
>> -iga64_generated_codes = custom_target(
>> -    'iga64_generated_codes.c',
>> -    input : [ 'iga64_generated_codes.c' ] + iga64_assembly_libs,
>> -    output : 'iga64_generated_codes.c',
>> -    depend_files : 'iga64_macros.h',
>> -    command : [ 'env', 'IGT_SRCDIR=@0@'.format(source_root), generate_iga64_codes, '-o', '@OUTPUT@', '-i', '@INPUT@' ]
>> -)
>> -
>> -lib_intermediates += static_library('igt-iga64_generated_codes.c',
>> -			[ iga64_generated_codes, lib_version ]
>> -		     )
>> +lib_intermediates += static_library('iga64_gpu_codes', iga64_codes_targets)
>>   
>>   lib_igt_build = shared_library('igt',
>>       ['dummy.c'],
>> diff --git a/scripts/generate_iga64_codes b/scripts/generate_iga64_codes
>> index 1675ffe639b3..d196c7a016b7 100755
>> --- a/scripts/generate_iga64_codes
>> +++ b/scripts/generate_iga64_codes
>> @@ -29,17 +29,17 @@ while getopts ':i:o:' opt; do
>>       case $opt in
>>       i) INPUT=$OPTARG;;
>>       o) OUTPUT=$OPTARG;;
>> -    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file libs-with-iga64-assembly [...]"
>> +    ?) die "Usage: $0 -i pre-generated-iga64-file -o generated-iga64-file obj-with-iga64-assembly [...]"
>>       esac
>>   done
>> -LIBS=${@:OPTIND}
>> +OBJ=${@:OPTIND}
>>   
>>   # read all assemblies into ASMS array
>>   ASMS=()
>>   while  read -d $'\0' asm; do
>>       test -z "$asm" && continue
>>       ASMS+=( "$asm" )
>> -done < <(for f in $LIBS; do objcopy --dump-section .iga64_assembly=/dev/stdout $f.p/*.o /dev/null; done)
>> +done < <(objcopy --dump-section .iga64_assembly=/dev/stdout $OBJ /dev/null)
>>   
>>   # check if we need to recompile - checksum difference and compiler present
>>   MD5_ASMS="$(md5sum <<< "$(< $IGT_SRCDIR/lib/iga64_macros.h) ${ASMS[@]}" | cut -b1-32)"
>> @@ -47,13 +47,13 @@ MD5_PRE="$(grep -Po '(?<=^#define MD5_SUM_IGA64_ASMS )\S{32,32}' $INPUT 2>/dev/n
>>   
>>   if [ "$MD5_ASMS" = "$MD5_PRE" ]; then
>>       echo "iga64 assemblies not changed, reusing pre-compiled file $INPUT."
>> -    cp $INPUT $OUTPUT
>> +    cp -p $INPUT $OUTPUT
>>       exit 0
>>   fi
>>   
>>   type iga64 >/dev/null || {
>>       warn "WARNING: iga64 assemblies changed, but iga64 compiler not present, CHANGES will have no effect. Install iga64 (libigc-tools package) to re-compile code."
>> -    cp $INPUT $OUTPUT
>> +    cp -p $INPUT $OUTPUT
>>       exit 0
>>   }
>>   
>> @@ -67,7 +67,7 @@ for gen in $GEN_VERSIONS; do
>>       gen_name="${gen#*:}"
>>       iga64 -p=$gen_name -d $WD/empty 2>/dev/null || {
>>           warn "WARNING: iga64 assemblies changed, but iga64 compiler does not support platform '$gen_name', CHANGES will have no effect. Update iga64 (libigc-tools package) to re-compile code."
>> -        cp $INPUT $OUTPUT
>> +        cp -p $INPUT $OUTPUT
>>           exit 0
>>       }
>>   done
>> @@ -127,4 +127,4 @@ for asm in "${ASMS[@]}"; do
>>       echo -e "\t{ .gen_ver = $cur_ver, .size = $(dword_count "$cur_code"), .code = (const uint32_t []) {\n$cur_code\n\t}}\n};" >>$OUTPUT
>>   done
>>   
>> -cp $OUTPUT $INPUT
>> +cp -vp $OUTPUT $INPUT
>>
>> ---
>> base-commit: f564652c85f6bf5e6e076526fe0de7c96dbbe0b2
>> change-id: 20250528-refactor_gpgpu_asms-dd5fb1d78843
>>
>> Best regards,
>> -- 
>> Andrzej Hajda <andrzej.hajda@intel.com>
>>
