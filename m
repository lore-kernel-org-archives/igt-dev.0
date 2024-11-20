Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98523D63926
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 11:02:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46ABE10E701;
	Wed, 20 Nov 2024 11:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFlWpBQe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E610E701
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 11:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732100551; x=1763636551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=N3bb3Xk2pl5B1JbC8xgARSPh59eK0glWBDNajiFxcaw=;
 b=eFlWpBQejp7UAp9u1Y5q+H2EVab+yGppzANT9uNenEYt+Nupekvy0EyI
 TmEJaoj3e+bEkXt5cV4mQi6yZeoOyAaQOYHnFXHdZHws0gLUPvjYWYj5m
 2XrfmyAZL9muT8RZe8N61s8HpWBY0pd40zHm2HXaH4IWAs50g6u8EPUm9
 sSlTokMQSG6oX7O8Ih1L5FSmkIsM2wByoHE/aCHrnRsn1PFd01e7M5mdW
 6+dEtpKKKT8rjibXF4evR8LqX3v8fdVci6JShU9lO0+SabTnqZRoKJ3d2
 5gzd30vlKJL2QL1v2yg+9EIB4ITm6dArISKGuPdASD17PqLRs5kLJH6VT g==;
X-CSE-ConnectionGUID: Mls7O2saStePV+kVh1f2ow==
X-CSE-MsgGUID: i4ASf4ucQ+mTr6hWV70SKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="42773297"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208,217";a="42773297"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 03:02:31 -0800
X-CSE-ConnectionGUID: VwV2Zoy7TtSsssqOPy/P+Q==
X-CSE-MsgGUID: yLSnRJdRQr+BgFW3ViWAxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208,217";a="94699051"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2024 03:02:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 20 Nov 2024 03:02:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 20 Nov 2024 03:02:12 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 20 Nov 2024 03:02:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyJBWrEW6q6gMzCljM/v8iv8qLHm0fg6uszGUUP5MPHySP45hj1uuPL+DT02tnQDMIw99h69xl1JNQT4RHaDjwUzYPUXyP2+VQ8zQG/ANV0NAEFqFTwqcHNaLll5Ip6b2B++25SqnHpqCe43gLsQbiHq3bnPkESUWgMiWeK6mR3w2ghAdeDwebVmBwKOgZdQBXm133UmjYOyJPVK2tHbyvg88y35IWDr3sAveQn3d4T7Effd2Ei0IuQySucJCZhF9cUBrJHwZxbhV0jZ/LsGhtoL4ooj39qL+tw3e9XyWRIEDVOkNgQ4F+SeVoLeK5JQLYD2Fur1ATZKAchOVvx9zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sD1TuOBdRQte2uyx70IpzK42yHtlQmwAjxlbzZzZds=;
 b=xKpaNYncl+fB8y7hHt0zVM3ARFaK58KWJkaECOFWyK65TZdKBKSXCv9gilcqPLuLfrf48d8onT+tAO3YfFJU7xr/q5DHUpUVRcQ7Vqi6+VYwdE0ty8AUA69jGE7bwOXtDqOVgQZRGZJNd7gzE/OiZ0qhLQFpBDqb7gXliilvrA6FBv2Alo5KFZg4KoH9ubqzHN3O1nS76POum8tWtDUuGGnIcuWjhiJonTKzU1EcdEgpZr51GU6UCRuJjC7nmQ9qxv6O9/bN/A1pTJlJNy/dDDUkF1T3duqUEVRQhpq7GqpTSyYd0bQ4aorA7yjjCnlR0QbBigMgZlzEFGAWIeKO9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by PH7PR11MB8453.namprd11.prod.outlook.com (2603:10b6:510:308::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Wed, 20 Nov
 2024 11:02:09 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 11:02:09 +0000
Content-Type: multipart/alternative;
 boundary="------------ABbo2R00PchVU23GemQFm0Rg"
Message-ID: <0038a4e9-88ca-46bb-b4a7-e9964fb0823a@intel.com>
Date: Wed, 20 Nov 2024 12:02:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/xe/xe_mmio: Replace open-coded init/cleanup
 with existing functions
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241119155538.605000-1-marcin.bernatowicz@linux.intel.com>
 <20241119155538.605000-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241119155538.605000-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: WA2P291CA0007.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::10) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|PH7PR11MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: bf4e98c1-4d35-4ef5-a6b2-08dd0952c74f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WitjZVJNd2ZPRWFKa3hVWU5sZ0thVnBJS3JmbjdkVE5WLzc4bEVVQUNsSlJn?=
 =?utf-8?B?N01kQWRPc1Q5Vm1kdFVMM2JpZU44QmsrQnZxQkl0bWw2czNuQ2Q2NHR3Skgw?=
 =?utf-8?B?T3hRREFBOUdvSGZmeDRmUXRpT0ZmNXNoUVNuRkxLcCtnWVdwNWp5YnhJRXkz?=
 =?utf-8?B?R1NCdWxhTmJtd0MyekRBUjFvQnFzWmw4QUZjY3FyK0dyU2ZtT0NoTUxVVjJm?=
 =?utf-8?B?TkZBSVd2NlZ5U0p4eWd3MnFtcEYyd3lWaFNJTElKY2NvaXh4R1hNSTZXREd1?=
 =?utf-8?B?UEVCMGFNRk1Qc3E2NzlKNmRoMFlHV1F2YVUwVzJlM2FlR0tDelVTeHV1anJO?=
 =?utf-8?B?Yk05aFlLeFlncW1NanBiQXAwMGJoaXVnTG11cGRVSTN3NTdpNkRVR09pS3VR?=
 =?utf-8?B?TUJsOVMyOTZhcCtWdnJicDk3dHNRUU81a1F5ckdXTUNtWlBOL3JBOTRHNXpO?=
 =?utf-8?B?eEhXamhodmFLOHR6cVJlQlJVNXgwNWdCU0ZSVzFOYVlJRTlUcWdxekJNZ084?=
 =?utf-8?B?czFwbFF2ekhLWEtQOGs2NG1mV29VQ0JiWVA5emc3d3Q3eFFWdEVIN0x1SEE0?=
 =?utf-8?B?bnBZWTNtcFRIUkdPVEowQ2M2aWE0NWZ1MUFZOGhyWHFPTWxUekFPRmQ0MTd1?=
 =?utf-8?B?T212ME1QR0c5WTFrMTNRY09tSERhUjg5NVlacm9VOWFiK1FWd3BxdDgwMHBT?=
 =?utf-8?B?eER1d3U0dVMwMGVVYnlUd3MzNkYzNUpsTlVXOEtsbEx4SnQwNURFRExqQ3Bn?=
 =?utf-8?B?NnBQNjdvNG10WHl1bFhlcFcwdWV3d0thWHJxMlZGVnFsVk4vMTI3ZnhqeW9r?=
 =?utf-8?B?L0dsbWxRZlI0RzFZS0lhVTFNaVN3N2RuOFo3M2gzaHppL2NXblVKR3hiLzFn?=
 =?utf-8?B?TzJ1VXFRT1duVURIRVBZUTNYdmRtY09nQUVvZkd6MUdFa294VmdHNWNuUFNG?=
 =?utf-8?B?SXhNYzZOeW9yNmtVdGprQlRPRjlvank1Uk44VENReGh4NVVtWTRVc3EybzlT?=
 =?utf-8?B?YTUwUTNmd1BWb0FkSVArUnZuWkZTb05ybFZ2aHRnZ3VhSTQxWjBncXMyd3JH?=
 =?utf-8?B?Tmo0M0JSNmxmUE82R0hTbXFuYVYvUU5heFJJelVLL3dLL3ovNjJmODBVNURy?=
 =?utf-8?B?L0NlNXBxbTF2L05Ja2h2bTVlaWtQZGtRYkNGZU1yWGxkWnJSV1l6RlhCanNk?=
 =?utf-8?B?V0xlbTRnS2xVYlBDM1UxanM2VGJHdWpPNk1yenVWcHRUc3dzNGUzcFVIdllF?=
 =?utf-8?B?ZWVnTWRSSy9WY1lkbElSNGxuNjNpNnF2REhQNnN4RDlvbXJQSnRVanFvbHRw?=
 =?utf-8?B?ZEJnY3NWTWN2Si8vWVFaNWsreDdSYlZGVm15UFE0aW90K0ZwS0lSZEtpVjlh?=
 =?utf-8?B?RzFaUFZ3TXNhYTRsdEVFK0JxdlpxWXlYQmFFWC92UHNWb2tkT2hjZGZMQUs0?=
 =?utf-8?B?QndDV0JjeTJyd2JwRk9Ga2dBTDY2VVJGTEpKa3hBVXFYT1pyMW52Z29hK3lm?=
 =?utf-8?B?YVNsWlVrUXhRSCszeUdTemxsL0N2RUhzZ2srYTZmWGJqSHRJOGpJMW9ybGZo?=
 =?utf-8?B?Y2s5REtnMGwva01LcXAwNGJMMlpKRzF2bTZsVjBsU0tJcHJSUFJ0ancyMFRH?=
 =?utf-8?B?d1hiYjdDTUJpUWRYeG5ZWnFmV3ByakVYTWZhTHI0dG1xNjVtN3Y1c1BvZkFK?=
 =?utf-8?B?emgxN3d6bkVrM2toVEdKY2prL1ZIeFVoWVRNMEV1V0diNDE2QnBKNkdvVFc3?=
 =?utf-8?Q?9f46OELEXHLXxbbSoioJdKUe7fHsvpvsH19ZRzJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmp6TE12RTc5YTNhaWI2TVpGOC80eWV2UGJjaHI0ZGhBb0ZHRkpWSWlhbG5S?=
 =?utf-8?B?NjR1Zk51MzRsbEZ1UUtXaDRzZTNxMk5CVFhnenkzNzhJU1NrVXUxaDBRTjRD?=
 =?utf-8?B?ak5IcjJyQm9lZEcrTFVOeFR3c1FTdkFJMjJKU29ObGsvWm1rYlBnNlVmTmlB?=
 =?utf-8?B?NmJiM21vQmt4V1pkNWdYdWtsc0FYVTR0cGUweEN5c2h0ZlZEWnBlNkRyY3By?=
 =?utf-8?B?KzBOenlOSEJTRDZ4OXE2NlBZZUlmbWg4Q1p2cjJqMU9EZXltQU9KMkNTWWsx?=
 =?utf-8?B?WVJKNHgvWGowbDdLWWZiWGZ4ejNxU1paRWtWQmlOSU1pejJrRnZhc1pIZUlV?=
 =?utf-8?B?bWVWcXJJeks4VExDOUNvTE1aOFJEWDZmS2Y3UEFSeUcwb1p5aWFDSFBvZHFn?=
 =?utf-8?B?dVNqMGpOWHkrWk5aVlFjekRpdW9OQlVuQXV1d3lxVFRmY0VCZDR2VUZaTWMz?=
 =?utf-8?B?REgvRmcvSzhqdWNWVGkzTUlMSnplMzUyYzh1dVBSa2cyVFVnbG9rM3lLU2kw?=
 =?utf-8?B?TzgyK0ExTHVOdkNNUjEzSWdwWE5nQy9xQXh6RHdXSkZaSkhlV3ZiK0dYaTNS?=
 =?utf-8?B?U1JBaGFvMUVUQ2M3anRpT29qTEM5bkcwdFArS3JLa2JCaXliL1JrQkU0UHpO?=
 =?utf-8?B?NU9Pb2dGcEdGSWhsS1JBL1ZJMXZOUGZkT01saE9PRzdhNWQ5SDF4K3N6dGlr?=
 =?utf-8?B?RlprSWpBTWt6TWZNVXdUTVk0YWRHQVpjWldua05lUjFqVWpydTRkcUFVTStx?=
 =?utf-8?B?MWpRRXc5S1RiY0JsQjlHZXZuN0Z4WkxLbEtBcjd5TEtrU2dOckVCUXA1TVA0?=
 =?utf-8?B?NGVvM0o4K1ZxVklhR0Jtalh0QjNFUy9FcUFpbHVESFFWNWdTL0djY3IrZDJ5?=
 =?utf-8?B?K2xGS0dsQzQ3TGI4dFhaYUFlTzBSdWJGZkNZZTRvaUE3VW5TSHQvNWpyTWFu?=
 =?utf-8?B?c0xLYUJoeHU2Vk5OUWFGUjJGcklFVGgwVC9qU2V4a2hiYWd5QjMrMnExcENF?=
 =?utf-8?B?WWlxV2w4YlJXMldBK0hSdHVNWkFzRlgxOWdENXJoODJpaVc4UEIyY05WUll1?=
 =?utf-8?B?YlRYMEVsMTdFVk9PYnMvZEhQKytCUEpyS0JaTnROcytXVFB3TzlaSmtpd1NU?=
 =?utf-8?B?QVFDaWw3ZXVwcFp5M2RWQ3NFVHRyaTErV1RHZXAwR1lwSmg0aGF5QnB1ejky?=
 =?utf-8?B?V2JvcXVJNGpzWkEzd1c0QXZSMWx0TlhLY1J3UmQzZ1JKV3JWQStPQ3RCeHpK?=
 =?utf-8?B?WXF1VDh5Mjhib2xKVXFlTi9pT0o4eFpUbzVBN280a0VVNkx3NFA3OXlCZjlY?=
 =?utf-8?B?VXgySWVIVmNoN01TTlBlMDBsWERmVXNSejVZZ2VOekJMc1F5ektpbjNjWU5t?=
 =?utf-8?B?SVhWMG91VXhIQ2hGcStQQVJOazFQeElLYWJSYlJDQjVxc3B0dkVpQ3lmYlBo?=
 =?utf-8?B?Zy9Ha0hWK1RPMkVadm5xZk03bG8vcnNDbXVsZ3ozU2plS0ExRGpSdFMvV2ds?=
 =?utf-8?B?ZGpjRnVLT1NRQzZSejJxYjJDdS8waitoaithSU0zL0UvWUNLUWNISmdwZ1VS?=
 =?utf-8?B?UkE5SnFjenhiUlZYbTVpazErbWMyUXdrUkk2aU9FVDJBaGthWEhuZHJyNVF5?=
 =?utf-8?B?TERSTTU5R0pHYzNYSnk2ZWtzK1VTYVdabEg5eVlRbm14eG4yMnZtN1IxcjdC?=
 =?utf-8?B?a24rbHpXSkMzOGdpaHE5My9iN1Y1bW9lNUZ1cjQ3Nk95K1ZwSUkvM2xXeUhz?=
 =?utf-8?B?UXQwaStQdmhHeU9sY2FBYTVYK1hXZ2RCNjFWVUo4ZTdoWTg3cDdKbnI2ejdW?=
 =?utf-8?B?aC9iSjlwMHlqaHkxNEJ6RTZ2bXJzVTZtcGJxWE1XejBjRzF4aWU3ckRhMnp5?=
 =?utf-8?B?NnBNSFo4amgwRzFqSmNCY2o3SzFiSDN5VWxkczJSekI5ZWNEd3l5OWJGV3Uv?=
 =?utf-8?B?L1hrcDBxcWpVb2E4dWxqUXZJMWc1QkxESFR0cmpyeFlXT1YxQW5TMzQwN2JR?=
 =?utf-8?B?bmtWMWFBQkZPMEs3YTBrRC8zKytkTkJjUEg3K3dGUWw5eFFNSkFNNzcxSHp3?=
 =?utf-8?B?cHd6bUJFS282RWRqN3gxaEdXTlcwQ3oyQWZXZUE4TTFkUUtnbk1zQmZtSUVt?=
 =?utf-8?B?NE1VZWZKT3FPY3gzVk5HMU4vOUo5SnpQNTVycW1FMmd5bkZrQ09Qa0RER1F1?=
 =?utf-8?B?U3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf4e98c1-4d35-4ef5-a6b2-08dd0952c74f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 11:02:09.4412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flRTPkdXPYduqdZLAllvO7kzK9jycG1gotyGp+HFlEKU75GrgskrgTvIYB6QnWwAOVpP+csm4qYRlAZdwmo8UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8453
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

--------------ABbo2R00PchVU23GemQFm0Rg
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/19/2024 16:55, Marcin Bernatowicz wrote:
> Use intel_register_access_init and intel_register_access_fini to handle
> initialization and cleanup, reducing code duplication. This improves
> maintainability and ensures consistency, including handling forcewake
> for Xe.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny<kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> Cc: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   lib/xe/xe_mmio.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
> index 0817c12f6..834816133 100644
> --- a/lib/xe/xe_mmio.c
> +++ b/lib/xe/xe_mmio.c
> @@ -23,13 +23,8 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
>   
>   	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
>   
> -	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
> -
> -	igt_assert(mmio->intel_mmio.igt_mmio);
> -
> +	intel_register_access_init(&mmio->intel_mmio, pci_dev, false);
>   	mmio->fd = pf_fd;
> -	mmio->intel_mmio.safe = false;
> -	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
>   }
>   
>   /**
> @@ -53,8 +48,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
>    */
>   void xe_mmio_access_fini(struct xe_mmio *mmio)
>   {
> -	mmio->intel_mmio.pci_device_id = 0;
> -	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
> +	intel_register_access_fini(&mmio->intel_mmio);
>   }
>   
>   /**

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
<mailto:lukasz.laguna@intel.com>>


--------------ABbo2R00PchVU23GemQFm0Rg
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/19/2024 16:55, Marcin Bernatowicz
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241119155538.605000-2-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Use intel_register_access_init and intel_register_access_fini to handle
initialization and cleanup, reducing code duplication. This improves
maintainability and ensures consistency, including handling forcewake
for Xe.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
Cc: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 lib/xe/xe_mmio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 0817c12f6..834816133 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -23,13 +23,8 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	igt_assert_f(pci_dev, &quot;No PCI device found for VF%u\n&quot;, vf_id);
 
-	intel_mmio_use_pci_bar(&amp;mmio-&gt;intel_mmio, pci_dev);
-
-	igt_assert(mmio-&gt;intel_mmio.igt_mmio);
-
+	intel_register_access_init(&amp;mmio-&gt;intel_mmio, pci_dev, false);
 	mmio-&gt;fd = pf_fd;
-	mmio-&gt;intel_mmio.safe = false;
-	mmio-&gt;intel_mmio.pci_device_id = pci_dev-&gt;device_id;
 }
 
 /**
@@ -53,8 +48,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
  */
 void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
-	mmio-&gt;intel_mmio.pci_device_id = 0;
-	intel_mmio_unmap_pci_bar(&amp;mmio-&gt;intel_mmio);
+	intel_register_access_fini(&amp;mmio-&gt;intel_mmio);
 }
 
 /**</pre>
    </blockquote>
    <br>
    <span lang="en-US">Reviewed-by: </span><span lang="pl">L</span><span lang="en-US">ukasz </span><span lang="pl">L</span><span lang="en-US">aguna &lt;</span><a href="mailto:lukasz.laguna@intel.com"><span lang="en-US">lukasz.laguna@intel.com</span></a><span lang="en-US">&gt;<br>
      <br>
      <br>
    </span><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------ABbo2R00PchVU23GemQFm0Rg--
