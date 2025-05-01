Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1FBC369DC
	for <igt-dev@archiver.kernel.org>; Thu,  1 May 2025 18:26:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A644010E873;
	Thu,  1 May 2025 18:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="epS4afRI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9F010E873
 for <igt-dev@lists.freedesktop.org>; Thu,  1 May 2025 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746123990; x=1777659990;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gnqub6zhjzJlc2ob909CA23ChXSJeiS72B/9rDH6nrs=;
 b=epS4afRINJMLY/0nwKKIZq81/GLyuQmMwt220cBayBkj4Fh7DYlQEIgs
 xC4uH2gp7guEoKFbuNC6mzzgTdJxMvk9zIhwY1XDRXNRpuI0m3SimexdI
 5Rnz93Y8d/6dhJUpIueugTQkjsNOtqQC9dye3kM85vgad8y53jJtRV7lM
 f8Zps97pI5MdCIwfFJyt1RtRSgfdL+oOYqjrtE3SLjGNA1a+hXtRvOTz0
 dIUQOSj77HLxRnSsD1aw88nKvj7QvjB24BokJ3laX4zJ2FFowyV3mpaQI
 ejvPD12tdDZwOSOxJz0FrKiLUkj6vjHCNKqkEQY54CQMRSjEGxguRN4uB g==;
X-CSE-ConnectionGUID: 067mNy6tRq2lMbFMATsWRw==
X-CSE-MsgGUID: rS+3FlydTUmutP9RQMvPag==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47816609"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47816609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 11:26:28 -0700
X-CSE-ConnectionGUID: HCN65M/qSs2UK0MOepjSRQ==
X-CSE-MsgGUID: yBH0q/9NTJirlvqqOwG0vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="139624030"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 11:26:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 11:26:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 11:26:26 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 11:26:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dh+wOvzmYyJ8iy8+xdxzd0jpuGV+DFz3AcLOcN/iqSaVECvRovsW5UMiFx7d1qsuBtG6xATp9d0aZq0wfE6PztnayHnMclQPFh9oDMQiW74C5MYH25jzNK+sK4nnd3SEZr+TfZcv2f0jLcZJYaki/z56ynZAK2cXCHOSZF8xHc/U/Rfdn6cMrxWVDO1t+ZSxqUIT2QrJWkhPiqj8pqSRVKIhYGxAEaBqLE7HVKNaKD/Ccla4zKLOZvmIAMDsnI1rRIeum6S3PsniQVL6dkGJfgtvyFcq6U2YHIUDGVdabp3dhkIxDsYoQ33U06y6GfFG1BmdCOjJ3aIft/6ZyPMq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBAoY/gpdAJFNquvyxzeCqeDGmkAE5t2nwhuh+yJTSA=;
 b=hiHxK631STCNYBhlDbYHwOCgDuRwfK5LW3PSyNC5HIq1FjE8W2v7pUF2lUba62IdycNozy2WxjRuDmd6mCBJAvNC7+zUGYicCoLchSca97o4d8ld6qmUNA9cD2KRmeQQkye64qBg1iV0+ofy0oallU/GrZVlYx3llaCO2F1TXpKNKICPUpKkCVYQBMktJ7sQ+JH28bqr9iRAy0AjSU9U5hlQ9IQ8nlD6vMspYlTIOCpLTJJNVQMIuePvBqB4SEA0VmYs73B1+qT1b/3O/Am0cuxbSgDdqe/D1E1wa+9Cyz/sAYYX3ETeePXY+V5IR9feJKt4UhN/bLdro1MrVi4J4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by CH0PR11MB8213.namprd11.prod.outlook.com (2603:10b6:610:18b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 18:26:07 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%4]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 18:26:06 +0000
Message-ID: <df973c18-bbf8-4c71-9f18-d9c6a2402fb8@intel.com>
Date: Thu, 1 May 2025 23:55:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_multiple: Add clear skip message
 for skips
To: <igt-dev@lists.freedesktop.org>
References: <20250430054326.489396-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250430054326.489396-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0091.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::14) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|CH0PR11MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 96506a5a-a452-4507-ec4c-08dd88dda344
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmZ3VDZkcVNURS9JSGNLUllPWTh6WkpJa2JLT1RUVmVRMHB6dHB1RXcvNWpK?=
 =?utf-8?B?VUtNejJ6bXEwQzUwajFNenZuRElMT3RDZCtNM082SFNEdTI5Y1FxbE1lOVMx?=
 =?utf-8?B?UHY2dEpBekVLTjZ6SUdQRlUwNkJxTjBCZURPQXRXcmt1OXFiUS9aTW5jMmZI?=
 =?utf-8?B?NERCblBmdjdxMTBCMEpGalNHUzdRRFFTR2lCS1dDdElhakxubG5GSE5hTUJX?=
 =?utf-8?B?MnY5VVhxU0J1enAxdzQvL1F2Y0RERWxFL3NhNlRFa05aTkd2c3F1TGl3V240?=
 =?utf-8?B?ZlZjKzFlUGxHZzBmSGtwcFZmZTNXYUI1SlpvVXh2Um1iU1BWNVVYMStTRk9R?=
 =?utf-8?B?UVpoVUhSL045NzFFMGVNbGhMTy83eWd2dU1LcDhzbms2K0thMENSNHM0TzVM?=
 =?utf-8?B?bG8vVStwS0kzVTVHR1hJalpoRURGUFlEK3pCNzdlTXdBYmRlV050aEl4c21n?=
 =?utf-8?B?dDBEY2RMN3VweExkRkJWcUtNeUVJeDkxU0V0YjhVRXdPald4OHUyaFFFdkF2?=
 =?utf-8?B?UWh6cnNsM0szZklQT0t5MWNpSzd6QksvN2x6WnhFUWwzQWxtWWRCSVJjR0Jp?=
 =?utf-8?B?Zmw5dmJwNExDTWhEdHRpT2NzUGRVSHhCbFBQZ20vWmdkN1FjYlBxSzBVRzZx?=
 =?utf-8?B?a0V4ZnJhQXRtYllBdWplQitveHJXc2dRZktqb3k2RHVsdFI4SjRoWlJpckNK?=
 =?utf-8?B?b00wQzdlRHNtek8vNVduaHVsQ0JGblZMblRBaFBxRXZ4Z3lpdXBWdTVtNmFr?=
 =?utf-8?B?QXNjQm1hckZYa0pnV09xYTZYV2NtZUp4WTg3d1JKVDNubDZlNzVaSkovQVov?=
 =?utf-8?B?b0tCRDdLWlNkUzllQUdZckk2MXVxcHNMTVFZSGRqSWdEbHY4TW11ZG51M3lj?=
 =?utf-8?B?ZDhFcjM0aG5HOVc4MmlzVjlFWmlyNXlKd2hQK3FsTDgvWWc5dklORnh2YWdJ?=
 =?utf-8?B?TnpodVdEdXVSdmU2L0NHY3pBd00wY3RxM2Q5ZW9KY0l3TmpEMzBRQXdMOE1Z?=
 =?utf-8?B?eEJUak5UR25Rb3dmbjBYWktVQWdzZ2IyZ21BWDNLbTVmM05OUDVSSTJrQkw4?=
 =?utf-8?B?ZnFnUGx2aVF1R0hCYWdqNk9LSmpDZXErN3lDdXVpUTBPVWxXb1BBMk16WjN3?=
 =?utf-8?B?SGtua3JtaW40OExidU5jL0o1Zyt3SVJsbEtpS2VqeFVpLzlDZUhPQXN6MEdl?=
 =?utf-8?B?MlhLV3gvakliKzJBaHJ5NDVDNVdBUlAvUzhEbVBtQVNHNEQwbHA4LzFLLzNJ?=
 =?utf-8?B?N1YxaC9nY2RNRzNXWTM2RlE3ZHVYaWlEakl0aDJ2RVBQSEUyT1ZhSU4yeks1?=
 =?utf-8?B?a2VTaVhjUGZNS3ZqSmVMeTVNSXUwTnY4VGRPbEZ5NXdOdE1xalhHK1BhNkxR?=
 =?utf-8?B?d3IreU1UY2J2NTR3dE4vY25YNDhFRW1DSWtHQWVpMVBuUHM1ZHl1ZTArM1Vo?=
 =?utf-8?B?VjRmeStLMkV1MTh2TnUyL3U1MkV6NVZUZzdiV0xHWEkwMThIcEE5ZUtCS1BL?=
 =?utf-8?B?bi9yYUxnc2ZhL01xdVpYZzhseXBWVGc4dlBTSFd0M2pmUkVRQlJ5Q1lNYjZm?=
 =?utf-8?B?YktUM1BQeHNiVDZhZngyRXhqY1JWNlVOa0Z3Mit6ZTJtcFcxTkR3SmlOZVRo?=
 =?utf-8?B?cEh2MWFEZDFoYXRPN0dYWXkrQ3pqLzRvZlp0UlBHVk1QczRFYlM0NjYzc0o2?=
 =?utf-8?B?MTBXZmdsbVdNVHRsaDV4RjJ6N0JFUU5RLy9MTFlwSU9kQmVkbkUzb296MENZ?=
 =?utf-8?B?cjlHcStWOWMvT0VHTEd3emgvc2FweC9rVzA4KzJRYVlUaTBIM3pSa05LbTd0?=
 =?utf-8?B?cmwzVlZwcjByNE5FUkdQamMreFkrS1JmUFZxUWNENjBhUkpFTktSam92Mmxj?=
 =?utf-8?B?K01jREtQUEM2TmwrdEV4WldDMmZua1NhWHREdjkrZkJvYVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVoyTGt6eGpFUU5iSlh6K05VUm1pQU5WZDlzdWl6aWpKWFFSVFZyTUhCR2N2?=
 =?utf-8?B?Vm54TVF4NytLOTBwaUZLZGdMbG56dzZBYkFONndrZXZoazhEaGJVdDdQV3ZI?=
 =?utf-8?B?OUtpRW52OWgveGxNeURQbDVUeW03SFBJenRFR1Mrak5yUFpJYmxzWHhNSWUz?=
 =?utf-8?B?WUdKQ1g4WHlDY3gvcmd0S3lFWGZaVDVkTjZGZi9ZMUpZcWFBbGFwNTQ4ck5B?=
 =?utf-8?B?cGc2MVZRZ0tTQklVN0ZJWGszc1I1RThvUTJDbHdBZDhFcUhaWGRwY2pESWRX?=
 =?utf-8?B?eGpRa2ticktZWHRiYkxYMWxsU0Nvb0lSekYyaG1jZnBlVm8zV3hkeDZ2SkJ6?=
 =?utf-8?B?Y2hYN2h3ZGZWQ2ZHY0c3M0E4MVlNUXo1Wng0VTJ6NkZaZjV5OVZoYUV2eFhP?=
 =?utf-8?B?WmN0aElhSUs4NGRqZ0tULy9Jb3RJRXJMeHI4Nk0zSXJGZ01JUEg5cXRNak9t?=
 =?utf-8?B?bGg4YVBVUFJabGNpMkY0d1lXaWxmV0RnLzVCNzRJRGtxWmpaQTdVUFNJdmpi?=
 =?utf-8?B?Wk5qbUJyVWtjSGhvQnU0NXNiZ2MvWE9TSDlEZHEzRi9tZnZFVTN6ci9mV3RI?=
 =?utf-8?B?OWRucnRQSS8yU1VBcUVQWXVyVXhvMmcxSS9pVU5tOTlBRHpKRC9uSDEyMUg2?=
 =?utf-8?B?dEhFVzNTUnUxQ2t0RjRyNHVOU3lvWnFyRmtISW1Fa3l3SzRMaFkzOXUzdzdE?=
 =?utf-8?B?QTBDNTBjdGowMWN1cndHY0phemFBekZzcDlXYXFiNEpsTGluM2x1Y1VCL2gx?=
 =?utf-8?B?UmJyaGNUZmxhenhGS1hCSW5mcmFLRnh3d2ZKYzdJTnFRRXlzNDEzb2x5WThO?=
 =?utf-8?B?NU1VbWV1Zm5LZGJ2c2V2YmFtZXVENXNNemc1QVZnT2pJRjlKZWV0UEtGc3J4?=
 =?utf-8?B?Nm5aOEVnQmJlK3hPbDh0OXVzdUlOYUtTeE82SkR5Q2RlMTBPR1licmlZN2pV?=
 =?utf-8?B?N2FnallNTm11VDdGUzhCTm9ZUEg1Y2c5eE45c1FuMWVaL2ZESVBYUHlWUUxs?=
 =?utf-8?B?cllPV1pwNGYyaTA0VGdDeVlsR1FZYnkwVExJM3o1OGxkZHFOem1BZXVXamUv?=
 =?utf-8?B?SUQraG8zOTQ3S0M5SXBDTjJWZTB5TzZNODFBQnJGZy9kWW9hcEY1Y09oWmdX?=
 =?utf-8?B?MTEyaWI5VjFQN3ZEclYxUFlVZW8rek1iMzRQdFFDQnYvb21HRFFINmdSWFhj?=
 =?utf-8?B?SzVtSHVGYnZ4RjFqVkpRZjc0bE5XKzFJR2l4UTBiVFZmSHhQM0c4SGkyVjdH?=
 =?utf-8?B?RTlpWlJScGxNMXFHYVZ3OEJVUVFPbUtDdzNCcGx1RDgrbjhUeU5BNUhzcXFB?=
 =?utf-8?B?dE85TGVhVCs4Y3I5RFBoSTU5b204aEpwV0RLMEZtZlVjUXQyYXNyeDBJSEc3?=
 =?utf-8?B?TUhrZFBsZ0xDMGlsVVpUeGhTYUZrSXlTdW14djlITDRza0lZTnNSUHg0S2lz?=
 =?utf-8?B?eUFEWll4TFp4ZFlxYVV6dWpNKzIxNXljbVVEaGh3VHRjeDZzYVhxWTAzV1di?=
 =?utf-8?B?MkRlbE42M2ZwZHNWcEFTeGd5SWltTUlMd2NlRmpNaWMyMm93UWpTMncxSWdv?=
 =?utf-8?B?MDZqR0JYekxrU2FxeDg4Tno4V01sU3hndzNtTytoSXlXRmlUb1pnaENpc2Jo?=
 =?utf-8?B?Mm1KRTNLWEl1R1dZZUJJSGNmWmRUd29JSjZnVnl3OVBPNnpmV2RDSHFmWWR4?=
 =?utf-8?B?WFpSVHVHTURQcE9Fd0JxNnArTXVSOWxlWmh2RmVkY1Y1d1lEZWswT1FaMmlU?=
 =?utf-8?B?TTJLUytHak85akhUMlhvRU5IdU1IdjJGUU9XUXFDc250ZDRxSjNCajdCaStx?=
 =?utf-8?B?UFA3L2NVaFQzaTEvaWI0dkNqamtSMGMzeUpnNUFzNTVVZEFaSE5ZY01CSTVY?=
 =?utf-8?B?c0Rxa2NJWlZYNUdrVVRoWE40ZDJ5QXFaWTBJSk1BNW8zTGRmZjk2cTVFRENX?=
 =?utf-8?B?dHNTNjZyNGN0Qmp0ZEdEbVVWUG9NLytZOVZJS0IrOXpyYlcrV1hzNlhEYUJt?=
 =?utf-8?B?TkpMQjRoYmVQdkJ2R2lTaVNNTFRQQ3RFUGd3UE04dllXalViZjRaeU9ySThq?=
 =?utf-8?B?ejNMdVlqQU1LdmVobVpqVjZORUl4TEVyV1JoQUIweDdGNXBlTUp2QzV3OXpk?=
 =?utf-8?B?cE01c1k3K0RxUjJFMytxUlBPRkpCNEdsd3dVUytsbE1aSmdxUEwrRDRRQW51?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96506a5a-a452-4507-ec4c-08dd88dda344
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:26:06.8217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tR2Xtx1D+JMXNLnZKm1fnlcBEP4krKpXlC9qwtGxzW0XcIJycq6M7Er4s2HgOgpLvlvhZkSafLgRqMGQaugJ8FAloVYYfM5ykot4avlD4fw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8213
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

On 4/30/2025 11:13 AM, Pranay Samala wrote:
> Add a check to skip the subtest when the required DRM modifier
> is not supported. This avoids unnecessary test skips and
> improves clarity by providing a proper skip message.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_plane_multiple.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index ebb026726..4e6ca780a 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -504,14 +504,14 @@ static void test_plane_position_2_display(data_t *data, enum pipe pipe1, enum pi
>   	for_each_connected_output_local((display), (output)) \
>   		for_each_if(igt_pipe_connector_valid((pipe), (output)))
>   
> -static void run_2_display_test(data_t *data, uint64_t modifier)
> +static void run_2_display_test(data_t *data, uint64_t modifier, const char *name)
>   {
>   	enum pipe pipe1, pipe2;
>   	igt_output_t *output1, *output2;
>   	igt_display_t *display = &data->display;
>   
> -	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
> -		return;
> +	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
> +		      "%s modifier is not supported\n", name);
>   
>   	igt_display_reset(display);
>   
> @@ -547,14 +547,14 @@ static void run_2_display_test(data_t *data, uint64_t modifier)
>   	}
>   }
>   
> -static void run_test(data_t *data, uint64_t modifier)
> +static void run_test(data_t *data, uint64_t modifier, const char *name)
>   {
>   	enum pipe pipe;
>   	igt_output_t *output;
>   	igt_display_t *display = &data->display;
>   
> -	if (!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier))
> -		return;
> +	igt_skip_on_f(!igt_display_has_format_mod(display, DRM_FORMAT_XRGB8888, modifier),
> +		      "%s modifier is not supported\n", name);
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
>   		igt_display_reset(display);
> @@ -647,7 +647,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			     "reflected immediately after each commit.");
>   
>   		igt_subtest_with_dynamic(subtests[i].name)
> -			run_test(&data, subtests[i].modifier);
> +			run_test(&data, subtests[i].modifier, subtests[i].name);
>   	}
>   
>   	for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
> @@ -660,7 +660,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   
>   			igt_require(valid_outputs > 1);
>   
> -			run_2_display_test(&data, subtests[i].modifier);
> +			run_2_display_test(&data, subtests[i].modifier, subtests[i].name);
>   		}
>   	}
This patch commit subject and message are written to skip the message 
change. The function parameter change is not related to this patch. 
Split the function parameter changes and function call into different 
patche.
>   
