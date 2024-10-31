Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AF9D767D8
	for <igt-dev@archiver.kernel.org>; Thu, 31 Oct 2024 14:29:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAA210E8AF;
	Thu, 31 Oct 2024 14:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nPhZ0mqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEFAD10E8B0
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Oct 2024 14:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730384988; x=1761920988;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VF2rj6RViV0ubbKYxwfIETndxDnwNRBobG+xihko27g=;
 b=nPhZ0mqIOUJKp+fFZyi4bnzn2k1eReSayaDPvey164B89FHuQAVRqg7Q
 A0dFregdmAaCpTpWiI2nlbQlvAuIVNz7rqmyFXxvaE2cZRHBsGUXB0egd
 6VU+ZE4cm8K3I+KkfnAgBZTFD1TAni2MNodXTq0ZNmTrikhQwflyphHKh
 M8BEq+p9BVuEZbBoGfaDI0iBbKvVbJKwqDuHXZQed95EexqwXO9lb9POs
 HGJ8Lt2fKSP3cIOsSWGtvZ8026xM0Fav6qp3J18aWTDDx43URs52qixDw
 pMP7VVe4+M26jM/h9h4fjJ6zS/KkOE0zwWkuSWer2ZttNz2q4NpJLMsN7 Q==;
X-CSE-ConnectionGUID: ImVP48PCShiDg/30tEHYYA==
X-CSE-MsgGUID: RJkcwFDbQgOiHZ0OcjnV2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="47597674"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="47597674"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 07:29:47 -0700
X-CSE-ConnectionGUID: s7gNyajYRXqs4KUWCTYkMA==
X-CSE-MsgGUID: Yf3PO7bKT9mAIjJEQNgn2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="113489450"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2024 07:29:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 31 Oct 2024 07:29:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 31 Oct 2024 07:29:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 31 Oct 2024 07:29:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8UNYOCOhnJ8vNPlPkSV35iWKDhwKOzwmZFRGs7Pl5+en0UkurRSIov9MqTEOhd7474giXjPMocGbp6rvnK0bbIZJe1bK8sbzmts2MQsxL0T9PEHHwy0UX0xNwvE4YVpgSgK53ahxxLro3QNIR+2iaWL8yjlhzynqV1uOQUmtE+Jwyuz1iWo6lHNZdaXo21EXH9fZZoLoDlwiKiUnEX2/HMiS1tsqAIusUHi0bDsSyNf2iITlHlRjiLPQdoB8EtBQuX3hZSnnxnG6cJY9fiYj4adR3fDoDilpgmd6jVr/MNjN1/GEqLfDv6etMFok1k3dEinJ9cf/7PTg247/s40hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VF2rj6RViV0ubbKYxwfIETndxDnwNRBobG+xihko27g=;
 b=uBvL+cHewIAgUOgCOEFgu5LyqVhmmbbzGGqXWI7ukCJ7PsRa+Ro6h8FVgV51bz1Cj3iD5f0F1M7q480z9rCjhIIQ7j2w7fNA1SRmLQW7hD53Op/BWWYRnIIHcD+a4JNrH4eCTcpQV9fchQ+2zprGVv/CfjbQcuL97mVS5ljZxSQePPYMddfY4VycuNsE9J5DnG2bGq827oOMbu29Za4TvbG+foybcu+09rMP1CiLMZ03UtcWmHKKRn4tTCSSMXf1S+n97I5zZim7xcst/Y4p4mHlwv2A8hsAkynV1p+QajtLb1R4o/+ugamGNQkIQ5vLE6f7t1qavhHGKGcy2doqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CH3PR11MB8094.namprd11.prod.outlook.com (2603:10b6:610:156::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 14:29:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 14:29:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Thread-Topic: [PATCH] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Thread-Index: AQHbKkqiFfklfJ4VTUaZW+bXzhxEK7KfQEQAgAGrtaA=
Date: Thu, 31 Oct 2024 14:29:43 +0000
Message-ID: <CH0PR11MB54440F024F3F7B381DEA6569E5552@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241029213621.170938-1-jonathan.cavitt@intel.com>
 <20241030125124.234xdbbvwqfirvl7@kamilkon-desk.igk.intel.com>
In-Reply-To: <20241030125124.234xdbbvwqfirvl7@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CH3PR11MB8094:EE_
x-ms-office365-filtering-correlation-id: 6a493124-bd98-4f5b-3bc0-08dcf9b8764a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RmMxbWhGUWtBOURBY3dIY2MrYkNyT0FtYytHM0Q3RUdKTkhVL2taVXNNWXdr?=
 =?utf-8?B?MHQ5R0NvNEcrd0w5S2tPaGZsNVlodmFvTzJucUE5Q1BtUXdtZGJBcFRVZFp6?=
 =?utf-8?B?amJxbm0vQ2Y0aXdUVTJQOGZOYmVoZEcrMWljOUJURkdTZHJUeGdlM2tlTnZU?=
 =?utf-8?B?S3UwdzhJcURqdjl5d1hKQmIxRzlvMmh2ZTF2c0Nsb3YvQlFIWUJHZ01yb01k?=
 =?utf-8?B?YWJBUWFIcThtTFdNSGJuc05qYTNhc2ZDMzFNeHJQTUhyMmtSbVhadHVUOEJX?=
 =?utf-8?B?cCtsaTlMd0s2VnhCZjlnQm95Slp6cmNFQUhaTklpVFBaZlp2VlVIZlBsY3Ay?=
 =?utf-8?B?Qytnd2MxaC91eUZueC9yZVJ5L0FwcVF3ZDIzc2VKR0ZlMkg1UkdxMmhpVHVn?=
 =?utf-8?B?UXV2bDc3N3pjUnJoOUh0THdNeGUyR051QVhkaWJ2ZlFRbGdMbGFEN0pKajBM?=
 =?utf-8?B?Ulc3TzJlYUxMQ1U3emhLOVErb1h1T2RLZHNZQklkRi84RVlQMUYxNHl2SGxm?=
 =?utf-8?B?MitKVGhEaDlTMm5uQm42UWh4enQvbFF2MDNvRkhkeHVFUmx1SExTQlZITUZ3?=
 =?utf-8?B?WDA5VkFsV0NPdCtyMXV5U3R6c0VCYWZYUy9CeW9PcDZ0bVVkRVFpdDlMb3pI?=
 =?utf-8?B?cEdJRVg3TUhLR0JHZFdoK3pkUWdtUWZCNWdoWFRRUDdSYjR5YTlndlU3SnQ3?=
 =?utf-8?B?YldreEhMOHdWT1hGRkRRZ00xT3BZYWFwVFVMcXpHb002M1htbzhoRjV3WG9E?=
 =?utf-8?B?Z2ZhUXhqSDlCaWRaYkdqRFFFdWcwOU5JT3FlK2JsTG9uUFBSKzdiTzhKSHpt?=
 =?utf-8?B?SVdGVnl6OVE1WWkwQWxFMlU5Skg2djlFWWdBS3EyclFPOG9yK1JsdWpLT05r?=
 =?utf-8?B?bWtDSlBneGhSdlFiNGNvNUZWNHRQR1NRdGI5bkJsZ1JEQWlKQVlxaExyNE1B?=
 =?utf-8?B?bUYzWWI1eWVWejlvTHBHWk84Zk51ZUxDQkVWR3E1Y0kwWWFtQU40SUJsYUU1?=
 =?utf-8?B?NFVYNEREUFFvL1dCS1dsU3p6VlZtWDg5NjZId1BhZGhOcnhEUUtwd3lsYjZo?=
 =?utf-8?B?L1hwcloyWlplelYzckozRUVaM1E3b043ejV2WURzNVJKcWluV29KTjZCaGNE?=
 =?utf-8?B?UHhsQWRCMGZhWW5TZkVlVmZNOUk0RWREWENKUEpNQ3c0UHFEN29LQkZNQnlX?=
 =?utf-8?B?TFd4Sk0vTmR6VWo0MGtKRFNNSUN1OE5iTWhGazFsZWUrOWxURkJWUWhhbEVy?=
 =?utf-8?B?R3Y2bDNza2s0UVBqOTV0TmJzcUloeXZmMy9uZk05MC9YVVFqM0FyQVNiWFcx?=
 =?utf-8?B?aXc5eWlPWXlBR1RLdDRLTllPN05vRlZMZUhLU2RLZVZrRTFOVEMvVWo3L1lr?=
 =?utf-8?B?UHlhMEcvZEZiTW5HN1I3dlI4MlZwYzZldWdjSnFGdTN0WmZDbGsxTUVBVGJz?=
 =?utf-8?B?TlFHMjFWdTdQd2tHeC9hUTZpektJQ0pDa0Zjc1ZoVGNwRDJVRjV4cjJ5VjhH?=
 =?utf-8?B?TlcrQTBnMFdiYkd1WHlwMHBUKzFnUmZwOHBKTHFTTEZXa20rUXZPNWpYSnVP?=
 =?utf-8?B?ME5pRGwxeGUvYTJSUHJUam41QmVIWk5teWN3elVWOXhSYTJ5OFVXTlpsTHYr?=
 =?utf-8?B?USs5bFFIVTIxc01taG9DWVVvM1BIbERxam5NRzNhd2tBbStYZVdieEhld1JV?=
 =?utf-8?B?ZS9qQ0xzbUJwV3pQa1BXQWhNbDhaWFBEMS9RUUp2YU5YbW1YcThjYjNzWE5r?=
 =?utf-8?Q?SZ4fFBb2QtcwvjVIPSEEhZYORaKHvHHmZORrtGh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2htMHpWYksvN2Rla2JkeHBVYjJKd05oVTBxTFpuUjBRRlJOU05KVFBqdXp4?=
 =?utf-8?B?SVFlZnlWeStjRW9xblFGUGQvK29lRTNCZnV5WHdneHcrUWFOYkxpR20rUEc5?=
 =?utf-8?B?UmxDTTE2T3NZTUh2a0ZBbWxxd2x6NVVRck9JalRBRlpFU05xY216R01xWHND?=
 =?utf-8?B?ak11cHY3eEJ2M1ZkWDVKUDFFbG9vUnV6cUIrcHcwTjgxWCtneGxiNGNoUjMz?=
 =?utf-8?B?OGM2MkZtc3NlMVpxbWYzZlFSa3R5czZaTUZVZWVvRytxK05vS2RwM2JPWGtG?=
 =?utf-8?B?QkZxM2I2b3NzYkpjUEJxR0s5b1Z6UDRQcTlMYks2VzhCTCtrRWVvVUVwemJo?=
 =?utf-8?B?KzFKZ0k3RHNjbEFVOGZRcWVOamFMeHBhWGxzeG9MNWZMdHV6UCsvVjBkUTUx?=
 =?utf-8?B?OG9jTDNsbUJiS3k4bFRMVDdrN25LUzZrK1VYcDZzeHdvOFNLaWs2ZFBrWEZ1?=
 =?utf-8?B?ZlNZbHlJbWZ4ZVV2dXB5OE5qMWxOdktRVjNSNDN2R3F6MDU2amt6SEY5eTk4?=
 =?utf-8?B?c0k2clZBQm82VUZ5N3RKMVhUNkQyeXo5MFZKbDdGMjliU3R0YVVWSTlNcVVk?=
 =?utf-8?B?T1F2aVcxQ25hMlk3bE1KcGlsTjZPYjcwQkVmNkZWQ2RaVHJxSTBUOG5PS2NE?=
 =?utf-8?B?TnhiVUYxUStVakVCZ0t3Q1FwNlRtcDZCYXl2K2xYV3Zwd25xZWl4aU1xUW1G?=
 =?utf-8?B?TXc3bkxxbi9QUGN4SVA2YVk2WTNXTGwwSUo5T1FETThzZUkza254bkxQQVp4?=
 =?utf-8?B?S2pFY1I0dkc2V2RiTU13cWJ4bUplUlljL0FEKzJkVWpNQVIzb0k1bkt3bDd6?=
 =?utf-8?B?TldiWTVhMTRjNHJRNHlHYzdNTFJkTGtEYlJwNDE1bytmWWhOd1pxMU1reTg3?=
 =?utf-8?B?TjJYdTNVTStYc3ZDaW5kVkNjcUdlR2s2aytqbUVBNVIwZkllZU16OGI2VWZt?=
 =?utf-8?B?R2pqejhZRmVZL3E3cjZXQXQxdm5CZVBBYkY0VEcvUEZKYU1aQzhMcE9PZWlW?=
 =?utf-8?B?TUpjcW15OU1IQm52d3c0RUh2NERRV0REZXNqNGlNYUhWbTJrNktiWjFLOFJG?=
 =?utf-8?B?a1RlMldydzN4a29kMHdOeFZ5dWt5cWVzTDh2VGFCT3FOdll1VmowVmlIamti?=
 =?utf-8?B?Q2JjaXJnUVlQRU9NaThuRTcvd1NQZjBVM3Nma0ptZmhQSkdxTFBEaURKR1Jr?=
 =?utf-8?B?eC9sR1hOeDMvaytJais3ekFwY0I0WEp5WldpVFRoSzdIWGp2NkN5QnMxKy9m?=
 =?utf-8?B?Wmx2U1lhRXJsQWpXcVUxdkFZdWtTb1ozVlljcEtqSGRkVWtDSzFobnVNRWUz?=
 =?utf-8?B?Q3R5WE16alFCd2h0K21VeWg1UmdsQ05vaGE1Z3JhUk1RUkYrOE9hZFFaMC9H?=
 =?utf-8?B?SnE3UTRJdnpibXBlUmRWWmdDeUNjZXUwMG5HYjlKUjlGeGVNNFpxejUzUVZL?=
 =?utf-8?B?amcwVWQ5S2t3TjZHd1pjVkltQUFjOTBWekdMMkRSZE45WlRwR1owKzFUa3pL?=
 =?utf-8?B?T0ZLemlGYjdvcjUrTGhja0RySCt6UE9wWnpzMlk5ZytQbVhnejVGT1lEaU5V?=
 =?utf-8?B?Nm1pU3IvZkpKcFVaZ2tjK09rNDBlRXZDZURQL0pUTGdCc0RjTC9jaFNNOVpZ?=
 =?utf-8?B?a2liMENuSTBDTFVFSzNTOU9JVFZKN1ZWYVdVQ2xlcndGSlBRU2drd0lxa3ky?=
 =?utf-8?B?N2trR2o1ODBOMnRGL2Fob2xGaEhseDB2WTBpZkt5UWdCOG4xTkVIV2gxaXhj?=
 =?utf-8?B?R0p2SUdxUnVmeVdIU0NoYWZLNkF2elRCcGdtWWNoVWY0ZDlNRHV1WW1NM3NO?=
 =?utf-8?B?SGVCSit1ME1NR3FXTWtlZ21QQTllc2p2UWdwRFdsREt0OTJZNkZ5R1ZQUFdp?=
 =?utf-8?B?Yzdzazd3UGsrTUhMSTdPc1MxUWRISDZ1Yk1tVmpoRWlkUEhMVW1HZlRzTC9p?=
 =?utf-8?B?WWQxUFdpelJFRURtQjBuUHJCWUFDOW1pZ0R3a3FLWXFlQkN1VXBra0N5Qm1h?=
 =?utf-8?B?R0JSaCtybEdXazJoYkNEV1RZNmQxd3BqL3BXNUxsWHE1bkIwWGREbGNPNmp1?=
 =?utf-8?B?VUhvcS9nQVRWRXBiUjBBMzI1OFNRZndZM0syRHFpSXQzM2krNHVSZmM3aUU4?=
 =?utf-8?Q?WSmPkQ91pIV8h+qKYbDmGnBNY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a493124-bd98-4f5b-3bc0-08dcf9b8764a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2024 14:29:43.3593 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EvOlRPFItskkPG34f0GouoRt8jRIvp6B/H1gXzb30lnNoy373L/ZemBUllAddP5+uEi0mKNAQR/3xQi561KPQf6Pscc4jY8GPVdW+NakF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8094
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEthbWlsIEtvbmllY3pueSA8a2FtaWwu
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE9jdG9iZXIgMzAs
IDIwMjQgNTo1MSBBTQ0KVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogQ2F2
aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47IEd1cHRhLCBzYXVyYWJo
ZyA8c2F1cmFiaGcuZ3VwdGFAaW50ZWwuY29tPjsgWnVvLCBBbGV4IDxhbGV4Lnp1b0BpbnRlbC5j
b20+OyBCZWxnYXVta2FyLCBWaW5heSA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQpTdWJq
ZWN0OiBSZTogW1BBVENIXSB0ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb246
IFJlc3RvcmUgcHJlZW1wdCB0aW1lb3V0DQo+IA0KPiBIaSBKb25hdGhhbiwNCj4gT24gMjAyNC0x
MC0yOSBhdCAyMTozNjoyMSArMDAwMCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiA+IFRoZSBz
dWJ0ZXN0cyBvZiBzeXNmc190aW1lc2xpY2VfZHVyYXRpb24gbW9kaWZ5IHRoZSBwcmVlbXB0X3Rp
bWVvdXRfdXMNCj4gPiBhbmQgdGltZXNsaWNlX2R1cmF0aW9uX3VzIHZhbHVlcy4gIEhvd2V2ZXIs
IHdoaWxlIHRoZSB0ZXN0IGRvZXMgcmVzdG9yZQ0KPiA+IHRoZSB0aW1lc2xpY2VfZHVyYXRpb25f
dXMgdmFsdWUgYXQgdGhlIGVuZCBvZiBleGVjdXRpb24sIGl0IGRvZXMgbm90IGRvDQo+ID4gdGhl
IHNhbWUgZm9yIHByZWVtcHRfdGltZW91dF91cy4gIEJlY2F1c2UgdGhlIHZhbHVlIGlzIG5vdCBw
cm9wZXJseQ0KPiA+IHJlc3RvcmVkLCBmdXR1cmUgdGVzdHMgY2FuIGVuZCB1cCB1c2luZyB0aGUg
dW5leHBlY3RlZCBwcmVlbXB0IHRpbWVvdXQNCj4gPiB2YWx1ZSBhbmQgdGh1cyBoYXZlIHVuZXhw
ZWN0ZWQgYmVoYXZpb3IuDQo+ID4gDQo+ID4gU2F2ZSBhbmQgcmVzdG9yZSB0aGUgcHJlZW1wdF90
aW1lb3V0X3VzIHZhbHVlIGR1cmluZyB0aGUgdGVzdC4NCj4gPiANCj4gPiBUaGlzIGZpeCBkb2Vz
IG5vdCBhcHBseSB0byB4ZV9zeXNmc19wcmVlbXB0X3RpbWVvdXQgYmVjYXVzZSBvbmx5IHRoZQ0K
PiA+IHByZWVtcHRfdGltZW91dF91cyBpcyBtb2RpZmllZCBkdXJpbmcgdGhvc2UgdGVzdHMsIGFu
ZCB0aGUgdmFsdWUgaXMNCj4gPiBjb3JyZWN0eSByZXN0b3JlZCBiZWZvcmUgdGhlIHRlc3RzIGVu
ZC4NCj4gPiANCj4gPiBDbG9zZXM6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
eGUva2VybmVsLy0vaXNzdWVzLzI5NzYNCj4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZp
dHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4gQ0M6IFZpbmF5IEJlbGdhdW1rYXIg
PHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICB0ZXN0cy9pbnRlbC94
ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24uYyB8IDYgKysrKystDQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMgYi90ZXN0cy9pbnRl
bC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb24uYw0KPiA+IGluZGV4IGNmOTVhM2FjMWMuLjY5
MTJmMTY2YjQgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNsaWNl
X2R1cmF0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVy
YXRpb24uYw0KPiA+IEBAIC0xMTUsMTAgKzExNSwxMSBAQCBzdGF0aWMgdWludDY0X3QgX190ZXN0
X3RpbWVvdXQoaW50IGZkLCBpbnQgZW5naW5lLCB1bnNpZ25lZCBpbnQgdGltZW91dCwgdWludDE2
Xw0KPiA+ICBzdGF0aWMgdm9pZCB0ZXN0X3RpbWVvdXQoaW50IGZkLCBpbnQgZW5naW5lLCBjb25z
dCBjaGFyICoqcHJvcGVydHksIHVpbnQxNl90IGNsYXNzLCBpbnQgZ3QpDQo+ID4gIHsNCj4gPiAg
CXVpbnQ2NF90IGRlbGF5c1tdID0geyAxMDAwLCA1MDAwMCwgMTAwMDAwLCA1MDAwMDAgfTsNCj4g
PiAtCXVuc2lnbmVkIGludCBzYXZlZDsNCj4gPiArCXVuc2lnbmVkIGludCBzYXZlZCwgb2xkX3B0
Ow0KPiA+ICAJdWludDY0X3QgZWxhcHNlZDsNCj4gPiAgCXVpbnQ2NF90IGVwc2lsb247DQo+ID4g
IA0KPiA+ICsJaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lLCAicHJlZW1wdF90aW1l
b3V0X3VzIiwgIiV1IiwgJm9sZF9wdCkgPT0gMSk7DQo+ID4gIAlpZ3RfcmVxdWlyZShpZ3Rfc3lz
ZnNfcHJpbnRmKGVuZ2luZSwgInByZWVtcHRfdGltZW91dF91cyIsICIldSIsIDEpID09IDEpOw0K
PiA+ICAJaWd0X2Fzc2VydChpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lLCBwcm9wZXJ0eVswXSwgIiV1
IiwgJnNhdmVkKSA9PSAxKTsNCj4gPiAgCWlndF9kZWJ1ZygiSW5pdGlhbCAlczoldVxuIiwgcHJv
cGVydHlbMF0sIHNhdmVkKTsNCj4gPiBAQCAtMTQwLDYgKzE0MSw5IEBAIHN0YXRpYyB2b2lkIHRl
c3RfdGltZW91dChpbnQgZmQsIGludCBlbmdpbmUsIGNvbnN0IGNoYXIgKipwcm9wZXJ0eSwgdWlu
dDE2X3QgY2xhDQo+ID4gIAl9DQo+ID4gIA0KPiA+ICAJc2V0X3RpbWVzbGljZV9kdXJhdGlvbihl
bmdpbmUsIHNhdmVkKTsNCj4gPiArCWlndF9hc3NlcnRfbHRlKDAsIGlndF9zeXNmc19wcmludGYo
ZW5naW5lLCAicHJlZW1wdF90aW1lb3V0X3VzIiwgIiV1Iiwgb2xkX3B0KSk7DQo+IA0KPiBMb29r
cyBnb29kIGJ1dCBpdCB3aWxsIG5vdCByZWFjaCB0aGlzIGxpbmUgaWYgYW55DQo+IGlndF9hc3Nl
cnQvcmVxdWlyZSB0cmlnZ2VycyBiZWZvcmUuDQoNCk91dCBvZiBmYWlybmVzcywgdGltZXNsaWNl
X2R1cmF0aW9uX3VzIGFsc28gaGFzIHRoaXMgcHJvYmxlbSBpbiB0aGlzIHRlc3QsDQphbmQgcHJl
ZW1wdF90aW1lb3V0X3VzIGFsc28gaGFzIHRoaXMgcHJvYmxlbSBpbiB4ZV9zeXNmc19wcmVlbXB0
X3RpbWVvdXQuYy4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwN
Cj4gDQo+ID4gKwlpZ3Rfc3lzZnNfc2NhbmYoZW5naW5lLCAicHJlZW1wdF90aW1lb3V0X3VzIiwg
IiV1IiwgJnNhdmVkKTsNCj4gPiArCWlndF9hc3NlcnRfZXEoc2F2ZWQsIG9sZF9wdCk7DQo+ID4g
IH0NCj4gPiAgDQo+ID4gIGlndF9tYWluDQo+ID4gLS0gDQo+ID4gMi40My4wDQo+ID4gDQo+IA0K
