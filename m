Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63987CAC5A0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 16:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB310E1D4;
	Wed, 17 Sep 2025 16:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lo9Eg6rD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2B310E1D4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 16:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758127220; x=1789663220;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ZI6K3AXO8TeqtfqhUc5TghBu8oCPzDOeg7CHsXGFS48=;
 b=lo9Eg6rDOEdpeS0pW7fwto12IGG8ukZ7teTVZH3K7ktyvKzTQ0/zaob+
 2cI5qtdJ9zqVqsTRmfzctdNwEBRGfssTICX6ibVSpTANpmBh+XiynTUgs
 +c4bbPWuwi5AHBn5syHP9BFwZPp8boLAd7KbH66TXiWk1Fn9FfnnVOeoU
 eWC0Xt2+E0Zz5ftH0fAowAkTR2eglfQWk5hEixNXHB1stylNO5PiiBxMe
 NAMSpPvMiDJLJs3L27pKp9E326E9mtPXeGLq3tDggE/20McMhmbLkF1S1
 Pd8o5GWHt3v7T9AWUVGCE6jIWtJQQWnN3SNQNAnLTGgHvd78O9EWIiqbB A==;
X-CSE-ConnectionGUID: Hd9EBn9SSmKDmnYUhv99Ew==
X-CSE-MsgGUID: UXDtT36SS2eE/t45Ev6IaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60507852"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60507852"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:40:19 -0700
X-CSE-ConnectionGUID: HpgOU2qgRxGKDCKVSI3cng==
X-CSE-MsgGUID: /btVMX/CTwKs8M70EIWpJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="176062607"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:40:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:40:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 09:40:18 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 09:40:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyvQnH46HlkzGFsH2OgYRL+fvXoii3fYZWqQSqHNmJGgNc40wNWJQNKpcoki61QGmn/W3i9To7OPreu0H8LLmor7Vk01l5uGrU1tAH1Hr92xsw9t3kS6wGk4R9vPpDkBLyyQgkrsJrCElxGuhDlhEJAGj/YKuMIGlfPv7nGVVpmg7ylRzO6GUH1kxZYt/corDRToOoXeB8Wv9kpzCFQC+vF0gdqRo/Mws200q68dWJSWa8+y8LPyuSwEkTb8TVO75Zc+/vBx2t0NYrCVpSQmTSWfHxAmZZ9dqcxGj9pcQSTElliG/DQWAAPiMItAuYItdBnqJUil248h3cHBN0snfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lKyQTjWazr2ON78tMqEbcgnAIFUM6QzNDKjwJITO0E=;
 b=A4wlYwm1woTxQXHnqQIfEeRklyD+MvII1JoHzAQPxkR75/JFKG+a0tOx5qX++JICcIA2xhIoIxERhN8rKKM6TpVXHE6W72G6JxZBKh3+r3JR/jtr2BT4iUbtNPGguihDvL+UQMvzuPnkVgcHxiMX7817mG6shDmXHaKSCQp/H9FLVFNe9JlbRVPwXERCi4gP73wLQET+PC2AqYZx2fKkutJipn7gQXTmjVzpmJtu6buZu5Dsio5M0tkOpkPCNfrGFwhARodNVKuW3wft6L860/qEcpVqc+G18J3QLPamht0eHzNg8TXHe5QTaxJATcb43BdI4LoTXRs04vy0fatGWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by BN9PR11MB5260.namprd11.prod.outlook.com (2603:10b6:408:135::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 16:40:16 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 16:40:16 +0000
Message-ID: <fedc6aa2-bd93-42b5-bfde-67b5cafd0b00@intel.com>
Date: Wed, 17 Sep 2025 22:10:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v2] tests/kms_pipe_stress: lower minimum iterations
 in simulation
To: <igt-dev@lists.freedesktop.org>
References: <20250917090411.376984-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250917090411.376984-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|BN9PR11MB5260:EE_
X-MS-Office365-Filtering-Correlation-Id: 7796823c-3330-40e6-8972-08ddf608e16d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzZ6ZEQ0dmFrTWc3NStOZ3VLcmR1eExKMjY5UDJaTGlKU1NQOCs1TDhsdWlt?=
 =?utf-8?B?aG9QdWlPbm1mazdTMzBCVmJkandsbTRXd1E1WlV5ZzJLMWhlUkVEU3c3QmtB?=
 =?utf-8?B?d0FWcndZOXdoTVRMQ2pmTXBQUDNJcFFLQkZkNCs1VUJwSTVQSE9KYnlnSGp2?=
 =?utf-8?B?elI1R2dUSFVIUFV3dXY4V0U5RVBhWU1nZEY3K3FqbUN6VFNROFZ6TlowcFYw?=
 =?utf-8?B?WWxhYkRGMWNNdkRNVDNWYWc0Mko0RnFBYUc4UVVoN1pjTzlZT2p6R0NiTFRL?=
 =?utf-8?B?VG1Qb2hkMWVRbTNIWVR0YXlBbU1zN0laY3lobnptaHg2UU9uVTY2enBranBS?=
 =?utf-8?B?aXA0N1BERHlVdVY2emcwN3pkSXJ1VjJ4ZURGUGdlajFZZ1g1alV1ZW5jOGkw?=
 =?utf-8?B?ejhkNVZzMFMyQ1daWGpDbzU0M1NORVZJbjBYTmNLOUorTHUxMWRFSktCT0F0?=
 =?utf-8?B?SjJRVHFTcEFmMWU5YTM4ekRKY1RZelhGbDcyNE4wUHUxL3NVdlVUSFJpMGtY?=
 =?utf-8?B?WkpwdFVZYzdDOTNHNmN6MkgrN1pZU1JUcjh4L0RtVFptckFFaWNzMGY4QTBL?=
 =?utf-8?B?YkJrVVpDemxsQWg5Q2xPMVBRZWZiU2FZK2U0dGV4YTRIUk93M2tCUFFTbXpB?=
 =?utf-8?B?bDExVWZkZTNaeGFVUFJQL0JIRjdhcHE0Qkhsa2ZQclliYjU4Z1R3RHJ6eEJD?=
 =?utf-8?B?Wk9leStwVjg5TUZiRkF5NlBYeUhxZklrM3FBZlMwVmwydnhFYVI5VlM5SzVQ?=
 =?utf-8?B?WnR2Y2Vycm84MGtaODVackRPYW5ZMDBHVFJQK1loZlhXbVVxOHlFUk5ORjhv?=
 =?utf-8?B?TmJwN1g1dHB3dkZFZUtxS1lSK1hjNXI1WlFyMFIvVFlhdHdwdHhoMkI0YU1Y?=
 =?utf-8?B?V0tNNTlEb0ZNTXZyTE12RTV6bEdhL0VydlNMVkEyY1hVUEJjN2xrRWhKT2oy?=
 =?utf-8?B?MXlOQmg0dllVQXZjZk5yWXVyTmZSWm5SdW54a1BOOHRad0VFeSsvdisrNXlR?=
 =?utf-8?B?cHgybVhDRTUvUk5rZ2JhVHlaTGNoakNmYnpjZ3c1aVdqRlpiZ3pxVEJzdWxh?=
 =?utf-8?B?bGxuK3J3TEMyZkFHR1pqOTJFcXhhZlNUVnp3V3kvOVFISEZxVU5zTFdTT2px?=
 =?utf-8?B?UldxODA3cGpOMmI3bVErU0U5WDhseTVuc0NkZUlUVHdaTS9FZGJXelVsRG9S?=
 =?utf-8?B?cGRiMk5MekVFOG5YMnJkSnJLRU90bGNsZlRyU1BnaExBK3h5NnMwV0l3NW5C?=
 =?utf-8?B?b0F0MlNxYnpZc3c0WGRoZ0RQRllzcWxuTEZtZDZBV0s0dW1LejBNYjhod05z?=
 =?utf-8?B?QUF1cmVEdXdpOGJpVFZOV1NGWTlpOVA4alNDL1pQTE1zczk0WUoyR1NVdWRw?=
 =?utf-8?B?QUkrQjAwTFhpbEpVRWpCTUkxQ1RwSC8yc20weEd1eUo3TVo3ZTdXVnRXVTBq?=
 =?utf-8?B?Y2VkOWpOUEd1QWpocFZoWUJkN3BNZ0xLZG8ybTE3WmtUdFNkNjFrL3A2K09k?=
 =?utf-8?B?U1R5OElkQTdhdXpFZ2gvajBLcTdBclNaYVExRnhUcExFNUJuakdYMENSbGtD?=
 =?utf-8?B?VmJ0blJaK2dyM21xNFNWaHpDcmVWdnk4c0JMZjFkMjRacWlzZGpCWFYzNkZk?=
 =?utf-8?B?RElNaDZsbnZZZzdOc0V6ZnFLeXFab1JwRHA0ZnFXYS8yekNxWHVEd1FISVh4?=
 =?utf-8?B?OTI2RHFBbjRvUytBUENzVEgvaEFQSS9XMmtZZElZYTlxZ3Jrb205M0ZRcnln?=
 =?utf-8?B?SVZnQzExTnZ3cmcwclV2d2hZVTA5Qm02QXM3Q21yNHZUZUI1M2wvTjJ3a1Fu?=
 =?utf-8?B?QVM0aFR5aWJndWJISmdBRDZOcHdtQlhMcEcvUjFyTTR3d3BMc0cxODdHckdj?=
 =?utf-8?B?a0lRRFFKTzFqUnRYT0s4Wi9PVzZEaU9nVzR1bG5ST201ZEtyYXNmU25aQk1G?=
 =?utf-8?Q?kJlNDMgEIck=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlNtR3c3emFZWUtsZWp1Z0lMN1lsS3hpeDlCUkdzT3lJQWFRai9mSTRGVjg0?=
 =?utf-8?B?MW01cUpIdVE0bUdua0NXTFZXMUJkUTQ2NGJOVGhLS29yaytRa1NLRlNzdmpT?=
 =?utf-8?B?RFZiKzg1Z25pRkptaG1mQ0gvbmpTSDQvVkJPRzFEQ2JPMmljTmdsS1U3bzVi?=
 =?utf-8?B?RVVUZ3VvdmRqL0x1TEQxekJsTkZCcEtCdmE1akNGU3BYV2t6cDlmTDZMU2hm?=
 =?utf-8?B?SzRNeHhobDFtOUhzeEIvSmFwTUZnT3g0Q2Z1S202K3U2QUszL0ZnNVd6TkYr?=
 =?utf-8?B?Nzd3cEF0M3lWTHRuelhiR3BhZkt6N1lGTStqUkd1M0F4NHZidXFTU3p2Qk0x?=
 =?utf-8?B?ZGI3TjZHR09jS1JmRmhaVDF1Umd2U010ZEtWOHpPQlZPQWFBNzg5NXZZeXhL?=
 =?utf-8?B?ZGdkR1hkLzBuVmd1RXZxNU12Wkd1OXVhUjc0UXdjbkVpZTZrcnIvaDVmZnF2?=
 =?utf-8?B?b3l2a1NROThZbklURGZ1SFcvYm9yU2pYN0phZCsybHdnd0xqS3dQbVBsM3l1?=
 =?utf-8?B?S1RreERzWTg1dG53djhYUFZNSTF0VndVNTdlOXhqU1N3UWhBcHdFcG52bEUx?=
 =?utf-8?B?T3Q5RW9tb1hVMzI1VHd6S1FYVGt1dGJyeHR0YU41MFRZQnkvelhLeWp2bDRU?=
 =?utf-8?B?NTViVXVZQWJrQnNyN1ArUXBEaW9QVGRvR2tFdGMwWjUzZUNaRGdhUDN1ZG1N?=
 =?utf-8?B?QUxia2t0Q2FDTG1Oby90dDR1UDZuRkpFL1J6Vkc1bEh0SEd0OTVpSFBCakYv?=
 =?utf-8?B?RnJRanlkcmZWV1ZaZTN3d2dCMnV4MDVSaC9abVpwQzhRTUZqQ3JVUTNQTnpW?=
 =?utf-8?B?QlcveWcyTFBqdEZRa0M5L1B2Q29mb1gvckNqQXNNOW85cFF2NEpha3FOUS9l?=
 =?utf-8?B?aTArRTcyZWtVVzRVK1JhRllGTGlUSDJqZGFvUTd3aFdvSVoreVFOY25IbTBn?=
 =?utf-8?B?bkxBWWtZT052YWdtbEVMdHFPUFUxMlo5ZjM4aitIc0VDU1UzMGFjWk5KUENj?=
 =?utf-8?B?K2Q5OTh4ZlNkUWFrODJwZllobVh1dUJ1TnhRS2wvRzZkQ2FsSE5TdlFWMmQy?=
 =?utf-8?B?a1EzRTZIc1hnVGhndGk2Uk9DV3AzZ3JrUFV2UkpiQ3VyOFJHREhLVnEyajhS?=
 =?utf-8?B?MmhwVzYwUkFNdXNSVnVNMDJOc3I5ZHRRcjVWSXBNaDN6emw3Z1dGQTNpNklQ?=
 =?utf-8?B?VzAwOEtjamZkZkl2Rlp4R3RQcXJpTkNLS24zTVlmRWhsMG1wNDE1bTZRWFo5?=
 =?utf-8?B?VXduOU1SNGNXRDd0WFBsU3RPd3JrNlF2UGorM0JQMmQxQy9DWXZXRjh3YUFV?=
 =?utf-8?B?cUovYmx3NWNnSDJGcThYazlNWjUzVXBwbDEvb3lWRFNpMEtJSkhxQk94M0dM?=
 =?utf-8?B?MlZLb2JqU1Bqai9UWkNNcXc1TE43NXJRZVJOSVJIR1pmUklKc29XdExURjFB?=
 =?utf-8?B?NDRYYTljVTNvcEcybFpSajBodE1ZZThsTHIxZ2g2eitvUUVqbm1OVVh2K3Fp?=
 =?utf-8?B?d241aThtNno0aWNvVENEWUlBQ0ZISXcxQk1KZW1BdDJzN0kzbjRWMFBwbWJF?=
 =?utf-8?B?aDRTSzZQVTdWd0NCWFZGelM1OTNJMUdzUG5VdW5LYnQ1MXpCZUJYQmVVcE9m?=
 =?utf-8?B?MW1Hak1WN2J2Um1jTmh0VjNnTkg2cVd3cGMzaGloODFEQU9WZVRobzIrdTJI?=
 =?utf-8?B?UlNCMUxtTC9GTXFTeTdkMUMvTjlFdzFCNGVodnN3YUxDMGllWDZyWW44Mm9N?=
 =?utf-8?B?R1Z4VkxXcjVrcmhVSmthbTBuMFJqYkovQlA4bGhXcW5rWDNTdkltdHZyRUtY?=
 =?utf-8?B?b0ppeTlqMjM0dENPODB3TEh1anAyWWFIK0Zxck1NZEsvN3hjZkZ5ak1pRFAy?=
 =?utf-8?B?V2E1Nm05bTBJMkJGT3QxT2dBZHRtNmFjNTdvR3hmMmY3Szk1cnJKVU54NTFZ?=
 =?utf-8?B?SHR2dnFFVS9BdUpWWVlpMndUNWlnemdLaWtWUmZiVG0zSFFoMnl2aU1BN0tw?=
 =?utf-8?B?TVpSMGE3cldtWXA4RzhMWDVhM3oyNUlYbjZmdlVRQkE3RjhseTdSaFpEaFQz?=
 =?utf-8?B?UEhQcnFwUmtLajI0TmdLYXVaTDNJS0JTZlRjZDFGYUk5ZFhrdGhMS1Iza1lX?=
 =?utf-8?B?eU1TaEQ3QnRsb3JrS2l4MHE2NWhlc2F5L2xPZzY3dmY2WWhiUVBFWFplaTlT?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7796823c-3330-40e6-8972-08ddf608e16d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 16:40:16.5005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCdrOgVrVpw99zvyZYYHx2DhAaQCQK+0fGr1T1Tm/RFJe8ujBDVisgyykw91Hx+7XH/afRWEV0wex2LnKAi+MLB/XglJtAeWDt/vGPfig+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5260
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

Hi Swati,

On 9/17/2025 2:34 PM, Swati Sharma wrote:
> Reduce minimum iterations from 20 to 5 in simulation to
> shorten runtime while retaining meaningful stress coverage.
>
> v2: embed conditional logic directly into macro def (Ramanaidu)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_pipe_stress.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
> index 7551a5e9c..193f59d8d 100644
> --- a/tests/intel/kms_pipe_stress.c
> +++ b/tests/intel/kms_pipe_stress.c
> @@ -610,7 +610,7 @@ static void stress_pipes(struct data *data, struct timespec *start,
>   }
>   
>   #define MIN_DURATION_SEC 5.0
> -#define MIN_ITERATIONS 20
> +#define MIN_ITERATIONS (igt_run_in_simulation() ? 5 : 20)

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
>   static void stress(struct data *data)
>   {
