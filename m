Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6193EED7B95
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:36:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CA3F10E461;
	Tue, 14 Apr 2026 09:36:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHCb27e1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4258F10E5E1
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776159363; x=1807695363;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ej+ProY+XrTemKq10I0o0IkFp1mc9As4uH6wfrMmKXs=;
 b=JHCb27e1wJSReDU3NXZde/OgAOmTEy9atihgRdnWrKSRGyiMpbt9qV0e
 I5yMck0887nad3wa/cRa1S+Yz8aD3IBzhVO4mRys8WSiaXwH1RiB1LBaO
 ZbZ45ucZacIRl6/xvzj5Dlix/ubRtqnopowkJ8giwf4SYTeqYLsWN+dHw
 UzvBPGFVg2z1cPGTZuq2ikOmpuZWb6ySNZ3S6asVYflRmTWdeWQE+a8Fg
 rKOUFUZUjcP9j3GMGsmCjt3KDpJG+LsfxbPRLUEAT4FGsxBjmvWUv8Yib
 kZaVkLm7H5y5XTDGz/hiW8hNXUsVCJw5RE49iIEtI+bLuGECNhotVYgCn A==;
X-CSE-ConnectionGUID: mjRZYdg5SMm/OL7hWeqa+Q==
X-CSE-MsgGUID: KkHeAKQbTWaky6yaSJNzhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77016993"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77016993"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:36:02 -0700
X-CSE-ConnectionGUID: zvk9MWzRRsukeDCgUXZ3kQ==
X-CSE-MsgGUID: j4DQXxZaSiCTpyCd5Uby5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234977991"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:36:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 02:36:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 14 Apr 2026 02:36:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 14 Apr 2026 02:36:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4w7lU4nK2vd8Do9jtJMPB7DcbSLPMDXBroemSr+GAitNeINwX0o0MCfOuzUp4lsvNVv25tAwh6kfsyzO14/aS4Lcuc/6bNNvT6V9BHgiijmc4UKHS3CYUmJzB9u+npOqpqgDNmqlUi9iXq4W3IMpgRGcE6Fm+ozmBGIkd/rE0KGlSGkSPg/4z5Gqc9gBEFTF9LJo7nCJqjVW7tKMWGQfQgRsgBkd00yRfXI43HvGvGRg+Yts6R+u3HHOStLTpBS636AciH+Yo91ag+hafm1xUQx+F/a21jlJl3fTGSfLiX67JBzIbTFatygojvvEkw3uO2KodAX/4+s1o/jlIntcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wpd1JpZMhAq39J6HrNDyfq+WxXYpF4gVuiNfIYNQPOk=;
 b=e0YMGer4z88ioxZfVYFnHQEhimodfuwrjVAEKWAjnsWAbGz+LBJVEufwd4CSQACwxD0SZ1p4zqfnYnPIRkLGR5vlMOD5oX841XT8F1eaNtmY1eUHtGVbwuKgy68ZBO1HxmYvIS+0aCLw5/YuTNkItEpHnxpydOxmV+/e7asUdBYL4b3oy3+cBxbgFTOM4odvb5qjU2aMdXmbYAg8tt4XJU8q2+IanJuB5rjLbGLej9PnNEOxJnLybUtpxCNvS7XAlaXMVEiTXObtsMsR7gmJgxyHHez3UVEHtLRakqd6N0MgkV+SfjUz9VSvOr8dKm3oAa7FRyTs9OUHjB5Hk/fgkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Tue, 14 Apr
 2026 09:35:53 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9818.017; Tue, 14 Apr 2026
 09:35:53 +0000
Date: Tue, 14 Apr 2026 09:35:37 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] runner/resultgen: Insert attachments list
 into results.json
Message-ID: <yhjkjwbyv244n7w6hcaplvvb4hhj7ofnbjua3krba4jcsz6lij@5nfw7wjy2l64>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
 <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260413201722.808673-12-zbigniew.kempczynski@intel.com>
X-ClientProxiedBy: TL2P290CA0013.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::7)
 To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|SA1PR11MB6568:EE_
X-MS-Office365-Filtering-Correlation-Id: dcb930c1-5d1e-4e4e-522a-08de9a0938e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: Raq0SZ8dtnBs1KP/GvoZEYqHnUgwnNrQEeoSjKavQLPqUEf0aF4UINxvWJEa9tvKw+sr8fw7ctt1ycCKc+CH55+D56lLHPonpNQYvaWfA7J+lgcOHVDCNcPbJ91bwrfF7lmCo3lPjDVcnQbHHUMHA1geQ5A6zsxJQMoRhtBXqYgjcWghFcW72rHc1WGvreNch9T1lA6leaKxxZoVq36Kh1LZzh7WGRzzkV00fvQ+g0OyIWN2ImxIhbMdh0U2I9qvtmeCdElbed6GWhHuzI9lrazN6zq0faZok+xkpwJ9Xu7ipjI69aqIAlXdQ3N0TWTfrVTN72H4eh2gKLyNHBVWX4XO/442w0nqc1B22nT1fm8Wd0Ch/7U+V/1re3u3pp/k2qZU/5TJLSt93F9PGBlep+9ZNd7XLcUxqqsW5cYj61+TeNeAbDCsBV1Jo5Vakh2dnUOR+qzszXvqjlPxl8c44g5+bajBoPKBB9m0WTPoGfTxjAz8pT9cQI3T/urqANtpR+8pd0P8e7Nq6wOVxEGDSXCmRjoZOCO0s6KY9Ixe/JpeLO8kUsGz3Zt0jKzMTObuOc9lsv7xuLrWNvEw1MX54rXDnKOuCjbtLpuuMToh0r1mRPOnyCXArlMHrKwlnqbjUBslvmeCKxXEHZXtBL7+jGbGqzY0AyJpjBXH+bowxRTI1WFZIohda8QpY89jC+U7QsjvgOQL7xJ/kHwsxZ+wZPua6j4NorY1vQdgaT3DQMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHMvemdVakk4YkkwMkJyaXVENUNLQnEyZWFvZHB2bGVvVnBaUlAwUCtmZCtr?=
 =?utf-8?B?by9UZlF5cmFncjJBUm5WdUhIclpPUzF5SXFLVGVaSFl4enRvVFBxakFETGhr?=
 =?utf-8?B?OHpkSUZqQUk3QThiVWxqRkpBZ24vblF1cFY1WXN3UHk1NUgzQjUyRnB1d2My?=
 =?utf-8?B?SWV6bkpxTmFIdmorV3pHWnJUR2d4MVpoUVJsWEZnZ1U4STRsdTRWL3ViMlg2?=
 =?utf-8?B?QUEwOUNVSncvWkMzR2NaQko3bGNEcmJHVE5VWGNXSVVDajNWZmttd0dlcFVF?=
 =?utf-8?B?dmV3anE1d1dEbE54UUszUzA4N2E1ODliYVByNzh5d3YzaEc2UmZURDBBM1Zx?=
 =?utf-8?B?ZzFpTEI1RkdEQzVMc091elJVQW5xcE5ZV2lFbHhyaUUvT1FXV0xlNXlpMUdL?=
 =?utf-8?B?d3Ruck9PRXJlc2FPaE5wMlpaR2lCY3hRSDAzdmZ1MWRBeFpXY0RxSGdXR2w0?=
 =?utf-8?B?VGxpbThtYklXc0lqWFBXOXhXOXVuUlMrK2wrTUZ6Q3FmQmx1c04wQnViQ29n?=
 =?utf-8?B?WUFpVTk4WDNVMjVwUjJ5b1Jmb1JhL2NZTkpLc1ZjRFF0TjR1cXlGakVqcjNo?=
 =?utf-8?B?dUp1WjFJbm5xSXdyRC91VkNDNDBjOTM1eWkwMVpLN3hrOC9aU0x2bXRkTTFO?=
 =?utf-8?B?MGdaVmZWK0dGdUo1cjdhS21ML2lRYTEwaEViUmwxS3VlRFUyclJheW9PNFFm?=
 =?utf-8?B?cEdVSU11YUVZenN0WGdTbVJaK01zQlBtSE5tOUF4SEwzdlpMQkl5OTBrbmtW?=
 =?utf-8?B?Z3B2ZU1lTUR6ZlBHTkdyU3V2cUR0UnFUNE16VDNYa3JFVjZzcGNLZ05ydDJ0?=
 =?utf-8?B?SG9HSnc0UnZ2elBxMVl2Y3NWVi9MVm8rQ2JiU2NrNDVtQlk2S08ydUZORWxG?=
 =?utf-8?B?bkNiekNQZFJDdGJwWXE1UDRmbFRxMnNHb3BXaXo2UzZ0SWxhc29MN0EwNlJr?=
 =?utf-8?B?azNvMzlKVW1wbmNXWVlRdWxUYllwTkE5dDhySVFod0NSdzNhWHN0TGxtZWdB?=
 =?utf-8?B?VW5NcU9kd0JoSFFUeU5tNDMrd3ptc2taNHlUaGdNemVxcWdnK3d4VHJYK09O?=
 =?utf-8?B?TnJ5cWJPOTBna1ZmWWZubWllaU96VFJSODBzVUN1QVRwUE9pTU1lWENvOXR4?=
 =?utf-8?B?RDhPOHZHY1BmNDFiREpMZFhHUDF6dnhYdk5pSC83TnBBRmRMMVhpNjVVMmx0?=
 =?utf-8?B?SysydTlTeDFWZDVrMGtpNTg2ZXNQeXdYcVZ0THc3alRxZ055aWRsdFFYMmMr?=
 =?utf-8?B?ZUg0T2FhQURrMGVsL3FUNDV3ck5IWE5DcmUxVG9mTFRVcWJzZmR1YkZLbFBx?=
 =?utf-8?B?VkFpYmQxYVYxdHdBem1Ld2VYUkJJY2EyL1BXaVdqNlVOU2I0VXRtaXZIYnhT?=
 =?utf-8?B?ajdaOEZXMkdOWUQxZ2IzQThYTFFTa0UveUtucmd0MVFTdEQzZHlKL2oyWm5z?=
 =?utf-8?B?MEU3c1pwQjY0cTFzUHJ2MDJXRm0vWUdqdXVxSzNmdmh0QndwckF4aUlQSllO?=
 =?utf-8?B?Z2xkelpWUms4M2JkWlFkb05FNHE1TXNUdjk2L2RhUmIzRTVXcG5wb1EyVDBQ?=
 =?utf-8?B?Tm15S3BZYU9Rb0Joc0JUYnZ0WVJKWmIwZUgxaXQ5RmVjeWNJVEVoY3VneDFv?=
 =?utf-8?B?TkwzQ1ZJYSsrUVhnbHkyTStHUEFKdWpqUWZjWll3Q1pXaGJPVWgzbW9GSVBl?=
 =?utf-8?B?bWhvTkNzR0w4Nlg4K2xlS3gydllMVWM1d3BReXBuWkQ5eHpXRk5BN3dZdURL?=
 =?utf-8?B?MkxyVE5DMDB1RDBBZ0pqOXhmdjkwdXgrK0VqeGNCWjBwWnBLdGtWRG54c1NN?=
 =?utf-8?B?WGNWU3B5L1JYblpJTEtqVGVIbFZGZ2ExdmpPaVFVMHRFZkhoTzVsOS9BWmdt?=
 =?utf-8?B?TUtsTWFJcUM3Qk9pRzg1ZGFsTWc4a3V2NFZ0RzJYQkZBVk9aTkZGS3psQ3pv?=
 =?utf-8?B?bVNjN2o1dndsK0I4Wmt6akJsZXR4cXRUTzA1VG9XSmQwTmUzdGhySnplN2xE?=
 =?utf-8?B?amxKR1VSaERCb3VOSWtHYVo5Y0YrdHoyOU5LajZHY04xU3M2dUE3OVhzUGps?=
 =?utf-8?B?Y09PZlZNRXllVnZyWE0wQmR0MFk5RUt4eFVZZjROekdabXlJU3laSjNjaEVm?=
 =?utf-8?B?M1h0L1hsZlRoZmdsWXp6YS85dzEyQnQ3SHFlazFlMFlHamp2dEJLODZXanhG?=
 =?utf-8?B?L0ptaXk5aEZZUm5HR0U3anNHejQ5NGxsdlZEbFQ4MXlBZnNIN29qYXFUSDlI?=
 =?utf-8?B?TnNRVVNZb2pTSXE5TExOT3RBdmt4Rnd2WGNKWWFHK1ByMG5sWVk3QW44VGtP?=
 =?utf-8?B?TVdNMWgwUmkyQmszdlg1N1pRLytPekZBZUJORUpSU3hkU2lWRVNhVXBOVzNs?=
 =?utf-8?Q?DbCy/ljSw2RnwldQ=3D?=
X-Exchange-RoutingPolicyChecked: dLjNJmUT4Ahk/6axXPaDq3hLkT8gTYeyd59eOXiknuFAy5YiBXiO6G2hcm7LvudYDY0zW5RbrPg61Hg0xc/VoTJassUtWYNE+pEHIns5Khnof+vHjhALTzb5ZpUSMqynpkspJ3Ng17xSIb2Bn4ud15MdFDWBj7zfIIXYSks/yLB/m2+7flgZg5h1msH7hZv9mNOeM/svm7PIcOgdIjJwg+yloz9ErJzr0DjRgjex0XXm0tgSoTUNbbIgL3H8LZspz0H7M2ZGO5o3xYXZGtP5LNhXqYZR4SHMH/4O1r3jRKn6J6JX1J+nfgXwRMy9k19tdKh0HXXlpLbMcaus/EDRHw==
X-MS-Exchange-CrossTenant-Network-Message-Id: dcb930c1-5d1e-4e4e-522a-08de9a0938e1
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 09:35:53.4039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 043bs67nSEza5O5FuDLmxcnnjdvcF358V2woi9sWdSxSumQUsLARf7U8y39acK44S3Dswb0fFGuq02xVODCcf7k/RGu50Vee/SkwGmaFEAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

Hi Zbigniew,

[...]

>  
>  #include <jansson.h>
> @@ -1156,6 +1159,63 @@ static bool fill_from_dmesg(int fd,
>  	return true;
>  }
>  
> +struct json_t *tmp_tests;
> +static int ftw_attachments_list(const char *fpath, const struct stat *sb,
> +				int typeflag, struct FTW *ftwbuf)
> +{
> +	struct json_t *obj = NULL, *attobj = NULL;
> +	(void)sb;
> +	(void)ftwbuf;
Is this so there are no unused parameter warnings?

> +
> +	if (typeflag == FTW_F) {
> +		char *p;
> +
> +		p = strstr(fpath + 2, "/");
> +		if (!p)
> +			return -1;
> +		*p = '\0'; /* temporary for acquiring the piglit name */
> +		obj = get_or_create_json_object(tmp_tests, fpath + 2);
> +		attobj = get_or_create_json_array(obj, "attachments");
> +		*p = '/'; /* bring '/' back */
> +		json_array_append_new(attobj, escaped_json_stringn(fpath + 2, strlen(fpath + 2)));
> +	} else if (typeflag == FTW_DP) {
> +		;
I think returning 0 here is not much of a code duplication and
would look better.

> +	} else {
> +		return -1;
> +	}
> +
> +	return 0;
> +}
> +
> +static bool fill_from_attachments(int idirfd, struct json_t *tests)
> +{
> +	char attname[32];
> +	int attdirfd;
> +	DIR *currdir;
> +	int ret;
> +
> +	snprintf(attname, sizeof(attname), "%s", DIR_ATTACHMENTS);
> +	if ((attdirfd = openat(idirfd, attname, O_DIRECTORY | O_RDONLY | O_CLOEXEC)) < 0) {
> +		fprintf(stderr, "Error opening '%s' dir\n", DIR_ATTACHMENTS);
> +		return false;
> +	}
> +
> +	currdir = opendir(".");
Should attdirfd and currdir be closed at the end of this
function? Or somewhere?

> +	fchdir(attdirfd);
> +
> +	/*
> +	 * ftw doesn't support passing user data so *tests has to be
> +	 * set to some global for being visible in callback function.
> +	 * As results.json is not processed in multiple threads it is
> +	 * not a big problem.
> +	 */
> +	tmp_tests = tests;
> +	ret = nftw(".", ftw_attachments_list, 4, FTW_PHYS | FTW_DEPTH);
> +	fchdir(dirfd(currdir));
> +
> +	return ret ? false : true;
> +}
> +
>  static const char *result_from_exitcode(int exitcode)
>  {
>  	switch (exitcode) {
> @@ -2244,6 +2304,9 @@ static bool parse_test_directory(int dirfd,
>  		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
>  	}
>  
> +	if (!fill_from_attachments(dirfd, results->tests))
> +		fprintf(stderr, "Error parsing attachments directory\n");
> +
>  	override_results(entry->binary, &subtests, results->tests);
>  	prune_subtests(settings, entry, &subtests, results->tests);
>  
> -- 
> 2.43.0
> 

-- 
Best Regards,
Krzysztof
