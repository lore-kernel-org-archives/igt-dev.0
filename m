Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7FECD343F
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 18:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67C10E5B2;
	Tue, 12 May 2026 18:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A7XtWj1v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDD810E29A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 18:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778612307; x=1810148307;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=knaKExxnKI1lyhVzzZtB7I1xEDOxKM6JRLqeXNQGjow=;
 b=A7XtWj1vY9UUQwlmwsb0FERWDfle6JNocG9NTDoCb82DAeoE246V98Xt
 omW424u1atJQ8GxdI6mehULbD0yNy4P3a/iLplzb35Q6eh2WetLWpQbDQ
 5p7/Q7Lpear0ydYH///D7knIFJ9oSU0yCFhmFYLtGIrWBj0msl4E8WcfR
 yAuqYY50VW9rHfc1TjHJdSZYO7dFjCbLsHGC8k/B4NNGDkI8UZHFnLY8b
 v5r8Ro5XjR74OSZvQEzHTMEKzi6ebsmHmf73WeYttnJlnYQYgsOonfL2O
 ejIT9bHNewmLwdOR17+Jivx5PwJJNm5DuO+05Xz8lg681vs9e1TWpSS32 w==;
X-CSE-ConnectionGUID: svU5z2K8Rkm+OZtudGAzJQ==
X-CSE-MsgGUID: 9ea6Ie3kQLKr220w5ubScg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="67058640"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="67058640"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:58:27 -0700
X-CSE-ConnectionGUID: J/rzgO+VQwyW+2GiEqZPlA==
X-CSE-MsgGUID: qVzg/HyERrGL0Eora66Ckg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; d="scan'208";a="242202664"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 11:58:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 11:58:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 12 May 2026 11:58:25 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 12 May 2026 11:58:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WcT/aXloryv58hF3Y99YzuLIUgqcxc+386I9gKNB145jgdQyLLD+8aEupkzCpEV/bnv1IE1XCZUnuJkTQyzF50BGWJwoUPqhjPV5wEHas5Di2PC/DBseMa2OM4Cnfn/OvkyMONAVzedA0YIXgPMSGoOG2yA/W1LfVr8GnAEuBEmoFzzr5IAH0DZR17QDbxArBzVFvcTll3F5EoHq0/rzG8Hp0rGDwJr+NVXAfTe1UUlnuNbpMrcK/eo9e5KnzR2RYZgSEMe1Gl3BwMe13YBiKRGg050GH0upbPHWLn8ja38n7c9x4GTGt3tbikQ7oldGrwoInQNmmhCpTFmAMkqS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/ZysXk+HKdZ2IJ4vbTRAGfZhQvUoK3tlNzmmmyVN/E=;
 b=G5Gv6cZpccxPR/yLNY7D+93yWM3SNmm4Y8szTIhe1lVpXFa/Q94sOZvbxk7N9py7jX4uKFdRnubo13hZe+kfjpm98FdcGeiKz/+nTiE8dYNAV/Ol7C4wFNG+Ff66uPZHWnHzKKioVmE1T8SoVIpZVi+20K//8I3N7+MozMVeTnRRAuD2YitPmP07oubl0v+Ssc+KBz4kjIoQzbsRwzyxmVoR3kRMdxYDlYVfKM/9P2aQEr3UfrOo8L9uPDk04yFwHLrVCXm3gQAjT2XuApv0+h29ooBfQsSqFVG9sb7SNXvlPeuG/hH79fWL74oPQ8O8ty7fCO+EAuXHaRJbln6lDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by CH3PR11MB7275.namprd11.prod.outlook.com
 (2603:10b6:610:14c::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 18:58:19 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::7339:f2b8:cb90:3a38%5]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 18:58:18 +0000
Message-ID: <573833f8-2ff0-4d93-b073-75bdcacedefb@intel.com>
Date: Tue, 12 May 2026 20:58:12 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGxpYi9pZ3Rf?=
 =?UTF-8?Q?core=3A_add_timestamps_to_error_logs_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20260511-add_timestamps_to_logs-v3-0-041130e1f7ef@intel.com>
 <177860643470.63850.13209015695296991954@5ab824fced77>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <177860643470.63850.13209015695296991954@5ab824fced77>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI5PEPF0000098B.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::80e) To IA4PR11MB9107.namprd11.prod.outlook.com
 (2603:10b6:208:562::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|CH3PR11MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c5e0119-e8e0-48e0-5621-08deb0586c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799003|13003099007|22082099003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: WdEZX9u+phZFD/Sqy2x1kvgnF/OY4duOsjrOojZSMrIbnxhbmh+Ew73HNi4yah+reVB0D91X6kfOEOb7/Aq/bJoJ2K2rJONEWHgvwX3Go6LNvOhpLngyGvfox/sA1K9fVCQCvum1Gqe6LMoVg44xC6mHoNatSR81sD+6XOGdNJZOAfHYYrJfI7JR8Z0WjfYEMYiQJfBQaHIHV4mnKmHyDCALsBzH0sq4IwPkR1iV1lLRmclEKL3GWUCK4E7S67X1C+LI21/weklSiuzTYdZaN4VStZo9tZq672QvfUW+HVlDYdSpgMUdrqpPjcMobKkwmAurXHC0qLMuqlBl8k0/4F5MryEirYeoy1R2DsGYXjZfc5WdU0vToLrSe9uP1081Ftz87F9m90kQShfzboMXKUBqxOUuU7tHt2aWg/euT+f+z14qbJfce5ICaFdlNSCOL4xkxLpGJEhHzvH4FCb7l8zMRnEDuXeDrzm+gmuJu3XwZGGcFCCPlvUQswNOx4UfHADb3cypsOYTbCWrVa78I/eELK5P+kMGoFch0A5ROUo05ru/QOCAbobULYfB2PdWR4Vh/o1Wliz7+1agKQ8FVGwW62U74RjahF5znK9yk6AnuDq1epWsUg6e7wXPWHX2uhvyJ0unYTxCXbmWeeAJLg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(13003099007)(22082099003)(18002099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE5oMXlDc2JzenQvZFM4UURGblZoOEEwV3Nzbm9GQU95UjVrWmpJT2dPZVFk?=
 =?utf-8?B?UnhZN0N0eFBvZnk3NElmYnkzSG5xc0dKVTQwOHRPcnAxZnczUG9XUTkvbitE?=
 =?utf-8?B?NlplQ2Z5NHdNWld6Z01ld2xTQlVXWEJqUkNjdUM4NWF2K201ckJHdUhXZThz?=
 =?utf-8?B?OHpEMWgyT0xpcEUzemcvUW4vc2tibVpuSEVoSG5WQzBTTjFQWGlDekVvRFZZ?=
 =?utf-8?B?SUFTNUozNVJLNTUrMTRPQU9sb0RMMEMvR2E0b3dSbXZtd1Jtc243SkUzU2tv?=
 =?utf-8?B?Z21pbmpPL0FhQitOZ3Q0bEdkTkJSdmNRYy9ZUmczTHRaajJEN0xMUmR5VmIv?=
 =?utf-8?B?RWFWZVV0Rm9YelA2bm14TjEwN3R0VjRWeDhtRk1yQkJORzA2ZDQ2TXZZWVIw?=
 =?utf-8?B?eXFod2U1Q2tadGVQd3RGU1prRThTY2s5VkRmQ3BRU3ZTOWhuWGx4WWlITTJz?=
 =?utf-8?B?VWNMM0UwU015S2pLY2FFSENQQTdnYzRtRFduVFFhaWFqcjI0MVd1NUZ6eUZq?=
 =?utf-8?B?eGZmZjh0V0dIV1BiVU1DcEVIZWxLQ0hrTzZpVGhrSmh1Tm9JL1BUTDQwNkVI?=
 =?utf-8?B?KzNsVzYrUEs2ZUlwdi9Vb2Z5eU11b3lZdFhvT1lmbE1vdDFXRVN6RUYreWpC?=
 =?utf-8?B?QlpsbFpaL3h5dEVZazVzb2QvWjJJbXRoRmVrQm5ITkl3MjcwUnFYYWxOclpi?=
 =?utf-8?B?S1BWZW1zSmE0aENEY2hyK0tOM3JsZ1NDb1BuTjZPdzVkNkdwdnRyejVZUUJu?=
 =?utf-8?B?N045NUNMcGwrb2tOTlZrdzg3R0JyMG9MYWM3R1YyWHQ3UTA0RmFhR2t5R0sw?=
 =?utf-8?B?OUlCZG94bVdObVFINStqaVMzb0dpVDBkS293MnlwaUMwSjk1elI5K0k3U20w?=
 =?utf-8?B?TTN5WXJZblplbTFDNi9sWmg0bmNMWUg5ZEJReEFRMm80WTRyc0pFdnFrbXBX?=
 =?utf-8?B?amN1SjNhZHE3MDNETXpWUDFkRmVZYU1hTVF4TGtGQWhwOHl3K09LeE5xSG93?=
 =?utf-8?B?eDFTanI3SENWbWE5VEhZdUdtNHZOcGFqOVRUU1ROaTNVUUUwRkdnY0tWNm5q?=
 =?utf-8?B?cVk5eVFTNkZ1VnFpU2VHWlY0V0pDZklmWmIvWi9oY3FaTXdnQ2o1UHBiSEhp?=
 =?utf-8?B?V2Z1WWd6TUpsc0Zrem9HaVl2R0tKWW5kYTFyWkExWVJkYjVxWFZiaHVwRURW?=
 =?utf-8?B?U3J0bHZvQmMrbGs5cVFGNzJNMWFsem4waHkvOTQvN0RrSlE5a3hTV3F6Qlgy?=
 =?utf-8?B?eThVelU3Sjd5ckNzK1Flcy8xcmJYMkxHMDJjc09EeFN0Q0R5SGFXNW4rRG5w?=
 =?utf-8?B?bHU2dTVoT2Zjb21KeGhNNTZTbDFHOHNFMkZ5Vk1wRnpWbm9QN2V1VG5hb2xY?=
 =?utf-8?B?MXN3VGEwOVg1L3hncFk0REpVTC80MjJjVmtwSDJUZzRQVGpKTE9ZSUtUNTdI?=
 =?utf-8?B?OVNXUSs1dHRFRWEreG9uZC8rRmV3MmdQTDN2VEJab3hac29oT2o2SktpUWdL?=
 =?utf-8?B?SjlvbmZjdWZpQUF4MzQ4c1F1V2JNYWJ1MlFOOERaNlJoT0JBQkZuMy9uQU1z?=
 =?utf-8?B?ZDg2dTBtSGhPMUtuSyswRmJyWTFMZUg3UHVwamlJbXVvZG5Nb0tFbzFGUnk0?=
 =?utf-8?B?YU1OYmY1THB3SnViNWFjRWdHUUlkWG9jNkY0Wm9DNDFOL01DL0hhbWFITEts?=
 =?utf-8?B?Z0UySHRPMmdieEp1b3pWRGdSZmtsdGJOUHBYQm4wVFE1MVJncUlRY2x5bFIz?=
 =?utf-8?B?OVhFK1Q4anlldjhFK3IzQnEwVmtvRVFPT2xPdFNIc0pJUjE1ajRWTk1LVnZN?=
 =?utf-8?B?R1Radkc5OTQraGU3NnpzYzJHN3FTa3VLY3lrU2FJOG1vNnNWVU4wMDhwOFFO?=
 =?utf-8?B?S3ZkNDN5WEdVOHZYREFxcnlXdXI3b2ZnSW5sZ0t2MlIrQmREODA1VzY5NzUx?=
 =?utf-8?B?WGI0QUlPa0pmbVF3SU5QRmVPaEVVSU5QSDVRaFNCdTRCWDlvMEQrVjRTNGpp?=
 =?utf-8?B?TXhKa2NsbFRTdGtGTVcwRkVvM3pzbm1pRFI5WGZQM2FUSE1NRVM0U3lyUE5T?=
 =?utf-8?B?ZytkWkVxUlEvVi9QNWVoYlBBSTF5VWZjRzZaUjc0ZUVPdWxHbGl5RjJ5dzZK?=
 =?utf-8?B?aURCbDYzb2pCdmR4bFNMd2pMMnRDdXg3ZzdDaWprYjRWQ3g5MFhZQnhBaDRO?=
 =?utf-8?B?d2JEOEpXbFJ4dFlCbURMSGJxaHc4WGlsZnVRNzY4dFBibUtldHhFTytPVTgz?=
 =?utf-8?B?Ukdab01BVnlMN2QzbjZ2TEdqUE5sNkdqMTcxWVlScTJmSkdHcXFmSFp2ZnZT?=
 =?utf-8?B?VXdJWEt0c0xUTG1GeXE3Z0J2OHBuVzVITkNrV1o5KzUyMWgvc09MZz09?=
X-Exchange-RoutingPolicyChecked: HmMUtN0nEx5jVumFQXczj4Y1BBqf6Kb++gcT/ZQaLKJq7ol2XkbTV9imdp6LK8N+WtU87eedMd7SgT2QHuKj+uM+bKjBmDmV/mKAXMkEhOdNASl0BW8fgzcizOyWV4gut0QXGnbCXYk+i30Uve1T9TXvJrI2pvxQ1EfdUPKHPHMNAK8Okixd/7BnsUSUMfSL+3E8LdZ0VDFXTDtKswTc9hNTsUoCGx2zaW9jUWSuMlybdhTthB87ojWkjZdFdzqnD2BZHIxY4LTqJCntpq6hu8ghLhONo87l+GcVtY7jAiTb6D0uBCVG1bhCHwsNCQ4kEdQZvsmwxfiEBC+6P2hYpQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c5e0119-e8e0-48e0-5621-08deb0586c74
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 18:58:18.8007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2e70tvELnMjLRG8+BFa+gcg/I3qsVbtqei1NQT7pQOhyYyTzZPS10haAhk34JYamikTY8wiDy4TWX6Bm+O5aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7275
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


W dniu 12.05.2026 o 19:20, Patchwork pisze:
> Project List - Patchwork *Patch Details*
> *Series:* 	lib/igt_core: add timestamps to error logs (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/166137/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/index.html
>
>
>   CI Bug Log - changes from CI_DRM_18470_full -> IGTPW_15152_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15152_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15152_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/index.html
>
>
>     Participating hosts (10 -> 10)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_15152_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@i915_query@query-topology-unsupported:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@i915_query@query-topology-unsupported.html>
>  *
>
>     igt@i915_selftest@live:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-17/igt@i915_selftest@live.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@i915_selftest@live.html>
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_feature_discovery@display-3x.html>
>         +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_feature_discovery@display-3x.html>
>         +1 other test skip
>  *
>
>     igt@kms_feature_discovery@display-4x:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_feature_discovery@display-4x.html>
>

Not related.


Regards

Andrzej


>  *
>
>
>         Warnings
>
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-6/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-2/igt@kms_feature_discovery@chamelium.html>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-1/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_feature_discovery@chamelium.html>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-3/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_feature_discovery@chamelium.html>
>  *
>
>     igt@kms_feature_discovery@display-2x:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-5/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_feature_discovery@display-2x.html>
>         +1 other test skip
>       o shard-tglu: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-tglu-2/igt@kms_feature_discovery@display-2x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-10/igt@kms_feature_discovery@display-2x.html>
>  *
>
>     igt@kms_feature_discovery@display-3x:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_feature_discovery@display-3x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_feature_discovery@display-3x.html>
>         +2 other tests skip
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-18/igt@kms_feature_discovery@display-3x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_feature_discovery@display-3x.html>
>         +2 other tests skip
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-1/igt@kms_feature_discovery@display-3x.html>
>         (i915#1839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1839>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_feature_discovery@display-3x.html>
>         +2 other tests skip
>
>
>     Known issues
>
> Here are the changes found in IGTPW_15152_full that come from known 
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
>     igt@dmabuf@all-tests:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@dmabuf@all-tests.html>
>         (i915#15931
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931>)
>  *
>
>     igt@gem_basic@multigpu-create-close:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@gem_basic@multigpu-create-close.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-8/igt@gem_ccs@suspend-resume.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-5/igt@gem_ccs@suspend-resume.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@gem_ccs@suspend-resume.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@gem_ccs@suspend-resume.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_close_race@multigpu-basic-process:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@gem_close_race@multigpu-basic-process.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
>
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk11/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>  *
>
>     igt@gem_ctx_persistence@processes:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-snb7/igt@gem_ctx_persistence@processes.html>
>         (i915#1099
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>  *
>
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@gem_ctx_persistence@saturated-hostile-nopreempt.html>
>         (i915#5882
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882>)
>         +7 other tests skip
>  *
>
>     igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@gem_ctx_persistence@saturated-hostile-nopreempt@vcs1.html>
>         (i915#5882
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5882>)
>         +6 other tests skip
>  *
>
>     igt@gem_ctx_sseu@engines:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-3/igt@gem_ctx_sseu@engines.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_balancer@bonded-pair:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@gem_exec_balancer@bonded-pair.html>
>         (i915#4771
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4771>)
>  *
>
>     igt@gem_exec_balancer@bonded-true-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@gem_exec_balancer@bonded-true-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-16/igt@gem_exec_balancer@bonded-true-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-2/igt@gem_exec_balancer@bonded-true-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_balancer@invalid-bonds:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-1/igt@gem_exec_balancer@invalid-bonds.html>
>         (i915#4036
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4036>)
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@gem_exec_big@single.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@gem_exec_big@single.html>
>         (i915#16040
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16040>)
>  *
>
>     igt@gem_exec_capture@capture-invisible@smem0:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk4/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@gem_exec_capture@capture-invisible@smem0.html>
>         (i915#6334
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6334>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_capture@capture@vecs0-lmem0:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@gem_exec_capture@capture@vecs0-lmem0.html>
>         (i915#11965
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11965>)
>         +4 other tests fail
>  *
>
>     igt@gem_exec_flush@basic-wb-rw-before-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@gem_exec_flush@basic-wb-rw-before-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-read:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@gem_exec_reloc@basic-gtt-read.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +10 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-range:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-5/igt@gem_exec_reloc@basic-range.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +5 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-wc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_exec_reloc@basic-wc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-write-cpu-active:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@gem_exec_reloc@basic-write-cpu-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-read-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@gem_exec_reloc@basic-write-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +9 other tests skip
>  *
>
>     igt@gem_exec_schedule@preempt-queue-contexts-chain:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-8/igt@gem_exec_schedule@preempt-queue-contexts-chain.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_suspend@basic-s3@lmem0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-6/igt@gem_exec_suspend@basic-s3@lmem0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@gem_exec_suspend@basic-s3@lmem0.html>
>         (i915#13196
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13196>
>         / i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         +1 other test incomplete
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@gem_fenced_exec_thrash@no-spare-fences-busy-interruptible.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +1 other test skip
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk3/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@gem_lmem_swapping@heavy-verify-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@parallel-multi:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_lmem_swapping@parallel-multi.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>  *
>
>     igt@gem_lmem_swapping@random-engines:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk2/igt@gem_lmem_swapping@random-engines.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +4 other tests skip
>  *
>
>     igt@gem_lmem_swapping@smem-oom:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-9/igt@gem_lmem_swapping@smem-oom.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +4 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@gem_lmem_swapping@verify-random-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +1 other test skip
>  *
>
>     igt@gem_madvise@dontneed-before-pwrite:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@gem_madvise@dontneed-before-pwrite.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@gem_madvise@dontneed-before-pwrite.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_mmap_gtt@coherency:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@gem_mmap_gtt@coherency.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +2 other tests skip
>  *
>
>     igt@gem_mmap_wc@copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +2 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-4/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>  *
>
>     igt@gem_partial_pwrite_pread@reads-display:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-5/igt@gem_partial_pwrite_pread@reads-display.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-uncached:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +4 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@writes-after-reads-snoop:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_partial_pwrite_pread@writes-after-reads-snoop.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk5/igt@gem_pread@exhaustion.html>
>         (i915#2658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>  *
>
>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +2 other tests skip
>  *
>
>     igt@gem_render_copy@y-tiled-to-vebox-y-tiled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@gem_render_copy@y-tiled-to-vebox-y-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +8 other tests skip
>  *
>
>     igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@gem_render_copy@yf-tiled-ccs-to-yf-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +4 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@gem_set_tiling_vs_gtt.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-7/igt@gem_set_tiling_vs_gtt.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@gem_set_tiling_vs_gtt.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_softpin@evict-snoop-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@gem_softpin@evict-snoop-interruptible.html>
>         (i915#4885
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4885>)
>  *
>
>     igt@gem_tiled_blits@basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@gem_tiled_blits@basic.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +8 other tests skip
>  *
>
>     igt@gem_tiled_wb:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-16/igt@gem_tiled_wb.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +4 other tests skip
>  *
>
>     igt@gem_userptr_blits@coherency-sync:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@gem_userptr_blits@coherency-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +2 other tests skip
>  *
>
>     igt@gem_userptr_blits@create-destroy-unsync:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@gem_userptr_blits@create-destroy-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@invalid-mmap-offset-unsync:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@gem_userptr_blits@invalid-mmap-offset-unsync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_userptr_blits@map-fixed-invalidate-overlap:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@gem_userptr_blits@map-fixed-invalidate-overlap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4880>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@gem_userptr_blits@unsync-unmap.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gen9_exec_parse@basic-rejected-ctx-param:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-snb6/igt@gen9_exec_parse@basic-rejected-ctx-param.html>
>         +149 other tests skip
>  *
>
>     igt@gen9_exec_parse@batch-invalid-length:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@gen9_exec_parse@batch-invalid-length.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +6 other tests skip
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +6 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +4 other tests skip
>  *
>
>     igt@gen9_exec_parse@unaligned-jump:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-6/igt@gen9_exec_parse@unaligned-jump.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-8/igt@gen9_exec_parse@unaligned-jump.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +4 other tests skip
>  *
>
>     igt@i915_drm_fdinfo@all-busy-check-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-5/igt@i915_drm_fdinfo@all-busy-check-all.html>
>         (i915#14123
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14123>)
>  *
>
>     igt@i915_drm_fdinfo@virtual-busy-idle-all:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@i915_drm_fdinfo@virtual-busy-idle-all.html>
>         (i915#14118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@i915_drm_fdinfo@virtual-busy-idle-all.html>
>         (i915#14118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14118>)
>  *
>
>     igt@i915_pm_freq_api@freq-suspend:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-9/igt@i915_pm_freq_api@freq-suspend.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_rpm@system-suspend:
>
>       o shard-glk10: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk10/igt@i915_pm_rpm@system-suspend.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk6/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>
>         / i915#15172
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15172>)
>       o shard-rkl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-16/igt@i915_query@hwconfig_table.html>
>         (i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>  *
>
>     igt@i915_selftest@live@gem_contexts:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-17/igt@i915_selftest@live@gem_contexts.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@i915_selftest@live@gem_contexts.html>
>         (i915#15433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15433>)
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-3/igt@i915_selftest@live@workarounds.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         +1 other test dmesg-fail
>  *
>
>     igt@i915_suspend@sysfs-reader:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-glk4/igt@i915_suspend@sysfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk8/igt@i915_suspend@sysfs-reader.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@intel_hwmon@hwmon-write.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>  *
>
>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9531
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9531>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>         +1 other test fail
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-tglu-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-7/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-1.html>
>         (i915#15662
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15662>)
>         +1 other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +2 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-64bpp-rotate-180:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-0:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_big_fb@4-tiled-8bpp-rotate-0.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +5 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html>
>         (i915#15733
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733>
>         / i915#5138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>  *
>
>     igt@kms_big_fb@linear-32bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_big_fb@linear-32bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-10/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         +10 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@x-tiled-64bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_big_fb@y-tiled-16bpp-rotate-180:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html>
>         +10 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +11 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +2 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +9 other tests skip
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +35 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2:
>
>       o shard-glk11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk11/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-hdmi-a-2.html>
>         +145 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +19 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +84 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-a-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +24 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html>
>         (i915#15582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15582>)
>         +3 other tests incomplete
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +9 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-rkl: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc.html>
>         (i915#15132
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>         +1 other test abort
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +98 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-d-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#10434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +10 other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +219 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +58 other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>         +1 other test skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_edid@hdmi-mode-timings:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_chamelium_edid@hdmi-mode-timings.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +8 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-fast:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-fast:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-4/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +8 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-4/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms-hdcp14:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_content_protection@atomic-dpms-hdcp14.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-7/igt@kms_content_protection@dp-mst-lic-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0-hdcp14:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_content_protection@dp-mst-type-0-hdcp14.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-type-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>
>         / i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>
>         / i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-1-suspend-resume:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_content_protection@dp-mst-type-1-suspend-resume.html>
>         (i915#15330
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15330>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_content_protection@srm.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_content_protection@uevent-hdcp14:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_content_protection@uevent-hdcp14.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-tglu-8/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +5 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_cursor_crc@cursor-onscreen-256x85@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-max-size:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8814
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-128x42:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-1/igt@kms_cursor_crc@cursor-sliding-128x42.html>
>         (i915#8814
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x10:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x32:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +8 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_cursor_crc@cursor-sliding-64x21@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +1 other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk5/igt@kms_cursor_crc@cursor-suspend.html>
>         (i915#12358
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358>
>         / i915#14152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152>
>         / i915#7882
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7882>)
>  *
>
>     igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk5/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html>
>         (i915#12358
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12358>
>         / i915#14152
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14152>)
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +4 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html>
>         (i915#9809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +1 other test skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-5/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-12/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-3/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_dp_link_training@uhbr-sst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-9/igt@kms_dsc@dsc-fractional-bpp.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-4/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-8/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@kms_dsc@dsc-with-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-7/igt@kms_feature_discovery@chamelium.html>
>         (i915#2065
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_feature_discovery@dp-mst.html>
>         (i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>  *
>
>     igt@kms_feature_discovery@psr2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_feature_discovery@psr2.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_flip@2x-absolute-wf_vblank-interruptible:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-blocking-absolute-wf_vblank:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip@2x-modeset-vs-vblank-race:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-9/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +11 other tests skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_flip@2x-wf_vblank-ts-check.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_flip@flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_flip@flip-vs-suspend.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_flip@flip-vs-suspend.html>
>         (i915#6113
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6113>)
>         +1 other test incomplete
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk11/igt@kms_flip@flip-vs-suspend.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-6/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-10/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (i915#15132
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp3:
>
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-10/igt@kms_flip@flip-vs-suspend-interruptible@a-dp3.html>
>         (i915#15132
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15132>)
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>
>       o shard-glk11: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk11/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +3 other tests skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +5 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +1 other test skip
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-7/igt@kms_force_connector_basic@force-connector-state.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-1/igt@kms_force_connector_basic@force-connector-state.html>
>         (i915#15672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk4/igt@kms_frontbuffer_tracking@fbc-suspend.html>
>         (i915#10056
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10056>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-pwrite.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +18 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-onoff.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +18 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-pwrite:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-pwrite.html>
>         +34 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>         +126 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>
>         / i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>
>         / i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-pwrite.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +2 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +17 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +5 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-mmap-gtt.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +25 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-16/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html>
>         (i915#10055
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10055>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-plflip-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +24 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-fullscreen.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         +190 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>         +29 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html>
>         +84 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-rgb565-draw-render.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-indfb-draw-blt.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +26 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-glk8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk3/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-pri-shrfb-draw-pwrite.html>
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-draw-mmap-cpu.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +33 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-4/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +48 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +17 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         +37 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-plflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +14 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_frontbuffer_tracking@psrhdr-2p-pri-indfb-multidraw.html>
>         (i915#15991
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15991>)
>         +33 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_hdr@bpc-switch-dpms.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_hdr@bpc-switch-dpms@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@bpc-switch-suspend:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-4/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-1-xrgb2101010.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_hdr@bpc-switch-suspend@pipe-a-hdmi-a-4-xrgb2101010.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         +5 other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb16161616f:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@kms_hdr@brightness-with-hdr@pipe-a-hdmi-a-1-xrgb16161616f.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +2 other tests skip
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_hdr@static-swap.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_hdr@static-swap.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-1-xrgb2101010.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_hdr@static-toggle.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_hdr@static-toggle.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb2101010:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb2101010.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         +1 other test skip
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15459
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15459>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_joiner@basic-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (i915#14712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14712>)
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +2 other tests skip
>  *
>
>     igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-10/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html>
>         (i915#15709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15709>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier@pipe-b-plane-7.html>
>         (i915#15608
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15608>)
>         +1 other test skip
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk3/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (i915#13026
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026>)
>         +1 other test incomplete
>  *
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>
>         / i915#12177
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177>)
>  *
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk8/igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-1.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>)
>         +1 other test fail
>  *
>
>     igt@kms_plane_multiple@2x-tiling-none:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_plane_multiple@2x-tiling-none.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-a.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +9 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-b.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +4 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-d.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +9 other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_pm_backlight@basic-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (i915#12343
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343>)
>  *
>
>     igt@kms_pm_backlight@fade-with-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_pm_backlight@fade-with-dpms.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-3/igt@kms_pm_backlight@fade-with-dpms.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_pm_backlight@fade-with-suspend.html>
>         (i915#9812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812>)
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#15752
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-12/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#3361
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3361>)
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_pm_dc@dc6-dpms.html>
>         (i915#15752
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15752>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15739
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15739>)
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-14/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-5/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>  *
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-5/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_pm_rpm@modeset-non-lpsp.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-19/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_pm_rpm@package-g7.html>
>         (i915#15403
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15403>)
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-6/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>         +1 other test skip
>  *
>
>     igt@kms_prime@basic-modeset-hybrid:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_prime@basic-modeset-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +8 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-8/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#12316
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-glk10: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk10/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +11 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html>
>         (i915#9808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>)
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +12 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-snb4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +4 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +5 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
>
>       o shard-glk11: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk11/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-7/igt@kms_psr2_su@frontbuffer-xrgb8888.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>  *
>
>     igt@kms_psr@fbc-psr-cursor-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_psr@fbc-psr-cursor-blt.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-primary-blt:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_psr@fbc-psr-primary-blt.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-cursor-mmap-gtt:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk1/igt@kms_psr@fbc-psr2-cursor-mmap-gtt.html>
>         +498 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-blt@edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_psr@fbc-psr2-sprite-blt@edp-1.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@pr-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-6/igt@kms_psr@pr-dpms.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +27 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_psr@psr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +19 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@kms_psr@psr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +12 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-render:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_psr@psr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +18 other tests skip
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (i915#15949
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15949>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-270:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-8/igt@kms_rotation_crc@sprite-rotation-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>
>         / i915#15867
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15867>)
>         +1 other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-16/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_vblank@ts-continuation-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk8/igt@kms_vblank@ts-continuation-suspend.html>
>         (i915#12276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12276>)
>         +1 other test incomplete
>  *
>
>     igt@kms_vrr@flipline:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_vrr@flipline.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_vrr@lobf:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-3/igt@kms_vrr@lobf.html>
>         (i915#11920
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11920>)
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_vrr@negative-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-9/igt@kms_vrr@negative-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-drrs:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-19/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-6/igt@kms_vrr@seamless-rr-switch-drrs.html>
>         (i915#8808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-5/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@perf@gen8-unprivileged-single-ctx-counters:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@perf@gen8-unprivileged-single-ctx-counters.html>
>         (i915#2436
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2436>)
>  *
>
>     igt@perf@non-zero-reason@0-rcs0:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-7/igt@perf@non-zero-reason@0-rcs0.html>
>         (i915#9100
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9100>)
>         +1 other test fail
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-tglu-1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-1/igt@perf_pmu@module-unload.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>       o shard-glk11: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk11/igt@perf_pmu@module-unload.html>
>         (i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-8/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@coherency-gtt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@prime_vgem@coherency-gtt.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>
>         / i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@sriov_basic@enable-vfs-autoprobe-off.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-6/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>         +9 other tests fail
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-6.html>
>         (i915#12910
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12910>)
>         +9 other tests fail
>
>
>         Possible fixes
>
>  *
>
>     igt@gem_workarounds@suspend-resume-context:
>
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-glk8/igt@gem_workarounds@suspend-resume-context.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk5/igt@gem_workarounds@suspend-resume-context.html>
>  *
>
>     igt@i915_suspend@basic-s2idle-without-i915:
>
>       o shard-rkl: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-1/igt@i915_suspend@basic-s2idle-without-i915.html>
>         (i915#15131
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15131>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@i915_suspend@basic-s2idle-without-i915.html>
>  *
>
>     igt@i915_suspend@fence-restore-untiled:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@i915_suspend@fence-restore-untiled.html>
>       o shard-glk: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-glk8/igt@i915_suspend@fence-restore-untiled.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk3/igt@i915_suspend@fence-restore-untiled.html>
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#15733
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15733>
>         / i915#5138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>  *
>
>     igt@kms_cursor_crc@cursor-random-128x42:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_cursor_crc@cursor-random-128x42.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_cursor_crc@cursor-random-128x42.html>
>         +2 other tests pass
>  *
>
>     igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-tglu-6/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-tglu-2/igt@kms_cursor_crc@cursor-random-128x42@pipe-a-hdmi-a-1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-14/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (i915#13027
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13027>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-16/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-1/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (i915#15672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-3/igt@kms_force_connector_basic@prune-stale-modes.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
>
>       o shard-glk: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-glk5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-glk8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html>
>         +2 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-draw-blt.html>
>         +11 other tests pass
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-6/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html>
>         (i915#15989
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15989>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-10/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-cur-indfb-move.html>
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_hdr@static-toggle.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_hdr@static-toggle.html>
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-rkl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (i915#12756
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12756>
>         / i915#13476
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13476>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-14/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         +2 other tests pass
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#15073
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15073>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-4/igt@kms_pm_rpm@system-suspend-idle.html>
>         (i915#14419
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14419>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_pm_rpm@system-suspend-idle.html>
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-16/igt@kms_setmode@basic.html>
>         (i915#15106
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15106>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_setmode@basic.html>
>         +2 other tests pass
>
>
>         Warnings
>
>  *
>
>     igt@device_reset@cold-reset-bound:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-1/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@device_reset@cold-reset-bound.html>
>         (i915#11078
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11078>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@dmabuf@all-tests:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@dmabuf@all-tests.html>
>         (i915#15931
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@dmabuf@all-tests.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15931
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15931>)
>  *
>
>     igt@gem_close_race@multigpu-basic-threads:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@gem_close_race@multigpu-basic-threads.html>
>         (i915#7697
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7697>)
>  *
>
>     igt@gem_create@create-ext-cpu-access-sanity-check:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         (i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_create@create-ext-cpu-access-sanity-check.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6335
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6335>)
>  *
>
>     igt@gem_ctx_sseu@invalid-args:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-1/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_ctx_sseu@invalid-args.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_ctx_sseu@invalid-sseu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@gem_ctx_sseu@invalid-sseu.html>
>         (i915#280
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/280>)
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-wc-active:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-3/igt@gem_exec_reloc@basic-gtt-wc-active.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_exec_reloc@basic-gtt-wc-active.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +3 other tests skip
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +2 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@gem_partial_pwrite_pread@reads.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@gem_partial_pwrite_pread@reads.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_readwrite@beyond-eob:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-3/igt@gem_readwrite@beyond-eob.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_readwrite@beyond-eob.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_set_tiling_vs_blt@tiled-to-untiled:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_set_tiling_vs_blt@tiled-to-untiled.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>  *
>
>     igt@gen9_exec_parse@secure-batches:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@gen9_exec_parse@secure-batches.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@gen9_exec_parse@secure-batches.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +2 other tests skip
>  *
>
>     igt@i915_module_load@resize-bar:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@i915_module_load@resize-bar.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@i915_module_load@resize-bar.html>
>         (i915#6412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6412>)
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@i915_pm_sseu@full-enable.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@intel_hwmon@hwmon-read.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@intel_hwmon@hwmon-read.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-90:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +3 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +1 other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +38 other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-ccs:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-13/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-18/igt@kms_ccs@bad-aux-stride-y-tiled-ccs.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-2.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +5 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +2 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html>
>         (i915#14098
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14098>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +6 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_chamelium_edid@dp-mode-timings:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@kms_chamelium_edid@dp-mode-timings.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_chamelium_edid@dp-mode-timings.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_content_protection@legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_content_protection@legacy.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_content_protection@srm.html>
>         (i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_content_protection@srm.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15865
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15865>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         +18 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-18/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +4 other tests skip
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>
>         / i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>         +2 other tests skip
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-1/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3955
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3955>)
>  *
>
>     igt@kms_feature_discovery@dp-mst:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_feature_discovery@dp-mst.html>
>         (i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_feature_discovery@dp-mst.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9337
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9337>)
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-8/igt@kms_flip@2x-flip-vs-dpms.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip-interruptible:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_flip@2x-plain-flip-interruptible.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15643
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15643>)
>         +1 other test skip
>  *
>
>     igt@kms_force_connector_basic@force-load-detect:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-1/igt@kms_force_connector_basic@force-load-detect.html>
>         (i915#15672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15672>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-2/igt@kms_force_connector_basic@force-load-detect.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html>
>         +7 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +6 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-pwrite.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         +87 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +71 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-1/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-13/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-15/igt@kms_frontbuffer_tracking@hdr-2p-primscrn-spr-indfb-draw-render.html>
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>
>         / i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-13/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-shrfb-draw-mmap-gtt.html>
>         (i915#15104
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15104>
>         / i915#15990
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15990>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-move.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg2-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg2-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +58 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +16 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_frontbuffer_tracking@psr-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_frontbuffer_tracking@psr-suspend.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +5 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-move.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-17/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_frontbuffer_tracking@psrhdr-rgb101010-draw-render.html>
>         (i915#15102
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15102>)
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#14543
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14543>
>         / i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-mtlp-2/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#16011
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16011>)
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_hdr@invalid-hdr.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_hdr@invalid-hdr.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010.html>
>         (i915#16012
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16012>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-2-xrgb2101010.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#16025
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16025>)
>         +1 other test skip
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-3/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (i915#15458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15458>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638>
>         / i915#15722
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#15638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15638>
>         / i915#15722
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15722>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_plane_lowres@tiling-yf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_plane_lowres@tiling-yf.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_plane_multiple@2x-tiling-4.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-4/igt@kms_plane_multiple@2x-tiling-4.html>
>         (i915#13958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13958>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#14259
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14259>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>  *
>
>     igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html>
>         (i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-c.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15329
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15329>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         +4 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-7/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>  *
>
>     igt@kms_psr@pr-cursor-mmap-cpu:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@kms_psr@pr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@kms_psr@pr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +5 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-plane-move:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@kms_psr@psr-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_psr@psr-cursor-plane-move.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-plane-onoff:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-13/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-17/igt@kms_psr@psr-sprite-plane-onoff.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-5/igt@kms_vrr@flip-suspend.html>
>         (i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@kms_vrr@flip-suspend.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#15243
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15243>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@perf@mi-rpc:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-6/igt@perf@mi-rpc.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-2/igt@perf@mi-rpc.html>
>         (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>  *
>
>     igt@perf_pmu@module-unload:
>
>       o shard-dg1: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-dg1-12/igt@perf_pmu@module-unload.html>
>         (i915#13029
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13029>
>         / i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-dg1-18/igt@perf_pmu@module-unload.html>
>         (i915#15778
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15778>)
>  *
>
>     igt@prime_vgem@basic-fence-read:
>
>       o shard-rkl: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_18470/shard-rkl-4/igt@prime_vgem@basic-fence-read.html>
>         (i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15152/shard-rkl-6/igt@prime_vgem@basic-fence-read.html>
>         (i915#14544
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14544>
>         / i915#3291
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291>
>         / i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8903 -> IGTPW_15152
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_18470: 767b83aa80c6d7eaa1204a866b287b56a1a33122 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15152: 6df33ec949bd2c0558121bf907eed3c6ba74037c @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8903: 6f88532e2fe22529195cc2f8cabff93d994688f8 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
