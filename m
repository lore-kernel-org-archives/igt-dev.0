Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA8CC28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 12:51:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D74010E16B;
	Wed, 12 Mar 2025 12:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANADJFbY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED8910E083
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 12:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741783917; x=1773319917;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=iyLJ2s4IYIp7aAYyQF5JNYvOGeZWSE8Dduhm/FrDczA=;
 b=ANADJFbYjbJE0rkA4179GD+bYYNLrgDkBXSx0jVmdo4pNynmphQmsHfy
 +JsNH+fjqDpysPK0lnEivakhCzjr5S1mBPLloexPMV0YXdGLjd0vaDxLw
 keaxGf42e6jx5euA9h3IB/l4PNvewA51KlxY+NtxrXfatrhr7xCXho4m5
 UPKRRbA3Uz41E/weGp96rBwe6t3/GPjNotC9DYeUFdmlkRJgw21T1Gs8R
 0BKajnopZPWeStFL3lFWGeRljyiyULMhOp868qyoIYSZbC0uF2QVSxTQb
 9jagLJkBFihcto0xw2PZNoeExmxivIL3RVO8gI8c3mFW7XNkpnSiX0Rbd w==;
X-CSE-ConnectionGUID: 0P4iNn+bSKCBFMD3f2LHBg==
X-CSE-MsgGUID: Kl4DYSevQUO9uZ2pLPt3bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="60402208"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="60402208"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 05:51:56 -0700
X-CSE-ConnectionGUID: hx3qVY8iQiWV3MjmgoRILA==
X-CSE-MsgGUID: FWLsUWmxTQSSUT9W0eE6Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="121327588"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 05:51:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 05:51:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 05:51:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 05:51:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pzm4cq4cVBCdfvJMb18ecH35ekGDGzMNDiy33Sn8s3zAQH/VwGQahP7WTxoOYDNmDIe8nJ13Sxd93IrJuOmBNjRVbsDOKJt+3URRZsNoqbQGDagMzX+cRAaWn5Ku83FBswGQ0goWmgryys/pVV/unnAhIwrBhc7mIRNf2gNVxV3qdKDh/4BG/r4I8NnTByNWfl8+EomWQD5mJmZQ4pQgrHzmk3pn8Xtelu/OdKl0n2D3Dxb6URVhH5SICvBmT3OXfRvKvaXkiwxIcsER+UyYizWGQwiMLzRqW8I6+WoG4KFVk637+t3FNvP7pY8xcoTA1B9mcZQARLbfwcO0KSPvkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sCDiIhcBJUdF31fHauivlPMmI/KoW9FJEkxNeQN9qg=;
 b=eKFe4D//damZNrdCaKEvoGmu4acI/R4u5L50gxPbAprov+VWQT0fblq6zJLfH1IxKIcwqdglR1DbdD8bFx2LK8s9fx/eEM65tYAWvvn7remY2CwPAxuWXF3hLy5LD+m2qae1F3gqdyip57xQvw7uNLg81UZorG1XBtMHxpM2CWsai9S7sBZl2Qgip2eY4WVGfB4opCVC03s8uNk91Lu2BTv/GiG6sOg+n37Mytg4iiz3sQJPyUC7IMIVT0rEmELx49G8hR5waTvciZOFq3fTQvcXlVhA1P2/4CO6ZbC0In1NtBbpacbNyFtP+2NsB3M9hPjYiNa83xV1q7I51l+6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH0PR11MB5926.namprd11.prod.outlook.com (2603:10b6:510:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 12:51:48 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Wed, 12 Mar 2025
 12:51:47 +0000
Message-ID: <01d5442c-c920-45e7-beb2-baed21e91be3@intel.com>
Date: Wed, 12 Mar 2025 18:21:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_dsc: Add force dsc and joiner
 test cases
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
 <20250107185709.116756-5-swati2.sharma@intel.com>
 <a21cc39c-a52e-4126-95a6-8b23c17c3cc3@intel.com>
Content-Language: en-US
In-Reply-To: <a21cc39c-a52e-4126-95a6-8b23c17c3cc3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::14) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH0PR11MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: 040cde0d-8111-403a-77a9-08dd6164a62b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlY5NVA5ZEl1VnJkdi83MWZYZWVUZ2Z4c0dRUVNUVGd2UmQ2eWZhL2RhSFdR?=
 =?utf-8?B?Y0taeHFyZkR3NTFuNHhSM1BSandhdXM2eGxzNzlkZVdjYzByTzByQzJsdTlo?=
 =?utf-8?B?b2JCYklGU2hvcnFSTUt3WDFYUGp6RGdma2lPMzh3VVJCUVJWS2hvdWx0YjNC?=
 =?utf-8?B?WnF6OEtKamVsZkdub3ZaLy82b21hTEU1aklTaGZHT1VBV3RTZ3NESnZ0WWM5?=
 =?utf-8?B?aUhSMkhld2N2dkNmaG95VnBsMnZad0RCZlkrbklRYWtSYUtkZ091UTZROGJL?=
 =?utf-8?B?V1V2Q1dqVmpVcTlYQ2VEQjZGY0RHMGFxN2JYd1FVVjBiQWMvUFVCOHhydDUz?=
 =?utf-8?B?LzNGTGxCR3lLQWVmblBxdytBdVEzbWhKV1Bsa1JoK3QySFU0elU1ZHU0TGhj?=
 =?utf-8?B?ZVBMRWFZTFI0ZkxSYVFSMnU2UnJnTjBIYlNFKzA2T1ZQcitLTGxKQnUzaTlz?=
 =?utf-8?B?N1JDUGozaXBVUnVEdU1USGM0TEM3UlJxMUlrdVNXaGM0NjhZQnd3a1Y2NDFP?=
 =?utf-8?B?K2pwdWlnbnAxckNTdEtFVkR3MldFUEV1UUxEaFNrd090MGRzeEhmd1RUTnhV?=
 =?utf-8?B?Mk9OSWYwY1Y2c2xva1VzV0paYU16NEtSbnI1TnN3NTlNZkE0ZXB3RTdXaFlG?=
 =?utf-8?B?czRMdlV2TDdTK1lQZ2UzWThVaHNJS2owUXVQTmtUSjZ5R1ZkTC9aSVg1VUxP?=
 =?utf-8?B?dlEwOUJ0R2E2K3N3ZDk3cnFxRzVyVTZQckZKdWorUzhRMUR1YnhhNzA5QWVm?=
 =?utf-8?B?TVdzWGtsZUhhQVlhV0JSS3ptV3poLzVxM3JBczBtdFU1cGFmeWE1cVcyMi9k?=
 =?utf-8?B?T3VhbU9vc3FYR0pIRG1DbkwxK054b3RGQTVLUkNpMmU1d2Jra3J0V1RUOVVD?=
 =?utf-8?B?SVU0YVc3SkE4ZXJJS3grK0NDY2NOTVhTaTl3RE9iRTVQTnJ2UmVTRFR1b2Jq?=
 =?utf-8?B?bEw3TnNWRXlhMXFKbVc3SzNXdlJvam9UNkVxUzFET0VORGlCblN1akU5aEVB?=
 =?utf-8?B?TnlnWGZSZGJYNkc5bWFBd1AyMytNM0daTWpnbjc5Z0dDOUdZd2M4d1NCWm1O?=
 =?utf-8?B?QVlyYldPaEJoaHBzdGlnYUV0SGtkdU42UVpObmlEY2Z4YktTR2YyNDR3MWpa?=
 =?utf-8?B?dVJSTEhGc1VFakdoUjcwUTk4eTBBSzQwK0xGRzk3eVozUTVrK2ZLSVZ0TmY5?=
 =?utf-8?B?WENQSUE5cCsxZjZyaVUxWVFUM2MwaGVPU3ZMNDVRZjlnU1B1TzNxTzhQVzN0?=
 =?utf-8?B?UmRCUkw4ejFLLzM1YXFabkNTUXhQV1lXTnppS0FXRGNBalAveFlEaEZ5WlM2?=
 =?utf-8?B?V2FoRmFZZHBGMzU0USt4ZDN3am5McVBnL3FYWmFMdXo1UzVlNXZDeFdVZlBj?=
 =?utf-8?B?amFoa3NJYThuUVZTQVVLYjdFbCtwa3dGOWcxdnl3Z2NqdHJzQmZ6QjBLSDBv?=
 =?utf-8?B?VDI3K3BlSXo0U1FEUTFUdjhIUndoTDZYQVRMT2xDOEdDVVdPbHBiNm1hZUhE?=
 =?utf-8?B?YThiTytaZ0orZTJLV0o1NE84Y1V2dHdTL251bi9KRXQrenZIZEJiQkFHNnVs?=
 =?utf-8?B?OHcwUlphamluTzdXWmpoejhuQ3pMOHpqaTBrM0ZNK0UrWTR2Y3VuYXAwODQ4?=
 =?utf-8?B?dW9tQTgxaEd6cHROanJ2MktMMnFlNkNWWVlzUUcxdGtiRnE0aEQ4bzhtWjZM?=
 =?utf-8?B?Q01aeFQ3dEw5VWRVeGlkRUtNK2tQalNVK0JGM2l6eFR4TDE5VUNBanI2U3BJ?=
 =?utf-8?B?ZmYrUVlBcHRmM1hreHdINnlOUlZMRURMcHNXWFJPN3NKc2NyT21yZnhHcGFG?=
 =?utf-8?B?YUtxblhGd21hZlNmRGt1VE42eHBVSlc5Q1ZrTmVjKzZJU2tJT040bDNzT3lw?=
 =?utf-8?Q?UiDt03nW2MuDx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ZhMEgxenZTSkFUbDhOeEozeUNJb0hRSnFtT2lNNUVMbTJHMU4rNjQ1SU12?=
 =?utf-8?B?RUdIZHpMWjVkQUR3Y0RUWDNFODNvYSt5Nm0vbGVBbTNTM3p2WU1zbTJxOVYr?=
 =?utf-8?B?a3NKN0VuZDlxZENIL0lvLzlQNDZzbWtJSDMxM2huSGdCZTFjUnpUeHNMb3JI?=
 =?utf-8?B?TFZHQmZPUG42REVobUEvWm9BZXNBTXlMcm5MMVFLd3dPNHRNWEhjUzNOYUtZ?=
 =?utf-8?B?aWlHbFJ5ZUd4ZWhsTmRrM1U5b1d0eXNIWTZadzBJa1pwOTR0R2tBVjBVVVVP?=
 =?utf-8?B?Z3RtMnRlRGtPWE5VZEJPZ2Y3NnU1VDliczFDODc4RE5OMXdHVTQ4TmVDOG1R?=
 =?utf-8?B?eUhJK1dLT0RYUmpNQVJaTDhhdlk5SU8vbTc2ajBEMlFsaFJZY0o1RmpGNVRK?=
 =?utf-8?B?bUo5UWZmcGRKZGRWWGRDUnhPY09ObFAxenZmcUdzWG5JZTFwcndYNkRSQ3Z0?=
 =?utf-8?B?S2NOYmZQVTk1VnpxWklBcHB1NGVJQlNCakhmOGhQUnRJUklISStPa3JCd3VZ?=
 =?utf-8?B?d2VqT29jcGswMGcvdWpoKzlLUWJVOHFpUG5ERWhQclp4WUJ0Z2daOTB5VVhp?=
 =?utf-8?B?dFFQVVpzRytEWDdqdGt4RTMvTDI2NWdsMHBJSitMd09GcDFpQzNsOXBNRlN6?=
 =?utf-8?B?VUdNdVRBaEhuMXZ2bEFtTytldGI2SG5ST05rVCtuZkRYUENaTmxxc3loK2Qy?=
 =?utf-8?B?OUJnOFBEci9yYXo5dFZicVVOOVZIYU1NbFdsZ0NhQ1lMRjROaUMxaGRsZGtG?=
 =?utf-8?B?RnJQVWQrNUhPS2VycnQ0d2xCL1JtY0lCNWtzRCsrWU9PZk9wTjRUWVU3SGwz?=
 =?utf-8?B?d2JlMkJicjhZR2dsRXpsNm9kV1VCVU9qYnhKV2ZLOG9OdTF2YlRzYXBNeklF?=
 =?utf-8?B?L05WMzN0TFRsbVlSeHRvSm1WR2dTbm9oNzNhRXFaVlZudlNzcE5Ha0hNNDJ0?=
 =?utf-8?B?L3o2QSszWEVMUzJqVHVNSVpLOEJDVHFJVy9Fcm8wRmtEc2RoRkpiZE9nTEdP?=
 =?utf-8?B?ODJ2cVZsNFZsYk5yUHdVQmdUditvYnBSMWFxc0FYNzVVcjN6Ui94dnNBN3lN?=
 =?utf-8?B?VTJuU3RsVmlWbjFYOXZ1UTJXSWQ4YXBBNGtyVGpzajRSMHFoTi9LalpOUy91?=
 =?utf-8?B?SHVXcm5VM3J1V3kzeWNJKzIvNGhrR3ZXT3k5YndkZENSMGZtZEtLc1NkaEk4?=
 =?utf-8?B?M0I0RU4xRWw1S2tHWkY3Lzd6dlBGeXR4UklBbG5iUzJHSENBOEd2R1dXNGlx?=
 =?utf-8?B?R3NjUXVlTWJlZTkzaTBwQUdwVTV2M0ZQdjV2SWtiV3I2dFloTmVDS1ZybVhP?=
 =?utf-8?B?dUZkekIranVQWTZPbHY1cjV3emQ1QzBjT3lGMVQzWHdSWXpaWUorUllVVi9p?=
 =?utf-8?B?TW1GM1JFM0RBUDdSbGxyVDJoT2Npa29yRWd3Rm1hWVJTQzcwRkJNQXV0Wm9z?=
 =?utf-8?B?NjJUdUNna1lMYk5EaVdTVVJGam1leGxOTzQzcGpiMTVxMXRrVnhiQUlPT2w3?=
 =?utf-8?B?ci9VRXRtSmIxNi90c2wvVVFmc25POHZaR0RzQXZFWjVWYkhlTjZmbnE5STJ1?=
 =?utf-8?B?bWhYOGhMZ2tUaGd6bHp6dFJORzAxRWlrU1JsSDBwRXNTZnBFeXpKd1BJVjFM?=
 =?utf-8?B?TlhIQzVzdTNUMUlSNUN0ODI0RFhPOXo3WDBMcDBHYzdHWFZzeVAvQnc2UTBR?=
 =?utf-8?B?aGFCY2JHcU8xQ0ZFcDJGYURoL0RUUFhGcUVhc1VMNkhDcDhwQnB2ZGIzQTdT?=
 =?utf-8?B?K3JaQUdsNHBnSmtJclByOFNiSFRlMW5Fb1BpTVI3UGNUbHhUZXN4R056YlVw?=
 =?utf-8?B?d1U1Q2lpVW1yd0xlMnFSVUF0NGh4aUNJMStIR21FRUxnSmtJa2JwcVZVTGdu?=
 =?utf-8?B?TGYyUkVvY1dqcXVUK2lkYkZWTkJwNVVuN1ArUjR0dm1NRW5kOVo0QWYwc3Nu?=
 =?utf-8?B?ZW1yVE1XVkZVRUkzVTdZOFhFOWp4WEJ6UDVqbWxDSXhsS1YvWUVuVG40b1Uw?=
 =?utf-8?B?Ky9rUVk3ZDlkSEhobVpidUpPZG9aUFhnVFVEYW5SWlJ6MVhLWVUxQXhkbTg5?=
 =?utf-8?B?Q1J3STdza0xMSXczNWJsVG8vbDE0dEY4MnRuTW1pNXFkai9OYmFUWlkyV1g0?=
 =?utf-8?B?TlFFWG5KR3liVnlDUXljK3JTenRsRGlBakRQd1ZKSHowZTBTbzU0Z2JyRXU3?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 040cde0d-8111-403a-77a9-08dd6164a62b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 12:51:47.0687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkWZZHqH1UGQ9vkJyx44qLtQ8Ris5YWvkpedJTezDnMxaupsr2zyq5p0DWh7Roxxaj7JSX99Gpde3hn0Wf83ofjkdFHUBqPo3TGH2cHkuL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5926
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


On 3/12/2025 2:39 PM, Nautiyal, Ankit K wrote:
>
> On 1/8/2025 12:27 AM, Swati Sharma wrote:
>> Add test cases where we are validating force dsc and force
>> joiner.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_dsc.c | 192 ++++++++++++++++++++++++++----------------
>>   1 file changed, 120 insertions(+), 72 deletions(-)
>>
>> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
>> index 5508e7a9e..b88a4875e 100644
>> --- a/tests/intel/kms_dsc.c
>> +++ b/tests/intel/kms_dsc.c
>> @@ -57,7 +57,27 @@
>>    * @with-output-formats-with-bpc: DSC with output formats with 
>> certain input BPC for the connector
>>    * @fractional-bpp:               DSC with fractional bpp with 
>> default parameters
>>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with 
>> certain input BPC for the connector
>> - */
>> + *
>> + * SUBTEST: dsc-%s-%s
>> + * Description: Tests Display Stream Compression functionality if 
>> supported by a
>> + *              connector by forcing %arg[1] and %arg[2] on all 
>> connectors that support it
>> + *
>> + * arg[1]:
>> + *
>> + * @basic:                        DSC with default parameters
>> + * @with-bpc:                     DSC with certain input BPC for the 
>> connector
>> + * @with-bpc-formats:             DSC with certain input BPC for the 
>> connector and diff formats
>> + * @with-formats:                 DSC with default parameters and 
>> creating fb with diff formats
>> + * @with-output-formats:          DSC with output formats
>> + * @with-output-formats-with-bpc: DSC with output formats with 
>> certain input BPC for the connector
>> + * @fractional-bpp:               DSC with fractional bpp with 
>> default parameters
>> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with 
>> certain input BPC for the connector
>> + *
>> + * arg[2]:
>> + *
>> + * @big-joiner:              big joiner
>> + * @ultra-joiner:          ultra joiner
>> +*/
>>     IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>>   @@ -83,11 +103,13 @@ typedef struct {
>>       int disp_ver;
>>       enum pipe pipe;
>>       bool limited;
>> +    int joined_pipes;
>>   } data_t;
>>     static int output_format_list[] = {DSC_FORMAT_YCBCR420, 
>> DSC_FORMAT_YCBCR444};
>>   static int format_list[] = {DRM_FORMAT_XYUV8888, 
>> DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>>   static uint32_t bpc_list[] = {8, 10, 12};
>> +static int joiner_tests[] = {JOINED_PIPES_DEFAULT, 
>> JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>>     static inline void manual(const char *expected)
>>   {
>> @@ -149,6 +171,7 @@ static void update_display(data_t *data, uint32_t 
>> test_type)
>>       int current_bpc = 0;
>>       igt_plane_t *primary;
>>       drmModeModeInfo *mode;
>> +    bool status;
>>       igt_output_t *output = data->output;
>>       igt_display_t *display = &data->display;
>>       drmModeConnector *connector = output->config.connector;
>> @@ -161,6 +184,11 @@ static void update_display(data_t *data, 
>> uint32_t test_type)
>>       save_force_dsc_en(data->drm_fd, data->output);
>>       force_dsc_enable(data->drm_fd, data->output);
>>   +    if (data->joined_pipes == JOINED_PIPES_BIG_JOINER || 
>> data->joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
>> +        status = kmstest_force_connector_joiner(data->drm_fd, 
>> connector, data->joined_pipes);
>> +        igt_assert_f(status, "Failed to toggle force joiner\n");
>> +    }
>> +
>>       if (test_type & TEST_DSC_BPC) {
>>           igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>>           force_dsc_enable_bpc(data->drm_fd, data->output, 
>> data->input_bpc);
>> @@ -260,17 +288,22 @@ reset:
>>     static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>>                unsigned int plane_format,
>> -             enum dsc_output_format output_format)
>> +             enum dsc_output_format output_format,
>> +             int joined_pipes)
>>   {
>>       igt_display_t *display = &data->display;
>>       igt_output_t *output;
>>       enum pipe pipe;
>> +    int n_pipes = 0;
>>       char name[3][LEN] = {
>>                   {0},
>>                   {0},
>>                   {0},
>>                   };
>>   +    for_each_pipe(display, pipe)
>> +        n_pipes++;
>> +
>>       igt_require(check_gen11_bpc_constraint(data->drm_fd, 
>> data->input_bpc));
>>         for_each_pipe_with_valid_output(display, pipe, output) {
>> @@ -279,6 +312,7 @@ static void test_dsc(data_t *data, uint32_t 
>> test_type, int bpc,
>>           data->input_bpc = bpc;
>>           data->output = output;
>>           data->pipe = pipe;
>> +        data->joined_pipes = joined_pipes;
>>             if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>>               !check_gen11_dp_constraint(data->drm_fd, data->output, 
>> data->pipe))
>> @@ -299,6 +333,16 @@ static void test_dsc(data_t *data, uint32_t 
>> test_type, int bpc,
>>                                 data->drm_fd, data->output)))
>>               continue;
>>   +        if (((joined_pipes == JOINED_PIPES_BIG_JOINER) && 
>> (data->pipe == n_pipes - 1)) ||
>> +            ((joined_pipes == JOINED_PIPES_BIG_JOINER) && 
>> (!check_bigjoiner_constraints(data->disp_ver, n_pipes,
>> +                         data->drm_fd, data->output))))
>> +            continue;
>> +
>> +        if (((joined_pipes == JOINED_PIPES_ULTRA_JOINER) && 
>> (data->pipe == n_pipes - 1)) ||
>> +            ((joined_pipes == JOINED_PIPES_ULTRA_JOINER) && 
>> (!check_ultrajoiner_constraints(data->disp_ver, n_pipes,
>> +                         data->drm_fd, data->output))))
>> +            continue;
>> +
>
> Hmm we want to skip the cases where we have joiner and we are either 
> executing for the last pipe or check_constraint fails.
>
> With the suggested function in previous patch, both of these can be 
> simplified to just one:
>
> if ((joined_pipes == JOINED_PIPES_BIG_JOINER || joined_pipes == 
> JOINED_PIPES_ULTRA_JOINER) &&
>     (data->pipe == n_pipes - 1 ||
>     !check_dsc_joiner_constraints(n_pipes, joined_pipes == 
> JOINED_PIPES_BIG_JOINER ? "Bigjoiner" : "Ultrajoiner")))
>     continue;

The condition for ultrajoiner is incorrect.

For ultrajoiner we want to ensure that n_pipes >= 4 before entering the 
for loop , and data->pipe < n_pipes - 3 inside the loop.

So we need to skip the iteration, if data->pipe >= n_pipes - 3


Regards,

Ankit

>
> Overall I agree with the patch and the new subtests.
>
> Regards,
>
> Ankit
>
>>           if (test_type & TEST_DSC_OUTPUT_FORMAT)
>>               snprintf(&name[0][0], LEN, "-%s", 
>> kmstest_dsc_output_format_str(data->output_format));
>>           if (test_type & TEST_DSC_FORMAT)
>> @@ -348,85 +392,89 @@ igt_main_args("l", NULL, help_str, opt_handler, 
>> &data)
>>           igt_require(is_dsc_supported_by_source(data.drm_fd));
>>       }
>>   -    igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> -             "by a connector by forcing DSC on all connectors that 
>> support it "
>> -             "with default parameters");
>> -    igt_subtest_with_dynamic("dsc-basic")
>> -            test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
>> -                 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
>> -
>> -    igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> -             "by a connector by forcing DSC on all connectors that 
>> support it "
>> -             "with default parameters and creating fb with diff 
>> formats");
>> -    igt_subtest_with_dynamic("dsc-with-formats") {
>> -        for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> -            test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
>> -                 format_list[k], DSC_FORMAT_RGB);
>> -    }
>>   -    igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> -             "by a connector by forcing DSC on all connectors that 
>> support it "
>> -             "with certain input BPC for the connector");
>> -    igt_subtest_with_dynamic("dsc-with-bpc") {
>> -        for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> -            test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
>> -                 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
>> -    }
>> +    for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
>> +        igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> +                 "by a connector by forcing DSC on all connectors 
>> that support it "
>> +                 "with default parameters");
>> +        igt_subtest_with_dynamic_f("dsc-basic%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>> +                test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
>> +                     DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, 
>> joiner_tests[i]);
>> +        }
>>   -    igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> -             "by a connector by forcing DSC on all connectors that 
>> support it "
>> -             "with certain input BPC for the connector with diff 
>> formats");
>> -    igt_subtest_with_dynamic("dsc-with-bpc-formats") {
>> -        for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>> -            for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
>> -                test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
>> -                bpc_list[j], format_list[k],
>> -                DSC_FORMAT_RGB);
>> -            }
>> +        igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> +                 "by a connector by forcing DSC on all connectors 
>> that support it "
>> +                 "with default parameters and creating fb with diff 
>> formats");
>> +        igt_subtest_with_dynamic_f("dsc-with-formats%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>> +            for (int k = 0; k < ARRAY_SIZE(format_list); k++)
>> +                test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
>> +                     format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>>           }
>> -    }
>>   -    igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> -             "by a connector by forcing DSC and output format on all 
>> connectors "
>> -             "that support it");
>> -    igt_subtest_with_dynamic("dsc-with-output-formats") {
>> -        for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
>> -            test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
>> -                 DRM_FORMAT_XRGB8888,
>> -                 output_format_list[k]);
>> -    }
>> +        igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> +                 "by a connector by forcing DSC on all connectors 
>> that support it "
>> +                 "with certain input BPC for the connector");
>> +        igt_subtest_with_dynamic_f("dsc-with-bpc%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>> +            for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> +                test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
>> +                     DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, 
>> joiner_tests[i]);
>> +        }
>>   -    igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> -             "by a connector by forcing DSC and output format on all 
>> connectors "
>> -             "that support it with certain input BPC for the 
>> connector");
>> - igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
>> -        for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
>> +        igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> +                 "by a connector by forcing DSC on all connectors 
>> that support it "
>> +                 "with certain input BPC for the connector with diff 
>> formats");
>> +        igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>>               for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>> -                test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
>> -                     bpc_list[j], DRM_FORMAT_XRGB8888,
>> -                     output_format_list[k]);
>> +                for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
>> +                    test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
>> +                    bpc_list[j], format_list[k],
>> +                    DSC_FORMAT_RGB, joiner_tests[i]);
>> +                }
>>               }
>>           }
>> -    }
>>   -    igt_describe("Tests fractional compressed bpp functionality if 
>> supported "
>> -             "by a connector by forcing fractional_bpp on all 
>> connectors that support it "
>> -             "with default parameter. While finding the optimum 
>> compressed bpp, driver will "
>> -             "skip over the compressed bpps with integer values. It 
>> will go ahead with DSC, "
>> -             "iff compressed bpp is fractional, failing in which, it 
>> will fail the commit.");
>> -    igt_subtest_with_dynamic("dsc-fractional-bpp")
>> -            test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
>> -                 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
>> -                 DSC_FORMAT_RGB);
>> -
>> -    igt_describe("Tests fractional compressed bpp functionality if 
>> supported "
>> -             "by a connector by forcing fractional_bpp on all 
>> connectors that support it "
>> -             "with certain input BPC for the connector.");
>> -    igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
>> -        for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> -            test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
>> -                 bpc_list[j], DRM_FORMAT_XRGB8888,
>> -                 DSC_FORMAT_RGB);
>> +        igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> +                 "by a connector by forcing DSC and output format on 
>> all connectors "
>> +                 "that support it");
>> +        igt_subtest_with_dynamic_f("dsc-with-output-formats%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>> +            for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
>> +                test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
>> +                     DRM_FORMAT_XRGB8888,
>> +                     output_format_list[k], joiner_tests[i]);
>> +        }
>> +
>> +        igt_describe("Tests basic display stream compression 
>> functionality if supported "
>> +                 "by a connector by forcing DSC and output format on 
>> all connectors "
>> +                 "that support it with certain input BPC for the 
>> connector");
>> + igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>> +            for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
>> +                for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
>> +                    test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | 
>> TEST_DSC_BPC,
>> +                         bpc_list[j], DRM_FORMAT_XRGB8888,
>> +                         output_format_list[k], joiner_tests[i]);
>> +                }
>> +            }
>> +        }
>> +
>> +        igt_describe("Tests fractional compressed bpp functionality 
>> if supported "
>> +                 "by a connector by forcing fractional_bpp on all 
>> connectors that support it "
>> +                 "with default parameter. While finding the optimum 
>> compressed bpp, driver will "
>> +                 "skip over the compressed bpps with integer values. 
>> It will go ahead with DSC, "
>> +                 "iff compressed bpp is fractional, failing in 
>> which, it will fail the commit.");
>> +        igt_subtest_with_dynamic_f("dsc-fractional-bpp%s", 
>> igt_get_joined_pipes_name(joiner_tests[i]))
>> +                test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
>> +                     DEFAULT_BPC, DRM_FORMAT_XRGB8888,
>> +                     DSC_FORMAT_RGB, joiner_tests[i]);
>> +
>> +        igt_describe("Tests fractional compressed bpp functionality 
>> if supported "
>> +                 "by a connector by forcing fractional_bpp on all 
>> connectors that support it "
>> +                 "with certain input BPC for the connector.");
>> + igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s", 
>> igt_get_joined_pipes_name(joiner_tests[i])) {
>> +            for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
>> +                test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
>> +                     bpc_list[j], DRM_FORMAT_XRGB8888,
>> +                     DSC_FORMAT_RGB, joiner_tests[i]);
>> +            }
>>       }
>>         igt_fixture {
