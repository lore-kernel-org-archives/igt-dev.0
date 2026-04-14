Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 203CCF9D0F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 19:28:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B80B388668;
	Tue, 14 Apr 2026 19:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lswd0T3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4026D88668
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 19:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776194880; x=1807730880;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=t40bE+XriuI0Hry706IhrxxpCDnnTDAJ3Utsb6Ba6Rk=;
 b=lswd0T3Dpwh0Bj8WlwDMXsMTuUvB8z558+CN2DYJOhKYVblOM999bUvt
 0E2EuEhHl2VXTP2GSqfxabFZxApzfDTtqq9G/LQzgYGiHglryfvEtqckx
 6xkCT3emLsmR3BIFU0+s4C52lcG79Gr4jvMvS+uQr1+9WQzggYBOg6xv1
 FqWzsPDA3zOilOvkUFTU3dpLFOmqoNvECDsSQWS6PhhmHFWpy0tY/qrX2
 k7CVyUGyq+UQnRhS8FGUoViw1A/4BtYVumoZNc83AOqTZrCr83t1S/a/W
 9MMMIFpd8Nj51BVK+MtKRtKL2J2KijClebhOCo9RyjkQJ3mDldjBr3T7/ Q==;
X-CSE-ConnectionGUID: Sj1ikounR7+EinnHQ8DGzQ==
X-CSE-MsgGUID: eV4cHt39TfSkiERiVnLrOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="87471666"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="87471666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:27:59 -0700
X-CSE-ConnectionGUID: TWbHVxLLSRiaKx7JX0x19Q==
X-CSE-MsgGUID: ivDWMK/GRqSFIrkDwXq3jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225890440"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 12:27:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 12:27:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 12:27:59 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.0) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 12:27:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/Nsn1Ta2iOj6/wXUivUDBU/L/R6RO+5BJNPcsNk/3a7Oc35EghnYIvQxYNdguC7YY2/VlwB1jhZqubpp7DHgsh4mnSgChL8kBjKo1bKJIzT9OjENOXcD9fHn5/DkcuiwwsEQkrm/weai6+2k49GzwNapb/jqKf3Yhl3AEcPkjcEbchQDhk534XgK5HHQ7Gqdh4D7YQWvtg79LADmDSXQBdI09vEtBzGTViZgUupGf5XpfrSDsWMdoyqUBD+ZsuD2y74nyqZqtKvm684CWLKSxb90xdoDtp758+714wbGKLmYdwPZNA/L7gD4kCnwioV8XNjiew+O5oqwotVD3bvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5Bpfl8WPCwlB0/pog11jKPFZ3Vk51jdmtwJaOFx1PY=;
 b=HQ0Aw02NmeimCqvnHEG3hZrSsm8VjOVPPvlAvUJMYLnWAVbT1Wp3DePA+TxeQK56r19aLHDj/UQ9sE2xK9GG83/OwgbtGBjRntBTLio8SSAhzoZ0WAMUoiFNmFDWBrV0BDxKzSKSG5u6Yj7o+keyRJG+MA8p8b0bLEMEc7s6JnXnf9FecnKR0625whfkT3QhPAO0StPi88XPevgzEYvwCCaOXVpVPTe1FUU+/VujaF30hAI5mXYWGByF9AOpEzE96PulDx90KFVI8gPMgxyAjJWdHXU35aax4ymiKRyuErcvjOQvO2XaPgBOCaMb6PJwh9tVIqN7BbpjSo0L0M6AzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 19:27:53 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 19:27:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH i-g-t v3 2/5] runner: Create attachments directory to
 use by hooks
In-Reply-To: <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-9-zbigniew.kempczynski@intel.com>
Date: Tue, 14 Apr 2026 16:27:48 -0300
Message-ID: <87jyu9wde3.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DM4PR11MB8204:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c353d9-7591-4fc0-5bd6-08de9a5bec5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: nqx5ouMkk3sgiIQ/lJyuIpCHQXmiJkkaVppr0MmcvYl5WEJyyzWUe7a8Etl7SXOQ/8j0nWiNrZDN7L4AwwsMqh+uFLPjTnuE6I1jhUbCafdfC651rRrkDZwtBX02+NwK6ah81kegBkqsJv4ETJl9NWIXP2zBFmQEu9Oy9FgxDKQSLY0phoM4pXJFZ7wofrRsI7dhRT5364jBKwgKzzzS/DUuvBcaX4vP9m+UpEPA8MCqEme7UHEVRf+w37bhC8YcM8+bDu609kH1BHk74/LbAY9muXzkCxvfJ90nHOtPLW54NYfW+pToMZryRO83xCr1lmwuzhSHcJr00jvaoIPdBJFhegy/l80LrLy4ydZg9KWPJMZmnIw1TEfouohSNSMP1YOFnwEhB+Lp/oGoXpteZyyJgf/SZdyQ/vFg4H8OV/SgXIiq9I8q38fuwKl45w1/ZvHg1RMXSc1w6tsBp0Z9x/6vLRqrFcnyfMVP1vmsEsC/UdI80zTjlcaqW25H8uJV6Q1unU4ydAUvx21ce/Fgyi2wFIx0IN8WNzB2L+jizt0KMiiAAfvKwX2xDb8m7U6OGLsehODloih3qAC2N1GIOWFC4dOP2fHzRckjmpIIpuqrVZuS/RzLALQo/ZN2Na6YpcD2NyLisd39lBRTC61TWBoC4/h/ABanhQV2u9MBk2So28BCtcH3RrED6rqqBQwTicqHj6nkk2imkgf2zsClPNe+MIQg/Nd5Q0k8CEQ8q40=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1ZYNFNDdmFWei9Td1psa0tHL3hEdCtORUk3VlNwdEF4ZW8xOTZTU2w2K3VH?=
 =?utf-8?B?QUFlZi9HNnRTcldXbUU3dkFZUUlieE1HVm5pWVI0WFpJM2dnbFJPS1Roa2Ry?=
 =?utf-8?B?bWFOY2NrcHhzZFRranhYcVcreUFpbXFTQjZvTmhrcHBHR2tUMVEyWDQ2VU9F?=
 =?utf-8?B?Qnd3MDVPRml2T2Jlc0pzWHNkdXdvbGJ3UjBoR0ZvR1VLRXFGVE5JMkFWZ24x?=
 =?utf-8?B?YnFERHFXYnNWVFZLOXVDUlU5NzQ1NGF0SGlENkRxM25kOFpkSE1KRkM0cW9k?=
 =?utf-8?B?ZHkxeE85dEZWM3NjeDEwdHhaVmVNY3BMcjV3QmRROTl0RHk5Q25GczMrRUc2?=
 =?utf-8?B?U3RTQ3hPNnZUZ00vQUJLcU9yamlGQWZ5eUd2VHFYK1F2UWdaRklrcEpsbHEr?=
 =?utf-8?B?TUptMGdJQkxtdEsvclZFU284SitweGc5WG5UUDQ3dUtsbndJRzkycnpJY0s5?=
 =?utf-8?B?U3AwZkR5RFQ5YitxeklCQTBMTC9zWjNWdkZnWmdUZ2R1elRHZ1IwR0hxTUV6?=
 =?utf-8?B?V3FPUlA5VHZtQUtWUEt2a3YrUm9MTXNKNlFkYVZaZFFNdWRxWmR5c2MreVlM?=
 =?utf-8?B?eS9FQUVaenBNMlVWMFZqSGJnWVArSkt0b2RLSmdGeFp0RHJXK1FJVmVlZE93?=
 =?utf-8?B?bHJ4YVh1ZXlId2YxcEtkc2RRbElVYThzU1ZXUkJVS2tVZGtHR0xqWHJhSU52?=
 =?utf-8?B?VFBPRGs0cXZncGd1STdrcHowaTJaNWRXYVF3WXlYdXkyUU1PUXBKMk9tN2Vq?=
 =?utf-8?B?Rll5QlhSaWhOZ3JpeGJ0ZEhKREVDeThWUDR2aVBrMTQzcFpoY0luSHd0Vzlm?=
 =?utf-8?B?UEx2UHNkTnNQTnNVaExyN1BnWk5YL2pWQ2UyUW5uZjhpakxuSU1Ka3BRZUt3?=
 =?utf-8?B?clVkOHJ3UHRHR09qbWNoY29JU2x0Z1ZLNGplQVJ0Y2xzd2tTdmV5eWV1M2RS?=
 =?utf-8?B?ckpHbjROcmVZU2dtQ0c0eE1EK0xkWldjVFpwTVRtMkNIcURLN3JoR29HTnNE?=
 =?utf-8?B?MTlZbFZwaVFGdk5SOFNQK0duRC9heXZ2NDdWTEsvRVlFOVoydEs4cGNMaFJw?=
 =?utf-8?B?cG4wNWdiQnlkZ0hlaDV1NWJ0aHMrMFI0SXI2V21nc1BYVGRZNEtjSUg4NndN?=
 =?utf-8?B?Y3ZjSXk2bEI5TFJ3ZDMyK05NbHM1bDBzYUE1MTlrcXU4cWxJSkt1NUgyM2pt?=
 =?utf-8?B?elVqaWVHWTBiYWlWWXFwMjZheW9FS3pERnFEZlZmNGJVcXdGMGYydUxnalVl?=
 =?utf-8?B?M1R2SDgwMmdtTFhTemNKTlc5TUhXb3EzRlVIMTBQYUk4UkFOdk9wUmhBYURi?=
 =?utf-8?B?aWtxZmhUTGo3b1VjaCtQb2RXRVF6azN5SnVreWhYc1NQU1gwbmtNS3E1R3VP?=
 =?utf-8?B?Zm8ySGxUT1J1NW1UeUlPVndUMUNneVlzUFRXWGdUbmN2WXB2YnQzNjQ5UzBs?=
 =?utf-8?B?WGxkQmJGVDFQVDEwT0JJdHZaSU9lNTE3NjQ2cWkrejY2Q1gvcUZVUlBRVHlT?=
 =?utf-8?B?REJTZC9LV1JQeWo1bExIVHlkVmNkRTBxQ0tUcmdGUjZrMVFFOStGa0ROVEt4?=
 =?utf-8?B?b0JJcFFiekZlZXFlVnV4WFduNE1KWGx5SXEwUHZSNXVyS2ZKWlZFbnk4em9y?=
 =?utf-8?B?NWJwVnAvSEJHbmd2UUNIVldzc0E5Y2RwelVrdFplUGJ3LzFsU3BST3dNWCtH?=
 =?utf-8?B?OWR2QUZObUhaQnpDUXVKZk9jL2hNd1laTXg0YUhOS0hQV1p5RVdpYWRmeWlR?=
 =?utf-8?B?aG12WkpFR0UvUE9Cd1AxckgxTUI1Ulhab2F0NEFsTDQ1TVZxaWZobHljY00y?=
 =?utf-8?B?ZmdyTVFZeUhPajlxNUlHN2kyOTRpMEUvSklFbGFwVFJOQkM2aUE5VWxZUTYv?=
 =?utf-8?B?VUhKNml5Vk9WL1RBZUtsVEhQdElEbDM4c0MwU0NONnJ6am9VM09rR3c0QzZB?=
 =?utf-8?B?aU1Rd2Q4bjc2em9HcHF5M0NPMjcvVDdJWUR3RGpEeWV4S1dIbW5OdzkxTjFM?=
 =?utf-8?B?NkNIQVBHOXFsVXpTWktMTkc0YVB3V054TUtOc0swdWdMQUc5c3N6VlltT2ky?=
 =?utf-8?B?SVlkdUxPbzdFVFRwbTd0cFFCWTZXVDc2WFc4QU5NUVFldXBqSENJRUZkS3Bt?=
 =?utf-8?B?YVhkaUhFWW1qNVRKWFVBeVhBWWliVDRqLzl3bzdidlJEWlZpSG9UcmFLb0Jk?=
 =?utf-8?B?Sm1YSnVpNEhhejdBakdUVnF1c3d1UzZpakJyamN3dlhnS0t3cDF1T0pyajk3?=
 =?utf-8?B?UGRkRFRZOHdDZ3o1aWI3MjBNcWJSeno2akZqVVR5Y0tSaXlpbDc4VmNQVkNa?=
 =?utf-8?B?OW96bU1rZ2ZIdkUrbmZzQ2w5N3FHcnpCWG4yTytYOUNaV01UcWRGUT09?=
X-Exchange-RoutingPolicyChecked: RWDGDNMQfuZJ3AuNCnt9cyQ0NtuhRXwceHltXwv2yhPLCYoaRIIKmNzfwJFHfUW5dRJJgU6RyaCEgOUeFqEZdlUk/22gncGajMNRbYaYc1VF8zrqoRekQCguj8fKDX2P1n5aII3zZyRX9hQjwJnGJ1i6z7GBzrPa3JejUEE/rCg7slOHg1o8skSXTgbY432wm+9UDMsBZRSnqRoIVSRWF+0OA5fOwisgQxsOZehLSCJ6LI/WKdb/3a2WvJ1XzDfL5AaF18goXT92mxFIiUeKZ/FcsFcH7lDI9TyYj5xOh9bvxrDyYRRZpxW+bh5tDMaw7wfS9xhdyP6jXUal8tmSAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c353d9-7591-4fc0-5bd6-08de9a5bec5c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 19:27:53.2402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l9gNb85nz5o/enrvQ1YUQMG7JlNP7gwWNZoJ3a+7ukOsVZxGg/CWFDwoVEz3tKpkqXQ7qnUXXowc2OXxD8QRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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

Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> writes:

> Results parsing is currently limited to few predefined files.
>
> Create "attachments" directory and export full path of created directory
> to be used within hooks. From now on environment variable
> IGT_RUNNER_ATTACHMENTS_DIR become visible when igt_runner is used
> to execute tests. This env contains directory where subtests/dynsubtests
> may write auxiliary files which finally be included in results.json.
>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
> v2: simplify attachment dirname concatenation (Kamil)
>     remove files in attachments dir when overwrite is set (Kamil)
> v3: unify 'attdir*' variables (Krzysztof)
>     do recursive removal in attachments directories (Gustavo)
> ---
>  lib/igt_hook.c    |  4 +++
>  runner/executor.c | 75 +++++++++++++++++++++++++++++++++++++++++++++--
>  runner/executor.h |  2 ++
>  3 files changed, 78 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_hook.c b/lib/igt_hook.c
> index f86ed56f72..b8f25b6c7a 100644
> --- a/lib/igt_hook.c
> +++ b/lib/igt_hook.c
> @@ -518,5 +518,9 @@ available to the command:\n\
>  \n\
>  Note that %s can be passed multiple times. Each descriptor is evaluated =
in turn\n\
>  when matching events and running hook commands.\n\
> +\n\
> +When executed by the igt_runner, environment IGT_RUNNER_ATTACHMENTS_DIR\=
n\
> +is passed additionally to the hook script. It contains directory where\n=
\
> +script may write additional attachments like guc logs, etc.\n\
>  ", option_name);
>  }
> diff --git a/runner/executor.c b/runner/executor.c
> index 1485b59d1f..af39b12aea 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -1,6 +1,7 @@
>  #include <ctype.h>
>  #include <errno.h>
>  #include <fcntl.h>
> +#include <ftw.h>
>  #ifdef ANDROID
>  #include "android/glib.h"
>  #else
> @@ -1779,17 +1780,22 @@ static int execute_next_entry(struct execute_stat=
e *state,
>  	int errpipe[2] =3D { -1, -1 };
>  	int socket[2] =3D { -1, -1 };
>  	int outfd, errfd, socketfd;
> -	char name[32];
> +	char name[32], attname[32];
> +	char attdirname[PATH_MAX];
>  	pid_t child;
>  	int result;
>  	size_t idx =3D state->next;
> =20
>  	snprintf(name, sizeof(name), "%zd", idx);
> +	snprintf(attname, sizeof(attname), "%zd/%s", idx, DIR_ATTACHMENTS);
>  	mkdirat(resdirfd, name, 0777);
> +	mkdirat(resdirfd, attname, 0777);
>  	if ((idirfd =3D openat(resdirfd, name, O_DIRECTORY | O_RDONLY | O_CLOEX=
EC)) < 0) {
>  		errf("Error accessing individual test result directory\n");
>  		return -1;
>  	}
> +	snprintf(attdirname, sizeof(attdirname), "%s/%s",
> +		 settings->results_path, attname);
> =20
>  	if (!open_output_files(idirfd, outputs, true)) {
>  		errf("Error opening output files\n");
> @@ -1870,6 +1876,7 @@ static int execute_next_entry(struct execute_state =
*state,
>  			setenv("IGT_RUNNER_SOCKET_FD", envstring, 1);
>  		}
>  		setenv("IGT_SENTINEL_ON_STDERR", "1", 1);
> +		setenv("IGT_RUNNER_ATTACHMENTS_DIR", attdirname, 1);
> =20
>  		execute_test_process(outfd, errfd, socketfd, settings, entry);
>  		/* unreachable */
> @@ -1948,9 +1955,61 @@ static int remove_file(int dirfd, const char *name=
)
>  	return unlinkat(dirfd, name, 0) && errno !=3D ENOENT;
>  }
> =20
> +static int ftw_attachment_removal(const char *fpath, const struct stat *=
sb,
> +				  int typeflag, struct FTW *ftwbuf)
> +{
> +	(void)sb;
> +	(void)ftwbuf;

I was able to compile without warnings after dropping this.  Is there a
reason to keep them here?

> +
> +	if (typeflag =3D=3D FTW_F) {
> +		if (unlink(fpath)) {
> +			errf("Cannot remove file %s\n", fpath);

Maybe append strerror(errno) to the message here?

> +			return -1;
> +		}
> +	} else if (typeflag =3D=3D FTW_DP) {
> +		if (rmdir(fpath)) {
> +			errf("Cannot remove directory %s\n", fpath);

Ditto.

> +			return -1;
> +		}
> +	} else {
> +		errf("Cannot remove %s (unsupported file type)\n", fpath);
> +		return -1;

I think it would be sensible to drop symbolic links as well (I think it
could be handled in the same brace for FTW_F.

> +	}

I think this would look nicer if it was handled with a "switch"
statement.

> +
> +	return 0;
> +}
> +
> +static bool clear_attachments_dir_recursively(int attdirfd)
> +{
> +	char attdirname[PATH_MAX];
> +	DIR *currdir;
> +	int ret;
> +
> +	currdir =3D opendir(".");

Why do we need this call?

> +	fchdir(attdirfd);
> +	getcwd(attdirname, sizeof(attdirname));
> +
> +	/* Sanity check we're in attachments directory structure */
> +	if (!strstr(attdirname, DIR_ATTACHMENTS)) {
> +		errf("Cowardly refusing removing in directory which is not "
> +		     "attachments directory [currdir: %s]!\n", attdirname);
> +		ret =3D -1;
> +		goto out;
> +	}

This function is static and only called for DIR_ATTACHMENTS.  I believe
this check is unnecessary.

> +
> +	ret =3D nftw(attdirname, ftw_attachment_removal, 4, FTW_PHYS | FTW_DEPT=
H);
> +
> +out:
> +	fchdir(dirfd(currdir));
> +	closedir(currdir);
> +
> +	return ret ? false : true;
> +}
> +
>  static bool clear_test_result_directory(int dirfd)

I think we need to have the path to the test result dir passed as
argument here so that we can build attdirname without having the change
dir + get cwd dance.

>  {
> -	int i;
> +	int i, attdirfd;
> +	int ret =3D true;

I guess we don't need this ret variable. If the removal of the
attachments directory fails, we can just print an error message and
return false.

> =20
>  	for (i =3D 0; i < _F_LAST; i++) {
>  		if (remove_file(dirfd, filenames[i])) {
> @@ -1960,7 +2019,16 @@ static bool clear_test_result_directory(int dirfd)
>  		}
>  	}
> =20
> -	return true;
> +	if ((attdirfd =3D openat(dirfd, DIR_ATTACHMENTS, O_DIRECTORY | O_RDONLY=
 | O_CLOEXEC)) < 0) {
> +		errf("Cannot open attachments directory\n");
> +		return false;
> +	}
> +
> +	ret =3D clear_attachments_dir_recursively(attdirfd);
> +	if (!ret)
> +		errf("Cannot clear attachments dir recursively\n");

Why not simply call nftw() directly from here? I don't see much value in
having the function clear_attachments_dir_recursively().

--
Gustavo Sousa

> +
> +	return ret;
>  }
> =20
>  static bool clear_old_results(char *path)
> @@ -2002,6 +2070,7 @@ static bool clear_old_results(char *path)
>  			close(dirfd);
>  			return false;
>  		}
> +
>  		close(resdirfd);
>  		if (unlinkat(dirfd, name, AT_REMOVEDIR)) {
>  			errf("Warning: Result directory %s contains extra files\n",
> diff --git a/runner/executor.h b/runner/executor.h
> index 3b1cabcf55..bc6ac80dc4 100644
> --- a/runner/executor.h
> +++ b/runner/executor.h
> @@ -25,6 +25,8 @@ enum {
>  	_F_LAST,
>  };
> =20
> +#define DIR_ATTACHMENTS "attachments"
> +
>  bool open_output_files(int dirfd, int *fds, bool write);
>  bool open_output_files_rdonly(int dirfd, int *fds);
>  void close_outputs(int *fds);
> --=20
> 2.43.0
