Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36875D58B09
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 03:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A042010E2AF;
	Mon, 16 Mar 2026 03:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CgWTQGPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028F110E2AF
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 03:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773632303; x=1805168303;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RG1po22HEg6lEKzVlLgGDUHeqGSYwDf770iQlkB3kiE=;
 b=CgWTQGPjGCbvvtoKs8sO9/ZCYOOjG/5r4XLUb6K5C4yXHmlREoFu60vq
 UiBVs90XM5vhT5giYi7/ssTsSn1P+qwSdE+jfs7rFkQLvDFYYkSizm29S
 XPgSf5Wq14BJMR6n/X+WsNJgsNXykz4JAjczK0ctlagyN3i7vIT4ZABrB
 RDxpgNmWH+5IWEO9HqwhkNJVq8TLY/fKD14eXcHiUfCZP2/c7yqViFiBJ
 yJRvMnb3dCKQnFBHpFfSU+mkfIDm6O4ioScH6MYsPZ5jrDeUjNiSKiK08
 YtfjsklQE7qNicZEsOBEyakBqnvdru4UPfFFSe1vQGdFtgBjEOyq4BN4w g==;
X-CSE-ConnectionGUID: jy9lMj1lQ0evLyR1Jv0XFw==
X-CSE-MsgGUID: gPwozHO6TGm9K2UbNdmErA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="92214371"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="92214371"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:38:21 -0700
X-CSE-ConnectionGUID: uaz9vApITLyJjM/8wI7Iuw==
X-CSE-MsgGUID: R4cLgN/nS/GqAW7DiY4tNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="219009501"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 20:38:20 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 20:38:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 15 Mar 2026 20:38:20 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.62)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 15 Mar 2026 20:38:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0/yxUEFZ/oaNdH/eSF3xnVYDBVGdDluU5BWrz94qysKEDZ4/GkaJKzAiGvOzqO9CR1XONeMc7XNfzcFwvnseGe/rY40XmL/9V4Laageq5tN9LhLcEPou8W0zcU88MpCBq/mhJmDCC1inP3OMaUhXUn2bNdsEqdQUKmPva7OWENaa0BhRGXFGXLluZyvFi+pEBktgj5mPBI234YEPE1nXL4zfLVjhPSSDWOUPJtby5DwiU0T2VKDBtlgdFtQok7ngkuQ/D5eEtiZ8pNRKvLG68oUVyW97mdJk91EN0gld7s6I+astAB6Z5vXb76uxy6oNKMYQQLXAWrKKyHFyobQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXX/lDMbUz4acoS8055b4BGXvO5wORsGH5UOLZPcH7Y=;
 b=Im7fB+dM0GzCD3AyPTkfT7+5yUTaF1bn7D+MMKm65ltglhlk4H6Ct/UvcK7CRJTGJ5HuKfrIn9wDlMLXxqFO/S/Ld2O/1ITCGwGZzGrBbuh45mHsVhlorZMEUXCqBUXS0X4h6HgDSc+m9evdoZ3aq7glfqdBnpTQhmxG7gA4GNsPaJ0MTQwzIjQ8CCbU1RmqNOan7D4S7epK4Vb3tbPX9HFNivo0s6uqwdZCdonLChOY8lhUXLPwhaKmik1k+I0xWpEy74QoVh9I9r7gqVcdThGva7Uhy/5m1+stwpuToVS59odtQFsK8235BBuXEwP81S6+8AT6I4frYgfJyIBI5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS3PR11MB9671.namprd11.prod.outlook.com (2603:10b6:8:38e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 03:38:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 03:38:18 +0000
Message-ID: <dacfb529-173b-4444-b351-f063e721fc92@intel.com>
Date: Mon, 16 Mar 2026 09:08:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,6/6] tests/intel/kms_usb4_switch: Add USB4 switch test
 suite
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260225212859.876713-7-kunal1.joshi@intel.com>
 <d5d123a9-5559-4d08-a696-c499a656607e@intel.com>
 <d250bf1f-2d0e-493c-9000-b344d2a6371f@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <d250bf1f-2d0e-493c-9000-b344d2a6371f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::7) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS3PR11MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 5efb09b0-80cf-4a7d-d188-08de830d76b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: ZlYqnTWZSENm+ia0S43TxGruzj1/Kn/iWw3h6EMsCx0lcXJgMs6q0hMrGKqGlyz37tcR013Pe9IWRRA0oWB+mn4b+keZiwPeVDjzhzIHiOtrR61j4iMHqDeBT1Qrc0jD6wz69xYIdFme9VUbhA1sATHXBcPqN2IX4OxdygZqqSfm5idzhZLeps017vs+EdIjl86QgJQDGhIrzFTEu6u4Uj08uI8aPz46vQDoU26gy/CzC+vZNBcYMIxW4hd9tN0mlob71LDAdryxkvmbiNhLXgRDMbhM0aDz2OuX9Hz6dJTXM9Rgso0Dt5isXOMU/eHcgW/JKtVkwHO6xKJSXyiZj9LpEF1uUPoy4xnXIx/QvWCUPQVxPhOJcCWtfsdFm5wksrdZoyPXUxF3+ApYzwR/Y1UrpwL4ZcpgUjRp5y6eGDm+4jtTtgPH7qYfhq6+Kyi4saOqaITUYRndAqSCwiYEWdHFymcX10Zi3qCDcf7DyygUWm8vnsKXdBvl0rIECwQCt+tM0fJSXdkQzrHzoIwvDPIYeQzi7vrbOkXF4r903EqYF8190L0WzWIR6Vggbf6/92fHawj2zsDpCrSSxI/8ucEaAA+erwj6ayuokYHnQomuuNUYFV67bzYx3tqGc3kXSAMpRNw0xQ+YN195FqWVIofPrnJG79Lt0hj7AVStz64RJpPAEXiA0Max9AAiHb5IXloJ4ifoT4sZB7D21BNtfYKsReQMPj40PIIU3p3Z0yE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnJNSTFtTXdCSFU5anpNcGoxQ3lQdVFYN1Ryamd3dFhQay95WTdQNWI0Wjlu?=
 =?utf-8?B?M05tLyt5YU5nM3l4L25TQ0dSMmVBZG41a0MzUWxFSGJ2K1lMcTE2OU5qbW5O?=
 =?utf-8?B?YjZwcVBlem5Bd2ptbVB1dDBCazFMTDlLdndIakViMWd1WkNDZTVsT1F0bExU?=
 =?utf-8?B?RUE2UUhRMkdWaERXV0xYRkp6ekNKS0J4Rk05OFZwdVBNY0QwdER5eitlZzdH?=
 =?utf-8?B?eFA0RFY1REY4WFN0RnB5RWN4NnVTb2pocUNFQ1pDanIrV1N6M0xGRXJyZVJM?=
 =?utf-8?B?aER3TTVIYmxvTkJXTEt2TUl3elBPa0wyKzZDVHNGL2xoRElITlhkZnJ4bkxM?=
 =?utf-8?B?OHErbmRrNEs0L2lCeUhNMFFuRktDcTFpeERUdk1LUUJCYjQzZi8wTWJFeWkv?=
 =?utf-8?B?bWt0WjlqTmppK3YrU05YUEd4N2RZNHdPSzBOck1UL21HbGttUjREMzUzNnVM?=
 =?utf-8?B?SGF2NjJOOXM3a21ZajIwQWhyZTB3aE5kRUdlSlhrcnRxVXR0aC9qQ0NlcEFN?=
 =?utf-8?B?UStqQlg1ejQ0T2ZDUDJTUERUZUQ5TDVYMUZXR3pNYXJ5TWFKQkRPVFd5M1RF?=
 =?utf-8?B?dHFhb3pPakNUQXFiZUtUVnhaY3EwSXptUkt2Z1RBNVVoYi9NV3VudEM5QkZl?=
 =?utf-8?B?NXh2dzg5WkJoNWVvZGl3M2JMK1orL3gwd3g0NDZ6azg2R2JkQWNEb0lPT1pH?=
 =?utf-8?B?QWMzU3R5NlN1M0h6RVFRdUhwM2prN0pTUWhxdjkxcHlRZytvVGtmc1dabDUy?=
 =?utf-8?B?eHF0NFNiWlZkaE01ajZvbWp1WGxZOFNVY2lGM2Z0WDEyOC9kRWp2SnE0alB1?=
 =?utf-8?B?dWdBaXI3V0JndDBqdXFLeG9nREgxV3RMdDcvYzlhSnN4NWtuRGxuczV6YXdK?=
 =?utf-8?B?d0x3S3MxVVdWOXlKMTJiMEtVOEZhTTA0NkoxSTc5VmkrNVc5TldqWlN5aWd1?=
 =?utf-8?B?c3kvWlZ6SUlhREs2aTFMWTUzR3RyN3N6T3o3SWVWTVB2Ym1OdFg0RHY2cEFl?=
 =?utf-8?B?K3pNeG5QTkdsZmVWb284S0E4OTkyYjZCYlFkN0hTNTZ4RElibll3dW4rOVll?=
 =?utf-8?B?ajJycmdJaVYyTjdtMzB0VDdET3grOTZ3NWpvR2xDdWk0RkpXc3dKNzlubWoy?=
 =?utf-8?B?NG8vdDlKU3ZXcy9LMVVST2pPRTZFSVFLbFF1TDZvRld1RGtvMjhyanlibDBw?=
 =?utf-8?B?bnFIUkFRckNhMTdhRFd4Tzk4anBXQlQ4R21hRlV1cGdXUmlEbHJwTTZJay9m?=
 =?utf-8?B?R21nTS9FeXVSSy9GQThYZnRzcVd1Z2orSjFaT1NYamREc3Ftc0pHRk9nOWhv?=
 =?utf-8?B?a1ZBN053OGRCcEF6Wk5HZ0pQN0ZNaVc4UnhuRFBOcWlLRnFDL3JrU1VmVXVn?=
 =?utf-8?B?cVNxeUNnUlhCWnhPV0x6V3o1eUk0YnAyWmlINEMwMzlSK2VLZUhBcWFWSUZY?=
 =?utf-8?B?M3Q2TmxYQW8xWk9LTVFaeGVpb0g1a25OYms4cWh0eXpnZ1JjeFZOMDZIVWlH?=
 =?utf-8?B?WUN0QWVUTk91STdlQ2JSNG41c0FqTjhBbHFHUTNPN1E1N2wyZ3JuRDE1VUpq?=
 =?utf-8?B?Z2I4dmJ0S2pmWDcxY0d4SGZuUGowNVdOSmFpazQ0Vk1sVmFQRlorOE5ObERZ?=
 =?utf-8?B?cE1lZ05vTVlJeFlPNXhXektqQzltUmtoWlZsMi9yd2FFU3QwYWt0YyszYUJI?=
 =?utf-8?B?NlIzVTJ3alZDVDl3cXZ5b2UxeEZUd1d6djJzRjhrdXRYQVhGblJsYzE1OU1R?=
 =?utf-8?B?Ukw2TFlNUDllNmhSY3d1UDBKcDByVmE0WWxCVDZXWWNaUmtRN3QvQlVMRHQ0?=
 =?utf-8?B?WC9yVlljaVNVTldMMXF5a3FFTXlpL1JOcDJhd3cwM0E2Y3c1VktpNXRQTnJX?=
 =?utf-8?B?U0VTeEMxWUsyNnFxVnJCRHhaQkdrdDNuUGdSdmp5MVYxUURSeDJXMVltNVBD?=
 =?utf-8?B?Wlc3dndjbGtCNndQQnZrZ05ZalpXd3Rlb1pIVzVpRjBjVVo1VGtUQU5EVkZ6?=
 =?utf-8?B?M0YzaE42Vk0xREM0WGczQVJHNUhHaXczUUxMeUIvRS9kQ2dWNE5maG1adklI?=
 =?utf-8?B?cE96YWhoSFpHVVQwSnp6TmpaREt2Ly80U3VQNlZyZ1FIL3h1RnBUQjFab2hz?=
 =?utf-8?B?MHJlTVZmNkw3Sm1LSmkxSXBoc2x6TXN1cllPQ1N3b1NwdEd3aFVLRkxJMGpj?=
 =?utf-8?B?N2tuNWRuWFMxUlVzallLSGdBN2h2eE1xRFJpcEVMYklmQUNocUE3L0dncW8z?=
 =?utf-8?B?dWhTTS9wMXRxblNJbk9MRlFKZkc0eXhVbDJqeFB4c2toOTZGck1wbUpQSkNo?=
 =?utf-8?B?OGUxM2V5c3EzRVIxbGttWWppUEVmYWRUbStJeXJYZjRua1krbmtNZz09?=
X-Exchange-RoutingPolicyChecked: n1xcNCzoYaIvYFDxtirOyikdpCi0CYozDpmqXWStuelkjGepnbwUjb7MeFBYZYykpddlo3UpKma5WIyP9xFysu10tJpxDM/1ZTIWbKNtVOhKRDJk7+6mDCemTeM/ORZl6H+jCO2yhUTjD1gFB3QMJLLbHUHBbupambIUtGyGYVzUmtEMjznhWTzEZh7fSJ8ER+ZJVPNg11fzBWIZpF9/qofi45S8Wp6sr/XzBTZ5xiq8NkCcjNqVQ8PBxVx2/MH7kx8yXM7TqJLtDnv/ecFV57/HnVHvEPRM4t00vej7NvXzp4O/DP9p7ZaxVV4Dn9S31/ltsGwtAuInYlSZwhaVHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5efb09b0-80cf-4a7d-d188-08de830d76b9
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 03:38:18.6245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaQ8z8W/rQc/xUjZ89ii8rjZpgf+r4o0A1LomlU/kltP3msUiHdZpIYwQNpMCAkXrq+/rMv5h0AGN8Xh3Li/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9671
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

On 09-03-2026 16:44, Joshi, Kunal1 wrote:
> Hello Arun,
>
> On 09-03-2026 15:33, Murthy, Arun R wrote:
>>> +static void test_switch_sr(data_t *data,
>>> +               const struct usb4switch_port *port_cfg_a,
>>> +               const struct usb4switch_port *port_cfg_b)
>>> +{
>>> +    igt_crc_t ref_crcs[MAX_DISPLAYS_PER_PORT];
>>> +    int iterations = usb4switch_get_iterations(data->sw);
>>> +    int timeout = USB4_SWITCH_TIMEOUT_S;
>> Why not have it as a const or use the macro directly?
> Kept it as a local alias since this pattern is used widely in IGT for
> function-local knobs such as timeout/iterations/count, and it makes call
> sites a bit easier to read when reused multiple times.
>
> That said, since this one is not modified, I can make it const to 
> express that more clearly. 
ok.


Thanks and Regards,
Arun R Murthy
-------------------

