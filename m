Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153D8CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 05:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864E10E14E;
	Wed, 29 Oct 2025 05:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lWa+QTy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5763210E14E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761716699; x=1793252699;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zck8AGtV91szfb7ghVV8bugvfEVEu7F4AhUZ+O2Mzvs=;
 b=lWa+QTy6HgqvQtyGNcYRV5OcOAMnYIDFcyLWCMVMLKUxxtTS2jl+UOJT
 Z2+mEg+JGpJaXn7Cbk1+c5PNesmqnGm4oqaJCGziH3cX4UP3MzqApayH6
 oCDtiGRDg22yJRcdqqKh9iD98Ep0sh3IVZNzIB8KOrEqUMwL/zs08YNTQ
 e+QKPQFoDSqPKNZVV77jYljKubN92PGPIdbm/o6Zo3GIxUoIZMZfkkpZ1
 4Jvs7cDX0wDhblXTrTo/oblMQvgCIYjddG/uyk8wEcccx/5D71y0qdBYU
 oSk8Zfjinc8fWy5dOrFDd5IrTaLrq/efg+nl+D3v7uvWvB/zatouGr8bm A==;
X-CSE-ConnectionGUID: 5A6reGTsSaqpkXYX+/yA2A==
X-CSE-MsgGUID: AJN9J5QlQ6udmrVHGepX9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74118918"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="74118918"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 22:44:59 -0700
X-CSE-ConnectionGUID: nhTSh9nTQQqg+xTos6iL5g==
X-CSE-MsgGUID: B/FzOw0kS3uh7VCAFH1frQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185192149"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 22:44:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 22:44:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 22:44:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.33)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 22:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ubk+yOod9F2h9z+e3L3Ggc1GDrbxxPAMU1Z3HXBxs0vySbP2ICKnexqeQzALOA8D5EfOFblLQa3iOwKVtgRV+27tf0DIEsfsvO98fJqkD+ljGCtQbfitK4xTgiM+Wsq8sTrZzlqqu/53KOw1BKm0WsCzFYi7lmIDsjGzH9Ur5qSQXnjHt9+AFeyndKNsgSPnZ2kvSYsRGwSjWkqOd5twJqozfYgWhfw5ottGKcGbiLo4uHKVXCxU++NMU1TGsnEl0wb2HakBk9bd9AluiZVnqsKZf1vf6kBpLJ8eJuPul/1NDQnOi37++8uP3cHLblllMkVC6S3abkc91CT2N4FQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHP6nlm4ul7GoNa3Z9nfj7Ir5qby9uSp180PbTxAUZk=;
 b=KSFUrstO/nKgaWb3EA0fu0SXC7fAMs5CEUmJhVz18Z50iJY85Gf2bVuFAhbJEjBLpC1zrUskN8Gk5fbOWq7yF9Hb9fCReaHYs7Wohfmi/APKpT6TNGyPXpKQRSqJhY0/Nnh2q512tKpQDkZCSJNoykWTZcTui2GrDS5Vez71JJsuHqFuS1EvQangOWU4P2VMxNVrrxd+L5HlqV16vI2A2QZyIhQAzbPRsWg2KeDnmj0PLRSsoCbI06kzKwyRHIAmm8pffNolWqSNBUy18fCSCWpda1FNsSDp/xxLBtwga2J1xfw3V5BSIoyCDuGks7+HLCoHhQRmEzfXYUKk4jLnhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS4PPF93A1BBECD.namprd11.prod.outlook.com (2603:10b6:f:fc02::3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 05:44:55 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 05:44:55 +0000
Message-ID: <fc5c9747-38a2-4c6b-9ad2-6ffc2f879638@intel.com>
Date: Wed, 29 Oct 2025 11:14:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] intel-ci: Update PTL and lnl display blocklist
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jouni.hogander@intel.com>, <vinod.govindapillai@intel.com>,
 <swati2.sharma@intel.com>
References: <20251028055607.735698-1-santhosh.reddy.guddati@intel.com>
 <20251029030017.749145-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251029030017.749145-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0241.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::6) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS4PPF93A1BBECD:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d5bf5a-feb2-4d08-f9fb-08de16ae496b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzBwUGJkTGRIb28rT2hKUTlmM3dRM0U2YUM0R2dRbEtLMVBSRWxwVExpRnlB?=
 =?utf-8?B?MHJySWd0SEE3S1RFMEswZWsrQk1HRHViUFZwNTdDenAzYzBKaENjYi93SkZM?=
 =?utf-8?B?b0ltSXhJVG1sbGhMR2psNmJITUJ1aDlHMnMxbW1pYm5GZnhwSUpaVW5nRkdC?=
 =?utf-8?B?Y0NKc0xNN29GOUdMbzNDM1ZIMTV5M2FMVC9oemZtUVpKYzc3UTlvMXFqZElG?=
 =?utf-8?B?YlVDWWtvRjZGN1RBNTJOaUNLRTRoaWhlOWNkcUFuaW9nU0U5RGlsbkZRMVM5?=
 =?utf-8?B?cFZOdm1VVGZkNG81NnltZ0JRMHRNMDVjQ28wQVl1TTljdXdLdktsUEt4V2dk?=
 =?utf-8?B?ZUdUN1lBbDUvMW9kQ3VwU2NsL1djT0VqVjBsbEhPTE5vOXVXSmcvcVdycWFK?=
 =?utf-8?B?cVFyUmlQeE1ic21kTlhRUDNCZ0dGcTdVMjJDUFRBMWkrbERzcGxpdnRrYU9R?=
 =?utf-8?B?czVFN1V5eC9EZXJSWUV6S2x4MlppNWk3MHV6Y095R3pmTXRINThwY2dhTEV2?=
 =?utf-8?B?Z2V4cUtSUjVSSEVqQlNIa0NqeTVyaGluSjhrdnh0d0xKV1J1VTUrN2tSeGMx?=
 =?utf-8?B?SnRweStrSGhoYkxPNTY0UXJOQXk2MmNqWlQ0NkdxQVVrVzRHVkprdWMwWGF4?=
 =?utf-8?B?a0wwejBNdDlqMmp3OXZvTmIycVdPaTMxTGRoTEZadS9iRUM3YVZBczRrcnV5?=
 =?utf-8?B?SGltV2QrS2o1aGdheEx2NWJNMVBEeXFhRDJ1R2R3RXI0cWQ3ZGhnRHdxUGZz?=
 =?utf-8?B?TnEyb3ZCb3FLZ2YrVkc5NmpLZld2R0VGRFBzVmJURDF1dVFaTXViS0RPWG9J?=
 =?utf-8?B?T2c0VW0vbVduRlNpeEtmRVNHdytRRW1LY0FDdEpvbUh3K0wrZldOSW1mWUx2?=
 =?utf-8?B?ekduSlB5cUdRWndFa2RFU0U4ZVI5SytKZGw1Rm9na0F5TUFrTU9HZ2thaFVp?=
 =?utf-8?B?M3hxNW9QTlBicVJaMVAycEhCd25hd2RQZlg4YVpiZUtRYnFNZDZHVkhSeVU0?=
 =?utf-8?B?a2tCWHhNMzF3NTZjZElxallQOERIcjkwMjJlNE94UCtaM2ZzWGNiODlGbXZp?=
 =?utf-8?B?VkNpaWVFY3F1UFlKOUtqUlVGL3pOMExBRE5WbmFpRzN1bEd5RlhUa2xBY3Q3?=
 =?utf-8?B?aVFLV1haZktyUjBLQWQybEV3Sno5dVVBZGlUQnJvVE50c2JkNGlXb2xDbGtS?=
 =?utf-8?B?VTdrUGxyWjE0ajVsc2dqcTlEb0tWeVpBUk0vV3FSUFdPNWFVakNkdmRTb01D?=
 =?utf-8?B?YWhlWVQ5SlhnWTBpazY0MW1YUUVEem1iVmNXb25DZnIzQnJKSEM5U0VkZGNG?=
 =?utf-8?B?VFB6UmtZTHVyU0NTUEhDZlVKUXFUcTBMbUhKNVd2SGVpYVlRcDIxL3padVlD?=
 =?utf-8?B?dnZmYXpMTG9RS0JBMTNvbG9xZ0dkWHAyZ2FDNG5qNFZHaFlrV3dpSGRvWGtO?=
 =?utf-8?B?UjVjVzJ5QnljUklydW5iempuVVBKaDlTTWhyRmRyZHQveVl6Tmc2LytQUFRE?=
 =?utf-8?B?SlM0WFl6MG81OEdJRTlYYmV6SURjUHpoOGdXTUdxSXFpZGtzWUJTUEdub0tr?=
 =?utf-8?B?aDBzV2VXdTE3TnF3aFg0RXkvaHAvS29MckFaS2s1R2EvSUpMMEpka0dVUzQ4?=
 =?utf-8?B?TEZYbkV4YU92eFhwbXNmYWxUUlFwK29jcXhsS0tEL3RCdU1ZbEZtUjViYTZE?=
 =?utf-8?B?bGNBOXk3d2d0RDEwWVZrbHZSRWVvTmRIeS9wa1dYYVB1MEFGSkZacUxmZ2pS?=
 =?utf-8?B?Q1VMOXJMY1RiREpXVDVRZ0JpZW4wdVZMVnZYWnY4WUxXbGxTM2Myc09wZ2Vn?=
 =?utf-8?B?MmxSbE9vYzl0V2VodmFpcnVJeDdwYWFEbnluc2lIdGo4dFlNYkV0aVZacjlq?=
 =?utf-8?B?eGxOU05LNWF6dmswWEZaMGZRNVlVcjZXMWdDcGw2YWJZVHkzTWsyNVBiUTlW?=
 =?utf-8?Q?bszzHmyDVPadfOYcIOuypYlsqzfM99q8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NW1qWUJVS1lSaStZeDF2YW90c1NqWHZKY2tjMVhRSWl3Qks2OEpnR2lKQmwy?=
 =?utf-8?B?WnlyOG03R3czYzdMUmR1SmxJZExjVmlJUGpkdlIyMmtBTE9QNmRMRFE3MUNx?=
 =?utf-8?B?VGtjMjQxRkwvOUp1MnU1K1VLVFBlTkF3clhjbUc5d1pad21oeDR5c3VPTEFN?=
 =?utf-8?B?bkpZemlMOEVuOFh0RDlndFlwSkJnMW93bE53N3NwVnFOcGlQOVdCMnBTNHlY?=
 =?utf-8?B?ajU2bURlUmlIa1gyRkNGQjREU3JZTVd2dHRMNnMvUHZ5MUl2aUNSckloTS9z?=
 =?utf-8?B?akhkOE1rZEhJYVQ0WlBJZHJybVA3ZlNTWkhxUThEMEtJeGZoMEk4NVkyUnpT?=
 =?utf-8?B?ZXY5UWM0N0RkSTZQYWRGcVR6eHQyTklBVEhwck5zaGU3MjNHUTc4UkFDSmZG?=
 =?utf-8?B?eVRYSXA1eDNkT1BoR25lNmZiUDFZZk16RWNMZGpBT2FmMGk2TmRkL2ZDbC90?=
 =?utf-8?B?cHQ4RzNVY2Q2RWl6aGRtdnBsUWxXcjVvWDdueXl1WGZlUWp1a0J4b05GS1RP?=
 =?utf-8?B?bWl5S29MOEJ1WHBTQXROTkMxbGRuY1QyNld5WWsxVFZGZnNDaXZOazhKZHBQ?=
 =?utf-8?B?QklCb05yQkpvUEhGbStHTlN1NUgzWldNL2dvTWJ2RlNFSXVTemRPY0FIU3lJ?=
 =?utf-8?B?SnN5aFdGSURCQUlyTkVVS3NSc3YzbU1hVFlqOE9mV3JMVEJOTXh6K3l3TTZn?=
 =?utf-8?B?MUwwY2Z4eGtuQTd6L25uT0ZURExYMnVIRlp5KzFJZzJ5dG0yM21EUGp2dXNi?=
 =?utf-8?B?bVk4cUNRaytoOFBYZmJKRFZQdW85aitreThuRjh0aDBtMi95dm9XTDhWUmEy?=
 =?utf-8?B?dkxDR3YxUXVEalgvQnJxUmlPVkJoRXg2eXdXTTEzcW11dThJa0lLM0M3VTZZ?=
 =?utf-8?B?Z0dIdDJYYWhXcWgwaUZ4QjlkMnVoSGQ4NVRUeTl0clNBalZGakd2eTJyZDhF?=
 =?utf-8?B?NTRTbDRGSGswL2d6TG9STXhUd3Jtc2R2SDVVMHhRb1VLbEhzOUdSbzRJb2lG?=
 =?utf-8?B?amlHVGd1ejl1bk9mUFdadWo5MWxySUtDN0dhR0NuMDdWcG1LZEJybzhINFFp?=
 =?utf-8?B?YWFBV2tGbFlxaG4xQ0d6TXhlOS9LV0lTNTRjTmJQbU1yalRtZmxkQ1lqWDdr?=
 =?utf-8?B?dmJkZHpYYTJsZ2Q1MEVzU25DL1hhdi90MS8ydDhXenZZSUF6bGJqUytqcmZX?=
 =?utf-8?B?WHRjc0QrRHliNnBlRlo4RnVRUGxlWTZSd1I2WFF5ZVZaSkdkTSttY3ZIQlhu?=
 =?utf-8?B?ak5HcGxBM1VtbHFOeS9zQXZlQjJsNVFZenVUeXoxdWhQdS8vZWNyeXFuOE1F?=
 =?utf-8?B?K1dpU3FnK3BJcm5mVzZodUxvQ20yTGZTRFVQNkptcUU4bHFBOVZIdmEzOWQ3?=
 =?utf-8?B?WGVHWkg0Y3F2a0xLQzQ4Tk9GYzFIWjdtNEUyL1M5c1dreUh4K2dHQlRLa29I?=
 =?utf-8?B?djdSbUlBbjRZZ3kxN08rL1EvYkgxejE5UmM0OXNjd1NyTW9lRlR5dVdJdFBk?=
 =?utf-8?B?blpGUytiZnFmZFRlNTJOQU8vOWUzMmVBcEZUMUZZL1MyQmJtYmFBa0dWS3Q0?=
 =?utf-8?B?T1BiU0FHQlZIYWR2STFRM1Z2YTBKTFRYTUY1aXFDTFk0TnpVZlk5YWMybW80?=
 =?utf-8?B?aytrWHZuQS9QK3NML2UxQkxPR1k4ZjZmL0szTlFKcGNuVjYxRWZ0cXlXTWkw?=
 =?utf-8?B?OVVJSGw0L1F2VlpsME53TVhnVzZjM2hjVFFEbk9QWG5GMDk2S1llOXQyejlB?=
 =?utf-8?B?ajhlK0VaSzFYajJUR2NWZHhrZkdmUVJNa0laTXZmTWh5VFFhSDhlZVRrRGd0?=
 =?utf-8?B?WGVzeThPd21LWjNYY0RWZk90YnpvdGNQTTlWejJrNGdpbzhaV1llcDNNajhM?=
 =?utf-8?B?bnNpVUJZa2ZVODN1UDFlYzZnVE5XaHVZNHNvWlJmVkVHOFJLZ2pYWmxsYTBL?=
 =?utf-8?B?SDk1L2dBaDh3THhuYUphZEhDTkZ1VW9zTjRTRndlVkN3TEhnOEZLNGYzenFo?=
 =?utf-8?B?c3cwN21kRjhxYmttU2xWVVZHN2hhUUhZdnAreGM0cVZhdS9Pay9za2NIS3BG?=
 =?utf-8?B?dU9mRWk0MUl5elBqWmNHNXVvcDJLVTlkS3d2Lzk5L3owbERxUENIcjUzZ2JK?=
 =?utf-8?Q?wIMq8vmU5s6NfPwLg9IbxSxAZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d5bf5a-feb2-4d08-f9fb-08de16ae496b
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:44:55.5470 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2gRwbhY6EHiK42d3yExGjuckcF2sGkyGuRDTjH9N9gigQHI7rF8IYYAmcygcRMzCvcARlH/8W1ihPiG5jscvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF93A1BBECD
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

Hi Santhosh,

On 10/29/2025 8:30 AM, Santhosh Reddy Guddati wrote:
> Remove frontbuffer_tracking subtests from PTL blocklist

Please mention 'remove fbc-(psr|pr) ', as we're updating kms_psr tests 
as well.

With this updated,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> Include fbc and psr2 concurrent tests to blocklist for ptl and lnl as
> invalid.
>
> v2: Update the commit message to reflect the changes and add blocklist
> for lnl also. (Karthik)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 8 +++-----
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 6 ++----
>   2 files changed, 5 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index fd2065659..cd1e6d19c 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -162,12 +162,10 @@ igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
>   #########################################
>   igt@kms_joiner@basic-max-non-joiner
>   #########################################
> -# FBC with PR/PSR2 is a valid skip
> +# FBC with PSR2 is a valid skip
>   #########################################
> -igt@kms_psr2_sf@fbc-pr-.*
> -igt@kms_psr2_sf@fbc-psr2.*
> -igt@kms_psr@fbc-psr2.*
> -igt@kms_psr@fbc-pr.*
> +igt@kms_psr@fbc-psr2-.*
> +igt@kms_psr2_sf@fbc-(psr2|pr)-.*
>   #########################################
>   # DRRS not supported on LNL+
>   #########################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index 4c3803235..27261fa00 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -153,12 +153,10 @@ igt@kms_pipe_stress@stress-xrgb8888-xtiled
>   ##############################################################################
>   igt@kms_bw@.*4-displays.*
>   ##############################################################################
> -# Expected skip on PTL, FBC + PSR is unsupported
> +# Expected skip on PTL, FBC + PSR2 is unsupported
>   ##############################################################################
> -igt@kms_front_buffer_tracking@fbcpsr-.*
> -igt@kms_psr@fbc-(psr|psr2|pr)-.*
> +igt@kms_psr@fbc-psr2-.*
>   igt@kms_psr2_sf@fbc-(psr2|pr)-.*
> -igt@kms_front_buffer_tracking@plane-fbc-rte
>   ##############################################################################
>   # Expected skip on PTL, UJ not supported
>   ##############################################################################
