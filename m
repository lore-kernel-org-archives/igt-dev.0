Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD38C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 17:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A25C10E4A2;
	Mon, 24 Mar 2025 17:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K1YrxrnD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E3B10E4A2
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742837236; x=1774373236;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uTt7JVUOb2+b8n9Jq7uk+V7kepVFQA6300eIfa9CDoQ=;
 b=K1YrxrnDGFNl3Nn20SYQP3cdfu4SM5yI6ImVbixbwdIfqRCUVBJIKy2I
 zVGVcu0en/c3EuZhc6v/oKoPuY2r7Mw0Iim71UQzHv47uREWGGqxqPrvO
 gx3wQuaOMN/SACgpn6MufDyz7fXhH+kb3rwYZRSM+H4GYG3NOzEGxiWG/
 jiozLupTWaVNOUq5xBAti/qfxGb84yFWv06WxGi6Xq2LfJA2eItn82aTs
 3IqkiJD1muaMt/V5P8cYv6b7ZsT48L9iljraxR4YGKzgmkMfeUWHYSAkH
 bSi5nYpcWcWfXyohbRi6KOxN1VoTVjJr5soekQ65hDbLP5aCmX5CSx3bI w==;
X-CSE-ConnectionGUID: HfCVn4/VTiuY4+KzvDD4VA==
X-CSE-MsgGUID: t5nVJsxWTb+Ob1Qpn0YxAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44074457"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="44074457"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 10:27:15 -0700
X-CSE-ConnectionGUID: OaMPi81zRPWF1lHaMt+QgQ==
X-CSE-MsgGUID: B7JLzSZKTR+12Ra8Qm1AJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="147310489"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 10:27:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 10:27:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 10:27:14 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 10:27:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9dksJRvcbHwMEqpzaoWRyb0fB85JmjVpz21qVwGU+LEPMs7j82rQDjqQfg9Eihd0ryP9zWdqJlCMEoVc2Ho+iUn+AVBYO7mG0htwXrgiWrMI/GOyN3nra1YQnaFPFHhbM0lbF3nE1Fm4ZS75OP9u44HaSXT8c/nSmdN017U7jOgd28uXFi1lUGnzNpLS8M0S596m/fR7sugpyurQY5YX4u9Kbm6cfpO+CZTApAcZ0oWPCwLfcUrytCnU8ylJAGc3Yi8tRZ2uvn7GrilsssmgMpsOvejRJ4RAWD6Of0nfH9ldpyuwomIQ+AlmA31el/LiBsrqigD7IREZo6ZDvVG0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Hw/hjEkuEUq3IZxZpliepmG1LRehHxqQN67E3qLqec=;
 b=a6hJcsMBmFRpArfdNtVu15UcP1UERgvnz7i8ZBJHhuMKZvlMpvFncSGEkemZNbCGujHVvAoDugC2+OJOGVYx0DS8AfAOFCY6vm1Gs79M+OYxlkmxn4mYhT/NbAtVpCW0eARf2zIjN+lVZCLGlhFjtDiwCmRtWZH9eIyDBp3lbJKZ/WcL6XAkBvUO/aVYyyBQq/zujZZ+JcTRS8cVIGh693UF+c2m/YPT2m9/kh2AeHZcC5UgNZj09Wmu2JtetB9/e+yOfKOJwRFpqTNuDmUAFtCMRl2HgZ4YwEpmLSgDI+TPLzOUqrvsBbUtHCCChx4TviL08uvsxG+nQYNjY69T4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 17:27:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 17:27:12 +0000
Date: Mon, 24 Mar 2025 10:27:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH i-g-t v3 3/3] tests/intel/xe_pmu: Add a test to validate
 engine activity on a function
Message-ID: <Z+GV7RgTM1WProWR@soc-5CG1426VCC.clients.intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-4-riana.tauro@intel.com>
 <Z93RKX27VZA4sYR8@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z93RKX27VZA4sYR8@soc-5CG1426VCC.clients.intel.com>
X-ClientProxiedBy: MW4PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:303:b8::34) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: b3ff9ddc-3382-4919-f01a-08dd6af91cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWNYMnZvRU0xK1dtZ2NJQlpJY0V4TzB5ck5KUm13eERSTThqTU1vTWNLNURB?=
 =?utf-8?B?aWMvOVA2eEpJR1JJMXZpUU02SDlXd2tldFIyWVVVQXRMQUdYcVRZWDRUbXNI?=
 =?utf-8?B?OVhYMWR3Wkp2dWRIY2Z5SDMxN1Vld3pWSEc4V0o2ZzJNQzZzTzI2YnRPK2c3?=
 =?utf-8?B?ZitDMkZVOElpQ0pnV1Nic2xZcVRjY05HUFRjVU51eXR2czVBWUFPaWtEYTNZ?=
 =?utf-8?B?Y0hiVGJqV2RGbk5wbGlsZ2ZBYlBMRTRPTnoxb0FvS0xJMXJyak5EOUlUaVpP?=
 =?utf-8?B?Wkl1cTFFL2RhaUFJUnRXUWk0SlpOYWNIb1RuRk1NcXY1dVFXZlhKdzhHcUpo?=
 =?utf-8?B?Y2xDYjFFUnh5NFpEZG1JMENzVkpOOUsxUkpkVEhHMERENHVXTHFKTDVHRlhr?=
 =?utf-8?B?Sjh2ZG1HeG5GcE5LRC9VdktEQzY0a3BhTXVOQ0lGWHh2TnFSTDlhTHd6ODNk?=
 =?utf-8?B?NFcrSk5ZVXVlRTR4aE1rbytSNmxDNWFnV1BoS0crZ1I1K1N2UHJzNkxKWDMz?=
 =?utf-8?B?S1BOalRWNkpTQm9uZ2lIQitaSW1zaGtJT2xKakZSNFVCZSs3YkRnRFQ2UnVz?=
 =?utf-8?B?TVZGcWdWSEFnY0pYTW9XUzAxVlgzNEREWEdDSGpBOWl4RWdBcDFLTlJRbklT?=
 =?utf-8?B?NWZvM0dySWtKSWRiem5MK2cvZXFvakxTd1Jtd29hc1pnd2IrMXpIU250eUNL?=
 =?utf-8?B?NEpMajh6SDFwL0lzU1Z6MFFGeTJRNkE2SDZ2cFM3RStKV2hoS0E5dUJHUThx?=
 =?utf-8?B?SUZNYU1xTFU4NTVyd1JvUktzdWdIT1dPQW4rRFJxT20weFoyRXpuOGpGSEFW?=
 =?utf-8?B?eDNPY2JRaVYvdkcveDIrb3BQNklnK2paUDUyWGFkWUc0Wm1EQWhnTGh3UFJP?=
 =?utf-8?B?ZGNMTWVMaVAzaXY5eTBsUVFOTnB5M3NKWVdsSGF0dHdxMkNwS1IwNkhkZk5J?=
 =?utf-8?B?enFKTzNHRFdlZ3hreXVEajB1WEVaSWNvRFRkTTZZYmEwY3M5YTZhSHZyQmFk?=
 =?utf-8?B?cnlOSUF1S1VSUitWTzVPREZxSWlBaEZCZ0M1WXc1cUl2RkFFL3VybW5UdTNN?=
 =?utf-8?B?cnlwYVhpbWhwOHpTSDVTY0VncmNoNkZmZFJRaWRuMDhxQzczZmFreUlKYkRO?=
 =?utf-8?B?UEhlT0x3a2IzT3pNWkIrTGsreTkrQTZadnR4QnVra3RDRXdkL0xrYkJoMDdM?=
 =?utf-8?B?VnBadEw0clRYUjhpZG5ZVStsQmY1ZitGOUJIUGl5TVVKOExobmdxNEQ4QUc0?=
 =?utf-8?B?cUdxTTU0TXZpd3ZKZXl0bnhva3pTNCtVQjRlSEE0a0xvWHNGeEFva3dVTWto?=
 =?utf-8?B?QytJc3BOcFpwKzJqZHRhUUJwUFU3VS96c3RVaEt1eVlMMkNRZ2tpNlBHZFV4?=
 =?utf-8?B?RGZoN1ZZbklmeGd5Q3lwOE1MOUpLZ0tpV21vMlpsKzJId0g2NXlodE1YU3Uv?=
 =?utf-8?B?SURQWDEwbU04aDluZDBUbStnWjZpbDc1Q2NQZ1EvdGVEK2FFeURzZkpaTnRu?=
 =?utf-8?B?bnRLRzA2ZHFWanBvNUtRWTJ5d2xtanFEQ2pnc3psL042azIyczhJMW9pY1Ay?=
 =?utf-8?B?b3hhaXJDelNmRjJoenl4cndGaFhkK0VMNUVleitNRTdCZ3JsVW14eTBQV25s?=
 =?utf-8?B?Qzl4Wmdic1d6amorVmVYcTFFdW5qMDhyK2g4KzlQa2krbUk2ZkJQcGIyZDB4?=
 =?utf-8?B?N3ZneloyY1p3eXpZZWdKMXk1b21WQlZ3WkxlNlhLRWlPQkpqSnJ4YW1mVXAz?=
 =?utf-8?B?VjNJUkFFek9uTis2ZkJOaEU4QVB2bWIyWUJGQTZ6RnhMVEgxVGhtLzlEa1Jy?=
 =?utf-8?B?LzczMnRHZnBsYWtlT1NhdlVNL2dDWGtJaWRSdGFOYmZoN05ieUdnakpIVnB2?=
 =?utf-8?Q?dvQtIYTz1ff4Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG1kMDVtOEpBTlE2bWw4cEVrdlNtNGt1NmswaHlMSVVwUnJMajlEOEJTT0l4?=
 =?utf-8?B?a0pVM0cxcHo3cEJKZ1ZPKzhTck1hN3VHdVJHWmwrK0RPeUxiZnN3bWNmTzR6?=
 =?utf-8?B?KzZKN0QzS3JIc01lSUxuZkpxZEJsTkJFZ25yT3J2SldXWUFYdTBYK2tlcm4v?=
 =?utf-8?B?d3dPMHVUTUVhUGNYalFYWE9LZ0N1cy9aeHQrMk50RHBrNWJLcmNLUjBEVTAx?=
 =?utf-8?B?WmxPcWF6SjVhUU5CendDeHUyZytXZGtrOUxMd01nQlE3eWJCa0JSRHN3V2hE?=
 =?utf-8?B?RTlLalpDQndTWG5ZS05tbGdxU0NPK1hjOHFUN0wvVjJRSHE3dE9XSlo0TXJ0?=
 =?utf-8?B?eVdrMU9sS1pheW9sUG9YUUlhNUsvekxndXZWaVppVzc4YlJySjRIM3pFUkxq?=
 =?utf-8?B?bzhhUlZSOXA2YnNHczUwUDcvYSt5WlVCWWc5OCs4R3hUNnptZDNHdlk3Tzky?=
 =?utf-8?B?eTJ1Z2hNNnFEWXpUMHh1bEI0aThUUTNFMk1xUGRwSnlNaUVUcFVWdjBoeHE2?=
 =?utf-8?B?QjJuMHA5N3VOeWFWenN6OHBic2Nrb0hDbm5LcG01NUkzbzEvMmtLSkFyTVN4?=
 =?utf-8?B?Z1J0Yjc1b3kzbTdtcjBwMXRYRGkxdS84S2txL0c0cElDZE1tRnBpR3hXT2tp?=
 =?utf-8?B?ZVhuMjVPb2QzblU0d21wNDVRRHlHUGVPdG5xQ2g4MUJrbVhKOEV2UENJMGZ2?=
 =?utf-8?B?TTFVWk5OWWJaOTU5aWdjVVVMMHBqbGNraGJwQWttc0JiM3hxdjdZanpYVVFN?=
 =?utf-8?B?cmJxZkx4UFNhWXhPanZRbU5rZVZrTXRvelpIZ2dXTDJ5RXhHMWhNczFsRWt6?=
 =?utf-8?B?R0orUmxCVGppNjI4M2d1SFN4eERiNGF0SFBXdDR4T1J6dVRMSE4vcU9LSTc5?=
 =?utf-8?B?TDFTRkxuQTh5RWxac2tOaExuUFpLMTlhZ3pINi9xR3lCQ3hDT1cvOXBwcC9L?=
 =?utf-8?B?clR4SkJlalFWc0x3YjdIRkx1QTdZZDRJdS81ZHoyL05WVk9NQndCU0RyODRa?=
 =?utf-8?B?MDZBN2FFa1BVa1A1SjhkT2YvalBKRG4vWW5Vb2t6MHhDa1VBR212RXBKMVM4?=
 =?utf-8?B?UW1nanRvWTk3dzEvR0gxdlNjUTJGdDV2a3QrY3lUOTVhQmw1Tk8wUkRVSFBK?=
 =?utf-8?B?OXJidFlUV2I4UU5HS2MrOTdodlVEeUhmOHNycDEzTitjVWh2YkJoVGRNUUpI?=
 =?utf-8?B?c2kzcm9lR01IZzYyWU95aTVRYjJORy9XK2VtUVlTNW5VUDRsZ2ptcEppVHJI?=
 =?utf-8?B?NHp3bmJ1d3RWUkRRR3pUWnBIeU8ycm1HN0R5VlYxU2lLRXgyMUZPOWhobG4r?=
 =?utf-8?B?RnZJZ3VNU003NFZuVlFYNXdqdmNLSUtGKzZTd1NBVTJoOXhPOUd6YjJ1dnNT?=
 =?utf-8?B?bGhoSlhUdjZGTXRnRm9leFo1T1BYMEpGOE1uQlgrY0FBN3k3TUY5U004MnpW?=
 =?utf-8?B?bDZpNnQ0NWU1N2J1YjgxTGdDYUR1WnVnaXV0OWpzYitLMWFMcDgwTXZiQnFB?=
 =?utf-8?B?T2xldGIzN1lBL0lTK3lERzVleGRldnJBWDc3LzhLNGF4TjVuZ0VndHM2L0xC?=
 =?utf-8?B?aFEzam1YamtLU01xNjhBQVZpeGZkek5aMHZSdHVocG5wN2paZUE3VTdxM1dz?=
 =?utf-8?B?Uk4wWjJyYklqVWwxVUhwZjY3WnIyeU1YaUVTZE83Nlk3UTIxU2dMcXZPR1Vz?=
 =?utf-8?B?Njk3aTBxREhqS25mWk5OUDBFbDUraGZySW1mdTc5YzEzbUxKcTFRUEkvbWx1?=
 =?utf-8?B?eUt0SUlFczJGL2crNStaeHRXL3p6c0kvSGY1d2FFVm5mYWFVR3NkSnQvWjFn?=
 =?utf-8?B?RmNGNGN1QkZFMW0ybjc5WU5Wcll6WDZmV0xnSUdzZEV1QTFhSTMyMCthVlhP?=
 =?utf-8?B?TS9zNzZWdjUxZU9LUXQxZFd2dU1lYmRVQUYxcDdsRmtqRnFMLzVlQWg3b2E3?=
 =?utf-8?B?K1I0RnIvMW5GSWVYU2NVTm9oRGJpcFNlZER3cWVZOEZmR1V3THF2Vmx2SEo0?=
 =?utf-8?B?NC9UdnNTdTBHRDhNbG1jVFp0YXZCU0hDeWZEL1BZN055VUpPblZka3pRMWlY?=
 =?utf-8?B?ckU2UytkSFJiMmcrSE9xd0V2Qis1OU43WEs3Q2RiVmEvMXc2UXRWUk1HTWFI?=
 =?utf-8?B?TFBHQjhvN2tDWlJ0WW1nRjRjRXY4SmcrR3c4dU85M0liVjNTVTdiM2ZEcUNs?=
 =?utf-8?Q?UaHSQDU0x4SQcjmPjocBaoM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ff9ddc-3382-4919-f01a-08dd6af91cac
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 17:27:11.9043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UskmybIKxdHeXbmSSmoU1mmKOJF4Ut30xPvBp/fT9SolQbbhH05DV3/og0Fvt4lU077rWn6+ZEaDNLQzy8qftwCrQFvv1vxhxUXdJo2Rxsk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

On Fri, Mar 21, 2025 at 01:50:49PM -0700, Umesh Nerlige Ramappa wrote:
>On Fri, Mar 21, 2025 at 04:39:58PM +0530, Riana Tauro wrote:
>>Add two tests to run workload on one function at a time with different
>>scheduling policies. If sched-if-idle is set to true, then the functions
>>use the execution quantum even if idle
>>
>>v2: add additional test for sched if idle (Umesh)
>>
>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>---
>>tests/intel/xe_pmu.c | 85 ++++++++++++++++++++++++++++++++++++++++++++
>>1 file changed, 85 insertions(+)
>>
>>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>>index 9a1f9b39e..5aa3ea332 100644
>>--- a/tests/intel/xe_pmu.c
>>+++ b/tests/intel/xe_pmu.c
>>@@ -29,6 +29,7 @@
>>
>>const double tolerance = 0.1;
>>static char xe_device[NAME_MAX];
>>+static int total_exec_quantum;
>>
>>#define test_each_engine(test, fd, hwe) \
>>	igt_subtest_with_dynamic(test) \
>>@@ -262,6 +263,76 @@ static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *
>>	}
>>}
>>
>>+/**
>>+ * SUBTEST: fn-engine-activity-load
>>+ * Description: Test to validate engine activity by running load on a function
>>+ *
>>+ * SUBTEST: fn-engine-activity-sched-if-idle
>>+ * Description: Test to validate engine activity by running load on a function
>>+ */
>>+static void engine_activity_fn(int fd, struct drm_xe_engine_class_instance *eci, int function)
>>+{
>>+	uint64_t config, engine_active_ticks, engine_total_ticks, before[2], after[2];
>>+	double busy_percent, exec_quantum_ratio;
>>+	struct xe_cork *cork = NULL;
>>+	int pmu_fd[2], fn_fd;
>>+	bool sched_if_idle;
>>+	uint32_t vm;
>>+
>>+	if (function > 0) {
>>+		fn_fd = igt_sriov_open_vf_drm_device(fd, function);
>>+		igt_assert_fd(fn_fd);
>>+	} else {
>>+		fn_fd = fd;
>>+	}
>>+
>>+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-active-ticks");
>>+	pmu_fd[0] = open_group(fd, config, -1);
>>+
>>+	config = get_event_config_fn(eci->gt_id, function, eci, "engine-total-ticks");
>>+	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>>+
>>+	vm = xe_vm_create(fn_fd, 0, 0);
>>+	cork = xe_cork_create_opts(fn_fd, eci, vm, 1, 1);
>>+	xe_cork_sync_start(fn_fd, cork);
>>+
>>+	pmu_read_multi(pmu_fd[0], 2, before);
>>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>>+	pmu_read_multi(pmu_fd[0], 2, after);
>>+
>>+	xe_cork_sync_end(fn_fd, cork);
>>+
>>+	engine_active_ticks = after[0] - before[0];
>>+	engine_total_ticks = after[1] - before[1];
>>+
>>+	igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", function,
>>+		  after[0], before[0], engine_active_ticks);
>>+	igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", function,
>>+		  after[1], before[1], engine_total_ticks);
>>+
>>+	busy_percent = (double)engine_active_ticks / engine_total_ticks;
>>+	exec_quantum_ratio = (double)total_exec_quantum / xe_sriov_get_exec_quantum_ms(fd, function, eci->gt_id);
>>+
>>+	igt_debug("Percent %lf\n", busy_percent * 100);
>>+
>>+	if (cork)
>>+		xe_cork_destroy(fn_fd, cork);
>>+
>>+	xe_vm_destroy(fn_fd, vm);
>>+
>>+	close(pmu_fd[0]);
>>+	close(pmu_fd[1]);
>>+
>>+	if (function > 0)
>>+		close(fn_fd);
>>+
>>+	sched_if_idle = xe_sriov_get_sched_if_idle(fd, eci->gt_id);
>>+	if (sched_if_idle)
>>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>>+	else
>>+		assert_within_epsilon(busy_percent, exec_quantum_ratio, tolerance);
>>+}
>
>Test looks good. With the comments in Patch 2 addressed, this is:

As is,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>
>Thanks,
>Umesh
>>+
>>/**
>> * SUBTEST: gt-c6-idle
>> * Description: Basic residency test to validate idle residency
>>@@ -324,6 +395,8 @@ static unsigned int enable_and_provision_vfs(int fd)
>>	for (vf = 1; vf <= num_vfs; vf++)
>>		igt_sriov_bind_vf_drm_driver(fd, vf);
>>
>>+	total_exec_quantum = pf_exec_quantum + (num_vfs * vf_exec_quantum);
>>+
>>	return num_vfs;
>>}
>>
>>@@ -371,6 +444,18 @@ igt_main
>>		test_each_engine("all-fn-engine-activity-load", fd, eci)
>>			engine_activity_all_fn(fd, eci, num_fns);
>>
>>+		igt_describe("Validate per-function engine activity");
>>+		test_each_engine("fn-engine-activity-load", fd, eci)
>>+			for (int fn = 0; fn < num_fns; fn++)
>>+				engine_activity_fn(fd, eci, fn);
>>+
>>+		igt_describe("Validate per-function engine activity when sched-if-idle is set");
>>+		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
>>+			xe_sriov_set_sched_if_idle(fd, eci->gt_id, 1);
>>+			for (int fn = 0; fn < num_fns; fn++)
>>+				engine_activity_fn(fd, eci, fn);
>>+		}
>>+
>>		igt_fixture {
>>			igt_sriov_disable_vfs(fd);
>>			/* abort to avoid execution of next tests with enabled VFs */
>>-- 
>>2.47.1
>>
