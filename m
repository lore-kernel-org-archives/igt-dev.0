Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1789CCA471
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 11:37:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28CE10E30C;
	Mon,  6 Oct 2025 11:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jhc5TQ/0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8892710E30C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 11:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759750679; x=1791286679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MzM6+dUrKKS7x713X2RaE6i3LEtEmXH4MblA3ylV8/c=;
 b=Jhc5TQ/0ZPbWggSohL7HtulBLCPbV/AVyj49ZztGM/Gnr/8CYYY83ZbV
 5RtSmr5E/is/2VRMd8ft+fJVbJShbxr6UEq7v1PNU7SAssWCRYTLOGYMe
 YDnVFSD2zYdBWWYxITXN5OL/Q6fwj4KCyoCsizLpt0vIx72fyLDHY+FGb
 DdhKjrmCx9Q0KuDA0mvrMDZEw7XzA2JFnUoQZgX4hB3FLmTxK3OU6UGgL
 Qmc65qRz0QQq3P7yR8VVNoXqkpBqxCTJzQ8wcheS2kA794ht8nKsCGnSd
 5W8ku41vxqkK1GIYBaK9lk8X7dP3z2cWZyRujaf6m7mm0JPdr1eEvtEjo Q==;
X-CSE-ConnectionGUID: snW4a91NR0m3mF3Zh87ABg==
X-CSE-MsgGUID: FVGkTbRFT5eVn5kc6j9+Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="62089835"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="62089835"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:37:59 -0700
X-CSE-ConnectionGUID: 2KUaaI81TeuhL4o4HHFPwg==
X-CSE-MsgGUID: lddWtt0BTO6CBM2mSRQqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="184141182"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 04:37:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 04:37:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 6 Oct 2025 04:37:57 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 6 Oct 2025 04:37:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAxtY+kImd6T0LzGrqI2ZjRMa63/kikqDGXEDPl+a70RWdkh9y1CdkpEqldcsP853QX+A4g4407SvRgebnA1ht5Qz4YV8ULjQ1ARjZfG7zJyV081faLpG+DIP807V9Ic3DIutzodQO6+aLro90H+XKBleozYspNFtAeflSIgFNEDsOp6MN9FKH4YUYwLjhnm1xbsE/psEWGaLQOGWI0a7BPhlN2QkazE6vNUi8IZLPrCfrK+ulTewACE1cw2fuO7HQYOkECVC5jBHKXgG9aweJOIUWW2uhoiM+HB5Sj55fxCAYAjrvbkZuaT1Nc9jTAKw017n+4ge9Kg92XCAanzZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak5jeCgPXMRhS58EkAR1kYtElf6Xe5CaODur9F8P6+w=;
 b=uV98Xn7StayEW7tXObpjT6vz0xHMWBkRTqdIhcZ1r4ttMHw66dShRIgSpdTeuTfavYXZeJhMtfxjhlbAx9BV9y0DG3MS7BMqHPr8UjQbx3Xm+BMPcQMaJud1RURChQOg6gCsj6LwFJkbMpbXyqWb/s9URQIsuFS4bnjAH9ktVoK5zkWdmgKsG4RSSQMV7bZpSrcSHatz806IONSmS1DRBu9gVoj2G4oJDUe8undNcSjKRO2Xe3H1tUCRYeXk4XkZ5Y9i1X8mbdXQfA2uoZzvmQQCpCXnQOl0ynW9eJ0sOflZF54kaLYzqL4Sd4012bB6SUA7ZKJa0e3GMZ4DPUqAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by IA4PR11MB9012.namprd11.prod.outlook.com (2603:10b6:208:56d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Mon, 6 Oct
 2025 11:37:54 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 11:37:54 +0000
Message-ID: <88f543fa-22c0-46ac-a8fe-bc50fb234f4e@intel.com>
Date: Mon, 6 Oct 2025 17:07:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] tests/intel/xe_exec_reset: Add
 long-spin-comp-reuse-many-preempt-threads
To: Matthew Brost <matthew.brost@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250923211333.766147-1-matthew.brost@intel.com>
 <20250923211333.766147-6-matthew.brost@intel.com>
 <521cc99c-a53b-485e-a688-71ca9b90a54b@intel.com>
 <aOOJHMN8L0VJIh4K@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <aOOJHMN8L0VJIh4K@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::20) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|IA4PR11MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: d81dda19-390d-4fdb-ceb9-08de04ccc9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzJaa2Exd2ExV2IxQTFFV2xlK1E3OVBBS3ZqcXg2OTRJVytxWmJxeXpiS0pY?=
 =?utf-8?B?MUEzN0dHNXBrR2ViV2ZVU1ZNNDZuWFJ6aG4xS2VqbUdMN1NETjRlRUZicjdT?=
 =?utf-8?B?a1BaVm1vSjJObVBIekV5VWFTNk9uallWU1RINjRkaXBqdlJsWEtIU3JLOEhO?=
 =?utf-8?B?b2I4d1kyYUc1WWpCRUJuckFXV245OVBDQzBCMEJRRTFOY3NFYmRhVityeGFm?=
 =?utf-8?B?WEdTYnhGbDB4bkE0SmhUTEEyVkVPSVhkQ25yVEdPeklyVFg3ZWcrQ3lweTVV?=
 =?utf-8?B?WTZGMWk3dkVaN2ZrYVlKbDFUR2xyUGpYaVVVcUJlVHpoVHdwRDJ4UDdacWVT?=
 =?utf-8?B?cG9qSldXWmIvVTU1S0Q4dVRyazJRT09WZ0NmMnhsUWZjNkQ2RDBpSW5RU0kv?=
 =?utf-8?B?eFVTSnVhNDhQYXNnV2pXbWZGRWRBMDFBK25vMC91MkhoQVorWW9icUJDOTdW?=
 =?utf-8?B?UUFnQlZNZE1ySzJrYmNHOHhkMkNoMXVPOUlUdnRYTHQybkR2Z3lPYUpnalg2?=
 =?utf-8?B?MGc2Ykppd24xbVJyK2hWWU1DazNlaExQM0w5TDVrdFRDQnYwakFsRGZKMnZO?=
 =?utf-8?B?NXJkYUVNVEJ2SGxJdjlETGhZUngxVThBQlo0WVp2WDBycS9PZG1OWW1oWUR0?=
 =?utf-8?B?STBwbVhqaDF0Nk9TUVd5YldCQWEwbnRYejMwSHlmNHEyL3NOMHBHVVh5eEFw?=
 =?utf-8?B?MnIya3dQblJkdE01ZFY1YXlkb3ZyUmdzOEtRL1g5bEpmZ1Q3bFlOMUhqVml6?=
 =?utf-8?B?bGQwUU41Zzh6YTRMT0Y1bXA2MW5MUEFaQnNUWHdoYW1LTGtveHF3SVFQWllF?=
 =?utf-8?B?ZFMvTnh3cW1aWmNmWE5PTlhqTFdleEJja1NtNU84T1pMMmg5VEZXYmRFMndF?=
 =?utf-8?B?NDRLUDN1UWJGQUMyZ044UjBSRzB0NS9nTVFkbEI2Z0NKVVVNOXpYbkNyTWlU?=
 =?utf-8?B?cmtrWEJYVGZtM3pla3JOTGFVMUFac1Z1U0pHSzN6S2V4aW91RTlMaEJXRHVW?=
 =?utf-8?B?ZFBIRDhMM2d6a2NyU1RWaUtYbVJZRVZmdEVrQXNyLzJFM3pTNDc2UWVnTkNx?=
 =?utf-8?B?c0hheXIyNk41VVQxejdseUtZMnV3cnpOSmh4bWhwd0JNeTVlS3IvQzdIdHpi?=
 =?utf-8?B?Q1hZNHBOZlE4UlpSTkdnWWpocENiaTNGZEZFY05xZys2L2h2L0ZqVDYyNTZM?=
 =?utf-8?B?YXJ4bjd4NG9Zck03Q3U5Snd0UDRaQmxMMDlQOTBBTE81eGYxMXlqbVJVcUsz?=
 =?utf-8?B?RzZ6M2VwS0lzRXVXRFlaakRDZVZ2d1M1ZjB2a21QTTFMaDl6TTRmQW5rb2JI?=
 =?utf-8?B?Yjh4QkhHZnc2RFlyK2V4eHFRNFdQK2pWMGVISGo3dm1WMHFmSzB1MzJWd05q?=
 =?utf-8?B?TTlRMzJyQXl6eHRpYzRxUlU1dDNydEdZd3VpOXQ3bjdKdWhCMDE1MC9tMDZC?=
 =?utf-8?B?UkVSZXQ5SmVkaUkvY093VmdrMFVZN2c5bEhmUWYwNWNQem1lME5TeXpHMGpX?=
 =?utf-8?B?OHk3ZVR4dmlZci9BQUFzRkFRbmE5UXAwNGhNMDNMaTZFa1hpbElRbmFVQ0Qr?=
 =?utf-8?B?V2lpUktHL3k0c2xSQlY4TmNBVG1kL0hNLzRpU1hLeFRIdzY2SUtNZDQwOEdK?=
 =?utf-8?B?bkk1TEdKSG9QK2p0Y2xJUWU3S2llTytrZW0zVWtTR21ObllXaE5OWDJJdGJx?=
 =?utf-8?B?VG13ejlQZVBhcFQrMDRXR3duZWhlUnN3aDhNbWZaNmtJdTV3WEtDclNrL0hj?=
 =?utf-8?B?cXQwWjdYRXF0WkRQZFVHbUlxMFFzTDFJa2gwTXRsVFBCNFF3bEpGN2V4bU8v?=
 =?utf-8?B?M2UrYS90T1lTSEpLRngxRHcxRTFGUTVHbktIeko3TUVyMXh5N05TNncvWGc5?=
 =?utf-8?B?cG5mM1RHcitiLzJGaGRHNHVoN0RRdEpkem5wZVJKK0RwQldNSDRHM0NkQjlT?=
 =?utf-8?Q?ujdTvEC03nPjusTkMdY8klD7hvjMiDT2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3VMWTVjYk9YdTBMUURRODAzd3VZMmVtQ1phNUdvT1djQ014WUg1ZThiTHJR?=
 =?utf-8?B?dDB1R0xCNGJPdDJPbkd2cUM3UlFqdXVaYnpDOTFEK01VRkcrNlg0TnM3YVVL?=
 =?utf-8?B?dHp0ajBEc0hBcWEyaGl6TVhLMW9kTlE2dlJkZ1ZYNGFPeU9XMUlrd3F0WEx4?=
 =?utf-8?B?UHFacFdleTR0SDRvdEZYRWVRbHdXWTdwZzVDVzd2eTlVNWpHK2VEOW5tbWFr?=
 =?utf-8?B?VDZSeWJaMmVhR3RNM2cyL2VIT3U3UTN5YlVZMlF4YnZObFkrMkxTTVkzTW9U?=
 =?utf-8?B?dTNyajV4ZGlQSWt2RFp3YXNIaUc4OHdyZUZpY0N0RzZBZzFSSG5SaHRiQUhE?=
 =?utf-8?B?RlBkczdmWHc3dytoOUhpSHJkU0U2K2t4Nlo1SDN3VzNvTUlISWZ0YXRLc2xD?=
 =?utf-8?B?amRBbzNEdXpqZnA4Z2JWb211cGRHbWZTb1ZnQW9mQnUvRW5seGVkNnJZaUZk?=
 =?utf-8?B?d2RZYUtPMU9hMzRnWjhIYjJFVVQwYzkvdVFiQjBTbVlDbXlCOU5JQ0tSWGd6?=
 =?utf-8?B?bTRpOWRqS1FUOG1pNnl0TFFzVURrMGd1NUt2TFN0Q3U4bTBhVE1lUmdXMklJ?=
 =?utf-8?B?M1Q0aHZmNFNYbXlteUxSbklUbmFsRHg3NFRiUDFDb3k4N2R3SU1VUkZLNFNs?=
 =?utf-8?B?Q0pvbHhTdnZqVmZ5N1F4dVg3ZDB5bFBuWUp4a0VUbXE4eEdZVkhCanFNUnBm?=
 =?utf-8?B?NklVaVdzTFlGeHB6TDBlUmFFSzBHaWdFYk5SWldubHp4YjY5dnQ3UzU5Ukg0?=
 =?utf-8?B?TXhnTmx4dmpQWHIyZkhNanF1b1MySm13ZnYvREJ4SEtPN0UxTEg5MW5FbkdH?=
 =?utf-8?B?b0xhQmhJdHp3U2huTW16a2htRldiZ2pnS2FYMHo0enVHNXdlWmdHVUkzTUw1?=
 =?utf-8?B?SHdodm5mOXh5VTlhbGZPREYyQkJWS2l4S1dZN3dnR3haWlkxUi9JN3JHMnQ4?=
 =?utf-8?B?a3BqZDlGSG1CUzZxQXpSSnRxaXYyVCsrdW8vQ3dUdlZ6cWRwY05CaVM2MzRl?=
 =?utf-8?B?dVBuQWFZcythMUowOXh2OTl6R2VXMUdWQW82QVZxZks5Sm5JZU5XZlN5U3hZ?=
 =?utf-8?B?TUg5cTZFRXpuclhSNndDWkQxeFNsNHpYZ2JDTlpURW96UzBTdGRuRWo4LzJv?=
 =?utf-8?B?VDhNUnc0R2MzcFp0SG5SeFhUMnRJenhxcER3d0NvdE9FREVZZFRkZFl2Ukln?=
 =?utf-8?B?djNrcHlYTEFTM2pjSDlSdHhrQ2ZMZUpZUDQrbm5FY1cwLzAvRkV3U2ovY3I2?=
 =?utf-8?B?ZHREdUVUTC9PdU9DbmZ2Zi82TUw0aXNCSERUaE1IQ2FrSXRkVXEyL2tQM3d1?=
 =?utf-8?B?QklRUk5DYktPbjk5Zi9zWmpESFVlbjZMOHMraHV3V080SGtwZno2ekdTRVh1?=
 =?utf-8?B?K3MrcUZ3U20xUkt2d2FzQkNtU0pWOWxIZHhTbTZUelBFaEtiSk1GSElEWjhL?=
 =?utf-8?B?Zk9WY25wWmZUMG5LaVBHeXdUNnZBUmhSVGxCMDBrSFV2NldHSEFxQUVMdC82?=
 =?utf-8?B?MWtkNWU0T2o5QTV5RG82UWVIYXpzMWJ5eklVT0h3dzArcm1VZlRKYTRpNlhW?=
 =?utf-8?B?VUVoSXJNdEFodkpkR2FUSHFMZ216TG5oZzlVM0JqQTJZaTZ2NHcvejd3UzV6?=
 =?utf-8?B?TEpQYkV5d2grMWdUVXBESWU1dHNLditIN2dRQXdxS1dyTDA3S3FtOG44Y3Jq?=
 =?utf-8?B?ZU5ORDZ5ZWxrdWg4N0dxclJVR1BSYTNJVWRuTTdRZGp4RlVNTkY1YlgxUllK?=
 =?utf-8?B?clp5WERIbTNMS2V5R1ZxOW0wMllUdnlUS2dRRmFadGRLd0N4R2tlZEpESFNa?=
 =?utf-8?B?VlBIUE5qbzZWZWtzNFRNdHVVclVlVWozend5UjF6WGZuQ0ZPK1ZZd2ZRTlQy?=
 =?utf-8?B?QmJjNWdZSmE5RE9EeFJnWjdxRVZubXpld2NVVDJoZjdmdTNlWVlQZmc0THkr?=
 =?utf-8?B?amYvbXM0L3cvcGpRTzlXQVQvaThEcTNIZmRZT0pnWWYwS1lqaU1zdW43b0Vk?=
 =?utf-8?B?ODBiWUlmd3d1eEVhcHFQbkF5eFRnWkVrY1RkWGxUQU5wOGludzR1VW9teFlI?=
 =?utf-8?B?aEliTmxVMkpLRnBpcVlKM080S09xbysyWmpwVFZQcTFUVHNhOHkvTnc4em8r?=
 =?utf-8?B?TkR0SzZ2N1NJc0lVUEg0UytHZkVEZEZ0M2VaMCs1Rlk4amVZOFRYNlZ3WnBG?=
 =?utf-8?Q?JqOzbe00mYwOcj/g1oh7l7Y=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d81dda19-390d-4fdb-ceb9-08de04ccc9e1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 11:37:54.5745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xBdkUo/zEmq1+9AkVUyVt0IY4uLH7BkHdjDDwWsLuGdMAbdaH35+3VFsVmD7kOByLIRnlHMnBsjni/YVXqFyocDi4ERD0q4RtdeeQ23DKls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9012
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



On 06-10-2025 14:47, Matthew Brost wrote:
> On Wed, Oct 01, 2025 at 05:16:19PM +0530, K V P, Satyanarayana wrote:
>>
>>
>> On 24-09-2025 02:43, Matthew Brost wrote:
>>> Add long-spin-comp-reuse-many-preempt-threads which verifies compressed
>>> memory can be used during this test. Useful to test VF migration.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    lib/xe/xe_legacy.c          | 38 +++++++++++++++++++++++++++++--------
>>>    tests/intel/xe_exec_reset.c |  8 ++++++++
>>>    2 files changed, 38 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
>>> index cb53a8cfc8..74432a4b3a 100644
>>> --- a/lib/xe/xe_legacy.c
>>> +++ b/lib/xe/xe_legacy.c
>>> @@ -9,9 +9,11 @@
>>>    #include "xe/xe_ioctl.h"
>>>    #include "xe/xe_legacy.h"
>>>    #include "xe/xe_spin.h"
>>> +#include "intel_pat.h"
>>>    /* Batch buffer element count, in number of dwords(u32) */
>>>    #define BATCH_DW_COUNT			16
>>> +#define COMPRESSION			(0x1 << 13)
>>>    #define SYSTEM				(0x1 << 12)
>>>    #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>>>    #define LONG_SPIN			(0x1 << 8)
>>> @@ -72,6 +74,9 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
>>> +	if (flags & COMPRESSION)
>>> +		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
>>> +
>>>    	if (flags & CLOSE_FD)
>>>    		fd = drm_open_driver(DRIVER_XE);
>>> @@ -79,11 +84,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	bo_size = sizeof(*data) * (n_execs + extra_execs);
>>>    	bo_size = xe_bb_size(fd, bo_size);
>>> -	bo = xe_bo_create(fd, vm, bo_size,
>>> -			  flags & SYSTEM ?
>>> -			  system_memory(fd) :
>>> -			  vram_if_possible(fd, eci->gt_id),
>>> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +	if (flags & COMPRESSION) {
>>> +		bo = xe_bo_create_caching(fd, vm, bo_size,
>>> +					  flags & SYSTEM ?
>>> +					  system_memory(fd) :
>>> +					  vram_if_possible(fd, eci->gt_id),
>>> +					  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> This limits BO creation for VRAM right. So, the compression case will not
>> work for IGPU?
> 
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM gets squashed in
> ___xe_bo_create if placement is system:
> 
> 382         /*
> 383          * In case vram_if_possible returned system_memory,
> 384          * visible VRAM cannot be requested through flags
> 385          */
> 386         if (!vram_selected(fd, placement))
> 387                 create.flags &= ~DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
> 
> So this test works on dGPU and iGPU. I've verfied this test on BMG /
> PTL.
> 
> Matt
> 
>> -Satya.> +					  DRM_XE_GEM_CPU_CACHING_WC);
>>> +	} else {
>>> +		bo = xe_bo_create(fd, vm, bo_size,
>>> +				  flags & SYSTEM ?
>>> +				  system_memory(fd) :
>>> +				  vram_if_possible(fd, eci->gt_id),
>>> +				  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +	}
>>>    	data = xe_bo_map(fd, bo, bo_size);
>>>    	for (i = 0; i < n_exec_queues; i++) {
>>> @@ -94,7 +108,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	sync[0].handle = syncobj_create(fd, 0);
>>>    	/* Binding mechanism based on use_capture_mode */
>>> -	if (use_capture_mode) {
>>> +	if (flags & COMPRESSION) {
>>> +		int ret;
>>> +
>>> +		ret = __xe_vm_bind(fd, vm, 0, bo, 0, addr, bo_size,
>>> +				   DRM_XE_VM_BIND_OP_MAP, 0, sync, 1, 0,
>>> +				   intel_get_pat_idx_uc_comp(fd), 0);
>>> +		igt_assert(!ret);
>>> +	} else if (use_capture_mode) {
>>>    		__xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
>>>    				    DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>>>    	} else {
>>> @@ -141,7 +162,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    		xe_exec(fd, &exec);
>>> -		if (!i && !(flags & CAT_ERROR) && !use_capture_mode)
>>> +		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
>>> +		    !(flags & COMPRESSION))
>>>    			xe_spin_wait_started(&data[i].spin);
>>>    	}
>>> @@ -202,7 +224,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>    	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>>>    	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>>> -	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL))) {
>>> +	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
>>>    		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
>>>    		     i < n_execs + extra_execs; i++)
>>>    			igt_assert_eq(data[i].data, 0xc0ffee);
>>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>>> index 113ceb2178..f5db1ff8ba 100644
>>> --- a/tests/intel/xe_exec_reset.c
>>> +++ b/tests/intel/xe_exec_reset.c
>>> @@ -123,6 +123,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
>>>    #define GT1				(0x1 << 10)
>>>    #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
>>>    #define SYSTEM				(0x1 << 12)
>>> +#define COMPRESSION			(0x1 << 13)
>>>    /**
>>>     * SUBTEST: %s-cat-error
>>> @@ -702,6 +703,9 @@ static void *thread(void *data)
>>>     * SUBTEST: long-spin-sys-reuse-many-preempt-threads
>>>     * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use system memory
>>>     *
>>> + * SUBTEST: long-spin-comp-reuse-many-preempt-threads
>>> + * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, both GTs, use compressed memory
>>> + *
>>>     * SUBTEST: long-spin-reuse-many-preempt-gt0-threads
>>>     * Description: Test long spinners with many preemptable jobs on each engine instance with a thread, use queues again spinners complete, primary GT
>>>     *
>>> @@ -878,6 +882,10 @@ igt_main
>>>    		threads(fd, 2, 16, SYSTEM | LONG_SPIN | PREEMPT |
>>>    			LONG_SPIN_REUSE_QUEUE);
>>> +	igt_subtest("long-spin-comp-reuse-many-preempt-threads")
>>> +		threads(fd, 2, 16, COMPRESSION | LONG_SPIN | PREEMPT |
>>> +			LONG_SPIN_REUSE_QUEUE);
>>> +
>>>    	igt_subtest("long-spin-reuse-many-preempt-gt0-threads")
>>>    		threads(fd, 2, 16, LONG_SPIN | PREEMPT | GT0 |
>>>    			LONG_SPIN_REUSE_QUEUE);
>>
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

