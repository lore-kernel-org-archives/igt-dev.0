Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E433FC4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:25:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A190A10EADF;
	Thu,  1 Feb 2024 14:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gY9Tt6q/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319B10EADF
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706797526; x=1738333526;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hq6mw96eaZ5e4XHrw3QtTcpmC9Ik67NC5qyEDWq6xSE=;
 b=gY9Tt6q/78ROGUZJ6LhkYe8Pzre281C/8wVr8zzKuDisfS2QmE3b42Qs
 XBDATAcfVIPaVFWuPuSp6QGXVvSRLV1AiRg2frax6c5hP31uSwBimuXAD
 zDcCmwa2QiGkGQCmX3LW/+g1eIIB2RukfjKuOpS5wmlyevEvx9mXGu9w0
 8vuUzd+JTotxxkG674Hpr+EtEH0MujTaiXCBbaq4HASCaTQ2G36UoEcRJ
 geWeSrf0xJ7f0cXTRhu2z0KU3As60HS3ds44V4KsKkdb2MaK1qe/+M2fg
 u3XUyTQbm+Nt4j4KEtM52FbU2BfDDY3M7DVWraxg44xIsO36J2bmwZvBr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="468136910"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="468136910"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:25:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788941319"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="788941319"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:25:26 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:25:25 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:24:00 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:24:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dbQFPmJCJnxzLX/wnv0anIkIU3B2zEHJOjt4vake9ejHwWKFkSB2SsCME72gNNxJ/v7abKruKsVW7tRcOHIgigu67hhWfovOsyXMGLxmM4dIKHTHzcY/S2tMvZ/GVjGr8WuAib82vorQ/b3VV6DlrhpCxHWrfeae52iu+jIaAkWXe+i6O4VRNaqyggeNy7NsPcMHX+4AUpPlhwEyZYxNe34JKuA2NOIJkFTfz6vs09HhJZyuST7anapNngQa9JK7GFxMveZFo+5MAkffsISn/kUYv9dtW6YnEJ4xk9WVtS5Mi2Cpi37BekXIe6oLPYAvhgTS5CVw2YeWTcaJ0ILY+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t20To+0Ix0Cb5t2hd0FBdl61FFj069V3MXdLqQRP32w=;
 b=RHAVGjVCBRJw5ud8BCsf2k1hBH00fsRprxQ/7lUlhwTm6bYFfE7qWIo9bEUgjnHiMvJFsn+9p6KqgBgbX16X81ZpNgeeqffQ5xIV83B3GJwXXQVYgUI9ON9rcpJGOzOtUmUn8lgdYkI1zKWsyHA/Pb2r9nryM6Ye2kdq5X1Ez7zVVAp+wK6lJYyctJpGr60rR7YjUxG7Vu+B+XD5zP7nNHA35cEqQSSlVRiEEgf7YJtBCnvXQLuAWEKHmWGcs9TQQttJPNlzVeebT+qiBFhhlUYr8MKHMqLyiow67cFktUEQ/QREz9B0KnKc7QffReWLGt0AVYnSZMgm4Ucc11zr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.29; Thu, 1 Feb
 2024 14:23:58 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 14:23:58 +0000
Message-ID: <2d5ffbb7-b431-4af6-8ef7-d09aaa45c92b@intel.com>
Date: Thu, 1 Feb 2024 15:23:54 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 5/5] tests/xe_exercise_blt: Exercise small to
 large fast-copy blits
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Drobnik <karolina.drobnik@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-6-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201100724.257845-6-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:802:2::29) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: f90696f8-acdf-44cc-28d3-08dc23316db0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qk7btPwCueZ/EcirJWTo3QjcopBanQDMjRZjMvtSdy9Ubmfe+rLunXrhszhR3bAhuy+guVkuemgQ6vdn161WqwDNTWzA6bP6q0hoOC2DiuW0PPPewPF+X5j9FhqAu5nj65pdLDolyZkWB+Pm82FUEudILBf1pS2sjj4ssq6758FArcuMj14g3pkNuwRg8yScDjqquqTMCFpFRH1g7hxbHN9wawDO53ecAjc5ojztKCveVmWtPHdEe2e+4PEZdiFpicmuVPuXuE1wUgb99ifDQiueS+Rl3c86GdSRe4wayQMlnO69VKi6gSqqyDgxJHicn26NekQxPgzvb4mttpkkBwmhnVNwOysgEyR0bb+R9UbsFGoNE137SyvyXm1itjEdUEF0o83kafhpegaLj3s4+2IUy3uaSFCxmiZfSuvX3utcPbYLm7uUVrUom/zxUZWA80nL4zBp2um2kHTHvr5cWF9hDXZesfar3jUz6pCSJL/v8Gqhd9zxmcuVmxDkt1GVgq1XQY0FNF6R1qjbQ4Y3dafS9PPq1qp8Epf1yMFwowMOtJeCLiuO/46eglrKvewotjvk4oExGIKu7BRKWjhlon81r4Vi0hGse2n+gZspN/6QQEU1G7CCJCsyTTGO21uKq66aYDUtggHHCpv4wdBBaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(346002)(376002)(396003)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(107886003)(38100700002)(26005)(2616005)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001)(2906002)(4744005)(6486002)(6506007)(36916002)(53546011)(6666004)(66476007)(66946007)(316002)(66556008)(41300700001)(31696002)(86362001)(82960400001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEdlb0N0dm51d20vOEM3SW5KZ3ArWURMZ1FndmRYOUF1MWtMaG81QmkwMlpB?=
 =?utf-8?B?R282T2tlekI4TCsvWTI0QmJleUVQdGtENGlCbjh6c2MraDdmcGNXNWN6Vm9r?=
 =?utf-8?B?ZFQ3VlFwb1o1Q1hQRmtMYXZ3cWZtbkVwbGZLbTlqOGRJVlB1d0M3aEcrcWNr?=
 =?utf-8?B?cmkzVlZQRit4UUtadDlzTDBnMjNEYzlkOHoyWGUvQWR3dG94Ti90am9oWFBC?=
 =?utf-8?B?K0pmUzFFUjlPOFMwVmRqaWdmcjlkS3lGUnlLWHVkWjcvUVZDTHhDcUtiY3gx?=
 =?utf-8?B?Mnk4anNjYmpkdTJ6UGl3Q0xReUVLd0NZMU1OMFpHN3gvRG4wbzU5VjZtK1Zk?=
 =?utf-8?B?SHM1L1V0V2VIRTNKZE9rclBrUE12Tm45TTIrS055LzFVakJzWVZIVjYrN0tk?=
 =?utf-8?B?cUVGM1h5SGRaNzR6NUhSeFdBanV4T0xyTzlOZXRzZ0JMNmMzc3lGbnpwL3hK?=
 =?utf-8?B?NUlFa3hQWVlBaHdVTXVwbjk1c3duZ1NzVE1BZUdEWWFDdzFFRFV2K3RlV05N?=
 =?utf-8?B?a3RIenhLQ3dNSGtFQUxWT09uNS9TWC9RTjNHQUt2Z2gvZlpWMXQ1b0RtRnNE?=
 =?utf-8?B?WlQ5UHRUcHBIN1QwTFRkS2UzYjVONnUrbFV5NVl3UjhvcmtreUdHUVZFOEFp?=
 =?utf-8?B?dlNwOTgwRVl5UkZ5UW90OUlBK2QzWXdJYzMwZEpQQUJsd3doSkR1V0lBbTJN?=
 =?utf-8?B?cEpiQkZDdXZ1VjVJaW80L0YrRmRudDRVdFcwR01RNitwNUZKcVd4d1JwVHVK?=
 =?utf-8?B?RUpmQmxvZURSQzE4L3RuQWE3NnJGajZDY3VWb0h4aWZCc29HZkk1cTdZb0dk?=
 =?utf-8?B?eWtNb1YvZ2w5dkxNbmxxRTJ1OFZ3N0JPV3QrQzQxcERpODVpRlJIYWZnWUw2?=
 =?utf-8?B?VVJ4NjVCV0NnZUkwNit6N25lU2EvZGYxVUFBZG1XTFB0KzBVYk1XcHFIUjJV?=
 =?utf-8?B?ckhQc0c3MFFEYVV2dHI1cXlSS2JWZ0VyejQrb3gyTExmUUU3TTVBOUpuMHF2?=
 =?utf-8?B?NkhNUEovUEVrb3dpcVErRVl6cEx1N0M1ZnhDbm0reHdaU2JqdlYzVFJLZll0?=
 =?utf-8?B?NVREblI2bnNZdG1HcnRaYmN0SWN6VDJ5WTJHYTZMUkhVbS9PZUoyQS9MU3NL?=
 =?utf-8?B?aTFYVFNXd2dDWXFqWVBUSlpBTEdlWUN1YTN0aUtLaEM5QXFGbjNneDdOQ2VZ?=
 =?utf-8?B?MHFpS0UwQVZzYUtxY1lDZ2QycUtJcmhxV3NCMnJ6VXBzUG5WdEdQdlg1eDJT?=
 =?utf-8?B?eFdBN2R2VWJUeGp1VFR6YWRVOGVOMXZZYmVLR293ZGMybXV2QTNyalVwMjAr?=
 =?utf-8?B?cXRUMW1CUExBamtUNndiVXQ4dUtTbE5tNVY0YitSRXl6K3FqcDlYV3dybnhU?=
 =?utf-8?B?TStSNlJvbnR4S1Ewa2VwYm0wcHFqQlJPenB4SGQ5WnZsSENyMUZ4SVJGbjd3?=
 =?utf-8?B?NHpQMVRXakFzQ0pLQzV6YXZCL0M3aktnRGNnRUZNU3ZVaFFYQUVGNHZiRWlU?=
 =?utf-8?B?dzJMbkx3YTEyc25DbnlJUVFJTUhhNnJ6QnliZTA3bWNNbjFEbG11bEV5VVB2?=
 =?utf-8?B?ZGFYd0ZnN2Z5aThPby9acjZ6d1VZUXNKZmVjYzlsT0FQSDU3VGl0QWEyMkpz?=
 =?utf-8?B?blE1U3l0Nmh3SVl5S1ZaSDNLUFNQbU56clpvYjg3aGRoaDVQSVBFaTBHaTlH?=
 =?utf-8?B?TlVoaExPQ3lLQWtqSGZlY0VkSE9rTWlFR1Rnenc2VHVTWjVCdmxScU1UVmlI?=
 =?utf-8?B?THhOQWdTSmc2Z1M5OUUrTnE4S2M4UnpWcXRCM0sxZVF0djZmVytnT3Exb1Zi?=
 =?utf-8?B?Z0lTNUppVVA3NUd6akZScnlnQ0xvK0lRR05FakNOOEs4cnJnTm00Q2VCL2xW?=
 =?utf-8?B?Zmk0ZUp1amhzR21SamNKZ1hXbkROUlR1L3Z4bTE2SENKQlZCTWh0cWQ0Uk9k?=
 =?utf-8?B?dUxxYlU0d29Oa0RnNUR2SGQvS3V0Q29mZVJXUThWYWxzd0J6UUdLTy8wQVZG?=
 =?utf-8?B?cVpjYUg3dmdDTldRUDhhNElWOG9zakk5dUkvMm5SNjdVc0ZmcHh1T2lvUnJH?=
 =?utf-8?B?b0NYVTlVNm56cVI2QTJRalFlcDNHQURib25LWUdGMmhXdnk0dVlaWE1wZTBr?=
 =?utf-8?B?S0hCL0dEWVhacWhGSHFzYkgzS1hmYU9VazdxbjNEYnoyTXozd0RRL2IwSjV0?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f90696f8-acdf-44cc-28d3-08dc23316db0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:23:58.2466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEUCbQgGTIf0o+CAF9HFgE74hDxGYDfQXGeoTUjCuB6nX3Comh/YWROML7Pw7fm0ljI2P3iKI/B1y5x5F1nNltO0n1Y6+I/1BUqLnnZIl0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

Ah, forgot to tell you that checkpatch was slightly uhappy with two 
blank lines after inc-dimension subtest...

On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
(...)
>   
> +	igt_describe("Check fast-copy with increment width/height");
> +	igt_subtest_with_dynamic("fast-copy-inc-dimension") {
> +		param.width = 1;
> +		param.height = 1;
> +		param.width_increment = 15;
> +		param.width_steps = 512;
> +
> +		fast_copy_test(xe, set, FAST_COPY);
> +	}
> +
> +
  ^-- here!

Sorry for the email noise.

All the best,
Karolina

>   	igt_describe("Check multiple fast-copy in one batch");
>   	igt_subtest_with_dynamic("fast-copy-emit") {
>   		fast_copy_test(xe, set, FAST_COPY_EMIT);
