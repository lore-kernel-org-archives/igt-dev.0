Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E44FCD6E5D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 04:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE86011A419;
	Fri,  5 Jun 2026 04:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2ZYFxrv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EE711A418
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 04:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780632305; x=1812168305;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mlgHn1Wht0MzVrAQ+00VOHcARSbr1XtUb9G/WmhdkBk=;
 b=L2ZYFxrv1xOuoO9GIpqffujKfbSeQrHnKO+tm/bj+srEEfBX5Ut92KDB
 aaDJpzbPrYdjZxY6pobLzuaZ0GiDlq6I8B4KmCuB4Rrdp1Q2Ziy0Wi2mt
 Wv+jh9G1q6pWyUmsvYv77KYVsUK5Kz76JOkxBi5ZYF6XEwTe0y9UD7eu8
 XHv38DmvtG/cW9LSphf4ngJEAOWLHe7vIWEzXNiOaiP08zjjIUds+zyJ5
 bTqWjMpJ/AbW1jM9Y7SiY+1ib8TJ7IDgXtffcnecp96iLztKhCcz7C8e+
 aJu2za0Nr3CfZVVncZukeiz67t1sEC5kaguK9//YIkevDe81b98h4bLbN g==;
X-CSE-ConnectionGUID: a5BvdNx0S0aUxdxz2ec9jA==
X-CSE-MsgGUID: oiNegF2NRtGC/ix+q9WVzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="99037978"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="99037978"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 21:05:04 -0700
X-CSE-ConnectionGUID: d5VDf2QkSXWo56AUnqWaXg==
X-CSE-MsgGUID: nfpKJ8e9RmS3FAGJbGTshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="243900197"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 21:05:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 21:05:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 21:05:03 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 21:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PmL4BJYC5TKX79VSiRmg2ifrU+KO9mVs0YNL82NkCLscmfUp8+V3OYvEEQKarJOgs7QMEFGzUL/Leu0qybdwVZY4xe7HFD4n72xyt21vZHVbJXd1fZJYRO24UfNLf9HMvKslSwBrLFSmhlVhjLhrMZ2pGKNQtrNhccUhq/9QlG1jdavBaN5mcXN1hnTQpPULoOBhNT3UD5YkcYPGZDyEGdTygcRAeosc7C+U2JQ5HiofHT4OoQ11ITg3dYpMeb2GYIWcNDAqwP9La7ZnxqHSnN/b1DwIBTCLqU6bJHbwc/QmIMlS8Ff2SIOGdhPgpz/g5Ra3AR68mkWONIovj/jELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuW945mEamDGulmIBK5hhbeMi12mgzcio5zmmZ3Aa/0=;
 b=Yreba3dObdF0ASE9yJ4xNLscmAw80GuKKoL6K6T4hyuTTJ38HZZ1qVPoF8RjzxfxGbeZEh29cqSh62TE9HBP4arcg1K0fANEGEnYvyUviNhWEtfUc2F2NLW4xb7AWRxcO7Ri357w2ujfEVM2oxOF9+2yRhE5pzM5Aclnmj3+xBbTSVbi/4K3E9lGY7PJUCNa2oRawZxGL6mY5GqsykJNvI8rU1sFlrarPH/+yHh0szokeaE/xH3BLjkIiJjqwNJpAxWA10tPCYFxxPeRvuTzjSVigqcKg1SczZLzZyyPLHFkgO9NrMgjSnWEMMA+2q/6bkSccN7faZbzT2ofewLWMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.10; Fri, 5 Jun 2026
 04:05:01 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 04:05:00 +0000
Message-ID: <f6c00cb6-9db5-4dac-82b0-1b46bdc2dd38@intel.com>
Date: Fri, 5 Jun 2026 09:34:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v8 4/5] tests/intel/kms_dsc_helper: Add helper func()
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260604201102.2583200-1-swati2.sharma@intel.com>
 <20260604201102.2583200-5-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260604201102.2583200-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0267.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f2::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA0PR11MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 81079aa2-6c4f-4cbe-ef43-08dec2b79d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|3023799007|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 9lH5IU5xq0cXj1GNAS6Kp54LQYtVGkGyYyCJ8be7YzlAYLPw4o8YO+S0hZ8ts2LfYWoA4JmJ2pVb7pYKpEe9RgTCUxunzmv8OBXBmUZ12QunY5392m7GxxCkwlU0jHr3R5Tw72UOkDXQXLNdqSf30Ihzjtv+GwBaw8a+btDZYN7TCL+R/gJGTJzUWugSP99Aru3vEGrQ1eGMVoYd295Iozde+H7k6TefIpjmsKYhx1E+YwYsTsGYJXiUmV9lEF5eflQ0dIUOndp+ZgeqY4AxWaVycD0fj+DIV3+t3u3SKiPmT1K4qdgDi1vuzscCl+Jei8R0d2W7UnYfGodw6JDYvBYzVs6Ajwx1L6qs5TbaWrSzZghfd1UhTV5mGXKUwX6rJP8iP+o8c3HRZwSMO9Lt0u6KdH7lwGaBG4KN+d9zkZMHx+U1asxT8HjGal8mLmWH89uzHgF9Rah0dkm0giXms0cVt/nW4An9HDxILV0vYe6dy7+ewZD1T+SoSFsk8Kom78J7g1OfEqVK2yPV9FFDlgEGI1UgZ9jknqbS7A3bw9G7/vMuXiUTUM0sMgeuqB+EoH03ZoBUc1mUiEHhNDKNSgKlgkSzMdu9QIxRbbYheHnmUWzjCHIiS49WnRHEKXchjx91S6rwBpzwlgViP6NSt2ZKy3F2w/1mjQWmL64e0Xc4pkRPM0/1AH1ouQiMKvmI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0lPd3FjdS9YVXBLZHpXY1FsR0ZmbFZsSm9YOVAzVU12aUYraklBK0dsYjJZ?=
 =?utf-8?B?bzhTYU0wOXpZZzB3MUpGblVZTFpLWFBEUmRSbEdIWUV6ZVdrQjJ2VThEZTFY?=
 =?utf-8?B?aWRVUEVURTN5WUloT1VrY0xYOHhJNjNRdFp3U1ZnRVJFK1dlbnR1ZHZQM2FH?=
 =?utf-8?B?c3pQUVZ3YVhUNmJLTW1Jb0NGZTB1ZlFXZFlvbFgyZ0t2LzhlZ2M5WHMwVURT?=
 =?utf-8?B?TXQwZzZGMStxdWtwWG5rdWd3aEprWStITWt1UmU1OGNaQ0ZvRE9tU3p0dHkv?=
 =?utf-8?B?cmsyck50Z2RGUTBGV1FrTCtSS3RiRzhJcnN5QVg4enNnbGUweXVLV2J6ZkJC?=
 =?utf-8?B?R3NSeUxRZE5FMkkrNzFlWm9UZWhoMEQ0SlhWSzdPUlgzZHRPYVhNeDN3a1Jx?=
 =?utf-8?B?Y3poOW5PbnNXZnRWUU00RFBEcUtzRVpMRHJicnRvdlR5M1ZhVTRJaVVmeVpl?=
 =?utf-8?B?dTFHRHZycjRTSy9GSkhlZnpWbFJTZ0RrNTF1aldqcGN0ZGxFeWRSTGR2SWdz?=
 =?utf-8?B?WkpmT2VDc0hRTHhxbjBWMG0zTWJZVWlmZVZaUW84aDgvNGZueDRyL29RN3ZJ?=
 =?utf-8?B?NmYxWUNOZk8wMFpHbXEwVFZRdDgyaTk3Z2hScnhJMW9relJMRjBxODZaQWpJ?=
 =?utf-8?B?bTAvRmRkVEZCQ1NhMzl6cEJVem5kTXR4UHFmelpJdnQ0alZrSWlDMHFxWHY5?=
 =?utf-8?B?ZE1kem9tUEgwbXNYM1Y4cWpSMEZPSnBldGFSY211V3lYeGlOcHlTL2tkRk1Y?=
 =?utf-8?B?c2NmR0V0dVc3cFY2NTAxd0Q0SSt5cFhuUnlQRzNDZHV3amtsZVNQdGIzREt6?=
 =?utf-8?B?NEFwdmI3ajZmMU5FNnVIWU93OS90M29TV3l1dVlKck9qQkQyUnVxaVdibDYz?=
 =?utf-8?B?cVJpU0RwRzJKbGxOdXRPTnNpT0I3N3VNUVA4N0dBMU5XWTUwWThlWFg4ZFhn?=
 =?utf-8?B?RFJQL0VuSFI3bHBCbmJYRHhLQkRYVmJFdTdScWszekdRVWdGcXJnd0lkdWJR?=
 =?utf-8?B?LzRWM056L3hWektCTUFDUlBXUThiS0sxcnJyY2ErWDQ2cC9Kc3FidllUb3c2?=
 =?utf-8?B?S3A2TFhzYTBmRFlFK0ZQQXl1NlRPNzhzMTQyUkFwbGtxU1VqcWl6MEdhYXBZ?=
 =?utf-8?B?U3VxVENvVFpaR3FEakNEZW55VXloQ2VIMFYyYWF0SzMzeUZMeVlyU0pPaEVG?=
 =?utf-8?B?VFp2N1JtQWpvYzl1cS9uUHRKUHFqUnpOT3JPY1Rra2FMQWdzZ2FnZ1RwWER5?=
 =?utf-8?B?SDRlR1hTbWpaQnVaWkNJajByZVNwZnhiWjBoZnVOK0k5aVBPU09scGhrTWpk?=
 =?utf-8?B?RTZCM3F5bmZ1Q1ViaDBoUXpNQTFJaG15MUxFTEdYVC9VM2dMTURUZ0R6Z3BL?=
 =?utf-8?B?Z2xwdGF0M0F3RFVsOGtwQ3JDcnF2UlRkZENsNzBOZnkvZmYxVlkzZ0JqMnRr?=
 =?utf-8?B?T0VmellVdk96TENGakY1OVZMbjdrdUJ3aVliaU5IK1JLN1UxajZCSDZhNVNo?=
 =?utf-8?B?Q1E1QjZpZU5VSDk1Z2h4cDVYQmd0UGViRWRxU3JDSVR3VkxWditIOFYwUzRZ?=
 =?utf-8?B?L1o3dkI3NmFRclhoR2c5VDJIWEp2S2lRcTJRc1NPV2lCajlEKzVtMUVnKzJv?=
 =?utf-8?B?WjNPTk1SQ0JLS21zeHV3SVBWSkMzMEUrKzBFWU1zc3NDNVl3Yk53YlQ0WDdT?=
 =?utf-8?B?NWFtNGJCdDM5NTlBSEUrOTlKTnloaUNzdFVsTkN1VWlJNlRUKy9tZkl5bUdq?=
 =?utf-8?B?QTI1aEp5S1RWQVF3RjVZYzlJalFtVkpONWlEeENZdFF0cGlMM051NVc4amlI?=
 =?utf-8?B?Z0dEZVQ0aHduV3hlYXUxQXo5d3IrT250K1NvdWVkY3I1UWRXSnZrSEluckpY?=
 =?utf-8?B?R2xlQ05vRmJvcHpZRVZ0TlNpblBGc0RQTDBqRU9UamVteXo3R1hUSmVJZXpP?=
 =?utf-8?B?T0Z4Q21nMzlPTkFQSzVYd1BUbHVWSGwvek1OTjg4RHJmN3piMFl4UGpZcFVn?=
 =?utf-8?B?QzRSRzhEN2hTb3JVK2xqNksyRVF3S0VmVDI2OGc1OGpPekZxRTRFMzB6L1ZN?=
 =?utf-8?B?VU02MFM0Sm9HOUlYM01lb1RFNVZRclc1MHRvNFYrVmhCRXVBbFc2a2cwMzNa?=
 =?utf-8?B?bFc4ZGtWU2ZJQXlCT0svWGRWQWg3bDBWcXE1QzhMNE9pSnBrb0pxdncxUURh?=
 =?utf-8?B?TnpGN1hkMjArT2lENGQxemdBS1J5NDZlVHV2SEtUVGF0Ly9pS0tWc21ZUklP?=
 =?utf-8?B?bnpCa1Q4LzdYVmJXSEpiaG5qYmZ0cnJ2VDYyS3RNaDIyZG5PWnJyckxzT3Rl?=
 =?utf-8?B?NnNvVGZSQWt3WFQ2Y05xdDZ5djNqb3p5dXBWZjgrMWxpUjZtYVRoZz09?=
X-Exchange-RoutingPolicyChecked: LFByRvb+hkLMsQnANIAauZwX+SnPIhjaR4UcwXX8nrXwe6evKUsqdid2c5snHFrOjL2OknrfIIZpYoKUQ1eDBlyGDhT/XTg/A0zzh3kZ7xUnthDivUqOWui4CeqpJbvl1kUId0gP8E8oMP8vtbsjdW6i1ckMB+2hcsKw1aD8c17YOoQy2uolckH1ehX+kiSvWacebNK5ijULgFGdgA/Wtbvox22ZouAz5H9BbQooEmj3PERzsAq7p1Scj/4/2AKTA3GCUsUm5iUYw4n38ARyyji4reVoSStadsdHxTPD3l8oevFN+/5pNUXXn3iJMZcLcQol9bUbz/HTfNyhNxtoPg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81079aa2-6c4f-4cbe-ef43-08dec2b79d0f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 04:05:00.7681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WtuzNJ4ZCQFTNtPgXdtDk6ELE0f3emUbdBin/JqqzO+WYLvUHhvg1/tVnpyFdp+TfZ/4V/v1qfESJeAkb1a3uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
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

Hi Swati,

Nit: May be subject can tell Add dsc_joiner helper func(). Can be 
updated during merge.

With this,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

On 6/5/2026 1:41 AM, Swati Sharma wrote:
> Introduce check_dsc_joiner_constraints() to validate minimum pipe
> count, consecutive HW pipe availability, DSC slice requirements, and
> joiner support for DSC joiner scenarios.
>
> Update meson.build to link kms_joiner_helper.c into DSC-related
> tests so the new helper can call igt_is_joiner_supported_by_source().
>
> v2: -Avoid hardcoding min_pipes/min_slices, use enum values (Santhosh)
> v3: -Handle JOINED_PIPES_NONE/DEFAULT explicitly, return true (Karthik)
>      -Fix indentation/style issues (Karthik)
> v4: -Move consecutive pipe check (igt_crtc_for_pipe) into helper
>       rather than having it in the test (Karthik)
> v5: -Remove igt_has_force_joiner_debugfs check from helper; the check
>       is not mandatory since joiner may already be enabled by default
>       and forcing is only needed when it's not active (Karthik)
>      -Add function description comment for check_dsc_joiner_constraints()
>       (Karthik)
>
> Co-developed-by: Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 68 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  5 +++
>   tests/meson.build            | 17 +++++----
>   3 files changed, 84 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index 29b998c2f..9f581758f 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -203,3 +203,71 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +/*
> + * Check whether the given output and pipe combination meets the
> + * requirements for DSC with joiner (big joiner / ultra joiner):
> + * - Source supports the requested joiner type
> + * - Sufficient number of pipes available
> + * - Consecutive HW pipes exist starting from the given pipe
> + * - Sink supports the minimum DSC slice count required by the joiner config
> + */
> +bool check_dsc_joiner_constraints(int drm_fd,
> +				  igt_output_t *output,
> +				  igt_display_t *display,
> +				  enum pipe pipe,
> +				  int num_pipes,
> +				  enum joined_pipes type)
> +{
> +	int min_pipes = 0, min_slices = 0;
> +
> +	if (!igt_is_joiner_supported_by_source(drm_fd, type))
> +		return false;
> +
> +	/*
> +	 * For joiner, 2 slices per pipe is used
> +	 * i.e. min_slices = 2 * min_pipes
> +	 */
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		min_pipes = JOINED_PIPES_BIG_JOINER;
> +		min_slices = min_pipes * 2;
> +		break;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		min_pipes = JOINED_PIPES_ULTRA_JOINER;
> +		min_slices = min_pipes * 2;
> +		break;
> +	case JOINED_PIPES_NONE:
> +	case JOINED_PIPES_DEFAULT:
> +		return true;
> +	default:
> +		igt_info("Unknown joiner type: %d\n", type);
> +		return false;
> +	}
> +
> +	if (num_pipes < min_pipes) {
> +		igt_info("%s requires minimum %d pipes\n",
> +			 igt_get_joined_pipes_name(type), min_pipes);
> +		return false;
> +	}
> +
> +	/* Verify consecutive HW pipes are available from this pipe */
> +	if (type == JOINED_PIPES_BIG_JOINER &&
> +	    !igt_crtc_for_pipe(display, pipe + 1))
> +		return false;
> +
> +	if (type == JOINED_PIPES_ULTRA_JOINER &&
> +	    (!igt_crtc_for_pipe(display, pipe + 1) ||
> +	     !igt_crtc_for_pipe(display, pipe + 2) ||
> +	     !igt_crtc_for_pipe(display, pipe + 3)))
> +		return false;
> +
> +	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
> +		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
> +			 igt_output_name(output), min_slices,
> +			 igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	return true;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index ee419c849..542fe46de 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -8,6 +8,7 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "kms_joiner_helper.h"
>   #include <errno.h>
>   #include <getopt.h>
>   #include <math.h>
> @@ -39,5 +40,9 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output,
> +				  igt_display_t *display, enum pipe pipe,
> +				  int num_pipes,
> +				  enum joined_pipes type);
>   
>   #endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 811a36748..deaa4ac5b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -400,14 +400,19 @@ extra_sources = {
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_sharpness_filter': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_dsc_helper.c') ],
> +          join_paths ('intel', 'kms_mst_helper.c'),
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_dp_link_training': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +          join_paths ('intel', 'kms_mst_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_dsc': [
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_psr2_sf': [
> +          join_paths ('intel', 'kms_dsc_helper.c'),
> +          join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers
