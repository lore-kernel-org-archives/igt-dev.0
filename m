Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596EDC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 12:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A16810E132;
	Mon,  7 Jul 2025 12:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mHAxAw31";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFF410E132
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 12:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751891504; x=1783427504;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5nrhk8d4dJNFbX2L2CDY0OFWh503cf6DGOj87LhZx+g=;
 b=mHAxAw31WDzp/ugS5nka7lRf8zECyCOcD7ZZqnPbB4ISt0to09LMuGem
 QFT2sW64fSAnqwZ+p+k/BU7JrRv/CiDDeM7ZLB1LMmh9877hvFkiADPMv
 dP+daeXW7096+/5JXFbTASkW4MjQo5fGWgqCOgDYfCa90oCV4PDWY47vf
 ewcT7ZlANL/Pp1JJSJVbRDeS/AxWumcpzYQlIRKk6beEFhVyn+iuHuLrc
 3WdF1FcIKOq35QskooBw5IpBxz5+Ze1MJG8X6itJYGbmWMLHOMhW4po2w
 gzsYSKvhmHAPyaAcYIQOz240goDHWKObCmiiEZpE6c0FZ6By19szsnloo g==;
X-CSE-ConnectionGUID: iZ32730LShafLIJXGf7JtA==
X-CSE-MsgGUID: L4uRqUCsR62Tzjwp8pcwNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54034112"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="54034112"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:31:44 -0700
X-CSE-ConnectionGUID: s8ac58knQqa8/JobcQ1rQg==
X-CSE-MsgGUID: j863N1YqQO2RGlyMKr+UEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; d="scan'208";a="160751661"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 05:31:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:31:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 7 Jul 2025 05:31:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 7 Jul 2025 05:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IA3UvqPYCZ6RV1A5v7A96jmCo72DgYt1QtKE/lRf3FRzyugNsql6Ju1mGlDUquHv00QVZbFsn5cy4Mo5AA/MbfZD6tbIYw5B+iF3Jgh4DRCY+SDBhMxkaiL5IH/arcobhZEDeW2GNx+YVawsqYFLLd/7F8BCbzP92uXviPNxnJ0522Jz583X4QzFTMZeeXZrj4XtFdbV4ROWlCOSCQPaxKkN6Kia8h8iYUOO1xeofbD167ASXB+XPJwOCXT2kTn1ebaouErQRKRJS7FSK6sU+jOUkBJtq5OKX656+itx8VfzfMV4puOIC8bNYKwWxx20YbKqED2vOvCdq25bhYir7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfCbs8U+PFirP0ByiMpgsxSilFvSYQ6sO79HDg1y7FA=;
 b=wo2PLWwOLQfQyvYv9csm3VHwu/FndMUvCQ/N6ZgGds142ux4KP6hhVVXqcfr71aOCqovAnav1GEnr7XuSzc74fDAdKBAuZBwfj4NGMeoMqmcIvhKAgh0cfArdNxz7ClvphDXzF0nopMTAB5Q4Vo9ZaHUzTGrJ0Q8tHoAuvnyfxaOumsYrH+akkLhMqt4pa9orOnZa3iIUdKQJbuElwrw/Sm0QhtWXQHbxWL4doqb74V+ISrL+4q+4rUc0XYdcYLLI6jNhKyDcMZiKafCZhrlapXe7QN1HGhzlLbAsQ1fRozKce+mfAgVHIIcFBM9mbHIezBrtTIUOvfg845ifP026g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Mon, 7 Jul 2025 12:31:38 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:31:38 +0000
Message-ID: <00e8b417-87ca-468e-a189-a1b4acfeaa7c@intel.com>
Date: Mon, 7 Jul 2025 18:01:32 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 4/5] intel-ci: rename i915 testlists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
 <20250707094118.84046-5-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250707094118.84046-5-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DS7PR11MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 08a715da-b748-4464-4a8b-08ddbd5237ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dys2blhsVE0xUzJFL1FSMWtXMlVWV3lybVk4VXpMY3dwN1dhanpQMVV3TWZi?=
 =?utf-8?B?MEVFVisxMGtsZlordG1SWlQ4d2xUZ2VkbWpiZHdhZnl0YjdTcno1WE1MK2tR?=
 =?utf-8?B?dUhMemRZR1VKVm1ZVDZPZkx0dDE4YUFJN0QrYUR3THBzcE1pREhSN0xIbzkz?=
 =?utf-8?B?NHR5T0N1OUQ4TlF5R1FhTm9iNVJLZDh5R1NWNkNEQjIyMktpYUZWWE10NlZk?=
 =?utf-8?B?bk9ZUko1bkthR0FRdk9KV2J6WUp3MU1KYXp5R0hNTU5BQnZZcy9MemVKVkpj?=
 =?utf-8?B?U0NWNXBCTWdkQXltSlI3TzVLeHpkSXUvVWRBOXpzS1l4SmNqV3ZLaDdGa3Zq?=
 =?utf-8?B?aWRaMXJxNVk4QWZrd0wybm5Sd0pxQzNRRmpXU0NMU2plMWN1cjhkMU82Y2Uy?=
 =?utf-8?B?OXU0RUc3UXIyL1p2d1BYanVGL1VJdUlIYlF5eTdYNnFWaFFIb3QzSW9DOU9B?=
 =?utf-8?B?SkdPalpOaE90enA2bWMyd2dkNEQ1S3BPekdKZDBkcDFCSFdKQ1BJYnpGYlFN?=
 =?utf-8?B?NXczVzVnVk9OWVJGU1FRektLM3I0TUlaZ2lMSWE0TXhLYk1nalBUMEUxVU1y?=
 =?utf-8?B?cFdiWWwwNDBNVXJlVDFhc1JvVlk5NjFhSi9jdTlnd0ZVVE1WWFRRUUZqTkpl?=
 =?utf-8?B?dDhNbGVWM3N6ZkhMUjdEeU1XNU8yR0RMU2IrcytCejU2YnBCd3QvSytTNllJ?=
 =?utf-8?B?eElpNzh2UnJhelhUeGlYV1djN0Y2clBCamtQeWIwcnU0VnVPdlhpY3VMV05W?=
 =?utf-8?B?WDRiaGQxTlZNV3dJbFNFWlpCTHF3V0VnaDNNZ3lMUFlXWjAwMnVsUGpsaGhj?=
 =?utf-8?B?cWk5ZXNXTUI0M1dFSHFDREJMOWlmOGRCeHJ0YXhkN1NVb0w2WEh1OFJ1Y1Ji?=
 =?utf-8?B?UndTVXFKWDh3d3VydDRRbnYrcVlyOExzcXVPYW5vcmswRmVmOVF6cVMwQ1g3?=
 =?utf-8?B?N1dzRVBMRGJBbE5ZSTVzUGM1emNoLzliVTBrazMzYnBleUZndjFkOG83WWVp?=
 =?utf-8?B?RFJ6Sk0yQThycy8yYmVvMU1VT3grc2ZNZVVPdlI5QWNVR1BmR3VuOVp3ME9r?=
 =?utf-8?B?dUlFODdiRmo2N0ovVG40bnpUTnR5clBob0ZLZGJDTkc0N0hRTHA3ai9NdGN0?=
 =?utf-8?B?YjM1UjJBLzJnYTc2T25CbnRBdFNER1ZJOHFrOHd6S0ZhZVFUSjVENDRhQWEy?=
 =?utf-8?B?RWhpc2RROE9ieVRUcGIxdGY2bjd2M0cya1lMcitJL2dlaWhDMGxvZ25NMUps?=
 =?utf-8?B?aldxa0h2N0ZSVFhYZVQreGpFQitkQS9aRERDc2lOaGpJenJkNE5IYnYxVjRF?=
 =?utf-8?B?MWJtbFhIUmNlMG80MXBBZVlUU09DdnVVa3BUYysrV2F1NDFyYnpqdytGeG92?=
 =?utf-8?B?d2xmdEZuOFN0Tk5WRFZrNTdjWFgxc2tjZVM3MDZCZDBYU2poRWtINXh2bmor?=
 =?utf-8?B?TkhlWXo2NmN3RGo5VTlZQzVJcjhvTHZrMTN3Rml5cWkvQ0pqYTRvNG5iVlhN?=
 =?utf-8?B?OThQZjZKZk5vYTBVSDVpLzF1cmp0bXB2akk2dHRMRlk1ZlU3WW43SXNTcHpq?=
 =?utf-8?B?TTd4MDlLaFBocm4rc29OZHYvcnNVakZGNGh4QmN5dklpbTdtK2JxUnhjSi8v?=
 =?utf-8?B?Y05tNU1OV215dzlSYVFJMi9wWE4zUHIxWmYwSGluL0lVWDlzNG9nSEpmMmdp?=
 =?utf-8?B?bmtlQkplaHNlLzExUStVVTgwelBxcmlvRzlYQm1rSFVnZnpDTzc3My9saTJS?=
 =?utf-8?B?N054ZEJ0ZkpXUldUYW9VVnE3SnVKSXAwOWhOcTVlbmVVbUJmV2d0a1QrbGtu?=
 =?utf-8?B?bXl4eDliTGlHRnhrL1MzSWcvdlFDa29ZaVA0UGxXTnptM2FIZVNmS0V1SW5N?=
 =?utf-8?B?Rks5Vm1ydjEycFIxVVhYLzJzcVorRG56WGNSNUY4MHdCQ1lEVFZiYlF6ZWd6?=
 =?utf-8?Q?YDaD4Zodgcs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3FoTmVpRFJneHBPU1dpQlM5VEwyUENBQVlMNDJabkNVcEx3ekl5Q05BUWhz?=
 =?utf-8?B?VzU5Z0g3Q3A1a1JUT3NlaXpaT2N2dGRiQnBTem5RTmZUMjN6QnBOTDJhUWZl?=
 =?utf-8?B?S1hlRjBkZ0pKSWpCMFhmY3hKRlpFQ3BTY3AzNUxCdkVLSjZvd3lvbER5VWkr?=
 =?utf-8?B?aCt5NktoMGQycHdaSzFGUDVjRFVqMjY1UkVNVmozNkRheVhVbVd1cVQ3Rk1I?=
 =?utf-8?B?QTl6bDBodGx3QmVYOStCQ21wbk9xdTFTeDBVSmM3S0g0SEJ3U3k4aHJzY09p?=
 =?utf-8?B?MFk1a01XYUxUSzVBek5tY0pHUXhTMzdtK1YwVWZ5eWEzTVBiMlUyZDJBWUN3?=
 =?utf-8?B?bTNhbjdYZ3BZMi8vOVJDOE5VL1NPL0FGUHdabDd1REptUUl0K255VmFuQWJ1?=
 =?utf-8?B?cktKZlRvVUZpN2FGTGFKWXJpNjFuQit4YVU4TjVubmxuc2hkWGlVbEt1bFN6?=
 =?utf-8?B?RTB2bTArLzR4K3FUWVA4Y3hCRmdrak5rOGkxdDNBY2J6eFpDSHRzMHhNZzZV?=
 =?utf-8?B?aFcyOEpLY1NjZG1RRVhZTkdxNDNlNEcrb2hOM1FIb3l0cDYyTXFXWityckQv?=
 =?utf-8?B?RDFoY0pFRGdjV3VqM0VzdXFBZ3FiUkVHQkRKdlpDUnZnWFlyL2JZZS9jbGNR?=
 =?utf-8?B?dnNYMzFLOE9XVWtGZFRFVEx4eCtyb0ZBajR5TGdLeFI1eHMwSWZVd01zOWQ4?=
 =?utf-8?B?cHJ6UUVIUWtySk5VMU1hcnZvWThrV2ZDb3BnamxjM2UrdDNpak1TeTdMNkdL?=
 =?utf-8?B?YmJZdFpqb3pFcFYvY0VrUGEyd0M2MVlEZzI3S3JmTW8wQnRsTkRMV2pBRjF3?=
 =?utf-8?B?ckphZldPWGZSZGc2MnlZMjhCcU1rWmlYU3o3bVRxbVJrcGk0cThJUjlOdnp2?=
 =?utf-8?B?WW0yWW5IcjU5dE15Y213TDgycUlCdVFlUmVLWTFNdzRFNkUzV3ZuYSs5YU95?=
 =?utf-8?B?ZXpodzk3WmhkK3ZHUVB0bFVjbjQwUGlPZ08yZ3lPbXBjWWVqN1BwcEE5ZExK?=
 =?utf-8?B?ZFQ4ZUlrN2R6aTdldHUrZ2tzVEtVZW5IdUtZMzN5MG5aODN2eS9OSUl3SzlT?=
 =?utf-8?B?RVY0VkY3Ly9JeFFSSHR4UWhGRVNjTlBYbHJoT244VGw3ekp6Q0QwSC9JS3Jp?=
 =?utf-8?B?Uk1Tc0tHdU9mMzNvMjVHZVpzbGVyUWlLTzlkS0l1aElKUTc2bUZITi82Tk1C?=
 =?utf-8?B?Zmcwa3dwRmFEYmt6N1h5c1F1aHhUaWwvbGV6R0dRUFRWZSszQ2RlK3JHNFBl?=
 =?utf-8?B?R2FUOEE2aEh5OHVjWWt1Z1pFcUpiUFBnZlgxU1RyVDc2SlJSbk92NUhIcTQ4?=
 =?utf-8?B?dWZUYktyVnlwVEhuakhQYnQ3b0xwNFpQU00zQzA5T05UeFZkaFE3WUVQbDZm?=
 =?utf-8?B?Y25oaTNiYlMvWTRKeFdyQk43QmVKYk9aVFFTVE51Ym1MZExISTN3Z2hEWHhG?=
 =?utf-8?B?eU9CZDZTelRBemtyN0NtSGpTb2U3UXZIUXFWblUrblFIUDR5WmN6L2dkNEdu?=
 =?utf-8?B?QWxJdnVQcEVNTnZUV0RyTlBuaGdmZlVuYzV4RUN0K0F5aktsWk5iV3NqaGFP?=
 =?utf-8?B?bzQ5NWFuOUtpUHVlMUJlT2k1bVh5YWVmMEpQZUZaSkNyU0hlTlFsOXVzakc3?=
 =?utf-8?B?TnJQSHYrakwwSDduSGRScjZMdzlrNjlwQnd4U0N4QVFiZWQ4U01HajY0YzNT?=
 =?utf-8?B?RzViUnIxd3BoaDRrUzRsbVltQm1qQ3g2dFN4MXBXcnBFZW41V1A2ak81OUF5?=
 =?utf-8?B?dXQ3OHdweWxZZHNyN212MkRSaUdmUVNlN0VodFdUa0ZlSnlwdTZIU1lMOTFZ?=
 =?utf-8?B?SmVGTWFRZnRvT0IxKzRPVWJhaVB5T0JuYU1IK0FJV3BTMUwrbUxZeWU2U1ZJ?=
 =?utf-8?B?bWFSZVd5RStTc3Q0VzFtOVQ2aTBrL3hkL3ZXSzdtVFN3YUlGSFZ3T1JucS8r?=
 =?utf-8?B?UXAxWDJOYnhYaDBoZ2RiYjQyZXBQb0RUdWZNQTAySmRsYUc2YXRibGVOeWNY?=
 =?utf-8?B?aFFtTDRBaFdnN0V0VVRWek9LVnhWRURuS0xwRnk3bXB3UXJLZzJrY09rWVdo?=
 =?utf-8?B?UVF3Q0Nvd0xteTh4dzAxTmlsNFBOVlFJRmw3bmtHenpXb2p5WCsrNTBUZ3dQ?=
 =?utf-8?B?MWRoL3dSVnh5cGJNQVBNSDI2aHQ5NXVlWE1hRk45eW5rZlRMUlV2WkhyTnVL?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a715da-b748-4464-4a8b-08ddbd5237ba
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:31:38.1462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kue2B1aWrBNCg4Er5gjHA3ALVugR8QM9n+8wezO3Y/x2gaEK5zEljPchi89DsHA9WnvUSXJ35vn+5M83sVm+0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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

Hi Kamil,

On 07-07-2025 03:11 pm, Kamil Konieczny wrote:
> Follow Xe nameing and add i915 prefix to its testlists. In
> fast-feedback use 'i915-' and in normal testlist 'i915.'.
Even for fast-feedback, can't we have i915.fast-feedback? Is there some 
restriction?
This might create confusion, when to use . and when to use -.
ex: xe-sriov-vf.blocklist.txt
Lets follow one approach either . or -

Also, we had idea of creating 2 folders : testlists and blocklists.
Do you think we should have those directories?
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/README                                       | 6 +++---
>   ....testlist => i915-fast-feedback-chamelium-only.testlist} | 0
>   .../{fast-feedback.testlist => i915-fast-feedback.testlist} | 0
>   ...chamelium-only.testlist => i915.chamelium-only.testlist} | 0
>   tests/intel-ci/meson.build                                  | 6 +++---
>   tests/intel/i915_test_config.json                           | 2 +-
>   tests/intel/kms_test_config.json                            | 6 +++---
>   7 files changed, 10 insertions(+), 10 deletions(-)
>   rename tests/intel-ci/{fast-feedback-chamelium-only.testlist => i915-fast-feedback-chamelium-only.testlist} (100%)
>   rename tests/intel-ci/{fast-feedback.testlist => i915-fast-feedback.testlist} (100%)
>   rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)
>
> diff --git a/tests/intel-ci/README b/tests/intel-ci/README
> index 5ef2ee2d1..102cdb1fa 100644
> --- a/tests/intel-ci/README
> +++ b/tests/intel-ci/README
> @@ -17,9 +17,9 @@ Changing the test lists should only happen with approval from the CI
>   people. If you make a new test that should be tested by CI regularly,
>   ask a maintainer (see MAINTAINERS).
>   
> -======================
> -fast-feedback.testlist
> -======================
> +===========================
> +i915.fast-feedback.testlist
> +===========================
>   
>   Fast-feedback contains tests that roughly tests a wide coverage of
>   features in a short time. If the tests in fast-feedback report no
> diff --git a/tests/intel-ci/fast-feedback-chamelium-only.testlist b/tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/fast-feedback-chamelium-only.testlist
> rename to tests/intel-ci/i915-fast-feedback-chamelium-only.testlist
> diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/i915-fast-feedback.testlist
> similarity index 100%
> rename from tests/intel-ci/fast-feedback.testlist
> rename to tests/intel-ci/i915-fast-feedback.testlist
> diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> similarity index 100%
> rename from tests/intel-ci/chamelium-only.testlist
> rename to tests/intel-ci/i915.chamelium-only.testlist
> diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
> index d18170402..17d3102bd 100644
> --- a/tests/intel-ci/meson.build
> +++ b/tests/intel-ci/meson.build
> @@ -4,9 +4,9 @@ intelci_files = [
>     'README',
>     'i915.blocklist.txt',
>     'i915.blocklist-pre-merge.txt',
> -  'chamelium-only.testlist',
> -  'fast-feedback.testlist',
> -  'fast-feedback-chamelium-only.testlist',
> +  'i915.chamelium-only.testlist',
> +  'i915-fast-feedback.testlist',
> +  'i915-fast-feedback-chamelium-only.testlist',
>     'meta.testlist',
>     'xe.blocklist.txt',
>     'xe.bmg.core.blocklist.txt',
> diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
> index da871f493..1a75d52e5 100644
> --- a/tests/intel/i915_test_config.json
> +++ b/tests/intel/i915_test_config.json
> @@ -25,7 +25,7 @@
>                       "exclude-type": "regex-ignorecase",
>                       "append-value-if-not-excluded": "i915 FULL",
>                       "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
> +                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" }
>                       ],
>                       "exclude": [
>                           { "all": "../intel-ci/i915.blocklist.txt" }
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index fc8766279..886870783 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -13,9 +13,9 @@
>                       "append-value-if-not-excluded": "Xe FULL, i915 FULL",
>                       "exclude-type": "regex-ignorecase",
>                       "include": [
> -                        { "i915 BAT": "../intel-ci/fast-feedback.testlist" },
> -                        { "i915 BAT chamelium": "../intel-ci/fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 BAT": "../intel-ci/i915-fast-feedback.testlist" },
> +                        { "i915 BAT chamelium": "../intel-ci/i915-fast-feedback-chamelium-only.testlist" },
> +                        { "i915 chamelium": "../intel-ci/i915.chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe-fast-feedback.testlist" },
>                           { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }

