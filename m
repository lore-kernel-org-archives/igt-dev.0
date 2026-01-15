Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650E5D4660D
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 18:46:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 123FE10E05B;
	Thu, 15 Jan 2026 18:46:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfKZ2AW5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF5EC10E221
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 18:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768502773; x=1800038773;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eYcHLtWIEa7UlA1QGD1aNg1sCWI+usuT0Qhk8shTJeo=;
 b=EfKZ2AW5OhX+GK174EiHxt3CF+TZCc557tpqJGB/N/ieNiuTT1CTUSDm
 ce3FQIUfEkCwi+B9Fetd39w79dYvIDiGp6Y+nWYeQak8N971YS5efEIha
 YwNLBlNpHk+HwaPTLlZOZMLyLJHX75MMGEqUBbq0sXECceNyP9eytiOc3
 TGu/12C8tSKlQ3OljTxUbLX6JhRzXJmg5Nk2AzJFN4j74d5VU5mMMLoEr
 o2g+Lhu+ltJW52taXJ/btDI+2U8bIG4pqXVQAg5NYUzwnipKs9SNCKELg
 xGC4wJRX0/uTl2EhnuVf7Dms7b2cFdEalOx9hPkwF0B4W7iIgFCCg5g+3 Q==;
X-CSE-ConnectionGUID: LWz9U5BhTV6F4Lxmj2B1MA==
X-CSE-MsgGUID: h+zwiQe6RAWdb/u28yUfBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87234124"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="87234124"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:46:12 -0800
X-CSE-ConnectionGUID: oL+Pc5++SxSgsP/9vIvHoA==
X-CSE-MsgGUID: RqpH1J3cQTyp40euXHJ2FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="205507432"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 10:46:12 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 10:46:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 10:46:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 10:46:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBKi62FmgYTasC/3GwV9tGCupfbfOHpAI2teEBUqMzcspwLFUJ03oYGjm3hQKUdKepuCNlE27tGzF0/aBmY6jDjXvs2UgRAiO1eQL+3XsbcY8acwdIALbuqNyU9nj+kTI+oQtbAJx2CXR1bfh0bpCPs/MfJKf/2ncoM5xJNgI8yIH9mZqcnvsC9uTBUfSEwO9A/DUvw54rtnwvx189LLzhrNErM14j60kQXrP1LhmsI0BQyJd5gAt9+JLMluQd2NXCY11ZW7EtP5ONRlpdMpzs82159wOcN7zYfUyKLNrovEZOzSrV4CrsrMLLd2YxOQ4A02J/CHRT4ediXeEQcwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q97UMm98Habqg4s38MAzr4ynaXM1rfjHaltekJWzxRU=;
 b=GRZTnmmzRYwn7bVCFiZhpLRFGkoglPOftckKkOXXkK3t7GVt75PMRUl79S3hj9xbF3m56Lio/+o0tok6t5DbAy5VIMZXjBOLuFi0TloHIqCb/zesuxkCXauSGNi/NXP2KzLMaMm3ReUpLHsmPcMZs0m8QqS+h7l/wtOJ3N9NJ20HBPF4C5X1j1LpW32L1h3Za4pkxG3bj5IgNbgUMJyp//cXSOKE+QKr7f5l0p9mwwqCIWyRtbcKaSI+s46jk9ofBYbkAjRthhVKX7vD3mjtD0uJ7bLzkMTj4nzw1jXSqmh5jnhiqOMmmQ21Hl9ROP5pLGNhpmTfpGqHUXi130uVoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Thu, 15 Jan
 2026 18:46:07 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%5]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 18:46:07 +0000
Message-ID: <35909f2f-13b1-4363-b501-c8e19b5c3cc0@intel.com>
Date: Thu, 15 Jan 2026 10:46:06 -0800
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/xe=5Fexec=5Fmulti=5Fqueue=3A_enable_preempt_flag_for_Q0_=28rev3?=
 =?UTF-8?Q?=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260114065048.833061-1-x.wang@intel.com>
 <176844066745.155664.12033771717589704779@a3b018990fe9>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <176844066745.155664.12033771717589704779@a3b018990fe9>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0184.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::9) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|SJ0PR11MB5920:EE_
X-MS-Office365-Filtering-Correlation-Id: b402c5b2-954c-46b4-06ed-08de5466580d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|42112799006|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzJaMGM0Q0VMd0FuVkxWaWNvLzlXeDhwT2RnMldqcktkSzJvRjd5VHpOVEhL?=
 =?utf-8?B?N3haVDhLZC9XSTlvRVk4MnlhOHo5bXNYcEZyZUxIb3o4NWFVcHlLTks3V1VH?=
 =?utf-8?B?RFZJaHlKLzZhbFNwYVFzaCt6bjh5VWJCWkJnN3ZoeVhodGlwNkwyZEYrYjBr?=
 =?utf-8?B?Ukp2dHZRbStaTFBEUXBXTndjeU05NzVLTlg2ZmMwWUcwRjZvVU9sKzkzamZG?=
 =?utf-8?B?WndVdmpLYStNUEcxK2lqSHJWNzF4SytOblRianlUUVFPd1dHM05MMlVYQyt3?=
 =?utf-8?B?N1p5S0xISXVwN2E2cEtMMlo5TXVKendSYTNwc1JFSnl3QTJhMUpJSXdvbzBL?=
 =?utf-8?B?MW5UUmc3anplNlJmbDFVQ2w2MlpUZ2lOeHh1Wm5YSXBZNW1Mem53TUhFcS9L?=
 =?utf-8?B?dDBJUDhzZG0rVTRXUEx0VzZuQXNMSlBLZXcydVNxQlpQbHR2VXJrRmJYV0Ru?=
 =?utf-8?B?OFFhMXo2M2xFL0RWZEVVQmFQTGJKRGk4ZHBNQ2tLMzYza3Z3cEpCTEIvMENm?=
 =?utf-8?B?SDRDejlCSE9mU09WM240RS9QNmZDWkZKV2NRODhHNDhSUTJIS0x6UDdZeUlG?=
 =?utf-8?B?YkJta3N3d2dnb3J2NHlKbldIR1paN2xGdThPYUhwNWp1K2FNU2VEa2p1cjhI?=
 =?utf-8?B?ODZBQU51cnYzUklram41MVFFWmdUR3k0OVNLajI4MEVRZFphSE0wNDFTZnY2?=
 =?utf-8?B?NFVIdFZTRTQvLzJ1ME5VbVplVUd1MHJhUG5ON2c4T3lSOEtYdTRDSFhET0dF?=
 =?utf-8?B?Y3l3MFlxdGt4SVpYYmtlQ0hYSW1kd0QzUFpJQm1qQW1tVjRwL1I1Slo1K2tR?=
 =?utf-8?B?S2tmMmVjVktnYjJKaDd3emYrMlgxSlFZVWhqQUVvaEFPbW5oU0V1MUxoSkJK?=
 =?utf-8?B?bmdZRUNnM3hmek5JZTJncE1zZEpUQXlidlRQbVFPT0o2dUoyeGNaWCsvdEpq?=
 =?utf-8?B?Vkp6aWM4bTMwR0c2bVgwRE9aeUlHVTJwd2gwaEFwSUYweTZob2d5NE16S1Vp?=
 =?utf-8?B?Z2lmWHNZNVpSN2ppUnp1MCt1T0l5N3VDN1pzcDREWXBqZlFWQU5nQ0x2R1JN?=
 =?utf-8?B?LzA1Y1IrRmEwYnFwb1NjMXRibzBoZDNseVZxUjNiUTQ1Z1orcW41V1VGbXMw?=
 =?utf-8?B?NDMwSUg1ZUxCTDRSUXBlLzAxNjdZZndaMFhNYkFHNmlSTEpRRWpqWHRxMlU3?=
 =?utf-8?B?YXpZdFpFOW9SN0VxZDk5RlVacFN0dzFFM0pjeW96L1RDRkNHVndnUFZHYTVZ?=
 =?utf-8?B?MThMVHBLeHA2cisrb1VDZ3YwOEd2TUlEY1h6bUhIR3dmRk83Vyt3Z25mTXRn?=
 =?utf-8?B?QVJ6V3ZkZThRZS80eGYwdVdnc2VEbFhBM2tTY3BpQ1BMbzYycE5DQUplQjJt?=
 =?utf-8?B?ZUNZc3FoUVlQbkFSWU9GYkRnMmtCZGxsLysyNVU0WXlwb1RFOFdTVjQwVVJz?=
 =?utf-8?B?aEVCT1gyVG50dm5zK2pGMzhnV3J1TC8yOUFTYVByV2NEOVVqd0JoV2Y3QVAv?=
 =?utf-8?B?YWhZOHpaOGRhZENKMzkvcUR4ekk1bnpCTDBEa3RoTWkyb3F2YmZ6MXpmZ25o?=
 =?utf-8?B?ZGozd09vU3hCTk0xK2UrQ090U050OWJyK3FvQ2M0d1Z2WFZhM2VtWWZPUDh6?=
 =?utf-8?B?MEVQdTd3N1UxdEhTbE1jdDdHTk5IUTR1RlVyQmVEdTNTZTlzT2ZjM1Z3OFhN?=
 =?utf-8?B?eERUMkphOXlYS3B1cGVQRzBKOFhpRzIyMnEzQTAzczJCUzR4TS9YR3dUdlRU?=
 =?utf-8?B?cVVvdmhvRHlTR0FpekZFK0NwOTd5SzVhR0FDQ3d1SnFxQ2paYXFZM2Q3VUtq?=
 =?utf-8?B?WlFvVFlHdDMwRnovWDljZVpmQXRSOGlwSXVJeTdoVzNaS3VrYzlPQy9mOGJq?=
 =?utf-8?B?Y05JVWh1aHZjNVFwLzRKTmFyTEdUNElWdm5aYjJYS2VXeTZtSzZOS3d6ZTVD?=
 =?utf-8?B?U0lUWkZCbjNzSXYzaSs3cHp2WDZJNUdrdkdIaHFkRE9meFRScm9hNnI4U0xi?=
 =?utf-8?B?SDJqUlQ5bDIvaUVCMTBMeGJvUm9DcjhUSmhCN0tHTDlSbHUrQitPMVU3M2cw?=
 =?utf-8?Q?NKFX2b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHlRS01TY3p4dHM4YmxiTjJweWJYYm9iSGwvdjdhSUlwWndpRGNDazcwSW82?=
 =?utf-8?B?OFZFemJDM2J0SWVaNEF4SXQxblpxUFNRejVlaHh6c2pEZG9CU1NTblRIZFo2?=
 =?utf-8?B?ZzJGYkd4WEJ5dnlLNmJoY29tbHdMbW5wUHROY0tPU2ZocjJVNmpHNjlSdE9v?=
 =?utf-8?B?bzRsdjNmS0VhSVVGRTZVUVFTNFhsZWp4VkloK1JrWDM3Q083OU9sOTkvUGtz?=
 =?utf-8?B?QnpQUVJzWDdqeGMybktMbC9hTU1iUUdJUHJKa1NnbzQyTkNaVDZFRGVBY2ZL?=
 =?utf-8?B?VUtIaHpWK28wSDd6b25Sb1lmcitDclk3SkhJNW5NQ21Ldjd0cG10Tm1wUCtj?=
 =?utf-8?B?ZTdHWUp0bG5RMFJDTDhKeDRSaVZvTjExaUQvL0k5QXplczBTL1I3dWdqYlNH?=
 =?utf-8?B?RE5mM2RncDljcHVmS0JLd0NVK2x3a3lnZ3k0Q0xHZ3RlMWNna0ZrY1M4bUtq?=
 =?utf-8?B?aUhCc1VxS2JNY0x2RzBhZDhXT2twSWVBd2czZDh3Yi9TdUVkeVJoclJoVHQw?=
 =?utf-8?B?VTBWOUc2QmZkeGluQzBOVFpocmpXWEZNR1o0MEtsRFUxZUVJa3ZUVXJwd1RX?=
 =?utf-8?B?WEs0U1NKODZaWlZkZ2JoRVR1M3ZZNHlJelVyRWpCWmdWS1E0Z0ozS25MaTVo?=
 =?utf-8?B?eXZqU2dtUGpPSVVGWmpGTzcraVZJb2Mvd2VQYnYzbS9WTFJHMTJNY0tvSzlH?=
 =?utf-8?B?MFcwY3ZiVUExQXBHWCt1aVhrNytCMzBqY1dFZy9QK1k3OFZDSXlsbi9CSUZU?=
 =?utf-8?B?U092YUlwcVcrVG5oWDRnYTlNWnZCc0M0L0ZKc2NJQTlvanJsTGVGVlh4OGg3?=
 =?utf-8?B?STJBRzIxdUsrWGU1YVJxRCtJcDFhNldyQklzaTlHK1BsVHZpdG1QOEQ4MlJn?=
 =?utf-8?B?UzNLdDU5ZWRMa2pJeHFVMWJsb3dqUnN3U0w1OStpU3JOVHVlcWFnOWkrUXRL?=
 =?utf-8?B?MExzcjNoQUFaMkZaVy9FZDlIK3UzSzNwTjhXL3BvSWphaXVNTW9NMG1hdFpC?=
 =?utf-8?B?UEhJQmZacnZXV213M3pnQ0pHREtEUGVNS0l0UWlkdkZ1b1ZCUVhBZFUya1RB?=
 =?utf-8?B?eVRyM2hvaEIydlNVbGxDcDdUWVJDZm5QbHJKRzhNSlZYOWczK3hEUUFQNi8v?=
 =?utf-8?B?elJad2RlRUtsdm5uczVxdGdEazFKeUN3NnNOK3pEK0VGaVZ4aHVlaFdrbnpu?=
 =?utf-8?B?b0FDV2psRjFZYml2Wi83OXBxNUZDWkYyaHk5L0tGUHFrY2R6OUFzY2NKT2wy?=
 =?utf-8?B?WE9TNVhhaXBvNllHTVUxQ1Z6RUdrZGhCdFRpMi9McURaSUN1NFdnM2w4ZlJS?=
 =?utf-8?B?b2dxWEZxakJseXVOcWZtdmZpd3paREQ5WUVMMVlFWjl6VkJxMzZFTE9adFdy?=
 =?utf-8?B?Si9TRjdjazRYQkY1bW05TVdQYWhQRlpEcmJEcEthTjZwRXJGTWU1ZG4vcFN3?=
 =?utf-8?B?NEJTcmtwYU9TcTQxalJIYjVnRXZJbFJBWTE3dmlKaUZtYzVYSWxQWVhzVTh5?=
 =?utf-8?B?MGVaamtSakN2MzRtZDNJUUZlaHgxa2NFa2tueVhkVWg3OGxQZGFwNFRLOFRD?=
 =?utf-8?B?NUFVU3pFbVFWMzllWFkzeHJwdG5aY2F1dFdWZkNCQmZ5ZXQ3SnVtREJkY1NB?=
 =?utf-8?B?VkJ5Q0JNNldlTWFvM2xOM0R6OUw5VmFPUEp2TDFjQW1PbElCMEJaeGJva3dE?=
 =?utf-8?B?MXJUcDNCOHRhY3o3QTlpUjdoRll1ODNoaWh2Z2t6RU84WDkxTU9ZKzRKdTVC?=
 =?utf-8?B?eFc0cURPSC9Qa3cxbnJsZmpRQVIxOXduVjYwTzZySGh0eVl1bkFjblY5ZFk3?=
 =?utf-8?B?aEQyKytDNVBKWGdHclhCWkswcXFpTEowUE9ZcndPclptUVhmNC91VitEd0ZB?=
 =?utf-8?B?WVpLdmlRWFpvWjRVbjg5ejVIZENlZ0grU1BrYXZ0dThxMk50b01GeHhNeUk0?=
 =?utf-8?B?RGo5bC9aaE8vRmRIbmMxalNoTngxSTNQVXJXeVRuZWswQ3pqNVlockNPMlVP?=
 =?utf-8?B?NFIxejUrRkFJL2VYajQ4aXNiQmxYS05UZnAyTVlNcTRML3hOYzd2dW0raXNY?=
 =?utf-8?B?MllIZEIvYmhsdFJNWG1WTFdURU5Ldlc4UVh5TGFXNXY3ckZwblhUNlpKYzNI?=
 =?utf-8?B?LzdaSG0xQ3pYNGxGZ3l4TVZ1S2VGUEw1TDJIM2ZvdXEzYkdEMnRCOEZqTVlT?=
 =?utf-8?B?MFBrMyt1YjlCdlcrN2JjRHQ2YVBMc1FtMjI2dUF4amJjVFp5YnBoZG1GYWJt?=
 =?utf-8?B?TjVUU1dtNDFnUElEOW04a2ova0pRTDlVd1FBc3AwMFhiNTVtUE1NcURva253?=
 =?utf-8?B?ZEtHKzlBUWkvc1FGbUtLbXFtSDl5UkIyZGRjeGh3bmZZQ1lPUytDUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b402c5b2-954c-46b4-06ed-08de5466580d
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 18:46:07.6404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmOzxkfr+wpojFlZ+MJgrEtfLTckhftN5bUxa83hbzXgoKpdR/l1gFTr+WcKmGts+8MmckNoQ+VClfXQmwUf6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5920
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


Hi igt-dev,

On 1/14/2026 17:31, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel/xe_exec_multi_queue: enable preempt flag for Q0 
> (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/160070/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/index.html
>
>
>   CI Bug Log - changes from XEIGT_8701_FULL -> XEIGTPW_14345_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14345_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14345_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14345_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         +1 other test incomplete
>  *
>
>     igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8701/shard-lnl-4/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-bottom@pipe-a-edp-1.html>
>         +3 other tests dmesg-warn
>  *
>
>     igt@xe_pm@s2idle-mocs:
>
>       o shard-lnl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14345/shard-lnl-1/igt@xe_pm@s2idle-mocs.html>
>
Unrelated.


Regards,

Xin
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14345_FULL that come from known 
> issues:
>
> ...cut...

