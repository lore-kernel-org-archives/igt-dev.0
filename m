Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C71E98DFF
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:37:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC8510E2C0;
	Mon, 23 Feb 2026 09:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aoceaSJT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C8510E2C0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771839422; x=1803375422;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=DV7yN23wvEkCZGb0igD2i8x4KS9AicQoL6QHMv5DCPg=;
 b=aoceaSJTIsxcmPmB2Zt8PJ+JiXoYcHlvBZLihmZnhhtH299fUbcot0J5
 APr3bY8R/9W3qcW48yRr+Ko76acAUV2cLuFPRD4vSBtSQ0jWqwyaZ4nSo
 5xmx5il2hxuRkJvSyvU0wPGs3WcCf9ktglhTZeEmss7AdcAC0b9z/zNsh
 Hl0nuWNpSYFK47CXWnKjEOleLiTbjPJle6bsqr89bEg6B6ruGmH7W9bvJ
 2K54+MaubVPeGHm9+I8mOSLQJOg2vC4fJkgexgTxKuGqh1uFNQLqNQgqd
 0IEiDSmFxsMLyJZPPRlwMADSt9mEcjS0kK0n2D+pOL2ngowQpwxbnsg+4 Q==;
X-CSE-ConnectionGUID: 2d/als80S8KCpcFrN0KzxA==
X-CSE-MsgGUID: pYPyTn7dT/quZzw0kjlEuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76441496"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208,217";a="76441496"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:37:02 -0800
X-CSE-ConnectionGUID: USvWJizuRTyaoMESNCWRTA==
X-CSE-MsgGUID: AX3IWxF+Siq6OIqVuJsheg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
 d="scan'208,217";a="253229989"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:37:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:37:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 01:37:00 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 01:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ov2ARW/EbfuCKtSUAYcyh5B+8dWGy+y6K0xqzxOGBHQeVu/8amNqQky2nXAFkiQy1FO92oEuW9LcxawNGRHisVzSCxsKerLkrzkQpW+nB8kvwSWa7Ir4EFk1rBs2l9H4TsDsBnTNTsM8/D9FZtEsIsekdAcMq493ec91WTveZlRdQ7YCcI/UK4xJRdmryqr33W8xjaMXm/pZhR1eHE4L+iVBciUJTTpeRt0hdNKk5aANfBwDFUFj+mlWcObeIcccFaFGSqgBQiICcLReASiT320AgSM+Sjua8hkr2DinS02b7uxBFJ2fKxNY2v6xk5AXR1B44qL0fggpyEAvJgoe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/GtkO73bLi25pIELUK70kG9ij67uM2GUpK2VYoIJ/w=;
 b=AxN4EO+cq0Ewejf18+K3uZg0grFjkMFZmm2Z1QF8eXWjABVBvyAb7Kf6SutpydLGUBVEoWqz1b9LY5nC4dk9FMkV1K8ek7tMXvzcc7LglEZZnl3A/HNY4AyCc+o1mZFiTz15ZydRdvigwgh/qvjju437DAR3KwA7L/jlYpJHQnT0YvWK98BkAYgAgdZz5Kdb2rGo0DrCIrxQD4l/9lo7f9xkJ6ooDQNt2uKFccq20U7OJ5wifBjUVI/KD2pH6y7DmaCkSEA/U5rx4+v94sGccO2eb0dUNXWZ3LjeuV05rRtccXWFH5cuZuRGmuqFEzmZtwifqpso0gwQiY4eFjv2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by SN7PR11MB8027.namprd11.prod.outlook.com (2603:10b6:806:2de::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 09:36:53 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 09:36:53 +0000
Content-Type: multipart/alternative;
 boundary="------------76ebdWuzZtmz9Hq34vVJSex3"
Message-ID: <d639d99d-3c57-4a1a-a1a1-2e50554fc4fe@intel.com>
Date: Mon, 23 Feb 2026 15:06:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add
 dontneed-before-mmap subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-4-arvind.yadav@intel.com>
 <BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com>
 <bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com>
X-ClientProxiedBy: MA5P287CA0042.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::10) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|SN7PR11MB8027:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e17f68-cfc1-48f6-b2a9-08de72bf136f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDhCcVVGSDhBS1JtWlMwdTEyNFM5akVUbWlVV3RZazJLSE93d1d6WkpSNUsr?=
 =?utf-8?B?blB5ZWF6UW1RbWtBS01tYm9KSjBTU1pkeGwvOVRkUGZwc1NvamJNZ2RrZ1Nh?=
 =?utf-8?B?TUF0ZWMxSnI2cnlud2dNVWdyb1NrSUhWbW1ZR1RZU3UyZSs3N2k0Y2haRUxk?=
 =?utf-8?B?ZlI0bStPTGVybSt1TXJCUzB6S3BXaDBRY1lTUFNNYVI5elJTZnVQeGo0cWRX?=
 =?utf-8?B?OGRrMmNlM05PVGF1NzJFb3JtSmhHb3A5RGdRci9qWFFEcmIyL25XV2UwZGlr?=
 =?utf-8?B?NGFLdUJjeS9ZdkcrNFAxZmgyem5pa1lydE1XeThkS0Fibi9aMmF6Q0d2R05S?=
 =?utf-8?B?aStQTVhmRlVMbSthNXNiaFRyV3l4THlBR0dZRXltZVBOTS8wNUZSQ2pSb0Yz?=
 =?utf-8?B?clpDc2F2VVJ1YktZL05CQjlucDVGaTA0dkxURXlBVjVNSHFteFRyUFhRdXBs?=
 =?utf-8?B?K05DdHFsUUNFakd4TnZqZmFuTnpNL0VDK2YzV0REc2xqUCthNWc0ZkJTMnhV?=
 =?utf-8?B?V2pZRWkzdUM5NzNDY0pjRVhQNXh6bUJyeERiNFZOTklNbVFiOTFsM3R5Wklw?=
 =?utf-8?B?M2VtVG0wWUZLaFNhMFRPeUhDOUpiWjZTUlliZjVrWHdTYTNRZEsyRDRRT0hx?=
 =?utf-8?B?ZVEwRVdDYys2aXF0V2RpOGFMbjdiK3AxYTF1bU1wSFJlOTl3Mm1pbjYwMjFn?=
 =?utf-8?B?K3NOaWo2TzhSTWUySmJYR1BraTNzT01kai91Yjg1WStRbXRKMm5uWDMwczcz?=
 =?utf-8?B?THROTzJ4V2gvQ0NsYU41U0RwM3U0VVJIcThaS2xOUHdGb1hiR1dMYXVjRWlY?=
 =?utf-8?B?VEhYbDlBcXRNa2Ewc2pNaDVNU0J3bWRDcjE0M0RNWk1vY0lLYUFRVExxYUl1?=
 =?utf-8?B?NkxoOS93UU9JNlI1cVZVSnFTU3ZxOTZvam5BUTVLVmFxKzJNZ0FTcE5FM0wy?=
 =?utf-8?B?c0pBbUNGTTlaUEQ0VXpaSzdjdXBkdU53cjBMTFhtYXVHSDNDN2ZUTitURXVD?=
 =?utf-8?B?N3E1ajJRTkIyeXBBejJ4TWtabTl1MDQvUm9FR2xVYlBXeVY0eVBoQjdNMVNZ?=
 =?utf-8?B?bWNtbmxjVGZrQ0RydENmbWYrODhDOS9ONEN2VHZYaWNHVGQ0SjBOUDV1TjZw?=
 =?utf-8?B?aGI5V055UmREZldPVXEwNjlyREQ0eEpUTWVaL08wdjJQM0FJc2NSdndqNXN2?=
 =?utf-8?B?S0pQSDhuN0VzbHJjOWtrQnQ2SUZ3L05MUmhzeWJqVS9hZkJHK1dyN3NoZmJs?=
 =?utf-8?B?dXV6VFhaVmRoN3JON3hCLzcrdXVmSFErbWFRTkZlYjUvY20zUVk0ZG14ZlJ5?=
 =?utf-8?B?N01abnpPTEFHUjJxQVlnTmx3Q0c4UlNSUzFyL3ZyT2RyUndlbTkvY3R1UEJB?=
 =?utf-8?B?STQ2RktNR052N2UvN0UrbE5kZVhGR2JRZVVWYWlKeDNIeFdwVk1pNFhvVFo3?=
 =?utf-8?B?WlBxb0pWbXF2aXpWQ05laElvNHBRNFZtZGtMR0Q2Nm1mTEZNWjdxZFRnK0Y4?=
 =?utf-8?B?SWt6aG1seWl6RndDRFRyenBvc29SNmRlUXNldFdVdUpQYkJNeHY1elc4b1ht?=
 =?utf-8?B?V25peTY2VkVhV0xaOGJyVzRBSFVibHJrUXljWmxIcnZCK1VkcFBnSkw5eDFy?=
 =?utf-8?B?MWYvTkIvRi93ckdTcFZuU2RwZFBTYlhGUzFGL2lWSnJjY2xob1lvUkttcURq?=
 =?utf-8?B?SlFGZGluQjdKeWVLL1JmN01JVHRMMTloY1Z1TXNYQWtpekt4OVYrS1dNSG0v?=
 =?utf-8?B?VUVFRkVkVFFBb0JKUk5lTGR3UjltUzRwODZrNlgzbHpNRnZ1aGxGeGtUajlD?=
 =?utf-8?B?QnBEZ3d6V3NYaStUWHo4VDVNOXZuRTFxOE9hcnpxaGhtNEtFQUxXYWFXMnpK?=
 =?utf-8?B?MVpKMFVwd3ZGODlFQUE2TDVFckRtYXZKUXNSU3pSTmlEL240M3FXZ1R6djhp?=
 =?utf-8?B?eTVuYXpLcC94dkp1RlZsNHVqUjZNSFdnSXd0dFQzWDJJM3gxVlYxSDEwOHZ5?=
 =?utf-8?B?NVZIK1A0R0JiSWFwcmNYVjdKWXQ3N3Yyd1UwMnUxdVlrd0lkenJqLzF3K3E1?=
 =?utf-8?B?S1U5WjhYdzN1aHg2TzlCaWxQdEY4WVA4M21oT2NVbEtORjQ0djRCNE1mWFFB?=
 =?utf-8?Q?Fx/0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0x6MlFjUXphaDQ3WTBzSDFaUEthZ214TTFPNEs4SnFUY01zbkhSRlU1WW9w?=
 =?utf-8?B?NmFRajIzMlJnK2xlNjd6WkR3bitLNElWakJPMS96Mkw4YUlQQ1BFQWtKZk16?=
 =?utf-8?B?dFJrTGRDQklmREROc09PR1hGaXhvZk9pa2lMc1pXZ3JuR0FENm5nK0Z3dzBV?=
 =?utf-8?B?MzAzWkVsYkQ0RWs2Q1ZZcFdPNHJpZjloWDlFWG1EeENxcUZlSk52b21mM2o3?=
 =?utf-8?B?Nk9ubndCS0pkQXd5cnMvS2syVm1LMmZtd2tNR2tMVHhVS2haNWU3S1RaZ0Q4?=
 =?utf-8?B?aVdGR0w2OWMxVElCVGZCd1c1Vm1rQ1ZXb0FDOGFIRTZBV0F3QWpJSjhhd3pv?=
 =?utf-8?B?NGdSSW05VUJ4eHZFQTdhK1g4WmZHRTh1MHhsNG5vT2VjdnhVbHluYk9PeHRy?=
 =?utf-8?B?bHBaN21yOTBoQksrQ2VROVlsSTN6RldmQkZDYkJBeGVxNjE5QWZRQTlYcWJR?=
 =?utf-8?B?WWZNbGFMd1BIYjNjRHVMdElQTUNMbXdXbkxUTW9pMHlTSys0Tk1xK2x3ZVEr?=
 =?utf-8?B?U3ZjaFRYNG9LN2tWS3lNbU1SL0pDLzFYYmppU3VZdVcrRXk0SW5SdUtTWkQ4?=
 =?utf-8?B?WWprdU94aUhHRHNXU3lLT3FCeEF2c2F1YnFvUExUYUtpTGpGWS8rZms3WWJH?=
 =?utf-8?B?M3gwTkNCb25wKys0bGNIS1RQYjNuMnN5N25QSXBUa2Q1VXFyUnFJLzk5aG55?=
 =?utf-8?B?MnhVMFE2UHVtNDFqVzNWc1VURllwYnNDd1JMNEhSeG9WUmdrYStzRTM0TUNR?=
 =?utf-8?B?WGFpTHhOQXRBRVJQLzhZNlhoME5PU0dhTVJWWlZsNktxRnlNSFR3eXlLVUE4?=
 =?utf-8?B?SE53VDBPOU1GMVIwOFFjbjVOU21Dcmh0eHhzZXY2Zm5nTys3VWFGbUhiS29I?=
 =?utf-8?B?YXB5dXh5cW52bHBGemo4S01pT3F5a0c5cmdzRExEb3hzaGJOUUtGZXBtRmhH?=
 =?utf-8?B?NFJIN3NIbVkzTTZGTk9hdWt3ckc1WDhnVkpSZ21kR0Z5QVRJa1Q3c1VEa3ZM?=
 =?utf-8?B?ZWNCVmx3c0FsTXVoQzVWUVVkYzlMTDJYeVdNOVNUNkhuTmZtdVZNclZ5Mk1x?=
 =?utf-8?B?WnN1UG1pSWpadElnYmU1MnBLcnhqY1VHY09JM1pCOVRZRUNURWN4eFlLc21M?=
 =?utf-8?B?SVpSaXRPcUd0aFFuS1B5dzh5TkRucGx4QUJDL1RpSE8vUUJINHExbENiNVFF?=
 =?utf-8?B?MjZKMkZodkZkVXJWT2IycVFJUkZFTXdoQlBOVk1MTzV3Q3pDRlMwbisrV25l?=
 =?utf-8?B?aExFUzR2Y3VYZkxadEVwS2ZOVjc1STVKMTFzcFlzSXZVcE8yai9BTXN0WGNJ?=
 =?utf-8?B?SkZNbW9SdVphbG94WFF3TTRCQkxFK0J0SjZUMHVKKzNZNm96NkY3YStReGZk?=
 =?utf-8?B?SjlVN3J3NXlHaDVadWRKUllnYThqR3B3cHhTM2ZCWWkrMkEram53QnovTmtj?=
 =?utf-8?B?VTdLdzY4cHZCd2hiYTRadEI1MkwzcitCY2U5Y1VsZFhtZmd6OVlLVEl1SVM2?=
 =?utf-8?B?VjFNNDZRTXZLZDRiU3Z5aFM5L01QK3dOWTFzZkI4Vm5oK2tMSU9OcG02dWxo?=
 =?utf-8?B?VEZGaWNzT2NvaGM1U0R1ZXBSemZTSWZZanpmM2JMM0U2Qm9pNlc0VlpXWGE5?=
 =?utf-8?B?MlBvZkYyM3E2VzdPOUY1dWdFempnaFJMR3NYQytNUzlVeDZScXo5ZC9ybXBt?=
 =?utf-8?B?ZXBEWTM3T1BWT1A4TFVTc0Y1Y1lKS2ZBNHVEVDFwTFJYMTdKZHNCdEtpQTJu?=
 =?utf-8?B?aHJBSFBDVVN4RVcwOVRZZHgrL2RLT3VpL29EQk56SlRlSzQySktHRUpLN3Js?=
 =?utf-8?B?K1pwUThKNmJvdEtoOGsrdTVnYTczd0k2OEZqR25DYnhkS0UvZE84ZzlTZmph?=
 =?utf-8?B?ZXpWaTI3TmdLaVprajVtU3hoMThDVUQ3cTVsaVFiVUVtVnA3aWltZ2RIQjdw?=
 =?utf-8?B?U2YvYmI5SEJuS1FBbllLSVZEYTljVVZldkZWNmV1T2gweUVnenVrWkpCQU5w?=
 =?utf-8?B?M1d6a1pRbHRiRkcvdFp4TStsRUt5K3NhQ0JXUDF1RGN2TUZmL0w3bmR6Sk5M?=
 =?utf-8?B?a0hrbGY5U2xXcUx1OTJ0QXVHcmZnSVdGNFBhMzl6SmdjYVBRd0Z3QW9BVVgr?=
 =?utf-8?B?ZVN5TElMY1BLclh5L2I5K0RvanFpVzFIaHp0amlPd2Y3cVI2SlREMCttUzVm?=
 =?utf-8?B?Q1JyNy9Gd09UbVdPanRTdVZkbGs5OUdTS3dNeURiaHBmbTM4TWIxWG84dndk?=
 =?utf-8?B?SXVNNTFEWS9CRVQyaHNQTlUxRHhubmtacld5Y2hlVDRUMDNYWGJBSlp5ZThj?=
 =?utf-8?B?Y1J6cjNrNHJFY1RFL0poTWJVTEd3WU8yOUZuYzM4T0p0ZVE4MkQ1dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e17f68-cfc1-48f6-b2a9-08de72bf136f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:36:52.9135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OE9WrdVQj9Mt7nO1XTDz/wdqRvyoIW032eP2ta3nof62nWJ9LWWBMgjmyfZoaYczclHOYvu8EtDgp9cP4GyRlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8027
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

--------------76ebdWuzZtmz9Hq34vVJSex3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 23-02-2026 11:19, Sharma, Nishit wrote:
>
>
> On 2/23/2026 10:39 AM, Gurram, Pravalika wrote:
>>> -----Original Message-----
>>> From: Yadav, Arvind<arvind.yadav@intel.com>
>>> Sent: Tuesday, 17 February, 2026 08:04 AM
>>> To:igt-dev@lists.freedesktop.org
>>> Cc: Brost, Matthew<matthew.brost@intel.com>; Ghimiray, Himal Prasad
>>> <himal.prasad.ghimiray@intel.com>;thomas.hellstrom@linux.intel.com;
>>> Sharma, Nishit<nishit.sharma@intel.com>; Gurram, Pravalika
>>> <pravalika.gurram@intel.com>
>>> Subject: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add dontneed-before-
>>> mmap subtest
>>>
>>> This test validates kernel behavior when mapping a BO that was already
>>> marked as purgeable and purged before mmap. After purging the BO under
>>> memory pressure, the test attempts to mmap and access it. The kernel should
>>> trigger SIGBUS or SIGSEGV when accessing the purged mapping, confirming
>>> that purged memory is properly invalidated.
>>>
>>> Cc: Nishit Sharma<nishit.sharma@intel.com>
>>> Cc: Pravalika Gurram<pravalika.gurram@intel.com>
>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>> Cc: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>>> Signed-off-by: Arvind Yadav<arvind.yadav@intel.com>
>>> ---
>>>   tests/intel/xe_madvise.c | 219
>>> +++++++++++++++++++++++++++++++++++++++
>>>   tests/meson.build        |   1 +
>>>   2 files changed, 220 insertions(+)
>>>   create mode 100644 tests/intel/xe_madvise.c
>>>
>>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c new file mode
>>> 100644 index 000000000..7dbe70f42
>>> --- /dev/null
>>> +++ b/tests/intel/xe_madvise.c
>>> @@ -0,0 +1,219 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2025 Intel Corporation
>>> + */
>>> +
>>> +/**
>>> + * TEST: Validate purgeable BO madvise functionality
>>> + * Category: Core
>>> + * Mega feature: General Core features
>>> + * Sub-category: Memory management tests
>>> + * Functionality: madvise, purgeable
>>> + */
>>> +
>>> +#include "igt.h"
>>> +#include "xe_drm.h"
>>> +
>>> +#include "xe/xe_ioctl.h"
>>> +#include "xe/xe_query.h"
>>> +
>>> +/* Purgeable test constants */
>>> +#define PURGEABLE_ADDR		0x1a0000
>>> +#define PURGEABLE_BO_SIZE	4096
>>> +
>>> +/**
>>> + * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
>>> + * @fd: DRM file descriptor
>>> + * @vm: VM handle (unused, kept for API compatibility)
>>> + *
>>> + * Allocates BOs in a temporary VM until VRAM is overcommitted,
>>> + * forcing the kernel to purge DONTNEED-marked BOs.
>>> + */
>>> +static void trigger_memory_pressure(int fd, uint32_t vm) {
>>> +	uint64_t vram_size, overpressure;
>>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>>> +	int max_objs, n = 0;
>>> +	uint32_t *handles;
>>> +	uint64_t total;
>>> +	void *p;
>>> +	uint32_t handle, temp_vm;
>>> +
>>> +	/* Use a separate VM so pressure BOs don't affect the test VM */
>>> +	temp_vm = xe_vm_create(fd, 0, 0);
>>> +
>>> +	vram_size = xe_visible_vram_size(fd, 0);
>>> +	/* Scale overpressure to 25% of VRAM, minimum 64MB */
>>> +	overpressure = vram_size / 4;
>>> +	if (overpressure < (64 << 20))
>>> +		overpressure = 64 << 20;
>>> +
>>> +	max_objs = (vram_size + overpressure) / chunk + 1;
>>> +	handles = malloc(max_objs * sizeof(*handles));
>>> +	igt_assert(handles);
>>> +
>>> +	total = 0;
>>> +	while (total < vram_size + overpressure && n < max_objs) {
>>> +		handle = xe_bo_create(fd, temp_vm, chunk,
>>> +				      vram_if_possible(fd, 0),
>>> +
>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +		handles[n++] = handle;
>>> +		total += chunk;
>>> +
>>> +		p = xe_bo_map(fd, handle, chunk);
>>> +		igt_assert(p != MAP_FAILED);
>>> +
>>> +		/* Fault in all pages so they actually consume VRAM */
>>> +		memset(p, 0xCD, chunk);
>>> +		munmap(p, chunk);
>>> +	}
>>> +
>>> +	/* Allow shrinker time to process pressure */
>>> +	usleep(100000);
>>> +
>>> +	for (int i = 0; i < n; i++)
>>> +		gem_close(fd, handles[i]);
>>> +
>>> +	free(handles);
>>> +
>>> +	xe_vm_destroy(fd, temp_vm);
>>> +}
>>> +
>>> +static jmp_buf jmp;
>>> +
>>> +__noreturn static void sigtrap(int sig) {
>>> +	siglongjmp(jmp, sig);
>>> +}
>>> +
>>> +/**
>>> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check
>>> +purged
>>> + * @fd: DRM file descriptor
>>> + * @vm: VM handle
>>> + * @addr: Virtual address of the BO
>>> + * @size: Size of the BO
>>> + *
>>> + * Returns true if the BO was purged under memory pressure.
>>> + */
>>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>>> +uint64_t addr, size_t size) {
>>> +	uint32_t retained;
>>> +
>>> +	/* Mark as DONTNEED */
>>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>>> +	if (retained != 1)
>>> +		return false;
>>> +
>>> +	/* Trigger memory pressure */
>>> +	trigger_memory_pressure(fd, vm);
>>> +
>>> +	/* Verify purged */
>>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>>> +
>>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>>> +	return retained == 0;
>>> +}
>>> +
>>> +/**
>>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>>> + * @fd: DRM file descriptor
>>> + * @vm: Output VM handle
>>> + * @bo: Output BO handle
>>> + * @addr: Virtual address to bind at
>>> + * @size: Size of the BO
>>> + * @use_scratch: Whether to use scratch page flag
>>> + *
>>> + * Helper to create VM, BO, and bind it at the specified address.
>>> + */
>>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>>> +				      uint64_t addr, size_t size, bool
>>> use_scratch) {
>>> +	struct drm_xe_sync sync = {
>>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>>> +		.timeline_value = 1,
>>> +	};
>>> +	uint64_t sync_val = 0;
>>> +
>>> +	*vm = xe_vm_create(fd, use_scratch ?
>>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>>> +
>>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>> +
>>> +	sync.addr = to_user_pointer(&sync_val);
>>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>>> +
>>> +/**
>>> + * SUBTEST: dontneed-before-mmap
>>> + * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>>> +SIGBUS on access
>>> + * Test category: functionality test
>>> + */
>>> +static void test_dontneed_before_mmap(int fd, struct
>>> +drm_xe_engine_class_instance *hwe) {
>>> +	uint32_t bo, vm;
>>> +	uint64_t addr = PURGEABLE_ADDR;
>>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>>> +	void *map;
>>> +
>>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>>> +		igt_skip("Unable to induce purge on this platform/config");
> No cleanup before igt_skip() or it's handled somewhere. gem_close(fd, 
> bo) and xe_vm_destroy(fd, vm);


Noted,

>>> +
>>> +	/* mmap the purged BO - access should trigger SIGBUS */
>>> +	map = xe_bo_map(fd, bo, bo_size);
> Should check igt_assert(map != MAP_FAILED) before using it below.


Noted,

>>> +
>>> +	{
>>> +		sighandler_t old_sigsegv, old_sigbus;
>>> +		char *ptr = (char *)map;
>>> +		int sig;
>>> +
>>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>>> +
>>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>>> +		switch (sig) {
>>> +		case SIGBUS:
>>> +		case SIGSEGV:
>>> +			/* Expected - purged BO access failed */
>>> +			break;
>>> +		case 0:
>>> +			*ptr = 0;
>>> +			__attribute__ ((fallthrough));
>
> why this __attribute__? Any compiler warning? Can't it be handled like
>
> case 0:
>
> default:
>
>     *ptr = 0;
>
> igt_assert_f(false, "Access to purged mmap should trigger SIGBUS, got 
> sig=%d\n", sig);
>
> break;
>
> as you are doing intentional fallout from case 0 to default?
>

You're absolutely right! The __attribute__ ((fallthrough)) is 
unnecessary here. Your suggested approach is cleaner and more 
straightforward.
*ptr = 0 should be part of case 0:

Thanks,
Arvind

>>> +		default:
>>> +			igt_assert_f(false,
>>> +				     "Access to purged mmap should trigger
>>> SIGBUS, got sig=%d\n",
>>> +				     sig);
>>> +			break;
>>> +		}
>>> +
>>> +		signal(SIGBUS, old_sigbus);
>>> +		signal(SIGSEGV, old_sigsegv);
>>> +		munmap(map, bo_size);
>>> +	}
>>> +
>>> +	gem_close(fd, bo);
>>> +	xe_vm_destroy(fd, vm);
>>> +}
>>> +
>>> +int igt_main()
>>> +{
>>> +	struct drm_xe_engine_class_instance *hwe;
>>> +	int fd;
>>> +
>>> +	igt_fixture() {
>>> +		fd = drm_open_driver(DRIVER_XE);
>>> +		xe_device_get(fd);
>>> +	}
>>> +
>>> +	igt_subtest("dontneed-before-mmap")
>>> +		xe_for_each_engine(fd, hwe) {
>>> +			test_dontneed_before_mmap(fd, hwe);
>>> +			break;
>>> +		}
>>> +
>>> +	igt_fixture() {
>>> +		xe_device_put(fd);
>>> +		drm_close_driver(fd);
>>> +	}
>>> +}
>> Reviewed-by: Pravalika Gurram<pravalika.gurram@intel.com>
>>> diff --git a/tests/meson.build b/tests/meson.build index
>>> 0ad728b87..9d41d7de6 100644
>>> --- a/tests/meson.build
>>> +++ b/tests/meson.build
>>> @@ -313,6 +313,7 @@ intel_xe_progs = [
>>>   	'xe_huc_copy',
>>>   	'xe_intel_bb',
>>>   	'xe_live_ktest',
>>> +	'xe_madvise',
>>>   	'xe_media_fill',
>>>   	'xe_mmap',
>>>           'xe_module_load',
>>> --
>>> 2.43.0
--------------76ebdWuzZtmz9Hq34vVJSex3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 23-02-2026 11:19, Sharma, Nishit
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/23/2026 10:39 AM, Gurram,
        Pravalika wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Yadav, Arvind <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com" moz-do-not-send="true">&lt;arvind.yadav@intel.com&gt;</a>
Sent: Tuesday, 17 February, 2026 08:04 AM
To: <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:igt-dev@lists.freedesktop.org" moz-do-not-send="true">igt-dev@lists.freedesktop.org</a>
Cc: Brost, Matthew <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com" moz-do-not-send="true">&lt;matthew.brost@intel.com&gt;</a>; Ghimiray, Himal Prasad
<a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a>; <a class="moz-txt-link-abbreviated moz-txt-link-freetext" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">thomas.hellstrom@linux.intel.com</a>;
Sharma, Nishit <a class="moz-txt-link-rfc2396E" href="mailto:nishit.sharma@intel.com" moz-do-not-send="true">&lt;nishit.sharma@intel.com&gt;</a>; Gurram, Pravalika
<a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com" moz-do-not-send="true">&lt;pravalika.gurram@intel.com&gt;</a>
Subject: [PATCH i-g-t v3 3/8] tests/intel/xe_madvise: Add dontneed-before-
mmap subtest

This test validates kernel behavior when mapping a BO that was already
marked as purgeable and purged before mmap. After purging the BO under
memory pressure, the test attempts to mmap and access it. The kernel should
trigger SIGBUS or SIGSEGV when accessing the purged mapping, confirming
that purged memory is properly invalidated.

Cc: Nishit Sharma <a class="moz-txt-link-rfc2396E" href="mailto:nishit.sharma@intel.com" moz-do-not-send="true">&lt;nishit.sharma@intel.com&gt;</a>
Cc: Pravalika Gurram <a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com" moz-do-not-send="true">&lt;pravalika.gurram@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com" moz-do-not-send="true">&lt;matthew.brost@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com" moz-do-not-send="true">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Cc: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com" moz-do-not-send="true">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
Signed-off-by: Arvind Yadav <a class="moz-txt-link-rfc2396E" href="mailto:arvind.yadav@intel.com" moz-do-not-send="true">&lt;arvind.yadav@intel.com&gt;</a>
---
 tests/intel/xe_madvise.c | 219
+++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 tests/intel/xe_madvise.c

diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c new file mode
100644 index 000000000..7dbe70f42
--- /dev/null
+++ b/tests/intel/xe_madvise.c
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Validate purgeable BO madvise functionality
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Memory management tests
+ * Functionality: madvise, purgeable
+ */
+
+#include &quot;igt.h&quot;
+#include &quot;xe_drm.h&quot;
+
+#include &quot;xe/xe_ioctl.h&quot;
+#include &quot;xe/xe_query.h&quot;
+
+/* Purgeable test constants */
+#define PURGEABLE_ADDR		0x1a0000
+#define PURGEABLE_BO_SIZE	4096
+
+/**
+ * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
+ * @fd: DRM file descriptor
+ * @vm: VM handle (unused, kept for API compatibility)
+ *
+ * Allocates BOs in a temporary VM until VRAM is overcommitted,
+ * forcing the kernel to purge DONTNEED-marked BOs.
+ */
+static void trigger_memory_pressure(int fd, uint32_t vm) {
+	uint64_t vram_size, overpressure;
+	const uint64_t chunk = 8ull &lt;&lt; 20; /* 8 MiB */
+	int max_objs, n = 0;
+	uint32_t *handles;
+	uint64_t total;
+	void *p;
+	uint32_t handle, temp_vm;
+
+	/* Use a separate VM so pressure BOs don't affect the test VM */
+	temp_vm = xe_vm_create(fd, 0, 0);
+
+	vram_size = xe_visible_vram_size(fd, 0);
+	/* Scale overpressure to 25% of VRAM, minimum 64MB */
+	overpressure = vram_size / 4;
+	if (overpressure &lt; (64 &lt;&lt; 20))
+		overpressure = 64 &lt;&lt; 20;
+
+	max_objs = (vram_size + overpressure) / chunk + 1;
+	handles = malloc(max_objs * sizeof(*handles));
+	igt_assert(handles);
+
+	total = 0;
+	while (total &lt; vram_size + overpressure &amp;&amp; n &lt; max_objs) {
+		handle = xe_bo_create(fd, temp_vm, chunk,
+				      vram_if_possible(fd, 0),
+
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+		handles[n++] = handle;
+		total += chunk;
+
+		p = xe_bo_map(fd, handle, chunk);
+		igt_assert(p != MAP_FAILED);
+
+		/* Fault in all pages so they actually consume VRAM */
+		memset(p, 0xCD, chunk);
+		munmap(p, chunk);
+	}
+
+	/* Allow shrinker time to process pressure */
+	usleep(100000);
+
+	for (int i = 0; i &lt; n; i++)
+		gem_close(fd, handles[i]);
+
+	free(handles);
+
+	xe_vm_destroy(fd, temp_vm);
+}
+
+static jmp_buf jmp;
+
+__noreturn static void sigtrap(int sig) {
+	siglongjmp(jmp, sig);
+}
+
+/**
+ * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check
+purged
+ * @fd: DRM file descriptor
+ * @vm: VM handle
+ * @addr: Virtual address of the BO
+ * @size: Size of the BO
+ *
+ * Returns true if the BO was purged under memory pressure.
+ */
+static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
+uint64_t addr, size_t size) {
+	uint32_t retained;
+
+	/* Mark as DONTNEED */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+
DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	if (retained != 1)
+		return false;
+
+	/* Trigger memory pressure */
+	trigger_memory_pressure(fd, vm);
+
+	/* Verify purged */
+	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
+
DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
+	return retained == 0;
+}
+
+/**
+ * purgeable_setup_simple_bo - Setup VM and bind a single BO
+ * @fd: DRM file descriptor
+ * @vm: Output VM handle
+ * @bo: Output BO handle
+ * @addr: Virtual address to bind at
+ * @size: Size of the BO
+ * @use_scratch: Whether to use scratch page flag
+ *
+ * Helper to create VM, BO, and bind it at the specified address.
+ */
+static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
+				      uint64_t addr, size_t size, bool
use_scratch) {
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = 1,
+	};
+	uint64_t sync_val = 0;
+
+	*vm = xe_vm_create(fd, use_scratch ?
DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
+	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
+
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+
+	sync.addr = to_user_pointer(&amp;sync_val);
+	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &amp;sync, 1);
+	xe_wait_ufence(fd, &amp;sync_val, 1, 0, NSEC_PER_SEC); }
+
+/**
+ * SUBTEST: dontneed-before-mmap
+ * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
+SIGBUS on access
+ * Test category: functionality test
+ */
+static void test_dontneed_before_mmap(int fd, struct
+drm_xe_engine_class_instance *hwe) {
+	uint32_t bo, vm;
+	uint64_t addr = PURGEABLE_ADDR;
+	size_t bo_size = PURGEABLE_BO_SIZE;
+	void *map;
+
+	purgeable_setup_simple_bo(fd, &amp;vm, &amp;bo, addr, bo_size, false);
+	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
+		igt_skip(&quot;Unable to induce purge on this platform/config&quot;);</pre>
        </blockquote>
      </blockquote>
      No cleanup before igt_skip() or it's handled somewhere.
      gem_close(fd, bo) and xe_vm_destroy(fd, vm);</blockquote>
    <p><br>
    </p>
    <p>Noted,</p>
    <blockquote type="cite" cite="mid:bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com">
      <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
+	/* mmap the purged BO - access should trigger SIGBUS */
+	map = xe_bo_map(fd, bo, bo_size);</pre>
        </blockquote>
      </blockquote>
      Should check igt_assert(map != MAP_FAILED) before using it below.</blockquote>
    <p><br>
    </p>
    <p>Noted,</p>
    <blockquote type="cite" cite="mid:bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com">
      <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+
+	{
+		sighandler_t old_sigsegv, old_sigbus;
+		char *ptr = (char *)map;
+		int sig;
+
+		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
+		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
+
+		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
+		switch (sig) {
+		case SIGBUS:
+		case SIGSEGV:
+			/* Expected - purged BO access failed */
+			break;
+		case 0:
+			*ptr = 0;
+			__attribute__ ((fallthrough));</pre>
        </blockquote>
      </blockquote>
      <p>why this __attribute__? Any compiler warning? Can't it be
        handled like</p>
      <p>case 0:</p>
      <p>default:</p>
      <p>&nbsp; &nbsp; *ptr = 0;</p>
      <p>&nbsp; &nbsp;&nbsp;<span style="white-space: pre-wrap">igt_assert_f(false, </span><span style="white-space: pre-wrap">&quot;Access to purged mmap should trigger </span><span style="white-space: pre-wrap">SIGBUS, got sig=%d\n&quot;, sig);</span></p>
      <p>break;</p>
      <p>as you are doing intentional fallout from case 0 to default?&nbsp;</p>
    </blockquote>
    <p><br>
    </p>
    <p>You're absolutely right! The __attribute__ ((fallthrough)) is
      unnecessary here. Your suggested approach is cleaner and more
      straightforward.<br>
      *ptr = 0 should be part of case 0:&nbsp;<br>
      <br>
      Thanks,<br>
      Arvind</p>
    <blockquote type="cite" cite="mid:bf1586d7-6753-488b-8ea6-d5bbb41dfb66@intel.com">
      <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">+		default:
+			igt_assert_f(false,
+				     &quot;Access to purged mmap should trigger
SIGBUS, got sig=%d\n&quot;,
+				     sig);
+			break;
+		}
+
+		signal(SIGBUS, old_sigbus);
+		signal(SIGSEGV, old_sigsegv);
+		munmap(map, bo_size);
+	}
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
+int igt_main()
+{
+	struct drm_xe_engine_class_instance *hwe;
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	igt_subtest(&quot;dontneed-before-mmap&quot;)
+		xe_for_each_engine(fd, hwe) {
+			test_dontneed_before_mmap(fd, hwe);
+			break;
+		}
+
+	igt_fixture() {
+		xe_device_put(fd);
+		drm_close_driver(fd);
+	}
+}
</pre>
        </blockquote>
      </blockquote>
      <blockquote type="cite" cite="mid:BL1PR11MB5525EA60CF564CF51C1A85E18477A@BL1PR11MB5525.namprd11.prod.outlook.com">
        <pre wrap="" class="moz-quote-pre">Reviewed-by: Pravalika Gurram <a class="moz-txt-link-rfc2396E" href="mailto:pravalika.gurram@intel.com" moz-do-not-send="true">&lt;pravalika.gurram@intel.com&gt;</a>
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">diff --git a/tests/meson.build b/tests/meson.build index
0ad728b87..9d41d7de6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -313,6 +313,7 @@ intel_xe_progs = [
 	'xe_huc_copy',
 	'xe_intel_bb',
 	'xe_live_ktest',
+	'xe_madvise',
 	'xe_media_fill',
 	'xe_mmap',
         'xe_module_load',
--
2.43.0
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------76ebdWuzZtmz9Hq34vVJSex3--
