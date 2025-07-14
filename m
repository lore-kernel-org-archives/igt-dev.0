Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5C6C83F1B
	for <igt-dev@archiver.kernel.org>; Mon, 14 Jul 2025 05:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9A610E1F6;
	Mon, 14 Jul 2025 05:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JA3m9igC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA97E10E1F6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jul 2025 05:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752469952; x=1784005952;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PVnXhT0RSB61S7b2pv1H5Z64rcjPBgwQ543pD9Gp1L4=;
 b=JA3m9igCZoiRFITAxPfyTHlsPw4InWQ+UiY6g9I3Da3SE6qGuzIAkLtf
 w3iqg6UbQS5jloaLOy5jDRAGJcmoN3YA8fMCZhphKg2A9bYS/j3TjCof0
 ROltSJ0rUVLmzbUG4yrQAeswNHj3BxgHOk2jcIHYKPTIRF5AYKgRtuUog
 fXb75JQ1XBMuQKISA/n+8t7a1Ih/CzYr0xDINOY9hE5g16AR7AOf+6rXr
 yE0niLwdDLSu7xj7YY7nMpLhOEYkeF4Px09KC0QeNFkzD67OK26lMVi65
 BCPRsei0pQ3eF1i3LpUQoG5NRI8Ee/brKggxLRvJKRgNjhxucuN+YnJ+d Q==;
X-CSE-ConnectionGUID: rfoUXwKIQySVp3FpQSsk8A==
X-CSE-MsgGUID: GQdt2yOpTDmwhQm/q+O4Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="77192248"
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="77192248"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 22:12:31 -0700
X-CSE-ConnectionGUID: XLwqSUPiRAOH5G6cy4u+/Q==
X-CSE-MsgGUID: XZDhAi1GTziYyj+A2SRWmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,310,1744095600"; d="scan'208";a="187841530"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2025 22:12:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 13 Jul 2025 22:12:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 13 Jul 2025 22:12:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.81) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 13 Jul 2025 22:12:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9DnIxRtSXiFSeyBBVJfYZM87MSTcru3I54dSC3IFGwv9mtHR/hxRq5bPxWmAYj1UHPd20GqD6bVjI2dckwF/kE9wulN62/kdAaWArGLlLr1b76IrRVPzzGfCPbRXsRArwNiHEBwYExsXDHV0ZJ9l3KciAgK5cNbgsM8l/72qM6EDymXIvpFmcpFPu+8koFNNlLlGlcxvKU2l7zB56W+ODZvOsdnm1Iav3/An+D56L7KtqPhZPE7hDzn6c8QxO9jHq5xajhhMFPQ26eYSsruRx7OcNcU7FhWfcMpDV765sg5VlEwzPaR9DACnD+5JfcYugn/Y3RmXEhl2XhqFMamTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWxXOWoaLOftEJgQUXe3KzomLRvKHCRk4jzsoXQU++0=;
 b=wozYWhXlz1ZiiGvlRIaWfU7iVNGsLRJsYbhcan5ZzeQSGevHo2APawiDOs37gBFwJR4OUn6c8fltbWT/n97oF771kxo1UpYMq6lWhs6fCjN0weOwoB54SHb4RkmUc5IaYS4riWTI2GRtoREMPV3GzQJ2uHdSsmD0XwisWOyzxagQwjV1psMMt/tGJuc3jOm8sL1J7qkKE8BdfjnXZWtDxVroxfHX5+DSi/UhJs6/bqhuld8VKDqlLXWgDfhW3ms9xAoRPoDun9CUJT2N5iNDpZCJpY8QrCdiRerpbudghIVDDEoVZdWc/AnRJROctR8iwK+oBtmP6apfTSq+tIiN6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Mon, 14 Jul
 2025 05:11:48 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%6]) with mapi id 15.20.8901.033; Mon, 14 Jul 2025
 05:11:48 +0000
Message-ID: <ebc6a1cd-9418-4a82-9239-61ba2eec025a@intel.com>
Date: Mon, 14 Jul 2025 10:41:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_wedged: Add new test csc-wedged
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250708092302.2553111-2-sk.anirban@intel.com>
 <f054aafd-37fc-42ac-a343-d29ba8a05b6a@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <f054aafd-37fc-42ac-a343-d29ba8a05b6a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::19) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd9a96f-35f5-4ce1-38cb-08ddc294ef07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dEN1blhrWUwrOG53Rmc2cWpWb2FWRnJvbUg3TUJ1ZDMvNHJCTzd1YTVHWjI4?=
 =?utf-8?B?ZkdmUGh1R01HWGh6VStJdUJDZUM2ME1PQWE3Q2RhdFQxdkU4OHl6T0ZQeHY0?=
 =?utf-8?B?a0szd1FzVUxvc2lMUWJGWGowUUFxM2VET1QybXJhQk5DVHd3dXRTcXQ1S01N?=
 =?utf-8?B?SWlnbVZDUFNjc3pWM3E1RnpBWjJqK0hLUzF6YURSdkNqeTVmU2RRVVJqOHBy?=
 =?utf-8?B?WmU0by82K3kzcUV4UWtHRHRsTWd2K2pjV2pURVgwUFAxd1o1UElZU25QVWk2?=
 =?utf-8?B?WE5HTmdIS0xBNWFIcjVBbDU5c2xVUXdYbDNvRC81aDNpYWhidlZ6RGxHN01S?=
 =?utf-8?B?d3kzS0gveVNHWkt1T3ZoK0k2UzdzVlZ0ck5PN0pKbFRTY2VYL3lYYzJNNXRI?=
 =?utf-8?B?WnVub2pkMkpBcFQ0Z0pZSWRzeDF2cllacnFIUXFKUWVTbmZGZHZMeGIrSGxl?=
 =?utf-8?B?RjQ4dXdoUEdEbCtQaGFRYUpLMThwTFNwdzZFdnRPejUzVkxsZGloZHA0Y01C?=
 =?utf-8?B?N0JTZjJHRnB1dTRwSmNRRi9ZOG5nZ1A2eFA3U1dCUDlEbWRNTk9ZeFZBaFhK?=
 =?utf-8?B?bWwyOGwwekw4dWZvZEdWcEhDeEhjK2pVQ0ZML3FIc2Q2RFhuZkphNVU1dGo3?=
 =?utf-8?B?VlZJd2FnZW9HVnJSMjIzRi9hOHJIWTlxQ0hkV0lWYnNyN0s2dXRNankrWWp3?=
 =?utf-8?B?VUFTdWxKeW4wQlFQdGg3ZXpIekxKT2FCcFJWRG9MMm1IL3BxcHdnbStET1lV?=
 =?utf-8?B?cFZhRlc4RUhBR3RHdmNJRXhuTEFoS0YyVi9oSlpyaS93cjNOcjBEZHhtNWdU?=
 =?utf-8?B?ckRXMmJRMGYyWVJwV0RSNEVPcmJMdVFtUHVHNndnVHBRTE9iU200SUtlOUxi?=
 =?utf-8?B?b29sRHMwVHRER3RvR3hob29PT3pNc2U1ck9Nd2pOTFJnVWRJcU4zdWkzNDBz?=
 =?utf-8?B?L1IyNHkyeGFsRjdRTithNWRaTGFTMWRPelBhVjNsSVdjbHkvRVpiWXdyOGh1?=
 =?utf-8?B?cVFQbGdqSVFnOGQ0cTJlQXZ0MXExMHpaUGRFZXpjRzdYNzVwUFhFRStTV0Ft?=
 =?utf-8?B?S1c2VlJtNmZtMGRTLzQ4MkRlSitFM3Q0YkV5Sno0Vk04M3Uwd0xveW5JM3Bs?=
 =?utf-8?B?QjRITW16OXZRZUdBMEp1R1JHeFlRMkwwV3FrcFJvWDIzTjRrU1k3bUdpaDhz?=
 =?utf-8?B?TlRLVnZ2WndnVzNRaUtZdE1jejVJMktOd3ZGRXNidzFBN1BVYkdGTGcrV284?=
 =?utf-8?B?eVRGa3I2NnFSaTV4UnNrZGo2cVdjbG5vUUZXb2VmQm1FQkNRR2djRDg4L2VK?=
 =?utf-8?B?bTNKTVQwWnFaWEErMHJpcDJzcmk3RmwrMHlXWjZrZ3hwL010a3p5U2diMlAw?=
 =?utf-8?B?RFpBOFBQdGc3RHZtcDJaTXYzbUt4dHZHbVdXU2NYVEcveWVwRDY3cXdtZW53?=
 =?utf-8?B?Q1N6VGJaQkFrZzlOdXVhUWVVdWVhRHM4Y2d4aC9PdEhPaUtEa1A0ZWVaOHN2?=
 =?utf-8?B?R0w4ejdzU1hKRk5nbkIxejZja0ZBTktIOUIyWFUwdVZVTnRMMm16MXo5b2dW?=
 =?utf-8?B?Z2trbmRkTk1rZmJjWlVxMlREVXdrbnBXTGdUQXVjZUdnQlg2QnB5bmpWdGtT?=
 =?utf-8?B?Tnh5Ti9vcWR2Y3J1NHNJd3BMZ0xzcUQ1aUZQQjhwallLdWVkZ1RscXc1UGxH?=
 =?utf-8?B?QlMrMDZ4V0pBMUdVb0VZQ1NkbXA3UHZZcWx0aUwvYTNORGVnMmx1QkMyVDZC?=
 =?utf-8?B?S3N5Ty9PMXVZc2RwWjRPelhDcXpOaHNQZ2MwcU92RHAxZzhIeWE2MmxuUkZV?=
 =?utf-8?B?MzVNTk9aeWJoQ2dmUklqRStTZ1RoR2QydTRsVVZYNDNMc1phcE5qRzU3dEhH?=
 =?utf-8?B?QnJ4U1ZRbnBxRkdhZWtzZWVSZS92RXp1b0MxRC9NbElvUENOcUNWN0RhdmtJ?=
 =?utf-8?Q?GySGxv+K09E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUx4cndqa0ZJVDByR1ZnTjZEbzlKSThucGVVTlBqazB6b1F3SExCc2o0SGRz?=
 =?utf-8?B?dE9mU3NzTHVENFpsU3hXbG5kc2tVbERNaUNyQW1xVDBmSTRhbnVjaEloU3dk?=
 =?utf-8?B?UlBuNnZaOFpQNE43UytmTGpVQ2p4bDdYYitxUXZjdWxSZ2V3bGgxaFNQNWVt?=
 =?utf-8?B?RUt6MEI4dVZranIxTDYxMW1RQWJMNTlRblcwTmllL2I3U2pKeksrNWV1MmNs?=
 =?utf-8?B?WENzMXdOWG9pam55cU1yUzVWK0lpTFMrQUMvWDRuYS9qSzlmNGdqV0FCZEpN?=
 =?utf-8?B?NmZoUjBNQmU0K283WTBqSXZMd0xVZU5Od2krczl4MUxNbldDRVBQd3ZtSDAr?=
 =?utf-8?B?cDUzWFBFbjIyWEJORXduMnltU1RqWmVUWHJ6M1J0bzZRMzJHL1hYTmFvVndt?=
 =?utf-8?B?OG1aZTFUM25iT1hEWTZZdGl2UjNybDB2Yk1aVDRhVjVtNDMyK1E5UWdkR2dp?=
 =?utf-8?B?ZXZmT1JaNFkzaURBck83M21MV2dMOEJ1SDVDL1o2WExDYmFYbWMzY3EvRkov?=
 =?utf-8?B?VHIvZ00rUStiQk1TUWwwc3pxb1VtNUUvRkRBM2RINnczYTRkVlNSSnZsamVS?=
 =?utf-8?B?SmVZaGhQeW9Vck55NHMrYjVEbHpoejRoTU15bXdISTRKSURqcVk5Z3FUUkxT?=
 =?utf-8?B?SHNtVFhoTVQ4UU90S0lJT2lJMWhaUHhuOW1Yb0xLck9yQ0NWYjVzd3Y0V0gz?=
 =?utf-8?B?ay9penlwcXN4ODB1TnJZVlQ1RFphTWNjVC8vajhVaTZjcjFQamo1U00rUmJ5?=
 =?utf-8?B?TDRad05GakJybXJscTNRcDhML3dydk1HdTBvdlBDaVdCeFlPWEsxbDlJV2FV?=
 =?utf-8?B?ZkJoMG55VUd4bGN4NVJCUHI3TXhhckpMNjFaN2N6TlpGWnVvaTVCNFhGMURG?=
 =?utf-8?B?S2VhOTJ5VkxobUo1OElhbFl3ZWdoTXVRZUZ1M0EyUS9QTENqWkVrS2d2TTEr?=
 =?utf-8?B?UkcwNlg2MkMzQVZ2ZE54NVp4MlUxTWlXbTdNUThZVDlldjQ1UktielRyMjJm?=
 =?utf-8?B?TW9xMXJSWVNYLzBSUVl3T1ROWlk1aHpUcFlodDdIcVcyYkRZdFpXRWpWeEp6?=
 =?utf-8?B?TmxFY05iUWNBd0JLV0NSNndNWUNUVXFwL0w5NmVoZDQrY0IzSUNxT2hUZk83?=
 =?utf-8?B?a0RZbHJQdk1hV1FBMjR2V0tKb21tY0p5Q2E1SEU0VExzbjRDWTc0R1Q2bDB5?=
 =?utf-8?B?OGgrWXdaMjNOWUczTEFSdHRHWEcyZlQ4UnVYRml5UkMrMEdMeUtEbDkrTmdC?=
 =?utf-8?B?eThmek9zRk93YmNFdDVpVnBYbnRsSmxZMDAraHVzL29ocmx1YURzTUtrUktU?=
 =?utf-8?B?eXFCN2IxazQ0ZEFMRGxmTE1HTlJBMXgwczRUdVdHM0tDSnBJWmxCRmlxaFZr?=
 =?utf-8?B?ZXhBSUwrc1ozY05kdEtvM1ljUTlVNDVBRVpoK3pna1JtKzJUbkt6SURYZ0F1?=
 =?utf-8?B?TGZ3eDRxSmdDazBFNlNIOHMwOE1tOUlXc05meTFGd1NZMHRDWW91ZG1teEVN?=
 =?utf-8?B?cjVSalpxTDg0c0M5TnJrVHZybWlmN0xVTTNERWNPRU1JOGtYOU1naUt6RUdY?=
 =?utf-8?B?MlVmWWZYK1pGWTE1Wkd6RytYb01PS09HdjVTWHYwT09qWWhYOE5DVEdrZXAy?=
 =?utf-8?B?TVkzWFY0djI4eXM4TlNkRXltYWNoNzhKdzBRYzhIM2xxaHlpencrTHcyQ3Rk?=
 =?utf-8?B?WU5wVCtOM0J4T3pxTVZha2tVY3hjTDJvNi9CblE0UVRHNnRjQnhLR1dUTGZJ?=
 =?utf-8?B?SWhVakJKL2NNcERnYVRlbkFNZXk4NmhMbFM0ckRwc0w1MkdFSE5VR0Zvd1Jl?=
 =?utf-8?B?TjRHOFNZQ25xNEZTT3NQbmZhVzllTXVLWno1cG5ldm0rU281M0s5SWhsRWU2?=
 =?utf-8?B?dHhSSTRrbDNMWnErbkZURng1bWFUdUxDL20vWXBENE8yajNGY21ScEcrN2dZ?=
 =?utf-8?B?SVloZER2UDgrMW1LakFOUFZtQmtrSEY5WnF2UFl4N1M3SjQ3WFNCZzg0djFP?=
 =?utf-8?B?VVZpd1QzYlFTSTl2SFhJN21Oc3Nib2ZhRFVybXZwVi9ZY0pjZVlabGNKL0Zr?=
 =?utf-8?B?TGU2N2FDZ2RhQW9uTjdaWnlKai9RbnQ2Z2Y2ZkpWYllJSGg5K2RwdDNzRU5Q?=
 =?utf-8?Q?K0012dV8ZDIyCCoWRjst96yi+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd9a96f-35f5-4ce1-38cb-08ddc294ef07
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 05:11:48.2257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWeD6bGXrOLzMPxhqd2Xfy4nEy0QpTv065yZ78ZTCF1V2/oYSj5SRyZ3MErjJb8lF/fHqFFxKw2OmrcCC7UAfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
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

On 10-07-2025 12:53, Riana Tauro wrote:
> Hi Anirban
>
> On 7/8/2025 2:53 PM, Sk Anirban wrote:
>> Inject a CSC error through uevent to cause the Xe device to enter a 
>> wedged
>
> Add details about survivability mode. What is the expectation of the test
>
> Add a link to kernel patches
Sure, I will add this.
>
>> state. To return the device to a normal state, reload the driver, as
>> the wedged state can only be resolved by rebinding/reprobing the driver.
>>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_wedged.c | 85 +++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
>> index 7fc7ca9eb..b29e9bcb5 100644
>> --- a/tests/intel/xe_wedged.c
>> +++ b/tests/intel/xe_wedged.c
>> @@ -14,6 +14,7 @@
>>     #include <limits.h>
>>   #include <dirent.h>
>> +#include <libudev.h>
>>     #include "igt.h"
>>   #include "igt_device.h"
>> @@ -46,6 +47,46 @@ static void force_wedged(int fd)
>>       sleep(1);
>>   }
>>   +static void force_wedged_csc_error(int fd)
>> +{
>> +    igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
>> +    igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
>> +
>> +    xe_force_gt_reset_sync(fd, 0);
>> +    sleep(1);
>> +}
>> +
>> +static char bus_addr[NAME_MAX];> +
>> +static int check_survivability_mode(int fd)
>> +{
>> +    struct pci_device *pci_dev;
>> +    char path[PATH_MAX];
>> +    int dirfd;
>> +
>> +    pci_dev = igt_device_get_pci_device(fd);
>> +    snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
>> +         pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
>> +    snprintf(path, PATH_MAX, 
>> "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
>> +    dirfd = open(path, O_RDONLY);
>> +
>> +    return dirfd;
>> +}
>> +
>> +static void intercept_udev_events(struct udev_device *device)
>> +{
>> +    const char *dev_path = udev_device_get_property_value(device, 
>> "DEVPATH");
>> +    const char *wedged = udev_device_get_property_value(device, 
>> "WEDGED");
>> +
>> +    igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
>> +             "Expected WEDGED property to be 'vendor-specific', got 
>> '%s'",
>> +             wedged);
>> +
>> +    igt_assert_f(dev_path && strstr(dev_path, bus_addr),
>> +             "Expected bus address '%s' to be part of DEVPATH '%s'",
>> +             bus_addr, dev_path);
>> +}
>> +
>>   static int simple_ioctl(int fd)
>>   {
>>       int ret;
>> @@ -208,6 +249,11 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>>    * SUBTEST: basic-wedged-read
>>    * Description: Read wedged_mode debugfs
>>    */
>> +/**
>> + * SUBTEST: csc-wedged
>> + * Description: Force Xe device wedged after injecting a failure in CSC
>> + */
>> +
>>   igt_main
>>   {
>>       struct drm_xe_engine_class_instance *hwe;
>> @@ -300,12 +346,51 @@ igt_main
>>           igt_assert_f(str[0] != '\0', "Failed to read wedged_mode 
>> from debugfs!\n");
>>       }
>>   +    igt_subtest("csc-wedged") {
>> +        struct udev *udev = udev_new();
>> +        struct udev_monitor *monitor;
>
> We can use this instead
>
> struct udev_monitor *mon = igt_watch_uevents();
Sure, I will check this.
>
>
>> +        struct udev_device *device;
>> +
>> +        igt_require(igt_debugfs_exists(fd, 
>> "inject_csc_hw_error/probability",
>> +                           O_RDWR));
>> +
>> +        igt_assert_f(check_survivability_mode(fd) < 0,
>> +                 "survivability_mode sysfs available");
>
> why?
Just to check if the node is not available before the cse wedged.
>> +
>> +        igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
>> +        igt_assert_eq(simple_ioctl(fd), 0);
> Is this required?
As discussed offline, I will remove this.
>> +        ignore_wedged_in_dmesg();
>
> Ignoring the interrupt message and runtime survivability also might be 
> needed. Can check once kernel patches are merged
Sure, I’ll align this with the Kernel patches once they are merged.
>> +
>> +        monitor = udev_monitor_new_from_netlink(udev, "kernel");
>> +        udev_monitor_enable_receiving(monitor);
>> +
>> +        force_wedged_csc_error(fd);
>> +
>> +        device = udev_monitor_receive_device(monitor);
>
>
>> +        intercept_udev_events(device);
>> +
>> +        igt_assert_f(check_survivability_mode(fd) >= 0,
>> +                 "survivability_mode sysfs not available");
>
> you can add both of this in a single function 
> (check_runtime_survivability_mode)
Sure, I will modify this.
>
> Thanks
> Riana

Thanks,
Anirban
>> +
>> +        drm_close_driver(fd);
>> +        igt_kmod_rebind("xe", pci_slot);
>> +        fd = drm_open_driver(DRIVER_XE);
>> +        igt_assert_eq(simple_ioctl(fd), 0);
>> +        xe_for_each_engine(fd, hwe)
>> +            simple_exec(fd, hwe);
>> +    }
>> +
>>       igt_fixture {
>>           if (igt_debugfs_exists(fd, "fail_gt_reset/probability", 
>> O_RDWR)) {
>>               igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>>               igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>>           }
>>   +        if (igt_debugfs_exists(fd, 
>> "inject_csc_hw_error/probability", O_RDWR)) {
>> +            igt_debugfs_write(fd, "inject_csc_hw_error/probability", 
>> "0");
>> +            igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
>> +        }
>> +
>>           /* Tests might have failed, force a rebind before exiting */
>>           drm_close_driver(fd);
>>           igt_kmod_rebind("xe", pci_slot);
>

