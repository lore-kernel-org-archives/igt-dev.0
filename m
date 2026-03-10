Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05120FCC9DB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 08:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1E10E696;
	Tue, 10 Mar 2026 08:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeUAgz1w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5690B10E696
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773133072; x=1804669072;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rDIna7R57iUNnlRJBCmAGqECso3ulQrq6JuUQFJ/GHU=;
 b=XeUAgz1wd1SA17Y2UAAQEud9Zl/+BjPm05oiikzyCIO2ov6emfD1ClLt
 oBdfvb3ZTAsB0o0iv2XimqEiB86w8mC1SZfK3d7yTinRTfMp9//lEuI9r
 T8Qqkf7fZEtwrSP+5yob9iJWYK4nwXeQuO5f8c0SqKYdLv0yjKuQLTSFA
 Ngdj7Q9aQHi+ZaEGhf/DqA4bWgz8wc/GJe58Ocu5aVvmy5ilnmZD52/WL
 4Py3TwWVQUIYeCLGp/NOtbHGOU8xQ7LAJc/ArDO+85nRlj8CMDY00pyAe
 o05BkLuA+xFIoVl1jCOyQKdg7N2ievgh4scdDVRxhaYp9EzILyyV6FU3U w==;
X-CSE-ConnectionGUID: zyY9IfSKTayuIzP7KaOkgg==
X-CSE-MsgGUID: zBFWK9DiQzCIEP/lcXEM7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="74364792"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="74364792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:57:51 -0700
X-CSE-ConnectionGUID: YyzLKD4DRYeLrity5tZTXQ==
X-CSE-MsgGUID: ORmhTGuqTH+k6OnRamr5KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; d="scan'208";a="219169307"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:57:51 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 01:57:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 01:57:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 01:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsFLd474Lx9gm3mcm8HW3B5zQO3IMEq6fIkGfpmnnkDADhhXGTFVCHr5rjFNRcpctKunlNpwRTA2P7yY8amo2q7Q4EHtgGst2c8eej1xVVYRnmhPGsfbcpNL7zAYkS8kEHcfxMqmRzixNgh+qcoXrjIeBsb/6hUPR6C7HTD7g/o4tugWaiFIm0Oi+wyc7ifb6SgTeclgk65VjK1+FFviv6+Vk73ApKorcpx+xRYSy+nxZEcQTp757VJq0Jsg4cWBRwzKq3e0Wouakd3iu4CcY1QuzHXmiri/BFIYRTLxa3KI7FLKvgJgyXBPgahUb5OUgDsb5lNw6HjyxviZy2AtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjpJVamEo/mwhmr4DeuPHN1omTp1hn3gugiq0HZf748=;
 b=I8Ap2+4Up6lZbhg/a1OiAoss5Wqo4JOUDKfKHv2G//bL2qu7Y5oESFhJl2R9JyK7yZJSahedFeR65xHU8gCL8mbZHD1aHJLjHEWJc7krGWJMg7nFvfSl8IEfS0HwqByRiONDzSCIpKqPf2A1DF+KcRuw5UnIvc/J3idYsAPntoRZ2aHaP7mEU11S6zndan4NU+gn3cbDWXNyAzJv33Aupsyekpzd0DN3SyCzqIU/kSiLw+R9POgfs9IsdcgsdkTRWwOCSdug+zLUTG9QzwnTAeEkOfFvII+uJQ7/Sq/A7882SoFg1W8m95Zs8yQD9uTGGHJUTdwoa3uWBhT6QM1PzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by CY8PR11MB6961.namprd11.prod.outlook.com (2603:10b6:930:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 08:57:47 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 08:57:41 +0000
Message-ID: <a6da408b-bdd3-4c8c-962b-7a784948fd1b@intel.com>
Date: Tue, 10 Mar 2026 14:27:33 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_pm_dc: Add check for display
 require output
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260310063735.40069-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260310063735.40069-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0246.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|CY8PR11MB6961:EE_
X-MS-Office365-Filtering-Correlation-Id: 359c0239-5fc7-4f76-b038-08de7e8315fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: fznUs1KtV5KGGSoUTcnF4bVkdCDePWZTGqxvas+kmxSdhdgMkVSE3ZnmjB33Y6x2009DA4+/HuJsxjE4D/fjbi7LqqxLJUtg34kUYwUV0J6HCFkTlcbYOETMDwal929gcHygKppj3xj9q132C5hoBHsK5Fwz7tevFjtSJQKSSFUL38grNXgb7gjsnGuj8oVigKlcLkWE2QtO1WTZygHAEWd8kCgeCBXUjlEcjEMQag0C39PCdV13hW9tL/jl4iWIpSV5TIW/CVqHN1+t9eF3AsETYxwvbsCbVBjH0af2b8O5C3p+QQWHZKKvISdfv6LDlLk/HD+vUxHTOoln8t94f6eYNvdiPUy52s1QKK6Tkq02e/upHUDeN6BT60aWepsIYN/WvmzDjsFo7aMebDhEABmNbuUqIQZTimbmH7vGI4Ri+NYxiqGdtMIYHfcZJ5hZMYl/0Z9Cc0wwmTc0NlcmplAwc7m5Nhp8kHrW6P22BHwU83r14kdIk07PAwE36TMSC28QMt9RfnvYjnQMqG+EsAXImFgb863hLiFsG3FU7LZCVtH8ZK+efxggw2Gc3Iv7MGIc7b9EY8p7TjXjWrMaEHWjw2uvDF/1O/o+iZ5S88E/l9Q8wroDOXyZURfLhKrFN+4QTwodVxztTsjLULiIe4M6UCKMdh8Shp0uZq34CnWZWEVyllxf2XQE/Zj4AjHVTY1ULCoW22J9Jtb6zPJXcvt4CS+kGxbfrJK8DUVjQOg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVVvbHliY2NtTkJpUm5OSmxuVUhmVGUyRlFpREdCbVdOVHNoc0QrRjAzOHVa?=
 =?utf-8?B?Qjh4TnU2YVJMRUlxNnk3RU1VMHJYdnFMWmd4ckZZRndWdy8wZjRuRlB2NUZt?=
 =?utf-8?B?VVpFcDhCTkVoMWN4SnRJbnQ2ME5DemQ2MHIxODUxQ1hZc2ZhQ1duWDJHQ25B?=
 =?utf-8?B?NUl4S0M4cDFlVkxmZXdseE1mK2JxSDBEc2dBeWZuaStSU1FKc25pWUF5S3lJ?=
 =?utf-8?B?MXd2VVN0dkljaS96NTNXOUZrOFExd21SSzJCU0xqZzcxRFZyNXYrWFpBSWh3?=
 =?utf-8?B?UzdhNWNrVFViUXBCOEduQlhwT3NhSk9tcjhqT2F5MFhNUEFIbDh2enNEOVlI?=
 =?utf-8?B?c1EyOWhTNUNJT21XZzdBV2ZaT3VIWkhKM3g0bUN5U2R5M1VNb2p3KzdmZlh4?=
 =?utf-8?B?bnBkRjVRaDYzMkpaeUM3M3JmRnI2eUR5SHp1KzRCWW1xZWpZNk9IeHZlc0NQ?=
 =?utf-8?B?NkNJOWU1NkdTRklxU0ZLZmFhSUZiMWIyQmJmeVY4UWc3VGh0WUtwWjlUQWpr?=
 =?utf-8?B?SFFNMmpkdEEyMHVJOVVhTzlUK1I4MCtKMmZDRW85ckR2UVV2ZFJ5dXpTbTRp?=
 =?utf-8?B?MUhEUGRTREFuOXNyaUpadUw4YXFEeWk1aFJ4TUpybHd0Vkpad0NBZmh5amZR?=
 =?utf-8?B?TmhyeU9EOTBhanpUb0VPZWM5RjJWRU9HUnBIYlZ5d2szOHZLaWxweTVyblFk?=
 =?utf-8?B?NXRSK1U5dXpiWjk1K2V0dXZnK01xTnppcDFrd0VqVlpiMzc0YWJtMFdkcVZ5?=
 =?utf-8?B?NUtaaHo5cHlFdG9IVTRQYzZvQ2o1Q1FiWUhNSEdmUUUzaEc0SHM3R0x4dExp?=
 =?utf-8?B?cmZPVktQMmFpSkxWbVpSSERHV2kyZkFkQlV4Y05oZDVjRHpFTHIzS2RzZWNa?=
 =?utf-8?B?M00rdmhlMjRpbkdMRjZ5Y1dCaDVMNUQ5Tk1KVmlLakR1U1JZSGFJbWVmWTN5?=
 =?utf-8?B?cXpVUW54MHZ0T3BBZ2ZRVG13MW42UkFuTEtlb1Zwb0Vxb3BYMmtwbzhyYy8z?=
 =?utf-8?B?dDNudWFwd05GZ1BiR3pvQ1hwZUdraEJTVkwyUW12SmFoK2N5RWs4K2w3Yld5?=
 =?utf-8?B?OXlnbjB2c3hzUmpqQ2hsT0pmQ2hvcDM5eXh2SVV2aUpjUjBQdHBpOHlSYlhC?=
 =?utf-8?B?WUVESG1IY01XNkt3dmVSZTF6a1VNbi93OVVtcWFTT0g5RDgzRHI0dkhnaGJC?=
 =?utf-8?B?b2tyajEzSFlQWFV0elhyNkltUmtXbU5yN2RoVk5Yb3c0eFpIQnoxa2VNNGFS?=
 =?utf-8?B?Z3BDMVFlUFcxMk1PQ3J1U3dVbGZCMjNscTl1RzZrbCtrUkFUMnh5YmtONTZB?=
 =?utf-8?B?bGI4dW9qbysrQ1FRckQ4VHdUMC9XVlM5NXUvQmtiRjhWRTVqK1dYb0dGUkdk?=
 =?utf-8?B?b2FlV0VvRFhHdmhtYlp6S1BiQVRhTlFsY2Nhd1AxRTZ3SVRjbTJVZTBwSXEr?=
 =?utf-8?B?aHVBL3VuWGhpTWkxK3NJRE96K2pqeGZheE1nMHcrZGxEMmJMQy93Z3RLeTVM?=
 =?utf-8?B?U3ZidDhvZXhEZko4VmhqT2poK2JzNkxPeDZaMldBNGhoWHlvYUI4QXZEZGpt?=
 =?utf-8?B?NVVZL1dFT0JuMGFEUjBNMlNwdDh0eCtVK1FRSGlGVlV6UEthZkM0bXlNZWxl?=
 =?utf-8?B?YVlXSnE5NVNwbENoRGhiVTVUWWlacWhLYUV2R1dacm8wbGpDcll3Skx6UmJI?=
 =?utf-8?B?bnRUa200cHNlSjYwdmxjYzR2dU5vN2JTb0hWcnBKMzA2MTJGZlpjK1F5eEVq?=
 =?utf-8?B?K3QyMWdBSDZkWjJ5UmVwZGdPL3pBTmpMbXBmZnRKUlVoNjBncjZNUGZmY3dB?=
 =?utf-8?B?SithQ3dwRklYQVQvZUw2VzBHKzlVSG9FZWFkYTJmbW5wWURIVktVd2d6ZjdG?=
 =?utf-8?B?a081YVdZbjQxM1FDaXNEcWxWSlRzNk9WMytYN3dWc0FPYTZ0WUFGamFXSGNl?=
 =?utf-8?B?QUREV2pnYmdsdE4vNjIzbFJjbW1lMGYzWmlidXR5WDd1Sy9ZQ0JySUdDK2hl?=
 =?utf-8?B?clJLL1AxNEdyUkROUVVCWTJqaGZxTzJxNDZJZDFvcU1NN0RSYjlPdzZNeWhJ?=
 =?utf-8?B?OWRSUTROai8yQksxMVNORzlhVnFSLzRzTnAwbERsVGdzOVV5L0FzMUhYZFk3?=
 =?utf-8?B?L2UvMGVNSEw1R3dEUVQxVGRjOXgweDNuZGlMVFc5UFFVT2dwbnl3NTJJY3gz?=
 =?utf-8?B?cTE1bFpaMW9rUVN1RDc1SG9mOFpqT0lKV0FERFJ0MHQxYk1Uc25SVWthakp1?=
 =?utf-8?B?K1NFQ3dLeCtrUG1EUTVBZmVHNUZhMDUzV0FubGphZDVuQ1cyNk9VblFxcUpY?=
 =?utf-8?B?N3ZZakc1ZTlmbHZvOTJTVXV5ZGI5Z2I1a1dWVSttRk5BTmxxOGg5UT09?=
X-Exchange-RoutingPolicyChecked: siUajVkrsRdXv+a/4u/9stHlVKWkx+HV4x+MIDhISQ3TmFJpgJR1t4AqS4TULQkjeHy+GG+sI5Ftq8OuhLv+BDttY/cqg4b0zKT46IZIJyvYnKp4XKx532ov4+l1EzIy8X4PPSRGAX9MtZGWTkF0LvlcR2wH5Qn3DeRKlVYUGAgD91IhVodGpQX1cPigItCaVXJDpUH8HSlevtaXohzzWPAePkSZuMt/sseA7Q/QS3XSl3Zu1gmv90l3ox/BIF405cGyoeW7FnQq/KjTQoImgUTSSAZMLNafTvQ6BIXvlnHzRpcx5RDhgdYEizbz/AjZCX4i31jDtN6WYWYLBGIIeA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 359c0239-5fc7-4f76-b038-08de7e8315fd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:57:41.1607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dId5vCFG2v5SMARJyaO9/YReSHKNYOMngaLuGc/t8Cq1dYUwh6gbi+uO5/yOaOzOWKGfJhVotNHWJViIS9Zw9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6961
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

Hi Thasleem,

On 3/10/2026 12:07 PM, Mohammed Thasleem wrote:
> Add igt_display_require_output() check to ensure at least one display
> output is available before running igt_kms tests.

There are few of the subtests of kms_pm_dc passing on headless systems 
as well. Please check if those need to be split into a separate test or 
if those were passing by mistake in the first place.

Thanks and Regards,
Karthik.B.S
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 2f822abea..d1c4a5019 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -771,6 +771,7 @@ int igt_main()
>   		igt_require(igt_setup_runtime_pm(data.drm_fd));
>   		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
>   		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
>   		/* Make sure our Kernel supports MSR and the module is loaded */
>   		igt_require(igt_kmod_load("msr", NULL) == 0);
>   
