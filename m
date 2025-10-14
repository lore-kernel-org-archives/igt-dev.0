Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490CECCD184
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 15:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027AD10E649;
	Tue, 14 Oct 2025 15:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Be+5y/Kv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 414D910E649
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 15:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760456713; x=1791992713;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=Be+5y/KvAQAIokWVGX9sIPeCxbvbJOGByRMReYkwabjPGAHAS7jTC0Kj
 CHQaz9Cj5v1jZeL1l/yJHWBSjP70zzHHh82adBwGd9toTwGmPjjjSlTvZ
 Cs+/8RbY3SeNyEL3Qc8W0CrhGL8fW6mN8Sp8RR7IlEdgCgur2jOyy43jO
 WdfTiqLdbEqTDcFIHmdIxLZTr+GR+OCiLlVX9rkN2vIQkxxLvJn2ly5mC
 KhxgTIkxsUTBru7fKg/hfzlC0hSpWd9JEXWWL/jitW+thwW2V2z8dk8GS
 SUaJclx3j11/HV4RayZI7uGVQ/dXRqC+wX1Nk84lRNZWvfQHbL9ed83JT A==;
X-CSE-ConnectionGUID: mtTIukDATu6a9yyFW09YZw==
X-CSE-MsgGUID: V2VGD6frTX+vaJcIeOFSWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72889454"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="72889454"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 08:45:13 -0700
X-CSE-ConnectionGUID: NTiFSKk3Qf+6NBCE479VIQ==
X-CSE-MsgGUID: 0Hvca73OQJWim9fTch60FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="212531093"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 08:45:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 08:45:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 08:45:12 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 08:45:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwmW+oZXtD43VOgbe4acm8lF5ilW5YCfAclFWDkhqtufZFhvQsNItvB1t7pixpp74bT9z40/he6uwYmT62pTEeebh3FDfr+KWhyUVzv3b6/B/HI1FiA/ef2eoJHj48LrIajKUvPjFxj433Fx7zERpRe+cN+qbefx31yaRp8+lNn/gi4oMF6Ahjuk6hFAxRJXULTb+RlaEMxMcJierV9XTN9M+AZopIz5ecoCpgc6ub6DAGzMaSDNgqc4uw3Rqkik1BrXLKo6amW5gOOEgteu4QVo3bZWPPgGdX/EVwio8Luxa1EI3M3kR1ppl4MWHrdVnOzqf59YB7572xr+JwKycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHlc2XIV6K10o8MXssor7PU0cJe7FyHamekWWu3fmjw=;
 b=t8LNE1BBzBar+fvyK5aJkPm9lo1FRKChnB1Lz41wEWjljzZu6YaFYiT0XjO6GBYvFD1sCMYTW5+DoGmyMzfP/HLZXmKRLcBKsAqVP1UvV3+DasZNSyaShc/9+S5AKC3fX66enKyAEuFHmGX/sdZS2lPzNdXXlAmFeeMSciq1TaYSfze7xP67GGuBpgeEOEH1R6IjQuAVDyslMagPK2y2+oP8L/qi9s39O/dpwV+pB67MgGZfH89KO9vFNmRpY4kqo5LVuYmnbrFq/WCePx8RxeJtsBmpxOJzc+oV7Fj92ud4EjzSJQWKckJeYAVmgcxcnuM5XCya2XJtf3GPPAHHJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS4PPF691668CDD.namprd11.prod.outlook.com (2603:10b6:f:fc02::2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 15:45:10 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:45:10 +0000
Message-ID: <44250384-b520-4ca2-b775-da1ee1f7f88b@intel.com>
Date: Tue, 14 Oct 2025 08:45:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/intel/xe_fault_injection: Set guc_wait_ucode pf
 only
To: Zhanjun Dong <zhanjun.dong@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251001151857.104568-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20251001151857.104568-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:303:8d::35) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS4PPF691668CDD:EE_
X-MS-Office365-Filtering-Correlation-Id: e9beeed2-865e-46f6-610a-08de0b38a7fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm5LSzBtN1RLamdFUklQNlNGWnlYWjRNV29wS1VDay9mKzBNbU1LNVdjM2xr?=
 =?utf-8?B?Q0NFbzNoNitHOFdXTC9zTEl5Z2x6RWVSSmRSa3JkTXc5NjFhNDJwZHlCK3BT?=
 =?utf-8?B?dy9iZG1UNm5CcmxTOWg3TENHQ2w1NGlmZnVzZllYUFlybmVqNVVlR0JOV29m?=
 =?utf-8?B?S1dwVlEzWCtSMHBIdDBUeEtlWFhpd3VtMi85NVBRQmk4Qk9UaXpEZ0E4RTUv?=
 =?utf-8?B?Zk1GOE1sYk10S1dBRVFLUlFQcFNHT3FrTUExdFVGV05BN2VWWVVHRVVvbS9x?=
 =?utf-8?B?REZ1bnBPTTQrcmNCbkZuOEU2ZFpoWXE0aUdnWjF2OUFDKy9PcEtOOEE4SWYx?=
 =?utf-8?B?NFZRdnU0SkM0THhLUUh2bXpCQzZRK01ZTGVvWlZlU2tnbndzSjVKZi9rUUov?=
 =?utf-8?B?d0hsNWdyeHlOWWhUa0V4c2RKS3RnbFlGQ1dKb1JsVFI1RjlacXFTVlNuSVZj?=
 =?utf-8?B?ZnpNTkhVdDJvcHhTRVQ4RUZqSG03VDVGaXp0cy9CZ2plckhPcFdwb2M2aWc5?=
 =?utf-8?B?NVE5amFOa0kxZEVpNFpSeGhHVGZndDhqZnlGWE1TK2pxRmhrdmVJYzJvNGQ0?=
 =?utf-8?B?MkwzTm9CTlJUdUdaQXZITkJLOEtuV1NVTVE3dTlhVlNJQ3VGaTZhd002cUkx?=
 =?utf-8?B?TVZWOVhldVQrMWNZMENoWnNmTHdQQ1ZXdWV5L2R4NjRKaXhHZ2dSQ2FWRENk?=
 =?utf-8?B?ejUxZHZ6cS9RWVlXR01HTUliaS9FME1kU1l4MDZEUG96cjNaM1U1RVp3MEND?=
 =?utf-8?B?OWorOHhMZkFuNSttc0I0S3hqaHA1azB5cFFGaG84MjhGWXJQRVM5U2phY0ZL?=
 =?utf-8?B?VlZjdFdZRXRGdjl3UGEveG9rUTZIeW9HM3VwTlVpWXk5dEVoNGRnTWYxaWM2?=
 =?utf-8?B?UytlWjJsRHJ2L2lqZ1hFaU1qRmZ1V2xRa2hHRkpZU2gxZ2wxdDJUeGlVUzNi?=
 =?utf-8?B?MnduRGJzemZKQnJ6aGFUL1VCRnkzQkU0VE05cFBUNzMrVVhKOTQ2QURNSHhD?=
 =?utf-8?B?YkJvSkpyTENQczg3YjNrcFN1RXRteVpURDVwZ0M1SFZpbnN6SHhoTTYwOWF4?=
 =?utf-8?B?cmJZbW1xTVc2VUsycmkwVVgrUVplb1NpZTZubGcvdTRXa2NkQ1R3R1dUeXZP?=
 =?utf-8?B?bVM4bzAzKzV0Tmk5VmkxVFFCNGx0V2U2MVhKUXYvVVc1aGhJVkUzM01sWm56?=
 =?utf-8?B?ZWM3RFpZNVl4UjQwNzhEd1hwSTBBa2hWSTR6S1BsR29tSUNtUHZBSUdQbHRn?=
 =?utf-8?B?OS9sMUNMWWwxMVBSYWl3Qmw1dWduRGVtazZRU3NMR3BGZFZyZEprcFI3M2Ru?=
 =?utf-8?B?Vy9wRkNCa212QzNIN3dLT3NxcEJUVjFZVGNPTWwrMjN3OVUvaTJSaVhlWnhn?=
 =?utf-8?B?TWZabWVRR0Z2TythUmRBMzN6SFg1Q284dFdtY2thQy96QzNHTU85YWt1RDlM?=
 =?utf-8?B?d1BnWlFRRE4xaU8zeUV4S3pZQWZNbmJWcEVLc3FQa1hVVlZicmdCVXptZEhS?=
 =?utf-8?B?eHdmZ2M5Y2pQbFIwbDUvVk5UWVBGSU9OSzFoSlh6MCt1VjBha1lZUDR5cmJV?=
 =?utf-8?B?U2NQUkpRVlV6eERsVk5UNmt5b0JWNDFmeGlpQnBjb3Q5U2VET2NVTTh4akx6?=
 =?utf-8?B?c3BsVDB5WlBETVljOU9JcEFCbDVXK09rL2tIVnNvUjYvaUZPd29ORFdUUlNB?=
 =?utf-8?B?bGtiZW0zczJ5V2lJM2o3LytvdHdTeWJhbG11Qk5SN1Z4RnFKa3VKSmpMdFJm?=
 =?utf-8?B?N1FvT1QwVW5NUDdqa2FOZ3ExOURZUVNCb242RmtqSEt5ZURqM0VEdE83Nm94?=
 =?utf-8?B?cWRnY3IvYlgycU9kamRHV1VhUDY2cHExdmtrTy95U3NGQW1CZ3M0cCt3NUx2?=
 =?utf-8?B?cjE2aDc0R1pxd1Q2aGdvZDdSWWRXdFR3Y0ZlcW9RNFh1ZmJKSE4rNkNRTm1E?=
 =?utf-8?Q?U1rlITuBQytKL4osBa32DVw1+3rC/73O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUZ6RUZSZ043TnhWOFJTcTZPZzh1SmFqRm0xNnVMYjNoZlloK3VuRzBReVhx?=
 =?utf-8?B?WVB0cmdJdlpBVDRhQWxqVnpNZmZmRmRRbnlxTEE1d0NjSnFkYVRkQVBua0E4?=
 =?utf-8?B?aUZmaEVRT04vNHcyYVhxOGNRT3dSYkFYLzlUYXRRTmRtNjZPNHlmUk4xSmJh?=
 =?utf-8?B?MWE0SDM1NzlKWUhhT0I0L3A5anI1L2tKT2VaSCtOTW1lQkJZQ1FSY1NSTGhx?=
 =?utf-8?B?VkY1OTBkQjMrN29pWlpEUnUwYmZ6eXdlSEtKblpFOEdKREdNdTF1bFRNTFpI?=
 =?utf-8?B?YysybmcxWmVoL2NBUmdONURwUWoyRVN4blBnUkNaV09Qcms5SXpUZloyRGxE?=
 =?utf-8?B?ZVlPKzlmVll4aHJRMWFwdVFqS1J5OFh2eTIwZTJadzRhRSt3NHlYbFNSQ2cv?=
 =?utf-8?B?YjdlSUFLODVoVmxvenlzRVJhaS9OMHl2ay9BU2R6aHpIdFZIbTdDTk1Bc2kz?=
 =?utf-8?B?YTZDa29hREZIZnJQRG15WTlhbnNLL3BLQU1EZFlMdzRELzhlKzFOZERlM3Rz?=
 =?utf-8?B?eGhETlhqYkRndzFiR25SWWNDSGw4Ky9oenc5Sy92MTc2eU1zNVNxZFM5TWtZ?=
 =?utf-8?B?eW5KaXIxL29ReUlyOFhaSFdKKzl0bXZKTEhHRXhUYjNia2lRalRkQ1NjRUFB?=
 =?utf-8?B?cEtZeVZibGRMSXlmVHVkUndpNVBiOW1nZHR6OUl4cTkxY2FuTXVDdm5IZFZJ?=
 =?utf-8?B?aG1XTWI5V3lMcWdaKytlZFc3TER1bkRhNmE1Vy9VU2dLc3FkOG1xZEgzd1Zq?=
 =?utf-8?B?Z3pyQjdDRStmTWQ3SFNNdWJRNndCSmRHZHFueDNwY080Nm95TzdnZmR5MmZD?=
 =?utf-8?B?czhMVzA2MVFPWDR6bzg1WVkrN2srdEZqZGZFZzhTN0pYMG1jZ3BrU0F1Qk84?=
 =?utf-8?B?WGp0ZmRlcWxWM3ovSzNoaUtNSmxQKzJrTW8yUjRoaVhuUXQyQkdCdHlYYW4y?=
 =?utf-8?B?RDkwOHRHNXFFSk5XWS91YmxEQlZROTVkamlweUY5ZFluQXhiN1RtenRJSkFy?=
 =?utf-8?B?RkhKM0U3dVB4S1hpVFJ6Y0VHNDZCbS91YkxPYlN3K0RsdDlmbDBiQnJUbVJl?=
 =?utf-8?B?OEw3UjA2bjNtSnpiMWh0Vm55dklDYitiaXEzTnNJZXd0ajNKVVFYUXZueHRx?=
 =?utf-8?B?VGl0dHhQQ0lLbXEzVjRaclV2TklDdjZwclZySHJQUWNOS3JJVXAxQ2ZnWHdV?=
 =?utf-8?B?NGJQYm9jTlVwai83YUhjUEJKTThjOFBuOGdlaUI1UU9pcE0rOXh5UmtORUg3?=
 =?utf-8?B?UWZ6eVFTY29tSFNSRzlLaG15TW9MZUNaVnI2TFhxZWZKZ2kxSURRYTZvVnNE?=
 =?utf-8?B?ektrYUZacmt1aGZsd0cxUWg2bEdoSFZJTGpkZlJpYXUycC9UTitldmRNYyt0?=
 =?utf-8?B?OXFwR0hXYTBLVjkwTVhybjg5Mk5zRVdKb0c0Wk45Tnk4TVZuYitEc3NDRkRp?=
 =?utf-8?B?dEdoS0lyMVZGRWU2Uk9QcGpZVmtNZUdkdGVyMFpQN3gvbDk5K1p4bzN1ZTFY?=
 =?utf-8?B?RUxlV0pnRklaUWJpWGZISFViaEtHaGtQUjZGamh5cmswbDJLMTdIMHA3RDZp?=
 =?utf-8?B?dFVSVHNnazR6OEpHM1poYTRGejNsNWN4YUlhQWhrcTZUZG80dmRvVXJLMmNJ?=
 =?utf-8?B?VGNmVk91bFhlTzZXMWhGZmZtSjkrdVkxbXNua2xnQlRpZ1VLSHFiMjJnVnBC?=
 =?utf-8?B?MmlvQ01UckZ4TWxJM05uTVVIeFZkZjluNkZEVmF6UFBVZHdpclBFQkpTdkhX?=
 =?utf-8?B?cU81Rm15OStmQlBmeVVERGpFSGg5cThBQWpMRnhZWWo3Q0pWWUZTYWpOd09U?=
 =?utf-8?B?VFJBNlZGaC9BQmRpbDc0MW0zZFNTQ0k2Ym04endwZU9wcU9GYlFzempQUDRR?=
 =?utf-8?B?aG91TlJyODZaT1h6bkRnTkJNNFEycDc2WkxNb0xlY0Z1M2RlRzJtRVYwYjMw?=
 =?utf-8?B?TDZnRlI1N1pZMTlpTEtWRnJpckF6eWZ3b0VKaHlNUzBXM0dLVDAzd2Zrb1Yw?=
 =?utf-8?B?U0h6OUFCTThRUGlMSzBOY3FBb0VyZlhvU21HU0t0aGw0OU5lOVY0RTZXSTV0?=
 =?utf-8?B?YS9JMy9XbllCckErZCtmdEhHVEV3cE5iTGxaVmZydWFRNGV2b1VBL2xKS05W?=
 =?utf-8?B?RW1XTjRreHVDVk4wVHlJd1ZERXRQRDFIUVJNdzFnb2wyQ0Y2c1NnTnhYNWZZ?=
 =?utf-8?B?SGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9beeed2-865e-46f6-610a-08de0b38a7fc
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:45:10.0481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mVv6llYl6nlFWUziF1nsNzT5d7/agoMPXPW1JEqj/Skapu8XQkHQN129ucrT245PJYQjng17A1XFCPx4uI9S4tPnwdye7OFTE3BXNPmJmfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
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

LGTM

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
