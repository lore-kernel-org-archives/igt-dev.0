Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99467F36C58
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 08:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499CD10E45D;
	Mon, 20 Apr 2026 08:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpRVKy/W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408F910E45D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 08:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776673303; x=1808209303;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=u+mf5Ccypg4qeEZOQDU1v55WzDkOnogmo0PmU91sAmo=;
 b=HpRVKy/W1p6R1RUSJb0wJWZlJScaZvZpZSOGT5UujWIzLbAXh+SX/5a9
 t+mFQwpFxrT3AFEZLQamfwKkbDSpaShnV8hEGLcvGo6qoQjUnovIDWQBi
 V1KUu/IV/6/Jlz2KR6J6syPXR0RujaG2h4+vM0vu2i5daEgJTJZrm5PUR
 FQl/Ifkg/0uC1HXh9TPbJaLHc/7IS796ELR9ckXCjSTZgQL/Vi8rSjJDJ
 la6ma7dAd60CpM5q3wM/v2/EH4RFeG9dTQrKM/ARxS2KNNf6X65FaQto0
 EphVRjD2fylE7nro2YlXpFQTX7VL7UtO3+MTd9G4Of90MlXiYpqvyyaey Q==;
X-CSE-ConnectionGUID: or5QotVeSOOFqJFVWc9dpw==
X-CSE-MsgGUID: JkENzVDjTDizHy3Ok/6oXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77453674"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77453674"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:21:39 -0700
X-CSE-ConnectionGUID: PO6o1fB3Q8SB1Yq7T8k4Sw==
X-CSE-MsgGUID: jwLrLRrYSlmSjEgeTA1rEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228509441"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:21:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 01:21:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 01:21:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 01:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=etAQ744t+sMwl7hd33/JUDuUZWF4iiXXEQReIpfmxmWDnp6Ww1pu+jqDaiPOFkA9rs+b1tNwW1pdpJsXXwNJGPsog61rbFsCXiFo6/XXxOzfQ3pKB8h3HqjCcJ9JiK2Tr3XGWAS1HImFfjwG6PPnm8Vgr2sQsfxbyo0FprRqvW9NCdfjuVnw9qujlmij+gkrdU1Zrn8Upb3ws3tMPkAigBhyf2RrmSlOg5AGS+gadGz8z1lRDPvlopKZMNKTM5Z7ehTfsRXfqBuWUvLKKkBlqiZMHUSQqg8xwboLy71V9TGFofIPytNfC4zn7+VZAS5sLlhs3GxGIvG1QoP5mLIx+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IFcaFXzeB2su9yGt2+44HVZ0z+Kg7bAGN9gknaigG0=;
 b=Bdb7umOnZdKBdjsxePzWLP98YexLPKKxzRPem+gK2m2fjXRbQHEcpz5UciSGvuP/rnv30WwLEpz6n240ZDMznCUCoX2Fhk1nuM5X8YuOOGek4I3sugzsWYBttrYQpzbelWEftaZ2zBqkmMzUqZg8DMzawI+K5hEcQtjIo2ooMmdpZprh/W/5BZkcNAva2E7+LcLj8c6D5Zya6rqFmiHADLVDjv01wwMMLywee88vduFdYLu96UM4jP38eJpUd7ZutobLHAEMWqPpA24xJOyQRCQpjOT7H8x4arfVNXiR81k/NzXPGwgm6UiIVC2n2aU40m8vXy+P2rjQ1okdVi954g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Mon, 20 Apr
 2026 08:21:35 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9846.011; Mon, 20 Apr 2026
 08:21:35 +0000
Date: Mon, 20 Apr 2026 08:21:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <matthew.brost@intel.com>, <jeevaka.badrappan@intel.com>,
 <karthik.b.s@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_exec: Add VM rebind stress test under
 workqueue cpumask cycling
Message-ID: <lhy2kwpdc63zebuz7amvzizowa42qvhvijxbuepfayydzdke6a@ofkhenu5cppg>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260417120135.3100557-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417120135.3100557-1-s.sebinraj@intel.com>
X-ClientProxiedBy: DB8P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::31) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 532d6375-9fd1-4beb-1928-08de9eb5d5f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: jjMzZVcxlrBrs+EczmO0r23U+/0/IqSkY3YlN0yxn9NCU6ll3tVJHcBL8xLgdEC7ZsN7G+llX1YcDy6d7zMa6uJjHut/tvRoj4lKbfT0Ql7y02mgPQpRC3Bow8eKNOgiYoSSOFeypzjBIjRRznP8vwRmB0nr7woSniPSYk3uMzlZ/ae3XCFaQ65oLlEzyOWQUD8hSWwRcLftPO7KKs3HVulqKQjw6lUTGcI/6M6LDhXEtIUOoMx4ggqZ3NCMEnoN3aqWgyneETkn9Zn55R1daE2T+cEYScNvaHvjCuzfGinC7mn8g5QAM2zLBhjix8k2qC5okb6vsE7Ji/q2dw9Sr3V5iks2G/AmC6lsZLlgmv4MTpSEicX6UszsmgcxGke4m3hgyB5CwDZFlx0wcD2Kmj52NkrqNV2HaoPNyNETUd4te6rtKrJ+tyOudPaVMM/n/tjUOqi1A1JO43GY9Mft1nll3zrCchwFVwPvL7TCE+ea6FlPdIb8QwmQyYCftJ3R2H+64FmuVwdWna2+H2zXZGXXa/ILiUIGWim+rGWAbvANfBm4glbZSrxEGExqNSHlfy+w+5q/iqRzYPYbHTD/LTG2A2hKpbChoCICOH8Crjj7Kce3KMu03RDB/dezgbpkHjS76UyfWzu7h7dfOR7Wns1yTLpvsY29KbVlSdyS9qSFfAuhNZHHQj3aTKFSS9Yhxwpxj5OBPyIsbA17yxMavDVF+fjNCK/i2gZG8uT2wI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxFOGJWOWdoRDdDVHR5czRLNHJjSm9KczUvSXloZzA2TnFQZWV1VFdoUlZy?=
 =?utf-8?B?ZFliQjRpTnB0Y2dranVyUVpHbytodE4xcGp6SGpRYkZBQ0FiaHI5Zmw5cGRN?=
 =?utf-8?B?ZmJjaXVtWjlQTUM4cVoyU3BFWVhpejQveEluVnhiU1dkVXZkTyszT2g2bmJr?=
 =?utf-8?B?TjJTTGpmYzg4ZzRhWFBqMUJFdjJ5dUhzclFXQloreUtZVkhBTERtMDVmbHZW?=
 =?utf-8?B?QkhIWmdhNmJ6ZTNURVBicVBxRHlYL0FmYktDK1NQRXBmc2F4bWEzL0xGb1pk?=
 =?utf-8?B?OW9VRzFrS2RwWThYQUFibVNIKzhONHp1eGpmQ2VYQnRBQVBueit6UmMzajJS?=
 =?utf-8?B?MHFMMnI1SUlLU0M5cmlISWRHN1RnQlJlZW1nWHRSSW8xRk1mdVlPSGhQN29I?=
 =?utf-8?B?elVYNEloVlNyYi84K0tydVFLTDlEY2FmcE5FVEh2MnN4QXJ6VklrVFpCNU1R?=
 =?utf-8?B?VTdwc2tWVzlpODM4bnliblFLWnowbUd1WmF1NVB3cDR5Z1ZsT1NPcDhFN1pE?=
 =?utf-8?B?OC9XQ0lYUW9QTzVaVk1lNHRkb2MyNk94cGJObm0rRHd6aHRaekZIM1haZGlO?=
 =?utf-8?B?a1pBWG5kM2J5QXZmRmxaWFczdGhJSDRISFFFcTJDL2VicEkzNTZiandoY3Y5?=
 =?utf-8?B?QWFTcTJ5MXZvbU5Pc2JyTW5wV3dBOHBtQzdRb0tzSUprMUkwQkY5STdUVjZ6?=
 =?utf-8?B?STlhUXBNL0ZYeGxpQks2S2NVOG5PRUI5WG9NUlg2MytrMUtReUlMdmVUcUdG?=
 =?utf-8?B?SExvQThSY0g0WS94U0hSdUt0MXVCVGtLRkIxOTRJclE5alF5b3FJQTNqbWxU?=
 =?utf-8?B?TUJ5bElRalRnYXZsMjM5WStNOTVVL0NGc05OOEMzOGdpZlplZGRKbENmR0N2?=
 =?utf-8?B?VFo1N0xSOGRoN3IxRFlJT2F3ZHIxTGM2SlhHeGlzMFhsRUpTZmFMTXNoTk5R?=
 =?utf-8?B?MFhkMk15OUk4WmJQWGNFbUcrSllDaDZBUldVK2pORnBZUUh5cEdQY2RmQTFu?=
 =?utf-8?B?dXRJWGgxRjdYbEJkaWhJZTAvSDZ5MzVmVW01dTMvMkZ3aGljTi9YRDFUZldj?=
 =?utf-8?B?NUJRVnZDNC81MzdSV2F0bEF4YTdyazlwYVBQSi9QL1BJMGpIZ3ZXbDdKZEhE?=
 =?utf-8?B?eUJsU3poWG41Q1ppV21ERzRZYjdBakw4TmxveDZVQkdMV2JydUhHUXh6TFQ2?=
 =?utf-8?B?K0RDY0Fna3ZqMEpzOUdRamlyUi9aaytEL0RQWTJVVGRCMXNHb0VFQWpwbjB0?=
 =?utf-8?B?dHVOdkFOM3lpaEZCQ1Vib2NKbTdhRVdQSmdKaU14bTNvVmw1V3ZWQUhodXBX?=
 =?utf-8?B?UDlqakxkN2pXOEVhaUJjMWwxYlFBK0lxQkZJWUloV1hNVko5WFF0Z0grbUNn?=
 =?utf-8?B?VnVCLzV0ajZKeW1Jckt6RVNvWS9OL2U3QmFCa2pkS1l2eFJmUTdxWFdQRkRW?=
 =?utf-8?B?dDhOS2dPYURwZGl4NVEvL3pVNm04dEhuTEwwdDJhbmZ6eXJ0RGVGcmsxM29B?=
 =?utf-8?B?RGJVd0ZyNmthZ01aL3M3OFhnVEpSSGJjanpmOE9tN21hVVhyNjhrR3BWN1pz?=
 =?utf-8?B?RmwrZFZWMmlrQVJDTmdGVVAxKzZTaVorZ1RTbWdzU1NnWjVJYlZud3VzYXlk?=
 =?utf-8?B?YmdxSkZnMUM2UkF3MExtekJHbFY0S1lBdHBhZDBDaGlaTWtoVmJoLzZCckdu?=
 =?utf-8?B?RkNMY0txTXlqK0xsTWVSRzloa05LeU01YzNkMHFCditMRUVJbktFeUtoSlNE?=
 =?utf-8?B?OEo2KzlxSW1taTNjQnVrelhMaVFmZlRxVzFXM1M1WTBLMWZwekk3VjZ5N2ZK?=
 =?utf-8?B?UkJVSk9OSytxS0psSSt1Y0xtR3JOcU9DU3Boa1B6U1hiYWxUb0RRWHZKakZR?=
 =?utf-8?B?cnRpTWZMWXNObnZQc1lXU0pha24wQngzR2YzeGYzNlQrWU1iaGcrMUtYRjFo?=
 =?utf-8?B?dVpjRmxFS0hQVnNPR2xFOW1vZXpzcGZUOVZLRVJmRDEybW5RZlJvL2FLNlR6?=
 =?utf-8?B?WjFoYUtUTXkwNnNwcnNWbzN6N3djZGo5SkJHYnhhTFFSd3dRYTExV21DU1Nv?=
 =?utf-8?B?bE9yVEFXQ0U4TUlqcnRYS2tncFZJY2tMSXBkbFJiWlhLQTVNK0xDNzYzVFcr?=
 =?utf-8?B?dEJMckNxM0pUdHJ0M3BHWDVROXY4aDRndW1VMVg4NHJCWkdmUEJqZkltUkw1?=
 =?utf-8?B?cTV6aUU0dlRYa0h2aDBrcEhQN29VQWVORXRVTFpneGFhVHdEa0NVTk1TaEJE?=
 =?utf-8?B?NnNRSE51MzJDeFkxUGwxRnFmZ1JlNXlHVmd1UjVDUUVyY0l1akVFV0lHYnc3?=
 =?utf-8?B?R3N2WWFSd2cxQjBjUXA4dEdnUW1wL1VBZXhYZnFXN0VUZWhINkRUUUg0bVhj?=
 =?utf-8?Q?052nT/wWQU7RdHyQ=3D?=
X-Exchange-RoutingPolicyChecked: H/V1cNudgAHQT4aMcuGFfj5yHKa0vv982IdCLZJS1Jbj57NpWtWfgPtbBUYSav8C3wvznD5g757e0JwthroW1IfK6NlbZn9YkvChr+uJ7u0NespezEXhfvp00YVQG8dI94zpidepkB9KPHmsKdIHDce3poUERzpNIwAjVnT/RGZB1uTOTMVahS9NdhifXbZ1uh3fsvPez0F24RICxb2pFfIo6o/xKvPVVC+GuhXBiwSPJseoG5Ei3EcRReDAS6LtwbNJZd4QjK1QLMA4sCIl8dmBtBwoQkNpUjlO6wvGvA7uBDJD4VmXzkTCDpp3pW0MUVGuRg3FY6b/JK4kC1RWrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 532d6375-9fd1-4beb-1928-08de9eb5d5f6
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2026 08:21:35.3518 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XPpGF9LZfHeu0r83G+QeN767PCH/F8A7sgpH3igi5rh643VLQbU5hVnRkwS582PgJjs1fhlT8rcBQ7s3bOfXyxL+YLStdT2J2i3BbN2Ufc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
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

Hi S Sebinraj,

[...]

> On the failure path the parent signals SIGCHLD as SIG_IGN to reparent
> the potentially D-state child to init, sends SIGKILL as a best-effort
> wake-up (silently ignored by the kernel when the process is in D-state),
> and calls igt_fail() so the subtest is reported as FAIL cleanly.

If the task is in D-state, maybe aborting would be a better
idea? (thus forcing a reboot in testing environment)
I am wondering about the behavior in our CI. With a hung task
that still processes something/hogs resources, further execution
would be carried out in polluted environment and we may start
getting failures in other tests due to this one being stuck.

[...]

> +static int64_t stress_fence_deadline(void)
> +{
> +	struct timespec ts;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &ts);
This technically may return -1 on error and set errno.

> +	return (int64_t)ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec +
> +		WQ_FENCE_TIMEOUT_NS;
Both tv_sec and tv_nsec should be of type "long" in most cases.
If you really want to case tv_sec to int64_t, then you should
consider casting tv_nsec as well for the sake of completion.

On a side note, you could just cast the whole expression to
int64_t to match the function return and be more explicit.

[...]

> +static void cpumask_stressor_loop(void)
> +{
> +	static const char * const masks[] = { "f", "ff", "fff", "ffff" };
> +	int wq_fd;
> +
> +	wq_fd = open(WQ_CPUMASK_PATH, O_WRONLY);
> +	if (wq_fd < 0)
> +		exit(0);
> +
> +	for (;;) {
> +		for (int i = 0; i < ARRAY_SIZE(masks); i++) {
> +			/* ignore write errors — cpumask rejects invalid masks */
> +			write(wq_fd, masks[i], strlen(masks[i]));
I think you could still check errno and continue only when the
error(s) connected to invalid mask is returned. Otherwise, some
underlying issue may be getting ignored.

> +			usleep(100000); /* 100ms */
> +		}
> +	}
> +	close(wq_fd);
> +}
> +

[...]

> @@ -693,15 +782,66 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>  		}
>  	}
>  
> -	for (i = 0; i < n_exec_queues; i++)
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
> -					NULL));
> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	/*
> +	 * Drain all exec-queue fences.  Under WQ_STRESS use a 5s deadline;
> +	 * a timeout means the workqueue is hung so bail immediately.
> +	 */
This comment should be split:

/*
 * Drain all exec-queue fences.
 */
for (i = 0; i < n_exec_queues; i++) {
        if (flags & WQ_STRESS) {
        /*
         * Under WQ_STRESS use a 5s deadline; a timeout means
         * the workqueue is hung so bail immediately.
         */

> +	for (i = 0; i < n_exec_queues; i++) {
> +		if (flags & WQ_STRESS) {

[...]

> -	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	/*
> +	 * This is the most critical fence under WQ_STRESS: it covers the
> +	 * TLB-invalidation completion triggered by xe_vm_unbind_async().
> +	 * If ttm_bo_delayed_delete() workers are stuck in the workqueue
> +	 * the TLB flush fence will never signal and we will timeout here.
> +	 */
> +	if (flags & WQ_STRESS) {
This comments is explaining stuff only for WQ_STRESS, so put it
in the if body.

> +		if (atomic_load(&wq_stress_hang_detected) ||

[...]

> +wq_stress_cleanup:
>  	syncobj_destroy(fd, sync[0].handle);
>  	for (i = 0; i < n_exec_queues; i++) {
>  		syncobj_destroy(fd, syncobjs[i]);
> +		/*
> +		 * Under WQ_STRESS, if a hang was detected skip all GPU resource
> +		 * teardown calls (xe_exec_queue_destroy, xe_vm_destroy, gem_close).
> +		 * Those ioctls wait for pending GPU work to drain and will hang
> +		 * indefinitely if the workqueue is stuck. The kernel reclaims all
> +		 * GPU resources automatically on process exit.
> +		 */
This comment as well: put it inside the if.

> +		if (flags & WQ_STRESS && atomic_load(&wq_stress_hang_detected))
> +			continue;
> +

[...]

> +	igt_subtest("threads-wq-stress-rebind-bindexecqueue") {
> +		const char * const wq_cpumask_path = WQ_CPUMASK_PATH;
Why not use WQ_CPUMASK_PATH directly in below calls? You never
change the value of wq_cpumask_path.

[...]

> +
> +		/* Belt-and-suspenders: restore cpumask from parent too */
What is belt-and-suspenders in this context?

> +		cfd = open(wq_cpumask_path, O_WRONLY);
> +		if (cfd >= 0) {
> +			write(cfd, orig_cpumask, strlen(orig_cpumask));
> +			close(cfd);
> +		}

[...]

test_legacy_mode() is already 244 lines long before your change
and considering how many if (flags & WQ_STRESS) you had to
include, we might need to look into splitting it into smaller
pieces. (not as part of your patch, but in general)

-- 
Best Regards,
Krzysztof
