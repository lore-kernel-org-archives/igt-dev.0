Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DE8F36BAA
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 05:31:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C602B10E0F8;
	Fri, 10 Apr 2026 05:31:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QvxoV8OM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA85B10E0F8
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 05:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775799092; x=1807335092;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=lvSLQJnVdhekqNUWtK/OiqKkmgOxJEKPDwIe+SEgjcs=;
 b=QvxoV8OMcRN/B/Q8z0pOP6n5XIcF5LZiLfR6Fqut9eGPvuHUPUw90Mo9
 pw5QiDRY35ZO9Q9BOm5bZ517RS/knx3uLveUEqSEtYzE7NLprRGkcUD+R
 jTZyk439DxHpw66dJfxg17zq/85Cvb8gaidMDSjOhXB3Djo0+3s+jPug+
 zH+UibNa0QH0O6yYMiKusRN/XgtRwIE/9agLO0iKQz88Q0mHfrO5ppVdT
 33owoUIrcuRPS4l3kx+jjfCUx3DUjExsz3rSIax30WNb0O2TgSz9eN9/7
 X/VC+vfApY2/0JJx37vprbRSyNvyYaNjbCzqfXNemdw1gyRQFOkSw0Cfx A==;
X-CSE-ConnectionGUID: qZo4EJXkTVSUoYeJj/D9uw==
X-CSE-MsgGUID: PdDl1SIdTTSTZIDfu6jE4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="80674513"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208,217";a="80674513"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 22:31:31 -0700
X-CSE-ConnectionGUID: izqkXUZDSD2fJSH/1whhPQ==
X-CSE-MsgGUID: Y0HoviH4QE61dplXg7EJJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
 d="scan'208,217";a="230715107"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 22:31:31 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:31:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 22:31:30 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 22:31:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1i/lBud1Ktz1XgdpryRkHc4dmkF/nOeu0pCLjX/uNhdvxkHdP2fHCj8OcA8bEr611lhL66dESoyvYL/q0forz2coKo0Kpel5rWSMultWA/5z5t7oCpcBQniv4hqlQbAT1bs0iRbtS8HRzcMv9QkUCr5UEdgKDheJSGTWVXIFCKcNnLPY15n8AsoigYZvTKZPt6NGoMQ+fap22fr0gRBtsYx0EHRR94tGdQal1MY1+FSfSEwl7GvnpTKDE6LVomLs2tKm6GAj9Ty+R+5Kg6RUXxSDhNN67SEFwu3/BUIC5WYqlyqHVkD6+YojFLhohznYBFH8SaQvIPopRW058jFHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et3pE4bGD4ABBi4lSlwuqAiJUStb1vByWmVUQaEbF8Q=;
 b=ESO6UR8MOFQYHR5iJc7Y7TgmU5gERg3TG2naF/QqaK2wJLp/MZUspXgOqi7UVqX8sEXxbHvLNA0VKpAbkx6ZVBbKrSywUmYZDB2aVeMhdUyebCKPzDfmPhwjMQygnS3w8nySXtUXlBSo39VcpW/6wLy0tPNtXeejEmFUbk3+kjUonQKZ5HYgWPw9JX+pX9ciUSkUEMzTcn4444OvOMmb3gxWiHwPcOhX2TTee2HFUtsPWIcho5nLU2slF2kTg/vr5uRSBXEVgVU7cIj8tPBWHEHnrVta1EFvxbN5qSN2bCj0sGDd23evwdtXN+oxf2DdWUZHKQk6LCJniCaoFFZTiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by SA1PR11MB7110.namprd11.prod.outlook.com (2603:10b6:806:2b3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Fri, 10 Apr
 2026 05:31:28 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9769.018; Fri, 10 Apr 2026
 05:31:27 +0000
Content-Type: multipart/alternative;
 boundary="------------0og0bDGZIuCk8hXD4L1pyRNM"
Message-ID: <16c209b3-7a17-4ab3-8e97-1946fb8b05b1@intel.com>
Date: Fri, 10 Apr 2026 11:01:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] tests/intel/kms_sharpness_filter: restructure
 igt_main
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
 <20260331190412.1907571-4-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260331190412.1907571-4-juhapekka.heikkila@gmail.com>
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|SA1PR11MB7110:EE_
X-MS-Office365-Filtering-Correlation-Id: 5588ca87-63da-43ed-91a0-08de96c26970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: JxfHrW5sR6Rj8U0i7UZNEJn/Sb47m+upj5eH4JLLzqP5eiI7+Np457VZ5/eP05QV9nKdN+TTZvUSgbu95VNcFUiwcIzakiCxT/iVHybSFsFKrOaFtHgL+lUjh1Cfg5qLyuOolepAtjcExrH83FmKCsNO2CZ1UQRYU/evZFnjsB0IVqBKebnJfyfiefGUBB81L5vYKzbOv5mrKtWK/+mA1jHGbwZT7KpWWtHkReXoKF4URyi90Hc5vbb9b7eeEO8tPymzXEvypln4s89NnWSh8wiaBh5AIQ3wABZHdYxAOGJSbYjCL5sOIbbite229J7Eww4KnZCXygdPkkpAJu1HiRyBX3GSsEifwpHONHVUfNN1lXI3rcnqlPLQUvnH9viV4VAiy3m8W7JmAzoS5/oynCzxJBX73VoSeLbDXETg8rQ2kuOhPrGA2vxZ/2o8j/VAzZDznXDC1mp+kduz18aNkLxLA/Tqyf/p3CcTkSQh7I/8xofB7sTPt48huHHopla+Pw5Gm3HDoaxK412Lv/Ue6B6drMQtA6WQ/nOWXtyWQb0t3sAQMclJ7iXCHUGqJlAZO458k26CnBUd52ib+9gE/9re7ki6gH6WZ9Ks3onj4Aymg2M2FAB/3uuUHJwf/UIo4oJQyyjrPFVZW1e7fkSPqqOt7ijFCeZVMw85mSkQSCQBMJ9KIx/ahpCKhsLiJJERV5WwClYGYmjrZw1grXOZKVBiwPqOlgGNuOgO6z7X0Lk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTJEVXB5cGhBanVaRHhDdGZmN2piblBwWU5iaUJ0YkJYZThnYWMzbXdja1Nh?=
 =?utf-8?B?SEVRcGk4NE91blVTaVh3ZzBzR2ZWMG04S1FpQjR3ZFQyWWdtZ3V1Ty8zVUlS?=
 =?utf-8?B?VFN1dGM1dEFZQlNXb1lzdjk5cGJZcTh2YjMvY1lhSE5IK0pqVnh1cUp2ZGEr?=
 =?utf-8?B?V05rQXZEZTJndnNaSGNHa0hwenAwNGVXdFdYamxaUW10cjBpajVUTEZPZVVU?=
 =?utf-8?B?dFh6SHRqcHJVSWZJVmVyNmlyVTBTU203NEw0SjkwWUZiYWJ4ckxKYWxmbFY1?=
 =?utf-8?B?MWN4VkZKdnFqdHJZVWMyNkxLTHVOSGw4ODl3U2h1bE9lZ205ZnJsRDhnZytm?=
 =?utf-8?B?cUlmQjVyZHloS2l3K2VSWHBLUEEzVDBFdWFtZy9qTnhmM002U2NGM2k0Tzgy?=
 =?utf-8?B?SmJrcis5MEFRa0pyMEZra0x4KzNTSmdJWTZvRE9KY0pIekgzU1Q3MURVbXFs?=
 =?utf-8?B?Sm5lcWwxN1FkS0hHQVlwdjRqeTg2aDhVanZTK0F4V2FlQURkcnUvMHhrVk5z?=
 =?utf-8?B?RVhmbFl2RUFOMFFoYzdnbndyUGU2NklscHMrTCttMHlRbmo0dE04SmFaOXVG?=
 =?utf-8?B?bitwTGtnRjFIcC9tQmJPODFaVWhIUDdMRU50UVNIMjJpVXFsZ3hhOGNsaVdL?=
 =?utf-8?B?SUx2K2dRUmYwT2YvUENRWEVyTGQ2YmdiZko2Qmg0ejI0SDdweCtTK1IzN2o5?=
 =?utf-8?B?eG82R3F6c05iTmVRbGFhcHQxcFlaSVdYb2xhcTR0RHNjOHdqYk5QZ0plMFo0?=
 =?utf-8?B?aVNyZ0VZWFRNWGoxeWkyL2ZtOXNsRjVXYy84MXpPQW0remRXM0ZFTlF6VFdm?=
 =?utf-8?B?Qy9nc2VLdkNMc2s1UnA3aEtOcFpyRG5YTEZONk80TlRYQnRGcU1pUUpUaFor?=
 =?utf-8?B?N0tKSjhwNG44WHJlTWFLb0VDMlRZaTU1WEpkQVYvSTZLamRRVStkR0FjTkgy?=
 =?utf-8?B?WmY5bHh0aGFtZkZZYkZ2R3pYTmxMc1lPaW9zK0pnVlJpMEpuYzBTS25CQ1M5?=
 =?utf-8?B?L1JoSjBDWGJWRVFqckRWL1NiS1hUZVZ6ZlFIMTBTUm9GZXcwbTQwYUJIK3JX?=
 =?utf-8?B?MHRWUXQxblZsWjFrdVVtd3NzUDFwTmpjZ29rQ01NUU1DbWNoUmowL1FwU0pC?=
 =?utf-8?B?enYzMC9BOHB0R2d6Z0djdmxMMjlESERjTUxueEtwckk3YVFNZ3dWVDZYYVBl?=
 =?utf-8?B?WU5xcDI1MTNOU2JCeVZOQWtHSHRtZmFtRlg5Nm1JV0FDSWFSUVNwTXcxSnNV?=
 =?utf-8?B?YVVyUlk5SGcxbm9DZDA4S0V3OTlLSlNSUEpaQXlhcm03djBrWXpEdzZIUmJR?=
 =?utf-8?B?Y3paamIvamV5VDVrTUF1dlQxdHd0WXZIRGdOQ281MnhEUkNiVERVb1RtaVhr?=
 =?utf-8?B?dzNWRmQzbkhUSGxuMW1laGdFY0E1NU5qSFQzb2Z2NnVqU2NabTVlb1JPUVRN?=
 =?utf-8?B?RUN0bUFQa256cTd3cGpaSS9oN29NbzUrWk9Wa0xzd1NLTTFMYUp4RGV3YnZV?=
 =?utf-8?B?eGNQR2FlZVZvVTFOb2hyMjdNME5pSkFDRXgxRVZBbGZjWVg1VjFGd2I2MGJY?=
 =?utf-8?B?WldpZ2lxd1F4dFhPdEswQU9Uem8rSjBoZ2hUR1F6VlFPMUlWTEpFZzVkRFRS?=
 =?utf-8?B?U0tHTC9yejdXS0tibWxES2hBM0sxaTBxWW1QY3MvWHlHcU1SNzBNTWtVdTAx?=
 =?utf-8?B?MkJtdlJmK2FGWFluVDNuMDl2c3ZHdzZ1NTVwMmR3dmwvS1U1SzVSY3pRaDkx?=
 =?utf-8?B?RFdUMysrN3FFb3hVbmdlV0c0Mkx1UVZhUmV6TDRwK2hKOUtnQkkxKy9CSUxQ?=
 =?utf-8?B?aEx3aE1LdWdZSThEcFExMm9lWTlVaWxqSjRXeEJOSnZJS1ROS2lTb2thZEJi?=
 =?utf-8?B?Y3JuMkFVWHcrQ1JvbEoyQXhkTG5uUWRscUx6bGltSldWM2o4NWltK1RxejJK?=
 =?utf-8?B?dlAxeTE0N1hjOUtqTVNxSHhwbWJOcFkrUWd4Yi9KTnptNmdqZ3JwR2dLNUht?=
 =?utf-8?B?SkRUWHp3Vi81M3d0eHRPd2lnYURVK2Y4TlVUeG5RUDhXM1VWR1BvUnN6R1p4?=
 =?utf-8?B?LzcrTkdLZFpNQXVzMlI3Q1E0QzQ2NURITGhrZ3R6SkdSRXkzUzY0VW5nN0FR?=
 =?utf-8?B?eTFNaEtKK0xnU1Q5S1NYOWVkeWRkUXBJOHdqRU9rVlJrM3d5U1ZuNUhyYW4v?=
 =?utf-8?B?bFdQQnduRlpwNzlMZ3JicW5ESnRtZXoxZ0FXM3JCOXluWXFLTTNCYmJPMDZR?=
 =?utf-8?B?cHQ4d0F0SG5PY294WFQ1L1dPRjY5TDczM05zenRqZVVjc0NhbldjelpydHhJ?=
 =?utf-8?B?K08xQ1VQQUM2em1ib1M0TEFmcXErT3JVZUQzWWdzWDZVaisrd0JEZz09?=
X-Exchange-RoutingPolicyChecked: DVuswQasqQuSd3wcPk3PonquPYHWl/5XfU2DOrX1NoIFwdVz/vSpuIejaQCm4yFNKdQ3kw0TIZqJLByZyHzfNEfLYkZeJUqMnsPyxQvscV41T8f87huPWBJAKwijdIUHax4KOpUBjG5zw4Veudsy+nLh/xK3qu1KTsDzwxdGu2iXMqAFloffysRK2Th2K35PmwpHBx08Aqkr6DDQJFwa6ig055ygjYirZP6BhD6QwDdWDfD7w4pfVC6zmLiebLB2qDv4AzKuYbN7VtHvBisHWJrp1apDEzrzvwEz+3pX2Y0lEnA7/QbdFWDv799HTkN+eS3/zn2LFsj1veAAyeZkOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5588ca87-63da-43ed-91a0-08de96c26970
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 05:31:27.7873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BhmkWmfEDfL8yUp7Lgt9jwFf7OKNIEhSxdgZVKcOJ7na5e4kzdNOAPW665YgEc0cc3Js5UoVmOa4WO4cp7iizA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7110
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

--------------0og0bDGZIuCk8hXD4L1pyRNM
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi JP

On 01-04-2026 12:34 am, Juha-Pekka Heikkila wrote:
> collect tests into list and call them through there
>
> Signed-off-by: Juha-Pekka Heikkila<juhapekka.heikkila@gmail.com>
> ---
>   tests/intel/kms_sharpness_filter.c | 312 +++++++++++++++++------------
>   1 file changed, 180 insertions(+), 132 deletions(-)
>
> diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
> index ed8d2e48c..f08d33d7a 100644
> --- a/tests/intel/kms_sharpness_filter.c
> +++ b/tests/intel/kms_sharpness_filter.c
> @@ -143,6 +143,131 @@ static const uint32_t scaling_modes[] = {
>   	DRM_MODE_SCALE_ASPECT,
>   };
>   
> +enum subtest_iter {
> +	ITER_NONE,
> +	ITER_STRENGTH,
> +	ITER_MODIFIER,
> +	ITER_ROTATION,
> +	ITER_FORMAT,
> +	ITER_SCALING_MODE,
> +};
> +
> +const struct subtest_entry {
Make this static
> +	const char *name;
> +	const char *describe;
> +	enum test_type type;
> +	int filter_strength;
> +	uint32_t format;
> +	enum subtest_iter iter;
> +} subtests[] = {
> +	{
> +		.name     = "filter-basic",
> +		.describe = "Verify basic content adaptive sharpness filter.",
> +		.type     = TEST_FILTER_BASIC,
> +		.filter_strength = -1,

Can we have #define DEFAULT_FILTER_STRENGTH as -1 ?

Also, shall we make iter/format explicit for clarity?

.iter=ITER_NONE,
.format= DRM_FORMAT_XRGB8888,

> +	},
> +	{
> +		.name     = "filter-strength",
> +		.describe = "Verify that varying strength (0-255) affects the degree of sharpeness applied.",
Typo s/sharpeness/sharpness
> +		.type     = TEST_FILTER_STRENGTH,
> +		.filter_strength = -1,
> +		.iter     = ITER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-modifiers",
> +		.describe = "Verify content adaptive sharpness filter with varying modifiers.",
> +		.type     = TEST_FILTER_MODIFIERS,
> +		.filter_strength = -1,
> +		.iter     = ITER_MODIFIER,
> +	},
> +	{
> +		.name     = "filter-rotations",
> +		.describe = "Verify content adaptive sharpness filter with varying rotations.",
> +		.type     = TEST_FILTER_ROTATION,
> +		.filter_strength = -1,
> +		.iter     = ITER_ROTATION,
> +	},
> +	{
> +		.name     = "filter-formats",
> +		.describe = "Verify content adaptive sharpness filter with varying formats.",
> +		.type     = TEST_FILTER_FORMATS,
> +		.filter_strength = -1,
> +		.iter     = ITER_FORMAT,
> +	},
> +	{
> +		.name     = "filter-toggle",
> +		.describe = "Verify toggling between enabling and disabling content adaptive sharpness filter.",
> +		.type     = TEST_FILTER_TOGGLE,
> +		.filter_strength = MAX_FILTER_STRENGTH,
> +	},
> +	{
> +		.name     = "filter-tap",
> +		.describe = "Verify content adaptive sharpness filter with resolution change; "
> +			    "resolution change will lead to selection of distinct taps.",
> +		.type     = TEST_FILTER_TAP,
> +		.filter_strength = -1,
> +	},
> +	{
> +		.name     = "filter-dpms",
> +		.describe = "Verify content adaptive sharpness filter with DPMS.",
> +		.type     = TEST_FILTER_DPMS,
> +		.filter_strength = -1,
> +	},
> +	{
> +		.name     = "filter-suspend",
> +		.describe = "Verify content adaptive sharpness filter with suspend.",
> +		.type     = TEST_FILTER_SUSPEND,
> +		.filter_strength = -1,
> +	},
> +	{
> +		.name     = "filter-scaler-upscale",
> +		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.",
> +		.type     = TEST_FILTER_UPSCALE,
> +		.filter_strength = -1,
> +	},
> +	{
> +		.name     = "filter-scaler-downscale",
> +		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.",
> +		.type     = TEST_FILTER_DOWNSCALE,
> +		.filter_strength = -1,
> +	},
> +	{
> +		.name     = "invalid-filter-with-scaler",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when 2 plane scalers have already been enabled and "
> +			    "attempt is made to enable sharpness filter.",
> +		.type     = TEST_INVALID_FILTER_WITH_SCALER,
> +		.filter_strength = -1,
> +	},
> +	{
> +		.name     = "invalid-filter-with-plane",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when 2 NV12 planes have already been enabled and "
> +			    "attempt is made to enable the sharpness filter.",
> +		.type     = TEST_INVALID_FILTER_WITH_PLANE,
> +		.filter_strength = -1,
> +		.format   = DRM_FORMAT_NV12,
> +	},
> +	{
> +		.name     = "invalid-plane-with-filter",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when 1 NV12 plane and sharpness filter have already been enabled "
> +			    "and attempt is made to enable the second NV12 plane.",
> +		.type     = TEST_INVALID_PLANE_WITH_FILTER,
> +		.filter_strength = -1,
> +		.format   = DRM_FORMAT_NV12,
> +	},
> +	{
> +		.name     = "invalid-filter-with-scaling-mode",
> +		.describe = "Negative check for content adaptive sharpness filter "
> +			    "when scaling mode is already enabled and attempt is made "
> +			    "to enable sharpness filter.",
> +		.type     = TEST_INVALID_FILTER_WITH_SCALING_MODE,
> +		.filter_strength = -1,
> +		.iter     = ITER_SCALING_MODE,
> +	},
> +};
> +
>   typedef struct {
>   	int drm_fd;
>   	bool limited;
> @@ -588,6 +713,48 @@ static void set_data_defaults(data_t *data)
>   	data->filter_strength = MID_FILTER_STRENGTH;
>   }
>   
> +static int iter_count(enum subtest_iter iter)
> +{
> +	switch (iter) {
> +	case ITER_STRENGTH:
> +		return ARRAY_SIZE(filter_strength_list);
> +	case ITER_MODIFIER:
> +		return ARRAY_SIZE(modifiers);
> +	case ITER_ROTATION:
> +		return ARRAY_SIZE(rotations);
> +	case ITER_FORMAT:
> +		return ARRAY_SIZE(formats);
> +	case ITER_SCALING_MODE:
> +		return ARRAY_SIZE(scaling_modes);
> +	default:
> +		return 1;
> +	}
> +}
> +
> +static void apply_iter_param(data_t *data, const struct subtest_entry *st, int idx)
> +{
> +	switch (st->iter) {
> +	case ITER_STRENGTH:
> +		data->filter_strength = filter_strength_list[idx];
> +		break;
> +	case ITER_MODIFIER:
> +		data->modifier = modifiers[idx].modifier;
> +		data->modifier_name = modifiers[idx].name;
> +		break;
> +	case ITER_ROTATION:
> +		data->rotation = rotations[idx];
> +		break;
> +	case ITER_FORMAT:
> +		data->format = formats[idx];
> +		break;
> +	case ITER_SCALING_MODE:
> +		data->scaling_mode = scaling_modes[idx];
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -620,142 +787,23 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_display_require_output(&data.display);
>   	}
>   
> -	igt_describe("Verify basic content adaptive sharpness filter.");
> -	igt_subtest_with_dynamic("filter-basic") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
> -	}
> -
> -	igt_describe("Verify that varying strength(0-255), affects "
> -		     "the degree of sharpeness applied.");
> -	igt_subtest_with_dynamic("filter-strength") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(filter_strength_list); i++) {
> -			data.filter_strength = filter_strength_list[i];
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
> -		}
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying modifiers.");
> -	igt_subtest_with_dynamic("filter-modifiers") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
> -			data.modifier = modifiers[i].modifier;
> -			data.modifier_name = modifiers[i].name;
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
> -		}
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying rotations.");
> -	igt_subtest_with_dynamic("filter-rotations") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
> -			data.rotation = rotations[i];
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
> -		}
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter with "
> -		     "varying formats.");
> -	igt_subtest_with_dynamic("filter-formats") {
> -		set_data_defaults(&data);
> -
> -		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
> -			data.format = formats[i];
> -
> -			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
> -		}
> -	}
> -
> -	igt_describe("Verify toggling between enabling and disabling "
> -		     "content adaptive sharpness filter.");
> -	igt_subtest_with_dynamic("filter-toggle") {
> -		set_data_defaults(&data);
> -		data.filter_strength = MAX_FILTER_STRENGTH;
> -		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
> -	}
> -
> -	igt_describe("Verify that following a resolution change, "
> -		     "distict taps are selected.");
> -	igt_subtest_with_dynamic("filter-tap") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with DPMS.");
> -	igt_subtest_with_dynamic("filter-dpms") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with suspend.");
> -	igt_subtest_with_dynamic("filter-suspend") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with 1 plane scaler enabled.");
> -	igt_subtest_with_dynamic("filter-scaler-upscale") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
> -	}
> -
> -	igt_describe("Verify content adaptive sharpness filter "
> -		     "with 1 plane scaler enabled.");
> -	igt_subtest_with_dynamic("filter-scaler-downscale") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
> -	}
> -
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when 2 plane scalers have already been enabled and "
> -		     "attempt is made to enable sharpness filter.");
> -	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
> -		set_data_defaults(&data);
> -		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
> -	}
> -
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when 2 NV12 planes have already been enabled and attempt is "
> -		     "made to enable the sharpness filter.");
> -	igt_subtest_with_dynamic("invalid-filter-with-plane") {
> -		set_data_defaults(&data);
> -		data.format = DRM_FORMAT_NV12;
> -
> -		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
> -	}
> -
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when 1 NV12 plane and sharpness filter have already been enabled "
> -		     "and attempt is made to enable the second NV12 plane.");
> -	igt_subtest_with_dynamic("invalid-plane-with-filter") {
> -		set_data_defaults(&data);
> -		data.format = DRM_FORMAT_NV12;
> +	for (int s = 0; s < ARRAY_SIZE(subtests); s++) {
> +		const struct subtest_entry *p = &subtests[s];
>   
> -		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
> -	}
> +		igt_describe(p->describe);
> +		igt_subtest_with_dynamic(p->name) {
> +			set_data_defaults(&data);
>   
> -	igt_describe("Negative check for content adaptive sharpness filter "
> -		     "when scaling mode is already enabled and attempt is made "
> -		     "to enable sharpness filter.");
> -	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
> -		set_data_defaults(&data);
> +			if (p->filter_strength != -1)
> +				data.filter_strength = p->filter_strength;
>   
> -		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
> -			data.scaling_mode = scaling_modes[k];
> +			if (p->format != 0)
> +				data.format = p->format;
>   
> -			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
> +			for (int i = 0; i < iter_count(p->iter); i++) {
> +				apply_iter_param(&data, p, i);
> +				run_sharpness_filter_test(&data, p->type);
> +			}
>   		}
>   	}
>   
--------------0og0bDGZIuCk8hXD4L1pyRNM
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi JP</p>
    <div class="moz-cite-prefix">On 01-04-2026 12:34 am, Juha-Pekka
      Heikkila wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260331190412.1907571-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">collect tests into list and call them through there

Signed-off-by: Juha-Pekka Heikkila <a class="moz-txt-link-rfc2396E" href="mailto:juhapekka.heikkila@gmail.com">&lt;juhapekka.heikkila@gmail.com&gt;</a>
---
 tests/intel/kms_sharpness_filter.c | 312 +++++++++++++++++------------
 1 file changed, 180 insertions(+), 132 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ed8d2e48c..f08d33d7a 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -143,6 +143,131 @@ static const uint32_t scaling_modes[] = {
 	DRM_MODE_SCALE_ASPECT,
 };
 
+enum subtest_iter {
+	ITER_NONE,
+	ITER_STRENGTH,
+	ITER_MODIFIER,
+	ITER_ROTATION,
+	ITER_FORMAT,
+	ITER_SCALING_MODE,
+};
+
+const struct subtest_entry {</pre>
    </blockquote>
    Make this static
    <blockquote type="cite" cite="mid:20260331190412.1907571-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+	const char *name;
+	const char *describe;
+	enum test_type type;
+	int filter_strength;
+	uint32_t format;
+	enum subtest_iter iter;
+} subtests[] = {
+	{
+		.name     = &quot;filter-basic&quot;,
+		.describe = &quot;Verify basic content adaptive sharpness filter.&quot;,
+		.type     = TEST_FILTER_BASIC,
+		.filter_strength = -1,</pre>
    </blockquote>
    <p>Can we have #define DEFAULT_FILTER_STRENGTH as -1 ?</p>
    <p>Also, shall we make iter/format explicit for clarity?</p>
    <p><span>.</span><span class="ͼe">iter</span><span> </span><span class="ͼ8">=</span><span> </span><span class="ͼe">ITER_NONE</span><span>,</span><br>
      <span>.</span><span class="ͼe">format</span><span> </span><span class="ͼ8">=</span><span></span><span class="ͼb">&nbsp;DRM_FORMAT_XRGB8888,</span></p>
    <blockquote type="cite" cite="mid:20260331190412.1907571-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+	},
+	{
+		.name     = &quot;filter-strength&quot;,
+		.describe = &quot;Verify that varying strength (0-255) affects the degree of sharpeness applied.&quot;,</pre>
    </blockquote>
    Typo s/<span style="white-space: pre-wrap">sharpeness/</span><span style="white-space: pre-wrap">sharpness</span>
    <blockquote type="cite" cite="mid:20260331190412.1907571-4-juhapekka.heikkila@gmail.com">
      <pre wrap="" class="moz-quote-pre">
+		.type     = TEST_FILTER_STRENGTH,
+		.filter_strength = -1,
+		.iter     = ITER_STRENGTH,
+	},
+	{
+		.name     = &quot;filter-modifiers&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with varying modifiers.&quot;,
+		.type     = TEST_FILTER_MODIFIERS,
+		.filter_strength = -1,
+		.iter     = ITER_MODIFIER,
+	},
+	{
+		.name     = &quot;filter-rotations&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with varying rotations.&quot;,
+		.type     = TEST_FILTER_ROTATION,
+		.filter_strength = -1,
+		.iter     = ITER_ROTATION,
+	},
+	{
+		.name     = &quot;filter-formats&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with varying formats.&quot;,
+		.type     = TEST_FILTER_FORMATS,
+		.filter_strength = -1,
+		.iter     = ITER_FORMAT,
+	},
+	{
+		.name     = &quot;filter-toggle&quot;,
+		.describe = &quot;Verify toggling between enabling and disabling content adaptive sharpness filter.&quot;,
+		.type     = TEST_FILTER_TOGGLE,
+		.filter_strength = MAX_FILTER_STRENGTH,
+	},
+	{
+		.name     = &quot;filter-tap&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with resolution change; &quot;
+			    &quot;resolution change will lead to selection of distinct taps.&quot;,
+		.type     = TEST_FILTER_TAP,
+		.filter_strength = -1,
+	},
+	{
+		.name     = &quot;filter-dpms&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with DPMS.&quot;,
+		.type     = TEST_FILTER_DPMS,
+		.filter_strength = -1,
+	},
+	{
+		.name     = &quot;filter-suspend&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with suspend.&quot;,
+		.type     = TEST_FILTER_SUSPEND,
+		.filter_strength = -1,
+	},
+	{
+		.name     = &quot;filter-scaler-upscale&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.&quot;,
+		.type     = TEST_FILTER_UPSCALE,
+		.filter_strength = -1,
+	},
+	{
+		.name     = &quot;filter-scaler-downscale&quot;,
+		.describe = &quot;Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.&quot;,
+		.type     = TEST_FILTER_DOWNSCALE,
+		.filter_strength = -1,
+	},
+	{
+		.name     = &quot;invalid-filter-with-scaler&quot;,
+		.describe = &quot;Negative check for content adaptive sharpness filter &quot;
+			    &quot;when 2 plane scalers have already been enabled and &quot;
+			    &quot;attempt is made to enable sharpness filter.&quot;,
+		.type     = TEST_INVALID_FILTER_WITH_SCALER,
+		.filter_strength = -1,
+	},
+	{
+		.name     = &quot;invalid-filter-with-plane&quot;,
+		.describe = &quot;Negative check for content adaptive sharpness filter &quot;
+			    &quot;when 2 NV12 planes have already been enabled and &quot;
+			    &quot;attempt is made to enable the sharpness filter.&quot;,
+		.type     = TEST_INVALID_FILTER_WITH_PLANE,
+		.filter_strength = -1,
+		.format   = DRM_FORMAT_NV12,
+	},
+	{
+		.name     = &quot;invalid-plane-with-filter&quot;,
+		.describe = &quot;Negative check for content adaptive sharpness filter &quot;
+			    &quot;when 1 NV12 plane and sharpness filter have already been enabled &quot;
+			    &quot;and attempt is made to enable the second NV12 plane.&quot;,
+		.type     = TEST_INVALID_PLANE_WITH_FILTER,
+		.filter_strength = -1,
+		.format   = DRM_FORMAT_NV12,
+	},
+	{
+		.name     = &quot;invalid-filter-with-scaling-mode&quot;,
+		.describe = &quot;Negative check for content adaptive sharpness filter &quot;
+			    &quot;when scaling mode is already enabled and attempt is made &quot;
+			    &quot;to enable sharpness filter.&quot;,
+		.type     = TEST_INVALID_FILTER_WITH_SCALING_MODE,
+		.filter_strength = -1,
+		.iter     = ITER_SCALING_MODE,
+	},
+};
+
 typedef struct {
 	int drm_fd;
 	bool limited;
@@ -588,6 +713,48 @@ static void set_data_defaults(data_t *data)
 	data-&gt;filter_strength = MID_FILTER_STRENGTH;
 }
 
+static int iter_count(enum subtest_iter iter)
+{
+	switch (iter) {
+	case ITER_STRENGTH:
+		return ARRAY_SIZE(filter_strength_list);
+	case ITER_MODIFIER:
+		return ARRAY_SIZE(modifiers);
+	case ITER_ROTATION:
+		return ARRAY_SIZE(rotations);
+	case ITER_FORMAT:
+		return ARRAY_SIZE(formats);
+	case ITER_SCALING_MODE:
+		return ARRAY_SIZE(scaling_modes);
+	default:
+		return 1;
+	}
+}
+
+static void apply_iter_param(data_t *data, const struct subtest_entry *st, int idx)
+{
+	switch (st-&gt;iter) {
+	case ITER_STRENGTH:
+		data-&gt;filter_strength = filter_strength_list[idx];
+		break;
+	case ITER_MODIFIER:
+		data-&gt;modifier = modifiers[idx].modifier;
+		data-&gt;modifier_name = modifiers[idx].name;
+		break;
+	case ITER_ROTATION:
+		data-&gt;rotation = rotations[idx];
+		break;
+	case ITER_FORMAT:
+		data-&gt;format = formats[idx];
+		break;
+	case ITER_SCALING_MODE:
+		data-&gt;scaling_mode = scaling_modes[idx];
+		break;
+	default:
+		break;
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -620,142 +787,23 @@ int igt_main_args(&quot;l&quot;, NULL, help_str, opt_handler, &amp;data)
 		igt_display_require_output(&amp;data.display);
 	}
 
-	igt_describe(&quot;Verify basic content adaptive sharpness filter.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-basic&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_BASIC);
-	}
-
-	igt_describe(&quot;Verify that varying strength(0-255), affects &quot;
-		     &quot;the degree of sharpeness applied.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-strength&quot;) {
-		set_data_defaults(&amp;data);
-
-		for (int i = 0; i &lt; ARRAY_SIZE(filter_strength_list); i++) {
-			data.filter_strength = filter_strength_list[i];
-
-			run_sharpness_filter_test(&amp;data, TEST_FILTER_STRENGTH);
-		}
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter with &quot;
-		     &quot;varying modifiers.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-modifiers&quot;) {
-		set_data_defaults(&amp;data);
-
-		for (int i = 0; i &lt; ARRAY_SIZE(modifiers); i++) {
-			data.modifier = modifiers[i].modifier;
-			data.modifier_name = modifiers[i].name;
-
-			run_sharpness_filter_test(&amp;data, TEST_FILTER_MODIFIERS);
-		}
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter with &quot;
-		     &quot;varying rotations.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-rotations&quot;) {
-		set_data_defaults(&amp;data);
-
-		for (int i = 0; i &lt; ARRAY_SIZE(rotations); i++) {
-			data.rotation = rotations[i];
-
-			run_sharpness_filter_test(&amp;data, TEST_FILTER_ROTATION);
-		}
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter with &quot;
-		     &quot;varying formats.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-formats&quot;) {
-		set_data_defaults(&amp;data);
-
-		for (int i = 0; i &lt; ARRAY_SIZE(formats); i++) {
-			data.format = formats[i];
-
-			run_sharpness_filter_test(&amp;data, TEST_FILTER_FORMATS);
-		}
-	}
-
-	igt_describe(&quot;Verify toggling between enabling and disabling &quot;
-		     &quot;content adaptive sharpness filter.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-toggle&quot;) {
-		set_data_defaults(&amp;data);
-		data.filter_strength = MAX_FILTER_STRENGTH;
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_TOGGLE);
-	}
-
-	igt_describe(&quot;Verify that following a resolution change, &quot;
-		     &quot;distict taps are selected.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-tap&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_TAP);
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter &quot;
-		     &quot;with DPMS.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-dpms&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_DPMS);
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter &quot;
-		     &quot;with suspend.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-suspend&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_SUSPEND);
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter &quot;
-		     &quot;with 1 plane scaler enabled.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-scaler-upscale&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_UPSCALE);
-	}
-
-	igt_describe(&quot;Verify content adaptive sharpness filter &quot;
-		     &quot;with 1 plane scaler enabled.&quot;);
-	igt_subtest_with_dynamic(&quot;filter-scaler-downscale&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_FILTER_DOWNSCALE);
-	}
-
-	igt_describe(&quot;Negative check for content adaptive sharpness filter &quot;
-		     &quot;when 2 plane scalers have already been enabled and &quot;
-		     &quot;attempt is made to enable sharpness filter.&quot;);
-	igt_subtest_with_dynamic(&quot;invalid-filter-with-scaler&quot;) {
-		set_data_defaults(&amp;data);
-		run_sharpness_filter_test(&amp;data, TEST_INVALID_FILTER_WITH_SCALER);
-	}
-
-	igt_describe(&quot;Negative check for content adaptive sharpness filter &quot;
-		     &quot;when 2 NV12 planes have already been enabled and attempt is &quot;
-		     &quot;made to enable the sharpness filter.&quot;);
-	igt_subtest_with_dynamic(&quot;invalid-filter-with-plane&quot;) {
-		set_data_defaults(&amp;data);
-		data.format = DRM_FORMAT_NV12;
-
-		run_sharpness_filter_test(&amp;data, TEST_INVALID_FILTER_WITH_PLANE);
-	}
-
-	igt_describe(&quot;Negative check for content adaptive sharpness filter &quot;
-		     &quot;when 1 NV12 plane and sharpness filter have already been enabled &quot;
-		     &quot;and attempt is made to enable the second NV12 plane.&quot;);
-	igt_subtest_with_dynamic(&quot;invalid-plane-with-filter&quot;) {
-		set_data_defaults(&amp;data);
-		data.format = DRM_FORMAT_NV12;
+	for (int s = 0; s &lt; ARRAY_SIZE(subtests); s++) {
+		const struct subtest_entry *p = &amp;subtests[s];
 
-		run_sharpness_filter_test(&amp;data, TEST_INVALID_PLANE_WITH_FILTER);
-	}
+		igt_describe(p-&gt;describe);
+		igt_subtest_with_dynamic(p-&gt;name) {
+			set_data_defaults(&amp;data);
 
-	igt_describe(&quot;Negative check for content adaptive sharpness filter &quot;
-		     &quot;when scaling mode is already enabled and attempt is made &quot;
-		     &quot;to enable sharpness filter.&quot;);
-	igt_subtest_with_dynamic(&quot;invalid-filter-with-scaling-mode&quot;) {
-		set_data_defaults(&amp;data);
+			if (p-&gt;filter_strength != -1)
+				data.filter_strength = p-&gt;filter_strength;
 
-		for (int k = 0; k &lt; ARRAY_SIZE(scaling_modes); k++) {
-			data.scaling_mode = scaling_modes[k];
+			if (p-&gt;format != 0)
+				data.format = p-&gt;format;
 
-			run_sharpness_filter_test(&amp;data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
+			for (int i = 0; i &lt; iter_count(p-&gt;iter); i++) {
+				apply_iter_param(&amp;data, p, i);
+				run_sharpness_filter_test(&amp;data, p-&gt;type);
+			}
 		}
 	}
 
</pre>
    </blockquote>
  </body>
</html>

--------------0og0bDGZIuCk8hXD4L1pyRNM--
