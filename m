Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF19D0BB63
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 06:37:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C7110E8B7;
	Thu, 24 Oct 2024 06:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W3IWeTsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D4A10E8B7
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 06:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729751865; x=1761287865;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CAlN7SA2ESMCFjhzo2FqZIuAEZbtFwEpksH3qbtzBgs=;
 b=W3IWeTsKSBhaCYgQ9TYZ+VDuBe0cQtf3Yyzty+071XwazQUuaUJb5qJs
 lDDKIj1oi7rbjfg70yA9R0iRqmbGQRfg9h9AogzV0biIPvbhrdjjm3fRI
 cvp1usvxvZhrsARzvTX9Ps8+yUmvBFW0aEYgkPFLXQgGyTImpCF961W6x
 +ibsyaWzdKTzV4DVN0BQOCqQVD81bUfMlnNmfEBdSX0l2ohDsd5VD4k+d
 qQsjX6QRIm8EDtsQm0m3SY6qYjieEf/WNIaIrc2gF4Job34HXoQjsriY/
 1B40Zq6NMAyEfotlvX6qsNtDPP+AfPVcUA9fQhFu8UckCcRfgZEHYAp3L Q==;
X-CSE-ConnectionGUID: SCv82FQWTRmmB4sa1D/WKA==
X-CSE-MsgGUID: 9eocQfsRS1iU12QYETNNog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51907514"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51907514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 23:37:45 -0700
X-CSE-ConnectionGUID: nvJV0TY7RnCV9Fzc5MjLww==
X-CSE-MsgGUID: 7UYfelX6SHyynAwUX/JvbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80501847"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 23:37:43 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 23:37:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 23:37:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 23:37:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqKkrbGnc9Wtq2oD3O6onrU7lpaH8TwuSXVzNiC3F+eQF+/wlojsMONp1bmyBH0yep58gIEERUF0bPyKeVUYYAHrVLdNAqcnq0cAJmYXgKkfaa/XGcmPrWuH0F6EWSYQPupQzzGgzgCOTF7tpPQrZrODv1beRTiqpkgAiyWLXxLSMnBlFloW2A7ejBtglfBbcUxRNwVoOyJxQR8a2iZvR2x7GY7y2BP2gOpoCrkyJTpJBNniELw8wLaOgpmzy9tHRQ9NmqywBxyClW2nSIwktt6C9itziNdxYak1IMqIMKrPy7A1kYnDi4wVsk0mQofI/z9gHML4FkEo4Jd7VWosUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh3xOHHRZlECBF2k3x+bq5GW/U54ooyP+R8Rj3NOZps=;
 b=mlcHPma4WV0IIIaGrXTVkZ8NQ7CKgI6yFxzosEHaisHI1Ycwc8qt4si3RCKE6LxXJ9GdDD9GPSCdU18ZjHJ+CfO7BJ1/ZWDe6oywHfrYnbLTCaBSq71tjZNwGT7J5dA7mSwrpPN5ah2C1dMRltLeTZEVfNQv9Y4EvfiJlaJoC9EpIniGFwbImz4oZhruDCEqxr6FJMcqId/wQZMv5VzvkMatEMjea623CpSMMrpGS73mppHbA3Px2Ectg79nZiK7sZZfze/RTAFPV7MmO5NHTBLmhrZTpc+l+J0FC7f/uyCWzEP0GNCtaBAYyGUdXY5e58BKETgjNlXh+08VXOiLhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4811.namprd11.prod.outlook.com (2603:10b6:806:11d::17)
 by CY8PR11MB7825.namprd11.prod.outlook.com (2603:10b6:930:71::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.29; Thu, 24 Oct
 2024 06:37:36 +0000
Received: from SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4]) by SA2PR11MB4811.namprd11.prod.outlook.com
 ([fe80::e790:74e2:d7b6:9fe4%6]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 06:37:36 +0000
Message-ID: <b5e50109-061f-42b7-b2e8-fe8f93923a73@intel.com>
Date: Thu, 24 Oct 2024 12:07:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/3] tests/kms_hdr: Test brightness manipulation
 in HDR mode
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <bhanuprakash.modem@intel.com>, <suraj.kandpal@intel.com>,
 <pranay.samala@intel.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
 <20241024045212.1697869-4-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20241024045212.1697869-4-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To SA2PR11MB4811.namprd11.prod.outlook.com
 (2603:10b6:806:11d::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4811:EE_|CY8PR11MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 0248bf8d-74c7-486c-a527-08dcf3f658cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTBuTFE0MWNVQm9ycTBYNGpjdUUyM3NnNXdnVngvazRtYlhTZTN0bE9ZaVpW?=
 =?utf-8?B?enhaSG5odmV5cGJERVo2aWJZSVA3N2t2Y3pEeEg4Sk5wS1cwbFJyZHhFNDF0?=
 =?utf-8?B?SXdKSGJSajlJNTJsQjFyQ0xsQ2k2TmlHdHdBdEhkSFQzUktjdTl3UStXYTZa?=
 =?utf-8?B?SlpUZms3M0dtT3ZWNExBTkZsS210MjFIMklvdE1XdDQ2ZkVOUmRuNkRxNUN2?=
 =?utf-8?B?MHI5bmI0L1ExUmd1VHFSL2NzSlFRVUQ0dXVYUXArQXFFTVluQXc4Z2lGYmJv?=
 =?utf-8?B?SkUrTVdLN29XRllmWWZYRGVYRldCUFRmUHlIYkdrUmVDTVhqc0VDbVhINEVD?=
 =?utf-8?B?RllFekxwVU9sN0F0WlhnUUlJbUFUeVluMGsxbXFTM0FiQnZUc28zRnYvYkhp?=
 =?utf-8?B?NzBXVytDb0JKNmtyaC9nUjVYYm5hSVJMK3prd2NpZlZkKzIvdHpKcXpZRVBE?=
 =?utf-8?B?SGtvMzJKUmYySERRN3U0OWdMc21LOU9VUm9IN1czR01XNVlyMktxSklVVkZV?=
 =?utf-8?B?S3F3N3I2UTBGRnN5TncyOFd0SDdHVGlpUFVHZjJFVlcwVDR2d2tQTmZIbmUw?=
 =?utf-8?B?T1dOM3k5eG9uNktVeUxpVXY4dWZ6RzhiZjhwS2RyRVZmaWZCWFlVSXpIb2gx?=
 =?utf-8?B?bU9oYkNSOUZXUmEzK1U1cm41KzJFV3FSZFhlNmRvZ0JLYXIySTM4Q0JPV1BZ?=
 =?utf-8?B?bTgvMUR4TnNvbVVCT05KSUJibXM4b3Zsd01nNjV0QTFOTjN0MG8vb1ovL3dj?=
 =?utf-8?B?dTBoY3hBVDNGellFTHlEY0hMN2xXS3pOaFQxOWNLSzJ4SlBsNUxGelFrOGFh?=
 =?utf-8?B?MXpRSmJ5T3pMRmNnMm9LRXpLQWlhd2Y3MVJ5dUYxQ2E3ZUR4ZkM0UTNEQ3BG?=
 =?utf-8?B?WUtuVlR1bkZCbE5CNzhpc3dUenNaSmN6d29hUVVJUWJSbkc1bWdwcUQ5K3gx?=
 =?utf-8?B?VTBUMklaNUN6V0ZQZkdRNTZ2WjI1YzFqVmZ3R3l3ZWdHNzFQcjV5MHl2UnUx?=
 =?utf-8?B?dWY0enZnek5aanM5Q2FPcjlnT0YwVnpQK24xbmc1QjRGWm9qamU3QzFYRjc0?=
 =?utf-8?B?RDNQZFpNSEhiSEdCcTc0OUZLSzl3cVZycnI2aFY5VlNJcjRyLzk2eGcvdS9H?=
 =?utf-8?B?Q2dOZkNpMnByYkJna0J3d0MyUXVuRlMzWURtOXhraUltOFVPN3RXMndGRWp0?=
 =?utf-8?B?UnpOcVRrUThoZDBuTmo2ZlRldFZxUFVOVXZTOXluamVFcmFEd3QvSlNVMlVt?=
 =?utf-8?B?SUFoVHpZZDdLMEZjMlhzdXVhRnJ1dmJZS0hFZitLUVJ2c0MrbUJXTlVEa2k0?=
 =?utf-8?B?SVhRZFRZT3FVS3RTa1BydUlPbE5sWU1KYkd4OUw0NTdIS0xrL1pqMVR1MHRR?=
 =?utf-8?B?RnA3dVpyd3FmcmZWeXBzU3lpcElOY25UM2VNY2pMWENERjdVVHZFZDZ2TTBk?=
 =?utf-8?B?ODI1aEtDaU9ZckxTb3RXOXpFSTNwZ0hBSjBEYkhialVyK3hEWVhYUGo1cHZM?=
 =?utf-8?B?TGM4a1V0MWdiRDE5dzk2bE9GZDhDclp1Z3lFM25QamdpQWxBbXQ1VDU0Mytu?=
 =?utf-8?B?RWV4Z0xXS3AvbERJTzN0L1F3dys4NDJNSkF2ZHdENFZWWmhlWEVzR05TVkVu?=
 =?utf-8?B?TTgwbmJuVEFWMEtkWk03TXlvRmNRNmsxcVdnSUVUUUxlcFBwekY4bDZ1a09u?=
 =?utf-8?B?QTVZMUl4OGY5ODBRZ2hacndyM2VhSnd3S1gxWVBZV3JoTWUzYlE4U0lEY2FE?=
 =?utf-8?Q?Ca3sA0hHaukmWT6VV12G8OaCb6tRy7NN9oxKOCf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4811.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tjh5R3JPclpmeW9NSHpkSktiRHg5SE1RMjBZOWZ0L2J4RncyRjRjeUg3bHlO?=
 =?utf-8?B?Z2N5K09hWEdQNGJXWm5yRXJlOWxxKzM5SDJBOTRaRlZ6dWhjU043dmhWS0lL?=
 =?utf-8?B?a2pDajNUT0ZZNklkRkk1U0tROTJTclBEekt4b3JuaUlUNlVzU3E1UkRnWEV4?=
 =?utf-8?B?R1lMamE0Z3dmMmFGV0pzTlBXV0FKazdvOUs1b3krSFRQVmUrdWdIa1ZhSWFa?=
 =?utf-8?B?ZlMxM3ZpaXU4QmVSMTkrbTBwWURwUFVTQWFpWjFHTUtZaDhreXhmQUhEYS9n?=
 =?utf-8?B?QzhhSUJKZ0hIMHBRQ2dkN21GeG9zbnNvaVRuOWFqSnB5MmNQZkpDYVd5ZVVW?=
 =?utf-8?B?bUdReVBveStybWpMN3p3dWFQSjVYMnVqYnJQTDNxY25sWUtrdGFCOEhLeUdP?=
 =?utf-8?B?QzVWcmJwZ1Aydjd0YTBUR0JQQW1Kb2lKR3ZqYnVGcFkzdnY2dWxnYXJsNGor?=
 =?utf-8?B?RWV0cW9JbG1sbjZuTVpFZjcwVkE1TDJoaml0MTJKV1lJOHZCSGtMNU5QTExO?=
 =?utf-8?B?ZFJZNjZRTXN2ZTVZMmRKYzBzdGNCWUYxWmdwcEFyb0FRb3hBeFJUd2J1eGxD?=
 =?utf-8?B?VFR3RE5NbUJWcDRmazFRK0I1Ynk2eUtSV3dueW5TTGFabzk5Rm1KcmhzanZ5?=
 =?utf-8?B?V1BWb1ZrRDJNRzZOMVFZV3JYV3llNlVxNWFwU1ViOVE3YkJlMlZvS29QVlpN?=
 =?utf-8?B?WHFVbVRIZjdUeElheU5XSHRFbWJtYVovajRjOHpTVWlZc1JHS3VvL1Nad1Jv?=
 =?utf-8?B?M3oxby8vc3ZPYllhMUJtd1M1UUNjVlJ4S2NEeGVSL2h1UDNBSFgyYy9iT1VS?=
 =?utf-8?B?dnVDbGxoUFFwWVJlcG5VWFN5U1IxN1kvcXNvWEh2NnVMazYvd2k4M1Y2UXVW?=
 =?utf-8?B?Nk5qRjNNUjk1NStjOW4vKzM2aGpTbXlJOXlqbU5kQWMwTzBqQ1RGczlQNU9O?=
 =?utf-8?B?dlV4RFo5SmZmcEVxakpQK2R4MC9JbHRwOWE0a3EwTy9rSW5jMndxQ0FpZkp1?=
 =?utf-8?B?SUFFaTdqVzZhZEZGQjJOVTA5cEoyVzhzL0ZJNFhtYzFxRktFTHlqWFRqWlRw?=
 =?utf-8?B?L1N2UzZQNW5wdFlrRmlYMVVmQzl0RGxoZFJiYlVUaUkzc3ZKdFdjb3h5SXg5?=
 =?utf-8?B?WjFYck13V1EzTDFoOWNGSnowMHBJV2Q3T0pkRUM1OWlZZHZiVW81WGRSQnVP?=
 =?utf-8?B?aEV2YitrRmJndVBpcGpvYWxvZSt0UjQ4dmhnREtLY2ZITzlmMGhmRVZHWkZn?=
 =?utf-8?B?aGVGNThFZmcyWG1yeWE4SDU0V0E5REFFckVZbm1JVGFjSndUTmhZamw1Tmkw?=
 =?utf-8?B?Sm42ZW1zY1I1SkdVZTUvZ3J3QWtWbG9UaHFreVo1T25SakhHRkp6bzgxNlJ3?=
 =?utf-8?B?UUY0RzBmcThPYmlvczhwMzNHNys4YUxaK3gyQUdkRUJEejdYaFF5Tjc4dVU5?=
 =?utf-8?B?ZVNTclc1bnEydUMwVW1oa1NEakwrU3RZaDBmUUtiRXh5MW0xUE9DdXJjWnpB?=
 =?utf-8?B?WlM3SDdRS2Z0SnFxcHNQS3JIa0ZpVDFHVTVHa2hJTlc0eWduQWZVblhIZlVj?=
 =?utf-8?B?VmUwNjBPMEFiTnlQRUNIcnlONG1iVUhFdmdMenZTcjBWdEo1QWtPNWNPWE41?=
 =?utf-8?B?eXdxT25FZ0xrUEpUZ0FPNkJXMnh5alU5Z3VxU0FjL1B2RWx1bHhMYnduUklF?=
 =?utf-8?B?M1JMZWUwWkd6SzZFV0w2ZVdFRExaTGovWlNxZDhBZmVOZ0U5aVRMR3R6RVND?=
 =?utf-8?B?N2pCYk03ekwzSVRoR29kU1F0azZ6QnpCbHhJSGxXaXdkRGFiTXdRRkhDaGtX?=
 =?utf-8?B?LzljMzl4UVZNS0FWdUtqSmNUMC9nUWRmWk9rOTlNR1d4S1FKT3V4aEhyLzd4?=
 =?utf-8?B?VWNYOWl5cDlYQUdXR1lwdW0rQVZGWE0raEFGaUVnVlRIQjlyc2VxN1lyMkZ3?=
 =?utf-8?B?ZlRHdjlXWHhwNGdPWHJDajdLb29XMUtmWnBrdklDamdzY0hGcjJOS3hUdFk0?=
 =?utf-8?B?a3dRQ0ExWUE3MWxZVDMzNGRNSmlybHcvV2RnQ2U5b0o2cXJaUTA4NzBMdGh5?=
 =?utf-8?B?NjQzWGVaL0piSnFCZnhRdEhRUDIwWXpLMU1RZUI0N2tUUUVDRmVEVktaYnZn?=
 =?utf-8?B?UDBFR1Y1UUxzZWFnQTJVOGtNSDgzRkppc3RDUWdhaEJ3ZmZNbHVHY2gvUkxP?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0248bf8d-74c7-486c-a527-08dcf3f658cc
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4811.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:37:35.9256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/1XoIi9Hl71ejWRpHzwH8YUsn2IDBGbicJbf3J1yYzzvt/o6102iKSkuajKgheBxf1bKwpu3JhFrTCTs9OPJjHykgzIO7AlGFgY/HihWrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7825
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


On 10/24/2024 10:22 AM, Santhosh Reddy Guddati wrote:
> Add subtests for backlight control on hdr enabled edp panels
> by changing brightness via sysfs.
>
> use igt_backlight_read and igt_backlight_write from library.
> -->Please format discription correctly.
>
> v4: improve the test description and cosmetics (Suraj).
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_hdr.c | 42 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index f123c6b36..b67902d43 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -64,6 +64,10 @@
>    * Description: Tests static toggle with suspend
>    * Functionality: colorspace, static_hdr, suspend
>    *
> + * SUBTEST: brightness-with-hdr
> + * Description: Tests brightness with HDR
> + * Functionality: colorspace, static_hdr
> + *
>    * SUBTEST: static-%s
>    * Description: Tests %arg[1].
>    * Functionality: colorspace, static_hdr
> @@ -81,6 +85,8 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>   #define HDR_STATIC_METADATA_BLOCK       0x06
>   #define USE_EXTENDED_TAG		0x07
>   
> +#define BACKLIGHT_PATH "/sys/class/backlight"
> +
>   /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
>   enum hdmi_metadata_type {
>   	HDMI_STATIC_METADATA_TYPE1 = 0,
> @@ -100,6 +106,7 @@ enum {
>   	TEST_SWAP = 1 << 3,
>   	TEST_INVALID_METADATA_SIZES = 1 << 4,
>   	TEST_INVALID_HDR = 1 << 5,
> +	TEST_BRIGHTNESS = 1 << 6,
>   };
>   
>   /* BPC connector state. */
> @@ -448,6 +455,28 @@ static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
>   	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
>   }
>   
> +static void adjust_brightness(data_t *data, uint32_t flags)
> +{
> +	igt_backlight_context_t context;
> +	int r_bright, w_bright;
> +
> +	snprintf(context.path, PATH_MAX, "intel_backlight");
> +	snprintf(context.backlight_dir_path, PATH_MAX, "%s", BACKLIGHT_PATH);
> +
> +	igt_assert(igt_backlight_read(&context.max, "max_brightness", &context) > -1);
> +	igt_assert(context.max);
> +	igt_assert(igt_backlight_read(&context.old, "brightness", &context) > -1);
> +
> +	for (w_bright = 0; w_bright <= context.max ; w_bright += 50) {
> +		igt_assert_eq(igt_backlight_write(w_bright, "brightness", &context), 0);
> +		igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_assert_eq(igt_backlight_read(&r_bright, "brightness", &context), 0);
> +		igt_assert_eq(w_bright, r_bright);
> +	}
> +
> +	igt_assert_eq(igt_backlight_write(context.old, "brightness", &context), 0);
> +}
> +
>   static void test_static_toggle(data_t *data, enum pipe pipe,
>   			       igt_output_t *output,
>   			       uint32_t flags)
> @@ -483,6 +512,12 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
>   		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""), 0);
>   		goto cleanup;
>   	}
> +
> +	if (flags & TEST_BRIGHTNESS) {
> +		igt_require_f(is_intel_device(data->fd), "Only supported on Intel devices\n");
> +		adjust_brightness(data, flags);
> +	}
> +
>   	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 10);
>   
>   	/* Verify that the CRC are equal after DPMS or suspend. */
> @@ -685,7 +720,8 @@ static void test_hdr(data_t *data, uint32_t flags)
>   
>   			igt_dynamic_f("pipe-%s-%s",
>   				      kmstest_pipe_name(pipe), output->name) {
> -				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
> +				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
> +					     TEST_INVALID_HDR | TEST_BRIGHTNESS))
>   					test_static_toggle(data, pipe, output, flags);
>   				if (flags & TEST_SWAP)
>   					test_static_swap(data, pipe, output);
> @@ -734,6 +770,10 @@ igt_main
>   	igt_subtest_with_dynamic("static-toggle-suspend")
>   		test_hdr(&data, TEST_SUSPEND);
>   
> +	igt_describe("Tests brightness while in HDR mode");
> +	igt_subtest_with_dynamic("brightness-with-hdr")
> +		test_hdr(&data, TEST_BRIGHTNESS);
> +
>   	igt_describe("Tests swapping static HDR metadata");
>   	igt_subtest_with_dynamic("static-swap")
>   		test_hdr(&data, TEST_SWAP);
