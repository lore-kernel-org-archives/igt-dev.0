Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A48C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 18:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE4E10E4AF;
	Wed,  8 May 2024 18:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPLR9MBG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8036D10F1EF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715193966; x=1746729966;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v8H2p7t5Lym2EA25XJINKYVNNgg/rWya+a0+WSQzDfI=;
 b=jPLR9MBGyWX41b6wptMQ8Ug4wX+J6+ZoklFhUEg2zDG0/BuBUZC7aa7l
 PMuk2tUdzQtRJHJnbLHlfxhHQFVGDO6eSCBKFHOIEN1nwxAOZIvs+B4zO
 3QiwquTiFBDM8uvYSDLF+8oXgHo8psDYqYM+iTigZS62Ux3LJj9yrtMn7
 zy9ZVBbKu/JnN08+kjsrHYOAp2mh1BdNk0iASjSnDdgqPWwsZqqXh6ljI
 Katu9reRWhW6/RJjpnhbIAFHL5opODvGl+QLEURxFFBmPDuH5NEY9zR3y
 Hn6BvmD1WZbkdvP76BUs5EBRuItAeYQvIGPP0NUmlm8veyDNPiJOuFSA3 g==;
X-CSE-ConnectionGUID: Ah4SGWD3TqCtIXog1dKfRA==
X-CSE-MsgGUID: a2+ZwBrIRMakkRreOdvNpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="36457412"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="36457412"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 11:46:05 -0700
X-CSE-ConnectionGUID: wk767HbzTSeyrRHH9a4C+g==
X-CSE-MsgGUID: VD9IDAl8TTSh1O+1itB+bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="59843636"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 May 2024 11:45:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:45:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 8 May 2024 11:45:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 8 May 2024 11:45:57 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 8 May 2024 11:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KuHBDhSGmKj35NyUt/kPXVSdi2cpJUM5ruXrW2wFMxd0Jrv8k+6fia34cLngcte87TWrNQBbFiWCmLp4lTbkrt10JqQJaZ0mJHQkh7ppwwUAcAUz0Pbn5RNmw34zuycWG2cQg/5pNfDhCxAkIswnhMPBxXogiz+tuNGLVIGrMbptutp+/UFncyXXPnHt97N0XsDxI4BhMxa9AC4FKyl8YN0LaVlL5I9Nnno7tUIS+LrMkobxWtLFUbZ57lllgw24fyOvZRV0wUj3szfCfPz8b9+kV4Q/NyU95a5Aj66pGtOdEdJv/Xy/UpdOBPQgME0Q9PYmaFgd+rL0cCkEyn6+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wr392sMxXCFyNmUo+rLuS60Um7CHx2bhOQvl8IH1FDI=;
 b=XMO1mwGXy45Hk7NhCQTYMDXzE6FD81ZPgChKDV3ipbJnOGtYZ8iXTYKeU5LxNT5fZ7mmOdNeEHt4W7YkDVsMnc9nZNkeSFxYIT2jlDM0ya7C7p9uZVs79lMsW/2J46ss+BnQSSdNI31Jnc3mQXp5v828YAP0KrzbHqHjGvrGeooyLuopM67NuD5+1vtm0q5HTShi7aVyqyjZPhAIV0kSTsagJ+wIu8MIloOS2kiWjBqeoBNnIffi/XyqqYJzkydpu8xDnCeC57rvunyurHKxlDSEapn86iL2aF+Kgo+uEh9HVo53GLgLfD9pcGfj2eJf0mRyzf5mtZPZLBY/8RCFFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 18:45:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 18:45:54 +0000
Date: Wed, 8 May 2024 11:45:52 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 09/13] lib/igt_drm_clients: Move engine fields
 to substruct
Message-ID: <ZjvIYGuzEkveJHxq@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-10-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-10-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::9) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: 391e4a6c-1362-42fe-c720-08dc6f8f17aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW13ZGViSWVXRy8yWHc1bGNkZEV6SkoxVE9sVkxOZUVMZmRGSHRqKytPczVy?=
 =?utf-8?B?WCtPdjlweEFsYjBKaUZHQ0RKQ1BSNjlYb0FzbUVCelZnazdoS1VRVytsTUVI?=
 =?utf-8?B?SEZlb21pWWM1ZHRidVZNbDNhd3hsMEh6dmc1blF2L09zYVJUUlU5cm4wOEhz?=
 =?utf-8?B?djQxT1NvVjYzdnVITDBUeXl5b1JSY0JQa1o3cU96VU9GeGxIdjI0SmozSVpL?=
 =?utf-8?B?OEhrb2Y1emRkZDY1blVXTkpEUHFWTm9xL01hVXN3OWFIZ2JZQVNyb0dPWkhC?=
 =?utf-8?B?djJMak9CRzRFVDRvTURYcWtsNnJFZWRmTVZpYmVwWEJKKzlqdHBnR1Vlck1Y?=
 =?utf-8?B?VTJKSU0rd29rS1RWZXY1L1pTK080MzNwU0Q3UDlzRkxGRTJ0a01SdW0rd0lB?=
 =?utf-8?B?OUdiQTRRNC9BQ3BRZ3Roc1BrK3V1YTB6dHBjN3NjWHE3ZEhNaE94V1FyZTlo?=
 =?utf-8?B?WExkUDRVS3hYOFdNUngvMncxYit1bllvemowZEQyTFNHTE5UUnpLVW9na0Iz?=
 =?utf-8?B?TTA3SVZTVEZxN1hXeUFkeWdRZ09CY09zbFhOVExac21OUWVFTmdGZWsybnA2?=
 =?utf-8?B?QXZqQjczSWtkWG81dHllNThQSWNrdFJtMVVScE1oWml5YWtUeEFMVWdKTHFO?=
 =?utf-8?B?T1BmaUVrN1M2cmRIUnNlVGZRMUxIZUZBcWVqNlFHL09sWFI0SGpSUjNNM2FL?=
 =?utf-8?B?d2hDbGNKUEdhU053MGNXRHVLdXJWNEJ2Z1BXWERhNzk1TDZsOTlnRDQyd1NY?=
 =?utf-8?B?Y1lnRXhHbDdiK0oxTENnYjNsRjlUajNWVTJJSSszbW5qOVNiQjRLN281d2Fz?=
 =?utf-8?B?TDF6b253bzMvbndnOGlzTEJyc2tCd2hsL0xXOXYwallyNTRmR0dUblJWVnAr?=
 =?utf-8?B?TFAwRk5mUis1R0c4RHZMS0tWUHZLQlpKSDhRWWd3c0t4MldYZkttWHU0aWhI?=
 =?utf-8?B?QkdTakFac21xTzU4S29JeTFSVUlmMkg3QlRnREdpcFNiRFk0alU2NWV2VER6?=
 =?utf-8?B?b051ZEhlYXptdng0ellXMXFZVEtyWTBpakttVG8ybDVIQ2phamVYWTJSQk9s?=
 =?utf-8?B?eHc0NXkxdjlUUWs5UTQvNTFaTExnYVBiYVVscGxjZFdOZ2tsakhxUmlyZEtI?=
 =?utf-8?B?L1YvUDVvRG95WWhyZ1ZxajFsd1pnQ0s4cUpPWER5cmEzeVJELzVMMTcweWp1?=
 =?utf-8?B?bGdoWmZ2Y0lIRzltNS9pQW5PLy9LbTVvVW9EaXBGNHdWc2pvbU9XV1hBYUVJ?=
 =?utf-8?B?UXhQWHdVWVpTQnY1b2hDeXpOK3hiR0ErYUFMcFZGbGhKd01TV3VzdTBtRXpm?=
 =?utf-8?B?Q1g4NjRyQ015eW1LYmtWVWZnMGJ0S2l4VGkrTitTaXZIemRCUHM5Qm9uMmd6?=
 =?utf-8?B?b2hqK0JmNWVKWWEwazUxb09JV082OU1OVzF3YjgvaHJLUHpGMEpmbC9qaTFS?=
 =?utf-8?B?aERJVlJpUjdZYnp1MkE1d3N2cHRuN2NsWGFOSGk2eldXQzI2S2dlc0l1Z01k?=
 =?utf-8?B?cU43OWRNMlJhR0phNWZKVTEzRTNzQS9VL0dwTk9UQ0ZvbVZjUytCOVI2cW9i?=
 =?utf-8?B?YURLbWEyTHZvT2dwQ1dhVkJ5OUErU2N1N0w5M2xFUVFySk5ZeDE2SEdhWFVB?=
 =?utf-8?B?L01BM2kycUppcEY5MWxoN0NUWnJvSno4UXFzTmVDckZVMitXUHRhckViZ3Fh?=
 =?utf-8?B?MmdjZmRwWnZKT0ZReEJTQ3BkdTUxTTRiUVdmU1dDd0tMcjNxd29tU1lBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWIxRmVLaWRTUWx5bW0rMVpua05VZmI1dEd0SDdKSTdXWXFWSThVM0lYUFNx?=
 =?utf-8?B?RWZrK2dmVnlRazlsTnUvRlNhL3ZpTGFrczB1Q0l3U1FlSW9vbHFPKys3aHFp?=
 =?utf-8?B?amt0b1U3NSs5SUIrcGx6N0NkMzBxWWJJc2M1ZVdYT0k5bk5wa2pOa3hQcERu?=
 =?utf-8?B?S3RUN25IY1JqU2JCeTlTenRSVDlYUkFncHIxNEZLQm1TZGNpdCtvMEJDVDJH?=
 =?utf-8?B?MlZXRUZSelFZMkwyRTI3TkVQclFNbm9hMHlHV2NseExYdktFRk5ySG5nUGlZ?=
 =?utf-8?B?aVEwU3NIeVdOb1UvdStpQ0Y3VW4rdTJQOGRjSWJXTUF0Y2NSYUt5T3NhZkN4?=
 =?utf-8?B?WERjQkFvRWlGVisydzVQQkpteHNiMEpCVXFsWjMwVlh6Q0xzQmZJWWlJVFVy?=
 =?utf-8?B?QUJqTlNpSEpBaG8vZUE4NWRnbjFPZDVVU2xXNjZXdkI0aER4TnloSU9Lb1JO?=
 =?utf-8?B?aEFhRDVNaktyMDNMU3grOXd2ZTdSLzdVMy9sMzl3SWJmL25FTk9DRnpyaVEx?=
 =?utf-8?B?Y1NXUHdKR1BvSjVIeVVnRmlXVkFFREJDc2VFM0ZFbVlRT3RRSHZ5M2EzOHNv?=
 =?utf-8?B?aEZuZmxQRzBpUUx6TEk4MzM2REdpcFRmZFc0WnUxelBjZC9HTEJmczBwYlBJ?=
 =?utf-8?B?RGdmM2crY092cTh5Yk1vdFBQU2V3YTNLc1RzQmpqM3o3MS9Bd2FMWVVTYXI0?=
 =?utf-8?B?OE1Na1Q0KzVPZ1ozZ3lRMDZ2d1FXU2wwYnFoMWZ1OUNZc05heDdjNmRmdENJ?=
 =?utf-8?B?WmxnQTZRZkFURlpyYVBsWS9PTitwT1MwR0Fjb1Z0aWNDOTBwSEhDVW85M0Vp?=
 =?utf-8?B?NE12ZGZ1M1pCYmw5bmRRZXE0Q01GSnZTcTZyNzBpRmEydnpGUkdqcGhGSS9R?=
 =?utf-8?B?QnFlVkhRUU9ldGdhODMzczBsNDdTNmZzNkxqRmkrN1UyeG13ZERoVG1UVjV3?=
 =?utf-8?B?cHJuUzFmYS9MSnlKZmdDSTg5YjZsNHZ4ZWVITzYvVnIrU09uVnM1NDJwMGxa?=
 =?utf-8?B?VEVoVnNIM2JJemlrYlNSL0EzQXpxalhkNTJxbytwT0lxdzlBZHJxNERhV1NS?=
 =?utf-8?B?SWI0OXVoaXlkYStvaXpqTDlCQXIvUEpqMnZrVExGZmI3VndoNU45bld5aUhN?=
 =?utf-8?B?Slg0V3h6OGJzckl4OEJyZmxqdlpkdlR6eVM1L2tHdHhoMzdBcjNnT0JUVURF?=
 =?utf-8?B?TWMyZ2liSzFiL2R3OHQ5cy9NSVIvOERxdndTc3padVlQOWdYYnlnNENHSzlD?=
 =?utf-8?B?d3J6ZEJpL2s1aXp2QUZ6VTlDcE4rYkJmSEk1ZitxUU1GOHNHMTFwQjhGTG8w?=
 =?utf-8?B?OTQzTFdUdHpPd1grUXN0RDRBSkZRVCtwcGtSeUVidm0vWVVRejdJVDQrRnNj?=
 =?utf-8?B?NHdDdXh0a2Z5WVoyR084OFdzSGV5VisyT3RLUDJNaWd1ZTlCc1VSMW81THZl?=
 =?utf-8?B?dmRvMTdhNENoQmJ0bWRQNTZ4UHVLaUZYWnZ0VHJXNVVWcENRRE5JTUo2QmhR?=
 =?utf-8?B?WjdWTVMwL09kZDRyT3ZhWmhSRmpOYWdJaDJ0a1F6WGt3b2NZUVlPdUhVajA5?=
 =?utf-8?B?SkdNeUcvU21IbEhKamUwRzcxdVQzVE9nT3VmRkpXTHRRNk91c0dCNEJDazJS?=
 =?utf-8?B?b09FSFNDSHNMS01YWkpXQ2ZBYndPNWdXK0hSRERpS1I2Y1FKRVdjM0N1Y05T?=
 =?utf-8?B?dDVib0xOdkc0dUdRbEs3QU9WTTZhMExwdjlTdTZXY3h6UGR1dDNLMjJrYTZI?=
 =?utf-8?B?dWtPZG1abTdVdHdLS1dFK3Btdi82Z29Ib1JBZHlLS21oZU45alVTYzFHVGJl?=
 =?utf-8?B?TG5YVGY1V2w3Rkpka3Y1eCthb2FNZnRVNUJEL1JPVFFHTkpGU0NjamtjUlQ5?=
 =?utf-8?B?dWNHdWlkZkFjSVY4cVcxMnRGQ3dDVHN2ZWt0a2Y2dDlzREtscGNjbCt6dXFx?=
 =?utf-8?B?c3lRc0huY2hqWHp3L3Y5ejBocXBZYjhXNWRxVGlTRFF1aHZuQmQ1d1lScjBL?=
 =?utf-8?B?TE5TNGFhYUN1dWtCb0FDcGxnNWRweGpQMk4wMWh1Yy9OVGlvWjMwN2RjOHBs?=
 =?utf-8?B?SW01Ri94QUd2azQwb0tCcHVpcnJSejBOc0ZQeWllWUxnTjA3YU03UFBtK0l6?=
 =?utf-8?B?cVRsMnRVN0c4VDd3TFQ3dExiMlJPd2UrZDRZYmZuRHh6aWw3cmp4Y1lrZlU2?=
 =?utf-8?Q?JMDvQkHtEgMIzufXlunPtdQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 391e4a6c-1362-42fe-c720-08dc6f8f17aa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 18:45:54.8906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKtSiqJUXOk8IlRVTRnxPWfkL/VoA6n25KjsoKQ/pb3MS0j1i57ze6N0E+4MqVRFYQqxFQmoO1ecVzKLd3R9aRs91wKfaKg/HJb+hXathkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
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

On Fri, May 03, 2024 at 11:46:39PM -0700, Lucas De Marchi wrote:
>Instead of keep adding arrays, move all the arrays indexed by engine to
>a substruct.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_clients.c | 20 +++++++++-----------
> lib/igt_drm_clients.h | 12 ++++++++----
> tools/gputop.c        |  2 +-
> tools/intel_gpu_top.c | 14 +++++++-------
> 4 files changed, 25 insertions(+), 23 deletions(-)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index 3f4265015..91d71a7bd 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -109,13 +109,14 @@ igt_drm_client_update(struct igt_drm_client *c, unsigned int pid, char *name,
> 	for (i = 0; i <= c->engines->max_engine_id; i++) {
> 		assert(i < ARRAY_SIZE(info->engine_time));
>
>-		if (info->engine_time[i] < c->last_engine_time[i])
>+		if (info->engine_time[i] < c->utilization[i].last_engine_time)
> 			continue; /* It will catch up soon. */
>
> 		c->total_engine_time += info->engine_time[i];
>-		c->delta_engine_time[i] = info->engine_time[i] - c->last_engine_time[i];
>-		c->agg_delta_engine_time += c->delta_engine_time[i];
>-		c->last_engine_time[i] = info->engine_time[i];
>+		c->utilization[i].delta_engine_time =
>+			info->engine_time[i] - c->utilization[i].last_engine_time;
>+		c->agg_delta_engine_time += c->utilization[i].delta_engine_time;
>+		c->utilization[i].last_engine_time = info->engine_time[i];
> 	}
>
> 	/* Memory regions */
>@@ -183,11 +184,9 @@ igt_drm_client_add(struct igt_drm_clients *clients,
> 		c->engines->max_engine_id = i;
> 	}
>
>-	c->delta_engine_time = calloc(c->engines->max_engine_id + 1,
>-			       sizeof(*c->delta_engine_time));
>-	c->last_engine_time = calloc(c->engines->max_engine_id + 1,
>-			      sizeof(*c->last_engine_time));
>-	assert(c->delta_engine_time && c->last_engine_time);
>+	c->utilization = calloc(c->engines->max_engine_id + 1,
>+				sizeof(*c->utilization));
>+	assert(c->utilization);
>
> 	/* Memory regions */
> 	c->regions = calloc(1, sizeof(*c->regions));
>@@ -225,8 +224,7 @@ void igt_drm_client_free(struct igt_drm_client *c, bool clear)
> 	}
> 	free(c->engines);
>
>-	free(c->delta_engine_time);
>-	free(c->last_engine_time);
>+	free(c->utilization);
>
> 	if (c->regions) {
> 		for (i = 0; i <= c->regions->max_region_id; i++)
>diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
>index f2ff13182..d44daa6dc 100644
>--- a/lib/igt_drm_clients.h
>+++ b/lib/igt_drm_clients.h
>@@ -63,10 +63,14 @@ struct igt_drm_client {
> 	char name[24]; /* Process name of the owning PID. */
> 	char print_name[24]; /* Name without any non-printable characters. */
> 	unsigned int samples; /* Count of times scanning updated this client. */
>-	unsigned long total_engine_time; /* Aggregate of @agg_delta_engine_time, i.e. engine time on all engines since client start. */
>-	unsigned long agg_delta_engine_time; /* Aggregate of @delta_engine_time, i.e. engine time on all engines since previous scan. */
>-	unsigned long *delta_engine_time; /* Array of engine time data, relative to previous scan. */
>-	uint64_t *last_engine_time; /* Array of engine time data as parsed from fdinfo. */
>+
>+	unsigned long total_engine_time; /* Aggregate of @utilization.agg_delta_engine_time, i.e. engine time on all engines since client start. */
>+	unsigned long agg_delta_engine_time; /* Aggregate of @utilization.delta_engine_time, i.e. engine time on all engines since previous scan. */
>+	struct igt_drm_client_utilization {
>+		unsigned long delta_engine_time; /* Engine time data, relative to previous scan. */
>+		uint64_t last_engine_time; /* Engine time data as parsed from fdinfo. */
>+	} *utilization; /* Array of engine utilization */
>+
> 	struct drm_client_meminfo *memory; /* Array of region memory utilisation as parsed from fdinfo. */
> };
>
>diff --git a/tools/gputop.c b/tools/gputop.c
>index 80bc94be4..aa88a8021 100644
>--- a/tools/gputop.c
>+++ b/tools/gputop.c
>@@ -208,7 +208,7 @@ print_client(struct igt_drm_client *c, struct igt_drm_client **prevc,
> 		if (!c->engines->capacity[i])
> 			continue;
>
>-		pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100 /
>+		pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100 /
> 		      c->engines->capacity[i];
>
> 		/*
>diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
>index 35122493c..9b65ae4eb 100644
>--- a/tools/intel_gpu_top.c
>+++ b/tools/intel_gpu_top.c
>@@ -893,9 +893,9 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
> 			strcpy(ac->pid_str, c->pid_str);
> 			strcpy(ac->print_name, c->print_name);
> 			ac->engines = c->engines;
>-			ac->delta_engine_time = calloc(c->engines->max_engine_id + 1,
>-						sizeof(ac->delta_engine_time[0]));
>-			assert(ac->delta_engine_time);
>+			ac->utilization = calloc(c->engines->max_engine_id + 1,
>+						 sizeof(*ac->utilization));
>+			assert(ac->utilization);
> 			ac->regions = c->regions;
> 			ac->memory = calloc(c->regions->max_region_id + 1,
> 					    sizeof(ac->memory[0]));
>@@ -912,7 +912,7 @@ static struct igt_drm_clients *display_clients(struct igt_drm_clients *clients)
> 		ac->agg_delta_engine_time += c->agg_delta_engine_time;
>
> 		for (i = 0; i <= c->engines->max_engine_id; i++)
>-			ac->delta_engine_time[i] += c->delta_engine_time[i];
>+			ac->utilization[i].delta_engine_time += c->utilization[i].delta_engine_time;
>
> 		for (i = 0; i <= c->regions->max_region_id; i++) {
> 			ac->memory[i].total += c->memory[i].total;
>@@ -946,7 +946,7 @@ static void free_display_clients(struct igt_drm_clients *clients)
> 	 * or borrowed fields which we don't want the library to try and free.
> 	 */
> 	igt_for_each_drm_client(clients, c, tmp) {
>-		free(c->delta_engine_time);
>+		free(c->utilization);
> 		free(c->memory);
> 	}
>
>@@ -2161,7 +2161,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
> 				continue;
> 			}
>
>-			pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
>+			pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100;
>
> 			/*
> 			 * Guard against possible time-drift between sampling
>@@ -2235,7 +2235,7 @@ print_client(struct igt_drm_client *c, struct engines *engines, double t, int li
> 					 iclients->classes.names[i]);
> 				pops->open_struct(buf);
>
>-				pct = (double)c->delta_engine_time[i] / period_us / 1e3 * 100;
>+				pct = (double)c->utilization[i].delta_engine_time / period_us / 1e3 * 100;
> 				snprintf(buf, sizeof(buf), "%f", pct);
> 				__json_add_member("busy", buf);
>
>-- 
>2.43.0
>
