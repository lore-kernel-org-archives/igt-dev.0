Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7B0C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 16:07:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9356910E08B;
	Wed, 15 Jan 2025 16:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yjq1XKa+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D39DD10E08B
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 16:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736957224; x=1768493224;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=AvWUXgqsHEMwDRLxgQOEclycOnVE9rgsjdfhQyBN+XM=;
 b=Yjq1XKa+tCDQtW/D+JozSHsGhRjrePSkUguGp09Qvpp3oHLSll70tccb
 JMHSMDy+thcm6UsGqdJVIjBhkxfhhFw88C9YYMNa51Fd99J0uBKDYK36a
 99VV9NdEKgtuPvo8SxY6jJEcHnlWuaF5rP4uK7OEUiJV66PygbXKBGbv/
 xTW6//KbnDZLLH9HGRq+jUB7vu59+CsHzVZ9vS7YWJkJFU+rbYMakhY3R
 LO/ESToXPlZy4MErvAeyp8QSGJqVxDf7L2AiEqQRIek2c5nsgdRb0oR6L
 hSujuduMShPF3XDAr27fUTyoSqPEuwN+h/hDug2IXO+1Mhi1l6mDvxFlQ g==;
X-CSE-ConnectionGUID: B7yqIys/RaK3TmNvDdqt4A==
X-CSE-MsgGUID: yaIbKjKETUGY18AfPr+Vag==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37182411"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208,217";a="37182411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 08:07:03 -0800
X-CSE-ConnectionGUID: NMO5BUl1QoaK3UcS/YG4Dw==
X-CSE-MsgGUID: VHGnaGNeRL2C3iMlQfaXBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="136038568"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 08:07:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 08:07:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 08:07:00 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 08:06:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nwpbFlohpa9FmF+MqU2SgBDTCAqEZQI43ID6G1vyhJVMgPyLPaYPmjlks5oty+/L29zWSd185xdtuHNqW1f5o4InGFeMxDKBAu3dzEHR+qSYy8GIrAPNpoDZpFjyna4Lpjux+ZB/x6x1iVP3qER3+RYfKrLR43Ba4A3HEZl8wIBAA0pqrryozWziJwhQgscS0Z/0t2xTKRdPrZ1ZJnj81HQLj+2WpA63d0jR587+O4ARgIKGljfPAzbJwl361C/0y6q0xfH77QNDgvzNdn35VbF1iaMt+gCPaT5F6HwQfTf/yuvPdZD4N2VY1T+uRj4zQ8Xfh/X6OxRbApxJIOVKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXHbQyce/xAkfI9GJU6nEre9j2hJH5fbUM1QoTXOYew=;
 b=Bp0ykYrpuzVYhw5kjKmhmmPv3GFHzdThYjM6eC6YSbfSQrI1F4oI75ix4tLmOo4xRKGo++MB1j/weJj27r8EP/606O58cz6UJ46qsnRsadM3G6Q25KyyAhz7wb+ZLmUdjrYHHP3pcbXMb93iLHKH/kiOPkGf55IlI2waYdyzJgW5NXoUCDRhKRHiTs00c8b3k/xIenJ/dyrga+takuS2ZyCxz9E6BNJxdDEr7Zh4Rkq5PpAvNK2rszErgX1nn/i6L9rBthzBMwDPddI5E6tZSE16OZnECrSG0AKO6aBwHE3++4QK6xv5gxkVIaMQ4zDkqSuETsGL4bzDlC230DinHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 16:06:56 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 16:06:56 +0000
Content-Type: multipart/alternative;
 boundary="------------it9Le1IzWSuhISCqPTkOz0PG"
Message-ID: <a607f37e-1eaf-4043-ae3e-f75de8ec596e@intel.com>
Date: Wed, 15 Jan 2025 17:06:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 7/7] tests/xe_sriov_auto_provisioning: Add
 'extended' command line option
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250114150848.332708-1-marcin.bernatowicz@linux.intel.com>
 <20250114150848.332708-8-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250114150848.332708-8-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VE1PR03CA0053.eurprd03.prod.outlook.com
 (2603:10a6:803:118::42) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB8035:EE_
X-MS-Office365-Filtering-Correlation-Id: 813bcf7c-3e40-4cda-b5b9-08dd357ea25d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVZtQyt6N2d6aVpUZG1RQ2syaEJWYzZlZ1JkbFZDbC9aWVUxN1gweHYwQk5W?=
 =?utf-8?B?RkNldzlCN0VRRjlvSGZkMjZLRkd0bDdxVDFGOU1yNTZVQU43UkQ5NUxaalJW?=
 =?utf-8?B?MkU3S2M4OERoR0czSzNtb0Zxbk80UTExQm9WYmh0aVZSZUZsNGN1Rm05Mno2?=
 =?utf-8?B?WXVFK0JjQ2dJemwwK3FleGZmYkFKcDYxQ0pnaGZ2ajZhNmpFMXFuaE5wM0Fr?=
 =?utf-8?B?TzhRb2UrblkyNjhFbFNPYlV3eEVUd1p5YkM4dzZlckZjTWhiZHRuWDloamhs?=
 =?utf-8?B?T2lUUjRmeDN6NjdOcHRKL05JT3FZcVlxQnNoeS9lclhlY1MxWU12d0lyNUlM?=
 =?utf-8?B?TEh0VVdaQXg1bXVhWUw2eHV1TGFFcGd5SEtNbXVrRUZsd00zcDlFWVYzYUQ1?=
 =?utf-8?B?QWRnTDZINEdyam1YTE9zQ09XSHVablJqNG15QmlRaWZ3dzlqcGdSZDZBYW0y?=
 =?utf-8?B?dmh3WlF0Y0tWcTlCZVRWWU9EdzNhYVc1dkN1RE1CemFlY1IwaUJDMHh0cTh2?=
 =?utf-8?B?b2hxdXhGbDEvS1FsQ1p0QnNhVE1WbEtBN2thb3dGQi9CbGwzYWtlUnNqSDkw?=
 =?utf-8?B?UEJnVmtBenF1cVVEV3FnQ2p3WHA2eHl2YzRIbmJ6eVowQ29BMXZuclBqaVZi?=
 =?utf-8?B?ZDlVcDFXZ3E2NlowNTVsSTNGZkU3bWdzdHBqYkN0UHZVdjBaU3RJeGJYeHNL?=
 =?utf-8?B?aUpjenRCTEZKeDFzU3Erb0pJand4NzlpcTE2YTNIdzBWMVl0RkFTWkE4ZDZD?=
 =?utf-8?B?ZnkwZXQzeU9pWm0zTVNMU2NPT3dFc2VIdmhLVFV2TmMrak5jZS8zM044Vm1u?=
 =?utf-8?B?NmJtUHdkYWFPd1pHNXE1TUlTSXloZGtRQytaZkRVMkphTFkyUFU3RkJ0ZVR0?=
 =?utf-8?B?UUcvaGRheDRsUDZ5TUxGUGdSdmllOWp5Yk1qNUxFVVJNOHVrc3JZTjdsQmkx?=
 =?utf-8?B?ME1xS0NDckVMSTNwVUJRTjVJekd0ZUxsNmI5VkpyR1d4OE1Qdk1FQm1Uczho?=
 =?utf-8?B?NWs1bVdqNDUwcW5XMlhJRFhtUVRFVHNuOE1qdHE3anBpaGpKRTZUVm9FbGt2?=
 =?utf-8?B?VU5xL0swUzhIVlBKam0vaTFsVDNVR2ZGUkJobHRFclNYYUpsdThXeVdVdHdH?=
 =?utf-8?B?Z2ZWbHgvd3pVU0NqMUlnTW92NlVmTG5lV2hxSG1aWXNNaWhLcGZNRDdzaUQ1?=
 =?utf-8?B?c2pHTExPVWgraVVPVktFY0JpblZQZVpJTjhGUFRpSTBXL0xEMkJYaDNpYXlL?=
 =?utf-8?B?MnU4RGhsMjlrbzYzSjZaZVNqb1pEcUxLRFlYcmFVNG9leitNUllhdTdVNXQ1?=
 =?utf-8?B?eDIyZFp3SGF1cUJNZUYyUGtsQTdtYnlrRm8xamhxTTk0bGpmN3VsOW5kanVD?=
 =?utf-8?B?cFVYeHh0amVVYUZqVmVldXhEdW0xMVA0ZkxsdjhSWXVpZW9TVkE0dVozU3lI?=
 =?utf-8?B?MzhMUkJTNTV5NHptWXVvelZrOHRpRDJVNDlCOUhoQXBHT0NOem9LNHR6S0pv?=
 =?utf-8?B?SFBEeVJuSGx0ZWdNUmxEVlBxUHZtdGZ6S2R0OVM0bUtpRkxUM0cxZWYyRDNK?=
 =?utf-8?B?TjZqTFdRL1pUbG5BS0ZOK2xpL3RIZEc3NWEvb20yRmkyUjNoS0t1dC9zWTl0?=
 =?utf-8?B?bVJDWWR0OThxVWlYTnJUWHV6Y3p4Z0xUM3hXZlY1K1pVeWR1cTFoRXpuZ1pM?=
 =?utf-8?B?eG9kbnRqMXQwWHZBK3VsZHFBSmxlaEdrUTFqcmUyVmpHaFkrbHdOTkk4d3ZE?=
 =?utf-8?B?NTdxVk9QeUJNTEZIUi9mZW1hdzFUblVuYWhmZERxRGdOaGVYc0FLTVIrU0hS?=
 =?utf-8?B?VCtHbTlsNVpXSGxtWVJvVjVrbElLSmk4MTFlU2R6bWJVc2J6RzBaRGZUNXkz?=
 =?utf-8?Q?y3zZwhurfsX7/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVJVdTFCWUN0OWxLRlBYb2w1b1F4Sy8xQXlFcnZRZ2xHeXlQWFA0RUovNlFl?=
 =?utf-8?B?bGhUNjlsNisraURwVkQzN1I4QzhwdmcwNzhzL3VVaGdVMGt3TCtsMWdsMW1x?=
 =?utf-8?B?Q3R1azd5QU1tcTI3ZG1udU1DRFFOZElRMHFrUU5RU25QdGR0dnZ2Q3BEQUZD?=
 =?utf-8?B?SW5wTnA3QmN6VmNXRjRvT29kZ1BoWmo5bEI0L2lBUmp3d1NWWGozUVdUdDMv?=
 =?utf-8?B?WUJVdlBEc0hkQ0pkVjE1ZU1nV3pOVFNCNWxSZHRtMEk3eUJWYTZUWThWYXpC?=
 =?utf-8?B?c1RFVW5vd2Frb3IxMXBQMThpQjZHZHBVOGxjODBnTTBHT2QzUjMzalhMejl3?=
 =?utf-8?B?cDJYbDI5SXF6USt5MC9XejFRV2FVL0FhQld0TkZzY0tPL0VFeG9wVWIwR3Ir?=
 =?utf-8?B?ZDQwNzhUVmlkM3dHNUtsUks3SXZuUFZmMitkaEVXbCtMcmdvRUlaZnNzSDMr?=
 =?utf-8?B?REE2N2tCbzJWY2lhUVdEc2hiaDFQbld3anAyekpXNTZBK3F0YTFqOEwyMGJj?=
 =?utf-8?B?YmhQRW01dTMvRVprQjB2QXRGK3JTdWhleEFkQ3htRW4za0labUZCYkVQYlVk?=
 =?utf-8?B?akIxbzROZTUvVm1SQ2xweEh6b3VFWDZHYXJTYmlSWGYyb0orRFBIVFRuQTRk?=
 =?utf-8?B?ancwbmJJalQvaHBtdXYrTXRrZjdpWWJWNHhTcXRSdW56eXlzUm5pclVjamhF?=
 =?utf-8?B?b1ZkSWsxUG5WdFlLMk14YTJTQzRpeXpNeENuZzdqcG41Rk0wODFnTStLU0Ft?=
 =?utf-8?B?OHNPY1cwT1VmUTQvSTFTWTBmcWI3bDlYbWUzS2NiY2IvR2JOMkUwbXRzMllI?=
 =?utf-8?B?VTJtVXpwWjBGZE00SElxZTd1cExWZVMwczJxMWJqckVBSjhGdWtNTEtncENG?=
 =?utf-8?B?Rml6ZUpnYnZsU2s5UWlrUDVQNW5BRmZTVkN3NzVyT0YyN0YzanQvaUVNQmhr?=
 =?utf-8?B?MDZqTmlpT1ZhNjhOazBxZFd6anpvc2JNQmVMK3VwZ3FjM21IUkVwZ0JWalVN?=
 =?utf-8?B?dm1UOVNRSVJTT0Nzd2xTM3VobzdWcHV6MUY4UDJpY1dzU0h3eXFtcjlUQWZJ?=
 =?utf-8?B?QXl3eFlCcjFmUGFTUW0rUVlZZ0VTM0g2czlOR0tQV1NSZVJiTXVJZFJuQ0Uz?=
 =?utf-8?B?TWZnaFNoM1l4ZExiYW1tY2RXcWU2eWlpcmE1aXh0a1hHVWlKbUttWWVxZFpU?=
 =?utf-8?B?cThnTXg2dnlZMjhMVkZiL3pQMVlKU0cwcGY4dnBaY05qVlkzb3FMWWlWSWxt?=
 =?utf-8?B?Z0ZKcnFHa0Z5QkRtTjNHWnhuSHFrTlNWTnR6N2t6Z29vbW0vZmUyR1VtWjI5?=
 =?utf-8?B?Wm1TWnZibzNxZVkzRS92L3UraGJIT1J2c3BaUGt5ZXlpYnBIZXBDaWlhWFRW?=
 =?utf-8?B?UVl2NTFzbUI4OU9ja0w3elY0bXFQV3ZsTjFyNlVheDRpb2pLM2llSVNKcFhF?=
 =?utf-8?B?MHhkQmZGclREZEFDOXBjYi90RUNwWG9UdmZTUFNxWW9GNzJpTEY2SHFZTy9m?=
 =?utf-8?B?Q0paOHhuR2FHYURJTTY5T3VVU24zdGZmTmNtNFJ5TFNtaXlFOFh1TllQZ2d1?=
 =?utf-8?B?d0tmQzN2M3BEYzNGMFdGYUtCK3hxM1hGSUQyY2dnYVluaTdmZW5BSlRhY2Jx?=
 =?utf-8?B?ZG1hM1ZUdmtGWkxlZG45WnhkMTlZN0FIYUNqa3ZTbjAxSDBxcGNXaDczUEoy?=
 =?utf-8?B?RXF5ZEJ3V2QwNDJyQ2tKWTdxajgzQjNMZFVaMDhkYjRsV2xTRGhOSFFYN0sw?=
 =?utf-8?B?QUZMdTQ3cU9qVE5HTmZ2NGdKTXA4OWR0c1ZVZnlZYkc3S3lIQ3Z1VmFFWkhP?=
 =?utf-8?B?bnF4ZDBocHBhdGtjVS9vQVlFOUQzUVpRY2pGSlNXVEJwR05JUVFHeUdLc2FM?=
 =?utf-8?B?ZFIya3U4TFJlZHpxSzV3WTRtK3hsc01lY1lpMDdYNzZ5eGlnSFZicXo4VDdm?=
 =?utf-8?B?cmMzZm8wUkFiVzY3TEwxSUZzSTN4NHdLUmFIZStJaTczOVlnZC9LMSs2ODRi?=
 =?utf-8?B?a1dZbko1OEJwcnc4QUl6Vy9SVHJSdnAyS1B1V203OSsvWHE3b1BUanpvdUM4?=
 =?utf-8?B?aTJnQXpSWnBMdHdqQ1N6S1doNXdrWmpYWTVTdWk5ckdEV3l3U05IMmRGY0Iv?=
 =?utf-8?Q?kAoLimNKWven8qhzWRKQ4CiRT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 813bcf7c-3e40-4cda-b5b9-08dd357ea25d
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 16:06:56.4937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qh5WXrHW/qVxDBL0T6w8qj67bHnha/CNEj0pdTLRC3mjEhf1BdriEsIc95BlZ8at7eXKtEKLZfkfJbIqgTDr1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
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

--------------it9Le1IzWSuhISCqPTkOz0PG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/2025 16:08, Marcin Bernatowicz wrote:
> By default, a dynamic subtest is executed with a random num_vfs to limit
> execution time. Add an 'extended' command line option to enable
> iteration over all possible num_vfs.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Michał Winiarski<michal.winiarski@intel.com>
> Cc: Narasimha C V<narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis<tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_auto_provisioning.c | 40 +++++++++++++++++++++++-
>   1 file changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
> index 1d2aa8624..e13eb3644 100644
> --- a/tests/intel/xe_sriov_auto_provisioning.c
> +++ b/tests/intel/xe_sriov_auto_provisioning.c
> @@ -216,7 +216,30 @@ static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
>   	igt_fail_on_f(fails, "exclusive ranges check failed\n");
>   }
>   
> -igt_main
> +static bool extended_scope;
> +
> +static int opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended_scope = true;
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\tRun the extended test scope\n";

nit: "   -e, --extended\t ..."

> +
> +igt_main_args("", long_opts, help_str, opts_handler, NULL)
>   {
>   	enum xe_sriov_shared_res res;
>   	unsigned int gt;
> @@ -245,6 +268,11 @@ igt_main
>   
>   	igt_describe("Verify that auto-provisioned resources are allocated by PF driver in fairly manner");
>   	igt_subtest_with_dynamic("fair-allocation") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					fair_allocation(pf_fd, num_vfs);
> +
>   		for_random_sriov_num_vfs(pf_fd, num_vfs) {
>   			igt_dynamic_f("numvfs-random") {
>   				igt_debug("numvfs=%u\n", num_vfs);
> @@ -255,6 +283,11 @@ igt_main
>   
>   	igt_describe("Verify that auto-provisioned resources are released once VFs are disabled");
>   	igt_subtest_with_dynamic("resources-released-on-vfs-disabling") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					resources_released_on_vfs_disabling(pf_fd, num_vfs);
> +
>   		for_random_sriov_num_vfs(pf_fd, num_vfs) {
>   			igt_dynamic_f("numvfs-random") {
>   				igt_debug("numvfs=%u\n", num_vfs);
> @@ -269,6 +302,11 @@ igt_main
>   
>   		igt_skip_on(total_vfs < 2);
>   
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
> +				igt_dynamic_f("numvfs-%d", num_vfs)
> +					exclusive_ranges(pf_fd, num_vfs);
> +
>   		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
>   			igt_dynamic_f("numvfs-random") {
>   				igt_debug("numvfs=%u\n", num_vfs);

One small nit, but looks good overall:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------it9Le1IzWSuhISCqPTkOz0PG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/14/2025 16:08, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250114150848.332708-8-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">By default, a dynamic subtest is executed with a random num_vfs to limit
execution time. Add an 'extended' command line option to enable
iteration over all possible num_vfs.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Michał Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Michał Winiarski <a class="moz-txt-link-rfc2396E" href="mailto:michal.winiarski@intel.com">&lt;michal.winiarski@intel.com&gt;</a>
Cc: Narasimha C V <a class="moz-txt-link-rfc2396E" href="mailto:narasimha.c.v@intel.com">&lt;narasimha.c.v@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 tests/intel/xe_sriov_auto_provisioning.c | 40 +++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 1d2aa8624..e13eb3644 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -216,7 +216,30 @@ static void exclusive_ranges(int pf_fd, unsigned int num_vfs)
 	igt_fail_on_f(fails, &quot;exclusive ranges check failed\n&quot;);
 }
 
-igt_main
+static bool extended_scope;
+
+static int opts_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'e':
+		extended_scope = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+static const struct option long_opts[] = {
+	{ .name = &quot;extended&quot;, .has_arg = false, .val = 'e', },
+	{}
+};
+
+static const char help_str[] =
+	&quot;  --extended\tRun the extended test scope\n&quot;;</pre>
    </blockquote>
    <br>
    nit: &quot;&nbsp;&nbsp; -e, --extended\t ...&quot;<br>
    <br>
    <blockquote type="cite" cite="mid:20250114150848.332708-8-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+igt_main_args(&quot;&quot;, long_opts, help_str, opts_handler, NULL)
 {
 	enum xe_sriov_shared_res res;
 	unsigned int gt;
@@ -245,6 +268,11 @@ igt_main
 
 	igt_describe(&quot;Verify that auto-provisioned resources are allocated by PF driver in fairly manner&quot;);
 	igt_subtest_with_dynamic(&quot;fair-allocation&quot;) {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f(&quot;numvfs-%d&quot;, num_vfs)
+					fair_allocation(pf_fd, num_vfs);
+
 		for_random_sriov_num_vfs(pf_fd, num_vfs) {
 			igt_dynamic_f(&quot;numvfs-random&quot;) {
 				igt_debug(&quot;numvfs=%u\n&quot;, num_vfs);
@@ -255,6 +283,11 @@ igt_main
 
 	igt_describe(&quot;Verify that auto-provisioned resources are released once VFs are disabled&quot;);
 	igt_subtest_with_dynamic(&quot;resources-released-on-vfs-disabling&quot;) {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f(&quot;numvfs-%d&quot;, num_vfs)
+					resources_released_on_vfs_disabling(pf_fd, num_vfs);
+
 		for_random_sriov_num_vfs(pf_fd, num_vfs) {
 			igt_dynamic_f(&quot;numvfs-random&quot;) {
 				igt_debug(&quot;numvfs=%u\n&quot;, num_vfs);
@@ -269,6 +302,11 @@ igt_main
 
 		igt_skip_on(total_vfs &lt; 2);
 
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f(&quot;numvfs-%d&quot;, num_vfs)
+					exclusive_ranges(pf_fd, num_vfs);
+
 		for_random_sriov_vf_in_range(pf_fd, 2, total_vfs, num_vfs) {
 			igt_dynamic_f(&quot;numvfs-random&quot;) {
 				igt_debug(&quot;numvfs=%u\n&quot;, num_vfs);</pre>
    </blockquote>
    <br>
    One small nit, but looks good overall:<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------it9Le1IzWSuhISCqPTkOz0PG--
