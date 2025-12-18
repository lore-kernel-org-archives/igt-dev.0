Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA66D68BD1
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 03:20:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C21010E0EF;
	Thu, 18 Dec 2025 03:20:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCA9dL5z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36DF10E380
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 03:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766028050; x=1797564050;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=Wc0acizq3VFepQfOCZkC1JJUcnrsmdJ2RTF1DfCezwc=;
 b=oCA9dL5zE1LUkWVd2E3nGwqDDmCMPr5q98qZWbRDtpMRGJ55K8KH1PkM
 YdvHbRLJmEJ9n3L/PgFX++IGclGyWmTocoS+JPcGYkuEGhjIFtiYx2umr
 V1dPsGg4F8Kk1bzKY93h5psk3mPqObjbUCnkWj6tC8VLznmJNCxdoEnvZ
 qDOlxCleAEOOn3iT+zq3VA8Axz3WedZKmaYHEFqFLh8eR48j2uRy9Hy7O
 lAcpGOTdz5PrCm1yhM0sRk9GChjgIgfzEglO5VC0HLb8YZgFfesh5MfXA
 HM3cF/fYB0ESlLLKJbV/Axn5P2Jj5p4YQksfK68ixqTq+Olgb3A0JdLLv w==;
X-CSE-ConnectionGUID: NENu8BnBR9CNJo/jPfTovw==
X-CSE-MsgGUID: NKPRfgqQTx+qxHd2OJpeYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78689761"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208,217";a="78689761"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 19:20:49 -0800
X-CSE-ConnectionGUID: iWC52NOfQ7OooVzaR/CPqQ==
X-CSE-MsgGUID: qZwaOrtZRl2jZQGepYLm7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
 d="scan'208,217";a="229155867"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 19:20:49 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 19:20:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 19:20:48 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 19:20:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeXACqppf3eh4LleWMjnlCwP5tZFgb16iPe0CoUXw0KUqrQRMw0nQOHiv7jsFj/KxHbgZzOddHcxqIcs7ffJTICDSHRMKnFgsV4u2JeWH//USo7HlGDLq1mv1opsmtmCmBP0Bd7fUGvssVR7qD/iHlMhCLkRlEGNUiw1eTVzrGezgrkm10tjITDhnuumMAPRIBahXOkjWGoRxQEEvWfruHyiNoYL3J1sMxAkxRwHgiKlMdrM06KF/cWzqAc9MjheDSQlPQZRS++d8xwYddAmM9y5Tmqk8OfFa02F0T4eF4iQP5+r/m2UsJccvIrcqcHNJFVE3azFAPamGmV3gOm2fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKv2Yq7qyCqHB9UYhfw6CbZ+vIvxBHcdpxotw3AJTDw=;
 b=O36CV2NrwFKWDJSFTuZKzXJ8EPDbpHNo3qol3TScW4obaDb9DakEEDHP8XjSTBKefjw15MFAQBCJF9uLbLe00tCHntvReheJmXF4k2SKE/VfLQnsrcZRP1CwVXbkVXdFisnaYNUm7RgOqiZE3SU39yJBb4bzifuoPItTJvcHNUnHOj1eRmDhREb7J/JQioTO/FoSewDVtXWLO8tmZDKNtHUKg6UTCHHbsNBJp7buSh8YXILPDlUmnObXJ4yIrAvHMahemvu3Vb75UwKN4A6rcKVMm7oEOhVdzhek6dtIg2eszCzSb2ADva8notz5cr9qt5yVnZB5Pa8VuLudcavJCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA3PR11MB8920.namprd11.prod.outlook.com (2603:10b6:208:578::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 03:20:45 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 03:20:44 +0000
Content-Type: multipart/alternative;
 boundary="------------BGr2QzNMn03KEh8Agvz8a4XO"
Message-ID: <2b30be43-cdc9-4234-b553-1a3464caa06c@intel.com>
Date: Thu, 18 Dec 2025 08:50:37 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_wrapper?=
 =?UTF-8?Q?s_for_painting_test_patterns_to_=28rev3=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20251216085242.2916476-1-karthik.b.s@intel.com>
 <176597765492.97606.14916486234982028770@a3b018990fe9>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <176597765492.97606.14916486234982028770@a3b018990fe9>
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA3PR11MB8920:EE_
X-MS-Office365-Filtering-Correlation-Id: bc207b1e-ea0c-4a4b-d082-08de3de46d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|42112799006|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2ZZTnRIR0lzQnpLMVl4YWs1cGtlY2l3MFJZOHo1ekdBVEZ4d0p4QS91Z29F?=
 =?utf-8?B?U0g3bGgwMmM3UDhyQ1pjZnY4eEF0bTU1dHVoa3ZWZFkzR292TVRuQXpZaCtJ?=
 =?utf-8?B?c2R2QWhwZ1ZiQVFGdzdMYm5tMFUyTW4zS3NiL1YrdFo2ZVIwNHc0d2ovR0NE?=
 =?utf-8?B?blRZN0VQR3NQMFRpODFiS05qWEtaSFZ2OElzMTkyWUI3cGVabFRaWE1XMTlj?=
 =?utf-8?B?bGJtYVppTXhvWSsyVmlSOGhSTUltYnRiQ1gwQU9iZThvdkYvblFqZ1c4SDls?=
 =?utf-8?B?cVBFL1JqL1IyN2FzZCtoMG5Wa2xVTzB6UVZQaFl2QkZXT2ZkT3FYT292WUxJ?=
 =?utf-8?B?RGdBK2QrZm9KMCt3K1ZlM3JVaXk1dmlUKzJjY21oTDhGdEFiazFlU0VzZFNm?=
 =?utf-8?B?RFZYOTFKVk0yQlZkRjJhaVRoZGM5RkpKand2Q3VxRXhJcUszaktlUkpWanZX?=
 =?utf-8?B?aWorMDd2ak5HWFk1Y0p0VUNSU0pYQ0EwM2x4Y1FtcEpZTUxCTEliVWdPOVdO?=
 =?utf-8?B?aDd2ME0vRENiRGtscXAxcWRyWDRtNGJMUCtLa21Nd2pUb3dUQ3krYlFhQThC?=
 =?utf-8?B?aVhhRzJXR1YweDNQSDZ6a1I4QW1aUnJZN2MxcmVCMjJ0OEhrOWdqbXRFT2py?=
 =?utf-8?B?NStUejM0NVBhM0dyeTBvU2JuV1VhZDZ3YUZFL0g3a3FLMHVtbkpLOXIzRXFn?=
 =?utf-8?B?Q0kzWWNteEJDeWxqdEMyWVRkaEtVSkNnWk5zNWJyTVJ5TXViLzk3K2NYYVR0?=
 =?utf-8?B?cWpHVTdPZUMrYlpKc055aEtpRnRVSlVEbUpxOWQ2bS9xdEROQnpDS2tOY1U5?=
 =?utf-8?B?QldyVzJlTTZyTEdIVzczMTJGUG84QkhHcjFqb1pmdU9uODE4ZDdENmRBMStm?=
 =?utf-8?B?UjcyVmtBQmMrcWJseFp0MjB2Z0xWSlFDaENYc3Y1Vkt2eENHaDRVTzgwQ0tY?=
 =?utf-8?B?WGwwRGl0a25UMmU5RVo2a1A4cUwzakQwZUdkaUttbmNYZjlKVjhITEtkQTRN?=
 =?utf-8?B?YUhEOHNZQmNHRW5zR0pudUhuNHBKMzZvYWMxbWhaNlQvemg2bUVTTkdCeVBx?=
 =?utf-8?B?RDR4emtXT0RRTFVSR0h0anl0VEZZSzRaSVFRdVEzdWpBdkV3YjBLejhDcDh1?=
 =?utf-8?B?RFJadWFFRjF0RENBN2JDVitVdEpFNzA3djQ2QlRjb004cSt3WDZFMUgrb3RE?=
 =?utf-8?B?R2QwalYvbExUS3M4VWF4QWozdW9qdjU5S3JEU0lWQjlzNFlXRGhMV2xLTG9Z?=
 =?utf-8?B?VmgrSHIrZnkwZ215dEJIUXdJeHpteVhzdEh1RURLc1ZyMjRINUVZQ0c1TGcv?=
 =?utf-8?B?TDM3cDR6VGZVdTF3eUd4d3JBdy9qaEJLUzVTMkUvdEdzamNkTWhWelJzMVFH?=
 =?utf-8?B?dmZQUkdkSnZyNlU3NFVnVC9DODkzNkxBTzJjd2NpTEFNVGl5ZHlVbXZSdXRT?=
 =?utf-8?B?K0FzZTNsckFvdHFvN1J6WERwMlpXa2VMRjdOZ21FZ1ZicHdhbE5GM2NadUpF?=
 =?utf-8?B?SVRjeGx4enBaaGdvWmZVdDIzVzJvaTUybC9VSmFCNnpiVlJabDdQS21mY2Y1?=
 =?utf-8?B?dUN0R3ZiOHY1WWkzbjd6WUVrSFZLdGFJdW5teVFqclFYUS9WOW1WNWpsWmJr?=
 =?utf-8?B?by9keFVXR1BoeWg4SUtHbW9yeUp1ZGVVM1NTL1kvOWZ1T21Vb3FNMW9Xd1Nt?=
 =?utf-8?B?VS9qU3JFRlVXdUVaUGZ6UkNrcXRrOEk3OEo4RnY5aDgvRFJ1WmZNOGZDek9R?=
 =?utf-8?B?NFhvcTFLZG1Xd3lFcDBjaVhFSEpyMi8xK1U3QWk4QXpyWkJzUlh6N0tmMVVl?=
 =?utf-8?B?eTEzbm5DZ1AwVFo5SHpYQVBpUHN1azh4bW5qcjJ0WlFIZHpNRmFwaUg5bncw?=
 =?utf-8?B?ZzhNZFZxVDA5bkRDRHZ0a3VtUS84ZG5qTjFWZXN1dHA0R0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(42112799006)(13003099007)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlZWM3lQSkNIWTdNNUowVkJuRzVtM3ZxSXhsbkxxZTFTajlPN1NIb0ZFUTBT?=
 =?utf-8?B?VDNwY2VoemtNU0RUckhHT2VRMnBTMVlMcVFZNFFFSEp2c3ZVbjlHQ2w1Wlpz?=
 =?utf-8?B?ZUhkSzIwbzdoWC9lK1AxM2NqMy9ldGpwRjh4aXY2cms1dTdMSlhJak9uUE0w?=
 =?utf-8?B?WWlpTE41bXEwanlad2Y5TUx4R3NRZndqTWk2eEt2SHhFekREZzRXZkx2Yy8r?=
 =?utf-8?B?ZytpYXRNTk1kTUc0TW81dm1pVW9YYmRBTEpibWNSK2dBWUxHQXRNdkI3cy9X?=
 =?utf-8?B?Z0dxZ0ZhUWhkSWdYeUs5Wkc5YzRsOWRYMk9NdG0zcU1hTmRVMEJkQnVqUmNk?=
 =?utf-8?B?dm1TdGd6MUI1UDlKMWNpY2twbWVNdmRVaEtSdVZMa05GemFRZDNkeGh2SjVY?=
 =?utf-8?B?Zmw4ZFZ1YzdrSGpHMjc1dVY0aGkxb1E4ZFE4RFA4ajd4Q3BqUDBuMzBDWlhV?=
 =?utf-8?B?eExFSjdTYk8xdldIeTNhdUVPQld5b0U4d3NjWE05ZnVCS3M5NXZ3WEFhWDJT?=
 =?utf-8?B?QUV5OUM1b21SdG55QzVUcDFYS1hld2RROU9TL2h4WGVJVnN4endYK0dGQ3pW?=
 =?utf-8?B?SjROL3FIbUttV3NWWnEvNTIwTGNveFFsamVKcm1zbSs3eEZ4T1JNU3l4ajIx?=
 =?utf-8?B?M2IzaUR0cXZHajMwMVkxRlRBQUxzZzBGQkVYUjZpbm8wb3Z0T0t1cG5sUnFT?=
 =?utf-8?B?clBSMmdQTnJoTkxxelRsK2o0aXFhOUl0TndvYUlzQ1c4M0kxZFU5SUpFRTNk?=
 =?utf-8?B?c0pNM0RST1FSMnZnSnNoN2xSNDZBLzFWRG1MTHNEWmJJeEdCdWlLUFRtTGR0?=
 =?utf-8?B?bmVORW1JbVZTS0ZTQUN0eTUvU3RSRFFyZHI2ZGw4SDFpWGtadWU2Z3IrRXBQ?=
 =?utf-8?B?ODVVU1NEZzdCNDBHVVZtZFRCYUdqWGR0ZWF1dDZQalBlYXdFSEdRVGxXOXQ0?=
 =?utf-8?B?NTJldzZGRnBtcmEwTWoxcTZTdkdtMUoxQlF4VTJqUjZzUlV3MFpEbjd1TDZK?=
 =?utf-8?B?RUdEQUR4c3ZQL3BGaEZWaldqNkgrSU1jVU15Sy9Dck9Lam53ZkxVY1NaaE9P?=
 =?utf-8?B?YWdSNkI0WDhnUjdsdFVPRWZXUW5NOU5BWXc5NXFXbk11MDBmclQwS29udmh2?=
 =?utf-8?B?Yzc2aU9xa09MRTk0NlVhN2hseStNYkJSUjNJVnAvSVBpNm8vWFpqWlhUQVFk?=
 =?utf-8?B?QjJ0VmVjR1RRb1A0OGprb2VrOUlIWWczdzBXNHgydExRQUpXUXVXQ3I2MnRy?=
 =?utf-8?B?M1lZMUF3Z204NnhQaFEwQk9rOGJ1aGdzSERtOUlaSUN5d05kQ2VldjgrNUxV?=
 =?utf-8?B?ZHV2U0luMkRVUkN3eWI2N0RFOWNkc1NTUjhDeUgyaHhiMngzd1VoOEdHalNZ?=
 =?utf-8?B?SW1jOWZHdGtuVXdRYWl1ZTRjZ0t6TTY5ZExYRHYxUlR0aEZiV2R4SnYwbzJa?=
 =?utf-8?B?SFB1bEQ3bEJKWHF4QVlwZjJJVU1ralFMUG5PY2xvZEdNYXl2d3owMlgwTGpq?=
 =?utf-8?B?dDNVMzVKRnkrZHdiV3NaMUQyYjllQklqcE1NaXpkT0pkOFVPUElmRmR4K2pB?=
 =?utf-8?B?KzU0ci9GT1kzQ3BYZ2N4dVZIOGNINkJqYkdoQlVjTU04azkzTU94UFU5MlAw?=
 =?utf-8?B?bHdwRVo2YVB3V2lwaUhYcC8wWWdqMTd3MkJpVzVqTnltMFpLVFkrUHJWT24z?=
 =?utf-8?B?SlZtYUx2bXlhQzRvRUxoejNVQzA4d0d2ekppUkRDMVFtWUpGYzQxSUpFNjJ4?=
 =?utf-8?B?Z01UMnhlZlF4bEh4U3FMak0yanJqd1BTaSt3YVNkYWlmcUk0K3Y2a2E2bVRK?=
 =?utf-8?B?UUxVRm1LQTAzOGNyQXl4enQ2a25HOE1xNWttbFBpak45K0E2ZTNnUVFxZ2hI?=
 =?utf-8?B?dDVMUHV6Snd1eDhsNDZtdFIzbVl3YldIVXlwWnVWSm81eG1CNFBDcFVoekVM?=
 =?utf-8?B?WlYzSGZKdzJrdzZFRWU5K3pYVncrSHFpM1p2dGtTT1lGUEJCNWZFU29pNmJN?=
 =?utf-8?B?eHFQMEVSTU1zTzhPZ2VrL0dpU1NXU0QxZStoQWJrWVc4TjBGZDlQVm5sRjdO?=
 =?utf-8?B?VmNtM1ZaandQZkFLQmRtajl2dUVpbXZ6R0pKSmdTQm5aMEhRa1BwMmRsM1Vu?=
 =?utf-8?Q?SGM+mSDk1BJYF+AMbOvi6kE33?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc207b1e-ea0c-4a4b-d082-08de3de46d53
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:20:44.9253 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6A+FdpGG4ka4nHKe7TDREKFUMbS9hhQODinvjPsqX0LLAYz7Kz8kyNvvG3KbA84Bg44dp3nbVtUxOj2isAEo5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8920
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

--------------BGr2QzNMn03KEh8Agvz8a4XO
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

These failures are unrelated to the series, going ahead for merge.

Thanks and Regards,
Karthik.B.S

On 12/17/2025 6:50 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Add wrappers for painting test patterns to (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/158731/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/index.html
>
>
>   CI Bug Log - changes from XEIGT_8667_FULL -> XEIGTPW_14218_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14218_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14218_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14218_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html>
>  *
>
>     igt@kms_pm_rpm@drm-resources-equal:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html>
>         +3 other tests skip
>  *
>
>     igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html>
>  *
>
>     igt@xe_module_load@reload:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_module_load@reload.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_module_load@reload.html>
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_module_load@reload-no-display.html>
>
>
>         Warnings
>
>   * igt@kms_pm_rpm@modeset-lpsp-stress:
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14218_FULL that come from known 
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
>     igt@core_hotunplug@hotreplug:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@core_hotunplug@hotreplug.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@core_hotunplug@hotreplug.html>
>         (Intel XE#6779
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779>) +1
>         other test skip
>  *
>
>     igt@core_hotunplug@hotreplug-lateclose:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html>
>         (Intel XE#6779
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779>)
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html>
>         (Intel XE#6815
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815>)
>  *
>
>     igt@fbdev@pan:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@fbdev@pan.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>)
>  *
>
>     igt@intel_hwmon@hwmon-read:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@intel_hwmon@hwmon-read.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@intel_hwmon@hwmon-read.html>
>         (Intel XE#5177
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         (Intel XE#6054
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054>)
>  *
>
>     igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html>
>         (Intel XE#6676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676>)
>         +43 other tests fail
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>)
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>)
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +8
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +5
>         other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +2
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +8
>         other tests skip
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_color@ctm-blue-to-red:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-aspect-ratio:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@suspend-resume:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@kms_content_protection@suspend-resume.html>
>         (Intel XE#6705
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) +1
>         other test skip
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#4210
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210>)
>  *
>
>     igt@kms_dp_link_training@uhbr-mst:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html>
>         (Intel XE#4354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354>) +1
>         other test skip
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (Intel XE#4294
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294>)
>  *
>
>     igt@kms_dsc@dsc-with-bpc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_dsc@dsc-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fb_coherency@memset-crc:
>
>       o shard-bmg: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_fb_coherency@memset-crc.html>
>         (Intel XE#6706
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706>) +1
>         other test crash
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#6831
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6831>)
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1397
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +5
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +5
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_force_connector_basic@force-edid:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_force_connector_basic@force-edid.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +31 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +17
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +13 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +24 other tests skip
>  *
>
>     igt@kms_hdr@invalid-metadata-sizes:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925> /
>         Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927> /
>         Intel XE#6590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html>
>         (Intel XE#4329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329>)
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-x:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-x.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +9
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@fade-with-suspend:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_pm_rpm@package-g7.html>
>         (Intel XE#6813
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813>)
>  *
>
>     igt@kms_pm_rpm@system-suspend-idle:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_pm_rpm@system-suspend-idle.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@system-suspend-idle.html>
>         (Intel XE#6693
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +5
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>)
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>) +2
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-no-drrs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_psr@fbc-pr-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +3
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-primary-blt@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>  *
>
>     igt@kms_psr@psr2-no-drrs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +22 other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>)
>         +12 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html>
>         (Intel XE#4689
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) +1
>         other test skip
>  *
>
>     igt@kms_sharpness_filter@filter-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#6599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>)
>  *
>
>     igt@xe_eudebug@discovery-race-sigint:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_eudebug@discovery-race-sigint.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>  *
>
>     igt@xe_eudebug@multigpu-basic-client-many:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_eudebug@multigpu-basic-client-many.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug_online@pagefault-write-stress:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_eudebug_online@pagefault-write-stress.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665> /
>         Intel XE#6681
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681>)
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +5
>         other tests skip
>  *
>
>     igt@xe_eudebug_sriov@deny-sriov:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@xe_eudebug_sriov@deny-sriov.html>
>         (Intel XE#4518
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.html>
>         (Intel XE#5793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793>)
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_basic@many-bindexecqueue-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +777 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>         +10 other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_compute_mode@twice-basic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_exec_compute_mode@twice-basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +31 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-close-fd-smem:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +11 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:
>
>       o shard-lnl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@xe_exec_system_allocator@madvise-split-vma-with-mapping.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html>
>         (Intel XE#5007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>)
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>)
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html>
>         (Intel XE#6196
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196>)
>  *
>
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +14 other tests skip
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +757 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_mmap@pci-membarrier-parallel:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html>
>         (Intel XE#5100
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100>)
>  *
>
>     igt@xe_mmap@small-bar:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@xe_mmap@small-bar.html>
>         (Intel XE#586
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/586>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245>)
>  *
>
>     igt@xe_peer2peer@write:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_peer2peer@write.html>
>         (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s3-vm-bind-prefetch:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) +1
>         other test skip
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +3
>         other tests fail
>  *
>
>     igt@xe_pxp@display-black-pxp-fb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-gt-list:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@xe_query@multigpu-query-gt-list.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_query@multigpu-query-invalid-cs-cycles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +4
>         other tests skip
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>  *
>
>     igt@xe_sriov_vram@vf-access-beyond:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@xe_sriov_vram@vf-access-beyond.html>
>         (Intel XE#6376
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>         (Intel XE#5993
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html>
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_setmode@basic.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_setmode@basic.html>
>         +3 other tests pass
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (Intel XE#6361
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         +2 other tests pass
>  *
>
>     igt@xe_pm@s4-d3hot-basic-exec:
>
>       o shard-lnl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html>
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html>
>         (Intel XE#5993
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993> /
>         Intel XE#6676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html>
>         (Intel XE#6676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html>
>         (Intel XE#6676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html>
>         (Intel XE#6054
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054> /
>         Intel XE#6676
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676>)
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-overflow:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#610
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/610>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +11 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +16 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@gamma:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_chamelium_color@gamma.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +9
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_content_protection@lic-type-1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_content_protection@lic-type-1.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-32x32:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +7
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-256x85:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#1508
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#776
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/776>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#2352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +41 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +35 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_hdr@bpc-switch.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_hdr@bpc-switch.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934> /
>         Intel XE#6590
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_backlight@fade.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#2505
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#2499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +12 other tests skip
>  *
>
>     igt@kms_psr@pr-sprite-plane-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +10 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-plane:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#2450
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_vrr@flip-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_vrr@flip-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +4
>         other tests skip
>  *
>
>     igt@xe_compute@eu-busy-10s:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_compute@eu-busy-10s.html>
>         (Intel XE#6599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_compute@eu-busy-10s.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_create@multigpu-create-massive-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#2504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_eudebug@basic-vm-access-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +6
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +5
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@pagefault-one-of-many:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_eudebug_online@pagefault-read-stress:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@xe_eudebug_online@pagefault-read-stress.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665> /
>         Intel XE#6681
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_eudebug_sriov@deny-eudebug:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#5793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +13 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-priority-smem:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-priority-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +37 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +31 other tests skip
>  *
>
>     igt@xe_pm@s4-d3cold-basic-exec:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-engines:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_query@multigpu-query-engines.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>
>
>     Build changes
>
>   * IGT: IGT_8667 -> IGTPW_14218
>   * Linux: xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1 ->
>     xe-4253-2dc4a4ece453df925f995df5eac747a29081c180
>
> IGTPW_14218: fa5a1d825504ada31d8361835d8b934aab4a2314 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1: 
> 4bae139bb961fd9df698b3bf15bf39f9bf9800a1
> xe-4253-2dc4a4ece453df925f995df5eac747a29081c180: 
> 2dc4a4ece453df925f995df5eac747a29081c180
>
--------------BGr2QzNMn03KEh8Agvz8a4XO
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>These failures are unrelated to the series, going ahead for
      merge.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">On 12/17/2025 6:50 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:176597765492.97606.14916486234982028770@a3b018990fe9">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Add wrappers for painting test patterns to (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/158731/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/158731/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8667_FULL -&gt;
        XEIGTPW_14218_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14218_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14218_FULL, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14218_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@drm-resources-equal:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html" moz-do-not-send="true">SKIP</a> +3 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-6/igt@xe_exec_threads@threads-shared-vm-userptr-invalidate-race.html" moz-do-not-send="true">ABORT</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_module_load@reload.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_module_load@reload.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_module_load@reload-no-display.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>igt@kms_pm_rpm@modeset-lpsp-stress:
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439" moz-do-not-send="true">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send="true">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836" moz-do-not-send="true">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14218_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@core_hotunplug@hotreplug:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@core_hotunplug@hotreplug.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@core_hotunplug@hotreplug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779" moz-do-not-send="true">Intel XE#6779</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@core_hotunplug@hotreplug-lateclose:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779" moz-do-not-send="true">Intel XE#6779</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815" moz-do-not-send="true">Intel XE#6815</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@fbdev@pan:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@fbdev@pan.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-not-send="true">Intel XE#2134</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-read:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@intel_hwmon@hwmon-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177" moz-do-not-send="true">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054" moz-do-not-send="true">Intel XE#6054</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-edp-1-linear-rgb565.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676" moz-do-not-send="true">Intel XE#6676</a>) +43 other
              tests fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370" moz-do-not-send="true">Intel XE#2370</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send="true">Intel XE#1407</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send="true">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send="true">Intel XE#787</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418" moz-do-not-send="true">Intel XE#4418</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_cdclk@plane-scaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724" moz-do-not-send="true">Intel XE#2724</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_chamelium_color@ctm-blue-to-red.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send="true">Intel XE#373</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_chamelium_sharpness_filter@filter-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507" moz-do-not-send="true">Intel XE#6507</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_chamelium_sharpness_filter@filter-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507" moz-do-not-send="true">Intel XE#6507</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send="true">Intel XE#2390</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@suspend-resume:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@kms_content_protection@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6705" moz-do-not-send="true">Intel XE#6705</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send="true">Intel XE#309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz-do-not-send="true">Intel XE#323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send="true">Intel XE#2286</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210" moz-do-not-send="true">Intel XE#4210</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-mst:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_dp_link_training@uhbr-mst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354" moz-do-not-send="true">Intel XE#4354</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294" moz-do-not-send="true">Intel XE#4294</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_dsc@dsc-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fb_coherency@memset-crc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_fb_coherency@memset-crc.html" moz-do-not-send="true">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706" moz-do-not-send="true">Intel XE#6706</a>) +1 other test
              crash</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6831" moz-do-not-send="true">Intel XE#6831</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_flip@2x-plain-flip-fb-recreate.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send="true">Intel XE#1421</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397" moz-do-not-send="true">Intel XE#1397</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745" moz-do-not-send="true">Intel XE#1745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-do-not-send="true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-edid:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_force_connector_basic@force-edid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send="true">Intel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send="true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-send="true">Intel XE#656</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) +24 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-metadata-sizes:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_hdr@invalid-metadata-sizes.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503" moz-do-not-send="true">Intel XE#1503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925" moz-do-not-send="true">Intel XE#2925</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send="true">Intel XE#2927</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send="true">Intel XE#2927</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590" moz-do-not-send="true">Intel XE#6590</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329" moz-do-not-send="true">Intel XE#4329</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send="true">Intel XE#599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-x:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@kms_plane_multiple@2x-tiling-x.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596" moz-do-not-send="true">Intel XE#4596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade-with-suspend:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-1/igt@kms_pm_backlight@fade-with-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@package-g7:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_pm_rpm@package-g7.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813" moz-do-not-send="true">Intel XE#6813</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@system-suspend-idle:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_pm_rpm@system-suspend-idle.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_rpm@system-suspend-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693" moz-do-not-send="true">Intel XE#6693</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) +5 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-send="true">Intel XE#2893</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz-do-not-send="true">Intel XE#2387</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-no-drrs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_psr@fbc-pr-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609" moz-do-not-send="true">Intel XE#4609</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-no-drrs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_psr@psr2-primary-page-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_rotation_crc@primary-x-tiled-reflect-x-0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4689" moz-do-not-send="true">Intel XE#4689</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send="true">Intel XE#2330</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-center:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send="true">Intel XE#2413</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@kms_vrr@cmrr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168" moz-do-not-send="true">Intel XE#2168</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599" moz-do-not-send="true">Intel XE#6599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-race-sigint:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_eudebug@discovery-race-sigint.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@multigpu-basic-client-many:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_eudebug@multigpu-basic-client-many.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-write-stress:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_eudebug_online@pagefault-write-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681" moz-do-not-send="true">Intel XE#6681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-sriov:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@xe_eudebug_sriov@deny-sriov.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518" moz-do-not-send="true">Intel XE#4518</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_eudebug_sriov@deny-sriov.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793" moz-do-not-send="true">Intel XE#5793</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send="true">Intel XE#688</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send="true">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +777 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send="true">Intel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_exec_compute_mode@twice-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send="true">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-close-fd-smem:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@xe_exec_multi_queue@one-queue-close-fd-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@madvise-split-vma-with-mapping:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-3/igt@xe_exec_system_allocator@madvise-split-vma-with-mapping.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786" moz-do-not-send="true">Intel XE#5786</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007" moz-do-not-send="true">Intel XE#5007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625" moz-do-not-send="true">Intel XE#5625</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196" moz-do-not-send="true">Intel XE#6196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) +14 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +757 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229" moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@pci-membarrier-parallel:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_mmap@pci-membarrier-parallel.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100" moz-do-not-send="true">Intel XE#5100</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@small-bar:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@xe_mmap@small-bar.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586" moz-do-not-send="true">Intel XE#586</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-3/igt@xe_pat@pat-index-xelp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245" moz-do-not-send="true">Intel XE#2245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@write:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_peer2peer@write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427" moz-do-not-send="true">Intel XE#2427</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-send="true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-vm-bind-prefetch:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-7/igt@xe_pm@s3-vm-bind-prefetch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584" moz-do-not-send="true">Intel XE#584</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-90.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send="true">Intel XE#6251</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-black-pxp-fb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-7/igt@xe_pxp@display-black-pxp-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-gt-list:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@xe_query@multigpu-query-gt-list.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-do-not-send="true">Intel XE#4130</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_vram@vf-access-beyond:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@xe_sriov_vram@vf-access-beyond.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376" moz-do-not-send="true">Intel XE#6376</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993" moz-do-not-send="true">Intel XE#5993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361" moz-do-not-send="true">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-8/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361" moz-do-not-send="true">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3hot-basic-exec:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-1/igt@xe_pm@s4-d3hot-basic-exec.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-50:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send="true">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-50.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993" moz-do-not-send="true">Intel XE#5993</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676" moz-do-not-send="true">Intel XE#6676</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676" moz-do-not-send="true">Intel XE#6676</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
          <ul>
            <li>shard-lnl: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676" moz-do-not-send="true">Intel XE#6676</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6054" moz-do-not-send="true">Intel XE#6054</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6676" moz-do-not-send="true">Intel XE#6676</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send="true">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610" moz-do-not-send="true">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send="true">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send="true">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894" moz-do-not-send="true">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send="true">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send="true">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send="true">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@gamma:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_chamelium_color@gamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send="true">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_chamelium_color@gamma.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send="true">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send="true">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-1:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341" moz-do-not-send="true">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_content_protection@lic-type-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send="true">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-32x32:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send="true">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send="true">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508" moz-do-not-send="true">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_dp_linktrain_fallback@dsc-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331" moz-do-not-send="true">Intel XE#4331</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send="true">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776" moz-do-not-send="true">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send="true">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send="true">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send="true">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352" moz-do-not-send="true">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send="true">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +41 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send="true">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +35 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send="true">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_hdr@bpc-switch.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send="true">Intel XE#2934</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6590" moz-do-not-send="true">Intel XE#6590</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486" moz-do-not-send="true">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020" moz-do-not-send="true">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send="true">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send="true">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_backlight@fade.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309" moz-do-not-send="true">Intel XE#3309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505" moz-do-not-send="true">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499" moz-do-not-send="true">Intel XE#2499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send="true">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_psr@pr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send="true">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send="true">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414" moz-do-not-send="true">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send="true">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330" moz-do-not-send="true">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send="true">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send="true">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send="true">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send="true">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450" moz-do-not-send="true">Intel XE#2450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send="true">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-suspend:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499" moz-do-not-send="true">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@kms_vrr@flip-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@eu-busy-10s:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_compute@eu-busy-10s.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599" moz-do-not-send="true">Intel XE#6599</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_compute@eu-busy-10s.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_create@multigpu-create-massive-size:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504" moz-do-not-send="true">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-access-userptr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@breakpoint-many-sessions-single-tile:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send="true">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_online@breakpoint-many-sessions-single-tile.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-read-stress:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@xe_eudebug_online@pagefault-read-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send="true">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681" moz-do-not-send="true">Intel XE#6681</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_online@pagefault-read-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-eudebug:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_eudebug_sriov@deny-eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793" moz-do-not-send="true">Intel XE#5793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send="true">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-priority-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send="true">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +37 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send="true">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-mmap-new-huge-nomemset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +31 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s4-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send="true">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-8/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send="true">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send="true">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-engines:</p>
          <ul>
            <li>shard-bmg: <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8667/shard-bmg-5/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send="true">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14218/shard-bmg-5/igt@xe_query@multigpu-query-engines.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send="true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8667 -&gt; IGTPW_14218</li>
        <li>Linux: xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1
          -&gt; xe-4253-2dc4a4ece453df925f995df5eac747a29081c180</li>
      </ul>
      <p>IGTPW_14218: fa5a1d825504ada31d8361835d8b934aab4a2314 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        IGT_8667: 2d7ec9a36c550c48af4bdd6e748f6753369ab8ff @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        xe-4252-4bae139bb961fd9df698b3bf15bf39f9bf9800a1:
        4bae139bb961fd9df698b3bf15bf39f9bf9800a1<br>
        xe-4253-2dc4a4ece453df925f995df5eac747a29081c180:
        2dc4a4ece453df925f995df5eac747a29081c180</p>
    </blockquote>
  </body>
</html>

--------------BGr2QzNMn03KEh8Agvz8a4XO--
