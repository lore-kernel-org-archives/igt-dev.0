Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57092C52D71
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 09:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F71B10E888;
	Fri,  9 Aug 2024 09:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5qsgdoM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A00510E888
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Aug 2024 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723194281; x=1754730281;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=2nzEY6xRQ1mXktTp9rWj7VvzBT80NGbDvGtDJCtrwcY=;
 b=l5qsgdoMxekOzcDd4z5csuD+xVcH/EBW2TtG/DSTHlCFDv4RLysYtOis
 RVghrARSgDtULftTybBktJ1D8KTeyf+4TZA8gT49donHmwKkjgM9qXt6V
 CcrFDmD57YSA7oqW80AG6JyydZYr7nm8Xr+oMDXGvWpdrTFZLpXMj3pux
 lCgNjqpZc+Ur+c+neDe5QIAlQyrx+auC/g8g4xkg6EHhp+iyhSlQr73/J
 UjV4v+QmHXLTCdPrQWA98Z3i62qwBOm85SIiubph7qlrp6jN1dA9fGl/m
 xRaUGZ4+CeEXG0Jj3IBN4u8yILdyOF/DUpOKNqGpIXg+CZlfS6do9FvSq A==;
X-CSE-ConnectionGUID: r0FrYQiUSnq1xQQXfbBMTQ==
X-CSE-MsgGUID: s8UXqOujTKuhiold6nQJLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32037563"
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208,217";a="32037563"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 02:04:40 -0700
X-CSE-ConnectionGUID: XYp7G9ioRCygtMkfEcHzSg==
X-CSE-MsgGUID: LAcfBFrtTBSYwtMYh4MGSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,275,1716274800"; d="scan'208,217";a="58071095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 02:04:41 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 02:04:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 02:04:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 02:04:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 02:04:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BlRhwneS/fRNUnH3yx7xyX+OZtG90r23g/xv46GSup1rcGbaPCDvRESqQlZ6+IqUIv9wMOI4V+PY4rPMIPHvhAGPx4CoN3FdSWNJiaZLCEMy6MQGMfgs+nGQN26CvRUKPlL/HBNDBhG5/ORJfdUEA0jf+YKTXaUMzAE4h0uW1o1I6L49rld6UvdO/scuEUxb6j9nn4qiM2daHl0zqGyKYn9jfeqyJ0yykb/GWGdST3eo/JC+CP3MQ71XsswmyXfMENclygEeayuH/mNUoexv7qzoeVQQEgbemaMjPT77y9tt3huv6Na6tsjFAywExCqx9wD4RSaZU8NkU2XSsUj8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/ysZo0oudreHMJPxMCKa81GOzDhUJrejk7MkvOnmEg=;
 b=wPN+XGM1fYiaujkJlcDa6crsjvrMGj9LGT5iaNLMD1hvhVxTZAoEtShYShs/0MkE4sc+GsMUe1iwScDFFURPJvC1VhayV8OVahya/E0jgLNvmoj/9uGOTKTaAaX8OSuRV3IgB6zxaTUa+Erz2/kRmiZheE/llTiiUksWRCbyqpHkhTTsHZv9p9lyj7R8GyI0bdeYQtvSJwAPd04qT0Sa6z3tqbmbnosZfZqTR3nlgFudn14FnI/2ne+zc694zDZAaWs8zwX6xvPA+pzzNVsc7t5VNpYfYuwfMcUAJLlChqBfYLhGYEerxnHuAptRc8rK6scfuVF/wjznCyqPmqLTJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SN7PR11MB6873.namprd11.prod.outlook.com (2603:10b6:806:2a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Fri, 9 Aug
 2024 09:04:32 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2962:1efd:f912:a5a3%5]) with mapi id 15.20.7828.023; Fri, 9 Aug 2024
 09:04:31 +0000
Content-Type: multipart/alternative;
 boundary="------------cT5C2uioOaEuDPEu7XUa5Qb3"
Message-ID: <5cc321f5-a3e7-491c-b45b-e821caf424a2@intel.com>
Date: Fri, 9 Aug 2024 14:34:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without
 display
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
References: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
 <20240801114553.gmb4lpfb4i2xnico@kamilkon-DESK.igk.intel.com>
 <8fba7a7c-47f0-436c-b839-635a5edec4f9@intel.com>
 <20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::9) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SN7PR11MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: caf90485-4382-4cf6-4230-08dcb85247e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzNiZzFhOFEzenBCdUFyQnI3ck0xM1VRaDVkdHpJVzNuTC9qZ1d6bVZoT0Na?=
 =?utf-8?B?MHJnY2ExTm1hTVlLVmdWVGFXTnBwa3Y3clMvQitzNjdGVEg4enRjOFBUdFlW?=
 =?utf-8?B?Ulp3Rkp0OHlhRm44VFQxU01LWnpVeXhYL1V4d0htTCt0V0VXSFU5YmVNeitl?=
 =?utf-8?B?dHZIdm11SVlHVHNYbUxrSjl0SGMvekUwZzFlS1pNL3RRdFhiNVJ5aUo4L285?=
 =?utf-8?B?ekh3aTRtakF6S2srbWtPcEdCQm1TZHB4Z0NPeTBtdGx5bS9hTGhQeTA4Tjl4?=
 =?utf-8?B?UVMwWWZ2dUFlMjJ2VmRoUmVrUGt2UGtYbThmL1BxRmFacjVQeXVnc0hzNm5M?=
 =?utf-8?B?cVM4WS81VHdINFVsaGVFMFRHKzhTbk1HckFib0F6UlZUczRveGVrSDdaUnVZ?=
 =?utf-8?B?T1dQZEpkS1BVbkhyNHpQU1JROG10b3lCTEtzNkN3RFlHa1M3TGxXbzQxTyty?=
 =?utf-8?B?bUVmVExNeGF1UXh5dERld0FxZ0F0WkxEQ0VGZVdRM1BvbS9pby8xa0dpTVRq?=
 =?utf-8?B?dWpzRlB4eExKRWs5ek9JRFRESTRZWUFEMzVUQWNybHEvTHY5Zks3a3RpRzJz?=
 =?utf-8?B?NW9LaFByOEY4cGFJZDNMNGpZblNQSjA3MGFsU05xdE95ZFNZUFJFaXcyWTFO?=
 =?utf-8?B?V0tlTlZEWFZadEtxZXZzRVlkdTRBSHV0N3FwWStWb0p2SmMzb2U3VW8yc3dW?=
 =?utf-8?B?b2ZWbEt3bDBhSExDZWlWWXR4RTgrRzgrLzQ4OFNKa1FRNnlJYjZmb2lraDBO?=
 =?utf-8?B?WkVRMkRadk5OMVEyZmdxTTF4NzZHQ1NBajJ5NDFDT1hCbmg5eDcvU1lFWWJX?=
 =?utf-8?B?ZGdmV2JTcERseEJYTHI2bWpnU1l6NVc5a25Wek9maVVHVHNZMytiSXhFU20w?=
 =?utf-8?B?T1hEQ3JyYlY2KzdjUXVzd1NOeGNndkNTTW5CdXZwYUN6Z3BZZkZnNm52a016?=
 =?utf-8?B?Ti9kdHJkVE0zTk4yOEdlNmV1SGpuN05ESytsZUZVc3dlWWVKcUp2RCs5a2JB?=
 =?utf-8?B?bmFsQmZGRlNYT0tKSEFmcVFHL3lHWlpnbk9JYURXVG5FbnJXTk4vSkFKcUtn?=
 =?utf-8?B?aWN1bG5zVWUwRVVXc0g1U3hBSDB2SEM2VnFsMW8yK0t1elU4dHNlUWhnUzkv?=
 =?utf-8?B?ZG8zclFXYlp3NUlFaTFsQmpWaVFqcTIyMDc3WWtZUkhXYldPc21DZngzdTgr?=
 =?utf-8?B?Slg2WkhFcUJvL080Q0N4QlRySHpsMFJUMmxETFFyS2dsSFptcjNJSWdPSWd5?=
 =?utf-8?B?bHQ4ajJQOVNDMEJIb1pOY21sWGQrRDZXajhzZG0ycUdQZFJ2WGw1UE96WTBM?=
 =?utf-8?B?TGRmck9OMHUzR0kzZzA1RzVyMGErNUk5YWJ2Q2xjWldabHlSRCtuRytpZ1U2?=
 =?utf-8?B?WXRQV3V4MTlwMWVrUGpyK2dpbmtaaDRNQnkrZHJ3NnVrOW1OVE9Jdk9FNTcr?=
 =?utf-8?B?Y2M3YkdPTm00Z2Q1N2JzWjNVYlZGY1E1NGhkblNTTmN2cjVpVURvK3lsSVdk?=
 =?utf-8?B?d3ZXL1Q5ZVIwUUJ2N1M5RFc3QWlORDRKWFdKTlZOYnNHMTBxU3B0dWJBREZD?=
 =?utf-8?B?clVwWExYOUIwaVdSVWJlVXo0UC9OdFU5Z3ZpblpFRENVb200aUJCVHhjYjlF?=
 =?utf-8?B?dGVnRndETU43VWU1bkxQL2VXVXJzRktMeldla3V2V3dmNDJMcnQ0b1R4VTdn?=
 =?utf-8?B?ekhuNno0K0FlY1U2MU5ZZzA4VlFkZ1NlSE8zbjRmVVhNQTN5RWRqUHhlMkR1?=
 =?utf-8?B?aksrck55UjJHSWlzdXlseElVczN3T0pha2hPQkk5bm1sa0VjZjFJWXM5SXh1?=
 =?utf-8?B?amo0dEJEZWFva0NMYkE1UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWwvQ1hnem5yQlUrTnVwbUwvaVM1WG43b01vSStCUHNHZXBQNStWUm03K3Q4?=
 =?utf-8?B?TzBuWGZUMTUwY2JaekNXTk9jZVRUcWZvdXVxOUsvalBZeXVUQkZkM3NJUlpx?=
 =?utf-8?B?VFJrMXlxYktUQjlVYlpYWkNaZVh3Zm14Q3YzWWQ5YmtnY0xEdnhrdVVFRFZo?=
 =?utf-8?B?d210K2FvTUY4ZGprUTRPSFgwYlBLbTAvYldRV2tTcm5udHdBMzMrYkdnaVlN?=
 =?utf-8?B?K1RNZmN1NlV1a3NYMWxzZ0FBajZ1UkFDRk5WRW85OGovOFZ3d21GRFZ2SlVP?=
 =?utf-8?B?NEFnaTVhYzJXYndodnNDMXhqZTF5enhBbFZIOWs2WndSeC83bU1TalBlTGZY?=
 =?utf-8?B?OTFuYkNxQnlLd0JubUJKRnRRS0Znb3JxS1ZqWUNpaGQ2TmYrTlJ6VkRSWTRK?=
 =?utf-8?B?ZGFIY0dZci82T3BGbWhNWGE3OTd1WERvVzVWUHBmY1poUWlpVjRuTW9HTGU2?=
 =?utf-8?B?NGVaVXJSejNjQW5XY0RJRjdPTFppM2RUTkFhekdPVE42TmVGRTdDb2tvVi9t?=
 =?utf-8?B?aFoveTFuQUpMd1Z2NkNRTzhTU2VmZVZ6cnAvcllEbmlLNE1HckJ2ajBScTdD?=
 =?utf-8?B?R2krbE10MWJvRWJvSkMxb0ltL1VLZUJLUnRMS3JGdHZUdGw1QVY0Q2t3QUFD?=
 =?utf-8?B?cm5YZ2xqdDR4cDhFMU1ISDZGQ1ZySjRjeG9NQU5jc1Facm1veUFUdmRjejN1?=
 =?utf-8?B?RFRrZXR3SzYxQm9VaUNrMEpsUTdyVDZRUFpPbUFHMUx0Z3BMbGZiQVlnL200?=
 =?utf-8?B?MmlTLzJmRWFUZGZsZjVkcm1FUUtoVEpKV2FBcnlRQ29Hd09tcDNQTlBQbFBI?=
 =?utf-8?B?emNUaEVYVVBoc1lSRi9MTlZGVm9CcXpPL2Q4RWpxYkRhUGFWS3p1dm5QZmh3?=
 =?utf-8?B?MzlQYmJ5N2xiRlJTajcycklRMG5jMVdxUmxwVXllNFNzTUJDZlhLVkxoTkdG?=
 =?utf-8?B?bGxYZ015TFN0MzBDYXIzOU5yaFVZOGVDYkFSVHJyeW53WENkQWR1R1NqNDh0?=
 =?utf-8?B?Njl4YldQZzVNSzlIMHduN09iZnNTN0VyVUlncU5CN0RkMnNhNlRqSFB5dkF1?=
 =?utf-8?B?eEI1bkFrU1pzZFkwSWw4aUZOU1hLL0JnT3pvWUJlTS9UUFk2SWdLV1ZkRFFS?=
 =?utf-8?B?RTNqemZCSTcvcUxLTFJvcmlDTVZJQ2lqSXVUK25XOW42Z21INTJRRnhmR3FM?=
 =?utf-8?B?emVmYkw0U0ZSRm5KUE56UWpFMmVueDFtTGU1M3VCb3ExUDkwb3I0SEZZTUpZ?=
 =?utf-8?B?a0loZDhMT1ZxL2JodzcySWpFNGhvZUdtekdLTUFGWTdtWlNSeFUvR21zRmRw?=
 =?utf-8?B?dHgxSDVjbEl2TjZoczg4TURpNmVIUjkxcVJxSm1KcHJGRVRGb3lMSnVWcEpZ?=
 =?utf-8?B?dUNpZ0pzWVlscDBYTXlrckRaN3RGSmNaNGxXZ0grN3g0aVR0d3ZzcWc2RXd2?=
 =?utf-8?B?TmdDY05TNkUxeGpsYUVSOGJaNzg4RWdEcGZkMU82NHpiRzl0SWcrSTMydXkw?=
 =?utf-8?B?c2M4SFI2empEbkVBVmIrWTk5STc2WHVvdHBUaVZ3SUNjV2toQmRBTzVVZWI3?=
 =?utf-8?B?YU1ucHZMUXlBekoyUERHTmtuZDIycU1KYUhydXVHRnFsMUM4R3NXbUljWjYr?=
 =?utf-8?B?TXBzdVo2bkhPTkp0RTEzTFNyWnR6SEQyOUZhN0RlV3RiUmlVL1ZMTGtWSE9J?=
 =?utf-8?B?Q29Kd0dNc0xvSTZNRUd4UDBQUGRpODFoUHlDck9jZC9EbmRKb0tPM1FYeFhQ?=
 =?utf-8?B?YmtVclh5Qnc5QUQwMUpkUDl0OVk2a016aUVBQkZrQ3hzeEF1TEdLbGE2QlVm?=
 =?utf-8?B?SGxWMU5VeW4vYi9aV2lGS2hhaUdJTmlpWndoTEpQemUxRkx5T1MyUGlFNU8v?=
 =?utf-8?B?aWVzL05tamFsNVpjNGgxb0VCV0Nlcm5FUERVR21KclFadUovcnpWZGpEN3d3?=
 =?utf-8?B?RzFmd2kxK1kxU2g4U1ZBbHk1OEdlK0lUSHNKRjUyTEdGczBsY3pXRUZaR0J5?=
 =?utf-8?B?YXlhOWc5SDVmWkx1bnNRS2hQalJVc3ljd3JjaXZYazRNSWwrRkZRVjV2M29K?=
 =?utf-8?B?WVNmcWVuK2tRNWlvYlFlNXh6SGlyMHNkVHl4MFJSQ1UrL1BaOTM3aG5OenFP?=
 =?utf-8?B?WGVMcFZDN1VVQU03ZHRGeTVNMm1WQmkxUVRlSU1ZUWFlTDFLbGVSNHM3eEpw?=
 =?utf-8?B?L1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: caf90485-4382-4cf6-4230-08dcb85247e1
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2024 09:04:31.8838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: elUxNi+yBwwizBVNIaSPlIGNHzsfUOX0WOeMoqpAqajaCfKBSNssDoObqQnkbLUfai7ytrNQ/talrlz55z/a5Ioctq3fND4+W+KbFC0sfSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6873
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

--------------cT5C2uioOaEuDPEu7XUa5Qb3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/6/2024 6:20 PM, Kamil Konieczny wrote:
> Hi Sundaresan,,
> On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:
>> On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
>>> Hi Sujaritha,
>>> On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:
>>>
>>> small nit about subject, you wrote:
>>>
>>> [PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display
>>>
>>> imho this should be:
>>>
>>> [PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display
>>>
>>> More nits below.
>> Hey Kamil,
>>
>> Sure this change I can make.
>>
>>>> Add tests to validate basic execution suspend/resume cycle
>>>> without display module to rule out display related issues
>>>> from the suspend/resume stack.
>>>>
>>>> v2: Add normal reload cycle after running test (Anshuman)
>>>>
>>>> v3: Rebase
>>>>
>>>> Signed-off-by: Sujaritha Sundaresan<sujaritha.sundaresan@intel.com>
>>>> Reviewed-by: Anshuman Gupta<anshuman.gupta@intel.com>
>>>> ---
>>>>    tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>>    1 file changed, 34 insertions(+)
>>>>
>>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>>> index 8b115e2f6..03f742265 100644
>>>> --- a/tests/intel/xe_pm.c
>>>> +++ b/tests/intel/xe_pm.c
>>>> @@ -17,6 +17,7 @@
>>>>    #include "igt.h"
>>>>    #include "lib/igt_device.h"
>>>> +#include "lib/igt_kmod.h"
>>>>    #include "lib/igt_pm.h"
>>>>    #include "lib/igt_sysfs.h"
>>>>    #include "lib/igt_syncobj.h"
>>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>>     * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>>>     * Functionality: pm - %arg[1]
>>>>     *
>>>> + * SUBTEST: %s-without-display
>>>> + * Description: suspend/autoresume on %arg[1] state without display
>>>> + * Functionality: pm - %arg[1]
>>> I see you copy-pasted it but imho both Description and
>>> Functionality documentation fields should be static, here and
>>> in other places.
>>> +cc Katarzyna Piecielska<katarzyna.piecielska@intel.com>

Hi Kamil,

Sorry I didn't get this change. This is inline with the rest of the file 
right ?

>>>
>>>> + *
>>>>     * arg[1]:
>>>>     *
>>>>     * @s2idle:	s2idle
>>>> @@ -681,6 +686,7 @@ igt_main
>>>>    	struct drm_xe_engine_class_instance *hwe;
>>>>    	device_t device;
>>>>    	uint32_t d3cold_allowed;
>>>> +	const char *opts;
>>>>    	int sysfs_fd;
>>>>    	const struct s_state {
>>>> @@ -757,6 +763,34 @@ igt_main
>>>>    					  NO_RPM, 0);
>>>>    		}
>>>> +		igt_subtest_f("%s-without-display", s->name) {
>>>> +
>>>> +			if (!drmModeGetResources(device.fd_xe))
>>>> +				return;
>>> Why 'return' here?! Imho this should be checked in fixture
>>> or be a skip. Or other way around - what about a headless board
>>> or one without any connected display?
>>>
>>> Regards,
>>> Kamil
>> I think this patch idea sort stemmed from the cases where we have a display
>> connected and
>>
>> want to make sure that the suspend/resume issues are not being caused by the
>> display.
>>
>> But would you suggest expanding the test to have the headless/no display
>> situations? If so what changes are you suggesting for that ?
>>
>> Thanks,
>>
>> Suja
>>
> I would suggest turn this into a igt_skip_on_f(), not a return.
>
> Regards,
> Kamil

Sure I will switch this to

igt_skip_on(!drmModeGetResources(device.fd_xe))

Thanks,

Suja

>>>> +
>>>> +			xe_for_each_engine(device.fd_xe, hwe) {
>>>> +
>>>> +				igt_debug("Reload w/o display\n");
>>>> +
>>>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>> +				igt_assert_eq(igt_xe_driver_unload(), 0);
>>>> +
>>>> +				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
>>>> +				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>>> +
>>>> +				test_exec(device, hwe, 1, 2, s->state,
>>>> +					  NO_RPM, 0);
>>>> +
>>>> +				igt_debug("Reload as normal\n");
>>>> +
>>>> +				igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>>> +				igt_assert_eq(igt_xe_driver_unload(), 0);
>>>> +
>>>> +				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
>>>> +				igt_assert_eq(igt_xe_driver_load(opts), 0);
>>>> +			}
>>>> +		}
>>>> +
>>>>    		for (const struct vm_op *op = vm_op; op->name; op++) {
>>>>    			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
>>>>    				xe_for_each_engine(device.fd_xe, hwe)
>>>> -- 
>>>> 2.34.1
>>>>
--------------cT5C2uioOaEuDPEu7XUa5Qb3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/6/2024 6:20 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Sundaresan,,
On 2024-08-06 at 11:50:46 +0530, Sundaresan, Sujaritha wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
On 8/1/2024 5:15 PM, Kamil Konieczny wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">Hi Sujaritha,
On 2024-07-30 at 17:05:08 +0530, Sujaritha Sundaresan wrote:

small nit about subject, you wrote:

[PATCH i-g-t, v3] tests/intel: Add tests to run suspend without display

imho this should be:

[PATCH i-g-t, v3] tests/intel/xe_pm: Add tests for suspend without display

More nits below.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Hey Kamil,

Sure this change I can make.

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Add tests to validate basic execution suspend/resume cycle
without display module to rule out display related issues
from the suspend/resume stack.

v2: Add normal reload cycle after running test (Anshuman)

v3: Rebase

Signed-off-by: Sujaritha Sundaresan <a class="moz-txt-link-rfc2396E" href="mailto:sujaritha.sundaresan@intel.com">&lt;sujaritha.sundaresan@intel.com&gt;</a>
Reviewed-by: Anshuman Gupta <a class="moz-txt-link-rfc2396E" href="mailto:anshuman.gupta@intel.com">&lt;anshuman.gupta@intel.com&gt;</a>
---
  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
  1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 8b115e2f6..03f742265 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -17,6 +17,7 @@
  #include &quot;igt.h&quot;
  #include &quot;lib/igt_device.h&quot;
+#include &quot;lib/igt_kmod.h&quot;
  #include &quot;lib/igt_pm.h&quot;
  #include &quot;lib/igt_sysfs.h&quot;
  #include &quot;lib/igt_syncobj.h&quot;
@@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
   * Description: suspend/autoresume on %arg[1] state and exec after RPM
   * Functionality: pm - %arg[1]
   *
+ * SUBTEST: %s-without-display
+ * Description: suspend/autoresume on %arg[1] state without display
+ * Functionality: pm - %arg[1]
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I see you copy-pasted it but imho both Description and
Functionality documentation fields should be static, here and
in other places.
+cc Katarzyna Piecielska <a class="moz-txt-link-rfc2396E" href="mailto:katarzyna.piecielska@intel.com">&lt;katarzyna.piecielska@intel.com&gt;</a></pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>Hi Kamil,</p>
    <p>Sorry I didn't get this change. This is inline with the rest of
      the file right ?</p>
    <blockquote type="cite" cite="mid:20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+ *
   * arg[1]:
   *
   * @s2idle:	s2idle
@@ -681,6 +686,7 @@ igt_main
  	struct drm_xe_engine_class_instance *hwe;
  	device_t device;
  	uint32_t d3cold_allowed;
+	const char *opts;
  	int sysfs_fd;
  	const struct s_state {
@@ -757,6 +763,34 @@ igt_main
  					  NO_RPM, 0);
  		}
+		igt_subtest_f(&quot;%s-without-display&quot;, s-&gt;name) {
+
+			if (!drmModeGetResources(device.fd_xe))
+				return;
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">Why 'return' here?! Imho this should be checked in fixture
or be a skip. Or other way around - what about a headless board
or one without any connected display?

Regards,
Kamil
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
I think this patch idea sort stemmed from the cases where we have a display
connected and

want to make sure that the suspend/resume issues are not being caused by the
display.

But would you suggest expanding the test to have the headless/no display
situations? If so what changes are you suggesting for that ?

Thanks,

Suja

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I would suggest turn this into a igt_skip_on_f(), not a return.

Regards,
Kamil
</pre>
    </blockquote>
    <p>Sure I will switch this to <br>
    </p>
    <p>igt_skip_on(<span style="white-space: pre-wrap">!drmModeGetResources(device.fd_xe))</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Thanks,</span></p>
    <p><span style="white-space: pre-wrap">Suja
</span></p>
    <blockquote type="cite" cite="mid:20240806125020.jygbaulfsnpv6rqd@kamilkon-DESK.igk.intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">
</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">+
+			xe_for_each_engine(device.fd_xe, hwe) {
+
+				igt_debug(&quot;Reload w/o display\n&quot;);
+
+				igt_kmsg(KMSG_INFO &quot;Unloading Xe\n&quot;);
+				igt_assert_eq(igt_xe_driver_unload(), 0);
+
+				igt_kmsg(KMSG_INFO &quot;Re-loading Xe without display\n&quot;);
+				igt_assert_eq(igt_xe_driver_load(&quot;enable_display=0&quot;), 0);
+
+				test_exec(device, hwe, 1, 2, s-&gt;state,
+					  NO_RPM, 0);
+
+				igt_debug(&quot;Reload as normal\n&quot;);
+
+				igt_kmsg(KMSG_INFO &quot;Unloading Xe\n&quot;);
+				igt_assert_eq(igt_xe_driver_unload(), 0);
+
+				igt_kmsg(KMSG_INFO &quot;Re-loading Xe\n&quot;);
+				igt_assert_eq(igt_xe_driver_load(opts), 0);
+			}
+		}
+
  		for (const struct vm_op *op = vm_op; op-&gt;name; op++) {
  			igt_subtest_f(&quot;%s-vm-bind-%s&quot;, s-&gt;name, op-&gt;name) {
  				xe_for_each_engine(device.fd_xe, hwe)
-- 
2.34.1

</pre>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------cT5C2uioOaEuDPEu7XUa5Qb3--
