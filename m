Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1658FCEE350
	for <igt-dev@archiver.kernel.org>; Wed,  9 Oct 2024 21:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B906610E813;
	Wed,  9 Oct 2024 21:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7aLETMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9077A10E813
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Oct 2024 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728509899; x=1760045899;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=78fj6J8Nw96xhJ7/J5Hc4ALR+PjOIfOqNI3g77F1wq8=;
 b=A7aLETMHyT14adFgdjkOJd/ckIuRWeFRnCbPmpxj7PvNyRuiN6xOeYi+
 tzKLL9abwWUkFVXnPX7xGIc2Cm6l55GEca5JahJn2ovjdsL7wCjBYt+mN
 bWy/y66q81GeLnVxg/1iWm/v47DpRFNoRk24sDsTH7EbiOhG7Hq8/Cj9z
 gj4BGRHIwozgBU37mNrJxLC3p5kDHjZJukwmtdpwzDF1F661U86xME7yS
 xbF/epex5a02h8nQUp7s3rzglZl/Uguhr+HJu4fzEZovbwkh96wU1wjc+
 wwZNr3mtqOy0ifZfy/+YIUx0aykd3fzFBkwQ4qPuAPb6yw4n/eY3R7Cg3 w==;
X-CSE-ConnectionGUID: Znv1D90USti357DyRtpEtQ==
X-CSE-MsgGUID: gY0pW+ABRL2uij1UOtzfaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="31735587"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="31735587"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 14:38:19 -0700
X-CSE-ConnectionGUID: 35UFliW9Q922wbbd2SzCUQ==
X-CSE-MsgGUID: DvRlVUDxT0O6xd/tpBeXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; d="scan'208";a="107233875"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 14:38:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 14:38:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 14:38:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 14:38:18 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 14:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlUBl2B8G7mUmax+PqwqrKK7wj0KZMs+btudKHAw2y1apH+2wwY6WaIiWuV+hgtC21zwhEkkEt5fHyIfmJLvW8EsCZObG0CsroZ0pk8YlptgRtYaJgjeX8oTXpyleKEJFXA5HxXmUmW08kIR48yPJut5sgfJylsZe6XdXL5QVZ7FAFa2IP/IkM7RY9eGI9n8yem7ZlsxGJ4Ox4ooAAUAcw+Iuxdvje/EXlRJCop6/aZyy7gQzKIQWEkw0sEJ2K+lDFkoJAlZf8IRyyyFy34HQb6JcjilRyx4dl2rfnZRWXq30rtr1A/HQeLC/5Ey58jrriq2QoEeE8zK54rrihKISA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sl9tYK6t95e2o5LiGTACx8LNRQYpYPfMJORPOLDYeFQ=;
 b=M5miZytB0Z9Mwy98cadCMe1J12sr/6OIHbuK9SMix61Torjh2za9wYWvnMTJN+nlq0/0H/53+cwVXW6qlGtYNmRoFp2MctJyIl1Km1W30oEEEHxETLFPiALT4iYbhsk48Uc+a/9w2091pfDOWo6uO1rGLF35iMvgRgikfFTbU/j/gCp25ShUUyKTTx4kh54AttK4UeOMNx22zfRy1xWhPaSEWNUwuGjeOHcn8nVjEbJ0rAw8lgh6gd1pPNNCVIsgRyNwFNE02jYRI0ccBhcTWisqFP4TjbSCctJB80L0wBH5adh569E/u6/H/b8qvaEMRg3Z/4pfql2NgiFRuCsGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA0PR11MB4685.namprd11.prod.outlook.com (2603:10b6:806:9e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 9 Oct
 2024 21:38:15 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 21:38:15 +0000
Message-ID: <a5fb50f3-4d6f-4f43-b176-12b4af959486@intel.com>
Date: Wed, 9 Oct 2024 17:38:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] xe_exec_capture: Add xe_exec_capture test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20241007221348.3559076-1-zhanjun.dong@intel.com>
 <20241007221348.3559076-2-zhanjun.dong@intel.com>
 <20241009104018.f4ffhin2fczgh6pj@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20241009104018.f4ffhin2fczgh6pj@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA0PR11MB4685:EE_
X-MS-Office365-Filtering-Correlation-Id: 4412d779-8e85-4e6d-40a1-08dce8aaaeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHRUekRrTjdZamZ1ZnBzQmpFMjI0Rk1SY1pYUlRGL3FLUUJGWGNNdWJLenhn?=
 =?utf-8?B?VEdGWFBzY0h5djQ2eGZWZmtKR0RmZitXTXI4NVJaTXhscnlhN2VkSFhWVkVr?=
 =?utf-8?B?VHE0T1NGM0ZaY0VJTEg4N1lUYzJMMklJUmlMRXF5cUlnUWpUdVFsZUZSUUxj?=
 =?utf-8?B?RUI0WEVXR0ZCL0V1c2phV2E1V3dQYXpMM1JEbGh1MkFzdzBHb2orL0w0ME0r?=
 =?utf-8?B?UnJ5NHVoYTVNbDVhNlU3ZVFTUWRDakp0bnRNMmF5S3ZnRjl3MDN5V0ZrUS9S?=
 =?utf-8?B?VWxzNm01WjBBZ3lJVjhrcjh4QXVIL0gwZXpERFEzWHBGS0p1YmpVWXJ6dnZr?=
 =?utf-8?B?azdEdC9pT1pXeXV1bUFvd2hLUUNwUGRpeDJCV1RqZnJFekVoay9MalNIdFJt?=
 =?utf-8?B?aG1kMGhSVDFOYStXZ0lFTXRxMHB6K3VQd1RQUEc4Nk1JbjVjNkNVT1R2d2Nw?=
 =?utf-8?B?NUJyL2U2L2plUVYrVEV5QVVYd0FzcW40Vzh6eUtqQ0pVMlRVUnRpWkxvQWZT?=
 =?utf-8?B?Y1E4eVdqUXh5TndJZmVTdC9YMlduVFlWOHB1eGpZajNOaFBUaDVkMXdaKzl0?=
 =?utf-8?B?d0p2OFFiRThkdDUveDZSc29sL2d4QnJWQjJYMGxjSFMrTFBpbzNqSGU1MnFX?=
 =?utf-8?B?WUM4WTlXL2lLdndqZzd4akVaS2V6ZTgvVDBVWkNVNUpsYmlEMVNHenQ3bTJW?=
 =?utf-8?B?RlppeUVnWWJWZXJ5V3lnc0JGN1BYNm05Q0tRZmhhVUxMQzBFcCs3SjNuT2JC?=
 =?utf-8?B?YUExOGpIdnB5eGk3SStBU0YrYjkzb0lQRWJFZWExQTdROTIxT2M1MFNQcWY2?=
 =?utf-8?B?TzIvd3RFdXBaY1FXVUl3WndrTUdYVlN1R2pMQi9JelRDNm9oeXhxTTFQVU5m?=
 =?utf-8?B?ZHlON2pUY2k1Slc2Q05QSTFJWWN4RkMzVk53RHRlWVJCRjRudHlVZ01LNFRN?=
 =?utf-8?B?K0JweDczNFViV3BpdHdUSWttWC9oT08vc3JiWUEvZFZYSEV4WVB4cnpLSGw5?=
 =?utf-8?B?NmJoQVd3bGJsVERuQzgyRWF6WCttb3g0WmJiUXZFUUk2OThnTXk4aTRBUWl3?=
 =?utf-8?B?TGZjcEV6enlpOXRYTEJEUXVadGJ0Sm1lQXBwK0hKSU9JQ2U2N1VZWWFZZEpy?=
 =?utf-8?B?WHByTkRxQit0ZDkrUlRkdzMrQThkM1BBTTQxQ1pzZ2hqZEIwTFJ0OExjVXF3?=
 =?utf-8?B?am5raFZ2VVZQOHAyTm91TXdLQTBWdlBLdFp3amFzd3NYZlpHUUdPTHgwdFRq?=
 =?utf-8?B?QTlsU3pMeUFzUmxubWJkejN6ZDUwYnhDOUtWQlRpMVFYRFk5byszOHNWZFRr?=
 =?utf-8?B?Z3lNdXVwdE9WUWtCVFhyTTk2TUVCVFBzd3BkWlBvOFhib1BFNTJOd1ZEYnFj?=
 =?utf-8?B?UXFBaUp1bjNVdWNYVnllUWU0aVVDbjdrR3Y4a21pc0lXbE15dG5HY2J2M0JL?=
 =?utf-8?B?QklGMWVUTklmckxhOWdnNk84OFYvRXhXYjRBOXlzNVBXK3hObW56amRlUTk0?=
 =?utf-8?B?TmNDRTBaRklWR2JBRzlxL2s4SWxVVk5hV2NSTndiQWc2d2dPQkM5b05SOXlM?=
 =?utf-8?B?SzRhSTlkcUkvUHFUc3RqTjVEeDRUQndvRS90Z0txbzhRNXZLd1pETVAzcENq?=
 =?utf-8?B?aFBsc0tvWnRCTEpoOThJd05oMm5mR1ZlZUtWVkR4L2FNOWFHSk9CNVBoRk0v?=
 =?utf-8?B?WHpGVmdxcSsvNEQ4NmkzVmU1MXlmRXhpT2p6Y3gvZXBzZXA2S0FKcStBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTN6MG1hOTM5Z1ROL2tHODdYK2Y4MFRLdkZVQVl2OVRNa2M2bDR0bW5RbkZQ?=
 =?utf-8?B?alR6ZUE0RWN5YVAvc1l2SnlkaHN1MFZmSU1peFRLVjdRcm1qOCtZdzdiZVdh?=
 =?utf-8?B?Wm03WEtVZU0yd0MrOXRwUVJETDNINXlVVzlPTHdhdEZxYlhtWDJxRGYrNG9K?=
 =?utf-8?B?MHlYcmVBZWYyZ1QxYkRlaDEyVVdkS3gvWldhSithNDhNQTA4UkpQbFlPRXU5?=
 =?utf-8?B?ZlRSTFJiaWxHaXMveFQ3VkxINzE0VzE4Ui9UMmxmQ3cyRjhWdUx1Tm14eU03?=
 =?utf-8?B?YjREdXFsQlVLMVRoQW5nclc2VWhUU3dOWVhESGljaUltT0tZS3lXSHUwaWFB?=
 =?utf-8?B?UFIvSDlxQXNHWHpINjdTUC9vQTkzRjJaR1JIY2hWMmVLcFEzRWJjQTVoUXl0?=
 =?utf-8?B?N3NSeDE3TitsdWFoNEpLSWFzakl1US82MDBRU1d5cFlPVVgxbjc3alY5dE5u?=
 =?utf-8?B?c3FhSjJaMWNhN1J1NmxSaDhjZ29MUEhsVDhKSHdHaW5GWHczUnpPams3d09L?=
 =?utf-8?B?aVgvOC9paTI1WjdSYmlTdlpwREpGT1QzUmRRS2l2R1ZBK2N3V21xMWJqTGNH?=
 =?utf-8?B?WW94K0tZalZVK1Yrc0VUYVJuZnpWaHhwa0FCVjcxN2JFclQzdEN2VGJHMWg2?=
 =?utf-8?B?RFRiZDZZMXFkYTJlcTNBU0s0Nk1xUW1kTkZFaEx3aGJUWkwxRmdTSjdKbzZ4?=
 =?utf-8?B?ckc1RWI1VWhHcE9jUDF4NFMzWGprdzlaNzlDbUQyWlgxK3VyVHdNOE5oK0hv?=
 =?utf-8?B?cXFGanJkVE9zSjVCbkI1MStEakNXL2ZDU0FxcjhraW1NUmxDdURwZE5DQ2VG?=
 =?utf-8?B?NXIwM2Q1TCtEbGJxbkVCQW9YUUFqMXNvZWQ1cnI2NTA1RGl5cEpreDhxQXlJ?=
 =?utf-8?B?L2NiaERkYk8vNXBRcSs3cGlkNVBKSmR4M0MvQ0d1ZDNNcWpJRUFIaUVsQkJz?=
 =?utf-8?B?SDZOUEpoNzRrYWt5RVF1eGZKSktydUQ0YStNOUhaSjhNR0Q4VGR2TzZJRTkv?=
 =?utf-8?B?R3UrU3NGNDRlOXpPSHZZNGxwRUdJUloyUjB1N2RJMDdwZGVzQms1cWYrcFU1?=
 =?utf-8?B?Vk1vV0t6Z0xSWXpOMGVpU3FZSE11dUVtSG9GeE1ZdktrM3l4aWVBOTNQOXlD?=
 =?utf-8?B?YkV6Yk44VDNObGdhd29ZL214S1E1TkE4anEvQkdXVm9nd2t3dk50eGtGSFJK?=
 =?utf-8?B?OUJ0NVBFZk9uYWxROVJNZzdHQXhUYjdMVUhSVTU1ckFIbHBtaWlFYSs3SG1E?=
 =?utf-8?B?MjNiWkZGdUd1TWdPbWVyRnN2RFhibmZQb0luekFrYndaeEp1S3R6SERCUFpJ?=
 =?utf-8?B?VW5JaHNTQUNPZ0Q3NkJRV1hhY3VoNytDMUwrUG1MV2Mza1JwKzZnMXZOU1lM?=
 =?utf-8?B?ZDU0U2hiVEt3SW01RnhiaDlpazI1bFJyY3RuNURiVm1jZ1l0REdZeHNHR29C?=
 =?utf-8?B?R1BMU2Zia083WTNHZlk0aTRqQVFxU2pJZUdvbDBuVWRYVExINTNiRTJwRTdp?=
 =?utf-8?B?NGRYOUM4R1h3K2N3d2RtWHRqQkRwUW1RL1c0TUlxNUNudHNLQ2ppVG16ZVhM?=
 =?utf-8?B?dHMvcXFNNEtkV29vZjNyMitvQSsvNmx3eWV5YTZ0WElLcHl6M2xjLzBGY3NW?=
 =?utf-8?B?VWNHK2tDUFR0WlhvZ0hhUlV3NVp5Nm1XZW9LdWFDR2N6dHhMck9mUmlpUFc4?=
 =?utf-8?B?aFNGaUorbGI5UGw1Rk5tRVpZT0JnMmhkMjJBM29ZcWZ4TlZiN3FGb1lTeEtp?=
 =?utf-8?B?enBzZjRKdWFDbytDSkhpUUdZdVZsSUtvMTF4RDcrTE01LzBFNE52aVNtUmFp?=
 =?utf-8?B?L3pEYmhzZ1VvQVFoUHRCU2tZVExMNmpYanZQUEE5YWNPUG5sNTMvZ0xvZHEv?=
 =?utf-8?B?MnlVSVpXNFd1SjhUaFJVSXlMZHdNbUdKVTlCcWFyNGJncmNtRlM3V1oyeDJQ?=
 =?utf-8?B?QmZyTm1wbktMcWNURjF6M05maXJXU1h4dEMvOS94ZlBJNGxKN29LQjdnZU1O?=
 =?utf-8?B?YXRaZkhMV1Z0bFJEMVpXUmFabU5ISEJ6eXRqZ1N5NkZ6K3dtTThjTDBrd3ZX?=
 =?utf-8?B?QWNaUmJDY3VWWXZCbkZ2KzRibm40UDNKLy9XQlo0S0wxcGpneXArSGtwQVA4?=
 =?utf-8?B?WjBKSVJSeGhlWDM1Q0FXOEIvWVEyR2Fic2NQMHlNaUE1S3Q2Y0JKNFprdHpM?=
 =?utf-8?B?OGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4412d779-8e85-4e6d-40a1-08dce8aaaeb6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 21:38:15.4725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uApivMmY5UQA2m8YvgmaxUGSSI88iU6jzoSnFjZoHV9eMaMsdr3qOikFBroolj5O889y0y9U10D9ILLaiggvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4685
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

Please see my comments inline below.

Regards,
Zhanjun

On 2024-10-09 6:40 a.m., Kamil Konieczny wrote:
> Hi Zhanjun,
> On 2024-10-07 at 15:13:48 -0700, Zhanjun Dong wrote:
> 
> please add 'tests/intel/' prefix in subject, for example:
> 
> tests/intel/xe_exec_capture: Add devcoredump test

Sure, will add in next rev.
> 
>> Test with GuC reset, check if devcoredump register dump is within the
>> range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> ---
>>   tests/intel/xe_exec_capture.c | 227 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 228 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..3ca137989
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,227 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <math.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES	16
>> +#define MAX_INSTANCE		9
>> +#define GT_RESET			(0x1 << 0)
>> +#define CLOSE_FD			(0x1 << 1)
>> +#define CLOSE_EXEC_QUEUES	(0x1 << 2)
>> +#define VIRTUAL				(0x1 << 3)
>> +#define PARALLEL			(0x1 << 4)
>> +#define CAT_ERROR			(0x1 << 5)
>> +
>> +#define CMD_BUFFER_SIZE		1024
>> +#define MAX_PATH_NAME_LEN	512
>> +static void get_cmd_output(const char *command, char *buf)
>> +{
>> +	int length;
>> +	FILE *handle = popen(command, "r");
>> +
>> +	fgets(buf, CMD_BUFFER_SIZE, handle);
>> +	pclose(handle);
>> +
>> +	/* Remove trailing space */
>> +	length = strlen(buf);
>> +	while (length > 0 && isspace(buf[length - 1]))
>> +		buf--;
>> +	buf[length] = '\0';
>> +}
>> +
>> +static void find_devcoredump(char *card_dir)
>> +{
>> +	get_cmd_output("sudo bash -c 'cd /sys/class/drm;for dir in $(ls -d card?);"
>> +		       "do if [ -e $dir/device/devcoredump/data ];then echo $dir;fi;done'",
>> +		       card_dir);
> 
> Please do not use outside commands like bash, awk or other,
> use only C and parse it for yourself.

Got it, will do that way.

> 
> Regards,
> Kamil
> 
>> +	igt_assert(strlen(card_dir) > 0);
>> +}
>> +
>> +static void rm_devcoredump(void)
>> +{
>> +	char command[CMD_BUFFER_SIZE];
>> +	char card_dir[MAX_PATH_NAME_LEN];
>> +
>> +	find_devcoredump(card_dir);
>> +	sprintf(command, "sudo bash -c \"echo '0'>/sys/class/drm/%s/device/devcoredump/data\"",
>> +		card_dir);
>> +	get_cmd_output(command, card_dir);
>> +}
>> +
>> +static void check_capture_output(const char *tag, uint64_t addr_lo, uint64_t addr_hi)
>> +{
>> +	char command[CMD_BUFFER_SIZE];
>> +	char output[CMD_BUFFER_SIZE];
>> +	char card_dir[MAX_PATH_NAME_LEN];
>> +	uint64_t result;
>> +
>> +	find_devcoredump(card_dir);
>> +
>> +	sprintf(command, "sudo awk '/%s/{print $2}' /sys/class/drm/%s/device/devcoredump/data",
>> +		tag, card_dir);
>> +	get_cmd_output(command, output);
>> +	result = strtol(output, NULL, 16);
>> +
>> +	igt_debug("output:[%s] expected:[%lX-%lX]\n", output, addr_lo, addr_hi);
>> +
>> +	igt_assert((addr_lo <= result) && (result <= addr_hi));
>> +}
>> +
>> +/**
>> + * SUBTEST: close-fd
>> + * Description: Test close fd, check if devcoredump register dump is within the
>> + */
>> +
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>> +		 int n_exec_queues, int n_execs, unsigned int flags)
>> +{
>> +	uint32_t vm;
>> +	const uint64_t addr = 0x1a0000;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t exec_queues[MAX_N_EXECQUEUES];
>> +	uint32_t syncobjs[MAX_N_EXECQUEUES];
>> +	size_t bo_size;
>> +	uint32_t bo = 0;
>> +	struct {
>> +		struct xe_spin spin;
>> +		uint32_t batch[16];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>> +	int i, b;
>> +
>> +	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> +
>> +	if (flags & CLOSE_FD)
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +	vm = xe_vm_create(fd, 0, 0);
>> +	bo_size = sizeof(*data) * n_execs;
>> +	bo_size = xe_bb_size(fd, bo_size);
>> +
>> +	bo = xe_bo_create(fd, vm, bo_size,
>> +			  vram_if_possible(fd, eci->gt_id),
>> +			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	data = xe_bo_map(fd, bo, bo_size);
>> +
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +		syncobjs[i] = syncobj_create(fd, 0);
>> +	};
>> +
>> +	sync[0].handle = syncobj_create(fd, 0);
>> +	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +	for (i = 0; i < n_execs; i++) {
>> +		uint64_t base_addr = addr;
>> +		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>> +		uint64_t batch_addr = base_addr + batch_offset;
>> +		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> +		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>> +		uint64_t sdi_addr = base_addr + sdi_offset;
>> +		uint64_t exec_addr;
>> +		int e = i % n_exec_queues;
>> +
>> +		if (!i) {
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>> +		} else {
>> +			b = 0;
>> +			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +			data[i].batch[b++] = sdi_addr;
>> +			data[i].batch[b++] = sdi_addr >> 32;
>> +			data[i].batch[b++] = 0xc0ffee;
>> +			data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +			igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +			exec_addr = batch_addr;
>> +		}
>> +
>> +		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +		sync[1].handle = syncobjs[e];
>> +
>> +		exec.exec_queue_id = exec_queues[e];
>> +		exec.address = exec_addr;
>> +		if (e != i)
>> +			syncobj_reset(fd, &syncobjs[e], 1);
>> +		xe_exec(fd, &exec);
>> +	}
>> +
>> +	for (i = 0; i < n_exec_queues && n_execs; i++)
>> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +					NULL));
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +	syncobj_destroy(fd, sync[0].handle);
>> +	for (i = 0; i < n_exec_queues; i++) {
>> +		syncobj_destroy(fd, syncobjs[i]);
>> +		xe_exec_queue_destroy(fd, exec_queues[i]);
>> +	}
>> +
>> +	munmap(data, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +
>> +	check_capture_output("ACTHD:", addr, addr + sizeof(data->batch));
>> +	check_capture_output("RING_BBADDR:", addr, addr + sizeof(data->batch));
>> +
>> +	rm_devcoredump();
>> +}
>> +
>> +igt_main
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture
>> +		fd = drm_open_driver(DRIVER_XE);
>> +
>> +	igt_subtest("close-fd")
>> +		xe_for_each_engine(fd, hwe) {
>> +			igt_debug("Engine class: %x inst: %x\n", hwe->engine_class,
>> +				  hwe->engine_instance);
>> +
>> +			test_legacy_mode(fd, hwe, 1, 1, 0);
>> +		}
>> +
>> +	igt_fixture
>> +		drm_close_driver(fd);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2d8cb87d5..b724a7c6d 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -284,6 +284,7 @@ intel_xe_progs = [
>>   	'xe_exec_atomic',
>>   	'xe_exec_balancer',
>>   	'xe_exec_basic',
>> +	'xe_exec_capture',
>>   	'xe_exec_compute_mode',
>>   	'xe_exec_fault_mode',
>>   	'xe_exec_mix_modes',
>> -- 
>> 2.34.1
>>
