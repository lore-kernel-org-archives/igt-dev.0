Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041F6D116F3
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 04:36:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8837910E708;
	Wed,  3 Dec 2025 04:36:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gblb7bHU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2693410E708
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 04:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764736576; x=1796272576;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cCQSOt6yNXejD4+UD3otGu0UP8siXL/gG3yegW4yOE4=;
 b=gblb7bHUCj3Ws622dqJOBE2cM+YjHoCVVopDZFJtdNFOsClVVw7BalFY
 s91WcuvqXkFCvkYH+trwI0H3bR7og2xS7caim4GuMxUjUlxSVChyZ4Wqz
 Y0tg1x1SAo39407+IginlO/BhxgpWeAXKgVK5YlZOxqtjLVUOkR6UH3Bj
 zgPd7r3nuGVWG5LH/rLxu8+KsxYA9by31YP9Frq5g3/t8rTI1aO1TBioA
 y6MhPleGD47Jb6Zv//g0/EutiVCuda2IfuWvrUNjCxOD9BtySP0TQiwsk
 +JS7uJbwCP8Jt/xbZCIWf83haGK9kkRRhwm2aGYQzBYTs2+XD4BnZ6ldE w==;
X-CSE-ConnectionGUID: WW85JrGIQreCcMzPBbH1BQ==
X-CSE-MsgGUID: HEH/6PI5SYu3jJDYZKE9iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70574928"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="70574928"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:34:13 -0800
X-CSE-ConnectionGUID: ILD/pvHLTsaOnFaTt+79gg==
X-CSE-MsgGUID: Gfu98sWkRdKv+jh9ZGmr8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="198735387"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 20:34:13 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:34:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 20:34:12 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 20:34:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wArtAvdqu5XEUYOclfLuc7w7dY96U1JyJTxPZgbAPLFcrJe5klaAV6Gw1IEvnEq80MmkFkCK3UFAuXEH85PPBQMI5bk+aajF6FA+T+GFgh9jpZag++rc5uavjSCR3dqpAKerJqjvSgI9DuQyFbpUELYe+Yi9pbumHp5b5nzn6jkAoGRqnFZygJfA/BLvytVWZYumj53JiRK1VhwsdEGf87oV/RahJHO+ErMS/p9AibRSR/gmI1CGC9ImyXuDpGI2fgTqX1i+2ycIrk0WxsVWDUQLYbLmlnhva0YIyVhiGSgV2OWDOTQ66OCcb/0r46LJoc7cMjA8aiT0ffdVqlPXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZGy2hRlprFr+fEEbNKR/F/aLM4ySdnQIdxtjrgD8Rc=;
 b=Ysjbu8HKGb5erOqOGpchxoCmvqFD4KSoW61NiEdsQud/ejfSLMsY8iCD/Xl6t+SfBwn0uOLfcigLggfYbDDx5di0JcFe4ea5I1DIrSz9rPUrvNueTgQJSIjeIb7+k+/CG2WIPDLV39CMVp68An0JppEpUZtFJ0c6kx5zlj/ZbQknhYw9EeGQ/PoCHnbLeUJ1KHQ2DQX30zZIL0dCSCeCZXXoIuFO5CGjUIRm28Pv3IlBMlk3HhBtFGLq+HE8sywExLtXDIhdLh5OY3QREzpkaqY8LLxi56ePNloJV+ZZbnRwykNW4m/CG8+4Qq2euRORyK3eZF7togXw2XiRj5y/SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MW4PR11MB6785.namprd11.prod.outlook.com (2603:10b6:303:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 04:34:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:34:09 +0000
Message-ID: <2551f420-0a31-4524-b025-728222c89400@intel.com>
Date: Wed, 3 Dec 2025 10:04:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 3/3] intel-ci: unify chamelium testlist
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <ryszard.knop@intel.com>, Jari Tahvanainen
 <jari.tahvanainen@intel.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
 <20251202180851.148444-4-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251202180851.148444-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MW4PR11MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: 82459d83-a7fa-43e7-0056-08de322533ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QXg4dlFLUVBJeDlrelFGdVkrbkdoSVlKK1pBM1NkRHR1ZmdVemFkenVRR3lo?=
 =?utf-8?B?WlZhZThzY1dyVVRvdzM4Y2l1TnBuMk1kckJSVXJ2TDhSSVpjRGdXQi8yQ0pt?=
 =?utf-8?B?N01RRTMzMlhCYVZOR1MzeXJHd3plZVBldmxjVzhuWWJCNmFOeUZFRG04Qjgy?=
 =?utf-8?B?clhTVFl3eHlZdmpPN3ladlBJcGhxVStlTEJIbGVWRk81djZrd0RyeUNRRnAx?=
 =?utf-8?B?emxHa1g3V2RkU2U0anNkU0UrZmlTNkpucnJFbGtrVEZPQjkwQmxBTGFpWnll?=
 =?utf-8?B?N0taU0JpbDFLR0JzZUNCeWF3Nlh1Ukw0NFNhYTNUeW0rVktyOStldWJBaW9F?=
 =?utf-8?B?YnBHcW54RjEzRHA5K09MVXZPbkJMekdxdWRYWXF5bFBFOThaU2RhUXRhMzNw?=
 =?utf-8?B?citaVG5TSnBSUTgycGNCSk9ud0N4NVI1eStldWovTGYvSTNmRjc0WnNlNGlP?=
 =?utf-8?B?UzI4MVk4STVjeDF0OU5nUldtcytaMG5MNHYvMzhYb3FnNHFHMjlManJXZTFt?=
 =?utf-8?B?cFR2eFJlVVpnQ3hCMXJTZmJuZ3YzRFhaZlhWVkNrRlRXUnVIVjFoMGNTNmV0?=
 =?utf-8?B?MGlRVU41K3p5RlE0VzlGNElnRThnM0RKNnMrMXNDU2hnMUUyRVNNczF6a0Fz?=
 =?utf-8?B?YllGa3FkRHZzcUhiU0RGeFlpWmxJZnBHT2NyTkgrOG5MWTlTREdzMnJKeVhF?=
 =?utf-8?B?d0wvZ0JOMkszbi9SaEZQUEJrTWpic2Q0d2xqRERDR0pzRkU2VDFXdGFraENQ?=
 =?utf-8?B?SytjYTM5KzJyc29qTmQ2UE5YOGprcmF0UWpvcWJoblBDYXFINE1CUXVHcCt4?=
 =?utf-8?B?TUZUNzFVSWtFZzZ6RlRXREFwL0RBNW1FS3pWTkNtV1ZCR1BGYWdEN3VnV0ZN?=
 =?utf-8?B?VDZBMjBiNnZtRWk5ZHJsTG9QK2FWc1NjZHFkb0tyTUxLWEFuTDdic2kxYW5p?=
 =?utf-8?B?Qy96UzdRSHQxeWxocUI1YmQ4NmI1VmtPUXcrU3dLdXlORXAvdklIZE41NFc5?=
 =?utf-8?B?YXI0N3FtcENzTnR2T0ttUWRuY1F3azNhdDRMc3o0YlFpaVFGekVwMmUyT1Fj?=
 =?utf-8?B?RURNQzQyNUZtTVd5TXVCSFNWMEphUWgxN2lHaFdDVDJsUXEzbTh3Z1plTGJW?=
 =?utf-8?B?YVh5MzRVbjRXZzhackRBdTQxOHlBMy9iRXpQV1JlYkQ0S2djOElGYnBTSHZ1?=
 =?utf-8?B?NTFiN1hZTGlQaHhRVGcrTnBkTDRNV3A4d3hMazBNVnBIQUtyTzRreXNiUURk?=
 =?utf-8?B?SWpFT0V3Z2lsQ3pITkRMZjgrRHM4QWVQK3ZoRkFxMENkOWpCTDZQeEZRNGx3?=
 =?utf-8?B?b3dSNlBlb0EwQ2pOemxrTGpndHB6eDJHTE16RmdadmFwUWN6QVJSUDRGMXpm?=
 =?utf-8?B?cjVYVFhGNlpBVFZneXMreGpJbzFHdU1OUWhZc0JQN2NFbTFncVhLeEovRUFi?=
 =?utf-8?B?TU8zaU1tQmNzK1ZGWWc1RVZrUmlaMDFLbmdhUkRQYkNOc2dhZ3dUeWJzNGpO?=
 =?utf-8?B?MFdncENyK0NiYlQvbzVSalpTNkkyYlVtajJ0RlNDMytYSHk2a3F2T21xVTE1?=
 =?utf-8?B?dThGYzFVTy95bVlIKzZRVDdlQ01hSDVmKzVLQXRVUTN2c3pUZzdPMU9qTS94?=
 =?utf-8?B?bUNxYXV3Y3R0VDU0MzcvVHh0dnp1OGJ3YjAvVHZsUy9TTnJIRDFodjJ1Vjky?=
 =?utf-8?B?VXA4cy85OTF2SXh5d3JpbmQrdmRKUUlNUjZYS0YvUHRLNDFMQ24xRk9DQnhv?=
 =?utf-8?B?SVBrcEI5S1B6SzhtbDhPdHZ3T2VSNk9uQk1oNWh2RzJmTG5SbG1leGR2ZFFO?=
 =?utf-8?B?bnNXcE5WcVNDMXN0elU5Yy9yNkNNOFRncjROVFZlTnppS2ZHUjRxRGw3ZWJp?=
 =?utf-8?B?d2ZhRG4zUHQ4SkdYUzFHMlRjdlh4eXJRWk1SK3J1dnF6RVNzaGMzZmhKblhF?=
 =?utf-8?Q?dCL2FcCBfUz84pKuhdOdS6sqBjFhaBeI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZE8wK1o2cWdmd3pPSmRvRlRzYU9UNXdybXV4TGt5Q3JmQnRkQ010RkFRdDEr?=
 =?utf-8?B?M3dieVcrT2ZGMmV6WkgySkw3NDl2eTNMNmVZSk8xSGk5NFNvTHB1d0o5bUZN?=
 =?utf-8?B?S0wzeGZwdFY2S0RLTXNOdk5SNFJDRllFb2tram42S3lMSW15SUR2VlN5Q2FW?=
 =?utf-8?B?WlJaNHpNZUZzdEVXdGM5cGlPZmFqWkJUWEtPd1M1R3JlSStTZzNvUUloM0Jm?=
 =?utf-8?B?UE1WSmlkbzZZNXhhUnBoSzJRcGZleUFqOEQ2dCsrSkFCRUcxUnl1MlRrQ01r?=
 =?utf-8?B?YzhWRmZXM0ZzaEdTcml6RElDeHRBWmpwSnlNc0oxY3N0NGNOZmVMZ2xOMEpT?=
 =?utf-8?B?N0Z4ZmhvT1B4eW1JVlZIVjJkdGNWbEVxUCs3eFFrVTM1TmtIaUdhZ3NDQks1?=
 =?utf-8?B?RzYyZ1VuOGJSeWxraURwYjBWQllNNm5HYWc5QlRlOVlwUU1CQ3pZTEFDSm1l?=
 =?utf-8?B?UEJoYnhKZnYwb3pwUUFHYlh3dS80R3NmMW9RNGNFUWZvdWRpWm1UUFNEUFJJ?=
 =?utf-8?B?M1lZQ2JZK3Q4TEx5bysweHRJMzJFRnM5dTZiUXQ5V1lGQWoxVG9rY1NaVFQy?=
 =?utf-8?B?dTNoMTVQUjFKTjJtcnJDbHRncjZZa2ZFS1NobGZVbVRaN3JUeitVekMyeldJ?=
 =?utf-8?B?LzFHSi9ZUFVta2hLNFQwMUk4K3h6aXBCSVBWYnlYNkJNejFQQVBHazVQYk1F?=
 =?utf-8?B?ajY5czRLemFlQmpDWkF1Qm1KL09NQU9UY25Oc09vWHhRT0ZZeHRsNWVZakpo?=
 =?utf-8?B?NTF0ZVhZT2FwSVhOelV1V25tZEg0QzZPdTlva2RzOUVpNnM2WnFjU0I1VkZZ?=
 =?utf-8?B?QVIxTXBTZVJaU1BHRHJTZGVyWHlCbEJGbW9xSit5ZjNzbkxGNm1oMnZTd21u?=
 =?utf-8?B?R1BGdkJKei9JMGErelBCK1BJZUxFcTU0bXMwb2h6RGhVMG9lVzA5S243Nitx?=
 =?utf-8?B?RFFiUDgzdDN5NUFYVm9hZXQrcDl1Y2l2UzBpUk5SMzczVHQrMzN5S1VaQzBG?=
 =?utf-8?B?aGJLV1gzNEZPL3d2L25uY2pLeHpGTWk5TUJJQk9Fa1FwemZCTHk3Z1c5WjZj?=
 =?utf-8?B?bWdFdWdTemhJOGVqMUVvQ0Y4aVVBT2h1eGdlSHJkUlMzTTh2N0Z4aHY4Wmov?=
 =?utf-8?B?Q2hycWJLNDJ3MU5kNXpaOEJETzRsSEFNS3gyK1pVRW1GbFI3eTh6RnlLb2RI?=
 =?utf-8?B?cGwyTDR6eWdaNVpYVURMakplakZzY09ZS29hcVA5UzgzdTN4dmRFUFVubTh2?=
 =?utf-8?B?Q0syMEZuRXhFWldBYnZtZHhJNWZ1SXNXVnprbzBaeG80N1pPc1l3ZXRnOENB?=
 =?utf-8?B?L3VQQmtsQzhyNGMxUmxVQTU0L1ZRZ0hSQU1LcVBkcy9UeW1ENkZ5VGJVV3JF?=
 =?utf-8?B?bm5RRjNac1hHc3pjVG9WQldlT3gzOE5zZTU1UXBjbWV0NE1GUXF0UkI1MldM?=
 =?utf-8?B?S2Y0RkwzMGlUZXRTQmJPM0VCMkRlL3Nuc2tEbVU5ZEN2TjZWY1BGOUs5bVQ3?=
 =?utf-8?B?Vk00QWhia09OeHBsRXlTZFFGL1JhS2ZKS3JZZGNLcTVHb0oxSmM5RUFaQzBj?=
 =?utf-8?B?dytaR09LWENIVGIydmpieEszNnE2U0tTUHYydDFPVmU4bHlXZUVtU0ExNGsx?=
 =?utf-8?B?OW11NmdCTFp2b2lqeWR2Ymt3TS9Ba2NEUmhTQlJYcklOdjZNWUE2eDJ6V3Iy?=
 =?utf-8?B?b3FndGU1NHovL3F6REthZXdkbW9nQmZxcTJQc1M2Qmx6NXhEa0JBMDgzZUQ4?=
 =?utf-8?B?ME9tN2JwcGlkNnlNazBQb3pPVVhJQ0p6Z2pOeENIbUpQUkRsc0ZJTDVJcHcy?=
 =?utf-8?B?RDduK01FZkNOYk9yZDBid1ZSR2ZOK01NUDV4c25UTzN6bk00Mjk5VEtRWmVB?=
 =?utf-8?B?b0dHOW9zem5KOHdNdDRrQ2ZjeFhObDBMM0dLeUhQZ0xSTGVIQ0tGNkNwS1Zw?=
 =?utf-8?B?c0Y0cmh2cCt2c044dTU1dkYxN1pCTCtMZW5sSisyRDd1UzZlaGtDUTdGTnlj?=
 =?utf-8?B?REtwdUo3NWFlWkZPM0M4K3ZKQUFHZnVKTk1JOW9mQmVjS1ZZczc4QlJFQ1h3?=
 =?utf-8?B?TTdyeXZEVmNLZGJZTnFESlhsVHpWYk1QejB5WmFqdGlHY1FiVmRSZGNVS0I0?=
 =?utf-8?B?dmtGVXVKUFlSaDFVbzd5Mi9WZWlVeDlmL1VRTTNLMS8xN1dKakNpY00rRERt?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82459d83-a7fa-43e7-0056-08de322533ae
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:34:09.8916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXjRb7wIM9er32HVAUrC9KkVPE86enK93Xus5c2fTLvlFj7QauJFddYMX2NBZ5mdZFKiYj8ntmkfeB8qibmqSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6785
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


On 12/2/2025 11:38 PM, Kamil Konieczny wrote:
> Both i915 and Xe use the same testlist, so make it uniform and
> move it to one chamelium-only.testlist file. Add also symlinks
> for it to make CI change easier.
>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/chamelium-only.testlist      | 70 ++++++++++++++++++++-
>   tests/intel-ci/i915.chamelium-only.testlist | 70 +--------------------
>   tests/intel-ci/meson.build                  |  1 -
>   tests/intel-ci/xe.chamelium-only.testlist   |  1 +
>   tests/intel/kms_test_config.json            |  2 +-
>   5 files changed, 72 insertions(+), 72 deletions(-)
>   mode change 120000 => 100644 tests/intel-ci/chamelium-only.testlist
>   mode change 100644 => 120000 tests/intel-ci/i915.chamelium-only.testlist
>   create mode 120000 tests/intel-ci/xe.chamelium-only.testlist
>
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> deleted file mode 120000
> index 3715a9469..000000000
> --- a/tests/intel-ci/chamelium-only.testlist
> +++ /dev/null
> @@ -1 +0,0 @@
> -i915.chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
> new file mode 100644
> index 000000000..99d2f2409
> --- /dev/null
> +++ b/tests/intel-ci/chamelium-only.testlist
> @@ -0,0 +1,69 @@
> +igt@kms_feature_discovery@chamelium
> +igt@kms_chamelium_audio@dp-audio
> +igt@kms_chamelium_audio@dp-audio-edid
> +igt@kms_chamelium_color@ctm-0-25
> +igt@kms_chamelium_color@ctm-0-50
> +igt@kms_chamelium_color@ctm-0-75
> +igt@kms_chamelium_color@ctm-blue-to-red
> +igt@kms_chamelium_color@ctm-green-to-red
> +igt@kms_chamelium_color@ctm-limited-range
> +igt@kms_chamelium_color@ctm-max
> +igt@kms_chamelium_color@ctm-negative
> +igt@kms_chamelium_color@ctm-red-to-blue
> +igt@kms_chamelium_color@degamma
> +igt@kms_chamelium_color@gamma
> +igt@kms_chamelium_edid@dp-edid-change-during-suspend
> +igt@kms_chamelium_edid@dp-edid-read
> +igt@kms_chamelium_edid@dp-edid-resolution-list
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@dp-mode-timings
> +igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> +igt@kms_chamelium_edid@hdmi-edid-read
> +# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> +# removed test as its having a mode 4k@60 resulting
> +# TMDS config errors on v1 board
> +#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> +igt@kms_chamelium_edid@hdmi-mode-timings
> +igt@kms_chamelium_edid@vga-edid-read
> +igt@kms_chamelium_frames@dp-crc-fast
> +igt@kms_chamelium_frames@dp-crc-multiple
> +igt@kms_chamelium_frames@dp-crc-single
> +igt@kms_chamelium_frames@dp-frame-dump
> +igt@kms_chamelium_frames@hdmi-aspect-ratio
> +igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> +igt@kms_chamelium_frames@hdmi-crc-fast
> +igt@kms_chamelium_frames@hdmi-crc-multiple
> +igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> +igt@kms_chamelium_frames@hdmi-crc-single
> +igt@kms_chamelium_frames@hdmi-frame-dump
> +igt@kms_chamelium_frames@vga-frame-dump
> +igt@kms_chamelium_hpd@common-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd
> +igt@kms_chamelium_hpd@dp-hpd-after-suspend
> +igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@dp-hpd-fast
> +igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@dp-hpd-storm
> +igt@kms_chamelium_hpd@dp-hpd-storm-disable
> +igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@hdmi-hpd
> +igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> +igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@hdmi-hpd-fast
> +igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@hdmi-hpd-storm
> +igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> +igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> +igt@kms_chamelium_audio@hdmi-audio
> +igt@kms_chamelium_audio@hdmi-audio-edid
> +igt@kms_chamelium_hpd@vga-hpd
> +igt@kms_chamelium_hpd@vga-hpd-after-suspend
> +igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> +igt@kms_chamelium_hpd@vga-hpd-fast
> +igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> +igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> +igt@kms_chamelium_hpd@vga-hpd-without-ddc
> +igt@kms_chamelium_sharpness_filter@filter-basic
> +igt@kms_tiled_display@basic-test-pattern-with-chamelium
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> deleted file mode 100644
> index 99d2f2409..000000000
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -igt@kms_feature_discovery@chamelium
> -igt@kms_chamelium_audio@dp-audio
> -igt@kms_chamelium_audio@dp-audio-edid
> -igt@kms_chamelium_color@ctm-0-25
> -igt@kms_chamelium_color@ctm-0-50
> -igt@kms_chamelium_color@ctm-0-75
> -igt@kms_chamelium_color@ctm-blue-to-red
> -igt@kms_chamelium_color@ctm-green-to-red
> -igt@kms_chamelium_color@ctm-limited-range
> -igt@kms_chamelium_color@ctm-max
> -igt@kms_chamelium_color@ctm-negative
> -igt@kms_chamelium_color@ctm-red-to-blue
> -igt@kms_chamelium_color@degamma
> -igt@kms_chamelium_color@gamma
> -igt@kms_chamelium_edid@dp-edid-change-during-suspend
> -igt@kms_chamelium_edid@dp-edid-read
> -igt@kms_chamelium_edid@dp-edid-resolution-list
> -igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
> -igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
> -igt@kms_chamelium_edid@dp-mode-timings
> -igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
> -igt@kms_chamelium_edid@hdmi-edid-read
> -# Chamelium v1 board HDMI receiver supports max 4k@30 resolution
> -# removed test as its having a mode 4k@60 resulting
> -# TMDS config errors on v1 board
> -#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> -igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
> -igt@kms_chamelium_edid@hdmi-mode-timings
> -igt@kms_chamelium_edid@vga-edid-read
> -igt@kms_chamelium_frames@dp-crc-fast
> -igt@kms_chamelium_frames@dp-crc-multiple
> -igt@kms_chamelium_frames@dp-crc-single
> -igt@kms_chamelium_frames@dp-frame-dump
> -igt@kms_chamelium_frames@hdmi-aspect-ratio
> -igt@kms_chamelium_frames@hdmi-cmp-planar-formats
> -igt@kms_chamelium_frames@hdmi-crc-fast
> -igt@kms_chamelium_frames@hdmi-crc-multiple
> -igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
> -igt@kms_chamelium_frames@hdmi-crc-single
> -igt@kms_chamelium_frames@hdmi-frame-dump
> -igt@kms_chamelium_frames@vga-frame-dump
> -igt@kms_chamelium_hpd@common-hpd-after-suspend
> -igt@kms_chamelium_hpd@dp-hpd
> -igt@kms_chamelium_hpd@dp-hpd-after-suspend
> -igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@dp-hpd-fast
> -igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@dp-hpd-storm
> -igt@kms_chamelium_hpd@dp-hpd-storm-disable
> -igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
> -igt@kms_chamelium_hpd@hdmi-hpd
> -igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
> -igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@hdmi-hpd-fast
> -igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@hdmi-hpd-storm
> -igt@kms_chamelium_hpd@hdmi-hpd-storm-disable
> -igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode
> -igt@kms_chamelium_audio@hdmi-audio
> -igt@kms_chamelium_audio@hdmi-audio-edid
> -igt@kms_chamelium_hpd@vga-hpd
> -igt@kms_chamelium_hpd@vga-hpd-after-suspend
> -igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode
> -igt@kms_chamelium_hpd@vga-hpd-fast
> -igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
> -igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
> -igt@kms_chamelium_hpd@vga-hpd-without-ddc
> -igt@kms_chamelium_sharpness_filter@filter-basic
> -igt@kms_tiled_display@basic-test-pattern-with-chamelium
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> new file mode 120000
> index 000000000..d7c492973
> --- /dev/null
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -0,0 +1 @@
> +chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index 917f18bfe..34453ca4e 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -9,7 +9,6 @@ intelci_files = [
>     'fast-feedback-chamelium-only.testlist',
>     'i915.blocklist.txt',
>     'i915.blocklist-pre-merge.txt',
> -  'i915.chamelium-only.testlist',
>     'i915.fast-feedback.testlist',
>     'i915.fast-feedback-chamelium-only.testlist',
>     'meta.testlist',
> diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
> new file mode 120000
> index 000000000..d7c492973
> --- /dev/null
> +++ b/tests/intel-ci/xe.chamelium-only.testlist
> @@ -0,0 +1 @@
> +chamelium-only.testlist
> \ No newline at end of file
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 559d46b4d..5645de181 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -15,7 +15,7 @@
>                       "include": [
>                           { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>                           { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
>                           { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
