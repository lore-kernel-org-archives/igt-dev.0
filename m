Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D868DC8302B
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 14:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8869D10E478;
	Mon, 30 Jun 2025 14:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iNN9eXwg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AFB10E478
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 14:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751294594; x=1782830594;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mlGi6d/h+zaLqXP6xCQG7U0he2wjdn4wnGhAVsM3jRc=;
 b=iNN9eXwgyPCFJNs3T2V5/ZgILkeP6pvXhPruqWTXdS5IfGAw8hnkgQLZ
 W47UTqeZD8tjE0AwzTXFIu4pSqefIGIrJ2QvSJFjP0kGEWLn8f0TkUrc8
 WZq8uLcnj9Dhf3dyN26HminzWaCa4BhoXAzcXrvq5fCV2iX2vKMwlox5P
 c8djU/YyFLf9PkU00qdo+hJ07IRGzfuwcds3CH5ujvcL6VH7RAOlafIYl
 umdYF/vLMsh730SgZe3W0MMZBcU3+2UZ3hD4+7cI57SBejCx8kLF6xzs+
 3oipW84kat8FJuN59A7dqUIABvrktB3lSr5PElwfoNOyMS0EAAhOdnxyD Q==;
X-CSE-ConnectionGUID: aswjiZ85TMKCM0sMDYsOaw==
X-CSE-MsgGUID: SSph1JnRQqSTzZAcdHvcew==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53385484"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="53385484"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:42:07 -0700
X-CSE-ConnectionGUID: lA26z+0JRVWQlwqk5XpoRw==
X-CSE-MsgGUID: S5UZiI85RcWK729LHmdbaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="184403927"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 07:42:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 07:42:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 07:42:06 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.69)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 07:42:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vePEvssqbC70h1VDQSsqK47Xl+U7Lv4jmZoClE4bq/o+2m6dRIlmRqq6qP5jH41XsGCXfFqjX6BDoQ6V54odfv24lUHTE9TI/fGC/eJMsNYXwRSQcwv4vCtImtOa32UN0+cA1rbD8od8onknNO5XBOQUyl7YEBP7He7bRsHofpZ+lDUpYBnbwG7aKlW8+KnPlNEBxHP/nvUISW2CCP3dH5ijV2X+sPppts9NB2sFdcM/aXgLbrcKUO2YQ6/5qwdlW2I4GfBe855flMh5r8eXBV/H2VsxziU2SxhIYZZS0MVSNPEQc0agZMh2eLKZ7Je8M71bwuHI5TKoFWb900WkTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrBFppUTIr3DYrh4yV8/0s1KrxckEjBpGBE9c6gAl4Q=;
 b=GlbcYa+MjCJMMb2/iQFYM3iHDtuRfK++Td6YMxmMpZ91YnhpF50Op1fdSx2CtZyy6bvgVYyKAipoOOcINR9d/CNpX70YR7dcPQm/1IAmZWQ5S9NaTqSrYwoLikZ7O7zuq/ex6q/O6f5EjtvLPNGx71GlgtyxsNdx5Vq43zXJIXKLD9TrfI0MTHgpYrc+5aS99cuK9GzfkPkW7N242tlv9VuUWU+77wyyuBF88Pytf0ztjI0um4OQ5fnCXS7D5yRXMhOyCXHVcfLwkfFQEbTxrgtYfbWi1g608shTxwSQvKKAiLtlN8YR3dRhixC0/4Jtp+tQDsoQ8J0oi6EOV/3SJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 14:42:03 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 14:42:01 +0000
Message-ID: <01bea423-1e83-49b0-8e86-fa2cccd47c46@intel.com>
Date: Mon, 30 Jun 2025 20:11:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v3] tests/intel/xe_pm: Enhance vram-d3cold-threshold test
 to verify VRAM self-refresh
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250630051145.2572003-2-sk.anirban@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250630051145.2572003-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0020.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::8) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|LV3PR11MB8726:EE_
X-MS-Office365-Filtering-Correlation-Id: 947b5cbd-2551-4afc-2249-08ddb7e445c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmE0QWVQVEJEOUtIaVZFcjRaM3NrSkFUY01ibkhaekhXRDhBd3I1QSt6bWMz?=
 =?utf-8?B?cmFBOEtCbHFRVTRORkI4WGhablljUzhFSktoL0RPUW1SUGt6Q0xJd1ZOWHRp?=
 =?utf-8?B?NkRLazRmc2Z3VVNON1B5c0ZDYlA0UjVBeC9iby9QZm9VdEZ0UjgzTEI1ejBF?=
 =?utf-8?B?dUF5Q3hGSkd1UWhUdDVMRGFJVWYvanBtdVZYVXNYcjg3ZkoxdGUxMVVIME83?=
 =?utf-8?B?M1pQOHErcllQd09kamUrdkpmZ1BObFF4OFptSUtLMmZMeFFJd0FvcDVHRnBq?=
 =?utf-8?B?T2E3NWlzUEd2UjJjWWhaVjdvWGNXeU5qdVhqN1VLemZURU5LaHNPUVNuelpZ?=
 =?utf-8?B?cVZMWGxvTDJNdEtJcHhQcExNVExDK0dpbnA5dVBoVFprQTlZWTVadnFJTHc1?=
 =?utf-8?B?SFlDUVhmQ2psOWtLNDlvODJnVzlQZ1ZnV1pNYmJja3JHVHVqcVE5dW9jS05Y?=
 =?utf-8?B?dEFMUzlmM2lNNzhJZ0dEanppTnZtalBrc2hPUmNsTVdocE9iNTFnTDIrZTF4?=
 =?utf-8?B?UW9BZGMwRGl1elFsdGRLMlBONVlLak9yR3lYaVRsTWF5dEg0K2lKT1FKMzlX?=
 =?utf-8?B?MnhVejZIR1BkL0svWGpVN2xWSHM2bUt0cEVaVkQ4U3BNcW1vTTkxNFJ2emdJ?=
 =?utf-8?B?YlY1N2VxVFVPR1gwbS8rTm40UmVQTENzYnJZVUtRM1ptbWJQblIxbHE2N2M5?=
 =?utf-8?B?Y0liZldzRENaTXg1TGR1bDRoWURiRFhqRGFsUFNBZ1lTZytsbERwZk9FTk82?=
 =?utf-8?B?SmZXaGs0QS9EYVpXUnBldUREZi9Ua05BcGFwc21wTHdyUTlwZmp5ZTlCUDla?=
 =?utf-8?B?dmNHYWdMK1FxMEZCSUhTd0laaGpZT0xFbzREZHlvYUZmUWlMcmdqd1dkTkdJ?=
 =?utf-8?B?c3hJK0VvekVyYXlYUW1BWUhlVHQ0dUdHY210QmltK2p2cVRvbkdkblg4cFBj?=
 =?utf-8?B?RExTZ2czRUphM0xqbW9JVnZ4ODhNWUtickVONnF6SFMyRFFzMldRTGhzWHV4?=
 =?utf-8?B?cGRaR0xJS3Jjc3p3dEdPYjR2cXBRQnlEcWVKQ3RudUw3bjYxVFZGZ0hRREdt?=
 =?utf-8?B?SEJEVlZmWlpSNWd3SytZa1p5UTYvVVFIWllhZy9BT2tnZ0Z1dHBQbkl6NkE3?=
 =?utf-8?B?NVBnSDU2TUJsYjV1TUhpcjZMZWR1R2hsNFJDLzZiOXRKQ24xdGVIVjVTcEsx?=
 =?utf-8?B?Wk9qemJOQndiTFJGdkplYWlyVnI1WkpPVHhwU1VrZlV4bGZEeHdGb1k0SXdj?=
 =?utf-8?B?dTdVTncwaU5NNGhWaTQvN2s5cVhSMEFlQzJSZldiUEFqRVZ3MHBZVStiMkVE?=
 =?utf-8?B?bzJaaXE3amdxbDIrcEpwRWtQcFlDdnQwUWhUdE80ZWUxL3A4SStTNVBkaUxk?=
 =?utf-8?B?YUFjb0ZudlJPYzIrUkJGUEorcnhvN0ZLRytIWDZrckRaT3JEU1BoYm9ZVzIr?=
 =?utf-8?B?bldXL1pQZlZEUm5WTUhGblp0RElvQnYyMDJhS282K0JRSlFJcWhTOHo1Sk1l?=
 =?utf-8?B?ZTNxUk1jdmdiWWlJRHl1dGFNRTAwL0tab25ISkNwV00xR3Ardmo1eTlDd3FE?=
 =?utf-8?B?N2F5WWhEQWowRjFwSjl1ZFpTajAyRWVUVUVVaU9GTFIwd1BwaC9pR0JnZGJI?=
 =?utf-8?B?bmgwdCt3aGN2YXlzNEJQMDFGUmFqZTU5SGFPMTVGQllIZVdvQTFaTC9ZOHFK?=
 =?utf-8?B?QVo0MjFUNlp1cHNoWldrZTFQckJnZy9Gd0dGMFR6WTYreW5WakEvcmN5eis0?=
 =?utf-8?B?aTF1Qzd5MW5sRTQ2MWhYS1hhTFVnS05vWHR4NmFqUEZiUkFKV2N4LzRpY3ZJ?=
 =?utf-8?B?Unh4dEw0NFdpUzc1TDVHTGlZb04rNkUrRDRiT1F4ZkFwVkI0cldZZlRtZThO?=
 =?utf-8?B?NFpCKytVUE1Od1RxS3BMZ0s3MWRLQkc2SUlMa1ZTanE1Tmd0NjNwRWRJckRC?=
 =?utf-8?Q?/mVngbz01kw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG8wNFJKRWlUUGVhRnltd01EdUZFZGdFREtsSlBXOW5iU2NtRDRJYnhlVnFz?=
 =?utf-8?B?dUJEQ3hKM2M1N2VhYW5Sc0RGRVdCTXBIRFpLclhveWVraU43VVJmb2lURkJm?=
 =?utf-8?B?OThLTzdmVGFVQ0FyenB0cGVIWWIzUE5kTll1WlE3ZHZRK0h6K1BFUHM5ZDdY?=
 =?utf-8?B?ZCtIRmp3M3BlMmdORWtGRjdEZkJZeWtZaEJzZmFYMlR3c0NuVHMwanNoTXY4?=
 =?utf-8?B?WVN6bDVFT093dWs1VVlydUF3TERyMjdEd2JkK0hmQ1VwQ2l5c1NmTUxmYnQ1?=
 =?utf-8?B?N2FDYUJqNkxIVHI1RzJ1azVydVRoaW1lampBMWRnMVJrVEhKTzN4dlVKcmdy?=
 =?utf-8?B?S29TVGxTVCtTaTZBamVEWnRtRU1icjFRZnhmRStqWkczWFkxaHg3UlpnTUVs?=
 =?utf-8?B?RmgzTkYzckdDWHFtMVNDdTlMVmFDREM4N0FEWWR4Zk4vNlMzVkxQUWZWdUJ2?=
 =?utf-8?B?WFY3QnhuQ0dTbUhYREVDQ2M0NUpmWUJrQnRLKytYa0VMTXRXczZSY0haSEJY?=
 =?utf-8?B?UWY1MWRoU1FIcWlKL1V0bENzWWVvbXloM0NYakVJVURDV25zWGs0ZDF0TU5W?=
 =?utf-8?B?S1hLdzFtWHRoMHl3UDRQaXZKMVMwSTlIbGpuWHBhVkZvMUtwQmtSWUNXN2U4?=
 =?utf-8?B?L0FyTTZPaVcwbVQrcHNFWkg5dGhBcVphREhVS01JckVFYXk0cVhoTDIvOFZJ?=
 =?utf-8?B?bXU2ZUFGa3F3cVRZY3UyS1hPOE1CQ3RzbDZhc1lMcEdMdXZoOURqekN2MnNV?=
 =?utf-8?B?Q1Fvd3NWdWp1dUxkTzBsZERVN3JQcjlLOEFHNlNaSUh2K051WXJPajVNanVX?=
 =?utf-8?B?MStjUEcxaU1wTVVYY3BOc2xVc0JOSzBxNzdFL0VlVkZEbGY5TndkWTBSSFUy?=
 =?utf-8?B?N0h1NXpia01CcHduMi90TlRDRWMzVGl1WUVuVnRsZFRjRm0zaWZ3aldqcVZK?=
 =?utf-8?B?WnRUVlZXc2FRYUdhQVVKU1B2VWt3NVRIb1lLTkNMVmxqTDcvUFVzdnltN0RR?=
 =?utf-8?B?Znp3d21KQzY4c2x1M213eFduamN3RHNabUFHTGJzSGcwbllvYmFUQlh4V0c0?=
 =?utf-8?B?aGVvTmwwdkRSbEkxVnZDNHB4Q1lhcWdtUk9qaytwblpwR2VnNG1VdTJKODhY?=
 =?utf-8?B?UFJNZlpzYVFRUDUzbmVoYnRmVGw3ZUpCbnBRWDUra2xCTFQxc1REZUlaRmla?=
 =?utf-8?B?VTZzb3FGeEdmeng3NWhPK3J6UVRPMUUydEw4bjhwcWc4WjNueHFsdGFxaXNx?=
 =?utf-8?B?dERhUzdNM2dUc1gwcEY5QVJ0QmhLVHR2cnRTcCtVUVpieWFMcGxOZGgyaVBR?=
 =?utf-8?B?RVBDcHVNTnNIWGJWZmdvM1lvaHIwanJvZ1h1WlhTQ0hVNExPbmd5djRkM0FK?=
 =?utf-8?B?RXJJbVJQVC9tS2I5UFhwRjZYcGIwMFBDSUwraHUwbUV0ZXNxbFdoaUU0TGxC?=
 =?utf-8?B?KzV4SUU0NS9GeVZUZjBsMUZ1SklkUitMZVc5S2tnZkxOZ2txa0JmQlRnOTdk?=
 =?utf-8?B?TXdFUFZZbUgrT3NRKzlURGEvZnFsZWwwaUJoRjBEeVhRbnZqYzZ6ZDI5Tk4z?=
 =?utf-8?B?QVJiaC8rUVNLK1BlR3ZvemdTVkNZQ1hIcGdaM3Z0b0hWTHNhM2lJWlFXNVBI?=
 =?utf-8?B?ZFNFU2ZzSlVoampOUEhzdFBEVHV1NDFWNi9id0tSVmJJNXZJNjkybVlOeUoz?=
 =?utf-8?B?ajlRN2dvbmlxNm5lM3JmV2F6NVVaVUhlTkhXaW0rWE40SjloMEg2SE1pU0pH?=
 =?utf-8?B?amcwcHp5bC9yY05YYUhFNloyMGM1dlg3amZwOXlaUkRJSkRkK05zR1hldW9N?=
 =?utf-8?B?cVlzVlZpWU9mRFJmRE1TWXBNamdNb255SU9qazBlZjB4eVNwUXB2dU1LWjB6?=
 =?utf-8?B?QmN4YTh6cnhwVVZVOHFTVS8yWXMyMHRWSnllR3RLMmRBQVNROU5JQWdETXU5?=
 =?utf-8?B?REtxS0lHM2xlRzBNTFlqMzF1a1dkSXRNYWtHRVpLMjFhVDVEck9zaEFwakJW?=
 =?utf-8?B?THZOOHVzaVZTS0ZLUlBVNXZVSzRMQTlvNjVZR1d2N3lWdkZSWHRqNkNNb1Nm?=
 =?utf-8?B?RlJDdmlRVTR2M3lSNE1UbU5sYzQ2cngxbE5xYlBPMUNUdzZhTThFTHlGcHBG?=
 =?utf-8?B?cEhUMDdoZ0dDOWhuTzJLVEZWRGhuWFpudVhKdCtBdENKc3hkMXhVY2RMdGxF?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 947b5cbd-2551-4afc-2249-08ddb7e445c7
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:42:01.1639 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Fd1qtcjHZ2oEQpGas16lj0OsxTQK4bbfVbeAho/CPhvoRyly52MZ2sfpCkIXtB4b3zdbVRDLscEdFDgAwQf/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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


On 30-06-2025 10:41, Sk Anirban wrote:
> Update the vram-d3cold-threshold test to include validation of VRAM
> self-refresh (VRSR) functionality, by including checks for VRSR capability
> and ModS residency. The test now differentiates between D3Cold and D3Hot
> states based on VRAM self-refresh capability.
>
> v2: Buffer size reduced from 4K to 256 and 8 bytes (Karthik)
> v3: Update error message (Karthik)
>
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm.c | 49 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 7e9324eec..c9582d337 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -144,6 +144,27 @@ static void vram_d3cold_threshold_restore(int sig)
>   	close(fd);
>   }
>   
> +static uint64_t read_mods(device_t device)
> +{
> +	uint64_t mods_value;
> +	char buf[256];
> +	int dir, ret;
> +	char *mods_ptr;
> +
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
> +
> +	close(dir);
> +
> +	mods_ptr = strstr(buf, "Package ModS: ");
> +	if (mods_ptr)
> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
> +
> +	return mods_value;
> +}
> +
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
>   	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> @@ -561,10 +582,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	};
>   	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
>   	uint32_t bo, placement;
> +	int vrsr_capability = 0;
> +	uint64_t mods_value = 0;
> +	char buf[8];
> +	int dir, ret;
>   	bool active;
>   	void *map;
>   	int i;
>   
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
> +	close(dir);
> +
> +	if (strstr(buf, "true"))
> +		vrsr_capability = 1;
> +
>   	igt_require(xe_has_vram(device.fd_xe));
>   
>   	placement = vram_memory(device.fd_xe, 0);
> @@ -595,10 +631,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	munmap(map, SIZE);
>   	set_vram_d3cold_threshold(sysfs_fd, threshold);
>   
> +	if (vrsr_capability)
> +		mods_value = read_mods(device);
> +
>   	/* Setup D3Cold but card should be in D3hot */
>   	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
>   	sleep(1);
> -	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	if (vrsr_capability) {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
> +		mods_value = read_mods(device) - mods_value;
> +		igt_assert_f(mods_value > 0,
> +			     "GPU couldn't enter ModS!");
> +	} else {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	}
> +
>   	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
>   	gem_close(device.fd_xe, bo);
>   

LGTM.

Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>


