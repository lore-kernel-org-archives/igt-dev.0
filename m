Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD017606A32C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l9Iw1cOG;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=m7qDytuT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7116210E176;
	Wed, 18 Nov 2026 17:53:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D148510EC7B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795024323; x=1826560323;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i/ThayN1Cbo02RUtwsuiRrT7bcE0e/aBfAEaPIaJ0Ho=;
 b=l9Iw1cOGVNlj43mXLvIqdqWDEqQ3z6Bxc8X/b4nLdX9WcbN1VdPIPUnc
 JwlaRR5LO7/wX8KS/8qJ0rHXjwFiG6q2Tcnv6EJOw/T4rETk9KL/aY01v
 bcvvCCgyEaj3piQlKQ56rF7zRbuosd8GkEzF0AAZQC+F6gCB4cKcv8Fpd
 qXuh7OPHsNwTDPxYnt8PsulrLlqrVlpu23M4M7XdfVOlP14WGKciWOfQA
 Uzae1h9JzgYSdg5y82DC1f3bqxkasPXEn3LbstmHP7Z4wTALrDxU3078u
 FxqG/KRjivTp+A9H6PsHQagUjLoLpJB92WTtQUwgCfR3ACaCUocAqYLS0 Q==;
X-CSE-ConnectionGUID: Wct0xBSkQkeI8A5WioAzyw==
X-CSE-MsgGUID: N1lLAyzxTtCGnc5RoKS7PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3891448"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3891448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:52:03 -0800
X-CSE-ConnectionGUID: QOOiQCN0Sk2zOfEEeHxVRA==
X-CSE-MsgGUID: 90YXdDQwRXqZo2U5i4m29w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10101186"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 09:52:03 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 09:52:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 09:52:01 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 09:52:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lj1MwkqgZoR2HVNEYW9vMXLKDr3CO3QO2EdffemyKlBGqS2LzScmIZEVyilUkRuLZWJzPZst1/Y1wCv04uc08coQTXfjkl6M6wfLNcXJM/WuL3fNNed9jQ3IJBbft/M3ZT5V22TYPxhXmg3wCJs42gP94tGrUH2C3AY9xCavin0Mi/wyV9Yo2GBZEybVC1/OzSBCJpJb3/Klxw/xjDQOaeYj06r1wXP7+xoLXjXaxT46wnG1D35dWhn82G92MB1+veoXfBVJi9NXmWg488fLN4gDP1NAoPVy3SKfn6/O/QdMVTBQ5PVVPZNWIBXzNeN4sCoJDT/riWX1bj/Xqlw2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPD0oLjc78VFm1uKwRJqeSIKipwMzy7jSAJTEbntELw=;
 b=r6vGfD66kGhu9UVNACcOSuazG+hgHQvpausW44JUBtQKv8V4DUbZ3EXrYcmmYnNL56Cg9Kbmi1EB9uo1zneHe9eNQSzk1I6561BsKqpYn9Z3UMl01eiFeN/asJeTQxRN4fUbjhEsVHpBcvcczRF+Lpklhaj+iqy8BNJ/N5NyTTvMQcIFbzl8pcdrun9prUr6XHOpokM+Ktx3p4o3fqI0kFmQSV4bJuJhbyUz/hPZR6ztwLLsUK3I/hip3UcF/TFeK1j4jyonLz2QWiC8LRpTLc516Ae0BWwrXUwvlGZO8B9K8b73IFgnn5B5cRcMp9hk4Se8zPgVDKGJ6PYYhArfkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPD0oLjc78VFm1uKwRJqeSIKipwMzy7jSAJTEbntELw=;
 b=m7qDytuT866DaIIGHR4oEK4NY8qxVxbpYJdellf+dXCfPjZSdUA+QdIOnY5vk/feFXPx0bzCaZxOhAsi21ybOgr9UbsLkG/hLrqlF9FCq2og5pXyd1OKC/s+EnvuJA+Hnv5KdkHLkBgYIPcscUCP6UgiTw3wsoQgFQg5D/wskmk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by IA1PR11MB9469.namprd11.prod.outlook.com (2603:10b6:208:5b1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 17:51:59 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 17:51:59 +0000
Message-ID: <c0860b29-f27e-43f2-b825-06600487ce92@intel.com>
Date: Wed, 18 Nov 2026 23:21:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] tests/xe_err_injection: add CPER trace event
 helpers
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <anshuman.gupta@intel.com>, <raag.jadav@intel.com>,
 <mallesh.koujalagi@intel.com>, <sk.anirban@intel.com>
References: <20261116145410.1649875-1-ravi.kishore.koppuravuri@intel.com>
 <20261116145410.1649875-3-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261116145410.1649875-3-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0364.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::14) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|IA1PR11MB9469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdc254a-ba53-44b4-6ea9-08df459ca4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|18002099003|6133799003|261009223027099003|22082099003|261021121427099003|11063799006|56012099006|261021135927099003|261028144727099003|261022075727099003|4143699003|261022105027099003|261022115727099003|261026140227099003|261021133027099003|261026121527099003|261026130827099003|261021123027099003|261021130227099003|261026135527099003|261022113327099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: h5KMlPp6GzH6wZ+etq604UIxKWFInHffQaZKaJp+ka/NZucLjQfjtWeBFPe69DgFoSNm+kz0TlOcCrFpD1buMsPNqYcQNKNtZ+eQ8Z7bq0SCN/x6a4ppw00ceKxBkYNNOGXJBDmQau3uvwvamrYrgXoYomEop9K3/6+KMs+IWoBcqXKGmy8MReXazCyPpzgrKEXZWF2DrK5OeJZ9AHWth0JtCk7uQEdyK4ZXf2bjQrEw+PkCJfgYl+CjRO2GuwEfyYoNOiLobzNNf81IzCl9dHFdAnH8yxf2sVviuFmHrpGc0NA8yjbqzgsZHUkB9/QYDI5zYYbJ18z+pxOM8ZdoWWwq7P2huoBs+LeLtW7o1b+5iKDkbWPDBWK0qO3oO8H/INMSfk5R7t1BcC8bIBz+/6MoxZD2U3T3EQpCeQTHg72CxHvH0vqZ+DVfNHcYapB2I69A4ZzaMABXaaSo5K8mtZpwSixId7bXqR9jfIyjihlNF0XMPm9+m12QkhdR9A7hbTG+2zgetE4OXsLQ1rv9bemFuYwtfTE4ub39qzzZNptnCffxwHuYj2iU6csbfzyNsHpW617EC+OhlNGUwXK9EdgtJsBU5TP1RRU+Z2s9xjBWRmEvIsTU2c5OBJAoaJA3Sjgxd8UzDIAblmKieMMKwntXlMxlkeO8oeTc0fU0q4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(18002099003)(6133799003)(261009223027099003)(22082099003)(261021121427099003)(11063799006)(56012099006)(261021135927099003)(261028144727099003)(261022075727099003)(4143699003)(261022105027099003)(261022115727099003)(261026140227099003)(261021133027099003)(261026121527099003)(261026130827099003)(261021123027099003)(261021130227099003)(261026135527099003)(261022113327099003)(10067099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCtya20rMEpIM2dQOGpUT0hYTU91clA1d1Zqc3p0YTc4K0UyQkZUVkVnSENT?=
 =?utf-8?B?NitkUTRUbHF4cVZIOU1JaTNNOEZTMlZNb0tRYnk0WWJFdzdxVzhJR25UZnJz?=
 =?utf-8?B?MUxrOUZ3RGRTSWN0eWhnVnRXTmpGV1ZPSTF0U3RrU1VzNXhVUFcvbkFTQmZw?=
 =?utf-8?B?SHByMGEzK0RrVzkxQTM0Ymcyamh5MGFzWVJobVpFcUFUNWVBRTZvWWJzRWFM?=
 =?utf-8?B?VzVrUFlGWHV0RVRZVHVKY25hZGtOcnB0TWxSODNYZ3hOeEpZYmZiWE85YzQ4?=
 =?utf-8?B?V2I2dVM2RVZEbklmVlpoRzBwa0dlN3R2QzdiVkh4R0ZzbTlTNEw0OGNvQjFt?=
 =?utf-8?B?aWlmbGZEaXBPMTFZQ3liREpFQVFHL1llc2FybDJ1UlY4R3ZrT1BVUnFybVYx?=
 =?utf-8?B?eDA2NE9OL0Y5UlA5ZXMwOVJJd0JGKzBDVmVRZ2Rmam5nNWI4Y2RaQ0FtdFhX?=
 =?utf-8?B?RjlqNEZvQXV4T1lGVnhldytEODVUUmhIL2FKTUN5QlorOGQxVWNnaGFFSGti?=
 =?utf-8?B?YnFvVzBiMWlsUGNCaFRGb3ZEZVdkRjA2MWdRTXVwRXNSMThzblZxQUxaaEJQ?=
 =?utf-8?B?eUlkcTVnN09Hc3VLc1FEd3kxaHhxa09oNzdEUnZzSHRqZHZNekhrSFRMYTRV?=
 =?utf-8?B?ZGZEMnUyeTg0REFjbllkbHcrK3ZCN1FUNDNxL2lkdFptSTZWZURUK0lkdEFT?=
 =?utf-8?B?WWVGMEhkVDUwUXZnWHVIelMyQnREUXhudDRuTEozZ1lMOWk5MmREOGVML1o1?=
 =?utf-8?B?UkRkcXpnamhOTVVXdW1WK0NiZ1JXVlozTTNOWU42VGI3U2NWOEZYcGVDRFFQ?=
 =?utf-8?B?OFNvY1pDOU5wWjVJVTB3TDM1NHF4QjNpbnV5dmUzQTBqVDAzTUdINlV4eWlZ?=
 =?utf-8?B?Nmt2b1RzWGIvUFVVNmRta2hnYXdpUHgxeTUydGVjNWxvOGEwZnlmYm5hQmlW?=
 =?utf-8?B?VEZVNVh2OGJGRktDaC9SaFQ3ZnNEZ2VhVnRFbnhONU00U0JNL0xxWVIvQ0xB?=
 =?utf-8?B?T0hJZTB5ZGNtc1BEOFduRExSVUdkaFgwdGREd3c0MnJRaEphRk5FSlg3TXhQ?=
 =?utf-8?B?ZzVVeDhwb29NNzlpMldHOHR4R1NzWE1LRGFJMlg5dCtXcmQrVzlvVTV5ZS9r?=
 =?utf-8?B?Tmw1Y2ZwakpwWi9jWVdheHZxbFdGcTVNWnBCNTdMTndWQ21vU25sKzNma1l6?=
 =?utf-8?B?em5ZRjNhcUlqRzNzL0dqVzFHbWRFTHFXWWVkeFZjcTVrdFZsNy8xQjhKRXh1?=
 =?utf-8?B?OFo3OXFIZHZxOStHVTRLaUlUM0dPajhxK1l5Q0RWcHlhd3hFMGxJTmNFeE82?=
 =?utf-8?B?RVhObDZoVnpZTjU3RElvRVhBRGhvN3ZDZ2R2QkdpekpZMTNnZHlLaDJEVExB?=
 =?utf-8?B?TzFZSVJWQzBUaXlySi80WE00bzFaTUV2bUF3VmxRblowRW4wK2hLbjhGYmdG?=
 =?utf-8?B?WTlvSkxVNEw0MldTbEk3aUdLWW5xTmdjcG1mRU53ZjhXV2psUlFkTTBzMGdq?=
 =?utf-8?B?eGtLVmNSZ3loamhpcjZ3YXZOUjROOVB1d1RwR20yaWZIeDVTSWFEc1FSMThm?=
 =?utf-8?B?aG9raTZHQUMzcDEyU2tiTEV6Y0Z0Ni8xR0Jqd2NuUGhtdlF0eE41YUdwSnZE?=
 =?utf-8?B?U3NLcVpCK3hzdGRRaGEyMGhnREhtaEk0eVBueS95NVVPYXFOMnk3L1hxenJ3?=
 =?utf-8?B?d2NTOUJUOFhBY0hZZDBTWGgrb0ppT1ZxcmxtOVVjc0V5SXFZYTBnbVJRcStm?=
 =?utf-8?B?d0hiWXpFQVI2alduTEt0UUZBR1ZpTXRLdzFnYkZIMzMyb0NGOWJhTWR4RVRD?=
 =?utf-8?B?allNQmxPaDdSTEY1Q096M05sRHY5b0ZoY3FKTkVad0hFemJ4bVBBc3RhWXJQ?=
 =?utf-8?B?V05rRnBJclUyeGF0K0VzYitTQStyeWpNYzV3TTh1d0FBenp1b3JjVlFJTHpN?=
 =?utf-8?B?MmU1TUpsZXd1cWltRGhTSU43ajVENlFXcitqNkVPMnFhNXRFR3E2bDFSdkdm?=
 =?utf-8?B?U1lKVjhvY3hpNWV0dTV5ZXFCdkpIdTc5Rk9MY09ha2lWb0c2Z2p5bE1OTTBQ?=
 =?utf-8?B?VGhvZ1VzOC90Z2tRVFQrWGMxSHROZFRFUlZyRCtPSFZZNkJsS0JrWmpEbS9O?=
 =?utf-8?B?YzZHVXl4akFjbDI0Q29QVVJLWnZBOG5EMTVUTEF4WGwzUFdBRWUwYXdOZE4x?=
 =?utf-8?B?dnoyemJoaFVhMkpRUEU0bUM1aHVHSzFFZmJiRWNLV3JLUUlra0NobjVsWC8z?=
 =?utf-8?B?Tkd3ZkhZTS9jSXA2c0NCYW91SFpacnVKOVErQk1UTzFWMENwRmFtNG5CUlZL?=
 =?utf-8?B?K0ZrQUhTc05HWk5OYlpjOFBQMXFSS0kyNFVNT21xZTBlamlJQ3ZrMzRORy8w?=
 =?utf-8?Q?ITy1xu3Tdkz6KMls=3D?=
X-Exchange-RoutingPolicyChecked: nR+os5EeExQwnY4p6Y24uKx6KcSnoVgm8FrGDP4a7TiFn2h6AKuPJDnW/gJChgY9vJ0HV+t1BvsGinUSRS5/tL4a+xcMoMBzd5BppNSvrq2AxT2K9OnfvuSmysmuCPAIygIprsIShfeSoYBqWa+hk7roOVkN4Kd8ihKUfONuxTgTNkigc+UOL9tOS3JWAn66c2Yr+jwRvzdrqAJWSwaq1JmULLqG5g/1rk1YsSi1cNS38glnSnhjawjbJVyLIRFhFzR942k5uEBltT8dIPB6H/zSCsO4ty+U1ecGwFxpWk4DnPhdtv9XQIIKz5r52PxKd5hMlT0G8vCczcaFa9LQwA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdc254a-ba53-44b4-6ea9-08df459ca4c7
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 17:51:59.2749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qNBTQtRKWxYfqoFrC9l71Q+kZqqDpk5lFe1BCSKZeNcBs1B0ZbxxxnJcUD/bXaVg+WbrUMcYtMLxFyP+LniE0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9469
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ravi,

On 16-11-2026 20:24, Ravi Kishore Koppuravuri wrote:
> Add tracefs helpers to read and inspect xe_error_cper events, including
> CPER event polling, field extraction, and little-endian hex value
> parsing.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v3:
>    - Separated get_error_counter() from wait_cper_event() to make tracing more modular
>    - Added start_cper_tracing() and stop_cper_tracing() helpers to manage CPER tracing lifecycle
> ---
>   tests/intel/xe_err_injection.c | 156 +++++++++++++++++++++++++++++++++
>   1 file changed, 156 insertions(+)
>
> diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
> index 6efe092c7..0b50effb3 100644
> --- a/tests/intel/xe_err_injection.c
> +++ b/tests/intel/xe_err_injection.c
> @@ -13,6 +13,7 @@
>    */
>   
>   #include <fcntl.h>
> +#include <limits.h>
NAME_MAX and PATH_MAX are already used by the earlier patch. Could this 
include be moved there so each patch builds on its own?
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> @@ -598,6 +599,161 @@ static void configure_cper_on_query_entry(int drm_fd, bool state)
>   	igt_info("%sabled: %s\n", state ? "en" : "dis", path);
>   }
>   
> +/**
> + * tracefs_read_trace - read the current trace buffer into a dynamically allocated buffer.
> + * Caller must free() the dynamic memory.
> + */
> +static char *tracefs_read_trace(void)
> +{
> +	int fd;
> +	char *buf;
> +	ssize_t n;
> +	size_t cap = 65536, used = 0;
> Inverted xmas tree. For the magic numbers use a macro. buf/n are too generic.
> +
> +	fd = open(TRACEFS_TRACE, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Cannot open trace file: %s\n", strerror(errno));
> +
> +	igt_info("Reading trace buffer: %s\n", TRACEFS_TRACE);
> +
> +	/* trace file size is not known ahead of time; read in chunks */
> +	buf = malloc(cap);
> +	igt_assert(buf);
> +
> +	while (1) {
> +		n = read(fd, buf + used, cap - used - 1);
> +		if (n <= 0)
A read error (n < 0) is treated the same as EOF. Could an error message 
with strerror(errno) be added to tell them apart ?
> +			break;
> +		used += n;
> +		if (used >= cap - 1) {
> +			cap *= 2;
> +			buf = realloc(buf, cap);
> +			igt_assert(buf);
fd and buf are leaked if an assert fires. Also use igt_assert_f() with a 
message , together with cleanup of both resources?
> +		}
> +	}
> +	buf[used] = '\0';
> +	close(fd);
> +	igt_info("Read %zu bytes from trace buffer\n", used);
> +	return buf;
> +}
> +
> +/**
> + * start_cper_tracing - enable the xe_error_cper trace event and the
> + * cper_on_query sysfs attribute, and clear the trace buffer. Must be
> + * called before query_error_counter() so the resulting CPER dump is captured.
> + */
> +static void start_cper_tracing(int drm_fd)
> +{
> +	configure_xe_cper_tracefs(true);
> +	configure_cper_on_query_entry(drm_fd, true);
If configure_cper_on_query_entry() asserts, does the trace event stays 
enabled? if so, it should be handled in the exit handler.
> +	tracefs_clear_trace();
> +}
> +
> +/**
> + * stop_cper_tracing - disable the cper_on_query sysfs attribute and the
> + * xe_error_cper trace event, and clear the trace buffer.
> + */
> +static void stop_cper_tracing(int drm_fd)
> +{
> +	configure_cper_on_query_entry(drm_fd, false);
> +	configure_xe_cper_tracefs(false);
> +	tracefs_clear_trace();
> +}
> +
> +/**
> + * wait_for_cper_event - wait up to CPER_EVENT_TIMEOUT_SEC for an
> + * xe_error_cper line to appear in the trace buffer. Caller must have
> + * already called start_cper_tracing() and get_counter().
> + * Returns a malloc'd copy of the matching trace line, or NULL.
> + * Caller must free()
> + */
> +static char *wait_for_cper_event(int drm_fd)
drm_fd is unused. Could the parameter be dropped?
> +{
> +	char *trace, *line, *match = NULL;
Could trace and line be renamed to trace_buf and trace_line as these are 
too generic.
> +	int elapsed = 0;
> +
> +	/* Poll the trace buffer until xe_error_cper appears or timeout */
> +	do {
> +		sleep(1);
> +		elapsed++;
> +		trace = tracefs_read_trace();
> +
> +		/* Walk lines looking for "xe_error_cper:" */
> +		for (line = strtok(trace, "\n"); line; line = strtok(NULL, "\n")) {
> +			if (strstr(line, "xe_error_cper:")) {
> +				match = strdup(line);
strdup() is not checked for NULL.
> +				break;
> +			}
> +		}
> +		free(trace);
> +	} while (!match && elapsed < CPER_EVENT_TIMEOUT_SEC);
Use igt_debug() for the timeout case.
> +
> +	return match;
> +}
> +
> +/**
> + * parse_cper_event_field - extract a "key=value" token from a trace line.
> + * Returns a pointer into a static buffer; valid until the next call.
Update the comment to state the "cper_raw" exception.
> + */
> +static const char *parse_cper_event_field(const char *line, const char *key)
> +{
> +	static char val[512];
Use a macro for this magic number. Would a warning be useful for the 
values longer than 512?
> +	const char *p;
The name val/p is too generic. what about  field_val/field_pos ?
> +	int klen;
Should it be size_t?
> +	size_t vlen;
> +
> +	klen = strlen(key);
> +	p = strstr(line, key);
A key can match inside another field name (e.g. cper in cper_len, dev in 
device etc.). Could the key be matched with a leading space and trailing =?
> +	if (!p)
> +		return NULL;
> +	p += klen;
> +	if (*p != '=')
> +		return NULL;
Both failures return NULL with no message, so the callers cannot tell 
"key missing" from "malformed". Use igt_debug().
> +	p++;
> +
> +	if (!strcmp(key, "cper_raw"))
> +		return p;
> +
> +	vlen = strcspn(p, " \t\n");
> +
> +	if (vlen >= sizeof(val))
> +		vlen = sizeof(val) - 1;
> +	memcpy(val, p, vlen);
> +	val[vlen] = '\0';
> +	return val;
> +}
> +
> +/**
> + * hexbuf_get_byte - read byte at 'offset' from a "xx xx xx ..." hex string.
> + */
> +static uint8_t hexbuf_get_byte(const char *hexstr, size_t offset)
> +{
> +	unsigned int b;
Too generic name.
> +	const char *p = hexstr;
> +	size_t i;
Inverted xmas tree.
> +
> +	for (i = 0; i <= offset; i++) {
> +		while (*p == ' ')
> +			p++;
> +		igt_assert_f(sscanf(p, "%02x", &b) == 1,
> +			     "Failed to parse hex byte %zu in '%s'\n", i, hexstr);
> +		p += 2;
> +	}
> +	return (uint8_t)b;
> +}
> +
> +/**
> + * hexbuf_get_u32le - read a 4-byte little-endian u32 starting at byte offset.
> + */
> +static uint32_t hexbuf_get_u32le(const char *hexstr, size_t offset)
The same concept is called cper_raw, hexstr and hexbuf in different 
places. Could one term be used consistently?
> +{
> +	uint32_t v = 0;
Too generic name.
> +	int i;
> +
> +	for (i = 0; i < 4; i++)
> +		v |= (uint32_t)hexbuf_get_byte(hexstr, offset + i) << (8 * i);
Seems like it is O(n) complexity per byte. So reading a whole record 
could take O(n*n).
A simpler alternative is to convert cper_raw into a uint8_t array once. 
All later reads then index the array directly.

Regards,
Soham
> +	return v;
> +}
> +
>   /**
>    * SUBTEST: cper-validate-tracefs-event
>    * Description: Verify that the xe_error_cper tracefs event exists under
