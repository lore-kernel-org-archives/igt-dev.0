Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69B8EFCBD4
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 08:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E85310E1A1;
	Mon, 16 Mar 2026 08:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StH6O0dj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9FB10E1A1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 08:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773648454; x=1805184454;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=X5HzDEXSR/kznYPvHIvKPvipvWSkYh3WuLWoJiZDaa8=;
 b=StH6O0dj3LFGaa4gDPrvFEGU14638crc4Z49ZKtzpIlz3/gGEKpt/4SH
 Z0pMrpgtCR9IFVj9ASOqt/6oYH2DnTaFPrGA4cPNUpYV3PL4n9+sHlHpW
 418k2T0/1yqh/VtAGsWlsXNwbkQ9IqwD96YOlfR+JYFC6+GqWgC9AswHw
 LRfywZaaBiLu5ZgoEZY91wn3/FbIfDNSpPDd/EWsVTKHK6B7mkmnx+ve2
 KWPHCLIddFI+3AfBmH4JvvP9mR34ISTdEBGJA6YVwu+w+NK/WIEvBQW70
 Fg3j8DtsbWtdlyVyiL6ZEoSjY5Sqbj4sWupoaJZbx+XMEa+m5LWXR+dVG Q==;
X-CSE-ConnectionGUID: f++QPZnCS2WbYMwC/SEenA==
X-CSE-MsgGUID: otuYao3WRCSca/gEUzV4xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74543001"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208,217";a="74543001"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:07:33 -0700
X-CSE-ConnectionGUID: GBz9RMKlR5WP9p6o0wnHDA==
X-CSE-MsgGUID: bWV58inYR1aRKkuDTbzLTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
 d="scan'208,217";a="225949599"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 01:07:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:07:32 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 01:07:32 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 01:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBzwB4okWwyIkparwIq9W9+zFfPrv6a2XHlQ3J0T7F+8/okI9eqINoxtfnB5WS2+7chnpFLp67fyRAT9KH3h2v0zI8OwZW/8XhYlLOsfJicBHT3gGbjKcWAtC6K8MWBqa+YMBElTIxkGYk/dCbxC24iP4+wiA5sS0vylL77t4JhicxcAzePDYO380kLzMlMCpB7yUXE47t1FcWE+RKU6fXzWPRbcBipMowkHnpsJvrbn2XHurJihh5fBgDWDJWwuhU/voZpgA/7DVQl294PAR0WgkBWThSiCFC6B4YC7K2UsuatxN1imRwa3X3KdvtydHz1iFx7NaxwUiIybmAYZdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4npIfuCfvdggLKonAd/h9QLVUqXte8JrG47649ZiUlw=;
 b=IxUeG2h41VP2s5T/uxI9VURW8BqbOvt4tV0OOp8u6SitFcPni9rpBhJBRhkq3uEWDRtBTV0V6vW3z4GzMngLfAP2ODCI9O0Jtq7cNsr8RfNPNFOpZleBT5G0ybrfjIUKkkj84N4BC8Vy5r/goh8+zJEAQoCLRPxHlhOt+m6O04bi+P/Kmc55B+sI12AL+tZC3LfVb3BRWArF8abjnV2eoCFG9TSFmVYZrduopiuk/diOZoQvS1WvfvmbqwRPQ2dFOCBKMP4ykagrxcpopd2BzZ+btv11CHlS95ukNDlVSidFNJKf/zMOpOCncHSoerDTATHx4s1VtrKiisAlbgBNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH3PPFE80710477.namprd11.prod.outlook.com (2603:10b6:518:1::d5a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.7; Mon, 16 Mar
 2026 08:07:31 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9723.016; Mon, 16 Mar 2026
 08:07:30 +0000
Content-Type: multipart/alternative;
 boundary="------------2WiPpGPtXJ83m0ST1bP2RHYt"
Message-ID: <9f3f1bd8-db5d-46d5-b207-ea3581744c7f@intel.com>
Date: Mon, 16 Mar 2026 13:37:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_cursor_legacy: Prefer tile4 modifier when
 supported
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260316033807.24078-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260316033807.24078-1-jeevan.b@intel.com>
X-ClientProxiedBy: MA5PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::16) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH3PPFE80710477:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8f6643-bfe1-4b09-7480-08de833311ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: amU6jkJQJfFk6Y50Dfgh1uV+NqCfXnUtNzjOYaDi6Ym2rnhoyh4zCNoFaH1lXUDFSd36e7w9G0x7NQiqBb7AtQzo32bTipKt7Zah2VDQ1OyxuYUVN+MAA2hs9yZpt320mFpv1BTGxaNP6aWNl5YGhKLB6P/oh0XD9gQngqx44xMwWi/coaqXfQzjIUQedntv0U3xLa3fexMjO9fnK7xDnZaln3hUEIxLLJzweVtwGEdWHXCUK7d6+xVnBJDl7a88G8Ailoqr8t8aue9AaonYjUgCGvmHJ/5MWUWZWX1pD7ON/yAnree2mQ2iEoIhaRg4PCpEtx6OoAfa89A6Dfmw0vgwrighU7swP8JDdLz6VB7MAp6XHVxEp43/16lg/qMa9YTaQ8bXBohZYBML8csQ8OA8LoLfSmC5ozK2B9FXTtOntO9ZkmUVX/xcmXK77T3qW1TkRphohBSVzz5ajyvyXObSYfvxh/rISHlIrrogJ22+1kskMLkArbMDfb32vvl+CBnphKkMFdmrSSIbOveyrdQgKW8K578m1DBe98ZCX4i13SwQP+A3vA2fhxsdi+1BZsMYk2teBo0wo2vPkHAtO0LCj5B8Ht7ApHSdQqsRtbGvUlDcDk3MQ7KnBodAG8v7nwuifTFlHQPqYTPxVutXivrWWTS7bzrB55QS8iVlp7lS483ZSa+zDepE1jyqMABgBS6A08w6/GLW617/q30sGyKciN6hsDuqDD+dYqzu5/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkdWVEJ4RnMzUXYvYVA3N3ZBMjlLSVFENWRRQkxuZ1RVOEtkcnVwQ0NXaVg1?=
 =?utf-8?B?SDc0LzFWRklWY0lqNEhuYWFrc21UQXk5ZkdwajhOOW93eDRiZTErMDkxWlkw?=
 =?utf-8?B?VGYzbUFad3FxdGJ4TitqSUQrRDVTUEgvTmFMS2RCQm9Ta2FhdldDd1RQaks0?=
 =?utf-8?B?UDhmK2UrZFEyZmRGMFJTMkEzQm9NUjZwR3VEK0xtdnlkUHk5NldVQnFkd1Nq?=
 =?utf-8?B?Z3FhSnhjbi9KWUJualRpU1pJRGZKVVRxckRDREoycHlSR0dNeE9ud3FDcC82?=
 =?utf-8?B?SFNLTENONGNxWXBEWDErODB6ZjdVTXV1R1J5ZlIyZGpUb0tQcWVnZUpYY0R2?=
 =?utf-8?B?cXRITmtJWktVcTZpZXFoREt1YytQa0JCaG5CVU1INXZBNUZFSzlJSHJ0VEQ4?=
 =?utf-8?B?dEc0bE1pUzQ0NWJSZlZXY2J1SjBveDRjbTFlNFpRRCsvKytWWGVxWUhMeEtv?=
 =?utf-8?B?MGRtWnptTkYvUGtIVlRMOFZ3a0V6K3ZWN3ByVkV3NE1acXlCd0tWM0VWTit4?=
 =?utf-8?B?Qi9KV1ZtbmlVbU9nYkI4YXpVZTNNVkxUS3ZaVFBIcXROd29makVzVk9oWHU5?=
 =?utf-8?B?MzVTcDlWSzc3d0pLWFptUnBtaWI4M2NSQklmU0V2eHljM2U2VW5JcTlFSmJi?=
 =?utf-8?B?SFBYQTY5dHN1NzhveDF0V0tLWVE2R2c5Uy92WmhvamQvaDlHa0xIZmRGby9O?=
 =?utf-8?B?T0VLaUxTSGtlSlp3QXZub3MwalhmZDU1TFIyVW9DMStlWTNKdkVWR2hNS0xB?=
 =?utf-8?B?OFVSajN4TUdMbnYxa3RIZFBVWmZ0OGc2OVZUalN4bG5Hdm04aGRXL2hPaERX?=
 =?utf-8?B?cFZDdkVYbEZoVDlReFR1R2FTQ0NkSkk2NTdSMlRiTU9PZ1M0QXRObXQvN3Ix?=
 =?utf-8?B?ckhBWHRiRSs4TWI2RWZYQ01JRVN3b2dBTVJ1QWd5bTNXWGlUSUlNeE5TVW42?=
 =?utf-8?B?ME4yUTMrQkhYN0xqUDJOckc5L0s1ZlkyTUk4bUF6TlRFTjRYRUNpZkJxaytu?=
 =?utf-8?B?L1cyNWhPalNYTm1YN0VLNlRGaDMveG1VRmplRHErTlZ5OEFtWnpwYUVsUWda?=
 =?utf-8?B?cEVKTlJUbHVlUXNWUnYxOVlkOGJPMjgwVHdYZWxUcVhWd2RicnpnMEFPMkNj?=
 =?utf-8?B?ZERtZXp2TlVseFp2cVlTWlhoNUZLYkRqVmZXbTh6YURqNExrc01mNjFqSndJ?=
 =?utf-8?B?bkwzZkllRlVwVjgwMUZISDFad0RYeGVvRVlraFpkOHoyTXhsU0pkd2R3c3pJ?=
 =?utf-8?B?VFlLTU4xNVNhWkpBNGpFalRRWDI3ZDJING5WdldIWHJlTjNSRk10a2dodlRi?=
 =?utf-8?B?TitjeFN5WHpraVE3dXdnSDJpSVFyb0docTlvdkw2Mi9Kd3BNY0hiZkxMVmRX?=
 =?utf-8?B?bWpvclBsNHBFZGxtaU96TWhkNzArZjVJTldid01jcVUwRXNwc01BdFBRMWhp?=
 =?utf-8?B?cG1tZnZ2d3pvTEJ1TjVISmNDcU04azRHTnRBQ0pKUzJLRnNaNTZkK2E3MlhK?=
 =?utf-8?B?QVRTSkRhcnU3WmM5ZlBiS0ErbXVNRG4xMmJadmRkTlppV1BUd3ZIRmtwQjVv?=
 =?utf-8?B?amttTVd0bmFidUE4a0c0TldTaTNlSjdZWmVnM2lRaHViejJsRnZwdnJrUVc5?=
 =?utf-8?B?MEZIa2thVE0zMzdqcjBoeHMwRjUybC81Lzk0UDFtMUJVbUNPRU1CU01wQkdJ?=
 =?utf-8?B?OEgxcUFDb2trbE9wVGlsMjdWUUlUM09DVTN0RWZaVnZUODNiQjM1Y3R6QThB?=
 =?utf-8?B?aXFUam0zUFJ3NFE4MmxpMk1rb2lrZlZ0MlV3MVlJOVVpOS9CdjQ3bURFeEd3?=
 =?utf-8?B?aFBudmlQVStCOFlVeE9NdGNmdm1wSXhzeVRoNVFnS3QzNlRVV2tZNGVsNFJC?=
 =?utf-8?B?b2JTbFIrRzRRUUE5TmlKUVd5NGRlLzdiQWJCNkNQTitjSmpueGRmeFBaZFdW?=
 =?utf-8?B?enFLRm9YdWs5Z1FyUktmQUhCNFhkdFFqSm1IbTB3dUpiMCtOUVM3RFFTenBl?=
 =?utf-8?B?Y0hNbmpMdEE0Rmg4VTdCZnVuUkVxblVtb2hZckFVWDNhRXdKZFBmNXpYbVFa?=
 =?utf-8?B?Tm54aUZZVHRuaHRLMUtmdXpIMDJJbUpPd1BBTGY1d0FnaDZuYVNQcWpnZ3BZ?=
 =?utf-8?B?RWJJVXVzeUlZTmpYWU9nL3ZrWnE3dy93M0liV2t5QWtTZ3R1NHhkVy9Nendk?=
 =?utf-8?B?OEIrVkdNR05OaWMxNzFFU2lPOXpPUGZjemY3L2RIVFVhKzEzeXJsRGRhS2NF?=
 =?utf-8?B?TmpPUWV4OTcwdmMwemY5R1plcGZBRnlKbHUxTmZFMklJWnE0c0hrQjgzWUN5?=
 =?utf-8?B?Mm4zQmM3MXpvRS9CVkJMUXJ1anpjODd0STFsNFd5Mk5qZkdyMzFsMngzOWZy?=
 =?utf-8?Q?fih6iJgpybncVZf8=3D?=
X-Exchange-RoutingPolicyChecked: OZyL9v7UNMPKr5SoJyDEsKHsi5WPCNwOMuZ8Eusx9uqXlQa3RuiXAUtMYR3v1YnAtLRiYEgQSPT2HBIgqikznijglXy2GbM46gChozcC0dW3mPEdHVam4ew1WtfCxuOYu+PaClxviFqIrCJ2x86mko2eHiEFjqkVBNoC6WjW8nVqVvHFmkCuNMKkYxSyNkezs8/Q2Xjg9YuCzvDhD3M4OUXBgf8jUbAH9eG6jEuNogYVk097+3E3fDmNwtfavV5kmgAJ1FY5IWMeO+NJE9TJ28/sCt3/mafvywg9csO7tX8Ds2LU5Hd2yTBYm/EBwgaDB1XAQdH3KOWhxb7b4Lw4iQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8f6643-bfe1-4b09-7480-08de833311ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 08:07:30.2984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z0KFOOCDi+H5mHNzcXB2lkoogjFShjXoAM2K7ELqZQr9uwGzhRSFm+Vr2nBB6Vg353ulrWxcTsW4jImNwOfCgSbmJr5aJ4mgHovJhetzmeM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE80710477
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

--------------2WiPpGPtXJ83m0ST1bP2RHYt
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jeevan,

On 3/16/2026 9:08 AM, Jeevan B wrote:
> While creating the framebuffer, prefer tile4 when it is supported
> instead of always using linear. Fall back to linear if tile4 is not
> available.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5399ef481..4c4e477a1 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
>   {
>   	drmModeModeInfoPtr mode;
>   	igt_plane_t *primary;
> +	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>   
>   	igt_output_set_crtc(output, crtc);
>   	mode = igt_output_get_mode(output);
>   
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
> +				     I915_FORMAT_MOD_4_TILED))
> +		modifier = I915_FORMAT_MOD_4_TILED;
> +
>   	igt_create_pattern_fb(display->drm_fd,
>   		      mode->hdisplay, mode->vdisplay,
> -		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
> +		      DRM_FORMAT_XRGB8888, modifier, fb_info);
>   
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   	igt_plane_set_fb(primary, fb_info);
>   }

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
--------------2WiPpGPtXJ83m0ST1bP2RHYt
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Jeevan,</p>
    <div class="moz-cite-prefix">On 3/16/2026 9:08 AM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260316033807.24078-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">While creating the framebuffer, prefer tile4 when it is supported
instead of always using linear. Fall back to linear if tile4 is not
available.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/kms_cursor_legacy.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 5399ef481..4c4e477a1 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -367,15 +367,21 @@ static void set_fb_on_crtc(igt_display_t *display, igt_crtc_t *crtc,
 {
 	drmModeModeInfoPtr mode;
 	igt_plane_t *primary;
+	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 
 	igt_output_set_crtc(output, crtc);
 	mode = igt_output_get_mode(output);
 
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_XRGB8888,
+				     I915_FORMAT_MOD_4_TILED))
+		modifier = I915_FORMAT_MOD_4_TILED;
+
 	igt_create_pattern_fb(display-&gt;drm_fd,
 		      mode-&gt;hdisplay, mode-&gt;vdisplay,
-		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, fb_info);
+		      DRM_FORMAT_XRGB8888, modifier, fb_info);
 
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, fb_info);
 }</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>&nbsp;</span></p>
    <blockquote type="cite" cite="mid:20260316033807.24078-1-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
</pre>
    </blockquote>
  </body>
</html>

--------------2WiPpGPtXJ83m0ST1bP2RHYt--
