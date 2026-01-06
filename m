Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B13C47BC4
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 08:21:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264C310E4A7;
	Tue,  6 Jan 2026 08:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dz81k3VF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C6210E4A7
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 08:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767687684; x=1799223684;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0iOx24ZgwGOayJSMdi+v/c4Eki514RO6DostolOMaM0=;
 b=dz81k3VF2m/UAcCd+EGNnU4hfHod6MVQWKDKPOkG+CZez6xOkxVZ3Epa
 D7zuwp2XA/h9OD2ixpUlvZD4/RLdNniIH87efPtYj2o8DaAerStLPP4OG
 XrnzE0iLXzCsnHLfoutof68aGb4AiKDdIcu4LC8vuO9DSdqcJRjAIb9t+
 gUk8R0gGjTTTomlJD5jFT/IzgJe9kV8H1+EqAEeoEMWUdjXsvPorPiCwr
 +TFQiE2K8h02B5iqO+VTSiI1J+DmEb76GPHzjMs0mJ4SrYL8nuTRuAFQM
 gzl1EYB6HDGyYOr7BM5WdRaRaaymUbnbM1GIfD9WyTGYARuX6EH9wkRU4 A==;
X-CSE-ConnectionGUID: wdBtgZupQRa8UDG8xTc+/A==
X-CSE-MsgGUID: vY1MJtP5TDyFzb83knCrIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="79688150"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="79688150"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 00:21:23 -0800
X-CSE-ConnectionGUID: YL04nojSTrWpdxqxpLHXYQ==
X-CSE-MsgGUID: t8/fPNyBT1OG6oMyLfI4kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="206745319"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 00:21:23 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 00:21:22 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 00:21:22 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 00:21:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2zK8TWB7zUTVj8ZwOVTtglZTanUYVkaEwrecU3Wpl6yqe31135nDiA8Az6wZytKLDNcmffPSa3KB1ECbkRkW/C+XEinfBA5FIiNQHRzn4pZW0Shs3Biwf4dvqAsQch8Ra9bMdyuF5szRnvrYPAE03nHLBj8YghKhOaXJx1OWbu3/3Qg+lgn30QxHtNPKwGQXL2BP36lMy/XKzXR4+bubZwy8V1RWDWqMOT8eUJ+JJvt7DLGQEO9kkhtvNJId/pOlSUkWjJ6w0sdTbp7S6gmGTpxoKje1aJLQPGB8y/6D6vF5uMA6v664wp3hHlQ2iVUDFCqwarJQ+VWZoOr2nZVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAL1iQGwkKjh2/NESj4jFDKRYWLnC83BLxhymXScf5U=;
 b=A2Yr6jYMtOzTLo0ORLL4uFlp+Yd2xBJ7qylpMKK2bphgL/whU5DItdojXKFEPa72WTxE2Yp+0FaqrpUX/Aj0OAhF53TOSpv4jrdtD4caIKALOH0lGBhKnv7tF5CK2ovwnxy4vhCoU8LbxPMSt4TIozDMx17R0k+7Wz3f2plQTMggL5bxFj42hMX3ia+FDzuUnHKwPjDUIEhS51RfZSZqqclcM7PhZ4e8TDlJGjzTz7clCRjAeQqA/g7zwvnFRHrYDEjkT/1WI3s+hiQe7ZARKJTswiO9GsGp1UKyKkTQzGz6te6QumeM7yLTSMjMI2r1As1p2j4wNXc1OH7NHHTzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by CY8PR11MB6914.namprd11.prod.outlook.com (2603:10b6:930:5a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 08:21:17 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 08:21:17 +0000
Message-ID: <d294321b-d1a6-43e4-86f1-0e29ec3e1325@intel.com>
Date: Tue, 6 Jan 2026 13:51:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/intel/xe_multigpu_svm: fix 32-bit build error
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Nishit Sharma <nishit.sharma@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
References: <20260105234615.284403-1-x.wang@intel.com>
 <20260106060258.298009-1-x.wang@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260106060258.298009-1-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0185.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::13) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|CY8PR11MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 371a66e5-4e44-489f-1e12-08de4cfc8ef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWREZXQ1Q3VjajJoZGErejFrY3VjYVFkY1R1L2V5R2FCYmtIOG9EeTlWbkg5?=
 =?utf-8?B?ZnFiMnJPNGtxREJpQUdZSEFMSlFFeW5iUkNLbUVVWFgyUDV3YytJTUlBWG9Q?=
 =?utf-8?B?UnJFRm5qcG5FYzVLV3pQNXNualRUUVlXdkY3U08xdjkycXk4RW9IT0N5bmhu?=
 =?utf-8?B?L1V6WEVWK1ZWeU05YTBkWC9ITXBIM1VGWlFIczZYcWNncU9rUEkxeWZkTjBp?=
 =?utf-8?B?TVRSZWRJMXNHaHduK1R3bmY5cE9lZUZUVGVKMENMdU0rU3dHZXA1dkpieVhB?=
 =?utf-8?B?R3RETktGWWJUSE53YmF0TG5zUjFLV2tHNzVuR3oxaTFiUG82WjMwT2ZVMUU1?=
 =?utf-8?B?TnY3RmdibVlRVDVZdVFKNloyQ0k0VStwaVJhNG5ISkJiRC92emVGc05XZ2Fq?=
 =?utf-8?B?bGl1dGFUWi9QejhWMHhjTzBpK21rWlhROGpjYXdrOW56VzZ0M1VSM0FVbnFF?=
 =?utf-8?B?Q2JKL1V3akVKUTliVjRTSTNLaVFtbVhSMDRmVTQzL05hLytGUHlKcC9NUXFs?=
 =?utf-8?B?ajMrZDR4bFZZNVNoaU51NEFzL2w4SEREY0tiRk1tdW9ZZmdiVk1IRDVoQmhF?=
 =?utf-8?B?Zno5RGsyY0NCQTcya3l5UEY5K1BkMm5xeHFYYkp3cGZRdVc1bjhFRzdPaHFJ?=
 =?utf-8?B?REM4VS9lNDJtZVZVdFB0TFpqbUtZZC9xWngrajFEYnZIVTZZUUEzaDZpemdC?=
 =?utf-8?B?NE5yZHhicmFjVE9NcklsZS9DSVBuY2xkY3o1emhtV0FrVmh1Wk9oUWNDbW1W?=
 =?utf-8?B?SnEwTndaejUvSUdnaGU4UE51MEdzS0QzMm9XVlVtb2k0aERMak11TmpwVEEz?=
 =?utf-8?B?QnFpTjdISmkwOHRvZlZlSWRWUGVFVW1TaGpoclQ3azJ4cDYxRm05eklmUmN3?=
 =?utf-8?B?c3hubUdxRFdCYnRhSTJmdjFiRWhJa0JvL25yWDZhNE10QmdKdDdZclUzYjJv?=
 =?utf-8?B?WVVPOWU5T0JFeVFRSHRaUjVseEJpUjQxVVdTMThUTWV6azh4NkR4SDBQRnBE?=
 =?utf-8?B?bjBQU0JxYk9rVXJVc3VseWdQUmxoSk5KRFlLUHlZWlJieFg4QitwUXhheElI?=
 =?utf-8?B?NXlEajIxZWR6WGtCWnJHNVl6eElhVWErb2hCTnNEblk1bGFnaUhFcnQ0dnpQ?=
 =?utf-8?B?RE9nZTltQThNVmNtUHh5VG54Mk1Hemc4OEVaamFRM3Jya2J0SDBxUm5pYzhu?=
 =?utf-8?B?c3RJaVE0dHd5MjdnSlF1clI1ekM2SUpmRkNNRnBkMkNXNThEWEt3NjYxRVhX?=
 =?utf-8?B?eDVJYlUweDVZNGM5c3diUW1FNDJDTXZUSXU4MnNxUVJZVWdXS0FoL0dpLzAz?=
 =?utf-8?B?Q2pYOHpUbVU1U2NRam9FWWhLT2FzeEx5cGIxSk5GUEtjbTlxci91SG8rNkdY?=
 =?utf-8?B?anNtdUxYUCt0Sjg1UHZFZTZ5VFNKTTRJUVNBVFUzUDlmREh1bHRmekNuS3Fw?=
 =?utf-8?B?QmpuZ2ZBenpodTBUSzlKNXVRYjhhVnE2d1BNdHpCTnNXV2IrWmhkeWpyR3ZP?=
 =?utf-8?B?R3ZrM1oySlVEUVZOQnIySGYwNmVHZ3NDakU5aDd2VmpscndWOWdjWTlGM2t3?=
 =?utf-8?B?clk0VWlYWXMwNnBjQjFCOG13NVdUb1AzVlBNQjdJc1NGR0U3bFlzUmpXZ00z?=
 =?utf-8?B?Z1E1cE1EdVhLcCtTdUJaWU56UlJNRk4zT0wzUS9ZUE9IT3hISkxyQy9xeit6?=
 =?utf-8?B?TjM5eWtUYmdsa21IS0pmWFVXRDBCcGNCZjU4VDFScXhtVWhRejBMTkJKTDNk?=
 =?utf-8?B?OXVOT1VKbW9MbW9PaEFVM0J0djJJV1JsMlVaRWcxYll1RDMvcXVCZkNXMnpl?=
 =?utf-8?B?SVprUnZseHF6SWRjOEcxeWh1L0xvQnpyYnJMbzF0cnAwb29tdmdaSEx3NEFR?=
 =?utf-8?B?OUhGL0c2dGcvY1ZHSk1hZDJ4dC9yWVVjV3dsUVlxQmtnREE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3kzMmFINWJ5cDhRenVMeDFIdVJMUTJSdnpRQ3lhMkJPbEhYYTN1bEM2TW5K?=
 =?utf-8?B?dCtwVmd2TFZPZHB0UGMxRUljTkpPTEFoUjJIRmxZL1dZMFZydFlGTDh6cThx?=
 =?utf-8?B?YTAzSXJ4ZUZOWERldXlWVlZGbnYrRkdGZW8rNUlqVUM4UzBYQkVrZ25XNmh3?=
 =?utf-8?B?TlMxaUdmcU9uUlNOT0V5VE5pbE9PM09hTXQzZkZzbGc5MkVjclErSzNnN1Jw?=
 =?utf-8?B?SE9FVTN4ai9SN0c0RCtnbDBmemVIdWNzSk93ZzR0c0VsUzZrNXE1a3QrMHQx?=
 =?utf-8?B?TFY4WGpnM21CV0M4U0FlL0hpQk0xVnJaNnVXY3FYZ20zZjZ1c3VIbWc1QU42?=
 =?utf-8?B?ODc5UGJFSHZLWURja1BGRGFPRG9OZzdHMS9wRklDSDNBUGMxSEtQdjNac2pO?=
 =?utf-8?B?ajc5ajZLNTBPRHYwUXNWMHlxQkNBUE1mTDJnSmhaNFFSeVU0TFl4em40VW9h?=
 =?utf-8?B?OTFibStoUzdFck5HUzRiV2UrVFRYcWZhU1lUSGZzZU44clJSTTVHV3hKZjYx?=
 =?utf-8?B?cnRkOTRoTFNVR3BuNStHR3R3V0pjYzBBcW9sUFF5RVMzSkFFaFdJa2thdVFQ?=
 =?utf-8?B?eVI0dXpJa0VNN0lPTnlIZ1VFSFo3dEFzZy9lK1h1VzQwK1lkV1pOK3dTTHdY?=
 =?utf-8?B?bUIzM2dqbk1QangzYVRuR2EySnV3bTBLSUdOaUxaaEZIclFHazlVTFRKei9X?=
 =?utf-8?B?RkxKMjJqTzArSTJLeUk4NmNNVXhBeUhzZ3RLWktvOXljd3FWTVJYVDZUckNI?=
 =?utf-8?B?cXhsR1BZNVB1RFdTcnVubjNsV1FBUkFicXFvakVxZUZVOUM1dFZUd3lLd2Nw?=
 =?utf-8?B?K21EcVBvNEsyNWY5bWxYVVFtTm9qd1hLS250YURBMVJSTkViT1B0M3NheUpv?=
 =?utf-8?B?UWVaRWx5MlhQazBYd1B0K1k0TVdLMGw3TVhLS3FhVjdZSlBLalZUM3VYeXRi?=
 =?utf-8?B?S1ROM2JUTnZMVExFVG4zTitpejVJSHplcFMvOVAyTjcxVjlTQmlxVWhYOEp5?=
 =?utf-8?B?ZnNHSzVRRDUrdzlESWdwTmdpdjBZSnhlYm1PZ2tIQjVwTTdjV2FscVBYZVJ4?=
 =?utf-8?B?L2QwUGExdDh5c1VHL2REUGZwVCt6UnU0WEJDZ0pMdk1mdythQnpKa0EvVnpm?=
 =?utf-8?B?SlZqcHNuOXFsQXR6aVNEdFh6VGtyNHQyMEdVQzhSTnBQb3N4bWNkdFBpQkNI?=
 =?utf-8?B?eDN6K244akhlOVBwVlpFbzZ3L1dUOHRGc09lbjJMM3dmU001bHRrOGJmTUxR?=
 =?utf-8?B?WUgveDZXMmM1c0xaSDl4U3hrWUEwc21KYXF1VGlESkN2MGUyS01KWGU5Nkwy?=
 =?utf-8?B?TFJreFdwMFVhTUR0UkJWcW9vVzU3TFkvTWVsSS9UcXVPTFNHTk44UGpOZUFX?=
 =?utf-8?B?U0dML2c3QS84RFk3bDlxcUV2UGJWcTdsWUlnMzV0STZHVEp6NERkK1ZCR0dI?=
 =?utf-8?B?dkcyNjZLWDJyWXVFQlhqbEIySzB5aDN6OWgwbEdRSlFBd1I0bUxlKzRmaUwv?=
 =?utf-8?B?RnFUTFExUVEybHp4eWxONS9VNDZ2dGxlemRucExjRkIvVWVnTi9kemE1OUVL?=
 =?utf-8?B?Rno4YWlaRXJGYjJoOGZ6K1ZpZWkwSkxrWXplTmpJZ3ZTZk1ydDhENUMxelZU?=
 =?utf-8?B?L2tXY2IxLzdEUlNHSmNCVGFLT0hPU0ZQK016Rm95d05DS21KZjJTVUJSWHp2?=
 =?utf-8?B?SmlzZ3d4QmIyUnRwZGI0VXR6ODRxMVE4cUR0UEhHdHpSNlRIcEZROGtPcllM?=
 =?utf-8?B?dXRQWnJuaHQzUlBJeXcrK0FrUUpqZUtPZFVUZG1FUmJ6c1MwRnFBRk1YdnIx?=
 =?utf-8?B?ZjkrcGpuOXJiR1FLY24reTF4RFFabDBnenRpZW1SeXlJaVpTaUswK29mRWEw?=
 =?utf-8?B?NDQ0R3FGdnlwQjVEVHdQRU9YR01sTDB0UlJKUVpNaVVyd0JaL3IxYkkzWWRU?=
 =?utf-8?B?QVNsMTBYN1NtanB1OFRSdlNBK0FkeGQrc1dTLzBmZjZFWTFnNU15YUR2aTV5?=
 =?utf-8?B?SjR1YUR4ZTRqU2pnRUVHYzVNNllCdk8ySnBOZjBGTzFGcmJEQVpzQTVsUFhp?=
 =?utf-8?B?Mzh4a1ErQ0tWNmpoMEgxVTVkNWVpZEN5ckxoZU5XOUlQSSt0Z3hQVGpHNVVx?=
 =?utf-8?B?RnVHSjBhclRXUmNUY0VUZlRUZ0t3K1RHc0NHSDlCcXp1S3p4dEVrVjFEWGoz?=
 =?utf-8?B?Z0pSL0VHK3JQeUFkTmxzSnVVWmJURUgwSkVlNWNSOFFxVFJSM21DUU1tNHhm?=
 =?utf-8?B?RGV1amhKZkN5MFE0M01tR3UxSTgrYkJNNjd4ZzgrVHEweXBOaExFUzR4YnBm?=
 =?utf-8?B?UW1NOWNseCtKemNkNXFxd0RuVEhCd0wvekZGL0FMZldmRWcwVHBvUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 371a66e5-4e44-489f-1e12-08de4cfc8ef3
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 08:21:17.0791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TZTJyO91Gn8oYzorYLu322PivjiSPQ9KqQDL7Cxt+j03xgdR3paew7Yls8qnNEREMAwzVYhU+C09+3HapWT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6914
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

Hi,

LGTM,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Will push these changes now as we just have styling changes from V1 and 
BAT is clean, so that CI pipeline testing is unblocked.

On 1/6/2026 11:32 AM, Xin Wang wrote:
> The test was treating several ioctl-style __u64 user pointer
> fields as native pointers and doing pointer arithmetic /
> dereferences / munmap() directly on the integer values. On 32-bit
> this triggers -Werror=int-to-pointer-cast and can also truncate
> addresses. In addition, splitting 64-bit addresses with 1UL << 32
> is not safe on 32-bit.
>
> V2:
>   - Fixed the checkpatch warnings. (Nishit Sharma)
>
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1577551
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>   tests/intel/xe_multigpu_svm.c | 72 ++++++++++++++++++-----------------
>   1 file changed, 38 insertions(+), 34 deletions(-)
>
> diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
> index fee738035..0758c65b4 100644
> --- a/tests/intel/xe_multigpu_svm.c
> +++ b/tests/intel/xe_multigpu_svm.c
> @@ -3,6 +3,7 @@
>    * Copyright © 2025 Intel Corporation
>    */
>   
> +#include <inttypes.h>
>   #include <unistd.h>
>   
>   #include "drmtest.h"
> @@ -407,10 +408,10 @@ static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>   	cmd[i++] = height - 1;
>   	cmd[i++] = width - 1;
>   	cmd[i++] = width - 1;
> -	cmd[i++] = src_addr & ((1UL << 32) - 1);
> -	cmd[i++] = src_addr >> 32;
> -	cmd[i++] = dst_addr & ((1UL << 32) - 1);
> -	cmd[i++] = dst_addr >> 32;
> +	cmd[i++] = lower_32_bits(src_addr);
> +	cmd[i++] = upper_32_bits(src_addr);
> +	cmd[i++] = lower_32_bits(dst_addr);
> +	cmd[i++] = upper_32_bits(dst_addr);
>   	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
>   		cmd[i++] = mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs_index;
>   	} else {
> @@ -542,7 +543,7 @@ gpu_madvise_exec_sync(struct xe_svm_gpu_info *gpu, struct xe_svm_gpu_info *xgpu,
>   			     sync_addr, exec_queue, flags);
>   	free(sync_addr);
>   
> -	sync_addr = (void *)((char *)*batch_addr + SZ_4K);
> +	sync_addr = (uint64_t *)((char *)from_user_pointer(*batch_addr) + SZ_4K);
>   	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>   	sync.timeline_value = EXEC_SYNC_VAL;
>   	WRITE_ONCE(*sync_addr, 0);
> @@ -630,7 +631,7 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
>   			     sync_addr, exec_queue[0], flags);
>   	free(sync_addr);
>   
> -	sync_addr = (void *)((char *)batch_addr + SZ_4K);
> +	sync_addr = (uint64_t *)((char *)from_user_pointer(batch_addr) + SZ_4K);
>   	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>   	sync.timeline_value = EXEC_SYNC_VAL;
>   	WRITE_ONCE(*sync_addr, 0);
> @@ -645,7 +646,7 @@ copy_src_dst(struct xe_svm_gpu_info *gpu1,
>   
>   	free(copy_dst);
>   	free(copy_src);
> -	munmap((void *)batch_addr, BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch_addr), BATCH_SIZE(gpu1->fd));
>   	batch_fini(gpu1->fd, vm[0], batch_bo, batch_addr);
>   	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
>   }
> @@ -680,7 +681,7 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
>   	copy_dst = aligned_alloc(SZ_2M, SZ_4K);
>   	igt_assert(copy_dst);
>   
> -	WRITE_ONCE(*(uint64_t *)addr, ATOMIC_OP_VAL - 1);
> +	WRITE_ONCE(*(uint64_t *)from_user_pointer(addr), ATOMIC_OP_VAL - 1);
>   
>   	/* GPU1: Atomic Batch create */
>   	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> @@ -715,12 +716,12 @@ atomic_inc_op(struct xe_svm_gpu_info *gpu1,
>   	gpu_madvise_exec_sync(gpu1, gpu2, vm[0], exec_queue[0], addr,
>   			      &batch_addr[0], flags, NULL);
>   
> -	final_value = *(uint32_t *)addr;
> +	final_value = *(uint32_t *)from_user_pointer(addr);
>   	/* NOW CPU can read copy_dst (GPU1 ATOMIC op) */
>   	igt_assert_eq(final_value, ATOMIC_OP_VAL + 1);
>   
> -	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> -	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
>   	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
>   	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
>   	free(data);
> @@ -787,7 +788,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>   
>   		igt_info("verifying concurrent write race\n");
>   
> -		WRITE_ONCE(*(uint64_t *)addr, 0);
> +		WRITE_ONCE(*(uint64_t *)from_user_pointer(addr), 0);
>   
>   		store_dword_batch_init(gpu1->fd, vm[0], addr, &batch1_bo[0],
>   				       &batch1_addr[0], BATCH_VALUE + 10);
> @@ -795,7 +796,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>   				       &batch1_addr[1], BATCH_VALUE + 20);
>   
>   		/* Setup sync for GPU1 */
> -		sync_addr0 = (void *)((char *)batch1_addr[0] + SZ_4K);
> +		sync_addr0 = (uint64_t *)((char *)from_user_pointer(batch1_addr[0]) + SZ_4K);
>   		sync0.flags = DRM_XE_SYNC_FLAG_SIGNAL;
>   		sync0.type = DRM_XE_SYNC_TYPE_USER_FENCE;
>   		sync0.addr = to_user_pointer((uint64_t *)sync_addr0);
> @@ -803,7 +804,7 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>   		WRITE_ONCE(*sync_addr0, 0);
>   
>   		/* Setup sync for GPU2 */
> -		sync_addr1 = (void *)((char *)batch1_addr[1] + SZ_4K);
> +		sync_addr1 = (uint64_t *)((char *)from_user_pointer(batch1_addr[1]) + SZ_4K);
>   		sync1.flags = DRM_XE_SYNC_FLAG_SIGNAL;
>   		sync1.type = DRM_XE_SYNC_TYPE_USER_FENCE;
>   		sync1.addr = to_user_pointer((uint64_t *)sync_addr1);
> @@ -845,19 +846,19 @@ coherency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>   		else if (coh_result == 0)
>   			igt_warn("Both writes failed - coherency issue\n");
>   		else
> -			igt_warn("Unexpected value 0x%lx - possible coherency corruption\n",
> +			igt_warn("Unexpected value 0x%" PRIx64 " - possible coherency corruption\n",
>   				 coh_result);
>   
> -		munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
> -		munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
> +		munmap(from_user_pointer(batch1_addr[0]), BATCH_SIZE(gpu1->fd));
> +		munmap(from_user_pointer(batch1_addr[1]), BATCH_SIZE(gpu2->fd));
>   
>   		batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
>   		batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
>   		free(result);
>   	}
>   
> -	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> -	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
>   	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
>   	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
>   	free(data1);
> @@ -995,8 +996,8 @@ latency_test_multigpu(struct xe_svm_gpu_info *gpu1,
>   			igt_warn("Prefetch not providing expected performance benefit\n");
>   	}
>   
> -	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> -	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
>   
>   	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
>   	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> @@ -1109,8 +1110,8 @@ pagefault_test_multigpu(struct xe_svm_gpu_info *gpu1,
>   			 pf_count_gpu2_after - pf_count_gpu2_before);
>   	}
>   
> -	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> -	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
>   	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
>   	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[0]);
>   	free(data);
> @@ -1152,7 +1153,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   	data[0].vm_sync = 0;
>   	addr = to_user_pointer(data);
>   
> -	WRITE_ONCE(*(uint64_t *)addr, 0);
> +	WRITE_ONCE(*(uint64_t *)from_user_pointer(addr), 0);
>   
>   	/* GPU1: Atomic Batch create */
>   	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, 0,
> @@ -1195,14 +1196,16 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   		bool last = (i == NUM_ITER - 1);
>   
>   		if (last) {
> -			sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
> +			sync_addr[0] = (uint64_t *)((char *)from_user_pointer(batch_addr[0]) +
> +						    SZ_4K);
>   			sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>   			sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
>   			sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
>   			sync[0].timeline_value = EXEC_SYNC_VAL + i;
>   			WRITE_ONCE(*sync_addr[0], 0);
>   
> -			sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
> +			sync_addr[1] = (uint64_t *)((char *)from_user_pointer(batch_addr[1]) +
> +						    SZ_4K);
>   			sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>   			sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
>   			sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
> @@ -1230,7 +1233,8 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   				       exec_queue[1], NSEC_PER_SEC * 30);
>   	}
>   
> -	igt_info("Both GPUs completed execution %u\n", READ_ONCE(*(uint32_t *)addr));
> +	igt_info("Both GPUs completed execution %u\n",
> +		 READ_ONCE(*(uint32_t *)from_user_pointer(addr)));
>   
>   	/* === Verification using GPU read (not CPU) === */
>   	verify_result = aligned_alloc(SZ_2M, SZ_4K);
> @@ -1241,7 +1245,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, to_user_pointer(verify_result),
>   			 &verify_batch_bo, &verify_batch_addr, flags, INIT);
>   
> -	sync_addr[0] = (void *)((char *)verify_batch_addr + SZ_4K);
> +	sync_addr[0] = (uint64_t *)((char *)from_user_pointer(verify_batch_addr) + SZ_4K);
>   	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
>   	sync[0].timeline_value = EXEC_SYNC_VAL;
>   	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> @@ -1257,19 +1261,19 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   	final_value = READ_ONCE(*(uint32_t *)verify_result);
>   
>   	igt_info("GPU verification batch copied value: %u\n", final_value);
> -	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t *)addr);
> +	igt_info("CPU direct read shows: %u\n", (unsigned int)*(uint64_t *)from_user_pointer(addr));
>   
>   	/* Expected: 0 + (NUM_ITER * 2 GPUs) = 400 */
>   	igt_assert_f((final_value == 2 * NUM_ITER),
>   		     "Expected %u value, got %u\n",
>   		     2 * NUM_ITER, final_value);
>   
> -	munmap((void *)verify_batch_addr, BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(verify_batch_addr), BATCH_SIZE(gpu1->fd));
>   	batch_fini(gpu1->fd, vm[0], verify_batch_bo, verify_batch_addr);
>   	free(verify_result);
>   
> -	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> -	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	munmap(from_user_pointer(batch_addr[0]), BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch_addr[1]), BATCH_SIZE(gpu2->fd));
>   	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
>   	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
>   	free(data);
> @@ -1356,8 +1360,8 @@ multigpu_migrate_test(struct xe_svm_gpu_info *gpu1,
>   
>   	igt_info("Migration test completed successfully\n");
>   
> -	munmap((void *)batch1_addr[0], BATCH_SIZE(gpu1->fd));
> -	munmap((void *)batch1_addr[1], BATCH_SIZE(gpu2->fd));
> +	munmap(from_user_pointer(batch1_addr[0]), BATCH_SIZE(gpu1->fd));
> +	munmap(from_user_pointer(batch1_addr[1]), BATCH_SIZE(gpu2->fd));
>   	batch_fini(gpu1->fd, vm[0], batch1_bo[0], batch1_addr[0]);
>   	batch_fini(gpu2->fd, vm[1], batch1_bo[1], batch1_addr[1]);
>   	free(data);
