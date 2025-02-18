Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EF2C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 15:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D659B10E3EA;
	Tue, 18 Feb 2025 15:35:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZiuzrr6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FAA10E3EA
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739892901; x=1771428901;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=hkgQ7Po+4Si5GTVi2ALGr4ZTpkdlXqG76qgwmlEIo5c=;
 b=KZiuzrr641Aawnb3f2hYjzzc/s/AS8ngvPXcq+VWX6d+JKFV/k3pAujp
 XlLAQfATujKDpCLdoOnGeD31cGRThw2RwctO+17H7ITImChFcprhcu1jU
 rg6qAOtr9ycUv/i4N8o5+KrSd4kek/JEay6UaeG7gWnfJzfoVRZzuX8wi
 d3xKOixeqhGcyf8IRpOMa0kshGXcZlHbIxfVSIcxEJpceMsugG85BEUiN
 Se8LZcXtqmF6s0lRwvMbaL64+2oUHnSwC4DZZdaymb/9nQGkyv/7yoOcW
 clgk7CAl0rmnIJ/xuuNN0uaIEwkyseU4c18GAufasdASmBkkV/Dv/wvQi g==;
X-CSE-ConnectionGUID: 9MlaZPGfRomNcxVuPM7SOg==
X-CSE-MsgGUID: 3exUTPLgRIGFOpXA5RAsOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39829838"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="39829838"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 07:35:00 -0800
X-CSE-ConnectionGUID: 9VvQs/DSQtKJ9T8lKgBL2g==
X-CSE-MsgGUID: 2YzP+A8rRaeW1WxSblN/Rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145336694"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Feb 2025 07:35:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 18 Feb 2025 07:34:59 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 07:34:59 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 07:34:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF61tmn6sUToi88SUL8cAvFKz0mzzRPJe0zXPjaWwH2E/efEvuP3dA8fMsFEEYn5FdLhwvdQ89jfwCnGoEKCQ4DKhJb41fiwSgaO7BnVLo+HFyY/lhcD3nYKpGW3jljTPgZvBgLLB/fMZ9P3K/oeQvAG3v9rBvORuGgsfKnHCR9VF/aTpUPZhE1KLWxEMu43IFXL/qdzJTaCD4O6Blyb0+UNR7Mbc11W7IOo0oRzxwt8ZDz1h2AItAZyVBE0wCuIL5UHOatWVT5DYmTI/1Xkn9hcxaQCce1zaJMzDvS3VpRwcvPcn93lbq12SFwIVmB7NlXK2sLBpOXQS1vd+5GaMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkgQ7Po+4Si5GTVi2ALGr4ZTpkdlXqG76qgwmlEIo5c=;
 b=biiYddLJrD1c5mXnq7qkUHmfF+fmqMMhH5ZMD2hclr1nnRc8op8f7O86NM4C6ZJT797GRz2bRKKxopuXKGBTS0+GBjOrc9XpGFZvW8I/TT1wqcrDHTyJznxILljt22NNu0YNldDHWU7E+roIFBzXpXZ9yzr2LWQ4wzoZ1cJXIqj8o7tmyoxNv8RBFwnD7REJquI1Hd3+GQnqkPUwp2oT/qwUlYdSIJtJQ0SaVsiZFaTnb8PuqKJ454MTMsd//Tow6u03eyicIcRxglLPK5Ppy2qCfQt927HWPWbTjJHX3gVDBPfDak53Br/9XwlKZP7Zg3wGBbEQpWTfwSvGGaVtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DS0PR11MB6376.namprd11.prod.outlook.com (2603:10b6:8:c8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Tue, 18 Feb
 2025 15:34:54 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 15:34:54 +0000
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v4] tests/intel/xe_exec_capture: Enhance test to check
 with DUMPABLE flag
Thread-Topic: [PATCH v4] tests/intel/xe_exec_capture: Enhance test to check
 with DUMPABLE flag
Thread-Index: AQHbgQDUEm+JxZB3Ek+E4NT22iAWubNNMoEg
Date: Tue, 18 Feb 2025 15:34:54 +0000
Message-ID: <IA1PR11MB82008B38E4ED661F65BAD9A28FFA2@IA1PR11MB8200.namprd11.prod.outlook.com>
References: <20250217053732.1164759-1-pravalika.gurram@intel.com>
In-Reply-To: <20250217053732.1164759-1-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB8200:EE_|DS0PR11MB6376:EE_
x-ms-office365-filtering-correlation-id: de13d823-962a-4b12-f474-08dd5031cae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0lEVjRzTmZFT1VndSs0ZWhia1NQUTF3UVJiVlRXajV2Vk5hWEZWSFhsT3NF?=
 =?utf-8?B?Rm5UOVY3RUhuSDIzcElreFhLb2xBTUhnRDA5Z0NoRTJnZnVCWjJybmltZGNW?=
 =?utf-8?B?Zk9qYUZoblVVb0xqM1IwM1I2TDNEbStVSk4zU28wMlh2M1ZHcktjKzR6OXdC?=
 =?utf-8?B?ejJTMnlBYzlwZUc3K2RkNFN6Z2lrMEJOb0tRS0tySUFLaUZBTDdPcVNva05w?=
 =?utf-8?B?dldrZTQvOHRXbUNVMFlBc2JDQTZDdmJyMURrWVlXdDJpeFpPOUllZmFHRm1p?=
 =?utf-8?B?Yy9QUVFiWnZjMmFjQXpJM0FUT3JYVjFRVytHemluSVJlZ2xKeDVYZ3pCVW96?=
 =?utf-8?B?aGhEYlVOUHRVZUxkODhrTUhLbk5abnNBcUpYMjdzTDg1VndpY1NucUZKcEtk?=
 =?utf-8?B?V2owYnYwR0sxNW82a1Ywek5tNld3ekM3NHppTnFwcTNuaTd6UU9wdlN6cWIy?=
 =?utf-8?B?NHBwUXBSQUQxMm90UUp4Vjk2ektlOG5VUG50MnJjb3p4ZVpEckJnVk1vZkFJ?=
 =?utf-8?B?SmtYTHJ4RW5RZitOT1hWYUNOV0NYcFY4eGNKbHdjS21zc002c05qblpHdXF2?=
 =?utf-8?B?WGthcm5aRTB3cDlHT01seEg5OXJQZDdqdnoya3hIdjZSSE1mMFFwSmppS0FP?=
 =?utf-8?B?Tyt6d3RBeFJtMThTZW12Sm8vYXY1cmswcGNVazNiaVVnTmpjK3RlZC81bVlB?=
 =?utf-8?B?TnJ4NGh3WERvU1FjTnpKb2I2dWlEUWpDWlRZNlNpKzZhWStNd3djbUZuRkpv?=
 =?utf-8?B?UHNsRjlLTEo1bjIxSkdnTVJjbWk3MFNsbXFHajloRThwREZYdHJ5eDZsQTR3?=
 =?utf-8?B?dFlUK0YrOXMwNEhMWmFOR1RsdXpnQXEwazIvMENnQzEwUS9mOVova3NTQnlL?=
 =?utf-8?B?clFlWGJ0WjhlZ3M5VkhxUW8wNmZTL2hWd1FMK1pqVzI2ZjFmWU50M2pQbGlj?=
 =?utf-8?B?U0dIWjdXOVBZWGhiZlhDWGF1WXloSUFQcERsdFJuR0Z4bHRVdS94cVpzNDVF?=
 =?utf-8?B?WnNHTmF4Vm5sV3lkOVZzOHBYNWlBMTg2UVYwK3o0djdHeVhaRDBTUWY2YW1L?=
 =?utf-8?B?dnpkVFRySXdBditrN2tvY1NsZG1hMWIyMmFlK2JEcnlWR0lIa0ZYK0dURUdJ?=
 =?utf-8?B?a3FxaWdJNDlGakxTVWxuanNKRnQ5Y1dqUWREV1dEZnZLTzhRZHIwcFVrSThY?=
 =?utf-8?B?QkVPZElzYWNHeWdMbEh2Z0RzTlE2U3JJQTgwMFl2elRpakFWMXdwbGRaK1Vl?=
 =?utf-8?B?clU4VzA0NVp6SmFWZS91Y1E1ZWVZa3RxYnR0Ym5OclRuYkdsR1VORlRPc2RF?=
 =?utf-8?B?ZW1LSHJEb1pGa0QvODR3QWhHbVlsb21WZm1Qa25WQ1RCN3dwOVhkWnpkeHBa?=
 =?utf-8?B?WGN0eUZIcXlkQUtnS1drWlI4Z3hLTGxheDlGMC9UQnRqMEl6L2dvOXNDT3p1?=
 =?utf-8?B?dVF3Q2Q2dmJ4YVYyUTZQejJnMzhEdzJiWHhUR1lWcE1IdDdXSzlyNFZiSUJp?=
 =?utf-8?B?a3lXKzlCWWpNS2pUZUVjVjl4TVMvTmNvbkZVN1p4dVBreWNiYm5CYWh3ZHlS?=
 =?utf-8?B?VWRFN3ZxMEo2OVo4RVI3Mk9wN3V2eVl4ZjI0QUpZOXRZcHI1ME4zMFJhaEh1?=
 =?utf-8?B?TitJYXhZQVF2V0lINklQVEMxQUZaNXJKbzJKSGtaY1BTcXQ1TUtpMFZ4L0hK?=
 =?utf-8?B?dHpuOE9HUmJzTUttaW5qR0s0VzkyWWVVZG5pcWJoNWlNOHJRbStNbjk3MVJV?=
 =?utf-8?B?OElwZ3ZNQzRUb2R1T2pGWXdjNjZkb2NaNWxtTXFnUDlydDNvTS8wSFB2cjVx?=
 =?utf-8?B?SVJOTmtnc1ZEWTBIM29WM3htdUNTVDk2MjBWZUppNzY3NzdtekNWR0RkWmts?=
 =?utf-8?B?S21CRXVMam5WTTNoYm45cjdydERRVnMvV1RyaWtxVUhwQk1OYS9tOXZvR1V2?=
 =?utf-8?Q?3JJOXSRhIAQaEndT8TXQLj+wTcL8KE9d?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHFmM0Q4dGMxZ1RNc0RFN3FTQ0tKaTI0Qm53Zk8zbnBDTVhvTjhWbHdUa3V4?=
 =?utf-8?B?SHBsVjA5ZVFMK1FlM2xIdllDVmUrZFVScjg2bjZURHFwbVdRZkNqUDlETDJV?=
 =?utf-8?B?ZmhQeXlrSVhMakIrUEl0ejVVNThSVkdObTZLNXA0azcxTVUzOXlGMHdSb2Vr?=
 =?utf-8?B?QWhwQnY4c1NGZWtIVDRyN1JwMmlCUjRWMXVUeWpEQUZOZGpsbFB4SjRHVGZR?=
 =?utf-8?B?Q2FFZTlMM2xoWWhJeUtid0g5QWRqOXFxWnVSeEZnRkJRWGJZazNNRk9wdDVP?=
 =?utf-8?B?NDdjVmRDdmluSnFneGhZaHljc2FaTkV6cm94djh4cnRHaWZUOEcyc3ZaZ0hj?=
 =?utf-8?B?RzF5N3JaelhhVy8xUW5ZT0N0akNTd3ZkY2QzQ2Y4aVhudjZOclhhVitPckpi?=
 =?utf-8?B?NUhvdzlCSWhGR2lEVXZoV0JFNmtZclRQcCtOdjdrUUNHVENMR0tqVHhtamhY?=
 =?utf-8?B?R0xhVWZHTTFGUnRTb1ZmbUpDRDhQT2Q3ZzVqWTRHRHU2VmV0cnMreHhhR2w1?=
 =?utf-8?B?dVRBeXhjTkJJM1R0a01zV1JMMXhvMTU1a0t2bndlNEpzdktQd2VWa01RQW1r?=
 =?utf-8?B?ZjdwNHhrWForSzh1bllPSFJnVll6ZDJHcnpDNWJDT0ZWRFpqKyswdnRMUWFm?=
 =?utf-8?B?NERDQTViL2JqazRNbmxIRUwyVk5DTk5zYzFKQkYwamp4RkJFdTgzV2dvQ1NI?=
 =?utf-8?B?UDdibW43NDRTR3BPVHFhUEVmVU11UEFHUlBTejBYUlY5dkNTSisxRWxHSUlJ?=
 =?utf-8?B?TDZOY2o0dlkzWm11eGVIRlh3L0VMS2ErOUxkT0tZVXVHNC9HMVlsOCtVRHM5?=
 =?utf-8?B?bFBrTjVKeDY1TFFHY3ZyRWZWblg3d1FlZ2RZN09NQVFqYUJDakViVDBQcUo4?=
 =?utf-8?B?RVFDTVYvNzYvRm5EeTFSRFcvL1JzSnNGTHFOdVFNMkorQjFnYjlTcWI0cGMy?=
 =?utf-8?B?MWJoVWU0Z29Sclk3ZXhmUVNBRWUrV3Zvak1Scjl3Wjg3MlRKNnE4YWtoakZC?=
 =?utf-8?B?U0c5V1ByaDd5TmQwaHphQ3NZbnFvNXhBbmRrNW5HQzdRcFIwWWNwak1LSHRi?=
 =?utf-8?B?MnhFV3pNanpxOXltcGpGaGc4T25oL1FQOFhMSnZNUWxuUE1jY3hKcUY2bTA1?=
 =?utf-8?B?WFUxWlkxTWRBZ0lpWjVkcGN6OG9ySkNUd3RvSk42dzAxc3EraWZ5NzNoNEM0?=
 =?utf-8?B?N3B2V2FJKy9SSXRoMlJ0RHQySnJKZCtJN29XeTdkZ2hEZW5yQ0lWQ2pLQk8w?=
 =?utf-8?B?N05MZ0pGOGVNcW5LYXRjSnJsRFZWdnh4QkN0N3JBN0dST1JIbXQralFCUTJk?=
 =?utf-8?B?a2p3N0J5MmFGYUthUnVkVHllTGdNckRBYnNLUGt1UnNPUWk4Wm94Y3BPcEZE?=
 =?utf-8?B?U0FGQkRyUDQyaytyL3RZaUJiVWxkUklPWkM4NjdLb2ZHa3d6UWRrUHl5N1Ns?=
 =?utf-8?B?eEVWc2RtWHNtZytpL1E3U1lhZ201bGpCTWN2My9BOHNUdFRsd002WG44UU5l?=
 =?utf-8?B?QXpBNzlpYjQwQjVVUEYwaDRTb2RTbHhPeWJTak1oZmt1OEk5akZQaVZ0N1pm?=
 =?utf-8?B?c3laWXFOQ1RrMEExcFIyYklMVHJFWTBwN2tZSzU0NTJMNzFCV2NlRDNqQytM?=
 =?utf-8?B?SXBlV0RQSHJvOWU1N3pnekZPNEE0cTh1ekxwcjNiYmgrbmlyVCtCQmJ6TExj?=
 =?utf-8?B?UWRsRlhnaS9PejZNUDdnREFqNSt5czBDZE8wUnltK3djc2hHRU1QUThkR1gz?=
 =?utf-8?B?WlFLYnZRSGtxbVp2Y2ZYeVhhc0sxTVpKbE1WZno4OFVxemQ2Q1NjSkRsWVRp?=
 =?utf-8?B?Q1hNamwvU3RqNFRKdmlmLzF2SGVVekpmbnRMbTA4MjBDNE8zRmVOdDBFbkNt?=
 =?utf-8?B?NHRXaVNtQk5pRUVrS3BFbXhqRExmQXZhZ3lxMTk4REl5VzFRRnlmVEVvNENY?=
 =?utf-8?B?dUlpTlQyeWJIQmNuYXZhRmc1VDRzRE1OK1FpSmNGaXl1Qmc5bC9xd0Iwd21r?=
 =?utf-8?B?eFc1QmFhSEttYkg0cENqOWJveVdRRGhwUkVuWkp6NiszeWlEaFlpWjNDSVJJ?=
 =?utf-8?B?eDExN2E0Z0dXcWJ4NnBWaFFCem9HczZ5T0hkQ0N5TlYxMTFkK3NoVXVDZGdV?=
 =?utf-8?Q?6Q5Mx6zV9n+ME7NA44SHVSpBK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de13d823-962a-4b12-f474-08dd5031cae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2025 15:34:54.3977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brFh6c81AA4pVI26B10w+aggpNtyqfaQtrnZ5tNabk0DjHlaHVHMZzfq7TH+8hMT4CMx58KNLEHSudG813/9nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6376
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VycmFtLCBQcmF2YWxp
a2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBTZW50OiBGZWJydWFyeSAxNywgMjAy
NSAxMjozOCBBTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IERvbmcsIFpo
YW5qdW4gPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IENjOiBHdXJyYW0sIFByYXZhbGlrYSA8
cHJhdmFsaWthLmd1cnJhbUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2NF0gdGVzdHMv
aW50ZWwveGVfZXhlY19jYXB0dXJlOiBFbmhhbmNlIHRlc3QgdG8gY2hlY2sgd2l0aA0KPiBEVU1Q
QUJMRSBmbGFnDQo+IA0KPiBjaGVjayBpZiB0aGUgVk0gaXMgdGhlcmUgd2hlbiBEUk1fWEVfVk1f
QklORF9GTEFHX0RVTVBBQkxFIGlzIHNldA0KPiBpbiB0aGUgZ2VuZXJhdGVkIGRldmNvcmVkdW1w
LiBjaGVjayBWTSBhZGRyZXNzIHdpdGhpbiB0aGUgcmFuZ2UuDQo+IFZNIGFkZHJlc3MgaXMgbG9j
YXRlZCBhZnRlciBFTkRfVEFHIGFuZCBpcyBhdCB0aGUgZW5kIG9mIGR1bXAsIHRoYXQncw0KPiB3
aHkgInN0b3Agb24gRU5EX1RBRyIgaXMgcmVtb3ZlZC4NCj4gDQo+IFJldmlld2VkLWJ5OiBaaGFu
anVuIERvbmcgPHpoYW5qdW4uZG9uZ0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IHByYXZh
bGlrYSBndXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3Rz
L2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jIHwgNjMgKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmUuYyBi
L3Rlc3RzL2ludGVsL3hlX2V4ZWNfY2FwdHVyZS5jDQo+IGluZGV4IDU1ZWMzZDRiZC4uNWIxMThi
NGU2IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmUuYw0KPiArKysg
Yi90ZXN0cy9pbnRlbC94ZV9leGVjX2NhcHR1cmUuYw0KPiBAQCAtNTMsMTYgKzUzLDE1IEBADQo+
IA0KPiAgI2RlZmluZSBEVU1QX1BBVEgNCj4gCSIvc3lzL2NsYXNzL2RybS9jYXJkJWQvZGV2aWNl
L2RldmNvcmVkdW1wL2RhdGEiDQo+ICAjZGVmaW5lIFNUQVJUX1RBRwkJCSIqKioqIEpvYiAqKioq
Ig0KPiAtI2RlZmluZSBFTkRfVEFHCQkJCSIqKioqIFZNIHN0YXRlICoqKioiDQo+IA0KPiAgLyog
T3B0aW9uYWwgU3BhY2UgKi8NCj4gLSNkZWZpbmUgU1BDX08JCQkJIlsgXHRdKiINCj4gKyNkZWZp
bmUgU1BDX08JCQkJIlsgXHRcXC5dKiINCj4gIC8qIFJlcXVpcmVkIFNwYWNlICovDQo+IC0jZGVm
aW5lIFNQQwkJCQkiWyBcdF0rIg0KPiArI2RlZmluZSBTUEMJCQkJIlsgXHRcXC5dKyINCj4gIC8q
IE9wdGlvbmFsIE5vbi1TcGFjZSAqLw0KPiAtI2RlZmluZSBOU1BDX08JCQkJIihbXiBcdF0qKSIN
Cj4gKyNkZWZpbmUgTlNQQ19PCQkJCSIoW14gXHRcXC5dKikiDQo+ICAvKiBSZXF1aXJlZCBOb24t
U3BhY2UgKi8NCj4gLSNkZWZpbmUgTlNQQwkJCQkiKFteIFx0XSspIg0KPiArI2RlZmluZSBOU1BD
CQkJCSIoW14gXHRcXC5dKykiDQo+ICAjZGVmaW5lIEJFRwkJCQkiXiIgU1BDX08NCj4gICNkZWZp
bmUgUkVRX0ZJRUxECQkJTlNQQyBTUEMNCj4gICNkZWZpbmUgUkVRX0ZJRUxEX0xBU1QJCQlOU1BD
IFNQQ19PDQo+IEBAIC03Nyw2ICs3Niw4IEBADQo+ICAjZGVmaW5lIElOREVYX0VOR0lORV9QSFlT
SUNBTAkJMg0KPiAgI2RlZmluZSBJTkRFWF9FTkdJTkVfTkFNRQkJMQ0KPiAgI2RlZmluZSBJTkRF
WF9FTkdJTkVfSU5TVEFOQ0UJCTQNCj4gKyNkZWZpbmUgSU5ERVhfVk1fTEVOR1RICQkJMg0KPiAr
I2RlZmluZSBJTkRFWF9WTV9TSVpFCQkJMw0KPiANCj4gIHN0YXRpYyB1NjQNCj4gIHhlX3N5c2Zz
X2dldF9qb2JfdGltZW91dF9tcyhpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2lu
c3RhbmNlDQo+ICplY2kpDQo+IEBAIC0xNzcsNyArMTc4LDggQEAgdGVzdF9sZWdhY3lfbW9kZShp
bnQgZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksIGludCBu
X2V4ZWNfcXUNCj4gIAl9Ow0KPiANCj4gIAlzeW5jWzBdLmhhbmRsZSA9IHN5bmNvYmpfY3JlYXRl
KGZkLCAwKTsNCj4gLQl4ZV92bV9iaW5kX2FzeW5jKGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIGJv
X3NpemUsIHN5bmMsIDEpOw0KPiArCV9feGVfdm1fYmluZF9hc3NlcnQoZmQsIHZtLCAwLCBibywg
MCwgYWRkciwgYm9fc2l6ZSwNCj4gKwkJCQlEUk1fWEVfVk1fQklORF9PUF9NQVAsIGZsYWdzLCBz
eW5jLCAxLCAwLA0KPiAwKTsNCj4gDQo+ICAJZm9yIChpID0gMDsgaSA8IG5fZXhlY3M7IGkrKykg
ew0KPiAgCQl1NjQgYmFzZV9hZGRyID0gYWRkcjsNCj4gQEAgLTI4NywxMCArMjg5LDYgQEAgc3Rh
dGljIGludCBsb2FkX2FsbChGSUxFICpmZCwgY2hhciAqKmxpbmVzLCBjaGFyICpidWYpDQo+IA0K
PiAgCQkvKiBPbmx5IHNhdmUgdXAgdG8gTUFYX0xJTkVfTEVOIHRvIGJ1ZmZlciAqLw0KPiAgCQlz
YWZlX3N0cm5jcHkobGluZXNbaSsrXSwgYnVmLCBNQVhfTElORV9MRU4pOw0KPiAtDQo+IC0JCS8q
IFN0b3Agb24gRU5EX1RBRyAqLw0KPiAtCQlpZiAoIXN0cm5jbXAoRU5EX1RBRywgYnVmLCBzdHJs
ZW4oRU5EX1RBRykpKQ0KPiAtCQkJYnJlYWs7DQo+ICAJfQ0KPiAgCXJldHVybiBzdGFydF9saW5l
Ow0KPiAgfQ0KPiBAQCAtMzUxLDcgKzM0OSw2IEBAIHN0YXRpYyBjaGFyDQo+ICAJCQkJdmFsdWUg
PSAmbGluZVttYXRjaFt0YXJnZXRfaW5kZXhdLnJtX3NvXTsNCj4gIAkJCQlsaW5lW21hdGNoW3Rh
cmdldF9pbmRleF0ucm1fZW9dID0gJ1wwJzsNCj4gIAkJCX0NCj4gLQ0KPiAgCQkJaWYgKGtleSAm
JiB2YWx1ZSAmJiBzdHJjbXAodGFnLCBrZXkpID09IDApDQo+ICAJCQkJcmV0dXJuIHZhbHVlOw0K
PiAgCQkJLyogaWYga2V5ICE9IHRhZywgIGtlZXAgc2VhcmNoaW5nIGFuZCBsb29wIHRvIG5leHQg
bGluZQ0KPiAqLw0KPiBAQCAtMzYxLDE2ICszNTgsNDMgQEAgc3RhdGljIGNoYXINCj4gIAlyZXR1
cm4gTlVMTDsNCj4gIH0NCj4gDQo+ICsNCj4gK3N0YXRpYyB1aW50NjRfdA0KPiArY29tcGFyZV9o
ZXhfdmFsdWUoY29uc3QgY2hhciAqb3V0cHV0KQ0KPiArew0KPiArCWNoYXIgcmVzdWx0WzY0XTsN
Cj4gKwl1aW50NjRfdCByZXRfdmFsOw0KPiArCWNoYXIgKnNyYyA9IChjaGFyICopb3V0cHV0LCAq
ZHN0ID0gcmVzdWx0Ow0KPiArDQo+ICsvL2V4YW1wbGUgaS9wIDogWzE1ODAwMDFhMDAwMF0ubGVu
Z3RoOiAweDEwMDAwDQoNCkkgcmVtZW1iZXIgQysrIHN0eWxlIGNvbW1lbnQgaXMgbm90IGFsbG93
ZWQsIHJpZ2h0Pw0KDQpSZWdhcmRzLA0KWmhhbmp1biBEb25nDQoNCj4gKwl3aGlsZSAoKnNyYykg
ew0KPiArCQlpZiAoKnNyYyA9PSAnWycgfHwgKnNyYyA9PSAnXScpIHsNCj4gKwkJCXNyYysrOw0K
PiArCQkJY29udGludWU7DQo+ICsJCX0NCj4gKw0KPiArCQkqZHN0ID0gdG91cHBlcigodW5zaWdu
ZWQgY2hhcikqc3JjKTsNCj4gKwkJZHN0Kys7DQo+ICsJCXNyYysrOw0KPiArCX0NCj4gKwkqZHN0
ID0gJ1wwJzsNCj4gKwlyZXRfdmFsID0gc3RydG91bGwocmVzdWx0LCBOVUxMLCAxNik7DQo+ICsJ
cmV0dXJuIHJldF92YWw7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyB2b2lkDQo+IC1jaGVja19pdGVt
X3U2NChyZWdleF90ICpyZWdleCwgY2hhciAqKmxpbmVzLCBjb25zdCBjaGFyICp0YWcsIHU2NCBh
ZGRyX2xvLA0KPiB1NjQgYWRkcl9oaSkNCj4gK2NoZWNrX2l0ZW1fdTY0KHJlZ2V4X3QgKnJlZ2V4
LCBjaGFyICoqbGluZXMsIGNvbnN0IGNoYXIgKnRhZywgdTY0IGFkZHJfbG8sDQo+ICsJICAgICAg
dTY0IGFkZHJfaGksIGludCB0YWdfaW5kZXgsIGludCB0YXJnZXRfaW5kZXgpDQo+ICB7DQo+ICAJ
dTY0IHJlc3VsdDsNCj4gIAljaGFyICpvdXRwdXQ7DQo+IA0KPiAtCWlndF9hc3NlcnRfZigob3V0
cHV0ID0gZ2V0X2NvcmVkdW1wX2l0ZW0ocmVnZXgsIGxpbmVzLCB0YWcsDQo+IElOREVYX0tFWSwg
SU5ERVhfVkFMVUUpKSwNCj4gKwlpZ3RfYXNzZXJ0X2YoKG91dHB1dCA9IGdldF9jb3JlZHVtcF9p
dGVtKHJlZ2V4LCBsaW5lcywgdGFnLA0KPiB0YWdfaW5kZXgsIHRhcmdldF9pbmRleCkpLA0KPiAg
CQkgICAgICJUYXJnZXQgbm90IGZvdW5kOiVzXG4iLCB0YWcpOw0KPiAtCXJlc3VsdCA9IHN0cnRv
dWwob3V0cHV0LCBOVUxMLCAxNik7DQo+IC0JaWd0X2RlYnVnKCJDb21wYXJlICVzICVzIHZzIFsw
eCVsWC0weCVsWF1cbiIsIHRhZywgb3V0cHV0LCBhZGRyX2xvLA0KPiBhZGRyX2hpKTsNCj4gKw0K
PiArCXJlc3VsdCA9IGNvbXBhcmVfaGV4X3ZhbHVlKG91dHB1dCk7DQo+ICsJaWd0X2RlYnVnKCJD
b21wYXJlICVzICVzIHZzIFsweCVsWC0weCVsWF0gcmVzdWx0ICVsWFxuIiwgdGFnLA0KPiBvdXRw
dXQsDQo+ICsJCWFkZHJfbG8sIGFkZHJfaGksIHJlc3VsdCk7DQo+ICAJaWd0X2Fzc2VydF9mKChh
ZGRyX2xvIDw9IHJlc3VsdCkgJiYgKHJlc3VsdCA8PSBhZGRyX2hpKSwNCj4gIAkJICAgICAidmFs
dWUgJWxYIG91dCBvZiByYW5nZVsweCVsWC0weCVsWF1cbiIsIHJlc3VsdCwgYWRkcl9sbywNCj4g
YWRkcl9oaSk7DQo+ICB9DQo+IEBAIC00MzUsNyArNDU5LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9j
YXJkKGludCBmZCkNCj4gIAkJaWd0X2RlYnVnKCJSdW5uaW5nIG9uIGVuZ2luZSBjbGFzczogJXgg
aW5zdGFuY2U6ICV4XG4iLA0KPiBod2UtPmVuZ2luZV9jbGFzcywNCj4gIAkJCSAgaHdlLT5lbmdp
bmVfaW5zdGFuY2UpOw0KPiANCj4gLQkJdGVzdF9sZWdhY3lfbW9kZShmZCwgaHdlLCAxLCAxLCAw
LCBhZGRyKTsNCj4gKwkJdGVzdF9sZWdhY3lfbW9kZShmZCwgaHdlLCAxLCAxLA0KPiBEUk1fWEVf
Vk1fQklORF9GTEFHX0RVTVBBQkxFLCBhZGRyKTsNCj4gIAkJLyogV2FpdCAxIHNlYyBmb3IgZGV2
Y29yZWR1bXAgY29tcGxldGUgKi8NCj4gIAkJc2xlZXAoMSk7DQo+IA0KPiBAQCAtNDUxLDEwICs0
NzUsMTMgQEAgc3RhdGljIHZvaWQgdGVzdF9jYXJkKGludCBmZCkNCj4gDQo+ICAJCWNoZWNrX2l0
ZW1fc3RyKCZyZWdleCwgbGluZXMsICJDYXB0dXJlX3NvdXJjZToiLCBJTkRFWF9LRVksDQo+IElO
REVYX1ZBTFVFLA0KPiAgCQkJICAgICAgICJHdUMiLCBmYWxzZSk7DQo+ICsNCj4gIAkJY2hlY2tf
aXRlbV91NjQoJnJlZ2V4LCBsaW5lcywgIkFDVEhEOiIsIGFkZHIsDQo+IC0JCQkgICAgICAgYWRk
ciArIEJBVENIX0RXX0NPVU5UICogc2l6ZW9mKHUzMikpOw0KPiArCQkJICAgICAgIGFkZHIgKyBC
QVRDSF9EV19DT1VOVCAqIHNpemVvZih1MzIpLA0KPiBJTkRFWF9LRVksIElOREVYX1ZBTFVFKTsN
Cj4gIAkJY2hlY2tfaXRlbV91NjQoJnJlZ2V4LCBsaW5lcywgIlJJTkdfQkJBRERSOiIsIGFkZHIs
DQo+IC0JCQkgICAgICAgYWRkciArIEJBVENIX0RXX0NPVU5UICogc2l6ZW9mKHUzMikpOw0KPiAr
CQkJICAgICAgIGFkZHIgKyBCQVRDSF9EV19DT1VOVCAqIHNpemVvZih1MzIpLA0KPiBJTkRFWF9L
RVksIElOREVYX1ZBTFVFKTsNCj4gKwkJY2hlY2tfaXRlbV91NjQoJnJlZ2V4LCBsaW5lcywgImxl
bmd0aDoiLCBhZGRyLA0KPiArCQkJICAgICAgIGFkZHIgKyBCQVRDSF9EV19DT1VOVCAqIHNpemVv
Zih1MzIpLA0KPiBJTkRFWF9WQUxVRSwgSU5ERVhfS0VZKTsNCj4gDQo+ICAJCS8qIGNsZWFyIGRl
dmNvcmVkdW1wICovDQo+ICAJCXJtX2RldmNvcmVkdW1wKHBhdGgpOw0KPiAtLQ0KPiAyLjM3LjEN
Cg0K
