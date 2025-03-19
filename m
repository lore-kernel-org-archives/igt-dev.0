Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81201C36000
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 22:22:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3648F10E1D3;
	Wed, 19 Mar 2025 22:22:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hJDU6qor";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A4A110E1D3
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 22:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742422958; x=1773958958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ij6g464QdDKaQV/h7c2lN4387/T39Z0b6YnQCMLBX0c=;
 b=hJDU6qorDuBrUB5LuTNewwuDvneihga4ZhXeKZStWYK+lOEyA4l5xMaY
 7Ms40oGSdhqhECG3DQXJlvm0BmWzNT1gGc9QMZTv2RXDa+DOUnt+f0naC
 jZb1HNfGVScqWBa2/vSuylwlay8UYSkwfh6HyT7F0lwUNxpZUu5koko+K
 e0LzG4K0dqNYR9RTUMbuU3jU+nLohvzskLORXgP84/lE22x3Oon32qisE
 ihTiqaN+elr1Mb8m1AXh4WlQgSHgNEP70dWGYkIq9zw8s7rjsFHeMx0Tt
 PMVOY+QU7abWnAy3A1ZJDi8Bhkw4qMY9JqaDbNSHJEB34gn5Z4bOaq+RR w==;
X-CSE-ConnectionGUID: vqTp8t08SrC7kiAONtfhqQ==
X-CSE-MsgGUID: dGV6rWR7TaupMaDEIWUA+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="55012553"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="55012553"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:22:37 -0700
X-CSE-ConnectionGUID: Afq+jHG7RIKiK+jWU9uPTQ==
X-CSE-MsgGUID: y5Hl+OpjQC6GROy9ZeHpeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="123594279"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 15:22:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 19 Mar 2025 15:22:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 19 Mar 2025 15:22:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 15:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VnYkO6qFo25LthTAIxCevGTx76hzERVY8JF2v50hscWMSTgN+b7OCOjKjK72FslYhY31O2vgz2rC1NnutIMBiGrZItSo+Eq4vZHQ1dKcloyJ8VV3KKS5iWBE8OJAJ63pYQYc3ji8KJsZOFYOIywhBbM1uxMOzcbicfwcHmevM7uH1k08r8DWTlwX72lm++3/7EKeTiy3fvMdKbub3I+zDqo7ZQe+3pQZfwvPKBLvyhz7pfsOX05VgWV02MIj2WllXUiCFIwhmHz78LyqlpoxEDXIW0vkKcQTJ89n0dEw0/HibrTsv9/drFtTNCD452fi6z9cQmb6u/RuN0WSeBIoQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laQSUnhRP03yXeU0pgTskWH6bG0gCxpf2Gx/RsfbH6I=;
 b=q2YLznx2CZ4k8mHP2VB9Rpjtf/Qr58J4hf0JN9auEDhoDIX2FHJ6gRUx72i74NR47vzk4A9fEP720GlJxFxyMt4qG4B91uRs7Defb5yhwBe/u7kJULxpDlJl+SFnNaGskPACLcqSQvU2GOaHwn4OwEoYC5DBzPXcBMUVFHKmymZqzKQ2F00JXzopFFOQ1fHCZAcvt+YGJzrpT69icn89RAAh6mGtoow5sQmM0CLfcKKKY3Be4OCRgls8Nm7H79nUnV7k9M3uRdnrvreGK2bHUS035XUuIur7+QXIOOA1FlhnKhv5DIUMKr9tt/ZC710tZbrmw8HV1hItnC5tm9mN9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA2PR11MB4842.namprd11.prod.outlook.com (2603:10b6:806:f8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Wed, 19 Mar
 2025 22:22:07 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 22:22:07 +0000
Date: Wed, 19 Mar 2025 15:22:00 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tests/intel/xe_pmu: Add engine activity
 test for all functions
Message-ID: <Z9tDiCsZ7XHXN8ja@soc-5CG1426VCC.clients.intel.com>
References: <20250312062431.2238409-1-riana.tauro@intel.com>
 <20250312062431.2238409-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250312062431.2238409-2-riana.tauro@intel.com>
X-ClientProxiedBy: BYAPR11CA0038.namprd11.prod.outlook.com
 (2603:10b6:a03:80::15) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA2PR11MB4842:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d80ee2-2a77-46e9-2316-08dd67347bc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2ppTEN1MDdrV0x0VTB3WUhRUm9Yak5KQkptSUxYUmdSZW8rN2MwRjQwa0FR?=
 =?utf-8?B?L1ZnMUpyVTFqMUVxR3lCVnk1dWFiOXhpRFhBR29LS1Y5am84Z0JXN3NJc1Bl?=
 =?utf-8?B?WlZUTzJGY3k3R1AwbVlEbjZvUnE1d25EaVo1dHh5VVoycVY5TS9ablk0ckdH?=
 =?utf-8?B?TUlSSURPUmN6QzByQ0hmOXFJZHM2aTdRaTBjbmtpa1dyLzU1SFpXSi95ZmJn?=
 =?utf-8?B?WDJFZ1BXMC9tL05Ob3RpM0Z4OS9rUy8xbE5TSnRZTnBVdEtWbHRUSVdjR2FI?=
 =?utf-8?B?VlVzc1lqY2t2TGF6bVNGT010OVBlY3RaNFpINE5DeCtRSm8yL2xKdkUrV0V4?=
 =?utf-8?B?WFk5TmJaMW15UGdDR3B2QVJlenVxTGdFOEVnTTROTjROWCtEck1pUnBCeTJm?=
 =?utf-8?B?SmdibHI4MlRYNXFtVFVndDQ3TzM5RzB2TGxWODN2eE9EblJlcUJ2TjVEUGJL?=
 =?utf-8?B?MTE5Q0YvcFJ4MTczaTExRnhoRlQ2V3I1ZjUyMEluMy93RFNCYzVDaHNQekVn?=
 =?utf-8?B?Y3hhQjMrby9CV2VENnZUQjJrNFg5b2JweTZFQ3dNVVR6WW0reVdKclIxdDNH?=
 =?utf-8?B?ZVNiL2FsZHdDQXlGUVMrMi92aGVKL1ZWazZkZDZPSEVOSXV5aDNFU2p3NnJi?=
 =?utf-8?B?TXU4M0tiajdwWHBqd1l3bWJvejBRbjRkZFNIc1pDMHh0Zm9ObU1ORDcyd0wz?=
 =?utf-8?B?VkFCZzdYSGhDVXp6K1BLZDhYV3dHcGk0YXhQZ0szMTFSays2Sk1yQmgxZ1VN?=
 =?utf-8?B?NjV0RWkwcnFrenJnVTFvczhvNWk4RWlLZTkwSVlUSWNxdHYybHVYOEgyb1c2?=
 =?utf-8?B?NGJMM0Z4dS8xc1NUanFnZUZITjd1RlVEL0w2ODNKaklwc1ZNNm1hNzJ1Q0pC?=
 =?utf-8?B?c2p6bzFyUVB1em1UTEVDMWlSbFNlNzBLU0pUTE9idnBvMFlwcjFFRGRIZGVL?=
 =?utf-8?B?cWJHdGRKQVN0SGtLWU9oYkV0K3psNEx5MnpYOUhKSTMrU2JIU2xlekFLY2hh?=
 =?utf-8?B?Y3hBQVkvZ2ZkVnR1bkY5U09NOVNuT3pSR1psaEUwQnd3ZTVYWkNwNjg5dHpq?=
 =?utf-8?B?QWYzSXRSOHpsUTlDL0NJRWg1TlNoR0tScHhGaGplTjVCaWpuUzZGZzlsZG9T?=
 =?utf-8?B?TTJMYTMyNXZXZFhlSVUwUGZrYWJySkI2VnhrblYzSjJMdEFsdkdhL0o3RmJy?=
 =?utf-8?B?Z0VZNVRaaEgrbVBJQlJqUzUxVEswOWh6cXQrVWQyVThpTlRZQWJVT0U0Wmt0?=
 =?utf-8?B?dEpvQnBQai95MEhaNktORmJBekgvSXlJcDhKUXM4KzdzZDBYYzk4TG5IUURq?=
 =?utf-8?B?QkFyTnBGWm1BemJoRzlsUE1YWC9Ma1ZTREV2NkFlZWtvQkpva3M2TWRTTHpW?=
 =?utf-8?B?WG9pWGJISkpJUTNGKzBqNmZtSjVKd1BkZHNrcS9Ydnl4RDE4d2xOd2dMSGlo?=
 =?utf-8?B?cnJjSHl0cXRLRDQvaTNtODBuWnQyZ1lxUnVPT1FDUmhSK0VNcTB2K09QNWxD?=
 =?utf-8?B?UWJ0OUI1bnNyZyszYTJrVTVtYXhtMHZ0azJaejNDY0RBWHVYSk9aUzQ2ZGV6?=
 =?utf-8?B?SFhzVHVSMi9IN2lOWTlkZCt5aFZmN25aWlZ4RVVuU0RyamM3YTFQSGNXMWt3?=
 =?utf-8?B?YUtRaURMYzZzaUptbjc3ZmZSallXcGp5aEJnUjhBZXUvSzVIUWhya2hGVjdl?=
 =?utf-8?B?UXdOa3lGZjEzaXROTHQ4QVBTYnpLcFBybzdXbjFzRmFjdnFPUkhhakU2eXVX?=
 =?utf-8?B?ajlNUjVJbFJ1aU5oUFpSSE82U21IM3JpVTVlL0RoVCtjYjZTb0IwaEttbDMz?=
 =?utf-8?B?RjBtUzc3R0N6d2E3M1hUVW9qMllWSTdiNFlka2F3Q0toTlpJZ1pzNENRQ3Zz?=
 =?utf-8?Q?fEY0iQ+pnswu3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzB6WnVyN0c2YU44NjZMeHFrU2crZ1dFV3hKOWRzSG5wbm81QXhRU1dtVENH?=
 =?utf-8?B?K0pPWWp4eGgwMXZQT3lxV25ZamlBS2JuQmxmNDU0aFJlL2VaR1Vub2hNcGtw?=
 =?utf-8?B?c0F0UlQ4YmpOcndXTnhwbVlsenM0OVdPdHF0VmV4dkUwdnRSUi85NHlRL29W?=
 =?utf-8?B?WUJyaGdFV095R3ArRktQaWZwcVl5ajF3Y0F0bGsrT2FnNGp2MFNKa0NkbFow?=
 =?utf-8?B?YzZvcktnRytCVVFOZ1dvRFowRWZadU5QY2pDc1RDSEZ3VHBZZXJiK2VjMFNR?=
 =?utf-8?B?MVFpaFdXUEYvQU13UWVmUTMxQjdqc0NXR1dMZ2ZhYlNWMFpUaTZPbUhjaHZh?=
 =?utf-8?B?QVQvOTgvak91NnZnbldFc3Y2cldQRUxjOFh2THI5bnI1QkUwUHo5eWxBZWFx?=
 =?utf-8?B?dWUzQTBxbGJEWEI4QTZCWjNOcEVBMjM4UnRxQ2MvS0drdWRzcXo0dmdSSC9o?=
 =?utf-8?B?V3NrVzR6YUN0MGhSTUpXZk4ySGYzeDJLSzdGVVRkUGg0QWhEKzlNTVFyQXhk?=
 =?utf-8?B?QXJadHFVSDFpeGV3a01SNG8wMHQrK0U4YXEySEpScHVZWnkzZHp5MHUyRzVs?=
 =?utf-8?B?RCtUZ2UvUVhVMW12VVFkTVhoOEV6V3hMb2VHSzgzbFBhbW1RL0dyaXV5Ny9z?=
 =?utf-8?B?VTNUbGY2UEdXbmFRY3FqTDFCV29OK0JTckVrYnV0ZGlnYnRQc3hzTDJPRnZN?=
 =?utf-8?B?UFFISWxyV28rTVZRNjNPdXcvK1A3VlhYWjV2dVkwdkZhOEoxRFFHSXpoTkta?=
 =?utf-8?B?RmpGZ25LRlRyYnFnd0hza2VSRVcvaGVKTVRxZ1RFNXI3SkZIOUdEUlMwd1RO?=
 =?utf-8?B?WVNzQzZOdmxtU250TzVmemw4b2ZreGdiU21EVFZTZkpFRVVPYXV4cEEzdjB6?=
 =?utf-8?B?MDNRSjd3ai9HNVRJYUtFRnRUQlU1RzFYZ1BQU3ZTeUJzZUQ1UVlkMnFBSGp1?=
 =?utf-8?B?eXR1V1NTa000THdqQkR0Smd6bHBjVTFQelFOUTZSV053QmI4WjVTdkEzUlFp?=
 =?utf-8?B?akt1QVBOejhHUnoyZjlSREorNjdmT1MvRE56VFlIRnpVYThmLytLRFpNOFVY?=
 =?utf-8?B?YkVhdGlHeVF0dG1hQkRBZUZKUUpVZytYODNyOXdFNDhCWHlEZVVKMi9qOS8v?=
 =?utf-8?B?ZlB5YkY5S0c1TkQ2QzRIa01PWEYxbysydmhMRUZXMjVrWXBjWWFIc24wbmdr?=
 =?utf-8?B?c0RDNFF0Wnh4aGVXbzR5SnRjV0RJMTZ3Y1FQOHl1a3ZZWnRRVDdIaWtwODZS?=
 =?utf-8?B?V1J2d1FJREc5Vk1WSWZYdnh0c0lBNGh3QVp4cVVQTTNWUXVTcHFkL2d4Nllt?=
 =?utf-8?B?QXlSSDMrWi9IWXNCSG9kWFdwNTFwcVJrVG55clJkWGcxS2JYRGJSMnJIVXhJ?=
 =?utf-8?B?eHpRRStTUEQ2K3ZiSVY5SWp3YUc0am42SC9YcDJJWGNneFVwRFBySjgzdnBJ?=
 =?utf-8?B?cjlTdS9CaTZabVlGSW9wYzh1UjJFa3d4RzFjV0ZDWFZuZzhjN3BaM2FJcUJ2?=
 =?utf-8?B?b0oxRkMwMVVpNjlKQmEyU1gwOVpWNlNVcW9xU1NjSTJLbFRmL0NOWHBma1RI?=
 =?utf-8?B?Q25PSGhGY25oWS96VHd0am1pNmxWWU1FRzl0Q3hSODZlSTlhdEZQRHI1WmZ2?=
 =?utf-8?B?R0hRMEdzdC8wZkY0SDh3aTdBYmZRSjA2OHRkVUZVODdtWTJ1Wi9nOXQ5Z1py?=
 =?utf-8?B?SHhlVzBINjZxQjdSelNuckVtdXN1ZktnMC8rcE84VnVseFZFNnhjNnR4Z041?=
 =?utf-8?B?M3ZhSzhsam4vUUV0SGNCMmxLeG5NSTRKN1IyMlZtNXBMdk1xNzFKMGtBZjQ2?=
 =?utf-8?B?aUMvNGNWNEY0ekJIenZSMkQ2eFE4T0wrSEVEaXZwZXZBdzdERTA4VjBVVUZI?=
 =?utf-8?B?ZjVQMyt0K0Y5bytIS01KajIveFUxdHVocGdZU2J5U1k1dWwvTDBkNlorRzEz?=
 =?utf-8?B?dE1LOWhIeW9SUGt0K1c2eDFISElMK0ZFYXdDWW5BenVPdXo5QzQ5NGFPZUlV?=
 =?utf-8?B?S2J0ekQrYjZSb0pCL2lwaWYxa09jUWdKWEk0WHA2ZGQxYXUyL0VyMVgxMzc2?=
 =?utf-8?B?MzMySHkwM3E1aTF0QUFTRWY3V3l4UU9FQXlhRTc5dko3cFkxL2tiajF3UmVM?=
 =?utf-8?B?NzRxUEVMV0ZvVk9oRERTM1Bwa0hXKzRyWHMxREtUbzhIM3FGNjFPc1lLdUVk?=
 =?utf-8?Q?EimPmMDPnuiLxyIjPmYTpJA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d80ee2-2a77-46e9-2316-08dd67347bc3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 22:22:07.1758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: os/Q8uNPrXivpkQBV4IEXArHQALHRjpDP76MJsT/vPvqF1rwIqEA4EbSiQwLMFJ2KYobUWLLYmVvtzTacBp0Dn01MihtSA3B0d9++PILj8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4842
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

On Wed, Mar 12, 2025 at 11:54:30AM +0530, Riana Tauro wrote:
>Add a test that runs workload on all functions simultaneously and
>validates that all engines are equally and fully loaded for the
>entire execution quantum of the function
>
>v2: add a different function for function config
>    add function details to log
>    move pmu_fd to struct
>    enable and provision VF's (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 130 +++++++++++++++++++++++++++++++++++++++----
> 1 file changed, 120 insertions(+), 10 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 66edf24ad..a95ee1777 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -14,18 +14,22 @@
>
> #include "igt.h"
> #include "igt_perf.h"
>+#include "igt_sriov_device.h"
> #include "igt_sysfs.h"
>
> #include "xe/xe_gt.h"
> #include "xe/xe_ioctl.h"
> #include "xe/xe_spin.h"
>+#include "xe/xe_sriov_provisioning.h"
>
> #define SLEEP_DURATION 2 /* in seconds */
>+#define TOTAL_EXEC_QUANTUM 128 /* in ms */
> /* flag masks */
> #define TEST_LOAD		BIT(0)
> #define TEST_TRAILING_IDLE	BIT(1)
>
> const double tolerance = 0.1;
>+char xe_device[NAME_MAX];

These globals should be static.

Optionally, for easier reviews, it's better to split the patch in two - 
(1) make xe_device global (2) Add the engine activity test.

With just the static change, this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>
> #define test_each_engine(test, fd, hwe) \
> 	igt_subtest_with_dynamic(test) \
>@@ -92,7 +96,7 @@ static unsigned long read_idle_residency(int fd, int gt)
> 	return residency;
> }
>
>-static uint64_t add_format_config(const char *xe_device, const char *format, uint64_t val)
>+static uint64_t add_format_config(const char *format, uint64_t val)
> {
> 	int ret;
> 	uint32_t shift;
>@@ -105,26 +109,30 @@ static uint64_t add_format_config(const char *xe_device, const char *format, uin
> 	return config;
> }
>
>-static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_class_instance *eci,
>+static uint64_t get_event_config(unsigned int gt, struct drm_xe_engine_class_instance *eci,
> 				 const char *event)
> {
>-	char xe_device[100];
> 	uint64_t pmu_config = 0;
> 	int ret;
>
>-	xe_perf_device(xe, xe_device, sizeof(xe_device));
> 	ret = perf_event_config(xe_device, event, &pmu_config);
> 	igt_assert(ret >= 0);
>-	pmu_config |= add_format_config(xe_device, "gt", gt);
>+	pmu_config |= add_format_config("gt", gt);
>
> 	if (eci) {
>-		pmu_config |= add_format_config(xe_device, "engine_class", eci->engine_class);
>-		pmu_config |= add_format_config(xe_device, "engine_instance", eci->engine_instance);
>+		pmu_config |= add_format_config("engine_class", eci->engine_class);
>+		pmu_config |= add_format_config("engine_instance", eci->engine_instance);
> 	}
>
> 	return pmu_config;
> }
>
>+static uint64_t get_event_config_fn(unsigned int gt, int function,
>+				    struct drm_xe_engine_class_instance *eci, const char *event)
>+{
>+	return get_event_config(gt, eci, event) | add_format_config("function", function);
>+}
>+
> /**
>  * SUBTEST: engine-activity-idle
>  * Description: Test to validate engine activity shows no load when idle
>@@ -144,10 +152,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 	uint32_t vm;
> 	int pmu_fd[2];
>
>-	config = get_event_config(fd, eci->gt_id, eci, "engine-active-ticks");
>+	config = get_event_config(eci->gt_id, eci, "engine-active-ticks");
> 	pmu_fd[0] = open_group(fd, config, -1);
>
>-	config = get_event_config(fd, eci->gt_id, eci, "engine-total-ticks");
>+	config = get_event_config(eci->gt_id, eci, "engine-total-ticks");
> 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>
> 	vm = xe_vm_create(fd, 0, 0);
>@@ -188,6 +196,73 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, un
> 		igt_assert(!engine_active_ticks);
> }
>
>+/**
>+ * SUBTEST: all-fn-engine-activity-load
>+ * Description: Test to validate engine activity by running load on all functions simultaneously
>+ */
>+static void engine_activity_all_fn(int fd, struct drm_xe_engine_class_instance *eci, int num_fns)
>+{
>+	uint64_t config, engine_active_ticks, engine_total_ticks;
>+	uint64_t after[2 * num_fns], before[2 * num_fns];
>+	struct pmu_function {
>+		struct xe_cork *cork;
>+		uint32_t vm;
>+		uint64_t pmu_fd[2];
>+		int fd;
>+	} fn[num_fns];
>+	int i;
>+
>+	fn[0].pmu_fd[0] = -1;
>+	for (i = 0; i < num_fns; i++) {
>+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-active-ticks");
>+		fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>+
>+		config = get_event_config_fn(eci->gt_id, i, eci, "engine-total-ticks");
>+		fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>+
>+		if (i > 0)
>+			fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>+		else
>+			fn[i].fd = fd;
>+
>+		igt_assert_fd(fn[i].fd);
>+
>+		fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>+		fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>+		xe_cork_sync_start(fn[i].fd, fn[i].cork);
>+	}
>+
>+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>+
>+	for (i = 0; i < num_fns; i++) {
>+		int idx = i * 2;
>+
>+		xe_cork_sync_end(fn[i].fd, fn[i].cork);
>+		engine_active_ticks = after[idx] - before[idx];
>+		engine_total_ticks = after[idx + 1] - before[idx + 1];
>+
>+		igt_debug("[%d] Engine active ticks: after %ld, before %ld delta %ld\n", i,
>+			  after[idx], before[idx], engine_active_ticks);
>+		igt_debug("[%d] Engine total ticks: after %ld, before %ld delta %ld\n", i,
>+			  after[idx + 1], before[idx + 1], engine_total_ticks);
>+
>+		if (fn[i].cork)
>+			xe_cork_destroy(fn[i].fd, fn[i].cork);
>+
>+		xe_vm_destroy(fn[i].fd, fn[i].vm);
>+
>+		close(fn[i].pmu_fd[0]);
>+		close(fn[i].pmu_fd[1]);
>+
>+		if (i > 0)
>+			close(fn[i].fd);
>+
>+		assert_within_epsilon(engine_active_ticks, engine_total_ticks, tolerance);
>+	}
>+}
>+
> /**
>  * SUBTEST: gt-c6-idle
>  * Description: Basic residency test to validate idle residency
>@@ -202,7 +277,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
> 	uint64_t val;
>
> 	/* Get the PMU config for the gt-c6 event */
>-	pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
>+	pmu_config = get_event_config(gt, NULL, "gt-c6-residency");
>
> 	pmu_fd = open_pmu(xe, pmu_config);
>
>@@ -226,13 +301,34 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
> 	close(pmu_fd);
> }
>
>+static unsigned int enable_and_provision_vfs(int fd)
>+{
>+	unsigned int gt, num_vfs;
>+
>+	igt_sriov_enable_vfs(fd, 2);
>+	num_vfs = igt_sriov_get_enabled_vfs(fd);
>+	igt_require(num_vfs);
>+
>+	/* Set 32ms for VF execution quantum and 64ms for PF execution quantum */
>+	xe_for_each_gt(fd, gt) {
>+		xe_sriov_set_sched_if_idle(fd, gt, 0);
>+		for (int fn = 0; fn <= num_vfs; fn++)
>+			xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? TOTAL_EXEC_QUANTUM / 4 :
>+						     TOTAL_EXEC_QUANTUM / 2);
>+	}
>+
>+	return num_vfs;
>+}
>+
> igt_main
> {
> 	int fd, gt;
>+	unsigned int num_fns;
> 	struct drm_xe_engine_class_instance *eci;
>
> 	igt_fixture {
> 		fd = drm_open_driver(DRIVER_XE);
>+		xe_perf_device(fd, xe_device, sizeof(xe_device));
> 	}
>
> 	igt_describe("Validate PMU gt-c6 residency counters when idle");
>@@ -254,6 +350,20 @@ igt_main
> 	test_each_engine("engine-activity-load", fd, eci)
> 		engine_activity(fd, eci, TEST_LOAD);
>
>+	igt_subtest_group {
>+		igt_fixture {
>+			igt_require(igt_sriov_is_pf(fd));
>+			num_fns = enable_and_provision_vfs(fd) + 1;
>+		}
>+
>+		igt_describe("Validate engine activity on all functions");
>+		test_each_engine("all-fn-engine-activity-load", fd, eci)
>+			engine_activity_all_fn(fd, eci, num_fns);
>+
>+		igt_fixture
>+			igt_sriov_disable_vfs(fd);
>+	}
>+
> 	igt_fixture {
> 		close(fd);
> 	}
>-- 
>2.47.1
>
