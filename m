Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90637C8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 17:16:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CF410E1E7;
	Thu, 28 Aug 2025 17:16:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eu6Bk0lN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8617F10E1E7
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756401404; x=1787937404;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XnMskudfJ7lUSmhrH544QeqH7j1ZK/fHzAzWX9Z0zi4=;
 b=Eu6Bk0lN3LW3jxUgIQP+NW8ksAF6S0RELfz66POCr2yQu8lEpqDctJw3
 lk2gu35iP4PK5IEOc9XWTBpyFdJnY6B5j39RI/nfMcpLZfVkQiI6MTZxw
 aaUmf7k6jUNLr4ycnlfZj0c8P/zXtcsoRVdpflgQQ4CCYbvpgFLKvH/ZI
 4jFSfJodBEj9AWGUiurOaJaAoN/gYr6hAzWf1Z2hH6reTYW3NykTVsarX
 LUDwJHiihkO4vSqSEHiMftJaPJn1lUVSBlR3ZdEgXRJJCG//9JcIOuYIZ
 5UV4ajZID65j9FRkhl0k/1sXq2wvrjOKdx5TEdWNmeNpE96mQ0d5YUSw5 g==;
X-CSE-ConnectionGUID: ZixDuUbwTGuempcl2/I6oQ==
X-CSE-MsgGUID: Vmv8yYq6Rbq+OoSAkjdDAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58606303"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58606303"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:16:21 -0700
X-CSE-ConnectionGUID: brOicqP0QoqPpbpvGV8gQQ==
X-CSE-MsgGUID: Ix+LI1qSQrmxK5MrV3boIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="174509927"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 10:16:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:16:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 10:16:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.40)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 10:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkW7BWBAHBiY3j+mn9vqMxGAyuqfF/U+wHrWuWicx8Zl6afbr4EhSB/+lcov4R/8T+Uq4xZ+FkNS7RFkqEA6AjOkpSFHV7aCxUDvEZ1hD5PhwBjnNElnGkzobxwADlLJsjzFOzOb3yu0AtyXSjZeIGjTQqwmnvTcmSENlUWXlYTcrY/takaZO8lvbI1hbI40JuzATjqn4eJug2iSrbZevzshoQrKQ3zzhLUgwNxbX+9COrsV9VS11snLU4nvNPTL6LijT0EElLNCWGaWgSY0LdSgD1Zq0pC1sjSclV4wOG53o7MzzeJxo7tOLf+u/Txseq7EUiLU+VNjMokJfNlfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YF8l/cQjhFlWCWcj6T+5oXD1s7GGBTkFL+Ma6uuOFE=;
 b=LxCG4Rr2IUxXX2MmNCy+0oMmv8pwZG6XU88SohjCNeVWSlrbW8p1tP8df1N+Jek4DdkfWw8nFG6nGCdaVqz4Wqv1KpCvKcXNbvIq1ZI+rBmHfZ3KHZGp39+SPXWAMDpIfVI5QhhiEagv6v3e0o3pZbLOUVLOJueInLQcKy1QmPHdroqVxPxpvRWHbo1tX+49usLOOyDo/p5MVsfrKyZuuqRRWEE9Xny6NqrIZZ6g0ahp3JBedYDZfMWshHlmqK1vX8Xv8uEEIjzJmMZ96cUxWPt+9BCxFE2WsG0flDAc66MQ5qfOnVapA3YFXBufx8Pl6DXYCcZYbdmRxRH4zPv+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by IA0PR11MB7404.namprd11.prod.outlook.com (2603:10b6:208:430::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Thu, 28 Aug
 2025 17:16:13 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::625b:17f6:495f:7ad%5]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 17:16:13 +0000
Message-ID: <92da2e8a-81fc-40eb-828e-f11808e18705@intel.com>
Date: Thu, 28 Aug 2025 22:46:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/intel/xe_pm: Test to validate vram-sr
 through Mods during host s2idle
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>
CC: <riana.tauro@intel.com>, <lucas.demarchi@intel.com>
References: <20250826133105.3380147-1-soham.purkait@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20250826133105.3380147-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::8) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|IA0PR11MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: e541887c-edc3-436e-157a-08dde6569658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmdqbmpWZm1sSy9sMnRnTnhCSDQ5b3BLV1UzVXpuNy9aZ2FvNTY2ajdiQ21r?=
 =?utf-8?B?MDRNT2RLQTdyc2x2UitTbmhxcHJaY1VraGs1SmlQTkdGcHFnWGYrWmI3eFd2?=
 =?utf-8?B?OHQrbmUrYnFTYnVxQlYweGphQ3lKQVV2elpmOXdJQzN6UXdVSTdLREZqZTZS?=
 =?utf-8?B?WUhwak9taVlaRlE4d2hSdHhxclVTelk1dE1hZFk3U0lIVkJyZWR5WUlxL2dz?=
 =?utf-8?B?L1pEckh2eEpKcjY3a29rKzhqMDJ3dmlMRTNUSm5Yc0dtYVEydVBONElSVWlM?=
 =?utf-8?B?MVFncGZ1STVMSmM5b091MmhiNmtCMjhhbGU1cm9YSno5cDhiWlhpdFIvOXFC?=
 =?utf-8?B?aFI3SjRoMGpJT2dZc0RRdXRqWGpWMlU4OHBId252NnhjcVVTMVl0eWtSNVVs?=
 =?utf-8?B?Y01OZzJpdm1kT0dqRVNGUXY1OWY1LzZvdzg2eTdwQ2RsT2pjTHdHNk50ZkJU?=
 =?utf-8?B?NjBnLy9qaytZUjFmMER5TWZwYWdXc1cyNVUzVTNJUjkwc0FqTUR6SXllYWVU?=
 =?utf-8?B?bVJnZk95NFFSZmNycUFVa1ZyV2RiZDlPSEtDbXJnY0FOaEIxWVVrU2oxbHVP?=
 =?utf-8?B?K3BhQmpyNVpzUDd2VU1UaThnc1JaYUJpZHNRT0pOU0dIZ0RWK1dmejFiMitU?=
 =?utf-8?B?MGtKekFweTZwZFZvUVRjaEhXd1hiejNqNWtFZ2p0WHBldGUwb1ZFQlRRT1dz?=
 =?utf-8?B?REU5KzNzUk5wYTF4UUFmSjRsWEVuUDU4eTJXWDhsTnpKVGltM2FDZXQzZExk?=
 =?utf-8?B?bitSYmpnQms3eXhabjhpK1RCVys0bzByd2RJT21ZN0xCRW9kMzYwVjB0MUZz?=
 =?utf-8?B?ZVpGcTNQcmpUWXVSSDNjdTBwU1BwVjQ4KzU4dmRoaXpBVUFPdTUwcnZ2MkdJ?=
 =?utf-8?B?WmxkVko0YXdONmxSYXVqWEtjUGV0Mm1wRFYzQ1dTbWNQZWJpdUIydFJXMTRO?=
 =?utf-8?B?cjdLQmNnZWRWY1VmeWNjQ0tMVU94NDhTcy9LaTBBdkZ3VHN2RURud2NCZjQw?=
 =?utf-8?B?M2UwbnkxMzBtZ1cvTk02L2JLUHVlNTcycWc1SGFSQjVXazJMdU56NXhaRFhq?=
 =?utf-8?B?QStVbGdhK1kwREtmcXp1R2d1bkhYNlBhR3BjRG9aQk11R0taU3AwMEtVcUk2?=
 =?utf-8?B?RXQyTjdjcGRBalMzQ2oybDNYNk83VHVMd0svTGRRU2VjK1kySUFFdEsrQzVu?=
 =?utf-8?B?R1FhRlc0ZisxNnFzczUralZyd1FlYzdvUURYVUhxTklnMjVLbkI5Z1lJKzlx?=
 =?utf-8?B?ZmVaVnhCeFE2T1p4dDdhRDJvK3J4ZTB0SW9MS3UrY1hqb3BYV2JKV0t3RmRP?=
 =?utf-8?B?NStlWHQxWC9hZVdERE8vK082MVhVcklMSFBXQ3IzM0tvQmZmTXNKWUQrczBW?=
 =?utf-8?B?bGN5aEtzY3JCaS95UmVwdVpqMzkyNGd1TTJTOXpWak50RTVLWHVsRUl3V3hr?=
 =?utf-8?B?bGdtMzhUSWthdjVnZlhOZVE1L09zVHk5TUh4ZlkvK3poVHZYc2xOZlV2R0F6?=
 =?utf-8?B?eWlNelc3VVJNSFgvK1djdWJWWHB5REViaWZ6UUJEVTVyWXltaGtpQU4zNVZB?=
 =?utf-8?B?b1ZibmFwbmRteVNUQnhncDZtcExCOGVlSEoyd0ZOVmhZcEp1bERnbDNldnE5?=
 =?utf-8?B?cUdiZ2F1YlpUSW1QbmNXNEFKbE80N2VEUndaaGVsLzVqLy9OQVhpcE1Qd3dV?=
 =?utf-8?B?Nk5Bb0FranZ5L3FtZXFzb1Vmd2w5cXYrS2NWQ1ZqWlVvSCs4WEdFM0EwNHdo?=
 =?utf-8?B?OVVING4xRDB3RFd4SEx4YktLbzFiQkVkUEY0UVo0SitwZVRkMUI5NjlwaXNi?=
 =?utf-8?B?bjFiRzVpaVBXOThxaWlpc0x1UVp6VmJ0UThLZ29CRUZ5UERtbXU0Z2Y5bEpV?=
 =?utf-8?B?cTd3SXBaNXNvQjdFQ2ZhVC94M0lIK0s5RHBqOURoWS9SVnhTdjZOV2doV1lN?=
 =?utf-8?Q?eK+DB8LoPjo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmJ5K1V1ZGREZG5oVDAxaTRNM1hERlFEM3B6cElVd1FKL0pxcVJFSlFjRm1y?=
 =?utf-8?B?Y3l4K0RwV3VVbXh1RWN2UFlyYU9wc0FKU01WVFBmZXRCSlZZb1ZMWStIaUgw?=
 =?utf-8?B?dzFyL2FBV2MzMGM4WXljUjZxSzBnWEd1Snd5RXBJRVJkWklKSlhVdkh4eDBm?=
 =?utf-8?B?d1BFdnpiNXVKN2JlbkhaY0JMV3pCZHFKVnRNNVo3cGZRT0sveEp2aWtYaVJ1?=
 =?utf-8?B?RytKU2hUNGE0bmxqTllQbmZvcTZiRkMrakN6S3JGY2JMaXRZOGJiL00vdnF1?=
 =?utf-8?B?bEh1VFVzQ1kvUjFvRkRWL0QyQmtlNjdWMXZFZlViVk54bStqcWtvSEZsbnUw?=
 =?utf-8?B?dUpHbUl4N2lSdmlFTkZIYkhBVytoMjF1RXYwTUtud0dyNCtKTVUrdzY0MlBX?=
 =?utf-8?B?Zi8rQVZ1NUZmcCtFQ0YwRFZpcHNDY1ZBb3NsVEcySllIZ1AvL3NEV0J6U0cw?=
 =?utf-8?B?U1dmQ3c5c0JjTXFsZEx1NHF0VXdUZ2ZyRE40UzNZVWlQcWY5akVOMUxSUVF0?=
 =?utf-8?B?R1B0ejdtRHNhZ1NBQklTK3diVzlRNDRGblZkbVE3enhnMUZ6blJmQmEwa0VD?=
 =?utf-8?B?bWZkNEtUNXhWaEU2amVpTGp3UFdSQ2V0YmJpcmdidU9LOFlNZUNBTmRPRml4?=
 =?utf-8?B?MlBHd1k4NVlFRmZZSkRlNjIzaGxPdWpUYlBKQlduaXhidncvdWJNSHFRZXNK?=
 =?utf-8?B?eTJJaGtlQitDMVVENGZHeHBXMncrbGdiNUpFcDA5L3FYUXF2NjJUVU55TFVx?=
 =?utf-8?B?MEgrMnFsaUdFcDZtYVhZcXRzWVRBZmNpWGxxYmR2dlR4d2JMMkRHNjlUVDRl?=
 =?utf-8?B?eWo0MkhvVlpLNTBTS3hCR29lVHliZ2xhVG9PaG12VjdMTW1ZekVUUlZKN3Va?=
 =?utf-8?B?VjZWMTdQUDdKZHhTK3E4a05CcDZGZkhEaEJUd0ZXN2diV2J0cUVOQ3VCTy9n?=
 =?utf-8?B?RUlMOGovSWJaT0E4UU05TWprYk82dWFLOEhVOTNISEJlVXdzV0prcUgwMWk5?=
 =?utf-8?B?WUwxL3ZTMTVEMGJCeVJYL09yY3BpTWFrSG0rMEFINjFFQ2M0RkoxNnZSVEtl?=
 =?utf-8?B?NG81eXVXR0Q5a2k3Wmk3ZytmVHFZNUl0VlFnc1hQTmZqWHVoOWtZUlE1Rkcr?=
 =?utf-8?B?RzBPWENDMVhhM1U5cHl0OTRKZFA3R3NHVWtmQTlQYmNzN2xYcnYxN2NDYWZS?=
 =?utf-8?B?Ujdad3pNUnBZWGR2bzJyKzBwbHZQanp0MGduZ1BRSUo3UklwQlhqUDdOTTZ6?=
 =?utf-8?B?M0FESnZxSHc5NXJJanVFcldVb29RSHhIWUhPaHNPWXJLNDVNb1dwMmVmYVEr?=
 =?utf-8?B?dHh2SkkwbTdJc1dXMHIrbDBsR1dXZ0xNTzdUMUlVa1N2eEM1d1JHeEQ0UXY1?=
 =?utf-8?B?aUZ4L3FiQXlqRlQ3Zy8vWVBBU0xYc1RVWnJCb1Zkek1ab0tyMmN5L1hBYisz?=
 =?utf-8?B?R1daRHZUR21WVWpNTVNkNkVEUUNqcW1KZVhEUFVLenJRYk1CSVVDcEgwVmZo?=
 =?utf-8?B?VzJHdjU4Uk5DSFluQTZqQ0hPU2lPNVY4eGlQTC9yWTNBTnJnd1NSY053OTdB?=
 =?utf-8?B?NVM1cjVQVEV0ZWRoMTJMRFdQMFg2Ujd3OWM4WjlJcjYvcGxhaC9jN0U4cTd2?=
 =?utf-8?B?N1BWRVUrRE9zRkFESHNyaHhMbFFWSyt6VXdveXFCVlY3YkdGZXYxMU41RHF4?=
 =?utf-8?B?OC9XR3AvVzJnbW4yMlNBWGtubzJSSmk5TUM2T2NqK21ORmtrdXBNbzhwSjVk?=
 =?utf-8?B?Z1FJcEU1RVQyWndoQW1OY0c3b0hPYVZya0hITVcwdzhOcS90SGlLNnBIRGsr?=
 =?utf-8?B?Vm0vYUk0T1B5WUs1Um9JZUtJcmovNnliM0FNVVZhbmJXRTlDYVNiRGVUMDd2?=
 =?utf-8?B?bTdPQ0xUdWY0NjJNSlRiVmhPZ3hXeFhUUWN2MVhFZXdFMDk3MjNZMTdrMWVr?=
 =?utf-8?B?TFRpZHlpNk15dnFidC9kSnB6bThMVVErd1AzNXZ2RHZJSW9rQWJxK0NtcXIy?=
 =?utf-8?B?S2NvN0Z6Ni9LVkZpTkkrMm1BYzc0d0VKQzJFQVBMa3VDNzVNNW5LK280TmMv?=
 =?utf-8?B?YWp5djJqT3dERWtJaUZ1UElDVjA1TWgraWhBZU50YXNwNjk0Ykgydi9lRklM?=
 =?utf-8?Q?x3yMH42EnaBpV7oggR1f34puD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e541887c-edc3-436e-157a-08dde6569658
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 17:16:12.4983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XL7mC3CrvKIiNz7sm9drFASucQhjeEC2eNn5VGz1gKGmCWa9ypLJ93DdFsdiwCwwT/F9efx7mZNQB8eoYvjHKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7404
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


Hi Soham,

On 26-08-2025 19:01, Soham Purkait wrote:
> Add test to validate vram-sr through Mods during host s2idle. It checks
> whether vram self refresh capability is supported through debugfs node and
> then introduce host s2idle to check ModS residency to confirm vram self
> refresh capability upon success.
>
> v1:
>   - Define macros at the top. (Anirban)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tests/intel/xe_pm.c | 98 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 98 insertions(+)
>
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index a3a26f62a..918431641 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -10,10 +10,12 @@
>    * Sub-category: Suspend-resume tests
>    * Test category: functionality test
>    */
> +#include <ctype.h>
>   
>   #include <dirent.h>
>   #include <limits.h>
>   #include <fcntl.h>
> +#include <stddef.h>
>   #include <string.h>
>   #include <sys/ioctl.h>
>   
> @@ -48,6 +50,9 @@
>   #define I2C_AMC_ADDR	0x40
>   #define I2C_AMC_REG	0x00
>   
> +#define XE_BO_SIZE (350 * 1024 * 1024)
> +#define MODS_PREFIX "ModS"
> +
>   enum mem_op {
>   	READ,
>   	WRITE,
> @@ -423,6 +428,46 @@ child_exec(void *arguments)
>   	return NULL;
>   }
>   
> +static char *read_content_line(const char *content, const char *prefix)
> +{
> +	const char *line_start = content;
> +	char line[1024];
> +	char *result;
> +	size_t len;
> +
> +	while (*line_start) {
> +		const char *line_end = strchr(line_start, '\n');
> +		size_t line_len = line_end ? (size_t)(line_end - line_start) : strlen(line_start);
> +
> +		if (line_len >= sizeof(line))
> +			line_len = sizeof(line) - 1;
> +
> +		memcpy(line, line_start, line_len);
> +		line[line_len] = '\0';
> +
> +		if (strstr(line, prefix)) {
> +			char *colon = strchr(line, ':');
> +
> +			if (colon) {
> +				colon++;
> +				while (isspace((unsigned char)*colon))
> +					colon++;
> +
> +				result = strdup(colon);
> +				len = strlen(result);
> +				if (len > 0 && result[len - 1] == '\n')
> +					result[len - 1] = '\0';
> +
> +				return result;
> +			}
> +		}
> +		line_start = line_end ? line_end + 1 : NULL;
> +		if (!line_start)
> +			break;
> +	}
> +	return NULL;
> +}
> +
>   /**
>    * SUBTEST: %s-basic
>    * Description: test CPU/GPU in and out of s/d state from %arg[1]
> @@ -871,6 +916,54 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
>   	close(i2c_fd);
>   }
>   
> +/**
> + * SUBTEST: vrsr-capability-during-host-s2idle
> + * Functionality: pm - vram-sr
> + * Description: Test to validate vram self refresh through
> + * ModS residency counter during host s2idle
> + */
Functionality not required for subtest as per previous subtest 
implementations.
> +static void test_vrsr_capability_during_host_s2idle(device_t device)
> +{
> +	u32 bo, placement;
> +	u64 s2idle_start_mods, s2idle_end_mods;
> +	int dir, ret;
> +	char buf[4096] = {0};
> +	char *result;
> +	void *map;
> +
> +	dir = igt_debugfs_dir(device.fd_xe);
Close the dir at the end to avoid resource leaking.
> +	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
> +				      buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "vrsr_capable node is not present in debugfs.\n");
> +	igt_assert_f(strstr(buf, "true"), "VRSR capability is not supported.");
We could consider adding these as skip conditions for the case, as they 
might otherwise result in false negatives on systems that are not 
VRSR-capable.
> +
> +	placement = vram_memory(device.fd_xe, 0);
> +	bo = xe_bo_create(device.fd_xe, 0, XE_BO_SIZE, placement, 0);
> +	map = xe_bo_map(device.fd_xe, bo, XE_BO_SIZE);
> +	memset(map, 0, XE_BO_SIZE);
> +
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
> +	igt_assert_f(ret >= 0, "dgfx_pkg_residencies node is not present in debugfs.\n");
> +
> +	result = read_content_line(buf, MODS_PREFIX);
> +	igt_assert(result);
> +	s2idle_start_mods = (uint64_t)strtoull(result, NULL, 10);
> +	free(result);
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
> +	munmap(map, XE_BO_SIZE);
gem_close(device.fd_xe, bo);
> +	memset(buf, 0, sizeof(buf));
> +	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
Are we still using gtidle to expose this debugfs?

Thanks,
Anirban
> +
> +	result = read_content_line(buf, MODS_PREFIX);
> +	igt_assert(result);
> +
> +	s2idle_end_mods = (uint64_t)strtoull(result, NULL, 10);
> +	free(result);
> +
> +	igt_assert(s2idle_start_mods != s2idle_end_mods);
> +}
> +
>   igt_main
>   {
>   	device_t device;
> @@ -1040,6 +1133,11 @@ igt_main
>   		test_vram_d3cold_threshold(device, sysfs_fd);
>   	}
>   
> +	igt_describe("Validate VRAM self refresh capability during host s2idle");
> +	igt_subtest("vrsr-capability-during-host-s2idle") {
> +		test_vrsr_capability_during_host_s2idle(device);
> +	}
> +
>   	igt_fixture {
>   		close(sysfs_fd);
>   		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);

