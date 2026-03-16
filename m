Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAB9F506D1
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 13:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E733710E1D5;
	Mon, 16 Mar 2026 13:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h5hO74ip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1BC10E1D5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773668278; x=1805204278;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=8qhp3YuN0x/eRREcK2dTgqdDkOnTlKIzhvN+5TCdxGc=;
 b=h5hO74ipDiZmqyobBe5mxunISourRKXx6JcFqSSZlw9lUKa7uyxS7s/9
 ITE8QH9ildy38U092tlk4PhhpJEWNge3aPJa9a2Q8ZlpQJyHGIicZj4tW
 e82hdQZ4imUWcW60SEYYcjlTXu39YR6zBWDaumhX4IYfDQAwQGiXORoUX
 lIYXgMhwBdQmCbi3svcXAWlO+Aaacq9HA4mnihyD+zwexI+l5NiRxfS7+
 hrQvsEwMbbFEvtQlRy9BcDO7UUu3/qn11IiQX7sr/vvyPlC1HFRNa9kyS
 ZsKQ3nLQTEVmiQ/acyDfxgzI5EyZgBbwqsT0K7jiHjD8O54ugNBd9tY3W Q==;
X-CSE-ConnectionGUID: Hgww8EGkREGqV6LqpcRunA==
X-CSE-MsgGUID: KcaqHR2qT9qCGOlg7eEMEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78286842"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78286842"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 06:37:57 -0700
X-CSE-ConnectionGUID: CkT2rBlgSTS0OTJZUTIERg==
X-CSE-MsgGUID: DJPQLbn2QjO7YlrJWEo64A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226048015"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 06:37:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:37:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 06:37:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 06:37:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwztT885OQdAn+PDFWOvxM+rieyGjC0btcwtOU/SpUxXhJf61jppZiAQ/pQagngFnpj2i3XFygdKzchlLVdcPKRrMQeXVxs6wf3sA2ZbNBjoqwctR7YCpucDv4wWDa5DBAONRXkOgKCmpNP/wg9rAqok/vg5+uEmBtbNlqsGJl2F7THNM7Qa7oCiH35N11oUZznU+sKhwSJBHsp35hy3wgdFp7cVivnpfOfRUF7DNHPDcxgqOTiwyAFs38BjjdkqAwr9GB9nONYsu8kgR+v0sIZTfqNJr9ZeFLV91LwmdxhLDyKUcucC967gnDYbkwQe+/bvx76PBbjhP2T/0JU6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omCLlAfg0CcMpS8llWI8sBN7qe24BFvapHcVmYZTdBo=;
 b=bEw0s6CbMxRHkfpVRe7B9aAgR9ZOSt0MC/5p5dASC4lSi+GYYcVtnwfkrfC2eN357yxRTfSDgdH3fTkFk7Kqor3uovBp7jRN9M6Zq8drC/xBpP9vXxTslvGI15u9kGv5zmCGPxlWvdwvWo+d8cg8PQlR9i1a9QwB92/aG/t74GYwCEjOXsmAWxsEjtJLTuHv6nxK7xrj2/liLYtOTNshOx5nwyHgG4ghTaqLrZVJRzfo5tWQpRAWtCmeBP4bCyOIiBy1O0oOkG4P9YLHEC2nqiAFir7oC++4dP99cu5NfxP+s6kyRuTgzWVIwfeAv/lhsGAL6dOPmRSxSOi3Z+f1jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Mon, 16 Mar
 2026 13:37:49 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129%4]) with mapi id 15.20.9723.004; Mon, 16 Mar 2026
 13:37:49 +0000
Message-ID: <0b5d555d-150a-464d-931d-715b28966535@intel.com>
Date: Mon, 16 Mar 2026 19:07:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 i-g-t 1/2] intel-ci: Add NVL core blocklist
To: Aditya Chauhan <aditya.chauhan@intel.com>, <ramadevi.gandi@intel.com>,
 <himanshu.girotra@intel.com>, <kamil.konieczny@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260313123459.64815-1-aditya.chauhan@intel.com>
 <20260313123459.64815-2-aditya.chauhan@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260313123459.64815-2-aditya.chauhan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0201.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::9) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|PH7PR11MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f7ccba-61c6-4970-431e-08de83613710
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: SodQ3oxaCdXwVXPGk1tAz1q4/Tk4ogn7oFqPc4IeUpnqEBclDoQMWXdhW6ZD/D35oW3GznCcVTvZiY84GZpIVd+t1xT69BY2a8gU5Pw6YheOvdMA+L8aR+Czun8gV8FLYkTf1c0byOkzk6Lgisqgi5ydL1zsxDyLgA/t8qASeB+3AIaNx1XrMdLUx/dZxP1EMtNqKke9tTePzESl/z2lhSE8Ae85s4yM6ie3Dr/vVRIhbmTqwYyTPpwDWuOOzLwGnphxCX7GxKZFdyONs5D+jeQPVzutgkDvcIbEiVfS/+8K4295cqibBsW1zI+fvPaIa6CU1FSEN7+6QvKO2UpW2fGdVCpXidt/3RHpXySqi4R/neAqla3BxsXVe5JfqAK8H/2ytMnFbY1PmwR6QhuznXPtu3XUuEp/EUicv51Wqa+DnKuw+17jBhyajw0NYzh941CmBHf3MHzHDICsEVGep4C31Cv8btAfe98/H79BDdNP6IXDdzP07opm5D8scO0B+X58BmRDPGWeo0rmUYyL8m+A3Ru12x+WNL2XJfZSeW/8EeDyMuUkdiFmxa2Dsg57OtWFrQQaDxYAP8EOy+nX5m7Sqh0U67S+OsJK9/bw2XguyRPgsZGaNmHGKFP23X7v0fI7kPtCU0tTeVAyJ/ku4HlzPrAtYY06+EP8k/7ulv2geIEUH31K6OpMZXZsVzW8jqhTzCkuJe0pcREGc5HPXdZZAvEXA3nD0LI+/nu7jp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzhYZEZkNERwRllHdVNNaGlvQjdRY1czV3NWVS8yTGpGQjlBeUJ0M0RhZm1N?=
 =?utf-8?B?QnF6YmFvUEkyQ0pPZlcwSHBILzFtWEZObHBGelVZQVJlbWpqWXE2QS9uRTJk?=
 =?utf-8?B?ajkzVzE0R1Jsc2FoeGY1eXJzV2NSYlhXUEdzU2wyZnZSM3Z5MVlVTUpWOEVw?=
 =?utf-8?B?N0IwdHVnV3hPWENBRkdZMEZMZ0o4UC9qbnFpcllUY05NWmlVQ0FMa1p6YldE?=
 =?utf-8?B?N0VvQ2pCNDRBVVVZbTl2dlU4Ujk2QklhRlF2UWhiQ1BLbi82b1BNbGJFcnpm?=
 =?utf-8?B?ZUNkbDQwZjlhdldTTVV4RGYxN2o2R1c4bktmYnhrQkVqN016aG9jd0doNlBz?=
 =?utf-8?B?eXpwWmV3SW44RmZCc2lHOFZXSGRvVWUzbEdsQk1OOFFFWm41dksxdVkxMzdj?=
 =?utf-8?B?OUdFcmo5WDVIcThTRFhMVlFuR3dCWnorcWQrZG9FRzNmZWlnOWEzMjhuYlNY?=
 =?utf-8?B?WEhjMjJpMVU2Mk1xRE5ra1ViOEJ2YjVWb0h5OFU1Y2JXOFBhRDJpbjAxUW40?=
 =?utf-8?B?RWNpc2JKak92VE5qd3pjdFh3UVRyRVArWFpka0hPY3lMalJaWk0vSG8zbmN2?=
 =?utf-8?B?eVBqNzRMemlMdi9BWEs1eWRRUmZacERCbnowV21RODRvZUFiK2hDTHNheEVG?=
 =?utf-8?B?bUM3SkxFSzJsanB6bjh2RmZ6bFVLYzV1enZOYVJwcHdHamZqeE9lWlNmQ0hn?=
 =?utf-8?B?SUd4TW92TzRTVnJ6L1RqVHVaRjdORUZUZTZFQWtTMEhuRmJLdGhaanNXc3Fo?=
 =?utf-8?B?RHVjTFJWVmZxdm4zS3NzN1RSWjRlUzY1WW1GT0dZSXFyNGYwVjdoZGQ4bnlB?=
 =?utf-8?B?RW5yY3J4akRSYlJGWFEzaDJrZjJtbkpkYysxbjhjTkJSTmhaVkpNS28rWWZ6?=
 =?utf-8?B?S01CaHNoaDltOVFLazIxa2UvODl3UVhrUG9kKy8xTEJNeTUxSHVVTXV0M0Ft?=
 =?utf-8?B?S045OXRJM081MGg2UjVocDN3ODlJOW96ZGUvUGVyYTdkQ2IzcUh2cGVkRDJa?=
 =?utf-8?B?NEV0ejc2UTVYM3pLQWFuZGRmK0xGeHZ0K3VhMUR3YWF2TEdTRjRDWmJPZ2ta?=
 =?utf-8?B?UVNVSHpvTUI2VVlTSVppZlVzUWQvR2VXalVwS0dCaXMvejJPbVdWRk1va2Jn?=
 =?utf-8?B?Zmkrb1pvQlV4dnJqWU5kY1Fyd0xPb3hPQnlNNkJCa3dkVlVqMTBRT0xDdEZl?=
 =?utf-8?B?ZnQvbnk0UVBYd2J1VXlDejFabUpyY1hHMS80YnpJTlc4Q0NJN0FrNWF1VjJo?=
 =?utf-8?B?dEcrcHoxd29ZZ2xaRkFBNVFwM0pMQXVsZnFnV3Z2OWJSeEp3MVRxVVp2Mkxz?=
 =?utf-8?B?cXU1Nk9kclRUeTIvUGwwQkQ2UjhjZVBaNjFONTFLTGxRNTc5L0k2ek13TGpi?=
 =?utf-8?B?RXZ5MmR2dzFXYmtHb2JZOUJXU2JDMU9obk5yUGticFhDeGRPcnlqWE0wUHh4?=
 =?utf-8?B?TTQ2U0VFQlM1UFJDZE5Jdm1lS0F6U05EZDA4ZUJUSWQ5alFYT1dRWTVCbWdI?=
 =?utf-8?B?b0sxbUxwUW9CVTNMdVpyVTB6elh4a2VmTnZjME5ydzdaOHozaFlzWjg1YTRq?=
 =?utf-8?B?dVJScGhSOGZSMEVmNWkwVUFpVy9HWVZNMnNRY0lwZzBEMmg1MHVEQUN5SmxQ?=
 =?utf-8?B?a3ZHd3Y0dTh5bTdLeDJGbEMrbmxHeHpZNzAvM2lOSFA0eHlLTk5FVlR3eTFF?=
 =?utf-8?B?ODhKMW9EbzlDbzNnZ0dWNk8xMHNJL2wvMmx5a1dMQnhCeWtQdHUxRkN6NHAz?=
 =?utf-8?B?cGNpYUg2a2NhYldpME9UQjBXbHJ5czU3UE54T2tOVGVyUmVzdTFwSmoxZ3dz?=
 =?utf-8?B?SmVZbVpjQysvSEZteng4Y2pZeGdKM2pwK0FJWnM1bEtOcmNJVklYVll6NTBu?=
 =?utf-8?B?WlVzYmhDeWduaFB2TXJnb0d3UnFPOFhuSk0xdEhPQ1ZkUjY3aENxTVdqdS9y?=
 =?utf-8?B?MVJuS3ZtTHYvZitJdFRqRktVQlZ3YU81YmVqWFVhWDhPSzdFQkpGQXNvUEho?=
 =?utf-8?B?QUlGY0NIQmlFT3BmSWhiZngreVpCa21acVNIUTYzOVRLUUgzSklJSnAwblhW?=
 =?utf-8?B?SGpBYnNDZDZlN0NmVUJvMnFDYVZXaFg5ejJqNkU1VHI1U1V3VzhPMmxQUnJk?=
 =?utf-8?B?dzhOTVJneFlWb01CRXM3UUE4YjNQL1pmeFRXVzM5V0x3emdWSVh2QUNXUmlr?=
 =?utf-8?B?OWZkVFNhV0l2NXp4S1lQRWkzdWhqVmRpZGYwRVZLWlAzb0JvQWwyT2lJcGNo?=
 =?utf-8?B?ejJCMDZrNzNZWGN3SEVuUTFoRjNMVG9HUmlnVlBOdlA1M0ROdE5FY0VlM3Vq?=
 =?utf-8?B?R01WMEFXNkxSQ2sxbUY2cUE1emdHL2hlK2pnQWpxTlU0dkE2bWhzQT09?=
X-Exchange-RoutingPolicyChecked: IlfrX5BKiu97cLM+KnLVue2m4GttgPbhc+s+RaBAiGfQxcYMhfebe7TGa5jydHTuGH1lv6d04UsNwZ519x5N8MflqWdBOl+tpo3wgHFUhbz4FcOI9jA3uQypOCFspJI2c13xY4Umox7FrM/o2QYMarqykCEAKtaeYv9EiFB2OKSFy2JMPpsUVV+56m+PRkJ1QYDHXytItuLswqVW1TpxEr4vK5xv8t81nEGlco6cpJvYsoltnhNKJv1ZV5sMBY4z0IvVjqdIOJRW1GfrQUfeGuFLMEiiQ8wsxnsSJwiwsOqP5IjMdKRCJB7C1nkW50WR4qveP4WWpMtZsCTy+g3+0Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f7ccba-61c6-4970-431e-08de83613710
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 13:37:49.6108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a0HEV7L2k/z+fw1FTK8ELlGtmlS6HOvhQs8lyaTBprSz28gCQpl6TIeAlr/KfQRrsJ++yXpddQLjNhJOX5QjFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
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

Hi Aditya,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 13-03-2026 06:04 pm, Aditya Chauhan wrote:
> Introduce core blocklist for the NVL platform containing
> NVL-specific core test exclusions. Also add this blocklist file
> to meson.build so that this can be used in execution.
>
> v2: Make commit message more descriptive (Swati Sharma)
> v3:
>   - Use correct subject (intel-ci) (Swati Sharma)
>   - Add blocklist in alphabetical order in meson.build (Swati Sharma)
> v4: Make comments more explanatory (Swati Sharma)
>
> Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
> ---
>   tests/intel-ci/meson.build               |  1 +
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 97 ++++++++++++++++++++++++
>   2 files changed, 98 insertions(+)
>   create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt
>
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index cf0023c63..3c7fa28b7 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -23,6 +23,7 @@ intelci_files = [
>     'xe.lnl.display.blocklist.txt',
>     'xe.lnl.eudebug.blocklist.txt',
>     'xe.multigpu.blocklist.txt',
> +  'xe.nvl.core.blocklist.txt',
>     'xe.ptl.core.blocklist.txt',
>     'xe.ptl.display.blocklist.txt',
>     'xe.sriov-vf.blocklist.txt',
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> new file mode 100644
> index 000000000..0f9750961
> --- /dev/null
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -0,0 +1,97 @@
> +##################################################################
> +# SR-IOV/IOV tests are not applicable for native
> +# configuration and will be run under its separate configuration
> +##################################################################
> +igt@.*iov.*
> +##################################################################
> +# All Display related tests are being run under
> +# separate display configurations
> +##################################################################
> +igt@.*kms.*
> +igt@testdisplay
> +igt@xe_pat@display-vs-wb-transient
> +igt@fbdev@.*
> +##################################################################
> +# Valid skip: NVL is an integrated GPU and does not have
> +# dedicated VRAM. Tests requiring device-local memory (VRAM),
> +# small-BAR configurations, or VRAM eviction are not applicable.
> +##################################################################
> +igt@xe_mmap@vram$
> +igt@xe_mmap@small-bar
> +igt@xe_noexec_ping_pong
> +igt@xe_create@create-big-vram
> +igt@xe_evict.*
> +igt@xe_pm@d3hot-mmap-vram
> +igt@xe_eudebug_online@writes-caching-(?!sram-bb-sram-target-sram).*
> +igt@xe_compute_preempt@.*vram.*
> +igt@xe_vm@out-of-memory
> +##################################################################
> +# Valid skip: PAT index tests targeting older/different platforms
> +# These PAT (Page Attribute Table) index subtests validate
> +# platform-specific memory attribute encodings that are only
> +# defined for their respective GPU generations
> +# like ADL, MTL, LNL, BMG, PVC.
> +# NVL uses its own PAT encoding; running these tests would
> +# produce incorrect results or false failures.
> +##################################################################
> +igt@xe_pat@pat-index-xehpc
> +igt@xe_pat@pat-index-xelp
> +igt@xe_pat@pat-index-xelpg
> +igt@xe_media_fill@media-fill
> +igt@xe_pat@pat-index-xe2
> +##################################################################
> +# Valid Skip: Tests requiring multiple CCS (Compute Command
> +# Streamers) engines — NVL exposes only a single CCS engine.
> +##################################################################
> +igt@xe_compute@ccs-mode-basic
> +igt@xe_compute@ccs-mode-compute-kernel
> +igt@xe_compute@eu-busy-10s
> +##################################################################
> +# Valid skip: Features / hardware blocks not present on NVL
> +#   - xe_huc_copy@huc_copy: HuC (HEVC µController) firmware is
> +#     not loaded/present on NVL; HuC copy operations will fail.
> +#   - xe_exec_balancer@.*: Virtual engine / load balancer tests
> +#     require multiple physical engines of the same class for
> +#     balancing, which NVL does not expose.
> +#   - xe_oa@oa-tlb-invalidate: OA TLB invalidation test relies
> +#     on a specific OA unit configuration not present on NVL.
> +#   - xe_pxp@.*: PXP (Protected Xe Path) content protection
> +#     requires a TEE (Trusted Execution Environment) and
> +#     associated firmware, which NVL does not support.
> +#   - xe_exec_system_allocator@.*: System allocator execution
> +#     tests depend on hardware features (e.g., SVM/USM page
> +#     fault handling) not enabled on NVL yet.
> +##################################################################
> +igt@xe_huc_copy@huc_copy
> +igt@xe_exec_balancer@.*
> +igt@xe_oa@oa-tlb-invalidate
> +igt@xe_pxp@.*
> +igt@xe_exec_system_allocator@.*
> +##################################################################
> +# Valid skip: test applicable only for i2c capable systems
> +##################################################################
> +igt@xe_pm@d3hot-i2c
> +##################################################################
> +# Valid skip: multigpu/multitile tests are not supported on NVL
> +##################################################################
> +igt@.*@.*multigpu.*
> +igt@xe_peer2peer@.*
> +igt@.*@.*tiles
> +##################################################################
> +# Valid skip: Not Applicable for iGPUs
> +##################################################################
> +igt@intel_hwmon@.*
> +igt@xe_mmap@pci-membarrier.*
> +igt@xe_configfs@survivability-mode
> +igt@xe_survivability@.*
> +##################################################################
> +# Valid skip: EU debugger and SIP (System Interrupt Protocol)
> +# support is not yet available in the kernel for NVL. These tests
> +# will be re-enabled once the required kernel enablement lands.
> +##################################################################
> +igt@xe_eudebug@.*
> +igt@xe_eudebug_online@.*
> +igt@xe_exec_sip@.*
> +igt@xe_exec_sip_eudebug@.*
> +igt@xe_live_ktest@xe_eudebug
> +##################################################################
