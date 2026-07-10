Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CF6C44501
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jul 2026 06:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACB910F77A;
	Fri, 10 Jul 2026 06:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TsiB5tG4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44A3D10F77A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jul 2026 06:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783663973; x=1815199973;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MwAcUXWwMtowHJ5OC5gtnLDBKdjw+v21zdiVnGBB514=;
 b=TsiB5tG4hyniPEvoMOxcruMFfgDqm4+UYkUlfSoRnth5iPS8aHvHAYaO
 if2CX9r73UEVLfUjo8Mx4TSX5h2xfNrEZiry5NnfcptQ9OghYBwGxd1yx
 6VQOdOmHHqrJTjCD+9YYxpJmJOjqwvNYHnsQzpnIerijWEE8xeuNb2rDw
 eomq+0mREHKJH+nEDQk63/g9/bt/9Ku2tA/69TyAuXZuM/6B9F8o8cJc1
 clCOi0XQ/YAdbRUXdk/UJdWPW5nvAWRty2cZ5pUjJrHNu+VWIcPxDrh+V
 DtsEbRT/2LMCTRIwIl45fL4a7Oj81gvTc+xZPLOF2as+jEa9WjoPdv2DN A==;
X-CSE-ConnectionGUID: INN2IpC+R7SZ+9LqonzEgA==
X-CSE-MsgGUID: lUcKpk0GQPiak2SAd08+0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101910117"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="101910117"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 23:12:53 -0700
X-CSE-ConnectionGUID: 1sazH838RMS+iGdbehd8cA==
X-CSE-MsgGUID: aEAFkcvySMuGacijSle1Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="284898745"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2026 23:12:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 23:12:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 9 Jul 2026 23:12:52 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 9 Jul 2026 23:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emtzs38IpFhHC3nt5OG+OYgBd23myhgPZkQI4IVMbM9d32/qvNyPUPEfXTxhD18pQqWowq3nKfTcKE65fKOvIFlAhF7SAbmPWzhPUL9g9DTEzpb3cuk05mO5wSBu+stW4+5GjvYoOytZBqR51SjEnpKAU/Fb3xgGX1xhRqHR1a67OjPO1iBEgTI20RI+bmV4RecKPqMyd7bypF5oyVJDwtCP4OcU2XjNvX+lOUIhPxaLmK+NTri8Vr6OsSP+wKmgH4JnpF+GDieDhBP3AseogooxydhG0cZHDe1r+jvxRL7ZsOTyjepp3t7S+Hu7CL8FoUDx9qO0lvDHEPcbXZZ6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FyODx3NW2Np4rixomvBov59N9jMwSDdRST6Uif2ntY=;
 b=vBcVN4jZecDUvAoKBSyllZa3XmApN75U61lm5YLwuvk+JKcyKq4UgFowjVKwKHGmd1hDRDoVM2XMg1OlH45KRYD+HICr6CFUI1zbt/XXzyNWCvw+qXkjtyipAFvOBYjFzN9iKpwhdExjB6nquiEiMVr9vXeF5jD1FeU7mNnUhOaOLDtGCUgCUDBvBfQyWfYmczb9NMket8gfRFr+ZhBDYIZ54rJj1LCkMhc8euY2WZxTS8By7s56bpEJ1XTZ7l4mzhtOn7cL5HTU3kqz85Eb2NMSzEOSClAgGUKdEKk7O1GZUeHMNC04G9PPWZ9NN6v5padQ/dTnuXC51rRC4RMaag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.18; Fri, 10 Jul 2026 06:12:49 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 06:12:49 +0000
Message-ID: <c67f184b-c93c-47b7-ad5a-a19a2a6078e4@intel.com>
Date: Fri, 10 Jul 2026 11:42:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Skip MST outputs in
 SST-style tests
To: <igt-dev@lists.freedesktop.org>
References: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260629015411.32130-1-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MW3PR11MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: b245d87f-f7a5-4212-a8aa-08dede4a443d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|3023799007|56012099006|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IX90YLqwuCvoRmE0AF4QGF9dv/u3lZz43lExX5VOgzIaSXB8gS8OQovH5pSBLIH9kxvo4Czbr2b3tzm7t4kxvcRhpGiqXfJ8lxJ5IzEwfP2TwbQECIZ4yaVkXF0zkSFH8doNA5IAhybTDfycgkCjaWn0R/7LiaA2N8pSeT+uYKxkv2bF4c8xnpFNvlQoYWHyjUPaTdKVF8VQpqlJHwR5RNxKxfCSI5IVhRph2WDqUuo7xaPLw/rfZ8QFvr+VdgCb1mVVu+Rd6b1f35uIWmjCb9dkqkfL97wRFBxZQavhfBAPiHJtcYuTPg/MF9Jo95YBSmm7XHaFN2aWvhGc7cqw8lctvXz8I8KxGvn5nYqCP6JvND2oQ1fztZHI+OW5JBJzhiHKsyvyRac6BDm5wS4dVt99Y21q++MHPl/pP3MvirjUeufWHj6wQY/ScDCdzVGyemAbOHNTs02GXvfxZQ29SSzjNX7mYmjxmTzPr5AoWwViRNYEJDzCMDkyULkLwM2/ISTA8AFriGp8rOuXit7UbRldZIwp73X9VS+lmTMIJ5+8iNrfSFZnETTXTzME53UdDm/sA7HHPdTQLOz+b8jXJSFMnfK82h06L+xXtLCq+wdHkDADTFiox/5VQGj4asSzGphpu+CBIfRJJ6eTuRbdzMHmt3IhgHArpsv1zOnAyg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(56012099006)(5023799004)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1J2eEE5VUI3ajVUL1NOeXZsV2s3R1M1emlEVDNraVFmUUtUR2M1SXFkaTNK?=
 =?utf-8?B?Z2xKMjhsS1BhWDB2TDVoS0pkYVB0SnUvNWhrMndSY3RqZmo1cmNBWVJtOVR0?=
 =?utf-8?B?THp1TFJaakoyZi92SFlRdTRFZm9CWEwvTzMvZlZzM083NTZVL1dNbWJqNUk2?=
 =?utf-8?B?S0RnNlgwdUpES0xrUUhmNlYxRjNGcVFvV3RVTllPV3FlMUZiZm5OTUU4L0gv?=
 =?utf-8?B?Nk8wMWlHMkUvWW04aU9DVWRXVlNvN2twTnMyaDJSaFV4clJuUFpySWVFZXNk?=
 =?utf-8?B?TnhuT2pRVGl1Nm1rQUxueThMSUdKYjZIMkdDYzh0YnJLU0xqVCs5c3VsV0Ny?=
 =?utf-8?B?N2lESEtGV2d2VU1VakNvMGRsZ0pXSEp3aWVEWklONHl2UHE5UTJLV3NnV0Uw?=
 =?utf-8?B?K2cvTEQ2clIvVnJlK2xkMHdma2R5WFdGNVlUcS9qYzJIR2xld2NlNEhjUnNn?=
 =?utf-8?B?MGliRUx0dTRGejM5MUJMekJTaXFzRG5qRVRIdkxIUUp5WjV6MUg1MCtnN3gx?=
 =?utf-8?B?N2E1UjNLVklIUFBkazg4QWpMcnJDNWg4aFJFQkkvb0o3Nkk3QjA1aHRLVDhm?=
 =?utf-8?B?eUlSb1k5NTBXblZmYWFRUDhxTHh1Mmg1Wkl5ZVZEQ2t5ZmNUT3pnVVl5Z1NN?=
 =?utf-8?B?ZjZ6OG9ZV0ZIeENnY0VkVnh2Q0JZdlJBVHhGYS9CMjIzTmQ3eWZOWTBScEpk?=
 =?utf-8?B?UWlXUDlVRDNxSGx6bVQ1QkppZkRIdUN4ODlIVTVuZitQSVBBRUhKQ2tqbHhQ?=
 =?utf-8?B?VTF0OXliek5XTllvZW0zUVQvcnlKWDZRQ0ErTFhyWTFtRWo3dk1UWlJpUEdZ?=
 =?utf-8?B?N2ZWMUJnbVl6bFRwcDBEMlVqZXNzRFpaTTI5WnhFdGJMMHB6YVJ1UEtuUDV1?=
 =?utf-8?B?c083eXhWSG9NUWlnNFRNa3NUblN0aW44Z2NxbTFPMU9zaXhYWnpBNEpGRGFQ?=
 =?utf-8?B?cXZSTnhnL0FvYmE3NFg2cFNMdGtodUFJREN5cHlDUnRjWFZ3MHpKYWJZWWZr?=
 =?utf-8?B?VmFhWGpSZUJtaUVYMHpzWlluclN1cXpoUkpDQkZsOG9NY0tUdnQ0aGNBUXM0?=
 =?utf-8?B?ME9BL1IxMElobFh3MDZmUmwwL09zbWQ2MUtCNDV4aE9pY2ZzTjM4OXJwaTJY?=
 =?utf-8?B?T0lKQ0VDNWRCbTZYbkh6eUpUUHZ4SzNRZWsyUXdlcXZEK29lNXVsMHNac2Zw?=
 =?utf-8?B?cEZ6alZmK3h6QzdneVlPV0YvYTUwclJvdk94aWRpSUdHS2F2bFRkK1hjZ21h?=
 =?utf-8?B?RjBXVjA3ZzczaS9ZMXd4UktHeE9idE5pdVVSYUNmejQyaVlwdU1hbHpsbldr?=
 =?utf-8?B?ZE5IdytwK1M5SFQ4ajlHV2dVK28vdXFodWZPZXRsZUEza2dWeTc0cmo5TzNi?=
 =?utf-8?B?ZGlQdjkyb0FWbTJZMzNZbmpaanRlNXFTdjRaaGZCUTZQZWZsTTBnKzVzRVNv?=
 =?utf-8?B?d1U5dUVHN2JaYlV3UE5HMTJGYm9SVXEzZTdpcFZFY21MQlkxamFaNmRkK205?=
 =?utf-8?B?ckpvZjVDUHFIQ1kxZ0dhdzJyTlNDNGh2UXhEZVhvR1Iweko0Zm9yb0doMFNJ?=
 =?utf-8?B?L3R4WUxHc05Rcm1TQWwySmozU0xkMENDQzE5eHlnYUxsQ0h5QlB0czRKRk5F?=
 =?utf-8?B?K3AzRWhPNVZXWDM4NUk1bmFQbkJnTldhRlBsdUZYd3o4eWtVZ3RxWWl2Z0ZZ?=
 =?utf-8?B?QWhMTzlCdGdpVUNObitEbllUOGI3VitGUlRPRXdyVXVHYVlDN2dSOGZUZUpV?=
 =?utf-8?B?RTdBajVwSW4yUjBwV0hCNkZtRGJlYVdUSTFmVDh5VkdVcUtXWEdkOTZtL3k4?=
 =?utf-8?B?dTU5NVN4R3dpMDhMNEM4Vm4vdjBPcTRnNFZseURad3prb3BaUm9lTURWem42?=
 =?utf-8?B?dGdTZUd1d1JaZ0lpS0N6S2NMSmgwZDdTcGdrRTBEbEVnZ0ZURkpDQXNOS2ty?=
 =?utf-8?B?NmJ0OEJ6TkdlTEJRd1kyTVRZTnZuOERmUzBzeGdVWTFBZVJ0ckU0THVoNExy?=
 =?utf-8?B?cE9rcGFWdFdWYWZKeGdzN1NmMFR0S3BYSUVqVDkrYnZaNCtMWjkyUitMMzMz?=
 =?utf-8?B?YWt1ang1VVcyUFJGNlZkM0M5SHFZOW51bnN2RVRnWm9YWXZJdEhjTE8yY3lV?=
 =?utf-8?B?c0hMTmpOL05XcjN6YnNJbURpN3J0amNtelV4K1RzRmVOT0VLMWJFQnhKM1lj?=
 =?utf-8?B?RFl1WEcxSS83bE9PL3RqanJ4WmplWHZ2VDdqSnZ2cjYxT3Z2WTZpOW1ObmtF?=
 =?utf-8?B?cTJkNkc3NzdzZnVFOVR3dm9FV3U1bUpSRVp1WUZDekdaMlg1aUlTV3ZDYUw2?=
 =?utf-8?B?MmFuam5ub053MksrZVVvb1dteUxuZXNxSVVCVUFrNGxlT01FVnJQVC93QmRN?=
 =?utf-8?Q?XUYlmfFJ/9HnWSVA=3D?=
X-Exchange-RoutingPolicyChecked: rwAckb0JHMhChOilR9pcc6AXC+1YF9mhtwWyXUVDK2sgTB+dUKWf7hKgG7E8EtPCnReJ99WaU4AU+J3gZjPKpjKbpsKDUckUZ3/vb/BxBli8brfr3GJJZTwN5ghVSU3mnMNGDMC8mb0iiZ4eFfwy4hF1Zv2jG1UmIryXEfg5UDnQEm0zniRG/qB4ZxRnua6joMN/35lEP8paSNS55/o6JsWUDekijo4RgRXFZvQg4JD4oKx0l8ZfXo3sRenBQEnWGn0rz8ux6us40Op5xb8vzxcK6OheH/J4hAOUTbYSvCU91nscHwGZfsc7oc/yhaPN2VZnYn8YUUTJqP7IN7sPYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b245d87f-f7a5-4212-a8aa-08dede4a443d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 06:12:49.0368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzBe5aP6jo4y1p3bL4+oBuoRuqodJfhS7mdRYuOyHyrxQI+VbZh1f7vXXB3Qqp/IPTtZpTpYUMRXFSV0d04YT9jKQPpYBTHfq7PfnIqVqxn5B4aFmBBxr90qGWoyoUiS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
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

Hi Jason,

On 29-06-2026 07:23, Jason-JH Lin wrote:
> MST (Multi-Stream Transport) outputs require topology-wide HDCP
> authentication which is handled by dedicated dp-mst-* subtests.
> Running SST-style tests on MST outputs can cause issues because:
> 
> 1. MST HDCP authentication involves the entire topology (hub + monitors)
> 2. Per-connector HDCP state management differs from SST
> 3. The dp-mst-lic-type-0/1 subtests are specifically designed to test
>     MST HDCP scenarios
> 
> Skip MST outputs in get_hdcp_outputs() when running non-MST subtests
> to ensure proper test isolation.

IMHO, I dont think we should skip all MST outputs in
the SST-style tests - this removes a lot of coverage. NACK for now

You will see a lot of skips after this any mst setup will not run 
individual test on those monitors. We want to test individual displays 
even though they are connected in MST.

The tests (legacy, type1, lic, uevent, srm, mei-interface) will skip 
even if a single monitor is connected through a MST hub thereby a single 
MST display would then get no HDCP coverage at all.

Please let me know your thoughts.

Thanks,
Santhosh

> 
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> ---
>   tests/kms_content_protection.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index d931ce7682be..9d1728ed82a6 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -751,6 +751,11 @@ static int get_hdcp_outputs(igt_display_t *display, int content_type,
>   			continue;
>   		}
>   
> +		if (igt_get_dp_mst_connector_id(output) >= 0) {
> +			igt_info("Skipping HDCP test on %s, MST output should use dp-mst-* tests\n",
> +				 output->name);
> +			continue;
> +		}
>   

>   		if (count < MAX_HDCP_OUTPUTS)
>   			hdcp_outputs[count++] = output;

