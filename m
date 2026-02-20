Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 122A0C54F5B
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 06:13:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CADF10E78E;
	Fri, 20 Feb 2026 06:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GOMvQf3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E69610E78E
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 06:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771568000; x=1803104000;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fTvfeIwmxuesmvPfKsGpemrqJK4/pXRgBNdSdyl2HrE=;
 b=GOMvQf3toRlQ9KwanZMU9vx0CaxFnq8Ul5avXXVYHrzELW4vDONnhOyO
 lcmfRMNbQ/xd1X5cDj0I/7P6IbvHoEUnWU2V/9Xji0cG04rRjF7EJU737
 oW4vtJh5JKmGIBln8sqXAFxuiPpubFNPVLqaDSEZoHpGlG71OtkS9ainu
 i8LArQiF7Npl+y5Uj9GelSLdrNmp+9+zRNlF/XD/VPIpHiRQ1uQqlW8Mf
 ot5TBuv5kBt2ywV+UqLAVLweWRzKbm3GqlQvSwGdcQdcSyov2LKs0QBed
 PJVFCvpeffZjJfpOTc6ntpOZfw+NeWzcsT1PIuLq9/sEgwyaIVa0VsYAV Q==;
X-CSE-ConnectionGUID: bndKbJDIRSGNYcwQKv99FA==
X-CSE-MsgGUID: mZJB7ia2Q8OQtbl+V1b80A==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60236230"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="60236230"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 22:13:20 -0800
X-CSE-ConnectionGUID: 37MJOZFCQcGtJADb8Saugg==
X-CSE-MsgGUID: Gi0RtV4/TqicH+PeemTrIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="212917608"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 22:13:20 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 22:13:19 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 22:13:19 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 22:13:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Soe+T5zCXF0wEWDR5/5ux39MqHrxI5i/NZnFuVCyTDk7b8HH5f2DLIluWyUSJhKjpSHG4sLPgQH8QUnoxeKusVXQOJR+i96f0CNLBqITWZmhDufTeBHm0Omg2BL/2a7/ubRU4fUPF14uRbAa1uhafR42VUqplnDIbvWk6Mz0KgoRvSFjeRexhYENNcZZAzUTn6C3VsstLZb+taMqGzU9BN+O8hHZF4lV+qpWCjiKz8wR+egi/+Hq7zQIU9NbiV07iF79Z+noVz7OJVU08kgoUxooX34oWo7XuojF/W79XrQVLTNOiMTwEpwR6CcXEngMEZ0cLnaP555jg4T85EOGTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0wEHTU5dCBjV1ubqZPPVrcAGpC2/tp2819wHP6y2tQ=;
 b=To/L8R4STKFIgAsYIJ4sOymLVfHtRpvTmRfslRjQ0z0NJwuSw1L1XSA8ffT6MgfuQn9z4O1HmlgBSDK+4qGhBSCExRmyGxBZ6WCSNchwxAIW45aWFX/vAT/w4CUcT8TfBAJBWAim9MOFTWj8O9flHqL3526KlzvfYDiMOjvFyvzXFTStF9YD1enzxWFV9q18UitZHFDJlwLBYmD2XF6J+y5oJMcNJdofqjjB5CRnozvsVVJnV/+JDDoZK/TiBBjTaE4+aqU+uOM/9or4vqd0xxU867sHKi1oSD4MoKYCRH9FasWhYODPkpJf5YR2FEBZpERQcn3+joHXi/XUYX3SAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 20 Feb
 2026 06:13:17 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 06:13:17 +0000
Message-ID: <203b44e7-499e-48f9-8c89-9ed01932880f@intel.com>
Date: Fri, 20 Feb 2026 11:43:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-5-arvind.yadav@intel.com>
 <BL1PR11MB55259C519FCDBF2C9EBB0E0C846BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <BL1PR11MB55259C519FCDBF2C9EBB0E0C846BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b2e574-5770-4c0a-3ea2-08de70472336
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVlucE9oY2xVMkJFVk5sWit0MzQ1SHVOT2RjaCs0QTkzcjJRK29LVWttUmpO?=
 =?utf-8?B?YjlxclhkRmYxY2xPUVZ2MERRdEJZTXhhdUxUWXZxU1dycTRXWE9aeXdTT2gv?=
 =?utf-8?B?UlcwT2xtbjlrRXNDRlhFWldsYzVaVDBYS2RJTXpJTVhnV1NHM090dnBqR0dD?=
 =?utf-8?B?bmJrNUUvS1lXeXRuNjM4d3lZVUk5c3BYMTk2c3Z1K20xUVN0ck13QlFpbDNn?=
 =?utf-8?B?QlRCR3gxOXBLRzhZS3gyeVBMWHdvY0tIM1lLL2prZDB2YkRmWG52OENJTFVO?=
 =?utf-8?B?SFFFQzQ4ckl1dUt0YTU0UTBwakNidWVKUlZTbXZxY1dXUGo4YS9qZVA4a1JK?=
 =?utf-8?B?YndWWlFjU1RuNzZYT21FZUZYODZPemJqNzNibkFkazVNTVRPTjhTbkRqVStI?=
 =?utf-8?B?bVZRd1FmVWxrYkFoNFZSMGE4NE1jekN5R2Q5aU10akErY20zd0hmMVZZNlB1?=
 =?utf-8?B?eGltK0wyWjJzeEgzNFNZaXZuQi92Z1hseXFyalAvK1ZrRzczcXBFL2llMC95?=
 =?utf-8?B?SVVJMEtxTDYvcmNQWFcvUjZGNzdPWVlBRS9xVGk1NjNKL0N3dVVOVjN0aUZs?=
 =?utf-8?B?WjdrRHhDZHRLaTd6U0xZUU9yc0ttL0pMZFJWMHJuUk9WREM0TkVZeU5ac3Jj?=
 =?utf-8?B?NWhaVzFYYTNMM2pEaUpIYTFnVTZNeHBrb1dTWFlKTDE4UE1lb1ZOaHVDT1pM?=
 =?utf-8?B?YzdBS3pEbUxTRU9RT2ZSbkJxL3ZxMU13V1NqZWtuZFpQejhIdkVsaWNndG9R?=
 =?utf-8?B?L2JnZFRLVlE4WEZKS2RVT0pGV3V1VTZsdTZybnpjSW5USXNUZU5YNnhvUXNi?=
 =?utf-8?B?OGpUaDExUXN3K1hCMFQ1a2NqeEkwNGNKWE40SkpjeFAyeTZKMCtoQlVWNnA0?=
 =?utf-8?B?c3Y1bVIyVHUrWDV3MGx1a0J6SG1sUWQybjNVQmpFUS9RS3hpejhQd2prRFRR?=
 =?utf-8?B?SVNzUzVxRENHL3N3T3l1WDNxRzU0OVdSM0hCWTJNUzkxVGFQS0c2OVgvMTUx?=
 =?utf-8?B?cnpqRE01WXhFTlM5WkcwNStGN0NCOTd2R3FFak5mOEZZaWlad0d6R3pMeXMv?=
 =?utf-8?B?QTQ1Umg5eUJBZUNzWkRVSER3ZkwwRmFQTFN1K3IveXIxU1Z4N00raW1SWEla?=
 =?utf-8?B?cUZ1ZDFZa1hpbXNmTlNXb2sxQ3phN0h1Ukxob2E0OVZ2cktSVkJuamlsZXl4?=
 =?utf-8?B?Z1lLa09YdWw4WCtpTUE4VnJTRjFVQ2s0OGhkazJnNmlBbVZEbU9zTTQrR0RO?=
 =?utf-8?B?S2VENEJObEViV1V6ZFJwaHRockVCcFZ4K0ZCZm1NdWdYR2F2NHdkeFZ0MlVI?=
 =?utf-8?B?Ti9hbG1oMDd5dFl0a0tiZXVZN0lmVnY2MUVvdlI0NVgvSmduclJGcDF3Zzdw?=
 =?utf-8?B?TzZ0OWxpTEZ0aXRlNDgxM25YUG9CcXhyeTkwNWFJODFBUjFtZ2FvYVYxU2Mx?=
 =?utf-8?B?enhMTFV1MmVZc3VNUnBLOHlCOGdNRmM3K2Z3TjBkb0d3QUE4RFF3WGdzYnN1?=
 =?utf-8?B?KzZWcFM1NHpUNzhaTFVsMlBmNExkYm85ZmFYZXdKV2ZyK0Ridi9jY29HQ0R5?=
 =?utf-8?B?TWZvbWtRbktJSUlYaGptaEh6QTd5K3pKeVBpalZ6MkhZS24wYVV2eHBQK0Na?=
 =?utf-8?B?UXFSUFUzTHhlem9Ib3EvcXQ2V1BiOERLemVNdDZZbCtBeUgwVjdRMUJPcXVC?=
 =?utf-8?B?RFNib296bUtyL2Y4SzJwSWZrTkdxSllFNGJXTVBqb1ozUEx1czcxck9DUkFs?=
 =?utf-8?B?UXBlL0w3Ym55emJJWXc5QzBDWGhWMytoM1dSL0JUSlhLcVVDMGhWdlhnRXVB?=
 =?utf-8?B?dW5IRHJUVTVDK09Sb3hiNlY3RXhLN1dLVkVqa3YzanJZOGwvY1pXbHdjQ2FO?=
 =?utf-8?B?Yjd0azFob0orSTR3eVZscGRNWUVqZ2JQaDh6NmRRVWZlNEFsSHJkNktyZGlU?=
 =?utf-8?B?UkROalRJS1FIZFIrbXNZdnR0a1VjbkZBdHczTlBKVWRqY0pkbkJHRVJpbmx1?=
 =?utf-8?B?MmJhMjlLc0FxTjFSMnZ3R1NWSm4wcWd2cmN1Z2ltWDIwSjZhL21na2ZkcmQx?=
 =?utf-8?B?RjdGT2UwYkh2cXoxWng4aS9MR2RQblVmZVJZZnRkUkRqVEJjWERiU3psUzdx?=
 =?utf-8?Q?IwmQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUhKdEhlamY0Z2JmMWg0NTRCS2ZaTHV2M2pCTHgycENrOFhRRlAvMm45Zjk3?=
 =?utf-8?B?TjRybGhzQ0NEV0NFa2Jqa2MvS0RlU2x2SDMyeHFkREFmSkN6WlhlZmphUHMv?=
 =?utf-8?B?cGJyRi9rT0wzQ0FvdXUrbEM4SmNjNWlRWm9WbGZUQk5XcGJkUFdkNHgxbHZt?=
 =?utf-8?B?VjFidnBOamZBRlpxMloxaVNrYk5abjRiU0VUc3dMSVJqanVCVHNRamFEaDh1?=
 =?utf-8?B?OVlWdVZmZjM2bEtLZitPZTNRempYZHpxQkc1ZW1rU0hLdEQ5M2JEcTBjKzJB?=
 =?utf-8?B?YjJmNFpwU0k3SGZKWVlrZXBjSUswSG9TRVJPa1V4YU1QNzBEYVp6NFdQcXB0?=
 =?utf-8?B?d1lSUVVUek1zTzFHQWhSQUpoVGhQSFVpVnc5MlhzVVBHeFZwYStzSThxRUVp?=
 =?utf-8?B?RWhMTmN1ZEdrL0ZLVTZmend4MUxnYVdPYTl1ZTZvK0hKNE5GM00ybnJxcVp4?=
 =?utf-8?B?T1lKbnBKR2RXdUhtUkxVT3NXVmxuZlE2ZkpzRXQ3RzViTndMQ2tRRjljRkpz?=
 =?utf-8?B?bWMrMFk1ZzdyRTljaUN4ekdvaXgwR0NFL2RJSHZRYXdKSlk0UUNtblRHQnJO?=
 =?utf-8?B?VXBxeGtJcjdKaTV5VzhiMVYzOTY2R1FJWDZWdkpxNjAvbFkxM09odnlDdURv?=
 =?utf-8?B?Q3l1cElxU2VqWDlmaTJYNDJYRFZ5ZnBISHZTeVBGY0dYeExBeG9aVllZQ2xz?=
 =?utf-8?B?eXRRWGU0eUJVMUVhclJUdTdncHZUSEZ3M2NacUpSUk1GemZIaWgzUHgwZXhF?=
 =?utf-8?B?WWlLUVpRbndrR2FwSlVibzh1VW1ycytiWnJZc29PaWxHNG9kc04rcnhIVjJW?=
 =?utf-8?B?dnQyOWFpNXQrRU9kWmIvdnhNSzJuWTVtZXJwOExzVDVRckk1bDJqOHpReTJQ?=
 =?utf-8?B?YXZaZDg2MjEyM2xEUG5TSm1OWWlkS1RWZEtySTJkSGpaSHQwc1B4QUFMalEy?=
 =?utf-8?B?SzdhQitOMDFMRmIzOHh3c0RuUnVoMUVYTjM5eXFEdTJzK293VGs3MmF4dHB3?=
 =?utf-8?B?L05pZitvVWM5MVBXbi9vaFhZaDFaaVo0Z3hzK3RrYjhuZTdpMlR3TGo2UmZD?=
 =?utf-8?B?R0FzaVcwdVNwUUQ3QjdlWlBuRmxEMnlzTVhoc3B2ZDNZN0hMVGNwbWtMM1dN?=
 =?utf-8?B?eTl1WVBubjJwdEw5bHU4dmVkdm9uNW5TM2UxU2N6ZVg3WWxzRWkzL3pQdkl1?=
 =?utf-8?B?YlBaVWRzeG52UGhzSnNYZ1NuOUs5YVBPbjJiejdwQU1od2F2dFJMSksvdXBM?=
 =?utf-8?B?K1FSUm50azlCdllwbndQbk1FWXRqSVJlbFpKQnF0YmVVOW1QaHphcnNMOTRG?=
 =?utf-8?B?WHY1YzhJRDNUYmtJWkpraklONnVNWTcrSVQyRWZUN2ZjRnRvSTRWMjVXeHBu?=
 =?utf-8?B?eWlaWVRBRWczYmo3NUtPb2x2U3FSS0JGMXpNSFp1ZmM3OGlmQVFWK2dzOFhm?=
 =?utf-8?B?QWYzcHJUTTBTV0YzUWpEcmVHNE9ZblBKTHdsUy9GMWNWbUtJejl2WC9qOWRj?=
 =?utf-8?B?UWw3TnNaSzcvb0ZPZ3o3VnJsNVI2eHVKWDhPbkg2Ry9CRU1hY1pRejdBc3lr?=
 =?utf-8?B?NzQvN1ZIVzkzbWRzZVo3NCt4dVdkRjFUdk9OaE9Pby9PN2t4MWYzSURzUXhW?=
 =?utf-8?B?eGYyb0hRUk0wbTVtWkVUampON2w4QThEc2ZLMkxBYTUxeXJwSXVERXFybW1D?=
 =?utf-8?B?OFJWVVJ3T3lGeWZaTTM1SmJXRnVreFV3TDdhaGcwejhtSjRhTStDQW5nMFA5?=
 =?utf-8?B?anhIQ2lYekNaRHBBNkVOMXlhRTdPaUplUmJRM2Y5dTVlTU9sa3lES3psNHlO?=
 =?utf-8?B?R2VvVml5b29BZVI4MXcvN21ZMzdmdXhKVThPTXNSUXRkbnJSZlRKL2IwOTRs?=
 =?utf-8?B?Mk1nczV3dzNXeDVjZWxUUHF6ZkFqK1gwK1ovdmhSUDg3SEFvYTNXSDY4NVJ2?=
 =?utf-8?B?bmY5Nk5FYjEybTRwZU9ldGpBTjgreGlwYVRRTERqNUU3L1B3bXBTVWRyWkFG?=
 =?utf-8?B?UzEvRnQzbm11a1BGdmhIdDlJU3phTDl3MG4wRkJUWDBHR3NSeWNOUW1rNEtu?=
 =?utf-8?B?UnJyd2VnM2JLaWxudE0yc29hYTJQcGhHckdkeit2N043N0pnT05GNXdObVFF?=
 =?utf-8?B?aHloOXZiZHFtRE5IUTkvaGNXUE5JN2p5dEtoOUVQRGF2aXRqNjZCcTZQejlF?=
 =?utf-8?B?UHNoNStYaEpMNUpxYXRObit3T0g0YUZaTmlWMk5rOHZieVFrRUdBK0ZkL3Z4?=
 =?utf-8?B?QXRsTVpFNk9ITENPUlpFTFU2NFhhaFZYQmdBd1ZDM0pQUHZ5WEgzTE9mSzcz?=
 =?utf-8?B?clZYUnk3ZDdLVU1OQlpQYTFDeDVwSUFmQ2dwczFBZ1dKaS9rakRhZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b2e574-5770-4c0a-3ea2-08de70472336
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 06:13:17.2064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sNoyDdyjbXIWgURCcEqLE01BlH1/FnxB8M9DkCJGN7hv0RDIfjaQiHfUloB3bWH0prEk10KF0l1Oxlmgcmviw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
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


On 19-02-2026 10:31, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 4/8] tests/intel/xe_madvise: Add dontneed-after-
>> mmap subtest
>>
>> This test verifies that an existing mmap becomes invalid after the BO is marked
>> as purgeable and purged. The test creates a BO, maps it, writes data, then
>> marks it DONTNEED and triggers memory pressure.
>> Accessing the previously valid mapping should now trigger SIGBUS or SIGSEGV,
>> confirming that existing mappings are correctly invalidated when the backing
>> store is purged.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 54
>> ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 54 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>> 7dbe70f42..5c6a24553 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -196,6 +196,54 @@ static void test_dontneed_before_mmap(int fd,
>> struct drm_xe_engine_class_instanc
>>   	xe_vm_destroy(fd, vm);
>>   }
>>
>> +/**
>> + * SUBTEST: dontneed-after-mmap
>> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on
>> +accessing purged mapping
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +	memset(map, 0xAB, bo_size);
>> +
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
> here you have purged the bo by this time. And here you should try to access the bo again correct ?
> With out access the bo how the SIGSEGV signal come? Here also same I did not receive any SIGSEGV signal from kernell
>
> Rest all looks okay to me please clarify these points.


Yes, the BO is accessed after purging - the access happens at *ptr = 0; 
inside the else if (sig == 0) block.
Signals are delivered to the process silently - no dmesg/console output. 
This matches i915's gem_madvise.c exactly.

Thanks,
Arvind

> Regards,
> PRavalika
>> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		if (sig == SIGBUS || sig == SIGSEGV) {
>> +			/* Expected - purged mapping access failed */
>> +		} else if (sig == 0) {
>> +			*ptr = 0;
>> +			igt_assert_f(false, "Access to purged mapping should
>> trigger signal\n");
>> +		} else {
>> +			igt_assert_f(false, "unexpected signal %d\n", sig);
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +	}
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -212,6 +260,12 @@
>> int igt_main()
>>   			break;
>>   		}
>>
>> +	igt_subtest("dontneed-after-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_mmap(fd, hwe);
>> +			break;
>> +		}
>> +
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
