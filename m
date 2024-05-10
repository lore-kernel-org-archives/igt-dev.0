Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC19C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 17:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C24A10E060;
	Fri, 10 May 2024 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BNkgiKXP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A15510E060
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 17:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715363911; x=1746899911;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=mzflyNiyfWugAnSRFVIhKcvJFw79FGHHi4Sg7UDCARs=;
 b=BNkgiKXPTFE9Ih0SiCTAy5RTK02YLW3pFWN78x9i9WNZ3tJIArFD4Hpa
 FHXKgB9ejX0DLrzSBm8jsXoWME+uW3d37APl89IuPS5gaSo3lmZeos0im
 INqqQKPIcy6N1OMDQmG5Ku8UpBpvca+0cn7+YnEl4i+GPMyEz4vxRicyR
 CkWb+afAuaMUclb6qytQ6nJTJNXe+WNzk2eQZk6B+cW9jum90efQB4JCf
 AiEcqGrzvRHxp1r8ZcE2rE+YBQBWK8ON/89gON0GoXxMjjMBcCzzGLgG9
 8dsVSMY4n+7BNWcPhvpxqf6/oU9WEA5iJKCeoaGTViZ4wlzWrK/+RgHWQ g==;
X-CSE-ConnectionGUID: OkwTv/wDSiCHIJDX/lcOqg==
X-CSE-MsgGUID: wTDhl3sFQAidS6eiGvhtNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="15152379"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="15152379"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 10:58:31 -0700
X-CSE-ConnectionGUID: mxgUBLqrTe6f4feVqmY74g==
X-CSE-MsgGUID: M38pXSa1SCOAhN1ztnlgLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="29799406"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 May 2024 10:58:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 10 May 2024 10:58:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 10 May 2024 10:58:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 10 May 2024 10:58:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nabweocn4v8G8pFNlsZKeB23be8ENRhZMNNf6iLMjh49g9xQy2+QOAhsiFTxqI7PETpRcAzYs/LAW7SVBIKTkveGAdWbFAgWemDIhnlnZNtFXdaOWRLoYOXBCnrzRmoSc6DCkwkHKELc+kxbcuSry6yb8vdoSWZT/AqMpErYP33DVFrEFN94C8kqNl5713kCp4ZB+EduPTXPXfyBRXb3fYwS8ZUniXD2Ll+FCEudqjmpIz/SwLP5P+Of9DqX3VRF9kLIUY6kUMujPokCU94C3KKgrrMZG40071b5Ino5O2ZTrkwTTCmSMcnYt28Sj5fdgRta1u4DYpEV+AJ2LFaQlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zMhc0NMCTXC7iDcvMI0S04Oe556SIu1OpSdJurrYb8=;
 b=YXyM6TmQjrXSLrchQ5p4pUcfrRf+CpSZhu7spdPJukfcAD/5h3zg2/CyoibtOhAUYSCHlOxP7ECIdT5bX2Drspu+VBgjNGKZQbYgB5vEc6yGgS59OhfrvRHVGaO1gMEVoIZkH+H8O3CPgbY/7+kBNMsL2pI4UWlmB+VBWIiUlOW0UaICNj74MjPqteGvIiaEbltLCJOLE35RfpMnVV9zP+7IBN2Un21JRCvCmusI4KVWdr5Udps/I2uCHzEQcntWzFr+uXgB31juyg1IKw6BAFXmxFDu085xxdik9sfqA3nY8oxxZrvCRtZ1CwGrLIS/iuPwNZj7/fJ6ZABOZcRJRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB7749.namprd11.prod.outlook.com (2603:10b6:208:442::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Fri, 10 May
 2024 17:58:27 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7544.045; Fri, 10 May 2024
 17:58:27 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240510173726.sj6ckas5ijzbfyix@kamilkon-DESK.igk.intel.com>
References: <20240430211934.349775-2-gustavo.sousa@intel.com>
 <20240510173726.sj6ckas5ijzbfyix@kamilkon-DESK.igk.intel.com>
Subject: Re: [PATCH i-g-t] runner: Remove useless null check for delim in
 job_list_from_test_list
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Petri Latvala <adrinael@adrinael.net>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Date: Fri, 10 May 2024 14:58:22 -0300
Message-ID: <171536390281.197636.8069909280860770218@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eb1fff-9f73-4150-90f5-08dc711acb3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHZpTjY5R0FiSXBtaG9GbXczY2pZbmI0WElSMUNmVzVOcC9uR1NEWmlHZXZx?=
 =?utf-8?B?Q3NVUXpKcjVEN1Bka3pqd3hpMldWUjQ3SzkybmZHT01HL1FkcE96MFVqdVI4?=
 =?utf-8?B?TFZ0UDBGZzlsRExIWDJqZlQ5SzJTMHdkenJqaFRtMCsvbGgrZllTUEM5T1Zw?=
 =?utf-8?B?RVpnMStQN0UrSHp2SW85clQ1RVNIWGlVbTBjL3BUa2l3VGtSaWh1TFR0Y3My?=
 =?utf-8?B?Sm4valZTWGNHQXY0MnhyaXRmTHcwT1hHRnJjNFcvTmdROEsrTXBJNXRVTi80?=
 =?utf-8?B?N1BORk1yUGhrVW01cmtnK3hoVkhJcUNhY1hCR3d0bUFSRStjcldPUDJJcjEw?=
 =?utf-8?B?RndidUFPYzROdnNuRUFvWnp2S0QrcGhjeXhKUlZ2Lzg2U3A0czNYNnBJTkdl?=
 =?utf-8?B?Rjd4VnJ0RmRrVURoN2pVL0k3dWp6QTVFV0ZLUjliMm9qZHUxa1pEVkV6Q3lo?=
 =?utf-8?B?WEZzWmFMdnZaaGV5OGU2azY3Ym96WVA5cUZrTDJ3VHJ0UXlkZ0Q1QlBjdTdN?=
 =?utf-8?B?ZVRVSDVIME5UMVRYWlRsSG9mQWkyZ0swb3A0SmMxYnROSG9BZ3YwZWFxdVQ3?=
 =?utf-8?B?bzc5UHc3c09ZeXNLL0x0UDkrWXhwc211N3FvUHllUkM4b0t4SHFuZis5MlBM?=
 =?utf-8?B?QUVPczhOZlAzeW1VcHdiTkcvQ0ZDbk4wUnlmdDU3K2haUVBTNXBvYnBIMTNI?=
 =?utf-8?B?eHcyTlVSaGl3cFNHaWZIS0tjVDUzeDMxMDRSMUpkb1Z2NW9lekRVY0UzQmRi?=
 =?utf-8?B?U3VuVXAxQlVuS2dvdERDdG51dEs5Ui83djkrNWRUdjB3b1YwQTN0alpXV0Rn?=
 =?utf-8?B?NTdFSkVudlRIbUhtSUFyeVlRU0FpK0ttOTA3a1cvMHJadTIrT2FZZko5c0Zj?=
 =?utf-8?B?bXVxOWVxdms1Q1h5blhnNVN1Ni9OajJQVVBtMlJVYjE3QkxIeW9TNzdyMHlG?=
 =?utf-8?B?cURuSUJvMHdTQ1Vyb2dpTlMvWENBTDE5c0MwTzB2R3FzTWVrZkc2R1E2YlAz?=
 =?utf-8?B?aGlPd1pxSGhCOGIrMmU0UlRBTUVoQlhwb3IvSmdBZmdtNGVtT3RnZ25uZkFV?=
 =?utf-8?B?NXJVRGdwbFFQZlZEaGp6N3dRUkJDa0RBVk5GaVhtdE11RnhiaXlEdVJ1K1Uy?=
 =?utf-8?B?V21OL2RjbWp5QlNzcmdOS1BxRGlwVE50NWk4Wm0yUTcxK2dseDc5TmFwU2I0?=
 =?utf-8?B?dHVQM1YybW4vOEljQy9DeXNYVFRMTHN0cUZUOVN6V2NuQ2R3V3ZVR0RLL2tz?=
 =?utf-8?B?aDZNaEkvYStWWnRNaWp3TklkdDZGYW1RaHZra2REL0dEZ1M4L2ZCQWx4eDh4?=
 =?utf-8?B?bUcwMUNURE5iVFZjdkI0QjRXSExKZmtJRkUyYTNYL0FmYmxDVDlKSHR5VkdY?=
 =?utf-8?B?VGtkNHlBRVZYWVgyejh1MVFzSjNvQVlaWE42QnJIdXdybnBRcFJsMjlMRlRT?=
 =?utf-8?B?U2dmSlB4S2xVTXFna3hvRUZiK2NVR25iNUJDZGp1MjYxdDk5K1NoOHR2ZWp2?=
 =?utf-8?B?bkRnaG5ZNEhobmR0TlNxNWF4bW5FNXEwcjJCeTFYeUVIVE5KQ2hYRldqaUhu?=
 =?utf-8?B?RW1ueWJrdy9BeGhraEd1NnVvQW5IWkcxRVhMRWdVa1FacVJzc3BVWG4zdWd6?=
 =?utf-8?B?NVRoL0NhcTRnd21hNnpSZnE5UGFuUEd6RlBXSHZFemtjZmVoVGNWQVRmRXlT?=
 =?utf-8?B?UXROc0IveDl6OU9IWGdNc05nYThMR2FNU1lpdzNpdm0yNXZMdWlyWHd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czA4WHBCNzhOU2tUT1pFSTNGN3grZ3pLYW9UYlIvWVVXS1VsSmpheWhndXA1?=
 =?utf-8?B?M1BQSmZnSW56ZmZVNE14N3B6T01uNmV3TzRZaHNrWGk4R2JxTjl1WVZNZCti?=
 =?utf-8?B?QnJieS9KUStibHVISXZQTTN5M0xYcy9DaTJPQnhwVGQ1dk83bkNQTUhFclRm?=
 =?utf-8?B?czRyOC9sV3FvQXp5MjJkNGlDMGxHb3pPcGlVQXV6aEpmRUJZOU0vT2lJLzBK?=
 =?utf-8?B?RWZ2WGx3bG1EU1VvOXFRbHB6ckFaTW1vQitWVzdMdVI2S3czZmR4T1d4VlMv?=
 =?utf-8?B?ZTcyUmZYcW5EYVJxeVhzM2daaGQ1QTZJY3dVT05XSDIxMiszM0pXdDNIYzRY?=
 =?utf-8?B?Z2FUQTFaYWt0RjhjdzBkRk5BckRRVWp0K3dkUWV3emFQaURUNTFrbVArcjhD?=
 =?utf-8?B?VWNhcmlIV1dQV1V2alduYUxDb2hkVFdYcEYrT1RLajFJQmxJVnFiWHVFdVRD?=
 =?utf-8?B?ZU55VTY3SjdQdFVCSjhPMjlDdjdibkVIVmVEQ3ZKdkVHWmtJTUd4Z3QwcXhx?=
 =?utf-8?B?SHpJak5ZMHMwK014MUhQQTU1azFrOHVrcTVzZnNBL2IydnNuOUZSQ05kUFN1?=
 =?utf-8?B?RW5LMGZieE1keDc2Q2tUNkNJVXV4cElnY2I3L1hqL05YcERGcHkrRElWRTln?=
 =?utf-8?B?MUdFZXJ3SlhsQjd1UVY5dlJRK0c1UjdJYi94dUo2MnQ2d1ZjR2xYeHMwaTlR?=
 =?utf-8?B?dmtGMURnYzZlcC9uRjRMekJVZ2txcXpKRnZ1R3kwQlFhR3RHT3ZMNlNxcmNt?=
 =?utf-8?B?ZEtsR3daVlovZTlDMUlMNjA3M25rdmF0VFhqZWt2dlJrdVcxdEF4Q2RyVEFG?=
 =?utf-8?B?UFZYb0NsaWlkYitkaDJTaFAvMnFPSlUwR0ZwMW1EWitQdlZmSDh1T0RxM1R2?=
 =?utf-8?B?RGZ2STNqVllMUWZDTExCblVoZ3NGVkZzbGpHK1hwcm5vZWxaR0ZFWFRyV1Vq?=
 =?utf-8?B?ZENuUDRINVZ4K1IwdWlWT2R3N01jTHpCbzBURXNnYzZmZTZYcEpNd2tBYWJP?=
 =?utf-8?B?eE56MHlMdWlySUJJdGFTbkN1WFZ2VHdtRXdHUFlhd0RwMkw3TmVXTjVqd09x?=
 =?utf-8?B?N1NRWTdXSmtqNlJPZTlHNU9Xc1dLTDBhZFFTb0U1TEdaVjFBemtTZkZaN2Ro?=
 =?utf-8?B?QWR4WlM5Q2FSd0p6U0xUUWpjUnJ6WTd5R1pzcGM3MGUyVjNFeEI4Z3Nva01Z?=
 =?utf-8?B?T1U5RnhIVzQxYzl6RXZkU25reGFOMGRyRjY5NEdVSjdZUDR4T29SWWVqUVc5?=
 =?utf-8?B?NVBHL0ZXY2RzVFpKYVN0bHRWOSsrWVUzaXF2bDJkYTEvc1B0QStudHY1TW5Q?=
 =?utf-8?B?UDFaQ3J1SmlKeXY1TythRE5NUTVad2J6UThVemFsZ0FDWWx6VkY0WmZ0RkdQ?=
 =?utf-8?B?b1NwNy9Qb0JGM2dRWThUb2pXLzNQZGtOUGJxVDhaL2VkMFRlLzZSTlVFem5u?=
 =?utf-8?B?clQ1R04rQmtwdlRpTUxrMFMvdVIyYkJvbnE1Y0w1V3g4LzJqbHQ1Zk5SWTUx?=
 =?utf-8?B?M2VYN0tQL2RpUlpLUWpncC9ZODhQWm5STTNBdzdSY0Y0WGp6MW5mTEtycTJq?=
 =?utf-8?B?dkdQbXhMZTJUbXlpQ0VBVVd3TzAzUHNNK0VGQ3lyK2VZRmtSYVpHNjF3TFg4?=
 =?utf-8?B?bFJpSUJQK0NoVUdwb2tHMFJKRjV0aFpQWWNQWW1TVWNPeFdsMjEyWjh2VERB?=
 =?utf-8?B?djg1LzMvaTRUbVgxTGZrU2JVTlJDbW03SWJaV2xYek81eGF4S3d6REVkY3dt?=
 =?utf-8?B?NHduNGplV04wdXNVT2k1aGZkbjdaTHNLYkJodis2TC9kOTdtVFRCcEoxQ2Ja?=
 =?utf-8?B?Q2k1emY2YVppNzQ1ajQwKzFyUEd0WGZRVFAwcUprMURvVG1KUTl0enF5RkVi?=
 =?utf-8?B?Mk9DMURlVlNIcmpTbWMyRjcvWitEeVdvS0xiQUZTL3hVZWhML3NsY1psQUZa?=
 =?utf-8?B?bDdCNVRENWZOaUVCU0FSK0lPTithdUI5QXZ3bUd4TmIzZ1dWd0xzWjh4cFl2?=
 =?utf-8?B?ZmF5OThVYkV1cWIzcDVkWVY3c2V2cmFpbktuc2R4OTQxTWNTR2NRMFRTVER3?=
 =?utf-8?B?VzR3cjRya3lRbFJkUjkvSEFTajJZazdiSEV4R293ZUhNVG84Ky8xRlN0b0VE?=
 =?utf-8?B?UndOVEdhLzk4c0JUeWNEUkRyL0s0b3EzNStyL24rN2gyODdVbWFBSVRyTE8z?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eb1fff-9f73-4150-90f5-08dc711acb3d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 17:58:27.5104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZgkKV+Aim8cjKrQssFskHS3V9nMj24VzI1+7NDllsIcB4JX54y9UmpFAuPbPCAVcglYpIsSlfWyEHOvxIXnEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7749
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

Quoting Kamil Konieczny (2024-05-10 14:37:26-03:00)
>Hi Gustavo,
>On 2024-04-30 at 18:19:35 -0300, Gustavo Sousa wrote:
>> The function job_list_from_test_list() uses a while loop to read entries
>> from the testlist.
>>=20
>> The condition ((delim =3D strchr(binary, '@')) !=3D NULL) checks if the
>> current entry specifies a subtest. When no subtest is specified, the
>> else clause will cause a jump to the next iteration. That means that we
>> are certain any statement executed after that if block has (delim !=3D
>> NULL). As such, all null checks on that variable after that point are
>> pointless.
>>=20
>> In fact, certain unnecessary null checks might even cause confusion to
>> readers. One example is the block meant to display the "Unexpected test
>> without subtests ..." message: it would never happen, since that
>> condition is handled earlier in the iteration (i.e. the full set of
>> subtests is expanded for that entry in the else clause previously
>> mentioned). The following execution (done before this change)
>> illustrates that:
>>=20
>>     $ cat <<EOF > /tmp/foo.testlist
>>     igt@xe_pm@s2idle-basic
>>     igt@xe_pm
>>     igt@xe_pm@s2idle-exec-after
>>     EOF
>
>I do not know if 'igt@' was always used in tests lists.

Hm... Not sure I get the point here.

Regardless, (delim =3D=3D NULL) is an impossible condition at the points
this patch is touching, no?

>Adding Petri to cc.
>+Cc: Petri Latvala <adrinael@adrinael.net>

Thanks!

--
Gustavo Sousa

>
>Regards,
>Kamil
>
>>=20
>>     $ ./build/runner/igt_runner -d -m --test-list /tmp/foo.testlist buil=
d/tests /tmp/results
>>     [36408.109043] Dry run, not executing. Invoke igt_resume if you want=
 to execute.
>>     Done.
>>=20
>>     $ cat /tmp/results/joblist.txt | sed 's/^\(.\{50\}\).\+/\1.../'
>>     xe_pm s2idle-basic
>>     xe_pm s2idle-basic,s2idle-basic-exec,s2idle-exec-a...
>>     xe_pm s2idle-exec-after
>>=20
>> Let's remove those unnecessary checks.
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  runner/job_list.c | 21 +++++----------------
>>  1 file changed, 5 insertions(+), 16 deletions(-)
>>=20
>> diff --git a/runner/job_list.c b/runner/job_list.c
>> index 27cbb10bce56..aeabb59f49d3 100644
>> --- a/runner/job_list.c
>> +++ b/runner/job_list.c
>> @@ -276,16 +276,7 @@ static bool job_list_from_test_list(struct job_list=
 *job_list,
>>                           * specified, also start a new entry.
>>                           */
>>                          if (entry.binary && !strcmp(entry.binary, binar=
y) &&
>> -                            (delim =3D=3D NULL || strchr(delim, '@') =
=3D=3D NULL)) {
>> -                                if (!delim) {
>> -                                        /* ... except we didn't get a s=
ubtest */
>> -                                        fprintf(stderr,
>> -                                                "Error: Unexpected test=
 without subtests "
>> -                                                "after same test had su=
btests\n");
>> -                                        free(binary);
>> -                                        fclose(f);
>> -                                        return false;
>> -                                }
>> +                            strchr(delim, '@') =3D=3D NULL) {
>>                                  entry.subtest_count++;
>>                                  entry.subtests =3D realloc(entry.subtes=
ts,
>>                                                           entry.subtest_=
count *
>> @@ -303,7 +294,7 @@ static bool job_list_from_test_list(struct job_list =
*job_list,
>> =20
>>                          memset(&entry, 0, sizeof(entry));
>> =20
>> -                        if (delim !=3D NULL && strchr(delim, '@') !=3D =
NULL) {
>> +                        if (strchr(delim, '@') !=3D NULL) {
>>                                  /* Dynamic subtest specified. Add to jo=
b list alone. */
>>                                  char **subtests;
>> =20
>> @@ -314,11 +305,9 @@ static bool job_list_from_test_list(struct job_list=
 *job_list,
>>                                  any =3D true;
>>                          } else {
>>                                  entry.binary =3D strdup(binary);
>> -                                if (delim) {
>> -                                        entry.subtests =3D malloc(sizeo=
f(*entry.subtests));
>> -                                        entry.subtests[0] =3D strdup(de=
lim);
>> -                                        entry.subtest_count =3D 1;
>> -                                }
>> +                                entry.subtests =3D malloc(sizeof(*entry=
.subtests));
>> +                                entry.subtests[0] =3D strdup(delim);
>> +                                entry.subtest_count =3D 1;
>>                          }
>> =20
>>                          free(binary);
>> --=20
>> 2.44.0
>>
