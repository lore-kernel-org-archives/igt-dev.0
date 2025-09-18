Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071B3CAC597
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 07:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA2510E3B8;
	Thu, 18 Sep 2025 07:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q4Enp7IY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0478310E3B8
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 07:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758182214; x=1789718214;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3f74Z93j+UwsbD6XSsYXa9EoKKX5nWuva1XsiHQnOxw=;
 b=Q4Enp7IYsv6vrDU8sssw5SBdrVYffKkebdzlkQA/8sp6twu8yrhr1YQx
 ffqr+5uXHGGxfsNhobimVB6GmHZ04wuz8+4qZQU0DnsPNAHmBBgykZeb9
 l5AWL08W+cbML9RbXlqdZJmV5DL/NeRcx8nTfd3vBet41MHofRnFeTyGn
 uT5aGJbkfu1QlRU8B5vd70d+7eGJ7RRYJQINDA2MqNOnieMZHtUc93ZxH
 jbXaz7Di4n6H6oHYDxkdboGrHisqR6klV9H6iHfGx0J8xU755Au2P95OQ
 mfirws1drjwDeOhWwz1Wby0ItlTtorpAB5y7knTpjyJf3xRelhApQuUf/ A==;
X-CSE-ConnectionGUID: IP2qy6o8QzCUkbMkUIO2KQ==
X-CSE-MsgGUID: JGPrFXG5RTi21CK7JQra2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="83099890"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="83099890"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:53:26 -0700
X-CSE-ConnectionGUID: EkHZm4RPSBOqKwDFjkL4TQ==
X-CSE-MsgGUID: ISRS3KuXQqWjV7OpDbI0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="174591587"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 00:53:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 00:53:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 00:53:25 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 00:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToKqQMdLZ10sKHcCEdsTh7v2sIr9eNE1DOZwMLdWm/xGNxHaVw+azCdtRBvnMyh6mv8Sd7PBn9pBompdmTPHHcgk6wX760xKGsnuueGnXF+Zp77gWFLBp9FIvutYI5ytxkhAIuZXmiinAu8XlSpDszo0GN2lbOhJ7iehMJguIZAF+JA5USeU4LigeBso0/74cUhUjAidNGV6TCVJRIFKVONhdBtzRp3U0787V968Rtuza5yjvqJuboKa0XZWb1JvdqGdpzf5louyABNqHi52xpXzxSF/rIswWMDpwaBO01NZGwElPQZpeKZkgjk0sVdPMKnKNUFPySumRBZ++mptiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xz/7wQ2Hv2OBEIZiTQ9FoVq0ESudOUMSaB8kF7ZGDWE=;
 b=iFflYDBF/9szZCAnnln92e4TsxUNBu2wwYMJqV7dRHYDW7m5/WvOtrkioporDd+WOXwqrFUsPmur+Z3O8fS7wNEItD2UQc8+mZbSREVfMhTdO3uj9CHpcVGfgrN3yJE9YS2dkc9dwlW4OHE0fSZV6yy9aMzcQOsuu22yoWyDe5ivo7s35aEh3p7DRGvwFDlZb43mVVWfGAdiiqfHpyXsIvX2tJCgtezCg1k03Ewm0/NMJi0aJkJh4bSNkAqxwzDdvDAxk5RmhW4nvvCtl+CJg+9Eklk28Po8ilZrtetJZW0i8A2hcQBXWHWhfSLogI7XovA/iLEO5bRdoumOzgl55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DM4PR11MB6262.namprd11.prod.outlook.com (2603:10b6:8:a7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 18 Sep
 2025 07:53:23 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%5]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 07:53:23 +0000
Message-ID: <10e75988-addc-4cf2-8709-1690c0714411@intel.com>
Date: Thu, 18 Sep 2025 13:23:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_pm: Test to validate vram-sr
 through Mods during host s2idle
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>
CC: <riana.tauro@intel.com>, <lucas.demarchi@intel.com>
References: <20250917130323.3560097-1-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250917130323.3560097-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::28) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DM4PR11MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcb7178-bd89-4960-5166-08ddf68870ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3phTGRhbElSYUo3aG45ZmE3YStpODNiMzNzaWVPU1NtaHhmNjlQejl3RmpM?=
 =?utf-8?B?Rjl1R2NrSUp1L2FGTFFnOVl6SDFULzRZOUErWmhyZUJ4eUNDWElHa0FyS2R2?=
 =?utf-8?B?WXljUUdvalJxVHBZOVRoN1Q4Y1VUQmhQRmFVdnZYUHcrVmI4NzVwRWpuTlFo?=
 =?utf-8?B?R0s5eXBibXF3VW0yeFdSa0I5M3NTdm5udHllSng3UFpQcDBRK0FDRHY5NG42?=
 =?utf-8?B?NnozMDNOUXI3d0Q1T01wTGp6ckpGbExITmh2UU9oaWVjKzZEaTkyLzNXNlhK?=
 =?utf-8?B?TGIxNFpDV2JxbWlUTUN4aThuUjVGb29MZ0gxT3NremxuV1VMOVdZM1VNRytO?=
 =?utf-8?B?ZG53Njd5b0tKRHZwZDh2T3VsSGNvcDYyQjNHNmZSdmtkYkVWWEs0VDEzNlJw?=
 =?utf-8?B?TEVzWmpBK0JFalBEeFJlc2FBZ1F1d3RJakEvSUNHRFRWckUwZHdqT3VHVmZI?=
 =?utf-8?B?VURYVW1sWDZteEgzTnhZLzhJUTB3MlNUbmhGKzJCMEM3YUwreEp1dE1nemZC?=
 =?utf-8?B?NUFROFhXTERMMEp5azJlSW5OZXBUWTdIaVRoQnZaUmM4SXBvSFVVVnpJdE5h?=
 =?utf-8?B?Vm1vUjNZZFVoNmJZMnpGaFRZYXBKMUl2UHFVRlBOZEF4OWR0Ti82Y2w1TGti?=
 =?utf-8?B?dnFsOGZydldSSWtac21TMGJsS0pOVVRLM0V4K2UrYjd1L3diSlJwTStDaXdY?=
 =?utf-8?B?d2dqbVlkWFVNNFVKazlwYzFudlVnb0doMUsydDNtUm5EanIrQTdVamhQbUhn?=
 =?utf-8?B?OVpTUjluTEpXMkJhUSs4K0VHdGZ4SkdFY0VjY3ZYbFl3ZzQzL3B1akVtbW41?=
 =?utf-8?B?OG5UNVJMZ2xWdW1xNDhPUUZMMWovaXpWVlZqaWp6aGxyUHBCc283WFdoQnpL?=
 =?utf-8?B?OXFtVk1vY1FWbTladEJBdHVaNEtYUXNBQUEyRDFLcXlLK2VydkR3SVFSQ0N6?=
 =?utf-8?B?TW1NWlE2UEpkVlllZFVOR1JtQ3VrMUNUdThuYmNia0xOSmk3RFFrMk9ud2hl?=
 =?utf-8?B?OXdjWkJsTFZNY29aMHpLOGNMT1RubXFOOUI5OVNDNlhCZnVMSzdnZ0lWOWVW?=
 =?utf-8?B?eHpQNlh6d3prUXFEUlFUeEJVaFByeTI3WUdsYjdaMS9yRHRPbVE0WnRGaWM0?=
 =?utf-8?B?R1pWbW96MzRKNkFHNTVaL3F6NFdyS0xhV3RyKzMyZjJJbjAzQzNJQXVON1ly?=
 =?utf-8?B?QXBrZFFKb2pobFZaSmZJWlhPNEVhMCtWdFZVUnVrbG91L2dudVZwaTRhRHJG?=
 =?utf-8?B?Q0NFaHROZmJGVjdSRDdNc0k4WTFkT0lBd0h1Ny9PdWgwWDhucE5wSmxOb0Np?=
 =?utf-8?B?VXpXQ09lams1R3luUldRVmpWQi9DWk1VWk8xL1lLQjVka0xOa2VScXA5aHhO?=
 =?utf-8?B?eWljYUpFeDgzcDBtUXUrbjlwN2JFUDVublRGd3hUT3BiYlZHT2xKMWZodnBZ?=
 =?utf-8?B?bm5VSmpFb0oxQ1hKaUZ1V2E1RE80cTFOZUpMRjY4eDJtaXhnOWhPb3duRDhC?=
 =?utf-8?B?S2owQW1SUUdicVlRdmFqeEZXUDNvdEd1OERmVEtzSk5nZ29Ec1dCK0tZbWgw?=
 =?utf-8?B?UWhlNzk4QU1hNlNqQXdzMnloWXdvQ1FJR3E1RjRwVFRMeUVteS83dVhJZDdY?=
 =?utf-8?B?U0l4RmNjM0V3dG9lQnJoNU9ib0NUL3BFL3Vsc3NibnlvMWtyNldNaWIrQWM0?=
 =?utf-8?B?UE9pajVBM0FQUk5saWRYTWV6c0cxa0RVZ01XWVFkUjkzV2xlekRGd0szTDl5?=
 =?utf-8?B?WHlrNlFIU1oxbjYwdTZrWDNhVCtLR0J4UUpHK1JIRkFFOWplUHJNdEk3a0w0?=
 =?utf-8?B?ZjFnMUlqQjBIV1dHK3dON3NIMWlqMW5VOVF3RHNvcGsrWEl1NTJwSUlheG43?=
 =?utf-8?B?UFRoc1pFenpEQ0JmMkRoOUg3d1VnKzhZVEdiSklVY2wrbUF3c0NJMHZ6Sk1M?=
 =?utf-8?Q?2fTQoltMvM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUhVYkQ2M1A1QWFTSmV2RmZubGJPb2E4UWwzUGtnK3E2Z1ZiK1drMGp5Szg2?=
 =?utf-8?B?WmpZYys2MDFTRm44RmtmRzVMQ1Fyck9neE9sV0M5cWR4NnlUZWJ3TWFYZUJJ?=
 =?utf-8?B?Y3VOU0wxSnNjM3lDVjZvbTZRbEhuNWpVb2lLc0VvS2JtMlV1L0xLWTd4VEVk?=
 =?utf-8?B?RXZaaFhCeFBGc245cDBNTTJ2ZjBRSzNQUWhiYTJkekgrTWNScURxWVdiVU9q?=
 =?utf-8?B?OXE3U093TjZmSDBKNFYyZW8vOVdNSTN4RTNKMWhuNzZBeUxXbE9obm9FN0Vv?=
 =?utf-8?B?YzhCU3g3UUw4NERUT2F0WStqVWpEV0p5dVJZWWtnTlVmT283eUpkVWJaVEVo?=
 =?utf-8?B?SldvZmtzRDEwMVBuNk5LSjVCQm5WYjBDaVY1TkZMUkcxZ2lmR3FVRXk3NUpJ?=
 =?utf-8?B?ZFEvelh3MTBzdXA5d3QyNWZXSnZ6Mms0VGtrS1E2QWpjcGRoVTVubUpMVld3?=
 =?utf-8?B?elkyVEZlWk9FaDlzaGh2ZXR3OWo2cjVaZ3A5NW9Wem55a1FwVi9PcTJVZjU3?=
 =?utf-8?B?QXFseFdhNFlIdHZabHU4ZXhrZGI3Mml5L0wvQnBzZzIyUDNxQWVDcHdNbDZw?=
 =?utf-8?B?WEoxcFhGRFRBSlVzOXBZU2tFczNLU1QzbFFUbnFFak1yUzhVWUl1NUF2Z2ZR?=
 =?utf-8?B?MzlsZnNHVTdVcExmSmZiU3hpVTJCSVNqMEdqUzl1cjJ3QVVtdkFIVkxLZFRC?=
 =?utf-8?B?NDdWZEgxS20xM0lRV1VzY2VCaDZCb0NpeDdxVU1tT1kyQW1TSFlEK0NkQ2Ru?=
 =?utf-8?B?Z3RpVlRoNTlibnB4SmZMVyszNUd0S3VqdXpxMWpsT0h6bGJMYzJVS0hDZi96?=
 =?utf-8?B?L0xJQ2JDbG1DdFgwSTArTER6R3c1bTdJTnpRdTN5aW5qS0FBY1hKVVRScFlD?=
 =?utf-8?B?YURLUU8xQWp4UUIyNlhxMVk3TWxPU1o3amtRNzlKMmRsdGdZb2FNSjJXWHlz?=
 =?utf-8?B?L1RsbjI4ZjlkTUNmY3N4R2F2djZxVnlEWVhvd3h0cE1YczZZM2lkTnlsMm5X?=
 =?utf-8?B?OVNrZnZJNXJUQldwNWQxcE5BU3VWVVlBU0dzbk56VWJLYkZWOXpHSkpGVStG?=
 =?utf-8?B?eFB2VXBibU5hcXpuUmRzQUJsN0pHRWFCeDdwNUZZWkVMZEFtWXFQRGFLdC8v?=
 =?utf-8?B?TGQxa1d3K1FMQ245Z1BXRFNiMmNlSGVNZmQyUG1TZVJyOFR4bTdhdHNkVnpG?=
 =?utf-8?B?enRzMXRtYkcxVThYRFlrQkFhZ2pzaFpzWXFINXdlVXMzd0tBcHVvMDFSNjhz?=
 =?utf-8?B?cDM3eXVuZ3pnNFdWaWoxWm9Cb3Y1dGdHOGN6TS9NbWUranc0RnRGNStDeith?=
 =?utf-8?B?Z0xUOE9aNTIvdk1VMjdudmUwTzBxalZqcFlkY2Q3YkZhYlNvRWE2K1RFT2dD?=
 =?utf-8?B?bGN2b1BvRTRXbzgvdk1HRHE5Z3kwSzhKNDlYNDZoVGpCT2NjK05IdkJrdXBE?=
 =?utf-8?B?ZTYwaUt5QkxLTkxDZjVaekdnVzlLZUE5aHowbzI0YUYvck0zdDhmL2h0RkxW?=
 =?utf-8?B?dUNIUzRBeE1mQVpULy8rQlhlRmpwcUR6b2xKSnA1RVRuZjk1c29IWjMvbnd5?=
 =?utf-8?B?TzJvL0g1QzNoSXAwb1lvS0ZtZEhPaEVNSFZvWVhYbzN5aGRnRFlTUnY5WWR4?=
 =?utf-8?B?YVZMVW1hRmk4Q3VsamNFUjg0bTUrZE55T2laM01wZDhNc09Oa1ZGaDh6Rm01?=
 =?utf-8?B?WXQzQlh3REhKMGtTWjdYK21mUzR5bXpScHNSQXF2SFlYcHRHemlPQ0I5czNH?=
 =?utf-8?B?UHlPQk1qdWRNUVlCNWdKZWMwNzJnRys3OHNMdjZKWGcvc2dVWTA5UlZkU2NB?=
 =?utf-8?B?aGEwVHRJbHVxWjhVOEpoWjZ5UzBQTXF6a0ZxM1VOS1R1RDdONUxHdy9YUUQ5?=
 =?utf-8?B?eWhPL1M5UkVGdEFRTCt4QVVJT1NTM0t6eDNHYXM1T0NkTzZuVnFWc2RjWHhO?=
 =?utf-8?B?UHV0NGpkdjJEQmFsa2daRlI4TmREa2ZYWDczSy8xMS9iZ0dhTm9NbjYrRzBx?=
 =?utf-8?B?eHZ6Sm9oRXhMSitTZ2tjbnV6RG0rYUlsRXAvaC9vbTg3Y3JIelpia3RVK3gx?=
 =?utf-8?B?UTg3RmFITGhCVUdaUHIyRlp2ajArWm9rU3hyTndmelBwQm9sV2NubnJxUktl?=
 =?utf-8?Q?2KUu6j3J5NR2e6NePJXMEU+5t?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bcb7178-bd89-4960-5166-08ddf68870ec
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 07:53:23.1171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BbydQ550Z861+DmgnMNWjUJcWPUtXtnFqoI4a7N5u4o6K9pzEPujwJYZxZR0VEA/Gaj+68UdgUn9d6tAIy2IBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6262
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

Hi Soham,

On 17-09-2025 18:33, Soham Purkait wrote:
> Add test to validate vram-sr through Mods during host s2idle. It checks
> whether vram self refresh capability is supported through debugfs node and
> then introduce host s2idle to check ModS residency to confirm vram self
> refresh capability upon success.
>
> v1:
>   - Define macros at the top. (Anirban)
> v2:
>   - gtidle no longer exists. (Anirban)
>   - Skip test if the system is not VRSR-capable. (Anirban)
>   - Release bo to avoid resource leaking. (Anirban)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pm.c | 105 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 1db28a899..9b51ca7e2 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -10,10 +10,12 @@
>    * Sub-category: Suspend-resume tests
>    * Test category: functionality test
>    */
> +#include <ctype.h>
>   
>   #include <dirent.h>
>   #include <limits.h>
>   #include <fcntl.h>
> +#include <stddef.h>
>   #include <string.h>
>   #include <sys/ioctl.h>
>   
> @@ -48,6 +50,9 @@
>   #define I2C_AMC_ADDR	0x40
>   #define I2C_AMC_REG	0x00
>   
> +#define XE_BO_SIZE (350 * 1024 * 1024)
> +#define MODS_PREFIX "ModS"
> +
>   enum mem_op {
>   	READ,
>   	WRITE,
> @@ -55,6 +60,7 @@ enum mem_op {
>   
>   typedef struct {
>   	int fd_xe;
> +	int debugfs_dir;
>   	struct pci_device *pci_xe;
>   	struct pci_device *pci_root;
>   	char pci_slot_name[NAME_MAX];
> @@ -423,6 +429,46 @@ child_exec(void *arguments)
>   	return NULL;
>   }
>   
> +static char *read_content_line(const char *content, const char *prefix)
> +{
> +	const char *line_start = content;
> +	char line[1024];
> +	char *result;
> +	size_t len;
> +
> +	while (*line_start) {
> +		const char *line_end = strchr(line_start, '\n');
> +		size_t line_len = line_end ? (size_t)(line_end - line_start) : strlen(line_start);
> +
> +		if (line_len >= sizeof(line))
> +			line_len = sizeof(line) - 1;
> +
> +		memcpy(line, line_start, line_len);
> +		line[line_len] = '\0';
> +
> +		if (strstr(line, prefix)) {
> +			char *colon = strchr(line, ':');
> +
> +			if (colon) {
> +				colon++;
> +				while (isspace((unsigned char)*colon))
> +					colon++;
> +
> +				result = strdup(colon);
> +				len = strlen(result);
> +				if (len > 0 && result[len - 1] == '\n')
> +					result[len - 1] = '\0';
> +
> +				return result;
> +			}
> +		}
> +		line_start = line_end ? line_end + 1 : NULL;
> +		if (!line_start)
> +			break;
> +	}
> +	return NULL;
> +}
> +
>   /**
>    * SUBTEST: %s-basic
>    * Description: test CPU/GPU in and out of s/d state from %arg[1]
> @@ -871,6 +917,57 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
>   	close(i2c_fd);
>   }
>   
> +/**
> + * SUBTEST: vrsr-capability-during-host-s2idle
> + * Functionality: pm - vram-sr
> + * Description: Test to validate vram self refresh through
> + * ModS residency counter during host s2idle
> + */
> +static void test_vrsr_capability_during_host_s2idle(device_t device)
> +{
> +	u32 bo, placement;
> +	u64 s2idle_start_mods, s2idle_end_mods;
> +	int ret;
> +	char buf[4096] = {0};
> +	char *result;
> +	void *map;
> +
> +	ret = igt_debugfs_simple_read(device.debugfs_dir, "vrsr_capable", buf, sizeof(buf));
> +	igt_skip_on_f(ret < 0, "vrsr_capable node is not present in debugfs.\n");
> +	igt_skip_on_f(!strstr(buf, "true"), "VRSR capability is not supported.\n");
The debugfs has been changed to "Y" instead of true. Please check recent 
VRSR patches from Badal for more info.

Thanks,
Anirban
> +
> +	placement = vram_memory(device.fd_xe, 0);
> +	bo = xe_bo_create(device.fd_xe, 0, XE_BO_SIZE, placement, 0);
> +	map = xe_bo_map(device.fd_xe, bo, XE_BO_SIZE);
> +	memset(map, 0, XE_BO_SIZE);
> +
> +	ret = igt_debugfs_simple_read(device.debugfs_dir, "dgfx_pkg_residencies",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read dgfx_pkg_residencies.\n");
> +
> +	result = read_content_line(buf, MODS_PREFIX);
> +	igt_assert(result);
> +	s2idle_start_mods = (uint64_t)strtoull(result, NULL, 10);
> +	free(result);
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
> +	munmap(map, XE_BO_SIZE);
> +	memset(buf, 0, sizeof(buf));
> +
> +	ret = igt_debugfs_simple_read(device.debugfs_dir, "dgfx_pkg_residencies",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "cannot read dgfx_pkg_residencies.\n");
> +
> +	result = read_content_line(buf, MODS_PREFIX);
> +	igt_assert(result);
> +	s2idle_end_mods = (uint64_t)strtoull(result, NULL, 10);
> +	free(result);
> +
> +	gem_close(device.fd_xe, bo);
> +
> +	igt_assert(s2idle_start_mods != s2idle_end_mods);
> +}
> +
>   igt_main
>   {
>   	device_t device;
> @@ -908,6 +1005,8 @@ igt_main
>   	igt_fixture {
>   		memset(&device, 0, sizeof(device));
>   		device.fd_xe = drm_open_driver(DRIVER_XE);
> +		device.debugfs_dir = igt_debugfs_dir(device.fd_xe);
> +		igt_assert(device.debugfs_dir >= 0);
>   		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
>   		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
>   		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
> @@ -1052,12 +1151,18 @@ igt_main
>   		test_vram_d3cold_threshold(device, sysfs_fd);
>   	}
>   
> +	igt_describe("Validate VRAM self refresh capability during host s2idle");
> +	igt_subtest("vrsr-capability-during-host-s2idle") {
> +		test_vrsr_capability_during_host_s2idle(device);
> +	}
> +
>   	igt_fixture {
>   		close(sysfs_fd);
>   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
>   		if (has_runtime_pm)
>   			igt_restore_runtime_pm();
>   		drmModeFreeResources(device.res);
> +		close(device.debugfs_dir);
>   		drm_close_driver(device.fd_xe);
>   	}
>   }

