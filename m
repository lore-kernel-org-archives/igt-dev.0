Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DA6EA8137
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72ADF10E5B4;
	Tue, 10 Feb 2026 15:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIPdlSRf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA39310E5B4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770738729; x=1802274729;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=36Z9YJ84sAFuXDruWB/saLffIy0a3oF53LjtDxLIj+Q=;
 b=QIPdlSRfwxLq8jF4JJ4sgCwqMRmLX8xu4XG/OU+3oawCRgsPvYl3aGAN
 lx0CIaD12WnzRTxLdZqMls8zPIYCdZcCNH9aSU8FByeRdG12u3CDSWWoG
 qVqjCALkGvadqPKVBm9ni0XiyBopBfLo54gHph8RR8w3EIOV7eJUGyIcb
 sJWDB3MEROlcVxMkNGsshTme5solYUojusQ6zXE/zRaCzBm3NuVGBT1TV
 vRoi+Mrbk5J/XiI5ZYVo6DEmiunIn4KvKKKOr/ATytF7Z/BN67ZPtViGb
 3FQjYcFt39RGXK/NlwPJIy39q2Jt8vCZmoekacz+0CJTnQnTkEnDY125n A==;
X-CSE-ConnectionGUID: I7mxr1KzToWdCOiiIekehg==
X-CSE-MsgGUID: teokugouRU21QbdWRJ7PAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82600046"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208,217";a="82600046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:52:07 -0800
X-CSE-ConnectionGUID: aFGGnJKNQ9Ct30aNIdNNgg==
X-CSE-MsgGUID: oinhM34JTby2T7ushd8wpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
 d="scan'208,217";a="211439143"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:52:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 07:52:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 07:52:06 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 07:52:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TDsB7lSwTP1BgszUjOO7LOHMd3i58+JZg3yfFpkxHGA/Ed8RsUMLg800y0gVyg9hJT1gRhmHyzm4V+DBiOgJvmllrqh462Q2MVTztsiUV14yVR7e+Xr/Y/4iu+awmmcUaU++qMIspXtVJqRn8t9FNGt79dNFJqJSfn8A0zb5vgiJlsvR/rK7g+xkgSeb3+AyAGcgd2kn/qCNHGecmeD2owP+SOh7waUSUzRfppOhJClXubSM8dWV+etFPEvq3rryBXtOGJTNj67tGRU0LzJaMu5AM8oXqqKMYJZPwUosOLegYB3co1phnbMKaXXuO5O2vtrJXNMyh+YhrQiT0wCnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOai7l/C/3Ymv0KexCxJmnYyWKQG+dfUF+OAajZOmT8=;
 b=ZTjSkW8lzndsQid5/c03bsFS8k9z8VYDyquSEQT4ROdzeFjh4ru4qx1nBQECLdT5aQvhiw5xavB2vWycJyS8OymxQfvwDEdGMQ16rn633FWijsi6WRDCsioVJEZdOY+6/WB9rAhokMiGqqmcS7kyvtT/PArFHw3apL45dBjQNWOJeOfi9274cyiSOXslhSgFXX1JZi4xKK77h1rmtx0zCfc1kOLJg1kEEQ5RCdzYFG/3Hh5/osMWcdTp68S94P/i51I7FVpwnSccEtL/ONSz1RxXvukFKiGBE47YFKoTPmdOp18z2zI6T1/hI8N0jTEKO8RY5/bpOH/xaD/vYLqvdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5253.namprd11.prod.outlook.com (2603:10b6:208:310::20)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 15:52:04 +0000
Received: from BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1]) by BL1PR11MB5253.namprd11.prod.outlook.com
 ([fe80::c721:b1ce:dcb1:11e1%5]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 15:52:04 +0000
Content-Type: multipart/alternative;
 boundary="------------Z9Agy6TnpTAy3E4dEXugle6T"
Message-ID: <d296e7e2-22d0-49e1-bb5f-0ec039fe57f0@intel.com>
Date: Tue, 10 Feb 2026 21:20:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/2] tests/kms_plane: Skip unsupported modifiers
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260210050822.1095409-1-pranay.samala@intel.com>
 <20260210050822.1095409-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20260210050822.1095409-3-pranay.samala@intel.com>
X-ClientProxiedBy: MA5PR01CA0117.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::14) To BL1PR11MB5253.namprd11.prod.outlook.com
 (2603:10b6:208:310::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5253:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c4cc87-b33b-41ae-fe52-08de68bc5617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3Y5QjgveTdzMXZWKy9KWVJUcEgzZVJtb0RGaFFocDdrNXhhVjRqaVUrQlFH?=
 =?utf-8?B?WkNsUGlPb0dUajFhNG0wbHdqQmwraStYcUhkWU11c1E2MS94a0lDRk5tbTRD?=
 =?utf-8?B?bW9TeFdNNU4relNZQkNNdW9ZOEJETFMxL3ZtUE1QbnQzYnBLc2k1NytjWUpT?=
 =?utf-8?B?YWNzZHZOekdJcDV3Yyt6R1JBYUtxSExiN1I2NllBL2t4cWZUV0Jza2lsOHFs?=
 =?utf-8?B?T000LzBFZGZqc3Z4azQrYzEzT1VYSllzT1pGcDdhMnBWelJJNWNzMEF2OStu?=
 =?utf-8?B?RDB0V1E2YU56ODlxcGJqRjRzekVxaWRrSHEzc1BETHNKd0FLMDJHQXVCOXI0?=
 =?utf-8?B?RWtnOGZyaENSK3VtbWc5ZDFHR3p6U29zQ0o0T1R6Q2hWVWk1aDBCV2d4RXJz?=
 =?utf-8?B?cXBBbDRraHB4c3lVVFhXcVJnYktldGYzdEI0SlJrNlUxdHZMbTMzdXJvVDhR?=
 =?utf-8?B?bFZBUyt6ckRsbkQvMXV5emRXWGJJcHRYSzNzTEpYNTQwOHJXSUkzNjR3SjVu?=
 =?utf-8?B?blhyUDRaN1p2RFNsSUlFb3B3Mm0zQzhWbkdQcDlIZXVQaXRlZzFBWG1Oa25m?=
 =?utf-8?B?Um92T3RXd1N4aHpQTDV4eGgvenNZRHhmS3NJVWNpWUJyUm1vYjY5bVFaNzJk?=
 =?utf-8?B?UUZDa2VoOERKTU10SEpLeVdMbytFRFZVT2pReFNSczhwWTYwVlBkOXo1c1Ix?=
 =?utf-8?B?alF5bVRSV3JLeFhWOXpUbUdlK2k0aWliSE1tZWh4L3FjWW0vMncrRkZzTzBR?=
 =?utf-8?B?amQzSng2VVJvdXZBQUMyc3dHMm9NT250ZXE2ZmxNcU56dW9ibUttQVp3Rk9B?=
 =?utf-8?B?NnM1MWljNjR0YXhTL1JMbE1xUmxlNzI5cDJic2xMcXBPcGc4Lzg1SWlQNWJM?=
 =?utf-8?B?bTQyZDVyR0cvS0xVTlJjNVh1ZjAzd05EcFhZK3RaZnJBUk1WNGRhODh1Z1Z6?=
 =?utf-8?B?ditNWnErK2FWa1JTZGYzUm5TdVNCMEs5YW13MFUzc0FoSzNLY2NxSHQyUUVl?=
 =?utf-8?B?R3MwYTRSMFFJSmoxcEdGbmZ6ZFpYek04UmJuZzRuWVRaVTladithVkx0dmJy?=
 =?utf-8?B?WGQ2cHFyTXBtL2VVdFVjM1c4UHF0YkxKVG5VOFV3KzVBcWU4TmZZUWd1bkpr?=
 =?utf-8?B?d0tTT09BMjJ4Mnh6bzBZRkRpSWhKdlpZaHhPVGwvRVBuTmdqa3JxSS8zZWZi?=
 =?utf-8?B?S3NISVJ3L0tRaU9pdTBZd1pxSW82bHBSRUthMTdJQmh4VlNmenBhanRZeVBk?=
 =?utf-8?B?WGhLRmVmYkZwbzFSdU9SZXVtcjZpMnJ6amFtU2V0ejZyWVk4UWpPbUluWGhH?=
 =?utf-8?B?VVQ3ZWMwTy9XWXkzWEpMNEE0Wi9xY3lSK1VZRmRyUytiazR0T1dkS0s5Z2dL?=
 =?utf-8?B?c1hKSXZUUjA4ck9aV1p6cU51S3BXV1FjSXNVYTA0ZUM3c05ndm1STEFTb1Fh?=
 =?utf-8?B?YlF1MXhjZUR2YVFhbm9xNjNRTDFBaW40bis3Sk9CRkRnVlZyR0R2eWNuV0E2?=
 =?utf-8?B?YlZRUldpcWFId21WMXVLUmFYYTkvckJEcWdxQmhPWXU3YU5vUDRhT0lYQ3pG?=
 =?utf-8?B?eWZOekVIckUrT2p3Y2NPY1h4KzZ5VTlaRlJ4RVJZMGQ4R3k2S1V0SktxZEt3?=
 =?utf-8?B?TGNNcmFGVGJMOFVZRisyQStoK0F2N1RzdzgxODdoOFplZmZiSjdpcndrbmk5?=
 =?utf-8?B?dUZTR1FDbVlpa3FML0NaaGE1aSs2Qkk1dkMxdTkyUytNc09nUGQ4NmFHNmJG?=
 =?utf-8?B?WmZ1eVk3cVFHdWNtQjlLQi9mcjdNS1pRTDhpZDEvWVhEdUVjYW8xQmRBSVdC?=
 =?utf-8?B?SVpHTHU0dUl4NC95S3NBVnZaTGljcUtxeWo5ZWVHNjJXa1M5YU1oY1V0c29i?=
 =?utf-8?B?Z0w2NkIzdjhRZ3FoYy92cGNtUHE1UUdJK0JkeHN3RnoyMEh0MG94N0tVb2Mx?=
 =?utf-8?B?c1JNcnJvazZPK3dSQkJORkFsMXhJc3pSQWU2eHB1cVY3UUNYaHhYNHNkZTVo?=
 =?utf-8?B?WG9WWDJkRDM0NmdEdTlNZ1oxSHB5dmZqSVFsL0ZRUkMwQWkzT2FPTkp5am1Y?=
 =?utf-8?B?RFhpRk5xTm1HSWU1YWFIWWpUN0VOT0IyZmNWcjhjOEVsQldDV0owRXgybExK?=
 =?utf-8?Q?R+F0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5253.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2pMQUo1SVc0d1VwKzVWeUcrY25ML1RRaXVjcHRDMUUrRGYxc2VpRWdsQzJk?=
 =?utf-8?B?OW53YXlKV2E1dDlibVV0RDA5TFdtNmkva2xCRW5EbGhuYTBHU2JoTm1CTHVt?=
 =?utf-8?B?QSthMjB2MS9TWXFGdk11T01ySjFaSmhaYVkvNVFscW51akFRektDR1p4c2Q5?=
 =?utf-8?B?K0VEeGI3UXg1cUFSWmlYVEF5MCtYb1gwbDloTGhTNGJNNVFvc3BaTGdHMEJG?=
 =?utf-8?B?K3JFZ1RrQ3RYcUV6SmZqc0k4bkpzMWoxOGRyaDBFbmdpd1hPKzBucmxXT1ho?=
 =?utf-8?B?UWgveXVIcnp5NGdvaGRIUmZoMnFBSGlGWmY5K3dRelhwWUsxYUJwdU9QRU8r?=
 =?utf-8?B?cUJwUFp5eHliVHBTQ2VWemgyYUxaSUs5OGJFa1ZiK2JCRGtESks3Qlk5RHU1?=
 =?utf-8?B?U090OHF3QnJZSHg5Qlk3c3V0dVdwdnlLLyt0YVhTOHB5dmlrU0ZENkFnS3lz?=
 =?utf-8?B?ZERiakxmNjZrUkp3STIySjlON1ZzNDRwUm1odlJ5MFEzSEpGa0ZLVHc0OUtu?=
 =?utf-8?B?MXMyYUVoVW9MWVdMb1JadG54Y0Jqb3lRQ21SM252c2RIbHpZYjZJV0h3ejNt?=
 =?utf-8?B?T3JVaGJFYW9pQkJwQW5rM2JIeWh0Qmw5WDNOSmhFdTdCWUJrN0Z5dUxkbDR2?=
 =?utf-8?B?NlRRYXJnejNNenZ1dC9CSWRvaEd5cERoS2tSeXFLMGF4ZTFYOWVaKytmU3lD?=
 =?utf-8?B?WGxiUkRZZWdFaWZ5VGpNM2ZTeXpSVG1SWUpmYU9DeE1zVEh6ampsdHZhYldq?=
 =?utf-8?B?TzVDOXBMbnJTVzVHK0U1eVNBSzFYWmZLN201TDV2Ly9zSGJvSTBZSkFodTNU?=
 =?utf-8?B?U2RBYzBQNjNBdzhHcjY5OXBDaFBCK0p4cFdkRDJnbGhRNjkxdEJqVWRYd0RV?=
 =?utf-8?B?ZjU2akNzZkNzVUxuUmZ0N2UzYi8yRkNUK2RVVUU0MVA3RndmWnZRaGpUT0Nj?=
 =?utf-8?B?RUpydGp5Y3BpbG9UcTI2SmQ2R1pya2dZUDlsamhWazY0dkhMaXdZMkp3MVMv?=
 =?utf-8?B?cEJPNDh1VEwxWXh3T1VHRTQreE13OGdaWWZEdTdGV2tIVm1lUFIrNk03ZXdz?=
 =?utf-8?B?V0tuQmVpb2pLQmk1VHBvSVhwN2EyY0xhMi96Szd6WW0rRmQxVW5YZG9ZekhZ?=
 =?utf-8?B?Tllsc0NvdWRZMlJ0bElCMXpQN1JEVlNaTy9nOFRPcVlqZmpwTjZHN0RWRFlK?=
 =?utf-8?B?dHBMR3M4YnRkR1RDdEUrSFlhTS8xUWp0RXZ5aDdCVjE2Mk1yR2sxUEhVQ1VB?=
 =?utf-8?B?bm40YzY5S2pyd1FzN3ZEVTBMdzk3bU96TUNmUS9BK0hrY2VuampNd2Q0czRl?=
 =?utf-8?B?L0QzVkkzVS9qeCtqdVpaTEJnOTdSNW1ZRWdpUUZOZGpHWlVuMmNZZnpYNDlq?=
 =?utf-8?B?UHFUbTQ1Uys1Z0oybEluNGEydkJnNnlpMUh3SGhoT0JtZlVXRXV0ZmZzOGta?=
 =?utf-8?B?VW1Lck5laUVMcVZVUG1GNjNWeTBSaFNmK1VZVENtT0FTQWRWY0VGR05YNlBZ?=
 =?utf-8?B?WVpBeGk5Z1dnUlNlZTErUWFtR1h6VWtBQ21DSmZQNXBXQWl1WXhnZmRmVHAz?=
 =?utf-8?B?VUw1amxnWGVOZzh6WWh2Uk9HT2JkTDQ3azFPanBib0ZNeXNvRFgvN1g2OWJt?=
 =?utf-8?B?bVlId21JblZZeUtDOWlyVFdtYmRYbnRlMzRQZm9zZXRySnhUWDREVTBLbkFh?=
 =?utf-8?B?eW44TDVja25MR3JiU3FDenM1anVDTkFYT1cwUzFMdTc2ZDI2My9OZC9vV2Ny?=
 =?utf-8?B?c2toNDMvVEQ5Nk43ZjVwenQwSFF5Snc1TXEzcmd1Um4yYTM2Q3dobW5ucG1p?=
 =?utf-8?B?aDdXcUlhYTNnVnc2NVBnb0ZWQTRIclFxZWR3VGhTc000MjAvdFY1dkNsaGxJ?=
 =?utf-8?B?K0MxN1dsUG4ySEpqTExKVWo5STVoZmlGOVQraFA1RFVXdUgycTFGd052RkVJ?=
 =?utf-8?B?cFUvYkxIeVlpTko1UnovSXk5OUVDYStVUVJsbXhhK0g1NGl0OW5pcGRPb0dD?=
 =?utf-8?B?RjNhenhNUXozdGRpN2loR0RzRkdyck53UWg2d2JHanlnSmZ0OTRjWktOcW9X?=
 =?utf-8?B?enIxSDF1NHhFamFCeEU4T2paU1ZOS2FZb1R2cTZXTTN0VjNIYWtOSzE5VEJU?=
 =?utf-8?B?N3FZY1dvSXRVekcrM2RBcnduWWRvVXNEQlgyT2xzcTlZR01tNTdXaHd5V1BJ?=
 =?utf-8?B?enREUW1mRWkvQy9IdEVoUDUxaXVvQ2ZpYTdYSW14VHR3TDBjN1ZTS0pEbVU5?=
 =?utf-8?B?bG9Kd0lkeUE2MGJwM1JtejE2VDNXQ3J3d095NXBUbkg2MW9XQnlZalRTb1g4?=
 =?utf-8?B?cXkvOHNheHNEb21CY0FkTEkweHcxM2QvblNaUjdoZjhyMnlKZkVMMVJWMGhy?=
 =?utf-8?Q?xm00rmyA4KBIZM6M=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c4cc87-b33b-41ae-fe52-08de68bc5617
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5253.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:52:04.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPs7zJ08oJwxI2Q1LG474spmBJGGvtjyPjzMjY+X3pcFaUDiYZg63nAhFYCrgCke3cBfvNPV5aYI2mXnExJ7bnV2uNULvmjzEjrEA765YEU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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

--------------Z9Agy6TnpTAy3E4dEXugle6T
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 2/10/2026 10:38 AM, Pranay Samala wrote:
> Skip modifier subtests that are not supported.
>
> v2: Avoid code duplication (Rama)
>
> v3: Introduce pixel-format flag
>
> v4: Use XRGB8888 for modifier check for more robust capability detection
>
> v5: Edit skipping message (Rama)
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_plane.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 22c45ae5e..3588203cc 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -167,6 +167,7 @@ enum {
>   	TEST_PANNING_TOP_LEFT           = 1 << 2,
>   	TEST_PANNING_BOTTOM_RIGHT       = 1 << 3,
>   	TEST_SUSPEND_RESUME             = 1 << 4,
> +	TEST_PIXEL_FORMAT               = 1 << 5,
>   };
>   
>   static const struct {
> @@ -1469,6 +1470,18 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
>   	int count = 0;
>   
>   	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
> +		if ((data->flags & TEST_PIXEL_FORMAT) &&
> +		    !igt_display_has_format_mod(&data->display,
> +						DRM_FORMAT_XBGR8888,
> +						data->mod)) {
> +			igt_info("Skipping: Modifier " IGT_MODIFIER_FMT
> +				 " is not supported on pipe %s, output %s\n",
> +				 IGT_MODIFIER_ARGS(data->mod),
> +				 kmstest_pipe_name(crtc->pipe),
> +				 igt_output_name(data->output));
> +			continue;
> +		}
> +
>   		igt_display_reset(&data->display);
>   
>   		igt_output_set_crtc(data->output,
> @@ -1497,6 +1510,7 @@ run_tests_for_pipe_plane(data_t *data)
>   		igt_describe("verify the pixel formats for given plane and pipe");
>   		igt_subtest_with_dynamic_f("pixel-format-%s-modifier", modifiers[i].str) {
>   			data->mod = modifiers[i].modifier;
> +			data->flags = TEST_PIXEL_FORMAT;
>   			run_test(data, test_pixel_formats);
>   		}
>   	}
> @@ -1507,6 +1521,7 @@ run_tests_for_pipe_plane(data_t *data)
>   					   modifiers[i].str) {
>   			data->mod = modifiers[i].modifier;
>   			data->crop = 4;
> +			data->flags = TEST_PIXEL_FORMAT;
>   			run_test(data, test_pixel_formats);
>   		}
>   		data->crop = 0;

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

--------------Z9Agy6TnpTAy3E4dEXugle6T
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 2/10/2026 10:38 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260210050822.1095409-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">Skip modifier subtests that are not supported.

v2: Avoid code duplication (Rama)

v3: Introduce pixel-format flag

v4: Use XRGB8888 for modifier check for more robust capability detection

v5: Edit skipping message (Rama)

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_plane.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 22c45ae5e..3588203cc 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -167,6 +167,7 @@ enum {
 	TEST_PANNING_TOP_LEFT           = 1 &lt;&lt; 2,
 	TEST_PANNING_BOTTOM_RIGHT       = 1 &lt;&lt; 3,
 	TEST_SUSPEND_RESUME             = 1 &lt;&lt; 4,
+	TEST_PIXEL_FORMAT               = 1 &lt;&lt; 5,
 };
 
 static const struct {
@@ -1469,6 +1470,18 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	int count = 0;
 
 	for_each_crtc_with_single_output(&amp;data-&gt;display, crtc, data-&gt;output) {
+		if ((data-&gt;flags &amp; TEST_PIXEL_FORMAT) &amp;&amp;
+		    !igt_display_has_format_mod(&amp;data-&gt;display,
+						DRM_FORMAT_XBGR8888,
+						data-&gt;mod)) {
+			igt_info(&quot;Skipping: Modifier &quot; IGT_MODIFIER_FMT
+				 &quot; is not supported on pipe %s, output %s\n&quot;,
+				 IGT_MODIFIER_ARGS(data-&gt;mod),
+				 kmstest_pipe_name(crtc-&gt;pipe),
+				 igt_output_name(data-&gt;output));
+			continue;
+		}
+
 		igt_display_reset(&amp;data-&gt;display);
 
 		igt_output_set_crtc(data-&gt;output,
@@ -1497,6 +1510,7 @@ run_tests_for_pipe_plane(data_t *data)
 		igt_describe(&quot;verify the pixel formats for given plane and pipe&quot;);
 		igt_subtest_with_dynamic_f(&quot;pixel-format-%s-modifier&quot;, modifiers[i].str) {
 			data-&gt;mod = modifiers[i].modifier;
+			data-&gt;flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 	}
@@ -1507,6 +1521,7 @@ run_tests_for_pipe_plane(data_t *data)
 					   modifiers[i].str) {
 			data-&gt;mod = modifiers[i].modifier;
 			data-&gt;crop = 4;
+			data-&gt;flags = TEST_PIXEL_FORMAT;
 			run_test(data, test_pixel_formats);
 		}
 		data-&gt;crop = 0;</pre>
    </blockquote>
    <p>LGTM,</p>
    <p><span style="background:white">Reviewed-by: Naladala Ramanaidu
        <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260210050822.1095409-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------Z9Agy6TnpTAy3E4dEXugle6T--
