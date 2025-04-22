Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A4DC369CB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 06:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D90410E0C7;
	Tue, 22 Apr 2025 06:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KYtiJGW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A79210E0C7
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 06:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745303976; x=1776839976;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yds70Eort730uHfswkadmKGf2USvh7VlLcorbpwYVdE=;
 b=KYtiJGW09EEWACNvvaMIpUGFMXe0W6djZk8UdLjVS3Mg5l2htdwJyJT3
 tlTcGIiXjMIy1OcanMULY18HQRx+ebVEyIFo3SVvJLjpD62zPjbDAqeZM
 cu5NwJhWLXUIhW/0+fKgvS15MV8C6zntLEQKUF1vPyV9/HepCHNcdF9Gt
 KPAhFcHPxHzbtud1XmlUSquIRoJJLlKdkArlWOeuxNuPa0bEVYAPDejay
 u8Q1sy9Rg6Bs/Ru2/UxyYewgW/FCnbah4fuMKdk7emvXXR081UdYYzt4/
 750nrpzPuLmhBTG5gpCSeArvybi2wsd8GsUfryVr2YT2t6jo0lFsnVSgr Q==;
X-CSE-ConnectionGUID: b3Lzxu6WSOG/cPuyaVMF/A==
X-CSE-MsgGUID: V3jLPvGoSE6VYAOsUbKc7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47030166"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="47030166"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:39:36 -0700
X-CSE-ConnectionGUID: A5viQmVxSEG9kb7yyotE0w==
X-CSE-MsgGUID: aH3HyGBpTZeohldG9FkITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132888076"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 23:39:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 23:39:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 23:39:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 23:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF2N9WkMgGV38EkxNYDUgXusjU8ywekLPUhZcc1PmIvNl53a+09Q2aSp/IKQK3idDgFCWsHBwhWu1NO45/a64Ann9tnO3cji7aFmi+m/zhQ6mmfecLm6qU0rOSaAP5tG2Ogll/VTLRcECJZKM/8j0E6oB9U/8f7/cQf3MB9uuvjcNmNe2O1AhzILgTauvbSgm5VilVhaWp6dTsQuaDVfQlj1XRzdfAAPaDJF2jXoVrVzY4N/RyWhu/emn3+YavzFfX0ta9HI2tNH70Qf+AseGrwtFtLitgoUwXL142jR4hpDTXUlNNVJdcJeyTQtaVwR5irrJ3XOKRWM3r7Z9qgRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Br5ZN/B4QDF1tHYRB1eEVRpJouHXq1OLllgpYR0lGoE=;
 b=dHX98EQooqF4NQ1QtyKyj1hG5xJ4vlU0OlqmE7VqRSUyCe4O5JUilWQDOu/sa1p+8TyyDF7zIn5BieQX+SFMY47hUwUtTZtanKY3c2xRDER4JkJR+o0clYfpXDoWzqmcGuxvP37T5H577oTBNozt+epcly75U5PPZ8psW1xE+vzf7hWNTXrMxnOYCkH55S/+8vY2Thwy4fg3aUCbAhmQnDjAtCoc1RtE8FbUdpK4E63bp2Dgmkrabk7ic6h9oECLTtFOrUG3uLWKgAP3juEw8NO7WCakdC7FBm8AjsiXJwBezt0+ilRZGo/wLROFTbVcG7mGS1MPJM105ei5qvnk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by BL1PR11MB6051.namprd11.prod.outlook.com (2603:10b6:208:393::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.26; Tue, 22 Apr
 2025 06:39:32 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%7]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 06:39:32 +0000
Message-ID: <643eaf00-5ff9-4587-82e7-2f6aa9372326@intel.com>
Date: Tue, 22 Apr 2025 12:09:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
References: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
 <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB6129F2DC9DD92CB331437A98B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SJ1PR11MB6129F2DC9DD92CB331437A98B9B82@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|BL1PR11MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c45916-bd36-480e-94c0-08dd816870b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmFUY2RaZlRLQXdFdjB6V1Z1TUNkRkptYU84T2JkUzZwcUpWdEhidGIyVHBN?=
 =?utf-8?B?SnRyY2FmQ01UM1l4anZHVVNTbnMyWno3Tk9jek1VQWdkdUZ0N3dsczBiTElH?=
 =?utf-8?B?c3hSYzBTbFpQbzN6YnIwNHd1L2xIeHJmL0tLV2NETE1TSDlja0pZcEp6ZXNl?=
 =?utf-8?B?VU9iQmNGcndic08zUmphSWlJZXhyK0FENjF1K2M5ajQ1VzMzaGg0TUVkL0o4?=
 =?utf-8?B?NW9oR0o5dmZJZDZid2VxK0psd0dNZHVVMDNmenlZbFVQUUdmVm8yczUzK2JE?=
 =?utf-8?B?U2FFZXFpVjZmdVNHdEhRMDFPUy84MjltRnJQcEs5VHpyeVErVzZmVThWN3Zm?=
 =?utf-8?B?VjE4d1o5ejMzeVlqM1U3NzEzdUZ4T1B4cmRxY2dvK0ZBNXdHR0RXL0tFODM0?=
 =?utf-8?B?NHJBVzN4SDlLY2VBZ2ZmenZGd05HZFJ3UElkMWZjQU0yaWVJS1lsazhQd1Ra?=
 =?utf-8?B?enVvaHJFeUZsWFhzbVA0ZEJ3c3AycDJqZ3hrZTRobDBjZFRQTjVreTB5dzR3?=
 =?utf-8?B?ZStsbTJPN3VSS29TV2VTcXE0cHBJNlEvWkZLb2FKZTlwVk5DUGpLNlFBUVIy?=
 =?utf-8?B?Ny9DOXZiZGtqTnZzbTJOU0pFSVRuaTdVdkhyQ0gxcmRab2pxZGU2N0p3TW1J?=
 =?utf-8?B?OHljQWdtZ0hMWktzNlkzdU5PVXpLQ0ZQd0xoUDJkRkhydjdmZnpLaHZITEpR?=
 =?utf-8?B?NDc3V0xWT2ovaUJIZkhKMTRheTd3Wk5FNEFqK0hpTTBPZlF1VTBXTVF3NW1Y?=
 =?utf-8?B?V0NEbGQ3K2JzblV2WGQzalhNTUtCNFVzZFdPSUM4ZFJYTU15akxrakhIVGxh?=
 =?utf-8?B?N3g1dS9KQ296dlVYVVR4U0h1VUpJZ1luT1lOdnZlMGFYZGgrWjdkYXNTUklT?=
 =?utf-8?B?TGx6ZE5EeDZQb01Xcit5aUtsN0ViSyt2L1hDZW94MVRQKytxWDY3TWEwNUFS?=
 =?utf-8?B?V21wTk0vdTZqODdhMUpyL1VmUWx4OUgxZ3JjN0hnL1VTcnh3WGNhdkJpcm9n?=
 =?utf-8?B?T2lkZHhZdFgyYld1OHJvV0twejI4T0hRa2ZUeGtTOVBjd2Z1c2xUSHVWMnY0?=
 =?utf-8?B?TldLSVQ5dEE3YWpTdWJMYzZTTmxnWGRYMjZVeEtxc25GMTRsQi9WcHNQNzBS?=
 =?utf-8?B?US9aYWxlTXdObWh1a1NvT0kwN2l4RlFTdk1SeWVKLzQxa2s3anUxVTdHY0Yw?=
 =?utf-8?B?YnhsRzN6TlFQVjBWeFhBdHl2a2o5TzhzQTRLRVd2WW5VTkUvMXI1ajIzcnUw?=
 =?utf-8?B?T1FXd29uMitsczhrOXQvTEVMWXQ1Y21RaU5PZG9kWVovNWJ1cG9vR2k2ZnVr?=
 =?utf-8?B?WmV4KzVEdXJGZ3pvS2FpRTlJWVFOVU5FUElydTJERkViVkMvREdINUdIUHdC?=
 =?utf-8?B?c3ZJeTFJZ2lwQlVYTVlVOEJyMCtTcGlsclB3Wm9sNldWc2J5S0pqcWRibzJi?=
 =?utf-8?B?aFFRUFMwd0EwTWZaUGFkREM3dWhBdWxlb3lNU3RQV3lKcFhTdnJjQmcxenhU?=
 =?utf-8?B?RUJKMlA1RHpyWDI0V3hOTG1xb3FIcksrWTBEcjhBb0prRnV6ZExRZW93OGtY?=
 =?utf-8?B?OW9MeGV3SlNZN3pmZ2llZ1RHNVNjMU5OQnZ1SktBUTFrMytsKzljRGZxRGRs?=
 =?utf-8?B?Tk95bHhuMVRaSVNITndFSVhzbnFsUWhYQ0pRalBXRU16dnpxQWNFNlBaM3pD?=
 =?utf-8?B?UW9kK2NwWHBqbkdLUlJJRmN4Nzg1ZFJ2U1UyTit4aDdRM3orWlVZdVh1THVR?=
 =?utf-8?B?TFBOSDJZYnhaT2xNUWI3Y2RKMnVCQnA0K21FYmppV0UybTdJbXlwdEZRSmR2?=
 =?utf-8?Q?Cb3WQGx3Z7rsoGmqO9G9dpkssdE0wZVsuhOlk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDVpbGtFUTBHSTcrSkxWdHBaYnN2ZzlmUS9OMHNiTkxSTnkvVGlYeVEyd1ZJ?=
 =?utf-8?B?L0JBQUN0V2VURE5NcGVZN2xGK2huNXc5YjRqaDdkcW5leU9GejFHVVpYZTZK?=
 =?utf-8?B?Yng4VS90aFU2UE80S2hwUUROdzVZOVR2UDlURlBLek5kTjErL3ZkYWxnQlNE?=
 =?utf-8?B?TUIxdXptTVBHalBzcGF2c1RudjduMERZMjhuQVUzUExpUkRUKzNLbmV4WXE4?=
 =?utf-8?B?Rk1MWlg0T2hRbUVBdnlTb3FHanBqakF1cHd5emtmZXhXTFlsMWdLTmxTcEN1?=
 =?utf-8?B?ZHRmY1lReFBnQ09xeXNieWlvWlhDSlRLRDBUVVBaUm9FNWJuWEdQLzlUcGxk?=
 =?utf-8?B?VzlCZWF1bENmQjJ4QzBpdk95SThSTGtvVUIwMHZ3M0tXSFVGQjZtQUlQb3dJ?=
 =?utf-8?B?R0t6enBTTmZpYkhEOWxucFBhWWRvZDdldHFFZEREWFB1blZKMWZuYzVFR015?=
 =?utf-8?B?MHU2emFxR1dhb2svaVZwUTA5ZVF4akdoQnhQSzRxZnNSUU9ZamxLd084dGp6?=
 =?utf-8?B?a3NDYkk1Z2x4eFlDOURUanhKVXlCUUEzWXZCUndsb2lTRkV5aUFkY2crZTJU?=
 =?utf-8?B?RXBhQ0pwdmxRZFdjRWdxRmhGQUp1MWF2UzNkaWhFM2lwQmRSN0orMUY5ZUFD?=
 =?utf-8?B?ZHA4bys1dS8veTR0NnlmT0ZkSG5yZm5jc3kxTXRJRC9HSG5CVk9hSitkK0tX?=
 =?utf-8?B?WHZXY2R3c2U4Zlc3eFZ3OTBUNnVYb3hVdDR4eHB4TnRpMkExUC91Wm5tQkda?=
 =?utf-8?B?Sk5abUxvZVRhY09qcUc3YWh5R2IwalZ5OVFHclZ5UklpWVFWL08rcWZHd3c5?=
 =?utf-8?B?YkxxeGJvcm12NGt5S3VaSUIxY2RaUHY3NU1iN1E1cWordkJ5aGtrYzZKUlVK?=
 =?utf-8?B?NHcya3lTQVhaSzhLV1UyYy9ZbW16a2ZYZlJvTUFpRnU0SzErS2EydEdPL0cx?=
 =?utf-8?B?MXU3Mkk0Y0NMZzVnbDdLQVpMQ1QyaUhYMGluWEpEUFMvNjU2N0t6Y0xEYUU4?=
 =?utf-8?B?QTlOWSs4VW5mSTN2Z3ZaenRyOHYvc00rdnQ5OC93TXk5cGZzd2UzT1B1YlRm?=
 =?utf-8?B?Y0xNczRKa0hxb3ZtNEg1STVjSG1lZDE3aVYxdGNDRlc1WjdMeXRyUXQ5TzJN?=
 =?utf-8?B?bW81eTlpNHg0czBXQ0VtUFVlMVd2eCtLcWM4cXZiOHBSOUs3NE5LbkNFQlhQ?=
 =?utf-8?B?RUozaFJtbkRvV3dIOTlSSDA5NVdsbDJmaFVENi9rRWlMcTVnZEhxS3BRVXp2?=
 =?utf-8?B?OE9UNDNHZlVVdTh5UFJoRWpRM2w2L1hMRWliYjFUR0hub0dqRVd6RjJKdDBX?=
 =?utf-8?B?NFR4bVlCNldVYVNGQ0crdzl1Q3llU2JOeXl2T0ttNHk4Qm5abURFVGtkRktF?=
 =?utf-8?B?bVQyanVoOE4rUDYvRi9la3M5bDRUb1gzQnBUZ1FXcStISWorb0FpUGRDek10?=
 =?utf-8?B?R3oxMUp1QzVaODRWQXhzUTh3ZHRjSTYrcFVTZDR1WHhVZFNzUW93cVZteXpD?=
 =?utf-8?B?bm1mejBHZTgySDRtMnNlaTlJUXJCNEVzWW8vem5pcVJsUnRlam1aMWZkMUtz?=
 =?utf-8?B?SnAxWURLZVpnQzg2TDVoMlA1SUdtVmRQdkNhcFVRdmFtUTdBSjk0UmVvZ05a?=
 =?utf-8?B?ZjNJTkk2cGcrQXg4OExRVm5QSUFsR3pXbmZPeURtL1VhdnpYekhOUnkraVEz?=
 =?utf-8?B?eGxGS3RObk5lc0tyTHE2eU1ZV2NKZkhnSVBwQUM2RHp1ZmNjbXY5K05wWGJ6?=
 =?utf-8?B?aGtpSGg2OHBBNnl1OHBlbjZLYUhBc0E2MndUYjdNWkZ5UmdLNXY3Uy8yZ3RH?=
 =?utf-8?B?bDhqTTdUWVBSTURvUmk1anZ0TWRKdS80dXFOYVdjS08vV2FlOVlFSnVTc2Ni?=
 =?utf-8?B?WDM0OUZIbTl1V1NBeU9IZWJTK3hvd3p1VEd3QjVVWEk2YzQ4MkZYaEVBMEFF?=
 =?utf-8?B?a0srZTc0eGcvQU1hV2s0ZjAvUnNRcjNncFF6V24wZnNZZ1EwQXdQdTVRSFR4?=
 =?utf-8?B?bWhwQzI1RHhkQ2JlQ21MT0hmeGZ1SzY2TXQyZmpOd1VaeHJXUGsxMSt2bjhJ?=
 =?utf-8?B?Y0YvY3BYY2p1WE51MzNod2o4M0l6U3VaVnYwbDg5b09ReXg0aFBWWEtvRDhk?=
 =?utf-8?B?TVdQWXBmbUdGc2xpUGhXSkpNZ0JNVkR6YW8vOHBVK0NkS1NqRlZmYWw2b1VM?=
 =?utf-8?Q?JR3+RU2rd86Wp6teDRxQ8mM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c45916-bd36-480e-94c0-08dd816870b1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 06:39:32.4995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IGlSNmCAkuXw9lxVDU2ZiiH3zoPvH2a62QtRStZz4dSjr7Fi1K0lH6ILEuCZ/J3fNDNK9B3i9QcwMBtcVSgH/t/xhKUjDFJqGrzxmhRkbaF8SytiVM7o3bmRuYWb8i2x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6051
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

Hi Chaitanya,

On 21-04-2025 14:57, Borah, Chaitanya Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Wednesday, April 16, 2025 8:34 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
>> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
>>
>> As async with linear modifiers is not a practical and common use case,
>> override the default modifier with tiled for all the async flip subtests
>>
>> V2:
>> move handling to default_modifier (Karthik)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> a3defe604..51afae8e9 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -194,6 +194,9 @@ static void wait_flip_event(data_t *data)  static
>> uint64_t default_modifier(data_t *data)  {
>>   	if (igt_display_has_format_mod(&data->display,
>> DRM_FORMAT_XRGB8888,
>> +				       I915_FORMAT_MOD_4_TILED))
> 
> This is still checking for sync format modifier pair. We perhaps need to change this.
> 
> Regards
> 
> Chaitanya

Yes, the current change is to isolate the tiled vs linear modifier 
subtest , and once below IN_FORMATS_ASYNC patch is merged ,this can be 
changed later to use async format modifiers.

https://patchwork.freedesktop.org/series/146853/

Thanks,
Santhosh

> 
>> +		return I915_FORMAT_MOD_4_TILED;
>> +	else if (igt_display_has_format_mod(&data->display,
>> +DRM_FORMAT_XRGB8888,
>>   				       I915_FORMAT_MOD_X_TILED))
>>   		return I915_FORMAT_MOD_X_TILED;
>>   	else
>> --
>> 2.34.1
> 

