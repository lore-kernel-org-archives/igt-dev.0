Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9376AE7719E
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 06:42:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424C410E164;
	Mon, 13 Jan 2025 06:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emiF5Ffq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B586510E164
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736750530; x=1768286530;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=x9UEXZgB7c239LaoojkO0vZFgqUho0QwI1eFfbh76bs=;
 b=emiF5FfqIY5g8tlYPJ55jW5scu7houJ/NMYLKZ52ditnCn9f0f4sPUO2
 1Gbdw4mE+xvhGvs/Y7vFxhOVKkzsinf6EtdPosuzFs0ba8V573WJwKR8O
 ii3soG1FG2QYEsri0/i7wsCWZQ3gUq5CyqMQTipa6CsLx/DEj3l+7OQTP
 HRAL4WkZyCUv1kr+MGr4m3eMPdmV6wfbhMblFXeKuJXDgwqrrJc+6BHmP
 3+x883phIwcrmZJQx1byaQU58BbE+fewBCOR52pNaQYw2URg1fQdh6/J4
 J7Z6B/ZbLeJa0ZW6BseBA8zG22jlnaqBRqV8PXu3wTIMqeX5pZN1diRJD A==;
X-CSE-ConnectionGUID: 6TisPpouSiuDzVT4AuN48w==
X-CSE-MsgGUID: P5qxZAmORH+JLs2dqIN0YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="62370252"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="62370252"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:42:10 -0800
X-CSE-ConnectionGUID: vkgfkWmmSPiazWG8t0oUNw==
X-CSE-MsgGUID: BZpnXDuCQ/CbqxOpNIjqyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="104335390"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jan 2025 22:42:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 22:42:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 22:42:09 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 22:42:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WVoY4+gOlslTvZ1LAWlPJRnG5ffa80B2ZH7AHXAo1zLnAj5edhAPC0YCda5KV5rbIakFdZcWCJzUrg8XovrJYc7AtlHk72VAplKBmRjiTmZ891ArthOIInDL8h5kwZI2+TJNHhOPDNIa820fIxrbyER5Bu+fqeJoglL7LZa7XlzK2KfvNm+BYoAxk6p4Tul29EenrsbQNCIdeLKHxjG6sOArrBV1rd74+cHt9mx/BpVBnVFbOroUz0AlIFjvCn+qIhQmLQ89wdawGza/aWhCE5808nQeoHr5nYDGkeL8vHX1LVowjOq+B/eydfwBDqOPI7RHrdWHOJtvjnAyWfmx9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXKb/TD+q+zY3s839zU+5z+s+J3bwdDL26SRF4YlvTU=;
 b=d1MwdGq3boTqWnKnDCG/x1f1qNqQDtUT53pqn3ZAEGTzz4/YlZqM77YP3xwM93+zOVzduZgnbGJ2t7oegbq7FnmK08hrBunO5EOQH4TaevqzcBgoJCSREzZJmF6P/I7lthcy0JuusIpW6/2GjPxuui8BkC9nK8D8UIA+/P/8fGprbuuYEKyqchvLVv04Sk1G5FD0QFL/OBmeI3J3sjuWyiQEJjoJ5r5TniD2ZIIEloPUcLj8T/Ci985+a9hwcDwRj1hio07RlPb7y0pHuPIpgd+5xO0AexLi7aPCSmiVljlZkm6isovJGHy3f6nFmL8fnTTn1J4wI7DKcV6vAjHFGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by IA1PR11MB8788.namprd11.prod.outlook.com (2603:10b6:208:597::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 06:41:53 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%6]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 06:41:53 +0000
Message-ID: <747154d7-ab12-43e5-a9b2-070752c3d990@intel.com>
Date: Mon, 13 Jan 2025 12:11:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_oa: Remove hardcoded time
 heuristics
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250106034638.1746051-1-sai.teja.pottumuttu@intel.com>
 <20250106034638.1746051-3-sai.teja.pottumuttu@intel.com>
 <855xmnvczf.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <855xmnvczf.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::18) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|IA1PR11MB8788:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c64f834-8008-456d-59bc-08dd339d5d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzNkTU5wblFHQkxwZDQyT3VEMkNlTHRxY1hCQUE4SVQxR1NmUVJjUzhYZDVo?=
 =?utf-8?B?NHA0TXl3Sy84YllyNURrUEdoODY5RjJORHFmM0dUZTV6ZXl5ZVNHek93YUpS?=
 =?utf-8?B?dkRNTnRtc2p2b2U4bDY1alVtUTNhTHVtL1Z5YWxEV1lDdVM3QW9yaG1ta1Vk?=
 =?utf-8?B?ZXFWSTlTZXNEUXI1QVk4N1N6M2ZURjg2eFdaWEFFTjRLS1dMcEJqUTRJMWFk?=
 =?utf-8?B?KytQeXVMZGpYTVF0NUg5MzQvQTIxVlJtZDRIbkJwQ2xDRERVbVVmZ0QzTlF5?=
 =?utf-8?B?SU12aTBNam5xcHQwUGQzcGxSSk00S24zdjQ0aDM5bDVGT2lqOHh5YkxTcGRs?=
 =?utf-8?B?ZmZNTTQzWGhxRGtudUJ0SkJQbWV3N3ZUSEdQY3Bzek5nWlM5dFV6dlRLbnc3?=
 =?utf-8?B?YnJoOHpnTzZ5MmFTcjJkZGxjTEE2eU9paHJiQ2o4U3p0T3VackhVeDcwMzIr?=
 =?utf-8?B?aFMwMWF2dUEzSXRCelhtd0dkMnVYZEdKTk13Z3Z4eFNiR1JmSkRqSVZaMmZq?=
 =?utf-8?B?akVUNnFsek50VEVjRGxqRC9VejltZUNjTjZpUldPZmVQQ1FDSHRpcmJJaGZi?=
 =?utf-8?B?ZnU2UVB0RCtQbU9iazAvSUg1amFRZXhPVXVid1NkMzdjaWlUVlJ5d2Fwd21D?=
 =?utf-8?B?aEtSV2w4c3Z3RndEWVpnSFNvZGRWY3Z3MkVRS0tyWUlqUzRpalZyQktYUXdQ?=
 =?utf-8?B?QlRnM1ZSbmFSU2dwVUs2MHpSMUxzQUZsU3RHWmx1cUZXQ2pxYWpYRUlNOFk0?=
 =?utf-8?B?WUdyMXAxMUwvZS94dUJkYXplUmpvWDZIb0Yxc0tnYms5TkRKMzhxLzNoNkVk?=
 =?utf-8?B?L0tYWUwvc0RZNzBHd0p6RCtKMEdUZlhhVmxxMkxseXhNSThDTG90UFBrWWFM?=
 =?utf-8?B?UWY3R2NvRTd2WjZ5dGYvZE9JMHVsMmFwQXFBdHdMYXVRWkJ5RU1vZVZpTnFO?=
 =?utf-8?B?Rkd0NkJnMnplWkRZSUtxTjFYdVN5TE1Xa1YzaHFtdnIzOWJpQmxIZGxIMWI1?=
 =?utf-8?B?MldGRWxjTzRxNUVSem1rbnlZaVRNeHdJOHYwOXhFM0k5blpodDB2ZjVYdDBW?=
 =?utf-8?B?UktRemkvUnY4YndXWlZxY3dXejZwLzBScVUzM2ZJR0xrYi9ieEZNRGxtVXBT?=
 =?utf-8?B?cjR3eUoxT1BhRGd4d2VZMmduNEppN0drSXVwY3pFUUtGQk5EZ2t1N1BnRG1r?=
 =?utf-8?B?OExaMjREQjlvSFp6ZEVRdkFYNzN2Yi9ROFUzSjF6cXkwUmNyRU4yaXJzbjJq?=
 =?utf-8?B?RXJ2eDRpWlRPYjR5WkhLKzh6Q0JqYW0rV21GRzBKakpNREY3WXdWRGJPNm12?=
 =?utf-8?B?Y2xBSlFFN3dINDdVWCt1K3ZDK3IyZFArSWJpZFNuVURtYjBXeHBVWC9xTitL?=
 =?utf-8?B?YTVMQTRNSnAvditxV25EN2FaRnExYS9kYkpVWXVxVUhaN1FJUXVITVRBU0h4?=
 =?utf-8?B?MXl0eUY4UlE5Z2lLVGN5WmRvbGJyNktJS3hFa1pyQUZOSzZ0VXVxYm4rZkRX?=
 =?utf-8?B?bnJSbi9qWHA5SFVXV3JRdTY0ZFZTT29tMGFkUUFNMG1UMTJUNHlJMEVFT1g5?=
 =?utf-8?B?S2doY3NoNTBmU0cyaXdXTHFjVDhNeFFXLzA5SDQ1bWpGdjJRMzhCVjR3MUlW?=
 =?utf-8?B?VXRNYXdzWHFyam9kRi8wbDJUemgzWEIxNkdpS1FmZFE1MXlHWGtpV0c3V2JK?=
 =?utf-8?B?cWpBcFlyV1ZCeTROVURCaFllLy9KZjMxT1M4NWtuVEEzUVhJekkycWFXVXR0?=
 =?utf-8?B?V0xXRzkxNUhQVmRTM29uVDJBT0xqU2ZjWk1iRVI4M3NkUUVZbXFRcWRWMkhD?=
 =?utf-8?B?Rm1zN2dKcDNvOXdQN2RnZHNNWFRya2kwTnBEMEhWMWF6NUthZFdGWnJzNlBR?=
 =?utf-8?Q?U4l3Th/tP5vk7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZ3UTkrMDE2R0VVYWl3ZUl4TmpZSzJwMGE1d1V6YmhkTHQyaXJFcHpIbXcr?=
 =?utf-8?B?MTIrNXdteE5wbEpnQVJSd1V0WjN2bXREVENKRkdncEs0WmsyTzFsSlpBWjZw?=
 =?utf-8?B?WFhYS2lsRmgxaWh0MFh4dkE5bzlvSnprZnRjWDBiZ3NHMGl4L0xVMmNLekRO?=
 =?utf-8?B?dmJNZ0lpYTVLOHhIYmVEY3FJVGMzYndlWlFWNkE4RzBhMHRMNmtCQi90RVFW?=
 =?utf-8?B?dmp1cEplbXF3MzI1ZGFoOUNYdnRaK2VRdG5sQ0swQnRBM0M4STlUYi9Ubjc1?=
 =?utf-8?B?dGRIWjg1ZUdpdlBoMFJhYUpyMlM3akQ4TW5ja1lyQmwrMjczUzkxcVlVZ2pN?=
 =?utf-8?B?bCtmTkQ2aDlLaUpuZnNKVkJqbkZqOEFHS2JVaFhwNGswRGYxNTlveEEwcGdk?=
 =?utf-8?B?S1RNaEQzb2ptekQxSDgyL3RYcDk5enMvVG50cGZWN1FMOFU0ZE5aTVRHRFox?=
 =?utf-8?B?VHdkMXN1K1ZFUUdGNHRyS1NvdEtKck5TN0ZPUFFENm1meTVZS21BRnF1SXFW?=
 =?utf-8?B?KzlxeTVOOG5OOUZ5THdHUFMzZ2IvWUNUZU96TmJTUEtTeDFrZnVzY0NhN05M?=
 =?utf-8?B?UnVlWG5LczliRmIwbXQyaDNsQk1VKzBKSGY0NEJ1VjVFK0VGQkFwb1dJZzBo?=
 =?utf-8?B?YW1PR2l0YjJVa2tKZDBJWHZ6a0N4djZpMDJpYkMwek1Rd1F3NHpnZUs5YUJU?=
 =?utf-8?B?RWtTYmZ4MitmZ1laM29VTnV3ZWRpZEUxTTZrc3JwYjZlMERFTmYrTkxRM3Jx?=
 =?utf-8?B?N0h0MjJjWWt3QXdoTEhFdzkwNnk1MWpYUGFYcnBZUHhrc0VOVEJXTXBYenhl?=
 =?utf-8?B?MWZqcmpJWWM3SzJoYUE3SXhHNFNvQUUxeVRkeWNMSTh3YU4wT1dvMVRrTHRw?=
 =?utf-8?B?WGhMTm91NlRsa0xWbldrTlpmUy9KU1BmT3ZSOUdZVnR4aVd4amFJREhqWCsr?=
 =?utf-8?B?cWZZNGJuYlo1Y0R0MStKWDFyQmNTNjlNdWVZeGV6S3p2TloyUG5lYjgvakJJ?=
 =?utf-8?B?VUJYT2ErUEkydE1qbjJQdXVKazBjSWYyVklISFpoYXZ1RFBkbGRseno4L3BE?=
 =?utf-8?B?RVVzazdPV25icDVlTVA4akVmQlY1OEI3OFhQUWQ4RytQazhYdG5DS29BaEpz?=
 =?utf-8?B?cEhHdWhqRTBSSUlFbDZZS01RRFRNZStWTjhZZU1zZEFRZCtoR1pRWDJFYlV2?=
 =?utf-8?B?OXhTRW44cis3S1RhVXlCRE5tMXJ4ckhHZk9obEEvcnNmb3dCZ1ViRTh0eWto?=
 =?utf-8?B?VUp1a3FHbVg2ZFd1RjA5eEJ1OFRUUU1icjhxR003QWZDUkVIS3JkVzJGbjNJ?=
 =?utf-8?B?NHhqTmxaZ0M4L0xHM0NXTWQ5RmdLc0c0aGhUa1k0eXE1YU0ydjJUMTZNNUM2?=
 =?utf-8?B?YVRyTmc2R1dYOGkvTHZ6N1BFdXAwSDZsNDZtb1V3NDdqaFJwUnZtRTI3L0Q5?=
 =?utf-8?B?QVg5NlJqa1VWblN2bzRqWTEyUHVwZkFETDVFVGV4bG9IdXFRNzJkQ01lU29D?=
 =?utf-8?B?cVRhZ0dZSlNNSFlWK0s0OHhtMXdjWTB4Skd4aVhLTytSRUdlNEY2bWMzV3ht?=
 =?utf-8?B?cExRVm8vbXZ5RlZzdndmR1hzcXZVRlN5VUs2RTlZK2RGL2cxbVVwa1cxc0JG?=
 =?utf-8?B?bVZ5dk5vdlNpN3A2SGxsUUVUbUlMa2VkN1Z5VjExc0pwVVpZTzZlUDVIMlAx?=
 =?utf-8?B?YTN1N2h6TjFvMEZRaFNTTlZLeUhQY1dKLzZHMm9tMWM2eTViMWQybzNNcGl2?=
 =?utf-8?B?NUtvSUJxWE1CeVhtalpEbEY4MnlxaDBGcnBPYVZya20wLy9EL1d4U0J4REVl?=
 =?utf-8?B?RjEvR0tkSlNxY1Zua29teTBDTEVuUG0reXlmdUFJMEE5bFVMcVNEbVNDVU5E?=
 =?utf-8?B?UHpSZWw5clJUT09ESy9LZ2FEMk1NM2NzZmNDOWtCU04rSUVwQVhrZ0EwcFE4?=
 =?utf-8?B?WmhJTWxyY1VwTWZrWExUNmlqQWFaUjEraDJyVEcwNjBGRS9JV3pYMmxudmEz?=
 =?utf-8?B?bS9kbWpsa2w3d25kMWpFSFRlelRmS2hya01JdWFHcUdQNkVScE0yZkViWjhl?=
 =?utf-8?B?NTJwbHpoT0dEaCtPZ2JkQUNUMkgwbENvbzE4U0o3aktSaEp1NkJJb3lBN09q?=
 =?utf-8?B?emRSV2Q3Qy9rem5CL0dFL0x5L0lrd05RbzFqejNhMVlMaU5GZWVPZW9Jd2Qv?=
 =?utf-8?Q?N0X3bxt02Y+5PTnqwJAaPgw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c64f834-8008-456d-59bc-08dd339d5d83
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 06:41:53.1594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53ZQPGD971Jsl2WOAfTlqDt1W+3uEP0570GlVDOARO6Y4NpituF6fgu9Sym9/FMJ0tWv9V0ZC1cgIGlLVD9M+o2TaXNLj1ySxVeJH9TV+U8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8788
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

On 10-01-2025 03:58, Dixit, Ashutosh wrote:
> On Sun, 05 Jan 2025 19:46:38 -0800, Sai Teja Pottumuttu wrote:
>>
> 
> Hi Sai Teja,
> 
> Thanks for the patch, mostly looks good but I have some usual nits.
> 
>> Some tests in xe_oa tests have hardcoded timing heuristics. Refactor it to
>> make it more robust and reliable. The patch extends the wait time logically
>> but usually it would take a single iteration for the required reports to be
>> available so wait time doesn't change much.
>>
>> v2:
>>   - Extend commit message [Lucas]
>>   - Make wait function more generic [Lucas]
>>
>> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>> ---
>>   tests/intel/xe_oa.c | 30 +++++++++++++++++++++++++-----
>>   1 file changed, 25 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index ad3526406..b271278d6 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -4367,6 +4367,29 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
>> 	munmap(vaddr, size);
>>   }
>>
>> +static void wait_for_periodic_reports(void *oa_vaddr,
> 
> Let's change this name to 'mmap_wait_for_periodic_reports', to highlight it
> only applies to the mmap'd OA buffer case.

Sure, made most of the suggested changes in v3. Some comments below.

> 
> 
>> +				      uint32_t n,
> 
> optional nit: move this to the previous line, I generally try to to optimize
> vertical real estate.
> 
>> +				      const struct drm_xe_engine_class_instance *hwe)
>> +{
>> +	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
>> +	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>> +	uint64_t fmt = test_set->perf_oa_format;
>> +	struct oa_format format = get_oa_format(fmt);
> 
> optional nit again, but delete the two temporary variables above, see
> below.

In v3, I deleted oa_format, but kept fmt as its used at two places in 
the loop.

> 
>> +	uint32_t num_periodic_reports = 0;
>> +	uint32_t *reports;
>> +
>> +	while (num_periodic_reports < n) {
>> +		usleep(100 * period_us);
> 
> I think this should be something like:
> 
> 		usleep(2 * n * period_us);
> 
> So the wait time should be a function of n (not constant like 100). Here
> I'm assuming if we wait for '2 * n' periods, we should probably have n
> periodic reports.

After some experiments, I finalized with 4 * n as that seems to be the 
time to get n reports.

> 
>> +		num_periodic_reports = 0;
>> +		for (reports = (uint32_t *)oa_vaddr;
>> +		     reports[0] && oa_timestamp(reports, fmt);
>> +		     reports += format.size) {
>> +			if (oa_report_is_periodic(reports))
>> +				num_periodic_reports++;
>> +		}
> 
> optional nit: I think this entire loop can just be:
> 
> 		num_periodic_reports = 0;
> 		for (reports = (uint32_t *)oa_vaddr;
> 		     reports[0] && oa_timestamp(reports, fmt) && oa_report_is_periodic(reports);
> 		     reports += get_oa_format(test_set->perf_oa_format).size)
> 			num_periodic_reports++;
> 
> Just a couple of general comments below, no need to change anything:
> 
> * The loop is a little 'funky' in that it goes over the mapped OA buffer
>    multiple times, even over previoulsy found reports. I think that is ok
>    for now.
> 
> * The other thing is that OA periodic reports should be generated as long
>    as DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT has been used in OA
>    properties. Both places where this function is called from has that, so
>    that should be ok.
> 
> * If HW somehow doesn't generate periodic reports we'll hang here. But that
>    is not expected, so leave as is and we'll deal with it later if we ever
>    hit that.
> 
>> +	}
>> +}
>> +
>>   static void check_reports(void *oa_vaddr, uint32_t oa_size,
>> 			  const struct drm_xe_engine_class_instance *hwe)
>>   {
>> @@ -4396,12 +4419,10 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
>>   {
>> 	void *vaddr;
>> 	uint32_t size;
>> -	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
>>
>> 	vaddr = map_oa_buffer(&size);
>>
>> -	/* wait for approx 100 reports */
>> -	usleep(100 * period_us);
>> +	wait_for_periodic_reports(vaddr, 20, hwe);
> 
> I am wondering if we should make this 10 instead of 20, and also change 20
> to 10 in check_reports().

That makes sense, added a patch to reduce number of reports being 
checked to 10 in v3.

> 
>> 	check_reports(vaddr, size, hwe);
>>
>> 	munmap(vaddr, size);
>> @@ -4426,12 +4447,11 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
>> 	};
>> 	void *vaddr;
>> 	uint32_t size;
>> -	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
>>
>> 	stream_fd = __perf_open(drm_fd, &param, false);
>> 	vaddr = map_oa_buffer(&size);
>>
>> -	usleep(100 * period_us);
>> +	wait_for_periodic_reports(vaddr, 20, hwe);
> 
> Here too.
> 
>> 	check_reports(vaddr, size, hwe);
>>
>> 	munmap(vaddr, size);
>> --
>> 2.34.1
>>
> 
> Thanks.
> --
> Ashutosh
