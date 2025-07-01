Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0756DC7EE30
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 20:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A451E10E671;
	Tue,  1 Jul 2025 20:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYXmA4L3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CB610E648
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751401237; x=1782937237;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qp9wzGBsAdUTNf22BESr+NiDhEtVO9bUicPsFYzjbuE=;
 b=MYXmA4L3sqLK6LEYjeNengYHQIflqy9hU0fcaA0rS4or04nAK/YC9zCF
 B5g/0xZhV8o2uwszL5NpWCLV6BtvEukgELiD7qFKtHySTlDgsQ9VFU2xA
 SO3GIU9gQVybQ/5yLZcmiy710Kp0FpxDyvcI0Jr+8YCK7kTDDobo8G3s+
 sop1j/SNM7+aPqf4h/JcrMqV1UwmZjSGLkDSjkZTw5DfabRFq3hw3ZNkX
 MeshgBNXIFEFklPNF4JLSnKTQUQLHIgL3TEbzbzqjgi4ZKaNgYfN1TeFr
 6C8VZ6cXwxPYpQFHh47l4sy3M2qLoQlPcxlRb3S+EGDNgKDRgPel8KCwa Q==;
X-CSE-ConnectionGUID: HqtM8/4FQ2a5plnzmMgK4w==
X-CSE-MsgGUID: eL+2zFJZRhaxtY5M3v9DlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53546739"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53546739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:20:36 -0700
X-CSE-ConnectionGUID: JOHQoFkMR5WMPlh0DR7oHg==
X-CSE-MsgGUID: kyUTkwYlSKydD5baeDU4ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="177541337"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 13:20:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 13:20:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 13:20:26 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 13:20:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kYv8XKLM9YC03Wj55HrrTeGEb0I1fD0KnsbYh5CbgKwuTNKr/QKCHzgmjShuzjvSlBu1a6hTD71ebcn42Q06R01WgHwK4D8fyBVLHq1b8dJoLm6zk8Fst7ybZ1Hu3OH0G+h7PwXxiwY3IVgWgiXaj0TpwxKe6+xLJcHGiLLQMHkudtpS5jK4C9PI7FVjtxImKyj+hL0S9XuPxMoEFidyP2aYc1fivPpkQ8OewZq8O6PJugH056FwIu4nhPElcioY81uu+32RpKPwqHpmJh042YFYyxllMAy4Gd5C0ga+jn20uMJLcy6xJ8/w3Qze3tQKw2a3XRcJyiimk6MhZEho1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSYYA4E6PpIF9CGlIa+Z7K4BOIOaa7L9skSVHPYJtpI=;
 b=tVE10fKT9xiWdR8PnFmo0K4NU/48iiYgV1mZ4e43mNJ/LRI4moSVP6ViwEoxd+NG70F43Th1a9nbmDLvg68XqcPNPXWCNg8vLk9SHzr/SYz6fvzplxULcdieSnEzFShLgano7u5UvGOZLCPx1/E/7kUhmlj936ewGrWUdA8u+RqKlMjpY5tPwAvtSQjOr2fDQ7RcFGT9SDCG1vliOOIJCw3BlYWmzYtODd4So5kDsKJGS6/wibkfe9mh9nA/FZ1HOXamFo5A5P3PEFZU45qyRMdlEH9Bv1S7QBzklBl28d/qYqwaFi5CTDU6q5rXofeLbGUnie2kfP5zAJj687kxOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA1PR11MB9472.namprd11.prod.outlook.com (2603:10b6:208:5ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Tue, 1 Jul
 2025 20:20:23 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%6]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 20:20:23 +0000
Message-ID: <0b145bc7-973f-4bb4-a830-b5426554182b@intel.com>
Date: Wed, 2 Jul 2025 01:50:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/5] lib/igt_sysfs: Usage of Original debug mask
 to read/reset
To: <igt-dev@lists.freedesktop.org>
References: <20250604053046.1702233-1-pranay.samala@intel.com>
 <20250604053046.1702233-2-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250604053046.1702233-2-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0069.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::10) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA1PR11MB9472:EE_
X-MS-Office365-Filtering-Correlation-Id: d092c306-a431-4504-b8b6-08ddb8dcb4f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXVVY0swa1hOMFJaSjNZUmtmaUlweGx2QXorUXlJR0V1Q1dhaEtCandTSlpM?=
 =?utf-8?B?ZEFqSzU1anpBL2RxejZzS3ovZk15a1hJOEIrSFg0RmViUHU2TFoyVUI5L3hM?=
 =?utf-8?B?NFNVaGpra0N4RmRwdTVtRVRjNXlRdkk0bEdYOUFwYWlnMVhRZnlHemlETmll?=
 =?utf-8?B?MTlGejAraGN4NnJqMklIeHVSYUNLYXo0aERDZmE0WU5ydU9kc2dTMEdkRlZq?=
 =?utf-8?B?cWdZaWZubktnSmZHcWZheUxORkRjNUNWR1hHWjVLb0lSbVQyM1ZqbDFCVUMr?=
 =?utf-8?B?VGIrdTlQaHZCek9wSEpodG9pRml2SEhOdGNjTjVxRzRFNEkrZnd6aiszeGNC?=
 =?utf-8?B?L2dTLzNwU0dvYXNMRW5qeHlaWUdXNGhLWVF6UkZ0eHo0eGE3ajBEWUdTb2hD?=
 =?utf-8?B?NVJKd2FVbStHUjN0S2lyY1JsSzloR0dlZkxIcmNaOG5QV2J3eTVRT055S05G?=
 =?utf-8?B?MmQ0eXB5OVJsc045OFQ0Zy9oeUZNZFU2bnNiK2RiTUEzZmlXc2NuSit5WEhz?=
 =?utf-8?B?NDZmYUpBUG9iUXJnMzdYcGhXNFdSY0s2WnZQWWdDaFRGeDFtQWNjWEVXam9F?=
 =?utf-8?B?MlNxcnR2bTJpTG9vTG9LVlVONHFibTFRQnlobE4rYWE3bklKSDVqbHR1VUll?=
 =?utf-8?B?aThPM21rQzk2M3FIUXVhOVZ1TlNlQW9OMjNQU2NwemhOTEgwZzV2ZnZvS2Ji?=
 =?utf-8?B?bzlub2FDUjhBa3RnMkIrZDZsZVcvNEpIT201dGNtQnlMU3FHazFKbXZoN3ZT?=
 =?utf-8?B?SnhCS0MxZmFML3dHVU1VOHpNRkNJNWdNRHlLWFY5dGVtZTdhaDF4V0c2YTBH?=
 =?utf-8?B?akRnMW4zY09wdzkwRTVEaTVMRzR6MFVzNzI2cFhaelNQUDhoelJMV2FRNXNp?=
 =?utf-8?B?Ym0vbE9MeGpOVGpPeC9sSmJLaFNLaElKaGtIb1RUeStUZEJJSEJCSFlqZzJI?=
 =?utf-8?B?RWdHYmdML2RXUGEzbXJlUDcwRXp3SUJaakpKSmpMNDlUQVVUTWgwRGJxdFVu?=
 =?utf-8?B?a0ovMlRMbmZGeFpUNjk3NTRWQVpjMjJGWlBjMWJkVjBZTmRUdXFHczZjZEVV?=
 =?utf-8?B?aS9Qcnl0UEh2dmgzTlRLUktvQVdKc3VsdkRMOSs1ZEJvZVgwTm9JNE1KWWZz?=
 =?utf-8?B?bWZFcTVLYmczRUlGVVF3VHlBaGxSMWNIWXZKamcxWXpYZUdsdWFGL2V2RFZu?=
 =?utf-8?B?N212ZGZLLzJNcXpML0NucGhLQkoxOEVNdlFYVFRpK1drcndwMDRiY280eEFm?=
 =?utf-8?B?dnJBemNoRlkxOWFiZzJ2eDM3a3o0M2RnaTN5WUVvbjZiQlFwR3lOZ2lVb1Y5?=
 =?utf-8?B?eS8zR1dZYzE0RWJaTkRIS0tJRWIrdkFaYldhUDVPOVVSakR1YzJlUTM3U2R6?=
 =?utf-8?B?dmRUN3hkMXlUM2w0Q3JCY2RicGd1VEQ4ajJhTWxlaHdRc3NRVm9IK0N3WnBX?=
 =?utf-8?B?YmcwYTJKQ1Rld1ZPVGJldDByMDg3alh3a1J4Z1JWWFRRL0FmRzRkdXNmTFJr?=
 =?utf-8?B?L3gxYlBCQ01QekkzVWdCRFRybGtidXF0S1JhZnpwNVFMaHRwMzJUZ2lacytt?=
 =?utf-8?B?UEQ5c1ZaWU1QRDBKWG9WZWMwYUtoVUlieE4wNXVZQWxlak1tQUV3VnBzQUFw?=
 =?utf-8?B?cXFLNzFaWEFLRWZFcitZSWhtaEtpcGRXMFE5ZU8wUk8zRi9Qdm4xREN3Q1Fh?=
 =?utf-8?B?RzA1eHhGcjhzbXdSa0UwUTYzRjRDR3FOTE8wSzZRdVZ1UG9WS3VWaklhcHZI?=
 =?utf-8?B?SVhuOEkzV0thdDEzb2hBNy9nTENlcXZleTlyUWtxdFp3anh1ZmxGSnBlN3J4?=
 =?utf-8?B?bnNuRHU4UWNka2pBQlQxTHhSRlBxQ1hCcldMUU9odS9DYkhFUW9ibXZFWmxD?=
 =?utf-8?B?THlUZ2M0VjFqL1dkRHRETmdTTW8vZEtSczFKSi9OVUwrOHZ2Uk50bjA2a2tK?=
 =?utf-8?Q?RrIZiHglqjk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZXcXNVOEMvZzZjdmJxTkdVUXRLTDNZZFhJOGo5ZmNqYWRTYWZ6QnBsVnRv?=
 =?utf-8?B?cUtSa21NWEhJOHBRWDMvMGRnaSthQjNkSlhDK3N3ZnJKVzhVQTFGZkc1eTlT?=
 =?utf-8?B?T0RHK21RMGJLZGdFbEN5bEVmNjdkdGhHckNycHhsRkRFSjlUbDFZMTR5QzFq?=
 =?utf-8?B?RE44cU9vT1JJT3lMa3VtWTJTaDBJV3VHZ3RiVHFhUkI1cTVFbVJ6WXZCR3Jw?=
 =?utf-8?B?UE8xRUx2N1RLWXBxYlJJVEhLZU1aTDRaN0o4SFE5U3JWNFdOSHpTOEVjMlFG?=
 =?utf-8?B?ZUd5Zk5ZdUEzSjRSQkFWa1pUN2o1M1J1RVF2M3lvRzJSYnRVUzFUaStOYmlF?=
 =?utf-8?B?c1FHYXNGbFRxTEwyYVRjNDc0VTVuclcwSWRxTzVEN0kyMFJWSDV0bFAwajlE?=
 =?utf-8?B?bTRBRXpkL3haQ3R4NWwxaks4bmNSQTJPeHZhc2wxeStGQi91MG9jM2sxdEdr?=
 =?utf-8?B?djlKankycGp0cjY2MUJsQ3hMMHUyeFdLelEycXR2elQ5TlBhN1Z5MlAvSFE5?=
 =?utf-8?B?bUVYZzFuSThTOENYOFVqV3pYR3cvVTQ2QnhMNG45cVczaGl3KzFhczI4WSt6?=
 =?utf-8?B?SENzblZMQVA0dnB5VExieXhETU5BRWJRbHVVWnN2ZUp5d1BOMVhPUm5HcjFD?=
 =?utf-8?B?R3E5OXJYUmt1TVNTUTIyZGZJNnIxVW5yN2dzM0IyQVM5dHZMNWlidE5UWGdC?=
 =?utf-8?B?L2ZyUDI1RnVPNUtFZU54VXVab1E3SlJoQzVuK2dyNWpvcE80Y1hiaDJHWGNZ?=
 =?utf-8?B?VjBad05QNysyQ0RuakFPTWZ6bUlEUHNmeURwU3Vjb0dmeFFHanhOR002T3ZN?=
 =?utf-8?B?dmlkN3kyUXhEazMrbVUweXY2cko0alRMU2lXeHp4Mk1rR0tNajRxeHhVOFdo?=
 =?utf-8?B?K0o3UnZuWW5scERWNS9zUW9CRkROaUNJM1N2RlZ2cTluRFEvZmthYlovMWx6?=
 =?utf-8?B?VWYzMWQvcFpnT081TFVhelZybFNlOEhOWHd4WlNRdVdJUXBPdnVMVTF0akts?=
 =?utf-8?B?cjQ3blRyM1I4bmJLNkc0WjIxSlRQbDZDL1pGVzlLbCtQOTVvRVp6OHQ1MWtE?=
 =?utf-8?B?SHRKWFp3RTBNVys2dE5ZbXJJb1Nhang2YkV5blM1R202dlRUMmZ5Tm5LbUFj?=
 =?utf-8?B?eXhwd3BwQWVablA0Z1krK0xIQkFXaTdidk1MeDlhVGl1cmF4ak1xS2hmek5X?=
 =?utf-8?B?K1VFbVppQTdDTmNaQ2QxUk5JQWwxbEVYTW44L3JmNHBhR1BIWmhESjl1UGpj?=
 =?utf-8?B?K21CTjE3YXRWeWNSQWdWOG02NGNwVHZRS1RiV2Z5eGpxM05yMDk4Y2JTL3c1?=
 =?utf-8?B?NUIrZ2RINUkzT3dqTC9kcXgzTi9Uam83emNmS2IxM3d3WGlUem1CM1Zlb256?=
 =?utf-8?B?ZGNNcWZHS2tHYzBEUC9lT2lYUEkwQjU3OGRoVytwSFRkcWc0eHhoTS9ObE5v?=
 =?utf-8?B?U3pqRW5hdlhRbEdFWDZaR0FZYURNSGhibG5PRWVscVRzWTJVSkxmM2JOdGxJ?=
 =?utf-8?B?UUdpOGs3QU93cjA5em5NRWx5QWRQTmpkRlFDaEg2eHpGb3M5bnhaVHdLWGl3?=
 =?utf-8?B?K3NyQUtEV3lBZEI4TnZ2MHVkSUlpcEtpc2RqUHM2Nm1weHY4c1BkRjVmUUgv?=
 =?utf-8?B?UExrSTUwc2FxWndNSGtQc0YzMmtCemluN1hCTVdZWGhRSjhWTlp5Q2lRVm9m?=
 =?utf-8?B?dUtFV20ycXJmK3VsUkhvYUJSYW5vL21OWmNCa1Q2V2YrSk16bmVDUE5HRWoz?=
 =?utf-8?B?SUJsZ01mQmRwSUtpVVE4TVN4aGQrQWJEamlFNFArWEVPdllYNm1DQVZHMDV1?=
 =?utf-8?B?VVgwSnN4YjdWNGtFeUVTbTFwN1ZvZkdpQnJsLzhPaDlTb0NwQ2E0a3hNQTdr?=
 =?utf-8?B?UVI5VlhyamFUM0pxeG1OcW9tM3Z0ZDlDWFpvMnJLNUd3T3lZbURSTjVhWW9W?=
 =?utf-8?B?NmtIY0pqNEc0diswQlovdHdydHNSQm52ZjIvNUEwSVZzUzFCVTNBSVhtRENM?=
 =?utf-8?B?c0RscmhyR2dTaWVwQmkrMkNvN2lPWmE5bGxRVUpuVWNoQUJNQXI4amRudE9t?=
 =?utf-8?B?SjBZZ20rYWhHVnFsR0JKL2hQMEllMnVMZkxSMTVrTExXdCt5OWFxd2tIbEN0?=
 =?utf-8?B?aHB2eFB6VzBFK1NxZmFrY3dXd3ZaaWtiMlpmS1lJWFB4RUZERitnL0ovQnR1?=
 =?utf-8?B?NkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d092c306-a431-4504-b8b6-08ddb8dcb4f7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 20:20:23.5238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhvl8JlPNo/6rRCbYYZbpeu/F0+VbUzZoVGDJZlgquR0yv2zA41MwmJe7NiLIz3cviNGd79pF8j9yAFYqtrFgCFqiL+2Q2xBCYO8PzNbvCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9472
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

Hi Pranay,

On 6/4/2025 11:00 AM, Pranay Samala wrote:
> Original debug mask holds the mask before the test and will be
> used to reset the debug mask post test.
>
> v3:
> - Refactored for readability and address logical comment.
>
> v4:
> - Improve variable name for debug mask saving (Kunal)
>
> Fixes: 56b91193b825 ("lib/igt_sysfs: Implement dynamic adjustment of debug log level")
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_sysfs.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
> index 2ba96ca7f..b7ca1f2b6 100644
> --- a/lib/igt_sysfs.c
> +++ b/lib/igt_sysfs.c
> @@ -443,7 +443,7 @@ int igt_sysfs_drm_module_params_open(void)
>   	return open(path, O_RDONLY);
>   }
>   
> -static int log_level = -1;
> +static int saved_drm_debug_mask = -1;
>   
>   /**
>    * igt_drm_debug_level_get:
> @@ -458,8 +458,8 @@ int igt_drm_debug_level_get(int dir)
>   {
>   	char buf[20];
>   
> -	if (log_level >= 0)
> -		return log_level;
> +	if (saved_drm_debug_mask >= 0)
> +		return saved_drm_debug_mask;
return previously saved variable is not correct.  Instead always returns 
the current debug level value from the file.
>   
>   	if (igt_sysfs_read(dir, "debug", buf, sizeof(buf) - 1) < 0)
>   		return -1;
> @@ -479,15 +479,15 @@ void igt_drm_debug_level_reset(void)
Imho, The function name should use the word restore instead of reset, as 
it more accurately reflects the intended behavior.
>   	char buf[20];
>   	int dir;
>   
> -	if (log_level < 0)
> +	if (saved_drm_debug_mask < 0)
>   		return;
>   
>   	dir = igt_sysfs_drm_module_params_open();
>   	if (dir < 0)
>   		return;
>   
> -	igt_debug("Resetting DRM debug level to %d\n", log_level);
same here.
> -	snprintf(buf, sizeof(buf), "%d", log_level);
> +	igt_debug("Resetting DRM debug level to %d\n", saved_drm_debug_mask);
same here.
> +	snprintf(buf, sizeof(buf), "%d", saved_drm_debug_mask);
>   	igt_assert(igt_sysfs_set(dir, "debug", buf));
>   
>   	close(dir);
> @@ -513,8 +513,8 @@ void igt_drm_debug_level_update(unsigned int new_log_level)
>   	if (dir < 0)
>   		return;
>   
> -	log_level = igt_drm_debug_level_get(dir);
> -	if (log_level < 0) {
> +	saved_drm_debug_mask = igt_drm_debug_level_get(dir);
> +	if (saved_drm_debug_mask < 0) {
>   		close(dir);
>   		return;
>   	}
Thanks & Regards,
Ramanaidu N.
