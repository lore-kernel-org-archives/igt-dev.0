Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC28ACF8842
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 14:22:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A35310E0AA;
	Fri,  4 Oct 2024 14:22:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iL1TSMeH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A818410E0AA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 14:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728051733; x=1759587733;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ik6zo2wplwZ8Pkbya5zt8H2E+lZKU5HCHuVj+yJlwmc=;
 b=iL1TSMeHvTo8kAwgtyZJali/lXvsW+tY+jOTRBKhiTXHgr0Pk5UKgNQt
 ZRd2lal3+EL8fwPp7WScNmU56545pAGxO7/LlWxQEDxaJ3gq7uv6fGbA5
 gNFVh7T3x32HWIAIf6lJWcfo2J+43lyS9WgCFR/R/2xlk3Ax1gVKy6HRT
 l4BC4ou+ETAmiBajIALQw85x6vTM540YOXk1ACmDE2f4bqztu8l4xAriH
 PprvxezJzodLgbWvWhFHeBV1HdgZHPvobsGvBtlynh110oGI3KxH+0Vdc
 KfQFy6fqEiV/laOqg5KdV6VQjBO49jdsDYF31kHcv48Mg1Wf8QLO2Hm5c g==;
X-CSE-ConnectionGUID: vMg6p3lYQq2RS65f4rDNsg==
X-CSE-MsgGUID: StBKofxLQKWQ4ke2uQ2zWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30982976"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="30982976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 07:22:13 -0700
X-CSE-ConnectionGUID: XpTQWPopTJaESsSvzsZc6g==
X-CSE-MsgGUID: PnS0hNxmQd2y+Cm+K7OuzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="105562695"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2024 07:22:12 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 07:22:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 07:22:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 4 Oct 2024 07:22:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 4 Oct 2024 07:22:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 4 Oct 2024 07:22:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WnZYEfRapa7pqvJnr0cXaUVHEkfUBE/QeivwzrrpHbdG6mDqWtMW010fXzq2v7VmY3oGZPCrsv3pHnZJT3COA/uHqVNUchJMITGQsUKY+UtjsbJqcyfRZVX17mxEYBAaUE+9AH1cD461drTyYloggWcazcj0CeU/JH+u+eVLtom/h9K/SV4tJCOvQR+cJEF2d+KoWnjJPQEGysitzbCEJQNgl1P1s8Zy0HOWInIf9jxdd1PjXHIIiNtXPyyb/rco70bnWS/Z5JeQOlTMuz5Fd4wbwoVhwE2fCE0j2lQ8MQ+Lb2ojrIqLUy9XkJ2NuQnxlQzkTCK76heIrIql4V4JTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=303oaF1r24nHnS9ZwWFf0WrVWV5T/5/jZ0iAWW/By3E=;
 b=UX+JAmf0Roei2+grYGw1n5I7C9zFg8wwtIRo3igp+ypgM+lSxbBkvAnDowPR+YxuNylrA6btXx+szHNt1bCq/ZtDxR6cGm4diWILToVMcDmbOY+sliHclyIjjKlrWTfvqxXRXgmxkaZTDD0XZb3gLtwo6rbNvUuRsuCCCJ/GfDqcl64DOMeRml2puoUvNaUbKKkFlzPRsRCX7pgBy58rZq1symEMCQm3mF6vW3J/i/o6FgUcCU0jZUl7/COik5mSTs5LAwVIUaW7oG9hL5Ykh981PPIM2JHejjxBjdXejvB9xISfCFhdqdvlBl1Q74LyeRlW6IHPUfKaLQTH5528LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Fri, 4 Oct
 2024 14:22:07 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%4]) with mapi id 15.20.8026.017; Fri, 4 Oct 2024
 14:22:07 +0000
Message-ID: <d790ab39-cdc0-4ac7-8629-e2e993c10cb4@intel.com>
Date: Fri, 4 Oct 2024 19:51:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_pm_residency: Skip on
 igt_power_open failure
To: Jonathan-Cavitt <jonathan.cavitt@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>,
 <kamil.konieczny@linux.intel.com>
References: <20241004135820.1800808-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20241004135820.1800808-1-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::23) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 06057dad-0256-4a22-e488-08dce47fecd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzBQTlRjc0g0TDZzMDlPa1l0SW8ranBKTTdTTUVGYXZGQmVCLzM2R2xQWHBs?=
 =?utf-8?B?cnE1TDBVYmFUQW1oMGRBVjBjVUxXZkwremhHK2E3LzdTSDRVQVR3RFRsOC9M?=
 =?utf-8?B?UW9sK3pYUmZQV1JKUzZqbnF6NkZmcWF5emE4N0s1M0FkM202UmFtS3JkMTZv?=
 =?utf-8?B?aGd4eVluR0lXOEhwdEQ2eGtmeVFrWndrMzQzdlJMV3BtVnpBT2paWlBleVBG?=
 =?utf-8?B?VTMwY0dvL3ptdkk0aHFGait2RFlPVzNKNUZKSGlFbVAwMkRySkJ1ZVFOa3pk?=
 =?utf-8?B?WTJmY0VKYks5TUVySm5zR05iaysrZkRndit5ODZGTk5IR1UxQlcya0hsSnND?=
 =?utf-8?B?NVFaWFR6OEczYS9YK3pBdkp2S1RNWkNQUC9CckQ1Z1ZQMlovc1lINXREajdt?=
 =?utf-8?B?cUIxbWpLc2c4dUhNZlU0emtPWEVmRWNjcDEzRFZDa3JjbUhCODk3Q0s5OGhh?=
 =?utf-8?B?NFZtV3dZR1k0dVh3bVpPUmhGOUxMRURoZnJ6OFVHT2o3ay9wd08zMSsybSta?=
 =?utf-8?B?QmxPSmZGeXFlTG1IOEVVaGRDeUtNUnNYTmJqelAzNUlHTzRTUHpuSW9VNlZP?=
 =?utf-8?B?Y09FbVVtWVBkemF5eG5JcEZmQW4zVVM0MmJIc3J1SDA4ZWkvK2c4MVVxNFg2?=
 =?utf-8?B?a1M1cEhrZFJSY01iTXJra1RTTzhvTk9BbG56a2JveHdCN1N6bUQwU2NGSEIy?=
 =?utf-8?B?aEM4akZBcHlTNmJSRCtlTVN6Z3g1aUNoWVBxMFR1MWlHS1N2M3I3MXFVSDBI?=
 =?utf-8?B?dVQ4aGNJRURpcFgxZDhZRnpFaGNyQzFXTnh2MXU5UFl0ODUvS1ZRS3llR1hs?=
 =?utf-8?B?NEtneFNudzlxOXpJT0VnelYzVkRrL21WTFQ5cEpudXVsOElUUU1JM00vMG0w?=
 =?utf-8?B?aGN5NlRyRnN5QkwyVkFDZStvYmtScmIxaUxiMEU1R3hGZDJlVEFZbHVRc3JQ?=
 =?utf-8?B?MmNoT0NXL2t3U3F3bkgvTzVsQlBvdG9BTExCell3RVI2OVBlTitpVlR2bjhl?=
 =?utf-8?B?UVV1dHUvRE1vNzEvTkQ4K0Y4QzdBOVFMdHM1SjY0bStkMDk3b1RLK0FSaE9z?=
 =?utf-8?B?VjFYU1FNZTVLbUNDV043YUdFTmxYamFKeWJvUGM1OE5lVWZCMkQrTlQ5TkRX?=
 =?utf-8?B?V29MYkhBakc3WEE2K0N0VmVVeEFxT0UxMmpDbjRVNnByN2tQMUxGSEJUWm9I?=
 =?utf-8?B?NVBvclFQVHA3RGs3ZXVadGxJK1hNU2pXSTVUK0dXWkQzQTlieU1VTVUzb0w4?=
 =?utf-8?B?ZkF4cklLVnJwY3R6VFdkWUtvY1Y0a3BrUGpFdnZ2U0laSGduUkV0VVc5eDEr?=
 =?utf-8?B?TnUrTnVvV0FGUGR4aEpRejhqMzM0U3M0bmZoY0t4azFGYkZxeWhCMDRVYnl0?=
 =?utf-8?B?UjBwNmdUVnp4bS9PRVVnUjZOU0tZYWxXd3RaaEljMWxQSDhIQjFSQjhUL3FG?=
 =?utf-8?B?RE5aUlUyQ215YnBMSm5BUmw0ckNjMjVaUkJHQjJpOHpzR1NJSnZHM0duQnJ6?=
 =?utf-8?B?akxjdmo0VCtPYU5PR1NMNkt1TjVoSkdVK1o3NnBsakdHOGdBYUxndlhyZzk0?=
 =?utf-8?B?VmtJdmhNbnhORUpBWmdLUWhiZW0zRW5mS1FRTFV6dDNLKzVNQWRTZFJDU1FS?=
 =?utf-8?B?Y0NtbC9pZFl1TXE3UkJWaU0yTzJhQmJxYUsrUk9kZWhrY05YK2dYZHJKeENs?=
 =?utf-8?B?akVtQjNOOVhmRTNSUHh5QmhGNjVtUlpLRzdmbXV6NmFqR0RIMTcwWTlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmxlRGZBVzQ3OWVpR2NRSlFNNjVnekpISXE2dERaeS9wVzdJczFRaVBGNU1U?=
 =?utf-8?B?M0NKc1Buc0dlbGpFOTVKNmFmcEhuVm5pYnNyb3RzVWxPWUYveThVWFlHMm9K?=
 =?utf-8?B?cnVzbGV0YThVS2hDRVFBY2R2VzIrelM0Q0Y3cmhvdGl3MUZUUzEzUytmWjRu?=
 =?utf-8?B?ME1BaEJabmpRY3JpaUt2dTEvN3ZVaFdFYjJ3OVBQMFVhTHlNSjZVdjFjRGlV?=
 =?utf-8?B?a25HdHhDbXV6WVRSNnpwQUZCK2RnRzhXNjBzNHJoVlhxZHBKSXdtYlkyNXlQ?=
 =?utf-8?B?eTliTVZ4Zm1kUXVvMUc5N1MwMVNpQ09ma1c4akJyWTVKL2JucGhKaklNaWMy?=
 =?utf-8?B?RVhpYzBZQUF5UmZ1b1hCNUk2TXpHdVNDMkNINW5Bc0xVQmRrUkU4RzhRZmM3?=
 =?utf-8?B?YmlrcFZRWjJwN2FNMmtWdGMyaTY0UTJtOE1ZTU1DTCtMVjRxeXNJMEM2bGNH?=
 =?utf-8?B?WGd3K1FnMTJsWlNkWnc0UzcvN01ZcnlvMVpGSmdFWDJXSzVGQnAxWXloYk93?=
 =?utf-8?B?ZC8xWDN3K3RzbThUT3JiaThYem81ZEIzOUE1d1V0VUcxZmI5Y21ES1RtTkVZ?=
 =?utf-8?B?RGYwYVFKMWg0WVZPSjQ2UlFzZjVaMmo5S3l3ZWFrZ3Rub1NtV3F2TGIwMElT?=
 =?utf-8?B?OWhXaVVCaFQyRC9LZWZDaElLc0x3Rm0yZUxNVVhsNVkrbjVEMUx0bHZsQ3Nh?=
 =?utf-8?B?Z2QxZXE4MThuWU1POWFQbDZlK0VZbWlDSnZXNkdJQjBNUllHSTRmVUlEOUE0?=
 =?utf-8?B?ZWdMeDFEMDNyWmtyWEw5UzVxOE9xNnhoM2MweHptUm1jNkdJL1lYaVFBTFgy?=
 =?utf-8?B?Ym16cXZMQnBtbzRDN1ZQN3lLZEc3L0ROdHIxK1cvOG96Z0hVcTJ4WmVWY3d6?=
 =?utf-8?B?a3poT2ppMllVMW14d21DYWFuYjNWa1g3bU9jZXJuaVMvd0gxOGpCQjl2ZnVV?=
 =?utf-8?B?bnU5RFBvbG5rOXdQMkdobFJPV2pPajFTWW11eTdRazF4Qzh4YUdad0RmU2RM?=
 =?utf-8?B?VHUzZ0tBQzYzczRkMDVib1dRQ0NXUytxVytKMEl3dmpkYmFoMnZGQ1M3dTNO?=
 =?utf-8?B?R2xpczVwTkVwTXR6Y2pHZklqNnlBdmNEM0VDRndoZ0tLenYrY3I2NmdEcE1w?=
 =?utf-8?B?Z25DK2h5S0wvV3JtNDlRc1UvM25aNWxiUWI4dkJlZ1BOTmNid1NySURYdXMw?=
 =?utf-8?B?akxiZGJTcW1mckFCbjBpVHBKT3pFdnZDcGNxeEl0aDM2VFl5QTNBdEg2OUdm?=
 =?utf-8?B?SnBodjJ2UzROaitkdldGK1NER0NjRFMwVnk3TlRtdGhyV09tckVaS28vOFpT?=
 =?utf-8?B?N2xNemVEZWhxS0xqNGN5RVBWLytncVF2SXJad213b0c3RVpLZ2dFUkdGNXp6?=
 =?utf-8?B?WVFUY2huTHRoNnQ3U0ZaaFV1d09oVG9Lb0ljakc1Mzc0dTBvTjYzcVdJSlVN?=
 =?utf-8?B?eXVjeDNzYWszMVR4c2FWZy9YZ2pMdlloMVYyaWJrSTVRQlBIMjJDWXVoS2ww?=
 =?utf-8?B?UFV3TTNIWXhKN1h0dVZjaDh1c3dLR0VGYXVXTUZKSmxCU3Bwb0tuTWllWjVH?=
 =?utf-8?B?dThyTTk2UEZ2ZnZFTlpQUVRwUDk3WXBpRXVJN0hLaEovbFBtdlZTem5rTGtY?=
 =?utf-8?B?dlFMMHduVHBPNHJKcC9DYUxnZnRwM3dTQ1pSVGhrTTJ3cVJoZHFtNU5xejAr?=
 =?utf-8?B?MytWVDd2V0ZWWWd1SldmaTduY1hSaUh2RkpaWjRJa1E0SkxYYVB1TCtrdDdo?=
 =?utf-8?B?Yk85OUJid2oyQ1g5NnlnOUlzZFZLakJVUlBZT2Y4OW12Q3pPWmJoc1Z1V3JW?=
 =?utf-8?B?bFJodk1uNmpHWWh0NFhXVC9aWXhpQ3pxVVFDYWdtZ3g0T1VqSEtZOW0xTGlX?=
 =?utf-8?B?SDZmb0lqbEwvTi9JUGZkNlo1OGVqUFhPUTl3UGRib0dCL3pzalRPNHI0SEZY?=
 =?utf-8?B?OVcyV0ZyU0F4WUtVSVJxWVlQNDBBUytISHUzREJrWWlzeTkySlcyU3JDblJG?=
 =?utf-8?B?TmFNNTRYYVc2RW1hTWhSZE5VN2pLRk1FcXF4S1k5ZVh6cDBXemVoWTBCYlJz?=
 =?utf-8?B?Y3hDQ3RnK0U3VHZUYkpvTDJxbUtpS1VteDZvR2RqS09OR0R5UVNFSGZyenQr?=
 =?utf-8?Q?Kx6jP65tSul1OHNxYZQmHpPIu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06057dad-0256-4a22-e488-08dce47fecd7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2024 14:22:06.9103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: egdrOGYykEc70VolAWoASiqKaSvsbPDyo3RmqvWXX3n2TBNikj2XTpnKztSolwagmGNI9T+e8oae3Yu8yUeOhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
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

Hi Jonathan

On 10/4/2024 7:28 PM, Jonathan-Cavitt wrote:
> The xe_pm_residency@toggle-gt-c6 test fails when
> gt_c6_power >= gt_c0_power.  These values are reported by
> igt_power_get_mW, which will always report 0 in the case that
> igt_power_open fails to open either the hwmon_fd or rapl.fd.  Since the
> expected result will always be a failure in this case, skip the
> assertion that gt_c6_power < gt_c0_power.
> 
> v2: Do not skip the full test, and instead only ignore the part that is
> guaranteed to fail.
> 
> Signed-off-by: Jonathan-Cavitt <jonathan.cavitt@intel.com>
> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> CC: Riana Tauro <riana.tauro@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index 772fe9b574..0f146bad1c 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -282,10 +282,14 @@ static void measure_power(struct igt_power *gpu, double *power)
>   static void toggle_gt_c6(int fd, int n)
>   {
>   	double gt_c0_power, gt_c6_power;
> -	int gt;
> +	int gt, ret;
>   	struct igt_power gpu;
>   
> -	igt_power_open(fd, &gpu, "gpu");
> +	/*
> +	 * igt_power_get_mW will always return 0 if igt_power_open fails,
> +	 * so skip the power check in this case.
> +	 */
> +	ret = igt_power_open(fd, &gpu, "gpu");
>   
>   	do {
>   		fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
> @@ -312,7 +316,7 @@ static void toggle_gt_c6(int fd, int n)
>   	igt_info("GPU consumed %fmW in GT C6 and %fmW in GT C0\n", gt_c6_power, gt_c0_power);
>   
>   	/* FIXME: Remove dgfx check after hwmon is added */
> -	if (!xe_has_vram(fd))
> +	if (!xe_has_vram(fd) && !ret)
Should be ||

Thanks
Riana Tauro
>   		igt_assert_f(gt_c6_power < gt_c0_power,
>   			     "Power consumed in GT C6 should be lower than GT C0\n");
>   }
