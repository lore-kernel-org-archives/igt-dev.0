Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF92EC02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 20:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CD6F10E2A3;
	Fri,  7 Feb 2025 20:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epPzPLcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC39710E1F1
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 20:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738959338; x=1770495338;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=c/rOaxnGBAweRoJsVdl/LbVO/s2R33iSba7WLbYD5jw=;
 b=epPzPLcOmrQrxCVeaV51Ij/EaT7beWioSUAPi4rs59uETIVQRbYP5Iyh
 jTLvt4QysZOgbVqcv3g/ZeYRxaLMlX2Bga2MziBXRBXZOljFmIMAG1m8+
 OWpGJ7y1OTjk3d22+47UduroXgEffUekV3j5pCSTj69IvOe9LSOD966XM
 B5Np65UUBbqou74s98l7bYVF0cZm0u0W91u1oAijZ+7Y1aXCIcFZIwTRJ
 TGtUo5llQ9/rO7SKuKaPlI+vnOBtmLHwZzmNeUpjKyN63vgxQT/DrycmN
 D9uqCGluG9O3J2q2MZLrG65bqqJ84bkDmQ81ThSTNx9JjvOYtn3YHthfa w==;
X-CSE-ConnectionGUID: obYaacQ7R1K1z5QVmhwkBw==
X-CSE-MsgGUID: kIm7DmIOQ+W2jsDRtkOW6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50250649"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="50250649"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 12:15:37 -0800
X-CSE-ConnectionGUID: b0QEx9RJQzaUC8x5g08S2Q==
X-CSE-MsgGUID: KpZMKTpLQiqgs0Wn40FMIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; d="scan'208";a="112243637"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 12:15:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 12:15:36 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 12:15:36 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 12:15:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BivuhtsfDaSaVLbJlzinIo28Xg6Y9tAO7UNwR1bX2U5/9ZpGy7mZxklLjsmbpgP6Itoi6K55kVladdVDIvICsEKhOmn8RVtVobYE4Z4WJALm+ajcPcpRc9KJWRB6KsoKIWY1TqtpMV+5nFk2N4uPnRRLWTL38Gnf4/IDKmpnw8s8TrEFDPy6u2tmd1z3RIabSVFO7CF+VH+FeD/nT+ETZl8+OwZqORDsSlJowYFa/fNO0TZbPHCdHOI3fG8IQeWxJ0wQ2uE9aOsLZCqZI2oxcmTDweEJAPZDygQBSpzduPM7T95R63HHpK0G80d7sCPQWqVGgpt3oJALQY+eNjVPfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHVl+gzzWohlzz9jaxceCgC2HToC5p2Hf29pkF2Ho8k=;
 b=xlEsaSuN96rIMzDq2+3If5zOrpgM//T8OWNAo1BiC8ixYv47Y1PdsPbl+EP32i9HSmpXacV0dB8vqs3zeeOqd+p60mnE1MH5WiV02jyRE5UYe3cUxtLdphpmBmdObxtWjUcUWHFdGNrW1QgGfc74RXa/b7OMY0tR2gtRfqwggfbNmSZuD+b98ZoOLVz6BKLdoo9qr7iwDWQS69aMlU6sArJdmcxvggGzi3aGUeT+LSakahxH9UA6vOCJqBih9NIICTXLdjWWJmwrnkgxSvLCKwniOruT/4Ewu5wTIn2CCre+bA5W3Mwhh/Q75sPJkYqYnGLBx/6WHmh3AC+BWz/Hog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB7507.namprd11.prod.outlook.com (2603:10b6:8:150::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 20:15:33 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 20:15:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250203182141.617229-1-lucas.demarchi@intel.com>
References: <yeb7toxw7aqtrwlncbuhsuhdlpmckwve2iwhz2crep62fqdifn@by2yiutcan4f>
 <20250203182141.617229-1-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 07/10] runner: Fix use of newline on arguments
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Fri, 7 Feb 2025 17:15:26 -0300
Message-ID: <173895932681.1963.6009281722243990787@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0040.namprd03.prod.outlook.com
 (2603:10b6:303:8e::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB7507:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa3fd16-e878-4935-9403-08dd47b42ca5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk1yMkFoa3NhOFA1L2V2TDZwbkZaY0ZxREhLVHU3VlV0SzUyVytJUld5MU9W?=
 =?utf-8?B?VFBuWklxZGhRSGNzcFZnQXVoMGFZcFJLc2I4VXd0blUrLzU1VkxwU3dKVzNp?=
 =?utf-8?B?NmhsZngydnVQU0FoazFlVkliTTVUWi9WaHYvOXRRMUtsRVI4bGtQV2tZV0Ry?=
 =?utf-8?B?eEcwYmR2S2FGR3Y5VmU2SzNkd2hoS1BESHd3VXpnK0k5c0gwQmZZamFmd0Uz?=
 =?utf-8?B?SmNmZWJIaG5zYXpPT1VzVUF5OFdHK3k2Ym5RblUrSmFtL3FlRmhnVkl3Mjho?=
 =?utf-8?B?WGJUZ2VyTTNadVorb3hnUWlSTGNBOGtsZGhENmJFc3lhT0xtMUJ6NnJobW1V?=
 =?utf-8?B?UkZzR0l6b0crOWxRNFo1dGFScTgyemZ4eTFaZFdQTHg3d1lTcmViRDR3QWNT?=
 =?utf-8?B?djlpaXpucVpyWUtPTStXV2JDNi9pSERGQzZoNGJjMENaSGFFSjFZSnQ3KzM3?=
 =?utf-8?B?QisrdUdmV1R1WEJHNDQzTUgrSWYrVGZMYTZITmhEamEwNDdPd3Q5cTFwV0Qx?=
 =?utf-8?B?QVBvamtuczNpU3VERTQyQ2pWdkx0djFscU9kckZPKzNRcEU2V2c2T2V3NGpB?=
 =?utf-8?B?dHBFOHhYVm44RjY1WThxMVFwVkduVFA3WUliMktJNFNDTk5wUFgvenNkVzIx?=
 =?utf-8?B?Slg2ak5qRDVrNGp1RFNpYlRidXRvMHM4RjcvcThyM2xpQVhUakNiTHByekNj?=
 =?utf-8?B?a2piVzkyMzRoQ3Y3anp4V1pyN3NtNnJyeVUydjE5RlYxWW50Q0t4ZjlYRVNN?=
 =?utf-8?B?ZVZwZHM4Nm8yQStHN043QlFTRGNzZ20rOEFRdXhpcXNYMWxJRzBqOCtnUFlB?=
 =?utf-8?B?eWV1MVJINzAwWTRob0NjU1hPNnlWSEwydGh6OXBVb05aSGVrTENvSWpCNmJ2?=
 =?utf-8?B?TUtJNVJEd1RWWmN2MVh0SFFDNnFyd0t6ZkFOVFMvTXBLeDR5NTN0RFJnalhl?=
 =?utf-8?B?YTZ1dld1WHRLSXR3cDExUWtUQUwzaitnOGFVc3BKT2FuVldyYVpEOUN5Nm42?=
 =?utf-8?B?RndKRFlWVjBOcU1PTnpwTVhqYWRHaTlKbGxQUmd6UVNMclEycnhaMDNGN0Zn?=
 =?utf-8?B?aDlwM1kzZHpCK3p4WFRPSXhUS1owb0dQTk9jNUUwQjZ0dXZVSUowOEpKbHNS?=
 =?utf-8?B?MllsWXRmZGs5Sm9zSVFMSXdZZ0NmVmthbDlnYzJNcFlIQ2xKL2RZNFFDcnNM?=
 =?utf-8?B?OTdCZFcwN09MendxSjBScnNvRjVKYTh3K0VMbDBTUHY5eUFqcXJ6SStobGZK?=
 =?utf-8?B?ZWVML1dhbzBqRU9pblNZNGZMbTljcGxUR05iUFpZOEVGb0ZaYTlCYkd1RWpx?=
 =?utf-8?B?YjlJQnljVVlwTVQrcmhqNHFmUUJ3MUdQcUlRdEtpNFVBalFmbnVBWkwySFZm?=
 =?utf-8?B?MTRmeHFndk54b1JWU1VkS3M4aS9YWTMxY01JQWFKc2ZCSGR3UlBiZ0IvYlZJ?=
 =?utf-8?B?aDRjR3pmUGdIejdqcFAvWG9vc1ZFak5hVUlQUVVMWkJwdG5Wbm5sYzRVdHY5?=
 =?utf-8?B?ejVFeUo4V1V6djUyKzNpdU5ERm9Xb0hEWUpPc2tyb3E0QXphaFVyL0FFNmVQ?=
 =?utf-8?B?OG5GSHVFdUVvV3ZnTS94MG9nSFo3eGM0eEpRTlg1cDBTZm1HUWZDd3RnSUxo?=
 =?utf-8?B?RHREc3dLaGN5TUZVbnl0dlhWbEZKcGVidzRGdUZWTWJHZmw1VW92OFFiVDFK?=
 =?utf-8?B?SzkxbUZ2NVF0VHdpamhSazRyNlFKOGt2bkQvUjIxTlg0WlA3Skd6dlZNOTh1?=
 =?utf-8?B?VExnejVzRFNYTG91bmk5ajBBVTdWVENmQk85QVBmVnA3OHlvOHlyZmlSY054?=
 =?utf-8?B?TVlZVUxDNk1jdjVyRjh1dFZ0dWRaUksrQlhnekthandFRjdhRURwaDBJSkJx?=
 =?utf-8?Q?xZBeYddZcDJ7f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFaZ0xjdTVWM1NMRXh2NlMyZWVOUDN3Ly9NaDNXR1FMY3BOZ1RnQVpuNVFq?=
 =?utf-8?B?Ui9sNVorbmRVM01GQk9zNXhCdFN3WkpiRXQwZ1ZsWmh6K2pPWUp5SlMwOWdP?=
 =?utf-8?B?VGRpQkNVbEFLclluT1NWQzRHYWhwWFpkM0RiL1E4Uy95TDB6ZmtCMWxWU05Q?=
 =?utf-8?B?dURuTFplZkhlTEJGemc5TXJkaTlKL3BIemJNVDdiUmlPYmJxcmZEd1d5S0Rl?=
 =?utf-8?B?RzA0VFl3TUIrbmRrbHV6S1ZVMGEzWTh0U3lGMUhIaFZlUkE4aFljY05RcVdZ?=
 =?utf-8?B?eDZMM1VnR1B3ZThVbVlvckZob0QzVklMOUZicVhuYTNxazduZmRJWEVuY21N?=
 =?utf-8?B?Mlh4MGRsV3llc1FSdkR0Q3VlY1VRdWFhWkk2V3AwN05mNjE2RmFnWWM4RTBx?=
 =?utf-8?B?VTZCUU1aekZGamFldEJCZExhN1FXRWZxeGd2SFpqWFZKeTZRck5VUFg1alJq?=
 =?utf-8?B?cVEzTC9lcnVZM1QvTG5mbktjaEpyS1VTRTBDMFBMM1hnK2tUemFRVlRaNXoy?=
 =?utf-8?B?ZE9NaGZzSVRGMnFqY2h6b0ZWaEhuL1dYYVRlbFJES1pESEgrL2V6bGt3Mys2?=
 =?utf-8?B?QUZJZ2ozK1N3cUVxUGFvcHY5blJWU1BWVHlnd3UweVM2dVkxdzk5Y29md2o2?=
 =?utf-8?B?dHgzc255Rys5OHFXcTYrNUNlRjJIRVJGK1hrVjZISCsyVDhWcVYxcFpuNGFo?=
 =?utf-8?B?OXlOVDYyTEI0dGNmRk1OZzdwQWx4eXFJRzBLMWp3T1pOSEFjQlBUVzVEdzNB?=
 =?utf-8?B?RlI4Q1hLUU13eVlaU3UvMUFRRkNNS2Q4dGw5RTV2dEYyOVY3cFhCUkhuUTJS?=
 =?utf-8?B?YnZKMlV5MEhmY0p0aVltMldXaHc3WnlMS0NxT1Y2MHl1RmFhYkJDTlNMN0cw?=
 =?utf-8?B?Y21aSVhuMEdCb01xNnU0QWVwaWFwbVZWM2llQ1orczhjVDhtOFlJWnVZSmxY?=
 =?utf-8?B?aG5DY2l2RUJzOXVsOUZXMElVNjdjSTZSUEZaQzkrcE9PRWZkNWJHcGNUSUNE?=
 =?utf-8?B?UCsrbzg4bm9JZUV2MEo4NjVEaklEK1F6VzVIYUt2eWFaVzZDMzNLS1grelEy?=
 =?utf-8?B?ZE1LQVl1eDhkeTJoTGt5dzFmNlYyWWJIMldJeFlkUEFVUWpDOWMxTjdCWnFR?=
 =?utf-8?B?Rms3VTRaU3hWa0NmK3g5Tjg1U1VWVFZ5RlpHVDc4cnJ1Z09udVVUL3Z6bWF4?=
 =?utf-8?B?QW5OeFBQdHkvSlgwRkpSU1N6ZnJ5N0hmZ0w5SEdZeWhOOGpJZWF5YUcrUmN5?=
 =?utf-8?B?RmJNbkp4RVdQaVBOR2ZtdExvUU5CdEt4ck9EVmdScFN0Yi8zNU96c2xMbmV5?=
 =?utf-8?B?bUMwbWk1SzZnblY4bVlUczA5d3hLWmg5OElxYS9nNmVBWGxtYUJkeUdsOERN?=
 =?utf-8?B?SUNCTi92cmQ1SU9LOFRROUFXNlVONCtTTEtpelRIWHdLTnlyYkxWcHJmWHFX?=
 =?utf-8?B?ZWdRK3hwZlZVQjZFVGJYKzhXaXlGR2RHWmtCSVBYbVo4Vm84MFkyVHd0czBs?=
 =?utf-8?B?WTJ1eDAweXFnT21lR1VXbDVBem9kUzF0OXkvR0hMcWdMQ21udGRnaEtxUXdt?=
 =?utf-8?B?Z3UzY003b3BNZCs3T1lyK1p2R0E5WkYzZVlWcnJTeGE1VEdXbXcvZlVkNEQw?=
 =?utf-8?B?SVpDRjBrUE5mRmtNTVd6aU51VExNcWhiTXVGZkZyTnQ3SFcwM0RCcFJ5Wmh0?=
 =?utf-8?B?Rk9nQ2RxNkVSVFBmMXNIUzJyR3phY1RWUTFHbm9ZMjVod3AzZ0o2RUFpb3d0?=
 =?utf-8?B?VGdzWmRTa1lNZVRzMWtKNUx6UjVyRENNakh3cERPTE5EeUVwRVhUdHNxWGow?=
 =?utf-8?B?R3JMaGYvTVJMUHVka05YVkdCZ0xDczI2a0xqRFVzSFI0eEMySDRmMUg1clR3?=
 =?utf-8?B?OTJsNndqb0ZTL0dBYksxZnhvTTFBOGRvNm16VGQxM3NHU1p3SUljeStzeEJ6?=
 =?utf-8?B?SG1WVWJINHNwSGJqNFVCYlZUU21WUm0rVGFEbU4wQ1kzcnZLaFNjQ29TZWx0?=
 =?utf-8?B?a0pBUGhSb05LdzNMUTB5N0JOdXlIZG1BaDdRSzhKK2dPNnloRnZnSGdYTlZ5?=
 =?utf-8?B?N3ZpNGFnVkQvMjRBbE15eG5xOUczVzVIQWZGVmdwZ09LNzAvYUVPYWVuU3RC?=
 =?utf-8?B?aTBNSHI0VUpQR1Fiek5TR0lDR2VzOXhnczhRVGh0MklpZEVFWXQxN01ZY2Mw?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa3fd16-e878-4935-9403-08dd47b42ca5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 20:15:32.8069 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IV7c6q/EfMP5KU+3XZJm8gaNlrHYR4EYbqKiI9vMeqmg8YF4tGKL6Pha1mnIY/ktGHPrQLeLUgBd0ijh0sY1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7507
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

Quoting Lucas De Marchi (2025-02-03 15:09:04-03:00)
>Currently there's no support for newlines on arguments passed to runner.
>However it's also a silent failure:
>
>        # igt_runner --test-list '/tmp/test
>        list2.txt' build/tests/ /tmp/results
>
>        # head /tmp/results/metadata.txt
>        disk_usage_limit : 0
>        test_list : /tmp/test
>        list2.txt
>        name : results
>        ...
>
>        # ./build/runner/igt_resume /tmp/results
>        [9840425.334900] All tests already executed.
>        resume failed at generating results
>        Done.
>
>Embedding a newline like this is very dubious for test-list, but it's
>used for e.g. hooks. In future we will add the command line to the
>metadata and possibly migrate the hooks, so add support for
>escaping/unescaping the string on save/restore.
>
>The method chosen is slightly different than the one used for hooks:
>instead of adding a escape char and keeping the char escaped, this just
>prefers using an hex representation of the char with a \x<HEX>h
>sequence. This makes it easier when unescaping since the reader can
>continue reading one line per iteration. In future this can also be
>adopted by the hooks or even migrating the hooks to use metadata.txt.
>
>Another fix is that now we just skip null values on the serialization
>side.  Previously it would serialize "(null)" and then load that string
>instead of NULL. Add code_coverage_script to the runner_test to cover
>that, which would previously fail.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
>
>- Fix NULL string (bug already present)
>- Add sanity check on the unescape_str() side to differentiate invalid
>  from empty strings. Now unescape_str() returns negative in cases of
>  error and there's better validation for the escaped char
>
> runner/runner_tests.c |  1 +
> runner/settings.c     | 85 +++++++++++++++++++++++++++++++++++++++++--
> 2 files changed, 83 insertions(+), 3 deletions(-)
>
>diff --git a/runner/runner_tests.c b/runner/runner_tests.c
>index 8441763f2..93b3ebc9f 100644
>--- a/runner/runner_tests.c
>+++ b/runner/runner_tests.c
>@@ -200,6 +200,7 @@ static void assert_settings_equal(struct settings *one=
, struct settings *two)
>         igt_assert_eq(one->use_watchdog, two->use_watchdog);
>         igt_assert_eqstr(one->test_root, two->test_root);
>         igt_assert_eqstr(one->results_path, two->results_path);
>+        igt_assert_eqstr(one->code_coverage_script, two->code_coverage_sc=
ript);
>         igt_assert_eq(one->piglit_style_dmesg, two->piglit_style_dmesg);
>         igt_assert_eq(one->dmesg_warn_level, two->dmesg_warn_level);
>         igt_assert_eq(one->prune_mode, two->prune_mode);
>diff --git a/runner/settings.c b/runner/settings.c
>index 693c5484e..03402a385 100644
>--- a/runner/settings.c
>+++ b/runner/settings.c
>@@ -7,6 +7,7 @@
> #include <errno.h>
> #include <fcntl.h>
> #include <getopt.h>
>+#include <inttypes.h>
> #include <libgen.h>
> #include <limits.h>
> #include <stdio.h>
>@@ -1052,10 +1053,80 @@ static bool serialize_hook_strs(struct settings *s=
ettings, int dirfd)
>         return true;
> }
>=20
>+/*
>+ * Serialize @s to @f, escaping '\' and '\n'. See unescape_str()
>+ */
>+static void escape_str(const char *s, FILE *f)
>+{
>+        while (*s) {
>+                size_t len =3D strcspn(s, "\\\n");
>+
>+                if (len > 0) {
>+                        fwrite(s, len, 1, f);
>+                        s +=3D len;
>+                }
>+
>+                if (*s) {
>+                        fprintf(f, "\\x%xh", *s);

I was thinking we could have used %02x and avoided the "h" suffix... But
I guess the "h" suffix makes the unescape logic simpler.

>+                        s++;
>+                }
>+        }
>+}
>+
>+/*
>+ * Unescape a '\' and '\n': undo escape_str
>+ *
>+ * Exacpe chars using the form '\x<hex>h' so they don't interfere with th=
e line

Exacpe?

>+ * parser.
>+ *
>+ * Return the number of chars saved in buf and optionally
>+ * the number of chars scanned in @n_src if that is non-nul.
>+ */
>+static ssize_t unescape_str(char *buf, size_t *n_src)
>+{
>+        size_t dst_len =3D 0;
>+        char *s =3D buf;
>+
>+        while (*s) {
>+                char next =3D *(s + 1);
>+
>+                if (*s !=3D '\\') {
>+                        buf[dst_len++] =3D *s++;
>+                } else if (next =3D=3D 'x') {
>+                        unsigned long num;
>+
>+                        s +=3D 2;
>+
>+                        num =3D strtoul(s, &s, 16);

Well, I think strtoul() is too permissive here, it allows the str to
start with whitespaces and some prefixes that are not generated by
escape_str().

But I guess that's acceptable if we only care about unescape_str() being
able to process what was generated by escape_str(), as you commented
earlier.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+                        /* cover both error due to overflow or invalid ch=
ar */
>+                        if (num > UINT8_MAX || *s !=3D 'h')
>+                                return -EINVAL;
>+
>+                        buf[dst_len++] =3D num;
>+                        s++;
>+                } else {
>+                        return -EINVAL;
>+                }
>+        }
>+
>+        buf[dst_len] =3D '\0';
>+
>+        if (n_src)
>+                *n_src =3D s - buf;
>+
>+        return dst_len;
>+}
>+
> #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #nam=
e, s->name)
> #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
> #define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
>-#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
>+#define SERIALIZE_STR(f, s, name) do {                \
>+                if (s->name) {                        \
>+                        fputs(#name " : ", f);        \
>+                        escape_str(s->name, f);        \
>+                        fputc('\n', f);                \
>+                }                                \
>+        } while (0)
> bool serialize_settings(struct settings *settings)
> {
>         FILE *f;
>@@ -1171,9 +1242,17 @@ static char *parse_str(char **val)
> {
>         char *ret =3D *val;
>=20
>-        *val =3D NULL;
>+        /*
>+         * Unescaping a string is guaranteed to produce a string that is
>+         * smaller or of the same size. Just modify it in place and leak =
the
>+         * buffer
>+         */
>+        if (unescape_str(ret, NULL) >=3D 0) {
>+                *val =3D NULL;
>+                return ret;
>+        }
>=20
>-        return ret;
>+        return NULL;
> }
>=20
> #define PARSE_LINE(s, name, val, field, _f)        \
>--=20
>2.48.1
>
