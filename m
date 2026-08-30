Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAEEDC61DB9
	for <igt-dev@archiver.kernel.org>; Sun, 30 Aug 2026 19:24:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E307A10E0FA;
	Sun, 30 Aug 2026 19:24:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PbXMoKFB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B72410E0FA
 for <igt-dev@lists.freedesktop.org>; Sun, 30 Aug 2026 19:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788117839; x=1819653839;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WkD+D7Qazscv7LxzAiYQ+EiVo3TlSzRhdVng+8VNIAY=;
 b=PbXMoKFB0UaSKX0AbzRntqHveZHD+vfbLNPbCl7D6GgQMc9baUusoDXG
 xIkMDqCIZl5ekWx2SfU0qwN43++ZddG3hrpUS7mA6UbC06dnQJ9Q6eMLu
 zb9YBxCAwmA5TzMYoruGAKXpWOKLqzsQBLHlRgZvyK9FkUlScyV/sPlpV
 oX5qczXxkLKQdrzQZKkKCpUJFOEBhxtMWCrE9Fs8D4RxSXyuIHwjnHYFT
 8B0TR9y4IR/9ftccIp6eIBaClBwV9dZLH5xaEq/kv+ogUUbZ4QzZ0SXjO
 UNX+WCsSdYE3qHp2pX7fyi/nmIB95/OaKqYiT4W9wzU2H72mENjIxrmKA g==;
X-CSE-ConnectionGUID: arbMuV//RsiayurOg47VVQ==
X-CSE-MsgGUID: Utd8C6moSQG4nAY1EYLG3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="87667137"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="87667137"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:23:59 -0700
X-CSE-ConnectionGUID: A6U6L/vDTpuPpudRov3KjA==
X-CSE-MsgGUID: cZpSNFw/QFWZP4NEc6yAeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; d="scan'208";a="306855893"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2026 12:23:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:23:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 12:23:58 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 12:23:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cb/ZkIBPsMSPt78CqL3p+kQ9XwDSPEO0Jf0He1VXSE9KyWQaHKigyEcLKCBdryszyq/e8E23lcoG4i9NSMk5MWaBuIdN1rmHXzOF6hCnf9xAcjz8qb1w2/xJ+f03EaHSSfG7GP6B7sU5gCZeUTNeFuYI3bkI6RGnbHuTafCVeXAi8on0DtFyRJ0heESEvYTRJFWoy0KusL2gt5Uh97b/+kjUw3BnlyqBaiA1jrD9XYTTY6nhopRaUp8yPvoxngx1aKtEF2bNXth85++8hJuW9O4uGEBOhRNGjZybi+b94M9uZzXQIY/Na1fgARVWlZxAYgu8Z1OjPt0AzavVIgW2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2iRTeabEL+DL5ip8howVWXIE74fG8/OToKJDPby5Q0=;
 b=hrIqNshTBvVlZt+dF3JVvuw0X6qrdQJTGuFJlrPQlxuOeRwSP/pBUAw5hr+ocnOxsZfhPvoZaFm+WT0Y+pDIuSeRdi9/6pD5zrsYiowJEFHePw2yoE+591IrfIo5Gkera4AJcYRgbAym4lhqQi0J+ivdf63jAh7tdP64TV8NSPZzF9dGDFCtJvu0p9rf35f5/DQ+zWptQOY/vZBEIYjDb/DHGAS/kDCa+krxmvh3nGchYvOUcAIbrgVQiOTjdmN4XN+PpvBAD8B2RKEdlAw24Q06b9H6T0gMhxsimTnmZGZ3qbSpps6Hjhg1cXPNrfxricxmpy+3gCwqJ/yXgxKXVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by SJ2PR11MB8513.namprd11.prod.outlook.com (2603:10b6:a03:56e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Sun, 30 Aug
 2026 19:23:49 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%5]) with mapi id 15.21.0360.008; Sun, 30 Aug 2026
 19:23:49 +0000
Message-ID: <b31784cd-6ad7-491b-8a8a-048956b614c6@intel.com>
Date: Mon, 31 Aug 2026 00:53:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 14/17] tests/kms_ccs: split outer test loop into
 two
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <nemesa.garg@intel.com>, <karthik.b.s@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
 <20260821124834.1974029-15-michal.grzelak@intel.com>
Content-Language: en-GB
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260821124834.1974029-15-michal.grzelak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0111.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::6) To CO1PR11MB4913.namprd11.prod.outlook.com
 (2603:10b6:303:9f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4913:EE_|SJ2PR11MB8513:EE_
X-MS-Office365-Filtering-Correlation-Id: 621e0242-2b71-409e-4fd1-08df06cc3829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|22082099003|18002099003|56012099006|3023799007|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: dKmg2PZKsuZQdnWQSbua0dTbvOPdE0miKKSNAm0yT5LEtDWmm7v8g+j9VQ6FZKqMqlW1VASecTjoURZ+2CRkDTQu6zCgwYbM7SsrKjMpVheSG6UnUSZAPHrfX1u4GkPGQ2ov2UTcswLPnVwdGRM3Pm7Ec709/CqRHTXpj5yv7jD/vtZxTXtOIgOqPrN8E5MQyRjzO3F8f9dMWOZjYPyTYS8uBm0NygxyRASCOKNbRIQc4SmquQRc9tMkyOFOj0U+GxZIwJrVkTAGovsaILU4DwkV+60dyxt2hVtZq76dkaToBDKz6Cm4xmM53v1NYU8PhKyQ7DOQ7bFYR2N6sYRx7/UhIoXi+SNhAVhPZLY9umlPCjezPOsQ4Udif56WJ2Mlb0pU98AZ323wJpAul5lTsw61+GpvPqkHdHQgggomsdqxEwUrvTmzHLMeaRzDLSYN0ZdpSgkDcrOJspLxUoL4WqXx7mrxp7nVBDJ0impcbvcagBwzgAeh3PDIqy2bkvloC5Q1lyU5SMxUkiZfZDhBijE2aQGHBjC3WSQw/+6HcHqcTbt27rvsE7+g4cNXGEjfEzAmN/sZTr8PH8l2C0Q3ZAwJwpdtoYBrkmN/K7fqmJq4xHUQ4l9YJh7Zy7E/s/yEe6mbkhl7ciZjxgFYl3XsgNhTPWTr+ejmsfVKtKkZdUM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0h4UU5aY3k5Vmh1RnFlb3RoUkZvN1I3Z0xua3MyNVA2ZXdoREFUV3hZWVlD?=
 =?utf-8?B?WklmM3UwUUpJZHVXdDRDbmVkQ002aVlxZmpSM1J4SkgzQXEyRVFncHVFeW1X?=
 =?utf-8?B?dzJHSXUvdmlYT3c0VS95MEc0U2dWSjdDT014aFBPV3E0RlF3cnBDOE9Gd1Z1?=
 =?utf-8?B?aks5UnZ5SHVZalRoUVdIN0NDOHluTmJFNFJ2VytYVm5venNNTDRraUc1Q2tK?=
 =?utf-8?B?RDVEV3pKNVdOVVFwSHMyZERZejkwQzJ2SnZHbHZNZmNseTR6YzdEbU5SRzhz?=
 =?utf-8?B?aWZBNFBTa2gySzVVNFE3ejRWQWsxejJTczh4c2hBQnBFbnRVeFk1OUdjV2N0?=
 =?utf-8?B?aXM5OHd3V1Q1d0FmenRsK3FhbjM3d0l1Y3U2dVBNMmxhcFVhOWRBK0YxVVdY?=
 =?utf-8?B?d3AxSWJNNTRid3VLd3NhV3YvbXIzbTd2RVdKSmU5K3F0cXNzZzE4djZaYXds?=
 =?utf-8?B?Qi9BbFhxd1JWbTJqYllCTHRwNis2V2o2UmdWeEZUb3FraEgza2VXUlQwOHM4?=
 =?utf-8?B?TDUwanAwcW5Rb2xxNEwycVZLUlR0QkZsWWRiWnhQNjNRVmtjSGEzVEdNb0d6?=
 =?utf-8?B?cjd6Rk1xcFRHRWVzMlFIUVNiRDMrMUdWZUhsc3lveUprbTNmbHFhZVNLLzZ2?=
 =?utf-8?B?RWpTeDQrSGxOSDBFSEJha1dqZGU0N2FLRGliZ2lrdnhFMXk0ZmduQXpXdU9O?=
 =?utf-8?B?VmFVYW1senVyVmV0Q3IvRDJWdS82ZDNpSlFpMUxacXYwTFpVc2FEQ1c5S0I2?=
 =?utf-8?B?MUM5UytRV05TQzA3STVyelVGVVVsQjJVeWVqRVhQTnlqT2ovT2FLeUsyYnkz?=
 =?utf-8?B?K1dqZmVEMWlWUXphTENvTHZDZkFzOUd2elhpcEhBZnFFVWxUN0hNcjF3bEhO?=
 =?utf-8?B?b0tEMlIwMzBYdFRCT0xjZTRaUW14Smc5NVBZdExHNXpSdWZYU2lIMThvMWhE?=
 =?utf-8?B?dEY4bTBiQkNGMjU3VFc1VU9yaXNBTmpzUytXQkhITE9ncS9LdVJ5ZjgvOHBu?=
 =?utf-8?B?OHVYeU9rU0tXTVR2eFordE1USTFBRkEwcTNMOGhVWUZBbzVXMmVnaytIVnQ2?=
 =?utf-8?B?MmJPWmxBdm9ocWgvd3Z5bDBXbnNTYXg1TWpLV0Iyak1TOCt2RFZLcHh2QjZy?=
 =?utf-8?B?Z05ER3RxWkc4dE1HbU1QS1ZPbVhoTTlTRXJqUmZzb2swMUFaR3VBc3BaTnZw?=
 =?utf-8?B?anpDbkN3a2l1ZEgyVHI4dmdTWEFocmtBL0h1V3RzaGQzVzcwOGEyR1B6c1kz?=
 =?utf-8?B?WW1tQWhYWU9kNzdRVTRDNW4vcFUybUhCaGcyV3ZqaDV2S2xTQXhaN0c1cVRx?=
 =?utf-8?B?ZlovN2ZBRHFHa0grUURGcml1YnJxN3lUUkxyVzJRNGFKSkdLRkV0OTBSdXJ6?=
 =?utf-8?B?S05ZSUdGQmt1MlNuNG9jTkI2T2ppcHdpNEVWKzFadFRhN3Bwb1dCWDZxMVFZ?=
 =?utf-8?B?QWRwZ1VnUTk4UDlGL0t0SlZPMGxObi9IZEdqdGRaK0FDWHk0WTVTUTcyQnlY?=
 =?utf-8?B?ZzRraGJCWjJybnFIeUFLdGt5VzNKczV2R1gwSG9MSHlNRWpBdytmUGZKK25P?=
 =?utf-8?B?VG9KbXRXOVk4cTBBUVVPVmtNMElqMnF4NFJrTUVpaEJhWlVGL0pjRmxyaWk0?=
 =?utf-8?B?clVoTCtiNmtncnB1ZHVxc2V6aldUZXQxZXRBT1M1dy9sTWtmUWFRcjBQOE4w?=
 =?utf-8?B?U2xOYVhmRVNldkM3eHFoSTY5bEo3bHRkN2FKTjViQkxEbHljV04zdHhFSkoz?=
 =?utf-8?B?SzhpbDJlaXZmdE5XVmVGUFljaUNuYmFzbTZnQzh1NFdtOEptUWJlR2EraGtV?=
 =?utf-8?B?Tlg5RTB3WEdyQmQ3NkdWNm9WNVo5TEJwQUtEbjVvUVI5VHczcG1uUWtGRnBq?=
 =?utf-8?B?TXZwb0Y3dWl6NUZ6ZUpGTlo3MHQ3QlF5WTVhRWVhc0NuSUFtR2s1bHNnQmkz?=
 =?utf-8?B?ZGYxNkpZWXhMdzZOZ0s1enQrcjNMNGYvamdZdzIwS0JVUjlBSVFvOEpZclpm?=
 =?utf-8?B?NWZXQm4rSTNMdTVsMXhEMC9xZ3RlWnFFYW1Sclh2c2s0b3UvUTdncHNKTG02?=
 =?utf-8?B?TGZMeUR5emxJTi9uNTA5bms1dldwZ3dWZEh1NTJPQzgwZWpxMXRBQUc3MnNq?=
 =?utf-8?B?R0VnT2NueldOand3aW9tK1lSMmdIaHNOWXZwcVBGSXY5RmZvSW5kaG9zampz?=
 =?utf-8?B?b2VCYUkxOGlkRkJBTnBVeGJZTUhNRDhBYzhmRWpORXZwVlFuWk5jKzlubVRZ?=
 =?utf-8?B?VTFNWWd1SlhEZys0bS9kVXVWNTN2MEdCbGNpMUNDL3p2MEREZ2JiYnpkTUVU?=
 =?utf-8?B?YVN1RS9zWEU3K3BOZHV2d2c3UXdWakZzS25UUllkaHJqT1BMZy9PMGh3blY5?=
 =?utf-8?Q?zOBHqSa/56FypdYU=3D?=
X-Exchange-RoutingPolicyChecked: rVz15AujLxCYJXXw6lIfKQLveswniV+dO4zIGLPbzjau8rsDceIZw79WJRwXMz/7v5P5bi8Y8PPxyhqXYlG1Q+y3V/wtO046iklyp9EhMbccKYI6RIeL620ee8/oPaQFuB85eoE5hYXJPm8b+U+xtPm52LIJPxabSsPkMRj2Za2y4QoZFUjiPDOxVyV8aEImHRSBksFeXDVC/8oYXlA6qvvo5RYFGNg+wpNdq85zebAsInUSIVJEyA6zIggjH2Rjs5Uj7Rbyx76AHGBgEJYhlKzGZNWI28Z6zLZCHQDlo+W1abBCsDuhQaEyD3nh9vbHlaHtP9WxEr45hO2REprfbQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 621e0242-2b71-409e-4fd1-08df06cc3829
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2026 19:23:49.8353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ICW+MV3QPejVPeBHhObpD33KvwcnX6c7dRgMWNJBm4V6igP/Xh8yTsQSJiTYRP5azIIRdhFMy+P+YQ0xb7XBXskKsG3cm9P1VEE6k9tyNcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8513
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


On 21-08-2026 06:18 pm, Michał Grzelak wrote:
> for_each_crtc_with_valid_output() iterates over every crtc with
> connected output. Split it into two loops. This is needed to handle per
> output and per crtc cases.
>
> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
> ---
>   tests/intel/kms_ccs.c | 74 +++++++++++++++++++++++--------------------
>   1 file changed, 39 insertions(+), 35 deletions(-)
>
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 4d0bda6a78..9ac0ac8e2b 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -1152,47 +1152,51 @@ static void test_output(data_t *data, const int testnum)
>   					      "Older than Xe2 platform needed.\n");
>   			}
>   
> -			for_each_crtc_with_valid_output(&data->display, crtc,
> -							data->output) {
> -				data->crtc = crtc;
> -				igt_display_reset(&data->display);
> -
> -				igt_output_set_crtc(data->output,
> -						    crtc);
> -				if (!intel_pipe_output_combo_valid(&data->display))
> -					continue;
> -
> -				igt_dynamic_f("pipe-%s-%s",
> -							    igt_crtc_name(crtc),
> -							    data->output->name) {
> -					int valid_tests = 0;
> -
> -					if (data->flags == TEST_RANDOM)
> -						igt_info("Testing with seed %d\n", data->seed);
> -
> -					if (data->flags & TEST_ALL_PLANES) {
> -						igt_display_require_output_on_crtc(crtc);
> -
> -						for_each_plane_on_crtc(crtc,
> -								       data->plane) {
> -							if (skip_plane(data, data->plane))
> -								continue;
> -
> +			for_each_connected_output(&data->display, data->output) {
> +				for_each_crtc(&data->display, crtc) {
> +					if (!igt_crtc_connector_valid(crtc, data->output))
> +						continue;
> +
> +					data->crtc = crtc;
> +					igt_display_reset(&data->display);
> +
> +					igt_output_set_crtc(data->output,
> +							    crtc);
> +					if (!intel_pipe_output_combo_valid(&data->display))
> +						continue;
> +
> +					igt_dynamic_f("pipe-%s-%s",
> +								    igt_crtc_name(crtc),
> +								    data->output->name) {
-->NIT: Indentation needed
> +						int valid_tests = 0;
> +
> +						if (data->flags == TEST_RANDOM)
> +							igt_info("Testing with seed %d\n", data->seed);
> +
> +						if (data->flags & TEST_ALL_PLANES) {
> +							igt_display_require_output_on_crtc(crtc);
> +
> +							for_each_plane_on_crtc(crtc,
> +									       data->plane) {
> +								if (skip_plane(data, data->plane))
> +									continue;
> +
> +								for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> +									data->format = formats[j];
> +									valid_tests += test_ccs(data);
> +								}
> +							}
> +						} else {
>   							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
>   								data->format = formats[j];
>   								valid_tests += test_ccs(data);
>   							}
>   						}
> -					} else {
> -						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> -							data->format = formats[j];
> -							valid_tests += test_ccs(data);
> -						}
> +						igt_require_f(valid_tests > 0,
> +							      "no valid tests for %s on pipe %s\n",
> +							      ccs_modifiers[i].str,
> +							      igt_crtc_name(crtc));
>   					}
> -					igt_require_f(valid_tests > 0,
> -						      "no valid tests for %s on pipe %s\n",
> -						      ccs_modifiers[i].str,
> -						      igt_crtc_name(crtc));
>   				}
>   			}
>   		}
