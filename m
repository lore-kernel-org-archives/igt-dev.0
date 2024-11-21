Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1446D6ED15
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ECDB10E3F3;
	Thu, 21 Nov 2024 12:16:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4oe88ut";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6218910E3F3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732191400; x=1763727400;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qr9TPfVz6p8+be1+AxyzPPHvEOqd/AiYwlU8vDuWH1k=;
 b=n4oe88utAhio2LuVlwf3pgdTlRqlWsen9smY/yDYBRDq8Lu9ign1XBl4
 Qg4RXvYG1w6Q159zfGJ0W7Oan62RbdSdaRC4jgSyh0WPMDRT3W67zFK0v
 jzyqD0ByuLYimrbaWiy3uuTu6z48AiTTSEL7irIuykEFPspnnYNKdHOde
 xAoIL427eItDNpWXrCeLbBekZtQjbxFY3QHFbww+DXl6dLWlJv3KVwkHc
 Q2kw4403O3uUFw9DvO4+Ndn1tNjgJdaBketKVB0jxvxRgEcTjb9/xafk2
 DX1QP5mALDGS4UrFsVpsP2HISqePlYtePH6/SSQarGh303zEryJltqGOC w==;
X-CSE-ConnectionGUID: EXcKFMCGQpOeM1QUNaGIsQ==
X-CSE-MsgGUID: vgVSH7YhS1+LIHxNt9AF7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36081459"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="36081459"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:16:40 -0800
X-CSE-ConnectionGUID: kdUJTDdRQD+npohP8XA6BQ==
X-CSE-MsgGUID: tGMSiSG3S6yXsHLIYHs+yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="113510325"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 04:16:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 04:16:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 04:16:39 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 04:16:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u96nBSPTMNGtKgVUMXOpTQyUuUKOUBLl5rQldhnl/ekgu0bb7bZSAos0Ivyfr5hTTeYsQbfDwmISS9elPwZYRE5fVoBk4PYIVe76fuzr9yC3Dkk86ZEOwFqzPogMF/tNmuMNQ2jGVyuub8hHG723rrYpE/kCqLUoR63Hr/v9E6Dc5IjPqbmis1SAtUZXI390HC11B3+4lqfBbSQ/AtWQdrEpKsiKMoqdyQ8XfFGlEPyXkzVOCDH/9oH24eJu8TeTGQhlHa4GzObZYbNp6uRytn9QqY8g8stiTjtnZx1yB5nNJe0gZAbBEIAHqcx3qi/kVpCsnTFmnyXmumtDhr7Ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NFz8TUuto+LFKWoMhfrr0tfLmIQkgSuXWKeTbtAwRWw=;
 b=AEPpRylOWPndqmiI0F1Vjn+funEcjz2knr9s3J3Ozptz++2q8IIAOtT7bTRJK6dsoKkEv6GogQbyZrh+iNxIFjILy1i6g7CIKoUdKIt0WdX5P0ApWsyUQPOV0UYA4fq2PuaaOGLOEHprubt4p3n1Q5Ymf6qHjP+oADZJwkiN+r/UB2YvBI7S7BcmQQCRL6sTRFegs5XCx9pHZQDp7RTwsNpuPgFnA3upuE/mZN/JneoeKwdz047Q77/h+ZDJavWHO2Q7/xSQBxqpNeb/l6wSXtc20wrVRwW1LeGZPtAUJrK8fSeXDjRM+d5t3QzRp7bmqZSq9FQtuBadgPJO3Zh2tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24; Thu, 21 Nov
 2024 12:16:32 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8158.024; Thu, 21 Nov 2024
 12:16:31 +0000
Message-ID: <f573f5ff-8b2e-4a7f-a21b-071c505666f0@intel.com>
Date: Thu, 21 Nov 2024 14:15:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_eudebug_online: Add read/write
 pagefault online tests
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <jonathan.cavitt@intel.com>, <mika.kuoppala@intel.com>,
 <dominik.grzegorzek@intel.com>
References: <20241115141132.866838-1-gwan-gyeong.mun@intel.com>
 <20241115141132.866838-5-gwan-gyeong.mun@intel.com>
 <7b6ec309-ed43-4b34-ba5c-694a9c8a715c@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <7b6ec309-ed43-4b34-ba5c-694a9c8a715c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed46d2e-a139-4d54-a621-08dd0a265583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUFlM1Z4VDg1RkYwWVdkamJPbHhBVXo4TnBVNG4wbzN6aUJQeCtVZ0p6SG9I?=
 =?utf-8?B?Y25wRDhLT1VLWlFnNEgrNkhHSXdyMVBjR0ttY0lUOGQzVHdjZXI5OEd6My9X?=
 =?utf-8?B?S29HSTNXTERsSDJJT2wycDN2SGZCcDN1KzhWYzZSa3djL3RlSjQ2YjBPSENx?=
 =?utf-8?B?VW5FMkR1ZUtGSVVaVTloc2g1MlU5akd6cE95YzhQOTBwMnl4M2hLdXBjbm4v?=
 =?utf-8?B?NDBkRFIrbjlsMGVONUl5Y3Q3eTJSSWhyMkt3V2FzOGJxS1BvVlg4Z2hCT0Ez?=
 =?utf-8?B?MzljNExlSzNwdklPNjlhM3VEcWxDTEJOb1gyZzJtUlZ1MzdKK3lhWkxqb280?=
 =?utf-8?B?Lzdxbnc4eFJaajQ1bW1SN0VFY01kMW1IMWcwOSt4QXNxbUFoakdFcm5CTmtM?=
 =?utf-8?B?aU5BaWFpM0w3VVdZQ1lXN1FKK3FKdlJEdHM5dkNDYU1PakZDRHBOSnVzRjlX?=
 =?utf-8?B?L2lIbGZSdzN4bDd6NGRFTVFsRmNkMktiRHQrUDd5enh1d1drdUdnSWxMN2Rj?=
 =?utf-8?B?aVVFRVRsK0svT01zTDVZVjl2dURpTU5OcnZ6QlNIa0xtSis0WUIxRTcxaXAx?=
 =?utf-8?B?Q3Qxcnh6aEtTUHI4SldYaE80Y1MxY09RbnQ3L29ML3Y2SXVuS3IvYy9idUFJ?=
 =?utf-8?B?RWIwVWVtMWM2Ky9DMzVwVndlTmR5akpRWnJTNVRZbE1UblRlMlY2ZzhUTmNq?=
 =?utf-8?B?dG5CbUJ2SVVZMXhkK1dwNjFNaVdoa3hmK05hWW11M2NSSE1LakpYY1Z4Yy9F?=
 =?utf-8?B?M2o4NjVoOTZSc3JsUURVR2tWaS94a0RPbXlwTlV6VGlXSHY3bjQxOTZ5ZjR4?=
 =?utf-8?B?SWt2c3JJZlpkbXpDL0o4MFQ1RE5EdnVLcE4zVFhKV0VSYXpRRi9obXFJZVZ5?=
 =?utf-8?B?VjhDWFZMYjBoRVByNkVDNzQxcFFCRXl1aVE4b2lhelNZUHY5R2x1NEQvQ0lv?=
 =?utf-8?B?TitJZ29zNis0M1JmVDRwZVFhNlN3ZG5SY1RwS3lRNEdKYnM3TVczdnQrcVVa?=
 =?utf-8?B?cDR5ZnpoZTVNY3RmNDIyQ1oyaDFiTWxKeGxLdTB2ZG8reWY5NVI1L2M5UmNr?=
 =?utf-8?B?bFNIZ0doUkk5THJ1ZDFGajFvdXE0NUp3NG9uYm5OSTl6bWhMVEFUOGVTU25v?=
 =?utf-8?B?eVFaRCtyNCtLaVdIbkZhbEs4U2NmR2lQdzdtdFgwanlRb3U4TUJVQzlVeVFN?=
 =?utf-8?B?NWpDR2NWSGM1UnY4VmNPR0VrUTRHdGNqZ0JPNDBlQXlCVmNSUnBTdFIyUFVh?=
 =?utf-8?B?NzZTbmQ1TjdESmpXSWZKQ2FwVFJhLzZnYW05Z2xJVTZrWEl6R1pHcC9BcXdG?=
 =?utf-8?B?NXJBRzVKNWZERzdFVEN6cVhjU2d4eTB3TlYra014NGlwbDdJMk5VUGZWdUh2?=
 =?utf-8?B?eXdncXF3eEIzbTVpeWVXenlJOVE3eFZWd2xuNmUxcFBkN0JqLzV5dHN0N1pz?=
 =?utf-8?B?bENPNXZSaG5BaHlXeTJoU0hZYjZBOFgzQTcyVWhKVkwwbkFyMGYwOXRVTGp3?=
 =?utf-8?B?MDhtWjg4cG5Dd3ptc251aWRLQ3EwU3JqWmxrL1VVTU43UFJoUHBHRlZRblNq?=
 =?utf-8?B?MlhGT0tqQkV2TWxCMFUzZWRtVFJVVFJVTXg0MGFQUUFCb0VMQmdSR2FFVUw4?=
 =?utf-8?B?TmhiaTRBc3FYQUc1VHFVK0RuVEZmMTlpSit3c2tlZTFRaHVtcmpOWFdqRllY?=
 =?utf-8?B?YW4rNnliU1MxOG9XLzBsUVFFVTJLZmNDeXYvZVllUzNkNERjaFhPbm9Vc1dB?=
 =?utf-8?Q?6BChQ5KU5UOqvg6JQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q00weUZGVTVPTElDKytucTM5WFRXWmJOc1ZiU0JnM3F4OTlkSDdDdUM2UUZa?=
 =?utf-8?B?NFBlMGZPRFNVK2JGejJUUTByVHdRZ0NBM0pxNkdMKzdQWEUxclhqWnVOb2VV?=
 =?utf-8?B?Z1JFRVdHNmFKY0hZT3VMZDdVY251b2NpanF6czFaUDJDVlFMUzN0bFV0cmQy?=
 =?utf-8?B?aEUyUDR1eFhScUxXb3ZNQklQdklkQjZMUHY0QnBQNFhSMFpGUXhyOUhiQzNu?=
 =?utf-8?B?UGFkZ0ZIWXgzWHIrMUd6Mkt2RVNQSVNBQWlEUnk0L1ZhYzJRd2VSZjVIQ1Q4?=
 =?utf-8?B?Z3JPSjJvandRNm9wUzZIT2lWY092YkFaOGhmSWZydStFZzZoendLRG5iSDZX?=
 =?utf-8?B?cTBLelNCbmxKQWt4YjdKbWo2ZDAxbjRLR0JDd1VFeVpmMDl4c2FtSFBZS1px?=
 =?utf-8?B?NGlvOU1QT1pZcjgwVE8veERwN3lzMXFqZkRGY0FOTDNJQkRnSEtONmxYOTdR?=
 =?utf-8?B?T3RCREltNnlkd0JteTZHNnVWckY2dlpjK2dPd2xjSHo3NmEraTk5cGlaQ2U3?=
 =?utf-8?B?Y25ZR2JPZ1lKTTBDb1U0MmtzTndBLzcxb0JOL1RjcEhsY08rYUU1cWNuakpx?=
 =?utf-8?B?UjVNVGI3bHBTU0ZVSlpqbmF0L1JiSUdFdWtvYUhCVmNMQkhaRHdlQmJMQlNF?=
 =?utf-8?B?MklLNnVXWmhDSDF4MmVIWXZvWmhSbzhhTFJUd0JpZ0pFNEx6anpBRTJiUzNt?=
 =?utf-8?B?TVJycng2ZWZ4UjAwWVNIOTJSdHRaOHlyVmtOS1dtZXo3ZGpCOGVlUmZiUVhy?=
 =?utf-8?B?UDNmS0cxV3NaaHUrTWg0Y0daUXhRYWJCOVNqL2oyOWJ6ZFZEV3I3MWExM2Jy?=
 =?utf-8?B?ajAyYUl1VVJnNG9vVE10RzlyRzhwVFY3cEUySHF6ZDlVeXZEbFQvMkx3OU4y?=
 =?utf-8?B?SGw1ZUtnYm9jdHFSSkk4dVRlUk14NEkyVGprZE5UbHhBRFp2ckVFRndYdE1E?=
 =?utf-8?B?MXNQY0F4Y2RaRU5pMk5XMFduNXhKdVdwYi91UGs4bmJrRHBEdlhmMjBYQWxk?=
 =?utf-8?B?eFFoUDduZXN2OXFPd0ZxSVM3c2lIbmJkZ0JqZWlpa29mQXNjQkJEckhWQTNB?=
 =?utf-8?B?WHI1R1ptaTNxeDVLK3pEM0ppcUd5RXFvQTVHa1dlajh4dkFHWWRXWG9wYTNO?=
 =?utf-8?B?LzJVMXBOcTBtenBrSDNvcHc0UmZFZVhORTQxcG1WWFlkL1ZrakNtUlFCbUp6?=
 =?utf-8?B?RmtDeUNwUmZjdkFTeU9ISE42MzdZUy9seTk2OEc5YWRLRzBGdHJ2S3JyUW9o?=
 =?utf-8?B?b05oaFRPbW5aUW5Kd1JZRFRwc1lPNFZvNmppTnhObEdCSGVSVXQyODlGVVQ3?=
 =?utf-8?B?MEh0aHRDZUtDa3l6RXZXei9PQWZ6bkk0bnFQUkJtN3BmN09FSk5rVDJ5WjBV?=
 =?utf-8?B?anEvdjVLVm1yN0szY1lzaVFiM21OWEZOQ3RWT2FyQm1JVXVSTllPZE02RWdW?=
 =?utf-8?B?TDZMUjZqNXVrenJkVm9Fdm05dk5SVkpWblY5NHNjdlFzTTZCa3Y3YTdHcWdt?=
 =?utf-8?B?VHFwcjB4WHMrZ3QzT0pRanZJbWFrMnVBVlRhMFFXMHpaMWY0Tjc4ZVcyck9Y?=
 =?utf-8?B?c3MzSlJCUkNtUUlxVjFvV0Y0VnNqMFozWVp6QW5qWjhpTEoycHdNaUVvY2JE?=
 =?utf-8?B?TlJBeUN0V3BmZDNpM3pRQm83OHJRQzJ4MG1WSExaQTBvcks3Y1NaeTVuL1dz?=
 =?utf-8?B?YUJJclN2OW9WeGJBdXlvR3JrQ1ptdnVidkNka2w5Z1dqc3RoV3EvK3dKdlQ3?=
 =?utf-8?B?cFZPeWdZenlqcStBblU4eWVTSXFtOXp6c3MzdEk4UjBqS084UzJyeHI3UytY?=
 =?utf-8?B?dXZ1djdvelpnUXVsa0JkQTlKR1JsR3M5elUxaHVqTFdZb21YNWlyZmVKNUZP?=
 =?utf-8?B?WTlmME80dzhRVy8zM29ROUlSMWozNFluZmowZ0pxb2RMR2Jhb29PZy9XcEpp?=
 =?utf-8?B?aVBrZ21rZVBiWk1jeGUrN3czM0U3akFpR015UFp4LzN1cENLbkFqMDkyQllv?=
 =?utf-8?B?QzkrSmFEU3ZqK2JreHlvUWZBeE9qajBEZWdwY0JoamFuOUxhajRYM20rNkpu?=
 =?utf-8?B?RHZuTW0vNU5UVWs1U0lDWGFENE1sc1lLRzd5VGg1a2JXb0xCeS8zMENKY1ls?=
 =?utf-8?B?YUU4K0hKVnQ4S3p2NVlLbW5nMXhGS0MwT0ZwNm9sQjc3OHpQeDhmV1FBaVlD?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed46d2e-a139-4d54-a621-08dd0a265583
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 12:16:31.8091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqatvanYBBV8pXB3CCjsZ875+NmGlTbUPGCnv9he2fu4F6lZH9EjQrA12hI5+TBrYgI364HyLmYZZjEyfWsdxmYinkkxc1pKFojFdPKfIVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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



On 11/19/24 6:49 PM, Manszewski, Christoph wrote:
> Hi Gwan-gyeong,
> 
> On 15.11.2024 15:11, Gwan-gyeong Mun wrote:
>> Add read and write pagefault tests to xe_eudebug_online that checks if a
>> pagefault event is submitted by the KMD debugger when a pagefault occurs.
> 
> For some reason when running the test with the '--debug' option it seems 
> like there are events missing in the debugger log. I haven't been able 
> to spot whether that's a problem on the kmd or igt side, but that seems 
> only to be the case for the page fault tests.
> 
> Yes, the test passing despite this... is not good. That inevitable igt 
> event processing rewrite is nocking on the door. But the debugger log 
> itself should report all events the debugger has sent - so that needs 
> some attention.
> 
When creating a vm with xe_eudebug_client_vm_create( ... , 
DRM_XE_VM_CREATE_FLAG_FAULT_MODE );, it is observed that some eudebug 
events related to vm bind are not fully reported to the debugger, this 
is an issue that should be checked in the KMD and is not an issue caused 
by the pagefault kmd / igt test implementation. This issue requires a 
separate KMD fix.
>>
>> Test that read (load instruction) and write(store instruction) attempt to
>> load or store access to unallocated memory, causing a pagefault.
>> Examine the address causing the page fault and the number of eu threads
>> causing the pagefault.
>>
>> Co-developed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> ---
>>   tests/intel/xe_eudebug_online.c | 219 +++++++++++++++++++++++++++++++-
>>   1 file changed, 215 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/ 
>> xe_eudebug_online.c
>> index 0ef0d8093..eae0eb520 100644
>> --- a/tests/intel/xe_eudebug_online.c
>> +++ b/tests/intel/xe_eudebug_online.c
>> @@ -36,6 +36,8 @@
>>   #define BB_IN_VRAM            (1 << 11)
>>   #define TARGET_IN_SRAM            (1 << 12)
>>   #define TARGET_IN_VRAM            (1 << 13)
>> +#define SHADER_PAGEFAULT_READ        (1 << 14)
>> +#define SHADER_PAGEFAULT_WRITE        (1 << 15)
>>   #define TRIGGER_UFENCE_SET_BREAKPOINT    (1 << 24)
>>   #define TRIGGER_RESUME_SINGLE_WALK    (1 << 25)
>>   #define TRIGGER_RESUME_PARALLEL_WALK    (1 << 26)
>> @@ -45,6 +47,7 @@
>>   #define TRIGGER_RESUME_DSS        (1 << 30)
>>   #define TRIGGER_RESUME_ONE        (1 << 31)
>> +#define SHADER_PAGEFAULT    (SHADER_PAGEFAULT_READ | 
>> SHADER_PAGEFAULT_WRITE)
>>   #define BB_REGION_BITMASK    (BB_IN_SRAM | BB_IN_VRAM)
>>   #define TARGET_REGION_BITMASK    (TARGET_IN_SRAM | TARGET_IN_VRAM)
>> @@ -61,6 +64,8 @@
>>   #define CACHING_VALUE(n)    (CACHING_INIT_VALUE + (n))
>>   #define SHADER_CANARY 0x01010101
>> +#define BAD_CANARY 0xf1f1f1f
>> +#define BAD_OFFSET (0x12345678ull << 12)
>>   #define WALKER_X_DIM        4
>>   #define WALKER_ALIGNMENT    16
>> @@ -123,6 +128,9 @@ static int get_number_of_threads(uint64_t flags)
>>       if (flags & SHADER_MIN_THREADS)
>>           return 16;
>> +    if (flags & SHADER_PAGEFAULT)
>> +        return 16;
> 
> Nit: could be merged together with the above.
> 
>> +
>>       if (flags & (TRIGGER_RESUME_ONE | TRIGGER_RESUME_SINGLE_WALK |
>>                TRIGGER_RESUME_PARALLEL_WALK | SHADER_CACHING_SRAM | 
>> SHADER_CACHING_VRAM))
>>           return 32;
>> @@ -179,6 +187,16 @@ static struct gpgpu_shader *get_shader(int fd, 
>> const unsigned int flags)
>>               gpgpu_shader__common_target_write_u32(shader, s_dim.y + 
>> i, CACHING_VALUE(i));
>>           gpgpu_shader__nop(shader);
>>           gpgpu_shader__breakpoint(shader);
>> +    } else if (flags & SHADER_PAGEFAULT) {
>> +        if (flags & SHADER_PAGEFAULT_READ)
>> +            gpgpu_shader__read_page_fault(shader, BAD_OFFSET);
>> +        else if (flags & SHADER_PAGEFAULT_WRITE)
>> +            gpgpu_shader__write_offset(shader, BAD_OFFSET, BAD_CANARY);
>> +
>> +        gpgpu_shader__label(shader, 0);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>> +        gpgpu_shader__jump_neq(shader, 0, w_dim.y, STEERING_END_LOOP);
>> +        gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>>       }
>>       gpgpu_shader__eot(shader);
>> @@ -217,6 +235,17 @@ static int count_set_bits(void *ptr, size_t size)
>>       return count;
>>   }
>> +static int
>> +eu_attentions_xor_count(const uint32_t *a, const uint32_t *b, 
>> uint32_t size)
> 
> Nit: the current checkpatch line limit is 100 characters which means 
> this would fit in a single line.
> 
>> +{
>> +    int count = 0;
>> +
>> +    for (int i = 0; i < size / 4 ; i++)
>> +        count += igt_hweight(a[i] ^ b[i]);
>> +
>> +    return count;
>> +}
>> +
>>   static int count_canaries_eq(uint32_t *ptr, struct dim_t w_dim, 
>> uint32_t value)
>>   {
>>       int count = 0;
>> @@ -636,7 +665,7 @@ static void eu_attention_resume_trigger(struct 
>> xe_eudebug_debugger *d,
>>           }
>>       }
>> -    if (d->flags & SHADER_LOOP) {
>> +    if (d->flags & (SHADER_LOOP | SHADER_PAGEFAULT)) {
>>           uint32_t threads = get_number_of_threads(d->flags);
>>           uint32_t val = STEERING_END_LOOP;
>> @@ -746,6 +775,43 @@ static void 
>> eu_attention_resume_single_step_trigger(struct xe_eudebug_debugger *
>>               data->single_step_bitmask[i] &= ~att->bitmask[i];
>>   }
>> +static void eu_attention_resume_pagefault_trigger(struct 
>> xe_eudebug_debugger *d,
>> +                          struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_eu_attention *att = (void *) e;
>> +    struct online_debug_data *data = d->ptr;
>> +    uint32_t bitmask_size = att->bitmask_size;
>> +    uint8_t *bitmask;
>> +
>> +    if (data->last_eu_control_seqno > att->base.seqno)
>> +        return;
>> +
>> +    bitmask = calloc(1, att->bitmask_size);
>> +
>> +    eu_ctl_stopped(d->fd, att->client_handle, att->exec_queue_handle,
>> +               att->lrc_handle, bitmask, &bitmask_size);
>> +    igt_assert(bitmask_size == att->bitmask_size);
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +
>> +    if (d->flags & SHADER_PAGEFAULT) {
>> +        uint32_t threads = get_number_of_threads(d->flags);
>> +        uint32_t val = STEERING_END_LOOP;
>> +
>> +        igt_assert_eq(pwrite(data->vm_fd, &val, sizeof(uint32_t),
>> +                     data->target_offset + steering_offset(threads)),
>> +                  sizeof(uint32_t));
>> +        fsync(data->vm_fd);
>> +    }
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    data->last_eu_control_seqno = eu_ctl_resume(d->master_fd, d->fd, 
>> att->client_handle,
>> +                            att->exec_queue_handle, att->lrc_handle,
>> +                            bitmask, att->bitmask_size);
>> +
>> +    free(bitmask);
>> +}
>> +
>>   static void open_trigger(struct xe_eudebug_debugger *d,
>>                struct drm_xe_eudebug_event *e)
>>   {
>> @@ -1015,7 +1081,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       struct intel_bb *ibb;
>>       struct intel_buf *buf;
>>       uint32_t *ptr;
>> -    int fd;
>> +    int fd, vm_flags;
>>       metadata[0] = calloc(2, sizeof(*metadata));
>>       metadata[1] = calloc(2, sizeof(*metadata));
>> @@ -1025,7 +1091,7 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>       fd = xe_eudebug_client_open_driver(c);
>>       /* Additional memory for steering control */
>> -    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP)
>> +    if (c->flags & SHADER_LOOP || c->flags & SHADER_SINGLE_STEP || c- 
>> >flags & SHADER_PAGEFAULT)
>>           s_dim.y++;
>>       /* Additional memory for caching check */
>>       if ((c->flags & SHADER_CACHING_SRAM) || (c->flags & 
>> SHADER_CACHING_VRAM))
>> @@ -1045,7 +1111,11 @@ static void run_online_client(struct 
>> xe_eudebug_client *c)
>>                                  DRM_XE_DEBUG_METADATA_PROGRAM_MODULE,
>>                                  2 * sizeof(*metadata), metadata[1]);
>> -    create.vm_id = xe_eudebug_client_vm_create(c, fd, 
>> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +    vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE;
>> +    vm_flags |= c->flags & SHADER_PAGEFAULT ? 
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0;
>> +
>> +    create.vm_id = xe_eudebug_client_vm_create(c, fd, vm_flags, 0);
>> +
>>       xe_eudebug_client_exec_queue_create(c, fd, &create);
>>       ibb = xe_bb_create_on_offset(fd, create.exec_queue_id, 
>> create.vm_id, bb_offset, bb_size,
>> @@ -1245,11 +1315,14 @@ match_attention_with_exec_queue(struct 
>> xe_eudebug_event_log *log,
>>   static void online_session_check(struct xe_eudebug_session *s, int 
>> flags)
>>   {
>>       struct drm_xe_eudebug_event_eu_attention *ea = NULL;
>> +    struct drm_xe_eudebug_event_pagefault *pf = NULL;
>>       struct drm_xe_eudebug_event *event = NULL;
>>       struct online_debug_data *data = s->client->ptr;
>>       bool expect_exception = flags & DISABLE_DEBUG_MODE ? false : true;
>>       int sum = 0;
>>       int bitmask_size;
>> +    int pagefault_threads = 0;
>> +    uint32_t *ptr = NULL;
>>       xe_eudebug_session_check(s, true, XE_EUDEBUG_FILTER_EVENT_VM_BIND |
>>                         XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
>> @@ -1265,6 +1338,16 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>               igt_assert_eq(ea->bitmask_size, bitmask_size);
>>               sum += count_set_bits(ea->bitmask, bitmask_size);
>>               igt_assert(match_attention_with_exec_queue(s->debugger- 
>> >log, ea));
>> +        } else if (event->type == DRM_XE_EUDEBUG_EVENT_PAGEFAULT) {
>> +            uint32_t after_offset = bitmask_size / sizeof(uint32_t);
>> +            uint32_t resolved_offset = bitmask_size / 
>> sizeof(uint32_t) * 2;
>> +
>> +            pf = (struct drm_xe_eudebug_event_pagefault *)event;
>> +            ptr = (uint32_t *) pf->bitmask;
>> +            igt_assert_eq(pf->bitmask_size, bitmask_size * 3);
>> +            pagefault_threads += eu_attentions_xor_count(ptr + 
>> after_offset,
>> +                                     ptr + resolved_offset,
>> +                                     bitmask_size);
>>           }
>>       }
>> @@ -1279,6 +1362,9 @@ static void online_session_check(struct 
>> xe_eudebug_session *s, int flags)
>>           igt_assert(sum > 0);
>>       else
>>           igt_assert(sum == 0);
>> +
>> +    if (flags & SHADER_PAGEFAULT)
>> +        igt_assert(pagefault_threads > 0);
>>   }
>>   static void ufence_ack_trigger(struct xe_eudebug_debugger *d,
>> @@ -1302,6 +1388,55 @@ static void ufence_ack_set_bp_trigger(struct 
>> xe_eudebug_debugger *d,
>>       }
>>   }
>> +static void pagefault_trigger(struct xe_eudebug_debugger *d,
>> +                  struct drm_xe_eudebug_event *e)
>> +{
>> +    struct drm_xe_eudebug_event_pagefault *pf = (void *) e;
>> +    int before_threads, after_threads, resolved_threads, 
>> pagefault_threads;
>> +    uint32_t attn_size = pf->bitmask_size / 3;
>> +    uint32_t *ptr = (uint32_t *) pf->bitmask;
>> +    uint32_t offset, before_offset = 0;
>> +    uint32_t after_offset = attn_size / sizeof(uint32_t);
>> +    uint32_t resolved_offset = attn_size / sizeof(uint32_t) * 2;
>> +
>> +    before_threads = count_set_bits(ptr + before_offset, attn_size);
>> +    after_threads = count_set_bits(ptr + after_offset, attn_size);
>> +    resolved_threads = count_set_bits(ptr + resolved_offset, attn_size);
>> +
>> +    pagefault_threads = eu_attentions_xor_count(ptr + after_offset,
>> +                            ptr + resolved_offset,
>> +                            attn_size);
>> +
>> +    igt_debug("EVENT[%llu] pagefault; threads[before=%d, after=%d, "
>> +          "resolved=%d, pagefault=%d] "
>> +          "client[%llu], exec_queue[%llu], lrc[%llu], 
>> bitmask_size[%d], "
>> +          "pagefault_address[0x%llx]\n",
>> +          pf->base.seqno, before_threads, after_threads, 
>> resolved_threads,
>> +          pagefault_threads, pf->client_handle, pf->exec_queue_handle,
>> +          pf->lrc_handle, pf->bitmask_size,
>> +          pf->pagefault_address);
>> +
>> +    for (int idx = 0; idx < 3; idx++) {
>> +        if (idx == 0) {
>> +            igt_debug("=== Attentions before ===\n");
>> +            offset = before_offset;
>> +        } else if (idx == 1) {
>> +            igt_debug("=== Attentions after ===\n");
>> +            offset = after_offset;
>> +        } else {
>> +            igt_debug("=== Attentions resolved ===\n");
>> +            offset = resolved_offset;
>> +        }
>> +
>> +        for (uint32_t i = 0; i < attn_size / sizeof(uint32_t); i += 2)
>> +            igt_debug("bitmask[%d] = 0x%08x%08x\n", i / 2,
>> +                  ptr[offset + i], ptr[offset + i + 1]);
>> +    }
>> +
>> +    igt_assert(pagefault_threads > 0);
>> +    igt_assert_eq_u64(pf->pagefault_address, BAD_OFFSET);
>> +}
>> +
>>   /**
>>    * SUBTEST: basic-breakpoint
>>    * Description:
>> @@ -1383,6 +1518,77 @@ static void test_set_breakpoint_online(int fd, 
>> struct drm_xe_engine_class_instan
>>       online_debug_data_destroy(data);
>>   }
>> +/**
>> + * SUBTEST: pagefault-read
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a read pagefault.
>> + *
>> + * SUBTEST: pagefault-write
>> + * Description:
>> + *     Check whether KMD sends pagefault event for workload in debug 
>> mode that
>> + *     triggers a write pagefault.
>> + */
>> +static void test_pagefault_online(int fd, struct 
>> drm_xe_engine_class_instance *hwe,
>> +                  int flags)
>> +{
>> +    struct xe_eudebug_session *s;
>> +    struct online_debug_data *data;
>> +    uint32_t val;
>> +
>> +    data = online_debug_data_create(hwe);
>> +    s = xe_eudebug_session_create(fd, run_online_client, flags, data);
>> +
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_OPEN,
>> +                    open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
>> +                    exec_queue_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_debug_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
>> +                    eu_attention_resume_pagefault_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_METADATA,
>> +                    create_metadata_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
>> +                    ufence_ack_trigger);
>> +    xe_eudebug_debugger_add_trigger(s->debugger, 
>> DRM_XE_EUDEBUG_EVENT_PAGEFAULT,
>> +                    pagefault_trigger);
>> +
>> +    igt_assert_eq(xe_eudebug_debugger_attach(s->debugger, s->client), 
>> 0);
>> +    xe_eudebug_debugger_start_worker(s->debugger);
>> +    xe_eudebug_client_start(s->client);
>> +
>> +    /* wait for workload to start */
>> +    igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
>> +        /* collect needed data from triggers */
>> +        if (READ_ONCE(data->vm_fd) == -1 || READ_ONCE(data- 
>> >target_size) == 0)
>> +            continue;
>> +
>> +        if (pread(data->vm_fd, &val, sizeof(val), data- 
>> >target_offset) == sizeof(val))
>> +            if (val != 0)
>> +                break;
>> +    }
> 
> I think this is redundant. It looks like it copies the 
> 'test_interrupt_all' function, but as far I'm concerned the waiting loop 
> is there to interact with the client thread while the gpu workload is 
> running. Since we don't do that here I think 'test_pagefault_online' 
> should rather resemble the 'test_basic_online' function.
> 
Good catch, I'll remove redundant code.
Many thanks,
G.G.
> Thanks,
> Christoph
> 
>> +
>> +    pthread_mutex_lock(&data->mutex);
>> +    igt_assert(data->client_handle != -1);
>> +    igt_assert(data->exec_queue_handle != -1);
>> +
>> +    pthread_mutex_unlock(&data->mutex);
>> +
>> +    xe_eudebug_client_wait_done(s->client);
>> +
>> +    xe_eudebug_debugger_stop_worker(s->debugger, 1);
>> +
>> +    xe_eudebug_event_log_print(s->debugger->log, true);
>> +    xe_eudebug_event_log_print(s->client->log, true);
>> +
>> +    online_session_check(s, s->flags);
>> +
>> +    xe_eudebug_session_destroy(s);
>> +    online_debug_data_destroy(data);
>> +}
>> +
>>   /**
>>    * SUBTEST: preempt-breakpoint
>>    * Description:
>> @@ -2344,6 +2550,11 @@ igt_main
>>       igt_subtest("breakpoint-many-sessions-tiles")
>>           test_many_sessions_on_tiles(fd, true);
>> +    test_gt_render_or_compute("pagefault-read", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ);
>> +    test_gt_render_or_compute("pagefault-write", fd, hwe)
>> +        test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>> +
>>       igt_fixture {
>>           xe_eudebug_enable(fd, was_enabled);

