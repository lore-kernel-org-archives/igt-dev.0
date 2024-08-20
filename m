Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06990C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 03:23:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7267E10E29B;
	Tue, 20 Aug 2024 03:23:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FGAaLoS6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321B710E29B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 03:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724124234; x=1755660234;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=dMuLhfGvlCR7FWwAsLk3Vk0e+zlMi79BMzhWChMyjSA=;
 b=FGAaLoS6ZWPBCV/Hd7hofmNpq5a/IWIQH9Bc+8r5My9+UaXEhCmR6kYe
 O8Rg3yKejLXEfxh9iQSt4oT+Za+s4BTHnpWAHKGMqmwbmcMlUh5g2LTio
 6fGI6qxOQzw1KC0zCT0+MMaHGAOenTHItITgl3CgtvKiOkG6u1UhNiHJ7
 1rXb0MAye1Iepmv1FnbktjWx2B2POHcDNuykjVQqRi3r8ii19lYBVn8Hq
 xVb5WsSPYRLVRL6sPhLVfrlQXopCHQGNw9i6DWxdePVdruW3QHI0dtXFA
 6rgUIBc00b7JiUq8qwW14eV0TQ20ApQNNPOXgvTIgw43tks/jpbiKMx23 g==;
X-CSE-ConnectionGUID: RXGhENf9ST+Vypb/3Tspng==
X-CSE-MsgGUID: YER6bcZRSGij581u+N/TZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="39906986"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="39906986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 20:23:54 -0700
X-CSE-ConnectionGUID: tXg1b2+oThG/eCNuuWWcCw==
X-CSE-MsgGUID: pEXD2u8eSW6eQOu75RNnSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="60420887"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 20:23:53 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 20:23:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 20:23:52 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 20:23:52 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 20:23:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJKml9XQYrcpl44yBkyFsJSh2Ucfbg5s71heDCAV4Z8cSp3clZkLmgSFh/OgbUtQXFvLww8eJSyBtzHqc8GDkVzsRXSA47CQt4r3enCr9Qfb90FY7FMknfjZnVGryrOcL0SGE/pjv2cDe14L0587CD0+Yoqidcj/sq8QNlolF4kZUW1+V3QxVGU3Fe4HXxCrJWU3tIxravkpSbpk7H2BFofGY5U7592It/5HwQdHuQ14IKHmtU4yenG4Y2QJw298cEtv17l8iXs31wCajhaASwI75OcppElthBEHk7xCAJ9+RohQhsvBPKgMQlX5fOPddYkA0ejToGDwraoy0zz8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLYuzQDY+dCbrzzLwfq+TMvbSbui6wEFgYLeArNEFz8=;
 b=oGlzRDKT05eI9Kobqbk+AY93w9K8k50EnMd8oyt79xu9hugjqDjZfmUu+2WLt9KRMx7OHqlOlSIdr6fo03XAe2JKnpgRxVVBRmr8WukimiZYdCYR+BMeS3b0IjrgLEfgvQSikb25KU088Y2m78aET4vMJBP5/ke5eZSY1Yg9h6TBfAqTPmwal+6yf6plTOEM9WB8MgQ+lpM7pRg82TCOOXK7d/1xl57tvDIVLYIkXxrnYYCdxmzkrcLEkdSZ6xhwnwk2hfuRzBCwwmgo0DUZHsSJZ64AADwaIjpE2L4yn2OIRPBqkxkckmA9eElsJipUjo94kLma2phLdpHPpsL1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA1PR11MB8247.namprd11.prod.outlook.com (2603:10b6:208:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 03:23:49 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 03:23:49 +0000
Message-ID: <c1a33307-fc5f-4457-a714-fb87d2df9c2f@intel.com>
Date: Tue, 20 Aug 2024 08:53:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 8/9] tests/intel/kms_dp_fallback: add test for
 validating fallback
To: <igt-dev@lists.freedesktop.org>
References: <20240609212535.868832-1-kunal1.joshi@intel.com>
 <20240609212535.868832-9-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240609212535.868832-9-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA1PR11MB8247:EE_
X-MS-Office365-Filtering-Correlation-Id: fae6ee75-0761-4006-57dc-08dcc0c78209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTFsWmZKekkxV3RheTJpYUg0NGJOVVJTcVFJMk1EM21UWTljN25qTVlwZUxD?=
 =?utf-8?B?NE1aaHZ2akNzYTJzbjRGWXJkUzIxdlVqZkUzRmNWRUlQYkdINkRvanloSkFX?=
 =?utf-8?B?RldDMHRYZlRTd0xKY05ndmZFRGFTL1FtZkJxWFFBMzR1UGZ2eDQyQUVMYUdX?=
 =?utf-8?B?dG1ON09FcmFYK2VoZkk4SkxndjlBWjB4MWFlT1FScjRZeXFLTmdVTER0akh5?=
 =?utf-8?B?RUwvcmo3amdaRk9OcUtXRW9EaVpmejRrcUNIblBOTWYycDlxVEJneU9Ldmho?=
 =?utf-8?B?M2EySzFEYk5QY0ZHZ1hpQUsySFFla28raUR6aTJtRHJ6YURyRXhUVVhZM0o1?=
 =?utf-8?B?cWlmNWZ6Mk05ZUxXaFBhVVBrTVVsdXByOTlaUktpRkpuUEgwcjBrWnNCemZa?=
 =?utf-8?B?S0NOUjJxa3lPSGxJb0xDVHNwUUtaNG8vQ3FJaHBiWFNjNTVadnRTbm13ZUVm?=
 =?utf-8?B?cWNEaytrblBITWN4czRUbjJFQkh6eEp5clN5VUZoNkRsa1JxMlpRMGZNN0wx?=
 =?utf-8?B?NWk0aS9FdTFQNHRPUVc1cVpYRFVsbkdoeDNTZWxjdG41M0Npa2xBb25DR3BW?=
 =?utf-8?B?MHIxMGRIMHY3Y1QrVFhaNXMrWHJXVzdRZTVWK0phbFo5Q2loK0NRWG15SUNT?=
 =?utf-8?B?S1BYWHB4RlRtZS9lMCtHVXU5Rkl6ODJOcVFLb2IwMnBENm84bFhuUTlBK1BN?=
 =?utf-8?B?YThXWEFCVjFzWXUwRzB3ZkwvcENXaFNXbTF2TVVzZ1lVc2xIaGZBRXlPYU1U?=
 =?utf-8?B?VFNWVU1BWGN2d3RVK3Rrc2gwTldJWXVXcnFjdTE1TnVrWlVTcWhDM2RCMU5T?=
 =?utf-8?B?dDJMSmRNL1R4SGEwV21MMmV2R0RMcUZnWUZqMlJZOTJES1NmYTJPWGJ5UUg1?=
 =?utf-8?B?aWgyUUFHcFFncHMzM3pGeTdjcUFiSnNPSVp5SURhQU5KckkxM05wVzJLTmFh?=
 =?utf-8?B?MENtS2hwNHNKemVWZEJyZ0dMMlEwWG04ejcxemJod1A5WGdNOFRmM04xbFpI?=
 =?utf-8?B?U1NYZ1dQZCtaZURQVFlmdFFsUjRSbE5rOG5GVVhqUjUxV3JndVNueEQ1VXd2?=
 =?utf-8?B?UXVDSFlSRjcvaEdDSmgrMDdVRURCd1N5QXhReFFOUldPQkxFbDZ0YW9oZlM2?=
 =?utf-8?B?OTYyN3VxT2twbXRBajVzZHF1bHVBYWcwbG9mZ0xXRGYrRWhmU245WjRtNkZW?=
 =?utf-8?B?VGVWU3RIN1NNcVlsRXRRVkQ1KzNPSGFkTWgvV2gwdzZoUDltQjltT1lUL0RY?=
 =?utf-8?B?Sk9hRXdqSFhvMGFuRHJxUndaL1JRTUNVQU5WdnRXckNTK0doQ2phWG9tYlZW?=
 =?utf-8?B?d3M2SEVpN0lTT2ZUMi9PQ29yalppRzAxSVYrUDFhR1JFRURSQVFjWjRYWnpX?=
 =?utf-8?B?bmZXYnRBTWlVaWl2RVAvT3F6dUZPdFQvZDAxc0tZVmxZeTR4V2c1Z28zU0tN?=
 =?utf-8?B?cnlpbU9kcGhqVk9zRnBjSXNwK00wNlVqN2xGdFlCMUlQV1IxZTdQUWpQeW9X?=
 =?utf-8?B?YzlqcnRFMmdKUkZzVm9lOVFnRFpLY2JnTnpEMnFUNjdkS1lrUUYxTnV5YkdJ?=
 =?utf-8?B?RTVxY3RKWDRtRW9aYThsZUZyUURZU3hvM1Q1eVNuTmJmanNhMzBubE1uVXE0?=
 =?utf-8?B?anY1WDMwSlgzMkxkYmJabURxcE1qVzIwOGs0UmdHYXVCenBGSkpVMnpYWklq?=
 =?utf-8?B?ZWVhZlV6TDNUS3RvVlA3QlRFaHh4cmdLNE9ZNFBsQjFxb3ZKQ09XM1R6eHpr?=
 =?utf-8?B?ZlQ2dHV3SlVDNXNNbFFwVm5YMmcwdmVQTkl6ME9IazdSZG1ZK1NabU82c29z?=
 =?utf-8?B?emZvNVZZNGtLdmxzOXc0Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVtNTZMWWpIYkVHVlBYM2t5SGFWc2FIOWJvRDRaS0NkbzArQ3FDNThhYUNE?=
 =?utf-8?B?dXUxdkFqVFdndWZuMy9xZTh4OFdHYUlMalZ6dXhMdWF1R1NqWGc1dGV3VVZq?=
 =?utf-8?B?S3dGU3FWdEJuMnFXeldJdy9Od0hEMko5V2VJYmx4MHBGMU1DT3RsRTNWTklk?=
 =?utf-8?B?MnRxTDNJTmwrWU1tN05rQ2dkNXhxZFVWQUJjZC9Lb0ZZRU9jZlNhOVFqY2VX?=
 =?utf-8?B?RjVQYlFYVmtZNzhCNm5NVG51cExDeFBGenRlUUJOU0szNXQvbXBUZDFBV2Fi?=
 =?utf-8?B?M2FETHBtOEI0dVFVQjdjb1NiR3dwNURuM045SnpKV292bElucjN6SHRxWU1M?=
 =?utf-8?B?NHRBVVlDMUVZWm5wUFRML0RYeU8rMzZVYUtvTzRTQys3VlJydTI4OFlzUW9Y?=
 =?utf-8?B?ckIzZE9PZ1NNUE1CTWFFS1VWNk1yNDhGdEo3bFlLcUVJTlo0WkZ4YnNXWnZn?=
 =?utf-8?B?SWVRdi9RUUlGa0w3M1FQOG9LYTJHd2RyaENUZlhXRm4vdjQ2bFFXa0kzNE9C?=
 =?utf-8?B?VzladVpCM0Z4WW1ud3NtSFhRN1hKbkxud2NqZ0twV2VhSkdBRjJaQmVyTFM2?=
 =?utf-8?B?RWZuRVpaSlRuVkl0c3M4M2pGc0V4eWJkSnJNMG5XUnMxZ09PL3RRc00zSjJ5?=
 =?utf-8?B?ZnM3QzJGMjFVVkozcFN6Ym04YTVULzhmRDVmenRtWTc5Y1RFV2RFSFBoU0JU?=
 =?utf-8?B?b0RVNkVLdU1HbDJxMHdaNEJ6Yy9nMlZHODNOQSszYzg1dVpUTDlERkFOQWEz?=
 =?utf-8?B?K2wzZ2xGVGE4QkprZ3ZMa1U5MTNHcG5LUWFyQ2JXM2tJSkxWUzd4R0VhL2Na?=
 =?utf-8?B?TUdjK2paOGFnQ2VWZVBLYzZGQ01aRG1vMTBXN1pFWnlWdEVVTWZuTTRtMjZn?=
 =?utf-8?B?YzRhMWd0WTF0K1Z5V2dDdTFiVC81US9hNWpNUmFtTWxNaHBsQXZqQ2taenVF?=
 =?utf-8?B?M0U0TTBaaHRMZUZlQ3gvVTlkWGFWckxpcFZVZEZ6YWpxajNmNzZ3UlJZMS8r?=
 =?utf-8?B?d0p2WFUrN2VRRjc3OGkrc0VmdHZLS2RnSmQxRDY1anNoYkRQbzBXeS9mQk1L?=
 =?utf-8?B?OGV1Q3BqQWFYbDUwdCsxaWtQMmFIdW5CSGJ0VjBzdFhiVTcvTFJZUmZjdXkx?=
 =?utf-8?B?UnROeDBzSkYyNHBCS1NpM09aTWtIVFQ2MFdUMWZGTFQ4QWN1bkZreHZvZ2FN?=
 =?utf-8?B?TTkyWkpNcXJ0d1JiMmNZejA5RGxGVEV5SUMzbVBtWjU1MHprb1JtaUFhR29n?=
 =?utf-8?B?ajhVdHhvc0IvakFUTUhVaU52QldNVFRpa3lXbjB3RlJiQy9QWVhwVzdzUkVD?=
 =?utf-8?B?Z2hEKzdOaWRxUTI0TWZXRFRHdHZBY0tjQ1Q3cWwydXpkM0R6T1JYS1JkWDZt?=
 =?utf-8?B?bU16UVN0alFzaEZmTUUwbk1MYWlXV2djOEJzU3lhc2J6SjlCakRTcnorUGVz?=
 =?utf-8?B?cVpJcEtncGx3T3VJbzNqVTVBaFgyKzBqRFp6MFlLdU04c2xhN0U5T2Q4YnVS?=
 =?utf-8?B?R3MvR1pyaGR6YVRHTFpKcWJ6OTkrTGhJTEFIbnhua0lnZE1GWENoOEJxUzJU?=
 =?utf-8?B?R0pJR3lPcEVjZUNrbmk0Lzl3YXlzMkxoNzdVbzZtck5zWk9iVGZNRm5XNWRG?=
 =?utf-8?B?RTM4UkRWeXVYMVZtTU9uSFZlWm04ZkxoS2RKSWtGNXJzdnNoVkFodDl6TjZr?=
 =?utf-8?B?cGdnSEtOVklGODRnWkc0RWZaN3AycUhvbFp1NS9SVXM5THAzeUtMQmlSbnd1?=
 =?utf-8?B?WE51Y1Qrb1NoVlZua1hBWGF0OXNOWk1jZG1qaUt1YVVDMzdjR3NNUGYyVW5q?=
 =?utf-8?B?c01zb2hwUnM0TjVuRHFuQ25LdWE0cHlHT2JSZEI3UVBiZDlxWWE1TW1XWTF1?=
 =?utf-8?B?SzZEeUJTbmtWM1VqWkRpMnNGbHdBdk5lbVVTRlcwdi8rOEE0WEFNbzN1TE1Y?=
 =?utf-8?B?dXkzcEF5eDRHMFZGTjZRZzRJai9sZzVEekJkMkFLWXVxQ2JwSGluS3JORWZO?=
 =?utf-8?B?Z0dQY1hrNHB1UWFLL1ZJS0ZNMElOZnBNaG1lYUxiOHM3WTdCNi91TTlxN3Mr?=
 =?utf-8?B?ckVSUHEvSVRkNGY2cFdKR1ZjckRFcTlMbTF5ckhYbE96T2ZTWisvMFVXNU1l?=
 =?utf-8?B?NlYyVkRkRUlKOGxJbmp4TDhSWC9pV2puM0NtbDRQZmdWWGhKcEIzTEM1VHNI?=
 =?utf-8?Q?4hLk/kNz4FKGTzdpx2qcttw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fae6ee75-0761-4006-57dc-08dcc0c78209
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 03:23:49.6032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VvDtmsXDgFsAPRYpb6sqK8r6RXTlPOIBBJNYBIN1o1CcFAGBAIaEzCXmj/hPp9vL++bCGwJhSKWI4EpKBTVwESKBJVjnIPvv3Lt3Wk0cyhOeEZk+BMyDtyc6ueVUiU+n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8247
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

Hi Kunal,

Can we use macros something like below to make code readable ?

#define STR_LINK_RATE(link_rate) \
	(link_rate == DP_LINK_RATE_162000 ? "1.62 Gbps" : \
	link_rate == DP_LINK_RATE_216000 ? "2.16 Gbps" : \
	link_rate == DP_LINK_RATE_243000 ? "2.43 Gbps" : \
	link_rate == DP_LINK_RATE_270000 ? "2.70 Gbps" : \
	link_rate == DP_LINK_RATE_324000 ? "3.24 Gbps" : \
	link_rate == DP_LINK_RATE_432000 ? "4.32 Gbps" : \
	link_rate == DP_LINK_RATE_540000 ? "5.40 Gbps" : \
	link_rate == DP_LINK_RATE_675000 ? "6.75 Gbps" : \
	link_rate == DP_LINK_RATE_810000 ? "8.10 Gbps" : \
	link_rate == DP_LINK_RATE_1000000 ? "10.00 Gbps" : \
	link_rate == DP_LINK_RATE_1350000 ? "13.50 Gbps" : \
	link_rate == DP_LINK_RATE_2000000 ? "20.00 Gbps" : \
	(igt_assert_f(0, "Invalid link rate %d\n", link_rate), NULL))

#define STR_LINK_TO_WRITE(link_rate) \
	(link_rate == DP_LINK_RATE_162000 ? "162000" : \
	link_rate == DP_LINK_RATE_216000 ? "216000" : \
	link_rate == DP_LINK_RATE_243000 ? "243000" : \
	link_rate == DP_LINK_RATE_270000 ? "270000" : \
	link_rate == DP_LINK_RATE_324000 ? "324000" : \
	link_rate == DP_LINK_RATE_432000 ? "432000" : \
	link_rate == DP_LINK_RATE_540000 ? "540000" : \
	link_rate == DP_LINK_RATE_675000 ? "675000" : \
	link_rate == DP_LINK_RATE_810000 ? "810000" : \
	link_rate == DP_LINK_RATE_1000000 ? "1000000" : \
	link_rate == DP_LINK_RATE_1350000 ? "1350000" : \
	link_rate == DP_LINK_RATE_2000000 ? "2000000" : \
	(igt_assert_f(0, "Invalid link rate %d\n", link_rate), NULL))
#define STR_LANE_COUNT(lane_count) \
	(lane_count == DP_LANE_COUNT_1 ? "1" : \
	lane_count == DP_LANE_COUNT_2 ? "2" : \
	lane_count == DP_LANE_COUNT_4 ? "4" : \
	(igt_assert_f(0, "Invalid lane count %d\n", lane_count), NULL))

DP_LINK_RATE link_rate = DP_LINK_RATE_540000;
const char* link_rate_str = STR_LINK_RATE(link_rate);
printf("Link rate: %s\n", link_rate_str);

Thanks,
santhosh

On 10-06-2024 02:55, Kunal Joshi wrote:
> add fallback test which tries to validate fallback by
> reducing link rate / lane count, until retrain is disabled
> or the lowest mode bw requirements are met.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel/kms_dp_fallback.c | 207 ++++++++++++++++++++++++++++++++++
>   tests/meson.build             |   1 +
>   2 files changed, 208 insertions(+)
>   create mode 100644 tests/intel/kms_dp_fallback.c
> 
> diff --git a/tests/intel/kms_dp_fallback.c b/tests/intel/kms_dp_fallback.c
> new file mode 100644
> index 000000000..935a77cc6
> --- /dev/null
> +++ b/tests/intel/kms_dp_fallback.c
> @@ -0,0 +1,207 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 20234 Intel Corporation
> + */
> +
> +/**
> + * TEST: kms dp fallback
> + * Category: Display
> + * Description: Test link training fallback for DP connectors
> + * Driver requirement: i915, xe
> + * Functionality: link training
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include <sys/types.h>
> +
> +#include "igt.h"
> +#include "igt_psr.h"
> +
> +/**
> + * SUBTEST: fallback
> + * Description: Test fallback
> + */
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	struct igt_fb fb;
> +	struct igt_plane *primary;
> +} data_t;
> +
> +IGT_TEST_DESCRIPTION("Test link training fallback for DP connectors");
> +
> +#define BITS_PER_PIXEL 24
> +#define ENCODING_OVERHEAD_8b_10b 0.8
> +#define ENCODING_OVERHEAD_128b_132b 0.9723
> +
> +static const char *str_link_rate(enum dp_link_rate link_rate)
> +{
> +	switch (link_rate) {
> +	case DP_LINK_RATE_162000:
> +		return "1.62 Gbps";
> +	case DP_LINK_RATE_216000:
> +		return "2.16 Gbps";
> +	case DP_LINK_RATE_243000:
> +		return "2.43 Gbps";
> +	case DP_LINK_RATE_270000:
> +		return "2.70 Gbps";
> +	case DP_LINK_RATE_324000:
> +		return "3.24 Gbps";
> +	case DP_LINK_RATE_432000:
> +		return "4.32 Gbps";
> +	case DP_LINK_RATE_540000:
> +		return "5.40 Gbps";
> +	case DP_LINK_RATE_675000:
> +		return "6.75 Gbps";
> +	case DP_LINK_RATE_810000:
> +		return "8.10 Gbps";
> +	case DP_LINK_RATE_1000000:
> +		return "10.00 Gbps";
> +	case DP_LINK_RATE_1350000:
> +		return "13.50 Gbps";
> +	case DP_LINK_RATE_2000000:
> +		return "20.00 Gbps";
> +	default:
> +		igt_assert_f(0, "Invalid link rate %d\n", link_rate);
> +	}
> +}
> +
> +static void find_min_dp_config(int drm_fd, drmModeModeInfo mode, igt_output_t *output, uint64_t *min_link_rate, int *min_lane_count)
> +{
> +	int i, lanes;
> +	int num_rates = 0;
> +	float overhead;
> +	uint64_t link_rates[DP_MAX_LINK_RATE_COUNT];
> +	uint64_t required_bandwidth, available_bandwidth;
> +
> +	igt_require_f(mode.vdisplay > 0, "No modes found\n");
> +	igt_require_f(output, "Output cannot be null\n");
> +
> +	required_bandwidth = (uint64_t)(mode.clock * BITS_PER_PIXEL);
> +	read_link_rates(drm_fd, link_rates, &num_rates, output);
> +
> +	for (lanes = 4; lanes > 0 ; lanes = lanes/2) {
> +		for (i = num_rates-1; i > 0; i--) {
> +			overhead = link_rates[i] >= DP_LINK_RATE_1000000 ?
> +						    ENCODING_OVERHEAD_128b_132b :
> +						    ENCODING_OVERHEAD_8b_10b;
> +			available_bandwidth = link_rates[i] * lanes * overhead * 10;
> +			if (available_bandwidth < required_bandwidth) {
> +				igt_info("Lowest link configuration for %s: Link Rate = %"PRIu64" Kbps, Lanes = %d\n", output->name, link_rates[i], lanes);
> +				*min_link_rate = link_rates[i];
> +				*min_lane_count = lanes;
> +				return;
> +			}
> +		}
> +	}
> +}
> +
> +static const char *str_lane_count(enum dp_lane_count lane_count)
> +{
> +	switch (lane_count) {
> +	case DP_LANE_COUNT_1:
> +		return "1";
> +	case DP_LANE_COUNT_2:
> +		return "2";
> +	case DP_LANE_COUNT_4:
> +		return "4";
> +	default:
> +		igt_assert_f(0, "Invalid lane count %d\n", lane_count);
> +	}
> +}
> +
> +static bool is_retrain_disabled(data_t *data)
> +{
> +	struct dp_link_training_info info;
> +
> +	igt_read_link_training_info(data->drm_fd, data->output, &info);
> +	return info.retrain_disabled;
> +}
> +
> +static void test_fallback(data_t *data)
> +{
> +	bool first = true;
> +	uint64_t min_link_rate;
> +	int min_lane_count;
> +
> +	igt_sort_connector_modes(data->output->config.connector, sort_drm_modes_by_res_asc);
> +	find_min_dp_config(data->drm_fd, data->output->config.connector->modes[0], data->output,
> +			   &min_link_rate, &min_lane_count);
> +
> +	while (!is_retrain_disabled(data)) {
> +		data->mode = &data->output->config.connector->modes[0];
> +		igt_info("mode: %dx%d@%d\n", data->mode->hdisplay, data->mode->vdisplay, data->mode->vrefresh);
> +		igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay, data->mode->vdisplay, DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &data->fb);
> +		igt_output_set_pipe(data->output, data->pipe);
> +		data->primary = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(data->primary, &data->fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +		igt_info("Current link rate : %s, lane count : %s\n",
> +		       str_link_rate(igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output)),
> +		       str_lane_count(igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output)));
> +		if ((igt_get_dp_link_rate_set_for_output(data->drm_fd, data->output) == min_link_rate) &&
> +		   (igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output) == min_lane_count))
> +			break;
> +		kmstest_force_connector_link_training_failure(data->drm_fd, data->output->config.connector, 2);
> +		kmstest_force_connector_retrain(data->drm_fd, data->output->config.connector, 1);
> +
> +		if (!first) {
> +			igt_display_reset(&data->display);
> +			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +		}
> +		first = false;
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = {};
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	enum dp_link_rate link_rate;
> +	enum dp_lane_count lane_count;
> +
> +	igt_fixture {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +	}
> +
> +	igt_describe_f("Test fallback");
> +	igt_subtest_with_dynamic_f("fallback")
> +	{
> +		for_each_connected_output(&data.display, output) {
> +			if (!igt_has_force_link_training_failure_debugfs(data.drm_fd, output)) {
> +				igt_info("Skipping output %s as doesn't support fallback\n",
> +					 output->name);
> +				continue;
> +			}
> +
> +			data.output = output;
> +			link_rate = igt_get_dp_max_link_rate(data.drm_fd, data.output);
> +			lane_count = igt_get_dp_max_lane_count(data.drm_fd, data.output);
> +
> +			for_each_pipe(&data.display, pipe) {
> +				igt_display_reset(&data.display);
> +				data.pipe = pipe;
> +				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_name(pipe))
> +					test_fallback(&data);
> +				kmstest_force_connector_link_rate(data.drm_fd, data.output->config.connector, link_rate);
> +				kmstest_force_connector_lane_count(data.drm_fd, data.output->config.connector, lane_count);
> +				igt_reset_connectors();
> +			}
> +		}
> +	}
> +
> +	igt_fixture {
> +		igt_reset_connectors();
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 758ae090c..1a4e6c18b 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -251,6 +251,7 @@ intel_kms_progs = [
>   	'kms_ccs',
>   	'kms_cdclk',
>   	'kms_dirtyfb',
> +	'kms_dp_fallback',
>   	'kms_draw_crc',
>   	'kms_dsc',
>   	'kms_fb_coherency',
