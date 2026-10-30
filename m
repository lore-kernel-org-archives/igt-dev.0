Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BE7606A322
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PC5xBDJ7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5360A10E275;
	Fri, 30 Oct 2026 16:28:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C24910E275
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793377664; x=1824913664;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5/tB7ISsqnT5z4bc9XA2iBS1292vc0MvqPYhj4KXMUI=;
 b=PC5xBDJ77gda+O1kYGsTwwn6i08DJHj5rm7p0Lzq02mGXqlJH4A0lSNE
 FJWAZfX9MDY+TrpXQaXvWJXE2v1LjqecRvwDuRQbLRrTbr2EFxKtxnu/L
 y+jj8gnYHpB0Tlakjj0Ms6hBwY2oaZSjI1OXvXNmizEInDyVtxOHElMeM
 oBPLzoPAef1/ZQtqCyaFjEJVCt00Bjt83m3AFYAP2TMJ7of3MZPrf0u6x
 ba1IZ8uYXFJWk9p5WXlxGVBdGPA7uugYbQ5Bp5t967LDskcuiJMxPG/l3
 e1v5nOciWZBVSqRvc3XnkrU07HU7nGSg2BE1rPANPsWIBQASTYCret3vB Q==;
X-CSE-ConnectionGUID: oCAU2zZ5SPSIwQnVpmYWSw==
X-CSE-MsgGUID: Rbem5/JVTrCOn5ZZuF0eFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2148665"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2148665"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 09:27:43 -0700
X-CSE-ConnectionGUID: Cp/fWmc7SbeDjtq7lVNuSw==
X-CSE-MsgGUID: 3TzroKGTTnKIyV+xGgJfEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5855983"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 09:27:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 09:27:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 09:27:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.64) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 09:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwQx3PZ7mKVm1InFgyhOXb+38Fg6tL4UoDIj1kBtymdrPQsU2s8WEW1mwKOuot3F7rVVnT45qtkRNgknHpwlAV/HC08PDwdJF0bIWTxv36F1EZ/JwxGwrGi8vtFZnY19G3L3RUXm6sr45t5ZujDytZGjSORX2LSJiTtAjDz2gTW8G95C+yepNUZLrm9pLZoZULCW0fN03vrsZHMZcH0o4NX1+SpFuVvr7tg66aaBcLzuzf5zGiqKCF1dZT0Ybr1bzaWtUNmpaA2fEBsiMG1od0j1GPsPyTGnHpnjg7REkBpg8rc8m/N73RvUJWfSuArvFBDNi8H0JOqYlOtgRLDaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yTu9cpfK5qgyyuM0rVCv00p6HXTS/OhosK7On6GYaw=;
 b=UWEX2QVwo5Rq119vbedPi2k0Pd/oe32XkTvEZyJUah3k96T8HMarNxnbbPTWjMvk8uqvCrtImYSIwDlmNMMZUbroq2eU0iCb4Mwj3YT2tiTYkPot8JggcDCeM259gnjEmDC/wi7qkNvBpNNllPRCkyYXQ3bcoqsQy6Y6ON7kAs8DVJLGXidUImsoMkBfHIc4kOkaD2CGeHXgQpdz4kHcaXdDZMMs77laA+N7R5i5u0ZPNmXwyGShzDGqNYPQOSiPY7+GHWngKqVfgBAvZCzQrsOf0qWb9AEdyLVRq/7HS/A/Tko6XINIynIDKRNT1fYtnMF+fFmYZeJMdT+e5dUUjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DS0PR11MB8230.namprd11.prod.outlook.com (2603:10b6:8:158::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.10; Fri, 30 Oct 2026 16:27:34 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0569.008; Fri, 30 Oct 2026
 16:27:30 +0000
Message-ID: <b8737b40-980e-4e7c-ba3e-18892deed923@intel.com>
Date: Fri, 30 Oct 2026 21:57:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/10] lib/igt_drm_ras_nl: add get_error_threshold
 command support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <raag.jadav@intel.com>, <mallesh.koujalagi@intel.com>,
 <harish.chegondi@intel.com>, <kamil.konieczny@linux.intel.com>
References: <20261029085955.1232163-1-ravi.kishore.koppuravuri@intel.com>
 <20261029085955.1232163-6-ravi.kishore.koppuravuri@intel.com>
 <e5b9f13f-b247-47b4-b177-bc39901f5b0d@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <e5b9f13f-b247-47b4-b177-bc39901f5b0d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::15) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|DS0PR11MB8230:EE_
X-MS-Office365-Filtering-Correlation-Id: c02c6ec2-1414-472f-13b7-08df36a2b152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|18002099003|22082099003|56012099006|11063799006|4143699003|261026140227099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: fSwI3p5jSGuYdNxV38ZgNVUuxJ6U2OwvP5JRKH7CoiJ5pPXiyK5FSajkhiHkLJj89Y/l/ULiP9S7B+o9xp+hwje5vO5T0z7cWdjq7tf8pYVLRlt9dr3faUWk6k3kRIlz8/PqO40BqPr9+Iqcp/f9Ubl2m4iwQ6PS80tbUOI5PDnzh9v+3hkfHrUy/cAUw3Uf7AHK0WPRshcwDtt7ti9H6aPBthrzuslW53WeiGF3zL1JEddqznYWWDOje/44vxpQIyvejAhQYr/81r0XTkv1tEX7dPhDqMr1HXFjXD7w2iZovmHVe/m8kpVaBJP6V/AsiEEWyMik2Ki3ODogn/uS8lkXuE/gGoynNDbgd3yR/pa6tb2SXRDD36F7hJiPB0n/uEdPQU0VwI2oAMrl6mdFxBxfLO9773w1mjOOqhuYDgH9jCCWNUORIWFoabxxJNgu5INg/zlIye1epBtwXwqk3uO/Qy195/bOVVJOiBspV/Gd3OUAFclRli0MZVlUaprJgi3lL5ZcWAOz1AyanXjuXnezfZ2xNse8ykI0YniOwb5HUS7JErJVtbydky1fse0KwTbK1FmHjl+suUwaubcT0IRMPMK01gtAxV0yrvR8Ey7fJWsNLgHKyqwrCi3vJnJZWVgmL+XTK97OsfB5rqgo23NaZnicPw/C9uTVd8UcW+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE5KYU1XbmZPSnRQSUtjWmtSaEFOcjRPRzBxTm5lSjN2SjYvR3lRb3d1RHpC?=
 =?utf-8?B?T3BBZ2VENkhEWFJlakhJMFhlOTg0RUVwa0dvMXZydkZtRzdwL3hEN25Lb1pT?=
 =?utf-8?B?cjZOa1JxVEMvNG9ZclhkQ3VsMjRWR2lYYzNiLy9xNG01MGFKMk5EZU1OcFcx?=
 =?utf-8?B?czZZL05nRGxISXhIUG5YN1NhQXdrSTd1RStZcUI3a3Z0VUJUbm9NZXIrRzdt?=
 =?utf-8?B?ODU5MDdkYlRBVWJzOHUxa3RueGtDMkVPQ1NxVVhESllIN25mTzh1aWdYN2FR?=
 =?utf-8?B?dlZadmRhaW1Qbk00YWx3OUFtc1ptVUNHakZGM2FNcGZEV1duaHdKWTlGdEdp?=
 =?utf-8?B?RUhsUUhPOVgveEFjamE2b1pqZ3JTRnlvSmZoZHU3dC96U1Z1TGd4UVUrY252?=
 =?utf-8?B?MjIzMklJNmdDd2p3WXMzaC91U1haNnU5azg4VDRNaTY5S3lMNldzR0hmZXhK?=
 =?utf-8?B?NzU0bFFNTTBNbWEzTkZvd3NUT3dqZ2JObzJYczNnTzg3QTBoaWFnb3dSWEtO?=
 =?utf-8?B?KytSNnNicTJ2U0lBc0Z3Mm13WXAycGgwY1hMRGZuUm4wVzBrbU1FVWRFZ1px?=
 =?utf-8?B?NkpFN0FOVS9CTTNqYnI0VDlpZHFsVXJLTDZ3UVhwRlZ1b0NzV2t6V2w3TjFI?=
 =?utf-8?B?Q21PODZrK2VxZDAwQVZKRUppOWhCeUFpU29YeFk1akNnYk4vS2hxdmVEWDZs?=
 =?utf-8?B?NDlMK3dlNjhqL3dEL3BXWk1Qdm9Ud1RpWDlsSFN6SEVxQ0w3UXhKOHlEallv?=
 =?utf-8?B?KzR5SXozK3dmUXdHcy9UanNiSFBSKzM2dGFrdlZLRUJNNGdZVWdNZmVKM3NL?=
 =?utf-8?B?a0plUXFoYThydm9oQUFJTXhmSlJHMTc5M3pIempyVU8zaTl1a3ZjUU1ITHJo?=
 =?utf-8?B?NzUvdEloUEhDd2I5dTlRNUxHeXJOckFPOFpXTXk5aHVKLzhER1A1YU11ZTJv?=
 =?utf-8?B?cUJOYnB3M242ZUdsNDdCTkZHb1p5cHVmQ0FHR1VqWlhscXhLS3V1WnhxSFJU?=
 =?utf-8?B?dGI1dmYwNDZmVXF5UkJWT2dPUzBWNlRqVGNLeHlIYnhEK01YWi9qRXBoSmJW?=
 =?utf-8?B?bGdJVnJGWUpxS3lEV2ZKTXVOQUx4bXoxR3F4bjZGWUpGeGVhRlpiR1gvOVlq?=
 =?utf-8?B?UUhwbElKbXc1SVlGQTF0b3lHQnpLQUE4TDl3dmNIenpweTVvY1NzQXFOelYv?=
 =?utf-8?B?V1h5ZWJHekxmRDVaaGozODVGNkcvSHNrK1JyMmJSWGtaQnZjMENpaWQ5RWNJ?=
 =?utf-8?B?dC9mcnpsSUtjbVVhRHBibEJBQUdpRnpQa2lhYTFVeVBhN3Z1TVI0SkdtVmk2?=
 =?utf-8?B?Nk9SM3I5RXpSRGZEZEVFNjVsSW9EQWpyWmE5Tlk1YVBQajBiaTZjUm1GQ1hZ?=
 =?utf-8?B?NmhsWWZDeFVFcXVXekZzTlFkNm5hTng3YzFsNEdkOU1SdTZHcXMrL002S2FF?=
 =?utf-8?B?OG1zWE9FZVVxWXpJL3U1MHM3Y2l3aW83dUxqNmtFTlZJZlJxTmU4am0yTFZR?=
 =?utf-8?B?SXZxUTdKb0lYN0V4UXNvQ1FqQnlpd1FLQzBlcnhydG9IUFp1V0JTdVloeUNw?=
 =?utf-8?B?NFJRSWRGOTVEM2ZlM2NMZ0JZZFptWGt3ZDV3b2NZanhHbnFodEVWRzhweGhT?=
 =?utf-8?B?Q1p1WngyRXd0WVRrN3hoNEpUMnhYNzBMTE1vVlBxa1FYZlRwK3lXbzlEekxC?=
 =?utf-8?B?NWJDQ1I5cHJha0k3dkxrOUV4bDBUamlyWDk4WTQ5b1Z3cW11dDF3QXgzaCtS?=
 =?utf-8?B?T2QraXErRU40d1pNSThNTWU5WjJ3OEl2MHNqZTRZTHI5akhWNk5MWk9sMDZv?=
 =?utf-8?B?d3lBeVl1c2k3T0xTU3BJb2lSU1Z5dHY5OFFDUVl3bkw1cU8rdDh3VVdpU1dn?=
 =?utf-8?B?Vk12SjVwTWtLWE00amdEWnNPaUpUZU44eFpsT3pIV1dId0l3S05mZk5sZStZ?=
 =?utf-8?B?aGpRRmlSY2Q3U0QzcWJjbDkvQXVGZ2c0SEs0OTJteWl5Tmx3UEowVFBtUFlV?=
 =?utf-8?B?RWloY2Z3SkNIbVl0ODU5UWxDRHJzQXVYWXY1RWlXdWR3MEpOUHVrcHBXVnFK?=
 =?utf-8?B?U2x2UThJYzU2TVNjTDN3dy9YZFQyWFg0Qi9kaFpyTTBSZUlMbkpuZ1RUTy9K?=
 =?utf-8?B?YWo4MkJzRWUyS3VLWUtVdWJERm4wSlpPUkpXMStWd1doWTU2QVJvVVFXOUY1?=
 =?utf-8?B?cWJMSm04R0hUOGJxa3VqNjF0SDVzdGJhZjZGaXJpTHl1SWhtVnd2ZnNaWmFk?=
 =?utf-8?B?aGFFSmZQZXFrOFJDR1VLbzBrMU16Z1FwR3FyZmFZR2RSMjJaaDdCUHJHNm5R?=
 =?utf-8?B?L1JUa0M1VDdhQ2VaU3hjVkJnTGNFM25CVmlnSWQxVlY0R1gzNUR0TmJWUmIz?=
 =?utf-8?Q?fgxCMVOw6RVhG/ZoCn2Hb6B1Yb2dc7KDxbVh1?=
X-Exchange-RoutingPolicyChecked: athiwdKUqrvakC426g7G4OcdM83eKBIY4aNgXEzTfgdwclk8ZZVBBoE7O9N8LOaSNgnz8b3UA9TQ4sRGmuHk1Bb/R58wtLtG6NOcQMGIKU4INCh/XQA58SfXbL+IxROJGSzzlAIp4K+Pmq1AF4hpFo9tnQzRGUXyblMPY0FOb01Rq1iMPKtObfH0hIGGbXRH7JWMc1dIfSKMIAdxVJKisd8Wf44HaHJ8OVwDYfEnizUC8+J3R9godr7rECdKIaOiW9dW7mkLQa2IhAhEoFdCVUYWjiZABamW3PxMKO9Ztm41DtY6dx0BEQ9WZjF6BxywrwQjrGw4xSShaniGiPReGQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c02c6ec2-1414-472f-13b7-08df36a2b152
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 16:27:30.1918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41S+TTYFdb9lv2B6Lvigyrb2/rSWC1sKsS7QRj6IoJG7uWX3x8pc67vOdNFqxDafvPl61vKHwlzEGpoTEf2MjP39FGkNmBgtUZF+A2aM8HYrlzL52jut0TyPIadsuGIA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8230
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Soham,

On 30-10-2026 15:57, Purkait, Soham wrote:
> Hi Ravi,
>
> On 29-10-2026 14:29, Ravi Kishore Koppuravuri wrote:
>> Add support for GET_ERROR_THRESHOLD to fetch the current value of error
>> threshold
>>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v6:Removed normalize_nl_error() for standard errno in 
>> igt_drm_ras_nl_get_error_threshold()
>> v4:Renamed the library functions with prefix "igt_drm_netlink_*" (Nikula
>>     Jani & Kamil)
>> v2:Added a check whether error_threshold updated by valid callback or 
>> not
>> ---
>>   lib/igt_drm_ras_nl.c | 52 +++++++++++++++++++++++++++++++++++++++++---
>>   lib/igt_drm_ras_nl.h |  4 ++++
>>   2 files changed, 53 insertions(+), 3 deletions(-)
>>
>> diff --git a/lib/igt_drm_ras_nl.c b/lib/igt_drm_ras_nl.c
>> index 7e6a61f11..d930b6e33 100644
>> --- a/lib/igt_drm_ras_nl.c
>> +++ b/lib/igt_drm_ras_nl.c
>> @@ -75,6 +75,14 @@ static int ras_command_cb(struct nl_msg *msg, void 
>> *arg)
>>           ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>>           break;
>>       }
>> +    case DRM_RAS_CMD_GET_ERROR_THRESHOLD: {
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_threshold =
>> + nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
>> +        break;
>> +    }
>>       default:
>>           return NL_SKIP;
>>       }
>> @@ -230,6 +238,7 @@ static int send_command(struct 
>> igt_drm_ras_nl_context *ctx, uint8_t cmd)
>>       }
>>         switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
>>       case DRM_RAS_CMD_GET_ERROR_COUNTER:
>>           ctx->response_required = true;
>>           ret = nla_put_u32(msg,
>> @@ -280,6 +289,7 @@ static void reset_drm_ras_nl_context(struct 
>> igt_drm_ras_nl_context *ctx)
>>       ctx->reply_received = false;
>>       ctx->ack_received = false;
>>       ctx->response_required = false;
>> +    ctx->error_threshold = 0;
>>       ctx->family_id = -1;
>>   }
>>   @@ -326,10 +336,8 @@ int igt_drm_ras_nl_init(struct 
>> igt_drm_ras_nl_context *ctx)
>>       return 0;
>>   }
>>   -int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx)
>> +static int validate_inputs(struct igt_drm_ras_nl_context *ctx, 
>> uint8_t cmd)
>>   {
>> -    int ret;
>> -
>>       if (!ctx || !ctx->sock || ctx->family_id < 0) {
>>           igt_warn("Invalid DRM RAS netlink context\n");
>>           return -EINVAL;
>> @@ -343,6 +351,17 @@ int igt_drm_ras_nl_get_error_counter(struct 
>> igt_drm_ras_nl_context *ctx)
>>           return -EINVAL;
>>       }
>>   +    return 0;
>> +}
>> +
>> +int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>>       ctx->error_value = UINT32_MAX;
>>         ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> @@ -361,3 +380,30 @@ int igt_drm_ras_nl_get_error_counter(struct 
>> igt_drm_ras_nl_context *ctx)
>>         return 0;
>>   }
>> +
>> +int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context 
>> *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = validate_inputs(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ctx->error_threshold = UINT32_MAX;
> Could be initialized to 0 as Valid threshold are as 1..16

Agree. Although 0 is currently outside the valid threshold range, 
initializing error_threshold to UINT32_MAX before fetching makes it easy 
to distinguish a received threshold from a missing response. This 
remains reliable even if the valid range changes in the future.

Thanks,

Ravi Kishore K.

>
> Apart from this all LGTM
> Reviewed-by: Soham Purkait <soham.purkait@intel.com>
>
> Regards,
> Soham
>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (ctx->error_threshold == UINT32_MAX) {
>> +        igt_warn("No valid error threshold reply: node_id=%u 
>> error_id=%u kernel_error=%d\n",
>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +
>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>> +    }
>> +
>> +    igt_debug("Retrieved error threshold: node_id=%u error_id=%u 
>> threshold=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_threshold);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_ras_nl.h b/lib/igt_drm_ras_nl.h
>> index f51784524..86cfd79d0 100644
>> --- a/lib/igt_drm_ras_nl.h
>> +++ b/lib/igt_drm_ras_nl.h
>> @@ -44,11 +44,15 @@ struct igt_drm_ras_nl_context {
>>         /** @family_id: Generic netlink family ID */
>>       int family_id;
>> +
>> +    /** @error_threshold: Error threshold value to query/set */
>> +    uint32_t error_threshold;
>>   };
>>     void igt_drm_ras_nl_cleanup(struct igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_init(struct igt_drm_ras_nl_context *ctx);
>>   int igt_drm_ras_nl_get_error_counter(struct igt_drm_ras_nl_context 
>> *ctx);
>> +int igt_drm_ras_nl_get_error_threshold(struct igt_drm_ras_nl_context 
>> *ctx);
>>     #endif /* IGT_DRM_RAS_NL_H */
