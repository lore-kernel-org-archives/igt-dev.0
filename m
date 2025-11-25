Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCA6CFD315
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 07:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0136810E0F1;
	Tue, 25 Nov 2025 07:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOdSH4nL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BC8910E0F1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764055193; x=1795591193;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=9bpTi4Q2vhhRnfyB173YjwLgOcTeUZor2qpnOjmTcR4=;
 b=hOdSH4nLKkOZn+HMrlAjvrzBTqNZqRVdg+tzLjwr1mqWyAMjcxnN8YIH
 4qHbVOHo1+FSp2JbHYgNHU6vXJe+9JdTH7idF+Mf4mwbvevaU8NmIx+fe
 ckEm3cAeu9grw9VZ4EoGM8V55ZiV+LQ0FShZ1Z0X6WJl8rpBKregggZIe
 b+srTjGtY+XZnbF9jGnztojRZX3xn8YfR9z4p6wz5y7ivWZaXmllioEO4
 nnBe8RB+9Ly7wO3OID9ZApyC5PPMIq1j07OrzEDlZ3ktC/FNqOx2+mlzB
 /Fn7hYYeyyxu3yO50y+pjf02dMWkCFt4oDKnkRKycBgyk+XZhY9Z6Q6af A==;
X-CSE-ConnectionGUID: myp3SR+JRhuh9QzczPCpXA==
X-CSE-MsgGUID: g01/fOwrQ2KJ1eIzOYbgNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69689763"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="69689763"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:19:52 -0800
X-CSE-ConnectionGUID: YszWJo4EQje8PRcBsA45IA==
X-CSE-MsgGUID: 8O8BjBd0RU2HqMVuzKoCkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; d="scan'208";a="197034140"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 23:19:52 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 23:19:51 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 23:19:51 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 23:19:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQqJPT214l0OWVmwJUInO5DCDll2bTgk70eKAke1ofRrhXzo9cq6ha7CVZpP4VbJRHNRBj3H+aOyB+RnlLc5Os6FdmoEptzwnOlbt7ruiFd4UfSYb5C8pGsQTyjDOYxsEYOjJO1OcTLW4EF5f9mft1rb/bKD0Urm0f6ggDQBnqLTC5rW8IFdh8HRXQ37dYIiVEiLf39rGWuu0FpxTBgZ0/XQPhC8n1DGFzpDv0S4BZbLJ0rlYkSi2woMPYhQCicpM1aIB62N0yt3raBr2lZx36auPGXZ54L4UsaM6xmyABaECLO/iutfVOf05a4H0xZm1RgJtTctQU/N6uOJymgpmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsz5hClbkfKwqZPpPr60zrFBKXyWoA3V743VH6bUTKA=;
 b=LYa94hqwxDaTpN/2OjY/2zK0N7BKb2wpjsOTVVLaCnB504tQM7YsEg0KyL6xWv1IFFDdYFA7rI/vmu0LOy55CbTCVu2ZM/elk8rdbq0NKma7tlrbjnvG5Lv7oy6/QiW/6HIyDk4PYGl1ZVeRZ9yVWG2WtqL3Vx5lWIJhVS8XKNP2/xQkqrtUtJGUQxB9cmgFZ1Uf0pzcwc+BdACF4tNLpcR9RObiPq7F7RmCNmhIqxs5XXyjxDSymBaSstC7JwWMeRNfIvkYMlY/dveyedZtt3SijdPUEFGQZ+YqDDM02WgmrXCKGgu0/PQkshDIEurtm33J52hzgwFvdJbpzL5A9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by PH0PR11MB5927.namprd11.prod.outlook.com (2603:10b6:510:14e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Tue, 25 Nov
 2025 07:19:49 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 07:19:49 +0000
Date: Tue, 25 Nov 2025 07:19:40 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Simon Fairweather
 <simon.n.fairweather@gmail.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3] tools/intel_gpu_top: Add iteration option -n
Message-ID: <hi2y7fdajzkvkygkbk6ixpslhmhxgw5yizb3orn4omvzatxh3z@fzuq7ruegbbt>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251027153247.109572-1-kamil.konieczny@linux.intel.com>
 <fzr6737mjmdkhfmkxh2uawj47gtzcuig3t4sqqtvtuqzme5pbx@evlm4bcue57t>
 <20251104092043.prlqk7teecophc5r@kamilkon-DESK.igk.intel.com>
 <waoe2s5ere3bcpkbzitkfhgpxc3fgrn7rbuwlqbd46ducnmhpq@64a6znrilzha>
 <20251124184014.ut47czn5n5ciknut@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251124184014.ut47czn5n5ciknut@kamilkon-DESK.igk.intel.com>
X-ClientProxiedBy: LO4P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::15) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|PH0PR11MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: f89fd001-a678-481d-62af-08de2bf304be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWsxeFNGS05JUTNRRDV4cjMzcVVESnJsb0RzaDd5TVJKaGRDRFNWMC9RTFNZ?=
 =?utf-8?B?V3NrbjYvb2lwSlBPN3p2U2o1YXNjTldyT1FUVU1CMEpZcFgrT2JQQ1dwbG1I?=
 =?utf-8?B?Y3AydzgwYjVkM1RRYUsyWjRGOXFKUExUMm0rWHVkempLUUhyQ2FlZWgwemNw?=
 =?utf-8?B?N2dIV3BuYVBNZ3RIaFR4am51OUVyQ0NhaVRzK1c0YjdvY3RZZjdvbHpKQnpC?=
 =?utf-8?B?bmEvVm13clBnVHpIOHJLOVhHaTRSYVE0Z1BqenRwTTh6L3pWMVlad1JEVHU5?=
 =?utf-8?B?d1dRem1IbVg0d2VEcmlvdVpEVkY5ODRoRll5eWhKTHBhZlVqY3ZKRXN6cExG?=
 =?utf-8?B?eXFReGNDTjQrYXBvQ3hOblM1TXhjb2E1Qml2ZldjdlNTdGdjMzU5R1BqWTYz?=
 =?utf-8?B?cVBTSm9CT28rV1l5MVlWd1RieHFzZUxuakNSS3dQK1J5ZG5RTTJtUzhiRGFt?=
 =?utf-8?B?L0VyOXpjdzE2ejBvai9xY2lFS3VPU1hXaHJmVU5BRjRlK3BXNWFwajQzRGFE?=
 =?utf-8?B?R2xBZFB3S0R1TlAvS0k4MlpoanF3MUhDKzRlMmJXZkkwaXl0cGpJZlRQNldk?=
 =?utf-8?B?aE9EdmxCR0lIUGVMa045WWF5U3FwZk5EV2g2eTlHV2dpZ3BvSGtiQm5kd0Fn?=
 =?utf-8?B?NmkyTmZhNzNucEVrbHUwR1E0em03Ukw3bkNuSXZHVENlOXU5WlhObW16elBZ?=
 =?utf-8?B?UDhib0hKbzFoVXRDTTUrSHFVelRTaUxwRHpSWDJkb0xicEx6TVNTM0FnZW9O?=
 =?utf-8?B?Rm90UFliYi90R2tyU2xZUVcwVHFmZEdDR29lU05WaG93Z0pXWmpqZUJRQWlx?=
 =?utf-8?B?Q1hZdjBIWE1jYzBBU0d0cDRaMVo1U2h2eE0zS08zd3hVT2xSaTVRRDBLWG5P?=
 =?utf-8?B?NlUzMGx1bFkxQkgyZkYxdTJvOFJacmthb0JhaHNWdFhaSlQ1QS9sYS9FRTNo?=
 =?utf-8?B?Ty9DdFhmbHdjL2dPdUZLMFpYUTRraEw4b1ordU5pdFZPZWM3KzlxVFlkeEhT?=
 =?utf-8?B?WUlqUitNbzFBb0pjTDRzNzArZytMaVlKQzFKa3hXWXkzS0VFdjh3SkVIeHhG?=
 =?utf-8?B?dW10c3NkSThrUW1WM3oyZDZMYWN0dnhrcTZCUUMwdmpmam40Q0RiWHZaS0hF?=
 =?utf-8?B?UlRjRVZqempycjJwVFJ3eW1jdDI1dnFYWExrZDNQbEhuMGZWbDJFdlEvTDh5?=
 =?utf-8?B?dzVnbXRJdUFZZVVWbkNySS9DMHdnRHRyNTVJK09Yby9CV3RWMm45ay9FL1M1?=
 =?utf-8?B?eFFwR2VQTjNYSFNYazFoUVBjbVkvc0E5dDRhM0ZmOUx4Rk96d3FXMWdnV2lr?=
 =?utf-8?B?RHJDQkh4MDNRcnI0SXpYVlVWRmRJVnZ2TCtkL2J3ZHVPOU5wYTc0Q3BEVjBx?=
 =?utf-8?B?YWRZUGJrL25vMm1tb3hiTTZsV1ZOQjFBejFxdTZPRVpud1AyLzhJZFZsZ3Ev?=
 =?utf-8?B?OStaWnM1Y3BSdFdwdkcvUHBldlNlQXE4WnRvOGhIWmE4TEZSblpIRGNHdHI3?=
 =?utf-8?B?QUNhbndhR0JTQkJrays1RUM3S1JVbytLUnp0TC9zbjJoMWtyZzRDNmpyb1BQ?=
 =?utf-8?B?VUVrbUlYMEJhR1IzdGxsN01xN0xFc1V1aUNFeXFJR2lwMGhyT0NucFNveHd5?=
 =?utf-8?B?KzlYZXh2OFg4WkpUdWF2YTUrUUdncXFXYUNYUFJNK3dVRWhjK1pVSjdWNFAv?=
 =?utf-8?B?TnhCcHdhUk5UOWR1WC9ZQXZpVVpsWkRoT2hhb1lrcEwxaVprSVE2MFUvTlZt?=
 =?utf-8?B?cENwNy9aTnZMNzhNUU05cXM5MGhlMTk2YlZzcm54ZjkxbnF2cVNDT0pQRnZu?=
 =?utf-8?B?dnVpUjh6UGs2bmQ3WDBQQldpTS9ZdWc1NWF3MUVjQzAwNkRRektnR25SbkxZ?=
 =?utf-8?B?TGtPYTk3OFFLT3NvK2srcTJ1cU9BZTVFSEJWWjJPeFpKREEvb1dUMG5wS2Vp?=
 =?utf-8?Q?yX23OnH3A2rLKlHwzSg5rZQ7PylzRtmC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEltMDJybEZReVdVNit0RmZKVWxjT1ltc0E5Sm9oVFdqWWV5aEF3bnNFZmxM?=
 =?utf-8?B?a2ZxcTE5T014TUpiTVpkcHlVUXc2RHB5VGtySDRyOFRlY2FHRFR6dGIxQVBz?=
 =?utf-8?B?TlFuNVdvNE40a2ZVVVNxc1ZITFZNaXZTMlQwSXNmeVlpb2U5QmRaOVpsYWNH?=
 =?utf-8?B?RWY5bDVndm83QW1CeWI0dFdaa0xuZC9SUVVYYmF0SHFYcHZLOUlnZERGQVpF?=
 =?utf-8?B?SElwYnhxRHRwdkZhZ25pRVdlc05ZTlFnelVCNGFleU9tMkQ1RVViOHlEbm9I?=
 =?utf-8?B?ang5dzNMbWtQT1dpZDluUWxQa0lCM2ZRKzE3RUhybWkrV0xNTGUzMzNUek1w?=
 =?utf-8?B?VDR3WS9TR3FFVWtEOG55TzMwTGZDb3BLc1FiMXJOU0xzdWFoM0RIY0QyK2Qv?=
 =?utf-8?B?dnF5THhBQmdBUGNXMXBWVEdHSUlZcmc4S2c0RFhJVWZvdTZvVjVxRWI3OVkz?=
 =?utf-8?B?a3VaOThscGZLOGZoRzRhT2V0MGd1Y1VFckRSZjJYRHJhZ0NwVWxEeHJvWjNR?=
 =?utf-8?B?Znh0b2ErZUg1MnFqZmF1ZkxVZkt3V1BsVmNxNDdSeHhWaDNWY2tGc3hwRDds?=
 =?utf-8?B?RGQ4bHhJQWMvOTdjcFpZWC9jOSs5bzcvWFlSb3VJZ2dJZlFDQldDRmNpN3BP?=
 =?utf-8?B?ZUtORUk5ckk4VEVWOVFtejJocGJUQkRESG8vcXlBQzVNZy9MZ3B5QVd5NUJB?=
 =?utf-8?B?OTNHenJFdmRNY2krTkJRY2ZCS2kwT3FidXNlaXQvMjFuRCs4RmwraEJ6Zjdj?=
 =?utf-8?B?SWJuUUhESVBYb0tHQy9BOU1ZbCt6cEZMdk5mMlY2TzkzWDVKNlIxNFZiS3ZJ?=
 =?utf-8?B?OWdhNUtvOEgrTTAxbElyZVV4ZldqaHdKK245ckhrcWwwK0t6YjhmZFRzczFl?=
 =?utf-8?B?RkcvM2N5S2Y1WnZWaVA5Y1U4ckJqUm5CVi9LaFpLSTlqR1RuZ1NSeUJUSzRZ?=
 =?utf-8?B?L3BZRk1RRlh4YWtxYWh5UE44aVluQzNUc2JmUE54Tkl1dE94N3IxNU56NzZn?=
 =?utf-8?B?N1Y5c1ZEV09IRldwS1IxSXRqV3NQbGFxWTY5K3lKYnh2bWZXMjR5UjJhQTc3?=
 =?utf-8?B?K3RWTzVMNzYvcW1GNnZvYVBEQ040MWNxQlh1bVBjSzFaQ1dtUDl3QWwwVy9s?=
 =?utf-8?B?MDhaK3NrdjlqTWxmbzFJTG40RHhFZGRucVlNRFd0bm5RVkx3L1NtNm9pQVFP?=
 =?utf-8?B?QmZXUUNUZGhyNEJNMENldU9JK0NoU1gzMFA3RUVhTEhTYkhBbWdDRVdsNkUy?=
 =?utf-8?B?d0kweVM0N1JqRnY2amkzVjFnVmowd2lZbUlyRHZWU0c3bWVJZFFrMk91Y3JD?=
 =?utf-8?B?YVNKWE9hU01jMWNxS0hyNFljTnIyUnRDeTRjSmZJOUc0V0VGb0duQk8yaGsy?=
 =?utf-8?B?Mm5SVm5XcEZhbXdkNFQ1QWV5Tkp5TEloRXRhaWVRSXcvYzhPOWRkOGl3cGdF?=
 =?utf-8?B?WUNraHl5NW81TVZxWWJHK0FVcDRubVI0b3A5MTBaOENJd1NmVWQ5RFd6TE5B?=
 =?utf-8?B?T0Qza0ROeFpWRjhxVEdrZHNQRndhNEtkeXZOclA0NWdOZHJhZVAwZjcwdG1t?=
 =?utf-8?B?cEhaUG03bkxiWnZyY2JmZGVPVklqNnJzb09GVHlOSmhWODJlU0orYXJ6TW9p?=
 =?utf-8?B?aDVkdlF0b1lTZG5HRmdXTzVqbC8zMXdCa3ZwVTdZckpuTDJYMmE5NzMxZzQ1?=
 =?utf-8?B?dkdHZnUzSEplSGVLMmNKalczeHlWK2t2QUViS09EcmE1RnhScmUya3phUWpj?=
 =?utf-8?B?SDR5MmVBaWJvZFJtSDdDS3lYRnE0SHF3RWZzT3pUYU9qMjFUVm9iclFZVGho?=
 =?utf-8?B?NjdoU1JOUFN6VlR3WkV6MEpDUitpSkhoYkdTRitQYkxZVXVOMStFT084SWhF?=
 =?utf-8?B?VzBVUml2YUxYQ004dTJHbVBjaitvcWczRnRLSnoyV1hIUXcyWUR0Z0YrVUZM?=
 =?utf-8?B?R3RDMGYxS29pbzUzVlVlLzZ3TGh2QVpJK1dWYWJuSHUreVFaZ2Y2bnkxNU9T?=
 =?utf-8?B?RzdBcUQ3UFh1bWtXSG5jSThmQUhRWTBUTUZLQm80UTBFMjFDam5oWEFUR29K?=
 =?utf-8?B?RUlVcjdHanU3TE1YaFhFUEMxRnVSN25VTXhrcjlxeW1EaTMxYkN6M0xYcTFI?=
 =?utf-8?B?U1M3OUdLUUhUUnFVWGo1MEpWemg1YWlLL2RVbEdkZER1M0s0R01iZnhkakhR?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f89fd001-a678-481d-62af-08de2bf304be
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 07:19:49.6774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1brMPkQ7J9wgTgMJu2gYX/IMT74L2zribAsvPQbUOFmS6wY9gi/emlveuqajaoN6yqECtuFJ/KPW7CB7nGVPUWq2RVPg8r+QKYLjvcuTjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5927
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

On 2025-11-24 at 19:40:14 +0100, Kamil Konieczny wrote:
> Hi Krzysztof,
> On 2025-11-06 at 07:32:18 +0000, Krzysztof Karas wrote:
> > Hi,
> > 
> > resending my last message in the thread, because I omitted CCs
> > by accident. Original message:
> > 
> > Hi Kamil,
> > 
> > On 2025-11-04 at 10:20:43 +0100, Kamil Konieczny wrote:
> > > Hi Krzysztof,
> > > On 2025-11-03 at 12:05:14 +0000, Krzysztof Karas wrote:
> > > > Hi Kamil,
> > > > 
> > > > > From: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > > > 
> > > > > When using option -J or -c default is looping forever until user
> > > > > break process. Lets introduce new option -n <number> and break
> > > > > printing after reaching given number of iterations.
> > > > > 
> > > > > v2: corrected whitespaces, extended description (Kamil)
> > > > > v3: reduced number of vars and changed printed help (Krzysztof)
> > > > >   added description to man page (Tvrtko)
> > > > > 
> > > > > Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> > > > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > > > Signed-off-by: Simon Fairweather <simon.n.fairweather@gmail.com>
> > > > > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > > ---
> > > > 
> > > > [...]
> > > > 
> > > > >  		"\t[-d <device>]   Device filter, please check manual page for more details.\n"
> > > > >  		"\t[-p]            Default to showing physical engines instead of classes.\n"
> > > > >  		"\t[-m]            Default to showing all memory regions.\n"
> > > > > +		"\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> > > > Passing 0 or negative causes the app to spin indefinitely.
> > > > Furthermore, I think <number - 1> overcomplicates this endeavor.
> > > > We should consider a few scenarios and sanitize the inputs:
> > > > 
> > > > -n 0 - we break out immediately after a single print,
> > > > -n 1 (or any positive number) - the app works for
> > > > 	<refresh period> amount of time,
> > > 
> > > Could be, so for n=1 it will print info two times? This in turn
> > > is counter-ituitive, it imho specifies number of prints, not a
> > > time.
> > This! Since the value is not supposed to represent a time value,
> > I think we can use "<number of prints> * <refresh period>" or
> > something similar. See below.
> > 
> > > What you think about this help:
> > > 
> > > "\t[-n <number>]   Specify application running time as <number - 1> * <refresh period>\n"
> > > "		   With options like -J it will print info <number> times. The default\n"
> > > "		   value is -1 which means work until user breaks with 'q' or Ctrl-C\n"
> > > "		   or sends signal.\n"
> > 
> > Maybe:
> >  "\t[-n <number of prints>]   Specify application running time as\n"
> >  "                <number of prints> * <refresh period>. Passing 0 or negative number\n"
> 
> Looks better but is still incorrect, for '-n1' it will print info
> and immediatly exits, no wait with refresh period.
> 
> What about this:
> 
> "\t[-n <number>]   Specify running time as <number - 1> * <refresh period>. Passing 0 or\n"
> "                negative number will run it in infinite loop until user breaks with q\n"
> "                or Ctrl-C or sends a signal. With options like -J or -c it will print\n"
> "                info <number> times.\n"

Very well, looks good.

> 
> >  "                will wait until user breaks with q or Ctrl-C or sends a signal.\n"
> >  "                With options like -J it will print info <number> times.\n"
> > 
> > I included the bit from my comment above and changed
> > "The default" part to be more explicit about what happens when
> > 0 or negative is passed. Then, when reading the value:
> > 
> > 		case 'n':
> > 			iteration_count = atoi(optarg);
> > 			if (iteration_count <= 0)
> > 				iteration_count = -1;
> > 			break;
> > 
> > We kill two birds with one stone by handling 0 edge case and
> > using a known value of -1 to cause the indefinite loop, instead
> > of keeping whatever negative number was passed by the user.
> > What do you think?
> > 
> > [...]
> 
> Yes, looks ok, imho I will change atoi() into atol()
Thanks!

-- 
Best Regards,
Krzysztof
