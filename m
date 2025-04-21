Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE8AC369AB
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 09:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB1610E35D;
	Mon, 21 Apr 2025 09:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DB5ONOy0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D5AF10E35D
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 09:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745227380; x=1776763380;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lta18gU7bmqDMQ8tykBjBqJkFrnNOKmDotwJoxLb7Xc=;
 b=DB5ONOy03NtZ9pGUMNyN3rrarlyi4uEsJ/TxfPBOlpji9UlsDwRCDNl9
 dcnWaq0Y5tbrFT3MrXbNGIb5Jz7utzfAqJG5VKuZTX4Lhnh3ZwuHHJev4
 v+kNooFqgTJXYKNOS7epGMHyA/jl0UnpLoKdQdx0lztcK7j4FRyp1q4zw
 SmvOUeZN7W4z7hLqkOMtlBUf12h98bA2CFD7rx35UsEBbaR7CH+lKJJ3X
 uWrcjUxj2LcoaESbJNnrVgX7iUrx+aIyhO+txlTGvygYmqPcOiWLyL8iB
 xMZDX1lca9139HAhNGUhaAgvA94AfRnCopvgC+1XV91PK+vLBW6KuSiPy g==;
X-CSE-ConnectionGUID: dDEodg9BTw6DtVIvzO1lXQ==
X-CSE-MsgGUID: ViDwAPDpSN629roKoZ6Y0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46878081"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="46878081"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:23:00 -0700
X-CSE-ConnectionGUID: ushNkQVhS4uRujsglPuayA==
X-CSE-MsgGUID: ph3ZI9++Q8KoGFq8kyy68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="131639818"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 02:22:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 02:22:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 02:22:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 02:22:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nIprtrF9OuCj/OPBuwCzt33TXyUY/JCJe1haEqgXLl1GenwcX9E0qpHl5QTKPUJWx/1WDAf10wOIZpnWG3KJPLDlOeNmQBhrzXANFewnwNHh5KbGQmwVZF98vqpHWNwY/8zBxVW/Uh64JvAO+MHxycmYU31mUzsD0Na9kLapfGav7bW//4X19dlqCRM8tnNKBUQQaAUbIvCEW6qTj8rav1044m59HxKYTbQTVqp8iajS3d4+KHMV5qPbKRn+JSxEFtY7opV2PIkFHazr7gg9BVtX23hHG/whO69GoVPg/7fJrHmE+5OiRM9xO1pqykjqLcfvhjD3tiY1wxddgjJUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSy2zn6m8z2BRAJ8AdTzjVKkYQ5BuCc6dAHetpVSv8g=;
 b=T+uyyPq7aMYWTDz2GtB905b+fTWCRQTZ9gCboAeFEAZpcGADrCKwAizMC+IoTLF9zQZ1PAUH1OJ7XEi5I9OHUxxvRNXfAi2vBBVWoeZmEgMvTqg04TPPXTXRZ87UL4lko3Vh7OkD3cdOb6sCkknAKFw/A5hSQCfKojiJCtRUS2mMNngSko3QZ/jFpeJ5Q5mNH6TfppVSwg7Fl6hbJD+2gBP/2LCGUjZt6BSVNiLsVGMd1NAmD4q/qk1MSLRFY21dak9Fes6Umn1Ob5u2cc4NLPP32D+zq6DThCshJT94oKXJwhp/SvLZfJqgtj7+LiTTkRCWQQldSALNCo0Fm5sD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA0PR11MB7863.namprd11.prod.outlook.com (2603:10b6:208:40c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 09:22:55 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 09:22:55 +0000
Message-ID: <cde33b2f-37c6-44cc-9812-c1ac68059d12@intel.com>
Date: Mon, 21 Apr 2025 14:52:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_joiner: Fix mode handling
 invalid joiner subtest
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <jeevan.b@intel.com>
References: <20250411075225.2855770-1-santhosh.reddy.guddati@intel.com>
 <20250416074434.2887040-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250416074434.2887040-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0096.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::12) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA0PR11MB7863:EE_
X-MS-Office365-Filtering-Correlation-Id: 81622d3e-4364-41e8-0e4b-08dd80b61903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmF4RURQcStIbzErTmNoTGVSd2Rha0o1a1lpYWxxUE9oWjVrajhmN2EveFR2?=
 =?utf-8?B?aGpJYys5d1kwcEZwUzVYVEhUdHNqNmNvdzdVc1EzNDB3SzI2ZVc3NGtVcEQ3?=
 =?utf-8?B?YlJ5QXd0dzZTNzhzS0xvYk5teTh0RlhnczhrN2sxTWhOQ1NCdFZYcTZGamJr?=
 =?utf-8?B?aG14MmhQMW1HRFZlWG8xNnNsanVYcVN6MEJXVVg5WUh6ZFZNVGdRL1RmSVAy?=
 =?utf-8?B?VitwMWpzN2NSSFd6aEY3UDY1eGpOeGtDWkJ6alYxRDArbkFvMEpVVWZJajl4?=
 =?utf-8?B?SzJzaVlpRmJGNFNSRnlqbkQzbFNJZ1hOQThBQmRFYzhVRGVxbHNoUjI2VEsw?=
 =?utf-8?B?R0l6bXFDOG1MZTVDcnRUMWpjK3Y3T0JGQW1VbXEwSlJmdFhzM05haGNFWUdT?=
 =?utf-8?B?OHBsbVpoaW92QjdBejV6eThJV0cwZUJESEFqdmlHekxFM0pDNnhzZFBDckhs?=
 =?utf-8?B?QUVhRDY1WlpwRVJpVngwUkdhbzRMUGthOGRNdGZrN1RLQ3kvK3RuUHZrV1JN?=
 =?utf-8?B?UmJ0eWMvWjhjaElRR0IvMGg1d3U4bTZMdC8rSzcxbzNicXhiUkpLRHE3bWgr?=
 =?utf-8?B?bUVLT25QTzlodjFGSU8zRWxYTG8wcWhjS2JjZ1FjRUJYRHJ0UEpvNnZNT1Vt?=
 =?utf-8?B?N0F1UmtSOXZPc2UwQzRLLzBKdUtEeW1JMlhUaktpbDNPVlBPbWpFd1Q4WVp1?=
 =?utf-8?B?SVJ3aG9iUzdWYU50ODRCT054ek9UY1FCL09MNDhBbklIQzRCYThLY1pqaWF2?=
 =?utf-8?B?T0p4K3RoSy9ua0JHZWkxY3ZINVA1Wk1kRnI0alJzVUoyeWN0eXB3N2lKdmJX?=
 =?utf-8?B?MVY3Mm1jS2txL05iYUNHUTZ3Y2lHM211NVRSQlNxcTlkTElxbThxVTFPWHdn?=
 =?utf-8?B?ME5DYUQrWnhEb09PRjRwSWFlRkp5eFQyZVA2dmsxckRZRzFDeTd4cXhacWp4?=
 =?utf-8?B?U1pkbE0vNkZzVHpvTzEwb1QvMTJna08yVy94Z1dYRE1oV3YzdjNocVd6OXB6?=
 =?utf-8?B?WGlwYXgyVkFzRHgrd29HRGJMRFg2dndIazhVL2NUU20xSEFEWURrbUowb3VE?=
 =?utf-8?B?aE91b0lVVHdPc3NZMlVvQlFKcVphZjZISkgwRmNEdWdlUG53UmJWU0ljZk1w?=
 =?utf-8?B?QjVqaTc3dDFDTmJ1Nk00VWxQU0Q0MWFMRVZ0ZEp4c1k4c2dsME9xbVJBNnZ2?=
 =?utf-8?B?bzZnaDVPTk1EZmVjbkZMSXp0MWJmU0xaMiszZEhnL09GSnJYNTkzK3hnY2hT?=
 =?utf-8?B?Vmxoc3NKRFBpQTJkaVRHTEJicytWcEU2Mi85SVdpVFZWWENOS3V6SE5nZjNY?=
 =?utf-8?B?Ylk3VzcrTEUxSy9QeFdSdkJMckEwNnBENEVtczg4UENYNFVxMTY5WjU0UXBo?=
 =?utf-8?B?ZHNlaG03T3E5UFJYcnl2dERvbkVhZUUxUnRDUS8yTnk5VXFzUnpJdUorVVVG?=
 =?utf-8?B?N08wVFFuZDU0dS9tMzNIN0xtMGt0Wlg3LzBMYkNxaGJQVzhMM2VDOFRiejJU?=
 =?utf-8?B?TUVubXNSbXdXcjBqdzRyWVk4L2VSanVDWnRGOHBTeVFKTm1xOCtEVE0vdGtv?=
 =?utf-8?B?cmd4aE9KclBjeWJ4RDNqMHhZMmhaY1hTcTBadFdUamluL0NYWG11YWZkZ1Ja?=
 =?utf-8?B?VXJCQVJmdTVXRDFyQTg2aVl5NmZiM0J6Ry9WOFVWU1JCNGUrVE9uVUV5Nlh6?=
 =?utf-8?B?WDlTZ1VIMG1mRXFDRUZ1d1VmWmhkckd4cmRoRVB2a2NrcHVuOHEwN1ZFUnh6?=
 =?utf-8?B?OFFMdVlpSnJ1MC9MZlloQVlSanVCSUtUbWxEV2l4UUhMQW12OE1seGhSOU9N?=
 =?utf-8?B?L2VMbWNGdG55RTk0V2ZiYUlQRHZkL0FHbmtxNEVLaktma2dyUFVDWXZYQ0ND?=
 =?utf-8?B?RTVSVUpvNUlZOXZnV1h2V0o3aDBuNHZiWHBhN1VnNERqa1NnZU5YRkNsMkd3?=
 =?utf-8?Q?qWRyC67QW7M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHZJSVR0WXUwVkZFZWRFWmlWZ0lvVG5CaDRvMnhHelRoeEJYcTJ4S05lMjAx?=
 =?utf-8?B?RHQrTjBob3BmNW13UlkxY1IycWJkU1p3MFJ5QW1hWlUyejdOYXYxclcwWWdm?=
 =?utf-8?B?RmVVKzBNUUk2b251T2tKMWlmaEtEUW9ZWFVGZlM0RXhBSXRReHA1VHU4UWxL?=
 =?utf-8?B?OE0yeThDNm9obzFpMy8zNWFrQ3gvKytscExVSFFMbWNINWZWaWJUSUZNbHZi?=
 =?utf-8?B?dlo1bE1STU9jRXYzNmR0S0g3aDlOMUlKcUNyZGRQZ1NRZU01S0pVR05ZR2Rh?=
 =?utf-8?B?a1FOMmFvWXh4a1RtRW84UmZlTVY5MUlKS3E1RjRwRUNqbm5NbFZzamZDSmhQ?=
 =?utf-8?B?Q0dZVmgvMmlPcWFQRzErei9nRGZmUk8xeW5SNFBvcFYyYlBSS2VyVExZU0Vy?=
 =?utf-8?B?Vlh6YlRHVW5RbkVNTXVJeDJUUllISWcwWUd3eFBFbi9VN0ZpMzd2Y091TXpZ?=
 =?utf-8?B?a3o4WC85M002a0VHT0l3SnhabnNZSzNKM0hEVUxtQ2k4RFo5a0pBS3lrRzky?=
 =?utf-8?B?dXNKYklWeTRKTVJQNzg1YmswS3hSbmQrOEx4V2NETytJb29OTnlDWFBSZk43?=
 =?utf-8?B?OG8wWlBMMkV1RnVDTVZ0bjdaMEtCZ3A2TXIwQWZvS0NBQWkxeGR0NnFIQVBX?=
 =?utf-8?B?VCtFd3psS0ZZK0E0S0JPTThBVmgrbmZDVis3bE1rWk5MREI1VFFFQkVLT3VY?=
 =?utf-8?B?bTJxYjR6OHduL29XMXpuU2hML0JLVDFWMXFlY2dOS05RWklIcGMrUm1weTFY?=
 =?utf-8?B?WDhsaW9CZkowbmIvbUEwN1Y2TWlyRFJNdkZYcFhjaVNwK2pGQWhJZ3F4c0dv?=
 =?utf-8?B?OXlIaUw2R0FYY2M2b1Y0eEJKd1pJMXl1S2NMeWRiVS9pWnF2THZ0a3JkK1Uv?=
 =?utf-8?B?OFF4OUFRUHljcmd6eGs2QkwyeElBUVFhODVkcEU3ZVNyOFI2QlpSYVRQNE1p?=
 =?utf-8?B?S1V2TlVRRnY1UnJ6ejZuMjI3dkxUK0NhT0ZhK3F4Qi9oWTdQVVpoeURVM051?=
 =?utf-8?B?VE9pN25wOUZHSi8zN1gwTUJDc2xhemxYZ2lkakQ1VHNpZE1ZcHY0eVVUbDBu?=
 =?utf-8?B?MStWMFFVS0VjVmhLd3YzcGVjTXZWN212ajVWa1hYcnk2NExwbkJtamdNQzVR?=
 =?utf-8?B?NG83WExuNituL2x2aDcxcWRBQVVNTlJua3lCSEN6R1hBVGw3WGFRb2VLK0xO?=
 =?utf-8?B?S29xOVFtZFEwLzBEVzk4Zk1CbjMzR3RKVFAyMkpXeVo1dnAxeDhaU0VlWXZn?=
 =?utf-8?B?NnJtbWJoSjVUdEJYTUhpWWtoenRxcUxFQjVvNUFzQlkxUE53czNEVGQvOFNq?=
 =?utf-8?B?RGtSbXBXbFVWNjVlc3BYc0VNaHRtQVQrOVFHc3ZIM05WR2d3MjhZYjV3ZTlM?=
 =?utf-8?B?OFAyUXFIc2ZDeVJtQVdQL3VpMGhVTytFSWwrei96cTlXZFpDaGMvV3YvS3VT?=
 =?utf-8?B?cXIybkpodEpRYk5sUGFOWm1CSkdEampxcGNNc2ZjVzhVRFlFS093TFU1YTZ3?=
 =?utf-8?B?cS9EMmMzcWw5SnBFUUIyNjVpQkIrVHlKRGw2ZlRVRy9ZQzFlenVLWlNSS0lp?=
 =?utf-8?B?QXJDemtnMnNyRWNjRll6Wk03bFB0dmtwdXRHYlZjUWhqQnpONC9LaGh0RXdD?=
 =?utf-8?B?N2dYL00zRElFMlRwbkhPbW1Id24rUXF1NUxDUENZWVRPOUdHRVBrZVFubFpH?=
 =?utf-8?B?NnJQdXp5MDY5OHBpUjlPZ0lJaVV1NWI2MTdvTkFad1o5cWVrc29kSlJHdEZn?=
 =?utf-8?B?MitDWkhTaVVvZWI4eWJEdm9teko0bnJYR2FraVJkc2NJbzh3TEdmbU5UaGRk?=
 =?utf-8?B?YzN1NDY1M2ZUVGt4NGFDTnBYTUYvMnNQbGIwMHpSM2h6dGRVdmhHandmSnZR?=
 =?utf-8?B?YXFJSDRnQ3F3YWY1KzNzNjBIK3BuM1YwS0RkOWV1RWlkMlBHQ2dKcnVoUEdi?=
 =?utf-8?B?NXo2TmVzd1FRM0dJYU56MVRhZkFCSTVVY2xVZkJWaC9pcmxNOU5NaUo1UXRi?=
 =?utf-8?B?OFBqSWN1QmpxRFVVWURzL0pKL3FlNzRmdHpIUUROQzlnRk0xYkh3OGtqdFd4?=
 =?utf-8?B?Uy9Qd1VzNDU5cFdDUDd5TE1yOEhHclZCWTl5K1JCRGJ5TjlPZ3FBeVAxT1FX?=
 =?utf-8?B?OC90WjdJVUUxay9UM2NGMVlnWlhjNStZL21EdytOMXJzeUhXdWcvZ0FibTR1?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81622d3e-4364-41e8-0e4b-08dd80b61903
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 09:22:55.2104 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eaBROheozg1Jy8omoX8VcX55rmWSo2FPPuN5Zc36nnQOlqjMnVpGI4fgXRn9zv0d6w7Bu8QDZFJXui3Ae+nDfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7863
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


On 4/16/2025 1:14 PM, Santhosh Reddy Guddati wrote:
> Use a valid big joiner mode before trying modeset on the last pipe.
>
> V2:
> - Fix: force invalid sub tests skipping on valid outputs.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 40 +++++++++++++++++++++++++++++-----------
>   1 file changed, 29 insertions(+), 11 deletions(-)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index b150894af..22c7c6d85 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -324,7 +324,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   	igt_output_t *output;
>   	igt_plane_t *primary[INVALID_TEST_OUTPUT];
>   	igt_fb_t fb[INVALID_TEST_OUTPUT];
> -	drmModeModeInfo *mode;
> +	drmModeModeInfo mode;
>   
>   	available_pipe_mask = BIT(data->n_pipes) - 1;
>   	outputs = force_joiner ? data->non_big_joiner_output :
> @@ -341,15 +341,24 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   
>   		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>   			output = outputs[j];
> +
> +			if (!force_joiner) {
> +				igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
> +							  "No big joiner mode found on output %s\n", output->name);
> +				igt_output_override_mode(output, &mode);
> +			} else {
> +				mode = *igt_output_get_mode(output);
> +			}
> +
>   			igt_output_set_pipe(output, data->pipe_seq[i + j]);
> -			mode = igt_output_get_mode(output);
>   			igt_info("Assigning pipe %s to %s with mode %dx%d@%d%s",
>   				 kmstest_pipe_name(data->pipe_seq[i + j]),
> -				 igt_output_name(output), mode->hdisplay,
> -				 mode->vdisplay, mode->vrefresh,
> +				 igt_output_name(output), mode.hdisplay,
> +				 mode.vdisplay, mode.vrefresh,
>   				 j == INVALID_TEST_OUTPUT - 1 ? "\n" : ", ");
>   			primary[j] = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -			igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +			igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +					      DRM_FORMAT_XRGB8888,
>   					      DRM_FORMAT_MOD_LINEAR, &fb[j]);
>   			igt_plane_set_fb(primary[j], &fb[j]);
>   		}
> @@ -370,7 +379,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   	igt_output_t *output;
>   	igt_plane_t *primary;
>   	igt_fb_t fb;
> -	drmModeModeInfo *mode;
> +	drmModeModeInfo mode;
>   
>   	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
>   	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
> @@ -379,15 +388,24 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   		igt_display_reset(&data->display);
>   		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   		output = outputs[i];
> +
> +		if (!force_joiner) {
> +			igt_require_f(bigjoiner_mode_found(data->drm_fd, output->config.connector, max_dotclock, &mode),
> +						  "No big joiner mode found on output %s\n", output->name);
> +			igt_output_override_mode(output, &mode);
> +		} else {
> +			mode = *igt_output_get_mode(output);
> +		}
> +
>   		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
> -		mode = igt_output_get_mode(output);
>   		igt_info(" Assigning pipe %s to %s with mode %dx%d@%d\n",
>   				 kmstest_pipe_name(data->pipe_seq[data->n_pipes - 1]),
> -				 igt_output_name(output), mode->hdisplay,
> -				 mode->vdisplay, mode->vrefresh);
> +				 igt_output_name(output), mode.hdisplay,
> +				 mode.vdisplay, mode.vrefresh);
>   		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -		igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> -							  DRM_FORMAT_MOD_LINEAR, &fb);
> +		igt_create_pattern_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +				      DRM_FORMAT_XRGB8888,
> +				      DRM_FORMAT_MOD_LINEAR, &fb);
>   		igt_plane_set_fb(primary, &fb);
>   		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>   		igt_plane_set_fb(primary, NULL);
