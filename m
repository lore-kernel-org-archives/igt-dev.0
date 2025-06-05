Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B9EC5AE59
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 22:05:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D3910E332;
	Thu,  5 Jun 2025 22:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiEIj17c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7438610E162
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749161103; x=1780697103;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bU8n7ESC7KdEvjdMy9uyfjCi3UnT1UtoqnCENiKJUUM=;
 b=MiEIj17c5/Eq+JswNHI5MIIWSdq0oNQ9RDF6lu9wBvSO/Nv/xCBmtNXq
 kZdY3JmngIIPVn7WcUcBxj+0DOsTIRUxkfIxez+BHppxOOpToLbY7gmBd
 gAlrTRRCb5AI/PdJQ78HTkQFEc1gXyTPiikD2pXC4KtnSAiXjT+P43W1c
 baYt/I6E3rqjnZgzXNO9K/D0HdgWX+RFaCRM6SLOtHHxn23ZtzhtkwEPA
 JUV0O1troQOlMhozovSWM8eDkGYU8oXlV1VYHfn5Tz7Ob+PbaS8uqoGq1
 6NsCpb7NtcWEU+bsdMtHfnjqA610iZE5VH6raac8zGMjyCrhkLVAaCudA A==;
X-CSE-ConnectionGUID: q7MrSnQ9TrKS7Icq0FgBgQ==
X-CSE-MsgGUID: 23doSzpMSUaOS0KmD+AbTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="61962533"
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="61962533"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:05:01 -0700
X-CSE-ConnectionGUID: YJaQLCdeQp+nis2khobNwg==
X-CSE-MsgGUID: F385o2++S42raTqLHBbcnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,213,1744095600"; d="scan'208";a="145535797"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 15:05:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:04:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 15:04:59 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.58)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 15:04:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upZXcL0hAtEAkPpBmUhwuQXzdJHWTw/4xXwUL/3TjBIhvlNGGV4gP2NCn0ykMxFswKidlHjrNlIKx+3VsvcjRx7NQeARwojoQvjOMOJbK1/PeLmvdyV130tP7AOpv2EoUL/gIO46D/twuEuU4KBUmyIGqhQHWbUfNCw/jVbNJleTpXDuTe6N/9ktrIOLjs976vMTNqUBkez0xAp/T5+A4PSUNi+qh0en3JXUTl0jAsgMdyUbEbbzJ5OpWcWzKUmpcKPSRr7yH52qKxOStroBq49xS970CdssUX3NSLRMBJURW0CzEGznTCjLVdwrBCoavE/5BOD3URSOQ3B5/C9AVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MGfgd5auTMxAEH3AZBTwJCJtivCIU+R7qeguIyji178=;
 b=Pi+TXT1fhLVgYWLVDeP1az4GPzphc/uxZsGSNVk2Wioi/zMMJ9IfQhkPYB82/H5gC5DtNk0syhsxu/pUjC4nExFOT9x+izMxzdlq/ckARPWG3w3ZTK4KWDeDRy3YIa7vYyp25cyvVpflr40uQNtPUqdYd9+h+uvM4JZdnpC84yKNppI0cgY4AmxO6QPJs1nVsK2e9Tv+M643Ti7Ew1rylLsrD1uOABQxEhAyeM3RNsV+BJcuwCdf7RJUkBcW8QDY9S0CRE2ngnVIkdgxwWDKRnH80V5ZKuWpI7/p0XYWZK0NyPKGVhXCmPtFrNWH18TKVfu/OEGuVLussNxq3oreMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA3PR11MB7413.namprd11.prod.outlook.com (2603:10b6:806:31a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 22:04:50 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Thu, 5 Jun 2025
 22:04:50 +0000
Date: Thu, 5 Jun 2025 15:04:49 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
Message-ID: <aEIUgfWcpvFosnLP@unerlige-desk.amr.corp.intel.com>
References: <20250604181827.1502650-2-umesh.nerlige.ramappa@intel.com>
 <174915062608.53653.10517426918120168888@1538d3639d33>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174915062608.53653.10517426918120168888@1538d3639d33>
X-ClientProxiedBy: BYAPR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::38) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA3PR11MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: 59fa83b7-3195-4389-5bcd-08dda47cfe3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXhXcVQ1d2hZUWhqb3Y3bnZuZDFlNUZrNVVGOXdJNXFIOWdoOGRiNjk4dVdy?=
 =?utf-8?B?b2I5dkVNa2FJRWdwU1FvVU5HZ3kzZ2UwYlpLRjF5dXlsaUlZYmdrTTJRSXBL?=
 =?utf-8?B?eWRSUzB1ZmFJbWIvTFlwYUUxUitzbThLOW90YUNuVzJ3cGdwb2ZPSlllSDlF?=
 =?utf-8?B?SEtaYS9GaklMWE4yNldzUGN0MW0wY1o4NHlJTmNYcExuRjZ4T1FFejNTZHVr?=
 =?utf-8?B?UDRKdVdtSmJwUFI0UU50NFkrV1lHNk9pZkcwT21EU09FRVB1VU5XdjZ2KzRq?=
 =?utf-8?B?MXlleHlPaWY4QTlMS3lVMExDLzljaEphWUN2MW9KSEEwNTBNUk9xRFc4M0lL?=
 =?utf-8?B?dGtnWDI1M0Z5dzA1ZmtQYUZVd25vMFNnU0hrc3RZRGhyRDFNenJpZlhxQ3hn?=
 =?utf-8?B?WXBPSGpSR1NhT2pnQkhlQ25WOFBpWGlSTEw0NnFzUzhvUUkrR0NVcFZrRVVm?=
 =?utf-8?B?U1NqTG1lRE1NR2J0TExDRjA4VkVkR0ptVVdsZU1iMVdpYVlhbDZlSmdnVk52?=
 =?utf-8?B?WENSZVA5RHVvWTNoTUZvbHZQYnJrVVByam1RdW1NVzU0bUV6NWdad3JmNTJB?=
 =?utf-8?B?S3A0dHBpbHY3ODVSQzVNRVF3S0NZc2lGMmdITWQwNG1sWjQ4WDVvTmdzVVlh?=
 =?utf-8?B?MDFnVXdEeXZLRmVtaXZhSlNxYTBlekMwQkx2M3JEUTg4RUU5QS93VXFGdjBu?=
 =?utf-8?B?QzlmZzJVSXM0WFM4Zm5ERVBlMzhJV3ZtbUtaODk5aXcxY0E2VXVnbm9iRWJY?=
 =?utf-8?B?VEpSKzg5dlgwVU1VUEpXOEdrMTc3SS9la0FVVlh1aVNkV3ZtL3ZPakxjVVFI?=
 =?utf-8?B?MXJXbVZmaXVWZ3BMQzlLNERTR0YzMkJSTzFWWmpZZWxjNStwa3FGYmY1eHFG?=
 =?utf-8?B?ZGtzL2FBNzhMbXQ0Y0pRRzBJRTFVVThKMkI4T09rWGg2OTJ1QjBuOVMvcUEx?=
 =?utf-8?B?NWtkRm1GelpJUzA2bnB5cnZ6U0Y3SzFZZXZIWlFmeGtLT1BRS09ockdiLzJW?=
 =?utf-8?B?S3A1UERReWdXNlVvSnJWbDUwMVdYVHFtVVVtaGFvdEQ3dzdXR3VqN0hMMlU5?=
 =?utf-8?B?dmV0em1iNkZ1OVZXajZSdVoyS0NOVEZVNDNjbnZ1RWJOWC9jQ2VaZTR4djk2?=
 =?utf-8?B?TGJndk82QTlJK2RLR0lCRzg0SWZlbFFOTVkyMTMzdC82MjQ1TU5kZjI3K1Ry?=
 =?utf-8?B?dTVWTkRhMjdjWDh5VENzUGE5enNEYmdTSmRmZjZicHlXM0ptTk1yazlPRXFw?=
 =?utf-8?B?RHlSanRUY2x1Y2ErU2Y3dEZ3ZzJoc1VOa3FON3R1ODJ6eU4zeUY4bVQ2cHRS?=
 =?utf-8?B?MHhOSWNXZXNPNXVsUHBDbnlibHlVMyt5ejBEZ3VKNWJoZEdpaGNBR0NCdXF5?=
 =?utf-8?B?dVVIZXl6V0Z3TFpsNlk1L2ZneUgrYlhsb2xOWTJYeTRobnBKVHMwVnYramRI?=
 =?utf-8?B?V2FsVFZIZ3h4WWhrUE1POUhtUEdDTFUzdkU4ZnFuS3ZYdndNNjhGaXl0WVVs?=
 =?utf-8?B?VEw3S25Eb0h5Ly9LK3U2YWVjQkd0L2dwUGRGR0tPUWtzSnJuSmdQbnZ3dVNI?=
 =?utf-8?B?bFd4YWpSOWhiMzVuaXo3cUdadHhyOW5TVFZ5ekVvUlRFMFBmR1RWWFQ0elFk?=
 =?utf-8?B?ZXFuTFVDMEwxazM3QlRDYXpRYytuQ1BPOUdSaGo2eHIxeDVqTDkvSi9pMkIr?=
 =?utf-8?B?c29WanNFSTVoenhJVTgxdTRocXI2dk1KdUxJckxMcHV5VlluYTYyUXFBRFRM?=
 =?utf-8?B?b3pCaEdVZDhBQ2lWbEQ3U3dGbzU2OFBvaGlYeFJtM2F6aGE3WFdyZzN3U0tn?=
 =?utf-8?Q?aR6txWWK2JH4xPYiCFf7kbZ4Xck4svxPNl0Tg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDFhaEZ5cmFKby9QSHd6elNPN2x3cmFNT0lJMUxDeHNoUHFSUGNOY0ZCOUVy?=
 =?utf-8?B?dUJVTDZKeW4wYnhXNUtFaU15UFhVbVBteno2ZDBocTFQb2U0SEtPRXAwdy9P?=
 =?utf-8?B?S0pMZ204a0ZWdUdSUGZ4NWFRQ1JHQXNuY3dpMTI0U3hQaSt1SjltU1NxWnFZ?=
 =?utf-8?B?WlZEdW9DekE1ZmJrTURSNDIzamRjaXJMOVpxMnNMZXZTTEQxekVvQ2t4eVgy?=
 =?utf-8?B?VXc3azcrRk9ERnpFOGFyblJuL3RRVzBQSFNVc3NIaHhUa1RtRXRoc2FvQ2Q1?=
 =?utf-8?B?cmFFOU1zWVRTWWpmK0VlMU9hTit6aUYzNFlKWk5yV2FTN2FUMmlTcHpKa0c1?=
 =?utf-8?B?Tmlha3dZYUo4UlQxRzBUUWE1YnJzOThrY29SY1ZtR3ZhNS9rWExqamlxcklE?=
 =?utf-8?B?Wkd3bDZ0UmJRbitHaWpFYWZJcmhQREtJTllZTkVjeEJVRnlQMUFYU3Nudjhm?=
 =?utf-8?B?RFVFZkNvYnRGVWFxM0h1dGJHVXFyYmdxU0gyZ0tlNXR2VW8rM1lKNEsyT09C?=
 =?utf-8?B?cXREQ1BkMEF4RHNPYVlKeTNnN2ExazlPNDZxdDNmVXFGaU9RaVB3K0VsdWNP?=
 =?utf-8?B?cGlkeFdPU2podTl0N3JKMnBZL3BaaGxucjlFN3pMcytoZVlFd0tTaVNRNGRC?=
 =?utf-8?B?QlFmNndwMVFJV0d1WlJVc1paQkI0QW16a3N6UHY0NTIvd1VhenlKYmV4SDlv?=
 =?utf-8?B?eGw4QVRjRXc0a3lleTAzTmpHQjlURHBpTUJPa2UrZ013VXpkdUNQU3c4MmpX?=
 =?utf-8?B?KzlUaWU5TE94TmFIN3ZPM2E0aC95Tkd4OXBNb3hyMzl1cnpzdTViSmFhclFO?=
 =?utf-8?B?WnZ6bDdxQ0JBdVhUVEgzeHRLYmszYmxMUy94d3FoazVOWndKYk1kbDlnamVL?=
 =?utf-8?B?TVpsU3NNY2tPZWwybUtPV3EzK0JITWNBWkQ1dzFyTmZFNExnbWVVMFRjcTJ6?=
 =?utf-8?B?VTE4OGFqTzdTK21ORkFvU2s5S0tkNTJ4bUR2S0FnSnNrNTVYam1HK0RqYjMr?=
 =?utf-8?B?eGZKZFlkU0VvUWk5ZHZCTURRMS8rZVhjMTVIZWJJUlZVMFFNWWZpMENnaDV0?=
 =?utf-8?B?OXlXbzRYSDFqUDZBQU1reUFJMjd6bzYwR1N1ZWxTbVlxZi9BK2VDTnB2UWtp?=
 =?utf-8?B?ci9GVXlFc1BlcFBmbDRyWEozaEh0UDBtN2lRTzZMOHNUNXZabGxnYi91UDcy?=
 =?utf-8?B?RGtiWExKd2pqNWFlcnFWRzF0QWpUaTRCbytWK0NFQWdBY0wyZlJXM3ZhWFZQ?=
 =?utf-8?B?QWlHYTZnTGQ3WjVvVDVLVDhKc3NmY09ZMjY4MTNBV2U3OXNBeUtXL0pTV0xw?=
 =?utf-8?B?dGVsMFozdTNPT1Z4TU1WNTNGaEc3dVdnQm1EVTN4TllzZndTektOMDJaK1lB?=
 =?utf-8?B?SWdZRlJDcmdudElXdEQwTTdOeDU1STc3V1I4cFZvcjJLM0hwK2xWcU9VcXB1?=
 =?utf-8?B?YUgreU1iOGFFYldLRTlQRXloU2FEcWZCY05vREJ4TUpoT3k1dlpIckc1TWF2?=
 =?utf-8?B?VGNyUlQ2aWZ6aGxNeUxhcUo3NHh5ODl2dFVlanVTc0lhU21nOUJRK0ZIM2F3?=
 =?utf-8?B?aGtvY3cxSGV1MVkzM3JpUDJTOXlhLzR4MXhyemtWa2g4YmswWTVseGFnbm9j?=
 =?utf-8?B?SnFveDM5ZVNnbHNlTi9ncmVSSjRMdmxXN0pqUVRBSnZzZEx5NzhtYjI1cmpy?=
 =?utf-8?B?M1FaeCtYQjVtcUZOcmg1ZmQ5ek5vUVR3czA3bktTczRDOXN0d0JnU0dIcGgz?=
 =?utf-8?B?bTBubEJQcGxVM0R0eHRIOEdNcDYvWEQ5TEdOSWZwdDY5am5yVDcrYXE1RktX?=
 =?utf-8?B?bFFVeloxV21GN0lzN1ZMcG5PUmJ4TjZINWVDL3JCOVpjSTE4YkxSZEVvVHpT?=
 =?utf-8?B?U1kxejJsZENvSHl2TGtPU0VneHk4bVlsMDFlenY3L2VQeXE1TmFCUjd5WjNB?=
 =?utf-8?B?OUpwckFiVm8xSnVJTG5Nd1MySTRQWk41RHkxMmRSZlkvclhZQzl0OEpSZ2tj?=
 =?utf-8?B?RWcvVU82Z0dZMTFzYmZnN0lsV0JkWFR1Mm1laTBhK004UmFNMUZ6WDhhM3JI?=
 =?utf-8?B?MHJ4a2JWSVJBQW5sUzFmRVlZWlhlYWJwa3QvRmxCL3c0Rk1LZmhTQkowSkhv?=
 =?utf-8?B?R3k2WVlTTXVhbG5JM3ljZzZjZGN6NVQzTElHMEhWa2lUaWxEWkZqTUlWYzZl?=
 =?utf-8?Q?yGPQExwDUrbRd55gPM5klXw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fa83b7-3195-4389-5bcd-08dda47cfe3f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 22:04:50.6276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unReagiV6CTHVrSiDY5VcDazsGcG5YnjRNpc4HLaw3Fw9nQUts5AyWyTFPpLTI1fioaM4jAe3qTQfnUJMoNXSewgS+kZdFeiKl8ijxqPsGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7413
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

On Thu, Jun 05, 2025 at 07:10:26PM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  tests/intel/xe_drm_fdinfo: Fix TEST_WHILE_ACTIVE flag
>   URL:     [1]https://patchwork.freedesktop.org/series/149848/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13245/index.html
>
>        CI Bug Log - changes from XEIGT_8396_FULL -> XEIGTPW_13245_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with XEIGTPW_13245_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13245_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (4 -> 3)
>
>   Missing (1): shard-adlp
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   XEIGTPW_13245_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     • igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>
>          • shard-bmg: [3]PASS -> [4]INCOMPLETE
>     • igt@xe_vm@bind-array-enobufs:
>
>          • shard-dg2-set2: [5]PASS -> [6]FAIL

These are unrelated to changes in this patch

Umesh
>
>Known issues
>
>   Here are the changes found in XEIGTPW_13245_FULL that come from known
>   issues:
