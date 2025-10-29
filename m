Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCE2CCF9E9
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 06:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C21CB10E129;
	Wed, 29 Oct 2025 06:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MuGkWQE2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F290A10E129
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 06:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761719904; x=1793255904;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YoPuNX4M5aYZ0cITpdjuzJeWnEXqzbv1ZLPPtNOMZo0=;
 b=MuGkWQE2CeY4tEQxP+C8MjrXoQRJo2SXcVWHxDQisf9S12CFVpQMBWnF
 pU0MG4N68ZrCp2pLVKb8lW2hoTEn05Woqodg6YX1QDZ1Q0iak66Yyy30I
 ou0Uayi4SIj0JZH/aKKPt27Wj3pdW58rFLKQRFPUSuHFBdeCgzLOHoQ16
 lWxrKFIXw+e54UJ7P3+A3Sagjc2uMoXhVq1D42FW3lv/7jecAJjh5dp8n
 lN+AGigPB4gPzsMtlE3nWcZxseUhfsS9qaixiC11gsEWuRVBTQJ4XMyAt
 pxh5yojoKD64YP19xS83n57//v62zwgf7XcuFlRkT/c1zJePb7/q12krH Q==;
X-CSE-ConnectionGUID: 7FYmodm4QpK+kYcqbLraTg==
X-CSE-MsgGUID: N7tBqf4NQvuBP6NareIjJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81251951"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="81251951"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:38:24 -0700
X-CSE-ConnectionGUID: QsXXw2v3ShCu6BCOjWhG0A==
X-CSE-MsgGUID: TRqERRdmStGbvD750JfUQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185457419"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 23:38:23 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:38:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 23:38:22 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 23:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLmMWLN3wtKBwGH7MBlidtB2YZrrACHmeTcLalkcl2iErf0psi9Mk9JmpoHQ0V/kSc4i0EvgQQ8nyO7GF4YKnGwh1oSXnuehsWjPtB1jXp6xKUcTudSW6b8eOTNJGhPdI0GteTOjT6KiJgmv07NH+zZcdxu7mNtxK5x0qQZUDZ5HytcRvZRJhkMlEXmSKUfyfNB+cUGyn8QGOzIsxFjICn9r3544acUT3xEPiClDRhcok/19k/0M6p8RDHVue/vfPYslivXXsrolmVsx7vLGqBWavbhv86X+SHFO1GuTieX8hmcZGHncPOwojFPL1tDb9jDWLHWFUzbijqWnK9u9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuwCMXOtidvXEVPOX/pnaM0acURU7zPt9/P60kIXmvo=;
 b=CZbjOnSprge1OyXeih7prEHfSa/C3W9a+MaN3yrMo29HWuzb/Dxb9WJdCQpEMtuIF6gQ7Gq+iNGy7B0CcjUF/KaiZyBo/xCv+JOESa3BHlGXs2ElROXzFXdY+ju/DymjAt1mXz+oax2tmAtJi1VZRL4FcUIS38Tr0QhecLjJsfVAbc3IkRhqUb5KWpZ7RepsQq88/crP/79KLaqG8kLCg3h7OvXMveWqoRBV1oCQyyXx5OjFJq1ki7+McjspoooEw7ktNB0LN7E41RFPROZFA64eSnM50tnP7qh2CMtQab1PW/q155R3XkeYwG+Om0Wmb8bcxB351xZaddEtSHBLnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 06:38:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%6]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 06:38:18 +0000
Message-ID: <b8e2eb44-8304-4479-8ff1-dace9c868ff4@intel.com>
Date: Wed, 29 Oct 2025 12:08:12 +0530
User-Agent: Mozilla Thunderbird
From: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: Re: [PATCH v1 1/4] tests/kms_vrr: Correct TEST_LINK_OFF flag handling
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ramanaidu.naladala@intel.com>
References: <20251028084354.2682743-1-mitulkumar.ajitkumar.golani@intel.com>
 <20251028084354.2682743-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Language: en-US
In-Reply-To: <20251028084354.2682743-2-mitulkumar.ajitkumar.golani@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: c597ab8e-1ffe-4c69-9e19-08de16b5bef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZU4va0c4QjlFOUhEVHBHYVJLR1hVS2o5eEUxYjlDdGpRUzBVVzZUK2UxWnpX?=
 =?utf-8?B?OVRPdCtZTEM1cWp4YjlHRDlVSG5aeFJwRllkRG56cW9HUXBOM0NxSXh5NTZw?=
 =?utf-8?B?RzFRQTNGYlg1Sm1iZEJSYm5GK3BMKzZqaE0yS1JsTStrTHVmTjdNOEFPYXlV?=
 =?utf-8?B?QTR5NWNWOHlSRXBlak12VWNHZ1AzcXJlWURiRXlKR0hwenpHczU5L0VQdm1k?=
 =?utf-8?B?bmt3YU9YL1ZITndvRDVaSU9adEd3M0NTT1NQMlUxRjV1MGhsUTNFZnphTlhE?=
 =?utf-8?B?RTk4cVpaa2VlQWp0aFV4dGpuZld3UEVFbHpyVVFzL2N0TVRZcURwci9SbCtE?=
 =?utf-8?B?SVoxUXFYOXN0Um8wWDJjSTRoWklMWEc3NUoxeEwybDVvbUhWeHAwMG1MTHd5?=
 =?utf-8?B?TThIekZwUXY5OHpIcFAvVDNEVTRDTjk4UDNvakVsbUo5UERtdXoyREErcGVL?=
 =?utf-8?B?cTJ1anU3Mk5JS3l5aS9CWUJVN25XeGE4QmFyZmRsbG5ncmNrd1VnQ2xJenFk?=
 =?utf-8?B?ZmZ5NUxGc3FteCtmSGk4VUhVVkpVcGEvMGVaM2NEY1d2Uk5rVFU4TFprN1J6?=
 =?utf-8?B?MjZhUGxzSmJpRUJmN0IyZXJueGFsZGROZFBPbVZGZkxzeEN5TW5ZbDl2ODZu?=
 =?utf-8?B?MVIvakJNRmMxajJzVE42eW1CeUpoV1RPeEs1RzkwclgwN0h1em9tMElIRmph?=
 =?utf-8?B?RTJoVVpmOFd1b3dwdzMvMGMzVWJ1YlZ3Tzh3bzAvVlYrcnRzSlMyQ3U0T1FW?=
 =?utf-8?B?NURYZGlJOVUxK2VtYjcvL2tDclVYb0NFUUluaHF4L0Q0OEZaQlY3N0MrTElx?=
 =?utf-8?B?SVlGNHpNMUdKZzdKenE2bUlFOXlnYmNyaFJWWkdEQ3JsWFNYVWdJNzVndkxQ?=
 =?utf-8?B?RVdtQmJWVlJUZVN3LzJ6dytBRmh0aTQ5SmRoSGNmbzRpczJSdXc3S281NERP?=
 =?utf-8?B?UjIzZlhhM01qaDJBemhTc0s2Y0IzcEk5WXlCNUNZN1VHM2FCbDVUS0ZoV2R4?=
 =?utf-8?B?T0ZYeHpzRnI0TnZXRmR4V05qSmc3UlVXRW93LzhSK3VRd3JsWko4QSswMkNZ?=
 =?utf-8?B?OFhqV1poem1weHJyZ3g0UGlsaTU1aFlCM0laQ3pTMUNRemp3cmFncWdIVmF2?=
 =?utf-8?B?VjZ5YTREalcwbmFzMDY0NDlQNjZFNnB0OEpZenJsZG1XYzRjaDYxaCthYkxZ?=
 =?utf-8?B?ZGxDalQwcjdJaVEvSkl0cUwzK3crVEVPNUpNS2dvY1ZxUFVSWHFGeUZZZWpB?=
 =?utf-8?B?NUJVdnJ4d1ppZ1ZCM29jN3lxMWN0bmJyQ1RxMENRK0dvUy9pZlppWk9Ta3hS?=
 =?utf-8?B?cWlsdEtXOC90eGZVeUVmUkxDVisxRjJ5d0cyM0gvVlNyMENnZ3Mrc01RK2V2?=
 =?utf-8?B?a3Nqa3pOK1lWcU1rMUtGL1p4RnRsMTJMaGdjUlE4U1d3ZFdBTHhhNjFMS0p5?=
 =?utf-8?B?VVZ3a0VTVzBXWVA2STRDMGpOUHF5bVNYNGdRdUFTTTFnamJ6Uk90V0traklt?=
 =?utf-8?B?V0NmWUd4bklQSXNuOHo2REFQVjlBSG9PenZVbkd2U0NJRUdqbE0vbWNEZlFj?=
 =?utf-8?B?dDdjUzdTbkNuTUtWQkI0Ynk2Y0Uwd0JTVCtmTE1wS3A4bmIzcUFOQ09vZHhw?=
 =?utf-8?B?T2RBbHFIL2w5OFhXRlp6NHJpUXJ3amZqTVV3NkRpWVk5M1kyU2hlajZIUW9N?=
 =?utf-8?B?VkNLK1B6ZGFHT3NaWlZYdVYvS2QzVnBRZlZEbTlpSmZZeFJDLzgxa1lxQU90?=
 =?utf-8?B?dFJObEl2V25mOE5xa3NOeEVxQTk3QVduZm5NUU93Q2MwdFVPZ3dwMWpXdEZq?=
 =?utf-8?B?alpXUDhUTWxhai9EaEdKR09LcWRRWTcxVUZDZWlFMDNFVWF3NUYxellMZ1Rm?=
 =?utf-8?B?N2ZqcDZSOENYb1pqOThnQ3VUQmdxekU5ZEJkWDlZM2U0RmF1Z1NzRlFwSVVX?=
 =?utf-8?Q?DJkT6rgYV4FBiYSLR7Clnx/OBWZCPfyL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MldhdVhBL0xGOXpVQXliTWlDYVpxVHdUamc4MW1PdTFNSGRKelJscWVZYzE5?=
 =?utf-8?B?VjNuNXhhdkcvcGRUOGdSUmxKVWwvZDhKSUZaRWVYRFl1a01ZM2xsa1dpL1V6?=
 =?utf-8?B?OW5xSDd0WkEwRE40SjNteHVlb1NVVmFLeUdGK2REL3FVU0taTFh3ZktnNUFB?=
 =?utf-8?B?V1JoUDV4VnZqRmxNR0VZeE5jTThsbUhvNFlKMGVMZnFaQTJCa3ZNSVJSNzYx?=
 =?utf-8?B?YUdsd1ZQcmx2clk0MlI0Z3JRak5yRVA5MjBGOHBuQ3dsQ0ttNE04YVpmYWlR?=
 =?utf-8?B?a0tHZUhLZVNsYk9FRWFHdzk1UUt4Y3dNV1BtNGQzZGU4RjRNeGorN1QvMzNx?=
 =?utf-8?B?ci9ac3dCZ1hrWGxNWXFBVjdDU3NOeUtQRXBFQjlrL1p0cm05eHFpeVRKZE45?=
 =?utf-8?B?YkdhcEZkclJrTFM2WFc5M2ZhWlNrdWhjZXhVT3VZc1owY1B2UlVEb21QSHF4?=
 =?utf-8?B?ZTRxNzUxeW9ueDR4cGQ2VUdIQzhJTVpmMzFvek5FM2lHUW1OTlBkTkt5ajh1?=
 =?utf-8?B?S1R6T2xwZXVra05PK2ZPUGc2Tk5vbXdZVExrbWtqT2trTnBtK2dMM1dwaXpI?=
 =?utf-8?B?aVVpL0pIUWlBRFJkMkFGQ0dwMkw2Rms1VnVlR2xCZlp5SERRYlp2NU1waG02?=
 =?utf-8?B?MTdLL0lSMmN0NU5GNGVmSldhYlhkeXNCNFBtaU9yN1VlRnZwbHh5VjArZlNw?=
 =?utf-8?B?R1VZQU10RE56Zkp2MWtTTXRuamlkeEd0QlNMMERFR2R2Nm0zYzNMcmVEN0pC?=
 =?utf-8?B?TFRJK3F5c0NYTUZEMUxWWVRuQ3lJSWhXcm9OQXhVazZacFl6eVljUzNrSDVS?=
 =?utf-8?B?V0JVT0VqbnZxenNrN0h1ckdjakhXNVJzT1oxcmRTcUU1aTh3SktaeGg3b2Ir?=
 =?utf-8?B?N1k5TTVTaStOeFdoRGdjTTFLSUlRZlZuazNkVHBpUCtNNkVGc0xLM0F4OEgr?=
 =?utf-8?B?bGdRbXU2eFRsbUZvL1QzWEtuNjZ1ZHhOWXBRMGZ6TTJHZ1Y2d05qQnA0M3Uz?=
 =?utf-8?B?WE5HdkZyNjZQNExrTEw5SndkWjlYWCtvZVJhUUtDV3Nwa0MwWk4rMklicVZL?=
 =?utf-8?B?eUJTUlY4ZGtrV2FGakNMOHRpeUhXMXFWN0FKSkFMMnh1NnpmLzlIWFF5eGRM?=
 =?utf-8?B?SEM2RlEvc2phUDNDRXZYRlAwUmdXYTRhTlBudE42TDB6YzdJRHFaeUVvNGNI?=
 =?utf-8?B?Z1h4bzJ2akxDMzRkeGpvZ2xqdnRnaUlrSXBxNlVaRkZwL3NSKzkrL2FiYnhQ?=
 =?utf-8?B?V1VKc1RKYlkvYzVmR1NoQTdsSHBEejRiWkNlNWlwQ0FTWWprM3FQNVppd3ZV?=
 =?utf-8?B?TDF4RzFQL3JqSmdHaXZtaHdKeWthQjBsREY4bUtBYXg0R1gyNVNYRjN3bzRD?=
 =?utf-8?B?K3FKcDMreG1oSWNycVdqRU84VEhPMnBKdzZPemdsU2pvek0rT3pvY1VwN1Iw?=
 =?utf-8?B?N2NCSHJKMzZmanhtOUxHQXVPVDZwOFM0UFJNZzNyR2ZiMkdOSStpVVlsMk80?=
 =?utf-8?B?OWFWRUtnbDhaVkVTbjlhMCtnR29ydjRSeEhWMG5ZZmFra3Q2WFJodVpKMlhs?=
 =?utf-8?B?ZXg3OG1UTzhrWGpVVzVkc3NrN3RGeEVOUE56clprYnZZMEFXMmtmUWwzeDZO?=
 =?utf-8?B?ZGJjaWlKWUZFQk5ZQjRxbzdldlF0bFQ1N3paZ1NCYWo4dlViNE1GN3dlaVM2?=
 =?utf-8?B?T0FWUG9McnV4NVFSVEQwTmNBVmZqUy9NUXphUTFYcFpkN0x5T29Ob0hTeDl1?=
 =?utf-8?B?T3Y3WUtob2lWSEJiQ0xMUHFjeUJra0w0bFRud2l3cisxbXYxM0dDdDI1UXJw?=
 =?utf-8?B?R0tUa25mckJ5Q0N1MzBJSGQveU9HMnFCREh5UWh4VkFKSGViQ2NKQ0hjRk9Y?=
 =?utf-8?B?VHZ3Q0RnYXE2UGtBV3hmSExWeldLTTRyZlR6WVZCRmdoak9qTDZ1MEYxaG9N?=
 =?utf-8?B?RnRYUmExY0tzSjdkMkg1djFxdDNBU043ZmJETk8zZ0lvSll6RWJ6MWRsUXZT?=
 =?utf-8?B?SHVDWW0va3ZlNXhHZ3NkelpwTlhvcVMwVHpiazc0aDZBZ0dRR01Tck95L0xv?=
 =?utf-8?B?SUNrTWNRM0kxNUtMZTVmVFBmZTFOL0NMKy9IcjhOU3BXU2Q5MzFCY0xiM0Zu?=
 =?utf-8?B?aEkwdDVXNmlKWmZ0SHRQd1Ntb2RaWW9KbElBL0pqU2ZqNlRaRDI2WFVBV1Vs?=
 =?utf-8?B?b2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c597ab8e-1ffe-4c69-9e19-08de16b5bef9
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 06:38:18.5388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usAcE/uZ6n1BSx0kpzssl3WnjsEZquOzR7P6JJrLKsrD+QtGYN8FFNW9ZPHu1g4f/ygQlbTG2HuuWwppk2F8FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
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

Hi Mitul,

On 28-10-2025 02:13 pm, Mitul Golani wrote:
> Need to correct handling of TEST_LINK_OFF bit added in
> data->flag while executing flip_and_measure.
Use imperative tone in commit message. Something like "Fix handling.."
Also, subject can be modified to "Fix TEST_LINK_OFF flag handling"

Apart from these trivial changes, patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>
> Fixes: 67333a629385 ("tests/kms_vrr: Reduce unnecessary logging in specific test cases")
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>   tests/kms_vrr.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 1d9e579b0..8347a3e00 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -513,7 +513,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   
>   		calculate_tolerance(&threshold_hi[i], &threshold_lo[i], exp_rate_ns);
>   
> -		if (data->flag != TEST_LINK_OFF)
> +		if (!(data->flag & TEST_LINK_OFF))
>   			igt_info("Requested rate[%d]: %" PRIu64 " ns (%.2f Hz), Expected rate between: %" PRIu64 " ns (%.2f Hz) to %" PRIu64 " ns (%.2f Hz)\n",
>   				 i, rates_ns[i], (float)NSECS_PER_SEC / rates_ns[i],
>   				 threshold_hi[i], (float)NSECS_PER_SEC / threshold_hi[i],
> @@ -583,7 +583,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
>   		while (get_time_ns() < target_ns - 10);
>   	}
>   
> -	if (data->flag != TEST_LINK_OFF) {
> +	if (!(data->flag & TEST_LINK_OFF)) {
>   		igt_info("Completed %u flips, %u were in threshold for [", total_flip, total_pass);
>   
>   		for (int i = 0; i < num_rates; ++i) {

