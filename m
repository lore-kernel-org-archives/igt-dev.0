Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41643CCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 06:36:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF9D410E0A0;
	Mon, 27 Oct 2025 06:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cRW3Vwhr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B93D210E0A0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 06:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761546979; x=1793082979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IfCw6gHeeG3AeyoR3TpxT4xkAiMdUGS5jc9FgIdMC8E=;
 b=cRW3VwhrgOnM++RYYdl+6icsuy2rPDmrslP0ratVvOw2hThv3pp+MOVi
 ObKTEQ5nt0SIlRMZDdvIjXol9YysSVhVMe5MWXiH0oQ5N8ufUhlggm98J
 IGf3STDo5Smp60V68aE6LEzoRYWaw13N5bhd5Rep0aszWUUr0/X65Yqgs
 3zP0O/nNgpBcoKq/O0z6cGrBK6GQbASa2Ea1UdRbVr2dxz4bv0VEr9k2S
 oPyRmT3x4B16DgMq98Qlz5sJ3iVB07kpfpPcqghJiPoCT4O5OlLVLua/S
 idTPKgymwKxfLoyupU1itUG9ZCa6t8R15lQyquo84raeSTQqBUlrGlvtI w==;
X-CSE-ConnectionGUID: Z3N2ie8TTO6MTq0OW7kNjA==
X-CSE-MsgGUID: 8WqkM47+Qe2WFipTOYvspw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63520790"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63520790"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 23:36:19 -0700
X-CSE-ConnectionGUID: Q0HJO3eRQNilxS7Lx1M9ag==
X-CSE-MsgGUID: a+uDVTukQ2Wah+ZxcIIxNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="189333243"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 23:36:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:36:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 23:36:18 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.41) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 23:36:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M7IXktL8jqH8Po+Cd42QyGUc0kZkumrOs/zOkDDYcZLvy1i6cJ3Dvg3677izTpymP/Pghaj/w3Qx0fUY0qGN6ZPPLWdpwc66m/XdNNSQOZqF8qEgocirTmvuGqdYi6EeoTYHSdl5kOUVAgGptrb/MZnZv/XVmzbXUNbjQr+SwP4RfWK9+PAjUngMTqd2Z6dQeqcBBLZ8FcckGCt1J+4xLMjzLNZR9MkvdvYd90C4I610v7gHTt5yCmMKyKs+YF6yWuTsM+XK5EZy6Q2r9taSf21wQ+MujabvzXHR8VijKVSvDWbj1c7p47CIVvA1LtROU+DUgML8zSrXxgvrRvlE0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTD/DNF86/EUqdHrcXfrXxq+GqvebRtIyLD2A+DuFaw=;
 b=TjFPAqtA8DhHQeGX1z0Nvs2H7w1oul77r9aIHBC5ZT2nehHC3a58hlR7qSHu/+p0GKL0cNX83IHO5cGpUaCidgd9glsZUfLpYoq38YozzF+O6kHiYP0f8GFx9ENoIEhEGf0vydw1qUz31il9GxYydZW7Eg8mV3RLoxRMPLvcGQ3Rq+Rmc7JR5XEt0zpI6+xQX+S6yKIqvOfctGhpjzJXNj2i5NfFKz3BeXecoiWXFIk9Vl1UHBPGDz1F2Jae457xWT8T+A+PzPyeFiV0ibfZLQLWmhnQk1v2B4rVyfFV9V0U3KT0P/+6ck5RY3OpRz1s0vkHBBdc1IeGyKyfq9oXCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SJ0PR11MB5168.namprd11.prod.outlook.com (2603:10b6:a03:2dc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 06:36:16 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.9253.013; Mon, 27 Oct 2025
 06:36:16 +0000
Message-ID: <0ff43dfa-5fc8-455c-9b51-4857656f55e6@intel.com>
Date: Mon, 27 Oct 2025 12:06:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 2/2] lib/pciids: Add NovaLake NVL-S PCI ids
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Matt Roper <matthew.d.roper@intel.com>, Gustavo Sousa
 <gustavo.sousa@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20251024121517.73013-1-kamil.konieczny@linux.intel.com>
 <20251024121517.73013-3-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20251024121517.73013-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::22) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SJ0PR11MB5168:EE_
X-MS-Office365-Filtering-Correlation-Id: fd520eee-acc6-4d9e-d7ff-08de15232128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGNIUXAweGdacEF1WWwrY3FURitLUjZJeHVURS9EbndNSGJUNDlUWFZtcGQw?=
 =?utf-8?B?RXhxTHhBc1VNNTFUd3ZTNXpvNUJvT0drc3Mwb2I1NUU0VFF1ZjRWQlZvSFJH?=
 =?utf-8?B?NUtKNmFMVFBySjBJaVRZcUtYN0ptUGRsM2hKWXFmeTRCK1dpclNUV2JqZ0dH?=
 =?utf-8?B?ZEQ0Y0FRMzlwNjJFa2Ywc2NLeTE4Mkp6T1R3S0N3MjlnK1ZjbHhtRTltZGpC?=
 =?utf-8?B?ZktwUzhvY0hIMFdDVXlDcG1seEhtWEZ0bmlmV29rNHpZV3g1czJjeU5ad3pJ?=
 =?utf-8?B?cDBCNGlhSno3SWNZN3VoZTBoVmR4UEhTWUZrT3JaYVovaVo5dVdYbW5kNm10?=
 =?utf-8?B?OUplc3p5aXhTYlQ5TE5UOHRsQ0xFaG9MeFZjbm5oQ1N4N0tJS1d3RW5Ea3lK?=
 =?utf-8?B?VlpFaGFsNGR2TVI5Rk1yMkZOUlloRllTOFhld3g1VnpIUTN4TjV2MzFZV1Jn?=
 =?utf-8?B?RFNpQnAwZElCVE56aDJMa3Z5V1R5UEdLekpIRE51K3BncHhsZDlHVGVzYnUv?=
 =?utf-8?B?b1lWOHR5SGNFUHVYV0pWZTB1Tk00N2dWM0UyOXY0K3o4Nmg2WUxVeFdmSXhY?=
 =?utf-8?B?bEhOQmgrVFRocHhTU3ZPYit1elQ0L2lJSWJGQnR1UHBFLzZKNHBqZ1RaQit2?=
 =?utf-8?B?anVPQWVrU1VUMGgzWmM2T3VWdVUzQVNXUHhuODVvUERaZXNFUW5GL1lZd3pO?=
 =?utf-8?B?Ulg4dDAzL1JtVmcrNHhGOVRyWHV1UjNEbDJJcVJ3K3RpSjFaQ1lydzIwTmpi?=
 =?utf-8?B?NUZFZWFISjlaY1VISysraUxKVGVIakFzM0dUT1hRNGR5Ky85L3NJaHg2cWdh?=
 =?utf-8?B?cVlPOC9qNnpxR2ZUNWRXK3dzU3hFR1ZTa0ZvcmtMSVJ4NE1IOU4wdUs3U0Zo?=
 =?utf-8?B?bUZjbGxWWUZ2b2o0cjFwLzdEdGpDaW5tZDhDK0Raa3FSa3M2dXVnM2lWRGZh?=
 =?utf-8?B?cFhWc054UWsxQ2FrUTFOcXMyb1RGTFU4S2dzam9RSXI0WTlxZTdLOWNwb2c3?=
 =?utf-8?B?ZnAxSVNCMFZ2RFNPUHhyOXVibHMwVkZBWGpFb2tjZzl2cGFIbi9uWEtxQWVQ?=
 =?utf-8?B?YUxIdFE1aDY2RHhzQjB2ckNsS01PczVYUUpnbVZGaU10b1c3K1BYUGJSb3A5?=
 =?utf-8?B?YWlwZTBBbmltbXB6MXZqTmgwVEZ6a05qeGtyZTRXV0NLU2txSk45QlU2WDRw?=
 =?utf-8?B?WFFCSzNMZEFtUm1LaGRnVE1WM2J6WENRbXRqM0RCTkh3QnB3aDduUlpsMzJ5?=
 =?utf-8?B?czlGeFdwVkpHbkNwMVpiODYzN2lMeGpzSUczMzhLcHhRcnpBeXdWOFg0Z3Zl?=
 =?utf-8?B?Wm82YjlPSmYwZE5SemRJOEt1YURPY3ZaSmNnZHR5ZkRnN2VYNFpualJkQUhz?=
 =?utf-8?B?OEZBQ1NCQ2JaVVFHalBHbklhUldRV3ZzRHJEem1QT215M0RUL2NKb3NuZ0Zj?=
 =?utf-8?B?blZ5OTB5aE5GdDNYMGF4QlJzQTEyV1hXMnZ4VVpYTFhlcFNtTXZ5S1h4Znll?=
 =?utf-8?B?d05qSTBxY0NGRGQ4eVNTYU5ES2tROUNWMW9yQndHaVRJLzY0bEJPWC93WHZT?=
 =?utf-8?B?RmQ5M0o4WDNrdHd2QnE4NkVWUHIrMUxUaHdLaDNtTGJoTHdIbmVmQVgyeCs1?=
 =?utf-8?B?cmE5eUhsSEpTMmQyd3F6ME5iVGhucDBVdmhuTUkyR3FqcVl5d0RlcTU5Z2xQ?=
 =?utf-8?B?TjMzQnRlODg2U3M1VWlTeHU1RnZsSk9McURzTWtjQ09MVUU3R3BjY00yeVpE?=
 =?utf-8?B?cGd5SDdneGRSVDFudzkrNlpXUUE5WDBKSUhqR2l0M0pHdjdqT05GUUltZVdt?=
 =?utf-8?B?U1I1cFYydTVISkgvcUlTZE9HcDNUbUxEemdqNXdrdDZqQm1LVk0yRDN0U1RI?=
 =?utf-8?B?VUlkczBaSXI3dGtyQUt6c1ZYbFgvdWJ3Mithc05TYlpVQUswODdwbzZxSkJz?=
 =?utf-8?B?MUhRcmd4SHdTdldaenp3cUZ5MU43YWtrU1hDSmR5cy90cU93NzhRbVRoUCtN?=
 =?utf-8?B?cEFSRGM4QStnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnZveVZFanJiWkIxeDVXRzV0c1I4Y3ZEZ2h6aERVZHdYZFFwZElBQkplS2wv?=
 =?utf-8?B?NGxKRXZBYUhQc3JLMEU0WVZERkFHTTZWUTJEY3dmRmd4SVQyNTY2UVVMU2k4?=
 =?utf-8?B?VFF3YUpNR0lPVmthNUt0WlQveWRpMEI1VWNlbGMydC84ZkxIUUdxcktnRVRQ?=
 =?utf-8?B?eCtWMG1QcWh2ZitPclFtYmFUNnFmNldralhpUlltQ0N3TGJadHc1M2pNdldh?=
 =?utf-8?B?bmVpaG9INlNMOUJyL3VLNWZxdzlNVDc3L2FwdUthUkh3ZmZZQmlyeWU5YTVp?=
 =?utf-8?B?NlNCQVdvQUVBVElHTFkycmF3aWcrc2tucWp1UzFjL3BDQ1MrZWRPMWFMTUdX?=
 =?utf-8?B?RG9JWlhkVWQ0Sk4xd2FDQ2xrOTd0WGZVdnFtL0ZwWUcxS0ZRS3BIN1pRcEhp?=
 =?utf-8?B?cjBhWjlJUUJkRkJEcEhBRkFqc09IS3N4ZVhCRzhPMlBVd2ZzZnE3QVZkSm9i?=
 =?utf-8?B?R29oWjVkUDBnMEF4ZWxyTmsrd0U1Uyt3QytocmdldGlSY3oxLy91cnk2U1hI?=
 =?utf-8?B?a3lrckxOTldJcTRwWTlYd2d2QnRRWmxRTXhyY3V2ZjdCaXFMeG1HNGJMaGxC?=
 =?utf-8?B?eXVTcDhMeUg0S1N5bkYxc2QyWlJpYTRzc0tieEpyQllveW4zRTVWdkphL0R2?=
 =?utf-8?B?ZXZoc1BVQTA1bDlEYWNIdUtRMHRDOTNwRjNDUDkrMEVoeGZaemdTeGtWVXRU?=
 =?utf-8?B?TDR5K2kzOG9IVFYwY2NOV3lyaEs2Ymh1WjFhR0V6ZkRLZVFaQzh1c2xEV0Fk?=
 =?utf-8?B?MjFsRURzZ3prOXlUK2hrT2I5Y2NndThQWDRudXlJTzkydVM2djVmdHJ0WHBp?=
 =?utf-8?B?dHVsRVErc1hCbW9QQ2xTckhycXRsZjRjVjQ0R05VQzExOFp1VE1ZSjBXVk9D?=
 =?utf-8?B?QlhnK3pDdGNycDVWa0UxNklzUitkUkNORVRtalNBL0FhcG90aGM4TmlzeDla?=
 =?utf-8?B?WlhtdWJPZkY1YXVUU0lzVEtwWDBjbGJjQ1M0bnZxTlQ2dWZreXp1YnJlRkVt?=
 =?utf-8?B?TWMyZ3d6N3pEZkRPeUdrTUFRREJtNlg5NUh4bVZuajRlZ0NMejBXZ2FmejQ1?=
 =?utf-8?B?WmplMlVTeDRoeElITUt3cHk0eGtHYm1VTzg1Ri80TUJaTjdHVnRkTFFSUGNQ?=
 =?utf-8?B?cUp6SUlEclF0WWY1Y3A2UzJKWUplUDRTZGY1dlR5OVJ0TllEam5Xa05wYXVB?=
 =?utf-8?B?OEgxdExSaENELzl0YnNEYVdUdjcvL0lRUWR4NGZpVVhOVW5ZaU1lbFJZR3ph?=
 =?utf-8?B?NDRTWDlCUnVEYUp1aUFoV3dTZXhJbjFYYmJiRnNxZXR3K241dDNtSVZyREw2?=
 =?utf-8?B?a25HSnZxYzAyY0FkcW5EQW96N0Y0eGRyZVY3aytjZmJKbG1pV1llSWJQb0My?=
 =?utf-8?B?TytBMVFXbmR3dEJVOVB6OW1IaFBxeFFoWVhzeU5QeEtBUFcvQnlvcXcxaDBG?=
 =?utf-8?B?L0RLa1pTbE1rZHBwNmdQc212Sm5kSGFneDNoS3Nma2E4bkdJSGZvV1dFaFBV?=
 =?utf-8?B?QzhVTGlsTUVaWjNpYmIwc1VJMi9WdkRXNUFRTzdlL3cveFdoWEg2SnE4TTdR?=
 =?utf-8?B?b0N3dEdiTWhBZUIrYzJiUUtEWVI2bG9xY0ZqRFFlRGdQSzN3bFdEdDZSbUFq?=
 =?utf-8?B?aTRCdjB5TkQrM2VNWWxPZXhPaExHZUVpaXNWNHc0RGNrTnJLMGpEdjI4M2Ew?=
 =?utf-8?B?OG1rc2IvcDI2N0lUNzFsd2hvL3FZVzJBc2xPMzZyVFVyMXpkaUdZVll3ZlNk?=
 =?utf-8?B?bGQ3WXMzOVBReVlVaklkR1UybzcxdThhNXdKeTdxUWNxcjVUZ2ZnZFlYbHg5?=
 =?utf-8?B?eENaTlBzbS8rK3JhSmVEcS9VN0VJOXgrM1Z4NmZzVURCUGtjWVNsOXovcGE2?=
 =?utf-8?B?NlBPZEFlaTBjNmxNQytqYUs0cU9pdE9kV3RvVzRUbXpoOTNMSzVOYWdsVGFM?=
 =?utf-8?B?MkZHcllGWGVteHE2amd1UGR4L0NHVUhoSStDOFpVU0tFT3dSZ0ExM1VGR2x1?=
 =?utf-8?B?TFlJNDRySGpZL3VXUEg1NXY1RWpPUW8rc1NJWFFwdVIzVGZWcjNsbVJ6U0ZG?=
 =?utf-8?B?T0RSWG10Nkg2ZEVRb2lMUHUwWktKOTh5cmxiK1RXZFZJZEZFcjMwcTNiVm9S?=
 =?utf-8?B?aCtwR0ZNaHk0d3VpNnVmYVFUQzA5S2dvWG9LNUtiN3h4cGpXNWp6TkZzMlBq?=
 =?utf-8?B?NHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd520eee-acc6-4d9e-d7ff-08de15232128
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 06:36:16.1545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6JBuKAANQjUUDs6f8Z1SroaiNPLwaZxAct5G9sD5WBG8Py9rdRkvcVa6nwAoxpSDTJAkeFQFd3aGeAGeYo4e7KTvFnKGOkzVDiygbAmr038=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5168
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


On 10/24/2025 17:45, Kamil Konieczny wrote:
> Sync with drm-next commit c002b1764e7b ("drm/xe/nvl: Define NVL-S platform")
> Link: https://lore.kernel.org/r/20251016-xe3p-v3-11-3dd173a3097a@intel.com
>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Cc: Gustavo Sousa <gustavo.sousa@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
LGTM,
Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> ---
>   lib/pciids.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/lib/pciids.h b/lib/pciids.h
> index 0cd12616d..9f095a99d 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -884,4 +884,13 @@
>   	MACRO__(0xFD80, ## __VA_ARGS__), \
>   	MACRO__(0xFD81, ## __VA_ARGS__)
>   
> +/* NVL-S */
> +#define INTEL_NVLS_IDS(MACRO__, ...) \
> +	MACRO__(0xD740, ## __VA_ARGS__), \
> +	MACRO__(0xD741, ## __VA_ARGS__), \
> +	MACRO__(0xD742, ## __VA_ARGS__), \
> +	MACRO__(0xD743, ## __VA_ARGS__), \
> +	MACRO__(0xD744, ## __VA_ARGS__), \
> +	MACRO__(0xD745, ## __VA_ARGS__)
> +
>   #endif /* __PCIIDS_H__ */
