Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C7CC02185
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 08:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1092610E373;
	Mon, 20 Jan 2025 08:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npvL0mRX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FFE110E373
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 08:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737363143; x=1768899143;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FKpYtP+GVvDamG8/GG3j8GdQRE4Zu7RDZ9y12AJAbDA=;
 b=npvL0mRXXDrxAG0PL7EmwUw1l90MDXeeUI/NXJcDL4HwVHn2rc2CW/VZ
 OuzxcEu2etADzXDe3wUxDXZmuX4RtLgziQX5IYTYhmJQs/rQn2xy+xSe6
 BZEDo1K7no1/c8IHQ4h0sUuKFDXAEqNk2Qvm0t/oWD/d3n8imgWUnm+2l
 Gznrlh0CQNE40jzEYP73ZRpubjfhOuGHtZSc+DWiYhkM3DYxWsbXY6GNZ
 Sd8nProA06UVMcL7L15R/1cjnQNsYUi1QmBVmTqwuezKSFJiDCYoH+AY2
 5cpjmV1Ivx0QIj2+5sbbmjIVA5gm6Ak3YQGk1Ix/elwuAwLZlGGVUdKYa w==;
X-CSE-ConnectionGUID: B2i39VSaTYybSsJGnbE1BA==
X-CSE-MsgGUID: Ub2UcJ6sR/WUZ7jJsCqm8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="55140313"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="55140313"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 00:52:22 -0800
X-CSE-ConnectionGUID: ApMVxN11T8uF0DVIv2wRtw==
X-CSE-MsgGUID: SqTd3iU5S9K2Z9bOwALn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137337375"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 00:52:21 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 00:52:21 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 00:52:21 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 00:52:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w3ilZqrVpQWg0pmTD136TuKxt440lxDtFpzmobvtKPO5YoPOcCyhYI9ZhDhK8K2nKt/4ZiZ8k43YuYnBnnS+3xVyY3IxkzbjwJmNjJgZVq7R6HIpXiQDPWkbFzB0CN9A3ome1hdObUxkHtXrbTkFGxjUe0FdpdNuB2IVyU7bo/TuFvFz+t+GYMtS9zksAQAPhP//i+XRbbmsKjuNOZvFW3dkHmoGpwk3FKPQEOrWYBX8yqkFBHBpRFY/ens4E2pxlxI891VMAT9LsNh8OlYMQLnlZY9JvfyMV3gl2boJB1VIIMFcscepmzrmsWgKlf2b9TFYyOJR5xML+Mwb2nSTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l9LfFIMdr5bGmgiftGWMDP/2h3/DzsTt1s+7lFqF/ak=;
 b=jAN7wcytHNdm+y8V2P9WsewVh/Nz8MiKwVpzIYl8Qn4ZCf0AP3jy2BgKB/M82pKS9ZdCBw9QIyx0Ad0glDlMwB41yvVr4YYV/deFUC1lOBUi8fCtfDzcYHbPCdfviiYkq5SE6F+dioLFnCXD5H7jXyxQkcdpsT/G/K+jhMNZLyIcaSZnDvLyfteHpPwkflZmc+oUzXi3LK0DZsZyIbRBN1XjUDiGi9pNCw4NmJZX1xpCa5AGxge01sVzfXgftASy+59AocNsRQuw3f9ByD3Q9KWAafsjHRE5HvXz6sJ+h7PTZJOG3JeNgamiVrXbRJ7WEaIBtMZ8xgHLjUb4HOI7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ2PR11MB7456.namprd11.prod.outlook.com (2603:10b6:a03:4cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Mon, 20 Jan
 2025 08:52:18 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:52:18 +0000
Date: Mon, 20 Jan 2025 09:52:10 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_mmio_send_recv
Message-ID: <Z44OryU2M081xSH-@fdugast-desk>
References: <20250120083410.26904-1-satyanarayana.k.v.p@intel.com>
 <20250120083410.26904-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120083410.26904-2-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR0502CA0025.eurprd05.prod.outlook.com
 (2603:10a6:803:1::38) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ2PR11MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: e1faa651-e4c7-454b-f11a-08dd392fbefd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bDdZMnhYZ3J6dkJ6WTJpRktJa1JJa21WNVlSd1V5M0RYWS9mQWhkY2RSUUV5?=
 =?utf-8?B?UDNyN3B2MU5rVnRaVlY3eFZ4ZlZKUnlVS1F5NEZrTzYvSGlhbG9ISnU2d085?=
 =?utf-8?B?b0F1SXJwaXhEeitwNVd3c1pYeHZkK1lvbjZxYXg3VzRmcnV4WFE4ZE9ValdY?=
 =?utf-8?B?NWltT01pVU5iZTFlSnVhRDEyaXdHVDZTcEgyeWFMVElEODljWmUrNVNSU2tS?=
 =?utf-8?B?d1hUTjBvbUI4dllDMFZjQnc1NGErTTRTWUt1RmloYkJ3WGVyU0F1OXF3anh6?=
 =?utf-8?B?c2htbzRtb2JtVXhGOWw4U1ZIZTNyVlRUdmplaXF5WEVNd3l4b0JqMTJ5UU92?=
 =?utf-8?B?R1M0eWIxK0h5SDREUE9JV3h2ZGJ6N2dXRXk1M3BuUEk3QW1oKzdnb0wwdzA0?=
 =?utf-8?B?VmNwVlJVZTJyWmRvNFN5WTB6K1pibG1aNnh0VEN5WG1ScFllR3J2YTVSR1dW?=
 =?utf-8?B?eDVVbWJKQWZPMUtURkliamp4ZHJTZ0h1TTVtS0lXZTRCeUJ6RS9uTyt3SU4w?=
 =?utf-8?B?OGdNdytUcUlzcnBpSVdncUs0Z1dZTG15ZTBwZUNjbTNqOGpFdzQvWWVxQ1RG?=
 =?utf-8?B?ekZidW9nMy9aZmVIY3B3VUdDMUdqWnpTb2hBdnBHZWxJLzB0UjlFeFFoU3N1?=
 =?utf-8?B?WkZkc1hIRk0wR3h3UDFFSDRuTFF5TFhzSTRkNmhQN00veGVhRHZ6UDdxb1Bx?=
 =?utf-8?B?c3lubld0TXplRE1uYWpJU1hCMVJtdGJBM0NDVFBwampueEpaOFlrbi93dlNC?=
 =?utf-8?B?cUlFdEJuK0MwZ1lmUm1RS2I4THhwNXUwWFJxcWd1a0xaWXZkZ1luQkZra3Rl?=
 =?utf-8?B?NG5QNDRrMnhWbG93QmFQdldhVlJpanBhVFlCOGJGRDBMeDkrMXVUN1hGNXVx?=
 =?utf-8?B?dDFMWm91SExtSm8xcXp0SXVBZnZXQVNyYzZCWXpJR1FXb2RZRjJKV1BDTnZa?=
 =?utf-8?B?YmNOYzRPNjhtdEc1UGNKV0t4TkF2cEJSd290UUtoOEpVa210OWVrTzhCdXdR?=
 =?utf-8?B?NTltMi80VWNZUTNXbGZ2WFBvRGFzcnNJbHhrbkNoWTBxVmMzRUZJZHpCeHJJ?=
 =?utf-8?B?aDZCZVFmRjJMVVd0L2Z6Rkd0WGJ1cEJCajYvKzJtL3ZxNXlJMmdEUFNlMXA4?=
 =?utf-8?B?S2RYOFc3TnhmODEwNVl1Y2Q2OUgzNDUzZ0htbGZQZTR3cjB5Rmx0bVU3N3RB?=
 =?utf-8?B?WksrSldhd2dDMkxJKzlhcGo5TUJqK2o5MU5oUjlDU3FjMHlnVGNORGVhYTBY?=
 =?utf-8?B?ZDlJbFVsRWFrK0YzSnlGaDF5OTZJUHJSTk9iUHJlaThRM00wRmxTWHBvdkJ3?=
 =?utf-8?B?WUFWU2dydmJaQk5rT0pscTJ2eDFHZVBwN1FaYW4xVktkOUFWOXRjRTFQaENQ?=
 =?utf-8?B?bXZ3UEJpa0FLTXpJeGw2NDlqOWp0SVB3c3lLcm5UUTJjUDJod3V3b3NPOGJX?=
 =?utf-8?B?VlRlRVRCdnY3aDFvMWlNL2tma3NSNDA2LzR3R3B2QkRYZktDK0VRcEdwdnJR?=
 =?utf-8?B?MlV4dHZ6NlRiVThsZnJNbUdrbW1yc3pDQTVPK0lMMkRNTWFMYktucDlzTHhs?=
 =?utf-8?B?N3hCbVVucnJZRk15ODcybHJGSFFNMHRQTTBPcXY0R2tNdytPNFNsNEhBUVNl?=
 =?utf-8?B?YTgrMTI4M3UxMGM3WjQ5a2ExZWxOcmlNcjdsQ3l3cWIrNGNGQjJnUHpNZHZD?=
 =?utf-8?B?VS9iWi8wazdrM2NaaU5NRFdVejBLQmRXSGJQeXFPaDRzYUlUN2NBTm9uRmVF?=
 =?utf-8?B?ZG1TemNMaDJUZzh6ODVGRk9IR0lLL3V6M3RKVE0rQS9YK21ocXhOcWtWUHJr?=
 =?utf-8?B?ak1KdHBCbVhoVkUxai94TzNkRnFHZ1JhM1JiK3ZsS2tWYWc1VzFLSExEOUFO?=
 =?utf-8?Q?2qKEeQ3fthARr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2tGdnY2UWhFTktYRlpEOUNnYXp4eGsyQXkzTng3aHA3cTU4Nk9GaVRKeWNG?=
 =?utf-8?B?Nk95TnpQalk0Zy9nbDNnSmNuNjgyOTA4WVhhL0Ntelc1a2dTSnI3MWNOazZY?=
 =?utf-8?B?RE9YZHBleTlMdEpHcG11bWdHMmJtR2dJQTg4c3Z0U2pQanB4aUs1NDN5WXVF?=
 =?utf-8?B?V2l2SkZ4VXd6elZNZTdRK0NleWtKT1dvRnNaa0hSVmRuWUVSdWdRMlQ2NVpa?=
 =?utf-8?B?b0Rydm82MG80M2NZYi9KcFh4eUV5QXM2VTRFd2RUbEdOb3JLL09OMFA2RGg3?=
 =?utf-8?B?NzIwa21XaTZBdW44bDhHOU11YzJqT2QvYlMrSy96QWRCWlNtOGlENEg3V0NM?=
 =?utf-8?B?Z1dFZ1dvSHhjdHFxM1FsNW9yRkdoaU1LaWRIMWdzc2kwdzBEaTFaZzU1aHY1?=
 =?utf-8?B?Vi9Ra29HSndrN2d6cmNyMWtMLzdtSXpZbG5aZDFZRWRzbTF0MW8vVVcxZ29B?=
 =?utf-8?B?eEQrbi9sVGVvczNoMjdDakI3S1VyejVBeXFTdUdMcEU0b1pwVmpqRllsdjZy?=
 =?utf-8?B?TEpjNGlvc2RYM05mWk5ld1JXWE5hSEdNSHhramVYL0VVMk44d1o0QmZzNmRR?=
 =?utf-8?B?NzhZQVVXT0V5YUtEL2NEc04zZUxCTlF1WTYwbmE3Si9rK1gxUk5mYkE4RVp5?=
 =?utf-8?B?VEl5YUY4cHE5TDAzdm5NVXNDQzJyYkxSUjl6YnZ0MHpEY050SVZBZDZVbVQ2?=
 =?utf-8?B?Sk5vTUkzMVlob1BYLzRDNnFMS3h3Z1kyaTNGaXEzWklubmJJZzZYdjZ0cXlO?=
 =?utf-8?B?SWUwRFdOOHJPMHVvdk5jaUp4bDlsUFpCOTJvY2VndTE0T05xdGFYYlMyemdH?=
 =?utf-8?B?aFFINVhQOWtZajZoTlRFTHYzeEF0UEZDRFlOL0hUbnI1cUxRbVVQYm8wYjUz?=
 =?utf-8?B?dUx3czNHeGFaTUlSeGdNY0paVFlnalQ2M2NiUEc3Rk9tQmNBTzVZUkZVcjB1?=
 =?utf-8?B?NU9TZnNUTnNJQlAzVDl4TmFjQ0dBZi9YMUtJTUZ5dFp3Z01CekNtMVFsWUk4?=
 =?utf-8?B?VGVyYmRDUkovK05jRXlZamliQmhPOXhPNGt5anlOUXZSVnFJSHREdWJRWlMv?=
 =?utf-8?B?MENLWmRhelQxY1R5V0hVT0p3M2dTa0lwZVRNMmwwcDdreGlrbkU1b1E4aEpJ?=
 =?utf-8?B?cEFhbnJBR2QwaksxNkVXU3JvQUJRM2pNbUdncWdZQkhEb29iT0ppN2t4Y0Fv?=
 =?utf-8?B?Tlh1R1doa1QwbmhwVHhqOWVwRkdCK1RqZi81RGRhcDBQbVVDVlZCN1d6dEZG?=
 =?utf-8?B?WFA5Mnk0UmtYTHA4YnJNdnQ2K1BjUzVzVzhDQVpNNWdoWWdpdHZRdkFiRExj?=
 =?utf-8?B?SjJjZzFZWldGc3p1aHZ5TlNpeHNNQSt0YkIvTUswbEcvbHRXZXM1cy96d3pZ?=
 =?utf-8?B?cVZ0NHprR1I3R0FpVVU4K3JoT1dVWlNaK0thNmc1S0RPdVczODhyWlhEK3F3?=
 =?utf-8?B?RzhMcXp5ME9YMldiYVRjbzg3eXh4QjNjRzFzNzgxcnBORzZvcE94dzVsanpF?=
 =?utf-8?B?SzkyR0dwRHBPS0txYlVHcGJkeVREUE9BNFVESnpjOGJtcldmMnNNdnJYMG9n?=
 =?utf-8?B?QjZMeUlGcEoxZXpVcW5mRnBKV1djQjBoS3B5OU9Ub1VMaU5Ia3dJMjJTdktl?=
 =?utf-8?B?NlVKbnBFZGg5RSs0VytNem1PajY5VXIydUkwaWRKUzBJVTRlRFVLcnplVy9h?=
 =?utf-8?B?ZXczL0tVZEZKc2oxS0Vwc1RJQ1RCYWZCVW12TkJFczN3aXYrZHVhZktnMDJi?=
 =?utf-8?B?UlJ1U1V1VytmWmdhN0kvd3J2NjkwSHhiTzN2bm05TkEzSUlCQ1FnZExOeW1h?=
 =?utf-8?B?WC9tbE1BTGJLTjh6L1RBbnByREZWc3Z2MEJyK2NWaVpMUU5hT3ZCMXRSTUd4?=
 =?utf-8?B?L3ZUajZkVmRRN1ltTDhTbldvVUJ3SVpHTFljRzNFb3VPVEdTS2pERTl3aFVF?=
 =?utf-8?B?WTY0M3dyeEh1Yy8yV0hjTEpyS2tuT0dKVXJHVVUxMWQ1Wjczb0JLcXNXTGRG?=
 =?utf-8?B?Uk5jV21SVVZkQjJ0YVl4WUpIRlpXM211aEhSaXdwa0E5SFBNcVJPZ01BTk8w?=
 =?utf-8?B?cnJEYUxKVXBrOVNRdlBpMGE1MU1jblhFbGhMcHFJb20rNnhBRGZZaFVnZ2lE?=
 =?utf-8?B?aHorOHY4RnFKeXNkWDkzWWtOejJpMDF2UHJFQnQyN2hMc1l2UXpKMFVYUTFS?=
 =?utf-8?B?S3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1faa651-e4c7-454b-f11a-08dd392fbefd
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:52:18.8244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJMVR/iuOuOgxiapf+dPPE6GV6kqijJmoUXTDDhSkduOl5yKhOlS6CbyngPU53kU/XC2BWBCE0hv/G8iZYW+C5McmR272Gi6huhLJd51ufM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7456
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

On Mon, Jan 20, 2025 at 02:04:09PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at probe time when executing xe_guc_mmio_send_recv() so that
> more code paths are tested, such as error handling and unwinding.
> 
> Error can be injected using:
> igt@xe_fault_injection@inject-fault-probe-function-xe_guc_mmio_send_recv
> 
> v2: Sorted the entry xe_guc_mmio_send_recv in inject-fault-probe-function-* list
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 7ae941367..3a0e2aa29 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -163,6 +163,7 @@ static void set_retval(const char function_name[], long long retval)
>   * @xe_guc_ads_init:		xe_guc_ads_init
>   * @xe_guc_ct_init:		xe_guc_ct_init
>   * @xe_guc_log_init:		xe_guc_log_init
> + * @xe_guc_mmio_send_recv:     xe_guc_mmio_send_recv
>   * @xe_guc_relay_init:		xe_guc_relay_init
>   * @xe_pm_init_early:		xe_pm_init_early
>   * @xe_sriov_init:		xe_sriov_init
> @@ -294,6 +295,7 @@ igt_main
>  		{ "xe_guc_ads_init" },
>  		{ "xe_guc_ct_init" },
>  		{ "xe_guc_log_init" },
> +		{ "xe_guc_mmio_send_recv" },
>  		{ "xe_guc_relay_init" },
>  		{ "xe_pm_init_early" },
>  		{ "xe_sriov_init" },
> -- 
> 2.35.3
> 
