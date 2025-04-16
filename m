Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1E3C369BD
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 12:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF15610E8EC;
	Wed, 16 Apr 2025 12:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKGWFzb/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5E110E8EC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 12:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744807462; x=1776343462;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AOCBxRSQ09+wlrsH+WriTEkwolGP2CfIVS33XOgvahQ=;
 b=JKGWFzb/QMmgc5AFnnYynYOGKjJ5T/ivc3s70F5A3Q3ttToD8kn4MnlY
 f0zxvVOhFj0nO6u93TU5pmRotm10rX+RgdpoYYNcvN575vDZsHiRCJ+Ka
 qYreWn3JO+svfGKEySGdEtBi41+1nv82j/lXIiuiZgsX4TY57w7nj8CZC
 9Y5ZhoqLfyQhnoemawIwuinQCSP3lx3wYLNcizaUZGGR0azDwz3T/rxCq
 dnMcEE9OOmS3G8QRj6aqNcua7RQkjPdWIpA73fOce+UOzSZMQpeevHlct
 HWZ7/RLitZ8boyybrj933lnEgHuckaNFe2rxWJE+hBdbD3VVhqG2AypxQ g==;
X-CSE-ConnectionGUID: uLOieo4DTxCu1wjukoljiA==
X-CSE-MsgGUID: 2gjD17uXQ12ZVQGO2/BRyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46515132"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46515132"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 05:44:22 -0700
X-CSE-ConnectionGUID: ckBXVntvQHeKTssYX7rlJw==
X-CSE-MsgGUID: 2fVoIU+yTdif6+A6TS30Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130988710"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 05:44:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 05:44:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 05:44:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 05:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrNgqjpMxs5dYCQWIVAx+LkuN8lkpV3jcNTMoBGqWPa+t/FyBWqvo8Yjd4cvCM3/Igcb2CqL2woPoX8nkeCZNrEzirnow0MeUO1WGq/kvujnA8HUsvQXuMr5IwLh2itj7ExDF67iN2Ra2y3v3R8SDG9NDDztIsac4GJwZ1R97GLb/44uc+y6wdNwLbVkS0H5iYpuXDysNaGX8+BeHYmUlmHTcH8nUqLWqnlETXlOnFXk2WDdUM+L7IaJHqwOttns9nsIBA1xZ19FkPyI8jFm9Z0K6h9y5OTdbJfRwSKWWcQ1jawzxQ01gtJwkwVnYOoR8+HB9CScjuYlnva906KoyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zW0xyYgAs0mbQm5MvM4wlEkJ6v9O7Rg2qOLLRqPBuS4=;
 b=mqk+SgJ1MYmo/Gf/5Km9ze1EIwSFKuime0wfgMEqNnmL3Xm3deH8lllbQVp7ZPUCrG3IcYFoTKUAVpmzmO9FQZTELZNnwaGaGvhAkBgCC5Ljr2yqhE2zgOKTmAdMmvBZ531rriV/YFxeozc9XncQF16/CX6wmKMgOr03JuYrY6LAcO5e5OERrK/0KGwVkyH1J/OhViY0gOBdOXlhpv4eTZGeuv+BZvz5K/BmuZJ1kIJolYb4zZbYLVOgX0VUjl9dHGnqtk5txu1twYDeF7tNmNkJuNmy+v2gzmwxTBAAkW+5QAP/iUPc67vDjYAKXN92X4ObgOf+hrU6798BsjKh5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 12:44:05 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 12:44:05 +0000
Message-ID: <72f2853d-e245-4651-a4e2-9952eb99690c@intel.com>
Date: Wed, 16 Apr 2025 18:13:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] tests/kms_async_flips: Split subtest to
 handle linear buffers separately
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
 <20250415155136.2879045-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250415155136.2879045-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::13) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: a36b870e-451e-4865-ebc1-08dd7ce45f2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RW82Wm9kY3ljdGlVV0luMUJpRHZVUE0vZWVVSC9CNzI4ZFlqcWs0YkxWODl4?=
 =?utf-8?B?Mzk1cHZOKzV5ajl3NFkzeWdYeDNVbU1WZVM5ZDlLY0tmb0ExTkJMS2ZiN29J?=
 =?utf-8?B?KzFxZE5GZlp1OEowNjh0dVRiV1FVZHpPOUVGc2IxSi9CR0JER0kvZjlML0p6?=
 =?utf-8?B?UFZrVkxOQ09OYXVQNEo4TC9MalZtdHBtWlZCMWl2djJmY3k2akR0NHAvSFdw?=
 =?utf-8?B?L2lSWFRydjE1MkkzYnRWV3NzTlRYTW5DbCttNEhReXpxb3RHWjJyY3RMSkp5?=
 =?utf-8?B?MjVUaTc4OUJqaTVhWHhmcS9XbHpZMFhqWGt4NjBKN0g3YTl1U1FiYXdqR0k5?=
 =?utf-8?B?eEZmNkVremNNUVpQSjVuNzBhWllHRURzNDFYdjA2bGlQa0Jtd2RPUGtESDBu?=
 =?utf-8?B?ek8vcTFuWGJYZFd3ZmovUWRnQU9Oa2xEMUREcHJSRHVjQ2VON3VGdm5nNFF3?=
 =?utf-8?B?V3c5dDFNVk1ISDhYa2NJenVWV2ZuTmxDUkFMQTl4N2xnUXE3cElqWWdvVHl3?=
 =?utf-8?B?cSs0MjB2TTVxQ1B0WWJNKzZZTWIxaDJWRXgxS3F5Ulk1ZTdXNHBoaVpha1I5?=
 =?utf-8?B?a2tpQmhIaUdadVBNQXZPMWJyaG5Cb2dZWU1DQTVyRSt1dXFObm94dlE0a3FS?=
 =?utf-8?B?SW9oZFBQcFJ4dmhLMGZzVS9BSHlMZVQ3UDh0cW9vVWMyOERJdU5PenBiQVFV?=
 =?utf-8?B?VVhzbkZhQ2NWbERLMyttZnpDUSs0SGhvanVCbGh6V3JVNlNkNkxoRnpKL3pO?=
 =?utf-8?B?U0dhUEJxT2syTS9Qc3IzMkNySkwyd01qa25nM2tRdG9vNlc2a0hVVGlEZmlm?=
 =?utf-8?B?ZWZGRHMyVVJmUHh3TkpEcTRRZU16dDdPMlZFbnBncnpsSlhKemxDWVBRSFlG?=
 =?utf-8?B?bURVMEI5bHVhbnMrK1h1VTJiazBTV1lJN1lLNHEyS3JMeGZQajRScXZ1Ukox?=
 =?utf-8?B?OGlub2xEYTE4ZjNhUHA4bnhEUEdhRERIdTlXcGh3KzJuTVk3aTdTdy8xcW1r?=
 =?utf-8?B?cy94WG5jRTdMbHdtaXMwZWI5VTg4TTZTSENNQ1E1MGVTdVpUMnZxb1VoN2ZP?=
 =?utf-8?B?dDhHc1JMcEsxLzNTREZ1TEoyT3p6SXlEdzZDNCtPMnlaak85OEFySUFTc3Jy?=
 =?utf-8?B?cGl4L2wxa0tDb2dmd2J2cHJpZjNDUHkrdlNtbkl5WTRpK08zdzFiYW1UV01J?=
 =?utf-8?B?VmtxU2dZTzN4SVdOblJsS28wcHpNVU9FN0xTNFZUVUpLejVMQ2V6YW41ZnBE?=
 =?utf-8?B?aFpjWE1LeVcxaEJjeTVQMGVMWE1mRVZnMiszMjZLTWRoR0h4aXphaTZESTBS?=
 =?utf-8?B?ZHlwbHI1Y2ZxcUovMUVFOWxGZjJDWUwzQVFMNVgzejIrQUlsNFZ6UGhIbExn?=
 =?utf-8?B?Z3J6MmNTbi9qVUUxM1F2cExveVphYXN6NU4wZDdJemtVK2Z4eUk2aGticUdL?=
 =?utf-8?B?RWF0UUNkb0JYNklqVlh4aElpVHlwVUJyNmF6NEM3b3EyQ05Kd2ozRG5oMFlP?=
 =?utf-8?B?aE11dHYyYk5yRTdmbllvS2dIVktRK1ZVdjM3MFNLS09rOGpPYjMrRUpudFhY?=
 =?utf-8?B?Nm40MUc2aUcrSzZ1eWhlNXBzaHBFRkx0MWZjMC9LQW50ZnVHOVZKYXFPRjFo?=
 =?utf-8?B?ZWk5SWtLUmg5VnBkdkY0czdvY3BWWUN6NkpOV1ZsWUNGL256NnVnTEQ3VFhr?=
 =?utf-8?B?bFpra2ZnM3JiM0V2a3VHRVFyQ1YzamszTmNRbWx3N1p4V01mZkV6MG43OWdB?=
 =?utf-8?B?WFdYNmNsUk9YK0NnYWxIVFk4KzNPODBqVFRHT2UvR2NpRUlmYlVpNHRXaVNF?=
 =?utf-8?B?YUx2ckNQVmVkMEpLWVFaNysxRGJ6QU1rRUd1czNadHJFQTNxWm5kcHJyRFFV?=
 =?utf-8?B?SGRLWm1PdWMwQ0tNYjhmSVNxZVNSR2FJN2xLWmgrdHIrcDdyVytiMUpOUGds?=
 =?utf-8?Q?8npPYOctBTg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzZlVWY5WkppRUpjZTFndzVXTUhHaVlyUjdGMkJrQmd2cU4xbTVhU2ZER2d6?=
 =?utf-8?B?cDhHUkhaRnN0SWZucnBnSG1WSlhkdTR3bm5KTzRoNzYzR0c5MXVSVWg0dXBQ?=
 =?utf-8?B?MTU5SUQvUkxZa0dHQ2xncGlpR01qK3IzcTh5d2NLaVAzUW5MbWdQVG1VM2U4?=
 =?utf-8?B?bjM0dEpuRGVEMVlyVGpnaEZXVUc2RDZxNnBId0VKaHN3dXQ1Y3JzRmdzYnZV?=
 =?utf-8?B?UENlTXN6eCtBZTJ2dTBudUJ3RytTR05WQWpHQUxXeVI2Tm44Z1RkMitqL1R1?=
 =?utf-8?B?Mk9OU3dkYlBDMWJCNlFiT2dTa3dPM3hXa3huSTYxQm1OZlAxZGdTOXBjSWw2?=
 =?utf-8?B?OEthOXVvdUd5T0gyYUYzYTZkakhaTTI1QnJUa002U25oenJWdTBnOGlUTXV5?=
 =?utf-8?B?L2hreExBNVplNGNVUFJNSXA3Q0kxL2RWek9TYkNtdjJFaDRSZkdWYS9UYUEy?=
 =?utf-8?B?RW1mUUhkYXN2dGlYSlJBTmVQazVTOTJKdk40YkRiL3ZNQ2Myck5MMU0wcDJH?=
 =?utf-8?B?V0FXaytwSWhHcE1pSlZtR20za0ZJQm05U1NDSEtGRFRWSFd1MGhibmMwbWds?=
 =?utf-8?B?WUpsTnFWYTlKM0pJdnRvMi9TdHROamFNSmtQTXVqWVJacGdUdVFZcW5md3Zi?=
 =?utf-8?B?d3pWR2xtRDA2VTZCbUdick1pV1JkSnoyK25Mbk03YzRHTFlhb1NheDhEMmly?=
 =?utf-8?B?M0RwcUEzNnNRemFTekZnZTNwS3RjK0hXNzR2N0tDQk9iUWlqVmQ1WUxGT2hZ?=
 =?utf-8?B?aFVrTmY4NTNqcEJNdHRHdkhhdTZFdVRYTmZ0dm1VODdPVTdIeVQzdTBEalB6?=
 =?utf-8?B?NStsektHSFh5TjRUbGQ5M2d5ajgxOXk2VWpqaHJNbGZwUUlnSG82M0NXeFpx?=
 =?utf-8?B?TXREZC9QRTB2eTFNbmdoQzZxOFAvODZkMnlXUGJSQjRQMVBXMzYrV0tPaUFT?=
 =?utf-8?B?S0p5Zm9DQndVbmllRVBEQkdFbmliYkptMWVnRVFTRXcvcHpYTm8zYkhqSyt5?=
 =?utf-8?B?SUQ1RnpneGcvdUE0RWpsVVRnK2VyT3F6ekJwYllrQUl0WXlxdjFkWXgrcy80?=
 =?utf-8?B?ZnhlQXJFY3FXSHZkamFiWjBjT3dDYnFCZGxtY000bkpEYXdRVkQ4WTZIWEdk?=
 =?utf-8?B?Yjhub2xwSDk5dnNHZUV0NWxQQXRrNUFKNWhaMVRzazZGV0gvODExYVA0OE9G?=
 =?utf-8?B?Z2dFTHZCaXNXVitBUk80dkFrZ21JbENBa3NuSVIyNzFkQVBiTjhHZ3g2ZTR1?=
 =?utf-8?B?Z3BjWE1xWkZEeEEvT0ZVa0ZGeXVhYjdvRUdBakQ3K1FDUmV1OWM5T1RnUUZj?=
 =?utf-8?B?SzlCTVRsbXIvcDhLdkZrTVZBTUFTY1BRS2hmcVlFNlRRVDYrT0VyZ05zL2xm?=
 =?utf-8?B?M0JyeGFvalVESkxDdEgwU0s2SXY4L1RDQ3VsNVpFeUorOWh0dFFNZmxaY2tO?=
 =?utf-8?B?M3B6MDZjSnduVUUxYXRiaDVGWE1mZnNta0dNVndHZENUU3lRRlM3dFdEcDBC?=
 =?utf-8?B?ajM5S1JzVmFOTitQakhXZS9vS3ZwdHk2SzBpcytjY2NEbk5JZUtUU2JiN0tB?=
 =?utf-8?B?amFWYUxiNmZ0MEFzc1ZqbkhEYkxMc2FGME1tbDhnMnE2d2d1OW9uTW1mS2dP?=
 =?utf-8?B?OUVJRGRjOFJvSThkQVdhTmlONXR4b08yai9YN2NoekNDSWpydURoNWpUWFhZ?=
 =?utf-8?B?WGRGUmM1R1FPckJYOEQwb1BWNGZDZFF0dDlrVXNOdTNnNTZTdTVTRExrVCsw?=
 =?utf-8?B?a09hSlA0c1puRGZseURieXh0R0dKTFZqSjZ6YXNzb0Y5S0pHUk80WWpaTXdI?=
 =?utf-8?B?WDF4TTI5Zk0ydlB5RmpXY0ZmaHBKa2JnbmpzcXNZNEZkaVRyRVd0bWFkMVpF?=
 =?utf-8?B?YWIrbXRTU1YxWThiTVBqTksxQVVYN2pQa0NiUFJweExSUVNUMGlOYjZjUFFN?=
 =?utf-8?B?cU15QUlkSmhmTjFFcHczZklhb0E5M2xvUWVBY0pMdWs0ZXZud2FMbkR6OFJa?=
 =?utf-8?B?b2VPVVE4ajN5MkpkUzRYQjJ2NDNuOGNaZnJZYVhBdzRxeWlUVUpvL2ovcTNm?=
 =?utf-8?B?TFUvWHhqZ0d1eXVVN0JmN3U0VmRLQjlmcUlyNmF1VU5mRmw2TXNGMEVBbThp?=
 =?utf-8?Q?/DMW8MaVlB3CB8YWryZ3yA0qB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a36b870e-451e-4865-ebc1-08dd7ce45f2f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 12:44:05.1475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VMzRLnmmyrUgMya+vKIRdGn87y5dzro/crtbgg6EE7tZFJ9S6nN9kFD9JfVOvwiWYFYDLOESkDv7/fH5V93x4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

Hi Santhosh,

On 4/15/2025 9:21 PM, Santhosh Reddy Guddati wrote:
> As linear buffers are considered corner cases, split the existing subtests
> run_with_modifiers to handle as a separate subtest.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_async_flips.c | 41 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 031417ed8..df3e136b7 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -88,6 +88,14 @@
>    *
>    * SUBTEST: overlay-atomic
>    * Description: Verify overlay planes with async flips in atomic API
> + *
> + * SUBTEST: async-flip-with-page-flip-events-linear
> + * Description: Verify the async flip functionality and the fps during async flips
> + *		with linear modifier
> + *
> + * SUBTEST: async-flip-with-page-flip-events-atomic-linear
> + * Description: Verify the async flip functionality and the fps during async flips
> + *		with linear modifier in Atomic API
>    */
Please rename the existing test to '-tiled'.
>   
>   #define CURSOR_POS 128
> @@ -128,6 +136,7 @@ typedef struct {
>   	struct buf_ops *bops;
>   	bool atomic_path;
>   	bool overlay_path;
> +	bool linear_modifier;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -266,6 +275,7 @@ static void test_init_ops(data_t *data)
>   	data->alternate_sync_async = false;
>   	data->atomic_path = false;
>   	data->overlay_path = false;
> +	data->linear_modifier = false;
>   }
>   
>   static void test_init_fbs(data_t *data)
> @@ -792,15 +802,23 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   		test_init(data);
>   
>   		for (int i = 0; i < data->plane->format_mod_count; i++) {
> +			uint64_t modifier = data->plane->modifiers[i];
> +
>   			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
>   				continue;
>   
> +			if (data->linear_modifier && modifier != DRM_FORMAT_MOD_LINEAR)
> +				continue;
> +
> +			if (!data->linear_modifier && modifier == DRM_FORMAT_MOD_LINEAR)
> +				continue;
> +
>   			data->allow_fail = true;
> -			data->modifier = data->plane->modifiers[i];
> +			data->modifier = modifier;
>   
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
> -				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_fb_modifier_name(modifier)) {
>   				      /*
>   				       * FIXME: joiner+async flip is busted currently in KMD.
>   				       * Remove this check once the issues are fixed in KMD.
> @@ -863,6 +881,25 @@ igt_main
>   				run_test(&data, test_async_flip);
>   		}
>   
> +		igt_describe("Wait for page flip events in between successive asynchronous "
> +			     "flips with linear modifiers");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
> +			test_init_ops(&data);
> +			data.linear_modifier = true;
> +			igt_require(is_intel_device(data.drm_fd));
> +			run_test_with_modifiers(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive asynchronous "
> +			     "flips using atomic path with linear modifiers");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic-linear") {
> +			test_init_ops(&data);
> +			data.atomic_path = true;
> +			data.linear_modifier = true;
> +			igt_require(is_intel_device(data.drm_fd));

This would always skip on non-intel platforms? Is that the intention as 
linear should be supported on all?

I think can reverse this and we can make tiled subtest intel specific as 
even now we call run_test which eventually will have linear modifier itself?

Regards,
Karthik.B.S
> +			run_test_with_modifiers(&data, test_async_flip);
> +		}
> +
>   		igt_describe("Alternate between sync and async flips");
>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>   			test_init_ops(&data);
