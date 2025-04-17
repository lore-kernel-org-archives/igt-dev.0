Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EB4C369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 11:01:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAD210EA96;
	Thu, 17 Apr 2025 11:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNSodFdT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D4510EA96
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 11:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744887682; x=1776423682;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pCFVI0G5+Sl49Ec8OPuGLTtXAiWbeQL0iU98xPNhB+Q=;
 b=eNSodFdTjD4jKJrnpSeeJXcgl0GoOmYOmxMlhKmP/lnqP0v/XYv4Nw9F
 /Qvf5bAFHbZ/AFXLstBHwGZ9ITp8IEJLPwjqHdmNB/otXmF7ENOg66Uzy
 Ag1qhDPpc/zEeFn8AN0NWXXk9xuHlsNUmb5RTCqT4nVHSt3b/ihICmRbH
 YOggzdH4I9awkyPORSbIrK8NCsxXVj3+U977kebBM8ULcw6QEaiDMK+sZ
 GNeb+IpAGszTKPOCkh1fpyXf9gLLHeZajmK3NhykrpnrOklbxUMFIjkOk
 KU8ifsjN7v3Yo8BvaBmXvwNB1vNAqFutz4lz968ISjJ1qzh7uMBkj6k3c Q==;
X-CSE-ConnectionGUID: 8bCq+oKcT8mt0kfK54nlPA==
X-CSE-MsgGUID: RY1ItbABR4KXO+2g5bOJ7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46558624"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46558624"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:01:22 -0700
X-CSE-ConnectionGUID: G3Y0ho4QSMO5AxEB26bvEA==
X-CSE-MsgGUID: HBNhQjbGS2q/MobCq0DdOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="167956875"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 04:01:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 04:01:20 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 04:01:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 04:01:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8In2QDom+28DlYVIuWll4lC1Cw3mRxG6DseXV81MI5k1SOm8VzpZ+a66CY6I+qLqJgLgLBhHumi6dMnTs+TaCUzh0+n9VGtkqX6ENMiwCD3kTw6qjl7Rdg/XudIpKqLg66YIiN+DKin+63j0wIZlocRaNW+uZhKspkZ712nQTcCykfh5io31s7ONP8gwPOkWrJJJuYx7G/gJvYxlgPx8Pnq/6OuniBoLIPph2n/parzhfjSKZ6z2nbHMOJ8DlqwpFUjyjy5dLi7d02SrytP4R2Dynqn5QUAOi1t2RYeQLUy8sZZrfqK6grMBgcm4xvku+vuUGB/TDGGCLNTlKhD3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Q21prwMtZV7Oj2OTfXLwlgVmI9Tj0IviuOsk+//aNk=;
 b=enmjD+ud3jc3F1LFsg+vqroqhmpAlw6+JiFhmh+sYTsOpEr7UJQkJwpwY/yT49CzXsh8/aONjIADQ6dLXy/eHuBs7U/+joNB/YXjRI3FlpWDC4GV8KR7olGqtHxT3gZxmHmkAO9UKfq/Ueb8zG9zzOL2OsOYWG9b/fWtNLVN6XDNXyNQkZw4jDUD+ro/m3gG5VoZPyAfF9rpkVRi+U21TVkxy8hXc/hJi1PjOeenTxFpIcysRZtDqQ0i4P/EONfpenXg+1fJnQcIXscJlZm9OZ296VJLFuT+HNUUT0XwLf8rQPk5zfBZ/e5ZjHcW2kHxKgausQuHYftX6bmJANmSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6427.namprd11.prod.outlook.com (2603:10b6:510:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 11:01:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 11:01:11 +0000
Message-ID: <7177d94a-a2ca-4cb6-bbd8-894f489ac676@intel.com>
Date: Thu, 17 Apr 2025 16:31:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid
 driver-specific condition
To: Melissa Wen <mwen@igalia.com>, Development mailing list for IGT GPU Tools
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, Andre Almeida <andrealmeid@igalia.com>, Alex Hung
 <alex.hung@amd.com>, Leo Li <sunpeng.li@amd.com>, Simon Ser
 <contact@emersion.fr>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Ville
 Syrjala" <ville.syrjala@linux.intel.com>, Santhosh Reddy Guddati
 <santhosh.reddy.guddati@intel.com>, Chaitanya Kumar Borah
 <chaitanya.kumar.borah@intel.com>, Xaver Hugl <xaver.hugl@gmail.com>,
 <kernel-dev@igalia.com>
References: <20250415200529.31722-1-mwen@igalia.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250415200529.31722-1-mwen@igalia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: c04e0057-e2a2-4f45-dad1-08dd7d9f2a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTVNNnEzWDVuVExZb3dFOVlvb2lIT29OMTFGMWZmOGVaSmFBZ1EyczB6NFY4?=
 =?utf-8?B?ZWZ5TTFCRGxlMmFZaXFZS0h0Y0FQenJPOVY0U2hpRSt6MHQzeHdCWmpmSEpJ?=
 =?utf-8?B?cWsya2oySzRjVkZVZzlINkN1eHp0SDJJTWRva2dwa2RUdzdvWjJFY0p5R0Qw?=
 =?utf-8?B?ejNwamhnZVYvY1lESHpTWUt3bkhNb0xqbk04WWNtT1JMVi8zaDNIK1liUGNQ?=
 =?utf-8?B?elFrQzVYbTJsNlVLajByMmF2c0psNWZRZ2pHVWhyUTNUK0IzUkJ3bmduSWEy?=
 =?utf-8?B?ekxTeSt3VndaK3VCZ3VGQzU4M2N0KzgwZkxYYkJMRXN2QnFabTdnOFNRTnFq?=
 =?utf-8?B?LzJqVEtEMUdtMGJhUHh4VUIwZjFaZHU4OFoxeW5HeW1CWHhNditKcEpmUGw1?=
 =?utf-8?B?Y1p1Mm1ISllIQ3lNcjZPSE1ydGRMOEFsRllSL2VudkZuTVh5NHMrcnlFYmRK?=
 =?utf-8?B?c21zazM5UlhSVmVTYlE3cnNWWno4aVpNMHVFYXAvVkJvMG91NUMyNmh5RHhB?=
 =?utf-8?B?MWhERWtyeTM4Mlg5bnRLYkxNeGFIc083cmZNYStTZERGMFRhQ2RPZzdzODQ0?=
 =?utf-8?B?aVl1ZDcvUkJRNGlFL2FzSFdwemk4REhZb0JUb3ByWUxEKzhUN3lLODhMZk0v?=
 =?utf-8?B?OTZlNFFJMEZncXN0YVJQU0ppbVFGNG8yZ3NKN3RRSm43RkYwVW0vLzdnbEN2?=
 =?utf-8?B?SCtsc2xzY2JMOS90SnZNVHV4enhJemRLQlBxNUpSY2RBYU0xRjZXcU1DTG5L?=
 =?utf-8?B?VnRCVU8vZStZeXJDaUJmeDhxczZrbGlQVXg5UktOUHBHcVRQSi9veWRKbUxZ?=
 =?utf-8?B?RHVWNlZBNnY1VldPVmdoRnJUM1JkMXl1THJSQkpjNzFjcVZmNFAzb1hUdFJj?=
 =?utf-8?B?VXJ0TFFIT0c0akJWNndJZFhrSTRYRUIzTlBCa3prbytKZjE5b3ZHWVdrd1NF?=
 =?utf-8?B?TlhyV3c1SjFWSEVWZkdWWFR5VWRFL0grWFZtbmtYZTNPRFdsd1hKR2lZU1NO?=
 =?utf-8?B?K2czVy84aE5sdm5GWlNFYUp0UGxTN1dSTnh2RDE4Um1KMmNHWFRjRzNGYzhH?=
 =?utf-8?B?VnM0Tzh4b2phVUtPZzhTNE9ndUhwSzdtbEprRjRDZmdTdGtoY2NrRWFsTHNu?=
 =?utf-8?B?V0hBN0hVSDUrQ1hpbjJYaWxicUpTd0plVWZqa28xd1RuYW5OYzVKY1cyTHpG?=
 =?utf-8?B?V2dOd3QrSzcveG5xNXYyRGQ4eEsyc0NuL0p1S2JuQXZMQXRYNW9FOU4vZkk4?=
 =?utf-8?B?VlhqNFdoYjd6ZUozQS94NEx4dmhyREtnZHVpcUhuWDl5SzhTRjZVQ1g4dlZq?=
 =?utf-8?B?OUVRTERzc2J5YmFwZ0xxZHJjSXBta2N2aDd6eW0vbFZHWlkrVDJsWUI5b2ZY?=
 =?utf-8?B?VWZ2WTlHdVVXZG0wY3RKVXNiQ1RWWVpZSHBSeDE4VDJ6cjgzazUrbmZGYm5Z?=
 =?utf-8?B?Y09UUG1Hc3R1RG45WlFzUFdaQ0JmbnJZdkQvMHZLcWt0UTV4QnJyQWVQMlpY?=
 =?utf-8?B?czVEVitiRksyaE9KcUk0c0hydlpqQnE4b1JPMnVUN1RtWkNLM3VmSE1ZNHNL?=
 =?utf-8?B?aE5heTlLT3ZITi80dHV1akhFQlhTUDdtaCs4OHZCTHV3NkRJbnlTOGlvZzVU?=
 =?utf-8?B?aTRJTTNvSjdDZDNFNFB3S1NSUWZFUmFIV1o1UGlBQWx5RGliRTFQRy9yVlNG?=
 =?utf-8?B?MmRWQ3hNeHBPbi82T2ZSelVzVnI0U1ZLZXBQQUpZbUZsM3FFUVU2WUR5eDMv?=
 =?utf-8?B?UmU0cEVYWk14L2VuZDQ1MzIrOXM0Q1dDR21KZFdaNzFhUVY0OExHUmVmdUwr?=
 =?utf-8?B?VTd5NTVMbUtxdTNvdXgrdVBBVXNCQzV3emVieGVmUEo5SE5tWU05VjZEaTM2?=
 =?utf-8?B?aU0yMER1UmswZFpMZ1FFQVkxN3pYSjRvZ0pZVVBWQzVZY0pWcjFPdkxwUVJn?=
 =?utf-8?Q?dfygxo9s+lg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUtvQW1pb25HMkVUVnhOZ2s1SHJVelhZbU8vandaeVYva1hwOE1mSHlCM0VO?=
 =?utf-8?B?Y3QxR0tHa2E3Y1lqUlAyMVdzQk5CZk1JLzhXL3RYWGJIdlY1YksxQVVxMStK?=
 =?utf-8?B?UDdKTDljVGVuRk9QSzZZakRzbFRjZHVMNkk4ZWVTQTdNamdDYVkzQmFOTnRR?=
 =?utf-8?B?NXJya0dzcG1tM0hFMUg1L0FKaEN6UUZDRjFsNzhzRlU4aDkvd3VXSlhFZ29Z?=
 =?utf-8?B?UUwxdmNFRFV3bFRmSGFEeFVBdjR6VU9qQk5Na0lZa0NJdFlmS1RCZHB4MDZX?=
 =?utf-8?B?WGU5SThRZGxOZUtNZUhuQ1NNbHlHckZSSDlCM2JhMFJBT0UwYWtZWGg3czAr?=
 =?utf-8?B?ZjBrREhTalJ6aEN0eWw4dDhXc2dhMlAwSlNTeUlVSnBMYXltRENSdS9Za0Zq?=
 =?utf-8?B?RUVBcGlNakE5RHpvcTdWZXd1MmdNVnNYVTA3ZDZqcmlpaDZ3djF5R1U2T2Rn?=
 =?utf-8?B?OTJ0YjV5Skc0Wk9FZ2wxZlNZY20rTEsyMlVTM1hiU0lYRTVDSmUza2tKRS8w?=
 =?utf-8?B?ZlhQaFByMkF0VWF3U3lQQTlReEQ1Y3BCUmNrNXRCOVhuR0xxY1RvMDJoNE9I?=
 =?utf-8?B?c3ppQkl1OEhQUlZibmFiWUFCNlVvVkwrQ0lSc0NvcmFiSTFGZXk1TWhHSGNv?=
 =?utf-8?B?SXd2UlF2U2RnQ0NuZlBOcTJXTzNoNlpDWUhwTlBvM1NjejlqUXZuTk5HZTBB?=
 =?utf-8?B?b2xyRVdvUWRqak1zMHFkcTZYTk4vcExwNlROQmFSV3R1cEdmR09BcG1GbVRl?=
 =?utf-8?B?MHg3WHVwZ1plU1h0czl6am85TUhqQnA5Z3I5bmRqc0ltQXNsWGUvUUJ0blNk?=
 =?utf-8?B?V0NJNFZjdmRDL25wY2JvOGYxbVllL0FTVGl5UmZOVnVZS1UvcEJVelR0RkVC?=
 =?utf-8?B?VGVHM01Ob2xPMVdmVk80T2lsaFNlYTEvOFBkUlYrdTlUeWdMWm8rVXI0LzJr?=
 =?utf-8?B?N0J6aU5CYlhROTJoU0JnbUFoL2F6czlCNC9Jcm5EeXYzNlk2YXMvSmUrbkln?=
 =?utf-8?B?OXpheEJBL1NPWVVvNWxyZWlFVC82WlJ3Ym1Kc3ZZMUZHQ2sxamlrazhxSCt2?=
 =?utf-8?B?KzRsR0tVc2tQNGxOekFGaWNwSEtVUjVPOUZlSEs0bWQ1WktMN1QxNDhDOGtw?=
 =?utf-8?B?c2RTckhtMTlkOGJJY0szRjZ5Nksyc3hPMEwvRkRZMktaTUZFajBPNVkyYjQ2?=
 =?utf-8?B?OUxKRytpR2FUNE0rV0VRdUUxNlUzeWNXRU9kcW1VdmlnZGpxd2h0d0RYUE4w?=
 =?utf-8?B?V29WTURWdUJIV2g0MmtmbEloTHNoS3ZKSkhFMkhOVkx2bUdRR1JiNjl2WWJr?=
 =?utf-8?B?ZEl4M3RsZDFqUW9sV29DZlhDbFZSQzVkMG8rRG9HYlZCWVU2TGk5Ty81VXhN?=
 =?utf-8?B?RUJEeUkrLzBrZ1N2QnRiZFNPd1NvazRGWDVTZkx4WjhWVVZCYWJKS05YRWxR?=
 =?utf-8?B?M2ppL1pITHpUTDc4UXAyQUhlMHI5VjFPOWs5QUtBYVNoWU9WeVJUOExValVT?=
 =?utf-8?B?RGk1VUVqQVo0c01iQ0RyZmVNSlBEOFYzakQ3OUZySEJGcFAwZDIrNlcyaHAw?=
 =?utf-8?B?OUpoV3BYSE9lN016U3FHRVpRR1FKMlBVYjJVRnAxMjVzUXpOamtWL3BvRTFi?=
 =?utf-8?B?Tm9IeHBWNHRlamlOeXFrYVBGNjJrZmtXb2ZpR25HS09nSXRiZ2x3bWVqUjRt?=
 =?utf-8?B?ekRjRmRvSEYvdE1sRjJCWkI4TllrMDJFalM5dm9LRFJHdngvbU50SlNsVU8y?=
 =?utf-8?B?UE91cHAzL0dvSHJxeVV5NFptWXBZN3dBeGRYOU9oMGk0aGZVdE56eWozUHhp?=
 =?utf-8?B?RUFxSUNNd01JRElaTDUyRkNzbGRpeXN3TStKdjFSaVNTcWFtUXVLRzVxcDdV?=
 =?utf-8?B?MUhRMUtVWk96VTlKQnlMaCt6VnFrYTN0RkJqc0ZCdnpqL1d2aFdSM3VaanRh?=
 =?utf-8?B?VU1wdUswZnNDNlJNNG1hc3k4anlwSjFtbjl1YXVBZktPYkVCNE5ONUhBVGNu?=
 =?utf-8?B?M3d2eE4vTmRiMjdKUkVnZWRIL0tHQ3JoWXV3QzFZUnBmRkF0ejJ1NnZ5ZXBl?=
 =?utf-8?B?bERPbDAweVFRb2hXOG8yb05ZUGtnSzUzOUNkaDBEYU5tVi9zNkhhS3hHUXor?=
 =?utf-8?Q?4CyuiLSTfJI/JDMPMjbY7m7Ly?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c04e0057-e2a2-4f45-dad1-08dd7d9f2a06
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 11:01:11.8915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qw2CYzbW0WXEKR3qmiNUugchhuqHGh3x0FBKB6xB840rz26tpmKWuwOIUUogW8UPyvLOol2Te6vZz5nwq/zN+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6427
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

Hi Melissa,

Although I agree that async flips can be rejected for multiple 
driver-specific reasons, my concern here is that there could potentially 
be a genuine failure(as EINVAL is a very generic failure check) as well 
which might get caught in this category and be treated as expected skip, 
whereas it ideally was something which should've been allowed by the driver.

IMHO, if we need to have this, we need to have some more checks together 
with EINVAL (though I'm not aware of what this could be currently) to 
treat it as a valid skip.

Regards,
Karthik.B.S
On 4/16/2025 1:17 AM, Melissa Wen wrote:
> Async page flips can fail for any driver-specific reasons, i.e. when the
> driver can't commit to async page flip request for hw limitations, the
> commit is rejected with -EINVAL since there is one or more conditions
> that make the request invalid. These limitations varies between vendors
> and hw versions. Skip a subtest if any invalid driver-specific condition
> happens. This behavior is in line with userspace expectations and fits
> better the plurality of drivers in the DRM subsystem.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
>
> ---
>
> Hi,
>
> Recent changes to async page flip conditions and limitations in the DRM
> subsystem shed light on unexpected restrictions of async page flip
> tests. The current approach doesn't make the test generic enough to
> correctly deal with the diversity of reasons for a async page flip being
> rejected by drivers of any HW vendor.
>
> As an example, AMD display driver can't perform async flip when the
> memory type changes [1][2][3]. After further investigation performed by
> my colleague Thadeu Cascardo, he elucidated that this situation can
> happen whenever there is not enough space for FBs in VRAM, so they are
> allocated in GTT. Moreover, the space available in VRAM varies between
> hw families and other system needs. Therefore, the driver rejects the
> async flip due to memory type change, instead of silently downgrade the
> page flip from async to sync - which seems correct.
>
> The userspace expects the rejection (-EINVAL), but not the downgrade.
> So, I understand the test_async_flip should just validate if async page
> flips aren't downgrade in acceptable conditions and skip for any invalid
> driver-specific condition.
>
> [1] https://lore.kernel.org/amd-gfx/20230621202459.979661-2-andrealmeid@igalia.com/
> [2] https://lore.kernel.org/amd-gfx/20230804182054.142988-1-hamza.mahfooz@amd.com/
> [3] https://lore.kernel.org/amd-gfx/20250107152855.2953302-17-chiahsuan.chung@amd.com/
>
> Let me know your thoughts!
>
> Melissa
>
> ---
>   tests/kms_async_flips.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 031417ed8..0de299c2b 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -397,8 +397,10 @@ static void test_async_flip(data_t *data)
>   
>   		ret = perform_flip(data, frame, flags);
>   
> -		if (frame == 1 && data->allow_fail)
> -			igt_skip_on(ret == -EINVAL);
> +		if (data->allow_fail)
> +			igt_skip_on_f(ret == -EINVAL,
> +				      "Skipping, async flip not supported at frame %d " \
> +				      "due to invalid driver-specific conditions.\n", frame);
>   		else
>   			igt_assert_eq(ret, 0);
>   
> @@ -768,7 +770,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   			continue;
>   
>   		test_init(data);
> -		data->allow_fail = false;
> +		data->allow_fail = true;
>   		data->modifier = default_modifier(data);
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
>   			/*
