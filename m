Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC81ACA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 11:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9385D10E441;
	Mon, 25 Aug 2025 11:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="INPjEJnb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49DBF10E441
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 11:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756120717; x=1787656717;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9DVQy0dYjJUGzpnAHdv46/rCUs1FkjiI49ui22WVWPQ=;
 b=INPjEJnbpP/PkKgtNBfwYWdLddiam1Zz7tjuq7k9NiZk56USqPmTX3JU
 6stYcbUUaR+Rjz5RC4WYFvRyCD6v5jG+YrVy7HR5AKTs7XZjD1bnbe/37
 P7Su6nXtjVAa9MAEQal3m+dPpeJXNt1LbvT3Z9idJhyO4FRKmD7ADOMfs
 V/d4DsH9dxrKxQcZTE1oOI/SoFOte0vdG+QsWpQDuyxTjDR0mn2XUGG95
 xMM2gxzhK7yIGUwJJ9YRJoSN4rTpH4QixOiR15gJ2Nb2qEnpUxchcTbYJ
 ebScwyzNVLeqLVghEqnmjnJca58irVmgOqYydAFP5Qj2wasmes+LqqpRH Q==;
X-CSE-ConnectionGUID: OVjmoCCWSymCz64QoJtuPA==
X-CSE-MsgGUID: 9bB0wXJtR8yPjnAATXWa3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69433199"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="69433199"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:18:36 -0700
X-CSE-ConnectionGUID: Ig8eRTxXTgKJSsD6MZGE/Q==
X-CSE-MsgGUID: jqd0LWuqS02HNGXFNUb4mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="174580989"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 04:18:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 04:18:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 25 Aug 2025 04:18:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 25 Aug 2025 04:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bmv0+Gay1QdiThciGPtkJcEIowDv+qB2loAZ3yjEE+WiQh2upg99Czl9g/PndtWTjLxFztenfRLDGS2AoY1G9MCb47KAf322ZvKCMAHOIG1cBk/EQC1DDbKSkM1lqvG1UYXCBJKjyxad/M1C9phnTkYrfkpmtfX4T+PW1GYHOsjVQuZPg4KGitdasmZVtoEPRtuQx1IG6b5CY3+cMq8x7e9cPH1sTr07YzZaSAk1tUgtBsnannujv6WeuHqNZe+hbWL6CRse9QQmNnUf2FC1Zji48MA/MRCwJTG3OaI85kam/zBWGYe18GPw036qVLb0TV3PlzdpW4vcMI6UyaRvrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89lp5Mt+Rx6PD73Ov25EO+b/pWrkhjLfCq5c8/uhdkY=;
 b=vyE3t595HQRHYmqaI/AbJj1K3l7GF5ogiFf5h/g1bgz6czdbFfyhfr1dMyTgDJpNZBULp96gxVyxFNG/IM+rpTvjCA2WN64b/tnYvKR1r5QDI9FFkjOo022jiidsmMtg0xxK5kfsb8nVCHhsvea0jSb1XklYhk6OT/QYxYQcCTXZrB8KulXByk2x1eab9g7efbtqa2EpVPMU7Sa9OPcga/2ZNEAkJMMWVKqlZ05Y6dKygLgJyQn3h45U0dCn4fVYScHK6D66osWd3Xc3j2KOil18vG98AbgHw5W1G8dPbb72o7FPLuqR49scBafWJFXQ/9aKpX2rdC6+9N1ewEDObg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by PH7PR11MB6676.namprd11.prod.outlook.com (2603:10b6:510:1ae::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 25 Aug
 2025 11:18:33 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%3]) with mapi id 15.20.9052.019; Mon, 25 Aug 2025
 11:18:32 +0000
Message-ID: <3f9952d9-9d59-431f-9763-9454533e2dfa@intel.com>
Date: Mon, 25 Aug 2025 16:48:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_configfs: Reset all custom
 settings on exit
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250819-configfs-unbind-v1-0-8359e66e3241@intel.com>
 <20250819-configfs-unbind-v1-4-8359e66e3241@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250819-configfs-unbind-v1-4-8359e66e3241@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|PH7PR11MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: a91bd387-0dc0-489d-d6ae-08dde3c9203d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3MrZVRLTDdONWl2ejVjeXcrY000V0JIVjlHVU1oaHdYc01WRS96aitMYlZD?=
 =?utf-8?B?MmFkVUhwbDRvdlRBSWZkWEVKdnpOMUtRTm9ZNXFvYXVnZnZwUExmWldmdnVo?=
 =?utf-8?B?dTNsVGVKYWU2dTlqcjhWVmY1czdtUDl1WHVpSUE2MGM5ODg3RE1lcG9VS1FR?=
 =?utf-8?B?NUlaZGNEWDRPUUNIeUlGcEpqZnplbURWOWh2U3M3ajB2N0F3a0hPUGJ2QUtD?=
 =?utf-8?B?ZEhkZkpwRGxvYXdiQTV3ZXFrbUJIdnFxQk9Hc0I2OWUrUlVLTjlRdEFLMDJk?=
 =?utf-8?B?anV6OHlmWXNBOHJUQmsrUnB4RVg3TVFCMHNSbGhUYlh1R2RBaiszOG9DZGtk?=
 =?utf-8?B?bTM2dDRLREJGQ2NOSm1QVGJQbVRWWjk0UTZvKzFhOU9TRzVqWEFSV0lHMDF5?=
 =?utf-8?B?Rld5MU9TWWd6TzlBVmtvVEF0UWk3UnlYbUNRUUJ1a3ozdFpLVWxySnhoMXgz?=
 =?utf-8?B?engrcWVtaUtIdGYvRnZUUjkzbk80TVR6ZmYwTzFiU1dmaFRLY1JYcm95TFIv?=
 =?utf-8?B?NXhlSmpiYy9zREZkVEVMN096MzFGSTdFeHZIMkNHUTV4WWVDOUw1TElibUxj?=
 =?utf-8?B?aUN3LzlIZTltUTI2azBROTdFRXBCQzR3dzJIREw4S2FpblIrL28xaDVSakVy?=
 =?utf-8?B?LzJkRzUydFBTU3lHN1lmSDhFRWwwMTVZdmlzNXJoUzdiRUh6R1FWMVBuMTlh?=
 =?utf-8?B?ZzgxU3dwbi9sdTNvRkE2VkVtZDZLUFlSelZaRGZmQjc1bXdYYkgrSk5aV0h4?=
 =?utf-8?B?bmE3SVQ2RGNveXZkZEhYWmIwTUsycDl6UFpDNjBvaERESDVzanRkdEVReUFW?=
 =?utf-8?B?K3p0c1JWV1FaeklkTm1GQVZDTGxQdEhDQ1lzUE44ckFSREx1Q25TZDQwSjhH?=
 =?utf-8?B?T3dUTnJGZFpkZDZuZG1FV1BSdnVPVWkzZmJXMGFUVWJ0UkZ1bk5aRW9wNnlK?=
 =?utf-8?B?Z1JxblpFV1ZFeHlxOEdPd0ZBMEc4c2hXZFhXaU5UNTR3cGl6TGRvTzl5a3p3?=
 =?utf-8?B?RGRRdUNRRlU0Vnhyd2xaVDZ4L3k0a0ljZGY3UzkxL0ZwU1VWZlE2WnZLd2tV?=
 =?utf-8?B?eEM5dXFXZC9DNmpOK0hMbW5mQXRXL3BmTjFxTW54b3gyMmRmYmNYaVpzemtu?=
 =?utf-8?B?MHJDNEs1NE5DVFhTbFBlWkJHZFhIR01oNGZGY2M5cENnWUdDYi9KNUhWYjh0?=
 =?utf-8?B?aUVVdXdud3l4TnlSa2xUYzA0emE1OXhSNDZUMHo1bTdlUzZiR3FZdEUrME5j?=
 =?utf-8?B?d1B6RDFDclFvaDNFWnpqNXlnVkJIY1paQ2pkdUhyQlVFR2RFTVVlMXpYc0NZ?=
 =?utf-8?B?ZDRrQjlvOUwzb29lcVRjVzNkK2lDRkdscUFZQUJZMnR3V1huMzB5MWd0UCth?=
 =?utf-8?B?SFRkdWJROFMwUHB5TWprQ0cvOUt3S0NXdmUrMk5MME54aVlDeVNjbDY5ekNC?=
 =?utf-8?B?SEgreXMyN2grU2pNaHRTcHY3Q2RIai9xRHc2QVJwZGdtUGYvWmtzeE51MDlT?=
 =?utf-8?B?WXc1ZGNEMlFHZlBwdjkzR3lqNEZab2F0b00zWWUzeHhHZWphNDUxMFFFQzRi?=
 =?utf-8?B?R0prMWk4aTdVdkt5Zkk4UkQ5S3dzRTBSMGNzWEpET1h0UEZ0M1NHcmJVNWp2?=
 =?utf-8?B?QjR0K045N3VlZXNYVW9vLzhQSDVkL2RKK2V0dllNSWt6cytWakJ6S0F3UlNB?=
 =?utf-8?B?QWhab2JLais4d0dKMlVvTURNdUpQL3JKMXRiQXh0MW11WHZ3bWQrYVd0dEpY?=
 =?utf-8?B?VVVzcE1INnpva0o3b1V0dXZXMWxvYlZnczI0Q1p6Yk1MT0V0d3VLRytoejEr?=
 =?utf-8?B?Yi9jd24zMHlJOXppdTlMMXlaVGlqWDFZM1hzbUh3ZEVvODBzamNrQ0dFZ3l4?=
 =?utf-8?B?YjZTUHBna0o3VUxFY08wdENwWXdrWndyZ3V4TXNPSVl0ajFPb0ZWQ2RrU2pK?=
 =?utf-8?Q?MLV1ZUP3RGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmRLTjV3RjAwdkQwUUxQS09IMkVjcUlET0w1RlZrbjF0WUMrMk1FUVJIejN2?=
 =?utf-8?B?VDlVYjFoN0N0WXVIWndMaWtLdlFEZlhZdGx5Mlh1Rk1ia2JFQlppak1udHVt?=
 =?utf-8?B?L3IydHBoM3czZkZoS0MrNXlPRWx0Y1I0aFZjaGRlWFRYaEdSWjB0Ukp5K3ly?=
 =?utf-8?B?bHhsZUJKZWtzRlpjaTUzeElSSzJmVzFlcVdhUXlFRjJGMnpZU0YzaG14dmM1?=
 =?utf-8?B?WGZJZzEzekZtcWM3M0NubkRVdWVsSldiY1pZbjl6WXh5RjZvNTNiWVdqaTFh?=
 =?utf-8?B?L3ljcVNtaHgyWUFDL250RVU1ZDdvNU9kcVFjZUlvMmNyaUloSWFocWMrVThI?=
 =?utf-8?B?QzUycEJsOGlybjRNbTlsWnVwc25Xd0g5c1R6Sm0vQmVSRFIyQlJDYmxGYmdZ?=
 =?utf-8?B?WkVCNnM5VDh6OWlDR1dFSnF6S3RrVjBwWEhTQWwrNHBvZC9PMXQxQkFtMCtW?=
 =?utf-8?B?SC8rWlQ5dHNnd3RYcUhqd25CQjRkNVpJdVU3eDl1RGhWZ1V1cS9yRDVtQXE0?=
 =?utf-8?B?QzVnN0dLdnlJS1ZKVHlmYjNMRitMMGNTdDZiY2lOQ0RnczZvcnozMnFmVzdQ?=
 =?utf-8?B?ZzdidVVOQ0crTFdhbEsxUFFxUHFlMW8xeW0zK1g1cml4MDBudUdtQU4rUVVn?=
 =?utf-8?B?bnNwZHRzM2NuL1FmQ2c5OUxUd2lNdHVKR0ZqZnZvb2FKcUZWeHJyTWdkSmN5?=
 =?utf-8?B?NVdEUkJGcmRBWnlEQVFMczVDYnVVcE5Nd3R4T2RMV2xDMFFEQXZsNWF0RHpU?=
 =?utf-8?B?SndvZW4xaUdIZ3dNU1F6NG9WSldDQm5QTWQ1dUR4aXdxVm4xeUpoL3k2R0hK?=
 =?utf-8?B?TFBtMm9zNGltY2NvL1dVWnM2M2VWQndvdGY3cWRmSGoyb3RwNTBhR2ZGODRC?=
 =?utf-8?B?WmJiUktnSzR3VU5CZ2dLTWdxS0ppLzd6TWJMeWtvSmVsdk92SVZ1UklwU2Qy?=
 =?utf-8?B?ZzVGNnUraXpNU01RNkRGaytPUXg1UUxiOU0yeWtLZFlvWUNoSHhCZVpnUkNs?=
 =?utf-8?B?MWRvakR1b2F5c09yYnd4MTF4bWZpM1JyQzZUa1Q2SFdxeXBzMkFXbWpxNElT?=
 =?utf-8?B?WE9YZXpZSjlacm05aEFueENNWWZ4TDQwWlFmakhWOGR5UzAxb3hOZTd3S3lh?=
 =?utf-8?B?QW5OZlBWL0s0MmluTDhaQ1pIbmxaaUJxNHpDY3ZkSFAzOVVqbXVtcHNPMzha?=
 =?utf-8?B?NXpuU3lGQjNNdnpIVnlXaDU4V1lyWTR2V0NLUVR6bWZZU0ZJMDBWajJIQ3V6?=
 =?utf-8?B?dXVtanIwTUJtaVFweTVIT3h0OUpJTXRmMXFzM3VmOHFtaVVUZENyK0x3aHgw?=
 =?utf-8?B?M1VPSHAxYldrVE0yYlpyNzZEcnhoYkdZbEhBUy8vTzhNWjlQVFRzT1YzN1hl?=
 =?utf-8?B?T0JPMkJqTUJaR1N5MjMyY0t0c2pKcm9tVGRJRUlSejgwakgydnlFdmdqc1hj?=
 =?utf-8?B?T2lsLy9nUmsrbVZOU1huNm1qSXFxQXVEY0M4RDVHV2hnWGs0R1FxNzNCWGRh?=
 =?utf-8?B?dUxzTVArTmFCZzdzenF3aEtjci9NRnlSN09jUWNRd29CRW1NNzJwWWZQZWp2?=
 =?utf-8?B?cW1aaFplNGpCZzE1V2tEb2Z6cE9kTGRFbTBVR1ZsaDM3eWV2TTNhTVlpZDVB?=
 =?utf-8?B?Tnh1N0ttNnpaU1JrdmgxKy85cmZ2ZHNrb3JBOGRFcVIrcE85U2RWUUIxUTYv?=
 =?utf-8?B?aHhxM0dKUDY3NUp5WVdBUDBmMVpKcERiZDBjWnRRSFRMRURTMkwyRGhtQTVQ?=
 =?utf-8?B?Nks4OXJXenBBTXZySFlkaWsvREM3bjVHeENNSmF2dGRmcGtrVjdoMDh6TTF2?=
 =?utf-8?B?ckNPcUdNSFh4UFhCVkFNOUc0Q2hKb0xIY1NpMkxIQmdwZ1RxQmx0REsxT252?=
 =?utf-8?B?bHh3b3VwdjhWTFNZcmRBTzZ3VU43Ukd3cTltTjVsUk4vRDg5LzRLdWhhMnFR?=
 =?utf-8?B?bW42R2p6YVRVbXk2cUhXbTdDMnZiakdGSlFSY3ZwUytCMVNjejdtcjNlaEJT?=
 =?utf-8?B?Tk80aW8vMjFnK0cxKzQ4ZnBuMXdqU2RlTkJyWnBVUzI3Z3RtQk5pUWpqMS9U?=
 =?utf-8?B?dFR5a2FLL1NlU2l3QVd5UlVlcFlEZm5RYlN1STJINWJzQXI4R3d5aUZpZExG?=
 =?utf-8?Q?bC3WgguLoZ5lmeezFDtEB18k1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a91bd387-0dc0-489d-d6ae-08dde3c9203d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 11:18:32.8973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHCw0oltUt+YlD1AhEIAFlZodzG1w9OSZWyZgGvDJ84fJ/E+xQps5iM7GwEy9quk0O+XGJXUE3iqOFwxanAzqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6676
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



On 8/20/2025 2:10 AM, Lucas De Marchi wrote:
> When exit, make sure there's not device configfs settings, otherwise it
> could impact tests running after this.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> ---
>   tests/intel/xe_configfs.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
> index 8b2b8e3c4..a298c212a 100644
> --- a/tests/intel/xe_configfs.c
> +++ b/tests/intel/xe_configfs.c
> @@ -26,7 +26,17 @@ static char bus_addr[NAME_MAX];
>   
>   static void restore(int sig)
>   {
> +	int configfs_fd;
> +
>   	igt_kmod_unbind("xe", bus_addr);
> +
> +	/* Drop all custom configfs settings from subtests */
> +	configfs_fd = igt_configfs_open("xe");
> +	if (configfs_fd >= 0)
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +	close(configfs_fd);
> +
> +	/* Bind again a clean driver with no custom settings */
>   	igt_kmod_bind("xe", bus_addr);
>   }
>   
> @@ -164,7 +174,6 @@ igt_main
>   		test_engines_allowed(configfs_device_fd);
>   
>   	igt_fixture {
> -		igt_fs_remove_dir(configfs_fd, bus_addr);
>   		close(configfs_device_fd);
>   		close(configfs_fd);
>   	}
> 

