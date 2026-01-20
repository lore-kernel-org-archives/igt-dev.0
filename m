Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DF9D2ED0F
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E0B210E234;
	Tue, 20 Jan 2026 04:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NnzyfSGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEE8410E234
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768881918; x=1800417918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PkckNATVU9TBf/UQ4vAHrfRZltnLZtc6rEkVb1HNPKE=;
 b=NnzyfSGPa+FaWK55/oKtRUFnAz9urJecLm2YoG2zZ5WayREGqwPLVTJ4
 ZxEwMA02soR88KMx1xDE9SAv9L1BizS6Hw1TC0l8qQ4kTPL4jdzk8RM2g
 7QILPheuAW1B84+ag99ndfu2y33BoR5hEg1q68x0S8nelSEMsIInz3L3U
 1uG5FrZ2m6PBy/8RcMyazoJo3Lm1VqR//oPargNHqQ4S5UQg7+Dfyfxz7
 xM335qvKo4X7yycXisH3kpZh8Numg6Z6EyI8DbRUphM2G5htYPKhNxDDo
 We9aWe22KZmuxnxzJHw1mfAsSgIgrPu11uyKy0kP1ahI1uYjDe+3ktgjI Q==;
X-CSE-ConnectionGUID: 6lReFLecSnWsdOVpr4XOGg==
X-CSE-MsgGUID: GVL3PK8sSNe4OUP4HD4oVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95558232"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="95558232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:05:18 -0800
X-CSE-ConnectionGUID: Wy4AfFMhRJyXpxki+OFJcw==
X-CSE-MsgGUID: /VlF2xOzRWq9c3cZc2/1iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="243600352"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:05:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:05:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 20:05:16 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:05:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g2cbl+53vsreNxax6OQoTYrck4EkaQrwazvFPWB8CvzgrGrwTvwUuaectLXxdjlAumtkuCdQ209tybLemGGtsbN+sbD+EcZPfFa2sPsprf7lD6pvG/7lwL121rJLAbqBhnFSLcplB8xiRFM3FbJKvZCXiEDCmrlHVxFwiq3tYFlPJxg7Ji/oN4NYIYknU9Ez/mT0tOYY6tvIBJuIPnlQwDmUHWmCLuXFPDEkxo8zJCeCxCivMhRTc4cpNkw9bwezYRi2qRMysOiYOHQRNHpUjGlKvh8/OgaseGQTqDdEfLdeTgY0kqUvQO+QJ+AYM8sXRs8clOBhMrGdQY5GglUvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zDnBBNayL2yIdGR6/H8IgiI+RJzCO/w89ah9yOPI3Q=;
 b=Ydw52y1zQ2XmVx6AKRAQ8Tb3nggqzX9q/0eIRuo7qOErTw231pE5k5MVTspCULlE8FMX6qLByO3y5cz6q6PfOn3leLc9SHCB3u/oSPM4UHqcYXqzfo5EuRe2V75S9nv2loGE1NbfKndV03bQvNSpqvlQUaQoKTD43Uszk+mAKbtGm/NvG0agDR4lVFFb/Ty3IoPmm6qbCSmb3Ctgsf8GTOfqcEdviPS7RYeYvKPTFAFdppwtWLCw4q3agYAQu0T2BUd8snXLpC4bjiaCVUVc2RxwuYb7FL72NyiFRPEYB/o+OHo5oOVZIbC+Yv+aW/SI8Tx1oZAIQPjmHKXzCGsE6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN2PR11MB4566.namprd11.prod.outlook.com (2603:10b6:208:24e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.9; Tue, 20 Jan
 2026 04:05:14 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:05:14 +0000
Message-ID: <9c613a62-a076-43a0-8974-0b0a1cffa46b@intel.com>
Date: Tue, 20 Jan 2026 09:35:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_explict_fence: Add Test for Explicit
 Fencing
To: S Sebinraj <s.sebinraj@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <carlos.santa@intel.com>, <jeevaka.badrappan@intel.com>,
 <krzysztof.karas@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
References: <20260114082323.2534785-1-s.sebinraj@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260114082323.2534785-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0216.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN2PR11MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ce5a203-9a3d-4562-f525-08de57d91cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|42112799006|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0o1SHdHamorNFEwaU1rZVhkMXJCbFczVHREajdybHY4RFBYYXFab2REWmJ1?=
 =?utf-8?B?TnhXVERDSVdDWXlZQlZXdWdZMDNSeXpjNmFtb3ZodXcvWDZwa2xBTk9ySUQz?=
 =?utf-8?B?MEwrVTMrU2p6S3lGVHJEWTk5dm9kMlBwV1hnNXpOM0F1bGFXeEFqQmx0dW8y?=
 =?utf-8?B?bTVoa29DQnFscFowdzdHZU8yVTJ4YldpbnN1MC85ZDNpM00ydDZySGkzMFAv?=
 =?utf-8?B?QnRNYUgwZWpXMWZxdTlzTTBDajZ0OU9vYU9ZVFhyd1J5Sk52MHNQQnZKaEdi?=
 =?utf-8?B?aTV0V3dzNjJadXNxSWRXdW1MR082V09qVlhrWkRpVTg0WlhFRkZKYUFVVVNO?=
 =?utf-8?B?cEovOWZIYlgycHdwbStuSFhsYkFTM1FsVDNIV3VIUjk0SDlRbjdpZmhEMEhD?=
 =?utf-8?B?RUtxQVY2OW5KR3MxVWRxQU8vSWJWYXNCaG5LOFhHQ2sxQjhSL2d2TjNOSFdF?=
 =?utf-8?B?UlQ3djdKbzM0OUdIUld3TlFFVjlDSFU1WU9LRGJzSngxQ0hVckRJUENjZjg2?=
 =?utf-8?B?SlBrM1lvbDYwZ3REc0VQVWFpMWV6YUxwYlY1ZmY5Rk9ueWtyOGZFaU9xNlB3?=
 =?utf-8?B?anlVV1VQZlIxR0FZelBVVEFZelpsNGluV1JCR2ZGWndTcXRlQWFJYnBDSFFW?=
 =?utf-8?B?M3QyNEVZOUpBWVE3L2tFT1hCYVBNcThscUNyRTNZUkRBUWRna2ZTaG5lSlBB?=
 =?utf-8?B?RTd2b0g1R3lieEs0aTlwbnFpejlEelpQTlgza0lyWUhxV0FQUjVqVzJwVFdw?=
 =?utf-8?B?RDVnK3FtOU5IcTc2c203TEhiY1A4NVNWYTkzSXF6WUZuTWxzUEFqVnQxamVR?=
 =?utf-8?B?b0VPR2FSU21GT2lzYURIeUJZRE9WUkI0SUhUdWsrRHJRQkROWlI1SkRsVytV?=
 =?utf-8?B?d0d4SEhiN0hPRXhoU0hhRUNWdEpXY0I3NE44TTRRbmswWUdjL1lkajZHdzhT?=
 =?utf-8?B?dmR5SWNxZGlETE5xSEdXVGd5ZTBBb1BVamdCVDMzSFp2UWVwM1gwNEUvaW9C?=
 =?utf-8?B?VVdUT2tWVmFVSnlqQ01MUEx6Y0pJWDBodkM3OFBMKzhuREFqdkFFL1plMDFQ?=
 =?utf-8?B?eGdKcTZRSTQxcEpXZmtZcHB3SG1ncklUaFB6cHBzNjl0emNoQ1BIZzUrVm5y?=
 =?utf-8?B?WmMvMU1FNGhlbXhXbURHdTRuREFOYW1yNkRGQzdXTFp2dGVnZGowbHFxdi9h?=
 =?utf-8?B?M0FYdGNPdmRCSjNRLzZXMVdOS1J1VUg4UUdTRWZyQlp3Y2VqYjZBN1VmVjdX?=
 =?utf-8?B?R0JMQm5nbTNTNEU2UmttTUtHWkptUllQVEhxUHUyRXdvMExvYkpCY1BPc2lS?=
 =?utf-8?B?UGd0aXFla1lhcDFQRHpXemE5Ynd4NUpneFRHUDR4SnVJQ0FMdXdJU3kwNHFu?=
 =?utf-8?B?UE5OMjFxRXRBZklQSnN5ZnViZUhnVUxSWjh0K1VSZUVSUm52ZWNjYkZwbS94?=
 =?utf-8?B?c0J6RWtDSFJMR2Z6dit0MkVRVFlEU1BnS09nZ0g2YnZRRC9nOVZDRVg2MzI3?=
 =?utf-8?B?VVFiaDlNWkRPNHN2MDlwZnVhZkRWU3FpSGN5OHRUdGIrVzFacGpEVTN3RHFz?=
 =?utf-8?B?S1Y2R3ZOanNSNUVGWkhSejZjSGhoQmgvQlhVMVI1WXJXSnpDR0NQSVlpMC9H?=
 =?utf-8?B?OGN2T2cvdllBaWhvVDBqREtHTElJY2xhWDlINzNBcEkxcUx5Um4vbk5oVmtq?=
 =?utf-8?B?UWRpWGoveUlEcWtvY0I5Wk9BUGpkVy9EV1lWVzdDV3ljZldONmtsRjl1ZzFL?=
 =?utf-8?B?M2crSW9kdWFPMXNFb2w1Vm1TU1I0YURTUTNua2xLdi9PWGlzUWNjc1hWODJl?=
 =?utf-8?B?MHB0OUtuM1BQSE5QeVcyM3JoTDZDZ1hsb0FEZkd3eTB4Zmc5aVphZ1RZMmRJ?=
 =?utf-8?B?cWNuQ1BnSjlSck9qTDhwMXFxNWtZaTR6RnlRMXZwdm15WUptSmIyZE0wcHR6?=
 =?utf-8?B?SHZuK09ZRDlwQVVVenVRZjRHSndOUC83MXVoZ2ZsbXR3b2hhWm01c29DeVdG?=
 =?utf-8?B?VGV3SWlCQzJ4YWQvY1VTc282WVZnOXNSSUlMcGJkaWpiSzA1RTNxTDBZOFFw?=
 =?utf-8?Q?06riOm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vkp5dFNEVVQzUU9uYjR1Q0ZXQVdOY0tHK1VhN25LVWdtUXNTekMrVjZvbHkx?=
 =?utf-8?B?bDNvREd6MVU0ODU3eXZuTEEvcXV4K2N4bWZ6ZUM3UFF0bjBmNEJKbHVQSFdJ?=
 =?utf-8?B?aVZaYWpub0k3SW1WN0RnNnVNTDZKNCtlZTZFL3I5ZXlZVHpiNmdJUW0wcFhS?=
 =?utf-8?B?MTF4eTZsVEQ5bVMxOFluZWJwc0NsRXlWc1VlZkg5QWZxeEpSd3RXaUNNS1Bx?=
 =?utf-8?B?RXZGeDA4SFQwZHY2blMxdVFxR1dFYXBGNTdHWTl0UGRQRDliMWVMV0tkd2Y1?=
 =?utf-8?B?SGREa0FKTXJ0cWhweEtLOE91QkVSVWRUOHVCQ1NSOWMvcHNlZzQ4azk2ZWJJ?=
 =?utf-8?B?NGU5blZRTm9aZUlCT0FhOTFtcFpvTmM4K1dTM3psdDFWczNTUEdOdHhMYXFa?=
 =?utf-8?B?MllTZXV0blArQTF0dmQyRjdZQldLWW93VUFGZ09Tb1pVckZsbE0zQ2YrUHN6?=
 =?utf-8?B?OTRHSDBnNDRYTTlCYUo3ZC9IR0NIY3NFK3N5UlVDQWtaU1kyL0dzM05Xa3R5?=
 =?utf-8?B?ZVoxbkk5N3R5dUVZL3RRSE16UDh4UVVwclZNeDFVenRUN1laZE0yaWtPd3JK?=
 =?utf-8?B?czJ1Unl3ZlFvQm9pc01ENkg0eEovbWwwcEFISTgyeWJwTGExeEp1VXZtYWhM?=
 =?utf-8?B?ZWhPNFZCUlRzSTJpVVduZ1JjcUo2QzdPQ2haUmZFcUFmd3FKSjd5OGxxSlpy?=
 =?utf-8?B?T3dJWnNUZVRKV0ZiUG9DQmdQbEFOU3VFZmgvVzFKdTNud01kT2t3UjhJbStR?=
 =?utf-8?B?Q1V0TlhiaUJCYm5yUkQyNXRuZDMwQ3FJcTcwS2xrK3NMMkQ1WHlwVFdacmJa?=
 =?utf-8?B?dWhjU1NYWk9id0dGN0x4QjhJQ0sxQUNGMzdNakJOVWpRNW1YUVIwdDZrR0Fl?=
 =?utf-8?B?L25mVTJLcnV6Tk9oTUtqM3JkTkp3U045a1lsTEhUY2VaYUJvc0FNbnpwa0tC?=
 =?utf-8?B?dUJXbUtRVjJQdjRFRG4yWGxOWWt4NnVCaGJxYnNxZmIwalFPMWFNMFJ3UWlE?=
 =?utf-8?B?UnVFQkhYREFFOE8xMS9UNlJ1Q0YvNFNVM21LS2VsVU9Bbmlsa3JJYmkvbmZK?=
 =?utf-8?B?ZHlBZ1YzU3pSL0YvNWZUZnhab0FlaFAzSU8vd0tGbCtGZU1yNkF0MDl0MGRL?=
 =?utf-8?B?NG5DU2toa3lQOUwvTHh3am9JUmN2VkxTU3V6OEVYVEVUTUdLS1kzNEJDc3R0?=
 =?utf-8?B?VW1oU2FOLzhBYVBlTFBuSitmNGhJQWlDekNkbTNUbUlXTkhyRXVsdEE4Q2NO?=
 =?utf-8?B?eXFLNVh4UklmY1I1MmQ2ZHpkdlZlZEZjS0tsVVU2SnVDMmJSODM0M2l2alRM?=
 =?utf-8?B?eGdyL245aElvUXQ2QnJvbWpPM1VaMEZtM0E4WmdXdmxXYUZXd09majdNSjhF?=
 =?utf-8?B?bVo0NFhwWXdMVVRCQ2tYejVUM0J4NVlOSHAvcXEvTTl4NlJSZTBhd3VoT3FV?=
 =?utf-8?B?Rzl4RTVPYlBjRnhVOHlNcVhDRXpicm5tSUE2eU1yZnBtaGZRU3VkYis2WUpm?=
 =?utf-8?B?aW83aG55SzZIQ0dYQ2g1bm55SXMwZUEvTXJQM3dNZS9OMEI3RVlTaEtmVlRC?=
 =?utf-8?B?VUw1ZDkyRzRBdVY3M0RPaFI3RXFqSHNpaCtUQWlSWmMwQVBmdGMyNTNibnJu?=
 =?utf-8?B?VlVOY2Nla2xiTkMvT1NKZFUwYSt1NWxMQzFHSXIyNXM2enh4bzFJRWJhdVhr?=
 =?utf-8?B?aHhEOExSZTAvbzNFL3hTVEFvNGMxTnFhVnRuSzlCOHkwUUFHcndxYjIxbjlI?=
 =?utf-8?B?dTlkRUlNeTg5d2J3bm9kbVdpSWZGVkZRZ09GVzJxV1F3ejVQWmt3QVh3MEx2?=
 =?utf-8?B?dFVEUVhHcjNXcitEV2o3SVdUZHZiL3Z4WDFLQ25HK1MycnZnK0lleS9lMGVY?=
 =?utf-8?B?QjlXeHQrMlRXQm9hRFhsK3VHa2pBZ0tNQjBlVjE0R1ArMHBZbVREV25FM29D?=
 =?utf-8?B?cS93ajhtTFlndzkzOFViTUFid2lwTHU0bHY4NFAzV0Z1TFZaYjJ3aTF5WDlY?=
 =?utf-8?B?T0U1VGZLbzVHcFNvdnpmU3N0dWdsTmZaZGFaRGNKNHRpVmZDZndRMWY0YURv?=
 =?utf-8?B?TGluZXlpYU9ZbGYzcC9FYU81eDdDWXp4djBWRFhlN2w2WThpaDBRbzhaZjl6?=
 =?utf-8?B?aDF4eEFCSEloaXltQWJZMGo2czZMeE05TnZ5ZlVWaFlNQ1FkMWV0T251amwv?=
 =?utf-8?B?enNsRWNqSFhmU1JCTDgveTBDMkdWellNNTZvZkUxTlFiYVpWb2ZVTi9uWTVy?=
 =?utf-8?B?TXhlaVc1UUlMV1dlQ1hoNFBScGhHODNCcm56NkJ3TEhVQkRDWVUxK2dBQTBu?=
 =?utf-8?B?RW8rODNKU1BHdC9SUk02TlczQjRxb0Zzb0crajN6eDVxUjZMR0tDZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ce5a203-9a3d-4562-f525-08de57d91cc8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 04:05:13.8713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6erA4hdaYkJJ/+uhpEZZCziYx561wrJgMomGx7X6iS0bD+RTYex7wsXZpTuBSmwsDbsOXD4RHvNWdqs69NjJ9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4566
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

Hi Sebinraj,

On 1/14/2026 1:53 PM, S Sebinraj wrote:
> Add a new test to validate explicit fencing.
> This test handles multiple planes in a single atomic commit.
> This test addresses a critical scenario where drivers must correctly
> synchronize planes with mixed fence states.
>
> Test Scenario:
> - Creates three planes: one primary, two overlay
> - Attaches fences with different states:
>     - Primary plane:   signaled fence (simulating completed GPU work)
>     - Overlay-1 plane: signaled fence (simulating completed GPU work)
>     - Overlay-2 plane: unsignaled fence (simulating long-running GPU job)
> - Submits all planes in a single atomic commit with IN_FENCE_FD set
> - Validates that display waits for ALL fences before updating ANY plane
>
> Bug Detection:
> This test catches driver bugs where:
>   - Planes with signaled fences update prematurely before unsignaled
>     fences complete, breaking atomic commit semantics
>   - Fence states are mismanaged across multiple planes causing visual
>     glitches or corruption
>   - The driver fails to wait on all IN_FENCE_FDs atomically
>
> The test uses sw_sync timelines to create controllable fence states,
> allowing precise validation of fence synchronization behavior. An
> OUT_FENCE_PTR is requested to monitor when the display update actually
> completes, enabling detection of premature updates.
>
> Implementation Details:
> - Uses sw_sync for creating fences with controlled signaling
> - Monitors OUT_FENCE to detect premature display updates
> - Validates atomic commit integrity across multiple planes
>
> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
>    of explicit fences when provided two or more buffers at once,
>    with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>    https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>    use of explicit fencing in the KMS Atomic Modesetting APIs.
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>   tests/kms_explicit_fence.c | 372 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 373 insertions(+)
>   create mode 100644 tests/kms_explicit_fence.c
>
> diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
> new file mode 100644
> index 000000000..d3cad5904
> --- /dev/null
> +++ b/tests/kms_explicit_fence.c
> @@ -0,0 +1,372 @@
> +/*
> + * Copyright © 2026 Intel Corporation
Please use SPDX licence, please look into the recently added tests which 
uses them.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +/**
> + * TEST: kms explicit fence multiplane
> + * Category: Display
> + * Description: Test explicit fencing with multiple planes and mixed fence states
> + * Driver requirement: i915, xe
> + * Mega feature: General Display Features
> + *
> + * This test validates correct handling of explicit fences when multiple planes
> + * are updated in a single atomic commit with different fence states. This is
> + * critical for catching fence synchronization bugs where the driver might:
> + * 1. Prematurely display buffers with signaled fences before unsignaled fences complete
> + * 2. Mismanage fence states across multiple planes causing visual glitches
> + * 3. Fail to wait on all fences atomically before updating the display
> + */
> +
> +#include "igt.h"
> +#include "igt_aux.h"
> +#include "sw_sync.h"
> +#include <errno.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/eventfd.h>
> +#include <poll.h>
> +
> +/**
> + * SUBTEST: multiplane-atomic-fence-wait
> + * Description: Test 3 planes (1 primary, 2 overlay) with mixed fence states:
> + *              2 planes with signaled fences and 1 plane with unsignaled fence.
> + *              Validates that display waits for all fences before updating any plane.
> + */
> +
> +/* Test configuration macros */
> +#define NUM_PLANES 3
> +#define PLANE_PRIMARY_IDX 0
> +#define PLANE_OVERLAY1_IDX 1
> +#define PLANE_OVERLAY2_IDX 2
> +#define OVERLAY_COUNT 2
> +
> +#define FENCE_TIMEOUT_MS 2000
> +#define VISUAL_DELAY_US 500000  /* 500ms for visual observation */
> +
> +#define OVERLAY_SIZE_DIVISOR 3
> +#define OVERLAY1_POS_X 100
> +#define OVERLAY1_POS_Y 100
> +#define OVERLAY2_OFFSET 100
> +
> +typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	igt_plane_t *primary;
> +	igt_plane_t *overlay1;
> +	igt_plane_t *overlay2;
> +	struct igt_fb primary_fb;
> +	struct igt_fb overlay1_fb;
> +	struct igt_fb overlay2_fb;
> +	drmModeModeInfo *mode;
> +	int width, height;
> +} data_t;
> +
> +static void setup_output(data_t *data)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		data->output = output;
> +		data->pipe = pipe;
> +		data->mode = igt_output_get_mode(output);
> +
> +		/* Get planes */
> +		data->primary = igt_pipe_get_plane_type(
> +			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_PRIMARY);
> +		data->overlay1 = igt_pipe_get_plane_type_index(
> +			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OVERLAY, 0);
> +		data->overlay2 = igt_pipe_get_plane_type_index(
> +			igt_crtc_for_pipe(display, pipe), DRM_PLANE_TYPE_OVERLAY, 1);
> +
> +		data->width = data->mode->hdisplay;
> +		data->height = data->mode->vdisplay;
> +
> +		/* We need at least OVERLAY_COUNT overlay planes for this test */
> +		if (data->overlay1 && data->overlay2)
> +			return;
> +	}
> +
> +	igt_skip("Need at least %d overlay planes for this test\n", OVERLAY_COUNT);
> +}
> +
> +static void cleanup_crtc(data_t *data)
> +{
> +	igt_display_reset(&data->display);
> +
> +	if (data->primary_fb.fb_id)
  igt_remove_fb already has the check for fb_id, so these checks could 
be removed.
> +		igt_remove_fb(data->drm_fd, &data->primary_fb);
> +	if (data->overlay1_fb.fb_id)
> +		igt_remove_fb(data->drm_fd, &data->overlay1_fb);
> +	if (data->overlay2_fb.fb_id)
> +		igt_remove_fb(data->drm_fd, &data->overlay2_fb);
> +}
> +
> +static void create_fbs(data_t *data)
> +{
> +	int overlay_width = data->width / OVERLAY_SIZE_DIVISOR;
> +	int overlay_height = data->height / OVERLAY_SIZE_DIVISOR;
> +
> +	/* Primary plane - Blue background */
> +	igt_create_color_fb(data->drm_fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, /* Blue */
> +			    &data->primary_fb);
> +
> +	/* Overlay 1 - Red square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 0.0, 0.0, /* Red */
> +			    &data->overlay1_fb);
> +
> +	/* Overlay 2 - Green square */
> +	igt_create_color_fb(data->drm_fd, overlay_width, overlay_height,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 1.0, 0.0, /* Green */
> +			    &data->overlay2_fb);
> +}
> +
> +/**
> + * multiplane_atomic_fence_wait - Test atomic commit with mixed fence states
> + *
> + * This test reproduces the critical scenario where multiple planes are updated
> + * in a single atomic commit with different fence states. The key validation is
> + * that the display does NOT update any plane until ALL fences are signaled.
> + *
> + * Test setup:
> + * - Primary plane: buffer with a signaled fence (already retired)
> + * - Overlay 1 plane: buffer with a signaled fence (already retired)
> + * - Overlay 2 plane: buffer with an UNSIGNALED fence (long-running operation)
> + *
> + * Expected behavior:
> + * - Atomic commit succeeds immediately (non-blocking)
> + * - Display waits internally for ALL fences before updating
> + * - No plane shows its new buffer until the unsignaled fence completes
> + * - After signaling the last fence, all planes update atomically
> + *
> + * Bug detection:
> + * If the driver has a bug, it will either:
> + * 1. Show the primary and overlay1 buffers prematurely (before overlay2's fence signals)
> + * 2. Cause visual glitches from fence mismanagement
> + * 3. Fail the atomic commit
> + */
> +static void multiplane_atomic_fence_wait(data_t *data)
> +{
> +	int timelines[NUM_PLANES];
> +	int fences[NUM_PLANES];
> +	int ret;
> +	int out_fence;
> +	igt_plane_t *planes[NUM_PLANES];
> +	const char *plane_names[NUM_PLANES] = { "Primary", "Overlay1", "Overlay2" };
> +	bool should_signal[NUM_PLANES] = { true, true, false };
> +
> +	igt_debug("Starting multiplane atomic fence wait test\n");
IMHO, this(& most of the below igt_debug statements) do not add any real 
debug value. Please consider dropping most of them unless it is clearly 
helping in failure diagnosis.
> +
> +	igt_require_sw_sync();
> +
> +	/* Initial modeset to establish baseline (no fences) */
> +	igt_debug("Setting up initial display configuration...\n");
> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
> +	igt_plane_set_fb(data->primary, &data->primary_fb);
> +	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay2_fb.width, OVERLAY1_POS_Y);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	igt_debug("Initial display setup complete\n");
> +
> +	/* Setup arrays for loop-based processing */
> +	planes[PLANE_PRIMARY_IDX] = data->primary;
> +	planes[PLANE_OVERLAY1_IDX] = data->overlay1;
> +	planes[PLANE_OVERLAY2_IDX] = data->overlay2;
May the above part could be a separate setup function so that the test 
function is easier to read. Not a must have, good to have.
> +
> +	/* Create timelines and fences for all planes */
> +	igt_debug("Creating timelines and fences for %d planes...\n", NUM_PLANES);
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		/* Create timeline */
> +		timelines[i] = sw_sync_timeline_create();
> +		igt_assert(timelines[i] >= 0);
> +
> +		/* Create fence at sequence 1 */
> +		fences[i] = sw_sync_timeline_create_fence(timelines[i], 1);
> +		igt_assert(fences[i] >= 0);
> +
> +		/* Signal fence if needed (first 2 planes) */
> +		if (should_signal[i]) {
> +			sw_sync_timeline_inc(timelines[i], 1);
> +			igt_assert_eq(sync_fence_status(fences[i]), 1);
> +			igt_debug("  %s: fence SIGNALED (fd=%d)\n",
> +				  plane_names[i], fences[i]);
> +		} else {
> +			igt_assert_eq(sync_fence_status(fences[i]), 0);
> +			igt_debug("  %s: fence UNSIGNALED (fd=%d) - blocks commit\n",
> +				  plane_names[i], fences[i]);
> +		}
> +
> +		/* Attach IN_FENCE_FD to plane */
> +		igt_plane_set_fence_fd(planes[i], fences[i]);
> +	}
> +
> +	/* swap overlay colors to see visible change from the previous scanout*/
> +	igt_plane_set_fb(data->overlay1, &data->overlay2_fb);
> +	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
> +	igt_plane_set_fb(data->overlay2, &data->overlay1_fb);
> +	igt_plane_set_position(data->overlay2, data->width - OVERLAY2_OFFSET -
> +				data->overlay1_fb.width, OVERLAY1_POS_Y);
> +
> +	/* Request OUT_FENCE to track when display update completes */
> +	igt_pipe_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
> +
> +	/*
> +	 * The atomic commit should succeed immediately (NONBLOCK mode),
> +	 * but the display should NOT update any plane until ALL fences
> +	 * (including the unsignaled overlay2 fence) are signaled.
> +	 *
> +	 * A buggy driver might:
> +	 * - Show primary and overlay1 immediately (wrong!)
> +	 * - Cause visual corruption
> +	 * - Fail the commit
> +	 */
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_NONBLOCK,
> +					    NULL);
> +	igt_assert_eq(ret, 0);
> +	igt_debug("Atomic commit SUCCEEDED (non-blocking)\n");
> +
> +	/* Get the out fence to monitor completion */
> +	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
> +	igt_assert(out_fence >= 0);
> +	igt_debug("Got OUT_FENCE_FD=%d to monitor display update\n", out_fence);
> +
> +	/* Verify overlay2 fence (last one) is still unsignaled */
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 0);
> +	igt_debug("Overlay2 fence still UNSIGNALED - display should be waiting\n");
> +
> +	/* Verify out fence is also unsignaled (display hasn't updated yet) */
> +	ret = sync_fence_status(out_fence);
> +	if (ret == 1) {
> +		igt_warn("OUT_FENCE already signaled - this may indicate the "
> +			 "driver is not waiting for all IN_FENCEs correctly!\n");
Shouldn't we be already asserting here? no point in the test going ahead?
> +	} else {
> +		igt_debug("OUT_FENCE still unsignaled - display correctly "
> +			  "waiting for fences\n");
> +	}
> +
> +	/*
> +	 * Wait a moment to ensure the display really is waiting.
> +	 * In a buggy implementation, the primary and overlay1 planes might
> +	 * show up prematurely during this delay.
> +	 */
> +	igt_debug("Waiting %dms to verify display doesn't update "
> +		  "prematurely\n", VISUAL_DELAY_US / 1000);
> +	usleep(VISUAL_DELAY_US);
The visual verification(if required) should be a command line option 
passed which can be enabled when required and be disabled by default, as 
on CI this manual verification will not be done. Instead can we add a 
CRC check here to verify there is no visual change?
> +
> +	/* Check if out fence signaled prematurely */
> +	ret = sync_fence_status(out_fence);
> +	if (ret == 1) {
> +		igt_critical("BUG DETECTED: OUT_FENCE signaled before "
> +			     "overlay2 fence was signaled\n");
> +		igt_critical("This indicates the driver updated the display "
> +			     "without waiting for all fences\n");
> +		igt_assert_f(0, "Display updated prematurely before all fences signaled");
> +	}
> +	igt_debug("Display has not updated yet (waiting for overlay2 fence)\n");
This should be just igt_assert_f(ret == 1, <>)
> +
> +	/* Now signal the blocking fence (overlay2) */
> +	igt_debug("Signaling the blocking overlay2 fence");
> +	sw_sync_timeline_inc(timelines[PLANE_OVERLAY2_IDX], 1);
> +
> +	/* Wait for overlay2 fence to be signaled */
> +	ret = sync_fence_wait(fences[PLANE_OVERLAY2_IDX], FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(fences[PLANE_OVERLAY2_IDX]), 1);
> +	igt_debug("Overlay2 fence now SIGNALED\n");
> +
> +	/* Now wait for the display update to complete (out fence signals) */
> +	igt_debug("Waiting for display update to complete (OUT_FENCE)\n");
> +	ret = sync_fence_wait(out_fence, FENCE_TIMEOUT_MS);
> +	igt_assert_eq(ret, 0);
> +	igt_assert_eq(sync_fence_status(out_fence), 1);
> +	igt_debug("OUT_FENCE signaled - all planes updated atomically\n");
> +
> +	igt_debug("TEST PASSED\n");
> +
> +	usleep(VISUAL_DELAY_US);
Same as above, should be a CRC check and an optional manual visual 
verification.
> +
> +	/* Cleanup: close test-specific resources (fences and timelines) */
> +	for (int i = 0; i < NUM_PLANES; i++) {
> +		close(fences[i]);
> +		close(timelines[i]);
> +		igt_plane_set_fence_fd(planes[i], -1);
> +	}
> +	close(out_fence);
> +	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
> +}
> +
> +static void test_fini(data_t *data)
> +{
> +	/* Reset display state */
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_plane_set_fb(data->overlay1, NULL);
> +	igt_plane_set_fb(data->overlay2, NULL);
> +	igt_output_set_crtc(data->output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +}
> +
> +int igt_main()
> +{
> +	data_t data = {};
> +
> +	igt_fixture() {
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
Why do we need this to be specific to intel?
> +		kmstest_set_vt_graphics_mode();
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +
> +		setup_output(&data);
> +		create_fbs(&data);
> +	}
> +
> +	igt_describe("Test atomic commit with 3 planes (1 primary, 2 overlay) "
> +		     "where 2 planes have signaled fences and 1 plane has an "
> +		     "unsignaled fence. Validates that display does not update "
> +		     "any plane until all fences are signaled, catching bugs "
> +		     "where drivers might prematurely display buffers or "
> +		     "mismanage fence synchronization across multiple planes.");
> +	igt_subtest("multiplane-atomic-fence-wait")
> +		multiplane_atomic_fence_wait(&data);
> +
> +	igt_fixture() {
> +		test_fini(&data);
> +		cleanup_crtc(&data);
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.drm_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 0ad728b87..a61395332 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -35,6 +35,7 @@ test_progs = [
>   	'kms_debugfs',
>   	'kms_dither',
>   	'kms_display_modes',
> +	'kms_explicit_fence',

Please keep this in alphabetical order.

Regards,
Karthik.B.S
>   	'kms_dp_aux_dev',
>   	'kms_feature_discovery',
>   	'kms_flip',
