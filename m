Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639F4C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 12:44:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 250A910E50F;
	Tue, 30 Jul 2024 12:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0n4AAZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92A810E22B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722343471; x=1753879471;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bqwHNVHNtzHcrZOBozz6oH/UGZGFQ0aOIGjje0Psp7A=;
 b=O0n4AAZ/dx5ByGfhCiFFWy2tTcOIh8mr/hs/m8TtgZrGw2DZa9PJkW7q
 U38OrHmltS8Jpjawa6OwMiuCyMYIk7B7fX5T6VHcLMD0d1WyO1f4lf23e
 T+oRyXpQpwHfnmL5Km6HTOmZpUeJ28IRj7VQ6/TQfhULtWZDc4Hd7cq71
 k7l0jyHJBJhtowE4OO6oDiaepqO5YxwkfDs7n8p52Dcpm2N777iWV9xsi
 4BAKdVhp7RUqdWl1LGs9fVl4UaLlib9Ar7M+0dd8BPtUaJ6jLbBCkEa4M
 cNSGtKZ+yQmLxoluDdaXUnjG2KuvEbnSQRfuSp/eE4VvcKBZ47MNyHqR9 A==;
X-CSE-ConnectionGUID: gPMtzZsqRlOAGCfdBc5v/A==
X-CSE-MsgGUID: MolzqKZZQGu03Bntywjlvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20038992"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20038992"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 05:44:30 -0700
X-CSE-ConnectionGUID: g87mb7l1Q1WB/jho1SFiIw==
X-CSE-MsgGUID: 1LXTCyW7RsiCSPnK8UgjIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54371927"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 05:44:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 05:44:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 05:44:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 05:44:29 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 05:44:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fTaKoPQfhvKQJSpLbDLK0W2QLWbwyMpn5whksxcQWJ84fiTCx8Q71/frQn2WDSscPqs6kdaT+CmT355ho6on0iOgcZwT/zyDCl37HYBUAAiJwcNdqwCQoNdZTjPhutqfjHIzaqRVRoYxLLNglMoFOJ4qZsF/E9gcaHMFTlygbxY3bLx9HYs9yj87R5vbNajDDgHRMSKnTWeKOpAGfxfb5ac6PRZyg0clAnrAYfVWrpprPXXMJBFK7QF1V7QHR5o6kweFfvB9xeRPSzl6ZMW5QU8pPRuICZ2r/XExlDz47zO4mAgseOCjw58v6KC2jgfbgkan11cEz13sDeUQp3kEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v05z9iSbjA+avSZ/9zMMLlyo7gRcPldfj36tTXxtV18=;
 b=Gb5gOBhDnn5wdRY7mJM2Y741R5W7B8i1FAGOI2HGy6G1o+2Q+3hhdxFOUan7DuxcrjmUnAZuDtBuJkw/YNnBOcMJ/Kc1wf5mENq3ZHjAN2JyOz0rHdxg2f/TsAXN0jcR1v4EigTkUESpe0oCmjk6fP7DjiU4VIvE7oI7/WvxQWIjyIhjTmGgdkPqWsC2m5s4e5+jMHNOeOj+pLJZhgETLaW9O5snaEPwm/sRj0aiu2zdXK3ohHtCZktXU7r7dY6MMbVsijLrR93NR/lWk4z7UO2xCDzhbPKBqDoyXJm34I3N9/SgozWiTDOG8kz3ifKtlZEGHxgdoTtqhmQ8lN04hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.28; Tue, 30 Jul 2024 12:44:26 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 12:44:26 +0000
Message-ID: <0256f62e-e27b-490e-b414-88cca0fcd18f@intel.com>
Date: Tue, 30 Jul 2024 18:14:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <animesh.manna@intel.com>
References: <20240730083111.2897557-1-jeevan.b@intel.com>
 <20240730083111.2897557-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240730083111.2897557-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::33) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 41379839-7864-461c-e44c-08dcb095585f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3BrSnBVL3VtNjVKbjk1dFpPaUlLWUpWUERiVmVMVTIwaDdYelZXRHJTZkhI?=
 =?utf-8?B?TlZnajRrUVlwVElBSnIwSzdONFBpYWhBbGY0SEh4ZGQ0dndKRnlXNlo1QWtZ?=
 =?utf-8?B?TFoxNHJHUm0vVHc1Vlp2eHFPaWIvOUpsSnpnUFlBVkMvNHltZmhUaENGazly?=
 =?utf-8?B?RE5iMVREalRRMUM4UDJXWmFNOWhBOHRybEJtc1dkQk9iMmxNcXhJUlRHZ1ZY?=
 =?utf-8?B?Z2Y4NWtqc2VrK25aMm96TUMvWjY1M3JmODd2K1lybDVLV2MxWVhpbzRxQzFr?=
 =?utf-8?B?Zlo4di9hbnU2SkMxQUltZWpRUUZHellWLy8wWkFtK1NYaW4wci8xNHpOQzd6?=
 =?utf-8?B?djFxNTVoZUovTWtQUHhmdlY1cmFsN1dEWk83bURjWVhFK1FabklkNkFuZ1Jn?=
 =?utf-8?B?cXNuajV6a1BEOU92Kzd3QlJpenFoZjlBclhPVkhlenBta0wvanBobVloeGVt?=
 =?utf-8?B?TS9mN2IxUy92TEZJekpDWjR0akx3M2lBUzcybUY2NjJ2bVhiSlFiT2cxOUZv?=
 =?utf-8?B?anpZelEwS1Z6Q0RzMURncmx1MjBlbFZQSllwZGxTZlYza1pObGV6aEp4TGdX?=
 =?utf-8?B?UDBOVUY2RnVINDRzYW5lODhIcWY4VW51UytnemFsYU8wcFBSR2Z3Y2EyNVlj?=
 =?utf-8?B?OUo4bXZpeCtoTUsxNmdnMFpQQTNBaFI2VzUvZld2aVlydUNmbmM5a252SHNV?=
 =?utf-8?B?ekViUnR6Y1RaUDlHRWVnTkU0UVRxQkRpcjZuRjMveVFMZ3V3Njliai80Z3Ra?=
 =?utf-8?B?MTg0a1cvNzRMZndrYWNnMzM4K2ZORTZCZFZvVTBEdGVxSUtweFE3SEsxWDVv?=
 =?utf-8?B?OWNmUm5YK1FjNW1WVklNYXVOL29sTjZ2Szk1NDI2aFNUNmhOUnVxRUtJazFL?=
 =?utf-8?B?ZDdSL3RMTHFwTXFRUURCQWdPMFdpb3F1bHNSb2VEaldqWG1GaFZIM3lJT2Y0?=
 =?utf-8?B?UUNITGp2UjN3dTBuVEtRYmVWZjd1NHVWRzhscVlEMzBkQTJtZHJjQ1NrUUN6?=
 =?utf-8?B?V01aNlhqS2tKTm9VS3FWcHF4QWVIVG9iWDdTd202eUtXY0xQSFVUMWZ2bEVp?=
 =?utf-8?B?aHJ6REgwUmdhRTQxenNXUkRmQUJDbjhBVjNQcUNVU3FoMWt5UE1qcDRnVXli?=
 =?utf-8?B?SHBmbzk0NGNkOGRsU0ZCWjQ4OFFYRGNNMUMwenNzYjhxQmZiWmE2OUcreVNj?=
 =?utf-8?B?UkQ5aEFnZEQrU0p5bXEwWC9JNHRIaEhZK2ZXZUh5bnp0c0xkWHNvTm9RdUxM?=
 =?utf-8?B?bXFkQkJES3NnZUVuSmZURjNtOHk1VXVWUmlJZmVqcWNjZS9NRi8vSE1xSWVI?=
 =?utf-8?B?UGFwdUczRlVWOUVDTzQwbldVMTdBWXAyOGtGbU5XcU02K2JVT3R2NDBOa3Ji?=
 =?utf-8?B?LzEzTXJHc2UvcktFb3dBZjNNMUYweVJYV3l1Wmx1d0ViY1lRRk5QZHprQ3VU?=
 =?utf-8?B?RzFDV2VpeVN3UFNRa29helc3NVZkeFJKZ1U4dzJ2WW1rcktzSlZlS1JwZGZW?=
 =?utf-8?B?aXRwcWZCUElKbXlxSVlFY0xMNHg2RVlmdGo2WXdVajRrblZ4cm42RlVCaXVX?=
 =?utf-8?B?OWFWSUlmQnJhS2g4M2h4VjZuYlRrM25ZRTBpVEd5S1IveEExM2hqUklzOVN1?=
 =?utf-8?B?UUxRcTREb1RURXI3SWVBWW9mOGtqZmhPZDdSWmpVQVZkblNXNFJVaGNsV0tm?=
 =?utf-8?B?SHp3MkZEUmw5cmFOZUU1Zkd3V3NQclFKTDk4TEM5bVJBWk9yY0VKYWZFcHNY?=
 =?utf-8?Q?XxKuc3kc4KST+PvTYc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TCtVcFJ6clV6d2R3MzU0eUhOcVI1VVRCS3ZaSDNYRHplVHozT2hBcS9jbWNY?=
 =?utf-8?B?aUxyM3pLUjFsT09idWJCRTlxVWdRbmdCdFNuUEo4QlBuNlRMOTR3VktZeUVu?=
 =?utf-8?B?RUxZRm5CN1d2RGJ3aGU3Z08rbEpINVV3TkdKRm9pQ3V2eXNWbDBTenV2S0tB?=
 =?utf-8?B?WnlQcVJUNHlyM1l3dWdiR2p0R240N2NKZklxbi9nVnhlRG5TanVTcW1IT29E?=
 =?utf-8?B?ejRSMXVOUlpBYjBqMDZ3bjFDeitucHg2c0ZqbXlLWXpVQkJkRC8vY3M4ejBu?=
 =?utf-8?B?djhWME0zeUJ0RnpHU2Y3d1FnZ0tzS1ZsMWdCRUdFL1kvRFl5ZGZJRzV3ODVW?=
 =?utf-8?B?L3NYcUZNTUdzK1hhUjFQa1lrTndkY1l5RXZqVERQSlY0cWlLaWROOE9HcGhy?=
 =?utf-8?B?U0J3M3dsY3dvSkJqT1VFZ3prOWMydmx6TkVqQnRhc3F3R2pFRkE0ckVldGFF?=
 =?utf-8?B?clFiWkY4WVVUSU9RMGdNUmh2NDZzUm51TVl2bWcvVDkrY2IwQ3k5RnR5QWRL?=
 =?utf-8?B?dEpCODlxUTZ6L1EvQ0tWbm5TVmowb1dKRkZERmxPZmd6Skk4dU8xUmNFNElS?=
 =?utf-8?B?V0lQK05IK3hRaDFCT0tFeTBJa0laNURIU1VUMnlOWHY0VHNMMHIvcHhvWEh2?=
 =?utf-8?B?RnJmUlZDNVU2ZVdJVnpUWkNTbStZKzZITUxXdEZXY2tmWDZNYm1JK1ozaGw5?=
 =?utf-8?B?MVZHcXdHeXExRWg5RUcxNjVIeGRjeFBDbTk5L2o0T3Fnc3NxVk8yNDZTWk9w?=
 =?utf-8?B?d2VSc3ZMTGxzb2Q2WkJNN1VIMzMyMUJrOGtJUjFOaVFPRnFrYUtvT1NJK1oy?=
 =?utf-8?B?OEIybWdwL3NIMDVEaXYrVDZ1TXR3dWhIeDluSzB2RFhpdDJsM0lYQlRnUDdO?=
 =?utf-8?B?cFk5eVJSQWNxM2dRVE5FMUJLdk04ZElwVk93blZGdHdTenZVYzNoenh5WU9H?=
 =?utf-8?B?dmg5ZDRjSFY5cmM0Z0lTRngrcm1nSFhhNWxmdTFna0lneXFQakpOR1VVYXZk?=
 =?utf-8?B?K2FGL2I3dDFHUWpoMzF2ZWQ1M3ZEM3V5WW1qcVM5dVFxM1I2ZWNDczNHeWpS?=
 =?utf-8?B?VXNSY3drYTVZU21ZSjJDVEFJUzBKZjF0Yk0yazZMZXdLRzJvekliRGY4dHU3?=
 =?utf-8?B?SmhBNmVuajhOODE4Slg4ODNONWhPMUlXQ0lzdUNFTVljdXBsSzdGeFFYSmgw?=
 =?utf-8?B?cFAwRSs3OENSZ1h6WDN6MVIyZFQwQ0s3QkFVanNIN1duTFllMHYvYkQrSzFJ?=
 =?utf-8?B?eWlpaGxXdWJlYTZJd25jVm54bEcyUS9PeFRMaEQxNzFJR1dsV3FPNUU2VGM2?=
 =?utf-8?B?R0lMbGU2TDA1bmtITVhxMitIR3NpT1ZHY2hNZ2tOWFhCa0lyNGk2YzY3OTRy?=
 =?utf-8?B?RHB6eEtnRnVtaXo0L2s5cWIxUmlZdUlobXl5WnNHckwxaUhUcm9LbEozRm1K?=
 =?utf-8?B?TFZBbWRQUHNaWUhvRlZyeGxtUk5IZEd6TjNnY0ZCNytqNmNkYU00d2hRcng5?=
 =?utf-8?B?TUtKTGQ1VmVrSmRtbTArWUF1aDBFNlNBMFF0enBBSXpVQ042TjZSMVlxSGxR?=
 =?utf-8?B?ZVFPQXlGTm4ybUkxaUpkTkhwYUVlUWI5UmtQbFJieTY5WVdEZ1FKZngvM3gw?=
 =?utf-8?B?QTVJTlpERXNMUEtDa3dYdWl2dytMam0yZm8xY1lPL2drMHdNTUUrb3JjU202?=
 =?utf-8?B?TzhKakxUQnpEQzdrUnFRRnRJYXd6d1UwT2UrLzlhbDVvdWJicStvWnFkVWtL?=
 =?utf-8?B?KzVWTUxOQXF1VGUyMmwveGtRM1h2Zlh1KzduaDV2YmVHRWp1RnA5a09WUmps?=
 =?utf-8?B?eHVwWDB2WnArSDZLTGdJajY3OWM4aXZ1RXZwU0FXbVFVYVR5TG5BT1NreURj?=
 =?utf-8?B?VjJPOTUvcUkxN1BqVWJOKys0c1YvUXM2RUhNRi9uTldveWR2R3ZyK0Y0RUhi?=
 =?utf-8?B?Z0ZpTFNScE1jYzduSTVPM2tkZXFPZThJQVNwUVNjd2VRSlFGNk91bUdNaDVL?=
 =?utf-8?B?cU5PQVdTT1lFTHgyYy91Qm14ZFpicWtFN1RGWGFiOUF0RFlxeUFzNVdWaDdG?=
 =?utf-8?B?eDd4NWVGaGJqYzFjekFpMHBIN21ZUlBCYldzUWZFWnZTVXlYeG4yS05RMStj?=
 =?utf-8?B?ajg5OG1GQ0pSZ3ArRzVNcWI0ZXBqa3dsd1JadjFJdzU0bHlqYmFMeHNKaUhv?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 41379839-7864-461c-e44c-08dcb095585f
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 12:44:26.0422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psQVEW95uXa+po+jav4RbBxHc1pEvMd2G9s7bWwNJVMx+ld7Yywkb6l4LF5RBS3MrXHQeTv+QPj3XVV7PGSfiK+uHqawOjYE8J3mIfdxPXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
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

Hi Jeevan,

On 30-07-2024 02:01 pm, Jeevan B wrote:
> Validate refresh rate changes that appear to be stable but actually
> change slightly in the VRR using the fixed refresh rate framework
> for non-PSR scenarios.
> 
> v2: Add PR check.
> v3: Update commit message and fix code structure.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 65 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 7e8885f16..88855b01d 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -31,6 +31,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
> @@ -76,6 +77,11 @@
>    * 		without a full modeset.
>    * Functionality: LRR
>    *
> + * SUBTEST: lobf
> + * Description: Test to validate link-off between active frames in non-psr
> + *              operation
> + * Functionality: LOBF
> + *
>    * SUBTEST: max-min
>    * Description: Oscillates between highest and lowest refresh each frame for
>    *              manual flicker profiling
> @@ -106,7 +112,8 @@ enum {
>   	TEST_FASTSET = 1 << 7,
>   	TEST_MAXMIN = 1 << 8,
>   	TEST_CMRR = 1 << 9,
> -	TEST_NEGATIVE = 1 << 10,
> +	TEST_LINK_OFF = 1 << 10,
> +	TEST_NEGATIVE = 1 << 11,
>   };
>   
>   enum {
> @@ -129,6 +136,7 @@ typedef struct vtest_ns {
>   typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
> +	int debugfs_fd;
>   	igt_plane_t *primary;
>   	igt_fb_t fb[2];
>   	range_t range;
> @@ -784,6 +792,45 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	}
>   }
>   
> +static void
> +test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	bool change_mode = false, flip = true;
> +	time_t startTime = time(NULL);
> +	time_t secs = 4, change_time = 3;
----------------------^----------------^
What is the funda behind these magic numbers?

> +	igt_plane_t *primary;
> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +
> +	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);

Please move this initialization to output_constraint().

> +
> +	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> +		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
> +
> +	igt_require(!igt_get_i915_edp_lobf_status(data->drm_fd, output->name));

I would recommend to move this check to output_constraint();
Ex:
	if ((flags & TEST_LINK_OFF) &&
		igt_get_i915_edp_lobf_status()) {
		igt_info("Please add your skip message");
		return false;
	}

> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1, 1, 1, &data->fb[0]);
> +	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1, 1, 0, &data->fb[1]);

Please re-use prepare_test() to create framebuffers.

> +
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +
> +	while (time(NULL) - startTime < secs) {
> +		flip = !flip;
> +		igt_plane_set_fb(primary, flip ? &data->fb[0] : &data->fb[1]);

Instead of this loop, can't we use flip_and_measure(3 sec)?

Ex:
	prepare_test();
	flip_and_measure(3 sec);
	igt_output_override_mode(low_rr_mode);
	flip_and_measure(1 sec);
	igt_assert_f(igt_get_i915_edp_lobf_status("LOBF not enabled"));

> +		igt_display_commit(&data->display);
> +		if (!change_mode && time(NULL) - startTime >= change_time) {
> +			igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);

What is the expectation if there is no LOW_RR_MODE available? I can see, 
there is an VRR panel available in CI which is having single mode [2]. 
Is this test not applicable on this panel?

[2]: 
https://intel-gfx-ci.01.org/tree/intel-xe/xe-1689-7d7c6494ae7dcfb15998b64387ba66b49da16286/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

> +			change_mode = true;
> +		}
> +	}
> +
> +	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> +		     "LOBF not enabled\n");
> +}
> +
>   static void
>   test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
> @@ -851,6 +898,15 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	    !intel_output_has_drrs(data->drm_fd, output)) {
>   		igt_info("Selected panel won't support DRRS.\n");
>   		return false;
> +
> +	if ((flags & TEST_LINK_OFF) &&
> +	     output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)

Instead of writing a new condition, why can't we extend the existing 
logic [1].

[1]: 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_vrr.c#L846

> +		return false;
> +
> +	if ((flags & TEST_LINK_OFF) &&
> +	    (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)))

data->debugfs is not initialized, hence this check will never pass.

> +		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
>   	}
>   
>   	/* Reset output */
> @@ -1030,13 +1086,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> -		igt_describe("Test to validate the the content rate exactly match with the "
> +		igt_describe("Test to validate the content rate exactly match with the "

This change is not related to this patch.

>   			     "requested rate without any frame drops.");
>   		igt_subtest_with_dynamic("cmrr") {
>   			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
>   
>   			run_vrr_test(&data, test_cmrr, TEST_CMRR);
>   		}

Please add one new line here.

- Bhanu

> +		igt_describe("Test to validate the link-off between active frames in "
> +			     "non-PSR operation.");
> +		igt_subtest_with_dynamic("lobf") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> +
> +			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
> +		}
>   	}
>   
>   	igt_fixture {
