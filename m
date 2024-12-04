Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987CAE7716D
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 22:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5102010E5B4;
	Wed,  4 Dec 2024 22:28:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/O2iD5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E559910E5B4
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 22:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733351289; x=1764887289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kAlemNap8JUV/lXe1fKRGDVaMM0LebYkADn7NYBGzd8=;
 b=M/O2iD5uJBv/K6e2EQZXgau9aDZVr3/FoqSPdwFYuGia8r5/TNOT/PGF
 ZiN1YGTG/GQ+kHFLt4jw9FtChNF4kRCKgKETNt1tdWxsr1IrM90v2y1aL
 pTafzZLAZ3S3HVZjnDA9cMvoSG4N36aDt4KsZBGEdzM/EuSVKjEHHV7oi
 pW/qmqBMpGlN8+hLhWEBPNJsPVnhyEb/klUNr/lZ4T03vsGTCjKzu+C3J
 1x3qvRou3lWSvd+JAemzbDIWnZdH+JguEr0ElzdIJkUDUKNC6Bs/f+YLw
 YTDinx8hxcEqPNDbFvYV3q2a/NztB7wpiVEndVvMbTQB0edYIDrroWHE1 A==;
X-CSE-ConnectionGUID: cqjdqsY3Q5+BA4+08jOloA==
X-CSE-MsgGUID: b3KI8j+YSpOPKokgDlRofg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="45018701"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="45018701"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 14:28:08 -0800
X-CSE-ConnectionGUID: uocCA0mqSSC6cmZvE4Tkwg==
X-CSE-MsgGUID: 0YBYEh5ATku1LQN3nyXztQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; d="scan'208";a="93777991"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2024 14:28:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 14:28:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 14:28:07 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 14:28:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkfyMR4novgcmhl0vX6IJW8ym3UsND6s1cDGoelXpE/fZyD5Stljno6GGmZ4f1sJlzBS5on8ZLo6yNiF5T5TE8ZgF5LT+tYmex0e/8GtrPtsqKLBnOE8hualnWo9PQeK32QAaYezPinxxuXzEnxJdFWaocpm6zPFCvh7oLFkmDD0fc31cAi6GtlWkeNkdbgXli4pf2m0dJNLCfCZH6H3BzF4zUEo3N+a+AvgL86VIl+tiJDtwXM7dFJrfxnV+m+zoiMcOtyToC4iDvn8UVq/rivtcMMMese4S3zRBhmDOuLAAHtWHKBOfwxmVUKYInoL0rL1m9UD4SDJzDX8kMLgYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FyRKNOz7FJ1cNZHLMKFrKU2qLzZw0UjUk5RPJn2R9Y=;
 b=TCbvfZxhTAiZv8TxO9IRwfkL0d5ddtAoIYNMUYOHwfKXw7oVMX5exjJq/JvIqIyXnR6j9YLjaAx+gpJZ5/G4Ghyg7CpO5StDy+YVhLMVOJSC/K069+HKNVohAx/hA65Ddlfw91k98KhZmZ4HKIhCO+VfqV/UKc1aGiHSKiAV1l/t3e5jk71tAW10rZibhWzaXRa/r5x2fIwrRT2rcZx4gvebloYGTRUnYvleg6lrNzJJ9pd7ALlDAlopQH2/yH+BDeHXJH2N6zf/3uzci251NVlbw0GQZ+sS+5x0NVXq+/BdMS39iFq+feVIVmpdZt6RQZhYy4h2TgMZYZQRM7chHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 22:28:03 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 22:28:02 +0000
Message-ID: <5a29f7f4-5262-4681-ad62-5d1a5ce8ac64@intel.com>
Date: Wed, 4 Dec 2024 17:28:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tests/intel/xe_exec_capture: Add xe_exec_capture test
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Senna, Peter" <peter.senna@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
References: <20241120233215.1637981-1-zhanjun.dong@intel.com>
 <02c90f012873bcea60e1b39d2052b72da84d9bcd.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <02c90f012873bcea60e1b39d2052b72da84d9bcd.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0169.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB5232:EE_
X-MS-Office365-Filtering-Correlation-Id: eeaf5eac-2d12-41c5-2987-08dd14b2ea69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVLc29MYUs2eGNaQmw3Z0tXTUlOelFlQzNQbDcwekRlcW5udWRIQk5zZ050?=
 =?utf-8?B?MEZmY0dxSHkzRnJTQ3IrSG1RaG9PTDBNcTNvS0Q0SEpPbXdJTkhlOXZKTUsv?=
 =?utf-8?B?bnVObWFzbG02ZzJ2dXNMWDJ2Z01KTnZOM1NVUG1xSnRQMFlHVGRDYkFDVlgx?=
 =?utf-8?B?MURRVTJ4Z0lYOXhwd2xmc1hHNGZuMVlsRU0wMS9jeitydDM5WVZiU0NwQTE2?=
 =?utf-8?B?MlBYKzc5OU15U1NBWFF3RjF5aHZBRm16THFmQ08vZHJLOHdqVDFQeEtpQ252?=
 =?utf-8?B?NGVwalQzV1dFQXF3RUNUbko1ajBHTjhpVDNleEdrZk95cVpRL1l1OFFRdGc0?=
 =?utf-8?B?VE15b0tua1NodjcrRnFiU2RiUzE2SFNlR3FvTTg0NXZScTRaY3NmVlJhN3Fo?=
 =?utf-8?B?SjhwTm1IdnlwVm5SRENXbm5ISTdOWVJIMVFWMlRUN3dJMVJlNE8vdCtKQW4r?=
 =?utf-8?B?RkNneUZXbnp0aUo4bGFrQ1hYSXV6VU90WFVIMWNoUjdZY1Z0bDlIWVRnSjBK?=
 =?utf-8?B?TE9VV2x1NDBIK1R2dFFxbUtJQXBYTGNUT1NqTEVXdFNxYWJIV1lTZkN5a1JU?=
 =?utf-8?B?QjRmUkJRaHRubUljWHM3eG1FMENMbkVXR2VGTGg0aUU0T01zMGNvVFE2MU1E?=
 =?utf-8?B?SkJUME5mTFpudHE3Q1JZa3pkOC85bXdsaW1FNGxTNFlnaVp3MEIvQXlsL25Y?=
 =?utf-8?B?MDdYd2RaWWlxbHVVWldjbXBQNFV1S3lVYXNzb3FHNkhSK2hpRVVYT3dDRTNZ?=
 =?utf-8?B?SW94aTEvNWVtWWtDK3h4STRhRkdIcThnWEFEM2JDS2Y1Y2dKUFYzRXk5VXlo?=
 =?utf-8?B?WkROdmNtYXpSYWF6dXFVbk9PK0JqQ0pXNVQvN0lScFdiRys2cGpjR2FJYUpw?=
 =?utf-8?B?R3laaElJQzl6d05TQzM1RzFvWk5DakVoME1USzJDaXo4bS8veGlkWS9oejF0?=
 =?utf-8?B?MGxDVDRXR0R2WkxBVnVwWkVLNnNGd0UzZnpuaktTNFkxMHJzOVgzbTlxd2Jp?=
 =?utf-8?B?TktnT2JxMVNieC90V2tscXNveTBxa0RoRDJoMjFqaURPaGZxaFU5Z0cxRnZ1?=
 =?utf-8?B?YU4xMzk1V20yL0x6V0oyelNscytmakRzNENQQXB0SjZ6NVJxMWs4S2p5ZEpu?=
 =?utf-8?B?b0NXOW9QNEVLbU9DYWliNW40YndDd1dzWUZVRmFDL2tQTG1aajZFZWlYU2pO?=
 =?utf-8?B?N0xKeWc5Y21RSzNlUGJ3QzBTbFVlRThDVHZsWmt3KzFZY3dRMVpxYkJZVFNV?=
 =?utf-8?B?V1Bia3B4UXc5NDdySXZjZXJ4U21McVdXT29pRCtXQndiSUdPeXNJT3daNE1E?=
 =?utf-8?B?SURWQnA0YlZwQmQzRVNaOUF0OHJBcTJOZnJEOHNLcU0rUktDcGRuc1VnN2Nw?=
 =?utf-8?B?WEFMWHdYWU5nY2xlaFJDTGJUYldVb2VsVE1ydHpmZ2FWRUEzNE9TUlZRRlVm?=
 =?utf-8?B?OUxweUpLZTh1czV3S2x4N1FJbXpEamJyNERReTdkRUpRQlg5Rjhuazd4d0E0?=
 =?utf-8?B?VnVJOGROSjlxdDN3STlOZEVUT1JIOGp0eHNabUZ3K0QvVmVZWmNESG8zMzRW?=
 =?utf-8?B?NitnZVV3UjdhSWdqN1hNY204Ui9HUVhqNHlMdHRNSnBJYTBMazRZTldHM3B5?=
 =?utf-8?B?WEFrYnRtUXEvS2E2K3piNEd6cEtPckdpR1BQZ1JXYnFvcC9Nem9JRFF2ZkVa?=
 =?utf-8?B?em1jYXJ2QjlTazNLbThSWm0va25POVptc05KZ1p5MDRjakhXc2xzSk9URTN6?=
 =?utf-8?B?Y0VyMXNIK3lta21lSmdobHlUNEV4K0JjLzVBa1VBZElPdTZzNEZNNi91S0o1?=
 =?utf-8?B?RG1wK1MzS1EzS2plS1FOQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnordlpkRHJySWZtRWxYdnh3NmtQU2czRTdIcEU0MUZMK0c4QmlmSk9YN0VL?=
 =?utf-8?B?ZjRpd0VhV2dqVVdXeUpmb0VTWVQ3RmhDR1R5d1A2eW9kcHltQ3JHa3Q2aEZ0?=
 =?utf-8?B?ZkRkc1pjbEtod1VLcjh3UUVoUHpraHFQaStONjZ1TlhKdjd6ejdoZXJBcFRR?=
 =?utf-8?B?dWlwSkxBdzhraDhXNWVUM3BGTDRRNEsvVVVYbDRvdW5XTkVhcThHSTNOQ1h5?=
 =?utf-8?B?VUR0dGQxOWNDb0dCOG9KQUtVUjc2L3BwVlVNNjhtcXRyNDcxQ28wSkFvOW9T?=
 =?utf-8?B?aHBpcEFUZEhzbUdRVnEvL1NzTzN2Q0U4NE91L1djaU1FODNYVjRRYkE5SHMw?=
 =?utf-8?B?SXNXVVVvaGdMVUYra1NlQlBkd1A0c3Z1L0R4aWI1U0ZqaHdET1N1TFZlak5h?=
 =?utf-8?B?M0I2N3JRc3lmWDBkM3FJYzNORTZPckx0amhZSjlwc1p6eTVYL0dub0J3cFhh?=
 =?utf-8?B?QkY2QVBXNVJBU3RZZzBXV28xaHZISWk0R1l6SmpuVS9DS3lpeWwxT1B5YUU4?=
 =?utf-8?B?V3c3dnJ3R0dpNHZOVEtQMTVJRXhFSXlCSXlZR3FmY1pRalA1Nlp5dEJIcW4z?=
 =?utf-8?B?T2hDOTJ6STBkTVh3NlZNbUJEVmlOaVlndlJ2b3BFRHRmZXIyaFhqYUtpQ05X?=
 =?utf-8?B?M1h4OU1wRVp2eGVnUUV1SVhxTDIvdmN1RFJsR21EY1BhRUoraGdEMW5NMjAw?=
 =?utf-8?B?ZEgxVDVjRjFYUmFjdmZVZkFVTkd1UG51NmRkYyt6a3ZvemdDZVQ1cHo0RENk?=
 =?utf-8?B?blAzdXNxSGFFR1Rkc2NCVnFoWlJlUG42dzRvaTliUm05UXZPTTFGWFlnUytr?=
 =?utf-8?B?MWhoMmpxN2JadUpuL3ZKaEFKWDlIYm1EKy9nQkFiMHdNcmJhQTRmbGlTVHpT?=
 =?utf-8?B?QXVVWkQ4dTBudi9yVGRjSWpUbGNBL0UwZmxnMW40ekdwYVUxU2g0MWZVQi9l?=
 =?utf-8?B?RDJVZzFhNkdIczdlS2syZnJRTFB1MXhib3ZGbUhNdnp6RGlvRjlaV3dvRTZh?=
 =?utf-8?B?NG1EeGVxZjVBdHo5NkQ0cXh0bWVrL3Y0Mmo1ekNGaTdxSTZTU2t5REhBdW5R?=
 =?utf-8?B?NHhQK2tUR0NYSTlDeThYa3pySVNWOXJmWmpvVEt0M0JHU2kzaTFXVGxTUjZ2?=
 =?utf-8?B?ZlV4aHdFNXJ3SXRoN0Y3Z2s4ODFmdFN3N21zRGVtYTE3cW5kdkZaRldjZHpV?=
 =?utf-8?B?dDlmTEVhMk1KWXJwdndVS3IzOHpKNkRBZlRyOVJKRkY2dXpiK2lOamNuZlhj?=
 =?utf-8?B?NnN5eTZ3MTlTb1NUMTZVQjk1ZzZMYkV0eGdJSkQ1MkFac1ZjWUc3Zkl3MkJI?=
 =?utf-8?B?OU44T3BiR0RrYytxZDNsMGJHYVg0dEo3cnBmNWZuaGIxeXZBdnZFSlRuWVZ6?=
 =?utf-8?B?cnB4ejVFY25MZitEb2ZSUVpjb2M0Uk4zc3ZvYTdqTjVrblFMSUlvaDMyZ3Jh?=
 =?utf-8?B?eGgwMTBHNVY1alkrQlo3Yk80a092SlY0dHZnUWVOUThNS2d2V0JZYkR6MDd1?=
 =?utf-8?B?UTRVdHdNL2pWUFQ1TTNNS3FjN3hWN2w3OWlSUUc5cm9sZjlRSmpCZ2xqQVli?=
 =?utf-8?B?TnRwNDdFeXZhUzE5TTBaWW96QXVOelJOSHpjNXFsOW50VGtIRStQaUVQeWxv?=
 =?utf-8?B?bk1vaHVqd1phVnpDc2FrUWhseko0eURraGNQR0dCaW1iQkE3TUJOelVZcm5M?=
 =?utf-8?B?d3lVeTZkOWFTcXhra2ZyRVBEZjNvYmJWTHp4YVZsWXpUZ3RteWl5Q2NPaTNE?=
 =?utf-8?B?SmVLekVjb0hQRlg3aW9QdmlpOFpRaFZOTFNIanR5bzdOd0c0Mk96SzlySG14?=
 =?utf-8?B?NThZYmdUb01UbFZKWW43eE1vcjVtQ0hhMEUzU3AvRnVxQnk1a1J0akVDY012?=
 =?utf-8?B?MDR1T0pVMDJHS0piaXhCVXFEalBXQUNDRGxYYkdIVCtJMVNnWE9wbnZNVTdL?=
 =?utf-8?B?ZnZVVlBtVnh2My9tVTdnWHZOYkZZbkhrYmhwM0JOK2ZXY1JsSlA0R1F0N2Jn?=
 =?utf-8?B?UkJHRmlMelA5dWR1VUE4bjFmaEIwNmVudjVveUR0MWFZRnQ0Tkxha2oxZXJG?=
 =?utf-8?B?VnNmbEVzWjY4K0dwY3g0TGlweVNsYWdJdFF5OThmMGFPWGlhaG8yaHYrUDdx?=
 =?utf-8?Q?f/WSr1+CUJA7eAPDUIIEf/Wfg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eeaf5eac-2d12-41c5-2987-08dd14b2ea69
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 22:28:02.8558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9i5mo3wagLjd+MukdvniQRnOeu36wqm40qzSMmpnHxxp2Yk/y0WPwaU/XH5sYJE2GmV5p95iyteDrsezy/HHZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5232
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



On 2024-12-03 9:19 p.m., Teres Alexis, Alan Previn wrote:
> i only have 3 minor asks left - the rest are nit's.
> hoping we can get this approved with another rev.
> 
> thanks again for the work - also, i am glad to see
> we are now comparing the error-capture batch address
> against unique values that identify which engine
> and which run - so we know guc error capture
> did not mis-report because of some kind of internal
> race.
> 
> ...alan
> 
> 
> On Wed, 2024-11-20 at 15:32 -0800, Dong, Zhanjun wrote:
>> Submit cmds to the GPU that result in a GuC engine reset and check that
>> devcoredump register dump is generated, by the GuC, and includes the
>> full register range.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Cc: Peter Senna Tschudin <peter.senna@intel.com>
>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>
>> Changes from prior revs:
>>   v5:-  Detect devcoredump matches the testing engine
>>         Engine will run with random cid
>>   v4:-  Support runs on multiple GPU
>>         Load all devcoredump content to buffer
>>         Alloc line buffer dynamic vs static global memory
>>         Changed to igt_assert_f to provide more info if failed
>>   v3:-  Remove call to bash and awk
>>         Add regular express parse
>>         Detect devcoredump through card index
>>         Add devcoredump removal check
>>   v2:-  Fix CI.build error
>>         Add multiple GPU card support
>> ---
>>   tests/intel/xe_exec_capture.c | 462 ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 463 insertions(+)
>>   create mode 100644 tests/intel/xe_exec_capture.c
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/xe_exec_capture.c
>> new file mode 100644
>> index 000000000..33b92bb71
>> --- /dev/null
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -0,0 +1,462 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Basic tests for GuC based register capture
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: CMD submission
>> + * Functionality: Debug
>> + * Test category: functionality test
>> + */
>> +
>> +#include <ctype.h>
>> +#include <fcntl.h>
>> +#include <regex.h>
>> +#include <stdio.h>
>> +#include <string.h>
>> +#include <time.h>
>> +
>> +#include "igt.h"
>> +#include "igt_device.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "xe_drm.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_spin.h"
>> +
>> +#define MAX_N_EXECQUEUES               16
>> +#define MAX_INSTANCE                   9
>> +#define GT_RESET                       (0x1 << 0)
>> +#define CLOSE_FD                       (0x1 << 1)
>> +#define CLOSE_EXEC_QUEUES              (0x1 << 2)
>> +#define VIRTUAL                                (0x1 << 3)
>> +#define PARALLEL                       (0x1 << 4)
>> +#define CAT_ERROR                      (0x1 << 5)
>> +
>> +#define BASE_ADDRESS                   0x1a0000
>> +#define ADDRESS_SHIFT                  39
>> +/* Batch buffer element count, in number of dwords(u32) */
>> +#define BATCH_DW_COUNT                 16
>> +
>> +#define MAX_TEMP_LEN                   80
>> +#define MAX_SYSFS_PATH_LEN             128
>> +#define MAX_LINES                      4096
>> +/* Max line buffer size (includes last '\0') */
>> +#define MAX_LINE_LEN                   1024
>> +#define MAIN_BUF_SIZE                  (MAX_LINES * MAX_LINE_LEN * sizeof(char))
>> +/*
>> + * Devcoredump might have long line this test don't care.
>> + * This buffer size used when load dump content
>> + */
>> +#define LINE_BUF_SIZE                  (64 * 1024)
>> +
>> +#define DUMP_PATH                      "/sys/class/drm/card%d/device/devcoredump/data"
>> +#define START_TAG                      "**** Job ****"
>> +#define END_TAG                                "**** VM state ****"
>> +
>> +#define REGEX_NON_SPACE_GROUPS         "^[ \t]*([^ ]+)[ \t]+([^ ]+)[ \t]*([^ ]+)*[ \t]*([^ ]+)*[ \t]*([^ ]+)*[ \t]*$"
> alan: i think its better for future maintenence to define above as a combination of specific markers
> for example as per how "#define REGEXP" is defined in intel_reg_spec.c
Good idea, let me try this in next rev.

>> +#define REGEX_NON_SPACE_GROUPS_COUNT   6
>> +
>> +#define INDEX_KEY                      1
>> +#define INDEX_VLAUE                    2
>> +#define INDEX_ENGINE_PHYSICAL          2
>> +#define INDEX_ENGINE_NAME              1
>> +#define INDEX_ENGINE_INSTANCE          4
>> +
>> +typedef u32    uint32_t;
>> +typedef u64    uint64_t;
> alan: nit: not sure if the tab above is standard practice.
> Also wondering if there is an existing header you could
> include that helps with this typedef - see linux_scaffold.h
Thanks for let me know. To be updated in next rev.
>> +
>> +static char *safe_strncpy(char *dst, const char *src, int n)
>> +{
>> +       char *s;
>> +
>> +       igt_assert(n > 0);
>> +       igt_assert(dst && src);
>> +
>> +       s = strncpy(dst, src, n - 1);
>> +       s[n - 1] = '\0';
>> +
>> +       return s;
>> +}
>> +
>> +static const char *xe_engine_class_name(u32 engine_class)
>> +{
>> +       switch (engine_class) {
>> +       case DRM_XE_ENGINE_CLASS_RENDER:
>> +               return "rcs";
>> +       case DRM_XE_ENGINE_CLASS_COPY:
>> +               return "bcs";
>> +       case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>> +               return "vcs";
>> +       case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +               return "vecs";
>> +       case DRM_XE_ENGINE_CLASS_COMPUTE:
>> +               return "ccs";
>> +       default:
>> +               igt_warn("Engine class 0x%x unknown\n", engine_class);
>> +               return "unknown";
>> +       }
>> +}
>> +
>> +static void
>> +test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci, int n_exec_queues, int n_execs,
>> +                unsigned int flags, u64 addr)
> alan: nit: maybe rename from "addr" to "eng_seed_addr"? (a bit more descriptive).
> But then again, just a nit.
Sure, np
> 
>> +{
>> +       u32 vm;
>> +       struct drm_xe_sync sync[2] = {
>> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +               { .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
>> +       };
>> +       struct drm_xe_exec exec = {
>> +               .num_batch_buffer = 1,
>> +               .num_syncs = 2,
>> +               .syncs = to_user_pointer(sync),
>> +       };
>> +       u32 exec_queues[MAX_N_EXECQUEUES];
>> +       u32 syncobjs[MAX_N_EXECQUEUES];
>> +       size_t bo_size;
>> +       u32 bo = 0;
>> +       struct {
>> +               struct xe_spin spin;
>> +               u32 batch[BATCH_DW_COUNT];
>> +               u64 pad;
>> +               u32 data;
>> +       } *data;
>> +       struct xe_spin_opts spin_opts = { .preempt = false };
>> +       int i, b;
>> +
>> +       igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> +
>> +       vm = xe_vm_create(fd, 0, 0);
>> +       bo_size = sizeof(*data) * n_execs;
>> +       bo_size = xe_bb_size(fd, bo_size);
>> +
>> +       bo = xe_bo_create(fd, vm, bo_size,
>> +                         vram_if_possible(fd, eci->gt_id),
>> +                         DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +       data = xe_bo_map(fd, bo, bo_size);
>> +
>> +       for (i = 0; i < n_exec_queues; i++) {
>> +               exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>> +               syncobjs[i] = syncobj_create(fd, 0);
>> +       };
>> +
>> +       sync[0].handle = syncobj_create(fd, 0);
>> +       xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +
>> +       for (i = 0; i < n_execs; i++) {
>> +               u64 base_addr = addr;
>> +               u64 batch_offset = (char *)&data[i].batch - (char *)data;
>> +               u64 batch_addr = base_addr + batch_offset;
>> +               u64 spin_offset = (char *)&data[i].spin - (char *)data;
>> +               u64 sdi_offset = (char *)&data[i].data - (char *)data;
>> +               u64 sdi_addr = base_addr + sdi_offset;
>> +               u64 exec_addr;
>> +               int e = i % n_exec_queues;
>> +
>> +               if (!i) {
>> +                       spin_opts.addr = base_addr + spin_offset;
>> +                       xe_spin_init(&data[i].spin, &spin_opts);
>> +                       exec_addr = spin_opts.addr;
>> +               } else {
>> +                       b = 0;
>> +                       data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +                       data[i].batch[b++] = sdi_addr;
>> +                       data[i].batch[b++] = sdi_addr >> 32;
>> +                       data[i].batch[b++] = 0xc0ffee;
>> +                       data[i].batch[b++] = MI_BATCH_BUFFER_END;
>> +                       igt_assert(b <= ARRAY_SIZE(data[i].batch));
>> +
>> +                       exec_addr = batch_addr;
>> +               }
>> +
>> +               sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> +               sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +               sync[1].handle = syncobjs[e];
>> +
>> +               exec.exec_queue_id = exec_queues[e];
>> +               exec.address = exec_addr;
>> +               if (e != i)
>> +                       syncobj_reset(fd, &syncobjs[e], 1);
>> +               xe_exec(fd, &exec);
>> +       }
>> +
>> +       for (i = 0; i < n_exec_queues && n_execs; i++)
>> +               igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0,
>> +                                       NULL));
>> +       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +       sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> +       xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
>> +       igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
>> +
>> +       syncobj_destroy(fd, sync[0].handle);
>> +       for (i = 0; i < n_exec_queues; i++) {
>> +               syncobj_destroy(fd, syncobjs[i]);
>> +               xe_exec_queue_destroy(fd, exec_queues[i]);
>> +       }
>> +
>> +       munmap(data, bo_size);
>> +       gem_close(fd, bo);
>> +       xe_vm_destroy(fd, vm);
>> +}
>> +
>> +static char **alloc_lines_buffer(void)
>> +{
>> +       int i;
>> +       char **lines = (char **)malloc(MAX_LINES * sizeof(char *));
>> +       char *main_buf =  (char *)malloc(MAIN_BUF_SIZE);
>> +
>> +       igt_assert_f(lines, "Out of memory.\n");
>> +       igt_assert_f(main_buf, "Out of memory.\n");
>> +
>> +       /* set string array pointers */
>> +       for (i = 0; i < MAX_LINES; i++)
>> +               lines[i] = main_buf + i * MAX_LINE_LEN;
>> +
>> +       return lines;
>> +}
>> +
>> +static char *get_devcoredump_path(int card_id, char *buf)
>> +{
>> +       sprintf(buf, DUMP_PATH, card_id);
>> +       return buf;
>> +}
>> +
>> +static int load_all(FILE *fd, char **lines, char *buf)
>> +{
>> +       int start_line = -1, i = 0;
> alan: any reason why we cant init start_line to 0 and eliminate the
> start_line++ when we stop skipping below? maybe i am lacking coffee
> but i dont see a need to start with -1
to be updated
>> +       bool skip = true;
>> +
>> +       memset(lines[0], 0, MAIN_BUF_SIZE);
>> +       while (!feof(fd) && i < MAX_LINES) {
>> +               /*
>> +                * Devcoredump might have long lines, load up to
>> +                * LINE_BUF_SIZE for a single line
>> +                */
>> +               fgets(buf, LINE_BUF_SIZE, fd);
> alan: just occured to me that should break in the event of an error
> (maybe file is corrupted or io-error? - so break with an igt-warn or something?
Sure, will add ferror check on fgets return null.
> 
>> +               start_line++;
This is a bug, the start_line increase should be stopped once START_TAG 
found, to be moved into if skip body.
>> +
>> +               if (skip) {
>> +                       /* Skip all lines before START_TAG */
>> +                       if (strncmp(START_TAG, buf, strlen(START_TAG))) {
>> +                               continue;
>> +                       } else {
>> +                               skip = false;
>> +                               /* start_line start from 0, adjust to start from 1 */
>> +                               start_line++;
>> +                       }
>> +               }
>>
> alan: thanks for adding this optimizatoin to select the lines of interest,
> this ims good - and i guess we can rely on it (as long as we dont have undefined
> length lines like vm data which will happen after END_TAG, so we are goo).
> 
>> +
>> +               /* Stop on END_TAG */
>> +               if (!strncmp(END_TAG, buf, strlen(END_TAG)))
>> +                       break;
>> +
>> +               /* Only save up to MAX_LINE_LEN to buffer */
>> +               safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
>> +       }
>> +       return start_line;
>> +}
>> +
>> +static int access_devcoredump(char *path, char **lines, char *line_buf)
>> +{
>> +       int start_line = -1;
>> +       FILE *fd = fopen(path, "r");
>> +
>> +       if (!fd)
>> +               return false;
>> +
>> +       igt_debug("Devcoredump found: %s\n", path);
>> +
>> +       /* Clear memory before load file */
>> +       if (lines)
>> +               start_line = load_all(fd, lines, line_buf);
>> +
>> +       fclose(fd);
>> +       return start_line;
>> +}
>> +
>> +static bool rm_devcoredump(char *path)
>> +{
>> +       int fd = open(path, O_WRONLY);
>> +
>> +       if (fd != -1) {
>> +               igt_debug("Clearing devcoredump.\n");
>> +               write(fd, "0", 1);
>> +               close(fd);
>> +               return true;
>> +       }
>> +
>> +       return false;
>> +}
>> +
>> +static char
>> +*get_coredump_item(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index)
>> +{
>> +       int i;
>> +       regmatch_t match[REGEX_NON_SPACE_GROUPS_COUNT];
>> +
>> +       for (i = 0; i < MAX_LINES; i++) {
>> +               char *line = lines[i];
>> +
>> +               /* Skip lines without tag */
>> +               if (!strstr(line, tag))
>> +                       continue;
>> +
>> +               if ((regexec(regex, line, REGEX_NON_SPACE_GROUPS_COUNT, match, 0)) == 0) {
>> +                       char *key = NULL, *value = NULL;
>> +
>> +                       if (match[tag_index].rm_so >= 0) {
>> +                               key = &line[match[tag_index].rm_so];
>> +                               line[match[tag_index].rm_eo] = '\0';
>> +                       }
>> +                       if (match[target_index].rm_so >= 0) {
>> +                               value = &line[match[target_index].rm_so];
>> +                               line[match[target_index].rm_eo] = '\0';
>> +                       }
>> +
>> +                       if (key && value && strcmp(tag, key) == 0)
>> +                               return value;
>> +                       /* if key != tag,  keep searching and loop to next line */
>> +               }
>> +       }
>> +
>> +       return NULL;
>> +}
>> +
>> +static void
>> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64 addr_lo, u64 addr_hi)
>> +{
>> +       u64 result;
>> +       char *output;
>> +
>> +       igt_assert_f((output = get_coredump_item(regex, lines, tag, INDEX_KEY, INDEX_VLAUE)),
>> +                    "Target not found:%s\n", tag);
>> +       result = strtoul(output, NULL, 16);
>> +       igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, addr_lo, addr_hi);
>> +       igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>> +                    "value %lX out of range[0x%lX-0x%lX]\n", result, addr_lo, addr_hi);
>> +}
>> +
>> +static void
>> +check_item_str(regex_t *regex, char **lines, const char *tag, int tag_index, int target_index,
>> +              const char *target, bool up_to_target_len)
>> +{
>> +       char buf[MAX_TEMP_LEN] = {0};
>> +       char *output;
>> +       int code;
>> +
>> +       igt_assert_f(output = get_coredump_item(regex, lines, tag, tag_index, target_index),
>> +                    "Target not found:%s\n", tag);
>> +
>> +       if (up_to_target_len) {
>> +               igt_assert_f(strlen(target) < MAX_TEMP_LEN, "Target too long.\n");
>> +               safe_strncpy(buf, output, MAX_TEMP_LEN);
>> +               buf[strlen(target)] = 0;
>> +               output = buf;
>> +       }
>> +       code = strncmp(output, target, strlen(target));
>> +       igt_debug("From tag '%s' found %s vs %s\n", tag, output, target);
>> +       igt_assert_f(code == 0, "Expected value:%s, received:%s\n", target, output);
>> +}
>> +
>> +/**
>> + * SUBTEST: reset
>> + * Description: Reset GuC, check devcoredump output values
>> + */
>> +static void test_card(int fd)
>> +{
>> +       struct drm_xe_engine_class_instance *hwe;
>> +       regex_t regex;
>> +       int start_line;
>> +       char **lines;
>> +       char *single_line_buf =  (char *)malloc(LINE_BUF_SIZE);
>> +       char temp[MAX_TEMP_LEN];
>> +       char path[MAX_SYSFS_PATH_LEN];
>> +
>> +       igt_assert_f(single_line_buf, "Out of memory.\n");
>> +
>> +       regcomp(&regex, REGEX_NON_SPACE_GROUPS, REG_EXTENDED | REG_NEWLINE);
>> +       get_devcoredump_path(igt_device_get_card_index(fd), path);
>> +       lines = alloc_lines_buffer();
>> +
>> +       /* clear old devcoredump, if any */
>> +       rm_devcoredump(path);
>> +
>> +       xe_for_each_engine(fd, hwe) {
>> +               int rand_cid = rand() & 0xF;
> alan: rand, though guaranteed to be as random as possible, becomes
> much less reliable after we AND it down to 4 bits. Very high chance of
> overlap (1/16 chance). Also name choice could better describe the use as
> engine identifier:
> 	++engine_id; (initialize to zero before the xe_for_each_engine)

I had this idea before, it make it different to other engines during the 
run, or that round.
On the other hand, I want the address to be different to previous round 
as well, so with the random number, it will works on this situation.

And the 0xF is too small range. From the BSpec, bit 64-48 is ignored, so 
this part will be changed to in range of 0x7F.


>> +               const u64 addr = BASE_ADDRESS | ((u64)rand_cid << ADDRESS_SHIFT);
>> +
>> +               igt_debug("Running on engine class: %x instance: %x\n", hwe->engine_class,
>> +                         hwe->engine_instance);
>> +
>> +               test_legacy_mode(fd, hwe, 1, 1, 0, addr);
>> +
>> +               /* assert devcoredump created */
>> +               igt_assert_f((start_line = access_devcoredump(path, lines, single_line_buf)) > 0,
>> +                            "Devcoredump not exist, errno=%d.\n", errno);
>> +
>> +               sprintf(temp, "instance=%d", hwe->engine_instance);
>> +               check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
>> +                              INDEX_ENGINE_INSTANCE, temp, false);
>> +               check_item_str(&regex, lines, "(physical),", INDEX_ENGINE_PHYSICAL,
>> +                              INDEX_ENGINE_NAME, xe_engine_class_name(hwe->engine_class), true);
>> +
>> +               check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, INDEX_VLAUE,
>> +                              "GuC", false);
>> +               check_item_u64(&regex, lines, "ACTHD:", addr,
>> +                              addr + BATCH_DW_COUNT * sizeof(u32));
>> +               check_item_u64(&regex, lines, "RING_BBADDR:", addr,
>> +                              addr + BATCH_DW_COUNT * sizeof(u32));
>> +
>> +               /* clear devcoredump */
>> +               rm_devcoredump(path);
>> +               sleep(1);
>> +               /* Assert devcoredump removed */
>> +               igt_assert_f(!access_devcoredump(path, NULL, NULL), "Devcoredump not removed\n");
>> +       }
>> +       /* Free lines buffer */
>> +       free(lines);
>> +       free(single_line_buf);
>> +       regfree(&regex);
>> +}
>> +
>> +igt_main
>> +{
>> +       int xe;
>> +
>> +       igt_fixture {
>> +               xe = drm_open_driver(DRIVER_XE);
>> +               /* Seed random number with current time */
>> +               srand(time(NULL));
>> +       }
>> +
>> +       igt_subtest("reset") {
>> +               int gpu_count = drm_prepare_filtered_multigpu(DRIVER_XE);
>> +
>> +               igt_require(xe > 0);
>> +               if (gpu_count >= 2) {
>> +                       igt_multi_fork(child, gpu_count) {
>> +                               int gpu_fd;
>> +
>> +                               gpu_fd = drm_open_filtered_card(child);
>> +                               igt_assert_f(gpu_fd > 0, "cannot open gpu-%d, errno=%d\n", child,
>> +                                            errno);
>> +                               igt_assert(is_xe_device(gpu_fd));
>> +
>> +                               test_card(gpu_fd);
>> +                               drm_close_driver(gpu_fd);
>> +                       }
>> +                       igt_waitchildren();
>> +               } else {
>> +                       test_card(xe);
>> +               }
>> +       }
>> +
>> +       igt_fixture
>> +               drm_close_driver(xe);
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 2724c7a9a..a6750d523 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -285,6 +285,7 @@ intel_xe_progs = [
>>          'xe_exec_atomic',
>>          'xe_exec_balancer',
>>          'xe_exec_basic',
>> +       'xe_exec_capture',
>>          'xe_exec_compute_mode',
>>          'xe_exec_fault_mode',
>>          'xe_exec_mix_modes',
>> -- 
>> 2.34.1
>>
> 

