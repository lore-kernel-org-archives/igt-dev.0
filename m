Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50B0C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 18:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9514010E28B;
	Tue, 25 Mar 2025 18:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zurrb7yZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A1D10E5E8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 18:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742926282; x=1774462282;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mohFjtKbYSS44tU64ag9PhXiHMRWraqnQmT6G8wGgGw=;
 b=Zurrb7yZM9T0Hj/WhWn/qceQLpKe3LXarxMU/QIVczCQdGrR5Dsd8hqV
 /FccSjKqVhpEv9RZEppsvdPwsEgUtn9zgiMd7Z1EyP17xu8R3mVcp02Mr
 tqGO2TdjYOfCm+yYNLdwCoyaDSZjzZzLohOZlzm6X0xUlgzkYhKZ/es7e
 9wV4oxD4cyFXixb3SkrHs9xN2MeIG1m5l/5JDkqQhN1Q+Na8OoKs2sMEw
 rWVmCqlFtTu3abw4v55xGFvGRGA27g8LojNY8lPFY6LTiUeSc45SaqmgP
 YJkY97ww5SoNp20Bex260IJpexKnC3VvJ6erdPcSGEeq9Dy2TcboCE6qO w==;
X-CSE-ConnectionGUID: eEjQK3nPTj2hF8LqooPX/A==
X-CSE-MsgGUID: qQ2MDBQKSeS05LE/mI7l4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44346934"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44346934"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 11:11:18 -0700
X-CSE-ConnectionGUID: LAJ8pZKjTyCrV61TMFSHvw==
X-CSE-MsgGUID: Ci+y4fRPThinoiVabW3tkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="125393824"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 11:11:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 11:11:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 11:11:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 11:11:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDQSUk/ImuPfR+gULpu6wTN16z4plDbo67ISkgDUG/AbmWfbFkIKenS/A4KQi34bIjikIYHQ2gw4KT3N3Rpgvr+ya6cOVwyNho0zAzUbdOPNuMi/OGloVSe+HploKKzGZfDsgbH/b3x04XJM9c1am5iRh7LrcWBnD1Ze0SX72M+sZI5rR3AFCZfiyeQ/LmdjYofvLYErssTnEX/Ln/Ol0Z8nP8W/8NY5zS14p5b94t29BTkfYehEGZtRwn/SizYaqAIKJmsLIGsdvRaKGomhfI53qSgFfR2Kj+t4ksRhSPyfjm83KcX4QLPSeIFJqJHWqomdTLTKtX+l9Rp0u0HDmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nePj69kry/RyxjIQogC9E3JpNHh5FkB7possWgzY/7U=;
 b=S2AhQNUyAmRlx4hvSeIAReMC0Kxr7sx92cfDuZdT7qO8WdhobTyUSD4WhrnPuYRDwhnyBDFa6AMYkaOGel0LRGfy6/inlcfXBFmp4YtrSt5KU6Uen04TmSYoXB1kPDC+xI1IOCBh6vBGGa7m6lO05TbCyHucJony2e3gH0w21FLgjtog06F+kpk2OUPP9OqwmMNkHCPxbVhgok7aKJrgYHek9Oab9tOgA8GW8wQiX0TCEsEYA1RDDXRHvxDOSMjzXstnCYfD963SWfVnfg4/IMsk1OT6/ZbpqLpYK/edDziETxGZ4jZRAN+kGJ/UiNMydx3Es5UBZLzjXJ/e+yxH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 18:11:11 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%4]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 18:11:11 +0000
Message-ID: <dbf6d0c9-2503-4e2d-ab35-7bc6a8c54110@intel.com>
Date: Tue, 25 Mar 2025 23:41:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/dsc: use intel_display_caps instead of
 i915_display_capabilities
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>, Vinod Govindapillai
 <vinod.govindapillai@intel.com>
References: <20250325130842.1821042-1-jani.nikula@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250325130842.1821042-1-jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::22) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|CH3PR11MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af7d5d6-4446-4129-a9a9-08dd6bc86c2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlZUVzhodVZFSDh3RXAzYVA1YkVPbDZWVkhqNWhtYzRENy90a2pXUnJoMndk?=
 =?utf-8?B?QkNNMW8zSGJnc1g0eVAwV3pzejNqRHJSZTBNeHRlWjA1bW55UTlwdzhkeHBw?=
 =?utf-8?B?SHdpMWl3M0ZvQ09ocVhxU1l5aWhUK0swUG53ZGkrY2F1aGVENkYyU3Jxb1hl?=
 =?utf-8?B?c3luSDBNWUtXblV2YVFYR3dUQXpPWlVidVJLLzU3SkNMRXJHa3dKb0tqRVRj?=
 =?utf-8?B?NWlKMEU0NHNBaHMzdUE0eHdLUHZtcGxVcVBQQVowZXJianpGdXRDVXU1MHhI?=
 =?utf-8?B?MmRBRzhtcGxKdk5rbGZwN3VOTG40UDBQdmZnRkZzNExldlBtdWFJNG9tZW0z?=
 =?utf-8?B?WlQwZVdsZ1dZR1AvRE82VHRHclBrQjZSN0NaM3o1QzhsQkk4dStGRGhNeFc0?=
 =?utf-8?B?RTB1bHZlQXdyTFRhRnRRZ2N4VzZQaWxGK0ZmNWptUC9HOWp0NWMxZ1hDV1RB?=
 =?utf-8?B?YVFDRXhXU1drc0U1M2JhOWR0UXBmQ1Z2UTZXT3V6SGkvYVhGZ2RUWHBHYTlH?=
 =?utf-8?B?Ym81cFJjV2JJRC8wNzJBNWlEWTVFS3ZRRUdLSHhRa25hUmthYlBwdnIxSUc2?=
 =?utf-8?B?RUc2cysvSWh0TU1LNHcvaWNTVzZITkVlZ3hsZ2RhOWdQMkpHTWlDL2RsMlly?=
 =?utf-8?B?V2ZiZ3VldWIrQ1V3Zlhaa0FUMFVwYzhjR0t0S3R1VjJkVVVkeGt1QmppOERQ?=
 =?utf-8?B?UHI3UlhIRWxVMXl1TVVpekY4cXRzMml5enNkYXlTTk9kdE9TTVZ2aWFhaXo1?=
 =?utf-8?B?eS8yNEsrY0lpK3Fjd2VaRXNObFVZWFB6VjNpVzAzYWpIc2F1VTQ3K3ZJQUwx?=
 =?utf-8?B?M2trN0NMMUV3cjYydFdhS0tVcTUxd1lqZ3ZOYUttbWhZbm5HNFNqY2MzMmIw?=
 =?utf-8?B?SWhtMEZCemxOVUljMmdldUdEYjVhVTBDWXErMGNJMGNxeE1ha29sNy91Si9L?=
 =?utf-8?B?TjJlQTBnTU1JWG1BcitFOFpQUWs2dkE5K29ZenFyLzJ1MlRjVmw2bXE1aXFL?=
 =?utf-8?B?VFZVR0V1bFdTb09QTUNGSkZpNjVLOXg0NUtMY05lN05Wc2tiZDR6c21SMkJl?=
 =?utf-8?B?TzVrb3l4Nk1OUUFxTitSKzVJK2toUmpVWFJid2grOGI4Q2RmYk82eFBLTDNx?=
 =?utf-8?B?WFFhWlFuaE5MbUhFNGJaMFl2TWErakV4SnUrL1NtYnMxYkE1Z0cwTDZIcWFm?=
 =?utf-8?B?NGZpMnVXTnNSVGpaN3p1WTFScGcxUGMwd08vUThGUEo5cVhsUFVDNE5lUXEx?=
 =?utf-8?B?WEdaNy9nejRLanQ0b3pPNERZK0FMdmNTeVdiM2hTSUp4NFk3djFCVXRtMDdL?=
 =?utf-8?B?NWhLL1IzZ0ZoYmd4K0I3dzdPRWFlNmxvazYxcUhTL3pnUUVORG9lekJ1TWtj?=
 =?utf-8?B?UlFSR1NLczJSemhWVlZ3c0duUEJ6aVh6NWh5V1ZBQzhHQXp6VnhZMzYxUHEw?=
 =?utf-8?B?Q3M3RzJuZnA0NXFFT2FQODlKLzJOMnlwYW0xRVZJUG9ESGpYcTB5djFHOEV2?=
 =?utf-8?B?em9YMllIOTJFeCtYWjU3Zkh4T1BBVEFwSnJSdTFwWGxnYVdKK3plOFEwQWVR?=
 =?utf-8?B?QUM5T2JRaWY2VTBWeHdUQU1ManpEeHg5Q0pjcUR1RUhHdHVBRTRYdldKbDZD?=
 =?utf-8?B?aEdGYXZPcWREMldVVjR5Rk5vNkRGdTZSTU4zSjBTd1RGOUdzNFprajVyeDBS?=
 =?utf-8?B?NHRmVFZpay9jQ0tyZFppQ1ZaSFRuekdrVXNub21TOFZ2cEJYY2UrdDlLT0dO?=
 =?utf-8?B?aFI5WXhJR1lId09CNjI1djlJQ3p0VHNoRlhMODZCbzVJNUlDMkEwOCtvUlYz?=
 =?utf-8?B?RzhMMG1YTUJzeVg1eE51dnQweXF6N3JsaytSNi81b3FmNFZCM2tVT2VRcU9Y?=
 =?utf-8?Q?PnCyl1VRoVY5+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFVYQVY2QldMS0EyRnpwME0xeUZESVhoNldRTnFrcHduN28zU1JLY3hHT081?=
 =?utf-8?B?UGE2TC9zcXJBalVIY1FNL29HejBMdy9UUWVhaU5zaGlCa1BwZGN3UTBSWVdY?=
 =?utf-8?B?QzJ4UkNQekZ0UU56SXlObFVpWm9QWmRic05QS1dVQUQvdXhVMjI2Y3IrVjRl?=
 =?utf-8?B?UTNHbW9PQlF1VzJkbWJiQnY4Y1RJS0tGSkMvQ29Ed2l0TGpodnR4Z1ZOUzJv?=
 =?utf-8?B?OE55cFlCdXF3ZjAxZkgzbkhpdTlGd3AvbmhnTE9kTlA2dkp2dDdyV3I3MHVr?=
 =?utf-8?B?NjZqa2pMNUwwUjJIbmNkL054RytuSDVlbTBOdU5TVkNIbm1zNjdEMG9uK0la?=
 =?utf-8?B?eDBodkRjMFdzWkR2NWYxOXIxMFFNK1k2ZWxwd245eEdONlhzTTh4ZUNTYzJV?=
 =?utf-8?B?aFVtOXNyQ2IxRXB1Y2Nobmg4RXdEZTlHcDUyRG1mWXlDL01wVDBIbitvZW5T?=
 =?utf-8?B?Rlhob1F5RnMvZ0JEK3g3dVFWTWdZZ1gwait3ZWkzTHpEWmJHUFZvd1VrR3p4?=
 =?utf-8?B?RkpUZ3ppMlU3SjFFVnFFU2QrbGNUOFdsenVXbDgyUGlGRng4SmQvbVdTUHNU?=
 =?utf-8?B?U0FrV29UMEc2N05FcVQ0Wm9jazVQb2tGUVdaM2RCV3NQV3hQUytWQU5Qb2Uy?=
 =?utf-8?B?VWUxTG0zV2RYN3NBVEtPWXE3MDVGdE5WTkdCTU5hWEpGV2dhTnlITnNiVDg2?=
 =?utf-8?B?cEJVOVljeEI4K2ZyWmhNYXVkeW9yOGtYSWVlb0xqNW9UeFNWdXZNNXliakxJ?=
 =?utf-8?B?cUUycHdFTkxRNmNEcFBlbzgwQUNua2FqcmVSeTJPejRZVXNwSDJBRlRVaTJo?=
 =?utf-8?B?NkxiSmdCWTUwMHdZcEZITCtIeHYyUUcrSXh0TGVlcURqVEI1Zm1BcEhKUDFT?=
 =?utf-8?B?Y2trckEyaEx3UXErc1lqdiszd1hWclVKcGVKS0ZrMzNqMG1PTGxLaWpGd3BT?=
 =?utf-8?B?c2pDdlJUVVhBM3YxM0hGV0MxVllsK1FtMlh4bmZMY256MEJBQ2RSUDM5aUV4?=
 =?utf-8?B?VlhBZzlCb2ZKaGh3ZzZibHY4WFhyMmQ4V2NVcldvckVZUTJVRVRrRUdOaWdw?=
 =?utf-8?B?S2ZWWXdOb080RFFOL3M4SDZORG04YXQ0ZTNtYm9GaE9vZlJXWUZqSlk2R2VV?=
 =?utf-8?B?cnk5T09iSW1wbGJUall2NG9SbzdiNENnemFiQ2FoK1E4UTBqWmNpUHRkM3NT?=
 =?utf-8?B?UmdETXNJMlZlZWtKYmVYZXMzb3RGZDJqOFF6WG1zWVF0SStJeGVHR2dLdHVy?=
 =?utf-8?B?N1ZxOVhFWUQ0dE5peDZuQ1NlVE5kZ3J6RHFDcXJPMWpzaTdEZGZlQkYvSnEr?=
 =?utf-8?B?WDFvZjFYME9ZOE1oa1d0K3dDc0VXNGhrc2xMUm5NOVlqN2d0OStpSllHL2Q2?=
 =?utf-8?B?bEdnZTBpaDVKZUlKaHovN2RTZDF5b1JTYnFIQjNJVVdCbDQ3c0p4RU5QWHJK?=
 =?utf-8?B?eThBdytlNC8zangrVGUxS1h4YXZJUEpOaENmWWJLS1B1R24wQitUMU54NmNq?=
 =?utf-8?B?M3kvUTBxOTRKRFczeERxTVdxaW1YNmJZN0dxODVNNHF2OE1ocU5yYmxnMmQ2?=
 =?utf-8?B?UXE2czlqd0gvLzRvb0dMUjZDb2pwaHYwUXI4K2VWTnBtM1RBaGhXUHJMMGNz?=
 =?utf-8?B?NXRWajRoMzlqWm16blovMHJJZkwvY3FiRUdmWnBiT01DT1F0amMxZ0J6SjdJ?=
 =?utf-8?B?K2RxZDcxU0xiN3lsdUVIMEF1MmE4UEZIaDdlSk51MlpyeXRvdytnYVV1UHF0?=
 =?utf-8?B?Q3JZMFFGaXZKbkRwa0Z2MzAwSTNMamtrWFdPaC9XOHYyQTJBVmY5N3pzbUh0?=
 =?utf-8?B?YzJWK1ZNVzJJWXJ2Zy9TUkRSSGgzNzE5NmZzdzlNWUZhOEVNN0hDOFZOUUly?=
 =?utf-8?B?ZVVXRUNERE9aRVhIOE11bzlNZTBhQzlxaktNNjBKeXhvaldxWjRFcEYxNGRj?=
 =?utf-8?B?SWFZSnEzRXhXMEpKKzFGYkpPZUpCRFBldVQvV3ByU3gvbithYUpIYVE1TWpX?=
 =?utf-8?B?REl0M0JjdGVpbjg4RlZMUEV1cnhIQVpjRlp1N1VMenRiZWtVc2V5dkFxa0g5?=
 =?utf-8?B?S3BsQlRTSHJUYWFsbFlFbFNwOWhLWkh1ZGxYUlFWNXNXYWx0TlkyaStYUTht?=
 =?utf-8?Q?ADMjAJ/9F3gua5ZbsJS3o+dx4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af7d5d6-4446-4129-a9a9-08dd6bc86c2c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 18:11:11.4201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnapeCEwVVuWbQDgEuApQUXZGDidLrgyY39cfjr/opa6p0xYSULXjAFSZo1IgPOsAvkgsn08byg5NKt0vNH7hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
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

Hi,

On 25-03-2025 18:38, Jani Nikula wrote:
> Turns out we've added two similar files in kernel. Consolidate on
> intel_display_caps as the more driver independent name.
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Vinod Govindapillai <vinod.govindapillai@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>   lib/igt_dsc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_dsc.c b/lib/igt_dsc.c
> index 8d259b7344a6..4caad39db7a9 100644
> --- a/lib/igt_dsc.c
> +++ b/lib/igt_dsc.c
> @@ -56,7 +56,7 @@ bool igt_is_dsc_supported_by_source(int drmfd)
>   	dir = igt_debugfs_dir(drmfd);
>   	igt_assert(dir >= 0);
>   
> -	res = igt_debugfs_simple_read(dir, "i915_display_capabilities",
> +	res = igt_debugfs_simple_read(dir, "intel_display_caps",
>   				      buf, sizeof(buf));
>   	close(dir);
>   
Tested on ARL, working as expected.

Reviewed-by: Sk Anirban <sk.anirban@intel.com>

Let's wait to see if anyone else has any feedback.

Thanks,
Anirban
