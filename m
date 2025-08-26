Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504DCA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 06:18:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED43210E5CD;
	Tue, 26 Aug 2025 06:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ika5rNqh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38CF210E5CB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 06:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756189111; x=1787725111;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=j68qd+f5ja4gmRXxlmayT4l1w9Mx+vdXBN1iYbaaCAE=;
 b=Ika5rNqhw3vztytgDtsfXG5urf+9jQZ6xzIPIdBxp4aebkwEcHu7JvOH
 oMyfE7XsnzAdwbwo0YXy4Qg4UmejwNYtaP8VZCC7y6ggpm3+BRY7Gjlko
 uitsj8RsKiu2fwTe7lAZF4EvzZGgGEK8ytmbzCmDlvkFrNqXvV8jRM1wX
 fJJmurxuVQjTWRbkOxclLfq9eeclygqsxPanDYyVyWKBa+G6ZE8kerCyB
 ukgeLHuzbx+nsACi/VzIgSybegov3IJ5ktERoXbMIMyTHq0QrCDswE5Ru
 bBYV/mCYZsKEegKUOiqFgaQkf2BvP5xwx/pXO9jYrG/oa3IoQ9pr+pnKJ g==;
X-CSE-ConnectionGUID: +QsmPlnIQgGvIyO/OzzDaw==
X-CSE-MsgGUID: Tkssr1EOScSKOPMI5Ty7LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58272493"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208,217";a="58272493"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:18:31 -0700
X-CSE-ConnectionGUID: qqrPRck3S9GWHqpiO4IHdg==
X-CSE-MsgGUID: ubdlHufhTPWUw25wUFOEbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
 d="scan'208,217";a="200380891"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 23:18:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 23:18:29 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 23:18:29 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 23:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UMvYAL1dfs/VxewosHX1signHR0QPf8DChUtvuA4GbSNf7JqWJE6R3JhqYM8NiPFoieFHtVNMEwGsgX7dzM6PDXVchj5RSiuZAtv0b4ph2vQguX/xQv2e3GzYAtJsctOzP+n5yZ56ByI/Q0qFlN6isdWaTqktMwgd/R1bmhW+JUYDzqImIlL8e9uFzSMh44jV/Uek8OQUOeu2k771iJfHcZbNHJfpuabL85h5c7fW27QnxutobmYKfZPcOnw7k10jzDsxfbTtZ7ruF7aoEPd/+7QUsQsKnvmJvHvmv28RPp4A9Gq659qUMj4eZeV9wrUspIjnyycyi5seEFX+Tcf9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gYBeDaW6EZKwPHWzHODCGiLEN/DeqoPvKi22sJgVzcg=;
 b=QuxrLyarUmKoYMU2p6g/VpS8Ng7bATYkqZsLXA7QcwDPKfdhT1Sn1+OoNwh2nPXvZlAnmwlAtlRcaX0oJwTbAVi8PrmNld4seFj/Vt0zwru5NIOrTB8YGao7M6E31/ioqBI2RaCPtWTxoYHeUmnCNSIJWJYiTh9Z4pK3+7yjpEGmo0+/DG2b9E1C9EQM03dty1ofRGCLd8e8HosgQm7SnwRVdVcw9Qhiuj0+nYCa33osHtqNL042W+TAdt2bUlmc+nnYGRWJKA1PQwixgqS+F4XErWRaqVdUqQOFNd/9DiGo6KoHObCcB4/NcUfmUfeeOWFLDqiJ4tjVB2JmGStc1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 06:18:26 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 06:18:25 +0000
Content-Type: multipart/alternative;
 boundary="------------8ticlW1lGFDrUVO0jUnLglx6"
Message-ID: <aa7229e1-a9da-45fd-9bf2-8c9dbc4d31e9@intel.com>
Date: Tue, 26 Aug 2025 11:48:19 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBpbnRlbC1jaTog?=
 =?UTF-8?Q?Blocklist_cursor_frontbuffer_rendering_tests_on_xe?=
To: <igt-dev@lists.freedesktop.org>
References: <20250825144324.1585829-1-karthik.b.s@intel.com>
 <175615866536.268187.14697525261397882917@1538d3639d33>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <175615866536.268187.14697525261397882917@1538d3639d33>
X-ClientProxiedBy: MA5PR01CA0025.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: e7183016-f44e-4a03-89a4-08dde4685d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akFSOFF0NGExQ0JWRmJBUjl6ZEJNaDFxRWZiNU12c210UVdqMzZUV3kwdko3?=
 =?utf-8?B?dXB3TnNoYXlLRmtXeVFxQ3hCS2dJamx4SjRuTG1pVXBVTkw5WGdnTy8vQ1Y4?=
 =?utf-8?B?RVVkOTdpNFRkLy9lZzR1ZUd5bldYeitVZnhCK2tNOHM3cTd5cnFMWWx3UTRK?=
 =?utf-8?B?bmpBemkvUWIxM1dYT3hEbGZnSU1MKzJUcUtHK1JTdkhldE82VjYydFR5NFM3?=
 =?utf-8?B?VXp2ajREeU1HdVF0NlN6cENPOTA0WnlIN2JiSkR1TnlRVVVXbThablhzdkhL?=
 =?utf-8?B?dUNjRU9NYTBWaWk4K2lJR3RwSEZBZjN0MGpFckxRUXV4WWhFdXYyUUdFd0ZK?=
 =?utf-8?B?K0hHeGhOWGVIcG1vL24vWkdZa0hGWlFlZGtsUW9FMGxTK1FIbDhWTGx1T1VP?=
 =?utf-8?B?TkNUSGJ5TEhzSUdqMG4yeE92ODhHM1FadHJpV0R1VGZibnA5KzFycnhnMUhm?=
 =?utf-8?B?cEg1RzJuQ1ZOSXFTUGxPM3JEQ1YxY214WUxRQzFZYnpEck1lRDRwYU1kM0pG?=
 =?utf-8?B?TWl2NVlvK1BCejdPZ25aT2dMSXNmSGRUUmdRSmlNczY1Umg2Y0JaSUhOMThE?=
 =?utf-8?B?VHIvTkc0bDIvK3VBVkZTSk9BeGhBZTRrTTQ0dHIyMk90aUhSRUdFSkF2RFM0?=
 =?utf-8?B?SkM2OUI1RHRJZ1c0eHZGLzVWS3l4NWs5dStvL1g4ckVLdkY1eE9FRVJkSHFi?=
 =?utf-8?B?RG8xcm9rN0krRVQ2QW8wS0VmcnM0Y0lSUm90eHI4ejFEWlIvRzk5TStlVVNM?=
 =?utf-8?B?a21lQlFlc2o2a2ZaOE9QbGVYa2x3dkVCOUN0UWcxYWw3UGprMEhBOE1VMVM3?=
 =?utf-8?B?ZDA3ZUFveER6SDgvYk0rWi8vSkZPTDFvc1F0emdEaG5qU2x2TXU0dHN1dkR2?=
 =?utf-8?B?ZXZVVFpDY0VxaEZydTFBN2g5Smk1aWM5UTRiV2taTkh1bVRYUkZmUUxzYXpj?=
 =?utf-8?B?TkxldEZpcHRpTEJaQ002Q1RyNEtiV3h0djJKZFNDMFNlRUxRbEVXdGJMbTZK?=
 =?utf-8?B?MXl1MUZSblZ6eUEwTEdEV2sxZzFxMUkwajk0UE52Sys2R1V2eVdZTG9ueU1B?=
 =?utf-8?B?MDlidTE1aVJBMkVPSDRzWUU5TzVLb3Z6OVgyNWpOYjd6YnNLQnB2by9LNFZ6?=
 =?utf-8?B?Vk51bzhEZjBlazg1ZzVLT09FejFVL2RhekkvdWYvbGFpMU5CVTVOZ0E5aXBB?=
 =?utf-8?B?SFZhU21QTWRiNnRNVkJaaUxGN1RFZ1VDTk81VGVYbGlDK3BmS3I5QlpRajY1?=
 =?utf-8?B?emhjL2FFTFBjZ3NVMm5ya1dQc2FlMXEraVlsUFhrdW9QZStjckppeGJHd2RS?=
 =?utf-8?B?Q1hwWEY1WTJpRTV4QUk0Y0QrZmxQTlJhWXZ1RjkvY2lMbm5FempBQzFRNEhN?=
 =?utf-8?B?OVpCWEJzN2duWnhCblE3SzhzV2F0a2xrUmxxcFZuVENCUjlsRWtNVXZFRmxn?=
 =?utf-8?B?UU9hL0NaK1FFMVN0d3NJUUhDOUNreDZVN2ZGaFI3YkUyaXplc2lobHlLQnRv?=
 =?utf-8?B?VXBxWVBRby9BcG5Jd0hjc2JZUlJzNm9tcU9WeCswQ2lnUUNuRlFIcFh1ekFt?=
 =?utf-8?B?ZEFRY1NFQ0lOWkNVNFZrZ05Xd3IvVmxtcmVBTFJicVpIb25hOTZGNXRwUFVs?=
 =?utf-8?B?cVNYMnlpcUtHWHA5SU96anBsOHoxc0c2cE5lNC9pSHlwTklWN2tQK042M3J6?=
 =?utf-8?B?UlEzRzdnOFhyaDVpSTk3RENaWEZuODBEN1ZIYzFRdzdwVWtGeTYrTWhHQk5Q?=
 =?utf-8?B?dndMditINm8vV2NjL2NxajFBbzNoNUpJcFRaYnl2TTlQZWo4bmMwWGRnTjNr?=
 =?utf-8?Q?XYJ72GJsTfpOjbGKZx5DQwC2V74LxsgBpGcX4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(8096899003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmZkUTFvK0hESUY4dzhscnFLWW9vQVBUbGNheTRqSGlVWHZrbUVpc3h6SGxz?=
 =?utf-8?B?RTMxWWlOa2s4QWpUMW9QQjNkdXUwcHNzdC9TdXJLQi9OenJvd3FGeHQ2ZzZD?=
 =?utf-8?B?RnNrRytjWllpcVllbzdkWXFjOVFqUEFGYzBuWUMxOHd1aktUS0o3NklWN3dr?=
 =?utf-8?B?YzB6dEFKR1FVSGVIdG14eW81QkEvSDdGVzJYQzhnaWtLdHZZQTA2M1I0SDNx?=
 =?utf-8?B?NStyQmJOREVyeWxIeU91UDViNndRRHhMRlFpc0Z2Y3BHVzh4S1Nsc0t1V09a?=
 =?utf-8?B?dWVtZENGMk1kODAyYW5oZmw1V1djaFM2OGVSWmRGd2hISlF0czZ4OVp4cVVW?=
 =?utf-8?B?REVJdWw1Q01hd3UxVm43VUUydkNybjh0aVozMFJvZGU2MHJWMHhxU1k4RzN5?=
 =?utf-8?B?Y2ZaZldXWHJsS1JwWTc4Q0h2ZlBjOGRLcUNqT20rRmZVWm4rdGRCR3diZzRp?=
 =?utf-8?B?YTBhTDA1UDRqeU5jYlB6akFQcHF0ZVl5YUFWMUdhSWg2NHhsZkVEazdlSS96?=
 =?utf-8?B?K1N3QTQ1b09RaGozRG5waVlHUkVIV1VMeForTFRLS3R5b2l2T2htV1RKczhK?=
 =?utf-8?B?WmhjTzFHeGlGcVBSUFJBcjM3OUJoVXdVU3N1QWtUb1VnbHdlcjRVaDU2Y1Bk?=
 =?utf-8?B?NVVRNytZenJ5b0w1eDgrMHkxbXRtWjFOdnNnb1MzOGtKZ3V1b0thbXRHUnow?=
 =?utf-8?B?bVQrWnhmNWJ5aWJ5YTl6MEtWSWpwOXBsWjFubzlyekFsVEFOdVlHYVNRcWx5?=
 =?utf-8?B?YXZLSmxuQlBGb2RhNTFqeTFtcUlwRHlvajRCZHJKWFBrdzBTVmlYbzdhdDZT?=
 =?utf-8?B?c1o5N0NGNk1iTzg0S1RBQStKWllBNnZNNkExNlVUaUI1UVBqUjZGUDdyblVO?=
 =?utf-8?B?Y1h1bzZJU3RUZmFENk9va1h0VmxkR0VxOFV5UVhjUmhseW1IQnBMeTF6Nm9X?=
 =?utf-8?B?anZrOFFzc0lUVWVvK3JpVFRiejJNZlZhR1BYS244T0VVQkNOZlJteFdtN1Ew?=
 =?utf-8?B?ZmhFTUFvSXVKUnJFeVkvSytMOEdoc0Jyb21OUHgwRzdLVVYwdzcyN0NrWFVr?=
 =?utf-8?B?L2M3YUp3eWl5LzZ2Rmx2YiswREJQTlNPU1ZQaVBrVDZRR01QalBjZXJWWFFN?=
 =?utf-8?B?VC84dGJuK051VkJlTUxrQ3BwMDBvbTIvQzFwVjlHYjV1RWdibEVBZzJhN2du?=
 =?utf-8?B?WXZTZysrc3laWk5uTFlsZ3p5ZDFWUFJPWlV6ZytxNmg5QUk0alZiakNSNncx?=
 =?utf-8?B?SWhkTWZzT01CRDNYUGVDNFpKMVc4djhKTERLWFNZRENiZ3BaS3ZuN1RXUSs3?=
 =?utf-8?B?OFNxeVEvVmtUQXU3Mm9SSUEzOFZtN2wvL2czZk82RzJRQ1EzazhTU2Mydkd4?=
 =?utf-8?B?QXZFY2gxbzgzMjhZSmg2Wk1FdTUyNk56THIwN3cvMDdiWG02aGlXSUVCZW9u?=
 =?utf-8?B?Yk9GdlZubXFIcUFkaFVrcTZST1RyTUN4VEJYeWRIOEdwVzN0ZjVpbXUvNUJD?=
 =?utf-8?B?MXFGajNic3c3SGNjZjZ3K29sRDJJL0hHVkxGYTBCTThZZVpEVGZGTk5zallI?=
 =?utf-8?B?QStFcnM1QVZvb3NqbCsyV1dYWXBOSW9QYytPVzUwNzFsNHJlWDBiRGZpbGpi?=
 =?utf-8?B?NHMvUUJIcGp0d3RnUVIzVjd3cmhLelFweFFnUm1XbG8xdUJZUWkrU2plQk05?=
 =?utf-8?B?c0R5SlVHRW1xVllGSEFJUmo4ZndzTlZBbHlhRXpUZ1NRZVMrMng2OUxnaGFr?=
 =?utf-8?B?OXRJRGdZV2tEcGo2NGJYWjlhN0xickdDNkRBcTE4ME85Ymo4UlIwbGRqeWZG?=
 =?utf-8?B?bTY0clRMZldOdFFteTRzOU9oRHR4c3pjaHFHb3lTTGUvUGt3M2M4Z1BXSVJy?=
 =?utf-8?B?cEZwTElzNTNGTk0zWTNDTUh3eUZKYjcrSmRRWGlHQ29jSS9NblgvU0NJTDZY?=
 =?utf-8?B?ZEdzMUIvM09hWFI5MTk2RVNYV3FYS04rZWVpSmZNdGpWS1RXS2dtdjVVWVFi?=
 =?utf-8?B?UmlSamNrQW5VVWFjL21WOU1VeFllV2ZGNjdWZzk3cEMxeGtEbm1RK1ZmOGNv?=
 =?utf-8?B?cUozVXBRVkpRenZwMTlGZmFtVmtzNlA5SjNiOUF2a2lRdXJyRitzOUdlYjBC?=
 =?utf-8?Q?DAX+upu5Y6YYZei+15S7GsJ9q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7183016-f44e-4a03-89a4-08dde4685d56
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 06:18:25.8169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WOqPKYWkhh955MhKcx2n8vjKkPtqGAhclx72+A9Owvc2MmiwawTfDSUy5TXvsfkxfIQresRfxIvIFcf5rew4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
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

--------------8ticlW1lGFDrUVO0jUnLglx6
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

This patch is a blocklist change and will not affect test results. These 
failures are unrelated.

Thanks,
Karthik.B.S


On 8/26/2025 3:21 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	intel-ci: Blocklist cursor frontbuffer rendering tests on xe
> *URL:* 	https://patchwork.freedesktop.org/series/153456/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/index.html
>
>
>   CI Bug Log - changes from XEIGT_8506_FULL -> XEIGTPW_13631_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13631_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13631_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 3)
>
> Missing (1): shard-adlp
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13631_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_sequence@queue-busy:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-2/igt@kms_sequence@queue-busy.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_sequence@queue-busy.html>
>         +1 other test incomplete
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13631_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) +3
>         other tests fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-270:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>)
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +6
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#1512
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +9
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +5
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>)
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +167 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +28
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_edid@vga-edid-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_content_protection@atomic-dpms@pipe-a-dp-4.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +8
>         other tests skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_content_protection@srm@pipe-a-dp-2:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-5/igt@kms_content_protection@uevent.html>
>         (Intel XE#1188
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x42:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-128x42.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (Intel XE#1340
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html>
>         (Intel XE#4356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) +1
>         other test skip
>  *
>
>     igt@kms_fbcon_fbt@fbc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html>
>         (Intel XE#5425
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5425>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-on-nop:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +5
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-rmfb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@b-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html>
>         (Intel XE#4683
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683>) +1
>         other test fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +3
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +3
>         other tests skip
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_force_connector_basic@force-connector-state.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +12
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-render.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +16
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (Intel XE#5672
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5672>)
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#1158
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +13
>         other tests skip
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_joiner@basic-max-non-joiner.html>
>         (Intel XE#4298
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298>)
>  *
>
>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#2501
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html>
>         (Intel XE#356
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/356>)
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1
>         other test fail
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-psr:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +6
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>  *
>
>     igt@kms_psr@fbc-psr2-primary-render:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +6
>         other tests skip
>  *
>
>     igt@kms_psr@pr-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_psr@pr-basic.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_psr@psr-basic.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +5
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) +1
>         other test skip
>  *
>
>     igt@xe_eu_stall@blocking-re-enable:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@xe_eu_stall@blocking-re-enable.html>
>         (Intel XE#5626
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +5
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +2
>         other tests skip
>  *
>
>     igt@xe_evict@evict-large-cm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@xe_evict@evict-large-cm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@many-userptr:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_exec_fault_mode@many-userptr.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +10
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@process-many-large-mmap-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +16 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +123 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +5
>         other tests skip
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html>
>         (Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>  *
>
>     igt@xe_media_fill@media-fill:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@xe_media_fill@media-fill.html>
>         (Intel XE#2459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459> /
>         Intel XE#2596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596>)
>  *
>
>     igt@xe_oa@syncs-userptr-wait-cfg:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +5
>         other tests skip
>  *
>
>     igt@xe_pm@d3cold-basic:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1
>         other test skip
>  *
>
>     igt@xe_pxp@pxp-stale-queue-post-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-cs-cycles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-topology:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_query@multigpu-query-topology.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_render_copy@render-stress-2-copies:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html>
>         (Intel XE#4814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_flr@flr-vfs-parallel:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html>
>         (Intel XE#4273
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3.html>
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-5/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_plane_cursor@viewport:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-466/igt@kms_plane_cursor@viewport.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_plane_cursor@viewport.html>
>         +1 other test pass
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#2685
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685> /
>         Intel XE#3307
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html>
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html>
>         +5 other tests pass
>  *
>
>     igt@xe_exec_reset@parallel-gt-reset:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@xe_exec_reset@parallel-gt-reset.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-userptr-invalidate:
>
>       o shard-bmg: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalidate.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@xe_exec_threads@threads-hang-userptr-invalidate.html>
>  *
>
>     igt@xe_pmu@gt-frequency:
>
>       o shard-dg2-set2: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-432/igt@xe_pmu@gt-frequency.html>
>         (Intel XE#4819
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@xe_pmu@gt-frequency.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345> /
>         Intel XE#4522
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#2705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4212
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-2/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_content_protection@lic-type-0.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_content_protection@srm.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_content_protection@srm.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +8
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +4
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html>
>         (Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>         +21 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>         +20 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +36 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>         +41 other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128> /
>         Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1122
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122> /
>         Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +3
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-blt@edp-1:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html>
>         (Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr@pr-no-drrs:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-lnl-2/igt@kms_psr@pr-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_psr@pr-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>         +36 other tests skip
>  *
>
>     igt@kms_psr@psr-dpms:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-463/igt@kms_psr@psr-dpms.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_psr@psr-dpms.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +68
>         other tests skip
>  *
>
>     igt@kms_psr@psr-primary-page-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>         +62 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-3/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>)
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>) +1
>         other test skip
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2939
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939>) +1
>         other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2509
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-dg2-463/igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset.html>
>         (Intel XE#2594
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>  *
>
>     igt@xe_pm@d3cold-mocs:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8506/shard-bmg-7/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#4760
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760> /
>         Intel XE#5440
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5440> /
>         Intel XE#5545
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@xe_pm@d3cold-mocs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8506 -> IGTPW_13631
>   * Linux: xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695 ->
>     xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2
>
> IGTPW_13631: 534a431f3c1b55292b8d0599594787f0bd7af6f5 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8506: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695: 
> 5481954bd63bd4d34a5acb2b89fb2caf55bb0695
> xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2: 
> f1bad25fa12671f09a9afaeba55789eb519c1eb2
>
--------------8ticlW1lGFDrUVO0jUnLglx6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>This patch is a blocklist change and will not affect test
      results. These failures are unrelated.</p>
    Thanks,<br>
    Karthik.B.S
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/26/2025 3:21 AM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:175615866536.268187.1469752526139=
7882917@1538d3639d33">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>intel-ci: Blocklist cursor frontbuffer rendering tests
              on xe</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/153456/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/153456/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13631/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8506_FULL -&gt;
        XEIGTPW_13631_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13631_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13631_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 3)</h2>
      <p>Missing (1): shard-adlp </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13631_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_sequence@queue-busy:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-2/igt@kms_sequence@queue-busy.html" moz-do-not-send=
=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13631/shard-bmg-1/igt@kms_sequence@queue-busy.html" moz-do-not-sen=
d=3D"true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13631_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-at=
omic@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear-atomic@pipe-c-edp-1.html" moz-do-not-send=3D"true">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-ln=
l-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe=
-c-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/911" moz-do-not-send=3D"true">Intel X=
E#911</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
-internal-panels:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2370" moz-do-not-send=3D"true">Intel XE#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_big_fb@4-tiled-16bpp-rota=
te-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send=3D"true">Intel XE=
#1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#2=
327</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@kms_big_fb@x-tiled-8bp=
p-rotate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Int=
el XE#316</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rota=
te-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE=
#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_big_fb@y-tiled-add=
fb-size-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send=3D"true"=
>Intel XE#610</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</=
p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_big_fb@y-tiled-max=
-hw-stride-32bpp-rotate-180-hflip.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do=
-not-send=3D"true">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-se=
nd=3D"true">Intel XE#1124</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-192=
0x1080p.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_bw@connecte=
d-linear-tiling-2-displays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" mo=
z-do-not-send=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894=
</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-2-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=
=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_bw@linear-tiling-1=
-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"t=
rue">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1512" moz-do-not-send=3D"true">I=
ntel XE#1512</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true"=
>Intel XE#2887</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p=
>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-dg2-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-se=
nd=3D"true">Intel XE#2887</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg=
2-mc-ccs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_ccs@crc-=
primary-suspend-4-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862"=
 moz-do-not-send=3D"true">Intel XE#3862</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-2=
:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_ccs@crc-primary-su=
spend-4-tiled-dg2-mc-ccs@pipe-d-dp-2.html" moz-do-not-send=3D"true">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/386=
2" moz-do-not-send=3D"true">Intel XE#3862</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-edp=
-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-bmg-ccs@pipe-a-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669" moz-do-n=
ot-send=3D"true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe=
-c-hdmi-a-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_ccs@crc-sprite-pla=
nes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/787" moz-do-not-send=3D"true">Intel XE#787</a>) +167 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc=
-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html" moz-do-no=
t-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2705" moz-do-not-send=3D"true">Intel XE#2705</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not=
-send=3D"true">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4212" moz-do-not-send=3D"true">Intel XE#4212</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@kms_ccs@random-ccs-dat=
a-4-tiled-lnl-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send=3D"tru=
e">Intel XE#2907</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send=
=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +8 other =
tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_ccs@random-ccs-dat=
a-yf-tiled-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-sen=
d=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +28 other=
 tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel XE#2325</=
a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_chamelium_color@ga=
mma.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306=
</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_chamelium_color@gamma.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>) +=
1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@vga-edid-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@kms_chamelium_edid@vga=
-edid-read.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">Intel=
 XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"tru=
e">Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE#2252</a>) =
+3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_content_protection=
@atomic-dpms@pipe-a-dp-4.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-se=
nd=3D"true">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@kms_content_protection=
@lic-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Inte=
l XE#455</a>) +8 other tests
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_content_protection@lic-ty=
pe-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send=3D"true">Intel XE#2=
341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel=
 XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-5/igt@kms_content_protection@uevent=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1188" moz-do-not-send=3D"true">Intel XE#1188<=
/a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-max-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_cursor_crc@cursor-onscree=
n-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Inte=
l XE#2320</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-128x42.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Intel X=
E#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-cursor-vs-flip-legacy:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_cursor_legacy@2x-cursor-v=
s-flip-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">In=
tel XE#309</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" mo=
z-do-not-send=3D"true">Intel XE#2291</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_cursor_legacy@cursorb-=
vs-flipb-atomic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true"=
>Intel XE#2291</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p=
>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-toggle.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-n=
ot-send=3D"true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1340" moz-do-not-send=3D"true">Intel XE#1340</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354" moz-do-not-send=3D"true">Intel XE#4354<=
/a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354" moz-do-not-send=3D"true">Intel XE#4354<=
/a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@kms_dp_link_training@u=
hbr-mst.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4356" moz-do-not-send=3D"true">Intel X=
E#4356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@kms_dsc@dsc-with-bpc-formats.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_dsc@dsc-with-output-forma=
ts.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#224=
4</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5425" moz-do-not-send=3D"true">Intel XE#5425</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_flip@2x-absolute-wf_vblan=
k-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true"=
>Intel XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html" moz-do-=
not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) =
+5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-rmfb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_flip@2x-flip-vs-rmfb.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@kms_flip@flip-vs-expir=
ed-vblank-interruptible.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=
=3D"true">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3149" moz-do-not-send=3D"true">Intel XE#3149</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-dp4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interr=
uptible@d-dp4.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible@d-dp4.html" moz-do-not-send=3D"true"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
01" moz-do-not-send=3D"true">Intel XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html" =
moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_flip@flip-vs-expired-vbla=
nk@b-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel =
XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_flip@flip-vs-suspend-inte=
rruptible@d-hdmi-a3.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-se=
nd=3D"true">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2597" moz-do-not-send=3D"true">Intel XE#2597</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscal=
ing:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-upscaling.html" moz-do-not-send=3D"true">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4683" moz-do-=
not-send=3D"true">Intel XE#4683</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-down=
scaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz=
-do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380<=
/a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-d=
o-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-default-mode.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-4/igt@kms_force_connector_basic@for=
ce-connector-state.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send=3D"tru=
e">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-b=
lt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-n=
ot-send=3D"true">Intel XE#2311</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-m=
map-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-1p-offscren-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-d=
o-not-send=3D"true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do=
-not-send=3D"true">Intel XE#5390</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-dra=
w-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_frontbuffer_tracki=
ng@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651"=
 moz-do-not-send=3D"true">Intel XE#651</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw=
-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-primscrn-spr-indfb-draw-render.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
3" moz-do-not-send=3D"true">Intel XE#653</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-b=
lt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-n=
ot-send=3D"true">Intel XE#2313</a>) +18 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onof=
f:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-no=
t-send=3D"true">Intel XE#2312</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@kms_frontbuffer_tracking@pipe=
-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5672" moz-do-not-send=3D"true">Intel =
XE#5672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@kms_frontbuffer_tracki=
ng@plane-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1158" moz-do-not-send=3D"true=
">Intel XE#1158</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not=
-send=3D"true">Intel XE#656</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@kms_joiner@basic-big-j=
oiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#3=
46</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_joiner@basic-big-joiner.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-max-non-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_joiner@basic-max-non-join=
er.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4298" moz-do-not-send=3D"true">Intel XE#429=
8</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2501" moz-do-not-send=3D"tru=
e">Intel XE#2501</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_multipipe_modeset@=
basic-max-pipe-crc-check.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/356" moz-do-not-sen=
d=3D"true">Intel XE#356</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/356" moz-do-not-send=3D"true=
">Intel XE#356</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a=
-6-size-64.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_plane_=
cursor@overlay@pipe-a-hdmi-a-6-size-64.html" moz-do-not-send=3D"true">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/616" mo=
z-do-not-send=3D"true">Intel XE#616</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-none:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html" moz-d=
o-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4596" moz-do-not-send=3D"true">Intel XE#4596</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE#5020</=
a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_plane_multiple@til=
ing-yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE=
#5020</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE#5020</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
5@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-psr:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send=3D"tr=
ue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13631/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html" moz-do-not-send=3D"true">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718=
" moz-do-not-send=3D"true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_pm_lpsp@kms-lpsp.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2499" moz-do-not-send=3D"true">Intel XE#2499</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send=3D"true">Intel XE#=
1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
141" moz-do-not-send=3D"true">Intel XE#3141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-f=
ully-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-c=
ursor-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel X=
E#1489</a>) +5 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz=
-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2893" moz-do-not-send=3D"true">Intel XE#2893<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" =
moz-do-not-send=3D"true">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-f=
ully-sf@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send=3D"true">I=
ntel XE#4608</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"=
true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2893" moz-do-not-send=3D"true">Intel XE#2893</a>) +1 other te=
st
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-page=
-flip@edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4609" moz-do-not-send=3D"true">Intel XE#4609</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-render:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_psr@fbc-psr2-prima=
ry-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel=
 XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">Int=
el XE#929</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_psr@pr-basic.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>) +1 other=
 test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_psr@psr-basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-s=
end=3D"true">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a>) +5 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_rotation_crc@sprit=
e-rotation-90-pos-100-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=
=3D"true">Intel XE#3414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">I=
ntel XE#2413</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13631/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel XE#1435</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@kms_tiled_display@basi=
c-test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-not=
-send=3D"true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_tv_load_detect@loa=
d-detect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/330" moz-do-not-send=3D"true">Intel X=
E#330</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_tv_load_detect@load-detec=
t.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/330" moz-do-not-send=3D"true">Intel XE#330</=
a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@kms_tv_load_detect@load-detec=
t.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2450" moz-do-not-send=3D"true">Intel XE#2450=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_vrr@flip-suspend.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499</a>) +1 o=
ther test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@blocking-re-enable:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@xe_eu_stall@blocking-r=
e-enable.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5626" moz-do-not-send=3D"true">Intel =
XE#5626</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_eudebug@basic-vm-bi=
nd-ufence-reconnect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"t=
rue">Intel XE#4837</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@xe_eudebug@discovery-empty.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a>=
) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-1/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-vram-target-sram.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-=
send=3D"true">Intel XE#4837</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-large-cm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@xe_evict@evict-large-cm.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">Intel XE#688</a>) +1 =
other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-null-de=
fer-bind.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-432/igt@xe_exec_basi=
c@multigpu-no-exec-null-defer-bind.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-d=
o-not-send=3D"true">Intel XE#1392</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"tru=
e">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-5/igt@xe_exec_basic@multigpu-once-b=
asic-defer-bind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true"=
>Intel XE#2322</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@many-userptr:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_exec_fault_mode@man=
y-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=3D"true">Intel =
XE#288</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-large-mmap-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-se=
nd=3D"true">Intel XE#4943</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-share=
d-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-mmap-shared-nomemset.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4915" moz-do-not-send=3D"true">Intel XE#4915</a>) +123 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mma=
p-free-huge-nomemset:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge-nomemset.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4943" moz-do-not-send=3D"true">Intel XE#4943</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</=
p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_mmio_send_recv.html" moz-do-not-send=3D"true">ABORT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530" moz-do-not-s=
end=3D"true">Intel XE#5530</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_media_fill@media-fill:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@xe_media_fill@media-fill.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2459" moz-do-not-send=3D"true">Intel XE#2459</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596" moz-d=
o-not-send=3D"true">Intel XE#2596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_oa@syncs-userptr-wa=
it-cfg.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573" moz-do-not-send=3D"true">Intel XE=
#3573</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-466/igt@xe_pm@d3cold-basic.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-d=
o-not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@xe_pxp@pxp-src-to-pxp-=
dest-rendercopy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true"=
>Intel XE#4733</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-8/igt@xe_pxp@pxp-stale-queue-post-s=
uspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel XE=
#4733</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-cs-cycles:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@xe_query@multigpu-query-cs-cy=
cles.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#94=
4</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@xe_query@multigpu-query-inval=
id-uc-fw-version-mbz.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"t=
rue">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_query@multigpu-quer=
y-topology.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel=
 XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_render_copy@render-stress-2-copies:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_render_copy@render-=
stress-2-copies.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4814" moz-do-not-send=3D"true"=
>Intel XE#4814</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase=
-numvfs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_sriov_auto_provisio=
ning@selfconfig-reprovision-increase-numvfs.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/41=
30" moz-do-not-send=3D"true">Intel XE#4130</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-increase-numvfs.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz=
-do-not-send=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@xe_sriov_flr@flr-vfs-p=
arallel.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4273" moz-do-not-send=3D"true">Intel X=
E#4273</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13631/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4273" moz-do-not-send=3D"true">Intel XE#4273<=
/a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/sh=
ard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html" moz-do-not-s=
end=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_dp_linktrain_fallback@dp-fallback.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4294" moz-do-not-send=3D"true">Intel XE#4294</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-b=
mg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send=3D"tru=
e">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interr=
uptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel X=
E#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTP=
W_13631/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptibl=
e.html" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi=
-a3.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049" moz-do-not-send=3D"true">Intel=
 XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2597" moz-do-not-send=3D"true">Intel XE#2597</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_flip@f=
lip-vs-suspend-interruptible@c-hdmi-a3.html" moz-do-not-send=3D"true">PASS<=
/a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-5/igt@kms_hdr@invalid-hdr.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_hdr@i=
nvalid-hdr.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-466/igt@kms_plane_cursor@viewport.html" moz-do=
-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/616" moz-do-not-send=3D"true">Intel XE#616</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-433/=
igt@kms_plane_cursor@viewport.html" moz-do-not-send=3D"true">PASS</a> +1 ot=
her test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-4/igt@kms_plane_scaling@intel-max-src-size.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2685" moz-do-not-send=3D"true">Intel XE#2685</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307" moz-do-no=
t-send=3D"true">Intel XE#3307</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_plane_scaling@intel-max-=
src-size.html" moz-do-not-send=3D"true">PASS</a></li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455" moz-do-not-send=3D"true">Intel XE#455</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/sha=
rd-dg2-463/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send=
=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defe=
r-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">Intel XE=
#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13631/shard-dg2-436/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html"=
 moz-do-not-send=3D"true">PASS</a> +5 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_reset@parallel-gt-reset:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-=
not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3876" moz-do-not-send=3D"true">Intel XE#3876</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-b=
mg-3/igt@xe_exec_reset@parallel-gt-reset.html" moz-do-not-send=3D"true">PAS=
S</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-userptr-invalidate:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-7/igt@xe_exec_threads@threads-hang-userptr-invalida=
te.html" moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3876" moz-do-not-send=3D"true">Intel =
XE#3876</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13631/shard-bmg-6/igt@xe_exec_threads@threads-hang-userptr-invalidate.ht=
ml" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@gt-frequency:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-432/igt@xe_pmu@gt-frequency.html" moz-do-not-s=
end=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4819" moz-do-not-send=3D"true">Intel XE#4819</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt=
@xe_pmu@gt-frequency.html" moz-do-not-send=3D"true">PASS</a> +1 other test =
pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc=
-ccs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4212" moz-do-not-send=3D"true">I=
ntel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4345" moz-do-not-send=3D"true">Intel XE#4345</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4522" moz-do-not-send=3D"true=
">Intel XE#4522</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13631/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-c=
cs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705" moz-do-not-send=3D"true">Intel XE#2705</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212" moz-do-not-send=3D"true">Intel XE#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-2/igt@kms_content_protection@lic-type-0.html" moz-d=
o-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-6=
/igt@kms_content_protection@lic-type-0.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" m=
oz-do-not-send=3D"true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_content_protection@srm.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2341" moz-do-not-send=3D"true">Intel XE#2341</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-7/igt@k=
ms_content_protection@srm.html" moz-do-not-send=3D"true">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-se=
nd=3D"true">Intel XE#1178</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt=
:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-ind=
fb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true">I=
ntel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-ind=
fb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">I=
ntel XE#2312</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrf=
b-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send=3D"true">In=
tel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb=
-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Int=
el XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-=
shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">=
Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_13631/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri=
-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send=3D"true"=
>Intel XE#5390</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=
=3D"true">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do=
-not-send=3D"true">Intel XE#2311</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
pr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"tru=
e">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13631/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primsc=
rn-spr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D=
"true">Intel XE#2312</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-re=
nder:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-=
indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tru=
e">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13631/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-=
pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D=
"true">Intel XE#2313</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pi=
pe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-s=
f-dmg-area@pipe-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send=
=3D"true">Intel XE#4608</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-5=
/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" mo=
z-do-not-send=3D"true">Intel XE#4608</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-=
dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send=3D"true">Intel =
XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4608" moz-do-not-send=3D"true">Intel XE#4608</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D"true">Int=
el XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13631/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dm=
g-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2893" moz-do-not-send=3D"true">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send=3D"true">Intel=
 XE#4608</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-=
sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2893" moz-do-not-send=3D"true">Intel XE#289=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899=
" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-lnl-7/igt@kms_psr2_sf@pr-ov=
erlay-plane-move-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-no=
t-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893" moz-do-not-send=3D"true">Intel XE#2893</a>) +=
20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-full=
y-sf:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuou=
s-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"tru=
e">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-1/igt@k=
ms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-se=
nd=3D"true">Intel XE#1489</a>) +36 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-435/igt@kms_psr2_sf@psr2-overlay-primary-updat=
e-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">I=
ntel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-463/igt@kms_=
psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Int=
el XE#1489</a>) +41 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#1128</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-se=
nd=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_13631/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#1128<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" =
moz-do-not-send=3D"true">Intel XE#1406</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE#1122</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-s=
end=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/IGTPW_13631/shard-dg2-433/igt@kms_psr2_su@page_flip-nv12.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1122" moz-do-not-send=3D"true">Intel XE#1122</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz=
-do-not-send=3D"true">Intel XE#1406</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2387" moz-do-not-send=3D"true">Intel XE#2387</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D"=
true">Intel XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13631/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-s=
end=3D"true">Intel XE#2387</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-3/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4609" moz-do-not-send=3D"true">Intel XE#4609</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-=
send=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13631/shard-lnl-2/igt@kms_psr@fbc-psr2-primary-blt@e=
dp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1=
406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
09" moz-do-not-send=3D"true">Intel XE#4609</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-no-drrs:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-lnl-2/igt@kms_psr@pr-no-drrs.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D"true">In=
tel XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13631/shard-lnl-4/igt@kms_psr@pr-no-drrs.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406" moz-do-not-send=3D"true">Intel XE#1406</a>) +36 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-dpms:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-463/igt@kms_psr@psr-dpms.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D"tru=
e">Intel XE#5899</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929" moz-do-not-send=3D"true">Intel XE#929</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-436/igt@km=
s_psr@psr-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true=
">Intel XE#929</a>) +68 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-7/igt@kms_psr@psr-primary-page-flip.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=
=3D"true">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-8=
/igt@kms_psr@psr-primary-page-flip.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-d=
o-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" mo=
z-do-not-send=3D"true">Intel XE#2850</a>) +62 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-3/igt@kms_psr@psr2-primary-render.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2234" moz-do-not-send=3D"true">Intel XE#2234</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D=
"true">Intel XE#5899</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13631/shard-bmg-8/igt@kms_psr@psr2-primary-render.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not=
-send=3D"true">Intel XE#2234</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-2/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2414" moz-do-not-send=3D"true">Intel XE=
#2414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5899" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-3/igt@kms_psr_stres=
s_test@flip-primary-invalidate-overlay.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" m=
oz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2414" moz-do-not-send=3D"true">Intel XE#241=
4</a>) +1 other test
              skip</li>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-435/igt@kms_psr_stress_test@flip-primary-inval=
idate-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2939" moz-do-not-send=3D"true">I=
ntel XE#2939</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-dg2-434/igt@kms_=
psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send=3D"tr=
ue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2939" moz-do-not-send=3D"true">Int=
el XE#2939</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2509" moz-do-not-send=3D"true">Intel XE=
#2509</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_13631/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel XE#2426</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-mmap-new-huge-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8506/shard-dg2-463/igt@xe_exec_system_allocator@once-mmap-new=
-huge-nomemset.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2594" moz-do-not-send=3D"=
true">Intel XE#2594</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_13631/shard-dg2-435/igt@xe_exec_system_allocator@once-mmap-n=
ew-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915" moz-do-not-send=3D"true=
">Intel XE#4915</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mocs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8506/shard-bmg-7/igt@xe_pm@d3cold-mocs.html" moz-do-not-send=3D"tr=
ue">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4760" moz-do-not-send=3D"true">Intel XE#4760</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5440" moz-do-not-send=3D"true">In=
tel XE#5440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5545" moz-do-not-send=3D"true">Intel XE#5545</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13631/shard-bmg-2/igt@xe_pm@d=
3cold-mocs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Inte=
l XE#2284</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8506 -&gt; IGTPW_13631</li>
        <li>Linux: xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695
          -&gt; xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2</li>
      </ul>
      <p>IGTPW_13631: 534a431f3c1b55292b8d0599594787f0bd7af6f5 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8506: 7d64f83f6d40ca187e9f317007c03db9d8b34ffb @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-3611-5481954bd63bd4d34a5acb2b89fb2caf55bb0695:
        5481954bd63bd4d34a5acb2b89fb2caf55bb0695<br>
        xe-3612-f1bad25fa12671f09a9afaeba55789eb519c1eb2:
        f1bad25fa12671f09a9afaeba55789eb519c1eb2</p>
    </blockquote>
  </body>
</html>

--------------8ticlW1lGFDrUVO0jUnLglx6--
