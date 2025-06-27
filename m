Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96E7C7EE39
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 04:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B92CE10E0DA;
	Fri, 27 Jun 2025 04:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jU4MEXm6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF8CB89D5C
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 04:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750998508; x=1782534508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SY/JEM7SBTUPHQ0wIFswqIycboXDBtbDJsaWR6qKMKQ=;
 b=jU4MEXm6KqC8sVh+xnDWyf2UtWxcjoBjdU3ujMOR/UbzNrgGB/pbguUn
 IShHxcc10NwedWYdv6G/4KZLu2JydnNS4E7ey32TgT7neWkrQflITimd+
 dYMPAskcwDGglZ34sPtwJQvZ1GbutD9aXH2Ac8zIA/ng7QfV+/MeKPMqN
 wuoPcdY1HJCWo3EF7vyv07BfMdtQST4uLkZYz4ff9wzl5/FJH3WRexNOc
 Ytki3MT78bB5S1By4ceZO8mGdsgrnxqMyw854QznBJLFpODifVCPHbMBp
 5Fwbn+RvF9TGMgjyiomFQ3zkBuqXTDRLh5EVZWluAUPD0q2j0zkojegV5 w==;
X-CSE-ConnectionGUID: GJRmpyYBSF6yeL3KgNKYdQ==
X-CSE-MsgGUID: e6ethFq7TpeHybQLA71MaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64662295"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="64662295"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 21:28:21 -0700
X-CSE-ConnectionGUID: OO9PVhlyS6izpWtsvD1Uqw==
X-CSE-MsgGUID: 3ht8kFsNTp6aHWMzx0otTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152106173"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 21:28:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 21:28:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 21:28:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 21:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJW5mPjoyc+KuxHQ7eadx7fpACnEQbFvA0D39oVezomXpIC6yV+66hvMZtbYZvGHJT1Fe6NMXo7IiAwe4Z1g8h596oUxccpOVrHjUdyMsXfg3hIomCJjkQG4ogr+QB6kOeMeC+v7n4Ngp07mAeSmVD+8RBHj6+WUuWzBdjeKf31u6CDmagJjLUKsxYtkNCWVzngLKRUE+pQY63wQey+ICaL3VhClUC7MUnrR+2iN381G5n9i5z+9WVip/ZitF9h+MSDXNF8/lfo8O3q5sJRYaZZMV90J3U50Jq66rucHjeE+0Tgno2iky45FyP01zfwH9gT5H5uuUcRzdYyHEFO+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mytiZx6NfStGJXfHt2dxP7QiPcVXQNvL3yHWmqMMVMk=;
 b=JUaGNAteiV8VaCV4/j67BGZHk1038N6c4sdh4GLnOef1FS4HKvXTAsG9cQysaOi5dUv7Y52fzkPxTt0ce0Ua+1BPUj3/MH5R3vAgNoVLUYFf2QhIdfmJyDQW22I1azC/lX9pPyS/mZaHf6DDWax9SrtohRHdWgijdNOZc5hU9FOLcQoutry9vmVP/KuSh7xsCEpT3fy2mNMISeBftAmg9mVd1jQHGSH5LMNmGhj6HUDHlYNMn3D5hkazl5rmcmnJ1rukDZ0M3LcHz7ssfrbWioFsNNP4K27md0NKdpE5YWcppKKm+9C0kOoA5By6B5/zpIx73K0UaZOJjtFjeUkGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6005.namprd11.prod.outlook.com (2603:10b6:510:1e0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 27 Jun
 2025 04:28:12 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 04:28:11 +0000
Message-ID: <4a3a82c4-cded-48f7-a6ca-497386952613@intel.com>
Date: Fri, 27 Jun 2025 09:58:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_async_flips: Fix mixed declaration warning
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mohammed.thasleem@intel.com>
References: <20250627040519.677664-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250627040519.677664-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 80ef46eb-60b3-4d86-05b3-08ddb533065f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWk2aDY1SXQ3OGxSZEJCVEQ2MjdEZTFQeS9HMlVsWEs4WmxKR3V6dWtXMFlX?=
 =?utf-8?B?TmRJUEs4SStFNW9mZVZYcmVFRnR1dTRlNUEyanRqY2NvWW1QNWR6eklITXdu?=
 =?utf-8?B?NHR1OXh0SjFxNGdxazViMHN0MFVPdjFiQkloV296Q0krTEJkbzI1RGlFZGxD?=
 =?utf-8?B?Z0JmWHQ4T1hrK0YxcEViQWk1SXluQk1VRHp6TXgvZk9raW5oYkdWUElBOFVP?=
 =?utf-8?B?QnZBRU5yVWkzeEh6Q3FvcXo1blQ4cytpa2x2Sld6b2xMRDRPNG9uaWlZa1dt?=
 =?utf-8?B?Q3RUcjI4WjJxMndsbCs1RHlrWW1wTHVjRmRHWUVrL09vQkVHR0g0ZysrVnJi?=
 =?utf-8?B?cE0ybnExcDJLUlNmS3cvS0NUdzRFckZRZFI4eEVIUExWY1pyeklYbWlEdUFa?=
 =?utf-8?B?Mjk4QTNPSy9HbG5QMFQxN3RBYUdBZko5SVBDTGw3WDFWR0o1YUFTZXZJSnNh?=
 =?utf-8?B?S1lRMERKT2NyL210NnpXQ01BR0pXdVlicWd3TncyTXhCNU9Zc3NNazhvMFZQ?=
 =?utf-8?B?cXVxR0MwaVJVR3I2dGZPUUhpSVFoK203cHNQL2RDUVBHbzVJOFp5bVNZOVdq?=
 =?utf-8?B?SGE0OHZxbjdkTTI4S3dlM1p2dUcveVgwMSt3MklzbkNhc0NCTlJ6ejV4Sk1a?=
 =?utf-8?B?bHdnR1pxcnA2eHhZMFVMMExpajBqajVYamk2Z1RCMlpKWmdwaVNPaU5KU0ZC?=
 =?utf-8?B?OEtndHVMUW10V0pUNTVPZFhCSk9uSGpiM0x1TVlhcGhBWUx1Ui8zK0x5VGhZ?=
 =?utf-8?B?K3F0d0pPN05Sd2R5TVV2ekJSUjROQ0E4VGhCeXBPWlBUVWVxS2hqNUJDZDFq?=
 =?utf-8?B?ZGZrYTdPNzJYOW0rVVgrS2dXRkM1UE4ramZIWHk1bFc2MEFCT3dwM0hBUGZp?=
 =?utf-8?B?K0VnSEJrYmFWUkZGU1NSS0xQZXFhWG9tNy9BZGduMXRzbmFkZmlLZ01UbXR5?=
 =?utf-8?B?L0E0WStpa0F1QjZDUWNSeTd4Zm9YR0txTWhoUjBiczd6L0hMWUYveS9Hb3hu?=
 =?utf-8?B?bitvbzhRTjRhUUdKaHBFVkVKSTZJYjFHZlBlWUhIQWl3SnRRbGN4V3M0Ly9o?=
 =?utf-8?B?d1RXYUp4STkxbVRjSUw3RmpKYzBwQ3RzUWgxdHEwVnc1OStDMGtSejJBTThq?=
 =?utf-8?B?WThHb1pXVHYrckZiL3FBWndwbmJyYk11VS9xb1lnR0VxcTl2eDVPdXdpODhm?=
 =?utf-8?B?RHFvS0ZJK3lEZzF5WSt2K0QvbGJqWWxmRXp5YlA4TGFqTEpnVE02aWd4UW9Z?=
 =?utf-8?B?K2taNGREUTF5Vm5hSFYydWZESWZWVmpLbUg4QVF4ZUxaSFpMR3BEWlFkaU9W?=
 =?utf-8?B?SXN0R0VoRG5yampEUEkxc2Z6YzhxTllPTjlRZFJSYks2cE14WDVMS0FSVkNp?=
 =?utf-8?B?YXZvbUduVmJabzZiOHlnMGtGMllmd29zZEtSeENXVDd0bmVnOFA0aUVyamg4?=
 =?utf-8?B?d0czOXZEQnE1UzU2Z2xaSkhaWWhSaDFwMGlHNjVid1pvS3U2Q003L3FCc3Mr?=
 =?utf-8?B?N3hzT0JLV3NnUzlmeitkRzdiNFFaSGxLeis3cWhmQ1A0ampRa0ZNaU1KdUZR?=
 =?utf-8?B?ZHhPcVFBYkpUSXpBZENUa0tlRVhpMk5jT3VNTjdoelZGNXdaVDBOTkFZTUFU?=
 =?utf-8?B?T3RrYWdHamxTVHFqK245SEwzSUIrZHdJUWtxQld6d1VkVTIxSjFMTVNWQ0lB?=
 =?utf-8?B?UHVCU1FNWDBCdDQ1cjlGS294eGlFbGpCUkFPL3FRZXZGQ1FNc3lMNTc4Nk1h?=
 =?utf-8?B?OURJWExnUWFRWm9LaUU2V0JvM2xhSlE0b1ppd3hVUVpCL2VhbFc0V1p2ckIy?=
 =?utf-8?B?ZjUvSGZWN3ArQ0QwWXpiQ2hMVCtBZTJ0TmQvbjlhMjZWelJyYlZ1SXc4V25L?=
 =?utf-8?B?M0IvWUx2ang0MWF4UVVrcW1VRDQ5a2NYeFpLMzJ6dVZpUzZSNHJxNlVFUTk0?=
 =?utf-8?Q?BoU+BYg1Y1g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUhrV25sZ3ZxbXZtcC9ORzhHeXpqam55L215YmpYVkUrdEthYnJyZ2tlTVRW?=
 =?utf-8?B?TkxVQUhmcEpIWWplaThkSU9HR2U3M3B6UWlwUTVmSGVZNHVZbkxtd0J0RFM1?=
 =?utf-8?B?MEpPaEJXZ21CMDE2T3VrN1ZrQUYrNlNYU0xTK0pPM1pZbnBlWUU5Mk00d2Fq?=
 =?utf-8?B?dTNDanhhTk5FbU10THlWUzJZZzEzWUZsWGtFQmo3L1JiU1RBdDNnSURCcFVE?=
 =?utf-8?B?Y25RWFY3Z1JpTVF5UktQbzAzRHY3bmVmN3I1QTA4ck13VUdOdUdSK0MxWHIy?=
 =?utf-8?B?MGtGaVlOeDFiVUhGbjhLY1N0RXQrTk1IYUV4VEFja3FmZTQ3OGR1K1FNV2Yx?=
 =?utf-8?B?Z0RBaUlDenJ3VDNvaTBaaW4vR0MzQWFGTE05RjlXR3FiYlpQc1Z5c3RLS0k1?=
 =?utf-8?B?MnVaMStzVm9RYTQvV2FYN1QwamVMbllqbC9vaDAzeXM0N0V2a0M2dytoWlRH?=
 =?utf-8?B?cC8vOHhsMDhNNlFMekdSdEtQZU81SlBjcDU5ZE4rVU80NWxTNHhVTlBJbHhq?=
 =?utf-8?B?T1JHOXNyaFR3UWdOTHJyamxPU2VHTDB6OGNCY041MEtLYmU5L3pzQWdOMXlw?=
 =?utf-8?B?eDExSk1ZZGNzdG1pdUV2K000UXh3TjhZYkcvTjZLK0lYQjZsdCtuL0FTazg0?=
 =?utf-8?B?QkE5ZkVIUDVCbmZzK2ZpbHRMY0ZHU2FwY0JUazl5c2Zpdjd0VC9oa3Nkb2xh?=
 =?utf-8?B?czhUczE2R3ZqUmExL3dMOWkvNDYycHQ0akd4K2NSUXdMTytxa2FZbnhiV29B?=
 =?utf-8?B?alkwYy80M0NaNkVsemdFSDRrVEtMSkdDc3A4UlBZWjdveU04c3ZqNnZrQnox?=
 =?utf-8?B?UzJSUjhveEErWmd0QXhnb0xaRFIzTzhpTnZSelZYYlhoWWZVTUhQeVdDdC9n?=
 =?utf-8?B?djRCM20xM0tyNnZ6TlRpZEIrQWNySVBxWXBaUk9DR3hNWjFpS2cxaDJVTzh6?=
 =?utf-8?B?bWloS2NiRFFnSW8vb3FlemF5MGZWbm5yM1pHMitiWlQwRjRMTzhOVTZGZGo4?=
 =?utf-8?B?bUUxNnhPZG9FQWdlQ3FzUTc2M1REcTZ4Mld3cG9IZFlJYUVyK1greVVpUExu?=
 =?utf-8?B?NDZoZjVWNXdsRFBzN2tNcFE5V2NhUU1GS0pDcnBJRzZIOTVFbTNva2VabkRU?=
 =?utf-8?B?Tnc0bVhaS1lYTG9lQys3MmkyanNweU5LSkJrM3N2MDAxWmdCcjlQcGxndEU2?=
 =?utf-8?B?YUVkUElWRzQwOUo5OVVuajBSckcweXdZUXk5Sk5IVUloUXlFR25vcmYyT0xV?=
 =?utf-8?B?T3RxWE5XTURqU3orR0ovK3BnaVZkZnQ1Rkp6T0NmdldBdlBiSDQzckJ5YnQx?=
 =?utf-8?B?dUkvc1ZCZ29zWDcyQjZrc1gyYVhReU9SUjJ4VUJia0JySnZNekpSRjM2UDl0?=
 =?utf-8?B?UWZBK0IrTnVheTVuZFRzd0Zpc1dNeG8xM2FxT1BSSXRFakhxcTZKYW45aGx4?=
 =?utf-8?B?T2pydm8xV2wwS0d5S29vcFZPRGlGS21SYXAvNEphSlNNU1JKSjFFQTQwa0pY?=
 =?utf-8?B?Q1RqNG9QMUtoT0Z6Vzc0Ym9mNE1PbzB6RkNTdEZQcDhPcW4wSklFTnpjSXQr?=
 =?utf-8?B?UjR2aHNQd3FrZFFORjhUVWxYWUhLZEVKdythRUgzVUZOQUcwK3MzaUZZOHZ6?=
 =?utf-8?B?SDNKcSs2OSs4OTFNdFdGRlhMcHh6TWtZLzl1dytsbGE4YTIyNFA5NXZrUGlj?=
 =?utf-8?B?SU5IdDRDa0dOZzFtaUI4ZExNK3VPNTUwbk04OHdyVUlGV3YwdTl3NzYwT1Fa?=
 =?utf-8?B?WWljSllYQnQzbGd6L1NmSkdITS9CWmwwUXpBOUZST0tHbFI3VU9HYTBXQm5L?=
 =?utf-8?B?eTNUdE1HK2hhVmRReTcxbGtrK1kxOCtDZkd2cmVKMlNoRUxjc1VzbXFEVGFv?=
 =?utf-8?B?dWMyYmJiczRQUllTckxDRlZZWURXVmViYU1JcXQ4Wk9qd3lzT3RBSEtKMWo3?=
 =?utf-8?B?enljNFpTV3VZS1lrOVBOL29maktaR3Jaencwb3p5cE5zV1ErQTlsTFZZdHVn?=
 =?utf-8?B?QW5jZmlQZU12d0ZaM1ZRRmRPTmVIM25XclhZOWdCLzlPTTEwOVFweElzenBT?=
 =?utf-8?B?Y2VOUlpyb2N0MUZoRlpKTzIySjhzcU5WRXk4SURWSHRDeHFhaWs5RVNZRkRH?=
 =?utf-8?B?SUtwdVQvcjV3SnVET1hIUHM1Y3hzUkpMR1pvVUxTcXFmZ2s1Ty9XbngycXo3?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ef46eb-60b3-4d86-05b3-08ddb533065f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 04:28:11.2949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X9SMyi4ssCqLdcmpdrQH1EsGPsJUehPDi0we9nUpAtYZeD7vat0lRiOnmb98q1WxdiYVQLIHIfZuN7kqR8oncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6005
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


On 6/27/2025 9:35 AM, Santhosh Reddy Guddati wrote:
> - Move struct format_mod declaration to the top of skip_async_format_mod
> - No functional change; fixes build warning caused by below commit.
>
> Fixes: aa4b2e0b81d2 ("tests/kms_async_flips: Add test for all async format modifiers")
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index dc3a0f92a..ddac904ce 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -860,6 +860,12 @@ static bool skip_async_format_mod(data_t *data,
>   			    uint32_t format, uint64_t modifier,
>   			    struct igt_vec *tested_formats)
>   {
> +	/* test each format "class" only once in non-extended tests */
> +	struct format_mod rf = {
> +		.format = igt_reduce_format(format),
> +		.modifier = modifier,
> +	};
> +
>   	/* igt doesn't know how to sw generate UBWC: */
>   	if (is_msm_device(data->drm_fd) &&
>   	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> @@ -870,12 +876,6 @@ static bool skip_async_format_mod(data_t *data,
>   	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
>   		return true;
>   
> -	/* test each format "class" only once in non-extended tests */
> -	struct format_mod rf = {
> -		.format = igt_reduce_format(format),
> -		.modifier = modifier,
> -	};
> -
>   	if (igt_vec_index(tested_formats, &rf) >= 0)
>   		return true;
>   
