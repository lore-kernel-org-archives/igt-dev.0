Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857ADC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 05:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB8C910E1AC;
	Tue, 18 Mar 2025 05:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNbmVkFV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D3210E1AC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 05:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742276947; x=1773812947;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M4EYKijFa8SU61xZqSQ9nUiAVWgBlDCqrUj5qbfpm40=;
 b=gNbmVkFVuqgAuQPKMdUOLsnJhqMfxuyV4RdTId06LwDsQ9Il5kgI2urK
 feUJ68TPl9jsomWaHTY7WzTrbi4i9bNGAGDPGJiAsLZK4kzn+jACm2SjO
 wJ1oBQoTNvAc6h9KmMihugkIYTZWUe1rXYjjHbP08wONpfOqSDI84Wo3I
 HCXRPDMOPGKnmD/3NBHrXEiN175t2CEtgr/pr6+syzA/t6yq5hUVIJZGW
 SRBhpw/ti17TkWqw1WDvVZhfBqT6oBKkIR1G1QbaLNSVka5BGo3egDB5i
 bGh63hCrTJbVmZSO1FgVxQTHJndgX3652bDinx/v3XIhijUhS+H2MVH48 Q==;
X-CSE-ConnectionGUID: 8GrHohlVRBS8NMuRe47JdA==
X-CSE-MsgGUID: reQPtd8MRBumt2Ro3ZzjsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43281926"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43281926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:49:07 -0700
X-CSE-ConnectionGUID: VrTOlN07RJCJFrbFRipfsg==
X-CSE-MsgGUID: igFQ509fTby52faTKrTSBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="145328143"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:49:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 22:49:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 22:49:05 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 22:49:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/7yGMbiUcaS99DP8+3xS7g3NNy+eKIvNedtzF3M/vIa/B3e3p9XPGQtrjFrucshW7q84TRjfs9wRRNULBKYY4nFjPb2jLnV30D/NSq/2v35yCoQL8enOQwR6jjsq60IJXYrvzzHVO5P4Nl4Onm11GWTq5n951JTw+gMbrB3kMtpmZbNIwBnYwmqxwchoF6lwF9sM/Z6Up2PXQd6Cd6oDiooyO/cGHayEEAHMqZiBJuEHi93PaGLBPO04tLlspY9CAPzbyAQMFKgvuLjqxNRiYiNMq5h5lTSnHQFOvmSzuiMKC9+9LdVs5CckGNE1ahRQkOvICX9aI87Tmn1ztXOQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snBSKwoz96F7yitqI+nhOyTxyW/HO03s28EU7Py5my4=;
 b=NkYoAx+h7MpfmNx7RdBQtYOE82RQELtzi5ZcgO3YiJ8XdbBAcGSR5j6nNrPjLq9XiAcVVUJOKui/a/jR/N/+bi2fVfKFPaW3c3K9PqdIBgRkEnJtcmMa+QBS8/G2if2qpNCQi4ANyjPX2QGxAaEaheubd1rB6QSTPF7t7FTpGIGGWv/GkWrQR2K/mi1ynjNgHbu4EzmW3i7jhWONXUDRnKP//EKZqh2CrEm8KXUzuIrzVgOHnitIRmPSISJ9Y9S35QXNo0i3CyjRI9CzaSGgxLJt7MMRQhzAyhmaKcS/R0q3tUgX+Yn9wqTrAQ99wHNJZTBXR5EFXy8U+ST2PEmbuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 05:49:03 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 05:49:03 +0000
Message-ID: <2b621973-4da6-472f-a6c0-b7ece829312c@intel.com>
Date: Tue, 18 Mar 2025 11:18:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
References: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
 <20250311085422.2573860-3-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB6129FCE95C8B423A6E191F30B9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SJ1PR11MB6129FCE95C8B423A6E191F30B9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: 7739c875-dcdc-45ff-a3fb-08dd65e096a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZndJN1Q1R3pnUUpPVFd1dGlsS3h5eFgxSmJrRGxkSEczeFNja0VhNGdQWVRS?=
 =?utf-8?B?bkZWZWtxVW1NQmNhUm9ScUdsRXdqdldIdngxdWp3TWtKVndzU0t1SFA3Sm04?=
 =?utf-8?B?ODV5L2FSSGR0ZjArV2hlTEh6TnRUeENINGw4OVNITXVORkFlWGtBZG02N1BP?=
 =?utf-8?B?aU42OXV1OG9jZEUxQjk4WDcwdDQ3OEFqSE1LVlpCWFRYK0lJMHhPbXI2L0FL?=
 =?utf-8?B?M3lsR1lMM1Y0NVU1eXRmcWJkVzhHeGovUWh5T201bmZ6Z2JtNjZSdGZwQk9h?=
 =?utf-8?B?OEtLNDZhNlByVkFjNU5RY3dzUENGdS80TG03aEREdE9nTVUxcXV0cW1Sc0Ra?=
 =?utf-8?B?WElvRjV1MUNoeVV2V0M3N3BmaVdUSzJXdDVNdzg3dm1JbllBUTEwRmoxdFBO?=
 =?utf-8?B?NGZqa2kzWjF6cGdXMFcxMkcvS1ZhWVJxcTUrZWxMR0d6YWNLc3BieGtKTjJH?=
 =?utf-8?B?a2dybFVTcnRBK2lkNEZod1Y0bVIyTWFOSVRHV3V1YmxFUzZlYW5qMGNnVVFS?=
 =?utf-8?B?K2FGU1puRUJnWVBLTGpEem9LdXh6cWtET1ZLWDF5OHJmeC9FWERTZjJUOEFQ?=
 =?utf-8?B?ZWViZXMwd1NvZDhZVlJTT1BjbmVTakhqM25TV3RHNGFONzh3MS9LRGNUUWlM?=
 =?utf-8?B?T0RUemJySEZTbFdVeTFZL29KeG9YTmlNazhPMEtBYmh5czU5QTF4MkhXU2tY?=
 =?utf-8?B?N2Viai9CTVF3bDVqdkk4RmVFbUZENTZtc0hhOG5wZ1kvdmI0U2Z1WURPSmlh?=
 =?utf-8?B?ZkE0SWhtRUFITkVnRytXM1hta3N2cUx2ZTZtYk1vV2xBWE5MbjV6WEhSOXpi?=
 =?utf-8?B?endJOFVvbnpjZy9XQW9reDhpTFYvTFlWSnN4djVIeEpmQzlxSGp5ZUZsWGUy?=
 =?utf-8?B?aDlQZnZLZFUyVFpMUHFkMFJObXFROFErK1dDNDNqd2FmUzNuT1ZHeFpPMlB0?=
 =?utf-8?B?d2k1MGlZQkVlMDZQdE40K2xwdnNkNlVldnJDUjJmV3NDVEdyMk9EWVZYUmZn?=
 =?utf-8?B?ZmRxRUxUYmphVW1Wc3JpblNtTjd3T0dTajZjV2Vva3BUQ2gzMW5DK3RCZVM2?=
 =?utf-8?B?bnVxT2FGUytCUGVCNithRmZLRXg1cS9qMkZyWlI0VDZhMTVaUHlLaThMaTQx?=
 =?utf-8?B?ZHE4dTduaXlkZ3FFeENVM1dvVzZyVlV5ZjArcEllVDFNYUhiN0dFOTJyMURs?=
 =?utf-8?B?aGx0UGJMeml3SFBlK0NMR3IwWDk3ZmdKM0xrZlNUTkdnS3NBS2FIVTQ4OTdu?=
 =?utf-8?B?a3oybjk4cGZtRXk0TlFVNzEzd1czd0xaOWlYanFNNFJEQkszN3JjOHR3Sm9L?=
 =?utf-8?B?SGdTWnI4b1NlZlJnSUF0QUdpL2IzSE9jVUw4c0Y0b0ZzbzlQNHNnTk83QWRY?=
 =?utf-8?B?M3Nvdkh3aGd2ekwyNTVaRi9jRjhBdGVFWEh0UkM0Wm4ySTRDaktLcVI4dm5H?=
 =?utf-8?B?ZEg5eitDNE4zVnZmWXZMQkF3UndrRmpwSWlELzhJUU9pckoxblh2Z1RBSXNH?=
 =?utf-8?B?WjdBL3BsMnpibjFlN1kxN00vbm5xT2JjbXFJSm55M3lXWGc4OVZ4SE1TcnMv?=
 =?utf-8?B?L28zbzF6RlcyajZNN09OUzFzUWJ3OCtQaGRwUGVzdVNDVEVVNlFGcmlndXFp?=
 =?utf-8?B?OEhjTS8yMWJSc2dQNjVkOC8vdFNTeU50WFQzbHprdGl2dTdESGd5UmNWU1RW?=
 =?utf-8?B?ZzRCUEJkdlRkZHptSnd4RG4xZ3BiNVBsOUMyVnR6L3BlUmN3S0VyZHg3eXhB?=
 =?utf-8?B?bGhoMU8xUCszaFJKWE5QMHNjR0d1RUdsUTVqdThGZnRsTU5YNmswY2szOHBk?=
 =?utf-8?B?V3I5cllUZWhpMEx2RU50N3ROWjNZa2JOVzI4VmFwOFVJNXJzNDE3cU1TdzZY?=
 =?utf-8?Q?7t5Ah1itfTBTq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U01iZjBDaHE5VjBUUk9zOElBTVdKTkxXeDNKM0NoSFdra1FIc0VvdFZ0OUJn?=
 =?utf-8?B?M3dVbjhtZFVVdnpyallGb0tTNUxLNGtnM0cwVVc5bzc1MjJGNkVDN0FWcG1N?=
 =?utf-8?B?bTUwSEJFMTBpS1ZFaHQxa0tobHlIOVIxM0J4YlJiUzRFT25kc0VsL1Q4WDdP?=
 =?utf-8?B?bzg2aVlIS2RiWjE4TittWnYrVzdJWExsYk9xVitBUlZSUFJPdWxPcStpdTR3?=
 =?utf-8?B?SE4xWWltaGI1d2NhN3lGT3dwUmVDMFZTWG8xTkk3cmt6dkFNdURkanVOT2JH?=
 =?utf-8?B?VktnZ20wem5nLzZtRXNMR20xUS9wMWYzSEdMMDV4NUg3eU1QczlQY2l0Tkdm?=
 =?utf-8?B?enVNNkhlM3l3MTRoZ0NPbGpWWUpQNTNiTzN4VWVPcGdIR0pHUTJsR1pBRG1a?=
 =?utf-8?B?YWppNWtKV1cvemlGS0drYVNnMFh3YVNHRlBvcitRV0dXQUJ4L25iQzhKRzFy?=
 =?utf-8?B?Q2J4aXdKOVhEVGNhdCtQcmxvWGNMcWpweDR1Zk5Rb21rSEcwMWJrZlYvejJw?=
 =?utf-8?B?U2FrTUtzSzJYVEd1cnlGdS9MNlFWMkRoVXV4STU2aGtDNjFKOFl2dFRlTk9r?=
 =?utf-8?B?MjFkVUdKUHlQaU5SZEpwamNZcmx1WEpaR3VwbEJQcUF3dnpmd0toUXNqNXQw?=
 =?utf-8?B?V0pZU1V2bHlXSXQ4a2VuNnJac1BFTklyR1p2Witlc2xIRTd4eDZTSFNYTDBK?=
 =?utf-8?B?ei9ZVWxienVqRm02S2UyT2lWb3JMUFNoSjFtNkVXMDlMVEUwdStsd0NwQVZC?=
 =?utf-8?B?eHBqTWlXZm0xVHIzRlZORVBxeThmS1ZodmtrVGh3WWx2T3ArOEZyVDQ4Tkdh?=
 =?utf-8?B?Z0MzSXRrVkFZSkVJVzJ6UnZ3TjRaZHdVRWFIRHkzRjYwME1IMm0zTWVsUEIw?=
 =?utf-8?B?cS9FUmtjYVZYRTg0SENuWFNTMnR4M1lJL0h0TFNuTHNoT3lVc2Uva2Y3OE1j?=
 =?utf-8?B?SVRUc1lzc01WUTlIN21jamRlK1FvSzhXYXd0MmFtWVZGUHZpN1JUS0MyNjZT?=
 =?utf-8?B?b2Y4dmNYNDYzZ2RVTEx2dFJrYlFCYXdUb0FrNFRVTDd4NldvSnJFOENMYXJv?=
 =?utf-8?B?Qm9qT29rMmNjU2dtMU9FbHY3N3dmL2MreWRvelk0WTIxOUtwbzk0M3J0Q3Y5?=
 =?utf-8?B?WFBpNVBVL2dXMElsaGliK1R3QktiVTJxVWVITUt4TXBKWlBaSWwzY3RhSnVD?=
 =?utf-8?B?N1ZqWDJXMXd2OHY0SlpiVGl6UCtZWUY0MWc5RnF1NUt1aHJ0dXlCSTcvSlJB?=
 =?utf-8?B?UmlRdVBYZlVJN2JkRGpWNmpISXpPUlhxa0piOEFQRldBeXp4bzVpTElJS3U3?=
 =?utf-8?B?UFBobHhOSkNFQ1FpTWhBWTlkODkyMXFaN1hSWWw0UUoxUGo2NzA0NkYzdHov?=
 =?utf-8?B?aWNMRnpieWhpREEyaVNMeE9kcmlxeWR2SUtkb2RNRmNZeXVWRFJFNTNsZ0VQ?=
 =?utf-8?B?NHV1ZXJMNXYveWZQSDErbGRMeFRWdTIxYlNTYWFsOFpMUEtWSUJXOHc0K0Ev?=
 =?utf-8?B?TzhOWlBpT2lmRTJrL3cvVmM5ZTNRR0RFL1JtRFZzTzRkODhQcW5NMk1NQUtk?=
 =?utf-8?B?WUljejVqalRTUUx5QU8wSEgzcTk0ZjRRZzJqQnRoOFBDM01UK2hkRUJTcG5o?=
 =?utf-8?B?UlhVOE5DdW9GM0pFSDZIWmk5Z293TWw4TklJbDhxcTEyQitnSGxWRnNwandP?=
 =?utf-8?B?UE9DSnBDamIxd2JCb2lTamNLdzdVUVVTbEl6MVJsZUVYZlpJQ0l6TFJwMmRP?=
 =?utf-8?B?Z0p0dy9EeUY2RytGVFRzUVFFaU1LcFFSWjF2ZjdQb1IreEVBSmlJeEhlcWY4?=
 =?utf-8?B?cDA1V1VhelQvVFc5dHBObDZGL0RLYjRpbmVZWDhtSFV3dFlIMnJrYnUwTUc5?=
 =?utf-8?B?dnhvVkZJWUROdmQrb3hoaGNmdTVPTWI1Yjd3L1hEanFITjY4Z2V6T2hIUkgz?=
 =?utf-8?B?aDJhWEI4TzMxOTNFTWw1c0poQk9hVjBXS1JpejZQenNqb1U3anJva2NzNURL?=
 =?utf-8?B?a2gyaGFWbDJkT0N4dks5MnhhZVBoOGNHN0RjYVVHVFdBNnBzK01sVGpwT1ZQ?=
 =?utf-8?B?Y1NKb0p1ZkhGcHUzWkRkakdvSEF2WmdXQUNhQXlVcXJiZlg5WDRnUXdtdVgv?=
 =?utf-8?B?VVBhaEUvUzBHSXpKYXhXSW5JN0RiM0NmNi9tWktDbHA3TzhhUkVyOWNOTDdn?=
 =?utf-8?Q?cHcz2LhyAWPegchGJY7KDms=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7739c875-dcdc-45ff-a3fb-08dd65e096a1
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 05:49:03.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YYx3ImtIhbyyTz//7gGRo6bI9mPz+pKmPuYUPOyTst/txP9mhpfcXEW2wcmAYEvEcJc8U4BRem/lZvGSkz2PQX/g/rcVmpWhQ/qqBcDJeKqZoWSbhCKwgWUSjy5F+lwc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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

Hi Chaitanya,

Thanks for reviewing the changes. Please find the comments inline.

On 17-03-2025 16:26, Borah, Chaitanya Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Tuesday, March 11, 2025 2:24 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
>> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v5 2/2] tests/kms_async_flips: use in_formats_async for
>> async modifiers
>>
>> Utilise IN_FORMATS_ASYNC property exposed to get the list of async
>> supported modifier/format pair and improve the test coverage by iterating
>> through all the supported modifier format pairs.
>>
>> V2: Improve run_test_with_modifiers to set data formats based on async
>>      formats.
>>      Update make_fb to use data formats instead of hard coded format
>>
>> V3: Update commit message, remove complicated iterations (Chaitanya)
>>
>> V4: Reduce the format+modifier combinations to reduce time needed to
>>      execute the tests. (Chaitanya)
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 76 +++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 70 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
>> da426f753..0e2b0afec 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -36,6 +36,7 @@
>>   #include "igt.h"
>>   #include "igt_aux.h"
>>   #include "igt_psr.h"
>> +#include "igt_vec.h"
>>   #include <sys/ioctl.h>
>>   #include <sys/time.h>
>>   #include <poll.h>
>> @@ -122,8 +123,14 @@ typedef struct {
>>   	bool allow_fail;
>>   	struct buf_ops *bops;
>>   	bool atomic_path;
>> +	unsigned int plane_format;
>>   } data_t;
>>
>> +struct format_mod {
>> +	uint64_t modifier;
>> +	uint32_t format;
>> +};
>> +
>>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>>   			 unsigned int tv_usec, void *_data)
>>   {
>> @@ -193,7 +200,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>>
>>   	rec_width = width / (NUM_FBS * 2);
>>
>> -	igt_create_color_fb(data->drm_fd, width, height,
>> DRM_FORMAT_XRGB8888,
>> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>>   			    data->modifier, 0.0, 0.0, 0.5, fb);
>>
>>   	cr = igt_get_cairo_ctx(data->drm_fd, fb); @@ -710,21 +717,75 @@
>> static void run_test(data_t *data, void (*test)(data_t *))
>>   	}
>>   }
>>
>> +static bool skip_async_format_mod(data_t *data,
>> +			    uint32_t format, uint64_t modifier,
>> +			    struct igt_vec *tested_formats)
>> +{
>> +	/* igt doesn't know how to sw generate UBWC: */
>> +	if (is_msm_device(data->drm_fd) &&
>> +	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
>> +		return true;
>> +
>> +	/* VEBOX just hangs with an actual 10bpc format */
>> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
>> +	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
>> +		return true;
>> +
>> +	/* test each format "class" only once in non-extended tests */
>> +	if (modifier != DRM_FORMAT_MOD_LINEAR) {
>> +		struct format_mod rf = {
>> +			.format = igt_reduce_format(format),
>> +			.modifier = modifier,
>> +		};
>> +
>> +		if (igt_vec_index(tested_formats, &rf) >= 0)
>> +			return true;
>> +
>> +		igt_vec_push(tested_formats, &rf);
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))  {
>> +	struct format_mod ref = {};
>> +	struct igt_vec tested_formats;
>> +
>> +	ref.format = DRM_FORMAT_ARGB8888;
>> +	ref.modifier = DRM_FORMAT_MOD_LINEAR;
>> +
>> +	igt_vec_init(&tested_formats, sizeof(struct format_mod));
>> +
>>   	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
>>> output) {
>>   		test_init(data);
>> +		for (int i = 0; i < data->plane->async_format_mod_count; i++) {
>> +			struct format_mod f = {
>> +				.format = data->plane->async_formats[i],
>> +				.modifier = data->plane->async_modifiers[i],
>> +			};
>>
>> -		for (int i = 0; i < data->plane->format_mod_count; i++) {
>> -			if (data->plane->formats[i] !=
>> DRM_FORMAT_XRGB8888)
>> +			if (ref.format == f.format && ref.modifier ==
>> f.modifier)
>>   				continue;
> 
> What is this check for?
> 
> The rest of the test looks logical.
> 

Removed these extra checks in rev v6 as the checks are redundant.> Regards
> 
> Chaitanya
> 
>>
>> +			if (skip_async_format_mod(data, f.format, f.modifier,
>> &tested_formats)) {
>> +				igt_debug("Skipping format "
>> IGT_FORMAT_FMT " / modifier "
>> +					   IGT_MODIFIER_FMT " on %s.%u\n",
>> +					   IGT_FORMAT_ARGS(f.format),
>> +					   IGT_MODIFIER_ARGS(f.modifier),
>> +					   kmstest_pipe_name(data->pipe),
>> +					   data->plane->index);
>> +				continue;
>> +			}
>> +
>>   			data->allow_fail = true;
>> -			data->modifier = data->plane->modifiers[i];
>> +			data->modifier = data->plane->async_modifiers[i];
>> +			data->plane_format = data->plane->async_formats[i];
>>
>> -			igt_dynamic_f("pipe-%s-%s-%s",
>> kmstest_pipe_name(data->pipe),
>> +			igt_dynamic_f("pipe-%s-%s-%s-%s",
>> kmstest_pipe_name(data->pipe),
>>   				      data->output->name,
>> -				      igt_fb_modifier_name(data->modifier)) {
>> +				      igt_fb_modifier_name(data->modifier),
>> +				      igt_format_str(data->plane_format)) {
>>   				      /*
>>   				       * FIXME: joiner+async flip is busted
>> currently in KMD.
>>   				       * Remove this check once the issues are
>> fixed in KMD.
>> @@ -738,6 +799,8 @@ static void run_test_with_modifiers(data_t *data, void
>> (*test)(data_t *))
>>   			}
>>   		}
>>   	}
>> +
>> +	igt_vec_fini(&tested_formats);
>>   }
>>
>>   static data_t data;
>> @@ -757,6 +820,7 @@ igt_main
>>
>>   		if (is_intel_device(data.drm_fd))
>>   			data.bops = buf_ops_create(data.drm_fd);
>> +		data.plane_format = DRM_FORMAT_XRGB8888;
>>   	}
>>
>>   	igt_describe("Verify the async flip functionality and the fps during
>> async flips");
>> --
>> 2.34.1
> 

