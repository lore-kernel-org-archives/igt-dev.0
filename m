Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C249BCE8D5D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:41:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8B10E6B9;
	Thu, 19 Sep 2024 08:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U4FWQ5Lg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB92C10E6B9
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726735269; x=1758271269;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gAvEndJbKNIQ/yqkMP0My0f5VtZnCpIKBubBKMwWjz4=;
 b=U4FWQ5LgTp2KMqJqVOwvyu5nTK13dsIEGtZZC+0Siv3dBoGDfBtluwEb
 v84KZuvG3gUjgsqMSy32MSJ/XxeGHaj4s2luZjKt/nfeB4jnUPzfq0oJB
 P0r5ic4zLc4lub3VJwk8WwT6y9lB8eeAkj3yZCzB3v5gHHbpNOyJxxol1
 htm0n+oSsLVtDsWlUdpkX+PvZOXwogIOGyd4nx//LZE64zWuUtcZq1uRO
 w2T+0GUo7WxjTqSMI4oMZ8tQm6cU6yE79aVJXeWvEixJIl7mcvr8pgyCZ
 S/LolCQn5mTcqaNAArboBQ1P4iClCdKC/m8fmyA27M5g4hnx8p+mOD+A1 g==;
X-CSE-ConnectionGUID: QBuQKd6kRYijc9lJU5fTVA==
X-CSE-MsgGUID: LkD8CsNATbOw6R3zDHJJyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25626034"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="25626034"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:41:08 -0700
X-CSE-ConnectionGUID: KDrUr1qlQjeefBqznqs8sQ==
X-CSE-MsgGUID: Zsr5XIhjQrO8bF4DMXduAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="100679070"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:41:08 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:41:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:41:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:40:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/6y8E+5OqNtETqfeDkkkDHpsn0YLU6VqVof8nnB8DGy265zWMoYoKsxuFmCK5Md5MH/rlAi2lWPxCFfRad+Vx29H9C9HoxUvbfvfziEfeQY8jB4QyBequEfl6c49BjUGo8hofpG/W6am6Vw15uybCbf4cb6+BmvNquuUr/hw8gLjYizVjzN4Ph2QDKyzFhDO4PtssIZ+PSRaztPIErv5SxxpwI/DIJGkb0zqUlavdyzxmEhFix/0rKwm0/BXJQ9aGcuC7g9fDUIIdCAd2RPnEM7KgojtGQbRY0CYkxAvD0PPxN+SWhM3iif3onfO9sc+TBdf4rGeIWSn6sSnA1Inw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+vKcdGlTkVKk+KZ2uRCXCF8x0kTN2Z1imAg+vPye84=;
 b=Zajp4WgduSLdgu9XoeBna3vkYJ+hmkEKFtMNWdVr+OfR1n9dWtQSV6jLP9UzHp/rFUCNMj0V50iP2FEf7h4VajBkxleL6qFmKchXq/nEsH+PYiVhO1fDGpoxeTSMhimcCzPBMc3VuNhO3sELKpmIIAtSVGwo3eVMpWAhaU/fjAnKICScUmQZtV4DIfL8ucwfQy1aMwlye1DOQv2Wp0+85mwoRVn7I1WsLL2W/oJDQ0+GxpLQuy/ksADhH2587d8XT0LDy8WKh/vYdLdUll9IXGKESASjgV5JKg+aha/n9KD6I7diiE4gF0QEHZLJ61IPpBAYsS/vfb/S4a+pNA0ctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 MW4PR11MB6936.namprd11.prod.outlook.com (2603:10b6:303:226::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 19 Sep
 2024 08:40:48 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 08:40:48 +0000
Message-ID: <67460901-0844-4aae-aee6-346cd349fbc4@intel.com>
Date: Thu, 19 Sep 2024 14:10:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and
 sleep times
Content-Language: en-GB
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
References: <20240919063352.1607048-1-karthik.poosa@intel.com>
 <CY5PR11MB6211881FE45A4CC469B203D295632@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <CY5PR11MB6211881FE45A4CC469B203D295632@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::17) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|MW4PR11MB6936:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c85b54a-f33c-4e11-d854-08dcd886c298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWJPVE1nQzhTMXVHMEZsNmlZbW5mdFNNNFY3c24yZEFQaDNvblN0OHJ1MDhW?=
 =?utf-8?B?TU0xTFlIQXAwOFR1MTdNaEFaaGxlUUYxZnNnMUJTUjFQcjdTbHpCWVdSaE5n?=
 =?utf-8?B?TXgyTE8rU0xBeUxPY1laNWJoVnMxK0dMNWttVzdTemRsZlROUE1KbmY4c0RE?=
 =?utf-8?B?alRWZE9jOVBuK0VCWlhxbXFRZUZkSEw3L0J1UXZwOERTQmpYdzVoOEdOZldN?=
 =?utf-8?B?bVhWZm50V1gvUWZXNHBvYnVrQm4wbEtPQXB1eHEyOFJKYVRTN3Fob04wRGNY?=
 =?utf-8?B?UU41cGx3QVZFdmpkUUtzVldnQXFNU0ZueVVGN2FsMXI5MzZScEdTWUVrdlpP?=
 =?utf-8?B?aDhqOWhDVTNlYXA5RWNVTGdpbFRFUHQrNWgvdE1kODhkcm1LUU96eHVZQ0JZ?=
 =?utf-8?B?QTcrMHNSRzJ2aFRKbHZUUnpNUXAzVUhibzhLc0UvZkRlZWM5eXIzNE1weXdU?=
 =?utf-8?B?d2FEb045ejVyWXp5K0xOQy9Rdnd3emFmdHBuNC9YS2dUWVkzOUh6a0wzbkFu?=
 =?utf-8?B?bGdvdFdoUlIycVhOTUQ5SjhVeVJ4dCttMDlBU0xBaFJYZWlCN2lBbTM4eW4y?=
 =?utf-8?B?UUcwZktZLy80M1RCSlFmSEFqSXBuV1lOMWFaM1NvSkFDSE9NRjBMbWNBR2xL?=
 =?utf-8?B?YytDaGErWTBZbEZjVVpFNEJ3U2sySEF5YTlDeEdUKzJMMDVvSWc2elFRQlRK?=
 =?utf-8?B?VW44Yk9yejNHK3piZTFUUzZJdDA3OStvaW14ZXl3eDZZSlZZaUxlTUVFZHA2?=
 =?utf-8?B?eFhKanFaT3NmajZuaW93a05OTVIyZUpMRWFoMjJMbGJmZHlBVlpVb3FKOTJI?=
 =?utf-8?B?ZC9rai9WSnN2WTZQd2NHT0dOams5cjBoNEQxVG9zMkhNa0I0QUd5SENPb1dk?=
 =?utf-8?B?KzR4U2VDVGZXblVMWXJYYk1sUmpUZlc1dzJjTXg3YnJOK3BJWG1kKzRJemZx?=
 =?utf-8?B?T2c0NTUzMWpwYWpGVXliUTVoaU9yTHFad1VobkF3VzhGMWFMN2k0L25EZFNo?=
 =?utf-8?B?eE5zR1ZqMWxhMElVaDJZSkVyRENxeDJaUUo0NVhOcW0vbGZNWUpXMGFDc2d1?=
 =?utf-8?B?RVhVVmFENUVqeHdON042d2k4SE1nWHBpbWF6UlZxRWFad1J4UTVBcUVIL2hm?=
 =?utf-8?B?UGtBUmJRSllrNG55MmsxOWZYSzZSdFA5cVhxa2g3eDBXcDU4TDJra05NREJw?=
 =?utf-8?B?NGFEY09HVFhodFJlZkt0Z0lNVFNTc1FvZzJUQ2IzZFVDRDVHZ2RRNFFBb3Zm?=
 =?utf-8?B?VHhlWjJNYUZZazdLK0dRcUpIc3pKZWsyV0FKWjFZVFJHTW5rYUhJL2lzMzJB?=
 =?utf-8?B?M0U1UWFyTGNRdzVHaXhBbGJhVDdCbnhrdmFMOXhjUjlzSVN4clRGOFBKeXdL?=
 =?utf-8?B?c09XV1ZLQmpiUjgrKzFuUlRkb2txbWc3bFdLUTFiYWVJN0lnOHBIQVhjUTFw?=
 =?utf-8?B?dmM3TXdtaExYMTd1NWl5emlLaGJwUzVMSHpsUnVKejJoUEJKOXJxK3Y0YklW?=
 =?utf-8?B?NkU3cXlrbjJQSG16ZGdNMG14SXVReVZlQ0oxMXdhbEFmZzhqMXFYeWpjVGZ5?=
 =?utf-8?B?TU5saER6UFY2ZHhyZHZUNW1uUjY5NUdSbzYreXprbkd2SzZnQTB1eWRhSUxS?=
 =?utf-8?B?OE9uVldMREJ3S2RDc0tURG1GQU8xKzl6MGtJdDMxY2tjL2dNbVNTOGowSzY1?=
 =?utf-8?B?RklmSVZNQnErN0N3SmFDQzBTbGZzLzVvU0x0R2JKd0M3VDZsUE45TUNiajlN?=
 =?utf-8?B?NUNZcEdiTEVaWTdXdi9FRTZtSlJmMlR3OWQ4ZXRNbE02UGJCajhxdnNqTWpT?=
 =?utf-8?B?R1hHTklqVVdvRldtQjJQZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VElqZk83aTQ2eERBWjVhOE5OeW5QT2N5NmpCVFVUdyszOEhjdVc4cEpMWjRV?=
 =?utf-8?B?MVpoelpkeVQ5WTlzYXlEdEVFdDc0OE5RbUFGNCs2VGJkbkEyczdTRHlPc3Z3?=
 =?utf-8?B?Y3ZNUDNhc0d0Qk1iQWFJdVRRUEVzSWNoZ3JIZTUvdE0ybkVESlU1eVNKNXN0?=
 =?utf-8?B?NTV3d1VhRHNtaEVSUjM5TWtURWs0TTFUSkRaZlBRNUdKaWdHMU10dXVwZGVh?=
 =?utf-8?B?cG0vZDMyRUlRUzZ2bW1MQUYwWS95bjRkTGIyeUF2MWNNYkRFQVV6YkREdk85?=
 =?utf-8?B?aDhrNzBCTldpOFg1a2NlR1pIc1ovd2dDQ3RYZDl6TWZYR0s2ZC9BakJzQ0My?=
 =?utf-8?B?QXBDQklkSDV3eU0rbTNnRnYyOGIyWnZKZlEyMnpSVTQxYWZ3eUVQYzJVWEhU?=
 =?utf-8?B?ZmJrVi9iSTJLd1lvSTY0cSsrMWdQakdxMXJYUUc5djl5NjlSenp1MjJvL3lx?=
 =?utf-8?B?ZEQvQXJjMlFuUWVRODJnMHNOVkMyNHRiUm9scU4rWmVsSG02MDhsY0x6RUNs?=
 =?utf-8?B?V0hnQks1Si9hNFlaWlpFNlB1OTNXWE5yQ3NVeTlMR1BhYTRqUiswUU1wTUds?=
 =?utf-8?B?dUVBRGhTcjNyRUFRVWlQdW1tdEVSektzMnZiL1ZTWERGdTdQMi9tUG13NEY3?=
 =?utf-8?B?eU1TYnRNeTIvYVJKVjJSMUF4eXJ1aGF0bkcyYkM5azc3K2cyUSsxSzEybGdH?=
 =?utf-8?B?c2p1cW5GYlc2aWVuWmNSb2VGbGNDcTNjaFF4WmwxOTFkZExUQ1ZMNTczUzdW?=
 =?utf-8?B?UFJoRjJLRXBKbk1ISVpRR2wrTWZwM0piam14V2MwTy8yVHVJQmJpSHBGRDJi?=
 =?utf-8?B?akpnc29rMmRmMFNMd25icnBPYlc2WkM1SmJockVJaDdSUXVaQ3FlN0Rpdktm?=
 =?utf-8?B?Y0RXcUF4RWx1MGdVdW1QVFpjWExvQnhWcW92Yy91K01XdExyVXdpYWR3ZWwy?=
 =?utf-8?B?RlA5enJXK2QyclZFM1Z2dkhPTS85YWVhOVd5Tjh4QThpR015N0hrNW13VzdI?=
 =?utf-8?B?NEdnZXVQVUdCTkV2T1JPcGZLWFFMK3RMb1I5WjExdjVlNWx2a1Z5NHZtck5Y?=
 =?utf-8?B?bFhzQ3ZsYmpCYzZFNEsrMmZxL1NwSGQybGN5OHJnTDcrVnVBMERLY2dUVGFD?=
 =?utf-8?B?TlZHV0k4TXljQ0psL0FGbXlBZlBpckJCQnVEYWRJOHUrVzR2d0ZZTThrVDRp?=
 =?utf-8?B?VDZYZjh2WDNQWWVkMXZDTVNxRTdmbG9iYnBaN2hPV21TQTdhTVFOVHJRb01i?=
 =?utf-8?B?ZlZUS1kvUlpmM0ZYckhpM1l4amFFVlorb3JMcjFnWmhKb0tTdHAwaXVLaWNv?=
 =?utf-8?B?dGtNdndpYldZT2ZCNzhxcHkwb0FTNXIzY2ZYLzhmLzBKcDJuWW5wMlYxMXBW?=
 =?utf-8?B?VzVtQmhleHk5czQzVExzdmNwYTRPVFExK1dyVDQ3a0w0OHlreGRkbjNETk1n?=
 =?utf-8?B?YWMzVkU5Rit0L2ViZjRtU2FUS2FXOUEvVDB4K1p0QTlBY2JDT0ZIeTlxYmt1?=
 =?utf-8?B?WHhUNDJDeVpEUlVMZk9hNmUvVzJvWFMrZXFYRlQxVUxhcUxWYXJmdWo0K2RH?=
 =?utf-8?B?TWpHa1BLaWxtUG5hb0QrN0l0YndwZnlidVVwYzZpYnlLSXZRdG1taU45OTkx?=
 =?utf-8?B?TStpQno5Zmd0RE5wZUxNOGFtSkpjWXUzR3BjZzNEU3ZJdkowN3lMWG9RY0VW?=
 =?utf-8?B?UE9iWkQrMG9FZjV1MVcvTDNkSWYyTzZ0UVJ5cU5nT3ZpUWRtSHRDbEJqeS80?=
 =?utf-8?B?T2RobzA2eDEvY2toN0VyVFcyWnlVQzJXOUxkRTJSN0FkV3pYa3hIWjRhbkpN?=
 =?utf-8?B?NFV6NWo2b1VhL0NWSmp5L0cwUWU2U3l2WXEzRG0vNHkzeE9FTlpGR1RHYXN4?=
 =?utf-8?B?QjNCSzhMeTlGeVBtZDRJcDVoNC9HTjBLcUZaOFFOTkR4cmxRMjBuWlhMcFQx?=
 =?utf-8?B?WGZTR0Q4VVZnczQ5V01JQjVmM3d6RUtpSXVDRUNFWVBuR1FoRGMwOGxUQitP?=
 =?utf-8?B?V2o1Nm9BVkpBbkdjdkdnTERPVkx2Sjd3SXo0U1Nxc1gxdnlPVmRQQURNOGxX?=
 =?utf-8?B?NnVwOWo5NU5XVVdHZFN1NU9UNU92ODNEOWV6MU1kQTlaUXlCVGZMMFNIK0xT?=
 =?utf-8?B?WWU2b2xFdzdzYUlGb2p2Q3QzVWp4T3VTMUdINXJHMTlFbnhRZmh5aGg1bkN6?=
 =?utf-8?B?cXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c85b54a-f33c-4e11-d854-08dcd886c298
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:40:48.5064 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p/mXKRdqsEtm6mdnV45DDOXYzr/unR2nlT98Lanv8uXfycMi/mPt4an8P6m96ajDqLY9Nf1fsrhLWDIH1qeS1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6936
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

On 19-09-2024 12:56, Gupta, Anshuman wrote:
>
>> -----Original Message-----
>> From: Poosa, Karthik <karthik.poosa@intel.com>
>> Sent: Thursday, September 19, 2024 12:04 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
>> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
>> Karthik <karthik.poosa@intel.com>
>> Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: Print execution and sleep
>> times
>>
>> Print the workload execution and sleep times of the test to help diagnose
>> timeouts.
>> This will show how long the workload ran and how long the test slept.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c index
>> 0e687558b..3c3b33ab1 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -139,7 +139,7 @@ static void exec_load(int fd, struct
>> drm_xe_engine_class_instance *hwe, unsigned
>>   		elapsed = igt_nsec_elapsed(&tv);
>>   		igt_assert_eq(data->data, done[1]);
>>
>> -		igt_debug("Execution took %.3fms (submit %.1fus, wait
>> %.1fus)\n",
>> +		igt_info("Execution took %.3fms (submit %.1fus, wait
>> %.1fus)\n",
>>   			  1e-6 * elapsed,
>>   			  1e-3 * submit,
>>   			  1e-3 * (elapsed - submit));
>> @@ -150,6 +150,8 @@ static void exec_load(int fd, struct
>> drm_xe_engine_class_instance *hwe, unsigned
>>   		 * Execute the above workload for ~1% of the elapsed time and
>> sleep for
>>   		 * the rest of the time (~99%)
>>   		 */
>> +		igt_info("Sleeping for %ld ms\n", ((elapsed / 10)/1000));
> what is the need of this print ? 'elapsed' is already printed.
Added this to print exact sleep time. I think we can remove it.
>> +
>>   		usleep(elapsed / 10);
>>   	} while (!READ_ONCE(*done));
>>
>> --
>> 2.25.1
