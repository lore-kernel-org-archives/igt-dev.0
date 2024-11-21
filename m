Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5676AE64007
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 19:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B30F10E0AD;
	Thu, 21 Nov 2024 19:28:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIqVEi+A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1C310E0AD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 19:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732217302; x=1763753302;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9OPQDM8MZ5nrVt5QEoheRxB8pETsANI1aOQJzJe49ew=;
 b=PIqVEi+ArKekFIM3EQQC+S9lz6oODSJT3ltKEv9axM42RxkpBeQzqY/c
 OU0MjD7oBgLetx5J29p9AvLCoWr2QullDqsfFJzuvm4V9CQ6BQItpK5Zk
 AsT6p9WgYGPBpJyHld4l8XkIyJMhG3RXPvGbmMsErafM7+bsd5JtnBCXI
 bSzXVz63jvvIcnAAiU/Vz7VXyvICDXX/arP5psch2Nk7qgOLmR7cUXcV4
 CCRoMJI9zwuaQstiAu5ZOlvH8nyXMKWBBtjLCbDZbK+D/rylQEdy6Aylf
 lrCHceZpB5oB2bfvninFLKduD3T22jyWHzhR/QcJSrFztvAfvzwQz7X6E w==;
X-CSE-ConnectionGUID: QqFKT5UkSradwmE4IXlNSQ==
X-CSE-MsgGUID: B65E6t0WRguuuZsfNSN4bg==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32499274"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="32499274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 11:28:21 -0800
X-CSE-ConnectionGUID: s0p9KyK9ThKaE4JUgExZ1A==
X-CSE-MsgGUID: QYwceFWoR2efaEduXC5G8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="127870436"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 11:28:21 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 11:28:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 11:28:21 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 11:28:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DqhYFHPTmbzC5Cj781Xozn9dFxlz2MEnuE4GZrUYNqOctFHDa+koAk8YAAzsa9FR8m0DC074aY2K/4AUZkH/F1D2zQfvqA70vu8ffy11AFn1Xamf/9P6s3NGFvhOEly8DdjesoGdKkrVnXJFZPWuyMvbFjqc47jNPsVRXj+WcrCuJqFAObj46V5XoRVhNFRrgUWwhBW7RDSqgn9PQbACbJrCpiMBZ4zRjPQsUAb+j72UTSPz2/oWSLaJyYMUSlo5jXi4xHv2hifO3cjavCFZzPd4L0lWvneOFK/SoP0zWN1weWVfo6hRLIBJL5h2T3Z7xh35Jkqte2Jd2o4JfId0yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAjkCtNuiR+le790aSy7c1HVrtqOkg6Q7mYATmBmH2w=;
 b=wNeFNLjMzOj3zjTyIef3mdgLmy+ofJ53emYu2g5E6oIVkGt1HGLo2VS1nbD97P90yvGr++BUgf9NAmlzN9WBt7EBNx6/AFgD+ohiGM/OFxowJgYAl+Hb27Wz6AkZroii+jV4IoePrMdlhonFptznb8wSpXWHWUi97o6Em2RU8Y0pqOmpSGdfEDCm0CpO5TFjTBnqWsr8a8zSyw7vawc72bt+b1n6h8kk85Ye1+lj9dQww+kpp3mR7DyQ6RZN62molgyL/jqxy31qqd9vKxsOkw+3i2FxjVkCVwiPafmmQBx2lFjisTi7XV+I202fmBN6veHhuKPmpjD23vYGiulMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA3PR11MB7436.namprd11.prod.outlook.com (2603:10b6:806:307::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Thu, 21 Nov
 2024 19:28:04 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8182.014; Thu, 21 Nov 2024
 19:28:04 +0000
Message-ID: <00d8a0a2-de8f-4589-b77c-b52338110865@intel.com>
Date: Fri, 22 Nov 2024 00:57:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t 3/3] intel-ci/xe: Drop PSR + DRRS tests from blocklist
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241120104940.2147075-1-bhanuprakash.modem@intel.com>
 <20241120104940.2147075-4-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20241120104940.2147075-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:de::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA3PR11MB7436:EE_
X-MS-Office365-Filtering-Correlation-Id: b1460fa7-599c-4b46-2aaa-08dd0a629e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzMrQXRDb2hHMW1UM1RDaDl6VkF0T09nQU91dFFxQnBseEFueHNWQTJkUDIw?=
 =?utf-8?B?T1gwTzhOdStpN0hZWFhTdWhYanBOYkpvZS81L1pNVC9PMFk1aGF3ZWNaU2hU?=
 =?utf-8?B?V3cwVXlkTGVhaFJMTEc0RWM0V2FvWkpieEw4bCtvYU9pYjBpdzNOeTlQMTFF?=
 =?utf-8?B?dFdCZTNSdlpNbGw3WE9peFNNUWZlbXNpMzVRT05ybkcyYlN6VWJXd1FBZkRs?=
 =?utf-8?B?UnltSng3d2JQSXdJNW1Zd0ZSZ1pqbnhiOVRxZWw0SC85OEt5UXdHT3BOdmpv?=
 =?utf-8?B?M0tPUHNnUEVOYSt0ajBSOUpXT3RDOW5IMit5WTdPOEtMYm1xTFhKTnhXbHBG?=
 =?utf-8?B?SUtTRlZ4YmZzbEtsQjhtbXVkelpuL0hMQ0lzdUdnaG9OOG9hWDNZRzZJSzI1?=
 =?utf-8?B?QnlwaTJERHBhQmJjZVBxZ05kSGlBRDZCVFhlRVJUT281OUdtZmNyRGUraXEr?=
 =?utf-8?B?dkFoSElpT3FzQm5DZ0hPNUZ5NmNmaXZURDFTKytZZC95UWhoTEVpVmxmQzJm?=
 =?utf-8?B?UDFrL0NYd0ROWEdnMEhXdTVwdmg1enZXUjhWVUZaUCt1WW5HRUh0dVNyMVQy?=
 =?utf-8?B?a2FrOWE5bmhKYUgydldCQ3d0QStidExRTHB5QmRxMXF5dXUyblhBZkRDelk0?=
 =?utf-8?B?K0RDYm1ZbVloY1Z2cWNoRUtUbmxqZSs0WkxMR1F2OCthb0dkSlFUUnBrcFpl?=
 =?utf-8?B?YkQzeGNQWE13V3ZoL2UvSSs4NnRiTElLcWc2K1NZY1pUSldwem5NZWJIblNX?=
 =?utf-8?B?Z0J3d0t5djJHRXRMdGpPMjJIZ1M2aXdhOHRZN013VkM2bk1GNHBkeGFDQmU1?=
 =?utf-8?B?cXZnNkNtbTZvcmJkRFo2MDBrczFoMWFFVUZEUGhYdEtyQTJ2Snc1SUNtTjZu?=
 =?utf-8?B?blZnNU1wUWhpNXhudlduMU1QT21VMm9kdFowa3JUcnVZUGN2U2U0cXAvSG9v?=
 =?utf-8?B?YWkva2FQUmNCZVBKNFhHcjlsVmhSdnR4R3hQR05KUlZhUFA3T1dGbjZra2JU?=
 =?utf-8?B?V1RET0tibVQvQVR0aGNoK2Evdm0yaE9uSklIWk9ETzJKRjRWOUM2dHJNK0s3?=
 =?utf-8?B?enBJdEV5S3h4SkltWDRtRGtVTE5hamRibTB4V1hscWdUY2MzOW12T1RPY0xr?=
 =?utf-8?B?S29mREJnZHZscnp6WFZQOXRPZmk5QWEySHUxamlTRUpsTE5xdStRRzJ5TlZM?=
 =?utf-8?B?M1kvT0tsRmlRYXVoamU5cVRWMnhUbWdZaG9YdkN4d3Vzb1ZxZlBXNEF4dVYx?=
 =?utf-8?B?cE0zNXJoV1c0STJtc2VsRnZIWnhjUnJzSTNNTGNjKzRmdHlHZnF4UGs3NGpz?=
 =?utf-8?B?OGg1eEk3V1VibWMwb3hoL0J1aUFxVkhEUVJ0ZllsSjB5akZ0OWRiUWdmdFZ0?=
 =?utf-8?B?NVBaNnVKMndNaGtlTmEyLzBDWTlRQm9EeWVtR1dmMFNxQmFUcUJEc1lzMjlN?=
 =?utf-8?B?c0gwY1I5OXd6TmQzTUJhOThjMm5IR3N4dUVqeUNxdEE2aXlkWHRxSmtIT3Q5?=
 =?utf-8?B?MGNuVkNwKzFFQk85dFVSY1lSNlhxZVY4Unp2ZVF3aDhxNnZmTlFGUHhBTXQ1?=
 =?utf-8?B?RXZjcFg2TmwveHRWUGtmSi9HVGNHclNPdTVxaTgyQzVsZERYME96czhrTGNM?=
 =?utf-8?B?UVdkaU5WVFUxT1VxbjUveVZkVE1jbk50U05iRmRxN1A4Um5pV29EZ1N4alc1?=
 =?utf-8?B?T291T3JiSXRxYStjNGk4NlYvNW9FNTJ0K09Pc0w4N1dFdlZMMmF2SUxOY0No?=
 =?utf-8?Q?EhcBNzwiGJHUdJwnYLYG4rFJKMKWK3grR2j+scr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdXcVNFVjdadjZQeStvTlRVaWFyY2JDT3plQjlIQ0IrdldLK1M4Zi9CSU9Q?=
 =?utf-8?B?OVdZZmtQdnU5bTdlSHJOWi81WFZUTTU3MVFFdDlTNGM3K3diZXMvcEkyalR6?=
 =?utf-8?B?K1owTzRKdHhOa1VzUlovWGQrQ2dxRjZJYVhMWXF0UlNNWnVnamxmdks0bXhp?=
 =?utf-8?B?Q3RKZVpoTTI5Q3BMWlFXTEFGYlFmZ2lrcFR0UGMvaG1tN0ZpWkNiKzNDSXpE?=
 =?utf-8?B?cnhIMmVDRXl0R2xzWngxQVpxL1M1NTZIaC9kN1JubmdFckx6ZE9EajBxRzVp?=
 =?utf-8?B?eGQ5WS9EcFJPdEtJWWwrR1pjZ2NJNjBkZUFDcENoWWJ6N3FSdENrYXN6UWFW?=
 =?utf-8?B?SnhEMEFnUkI4NzNMMGkxQTdpT3RXWElNZzNBSS81cWlGYTJnZWVXVEJEQXhI?=
 =?utf-8?B?RGJrMXB0RCtxQm9jUUtwaFJEeU9NeG1PRjRnVGZ0d1dSYVAwSmczc3RFSThI?=
 =?utf-8?B?bFREUnpvSWdSd1BtUlRybHFhTGw4Y0hoSzIwUjNWc05zYWYwN0tTZHUxZTJH?=
 =?utf-8?B?N1I2eWZLSHNYOW0xNVp6NVBIUG5YQTcyZGlTajlhNDFvUGk0SU5OZXBoeGRR?=
 =?utf-8?B?VFN4MzlGRkRpV2pUMEdlLzNzZDJJbUFwT0l6YmNoSXJJdnRGcndDUUtZUDJ0?=
 =?utf-8?B?Z25Ta0hseEs2dE1XdnpHRDluZ0RJSXJycE92S3ppeDFUcjY2MXRlbXYxYTFZ?=
 =?utf-8?B?OTd6UUdqVDNxVWtXdHlWV2txelRCQkpJcTR3K3RLWWJiNDhISUluRTVnTm90?=
 =?utf-8?B?SkxXQ25xUXU5Y1I1VFQyVkJTdTh6b3FkV2l4bjNPc29YWjRzZlVacnZDTHFD?=
 =?utf-8?B?WHNSUEZnU2RaUXcrNjVDUnFlYTg5eUVoNm9iU1Q5UUxIUzdqSktZOVBRK1Rr?=
 =?utf-8?B?UUNLb05HWmJlZ2VlQ0xVNFJWT3BLSVVDcXlYRFhGREVJUHZyTTJUTHZlL1E1?=
 =?utf-8?B?cXVKTCtaaDEvS3A3Snc2Q2hzR3BIa3p3czU0dy9qUkNiTFZNbzBqVzA4dTJG?=
 =?utf-8?B?YWk5ZnFiSkZjaGhxV2RiQVJFMUZFc1NjaWxvbk9QaHljSTZ1UUMxbW0raEZN?=
 =?utf-8?B?WnozSE01Nk05QkM0M0M2YkRRUnVQT0lYemtPd0VVZm5sdGZvb2c0dlduU3dB?=
 =?utf-8?B?WEU5R2xyc1lhb2lVdGV3L3IvdXlKdG5RdGIzdlQ4L3gyYStJeFdmSFZSSmln?=
 =?utf-8?B?T3A4UzlFaFhtM1gyTjB5RmVSclUvYTBhOWgwRTBnNElSQzFORlhINGFTbnBR?=
 =?utf-8?B?Q256V09MZFdZd29mVStaWUFxRndzYzZRTzk2MC9MTFo4Z21iM3NkVkNBTnFj?=
 =?utf-8?B?MHVlbm5SZ21wb2hYSklPWjlHZ2VLWnVmaXNZbERRdlh1TTBkZTRwWUV4c203?=
 =?utf-8?B?NlNuZHBqZWdtZkh4YUMyRVcvMStVb0l4WDhaR1VHSXNmK3JmM3lsbEprSlp2?=
 =?utf-8?B?NG9UU09qUUp1VmZ4YkVlT0ppVE16QWZBOUFIKzZrUUVTWmJvNmM1Y2pVVlE5?=
 =?utf-8?B?K01qaXZ2RDI4eE1QT0thdnVBVnd0b251UFVWdis2VWJrMnNHcjFMSDhIQ3kw?=
 =?utf-8?B?UFZicnM3M3AwVFg2aHdEMmtOSzZvL0xwb01HVVNoeHdGZEd2MHJYb3RIdDJR?=
 =?utf-8?B?bElaR0hYRWx3Q3NYWDVNQWIwS2lLTEJyMnFRTTVic0RJQnlXNzJRNXl0UHQ0?=
 =?utf-8?B?WFNUNjJwYk9VRnlhbzEyclM3eEhka3BhZjEyVGNsN3V0TVI1emtMbysreHZ4?=
 =?utf-8?B?cElHNnphUmtTRGVQeXcyN3dXZjVlZjcrdHViZlFIM0JFR043UU13K0ZJMXgy?=
 =?utf-8?B?R0hWRXhSOWpqUVFpWDg3Lzhzd2FxUG9PUzFEZE1HODg4Y2wrVlFJQ2xTQkZN?=
 =?utf-8?B?TkduazJVd3VWdUNtVkk3ekYrVXo5cHZKQzMxMzNZakwvaWtkVlNVdXErTTVC?=
 =?utf-8?B?eGx5eWZRM05DaENnVnJ4L2VVWndCeTArY29KVS82dDF1VlkrNmN5Vjg4RHRw?=
 =?utf-8?B?eHVQRTJFK3RWamlyS2I5NzN0d0NsTlVWdFpsWnhGUnNmdmJjUDN0aWVRWjBo?=
 =?utf-8?B?NUdzT3pQeDFpdWZoU09PVzRqZE1mbXVkeGRHT2UwZUtLYmtKQ3ZKKzY5TTd2?=
 =?utf-8?B?MXRjaXhWbVF0RVk1bHpzaXJWT3dEd2R6UXRMblloREdnWjVSZjBFQzRNRVpp?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1460fa7-599c-4b46-2aaa-08dd0a629e87
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 19:28:04.3106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2Ml2USIlCuK6O15jAjFmJmEVdKGJptu2zOKt7GrDdv7/3EP9Yi2PMNGUfw3PLTmrJrvoJeEYgC8rIdETn1AbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7436
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 20-11-2024 04:19 pm, Bhanuprakash Modem wrote:
> As we decided to drop all subtests with PSR + DRRS combo,
> no need to maintian the blocklist too.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index b76f6061c..e29e745a0 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -75,10 +75,6 @@ igt@kms_pm_lpsp@screens-disabled
>   igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
>   igt@kms_pm_rpm@.*pc8-residency.*
>   ##################################################################
> -# KMS: Invalid combo:- PSR + DRRS can't be tested together
> -##################################################################
> -igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
> -##################################################################
>   # KMS: Yet to add/missing XE support
>   ##################################################################
>   igt@kms_prime@.*
