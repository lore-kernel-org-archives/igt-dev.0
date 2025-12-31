Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6EFEE645E
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 17:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5134B10E29B;
	Wed, 31 Dec 2025 17:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBTycXQt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3923710E29B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 17:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767201100; x=1798737100;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HLMM++EuaRRyRQyksUxK/FrDhPRdz6vu28VNmyAOni0=;
 b=aBTycXQtu2neKZQ0aHqeqhkW4754kWVfcY53qO7W0o9fmuOT5b4nzyBL
 2eAWKTBh7vz6AkWhy5Nn0BBGY9DdHvpA+GmlUdjqZBIfYd/sKTGF4ULH+
 nHGQ/Y3X/uGiU5Aqa/rC/ebI+6OqXMWRYhmzRJMVQf5R0Y7uw2vbA+0YD
 JDHVny53sCTk95Fcxmh0vbfKtF/mt/1kyxtPtKMEi8iRwYpaBKQyyue0b
 xi4ueBp4VQeI2GIzItoq+3OGf3vVq6CQsQmGSZgcrHwRbjKdm9kP3TNhe
 E7PZUIdRTmcd5JcTA1WTBDo7z60oxf6vS7uDL474595lbjp2sEjpQQDyU A==;
X-CSE-ConnectionGUID: sDtJJ9ESRD+Pt956KKEtNg==
X-CSE-MsgGUID: wtdILNPvT4e1kEg5vAZmPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="80215433"
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="80215433"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:11:40 -0800
X-CSE-ConnectionGUID: oZyrxRoDRHS845yD9b8C+w==
X-CSE-MsgGUID: 72lB0ZjZQ0eWwCQS+WgjlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,192,1763452800"; d="scan'208";a="238921704"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 09:11:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 09:11:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 31 Dec 2025 09:11:39 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 31 Dec 2025 09:11:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9Zud5FqXT0amVhtrhIOjRYGIn7LpCUtpfoJ7BE78TWAm++B4jJCKRyPpZ4vFoEDjD0Q7BT/I8W/Xv746+9Sh8IMwvg2Op8O6cPv5HOohASZMzg0WU1tPDgcnEosSJVCffu0KPTeqtNr69mI1rXPESZ1QuF0K/xXr1MuBiYZtWU1wPc9X2LlKgWic61p96tYuRs7NBbAOt+naxoIFm4UZEfM0EhBK3/EY7CZ1FFGpFuwMB0xww15R+mvQnFLZ3obA4K4YFXmk9DCFDgueMPADoma1+Y4d2J5WafRY+Z1B5xDaFliF8HYZS+vXzyoTcbRQHxBZCVib7UjkM8YS61a+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtNGHgrfsPgj0LgP5S6ftHffq57Ci19ym7RkXtgf4SA=;
 b=hM7V6ltHRl5bdi4Q3OS0+6Tft+M8hZEXn/Ib5jE3N0wBYkMbI9sYkdmVCOyUjG/gLKeBeD2bgVDdTquBRYC+bBVzUVOpCny2HENJ7O+rnWenwM+CeCFnUnICiLJy09xHghzICCPEXW3Ngh9TpccQjbAQnHEV/nIggupYI0wJhYFYPNeLxeM/sgFpI+RQKT9TbNEqF9t+ES4fLdlDlwSojQN9t/Mb7VvLutYOZOfB9np8XU/kitjMvTQPqKN6NIJp/JwyPKgqei9U9z+lq06vzmP2RkRdQPTsju1l6WI3nqj1/jmMOUQgV+eaFclyjdgPqcXpg7EnuqZ6i8e+vBTjzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM6PR11MB4580.namprd11.prod.outlook.com (2603:10b6:5:2af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 17:11:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9456.013; Wed, 31 Dec 2025
 17:11:32 +0000
Date: Wed, 31 Dec 2025 09:11:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Xin Wang <x.wang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <alex.zuo@intel.com>,
 <shuicheng.lin@intel.com>, <stuart.summers@intel.com>,
 <kamil.konieczny@intel.com>, <ravi.kumar.vodapalli@intel.com>,
 <zbigniew.kempczynski@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v9 3/5] tests/xe_pat: add pat-sanity subtest for debugfs
 vs getters
Message-ID: <20251231171129.GA4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
 <20251231055525.51524-4-x.wang@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251231055525.51524-4-x.wang@intel.com>
X-ClientProxiedBy: SJ0PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM6PR11MB4580:EE_
X-MS-Office365-Filtering-Correlation-Id: c4de4a16-a4e1-449a-687a-08de488fa530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1pkRXkxQ1VtOUhVeGtiNGExR1gvN2xrL1R4T2Z1Rlo5NCtMWXphSjczNDBw?=
 =?utf-8?B?K2hXeFRwMXVWamkrdzFXVW41OFlZTWZPSlRYdU9Lb3dpTU5IRmtxdXUvbVZJ?=
 =?utf-8?B?bUlLVmtDNlpzMVlBZUQvTzFiNHZVRDhTZzh0TDVxd3ZBODF3R3hZS25rZWlw?=
 =?utf-8?B?YUpXQytnWUZnNUluYy9WdEpmNFJuOExtZkI2Smp5Y1RzN3dMVGQ0aTVhclJL?=
 =?utf-8?B?MHg0bDQ0d0pFaGIva3ZHaE9zNlcyekJrbFNvRXFTdVNyQjR6YVN5aldpVC8r?=
 =?utf-8?B?eVhQVWNRaDJ5Yi9KSFpYSGNZYndmQ0ZkMXJBZjZRcGd5Q2RWdWV0cEtFbGRU?=
 =?utf-8?B?T0xudTFXdUR2ZUhseWhrRGRxU3RSZFRUOWQ5SkxRU0dWc2J4c3NhdnBmcXUy?=
 =?utf-8?B?U25yQmZ1Sjc1blJDTWVQdUIzMzRHQW52UWNkMUlDeXJaQWFnT3daU0NFckFK?=
 =?utf-8?B?VGdCUUtaN1J0QVJvVFNaR2srUnM4VStTd0pRTVZGTkIvYkJXMUd2RUtmY2ZD?=
 =?utf-8?B?SHI2N0pVN3M1aDZhNk9zeitpWXBlcmpzREJvUVE4eDgvNzRrQUdOZ3Q5akha?=
 =?utf-8?B?ZEY5SVJMZzltNWRqUkREVkdxbnlidnhJLzJpWThaSnBONHd0S1RFeWFaODR5?=
 =?utf-8?B?L1BCaHZHeWdZRWk1bHNXUUVITURYdXRIR1BpT25pZXh2eWZiMyt3cGdCWm4x?=
 =?utf-8?B?RzAyMjVGbXNJYnRZcXIweWFtUlFWUVY5ak4vdkhuRDY1R0hucUorSnVlRUdl?=
 =?utf-8?B?bUJVVTBteExnVFBJZ2ZLZmR2MUtxWWQvdEROTHI1RURaRU5iRTBmUzNqQmkw?=
 =?utf-8?B?NDRUYUtMNFJUSUNUSDAydTVzT29FZXU4MWhGTzZROVVFbmZicGNQdUJuQ0xr?=
 =?utf-8?B?djZ6RThBTXdWMytGK2drRHNHenpjQ2hTUlJBSDN2YnFoU3g3b3pSdWUxOVMy?=
 =?utf-8?B?RlBnenk3bTcrZkw5Rmt6aERwRW01ejJhT29TY0tKcURCY2hma3k5RDlJRmly?=
 =?utf-8?B?T0RLbnN1WWVZZ2FaTmQxWkQ4S3loMWZUQmhSTE5yRUx5TndPVngweUJNZzl5?=
 =?utf-8?B?clZlSmt2WEpyblRlRi8wcXFjaTFFczdBVXd4aEhUS3I4RHBZaFhRQzNJV3RX?=
 =?utf-8?B?NGVBeS9CNFhUMWl1ZlJBK0ZVUWZUajMzZ2VXbmhkYXhvR2J6T2lidDM4aDFl?=
 =?utf-8?B?MThtaDI1RlVXdG1WUzJoeEJRK2crSExsUmdFUHZQY0NuTlRyb2tmNVJqNHFm?=
 =?utf-8?B?cTI5VkU0c0IzdWV6dTFOZFFCRUxxcEtUeUwwOWdCRjgrUVQ4QkFjN1Exa3B6?=
 =?utf-8?B?NEwzVTZndkFUVWFWak1oNm1iZUIyT0RScVNQdXgwdWZhNlNSYTlRb0xYQ3lm?=
 =?utf-8?B?UlcvU3IxQU11aUVuNm00L2FxR1Q5ZFhtY05GQmpHT2cyaGEya3R1ZEdXb3Yr?=
 =?utf-8?B?a1ViMTlXdjhVL0V1VEttc1drZlo5Y3pib2NPei9RcE4xcTl6TVd2emk0Rjk5?=
 =?utf-8?B?S0VsSVRaaC9CcEYraWxpRjRQSHloK2xMZ2o5SXlqcDNaYmxPekk2TUNUTS9q?=
 =?utf-8?B?YXRxbDBnR1JOa081cTdkY2dZcU9TZTFieXhYQ05DUlJCY0hVSW1vdEx4OThT?=
 =?utf-8?B?QlNWNnpwaTA1YXNoMk5adnMxWi9yWnMrQ21yVzNXZmRyOGVDYlZlVlJlWGlW?=
 =?utf-8?B?RkZJKzFLamowWTRWUkRpK2FodEQ3d21RNWRDWXlaRmNpZ2tDeU42NWpMazBC?=
 =?utf-8?B?L1lncWRiNllncmFPUmVSdFYrbVQ5U2JJSjNqbk5mcG5nK011M3RGdG1kd0ZJ?=
 =?utf-8?B?ajZ1ZnFDaXlqUDM4UzBUQWZRS0l6NGVGTVVUWGErOG5jOCs1T3hrYm93aVds?=
 =?utf-8?B?ZVJvSnZxYWhGVmVGVWdZSlh5T1lXdk9LUExPTUlPWnZEbU1EV1lScmlIcVhS?=
 =?utf-8?Q?rP131SZuBgq3v6PwHllbPnRrPKddYvaT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXlHMVVGMFJyazYrb1JRZ0ZOa1A2VFMvS2FabUw5UUVzOUxuWGY2a1dUQlUw?=
 =?utf-8?B?Z1o0TDgvVUIvY3Y5VjVLWm9DazVJSWxaL3dEa0RLSVNHK1BjWE5tWDJzZ0Zy?=
 =?utf-8?B?Mk9neGhEVVloOENkeUtOK095UkJnZytEZWgwTXZOZFg2bmNYYlFkL28zWXkr?=
 =?utf-8?B?cUY4d3FtL0JNSUNTTW1oQVRxWWh0R29oeVZ2UEdWcktRWmwrWWR2bHJyQjdi?=
 =?utf-8?B?OUh5Z3hQR2toVWIzMUUveit0NDVuUnJPWXlsNHg3aXVCTjNWM1hmTmdrOVRt?=
 =?utf-8?B?TzZqOUtiSnl4VS9qdlhqVDROM1RiazVPTnlyeGgzeHo0N05pZWFLekM4RXRy?=
 =?utf-8?B?VjA3RGJsWHpKNHExRjdESFluS0FNb1Y5ZjE5WkJzMXUvNS8xcmgyWE1yOEdK?=
 =?utf-8?B?cllyN3N1Z2JKMkxERWVhMTMwNnFiZ3A1TEY4dXpEU09HSW01K1cwRDFXWjlj?=
 =?utf-8?B?OEEvL1paQWtFT2g1Mi9yM1dtMWFJU3Zyd0xmUGNYVWxNL2xKbVZLaXp3TGxw?=
 =?utf-8?B?QTNqQ3FGcXRTcEI4MmdNUFhLY0Nob1ZEUTdveWJZc1Qvckh4VDIwRE84Y2tK?=
 =?utf-8?B?VWM3OWI3YjJzUkg2aHd0OHNSVllWZ3I3ZCtMeTVFcld1czg5QjROWTltWjBN?=
 =?utf-8?B?YmpOOHF6d3lIa1NpeUhmS0szRFA4QWQ0MWttVUh3Z1RvbWpIOE5EdlhtNVJG?=
 =?utf-8?B?UmRvV3JWdENVVUF6cVdtZHNTTlZHN3BpYWRkSlIrK2QwODBhZTFvTUFBV2ZF?=
 =?utf-8?B?V1dkT1FnY2RjKytHR0FxeUFGSGJONDI5Tmg4UWNIK3FTaURKelVGSXRic0lQ?=
 =?utf-8?B?Mm53MUFOQm9TOXBYYlV5Qkl1d0FUZUtKdVMyWksraUtMOFdiYU83UFFPMzY4?=
 =?utf-8?B?eEU1Vk03VFhxaCsyZFBaL1BqaEhBeGZJOVNtTW0vSFhZbkdVVURFTkI2KzJo?=
 =?utf-8?B?S0YyaUVJUXFDcUlNME9wQ0tYOHBQYnU5eFNyMzRuZlFySVg0eUo5b1RxbGJI?=
 =?utf-8?B?cUV3Q2cwcEZDT1E5L0pBNVZHSUFOMkZ4VkVscFk0ZDFiV25NOHpOWVN2bXZq?=
 =?utf-8?B?UEE1TU5ndDZ0UTBjczZkK1o5WnhjZEN5RytBRTlSbWE1M0Q2TzdiamtMRHVi?=
 =?utf-8?B?RUEybnNkY2RnbnlQKytWaVhWWTg3em9acHFORHhHZkVJMFpuS1IrTWYxNzVu?=
 =?utf-8?B?ZzlNMzRaTXg0TnRwR0VhYTZVNnlBcUxIZ1Z6QnE0M0FNNlVPS0hkbUUvUGJT?=
 =?utf-8?B?YXlwcjFvdzRjelFoV3ZzVlNheG0zMjhtd1MrZ0JqSEQ0ZVR1TEFHSlVnVFhh?=
 =?utf-8?B?emJQOGZyZlROTDFXRG82Zi9tMDJuRnFEU3lqeTNBVEpPc25iK1doWnpYNVBE?=
 =?utf-8?B?bHN2N2VaREJsZ0g1ODZkZ1NpbVhkS2wxd2dZWGhGZ1VGNk9GVkJUS01Bc0dz?=
 =?utf-8?B?MEFkalJNdG1mUlAvVGNpaEx1K3BXbFJySWtJVWt1Tm0zM215cm5DZm8xZW5D?=
 =?utf-8?B?UEFsNUZ0SVVBcDdpa1RtajhITHo2MTlRdUxtUTlQQ2ladDRKam1TSHMxeTNx?=
 =?utf-8?B?R2RtYVJWNEdnN1c1WWdSY0RVbWJmdHZjSTc0dEZ4cnJYYVd4WDAxa3VOZDdu?=
 =?utf-8?B?alpiSy9MaVFvVkZqU1ZLL29mMm00K0VZUlowWmJZZitnTitaTGpMaGE3elZq?=
 =?utf-8?B?ekxPeFlRNVI4Z3hBMjhwNit2cVovMWdmL1hGbVB1VGh1UmNPdSsvQU9vcWZj?=
 =?utf-8?B?Z3BKb3EyZFM5TWxQdW9OTEhhQUFzcGQrbitRWlZXVklhem9mcVAvYkU1VHRv?=
 =?utf-8?B?a1dVNTN4a3J4OEZNaUZ0bW5OVURHbFYxZ09XRGhMV1VlVUpHNkZUMWtUY0R6?=
 =?utf-8?B?d2tMZ1o1VXd5ai9ZVHhUQ01XazFzdHlFakJIamtHRFNMVnJseWxzL3ZqUnhQ?=
 =?utf-8?B?QVhBTlRnQUEvZTJFenVBRCtVTmk5VWhPeFg3eUVmeC9TdWJ2K0hROHRPTkxv?=
 =?utf-8?B?QmFKclgvNXhYNjYxWTA3RUd0K3kwSHpHODNsN2txMkFseFpUSTFzK2Z2elV4?=
 =?utf-8?B?djJIYTBHaEF4czIwdS9Ca1Q5WmNMTVBjL2tDV01ZMWliVmdaNkVLVkgzcmY4?=
 =?utf-8?B?K0NvQlBFSGxMdXdNRmtqT2pWS0o3cUNlNWYwUTRJTWRJNXlDRUFtRmptaVAw?=
 =?utf-8?B?cXh5cnhYRUFsU1pKd3czd2hWeVMyOTVmdlNXTzFjK3ZDOXpJdEpjVDFHcUJR?=
 =?utf-8?B?aWUrWWFrWDJjQ1I4c1RZbEJkSGZvcDRVM3V5NytYZzhqWmlHeWZjQnRZa3dj?=
 =?utf-8?B?ZGpheTk0SXhuWnY5Z3lLRUVwekI5dDlDY3lqQ1B6QTdneE9lWFRnemhTSi9V?=
 =?utf-8?Q?3TuE8pkErn2OhSIc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4de4a16-a4e1-449a-687a-08de488fa530
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 17:11:32.3662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rpTQETuMOC1vEzbkSBt/Jrpe4gK+6cEH1XBj9f7LeYTq69Am4JMFU0jTKA6SY/ZTX1KGxt6uOE2hW9YukrMlTyMZa0vs7NNL+yvxnrRd5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4580
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

On Wed, Dec 31, 2025 at 05:55:23AM +0000, Xin Wang wrote:
> Add a new pat-sanity subtest that reads the Xe PAT software
> configuration from debugfs and validates it against the
> existing PAT index helper getters.
> 
> CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>  tests/intel/xe_pat.c | 99 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 2fd3635fd..f003f0046 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -18,6 +18,7 @@
>  #include "intel_blt.h"
>  #include "intel_mocs.h"
>  #include "intel_pat.h"
> +#include "linux_scaffold.h"
>  
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
> @@ -76,6 +77,101 @@ static void userptr_coh_none(int fd)
>  	munmap(data, size);
>  	xe_vm_destroy(fd, vm);
>  }
> +#define REG_FIELD_GET(__mask, __val) \
> +	((uint32_t)FIELD_GET(__mask, __val))
> +
> +#define XE2_NO_PROMOTE	REG_BIT(10)
> +#define XE2_COMP_EN	REG_BIT(9)
> +#define XE2_L3_CLOS	GENMASK(7, 6)
> +#define XE2_L3_POLICY	GENMASK(5, 4)
> +#define XE2_L4_POLICY	GENMASK(3, 2)
> +#define XE2_COH_MODE	GENMASK(1, 0)
> +
> +#define L3_CLOS1		1
> +#define L3_CLOS2		2
> +#define L3_CLOS3		3
> +
> +#define L3_CACHE_POLICY_WB	0
> +#define L3_CACHE_POLICY_XD	1
> +#define L3_CACHE_POLICY_UC	3
> +
> +#define L4_CACHE_POLICY_WB	0
> +#define L4_CACHE_POLICY_WT	1
> +#define L4_CACHE_POLICY_UC	3
> +
> +#define COH_MODE_NONE	  	0
> +#define COH_MODE_1WAY		2
> +#define COH_MODE_2WAY		3
> +
> +static int xe_fetch_pat_sw_config_or_skip(int fd, struct intel_pat_cache *pat_sw_config)
> +{
> +	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
> +
> +	igt_require_f(parsed > 0, "Couldn't get Xe PAT software configuration\n");

Would there ever be a non-error reason for us to fail to read these
entries?  All platforms supported by the Xe driver should have PAT
tables, so I think it would be an error if we can't find this debugfs
entry.  So maybe this should be an igt_assert (to cause failure) rather
than igt_require (which skips)?

> +
> +	return parsed;
> +}
> +
> +static void dump_xe2_pat_sw_entries(const struct intel_pat_cache *pat_sw_config,
> +				    int32_t parsed)
> +{
> +	for (int i = 0; i < parsed; i++) {
> +		uint32_t pat = pat_sw_config->entries[i].pat;
> +
> +		igt_info("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
> +			  !!(pat & XE2_NO_PROMOTE),
> +			  !!(pat & XE2_COMP_EN),
> +			  REG_FIELD_GET(XE2_L3_CLOS, pat),
> +			  REG_FIELD_GET(XE2_L3_POLICY, pat),
> +			  REG_FIELD_GET(XE2_L4_POLICY, pat),
> +			  REG_FIELD_GET(XE2_COH_MODE, pat),
> +			  pat,
> +			  pat_sw_config->entries[i].rsvd ? " *" : "");
> +	}
> +}

I don't think there's much value in re-dumping this output while running
the test.  A lot of our IGT tests already spam more information than we
really want, and the information here is super easy for the user to just
'cat' directly from debugfs if they want to check it by hand.  In the
usual case where the test passes and everything is fine, there's no
need to dump a bunch of debugging information on the console.

> +
> +/**
> + * SUBTEST: pat-sanity
> + * Test category: functionality test
> + * Description: Test debugfs PAT config vs getters
> + */
> +static void pat_sanity(int fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +	struct intel_pat_cache pat_sw_config = {};
> +	int32_t parsed;
> +	bool has_uc_comp = false, has_wt = false;
> +
> +	parsed = xe_fetch_pat_sw_config_or_skip(fd, &pat_sw_config);
> +
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +		dump_xe2_pat_sw_entries(&pat_sw_config, parsed);
> +		for (int i = 0; i < parsed; i++) {
> +			uint32_t pat = pat_sw_config.entries[i].pat;
> +			if (pat_sw_config.entries[i].rsvd)
> +				continue;
> +			if (!!(pat & XE2_COMP_EN) &&
> +			    REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
> +			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC) {
> +				has_uc_comp = true;
> +			}
> +			if (REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
> +			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT) {
> +				has_wt = true;
> +			}
> +		}
> +		if (has_uc_comp)
> +			igt_assert(pat_sw_config.uc_comp == intel_get_pat_idx_uc_comp(fd));

It's better to use igt_assert_eq() so that if there's a mismatch, the
error message will include the expected and actual values it
encountered during the comparison.  Same for the other instances below.


Matt

> +	}
> +	else {
> +		has_wt = true;
> +	}
> +	igt_assert(pat_sw_config.max_index == intel_get_max_pat_index(fd));
> +	igt_assert(pat_sw_config.uc == intel_get_pat_idx_uc(fd));
> +	igt_assert(pat_sw_config.wb == intel_get_pat_idx_wb(fd));
> +	if (has_wt)
> +		igt_assert(pat_sw_config.wt == intel_get_pat_idx_wt(fd));
> +}
>  
>  /**
>   * SUBTEST: pat-index-all
> @@ -1230,6 +1326,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
>  		xe_device_get(fd);
>  	}
>  
> +	igt_subtest("pat-sanity")
> +		pat_sanity(fd);
> +
>  	igt_subtest("pat-index-all")
>  		pat_index_all(fd);
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
