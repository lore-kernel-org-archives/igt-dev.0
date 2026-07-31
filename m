Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40F2C55167
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 08:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD410E1D5;
	Fri, 31 Jul 2026 08:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kGu8+MTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE83810E1D5
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 08:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785486497; x=1817022497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kHI+z84SK9R/dqb5jjMnG58VVRDz1RbJdHULv3dQQZ4=;
 b=kGu8+MTUInAdUJEvbLFEDpm8ymbOG//u4xA1NdzgphHaQgpVPr5R0g+A
 dyD+ADe+OGRK5BmwOwCkF0WZ5SrAOlr8Aof4hkV5zZF1YiA8PsbYtaUMD
 +iwB4ny1hmMB9YeaNjoTGpL/0AI1VGGrpnzMk/77SrALktHWJ2/phOuxk
 KCkT84OmHsUA6y7E9VWb5qyEbVmmKcHEIWLE3RxvWoPIZo+TM6bbnVsdY
 szYLjeQQ8LrxoYWVFZxIcADCFsPcCNWQAgMVoXpWyt3XqRWizPvroM0dd
 F+1vJXDtFNRPLx7VA6+5adJkbDG8fFGkmfweMSR/dffp5mgEiRRSoAbNS w==;
X-CSE-ConnectionGUID: 2jeVLM37R/+NSu8uRt3NZQ==
X-CSE-MsgGUID: i+UJ2BrxTE+PpqFgkJ7u2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86304896"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="86304896"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:28:17 -0700
X-CSE-ConnectionGUID: w1ofD+tLQOmOM5iY5RKSIw==
X-CSE-MsgGUID: mYvIPfXYQzW3bhWV2KGCNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="256615756"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 01:28:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:28:15 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 01:28:15 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 01:28:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDlTjzA18PW6x6/69SYi52uZrV0Xehaw5GRR6hptpp5KD2323ZTi67f01LEqWq/+y6OUQtD7KBQ2IP01j1DWEyBrccV9tirZDReoSWns+IRv1KQxzY7ojFPxtaYSyokpL11bx8IYxo6u8TTAZ6b+s8h/mMQ1d0zA8S90l4UFqTlpOnZ/V7PDeHSYwe3NOXOGYHquBSS9ab6qkcgUO8MSKRWeByFbCtUHDuLftDvq40y0wury5xdljxPu+uSOSjIzAjm20Fztm+GZT/v8XoQZMviZG5ZuaV8IkAVRMhraHf7igWe/U5yLp1wSZBieNkY0omstt/FyQzfWnrHU/zoRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5iAOWnKMtA9hxxZeIvDTZZoIopV9MIEVLYe4pY0u7s=;
 b=Y/Aw0T7pu4OP32NWaaYYwdOEAkLs7ZgQIrDv1XbTQvVsvhh9EsDSIKyXl2Mx2t/crrtIB5iU4ecqHzygEcXZJPOxCcR/sRk+dtzwrEspavUopF2IMXvyoLaBkXzOcMMIjovwuCg6S2Ha3xkV+Nak3IRZWDj671XI05j3Sxo/w7WcbdhaTpHQpSvmjEkRbUk0A7TJy7CBsjqvhwzYhQ30hWySdbKwKFZIoJ3r6zmfXYK7ZzP/7C07EOwH5hAgPbN1eGJcQvLbwHKVR53WORdinQDtGrdNKIdUXWD8Yj5Go2vgqd/ixS/qGwR6MgB7XwNIlfeIK/iZ3uywS4zqKIhX8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by SA1PR11MB6920.namprd11.prod.outlook.com (2603:10b6:806:2bb::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 08:28:06 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 08:28:06 +0000
Message-ID: <4204b8bf-254d-47b7-b663-09ba6e9b7b4d@intel.com>
Date: Fri, 31 Jul 2026 13:57:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/4] tests/kms_color_pipeline: skip if not an
 intel device
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kernel-dev@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser
 <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>
References: <20260602211259.898147-1-mwen@igalia.com>
 <20260602211259.898147-5-mwen@igalia.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260602211259.898147-5-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0211.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::17) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|SA1PR11MB6920:EE_
X-MS-Office365-Filtering-Correlation-Id: 9abb1cbb-2032-4bd4-8820-08deeedda556
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|7416014|376014|18002099003|22082099003|4143699003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 8Obj6HJGKe0vqZjVXqyJWrFhW70tPVwMYWV9QHbDnVOoYwei818TafmSKJKgiiWIrKGcJNOABA7KBvdFP4MlNSmoxgYCssTVgVTMKb0WMaxgSaviBguKOnegheqgamL3/ebBKGrE+1CMI7Mk+m+mIMglLazlOJQ2boDprZ1I0Cr/zPEVYrFx0g2DyNth1Xx+jPwblyxjw6O1/0tAcYrNPy7yX/p39yrWvK5HQSDVpvbG7Pmke4zuz6Bkz3ZYknN2oYbw07jjs4DQwzVjn0q1qiN8jTrDB9+5giZne7ERx0emhjkY0iELgatRoG+1VK6ODbi+bEvUCbcv5Zcz2xutrqJtSSmFgV9s4mE9jfZu4DyrjHfJspIcJhWk2SuC0XMBtECUDITZt6I2hf8fNO6YFitbNH/F5izTPX1lFkF1UCa5XnsqoZ7lQ6CMgEXoeBstXOBlNd6rLnGiF+NnfhcrXtftg3QEeVAZiI2ZalWw1g8jGZRnAbwpOX22NIKesXeu8TZAXSczeYhxrtHEFWIW4jGzjPeIw8TYiOKdQ0oYyzGGGnrd1UVeFEdga/YFMYx7G48HTh4W2+1B/L6q4W1DdJKm8yVNbRrlwQ0oJdSOxZtMC9STV5ks0Ukhp1xAqF9mdK7ON+sxE+QKgqSnkpdzeg9f5FT8oUuOrn1ABfNlnw4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(10067099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1pBOWhSaS9ldEEvMm45eGFJL256eWx6dzcrNDVwQzhiaGl4d2RpeWlMZlF3?=
 =?utf-8?B?ZngxdXJVaHJYOVphSE1VcUpiODhDVWdZSFBoa0M3OUNFalRzRTJvQzNMelU3?=
 =?utf-8?B?TDVzcFNWUnFuK0Z6NllBcVFVVUNmNEw3eFhmSjcwb3BQTjVES2VaVm5ISFVK?=
 =?utf-8?B?Sncrdmk3VTZWWW9SYVpWTjlXUlVKeVNvU2JsM0Jzcm5zTGZOcElsTDNNSjM3?=
 =?utf-8?B?UTRvTGxlKzl6V2FudVVaTXJISjNaVTBZbmVoMzU0bkZ2K2xmWW4rMk5sNmVT?=
 =?utf-8?B?dGJ2UjVlTmtkYnRkS0xoMUE2V2ZrUzgzMkwxeTRONUJHZ1Vjam1ZK0VMMmRh?=
 =?utf-8?B?Sno4ZEJydEZDTkdXbXpNVDlpTE8xNjF0bkhENTJBWWVQZ2V4N3lXRzNmSk8z?=
 =?utf-8?B?Yk5ZUGhOL3VGblc4a2lKK1UxQ1VtNk5uWTU1MjhjVURlSFpUMTVQeFIyVVNC?=
 =?utf-8?B?ZlhObk95dEVHOUxEY3FqeHY3b1hYSXFzUUk2dUlIWnJjcmdMTGVHSFoxWnZ5?=
 =?utf-8?B?ZjRtS3h6NWh5TVV5UTJ4bytTZzJiSHZuaDExZm1LTnF6T0pzSHdMNU54aVVK?=
 =?utf-8?B?N2xVNzZUeWpDdityZDJEMFV3b0xuTmlKSGpzUC9VVTZ0Z1NvQ0Q2REFycDFQ?=
 =?utf-8?B?VGoxeDIwMUdDWEo3elY3ZmVWTVZ1UVVWYm05SW01blBPbnJ1NkR4OUczdndq?=
 =?utf-8?B?bkYvN0tiVENDY2Vib0dtMzQxRDdnRlRZR3lCcEUzNU03aHZBT3k5dnF2aTlP?=
 =?utf-8?B?Q29Wem1BeEtrRVMrM21YTjZ6a0VqNzhySmUwckNiY1gyU3I5ZUljWkxiekkz?=
 =?utf-8?B?dVloc0FjaDRBeWkxRkxXV1lSTWliVG9vTHFsZXRmQllaQzNTYWY2WE04aW9s?=
 =?utf-8?B?N2pIN2QybTBTSnVJMFE4UUdKMno2MGZ1UmE0cklvRnVLd1NUYWxOY2Z5U3Yz?=
 =?utf-8?B?ODQ3c1NqWnRCaXJmYjNwbkg3RDl1cUhEREZYS2tEdzFvVGJ6aGp0bHpoM20w?=
 =?utf-8?B?S2RvdVA5TTNyazhxRkR1amtZUUd3Z0s4Q0o3eUJDcTFvVXdHcGJ3bzhocXMw?=
 =?utf-8?B?ZXdZTW83elYzaUVKTTFxTjk4L2NpYmxLUW8rSzZFSEJnaTBnc2RhaFJVQ3U5?=
 =?utf-8?B?cE91TXdVWVZDREJiYnpjY0d3bVhJNjBGOWFiSHpIM2EyaTA2VjlqbnZBZU1i?=
 =?utf-8?B?S0NUbkR2cEYxck9FRGJjbkJDR3I2aFA4VWxLYkVNaVh0UStVcVhEdHpJUjVs?=
 =?utf-8?B?ejJmTm5KNUlOWHZyUnA3NmlsYUZpYXhva0VXd2FNL0JrTEZGZ0srQTNEM3Za?=
 =?utf-8?B?U1hJR1U5dWdObWVUZGZTRlJjWEdLV1dMQXV6NEU2SkQ2MGJ4U3NYdDJrTk9W?=
 =?utf-8?B?aWZKZ2JFZXlPamoyYVI3R1FOTERsTzdma3IrTGZ2Nndjc0Y5UjFlZ3NEeGVZ?=
 =?utf-8?B?d0M1QXppeXFHaHRWVDlSRXV6czBvN25RRU90a0t2TmtXbVVvM3M2cDBQdTZ6?=
 =?utf-8?B?YWRVM09rQ2svQU1QaWpCWnpoU21XWTBZTkNlci85YjhGWG1WdnNtc043VU9o?=
 =?utf-8?B?YXhyRXQzQjYwZ3krRTNVZ25hU0NQb2ZGb0JDUlJROFpUNnF4L1JSem02UTZV?=
 =?utf-8?B?Z3lGVUdjaUpyQ3BzUHF3cEtSZmdXV2VIcjZNL20rdGFjdlRIVS95a3Q5clZm?=
 =?utf-8?B?N0R3WUk4ZEVIRzBBeVZRN0dkTjhpT0pxZzQ4a29CWTFISjJXRFA0NEY3aisx?=
 =?utf-8?B?Znh2L3M0cjZxZzI4SXA5NXV4VFQ1TDZaRVBkb2cydVFsRlVWOXFEamR6eVRL?=
 =?utf-8?B?MkhXaHJ2YkhWWE43Z3FXMURDZFB5U0thejdhWjcwUkZxNnhsK0RDTWtRcWNL?=
 =?utf-8?B?Y2U5WUNFeXhVaUpHbGVFVm8rWS9nMEV3TFpqRWVMRnRvR3RhemZ0QUpOVjZH?=
 =?utf-8?B?dmJyckUvWE1sR2JrRnhmbnc2TFNvTkZla1YxUFUyclFGQmVvcCtnN296ekZh?=
 =?utf-8?B?TUFkU3prcHZIM0kzcyt5NVl3a09za05XdzhyV09nZ2dwNm5VaHV5cEk0ZGgv?=
 =?utf-8?B?UmN4bnpjNkhaeC9oeTI2SUtxTi9EYy8xM0pUaTljc29uZzhGcW16ZndVT0h0?=
 =?utf-8?B?aFZ4K3ZDQklxOXhqTUhkVGJYejZkTFFLQk1nZDZzcXQxNzY1Tmpja3p6YzM5?=
 =?utf-8?B?UWdpQWEwdjVmaG5aZWlvazJEWjJFVlNhQk9lODNvbWZVazZFNmJGbmdZMWV5?=
 =?utf-8?B?dkpVMjd2UDBhejdpb0dhUlppNHpHbzlTbkZPZkxoTGtrKzc3RzBIL2FJcFNT?=
 =?utf-8?B?NFRKQ1ZhOXU5QnVGNjM0Y3k4MVNUZHJTQ29YeksxTkl6R2lYQUJJRUtDUkhE?=
 =?utf-8?Q?QDXzYeqQTIdyoL1I=3D?=
X-Exchange-RoutingPolicyChecked: LgAt8cYgnquC64Y1l4f856waDAYstKC3xPnl2ZZlB6/BkaF5djtWwVFB+W/q6jfeKF5lNeg8IClGmL5IwMSvbhpQaEY8ReV/Dd3r3uTbzgy/m5k0OVZTyut5b/K4EhbYXvpFy3o9uMT4SbzV0iVgsPGcFCnBiGV1SK3FxHpWsDlnYbzru+lOYEfhQNSEGwALbkvJjHK4kxKDNsKBiwcEfvyy1PWwHoUAJ3YVQDr4g/PGmh/i9InuVCf5Ny7cjjklqvcal0VwPVwHAdUNx8zaePOHR0gDcGd8uV7/ikIzlmQOWqcFDg8TgpwfgP4dmDGxv1iW2FWfxnIIK6NdtOjF4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9abb1cbb-2032-4bd4-8820-08deeedda556
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 08:28:06.5101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wy3vmjKOK/QjbQKsw2qd7xCau8h9uvwozoYKOrFkx6YTSEWWgc1Wgq1qXgWIdUfK61VU2DxFh07LnbvA1naYF6E7PBbQ00lWZ9fTxXTVcHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6920
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



On 6/3/2026 2:36 AM, Melissa Wen wrote:
>  From documentation, the test requires i915 or xe driver, so make sure it
> only runs with intel devices. In addition, it's a CRC-based test, making
> kms_colorop with writeback more aligned with color testing and
> validation. Other drivers should work on adapting this test to their
> needs if they are looking for CRC validation.
> 

I wonder if we should move this to the intel specific folder but the 
test follows the generic [Degamma] -> [CTM] -> [Gamma] pipeline. So in 
theory some other device can use still use it if they want. We can do 
without the move.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>   tests/kms_color_pipeline.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 6119a830f..4ec483038 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -367,6 +367,7 @@ int igt_main()
>   
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_require(data.display.is_atomic);
> +		igt_require(is_intel_device(data.drm_fd));
>   	}
>   
>   	igt_subtest_group()

