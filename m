Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C7CC36000
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 20:45:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AAAB10E83A;
	Fri, 21 Mar 2025 20:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGSi+tpk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C50110E83A
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742589950; x=1774125950;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WaY0e1eJoS4lOjn4qKnNc/cikAgIvWSRhd4zXsDkOCc=;
 b=cGSi+tpkJurPLV9NotE7WZptgBWIe3V+zPUnbwwND/ILgxgrhOep+ES5
 Uu23mv62jtBHqsWt5H8qK7q8QgzC7EP8tFMs0L6pzrG+vwbJfQJUk7Tw6
 MTMWrd0wdhfczy8JcUC0j808Y3bAnD/Kz1CjcQ72483R/vKkncBuijhHL
 vewPrbPmxgU8C96KpdhZtlVWwNhH99Ca18tsPw5Pt994Xg8vi3Zx+dNJ9
 tKswpXKgY9ACk6r7OSbGgb2oxELj5PeWOJD0d5Xy9UMEBC1M8weR1/rwn
 u8Fowy0QU4fJsk4yVYrS1KQkaJ1kunJpDW2u+JMVkMCOxaQjLYK+O6Cat w==;
X-CSE-ConnectionGUID: ZaQAbSxNRRWaz7hsttuXJg==
X-CSE-MsgGUID: CwaBMLFVRzmxKtS7Ixybbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="54505024"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="54505024"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 13:45:49 -0700
X-CSE-ConnectionGUID: a26Ku4YgQdSerXLfyJ7U8w==
X-CSE-MsgGUID: ibYxbJxdSqeqK+Sh7Z3b0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; d="scan'208";a="160731635"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 13:45:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Mar 2025 13:45:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Mar 2025 13:45:48 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Mar 2025 13:45:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/FjtYTMkyPGgchxooxjIIPuP6jQFawmdxS5zrWgt13dyvIUJ7J3v3d4FZ18yir56shTZ3DDVqeSgsBCJK2Ccfynr+Px5y2Ngo1hMSyEH7kV0lk7fwq8MnYT407mYYhWsW26jObbiBAntbvtSm9xmj5UHjxO7l0D70x+gUE3y//cMnNfR1ZyIY8YX/kQerksVDKl8jsYSqfubWcPp5h3IZhn7vrW7jEQqlxviVHRD1sravJQ7jFUKea7NqIEf9rB0jLmzOk4UK5ZNgckMMGdPAK+7GYhSQiRze5IXn4DsFLTyPihm8o1zC1Evl6LwbHl9+ZBj6KbCeWDHk6UstRcXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwFUS5ubxvLtdWsWGfsdXC7AVZwgaE/aOsAMnyWQBYQ=;
 b=Zu+HNIP4k8h7LZLRfEOuzP21UU8cf/mNwXr0gK+m48oCqWMGUlThbcYwz0lsX+G/HixEd5cjDDOdrQ1FYZz4jmMZ2E1vH9Tct2hkdz4+PDJvI+ZuijZhb2hzH99xDHUxueARmIX+pCscz0NQ0hlVQFf/LOgEMc3d7Tq6vLZhg/6PXC2fvTnE65Uex7Ikp/zL0YqiuwZBaSWpXg0vEhAFQaux+09ktLpxFDh4tQiWu0RsDld7agPmn2cnMtOUTu4jLGsWokSskHO9SIuwKjjkd1wh3AwOEotdWJUYlLCBXAwlo9v3vBmlMkBBlRRHxRVWe3wll/PBnIoHCsnNPyzC7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 20:45:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.034; Fri, 21 Mar 2025
 20:45:45 +0000
Date: Fri, 21 Mar 2025 13:45:39 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity
 test for all functions
Message-ID: <Z93P87YG8/Naifh2@soc-5CG1426VCC.clients.intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-3-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250321110958.3557106-3-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:303:87::23) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: c28492be-afdc-49b7-47ac-08dd68b95ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjRKWDluTEpJUHVuakQ2N0x1NktueTExb0NRd1Fia0xBMnFvUkJwTjQvYkgv?=
 =?utf-8?B?cWgxdDlaT0tyTjV5U1JCZlBERlZNaFFTSlJjSXI4bUVickdJSGdSR2wyc25Q?=
 =?utf-8?B?dVl0NkErajBUVUlKejV1NktqTXBNOXNPcFg4ZW9DSFcrTW95QkdXYzNtVUFD?=
 =?utf-8?B?Sm1XYjBGWENwMkh6YTkwbDE0MnpiNWQ0L3J3WE9JWGZyTDM2L3FxMmc2L2hK?=
 =?utf-8?B?bGdOY0p2a0c5SEVhR0ZTUFBuQ3ZSSjRqUUN2V0hmSnlBbXpDWnkxZTJweDlE?=
 =?utf-8?B?RUdLRmlpdjNoLzBMU0lkRkdSdU1TQTU1MnlyenJ1Vyt6UEFIM1ROc1lrUUV1?=
 =?utf-8?B?YjFwZE93MjVqak4yQy9XVnZ6b3NPb0drNmk3cG94M253dzl2ci95V2duOGlZ?=
 =?utf-8?B?enhqUHIzWmpFeUorNklRemd4OUIyQ2EwRkhDa2FncXRObkpQOEczOGZidEt0?=
 =?utf-8?B?ZWdDR0txcEV3cjhqUE5VZVFYcWl1RDBRZkZER2krVWNnQU1EL2lCVVFvMlNP?=
 =?utf-8?B?bnRDQXV4OUFpVWYwaFA1NmRmVWdpQUUwbGRqenpkR0VPZGd0L2g2WGVHMjNo?=
 =?utf-8?B?azNEY0l4WW16M3pOUmNXNGRCVjFCeU44MnE1SXhScENJWDdkTGZNbjBHMGJF?=
 =?utf-8?B?dFFCMEtpaDgrSTYvdzBYdFArNDY5cUJRc3lnejBmWnVwWlJiMldCdWFzTzFa?=
 =?utf-8?B?QXF0eFBCNnFLMVdQS0R3ZTRGMm5nSjZmbS9GU2hWNmxvZ2pWNVovM0tzbE84?=
 =?utf-8?B?ZitoZUUvelBqblltdllCV29yMytaV0M2M21sTWlFalIyR0owVkVYWkRQK040?=
 =?utf-8?B?N2RKc3JwY0dXczF4VkVmODc4cXFtVXRkeEZSWHovSVFnMk0vQ2tqWFdkaWp5?=
 =?utf-8?B?MWlSRHh6ZmQ5czZlSE5DVFFiNGZJRFFiTzJqZVhFZmNERHdtUDF0cUlvY3hm?=
 =?utf-8?B?Rmd5WnIrV2RpZnRTZW13ckI3WHBybUx6NzRLMkhzbU9vQXZVbGh0czF1Vysv?=
 =?utf-8?B?K3F6enJSWThDT1lmQWdXRWt4emRRTThKRFM4N090aFpPVjlaLzkxNFArWDdl?=
 =?utf-8?B?S2gvVnlpYW5HbUVGM0xBdmRUNkNFamRuK1VRUk1RNnhYV2JMeHBJcUVFcFhI?=
 =?utf-8?B?L2J3N0xCRCs5cWE1RXIzZU9YbktyVUpUQU1KazNrLysvRXljMFM2dGJaUUtK?=
 =?utf-8?B?VFVjNCtvdVNpNlNpOWU0ejVtLy84aHduT0ZiV2s3ZlloWlZENlYrMGZMekFL?=
 =?utf-8?B?UjJXNVppMG9QS2VXMVBTVlpHL25vZzZlMVRIWlFvYW5ZSVRuMDY5NlM2M2Rt?=
 =?utf-8?B?aTlGSWZNWmdkbVJSVkwzdk5sTlBjT0xicnkwT3ZRajBuQ09zb0pIZTNYUTY2?=
 =?utf-8?B?aEFYUHRoVzFmdjFHTnFDaEpsZ2w4OG8ySTJzVnNIblJSMEFUMDNyV3MxSkhh?=
 =?utf-8?B?d2FydCtPZWJRSnYzcDN3MXVSZW96Smk2Z2FacFErRit1eG55a0d6bjMxNXdY?=
 =?utf-8?B?NmxpZ1dNOFA2S2kyaUpkbVZVRlFXUHdaQWVVamVWR3BWQVBES3dEMGZmOWFl?=
 =?utf-8?B?NzJwTXhhb3VQdDBQMkZaaGFzS0NXaGx4cXJndlgrKzZlN2J2ZVFOTEtFMUN6?=
 =?utf-8?B?akZBcHhqVlNtb2V1OHBrZDV6QndwcDNBdVY5MitqcUppa1RvZlJmNyt6cXhK?=
 =?utf-8?B?c0o2NEJ1R1U3ZGI5OEZxM0k0UTUzTVo4ZG1OeCtORHRwYUg2VUtrVWQ1citn?=
 =?utf-8?B?c0VTeVkxZjF1TDlURUFZa2pRS25SMXY0SHo2Mklkd0JzWWRpdVpTS2NidVRi?=
 =?utf-8?B?YWE5ZVp1WlQvOFljN29PbWptdE12YUszKzU5LzFtUGtaaXErK1NWTmM5aXJK?=
 =?utf-8?Q?Oyy4DLCge4b5r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdCZmdEK0ZCS0wvTDFLcE4zd2tRUGpDVXo5UXkyL0g5MloxVGZNdnZhTFp1?=
 =?utf-8?B?am9zRERaZHgzN3YrRzNlOExwREdHSk1rOGhXQkQvOHlwTGh5THFPeVJEb2l3?=
 =?utf-8?B?QjNyc0tNelloUXB6MlJURzh5SCs4SlRERFhlRzR0K0ZObnVOMk9WamYzeW80?=
 =?utf-8?B?LzFLL0t6N01WNkxkT3p1SWEvaUZZNjFFR3FCU1orT2k0K3Q4bXZ4VHNGMkFy?=
 =?utf-8?B?a2RJeit0Ti9ub2RGT2t3d1lTTUVBbWhhbTczK09nUFphdWgxY3RTTzRFTURi?=
 =?utf-8?B?NDROc25JLys5V0RXbXF5MVZta1R6cXRsSG5PaCtzVzJiTmw2Q0ZVYTduVWxi?=
 =?utf-8?B?ZnRHeEJTbkZjNXVWZ3cwbGpFRXMwWXBFQzN5NmVNWE5uTkJvS093UEpLb1Fh?=
 =?utf-8?B?dXZGMHYyQWlvbzlLRWJlTDFBNzRZMFlDckpHanh2UHZYOG1PVDU0SEFlcVly?=
 =?utf-8?B?T0V3ajh4UjQ2NTBZNmRmNWhLQmNTaklrRnlXcXFHY2Rud3AwdHRJRHJOSHFG?=
 =?utf-8?B?T1RNdnh5OGk0eG5HQzFiWGlYQi9iM3F5Qk0wOXp3MjZQaXMwejN2MkZiTGxt?=
 =?utf-8?B?UXd1OFBQMHhKck5DMW1LMTh2WTk5dFYzWmZYa3paUmNxRzhxWm12UG8wZjJC?=
 =?utf-8?B?VWNkbmxvMk1XYitzM1R3M3VkRVh2UnNOSS9lYW4rNTJMSWdlcm5FT1NCaC8x?=
 =?utf-8?B?N05GT0FUdS93SmZHRFR4YTA1ZEN6b3FoQ0dHV2J2WVRNbWdndHMrZ1RJemdp?=
 =?utf-8?B?SXJMbU5WQ2w3czc5REVzY2Y5c0VualR4NW1NcXJwWmdobnFTdENHbU85UWc1?=
 =?utf-8?B?bmNnKzI4MGUxTHRwK3RqVkZXQ3piWVVEVnJJM1Azdm85d3VQZGpYdDd4RWlH?=
 =?utf-8?B?RGZjSHJxWXdqbmhRZnlTL0VCZFloVjNhOVdLUWY1SEdWUWw5aHVZODErS09n?=
 =?utf-8?B?Rm11YWlrd3hBc1VWcHVPdGhGSllqSzgxb0tWbW5oT2RpN29tazZLUVNUZHZn?=
 =?utf-8?B?Y0k0N0F2Qkx1MkF0NXFMZFpDUFpRZTNaWXFvMFVJbWxjSWsrTzJlaHFFVlAz?=
 =?utf-8?B?OTJPUHNIcHlueHFobHA2WWozNmNneGlmeU5TRVlHTmZBbSsyWE1YelQxM2gr?=
 =?utf-8?B?ekFNWi9zWjhpMUVJdmlRNVY3ajlhUVZEdExweS9lTzNqVTlIVW1sOEV3d0FB?=
 =?utf-8?B?L21WTkNVRFJ2VVVLNWs5ZjJrTXYyZnNsdmdGbEhpL0dtUWtOenZ5bDAyekFR?=
 =?utf-8?B?YnZmMVZtaUlYcEVodGpGMXQySEpGVHR5eS9hVStONEpyM0VxdXRqSnB2U3Ay?=
 =?utf-8?B?MCtFQzBIbWVxRFZVdzlnbStHeE5NQTFvZUxIUlBEVlVOUVZzK0UwVjQ4VWtx?=
 =?utf-8?B?MjFaR0RvVDhlS0lVU1pQbzR2WldzVEQ3RElTencyWnQ2YjFsRGRTSXQwWkwx?=
 =?utf-8?B?NmpQTDdJUUszU0ZvQW16Ym5hZ1VZSWZhRUFUWkthZ2V2cXE5OStlcXdVa1hk?=
 =?utf-8?B?QTVFMDdjNkpndEVac0k5M1JyNUdJUE1oRlcvaTZ1emttZC9WS2VrVCs4RVdT?=
 =?utf-8?B?d0VCNUs4ZUtpbytKRFM3bHROeDB1ZGthQ3JwQXRYbDQwcmswbkEzZjFremlL?=
 =?utf-8?B?S0FwSnBmeElDanlERDJySU80blhNTDB4SVF5R0FwSnIxTEVuMXRaamZ4ZHlK?=
 =?utf-8?B?djJuc09aSUFOcHNoMkJrNCtVa2lYQWQ4ZTV2Skx2K0J2aXYzdmh3Vm5ZaEZK?=
 =?utf-8?B?VFk4TXJYTmw1VktZSmFBcnZYaHFLQXdnWTBmYmlQR01RaEVWb2MyM2Fwb2wr?=
 =?utf-8?B?cndoZlRBQ25KeHorRE95VlBHRHZTcUo2NmRtMVQxVURRclZNSXR4UEtCSjlG?=
 =?utf-8?B?OW51SW1WWFFXRTA4TUVGVDhKaWorM0ZzS0d1cldPRUlZalBIOER3OFhpVEh3?=
 =?utf-8?B?VHVjRVdxdGt6M2xMYk80ckpGLy9zWEtKT0RqZGpQeFF1a1BmbVBmWlczTEpE?=
 =?utf-8?B?S2pUcDNnOXZ0NnRYZDlCOExTOWRYdEQ2T2xDMEUrbGxjNTZTbkRDbGFoZEln?=
 =?utf-8?B?OTIvZWEzbEgxeFFzVVMxWERYRmpJRTdqb3RoV2lVcmM0Y0YyOXc5c2tCZmJa?=
 =?utf-8?B?QTFXeEcxckVIZzZIUUs0eitMdUQrZTg3WW9MQUFhYU9EODRENXk5aCt1SStZ?=
 =?utf-8?Q?aFXQ/+8nQMNZb++1ABSrgD4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c28492be-afdc-49b7-47ac-08dd68b95ab2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 20:45:45.8207 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iCDE6HCFkXVYeqhfsKdl5Z8nbO7yzXe8yG0vty9SaJp09FnAz4oqiQCbOQ3E5kUDxXWazKVq0w1TVBohR/u0Mfu6/X7HFVh9vSDG4Bsk1pU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
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

On Fri, Mar 21, 2025 at 04:39:57PM +0530, Riana Tauro wrote:
>Provision and enable 2 VFs with execution quantum and scheduling policy
>set. Add a test that runs workload on all functions simultaneously and
>validates that all engines are equally and fully loaded for the
>entire execution quantum of the function
>
>v2: add a different function for function config
>    add function details to log
>    move pmu_fd to struct
>    enable and provision VF's (Umesh)
>
>v3: split patches
>    move exec_quantum to variables
>    skip test if vfs are already provisioned
>    fix assert (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 129 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index f0959abe2..9a1f9b39e 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -14,11 +14,13 @@
>
> #include "igt.h"
> #include "igt_perf.h"
>+#include "igt_sriov_device.h"
> #include "igt_sysfs.h"
>
> #include "xe/xe_gt.h"
> #include "xe/xe_ioctl.h"
> #include "xe/xe_spin.h"
>+#include "xe/xe_sriov_provisioning.h"
>
> #define SLEEP_DURATION 2 /* in seconds */
> /* flag masks */
>@@ -124,6 +126,12 @@ static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_ins
> 	return pmu_config;
> }
>
>+static uint64_t get_event_config_fn(unsigned int gt, int function,
>+				    struct drm_xe_engine_class_instance *eci, const char *event)
>+{
>+	return get_event_config(gt, eci, event) | add_format_config("function", function);
>+}
>+
> /**
>  * SUBTEST: engine-activity-idle
>  * Description: Test to validate engine activity shows no load when idle
>@@ -187,6 +195,73 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		igt_assert(!engine_active_ticks);
> }
>
>+/**
>+ * SUBTEST: all-fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on all functions simultaneously
>+ */
>+static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
>+{
>+	uint64_t config, engine_active_ticks, engine_total_ticks;
>+	uint64_t after[2 * num_fns], before[2 * num_fns];
>+	struct pmu_function {
>+		struct xe_cork *cork;
>+		uint32_t vm;
>+		uint64_t pmu_fd[2];
>+		int fd;
>+	} fn[num_fns];
>+	int i;
>+
>+	fn[0].pmu_fd[0] = -1;
>+	for (i = 0; i < num_fns; i++) {

nit:
In the for loops,
struct pmu_function *f = &fn[i];
and then you can use f-> below instead of fn[i].

>+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-active-ticks");
>+		fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>+
>+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-total-ticks");
>+		fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>+
>+		if (i > 0)
>+			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>+		else
>+			fn[i].fd = fd;
>+
>+		igt_assert_fd(fn[i].fd);
>+
>+		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>+		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>+		xe_cork_sync_start(fn[i].fd, fn[i].cork);
>+	}
>+
>+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>+
>+	for (i = 0; i < num_fns; i++) {
>+		int idx = i * 2;
>+
>+		xe_cork_sync_end(fn[i].fd, fn[i].cork);
>+		engine_active_ticks = after[idx] - before[idx];
>+		engine_total_ticks = after[idx + 1] - before[idx + 1];
>+
>+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
>+			  after[idx], before[idx], engine_active_ticks);
>+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
>+			  after[idx + 1], before[idx + 1], engine_total_ticks);
>+
>+		if (fn[i].cork)
>+			xe_cork_destroy(fn[i].fd, fn[i].cork);
>+
>+		xe_vm_destroy(fn[i].fd, fn[i].vm);
>+
>+		close(fn[i].pmu_fd[0]);
>+		close(fn[i].pmu_fd[1]);
>+
>+		if (i > 0)
>+			close(fn[i].fd);
>+
>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+	}
>+}
>+
> /**
>  * SUBTEST: gt-c6-idle
>  * Description: Basic residency test to validate idle residency
>@@ -225,6 +300,33 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
> 	close(pmu_fd);
> }
>
>+static unsigned int enable_and_provision_vfs(int fd)
>+{
>+	unsigned int gt, num_vfs;
>+	int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
>+
>+	/* Enable VF's */
>+	igt_sriov_disable_driver_autoprobe(fd);
>+	igt_sriov_enable_vfs(fd, 2);
>+	num_vfs = igt_sriov_get_enabled_vfs(fd);
>+	igt_require(num_vfs == 2);
>+
>+	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
>+	xe_for_each_gt(fd, gt) {
>+		xe_sriov_set_sched_if_idle(fd, gt, 0);

Looking at patch 3, for the new test, the sched if idle is set to true after 
binding the VFs. That's a slightly different use case compared to the 
sched_if_idle = false case where vfs are bound later.

I was imagining that the provisioning would be separate for the 2 tests
that depend on sched_if_idle. Each test (with different provisioning params)
may need to provision the VFs separately.

More details in the next comment.

>+		for (int fn = 0; fn <= num_vfs; fn++)
>+			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? vf_exec_quantum :
>+						     pf_exec_quantum);
>+	}
>+
>+	/* probe VFs */
>+	igt_sriov_enable_driver_autoprobe(fd);
>+	for (vf = 1; vf <= num_vfs; vf++)
>+		igt_sriov_bind_vf_drm_driver(fd, vf);
>+
>+	return num_vfs;
>+}
>+
> igt_main
> {
> 	int fd, gt;
>@@ -254,6 +356,33 @@ igt_main
> 	test_each_engine("engine-activity-load", fd, eci)
> 		engine_activity(fd, eci, TEST_LOAD);
>
>+	igt_subtest_group {
>+		bool autoprobe;
>+		unsigned int num_fns;
>+
>+		igt_fixture {
>+			igt_require(igt_sriov_is_pf(fd));
>+			igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>+			autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>+			num_fns = enable_and_provision_vfs(fd) + 1;

0) Move the igt_require lines and autoprobe line to
enable_and_provision_vfs(). Maybe autoprobe can be global.

1) the enable_and_provision_vfs can take params - 
num_vfs, pf_quanta, vf_quanta and sched_if_idle.

2) Since we just want to modify the sched_if_idle param, we could have 2
subtest groups.

>+		}
>+
>+		igt_describe("Validate engine activity on all functions");
>+		test_each_engine("all-fn-engine-activity-load", fd, eci)
>+			engine_activity_all_fn(fd, eci, num_fns);
>+
>+		igt_fixture {
>+			igt_sriov_disable_vfs(fd);
>+			/* abort to avoid execution of next tests with enabled VFs */
>+			igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>+				       "Failed to disable VF(s)");
>+			autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
>+				    igt_sriov_disable_driver_autoprobe(fd);
>+			igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd),
>+				       "Failed to restore sriov_drivers_autoprobe value\n");

everything in this fixture could just be part of a helper, for example - 
disable_provisioned_vfs() 

I imagine things would look like this:

igt_subtest_group { /* sched_if_idle = 0 */
	unsigned int num_fns;

	igt_fixture num_fns = enable_and_provision_vfs(... sched_if_idle = 0);

	igt_describe("Validate engine activity on all functions");
	test_each_engine("all-fn-engine-activity-load", fd, eci)
		engine_activity_all_fn(fd, eci, num_fns);

	igt_describe("Validate per-function engine activity");
	test_each_engine("fn-engine-activity-load", fd, eci)
		for (int fn = 0; fn < num_fns; fn++)
			engine_activity_fn(fd, eci, fn);

	igt_fixture disable_provisioned_vfs(...);
}

igt_subtest_group { /* sched_if_idle = 1 */
	unsigned int num_fns;

	igt_fixture num_fns = enable_and_provision_vfs(... sched_if_idle = 1);

	igt_describe("Validate per-function engine activity when sched-if-idle is set");
	test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
		for (int fn = 0; fn < num_fns; fn++)
			engine_activity_fn(fd, eci, fn);

	igt_fixture disable_provisioned_vfs(...);
}

Optionally, you could have the all-fn-engine-activity-load-sched-if-idle in the
second group as well.

Thanks,
Umesh

>+		}
>+	}
>+
> 	igt_fixture {
> 		close(fd);
> 	}
>-- 
>2.47.1
>
