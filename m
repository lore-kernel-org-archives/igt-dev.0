Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA966CA5FEF
	for <igt-dev@archiver.kernel.org>; Mon, 19 Jan 2026 06:30:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7014410E30F;
	Mon, 19 Jan 2026 06:30:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFkfOkFw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B463410E30F
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jan 2026 06:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768804258; x=1800340258;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M0aMCONHVci4c6ir9OqgTILbJCiKUSnICJtKYyC4GGI=;
 b=DFkfOkFwJLCzBg/H3kkvVVFRhWbJmZ9SbTbnxVVLpvcmsxT+JZeWrjvf
 S1CNk62sMz5V1SjoXFXDjDJBjJPgF74WppYtuzTG8voAKfmHRZrg/y1C8
 8OU5MzgjD+wooaETJlj+IGhukB2bi+3GylsDVg6dlQiB9gJqafp9GL17M
 QRP6mEkyzq8BGQ7Z/cm3tftR14vV5WnVP/0cW3p33XN2L+pAVf7Uuca9u
 1hzteCgzG8yGN5qoXouL5oHV+SMyZz/Et/Mct12FOzYQPFZh159E7OUi1
 BVYK5+mD3pBWtlAxSNFGmIkFfiJYWxxIxomgIl3HeyjHw3JAyML79PTul g==;
X-CSE-ConnectionGUID: MfcvUdufRduDYXyMWId+0Q==
X-CSE-MsgGUID: 9qu0Z/hcQlu6Zz+jj60SzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69922190"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="69922190"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:30:57 -0800
X-CSE-ConnectionGUID: 7Le+Tl43RuOnT1VTn3faew==
X-CSE-MsgGUID: DqcufG8eTb2bVtDK11EK/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; d="scan'208";a="206042351"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2026 22:30:57 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 18 Jan 2026 22:30:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 18 Jan 2026 22:30:56 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.59) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 18 Jan 2026 22:30:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mj8IfZQpDDXUIRfSLSMKBxhREEizj5ihY8Vj+ZPhd1SVhwm0S9vg9wOpPVRljmKWJNRRT5J985Xf1ST521n6LSd0ZzK8WkCKghKFf7PZIEKYXW2u79j3LhmGaH7vwJUSYILSxEYhESAQtNgyF8R9D3T4fYOFGd6Pd/+btFW0+SQqKXxBTAdia+/I99ADE1DqCRFWmM6wXQPGiREjYSgoUaDc0fxS0ITNXQPAxjujmLiCiyETpBlWsXM1Dnsk0RKF/WQst9Ym6tv4YN4h4lHwLYH9jN5FNZqzHL2ZkLTGnj9++AWFC6SKSHcOLU8gEJI57qcY6m4tZ48Oesx+bP9XsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAuY6Sv808CAE16mJqcFSfX4fRUErV7OtTE66NHbnjI=;
 b=F/p5XXJ0Ol6HAdpuHRnhn0+RMpSVnNa0ZQQJ6IqY6MrPe2TlSUe8l5MZgRKoUEFF+snMMzh/DriOe8xfsWhXemMGPp/o2hHzf4zpS1Isuckgd3GPbLdzNyAeJgvUgVEisurXCwwlu6ZeS8vf7YC7iGZm7fyI6rmQcKSBz54vCkBWjgGswI3pPImGtJ+9SFqgH822aHPvynXp3PcTOTei0xupv8kfNcgEtVtJgwKw7QvF2lIg1fX/OIA7iqmPCZOyVSlpjt79Rg9+WgZoeTxQc+vHxqpjrBdg+p/kSbQaB48SJru3V1WbX0T6Q5bevpXcQXnNZ8si3h8AiEekeIsMdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by LV8PR11MB8745.namprd11.prod.outlook.com (2603:10b6:408:204::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 06:30:54 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::cf04:8739:e8a6:ac3a%7]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 06:30:53 +0000
Message-ID: <f4dc1107-61a5-44d9-a343-3cd729f1ea6b@intel.com>
Date: Mon, 19 Jan 2026 12:00:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_universal_plane: Add vblank wait for
 cursor fb leak
To: Suraj Kandpal <suraj.kandpal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <jeevan.b@intel.com>, <swati2.sharma@intel.com>
References: <20260116060932.523060-1-suraj.kandpal@intel.com>
 <20260119062604.591288-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260119062604.591288-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|LV8PR11MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: f2049b90-d1c1-4e6a-29e6-08de57244ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlE3ejlnOFMwdm9VUWpmaTY1Q2FobXVlemN3dzNwSXZqWGQxaURtNTJPRXlU?=
 =?utf-8?B?dGI5d1hpb2kwMnNnSnNtQ3ExV2VkOTJ2L05UaVRLcnRYMFhMZkxnWHA4VnZu?=
 =?utf-8?B?Ykx3cmJ1THEyVVllRHZleVhZRHF2aDRmcmR2VW56K0FyaWtqWlJZMkVZUzhx?=
 =?utf-8?B?anBsWGJSMVFKaWRBbjJtazBMZlE2dkphZ2liT2pFNTV5ZWZ6L1BmT3gyZzR6?=
 =?utf-8?B?WlY2Q0Rtb1pKcFVWV0FqaUIvY0t3SUtrSVRROG9hSTBTRkszeEszWGZUakQy?=
 =?utf-8?B?WnlZWkp1TUc5SWZRcU5PZWdXaTgxUkMzZ0pHaVovdEd4ZmpJTlIzNU9ENm1n?=
 =?utf-8?B?VGphUlFQNDNyaGtsMGd3UFhaUEtiMmw5VVliaGh1R0FyYlRHa1NtSHRwcXlW?=
 =?utf-8?B?M3NmOXJvRm9tYlB6Z3o4elBCdC9sSVNJZUpORmdzUmVJQWdSR21LQlhkNUcv?=
 =?utf-8?B?RXM4d21wTnhnWWs5bUo2Ri85M1FtV1dvQXhVclhwQ2pBeDZzcTF6b2xnZnBl?=
 =?utf-8?B?eWZ4bVIwZVlSUVFxbDQyVEdxcUZITVI2SVNSQmtDaUFOSkxXVTFVMk9yT1ZF?=
 =?utf-8?B?eGlPeVFkTy9NeWg4eVFCdStDbWRtZHlKOU1mTUprOS9CNlR4QjlaY293N241?=
 =?utf-8?B?cTRYS05Yc1Z5UHZWdjVGcCtHeUNiR0FVU0hKK0hWdmpndyt5aGhFTHc4VjY2?=
 =?utf-8?B?bmRUeDFNWkh2OW81elFKK3NHRFFTaDl1Tm1BRVlZNy9VRTMzRWpRc2wrTGZ2?=
 =?utf-8?B?UUN2QmpCUU5qYXlWdTczT284Q3FjYTgvcmpnZk1DTlhRN0pWZVJzajQweE8x?=
 =?utf-8?B?QTNFUUhmU2lzOGQzanBmZFBESldFVGR4WWdUcnRYVWFRR2NjbjZmekdvY1lu?=
 =?utf-8?B?enI4L3F6dXZJRFRZNDhwK3VkTTJhdEJGWnphNXhxYzFLN0IwMTlXZWhPWXVi?=
 =?utf-8?B?WG9lVzFsSVhLOWVYUWFkRk13NnR4SHJNS1lGaFcwVGxFSjRKeEhBLzlHcnNS?=
 =?utf-8?B?aTNOS3hlNnRDaHdzY3d0ejhxTTYvUFJtd1UzKy9udGhKOTZnbUpER05UUEJE?=
 =?utf-8?B?eStvSXJKOHdQN244cTc0M3hwcVdYRFVPSTJXZmxXNFdtR0dyNkgzeU1XVWZi?=
 =?utf-8?B?WEFHNUI2SlBreEdOZ3gyOE1EU1ZjM0NFdjFRdFRPYm00RmxtZDJ3MXJkWWwv?=
 =?utf-8?B?OURnNDNZZldOcndNUGYvUFRsdDduK1hDbXQ3alJuQTZ2VW1jNm9iL2Izdkdi?=
 =?utf-8?B?NG5tWE5oanJRWWQvQjRDSU12aXltTVFyamhMMzNPaGRITmFjcE9rM3ltUlJN?=
 =?utf-8?B?MXRXR3FzVXkxVWw2WHBqNlo4YkZLUXhjekxLMkRFeEprWDlKVEl0RmtBeDdB?=
 =?utf-8?B?WFdqdzJvTDJQWlF2T3JsWUtrMEpwSDh3eC9XNEw0OTBKUWFaQUdrUzRNNGdJ?=
 =?utf-8?B?dU5hbGVPMjZWN01POEJlVEJ4eU83TmtaQzBxNEtJdTQvL01KWWVGc2c2TFhG?=
 =?utf-8?B?YXJUbERMRGhaQzM3L3FsMjdlY21HVUphbzlsNlhzb3o0WTZKM01nY2E5WjFC?=
 =?utf-8?B?bGxYUWI1SXk0cTNJaUVvOFRiajdmUmtNM1l4ZU1FcjU0d2NhVExoYmZwY0NX?=
 =?utf-8?B?Qkg4b01sM2VZMGNkQmd1TGxlbldCNmNmMEExWkZiTWF4SHBBblJYMFZ0YlQz?=
 =?utf-8?B?MDVER1JGSFhPWmVxUGFNVWNWN3ljRFdmSWxsUEd0WjgzaU5tK2VnYjlPTnFL?=
 =?utf-8?B?bEo1c2lWTE1KWVdwWDIzN290eVdzOFdWMGhpcHZVRndoZWdPemkvbldnbDVw?=
 =?utf-8?B?Z0dFQUYzSWoyQ013SWlKa01IV0pQTEpaMXpWYmVBaW92aGNURHRtZjU1YU15?=
 =?utf-8?B?MnVMS3NIcVhuM2RITVdGWkdQU2RpemZPb2Y2UVJISFN0VzBhejViWDViNnVG?=
 =?utf-8?B?QnU3em14L3BZd3RuM2d0TlZkTVEyZUFGak9CNTJBTjM0MjlMRGkyRXFCc2Vs?=
 =?utf-8?B?TjNmSzRPTmdhYS9kcE9vTEhKVHVSbEdwcTAvQkFtL2VuY3h0K0xTaSsrRk1Y?=
 =?utf-8?B?K1pXcFVRcTZxSDh3c0JySVNHUW4vUUJNcTl0em9TRDQ1d2VuclpPNUpIZVNW?=
 =?utf-8?Q?Laxs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3B1VUJaU042TTloMEM3YUJ2K0ZUSkxoRWdJNGI1M1NDZm94V1VEUmR6aHAz?=
 =?utf-8?B?U2Vua0JnQUlKTHlqTDM4dm9xVlN1amlrS2RqMUJXcDBjNERMSzY5Y0dwMFJS?=
 =?utf-8?B?a3Flb3J2aERnUG5XQmd0TlJ3ZUJZUS9TdENIQmVaTmJxWjRPUWphNGsxTGM3?=
 =?utf-8?B?ZnhZYmc5TXFBV203S25NL2hPcDNJVEFFUUVHc0pkaGxWTE0xRzM4eEIvSGpL?=
 =?utf-8?B?QXA3am93TWdleXJKbzkycW1ZV0xXb051ejVmWHpRM0VCOTRnYkxLTFcwdmYv?=
 =?utf-8?B?aFdMbXdEN2Y3TjhzeDU1eFZZSHhLam5nc0lQU2RHMzNIQWlteCt1UTVRSUMv?=
 =?utf-8?B?UEU5Ky91eHVtZWRRVG1teUxHelNyVWZ6bHdDNmQ4UHpaWkRQZkZ3akVxYUFv?=
 =?utf-8?B?UUE0azI5YlU2Y3c0WUVNSzlxOTFWRHpKaEU0K0FoQkZ6RXpWZ0lyZm1jZ1dq?=
 =?utf-8?B?b1E3RzNBcVdmQmM4S201eFNJckN4dTR5T2gvalhlWDlYM2tsVHVqMzA3QTR3?=
 =?utf-8?B?M24wMFFod3VQcGhzN2xnUnF4anIwbzJ2SWFRTlBjQVYrZEUrU1ZKYVJ6b0ZP?=
 =?utf-8?B?QVY1cHZaSHdMQ2VycGxhek93a0N6ajRqSi9hTnlxSkJLanVjUHdteFFHd2tj?=
 =?utf-8?B?V2laL1gzYUZjTWdldXhQcDgvNGZWNFlEemVibzRrWG5xNkNuL3FXM0NPL3V6?=
 =?utf-8?B?RXNtOEZMZEZKakR0bFVJUTZ6bmhjZm4wbTVrVzQ4VnQ5NGM0RTBGRjlmVTlz?=
 =?utf-8?B?Y2tHaHlFL2pSVVJBdlUvR1FYcVJIYzZ3emo3WERhUDBuNFNTNGVQMjJFL3Zm?=
 =?utf-8?B?dXhLSEg0TUZ0dy84ZXdmQURvbmswZ01Sd1JlVjFPdTRvaHRlY2RpWnI2UXd4?=
 =?utf-8?B?akRIWjIremJ4ak1PdWJsUHhrT1Q3R0lZSGVqY3NvVE5yS2syaWhFWFp1OHdG?=
 =?utf-8?B?RHY5YitRWVgxM1ROL0tlNjlrRXFOZDdERUViOGh2b2ZjM1FDQUlvZ1VMeWFh?=
 =?utf-8?B?WXhKdEs1RzRISEFHeXpBMTJZaGJQTXp4Y3lpWEovNVpvQzYxUDZoUU9hdXJS?=
 =?utf-8?B?MU9MaDJPY3hBUnYwSnNlV3pFeTVQNjJIenZnVTlodGdBdWMrenM5UFl4V2RB?=
 =?utf-8?B?Z08vMFZOTW5oNDJVWWkwUkxsdFdteWYzc0gyUkF1S2pWaGVtTDdZaWNpMENQ?=
 =?utf-8?B?ZUZITFlLdnZ4TUVQemNhWDJmRDdLVTRwVnpkZXh2dGNDNXdlbmdLKzQzdENU?=
 =?utf-8?B?bm9hcjdjUEFQZ3JNS0pvUnp6d0ZRbFhUUytFcDAvcWVWUnFoaHdBSHJGU25x?=
 =?utf-8?B?WlJlVjhabWlWa3BSaVM1MTM5YXVCVVlWMEEvaU1jYmc1SHphK3lMMTdWamRQ?=
 =?utf-8?B?WjNRLzZiS3E3TkN4SlIveHRuVzlmVmY4Y1JDSXljL3FJZEZGV1A2aHV6RkVD?=
 =?utf-8?B?MzhieHc5TUNIRDN2TzMrRnNyV05YN0ZUTElESFUrU3lMeEJISWQ1c3BRSGdJ?=
 =?utf-8?B?bGNacy8xY3ZwUE9KMElyd01hRUhJWkpPZjRVUFZvVjJxNElkUDNNL05JVWNi?=
 =?utf-8?B?RVUybS9LS0tleGkzR0NIeWFyb3NGa2d4ODJIVGdNcm1ZSyt5RjcvWEdHTERz?=
 =?utf-8?B?Ulh5TVJvZlo3aGFqYnJOMGN6c0JiMWhRSjRVTlBOZEtsMVBybTRpU0ZGSjFD?=
 =?utf-8?B?eDhxc0NiZ2s2ditLNE5vNk91Z3NEMzBpWjlnS3gzNjZxV0tNVlZ3aDBvY2Rh?=
 =?utf-8?B?eU5RT09rZGhtVms2ODZXUUZkbVdHTXVnTUlrekpyVXdPS2RQT1hOM1MxK1h5?=
 =?utf-8?B?NXlGZ0NWd2RNVzVFbm5PSnZ2dHlOMkNrRzVBSG04UWQ0Q25ad0NtY2VQcmVj?=
 =?utf-8?B?UmpxZWsrcWJWb01FbGN4Z3RRWHZ3RUh4YXV3SXpGWGtsaU5kVXQ2TnRCN29u?=
 =?utf-8?B?KzV0U3dlN3JpTS9NSEpncW53YUREVWo5STlrLzJvWmhHcjBnK3AwRzJQLzZ6?=
 =?utf-8?B?OWpIdk9mMXFjNE5PMjBJSXJjT3hnYnVBQ3VYaksvbjFISWlIc3JFSGg2bFZD?=
 =?utf-8?B?SEVPM3JIck9aSFV4d3hWdmlIT1l0MmRaeVg2S3NuTjlzSHZ2YW51aS9GaXZn?=
 =?utf-8?B?c0lQTGQ0ZkdXY3lDY3dFVEtJYXlwQU4ybDlKSTFWU2ZyeWxQUTFMcmFHNHVS?=
 =?utf-8?B?WGloMFpzeFhwL0FSLzhkVEk2ZVMvZTZ1WDBKTDIxdFVtWk1Sc1NZWVJLd2ZO?=
 =?utf-8?B?TDVuME1VZjZPNXQ4c25rU2E0RmZlaVZ4aWowRHJBeWJWSVcxYURBL1J4R2gv?=
 =?utf-8?B?c3BNYU1mMXd3c3hvaGw4WWxFWjMvcEp1aHZhWExtZit0ZGp5RHdVZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2049b90-d1c1-4e6a-29e6-08de57244ac5
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 06:30:53.3536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SovBb1+KeJ0sGym9kSjjCvApIrzzVBRagqlGERQC7Q+mMUYcdBnSMc/i0nytSDzUob/dChmAclq8+NOyRIkZtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8745
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


On 1/19/2026 11:56 AM, Suraj Kandpal wrote:
> Add the vblank wait even for i915 as the legacy path uses the
> vblank worker to unpin cursor fbs.
>
> v2
> - Add closes tag [Jeevan]
>
> v3
> - Pretty up the comment [Karthik]
> - Use is_intel_device condition for the vblank wait [Karthik]
>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9196
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_universal_plane.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index aa5927cdf..49dceb1af 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -703,14 +703,15 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
>   			    COMMIT_ATOMIC : COMMIT_LEGACY);
>   	cursor_leak_test_fini(data, output, &background_fb, cursor_fb);
>   
> -	/* Since unpinning of cursor fb occurs during vblank in xe, we need
> -	 * to wait atleast 1 vblank for driver to remove cursor fb. We need
> -	 * 1 additional vblank because vblank event is scheduled before
> -	 * unpinning. Therefore add 2 vblank wait to ensure that all
> -	 * cursor-related framebuffers can be removed before counting the
> -	 * framebuffer.
> +	/*
> +	 * Since unpinning of cursor fb occurs during vblank in Intel
> +	 * specially in case of legacy commit we need to wait atleast 1
> +	 * vblank for driver to remove cursor fb. We need 1 additional
> +	 * vblank because vblank event is scheduled before unpinning.
> +	 * Therefore add 2 vblank wait to ensure that all cursor-related
> +	 * framebuffers can be removed before counting the framebuffer.
>   	 */
> -	if (is_xe_device(data->drm_fd))
> +	if (is_intel_device(display->drm_fd))
>   		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
>   					  2);
>   
