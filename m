Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAEAC02190
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 04:36:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4050110E031;
	Fri, 31 Jan 2025 04:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hYMzZnJC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0CF610E031
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 04:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738298198; x=1769834198;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=1FE/qPhSMsxBGZQ2b9IL+a71Z18IeOiBpyLqKdWBdgI=;
 b=hYMzZnJC2+8g8Igaw0uyrzNi6XJII4+ghMLIQSdmVIUzjUSjPxvrGUuO
 3P/yvyLeQak3B5geZ/WLMIdpn6sMhdiFGsXHnsBnrSh7QqW5057V0KYg5
 v1/8z41PAI3kdWiI5k0/XTcfQEeEjmHF77Tp5BbLYCH2MWY9Hft5ZZBJq
 HgIVIFLgSBZhio5a9SednnZTpeKHpDx+3Bfc2VVl7f2BJvYfo6gocCswZ
 u2nvUc+55GFKYXnHJh/ylNtSrT2nys89Oa33iQ3THl9yayIVWaU48uYFG
 6Di1kVNSqfBm3zqZ5SGmHqZX8pL5/W6XFmhN9FMPJ/2l86hbQ9CRijx+V g==;
X-CSE-ConnectionGUID: beJCj6kNQvqRhlupk9oADA==
X-CSE-MsgGUID: 3RMyx9huQuS4sEtCX2Sshw==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="38746689"
X-IronPort-AV: E=Sophos;i="6.13,247,1732608000"; d="scan'208,217";a="38746689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 20:36:37 -0800
X-CSE-ConnectionGUID: k16VhJ2DSf6ToVB3GN+Ucg==
X-CSE-MsgGUID: DY14GSBiTTW4AEs0+lIKrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,217";a="113556904"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 20:36:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 20:36:36 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 20:36:36 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 20:36:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5yH/L8Y0kPlm50P3vA4uTxboGEpLJ83id+r+R0cYPeUDb7Fwl9wV57HXrLeUWwfP0bLsN4znh47d6KqlspEmGvH57r+vShv9DvMYq4pDSZGAvY90YUXts4ipNFop8nZyDZ4X2B+IkNyDThVLqsZNW+qMx/kHa89QQwjsqn686PVAepM0EWUB5EvqPwT+wG5VxIxh0/R53NRwdA32OtczQE5zGGdFD4wmW2oMi4j4xkrzDLDcWe8H/ydYjTvnbd215w6THIGysMTVbX/ip0CDu6A8rQPY5d0svQgMimnsjh0fm3F5po7flXC41U1Yc8PN2kCad/ygC0VO8/YO300Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8XSSout6lLG9JCD2odvA3RDlPOwvWCZD4ksDEZWcOU=;
 b=eE0rhwZNr7Zwj/4WhHT7cnE19dlC1AfoFFYrOlR47thdQ/IA0OXBWwhnYnevHWWiRS3iv4qPUw5gdvdg1b6KDrmJlGKPSGt0pbJzIO1t8f400wC6C7+ej8gbSOhVhwFKiBKx0hYVY+0L8IKNDIcGiVucQusk8p03Ro+R5qsVqyOhj9QPi95NH4XDeMUWpSk8NFRwqPlYo1GghBgeEXi3OoDCaJbkiMaZ4yluVMD1VfN+cUc97RQa79MrFnbdmqHj9DyxuPNAhn+NotimNRhlhEkdIDnPcWHAqP0+thR594r2L6RVsbrSZzVq96fOR8B+HlPiqQQ3VJX/VwNsqa5TkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB6824.namprd11.prod.outlook.com (2603:10b6:806:29e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 04:36:20 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 04:36:20 +0000
Content-Type: multipart/alternative;
 boundary="------------9uxgSp7Ohe28eX2e47rBdqzV"
Message-ID: <36c2d5fb-7ae9-4882-9072-f573929633d1@intel.com>
Date: Fri, 31 Jan 2025 10:06:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/intel/kms_joiner: Add a new test to
 validate non-joiner mode
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>
References: <20250130172031.4126606-1-jeevan.b@intel.com>
 <20250130172031.4126606-6-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250130172031.4126606-6-jeevan.b@intel.com>
X-ClientProxiedBy: PN3PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b56c6db-4bed-49a0-abf1-08dd41b0ceff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU1kaXBNWVV1VVBRbEZhdXR0MlVzd3BjbDdSemlqNUEzZE9qZGh0NzdPVnBm?=
 =?utf-8?B?RCtYOWtEbDFtU1NKNDYyM2x4WUo1TTYyQ3dBZHRzV2NNSWN3QnlVdW1DRFkz?=
 =?utf-8?B?NWtGcktQNGpaTHBtMi9JTTNVUUtEcW51S0RMOU9wS1QyVjVSaW92TGZ2ZjZ5?=
 =?utf-8?B?c1FPKzdwczhwZUhiQkQxVXNHTXJ5a3pjOEMzRTEybldMTHJMZ1VLU3RNNEZh?=
 =?utf-8?B?MkNta2pmODhwU0VIVjJmZDd4VlJFNS84dEJkYVptdDhsM3JLOXEzWGV5b3Rx?=
 =?utf-8?B?cy92cWN6K2xpdGR2SWtsaVErSkw3TmlsNzlDNHliNTNwdXdGRDdTUDBQUnlt?=
 =?utf-8?B?YVBIREJ4bzF1c0J1WGszV2FLT0VmcVd3VWtZRXQ0NW4rV08veEFuTUZLMU1K?=
 =?utf-8?B?bi9Qczk3ZjJ4eUg0TTlDem9tVTQ1OXY3Tlo5aWdoZThMMGthb21KaDczSjZP?=
 =?utf-8?B?VkJjZ2h5L0Y2ZjNScytCdm0xVG9OcURqR3ZSMmxsV2t4RmJRT21QbTZKVkNl?=
 =?utf-8?B?MGh6Wm0rSmlMVG9QZzRsbllVdWJoSUFPTkJ4MUl5UFhTdUJ4eWYyOWF5ek5o?=
 =?utf-8?B?Yms0NjBGZW9uNG54bFkxcmRkN0xjcGRlZXRKd0xMc1RWYmVWYWo4VlFvL21i?=
 =?utf-8?B?TzB1VTlVRUpjN0RMYWVmWklFOGo3eG8vQ1ZpaDUzcUh3UCtmU1RzWms3UW9m?=
 =?utf-8?B?NEVYeDlkTjBzZUM4b2NtWGxTcm92UGRpVi9XR2dTbmJDbWo3YUUzMFJ6OXlK?=
 =?utf-8?B?cmxWUkVZRXlQWVhHRmJvbFhnU2JHU3lxamdrWmk3QTJzdko2OTFFR2VFeTFq?=
 =?utf-8?B?L25Qbzcyb1dnTmIwNUh3UVFPL3pGVklDMlRJRE91RElQVzNWMFBIR3pONzRW?=
 =?utf-8?B?WWdwc2lzQTVUU0xob0Nzbi9sNXVpMUZEZXlJdGhVNTVZV2V6b29JYVBwSGhp?=
 =?utf-8?B?YzZRVk55aDVDRityKzNTRE5CRzVWbHQrOUk5TDhuRlBPSngxaDVBUVpBLzhk?=
 =?utf-8?B?eENHM29hckFmYVlFcmIrVE13SnoxZThSVjVDajNNZ1RnMkVJaXdKZFlrTGRV?=
 =?utf-8?B?aEU1SzdnMkMyZWRxVjdWQkE2R3VzMUt5RlFXK0dHK1ovNXNPeHkwV2JIdlNk?=
 =?utf-8?B?YjVGNUlLTUF4b3JaQkhiekNrOFQ1WmMvWENBd3k1dmxBNWxzSjdsRi9YT1hX?=
 =?utf-8?B?RU9Gc2U0bTB3c2taTTFWaXhER1lkQTNVWFlNbTFqQXNrQWpqZllmSlhPQ3ZX?=
 =?utf-8?B?MVRzZ051RUlXeDJxWnErcEdyTjB6SGNvelZUMEpiRVg1RUZOYkpIN3NvNi9Q?=
 =?utf-8?B?SGNLcHVucjJDcXN1YjRIbEkwd0hEQ2VkMkdQWEpab0pXTGxoTEVMZFBmUlAv?=
 =?utf-8?B?T3VMWERFSEdPbG5pNVZzMU4ycURUblIxbDJ5YzNNVjJ3UGd2REVVdVZlK1M5?=
 =?utf-8?B?QUgySHZCSUVQTFo4R1J2K09YM1RFQ0tXL0NnVytLWFBXNmtRVVVxbjhQVzFz?=
 =?utf-8?B?M2pxeTd0THg3Q1B5bHY1YlRUOFNQRUNtK2tGZE00L0VrcHNINnNlWnRoczBM?=
 =?utf-8?B?QUU4czhvR3pDa3pDeFl6bUtya1Y2d1NnT2l6dVQ3aXllSjJBUzJCSU5LYi9X?=
 =?utf-8?B?YVpiblNtaS9HWWVZdkZudUdQZzlTUXBDaEtQUmRlZ1g3a1VmMi9PWm5YaXFo?=
 =?utf-8?B?YU1nUkdRbjh3Nnk1TGVzZXA1TVN1RlgwSjBQMUJJOThjMHcvWjZxWDlIVkpt?=
 =?utf-8?B?eW9SbEIyMzNVSkIxeU14ZDlRbFFTYTBLbGFFUi9mdUtWaTNNVkUyQXpkWk15?=
 =?utf-8?B?SmZEK1hNOEFmclRadG5Oekg4UWJZMHpodkxiK0d3dWNta0pkK3Z4ZTVuNENv?=
 =?utf-8?Q?hEgPfDhrjR/yk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2dBK25RZGY1cnFmL2UxVGVTMlZyVHBoelJjVk9MMjdtaWpaZFp2OUd2dnFI?=
 =?utf-8?B?d0lCT1hrWlRSOHpsRGhKWjdBZ083RlpGRmYxbXRWRXBDakxsNzZCYjJ4RnFS?=
 =?utf-8?B?SFNwN0FjZXFHYmcrTzlHenVpNGxEdFJ2OVZaYlpkbGVaQWxHNytoTjB1dXB4?=
 =?utf-8?B?MFhjNm55TTcrb0xkenZjNEJLOXdXbkpKU3hOUU4rbkdUUDB6bVc2bmppenA1?=
 =?utf-8?B?R2FKTnZTZUdlQnZXeElPTTU5bTdxbmN0Q0JCaFlwL2lncUVJb3BMOFhQbWJ3?=
 =?utf-8?B?M1p4VjJNcUZHVkFla2xIdHZzaFVqdWRUSE9DczZPUHFnZHJ5VFRjdDZackRl?=
 =?utf-8?B?QkRiQ1I0R1ZZSm1pSlF1T2FTckh0TkI1bFd5M3FTclZmb0pkYjZWZE9DNkZC?=
 =?utf-8?B?N0s1K0wyQ2htSm5CZUpHQUc4cWEyd2Fhblc4VWhPZWhDMFVjMVh6R25nZnpJ?=
 =?utf-8?B?OWlPMC9IN1c5ZVdrTW41QXo3anhydFh5ZUhuM05RVUhQNWUwME1GeGRGN0hN?=
 =?utf-8?B?NHFlUFN2ZDFrK1IxdDZJSkg3dHViTzVIVThvMktMN0lNcGZCOVV2OVg5NGRq?=
 =?utf-8?B?S24zbVN1YklBV1NzT0ZwUE1Gdkh3WDFhdXg0RTU4RURSL3kwRFpBK0dMR1Ny?=
 =?utf-8?B?VlBpRTBpNldKS1FMeFpCSk1uWUZJWGRlUkRzaG0xYmtvMHN4R3lMM0dvNGt1?=
 =?utf-8?B?MjZ0eWt1REFyLzVnVHZoSXZJQnRFTU1tVS9UVXlMSjM3ODNMNFJtNVpRZjlP?=
 =?utf-8?B?VTZYYnNpazYxRTQxT1hIM2VNQjlPSFJIamRhRS9XNlNyMUNTV1E0bG02QXBZ?=
 =?utf-8?B?cEgrd1RQdEJDRG5IMTBQdjF5SUZJc09VYUl2NnpYYUZZVjFOZmRTQnEyTGtX?=
 =?utf-8?B?eWZkbW8rOW8yZ0NJZkJMWlJ0Sk85Ym5VZ3V6TEJ4aTM2bE9TZjJHS1RpWUJa?=
 =?utf-8?B?V2piY3ZxQ01DNDR2Q0d3SzMrR0F1T2EvV3NBVUdDbWRBYkRXZFpIdUFRVi8r?=
 =?utf-8?B?U3ROcnZQSHhRekM2dE02ZllLSkgyL09TcTh4V1UwRTJSZ1BvVlMyamsrcE0r?=
 =?utf-8?B?MXpXV3NFbTgxV2tBUGJQVWVESnZpWW9TenZmU1Z0Z0l4VmY1RTdoblRXWHd3?=
 =?utf-8?B?NzkrS1E4QkFuUzRVM2gvK3dsUEhoeVFhajJuMllpclQvWjNOcWh0SDZUOXJs?=
 =?utf-8?B?dlhQWDlUVU1Yai9aakNRdFNwUEprS3ZmVEJOK1VTYzdsdEc5WlNpUEdyYnBz?=
 =?utf-8?B?YkhCTFY1VldVajhUVHpCenIwRExkUVE5ejFrcitJYmdTRnpHUGg5L3NOZnBR?=
 =?utf-8?B?U2FYU2E4V1BzU3o2dGdqMm9MSlFVUVVsNVgvS2FQT1JpRlNZV0ZoY3BtRFc4?=
 =?utf-8?B?V2hmRWpMb1gzQWpHNXFHMG5aTFB4TGcxZDBpZkFCWER2UkFrdXNxaE95b0Jv?=
 =?utf-8?B?Z3gyczJJaG1yc3JYN1hIb2dVMkZVQ2pHZGN4SzM5RDRUdGlJalRrU1NvYlp4?=
 =?utf-8?B?aWoyRGtsQk04eGpuWnE1aWRIL2hIUzNoemlLWTl5Qk1XNkZEU0orWUlac0Z0?=
 =?utf-8?B?cy9HdTRyc3dlRG5ONmFQSHFoTE0zWUZCbHFJdGtMcjkrOVg3d2NDaDROZEJS?=
 =?utf-8?B?WXduMEdyK0V2Wmd2bG1ra3pjbkw3OEM5azhjLy9KM0JYQTZGVW8yRG8vZWV6?=
 =?utf-8?B?VTF0MjlXbDd0SER0c1hKNm1BalNmaUR5bGhsZnZxT29UT0xGMjhpZUhhY25C?=
 =?utf-8?B?eWEzd00rRWlmczhtSlg5WU4zVXRTMG8wTUxBRDh6eWFBeVp3aCtTV25wQ3NI?=
 =?utf-8?B?MmNvN0NLMzVQUVlzeE1SRWQ5V2x5a2tvdGNQanRFa2I1REZiRnVIUTFSVndp?=
 =?utf-8?B?aHlNQVh4MVpzY1RxRnpLczNiRkNQTlg1WU90d0JaL2NNQ1NoWWgvTkxpRXZX?=
 =?utf-8?B?d3JQRXpPYUxYKzhjdUFpYUNQL29OMitEaUM4Ym1JR2JoZHBRWEhjNGUvb3or?=
 =?utf-8?B?bmd0SlpGNUt5b2RKWGFNRUFxeGU0N1orZkM2WU55Q2tLKzZmOTNpTU9vbGZS?=
 =?utf-8?B?cU01eTREcnROU3hHekVBbFcwV0VlUXMycTFGcllLdkJSbGtlcEM0UWxheE95?=
 =?utf-8?Q?lqQ1CF06/OjWPJBzJ/QjN0Ckh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b56c6db-4bed-49a0-abf1-08dd41b0ceff
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 04:36:20.2572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iz1akYpBZnkZ+5uCPuP+70RNaVMsIjAEUroWNI7s6sbvzoxQeeyTkvUrTGXOG3CLfXGIAg/Ly7OXt8xLf4DqnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6824
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

--------------9uxgSp7Ohe28eX2e47rBdqzV
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/30/2025 10:50 PM, Jeevan B wrote:
> We need to ensure that the system does not use a joiner for modes that do
> not require it. This test will validate that the correct non-joiner mode
> is selected, and then forcing a modeset and flip on the last pipe. If the
> joiner is mistakenly enabled for a non-joiner mode, the test should fail.
> otherwise, the commit should proceed as expected.
>
> v2: Fix nonjoiner_mode_found to find the required case(6K@30).
>      Remove clk sort and minor fixes. (Karthik)
> v3: Rename nonjoiner to non_joiner and minor modifications. (Swati)
> v4: Add joiner check. (Karthik)
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/intel/kms_joiner.c | 78 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 78 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 0a9910046..08a9c0cb3 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -75,6 +75,9 @@
>    *
>    * SUBTEST: switch-modeset-ultra-joiner-big-joiner
>    * Description: Verify switching between ultra joiner and big joiner modeset.
> + *
> + * SUBTEST: basic-non-joiner
> + * Description: Vefiry basic non-joiner mode across all pipes.
Please have a different name and a more accurate description. The 
intention of this test should be to enable corner case modes which are 
changing b/n different platforms.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -86,6 +89,7 @@ typedef struct {
>   	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
>   	int non_ultra_joiner_output_count;
> +	int non_joiner_output_count;
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
> @@ -95,6 +99,7 @@ typedef struct {
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
> +	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
>   } data_t;
> @@ -153,6 +158,23 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> +static bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
> +				  drmModeModeInfo *mode)
> +{
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *current_mode = &connector->modes[i];
> +
> +		if ((current_mode->hdisplay == 6144 && current_mode->vrefresh == 30) ||
> +		    mode->clock < max_dotclock) {
We should not be using hard coded values here as this will be different 
between platforms. Please update the check to use the maximum possible 
mode supported on single pipe for each platform.
> +			*mode = *current_mode;
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
>   static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
>   {
>   	igt_plane_t *primary;
> @@ -480,6 +502,48 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
>   	}
>   }
>   
> +static void test_single_non_joiner(data_t *data)
> +{
> +	int count;
> +	igt_output_t **outputs, *output;
> +	igt_fb_t fb;
> +	igt_plane_t *primary;
> +	drmModeModeInfo mode;
> +	drmModeConnector *con;
> +
> +	count = data->non_joiner_output_count;
> +	outputs = data->non_joiner_output;
> +	igt_display_reset(&data->display);
> +
> +	for (int i = 0; i < count; i++) {
> +		output = outputs[i];
> +		con = output->config.connector;
> +
> +		if (non_joiner_mode_found(data->drm_fd, con, &mode)) {
> +			igt_output_override_mode(output, &mode);
> +			igt_info("Assigning pipe %s to %s with mode %dx%d@%d\n",
> +				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> +				 igt_output_name(output), mode.hdisplay,
> +				 mode.vdisplay, mode.vrefresh);
> +
> +			igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> +
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +
> +			igt_plane_set_fb(primary, &fb);
> +			igt_assert(igt_display_try_commit2(&data->display, COMMIT_ATOMIC));
> +			igt_assert(!is_joiner_has(data->drm_fd));
Please fix the function name.
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
> +		} else {
> +			igt_warn("No valid non-joiner mode found for output %s\n", igt_output_name(output));
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool ultra_joiner_supported, is_dgfx;
> @@ -494,6 +558,7 @@ igt_main
>   		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.non_ultra_joiner_output_count = 0;
> +		data.non_joiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -512,6 +577,7 @@ igt_main
>   
>   		for_each_connected_output(&data.display, output) {
>   			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
> +			bool non_joiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
> @@ -522,6 +588,7 @@ igt_main
>   			 */
>   			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			non_joiner_found = non_joiner_mode_found(data.drm_fd, connector, &mode);
>   
>   			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
>   				force_joiner_supported = true;
> @@ -537,6 +604,9 @@ igt_main
>   			else if (force_joiner_supported)
>   				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
>   
> +			if (non_joiner_found)
> +				data.non_joiner_output[data.non_joiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -702,6 +772,14 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-non-joiner") {
Please update the subtest name to convey what is being validated in this 
subtest.
> +		igt_require_f(data.n_pipes >= 1,
> +			      "Minimum of 1 pipe is required.\n");

This is a redundant check IMHO as we have only 1 pipe needed here, 
although the check is in line with the other subtests in this binary. So 
your call if you want to still keep it.

But please add 'non_joiner_found' check here and skip the test from here 
only if not found.

> +		igt_dynamic_f("non-joiner")

Have the output/pipe name in dynamic subtest. Otherwise this dynamic 
subtest isn't required.

Thanks,
Karthik.B.S
> +			test_single_non_joiner(&data);
> +	}
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
--------------9uxgSp7Ohe28eX2e47rBdqzV
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class="moz-cite-prefix">On 1/30/2025 10:50 PM, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">We need to ensure that the system does not use a joiner for modes that do
not require it. This test will validate that the correct non-joiner mode
is selected, and then forcing a modeset and flip on the last pipe. If the
joiner is mistakenly enabled for a non-joiner mode, the test should fail.
otherwise, the commit should proceed as expected.

v2: Fix nonjoiner_mode_found to find the required case(6K@30).
    Remove clk sort and minor fixes. (Karthik)
v3: Rename nonjoiner to non_joiner and minor modifications. (Swati)
v4: Add joiner check. (Karthik)

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/intel/kms_joiner.c | 78 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 0a9910046..08a9c0cb3 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -75,6 +75,9 @@
  *
  * SUBTEST: switch-modeset-ultra-joiner-big-joiner
  * Description: Verify switching between ultra joiner and big joiner modeset.
+ *
+ * SUBTEST: basic-non-joiner
+ * Description: Vefiry basic non-joiner mode across all pipes.</pre>
    </blockquote>
    Please have a different name and a more accurate description. The
    intention of this test should be to enable corner case modes which
    are changing b/n different platforms.<br>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
  */
 IGT_TEST_DESCRIPTION(&quot;Test joiner / force joiner&quot;);
 
@@ -86,6 +89,7 @@ typedef struct {
 	int ultra_joiner_output_count;
 	int non_big_joiner_output_count;
 	int non_ultra_joiner_output_count;
+	int non_joiner_output_count;
 	int mixed_output_count;
 	int output_count;
 	int n_pipes;
@@ -95,6 +99,7 @@ typedef struct {
 	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
 	igt_output_t *mixed_output[IGT_MAX_PIPES];
+	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
 	enum pipe pipe_seq[IGT_MAX_PIPES];
 	igt_display_t display;
 } data_t;
@@ -153,6 +158,23 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
 	return master_pipe;
 }
 
+static bool non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
+				  drmModeModeInfo *mode)
+{
+	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
+
+	for (int i = 0; i &lt; connector-&gt;count_modes; i++) {
+		drmModeModeInfo *current_mode = &amp;connector-&gt;modes[i];
+
+		if ((current_mode-&gt;hdisplay == 6144 &amp;&amp; current_mode-&gt;vrefresh == 30) ||
+		    mode-&gt;clock &lt; max_dotclock) {</pre>
    </blockquote>
    We should not be using hard coded values here as this will be
    different between platforms. Please update the check to use the
    maximum possible mode supported on single pipe for each platform.<br>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			*mode = *current_mode;
+			return true;
+		}
+	}
+	return false;
+}
+
 static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
 {
 	igt_plane_t *primary;
@@ -480,6 +502,48 @@ static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display,
 	}
 }
 
+static void test_single_non_joiner(data_t *data)
+{
+	int count;
+	igt_output_t **outputs, *output;
+	igt_fb_t fb;
+	igt_plane_t *primary;
+	drmModeModeInfo mode;
+	drmModeConnector *con;
+
+	count = data-&gt;non_joiner_output_count;
+	outputs = data-&gt;non_joiner_output;
+	igt_display_reset(&amp;data-&gt;display);
+
+	for (int i = 0; i &lt; count; i++) {
+		output = outputs[i];
+		con = output-&gt;config.connector;
+
+		if (non_joiner_mode_found(data-&gt;drm_fd, con, &amp;mode)) {
+			igt_output_override_mode(output, &amp;mode);
+			igt_info(&quot;Assigning pipe %s to %s with mode %dx%d@%d\n&quot;,
+				 kmstest_pipe_name(data-&gt;pipe_seq[data-&gt;n_pipes - 1]),
+				 igt_output_name(output), mode.hdisplay,
+				 mode.vdisplay, mode.vrefresh);
+
+			igt_output_set_pipe(output, data-&gt;pipe_seq[data-&gt;n_pipes - 1]);
+
+			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+			igt_create_pattern_fb(data-&gt;drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
+					      DRM_FORMAT_MOD_LINEAR, &amp;fb);
+
+			igt_plane_set_fb(primary, &amp;fb);
+			igt_assert(igt_display_try_commit2(&amp;data-&gt;display, COMMIT_ATOMIC));
+			igt_assert(!is_joiner_has(data-&gt;drm_fd));</pre>
    </blockquote>
    Please fix the function name.<br>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			igt_plane_set_fb(primary, NULL);
+			igt_remove_fb(data-&gt;drm_fd, &amp;fb);
+		} else {
+			igt_warn(&quot;No valid non-joiner mode found for output %s\n&quot;, igt_output_name(output));
+		}
+	}
+}
+
 igt_main
 {
 	bool ultra_joiner_supported, is_dgfx;
@@ -494,6 +558,7 @@ igt_main
 		data.ultra_joiner_output_count = 0;
 		data.non_big_joiner_output_count = 0;
 		data.non_ultra_joiner_output_count = 0;
+		data.non_joiner_output_count = 0;
 		data.mixed_output_count = 0;
 		data.output_count = 0;
 		j = 0;
@@ -512,6 +577,7 @@ igt_main
 
 		for_each_connected_output(&amp;data.display, output) {
 			bool ultrajoiner_found = false, bigjoiner_found = false, force_joiner_supported = false;
+			bool non_joiner_found = false;
 			drmModeConnector *connector = output-&gt;config.connector;
 
 			/*
@@ -522,6 +588,7 @@ igt_main
 			 */
 			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &amp;mode);
 			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &amp;mode);
+			non_joiner_found = non_joiner_mode_found(data.drm_fd, connector, &amp;mode);
 
 			if (igt_has_force_joiner_debugfs(data.drm_fd, output-&gt;name))
 				force_joiner_supported = true;
@@ -537,6 +604,9 @@ igt_main
 			else if (force_joiner_supported)
 				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
 
+			if (non_joiner_found)
+				data.non_joiner_output[data.non_joiner_output_count++] = output;
+
 			data.output_count++;
 		}
 		if (data.big_joiner_output_count == 1 &amp;&amp; data.non_big_joiner_output_count &gt;= 1) {
@@ -702,6 +772,14 @@ igt_main
 		}
 	}
 
+	igt_describe(&quot;Verify the basic modeset on big joiner mode on all pipes&quot;);
+	igt_subtest_with_dynamic(&quot;basic-non-joiner&quot;) {</pre>
    </blockquote>
    Please update the subtest name to convey what is being validated in
    this subtest.<br>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		igt_require_f(data.n_pipes &gt;= 1,
+			      &quot;Minimum of 1 pipe is required.\n&quot;);</pre>
    </blockquote>
    <p>This is a redundant check IMHO as we have only 1 pipe needed
      here, although the check is in line with the other subtests in
      this binary. So your call if you want to still keep it.</p>
    <p>But please add '<span style="white-space: pre-wrap">non_joiner_found<span style="white-space: normal">' check here and skip the test from here only if not found.
</span></span></p>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		igt_dynamic_f(&quot;non-joiner&quot;)</pre>
    </blockquote>
    <p>Have the output/pipe name in dynamic subtest. Otherwise this
      dynamic subtest isn't required.</p>
    Thanks,<br>
    Karthik.B.S<br>
    <blockquote type="cite" cite="mid:20250130172031.4126606-6-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			test_single_non_joiner(&amp;data);
+	}
+
 	igt_fixture {
 		igt_display_fini(&amp;data.display);
 		drm_close_driver(data.drm_fd);
</pre>
    </blockquote>
  </body>
</html>

--------------9uxgSp7Ohe28eX2e47rBdqzV--
