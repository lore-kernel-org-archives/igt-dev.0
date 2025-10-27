Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E3CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 06:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0658410E0CE;
	Mon, 27 Oct 2025 06:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTc1ZNf3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C3E10E0CE
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 06:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761544903; x=1793080903;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H/xpZmn9KLHralpbfWhRWVcgv8cDxkeN6fMWGRizz9M=;
 b=jTc1ZNf362IoLE4Hm8UGkMyNUkm6lNpXmOcipwEBQKm4nCp0Dhmu7mDR
 ypU7vTvUl3fKUWstMxcvTqkwYzXFIgRvP7sO8Xt4g6cSU+aGU6PWEWDYi
 1zLQc1wIsLXU4w8kOEd6RXNIBcAuBZyuIUPVF5PKSuntTFTCVV6MbFbrq
 sjxi7LhqgzZLegqwYShefISEjeV48i+SGtTUGBzQB8uohxFbgf1QT50VC
 We3EG3vFMoCN+IlmwSjBRZfiuQqUeGAYhb+0QkENGmpHGi25OOfnO56j5
 P9zcaXE0bo0392T8fO0I3T4IGW52F29ksLOr0PD/Tq/Q9yZNO4McBCNIN g==;
X-CSE-ConnectionGUID: PIX57BqHRXmSOn4iUQihPQ==
X-CSE-MsgGUID: ClpCj/R2S36ArB3JQd+Wow==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="51194758"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="51194758"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 23:01:42 -0700
X-CSE-ConnectionGUID: TaEqpX/jRuuXn/FBk7CMeA==
X-CSE-MsgGUID: wiyH5ywnRPOUM8vfUgR2+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="215855430"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 23:01:42 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:01:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 23:01:42 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:01:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yiDCfWQ36vuBCZvWKTILO2FSlOOP/QAyMUUWwjEO/iFlvmELj1XXnkx2j96TwVL1TDJhofXteM+ePl7mWux80XF/upyhe9AfvAPNg3G1Hlb+fvPrcb/+HwKU+64CbgDkayLFKcLsF5auoe9Tp/6WOfP6g8JJTP6lYjGdvofr6cYASbsSShmpYFA/HBemcqsi3nh9N//Elf3WnL0a9XdOvxnKfu5TOO3xGi5joYmglRTyd5C8yy6cMoTyi5YA3Pv/geQBtmGJ8Y78L23/8tM1qBGjcvd9eplHtJFK6p3Ey8/bIpnfba8i2YiDPzkLDlv+J3+RqoDbxwOaAV0yMKlNUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/xpZmn9KLHralpbfWhRWVcgv8cDxkeN6fMWGRizz9M=;
 b=mRexM43hSbMPKfdx9H7GjYlMjZufrEN+kvOubt8JBKwSY9Th7Aald3vYJZ4DI8tqWtErN0JHsVm7isc/aYL12znl7k7H6ulhwUyrbWSajy+Qubq6jU5Kn9uBoxFB3TzfA1Me+qOzD0AF0shDwFY3wUpHrXsXcqekeq5gdDdakG9tjsdc1lSPeHLlzd+/3N6+t8XGSFYeSx5MnJmlDZ9EzZ4+yeGzziJJe5MmH+YjK8TfhN41Ig61f3F40TJ8e5EDE4th5Wtl8sPtPx0lyMevPQG/ghMOICCOOTiQ0Y1+p07wk8oq2RFqK6Nz370E+mKxVICo7Yu6cZeUo4spLbCCUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 06:01:30 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 06:01:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Deak, Imre"
 <imre.deak@intel.com>, "Murthy, Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t 5/6] tests/intel/kms_linktrain_fallback: extend test
 for eDP connector
Thread-Topic: [PATCH i-g-t 5/6] tests/intel/kms_linktrain_fallback: extend
 test for eDP connector
Thread-Index: AQHcPbrb/m9huiV1TUqcEk5KqmtYwrTVkqrQ
Date: Mon, 27 Oct 2025 06:01:30 +0000
Message-ID: <DM4PR11MB631208E0123520D50D798BFB90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251015101759.3982477-1-kunal1.joshi@intel.com>
 <20251015101759.3982477-6-kunal1.joshi@intel.com>
In-Reply-To: <20251015101759.3982477-6-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6404:EE_
x-ms-office365-filtering-correlation-id: 1252b8ba-314d-419f-7178-08de151e4643
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MGtEUWRLVlpkbXRXS0dBdmpKZkdHQnNqekY3cjlQUFhha1NKS2R3T2lQbWN4?=
 =?utf-8?B?SmFpL3RnRWZSUW9LaG9QbmVJY01BS1ArOFdSRS8vUUxjK0dia21BV3QxUUk5?=
 =?utf-8?B?RHBiVmRNYy9tbi83WG5mMGZNVzBmSFdXTmdrai9ZU0gxZDBvc3lHdkpEcE5j?=
 =?utf-8?B?MGNnUzlQaFpLMXYwMTdkNlRPeURCdXhsNlZGSUN5UW5oWUlrT21GSTJwL0tQ?=
 =?utf-8?B?c2dMVnpUa0pQR2pBZVBLaktzZXpkS3lkRGhqN2ZZbzJyUzZvQmYrS0E2MHhl?=
 =?utf-8?B?MVppRUNka2ZlK3dJdFFUN1JZN2JUMlZtQ1Q3Wk9BNGdhZDUrUkRlMEtzclhG?=
 =?utf-8?B?YUxTazZ4MW9TcUtwS0c2UjhFd3hEY0ZVdytTVGVwanNBNnFsRlk2ek81QnVO?=
 =?utf-8?B?THBSTXFlZ3FMSTJ4QUlUYldqaDk0WG1WSGlIM1pJL2VzOEVDT1ByeUlYUXk5?=
 =?utf-8?B?aHBUOS9aZit4MHZxMEtPNnhwV1p6cTJOekwyaWhlSUpRK3B4WGJXc3U2MTJv?=
 =?utf-8?B?dGdOaTRqYUlycUEwT29qZzJlRldWRnllaFltYS83YzBXVlBXVFFEaDQrdHda?=
 =?utf-8?B?WDZycU1uVGRoN2dmeWdrZ3dMZzBVQXFhVk5RcDRwbHdXR3pLUTRIL1UxblBj?=
 =?utf-8?B?S1c4QW9uenBDLytONlpaQWxFcEtndEcvNHd4WFNnanUrTjF1Wnc2M0hwK2hh?=
 =?utf-8?B?RFoxTkxEK2U3elFNV3ZwS2xuNVg5VWVjZThkZGFPWm1IVlZZV1ljTTJlUjBS?=
 =?utf-8?B?NDI4Z2IxMzM2Lyswem5xczgxaEJ4ZUZzanFMWllpU0tZc0VESS94WjN2TXFD?=
 =?utf-8?B?a0NkaW5aRzAvTlJSQ1BkamRoMVhwd1IxZG9NbkNLSlJ1VFozZjZZSGQwRDZ3?=
 =?utf-8?B?WHRrZnQ4aXQzc2JSaDkwVnBMVEEzUHphSExGSkNrQ2ZiOHgrV3AvcDlMcG5M?=
 =?utf-8?B?bU9Yc21pR2FLMng2ZnhsMlNDUzVkc2dKdTYwbDRHY3VOSVFzbmc5SmlpVlJ4?=
 =?utf-8?B?bkR5TUo2dk5BSG4rMUhZbWdiakZmL3FtbTRqNzFnbXhPa0JUWFg0R2pDQTZI?=
 =?utf-8?B?cjdqd1JYS0o5bVh2SHlvNEswY1RJSHJlcWJRU2xqckZITEFNbkN6dmVLMDg2?=
 =?utf-8?B?QW9ub0FxR0pkWFJZditGQ3IwdXZEb3hPUEo5N3Y4TkxFdkhWa0FBVmNwMkcw?=
 =?utf-8?B?NWxjUmJyOHhvUXZXTkpHR3RUZitOcG1tOGpueTNhZzJTUXZaYzhicWdkQXBR?=
 =?utf-8?B?akExcXdKMG8rejE0aHlDRVRpUjZJcFRNWGQ5WlhpUkNncGsxd2k4a2lGOEtY?=
 =?utf-8?B?aFVvdGp6MWdUNG9FcVo2dXpHS2hlaDJjcnJ3VXI1ME5XODZpUkFyTGorempq?=
 =?utf-8?B?WllKd2VtS0RzSDh5SkFBMWdLazBmUGE4OWtRK2hlYUs5Umhob0JjNTZxU1JP?=
 =?utf-8?B?S0xCY1JNZW1zNlVUelE3bWRwRlpYcm5jRW1hRTVZR3ZFYXVOUGQrckdQTFl2?=
 =?utf-8?B?S0lncUlYd2tsVEoybDRXVk82YXpuVEFaQmc0YmhWaXE4NDM1YmRQMURxNlVa?=
 =?utf-8?B?aVdwMTFzMWVWdGFJSTYwSWtSRVBxbUk0a09EVDdFUmdKZlVjN2xwRVlDelFm?=
 =?utf-8?B?NWhJNTQ5ZkIwT0gxQVZHZUdMSjRsdjNDSktYaGlOM3hUNDFaVTdPWHdTb3Fn?=
 =?utf-8?B?VG8vaDlJN1lNK0t4S2lDUDJ4NzFyTVJrSDVqU2tpaVNqTC8zTk9jRHlGZ0Jw?=
 =?utf-8?B?QmJXOGQwWWd3Wjl5bG9jOTZ2OXNJeW8rVUplRlc2NERLazZFZTZSMEtTYlI0?=
 =?utf-8?B?U0dtTk51OXc4a3NldEM0azZtamNCR2JmemdQWVVSQWEwZDRvdXo2Qmtrd0Mw?=
 =?utf-8?B?SElVNWRJTGNkRUN3aVJnbHNKeXI5U2J6eTV1QTVkdWZjQkxMVGRWRmUvWFAz?=
 =?utf-8?B?Q04wSDJUNnlxVlNXVlZKZTlwS2hjRXpmK09OQmhnUzd3cDE5SzJ1UUFpR0Q1?=
 =?utf-8?B?bTF5Z09zaGRyQ0xYZnY0U1pYMlQzVTdlbUU0L1k4REJHbE9QSFpIV292Ym9a?=
 =?utf-8?Q?Z94yDC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VjJ5Y3U0bnlKTUozMy9Ic0tnS21sbUlCcDVzUFl2MWhZeWZKTXFSODl3YzRQ?=
 =?utf-8?B?a0tyTEUwQittcVZ6UVFIeE1ycWNXdzllUWovampYUTNmckh3KzREQXRxdjRK?=
 =?utf-8?B?R2tyN0dCeE5GWXduZm1HRW1mdlRQSUVTVDJqZzkvYUNlUzNwNFc0MU1rYi9M?=
 =?utf-8?B?ZjNNckd2RzZENlBkKzMyY0s2S3BOVENsQzkrd01YaW9oYkJsMFBFOEVVR1B2?=
 =?utf-8?B?TkxDUjVnRStOQUdUc3NPK0d5RHNidjNORFZTK1NBckdEUnd1UXN2NTVtbzJs?=
 =?utf-8?B?ZkV6M1dkcTZ1Nk1JNU9HaHFCZ3BoMFJjWlFDeVdxOTNQaG11VGpjbEF3b0w2?=
 =?utf-8?B?SmdnUjdvRTV2MHRlRk9DRFhuRzRwTDdUYUR3eDBmNkcxL1Ewd3FaTGpYUHpM?=
 =?utf-8?B?Umppdkl0UnUxb0JuQXNtME5HYUdEUU13aytsTGdudVY3WHpyNlFsRDM2Z1ZJ?=
 =?utf-8?B?UmNiV01GTmNCeWpyeXVDcU56aWV2WjluR05VcGc0YkxlU3krZ2VtV3ArRTVW?=
 =?utf-8?B?SHc4VXZsQVo0NWRZSi81Z05rZ0o5T2huT2N0V2Rady9SUi8yOEovbU5kY0Zo?=
 =?utf-8?B?Zm5VNlp5VGpRVUtRVUx3aXJHVDlPY3lkZ1BEczFXd1VaQjlqbGd1ZzlkTDh1?=
 =?utf-8?B?dDBjTm4vaXMzWXYzS3hhdmttQyt6Sm1na2l4cVpiV0VEUElNWUxQVzlENDhO?=
 =?utf-8?B?NzczejdvQmJnSXdVSUk2Q29EeFRObVRKNmhFUFpoQjNZTlhQcm11RDNKU3lV?=
 =?utf-8?B?aGthWlhQeVJsMHpBcm0wNFlJK3I1NHRsN3lWT2JEOVRjMml4VkNWK0pZVTlO?=
 =?utf-8?B?T0xXTFMxUHVodkVxR2xkSUhSRmR6UENQM1lvOVlVNTlaVG1FOEM4QXJaaWF2?=
 =?utf-8?B?L1lRUTJ6MGxkWlBJeU5LTitEb2ZKQ1MrR2Z6alY5dGVFbTQyM1c1dlVwazI0?=
 =?utf-8?B?RjVkNXNzVFRjZWRWL3orL0cwOWhjcFowa3RmM2Fnc0kvcUtydjFRd0pMazZp?=
 =?utf-8?B?MlpmekJ5MkZwbVVHUXBIM2IzQzVIcUlEWE5aTXlORkpJb0JqeTJKZitVL0gw?=
 =?utf-8?B?Z2w1Q3pSZjJIYmUyK2hoVnhrZkduV053TjRsYUZXUGl4WGVRTm5Kckhqc2NP?=
 =?utf-8?B?VG4zbW80WEh3WnV6T3Mza04yN2lzbjA0UitwclJxNGVYNGZLejMycWo5c2ZX?=
 =?utf-8?B?SzRjaTR1ZHgvUDgxUElHK2RkM2htcGlQWVU3VTE4Mitta3VqOHdUSndzaFB6?=
 =?utf-8?B?cTFKQ1F4M2JRZkwwOWJVWDFTa1ByTjBSQ1JJV3lNdVczc3AxMGxjZ1BXQlpo?=
 =?utf-8?B?T3hTcU4vT2tMY2NDMlFRdjAyWmtCeE1JUnpTYkh5RUdEdXVOWHpjYytoWVRC?=
 =?utf-8?B?SXJ3REZ5VzdKNFJ1eGdnbERJbzVndGx5MTBIelkwTlQydDhEZ0xGcFVIWkVR?=
 =?utf-8?B?Mk5rTFU4YXA5RjRHekJLa3RSakVvcTZWelk4WGRpQktSMGtvME5nZVlyV0dr?=
 =?utf-8?B?dnl5RUNLUk5saUVuU05FL3JkZDRXcHhiSzlrbDRldnh0M2l4NEp1NDV4Y0p5?=
 =?utf-8?B?YnhZd01CNGZ3U3RMSU5OM2Y3enczWUg0Z3h4UXdueXIxNDNLdDJuYTU1eit0?=
 =?utf-8?B?Q29ncjV3Wm9uZFZkOVVZZkNOVWpQK3VYNUk4Y2tPUFVsZFRRTjVTZ3Y5L3lZ?=
 =?utf-8?B?RlIrRG9pSGtrZG9SOXQ1Z1lycWFVN1ZvNG1EZURxN1FCWlRYS0FKcTd6UElo?=
 =?utf-8?B?ck5QQVFVRmlOelRYQkY0djk4Qm56b05sdzFFMG5uTkhucUVhRzZETjJ1WTRk?=
 =?utf-8?B?VGdiT0Zuc2RuU0tZVjF4WVE0eEJzWjhZL2Y5MTZtWGZSK25IWHkzbFNiTUd6?=
 =?utf-8?B?SmhSbW5aRTN6L0laLy9GemNWSytGejltendnUWJWNW1EQjdTTXUxaGxoTVZW?=
 =?utf-8?B?Ryt5ZVBwT1prSkI3b2RvRC9GMWlPb00xSUhocllwZ2JCOHdjMXVvZEZuaWFw?=
 =?utf-8?B?dithZ21CWmtURm5Td2Nsc0tLNXRCZ2J1RUovSEtSR1FPV0M2ZGFJRVcvNlZK?=
 =?utf-8?B?YmNGeGVaWjREYVBlMnJRM29GZ0ZyVnk0MHNRRzZrNko5V1dQdDhZWitpb0ZP?=
 =?utf-8?Q?YYVs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1252b8ba-314d-419f-7178-08de151e4643
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 06:01:30.5173 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tJZeIoJMygwQpdCFZUFfqRYvDY8806xsa1q+kpadh0IQprxSmvgY5hZUpMRo/5yQgG3PUgBO/4CYWcLyYNmLGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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

TEdUTS4gDQoNClJldmlld2VkLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KDQo+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGlndC1kZXYtYm91
bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBLdW5hbCBKb3NoaQ0KPiBT
ZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMTUsIDIwMjUgMzo0OCBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEpvc2hpLCBLdW5hbDEgPGt1bmFsMS5qb3NoaUBp
bnRlbC5jb20+OyBEZWFrLCBJbXJlIDxpbXJlLmRlYWtAaW50ZWwuY29tPjsNCj4gTXVydGh5LCBB
cnVuIFIgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQg
NS82XSB0ZXN0cy9pbnRlbC9rbXNfbGlua3RyYWluX2ZhbGxiYWNrOiBleHRlbmQgdGVzdCBmb3Ig
ZURQDQo+IGNvbm5lY3Rvcg0KPiANCj4gUmVuYW1lIGRwLWZhbGxiYWNrIHN1YnRlc3QgbmFtZSB0
byBsdC1mYWxsYmFjayBhbmQgYWRkIGFkZGl0aW9uYWwgbG9naWMgaW4NCj4gdGVzdF9mYWxsYmFj
ayB0byBoYW5kbGUgZURQIGZhbGxiYWNrLg0KPiANCj4gSW4gZURQIGZhbGxiYWNrIG9uIHRoZSBp
bml0aWFsIGxpbmsgdHJhaW5pbmcgZmFpbHVyZSBleHBlY3RhdGlvbiBpcyB0byByZXRyeSB3aXRo
IG1heA0KPiBsaW5rIHJhdGUgYW5kIG1heCBsYW5lIGNvdW50IHRoYXQgaXMgc3VwcG9ydGVkLCBG
dXJ0aGVyIGZhaWx1cmVzIGxlYWRzIHRvIHJlZHVjdGlvbg0KPiBpbiBlaXRoZXIgbGluayByYXRl
IG9yIGxhbmUgY291bnQuDQo+IA0KPiB2MjogdXNlIGhlbHBlciBmb3IgZURQL0RQIGNoZWNrIChK
ZWV2YW4pDQo+IA0KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPg0KPiBDYzog
QXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IEt1bmFsIEpvc2hpIDxrdW5hbDEuam9zaGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2lu
dGVsL2ttc19saW5rdHJhaW5fZmFsbGJhY2suYyB8IDQzICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfbGlua3RyYWluX2ZhbGxiYWNr
LmMNCj4gYi90ZXN0cy9pbnRlbC9rbXNfbGlua3RyYWluX2ZhbGxiYWNrLmMNCj4gaW5kZXggZmE1
ODk5OWU4Li5iNzRjNWEwNTkgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19saW5rdHJh
aW5fZmFsbGJhY2suYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfbGlua3RyYWluX2ZhbGxiYWNr
LmMNCj4gQEAgLTE4LDggKzE4LDggQEANCj4gICNpbmNsdWRlICJrbXNfZHNjX2hlbHBlci5oIg0K
PiANCj4gIC8qKg0KPiAtICogU1VCVEVTVDogZHAtZmFsbGJhY2sNCj4gLSAqIERlc2NyaXB0aW9u
OiBUZXN0IGZhbGxiYWNrIG9uIERQIGNvbm5lY3RvcnMNCj4gKyAqIFNVQlRFU1Q6IGx0LWZhbGxi
YWNrDQo+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCBMaW5rIFRyYWluaW5nIGZhbGxiYWNrIG9uIERQ
L2VEUCBjb25uZWN0b3JzDQo+ICAgKg0KPiAgICogU1VCVEVTVDogZHNjLWZhbGxiYWNrDQo+ICAg
KiBEZXNjcmlwdGlvbjogVGVzdCBmYWxsYmFjayB0byBEU0Mgd2hlbiBCVyBpc24ndCBzdWZmaWNp
ZW50IEBAIC0zMzYsMTENCj4gKzMzNiwxMiBAQCBzdGF0aWMgYm9vbCBmaXhfbGlua19zdGF0dXNf
YW5kX3JlY29tbWl0KGRhdGFfdCAqZGF0YSwNCj4gIAlyZXR1cm4gdHJ1ZTsNCj4gIH0NCj4gDQo+
IC1zdGF0aWMgdm9pZCB0ZXN0X2ZhbGxiYWNrKGRhdGFfdCAqZGF0YSwgYm9vbCBpc19tc3QpDQo+
ICtzdGF0aWMgdm9pZCB0ZXN0X2ZhbGxiYWNrKGRhdGFfdCAqZGF0YSwgYm9vbCBpc19tc3QsIGJv
b2wgaXNfZWRwKQ0KPiAgew0KPiAgCWludCBvdXRwdXRfY291bnQsIHJldHJpZXM7DQo+ICAJaW50
IG1heF9saW5rX3JhdGUsIGN1cnJfbGlua19yYXRlLCBwcmV2X2xpbmtfcmF0ZTsNCj4gIAlpbnQg
bWF4X2xhbmVfY291bnQsIGN1cnJfbGFuZV9jb3VudCwgcHJldl9sYW5lX2NvdW50Ow0KPiArCWlu
dCBpdGVyID0gMDsNCj4gIAlpZ3Rfb3V0cHV0X3QgKm91dHB1dHNbSUdUX01BWF9QSVBFU107DQo+
ICAJZHJtTW9kZU1vZGVJbmZvICogbW9kZXNbSUdUX01BWF9QSVBFU107DQo+ICAJc3RydWN0IGln
dF9mYiBmYnNbSUdUX01BWF9QSVBFU107DQo+IEBAIC0zNjUsNiArMzY2LDcgQEAgc3RhdGljIHZv
aWQgdGVzdF9mYWxsYmFjayhkYXRhX3QgKmRhdGEsIGJvb2wgaXNfbXN0KQ0KPiANCj4gIAl3aGls
ZSAoIWlndF9nZXRfZHBfbGlua19yZXRyYWluX2Rpc2FibGVkKGRhdGEtPmRybV9mZCwNCj4gIAkJ
CQkJCSBkYXRhLT5vdXRwdXQpKSB7DQo+ICsJCWl0ZXIrKzsNCj4gIAkJaWd0X2luZm8oIkN1cnJl
bnQgbGluayByYXRlOiAlZCwgQ3VycmVudCBsYW5lIGNvdW50OiAlZFxuIiwNCj4gIAkJCSBwcmV2
X2xpbmtfcmF0ZSwNCj4gIAkJCSBwcmV2X2xhbmVfY291bnQpOw0KPiBAQCAtNDAwLDEwICs0MDIs
MTkgQEAgc3RhdGljIHZvaWQgdGVzdF9mYWxsYmFjayhkYXRhX3QgKmRhdGEsIGJvb2wgaXNfbXN0
KQ0KPiAgCQljdXJyX2xpbmtfcmF0ZSA9IGlndF9nZXRfY3VycmVudF9saW5rX3JhdGUoZGF0YS0+
ZHJtX2ZkLCBkYXRhLQ0KPiA+b3V0cHV0KTsNCj4gIAkJY3Vycl9sYW5lX2NvdW50ID0gaWd0X2dl
dF9jdXJyZW50X2xhbmVfY291bnQoZGF0YS0+ZHJtX2ZkLA0KPiBkYXRhLT5vdXRwdXQpOw0KPiAN
Cj4gLQkJaWd0X2Fzc2VydF9mKChjdXJyX2xpbmtfcmF0ZSA8IHByZXZfbGlua19yYXRlIHx8DQo+
IC0JCQkgICAgIGN1cnJfbGFuZV9jb3VudCA8IHByZXZfbGFuZV9jb3VudCkgfHwNCj4gLQkJCSAg
ICAgKChjdXJyX2xpbmtfcmF0ZSA9PSBtYXhfbGlua19yYXRlICYmDQo+IGN1cnJfbGFuZV9jb3Vu
dCA9PSBtYXhfbGFuZV9jb3VudCkgJiYgLS1yZXRyaWVzKSwNCj4gLQkJCSAgICAgIkZhbGxiYWNr
IHVuc3VjY2Vzc2Z1bFxuIik7DQo+ICsJCWlmIChpc19lZHAgJiYgaXRlciA9PSAxKSB7DQo+ICsJ
CQkvKiBlRFAgZmlyc3QgcmV0cnkgbXVzdCBzdGF5IGF0IG1heCwgbm8gcmVkdWN0aW9uICovDQo+
ICsJCQlpZ3RfYXNzZXJ0X2VxKGN1cnJfbGlua19yYXRlLCAgcHJldl9saW5rX3JhdGUpOw0KPiAr
CQkJaWd0X2Fzc2VydF9lcShjdXJyX2xhbmVfY291bnQsIHByZXZfbGFuZV9jb3VudCk7DQo+ICsJ
CX0gZWxzZSB7DQo+ICsJCQkvKiBPdGhlcndpc2UgRFDigJBzdHlsZSBmYWxsYmFjazogZWl0aGVy
IHNocmluayBvciBhbGxvdw0KPiBzcHVyaW91cyByZXRyeSAqLw0KPiArCQkJaWd0X2Fzc2VydF9m
KChjdXJyX2xpbmtfcmF0ZSAgPCBwcmV2X2xpbmtfcmF0ZSB8fA0KPiArCQkJCSAgICAgY3Vycl9s
YW5lX2NvdW50IDwgcHJldl9sYW5lX2NvdW50KSB8fA0KPiArCQkJCSAgICAgKChjdXJyX2xpbmtf
cmF0ZSAgPT0gbWF4X2xpbmtfcmF0ZSAmJg0KPiArCQkJCSAgICAgY3Vycl9sYW5lX2NvdW50ID09
IG1heF9sYW5lX2NvdW50KSAmJg0KPiArCQkJCSAgICAgLS1yZXRyaWVzKSwNCj4gKwkJCQkgICAg
IkZhbGxiYWNrIHVuc3VjY2Vzc2Z1bFxuIik7DQo+ICsJCX0NCj4gDQo+ICAJCXByZXZfbGlua19y
YXRlID0gY3Vycl9saW5rX3JhdGU7DQo+ICAJCXByZXZfbGFuZV9jb3VudCA9IGN1cnJfbGFuZV9j
b3VudDsNCj4gQEAgLTQxMywxMCArNDI0LDEyIEBAIHN0YXRpYyB2b2lkIHRlc3RfZmFsbGJhY2so
ZGF0YV90ICpkYXRhLCBib29sIGlzX21zdCkNCj4gc3RhdGljIGJvb2wgcnVuX2x0X2ZhbGxiYWNr
X3Rlc3QoZGF0YV90ICpkYXRhKSAgew0KPiAgCWJvb2wgcmFuID0gZmFsc2U7DQo+ICsJYm9vbCBp
c19lZHAgPSBmYWxzZTsNCj4gIAlpZ3Rfb3V0cHV0X3QgKm91dHB1dDsNCj4gDQo+ICAJZm9yX2Vh
Y2hfY29ubmVjdGVkX291dHB1dCgmZGF0YS0+ZGlzcGxheSwgb3V0cHV0KSB7DQo+ICAJCWRhdGEt
Pm91dHB1dCA9IG91dHB1dDsNCj4gKwkJaXNfZWRwID0gb3V0cHV0LT5jb25maWcuY29ubmVjdG9y
LT5jb25uZWN0b3JfdHlwZSA9PQ0KPiArRFJNX01PREVfQ09OTkVDVE9SX2VEUDsNCj4gDQo+ICAJ
CWlmICghaWd0X2hhc19mb3JjZV9saW5rX3RyYWluaW5nX2ZhaWx1cmVfZGVidWdmcyhkYXRhLT5k
cm1fZmQsDQo+ICAJCQkJCQkJCSBkYXRhLQ0KPiA+b3V0cHV0KSkgew0KPiBAQCAtNDI1LDkgKzQz
OCw5IEBAIHN0YXRpYyBib29sIHJ1bl9sdF9mYWxsYmFja190ZXN0KGRhdGFfdCAqZGF0YSkNCj4g
IAkJCWNvbnRpbnVlOw0KPiAgCQl9DQo+IA0KPiAtCQlpZiAob3V0cHV0LT5jb25maWcuY29ubmVj
dG9yLT5jb25uZWN0b3JfdHlwZSAhPQ0KPiBEUk1fTU9ERV9DT05ORUNUT1JfRGlzcGxheVBvcnQp
IHsNCj4gLQkJCWlndF9pbmZvKCJTa2lwcGluZyBvdXRwdXQgJXMgYXMgaXQncyBub3QgRFBcbiIs
IG91dHB1dC0NCj4gPm5hbWUpOw0KPiAtCQkJCWNvbnRpbnVlOw0KPiArCQlpZiAoIWlndF9vdXRw
dXRfaXNfZHBfZmFtaWx5KGRhdGEtPm91dHB1dCkpIHsNCj4gKwkJCWlndF9pbmZvKCJTa2lwcGlu
ZyBvdXRwdXQgJXMgYXMgaXQncyBub3QgRFAvZURQXG4iLA0KPiBvdXRwdXQtPm5hbWUpOw0KPiAr
CQkJY29udGludWU7DQo+ICAJCX0NCj4gDQo+ICAJCXJhbiA9IHRydWU7DQo+IEBAIC00MzgsMTEg
KzQ1MSwxMiBAQCBzdGF0aWMgYm9vbCBydW5fbHRfZmFsbGJhY2tfdGVzdChkYXRhX3QgKmRhdGEp
DQo+ICAJCWlmIChpZ3RfY2hlY2tfb3V0cHV0X2lzX2RwX21zdChkYXRhLT5vdXRwdXQpKSB7DQo+
ICAJCQlpZ3RfaW5mbygiVGVzdGluZyBNU1Qgb3V0cHV0ICVzXG4iLA0KPiAgCQkJCSBpZ3Rfb3V0
cHV0X25hbWUoZGF0YS0+b3V0cHV0KSk7DQo+IC0JCQl0ZXN0X2ZhbGxiYWNrKGRhdGEsIHRydWUp
Ow0KPiArCQkJdGVzdF9mYWxsYmFjayhkYXRhLCB0cnVlLCBmYWxzZSk7DQo+ICAJCX0gZWxzZSB7
DQo+IC0JCQlpZ3RfaW5mbygiVGVzdGluZyBEUCBvdXRwdXQgJXNcbiIsDQo+ICsJCQlpZ3RfaW5m
bygiVGVzdGluZyAlcyBvdXRwdXQgJXNcbiIsDQo+ICsJCQkJIGlzX2VkcCA/ICJlRFAiIDogIkRQ
IiwNCj4gIAkJCQkgaWd0X291dHB1dF9uYW1lKGRhdGEtPm91dHB1dCkpOw0KPiAtCQkJdGVzdF9m
YWxsYmFjayhkYXRhLCBmYWxzZSk7DQo+ICsJCQl0ZXN0X2ZhbGxiYWNrKGRhdGEsIGZhbHNlLCBp
c19lZHApOw0KPiAgCQl9DQo+ICAJfQ0KPiAgCXJldHVybiByYW47DQo+IEBAIC01MTEsNyArNTI1
LDYgQEAgc3RhdGljIHZvaWQgdGVzdF9kc2Nfc3N0X2ZhbGxiYWNrKGRhdGFfdCAqZGF0YSkNCj4g
IAkvKiBSZXBlYXRlZGx5IGZvcmNlIGxpbmsgZmFpbHVyZSB1bnRpbCBEU0MgaXMgcmVxdWlyZWQg
KG9yIGxpbmsgaXMgZGlzYWJsZWQpICovDQo+ICAJd2hpbGUgKCFpZ3RfZ2V0X2RwX2xpbmtfcmV0
cmFpbl9kaXNhYmxlZChkYXRhLT5kcm1fZmQsIGRhdGEtPm91dHB1dCkpIHsNCj4gIAkJbW9uID0g
aWd0X3dhdGNoX3VldmVudHMoKTsNCj4gLQ0KPiAgCQlpZ3RfYXNzZXJ0X2YoZm9yY2VfZmFpbHVy
ZV9hbmRfd2FpdChkYXRhLCBkYXRhLT5vdXRwdXQsDQo+IA0KPiBMVF9GQUlMVVJFX1JFRFVDRURf
Q0FQUywNCj4gIAkJCQkJCSAgICBSRVRSQUlOX0NPVU5ULCAxLjAsIDIwLjApLA0KPiBAQCAtNjE2
LDcgKzYyOSw3IEBAIGlndF9tYWluDQo+ICAJCQkgICAgICJVbmFibGUgdG8gZGlzYWJsZSBpZ25v
cmUgbG9uZyBocGRcbiIpOw0KPiAgCX0NCj4gDQo+IC0JaWd0X3N1YnRlc3QoImRwLWZhbGxiYWNr
Iikgew0KPiArCWlndF9zdWJ0ZXN0KCJsdC1mYWxsYmFjayIpIHsNCj4gIAkJaWd0X3JlcXVpcmVf
ZihydW5fbHRfZmFsbGJhY2tfdGVzdCgmZGF0YSksDQo+ICAJCQkgICAgICAiU2tpcHBpbmcgdGVz
dCBhcyBubyBvdXRwdXQgZm91bmQgb3Igbm9uZSBzdXBwb3J0cw0KPiBmYWxsYmFja1xuIik7DQo+
ICAJfQ0KPiAtLQ0KPiAyLjI1LjENCg0K
