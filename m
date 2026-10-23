Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118E606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 07:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cp9wMa38
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4F610E5B8;
	Fri, 23 Oct 2026 07:43:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986091129E7
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792741285; x=1824277285;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xkc3X5fGuQf9c+vfw2MTzfIJq3aYOy8DERw2PlFDX5w=;
 b=Cp9wMa38QfAsGmsXa8PyK1b6QD9/ZhEWF6aS3sC2sih8SI7ZYWmH8dhz
 3zqqIxMaTl4DvyrlSK/OZcc1NDEyQ6vFwmOYkB+77+RuteJ0llB+xJPma
 WYZuX2QwUca+eQb6dC8qDvGFHf9kKpm7kq5HqO8L2kuRToFgJvwN8L6+n
 EiYcrQgNZjDL+EbwijxrgWWUscLY6cB1WL11cJSQrTrQBkLP2TeV0jRGo
 bGolMIb2Sz0Nt+vRq1lc0/4laDwOa0gut34nCDUUcQb9hD69zyAT9n1bl
 l8PXz0adnDzPHg69UQIHRSDdLGZf6Hi2Qoq899cMu4vMtbEHlztZuNuKK Q==;
X-CSE-ConnectionGUID: 1H71Mo22SdueZNugdfnp3Q==
X-CSE-MsgGUID: Fs5kOKuXRWe6h/K6HA/P8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1535648"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1535648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 00:41:24 -0700
X-CSE-ConnectionGUID: iw2NABZoRHKprbiIQjWcKg==
X-CSE-MsgGUID: cq8Qig5eTHu1Ty4TnE76lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3474420"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 00:41:25 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 00:41:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 00:41:08 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 00:41:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mAKm5Oo8LDuczHFujjB66lEbAuVEsToHBPtkUc9h7/+uu/y/wziHVdRu5XKOwhC5dy1Zye74oFooPcbeZRguIbBGnUsAoyK3FlUoWGt8N8CWYYJUR7EiXeLqYUBLC++3p3vt3HeV8LxvsSaIwsj2zHIJBGboWc0SCGmQx2Tr+ZhVIX638avpEfXlKJb6pVg7meTUjoq2Cw4N2KtSEiMYufgQ7UswozMHLpSIB9GGZajzOUSn9VsPRpBS8HpWNe7u3C/pEc+UcLvNQLAwENsesatZjWY5vleleOlcjvqlovAjAzv5LjKL33O5CAwBiYFzZL8wcHgce/F1NqgmXQG1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zy4C+re/pGTISell1d+XbOD3Spi1K+xH015vc2RCPU=;
 b=ir7pb2iTm7DUM3aKEhgc+9uBGs0jRsZYWzmgdN/VPvaU67HwzPbljRgyShndBuQhkrPzla9CAHnjCvSf+QDmeBJOA5tjyngEiASOopAuUh1UQs6m9ovH33M9oCFgAvc6Fp/REF8DfcdNZ6D8glBjasej1M6B+aO+jwfbHcJVEY1qyUlFzokpFAadIVHHSFlIPaMXInQ0bzwR8L/SIiR2IQ1cx8wY8qVZZa3qLeh3gZkW0coB6cnRNgWAB7XSQGWfrOUZ3enOjcd2ipaaCvA8IVL8NKBShPzg2e7bsN4gNrAdfNyqm0911IkH7Stn9/7+aLrxZzCAm+qjm8Guj6JsVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7499.namprd11.prod.outlook.com (2603:10b6:510:278::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 07:41:06 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 07:41:06 +0000
Message-ID: <97a1c4a5-9966-4187-a1c0-f36f298a8d65@intel.com>
Date: Fri, 23 Oct 2026 13:10:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/10] tests/intel/xe_err_injection: Add GT UC Unicast
 GAM Walker Command Parity Error Injection
To: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Purkait Soham <soham.purkait@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-8-ravi.kishore.koppuravuri@intel.com>
 <c3988e7c-9d95-40e8-afc7-d524bed046e3@intel.com>
 <bd2f0e68-f11a-4a1d-bb86-9f8d3dff01ca@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <bd2f0e68-f11a-4a1d-bb86-9f8d3dff01ca@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ed1fb58-f98a-4c89-ddb1-08df30d8ff21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|18002099003|261022105027099003|261022075727099003|4143699003|11063799006|10067099003|261021121427099003|56012099006|261009223027099003|261022113327099003|261021135927099003;
X-Microsoft-Antispam-Message-Info: nndBZOWAhsQuCvSx6IKfyR2vjXP89acQhpb5WQdDmzJqyHTk1ev7p0fWubmQ3VD5cMywo1icvT5orPPUeH9waI8C3HT3wDP7zFugpCFBhYQzfLCpWDX2C3ZkJCvULczVP/rZ3xDCXIZnSYOpOzviMptZHdSCk3VOBFxosM5vP7KVE3UC8aO0j+WKR04pVG4nwBmZ35pwcSKYE+qODY+7lvVx0vikStI0mY9VbJLxcbkDm3tlTC9BSd0ZxCHT2As8Qei1ybzn6Z+5Gqkh5rJWQ2klqPjiJ3tCn8H2vK/osQn4nSo5bTnePwolOahBJKnnXFTwOn6C8h3pSggazmoDsB+hukjgd5sPeFGnsVTCJjmt6Sg8yOdIKRaAN7BBkcKxEps4vaxNCsP8yonm/NSSdvFk3NlHHUuQDLEDN2jcpGn52pMa3mNGknFTGrrSadpcyjl5gAGmzQOIcGVXN8g5TUAZ4euumyfbtXds5w1+7wIjPmEVCgph2gpi9HZ3Wa9bEAvMUcOMJEa+qGC2FfVQ+Yf0GB2NIEYGw4Wptcmh24m3o+DlCSeexzcxn6LfVn+sHFdT2jlsGlXrjIiNsWO3ZvTemQjnklV8m/o3f1KEYmIQGOwp7hHBY8QHwJnR1ELTeKgYFNJ63woYzoCC9xLWAt7j6tVIz4Yd7qt7oR14jTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(18002099003)(261022105027099003)(261022075727099003)(4143699003)(11063799006)(10067099003)(261021121427099003)(56012099006)(261009223027099003)(261022113327099003)(261021135927099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hsSW93ZTF1WlMrcmR1QlZCaC8xZ1VnWTRzNUJXV1BUYUk1MlVyTmNBajJB?=
 =?utf-8?B?UEdtVVkwRk02QnExeWUxcXVZck5ZMEpVOHlIOTU3WVplWEpEcTRhdU1tSFpk?=
 =?utf-8?B?Q2E4R0REOVA0QWRlMlB2MWZpa3FtazRXUVp1MGFSbS9EQWRLN3FFc2QyVmNn?=
 =?utf-8?B?TU1IRkY4Tk1BZU9tN1kwN01iNWNwWVh5RzlZTS9MdXQ4bXFWNE1maHZ3RW80?=
 =?utf-8?B?UDBiVUNHN2N6ZzFFdkJiZ1pPclNMZnE3T0Q3V05TVWJmd2pHakRwc2Z4Qk5o?=
 =?utf-8?B?Ymd1cEhnT0VlVWZkQWdJUFhtOVdtQjJlci9NZ3IybFMrUzBvaG5wcC9hbGNM?=
 =?utf-8?B?NkZIK2h5NHY0Q2pVbHB4NEdBUHZ6UG03eWZubDl1ZDRTeGM1T3RVa2gyS1oz?=
 =?utf-8?B?ZzUxYkJyR2kwSHl3djNyUWJLZ1BuUWFyVm1ZUEkvTWtnQTl6SVFrSWdYK3l1?=
 =?utf-8?B?WmRKN0dHUTBhOFM2MUcyU1RCc2gveHovQVZNOC9NSk5FMENyc2ozVDE5ZjBQ?=
 =?utf-8?B?SXQxaEFYcXBnNUFZUUgreW9xdnNYTWxPOHBNLzNxN0FkTUZmMHlMMjkwRGZq?=
 =?utf-8?B?eDRST09FL3AwTnFLTlRLdmJwZlF0SE4zRk9HdWFMOXJnOG9udGhTSXFtMzE5?=
 =?utf-8?B?NElRVVVwcDlQZE91dmFpRGZNTmxsdHREMzVsWlJlODUvSGtJaGlmaUxPNDRk?=
 =?utf-8?B?eS9SQjZ6eTk5SXVDdXl4UWQ1Rklxbm9NK1N0OXdwamkydE1SN0pWellxa2ZO?=
 =?utf-8?B?L00zVDZUa1l4Y2h2cUowdEFLQVJ5cXJVQ0crbUk0VXNYeXI3UTdQSmVXanlZ?=
 =?utf-8?B?cythYmp2L0ZEL2lmZG1FNnhoTFpCVXd2cEFtTjJQTWwybHFaMHExaXFjMkNB?=
 =?utf-8?B?dDIxRTh6RGtLZG9KU09xMzhwdWhPNWFaSjg4cy9BMXRMZkY1eGxKWFhiWFd0?=
 =?utf-8?B?SnM0SFIyQmt3NnFGSXMzSFhRRXVhOGxVRnk1YXY2b0JISCttOU96eVJWbDZ6?=
 =?utf-8?B?SEpra2xaekVmSHZ1WFVDbllZV3NrYkFzVW5RcFFEN29KSHVIVXFrbmRhVlhZ?=
 =?utf-8?B?eTU3T2xIRk1ETUljdlY2eTFMTlNnZkNCV0NJTHRTSlZLNmUyVnVEZGQ4Rlpl?=
 =?utf-8?B?blJGbml2SGNuLzN4d2lyWXcrQnF6bU5lQ2FoVFFuWVNIUEJPZlRIeWIzSWVQ?=
 =?utf-8?B?VTJORkxKV3hLblFUT3l5bU14a1ZJRDBKUXVKMWtkUWFwN1BZV1ZtcFFYYm1T?=
 =?utf-8?B?WmYzTXZSM3ZhbFcyQUhNTjdVMy9qSFFGUGlTVUZON0hDa05rNnV1bldlNk5E?=
 =?utf-8?B?Q0tJTkVjemxIZVEvRWMzQ0tvOHlvUmJPR2w3M05sYzlzTFNERkFqWktFNGpp?=
 =?utf-8?B?M2JkaTh3WGg0bjVod08wSFloZlNnbnA3TWI4T1RIZjlWNkZIUjdNR3dtR0I4?=
 =?utf-8?B?NHRBY2ZXZTJkYndlQWFCQXBjdXVVaVdjMGJzYm1lL003dXROd1V2VmQ1YUxo?=
 =?utf-8?B?NkxXWG4zT1NzYzNWa0dtRHdtaE5uVVQzNmVhWlBSWXZteldlSVhBdVk3TWc0?=
 =?utf-8?B?ME1DWkI3MFZuamMvV3BhMWtSQWNib3FOK2N0UVBvK21NQlRaMkdqSVlJN1Uv?=
 =?utf-8?B?U3c3THJJY25DUnpVVnNlQ2UwYWZvUmRsd1ZmdWN0YzdZQWhtSUswd0g0d2RW?=
 =?utf-8?B?OWtBUXVvcUhKYnhqc1RheGs0QkdsbDZHL0lOdjUwWnJud1pqYVdQTnpIYURO?=
 =?utf-8?B?NnZFclQ1ZitwRjJubnhTQmF3MzBFZHdDMUpaRjM0RStBVVhsV2o1NHBvR0F3?=
 =?utf-8?B?V1ZMV29od0l4MGdHekVxQzI4NFlZMkFVbUlvVXM3ME5zMVFNcUtwM2ZVTUcx?=
 =?utf-8?B?WGtMYTF4UThVQ0Fwa251MmF5WEtqNEFXYVZuRkY4Ty90UjZXbDBGbjJXSmJE?=
 =?utf-8?B?RFBCeSs5NVRSVXUycVJMVG9MeEk4ZncxY2Zsa1NSUjNuL0tBNVlhZ1E1SGZ1?=
 =?utf-8?B?Wlg0YTVhR3UwWEZGVW1iSlh1NU41aElFRVN6UjZ5VWhJalQxc25rR1Z4SUhJ?=
 =?utf-8?B?cWltZDA4WmRFTVhrZy9ZbUowSTRVVEVtYmo5aG9tL0w3Vld2MWhvdmdBV1N2?=
 =?utf-8?B?ZlhaV0l0TXQyRC9KVCtBWHlXeDJ5TUNUbXRtMG8yaEZjWHVkbUF3ZGhsQXly?=
 =?utf-8?B?akdFK1h3UCtkYWhMOENRcmlXMkFSckE1ZWVWTVZvQkNtZCtZdHRwV0pLLzEw?=
 =?utf-8?B?NVF2QnZxZnR0MUJMa1AzQnBjelE4SjZLTWl6dTdGUWdvUXFFT1hDbUxJUnRt?=
 =?utf-8?B?TzhWZGxpR243RE5lL3daaThraTNGNGt4Mi9tenRmaGwvYVlicXQwZz09?=
X-Exchange-RoutingPolicyChecked: b1YDyOtRH3zSfLXR2GYb+Nm/6xpnbnhbLlGjqctg9gnLaOMbJ2aq6rl0E6SDhbeb1JIvwsYYVUsUS5rzEIEx/MjxBtDRVdKS6z0rJskJ+kUxWxYPiB/6mgvgnejakr5wNjTYq30CIovYmuiyllyvrH7cSuZeJmQvIK4QbXmYf00xgjm/gCmqCvnyPzhXYWGwQr4x9idbF7UeuZoxrzXdTPiIuqxhjloj5FItfgarrEdvxgTj7CVfDSDeVRuGBFsLda4lNmIEF6pUtpd8UQKyqofJtvM2Oh1hj5klw47LUdVtNH2zHqiR8YQc0LHAirErUQZB1aCzs2Xy5Oy5eEvUtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ed1fb58-f98a-4c89-ddb1-08df30d8ff21
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 07:41:06.4265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvhkzxjVMqaMz1IzhWr4WLakdzNO0PTQPyPKWujxhe6qnvZO2sQoO1pQfuBxHoFHDbH4ooyClryejDlzIA9bSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7499
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 09-10-2026 13:44, Koppuravuri, Ravi Kishore wrote:
> Hi Riana,
>
> On 21-09-2026 10:39, Tauro, Riana wrote:
>>
>> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>>> MMIO based GT Uncorrectable Unicast GAM Walker command parity error
>>> injection to verify the Xe driver error handling and recovery flows 
>>> with
>>> the help of DRM Netlink API suite
>>>
>>> Cc: Purkait Soham <soham.purkait@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>>> Cc: Jadav Raag <raag.jadav@intel.com>
>>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>>> Signed-off-by: Ravi Kishore Koppuravuri 
>>> <ravi.kishore.koppuravuri@intel.com>
>>> ---
>>> v4:
>>>    - Added Steer Semaphore for disabling and enabling multicast
>>>      operation(soham)
>>>    - Increased device recovery check timeout from 5secs to 10secs
>>>    - Used updated library names with igt_drm_netlink_* prefix (Nikula
>>>      Jani & Kamil)
>>> ---
>>>   tests/intel/xe_err_injection.c | 342 
>>> +++++++++++++++++++++++++++++++++
>>>   tests/intel/xe_err_injection.h |  31 +++
>>>   tests/meson.build              |   1 +
>>>   3 files changed, 374 insertions(+)
>>>   create mode 100644 tests/intel/xe_err_injection.c
>>>   create mode 100644 tests/intel/xe_err_injection.h
>>>
>>> diff --git a/tests/intel/xe_err_injection.c 
>>> b/tests/intel/xe_err_injection.c
>>> new file mode 100644
>>> index 000000000..683994d1c
>>> --- /dev/null
>>> +++ b/tests/intel/xe_err_injection.c
>>> @@ -0,0 +1,342 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +/**
>>> + * TEST: MMIO based Error Injection
>>> + * Category: RAS
>>> + * Mega feature: Telemetry
>>> + * Sub-category: Driver
>>> + * Test category: Error Injection
>>> + */
>>> +
>>> +#include <stdio.h>
>>> +#include <stdlib.h>
>>> +#include <string.h>
>>> +#include <time.h>
>>> +#include <fcntl.h>
>>> +#include <unistd.h>
>>> +
>>> +#include "igt.h"
>>> +#include "lib/igt_drm_netlink.h"
>>> +#include "lib/intel_reg.h"
>>> +#include "lib/intel_compute.h"
>>> +
>>> +#include "xe_drm.h"
>>> +#include "xe/xe_ioctl.h"
>>> +#include "xe/xe_mmio.h"
>>> +#include "xe/xe_query.h"
>>> +#include "xe_err_injection.h"
>>> +
>>> +enum {
>>> +    RECOVERY_SUCCESS = 1,
>>> +    RECOVERY_FAILED,
>>> +    RECOVERY_TIMEOUT,
>>> +};
>>> +
>>> +static void run_xe_compute_on_all_engines(int fd, bool state)
>>> +{
>>> +    struct drm_xe_engine_class_instance *hwe;
>>> +
>>> +    if (state == POST_ARMING_INJECTION_WL)
>>> +        igt_info("Running compute-square on all engines post 
>>> injection\n");
>>> +    else if (state == POST_RECOVERY_WL)
>>> +        igt_info("Running compute-square on all engines post 
>>> recovery\n");
>> Single message should be sufficient. Won't the other info messages 
>> indicate if recovery is done or is it during injection?
> ok. will update
>>> +
>>> +    xe_for_each_engine(fd, hwe) {
>>> +        if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
>>> +            continue;
>>> +
>>> + igt_require_f(xe_run_intel_compute_kernel_on_engine(fd, hwe, NULL,
>>> +                                    EXECENV_PREF_SYSTEM),
>>> +                                    "GPU does not support "
>>> +                                    "compute on engine\n");
>>> +    }
>>> +}
>>> +
>>> +static void write_reg(struct xe_mmio *mmio, uint32_t reg, uint32_t 
>>> value)
>>> +{
>>> +    xe_mmio_write32(mmio, reg, value);
>>> +}
>> Unnecessary wrapper
> Will remove the wrapper and use xe_mmio_write32 directly
>>> +
>>> +static void modify_reg_bit(struct xe_mmio *mmio, uint32_t reg_addr,
>>> +               uint32_t bit_mask, bool set)
>>> +{
>>> +    uint32_t regval;
>>> +
>>> +    regval = xe_mmio_read32(mmio, reg_addr);
>>> +    if (set)
>>> +        regval |= bit_mask;
>>> +    else
>>> +        regval &= ~bit_mask;
>>> +
>>> +    xe_mmio_write32(mmio, reg_addr, regval);
>>> +}
>>> +
>>> +static void acquire_steering_semaphore(struct xe_mmio *mmio)
>>> +{
>>> +    uint32_t regval;
>>> +
>>> +    while (true) {
>>> +        regval = xe_mmio_read32(mmio, STEER_SEMAPHORE_MGSR_3D);
>>> +        if (regval == STEER_SEMAPHORE_MGSR_3D_VALUE) {
>>> +            xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D, 0x0);
>>> +            return;
>>> +        }
>>> +    }
>>
>>
>> Are we expecting the single write not to work? Why a while loop?
> Here, I am accessing the steering semaphore. As, it does not have 
> explicit wait and signal functions, I am busy waiting on the semaphore 
> until its value becomes 1. So, while(true) is used here.

Is there a risk of an infinite loop? Please add a skip if there is issue 
in acquiring semaphore after a count

>>
>>
>>> +}
>>> +
>>> +static void release_steering_semaphore(struct xe_mmio *mmio)
>>> +{
>>> +    xe_mmio_write32(mmio, STEER_SEMAPHORE_MGSR_3D,
>>> +            STEER_SEMAPHORE_MGSR_3D_VALUE);
>>> +}
>>> +
>>> +static int acquire_forcewake(int fd)
>>> +{
>>> +    int fw_handle;
>>> +
>>> +    fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
>>> +    igt_assert_lte(0, fw_handle);
>>> +    return fw_handle;
>>> +}
>>> +
>>> +static void release_forcewake(int fw_handle)
>>> +{
>>> +    if (fw_handle >= 0)
>>> +        close(fw_handle);
>>> +}
>>> +
>>> +static uint32_t get_counter(uint32_t node_id, uint32_t error_id)
>>> +{
>>> +    struct app_context ctx;
>>> +    int ret;
>>> +    uint32_t error_value = UINT32_MAX;
>>> +
>>> +    ret = igt_drm_netlink_init(&ctx);
>>> +    if (ret < 0) {
>>> +        igt_warn("Failed to initialize netlink socket for error 
>>> command (ret=%d)\n", ret);
>>> +        return error_value;
>>> +    }
>>> +
>>> +    ctx.node_id = node_id;
>>> +    ctx.error_id = error_id;
>>> +
>>> +    ret = igt_drm_netlink_get_error_counter(&ctx);
>>> +    if (ret < 0) {
>>> +        igt_warn("get_error_counter failed from error command path 
>>> (ret=%d)\n", ret);
>>> +    } else {
>>> +        error_value = ctx.error_value;
>>> +        igt_info("get_error_counter: node_id=%u error_id=%u 
>>> value=%u\n",
>>> +             ctx.node_id, ctx.error_id, ctx.error_value);
>>> +    }
>>> +
>>> +    igt_drm_netlink_cleanup(&ctx);
>>> +
>>> +    return error_value;
>>> +}
>>> +
>>> +static int check_dmesg(const char *marker, int elapsed_secs)
>>> +{
>>> +    static const char * const recovery_messages[] = {
>>> +        "AER: device recovery successful",
>>> +        "AER: device recovery failed",
>>> +    };
>>> +    char *buff = NULL;
>>> +    size_t buff_size = 0;
>>> +    size_t i;
>>> +    ssize_t line_len;
>>> +    FILE *fp;
>>> +    bool marker_seen = false;
>>> +
>>> +    fp = popen("dmesg", "r");
>>> +    if (!fp) {
>>> +        igt_warn("Unable to open dmesg to check recovery status\n");
>>> +        return -1;
>>> +    }
>>> +
>>> +    while ((line_len = getline(&buff, &buff_size, fp)) != -1) {
>>> +        if (!marker_seen) {
>>> +            if (strstr(buff, marker))
>>> +                marker_seen = true;
>>> +            continue;
>>> +        }
>>> +
>>> +        for (i = 0; i < ARRAY_SIZE(recovery_messages); i++) {
>>> +            if (!strstr(buff, recovery_messages[i]))
>>> +                continue;
>>> +
>>> +            igt_debug("Found \"%s\" in dmesg after %d secs\n",
>>> +                  recovery_messages[i], elapsed_secs);
>>> +            free(buff);
>>> +            pclose(fp);
>>> +            return RECOVERY_SUCCESS + i;
>>> +        }
>>> +    }
>>> +
>>> +    free(buff);
>>> +    pclose(fp);
>>> +    return RECOVERY_TIMEOUT;
>>> +}
>>> +
>>> +static int check_err_recovery(void)
>>> +{
>>> +    time_t start_time = time(NULL);
>>> +    time_t timeout = 10 * 60; /* 10 secs */
>>> +    int time_interval = 30;
>>> +    time_t elapsed_time;
>>> +    int status;
>>> +    char marker[128];
>>> +
>>> +    snprintf(marker, sizeof(marker),
>>> +         "IGT xe_err_injection recovery marker pid=%d start=%lld",
>>> +         getpid(), (long long)start_time);
>>> +    igt_kmsg(KMSG_INFO "%s\n", marker);
>>
>> Why kmsg?
> This is to print a marker message in dmesg, so that while checking for 
> the device recovery (AER), it starts searching for the recovery status 
> messages after this marker message to avoid fetching the previous 
> run's recovery messages. BTW, planning to use aer uevents to fetch the 
> recovery status in the next patch series instead of relying on dmesg.

Is it good to rely on info message?

>>
>>> +
>>> +    while (1) {
>>> +        elapsed_time = time(NULL) - start_time;
>>> +        status = check_dmesg(marker, elapsed_time);
>>> +        if (status < 0) {
>>> +            igt_warn("Failed to query dmesg for recovery status\n");
>>> +            return RECOVERY_FAILED;
>>> +        }
>>> +        if (status == RECOVERY_SUCCESS || status == RECOVERY_FAILED)
>>> +            return status;
>>> +
>>> +        if (elapsed_time >= timeout) {
>>> +            igt_warn("Timed out while waiting for error recovery\n");
>>> +            return RECOVERY_TIMEOUT;
>>> +        }
>>> +
>>> +        sleep(time_interval);
>>> +    }
>>> +}
>>> +
>>> +static void print_aer_recovery_status(void)
>>
>> Let's not rely on dmesg. use uevent.
> Sure. it is planned in the future patch series.

Please add a TODO

Thanks
Riana

>>
>>> +{
>>> +    int recovery_ret;
>>> +
>>> +    recovery_ret = check_err_recovery();
>>> +    igt_assert_f(recovery_ret != RECOVERY_TIMEOUT,
>>> +             "AER error recovery timed out\n");
>>> +    igt_assert_f(recovery_ret != RECOVERY_FAILED,
>>> +             "AER device recovery failed\n");
>>> +    if (recovery_ret == RECOVERY_SUCCESS)
>>> +        igt_info("AER device recovery successful\n");
>>> +}
>>> +
>>> +static void log_status(bool val, const char *err_name)
>>> +{
>>> +    if (val)
>>> +        igt_info("Injection: %s Success\n", err_name);
>>> +    else
>>> +        igt_info("Injection: %s Failed\n", err_name);
>>
>> Use ternary operator instead of new  function.
> will update
>>
>>> +}
>>> +
>>> +static bool gt_uc_wkr_parity_recovered;
>>> +
>>> +/**
>>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err
>>> + * Description: GT Uncorrectable Unicast Walker Command parity 
>>> error injection
>>> + * Functionality: error injection
>>> + */
>>> +static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
>>> +{
>>> +    int fw_handle;
>>> +    uint32_t error_counter_before_inj;
>>> +    uint32_t error_counter_after_inj;
>>
>> Use shorter names.
> will update
>>
>>> +    /** TODO
>>> +     *  Fetching node_id and error_id dynamically is pending to 
>>> implement.
>>> +     *  For now, using
>>> +     *  node_id=1 (uncorrectable_errors) and
>>> +     *  error_id=1 (core_compute)
>>> +     */
>>> +    uint32_t node_id = NODE_ID_UNCORRECTABLE_ERROR;
>>> +    uint32_t error_id = ERROR_ID_CORE_COMPUTE;
>>
>> This will fail on multi-gpu.  This has to be dynamic. I don't think 
>> TODO will work
> Sure. this is in plan for the future patch series. for now, it 
> supports only single gpu.
>> +
>> +    fw_handle = acquire_forcewake(fd);
>> +
>> +    error_counter_before_inj = get_counter(node_id, error_id);
>> +
>> +    acquire_steering_semaphore(mmio);
>> +    /* Arm the injection sequence. */
>> +    write_reg(mmio, MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
>
> why not use mmio_write directly?
> will update
>>
>>> +    modify_reg_bit(mmio,
>>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS,
>>> +               WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE,
>>> +               true);
>>> +    modify_reg_bit(mmio,
>>> +               MC_PKT_CTRL_MGSR_3D_ADDRESS,
>>> +               MC_PKT_CTRL_MGSR_3D_VALUE,
>>> +               true);
>>> +    release_steering_semaphore(mmio);
>>> +    igt_info("Injected GT Uncorrectable Unicast Walker Cmd parity 
>>> error\n");
>>> +
>>> +    run_xe_compute_on_all_engines(fd, POST_ARMING_INJECTION_WL);
>>
>> If there is an assert or skip in the above function. All forcewakes 
>> and registers need to be restored.
>> Add a exit handler.
> will update
>>
>>> +
>>> +    release_forcewake(fw_handle);
>>> +    print_aer_recovery_status();
>>> +    error_counter_after_inj = get_counter(node_id, error_id);
>>> +
>>> +    igt_assert_f(error_counter_before_inj != UINT32_MAX &&
>>> +             error_counter_after_inj != UINT32_MAX,
>>> +             "Failed to fetch valid error counters: before=%u 
>>> after=%u\n",
>>> +             error_counter_before_inj, error_counter_after_inj);
>>> +
>>> +    igt_info("error counter: before injection=%u after 
>>> injection=%u\n",
>>> +         error_counter_before_inj, error_counter_after_inj);
>>> +
>>> +    igt_assert_f(error_counter_after_inj > error_counter_before_inj,
>>> +             "GT Uncorrectable Unicast Walker Cmd parity error 
>>> injection "
>>> +             "failed: before injection=%u after injection=%u\n",
>>> +             error_counter_before_inj, error_counter_after_inj);
>>> +    igt_info("GT Uncorrectable Unicast Walker Cmd parity error 
>>> injection successful\n");
>>> +    gt_uc_wkr_parity_recovered = true;
>>> +}
>>> +
>>> +static void inject_error(const char *injection, struct xe_mmio 
>>> *mmio, int fd)
>>> +{
>>> +    igt_info("Starting Error Injection test: %s\n", injection);
>>> +    if (strcmp(injection, "test_GT-UC-unicast-wkr-cmd-parity-err") 
>>> == 0)
>>> +        wkr_cmd_parity_err_injection(mmio, fd);
>>> +    else if (strcmp(injection, 
>>> "test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") == 0)
>>> +        run_xe_compute_on_all_engines(fd, POST_RECOVERY_WL);
>>> +    else
>>> +        igt_info("Invalid Error Injection specified\n");
>>> +}
>>> +
>>> +/**
>>> + * SUBTEST: test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl
>>> + * Description: Run a post-recovery Xe workload after parity error 
>>> injection.
>>> + * Functionality: workload validation
>>> + */
>> Add all descriptions at start of the file if we don't have a function 
>> per test
> will update
>>> +
>>> +int igt_main()
>>> +{
>>> +    int fd;
>>> +    struct xe_mmio mmio;
>>> +
>>> +    igt_fixture() {
>>> +        fd = drm_open_driver(DRIVER_XE);
>>> +        igt_require(igt_debugfs_exists(fd, "forcewake_all", 
>>> O_RDONLY));
>>
>> Add the reason for skip. use igt_require_f
> will add
>>
>>> +        xe_mmio_access_init(fd, &mmio);
>>> +        igt_require(xe_mmio_is_initialized(&mmio));
>>
>> Same
> will add
>>
>>> +    }
>>> +
>>> +    igt_describe("Inject GT uncorrectable unicast worker command 
>>> parity error.");
>>> +    igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err")
>>> +        inject_error("test_GT-UC-unicast-wkr-cmd-parity-err", 
>>> &mmio, fd);
>>
>> Use enums instead of string comparison.
> will update
>>
>>> +
>>> +    igt_describe("Run post-recovery workload after GT parity error 
>>> injection test.");
>>> + 
>>> igt_subtest("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl") {
>>> +        igt_require_f(gt_uc_wkr_parity_recovered,
>>> +                  "Run GT-UC-unicast-wkr-cmd-parity-err first\n");
>>
>> shouldn't every test be independent.  If there is a dependency make 
>> it a dynamic subtest
> will update
>>
>>> + 
>>> inject_error("test_GT-UC-unicast-wkr-cmd-parity-err-post-recovery-wl", 
>>> &mmio, fd);
>>> +    }
>>> +
>>> +    igt_fixture() {
>>> +        xe_mmio_access_fini(&mmio);
>>> +        drm_close_driver(fd);
>>> +    }
>>> +}
>>> diff --git a/tests/intel/xe_err_injection.h 
>>> b/tests/intel/xe_err_injection.h
>>> new file mode 100644
>>> index 000000000..a70e6af22
>>> --- /dev/null
>>> +++ b/tests/intel/xe_err_injection.h
>>> @@ -0,0 +1,31 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#ifndef XE_ERR_INJECTION_H
>>> +#define XE_ERR_INJECTION_H
>>> +
>>> +/* Steering Control Register (MC_PKT_CTRL) */
>>> +#define MC_PKT_CTRL_MGSR_3D_ADDRESS 0x00FD4
>>> +#define MC_PKT_CTRL_MGSR_3D_VALUE 0x80000000
>>
>> Start names with XE_. Also are we expecting other files to use this?
>> If not, move it to .c
> will update
>>
>> Thanks
>> Riana
>>
>>
>>> +
>>> +/* GT Uncorrectable worker command parity error injection */
>>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_ADDRESS 0xF310
>>> +#define WKR_FABRIC_ERR_INJ_GAMWALK_3D_VALUE 0x1
>>> +
>>> +#define POST_RECOVERY_WL 1
>>> +#define POST_ARMING_INJECTION_WL 0
>>> +
>>> +/* STEER_SEMAPHORE_MGSR_3D */
>>> +#define STEER_SEMAPHORE_MGSR_3D 0x00FD0
>>> +#define STEER_SEMAPHORE_MGSR_3D_VALUE 0x1
>>> +
>>> +/* Node types for error counters*/
>>> +#define NODE_ID_UNCORRECTABLE_ERROR 1
>>> +
>>> +/* Error types for error counter */
>>> +#define ERROR_ID_CORE_COMPUTE 1
>>> +
>>> +#endif /* XE_ERR_INJECTION_H */
>>> +
>>> diff --git a/tests/meson.build b/tests/meson.build
>>> index a62f447df..0f090dcee 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -292,6 +292,7 @@ intel_xe_progs = [
>>>       'xe_debugfs',
>>>       'xe_dma_buf_sync',
>>>       'xe_drm_fdinfo',
>>> +    'xe_err_injection',
>>>       'xe_eu_stall',
>>>       'xe_evict',
>>>       'xe_evict_ccs',
