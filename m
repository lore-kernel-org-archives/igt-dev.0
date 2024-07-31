Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D45C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 11:52:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE55110E05D;
	Wed, 31 Jul 2024 11:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nb7xQnhb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C0710E05D
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722426723; x=1753962723;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ljfE1ct4MIcIGFwWM+w0uTtUWJ26yB4BYZTYvzqmWg8=;
 b=Nb7xQnhbqYMilnfYqloeSSZfNfIZAHHI2P13JjY0cj2S0RuZCSBCfbsA
 XZpEOQsXancioX1yvp3RbqZbawAUsL26fPPlBLp8bx/udLedeHJr9sI0E
 TFr1La8F4AGnBA0uuij/nLzoZUhPBSj94KEYG0MvbnricRuYg1liuO2ls
 gQZWaW+PwLxVEKJrar82SGroZ0zqG/ZO19UwZp3LW+fAhCwbQdQQbfW1F
 qIDjBxJjF3IiPUeEGxV4fi9+LPQLbYmG6GxK6XNpalxprczd41+AQ03d/
 Sw05rtjTxFJklZRDNSFgI/++kw1eYrxJuQ23efwe/M1XYxSUImyO5TgiN g==;
X-CSE-ConnectionGUID: XWJ4AnZQQfyCbt57T+byMg==
X-CSE-MsgGUID: ix6pY1EsQSC+Q5fuGn7DEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30963234"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30963234"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:52:02 -0700
X-CSE-ConnectionGUID: EEdPLOf3RamtAddhXAEqTg==
X-CSE-MsgGUID: E89s0o91QzOQcQNqhHaGeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54548815"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 04:52:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 04:52:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 04:52:02 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 04:52:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 04:52:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TKnOys4/3BgRabgTlwV/V8l3e0h7Tc1U8kMwPBW41FZqldijCWHmdubY/Kuzws/jyuHrw0f2xMwBHcwROkHfP36S/2RYxaPIxeYuN4Nwiwoo4wA2Dlct+SzGsAA6JpekdYltRcLaL7ilEWZJyHWklcyzE8WDDSCgzJSl8/gkDBSnxON1K9Iqswy2RSpLEuqe68j1JY0uAVZD2aMb5Q3tiqDXur1B+aj+g/N/WRmc9PczHqRa1hM+zYqdBcHE9aMtXTBi204rLRQjtCJw7Eaxnct3lUs9ycgoESxTDgJ3mEKhVnuVwT4yEjqfBNNHFVepfXLJ09h8Dy+1kxZ6eSxh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQ+5m4bN9Z7+2PGADsSL0f+26WKz4lUf/Mf3kSjcqYI=;
 b=kCy/Y0K2YwCxuhxfBtYGJTNocx2XPNDPpk5n+5x3rLVFT6TdFnN5eU/PAKkGAtYSsjXuah7ePTppkNvCBjlg9zLg2KixUKJKembRb1aWhHwFU5D87UirGMEQkwel+FeYYivevgAgK3xVwZPMywv9ha02z7HyZbUCrxF6aKNM4ChVFOlXMSvtUn45Ycuz8jIjYz81uACNc9wN02x72YjzTLMwtNZSs5UFHt7LIyv/JZ7deZq+9DW/bYiaBguFaj2W3Hc3VZqmKmdXhwYclgygH02MLWmHKIe+bsXI6+5ITe5XV+6eFTeiLvRxkpW/GDHLmob6rGVW6brGjwEsVNekHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 11:51:54 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 11:51:54 +0000
Message-ID: <63449715-ba4c-4012-98da-9a635635795a@intel.com>
Date: Wed, 31 Jul 2024 17:21:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/amdgpu: Add queue reset test
To: <vitaly.prosyak@amd.com>, <igt-dev@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
References: <20240725231419.453685-1-vitaly.prosyak@amd.com>
 <20240725231419.453685-2-vitaly.prosyak@amd.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240725231419.453685-2-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0004.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::17) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB5039:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b23c119-6599-4250-4dcc-08dcb1572bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVFHWjdJcVdvT3VIUm9MY21HRHN0OW80UFdxdTAyUVVXeGZaWmpMQU1mTHBU?=
 =?utf-8?B?VDdLOUI0WC9VVFV0djZuRGhOTENRNjRhalAwaDB4MkVYWXBERjI5S0k3S25u?=
 =?utf-8?B?UjVNNVVPKzFrZEE3VG4vSUFNSTRJcFNkN2w4VlcycVV6ZnJ2bXpXbTlVTXd2?=
 =?utf-8?B?OUxjNzZpNHVJKzlIRXA4YVBxVlNucE1LaEFTc3JHZnR5RmFqWGFiLzhEajhM?=
 =?utf-8?B?dG9uNlF1RzZ4RmtyQ2owWE5sc0JoZ09IdmtvNXRpVm54dkVEY2dvNExKMUJN?=
 =?utf-8?B?RFY1bzdjb3RSdngyWFFlQXdhLy94U29ZY2Y0NDM4TVFJWCt2OTQzV09sUW9o?=
 =?utf-8?B?eDJsQ3BiaktZM0JTTGpwd1RnN1FjOUNuMUNNS3pla0oxSnljK3RxWHBJYzRY?=
 =?utf-8?B?TExJUE43Q3pLNmozWjM0cTYvbmc5TTZobUFMS29qSENpL2d3UEdQRTEyN0Vj?=
 =?utf-8?B?Rm1xbWVVbmZOUjA4bkVtK25DcHVqcWw1aGx4a2MwZkFtRkxiRUozUHNxd1JD?=
 =?utf-8?B?SnNVZ3ZtVW1oRHZLOXpUS0pKdDJCYS9NZ0NCY3E3MHp0aE9kZHFHbFZKTHcz?=
 =?utf-8?B?RnpTb1ErM0dLTS9RSzluS1FoQmZZMDZxbmhIOUI2YnllQ2JWNGJDcTd5QXVB?=
 =?utf-8?B?c2crU3I5S3hGN2NZL0M1RW01V2N2RkZGOEllUnZKUUJ6bmo5MXdoSngyb25k?=
 =?utf-8?B?b21qZDlQMUpTTGN4S1AyR3VNcXBDQmFYRlN3RlAwTzlHQ0c0L3Q5VFRGZmxL?=
 =?utf-8?B?VGp5c2hRQmpKWlZ3U3JoalJXMnNwUkRhVkpwenRyNkFBbnp6RW5XUVh4QWRL?=
 =?utf-8?B?R1lwbWJlTG55K3RRQVcvZllUb2MwenV3Y0l5ZEp4cHM0Qmc3QVU2bWRCeW45?=
 =?utf-8?B?QmdCR3poUXF0R2hTUmt6WTZsamgxR3p2MzRweklrU3puWDhJSW90S0xQSUNr?=
 =?utf-8?B?TFRySDZsZ3NXN2kzbjJqZm5lZ1lReUdQbmRtSnFSNFVDZXFmQ25WT2hDN2c1?=
 =?utf-8?B?MmZGMHhMV2t1Q3BOM0RMRUtSeXd1WTRTS2JrUDBMQUlzRnVyc2cvTVg2S010?=
 =?utf-8?B?c1FMbzByYzA2MUJMMEFqMi9qUkNLeHROb3BGYVVuTVlCNnZ2bHg3c2trTjVX?=
 =?utf-8?B?ZHlTaUZwU2dwQVlLaWdUc3JhWU1ReFhDWWFJOEhtbytyMXp4cFRVMnIza3BC?=
 =?utf-8?B?SjVLVVpCOWhNSmxhKysxNXI1VEtkeWlkVXdqaXBhK0F1eXJqK0RNMXZTZnNU?=
 =?utf-8?B?UFdGNzJQUFNUbm56UW9BdUpLUzlCTHYyZ3lXNTRKd0I5NUFZeEdZdFZPNFQw?=
 =?utf-8?B?NWhNMHJoMkNrd0c1Mit4WEZwNjdWYzZSa1U4ZVEyT0NBVmpRbFl5aTBjcjMy?=
 =?utf-8?B?KzZ2c244WmM3WkxiU2U0bzV5MDd6UU9vUjM2Y1ovU1BzVVg4bUs4bmZpdlRR?=
 =?utf-8?B?YU1wb2FlNUpqU05FdTlBY1htVzVrc1puZUFLWVJaZDRCVjZYZU05SXprbTZt?=
 =?utf-8?B?eGRCaENOdHFWaE9JYXZ0YVJuY3FkOEN4ZmhmQjNab3g1WUpJb0hTYlFkVVNm?=
 =?utf-8?B?QUxvdUlQM0NyTUFSOExQbUpCdTRoRkJnMVBDMEZYV3RHM2FIMHFidFdNWStX?=
 =?utf-8?B?RGdvRDArbGFSSnBWb2tVb2lVYzlqMWdGeWhWekY0Wmg1Zm05Y1IrNSs3KzZh?=
 =?utf-8?B?c3dWRFBOSmNJWnQyclBGS0xIL2hyMWlGeVdNL0lWY2I0eSs0NzA1MGN6Sm0w?=
 =?utf-8?B?Snpkeis3MUdrNllVR0ZzVHEwMFFtUW84UXh1d1RRRmFZaFhkczhLZkJLMVJH?=
 =?utf-8?B?OXpoUjFMZmVJS0M5S1dvdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHJRUnJycENDTFpRelhYZ2V5WExhWFpUajJxaURIMThEUGZZTUN4bkpPb05Q?=
 =?utf-8?B?U0tHT2JxUVloUWlpUkJrV2sxUGx0djFGbkFlaXlHREFWd1htdnRYcVBRMXZP?=
 =?utf-8?B?MlZZamIyb210K2FFL0JJRldXekdIWXloTzR2U2taVFpkT2kyNmFzV3RPVDQ3?=
 =?utf-8?B?OExRd1NsYVl1MVpkN0VVNmtoRUttL0lLT1BIbitYcEc1dFQ3V0V5TlBSRVF6?=
 =?utf-8?B?anczZzlOeWtaL2dZTUlXSklBb1YzN3F6K3U1L3BkRGs4c1JSdVZVQ1lwVzE5?=
 =?utf-8?B?dWRWMlAya3dnYktiYkhiOU1iU0IxbXBlRlYzdVhWNkpCUW1PdVd4SnFJamV6?=
 =?utf-8?B?VzFiTkhmR0JFMWFiYjl2WFNhVjFsSW1vOXAwMGNoajBNTDd2dHlXUXlyL1pk?=
 =?utf-8?B?U0JOdDNKR2JUUEtlb054NllSNlJiSFlFNWppLzVnTnFMazJJVXVId1k3WDFi?=
 =?utf-8?B?QjR3MWFVWkRGWlpDTHR3UkVKMXB5T3JOSVNIbVlSWjQ2dHJuOUR6aGZPQng3?=
 =?utf-8?B?SFpRclM1c2src09YVzRkODVZQ0pxMUh6dGd3QjNZQWVPZnRmTW5ZUjFHYmVr?=
 =?utf-8?B?VmlzdVZSMzdTYWx3VjZLL1kxVnJrTEUrZytIQ0R3WmFocEJvbTcxY2JDS1BM?=
 =?utf-8?B?Vy9ITkR2SUozbk11ckMxYWdEV1FNVVIxWGc4VHlyTjEyb2x5REVGYjZHVFJ2?=
 =?utf-8?B?WHVHQ05GOUVjcXZKSmpBSGVBWksyWFNzbE1ESzBHcjlia2VLZ2haRVhCbFdE?=
 =?utf-8?B?VWVtbm5ZdUo5TmlyRFNOUFlYQ3F1N2FPeEhGUjRIS2lVL0dOL1Z1eS9pNmJX?=
 =?utf-8?B?TjhtYUE2SGJTYkpXUnNoR0xtNFhVUnZhV2dKalRKS3RwcUFBZUNndU56eXBo?=
 =?utf-8?B?QmZTZXVKUmQxeUpOcTNXV2NBUk0zbVhIT2FGcW11UnNYU0gyTlg5MWc3SWxY?=
 =?utf-8?B?Y09EdWg5ZWoyQkpUQ1ZnS3p4dWxtVm9OY253K0tpZlV6SVBOaXJFQUtHbFQ1?=
 =?utf-8?B?Ymo4UTNWZEUxL0lZaVJCZm9jUDRCYmZoemRVV25tbkd4UFU5cFpQNTZFZjRG?=
 =?utf-8?B?QWtwcSszcUVBSkNQdjQ5aW5Scklsa2xKSk0vSWFndkNXYW96d2pUTVlhamJh?=
 =?utf-8?B?aDRPRjZuT3VvaDJEd0czZlFjOG1KM2JCVlFBc0pIZys2V3BkTndoT1BDRVdC?=
 =?utf-8?B?MmI5TnYzb0JET0RDTkIxTlllMmpKaDRTRWlldjJpSisvNkN6Z0lXTlBHSmdS?=
 =?utf-8?B?LzVCVk9yMVlycDJxTXFMcEljOWJ4aGIzOXFkM0wxUUVZOXBjN1FianZKTHhD?=
 =?utf-8?B?L3VxRmk1MnV2WUNsRWxIMUg3V1RUREJFNEROVVNvVWN2dXNMUlI5Y3hYRXpX?=
 =?utf-8?B?ZkpCVFQzOHNtWkswN1VxQ2dNWEpRZHBWYXdlTmNqVkF6L0FlRTEwU244TnBY?=
 =?utf-8?B?NGJpSjhhdFpYVEhBRVNYeEkvZUE3blVZemR4T29SVDAxbjY0NkhoNTFycFJs?=
 =?utf-8?B?YTVNbFJBUTlvNVZLWmoyNDJxT2ZMUWY0S3N6ays2UnNncy9ObklLNmFvM3VY?=
 =?utf-8?B?MWVCWUREK1o4QVJpWHNyeUlERzM5VU1ZYm1Ebk51SjB3anZPUDd1dklTM0hz?=
 =?utf-8?B?dVJYdE16WjNrM0xmSmJROXAvaWwzcmNWRFo5S3NWMGdYYTNwNW4raldzaktH?=
 =?utf-8?B?RmRPRjk4cllLWUhjTTlLYTgwckk2L0hndE00U1VoSVloY0JhQ0Ewbyt3UDdw?=
 =?utf-8?B?UE1yWGp1UXhkZ2dKTE95elF3MmVXQlFKVDNTNVFVdUR4OXZrZ1cramU5N0tt?=
 =?utf-8?B?ZkNyUU0vbHd5OHJpQkJ5Uy9qK2pBSitLckk2eWVld3NnTXhtT1NPNzBoOWNm?=
 =?utf-8?B?cVQ2UjNVZlJ0YnFvTjNTdjloN3h4U25KTllOdWNsbmdiWlpCcWZ0QmJ2WXpM?=
 =?utf-8?B?MFdwc2p4d2Z6eWRnOURldXhOU2xnbkt6Y2ROZlcyM1IyQ3VKc2VGaGxyeXc1?=
 =?utf-8?B?bkJVMERWUmFKQWhGZy9vdGM0Y1IrWDZmYlZRR3hLR0FSVGwxcmVKUHM2R0hW?=
 =?utf-8?B?M0dxQzA0ZUFLWS80SUhYeEs5OHVoMDRHazFYcnUveGdWem53c2JDWlErQmkz?=
 =?utf-8?B?VVZhYlphWkwwSHRkU203b3RQNysvd0RBSGloOTNNMnhNbHI1SlR2dXJrenk4?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b23c119-6599-4250-4dcc-08dcb1572bdf
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2024 11:51:54.0116 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yH5QGFcQ6ckLrWw+DQYwaYPaPahJz10oCwyROad308UhEplmtC1qtbhlc2CN5u7AAK9EfFvKFrs07AXwGoxLbV6wGeFyB1k5+pIg1GWhOj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
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


On 26-07-2024 04:44 am, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Overview of Queue Reset Test Process:
> - Launch Child Test Process:
>    Executes various tests, such as BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
>    BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, etc., to evaluate queue reset
>    functionality.
>    If the amdgpu driver encounters a job timeout, it attempts recovery in the following sequence:
>    - Soft reset: Returns an error of -ENODATA for the given bad job. If unsuccessful, a queue reset is attempted.
>    - Queue reset: Returns an error of -ENODATA for the given bad job. If unsuccessful, a full GPU reset is attempted.
>    - Entire GPU reset: Returns an error of -ECANCELED or -ETIME for the given bad job.
>    After each test, the test waits for the selected recovery process to complete using a monitoring process.
> 
> - Launch Child Monitoring Process:
>    During each test, this process calls amdgpu_cs_query_reset_state2 and communicates with the test process via
>    shared memory to obtain the return code once a job is completed. It uses flags AMDGPU_CTX_QUERY2_FLAGS_RESET and
>    AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS, along with the return code, to ensure the correct recovery procedure
>    (queue reset or entire GPU reset) is executed as required.
> 
> - Launch Background Process:
>    Utilizes posix_spawn to submit successful jobs to other rings. Communicates with the test and monitoring
>    processes via shared memory to determine when background jobs should be interrupted and the next test should be run.
> 
> - Main Test Process:
>    Manages the above processes and pushes jobs to shared memory for the test process, sending appropriate signals as needed.
> 
> - Synchronization:
>    Sync points are established between the four processes at the beginning and end of each the test. Synchronization is
>    implemented using shared memory and unnamed semaphores.
> 
> This approach ensures thorough testing and validation of the queue reset functionality by actively monitoring and
> responding to different stages of the reset process.
> 
> v2 : Enable queue reset test for drmlib v > 2.4.104.
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>   tests/amdgpu/amd_queue_reset.c | 1046 ++++++++++++++++++++++++++++++++
>   tests/amdgpu/meson.build       |    5 +
>   2 files changed, 1051 insertions(+)
>   create mode 100644 tests/amdgpu/amd_queue_reset.c
> 
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> new file mode 100644
> index 000000000..fb05aee35
> --- /dev/null
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -0,0 +1,1046 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2024 Advanced Micro Devices, Inc.
> + */
> +#include <fcntl.h>
> +#include <sys/stat.h>
> +#include <sys/sysmacros.h>
> +#include <signal.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +#include <spawn.h>
> +#include <semaphore.h>
> +#include <errno.h>
> +#include <assert.h>
> +
> +#include <amdgpu.h>
> +#include <amdgpu_drm.h>
> +
> +#include "igt.h"
> +#include "drmtest.h"
> +
> +#include "lib/amdgpu/amd_PM4.h"
> +#include "lib/amdgpu/amd_ip_blocks.h"
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_deadlock_helpers.h"
> +#include "lib/amdgpu/amd_dispatch.h"
> +
> +#define NUM_CHILD_PROCESSES 4
> +#define SHARED_CHILD_DESCRIPTOR 3
> +
> +#define SHARED_MEM_NAME  "/queue_reset_shm"
> +
> +enum  process_type {
> +	PROCESS_UNKNOWN,
> +	PROCESS_TEST,
> +	PROCESS_BACKGROUND,
> +};
> +
> +struct job_struct {
> +	unsigned int error;
> +	enum amd_ip_block_type ip;
> +	unsigned int ring_id;
> +	/* additional data if necessary */
> +};
> +
> +enum error_code_bits {
> +	ERROR_CODE_SET_BIT,
> +};
> +
> +enum reset_code_bits {
> +	QUEUE_RESET_SET_BIT,
> +	GPU_RESET_BEGIN_SET_BIT,
> +	GPU_RESET_END_SUCCESS_SET_BIT,
> +	GPU_RESET_END_FAILURE_SET_BIT,
> +
> +	ALL_RESET_BITS = 0xf,
> +};
> +
> +struct shmbuf {
> +	sem_t sem_mutex;
> +	sem_t sem_state_mutex;
> +	sem_t sync_sem_enter;
> +	sem_t sync_sem_exit;
> +	int count;
> +	bool test_completed;
> +	unsigned int test_flags;
> +	int test_error_code;
> +	bool reset_completed;
> +	unsigned int reset_flags;
> +	struct job_struct bad_job;
> +	struct job_struct good_job;
> +
> +};
> +
> +static inline
> +void set_bit(int nr, uint32_t *addr)
> +{
> +	*addr |= (1U << nr);
> +}
> +
> +static inline
> +void clear_bit(int nr, uint32_t *addr)
> +{
> +	*addr &= ~(1U << nr);
> +}
> +
> +static inline
> +int test_bit(int nr, const uint32_t *addr)
> +{
> +	return ((*addr >> nr) & 1U) != 0;
> +}
> +
> +static void
> +sync_point_signal(sem_t *psem, int num_signals)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_signals; i++)
> +		sem_post(psem);
> +}
> +
> +static void
> +set_reset_state(struct shmbuf *sh_mem, bool reset_state, enum reset_code_bits bit)
> +{
> +	sem_wait(&sh_mem->sem_state_mutex);
> +	sh_mem->reset_completed = reset_state;
> +	if (reset_state)
> +		set_bit(bit, &sh_mem->reset_flags);
> +	else
> +		clear_bit(bit, &sh_mem->reset_flags);
> +
> +	sem_post(&sh_mem->sem_state_mutex);
> +}
> +
> +static bool
> +get_reset_state(struct shmbuf *sh_mem, unsigned int *flags)
> +{
> +	bool reset_state;
> +
> +	sem_wait(&sh_mem->sem_state_mutex);
> +	reset_state = sh_mem->reset_completed;
> +	*flags = sh_mem->reset_flags;
> +	sem_post(&sh_mem->sem_state_mutex);
> +	return reset_state;
> +}
> +
> +static void
> +set_test_state(struct shmbuf *sh_mem, bool test_state,
> +		int error_code, enum error_code_bits bit)
> +{
> +	sem_wait(&sh_mem->sem_state_mutex);
> +	sh_mem->test_completed = test_state;
> +	sh_mem->test_error_code = error_code;
> +	if (test_state)
> +		set_bit(bit, &sh_mem->test_flags);
> +	else
> +		clear_bit(bit, &sh_mem->test_flags);
> +	sem_post(&sh_mem->sem_state_mutex);
> +}
> +
> +
> +
> +static bool
> +get_test_state(struct shmbuf *sh_mem, int *error_code, unsigned int *flags)
> +{
> +	bool test_state;
> +
> +	sem_wait(&sh_mem->sem_state_mutex);
> +	test_state = sh_mem->test_completed;
> +	*error_code = sh_mem->test_error_code;
> +	*flags = sh_mem->test_flags;
> +	sem_post(&sh_mem->sem_state_mutex);
> +	return test_state;
> +}
> +
> +static void
> +sync_point_enter(struct shmbuf *sh_mem)
> +{
> +
> +	sem_wait(&sh_mem->sem_mutex);
> +	sh_mem->count++;
> +	sem_post(&sh_mem->sem_mutex);
> +
> +	if (sh_mem->count == NUM_CHILD_PROCESSES)
> +		sync_point_signal(&sh_mem->sync_sem_enter, NUM_CHILD_PROCESSES);
> +
> +	sem_wait(&sh_mem->sync_sem_enter);
> +}
> +
> +static void
> +sync_point_exit(struct shmbuf *sh_mem)
> +{
> +	sem_wait(&sh_mem->sem_mutex);
> +	sh_mem->count--;
> +	sem_post(&sh_mem->sem_mutex);
> +
> +	if (sh_mem->count == 0)
> +		sync_point_signal(&sh_mem->sync_sem_exit, NUM_CHILD_PROCESSES);
> +
> +	sem_wait(&sh_mem->sync_sem_exit);
> +}
> +
> +static bool
> +is_dispatch_shader_test(unsigned int err, char error_str[128], bool *is_dispatch)
> +{
> +	static const struct error_struct {
> +		enum cmd_error_type err;
> +		bool is_shader_err;
> +		const char *err_str;
> +	} arr_err[] = {
> +		{ CMD_STREAM_EXEC_SUCCESS,                   false, "CMD_STREAM_EXEC_SUCCESS" },
> +		{ CMD_STREAM_EXEC_INVALID_OPCODE,            false, "CMD_STREAM_EXEC_INVALID_OPCODE" },
> +		{ CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,     false, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH" },
> +		{ CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE,  false, "CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE" },
> +		{ CMD_STREAM_TRANS_BAD_REG_ADDRESS,          false, "CMD_STREAM_TRANS_BAD_REG_ADDRESS" },
> +		{ CMD_STREAM_TRANS_BAD_MEM_ADDRESS,          false, "CMD_STREAM_TRANS_BAD_MEM_ADDRESS" },
> +		{ CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,  false, "CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC" },
> +		{ BACKEND_SE_GC_SHADER_EXEC_SUCCESS,         true,  "BACKEND_SE_GC_SHADER_EXEC_SUCCESS" },
> +		{ BACKEND_SE_GC_SHADER_INVALID_SHADER,       true,  "BACKEND_SE_GC_SHADER_INVALID_SHADER" },
> +		{ BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, true,  "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR" },
> +		{ BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, true, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING" },
> +		{ BACKEND_SE_GC_SHADER_INVALID_USER_DATA,    true,  "BACKEND_SE_GC_SHADER_INVALID_USER_DATA" }
> +	};
> +
> +	const int arr_size = ARRAY_SIZE(arr_err);
> +	const struct error_struct *p;
> +	bool ret = false;
> +
> +	for (p = &arr_err[0]; p < &arr_err[arr_size]; p++) {
> +		if (p->err == err) {
> +			*is_dispatch = p->is_shader_err;
> +			strcpy(error_str, p->err_str);
> +			ret = true;
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +
> +
> +static bool
> +get_ip_type(unsigned int ip, char ip_str[64])
> +{
> +	static const struct ip_struct {
> +		enum amd_ip_block_type ip;
> +		const char *ip_str;
> +	} arr_ip[] = {
> +		{ AMD_IP_GFX,       "AMD_IP_GFX" },
> +		{ AMD_IP_COMPUTE,   "AMD_IP_COMPUTE" },
> +		{ AMD_IP_DMA,       "AMD_IP_DMA" },
> +		{ AMD_IP_UVD,       "AMD_IP_UVD" },
> +		{ AMD_IP_VCE,       "AMD_IP_VCE" },
> +		{ AMD_IP_UVD_ENC,   "AMD_IP_UVD_ENC" },
> +		{ AMD_IP_VCN_DEC,   "AMD_IP_VCN_DEC" },
> +		{ AMD_IP_VCN_ENC,   "AMD_IP_VCN_ENC" },
> +		{ AMD_IP_VCN_JPEG,  "AMD_IP_VCN_JPEG" },
> +		{ AMD_IP_VPE,       "AMD_IP_VPE" }
> +	};
> +
> +	const int arr_size = ARRAY_SIZE(arr_ip);
> +	const struct ip_struct *p;
> +	bool ret = false;
> +
> +	for (p = &arr_ip[0]; p < &arr_ip[arr_size]; p++) {
> +		if (p->ip == ip) {
> +			strcpy(ip_str, p->ip_str);
> +			ret = true;
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +
> +static int
> +read_next_job(struct shmbuf *sh_mem, struct job_struct *job, bool is_good)
> +{
> +	sem_wait(&sh_mem->sem_state_mutex);
> +	if (is_good)
> +		*job = sh_mem->good_job;
> +	else
> +		*job = sh_mem->bad_job;
> +	sem_post(&sh_mem->sem_state_mutex);
> +	return 0;
> +}
> +
> +static void wait_for_complete_iteration(struct shmbuf *sh_mem)
> +{
> +	int error_code;
> +	unsigned int flags;
> +	unsigned int reset_flags;
> +
> +	while (1) {
> +		if (get_test_state(sh_mem, &error_code, &flags) &&
> +			get_reset_state(sh_mem, &reset_flags))
> +			break;
> +		sleep(1);
> +	}
> +
> +}
> +
> +static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
> +		enum amd_ip_block_type ip_good, enum amd_ip_block_type ip_bad,
> +		unsigned int ring_id_good, unsigned int ring_id_bad)
> +{
> +	char error_str[128];
> +	char ip_good_str[64];
> +	char ip_bad_str[64];
> +
> +	bool is_dispatch;
> +
> +	is_dispatch_shader_test(error, error_str, &is_dispatch);
> +	get_ip_type(ip_good, ip_good_str);
> +	get_ip_type(ip_bad, ip_bad_str);
> +
> +	//set jobs
> +	sem_wait(&sh_mem->sem_state_mutex);
> +	sh_mem->bad_job.error = error;
> +	sh_mem->bad_job.ip = ip_bad;
> +	sh_mem->bad_job.ring_id = ring_id_bad;
> +	sh_mem->good_job.error = CMD_STREAM_EXEC_SUCCESS;
> +	sh_mem->good_job.ip = ip_good;
> +	sh_mem->good_job.ring_id = ring_id_good;
> +	sem_post(&sh_mem->sem_state_mutex);
> +
> +	//sync and wait for complete
> +	sync_point_enter(sh_mem);
> +	wait_for_complete_iteration(sh_mem);
> +	sync_point_exit(sh_mem);
> +}
> +
> +static int
> +shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
> +{
> +	int ret = 0;
> +
> +	if (shmp && unmap) {
> +		munmap(shmp, sizeof(struct shmbuf));
> +		sem_destroy(&shmp->sem_mutex);
> +		sem_destroy(&shmp->sem_state_mutex);
> +		sem_destroy(&shmp->sync_sem_enter);
> +		sem_destroy(&shmp->sync_sem_exit);
> +	}
> +	if (shm_fd > 0)
> +		close(shm_fd);
> +
> +	shm_unlink(SHARED_MEM_NAME);
> +
> +	return ret;
> +}
> +
> +static int
> +shared_mem_create(struct shmbuf **ppbuf)
> +{
> +	int shm_fd = -1;
> +	struct shmbuf *shmp = NULL;
> +	bool unmap = false;
> +
> +	// Create a shared memory object
> +	shm_fd = shm_open(SHARED_MEM_NAME, O_CREAT | O_RDWR, 0666);
> +	if (shm_fd == -1)
> +		goto error;
> +
> +
> +	// Configure the size of the shared memory object
> +	if (ftruncate(shm_fd, sizeof(struct shmbuf)) == -1)
> +		goto error;
> +
> +	// Map the shared memory object
> +	shmp = mmap(0, sizeof(struct shmbuf), PROT_WRITE, MAP_SHARED, shm_fd, 0);
> +	if (shmp == MAP_FAILED)
> +		goto error;
> +
> +	unmap = true;
> +	if (sem_init(&shmp->sem_mutex, 1, 1) == -1) {
> +		unmap = true;
> +		goto error;
> +	}
> +	if (sem_init(&shmp->sem_state_mutex, 1, 1) == -1)
> +		goto error;
> +
> +	if (sem_init(&shmp->sync_sem_enter, 1, 0) == -1)
> +		goto error;
> +
> +	if (sem_init(&shmp->sync_sem_exit, 1, 0) == -1)
> +		goto error;
> +
> +	shmp->count = 0;
> +	shmp->test_completed = false;
> +	shmp->reset_completed = false;
> +
> +	*ppbuf = shmp;
> +	return shm_fd;
> +
> +error:
> +	shared_mem_destroy(shmp,  shm_fd,  unmap);
> +	return shm_fd;
> +}
> +
> +static int
> +shared_mem_open(struct shmbuf **ppbuf)
> +{
> +	int shm_fd = -1;
> +	struct shmbuf *shmp = NULL;
> +
> +	shmp = mmap(NULL, sizeof(*shmp), PROT_READ | PROT_WRITE, MAP_SHARED,
> +			SHARED_CHILD_DESCRIPTOR, 0);
> +	if (shmp == MAP_FAILED)
> +		goto error;
> +	else
> +		shm_fd = SHARED_CHILD_DESCRIPTOR;
> +
> +	*ppbuf = shmp;
> +
> +	return shm_fd;
> +error:
> +	return shm_fd;
> +}
> +
> +static bool
> +is_queue_reset_tests_enable(const struct amdgpu_gpu_info *gpu_info)
> +{
> +	bool enable = true;
> +	// TO DO
> +
> +	return enable;
> +}
> +
> +static int
> +amdgpu_write_linear(amdgpu_device_handle device, amdgpu_context_handle context_handle,
> +		const struct amdgpu_ip_block_version *ip_block,
> +		struct job_struct *job)
> +{
> +	const int pm4_dw = 256;
> +	struct amdgpu_ring_context *ring_context;
> +	int write_length, expect_failure;
> +	int r;
> +
> +	ring_context = calloc(1, sizeof(*ring_context));
> +	igt_assert(ring_context);
> +
> +	/* The firmware triggers a badop interrupt to prevent CP/ME from hanging.
> +	 * And it needs to be VIMID reset when receiving the interrupt.
> +	 * But for a long badop packet, fw still hangs, which is a fw bug.
> +	 * So please use a smaller size packet for temporary testing.
> +	 */
> +	if ((job->ip == AMD_IP_GFX) && (job->error == CMD_STREAM_EXEC_INVALID_OPCODE)) {
> +		write_length = 10;
> +		expect_failure = 0;
> +	} else {
> +		write_length = 128;
> +		expect_failure = job->error == CMD_STREAM_EXEC_SUCCESS ? 0 : 1;
> +	}
> +	/* setup parameters */
> +	ring_context->write_length =  write_length;
> +	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
> +	ring_context->pm4_size = pm4_dw;
> +	ring_context->res_cnt = 1;
> +	ring_context->ring_id = job->ring_id;
> +	igt_assert(ring_context->pm4);
> +	ring_context->context_handle = context_handle;
> +	r = amdgpu_bo_alloc_and_map(device,
> +					ring_context->write_length * sizeof(uint32_t),
> +					4096, AMDGPU_GEM_DOMAIN_GTT,
> +					AMDGPU_GEM_CREATE_CPU_GTT_USWC, &ring_context->bo,
> +					(void **)&ring_context->bo_cpu,
> +					&ring_context->bo_mc,
> +					&ring_context->va_handle);
> +	igt_assert_eq(r, 0);
> +	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
> +	ring_context->resources[0] = ring_context->bo;
> +	ip_block->funcs->bad_write_linear(ip_block->funcs, ring_context,
> +			&ring_context->pm4_dw, job->error);
> +
> +	r = amdgpu_test_exec_cs_helper(device, ip_block->type, ring_context,
> +			expect_failure);
> +
> +	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
> +			ring_context->bo_mc, ring_context->write_length * sizeof(uint32_t));
> +	free(ring_context->pm4);
> +	free(ring_context);
> +	return r;
> +}
> +
> +static int
> +run_monitor_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
> +			   struct shmbuf *sh_mem, int num_of_tests)
> +{
> +	int ret;
> +	int test_counter = 0;
> +	uint64_t init_flags, in_process_flags;
> +	uint32_t after_reset_state, after_reset_hangs;
> +	int state_machine = 0;
> +	int error_code;
> +	unsigned int flags;
> +
> +	after_reset_state = after_reset_hangs = 0;
> +	init_flags = in_process_flags = 0;
> +
> +	ret = amdgpu_cs_query_reset_state2(arr_context[0], &init_flags);
> +	if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)
> +		igt_assert_eq(init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS, 0);
> +
> +	while (num_of_tests > 0) {
> +		sync_point_enter(sh_mem);
> +		state_machine = 0;
> +		error_code = 0;
> +		flags = 0;
> +		set_reset_state(sh_mem, false, ALL_RESET_BITS);
> +		while (1) {
> +			if (state_machine == 0) {
> +				amdgpu_cs_query_reset_state2(arr_context[test_counter], &init_flags);
> +
> +				if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET)
> +					state_machine = 1;
> +
> +				if (init_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)
> +					state_machine = 2;
> +
> +			} else if (state_machine == 1) {
> +				amdgpu_cs_query_reset_state(arr_context[test_counter],
> +						&after_reset_state, &after_reset_hangs);
> +				amdgpu_cs_query_reset_state2(arr_context[test_counter],
> +						&in_process_flags);
> +
> +				//TODO refactor this block !
> +				igt_assert_eq(in_process_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET, 1);
> +				if (get_test_state(sh_mem, &error_code, &flags) &&
> +						test_bit(ERROR_CODE_SET_BIT, &flags)) {
> +					if (error_code == -ENODATA) {
> +						set_reset_state(sh_mem, true, QUEUE_RESET_SET_BIT);
> +						break;
> +					} else {
> +						if (error_code != -ECANCELED && error_code == -ETIME) {
> +							set_reset_state(sh_mem, true, GPU_RESET_END_FAILURE_SET_BIT);
> +							break;
> +						} else {
> +							set_reset_state(sh_mem, true, GPU_RESET_BEGIN_SET_BIT);
> +							state_machine = 2; //gpu reset stage
> +						}
> +					}
> +				}
> +			} else if (state_machine == 2) {
> +				amdgpu_cs_query_reset_state(arr_context[test_counter],
> +						&after_reset_state, &after_reset_hangs);
> +				amdgpu_cs_query_reset_state2(arr_context[test_counter],
> +						&in_process_flags);
> +				/* here we should start timer and wait for some time until
> +				 * the flag AMDGPU_CTX_QUERY2_FLAGS_RESET disappear
> +				 */
> +				if (!(in_process_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
> +					set_reset_state(sh_mem, true, GPU_RESET_END_SUCCESS_SET_BIT);
> +					break;
> +				}
> +			}
> +		}
> +		sync_point_exit(sh_mem);
> +		num_of_tests--;
> +		test_counter++;
> +	}
> +	return ret;
> +}
> +
> +
> +
> +static int
> +run_test_child(amdgpu_device_handle device, amdgpu_context_handle *arr_context,
> +				struct shmbuf *sh_mem, int num_of_tests, uint32_t version)
> +{
> +	int ret;
> +	bool bool_ret;
> +	int test_counter = 0;
> +	char error_str[128];
> +	bool is_dispatch = false;
> +	unsigned int reset_flags;
> +
> +	struct job_struct job;
> +	const struct amdgpu_ip_block_version *ip_block_test = NULL;
> +
> +	while (num_of_tests > 0) {
> +		sync_point_enter(sh_mem);
> +		set_test_state(sh_mem, false, 0, ERROR_CODE_SET_BIT);
> +		read_next_job(sh_mem, &job, false);
> +		bool_ret = is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
> +		igt_assert_eq(bool_ret, 1);
> +		ip_block_test = get_ip_block(device, job.ip);
> +		if (is_dispatch) {
> +			ret = amdgpu_memcpy_dispatch_test(device, job.ip, job.ring_id, version,
> +					job.error);
> +		} else {
> +			ret = amdgpu_write_linear(device, arr_context[test_counter],
> +					ip_block_test, &job);
> +		}
> +
> +		num_of_tests--;
> +		set_test_state(sh_mem, true, ret, ERROR_CODE_SET_BIT);
> +		while (1) {
> +			/*we may have GPU reset vs queue reset */
> +			if (get_reset_state(sh_mem, &reset_flags))
> +				break;
> +			sleep(1);
> +		}
> +		sync_point_exit(sh_mem);
> +		test_counter++;
> +	}
> +	return ret;
> +}
> +
> +static int
> +run_background(amdgpu_device_handle device, struct shmbuf *sh_mem,
> +					int num_of_tests)
> +{
> +#define NUM_ITERATION 10000
> +	char error_str[128];
> +	bool is_dispatch = false;
> +	unsigned int reset_flags;
> +
> +	int r, counter = 0;
> +	amdgpu_context_handle context_handle = NULL;
> +	struct job_struct job;
> +	const struct amdgpu_ip_block_version *ip_block_test = NULL;
> +	int error_code;
> +	unsigned int flags;
> +
> +	r = amdgpu_cs_ctx_create(device, &context_handle);
> +	igt_assert_eq(r, 0);
> +
> +
> +	while (num_of_tests > 0) {
> +		sync_point_enter(sh_mem);
> +		read_next_job(sh_mem, &job, true);
> +		ip_block_test = get_ip_block(device, job.ip);
> +		is_dispatch_shader_test(job.error,  error_str, &is_dispatch);
> +		while (1) {
> +			r = amdgpu_write_linear(device, context_handle,  ip_block_test, &job);
> +			if (get_test_state(sh_mem, &error_code, &flags) &&
> +				get_reset_state(sh_mem, &reset_flags)) {
> +				//if entire gpu reset then stop back ground jobs
> +				break;
> +			}
> +			if (r != -ECANCELED && r != -ETIME && r != -ENODATA)
> +				igt_assert_eq(r, 0);
> +			/*
> +			 * TODO we have issue during gpu reset the return code assert we put after we check the
> +			 * test is completed othewise the job is failed due to
> +			 * amdgpu_job_run Skip job if VRAM is lost
> +			 * if (job->generation != amdgpu_vm_generation(adev, job->vm)
> +			 */
> +			counter++;
> +
> +		}
> +		sync_point_exit(sh_mem);
> +		num_of_tests--;
> +	}
> +	r = amdgpu_cs_ctx_free(context_handle);
> +	return r;
> +}
> +
> +
> +
> +
> +static int
> +run_all(amdgpu_device_handle device, amdgpu_context_handle *arr_context_handle,
> +		enum process_type process, struct shmbuf *sh_mem,  int num_of_tests,
> +		uint32_t version, pid_t *monitor_child, pid_t *test_child)
> +{
> +	if (process == PROCESS_TEST) {
> +		*monitor_child = fork();
> +		if (*monitor_child == -1) {
> +			igt_fail(IGT_EXIT_FAILURE);
> +		} else if (*monitor_child == 0) {
> +			*monitor_child = getppid();
> +			run_monitor_child(device, arr_context_handle, sh_mem, num_of_tests);
> +				igt_success();
> +				igt_exit();
> +		}
> +		*test_child = fork();
> +		if (*test_child == -1) {
> +			igt_fail(IGT_EXIT_FAILURE);
> +		} else if (*test_child == 0) {
> +			*test_child = getppid();
> +			run_test_child(device, arr_context_handle, sh_mem, num_of_tests, version);
> +			igt_success();
> +			igt_exit();
> +
> +		}
> +	} else if (process == PROCESS_BACKGROUND) {
> +		run_background(device, sh_mem, num_of_tests);
> +		igt_success();
> +		igt_exit();
> +	}
> +	return 0;
> +}
> +
> +static bool
> +get_command_line(char cmdline[2048], int *pargc, char ***pppargv, char **ppath)
> +{
> +	ssize_t total_length = 0;
> +	char *tmpline;
> +	char **argv = NULL;
> +	char *path  = NULL;
> +	int length_cmd[16] = {0};
> +	int i, argc = 0;
> +	ssize_t num_read;
> +
> +	int fd = open("/proc/self/cmdline", O_RDONLY);
> +
> +	if (fd == -1) {
> +		igt_info("**** Error opening /proc/self/cmdline");
> +		return false;
> +	}
> +
> +	num_read = read(fd, cmdline, 2048 - 1);
> +	close(fd);
> +
> +	if (num_read == -1) {
> +		igt_info("Error reading /proc/self/cmdline");
> +		return false;
> +	}
> +	cmdline[num_read] = '\0';
> +
> +	tmpline = cmdline;
> +	memset(length_cmd, 0, sizeof(length_cmd));
> +
> +	/*assumption that last parameter has 2 '\0' at the end*/
> +	for (i = 0; total_length < num_read - 2; i++) {
> +		length_cmd[i] = strlen(tmpline);
> +		total_length += length_cmd[i];
> +		tmpline += length_cmd[i] + 1;
> +		argc++;
> +	}
> +	*pargc = argc;
> +	if (argc == 0 || argc > 20) {
> +		/* not support yet fancy things */
> +		return false;
> +	}
> +	/* always do 2 extra for additional parameter */
> +	argv = (char **)malloc(sizeof(argv) * (argc + 2));
> +	memset(argv, 0, sizeof(argv) * (argc + 2));
> +	tmpline = cmdline;
> +	for (i = 0; i < argc; i++) {
> +		argv[i] = (char *)malloc(sizeof(char) * length_cmd[i] + 1);
> +		memcpy(argv[i], tmpline, length_cmd[i]);
> +		argv[i][length_cmd[i]] = 0;
> +		if (i == 0) {
> +			path = (char *)malloc(sizeof(char) * length_cmd[0] + 1);
> +			memcpy(path, tmpline, length_cmd[0]);
> +			path[length_cmd[0]] = 0;
> +		}
> +		argv[i][length_cmd[i]] = 0;
> +		tmpline += length_cmd[i] + 1;
> +	}
> +	*pppargv = argv;
> +	*ppath = path;
> +
> +	return true;
> +}
> +
> +#define BACKGROUND	"background"
> +
> +static bool
> +is_background_parameter_found(int argc, char **argv)
> +{
> +	bool ret = false;
> +	int i;
> +
> +	for (i = 1; i < argc; i++) {
> +		if (strcmp(BACKGROUND, argv[i]) == 0) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +
> +#define RUNSUBTEST	"--run-subtest"
> +static bool
> +is_run_subtest_parameter_found(int argc, char **argv)
> +{
> +	bool ret = false;
> +	int i;
> +
> +	for (i = 1; i < argc; i++) {
> +		if (strcmp(RUNSUBTEST, argv[i]) == 0) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +
> +static bool
> +add_background_parameter(int *pargc, char **argv)
> +{
> +	int argc = *pargc;
> +	int len = strlen(BACKGROUND);
> +
> +	argv[argc] = (char *)malloc(sizeof(char) * len + 1);
> +	memcpy(argv[argc], BACKGROUND, len);
> +	argv[argc][len] = 0;
> +	*pargc = argc + 1;
> +	return true;
> +}
> +
> +static void
> +free_command_line(int argc, char **argv, char *path)
> +{
> +	int i;
> +
> +	for (i = 0; i <= argc; i++)
> +		free(argv[i]);
> +
> +	free(argv);
> +	free(path);
> +
> +}
> +
> +static int
> +launch_background_process(int argc, char **argv, char *path, pid_t *ppid, int shm_fd)
> +{
> +	int status;
> +	posix_spawn_file_actions_t action;
> +
> +	posix_spawn_file_actions_init(&action);
> +	posix_spawn_file_actions_adddup2(&action, shm_fd, SHARED_CHILD_DESCRIPTOR);
> +	status = posix_spawn(ppid, path, &action, NULL, argv, NULL);
> +	posix_spawn_file_actions_destroy(&action);
> +	if (status != 0)
> +		igt_fail(IGT_EXIT_FAILURE);
> +	return status;
> +}
> +
> +static void
> +create_contexts(amdgpu_device_handle device, amdgpu_context_handle **pp_contexts,
> +		int num_of_contexts)
> +{
> +	amdgpu_context_handle *p_contexts = NULL;
> +	int i, r;
> +
> +	p_contexts = (amdgpu_context_handle *)malloc(sizeof(amdgpu_context_handle)
> +			*num_of_contexts);
> +
> +	for (i = 0; i < num_of_contexts; i++) {
> +		r = amdgpu_cs_ctx_create(device, &p_contexts[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +	*pp_contexts = p_contexts;
> +
> +}
> +static void
> +free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
> +		int num_of_contexts)
> +{
> +	int i;
> +
> +	if (p_contexts) {
> +		for (i = 0; i < num_of_contexts; i++)
> +			amdgpu_cs_ctx_free(p_contexts[i]);
> +	}
> +}
> +
> +/* TODO add logic to iterate for all */
> +static bool
> +get_next_rings(unsigned int ring_begin, unsigned int available_rings,
> +		unsigned int *next_ring, unsigned int *next_next_ring)
> +{
> +	bool ret = false;
> +	unsigned int ring_id;
> +
> +	for (ring_id = ring_begin; (1 << ring_id) & available_rings; ring_id++) {
> +		*next_ring = ring_id;
> +		*next_next_ring = ring_id + 1;
> +
> +		if ((*next_ring  & available_rings) && (*next_next_ring & available_rings)) {
> +			ret = true;
> +			break;
> +		}
> +	}
> +	return ret;
> +}
> +igt_main
> +{
> +	char cmdline[2048];
> +	int argc = 0;
> +	char **argv = NULL;
> +	char *path = NULL;
> +	enum  process_type process = PROCESS_UNKNOWN;
> +	pid_t pid_background;
> +	pid_t monitor_child, test_child;
> +	int testExitMethod, monitorExitMethod, backgrounExitMethod;
> +	posix_spawn_file_actions_t action;
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	struct drm_amdgpu_info_hw_ip info = {0};
> +	int fd = -1;
> +	int fd_shm = -1;
> +	struct shmbuf *sh_mem = NULL;
> +
> +	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
> +	unsigned int ring_id_good = 0;
> +	unsigned int ring_id_bad = 1;
> +
> +	enum amd_ip_block_type ip_test = AMD_IP_COMPUTE;
> +	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
> +
> +	amdgpu_context_handle *arr_context_handle = NULL;
> +
> +	/* TODO remove this , it is used only to create array of contexts
> +	 * which are shared between child processes ( test/monitor/main and
> +	 *  separate for background
> +	 */
> +	unsigned int arr_err[] = {
> +			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> +			CMD_STREAM_EXEC_INVALID_OPCODE,
> +			CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
> +			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
> +			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
> +			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
> +			BACKEND_SE_GC_SHADER_INVALID_USER_DATA
> +	};
> +
> +	int const_num_of_tests;
> +
> +	posix_spawn_file_actions_init(&action);
> +
> +	if (!get_command_line(cmdline, &argc, &argv, &path))
> +		igt_fail(IGT_EXIT_FAILURE);
> +
> +	if (is_run_subtest_parameter_found(argc, argv))
> +		const_num_of_tests = 1;
> +	else
> +		const_num_of_tests = ARRAY_SIZE(arr_err);
> +
> +	if (!is_background_parameter_found(argc, argv)) {
> +		add_background_parameter(&argc, argv);
> +		fd_shm = shared_mem_create(&sh_mem);
> +		igt_require(fd_shm != -1);
> +		launch_background_process(argc, argv, path, &pid_background, fd_shm);
> +		process = PROCESS_TEST;
> +	} else {
> +		process = PROCESS_BACKGROUND;
> +	}
> +
> +	igt_fixture {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		 r = amdgpu_query_hw_ip_info(device, ip_test, 0, &info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +
> +		asic_rings_readness(device, 1, arr_cap);
> +		igt_skip_on(!is_queue_reset_tests_enable(&gpu_info));
> +		if (process == PROCESS_TEST)
> +			create_contexts(device, &arr_context_handle, const_num_of_tests);
> +		else if (process == PROCESS_BACKGROUND)
> +			fd_shm = shared_mem_open(&sh_mem);
> +
> +		igt_require(fd_shm != -1);
> +		igt_require(sh_mem != NULL);
> +
> +		run_all(device, arr_context_handle,
> +			process, sh_mem, const_num_of_tests, info.hw_ip_version_major,
> +			&monitor_child, &test_child);
> +	}
> +
> +	igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
> +	igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH") {
> +		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +			igt_dynamic_f("amdgpu-compute-CMD_STREAM_EXEC_INVALID_PACKET_LENGTH")

Dynamic subtest name shouldn't be the static. Please use different name 
everytime you call igt_dynamic().

Ex:
	igt_subtest_with_dynamic("foo") {
		for_each_variable(bar) {
			igt_dynamic("%s", bar)
				<run your test>;
		}
	}

Please check the output of below command:
$ meson build && ninja -C build && ninja -C build test

> +				set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
> +						ip_background, ip_test, ring_id_good, ring_id_bad);
> +		}
> +	}
> +
> +	igt_describe("Stressful-and-multiple-cs-of-bad and good opcode-operations-using-multiple-processes");
> +	igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE") {
> +		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +			igt_dynamic_f("amdgpu-compute-CMD_STREAM_EXEC_INVALID_OPCODE")
> +				set_next_test_to_run(sh_mem, CMD_STREAM_EXEC_INVALID_OPCODE,
> +						ip_background, ip_test, ring_id_good, ring_id_bad);
> +		}
> +	}
> +
> +	igt_describe("Stressful-and-multiple-cs-of-bad and good mem-operations-using-multiple-processes");
> +	igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS") {
> +		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +			igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
> +				set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
> +						ip_background, ip_test, ring_id_good, ring_id_bad);
> +		}
> +	}
> +	/* TODO  not job timeout, debug why for nv32
> +	 *igt_describe("Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes");
> +	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC") {
> +	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
> +	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,
> +	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
> +	 *	}

Commented code is not allowed to merge.

- Bhanu

> +	 */
> +
> +	/* TODO  amdgpu: device lost from bus! for nv32
> +	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
> +	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
> +	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
> +	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
> +	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
> +	 *	}
> +	 */
> +
> +	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
> +	igt_subtest_with_dynamic("Handful-by-soft-recovery-amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR") {
> +		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +			igt_dynamic_f("amdgpu-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR")//amdgpu_ring_soft_recovery
> +				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
> +						ip_background, ip_test, ring_id_good, ring_id_bad);
> +		}
> +	}
> +
> +	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
> +	igt_subtest_with_dynamic("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING") {
> +		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +			igt_dynamic_f("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING")
> +				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,
> +						ip_background, ip_test, ring_id_good, ring_id_bad);
> +		}
> +	}
> +
> +	igt_describe("Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes");
> +	igt_subtest_with_dynamic("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA") {
> +		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
> +			igt_dynamic_f("amdgpu-compute-BACKEND_SE_GC_SHADER_INVALID_USER_DATA")
> +				set_next_test_to_run(sh_mem, BACKEND_SE_GC_SHADER_INVALID_USER_DATA,
> +						ip_background, ip_test, ring_id_good, ring_id_bad);
> +		}
> +	}
> +
> +	igt_fixture {
> +		if (process == PROCESS_TEST) {
> +			waitpid(monitor_child, &monitorExitMethod, 0);
> +			waitpid(test_child, &testExitMethod, 0);
> +		}
> +		waitpid(pid_background, &backgrounExitMethod, 0);
> +		free_contexts(device, arr_context_handle, const_num_of_tests);
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +		shared_mem_destroy(sh_mem, fd_shm, true);
> +		posix_spawn_file_actions_destroy(&action);
> +	}
> +	free_command_line(argc, argv, path);
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 3982a665f..36d65f44b 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -57,6 +57,11 @@ if libdrm_amdgpu.found()
>   	else
>   		warning('libdrm <= 2.4.109 found, amd_pstate test not applicable')
>   	endif
> +	if libdrm_amdgpu.version().version_compare('> 2.4.104')
> +		amdgpu_progs +=[ 'amd_queue_reset',]
> +	else
> +		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
> +	endif
>   	amdgpu_deps += libdrm_amdgpu
>   endif
>   
