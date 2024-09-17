Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81547C3ABD7
	for <igt-dev@archiver.kernel.org>; Tue, 17 Sep 2024 05:06:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC3D610E40A;
	Tue, 17 Sep 2024 05:06:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlJOBOyb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5294E10E40A
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Sep 2024 05:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726549579; x=1758085579;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XX94dmKjmdeSNbKhFbO7WXuCJrkz6NlU+4Zj1mXUzmk=;
 b=FlJOBOybclfXn8cVlNysDjAmrPmSYHnIdxXdWLOhjAmzT4K//xmT1/73
 pRpjJSepY0NMy7qbTKHJ6jKzEhEXc2+3A2TS/kz8U7ItU4FIlU7LqI/ZV
 3rvuI3bhkala02THDlbfaISjlT5m76zSJnh4HGOYwlrHWcfAZfwBhNDRy
 aa9YaC7XmNOliPArh9jqb9xemmbwppPLlWBFDOhDGop1S2fFYKBVZ8LuX
 rkg7lsnFbfKKY1eiMwU+pbp6X0U7U8GYIZoXONM68a6/UVyBF9PkEr7w/
 mrwgYB/vWlcOrpLRFIbX6pNdZec/yWAkzOEsjAYI03xXHry+wg5CYf5Jb w==;
X-CSE-ConnectionGUID: nM2Oyc/dQnmkqJgv8iP0uQ==
X-CSE-MsgGUID: 41Cu4iGIQqyP6ewbhGlzoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="36771030"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="36771030"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 22:06:19 -0700
X-CSE-ConnectionGUID: rpx9vVHZQAe5TXH33O3o2A==
X-CSE-MsgGUID: 9vl1fsCYS06mlCarZXdZww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="73835949"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Sep 2024 22:06:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:06:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 16 Sep 2024 22:06:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 16 Sep 2024 22:06:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 16 Sep 2024 22:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dzQMn4s96CxS7ZUicK0oFMO3qQsTXgevaOtbYqcp9IvyaOdAlziUQzWDA8QAqAIfW2Yst/m04nWZQqJ9Y00ATVt4X6BUD7YtUStKOU5aR7bI6dgwZL14mONRx1YXRHShpNEL95KXD/2jOwLXiZy37cRK1uKiNZf7ZtexvrazjvH+5ktJGQtEhJDjqgB759RjXEmx0T8l/irlD89G86a7iHYJkl2NZpngKDUWfECYZSMSlE/ojG7CovZYjpcDfuyIpWJsQ7q6X+hyFcHer0fWgjhJV2AFjvddPdn9cDYB9G//U7uvZuei/RuHnsqZhWD/7EdAwwYnQaXRaNa8SXvt8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7iyESgEDlHrincZxGv2B6PgiWDafHg03gv8hOqA32I=;
 b=PcLX9VcTw452LofnbgWrJ19MA2bld9FT0oTK4mJROsE7rCukZR8j3a8XE8znXKG2VtzG6PptQfUW7aloen90clW1UfvXp5Q3qyf96/fiyP+XNJhTtXnNeHA7eKaLWlJds75bFSz2QxRAmfXmqNmZpNvDIVTg2IZIjxQPE5iB+v1Mgexikg+SUXQHsgneilcBuoA3tRHSAOfk9FAoLdxqyDpnrlNZWe0CBQWJf6Z4/Qwby0APJ1LDSTCKFMH9TTDd5n8ULUEWeb3OHdj3+XWccqAoBDb7ZBObT9pqhLG+2a3SoV0Lv1T56y/K8kM2XzkIii534lQoiyMjrmDz/lrv+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 05:06:13 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 05:06:13 +0000
Message-ID: <ef73dc37-0556-47e6-8953-8c3ad3ca9140@intel.com>
Date: Tue, 17 Sep 2024 10:36:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] tests/kms_joiner: Add tests for Ultrajoiner
 validation
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>,
 <bhanuprakash.modem@intel.com>
References: <20240911072204.22825-1-karthik.b.s@intel.com>
 <20240911072204.22825-2-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240911072204.22825-2-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0050.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::7) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|PH0PR11MB4824:EE_
X-MS-Office365-Filtering-Correlation-Id: c408bd6a-3bb3-4c5d-c855-08dcd6d6737f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE11WDJEZGhzMllyMWNuQ1NVdEs0RXhZR1ZzZVNaVmF4RUt0aXU4UlJUVVcw?=
 =?utf-8?B?c1FZczJwbjZRYzVFcXp1aGdkT2tNL2x4Vkp1Qy9tS3h0aWdHQ0tGZy82WDdV?=
 =?utf-8?B?SkdIcWZZM2doUFV0TWdYNFBseWtPTWJpSFFsOXo4QXBOQnVBQWVHTkZOaDJv?=
 =?utf-8?B?N0V1SytYK0JqZjB5TXJCN2NManlOOW9pZHdXU1VKdXRqVlVxQjJ1UExmdUZW?=
 =?utf-8?B?c1hvWStkY3dGQXdwRXlocTJMSklUZ05OdlRTVHo1bFErcmVxeWZjTXcyS0Yr?=
 =?utf-8?B?WW5OaGFZQWNaczFvVVg4QzZsa0labFFHMGJ1WTN1R1c3UWp3Q2M1MTBVakhx?=
 =?utf-8?B?L0pjZGxHNWVOVXhSZkFZbzROWVgxZEk1aHhsdlRtVm5rc29QUUVNa3loeERX?=
 =?utf-8?B?NUowaldRRmtsTTNyMUdKREhiYjVZcG55c29jOXZ0cU1sNDAyOGZFVGswTXRv?=
 =?utf-8?B?aTZBMUE1SktONkFJRlMyWEQ2YTNPNWNROHl3YnZ2YzZ6WUMxVjd6YjR6aU00?=
 =?utf-8?B?TDlJSU5aQjNqWVp4aDY0Y21UbitnbGZXbHM0ZUduNFBla2VTTGlIcXd2U29X?=
 =?utf-8?B?L1p1QnhYaDB5Q1RjdHM5cit1OUJUbk4yb1A3OGgyR3I1d1NWOWh5Q0RoRExB?=
 =?utf-8?B?NVNnSjJnZDN4RzB1bmtuaDFCZVF3aHRvenhIMUcxeXc3elBQVGVhWDFVeitN?=
 =?utf-8?B?aitrWEZjemlmcUxaOUtacEJxQzZuZGVwZWJlb1E4OGVLeE5GRkdVUCtsNXFF?=
 =?utf-8?B?UGx3VW9WdjZXUUoyelB5M0d3eE9yT1Z2bkhrSjdOLzNnZllYRXJGeVc5NkN5?=
 =?utf-8?B?eUQ0ZVdZTktqaGxyUzk4ZGp5YVJoOG01cXdsQXVlVnBjTDVoUmJGQUY4eHBy?=
 =?utf-8?B?NEZzK04vUVducmhmUTFPdGVlNHg2bU1WTWUyQTU3c0g3amNiM2Q4Wk5MVG0w?=
 =?utf-8?B?RzJYR3hVWk5PNldqWmhoSTZtZVVrbmt6Ykl2MjVMeHFFMjFEUm8ySkQ2WGhk?=
 =?utf-8?B?Yjd3bnRSN3lqRVBCQUo0TEJ3eWlyUDBKOEVwOG1vWmxtSDU5T2Rvb216OGN6?=
 =?utf-8?B?NkQvKzFONDQ5OWRpcnBaSDdTejd5YW1pR21ySGEwQXhEZVR6cm1yVlVWdXZS?=
 =?utf-8?B?c2VvWlljeis1ZFYzY1F0cW8zSU9JU0tBa0VZYUFrc1VjblV4WGU3ZmVvYUJU?=
 =?utf-8?B?UG1pY25XaFdXcVpTdTBzL3lXdmJLaTlTWmtOUExjL1A3d0REQ1NiZWpqRHJQ?=
 =?utf-8?B?bHRPR2dqNmNWc1dtNEpMWlRTY1dZTmNYbFhPT2c0NUtIUkkzZUdOYllSSUcy?=
 =?utf-8?B?aldZRGViVVVvZXRsUkFDVC9zTUNqYzJNTGtZSVZDcFBqOHR6Wkp2NVJlSkx4?=
 =?utf-8?B?SVR2c1NZbmJuTDhJcFNrZU14R2QzY2ZJSHVydzA3K0RSVyt3KzlsYTR0NDdo?=
 =?utf-8?B?ZHpMQWZhRE1IbTc4d05MNnNoZHRVYzBRdlgxamZ2a1hDMXRveXV4cDFONkRQ?=
 =?utf-8?B?Z2lwYTdEYWVXMXI0Z0RYVFF1WVhjMWZZQmZyc0N1Mko2ZWg2bW5JNWFrMStz?=
 =?utf-8?B?aXFVTWl0SGdRTU9MWUVqNlJtdWNiRTdJWkZhSU8yd242OFo1a1VXMW0vdjMx?=
 =?utf-8?B?TEhMSlBzNjlnM24zSmJ3M3JJYmw1WFl6bFlBa3Q0Y0d0OVFYSnc0bFNDVTRJ?=
 =?utf-8?B?NnUwSmlXZjB0YVl5NlJwZlBqc0xQeU15dVIvdzJqS3V2K29RQ0JUa2NCYjVa?=
 =?utf-8?B?UE5IeC82STZPUWZWVk5UWHZVTDRJbHhuZlFaK1o3WU00OXlyR1lVZWNUWDZl?=
 =?utf-8?B?ME1jaCtRYVhhdys3SitaZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXFncVhCakxtWEhpaXlUUXlaMlYxK2pySFo3R2NCR1V1VXl2MDFFbmhJcTFx?=
 =?utf-8?B?ajBPNnFEMjlHUjh3M2RwS205dEQ1bTd4b0xQNGU1V3ZFUzRMc1IzYmFyUTgx?=
 =?utf-8?B?WVd1R05WRTNyOFBvYmFTUk1wVlFMMGNUZGN6R0FTdm9TbzFpWDkrb2dpMURr?=
 =?utf-8?B?Y0JjUXJlWHdZamZqUDlvRmw0T1JQdWtmUXNHek1ISHdkanFkSE1xc0hkNzRF?=
 =?utf-8?B?ZWpIbHhYaWlKM1paU0VJaDJmNWFtU2x6T1UvR2x2Y2lHTldTQTZKZlhsTTlD?=
 =?utf-8?B?enRYOTM3Zk91QXZ6TCtJMjhRMEhrcGdzY1hBZDB6eW9HVk1xVldtUzdlVmJm?=
 =?utf-8?B?REdHZzhGWHltU0g1WUxjREdGMHZsNXRTNTQ2SEhBb3FnS0o5cDZBd0pSOVhO?=
 =?utf-8?B?YnFIdEpIL28xRGc5aldOUjRRYWJjVTF2MHBpS0c3K3dZNkh2d08rcnFwYnpn?=
 =?utf-8?B?YXJIQjJsMDFXYklac2YwUm5PSmdqcTAyeWJCamFSQkVQSUp4QzU1VWRhRTVz?=
 =?utf-8?B?REFmTkw5SGhQR3FqUGdvak5kRGd1Qno1Sis5OUpiWDZSYlhzVGt3RnBjV1lG?=
 =?utf-8?B?S3ROYVh6OVZBMm16VHk1WkZhanNJQkk2TFpBVzRaaDUvRWxLemlPV2doWW9t?=
 =?utf-8?B?U05LVlBUdDVkTklGb3pjZjA2aHdFZU1yVVR1dGxTY2tpM3RzNzhCbFNyb1o1?=
 =?utf-8?B?alF5anREUEJXV2t1RFJkeExqOHBGTWRsdGtRNWZxQ25BSkw4aXZKaWR6dmVU?=
 =?utf-8?B?NnRkWDIxQVJoZGNlWUEwVFVGRTRWeUVBSTdtbzVLQnZZK1J5WDFrWkx6bHIy?=
 =?utf-8?B?bGhVWCszVWp2U1gwRUk0amZsMzVpQzVOMitYVGtFa2g5TjZCeXdqankxK1Rr?=
 =?utf-8?B?U3B2V1M5TGFzUmZURDVZZ2lYc252Nll2SXlFL2xXOWQ3eHA2Vy93VWFObS9q?=
 =?utf-8?B?WGx1YzNINTZaZUh5M1Q3WS9uMmdKZUE1MlBoR05tT3hTVDFvZm9Eci8zZFps?=
 =?utf-8?B?M0l1TmhHTzd6U2hXTS9FbHJ0emg2Z2xMWFhWSXpIdzY4OGNxQ0JqRG15N3Zh?=
 =?utf-8?B?Ty8xMXBBbDU0elV0SXN4V0Y0SnpTcXAzUWVoeEY1Z3k0Wm9JYVR0RlZ0MU1p?=
 =?utf-8?B?RFYxWnR6SForV25oNGZCYWJOZjdKSVdpNy84ZTNDSXMwTFMzNVpxeTA3SFA0?=
 =?utf-8?B?NHZZaDhPZHRzWjhxWTYvR3N2bFUvVFpzTm41cWo0ZEtwd003VDdsVU5iMUxq?=
 =?utf-8?B?MFpycUJacjhpZTBPRlJHMW1rUTJRakJqWFVjNno1a0pWVk8zY3lnWXV2NHlv?=
 =?utf-8?B?R1lvOGMvaE1wU2hMSGw3TjZVTU43VmF6Q2VhT3dPVXg3eENKVkIrWFF4VkIy?=
 =?utf-8?B?a3pJNGJMZW5UdHg2aHphN0VVUjRQK0o0SWVoSUlkWWhMQmpRWkhRbXZmWTdY?=
 =?utf-8?B?eVFtZ08veTlhY2tsSWpSd3FhSGtnSnUrVW9zNzJIR3BHRWRQSGo1dDJOZVhN?=
 =?utf-8?B?OXBmRC9JdUc3SWVCWjVUTTkyNW81V0w4MHBvV3BpQSt4SWJKTTJDd1ZJbUY0?=
 =?utf-8?B?N2Y3WkRQRVBFeURENDNHRlh3MngzbW4ycXdBN2tVQkNhNTZrM2p2V2xQR05x?=
 =?utf-8?B?MVhwSjh1Nnk2bDluK1pXVE53WEhSd0ZSZzZHMVBuWFI3TnVjUmtHekQ0R0lx?=
 =?utf-8?B?aStYemtTWmhaaFV1S3AyUWxBWXY3TUhBVDZPaDlidVhLN0NXR3E0YmFpbk5U?=
 =?utf-8?B?Zy9SYlNKTldsMmVpbURsaThUT0lSVXdTQ2hLa0tKbFE3bWdvUnZhUmxLbmpY?=
 =?utf-8?B?blB4T3RTVzdTNEtEbjhESTF0VlpKY0pRMERlaUQ2OUtLN2h6RU02YSttODBC?=
 =?utf-8?B?TGFkR1JKd01kNENyMmNmU3hWT1dGR2dnN25qamFZQUVaWmtoWHZvS2c1Mm9G?=
 =?utf-8?B?Mk9uNmNvaEl1ZVc4VGtlTVQwck5EZHFlVzVESHBnbi8vWVhsbmdzZEU4NHRG?=
 =?utf-8?B?a2JlSll4RHJDcHNwMWVlc0RIQXRHT1pVQ0lKOGdBUUpzemZLd3IzQ2l0S3NM?=
 =?utf-8?B?c1B5b1NWbjRoYTVFTUJyRHZDQVlHdDhIUWJsdFdiak9IbXc4amVEdXNuZkQy?=
 =?utf-8?B?anB6R0hwRGhrZ0ROR21BMTVKbUFzZkVxRVhHZ1VGTnphR0tFMjYySllSanQz?=
 =?utf-8?Q?bFjByrm9bqPwQMgVBVAuMrw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c408bd6a-3bb3-4c5d-c855-08dcd6d6737f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 05:06:13.2325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l/uKZIqtd8emUK+VYmYjF389cSkNlXoo4peuspgiFDMUto0WXDdO3gfTx4zD3O6MnzLGmaLnmfEvENZTEsuQRnGnPcE6+MTn6Pcp9G30xqmaUO82+2TXTJuSDlq0ml7B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
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

nit, IMO guard the array boundaries against overflow, otherwise overall 
changes LGTM.
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

On 11-09-2024 12:52, Karthik B S wrote:
> Add a subtest to validate basic ultrajoiner modeset and a negative test
> to validate invalid pipe configs during an ultrajoiner modeset.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   lib/igt_kms.c                                 |  44 +++++
>   lib/igt_kms.h                                 |   3 +
>   .../intel/{kms_big_joiner.c => kms_joiner.c}  | 150 ++++++++++++++++--
>   tests/meson.build                             |   2 +-
>   4 files changed, 183 insertions(+), 16 deletions(-)
>   rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (74%)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index dd530dbab..cf453dcfc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6347,6 +6347,50 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * igt_ultrajoiner_possible:
> + * @mode: libdrm mode
> + * @max_dotclock: Max pixel clock frequency
> + *
> + * Ultrajoiner will come into the picture, when the requested
> + * mode resolution > 10K or mode clock > 2 * max_dotclock.
> + *
> + * Returns: True if mode requires Ultrajoiner, else False.
> + */
> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
> +{
> +	return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
> +		mode->clock > 2 * max_dotclock);
> +}
> +
> +/**
> + * Ultrajoiner_mode_found:
> + * @drm_fd: drm file descriptor
> + * @connector: libdrm connector
> + * @max_dot_clock: max dot clock frequency
> + * @mode: libdrm mode to be filled
> + *
> + * Ultrajoiner will come in to the picture when the
> + * resolution > 10K or clock > 2 * max-dot-clock.
> + *
> + * Returns: True if ultra joiner found in connector modes
> + */
> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock, drmModeModeInfo *mode)
> +{
> +	bool found = false;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
> +	found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> +	if (!found) {
> +		igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> +		found = igt_ultrajoiner_possible(&connector->modes[0], max_dotclock);
> +	}
> +	if (found)
> +		*mode = connector->modes[0];
> +	return found;
> +}
> +
>   /**
>    * igt_has_force_joiner_debugfs
>    * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 25ba50916..4455632f4 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1216,6 +1216,9 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
> +			  int max_dotclock, drmModeModeInfo *mode);
>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_joiner.c
> similarity index 74%
> rename from tests/intel/kms_big_joiner.c
> rename to tests/intel/kms_joiner.c
> index 7c370bc60..633bf51c7 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -37,13 +37,20 @@
>   #include "igt.h"
>   
>   /**
> - * SUBTEST: invalid-modeset
> + * SUBTEST: invalid-modeset-big-joiner
>    * Description: Verify if the modeset on the adjoining pipe is rejected when
>    *              the pipe is active with a big joiner modeset
>    *
> - * SUBTEST: basic
> + * SUBTEST: invalid-modeset-ultra-joiner
> + * Description: Verify if the modeset on the other pipes are rejected when
> + *              the pipe A is active with ultra joiner modeset
> + *
> + * SUBTEST: basic-big-joiner
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> + * SUBTEST: basic-ultra-joiner
> + * Description: Verify the basic modeset on ultra joiner mode on all pipes
> + *
>    * SUBTEST: invalid-modeset-force-joiner
>    * Description: Verify if modeset on adjacent pipe is declined when force joiner modeset is active.
>    *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs,
> @@ -54,20 +61,24 @@
>    *		Force joiner applies bigjoiner functionality to non-bigjoiner outputs thus,
>    *		the test exclusively targets non-bigjoiner outputs.
>    */
> -IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
> +IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
>   #define INVALID_TEST_OUTPUT 2
>   
>   typedef struct {
>   	int drm_fd;
>   	int big_joiner_output_count;
> +	int ultra_joiner_output_count;
>   	int non_big_joiner_output_count;
> +	int non_ultra_joiner_output_count;
>   	int mixed_output_count;
>   	int output_count;
>   	int n_pipes;
>   	uint32_t master_pipes;
>   	igt_output_t *big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
> +	igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>   	igt_output_t *mixed_output[IGT_MAX_PIPES];
>   	enum pipe pipe_seq[IGT_MAX_PIPES];
>   	igt_display_t display;
> @@ -286,6 +297,81 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   	}
>   }
>   
> +static void test_ultra_joiner(data_t *data, bool invalid_pipe, bool two_display)
> +{
> +	int i, j, k, ret;
> +	igt_output_t *output, *non_ultra_joiner_output;
> +	igt_plane_t *primary;
> +	igt_output_t **outputs;
> +	igt_fb_t fb;
> +	drmModeModeInfo mode;
> +
> +	outputs = data->ultra_joiner_output;
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	for (i = 0; i < data->ultra_joiner_output_count; i++) {
> +		output = outputs[i];
> +		igt_require(ultrajoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode));
> +		igt_output_override_mode(output, &mode);
> +		for (j = 0; j < data->n_pipes; j++) {
> +			/* Ultra joiner is only valid on PIPE_A */
> +			if (invalid_pipe && j == PIPE_A)
> +				continue;
> +			if (!invalid_pipe && j != PIPE_A)
> +				continue;
> +			if (two_display && j != PIPE_A)
> +				continue;
> +
> +			igt_output_set_pipe(output, data->pipe_seq[j]);
> +
> +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay, DRM_FORMAT_XRGB8888,
> +					      DRM_FORMAT_MOD_LINEAR, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +
> +			if (invalid_pipe)
> +				ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +			else
> +				igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +			if (two_display) {
> +				for_each_connected_output(&data->display, non_ultra_joiner_output) {
> +					if (output->id != non_ultra_joiner_output->id) {
> +						for (k = 1; k < data->n_pipes; k++) {
> +							igt_plane_t *plane;
> +							drmModeModeInfo *mode1;
> +
> +							mode1 = igt_output_get_mode(non_ultra_joiner_output);
> +
> +							igt_output_set_pipe(non_ultra_joiner_output, data->pipe_seq[k]);
> +							plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +							igt_plane_set_fb(plane, &fb);
> +							igt_fb_set_size(&fb, plane, mode1->hdisplay, mode1->vdisplay);
> +							igt_plane_set_size(plane, mode1->hdisplay, mode1->vdisplay);
> +
> +							ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +
> +							igt_plane_set_fb(plane, NULL);
> +							igt_assert_f(ret != 0, "Commit expected to fail on second display\n");
> +						}
> +						/* Validation with one output is sufficient */
> +						break;
> +					}
> +				}
> +			}
> +
> +			igt_display_reset(&data->display);
> +			igt_plane_set_fb(primary, NULL);
> +			igt_remove_fb(data->drm_fd, &fb);
> +
> +			if (invalid_pipe)
> +				igt_assert_f(ret != 0, "Commit shouldn't have passed\n");
> +		}
> +	}
> +}
> +
>   igt_main
>   {
>   	bool force_joiner_supported;
> @@ -297,7 +383,9 @@ igt_main
>   	igt_fixture {
>   		force_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
> +		data.ultra_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
> +		data.non_ultra_joiner_output_count = 0;
>   		data.mixed_output_count = 0;
>   		data.output_count = 0;
>   		j = 0;
> @@ -310,24 +398,31 @@ igt_main
>   		max_dotclock = igt_get_max_dotclock(data.drm_fd);
>   
>   		for_each_connected_output(&data.display, output) {
> -			bool found = false;
> +			bool ultrajoiner_found = false, bigjoiner_found = false;
>   			drmModeConnector *connector = output->config.connector;
>   
>   			/*
>   			 * Bigjoiner will come in to the picture when the
>   			 * resolution > 5K or clock > max-dot-clock.
> +			 * Ultrajoiner will come in to the picture when the
> +			 * resolution > 10K or clock > 2 * max-dot-clock.
>   			 */
> -			found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			bigjoiner_found = bigjoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
> +			ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, connector, max_dotclock, &mode);
>   
> -			if (found) {
> +			if (igt_has_force_joiner_debugfs(data.drm_fd, output->name))
> +				force_joiner_supported = true;
> +
> +			if (ultrajoiner_found)
> +				data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
> +			else if (force_joiner_supported)
> +				data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = output;
     >> nit, IMO guard the array boundaries against overflow, otherwise 
overall changes LGTM.
	
if (ultrajoiner_found && data.ultra_joiner_output_count < IGT_MAX_PIPES)
		data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
			else if (force_joiner_supported && data.non_ultra_joiner_output_count 
< IGT_MAX_PIPES)
				data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = 
output;
> +
> +			if (bigjoiner_found)
>   				data.big_joiner_output[data.big_joiner_output_count++] = output;
> -				igt_output_override_mode(output, &mode);
> -			} else {
> -				if (igt_has_force_joiner_debugfs(data.drm_fd, output->name)) {
> -					force_joiner_supported = true;
> -					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> -				}
> -			}
> +			else if (force_joiner_supported)
> +				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> +
>   			data.output_count++;
>   		}
>   		if (data.big_joiner_output_count == 1 && data.non_big_joiner_output_count >= 1) {
> @@ -337,6 +432,7 @@ igt_main
>   			data.mixed_output[data.mixed_output_count++] = data.big_joiner_output[0];
>   			data.mixed_output[data.mixed_output_count++] = data.non_big_joiner_output[0];
>   		}
> +
>   		data.n_pipes = 0;
>   		for_each_pipe(&data.display, i) {
>   			data.n_pipes++;
> @@ -346,7 +442,7 @@ igt_main
>   	}
>   
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> -	igt_subtest_with_dynamic("basic") {
> +	igt_subtest_with_dynamic("basic-big-joiner") {
>   			igt_require_f(data.big_joiner_output_count > 0,
>   				      "No bigjoiner output found\n");
>   			igt_require_f(data.n_pipes > 1,
> @@ -358,9 +454,19 @@ igt_main
>   					test_multi_joiner(&data, data.big_joiner_output_count, false);
>   	}
>   
> +	igt_describe("Verify the basic modeset on ultra joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-ultra-joiner") {
> +			igt_require_f(data.ultra_joiner_output_count > 0,
> +				      "No ultrajoiner output found\n");
> +			igt_require_f(data.n_pipes > 3,
> +				      "Minimum 4 pipes required\n");
> +			igt_dynamic_f("single-joiner")
> +				test_ultra_joiner(&data, false, false);
> +	}
> +
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>   		     "when the pipe is active with a big joiner modeset");
> -	igt_subtest_with_dynamic("invalid-modeset") {
> +	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>   		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner output not found\n");
>   		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>   		if (data.big_joiner_output_count >= 1)
> @@ -374,6 +480,20 @@ igt_main
>   				test_invalid_modeset_two_joiner(&data, true, false);
>   	}
>   
> +	igt_describe("Verify if the modeset on the other pipes are rejected "
> +		     "when the pipe A is active with a ultra joiner modeset");
> +	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> +		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner output not found\n");
> +		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are required\n");
> +
> +		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
> +			test_ultra_joiner(&data, true, false);
> +		if (data.non_ultra_joiner_output_count > 0) {
> +			igt_dynamic_f("2x")
> +				test_ultra_joiner(&data, false, true);
> +		}
> +	}
> +
>   	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
>   	igt_subtest_with_dynamic("basic-force-joiner") {
>   		igt_require_f(force_joiner_supported,
> diff --git a/tests/meson.build b/tests/meson.build
> index 00556c9d6..c8cba1b9a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -242,7 +242,6 @@ intel_i915_progs = [
>   
>   intel_kms_progs = [
>   	'kms_big_fb',
> -	'kms_big_joiner' ,
>   	'kms_busy',
>   	'kms_ccs',
>   	'kms_cdclk',
> @@ -255,6 +254,7 @@ intel_kms_progs = [
>   	'kms_flip_scaled_crc',
>   	'kms_flip_tiling',
>   	'kms_frontbuffer_tracking',
> +	'kms_joiner',
>   	'kms_legacy_colorkey',
>   	'kms_mmap_write_crc',
>   	'kms_pipe_b_c_ivb',
