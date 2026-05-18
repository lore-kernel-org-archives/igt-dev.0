Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D67CECD4F52
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 10:52:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB5110E79E;
	Mon, 18 May 2026 10:52:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/nR5FQD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E012010E79E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 10:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779101546; x=1810637546;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E5ecY6aNIuE24uiJVgTsgpoK6QSwe2DH8AvTw3/0Qes=;
 b=J/nR5FQDSTq9HrRsxMgJJXiqb/rWyctdNQNt6LRZhJ6zvHpjbGT9vG01
 3Uqe8RoQrB0HA9pN4FnXxrdRhe5ZoJZuuXZuDaXccaPEb1gQFeUmp3z2b
 /Y6mn1aotpgbdk+FMDNxh+ODz9P7CvLgpURzozIzqS5u9+iIIFi0pEsBM
 iKgXQ0AScfVCJ/TsQVQlfSk0i6M/3tpKV2p6WQB44gv0OIzJC4YnpuQ1B
 jHtm6nA4RN+PO26umN/jYTMI4MIPqohqn2ckE7yE5unrgqAIs8ow4hgCq
 LHoZijbnZ+GbAFXk/PmkmmO0AMO7f/aGVeWVdCO/8+Ra/GsVoEnO1lhId Q==;
X-CSE-ConnectionGUID: FFG/EhvqQsulzQ/14BIVMg==
X-CSE-MsgGUID: z6Cm4+OrSaaBO8zg3oR7Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="83821951"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="83821951"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:52:26 -0700
X-CSE-ConnectionGUID: cuA9lwdPQVW+2q5jEpLd5w==
X-CSE-MsgGUID: hvAAQNC3RnK24W416JlA6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="233002972"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:52:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:52:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 03:52:24 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B2t1SeLeFoAbiWSmNAgi1XFfesOlmOtXhXrhbjOw/jVwgIi8Tleo13K+vN/JpBNYzofQtYRSwTOdUoDsdoNqZqa8mDHaXDYmJRNdyOxUlHJX4bpypWvRsaS6IT5Oc0l0Zy4OohZCrZg7QZSMz2vj2qAVyPSdpIyK+3o6Aq3lYnDnVT3CYKn/u5cuENW9S8Ss8muOVqfQY+cuFetPmT7Q9FmhX9xoXQENLqeHsHWIOTjVyJMkATbWJtIi8BM3lZBO4BmNbgHrBV/c72BwqTsmUirT0VWabjrk865bKVel5Q3D670FSShVrHo27Muo6Vvq2WbIPqDSnI3cAtzgW6Uhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3tI1Lr1S/uGRFyLzFN7n4aJXhOnLeU5v1Th8VBx7rg=;
 b=WS3zcMq54/2xswTtfOKMBa32nWCXz/5ZLS5pQhkXjFg12z1zUpPL4KunuXT6WwQ/AGtjdmKD2Bh7T33vFUudjzSYn3L019rBkxPSpNCpqcjzb+SCBkhUI9QHxyr8L7XOUMZAnZFASyDg5LwP9x8RbwFa4NBCz4Quy6KfpsLdSgY3VV6LYecOp611B7Ry78yIv+PDVM9t9CQnGC4rS5V/4SYob/xe8NF/8ZabcI0OJot//odLDjuk++1gAkaCRzPdyboUhf8rrzvClhsjX/AL4GZIs7uat97U52XyBTV+tM27QxhxBJFDGO+X1Pni7IaTbqxQQegkKqbX+ki5s0983w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by MW3PR11MB4762.namprd11.prod.outlook.com (2603:10b6:303:5d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Mon, 18 May
 2026 10:52:16 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0025.020; Mon, 18 May 2026
 10:52:16 +0000
Message-ID: <f3759881-2e54-40a8-868b-d4a9bfda6ad7@intel.com>
Date: Mon, 18 May 2026 16:22:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_crc: Use SUSPEND_TEST_DEVICES
 for MediaTek devices
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jason-JH Lin
 <jason-jh.lin@mediatek.com>, <igt-dev@lists.freedesktop.org>, Karthik B S
 <karthik.b.s@intel.com>, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Fei Shao
 <fshao@chromium.org>, Jani <jani.nikula@intel.com>, Paul-PL Chen
 <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, Manasi Navare <navaremanasi@google.com>, "Gil
 Dekel" <gildekel@google.com>, Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20260515072934.495031-1-jason-jh.lin@mediatek.com>
 <20260515072934.495031-3-jason-jh.lin@mediatek.com>
 <20260515104933.ym4jqrtdtb3ice4s@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260515104933.ym4jqrtdtb3ice4s@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|MW3PR11MB4762:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc9b78e-9037-41cf-3f92-08deb4cb868f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|4143699003|11063799003|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: vcdMcLzDt2sD0grlBuetXCqMUzMU9iXlzXU8PwlqazglJylNrmAfMFOCVNw4BKvxTcxx4HVb/mJrAcbPZv4XJZ4AKvibQTpj0C+0IIvGZpjos7pPzOQ1uUXyNZE2xAuzt6XRHPkzbrxEtUP9PnQJO4k6fX0vbgbJVV3PUdCj3oXgd4l6ouZjaIURKEKl4QBiq5/Y4l+nHcaDOdJwURHSDKhRu7iKzT8aqpULHumTwdE4Oaa/AVZ4M6PzPWxDUg/kGU1wt6XukgWxvb77yfcXmdBwJzM8it6BWXSi6kdS/FMZd9c0ANBUNm+V71wck5cBM7gxAFP0R5VNbmdUoietAcRWsi58cqzKtmZ6F/1yX+reFmb/KQjEexaQkN0S6cj3BFmhhjf6enz0/RsFh1uyXxMVAMkuBjSE3HmjRIzISVC4RFouBywaW5UUOndMsoYZb+cQq1eqKCKCwi34E7PI7F53HVeD4Pstbd9FcBIVPNR48SyEMx2qw78BOv0Vg1e9hx3C1JW5J6agQckql8VpAaebbKkC4t8byzdaO7QKEXpme8gR7+P3jF6T6UtU9rJByRknYrJQkYijCdDXNpxvkwoq4tvqJUnQv9MLt7Ex3nLAE14dxuUj/vKuIhbnLS0x4dTJkYYGjr7l2fpiJdaWuF0jflQDoDAmv7Y4nPykSprO6gpjbpdrmJ9dOIse1P/TEqcypzThKVC53Qzy5CdUFZ1U1tYXLoxlKi3hHHB2MR2rhMrz/Ha+hFBLKXSdApjt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(4143699003)(11063799003)(921020)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmdhMmNTN0ZEUXpIVk5NYVNWcmo1c2lUM3ZralJBYVRTalJBamFHSTNTbXB4?=
 =?utf-8?B?dTJKKzNWRFRLZzVmbUJNdUxXQW1LdXhWOE9EOVh2K1hNSk5zRjR0ZW15NXkz?=
 =?utf-8?B?RStSdHN4bEJkOEY0VVZnS2Z2SWhFVjlleHdVUVAraXk4TW5nVXVzVlk4Vm1J?=
 =?utf-8?B?cE1MME0yUmNjeE1UZ1JjR3kxWHhzdTVGdC9JUFdGTkRTekt0TGpaWWgxZXR3?=
 =?utf-8?B?emJWeU50S3NYZStObkpsQjZ6bWtDMTlPb3F3cm9VNzJ4ZHJValM5cUFnZy9i?=
 =?utf-8?B?WHVJeTdEeUtkekRaV0FtYTFmdi9FcjZ2Ui9oWnQ2Zlh0YU9kVnMwc1ppamNF?=
 =?utf-8?B?VjNvV05HU3dSeCthSEwyRUxLenE1bnI0Mzc2SzkvSzlwWmxzZENNamNQaEVy?=
 =?utf-8?B?UkVjVEk5Zk1MbGt5d3pSK0kvdDJ5K2ZZTERVQ1BOSkdHN0VOVFp4VVpNS05G?=
 =?utf-8?B?c0NiZmwvanp6dGlqODd5ZlprR29MdXVBenhaazZuSmpmakN2MG9JcDd6bTdp?=
 =?utf-8?B?VjhVZWZZN3hKcVIzeHFyZVNwZnRldmVhUWhNOGs5cXpqbXJaWkZpRCtJRXNF?=
 =?utf-8?B?NFBJRUpLR3QyTGJHWFJ0eHJET3RRdXE4dmFpRm4yR1BYMTU1MGtGU0xpSmd2?=
 =?utf-8?B?K0Z0UlBYcFhFNFhBSUN2b29ibWJaTkU1VnJ6MkY5SDliRk50QnNRRG1SMWpy?=
 =?utf-8?B?TW9TdkNJMXlCdWFaMlI1MkViWDNlSXpDTVR0ZC92blk4Mjd5ejV4SlNiMVpr?=
 =?utf-8?B?V3YxVkVoRHlscktxNkk3MUM2U01CazdSdUIyaHhHNEJZSG03VVZwMDk0SW0r?=
 =?utf-8?B?dGVBcVRySlNzN3M1VXdLS2xXNXpQMWhMWlFRVkJQQUpxamx1Mi9iaytUaXFZ?=
 =?utf-8?B?ZXAxVmE2RGJhSHNsNU1LME91WVVSU3g2M0dPNzhHR3J3WVRzZEcvZy9EUk1H?=
 =?utf-8?B?RjFubTIyYVJzUHdpQk9oellheVhTTEwxbnpJczVYeEFXS3FBa25heTdUUnJk?=
 =?utf-8?B?NmtTYWVoSzQ4dU1ScnhKVDZ4TU1kVTlCMkd0M1gxN0FXNEE1dk4walNlR3ln?=
 =?utf-8?B?YVpGN1FOSThKSlEyMXpERWd3ZWJwbitJNlpURFpOcWpzZXo1MGNGNVJRdEt0?=
 =?utf-8?B?dW5udU1vTXFhSHZRQ2JBQThWcUdNeEJ4NUpUaDZiS24wRnFFV00vS0ZDZllW?=
 =?utf-8?B?MmZvMXk4bWUya0JJR1U1UWJqc0VtelViTHNneGNXanFLM1dQRDFDdEZwSWYv?=
 =?utf-8?B?S1NrYmllTDdtVTd3amUxT1V3MmhsYnc3WFRlSmhKb2ZYSTM4WDd6VVNXZ3BW?=
 =?utf-8?B?K2sxTDN4YlY3RzhScmFUbzFjWWhMLzVHZ1crWE82R093OHpOV0xxamdhUHY1?=
 =?utf-8?B?ZmVzbGgramxyT3BzSkN3TlJQZzArM2g0YVJQUGlGbUNnUE1JMlE5YjBmN2Rz?=
 =?utf-8?B?REIxVEZtcSt4NC9penhKbXhWYXFGNUtsT0hPZ1VhdTMzanoxdUNqbTlZNUt2?=
 =?utf-8?B?aTVsTkdJQnZrc0pzTExVRFZ4NzdhNUxjQzcwUkZPcmVmTzZDVnFyVUpDcHph?=
 =?utf-8?B?S2xRRU1ZQkttT3Q4dDVsVERvVHBIelFOWktBdEh3cW0wQnVUVGtHSmY2U2Yv?=
 =?utf-8?B?WXRBVmx4SWluMUZVeXRRUGdINlJ4M3RKQUVEblNwbk9Gckt0dVdDUzg2NTRH?=
 =?utf-8?B?b3BXbFNKZDZUVnJFV3E4eWRTL3AzSGRpRjlZeThJaWJyYUE1aFJFMzIrbURO?=
 =?utf-8?B?S3NlUGtSZGlWQ3hVbnArNTB1azFaeWNZUkJUZk95bmxOUndYZE45TGhtR1dm?=
 =?utf-8?B?YTRGZXo1TDZFZUdHMVJUT3Z4RjFDTlhNNmdldDNRUjhhU3R3a0grUzI0UE00?=
 =?utf-8?B?Qk0vSWQ3QlBBa1VxeXpZN1M1YjMwU0wzZDU1bXVGbEx5ZURoRTRVbGtCV2tu?=
 =?utf-8?B?TWRqRlZITEs4UklWQS9NVU9PanJEL0NNbjdtUXMzbDdsL29KYzF4YkY5bFdi?=
 =?utf-8?B?djBvNHZ1a0pqWVdRaFN4Z0QwaGhNUEdZaGRTZm5naEFnSlhuY3ZuWEQzd0VJ?=
 =?utf-8?B?K1NzTWRncnBFQ1hqNm1KazVzNzJIZDB1TWNIdXN4cjN0Y2hVR2s2MzR2VndW?=
 =?utf-8?B?bHNLbzN5cXVzcyt0R0swRWd0REQwUm1yZmgxTXpRcVFWM2l4VlJHYWQrcnky?=
 =?utf-8?B?dTI5Mm5HcXAwMU9jb3dmSDBYRkNMU0hhSlNJODdmcmFsRFRmbXprVVZBNldW?=
 =?utf-8?B?S2hTQVVubG5QcVAxVnVNMkVlUDhtaDBreVovOXIvaHZPUER6MkJCMFJoR29v?=
 =?utf-8?B?cW5OeGlNOEdhNG1uMDdma21mMWQ1dkpmbnExR0VwUFpUSGZNMUs0Zz09?=
X-Exchange-RoutingPolicyChecked: NXH023iUVu5XlBdvMBokTnDkyIAMW0MV2sONHV1a/DEkOEonXHnU9QB2UkTHzCHrhKxm/xOvim+L39MVGdk3WbTq0pgrBLDUoJT1DAAQs7sQ8ahJNcNFfvE5AFhCrGkvQwSo5amhJCm0Y7TXuU7xxtu48y980T7ljmvrn/ia0OC9qqO4TIYNv1nTN6TXwOcZJsCatT/yCLKQb+kwmdOCUjbw5Fj3onst/gQySH+9dGz265Qa6U07DKbXPHnfZdZLYmJRx67J0bJY4xUsqFXlFVnsRS/+xsuxbuRxd5G8VSSmqwLdkCDmSWbEMirTsz92zjxDn594CBPvr/e+HfFy7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc9b78e-9037-41cf-3f92-08deb4cb868f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:52:16.5279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzVZ7gUNHxgaYFjlv982/JB19z1z8dIx46yyVj5lU2aAxKKOf7o/a26v/MGnP9yNFF/pg5CVGRKbbIwJqZRI5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4762
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

Hi Jason

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-05-2026 04:19 pm, Kamil Konieczny wrote:
> Hi Jason-JH,
> On 2026-05-15 at 15:28:40 +0800, Jason-JH Lin wrote:
>> Use SUSPEND_TEST_DEVICES instead of SUSPEND_TEST_NONE for MediaTek
>> devices since rtcwake is not supported.
>>
>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> LGTM
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
> Regards,
> Kamil
>
>> ---
>>   tests/kms_cursor_crc.c | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
>> index 1249171dec56..5a6cc7717425 100644
>> --- a/tests/kms_cursor_crc.c
>> +++ b/tests/kms_cursor_crc.c
>> @@ -322,9 +322,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>>   							DRM_MODE_DPMS_ON);
>>   			}
>>   
>> -			if (data->flags & TEST_SUSPEND)
>> -				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> -							      SUSPEND_TEST_NONE);
>> +			if (data->flags & TEST_SUSPEND) {
>> +				enum igt_suspend_test test = SUSPEND_TEST_NONE;
>> +
>> +				/* rtcwake cmd is not supported on MTK devices */
>> +				if (is_mtk_device(data->drm_fd))
>> +					test = SUSPEND_TEST_DEVICES;
>> +
>> +				igt_system_suspend_autoresume(SUSPEND_STATE_MEM, test);
>> +			}
>>   
>>   			igt_pipe_crc_start(pipe_crc);
>>   			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
>> -- 
>> 2.43.0
>>
