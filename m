Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6858BC71130
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 05:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2376210E585;
	Tue,  8 Jul 2025 05:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxnlinvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB38510E585
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 05:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751951288; x=1783487288;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=WaMPjzhdmcOBEusjwLirOaEY/cBTxfqCz8BR7Vhzovk=;
 b=nxnlinvBP/e/x0+68JDTiWJbn2xjEySGRa4sJNc1kkmMoP2yVL7Gj18r
 4JTszcJSfFNfHHYoLg2OiAl87SRmf5IxUcbPNKHMh0JTFaiM9ETUEQjya
 VSuRX9J8q2tNqjKQOJ71G7ksCXvr42QghXJaEUubuAXt5p+XbbR49iMjq
 ktJGPiKKqdNdfVeWqZ3J6Ub2Qfg1A9hLDAtwPAy00EXE/epiewc4DNjro
 JtxUKIuUCsdNtv+mbmyiIE8EbxuwRWSRPF0QAf4sqahmIvX9+KBQqr9RP
 Q4iz3yQI1Q+B6iZ+47XkbJlSnMgFLnDjZeszR1Si/2uVgGmhp1ssDZe6K g==;
X-CSE-ConnectionGUID: msd6KW73QyaCS6GCN9JqrQ==
X-CSE-MsgGUID: 0JwH8QLbRCSr0usq7eNWVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="56790761"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208,217";a="56790761"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:08:06 -0700
X-CSE-ConnectionGUID: RQ5ce/f3SNu4nyks+inCXQ==
X-CSE-MsgGUID: oAAaIbN7Qiy2CXYAz/jRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
 d="scan'208,217";a="160949915"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 22:08:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:08:05 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 22:08:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 22:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1bzsu9Vne0NOrq95QZl66rhrR/n/y3dG3WsQgvCq5n7xg46l4p9GaMNnmQYVV9rP3vsURq19Xq145H/vuyagMAgONms7dul9NlTl3ah5jap0qBC6akSWf7W0Zolg7pgBJvTJeCpZm4gRMEKVqW1+ov0ijDwOIzJ+RUU7oDEAByUzV9xb6zJLOITOlUC41RQoC9r51H64yKxIRCKTPvOI1sjE3udAdT/YTajjLcS9KpSWGwk39mWdDh7SliqSfRkRRMhhZDGhxyMz4PnsXh5pdGFR6QSUM4cktYtyNl4lx89eM2kKxE1Lbo3G/hKBnpSG4oo1pNZxcd77uy7B2T8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QryJD+l39VUSTuqps54q1E+WXTPt5yCgum0mkJDkUBE=;
 b=u+EkZVBcrXcgApOZJcwRQkjDUFrFh8aPm6qhnWp7kXWUiHBQbU+bToCYkKPWtjDpFr2OHZqeInkZU3HV3x3M4vquloFaByumlJl1PXlAn8Cvhbspg1Qjprq4znIEp7owSuhXI2XUxwK3uHgAAn4zxPee+MHOYydWZUqe/tSlJhUGQTFYm65od9vZ2vzFkUv604BpS5A3xW6Sapmz6wvMcHaynY7AJAEUR6ltMQCN6rQ68o4ggsRLtqkWFi72sqHpkmO5tAiEvt7xBlkmrA0CjCbbgizyBFE23wI6IxBaYwOvQvXNB3Yms2QOMhFCuzUWWTMyH42L8RHnqgkTy9IGnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.33; Tue, 8 Jul
 2025 05:08:02 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 05:08:02 +0000
Content-Type: multipart/alternative;
 boundary="------------x0nhvfcr7GmTOKXFgCd1TiGU"
Message-ID: <501fc7c0-b2f4-4428-979e-573d40c506d1@intel.com>
Date: Tue, 8 Jul 2025 10:37:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_bw: Restrict linear-tiling subtest to
 HDMI outputs and improve skip logic
To: <igt-dev@lists.freedesktop.org>
References: <20250708040425.950013-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250708040425.950013-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA1PR01CA0184.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::13) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA1PR11MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: bc78c50a-27bb-4086-6279-08ddbddd6a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEtKNmR0NEhqZjMwT1U4ZEZ6c29BcGZGK3VEU25RaFU1OU0weTFpaVUrVTZU?=
 =?utf-8?B?ME81NXdjQXkxMyt2RUdiMnJjcDJJT29EbkZHYzRKUkl5dU1mQ25ycEdReHhp?=
 =?utf-8?B?dGliQXRCZVVENyt3VVpJKzd4MmM4K2JubzRFL01LNE1Jd25Hc3VTdzZRbG1u?=
 =?utf-8?B?UXExNC9oMWYvZFZ5QkRrSWdxRFBIQjBVL1pWK1FwdnpTUVlvbGtkbTAyZDdn?=
 =?utf-8?B?VlgyWktzV1BNeGl0OVd6VXRRNU9DNWlydCs1TkZDU08xRTdIenkyd1dLSnhh?=
 =?utf-8?B?S1BUbEVQanFONVpKbEVHQ2RvQ0txZTZ5aWszeXQ0VlZBbExGYmQ1ZFZIL21r?=
 =?utf-8?B?MkIydWdiRUZHM2plTDRrK2ZTRFRHNmluTDRHc05Od1ZFa1lUZjNtdHVmcVVm?=
 =?utf-8?B?NmZhOWFaOUNWUVdERXVIM0VnbUt2NTdvcUJFekZjcjMvTE1Ob3p3WlFTRjVr?=
 =?utf-8?B?L1laMzNWdGhGSGt1RHNnU1RxcXhxNDNDbzlrYWhDRHFBbDkrZVB5Q1ZVWFBl?=
 =?utf-8?B?RlhhUElNaU1zVzFDVmJvRTluajBGSkw1czNyczZrTzFQNVdVMzB2SGVkNEQy?=
 =?utf-8?B?V1ArdjVGQXBBQ3RoVUVKcjVYUVdCaHNHRXBja0JxTE5mMmUvNVRuTmFQRmxl?=
 =?utf-8?B?cFo2VXYrQjVQc3NCTEtsaXRJamc0dHhjZXpKdUJtTTBBYS9EQ2Jmc3ZYOXNi?=
 =?utf-8?B?S0VhQWJYbW5MYmxtZnp4cEk0S3F6elNOeFZSbkVIOWN5d2FpcFlLNkNUVlRB?=
 =?utf-8?B?azliNE5lN1BLeGFNZjlDMU9seWdaOGgvb2dlNFNBUElXWnVuUFJvNEx0bjlZ?=
 =?utf-8?B?WUlCeTMwdGlMcStMR2x6TEVBUXI1NXRjZHhtdU9lQTNGWVQyaEFpTzJoODJh?=
 =?utf-8?B?RC9OV2tEWjNNY2xQS2tGQ1ZOelVxNGVYNGJXRDNyU2ppZTJxSmRBdGc1cjBB?=
 =?utf-8?B?RVJNZEg5VGVtd1FyeXdhQXpsbG53ZUpRZjNaKzVlYWwwQU8rZmRrVjcyVVNN?=
 =?utf-8?B?WkNFYWxzVWE3NHJKYXVTbVBzY3BNaC80ZG9DNEVpOWlINHppSEZ5QnNlamVI?=
 =?utf-8?B?eHhTSU9jTmRqK2tUUXFVVENFQzhZVnJZUkpKalBreFMwelFkT3lEL2N2SzRy?=
 =?utf-8?B?RXI2Zkl0YjJ5QkFKbFJOTXArblMyU09EeVlxaUQ1QzlzM1NHRW9nRy9qUHFl?=
 =?utf-8?B?YWxwQmdqNGcvUEdDTUowMlhRV1Zhb3Q3Slc0dUFqZktXb1J3WlBXb0VrbW5t?=
 =?utf-8?B?YndSbTFXbU5kWUZPN1B4Y1VhWGtUbW1jWm43dWlIQTdrZCtBVHdHdy9RM0hQ?=
 =?utf-8?B?RCt0Y2Q5cEErck8yZ2dyMk13ZWg5V0g2OHV4K2Y3VElBZmRTQjFPODY0SS9H?=
 =?utf-8?B?ZVVLV3VvaXF2TFdSbjFoM3hteEIwT3c1cFZsQWFpNXU0NDBpWDkrTi9RZm9i?=
 =?utf-8?B?OHcxZ0p0WWtEK2xrYnZEclNRSjFGYWhxN1h2ZngvTkpIejIvRVNZZE5nbGlX?=
 =?utf-8?B?OWEzMXBldWh0VkMvZ2h6RHpxUnZzY1g4YnNtY1c3UHVVYm94STMwQVVBVnhp?=
 =?utf-8?B?UjBtbGZSR3ZXZkVOSXQwdENtQWxxUHRFRXg0R0RPOEI2VGJaZ3loYXUvZHRk?=
 =?utf-8?B?S3pNVmdSRFV3SXFTaU5hbGFtZDVjVXUySlZIeUJENU84ekZFekdNVEdlaVRY?=
 =?utf-8?B?U21xYk4rS29VZTVER0hnSkRxMnJXeCtJOFErdmhrcDFnUG4vNld5a3VHb3pF?=
 =?utf-8?B?MnVYaDVuM0psai8wNWFXZmEydDVjejBiWmRUYVBFeVllcUJsK202eDdJVzJ1?=
 =?utf-8?B?K0E3Nkl2QTBidUo4a0JpQTNYL3hISzVHV1gwaENIdVl5bnptZVMxWmZnVFJw?=
 =?utf-8?B?cVBiMEdJYXhWL1hvOC9KdXhFTHl1UGJmNHc3bElJRmptTWRzQXVmbWg2bVFM?=
 =?utf-8?Q?XwBBaDQkMk8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWFxUnpkVExCNGdFZ2VvUVVuWTgzbW1KaXo2aWowSFpoc0lWSzhYeHg1R1U3?=
 =?utf-8?B?blBvUzdHNG92ZjlHamlKUjBSYktrZWdnR2tiWkRON1BKUnRBdE02eDVabFdq?=
 =?utf-8?B?SEloL3VPc2RlUkJVVUE0aDk3eEFUVjU3OWo0bE40MHMrNlZEL0ZJc3dFSlBL?=
 =?utf-8?B?RWZscU5UeFZiS254K0FnWEd3WUVHSElwY2RGWmFvVy9zcUQzUW44R3Jldi9z?=
 =?utf-8?B?ck5BVkpKTjA1aUhISzdCYnNXNGkwbStNM2hVd1NXYUNOdlkwMVcrekE2Q1VR?=
 =?utf-8?B?b1ZBeFRmSEpRZVJQTkQzSldQd3pyWXYwK0JueXFucjVSOVlxQlZ5WmRUWUdy?=
 =?utf-8?B?SG5NSHhYTFFORE96NVZ6SHoyS1E5Mjhick1XK3prK2ZpSXhxTHNuZDE4R3dK?=
 =?utf-8?B?Nlc1U3hVSXpGSVgxYnZNSXFjdGhPRWNUUHF0dFp6Ym5KWWM2OGZ2N1daM1o0?=
 =?utf-8?B?cFdwMTh3Z2JxckR0QXkvY2x4ZjJqbzVrVW1ad21YQVJFVHpzeko0RXI4d1JB?=
 =?utf-8?B?OE55TW90QVZ1OEI0ZGp0MC9aOVhDUzNvTEsxR1JHZXR4YVZudnFXYkZHZXVS?=
 =?utf-8?B?RVkrc1JZTlNaK0dXc202cUZGY3ZOVXhIUmp3UmVCRVFGU3lBaDVzTHpvWTRQ?=
 =?utf-8?B?dUJ0RjkrdnFONFNZdnIvUDFDUE5KL3pZWXRqUFRXYS90U1FObFJWNGNPdWRk?=
 =?utf-8?B?SVBsOTJPdDZMYVIrYllVZWR2MW5iLzRIbUFZaXZNVysyRE1ZRmJhdjEzWnAr?=
 =?utf-8?B?OTRRb1VFVGNYU2pmUm9peUd5Yjl3bXJQalJKWWk5cHRScFVhOWFTSE9UbWp0?=
 =?utf-8?B?ZHk0cDBqTWVWWUxVY0tEWVBTOVcyKzh0MGM0WnFzQnY5am14SExpclplMlhW?=
 =?utf-8?B?cElIVkh4YkZCajQ5YUlUYmtDMkQzNEVFVHBwVW9YK29xclhBQjF1a3FXR0ds?=
 =?utf-8?B?S1RGQmlYRmpQODIyaS84b2xZM0grVEl4Vk10Rkp5RXZ5azFnN0xNRXdOc1dQ?=
 =?utf-8?B?aFZwU2tsMTlmL2RSRGlzKzhlNFBCTU1aMXNEeWM4WE1xVjQ0YmQ4TDhyTXh2?=
 =?utf-8?B?OGJIcmN4c3AxTmx1M3gwYmYyWjRqNWhRN05iemRtTzRwbDlDeE5TMVc3ZWVQ?=
 =?utf-8?B?Y1V4WThJUXhNZEpYc3AzWFBremxVUUpERzd3UHdoNnFqQ0FIQzd4NnNyZGU2?=
 =?utf-8?B?TmQzUGN1blAva3pDdjM5anFDdk5MenBrc3BMYW5oRTJzbGs4SU9lQ01BNGcv?=
 =?utf-8?B?UVNFU25JbWxZVGR3WGdOWWVyUElBNHVKdGl4MnBuUGZoSGV0S08yK05IVk9q?=
 =?utf-8?B?R1B1cTBvNWVYQ1BGREcyYUhFRzJjOGZaVzA4UGgxNnA3SEhkbWYzN0VyY245?=
 =?utf-8?B?eGVkRVNFcFRTTm0rY2o3WER6d3docHR6QUNHRTdXTStrT0NaMENVNmp2bWh1?=
 =?utf-8?B?c0pmOStPUDhPWUgwbzR0UkJ6akM2a290cklkMjBUaTFBWXk0dkt1OE5nNHUz?=
 =?utf-8?B?VzJ3MVM5WUVISXdXMmJKVFNCaFJSTFk2cUlBQXNVV1BXaDNCM3ljdEowUVFk?=
 =?utf-8?B?Q3RlTjlrMDFEdFY4OG0waXNIMTF0ZHhOY1BPNUdsYit6WHBMb0dqbUpHYnFP?=
 =?utf-8?B?QmNUeGVtQ3c0SUtQMmtla2I3VTdyZXI0R1JXVHR2M2RKT1ZTVzhjbGc0NjRH?=
 =?utf-8?B?elVyUU1DYXV2Q1NXVkxoMm1LajNTZ0Zsa3piVUp4c084TnNmQ2FIcG95K1VJ?=
 =?utf-8?B?N1NZSWRBenloTEZ5UDEwaDc1OTZWOHRXTXFUOU1MU1VHRTk2TEd4TE1yWHdW?=
 =?utf-8?B?dnkwQzAwOG16bmViVDUxSysydkhwYTh6MnlXQnNFeXAxdE5LV1JlSUNzYkM3?=
 =?utf-8?B?OVpyYTI5VHlXL3ljM3FXVUdiTEVTUysvcFA2UURncDR6NFA3TlB5U0tWb3F1?=
 =?utf-8?B?YlVwMmtkTURrNlBqMXFLc0FjcVg0YjBvcVhkMHhKS2QvQjA0YkRMR201dURH?=
 =?utf-8?B?TEoxZS84TStsYnNLaWZmVW5rODE1aFJBQUhZQ2JBK3kzbnFrL1ZuOVJIMm5l?=
 =?utf-8?B?VlRrUnI5S1ZVdTUxVDBhRWJkRTdKU2VBQ2FFUVRFb3lSQlR4eWt1N2w1VW1r?=
 =?utf-8?B?SS9aSEVpcmtlYVZqMUlkRFpNTTJ0cFk4VTZvcFhaUjJHWURwZXFaTFBBRHN5?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc78c50a-27bb-4086-6279-08ddbddd6a21
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 05:08:02.7160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pr1peWOl6mGUlJJ7baOTciy4QZXnwczLMdPR9YbVzBcxJgpT0fHylP6e+ACueZdJKIqDe4Usu6wpSoAOFQWxLXm30wIJ57fb2/ooyS2KCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7198
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

--------------x0nhvfcr7GmTOKXFgCd1TiGU
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Pranay,

On 7/8/2025 9:34 AM, Pranay Samala wrote:
> This patch updates the linear-tiling subtest in kms_bw to only use HDMI
> connector. If the platform does not have enough HDMI outputs to match the
> number of requested pipes, the test is skipped with a clear message
> indicating the requirement and the number of HDMI outputs found.
>
> This avoids attempting to force modes on non-HDMI connectors and makes
> the test results clearer and more reliable on systems that don’t have
> enough HDMI connectivity.
>
> v2:
> - Skip the test instead of continue (Rama)
> - Remove hdmi_count (Rama)
>
> v3:
> - Only force mode if mode is not present
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_bw.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index ca05695d3..c09b80dd7 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   	int i = 0, num_pipes = 0;
>   	enum pipe p;
>   	int ret;
> +	bool mode_found = false;
>   
>   	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
>   	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
> @@ -215,7 +216,24 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   			continue;
>   		}
>   
> -		force_output_mode(data, output, mode);
> +		// Check if the mode is present in the output's mode list
> +		for (int m = 0; m < output->config.connector->count_modes; m++) {
> +			if (output->config.connector->modes[m].hdisplay == mode->hdisplay &&
> +			    output->config.connector->modes[m].vdisplay == mode->vdisplay){
> +				mode_found = true;
> +				break;
> +			}
> +		}
> +
> +		if (!mode_found) {
> +			if (!physical &&
> +			    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
> +			    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
> +				force_output_mode(data, output, mode);
> +		} else {
> +			igt_skip("Requested mode not present, can't force mode on %s\n",
> +				 igt_output_name(output));
> +		}

LGTM,Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
>   		igt_create_color_fb(display->drm_fd, mode->hdisplay,
>   				    mode->vdisplay, DRM_FORMAT_XRGB8888,
--------------x0nhvfcr7GmTOKXFgCd1TiGU
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 7/8/2025 9:34 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250708040425.950013-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">This patch updates the linear-tiling subtest in kms_bw to only use HDMI
connector. If the platform does not have enough HDMI outputs to match the
number of requested pipes, the test is skipped with a clear message
indicating the requirement and the number of HDMI outputs found.

This avoids attempting to force modes on non-HDMI connectors and makes
the test results clearer and more reliable on systems that don’t have
enough HDMI connectivity.

v2:
- Skip the test instead of continue (Rama)
- Remove hdmi_count (Rama)

v3:
- Only force mode if mode is not present

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_bw.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3..c09b80dd7 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	int i = 0, num_pipes = 0;
 	enum pipe p;
 	int ret;
+	bool mode_found = false;
 
 	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -215,7 +216,24 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 			continue;
 		}
 
-		force_output_mode(data, output, mode);
+		// Check if the mode is present in the output's mode list
+		for (int m = 0; m &lt; output-&gt;config.connector-&gt;count_modes; m++) {
+			if (output-&gt;config.connector-&gt;modes[m].hdisplay == mode-&gt;hdisplay &amp;&amp;
+			    output-&gt;config.connector-&gt;modes[m].vdisplay == mode-&gt;vdisplay){
+				mode_found = true;
+				break;
+			}
+		}
+
+		if (!mode_found) {
+			if (!physical &amp;&amp;
+			    output-&gt;config.connector-&gt;connector_type != DRM_MODE_CONNECTOR_HDMIA &amp;&amp;
+			    output-&gt;config.connector-&gt;connector_type != DRM_MODE_CONNECTOR_HDMIB)
+				force_output_mode(data, output, mode);
+		} else {
+			igt_skip(&quot;Requested mode not present, can't force mode on %s\n&quot;,
+				 igt_output_name(output));
+		}</pre>
    </blockquote>
    <pre class="content" style="box-sizing: border-box; overflow: auto; font-family: Menlo, Monaco, Consolas, &quot;Courier New&quot;, monospace; font-size: 13px; display: block; padding: 9.5px; margin: 0px 0px 10px; line-height: 14.3px; color: rgb(51, 51, 51); word-break: break-all; overflow-wrap: break-word; background-color: white; border: 0px; border-radius: 0px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">LGTM,<span class="reviewed-by" style="box-sizing: border-box;">
Reviewed-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></pre>
    <blockquote type="cite" cite="mid:20250708040425.950013-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 		igt_create_color_fb(display-&gt;drm_fd, mode-&gt;hdisplay,
 				    mode-&gt;vdisplay, DRM_FORMAT_XRGB8888,
</pre>
    </blockquote>
  </body>
</html>

--------------x0nhvfcr7GmTOKXFgCd1TiGU--
