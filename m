Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7847CD3424
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 08:39:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9295310E522;
	Wed,  6 May 2026 08:39:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V3QaA0hW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC3D10E526
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 08:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778056752; x=1809592752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=h4imL8c4vwmSEmwsfNHA9uXI0hHBGlB8V10Thz6fgH0=;
 b=V3QaA0hWzh7Dx4tNKCV9L1Us+3HvuYrDK38GmUmZt6uCyO6xGt0Xk6yz
 wwh6L/nkFQyOmnNN4CHBiDv6Drstw84bqTNt8alT2I6U6FuoZmfn0WCAu
 BgBwEVjFZLR/6K6QL80BTnaBbB2p4v0BQ/6XXUtJ4fyW5WIeGvAPnZ1Ea
 A8x141DzNeKVqlF3JAAowBlzuVj3Zjk2XcLCX7tKNXsgDeeAkj+Gl2Cdc
 e6ReeWI4AUDEHf2xyUnByKQE8vGSg/8ItPtjppB9t7SbpbEiRYNf0xcQA
 CPhUspcI+SOjTTtJm+36HSvap07692D+VmyA4a1yuZflaaQHNEFp5XOKi Q==;
X-CSE-ConnectionGUID: ls84SfAYR2qtlPqz0UtbLw==
X-CSE-MsgGUID: WVlms9kWT0Oc2+ufXELICw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="89290270"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208,217";a="89290270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:39:11 -0700
X-CSE-ConnectionGUID: JySpnDq/QPSnPJOctnU4Jg==
X-CSE-MsgGUID: hELDIwQLS+2qpWhGeWABxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
 d="scan'208,217";a="236322585"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:39:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:39:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 6 May 2026 01:39:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 6 May 2026 01:39:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDSg1L04jBO9B8nOCQfPwAHwpe0fT+2FzSjrxWpGtTd5rnuAd5DJ8KkgrHXY/d67kmWXtNLQM9+9Nn1Q/BfJKvbHVcyeQ4/i4l/2fLO7/Pq6RWoeDAxDDSDCYp+4HZxB3NvWESF7geAs/pFF+vPTxZO0RZa4GEwvw6+yupaUJABRHrSetBbID++swXeAcF83k2xIvpaxQP0ABwyj9hPT9MVj/fnRjVg5Wb/KLqniLNcFZk/l9tw1hZXM/tdHTBdAeRVH/kbKO/908d0YG0RgUbXdzcpau/wcx/VZKix3ckLHpm9qLkVbup5tc9GI2Cf6C4k1hUbMORAYthY3YvfsoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdkEY+SxVFwokpkbYTbiB6jcy2+DJmrf/XveSD1PweE=;
 b=lp+AjVDoTrHW7RdJG16rr14YfF8B47+NIirUuldwA5ZcxTU3qnuud5bUMR6QBItHsHrsLU+svlEbLNUTJfnbEyhqHrwNcJe56VhZt/gmlQmaf19dpSqKe0tt2+2D6Ld7gixSUBqz+LmsKO7hNhAPvluwI1B9TI0E+cr1ovNAPD3S6WceaVLgVdHjhwOU1alqm3pZ9lZJkNLnVS2itsye2EVkS3EYOlTtHj7L4N8h/+RsNGPCFHwT8Eb18nsEZYROOuLiatrsMIgTe3nmR6oi2zy2EfJQKfWPBGiblIo7+9rcWISOVAQpAN1Wm+Xh2ROCm2IbUU0eXjCKXNMwfK4eDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA3PR11MB7535.namprd11.prod.outlook.com (2603:10b6:806:307::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:39:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:39:03 +0000
Content-Type: multipart/alternative;
 boundary="------------1kiUSjMaxPqcKqeu8XKMcoq5"
Message-ID: <ecd1b374-2685-4c21-9546-a13a5d918e68@intel.com>
Date: Wed, 6 May 2026 14:08:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending IN_FENCE
 waits on test failures
To: "Sebinraj, S" <s.sebinraj@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Karas, Krzysztof"
 <krzysztof.karas@intel.com>, "Santa, Carlos" <carlos.santa@intel.com>
References: <20260504054512.2192437-1-karthik.b.s@intel.com>
 <CH0PR11MB54271973058C776F2F860BE5983E2@CH0PR11MB5427.namprd11.prod.outlook.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <CH0PR11MB54271973058C776F2F860BE5983E2@CH0PR11MB5427.namprd11.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA3PR11MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 66eb91c1-7a2c-4f20-17a8-08deab4aed43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|42112799006|1800799024|376014|8096899003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: i7c7CmeGpS3A4CwoB7wxvYo6etKaE2eLeoMdGxWqXhbaAVZD/+pjKyMmyjaU3bCeNJm6IJk7kVSk4vwwa6XBRg0ZvtsRVvebFpGPB3HtTZqjabnYUQFc0aakzt9S2S7vdFnqH3in3Q+wKbGsz9fH3owhHTXpP2k5rPUgFcSjKeF1pGTLfs4spAvAIui4AUXySaSvDxLsTBurkU7AOo2NQLCIm9H+6g6CRM1ds1y1lhCWTVw/uaU7UYoKotxg/brDuvOUp0JThNcg/gaxKXKOP5DaeNWyWBoimSGytkqPZYZZpsyXms6Dtkm+nt9+uGSPItzmddFJKYQ+YspOSTb9jstaNDZ7syYosDFVZXaWUcPMLNq5AGO4tht18V21cml626RHAVlPs06osVE91tjSoJarcyF6hJ2//Mdfm3Hbigawa3Bt7TkgmQrZF9slmqt7RIJKT/k1+T8Pc7YcUPHOUbjZHR1s46s/oaQ62BSPxuauSXGOfO75PqJnowkZGAZHJsN7COSQ13WyX6q1F2FXydA7NUp68FqWWOAg9epGH/Prv7S1/CpU7v4oM2VDTI2G/3L/mMfFl04td1elmhA6Bn/bV/AWoNTrjriUQ3EpdXE2mNNDqH5O+GGLeAaBGs+9d5mcIkDlklAdotkGPY1uUMkjgPRIOg1HTHUsJozfQfJHnmmlVJl6eEIDZJgFQzab
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(1800799024)(376014)(8096899003)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2prUEI2TllrZjE4Ry9IQWhrcmw1dmxiSkpjV0JWZkVJbldoQ0w5THBCc2ZL?=
 =?utf-8?B?anJIdzh1MnlrRXdpM2ZmSm92UnZkRHNRTnp0RUJrMmJJaVV4bGp2L2pPa0o1?=
 =?utf-8?B?T0ZEbGtOVHlIMm92eXdGeFcvbDJiY0hNUjJ5WVdsczJJbkZibHpFd2hnSEs4?=
 =?utf-8?B?djJzaW9JMWJJMVlMOGNtd1Iwdk0xdTNXejRoN1k5bFRGUW1tYU1WUXhzampZ?=
 =?utf-8?B?NE5iZkFTWDFGVGVTZzExZk9ocVkrZHhMbVJ5aUtqTkN4ZHI3K3p1V0FDTy9k?=
 =?utf-8?B?Sk5aWFV3RUtXd1NpeFRnaXZhSTJ3cWl6UmYvQnBlUjh2dDZVeEpiYWJzWXQw?=
 =?utf-8?B?NzVBSUZvakZjaGVhQjBmQm9WS0lrTnk0QmJiN2NFRGloS3B2UGN1Q3ovNWpG?=
 =?utf-8?B?blpUQlRlL3dJZGIvMFo3OWhlalMxa01ZUGlLY1Z4TkQ4YjdBUXozaU8zZVZv?=
 =?utf-8?B?aGpObUE1VzVacGpiaXRRZ1FKeDlnTy9KV1F6blUrNGo1SHVTdENtYStJVExx?=
 =?utf-8?B?OFF5TFNVWE16cWhsOUJGeERqWG15aWRVNzlMS3ZvSDhlZVVWT3VEc0RyZHB4?=
 =?utf-8?B?NjdTenJ4cDJ4dC81K1dJbHdoWXUyRnNkQzZnYTF5d0EyaEE2WFNoQ3RKZG9p?=
 =?utf-8?B?bGpxZWwvdEtrVDBlZ2c0MURTQnlJaVJ2dDRvQTNzYlVtdnVhNTdDWnd2MlNw?=
 =?utf-8?B?RVFqUk1OdUFXSDBWUUFGVjYvV05KNG1YSEtxRi9XWGpKTEpyVVp5aWw4N2Va?=
 =?utf-8?B?bnN4dStZaXQwMGNTQlFLK3dTZExPRXFiTUhpR1ZlR0hLT3A1UitRTXpYTlp6?=
 =?utf-8?B?TmxkRXdrdDdKTEpKMktWWTlkaWJ0d3F6c0ZRcTg4L01oT0ZjSmV1dHF6c0xt?=
 =?utf-8?B?K01pckhuOTl2aTR4Wi85Q0VEakhkMlo5dVE4andKN2xhZXUxa3R5a3FMN3Rr?=
 =?utf-8?B?Vjk2UVE0SGROajR5YVppZ3dwaCtzcXlXQ2R0cktnakZTR1hRdy81M3NlR1Yz?=
 =?utf-8?B?bU5CL204YkN4TGxrQTFDV2NpUDhZZnduNlI4aDNLcWZMNFNlSk0vM3Y0V3BY?=
 =?utf-8?B?azFRbGdMb1JYdEhwak80cWIyYlJuVS84V3c5aitnZEFsMXJMUEhEUXpnM3Mx?=
 =?utf-8?B?L3A3VGtNTEJGNWJHcHJLK3VpeTRiUzRPUlBxNnpaaFZRQWtQWWN1YXpPSlUz?=
 =?utf-8?B?ZXViL2pCSDVWdXRNZ3pIQmYvY053TUpPV29xYVpGOWt3cmVoWFowZm4zRUpK?=
 =?utf-8?B?RDIvbnF1aFFpSlk4bWlmTFZVVXJxVU9UK2ZFWjdSK1lIWm9GeEFKaGIrWExV?=
 =?utf-8?B?OEpSYkU2Z0N3dnI2aXNrbFdZZWsxNGpIRmFMRXdQN3BiWWF2MzN2MVF2Umkv?=
 =?utf-8?B?Q3p3ZmJ6NFJCMkNuVlhWaW1lak4yWS93b1VKcVg1WVBzVG91QmlHSityMEJ5?=
 =?utf-8?B?Uy9LN2h1THdTK210djhHZi9pQ1A5TExVQ29Ra3UydVNzazRYV3NBbjcwVlp0?=
 =?utf-8?B?MXNNNzRVcTZWM1ZFQlZXU3NWN2lld1I4YmtKYnl3b2NHVjVscGJ2VWhXcWxL?=
 =?utf-8?B?NFM2OEpKK3FpTEtybDFzczlSVXZETi9iQ0hWVGRjcW9aTWlPbGxpbWJZMncy?=
 =?utf-8?B?VGVNbWRiZGhFcHFEbEQ0T0VQaUdjVDNYaDRxelNTZ0FUSDMrYnIrcUFSZHNE?=
 =?utf-8?B?bW92S2MrbVVVUjREckYzRnJreXZQRGRoeFZRSHpJVEI5V0pRcmZsNHBZbExy?=
 =?utf-8?B?eDgvSDlZbkRHMFYreWRYb0psLzBrWC9WbGcrRW92SXFVakF4anIzSm83Q3JP?=
 =?utf-8?B?blVCZHovVDBmZ210V0lyWS9ZRGJ2eTJQTEgvaUNZUVdmbTFRNUxwRHlaTjR0?=
 =?utf-8?B?UTNqSHJWREk2UmtkT1dzVnE3bzJhNGovZ2NQZDZ0RHQ4bG01ekIvZ1hzdmpW?=
 =?utf-8?B?MlF3Z0dhYmczd3BaOERWYjZKS0xjMjNrQmRIS0lzaFUydTRoRmRGSjl6d2tl?=
 =?utf-8?B?RGVXbE5KTEVmWG9NWldKVUtndy9SNTQ4M3NFRC9Ub29ORlgxcXNFNzRQNHox?=
 =?utf-8?B?TkovUWhWdkw1elNzM0MxNkRRSVRVYnBRU1VIK2NkdkE5QlQ4Q0dSRTU0d01P?=
 =?utf-8?B?UUlSd2NTT2FQZEZkb20wQU4zZnpZV09TS2h0WTBieFF1VTh1WE83WEY5U1Bj?=
 =?utf-8?B?MjJnYjR6STFFekQrSGdpa1h0QzlINGIvR3hnNVUvYVJDVXdxT0Y3RmdqbmpX?=
 =?utf-8?B?akp5NUt2VHZhZjNyS0xUNUoyZ2FoeHZqUlFNZ2VncFNFWGtXM3RRbHlzU0R4?=
 =?utf-8?B?NlBMeE5RbGVmZ1FIcVJ0dVo0OWljaVBDZGRqSFpQRVlxRzNHVnJtZz09?=
X-Exchange-RoutingPolicyChecked: Y+7G3PkDtpgCAY/CWYXXEcZalcH5CpPb12Awj2f9gsRDw3qmuizusAHNQgUyjgwM4jc+NI+1PXB4ArH5jP0DO9g6Z3WoNjPG1ffPLSMEo/zwxIaHYJKzgzKRTvK+WZcddbvybLLFi7STLCe2AYs+EWHl6qtVP4dPOpBDXOVU6/Y1KofNxU7Wk8xZkNq5gDRhn29HxKlMC3v9XsWmkuY/IgvS1OYVzGl9ALsuGW4f/5GR2O5JJXQ5oBDjuRHrs8z/rntLUEO7Kekx4QfiSn5frh1GYs1p9Qllnpb/TqyfZ5590MM981rz1qaIDEMqsycTOaAuYHKX2Alty2w9gc4Amw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66eb91c1-7a2c-4f20-17a8-08deab4aed43
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:39:03.7423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+jekfiPoU2dbsQcF2Vq6J76S+hw4SA/jPh5vjISVFj3ouksKjaiHc+7dcEdUZEsnSZNIVwEOc2+ZILe0pqUSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7535
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

--------------1kiUSjMaxPqcKqeu8XKMcoq5
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sebinraj,


On 5/5/2026 12:04 PM, Sebinraj, S wrote:
> Hi Karthik,
>
> Thanks for your patch here, it does address the test clean up hangs 
> which can happen.
> I have one minor observation though,
>
> 1. IMHO the global 'struct pending_fence_state' is accessed from a 
> signal-handler context, marking it volatile avoids potential compiler 
> register-caching issues.

Thank you for the review.


IMHO, this shouldn't be a problem as we are using an atexit handler. Is 
it okay to keep as is?


Thanks and Regards,
Karthik.B.S

>
> Otherwise, the fix is correct and well-motivated, the active flag 
> ordering around the NON_BLOCK commit is right and the exit handler cleanly
> unblocks the kernel wait.
>
> Feel free to add,
> Reviewed-by: S Sebinraj <s.sebinraj@intel.com>
>
> ------------------------------------------------------------------------
> *From:* B S, Karthik <karthik.b.s@intel.com>
> *Sent:* Monday, May 4, 2026 11:15 AM
> *To:* igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
> *Cc:* Samala, Pranay <pranay.samala@intel.com>; B S, Karthik 
> <karthik.b.s@intel.com>; Sebinraj, S <s.sebinraj@intel.com>; Karas, 
> Krzysztof <krzysztof.karas@intel.com>
> *Subject:* [PATCH i-g-t] tests/kms_explicit_fence: Rescue pending 
> IN_FENCE waits on test failures
>
> Track per-plane timeline/fence state across the in-flight NONBLOCK atomic
> commit and install an exit handler to signal any still-unsignaled fences.
> This prevents cleanup hangs when an assertion fires after commit
> submission but before the test signals the blocking fence.
>
> Cc: S Sebinraj <s.sebinraj@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_explicit_fence.c | 58 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> index 2ec9bf39d..7ffdcb285 100644
> --- a/tests/kms_explicit_fence.c
> +++ b/tests/kms_explicit_fence.c
> @@ -68,6 +68,42 @@ typedef struct {
>          igt_pipe_crc_t *pipe_crc;
>  } data_t;
>
> +/*
> + * State tracked across the lifetime of an in-flight atomic commit 
> that has
> + * IN_FENCEs attached. The exit handler uses this to unblock any pending
> + * commit if an assert hits between the commit and the point where
> + * the test would otherwise signal the unsignaled fence(s).
> + */
> +static struct {
> +       int timelines[NUM_PLANES];
> +       bool needs_signal[NUM_PLANES];
> +       bool active;
> +} pending_fence_state = {
> +       .timelines = { -1, -1, -1 },
> +};
> +
> +static void signal_pending_fences(int sig)
> +{
> +       if (!pending_fence_state.active)
> +               return;
> +
> +       for (int i = 0; i < NUM_PLANES; i++) {
> +               if (pending_fence_state.timelines[i] < 0)
> +                       continue;
> +
> +               if (pending_fence_state.needs_signal[i]) {
> +                       /*
> +                        * Best-effort: advance the timeline so the kernel
> +                        * stops waiting on this IN_FENCE.
> +                        */
> + sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);
> +                       pending_fence_state.needs_signal[i] = false;
> +               }
> +       }
> +
> +       pending_fence_state.active = false;
> +}
> +
>  static void setup_output(data_t *data)
>  {
>          igt_display_t *display = &data->display;
> @@ -242,8 +278,14 @@ static void multiplane_atomic_fence_wait(data_t 
> *data)
>
>                  /* Attach IN_FENCE_FD to plane */
>                  igt_plane_set_fence_fd(planes[i], fences[i]);
> +
> +               pending_fence_state.timelines[i] = timelines[i];
> +               pending_fence_state.needs_signal[i] = !should_signal[i];
>          }
>
> +       /* Arm the exit handler before the NONBLOCK commit goes out. */
> +       pending_fence_state.active = true;
> +
>          /* Swap overlay colors to detect scanout changes via CRC */
>          igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
>          igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, 
> OVERLAY1_POS_Y);
> @@ -299,6 +341,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
>          igt_assert_crc_equal(&crc_before, &crc_after);
>
>          /* Now signal the blocking fence (overlay2) */
> +       pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] = false;
>          sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
>
>          /* Wait for overlay2 fence to be signaled */
> @@ -311,6 +354,12 @@ static void multiplane_atomic_fence_wait(data_t 
> *data)
>          igt_assert_eq(ret, 0);
>          igt_assert_eq(sync_fence_status(out_fence), 1);
>
> +       /*
> +        * The pending atomic commit has now completed, so the exit 
> handler
> +        * no longer needs to rescue it.
> +        */
> +       pending_fence_state.active = false;
> +
>          /* Verify display has now updated (CRC should differ from 
> baseline) */
>          igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, 
> &crc_final);
>
> @@ -353,6 +402,13 @@ int igt_main()
>
>                  data.pipe_crc = igt_pipe_crc_new(data.drm_fd, 
> data.crtc->crtc_index,
> IGT_PIPE_CRC_SOURCE_AUTO);
> +
> +               /*
> +                * Make sure that on any failure mid-test, any unsignaled
> +                * IN_FENCE that the kernel is still waiting on gets
> +                * signaled so cleanup can complete instead of hanging.
> +                */
> +               igt_install_exit_handler(signal_pending_fences);
>          }
>
>          igt_describe("Test atomic commit with 3 planes (1 primary, 2 
> overlay) "
> @@ -363,6 +419,8 @@ int igt_main()
>                  multiplane_atomic_fence_wait(&data);
>
>          igt_fixture() {
> +               signal_pending_fences(0);
> +
>                  reset_display_state(&data);
>                  igt_pipe_crc_free(data.pipe_crc);
>                  cleanup_crtc(&data);
> --
> 2.43.0
>
--------------1kiUSjMaxPqcKqeu8XKMcoq5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Sebinraj,</p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/5/2026 12:04 PM, Sebinraj, S
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CH0PR11MB54271973058C776F2F860BE5983E2@CH0PR11MB5427.namprd11.prod.outlook.com">
      
      <style type="text/css" style="display:none;">P {margin-top:0;margin-bottom:0;}</style>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Hi Karthik,</div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Thanks for your patch here, it does address the test clean up
        hangs which can happen.</div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        I have one minor observation though,</div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        1. IMHO the global 'struct pending_fence_state' is accessed from
        a signal-handler context, marking it volatile avoids potential
        compiler register-caching issues.</div>
    </blockquote>
    <p>Thank you for the review.</p>
    <p><br>
    </p>
    <p>IMHO, this shouldn't be a problem as we are using an atexit
      handler. Is it okay to keep as is?</p>
    <p><br>
    </p>
    <p>Thanks and Regards,<br>
      Karthik.B.S</p>
    <blockquote type="cite" cite="mid:CH0PR11MB54271973058C776F2F860BE5983E2@CH0PR11MB5427.namprd11.prod.outlook.com">
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Otherwise, the fix is correct and well-motivated, the active
        flag ordering around the NON_BLOCK commit is right and the exit
        handler cleanly</div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        unblocks the kernel wait.</div>
      <div><br>
      </div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Feel free to add,</div>
      <div class="elementToProof" style="font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        Reviewed-by: S Sebinraj <a class="moz-txt-link-rfc2396E" href="mailto:s.sebinraj@intel.com">&lt;s.sebinraj@intel.com&gt;</a></div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <hr style="display: inline-block; width: 98%;">
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <b>From:</b>&nbsp;B S, Karthik <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a><br>
        <b>Sent:</b>&nbsp;Monday, May 4, 2026 11:15 AM<br>
        <b>To:</b>&nbsp;<a class="moz-txt-link-abbreviated" href="mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.freedesktop.org</a>
        <a class="moz-txt-link-rfc2396E" href="mailto:igt-dev@lists.freedesktop.org">&lt;igt-dev@lists.freedesktop.org&gt;</a><br>
        <b>Cc:</b>&nbsp;Samala, Pranay <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>; B S,
        Karthik <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a>; Sebinraj, S
        <a class="moz-txt-link-rfc2396E" href="mailto:s.sebinraj@intel.com">&lt;s.sebinraj@intel.com&gt;</a>; Karas, Krzysztof
        <a class="moz-txt-link-rfc2396E" href="mailto:krzysztof.karas@intel.com">&lt;krzysztof.karas@intel.com&gt;</a><br>
        <b>Subject:</b>&nbsp;[PATCH i-g-t] tests/kms_explicit_fence: Rescue
        pending IN_FENCE waits on test failures
      </div>
      <div style="font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
        <br>
      </div>
      <div style="font-size: 11pt;">Track per-plane timeline/fence state
        across the in-flight NONBLOCK atomic<br>
        commit and install an exit handler to signal any
        still-unsignaled fences.<br>
        This prevents cleanup hangs when an assertion fires after commit<br>
        submission but before the test signals the blocking fence.<br>
        <br>
        Cc: S Sebinraj <a class="moz-txt-link-rfc2396E" href="mailto:s.sebinraj@intel.com">&lt;s.sebinraj@intel.com&gt;</a><br>
        Cc: Krzysztof Karas <a class="moz-txt-link-rfc2396E" href="mailto:krzysztof.karas@intel.com">&lt;krzysztof.karas@intel.com&gt;</a><br>
        Signed-off-by: Karthik B S <a class="moz-txt-link-rfc2396E" href="mailto:karthik.b.s@intel.com">&lt;karthik.b.s@intel.com&gt;</a><br>
        ---<br>
        &nbsp;tests/kms_explicit_fence.c | 58
        ++++++++++++++++++++++++++++++++++++++<br>
        &nbsp;1 file changed, 58 insertions(+)<br>
        <br>
        diff --git a/tests/kms_explicit_fence.c
        b/tests/kms_explicit_fence.c<br>
        index 2ec9bf39d..7ffdcb285 100644<br>
        --- a/tests/kms_explicit_fence.c<br>
        +++ b/tests/kms_explicit_fence.c<br>
        @@ -68,6 +68,42 @@ typedef struct {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_t *pipe_crc;<br>
        &nbsp;} data_t;<br>
        &nbsp;<br>
        +/*<br>
        + * State tracked across the lifetime of an in-flight atomic
        commit that has<br>
        + * IN_FENCEs attached. The exit handler uses this to unblock
        any pending<br>
        + * commit if an assert hits between the commit and the point
        where<br>
        + * the test would otherwise signal the unsignaled fence(s).<br>
        + */<br>
        +static struct {<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int timelines[NUM_PLANES];<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool needs_signal[NUM_PLANES];<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool active;<br>
        +} pending_fence_state = {<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .timelines = { -1, -1, -1 },<br>
        +};<br>
        +<br>
        +static void signal_pending_fences(int sig)<br>
        +{<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!pending_fence_state.active)<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
        +<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; NUM_PLANES; i++) {<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pending_fence_state.timelines[i] &lt; 0)<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
        +<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pending_fence_state.needs_signal[i]) {<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Best-effort: advance the timeline so
        the kernel<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * stops waiting on this IN_FENCE.<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        sw_sync_timeline_inc(pending_fence_state.timelines[i], 1);<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.needs_signal[i] =
        false;<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
        +<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.active = false;<br>
        +}<br>
        +<br>
        &nbsp;static void setup_output(data_t *data)<br>
        &nbsp;{<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_display_t *display = &amp;data-&gt;display;<br>
        @@ -242,8 +278,14 @@ static void
        multiplane_atomic_fence_wait(data_t *data)<br>
        &nbsp;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Attach IN_FENCE_FD to plane */<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fence_fd(planes[i], fences[i]);<br>
        +<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.timelines[i] = timelines[i];<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.needs_signal[i] =
        !should_signal[i];<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
        &nbsp;<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Arm the exit handler before the NONBLOCK commit goes
        out. */<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.active = true;<br>
        +<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Swap overlay colors to detect scanout changes via
        CRC */<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_fb(data-&gt;overlay1,
        &amp;data-&gt;overlay2_fb);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_plane_set_position(data-&gt;overlay1,
        OVERLAY1_POS_X, OVERLAY1_POS_Y);<br>
        @@ -299,6 +341,7 @@ static void
        multiplane_atomic_fence_wait(data_t *data)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_crc_equal(&amp;crc_before, &amp;crc_after);<br>
        &nbsp;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Now signal the blocking fence (overlay2) */<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.needs_signal[PLANE_OVERLAY2_IDX] =
        false;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);<br>
        &nbsp;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Wait for overlay2 fence to be signaled */<br>
        @@ -311,6 +354,12 @@ static void
        multiplane_atomic_fence_wait(data_t *data)<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(sync_fence_status(out_fence), 1);<br>
        &nbsp;<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * The pending atomic commit has now completed, so the
        exit handler<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * no longer needs to rescue it.<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pending_fence_state.active = false;<br>
        +<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Verify display has now updated (CRC should differ
        from baseline) */<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_get_current(data-&gt;drm_fd,
        data-&gt;pipe_crc, &amp;crc_final);<br>
        &nbsp;<br>
        @@ -353,6 +402,13 @@ int igt_main()<br>
        &nbsp;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data.pipe_crc = igt_pipe_crc_new(data.drm_fd,
        data.crtc-&gt;crtc_index,<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        IGT_PIPE_CRC_SOURCE_AUTO);<br>
        +<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * Make sure that on any failure mid-test, any
        unsignaled<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * IN_FENCE that the kernel is still waiting on
        gets<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * signaled so cleanup can complete instead of
        hanging.<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_install_exit_handler(signal_pending_fences);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
        &nbsp;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_describe(&quot;Test atomic commit with 3 planes (1
        primary, 2 overlay) &quot;<br>
        @@ -363,6 +419,8 @@ int igt_main()<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multiplane_atomic_fence_wait(&amp;data);<br>
        &nbsp;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_fixture() {<br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signal_pending_fences(0);<br>
        +<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_display_state(&amp;data);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_pipe_crc_free(data.pipe_crc);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_crtc(&amp;data);<br>
        --<br>
        2.43.0<br>
        <br>
      </div>
    </blockquote>
  </body>
</html>

--------------1kiUSjMaxPqcKqeu8XKMcoq5--
