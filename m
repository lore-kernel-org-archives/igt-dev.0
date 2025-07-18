Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D57EC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 08:17:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB66C10E925;
	Fri, 18 Jul 2025 08:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dGUk9cQr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D305C10E922
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 08:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752826625; x=1784362625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mo8ignDsCYNx8dAYsOcTkz67NVcIUlq8E80zEODECg0=;
 b=dGUk9cQrFHpubOf7RpKVJOspIA68iEyQ6kJo3CIny5BHnCzFVjh1/xgE
 jkP2ru3p2AFds/fEgblBIafM49VgPJOIy0huXsrZqfC4l2KeflTkPA95U
 poAfsu6D5AyGk8JJzXBhLPBBPORzOWFyh77hZfOcQ6Fsn4JVlP0s2ufac
 r2SAcQhQpbLHHz8LQYUZBomU0pE/PF21jj36vqSanvLifDaVpF36ouC2g
 ppQMIiGS4+rruUDFUG7y/HfBxIkor6AvjWjCaWZwbvvgF/ACx1R8rzPbi
 tl73MDrNXb0EG9VGi37k15EGXmf09u0/F9exd1J0QX3QJD8CaCrkmaUFH A==;
X-CSE-ConnectionGUID: pBBqroGvSUKNLmUghoa9Mg==
X-CSE-MsgGUID: +XbeLhW1RfuIdnWPT+MGhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72567688"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="72567688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:16:55 -0700
X-CSE-ConnectionGUID: ri3C3+OrQ/mTd3bwGaED2w==
X-CSE-MsgGUID: RH6RgdYVTauTdljj3k3Grg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="158117422"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 01:16:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:16:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 18 Jul 2025 01:16:54 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.62)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 18 Jul 2025 01:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROJulrGGFWsNri3Ysy3JMlKUFRmMAkZAxHXdPMC7dNxMeJjS51NQwc9Tgh1lZcOqbkdfBbGQOAnMcUZIuSpi+rZlFk2YS4zwR/Ii+6a7T+lS3GCUDwOb7Ss7TDfceFvLOKWg3/aTRozY6lCCfVnUTUsPoAhoMSlgoVXS9V2p0TrtBVYqXgDN5SRPkWZhch0i54vYp2WHrauKzx0Ak2u1OVDJHveL3fYV2npEnMmY3IvHvxOx2Z4mJwc8DiTNNzZxATrK6Mb0DRlUVeEbhM5Wj8Nrg2P/9Zc7ZOlul8k44SGvQ2oJnvAcRUzZ16Gd2AST74sGNQmHnOG9KsYuF/PFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+Uws2O+xIMUgNA8ZwpXt+0On7L1cgLlWlNLzRoIf9s=;
 b=OU22uuN0ukWfCd9exmZXofWDcwIXVVM9qMLkUsdNQNclKnshAVAtOMi76LXJm9a9uhoKqnEZh6E5rtxSK9WY5Fsu8s5LDv2LOYAI1mDNokHDgZes9A/QWJbPIa25uUAQOpHHd99BKcV2HvtTUnyhfdI+p2Mv98TpfkSeRHkP1kHHF7U8u4b6elJWD3iRCJIBrW1fPOcCt/SoQiMbTaoXNMJ/qsNalW+fM6bDosesTvi+Gttm5X8M7CAQH2kj6EdaF2xgv+qH7ipXncRW+baWB1bQgSo0SgMKGspa1+Xp44lNOvBA31LUeJ0cCgamjdjU1wyD7b0hLDLmI6aTyh5G3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SA1PR11MB8473.namprd11.prod.outlook.com (2603:10b6:806:3a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 08:16:38 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 08:16:38 +0000
Message-ID: <a7c67e92-87b1-4fe3-8742-e6a33b588250@intel.com>
Date: Fri, 18 Jul 2025 13:46:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [2/2] tests/intel/kms_usb4_switch: add test to validate
 dock/undock and switch
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <imre.deak@intel.com>
References: <20250521055619.1961965-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <20250521055619.1961965-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SA1PR11MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 15b3c850-9459-4f9b-3716-08ddc5d36ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0YwaHorbVEyaWpKTytlSHlDbkVIRzYzZTNEK1JhVFhKeDdWd1dEWGZXQk03?=
 =?utf-8?B?cUFzVHVxMHJiS1UyeVdHa3ovUU1ZYXhKaS95RmlNa0JDZWdoa2NlZWNUdUlV?=
 =?utf-8?B?cGNNYmNHRWdlZTg4S1l5ZE5EaFR2bFRjeGMzd3FEd0grdHQyZGptOERQOHRx?=
 =?utf-8?B?RlptdFFNa1A1cjRaWjJHdUt5SkhqU3FtejNWTm1TOVNXMDdmM1NUMTZUT1lo?=
 =?utf-8?B?WUk3UzQ3Ym55eDNkbm56aUM3TDhkTmM3d1JDa2cvLzVvbTBhQTFtUkVhNmZt?=
 =?utf-8?B?Z0xocC9aaHVHU1pyWXdtZ2V6Z0JGQlFCdWk1UjI0eGZRd2dIZTBiL1NHaUUx?=
 =?utf-8?B?Z1hFYVRzWGt3NzIzQUc4ei9IMXZtQVluTWN5WWFWa3RHTWIzQ3lTTWszdTJY?=
 =?utf-8?B?djRFejNEcXZ3dVZGS2M2RytPY1RTRHpYV0IyQ1Y2L0gzTTNqb1RLMHlCN3lU?=
 =?utf-8?B?NnRvVVBuRHNoYUN0UTUrd3ZIejllMDdXZG1acmlBRDRGK1BWcDRxaEkvcXIr?=
 =?utf-8?B?bE5hRmcxTU1mdGhHdUFkVkJJUlU4WE5iZ1NLbDZpYk4xOGlDN25UdFpHSFhB?=
 =?utf-8?B?RDNhOU5EVlFLK2tuNlhTakgxUDJsRFB0NDJPeDRjZm4vSDF0VEFWbDRmYTk1?=
 =?utf-8?B?TGgyeXF6a0YxbXBINmRNcHhUdGRvMExUWkhTbjNjVWZCamRFa1ErRXA0RVF1?=
 =?utf-8?B?d21NU2tudTBHTWVwdlZMeVpnVXVjQjBJSDBhR1c4aDhwbVRDR09qcUh2Qk5H?=
 =?utf-8?B?L0R3cVhzeDE2UjF5dXRpVlBEMEkrSTg3djhqZldqL2htSytMZnU3VUM0anN5?=
 =?utf-8?B?dXBzZGJSMmVaWE9vQUV6a1EvWi81Y2FHZUFUZlFNUWhKMVluLzF0UkhyMHEv?=
 =?utf-8?B?UW1ZNm5rL1o3ZktwSE9DS0ZucGY5OWx1eitkZ2ZaZ2I3WEd2K2d2SDBEakJB?=
 =?utf-8?B?bElDcDZ3bG1mRzVUTEZPcEVtOFlMZHYvTE96TUpINXJjOVhldTNSa0ptYkFh?=
 =?utf-8?B?TS9haUR1TnlPcW9ZRzc3WURXVnArdEt5QXp3dFBrbHZWNDNDYVJ2TGVIUmsx?=
 =?utf-8?B?R2krWndVWWtGUUFwN2hpVEdIQ3RMY042c01QTC9kTFFLbThKbkJDZmRiTVdL?=
 =?utf-8?B?RGtndmNTTjJ3VnQvWmdRSUQveGs2OWFwNE1GS1FBVUtVMSsxeGlGRmNHbVZP?=
 =?utf-8?B?NDEvOUxEaiszMDhzWklqYXpxdnZvdFI1bTkwVVcvTVNGUXo2akp1Q3dOYWtU?=
 =?utf-8?B?SlV4c2FWUVlFVWw0Rkl0TkhKcGhUMWtLUUMvWktwY0NjRGducTc2QzhVUnRC?=
 =?utf-8?B?NlhDOEVieWt5WHk0VkRSY2FUcExEUkw5Wk13aHZFNVR1ZmhMaExTL3hDR09Z?=
 =?utf-8?B?SkFKR0huVjVzakZ3ZWJlTFovREdwc0w3enBNVjBTbmMvTStzOTBWcEVyTEl0?=
 =?utf-8?B?NEdyTk9FUkhwdExCeEN5TFU4TG1TMldQdjZudmdubXNHOHJrTUtXa0p4RkRp?=
 =?utf-8?B?c0FXbVhpTTE1NHJQYXFOWDQvZmExSHM5Yyt4dDBjWk1MTHdCWFV0QU4zcEZM?=
 =?utf-8?B?WHR4eXNHZnlzM0F0QnlEdHJNL242SnV1cmZSN2pzdGM1Ylh1MVAyQkdRMmQ5?=
 =?utf-8?B?bDNMbW5abEZiV1hUcnRiazZoOUhpT3FvR00rRDVQYWxZMzJRdS9nejFUUkp2?=
 =?utf-8?B?cnFSVE5ONTdrdXBJdmZZK3ZUTWdmclNvNlJFUFdONFcxenJRcUFXbzVLQzFN?=
 =?utf-8?B?NXJHSVZyR0hlMkh2U29VdGplNHgydVZzSnBkYmxFTzkrbzdVamtla0lHMEZF?=
 =?utf-8?B?VHBIbGtRYTBadm1HSndCclltWGlIaEdZb3JYbWR2MHZkZnBCOXBKTVJ0T1lS?=
 =?utf-8?B?b3ZZUmZ6Mmx0aW9tZzgwOGpkWG14NjRrS2ZZb0RFZzJGZUJGV2ZxNFhLUkF1?=
 =?utf-8?Q?xEYyhwcDB2s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFB6ejdUNUNxQVRkYUFRY1dJdGhaNU41c09vZ1ZXNVIvYmt1VjRMRDRDVG5E?=
 =?utf-8?B?TnQrckxkWm1TYVpYMmJIZytFYlhqREVCQWJRRHYyRWNHSHBiRXNVZ0ZrZE92?=
 =?utf-8?B?MkgwRlhQTGpBdmdnYWVFa1hlMnU1YXV2RTR3UzlBMUdpWUVQVWhKZWFNSnNC?=
 =?utf-8?B?em5qcHNhdWNzZGNPMkFhWXRXRWFoZ01hcHdaKyt3SERyVU5naDM1eVJKdlJZ?=
 =?utf-8?B?SVU5L0xlWlVsbys0emZJc1VXejhyWHhsWGJhVDBzRS81d015Lzhhb1dpa0RB?=
 =?utf-8?B?MmpOWlZoVDZMMlRQVjJPV2VvSlQ2UDlYbVB4cG9YTU1zb08yeUFieWkza012?=
 =?utf-8?B?RTgxNVpDMEZkVnBOMk52eUR6SUg1K2d1VnRjbnhVRkpkMk1SRUt2UVJRamtE?=
 =?utf-8?B?ckNwNXpHNW54aThvZUJFVEFXWHdFMkxTMnl2VFhXR2Q2RWJzeWdyMTA2M2Fs?=
 =?utf-8?B?OG1LaG52Zng3QWJYMDZaSDMveHNPVnlGTEdRbUhldVgwb3cyVnU1L0VQSzFo?=
 =?utf-8?B?dm1kUVdhMGl2Z0M4MVZFYVFTcExsTEtWSmRUaDUxc2lSK0VESWlMUG9wM21G?=
 =?utf-8?B?NEpBUWJOdXFRcGVpc1V3TVo4ek4reUFMTXQ0SHFyMmpNVHdqY3VnZUNaWHRP?=
 =?utf-8?B?ZW9FVW1JTGFGVlN1QW1DZ0tWYXRhUHRycU1qbGhTaFdXOUJFN2J5OXVqT0xq?=
 =?utf-8?B?VzYzdFpRdHZnYmNYLzlKSUEzL0I1QVJkZWovQWNwNFZCRXVEeHF0VGV4N2o5?=
 =?utf-8?B?aUxlRHRCbW9Ra1lsZHo5Z0VOYWlGVVlNdThlUExBODBrR0ZiMmFJaUtDSE5V?=
 =?utf-8?B?bkxGUmNkMG5CU01JcWJnZE5Xd0xHNVo3L2JDdmNud1lJcW85cjhJM25tMGJm?=
 =?utf-8?B?clJ1ZVUwTkJtOEV6UWx5UVFuaUNuaFdhbW5GOTFTb3NnRWNGeFdUaFA1WXJl?=
 =?utf-8?B?SmROTG5ZNjk1b3h3VWZnRzU3Q0x1czVYbUhZR2NTUjRpZm1oOS9CZ2szaFpq?=
 =?utf-8?B?blFJaTRBU05tKytpaE9JT1NCb0hhWjlTWDEzUmdrUXlqQVBLei9WMjRQaEdZ?=
 =?utf-8?B?RzdXdGNPelpESUVpTS9HZnRQQk5qRzJxNjhOT2xHc0tpVjFoS2x2WTh5THVl?=
 =?utf-8?B?VU5aeVZ0SDBvNWdRVHhndS9tKzRMZWlKcXpkdEtQRlJJTXFVQndzYXoxQXRB?=
 =?utf-8?B?UlZ3a2JOaS9tZVBtY0xaaFNwWUllMVd1bG8yY3hxcEZ0eWZHbWhxbERETTRI?=
 =?utf-8?B?elY3ejdQL3dTNDdtMG1keHNxMHQ1VFJqNjRmQmFXWlZ6L3d3RGZmMjY3dEJO?=
 =?utf-8?B?SFZZbkJjUFhFUjBWc2xkVWdBVlhMZDVFeTFkNVB4T0U2ODc2Q05ENDBIWnla?=
 =?utf-8?B?MmFhVXovK1YrTjR1RXNVNGZaRnVKWFd4SjgzN0ZnOXJOS2lrTVcyaUlaVGsx?=
 =?utf-8?B?dXpYWU4zdXYwK3p5dS9MODZjOUdjSndjSThaUzRDU1RTR0tMeTlod0NHU1Zz?=
 =?utf-8?B?SmFzZFovT21MQ0xpK3htRWFVQituWU5ZeTJGMHpsOE43Tmlzb25NTDhZdEdt?=
 =?utf-8?B?QnZtS2plWlA5b0h5amorV29VTC9zOWRER3JqMmVteW5DY3d4czVBRGVpS2tl?=
 =?utf-8?B?TGw3Qy9lOXF1aDBtNEFHV1A2clZSTHpZMEtQU3hKSDFmaUp6MFhvMjJjRUNR?=
 =?utf-8?B?MDJSTHdBd2JWTWxZUERtdkZrNmdaQzhpOWJXQ0lXOHA0VE43Q0lHVll3cjdP?=
 =?utf-8?B?Y2xXZDNJa1pjR1EwcXI2ZnRzU0dkM3c1ZUYyTmtDNk5uV1RnUTlpVWplamJ4?=
 =?utf-8?B?a3pscDJ3WnRjOFlQLzZFbk11TTR0aE9NbXJMWHdBem0yYkZYN3VETFczUkZw?=
 =?utf-8?B?czhuTitiV3hJTTlXc1RMaFNHR0JPY1J6Tm9yVTFIZUZmMTZZNkNPeklrTW52?=
 =?utf-8?B?elErTXEvL0NRN0o2a0xxcEVQNGVKdlhERDhCclJXbkFQdGd3WkdYYWFNY0Zw?=
 =?utf-8?B?Y0NuNGdLcVBMbUg0T3Q2Z3NoUEdUUUU3N0RrTGtyaFkwbDl1YU9XaHRxUmhZ?=
 =?utf-8?B?NlhVeGJBMjRXTU45RzRYcjNUbkVEWnBxZDFpNy9mV24vYlN4VTAyd2ZXS29C?=
 =?utf-8?Q?M5HtFoChoKVYkuGxjKDV8gZTp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b3c850-9459-4f9b-3716-08ddc5d36ae7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 08:16:38.2490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6GR0mFOxI9YUWImFVS2nJBwMQzwoM6b4gFnlOCfCAaoqTVi0TlXFs2goOQ3kUMBjFC15RmpajRsucW4jjpyZew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8473
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

On 21-05-2025 11:26, Kunal Joshi wrote:
> Add test suite that validates docking/undocking
> of TBT hubs and switch from DP-ALT to TBT or vice-versa.
>
> tbt-dock-undock : dock/undock each *Thunderbolt* port × 3,
> 		  checking HPD, EDIDs and a green fullscreen fb
> tbt-switch-alt  : start on TBT → switch to DP-ALT → verify HPD/EDIDs/modeset                             |
> alt-switch-tbt  : start on DP-ALT → switch to TBT → verify HPD/EDIDs/modeset
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_usb4_switch.c | 299 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   1 +
>   2 files changed, 300 insertions(+)
>   create mode 100644 tests/intel/kms_usb4_switch.c
>
> diff --git a/tests/intel/kms_usb4_switch.c b/tests/intel/kms_usb4_switch.c
> new file mode 100644
> index 000000000..05a6d3651
> --- /dev/null
> +++ b/tests/intel/kms_usb4_switch.c
> @@ -0,0 +11,304 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms usb4 switch
> + * Category: Display
> + * Description: Validate docking/undocking of TBT Hub and switch
> + *		from TBT mode to DP-ALT mode and vice-versa
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + */
> +
> +/**
> + * SUBTEST: tbt-dock-undock
> + * Description: Repeatedly dock and undock each Thunderbolt (TBT) port
> + *              `DOCK_UNDOCK_COUNT` times, verifying hot-plug events,
> + *              EDID (re)appearance and successful full modesets.
> +
> + * SUBTEST: tbt-switch-alt
> + * Description: Start on a TBT port, switch the USB4 switch to a
> + *              DisplayPort-Alt-Mode (DP-ALT) port, and validate hot-plug,
> + *              EDIDs and modeset on the new path.
> +
> + * SUBTEST: alt-switch-tbt
> + * Description: Start on a DP-ALT port, switch the USB4 switch back to a
> + *              TBT port, and validate hot-plug, EDIDs and modeset on the
> + *              restored path.
> + */
> +
> +#include <string.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <sys/types.h>
> +#include <libudev.h>
> +#include <drm_fourcc.h>
> +#include <xf86drmMode.h>
> +
> +#include "igt.h"
> +#include "igt_kms.h"
> +#include "igt_fb.h"
> +#include "igt_usb4_switch.h"
> +
> +#define DOCK_UNDOCK_COUNT 3
> +#define HOTPLUG_TIMEOUT 20
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	struct udev_monitor *hotplug_mon;
> +	usb4_switch_t sw;
> +	struct usb4_switch_port_info *ports;
> +	size_t n_ports;
> +	int n_pipes;
> +	int current_port;
> +} data_t;
> +
> +static bool fit_modes_in_bw(data_t *d)
> +{
> +	int ret = igt_display_try_commit_atomic(&d->display,
> +						DRM_MODE_ATOMIC_TEST_ONLY |
> +						DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						NULL);
> +	if (ret != 0) {
> +		bool ok = igt_override_all_active_output_modes_to_fit_bw(&d->display);
> +
> +		igt_require_f(ok, "Cannot fit modes in available BW\n");
> +	}
> +	return true;
> +}
> +
> +static void setup_pipe_on_outputs(data_t *d,
> +				  igt_output_t *outputs[],
> +				  int output_count)
> +{
> +	int i = 0;
> +	enum pipe pipe;
> +
> +	igt_require_f(d->n_pipes >= output_count,
> +		      "Need %d pipes for %d outputs\n",
> +		      d->n_pipes, output_count);
> +
> +	for_each_pipe(&d->display, pipe) {
> +		if (i >= output_count)
> +			break;
> +		igt_info("Assigning pipe %s → %s\n",
> +			 kmstest_pipe_name(pipe),
> +			 igt_output_name(outputs[i]));
> +		igt_output_set_pipe(outputs[i++], pipe);
> +	}
> +}
> +

This function is already present in the IGT code, can that be reused 
instead of duplicating?

Thanks and Regards,
Arun R Murthy
--------------------

> +static bool modeset_on_edid_connectors(data_t *d,
> +				       char **edids,
> +				       int n_edids)
> +{
> +	igt_output_t *output;
> +	igt_output_t *outputs[IGT_MAX_PIPES];
> +	int out_cnt = 0;
> +	drmModeModeInfo * modes[IGT_MAX_PIPES];
> +	struct igt_fb fbs[IGT_MAX_PIPES];
> +	struct igt_plane *primaries[IGT_MAX_PIPES];
> +	int i;
> +
> +	/* Find all connected outputs whose EDID matches this port */
> +	for_each_connected_output(&d->display, output) {
> +		for (i = 0; i < n_edids; i++) {
> +			if (usb4_switch_port_has_edid(d->drm_fd,
> +						      d->current_port,
> +						      edids[i])) {
> +				outputs[out_cnt++] = output;
> +				igt_info("Port %d → connector %s (EDID %s)\n",
> +					 d->current_port, igt_output_name(output),
> +					 edids[i]);
> +				break;
> +			}
> +		}
> +	}
> +	igt_require_f(out_cnt > 0, "No connectors found for EDIDs on port %d\n",
> +		      d->current_port);
> +
> +	/* Reset display and assign pipes */
> +	igt_display_reset(&d->display);
> +	setup_pipe_on_outputs(d, outputs, out_cnt);
> +
> +	/* Create simple color framebuffers on each plane */
> +	for (i = 0; i < out_cnt; i++) {
> +		modes[i] = igt_output_get_mode(outputs[i]);
> +		primaries[i] = igt_output_get_plane_type(outputs[i],
> +							 DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(d->drm_fd,
> +				    modes[i]->hdisplay,
> +				    modes[i]->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR,
> +				    0.0, 1.0, 0.0,
> +				    &fbs[i]);
> +		igt_plane_set_fb(primaries[i], &fbs[i]);
> +	}
> +
> +	/* Fit modes in available bandwidth */
> +	igt_require_f(fit_modes_in_bw(d),
> +		      "Failed BW fit on port %d\n",
> +		      d->current_port);
> +
> +	/* Commit the atomic modeset */
> +	igt_display_commit2(&d->display, COMMIT_ATOMIC);
> +	return true;
> +}
> +
> +/**
> + * Returns the index of the first port whose .type matches 'type', or -1.
> + */
> +static int find_port_by_type(data_t *d, const char *type)
> +{
> +	for (size_t i = 0; i < d->n_ports; i++)
> +		igt_info("Configured port: %s (looking for %s)\n",
> +			 d->ports[i].type, type);
> +
> +	for (size_t i = 0; i < d->n_ports; i++) {
> +		if (strcmp(d->ports[i].type, type) == 0)
> +			return i;
> +	}
> +	return -1;
> +}
> +
> +/**
> + * Perform a dock/undock or switch action on @port_id:
> + *  - set the switch
> + *  - wait for hotplug
> + *  - verify EDID presence/absence
> + *  - full modeset on connectors for that port (only on dock)
> + */
> +static void port_action(data_t *d, int port_id,
> +			char **edids, int n_edids,
> +			bool connect, bool reset)
> +{
> +	const char *verb = connect ? "Docking" : "Undocking";
> +
> +	d->hotplug_mon = igt_watch_uevents();
> +	igt_assert(d->hotplug_mon);
> +	igt_info(" → %s (port %d)\n", verb, port_id);
> +
> +	/* Trigger the switch */
> +	igt_assert_eq(usb4_switch_set_port(&d->sw, port_id), 0);
> +	if (!reset)
> +		igt_assert(igt_hotplug_detected(d->hotplug_mon, HOTPLUG_TIMEOUT));
> +	igt_flush_uevents(d->hotplug_mon);
> +	for (int e = 0; e < n_edids; e++) {
> +		bool present = usb4_switch_port_has_edid(d->drm_fd, port_id, edids[e]);
> +
> +		if (!reset) {
> +			if (connect)
> +				igt_assert_f(present, "EDID %s not found after dock on port %d\n",
> +					     edids[e], port_id);
> +			else
> +				igt_assert_f(!present, "EDID %s still present after undock on port %d\n",
> +					     edids[e], port_id);
> +		}
> +	}
> +
> +	if (connect) {
> +		d->current_port = port_id;
> +		igt_assert_f(modeset_on_edid_connectors(d, edids, n_edids),
> +			     "Modeset failed for port %d after EDID check\n",
> +			     port_id);
> +	}
> +}
> +
> +/**
> + * For a single port @p, repeat dock/undock DOCK_UNDOCK_COUNT times.
> + */
> +static void test_dock_undock(data_t *d,
> +			     struct usb4_switch_port_info *p)
> +{
> +	/* initial undock */
> +	port_action(d, 0, p->edids, p->n_edids, false, true);
> +
> +	for (int rep = 0; rep < DOCK_UNDOCK_COUNT; rep++) {
> +		igt_info("Iteration %d/%d on %s\n", rep+1, DOCK_UNDOCK_COUNT, p->name);
> +		port_action(d, p->port_id, p->edids, p->n_edids, true, false);
> +		port_action(d, 0, p->edids, p->n_edids, false, false);
> +	}
> +}
> +
> +/**
> + * Switch from src to dst port, verifying connectors at each step.
> + */
> +static void test_switch(data_t *d,
> +			struct usb4_switch_port_info *src,
> +			struct usb4_switch_port_info *dst)
> +{
> +	/* dock src, then switch to dst */
> +	port_action(d, src->port_id, src->edids, src->n_edids, true, false);
> +	port_action(d, dst->port_id, dst->edids, dst->n_edids, true, false);
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +
> +	igt_fixture {
> +		enum pipe p;
> +
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
> +		igt_assert(data.drm_fd >= 0);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		data.n_pipes = 0;
> +		for_each_pipe(&data.display, p)
> +			data.n_pipes++;
> +
> +		if (!usb4_switch_load_config())
> +			igt_skip("No USB4Switch section in ~/.igtrc\n");
> +
> +		data.ports = usb4_switch_list_ports(&data.n_ports);
> +		igt_require(data.n_ports > 0);
> +
> +		igt_assert_eq(usb4_switch_open(&data.sw), 0);
> +	}
> +
> +	igt_subtest_with_dynamic("tbt-dock-undock") {
> +		bool saw = false;
> +
> +		for (size_t i = 0; i < data.n_ports; i++) {
> +			if (strcmp(data.ports[i].type, "TBT") != 0)
> +				continue;
> +			saw = true;
> +			igt_dynamic_f("%s", data.ports[i].name)
> +				test_dock_undock(&data, &data.ports[i]);
> +		}
> +		if (!saw)
> +			igt_skip("No TBT ports configured\n");
> +	}
> +
> +	igt_subtest("tbt-switch-alt") {
> +		int tbt = find_port_by_type(&data, "TBT");
> +		int alt = find_port_by_type(&data, "DP-ALT");
> +
> +		igt_require_f(tbt != -1 && alt != -1,
> +			      "Need one TBT and one DP-ALT port configured\n");
> +		test_switch(&data, &data.ports[tbt], &data.ports[alt]);
> +	}
> +
> +	igt_subtest("alt-switch-tbt") {
> +		int tbt = find_port_by_type(&data, "TBT");
> +		int alt = find_port_by_type(&data, "DP-ALT");
> +
> +		igt_require_f(tbt != -1 && alt != -1,
> +			      "Need one TBT and one DP-ALT port configured\n");
> +		test_switch(&data, &data.ports[alt], &data.ports[tbt]);
> +	}
> +
> +	igt_fixture {
> +		usb4_switch_close(&data.sw);
> +		usb4_switch_free_port_info(data.ports, data.n_ports);
> +		usb4_switch_unload_config();
> +
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +		udev_monitor_unref(data.hotplug_mon);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 55bcf57ec..19a7a5ad6 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -270,6 +270,7 @@ intel_kms_progs = [
>   	'kms_psr2_su',
>   	'kms_psr_stress_test',
>   	'kms_pwrite_crc',
> +        'kms_usb4_switch',
>   ]
>   
>   intel_xe_progs = [
