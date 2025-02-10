Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3BDC02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 09:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11DC10E4C8;
	Mon, 10 Feb 2025 09:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WRK0ty7A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 892FC10E4C8
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 09:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739179600; x=1770715600;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9O8nvZIXBmR44tVeIAC/jdjFdPfmQCTuIfK/GykG7gg=;
 b=WRK0ty7A9YX9lx8zSW402aL4q+ZrX/LU49eJhoTHw3QIQEQXnI5HZeO7
 vthDJ/xrY6gXsYs6gQQlKmuoydRXHTAh0VR5nQ7i6IGgWUqJuDafZdqz5
 zrVifA0SWW05dxef2/hC0IAOfgyTL4DFG8v690S+ACCfcn4yW1mrqfAsm
 tTJXetFWLsXyLncECiLjAbALVW26B8AN+vgstpVaW5VrHw0ZerAfe6X9p
 SjUPcEmIdKFJXyjbj1+gOt6YVAoAgxIB1eLmd/Oyk9cc1bCOjuiSlE2hY
 A4bGAKWXNFHdKoUwqOf/LpOWDdBVOHruNIpHUYZoE86MuRv8Kcp44umzq Q==;
X-CSE-ConnectionGUID: 3Z8qNmZyRWqLILo8KLIj7A==
X-CSE-MsgGUID: VygpH539QVSB92P7W4KuZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57166508"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="57166508"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 01:26:39 -0800
X-CSE-ConnectionGUID: jdfubsQEQ9qGV0MafkcuXQ==
X-CSE-MsgGUID: h5Q+KBKiSsOMLIXP1UyN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="117199837"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 01:26:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 01:26:37 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 01:26:37 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 01:26:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DdETY2htrrwzbwc/vfr1K1yBPJGnxJIgKeZImQ+jw7yJIcEdVjJeBTixgoVBd3SZwI/5qa0KCS1QZ6yeCKC6ZPmXk4txZMeAozvjYOQA+2u5JIi5QWSG5wuF4Upf6ieMp6enb9b0R3qPkEqrrrIaB729INM8ByMUdXpiek4zDAMosfl+/SqMp3OXTLWlUFQqaglq28AZqW1RqR0zgSwI3QF83/lkPVVt6jGrrSmCUu7T/h4Yloqk27OCbz8DbfDCT/6k1EqeGb0v5TtgDBEgtXUiQnl6SVXo6OdXUJytWcDFx+dSf3S9yWs20dBMmIRO45L3xBizRngX6bEdafcUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6nUC3Bl7/Pc8fu8FqpxyMV31hajU7PgkYrNnG5DKho=;
 b=YB9QD6e8kYu9x/XjsYtX6ckOQAeFStwpi+mEuzwhbFxy0zpca9oHGX5HHeankoz7sT7ttIr++mnlqN0xlSi1jFeza6JRr8psQ2rIEt5w4ybNFp6i7eW1oFoRumtGWtzg7zEnF8Ngof9hjeTakWBS9l3g1UeeOAgICEh43DIYQA4wPJb3sMiu5TAMSImRDl4r06FAU1zEiG9KDD4bRDFwGJIf+tPXYGqisOYJo9MZc6m5NX4q2bjGiilGCffReMuOG4o5yPfmLWSDUnVlh6Ered1o84Mg9ZXXErc1QwWNOj/IjoXFyidLgK9LIEtEOXhAqssGMSL2YHJktJvUQTvAKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 09:26:20 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 09:26:20 +0000
Message-ID: <35f1be63-0ea0-4d02-bd4b-d12cd60b45bc@intel.com>
Date: Mon, 10 Feb 2025 14:56:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] tests/intel/kms_mst_helper: Add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250127062904.3420225-1-kunal1.joshi@intel.com>
 <20250127062904.3420225-2-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250127062904.3420225-2-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::20) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: f1352977-4445-4150-774f-08dd49b4fa01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ny90QkpOSytqalFUVThSUDdBRkh2d1J3em5FOXhPZC9hWktjVG8zSldxeUVq?=
 =?utf-8?B?djhYYlY5cFFFdXhuREFqT042L2V5YkRFZHlIdkdUcjUyWGZ6SWdEenJnRS9J?=
 =?utf-8?B?UUZ1Q2dTN2V1MEJvVExINlIvb0Y3QkxPdkdkRUJpV2QzUTcxUlFrdzZLL0Rx?=
 =?utf-8?B?eGM3ZEJoOWJscGt6VlU2M3gzNVJFRmdSS0N6Z2Y5cFh5dUZNbDZtNGdXYnFu?=
 =?utf-8?B?cUJCS056QjlTY2lxUjJKVzJrS3g5aGtnU2NVSk5BSTV4UXp5d2lBQ21DYjQz?=
 =?utf-8?B?Nm5aVUprb3laeDRCUUZjNG1HSWM1RFJuOHFVZDJjYzE5MTRWdnlhSmZvbXZj?=
 =?utf-8?B?cXhxNjhSMDRZS2ZuT3k2alFpeGFjZElLSmJ1MEpsQTJWSmRmZStlU09VYXIz?=
 =?utf-8?B?anZIRlduYVFIUWJnNW1ndXIvbG4zV21aNlluSHdaV0hWT0pEOHZUd0VISUJv?=
 =?utf-8?B?aVNXR1padC9ONFl3Ukl2R09CZGJacGFTUEJ5Rm5UVDBDRGdKKzRQUGtZY0di?=
 =?utf-8?B?OUt1UmhDRWE3UlByUVJEWGpndmZJaHhBT0FKZlZWR0xFQWZUUVJLWGZEeG13?=
 =?utf-8?B?ZStIYVp2dmJpaXVMbFl4SmViYnZ1RlFjMmZSV1ZEb0FLaXVrVWs1WFJTQkRR?=
 =?utf-8?B?U01Db1lQUGJ5VHRpYThSb1M0T2JXdWpZT2EvUEtyL29CRmJLanQxNXdENW44?=
 =?utf-8?B?TjNqa2VLczFRdTErdTVhOHhaZUV2MDJZTHBFeTdRVkw4N3RraklIR2Zhbk1J?=
 =?utf-8?B?bGJrUmVTQUhSMC9SUUc5ZGF3bzhMVzVteVgxeUcxR3J4R0UrOW9tS3dsNGlL?=
 =?utf-8?B?akpNQnlzSFRpRlQ3RzZxMCszOXk5YTZzdlJtSXNkN1hwVTUrdjlFY05WWjFi?=
 =?utf-8?B?NXBYaHV2VHc0VWJOUjFHSDRBUGdYTWVxdjUyMkw3R3FENVNNcmdwNmwyQTNo?=
 =?utf-8?B?KzZySTdNWTBLNE5MVmxJbHRobDBJYmh3Y0FqY0FlMmtycUpGMDYzVm1QRXpJ?=
 =?utf-8?B?QzlyVXdEZWpaRzdscnJHaW11WWJkTWVJb3hiQlRabzU4Nm1DUEtoVXpVUm5V?=
 =?utf-8?B?Y2NsK25sSFk4Q3Y2cUxnUnVvNFBIN0xuejhnUDkrSHI3aUZPZTJlcjJFTEtu?=
 =?utf-8?B?VnU5ejZIL21EbmVxV3hxOHJTT1VybVVzVHRLRzZ0bFJYTUl6NzRLbVJ3YmdF?=
 =?utf-8?B?dStESS9sWHdEOC9JMlA5aUVPaE05MDFoRnJiVm5JU1phcGVjbzR0K01WeW5M?=
 =?utf-8?B?WEEySDUxTFJYeFVKem92RlVUZnQ3ZmlHZ0FpSTRXMFlmMCtwT3pnWFpaWXAy?=
 =?utf-8?B?UXdLNHg1SEY3bXhEWjVvKy9oS2V0emJRN2k0am53RkVUZnNBWGVtNG1zYm96?=
 =?utf-8?B?Smw5QTFhajM5YjJwL3d1cXkvLzJYV1BhU0NSREFiZjFlWm9HRUkvOXJYcGMv?=
 =?utf-8?B?Q3pHeUxLRXgxb282NlhCaTJkRkNadWxvdjBZVExsdzNXSzZWTGljRmxzVHRR?=
 =?utf-8?B?cXFkZFdTUVFLQWFtRXd2RGJldk5WenZNSzJkdTBvc2tkc1FibVJFSnp4ZDVz?=
 =?utf-8?B?Ukgrdk1OdGd1U2lJaENob2krMElyZDg2bldRSUpSb2ZBVGFUM1RBVWlIakd5?=
 =?utf-8?B?YWh3UE53RTJUeUdxK2kzU1RmWFlkR3ZxTUhjQUxSbDRkWEtmUUd5VzltTW9q?=
 =?utf-8?B?bjdybysvSExNZlMxZkpkOXVyMTlRRHhnZHQ0bHMxd0dSajh1bzlid0Q4Szht?=
 =?utf-8?B?cmoxcjNFaUl4NlJHMFdER3k2SG02V08wZm1zWWYySnVBWjBuTG1zSHd0Tnd1?=
 =?utf-8?B?TzlNNk5PK29uU0JicEk1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T284WjVVSHJadm9aSkZMWnFaUWJzbm9CbTVQS0tkWDZUNHVJY042bmFYbzRI?=
 =?utf-8?B?enFPVkhnQzBjcnpWUlZKYkFHaFRnbFhtaDBrYkkxZHZURS9ERHAxYjhScWVq?=
 =?utf-8?B?R1VndWhUcTY0T2ZDc1NyTkhMY1hhamUzcjFmbW9aRW1ZL1VMbHIrcjdkN3J5?=
 =?utf-8?B?UzVMaGZPNzhYZkJDOUtKb2pGenFnalVxa2Y1dkw5b2IxZ2MvOUZzWW5STU0w?=
 =?utf-8?B?YTZ4WUt1ZDhlT2NWazZVRVJ2YVhBamlwUnpzcWRVemxlWWE2c2JsdzB2RDM3?=
 =?utf-8?B?WUxUT1NacWMvaDUydEJsbDdWS2FOT3pVL2szQStCZ0tyNStQZXBOM2N4K0FZ?=
 =?utf-8?B?Nkt5b3pTS2pUTjZTK2RwWlRjeHRiQVVjL2o5VVNsWWpNSFZqckxpcnBZUTdu?=
 =?utf-8?B?UHRlbU1Sa0d5V1AxRlRYZHk4NSsrSm9qMEZiTVlYRWF4aXY3Q2txRnd2TzNi?=
 =?utf-8?B?VVRmdEU2RFJ3TU4xZ29Rd1k5YTM1L0VWR2hYeFNYam5HMHZxd1RUU0FkVHNw?=
 =?utf-8?B?MVd2OStyMlhUc28zallIMWhVR1RTS2trUXAxRXZ0MzBxaFZnTEpGTWVoSXNL?=
 =?utf-8?B?WS9uS01jZncxVllybnV0K0FDMmszdjNkUkJkOWQvUjR1QzMvSzJOZzdtUGxD?=
 =?utf-8?B?SXRYRFByMGdoVDArK3JlZU0wSjdRVFUxSy9KQWloTDA5QVlmbHJmOTZ6SXNw?=
 =?utf-8?B?eEU4OTUyYXN1QzQzMmE2bTlXNkkxaHBTZEUvK29yMlNsM1RjcUZzNmxNREVL?=
 =?utf-8?B?aHE1TWxNOGVEOFlESy9XamVGMHBNNnducjJlaHZCMmZNNHdBbXB0ZU1qb3FB?=
 =?utf-8?B?dm1ELzdvdFA4SDBDbFdaVVZFeWIwTE5ZUXhkdDBLNG5aWkNqR0F1SHJpV1V3?=
 =?utf-8?B?NURHMUVNdmlRTzBmL1ZDeEdCYkNmUGdmTVZCbi8va0J1aU5MVlE2TUJ0OVdt?=
 =?utf-8?B?M1VWMjA2aFp0NkFtdDQ4L05qRlBmUlVTTmhXUzJWTSt1TmlLTWNYVHNyRDZQ?=
 =?utf-8?B?ZDRWWUxTeUtsM1BOQ3NEOGhhUW1Na2E5WnZZVUxhRW1vblNOak5DTmJpc2ND?=
 =?utf-8?B?SVN2U3BSZC9jUjh5cWNDdEhPQUhUbkFSdEJINGlHaGZnNWJ0YVJkcFA0U3Z2?=
 =?utf-8?B?VWxUbmpBTVJqRUNuRU5PM2o5TWNWRTN1QXlpRVpjKzIzQlVWNitDekZEYkpu?=
 =?utf-8?B?cHEzZTZjQmZObS93QTFpUEc4T1JNNHZKSDZvN0JsV3lYdFlmRkxFendtaFU1?=
 =?utf-8?B?K3U2YThlSG84cmJPZGV1dUVzZUpadWpLZDZ2bW03d2pRVW9YYnFkNjROb0tk?=
 =?utf-8?B?QUR2TitEM0ZhT05tSzI1YlFqTCtIQ2xOTVBFV1Jub0wwZmlsWFRkQXNBSlJq?=
 =?utf-8?B?Mk8zank1NHRTY0hRVHdUTjQ1WU1LbEhnblBCdmFwbS9WSVVDV0xSNTlud29o?=
 =?utf-8?B?U3RLWVo2ckdJL3dOTWRkR2cwbUxiUTJkWFM3Qmh5Tk1mL2FxcFl0VE1jK0wy?=
 =?utf-8?B?dUdDNFhRYjNuNGIwaGI4empGRXNvaVlPWXlFSjFTSWphVHRtS2lNRnVRMzU4?=
 =?utf-8?B?MEFnSGpxZEtKeHdKQ2RHV1JZNGpySkdpRUpXWHBMS2ovVXFqcmM1Z3hVcHRi?=
 =?utf-8?B?NmZPalBzWEZIcWxvQXNQT3R1aGtaZ216OCtxWWhEMnRyOG1pemlRVEtxTWw5?=
 =?utf-8?B?N3R5bElNTE9MUTlydFdGVmtBdldaZ3VuUTdrdlhPWjh0YlFSdFZSdXgvOEhG?=
 =?utf-8?B?VFF1dXpobDMvUmdrSEgzdUZnU3FzNDhtUHlmbDJvdjJtVEU1M0ZsZ2ZEdUND?=
 =?utf-8?B?OWFTTFo5bzJyZmRWSFlQSGtYNWF5TllyVjdSVU5aNyttb2RXWk13czNIODA4?=
 =?utf-8?B?a0lFMzZaK3FWZmVtT1ZobVBLeXROMGtWRmYwTm9PZ0F3TTJOY2lnTnhZVFBY?=
 =?utf-8?B?VnpDNWg3U0hyZGl1Njk4OVd6ZkRRNkgyLzVmUnl2UE1uNU4xSXhWQUNyUlp4?=
 =?utf-8?B?SDBsR3ZUUWR1NTBKeEFJZXE2eXMrYTIyamRYZE9GU0p4VU02WmJoWS9zSFgv?=
 =?utf-8?B?UjdNZk1OcnB4WHFuNmZqcXFCRTVkdG0zSkRONklzMzZlcUh6VTdnNWdPTnJ3?=
 =?utf-8?B?dVh4ck1QZGZWbnpSdXFtcEZNajd5dVZ2UmFHSUQ2VjhaYnFWWWRaM3gvTEhM?=
 =?utf-8?B?dkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1352977-4445-4150-774f-08dd49b4fa01
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 09:26:19.7623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Fm8ULPsG3a8lXlIJuT8VfyZI8Wr9N5gOmRvCVy6rFPvxRpBmdAQc05yDrWG/OnMFQM4QL7mYC1exRvKsKR5UPMI3agl3nqLYxs3GUkxJog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
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


On 1/27/2025 11:59 AM, Kunal Joshi wrote:
> This patch introduces kms_mst_helper.c and kms_mst_helper.h
> to centralize commonly used MST-related logic.
> The new function igt_find_all_mst_output_in_topology()
> enumerates MST outputs that share the same root connector,
> simplifying code reuse across tests needing outputs on
> same MST topology. The existing MST-related code in
> kms_dp_linktrain_fallback.c is updated to use the new helper,
> removing duplication. Additionally, meson.build is modified
> to include kms_mst_helper.c in the build process.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Added comments to the latest version as part of : 
https://patchwork.freedesktop.org/patch/635061/?series=143039&rev=3

Regards,

Ankit

> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 28 +++------------
>   tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
>   tests/intel/kms_mst_helper.h            | 10 ++++++
>   tests/meson.build                       |  1 +
>   4 files changed, 63 insertions(+), 24 deletions(-)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index a05e2015f..b10946781 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(&data->display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -}
> -
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
> +							mst_output, output_count),
> +		    "Unable to find mst outputs\n");
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> new file mode 100644
> index 000000000..9d52068f7
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,48 @@
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to an #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
> + * @n_pipes: total number of pipes available
> + * @used_pipes_mask: pointer to a bitmask (in/out) of already-used pipes
> + * @master_pipes_mask: bitmask of valid "master" pipes
> + * @valid_pipes_mask: bitmask of valid (non-fused) pipes
> + *
> + * Assign pipes to outputs based on the number of required pipes.
> + * This function will assign 1, 2, or 4 consecutive pipes to each output.
> + * It will also mark the used pipes in the bitmask.
> + *
> + * Returns: true if all outputs can be assigned successfully; false otherwise.
> + */
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs)
> +{
> +	int output_root_id, root_id;
> +	igt_output_t *connector_output;
> +
> +	if (!igt_check_output_is_dp_mst(output))
> +		return false;
> +
> +	output_root_id = igt_get_dp_mst_connector_id(output);
> +	if (output_root_id == -EINVAL)
> +		return false;
> +
> +	/*
> +	 * If output is MST, check all other connected output which shares
> +	 * same path and fill mst_outputs and num_mst_outputs
> +	 */
> +	for_each_connected_output(display, connector_output) {
> +		if (!igt_check_output_is_dp_mst(connector_output))
> +			continue;
> +
> +		root_id = igt_get_dp_mst_connector_id(connector_output);
> +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> +			mst_outputs[(*num_mst_outputs)++] = connector_output;
> +	}
> +	return true;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> new file mode 100644
> index 000000000..291fcebfe
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,10 @@
> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..2cbd21c2a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_dp_linktrain_fallback': [join_paths ('intel', 'kms_mst_helper.c')],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
>   
