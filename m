Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D62CA0EE6
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 21:19:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B9310E9AD;
	Fri, 15 Aug 2025 21:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIrzPqdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D53A010E9AD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 21:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755292754; x=1786828754;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=G+LIy0dmp3jet5KiUdGno8SdtJX7V6Dwsl3jzFV6/c4=;
 b=PIrzPqdSncx7PdCozW+zqnjFvMgpTRawnN3VR3O1tlr9eC7e71SQOJuy
 x7v3QojL0YWWWsBGxXJhMhU7EDbJtlrYkVPeW7mdOw+U686S3w/hwxdy0
 IX+4HNxOHmeEf9I992J703Sdg/uSXfeTP0/AD6jiRuZzmg1fdmoSoEtdZ
 bQKb/rLNrHOnKLVUY3Q3O2lE8AU1zz73wLkPeMKOmUVq7sVjK+LQc1GQN
 vSzr4ttRxB1JwaGLVLKx5QvnCSLes9EL9Y2WrkUbFCMJ6x9Y6xAkgukE1
 8eiNDBuQ8+ZJGT2WlJBmsqW8VRxN4HZopzl3vv2gWd7T0/B/CHBhtDbVt A==;
X-CSE-ConnectionGUID: gZF09GQbTjqodHefHXS1VQ==
X-CSE-MsgGUID: q9EZ779jSDmeG/OHn0ioqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="56642793"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="56642793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:19:13 -0700
X-CSE-ConnectionGUID: xIsYbgb7R5+nyu4+oHjQlQ==
X-CSE-MsgGUID: y3tU3n0bR2CtFw7UkS6Ugw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166587038"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:19:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:19:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:19:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.50)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqS1Q5e+Fw8o3NKIo/eQloBQTT0zTg8SOyMimgTgDXRlbjvulvyzgnP9EySP9lyE/t1vKFx1rL9ZBjXUqrklRcPq50UAJVBfSOzNt2DgZDl7W2OIRft0fo3p/xJsJGlqMgwdqOasqyFKS7vVrKCN2Sttkd91Fh7gh2BxjfrM94Ls94VHd0f16rS1KRnIYPGh2jLkDpVGnmt7wXDsvKsLjjIR6bv3kJyFptAfD+9rsUrRa/B2Y9fZs0UFT5h6HpI/FABITKUIZkJKisBuN16lGhk47uWEkJVhVooTE71xx7YaNUt2j35zxN/LIPnecAoJegv8PutE0ncbsayBuVrc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RigGZaCCUHrL56/YrHR1+OfhtsTfdDIzumwINzgM1VM=;
 b=J3oR/NKWp/OWlR97MmxZBSEVtnAWfL69c0vzgdEj2y7bK5mBM84HS4AYvJaqhOyp1ucZFo0mcUAdf+F5on6cpW44DqnbXDgQWzqdG0xisIHn44e9OYrJ8dUwv8V5sKwtAFca1aH2pkpM3ZN8h+YFQe0s88iye60m8AoSLXqWf5h/8AxXEFjeVdpc6vHh017DztXYeUsSfBZlXFDO8pNg/JU0uz/KYLP9+HOGGMJYBUYY/ETgGRRf1HgyszXDOHhQjh5u4kxQhSKp/ZlqjNP9vERYTHYsX+fsJpcFZxkTt0eWKRP60PV1lsAzQw9yNm3GnqEJYpHxEunM/5c6FX4Xsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by LV1PR11MB8789.namprd11.prod.outlook.com (2603:10b6:408:2b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:19:09 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599%4]) with mapi id 15.20.9009.017; Fri, 15 Aug 2025
 21:19:09 +0000
Message-ID: <86465301-9ec3-4d58-856b-8096af3b2fee@intel.com>
Date: Fri, 15 Aug 2025 14:19:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: tests/intel/xe_exec_balancer: use xe_wait_ufence to replace sleep
 action
To: Zongyao Bai <zongyao.bai@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250713054102.408779-1-zongyao.bai@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20250713054102.408779-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|LV1PR11MB8789:EE_
X-MS-Office365-Filtering-Correlation-Id: 640937be-8fa9-4f36-099c-08dddc415f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjA5aW9NU3R3NFg3RzlJYmNYRzBZZUhjVlV2Qm1DUGhrei9UdUhmRmsxVExZ?=
 =?utf-8?B?Y3VuOWRid2Y1aFk3K1FwUWlCZExESkYrOVhqYkxzVkZyN3lEckJrK3QxSUph?=
 =?utf-8?B?bTVyMzVsTmhWbGdFcklRNUdqR2dFZCszUFUvRHJNdHg3bjZNMEk0dkZBZjFC?=
 =?utf-8?B?Um9HcDcwTnpOWFhBc1dBamxsK1NhYmdybE5uM01LUm9NV2N3VDRicG1KbVdO?=
 =?utf-8?B?U0NrTkM2N3BGaUplYTBFbzlkSGVQN200NTFtT0d6QnhSSTNRWFJUREJVZ3By?=
 =?utf-8?B?b3ZRRWFYUlJCb2ZoaE5QR1JBVHBreVIrVm1aUmdVd2tyNTJZYVFXcVZoTVRq?=
 =?utf-8?B?M3lJYldjSVhmK29CVkZMSzN6d3hiNnM0TVV6eGJxTXV6Q2EwNkQrRkZtYVdB?=
 =?utf-8?B?VzlNcUE4d1h0UTBBTms3ekFIR0VOYzE4RXV2dWNCckRmNHpFcE8xNWh5ZEpD?=
 =?utf-8?B?aC8vSjE2ZnU0dE1TNnIwZ0N3ZTJUOXA2anBpSGYrdldVYU9ic2VUcElldFpz?=
 =?utf-8?B?TFdURXlFbUN3ellOclVjVUF3SlZGa0h5amlOcE8xSU1JczllL1pmaldjbkc2?=
 =?utf-8?B?UXJ3cEJyb0JwRTUvb1dPNmNzOTRzZnUrVWF1cU1ONnExQ2tDWjBOWGlPMUlo?=
 =?utf-8?B?WWowazBRZEZDbEVBa0l0ZGxLd2piaUs4M2xGU1Mwak5pRHVDajJMbVRVNE1n?=
 =?utf-8?B?UFRjaFYzNUdkcTRGMmlDcGVSSUZIcmUweDR6VFhNZk9YdDd0VHFOK0QwV2da?=
 =?utf-8?B?eVRERzJkelpNTndxNjdoYW1GcHdlUmRBc05nV0tlc3ljVXpHYmt5RytyY0Rw?=
 =?utf-8?B?aWhUUGpKVUxJMExGTWlXaTR1UExoTFhXTzJGbWJTY3dFam1sK1NNRlVFV3RL?=
 =?utf-8?B?d2RUSmxpcUJaSXRFdzBXb0ozcjVHMWpsVlpKeHZOeElsTkNaOExQK1k2QnJR?=
 =?utf-8?B?SE1JR2tQTmFRWms5Nks0bHBnYWh3WndpbmlYOXZNWUU5K3BGazNHMzhsa3pr?=
 =?utf-8?B?S2toOER5NGRzdUxBK20reGR4MXpBcUdLQWw5eU1GOVpId1h0UHRPNWJxQ0Nu?=
 =?utf-8?B?K0owSWVLN0JPaDlmSjExZjlWdERtMkM1QzJrTW1iZmJiRnZ3dHRZSElBTDdF?=
 =?utf-8?B?M3QrWnU4VEpGMlJzZHhGZlVyNzNFMTVlb2IvLy9wejRzNC9HaFdrUW91REhF?=
 =?utf-8?B?Wkx2bFVVVVpRRnE3V0pnTVRrTFlHbjg1ZEV2eVhpTi9CRzFobGtLS3A2SWFq?=
 =?utf-8?B?eGZwOVJGZUsweEg1SFgzSkZFajdIUXErM3BrWjhDaTIrU0o4RkN2S3Y4VGdl?=
 =?utf-8?B?MUI1WVlxZ043Nm5GMGhnTGdRZktaUm1yWGk1T2FwaVVCWEFaQ3hYSkdKTGlG?=
 =?utf-8?B?alIxditlaTVXK1lCSGdMSUhZaHFaMlNDemxoSEJ5aFlrelc4NjlwNVhQWWZs?=
 =?utf-8?B?WHQrSmZqTDZmSW5NdFJ0eDYzQzM3dDhJS2tQWUJXakVqR1l1VTI4dERnYW1R?=
 =?utf-8?B?bVNudFVQQU5tU3RlMVdRalVNV1hyeENseE5jVGc2dTRQMkc1Qzg3enA4cHFU?=
 =?utf-8?B?SG1CTGwxMlpuM0ExQldCM1NQalhabGFHY0w2YU8zTTlLS21qaVRGTVprOEJR?=
 =?utf-8?B?VzVsVU1wcDRIYXA4SGNyQk1xbWJSUUlVbmlXbW5MVXVWUGNuQS91Q2RpVkRM?=
 =?utf-8?B?QnZOV0hWcFpYRFVReHlGOExwNDkzZXRaWjlwamFYays1eENVMzZhR3poL284?=
 =?utf-8?B?RGZuWnJYWlNWUmFEeE80UXZEOVhrdjlWd1oyYXNvU0Q3UHp4ek4xZEQvRzFJ?=
 =?utf-8?B?eTN1VE83SnpQYzdNNko2UmZ1enF4TkNyQ1J0US9oYWZUemhWYlJ4VmR2ZXNs?=
 =?utf-8?B?ai9tc3FtcDJKUkFmcUpaUzQwM1JyUVJpMUlDN240R3Y2Ync9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2N6QkdBTWIwTGQzT1pPdWYwWDZzaTcrUksxUWFDdGhRNGR4RGwrUkNqcERz?=
 =?utf-8?B?Wmk2cllGVzFmb200aDZSZFhVSm9RWWV1eGpnajdNSHRHd3p6OXJMM0EybW1n?=
 =?utf-8?B?K0NZZWFPa1dONWNaSjFpWnRWNjZhN1BZeHhSY1c4dWN4ckE4bk1jOURiOEtU?=
 =?utf-8?B?NUV0d3dCRnVJZXNBL0VzakxNQ25BaDNLYzRISzNzVExlbjFuaVVSWEgyaU5V?=
 =?utf-8?B?blZBNTNONDc1d0Q0cGtGQTVLQ0dTVjh1NUg0c3Z2dEtreHhuMlJhaUk0SkMw?=
 =?utf-8?B?aWRtR000NDgxcTU1cnBXU1MzLzJHTHVSZWlFbnJkVjZVQkl4cE5Tb3BFemhM?=
 =?utf-8?B?REFnanVMZVRINUxvc05Qamg3dWxQUmtOeVFkTnNDaFFuQldKdjJqajZla3Jk?=
 =?utf-8?B?dHhiNHdhMTkrMU5ZckNWR1k0V1hvNWNPKzZweFNkWVBlOGtsVGtBYko5UHBj?=
 =?utf-8?B?K0oxaDRHT0JiaVNZeUFjeEhRcUxvT0poWWV6MkNZeVBKNzhya1VtRzFjMDBF?=
 =?utf-8?B?R2toM0RwbmU0S1BqWWJoalRSaTE5TWVHb2hkaTFZTi94TlErMHU1M29Uc293?=
 =?utf-8?B?VVcwd2R0T2N6VFk0b2Y1Q3lqM3RhT0tyYTdhZThwMUlBbXhCVmxZQnMwYTFV?=
 =?utf-8?B?Wi9jUS9KSzZHVWIwelRQY283UTRid2VDUGpMeDk2NStkRjNyV3kvL0p6SS9s?=
 =?utf-8?B?VE5HeUNKMUZFZUdySGtBNStzNGY2Y1NZMVl1dW9VanJNeDhvSVdZNmo4RGda?=
 =?utf-8?B?L2lqQ05UcEdTNnBJYzV2ZGo1WDMrMEVmRDE2d3J3Y1lWOWh4TW05ZnBPcTIw?=
 =?utf-8?B?QmhsZ212YWF0elBiWXR6SGFJZ0piUzlqN3lyVGFhSC9UMnZGZVRaRkhvRE9y?=
 =?utf-8?B?OFpBdXBLZHBVbE5nQVQrNS8ycEhlMUpiUEFKaUxCNDZ0dDFPcVo5UmZib0JN?=
 =?utf-8?B?N2hNc1pYY2J1NDdnZktnNjVnNnVjMUhsVjJXeTJkeUx5UDlBYUVtMlBHcnJn?=
 =?utf-8?B?ejJGZzE3SDF1VnhFWlBISFEzQlhQZ040Q0xXd1BEdTJWUFFZQXZPMmZ4czVx?=
 =?utf-8?B?VnIvbG1lR1R5aVBEL2c4ZHNZN0FwZEl3OTNwUDBqMUNmbmhzcytTMHloR3I4?=
 =?utf-8?B?eFVzR3d0cVQwbGR3OUVTQit5REhYbTJSL2E1WHhWUFpxa2c3cGJQWVhLbmw1?=
 =?utf-8?B?L29sOTFnaVJoT1lZNElBK01NMHVTZGZleERwZEdSc1M2RzByRnVJU3M0SHo2?=
 =?utf-8?B?Ujg3WmdlL05JeTJ2MVRNTkR5ell5d1RmamdoLzdSOTl2MXZNK2NRRFZXUUZz?=
 =?utf-8?B?U1ZycURFQll6Rk43cWZDRXVyWDIzWkFCQUZIZm96cHdvRG4rVTR2cXAyejhp?=
 =?utf-8?B?cTB0Yzg3dDNCbU9JcGVUQkQrOU5XN09vUTg1R3BCbzc5QVNxZFVOZ0lQR2hI?=
 =?utf-8?B?SnpXRHd6NWZzczFRQm42OUNwd1JpY0p5Zk1Ub1IyT0tqYWJiTW13QXBwUk9s?=
 =?utf-8?B?UkJSZ1lPVFVaUWpDYTZRRkxJREpyY0FGajFFZDI1aWo0ekFzWTBoNW1sNUJG?=
 =?utf-8?B?SzNYUVVYRlNkcTJOWGNSODR2TnB3bUFqSEZTMmxZUkhPUW5sVGtyMXNyWGVi?=
 =?utf-8?B?RjZFOWdSNlJoSEdCOVNOcWdHVHpsUDFPbUF1bXRFZk5OS2pQUWF1TGU1ejNW?=
 =?utf-8?B?ZkREYzJWYVkybEFjL1RtL3NYOE1RK29xYmxZRFFqeXg5TVNzTjMxM1VCWGRC?=
 =?utf-8?B?ZEs1VHpCN0M4eFhzcnFPNnNxK2VvUWYrTmlBMTVIL0kvdlh3dFNNWTFDMWFx?=
 =?utf-8?B?U0JUbUNCN2hrRTlYNmZ0UUhSemE4V2syQm9RVDFQeVppL21hLzZRbDN0T0l0?=
 =?utf-8?B?RkpMa3ErVndQa1k1bFN2bjRDZy9laUNFelNHeUFyNmVUQXBITWRUb0YvWXN6?=
 =?utf-8?B?eHR0YnZMLzV5UTNrUEJYc09UUXRzWm5WYUpEYlFEWmJMREFxMWJraVFGNG1W?=
 =?utf-8?B?TFMxUGZKT1FZZDlPeWEzQ3dpY0tVNDJjY2VlajVTOU12THBxc1dNZ0dyVTBG?=
 =?utf-8?B?Q1k2ZGNKc3MyME1Ka1Jpb3RiY003b1VSdyt3ZXF2UWNpRlpVYzF2T1VQR0ZE?=
 =?utf-8?Q?LsyN3JDq8lx+WwCxiAWy319O8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 640937be-8fa9-4f36-099c-08dddc415f9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:19:09.5538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UUNX5wHl/ZNGPXXl2CrhM034pFYwM6YrLa6gGhLCVlTHo0tZLH8YlLeh2+nfdHiiTNZyJEABzJc7X5hfFZ9wdU/zABQZzSAvGqpeF6cwmuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8789
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


On 7/12/2025 10:41 PM, Zongyao Bai wrote:
> In the test_cm() function, for cases with the INVALIDATE flag,
>      use sleep 0.25 seconds to allow all tasks to complete their jobs.
>      However, this time is sometimes insufficient.
>
>      In this patch, xe_wait_ufence (referred to as "fence" for short) actions are added
>      for the second half of n_execs tasks in INVALIDATE-RACE scenarios.
>      The changes are as follows:
>          When flags hit nothing: => No change
>               -- all n_exec tasks operate with a fence.
>          When flags include INVALIDATE but do not include RACE: => No change
>               -- the last n_exec task operates with a fence.
>          When flags include both INVALIDATE and RACE => New in this patch
>               -- n_execs/2 + 1 tasks operate with a fence.
>               -- at least the last n_exec task operates with a fence
>      Furthermore, modify the xe_wait_ufence timeout value from 1s to INT64_MAX.
>      It helps avoid the fence timetout error.
>
>      With the above changes, all n_exec tasks operate with a fence,
>      allowing us to remove the sleep part.
>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>   tests/intel/xe_exec_balancer.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 1747e207c..8b397038a 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -527,14 +527,17 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   		}
>   	}
>   
> -	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
> +	/* Wait for all execs to complete, and the xe_wait_ufence need to be run at least once. */
> +	if (flags & INVALIDATE && n_execs) {
> +		j = flags & RACE ? (n_execs/2 + 1) : n_execs-1;
> +		if (j >= n_execs)
> +			j = n_execs - 1;
> +	} else {
> +		j = 0;
> +	}
>   	for (i = j; i < n_execs; i++)
>   		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
> -			       exec_queues[i % n_exec_queues], NSEC_PER_SEC);
> -
> -	/* Wait for all execs to complete */
> -	if (flags & INVALIDATE)
> -		usleep(250000);
> +			       exec_queues[i % n_exec_queues], INT64_MAX);
>   
>   	sync[0].addr = to_user_pointer(&data[0].vm_sync);
>   	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);

This one looks good to me

Reviewed-by: "Daniel Charles <daniel.charles@intel.com>"

