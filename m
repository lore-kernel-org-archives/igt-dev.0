Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3426EE77184
	for <igt-dev@archiver.kernel.org>; Tue, 17 Dec 2024 12:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BB210E94D;
	Tue, 17 Dec 2024 12:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F5T5Yvd3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35C310E94D;
 Tue, 17 Dec 2024 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734437404; x=1765973404;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=EEuuAVoXdCXbnTnrWFt4Rwer57w8ExhuG/kR2bDCc+c=;
 b=F5T5Yvd3ZCiVT3fydIVUMs/yfsJiEjMpkCneRvZW+vDmEcZkIzuBKhDK
 wpROPYu8DCLvIhjDyickE6uPS8t4K6j6Py1CnOFkntDb6rvEGbMkqjKnr
 NBN+W9MsBJmQuzHePaaEFzCcULgipZeWpDl+UL426uJYMhD6UyWNX89ji
 T2TrfP+N/rquq7SAvr/RUrQvOLkey8g570YgbrBSrwQUU8fG5oNb4HgGs
 aufbomXfCtVZWhbA7z7qmpYQ6DVqFcgiKyD2uzJG5l5mmsqGSgWAsfMPH
 D2NXjyQr53krGeGOhDNFFIgr3HkYvMT9d16lYihQuhjmrBQwYgNTUT2KL Q==;
X-CSE-ConnectionGUID: kWTOttlnRwG/pJD07L+tCw==
X-CSE-MsgGUID: a9uskVWGQ4m/T6972xHGXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45467693"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="45467693"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 04:10:03 -0800
X-CSE-ConnectionGUID: AnrdkIdARNKQQMlmKwutVg==
X-CSE-MsgGUID: qtkrYDfvRjq09d5B6eT5Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="97390912"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 04:10:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 04:10:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 04:10:03 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 04:10:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlJQcbeRvAR4+I5CKuA8ngHhblWBkCHOB4sa2K2AtjOWi/AuwrAyVo4NCV6mmTp89IrSH+PqLn4CCuyQEUzlHhSgtsU+lkXZYAdPMdur5R1BCiHWN6/iSwBGrwPZ6Mnb7VJD4BZsIJgJOxzG1fGeZDY2hdRwjC10At33XHMZ60/33O6IOUT66GZMHbsiztJfIus4mwqBjOWVWgGvb5QQAX1IcunJI8Znq3zZdpkvkqB6jp6HGMJ6Bo1oQvEJSoXdJGIa6FfMRD62/OVpIkU0FNZ9vLnZuJaBM88Zcz3vWeynJqvGz8h6+3TtsRGZXGnqAAOku4jzQY6U3M6fUpYDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CpDWo97gUdLgJgz5pZkva2ESZqMLJyP2sSgOnC5TJRs=;
 b=rVflo8O+Oqm7QIP/nzmYqr6RscI/fmjFjgCux4tpWh0Wx3+8jsKZa/Umz4kHk5UgGQd3zlZUnzWVKoj3zHjhjC4cGE/U0zFd/7YSDlVqAdQer/tID/GoO13M9CI6FE9fd3DNPJsT1nCaRlYYwwBXj5+ljhAkq8qsXUHAEVAOs8IycAtsc2i810AHjVCiEHO4CVuKr7vrwCC8mvFCKUPV+N3OEOS7JTDyn0zT/wCWzlytrganH7eVqPeZ2pD51wErg1iQbtKB+X+ewNPYbiQBEbVXZFE4/nmSZdo+XvjWO9KEZqa80M4UeKy5/wsn6CpqscTj9z8PDHPAWTidY3ZnTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB6614.namprd11.prod.outlook.com (2603:10b6:806:255::11)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 12:10:00 +0000
Received: from SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746]) by SA1PR11MB6614.namprd11.prod.outlook.com
 ([fe80::aa2a:7e7a:494b:3746%6]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 12:10:00 +0000
Message-ID: <f3772951-0fbd-4232-bb27-236ddf35f10b@intel.com>
Date: Tue, 17 Dec 2024 13:09:56 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=C3=A2_Xe=2ECI=2EBAT=3A_failure_for_lib/meson=2Ebui?=
 =?UTF-8?Q?ld=3A_allow_build_IGT_with_link_time_optimization?=
To: <igt-dev@lists.freedesktop.org>, Patchwork
 <patchwork@emeril.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20241216-fix-lto-v1-1-1280b17dc70f@intel.com>
 <173438996962.3469166.1976943736328586496@b555e5b46a47>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173438996962.3469166.1976943736328586496@b555e5b46a47>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To SA1PR11MB6614.namprd11.prod.outlook.com
 (2603:10b6:806:255::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB6614:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: d779ef4f-9243-4dd8-5934-08dd1e93bab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkJHeHZaN2h6anZuNnAwRm9DVGpRcmw1dDJLR2U3dW9vWEpmSTRVR2RtQXpi?=
 =?utf-8?B?RUFqRVZ3bk5jL3FhS0FFVVljc3VaalpIbVlFeE9FOE5rQmZBcXdoWEVIenRr?=
 =?utf-8?B?YzRtRTJqWjIvYkdJQXduSTh2T3cyZFNpSTlsaUxSbWdBajl0OWozcEZFNG5D?=
 =?utf-8?B?c1QrbFozQnR3VGhiRDE1VmR1R1lLZlVDZk5tczdLalJFUHl5Q2lsWmhvZk5H?=
 =?utf-8?B?aEN6UmV3VGs2WUZZM0FxaVVkdGM4dFV3czRuVlpiV1h0MGpDZFJ0RVRUUFFj?=
 =?utf-8?B?d1p0ZVVZcmlYNURvRDJsVjJCK0V0U1ErT1hvK25GbDAyZzJKTGtMc1pVV0pN?=
 =?utf-8?B?SStONEYvV1BGdWNVVThHRzZGR2R4ZWNyTlg1aTJKWUs5cVdWNmNJMHkwbGF2?=
 =?utf-8?B?WGhrUUtmOXIydHIvb0RiTFdwenc1aCthNHhLNFpxRTZHN3N6OEIyaHRXRVl2?=
 =?utf-8?B?UThBOXI4dkFUcW0wS2JaUGt2bnltSUxITmRoYUFFYVJKZFZNRFhLWklNZnRs?=
 =?utf-8?B?Vmx5bHVEMnVFUlpsMmtjVmRXNDg0bVpEKzIxSFlIYW5rY1RmekhmWHZ4cUlH?=
 =?utf-8?B?WTlISU83dW9HOGs3eGFYNVhPKys4djZJMkJDSWNnRTQ1TTFuY0swQUFnU0Fl?=
 =?utf-8?B?SVJpcjFtVVhDK3ArNE8xbHVKRWszMG9nVEhpVStLOUtFOWQ1Z0ltN0QwaVJ3?=
 =?utf-8?B?b3RtMyswTHJjejNDNFF6clRTU1I2L3pvblBmQVFidEljUGFTZmRqTnB4MTZi?=
 =?utf-8?B?ckhOSnB1eHo0L2QrblpsV0ZrZG9VYTIweTBaZklYM0QxNk9wakVDZXIrdVFZ?=
 =?utf-8?B?MHl0RlhUOFBhQURoY1lKbERMUUhJUUZUd1UzL0VHK0Z5elNXOVJaTnJEdTZ2?=
 =?utf-8?B?dmxpWG5ZenpSYllVa1pEdnNpK2xPMVBMVlhRQXRkaFUwZDEwdUpWVE1YTFBK?=
 =?utf-8?B?MCtEUnNpUGJBSThaTkhtZ29hWUpMZFY5M29JY2YwbGJLMjNRRVJJRVg4S25s?=
 =?utf-8?B?MlljRzVndlRBdFYvdURlK3dWODJDVUVpbjVpZXVTMVNTNjc1aEM1b2s5ejV5?=
 =?utf-8?B?VUtCN0N1MWZqVndMeXpxekROZkhmRjFBZWF5L3c4cTF4MmxhOE8zTnN3WTBQ?=
 =?utf-8?B?dkpBLzRFT2NUdXVpWDNraHZsUzlGaFpPQm00cHJtQUcvQXI4N05reWl4SjMr?=
 =?utf-8?B?TzloTFllbTRBdUR1UzB0UVdtK1ZyZmpoekpjNUZibHkyQkJCTU9TV1ZPb0tx?=
 =?utf-8?B?b2ZteVhMalFwQkFUNDJuUm51bDhnQklCYm5XYWltMFFxV3BEdWVwS3lpVzBx?=
 =?utf-8?B?ODYyaHppeWY2RlNjWUlxWFEwL1FCeVpWM3ZiSTlXT25Rdm1iSDBWeUxoUnpa?=
 =?utf-8?B?OWtqLzdORnB3LzR1S0psUllid1AxN0tSbzJKbzZXR21OdVVWRDFmeXg1K1hF?=
 =?utf-8?B?dGtkMFByOUpsaHMzSmZoMjNKSFVqU0N4aStOaUVadWc2Rld5VUk3MHJYQlUw?=
 =?utf-8?B?V01hVHB3WEwyNmNOWGliaXFxeWl4dnBxb3ZpSUlBRUVRUjdmREduSUhBaGk0?=
 =?utf-8?B?cFA2ZVVaSkJFMGQ2emM2Y0NEWXZranhURzlYdUlzMGlMTFdPTzVDL0lxQUJm?=
 =?utf-8?B?MkZoLzY5RTZCcCtKcExEalF1d2czeUVIeGp0WDhMMDBCYXhXVU9QTm1GV0lU?=
 =?utf-8?B?Tlo0M1pHTU1NZlp3dnU3aHBrMmJiRVBXWEsvdnEzWmJadlJ6a3lNYXpjRGFV?=
 =?utf-8?B?a1V0M3ZHaVlQWGJ1amRwdGY4a3c3cWtxSmd1ZXZ6d0VHNUtoNzFIZ2ZxNjgw?=
 =?utf-8?B?MUNnRjc3UC83NmZ0MTFIUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6614.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDNqVEpuNEZ6V0hEWm9MZXFrNkxtOElCSUFFci82T2N6a3c0ZkNGS0tKbW5F?=
 =?utf-8?B?NjdEbXBGT0FuemZGK1Y2VGx3aTJnblFGYkJRa055VXZra3dzNTZqZ0orZTlY?=
 =?utf-8?B?UXVUdWtRc1pML1hPQ1pkMUw2aFJ3NmZrN3oyOGlpdEoxK24vbWxpRUJjYWRx?=
 =?utf-8?B?KzA0UlZrTE1PZEFWWEMwTXFuNC84dS92WFJUZDdvWFJaWnF4TmluSzJRNmdP?=
 =?utf-8?B?WWF1bEpmVlRmUHRsNjZPeUgyVXJXS0dLUHMzYjFPb29seTVCWXlOOUJtODBx?=
 =?utf-8?B?a0lWTjl3eE9RQUxmaGF2dWJhSFNjSXJrdGxUWG1wQktIZHc3UlFrTkxiTXk2?=
 =?utf-8?B?b2Uwdk14NUNJcmFKdlQ3eDJValdFUmxBUHJQSEtOdFlmME9GeG9kZ3JQTVZH?=
 =?utf-8?B?MnlFM1JyMDJFVWdZVmxVRnREKzhyVmVtb3RxL2pKamttWUJ1Z1lia1ZQRXl2?=
 =?utf-8?B?WFN2Q3oxc3Fpb1lRR1V6MXpBc0U0aCtIV2V5RGUxRDRqT3N3L2dPNHRONnJJ?=
 =?utf-8?B?di9LQm9mMnluWjloUytIanJncnlsTlMrRWxEdlpONmh4SnpPMGNTQ2huczhG?=
 =?utf-8?B?RGgyVSsrdTlINFpzd0R0Sm1ZTnZ6WUwrOTFBcUk4VGNYaVFWalljdGp3bitq?=
 =?utf-8?B?NVBSU25RVTBLYTVVRExNQmpaak80TGluaVJaLzZaZGtXdjhnSU81ZzdXMDls?=
 =?utf-8?B?R0NrQUhZU1JPWGczTHZ5enRNVEluWlhZcytKd3pYZEVaSldseDF3cSt3QSs5?=
 =?utf-8?B?N0E0Y3VZL0ZnU0QxOUtkWVpzQnZ6RmhXV0VWeng5TzRRMjlBVFpKUVlXZkVr?=
 =?utf-8?B?eXdVYWRDSDNnR0hKYlZwVDlPNlRZRHF1V3AwL3FlWVR0YTJGT3NQU0RNcjlT?=
 =?utf-8?B?eVVlVFV6RnNHRW5hR1llNFU2dUtONkJ4QVdvSkltZHNVODZtbHhCZTlwSDR0?=
 =?utf-8?B?aWdnOWZOemFRQm15bTczZG5NeVBzUm1SdG1STityd2YrV3o3M1h1MW03TVdV?=
 =?utf-8?B?Z2F3aDVUN2k2UnFySXdibS9nWE5CaXo0bTZMZlFnd0VrQTdwUTQyenVkVndG?=
 =?utf-8?B?MDVsMHpyaGxMUEFGcGRiODc1L3NBdTVBU3JIT1R5c3h5enNnWW9XWStTUW5R?=
 =?utf-8?B?ZU5TVFZCUVJ5S3MwSnE5WjRuZnVxV2V2TDU4anlCbFNtN3BMMEJaUGl2WkVy?=
 =?utf-8?B?aHlab3QxNFY5RlJ2M2V4MkRPRUhRbXJmYm5ONy9GK1YrdnFKZTVJbzhibGF1?=
 =?utf-8?B?TitCcmpEVHgrdlhobFg4dk1pbWgzd0s4czd5eVNFSFVEQ2R5NTZCU0NJRlJk?=
 =?utf-8?B?S3lEWmdsNmVadHpuNlJheGNmWU1RVThLNncvRm8rbS9RNkV0Yk53cWZBRFFK?=
 =?utf-8?B?elBGM01ldE8rYXpuSzdGUFJhZTNRdjA5OU44TzhjZlFFRUdhSlZZNWRtTE0y?=
 =?utf-8?B?cFBaT1VVU3JYckxhK1VkbGxROWpyejV6RkFRamdnS2JCS1VXU0h5Ymc1SFRL?=
 =?utf-8?B?OTY0SlJndDJYYjNyeTZxNjNSQjJ6THZpU2VJR0RBVHUzaVkyRGxHSzR1T3lS?=
 =?utf-8?B?bFBnNlFtWFM2cjhKSHBoWWVnMElEMDNQcjE1KzNVZnloakVEbnhKbXBhRnZw?=
 =?utf-8?B?SUJmQmJraEswcFI4WjJxV1VqSklyYnJtZlVESXoxUlVuK0dQS2ZOc0kxYlFH?=
 =?utf-8?B?alR5WGpuNHZxeGo5Z2lFaGdvSm5GODVOMUczTmNid2F1Zlc1bCt2a2JMa0Vp?=
 =?utf-8?B?V2QrUUhkeVE4V3pYbGg1NTYrZithbk5xdEc4bTArM3RiaVRxc054dUs0Vk9q?=
 =?utf-8?B?dXU3OWVYZGVYblBpa3haSE9VSXE0R3Z3ZTMxcFAxNVpBc21zR0dmdENFenl1?=
 =?utf-8?B?YXBrQkU5RDhGN2svYmRPQ29IUW11a2ZWblVlWng0UkRrbTdrVW9WaDdaaDdD?=
 =?utf-8?B?NXZDSHlvNzFmRGs3T3c4VXhSbEU2bG0yTCt1Vk9XWUMvMks4UExvMEpHZGRi?=
 =?utf-8?B?MXNUdzR5UGg0TE94Nm9CTUs2TU54WFVPMEFjenFKQVNweWYxRE5FMEE1RzdG?=
 =?utf-8?B?SEtHYmkvRFpma01NaFcwdFBjZE1JZFZQZUhGZlFjUURCc0xRVzhkUVhieXl5?=
 =?utf-8?B?Y3UrQjdOQnV1bTRxRlFpeDcyaHYzQjFZZ1ZLYU8zWjVkUzZJZEhlZXBoM040?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d779ef4f-9243-4dd8-5934-08dd1e93bab4
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6614.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 12:10:00.0347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AcPjoMAVsulvzIw5o5kY+mC3y6apZmAzO2BAEYFGyqROtWF/M6Ib4vvOCkOFBf0YaMzT22nE5aefTXvz4zPJ6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
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

W dniu 16.12.2024 o 23:59, Patchwork pisze:
> *Patch Details*
> *Series:*	lib/meson.build: allow build IGT with link time optimization
> *URL:*	https://patchwork.freedesktop.org/series/142655/ <https:// 
> patchwork.freedesktop.org/series/142655/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/ 
> index.html <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/ 
> index.html>
> 
> 
>   CI Bug Log - changes from XEIGT_8157_BAT -> XEIGTPW_12324_BAT
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with XEIGTPW_12324_BAT absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_12324_BAT, please notify your bug team (I915-ci- 
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (9 -> 9)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_12324_BAT:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@xe_module_load@load:
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_module_load@load.html> -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-dg2-
>         oem2/igt@xe_module_load@load.html>

Here and in another reports, nothing related to the patch.

Regards
Andrzej


> 
> 
>     Known issues
> 
> Here are the changes found in XEIGTPW_12324_BAT that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@core_hotunplug@unbind-rebind:
> 
>       o bat-adlp-7: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html> ->
>         DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12324/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html>
>         (Intel XE#3517 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3517>) +2 other tests dmesg-warn
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-
>         dg2-oem2/igt@core_hotunplug@unbind-rebind.html> (Intel XE#1885
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885>)
>   *
> 
>     igt@fbdev@nullptr:
> 
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@fbdev@nullptr.html> -> SKIP <https://
>         intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-dg2-oem2/
>         igt@fbdev@nullptr.html> (Intel XE#2134 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) +4 other
>         tests skip
>   *
> 
>     igt@kms_addfb_basic@bad-pitch-128:
> 
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-
>         dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html> (Intel XE#2423
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423> /
>         i915#2575 <https://gitlab.freedesktop.org/drm/i915/kernel/-/
>         issues/2575>) +50 other tests skip
>   *
> 
>     igt@kms_flip@basic-flip-vs-dpms@a-edp1:
> 
>       o bat-lnl-1: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html>
>         -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12324/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-
>         edp1.html> (Intel XE#3729 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/3729>) +1 other test dmesg-warn
>   *
> 
>     igt@kms_frontbuffer_tracking@basic:
> 
>       o bat-adlp-7: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html> ->
>         FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-
>         adlp-7/igt@kms_frontbuffer_tracking@basic.html> (Intel XE#1861
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861>)
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html> -
>          > SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/
>         bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html> (Intel
>         XE#2351 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o bat-adlp-7: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html> ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-
>         adlp-7/igt@kms_psr@psr-cursor-plane-move.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +3
>         other tests skip
>   *
> 
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
> 
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/
>         igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-dg2-
>         oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel
>         XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2229> / Intel XE#455 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/455>) +2 other tests skip
>   *
> 
>     igt@xe_prime_self_import@basic-with_fd_dup:
> 
>       o bat-dg2-oem2: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_prime_self_import@basic-
>         with_fd_dup.html> -> SKIP <https://intel-gfx-ci.01.org/tree/
>         intel-xe/IGTPW_12324/bat-dg2-oem2/
>         igt@xe_prime_self_import@basic-with_fd_dup.html> (Intel XE#1130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>) +157
>         other tests skip
> 
> 
>         Possible fixes
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>       o bat-lnl-1: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGT_8157/bat-lnl-1/igt@kms_cursor_legacy@basic-flip-before-
>         cursor-varying-size.html> (Intel XE#3729 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/3729>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-
>         lnl-1/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-
>         size.html>
> 
> 
>         Warnings
> 
>   *
> 
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-
>         legacy.html> (Intel XE#623 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/623>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12324/bat-dg2-oem2/
>         igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_dsc@dsc-basic:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html> (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) ->
>         SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-
>         dg2-oem2/igt@kms_dsc@dsc-basic.html> (Intel XE#2351 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2351>)
>   *
> 
>     igt@kms_force_connector_basic@prune-stale-modes:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-
>         modes.html> (i915#5274 <https://gitlab.freedesktop.org/drm/i915/
>         kernel/-/issues/5274>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12324/bat-dg2-oem2/
>         igt@kms_force_connector_basic@prune-stale-modes.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>)
>   *
> 
>     igt@kms_psr@psr-cursor-plane-move:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html>
>         (Intel XE#2850 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2850> / Intel XE#929 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/929>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12324/bat-dg2-oem2/igt@kms_psr@psr-cursor-
>         plane-move.html> (Intel XE#2351 <https://gitlab.freedesktop.org/
>         drm/xe/kernel/issues/2351>) +2 other tests skip
>   *
> 
>     igt@sriov_basic@enable-vfs-autoprobe-off:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-
>         off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/
>         kernel/issues/1091> / Intel XE#2849 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-dg2-
>         oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel
>         XE#2423 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2423> / i915#2575 <https://gitlab.freedesktop.org/drm/
>         i915/kernel/-/issues/2575>) +1 other test skip
>   *
> 
>     igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-
>         bindexecqueue-userptr.html> (Intel XE#288 <https://
>         gitlab.freedesktop.org/drm/xe/kernel/issues/288>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12324/bat-dg2-
>         oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>) +32 other tests skip
>   *
> 
>     igt@xe_huc_copy@huc_copy:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html> (Intel
>         XE#255 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/255>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12324/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_pat@pat-index-xe2:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html> (Intel
>         XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/977>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12324/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_pat@pat-index-xehpc:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html> (Intel
>         XE#2838 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/2838> / Intel XE#979 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/979>) -> SKIP <https://intel-gfx-ci.01.org/
>         tree/intel-xe/IGTPW_12324/bat-dg2-oem2/igt@xe_pat@pat-index-
>         xehpc.html> (Intel XE#1130 <https://gitlab.freedesktop.org/drm/
>         xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_pat@pat-index-xelpg:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html> (Intel
>         XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/979>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGTPW_12324/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html> (Intel
>         XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130>)
>   *
> 
>     igt@xe_sriov_flr@flr-vf1-clear:
> 
>       o bat-dg2-oem2: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/
>         IGT_8157/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#3342 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/3342>) -> SKIP <https://intel-gfx-ci.01.org/tree/intel-
>         xe/IGTPW_12324/bat-dg2-oem2/igt@xe_sriov_flr@flr-vf1-clear.html>
>         (Intel XE#1130 <https://gitlab.freedesktop.org/drm/xe/kernel/
>         issues/1130>)
> 
> 
>     Build changes
> 
>   * IGT: IGT_8157 -> IGTPW_12324
>   * Linux: xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3 ->
>     xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd
> 
> IGTPW_12324: 17dbc34e9f360d302845e684e109596bc6af23bb @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8157: 48a70f6795e6d68b9fae275261ae3b09d3401fe1 @ https:// 
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2380-63be16e210b1c3e43b43d8ca9b7e17f15142d2c3: 
> 63be16e210b1c3e43b43d8ca9b7e17f15142d2c3
> xe-2386-49cc582754c205bbe43d4ef2b1fd3894bee1f3bd: 
> 49cc582754c205bbe43d4ef2b1fd3894bee1f3bd
> 

