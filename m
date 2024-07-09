Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E52C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 05:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4C010E2A4;
	Tue,  9 Jul 2024 05:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E0OBIhd1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2C110E2A4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 05:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720504591; x=1752040591;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TpGKCXT8w/IjWxYk511nHAJPdzRLz4x0JidMD6bvLdA=;
 b=E0OBIhd1XoJ0q7XIB531tLNJYdUKU/jDygWEE3RfN2Tswu4vtO4Z/AoY
 WOxwCh379LhyZUoCIKL/vbxHDI+LWFAoF1PKqWRkoUMFGWb/pp5NGCQ8f
 v6R2+FxpgCgGuRRCS96cvM9puQYBB/X6XXVhf8q9RYq96IcNzEYFBoo7o
 FaJOtUyq+yEsB6DyCVcC5qozQ1rQUUZ8nIvSTpXwrrLdpDRy2+D+ceKDH
 jOIV3DMKhsqbbNUkLCnt/bNsSL0m50crfyiDKKKzfnL36RmhqGy9B7tNY
 F9X68lKYjTtGYZd5L61mJ50rapGT/Sdm+Dsp+UgmR70A/vVwgGrVKqJx6 w==;
X-CSE-ConnectionGUID: xeMZ/OzZQa2rPRH3XCS3sQ==
X-CSE-MsgGUID: +S1A2Bl+RvuZQF5GHZcjog==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17942366"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17942366"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 22:56:31 -0700
X-CSE-ConnectionGUID: 36WyPUdER6uortEH4GT1MA==
X-CSE-MsgGUID: nHJypIf3RXOQOQNw+bIvyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="48401584"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 22:56:32 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 22:56:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 22:56:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 22:56:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 22:56:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA5kFAvn7BodSBMgcKzfqvOGu1op0jh04InD/5o+EvKScgEpBoMMnj7BHpaievdjzepzvyRGzUUyi4VUYRJyIXJG9ERDa0ZXC5VCWzSETePAVGYCgs7VYnsYucSSWv7hJxzd1tdUlkQDtPRTkCISRoNTP1/btOR8An2AXsjq8y6IwyjIbdlOnjYzipO90mdRAIS8WCVhLFlKW/VcYsEXseD+36a6A0uOqSQJ0qxm5ZI0VocxLUrIEp8KEaoBbnGiBQlAF4w0EdMLvbl1+jBN2eLdP/XJxDdrZSL2zaXdFSOJBOLkfH7Xj9H+jxLPEu1hOzFe6usVFSL8CzikmAFHcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkomRzUWy9SMLcZInBka1lI8Ucinb7FKdz5xf/oT5vk=;
 b=I4COC/DLfp3d+kwMFhVUM6sPR7mscCUpUFKbICcstiTJq2NHaHF6HYlExLQQxRiSyoIUKW7IchQyU+qkN0IUwlFhOr35STOG5V5/3ySMsk4XTwpP/XYY7VcSYFVV2cHwYXGJ2VNsZxQRP4QA6jzXi5te4tmz+NBZtGPItg+biCUT3KpzSSqY8eU+FCegFkfSai5NXJ38AuH2THvbCdhlta+Mgt0/B7OM4uu+Q4iKoK4HLSSgaybGhzD10F6IGTWlVQz/w2XMIWrI4XZ62pAwgoBT1AVU18pukTiF1tFlOiYJqHR+t0WhCNgnLX99vZ6xjhe3FQ2IT2RAiuPW4WMqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 05:56:28 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 05:56:28 +0000
Message-ID: <062123df-dd21-4745-b6a7-bc83ac43ac24@intel.com>
Date: Tue, 9 Jul 2024 11:26:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] tests/intel/xe_pm: Install fw close exit
 handler before rpm tests
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <janga.rahul.kumar@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
 <20240708145607.272869-2-badal.nilawar@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240708145607.272869-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV3PR11MB8531:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ce8877c-23af-44f0-abc9-08dc9fdbdfbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WCt5SC9xcGxoNGxrMUc5ODNyZjZVbUlNOG5WL0Q4cHdENkZWMndJUk9sQ0lr?=
 =?utf-8?B?aTVTZ2FhNTRmdUYwS1kwcWFFbWVlLzBHNitmRXprWktXMFNKYXd6akl1VWNK?=
 =?utf-8?B?dSsvRnZnL2dsbG5wTFB1akNNakMvQUhOOWx0RUFWcDhoZnJFNnJ6MHpNTHlZ?=
 =?utf-8?B?SzNFbFg5ZXd0QkR4MW1EVlYrVG1ObGNNeXZWYkE0UHI1UGwxS2JzdlhHcGdr?=
 =?utf-8?B?aUNIeURrT2JIdXRoN2RJR1o0MHFTb29WU2RQaVVtekRSRlFGNFNjM0x3WHNr?=
 =?utf-8?B?WGZxbmdEc1dBN3dTWWNCQlF1M0QxcjhhMFNNYXp6K0Y3SkNvTEpKeDFMeERh?=
 =?utf-8?B?MStEeGMzSVVVZ3ZSWURMdHlRaW5qK1VGMFF2ZnN0aEMxWnJRQmlGWlp6Tkt3?=
 =?utf-8?B?cG1tUTBsWDVLaXl6Z2c0cmtJOXBrV3NMY29wbTZUaXpmYWM4Z0RKeFdBM1dV?=
 =?utf-8?B?YktnelFxYS8zTDIzMWYvMHN5Tm83NnRad1lRVkhjdHpNQWpqcllCU2RqMFgz?=
 =?utf-8?B?UTh3V0ZSek1rUy9jS2Q0Q1Y0RUVqZGFsdHEwMVBhdFRyRXlwNXZKTUNmVkow?=
 =?utf-8?B?Nm9BTmFTRHFmSnkyTmppTG90L1dMU1hWU29pSXJkK3dYcXEvNkRPVlFNR1Bo?=
 =?utf-8?B?WTFvbFdKd0s4S2RxVWhDY1dFdmVSOW54bXI4VUNMZHRiZzVTeG5aczlLL0wy?=
 =?utf-8?B?a2h1L0ROQXlaa0lzeFJ2MWVic2tuRHVsay9menQ0U2Zndis5cmtaZ2RWd3F6?=
 =?utf-8?B?Y3dtWkxNVkVzaytBRVBtYm1jOXVaODlGc0pjV0lzcmZGMTArd2J5ekdBQUc5?=
 =?utf-8?B?QURpNy83WVZ3MEhrTTltcHYzeXN1N09lN2xiZ2lrajh3NmdyeW9uWjhNNlhX?=
 =?utf-8?B?VlhrcFF2OEUyLzllQ05vSVI0S3ZwZGNoek95b2hOb2M2Uy9CRnhuWUMzcTZi?=
 =?utf-8?B?Zk05MmRLY25MZmdkU3lNYzNqUHBJQUx5Yk5CUUl3eXJkUDlXNjBHZ1ZFZHEx?=
 =?utf-8?B?UmUwTkpNMnpjWnJVaVhOT2wyL2hjMjM0L1pFRFM3emhuRVI4MjNTZkJHY290?=
 =?utf-8?B?dHVtZUFEY0N4TktTR2VQaHhWaDVYcnh2MGtnZTJYUDdqaXNqSjdORW8rcTY0?=
 =?utf-8?B?NVd5WE5RV0tLLzN3VlpHY2xWWllrYWsxb21KbGZpK1hXVzFreGN1OUtUcG40?=
 =?utf-8?B?NVRJcWRHZW5BUWJpRUhPV3I4YmRtMStWdnRzeHFLTmR1RmpGNXVlVnRSNDh2?=
 =?utf-8?B?K0VNTk9Lc1FhNTJRbURER2lPNFpTNThJblJKTUxMaFdpa010QW9jUDRUM2lH?=
 =?utf-8?B?aHhWYzhOOUhpRWVDd0RzblQ0NVlRY3ZjSWhJSG5sZ0Z6clc1R2o0NFBBTmVU?=
 =?utf-8?B?UUVTbVBHU0I5cXhndzFsVTZIZVIycHpraVlJR0V4VXJWTHlreVdPUzI2aUJP?=
 =?utf-8?B?RCs3UzVMWG02cWtNa3NyRWdPNzZUZ0FOTGpEUldLdTdtYmRYd0NrdmkrNkpP?=
 =?utf-8?B?am9zRlNZeC9UT0VIa2pqcUxYVEN1VXRxQ0hYK2p5NXdUR1I1ckU2WGJmWm9N?=
 =?utf-8?B?Z1FXZG9VRldyZXFWYlNEdVdEZEZyY0tLcEpjazR5ZFQ2WTBzdGRqZ2kxa3hL?=
 =?utf-8?B?WnhVZGYzVjloL3pNMG1xaWNKcENBMGRqRlhuanl4UG1hdkdQYzBPS3hTVndD?=
 =?utf-8?B?emlua1JsUG5ZT3VqVVJPQUdIMllOZHBJL25QVWR3elgyenVPQmNVTUpLT0dY?=
 =?utf-8?B?RmVLRlVwY09XS05wQVh0K1o3dWRvQXIzSWE5ZWZDNktZL2t5cXdRdXk0QUg2?=
 =?utf-8?B?cWFlWmlBWmF0N2syYk9adz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1Z0THhpQ3ZOZDJQdzNEZkhUSEFTL00vbitjNjYwWlcyeTN2U3J6TFpERmk2?=
 =?utf-8?B?bUowVmoyS092NTZFWFpOblZqYi9NeUVYNGxoVVUvTXZJS1hYUDBqUXRUTVlW?=
 =?utf-8?B?R09rUE5kUVNGUnpXWkgwaHV3WW5NZC8xc1AwZ1lvVFAybmRRb2hWNjdqcXJT?=
 =?utf-8?B?Z0tRTGVzMXBYM2ZZbWRqeDVueTFhK3JLTzdYVUpGcTNTcXZxMmtkOTUycmxI?=
 =?utf-8?B?L1JOSlNIdHl0b0c2aVUvS3BacVUxamVtSE1udy95ZTQ5OGtKTGd1UDZKRTQv?=
 =?utf-8?B?am9Hb2x5L1hCQXFGVFoyNjlaajVab2JqOVV5L1E3aWM4Z0RVdUZtdnN4alN2?=
 =?utf-8?B?TmpCYXJBYnpORzVnK3hYYTZLUkNla2UrK3h2cjlNTE1kTTNTcU1DQTNyeGQ5?=
 =?utf-8?B?SVk4ejNsNmc2ejY1b2E0VUZkbEVqOTN3VGc3Q1Q3dFBQOWlZTE04bWk3dllj?=
 =?utf-8?B?RDU1cG03c1NPY25xN2RHWDdTYnBXc09sWENEeHlaenJQNlZsWURsRGJGd0JK?=
 =?utf-8?B?RFpsZlNtMzZHalRMdGlhZUNqTGsyYzBMNDJJaHN6OXh5azhsQmZpZWlaMi9w?=
 =?utf-8?B?RDUzMkxZZ1BjLzc3S2FVQkQyTVlWWjk2MnBweWtyTmRGanpSN1JIdmhOUzNU?=
 =?utf-8?B?d0tWaEhwUDdvaDlGOEdVcjZxWWJ6SjBVK211SnZQRUxENnBoRmJwSEVSMUFz?=
 =?utf-8?B?T0xvRE5PKzNCNFRyb0lldmhNbHllemxZYVVRYWlPL09JSE9yWXRicHQzZEFj?=
 =?utf-8?B?dkg4eW1XaEs0VUhuanRweU16UXlkSm4vK21PdWVCZUJibEtPcFcrYXF0TW1L?=
 =?utf-8?B?MXRUMGtPTWRvS24rdXY1VFFUb0hOVHZYcnBWYzBOZTJkOGdRNWNHYTd3Rzc0?=
 =?utf-8?B?RjdHdmQ1dTB4TUlvZlJ5VW9FVE5Mb2VpNm92OTI3UHNCRGdPdGVxTkJZMWUw?=
 =?utf-8?B?QlVjbVBqQVVncUROWXkzUGp0ZXgyYUcxYzdHeG4yVTBxcTNPQXY2SnFhVVo2?=
 =?utf-8?B?aEJweFNkVm5KVTMrbmZBVHFKcmEwdmJ6VVF0aVhjQkRqc2FCbkFUYXJLdGRl?=
 =?utf-8?B?MEZOTGhjekswREo5bVdkNmVJUmF5Tkp5ZDZTMklYcmdwRy9HWXVCeW9GdVJi?=
 =?utf-8?B?R0lGK2MzdUkreWVVcWFWUm05NHdoTjJaTFVWMEpsZU1LM0YrY2ZqZDR5QUpW?=
 =?utf-8?B?U3Q3c0w5b1RhZUxJcHJSVlovZXNFUVZ3dENDbjBkbFU4QXF5aHRrbzdibUNV?=
 =?utf-8?B?MlZsNjh5dmM0SEtVTjY1NVliWXpYdVBpdmpZNHRDRG5qRUxuSUx3Y1ZrdkZC?=
 =?utf-8?B?Q0RtdzFYOGFrZURwc3FqQ3RMdzQ0c29nWjJ1K3NuL2xPS0RLMG1ydFdjMEZX?=
 =?utf-8?B?amVUNENtOU9SSkNFN2Y2SlY0S0FzaFg5U1RRQ3NwNUhPcEdlcFFOeGhPM3Yz?=
 =?utf-8?B?dlZIeUoxZjRwMzk0d3I2dTJkNjRxT25kdFYzUjNuZVVsN1dsRG0wRXZoM3NM?=
 =?utf-8?B?ay9BVDQ4KzRwU3k4R2JOUDVMZlZ4dkw4K0tXUSs3OU9veUQ4WndwMUVVM0FN?=
 =?utf-8?B?ZTMxVmFrTk1mSmN1VHl1d2lzSU9aaTZ4WEhPSVpvOFNodGM3dlRUUFdqSkFn?=
 =?utf-8?B?WXYvNytqY2x2UDYvQWdZOUNGVTg3MHU4VUJSRy9MN2lITlUzVjlsUG9DdEVv?=
 =?utf-8?B?NEVzNUFBRGtWZWxkTXRqS3ZRTUpXOXI3MVkvdzBzeFBESU9sZFUxc1dTeVRV?=
 =?utf-8?B?WEgyQjIxTzJ4YnpMY2YxZGVJUW5LQ01lcDE1MlpMRWs1QlR3bEU4QitMSWVZ?=
 =?utf-8?B?VUFtR2s3cHphTWpWRHNLTGFlTmRxUi9UdFZaTC9vZkJsNzUrbG1lUDFGQXAy?=
 =?utf-8?B?Tnh5YkMxTFRYTE41TThwQ0VEY1hzRFBvVkRkMkRhK1JUS0NLWnNreHBDMHEr?=
 =?utf-8?B?R2JyYVJIM253S1QrV0hIUkorSWdnUWVxcVFQREMyN0UycHg4Z0tVQzdMZmcr?=
 =?utf-8?B?SVRLUGgvSnJvN1Y4RmJmOGgzamJxRXdlRThmYjl5cnBueE1DRFlucUwzY1V3?=
 =?utf-8?B?UUxDcW9VdnhOUlhPRFhqVzJZRWl3WjVpQ0FOVHNhVkVWUmJ1M3o5cHdzSVVs?=
 =?utf-8?Q?6FLl3BKI53p1YFGOlx/p9U44z?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce8877c-23af-44f0-abc9-08dc9fdbdfbc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 05:56:28.3660 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP06RluZpaIWX9am2kVNa2x6yZGE/WjDh5nl9110+p37izxXnA24JqfHNGmoDP+vL2fgv1ahezm3ZnbXA998pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8531
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



On 7/8/2024 8:26 PM, Badal Nilawar wrote:
> Move code to install fw close exit handler before rpm tests
> as some of the tests uses fw.
> 
> Fixes: a3c590fbb5eb ("tests/intel/xe_pm: Convert mmap tests to use existing d3 helpers")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_pm.c | 32 +++++++++++++++-----------------
>   1 file changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 5a9e4858a..b30e94a2a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -769,6 +769,10 @@ igt_main
>   			test_mocs_suspend_resume(device, s->state);
>   	}
>   
> +	igt_fixture {
> +		igt_install_exit_handler(close_fw_handle);
> +	}
> +
>   	for (const struct d_state *d = d_states; d->name; d++) {
>   		igt_subtest_f("%s-basic", d->name) {
>   			igt_assert(setup_d3(device, d->state));
> @@ -823,24 +827,18 @@ igt_main
>   		}
>   	}
>   
> -	igt_subtest_group {
> -		igt_fixture {
> -			igt_install_exit_handler(close_fw_handle);
> -		}
> -
> -		igt_describe("Validate whether card is limited to d3hot,"
> -			     "if vram used > vram threshold");
> -		igt_subtest("vram-d3cold-threshold") {
> -			orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
> -			igt_install_exit_handler(vram_d3cold_threshold_restore);
> -			test_vram_d3cold_threshold(device, sysfs_fd);
> -		}
> +	igt_describe("Validate whether card is limited to d3hot,"
> +		     "if vram used > vram threshold");
> +	igt_subtest("vram-d3cold-threshold") {
> +		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
> +		igt_install_exit_handler(vram_d3cold_threshold_restore);
> +		test_vram_d3cold_threshold(device, sysfs_fd);
> +	}
>   
> -		igt_subtest("mocs-rpm") {
> -			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> -			test_mocs_suspend_resume(device, NO_SUSPEND);
> -			dpms_on_off(device, DRM_MODE_DPMS_ON);
> -		}
> +	igt_subtest("mocs-rpm") {
> +		dpms_on_off(device, DRM_MODE_DPMS_OFF);
> +		test_mocs_suspend_resume(device, NO_SUSPEND);
> +		dpms_on_off(device, DRM_MODE_DPMS_ON);
>   	}
>   
>   	igt_fixture {
