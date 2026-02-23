Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8535DE98DF5
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 07:26:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EBB610E1F4;
	Mon, 23 Feb 2026 07:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kC7bCDZh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A3CA10E1F4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 07:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771831563; x=1803367563;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m5DLTYBRmt/qtqRTIDPbTJVg39G86i+XQ/6WZ+hCsJc=;
 b=kC7bCDZhhVg/s+yWT5UxIAp2G44o9GSy9eEsSGTbx8g4jcEB30ej/yBr
 CbKZkrNTJzkJH0zy6t+1kCQLt3/7tDckyaBNINA1L7T0OFmGihzUSl4j6
 GUwfmpcCJ9m7xRHy2LW2rtazOkOp2ww+wb5LUdMCdi7ieQMcpl8Du3jj/
 dgbaubOLLdW8mpw9VBfCfhJOH2w54/3M8ZU9yYigN9Oih/OggIGz8MoLH
 klAnP2Jil3w16atVGwpI0+WShfse+EoOAjLXOM/DQwJo5hyC3tTKp8lTv
 AJulukwgu3/le9Dc5UlrSTi77TaWOI9HkQAqCS6JW5rEQhskcv4gis8Tc w==;
X-CSE-ConnectionGUID: tlvrodQoTeCeTGDE7bzCfQ==
X-CSE-MsgGUID: 9YmT4EjWSD2MzNSjJp0ivA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72727407"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72727407"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:26:02 -0800
X-CSE-ConnectionGUID: JJ2+iThiSh6uSqLQv9HwzA==
X-CSE-MsgGUID: IicC7QvoThSth0ZMuDASSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="220474157"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 23:26:02 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:26:02 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 23:26:02 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 23:26:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCE2AnI8HurOhUnfFZfEWvwmAbJ+aeeXu8ym26qdSvBTLSycl44HUxo0vQD0GEIGwznx+ibMIa9szD45FdKWqIzV5GtoOvGG8t1sAPmfytfWlYHJIhDEsBV/fVVixpF2PjbJd7lNvZqJX6J5xECH/VoGP/PQ1EAOWIet94sUnaSrqSslCbiw+Pu7fEx55+r99+OLgzpWkp23xWvrIS5iwavIOnxutDei54nfMbVLS5qea+p+MzZ4JyRdYcwJ4PibTBMXG7qAVaLP/Rr5go4xRzJVUnDQ4ZLuFr0RlCU5ECwjdeSowJ/5ag0kmulu8m/ryam2Cthvyir0W8Asv5YQQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMBLfquSWk/YpRYKzlZxdbtkMol/ZrRN6IWDQUTQ2Cg=;
 b=Wl4IxVXE7QhBezf7hZSUxyWusYy0l+kyZ3SXmY6a2kU/ynWNxOR0zcX6NI2eZgF9aujWYLd2wxmtMzGOKziXahWcHu3glRAigJy105BDmn0DG3Z6vI6rkCTIqsGRZSfFcGYUOY85doxm9hN+FMtJP1ZwjHXDvx0XZn9cKRCjMTSSrAyZDdQCAsIGupac9k+nO5HoKrVb0uG+QUUcAhhYMC1KV/UWn7628i8+6k3kcDIrHHUvfgH77JUe6OsM/7bZO92vClk/Yklcrq8b0Gt+lLx5wfVIN7srp2G8y4r0I1VmBnhywSjbpOrPDKEulTu0ZFXGGV4g4po5LLQZP3eP/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by PH7PR11MB7450.namprd11.prod.outlook.com (2603:10b6:510:27e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 07:25:54 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 07:25:54 +0000
Message-ID: <34da199e-d011-4afa-9fc6-84e79d0125c0@intel.com>
Date: Mon, 23 Feb 2026 12:55:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 8/8] tests/intel/xe_madvise: Add
 per-vma-protection subtest
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Yadav, Arvind"
 <arvind.yadav@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20260217023423.2632617-1-arvind.yadav@intel.com>
 <20260217023423.2632617-9-arvind.yadav@intel.com>
 <BL1PR11MB5525F9B4AF295889FB7006228477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <BL1PR11MB5525F9B4AF295889FB7006228477A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|PH7PR11MB7450:EE_
X-MS-Office365-Filtering-Correlation-Id: 26276fd0-76c3-4cb9-6bca-08de72acc77d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUlxbTRrL0c4M3NIYnZiblhJUS9kWE1CWWwxb2I1bmlWQSt1TnVBWnBUTHZu?=
 =?utf-8?B?REwzY0Q4SWs5WWh3QkgyNU1VenZUaU83Zm85SEEyWWpqK2tBSm5TTkNmdkY1?=
 =?utf-8?B?eDMrdEZnVlY5djlTTE96R0d4K29FbnhTaFQ5MFZaWlA4RGltWUJjSDB0OUtV?=
 =?utf-8?B?RVVwQkhxaEhpNmF1MVZrc0dDVDcxUkRWcUlPenZuL1p0YURUaVM3R3BjbmpK?=
 =?utf-8?B?UzB4TDZRYkJRTmJNSVQ2ejNDS0RPT0taQWdKS2doa3VQc1lQaFdyTGhiSDd3?=
 =?utf-8?B?cStRaW51QUdlUWtEUU00S0R1N1NYKzgvZzY5RUNNRUhFRVhWR2VqS0dnL3Fl?=
 =?utf-8?B?Y1IrVUFwdWlhVjEvYWQ0aFJmUkg2UzdKaTVUcllSbkFBbjIxUTZKdkNwZEpz?=
 =?utf-8?B?clQyNTBrbUpUYk9wSEdNT0M2RnBZcGdOZGs3ZFdBd3Z6RGNBN3lhTmVzNVBD?=
 =?utf-8?B?bGlPRml4bVduaXYzRGVkWUpLaWlKallqaHhERUxHVGJCd0FFSVZwZXZ3UXdn?=
 =?utf-8?B?T2F0L25TcHFFN3gzOFBtS3Awb0duZDNMNUcvOWdIdCtUU2dBRkt3TXJDLzhz?=
 =?utf-8?B?TkR1YU5jVlNnL0UwUkJGWExwelJXR09YQmRxWTFvVHBISmNlcHJGaDkwZE5o?=
 =?utf-8?B?MWNwMmVkODlvS1ppS2EvSHRyZXdQNnFoRWZiQUh3d1BnS2RqZVpiczNTL3dy?=
 =?utf-8?B?d00rSUY4L2l6TWJNV3BJS0JTNS9TejBpblRPVDh0SkJ6N0x1bkNBdmViZ2ZJ?=
 =?utf-8?B?NjIzU2dKSE1UVnpzcXdZaTZ4cFpVT0s2eGZ1QTBhMXZML3hNM2J0UGdKZHNW?=
 =?utf-8?B?QXl2MVFnOUJBTk9FWm5CRmozVTdFajExZyttWXk3SndMTGFXNmVJZVFIUk9Y?=
 =?utf-8?B?UzQ5cGtROXdsdjhpNDQ1V1hkOWR4VTNTSXp0bzFrTm5wZ1hYck84YmpzNXlX?=
 =?utf-8?B?c1hpSGFxTHh4bUxkYkx2dlMvZXBGckl1bklhbTFzN2o4ekE2NUEwK3RIUHBh?=
 =?utf-8?B?M0d5QktXaTFabWZ4ZDFYUEZmS0FvOXZqMlZkb05XSXNaTDZTWkg2QndOT210?=
 =?utf-8?B?dnZ0T2xZSkJld09KeTNYVU84OWR1enVhdVNOQldrdFJPOWlXYm9ldlJzRXB1?=
 =?utf-8?B?dVZPS3NrT3R1WExLaFhBRnFQNXBCVHVlem03bnpVTGhrQ2RMWFZhQkMveFB0?=
 =?utf-8?B?eTAxUmpUSkY3VWEwQ05COVVJOXlrMWFJbExjZHh1K1lzcFpvNkgzV2VqUUkr?=
 =?utf-8?B?K3MrSjNEWHl5RUc4bVA5MHR4YkFMaVBiK09DVnkzNyswR3NqbEIyTUJtZUkr?=
 =?utf-8?B?RE1QMEVQc0toSHNEZFcxcXZkSHI1SytSc2x0REkzVS9aN3d1T0JzbDFmNno5?=
 =?utf-8?B?RC83aStxZzhIS3JmUUZjeU0vcTA1L09sT1RCRU1OZ1d4ZTgxV3FBbDYzYm5I?=
 =?utf-8?B?bUQvZnBoM2Nyc25paXYraGRSZmJWeFhMdWhySHI5L05ndU5PS0pXWkwvREFq?=
 =?utf-8?B?QWpJOTlqQXhSNkV4a1NtNi9leFR5YkpQMXFiUkE4OWVhQXlmaURkUjg2MEd6?=
 =?utf-8?B?TkIxMW5lNzNkbU5VeUpmT29tTDlVcCtrVFdHNGRraXRzWXFoQ1FpRmJleFlJ?=
 =?utf-8?B?azQySDcrbXo5aHBqeDVVUmdXM1I3VzdKcTkrMklpaDJjWDZwR2xLUkY3c0Yv?=
 =?utf-8?B?aTNsekUzWnFNdUFsaW1tNU5Wa2pENWduby9RNFV6YXdwKzBJRy9LYlpuL3J6?=
 =?utf-8?B?dUJ3ZnlEdTZYVjgrc3pERHdKWWd4L1JLNFY5ZXRXOFpqOVF2azlNeHJ0bjBX?=
 =?utf-8?B?dUN2d0VWbSs2WnRJQUN4UVZ3bUY4WVJZclc2LzdleCttcUVMRU00Zk4yNTJP?=
 =?utf-8?B?Yy94RWRYMVdMWlRHMmpteTZqaEtWYTZmUnZiV0F2Z1NubnRrVUhpMURjZi8r?=
 =?utf-8?B?Y1E1dmREUVR4aHBYYksrNUtVK0NEaFFHZm5zOGNRY3BEZWZiSkpaWkFVZURh?=
 =?utf-8?B?UzBINVp2MUl0dno1UzFhQWZieDc4cWcxK1ZhOFJ5b0NHcmRpa3FpVzhiNVdG?=
 =?utf-8?B?YnNXQmc4ZWJBQTJXVllvK01tSHc2dWRCS21zYUlSc1VaeXJ4VWptcTlHRm8z?=
 =?utf-8?Q?SWU8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1I0cEJweCtWZHRFNUpMY3NURU84ajlYaDJMRGg4elBjOVlTZHVrVWRyZmJG?=
 =?utf-8?B?Mjg1QVFCRUNOclVSRVZwdHVyNFRyS1JjM0Z1bzNTYkpHYXg1L1QvNFU2MDEw?=
 =?utf-8?B?d3dIS3paeVNxQVFzRXdQb2Q1YkRKN3ZGOERvWEFSVUZwNXdHUHJFNksyRUkx?=
 =?utf-8?B?YkFaQ0NGVTh4ZUd0SnVYcHMyd2s2L0YwWENQQ3RseXBPdXNPUk5YZ3dRVFFQ?=
 =?utf-8?B?U3lJbVNUTG5acUpxNmNOS3BydVRrb1VxQk5qdmpId0I5ZTNkeXUvczh2aTky?=
 =?utf-8?B?bnNOeEM4OEFLeWJVci9GRVROSGlMNGVrQWRUb1ZVcVNyM0VXNWFBZmUrT09Q?=
 =?utf-8?B?MkN1dnNBUE5BR3JYQ3RqOXNhcTdWZms1UlNDeWMxVG5jaEkwM3dqZXh0ZUpD?=
 =?utf-8?B?OUt4V1ZUMm16dzhUNGgvYlNZZUVxL2xXWVNVNmVKVjRwckhHSnJXZGRhN0pY?=
 =?utf-8?B?eStBdSt1cWI1S0JDZTRSS0ZXODFqKzRyOU02ZE1raHk2K3ZhVlhzWXN0aFE3?=
 =?utf-8?B?ai9RNkF1eHgwTHhTR2JTT1FwK0M2T0JEWDhldGdiSjVFOVBOejVlWWdVdkpz?=
 =?utf-8?B?MTJDQzUvSmZKU0hralhGZVpoOUM4UVFXL252QTNKaHdGS2luUnRZVGsyZCty?=
 =?utf-8?B?Q2pJVHFrSHptYi9wL2ZjWWo1UTNSd0lqamR5QnJiMm54bzZPRmlzYStJbzBV?=
 =?utf-8?B?MFFqZUJ1aGVKM0RIelFyY3pXSVZ5b2VoY2UxZ00xT0FBOEEzNFVBTFBZcW03?=
 =?utf-8?B?RWVvb3hZK2ppeVJ4aXJGMEJjYklySkVkVisybkV5ZlF0alFqUTJ4cnpwaGhC?=
 =?utf-8?B?RUxlWkc1dldMRVRhOVREZlBmNWJ6c3Bjd1NtMGtpVDM5V2paVllvZjU1SHpM?=
 =?utf-8?B?YkJRZFNsNDNEN3NqYU52Si9CNGx3RW8yZklvclJseC9yYllUMm1EeCtWeGpI?=
 =?utf-8?B?RldGWkhZSUVaNjE0WDlQaUk0N1pleXdaZ1lRYWsxeUprVHBxR1J3eGc2WnM3?=
 =?utf-8?B?ZHA2SUtlZ2pFN0J6d0s3ZlI0WlE3MmV3Q25CdkFmbWJGY3ZuOVpXSS80a3ZD?=
 =?utf-8?B?bitHU1E1RUdTam9UWGRjeHpvczg1bU90ZXZIT0NkNVBBUDVHQkNrOWZhTHdF?=
 =?utf-8?B?bitSbEFYaU9WMHU5NVhaOVQvRmtoaTAyOEUrOUhnbzl0OHlhcGE2amtrWkdl?=
 =?utf-8?B?WjBqSUd0VWlRM3lLYmlUT3B3ZUFpL3E0VWI0ekdEM0JEc2VTTmN2eFRPSHlJ?=
 =?utf-8?B?ZWVwM251UzFuYThPaHlFZmJTd2c3N2Z3OHVSZWJ3V0RrV1B5Kzk2N2VWSzNF?=
 =?utf-8?B?cGZzUWdNcGNYSE1naDYzckM1dVg5VHc4WVNEeWtYcmx1VFZrMG1ZY3JoL0wx?=
 =?utf-8?B?eUVwU05Jb0VlekE2UUFGU0ZDY1QzbmdSclhiOGZOSW5WQXNuVDhwaVN2Yllm?=
 =?utf-8?B?bUtoSFRjRGpIZndvKzF2Y1VGTVc3S2o0Wlp1WHBuMVJtbUdndDVmRURROEtq?=
 =?utf-8?B?QUdKd1A0Yjg5VVo2Y1V4NnBGL29oUE41K3JReUZpeUQ1QUd1TDVnVmFMemc5?=
 =?utf-8?B?ei8xWndOdU5OWHFHVkZROXNVY0xjUmtQdThWMVozS2hqMHU1aG9NVTh4dnJH?=
 =?utf-8?B?WE9hTVBXZ1k0aDJmSWh2Z2lsVjAyWmJJMmpZa3lIR0s3Y2ZNcFd6U1BoTGE1?=
 =?utf-8?B?ZkhlTXNsYUJMSGhTTlBlQkJnSjlobVpzV3Z5NmZNdG1sZzN1NCt1clUwejk0?=
 =?utf-8?B?cTFJRnQrZm5wQ2ZkV1NoVFo0U1UwaWhRWmRvTUo0SEltTjM1cm8zbklxbEV2?=
 =?utf-8?B?VnZZUWdiZkovM3RNQ1g4aHlwblpUZlZWR2Q5TFlPWkhNellEL3dXbnIrTkw1?=
 =?utf-8?B?RUg0Z0JrQXp0ZlhYNmJ6SE52eGQ2TEZFVVUxMDRBd0lxOEFIdnI1czY0cCtP?=
 =?utf-8?B?eDdiTWhHVXVQbEg4bUwwamZKckQ3Sm1RTEVtV2pob2dLdGNObURhZmZoR01D?=
 =?utf-8?B?SEsrUFFpRW5VWTlpNjRsSDVSbFlkOGVnMk1jTmdlMmg4ckpMSFFlZnRBS1Fm?=
 =?utf-8?B?UEJ5aUh2T25sNXU4SjJhZ0dwODVsVldFMW1YUGs0clY0a2w0RjVMMGZwd0Rx?=
 =?utf-8?B?SU9rN3FYQy9INTlXeG9MU2RXc2xPYVhUM1dmNmRSOXdta2FHY1ZNUE9OWmZH?=
 =?utf-8?B?SmY4QTlHOWlKK1lCV3JtWjBkWGUyVGxWVGNuSzAxb3NxcGhzK1F3aDRPZ09F?=
 =?utf-8?B?K1dxRWpzQ2RDdGZFZ0tCaVpwNXN4LzNZcVhad1BySDRNd2NhdU9VZUkvNjZP?=
 =?utf-8?B?dXJCV01wMW1VN3RyQ28vVkdJWEFGOCtTM2V6ODZCNnVBY2dsaVpQc0g3RSsz?=
 =?utf-8?Q?nPNFvBt+wXzQnCAM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26276fd0-76c3-4cb9-6bca-08de72acc77d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 07:25:54.3513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWzk5QfSrrPH9uJv09HcLVuRkGbO1UOrsV5T5ownXREAWDZR1nRs+S8MvZg/DH5NJI2VZegOL7uL/l+AYjMhSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7450
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


On 2/23/2026 10:42 AM, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Tuesday, 17 February, 2026 08:04 AM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v3 8/8] tests/intel/xe_madvise: Add per-vma-protection
>> subtest
>>
>> This test validates that a WILLNEED VMA protects a shared BO from being
>> purged even when other VMAs are marked DONTNEED. The test creates a BO
>> shared across two VMs, marks VMA1 as DONTNEED while keeping VMA2 as
>> WILLNEED, then triggers memory pressure. The BO should survive and GPU
>> execution should succeed. After marking both VMAs as DONTNEED and
>> triggering pressure again, the BO should be purged, demonstrating that all
>> VMAs must be DONTNEED for the BO to be purgeable.
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 116
>> +++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 116 insertions(+)
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c index
>> 4e7df54a7..2e512edc4 100644
>> --- a/tests/intel/xe_madvise.c
>> +++ b/tests/intel/xe_madvise.c
>> @@ -568,6 +568,116 @@ static void test_per_vma_tracking(int fd, struct
>> drm_xe_engine_class_instance *h
>>   	xe_vm_destroy(fd, vm2);
>>   }
>>
>> +/**
>> + * SUBTEST: per-vma-protection
>> + * Description: WILLNEED VMA protects BO from purging; both DONTNEED
>> +makes BO purgeable
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_protection(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr1 = PURGEABLE_ADDR;
>> +	uint64_t data_addr2 = PURGEABLE_ADDR2;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync[1]),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	uint32_t retained, syncobj;
>> +	int b, ret;
>> +
>> +	/* Create two VMs and bind shared data BO */
>> +	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +						 data_addr1, data_addr2,
>> +						 data_size, true);
>> +	memset(data, 0, data_size);
>> +	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
>> +
>> +	/* Create and bind batch BO in VM2 */
>> +	batch_bo = xe_bo_create(fd, vm2, batch_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	batch = xe_bo_map(fd, batch_bo, batch_size);
>> +
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr,
>> batch_size, sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should survive (VMA2 protects) */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* GPU workload - should succeed */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr2;
>> +	batch[b++] = data_addr2 >> 32;
>> +	batch[b++] = PURGEABLE_TEST_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +	sync[1].handle = syncobj;
>> +	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
>> +
>> +	/* Mark both VMAs DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should be purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	/* GPU workload - should fail or succeed with NULL rebind */
>> +	batch[3] = PURGEABLE_DEAD_PATTERN;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	/* Exec on purged BO — may succeed (scratch rebind) or fail, both OK
>> +*/
no syncob_wait()? Otherwise LGTM
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe; @@ -608,6 +718,12 @@
>> int igt_main()
>>   			break;
>>   		}
>>
>> +	igt_subtest("per-vma-protection")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_protection(fd, hwe);
>> +			break;
>> +		}
>> +
> Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
>>   	igt_fixture() {
>>   		xe_device_put(fd);
>>   		drm_close_driver(fd);
>> --
>> 2.43.0
