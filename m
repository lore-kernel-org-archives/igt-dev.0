Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342B1C35FF1
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 05:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F7810E289;
	Wed, 19 Mar 2025 05:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Crz8LYCZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3AD10E289
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 05:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742362317; x=1773898317;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vgXWVs2A0yyzHcdVHhglxJDop3JkcBT/kIkplkp8JUM=;
 b=Crz8LYCZXWb24PyH0q0+xDaUMGbD/Se6ZnAM2j6FDu7Gid9f6NukgoSm
 KLj3t9jUyrtB2Oj21lqiZsmBRRC30VR04ckMRoqV6oQx7U71uDEG9oAOG
 md3nvXBoQaKn68jS8eCEU0fZFMRzMhI2dsAviPrSz+f7toXvCZwhq5Eo4
 zOldYDtFxeKlYR14RIY9Hh7tR9J42nC9fu0ZD5nTKMmNuFeCYz8c+rfVA
 Agz8xSVDocC/csjG23jT0gNgFQ4FgT50+jFczoB3kUXeormUd7+ikR5jN
 yaZ4QrHEIkdIloqt90RrDWQmli2BawVNWTZBHHmKE9wVjNG2IDDoUvLkL Q==;
X-CSE-ConnectionGUID: kRM9WrYaR8ePMs1gK5HaNg==
X-CSE-MsgGUID: Vs2V5pscTSWM6ZA4jBKdzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60925836"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="60925836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 22:31:55 -0700
X-CSE-ConnectionGUID: XUCLWOSnReaxjlf3WkWkIA==
X-CSE-MsgGUID: 7MZZKJ3GSlWK2qf9if2lJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; d="scan'208";a="127152248"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 22:31:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Mar 2025 22:31:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Mar 2025 22:31:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Mar 2025 22:31:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ep3YGnCPJtfmzcbsG22onE++XM5W6W3fT42rP4h+U4N8lxGf+DeavlEValA11EfLtF1s2jD87qNzFSHSvkR1hZfQAdkFLhqlEqNBLno2fOJti6LiN7pi2Iq0norINAc+mtybVlPHcLKu9TicqXQ6S03+duHCoJ+ThZgdk1JmRzTb07+4M+23G1j0Y5BYANJU9NK5wBPOEjxwYhgr/gwyJxyG3xhlPIYFCb/VnotInnYKmkPG3gyZ64Fc4cLjucHqWkR5iLw/yHFqFGjgixpGsqKOYqf3dmYa35d7/TGAcAq7stinul/zEmIc/ONL39/kX2d4DtplQuy59sXvRFO1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2TatMGP+TuCTrvbSClZ5+7yx2g+VLOCgfPso/wYXEg=;
 b=BAlak0K6ZCHWQvldTPRDzPABZyraC3KWh6TM9WTwAAIK9fCe9RuFAH24HrPNxc8TQlXSMX9rGD6iyToRQZD4uAREiupn9kYVCbK1OT2HjwmFcGVd5MtcdgKQo0yN31BXcMPs904ke/e0jlnvsuOXGlHczLONz7ATlP4P6VFDQgIElg4woEHCZX83PSWJiwkrxY10JwGUF9z52c+8z1oEm+VWatgA5VwcoE7RsK5Pbgedf0Y7EzLEP3453WQVyVzbAhUBJKhCC8El6YCl9MJ4mTvL1P0XkLhUm5J+dXkqq/r9UjA8feqHymMMrfKS0Ep11NRdnPKrvl3qHpBJ7mfQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by IA1PR11MB7271.namprd11.prod.outlook.com (2603:10b6:208:429::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 05:31:33 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8511.026; Wed, 19 Mar 2025
 05:31:33 +0000
Message-ID: <f93ac687-9b1d-45b0-a8fc-d1ba5bfa6060@intel.com>
Date: Wed, 19 Mar 2025 11:01:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v3 09/11]
 tests/chamelium/kms_chamelium_sharpness_filter: Add basic test
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
 <20250221165749.460347-10-swati2.sharma@intel.com>
 <c05c4125-09b2-4570-9fd2-f5e54e837b66@intel.com>
Content-Language: en-US
In-Reply-To: <c05c4125-09b2-4570-9fd2-f5e54e837b66@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|IA1PR11MB7271:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c4cb25-8504-44ba-983c-08dd66a74edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVNXcTVqVlJ2aW00REZuTnZzUU50UlE3VlBiUEh0VXlPajhCU3ViOUpiUHNj?=
 =?utf-8?B?bTQrcEdTNDA5amR4eDdLM3VneW4zcmFxMVpQL0dTUWtsWXdLU0xaTENxVkNN?=
 =?utf-8?B?WFlpOUI2Q1Zpc3FFalZRbFhMSmJNajI1OHZ3THprM2k0Mko3cDRINlFTMkdZ?=
 =?utf-8?B?Ty8vT1BIbXhYYjJwQlRvVTIxU3IrdEc1RXpLVEJGdys1cE5VZWFEYVFrYzRz?=
 =?utf-8?B?eTluWGswbFZnV3gvRGxlczEvWVNoQ2ZrRGI1NDl4RFZLcExYUGZQN1Q1NDBs?=
 =?utf-8?B?WVdUWlErNHNzbDRYQzlUSElNRllLSmxqK0hnbmVTUkNNcFdXRHNQUG9qWERh?=
 =?utf-8?B?c2pjckd6QnNLMWhjcnZNVkxRWUF1NFI3aXIxWWZ2dmN3czZQc0h3UGRWN2R4?=
 =?utf-8?B?YzZuUGlkbHBHc1ZEZ0pjZlhjRG0xdG1lV3pSbVZsVkFYeWw3UFQzYmVWUFFh?=
 =?utf-8?B?RXpNSm9BTGdQSUVXUUVFZkd3cnY3allRNWdhaFhERXNSZXViRWJseFFoTm9x?=
 =?utf-8?B?UWhWV2lkam5sQVhaMDFMT2hHU1lqUnpXTk9HcGxtR3ZJdlk5ak8wRUdKd0hS?=
 =?utf-8?B?OGI1OU41SldUTVZISXlCQ0NnU0FuS2lOaW41TDFqb1d0VnJWTVg2RWFxeXRt?=
 =?utf-8?B?a3hGNVN4V1NtYmVwcHIrWXlHaktVQnN1ZzRWZ25uc1NYOWg4SnA4M2NzN2xC?=
 =?utf-8?B?RDFkZTZVQ3JjU1k0ZkcrSCtYdlJCcVg1NUIzN2F5eFAzc1hRYkZteVB2WWVY?=
 =?utf-8?B?UTBLNGJXK0VRRHk5SG9NVjVjWGJMYlR4eFlGcmVTWThVZHNEelg1cTJyek1T?=
 =?utf-8?B?U0hqNHhCRmt6dVM1U2djNE9ON25YeldGL1FMaVhLdzhUK2V0L2tZSSs0UFM1?=
 =?utf-8?B?Rkd3VENCSStqSzdsM1dNQk5zRTFiTWVrdTV0YlZnbEJYVk5Jb3ZXWHdXMXFD?=
 =?utf-8?B?a1RGK0x4UjlhZU0xVE1DKy9JTDFvTkNWNEpmbDliSDNGN1oxenJtbW1KWGxM?=
 =?utf-8?B?aFpmNHFrYW5IQlo3RkphaE51ZXdsMmo5S3lwdkUxVTE0TUxmczBPbWJpZjNE?=
 =?utf-8?B?akhQeDU5NVZBN0xiUDhVQ1BWUWtabkJoZHg1Wlk0QmdVcXdFT1RpWGZsSXdJ?=
 =?utf-8?B?WnlIMDMvak81U2FGbEllVlhZb1NDQVM2aXRPYWZGZlB5Zjd1Z2VBc0ZESjBQ?=
 =?utf-8?B?clFNYUp3SnVjOWhCNVUzc0o2cUVmM3VESkUyMUNNYWJYNmxmZU5NR2NaaGc0?=
 =?utf-8?B?bXptNHZ2SVV4Tk1WR2trM2prbnVQL2tlVFBTRzY2WHRSckQrekp2RmNyRGFu?=
 =?utf-8?B?OGZlU1BqSjRtZ2ZNRkpJeGhpNXAzSisweGFxaG5MaVVjSXpXekt6eDRMeWVO?=
 =?utf-8?B?dWNKdjdySStiZHVEZEFra2E1WFluMzBpSFdzbitzaDl1MitvWFlIMlVVSm1q?=
 =?utf-8?B?TXBZaEhyZ2w2SlBrM0VNd212QWlOYXozTkVkV2hJK01DVk9keTQ3QXd2MVBt?=
 =?utf-8?B?WjVEWjBZWnk2U09Fb1U1bnFKTk9FcWllQUNpTXlxRkxVVmdiMUJLWmlsSnUr?=
 =?utf-8?B?SmEwd2RVdFhWbjFxb3Z0Z0tkMk9YdVhXQmdPQ2JESXVYaGNzQUp1aEFiQWMv?=
 =?utf-8?B?R1pNWlpxcWNRdk1pRGtua2d1cURmVGtmQWw5eHl0VDR6MlR2Vm1LZGJQeFlq?=
 =?utf-8?B?NktZWGZsVG1RMTM2YzcwODZ5TVZLdGl2NkQzMU5ESjJDcVJPVnE0UTN5VHdG?=
 =?utf-8?B?TnU4SHd3Q0RDeS82NjA3Yzd1THVlQ0RSa2VnYVdZT0FZTU5ET3UrMlRZSmU4?=
 =?utf-8?B?WVBOMUJkRmRkallVd3lndkxpRVdiYWpmd0c1eVM5ei9ldEw4cFVKa2k3Z2JX?=
 =?utf-8?Q?f9NCGPdKEIzRt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGVHUU55c2lHQlVyU01EVUxTR3d3bFpIb3NxVk9aaWorR2JZSU44dEVwTVVN?=
 =?utf-8?B?NDdmU3NQN1FKTnhHak04aGN3WTl4WFQ3QmQ4ZFB1L1JFelJkdkdHQmFMb1FQ?=
 =?utf-8?B?UURibVFHZWhJRHNCMG83R0E4NjZZZmVUMXM3cXEyektnUHFqd01sZTNMczhZ?=
 =?utf-8?B?dGY2a3E4KzBTeTlPalNjci9XZGduM1VnbHBSajRpRVZzeTdmVGtiQlFQOHI4?=
 =?utf-8?B?T2xHUm53b0hORkU2ZVpiZ2NHV0xld0pDeUFTbkxRWk9hU0loZnZzOHVJZ242?=
 =?utf-8?B?TkFwYk9oa2ZBRmROdFlDekhPRkI1NGpMK0R2YVlsS3ZyR3hseS9VdEdxREZV?=
 =?utf-8?B?eGRkaGYydDE0TDdKUXgyTHlEUlR5K09vNDFPdlpxS1JEK2ZWVExEaGtHZ3V0?=
 =?utf-8?B?MVc3UStiQjMwWnpCcms3R1ZuL0t3MHU4Z2VtRzAvRHlqd3pvd0cySG9HR2lN?=
 =?utf-8?B?ZVJISjRxNFlCUzQ3K2hHcjZ6S2w2QThxaEl6RExObkk0b1JmQ2hIaUJ5ZUdD?=
 =?utf-8?B?Z3BTOElMemNUc3BvQkxsRDNhbHNKbHpUMlpVa0xTOTQvYUpKUmEzYWN3Nzhp?=
 =?utf-8?B?L01pdEdxZ1VCMElLdFRIMHNzeFZxU2hMSHZNbi9CZjJXSWdGc0k3aGw0NnM4?=
 =?utf-8?B?cW9ObUtKeHVXRmxlSkdsTFhiRGdUNFRtY1ZSd2xvZkl0blRXOFdVZFhpQWZj?=
 =?utf-8?B?QVhtOC9Dekl5K2FLUWhjRmxQdEFwOG11c1hiQnp4ZCtnWmFxRktyWm1YN1FR?=
 =?utf-8?B?Vk5oMTFmdGtReEhpc0hKOFo1S28vdlNqMHQrRXBrUWw5T3VPT2xmWmQ3dCtP?=
 =?utf-8?B?UzVocVA5LzNaQzRKWUhYZHlQa0U1YTFpN0ZhckVOSlluUEJwM1ZhL2REUjZl?=
 =?utf-8?B?TVNvS2hoMjB0V2ZEV0JxVXYvUGRFWDNWcEdRVTNEVlFXUXloZTlOcmVkaHNy?=
 =?utf-8?B?YVh4RXFkTGsvM3N4QXA4VE1BL0F4WDN2WUdpS3BKVzVLUitQK1hORmxuKzBo?=
 =?utf-8?B?QmQxazlKMDBsQ0tydVpxMEU0eVZNUEh5ekRIT2xob2dvN0xST3BBbzd3am1J?=
 =?utf-8?B?Q0xLSkg1R0R6VVdLZXBwMm1vRW91bGhJRFdUeW9qWlE1aFdHbVpCUUp1Y1JW?=
 =?utf-8?B?eTJlOWtjVStJOG14R2w3ZkRBVkRJTjZwMlZSWW1pcndJRmJKSzQrbmFNRmgw?=
 =?utf-8?B?VlhwWFQ4SmJ1dE5NVUVET2FkWFJOU1B0VkVBamx0OXZIclM5eGFWb0NpeTRU?=
 =?utf-8?B?elFtU1VDZjk2TEFNODcwbjJqSFN5dUl1ajBCdXhYM2toVW9hS0tuTm9manE3?=
 =?utf-8?B?bXJwaGxsN0dnbWxLaVhFbko3R0w5SzJEWGcyR3VUQ0pZUTJsL1ZnRTh2UlI4?=
 =?utf-8?B?TFpoZ1gwVkJoOTVZaDNrb3RXajZhWWpiWVhzZFlEL0JVeWlxVzJWWGNFVW9J?=
 =?utf-8?B?SVVuMm90NnUycnVoTG5lRk4zZzNCK0pNL1dmKzAzVzBlK2kwN3ZFQ2hyc1lq?=
 =?utf-8?B?VWxRdGtWc1BiU1FZRUx6ZFAvSVVRL2tuTjdxdGpZZ1lMT0kvRElDVDUySWY5?=
 =?utf-8?B?RWJaRjk2ZUQrY2NWUDZNR0NiUG1yM0NjQTdQOVNZalhSZHh6UWVxVlFGS1JI?=
 =?utf-8?B?em9CQmlRYVdkdHhLZDRDaHVHZHFKaWpGdUw1RVVyRzVqc3pBMnQvWjlteEI2?=
 =?utf-8?B?UzRFd2swdEhycTRhMjV6T3BBTnZxRXlhdjdhdXB4MzVZZmZQRlFLdUdBSkND?=
 =?utf-8?B?aDNaZkd1MkwvbmNGeVh0RFNUWExud2VISUFuWWNyd3ZJRUY4WUxNODZBeExJ?=
 =?utf-8?B?T0p1c0dOL0ljenYvZ3luMTlGZGErdUhrOFFUZytCbEo4NG8zTFljMDYzN2hH?=
 =?utf-8?B?R29jamZ6RUgxMEtLZFN6d2YzbmM2K1NzUjlLeElRbmFDZ2QzV1p3TTkrRWg0?=
 =?utf-8?B?ZnpnaWhWWmpKeENkbGpnaUxBTDY2ZkhFaWorK0tCbUVlWEdlSlpNRXRKUEhZ?=
 =?utf-8?B?Y09GRDNGZDJxRWxGYTNIVGZINWtWYThTckp6MGNOL3MzWmsvUVRLVUhBc01T?=
 =?utf-8?B?eVhhYjY3YWYwU3FCdG5yMUJ4c0RUOGdZL3dOZkJZcWU2RXR3Tkd1ZVNnMThD?=
 =?utf-8?B?YUU2V3RGN3AwVHplNVVid2QwZThqemRhRHZQNmZLdDNiQzUvcXNFRGRVQzND?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c4cb25-8504-44ba-983c-08dd66a74edb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 05:31:32.9899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22iupcai5dvEs1P/RUXoBx2HrQ7gs3R1+2mrrlER72vExfR3SyoXTZ8nb607uZn1vbO4Itc7z13kz30b/U65PpD3RGz7fwejw24gG4gvHlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7271
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


On 3/19/2025 10:56 AM, Nautiyal, Ankit K wrote:
>
> On 2/21/2025 10:27 PM, Swati Sharma wrote:
>> Add new chamelium based sharpness test. Basic test is added where
>> we have tried comparing frame dump of unsharped and sharped image.
>> After, sharpness filter is applied its expected both frame dumps
>> will be different.
>>
>> v2: -removed MIN/MAX_FILTER_STRENGTH (Ankit)
>>      -fixed alignment (Ankit)
>>      -removed commit with fb_ref (Ankit)
>>      -set data->pipe_id (Ankit)
>>      -removed disable_filter_strength_on_pipe()
>>      -fixed CRASH
>>      -fixed assert condition
>> v3: -minor fixes
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   .../kms_chamelium_sharpness_filter.c          | 236 ++++++++++++++++++
>>   tests/meson.build                             |   2 +
>>   2 files changed, 238 insertions(+)
>>   create mode 100644 tests/chamelium/kms_chamelium_sharpness_filter.c
>>
>> diff --git a/tests/chamelium/kms_chamelium_sharpness_filter.c 
>> b/tests/chamelium/kms_chamelium_sharpness_filter.c
>> new file mode 100644
>> index 000000000..70903b5f8
>> --- /dev/null
>> +++ b/tests/chamelium/kms_chamelium_sharpness_filter.c
>> @@ -0,0 +1,236 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: kms chamelium sharpness filter
>> + * Category: Display
>> + * Description: Test to validate content adaptive sharpness filter 
>> using Chamelium
>> + * Driver requirement: xe
>> + * Functionality: chamelium, casf
>> + * Mega feature: General Display Features
>> + * Test category: functionality test
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_kms.h"
>> +
>> +/**
>> + * SUBTEST: filter-basic
>> + * Description: Verify basic content adaptive sharpness filter.
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness 
>> filter using Chamelium");
>> +
>> +#define MID_FILTER_STRENGTH        128
>> +
>> +typedef struct {
>> +    int drm_fd;
>> +    enum pipe pipe_id;
>> +    struct igt_fb fb, fb_ref;
>> +    igt_display_t display;
>> +    igt_output_t *output;
>> +    igt_plane_t *primary;
>> +    drmModeModeInfo *mode;
>> +    int filter_strength;
>> +    struct chamelium *chamelium;
>> +    struct chamelium_port **ports;
>> +    int port_count;
>> +} data_t;
>> +
>> +static bool pipe_output_combo_valid(data_t *data, enum pipe pipe)
>> +{
>> +    bool ret = true;
>> +
>> +    igt_output_set_pipe(data->output, pipe);
>> +    if (!intel_pipe_output_combo_valid(&data->display))
>> +        ret = false;
>> +    igt_output_set_pipe(data->output, PIPE_NONE);
>> +
>> +    return ret;
>> +}
>> +
>> +static void set_filter_strength_on_pipe(data_t *data)
>> +{
>> +    igt_pipe_set_prop_value(&data->display, data->pipe_id,
>> +                IGT_CRTC_SHARPNESS_STRENGTH,
>> +                data->filter_strength);
>> +}
>> +
>> +static void paint_image(igt_fb_t *fb)
>> +{
>> +    cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
>> +    int img_x, img_y, img_w, img_h;
>> +    const char *file = "1080p-left.png";
>> +
>> +    img_x = img_y = 0;
>> +    img_w = fb->width;
>> +    img_h = fb->height;
>> +
>> +    igt_paint_image(cr, file, img_x, img_y, img_w, img_h);
>> +
>> +    igt_put_cairo_ctx(cr);
>> +}
>> +
>> +static void setup_fb(int fd, int width, int height, uint32_t format,
>> +             uint64_t modifier, struct igt_fb *fb)
>> +{
>> +    int fb_id;
>> +
>> +    fb_id = igt_create_fb(fd, width, height, format, modifier, fb);
>> +    igt_assert(fb_id);
>> +
>> +    paint_image(fb);
>> +}
>> +
>> +static void cleanup(data_t *data)
>> +{
>> +    igt_remove_fb(data->drm_fd, &data->fb);
>> +    igt_remove_fb(data->drm_fd, &data->fb_ref);
>> +    igt_output_set_pipe(data->output, PIPE_NONE);
>> +    igt_output_override_mode(data->output, NULL);
>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +}
>> +
>> +static bool test_t(data_t *data, igt_plane_t *primary,
>> +           struct chamelium_port *port)
>> +{
>> +    struct chamelium_frame_dump *dump;
>> +    drmModeModeInfo *mode;
>> +    int height, width;
>> +    bool ret = false;
>> +
>> +    igt_output_set_pipe(data->output, data->pipe_id);
>> +
>> +    mode = igt_output_get_mode(data->output);
>> +    height = mode->hdisplay;
>> +    width = mode->vdisplay;
>> +
>> +    setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, 
>> DRM_FORMAT_MOD_LINEAR, &data->fb_ref);
>> +    setup_fb(data->drm_fd, height, width, DRM_FORMAT_XRGB8888, 
>> DRM_FORMAT_MOD_LINEAR, &data->fb);
>> +
>> +    igt_plane_set_fb(data->primary, &data->fb);
>> +    set_filter_strength_on_pipe(data);
>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>
>
> Instead of setting the pipe and the property together, we can set the 
> pipe and commit in the first step.
>
> After that, we can set the property and commit with the 
> DRM_MODE_ATOMIC_ALLOW_MODESET flag set.

Sorry for the typo, I meant with the flag reset.

Regards,

Ankit


>
> This approach aligns with the general use case where the pipe is set 
> first, followed by enabling sharpness, and this should occur without 
> requiring a modeset.
>
> Otherwise, I agree with the test.
>
> Regards,
>
> Ankit
>
>> +
>> +    igt_debug("Reading frame dumps from Chamelium...\n");
>> +    chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
>> +    dump = chamelium_read_captured_frame(data->chamelium, 0);
>> +
>> +    ret = chamelium_frame_match_or_dump(data->chamelium, port,
>> +                        dump, &data->fb_ref,
>> +                        CHAMELIUM_CHECK_ANALOG);
>> +    chamelium_destroy_frame_dump(dump);
>> +    cleanup(data);
>> +
>> +    return ret;
>> +}
>> +
>> +static int test_setup(data_t *data, enum pipe p)
>> +{
>> +    igt_pipe_t *pipe;
>> +    int i = 0;
>> +
>> +    igt_display_reset(&data->display);
>> +
>> +    pipe = &data->display.pipes[p];
>> +    igt_require(pipe->n_planes >= 0);
>> +
>> +    data->primary = igt_pipe_get_plane_type(pipe, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +    igt_assert(data->primary);
>> +
>> +    /*
>> +     * Prefer to run this test on HDMI connector if its connected, 
>> since on DP we
>> +     * sometimes face DP FSM issue
>> +     */
>> +        for_each_valid_output_on_pipe(&data->display, p, 
>> data->output) {
>> +        data->pipe_id = p;
>> +        for (i = 0; i < data->port_count; i++) {
>> +            if ((data->output->config.connector->connector_type == 
>> DRM_MODE_CONNECTOR_HDMIA ||
>> + data->output->config.connector->connector_type == 
>> DRM_MODE_CONNECTOR_HDMIB) &&
>> +                 strcmp(data->output->name, 
>> chamelium_port_get_name(data->ports[i])) == 0)
>> +                return i;
>> +        }
>> +    }
>> +
>> +    for_each_valid_output_on_pipe(&data->display, p, data->output) {
>> +        data->pipe_id = p;
>> +        for (i = 0; i < data->port_count; i++) {
>> +            if (strcmp(data->output->name,
>> +                   chamelium_port_get_name(data->ports[i])) == 0)
>> +                return i;
>> +        }
>> +    }
>> +
>> +    return -1;
>> +}
>> +
>> +static void test_sharpness_filter(data_t *data,  enum pipe p)
>> +{
>> +    int port_idx = test_setup(data, p);
>> +
>> +    igt_require(port_idx >= 0);
>> + igt_require(igt_pipe_obj_has_prop(&data->display.pipes[p], 
>> IGT_CRTC_SHARPNESS_STRENGTH));
>> +
>> +    if (!pipe_output_combo_valid(data, p))
>> +        return;
>> +
>> +    igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p), 
>> data->output->name)
>> +        igt_assert_f((test_t(data, data->primary, 
>> data->ports[port_idx]) == 1), "No sharpness observed.\n");
>> +}
>> +
>> +static void
>> +run_sharpness_filter_test(data_t *data)
>> +{
>> +    igt_display_t *display = &data->display;
>> +    enum pipe pipe;
>> +
>> +    igt_describe("Verify basic content adaptive sharpness filter.");
>> +    igt_subtest_with_dynamic("filter-basic") {
>> +        for_each_pipe(display, pipe) {
>> +            data->filter_strength = MID_FILTER_STRENGTH;
>> +            test_sharpness_filter(data, pipe);
>> +        }
>> +    }
>> +}
>> +
>> +igt_main
>> +{
>> +    data_t data = {};
>> +
>> +    igt_fixture {
>> +        data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>> +
>> +        igt_display_require(&data.display, data.drm_fd);
>> +        igt_require(data.display.is_atomic);
>> +
>> +        igt_chamelium_allow_fsm_handling = false;
>> +
>> +        /* we need to initalize chamelium after igt_display_require */
>> +        data.chamelium = chamelium_init(data.drm_fd, &data.display);
>> +        igt_require(data.chamelium);
>> +
>> +        data.ports = chamelium_get_ports(data.chamelium,
>> +                         &data.port_count);
>> +
>> +        if (!data.port_count)
>> +            igt_skip("No ports connected\n");
>> +        /*
>> +         * We don't cause any harm by plugging
>> +         * discovered ports, just incase they are not plugged
>> +         * we currently skip in test_setup
>> +         */
>> +        for(int i = 0; i < data.port_count; i++)
>> +            chamelium_plug(data.chamelium, data.ports[i]);
>> +
>> +        kmstest_set_vt_graphics_mode();
>> +    }
>> +
>> +    run_sharpness_filter_test(&data);
>> +
>> +    igt_fixture {
>> +        igt_display_fini(&data.display);
>> +        drm_close_driver(data.drm_fd);
>> +    }
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index aac3b4e10..09f7ed24b 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -345,6 +345,7 @@ chamelium_progs = [
>>       'kms_chamelium_edid',
>>       'kms_chamelium_frames',
>>       'kms_chamelium_hpd',
>> +    'kms_chamelium_sharpness_filter',
>>   ]
>>     test_deps = [ igt_deps ]
>> @@ -370,6 +371,7 @@ extra_sources = {
>>       'kms_chamelium_edid': [ join_paths ('chamelium', 
>> 'kms_chamelium_helper.c') ],
>>       'kms_chamelium_frames': [ join_paths ('chamelium', 
>> 'kms_chamelium_helper.c') ],
>>       'kms_chamelium_hpd': [ join_paths ('chamelium', 
>> 'kms_chamelium_helper.c') ],
>> +    'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 
>> 'kms_chamelium_helper.c') ],
>>       'kms_dp_linktrain_fallback': [
>>              join_paths ('intel', 'kms_mst_helper.c'),
>>              join_paths ('intel', 'kms_dsc_helper.c') ],
