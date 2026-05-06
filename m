Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4853CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 07:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5776E10E0B4;
	Wed,  6 May 2026 07:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g+GiRX3L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DCB10E0B4
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778051625; x=1809587625;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2wdkO9EBJFZAK2ElZwTcLr28iEHVQP0jyrFO1oODwhY=;
 b=g+GiRX3Lt9lzmSdZdlJZEsvh60uFqnekJWPEjcGB8/8KbMpCgLvlJDfh
 oxZA0s3Cb/CpWYgV71QY622VixNoC1052Kpt0WXtv5jNcoqtA2T5vKr4F
 eRmmFvzktqRUxYlsJDnDVEuHbFg3Jcc+OhMJE+/7toaVFn1IPuU2JhgS8
 LwyDKUErCMHSAtaBL3F37N/RxuevhRhhlcDwVrh2WVZkZvcDCzctEn+1j
 xJsn+T5L8Xbl0CrBxgWV3KHl/HDy8Ks01ueRGa2m+aeO00syNypJSxaOw
 69UuD0iSTui9RfleGhkAz26A0Zvoq4It8s6bfwrFHjcGrII5hDxay4C1c Q==;
X-CSE-ConnectionGUID: kHNA/6SDRUioX7b05ZN4xA==
X-CSE-MsgGUID: E4NFDQQuRUmhsdEG8BJP6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="104432664"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="104432664"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 00:01:48 -0700
X-CSE-ConnectionGUID: DSAOefrgQs6FalDGUxXQng==
X-CSE-MsgGUID: VHBXi+yKSQiW4/KstC8d2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="241051129"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 00:01:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 00:01:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 00:01:47 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 00:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qx+YGcXtTIicucuayc+HiH/uqXdqOAMoVT00LqDlHb3E4tDL/dqGVGIEHoGmeIX6HWEe2NV96gSdql7QxBDvzGB5/tEMnnt1en0bc8J7G19egSLpS4UWPaVItLrppkXGyldGv/6fWVzB0w827e02mS2rM09nG1I0y9t0jr9lc++dSBHOFOhfb79QhwDIfOiinoiHIlrmreypeeSekX7bVFcr51OFIqpmyPNkCrsovrF+kens/rhCGqdXyxAa1dfPldPGxvuvAgKVRmAYkdW595vtZxPnogE+ZpyEhX8L42L+GVdIFnH+GhCerLsoBdYKIAIWvCwFcBcKgUKvd/H09Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrEM2brv9VYJB44+t5c5QcOlg4sM9yCbvfy8JDMfV98=;
 b=AS09o+/1mGoBFr9d+D3DUDxF0Eteqs6ai0cuWBpOHI8LIl66DzHf+C9iRClyj0vNUsHNUiLCZX6sd4PHtlL0DdlUzh162ztKNqm8NCTMMWt509v5T2ZaQTYASkyIdHUWO9uNpHZFAXy6qeKJ72rSeqVy6rIEWXY6HRLXEslJYOAfE1ZI1eOeJQxNlDaSIJ6JF+0msYSw36V2svpM57M4MurLntB4gPb4L875bWHmGsm8T/DOrDyoyP6JSNAfPAZar7b3Fxe1m2sUGnVA1lSOpZB3FHrviXcLO3EfGWkRbLfD8IK1jxMS/pdqKeok0DpXedFUkCNumIfI4LDyECp1Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.27; Wed, 6 May 2026 07:01:40 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 07:01:39 +0000
Message-ID: <1e8bbade-75fe-47a5-818b-2ffee745e61d@intel.com>
Date: Wed, 6 May 2026 12:31:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_survivability: Update category and
 mega feature
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <jari.tahvanainen@intel.com>, <sk.anirban@intel.com>, 
 <kamil.konieczny@intel.com>, <katarzyna.piecielska@intel.com>,
 <himanshu.girotra@intel.com>, <ramadevi.gandi@intel.com>
References: <20260422113403.843322-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260422113403.843322-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: ba7f3303-04bd-40e7-d57a-08deab3d5208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: JU8z17kXLryYQXVXbyWJ5q2B+eUEBgc0iF3ufW1Ra7yNH24pBAFsYJtBBLufLYCeuef1Br84Cy06FhF5SD4gnhEr62QGMTaSMxDoWSdtlNDcMYAMshb1lrwQEOlsvezUcSEXAwBsIJPaEA87L48EpgYvnni1w/wYWjJraQU0K/cF/zDkKIpTfHZDVT5Lt7kbmKObI0qS/K4tfY2mQgKIncEwEgK5SmYih3GFvlnX8YSK17k+cyI6JXXI7Hoj8BqwAt1HYZLpud/9KGHRgFH/xC8yPBohBtGx7iB+44k26aXyw0BoQGXMRXt/J9D6xAt0rv3G2xIUthl7uL8dQxwomlU6PWDAzDuQhLhDaMej809G76dUkHzaxwqPgd6cUbnGE9IndRvmSRtdLKP+ztLyPwJVBSCST6IdDulIq50IcG9BRQ2/DLZVitKxFExAzBxYh1jpdF3EvOhrJSy2maax0+DbCf3wUW2sCvHsCIDflxd/RpLyS8QvJZ5+JAQmgxUTz+vLPibpVxYgj3WKWfLKKAt41/f9mg02SqV5CnDUN/QdS0/6gfZ54uOFPExw49xXB13Ogm01ZP37Z5/CNfb+08Bqv1FedtDF6ERTscP6jc7kHKC8AUp06FCaaTMy4pnPVsxKHcXqK7zIe0CYaYav3vvF8t5o9U5m0JR3KrA2C1smIfjzOdaZCy3SgE7I8Vsk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODBrdnJWSnlsdDA4WkV5NDA3OFRuS3QvS0Nwb3VHVkZsS0NrU0s2cDBPK1pZ?=
 =?utf-8?B?QUtOUkFSQUduM25CNmx4bkNIQkJwWFdwLzlRWUt6VG5xSS9UUTNKVmNvbCtk?=
 =?utf-8?B?cHYwd2lsVWR5a1JzTUo5UjJFVU1BYURnMlV3SGFRN0NVOTQzY0oxbzBZRVhu?=
 =?utf-8?B?ZlFSR0RCc3Y5UjNZRVh2ampkN2JZeDMyNmNXWjIrQWQya2NVVVNxdk9OUTh2?=
 =?utf-8?B?Y1FYSTNZRzlRTHQ1bHJNVHMvV1Rxa0g4d3BwamVlRlBEaDNWSjRmOUZabzVL?=
 =?utf-8?B?SUF5TWpHTmV1NUs2VHphU0I2aDZudU1yb2ZwZ0kzTVZzbHAyNDZ4V3R1NmNk?=
 =?utf-8?B?UGJhMExUb3lRWW5nVGF4ZWtSeC9uck1VN2kxVmZKQldTZjB0Z3JNZGM1WEM0?=
 =?utf-8?B?VUtJMW5KZTUvaWNrbEYzTklqNUhicWhWOWtLZ2Z1ZXd6TGF5QnIxbWZna05B?=
 =?utf-8?B?T1ZEazlHWGJOd3VZeEFSSDhRVmFBWGEyc2Z5UHRJNUQyREJwbkZXRytTdXRL?=
 =?utf-8?B?OEVwWjNIWm84ckRDbVFFQmltSS9vSElsaFRhMHFWRlEvU0Q0ODFaT2VPaTBX?=
 =?utf-8?B?L3plRis2TGVPNE1PVjVadkZPRlpSdG9wdGlUaHRMa0NxQ1RqcDU0bHdsS0l0?=
 =?utf-8?B?emFabTJVRlZEM0drbDZ3c2RYN1hzYXpGbUtTUW1ZUnZzSElsbUgwZDR0RG5L?=
 =?utf-8?B?ZnFxZDRyNUJ6RFhhMUI5ZWpIdkx1OTBaYVJVallvUmJ4RkRTMWJPSWFJeFZI?=
 =?utf-8?B?TE1NdnU4eTZqaVY0a1RweStmWkRiaEJxQUJUV3ZXUEFuK21NdkRZNW5VK2lG?=
 =?utf-8?B?REt2eXM4elpTeVhWQ0NWZkZCNGU2WXRNU0hFZzljRjg1V1lGaFk1bEZGcjBM?=
 =?utf-8?B?N3p3amExQ1o0clpXM2RWNHEvYy9VUUN0QW1TS0N0K2JIejBUOVBvRVlRZUlR?=
 =?utf-8?B?bE1hajh0d05abFFqSXNyR1IzckhGWUZxKzBvZ2plKys0dnN5NHB4YWVGNkFQ?=
 =?utf-8?B?SDNZMDRFNjd6a2dRVHVWM2RienlvRWxkQkNJWHlkdHRPc1VqamdZOEcyM3BR?=
 =?utf-8?B?VXFTckhFQnRabjluelNaaFZGVVRhMUkvYU82cDRBbzJjNzFtMHJOOXBoUHNX?=
 =?utf-8?B?N2pleVFWcWJNMi9MTVIxaDdaUVFLdnZrWWcvUkhiZm1HQ0l4dEVYSmhCYlp4?=
 =?utf-8?B?ZitHYVhjNzAycm9sbUgyUmQyYkVyTjZwa205TVcxTENuZHZjSnhhY1hyVElT?=
 =?utf-8?B?OElFQUhrKzlrdkFWSVkxbTdLN0QzRGNyNjNPYm1ocTB1RW96azF1WXY5dllw?=
 =?utf-8?B?NHZqMEhMY09JRUtUWEpQVHFsMGE1Q2c2a1JiUk9NWEdHU2hwSWk1bzVNdk4z?=
 =?utf-8?B?ckxsZmorMGN5SFRtNmw4VHpMb3VPVWtxYUxsSnFpVllSTkVDcGdQSmJYSzZp?=
 =?utf-8?B?THNpcmU1dElqYXZFd3dvcVhGYTRCcWxuZER0aWo0c2Z5RUplTjZ4UlQ2SW9s?=
 =?utf-8?B?elhLdFJOcnU1YVpuTFJ2bjNLeDdRS2h5anN1cUVBV3RhWmVMN3VsSVQyV0pP?=
 =?utf-8?B?bC85c094bDByVHBlaEJNTFdGMGZzUmpvNjJUN0FZYnU3WndoWXZoQUR3VjJS?=
 =?utf-8?B?UmRlaHl3NFlqa1Jicy9xaWRiK0xBc2Rub3l1UG1iL0orMUR4MG51OXZvS1lC?=
 =?utf-8?B?SXo0ajNiUEE0T0t5WndrQXNXVWtsK3NmTHNPekZFOVFXOGQ0Wld6NWpudTFR?=
 =?utf-8?B?VnZqVEFSNUp4a0xURmZPZWdaajFjSnZDM3JMT2lxOTB2cjhhcXRIV2RCZkh0?=
 =?utf-8?B?ditEWnN4blJVMHZSZS91eThUbjdBdzNldUxxMUwvL0JGSUFEN2pXUVRMMmxy?=
 =?utf-8?B?b1prT0dqMmhJL1FoN1IzdHkwYzJqWlFLLzRacHJnMHk2RDAvNFFaQ09IMjZV?=
 =?utf-8?B?d044ZE5ZOURaenlpTDNSbnIzZ1NZZWtKaVk3b0hWZk1wOC9BUEtIYmp6bFU0?=
 =?utf-8?B?K00yTEdpRDhrSE90RGpqdUx2M3FlYko4b1BZU21TanF6VDZZQjI5TmhERDZp?=
 =?utf-8?B?dlVJcnFxS0FOOVl3OUJrMDE2aVRKaWdjNHA3cmoyOTVNam9hd1B4cVBWSWJG?=
 =?utf-8?B?cUdWTzFjd0dWdm8vUjQxdWNuUHZ4ZXJWM2dYMzlCallxUDcvaG80KzhXaWRv?=
 =?utf-8?B?R3BKUm82c3pyYS82U3FFVWdLVnZlcWFHMEdCTyt2T1ZqaTYxQzFxV3B6ZmhV?=
 =?utf-8?B?MHhtdG1yQ0tqOGd2ZDlmRTczSjIreWYxNk52ajZNRkhJdVZkS1pMd0pqbzZt?=
 =?utf-8?B?N0c3aG1CM3hvSmNGNnpENnpxT1FXdGI4Qys1MmhxTDRDa0FIZWpEUT09?=
X-Exchange-RoutingPolicyChecked: tCsMQb3X67ABXmLoOu5O0utd24EnoSgTnVis9TKynX4WcSBbDo+grN0it9Mu7oKfy7UvbeUjRTkBmqzBoyIzfrrVai9SfgiGVHc2GF6Zh8wsVVjE4/l0T7N/KJwPGMGhRQP+rIV+ROQSicDQ+e/lAYGon+kdGuQqj3ju/z/eXK8+oXYj3C3On0pFzf+JC6Up5JfM5Ioq7Pvf0BOpVMflYq4W90KwiInUYGT+cj5Z4Ky1CZi1AgMQYRC26G9FfO/t6l1V5k0XFPKNMAHD1gE2EIm5RzYGeD66Z+vSO4mgwqFAWKcaS7V51gOZ4ZpwicOT3dluYCOBsTYD7g9zqytuAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7f3303-04bd-40e7-d57a-08deab3d5208
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:01:39.4855 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXYnh6rydTh8WfOBMOOuy6RMWCJKf7bJq60/5ZceVqsUg4GC+41bzLucSrLjBWDjA191BtFBbfcZjp2URJ+osQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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



On 4/22/2026 5:04 PM, Karthik Poosa wrote:
> Update category and mega feature of xe_survivability same as xe_pmu for
> proper tracking in internal visualization tools.

Survivability is not really PMU. Why not use the same category as hwmon?


  * Category: Core
  * Mega feature: RAS
  * Sub-category: RAS tests
  * Functionality: Survivability mode

Thanks Riana

>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_survivability.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> index e842a76ec..d5d7e048c 100644
> --- a/tests/intel/xe_survivability.c
> +++ b/tests/intel/xe_survivability.c
> @@ -23,8 +23,8 @@
>   
>   /**
>    * TEST: Comprehensive survivability mode testing
> - * Category: Core
> - * Mega feature: General Core features
> + * Category: Metrics
> + * Mega feature: Performance Monitoring Unit
>    * Sub-category: Telemetry
>    * Functionality: survivability mode
>    * Description: Validate survivability mode functionality
