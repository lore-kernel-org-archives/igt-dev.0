Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B682FC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 03:40:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5CE10E49D;
	Tue, 17 Jun 2025 03:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S68ey7Sn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE7710E49D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 03:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750131617; x=1781667617;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cPBDEHE/nC0QDy4hSaVontVxxg1jHaF/M6kpv0gi4bE=;
 b=S68ey7SnRzKgvSgRhrv2UmovVWOHt55Tyj7WJvDpKoux31pVQHE44+U1
 uYBuFZ+TucPIOC8o49O7ToQS1W2yVon3KKeNaKL+BBr+BhTDQNGkcEabO
 2iIttezIh0noW+6iVvkEs9llHe3TQzJ0yuanTp/VIEuBTQHEkaMWYdHCw
 Pfp2xNgvX9UvlrNMP/it2VNgrGQmwq/n41bdRpNeT9TwTC2FZOA2tmGLY
 unnN0AQgDg3yiLYotiP1+QCKnedsDBiTuSQXdB2j4H+AAoV+1QqnJXIJI
 9zqcpDby2pR7fo9jgYSBO68WAd9a+NMB2/I9Rt+1A/nZ4RI9wi/53cOQ5 A==;
X-CSE-ConnectionGUID: sbSHxBU6QcaFMHOObmszcA==
X-CSE-MsgGUID: CArqIXZaQHWvwUVH2FjfRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52433808"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52433808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 20:40:14 -0700
X-CSE-ConnectionGUID: 0PTUeED1T5iDkCMcyx1TRQ==
X-CSE-MsgGUID: DMmCqcyGQ0GCofbk6BcnVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="185906234"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 20:40:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 20:40:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 20:40:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 20:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfJIJHHFL9YchCeNVMfDSsKo4ZpTgTGwFiPIZaqmp7CYIPt8EJCfuQpq3fji1ano/V92pEGf6WIsvMMn2yHcs7QYLBDeRWKODXaP/0Muq93tvZ/eSACND1Cpf8iOWvw6rYka6p1twLLGOZwTtMM2wWguDjnjHDu54zDY7tOnipTnLX9CD/DqbpbCzxvEEkA1nJtI2fmwmfKFnZ9JrHuNYI2x52rXuYI4e10aZ56PbpK06U5AGibdDiZpVM8fxrOuJHznUU3+A13/ANBeZJ2FyvokAB6eRxcQiQDMqViRwuYyDBqmkkXtpC7pVtftkLLYcJdFeR5KEmdaEuYLLbcekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOPsDRa+/JXbhcJzAC2iswyGwCTDucq2oascaWXrieE=;
 b=zAGz4kvMOp8Bs6sxCcqWT+XEL/X4HF6aZ0sbPH+w2BFUZ8tzRvtxzPBDZSxGI8jWU+URulyDXWowj4616YfI/oZ7nhsa7E4RqLm0aXFlVjnVG3Su9AAnDdHCAae3R5Yh4Cs564KtwWlr5HnOe4TWWz8k6FYjrDQ38cD5/5UqYXFOPu8bikfADK3AD9sziOUeEPlefJ/5L14qGACgqWbQUZMetwo5G4fDvOOpYoDvZPfNHblFoP8ZjsMrkyNSa9ryzFMkFki9h6LZNm0zYUWei6FkOvhGsROpNgNs7WVMmccCXO+FzrN+XaXjn5up9DFSB9rq/ZsuS1BDypLpXIg/gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 03:40:10 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8769.029; Tue, 17 Jun 2025
 03:40:10 +0000
Message-ID: <8723ebe8-96b0-4cca-9586-7469d45b6ff2@intel.com>
Date: Tue, 17 Jun 2025 09:09:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/5] tests/kms_flip: Default to tiled modifiers
 for stable flips on high refresh panels
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
 <20250616063831.3332042-2-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250616063831.3332042-2-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: cfa463fb-cdb2-4bf4-6bff-08ddad50a89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VmRvZ3dPaENiY29HSUlKeXdiakxnS2hyenN0a0w1YkozTjRvRVlROTR3SjEr?=
 =?utf-8?B?WWVhcGRJVzdsdnJDTGQ5WEZYdngwN0k0dnZYamlLU1RIbThtemNqQUUyeW9v?=
 =?utf-8?B?UFE1TWhVRzZYVHVxcXhPQm1MT2RoYnNndlNKTW9ZZzhuVk5HSmt4QkJ2T2RG?=
 =?utf-8?B?aDhLVXhPVWxHVHh3UE9IQ2hZSzd2M01NMHhkYWJnT3J3d2RDYThyRHBBeFZj?=
 =?utf-8?B?aWc5Y015MmRNbDh1OFJwazQ5WXJlN3FSbWZXQVYxK2ExZTRMTTY2VW5wMFFW?=
 =?utf-8?B?Q1prTjZ4ZjdkUVhsZmNvaWlEdGFHeHN3RDEyRG5GQ3RpWXEvS2Y0WmR6QUpy?=
 =?utf-8?B?dUtMMGltU0pEMklINGl3Y2prSWpmNC9jcktMeXE1OFQ3UE5wUG93d3p3NWJI?=
 =?utf-8?B?RVZldE9pY3o0KytFVUlQd29YeTVja05PUkFFNm9WbXZUQncwWWF6cHF2MTRJ?=
 =?utf-8?B?emNoK1NqWHZ4N3hDRUs4V2h3K05UZ0s3QUtZeDQxdUlFSk5ybTB5RVVMQVBk?=
 =?utf-8?B?cXdtUm42ZUdqT1dBenh3LzJBWlhZblp4akg0dDBqMGk5NTJkVi9CR0JBWkgx?=
 =?utf-8?B?aHYwVFFnZm10SFErVVRQRHBnZ3pxS0VrdWZiWG1pODNnWXE0bWxjcGs5UWxH?=
 =?utf-8?B?SVNrYUFUbFlKR0M1ZyszckNjMlhuUk1zNmpHRFdUYmhEbnAxUmNQUGdKUlF6?=
 =?utf-8?B?S0lLM1NLRXYzVFQwRXNTdWhpVlJmclgrT2dKQ2h2alFYVjBpdndiUnlYOXNk?=
 =?utf-8?B?ajNpUTRaYzNKWmo4cU5rb0Z4QzZuWS9HRUtBMDgza3hrbDhEQWZsMDZFTG9G?=
 =?utf-8?B?K1BxaFNmTVowT3VKZGJ3Q3FLaFBsZXpTN0dVQ2l6UHB3Q1d5bFR3MHhVZ2lD?=
 =?utf-8?B?eDN3Ykt6eXJ6UzdhMnF4ZXpBeU95aUcrQStFaStVbTZXL05XNlJoblp0MzZS?=
 =?utf-8?B?YWNRazNHWUJwSnVpdk51bHdhcGM4cWN4Nmp2SFFlTm5wTGZGZFdkb3k4MDNn?=
 =?utf-8?B?RXJkTVNCWXI2SDJPblVqbEhDSm4vWGNDTnN5TEM4bkpnSWRoQjFTMUkySE1i?=
 =?utf-8?B?SHY0OEJucFpZR1FjaEx6NEM1TXJqcTE1QWdtM3NMc2Z4T2V6SnNJQ2pkdk1m?=
 =?utf-8?B?eG8yZFBzWUlwbU1rV05iL01tdWFwM0lJeWdqVVg2dGs5U0VjRkNtZnAzWlRy?=
 =?utf-8?B?QXIrVkorNXdzVnNYNWpIQTZRVStya0UwL1dvSGlFcEFsdW9iemJETTNFRkMr?=
 =?utf-8?B?WmdwWjEzTmhKZ2JtK0ZURFE4RExYUDFTWXdmYTVpRXdKNlRpWlNEdWRxRE9o?=
 =?utf-8?B?WWFLV2hKbkp4eG5tRU96Qzh5VUN4amRHS2VTQTlQdzlwNEtQbVJJTjVuRzg4?=
 =?utf-8?B?ajJwRmlpQm1Wbm9zSjhrc25hblFGT1p1bHFJTVF2SVUyVFNqbzJIOVpRZ0w2?=
 =?utf-8?B?T2ozbnNRVktUQ0pvWDlxR1Qzb2YvdzVjOVd5QnhFYmlCQVIxbDFPd2NNaEE3?=
 =?utf-8?B?U3E1Z25CamxtcnhINlpHMUtSaVp2NUJjR2FMOEV3VzRMRHNIcmg2UFZPbVY3?=
 =?utf-8?B?RW4xNFBBdUhLV05XajZoVktjL2hvbFEya3g3UXFHY3dpNk1EVUVUTVp1WFh0?=
 =?utf-8?B?TmpQR21rSFdLUlgvSGdFcmQyTGUzT25Wb0s3dWZEMG5LQlFxZmJLZjVNaXdD?=
 =?utf-8?B?cjNBMHo0VzlpUTh3UDlIcG1HbVJCK1FadmdFZGxkUEtkcHg5V2VWVTZLVmVF?=
 =?utf-8?B?SHVPS2hmY0laS29hdWMxSkdQTjdjNmxzNGpEdjNtdWJhSWhxWUo3bGNlZzhP?=
 =?utf-8?B?NnZnUFcyNE51QUorc09xcERtZWlTVXRkaDJ5T1ZuNVhra3FmdklucmdBUU9J?=
 =?utf-8?B?QkIzRHlRYVAxTm5haDExUGpJTHpVaE1sUFBhY0hyVVlmbXRhL056YURpV1Vx?=
 =?utf-8?Q?UTHFVVMqozw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2dGMUt6TE0yNG5pL1VvcENtMk96Vm5NRmxHVTJvemtxMUlycmNLQnQwSmxx?=
 =?utf-8?B?aEFZazdGOGhMWGNRSnFDVzFWdXpreGFCaHFoQko1cnN1MjV0QUFFUHYyZHFG?=
 =?utf-8?B?bXg1amhTalphZjRIRDNHY1VDR2RlOEM3RHR4TUlRaGVvbGR0dnNNWm4vY3ZU?=
 =?utf-8?B?Zms0NUpoZVlIYk1PR3FZb0Fzd28xalcyMHkwaUFOZzZsMVprODVDclJtd0lO?=
 =?utf-8?B?MDByZ01YTU1ETENybHVkSnJYNVZ1QnJyTWx4UENVVXBYQWsyanF4OFNvTEhS?=
 =?utf-8?B?eWJ3MEtDSTIvKzlEWWFrbFBLRzFlb0w0SWFobVpGdTVVNnVwbDhRSjNrbWhh?=
 =?utf-8?B?Qm9WZ0dnU0l3SUxzejBsd2p2NmY4NkpnL1ZGd0NXb2padUtOUDNXbkx2S0VV?=
 =?utf-8?B?Zmk4ZkxhUXMzSHRkMUMvY2VuVk4ydGRKY1NWYmVENEFjQTdPQnVEL0RwV0d5?=
 =?utf-8?B?cmUxeFdvQUJ2eklHQVNWT3BjSFlNY1M1YVo3c0dLRURBN2pYV3BQZG91Qnpx?=
 =?utf-8?B?R3BPOUxDeHZJTkdwemJiakpQV2VKVTYyNUErRWUrOTR0aUZpWFhtd1N4UXZV?=
 =?utf-8?B?ZWkrMVd2bXZvbythOTRENkFONkwwbXRnSEFzb2JEbVhreGlSWTFabysybWcz?=
 =?utf-8?B?OWNjVnp6eXdhd1JhdFJMZWIxNjlRaXAvVVJqMkZoL2dXTWNqbTRmK1g3Ykk5?=
 =?utf-8?B?dnAwZ1RiTzgyOCtRemFvOHhxUzVNNjJBWlkwWmxvZXdrSFJqbEVxbTJxMGZF?=
 =?utf-8?B?OEd6aWV1bllxK1JFNTVQQy9nOW50R29idE0xWG1qSHJEUGFxbXdSSGMwempu?=
 =?utf-8?B?bUpkbjlWcUNFZmJOMEl5eWovUEZBak13UHlURW05UWF2dmdnVFVoVzFSNGty?=
 =?utf-8?B?djkxaE5oOFBOTWlrellGYm96VXhFU2ZSdlFWZ0hJMXRFTUQ5cGVwc1pZdzFX?=
 =?utf-8?B?MG1VYkwxMDBDWnVTbU1DQXIyaVZHUXpUa0F2YUdLc0kzOWI1MllGMDNYZXVk?=
 =?utf-8?B?Vm8xUWlENVg0eHZ0TDZPbkkrRC8wcDZDT2grL2Q5cjJRVzdaTjlFYlhOaU1U?=
 =?utf-8?B?MlVxbStHV0hhY2kwTTF6TGEyaXFTTkJyZXFoOEVSODZtc2hVeWVLbEJVTzRv?=
 =?utf-8?B?b2ZISm5yYXFuRXQ0T3NPNXBNOHBiUWltVFNldlB0eVpDSGJtNG9MU1c4TG03?=
 =?utf-8?B?M09JT0VzNXY3aTdCbzRWWGhCS1Z1K285SWZ1MnJkY1VrMEt0cXRJTWZPdDNp?=
 =?utf-8?B?dGRvbWNZSW9QK1FEZVhibElWUVlLcDB3YzNOM09zeDZ0SkVMcTZjT1BreFdU?=
 =?utf-8?B?WitZaXRhYVIwaENXMXBQMFNTYXNDZHp1ZktkajJ1THkzRmhHdUluMFFBWmNB?=
 =?utf-8?B?NDBqbEtwckQ1UVNEQzFmRnFwTjNKcW5FaFQwMStRTGFSVlVSUzc3NFlFTzk0?=
 =?utf-8?B?Z3dmQit2UzhjU0VZMWZnd0JzZzVRdEhTU1VWcFNiQTNZVm9BUEc3VUhLNzBR?=
 =?utf-8?B?MkRnd21OYzB6SGZVZE9yRG5ZY0kyQ01wY3FCUCszS3FURmN4L1ZCR2Q4bGxE?=
 =?utf-8?B?YzlBS0Q4TEsrQS9sQkg5M0ZZamllbXJqc1BQbXZETEpndCtSNHlLaDNjeURJ?=
 =?utf-8?B?OVVhcU1Lblp3NnZnQnlzeFM0ZDdJeWJCWTVJS1hLMkZ1NWx1YS9BYjY0bVdM?=
 =?utf-8?B?YnhCVUJsZ0dtRWpON2dYVDlVUWsrWUVYc294VnMxT0ZzM25rUm9HVXFtNFIy?=
 =?utf-8?B?NXNiSVd4NU9qNTVKdnMwa1ZyY0hvM1RleWhwWG9aTk9HNk5XaThNV2pXTmNr?=
 =?utf-8?B?TGJtRW9nalZ6czNUWDNxRE5rQmUyWnNBNmh5RHRjL24veUoyNmNidVVidldM?=
 =?utf-8?B?RXA3SnpmYmpSb2tOTHdCSEVxU2tydFNDeGdPY2Q1Rlhqd3dLTklBQ0Y3WUds?=
 =?utf-8?B?RGNXZlNaMGlicnpJZTJjMmIzVlZPMEZNZGpmTHo3dmRyNzZJcjhnRTNKTTN0?=
 =?utf-8?B?bnkvVkF3aXVFMlk1ZGlESVVVQmFkZVhDbWxjZ2x4M2tFM2pxU0p4NVowV0N2?=
 =?utf-8?B?SDNhNlZXbnZhdG9wZ2VDSGFGYWZhYXlaZ0syeUlUT1ZuYW1HbUlRbFBIRWZN?=
 =?utf-8?Q?dpz5PxcMZxhtZyiiJ91f+cyOx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cfa463fb-cdb2-4bf4-6bff-08ddad50a89d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 03:40:10.6933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aOGYvlyfUwG8zegAQIJoeKEKKG4gBXfiuiyinpx5iPmHqxDBO7YLm/JJE9Yl1lyDlM0mVpI3TXBcmUUL2JM+fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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


On 6/16/2025 12:08 PM, Naladala Ramanaidu wrote:
> Using tiled modifiers as the default significantly improves flip
> test pass rates, especially on high refresh rate panels.
>
> Consolidated report on 10 samples on each pipe as below.
>      - PipeA:  95.01% -> 100.00% (Improved by 4.99%)
>      - PipeB:  91.57% -> 100.00% (Improved by 8.43%)
>      - PipeC:  73.17% -> 97.94% (Improved by 24.77%)
>      - PipeD:  76.64% -> 98.89% (Improved by 22.25%)
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index 65016c66d..ca31ef7dd 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -282,6 +282,8 @@ static drmModeConnector *last_connector;
>   
>   uint32_t *fb_ptr;
>   
> +static igt_display_t display;
> +
>   struct type_name {
>   	int type;
>   	const char *name;
> @@ -1533,7 +1535,15 @@ restart:
>   	if (o->flags & TEST_PAN)
>   		o->fb_width *= 2;
>   
> -	modifier = DRM_FORMAT_MOD_LINEAR;
> +	if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888,
> +				       I915_FORMAT_MOD_4_TILED))
> +		modifier = I915_FORMAT_MOD_4_TILED;
> +	else if (igt_display_has_format_mod(&display, DRM_FORMAT_XRGB8888,
> +					    I915_FORMAT_MOD_X_TILED))
> +		modifier = I915_FORMAT_MOD_X_TILED;
> +	else
> +		modifier = DRM_FORMAT_MOD_LINEAR;
> +
>   	if (o->flags & TEST_FENCE_STRESS)
>   		modifier = I915_FORMAT_MOD_X_TILED;
>   
> @@ -2034,7 +2044,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   		{ 0, TEST_BO_TOOBIG | TEST_NO_2X_OUTPUT, "bo-too-big" },
>   		{ 10, TEST_FLIP | TEST_SUSPEND, "flip-vs-suspend" },
>   	};
> -	igt_display_t display;
>   	int i;
>   
>   	igt_fixture {
