Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A03EF532E9
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 08:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1110E5C7;
	Tue, 24 Mar 2026 08:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fBjhNOMn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC8710E5FD
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774339679; x=1805875679;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=J1uOcvVvFx1a7cpmtnVIEkgu96Tj19H9wg7QK+WRkso=;
 b=fBjhNOMnJmUUGgmJlKUkbZcVr8LpjZNR2idtvbDVISbpGwSAryf+jKCj
 +MCDXiS3gpBDpdHScSOMXkJpcagZZFx0pjYSAqD7HqMlagsHV7iTHXVw1
 NNfDoO1XLO8Bstc3aTEimFLGrfZowAZjZCg32Tb9mdnoA4BEAT90Z5lxg
 +H7Cpuj0pfDDrvXT1bhnR52MTtpz44Om0SfZzQcFPqtAQXzPFsHTo9Yp1
 0prOfkJOvdvnx7yG8NVvZukAA/7rAjUIZ+A5nYbxJCoD5A6ElRT/PJwxL
 ru8O3WG21lzzkID0beMydECTA8VZ0vLrrAdzFaBI/KIXopp/ilQBs+BL1 g==;
X-CSE-ConnectionGUID: hOcbLoJcROGgkuUmuNr5+w==
X-CSE-MsgGUID: XgzJRk3ITaGQr+QDPkHShg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79205614"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208,217";a="79205614"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:07:58 -0700
X-CSE-ConnectionGUID: MIBEtQvORq65MrU7XvcbsA==
X-CSE-MsgGUID: hQQl0VSaS8mQwTCZeMeMLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
 d="scan'208,217";a="217715440"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:07:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:07:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 01:07:57 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 01:07:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bppX6yqg/5jQJLecA+eoRLDICmghIQ0q7vO7Oe3EUVjCOblzhSGUnFpXjBYBCNngu9iIK/a7iUmxrbEl92vOEbBfn/k4zPLNUGZ2zCqmDrxyZQysLP4/94NKQMc2vlJ3+bQg1+clRp0ITJFZ/lnoIFB+PRYcSBEqrc2IgBnn+fTYn9NNg3FhRhuXrVwsdQboowkijYu1fjXZRylY8tN4Vk+5mVz82LeIV05qiKiwIpUEEKR3S35bzwcTz2AnQipbS9lmYiD0FdMFDiBmlqBGw6vAOS0YGQUn4HrMavzgtQo+KwruYJtWXXP4tH6XqolLTIUlOeAdxS6FjklLfdKp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmLrs26s7eYnAggsXO60cakJk8J9WelVe9LTjG7Kg+0=;
 b=MDpAirC0hG2HaGASH+2OthTAOErfTONGNYHVIeUkvcl/76GUr3t4L7WevCLcyHMcfqfw7j0jCYDmJDyr+KqTmeKv7hTDEtYg4Y5QqnNN5WeRjLbPZNKY7Dhvt8NLIdkQEd10iDWP7qmDImfBvioTFPkeLJHRynJi63a9CwL4GNPlcmgW+KvQyLP22dy2ryY4FwuD/B1yUaEoUCK93DDELXiIbqIIpJNMMssbjMa3N0HAxWTigNxSHEe2cUu9BdFY4HiWRcKnPlWpVewpFc76mM8x1u4qTIrmdbiQvkdFP6CS8YlS86cLuPtS81biUwmFkSAdIkz5YBO0pB/yK4Bb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 08:07:54 +0000
Received: from BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737]) by BY5PR11MB4260.namprd11.prod.outlook.com
 ([fe80::c0db:54d6:c2c9:a737%4]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 08:07:54 +0000
Content-Type: multipart/alternative;
 boundary="------------Rpqd0zZXs9c0FxG4ZzJ6fIKo"
Message-ID: <e8ee8ac7-8b5b-4da8-8258-f38ec559f78f@intel.com>
Date: Tue, 24 Mar 2026 13:37:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v9 46/49] docs/unigraf: Add unigraf documentation
To: <igt-dev@lists.freedesktop.org>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-46-a01dffc3b0cb@bootlin.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260316-unigraf-integration-v9-46-a01dffc3b0cb@bootlin.com>
X-ClientProxiedBy: MA5P287CA0243.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::17) To BY5PR11MB4260.namprd11.prod.outlook.com
 (2603:10b6:a03:1ba::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: edfd280b-8e20-4cc3-399d-08de897c7375
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|13003099007|18002099003|22082099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: mUr5kYjbTUt7eJ5GCLl2AvG5JfczKR07/xrAzJWd4X7F6YaK2Lcp/tkHowpHQOzOTY+yIPmTNrTbKtoXdiVL1ab7pKrRnREsd7hikWCxT+pegxFHpg/B0T2vhekAH6nbBBQ28plImaFQIMb20CGAQ7dQpKFAJHB9H1NJVWSw7Wwo8u+Fde6M+XLz804l9Ov5nqYuP+0gfNUf4owxwhnAcQXS8mya5+v1bRZce3hetvqPFdRyQ9Thl4tFtzA1aKEmcXI7y5t35mF4Ku6fHProq/i46P20jjZpOlW63IAj5Wlc6oGmJBZsr2Nj2ZbgALDmHLM6HboeQc74Lodt1JMDEjwSBG3lW3dS1OY7aQwJCLlBA/0v4ZENPOXyEV4hyCbyhUsm+S/7WxsbFZdrAppsVfYsYnYlc7nL1ljcz0jGhr8Ya4vteu0X/lPXlholSlTmN71/pQbWT7rdGZ5HO7xcSOl695MWzw6NR1147jk4TiWKjkv876uHCDLtgbJDejXadpaWfMUIwNhAGjaQtV5DSoMmZxqQf8KmLMFWyioOL6Kvy+93LluViKZHElrNYrLj0T+r54RuzFCb1oHj2KV//0yubsolVPO6+DOVfKfrfc/OfVZFO+PFIIw3U3QrEaBcgTZkaEI7bfl7VG65Ca6GnFG5Y6hPuS9OJ7RFn7z2UhmlUfklScDsWKVZZLySlKzg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4260.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(18002099003)(22082099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2dSdUpqL2E2WGkxZUVDR24wc0hJcjcyWWllMTNvSW53YkVqTXIyaGQvUlNG?=
 =?utf-8?B?ei90bGNVcjlOWUZON1ZQdlR3K2JKSCtjZHlFZkJhaGhwUS93Y2hVRUFzajhM?=
 =?utf-8?B?WW9Nbk0zZkt4bGhhcW9UVG85UWFpSVdxUnBNTHBJam13Y3RyUG44Tm92Q1dw?=
 =?utf-8?B?ZE8zZlZGZytsbmNvVS9jS08wa0tmMXZpWkFjNjNaVDlyMk5RK0ZlZUIyLzdG?=
 =?utf-8?B?L1M5RVZ6VkVXeC9hT3VDdFFHNDEyZzBGS1JsV0JoSUlza2JWSGhvRTFRbHQy?=
 =?utf-8?B?S2Irb0xDS2FNSUFPZ1B3YjZBWVh1cUtVTlZLSk5ybElrRkhuaXlQSlI0K3hB?=
 =?utf-8?B?N3ZtcEhHZDNrbCtZMFZKSndmU29jZUNUa0Q4YTZZdDI0Z0pTWlhMdnE0RHBi?=
 =?utf-8?B?L3JMZGZqUFMwSkFQRVcyNmlXdTk0VFFrU3N1VXZBNVlSSjEwc1pldjk5T1dD?=
 =?utf-8?B?UEZLYTdPMkFOektoY2hYOEZxUnpCNDBIYk92ZVgrKzhDMHFyVVA0WFNOUUVQ?=
 =?utf-8?B?bVlqTlhOQVZFZGNvZGgzY2t1amJWYkVtM2xVQzNZU1g4aWtXL1J1Y0xyR3Bt?=
 =?utf-8?B?NlVUcWR4VGI1TEw2NTVaR2E0MlFCZ0hhUjZ3Z1E2dmtHbUw3QnFhb0xKVjQ2?=
 =?utf-8?B?WFVjQ1lrM3VHOUVGZVpBVlEvMmlSY3RqZmlBQ3ZzcmRBOVU1bE5tZG9nVncy?=
 =?utf-8?B?WWhXK2FENDRLUktLaTN1MWdLSW5xUE1OeWNGRFhzTWhDZS9NbXZ3MXhHSGph?=
 =?utf-8?B?Y2VkQURNZElJZ0QwV0hDUGhtalIwczNMSmxBK2MyMDAva2VXRmVNbTlxbzlT?=
 =?utf-8?B?TWViL3NuT00xUlhsQjRjeElUODhaTURLVDRVcnhuTGp4cml0dTBpRmNZcW9J?=
 =?utf-8?B?TlNtYjRSVHowZURKZGNzMkFGZFFaYW1DUkt1czcyS2M4Qjc2enc1NmxwNzRO?=
 =?utf-8?B?aUd5MjVJMEwzMVJ6b2xSZzdPUWtNdWFCN1FDSndmdGQzTk5Ub2svMmI2cHRi?=
 =?utf-8?B?M1JHK3lTM2FxOUo2V0N2M01zWnllK1hwMHQvMFA5Y1c1ZEZiNUQyQlNObGNW?=
 =?utf-8?B?VkRQSEZRV01lbUVDYVJIRFVEMURqQ3V2OXVCNXZERi8vMzNzTHZubm4zKzNy?=
 =?utf-8?B?S1IwZ25pR2JyU09wWm0wdzh2UlhocUxwZTRZUWNHQlFBaVRKRFBKYmppSTAz?=
 =?utf-8?B?bDVDcGZ2Y0ZTOFhsYWdteVdiVHozS3hPWGlHMVVLZDBiZDBJZEFTMUVHUVBm?=
 =?utf-8?B?NnQzOHd0RytJeTkvUlJCTnBzZk1lZFdqOFVrcWVLenpDVjFpdklJRzkrSm1N?=
 =?utf-8?B?N0swREw5OG5UTXgza1pGUHZyUytDWjE0dURMa2JiWUJhMFpubURLY3ZXNjVJ?=
 =?utf-8?B?U2lWc00yRmx5UG8xanZGY0tJcDRWMnRmZTJvWE1hVDFRNVJWVk5aTnIyaEc1?=
 =?utf-8?B?aVdkNkE5bGhCUndLcXdIRnh5ZFFydGpPU0U1azFiZFdFK21XUlRubVJ1WFlX?=
 =?utf-8?B?SC9DT0ZENjd1VGlIK2FuYjFaU3J0Lytmd2YyVzNyMVVydlJ2ekFCMTNpeXRq?=
 =?utf-8?B?WVk3K0dkcURBRExDdzNLQ2Q4UFR2V0gyc2Zvb0ovQi9uOS9IdEJ4RkNUNHU3?=
 =?utf-8?B?cnc0ZHBiTlJZa1JPTEY4dlVpUUVKbnkyR3Rhb1FmVjh1V09tWHJJNDA0ODVH?=
 =?utf-8?B?dUtHNXFrQnZQNG8zT2VrejNweGplRncxR0VkWEswaS9DWDI2RURSTDJGNlll?=
 =?utf-8?B?ZUxVVkhjcEJRa01Lank5WmozWVNMRlhKMTMxYUwvdTFBY1huaHZ4K1o5Q0hR?=
 =?utf-8?B?SnJ4RnZzZFoyRUZlVkdmMUsyV1FlU0NQSVFEQVF0alVCOFBuaDVoSm0zajJr?=
 =?utf-8?B?L0RmdVQ1Q3dpQ3BUUmV0UnJ4VmY1ZCswWHlENjViSjhUZUZrTmlMaVg2MWdq?=
 =?utf-8?B?U09WSG1ucDlvL2lxZ1JIRTk2ZWl3UmxDRXpPckdRVU1mZ2ZkNUFBUm5NUzRl?=
 =?utf-8?B?VHlzOHhrcHBJVUdwbVRwR1NReFdjbUZtRmErNnVTRGw3V2h4SWUwZ1RObkxD?=
 =?utf-8?B?alNyNGhISDZ5SnhqQ2hvTkJTbklpcUlFK0JlT2loSDlFRHg2b0FCUUQrMUNa?=
 =?utf-8?B?OVF3K3R3bDBzV0Fxazd5bGEzakJML2FQOVltdFgxSk51czdoZFR0VVdXdEh2?=
 =?utf-8?B?c3hMK09MbGc1MXJkNXRVM1JTVjR1MTJtTEF2cWowZmprNEVQM3I1ejUrbUVT?=
 =?utf-8?B?QnJkV3owdlRmSGdLeGl5MmlXam51OHA2RFBJR1UvTk53RUhwbkNIUW5ML242?=
 =?utf-8?B?NG9WdDlRVmNvdDltWVkvaFBYN0E1S1pTQUNUSmgwWXRmTEc0VzRwalpUQ2xQ?=
 =?utf-8?Q?6p4hyPJwvh1HfqsM=3D?=
X-Exchange-RoutingPolicyChecked: Qcxw3wt35SjD4OhYj8RWYTsdSyFZ5D97ixW++kArrkML/dAGwE9FzQg48JCKxgRFWMUVhZtVOaDjYk2dvCAImuWuuwj+UN6ODQ3lltgKCIS/JIgljji2HAHw6qYq+rvDaDAIt4dlvtcjfoj4CtraCl8LgpvNriTpDnWaURVSeEEJ2B5Q0sE60OHnmYwmaEnE14TJRQ/VWTzSCbYDkSpVegwRP9uFWA2TyLw22Z03o4791wzlxmA2uT/dK2OFu3hAGfRsLP1e9lsZOBMlb7Lj7ZJaVvf9s5IDEO5HyqCCyeXQk1SypoO5ubQkfpAhu5N8Kexk12ee6DnhWxGt5gNv7A==
X-MS-Exchange-CrossTenant-Network-Message-Id: edfd280b-8e20-4cc3-399d-08de897c7375
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4260.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 08:07:54.2481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zuZKvw7/7Xl9uAsDvS3mdRbT/PmcJXME54qYWKMPtg812I9+p5APvgbdMmbGcbOxVoxNZIM5HGasRN8zACjhkOQYmK17zYh6Ma7HZ0O9tLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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

--------------Rpqd0zZXs9c0FxG4ZzJ6fIKo
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Louis Chauvet,

On 3/16/2026 9:48 PM, Louis Chauvet wrote:
> Add unigraf documentation to explain how to compile and use it with IGT.
>
> Signed-off-by: Louis Chauvet<louis.chauvet@bootlin.com>
> ---
>   docs/unigraf.txt | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
>
> diff --git a/docs/unigraf.txt b/docs/unigraf.txt
> new file mode 100644
> index 000000000000..37996a2ef98b
> --- /dev/null
> +++ b/docs/unigraf.txt
> @@ -0,0 +1,81 @@
> +Unigraf Support in IGT
> +========================
> +
> +This document provides information and instructions for Unigraf support in IGT.
> +
> +Introduction
> +------------
> +
> +Unigraf devices are a set of devices that can be used to test all sort of graphical
> +interface and signals. See Unigraf website for more information about all the
> +capabilities of each devices:https://unigraf.fi
> +
> +Unigraf documentation
> +---------------------
> +
> +All the documentation for libTSI, the library used to communicate with the unigraf,
> +can be found on unigraf website:https://www.unigraf.fi/downloads/
> +
> +Setting up Unigraf
> +------------------
> +
> +For most of the unigraf devices, this should be as simple as "plugging the
> +unigraf and plug the video cable". If you need to install some license, upgrade
> +the firmware... please take a look at the official unigraf documentation.
> +
> +Compiling IGT with Unigraf support
> +----------------------------------
> +
> +Unfortunately, the communication with the device use a proprietary library and the
> +underlying protocol is not open. To use the unigraf you need to install the unigraf
> +SDK, grab the libTSI.so and make it available on the build machine and the DUT.
> +
> +Deploying the Unigraf with IGT
> +------------------------------
> +
> +Unigraf may work out of the box: by default if IGT find a unigraf device, it will
> +try to connect and configure it to use USB-C input. This allows running most of
> +the existing tests without an actual screens.
> +
> +Here is a complete example configuration:
> +
> +        [Unigraf]
> +        # Choose a device using his name, you can find it in UCDConsole (installed with the SDK)
> +        Device=UCD-500 [2434C620]
> +        # Choose a role for the device, you can find it UCDConsole
> +        Role=USB-C, DP Alt Mode Source and Sink
> +        # Choose active input for the device
> +        Input=DP RX
Please document the required Input parameters(DP RX, USB RX) in the 
|igtrc| file for each supported *Role* type. When an input name is 
missing, misspelled, or incompatible with the selected Role, the 
function |unigraf_open_device()| triggers an assertion.
more log info:

Starting subtest: unigraf-connect-edid
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Test assertion failure function unigraf_open_device, file ../lib/unigraf/unigraf.c:495:
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Failed assertion: chosen_input >= 0
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Last errno: 2, No such file or directory
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: TSI:0x5dad11372b90: Input DP RX not found.Subtest unigraf-connect-edid failed.
**** DEBUG ****
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:(nil): Initialize unigraf...
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:(nil): No connector name configured, will autodetect.
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:(nil): Detected unigraf device 0: UCD-500 [2607C673]
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Successfully opened the unigraf device 0.
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 0: DisplayPort Source and Sink
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 1: DisplayPort Source and USB-C, DP Alt Mode Sink
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 2: DisplayPort Sink and USB-C, DP Alt Mode Source
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 3: USB-C, DP Alt Mode Source and Sink
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Input 0: USB-C RX
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Test assertion failure function unigraf_open_device, file ../lib/unigraf/unigraf.c:495:
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Failed assertion: chosen_input >= 0
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Last errno: 2, No such file or directory
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: TSI:0x5dad11372b90: Input DP RX not found.Stack trace:
(unigraf_connectivity:22870) igt_core-INFO:   #0 ../lib/igt_core.c:2108 __igt_fail_assert()
(unigraf_connectivity:22870) igt_core-INFO:   #1 [unigraf_open_device+0xb8e]
(unigraf_connectivity:22870) igt_core-INFO:   #2 ../lib/unigraf/unigraf.c:532 unigraf_require_device()
(unigraf_connectivity:22870) igt_core-INFO:   #3 ../tests/unigraf/unigraf_connectivity.c:58 __igt_unique____real_main35()
(unigraf_connectivity:22870) igt_core-INFO:   #4 ../tests/unigraf/unigraf_connectivity.c:35 main()
(unigraf_connectivity:22870) igt_core-INFO:   #5 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
(unigraf_connectivity:22870) igt_core-INFO:   #6 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
(unigraf_connectivity:22870) igt_core-INFO:   #7 [_start+0x25]
****  END  ****


> +        # Set the connector name used by the unigraf device. If not set, IGT will try to
> +        # autodetect which connector is used.
> +        Connector=DP-2
> +        # Set the EDID used by Unigraf
> +        EDID=DEL_16543_DELL_P2314T_DP
> +        # Enable or disable the use of Unigraf's CRCs instead of the CRTC CRCs
> +        UseCRC=1
> +        # Set the number of emulated MST streams (0 = Single Stream Transport, >=1 = MST)
> +        MSTStreams=0
> +
> +Current Support in IGT
> +----------------------
> +
> +Support for the Unigraf devices in IGT is found in the following places:
> +* lib/unigraf/unigraf.[ch] -> IGT API
> +* lib/unigraf/TSI.h -> Header for libTSI.so, not provided by Unigraf
> +* lib/unigraf/TSI_types.h -> Header containing all the relevant values from unigraf SDK. The unigraf SDK can't be used directly because it is only compatible with windows and c++.
> +
> +Current unigraf.c features are:
> +* Plug, unplug, hotplug pulse
> +* EDID management
> +* MST/SST stream management
> +* CRC calculation
> +
> +Current testing are:
> +* All igt tests that require a display and use a CRC (kms_plane, kms_cursor_crc, ...)
> +* Basic EDID and MST tests
> +
> +Planned tests:
> +* Link training scenarios (link rate, lane count, scrambling, ...)
> +* Bandwidth constraint management
> +* HDCP content protection
> +* Display stream compression
>
--------------Rpqd0zZXs9c0FxG4ZzJ6fIKo
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi&nbsp;Louis Chauvet,</p>
    <div class="moz-cite-prefix">On 3/16/2026 9:48 PM, Louis Chauvet
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260316-unigraf-integration-v9-46-a01dffc3b0cb@bootlin.com">
      <pre wrap="" class="moz-quote-pre">Add unigraf documentation to explain how to compile and use it with IGT.

Signed-off-by: Louis Chauvet <a class="moz-txt-link-rfc2396E" href="mailto:louis.chauvet@bootlin.com">&lt;louis.chauvet@bootlin.com&gt;</a>
---
 docs/unigraf.txt | 81 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/docs/unigraf.txt b/docs/unigraf.txt
new file mode 100644
index 000000000000..37996a2ef98b
--- /dev/null
+++ b/docs/unigraf.txt
@@ -0,0 +1,81 @@
+Unigraf Support in IGT
+========================
+
+This document provides information and instructions for Unigraf support in IGT.
+
+Introduction
+------------
+
+Unigraf devices are a set of devices that can be used to test all sort of graphical
+interface and signals. See Unigraf website for more information about all the
+capabilities of each devices: <a class="moz-txt-link-freetext" href="https://unigraf.fi">https://unigraf.fi</a>
+
+Unigraf documentation
+---------------------
+
+All the documentation for libTSI, the library used to communicate with the unigraf,
+can be found on unigraf website: <a class="moz-txt-link-freetext" href="https://www.unigraf.fi/downloads/">https://www.unigraf.fi/downloads/</a>
+
+Setting up Unigraf
+------------------
+
+For most of the unigraf devices, this should be as simple as &quot;plugging the
+unigraf and plug the video cable&quot;. If you need to install some license, upgrade
+the firmware... please take a look at the official unigraf documentation.
+
+Compiling IGT with Unigraf support
+----------------------------------
+
+Unfortunately, the communication with the device use a proprietary library and the
+underlying protocol is not open. To use the unigraf you need to install the unigraf
+SDK, grab the libTSI.so and make it available on the build machine and the DUT.
+
+Deploying the Unigraf with IGT
+------------------------------
+
+Unigraf may work out of the box: by default if IGT find a unigraf device, it will
+try to connect and configure it to use USB-C input. This allows running most of
+the existing tests without an actual screens.
+
+Here is a complete example configuration:
+
+        [Unigraf]
+        # Choose a device using his name, you can find it in UCDConsole (installed with the SDK)
+        Device=UCD-500 [2434C620]
+        # Choose a role for the device, you can find it UCDConsole
+        Role=USB-C, DP Alt Mode Source and Sink
+        # Choose active input for the device
+        Input=DP RX</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Please
      document the required Input parameters(DP RX, USB RX) in the <code>igtrc</code>
      file for each supported <strong>Role</strong> type. When an input
      name is missing, misspelled, or incompatible with the selected
      Role, the function <code>unigraf_open_device()</code> triggers an
      assertion.</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">more
      log info:</div>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">
      <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Starting subtest: unigraf-connect-edid
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Test assertion failure function unigraf_open_device, file ../lib/unigraf/unigraf.c:495:
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Failed assertion: chosen_input &gt;= 0
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Last errno: 2, No such file or directory
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: TSI:0x5dad11372b90: Input DP RX not found.Subtest unigraf-connect-edid failed.
**** DEBUG ****
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:(nil): Initialize unigraf...
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:(nil): No connector name configured, will autodetect.
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:(nil): Detected unigraf device 0: UCD-500 [2607C673]
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Successfully opened the unigraf device 0.
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 0: DisplayPort Source and Sink
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 1: DisplayPort Source and USB-C, DP Alt Mode Sink
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 2: DisplayPort Sink and USB-C, DP Alt Mode Source
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Role 3: USB-C, DP Alt Mode Source and Sink
(unigraf_connectivity:22870) unigraf/unigraf-DEBUG: TSI:0x5dad11372b90: Input 0: USB-C RX
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Test assertion failure function unigraf_open_device, file ../lib/unigraf/unigraf.c:495:
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Failed assertion: chosen_input &gt;= 0
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: Last errno: 2, No such file or directory
(unigraf_connectivity:22870) unigraf/unigraf-CRITICAL: TSI:0x5dad11372b90: Input DP RX not found.Stack trace:
(unigraf_connectivity:22870) igt_core-INFO:   #0 ../lib/igt_core.c:2108 __igt_fail_assert()
(unigraf_connectivity:22870) igt_core-INFO:   #1 [unigraf_open_device+0xb8e]
(unigraf_connectivity:22870) igt_core-INFO:   #2 ../lib/unigraf/unigraf.c:532 unigraf_require_device()
(unigraf_connectivity:22870) igt_core-INFO:   #3 ../tests/unigraf/unigraf_connectivity.c:58 __igt_unique____real_main35()
(unigraf_connectivity:22870) igt_core-INFO:   #4 ../tests/unigraf/unigraf_connectivity.c:35 main()
(unigraf_connectivity:22870) igt_core-INFO:   #5 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
(unigraf_connectivity:22870) igt_core-INFO:   #6 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
(unigraf_connectivity:22870) igt_core-INFO:   #7 [_start+0x25]
****  END  ****</pre>
      <br>
    </div>
    <blockquote type="cite" cite="mid:20260316-unigraf-integration-v9-46-a01dffc3b0cb@bootlin.com">
      <pre wrap="" class="moz-quote-pre">
+        # Set the connector name used by the unigraf device. If not set, IGT will try to
+        # autodetect which connector is used.
+        Connector=DP-2
+        # Set the EDID used by Unigraf
+        EDID=DEL_16543_DELL_P2314T_DP
+        # Enable or disable the use of Unigraf's CRCs instead of the CRTC CRCs
+        UseCRC=1
+        # Set the number of emulated MST streams (0 = Single Stream Transport, &gt;=1 = MST)
+        MSTStreams=0
+
+Current Support in IGT
+----------------------
+
+Support for the Unigraf devices in IGT is found in the following places:
+* lib/unigraf/unigraf.[ch] -&gt; IGT API
+* lib/unigraf/TSI.h -&gt; Header for libTSI.so, not provided by Unigraf
+* lib/unigraf/TSI_types.h -&gt; Header containing all the relevant values from unigraf SDK. The unigraf SDK can't be used directly because it is only compatible with windows and c++.
+
+Current unigraf.c features are:
+* Plug, unplug, hotplug pulse
+* EDID management
+* MST/SST stream management
+* CRC calculation
+
+Current testing are:
+* All igt tests that require a display and use a CRC (kms_plane, kms_cursor_crc, ...)
+* Basic EDID and MST tests
+
+Planned tests:
+* Link training scenarios (link rate, lane count, scrambling, ...)
+* Bandwidth constraint management
+* HDCP content protection
+* Display stream compression

</pre>
    </blockquote>
  </body>
</html>

--------------Rpqd0zZXs9c0FxG4ZzJ6fIKo--
