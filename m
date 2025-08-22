Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8C8CA0EFC
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 12:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0659810E0FB;
	Fri, 22 Aug 2025 12:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ALtryEFa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0A810E0FB
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755866818; x=1787402818;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PR/9o6Jjpv8qcVRt8dLOIHtOMlrNhdhIO757wPIGU8g=;
 b=ALtryEFaBdSaz/aqX0C03yhZzbIEUMk1pLVjH2na4FtaRR9DOL7pIJgO
 Zq9xTp+uWAHSJQfAVShkLk1aPnjJw2YFpBVUpiEqdj4tnrsizSb0MgAHP
 qhWEmf3DaCRCI+xlRMN7LcL5iZN0qkCsS9ZIcr3Wzz8e4DlF7FhrFbI6p
 csPi7CrI4xZTwRxzVfkmRBFYX2YZ8kyM/7xTisOSjcedW+uzWVfmrFfiG
 zrAW8192fELxLlHTD/5UjIvjutbmdt3Etlraup01PF4zlR4g0FqWgTikq
 LqyqDBk8ngcQujEAddnCd2ht05m3oN8Kjb1Pttea736Ep+WSI4anRT93/ Q==;
X-CSE-ConnectionGUID: zP6CQdL8TbiWcWs80mEotg==
X-CSE-MsgGUID: S5l1liTyQwGSD/A2U2kOWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58097218"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="58097218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:46:58 -0700
X-CSE-ConnectionGUID: 1NVmV3BuSfuAqbXgPYJUWg==
X-CSE-MsgGUID: ml55n2xXQRGSwECJmrBL2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="173972916"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 05:46:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 05:46:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 05:46:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 05:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QFJg2Iu2yww9NNMFmCWlwn+ZWL98ALtjjgpQXj9S8m+rPAeI0uj+TCV2vSFA98YjD2yjMwKiNvLCKST6VKVFA2O+gMU8GO37xJZWjrmFVNOjdfrOTjv8W5UqCMkKnpQIBo92cSeTdOCebfcfa3OopQnoorzZ45mC9ZuPWnFgLJKRCAOA1+nUrNWqHqLnkpnq8Dakrkve6qpcNwORWIBsuiWum1lRsjpJuAeDPg/cvmUcua2p5uxl5n4mZXAqcY9IYHaA+94/u4mt/xofYi/2OVtLwAYkyEzBybGECaAuPZQxdIgh6h35kBsUezxk2Nmn1waS1OzPyzpqYCeRZFagDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP+G+tP54tgw73szpTg/zXfXHPV0QlxEXsdzoXOhdMc=;
 b=Wgup0W4TMhrb3HVee3m6ZaZgbWkqxV2Y+UvlfS469S483XMVqABzDkTMa0YZ/Qb4Nftbjw9We8/vp4rOJTtOPstHuroU7u/nQFOSAComrf4sol68AQAoXDSUTRFiLN8QhCyBbVsGyrMiuSzMab4MMnFIWB4nrZnts99jhg2pL3fj49lCZu48e863ibXtMB+6OBNtBX0wnJUJ83DC3O2RJVraX79mzGuOc+9QCtRTTVO+4z6plgk5lwlCfubwxJlUFxsB3pjXws989ijMwwcebDDS3j6eaFD12udWuYuV2dfZFfp0ZPZ/9Pqnqp4PiYNMcCNVbW5P+nRggX1tUcaT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB6497.namprd11.prod.outlook.com (2603:10b6:510:1f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 12:46:54 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 12:46:54 +0000
Message-ID: <0b66a8d2-5b56-44c3-802e-ddf9c0fde180@intel.com>
Date: Fri, 22 Aug 2025 14:46:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/3] tests/intel/xe_sriov_scheduling: Keep K
 submissions in flight
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
 <20250819165045.467613-2-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250819165045.467613-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0143.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::27) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b09eff0-1039-452f-17ed-08dde179f935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFpqdkpYcXpaeWJLdmlja280ZzBmaE1LZ3JGVGprK0Qrb1hDZEdNc3BsalA5?=
 =?utf-8?B?L0RTbmNpb0x3R21iWGIyV3BnQVZoTDE1RitYQVYxZEIyNk9aazVUd1pRUFFU?=
 =?utf-8?B?NTBkMWVqejdGSW13USt1VEpnSjNBTnhoNkh5b0lqUzBiYTVQZGhCZ2g1WTY1?=
 =?utf-8?B?SS9YaWc3QkNtY29HelhjS0w2dnVPREUwQlVsNHN5NXErUldrd0RYL2R3ZDUx?=
 =?utf-8?B?OW5zSlVxL2dXdUZ3UUxLVVNHU2lJNldxMFpoNlU2TjUrbk9Vb2VwYWFYWU1i?=
 =?utf-8?B?QUVxMkZHdGRCNUhqenUvS1Rvc0ZEQ3JvTzh0TVlFMVZndWoxRktXNytwRm5j?=
 =?utf-8?B?aVFqdjIzeEI3VkRqclIzOWxIR1o0YWh6M2MrWHZsYlRWUG94N0l0eHRzd0E4?=
 =?utf-8?B?QlBvandRcDNSdE5TVzNOSU5yWGp5K0ZRbXo3UXZjcEZ4K2l0MFQwSEt0anBa?=
 =?utf-8?B?RW84NmdLWXJCMStCMTFMWlQ1UjkxeU9mQjZYZkNxTDZ5RWpxM1Rhc1NTZUVP?=
 =?utf-8?B?WFdtOTMwL3VLQjQ4eklmQXUrMUFJblVtc3hqd3FMNk1PRm1qZXppbVM1NlU3?=
 =?utf-8?B?cVE3TzE2TUM4bGRUbGVwTnpuQ2dvM2NBNHc3dUc4MWluNVFnaVBzSlBCOXNa?=
 =?utf-8?B?aWEzUXlZVUlHeVcxNkg3VFBzVDRRZGxkNEdvUng1UFpOM3BlUXZodmJKdmdP?=
 =?utf-8?B?NHJ4ajBLTUpuY0xtWGIvNy9LY3kyWG9PZXhaZFlkaVVrYUF2NzlKOU0yUHo1?=
 =?utf-8?B?dzZ5N3V4UUNVSFltd1NWZVhyckVCVHA3V2VEZmgyOWdEQ1dQMDVVN3htcVZi?=
 =?utf-8?B?alVpTFlVUXdOSjVycVBkR2dqSzkrUjA2Tk5kaTJ5dGNTQ3U3czdhRVZuUGRG?=
 =?utf-8?B?QW4vMEt3WXZQSzZtYlB1d2lkVm9VZVc0dHJHbERCWmFML2kvYkdDbk1TTTQv?=
 =?utf-8?B?aFBoM01EWDlYOU8rYUNYZ0cvSk1UUkpvNUlieXg1cGRoTDN2b3VNVkVTUkxr?=
 =?utf-8?B?TjltZm43ekFKY2QwaGhxa1lQOTE2OHJaSmhFUStRZVJERXF6SnE0TXpsWHg5?=
 =?utf-8?B?THNMRnlabnhQd0o2MDQrS0lOM2hGdU5rUE05WDREUE0ydE5pNUxPZ3pkZFBz?=
 =?utf-8?B?V0hMbC9tcDdObFA1R1dxRmV4bVpIT09FTktEUW5ERlpZYTdBekJzbTZSdytv?=
 =?utf-8?B?U0RyYlhxS1JOQXRzKyt2MTFXRnIrUHVKV05CZ1dBaGwvank2SW96SjZvYnY4?=
 =?utf-8?B?MXY2YS9CTUk1bGJnWkZHRnBFSjNJaVB5aFFtZE9mS3hXdjZIa3lISEpJdHlj?=
 =?utf-8?B?Yno4KythTjl5cU9IbWp2QU1NQk1xeC9wZ3R3dnNaNGZCVzBXOGw2TmZ3L2VU?=
 =?utf-8?B?ZlNTdWNlL0p4Z1lWMkpJM1BHZFp0bktRRkZySEF1Y1MxcHpiSnJNeHBBQW5s?=
 =?utf-8?B?VTRZMXJQaWl6SE9nNXpYV1lzQVJZZFJsYmJjUVd1dWJWS2lqa1FrSTk1YSta?=
 =?utf-8?B?b2tmOFg3dlIzMzI3L0pFazI1MTgzT0xxZCsxaUF2STdpRXB4R2VWbHQxSG0y?=
 =?utf-8?B?bXN4U1g1TVNyRHl4enR6WkxpekZXMys3bTNJdHpFVG1heEFzcnZFQi9iUGVa?=
 =?utf-8?B?RkU3TlNpU0pKSWExQmRnd3c4bU1aTXFBRERLSGxLZ0o0bGc3K3NYZzhwaEtG?=
 =?utf-8?B?eEZqUjhVTWg0T0sveEdsNWdPWmdWdHFRQ3RDMC80ZTd6RVBEZ2xVbG5Vb09W?=
 =?utf-8?B?WlFRYWozV0k1UG9kTStreDBkTVZ6RlVzYmFRV3RXZVlFMVl5K3gwcVRVeElY?=
 =?utf-8?B?R0RWdXpSZmJzeUVtUU9VQTZCY09aNHB2empaRFRPS2hsVjhVTndwMkpNdzYz?=
 =?utf-8?B?MitySXZNMFdObnZ2WWx2VXlNT2x0M3I0bUNpTFBJa3JtMXdBNFpQY0oybHIz?=
 =?utf-8?Q?/cRaib8gdqY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlBlYWpvUktnY2k0TzU1Z2ttT3E5Z0EzSHErWGFxandiYXIzaDBObGV2ZGMy?=
 =?utf-8?B?UmRCMmxzb0Z1ZVN2dHVXVWkwc2p6d0lqRUxnV2FOdGNFeVFKKys5dHE1Y1By?=
 =?utf-8?B?ZjE0N0lXdWdvbkE0WUlJWFV6WkZ0MHVXVTh6dVRPN3h1bW1sVEU1M2hONVdD?=
 =?utf-8?B?Ukc0aFZEeVZaNDVvVXMwbmxIajl5Q29acjg4N01hNkZqZHZwR3F0SyszakRJ?=
 =?utf-8?B?ZXVsR1RRazVzdUdtVWxBOFZXcXhWdU81TFZHUnMySG8wM3ZRRElzN2ZFVUF3?=
 =?utf-8?B?NEd6ci9WMnlnZVp3Wjd4LzNMNDBHTGVIT25rRjNrbFN0S09oa0dRT2M0RWFB?=
 =?utf-8?B?UzdUaHQ3eEowNFlESnlwdktkaldyMnhTaTVxaFY1M05teEZONkJ6STloWnVi?=
 =?utf-8?B?Njhrazg0NHJ4MHVZOG1TU0xaanlaMzFsYXg1d29Ud1lIWU85bXVNdXFiWERZ?=
 =?utf-8?B?UDlJdW9rbldtaWcyb0FGK1lGVW45blU2ZThyaXVCWGMzL3pnSEFuU3NmdWFP?=
 =?utf-8?B?QWl4NVlCdGtTbUxDdnpHZWl4c0J1bmU2UzEycTBCbm52TEtKY0o2b0VrSisx?=
 =?utf-8?B?Y1ZvbDMxVGdrWWt1VTN1aGpqUVlrMTIvU0pDVXFZN2VMeVhKZGljcXBDY2hI?=
 =?utf-8?B?cE9ZQm5hcUFhdXBRdWJOZC9HeVFIVUtteDJNWlBOQmtGeHhjVTQxQkVIR0tz?=
 =?utf-8?B?aWtVeHNEYkRwZlZrY3FnUDltQU04VmhjeWI2bjJ1K0NNMzNtOWpUcjhablBY?=
 =?utf-8?B?a01sb2pvdXpNaWU2ZjlOczFGRm9FWUU5enFnWG5ZYVRuVWlBQVFRQTlHZEQ2?=
 =?utf-8?B?Y0UrMkpaQXUxZkJzODBpdzNoQ1JsVnVqVUdKUjBLaVV6VTZLckFqMHQ2Umw4?=
 =?utf-8?B?Rm9nc1F2aVNVbnJjYm9rektQTElJKzlZKy9VaWxEOW15UENzSzhudXFTNnZG?=
 =?utf-8?B?cjZwOVAvbXZVbmxnZVBKcEhPQzBGbDk2bnBEbHJ3Q1VnVDdmVGl4cWtOWDZo?=
 =?utf-8?B?RHVtVGVvRDY4U0dITFVuSFNRd0dyMWJCK1Y4VGdGTkZOSmpSdVo3eG9qSm5l?=
 =?utf-8?B?YVJmNStnOVkzallqTHBzWFVBa2Vhc0ZaVWZrd1d6bllNVU0wNWpzajV2Yjc2?=
 =?utf-8?B?Q2tCUE1paHEwb1lEVzE0YmJrN0JYd3BLN3BWTVVSUkV3UHdOWnFhTWJVOWZw?=
 =?utf-8?B?MVZmOGxhbGV2eFNMQWRyR3ZwVmhwRUxjeXBiYTJvbXh5eUdqTkRudmhBaHZ5?=
 =?utf-8?B?SDdXYUdsQko5cXNDRDRZdmJ0eXpqeEp3WElNSEVlamw2blc4N1ZZKzgvVUU5?=
 =?utf-8?B?cFljYTlUYTdSeE9OVDVVUzV6RjAvdG9HNkxVOFVLc056MEsvSENwUC9FQ3p6?=
 =?utf-8?B?ck1YL29EWGJuc25YK0hPdURaWkRINHdqSWVvNW9QcTA4WnlaYmtOWVo1Mmsw?=
 =?utf-8?B?Y0FPNUJxZHBFZlBVSXN3K1RSRjBwckF0L2IrZlF5OWN5ZStMdC9RS0c3V2J6?=
 =?utf-8?B?VDFQNnlINnZFcURpQms2dnhwa0F3SWY5eHdZM3ZQa2Z6d1U4OHp5RlgzcTJ0?=
 =?utf-8?B?dVJnMUgyeHM0Wm13VHRsa1R0RnkwYVAvSmJUc3lVK2N5YnpFeTdrRFN2bU9h?=
 =?utf-8?B?UHFhL2EzWFpaVW15Vk10VU5RdWVtZm80QVlVUkMwWHVkRExIRDFxaDVEVEYv?=
 =?utf-8?B?VTViQThudVJiNUdwWS9GcE51WGMxZ3hNMzZNY05aZm5MY2ZhY1VsY0FLZzhE?=
 =?utf-8?B?Vml5QUxKSjNuWHAvYWRvc2ZpZnc3Wms3UU5Mam1YbW82UklYYmNJakF1dnNM?=
 =?utf-8?B?MW4xakprcVNlY1VDaUlzWUlJL2FHTE1uMlJnSWFKS203SGJhZVRsdjhVWXZ4?=
 =?utf-8?B?VnRlbWtZR2lnVllPOHR4Z01NOHE3T3dSVHpOMW1rakVML09FU2xiVUZzSE10?=
 =?utf-8?B?NlZnVnMwSkRBUkJkZDl4T3l1Qng4T0VGSWRtUjBKSFVKNXE0MHFFeGIvRDBW?=
 =?utf-8?B?NGd2ODlKVkxCS2hSWWFid3dXdjVlTnM2SFdGeGt1MVpDODBEM3dUNXlWTDg5?=
 =?utf-8?B?RnY1eUk4a1FxTWpNVERpdUluSDUySzNDcnNjQ3Bnd1pINDFlTktwUmhUYTls?=
 =?utf-8?B?NGVpM01LUHAwVStyWWJyTFd2RVpFbDBQbm4wUHkwS0cwRlFjRTZjYzFiRTdy?=
 =?utf-8?B?c3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b09eff0-1039-452f-17ed-08dde179f935
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 12:46:54.7412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H0UK/P+WrEUHPE4ae/TjWNeObV26CEDlJsFHy1jZvB5IwwgKQjdyAYWOvlKy1XTCzRk668x4qj5riQxYxuPRJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6497
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


On 8/19/2025 18:50, Marcin Bernatowicz wrote:
> Refactor submission to a prefill->wait->refill pipeline so each VF can
> keep K jobs in flight. Introduce per-slot resources (addr/bo/spin/
> out-fence) and submit per slot.
>
> This patch sets K=1, preserving current behavior; follow-ups will pick
> a higher/default K and add CLI control. This improves HW saturation and
> is less sensitive to CPU scheduling hiccups, especially for short jobs.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 124 +++++++++++++++++++++---------
>   1 file changed, 88 insertions(+), 36 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index d69315690..28a2b6e26 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -51,13 +51,16 @@ struct subm {
>   	int vf_num;
>   	struct subm_work_desc work;
>   	uint32_t expected_ticks;
> -	uint64_t addr;
>   	uint32_t vm;
>   	struct drm_xe_engine_class_instance hwe;
>   	uint32_t exec_queue_id;
> -	uint32_t bo;
> +	/* K slots (K BOs / addresses / mapped spinners / done fences) */
> +	unsigned int slots;
> +	uint64_t *addr;
> +	uint32_t *bo;
>   	size_t bo_size;
> -	struct xe_spin *spin;
> +	struct xe_spin **spin;
> +	uint32_t *done_fence;
>   	struct drm_xe_sync sync[1];
>   	struct drm_xe_exec exec;
>   };
> @@ -78,43 +81,62 @@ struct subm_set {
>   };
>   
>   static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
> -		      struct drm_xe_engine_class_instance hwe)
> +		      struct drm_xe_engine_class_instance hwe,
> +		      unsigned int inflight)
>   {
> +	uint64_t base, stride;
> +
>   	memset(s, 0, sizeof(*s));
>   	s->fd = fd;
>   	s->vf_num = vf_num;
>   	s->hwe = hwe;
>   	snprintf(s->id, sizeof(s->id), "VF%d %d:%d:%d", vf_num,
>   		 hwe.engine_class, hwe.engine_instance, hwe.gt_id);
> -	s->addr = addr ? addr : 0x1a0000;
> +	s->slots = inflight ? inflight : 1;
>   	s->vm = xe_vm_create(s->fd, 0, 0);
>   	s->exec_queue_id = xe_exec_queue_create(s->fd, s->vm, &s->hwe, 0);
>   	s->bo_size = ALIGN(sizeof(struct xe_spin) + xe_cs_prefetch_size(s->fd),
>   			   xe_get_default_alignment(s->fd));
> -	s->bo = xe_bo_create(s->fd, s->vm, s->bo_size,
> -			     vram_if_possible(fd, s->hwe.gt_id),
> -			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	s->spin = xe_bo_map(s->fd, s->bo, s->bo_size);
> -	xe_vm_bind_sync(s->fd, s->vm, s->bo, 0, s->addr, s->bo_size);
> -	/* out fence */
> -	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> -	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> -	s->sync[0].handle = syncobj_create(s->fd, 0);
> +	s->addr = calloc(s->slots, sizeof(*s->addr));
> +	s->bo = calloc(s->slots, sizeof(*s->bo));
> +	s->spin = calloc(s->slots, sizeof(*s->spin));
> +	s->done_fence = calloc(s->slots, sizeof(*s->done_fence));
> +
> +	igt_assert(s->addr && s->bo && s->spin && s->done_fence);
> +
> +	base = addr ? addr : 0x1a0000;
> +	stride = ALIGN(s->bo_size, 0x10000);
> +	for (unsigned int i = 0; i < s->slots; i++) {
> +		s->addr[i] = base + i * stride;
> +		s->bo[i] = xe_bo_create(s->fd, s->vm, s->bo_size,
> +					vram_if_possible(fd, s->hwe.gt_id),
> +					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		s->spin[i] = xe_bo_map(s->fd, s->bo[i], s->bo_size);
> +		xe_vm_bind_sync(s->fd, s->vm, s->bo[i], 0, s->addr[i], s->bo_size);
> +		s->done_fence[i] = syncobj_create(s->fd, 0);
> +	}
> +
>   	s->exec.num_syncs = 1;

You set it later in subm_exec_slot

> -	s->exec.syncs = to_user_pointer(&s->sync[0]);
>   	s->exec.num_batch_buffer = 1;
>   	s->exec.exec_queue_id = s->exec_queue_id;
> -	s->exec.address = s->addr;
> +	/* s->exec.address set per submission */
>   }
>   
>   static void subm_fini(struct subm *s)
>   {
> -	xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr, s->bo_size);
> -	gem_munmap(s->spin, s->bo_size);
> -	gem_close(s->fd, s->bo);
> +	for (unsigned int i = 0; i < s->slots; i++) {
> +		xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr[i], s->bo_size);
> +		gem_munmap(s->spin[i], s->bo_size);
> +		gem_close(s->fd, s->bo[i]);
> +		if (s->done_fence[i])
> +			syncobj_destroy(s->fd, s->done_fence[i]);
> +	}
>   	xe_exec_queue_destroy(s->fd, s->exec_queue_id);
>   	xe_vm_destroy(s->fd, s->vm);
> -	syncobj_destroy(s->fd, s->sync[0].handle);
> +	free(s->addr);
> +	free(s->bo);
> +	free(s->spin);
> +	free(s->done_fence);
>   }
>   
>   static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> @@ -122,25 +144,37 @@ static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
>   	s->work = *work;
>   	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
>   						  s->work.duration_ms * 1000000);
> -	xe_spin_init_opts(s->spin, .addr = s->addr, .preempt = s->work.preempt,
> -			  .ctx_ticks = s->expected_ticks);
> +	for (unsigned int i = 0; i < s->slots; i++)
> +		xe_spin_init_opts(s->spin[i], .addr = s->addr[i],
> +				  .preempt = s->work.preempt,
> +				  .ctx_ticks = s->expected_ticks);
>   }
>   
> -static void subm_wait(struct subm *s, uint64_t abs_timeout_nsec)
> +static void subm_wait_slot(struct subm *s, unsigned int slot, uint64_t abs_timeout_nsec)
>   {
> -	igt_assert(syncobj_wait(s->fd, &s->sync[0].handle, 1, abs_timeout_nsec,
> -				0, NULL));
> +	igt_assert(syncobj_wait(s->fd, &s->done_fence[slot], 1,
> +				abs_timeout_nsec, 0, NULL));
>   }
>   
> -static void subm_exec(struct subm *s)
> +static void subm_exec_slot(struct subm *s, unsigned int slot)
>   {
> -	syncobj_reset(s->fd, &s->sync[0].handle, 1);
> +	int nsync = 0;
> +
> +	syncobj_reset(s->fd, &s->done_fence[slot], 1);
> +	memset(&s->sync[0], 0, sizeof(s->sync));
> +	s->sync[nsync].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	s->sync[nsync].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	s->sync[nsync].handle = s->done_fence[slot];
> +	nsync++;
> +	s->exec.num_syncs = nsync;

Why not sync[0] and num_sync = 1 ?

> +	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->exec.address = s->addr[slot];
>   	xe_exec(s->fd, &s->exec);
>   }
>   
> -static bool subm_is_work_complete(struct subm *s)
> +static bool subm_is_work_complete(struct subm *s, unsigned int slot)
>   {
> -	return s->expected_ticks <= ~s->spin->ticks_delta;
> +	return s->expected_ticks <= ~s->spin[slot]->ticks_delta;
>   }
>   
>   static bool subm_is_exec_queue_banned(struct subm *s)
> @@ -157,6 +191,8 @@ static bool subm_is_exec_queue_banned(struct subm *s)
>   static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   			   const struct subm_opts *opts)
>   {
> +	const unsigned int inflight = s->slots;
> +	unsigned int submitted = 0;
>   	struct timespec tv;
>   	unsigned int i;
>   
> @@ -165,16 +201,24 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
>   	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
>   
> -	for (i = 0; i < s->work.repeats; ++i) {
> -		igt_gettime(&tv);
> +	/* Prefill */
> +	if (s->work.repeats) {
> +		unsigned int can_prefill = min(inflight, s->work.repeats);
>   
> -		subm_exec(s);
> +		for (i = 0; i < can_prefill; i++)
> +			subm_exec_slot(s, i % inflight);
> +		submitted = can_prefill;
> +	}
>   
> -		subm_wait(s, INT64_MAX);
> +	/* Process completions in order: sample i -> slot (i % inflight) */
> +	for (i = 0; i < s->work.repeats; ++i) {
> +		unsigned int slot = i % inflight;
>   
> +		igt_gettime(&tv);
> +		subm_wait_slot(s, slot, INT64_MAX);
>   		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
>   
> -		if (!subm_is_work_complete(s)) {
> +		if (!subm_is_work_complete(s, slot)) {
>   			stats->num_early_finish++;
>   
>   			igt_debug("[%s] subm #%d early_finish=%u\n",
> @@ -183,6 +227,14 @@ static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
>   			if (subm_is_exec_queue_banned(s))
>   				break;
>   		}
> +
> +		/* Keep the pipeline full */
> +		if (submitted < s->work.repeats) {
> +			unsigned int next_slot = submitted % inflight;
> +
> +			subm_exec_slot(s, next_slot);
> +			submitted++;
> +		}
>   	}
>   
>   	igt_gettime(&tv);
> @@ -607,7 +659,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance);
> +			  xe_engine(vf_fd, 0)->instance, 1);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
>   					.duration_ms = job_sched_params.duration_ms,
> @@ -702,7 +754,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance);
> +			  xe_engine(vf_fd, 0)->instance, 1);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
>   					.duration_ms = duration_ms,
