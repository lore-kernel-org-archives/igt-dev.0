Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21DF0C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 10:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BDA10E0CD;
	Thu, 22 Jan 2026 10:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OZmpPtG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E9F10E18A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 10:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769076183; x=1800612183;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gbfahxJljXwL/qJHi8iPExwyQLf/udDRNuxiDsHIKQ0=;
 b=OZmpPtG2UCoKOhUgO8f7uFeB0T4rHc/TkMjlpyDnQXTirAqQDYbflvme
 g7BU3I01VpGQ9yDYVInPLzn0GSnBwvobKNKTZwNBhj08CptEOAkA2EN+E
 b6BfN54FQSqRao1/PCSar2WqxJ/Al6AwsRnJmSbF+SWwYAZWVHU7MY/75
 wGnNww8FIMUSeODRTgNU8X8H9m17wH5Byb0C3H1q+8gEQUcpuXsxE0vWj
 AWuoJv1OBMNZ5vEEy8RK+MnXHcH+LKiKNVfGtFYTrZY6exHNsKJb3RiFU
 phnGfiWSX9bbtUhmCoO4eqYB6A8b94WrJfBIjiOS18Y245EvLUP+m+SYj A==;
X-CSE-ConnectionGUID: LO8zQBVqSQWNwq8Q6Kl5Ag==
X-CSE-MsgGUID: m1LyUiNETk+m0FdQRvjx6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70222727"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="70222727"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:03:03 -0800
X-CSE-ConnectionGUID: bX1Zv7LXSsCv71Ckvb2dGQ==
X-CSE-MsgGUID: dIFb5w2LQfiGF+NvnnJ+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237955760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 02:03:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 02:03:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 02:03:01 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 02:02:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wPi3w8xvKy62KY8eSU7rlvAf6pZGLCuRbJrpp2bLtx0EB/ZZLkoy3fOrb35po10EzPHRMK+9DSNTCzBtdagniQT4ZvtkeSj/aZfhlHTlf1QAB9Z8+SsHu0GeWhWksZ275UVhsqEBmia4UVrwyi55JH2K8y87H1/SUuhYRBowSHpYBokOtXHozlXjviMWRepu244fc8Y0c6x5fwIhslGM1ZJn1HMVjCd5JS2JSB/PooLt4LW5TG2GPDSOyZ6sUJfwsNaPmQAUY5aJrwDT8RroOg9kswJpOeUB2d3//8wxzg4CjLMjf7hVVn9IWIXO+4DbcVLjDiFde8VpVxQKmRxarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbfahxJljXwL/qJHi8iPExwyQLf/udDRNuxiDsHIKQ0=;
 b=uAoQ79uEWwpe1AXapPb8eL91Saql2MOpkNmt1XRJ5l/Vf7twrsSuLMkHZDFm51DtrjzFn8V09vYSCrZhuq1bWGEYfdS9UE2htuNxRVGApI88egcOCEUZkwdsA7xet4reC1Eqh5EclhRRY36RfjqyTeTxejeF2qmxB3xl2RrGK6jDI8zZjCAPwkbhDTu6AnxvVJfruOLNzwq3pZskStqdXCNaPtl9ebQUX7z2nFd8lyTNIHVHe8Ni06f021PpcWnV2xPdGj9TSZUMAX2zbMU14rZIYx5uMaFPAicN82NrOT50wjGsBd2mWxw/fOAVvAATTGWzE4Y/rNBWOm3KqUpAaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by IA4PR11MB9180.namprd11.prod.outlook.com (2603:10b6:208:56e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 10:02:58 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9542.009; Thu, 22 Jan 2026
 10:02:58 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Thread-Topic: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Thread-Index: AQHcipFykJqhE2PLRke5t+xCVBmxA7Vc/IWAgAD5O2A=
Date: Thu, 22 Jan 2026 10:02:58 +0000
Message-ID: <MW4PR11MB71513157E160F8F55611B3DBE497A@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260121045003.116426-1-nishit.sharma@intel.com>
 <74599fd049cb837f788d038123225f5a581eb9f8.camel@intel.com>
In-Reply-To: <74599fd049cb837f788d038123225f5a581eb9f8.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: kamil.konieczny@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|IA4PR11MB9180:EE_
x-ms-office365-filtering-correlation-id: 27daa21d-1d58-435f-6d95-08de599d6b79
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MHUzS3hVN1o2SE1vcDVRNTJOR0lwVnAvVmZVTjg1eC9tZUNFRG4yTXdSZjdL?=
 =?utf-8?B?elViNjVLYW5JdUxYajNMaGw1UmNqNjJLdUNmdG1ybkJiNlNXYTFVeGRjMEJu?=
 =?utf-8?B?cUlEUU1GQllSemdiWGxWSm95VTgram9LY2pqOS9zZC9rYWtBcHhBT1g1TXUw?=
 =?utf-8?B?UGJzQ0N3cTdHVU4wRjBNdnNvMGZIQm84UmUxS0lMZFFWZzEzZGtZNWhQcnVp?=
 =?utf-8?B?OHBPbVUwcG4zdlNmYkZxSTVYY3Y1c0J3a0RUZk4yQkRLb1NHVlRGVXViM2dV?=
 =?utf-8?B?UmxabzNXTkFPY0szMG5BL1c1ZXJQc2JKSEJWOFo1NWRPZmRzWFkrVTc2dkkx?=
 =?utf-8?B?UnJQdEhlQ2pvZFVkM2N6RTlwb0tLbllDcDRRYUFpaHVCYkFxRmlpNEJ5Ylpy?=
 =?utf-8?B?KzBiY2ljYlVyZVBJT0RNaXFudHRwMFQ0eTQxdTdoSEFWUi9sajd2N3pkMDFv?=
 =?utf-8?B?Sjkrck5pUjBscGFZWnppaUJTTkgzQ2ZpSVlnTmtlMDQwRTlkQUQvVE9ubVYw?=
 =?utf-8?B?VmVOREt2Ly9PK1B6Q3k3OEJnTmMvVjFFd0ZwcmUxM05EMzRPS1EwZ0UwcVhF?=
 =?utf-8?B?SDBVbmxIRHgzWkxUM3VaaUcwQ3lQTUFHOWw2Q2VSZkd5bWsvdU5LZXIzemNM?=
 =?utf-8?B?cmlsSERad0cxNWIxcFE2OVhodzhpRzBwYk5aeWYvTExPTzV3Wjh3TlFFa1c3?=
 =?utf-8?B?ZGdYUjZUT25URWJTeEdwd0xuTXlyZ25JYzltellrMUwrRkthSGtHUGY3cEl4?=
 =?utf-8?B?WndPN1lQd0VGbDJ3MDEveEN4dUpMand3Z0lpVDlYZWpIcUF0VWo5RStBNjR5?=
 =?utf-8?B?NlhrbndHWjVTY1JmS1d0eUd4eTM2WjdPV0dpeklHZzFkTWJGR0ZWdnQ2WFVs?=
 =?utf-8?B?TXNLQzgzZ1RtYkNlTFloK2VqeXdSN2RRU3ozNXZEd2pXVU95cDVVNmFBOW01?=
 =?utf-8?B?cnc5Q1FkSFVORXlMdGFFcmZHRnVQQzlyNVNvZ3hIeGs5MUl2QXZIVFh6R2gv?=
 =?utf-8?B?WjBBUzJQdjkvVEdSUXZzcFZpWWhzZDV2b1NNRncycVF6Y3J4aVNWMEdoUHhn?=
 =?utf-8?B?MVFSTVM4b1BGbjQ1M04zMnBzN2dCM1JJaEZjdzNMY1JiMFZqVkVDZDd5VkFy?=
 =?utf-8?B?Y1hzVXhrQWowZC9XeFFBSHNtb2JjU0pKKzNnL09FallpdXVjM0F1UktXUTFI?=
 =?utf-8?B?ejdlNUE5R0NwSkRJaFcwWkV5K3kzK2NPdkgzT2M3bnhCUTdobHd1ZmVlcmVo?=
 =?utf-8?B?MVdJQmNRdVg0SHlyd0taN0hlWGtJWXBUU2VYM1QzclVSVzJzQmhsN0cwNGdz?=
 =?utf-8?B?UU9XU2d5SWsxb0g3Nzk1M3ZhOVBuTk5Sc3dreE5JcHFYTEsySWJVUG0rS2tw?=
 =?utf-8?B?VTB6SWFBSlJGcFNUcXBLTW9HeUxWeWdienFrVmZDRmRHRnM2RnVieWdPMU1K?=
 =?utf-8?B?aUo5c1R5RmhaRncydS9VbkxoY1RFOHZDUU1yS2xINERZQm9FQlBvTjc2eEdO?=
 =?utf-8?B?MXlKcWZUeWNoUFBpUVJ5d0hPU2tBZmVsV0Znc0pYZnNDYXZFM3piaWJIbTIy?=
 =?utf-8?B?aGlrSEN2cTBZbDFMT3RSTUs0blB2aVlzWlFOMG9lR3k4ZmQ5M1RsOEtuVVhO?=
 =?utf-8?B?eHZGalY1NEFMSzBjczhHb25PTG8va09jd1RsVlZBTEpNeFUxVE1mczRWTHZ3?=
 =?utf-8?B?cTdZTFdGZjhseG5Ga1VLa1JKNEdGSk1tNkR5N0VLbjdEemppbzdCb3dBVjZO?=
 =?utf-8?B?ajJTSE5wSm9EanFqK1pQckFMRUFtSDlGUjFJaCs5b09mUm9SR1daTW5zeGlj?=
 =?utf-8?B?WTRFWVBDcjFBYml3eC96Z1BPQlhtZEx2bUtjVDc3bCt2L2NwcURzTnJsUEww?=
 =?utf-8?B?SlljRmFlUXNleEhYRktMZytDSlpFVU42ZFFzd0pxWDQ0b0lsQkROV0JudDlu?=
 =?utf-8?B?UnN5bGwwa0FEdHZzaGk3WVFiUGNuek5CZHFzc1RZeGEyUXFwaFd1VVJseUhX?=
 =?utf-8?B?b2hqSUdSNzI5YkVnTTdYTFZhV2NKY0xYbk9NRy93VWhmNC9zNGtJZFVXRnVC?=
 =?utf-8?B?aHViTmhsUTAweE05WHZQRTBqays1ZjdKa3ZWa1I2RVh0anVWbG1oa2RYWjVX?=
 =?utf-8?B?M2xHOVpMSUVmb3ZMWFhsL255VHBseFl2TkVOaVlVdVFNdTZhNk9TaWQzS214?=
 =?utf-8?Q?n+rwdI624gODl9NuptgGGw4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N2JWci8vSXMvcE9kMnYydDFzaGl1WHlqVFM2SlpXWkE1OTZFU2x6T1BDV08y?=
 =?utf-8?B?Si85K2dLdms0Q21NbFU2ZjVSTXdCZW9hMUdLTDBHSmtISG0wSkZSM2NyVVda?=
 =?utf-8?B?TGliYlg0RVRDbms3ZUk0RTltUGpUU3kvSUVJWmhqTkJGZHN5b09kd1dFUnE1?=
 =?utf-8?B?cGNRMHlyNUxySUpLWUowa281eVNmdHM3ZFpnTTBBa0FjdzZoTlNVaExuVnFI?=
 =?utf-8?B?NkZZSjNWdFRGVzV2TlB0VGJ1UlZoNU5nSTVxTXQ4UjB3N0ppUXVXS25TcGtE?=
 =?utf-8?B?MUp0bW1yRVFmY2Q4NzM1aHFXejdXSFcyVko3Y0V1VC9xckJnUmYxdlFCQzhy?=
 =?utf-8?B?VVZtR0FxZ1lDVzM4SHlYaERhbDYvam9KODZ4anNYNGtqUW9KWVF5VklHaGFk?=
 =?utf-8?B?SDZvMEJFTDh2T01HRTdFV0VSRERxYmdEQzY0dW5iQXVSNGJSdFpUVzJ0UXFV?=
 =?utf-8?B?Ulc3VVppZW8yQ1JXNG9TRzhpY0dLcmNwb3pSbUc4SjdPMDBHVDJjY3BWbngx?=
 =?utf-8?B?VVNIN2d0TmZoYXZtbTBzWnZHNU8rYmp6dUFXSTZHTE4zLzdUZjZMSnZ0UHRS?=
 =?utf-8?B?NlhZNnJOMnZhWlZnM3A4aHQyRUVuSk1TV2MvWFUxL2NibkRaeGwzSjAzekE5?=
 =?utf-8?B?NHRaSUIvYUJwNlBwQjg4Y2dYMGQvTzZ6Y3dIeGVCUjBFeThyVG44NjhCeTMw?=
 =?utf-8?B?WmlDYUNoa3BXL0JpTFVPNTVZRzlwTE1YdDNzNThHVWZRUllhZ05yR1RxQnE5?=
 =?utf-8?B?bkRsbGR4MFU4MGFMYzFIS3ZWT3ZhVmNMMTN5NnJTZ2tReTF5QjJUR2dpNm9K?=
 =?utf-8?B?eWRzMk1COFJyTENaMjYxeUZwZUxzenpSdCs1MTZuZTBpRlM0c1JFZGRWaGtq?=
 =?utf-8?B?NDZDMFE2cVY1aFZVdERZV0E5MytpcWFrRGpYYzQ0RVkvVUl3ZDhCazlWVGNZ?=
 =?utf-8?B?aUhVdFNJWitrbTlSREV0Ny9ZRjhYYUJ4alR1ZzVIYzJTZ09LNmp4VndYVjhG?=
 =?utf-8?B?QlFjc2RNMlltVlpFc2M0c3ZIdmZJR0dJL0ZWLytWTUZQTndPNUNOOU1uVW1w?=
 =?utf-8?B?b1J6K2Nlc0ZoZTdpSDRRdkVndWIrc0NvV21pTm1hQWROaytpcGFZK05JZFVw?=
 =?utf-8?B?eU5hSGczWFo5cXVEUytnbWhCWFJQMzJBZ21mQjg3YTFzVVZOU0tUU3p0c0U1?=
 =?utf-8?B?K2lUa2tqY1RLSnpsVDZ6MGJSNDhkRlc2dnpxOStQcDBaaXAzR0ZzRkFzZFRT?=
 =?utf-8?B?SUJXRGpSTHRSMjkzR1NmakZYK2hWVTRHVjJjTnlTZFRUaG9zaXU1R1RVK1Fj?=
 =?utf-8?B?VDI5MlFXaEJyZ1pwNXdFM3YvOWlCaGlMOXZvTXQ5QTNtYStISk1DQ2pLTnE1?=
 =?utf-8?B?WDlqbEFma3I1QkpQRFlSSi9nMkIyV1hhNVllUC9JUjlHV2U3TVBxWUFSZGp1?=
 =?utf-8?B?cEdpSnc2RkcvSWpsYVNJQURKZEl2ZVRlcWpmcUtCeDVJV29HVGUzQnhUSWxr?=
 =?utf-8?B?ekRnQzQ3NklIRGZnS3ZlSWJKMjFIc1AxdS9hN0twTlhnUmRUYjJ5a3AxaDFM?=
 =?utf-8?B?YVEvcVpQb3Z4NThqNll5OFhKMjQzTjhrcXRoTTNSOUVSMzRYQVJlRTNBcFUv?=
 =?utf-8?B?cnVaT2Jya0FZTSt0bVRhS3VqNWtpOWZRV0Q2QmNZbGF2WnFqQUNPeXNzWHhV?=
 =?utf-8?B?K0V0ZWh5UW9YcTR0VGZsT013ZjVsMUlwMkJJWUlzMXc4Rm9GKzhaUWJQcjZ4?=
 =?utf-8?B?TGZ3RmRqbWZBV3lFcngxUC93a0NIbThabDB6cFJIdmZVOW5EY3k3QnE1VkhP?=
 =?utf-8?B?c0NzNFlhUnEwNmxOeEUvN1ZqRUZZOHYwbVZjR1lleW1DVkxSTkU5a2tUREkw?=
 =?utf-8?B?NXQ5c2FKTWMvZlNFeU9Bd1hQdnUwOXR4bmhzbXVLK2hSVmNtNG96UjlnTDZQ?=
 =?utf-8?B?UHRIQ2xCTFllcEttQUhQV3FGSHovQkVtV1cvcWx3Zlp0RHp1amU3YnlsMU0z?=
 =?utf-8?B?N1d5cUZ5UG9HUXdubGZoZFVGcjljVVA2UEQ3VTl4N1dBRHRaMy9rdUJJVThQ?=
 =?utf-8?B?a0w4c1hPOGM5dXlqUlYrOEcyQzNUN3NFRWRKY0gzeURTcTZ0MjZzS0NUMTdX?=
 =?utf-8?B?WURoRFNkWnpuQkZhVCtHcDJWMis1TTNCcnlrb0JXbGJQRzRNZkN5REdFOEV0?=
 =?utf-8?B?QmI2NGpQdEpwd3NXVTZORW53aW5RRW5RVjFKSzZoS2YxQVMxTlBlWEpzQlRD?=
 =?utf-8?B?amxFMVREUHRlaVpIS0FLaG12c0RLc3VERjlDZ0dxcXhqM1ArZVUrMktHVlhB?=
 =?utf-8?B?empCQkpWbFRpdzUweW9HczJuQk0yWjg5dFNUdkJtZDhoaWNNSVlpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27daa21d-1d58-435f-6d95-08de599d6b79
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2026 10:02:58.0783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jDW2GCnBmE+Fu7y0cZ2ng9IjOLGQix6bpFK3dgqaLNSjYv5qkcRkMGxuRkcl4RrsWyS6xCtoS4oC+Z1z5pzIog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9180
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

SGksDQoNClN1cmUgU3R1YXJ0LCBsZXQgbWUgYWRkIGRlc2NyaXB0aW9uIGhlcmUuDQoNClByZXZp
b3VzbHksIHRoaXMgdGVzdCBjb3VsZCBiZSBza2lwcGVkIGlmIGFub3RoZXIgdGVzdCBsb2FkZWQg
YSBjb25mbGljdGluZyBkcml2ZXIgZmlyc3QsIGR1ZSB0byB0aGUgb3JkZXIgb2YgdGVzdCBleGVj
dXRpb24uIA0KVGhpcyBwcmV2ZW50ZWQgcHJvcGVyIHRlc3Rpbmcgb2YgZm9yY2VfcHJvYmU9LiBX
aXRoIHRoaXMgY2hhbmdlLCBpbnN0ZWFkIG9mIHNraXBwaW5nLCB0aGUgdGVzdCBub3cgZXhwbGlj
aXRseSB1bmxvYWRzIA0KYW55IHVud2FudGVkIGRyaXZlcnMgdXNpbmcgaWd0X2ludGVsX2RyaXZl
cl91bmxvYWQodW53YW50ZWRfZHJpdmVyc1tpXSkgYmVmb3JlIGNhbGxpbmcgbG9hZF9hbmRfY2hl
Y2tfeGUoImZvcmNlX3Byb2JlPSIpLiANClRoaXMgZW5zdXJlcyB0aGUgZW52aXJvbm1lbnQgaXMg
Y2xlYW5lZCB1cCBhbmQgdGhlIFhlIGRyaXZlciBpcyByZWxpYWJseSBsb2FkZWQgYW5kIHRlc3Rl
ZCBhcyBpbnRlbmRlZC4NCg0KQEtvbmllY3pueSwgS2FtaWwsIENvdWxkIHlvdSBwbGVhc2UgaGVs
cCBhZGRpbmcgdGhpcyBkZXNjcmlwdGlvbj8NCg0KUmVnYXJkcw0KTmlzaGl0DQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJz
QGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgSmFudWFyeSAyMiwgMjAyNiAxMjozNSBBTQ0K
VG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFybWEsIE5pc2hpdCA8bmlzaGl0
LnNoYXJtYUBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0cy9pbnRl
bC94ZV9tb2R1bGVfbG9hZDogQWRkIGRyaXZlciB1bmxvYWQgYmVmb3JlIGZvcmNlLXByb2JlDQoN
Ck9uIFdlZCwgMjAyNi0wMS0yMSBhdCAwNDo1MCArMDAwMCwgbmlzaGl0LnNoYXJtYUBpbnRlbC5j
b20gd3JvdGU6DQo+IEZyb206IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29t
Pg0KPiANCj4gUHJldmlvdXNseSwgYSBza2lwIGNvbmRpdGlvbiBwcmV2ZW50ZWQgdGhlIElHVCB0
ZXN0IGZyb20gZXhlY3V0aW5nIGlmIA0KPiBjZXJ0YWluIGRyaXZlcnMgd2VyZSBwcmVzZW50LiBU
aGlzIGNoYW5nZSByZW1vdmVzIHRoZSBza2lwIGxvZ2ljIGFuZA0KDQpJJ2QgcmV3b3JkIHRoaXMg
c2xpZ2h0bHkgdG8gc2F5IHRoYXQgaW4gdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRoaXMg
dGVzdCB3aWxsIHNraXAgYmFzZWQgb24gdGhlIG9yZGVyIG9mIGV4ZWN1dGlvbiBvZiBvdGhlciB0
ZXN0cyAtIGlmIGFub3RoZXIgdGVzdCBsb2FkcyB0aGUgZHJpdmVyIGZpcnN0LCB0aGlzIHRlc3Qg
d2lsbCBza2lwLCB3aGljaCBwcmV2ZW50cyB0ZXN0aW5nIG9mIGZvcmNlX3Byb2JlPSouDQoNCk90
aGVyd2lzZSBJIGFncmVlOg0KUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3Vt
bWVyc0BpbnRlbC5jb20+DQoNCj4gaW5zdGVhZCBleHBsaWNpdGx5IHVubG9hZHMgYW55IHVud2Fu
dGVkIGRyaXZlcnMgdXNpbmcNCj4gaWd0X2ludGVsX2RyaXZlcl91bmxvYWQodW53YW50ZWRfZHJp
dmVyc1tpXSkgYmVmb3JlIGludm9raW5nIA0KPiBsb2FkX2FuZF9jaGVja194ZSgiZm9yY2VfcHJv
YmU9KiIpLiBUaGlzIGVuc3VyZXMgdGhlIHRlc3QgcnVucyANCj4gcmVsaWFibHkgYnkgY2xlYW5p
bmcgdXAgdGhlIGVudmlyb25tZW50LCBhbGxvd2luZyB0aGUgWGUgZHJpdmVyIHRvIGJlIA0KPiBs
b2FkZWQgYW5kIHRlc3RlZCBhcyBpbnRlbmRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hp
dCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRl
bC94ZV9tb2R1bGVfbG9hZC5jIHwgMyArLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVf
bW9kdWxlX2xvYWQuYyANCj4gYi90ZXN0cy9pbnRlbC94ZV9tb2R1bGVfbG9hZC5jIGluZGV4IDZm
Y2Y0ZjgwNi4uMGM3NWM0ZWJjIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9tb2R1bGVf
bG9hZC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX21vZHVsZV9sb2FkLmMNCj4gQEAgLTEzNCw4
ICsxMzQsNyBAQCBpbnQgaWd0X21haW4oKQ0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKgaWd0X3N1
YnRlc3QoImZvcmNlLWxvYWQiKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Zm9yIChpbnQgaSA9IDA7IHVud2FudGVkX2RyaXZlcnNbaV0gIT0gTlVMTDsgaSsrKSB7DQo+IC0N
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9za2lw
X29uX2YoaWd0X2ttb2RfaXNfbG9hZGVkKHVud2FudGVkX2RyaXZlDQo+IHJzW2ldKSwNCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiJXMgaXMgYWxyZWFkeSBsb2FkZWRcbiIsIA0KPiB1bndhbnRlZF9kcml2
ZXJzW2ldKTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqBpZ3RfaW50ZWxfZHJpdmVyX3VubG9hZCh1bndhbnRlZF9kcml2ZXJzW2ldKTsNCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgbG9hZF9hbmRfY2hlY2tfeGUoImZvcmNlX3Byb2JlPSoiKTsNCg0K
