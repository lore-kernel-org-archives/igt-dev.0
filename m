Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41ED7CD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 08:07:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F5610ED35;
	Wed, 13 May 2026 08:07:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BltNRIbd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C6510ED37
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778659623; x=1810195623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Kcqa0ferZanm1WwbNw/NVzJImjA8L1Xu14pUP+cDWIk=;
 b=BltNRIbdNMzlk5nnfnKo6XQUKq7WiGp8PlEuv+JSlIKV3Qy64OjL65Rx
 0u+bkuvoaI6Wh2LqQJyO/jM3Zwiv+bo5E2AjiT1Bvl5qgtmq0nXMvBSbh
 JXxW+x0WflzkfgJLmV4iWYpKHQJFM8SgOWdfDxnww79D6lqw5VFyL/ha0
 YRq6h+ah03QheCIyhLxdoC8Y+F8hmBupLPaDBxbDrzAlxjYG8l+foC6vm
 6AFhldsopD7omPbU84QElkN2fjIdNRFz9CpQdtx32xksLKlfsqgtJlFai
 IVW+mHRbunI93KbQUZN/QrhnzTKo2/5VsUX4cMf9aF4CVM7Zk5t1La2PP Q==;
X-CSE-ConnectionGUID: YvOcVGbVTkq07jd541hPfg==
X-CSE-MsgGUID: gOKknBY3QI2HOEw0jDc1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="102246945"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="102246945"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:07:03 -0700
X-CSE-ConnectionGUID: WSp57tomQ6uEZF09bUmQew==
X-CSE-MsgGUID: tP8fzgwRRVSycDCcNRJIpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="276127135"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 01:07:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:07:01 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 01:07:01 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 01:07:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToQb3/pUNLmvaKo34KCLTtaFkxslEYDNqOVlLmyehoBH3uMqS57+XyDt6yj5FJJlO8YvNs4ksbvFe1TE9D2BN1kclrsVYTAM8wE5i4svvrAqDkfaj61RYt6TokL2DIpPmmJa4uCIfIfToTCxrk+QTFAziU6gt6RULD7+/oHw/XUDG0PT8Kz0j7ylhRW16/vkMJXlhmXoPssfIK9P++2k7TJEbvFaKMi/m2R9cb1C2zBN3mwZil4bBE1WAM5Yk8XBGmmXxjKxb86qZzWMKWswRvfI7k395UAgTArtN7eVuvRSvPSStx2D5JZqkjnZW2PFOH21/DvUBHm18ccj2+b1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlGbLrqF5Hk+uCIn80B6+peZw8vStJiTSxVB4S2i/94=;
 b=i4zaDsiQU7jNOctYaY5f8y3B8RkObZ6Rq4o2PZ/cg4p5YRYUvgdPWw2NAoXdfLVn/UcvX2+34Ncyj4cfHzwdItM1z2aKTdrKHP3ySQyGbZtAbqirQUU4fnpZE20gR14d7JkJAufmnbQXFPkIqBSMPVxM/6x9FTIkteO9ui7q7zawNsgQNS0EaGB5fdqMRRPDXKHOsy/XmhigE9HrmCUYisuDJsBdfapnSRliNeMID/g2noOQwh0KjADyOjTKrO+tUgh86fjJaNYEB+b5j3nu4X+R6/9NtoJhs24mI94gKH3F9EpInqxeeglfCChA2PQ3Pw57z7WyDfvRC19pSGUfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by IA3PR11MB9183.namprd11.prod.outlook.com (2603:10b6:208:57e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Wed, 13 May
 2026 08:06:57 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 08:06:56 +0000
Message-ID: <d086c5dd-bd9b-419f-ba97-5ddc857a627f@intel.com>
Date: Wed, 13 May 2026 13:36:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 7/7] tests/intel/kms_pm_dc: Add
 dc3co-vpb-framegap subtest
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <animesh.manna@intel.com>, <dibin.moolakadan.subrahmanian@intel.com>,
 <mohammed.thasleem@intel.com>
References: <20260511171820.461666-1-jeevan.b@intel.com>
 <20260511171820.461666-8-jeevan.b@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260511171820.461666-8-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0058.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d3::17) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|IA3PR11MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: 68906066-f826-4c9b-3628-08deb0c69988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|3023799003|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: 3IJ51tXGd4LoP+IUuCe9vr+ArzoWFBFGPpRtiYpcfAO7zbruOjn9m18LT3VptZUDb6dlaySkaPBT1OmUfZbMRv+rrxt4im0SPGqeH8c+sgvijW0VubVopi1UgvC51VyBszxojuSIYJ9wsCIUeN74QbqOP+OoX5a7yQNc8Aiw7o8QfQUA2nimf4YwhFl38HynMBb8zb4/fqMUWCJhJ7HTvM2XlhD3HdrpEy8YVWyLXEmgTxWGityQ2UqTJpqBFKm3IbZqLY5F2uTEar+tBmFVfI96GjHpVUHYSgce5+ykUNSX8jF1/9natDfVieLKkNHql8sCKbWTI4SVUYWfD8aXtIuFoxBCEzxpn6IkiMVP15rG8CESJHzZYNRsEVKj7vFEyserh6wtSofpXMUrUQ5dTuHSzzBcKhKJyIhMgKNfYGd793db3w2OSUzsAB4xWjNetSiw3eXreTIeVjklJOjhbYihIGb+mkqQD2cFC++jm9viGIXo/VZ5u6I7nJm8/hDI0xbBaA/gZXvh6n6qulnePubUOW0v0gxtgpS8HeuiqJyhiMgY2seNBsGeFYK4puZVi7NNJTP0NgDz0VPAvXpcjlIWNbEhZT3/ioVTpEVXJp00VOVkP5n4YlzyoUqnm1PNvRzvXxuys2js8N80w9naFMAP2qYiSo5UJlWppPUn8Q1rWMGXn1ICPELSfkaFs15n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(3023799003)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJGcUlNdVQ5ZXNScXdwOGozN1kyZXExSk9lN0llWUJObEJiVUpIWWcycEt2?=
 =?utf-8?B?eXdaN1k0dHBvbENpVTB0VVN6NkJYWkZZdmJwUEJoQWJWcCtZMjJQUXpGTk5a?=
 =?utf-8?B?RHVBS3hGQ1hhYVVIOXd5dlRlL1RHcTJZMEJJdUpmRlFPL1ZUWmhPSHZzTnNM?=
 =?utf-8?B?bjlXbG50Z0J0TkMrVEtTa1d2dlRWT2pPZ2pZTEJ1Q1poaGZZWXJ5UmdSV3Zq?=
 =?utf-8?B?T090MUgxTForaUd5VnlQYzJNTUNWeW5ON0k0bHRFUlhsZ2RtSWkxTUR3UGM2?=
 =?utf-8?B?MktqK0xxQ1l2UXdVRFg5bGZIS3NTVXpweUR2S1FDT09MS04vWWxHMGd2QnFy?=
 =?utf-8?B?UG1Qa3dlSCtnN0lwT2EwRGppN0RKYXpBalRERTdpOTBZM2ZMNmJFU0czMzRv?=
 =?utf-8?B?SHlJYUtrdjVlWE1wL0o2eHlNdXhPUHVxRFRSWUI1ckxHRE5oRlFVUWtKRTZS?=
 =?utf-8?B?YzZRTFd1Y0JXVVpIemRhVXRrM2QzL1EzallBTVFqTUloUEQyQU5xNTJRMERG?=
 =?utf-8?B?WkRuZFR5QWRoTEtiY2ZmOGxBUmx3WWNpMmx2RzZrZ0RaQ09qcnR1aVk2Zm1X?=
 =?utf-8?B?YzNWb1N4MHZ6VHhoM29wdzlvRURoSmRZcUNyNVgzbHpTNDcrVkVGQ3J4aFBo?=
 =?utf-8?B?OWxGZjVBRVFoRVYvN3NVa1JSSm1FQTNCTDlTNEUvQituWUtwRTlyQnFXVmw1?=
 =?utf-8?B?SGQ3azA0ZW5xSXU0OGFzRmxnRlVCekhTNFJuSWp4c3hKc3RlZHl3WmM4S29F?=
 =?utf-8?B?eGlibnZGZTZaSjQ4TlhOMVhWenBhU3NER29mRDZTNk9HZy92S3RodmMwaGI0?=
 =?utf-8?B?c1Y5UXNUY0cvL1p2UGV5ZzZaUUo1Ny8yZFBDNXFuMVJUdmQ0OXdxMS81N20r?=
 =?utf-8?B?WGxzRGxMTGEzZWZYMllkbndBS2NoZXJSejVYSWVKaE0xeHdSMG5RdjBiQUNU?=
 =?utf-8?B?NktsbFF6RWFDZ2VwYXRtNGNwbnljM0FjN2QxSXJuZmhlS0t4TFBrOStoaWhY?=
 =?utf-8?B?MzM2ckkzSkpHQUVaMlNmb0Z3Q0ViVEd4L1hpKzhGOVUrcnpwelkwd1UyaHM1?=
 =?utf-8?B?aitXZzVEVGdsNUFiNDFlMFYybzVXSXdNYmQ3cHpTZXhmcHZuSHlHMmluUHBR?=
 =?utf-8?B?RnFNaTF0d1hRazJoejJucGEyY2hHSGNZSEkrNnN3b2RmVTJZdUpQbjVROTk1?=
 =?utf-8?B?QWFYdW1OODg5WGlVS2cwVytMSEhjR2FiYlpURnZnaW5CeVNvdlFpSjJPMXc3?=
 =?utf-8?B?TDJsTXBNditXbGxUd054aGNBWC9OWXBxWUtzVTA4WWgwM2VCU1hxV2hNZ2hE?=
 =?utf-8?B?RlpvSytXcmsyNzlHVm11UlNsMCthTVI4bEZDOTJramVZWlhNT2JJOUcyV1o2?=
 =?utf-8?B?Q1dTa1FYdVdZR0lIWVArNlpKd1NJb1hra29CTTM1RXJqU3VPNVR5aDBPcy9U?=
 =?utf-8?B?SnVHRHJ4bFNJRUtZWTlRek9LRlFLbzFzVHh1dlNweGErU1hLS2RDMVhuVkNo?=
 =?utf-8?B?TzIwNkdyaFowV3lucllWK3psVElWK1NZSFFoUnpla2t3MkZ2b0hqZUtqa1Mr?=
 =?utf-8?B?d2w0eXhjYUxnZmNmcjdGOWQ2enJJeW11WHQwZ1RZMG1WeCs0UzQvNWN5NUJW?=
 =?utf-8?B?UTVSRUo1VTV0MmUxSlRJdWhMY0REcExhUTNSRVlVNHBaTjgwWUpqUkVpU3Uv?=
 =?utf-8?B?UDlpcHkzRm9IY2oyQ25xMjB0Y3VzTHFLNS9QSDdlMEJUOE8zOEZFOG14Umpi?=
 =?utf-8?B?U3V2ZXlzZVBDbnJBdG5JNUlrYkJyUEs2YTIra25HeThPYnM5bndJWkg2bFBs?=
 =?utf-8?B?emVNUEdVTGM4VFE0TW1DQXZlVkZXSUtodlRIdU9PdzNiTW1EMFZPL1BrNkgw?=
 =?utf-8?B?TmV3NENNSkVkVzJEUnZESTFCUk9yMkcvRUNsS21HZnJTU1BmeWFzaTJoQkxX?=
 =?utf-8?B?WXgwbWRCcjVlcXdmS0JNNi9YR2RLeE1DNHBxc0toQ3E4WWdwdXZvd0cvN3F4?=
 =?utf-8?B?THNNbmhpMVFxc0dvZm16S0Y3MnI1R3IvQU1pQmJWSm44aHpucUxTYktrQTMx?=
 =?utf-8?B?OGJsaERDWUkwdFIwbnAzMUJYYjh6NjM0b0JiK3BOUW5wNUFQK28vdGs4NlRk?=
 =?utf-8?B?aGlRdDA2ZEtROTNUbkJJTEpUTjZ5TmlxRk01T3R6QTlUN1Y0ellDMXZzNGt1?=
 =?utf-8?B?NjdjOUY0UWtLMzF4akIxRCtzUUVHcStCQ0NnRFNpcHdtcWxPTnhwdVpDMGdM?=
 =?utf-8?B?d0Y2Q1ZRZWZZcUdMdzZQU21SQ2IwdC9jbythWVhjUnYwS1lEWjJmNmFUSmFJ?=
 =?utf-8?B?MnNDcm1VWk1JSlVtM1pJSXJXZzROc25jYWFRbHYzbjRoanZKejNjWWxnMXNW?=
 =?utf-8?Q?fuK4RFone7slZqVE=3D?=
X-Exchange-RoutingPolicyChecked: urCtcIVkvfRzIqt0X+Nd2Ls9bziB7AzR7dgJ1XIo9DmjKMGmCxMl/CKWQBnyKCRnDkE57NthK7Wnu7kAjpD/90kBdzQ6adp2oND/Bj4AlQ47Qq5YqpA9UJ5G/mPyl9TsL6paUrUmo6+uT7wSE7ipeQnLFCzN/92H5rYc1AEMHlKt23wu6FD3Ev5Hvx4RKi/Wa2d3N7s8IoKzuAqLwpeevW2Um/f16gs2E3+xj7vPvf0zoJbatWGC5gfa2HodxhIGRz30DiGZTQt8dmP+d3A7Q1GqUyxo8B9WP97/VlP0xNbyBnLP4Wr6YXPHilPjUw/xj3BhYksJJDWYoIz+G+0jQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68906066-f826-4c9b-3628-08deb0c69988
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 08:06:56.2634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7HSLoLGTTiIYTtCyNCDDdK2hX05QFc5M2LVH4i8F/jn1Lx1iVfOiBOTGNnRBN1jeAwOndSwhRkOnTPnPHhby7sQNHEsHqrlhxXg418IxvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9183
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

Hi Jeevan,

On 5/11/2026 10:48 PM, Jeevan B wrote:
> Add a new subtest to validate DC3CO counter increments across
> frame gaps exceeding the threshold during a video-like workload
> with PSR2 enabled.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 69 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 69 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 6d2bd0ee1..b8d903fd5 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -60,6 +60,10 @@
>    *              exit cycle, ensuring DC3CO is not broken by deeper power state
>    *              transitions.
>    *
> + * SUBTEST: dc3co-vpb-framegap
> + * Description: Validate DC3CO counter increments before and after a delay greater
> + *              than 6 frame gaps during video-like load with PSR2 active.
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -433,6 +437,63 @@ static void test_dc3co_framedrop(data_t *data, enum psr_mode mode)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static void check_dc3co_with_framegap_load(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_cnt_before, dc3co_cnt_after_gap;
> +	int delay, long_gap_us;
> +	time_t secs = 3;
> +	time_t start_time;
> +
> +	primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +
> +	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
> +
> +	dc3co_cnt_before = igt_read_dc_counter(data->debugfs_fd,
> +			   IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
Imho, instead of using loops and delay calculations use 
igt_wait_for_vblank_count() helper to delay required number of frames.
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_before);
> +
> +	long_gap_us = 7 * ((1000 * 1000) / data->mode->vrefresh);
> +	usleep(long_gap_us);
> +
> +	dc3co_cnt_after_gap = igt_read_dc_counter(data->debugfs_fd,
> +						  IGT_INTEL_CHECK_DC3CO);
> +	start_time = time(NULL);
> +	while (time(NULL) - start_time < secs) {
> +		igt_plane_set_fb(primary, &data->fb_rgb);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +
> +		igt_plane_set_fb(primary, &data->fb_rgr);
> +		igt_display_commit(&data->display);
> +		usleep(delay);
> +	}
> +
> +	assert_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_cnt_after_gap);
> +}
> +
> +static void test_dc3co_vpb_framegap(data_t *data)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data, PSR_MODE_2);
> +	setup_videoplayback(data);
> +	check_dc3co_with_framegap_load(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -864,6 +925,14 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Validate DC3CO counter increments before and after a delay "
> +		     "greater than 6 frame gaps during video-like load with PSR2 active");
> +	igt_subtest("dc3co-vpb-framegap") {
> +		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +					     PSR_MODE_2, NULL));
> +		test_dc3co_vpb_framegap(&data);
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
