Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF7BC531C9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 06:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6004D10E638;
	Fri, 24 Jul 2026 06:38:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNmNSX1c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B098310E638
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 06:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784875061; x=1816411061;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oypC2h0MmYcVzJu0pzvPIujZaYAPPBNO++4ISnmjJjI=;
 b=BNmNSX1cjD1NKjBmIPz3mfbgzOR+AhOy8WB7QLUbx3mPWye16pcdyWwc
 x0mtVGMuL29CzcbqK1IGUiG1/pEj+CnOofgltdJuRJxuBKZuGavxXqNp+
 3PFVjXQ8opjzJrx+yYHxzBRFI+TeuihcLrn612Bc2VXx4I85DWF9PXYq/
 ABDwBokDoPcRLTGJrFB+9IbeVzYMk3F6JvL1nwCq84QpIepwThPr69DYh
 m/s82GfBrrGD9ZQFpq3pBuslGRnAbS/hqQVOO640qASqj5ZfZw3Y29/WN
 TVPBRpPrLgyor5TTssKacVuFQopxIGSQ1QK30icaqh8czbtG1oXO1gtDN w==;
X-CSE-ConnectionGUID: 95+Yl7E/TZiz99Sjd013JA==
X-CSE-MsgGUID: I6fFPD25T86JObcm1K3NTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="103079303"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="103079303"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 23:37:40 -0700
X-CSE-ConnectionGUID: uYJMa+2RRR6xC5uOLxnhfA==
X-CSE-MsgGUID: /nPMoyoERt+787a6gYi3LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="252306199"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 23:37:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 23:37:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 23:37:39 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 23:37:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERv3phr/FVoosqJ61EnWS2EWp3sud/XzcDE4l7zdtjGZcrdi2l6UNbMJUcc3iUowOsYwxillwxTfhjSMwy3MBapKkzFLgXOFQ5CqJx/44t5lNI0WPTHn/CtyJaOXNlV8nbSeBK3Ovi+K0lWCZTemt9ebN0HqZPxT432fQ7LbmWt3vQikWaymHMLSgWyn3/LcEcQAr6HmDeljfI+b4JddDHjFrAb6iyw6fJTXYmbsZLZS2AgV2A1JgGfgZfdJONas3hY0e7iGMMd4lWj+7Fl3sI4XJhGnl1nL9lLl6AV/ZUEcBDzms2AeRboea4raVIQiBivY9OGTB8aArMuX8AqStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yus7/wMvFStiXNLD12j+G6yUr3pGw/gF+htmhJag9gg=;
 b=Xs/of+K3UvRdPJGF8iOBTFd9EeF45tn92b/vo3NqSX8pAQEs2RBFOzsIRc5HooH6k44JcEGrFOdvlo8vNFZtA8R46GCwVBkmElmIY05G7FjxaxyJPaekLvQ81gUX0GTrnHph9Z7P5CQxPZbiYMp5SIqXSTDw6Qgib63RAiTST3w5dE+XYWNoo8xKb7WhCzuGp98NToJQdMjoH+639mFWNn4eX8qyil/YlVYDpVkAdV9u6QZyuTD4ozHr3H+7f1iEW8fhKNZmdUL8Syvl4+HXKmHJnraBvECI/MbDNEcSaQQz9nlOAmzFmWe/2ADLTdiJbL0e7WbAevZWRUKtmJdVxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA4PR11MB9346.namprd11.prod.outlook.com (2603:10b6:208:55f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:37:37 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 06:37:37 +0000
Message-ID: <95dc5edc-3907-421a-8354-84ad969ea616@intel.com>
Date: Fri, 24 Jul 2026 12:07:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_kms: Add platform-specific joiner
 exception mode handling
To: Sowmiya S <sowmiya.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
References: <20260723134355.337709-1-sowmiya.s@intel.com>
 <20260723134355.337709-2-sowmiya.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260723134355.337709-2-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0266.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::13) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA4PR11MB9346:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0559a5-ada4-4635-dff9-08dee94e0cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: Z04/Z6P1rpN3T6qet+FGpw68JVYTidYmiXWyjSww2gmberkS0EkQ6guF6TtOTkKsATRh/T8lspR1pK8TsDg8A9BckbW81qFYTrEY0xaqa1+ig3ShLkGr7knQ4Dcg6WmpzEhy4unEo9hsahzOssZu6mFzw+nAOwSiy7PyreZ2dq/0aEwqFOyx7K7h1PQUiULoAwz8CMGJOHvy0Yr4H7huMdGQKnRkgvxvdMDptiX/7mKQ3ZIHywAxCe+xxKXZ7gdqdZYzY36X2xaRUGt8a4Xd24SHKz9wkwyiO5Va78D9lcP3tSfhta6agz+umbJjl89Rv2hR9jO0XPyvTEC+pBEFU5YQg7FbkZTKtLvp+peG6/uG19TKpwefxitHlVKztQFNqcxoPFFKExPshT78RZQJvNFt07emZmK2kptbHnA2FYHhljMJNNFfUsiTGbV5oucRODC+6Ayii6v0cUe7Uiqq4lfTWI23oZZXSoGyub8Tj4FoihpjVV/QViXQ5aKZT90vIQMNVZGb8OXDbMhvBj68qIPp4aaZksOwHMNLps2v7zwEktlNsB0mOaRzQpdRUf/rfXhdiTOIHCGSxrj0pw9HnofA4xo+CFgd16aVjY30/NFyzptKQxlEf9rhBpMpR4OUmr/vI9o3pZz19mNB5jlpA+oyMKjo29USUK0sy8kv2hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXBNRXFtQkswTi9QNHh6WnhVQjVtRllISG9hV2EzazNvdllWM0ZBZmtOWE1o?=
 =?utf-8?B?cEVZQUVlSDZCRE1yVTFaVVVJWnU1TVhsM1M5YXNXdFNydHFBZVZHVE9sVzRL?=
 =?utf-8?B?VmU5enhnRzdjQWpGUkJXZUpKc3dXNmxMRlZmdmtuZENNamlpVVZaeGZVL1Vx?=
 =?utf-8?B?Tzk2a2lucVkwV2w1dnJoUFp6eEN2by93RjBRNmxweXZORWpqTE1CbmJFQTR2?=
 =?utf-8?B?eERUSWViLzVMeFh6YWNBNWY3ZVhtMWNKME1PZlZod25wdnFNLytNWXBCYTFL?=
 =?utf-8?B?Y3VPZ3ZjbW5tZWk1M0RzWFRYc3dGVWszbGFFcmYxelI2dlBmd1BuSGZrc3BS?=
 =?utf-8?B?WTluZ2hBcEpUcmt2eTl6Q2JOOHNReTV0d3BjSldQSmJ5WUFqVUNPYVU0eE5q?=
 =?utf-8?B?L0tLMVdJV0JiMU5LNHdNVGgweTNVYnRSR1NsQlQ2ckoyRGxacWR0VzFkT2sy?=
 =?utf-8?B?ck1rL1hqU0xTa3Y5Zlk3T3hxN1pBME1Rc3IralhQRklGeWRPcnluL2RQRUdZ?=
 =?utf-8?B?VDg3L3BJc2lrZjNUZkRLZUhPVVlXaENCUHUvOHlDQ1pFQjRuWTc0UWh0UnlU?=
 =?utf-8?B?Y1MxVFRDdlMzc2tSNTFFSFpiTXdxdEEzYS9KY1VrbEdHZUp0TXMyWkpFOTUw?=
 =?utf-8?B?N2dQTXZLaWRtOWczWDUycTZLRXhFb2k0WldoVHVrZUFZem44M3BkMmloYkgx?=
 =?utf-8?B?WXQ1K2l5Yit1YUhmRTZOZUt0YTB6YTVYN2IwTHhSWng3Tm9Xemcvb0hsbHJp?=
 =?utf-8?B?cWlJanY5a2FHeE9DcnZSQk01Z1d2MzlkQ0RsY0RoMGh6cVg4bmpTOWRtc3Ns?=
 =?utf-8?B?TWtzTjJJKy9CTVZiWS9jWXdHSkJVMDZhbGNQaitJNnpDWVdwWVFNbmhINEc2?=
 =?utf-8?B?OFE1MUJIOHZQcUFRZmk3TkxaZ1hJdUp6dnR1R2l3NlNYNS85a2QxSkpZb2tx?=
 =?utf-8?B?RFU1ZE1hSjFmWXlLeUhtSGhaYkM5YVpRWVBxK2dCR2RDZ3dHdEUvV3p4ZU50?=
 =?utf-8?B?djJucEVoRkZOOHJFZXV1NE81aUZRZ1FIMDdJV0swNHovaGR3TU1HWHdDSnh1?=
 =?utf-8?B?TGNOWC9JbGJ2T08zcDhub2JoU0R0UFI1dXBDTWtwYWw4QTlrOVZRbEhVdlBJ?=
 =?utf-8?B?N0RMdHA2emZGbk9KTUJveEhXN2hzdHcyWW1EZjFWdFpTeFE4R3kxa3BlNkRX?=
 =?utf-8?B?c3dpelJGZ0JQUUVFZ0FZcDFPRHN1ck44VkIzUTEzRGp3ODk2Mk00NXVHV3lq?=
 =?utf-8?B?eU1jMFBLWU85ZDI5TzlaNUYraDRPU1FuRWJKTnZqWmRRWjF0VUVDczRTOC9Y?=
 =?utf-8?B?UDJoOHV3dzZsMHhwcmRPeXNkQ0h4S0w1aHBvOUhPN083VzdOQy9Ubk9sRGt3?=
 =?utf-8?B?dlFJWW8xRGJWdVhwampHK1BYM2RWZ1JOczFyN0Y0UEhtTFRlV213RVBMeDVP?=
 =?utf-8?B?WmpRNXVwY295QmlId0JqOENDK3V1VWhscnhtZndEZlBwTDdmNWFoK0RnYmE3?=
 =?utf-8?B?TllHYXVRUVp3SlJENGZhSnN3c3E1STg3Uk1obXNIa1VkSzk2bTlnSFQ3N0V1?=
 =?utf-8?B?bThCU0F4MHcxTzNvZ0k4ZWF5cW1McGNlcG5keEJLanlCK0dQczJDWFZmUFJa?=
 =?utf-8?B?ZjVZTEhqNkd3QmdPOXZtK0tJRDBxemROcHJRQ25yb3FVSGhSM1RNRGVNckdO?=
 =?utf-8?B?dndxUDZPSUQzVGE0R2RGUmU5VWtSMUVNOW1Db2tSbGFXWWdPUTNvVmI4c1VL?=
 =?utf-8?B?ZlNKUFozM2IwZnpGRmNkMk02aUNuMnlVSkVGMTNKTFpuQklDMStNTUhpdkZL?=
 =?utf-8?B?QkI1d0lJeUhZeHMyZ0lydnVqM3JGRUFlY3k0MUdJeU1hY0szNnZqT3VuSUJE?=
 =?utf-8?B?cStYSmFKUWVpRGlsMkRBbmdaVE9NYUxicVBBWHZiUXVlYjkyeE1ndld5ZXJs?=
 =?utf-8?B?TGpmWEFlZ09DaHAySCtCWVFnQU1nRzFCQk4reSs4NFcreTluRUk2eXcvODhp?=
 =?utf-8?B?aGQ1Q0RFSUNzaDdhZzkraUdQUjdIOGpidHdFNGF6YjIvd3lNUHZpT21xendY?=
 =?utf-8?B?UnY3SVNKR2ttcktXeGJGL2haQUxvMTlQSVNJK1BlTTQ1aEZkN2hHbXFPYmZy?=
 =?utf-8?B?RlhtWXVDTzVhYjFwMmF3bXcwUjJwMVhOZzNnWnRWTlYyS1BIalZSdTVSelU1?=
 =?utf-8?B?YVNQNzE1RTloWlpoT0ptUk9sZVM4aTlkVlBTVzdwUzJhZUVzL1BmeFZYRVU4?=
 =?utf-8?B?VlVNRFpNUWZ6Sms1TS9tZURyTDl4ZUhabTdkM09RMUV2alVlVzlpcGZnbUlF?=
 =?utf-8?B?eWdER2U1U0lNSEJ1dmhPUUgyc0ZROGtlaDlmSTI3MVU0ZE9LZjVFaTlBNVFV?=
 =?utf-8?Q?ap2aXw36BlZKN0a3o25Ec/8yq0tNg6kFM2re/?=
X-Exchange-RoutingPolicyChecked: lmgFeVFpuxmpRGDGR3Y2h1RgAkPwT+OcBmj+dbTSfg+P0HJw2pj1mlnFzHiv+5QGZPc5N8N3Rm6A1Dz2slHYjIg1Px0lX5d9SDWJufwe8EkxRyRqMHeYPNGqGCeWJmKuM08Kpaa+yb2lfYVbiKNjmq8rzcFILSBCM6YdKo9yf8brwZTjpE6mW6mZTyz+kdAJJttcMBGZCYpZZyRACo7KyokeWLVOeBsPaZA2dvOGMpZ6EhsrqRAwlVrHjA6Cky/gCedOJb+iHRtWb1LU6bKUL1vdbCrkGdNaZ6xgPwJ7uMDd7WmeaAt0gfUqvnWAo0H8WYmgaqrWxGZh+M5vbulIIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0559a5-ada4-4635-dff9-08dee94e0cd6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:37:37.0330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hG42RxCYNvzAMwAH/rK1UOt9IDiWavdxUbRUuVUf/fKYDtCngBdfUCIz5f9Iu7/jTOxQjHyZLF+jIaGwAHrByXzHqpbr8p6LCdAEjEL+lln5hWq88AyzDNcwQYzShwv3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9346
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

Hi Sowmiya,

On 23-07-2026 19:13, Sowmiya S wrote:
> On NVL (display_ver=35), a higher max_dotclock causes modes like
> 6144x3456@60 to pass the standard igt_bigjoiner_possible() checks,
> yet the kernel still enables joiner for them. Introduce per-platform
> exception mode lists (e.g. nvl_joiner_exception_modes[]) dispatched
> via IS_NOVALAKE() in a new mode_needs_joiner_exception() helper, and
> wire it into igt_bigjoiner_possible(). Also add IS_NOVALAKE() to
> intel_chipset.h as a combined IS_NOVALAKE_S() || IS_NOVALAKE_P() macro.

As there are no changes to chipset.h, please remove this.

> 
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>   lib/igt_kms.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 50 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 2eefb773b..bfa6dfc0e 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7058,6 +7058,52 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
>   						   HDISPLAY_5K_PER_PIPE;
>   }
>   
> +struct joiner_mode_exception {
> +	uint16_t hdisplay, vdisplay;
> +	uint32_t clock;
> +};
> +
> +static bool match_joiner_exception(drmModeModeInfo *mode,
> +				   const struct joiner_mode_exception *list,
> +				   int count)
> +{
> +	for (int i = 0; i < count; i++) {
> +		if (mode->hdisplay == list[i].hdisplay &&
> +		    mode->vdisplay == list[i].vdisplay &&
> +		    mode->clock == list[i].clock)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/* NVL: higher max_dotclock allows clocks that still need joiner */
> +static const struct joiner_mode_exception nvl_joiner_exception_modes[] = {
> +	{ 6144, 3456, 1413390 }, /* 6144x3456@60Hz */
> +};

Add a #TODO,

IGT cannot compute the DSC bubble overhead the driver adds to the
effective pixel rate, since it cannot estimate the DSC parameters -
whether DSC is used and how many slices. On NVL this lets modes like
6144x3456@60 pass igt_bigjoiner_possible()'s clock/hdisplay checks,
yet the kernel still enables bigjoiner for them

Add mode_needs_joiner_exception() as a stopgap.

++ Ankit> +
> +/*
> + * mode_needs_joiner_exception - check if a mode requires joiner via explicit exception
> + * @drm_fd: drm file descriptor
> + * @mode: libdrm mode
> + *
> + * On some platforms, a higher max_dotclock means certain modes won't trigger
> + * the standard clock or hdisplay checks even though the kernel enables joiner
> + * for them. Each platform has its own exception list.
> + *
> + * Returns: True if the mode is a known joiner exception, else False.
> + */
> +static bool mode_needs_joiner_exception(int drm_fd, drmModeModeInfo *mode)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(drm_fd);
> +
> +	if (IS_NOVALAKE_P(dev_id) || IS_NOVALAKE_S(dev_id))

Consider to use display version instead of these macros?

> +		return match_joiner_exception(mode, nvl_joiner_exception_modes,
> +					      ARRAY_SIZE(nvl_joiner_exception_modes));
> +
> +	return false;
> +}
> +
>   /**
>    * igt_bigjoiner_possible:
>    * @drm_fd: drm file descriptor
> @@ -7066,13 +7112,15 @@ int intel_get_max_pipe_hdisplay(int drm_fd)
>    *
>    * Bigjoiner is required when the requested mode exceeds single-pipe
>    * platform limits, i.e. hdisplay is above the platform threshold or
> - * clock is above @max_dotclock.
> + * clock is above @max_dotclock. On NVL, the higher max_dotclock means
> + * some modes (e.g. 6144x3456@60) need an explicit exception check.

This is to be added as a FIXME instead of here and above 
mode_needs_joiner_exception(drm_fd, mode).

Thanks,
Santhosh
>    *
>    * Returns: True if mode requires Bigjoiner, else False.
>    */
>   bool igt_bigjoiner_possible(int drm_fd, drmModeModeInfo *mode, int max_dotclock)
>   {
> -	return (mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
> +	return (mode_needs_joiner_exception(drm_fd, mode) ||
> +		mode->hdisplay > intel_get_max_pipe_hdisplay(drm_fd) ||
>   		mode->clock > max_dotclock);
>   }
>   



