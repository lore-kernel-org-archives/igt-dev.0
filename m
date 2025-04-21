Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD4DC369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 09:16:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA80910E252;
	Mon, 21 Apr 2025 09:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tqp/RknO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69BE10E252
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 09:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745226981; x=1776762981;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oymgCk/DKGlnkROyZzB60OYvUGLuZF3Fc060yTnXBbk=;
 b=Tqp/RknOadsxYyMECfywMoL118gYsO3/3V1xakguq9gxyXBv9JvECpNq
 zmjbMA8Qr0zXS4zbBLsMmbc4MY29l0vtvvgKEG8qMRpi6FGkhT7oCWtOH
 N7CeDXFwAaf85QD8NWLEninBKZRBmr9dwaWKVC9it6kUfsSDZriJtVIGk
 XDz/QV9AuUz0J0wuU5MgFUBf360pu+EofTJMR/S94jQP2TYZazjmgoonh
 vBBM2kq05VMfb/6WIMJnNYdbz8gmXS3/OEknWkbkfUX2fTcQmPdEG8vC3
 PdoABlxyVsG/jLTT+VLIiV8sPVBJ91ZUmuYp8jhnIHos5gkVv9hAeQxtn Q==;
X-CSE-ConnectionGUID: NlrP6OCHSfi86o1qElx3Yg==
X-CSE-MsgGUID: LgULLOtxRx6B7wVRlJpgRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="72146406"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="72146406"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:16:20 -0700
X-CSE-ConnectionGUID: 1U5x+DB8SwqpjQOQz6aBQw==
X-CSE-MsgGUID: 459/wMi1QPGFUyLGsK5WdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="131686030"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:16:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:16:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 02:16:19 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 02:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZeBhNRiQO2A5b4GeYOPrep6FvIXpv0AgecUW4bgtT5DhB8ecfT6+lwFhos3lwtHg9aGraAHnwO9mA+5fhwVLf7tUTCDNOZ0LSDTGcOULbdFjuqBMZDO+FuTjJ8QSV3NQI3bW3V1UXYQOHXSIOsyyIvr1JsTJ3VUveL/b5yiISNBfXcHAFFMamXthnkqiyqnSbw1BpZS1kub35mEAWTNPAnPe3YRXOjE9mPuJrLHq4S/0Ok4Kso1/+OBHthle2bgCV2RobaPga9f6GJyTnwxlJCivOaI6iJtRPqAII8HctYAnh8jOgHeRR0TZ4Z+4ZgazxNeThsedburez0nrKl2Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZysZUr2TpXw5eIypOu2QEJ9RLNIBl3KH4IH0V3hIjpo=;
 b=kIi00bIi7CWZ8YvgECpgFGt3OSzNDbjFc2MrcGzyyyBqTptHAlMZA/iAy3agch1bih+27U2V77dnt1xvfK+zdFxJ77CC8Eos/mk9IKNBJg7h2Ezfj8dSTg9U9nd8TibTUS9vI8R5n+kpj0saYVNosYRYVnTTRykiySvE4uys8MDyzH1/I3OkLie32fbTuvXWz4JwVxyqUnZgKVqtsupTGrM9HpkFzLIDe/xQfg81HXjVEXrDX3nJnaO4FqZ7y5NjZqm+RDcEHN9WEIwR+vHKjhFV72AC0KfRdqzrvF5wC1fi7MCa2E8ExicciczSQFtC6UiqJVJ2xYCnnkEKsRICyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB8354.namprd11.prod.outlook.com (2603:10b6:208:48c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 09:16:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:16:12 +0000
Message-ID: <7a150385-b901-41d5-8089-d605d259ad86@intel.com>
Date: Mon, 21 Apr 2025 14:46:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use tiling modifiers
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250416150348.2901159-1-santhosh.reddy.guddati@intel.com>
 <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250416150348.2901159-3-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: c76c03d0-1eed-44ef-3dd8-08dd80b528d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjFvVE9HUU5WVUltalFmT21meEhmVmEzbEZLSUNGK2VEMjMzd3FEV1JZODF5?=
 =?utf-8?B?S1M4bUNBaWZZQkYxd29iblViUks5WTBPSERkdFB4Y25XYlZjWGlmNzdXNWFr?=
 =?utf-8?B?dk1XRlVod3dKVzdaV3Jpb011bVA3TmJ6TlFQUStvT200MFhDYWQ1elB2bDZn?=
 =?utf-8?B?WGdrMG9EOVFhK0VQR1VOZ0pzcE56WXhVTlJwdlN2Qkx2M0RlWlp0VnlwMnRE?=
 =?utf-8?B?WHBKL3BkUkNZdGdvWUJmbThRTlVSSC9yWXZMZlNQTTI4WnROQzQ4T3ozZDJP?=
 =?utf-8?B?cVRzNmIrVCs2V0hUdXpEMGgwdjRya3VjbThONklyeGU3RjFyUjFUcU9yc3pr?=
 =?utf-8?B?eGJHWmJBa05iaXZRN3I0ZlcrU2MvWlBLdDNUazRwR3BqUHlIMWlrcERDUzMv?=
 =?utf-8?B?bkxFMy9PV3FURGZWZEFNSExyaWJiTXZzMU1Na0NWa1ZoYUFvTTQrWU85UjZk?=
 =?utf-8?B?SHptVzdDL2t1djc0cVFXeWtJWTREQXltQ2NmeEFGcm9GSFY5SEFDamNJUmRD?=
 =?utf-8?B?dTRlYnJnU2M4L0ZJeFE3Rm9WT1dQYndQSkhzWEtZaHZldHBRcUsweURiK0tx?=
 =?utf-8?B?K3RBNmQ1NW9wOWI3NWIrTzVndzY5SlpOL0NGYkhIQ1ZTUU0xWFU4VTRWN3FG?=
 =?utf-8?B?SkNQa0dmMFNjYUI1U0lrY2RKK1dxZCs4ejY4dldHSThxcG5nYjU4RmpFTFA2?=
 =?utf-8?B?VG9VcFh3SFhIK002QmluV0NnbjNlR3RnTEN4NUZzeC9jc3kyTXgra3Vwb3l3?=
 =?utf-8?B?QmgwU0p0VVYxc1d4ZVgwbWpWVlZSM0NLQWFndTh6NjU2SlpBUHJiMUduNEFU?=
 =?utf-8?B?SXpyZkFmcGc4R3VpeG1BaXRHM0xjZXBRWitCWGtFNnJIVW1nbVY4VHJaYjdF?=
 =?utf-8?B?Y0dWK2c2Yk8wb0ptVHdkV1RFS240WlBteU1vMFp2ZTAyVllING82ZWJ2aGdO?=
 =?utf-8?B?em9IczdjOVBvL3c2MDNjdTNqWUdCS243TkZkWHVLWHJkN1BUWUNFMjYrSDRx?=
 =?utf-8?B?Wm5tVTZSUWJKZ0sxQmMxMTVXd2NxNnlFM2IraDNDR2xuQlg2RWVqSnlpWUhz?=
 =?utf-8?B?QTVnZnZMM3g0N3hzb1VxSlVveGVCS2hUNStvUklqTFQ4UEZ2SHhnVCszSXVV?=
 =?utf-8?B?ZzhwQzdsOFNEbjNPM3pMVkk5MnN4dGZtVDIvcXFNQ2ZQME8ycXdrL0NxQTVY?=
 =?utf-8?B?czVka1FrZEJpMStVS3h5RkRzek9hWEs3SUsrUDFnMUxkcXJLR2ErY0QzYmtE?=
 =?utf-8?B?WitjUm40bzZiS0RGaXFLMnlpT2c2cXJnaUM3VlBLa2VTUEVzV0lQV1ZJVEVk?=
 =?utf-8?B?SC9JRTBGb0NSOUJXUStLODc0SkpWcTcxSExkUytVK0l1MUFHTGhNeWwrWSsz?=
 =?utf-8?B?YWhhSm4ybTdyYlBGcFp0ejJGQjRGT1hHWWNJem1rYjRoRjlTbU9FTk92aVBz?=
 =?utf-8?B?ckxvNmhNblJvWnB3U28yN2RLZFNIWFl3d1RXVDZxcmtodWEvRkVXMERtM0ZU?=
 =?utf-8?B?YTZIRnlmeTdKOEZmRXlpRkFEYThhNXV5VVdaeitleDRXNXlRajNJRHZ0YTVu?=
 =?utf-8?B?b29Pd0JDZHJQNzJzeEN3cTFqeXcra3hXckhHU2FnbmZicDM0UHM4YTVVRzlh?=
 =?utf-8?B?eXNsV1VRTEFZb0pzQUcvMFRocnErYjl4cWE4Nk5WUEdPV3ZOQ1I5d1FOemNN?=
 =?utf-8?B?UjZEcnVwajhscWxWaHQ1cU1teUtYckJ0SkdVbGRnTUhkMUpUTW5WT0RXSjc0?=
 =?utf-8?B?UWkzbXFnUG5GYnhyS3J3ZVdwTDJjQkRWRkhTMDJyVXJBOUhBdmllTERTd3RL?=
 =?utf-8?B?K0FuVk0rc092bHhPWVlXOHNaTlFkckVDNGY2YzVuN0o0cEJuSnN0TFVVakNw?=
 =?utf-8?B?YnFMQk1zb3psdmlqNG9vbnFtWkhsM0x1NUQwSmVDMWtxbjB2bWh1dVA4Mmwx?=
 =?utf-8?Q?gp42JUl70Fs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnQ0RGJPbVdJcU5sVWVMMVhDanBtTXpLdS9VWTZRcW5FemQyeGNPRVcybkE3?=
 =?utf-8?B?UXc2WHROc1pTeHh0UEJXRmRuYURWUjVqU0hIRmlBQUVQWE50SU41TmZRQVA1?=
 =?utf-8?B?ZldiVExTTFNlazJ6U1BPRTlHcVNHUVdzY1JXc1FWK0xTcFltUFUyTjRreGFE?=
 =?utf-8?B?dzBuU3oyNVRoY3daM2xDQ0FYV0MyNHJwWG1hZExMSk9BellQVVhQNlNFRnQw?=
 =?utf-8?B?UlpRbWozdzVvYW04YWt0cVZyS0oxMy8vLzQ5SjRHd0VNbFNjL20vNEg0a25F?=
 =?utf-8?B?YVg3V25iM1IrUk91WFlxYlJRdTlaSHlYYnFtZ3ZTeGk0bTJvaFdjZUZRRmRF?=
 =?utf-8?B?ZDVnNllwQTk1MnArOUJFemZqSVlUNDcxcU11ZFYrWnpkcDRLdkc5Q0hIWVAv?=
 =?utf-8?B?WEc4ODBWL1h6cGVrMGJKTU40M1V2MjlneGNyYWZBemY4SzBWNGd3c0RhZHhB?=
 =?utf-8?B?NFFiRzdPaVg2RkhQRFYvdExPeG9KT2Z1djFrekl6bzZwM01aUVFZam9sMWN5?=
 =?utf-8?B?SGJiM1FtaGZRcXQveENRN1NTblVWWkR4NVBwbDFuZ0RNSmZEaVdOVUJ4TTF5?=
 =?utf-8?B?NWNoSm1STUpkODlueGIzaG1jNnp0QXhYdHpBc05hU1ZMZmRlRlJhaFJBc081?=
 =?utf-8?B?WWlKdERWNk1IRlVxM1A2RytsaThpMVpGZW1yOG1nWFhIbHhhVUUzeDBHcDVi?=
 =?utf-8?B?MmN2U3o5dnlNTkJxMVdHb1oxMHl3Ny9qTkhPb04reG9qS2hkM24rS1FpMXV0?=
 =?utf-8?B?MHNscGJmemg4aEpYTTMyMXVGbSs1MU9yL0UrdXNwSC9Ob2V6MVhGQjN6R1Z2?=
 =?utf-8?B?TVhJWGpSSEE4T3k1ZzRWMGVzWUxuaW5qUUxOT1lPRSswbURPdU5kcWdnSC9M?=
 =?utf-8?B?ZUFiZ0JEL2NDR3U4TmMwV29rcGwrRzFVY1ZZYy9ibTdDNkNEc2szLzNtSGZQ?=
 =?utf-8?B?dXpPK1RIbUZqelVEaDhEaHU4VU93SlVHTW5lWXoxbnpTamFwU3JrK09JUUxF?=
 =?utf-8?B?dmUwWGc5YUtjQ2h4Z0F3QVlZYURnZk45ZUFtWnZJSjBrSGh4MEF2RFdod2JL?=
 =?utf-8?B?ZUgvUTVpdXd1a2tLaFNNcXlBdDJiZnZZSk90OVNmM3VFUWMrTllJZ3grM2t6?=
 =?utf-8?B?dVRsN1cxN0QwVkVJQkVjUmsyZDhOUzlmeWR5T2JkdWcwNGRTVWdnNWw2SCsv?=
 =?utf-8?B?cEJHOEVQZll6dXpBVmZpZHMwK2FKMDFmcnJ2VWQ3QUVNS0NsaGJnSVcyMFMx?=
 =?utf-8?B?emxzcnJFVHN5U1cvemJxbml0Ry8yaE9Ma2xJWURzUjMyODFGUFhKTkhEcG5V?=
 =?utf-8?B?aEkzSnJ3V3o1WU1KUjk1dXNudm9SanlBME9JZVpBZ0VIUEEyWFR6MVFOdlFl?=
 =?utf-8?B?anZ6UkR3MFFibTNabzZwNXdiNS9WVWt6cGVuZmdicG1ubGhIV2FXK0h6b2Rj?=
 =?utf-8?B?WEc2UEtkOVdWUm1hdVppUlZvcmNGQnAwaVk2Zjh6Q1lSczhYU3dxbXVXN0hV?=
 =?utf-8?B?c0R5R2R4ZDZzeUljeEFZRW5RcTZ5SFFGVnFmOXBiaGd5VFVvcTBySW9FcVNB?=
 =?utf-8?B?amUweUdUSnI1WGNuOGRqNHYwSy9kVklpcGNkcnQwM0JDWmoySDBjSVMvUzU3?=
 =?utf-8?B?Uk9WdmJuTEdCd2tyaU5mbXB4bnBMc1lNMFQ0SU1rUGwzd2kxQ2RSYjFuSGU3?=
 =?utf-8?B?ckQ2OGUvWE5hZEszRk5CbVRMdzlXRnhib1RLYWhOdUdxdm5rL2NEcHlLVWV3?=
 =?utf-8?B?Ujh6YmlxaXl6OFM5NXlQMU81di94azBaMzdnMkcrbFlJblFDVXR6MDc2TmVz?=
 =?utf-8?B?emhuUytCMUdnRFVWL1lKSEdpZnNTMDJRSkNlSGgrbDJzNVE4NTJXTnE0Y3hh?=
 =?utf-8?B?UE9tK3pGWlEwZTFYcDJta3NvOHFNdkE3NnBpR1pnTVdwQW1lckg1UWVXaERU?=
 =?utf-8?B?WXEzNDNjb3ZNdFRYajdaVzN5cjNCd0t4Y1VSamMwMFU2M2MwM0k0Q2pqZm1P?=
 =?utf-8?B?Zk5PUzk2dHBYU2RTb1dVamRJTjdYR3FoYlQ1TXZuUGhOM2ZKVnFrN0JXSjFx?=
 =?utf-8?B?MmtoTElJUitVdEFwN1JYaG9qT1pHZVlmUlVUb0RqYVpVY2ZySCsrdGpxV0FE?=
 =?utf-8?B?ZWxGUjd1alRoUWtBeUsvVHVjSlhWdThnOWhmUTZ2bVd0MUNBeXo1aldyZVRy?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c76c03d0-1eed-44ef-3dd8-08dd80b528d8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:16:12.2496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24dmEIca5qj8d4mPeCk330sfkUbZkMbkfdf0ClhXd0HL7t/xa6/hvoIh32H1Wl0VoWglAKOiZr1n+KnpWMdsfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8354
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


On 4/16/2025 8:33 PM, Santhosh Reddy Guddati wrote:
> As async with linear modifiers is not a practical and common use case,
> override the default modifier with tiled for all the async flip subtests
>
> V2:
> move handling to default_modifier (Karthik)
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index a3defe604..51afae8e9 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -194,6 +194,9 @@ static void wait_flip_event(data_t *data)
>   static uint64_t default_modifier(data_t *data)
>   {
>   	if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
> +				       I915_FORMAT_MOD_4_TILED))
> +		return I915_FORMAT_MOD_4_TILED;
> +	else if (igt_display_has_format_mod(&data->display, DRM_FORMAT_XRGB8888,
>   				       I915_FORMAT_MOD_X_TILED))
>   		return I915_FORMAT_MOD_X_TILED;
>   	else
