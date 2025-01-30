Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F5DC02194
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 09:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A211010E908;
	Thu, 30 Jan 2025 09:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TCqLVMmf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33D10E905
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 09:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738229235; x=1769765235;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=naOf606rAo1mJizanSqk2B3kJQxZ2CPMJOA96Z2XB6g=;
 b=TCqLVMmfJRJsdSYzH4bVeKN7qXVLoIiyLcJBYYboJGsomNLvHoHjzUcj
 uqNCpJqrT/0N5ovq3FZPTbzhoaYgg+RXubw4/98DhbzMjG97DLh52sGtz
 m1BfCXnNvgoIrQwgmWlz8oEjvLF3Kab66tznPXjy8pL6TDrR9P2nn37nt
 fIFIWEV3XwKuwViZL2/5uvB06//rLv/K/tBSigAwIjXAEiaZZLHZw/g7J
 Z4wknSrpNcpLJS388DJLHUxUfp9zQaqq1GLSiCNTzX/2tjKfW8lko6som
 ykNTlBOvlFg/zWlos4/i/P96Jh7YVuGKSuhN2IZrTT8y4Ck1J0d8qnT0B A==;
X-CSE-ConnectionGUID: TwXld760RwyngeMhwI3wAw==
X-CSE-MsgGUID: yIfeOs7RRcqRfT6ZKZ1Jsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="38669344"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208,217";a="38669344"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 01:27:14 -0800
X-CSE-ConnectionGUID: 3VZgZNStTF6AjTllV4hY7w==
X-CSE-MsgGUID: ELpaj2uiQtWufi++aSjotg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
 d="scan'208,217";a="114254340"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 01:27:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 01:27:13 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 01:27:13 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 01:27:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTG6nlzAmD/jytYJOs2smMezW16oO1o/mnubofyqu5n0xc9lFhPD+IfJOeJBvk5X7tRjChHMeLz3W1RTd3OwaM8ACEO5CyUqXWGpbSrnM0P6PXJ6/AiOLztvh6NTE9n3ttB2FBPXnSUyt5MfsoZYT+4PO+BG6u0OTXs/Lo2g3DsmlgJn6ZdRdI36dmVXyhsNVcvicNpF7heqbzH3dXLFsIBZSYUWyoA9XKFoDL6NdKkSqIaQYbC1iqwpUuYAyayFG+U030zW3Xm3nMog/q0amJ+do7LNWiJHJfPn/jl6tNzALdn1egVVN2Of+28U27FwA67rqYZi7zt21GtnkXboxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzl8957u+yuq0ayehC9gtnIv/E4yY0bpbpqPp8YM6oU=;
 b=AoO8/E5d/uD/EspHkPFfYrNM+Li+8B2FHQRdoBGDWE9dB8qvsRTPOw3g3k0hulTFGeEvT3di4SEeHHjIfdQ9/Ui8LRwwvOWHNvrfTpyhbM5ddMQOTO95IHb979MEKL7JgE7C8HIBu89YFyTajDS36862g9GckDLBU8ZF934gM+60EbhmOXLVrmfHl2kWzyEHquVKY4enKd21Lct9BZRA6o4OpwnqUlMiP1t9m5rhMkaR3OdmOGxIF4YckuGhQkrsTXGbrjeXFXhZbLUVFCf1lyw4e6pJu7nxKWxUtICJ6olEnC7ha4hk/K8JjESZJheAhwxqnYX00UthssXMCC+36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 09:27:09 +0000
Received: from MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6]) by MW4PR11MB6864.namprd11.prod.outlook.com
 ([fe80::6f1c:5fd9:a37f:82d6%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 09:27:09 +0000
Content-Type: multipart/alternative;
 boundary="------------87n4wjlAJmd7VvqXJ70vnMll"
Message-ID: <d1ed9839-619b-4061-be27-8f662f158275@intel.com>
Date: Thu, 30 Jan 2025 10:27:04 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/xe?=
 =?UTF-8?Q?=5Feudebug=5Fonline=3A_breakpoint-many-sessions-*_add_delay_befor?=
 =?UTF-8?Q?e_resume_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250127121001.58202-1-maciej.patelczyk@intel.com>
 <173800007324.1494793.17181789770277466865@b555e5b46a47>
Content-Language: en-US
From: Maciej Patelczyk <maciej.patelczyk@intel.com>
In-Reply-To: <173800007324.1494793.17181789770277466865@b555e5b46a47>
X-ClientProxiedBy: DUZPR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::7) To MW4PR11MB6864.namprd11.prod.outlook.com
 (2603:10b6:303:21b::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6864:EE_|SN7PR11MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: c5be4d87-3807-4e60-e102-08dd411044c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHZwVjM1dnpkN1kyamVTY2RyMjhZVldadm00WVM2aCtzRXB5OG92dHR1c1Fu?=
 =?utf-8?B?a29qWTdLYnp0eWpzVjFGeWJNNXBHc3B6RlJiNE9EcnVQRE50Wm9Ka2dLS1Yr?=
 =?utf-8?B?d2hJVk5nSmxkeUkzQWE3eDRMM2dManpFd0NEU1UyTDhDYnAvM0tPMkxJUkU4?=
 =?utf-8?B?dXYyZTlQeEZEKzlIZHBQc0VOZWF4VHhTZlQ1RnN3T3NtOTV3Njc4OXowVVFt?=
 =?utf-8?B?ZjZXS0VSQjBMa2h2Uzkza0ViVDlhbmg0SlphVGZhYTJQdmxMS2ZoK1FzajFT?=
 =?utf-8?B?VFlhN2Z4ZXJiOTJTZkJVWU1rbkU2aHlUU0NtaXFOZ2Nub3BwcHVmMnp4dkRl?=
 =?utf-8?B?WnZKUzZIV0dEZ0JMZUUvdTZmSGRYRXF6NTl6RUNmYUd2Q0RpOFZ0OXY4Um9D?=
 =?utf-8?B?eFN1d24wR3E0UWNzTi9TRzZZRDc3RkdLMDdldEZ0SkxnUTZDbVNSRGtqdkcz?=
 =?utf-8?B?RU5XQzhWcWwzUHhVOGowdFVYb1JYd1VTbkNjODV6K29KWHZFbmhYamVnQXZt?=
 =?utf-8?B?Z0dlc09BVmtHT3Budm0vS2xEM3RZRU8xWnhRVndvNGhOT005ZGhRSkFta0cv?=
 =?utf-8?B?RlY3aXBzTFZFT2h5RDRocDBXNmhyRGJMcXppY3l6Yk1EZ083RWpQRHlGbkxU?=
 =?utf-8?B?cUI2WUhGYTJvTUlWZmsxZVFnNnp2dUhUcFZVb1F6NDdPelBLaXBYNUo5SlV3?=
 =?utf-8?B?VXVrdnI2L2RWSVpzNDRpMG1sVGg2V2oyc3FxMktNbTdUVGlKUWM0ZjNJWUVC?=
 =?utf-8?B?SXVLUzVLNXhCUlV4Nk94YUhmWU1Qb0MwSXRJd1F0M3JURjBOU2xoOHBvRHN2?=
 =?utf-8?B?V0pxb2dMR1pVYkYvd0RoVjBHWm8rblJENnA1YzZpYlNabkh3RzV6SzBVVkl5?=
 =?utf-8?B?UDE1WDRIbnpZbHh0UjhOOFFaQmhYVjZwd3YvMEdqclRrL1BzVEo2aE9Vb1Az?=
 =?utf-8?B?bDdnZmNhWmNSZWhuZms4YWZobkh2VWFtbWZaZjM5MU5lcm1SSjJQY3cvN3hV?=
 =?utf-8?B?VEcweHUrRnBuWWxFS05DZUFrSFdjcytGa1NsL0lZemdNczd5MmxxR2k1akJO?=
 =?utf-8?B?SVdsZ1pnc1hsbkEwRkE1T3dJcDBoWHlRc0NpZUdxTFFkZmNoQzRHMDJRTDJu?=
 =?utf-8?B?T01jVzZ4RVg5cUV3VmhmTGFRUUhISVlSczlGOXl6T2NYM2dsalVDcThwbERV?=
 =?utf-8?B?MDduWkp0aVNNaU1hWmtnUCtSTExuZGJpOUZ3UCtKUGFyajZXcWNER2QySlFq?=
 =?utf-8?B?Tmw1R0tKZTJCeTFTUlhuVFhPWUl5c3ViMGErMXptZXhDUzU1Y0UzZkVicmhS?=
 =?utf-8?B?S3VHY0pwZEs2NkFGK3JZS1gzczVPV0tvZHFFVXJiMzB6K3NjVUtrYTkrT2xy?=
 =?utf-8?B?UlZvZ3hWcDBiaEIrN3BnOTVFT3ZGSlZDRm5yQytIUC92dTdnd3c4TG05TENx?=
 =?utf-8?B?cWV5SVhlV0tWZUdxN3ZmQUQ1Q2Y3OGJ0bEUrRFREcVYxTEhyTk84eHJ1TlZr?=
 =?utf-8?B?ZE1oeGxJU0lvMTMvZW96a2R0b0Y3VTVrUEk5M1c5Zkc2TUl3RjFHRkJZSGZi?=
 =?utf-8?B?MDdQTjVhcmltZ0V1VFViNjZhUUtTTVVIZThoUWNsRjVvVTR0dnBpZGR1UUNC?=
 =?utf-8?B?YUFBaERVelpiMzdSS3lNRHpkdlpweFVhbUxqaTM4OGhZTE05MWh4ajViZDVT?=
 =?utf-8?B?ZGZ4eW9WZTZudUZKeGpPamE5bzRTNy9QRWF4MlVtQWVESm9WMkEvZlg2Z1pu?=
 =?utf-8?B?VWQrSzNDdVdTMXY2My9BYW9pTlU3clczTnl0L2FubnZ1MWpvajRqdzliVEdw?=
 =?utf-8?B?Y256Q2pGVlZVTFd2UFZCdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2E1T1BXK1o1QTh1R1V1UHFXcGZCUWJxbXRkdXp4N245Umh4aTN1bFk1OWNq?=
 =?utf-8?B?YW9YamdiVXRYQ1NKWHplbXBGOFVXSENHS29UWjRQODUzcXNtT0l5R3NkWnlv?=
 =?utf-8?B?dlVkWmJ4UmdNN1F6bmJ4UTZpZ0dnMTZpdWZMYWtwUVRFWXFFb2hnSGhoMTln?=
 =?utf-8?B?Ym11KytOWFVuc3JacXN2V29FbzI4d3NFdkpBUEJLdVhVWU40KzhuemY0bVh3?=
 =?utf-8?B?UUVNbm03cmR0VmZEVG1JNWNsWHAwdkRYY1Rmb1MzWFZUVE9KU2h2VFdqYmda?=
 =?utf-8?B?M2VkcWhGVmZDRDdicjM5V1lQQVYvY3pobzBMbHlacDRSUHZaSk4zQU9KempN?=
 =?utf-8?B?bStYZmlweTJMMS9leFVRMnJxZEZtZ0NrVmdZZXVwazQ4QklRMjRxYnVxcGI0?=
 =?utf-8?B?WUhaeFZPWWpXcmowK3Mxb25jcmUvS3dMK3pRQmRabHZVeVpINWJna1ljU2Nx?=
 =?utf-8?B?ak0vVHMzWjlsdmxxQVNyN2l4MWJ1aFV4WG5JNGQ4bGtBWUNSRm83eWM3cldL?=
 =?utf-8?B?M3dheFl4VW9iYmRvRXY3bkVPY2xkcVNMYzVyZGNuNlVnZWlIOGVKdElja3ls?=
 =?utf-8?B?VW84VUxBakloRS9HcCt4VnNDaUVjaGJTc3M3SHkxR2FrZEFxRjV6c1N2Yzcw?=
 =?utf-8?B?QTlWNWhZdUlWZ001M1JKWENRTTUvcEhMSG9NMTZFdUdwVXF4Q0R1RjR1QUxP?=
 =?utf-8?B?ZGRUY1QzMnd1UGhTTEwxQ1ZIV3ZxekVualRpQlMvRTlFMjQ3enJlWWtiY05C?=
 =?utf-8?B?Y3NMU2JQSG41MHRXTHpRT3Q3U3B0TUhQcU1wYmNYS1VkNmc4UVNKOWpZdzNt?=
 =?utf-8?B?ODJjTllmMUVjVi9kNzhUMHp1bmVtTDkwdVdadzdiQTMzdnZ5dDBLaHBCeFpN?=
 =?utf-8?B?OUdGRVFINU9BMXpJTS9SU1hVQm9scnRENnNLSVA2QVhJcnlPMDNJVFBnU3oy?=
 =?utf-8?B?MENkTmZhN2xNTXlXeUM4S01Bd29LRllFNmNFMktGd080VWoyZjdFN3Z5cXV5?=
 =?utf-8?B?WlUxNnd6RTdmZkVmNDg3UWxaZEN3dHVRUDNvVEp5Z1BlYXRRUnhsdENjUDI3?=
 =?utf-8?B?QllwYiswMEtNd21jUWYrT0FacHU4b1psZ1RUWDF3WWsvZWlTb2JLUW84NmlM?=
 =?utf-8?B?Zi9pUWUvQTNTNlY5NWF1Qnc0d0dHZHd0VjdMMC9KelZkdWxmKzhnRGFjS0Q4?=
 =?utf-8?B?ek1MVlp6cFR4UzVmMFYvL0l3VG82NkM4Ym5CMDdodk84RHVreUVGWkJ0NjFR?=
 =?utf-8?B?WFpyZ2NXd0JZNUljbkt5VlEwMW8xNDZldjl1cnh5bFZ6cko5SktIR1VsTmFo?=
 =?utf-8?B?c1hQV2JuaDFYR1pCVDcwZnJMOXJuSVc0SmM5VWN3cFFESDJTMWF1Tk5LK25t?=
 =?utf-8?B?SXVzd0ZaQmFrc293VjB2OHFEamJyaVV5QTFaZGp6WTJYZzNhbkw5cUh6eVpm?=
 =?utf-8?B?NTFDbkhhYzJod0tkaDJOaXNuUlN6QmhNa2gwRGxPL24xKzUrSi8wMmJrN3Iw?=
 =?utf-8?B?NURnZ01jUVFCSm8ySkw0Q3RkOUxBMXNmVmtydWhSMVp6dGpvbDB2UVhmYUda?=
 =?utf-8?B?YzVQd0dzQXhtcWNmZUxreTVjeTMvdEJaNjl2MVg2T0NweHhjM2ZhV1FGMkJJ?=
 =?utf-8?B?WHhFU1ZNay9nenZ5N3VBSEhYKzBiRDNqeGZ6U2M5S1M3NFl0YUFNdEprNWF2?=
 =?utf-8?B?WjRBMnAxN2g0MXFWTXZ1aXZWQWlwSEJIWm9XSTN5TC9WSko5dENBa05uR3dB?=
 =?utf-8?B?eU5sY0tvVnlrMEd5WUhZTmRwOGJ0cnFDWWJIU1MvMXNlUlkyaDVpcFlvMEg5?=
 =?utf-8?B?VzVCYzdkSk13QXFxVUhmSGFqT3had0xPTVJZS0E2NXV4ME1xY2pkdXdzWThr?=
 =?utf-8?B?RDgvS3o5NmUvaU4wSUFiKzJzMjFjRWd5MTZhWTJxYzF0eFJIUkIwN1E2dnZ1?=
 =?utf-8?B?SmNNd0lIWmhwYWUwNFFpSWRzNXBMVUFJNFFHZXBYbHpOdUVlREtEUVhqSFIr?=
 =?utf-8?B?UHE5Mzcydk1MR3R2RmJOOUV0K0F1MmwrUVdyS3JBeXUyVG5hZmdJUENudDha?=
 =?utf-8?B?eWxkQjRiYWU0eFB2ZExEZzQ5N3ptei9nR1VlTEVaZTZQUDNEZi9DVHNpdGpE?=
 =?utf-8?B?RGtaQjIrRnl4bDljSk5CM0xKMkRFdHdISjdTa3QvcVZYU2NTdFVRbVBjekRM?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5be4d87-3807-4e60-e102-08dd411044c4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 09:27:09.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22DFkErzeKAHcaDy39Tmpumg2aK35XGqOtuQCMZ1s+z/RthABvGl6Td9intC4Na+x26Id1Wkoq7azGP2eTAUnz6UnVDDuoKH/SsaquuWBr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

--------------87n4wjlAJmd7VvqXJ70vnMll
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 27.01.2025 18:47, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/xe_eudebug_online: breakpoint-many-sessions-* add 
> delay before resume (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/143924/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/index.html
>
>
>   CI Bug Log - changes from IGT_8210_full -> IGTPW_12498_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_12498_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12498_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/index.html
>
>
>     Participating hosts (12 -> 11)
>
> Missing (1): shard-dg2-set2
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_12498_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@gem_eio@banned:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-2/igt@gem_eio@banned.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@gem_eio@banned.html>
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random.html>
>         +1 other test abort
>  *
>
>     igt@gem_pxp@hw-rejects-pxp-context:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html>
>  *
>
>     igt@gem_workarounds@reset-context:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg2-2/igt@gem_workarounds@reset-context.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gem_workarounds@reset-context.html>
>
The scope of the change is limited to xe_eudebug_online.c and a single test.

Those failures are unrelated.


Regards,

Maciej




>         Warnings
>
>   * igt@gem_vm_create@execbuf:
>       o shard-snb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-snb2/igt@gem_vm_create@execbuf.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb5/igt@gem_vm_create@execbuf.html>
>
>
>     New tests
>
> New tests have been introduced between IGT_8210_full and IGTPW_12498_full:
>
>
>       New IGT tests (1)
>
>   * igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:
>       o Statuses : 1 pass(s)
>       o Exec time: [0.04] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_12498_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-keep-cache:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         ([i915#8411])
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@api_intel_bb@crc32.html>
>         ([i915#6230])
>  *
>
>     igt@api_intel_bb@object-reloc-keep-cache:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html>
>         ([i915#8411])
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@debugfs_test@basic-hwmon.html>
>         ([i915#9318])
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@device_reset@cold-reset-bound.html>
>         ([i915#11078])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@device_reset@cold-reset-bound.html>
>         ([i915#11078])
>  *
>
>     igt@device_reset@unbind-cold-reset-rebind:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html>
>         ([i915#11078])
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html>
>         ([i915#11814] / [i915#11815] / [i915#9413])
>  *
>
>     igt@drm_fdinfo@busy-hang@bcs0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@drm_fdinfo@busy-hang@bcs0.html>
>         ([i915#8414]) +23 other tests skip
>  *
>
>     igt@drm_fdinfo@busy@vcs1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@drm_fdinfo@busy@vcs1.html>
>         ([i915#8414]) +8 other tests skip
>  *
>
>     igt@drm_fdinfo@isolation@rcs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@drm_fdinfo@isolation@rcs0.html>
>         ([i915#8414]) +13 other tests skip
>  *
>
>     igt@gem_caching@read-writes:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@gem_caching@read-writes.html>
>         ([i915#4873])
>  *
>
>     igt@gem_ccs@block-copy-compressed:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html>
>         ([i915#3555] / [i915#9323])
>  *
>
>     igt@gem_ccs@ctrl-surf-copy:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#3555] / [i915#9323]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html>
>         ([i915#3555] / [i915#9323]) +1 other test skip
>  *
>
>     igt@gem_ccs@large-ctrl-surf-copy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html>
>         ([i915#13008])
>  *
>
>     igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html>
>         ([i915#12392] / [i915#7297])
>  *
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_close_race@multigpu-basic-threads.html>
>         ([i915#7697])
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         ([i915#6335])
>  *
>
>     igt@gem_ctx_persistence@heartbeat-hostile:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html>
>         ([i915#8555]) +1 other test skip
>  *
>
>     igt@gem_ctx_persistence@heartbeat-many:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-many.html>
>         ([i915#8555]) +1 other test skip
>  *
>
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html>
>         ([i915#5882]) +7 other tests skip
>  *
>
>     igt@gem_ctx_persistence@smoketest:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb7/igt@gem_ctx_persistence@smoketest.html>
>         ([i915#1099]) +6 other tests skip
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_ctx_sseu@engines.html>
>         ([i915#280]) +1 other test skip
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html>
>         ([i915#280]) +2 other tests skip
>  *
>
>     igt@gem_ctx_sseu@mmap-args:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html>
>         ([i915#280]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html>
>         ([i915#280])
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk3/igt@gem_eio@in-flight-suspend.html>
>         ([i915#13390])
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb1/igt@gem_eio@reset-stress.html>
>         ([i915#8898])
>  *
>
>     igt@gem_exec_balancer@bonded-sync:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html>
>         ([i915#4771]) +1 other test skip
>  *
>
>     igt@gem_exec_balancer@parallel:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_exec_balancer@parallel.html>
>         ([i915#4525]) +2 other tests skip
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@gem_exec_balancer@parallel-balancer.html>
>         ([i915#4525])
>  *
>
>     igt@gem_exec_fence@submit:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_exec_fence@submit.html>
>         ([i915#4812]) +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@gem_exec_fence@submit.html>
>         ([i915#4812])
>  *
>
>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         ([i915#3539] / [i915#4852]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html>
>         ([i915#3711])
>  *
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html>
>         ([i915#3539])
>  *
>
>     igt@gem_exec_flush@basic-wb-pro-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@gem_exec_flush@basic-wb-pro-default.html>
>         ([i915#3539] / [i915#4852])
>  *
>
>     igt@gem_exec_reloc@basic-concurrent0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@gem_exec_reloc@basic-concurrent0.html>
>         ([i915#3281]) +16 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html>
>         ([i915#3281]) +20 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-scanout:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@gem_exec_reloc@basic-scanout.html>
>         ([i915#3281]) +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-active:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@gem_exec_reloc@basic-write-read-active.html>
>         ([i915#3281]) +10 other tests skip
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_exec_schedule@semaphore-power.html>
>         ([i915#4812]) +3 other tests skip
>  *
>
>     igt@gem_fenced_exec_thrash@2-spare-fences:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html>
>         ([i915#4860]) +2 other tests skip
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html>
>         ([i915#4860]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences.html>
>         ([i915#4860])
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@gem_huc_copy@huc-copy.html>
>         ([i915#2190])
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html>
>         ([i915#4613] / [i915#7582])
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         ([i915#4613]) +2 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html>
>         ([i915#4613])
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html>
>         ([i915#4613]) +3 other tests skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         ([i915#12193])
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html>
>         ([i915#4565])
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html>
>         ([i915#4613]) +2 other tests skip
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk4/igt@gem_lmem_swapping@verify-ccs.html>
>         ([i915#4613]) +7 other tests skip
>  *
>
>     igt@gem_media_vme:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@gem_media_vme.html>
>         ([i915#284])
>  *
>
>     igt@gem_mmap_gtt@basic-write-read-distinct:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@gem_mmap_gtt@basic-write-read-distinct.html>
>         ([i915#4077]) +6 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-basic-small-copy:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy.html>
>         ([i915#4077]) +17 other tests skip
>  *
>
>     igt@gem_mmap_gtt@fault-concurrent-x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-x.html>
>         ([i915#4077]) +13 other tests skip
>  *
>
>     igt@gem_mmap_gtt@medium-copy-odd:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gem_mmap_gtt@medium-copy-odd.html>
>         ([i915#12917] / [i915#12964])
>  *
>
>     igt@gem_mmap_wc@pf-nonblock:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@gem_mmap_wc@pf-nonblock.html>
>         ([i915#4083]) +3 other tests skip
>  *
>
>     igt@gem_mmap_wc@read-write:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@gem_mmap_wc@read-write.html>
>         ([i915#4083]) +2 other tests skip
>  *
>
>     igt@gem_mmap_wc@write-read:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_mmap_wc@write-read.html>
>         ([i915#4083]) +7 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-display:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html>
>         ([i915#3282]) +4 other tests skip
>  *
>
>     igt@gem_pwrite@basic-exhaustion:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#3282]) +13 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#3282]) +7 other tests skip
>       o shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb2/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>       o shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk6/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
>  *
>
>     igt@gem_pxp@display-protected-crc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gem_pxp@display-protected-crc.html>
>         ([i915#4270]) +3 other tests skip
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@gem_pxp@display-protected-crc.html>
>         ([i915#12917] / [i915#12964]) +1 other test timeout
>  *
>
>     igt@gem_pxp@fail-invalid-protected-context:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html>
>         ([i915#12964])
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-on:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-on.html>
>         ([i915#4270]) +6 other tests skip
>  *
>
>     igt@gem_readwrite@write-bad-handle:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@gem_readwrite@write-bad-handle.html>
>         ([i915#3282]) +1 other test skip
>  *
>
>     igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html>
>         ([i915#5190] / [i915#8428]) +5 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html>
>         ([i915#8428]) +2 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@gem_render_tiled_blits@basic.html>
>         ([i915#4079])
>  *
>
>     igt@gem_softpin@noreloc-s3:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk7/igt@gem_softpin@noreloc-s3.html>
>         ([i915#13306])
>  *
>
>     igt@gem_tiled_pread_pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_tiled_pread_pwrite.html>
>         ([i915#4079]) +2 other tests skip
>  *
>
>     igt@gem_tiled_swapping@non-threaded:
>
>       o shard-snb: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb7/igt@gem_tiled_swapping@non-threaded.html>
>         ([i915#13263] / [i915#13449])
>  *
>
>     igt@gem_unfence_active_buffers:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_unfence_active_buffers.html>
>         ([i915#4879])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@gem_unfence_active_buffers.html>
>         ([i915#4879])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@gem_unfence_active_buffers.html>
>         ([i915#4879])
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_userptr_blits@coherency-sync.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@dmabuf-unsync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@gem_userptr_blits@dmabuf-unsync.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@forbidden-operations:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_userptr_blits@forbidden-operations.html>
>         ([i915#3282] / [i915#3297])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-4/igt@gem_userptr_blits@forbidden-operations.html>
>         ([i915#3282] / [i915#3297])
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html>
>         ([i915#3297] / [i915#4880])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html>
>         ([i915#3297] / [i915#4880]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html>
>         ([i915#3297])
>  *
>
>     igt@gem_userptr_blits@unsync-overlap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@gem_userptr_blits@unsync-overlap.html>
>         ([i915#3297]) +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         ([i915#3297]) +4 other tests skip
>  *
>
>     igt@gen7_exec_parse@chained-batch:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html>
>         +27 other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-large:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gen9_exec_parse@bb-large.html>
>         ([i915#2856]) +1 other test skip
>  *
>
>     igt@gen9_exec_parse@bb-start-cmd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html>
>         ([i915#2527]) +3 other tests skip
>  *
>
>     igt@gen9_exec_parse@bb-start-far:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html>
>         ([i915#2527]) +4 other tests skip
>  *
>
>     igt@gen9_exec_parse@cmd-crossing-page:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gen9_exec_parse@cmd-crossing-page.html>
>         ([i915#2856]) +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@valid-registers:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@gen9_exec_parse@valid-registers.html>
>         ([i915#2527] / [i915#2856])
>  *
>
>     igt@i915_fb_tiling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@i915_fb_tiling.html>
>         ([i915#4881])
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#9820])
>       o shard-tglu: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#12817] / [i915#9820])
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html>
>         ([i915#10131] / [i915#10887] / [i915#9820])
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@i915_module_load@resize-bar.html>
>         ([i915#7178])
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         ([i915#6590]) +1 other test skip
>  *
>
>     igt@i915_pm_rc6_residency@rc6-accuracy:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html>
>         ([i915#12942]) +1 other test fail
>  *
>
>     igt@i915_pm_rc6_residency@rc6-idle:
>
>       o shard-tglu: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle.html>
>         ([i915#2681]) +6 other tests warn
>  *
>
>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html>
>         +14 other tests skip
>  *
>
>     igt@i915_pm_rps@min-max-config-idle:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html>
>         ([i915#11681] / [i915#6621]) +1 other test skip
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@i915_query@hwconfig_table.html>
>         ([i915#6245])
>  *
>
>     igt@i915_selftest@live:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-5/igt@i915_selftest@live.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@i915_selftest@live.html>
>         ([i915#13550]) +1 other test dmesg-fail
>  *
>
>     igt@i915_suspend@forcewake:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-2/igt@i915_suspend@forcewake.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@i915_suspend@forcewake.html>
>         ([i915#12964])
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707]) +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@intel_hwmon@hwmon-write.html>
>         ([i915#7707]) +1 other test skip
>  *
>
>     igt@kms_addfb_basic@basic-y-tiled-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html>
>         ([i915#4215] / [i915#5190])
>  *
>
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>         ([i915#4212]) +2 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html>
>         ([i915#8709]) +7 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html>
>         ([i915#8709]) +3 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html>
>         ([i915#8709]) +15 other tests skip
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@kms_async_flips@invalid-async-flip-atomic.html>
>         ([i915#12967])
>  *
>
>     igt@kms_async_flips@test-cursor-atomic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_async_flips@test-cursor-atomic.html>
>         ([i915#10333])
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         ([i915#9531])
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html>
>         ([i915#12238])
>  *
>
>     igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html>
>         ([i915#11859])
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html>
>         ([i915#5956]) +1 other test fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         ([i915#1769] / [i915#3555])
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html>
>         ([i915#4538] / [i915#5286]) +6 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-addfb:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html>
>         ([i915#5286])
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>         ([i915#5286]) +5 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         ([i915#5286]) +9 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html>
>         ([i915#5286]) +1 other test skip
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-90:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html>
>         ([i915#3638]) +7 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-0:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html>
>         ([i915#12964]) +23 other tests dmesg-warn
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         ([i915#3638]) +7 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html>
>         ([i915#4538] / [i915#5190]) +12 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html>
>         ([i915#4538]) +8 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html>
>         ([i915#4423] / [i915#6095]) +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html>
>         ([i915#10307] / [i915#10434] / [i915#6095]) +3 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html>
>         ([i915#10307] / [i915#6095]) +137 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +54 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html>
>         ([i915#6095]) +29 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         ([i915#12805])
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html>
>         ([i915#6095]) +79 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         ([i915#12805])
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html>
>         ([i915#6095]) +182 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html>
>         ([i915#6095]) +17 other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +3 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +1 other test skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html>
>         ([i915#6095]) +24 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         ([i915#12313]) +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         ([i915#12313])
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_cdclk@mode-transition.html>
>         ([i915#3742])
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_cdclk@mode-transition.html>
>         ([i915#3742])
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html>
>         ([i915#3742]) +1 other test skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html>
>         ([i915#11616] / [i915#7213]) +4 other tests skip
>  *
>
>     igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html>
>         ([i915#4087]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_chamelium_color@degamma.html>
>         +15 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         ([i915#11151] / [i915#7828]) +8 other tests skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         ([i915#11151] / [i915#7828]) +11 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd.html>
>         ([i915#11151] / [i915#7828]) +13 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-after-suspend:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html>
>         ([i915#11151] / [i915#7828]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd.html>
>         ([i915#11151] / [i915#7828]) +3 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-without-ddc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html>
>         ([i915#11151] / [i915#7828]) +7 other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_content_protection@atomic.html>
>         ([i915#7116] / [i915#9424]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_content_protection@atomic.html>
>         ([i915#6944] / [i915#7116] / [i915#7118] / [i915#9424]) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         ([i915#3299])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         ([i915#3299])
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         ([i915#3299]) +1 other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html>
>         ([i915#3116]) +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html>
>         ([i915#3116] / [i915#3299])
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html>
>         ([i915#3116] / [i915#3299])
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_content_protection@lic-type-0.html>
>         ([i915#9424]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_content_protection@lic-type-0.html>
>         ([i915#9424])
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_content_protection@mei-interface.html>
>         ([i915#9424])
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-512x170:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-512x170.html>
>         ([i915#13049]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html>
>         ([i915#13566]) +2 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html>
>         ([i915#13049]) +2 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html>
>         ([i915#13049]) +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-64x21:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html>
>         ([i915#13566]) +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-128x42:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html>
>         ([i915#8814]) +4 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x32:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html>
>         ([i915#3555]) +6 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         ([i915#13049]) +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         ([i915#3555] / [i915#8814]) +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4213])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4103] / [i915#4213]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4103])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4103] / [i915#4213])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         ([i915#4103])
>  *
>
>     igt@kms_cursor_legacy@cursor-vs-flip-toggle:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-14/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html>
>         ([i915#4423])
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html>
>         ([i915#13046] / [i915#5354]) +4 other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>
>       o shard-dg1: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>         ([i915#4423])
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         ([i915#9067])
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         ([i915#9833])
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9723])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         ([i915#9833])
>  *
>
>     igt@kms_display_modes@mst-extended-mode-negative:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_display_modes@mst-extended-mode-negative.html>
>         ([i915#8588])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_display_modes@mst-extended-mode-negative.html>
>         ([i915#8588])
>  *
>
>     igt@kms_draw_crc@draw-method-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-gtt.html>
>         ([i915#8812])
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_dsc@dsc-basic.html>
>         ([i915#3555] / [i915#3840]) +1 other test skip
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         ([i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html>
>         ([i915#3555] / [i915#3840])
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         ([i915#3840] / [i915#9053])
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html>
>         ([i915#3955])
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_feature_discovery@chamelium.html>
>         ([i915#4854])
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@kms_feature_discovery@display-3x.html>
>         ([i915#1839]) +1 other test skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_feature_discovery@display-4x.html>
>         ([i915#1839])
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html>
>         ([i915#9337])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html>
>         ([i915#9337])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_feature_discovery@dp-mst.html>
>         ([i915#9337])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@kms_feature_discovery@dp-mst.html>
>         ([i915#9337])
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_feature_discovery@psr1.html>
>         ([i915#658])
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_feature_discovery@psr2.html>
>         ([i915#658]) +1 other test skip
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         ([i915#3637]) +4 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms.html>
>         ([i915#3637]) +6 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         ([i915#9934]) +12 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html>
>         ([i915#12745] / [i915#4839]) +1 other test incomplete
>  *
>
>     igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html>
>         ([i915#4839]) +1 other test incomplete
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         ([i915#9934]) +4 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         ([i915#3637])
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         ([i915#9934]) +7 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
>
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>         ([i915#11989]) +1 other test fail
>  *
>
>     igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html>
>         ([i915#12964]) +20 other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html>
>         ([i915#11989]) +2 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@kms_flip@flip-vs-fences-interruptible.html>
>         ([i915#8381])
>  *
>
>     igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html>
>         ([i915#11989]) +2 other tests fail
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         ([i915#11989]) +5 other tests fail
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +6 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +6 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html>
>         ([i915#2587] / [i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#8813])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html>
>         ([i915#2672] / [i915#8813])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html>
>         ([i915#2587] / [i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         ([i915#2587] / [i915#2672]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html>
>         ([i915#2672] / [i915#3555]) +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         ([i915#2672] / [i915#3555])
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         ([i915#2672] / [i915#3555]) +6 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         ([i915#2672] / [i915#3555] / [i915#5190]) +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         ([i915#2672]) +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html>
>         ([i915#5354]) +32 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html>
>         +72 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html>
>         ([i915#1825]) +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         ([i915#1825]) +61 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html>
>         +39 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         ([i915#5439])
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html>
>         ([i915#10433] / [i915#3458])
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html>
>         +76 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +27 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#8708]) +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html>
>         ([i915#8708]) +22 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html>
>         ([i915#3458]) +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         ([i915#3023]) +40 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html>
>         ([i915#3458]) +27 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_hdr@bpc-switch.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html>
>         ([i915#12713])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html>
>         ([i915#12713])
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@kms_hdr@static-toggle-dpms.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_hdr@static-toggle-suspend:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228])
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html>
>         ([i915#3555] / [i915#8228])
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html>
>         ([i915#10656])
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html>
>         ([i915#12388])
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_joiner@basic-ultra-joiner.html>
>         ([i915#12339])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_joiner@basic-ultra-joiner.html>
>         ([i915#12339])
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         ([i915#12339]) +1 other test skip
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         ([i915#13522])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         ([i915#13522])
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         ([i915#13026]) +1 other test incomplete
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic.html>
>         ([i915#12178])
>  *
>
>     igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html>
>         ([i915#7862]) +1 other test fail
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html>
>         ([i915#3555] / [i915#8821])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html>
>         ([i915#8821])
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html>
>         ([i915#3555]) +11 other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html>
>         ([i915#6953])
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html>
>         ([i915#12247]) +2 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html>
>         ([i915#12247]) +22 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html>
>         ([i915#12247]) +13 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html>
>         ([i915#12247]) +12 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#3555])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html>
>         ([i915#12247] / [i915#3555] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html>
>         ([i915#12247] / [i915#6953])
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html>
>         ([i915#12247]) +3 other tests skip
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html>
>         ([i915#5354]) +2 other tests skip
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html>
>         ([i915#12343])
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html>
>         ([i915#5354]) +2 other tests skip
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html>
>         ([i915#3828])
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#12913])
>       o shard-tglu-1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html>
>         ([i915#9295])
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html>
>         ([i915#4281])
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html>
>         ([i915#3828])
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html>
>         ([i915#8430])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_pm_lpsp@screens-disabled.html>
>         ([i915#8430])
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html>
>         ([i915#9519]) +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         ([i915#9519]) +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         ([i915#9519])
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         ([i915#9519])
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html>
>         ([i915#6524])
>  *
>
>     igt@kms_prime@basic-crc-vgem:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_prime@basic-crc-vgem.html>
>         ([i915#6524])
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524]) +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_prime@basic-modeset-hybrid.html>
>         ([i915#6524])
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html>
>         ([i915#9808]) +1 other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         ([i915#11520]) +16 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         ([i915#11520]) +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         ([i915#12316]) +6 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html>
>         ([i915#11520]) +10 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         ([i915#11520]) +8 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         ([i915#11520]) +17 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html>
>         ([i915#11520]) +12 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html>
>         ([i915#11520]) +15 other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         ([i915#9683])
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_psr2_su@page_flip-p010.html>
>         ([i915#9683])
>  *
>
>     igt@kms_psr@fbc-pr-cursor-plane-move:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_psr@fbc-pr-cursor-plane-move.html>
>         ([i915#9688]) +12 other tests skip
>  *
>
>     igt@kms_psr@psr-basic:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_psr@psr-basic.html>
>         ([i915#9732]) +19 other tests skip
>  *
>
>     igt@kms_psr@psr-primary-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_psr@psr-primary-mmap-cpu.html>
>         ([i915#1072] / [i915#9732]) +23 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-blt:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb2/igt@kms_psr@psr-sprite-blt.html>
>         +478 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-mmap-cpu:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_psr@psr2-primary-mmap-cpu.html>
>         ([i915#1072] / [i915#9732]) +33 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-blt:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html>
>         ([i915#9732]) +7 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-plane-onoff:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk2/igt@kms_psr@psr2-sprite-plane-onoff.html>
>         +484 other tests skip
>  *
>
>     igt@kms_psr@psr2-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_psr@psr2-suspend.html>
>         ([i915#1072] / [i915#9732]) +32 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         ([i915#9685]) +1 other test skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         ([i915#9685]) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@bad-pixel-format:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html>
>         ([i915#12755]) +1 other test skip
>  *
>
>     igt@kms_rotation_crc@exhaust-fences:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html>
>         ([i915#4884])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_rotation_crc@exhaust-fences.html>
>         ([i915#4235])
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_rotation_crc@exhaust-fences.html>
>         ([i915#4235])
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html>
>         ([i915#5289]) +2 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         ([i915#12755] / [i915#5190])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         ([i915#5289])
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html>
>         ([i915#5289]) +1 other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html>
>         ([i915#12755]) +1 other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html>
>         ([i915#3555]) +11 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-center.html>
>         ([i915#3555]) +6 other tests skip
>  *
>
>     igt@kms_selftest@drm_framebuffer:
>
>       o shard-dg1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_selftest@drm_framebuffer.html>
>         ([i915#13179]) +1 other test abort
>  *
>
>     igt@kms_setmode@invalid-clone-exclusive-crtc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html>
>         ([i915#3555]) +2 other tests skip
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_sysfs_edid_timing.html>
>         ([IGT#160])
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html>
>         ([i915#8623])
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         ([i915#8623])
>  *
>
>     igt@kms_vblank@query-forked-hang:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-1/igt@kms_vblank@query-forked-hang.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_vblank@query-forked-hang.html>
>         ([i915#12917] / [i915#12964])
>  *
>
>     igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html>
>         ([i915#1311])
>  *
>
>     igt@kms_vrr@flip-basic-fastset:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@kms_vrr@flip-basic-fastset.html>
>         ([i915#9906])
>  *
>
>     igt@kms_vrr@flip-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_vrr@flip-dpms.html>
>         ([i915#3555] / [i915#8808])
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_vrr@max-min.html>
>         ([i915#9906])
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_vrr@negative-basic.html>
>         ([i915#3555] / [i915#9906])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_vrr@negative-basic.html>
>         ([i915#3555] / [i915#9906])
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         ([i915#9906])
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         ([i915#9906]) +1 other test skip
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_writeback@writeback-check-output.html>
>         ([i915#2437])
>  *
>
>     igt@kms_writeback@writeback-check-output-xrgb2101010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         ([i915#2437] / [i915#9412])
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html>
>         ([i915#2437] / [i915#9412])
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         ([i915#2437] / [i915#9412]) +1 other test skip
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk9/igt@kms_writeback@writeback-invalid-parameters.html>
>         ([i915#2437]) +1 other test skip
>  *
>
>     igt@perf@gen12-group-concurrent-oa-buffer-read:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-6/igt@perf@gen12-group-concurrent-oa-buffer-read.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html>
>         ([i915#10538])
>  *
>
>     igt@perf@global-sseu-config:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@perf@global-sseu-config.html>
>         ([i915#7387])
>  *
>
>     igt@perf@non-zero-reason:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@perf@non-zero-reason.html>
>         ([i915#9100]) +1 other test fail
>  *
>
>     igt@perf@per-context-mode-unprivileged:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html>
>         ([i915#2435])
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html>
>         ([i915#2433])
>  *
>
>     igt@perf_pmu@busy-start@vcs1:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-4/igt@perf_pmu@busy-start@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@perf_pmu@busy-start@vcs1.html>
>         ([i915#4349]) +3 other tests fail
>  *
>
>     igt@perf_pmu@event-wait:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@perf_pmu@event-wait.html>
>         ([i915#8807])
>  *
>
>     igt@perf_pmu@event-wait@rcs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html>
>         ([i915#3555] / [i915#8807])
>  *
>
>     igt@perf_pmu@frequency@gt0:
>
>       o shard-dg1: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@perf_pmu@frequency@gt0.html>
>         ([i915#12549] / [i915#6806]) +1 other test fail
>  *
>
>     igt@perf_pmu@most-busy-check-all:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@perf_pmu@most-busy-check-all.html>
>         ([i915#4349]) +1 other test fail
>  *
>
>     igt@perf_pmu@most-busy-idle-check-all@rcs0:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html>
>         ([i915#11943]) +1 other test fail
>  *
>
>     igt@perf_pmu@rc6-all-gts:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@perf_pmu@rc6-all-gts.html>
>         ([i915#8516])
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@prime_vgem@basic-fence-read.html>
>         ([i915#3291] / [i915#3708])
>  *
>
>     igt@prime_vgem@basic-write:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-3/igt@prime_vgem@basic-write.html>
>         ([i915#3291] / [i915#3708]) +1 other test skip
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@prime_vgem@coherency-gtt.html>
>         ([i915#3708] / [i915#4077])
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@prime_vgem@coherency-gtt.html>
>         ([i915#3708]) +1 other test skip
>  *
>
>     igt@prime_vgem@fence-flip-hang:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@prime_vgem@fence-flip-hang.html>
>         ([i915#3708]) +3 other tests skip
>  *
>
>     igt@prime_vgem@fence-write-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@prime_vgem@fence-write-hang.html>
>         ([i915#3708])
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         ([i915#9917]) +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html>
>         ([i915#9917])
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html>
>         ([i915#12910]) +19 other tests fail
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         ([i915#9917])
>
>
>         Possible fixes
>
>  *
>
>     igt@debugfs_test@read_all_entries_display_on:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-5/igt@debugfs_test@read_all_entries_display_on.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@debugfs_test@read_all_entries_display_on.html>
>         +1 other test pass
>  *
>
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>         ([i915#7297]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html>
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@gem_eio@hibernate.html>
>         ([i915#7975]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_eio@hibernate.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-18/igt@gem_eio@unwedge-stress.html>
>         ([i915#12714] / [i915#5784]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_eio@wait-wedge-10ms:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@gem_eio@wait-wedge-10ms.html>
>         ([i915#13193]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@gem_eio@wait-wedge-10ms.html>
>  *
>
>     igt@gem_exec_balancer@full-late:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-12/igt@gem_exec_balancer@full-late.html>
>         ([i915#13364]) -> PASS <https://intel-gfx-ci.01>
>
--------------87n4wjlAJmd7VvqXJ70vnMll
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 27.01.2025 18:47, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173800007324.1494793.17181789770277466865@b555e5b46a47">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/xe_eudebug_online: breakpoint-many-sessions-* add
              delay before resume (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/143924/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/143924/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_8210_full -&gt; IGTPW_12498_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_12498_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_12498_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/index.html</a></p>
      <h2>Participating hosts (12 -&gt; 11)</h2>
      <p>Missing (1): shard-dg2-set2 </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_12498_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@gem_eio@banned:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-2/igt@gem_eio@banned.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@gem_eio@banned.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-13/igt@gem_lmem_swapping@heavy-verify-random.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_lmem_swapping@heavy-verify-random.html" moz-do-not-send="true">ABORT</a> +1 other test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@hw-rejects-pxp-context:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@gem_pxp@hw-rejects-pxp-context.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@reset-context:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg2-2/igt@gem_workarounds@reset-context.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gem_workarounds@reset-context.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>The scope of the change is limited to xe_eudebug_online.c and a
      single test.</p>
    <p>Those failures are unrelated.</p>
    <p><br>
    </p>
    <p>Regards,</p>
    <p>Maciej<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:173800007324.1494793.17181789770277466865@b555e5b46a47">
      <h4>Warnings</h4>
      <ul>
        <li>igt@gem_vm_create@execbuf:
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-snb2/igt@gem_vm_create@execbuf.html" moz-do-not-send="true">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb5/igt@gem_vm_create@execbuf.html" moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between IGT_8210_full and
        IGTPW_12498_full:</p>
      <h3>New IGT tests (1)</h3>
      <ul>
        <li>igt@gem_exercise_blt@fast-copy@yfmajor-smem-smem:
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.04] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_12498_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@api_intel_bb@blit-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411])</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@crc32:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> ([i915#6230])</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-keep-cache:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@api_intel_bb@object-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> ([i915#8411])</li>
          </ul>
        </li>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> ([i915#9318])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@cold-reset-bound:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@device_reset@cold-reset-bound.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-cold-reset-rebind:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@device_reset@unbind-cold-reset-rebind.html" moz-do-not-send="true">SKIP</a> ([i915#11078])</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">ABORT</a> ([i915#11814] /
              [i915#11815] / [i915#9413])</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-hang@bcs0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@drm_fdinfo@busy-hang@bcs0.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +23 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy@vcs1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@drm_fdinfo@busy@vcs1.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@isolation@rcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@drm_fdinfo@isolation@rcs0.html" moz-do-not-send="true">SKIP</a> ([i915#8414]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_caching@read-writes:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@gem_caching@read-writes.html" moz-do-not-send="true">SKIP</a> ([i915#4873])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-copy-compressed:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_ccs@block-copy-compressed.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@ctrl-surf-copy:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9323]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@large-ctrl-surf-copy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gem_ccs@large-ctrl-surf-copy.html" moz-do-not-send="true">SKIP</a> ([i915#13008])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@gem_ccs@suspend-resume@xmajor-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#12392] /
              [i915#7297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_close_race@multigpu-basic-threads:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_close_race@multigpu-basic-threads.html" moz-do-not-send="true">SKIP</a> ([i915#7697])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-ext-cpu-access-sanity-check:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_create@create-ext-cpu-access-sanity-check.html" moz-do-not-send="true">SKIP</a> ([i915#6335])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-hostile:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@gem_ctx_persistence@heartbeat-hostile.html" moz-do-not-send="true">SKIP</a> ([i915#8555]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-many:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_ctx_persistence@heartbeat-many.html" moz-do-not-send="true">SKIP</a> ([i915#8555]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@saturated-hostile-nopreempt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html" moz-do-not-send="true">SKIP</a> ([i915#5882]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@smoketest:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb7/igt@gem_ctx_persistence@smoketest.html" moz-do-not-send="true">SKIP</a> ([i915#1099]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@engines:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_ctx_sseu@engines.html" moz-do-not-send="true">SKIP</a> ([i915#280]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@invalid-sseu:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_ctx_sseu@invalid-sseu.html" moz-do-not-send="true">SKIP</a> ([i915#280]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_sseu@mmap-args:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html" moz-do-not-send="true">SKIP</a> ([i915#280]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@gem_ctx_sseu@mmap-args.html" moz-do-not-send="true">SKIP</a> ([i915#280])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk3/igt@gem_eio@in-flight-suspend.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#13390])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb1/igt@gem_eio@reset-stress.html" moz-do-not-send="true">FAIL</a> ([i915#8898])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-sync:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_exec_balancer@bonded-sync.html" moz-do-not-send="true">SKIP</a> ([i915#4771]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_exec_balancer@parallel.html" moz-do-not-send="true">SKIP</a> ([i915#4525]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@gem_exec_balancer@parallel-balancer.html" moz-do-not-send="true">SKIP</a> ([i915#4525])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@submit:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_exec_fence@submit.html" moz-do-not-send="true">SKIP</a> ([i915#4812]) +1 other
              test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@gem_exec_fence@submit.html" moz-do-not-send="true">SKIP</a> ([i915#4812])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-batch-kernel-default-cmd:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html" moz-do-not-send="true">SKIP</a> ([i915#3711])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-set-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-pro-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@gem_exec_flush@basic-wb-pro-default.html" moz-do-not-send="true">SKIP</a> ([i915#3539] /
              [i915#4852])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-concurrent0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@gem_exec_reloc@basic-concurrent0.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-read-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@gem_exec_reloc@basic-gtt-read-noreloc.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-scanout:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@gem_exec_reloc@basic-scanout.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-read-active:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@gem_exec_reloc@basic-write-read-active.html" moz-do-not-send="true">SKIP</a> ([i915#3281]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@semaphore-power:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> ([i915#4812]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@2-spare-fences:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@gem_fenced_exec_thrash@2-spare-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4860]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_fenced_exec_thrash@no-spare-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4860]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@gem_fenced_exec_thrash@no-spare-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4860])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@gem_huc_copy@huc-copy.html" moz-do-not-send="true">SKIP</a> ([i915#2190])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> ([i915#4613] /
              [i915#7582])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@gem_lmem_swapping@heavy-verify-multi.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@gem_lmem_swapping@heavy-verify-multi.html" moz-do-not-send="true">SKIP</a> ([i915#4613])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-3/igt@gem_lmem_swapping@heavy-verify-random.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12193])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> ([i915#4565])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +2 other
              tests skip</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk4/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4613]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_media_vme:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@gem_media_vme.html" moz-do-not-send="true">SKIP</a> ([i915#284])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-write-read-distinct:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@gem_mmap_gtt@basic-write-read-distinct.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-basic-small-copy:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_mmap_gtt@cpuset-basic-small-copy.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@fault-concurrent-x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@gem_mmap_gtt@fault-concurrent-x.html" moz-do-not-send="true">SKIP</a> ([i915#4077]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@medium-copy-odd:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gem_mmap_gtt@medium-copy-odd.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#12917] /
              [i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@pf-nonblock:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@gem_mmap_wc@pf-nonblock.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@read-write:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@gem_mmap_wc@read-write.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-read:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@gem_mmap_wc@write-read.html" moz-do-not-send="true">SKIP</a> ([i915#4083]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@writes-after-reads-display:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@gem_partial_pwrite_pread@writes-after-reads-display.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pwrite@basic-exhaustion:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@gem_pwrite@basic-exhaustion.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +13 other
              tests skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_pwrite@basic-exhaustion.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +7 other
              tests skip</li>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb2/igt@gem_pwrite@basic-exhaustion.html" moz-do-not-send="true">WARN</a> ([i915#2658])</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk6/igt@gem_pwrite@basic-exhaustion.html" moz-do-not-send="true">WARN</a> ([i915#2658])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@display-protected-crc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gem_pxp@display-protected-crc.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +3 other
              tests skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@gem_pxp@display-protected-crc.html" moz-do-not-send="true">TIMEOUT</a> ([i915#12917] /
              [i915#12964]) +1 other test timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@fail-invalid-protected-context:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gem_pxp@fail-invalid-protected-context.html" moz-do-not-send="true">TIMEOUT</a> ([i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-on:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@gem_pxp@reject-modify-context-protection-on.html" moz-do-not-send="true">SKIP</a> ([i915#4270]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_readwrite@write-bad-handle:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@gem_readwrite@write-bad-handle.html" moz-do-not-send="true">SKIP</a> ([i915#3282]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@gem_render_copy@mixed-tiled-to-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#5190] /
              [i915#8428]) +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-ccs-to-yf-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_render_copy@y-tiled-ccs-to-yf-tiled.html" moz-do-not-send="true">SKIP</a> ([i915#8428]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> ([i915#4079])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_softpin@noreloc-s3:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk7/igt@gem_softpin@noreloc-s3.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#13306])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_pread_pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_tiled_pread_pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#4079]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_swapping@non-threaded:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb7/igt@gem_tiled_swapping@non-threaded.html" moz-do-not-send="true">ABORT</a> ([i915#13263] /
              [i915#13449])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_unfence_active_buffers:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_unfence_active_buffers.html" moz-do-not-send="true">SKIP</a> ([i915#4879])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@gem_unfence_active_buffers.html" moz-do-not-send="true">SKIP</a> ([i915#4879])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@gem_unfence_active_buffers.html" moz-do-not-send="true">SKIP</a> ([i915#4879])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@coherency-sync:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_userptr_blits@coherency-sync.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-unsync:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@gem_userptr_blits@dmabuf-unsync.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@forbidden-operations:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gem_userptr_blits@forbidden-operations.html" moz-do-not-send="true">SKIP</a> ([i915#3282] /
              [i915#3297])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-4/igt@gem_userptr_blits@forbidden-operations.html" moz-do-not-send="true">SKIP</a> ([i915#3282] /
              [i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html" moz-do-not-send="true">SKIP</a> ([i915#3297] /
              [i915#4880])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html" moz-do-not-send="true">SKIP</a> ([i915#3297] /
              [i915#4880]) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@gem_userptr_blits@map-fixed-invalidate-overlap-busy.html" moz-do-not-send="true">SKIP</a> ([i915#3297])</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-overlap:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@gem_userptr_blits@unsync-overlap.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@gem_userptr_blits@unsync-unmap-after-close.html" moz-do-not-send="true">SKIP</a> ([i915#3297]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen7_exec_parse@chained-batch:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@gen7_exec_parse@chained-batch.html" moz-do-not-send="true">SKIP</a> +27 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-large:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gen9_exec_parse@bb-large.html" moz-do-not-send="true">SKIP</a> ([i915#2856]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-cmd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gen9_exec_parse@bb-start-cmd.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-start-far:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@gen9_exec_parse@bb-start-far.html" moz-do-not-send="true">SKIP</a> ([i915#2527]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@cmd-crossing-page:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> ([i915#2856]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@valid-registers:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@gen9_exec_parse@valid-registers.html" moz-do-not-send="true">SKIP</a> ([i915#2527] /
              [i915#2856])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_fb_tiling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@i915_fb_tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4881])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#9820])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#12817] /
              [i915#9820])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@i915_module_load@reload-with-fault-injection.html" moz-do-not-send="true">ABORT</a> ([i915#10131] /
              [i915#10887] / [i915#9820])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@resize-bar:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@i915_module_load@resize-bar.html" moz-do-not-send="true">SKIP</a> ([i915#7178])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> ([i915#6590]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-accuracy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@i915_pm_rc6_residency@rc6-accuracy.html" moz-do-not-send="true">FAIL</a> ([i915#12942]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rc6_residency@rc6-idle:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@i915_pm_rc6_residency@rc6-idle.html" moz-do-not-send="true">WARN</a> ([i915#2681]) +6 other
              tests warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@gem-execbuf-stress-pc8:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html" moz-do-not-send="true">SKIP</a> +14 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@min-max-config-idle:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@i915_pm_rps@min-max-config-idle.html" moz-do-not-send="true">SKIP</a> ([i915#11681] /
              [i915#6621]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> ([i915#6245])</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-5/igt@i915_selftest@live.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@i915_selftest@live.html" moz-do-not-send="true">DMESG-FAIL</a> ([i915#13550]) +1
              other test dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@forcewake:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-2/igt@i915_suspend@forcewake.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@i915_suspend@forcewake.html" moz-do-not-send="true">DMESG-FAIL</a> ([i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> ([i915#7707]) +1 other
              test skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> ([i915#7707])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> ([i915#7707]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_addfb_basic@basic-y-tiled-legacy.html" moz-do-not-send="true">SKIP</a> ([i915#4215] /
              [i915#5190])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-4/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> ([i915#4212]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-a-hdmi-a-4-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-1-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-3-4-mc-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#8709]) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@kms_async_flips@invalid-async-flip-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#12967])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@test-cursor-atomic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_async_flips@test-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#10333])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html" moz-do-not-send="true">SKIP</a> ([i915#9531])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html" moz-do-not-send="true">FAIL</a> ([i915#12238])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-glk3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@2x-outputs.html" moz-do-not-send="true">FAIL</a> ([i915#11859])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-4.html" moz-do-not-send="true">FAIL</a> ([i915#5956]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> ([i915#1769] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5286]) +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_big_fb@4-tiled-addfb.html" moz-do-not-send="true">SKIP</a> ([i915#5286])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +5 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +9 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> ([i915#5286]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_big_fb@linear-64bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-2/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#12964]) +23
              other tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> ([i915#3638]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> ([i915#4538] /
              [i915#5190]) +12 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> ([i915#4538]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#4423] /
              [i915#6095]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#10434] / [i915#6095]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_ccs@ccs-on-another-bo-yf-tiled-ccs@pipe-a-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#10307] /
              [i915#6095]) +137 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +54 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +29 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12805])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +79 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12805])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +182 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +3 other
              tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#6095]) +24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +2 other
              tests skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313]) +2 other
              tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> ([i915#12313])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> ([i915#3742])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> ([i915#3742])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> ([i915#3742]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#11616] /
              [i915#7213]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-3.html" moz-do-not-send="true">SKIP</a> ([i915#4087]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_chamelium_color@degamma.html" moz-do-not-send="true">SKIP</a> +15 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +8 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +11 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_chamelium_hpd@dp-hpd.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +13 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_chamelium_hpd@hdmi-hpd.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html" moz-do-not-send="true">SKIP</a> ([i915#11151] /
              [i915#7828]) +7 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#7116] /
              [i915#9424]) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> ([i915#6944] /
              [i915#7116] / [i915#7118] / [i915#9424]) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3299])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_content_protection@dp-mst-lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3299])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#3299]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-3/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3116]) +1 other
              test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#3116] /
              [i915#3299])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html" moz-do-not-send="true">SKIP</a> ([i915#3116] /
              [i915#3299])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#9424]) +1 other
              test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_content_protection@mei-interface.html" moz-do-not-send="true">SKIP</a> ([i915#9424])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_cursor_crc@cursor-offscreen-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-2.html" moz-do-not-send="true">FAIL</a> ([i915#13566]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049]) +2 other
              tests skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send="true">SKIP</a> ([i915#13049]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-64x21:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-7/igt@kms_cursor_crc@cursor-random-64x21.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_cursor_crc@cursor-random-64x21.html" moz-do-not-send="true">FAIL</a> ([i915#13566]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html" moz-do-not-send="true">SKIP</a> ([i915#8814]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html" moz-do-not-send="true">SKIP</a> ([i915#13049]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-max-size.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8814]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#4213])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#4103] /
              [i915#4213])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html" moz-do-not-send="true">SKIP</a> ([i915#4103])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-14/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html" moz-do-not-send="true">SKIP</a> ([i915#13046] /
              [i915#5354]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#4423])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> ([i915#9067])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9833])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9723])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> ([i915#9833])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@mst-extended-mode-negative:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send="true">SKIP</a> ([i915#8588])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_display_modes@mst-extended-mode-negative.html" moz-do-not-send="true">SKIP</a> ([i915#8588])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_draw_crc@draw-method-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_draw_crc@draw-method-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8812])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_dsc@dsc-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_dsc@dsc-with-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#3840])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> ([i915#3840] /
              [i915#9053])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3955])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> ([i915#4854])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-3x:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@kms_feature_discovery@display-3x.html" moz-do-not-send="true">SKIP</a> ([i915#1839]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@display-4x:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_feature_discovery@display-4x.html" moz-do-not-send="true">SKIP</a> ([i915#1839])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@dp-mst:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> ([i915#9337])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> ([i915#9337])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> ([i915#9337])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@kms_feature_discovery@dp-mst.html" moz-do-not-send="true">SKIP</a> ([i915#9337])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> ([i915#658])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr2:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_feature_discovery@psr2.html" moz-do-not-send="true">SKIP</a> ([i915#658]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@kms_flip@2x-blocking-absolute-wf_vblank.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3637]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_flip@2x-flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk2/igt@kms_flip@2x-flip-vs-suspend.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#12745] /
              [i915#4839]) +1 other test incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk2/igt@kms_flip@2x-flip-vs-suspend-interruptible@ab-hdmi-a1-hdmi-a2.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#4839]) +1
              other test incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_flip@2x-modeset-vs-vblank-race.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +4 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_flip@2x-plain-flip-fb-recreate.html" moz-do-not-send="true">SKIP</a> ([i915#3637])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#9934]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb1/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_flip@dpms-off-confusion-interruptible@a-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#12964]) +20
              other tests dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-2/igt@kms_flip@flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> ([i915#8381])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a1.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +2 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">FAIL</a> ([i915#11989]) +5 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672] / [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#8813])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#8813])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672] / [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2587] /
              [i915#2672]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +4 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555]) +6 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> ([i915#2672] /
              [i915#3555] / [i915#5190]) +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> ([i915#2672]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-rte:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-rte.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +32 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> +72 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> ([i915#1825]) +61 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> +39 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> ([i915#5439])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> ([i915#10433] /
              [i915#3458])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu.html" moz-do-not-send="true">SKIP</a> +76 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +27 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> ([i915#8708]) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_frontbuffer_tracking@psr-indfb-scaledprimary.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> ([i915#3023]) +40 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_frontbuffer_tracking@psr-rgb565-draw-pwrite.html" moz-do-not-send="true">SKIP</a> ([i915#3458]) +27 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> ([i915#12713])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> ([i915#12713])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-suspend:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228]) +1 other test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_hdr@static-toggle-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8228])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#10656])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_joiner@basic-force-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12388])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12339])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12339])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#12339]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#13522])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> ([i915#13522])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk9/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#13026]) +1
              other test incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic.html" moz-do-not-send="true">FAIL</a> ([i915#12178])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk4/igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> ([i915#7862]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8821])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> ([i915#8821])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> ([i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_plane_scaling@planes-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-d.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#3555] / [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> ([i915#12247] /
              [i915#6953])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-c.html" moz-do-not-send="true">SKIP</a> ([i915#12247]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_pm_backlight@bad-brightness.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#12343])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-dpms:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_pm_backlight@fade-with-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#5354]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> ([i915#3828])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> ([i915#12913])</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send="true">FAIL</a> ([i915#9295])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#4281])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#3828])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> ([i915#8430])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> ([i915#8430])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg2-8/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> ([i915#9519])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-vgem:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_prime@basic-crc-vgem.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-modeset-hybrid:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524]) +1 other
              test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@kms_prime@basic-modeset-hybrid.html" moz-do-not-send="true">SKIP</a> ([i915#6524])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> ([i915#9808]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +16 other
              tests skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> ([i915#12316]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +8 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk1/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +17 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html" moz-do-not-send="true">SKIP</a> ([i915#11520]) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html" moz-do-not-send="true">SKIP</a> ([i915#9683])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> ([i915#9683])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_psr@fbc-pr-cursor-plane-move.html" moz-do-not-send="true">SKIP</a> ([i915#9688]) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-basic:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_psr@psr-basic.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_psr@psr-primary-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +23 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-blt:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-snb2/igt@kms_psr@psr-sprite-blt.html" moz-do-not-send="true">SKIP</a> +478 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-mmap-cpu:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_psr@psr2-primary-mmap-cpu.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +33 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-blt:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_psr@psr2-sprite-blt.html" moz-do-not-send="true">SKIP</a> ([i915#9732]) +7 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk2/igt@kms_psr@psr2-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> +484 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-2/igt@kms_psr@psr2-suspend.html" moz-do-not-send="true">SKIP</a> ([i915#1072] /
              [i915#9732]) +32 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html" moz-do-not-send="true">SKIP</a> ([i915#9685]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@bad-pixel-format:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_rotation_crc@bad-pixel-format.html" moz-do-not-send="true">SKIP</a> ([i915#12755]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@exhaust-fences:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_rotation_crc@exhaust-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4884])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@kms_rotation_crc@exhaust-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4235])</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_rotation_crc@exhaust-fences.html" moz-do-not-send="true">SKIP</a> ([i915#4235])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> ([i915#5289]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> ([i915#12755] /
              [i915#5190])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> ([i915#5289])</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> ([i915#5289]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@kms_rotation_crc@sprite-rotation-90.html" moz-do-not-send="true">SKIP</a> ([i915#12755]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-center:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_scaling_modes@scaling-mode-center.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +11 other
              tests skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-10/igt@kms_scaling_modes@scaling-mode-center.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +6 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_selftest@drm_framebuffer:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@kms_selftest@drm_framebuffer.html" moz-do-not-send="true">ABORT</a> ([i915#13179]) +1 other
              test abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html" moz-do-not-send="true">SKIP</a> ([i915#3555]) +2 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@kms_sysfs_edid_timing.html" moz-do-not-send="true">FAIL</a> ([IGT#160])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> ([i915#8623])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@query-forked-hang:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-1/igt@kms_vblank@query-forked-hang.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@kms_vblank@query-forked-hang.html" moz-do-not-send="true">DMESG-WARN</a> ([i915#12917] /
              [i915#12964])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-rkl-2/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> ([i915#1311])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic-fastset:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-2/igt@kms_vrr@flip-basic-fastset.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_vrr@flip-dpms.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8808])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_vrr@max-min.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-1/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9906])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-18/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-5/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> ([i915#9906])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-vrr.html" moz-do-not-send="true">SKIP</a> ([i915#9906]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> ([i915#2437])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-5/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-7/igt@kms_writeback@writeback-check-output-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412])</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> ([i915#2437] /
              [i915#9412]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-glk9/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> ([i915#2437]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-6/igt@perf@gen12-group-concurrent-oa-buffer-read.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@perf@gen12-group-concurrent-oa-buffer-read.html" moz-do-not-send="true">FAIL</a> ([i915#10538])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-7/igt@perf@global-sseu-config.html" moz-do-not-send="true">SKIP</a> ([i915#7387])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@non-zero-reason:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-1/igt@perf@non-zero-reason.html" moz-do-not-send="true">FAIL</a> ([i915#9100]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@per-context-mode-unprivileged:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-1/igt@perf@per-context-mode-unprivileged.html" moz-do-not-send="true">SKIP</a> ([i915#2435])</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-12/igt@perf@per-context-mode-unprivileged.html" moz-do-not-send="true">SKIP</a> ([i915#2433])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-start@vcs1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-4/igt@perf_pmu@busy-start@vcs1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@perf_pmu@busy-start@vcs1.html" moz-do-not-send="true">FAIL</a> ([i915#4349]) +3 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@event-wait:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@perf_pmu@event-wait.html" moz-do-not-send="true">SKIP</a> ([i915#8807])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@event-wait@rcs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-8/igt@perf_pmu@event-wait@rcs0.html" moz-do-not-send="true">SKIP</a> ([i915#3555] /
              [i915#8807])</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@frequency@gt0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@perf_pmu@frequency@gt0.html" moz-do-not-send="true">FAIL</a> ([i915#12549] /
              [i915#6806]) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-check-all:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-4/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">FAIL</a> ([i915#4349]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-idle-check-all@rcs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@perf_pmu@most-busy-idle-check-all@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-5/igt@perf_pmu@most-busy-idle-check-all@rcs0.html" moz-do-not-send="true">FAIL</a> ([i915#11943]) +1 other
              test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6-all-gts:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-tglu-3/igt@perf_pmu@rc6-all-gts.html" moz-do-not-send="true">SKIP</a> ([i915#8516])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-read:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@prime_vgem@basic-fence-read.html" moz-do-not-send="true">SKIP</a> ([i915#3291] /
              [i915#3708])</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-write:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-3/igt@prime_vgem@basic-write.html" moz-do-not-send="true">SKIP</a> ([i915#3291] /
              [i915#3708]) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@coherency-gtt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-2/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#3708] /
              [i915#4077])</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-7/igt@prime_vgem@coherency-gtt.html" moz-do-not-send="true">SKIP</a> ([i915#3708]) +1 other
              test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-flip-hang:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-14/igt@prime_vgem@fence-flip-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708]) +3 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-write-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-6/igt@prime_vgem@fence-write-hang.html" moz-do-not-send="true">SKIP</a> ([i915#3708])</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-10/igt@sriov_basic@enable-vfs-autoprobe-on.html" moz-do-not-send="true">SKIP</a> ([i915#9917]) +1 other
              test skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-rkl-6/igt@sriov_basic@enable-vfs-autoprobe-on.html" moz-do-not-send="true">SKIP</a> ([i915#9917])</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-2.html" moz-do-not-send="true">FAIL</a> ([i915#12910]) +19 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> ([i915#9917])</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@debugfs_test@read_all_entries_display_on:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-5/igt@debugfs_test@read_all_entries_display_on.html" moz-do-not-send="true">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-6/igt@debugfs_test@read_all_entries_display_on.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> ([i915#7297])
              -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg2-3/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-smem-lmem0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> ([i915#7975]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-3/igt@gem_eio@hibernate.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-18/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">FAIL</a> ([i915#12714] /
              [i915#5784]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-dg1-13/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@wait-wedge-10ms:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-mtlp-7/igt@gem_eio@wait-wedge-10ms.html" moz-do-not-send="true">ABORT</a> ([i915#13193]) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12498/shard-mtlp-1/igt@gem_eio@wait-wedge-10ms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@full-late:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8210/shard-dg1-12/igt@gem_exec_balancer@full-late.html" moz-do-not-send="true">FAIL</a> ([i915#13364]) -&gt; <a href="https://intel-gfx-ci.01" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
  </body>
</html>

--------------87n4wjlAJmd7VvqXJ70vnMll--
