Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376E606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 10:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DMJz22iQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=SNn1M+jW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621AB10EBB8;
	Mon, 23 Nov 2026 10:19:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346AA10EBB8
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 10:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795429080; x=1826965080;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kgKuW8H4MDhuDC/9ciPHV/zpt6Xr7Gn77ngja4CyZ20=;
 b=DMJz22iQNUiHpnTGBew4eQRRrMkCvHZHJQ0dYUloyVqhPBxShkVTN7VH
 uZXC0e+k18E3RjPdK5r9hF2qMb8tnU9nQxLiWLmn3Qbi7Wj3U1Rm5VbWQ
 ugUv9sI1lYyr/vzMJ51e+WLz4l9EZKUSJwMV5AzO3xhNrnMEHHwfhxdlb
 oQQFsElL8bXMgrlgaz+FRXPXJkGjtc/lll/tcPF2DEQbE4sd0nYnr8QI1
 ezMmULMhh9YKUCDhvinrs2i/Edq2DHsQA2fyVsuniogY/KAILDJ1jctXq
 tH8Wh8M114TWLEGc/zx3xivMp976/NpM3s/GYj0xMqQLrf1OHB3cTGniE A==;
X-CSE-ConnectionGUID: IABt5qrXSMqYkTinmpATAg==
X-CSE-MsgGUID: g0foCwByQcG31SsaHKNxzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4206467"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4206467"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:17:57 -0800
X-CSE-ConnectionGUID: x91amLIwQ1O7H0nomnfoVA==
X-CSE-MsgGUID: /0IJqabMSiiPOi9AaGBdEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11519303"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 02:17:57 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 02:17:56 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 02:17:56 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 02:17:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AaodIvDEe1JrWFc0ZMeNEbmcuLUA91/qEykDaKeX8SvYNk3kCwadPDRkQDrYjE0nnGGVot+R+PEc7Dgr4VpCbz3bpvmjJQfdfLpCBTYILM2Q3P/RHsDsJCTRhhMx2DhIDm+3UwUJKSNykwtkNrkobjOsvgMNoWFdlMTbchxLr62ENHa4YRWnQZ46JA/xm4//hq0/XWRuG1GrnFyfFrMB6Pl+JwOfNGBD5UhiagP6yFaMT7opHpRnisIq2JpJBdKLxowA3QezfvhCWPrd1Ao+J1i/4Uduf2byaDo3RhVyFPxKxsRMAb5vI2qVoxv8KwKqFgkuCVYaZH9GyHNHF+ymCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuYDr24XgSj0qWZWm03f2F4x/QVzq4orLLjrcZ1eobA=;
 b=n8VofFSaElaCMa/HCB0p9ZborwaB/SUI1Em+S8J7fSE1vugjsvkBgxqL4qZdlLIYrDUxmB83N+DyuXlmkgh04+dJ0Fzlpl3uXtr1Nc4i1J0gJFjTzdm1AJPNoy5Kn5msMpcU4jA5i5v8RQPX/T9xRFrhVWWZfEOaJMgY8zNBaCCNuRbjxPaN9V38dZTcDXbhtVKSZYJ9Mu2Au4o2emfGIw5YAjwYiDP+2jwzU7F14EAAcipGdEemSf0RAOam2g3yRuBw5oPU63vqrUDhpjiW79MkA/I/N1DJ4uHrFTmHlUe6eR3I9c2pXq4EtAvTXm18EHg9rY/Qpn+CC/HEIo2ocw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IuYDr24XgSj0qWZWm03f2F4x/QVzq4orLLjrcZ1eobA=;
 b=SNn1M+jWcqY3QZCtYt3/C/bsorouIN3+gAz6zcXZ39MzxEsKmA+OxI1KC1TONPrVQgIFgJjsTaAhlmimg7Uv13b3f8Ws2gzQZh/Lm1WcRyUhfN0puUi3kLeIdEPPJOHbGIbHVR0d1FfQicBrc1N0kCs5mczsaAjdxIEZr+PkGf8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10) by CH9PR11MB9925.namprd11.prod.outlook.com
 (2603:10b6:610:345::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 10:17:50 +0000
Received: from EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769]) by EAYPR11MB115281.namprd11.prod.outlook.com
 ([fe80::5eae:5253:53f8:c769%6]) with mapi id 15.21.0639.010; Mon, 23 Nov 2026
 10:17:49 +0000
Date: Mon, 23 Nov 2026 10:17:39 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 3/3] tests/core_sysfs: Change prints to debug
Message-ID: <dipjvbum3ycw3oew5lp4ze7wtlgh7ysh5fhtvlqdgpmdftiwcb@acclbkbexh7a>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20261120182614.34410-1-kamil.konieczny@linux.intel.com>
 <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261120182614.34410-4-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: TL0P290CA0011.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::13) To EAYPR11MB115281.namprd11.prod.outlook.com
 (2603:10b6:303:2fa::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EAYPR11MB115281:EE_|CH9PR11MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d77758-75a4-49b2-35e4-08df494b06f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|3023799007|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261028144727099003|56012099006|10067099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: LM6HRPgYVznMD/EoQ/7RkHy8nips/TV3poCEOCj/ysh1c1Sk6zeFbczi/krfn2OPyxIARDpGDZUDjBfAgso+payzZpwcPoLk0zce09pBrvHegfwoL6qeDtpFhFsJH5VrbrKBWXTW1MfZ8PnmfqsXrfRPjVa2TuXaT2KgaYWZXt9RTyzi3HSPYs/7VW3CmXwRnwKUDWkj2tactY0mRGBAP4CNtgcAKe/71tWiTTjYlAMtkb1+AA4r2f6PUkgRTEtmHGFeN9pVE6NqwYKl6FKaAu1Fh6czj03VkcqENPo8iI0GhjjHINNS6pXmvqHz8OV5a36xU1sy6N1kxDjO0Bz5cOEyp5En5p8YiXBetOsfzf6cYusOYNRFQ/SQfDIBR8LdLo7iI5bj2XuLQAcv8wOK6pV0Zby7RqRwynLckFiLkVE3GDfU2dIGvIEHJtP0xjVRehLjkbmMzh+cDFdRe3SrmBOo77WYq3CGa02zs1woh1gNvmcanU+cb3Va10bbPNmyYsGsKNbRV6SG+FHImxtiTUiemQ6VnbPg0hSdWh+noV1Xo1iUJRVikjRzbYeEjtHJZyb1aQXXecegJXgPckyd5kec9ss2Mmagk14/SnWxoizLJFbvmS5eJWw5DONH+oJo1W2DbED3QZeHUMM4PyATlmJ5LyijaPkRXNyOpWiMz10=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:EAYPR11MB115281.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261028144727099003)(56012099006)(10067099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UE9qM1MrWTdtazhFNnNOQVZKTGxUY0dKaGh4K1AzcW4xWDRHRG5wVTVtc1FG?=
 =?utf-8?B?TEVIR0hjeUZJTENnOU9SK1MzaTAxN2xCRCtxRGRrTTVkaWNpV1d1d2Q4R3Mz?=
 =?utf-8?B?aGRUVmF3emQ1Q0MvbHlzdk1LNTBvaXp6TUp2YnBDQXIxOVdLVWl6a3lwSnJS?=
 =?utf-8?B?cFVGbHRSVkNxcDlkZTgvbG1rSlJENGwwZWY1R2QrdExtY3h3MGxHTi8vN1p3?=
 =?utf-8?B?N2lLVzJibWlMQTZHMzMranQ3MVJoanZXbnhjU3UvOW44WUpLY0V2ZUFrbmpQ?=
 =?utf-8?B?WXZUcTVUWUhiTkdhc0k2aXlKWGt5TjhPQjdCVklhTmNVWERLWFJkRVBDVDY1?=
 =?utf-8?B?UG0wUGFPc0svZW83ZTRhVmxZdURpZVpFVndlZnpSUEVSSTZySThxQnh2cXZP?=
 =?utf-8?B?STNvQWswanMwanE4aFlYc29xbk9NQ1JYc05IZnhCa3d2aHhHdzEwU0FFVHRV?=
 =?utf-8?B?Mk4xbGVIVXF2QWlUd1kzck1KNm52Y2wvU0d1MGdJS3VWajRqVXU5TFc2NnND?=
 =?utf-8?B?TDkrQTdNMnpKR0VoTWVLQ3FvWjYwd3ZCaXhlU2UrbW5iczB3dk1Va2h6OHVL?=
 =?utf-8?B?MDB2MTVLdEd1QXVqU3pZREJyU1V0RS9odEk0ZHlzNjI2Qmx0NWFxUytjT1oz?=
 =?utf-8?B?dnJUZzk1ZCszeDJnOFpibUwyWHpFTnR2cUVlak1ZUVM2WWxWUzRFbjR1eGJ3?=
 =?utf-8?B?V1MxWmgzZ2I4WVdONzlZT2xhRzN2eDdGUDZPY3QwQndVQ2NNOFhuaGlXaEFH?=
 =?utf-8?B?UGJNNDhPQllITE5vdWVSck5YdnlpeXU0a2hkVmZxemFuOFNGbTBaZmtSdmlH?=
 =?utf-8?B?Y3BlMnBKemtXUjhjQVBzd2lzdG5uQTZsN2MwQVNlNVdGKzllbFloNXBXUmRX?=
 =?utf-8?B?VGhnK3ZlUUZReXpoK3RwditwNGxEUjhqbVc3WXMxWHhSRjdjeStGM1VMZGMr?=
 =?utf-8?B?VnA0Zmw0SDBQOEpBM2U4STM0dlY0N1ZkU01CMGo1cnRMOWpBUGpkV0FGUmZX?=
 =?utf-8?B?aXZZcEhOdTE3NHFpc0IybUc4RkVJLzlpQ25LVy9IQ0dxQ0ZITHlJTjRjc0VF?=
 =?utf-8?B?d0R4TDNHZzJ5MlZzK1dwdWx3QXAvdkp4VmUxRmNHSEh5M09CbGdZYlFGL3l5?=
 =?utf-8?B?ekNKUTB4QmR0ZFV4V0pPcmxCU2ZYR2FCcnJkUnBwOS9sejJ1QmphaXkvejV4?=
 =?utf-8?B?MURBeGovRVl2cm9QOFdVUmo5R1RHYVFGU2dZMUhkcnNDK1U0ZEptSXRBZmNo?=
 =?utf-8?B?OFc0WDg2MVRQS3JOeVh2bFJsbjZWMFVmelNGUEUrc2k3RWQzOXN4TG1yK0VI?=
 =?utf-8?B?VjRxdzI5VnBVUERWUXRIalpJS3BUWE54ZDZyNkdNQnBYVXpiT0dzZlFOQ2x5?=
 =?utf-8?B?bVg0MVU5d3JEVmIrZkxlbkJaSXNtWVJyRmdjMU5QVXJ5bVlwVmkvK1hTMlYy?=
 =?utf-8?B?eC9NWkdHbnhWbWk4Ulh5UXAxekZvS3oxT0x2YThiWkhmWWdxR3BYL09Fandv?=
 =?utf-8?B?bWZKQzlHampmZDZndHJ4ZmNXZTNoY2cyelk0NVRVNHNYaGpzdXZTYzJjNjhh?=
 =?utf-8?B?Tzd5SFdKTzBsZ2ZKTm84UEU3b1N5cktyR09sb0Vjb2hXTXRrRmZDNmMzVDBv?=
 =?utf-8?B?djREMXRIMUZ4VFNRQVNIZXV5V3JqS2ZZTWo5ajJFdkRLYjVDUlJ3NnFwSTdu?=
 =?utf-8?B?MnR6NVBwbE5QNE1CVFYyWG02S3dEc08xYjd6YUE4cmMzNCtIbmUxSFJ1ZkxN?=
 =?utf-8?B?VFBMaEtxcy8rRGlMeW52TVJmNkozWWpHMDdVa2JVN3dXZWV6QzY4OW4yL2lM?=
 =?utf-8?B?TkRpNUpFb3JSNEVKSHFvbTRDelpLVStQSWVWakxlWTZqaS9USkZzd1F0Z28y?=
 =?utf-8?B?MFpJVWpCemx0YlRKem5vWmRMaW1nWmFwVzRQRDFDcE16dGJpOEZqeDJadXly?=
 =?utf-8?B?U2tkYXJsK29zSEM3SzRvSERuQ1FmWW5LRXNIT3FsNkFCVlZpdGVBTnFLMjli?=
 =?utf-8?B?NE90dzNwRzhnTUMrVUEzZ3E0OUhEQzVwZGtrR3U2RDNWTC9NZVp4Y3dnZENJ?=
 =?utf-8?B?Q1JTZjlueHNiZEYzSkl2ZCt0M3ZIS0JmQ2ZCMlhodXdXRlhralBhRFNPRXBR?=
 =?utf-8?B?WmpIbE1EdEFzVTFhbHNEUXZsWlgzTEMvRUQ5WlNKT0djL3g5TlJEenNETTBN?=
 =?utf-8?B?N1B0YlRJUWdzaVBqa0N3VndqOFdRdGZjV0NiVzRveGVoaHBtM2dsdnpYbmo1?=
 =?utf-8?B?YzJvcVZITGp2bFdJZGwvbFlZbzF4TTh0Uy9LOVJkVUhObFAvQk9XempwZFp2?=
 =?utf-8?B?WmRYelhBckZvVUpvN3lqUlNMMGlDNm5IRVI1YmY3Rk5xbC9JcUxnY0F2aE9o?=
 =?utf-8?Q?yH8d00fF0UXiXTfI=3D?=
X-Exchange-RoutingPolicyChecked: MKWdFp5V+v8/4hZ+MxGLRGwiOH51pZ5S0aXv3tNlcu5xk7YDqE9P+JB6BVwHZOeSYRoEJiRSoQvZWEe90Kekb51BtlcuH6FgrSZyEp1vZpj6dhqJpUC4ErAYJxmOkgBXb1TE5k/apxEj9cliI7BjBAiFB3IS/tJyqw3yhXu0xS13itDfqCvkVA3gXlWMRQHM6z9Jyj/c2cWtSucQT7F8L+0D+4TvVmB09NDH53wolIN5bTIn5hzUET15zdASl6NEkWZuGL64rgHZwcH7sQ8oiFvLOc4VgvxKaOYF+tDC25QF48sQ78+UK9IhmZ5IvvOgMDYfQQPE38KGTMqDyQhTlA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d77758-75a4-49b2-35e4-08df494b06f7
X-MS-Exchange-CrossTenant-AuthSource: EAYPR11MB115281.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 10:17:49.8699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCqIhU79RoMeVJTpQvXpovX4zJGy4D0UnSCqNByRHf+KDlvEoINoBdpT+RxOp1HyIcS2ZTvKa3upBLUUT6J32XfUouFNnnT3S2jeuEUgCjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9925
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Kamil,

On 2026-11-20 at 19:26:14 +0100, Kamil Konieczny wrote:
> Instead of printing every name of file read, make printing into
> debug only, reducing normal output.  Keep only one print at the
> beggining of test about a path which will be scanned and a
> summary at the end.
> Also while at this, add 'ok' prefix to those prints which are
> treated as non-errors, for example write-only file.
> 
> Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/core_sysfs.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/core_sysfs.c b/tests/core_sysfs.c
> index 8719b4ffe..f05c8845a 100644
> --- a/tests/core_sysfs.c
> +++ b/tests/core_sysfs.c
> @@ -46,26 +46,26 @@ static int read_sysfs(const char *filename, void *data)
>  		len = 0;
>  
>  	if (lstat(filename, &sb) == -1) {
> -		igt_info("Stat fails errno=%d %s\n", errno, filename);
> +		igt_debug("Stat fails errno=%d %s\n", errno, filename);
Maybe this could also be prefixed by "ok"?

>  		stat_fails++;
>  		return 0;
>  	}
>  
>  	if ((sb.st_mode & S_IFMT) != S_IFREG) {
> -		igt_info("Not a regular file %s\n", filename);
> +		igt_debug("ok not a regular file %s\n", filename);
>  		not_read_count++;
>  		return 0;
>  	}
>  
>  	if (!(sb.st_mode & 0444)) {
> -		igt_info("Not readable %s\n", filename);
> +		igt_debug("ok not readable %s\n", filename);
>  		not_read_count++;
>  		return 0;
>  	}
>  
>  	fd = open(filename, O_RDONLY);
>  	if (fd < 0) {
> -		igt_info("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
> +		igt_debug("Open fails errno=%d %o %s\n", errno, sb.st_mode & 0777, filename);
This also does not seem to be treated as error here. Unless,
this is my misunderstanding and return 0 here is irrelevant to
what is treated as erroneous behavior.

>  		open_fails++;
>  
>  		return 0;
> @@ -74,10 +74,10 @@ static int read_sysfs(const char *filename, void *data)
>  	bytes_read = read(fd, buf, sizeof(buf) - 1);
>  	if (bytes_read < 0) {
>  		if (errno == EIO && strstr(filename, "/power/")) {
> -			igt_info("power management EIO %s\n", filename);
> +			igt_debug("ok power management EIO %s\n", filename);
>  			not_read_count++;
>  		} else {
> -			igt_info("Read fails errno=%d %s\n", errno, filename);
> +			igt_debug("Read fails errno=%d %s\n", errno, filename);
>  			read_fails++;
>  		}
>  
> @@ -87,7 +87,7 @@ static int read_sysfs(const char *filename, void *data)
>  	}
>  
>  	buf[bytes_read] = '\0';
> -	igt_info("ok %zd\t%s\n", bytes_read, filename + len);
> +	igt_debug("ok %zd\t%s\n", bytes_read, filename + len);
>  	ok_count++;
>  
>  	igt_debug("File %s\nData: %s\n", filename + len, buf);
> -- 
> 2.55.0
> 

-- 
Best Regards,
Krzysztof
