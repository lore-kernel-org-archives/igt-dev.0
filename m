Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF37C9EC94
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 15:20:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7314410E237;
	Mon, 12 Jan 2026 15:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N8UHfd4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2438710E400
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768231210; x=1799767210;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vY9OuF4kUO8XwJDyqBoOZfIS8m1rbzRlFEo34itCHis=;
 b=N8UHfd4s7GBTeT3Da/nB9gk1Dtb/riLBRmvZZmflb0EH8Y1jYEKtxm1D
 6x3cGT8RBrANH6FLDI6SEzWJRe+Ec7MQIXYIkoh2Sr07D+ELeGS8XAX04
 uQ4gtRYB7bPKIZggfYWpdQeqVxFWNZvH09wT5eDwfM0GYQkq80xLYn4NT
 qknd1srTlSY3UMYJkvPAagFzcz1QScuvpTyIFq6v7tIdDSeZgfRPQzyQN
 UwuUnp0ZZ3nMqpV/B1qJEspcieBdnFsgVFufohxpyL65ZDDhYTnjLJl2k
 IKT5ajFMQPASSjZte7ImDe6LubDs8mUGOMSEN6+qAlgsth8GHJ49eFZdm Q==;
X-CSE-ConnectionGUID: mgOFQrY4QUCl26/ADTp/oA==
X-CSE-MsgGUID: xyj2jnPKSqWrhhczzTVD5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80145808"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="80145808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:20:10 -0800
X-CSE-ConnectionGUID: qA4JrsVLTKqlOKxaGFsVKw==
X-CSE-MsgGUID: OV/ibW7XRoqwdglSqVXLyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="208633495"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 07:20:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:20:09 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 07:20:09 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.68)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 07:20:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RuKTQ3gu2wFzI2BTFnsWpBJXv4Jfln3ks9/+GFnlkC57G9vgma/BLeS/2X7pP32V3QmbKnMDghBVRzhMk0bQJM1bgRTmmnzHCS8/0+u3Za69ZLEG+EvMOz18xDYIepIleyp+g6+zUQsow+kq/FaEq+u2NGzqY7R2azJGyGsmh1vsPiD6DXys/+86A6+kCWeAgN+MIsI63V1j9F+jjpKBgiM9nVl525GBn8/RtSV9o0+oQx33AxbZztsStgzSYnIhzTxt8P0g8E098nDYUlG54i9RyLvYEfsf225QHhH2EI3aLnZ5Wi3mb62YFRPQAFjc6WFF89yS2lHe2NDY3CfxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KdQ14VnczVIgBFlAyjiiTrmkn3roCUuQ12e7MX3tqs=;
 b=EO14c5YdVYKC2ATzjdOxeKrUotoTor8CKm78kTnRSzATIdfNwy9caYk8vHgxqovFn25XHozOKwNXFXxfjs4rkfNUd+cHemY3WedichjU+jqwYnAsT/VJAZq6PVoJzi7geGbJIcw9QlfWC2NaVNal5ICi9RAPwIzfu7Q51D38Yrcd+3/zKin0KzzWwbqn629UdVMEfj7sCVyeB38RVStaE8Czk2vQIckNeJjVKFg25QVJbBjE/62UCLGTo9tUL7VGpS96nM086kowOMDRHYf19kSw+X2OO1qef6Ni1lYMfL4cXQC/LkKR82X2yn/GNt/SAcALhvut0h9HoBlfUIAohQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by BL1PR11MB5221.namprd11.prod.outlook.com (2603:10b6:208:310::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 15:20:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 15:20:02 +0000
Message-ID: <70b7bb9a-fc95-41d7-8db8-856e0a69cbf4@intel.com>
Date: Mon, 12 Jan 2026 20:49:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/igt_kms: Add helper to validate modes
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>
References: <20260112084455.157949-1-karthik.b.s@intel.com>
 <20260112084455.157949-2-karthik.b.s@intel.com>
 <20260112090437.cp7ixizknwso5m35@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260112090437.cp7ixizknwso5m35@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0210.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|BL1PR11MB5221:EE_
X-MS-Office365-Filtering-Correlation-Id: f67f71ca-e16c-4b1d-e229-08de51ee0e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|42112799006|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVVMVEcrYWlkeWdBbEFVK1paVzBVUVEvcllQQlV1bHFNYXQybkkzbTRQamd6?=
 =?utf-8?B?WTRBTWJMa1lTcVBHK1FJMHhMNVdXcFRNSyttOG5IWXFEVTRFYlNtTXRnMDNY?=
 =?utf-8?B?c3VhYldSMlB4OVY0T1JQckIvZjlUOXBkWXlyR05sYVc0MlRVUGFTUWl5TE1V?=
 =?utf-8?B?MVBHbDVvUU8wdEFJbnE5N2dKRUNreHhUVXQxRElNdDJlZFE2ZStWV3dPYUdL?=
 =?utf-8?B?MHRrWXVuT1VodUZ6RU10V0ltbHc2WHh2akU4K1NkdDRObDBjY3RUR1lDYTM2?=
 =?utf-8?B?d05URUw5OGdDb2tQcnMzQ1owN2FXdU54OUQ2eDJSaFEyVEJ5OExXWklUZjIz?=
 =?utf-8?B?RHNzc04zYUNadjNmZkRqWGxnZVU2K2dxTXVsSWhsVnFSRHdXTWJ6cllFaGQ5?=
 =?utf-8?B?V2NUZnhKU1FqR0ZhN09JOXhDNXJYVHVEQXNHcUw1UlZxd2pObXZ4Vi9pUnNs?=
 =?utf-8?B?czN4ZnJ3WFZuOG91TnJaOWxYOUlEcWVkTm1XT1ljbk1pNjNLUmRVeHlhd3BN?=
 =?utf-8?B?cTJWWldLYS9ZQWNwcllPZEFIOXdTRVMxbklnT0dMNENEdy9GQktqdXlwWUV5?=
 =?utf-8?B?d3Vnby9FU1FxVmJMWVZiYW8yRUtGZVUyTUZwZ2FSeVhHRVdFVFFmN0ZUYjlQ?=
 =?utf-8?B?a3grcnZlK0dyTnM2TUhJTTB6ZGlpSjQ5b3RYUjQ5L2MzK1BUYnpjTnFZSEti?=
 =?utf-8?B?QU5aOW9USU5qR3hzUDE2K2dldzVTU2hCdlVBN3ppeGtSWjVOOUR5aHU4KzZI?=
 =?utf-8?B?T240a1RVTnQ3bG5pY2hSUmdPcnJpZ3h4ZmRhczFES1d4bEtCYllwTGZWT3RE?=
 =?utf-8?B?cTJPeUprTHdvdGpWczBLeG9vblFDYWx3S1lGRnl6ZmNldGFaQUhrSHh6YWJJ?=
 =?utf-8?B?dWdyV0JBY0VlcVlTYWhZM0drTnJIaEtRajlIeWFnUXdUUkdIY1NtUkZWUUph?=
 =?utf-8?B?YjJ3SDZ1Qm1GYnFRaGNLbTJBL01HOW8wbXZIN1NMWmc2aExSNDZrN1ByS3dG?=
 =?utf-8?B?djUvREJMSDZtR21jamRjeWRhVGo3TEViSU1RVzdXcTBxUEcwMmxaNUt0UCtK?=
 =?utf-8?B?amZRSGhMR0RLYUZrYjRPOTJJb3pCRlpLanhtSG0rNGdsZDR6bXpTdnhvUFdL?=
 =?utf-8?B?U1RSbVJRcER5YVVhVHNOZXVITVRndUtoUHJGMVZVaUx2SW54dndiTWtzUUhZ?=
 =?utf-8?B?NTBXYWJLVjZLdmx5ZmovR0NiMUFnTGkwNWhOOWRrNWpVRWQ3YUUxc1dyMXl1?=
 =?utf-8?B?WVNXY28yL2RGc1NlZkM1elVoelVXeFZPM0VGUXJFTmdDNi95NkFqdk5RZDJN?=
 =?utf-8?B?d3FTUHNnYVJDQ0kzNy9MM2pPd3lHemlpbFdSRm5Oc0NhdGNPL2NXZExiVWFs?=
 =?utf-8?B?ekdZVENhbEo4Nkl0bC9kRW5Vbi82eUQ4YlkzV2h3K3pwcHlMV0d5MWdsTHNi?=
 =?utf-8?B?Vk5jKyt2TUVWbWVHblYyT1MraHJrSlFnWkFQZDd3U1MyUDZlMmd6RjhuSVds?=
 =?utf-8?B?WHJNWTRMSVZ5aXowazY3MUY4anFzTTZPYWJLbGdlTjFVRFN6VW5aeWZrVEpY?=
 =?utf-8?B?eDU3b204L0xOTUxiZG9QUXpBMnFjZEIyci8xaTRDSnJValc0OWRoYy9NQTFS?=
 =?utf-8?B?dHMvdW93K1llMU9CckZWd3A0OXR3U0pLLzdNOFZKa2krWTF0V0VkaTRORGcy?=
 =?utf-8?B?RDBDdUgrTU5iUkhhTjBSSDY3elR3WnRnOUt0Y0FoNG90b0JPbGkvQ3RsSDNa?=
 =?utf-8?B?ZTRUWDY3cjYzNjhPTmtPSFI1cW1IZkg2VWE0SmxOUXJ2alg0ckJ3dEFLOHZk?=
 =?utf-8?B?RlVFamtwODlIU1djSU0yMld4M0QzS0JoOUd2TEtaenVxY05kNWFyTVdqa21T?=
 =?utf-8?B?V1RkajhmbGg0aUtyNXN3dllTMjhWQ3pwMG4rVncvNUJuMFZNaklwUWdsTDVJ?=
 =?utf-8?Q?G6s6ar0gr/6mvhvpwdYauxzkw95Zv2yU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(42112799006)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V25UWnpBYW5VMTdRRHpiQzVjZWk3YncyU21LV3Y0eHdFSy9pZ1I3UTJrRmtk?=
 =?utf-8?B?Um1qOENJaXhYN0FuaTJTTkxIbnc0cE95UVowMlB3YnlsRkwyb2tzSm02anc0?=
 =?utf-8?B?dHJyM25XVUd5TXBtaG1DaVd1UmNCYkVhUXEra1pvVzN2NkxhSmhpaFJkUnJP?=
 =?utf-8?B?Y0FSM0lQWHlMWWw5MkJJQS90bjA2V1dOTFdrdmdtZTI1TmJOR3JQTkRBNlhS?=
 =?utf-8?B?bkVaUGgydEh1Tm14M3J5WHM4TnYvY3pzK1ROMU9QOTZhNGp5dEFRdTU4enhM?=
 =?utf-8?B?R1VDZi9XMWE2a3hTaDgzUVoxU3kzcHVla2NDR2NwYXBHM0pFc29jcTJSaCtL?=
 =?utf-8?B?M2s2YU1EVHJ4aVpaT0p4bEZTUnVqODIvbjV2UksvY3dmNlFJcEp0SEoxRUxF?=
 =?utf-8?B?dmo2M04zMlRHc2NuVUVxVzZ0cWk2a1JLUVBCY0RXSUR5SXI5cVlYSmZDbGhh?=
 =?utf-8?B?Zmp3dEdBOGw2bUp2NXdUL1kwTVROVmhnK3dsekFxZmY3dk8wZklZTjF4YjVC?=
 =?utf-8?B?YW5wYkp3QVREUkNWWURJTWNiTERrWm1jd09rSzQwcmJGVFhiWmVCZk1YbGo5?=
 =?utf-8?B?d0JzMldpdWh5a2JJRElXWVVYbWZ6YU5YZG9HUVl3dDhWakxSWVRBMjZibENV?=
 =?utf-8?B?RCtxS0FOTHNoend2alVSWmhFQXdkNU9CV3RORWxQVUcvenRnOG50Z2xXaU14?=
 =?utf-8?B?SHdwZVkweVpBMlcrUzRWQjl6RkZZY0NyZzN1aTlUeHlmY1loSHZpZ1lCR3RD?=
 =?utf-8?B?MWg0VnNVMHVZR2M0TStNM2hTK3Rib0YvZ3Q4UVMyVyt6WGNpTFRxN1BRd3VO?=
 =?utf-8?B?K3I4RUVQRlZaeHMyenU3dlpBVFlxd3VML3ZDTlU2TFNPUk9GdmJlS3hYVHNK?=
 =?utf-8?B?dDdBMWN3Y2JEOWxGQ2tKVmM2cXJVRG5PRjZoYXYzanl3R0Jad1h6REFvSGNJ?=
 =?utf-8?B?enlidTA0SThqaGdnVWtta2RSS3VuQUF6VzJHY3JaNHlYaTMrbzQrakxvdEtC?=
 =?utf-8?B?K3RVRmp6TFdvMjY3bXdnSUZTWEVlMEJiemh6SXdsL2t0MzBkY21MRjlIamRG?=
 =?utf-8?B?WVhCdFFSV2l2NmtUNzFsclh3YVFIR1RJaDVRN3RZTEl5NmpNRlFLYk1iWmpZ?=
 =?utf-8?B?ODQ4cWVDWEthV1hzQzZMK3h0SWdyY0FDTEp1VDU3UlBwMkFROFIxbnY1eVVr?=
 =?utf-8?B?cXBzQ0syeTlrSkJIYVhLRTJCeGtwcnpudEhsdTRwVWNVRkpUR2ZoeDVBZGk5?=
 =?utf-8?B?Wk1DRlA4YjBJZ1V4RzRBY3RxOXJGL1NVS3NRS1dkTlFrWFIycFl1Q1FzdHNR?=
 =?utf-8?B?Mk5SK3BpcStxcjRzeGRBNkYxUTJWeEpoMzkxelpDbkR1Ym05bEtDU2o4WHhx?=
 =?utf-8?B?ZC9wN0t0d0NJenZ6SHNhSC9nMkEyYm04RVozOG9OS0JISHdybWY4Qk9ETVVo?=
 =?utf-8?B?aCtnQ213SzJIQitnTU1hb2xaRFY2N29YQVZuQS9KUnJRMU9nM2VHTE0wTkF2?=
 =?utf-8?B?NWFqN1NqYTUxVW5kU0xpSmg0SEFMakM4MWVsRTR3ejMyQ0ZkdUxHZWtIdldx?=
 =?utf-8?B?bDZxamZsaTBDQjg3cCtKREJxdEpZczZmM3VBV1ZEd0NYdWZpR25qK2c0WXp6?=
 =?utf-8?B?L0NBNVBVaThEQUdKNTh3UVZTZkxMM0dKYnNoWk02VzR2YjJNY1ExZk1HdzVZ?=
 =?utf-8?B?MXdkV01LdTcrWnVJWmxFWmZ0S2JtZ2tiVXVHalhqb1FsOEdpandFTVhBQjNw?=
 =?utf-8?B?aFNPN3VNNWV4UUZieE4rbGY1YnhTejdTWjZXRjRTdkdVWkswT2NXZEtBOW4w?=
 =?utf-8?B?UUpWN29GMWk4Mm5qQkY0bUIvMUVLbytaQUpWMTMrK0pQeC9DY0ZhVDBSMXhF?=
 =?utf-8?B?UDRWWFZxaW1tSmUvVG81aTZDZFZsb1hJbXRMVFovVS9aTVFjcnQ5VUxTU1Fz?=
 =?utf-8?B?RFh2bFo4YW9QOUt3aFIvZmRybFJXUWJvWWJabjZxUmhEci8ybVUxY3Bya1Fk?=
 =?utf-8?B?S1NNVjdtMlozZ1hFQUhUWDVVOWRkU3VJVWkxODNUenJjSXZKVXZ4U3lCOENt?=
 =?utf-8?B?S1ZIWkFibnRtMUhkeCtLdk1PZ1NVRHJOb1hmZEhNWmY0Sm5KRzJFVFhYdWhJ?=
 =?utf-8?B?b3E4TnVMRVNrVG1QR1RwZkxpZ1JMQmFudS9FSjZNcllxdS9DUjRiYnBPdXd4?=
 =?utf-8?B?NVN2MG9BRDZTSlVheXNQYXBDZzgzdStoeFdFSlh0RnZhSW1vT0I1TThObzh6?=
 =?utf-8?B?TVZwSW5QSjBBTmVUM1RuTERWWnRrZVowTzdlS1A2NDZ0c3I2TkMyQVYyVGpC?=
 =?utf-8?B?VDE3MC9TeHowVTJYY3ZQNEdQSHdYUkFTSXM5bFpyYXJZVDhSWkRqdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f67f71ca-e16c-4b1d-e229-08de51ee0e8b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 15:20:02.8688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLs716rxAUNxv5dcT/l3JfksSPVmwQ3mic9zyvdoP3xDBpGA1t8h5y38huiCj0dwhk5d60cDuiyHmZtNgf3xIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5221
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

Hi Kamil,

On 1/12/2026 2:34 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2026-01-12 at 14:14:54 +0530, Karthik B S wrote:
>> Add a helper function kmstest_mode_is_valid() that checks if
>> a given drmModeModeInfo pointer is non-NULL and has positive
>> width, height, and pixel clock.
>>
>> This allows tests to safely check if an output mode is usable before
>> assigning it to a pipe or creating a framebuffer.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c | 14 ++++++++++++++
>>   lib/igt_kms.h |  1 +
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index a58f41b48..9e5820d43 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -5197,6 +5197,20 @@ const char *igt_output_name(igt_output_t *output)
>>   	return output->name;
>>   }
>>   
>> +/**
>> + * kmstest_mode_is_valid:
>> + * @mode: pointer to drmModeModeInfo
>> + *
>> + * Returns: True if the mode is non-NULL and has valid width, height and RR.
> Please do not use shortcuts in description, write full name instead of 'RR'.

Sure, will update this while merging. Thanks for the rb.

Thanks and Regards,
Karthik.B.S
>
> With above fixed this is
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
>> + */
>> +bool kmstest_mode_is_valid(const drmModeModeInfo *mode)
>> +{
>> +	return mode &&
>> +	       mode->hdisplay > 0 &&
>> +	       mode->vdisplay > 0 &&
>> +	       mode->vrefresh > 0;
>> +}
>> +
>>   /**
>>    * igt_output_get_mode:
>>    * @output: Target output
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 4a814f0e9..e10441017 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -585,6 +585,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
>>   }
>>   
>>   const char *igt_output_name(igt_output_t *output);
>> +bool kmstest_mode_is_valid(const drmModeModeInfo *mode);
>>   drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
>>   drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
>>   drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
>> -- 
>> 2.43.0
>>
