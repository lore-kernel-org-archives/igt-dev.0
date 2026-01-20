Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D838D26292
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 19:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4BE10E153;
	Tue, 20 Jan 2026 19:32:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHdBOZEl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0168C10E153
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 19:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768937536; x=1800473536;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X7rTiWWoPXTAfbgNlDZv6L4tOmhlybNh6S4CWBwNHuc=;
 b=gHdBOZElArME8p/UPp2dYaFuv6hWtos3LlMQI88R3AdFa0aFQJNF40dO
 GkIg+npCQl56F4aCPJA/EfTcp8XQkM+mX7rtUHmc20vasgvc7ybqw+vmv
 jF5SZwVrZVr3pSZ9rG81cEFbS5+/nh+UdlhMq873ay3qdVpVReYwYEtCq
 uU2W/8kvwwcVpDvnQMckVTjZVzuIEwa6bU42g8kVx+u0wmJNU/b3nES2+
 KZrbbBFGNlP2b3yGiEBcQ8t96+vDOto+uwLimz3pI44N+//77/7DR061f
 s+A2js02F6Q2HAPSb5XNzSuLU/hc/GwcUvDlBexl5b+eaStk7JYDn7oUu Q==;
X-CSE-ConnectionGUID: hnJtugmnQC6qdX8QvG+r3A==
X-CSE-MsgGUID: 0YcqNGbyR0ag3a/CqyHIww==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="69888683"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="69888683"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 11:32:11 -0800
X-CSE-ConnectionGUID: hePQEoMIT8OXQ7FvpYaRpA==
X-CSE-MsgGUID: hv9JayRpQIKtQ+x5t4WseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="229164852"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 11:32:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 11:32:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 20 Jan 2026 11:32:09 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 20 Jan 2026 11:32:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moBu/KOndjbglnuwQmWine9f5kvG3j07MvVpV9NlfG1IgvmIiQ4YGRl9RHdWTcLl5i3dS9NncMwVI5T5pgGHelUmKqf7ii5nN8C+TjZMvUB/P+lJW9fSQpTHABFloeMZ5lodykJM8gz7cfmrMrCDJ+PPRiofeqJxqLCljRbEFw7qRtsqSkWTaoCaBxvZd/Amxa2vWKuyQiaiuHZ1ISUFio9wG56+3/NqgdKJ7Ef3fKa3Pap5McWIPpwNsuvyyQZiNd3sf5Cq4iwS6icGtKStHQHuU3obUGSZXW2HzxyvMqhLVx7hs4P+7vNSguxIH5lsKvWqtEUgB2KAvUHWJeZQwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7rTiWWoPXTAfbgNlDZv6L4tOmhlybNh6S4CWBwNHuc=;
 b=v8I9xXYmxMCF1FFnoBjpNWj+KSHjZNBDfvOrB73DM+xmWjjw8J473xqAFMY4yPtrkFre54xU8j5Ijo+QjXY9W7PnCZIm7ckZY5iWEydNbSDXuOjModqXXD/Uvjyi2ZhUXe+0HcPdYhoIelx4/tJQC/OooMum+G/pyMm9inzIemEYMJ7VMiN5GHtvDGG/x9SHjxSOsPu3YCZDs8nbRWiMz0JMxKO1Qn2kyQYV6V8IC7oUhA3u5c78Iy8HbrRovi5usWnXCnmbkIkaEfXBcYkbJCelyuz4y2GM4GzmrePg0IeHTsLlnm+7uMvONG8SKBmyM/GoKJ6BpE5ObyV9RKLulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB7180.namprd11.prod.outlook.com (2603:10b6:610:148::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 19:32:06 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 19:32:06 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 5/5] lib/xe/xe_legacy: Simplify base_addr in reuse loop
Thread-Topic: [PATCH 5/5] lib/xe/xe_legacy: Simplify base_addr in reuse loop
Thread-Index: AQHch0UT4IOscPm7N0WdoAIbzYTWjrVbP1WAgAA2+0A=
Date: Tue, 20 Jan 2026 19:32:06 +0000
Message-ID: <DM4PR11MB5456E2ABC4DEA7F0097265C0EA89A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260115222938.330490-1-shuicheng.lin@intel.com>
 <20260117000456.26207-1-shuicheng.lin@intel.com>
 <20260117000456.26207-6-shuicheng.lin@intel.com>
 <20260120160755.mi3w3o5ms7grwc4j@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260120160755.mi3w3o5ms7grwc4j@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB7180:EE_
x-ms-office365-filtering-correlation-id: a9d02479-6223-43bb-c3d3-08de585a98cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZUJweHVNaDlVbDNqMzJnazV3WmNRNzVkdVZtV0Zmdm9BSnBsdHNMRHRQTHFh?=
 =?utf-8?B?MEJvM1FzV3BOTXVXWXA4L21oQjR6WEZzSHp6ODRaTEphaW5Va1dPWWdRUnZk?=
 =?utf-8?B?ZkloQXlzZ1g3T0FWVHVrWThqRW9mZlNsNDRRcUlGWHdjajZIcm5GR2t0Mnhq?=
 =?utf-8?B?UUZGUHc4NTdWd3dIbWFzS25jb0FsZWJBS2tCbXlkUDBiY2hTc3lueC9WVWJ4?=
 =?utf-8?B?bmgxSVpuRVBaa2dyRXd6amJnQXN3WFBrNHRRNDVZSytweHZqNElKY3V6N2JP?=
 =?utf-8?B?ZHR2eGd6QmFFY05jV0gyZzJaMVNVazhLQnRFTlFWUGpKenNsbUVqN0JibmVD?=
 =?utf-8?B?UmlMTTBycXlhTUptNElaSk9LbVVFdzQ0Q0N5WkdQT0lSYmFLTVFMMXNDYWR0?=
 =?utf-8?B?U014dnFOeEZBcS82WjIwTlRKdXlCbkIxQmhlQmZFZnhLdHBSdlJCRDU4WWFS?=
 =?utf-8?B?Vm41cmpnV2Z2N0JoZUNKRTFucFZLQktSSFZQM0hUZkFaNFBpbC9YYU51eGR2?=
 =?utf-8?B?ZXRhUE90VzRRajB0a3FSYy96N0JmTWpCNFAwUzA2TGFMUVUzbm83bWhRTy8r?=
 =?utf-8?B?cWJNcUV4Q1dQMDlnMTZES0xzTHg2UCtaTktLYWI3TWJzMlNKTW9wQzM4Vjhl?=
 =?utf-8?B?enpWb3ZkbE9ZOHJaTGZEYzhaOGk5aWpsTDNjbUlwRlhyVXUwZ3hZdnFqczl3?=
 =?utf-8?B?QjEyRHg3QkFRN3hSTWZlNjI4b2RiUGtTU0NiUXMvMElJZTVTVkNQRE5iZ1lC?=
 =?utf-8?B?ZjY1SG0wZ1VXTHArUjFZQi9mb09ycUlwUk5RamVEblF1Z211VXZxdDlBZkFI?=
 =?utf-8?B?QUM2UlprNlNWajN6dTcvRDAzVFFkT2ovTDUvemZwNENjRlJ0YmZpdFhlNTJo?=
 =?utf-8?B?NFNicG9mVWZpWkZUeWlUUHhZWmxnQXpLKzJLQlpJdE9XSGdoVVRIaEcxb2ha?=
 =?utf-8?B?WDBrWWFqYmQ5cStZN3JxMkRJMXhmSGhYTTZTNzd3aGhPcWc1bXNkNE1pazlK?=
 =?utf-8?B?K253cDBYOXArby9ubHRjU0ZvREsyVEJRb25KR0kwS29KN2tWVm1kS2VJYXIx?=
 =?utf-8?B?ZWMwM3hoL0d1eVV5OFZTVGJTQ2lDcGZNWXMybTluWVZuWkdmVmtyT014Tloy?=
 =?utf-8?B?cXRqYW1PY1poMkpMOURGWkdmSnFiY0FCWHRxUWxWUUw2Z0dLZ1lRMVlPd21r?=
 =?utf-8?B?ci9kV2o4UXFqcUVaNVJESW5ZUkdvY1F3V3JIVkVwNzVhUWhraUgzcjFHd2Q1?=
 =?utf-8?B?RmFxVDVnUEdaNXZ0bEdFM1Rpc0cxNG5TS2ZtWVJlNW9PSVBJVTJTaDRVSHJq?=
 =?utf-8?B?VkRidDBSWWFjS21jeDRweSt5SGxMa0dsY2FVYkN2SHFoZkNmT1M0UXFLV2tV?=
 =?utf-8?B?alQyZDFoaWV6dTQvcG9oV0FGL0JDRlpNbG40Z21mb3BUM3d2UUFXWVdDOXIz?=
 =?utf-8?B?SjlSYkZaNmtaZURNNUp4aGdnRFVaVW1KZExodzlmR2pFYlhhNWJqSkRsdERS?=
 =?utf-8?B?YUNDWGYxSGdXclM0azc3REpUL3Fpc010ekYrTkwwNGdINlJqcnBxZ1RxRndz?=
 =?utf-8?B?d0ZNcitrYVhkRmxUakpSZTFvcGtOVCtBTlJ1TUhJaFFPbVJ1YlFoT1ZXZzds?=
 =?utf-8?B?a1NPVGxxdGd2akpFUEEyeXJnTGtkZUpwai9KU1BRcjcvVlVqVWdMY1pmbmpz?=
 =?utf-8?B?R0ZrY1dDZTlBbjBBZVQwQ0hxdkk5Zkc0SFlhQkdFeHg0djdlS1JHb0QrbFBU?=
 =?utf-8?B?a2d2aUZ4b1k5Z1FtNHloRitJV2RPMTIwQ2Y3NmVsU3VmM3l3c2ZhZnhxZEc1?=
 =?utf-8?B?d0JPUy9SVWVrWUYwWmRoUndsMG82UlBkYWNDYjUwZFMxeDYxZ0VOSHdDS0U0?=
 =?utf-8?B?MEE5MnlldjgzMCtDZDJIM24yOTJheGRnUFJNL1VZamRwdjdYdmVmS2V5bTY0?=
 =?utf-8?B?eitGcjJHVXJVTjBqRy9hSWJSL3Z6WjRuMm9HUzk3eG90Y2pveTlyYlk4N0kv?=
 =?utf-8?B?aEtSUnNXdXQ3dmNXZWI0SXdpZ3VEUGpRUUpUN0FrWDVGQlo2VmFPeHRXZFgz?=
 =?utf-8?B?djRvUG9yaXhBaXIwMEJ5b2ZsT1hWRXZJdkNEY2I4eGdQUW11QnRhbWJ1M0h2?=
 =?utf-8?B?WlFpMUFYZ3NqUFdsSlpvb041akxZaTlJN2tUb3hreHp6RFN3NnhzL3FxeVIr?=
 =?utf-8?Q?8YqmA6kSD4+bIcdMwGUj9DQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGovOEZhRjVxVE4yUWlLSEU1Qzd3aCtSYTloTDJHYUlmWk1KN3ZxdFhwVkp3?=
 =?utf-8?B?dWxJWXRBcWgxRVk4UmVybCtTdFhDcXcyVkFiMmV1MTZuWDl1NFVCZFM5S1Zs?=
 =?utf-8?B?YXJjRTA1MFFyNExxdDA4algrRGhKT0NkdVlXNFlmVEN6MzhSMFdvTlROUVRp?=
 =?utf-8?B?SUltZmpYUitUejM1ZnRqWGhZN2lNZkZRRmpzcDNLcWd1VnJEWkJlK29ZZ2k5?=
 =?utf-8?B?eWQ5RnVGMlFGaHVmQjF5Z0tjaFgxUHhQcE8yVStGeXRWanJma2RNN0pRbmNF?=
 =?utf-8?B?WnZMY1RlaTVTSkRULzFCdklPTXZOd3hyUDZrcU5FRDUrTTVscXNINC9PSVVZ?=
 =?utf-8?B?RERueSt3YkFraGZiOGZmQ0pvbHRjbHg4bHR4dU8xOHFiVTBhM01WYnk4WFl6?=
 =?utf-8?B?eWpISmhjSjNaak1aQ0Y3ZmJqSkYrNmtNL1NFUjdWRjhqSW9US05xbXFKYW1z?=
 =?utf-8?B?WDFFcXVzZHFhQngyV1VxME04L3AvZVJmakUycnZWWUtFM0VadnB3SDJBK1Ru?=
 =?utf-8?B?Zk1yNTdaK1JjMVhnL1AyNGQxWHJmOGNYZW52bzM2K1ZkOXlXUENvZ3BNZ1Ax?=
 =?utf-8?B?WFpFbHdCTUpsYU9RT2lNZDdvNHZWMEQ0Q2lqQThZZ0J0ZnBHcU1BUkFVSFpp?=
 =?utf-8?B?akdiT3JzY0htOGlhSjVLWXBzSXVYMFdzR2tGOHlUQXZXMlVJT1JrMFFhd2d2?=
 =?utf-8?B?M2dockcvYzJFWkZTWHJqendkL0MrYTByY3h0bElLcEM5d3FUOUlSWW5KOWF6?=
 =?utf-8?B?d2pvd09pUnlId2tNN3RRcXZlY0VpUi9rOEtwSDZ0SDNpSkxKbXFtTTl3M1VH?=
 =?utf-8?B?Zk9XSEJ5VFVBSEx3Y2U2K1gyV3FPbXBNQVNxVVI2VmQ5OW9GazZseXhJWXBL?=
 =?utf-8?B?Mis0bExVNUI3TWtRWnZDTmFoYk9HMzVpYm1pblFBcGtDbm1BY3NKRHA4V3Yv?=
 =?utf-8?B?Q2E0Yk9sTnlNWXQxdW1HOUR6SFZmZXpseGZyQVlUN3RibDRQSkhZWHJCaDNY?=
 =?utf-8?B?MVZZVmx3MStnQWJJdjNJWnpPeVBybHJybURmQ3NldHNpSitucUFZSHYwNUpM?=
 =?utf-8?B?azJJNFlEUGp6SmpUWHhzZmJTOENKcVNRU2NyOU1HZGZ3elprL2NtR1JDK2xF?=
 =?utf-8?B?ZkxHc2FTbEtSK3N5bTZMRXE5OG5xZjdMNWFpZXZLRkU0b2RqbmFJS0VXYWdC?=
 =?utf-8?B?Qms2M3hOTEh0cWp0OEFVQjR5L3dhNFhLdW54YWZoK0hqT2Z2Y0RzSTlPMTFP?=
 =?utf-8?B?c3FBd0RaaTVLbHVhYkI5YUZseWdqSU1Uanl5NTVVV293dmNpb1dTc3laYWZI?=
 =?utf-8?B?QnB4bk90Z1BoYndvaEJRaHFJdGI2TkhFQm8rMHIyK3ByajlCWVFlLzg0ZFNU?=
 =?utf-8?B?SnRpVUNaYng4RzVZdTNOSVJCVk9RZEE4b1pTR3BESXJreGhjbnQ4YnlDSEFZ?=
 =?utf-8?B?dzcyRHUyNVJrNEUxNVdNZ2lpTUp5bmg3OXJYd1VoTHQvL3k4MC9hV21wMllh?=
 =?utf-8?B?NDROQ0U5clNyMklDUnoweVJ0Q05aUVBqOSszNVZTU1FESWsyTlFQZzdrTnd3?=
 =?utf-8?B?RFlUWDZxNzJ3K0t6aEw2dHhOMnlxQVJKR2hVOXRoRHpveDF1SFhxYzJKN3ZF?=
 =?utf-8?B?YTFmM0paVkRYSDFsTVRhWENMQ1hkcUpjSzUwdzFVMzFQbnEwOFIzU1ROYXRE?=
 =?utf-8?B?OFA2OXEwd2lzbC9Pbi9VTHB4YmFQNFh4RDJaTDZVcG5xMThBb1RwcUhtU3Yr?=
 =?utf-8?B?ZlZOMVd5eTQrRWV2TllsQXVadHRXYXEzMzN6T2NnVEdobko4c3BsZTU1TjJh?=
 =?utf-8?B?eXhXMWNPckp5cmYzVXRVZVpwaGkzdE1XaEZjYjlDK2JZellQUXovTHU0ZEFX?=
 =?utf-8?B?aFBYUmpXdWEyV0FxZVFpb2p2L3lxSzNKeGFBQkE5ZDZ6ZGxwRDMwOG1Wczhy?=
 =?utf-8?B?QVpyaDdwQldrTE9vVU1EV2FyeE0xZmxpVnhoZUpRTGE0TFVHTkRzMUp3Vkx1?=
 =?utf-8?B?YThhbkkzMmFTWlpkNzJWUVNFNUV1UTFEQ3FnOXV6QzJNWUNkQWlsS25lOFVX?=
 =?utf-8?B?OVlVTHBPb3RFMTBkcUI5amNGTWhjVWxkTlIvVkRPamt0SEtYVS8rcWI3SFZk?=
 =?utf-8?B?WU9nZXQ4dUJRM2RTdC9KNzQxR1U1TEw2MTVhVG1NeWh4bFhGVHRlblBlYkdE?=
 =?utf-8?B?SS95RHIvWUJSQklaZTZseTRvdms4amZ0cVFuUW5CRjFmQUl5NUcyNlEzS0NP?=
 =?utf-8?B?YUQ2d3NMeUExaTFWS0xUbnVaRjhLWFMySFhCY0RLaEdESFcrTzNwb2hJTUV4?=
 =?utf-8?B?empjL0ozK0RYL1JuMG92aTN2cHdvQjlEU3l3NVlKQUl5ZEsyeWh3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d02479-6223-43bb-c3d3-08de585a98cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 19:32:06.6817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B8F7aTKgpjQcBtxXISHDNowmQWICsIjTxcjAYFjSTetkK/pNcuglUIdMY++cKV8d+Vu3d5+iuru5Gz3ne0KZQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7180
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

T24gVHVlLCBKYW4gMjAsIDIwMjYgODowOCBBTSBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+IEhp
IFNodWljaGVuZywNCj4gT24gMjAyNi0wMS0xNyBhdCAwMDowNDo1NiArMDAwMCwgU2h1aWNoZW5n
IExpbiB3cm90ZToNCj4gPiBUaGUgZXh0cmFfZXhlY3MgbG9vcCBzdGFydHMgYXQgbl9leGVjcywg
c28gaSBpcyBuZXZlciB6ZXJvLg0KPiA+IEFsd2F5cyB1c2UgYWRkciBhcyBiYXNlX2FkZHIuDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVs
LmNvbT4NCj4gPiAtLS0NCj4gPiAgbGliL3hlL3hlX2xlZ2FjeS5jIHwgMyArLS0NCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2xpYi94ZS94ZV9sZWdhY3kuYyBiL2xpYi94ZS94ZV9sZWdhY3kuYyBpbmRleA0K
PiA+IDk1MjQ2ZWE5Mi4uZGNkN2UyMDc1IDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94ZV9sZWdh
Y3kuYw0KPiA+ICsrKyBiL2xpYi94ZS94ZV9sZWdhY3kuYw0KPiA+IEBAIC0xOTAsOCArMTkwLDcg
QEAgeGVfbGVnYWN5X3Rlc3RfbW9kZShpbnQgZmQsIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2Ns
YXNzX2luc3RhbmNlICplY2ksDQo+ID4gIAlpZ3RfYXNzZXJ0KHN5bmNvYmpfd2FpdChmZCwgJnN5
bmNbMF0uaGFuZGxlLCAxLCBJTlQ2NF9NQVgsIDAsDQo+ID4gTlVMTCkpOw0KPiA+DQo+ID4gIAlm
b3IgKGkgPSBuX2V4ZWNzOyBpIDwgbl9leGVjcyArIGV4dHJhX2V4ZWNzOyBpKyspIHsNCj4gPiAt
CQl1NjQgYmFzZV9hZGRyID0gKCF1c2VfY2FwdHVyZV9tb2RlICYmIChmbGFncyAmDQo+IENBVF9F
UlJPUikgJiYgIWkpDQo+ID4gLQkJCT8gKGFkZHIgKyBib19zaXplICogMTI4KSA6IGFkZHI7DQo+
ID4gKwkJdTY0IGJhc2VfYWRkciA9IGFkZHI7DQo+IA0KPiBPciBqdXN0Og0KPiAJCXU2NCBiYXNl
X2FkZHIgPSAoIXVzZV9jYXB0dXJlX21vZGUgJiYgKGZsYWdzICYNCj4gQ0FUX0VSUk9SKSAmJiBp
ICE9IG5fZXhlY3MpDQoNCkl0IGlzIG5vdCByaWdodC4gVGhlIGJhc2VfYWRkciBpcyBjaGFuZ2Vk
IHRvIGdlbmVyYXRlIHBhZ2UgZmF1bHQgdGhhdCBsZWFkcyB0byBDQVRfRVJST1IuDQpBbmQgaGVy
ZSBmb3IgdGhlIGV4dHJhX2V4ZWNzLCBpdCBpcyB0byB2YWxpZGF0ZSB0aGF0IGFmdGVyIHRoZSBl
cnJvciBpcyBoYW5kbGVkLCB0aGUgZXhlY3Mgc3RpbGwNCmNvdWxkIHdvcmtzIHdpdGggY29ycmVj
dCBzdWJtaXNzaW9uLiBUaGVyZSBpcyBubyBpbnRlbnRpb24gdG8gZ2VuZXJhdGUgQ0FUX0VSUk9S
IGFnYWluIHdpdGggDQp0aGUgZXh0cmFfZXhlY3MuDQpUaGlzIGlzIG15IHVuZGVyc3RhbmRpbmcu
IENvcnJlY3QgbWUgaWYgdGhlcmUgaXMgYW55dGhpbmcgd3JvbmcuDQpUaGFua3MuDQoNClNodWlj
aGVuZw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBLYW1pbA0KPiANCj4gPiAgCQl1NjQgYmF0Y2hfb2Zm
c2V0ID0gKGNoYXIgKikmZGF0YVtpXS5iYXRjaCAtIChjaGFyICopZGF0YTsNCj4gPiAgCQl1NjQg
YmF0Y2hfYWRkciA9IGJhc2VfYWRkciArIGJhdGNoX29mZnNldDsNCj4gPiAgCQl1NjQgc2RpX29m
ZnNldCA9IChjaGFyICopJmRhdGFbaV0uZGF0YSAtIChjaGFyICopZGF0YTsNCj4gPiAtLQ0KPiA+
IDIuMzQuMQ0KPiA+DQo=
