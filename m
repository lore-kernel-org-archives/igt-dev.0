Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBCAC71135
	for <igt-dev@archiver.kernel.org>; Fri, 13 Jun 2025 04:11:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89A910E3C1;
	Fri, 13 Jun 2025 04:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bpbilEd7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91CE10E3C1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jun 2025 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749787865; x=1781323865;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=pRhmCOHtuxBjuObt613bHNV9gb3n5uMDoagA4wlejv8=;
 b=bpbilEd7Z3zVhjsx/fJ9orTu8iUSoRu51lU/CHT7irpan5UdgtlL6bVg
 eChDCQFgjeP3pkX0m/RXr5Lkfb2Ug4v1um3FvW+s6S8IGkUlNc/eaPpdO
 HCplZWQrj5UZvmDMXDz2iM87nwq/h3vg4Vjk8bQdLNzEOqB5nULqhAwwg
 OV+CQDsWpYHzYQowZXqBtn/DDiG36HcXitOzQQOEdPKv07Q6zP/z5B9u4
 RxuY+PROQUpUVTJFNJ57LGc5L1D33TC9Q0kYhoElda3h9uNsP33aNjquj
 hiCAGzI0nSj5GefvFHiJM0ehPAWnV0lMCHKEIaZcOGpCwMkJeEWvEUV/X Q==;
X-CSE-ConnectionGUID: oF+8uxi0QG6NoHZF+Q7f8g==
X-CSE-MsgGUID: 7/Szm4ibS7O0mPeDxek3Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="52087869"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208,217";a="52087869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 21:11:01 -0700
X-CSE-ConnectionGUID: tjZR2KUFR4SedYstAi9sRQ==
X-CSE-MsgGUID: wHEDXwfcT7OkQ3MuLQ89XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
 d="scan'208,217";a="170896352"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 21:11:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 21:11:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 21:11:00 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 21:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdKevPdc+fE28Vx9rYtVRvS04WeSXyeSPQ7idsb5Sv1EOmWMIxbPdMy1hrqmGf0wnsWuqkaTlzG6Wf189nxLtmIi5YJjegd18usjvpfweWeFIzLXppdZeYSkeHOT8+mpbPnHAehjvoaGX4Cfvtmz/qqgab112ZXXfrrPebzgnjaYUrQ6pMOtpP9doSn3EPEEQGg7eyzV91B3U0NwJe1Q59ONFhuzdgJ0Rpbrr0WXbMqURVT4873r93GZ9UoBRhw8QJ8f/hWLMprC0ygxOIQFr8nxzw4u0lv3IQixqg0rRWdiPA8dwSw9ACoEl9NG/ZHzKt7Bm9zdG6GjU9TS595vHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6jfOo0Fn7ybIdzpxw6ioqylJJHxWgNdkR3FDfpfiO4=;
 b=hlToto6QG3QEcEIkPzVH1Jq7hrVQ6Bpe/duUSsqWSQCmU7CiPfefqUD277+RbFe5hWuWyZjWm9cFBKSoU4gbW5Va2D7M113CeDwkeT82jj9iyGIjxhJ4H7WQ+sTRxFpZPRiE/zUWaRBJH0m/0JzX+7sS5jSv84jxUKTgsAP+uDV8SETThaR+DdNeYvyAFjDPQW4rjW975rAJv6bFfeC8a3wRDCFkO48ROBCv13WlG0Hq4r1AuWcKiZkz2UElfT6g00hH5yI5oFf/r2ZsPbEx4SSiAnQjYZjHb5hvCeSKmrWymO+3X4pTDmZSg/VOqksZX6X8cyCk32JrzCl6o1keIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH0PR11MB7495.namprd11.prod.outlook.com (2603:10b6:510:289::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.30; Fri, 13 Jun 2025 04:10:25 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%5]) with mapi id 15.20.8769.025; Fri, 13 Jun 2025
 04:10:25 +0000
Content-Type: multipart/alternative;
 boundary="------------GyTu6VLTjylINydCRWlz4tzb"
Message-ID: <9b0cee58-f6c5-416c-8085-6e0b1a60e09e@intel.com>
Date: Fri, 13 Jun 2025 09:40:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_pm: Enhance vram-d3cold-threshold test to
 verify VRAM self-refresh
Content-Language: en-GB
To: <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20250527183957.4137136-1-sk.anirban@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250527183957.4137136-1-sk.anirban@intel.com>
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH0PR11MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 9473d169-31fb-4623-d1eb-08ddaa303960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MERlOENJSEZJVGd6NzhYRnRwbk9GcHBWSlRYNmVkVVlRR2xVNGFieXNZUHZ2?=
 =?utf-8?B?eGlFa0dxRHJtWW8zeVBhcGZtRkNKei9VcDEzeG1wTzdNMlRiRUVGbkNVZ1h0?=
 =?utf-8?B?VThJR1ZiYnFFZVYwYk5FazA5cUZpalVseVF2T3RtMGJwZFN6aXVoNXlGMUZB?=
 =?utf-8?B?U0FXbVU4NHl3ektDNWJQSzlzU0VRaDQ3QU1LM2pQTGRSd0hSUmJ5M2NIZVdS?=
 =?utf-8?B?QWtkclNUeGFpWXczU0dGT1B0SVBzVTRkVTV2SnE3STlSdzN1VXkycytwbDdj?=
 =?utf-8?B?d0tLV3FjWkMvTjVTMXlmZ1p1UzlQUFdsaVJhYkszNE9aRzBDMGJQczlJcU1Q?=
 =?utf-8?B?WEFUaHMybkwvdEhtODB5SGtSWW4xRGI5eFEyWWl0aTh6RkVMajEvb1VSK1Y4?=
 =?utf-8?B?c0VveWoyeSt3SUpQUTlwNkh1QmF3NDFWM1hrSWFYYWY0ZGsxdnpBS3ZhZUd6?=
 =?utf-8?B?VlRVcXFpVkU2RFRac1AyN1N2dC9pN0dabUVJVlRGcWRSQU4wNW9qWWdhREh3?=
 =?utf-8?B?UnEyd1FHVWp2SjQ3ODR0STU3ZmZiTWJtKzV6WTVzdUhXVXRSTWoyTVdEMk5o?=
 =?utf-8?B?NjZ6QVpWS296TFVNM1RmYTJqbkQ2R090aTdRR0ZDS1JyaTZFdjZJUGU5NVdl?=
 =?utf-8?B?Y0VGK25vL0F4QyswOGFZbWZ5d1VsZ1BLK1NEWkNWeEFWOXAydUlrblRqK2xW?=
 =?utf-8?B?Q1ZVOUZhTEdtZlU5Mk96OGgrUGtKUFZ5cE9BMXRQbTlRYlVqYUNjbUVuNlN6?=
 =?utf-8?B?QWp3dTRzdXkvVko0ZnFodmZsdmlqL0ZXOE9qOUFSek03Z2EyUUt2V25JeUFV?=
 =?utf-8?B?aGI1Uy9ndVp6VHU0VU5yeitYNG5tYnlVL0doYk14d3RyQ2d0ZmVIRmg1bkFW?=
 =?utf-8?B?Z01ZTUcwcVFnTXJXN1p4V1N6NlhZeXJRRE9EbWxudFZ0NjdMVEVQYWZtc2JY?=
 =?utf-8?B?NzY3Nm5GUHdkaXplck9yaE5MVGN4dDVNVDd5OVVZZzVkRFpGOWFMbUQ1ejRi?=
 =?utf-8?B?dmcvMW9TSW50aFdlalA5N3RtbTNLSEg0TksxZXJueXFhZTlrNWFZM3hvWCtT?=
 =?utf-8?B?WDhsM2xMMXBGQW5EM2dqeC95ZkFLQkhVVU5ZMjhvd1FBTHJndzhsdGN1TVVs?=
 =?utf-8?B?TUZsdjJoWnlEVlh3dG9QTFU4cWRRZVF3Y0VOaERlbUY5cGxZUThGb1Z1Zy80?=
 =?utf-8?B?QURmRXljUjRxUmJXeEVmempXc0R6YkZzY05hVVZ3S2x1UWQ1cHltSWg3STNL?=
 =?utf-8?B?NTVsb1dQL01oN21JN1RGdzFZc1BPU0RSY2l5K1hNNGluWG1QakRoRHdlS1By?=
 =?utf-8?B?cjJQRmxuejA1T09NVUZMbFNHamJaa3B1UXBBdXBueFRDTFNRSmxLTmgyajFB?=
 =?utf-8?B?V1U3TjcvSFBiTnQ0SGh2SzhEVm5NNGFmTUZ3aGN4MVNEcGd5ZS9BVkxpVVFs?=
 =?utf-8?B?OGlhdlJidkNMN0FrNjJMWk5HNHNUYXI1b2VMdHdNL1k5R2UrUVRMNFNXOGp0?=
 =?utf-8?B?dkZncW00YnppYU5xZitvL0txdUZHcmNFV1FaNExwK1dZdDdPQnllNEQ5d0h4?=
 =?utf-8?B?UEVqbWMwZlRMOFdTYXIwMm1IS1k4M3Jrd2lrTHhId2ZpZFgxQ1JOUTlvN2Iv?=
 =?utf-8?B?NDJnSGdxbGY2V0NaZXhPQU5TL29VSHZRaGE3ekJXc0Z5SDUzTmNsZHJYR1FD?=
 =?utf-8?B?bjU3Z3RKMkMvb1ZaRnM0RDhudlIvcHlET3ZJeXJvUHhjbGZTeHlhWlFKb05i?=
 =?utf-8?B?aENSRzI4Mk9Da3E3TFo2UE5iQStpdmx1K25jbTR1aHBvS3dRVXNDMnJkUDk0?=
 =?utf-8?B?M3I4WlBPZTI1VXJMaXZwendZMTl3UTF1SzNFZS90VHg5NTJVbUFqWWpKY2hz?=
 =?utf-8?B?WWN5Wjg3U2hNamdoZkFhSGxrbVRHYnd4dG13Um9sQW1iQkpScXAzc1dZZWZF?=
 =?utf-8?Q?pCdenUZKJWU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlUNmNyQ2Z6Qkg3MEZnTHlycDQzN3oxODhlWXc4NXJqdDJsOERUdnk3QnJX?=
 =?utf-8?B?ZS84dmNUNnRTeHBkNTlPK0x1RUlYNDkxL240VGVXUTN3RnBsQlpMM0o0a3R3?=
 =?utf-8?B?ZFlsaFRVVnVQODhKZHB5L3FaSDZKaDE4aCsrUDBZdElJVXVVMUlxVnJaMXpJ?=
 =?utf-8?B?aUJPYmwySjBpZG1qcHA5VGplSGJqUVZGMGNLWVN6NFk3NXU2Y3JlTEtiSCtn?=
 =?utf-8?B?OTB6K3N3SURQMGo4NGlYUm84bDVLSGpsMFV5OGtaYTJia3VaTVlCQWVPWTNp?=
 =?utf-8?B?czhFVXB4NXdwWTBvZWxiaFREeEtwQVVmWVhKck1OTDhkcjdTL0ZKaFo4QWhh?=
 =?utf-8?B?ekpwZGcrUU1xL2o0Tm5manRLUVpGbUJ0d0d1dlhWS2E2MXlxRWY5RHVSL0ZX?=
 =?utf-8?B?T01wSm9SekY5VXo4dG9kMk9wcnErekdTYzRWZjNnN2RnK3U1WjIxVjRPVXhn?=
 =?utf-8?B?OU1EbDRTOU5pcmp1cjdkUStUenk4VStnRmNyVjBiZzBCeFBERDRXeE1EQjRS?=
 =?utf-8?B?WWlOTHNYRXMrcktkbDdDY3ViZ1o0cjNLVWcwYVl6UERWS0dJdkFHVXNveTQ4?=
 =?utf-8?B?RGdMVzdJeW1qRWExOWhOcXVicmJrak84VXg0bGJaYzVBZ3pxcm1DQnduUGsr?=
 =?utf-8?B?dnNocHhXT2EzdWMrVFBBcXAzNXFPMXV6SUthNndyS0VNZVlGb1lzVmZuR2Qr?=
 =?utf-8?B?UlZ2QUUrd1R5cy9oYW1UKytISzZvTzZjVUNNblY2cGFJazBSTVAvdWx0dWYy?=
 =?utf-8?B?QU96ZERObEdHdVlWZjhEVm91cFdEbDRFTE1tU1hVUDFoalVlSUExU0dZSWtS?=
 =?utf-8?B?TU9EaCtSYTZXNVVqRjZ1RUxyM0c5S1c3SlZJeFBNS054eTRveWZQUnB3aTNY?=
 =?utf-8?B?VGczRnp2SU5UZ0dsTFhXdlUvNnRieHdLWHg3ZW5wNk1xdmg1RnIyRVJLWCtt?=
 =?utf-8?B?b1JlSDROTXdibkdOZmtLcHUzTGQxYmZ1OG5XbzBBT1dCYTYvellKUUhjaThv?=
 =?utf-8?B?WFdTK0RFSC9KZDZsRmtuNUxINEdySXJqcjB0Yk1uRUVSWkZHVyt5TnJjdEd6?=
 =?utf-8?B?OFZlK2RjRk04VGorYUxLd0d0WW5XaUZqRzNMMnloMC9SQ3RjeGluUURyZGd2?=
 =?utf-8?B?d2k5U3NpbHJsZFZkMnJVdmI3WXhGL2VMTU5wRDI2MUs0R3U4bVN6N3FWSVB4?=
 =?utf-8?B?VGYwMVEwaVFGTDJvYXM0c0UxaTNtTkUrZWY0cUUvTHVReUpGWFhrSktoVWwy?=
 =?utf-8?B?UEIzbFkvK1lBTER2aGVxUllRTE1IalpLeXNISTl1L05xd3lmQWxoTjVic3JL?=
 =?utf-8?B?L3B3U01Pa1JxRlFQNm1pckJLZVNWUGpRLy9XVEJNcGpwOXRndWxNMnQxVmh5?=
 =?utf-8?B?RTFQSG5SbVNRZnpBUGx3TjYvK05TeURva3JRYjczeHdSSlJERUNJZHV2T1U2?=
 =?utf-8?B?SHNxQ2s2YU9Ta3UxbWllVzhWN3RpMXJvTVpEKy85SGl0a0Jab05SUkNpUEJh?=
 =?utf-8?B?ZStIWGRUWFVVaTd5eXZQVU1VVm5ydTBWRW1xU24vNi9wUUxqdERyNklqdy9z?=
 =?utf-8?B?OFg4Ky9kVnhYYmVpSFRRMFZkcEJJUThoVkpHaVhDVk5jcXNRZm1mYmJGWTJP?=
 =?utf-8?B?UDJWZWY2bDFhcm1lbFpndGFkSnJkUkc1MTlpUmZZN1JJY09VVEg2andYN1Ns?=
 =?utf-8?B?K0RaRE1aVHNVOHVOV2RBaW1VUmgraHdpN243bkJtNFgvZ2VVaDRoYWd5UnJI?=
 =?utf-8?B?M2xqSC9wMTZZUXh5eWhreU0zczRaelJTZWxUQnM0S3lKMzNvdzk0QkFReHdk?=
 =?utf-8?B?bThkaFN5UjBVMmQ0Yysyd2V6dU1mRjlMdzlBM0U2bFQ1SkdwQ05tTjZ2YW5F?=
 =?utf-8?B?S1NseUhZL3BSRUZvSVFiTU5FZ2xBTmFOWkN0Vk1CNmpGL2JaUDRTVFI4VFFo?=
 =?utf-8?B?SGpIK3lVOTBjNlNyelhNa3FWaS9XSFprMFVyc0I1SVVqcFRaQndWeE51TkZz?=
 =?utf-8?B?YXYvYTc5dVlkTDRQRkZrTTI3WjZIRm5xakNKUks0YWpjdzZVSnRjSVg2RDVw?=
 =?utf-8?B?MTcrc1ZYSkF5aC8zaGdGbkVnbFpmMGozYndwMVpxa1Y4Z3RQLytkQ3NEMjU0?=
 =?utf-8?B?UE1tNWpEem42MnNJNng0YVZ2dXZZNHNQYlVLZ3QvajY5WlMrU095TUxmUU9a?=
 =?utf-8?B?NEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9473d169-31fb-4623-d1eb-08ddaa303960
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 04:10:25.8364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mT7qK/VuFQZGxu+r342iBeT0ij3RQnyLO2gdhcSKbm9+Cy4AtizNeHIv6/0JjM1lZbdU/TJb1dBR9w6vvjqZqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7495
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

--------------GyTu6VLTjylINydCRWlz4tzb
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 28-05-2025 00:09, sk.anirban@intel.com wrote:
> From: Sk Anirban<sk.anirban@intel.com>
>
> Update the vram-d3cold-threshold test to include validation of
> VRAM self-refresh functionality. It introduces checks for VRAM
> self-refresh capability and verifies the ModS residency to ensure
> accurate self-refresh behavior.
> The test now distinguishes between D3Cold and D3Hot states based on
> VRAM self-refresh capability.

You can rephase commit message to|,| Update the|vram-d3cold-threshold|test to include validatation of VRAM self-refresh (VRSR) functionality, 
by including checks for VRSR capability and ModS residency. The test now 
differentiates between D3Cold and D3Hot states based on VRAM 
self-refresh capability."

>
> Signed-off-by: Sk Anirban<sk.anirban@intel.com>
> ---
>   tests/intel/xe_pm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 6eb21d5ec..f8074a9c6 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -144,6 +144,29 @@ static void vram_d3cold_threshold_restore(int sig)
>   	close(fd);
>   }
>   
> +static uint64_t read_mods(device_t device)
> +{
> +	uint64_t mods_value;
> +	char buf[4096];
we dont need 4K buf here, 256 Bytes should be enough.
> +	int dir, ret;
> +	char *mods_ptr;
> +
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +
this extra line space is not necessary
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
> +
this extra line space is not necessary
> +	close(dir);
> +
> +	mods_ptr = strstr(buf, "Package ModS: ");
> +
extra line space not needed here.
> +	if (mods_ptr)
> +		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
> +
> +	return mods_value;
> +}
> +
>   static bool setup_d3(device_t device, enum igt_acpi_d_state state)
>   {
>   	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
> @@ -561,10 +584,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	};
>   	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
>   	uint32_t bo, placement;
> +	int vrsr_capability = 0;
> +	uint64_t mods_value = 0;
> +	char buf[4096];
we dont need 4K buf here, 8 Bytes should be enough.
> +	int dir, ret;
>   	bool active;
>   	void *map;
>   	int i;
>   
> +	dir = igt_debugfs_dir(device.fd_xe);
> +	igt_assert(dir >= 0);
> +
> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
> +	close(dir);
> +
> +	if (strstr(buf, "true"))
> +		vrsr_capability = 1;
> +
>   	igt_require(xe_has_vram(device.fd_xe));
>   
>   	placement = vram_memory(device.fd_xe, 0);
> @@ -595,10 +633,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
>   	munmap(map, SIZE);
>   	set_vram_d3cold_threshold(sysfs_fd, threshold);
>   
> +	if (vrsr_capability)
> +		mods_value = read_mods(device);
> +
>   	/* Setup D3Cold but card should be in D3hot */
>   	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
>   	sleep(1);
> -	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	if (vrsr_capability) {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
> +		mods_value = read_mods(device) - mods_value;
> +		igt_assert_f(mods_value > 0,
> +			     "Mods residency is inaccurate: %"PRIu64"\n", mods_value);
> +	} else {
> +		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
> +	}
> +
>   	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
>   	gem_close(device.fd_xe, bo);
>   
--------------GyTu6VLTjylINydCRWlz4tzb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 28-05-2025 00:09,
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:sk.anirban@intel=
.com">sk.anirban@intel.com</a> wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Sk Anirban <a class=3D"m=
oz-txt-link-rfc2396E" href=3D"mailto:sk.anirban@intel.com">&lt;sk.anirban@i=
ntel.com&gt;</a>

Update the vram-d3cold-threshold test to include validation of
VRAM self-refresh functionality. It introduces checks for VRAM
self-refresh capability and verifies the ModS residency to ensure
accurate self-refresh behavior.
The test now distinguishes between D3Cold and D3Hot states based on
VRAM self-refresh capability.</pre>
    </blockquote>
    <pre wrap=3D"" class=3D"moz-quote-pre"><span style=3D"color: rgb(66, 66=
, 66); font-family: &quot;Segoe Sans&quot;, &quot;Segoe UI&quot;, &quot;Seg=
oe UI Web (West European)&quot;, -apple-system, BlinkMacSystemFont, Roboto,=
 &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: normal; background-color: rgb(250, 250, 250); text=
-decoration-thickness: initial; text-decoration-style: initial; text-decora=
tion-color: initial; display: inline !important; float: none;">You can reph=
ase commit message to<code>,</code>

Update the<span>&nbsp;</span></span><code style=3D"color: rgb(66, 66, 66); =
font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; backgrou=
nd-color: rgb(250, 250, 250); text-decoration-thickness: initial; text-deco=
ration-style: initial; text-decoration-color: initial;">vram-d3cold-thresho=
ld</code><span style=3D"color: rgb(66, 66, 66); font-family: &quot;Segoe Sa=
ns&quot;, &quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, -=
apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-=
serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orpha=
ns: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; b=
ackground-color: rgb(250, 250, 250); text-decoration-thickness: initial; te=
xt-decoration-style: initial; text-decoration-color: initial; display: inli=
ne !important; float: none;"><span>&nbsp;</span>test to include validatatio=
n of
VRAM self-refresh (VRSR) functionality, by including checks for VRSR capabi=
lity and ModS residency.
The test now differentiates between D3Cold and D3Hot states based on VRAM s=
elf-refresh capability.&quot;</span></pre>
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Sk Anirban <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto=
:sk.anirban@intel.com">&lt;sk.anirban@intel.com&gt;</a>
---
 tests/intel/xe_pm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6eb21d5ec..f8074a9c6 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -144,6 +144,29 @@ static void vram_d3cold_threshold_restore(int sig)
 	close(fd);
 }
=20
+static uint64_t read_mods(device_t device)
+{
+	uint64_t mods_value;
+	char buf[4096];</pre>
    </blockquote>
    we dont need 4K buf here, 256 Bytes should be enough.
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	int dir, ret;
+	char *mods_ptr;
+
+	dir =3D igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir &gt;=3D 0);
+</pre>
    </blockquote>
    this extra line space is not necessary
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	ret =3D igt_debugfs_simple_read(dir, &quot;gtidle/dgfx_pkg_residencies&qu=
ot;, buf, sizeof(buf));
+	igt_assert_f(ret &gt;=3D 0, &quot;Debugfs dgfx_pkg_residencies is not pre=
sent.\n&quot;);
+</pre>
    </blockquote>
    this extra line space is not necessary
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	close(dir);
+
+	mods_ptr =3D strstr(buf, &quot;Package ModS: &quot;);
+</pre>
    </blockquote>
    extra line space not needed here.
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	if (mods_ptr)
+		sscanf(mods_ptr, &quot;Package ModS: %&quot;PRIu64&quot;\n&quot;, &amp;m=
ods_value);
+
+	return mods_value;
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
@@ -561,10 +584,25 @@ static void test_vram_d3cold_threshold(device_t devic=
e, int sysfs_fd)
 	};
 	uint64_t vram_used_mb =3D 0, vram_total_mb =3D 0, threshold;
 	uint32_t bo, placement;
+	int vrsr_capability =3D 0;
+	uint64_t mods_value =3D 0;
+	char buf[4096];</pre>
    </blockquote>
    we dont need 4K buf here, 8 Bytes should be enough.
    <blockquote type=3D"cite" cite=3D"mid:20250527183957.4137136-1-sk.anirb=
an@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
+	int dir, ret;
 	bool active;
 	void *map;
 	int i;
=20
+	dir =3D igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir &gt;=3D 0);
+
+	ret =3D igt_debugfs_simple_read(dir, &quot;vrsr_capable&quot;,
+				      buf, sizeof(buf));
+	igt_assert_f(ret &gt;=3D 0, &quot;Debugfs vrsr_capable is not present.\n&=
quot;);
+	close(dir);
+
+	if (strstr(buf, &quot;true&quot;))
+		vrsr_capability =3D 1;
+
 	igt_require(xe_has_vram(device.fd_xe));
=20
 	placement =3D vram_memory(device.fd_xe, 0);
@@ -595,10 +633,21 @@ static void test_vram_d3cold_threshold(device_t devic=
e, int sysfs_fd)
 	munmap(map, SIZE);
 	set_vram_d3cold_threshold(sysfs_fd, threshold);
=20
+	if (vrsr_capability)
+		mods_value =3D read_mods(device);
+
 	/* Setup D3Cold but card should be in D3hot */
 	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
 	sleep(1);
-	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	if (vrsr_capability) {
+		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
+		mods_value =3D read_mods(device) - mods_value;
+		igt_assert_f(mods_value &gt; 0,
+			     &quot;Mods residency is inaccurate: %&quot;PRIu64&quot;\n&quot;, m=
ods_value);
+	} else {
+		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	}
+
 	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) =3D=3D IGT_ACPI_=
D0);
 	gem_close(device.fd_xe, bo);
=20
</pre>
    </blockquote>
  </body>
</html>

--------------GyTu6VLTjylINydCRWlz4tzb--
