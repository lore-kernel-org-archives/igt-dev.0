Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF91CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 08:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD74510E257;
	Tue, 19 May 2026 08:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOnzptb2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E144510E257
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 08:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779180534; x=1810716534;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=AaWcRe3zkLXFoEll13wI2UlypEXOhVl2E1J9B9jrgok=;
 b=cOnzptb2u0+C6VWSMQz+r+gyKi0FpRa8sfJT/7wP438dXlQ5WbAVRSVJ
 PPFbAhs6P/gMfibi7G2lR2g3hD2KsIasuDR40LxYmulf8S4iQUG1C7DrL
 iqj7uJnSc2DK2PSBQcKO/5c3Ih0tisQV98nzX6fp44niyQdmIWl65Glxl
 Zp+DYEitAuKi5aG4Ra3N/J/bZUN7RMYX++2BpqMi0O+1Wxgj0IXOgbf7c
 k/HV8rCvPM5t+lkbKnMW8eHyILyqLBJcgKv4ON64TFgTC1nNNJs5W15zu
 ZAcc92TVzBElEj+jUsOLwFJfx8juuZm9HurkGw8c7kBSvW/FDV2pTnbk8 g==;
X-CSE-ConnectionGUID: vH4oHpqWSFGRp09zPHYEAA==
X-CSE-MsgGUID: fqi3VtHISYGPKHliQMnpwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="83932149"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208,217";a="83932149"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:48:54 -0700
X-CSE-ConnectionGUID: z0DoIxqxR2ylCxYxC3XHKw==
X-CSE-MsgGUID: 01GOhTJjSJarSaCBWeXnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
 d="scan'208,217";a="244690349"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 01:48:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:48:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 19 May 2026 01:48:53 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 19 May 2026 01:48:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hX+KqtH0DBIIWWBH1ogLred0a0tfhonaSFA/vbkpYA0rRBpNkHSxnH0a/+UwIwe3QN2Ov0LuNnZKKD9EWArKkg+aQbwz2NyGZ4nCAB28tBDk9BVksB6G4+LVFsMUwSJtu83mvN4a5ZRS6NdfhsYJZws3K9HM6bAqpa2IhgwzgnkUAhJpM5/0KXUQB6+HN/2ZJJI2aafUXhCCOkz91UlzDzPIVF84s4dOp7iDXck11L0/TTGLK1Q4fj05GZGNPUk747efSj5FX9xlXJ0HNIrm724cEcU2iCCvOYKE41SQ4lT6ub9z54hKFhuBRuwPuZ0dE/UILPyIhOOHU4zbUtIcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgoBc7KoKAMG3LukdEJ9LhoyMCdi8x/FPjRPRWdA31w=;
 b=ejJk7MYtyL51de7/r1cRefJltRH3CRKEvg/xHZbiyS4E1wTYYfY9MwAe3K2v2bFRr296ECMyFXtZqrvN4KvQr+uG3OhYjBTXXXK4I3E73UK6vJrjrLCRB2MwAILzwk1f4Twu/tbZ7P1lPEOFfKRkIOgmaUfWdsvcQj06nEoqQK59sLIYfYPp9DAFJmWwd2CQq13+U+q2DD5HIocC0hA4Gn9RrgJsPRH0TiZiCw16G5YjqrYMqKJYlj3BjXQULqcWW7+h2AdWM/kFjwD+tKGtQSMNFdmhpUkNeveE9N+xpjnBnZQN0xyQLSo+YVYvCkA0mbQ9unQGRNJQMZix2RV0jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by PH7PR11MB7719.namprd11.prod.outlook.com (2603:10b6:510:2b4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 08:48:49 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%6]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 08:48:49 +0000
Content-Type: multipart/alternative;
 boundary="------------V3as0anmu2J4VbFL93zsSdVD"
Message-ID: <77aeb23d-8f8d-4ee1-9338-8a05955e5fae@intel.com>
Date: Tue, 19 May 2026 14:18:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v6, 2/2] tests/kms_vrr: add support for full range refresh
 rate testing
To: Lee Shawn C <shawn.c.lee@intel.com>, <igt-dev@lists.freedesktop.org>
References: <shawn.c.lee@intel.com>
 <20260515063251.2239524-1-shawn.c.lee@intel.com>
 <20260515063251.2239524-3-shawn.c.lee@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260515063251.2239524-3-shawn.c.lee@intel.com>
X-ClientProxiedBy: MA5PR01CA0194.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::7) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|PH7PR11MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c63628d-c75a-4fd7-d9e2-08deb58371e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|22082099003|18002099003|56012099003|11063799006|4143699003|3023799003;
X-Microsoft-Antispam-Message-Info: Z4ZeShTVv6tYnKteqXI6Yv13X4b7uFlXtCCdZVs9VK1AEfkh+o9Ik/MhkGLZj8FO4b0qP+90T9VkcGJh1N6myVLIvdEayZ8TWKZcWQ82Xr5kxG+I528KCoq04JCE45QloNNOX6kC3B9yaxo8c3LA6O4hR2c3TzIye+r2snHKYP+MC3Zi/twK9YCmvZCtnBv/a3wzfSz9UWLgtbrVZTIbXBJpuq+f5T6lJR4DBFfnc1GoXURtOdPXdxYIcecUTZIhBBo9R+HvfFtKZqPc6mwhgtW34OaA4a9ZKMQKqf3tUIbPZoES/AK6q61DHlqlCLpEbixfH80abCk3Rcqn05olyiNnWSaX2DmTFzOVZ7l35ojtwcCGiFlj9ajcn1KaXFzN11PzjBUZXMsEa+jPJCAeq1kGaNzK7FYpEGzXAgtcid9yInPIRbZp9535u3FcC65JN6ygg2Rif/vGdI0xlMiEZm5qKcAG2dB9jlnQpP1Tx2PzUJcX2mLW5NZ2cVs9Y+wy8OtiEgDEYlrhfW4nruTsPDKPYD0tnOCZBjpd+IBdpAkbC3aMB49pPWriYsS07i6oQZ7loLUOD2vuAZpksZAVwJt1IcMjVEAy7JWNkYKIQrX3zLADb4Shpjh042NmBvpf26JY/FnYu/tDsEmmvEfpbCFsU+kRdtVYezq/bun88mhywWLvEP3ok9whcvMFQ6nJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(22082099003)(18002099003)(56012099003)(11063799006)(4143699003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUNnajNEVFZsWGtLK1VtMWFLUTJGSGpOL01yRUxDN05sV1FpcXhrWEhiNEtG?=
 =?utf-8?B?ZnVaRkl6czRIWlI2UlRObWNGR0dnanVuSktnWnhoNHEyZThoaFhVUHpqd2xo?=
 =?utf-8?B?RzhsNXNhenltMzNyVnJFdE1RT1FnT0hrVnFEWDJOL28wY3o0ZkU2bnFxamlM?=
 =?utf-8?B?MnVYem5wU3ZrZnRNM0thanJ3V3NSdkVQNzh4UEZXZysyaStTNDl2dVBTTzJ3?=
 =?utf-8?B?eVZCTWNYV0ZXVGlOdDVXdFZ1UzVPeDM2VnlaNU5zTjlVZUFnNTRwQjhLWU9a?=
 =?utf-8?B?RnQ2N3JZQ1o3UlArOUtJOWQ4YkwvTzQwUG42dUhmTGF4YS83MGh0WitrMkxl?=
 =?utf-8?B?d0dzN1RUMXM3Z3NEaGZyem11T1MySTIvV1c0c0t2c2V3ay8vTkpybTFGUzdW?=
 =?utf-8?B?Z3hBRlpkMFhjeE0yQkZzdHlPSjhtd3FxQWxxYTgrbXQzVTRuTkxrMTF5aFRp?=
 =?utf-8?B?dVN0ZnJnMmEvZUoxS01meVY2QXlnQ2x1QnhKWjRTSC90WHo1MFZUbjY2ZHRw?=
 =?utf-8?B?Z2N2eFpYTUFPNG9zWk9LaUNlTHVRT2RxTUJiTEE3MVVvemk5dTdXU1VRZHhS?=
 =?utf-8?B?SGd0VktSK2gzR2dIZGZNUVZhSVRBZnJDZUxFdk1RczZKbGRkOE1BaldKeU9J?=
 =?utf-8?B?VjdNM2hNZjBmREdUZ0VaZWozN0pWbVNlUks3bzl5TXFRN3d1bDFQU0xIRVZl?=
 =?utf-8?B?Y2ZEK2wyeGhoN2ROanIwNFFFUkV6d3U4Zk03ODBrUnlCMTdvSVJSQmdLeWV5?=
 =?utf-8?B?cUR1dzFadnJnRUJwWFIzdWVmWGtUNnl2ZXpmZ3FkU01BUktZampOMVZsYjdo?=
 =?utf-8?B?NlYwaEdiNXA1Qk5lbTN0V0dIM3UrQ1ZpaXBTQWxwalRPd0xWU3ZHS1pKdTBI?=
 =?utf-8?B?VlFXL05sSkg2UDltMmF4ME5WT084YXJYakU2OE4ySE1LbW9YWjY5R01lSVNF?=
 =?utf-8?B?WG5FaUhvdUlxcmhjaTRVeWdic0JDYlhlQkxmc1puK1hYa29XSnh0bDhTeEFt?=
 =?utf-8?B?TmZCRVBScW9FenNWOEJXM0R2akhWWG41bUdvM1liNGxQd1EzNUsrNTEzM3lU?=
 =?utf-8?B?UENCTzhHL2xiUXgzWWJrS1NHVm1XdVpIRWdpU0pIN3Fza1prVVZMN01Bc1FH?=
 =?utf-8?B?VGlWZlg1ZkFJMXBkb3EvUU0rZXN6ZkVuTnU4VitrYlFFanE5V3Q1TjFrRW0w?=
 =?utf-8?B?bUdLNUQ5SWRodjdRN05IMDhDcjJxeFZRb3B3dmd6M2NzVTI4TWI4Z1prdjlE?=
 =?utf-8?B?S3pTcjFlUmNSc1VWVXFDUzQ2dWxMVldqYWZUam42M0JtZGtyOVN0KzRlNXZ6?=
 =?utf-8?B?Nmw2QzBtZVpTQk04VGRtT0h1UnRMRk1UTGNDenZ1OHdoZzdDcmJuZjg2ZU9C?=
 =?utf-8?B?VlRZWXJvdDd3djhPQnBTTGdHdE10aDBQSW9UWGswRWszeXlrWDZmTHhOQ1M0?=
 =?utf-8?B?V0szNnlGaFY2Nit2WUxaQ3pxbC9kS2Y5YzEwbC9tOTRma0dTcUJYaFpjUUU4?=
 =?utf-8?B?OEZzVHFBN2g3Y0V3RWpuZDFOb1FsUGZjcm9NdzlVeHBNSHdJM3hJWmFvWHIr?=
 =?utf-8?B?SU9NSzlRejhsZzdUbkhpUU9rRVRkUkUrY0ZaZ3FXSG16R0ovaER1Sk1WWGl0?=
 =?utf-8?B?SzRNMVVLMXVCTU1yMVZwbjdTU2JNTHg5bFJaWGVWalhvamwrUVJ6amluS1Jy?=
 =?utf-8?B?M2xZQjdsZVZnb0Q3dzhDbFlsdDdYMVJXWnNidFpXWmxoVjFJZDdINFdhQUpZ?=
 =?utf-8?B?Mlp5eGphaHBZcnF0RjZoN0VRZGxjQlRUd1g3MnBETEZqcytieXhRTlQ3MVdO?=
 =?utf-8?B?ZnMyNnVWWmVhQ2hSbXU2ZUU3SmUxdHFUeW9aeXhmRnB6bUlSNDFtREU2eDFk?=
 =?utf-8?B?Y2lUOERRQ21tS2hHRUpRUmppekpzWDlWL3E2M2p6czd6TitiZVZjMHQveXJu?=
 =?utf-8?B?cllqVFB6d3JyWTQ3UG1EQVRzQzFpY2JQRVowMy9ycDV0MDdwVUZaYzR0MFc1?=
 =?utf-8?B?MGZIM3hGNUhOK2FUUzd3dE1zTjk1bkRHRm4weEZadWhJcEZRZFM2N2JYc3Q1?=
 =?utf-8?B?dHV2R3RCMEV1SFdUMld5ajRhTm5YamhPWVFoYUNRcmRmZlcxdU5JSi9kbkFX?=
 =?utf-8?B?SjV5QU9UQ3ovZG1lMW0wdDlGeTJUdmNpOTd0VmNOYnczNnFYZ1lSd21LbW0v?=
 =?utf-8?B?MEYvYjdER3luZ3NPem1RWHZUSDdydlNuMlhhSXpXWjhhUmlUVS94L3p5TXlG?=
 =?utf-8?B?S2x5YVFCUFpCR21ZWk10RUIrN0lOSEQvd1k2c1loWURERkR0SWhrbENWWU5V?=
 =?utf-8?B?bENKUGVkYkkydGJOV0lTWDFQbVE3Qnk3VFR1ZEdFT3QwYkR5ZnNuMHZNTzRh?=
 =?utf-8?Q?O/eSRtWAlZBJF0o8=3D?=
X-Exchange-RoutingPolicyChecked: ids3RGi+RkRcGCDDgyHtfqhyyk3eewpqYFg6nD9Pt2A1M+vo8XWXAE5FUOM6w1kiqeZkV1Gzx4ooHk50hZ1fAWuksG1EJex1RE3DMmfEhTLSi70qnUOTi7DxfHvHsgR8JtQeDDCQAiDbItGHpaFS4npHBwSJUu0IZfv1+5OeZVJ9DCAHlOs5QEzWcPGMIe7OSGJ0D2s5Y9BdwUYOSr/HFnjfAVgSRX7XMMqNjNH+tAbtLU/MCd+xlyIqW43vU9+Fyngd6599NTzCIZhK5fevdxN21ASQ1474PeCE4AGCxxhIfy1UT6qz88gTkLKAIpHi5EuBcQbm5VRFQg65PQ7FtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c63628d-c75a-4fd7-d9e2-08deb58371e7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:48:49.3573 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzEAQtCG7ipcw09L+FDXd49SWg/0pmhgTKtCLmj6kLmKrqt//1opNvBQSQBZH6a7NZ0jVjUSYLZvjUn6UjgYlA8G8fH/O8TyCNglECB2prA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7719
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

--------------V3as0anmu2J4VbFL93zsSdVD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lee Shawn,

On 5/15/2026 12:02 PM, Lee Shawn C wrote:
> Currently, kms_vrr tests fixed step increments within the VRR range.
> To better validate hardware stability and potential issues across the
> entire spectrum, this patch adds a 'full-range' testing mode.
>
> When the full-range flag is enabled, the test will:
> 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
> 2. For standard testing, maintain the existing behavior of incrementing
>     from minimum to maximum using the defined step size.
>
> v2: Fix build failure by adding documentation for the new subtest.
> v3: Remove unnecessary '!!' operator when assigning to bool.
> v4: Add full-range (top-down/bottom-up) subtests to verify all supported
>      RR within VRR range.
> v5: Fix build failure for the new subtest.
> v6: Revert commit 862eb176244f ("tests/kms_vrr: Start virtual RR test
>      above midpoint to avoid mode fallback").
>
> Cc: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
> Signed-off-by: Lee Shawn C<shawn.c.lee@intel.com>
> ---
>   tests/kms_vrr.c | 126 ++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 95 insertions(+), 31 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 8f5c4a7c1501..b058a40df0a3 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -62,9 +62,11 @@
>    * Description: Test to switch RR seamlessly without modeset.
>    * Mega feature: General Display Features
>    *
> - * SUBTEST: seamless-rr-switch-virtual
> - * Description: Test to create a Virtual Mode in VRR range and switch to it
> - * 		without a full modeset.
> + * SUBTEST: seamless-rr-switch-virtual-top-down
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> + *
> + * SUBTEST: seamless-rr-switch-virtual-bottom-up
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
>    *
>    * SUBTEST: lobf
>    * Description: Test to validate link-off between active frames in non-psr
> @@ -93,9 +95,10 @@ enum {
>   	TEST_FLIPLINE = 1 << 3,
>   	TEST_SEAMLESS_VRR = 1 << 4,
>   	TEST_SEAMLESS_DRRS = 1 << 5,
> -	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> -	TEST_FASTSET = 1 << 7,
> -	TEST_MAXMIN = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 6,
> +	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 7,
> +	TEST_FASTSET = 1 << 8,
> +	TEST_MAXMIN = 1 << 9,
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> @@ -227,7 +230,7 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	for (i = 0; i < connector->count_modes; i++)
>   		if (connector->modes[i].hdisplay == mode.hdisplay &&
>   		    connector->modes[i].vdisplay == mode.vdisplay &&
> -		    connector->modes[i].clock < mode.clock &&
> +		    connector->modes[i].clock <= mode.clock &&
>   		    connector->modes[i].vrefresh < mode.vrefresh &&
>   		    connector->modes[i].vrefresh >= vrr_min)
>   			mode = connector->modes[i];
> @@ -235,13 +238,57 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> -static void
> -virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
> +static bool
> +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
>   {
>   	uint64_t clock_hz = mode->clock * 1000;
> +	uint16_t virtual_vtotal;
> +
> +	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
> +		igt_info("VTotal (%d) already exceed 8192 at %fHz\n", virtual_vtotal, virtual_refresh_rate);
> +		return false;
> +	}
>   
> -	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
> +	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
> +	mode->vtotal = virtual_vtotal;
>   	mode->vrefresh = virtual_refresh_rate;
> +	return true;
> +}
> +
> +static drmModeModeInfo*
> +get_selected_fixed_mode(igt_output_t *output, bool lowest)
> +{
> +	drmModeConnectorPtr connector = output->config.connector;
> +	drmModeModeInfo *selected_mode = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *m = &connector->modes[i];
> +
> +		if (m->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
> +			if (!selected_mode) {
> +				selected_mode = m;
> +				continue;
> +			}
> +
> +			if (lowest) {
> +				if (m->vrefresh < selected_mode->vrefresh)
> +					selected_mode = m;
> +			} else {
> +				if (m->vrefresh > selected_mode->vrefresh)
> +					selected_mode = m;
> +			}
> +		}
> +	}
> +
> +	if (selected_mode) {
> +		igt_info("Found Target Fixed Mode: \"%s\" %dHz (vtotal: %d)\n",
> +			 selected_mode->name, selected_mode->vrefresh, selected_mode->vtotal);
> +		return selected_mode;
> +	}
> +
> +	return NULL;
>   }
>   
>   /* Read min and max vrr range from the connector debugfs. */
> @@ -754,22 +801,28 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   			       igt_output_t *output, uint32_t flags)
>   {
>   	uint32_t result;
> -	unsigned int vrefresh;
> +	int vrefresh;
>   	uint64_t rate[] = {0};
>   	uint32_t step_size;
This variable step_size is unused; please remove it.
> -	drmModeModeInfo virtual_mode;
> +	int start, end, step;
> +	drmModeModeInfo *virtual_mode = NULL;
> +	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
>   
> -	igt_info("Use HIGH_RR Mode as default\n");
> -	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
> +	if (!virtual_mode)
> +		return;
> +
> +	igt_info("Use %s_RR Mode as default\n", need_low_rr ? "LOW" : "HIGH");
> +	kmstest_dump_mode(virtual_mode);
>   
>   	prepare_test(data, output, crtc);
> -	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode->vrefresh);
>   
>   	/*
>   	 * Sink with DRR and VRR can be in downclock mode so
> -	 * switch to highest refresh rate mode.
> +	 * switch to desired requested rate mode.
>   	 */
> -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +	igt_output_override_mode(output, virtual_mode);
>   	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
>   
>   	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
> @@ -777,22 +830,29 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
>   		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
>   
> -	/*
> -	 * Calculate step size by considering the no. of steps required to
> -	 * reach Vmin to Vmax as 5.
> -	 */
> -	step_size = (data->range.max - data->range.min) / 5;
> -
>   	/* Switch to Virtual RR */
> -	virtual_mode = *igt_output_get_mode(output);
> +	virtual_mode = igt_output_get_mode(output);
> +
> +	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
> +		start = data->range.max;
> +		end = data->range.min;
> +		step = -1;
> +	} else {
> +		start = data->range.min;
> +		end = data->range.max;
> +		step = 1;
> +	}
>   
> -	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
> -		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
> +	for (vrefresh = start; (step > 0) ? (vrefresh <= end) : (vrefresh >= end); vrefresh += step) {
> +		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
> +			continue;
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> -		kmstest_dump_mode(&virtual_mode);
> +		kmstest_dump_mode(virtual_mode);
>   
> -		igt_output_override_mode(output, &virtual_mode);
> +		igt_output_override_mode(output, virtual_mode);
> +
> +		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
>   		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
>   
>   		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
> @@ -1092,9 +1152,13 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
>   
> -		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> -		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> -			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
> +
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
Add a check in |seamless-rr-switch-virtual-bottom-up| to ensure probed 
modes have the identical clock, and continue the test only when this 
condition is satisfied.
>   
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
Please fix the reported |checkpatch.pl| style warnings:
index.html.4:87: CHECK:CAMELCASE: Avoid CamelCase: <drmModeModeInfo>
#87: FILE: tests/kms_vrr.c:242:
+virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float 
virtual_refresh_rate)

index.html.4:94: WARNING:LONG_LINE: line length of 108 exceeds 100 columns
#94: FILE: tests/kms_vrr.c:249:
+               igt_info("VTotal (%d) already exceed 8192 at %fHz\n", 
virtual_vtotal, virtual_refresh_rate);

index.html.4:109: CHECK:CAMELCASE: Avoid CamelCase: <drmModeConnectorPtr>
#109: FILE: tests/kms_vrr.c:263:
+       drmModeConnectorPtr connector = output->config.connector;

index.html.4:203: WARNING:LONG_LINE: line length of 102 exceeds 100 columns
#203: FILE: tests/kms_vrr.c:846:
+       for (vrefresh = start; (step > 0) ? (vrefresh <= end) : 
(vrefresh >= end); vrefresh += step) {

index.html.4:214: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#214: FILE: tests/kms_vrr.c:855:
+  igt_assert(igt_display_try_commit_atomic(&data->display, 
DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);

index.html.4:227: WARNING:LONG_LINE: line length of 111 exceeds 100 columns
#227: FILE: tests/kms_vrr.c:1157:
+                       run_vrr_test(&data, 
test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);

index.html.4:231: WARNING:LONG_LINE: line length of 112 exceeds 100 columns
#231: FILE: tests/kms_vrr.c:1161:
+                       run_vrr_test(&data, 
test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);

total: 0 errors, 5 warnings, 2 checks, 186 lines checked.


  - Thanks

--------------V3as0anmu2J4VbFL93zsSdVD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Lee Shawn,</p>
    <div class="moz-cite-prefix">On 5/15/2026 12:02 PM, Lee Shawn C
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260515063251.2239524-3-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">Currently, kms_vrr tests fixed step increments within the VRR range.
To better validate hardware stability and potential issues across the
entire spectrum, this patch adds a 'full-range' testing mode.

When the full-range flag is enabled, the test will:
1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
2. For standard testing, maintain the existing behavior of incrementing
   from minimum to maximum using the defined step size.

v2: Fix build failure by adding documentation for the new subtest.
v3: Remove unnecessary '!!' operator when assigning to bool.
v4: Add full-range (top-down/bottom-up) subtests to verify all supported
    RR within VRR range.
v5: Fix build failure for the new subtest.
v6: Revert commit 862eb176244f (&quot;tests/kms_vrr: Start virtual RR test
    above midpoint to avoid mode fallback&quot;).

Cc: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Signed-off-by: Lee Shawn C <a class="moz-txt-link-rfc2396E" href="mailto:shawn.c.lee@intel.com">&lt;shawn.c.lee@intel.com&gt;</a>
---
 tests/kms_vrr.c | 126 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 95 insertions(+), 31 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 8f5c4a7c1501..b058a40df0a3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -62,9 +62,11 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Mega feature: General Display Features
  *
- * SUBTEST: seamless-rr-switch-virtual
- * Description: Test to create a Virtual Mode in VRR range and switch to it
- * 		without a full modeset.
+ * SUBTEST: seamless-rr-switch-virtual-top-down
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
+ *
+ * SUBTEST: seamless-rr-switch-virtual-bottom-up
+ * Description: Vrr seamless refresh rate switch for virtual modes using full range
  *
  * SUBTEST: lobf
  * Description: Test to validate link-off between active frames in non-psr
@@ -93,9 +95,10 @@ enum {
 	TEST_FLIPLINE = 1 &lt;&lt; 3,
 	TEST_SEAMLESS_VRR = 1 &lt;&lt; 4,
 	TEST_SEAMLESS_DRRS = 1 &lt;&lt; 5,
-	TEST_SEAMLESS_VIRTUAL_RR = 1 &lt;&lt; 6,
-	TEST_FASTSET = 1 &lt;&lt; 7,
-	TEST_MAXMIN = 1 &lt;&lt; 8,
+	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 &lt;&lt; 6,
+	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 &lt;&lt; 7,
+	TEST_FASTSET = 1 &lt;&lt; 8,
+	TEST_MAXMIN = 1 &lt;&lt; 9,
 	TEST_LINK_OFF = 1 &lt;&lt; 10,
 	TEST_NEGATIVE = 1 &lt;&lt; 11,
 	TEST_FORCE_RR = 1 &lt;&lt; 12,
@@ -227,7 +230,7 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	for (i = 0; i &lt; connector-&gt;count_modes; i++)
 		if (connector-&gt;modes[i].hdisplay == mode.hdisplay &amp;&amp;
 		    connector-&gt;modes[i].vdisplay == mode.vdisplay &amp;&amp;
-		    connector-&gt;modes[i].clock &lt; mode.clock &amp;&amp;
+		    connector-&gt;modes[i].clock &lt;= mode.clock &amp;&amp;
 		    connector-&gt;modes[i].vrefresh &lt; mode.vrefresh &amp;&amp;
 		    connector-&gt;modes[i].vrefresh &gt;= vrr_min)
 			mode = connector-&gt;modes[i];
@@ -235,13 +238,57 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
-static void
-virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
+static bool
+virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
 {
 	uint64_t clock_hz = mode-&gt;clock * 1000;
+	uint16_t virtual_vtotal;
+
+	virtual_vtotal = clock_hz / (mode-&gt;htotal * virtual_refresh_rate);
+	if (is_intel_device(data-&gt;drm_fd) &amp;&amp; virtual_vtotal &gt; 8192) {
+		igt_info(&quot;VTotal (%d) already exceed 8192 at %fHz\n&quot;, virtual_vtotal, virtual_refresh_rate);
+		return false;
+	}
 
-	mode-&gt;vtotal = clock_hz / (mode-&gt;htotal * virtual_refresh_rate);
+	mode-&gt;vsync_start = virtual_vtotal - (mode-&gt;vtotal - mode-&gt;vsync_start);
+	mode-&gt;vsync_end   = virtual_vtotal - (mode-&gt;vtotal - mode-&gt;vsync_end);
+	mode-&gt;vtotal = virtual_vtotal;
 	mode-&gt;vrefresh = virtual_refresh_rate;
+	return true;
+}
+
+static drmModeModeInfo*
+get_selected_fixed_mode(igt_output_t *output, bool lowest)
+{
+	drmModeConnectorPtr connector = output-&gt;config.connector;
+	drmModeModeInfo *selected_mode = NULL;
+
+	for (int i = 0; i &lt; connector-&gt;count_modes; i++) {
+		drmModeModeInfo *m = &amp;connector-&gt;modes[i];
+
+		if (m-&gt;type &amp; (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
+			if (!selected_mode) {
+				selected_mode = m;
+				continue;
+			}
+
+			if (lowest) {
+				if (m-&gt;vrefresh &lt; selected_mode-&gt;vrefresh)
+					selected_mode = m;
+			} else {
+				if (m-&gt;vrefresh &gt; selected_mode-&gt;vrefresh)
+					selected_mode = m;
+			}
+		}
+	}
+
+	if (selected_mode) {
+		igt_info(&quot;Found Target Fixed Mode: \&quot;%s\&quot; %dHz (vtotal: %d)\n&quot;,
+			 selected_mode-&gt;name, selected_mode-&gt;vrefresh, selected_mode-&gt;vtotal);
+		return selected_mode;
+	}
+
+	return NULL;
 }
 
 /* Read min and max vrr range from the connector debugfs. */
@@ -754,22 +801,28 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 			       igt_output_t *output, uint32_t flags)
 {
 	uint32_t result;
-	unsigned int vrefresh;
+	int vrefresh;
 	uint64_t rate[] = {0};
 	uint32_t step_size;</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>This variable&nbsp;<span style="white-space: pre-wrap">step_size</span>
    is unused; please remove it.
    <blockquote type="cite" cite="mid:20260515063251.2239524-3-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">
-	drmModeModeInfo virtual_mode;
+	int start, end, step;
+	drmModeModeInfo *virtual_mode = NULL;
+	bool need_low_rr = flags &amp; TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
 
-	igt_info(&quot;Use HIGH_RR Mode as default\n&quot;);
-	kmstest_dump_mode(&amp;data-&gt;switch_modes[HIGH_RR_MODE]);
+	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
+	if (!virtual_mode)
+		return;
+
+	igt_info(&quot;Use %s_RR Mode as default\n&quot;, need_low_rr ? &quot;LOW&quot; : &quot;HIGH&quot;);
+	kmstest_dump_mode(virtual_mode);
 
 	prepare_test(data, output, crtc);
-	rate[0] = igt_kms_frame_time_from_vrefresh(data-&gt;switch_modes[HIGH_RR_MODE].vrefresh);
+	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode-&gt;vrefresh);
 
 	/*
 	 * Sink with DRR and VRR can be in downclock mode so
-	 * switch to highest refresh rate mode.
+	 * switch to desired requested rate mode.
 	 */
-	igt_output_override_mode(output, &amp;data-&gt;switch_modes[HIGH_RR_MODE]);
+	igt_output_override_mode(output, virtual_mode);
 	igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
 
 	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
@@ -777,22 +830,29 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
 		     &quot;Refresh rate (%u Hz) %&quot;PRIu64&quot;ns: Target threshold not reached, result was %u%%\n&quot;,
 		     data-&gt;switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
 
-	/*
-	 * Calculate step size by considering the no. of steps required to
-	 * reach Vmin to Vmax as 5.
-	 */
-	step_size = (data-&gt;range.max - data-&gt;range.min) / 5;
-
 	/* Switch to Virtual RR */
-	virtual_mode = *igt_output_get_mode(output);
+	virtual_mode = igt_output_get_mode(output);
+
+	if (flags &amp; TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
+		start = data-&gt;range.max;
+		end = data-&gt;range.min;
+		step = -1;
+	} else {
+		start = data-&gt;range.min;
+		end = data-&gt;range.max;
+		step = 1;
+	}
 
-	for (vrefresh = data-&gt;range.min + step_size; vrefresh &lt; data-&gt;range.max; vrefresh += step_size) {
-		virtual_rr_vrr_range_mode(&amp;virtual_mode, vrefresh);
+	for (vrefresh = start; (step &gt; 0) ? (vrefresh &lt;= end) : (vrefresh &gt;= end); vrefresh += step) {
+		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
+			continue;
 
 		igt_info(&quot;Requesting Virtual Mode with Refresh Rate (%u Hz): \n&quot;, vrefresh);
-		kmstest_dump_mode(&amp;virtual_mode);
+		kmstest_dump_mode(virtual_mode);
 
-		igt_output_override_mode(output, &amp;virtual_mode);
+		igt_output_override_mode(output, virtual_mode);
+
+		igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
 		igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display, 0, NULL) == 0);
 
 		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
@@ -1092,9 +1152,13 @@ int igt_main_args(&quot;drs:&quot;, long_opts, help_str, opt_handler, &amp;data)
 		igt_subtest_with_dynamic(&quot;flip-basic-fastset&quot;)
 			run_vrr_test(&amp;data, test_basic, TEST_FASTSET);
 
-		igt_describe(&quot;Test to switch to any custom virtual mode in VRR range without modeset.&quot;);
-		igt_subtest_with_dynamic(&quot;seamless-rr-switch-virtual&quot;)
-			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
+		igt_describe(&quot;Test to switch to all virtual modes in VRR range without modeset.&quot;);
+		igt_subtest_with_dynamic(&quot;seamless-rr-switch-virtual-top-down&quot;)
+			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
+
+		igt_describe(&quot;Test to switch to all virtual modes in VRR range without modeset.&quot;);
+		igt_subtest_with_dynamic(&quot;seamless-rr-switch-virtual-bottom-up&quot;)
+			run_vrr_test(&amp;data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>
    <div style="font-family:'Segoe UI';font-size:14px;font-style:normal;font-weight:400;line-height:20px">Add
      a check in <code>seamless-rr-switch-virtual-bottom-up</code> to
      ensure probed modes have the&nbsp;
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>identical&nbsp;clock, and continue the test only when this condition
      is satisfied.</div>
    <blockquote type="cite" cite="mid:20260515063251.2239524-3-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">
 
 		igt_describe(&quot;Test to validate the link-off between active frames in &quot;
 			     &quot;non-PSR operation.&quot;);</pre>
    </blockquote>
    <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style>Please fix the reported <code>checkpatch.pl</code> style
    warnings:<br>
    index.html.4:87: CHECK:CAMELCASE: Avoid CamelCase:
    &lt;drmModeModeInfo&gt;<br>
    #87: FILE: tests/kms_vrr.c:242:<br>
    +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode,
    float virtual_refresh_rate)<br>
    <br>
    index.html.4:94: WARNING:LONG_LINE: line length of 108 exceeds 100
    columns<br>
    #94: FILE: tests/kms_vrr.c:249:<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;igt_info(&quot;VTotal (%d) already exceed 8192 at
    %fHz\n&quot;, virtual_vtotal, virtual_refresh_rate);<br>
    <br>
    index.html.4:109: CHECK:CAMELCASE: Avoid CamelCase:
    &lt;drmModeConnectorPtr&gt;<br>
    #109: FILE: tests/kms_vrr.c:263:<br>
    +&nbsp; &nbsp; &nbsp; &nbsp;drmModeConnectorPtr connector = output-&gt;config.connector;<br>
    <br>
    index.html.4:203: WARNING:LONG_LINE: line length of 102 exceeds 100
    columns<br>
    #203: FILE: tests/kms_vrr.c:846:<br>
    +&nbsp; &nbsp; &nbsp; &nbsp;for (vrefresh = start; (step &gt; 0) ? (vrefresh &lt;= end)
    : (vrefresh &gt;= end); vrefresh += step) {<br>
    <br>
    index.html.4:214: WARNING:LONG_LINE: line length of 112 exceeds 100
    columns<br>
    #214: FILE: tests/kms_vrr.c:855:<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    &nbsp;igt_assert(igt_display_try_commit_atomic(&amp;data-&gt;display,
    DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);<br>
    <br>
    index.html.4:227: WARNING:LONG_LINE: line length of 111 exceeds 100
    columns<br>
    #227: FILE: tests/kms_vrr.c:1157:<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;run_vrr_test(&amp;data,
    test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);<br>
    <br>
    index.html.4:231: WARNING:LONG_LINE: line length of 112 exceeds 100
    columns<br>
    #231: FILE: tests/kms_vrr.c:1161:<br>
    +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;run_vrr_test(&amp;data,
    test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);<br>
    <br>
    <p>total: 0 errors, 5 warnings, 2 checks, 186 lines checked.</p>
    <p><br>
      &nbsp;- Thanks</p>
    <blockquote type="cite" cite="mid:20260515063251.2239524-3-shawn.c.lee@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------V3as0anmu2J4VbFL93zsSdVD--
