Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5A0CD0437
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 05:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFABE10E37D;
	Tue,  6 Jan 2026 05:33:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QPGK5qBt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D72E10E37D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 05:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767677596; x=1799213596;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YjVPIPx86p3KLuP5iRO4iVn7dgv+8f2E1cWixtqqObc=;
 b=QPGK5qBtP37Wbs8fwsXaqwc52QDmZtgt03bLIIzq6s6X99GEht4hPcJO
 0B1AUl556HpKbl802jqcyO4kpSO0l3fSSD0eReA8o8l+rmzSG5FIZ63kc
 v44R87XfH3DjNg3cFXbpvVMtmSUyp5oYJSs4yDegesZD+uGuLS/jrMY7A
 n/Dx8p+2lZxpgLIRKn/ZyS8NT/r5NjpEnIoGFG7Kgpd8PC3rKbbZI0y8V
 9gU/cw4BOUXeWcZV/N1ARETqfwbi6MBl3MG/++aM7QRqC7boo3OJTBQBy
 mugwuz1iuo3ZGHLDZlVZA1f/G8gBvGyhpvNxfqqPu9JhbB+Pq8ia2iTZV A==;
X-CSE-ConnectionGUID: UQEuZT2oRgSH+ipqD0jZKg==
X-CSE-MsgGUID: Bql3JfwVTrm5jTByYdcJzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69091814"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69091814"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 21:33:16 -0800
X-CSE-ConnectionGUID: RbM9w6lOTmCCvf2GXwaamQ==
X-CSE-MsgGUID: z3umwSTsRGujxNL5BlHWzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202194183"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 21:33:16 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 21:33:15 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 21:33:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 21:33:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dz6EUb+uBoqrN4mJaJkL8oJ7MQvbTMIz1YSCwX70RDPFFECM3bGVeZx3vlVs1SKNZh4g7eBgoz+5JjVUsro7aeznB/K2VIYEjx0DhzndYva9wpaXzuJwVtKOHyPmMXeJJDAdnVQKEaUcFu3i+gwZFZcC9xxFrQlYBxV6oFq/ElUMtXiM4fWc9LafKQ4SyPKgyw8prRWebaG3oGfrrcw3FS7H4vXgDbCjfeNcyrBtRZWVMtrJ3rBgZN4T7iA9A0OftPPzHw+5n+cDSnYB2MsJr8rVkLdj+LqObDDjU0KGwGTct5XohA/mg8Y3NeqvtNob0noUJmXN4AtM7dhXftPV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ger+Lp4vdcSm/jBq6db/yHVktr3DyvTX/7Sw+ciYQIM=;
 b=vyholHDAhytkzrCVNKb437v81bm8LaFGyIz1llawEFTEXzou4s5ElT1nhj0fxQlMRJ8CfmEdmCWFgf6k52ecnV9WWG5Bp4ggHHj3zjCvDhtLfrSeZupfhFaPgVCFJks7iJZXP3md4kEjEe/32yAZ3WDvhma9KsB7AyaoV3k40FMTx5RQhSafYzM8sj+EBHL6HBP8MYAHlQRhhXZey04+KCNweEPe1KdSZ0ZcUcvs+3ante7oCphWOyt7pYCbmLCE343vcrjGtyD/NlG39r4EBAhreovHm67TDcbLNenQBM1vHfn/Xo++EzQFbriuALFsZ1YtxHXT2ugJRfELHHyVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA0PR11MB7750.namprd11.prod.outlook.com (2603:10b6:208:442::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 05:33:05 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9478.005; Tue, 6 Jan 2026
 05:33:05 +0000
Message-ID: <99913471-1032-469d-80c9-cc65964c83ea@intel.com>
Date: Tue, 6 Jan 2026 11:02:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_multigpu_svm: fix 32-bit build error
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>
References: <20260105234615.284403-1-x.wang@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260105234615.284403-1-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|IA0PR11MB7750:EE_
X-MS-Office365-Filtering-Correlation-Id: 11171385-1462-4313-3ca3-08de4ce51127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkZlbGFQRWc0N1N1cVVraFFQdkdJODVzV3lEaVVmSlNMYk1PSGdlbms1WjRN?=
 =?utf-8?B?OXRWZXJGWnZkYW5vbDlPeCtNSnNyZlBLeTRYM2JYOU12cFhGZTVyclpCb3cx?=
 =?utf-8?B?VjRLdmlUUk5JOS92WkpZQzZ2WHl2eDE5Tk5yM1FEWktOTGQrT2N2bFhDNEZQ?=
 =?utf-8?B?S01UTHF1U1JvU05qcWRva0pkMFBWUTB1Ukg4ZkxEYWYwaUZuL2I3WlB0UmND?=
 =?utf-8?B?RnVoRTlQOWNSTlg5d0Q4RW1VekJyYWdJTERodytMQi8zVzlwdzRWVVRHa3ZW?=
 =?utf-8?B?Y1FnTmt5ckNSZ2Ftd2RiYVRlUEFkVHV4b2lOcmRmZ2xZY2NEMXpTV1pwRnds?=
 =?utf-8?B?ZnU1VTF3dXMxWjNkRTJ3cjVvOE0xS3pmZVQycWxldXc5R3IwNlJ0SHU0K3ZW?=
 =?utf-8?B?cXU1YkVyRXFYeERBMk1RQnZjaElOM3FIMU9zcWYzVTZkc2ZCMlRLS0xJUUFu?=
 =?utf-8?B?MURPa0lVK0d5NC8zN0x2WXAxQUwzSFlkL0lXTW5XaGZ4MFJodU5lM3BJS0d2?=
 =?utf-8?B?RXpHUkNLQ2ErRmRVbVlwMFRDNDljM2xFdXZvRUsvbGtIbFdwSDhSRmh0dUhI?=
 =?utf-8?B?bEVIMHFQRHA4TlRMb2g5OHdDYjd2TGVuTkgzRDE2elFUcGZPRHZiYXdaYjMy?=
 =?utf-8?B?cXBZb0dqcDg4T2x6cTNNSUFBZ0Z6LzlxRXlBbk5HQTRIWUNSYitNcSt4aytw?=
 =?utf-8?B?bWY4MDEzQzBrM0ZMVVdtMW9od1JDcktTRXA3TGR6ckdTTXdYVFkvd0RRTHMw?=
 =?utf-8?B?UGdtVTNsWTh6cEFmNTFrT201aWlBQ0RvL3c4TFJDejBXQm83Vzh4d29yM0FO?=
 =?utf-8?B?SEJGMGN4Lzh2RnhiNGxPQWdXenB4cURKZWd0YWZvdituZzlkNXpXYjdXcjNB?=
 =?utf-8?B?MHlYQnhIa2E3aS9XYWw2OU5rK1MwODlXaFhDcEs3U0ZyQ2NVL1U3R1RUS1I5?=
 =?utf-8?B?dFdUWitjb1ZmdzZEYU5KMzFFMkFCR1YyREplazdnTVZQcm9UMGc0aldhZStq?=
 =?utf-8?B?RDZBZjVjM1IzRGFKUnd2WHU5ekZXdkN0Zk9jdzBwWHh3VTNURzV4ZlIvbFpQ?=
 =?utf-8?B?Wi90TU9YNDZjRW52b29abHp4bnFjNjZseDRaMGg4NHlsdGp3bk9kRzVJN3Fq?=
 =?utf-8?B?cDhXZklobW1xY2QvNWowbTVnQ1RYcVQxMVo3QkpMUWY3ZEFoT2wwbU5WVC9i?=
 =?utf-8?B?VW4zMWhPcVZ1bnRMaU5oUjhxRGlKbFhRVHFNTkJGaU94NkJ3MEROd0FJSHIx?=
 =?utf-8?B?RE1vM2ZxbjZJUkdLbE8vUVZ0MzJROGNBZzR1VEQvVDRPNVoxTlhObGxodG1C?=
 =?utf-8?B?T2tsd0x4enpFTXJmKzdHWXVZRkMrdDcyOTdpU2dXSHZCbHE4Wi9IOTRpdW5X?=
 =?utf-8?B?cFNMOTR0ZU1TUldISWkraVZkWGtGQnNaRXVwdGQ0dUdseFB2N3hlLzRER2RK?=
 =?utf-8?B?dWo2eGt0YUVCc0Vvb3AyMitKeTVNMWcvQUdhY3dhM3FPVEdCcUg1SDlQRUts?=
 =?utf-8?B?amNJbnVrYTE1OWRUOVNadDM0MENTNVZOWHFzdmhTemhJRzBBc3BSVHh6andY?=
 =?utf-8?B?SFNCTzVtK2xGd2QrMlNpSzlOaC9HbXNHcVA5YjFVYTI4N0tsd3ByZ3JYMzRj?=
 =?utf-8?B?MS9BaldoU1hRc2lLY3BaTjZ4V2hwZ05ZQysxTVlkbFNlL1BQc1YySlpKeUM4?=
 =?utf-8?B?SkRYWENTaVhwcTN4MnZoQnBscXVpQ0kwMzUzWFN1UFJVVTNUbWVZcVlRYiti?=
 =?utf-8?B?dFQrV1FWcHpZanM0ZDRhTi8yNGUweUNJSDJ2azlvV2pEaTdBMG5XTlp0dmRw?=
 =?utf-8?B?TGdZbjZFcXU3Z1l2djJTMDZCbGhxb1NSTSthN3FRZjhlSUlvNUVaTWswc3Bv?=
 =?utf-8?B?MkhlbTFDeWRYWDFnRWhjeXBOSEpCSDRVelp4ZUs0OERSQzRvZTYzcWNwWG9v?=
 =?utf-8?Q?jBL6j5ew1xixYmrqQK0aLxPbosI8k6Br?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWdLK0ZBODdZdWh5VW9YRWdodGU5enZEcGhobDFpbjFRWGw2T0dTcjE5b0FS?=
 =?utf-8?B?MlUwMHh4bkMvZHdQOGJmYlZqWUVPWXZhbjBzMDVZZTF2dFVLTFl3T0JKVXdH?=
 =?utf-8?B?ZjUzMXFmZDFQNkVIRksxT0RRSHovdHY5YlMvTzdpYXhIOHllSHY4YTl6cVJI?=
 =?utf-8?B?N08wY0RYTGpkN1BoZE1BYVB5TE0xUlVQSzUvNXpmcDUzN2tFT1ljQjNCRjU4?=
 =?utf-8?B?Zk1KOU4xb0drYVRlYlpvbVJkNEF6Z1JQZ2MxWndVd00yd2dNNjMxOHVvZWR1?=
 =?utf-8?B?YmJsM0ROQ3JhTWhjY25aQmJTeVJyUzEvenBUdndKTzZ0UlRXNk5pZngxL1lW?=
 =?utf-8?B?N2F4WDhZWlFiWnJlb0l4NU5hQ2hXMlNQc3pMOXg1czRiU3JTWEFwd3dMVFlH?=
 =?utf-8?B?cm5hQWJSRXBKU2YxRHJ2eEUxWTNmOVp6UmpOcVhmVGtJUitkZEtGYUgrcXcz?=
 =?utf-8?B?MnFMZlFZSjA4RVVOcm5CWURSMVd0NEY4c3Q1eitYSUxjaDJnOHl3UUVudWM4?=
 =?utf-8?B?eThIek1MUDlFV1JtVkVQTUZUTW1Xdktqb1I2OWUwcVVPelpwYVcyM2pyZWFt?=
 =?utf-8?B?QzJuaW0veU9oYjdyamtKTHVrN0lSS0FkZ1RIRGQvbjk0VldLcmFPUEJwR2NK?=
 =?utf-8?B?QzUrclowai9ZY0hDTG5IOVRNTkplbUc2Mlk2WVBsQ1VxR1lYeG5mOHMwczVj?=
 =?utf-8?B?dzNweEZpL05NL1pTOCt2WWFoTGNleU9jTENleDNvTGNsNEhuRml1S1RVMmM2?=
 =?utf-8?B?RkdRMHVUSzR4RWU1QnA2RWluOFBSRGQ3QWpadlIzRjlQQmE4Vm5uTGxoODll?=
 =?utf-8?B?RDhtcVJVUnRGOXc3Z0dNaXhDZnR1MnZwcUZ4U01xU3JNaTZIKzlLUlU0cTBy?=
 =?utf-8?B?UU9aenBIMWkvTzU5SE5nMDBNRm91aGRraWFqcEJlNXN5Tjg2L1p2UjhOd3Jq?=
 =?utf-8?B?VWtLZ0kxcS8zVlpIOTRHd3Y1dTB5YW5nTjhZL1l2M1kxeGhNdlUrM1VNblJ0?=
 =?utf-8?B?OWlqbU9YVXdBWlE2aXY2SUxHV0xLSUJ5ZExHUFlCeTFwVUk2aWE1emUzbEph?=
 =?utf-8?B?am1HRFNNQURjZ2F5cWRtSHo5QzlKd25oaDNVVmk3S0I4T0FNeDNxbUdtSGRU?=
 =?utf-8?B?MFJ3Q2VtMk5wQ1Q4aVVsZVhWOEQ2SVpRYmpkaStWdUtMTnJud1l2cGlZOUlW?=
 =?utf-8?B?b0p6NGZObEZZS3ZOeTNQUlBhdkpweVgwcHpwL3dNSFdRN0ZlUjNqUVltOVRn?=
 =?utf-8?B?N1d0WGVqYWhjU0I5QVA5dzZTcVF0cW5ORkk2WHNSTWx6QjhCeVpJZlM4RTd0?=
 =?utf-8?B?ZndVVFRUMC9xRjMvVCtKMkE1N3V3eEtQaFViU1NETXY5YWJqUXZkeC8yRXNo?=
 =?utf-8?B?cStucWlCaCtDZUdGRU43UlFNYVhZNzg1TVByb0E0KzRsaW0xNTZZYkZ6amNZ?=
 =?utf-8?B?SmdVOGhsRTZndCthbThza3RlZmdSSFY5N3VhMUhvN1RZd2hFUGpQMGZGWjNP?=
 =?utf-8?B?NXBrNnYydGpkZTF5cFJKQ2tTQWpBb2NjRkJUY2JYbDBYb1NoY0pLcHNMdUVF?=
 =?utf-8?B?aWFSV2VaL1JZZUlHZndEUlJhUjNYTlp1M3ZFVWVYdFdQUVpFc05FcjZhSDJl?=
 =?utf-8?B?NkFwK1F4VWJMTzZ4L3JFdnp4YUIzVmF3WHlibVNUM3IwZkRnbWprc0c0R2JP?=
 =?utf-8?B?Z0pwZUNoYi9hZ2RXNmg4SlRRNDY4UkZkZFpXbGxLT3dkWU43MFZrSll3bjkw?=
 =?utf-8?B?WFNkVXV0dUgyb0NUOXlreXc1UFg5M1ZvcjJFWGRpakJWdnluSkNUSmlxNW1t?=
 =?utf-8?B?cmZNYlRnUHF6dGQwNWF3ZTBwVG10amI5YWVGMjdRcVhFV2p4UHQyNWFZNEVq?=
 =?utf-8?B?ZGtMNWwxTVJEWjV4Q0NwOFI4T0NocXBWT3AzcmI4bDBUL0FpR2RackpmQVZm?=
 =?utf-8?B?MmJyMSt1ZW1tcytMcUhTN0JERXI2K09JZkFkVUhxN1RPc0J3WExvN2p1UEth?=
 =?utf-8?B?cU42OTBDKzNEQXJhQ0ZsS2JsS3FjMEQ3QlpJMWhPMCsrQlhBa0JhQ2k0WkhJ?=
 =?utf-8?B?SEJGU2R4Q0VHRk9jcEhGODJQVkpFTFBPbll4cDE3NzRNcm1FcDEvRXVMUnp1?=
 =?utf-8?B?dmRrZ3pkaEE2QjJyQnJMQnl3MDkrUTVTL0o5MlUyVjlRS0puNVdEcWoyU0Ex?=
 =?utf-8?B?VjdrVTJSamlTQzd3bEZ4STU1VFFGUmhCOE91Q1FDcU12cHZxM3hzMFkrVnJk?=
 =?utf-8?B?VWhIMGJLM0g5QlRTcUNDZXhiNmw1STB3WnVlQTV0T1dFWFg1czhnQ1B0aG9p?=
 =?utf-8?B?UHV2YmpKNFZvZkJuUnJTOEpaaEtZU3k5dkY4M3phMUxOU29GSDhpZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 11171385-1462-4313-3ca3-08de4ce51127
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 05:33:05.5321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVwoaIALjpJLupV57QTmG3PVkNm0HpC4IabNOKSU7xLLGIe8svfqdiArktSjTCM/Kri4VYaMVf9bF+LHYVGo8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7750
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


On 1/6/2026 5:16 AM, Xin Wang wrote:
> The test was treating several ioctl-style __u64 user pointer
> fields as native pointers and doing pointer arithmetic /
> dereferences / munmap() directly on the integer values. On 32-bit
> this triggers -Werror=int-to-pointer-cast and can also truncate
> addresses. In addition, splitting 64-bit addresses with 1UL << 32
> is not safe on 32-bit.
>
> Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/pipelines/1577551
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_multigpu_svm.c | 69 ++++++++++++++++++-----------------
>   1 file changed, 35 insertions(+), 34 deletions(-)
>
> diff --git a/tests/intel/xe_multigpu_svm.c b/tests/intel/xe_multigpu_svm.c
> index fee738035..5583d781a 100644
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
> @@ -1195,14 +1196,14 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   		bool last = (i == NUM_ITER - 1);
>   
>   		if (last) {
> -			sync_addr[0] = (void *)((char *)batch_addr[0] + SZ_4K);
> +			sync_addr[0] = (uint64_t *)((char *)from_user_pointer(batch_addr[0]) + SZ_4K);
>   			sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>   			sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
>   			sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
>   			sync[0].timeline_value = EXEC_SYNC_VAL + i;
>   			WRITE_ONCE(*sync_addr[0], 0);
>   
> -			sync_addr[1] = (void *)((char *)batch_addr[1] + SZ_4K);
> +			sync_addr[1] = (uint64_t *)((char *)from_user_pointer(batch_addr[1]) + SZ_4K);
>   			sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>   			sync[1].type = DRM_XE_SYNC_TYPE_USER_FENCE;
>   			sync[1].addr = to_user_pointer((uint64_t *)sync_addr[1]);
> @@ -1230,7 +1231,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   				       exec_queue[1], NSEC_PER_SEC * 30);
>   	}
>   
> -	igt_info("Both GPUs completed execution %u\n", READ_ONCE(*(uint32_t *)addr));
> +	igt_info("Both GPUs completed execution %u\n", READ_ONCE(*(uint32_t *)from_user_pointer(addr)));
>   
>   	/* === Verification using GPU read (not CPU) === */
>   	verify_result = aligned_alloc(SZ_2M, SZ_4K);
> @@ -1241,7 +1242,7 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
>   	gpu_batch_create(gpu1, vm[0], exec_queue[0], addr, to_user_pointer(verify_result),
>   			 &verify_batch_bo, &verify_batch_addr, flags, INIT);
>   
> -	sync_addr[0] = (void *)((char *)verify_batch_addr + SZ_4K);
> +	sync_addr[0] = (uint64_t *)((char *)from_user_pointer(verify_batch_addr) + SZ_4K);
>   	sync[0].addr = to_user_pointer((uint64_t *)sync_addr[0]);
>   	sync[0].timeline_value = EXEC_SYNC_VAL;
>   	sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> @@ -1257,19 +1258,19 @@ multigpu_access_test(struct xe_svm_gpu_info *gpu1,
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
> @@ -1356,8 +1357,8 @@ multigpu_migrate_test(struct xe_svm_gpu_info *gpu1,
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

Please execute checkpatch before merge. Got three warnings

tests-intel-xe_multigpu_svm-fix-32-bit-build-error.patch:168: 
WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#168: FILE: tests/intel/xe_multigpu_svm.c:1199:
+                       sync_addr[0] = (uint64_t *)((char 
*)from_user_pointer(batch_addr[0]) + SZ_4K);

tests-intel-xe_multigpu_svm-fix-32-bit-build-error.patch:176: 
WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#176: FILE: tests/intel/xe_multigpu_svm.c:1206:
+                       sync_addr[1] = (uint64_t *)((char 
*)from_user_pointer(batch_addr[1]) + SZ_4K);

tests-intel-xe_multigpu_svm-fix-32-bit-build-error.patch:185: 
WARNING:LONG_LINE: line length of 104 exceeds 100 columns
#185: FILE: tests/intel/xe_multigpu_svm.c:1234:
+       igt_info("Both GPUs completed execution %u\n", 
READ_ONCE(*(uint32_t *)from_user_pointer(addr)));

Please take care these before final merge. Otherwise LGTM

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

