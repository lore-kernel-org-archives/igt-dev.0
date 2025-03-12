Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39F0C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 11:10:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4950510E76D;
	Wed, 12 Mar 2025 11:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IVu+Pojp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C65C10E2CA
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741777835; x=1773313835;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=MEqsf7F9rtn40f0FX/Hf2kZVGDFl+2HX5VzJD7KjD5M=;
 b=IVu+PojpJXwJj+20Ywzh0UaQjMYYOf7GuPCFS1tBMMqfEUMF1fo/WtWE
 QDt2vAEiX/xHuCY6kkDkjInmH3nR4R4WPf67DLVOcjbS2iNIm6PX8juyH
 I6AA2YM8OQ41L97DX+L8D0pJOefFhC2hR45GdU63Vk/GWtNGBP1IcgEjb
 Q+3QB+IltNo1gA/ZvS/Y/StEnw4PkLPZq6eOz4UVJCEjMaZkI1VSenQ19
 OwMJPtwpJ3fPj0QI2oIh3lAHEjh9YBHRCDQxNMHAnE6fY66MKC5F58hMn
 qTugy7d8k8BNjIVn0nKYGvT5dD2bm9fdNwRuD3KwuBNfCVrGoxnRb1HjR A==;
X-CSE-ConnectionGUID: LA1WT3NuSx++wFOVWjUzBA==
X-CSE-MsgGUID: pvnQJpPxTy6E8LSqQYGrzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42762948"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208,217";a="42762948"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 04:10:35 -0700
X-CSE-ConnectionGUID: 6e3tMLNGRs68QZd8u0DTMQ==
X-CSE-MsgGUID: X2KJRTiHT8G4INZdcoep7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
 d="scan'208,217";a="120556703"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 04:10:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Mar 2025 04:10:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 04:10:33 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 04:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GbUO+5klrrwsACR8WfwaPS+EjjeJ7loOs+sTiOkW2NK6fCIsCLUPXBFweb5ahZO09Z6NLc2H6QTGRjJpe1K+uPnknP/vfOdp6I9GJj7igW9T3rHZW7sabnf75tJ4X7YCKvV8CgevAFWB+LKpx89ENzIz/68Y4xEl7C97gh25MQUMv8mLiOxlz0q6kLqYvX4q59NVc5meN3BGLQma9PNVJTS1VekxNd9aYKDBWrKDNX26pz99XXipqz8PLB0TPcVeDAJYE3sWeQauOkhmRvAtY2XQToRJja1Az+lDid0MJt4+zkHqTVaTY0TBXS/oMlbo2lMbfcD9rdSFyvkc1fvPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0gJrV/OhUB7VIDiPiDR/UiJHNB2tVBJH2fKtyvY+08=;
 b=ul87onCjGBIhppmEaoEvkNPMCiWd69L9xAqVDrwC1lwcaOo6/v8A0I7Mn2XSv1RsZFZ91CVWG3ZIO7KjOcU23LaoyCpHVNTwVK6COO+0qOvhojJwU/jYdgi7jtPvpPNiaWuT8W2HtfsVAfePxPeGaiav/zqS4VIGWusb1t03Wbpju1Gab+GgzHaEcmqVxDB4onpqCbdspBf7PZ/LTmfKaYydp60Ukon21JXK2Is/CP0M7sFJ/n9IA/AOlaZ47wEnyQKRJCpeObTP/dOnDaG/pJrg/N+VDbbNKgRbgnNAcPUlAPuGIOWgXA+R9i4oLWpZuCSZGWmi66ot/skWzwd92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 11:10:26 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::55b1:592:df13:a9f3%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 11:10:26 +0000
Content-Type: multipart/alternative;
 boundary="------------KAwjS0DAADsNIGf2lL6fjJZT"
Message-ID: <47ec17a6-2de5-480d-b9c2-93c81962e186@intel.com>
Date: Wed, 12 Mar 2025 16:40:20 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/kms?=
 =?UTF-8?Q?=5Fcursor=5Fcrc=2E=3A_Test_async_cursor_crc_=28rev2=29?=
To: <igt-dev@lists.freedesktop.org>
References: <20250311043002.127979-1-shekhar.chauhan@intel.com>
 <174167776131.17064.16514652837640203023@18a75f3d1eae>
Content-Language: en-US
From: "Chauhan, Shekhar" <shekhar.chauhan@intel.com>
In-Reply-To: <174167776131.17064.16514652837640203023@18a75f3d1eae>
X-ClientProxiedBy: MA1PR01CA0143.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::13) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|CY8PR11MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 955cd183-27c9-4b81-5859-08dd61567d7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjBRUUdyTVNkbjlqR2lnZWZvcmhoMGM5N0NxMUNURnhxdUIyelBEd3V5Zkd1?=
 =?utf-8?B?empNNHJZbHlobGlzYlVqdTF6OElnSG44eGtjbmhMbmd1Y3RmK2RGdU9ZSGEx?=
 =?utf-8?B?YVloNkVYelhLWDN4Rzg5dnowbU1JZUl3L25TWkd3dmdPNVQrckZIZjVCMXRV?=
 =?utf-8?B?c1Q4Y25JZW9kQWplM05pZGhnc0Y4bm1GSG5aWDNOOGpUa09XOEZHdzdNV1Qw?=
 =?utf-8?B?cElEZWdGaldnSGhLUWFPcGhIcVVkNm1VWDhzTlVIOFhYTTVId0txbGM0Sm53?=
 =?utf-8?B?REROa01XRkZhQ1JkcFIxZlU0YWZQS2tWQnRTNUxmQStLMnc5Wm1zQ001T2E3?=
 =?utf-8?B?SXhOYkI3d2dwT2EyUk16bGM0NmRnTDU0RG9XVEE2VWE5VDVUVXNBR3FmZ2l6?=
 =?utf-8?B?V0FMWGxBMCttS1dIT1dqZG5PMkY4c01HMjB0eWdPQzFqanBSNFJFTFhHeS9s?=
 =?utf-8?B?cVBPMGFWa0U1ZFJ2aTdLRkI5V1ZDWnhhU3lhMkFkWDV6WTdTaWk2enpoY2dx?=
 =?utf-8?B?bmZZdjJ4dWI4WDhGbUJDUDdyQ0NCeE1Sdm9HVE9oSVhIQWdqaXU0Z2NlQ0ZK?=
 =?utf-8?B?Yk9MbmUvOEg2SjRWcDdDNVRKV0FCZUM1eE1IWHpjM0F6ODcxQ2VqMVFDeVNW?=
 =?utf-8?B?SGZEZnlRczYrNXkvL2NZdDV2YituNGtKYnByYi9nRWpDVXFtUkx0bjczQjhX?=
 =?utf-8?B?bWJWL3VIQk1ndHU5SlQyYkVQWFhuaUF2bWJSQVJ4RHp5SUkvYnA0VTI5VnBZ?=
 =?utf-8?B?QVJWWDV1NlRneWN2UTJ1cHpXUGhZeDNKNU9EWmY4TE13T0hMRGw1NGNZWDA5?=
 =?utf-8?B?YWhNZW5JNk9ncHZtN1dFZVJ2SVkxdXVjdlhEUTVOalZ3eTNhZjlFOVZSRnhU?=
 =?utf-8?B?Z0toa2t6Mm83SjNBbURyUDJDSFhtcXhHUmhUZVRtWlFaOXdhckNJN2dGU1VY?=
 =?utf-8?B?QzJzcEtMZGM1aHd5bCs0UEp0ZnZlQzloUnJFMVFMbDdXQ2NUWGtweGRnWHhK?=
 =?utf-8?B?TG1KM0NRS0MyWGJtbWtjSzZCMFFVOHRLeVBRR1FNOUtHTXA4N2Y4WGZuaENS?=
 =?utf-8?B?bzgwaXZLVjMxSkRUdU55TU9yQmNIQkRac0hZQm1RbmJ5WDUyYzErT1dBZFYw?=
 =?utf-8?B?V1BtL3BFSlh6MjU2WU1ILzdsUkNrc3owdzRsZUp1c0phQkVTRzNBK2JtZHVU?=
 =?utf-8?B?cEppZmRKQjJIWndvV0lwNDE4M1VZQTFreE1xdHNFWmtWUDBCT1h2QkYvejYy?=
 =?utf-8?B?R2RoZzVLV2NReHU2UTc3TXR5Q3lEV2RSY0NFRk1kZ0Z3UTVucVhtQVlKQW5E?=
 =?utf-8?B?cm1NNjdXR25zZWd4S1NUMFlvZjJPTHh3d1NldzErRzQ3V0dxbTRuMExxU2RJ?=
 =?utf-8?B?QzdEYzhvaldCRUNmVUJzVm15QWJHOU5EZFZPOFZvQk1uZFZLakpaaXd5em1L?=
 =?utf-8?B?MnFzSXIzRmI4SlQvd0M3TUlQZ3RkaDNrRWVEZmVXdEgzL25EcEpESFZ1dEI1?=
 =?utf-8?B?cm4wbXZldnJ0aHhRS2taZCtQNGppZWNpRWs0U1FaamlXVVpFRjFCUjl2THFZ?=
 =?utf-8?B?UnA2L01oWWhJMmYzMlc3Y0M1Z3BMVVQrQk9kQlhNVFVXeDBCWi85RXE3enRZ?=
 =?utf-8?B?RmpjVFVUNkVvazVtTTFFdHpldGxBYkF3ODlMYURZaXRnYTdvcnU0RVMydzNs?=
 =?utf-8?B?amwreTNUdXhzZmh0R1hLN3lUelJSV3FKSm1aWmZBdnBScnJ0czFVOTNwMTlN?=
 =?utf-8?Q?+EcpU12oU6jNqg2pIM2B42s0pEaLTg7+sWfmrnj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmJkQ29senlPYVlldjBwbURBNkRxUDdLY0ZDNVNpcGVya0xrc1VycEtsL3B0?=
 =?utf-8?B?VEhPOXAwbXdFS3NrNHB2QXVENmlWRUpEaTZtMC82UDRvMEYyWHM4MlRtVnZ0?=
 =?utf-8?B?ZTNZdklRRGh6NGI3TjlqOEUrdkpiUjdxUnNtcEIrMGlXbW5CRThlU1lmTGo2?=
 =?utf-8?B?dnhpajVtUitsbWZFay9QVVo0YUQzbHBvVUpISks0SUw4UFF0NndlQlErUkZm?=
 =?utf-8?B?WG5vSWl2L3JEV2psUGtBQkZtcE5BQW5YRFpEaHBOeExRNGhjMmNiK1VKeUxh?=
 =?utf-8?B?UGhtWkVZcTRGaDhPa0N3NW9KY1UxRFArMlpDeDk5Q2F2T2dPMm9LTkFFOTFZ?=
 =?utf-8?B?U2RocTJMWTZnbXl3TzJKaTY4aE9YZlNQd2FneVFxcWoyOVdDenNtZkRNeEFI?=
 =?utf-8?B?bnUwNE9BOWFQQk51bis2a1UxaUZMRGxZUEJXMkFBaWFDOTYzYkJ5RXBBYm5T?=
 =?utf-8?B?bU5wVUJYQ1NlUkx2YTdmUjNZYUgxN1BFRmpERGJLNHh4QnBMR3lwNU50dmJ0?=
 =?utf-8?B?VVhXL1A5RUNNTUxqUHBORVlqeTY3ekNVeEp2VnBUeW95YWkwUXo4UDM3SnBB?=
 =?utf-8?B?S2RjcDZXSExEd3dMUmNpais3REVIaEVDNjFBRmxMZ0p5ZkdHUHJySldLZVA5?=
 =?utf-8?B?UWJST0xTc1hlU2FUeVRJd2R6b1o3Q2RSNnJaWFdoQlpKOEg2dlBBOEppQ0pZ?=
 =?utf-8?B?RWI1QjRXK2tFZmxUZnY3Mk01Q3E3L1JlZE8wNncvN2cvcXRVNWxWbFcyWkw0?=
 =?utf-8?B?b2cza0VEMzhIMzk4ckM3ajhiLzRSajlFUzcxUEs2eG5LcmFxdk55UCtHMjM1?=
 =?utf-8?B?VUhmUmtoTTNzbTFFb0hYK1BwMDl3S1JaeVlvZDZpU2FlaUQxd2tTcEhNTUNQ?=
 =?utf-8?B?N1E4bWFqdkVSM0xOSWV4L3l3SmY3Rkg3bk9JL3VPcDU2YU5TaFU0YVc3dXF0?=
 =?utf-8?B?SlZBdDZpL09lZ3NBN0VOTjNpb091L1lVeVFnY3c3RlNuWFdFR0ZZZkZLajNz?=
 =?utf-8?B?NGNzRllKby9DM3JrcS92YTI1Zk5xcmVBMWZqRGJTZzhjUEhFbElFdDhsdGMy?=
 =?utf-8?B?S3BYaVZRaTlEVFg1eW45Uy8vSTVXN1ZVc1JLNnJNem1nZHJvR1J1YXFSSEVr?=
 =?utf-8?B?OHdQVStubzZYcDVWR1NkU2dkcVB2UUlYeHVGNlV4d1BQWkI0YTR4MTN0NEJj?=
 =?utf-8?B?QzF3QTZOMGVOcXBYWjhzS2VKVGg5bVc0OW1iNG9xeHRWSGtDQnNBV2xEbkdI?=
 =?utf-8?B?Qi84SjVjL0xmWjJ0WTBoUWJhbzRDbDFTdFpzVTNFb1EyZ09yMDlweVphOG1G?=
 =?utf-8?B?VkYzUis4aGFsV09mTmt5YmtnM045a2JnNE8vL2tKbzJCYlpGZUJZM2hvTU1K?=
 =?utf-8?B?anM0SzNXQmhTQ29xY3VhZUZYbkJnZFlNdHJBQWluV3N0SXlOTVR6SkpQT004?=
 =?utf-8?B?cWJlTjBSVHhDYnhGRG9NTmcycEFyaWsrVnVJRGZOTVFsMVE4S3NZbU5YZDlS?=
 =?utf-8?B?VDkyRU5TN21QR0R6VFJUY1ZxZ1paNVNFUXhFMllxUkJRSTRjaXZtaWh1TXN2?=
 =?utf-8?B?clU1bGhvd3VaV0NhZThjTzVvRXVKV0d5T0trSFdoNm8yMW9zMnJoWnk1UEVK?=
 =?utf-8?B?aEFEWER2Uk02VXhoU0wvMHNaZ0E5aUhsSFkzcmIweWdTWUUzaDdsbWJOa1Vu?=
 =?utf-8?B?NmFndldUcU1tWXBBTStsakdmQUlkUVptU3Z2VjhvZy8rdEZGVmJ4dlJOQXlz?=
 =?utf-8?B?K2YybThpbnZiV3RZUGkyemMrT0VwRlRwSzdxeW5xNGlKVm1qZmxnQU5ZSmlV?=
 =?utf-8?B?YVdIRmk0OWtFL2NoNVdpZ0RHZ1hDWVZjK1NmUkNLYnQvMG1wUFNneW9DaEFJ?=
 =?utf-8?B?aXlUTGxJdnJzV0tZSm1EZFppTnJ4QlZoTDFGSi9wcWZjWXJGR21BS2NCVnVR?=
 =?utf-8?B?SEcxSXlZK1pVN3VpYyttajNidVVNMjBmODN4NXo2R1hEcktVMkdFUzg5VEgx?=
 =?utf-8?B?YVZFQzZyUldRaEpFTm1nbkhPeFYzMzJRcThkRkpzTWlWTU04MTdnYkI2dk00?=
 =?utf-8?B?SVRmbFd5UExZZDFtYlRvbi80SVQxNHhIVXpJZUlNYW5aL0l2aExHbmhuOFJ4?=
 =?utf-8?B?c2d4SXJIU1ZmVU5neko5QVd6UjV3T1Rqdi9XMWx5RkVnNjBOSVMzTWErelZw?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 955cd183-27c9-4b81-5859-08dd61567d7e
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 11:10:26.6584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/pOnrZ7izFjV02bzPWnl5UmxsGU5rO1sdrYU541IMkeXQzenHIDWjr5orcxxZyRtjaZ718WGcJiQYylzWxSZ01KMWWX6uL2MQbxsXZ8EXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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

--------------KAwjS0DAADsNIGf2lL6fjJZT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Failures unrelated.

On 3/11/2025 12:52, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/kms_cursor_crc.: Test async cursor crc (rev2)
> *URL:* 	https://patchwork.freedesktop.org/series/146062/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html
>
>
>   CI Bug Log - changes from CI_DRM_16261_full -> IGTPW_12741_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_12741_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_12741_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html
>
>
>     Participating hosts (11 -> 10)
>
> Missing (1): pig-kbl-iris
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_12741_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@kms_draw_crc@draw-method-blt:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk3/igt@kms_draw_crc@draw-method-blt.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk3/igt@kms_draw_crc@draw-method-blt.html>
>         +1 other test dmesg-warn
>  *
>
>     igt@kms_flip@plain-flip-ts-check@a-vga1:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb5/igt@kms_flip@plain-flip-ts-check@a-vga1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@plain-flip-ts-check@a-vga1.html>
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_16261_full and 
> IGTPW_12741_full:
>
>
>       New IGT tests (18)
>
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change:
>
>       o Statuses : 6 pass(s)
>       o Exec time: [0.51, 1.85] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.59] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-hdmi-a-1:
>
>       o Statuses : 4 pass(s)
>       o Exec time: [0.27, 0.82] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.56] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-b-hdmi-a-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.40] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-c-hdmi-a-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.48] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.26] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-hdmi-a-1:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.24, 0.35] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-hdmi-a-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.34] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change:
>
>       o Statuses : 6 pass(s)
>       o Exec time: [0.52, 1.80] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.58] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-hdmi-a-1:
>
>       o Statuses : 3 pass(s)
>       o Exec time: [0.27, 0.89] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-hdmi-a-3:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.47, 0.53] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-b-hdmi-a-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.39] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-c-hdmi-a-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.58] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-edp-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [1.22] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-hdmi-a-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.24] s
>  *
>
>     igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-hdmi-a-3:
>
>       o Statuses : 2 pass(s)
>       o Exec time: [0.35] s
>
>
>     Known issues
>
> Here are the changes found in IGTPW_12741_full that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@api_intel_bb@blit-reloc-keep-cache:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@api_intel_bb@crc32:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@api_intel_bb@crc32.html>
>         (i915#6230
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230>)
>  *
>
>     igt@api_intel_bb@object-reloc-purge-cache:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html>
>         (i915#8411
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411>)
>  *
>
>     igt@debugfs_test@basic-hwmon:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@debugfs_test@basic-hwmon.html>
>         (i915#9318
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318>)
>  *
>
>     igt@drm_fdinfo@busy-check-all@bcs0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@drm_fdinfo@busy-check-all@bcs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +7 other tests skip
>  *
>
>     igt@drm_fdinfo@busy-check-all@ccs0:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@drm_fdinfo@busy-check-all@ccs0.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +9 other tests skip
>  *
>
>     igt@drm_fdinfo@busy-check-all@vecs1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@drm_fdinfo@busy-check-all@vecs1.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +10 other tests skip
>  *
>
>     igt@drm_fdinfo@busy-idle-check-all@vcs0:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@drm_fdinfo@busy-idle-check-all@vcs0.html>
>         (i915#11527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527>
>         / i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>         +6 other tests skip
>  *
>
>     igt@drm_fdinfo@busy-idle-check-all@vecs1:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@drm_fdinfo@busy-idle-check-all@vecs1.html>
>         (i915#8414
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414>)
>  *
>
>     igt@gem_ccs@block-multicopy-compressed:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@block-multicopy-inplace:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_ccs@suspend-resume.html>
>         (i915#9323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323>)
>  *
>
>     igt@gem_create@hog-create:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-3/igt@gem_create@hog-create.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@gem_create@hog-create.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +23 other tests dmesg-warn
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@rcs0:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html>
>         (i915#12353
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353>)
>  *
>
>     igt@gem_ctx_persistence@engines-queued:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb6/igt@gem_ctx_persistence@engines-queued.html>
>         (i915#1099
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099>)
>         +1 other test skip
>  *
>
>     igt@gem_ctx_persistence@hang:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_ctx_persistence@hang.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_ctx_persistence@heartbeat-close:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-close.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_eio@hibernate:
>
>       o shard-tglu-1: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_eio@hibernate.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975>)
>       o shard-dg2: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@gem_eio@hibernate.html>
>         (i915#7975
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975>)
>  *
>
>     igt@gem_eio@in-flight-internal-immediate:
>
>       o shard-mtlp: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@gem_eio@in-flight-internal-immediate.html>
>         (i915#13193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193>)
>  *
>
>     igt@gem_eio@in-flight-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk2/igt@gem_eio@in-flight-suspend.html>
>         (i915#13390
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390>)
>  *
>
>     igt@gem_exec_balancer@bonded-false-hang:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_balancer@hog:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@gem_exec_balancer@hog.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +2 other tests skip
>  *
>
>     igt@gem_exec_balancer@noheartbeat:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@gem_exec_balancer@noheartbeat.html>
>         (i915#8555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555>)
>  *
>
>     igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>  *
>
>     igt@gem_exec_balancer@parallel-out-fence:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html>
>         (i915#4525
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_big@single:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-8/igt@gem_exec_big@single.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gem_exec_big@single.html>
>         (i915#11713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713>)
>  *
>
>     igt@gem_exec_fence@submit:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_exec_fence@submit.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_flush@basic-uc-rw-default:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_exec_flush@basic-uc-rw-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>  *
>
>     igt@gem_exec_flush@basic-uc-set-default:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>)
>  *
>
>     igt@gem_exec_flush@basic-wb-rw-before-default:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-before-default.html>
>         (i915#3539
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539>
>         / i915#4852
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852>)
>         +1 other test skip
>  *
>
>     igt@gem_exec_reloc@basic-gtt-cpu-noreloc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +8 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-softpin:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +7 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-wc-read-noreloc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@gem_exec_reloc@basic-wc-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +10 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +6 other tests skip
>  *
>
>     igt@gem_exec_reloc@basic-write-wc-noreloc:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_exec_reloc@basic-write-wc-noreloc.html>
>         (i915#3281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281>)
>         +5 other tests skip
>  *
>
>     igt@gem_exec_schedule@semaphore-power:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#7276
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +2 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>         +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gem_exec_schedule@semaphore-power.html>
>         (i915#4537
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537>
>         / i915#4812
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812>)
>  *
>
>     igt@gem_exec_suspend@basic-s4-devices:
>
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk3/igt@gem_exec_suspend@basic-s4-devices.html>
>         (i915#13661
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13661>)
>         +1 other test abort
>  *
>
>     igt@gem_exec_whisper@basic-queues:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb5/igt@gem_exec_whisper@basic-queues.html>
>         +73 other tests skip
>  *
>
>     igt@gem_fence_thrash@bo-write-verify-y:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-y.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-y.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +2 other tests skip
>  *
>
>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>  *
>
>     igt@gem_fenced_exec_thrash@too-many-fences:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@gem_fenced_exec_thrash@too-many-fences.html>
>         (i915#4860
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860>)
>         +2 other tests skip
>  *
>
>     igt@gem_huc_copy@huc-copy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@gem_huc_copy@huc-copy.html>
>         (i915#2190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190>)
>  *
>
>     igt@gem_lmem_evict@dontneed-evict-race:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>
>         / i915#7582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582>)
>  *
>
>     igt@gem_lmem_swapping@heavy-random:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@gem_lmem_swapping@heavy-random.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +4 other tests skip
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-multi-ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +11 other tests skip
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +7 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html>
>         (i915#12193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193>)
>  *
>
>     igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html>
>         (i915#4565
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565>)
>  *
>
>     igt@gem_lmem_swapping@smem-oom@lmem0:
>
>       o shard-dg2: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>         +1 other test dmesg-warn
>  *
>
>     igt@gem_lmem_swapping@verify-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html>
>         (i915#4613
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613>)
>         +5 other tests skip
>  *
>
>     igt@gem_lmem_swapping@verify-random:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-8/igt@gem_lmem_swapping@verify-random.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@gem_lmem_swapping@verify-random.html>
>         (i915#13465
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465>
>         / i915#13571
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571>)
>         +1 other test abort
>  *
>
>     igt@gem_mmap_gtt@basic-small-bo:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gem_mmap_gtt@basic-small-bo.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +9 other tests skip
>  *
>
>     igt@gem_mmap_gtt@cpuset-big-copy:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_mmap_gtt@cpuset-big-copy.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +7 other tests skip
>  *
>
>     igt@gem_mmap_gtt@medium-copy-odd:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-odd.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +8 other tests skip
>  *
>
>     igt@gem_mmap_wc@copy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gem_mmap_wc@copy.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +4 other tests skip
>  *
>
>     igt@gem_mmap_wc@fault-concurrent:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_mmap_wc@fault-concurrent.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +2 other tests skip
>  *
>
>     igt@gem_mmap_wc@write-gtt-read-wc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +4 other tests skip
>  *
>
>     igt@gem_mmap_wc@write-read:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@gem_mmap_wc@write-read.html>
>         (i915#4083
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083>)
>         +3 other tests skip
>  *
>
>     igt@gem_partial_pwrite_pread@reads-uncached:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-uncached.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +1 other test skip
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-glk: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@gem_pread@exhaustion.html>
>         (i915#2658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@gem_pread@exhaustion.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +4 other tests skip
>  *
>
>     igt@gem_pread@snoop:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_pread@snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_pread@snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +4 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_pread@snoop.html>
>         (i915#3282
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282>)
>         +3 other tests skip
>  *
>
>     igt@gem_pxp@create-valid-protected-context:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@gem_pxp@create-valid-protected-context.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_pxp@create-valid-protected-context.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +2 other tests skip
>  *
>
>     igt@gem_pxp@hw-rejects-pxp-context:
>
>       o shard-rkl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-context.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +3 other tests timeout
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html>
>         (i915#13398
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@gem_pxp@hw-rejects-pxp-context.html>
>         (i915#13398
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398>)
>  *
>
>     igt@gem_pxp@protected-raw-src-copy-not-readible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>         +3 other tests skip
>  *
>
>     igt@gem_pxp@regular-baseline-src-copy-readible:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test timeout
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-off-3:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-off-3.html>
>         (i915#4270
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270>)
>  *
>
>     igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +2 other tests skip
>  *
>
>     igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html>
>         (i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +4 other tests skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>
>         / i915#8428
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428>)
>         +4 other tests skip
>  *
>
>     igt@gem_render_tiled_blits@basic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@gem_render_tiled_blits@basic.html>
>         (i915#4079
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079>)
>  *
>
>     igt@gem_tiled_partial_pwrite_pread@reads:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@gem_tiled_partial_pwrite_pread@reads.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>)
>         +14 other tests skip
>  *
>
>     igt@gem_userptr_blits@dmabuf-sync:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@gem_userptr_blits@dmabuf-sync.html>
>         (i915#3323
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323>)
>  *
>
>     igt@gem_userptr_blits@sd-probe:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>
>         / i915#4958
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958>)
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-after-close:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +1 other test skip
>  *
>
>     igt@gem_userptr_blits@unsync-unmap-cycles:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>         +3 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap-cycles.html>
>         (i915#3297
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297>)
>  *
>
>     igt@gem_workarounds@reset-fd:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-6/igt@gem_workarounds@reset-fd.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@gem_workarounds@reset-fd.html>
>         (i915#13193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193>)
>  *
>
>     igt@gen3_render_tiledx_blits:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gen3_render_tiledx_blits.html>
>         +13 other tests skip
>  *
>
>     igt@gen9_exec_parse@allowed-single:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@gen9_exec_parse@allowed-single.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@batch-invalid-length:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +6 other tests skip
>  *
>
>     igt@gen9_exec_parse@batch-zero-length:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gen9_exec_parse@batch-zero-length.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>  *
>
>     igt@gen9_exec_parse@bb-oversize:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@gen9_exec_parse@bb-oversize.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>)
>         +3 other tests skip
>  *
>
>     igt@gen9_exec_parse@cmd-crossing-page:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html>
>         (i915#2527
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527>
>         / i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +2 other tests skip
>  *
>
>     igt@gen9_exec_parse@secure-batches:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gen9_exec_parse@secure-batches.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +1 other test skip
>  *
>
>     igt@gen9_exec_parse@shadow-peek:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html>
>         (i915#2856
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856>)
>         +2 other tests skip
>  *
>
>     igt@i915_fb_tiling@basic-x-tiling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@i915_fb_tiling@basic-x-tiling.html>
>         (i915#13786
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@i915_fb_tiling@basic-x-tiling.html>
>         (i915#13786
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@i915_fb_tiling@basic-x-tiling.html>
>         (i915#13786
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786>)
>  *
>
>     igt@i915_pm_freq_api@freq-basic-api:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_freq_api@freq-reset-multiple:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html>
>         (i915#8399
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399>)
>  *
>
>     igt@i915_pm_freq_api@freq-suspend@gt0:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html>
>         (i915#12455
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455>
>         / i915#13820
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820>)
>         +1 other test incomplete
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         (i915#6590
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         (i915#6590
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0.html>
>         (i915#6590
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>         +1 other test skip
>  *
>
>     igt@i915_pm_freq_mult@media-freq@gt1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@i915_pm_freq_mult@media-freq@gt1.html>
>         (i915#6590
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590>)
>         +2 other tests skip
>  *
>
>     igt@i915_pm_rpm@system-suspend-execbuf:
>
>       o shard-dg1: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-16/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@i915_pm_rpm@system-suspend-execbuf.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         +1 other test dmesg-warn
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-mtlp: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@i915_pm_rps@reset.html>
>         (i915#8346
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346>)
>  *
>
>     igt@i915_pm_rps@thresholds-idle:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@i915_pm_rps@thresholds-idle.html>
>         (i915#11681
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681>)
>  *
>
>     igt@i915_pm_sseu@full-enable:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@i915_pm_sseu@full-enable.html>
>         (i915#4387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387>)
>  *
>
>     igt@i915_query@hwconfig_table:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@i915_query@hwconfig_table.html>
>         (i915#6245
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245>)
>  *
>
>     igt@i915_query@test-query-geometry-subslices:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html>
>         (i915#5723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723>)
>  *
>
>     igt@i915_selftest@mock:
>
>       o shard-tglu: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@i915_selftest@mock.html>
>         (i915#9311
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311>)
>         +1 other test dmesg-warn
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@i915_selftest@mock.html>
>         (i915#9311
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311>)
>         +1 other test dmesg-warn
>  *
>
>     igt@i915_suspend@sysfs-reader:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@i915_suspend@sysfs-reader.html>
>         (i915#4817
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817>)
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@intel_hwmon@hwmon-write.html>
>         (i915#7707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707>)
>         +1 other test skip
>  *
>
>     igt@kms_addfb_basic@basic-x-tiled-legacy:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_addfb_basic@basic-x-tiled-legacy.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>  *
>
>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html>
>         (i915#4212
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212>)
>         +1 other test skip
>  *
>
>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html>
>         (i915#12454
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454>
>         / i915#12712
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712>)
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc.html>
>         (i915#8709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>         +7 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html>
>         (i915#8709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>         +4 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc.html>
>         (i915#8709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>         +3 other tests skip
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html>
>         (i915#8709
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709>)
>         +7 other tests skip
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>)
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html>
>         (i915#1769
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-270:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +6 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +9 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html>
>         (i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5286
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286>)
>         +6 other tests skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html>
>         (i915#5138
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138>)
>  *
>
>     igt@kms_big_fb@linear-64bpp-rotate-270:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html>
>         +29 other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-32bpp-rotate-270:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html>
>         +5 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +9 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-64bpp-rotate-270:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +4 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html>
>         (i915#3638
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638>)
>         +4 other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +5 other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (i915#4538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538>)
>         +3 other tests skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (i915#12313
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313>)
>         +1 other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +139 other tests skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +156 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +9 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +34 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (i915#12805
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805>)
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +100 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +59 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html>
>         (i915#12796
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796>)
>         +1 other test incomplete
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html>
>         (i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +64 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html>
>         (i915#10307
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307>
>         / i915#10434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434>
>         / i915#6095
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095>)
>         +1 other test skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_cdclk@mode-transition.html>
>         (i915#13781
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781>)
>         +4 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_cdclk@mode-transition.html>
>         (i915#3742
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742>)
>  *
>
>     igt@kms_chamelium_audio@dp-audio:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_chamelium_audio@dp-audio.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +5 other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html>
>         +28 other tests skip
>  *
>
>     igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +1 other test skip
>  *
>
>     igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +2 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +11 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +8 other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (i915#11151
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151>
>         / i915#7828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828>)
>         +4 other tests skip
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_content_protection@atomic-dpms.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_content_protection@atomic-dpms.html>
>         (i915#7116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         +1 other test skip
>  *
>
>     igt@kms_content_protection@atomic@pipe-a-dp-4:
>
>       o shard-dg2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_content_protection@content-type-change.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@dp-mst-type-0:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#3116
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html>
>         (i915#3299
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_content_protection@legacy.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@lic-type-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@kms_content_protection@lic-type-0.html>
>         (i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_content_protection@lic-type-0.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_content_protection@srm.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>)
>  *
>
>     igt@kms_content_protection@uevent:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_content_protection@uevent.html>
>         (i915#6944
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         +3 other tests skip
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_content_protection@uevent.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         +3 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-64x21:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-64x21.html>
>         (i915#8814
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +4 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +3 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8814
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x512:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-256x85:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         +3 other tests fail
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-32x10:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +6 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-32x32:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-32x32.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (i915#13049
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049>)
>         +2 other tests skip
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +6 other tests skip
>  *
>
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html>
>         (i915#4213
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213>)
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>  *
>
>     igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html>
>         (i915#2346
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346>)
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         +87 other tests skip
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html>
>         (i915#9809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809>)
>         +5 other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html>
>         (i915#13046
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046>
>         / i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html>
>         (i915#9067
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (i915#4103
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103>)
>  *
>
>     igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9833
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html>
>         (i915#9833
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833>)
>  *
>
>     igt@kms_display_modes@extended-mode-basic:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html>
>         (i915#13691
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html>
>         (i915#3804
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804>)
>  *
>
>     igt@kms_dp_link_training@non-uhbr-sst:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-sst.html>
>         (i915#13749
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749>)
>  *
>
>     igt@kms_dp_link_training@uhbr-sst:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.html>
>         (i915#13748
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dp-fallback:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html>
>         (i915#13707
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707>)
>  *
>
>     igt@kms_dsc@dsc-fractional-bpp-with-bpc:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>         +1 other test skip
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (i915#3840
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840>
>         / i915#9053
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html>
>         (i915#13798
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13798>)
>  *
>
>     igt@kms_fbcon_fbt@psr-suspend:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html>
>         (i915#3469
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469>)
>  *
>
>     igt@kms_feature_discovery@chamelium:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-4/igt@kms_feature_discovery@chamelium.html>
>         (i915#2065
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065>
>         / i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_feature_discovery@chamelium.html>
>         (i915#4854
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854>)
>  *
>
>     igt@kms_feature_discovery@psr1:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_feature_discovery@psr1.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_feature_discovery@psr1.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658>)
>  *
>
>     igt@kms_fence_pin_leak:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_fence_pin_leak.html>
>         (i915#4881
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881>)
>  *
>
>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +6 other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-panning:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +4 other tests skip
>  *
>
>     igt@kms_flip@2x-nonexisting-fb:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_flip@2x-nonexisting-fb.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip@2x-plain-flip:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_flip@2x-plain-flip.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +9 other tests skip
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_flip@2x-plain-flip.html>
>         (i915#9934
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html>
>         (i915#3637
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637>)
>         +1 other test skip
>  *
>
>     igt@kms_flip@absolute-wf_vblank@b-hdmi-a1:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk2/igt@kms_flip@absolute-wf_vblank@b-hdmi-a1.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_flip@absolute-wf_vblank@b-hdmi-a1.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118>)
>         +3 other tests dmesg-warn
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html>
>         (i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>         +5 other tests fail
>  *
>
>     igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:
>
>       o shard-rkl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html>
>         (i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>         +1 other test fail
>  *
>
>     igt@kms_flip@flip-vs-fences-interruptible:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_flip@flip-vs-fences-interruptible.html>
>         (i915#8381
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381>)
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@kms_flip@flip-vs-suspend.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>
>         / i915#4839
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839>)
>  *
>
>     igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html>
>         (i915#12745
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745>)
>  *
>
>     igt@kms_flip@plain-flip-ts-check:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb5/igt@kms_flip@plain-flip-ts-check.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@plain-flip-ts-check.html>
>         (i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_flip@plain-flip-ts-check.html>
>         (i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>         +2 other tests fail
>  *
>
>     igt@kms_flip@plain-flip-ts-check-interruptible:
>
>       o shard-tglu: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_flip@plain-flip-ts-check-interruptible.html>
>         (i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>         +1 other test fail
>  *
>
>     igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118>)
>         +5 other tests dmesg-warn
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +3 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>         +4 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +5 other tests skip
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#8813
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813>)
>         +2 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +5 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +1 other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html>
>         (i915#2587
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587>
>         / i915#2672
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672>)
>         +3 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +22 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +22 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +9 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +34 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-tiling-4:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html>
>         (i915#5439
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html>
>         +39 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html>
>         +33 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +4 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html>
>         (i915#1825
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825>)
>         +52 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +8 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@pipe-fbc-rte:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html>
>         (i915#9766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>         +10 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-modesetfrombusy:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         (i915#3023
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023>)
>         +30 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         +15 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch-dpms:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_hdr@bpc-switch-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>         +1 other test skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_joiner@basic-big-joiner.html>
>         (i915#10656
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656>)
>  *
>
>     igt@kms_joiner@basic-max-non-joiner:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html>
>         (i915#13688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688>)
>  *
>
>     igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html>
>         (i915#13522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset.html>
>         (i915#6301
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301>)
>  *
>
>     igt@kms_pipe_crc_basic@suspend-read-crc:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +1 other test dmesg-fail
>  *
>
>     igt@kms_plane@plane-panning-bottom-right-suspend:
>
>       o shard-glk: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend.html>
>         (i915#13026
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026>)
>         +1 other test incomplete
>  *
>
>     igt@kms_plane_alpha_blend@alpha-transparent-fb:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>
>         / i915#12177
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177>)
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-max:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>
>         / i915#12169
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169>)
>  *
>
>     igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html>
>         (i915#10647
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647>)
>         +3 other tests fail
>  *
>
>     igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:
>
>       o shard-rkl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         +12 other tests dmesg-warn
>  *
>
>     igt@kms_plane_lowres@tiling-none:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_plane_lowres@tiling-none.html>
>         (i915#11614
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614>
>         / i915#3582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>)
>         +3 other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html>
>         (i915#10226
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226>
>         / i915#11614
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614>
>         / i915#3582
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582>)
>         +5 other tests skip
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html>
>         (i915#8821
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821>)
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         +5 other tests skip
>  *
>
>     igt@kms_plane_scaling@intel-max-src-size:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html>
>         (i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +14 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +13 other tests skip
>  *
>
>     igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +17 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +8 other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#6953
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>
>         / i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html>
>         (i915#12247
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247>)
>         +7 other tests skip
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html>
>         (i915#5354
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354>)
>  *
>
>     igt@kms_pm_backlight@brightness-with-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html>
>         (i915#12343
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_dc@dc9-dpms:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html>
>         (i915#4281
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281>)
>  *
>
>     igt@kms_pm_lpsp@kms-lpsp:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#9340
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340>)
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html>
>         (i915#3828
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828>)
>  *
>
>     igt@kms_pm_lpsp@screens-disabled:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_pm_lpsp@screens-disabled.html>
>         (i915#8430
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430>)
>  *
>
>     igt@kms_pm_rpm@dpms-lpsp:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp:
>
>       o shard-rkl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         +1 other test skip
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>  *
>
>     igt@kms_prime@basic-crc-hybrid:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html>
>         (i915#6524
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html>
>         (i915#12316
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html>
>         (i915#9808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +1 other test skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +2 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +14 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +7 other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html>
>         (i915#11520
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520>)
>         +22 other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-p010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#9683
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_psr2_su@page_flip-p010.html>
>         (i915#4348
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348>)
>  *
>
>     igt@kms_psr@fbc-pr-primary-render:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_psr@fbc-pr-primary-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +9 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-dpms:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_psr@fbc-psr-dpms.html>
>         (i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +21 other tests skip
>  *
>
>     igt@kms_psr@fbc-psr-sprite-plane-move:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_psr@fbc-psr-sprite-plane-move.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +22 other tests skip
>  *
>
>     igt@kms_psr@psr-cursor-mmap-cpu:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_psr@psr-cursor-mmap-cpu.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +18 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-mmap-cpu:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html>
>         (i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +5 other tests skip
>  *
>
>     igt@kms_psr@psr-sprite-mmap-gtt@edp-1:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html>
>         (i915#4077
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077>
>         / i915#9688
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688>)
>         +3 other tests skip
>  *
>
>     igt@kms_psr@psr2-sprite-plane-onoff:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.html>
>         +669 other tests skip
>  *
>
>     igt@kms_psr@psr2-suspend:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_psr@psr2-suspend.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +26 other tests skip
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_psr@psr2-suspend.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         +16 other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#9685
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_rotation_crc@primary-rotation-270.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>         +3 other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (i915#5190
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html>
>         (i915#5289
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289>)
>         +1 other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (i915#12755
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755>)
>         +1 other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full:
>
>       o shard-tglu-1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-full.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>  *
>
>     igt@kms_selftest@drm_framebuffer:
>
>       o shard-tglu: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-5/igt@kms_selftest@drm_framebuffer.html>
>         (i915#13179
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>)
>         +1 other test abort
>       o shard-glk: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk6/igt@kms_selftest@drm_framebuffer.html>
>         (i915#13179
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179>)
>         +1 other test abort
>  *
>
>     igt@kms_setmode@invalid-clone-single-crtc-stealing:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8809
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (i915#8623
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623>)
>  *
>
>     igt@kms_vrr@max-min:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_vrr@max-min.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>         +1 other test skip
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@kms_vrr@negative-basic.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_vrr@negative-basic.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_vrr@seamless-rr-switch-virtual.html>
>         (i915#8808
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808>
>         / i915#9906
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906>)
>  *
>
>     igt@kms_writeback@writeback-check-output:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_writeback@writeback-check-output.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@kms_writeback@writeback-fb-id:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@kms_writeback@writeback-fb-id-xrgb2101010:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>         +1 other test skip
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>
>         / i915#9412
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412>)
>  *
>
>     igt@kms_writeback@writeback-invalid-parameters:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html>
>         (i915#2437
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437>)
>  *
>
>     igt@perf@gen12-group-concurrent-oa-buffer-read:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@perf@gen12-group-concurrent-oa-buffer-read.html>
>         (i915#10538
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538>)
>  *
>
>     igt@perf@global-sseu-config-invalid:
>
>       o shard-mtlp: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html>
>         (i915#7387
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387>)
>  *
>
>     igt@perf@mi-rpc:
>
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@perf@mi-rpc.html>
>         (i915#2434
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434>)
>  *
>
>     igt@perf@per-context-mode-unprivileged:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html>
>         (i915#2435
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435>)
>       o shard-dg1: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@perf@unprivileged-single-ctx-counters:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html>
>         (i915#2433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433>)
>  *
>
>     igt@perf_pmu@invalid-init:
>
>       o shard-tglu: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@perf_pmu@invalid-init.html>
>         (i915#13663
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663>)
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@perf_pmu@invalid-init.html>
>         (i915#13663
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663>)
>       o shard-dg2-9: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@perf_pmu@invalid-init.html>
>         (i915#13663
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663>)
>  *
>
>     igt@perf_pmu@rc6@other-idle-gt0:
>
>       o shard-tglu: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html>
>         (i915#8516
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516>)
>  *
>
>     igt@prime_vgem@basic-fence-flip:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-3/igt@prime_vgem@basic-fence-flip.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@prime_vgem@fence-read-hang:
>
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@prime_vgem@fence-read-hang.html>
>         (i915#3708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708>)
>  *
>
>     igt@sriov_basic@bind-unbind-vf:
>
>       o shard-dg2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@sriov_basic@bind-unbind-vf.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>       o shard-rkl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-dg2-9: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (i915#9917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917>)
>
>
>         Possible fixes
>
>  *
>
>     igt@drm_fdinfo@busy:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-7/igt@drm_fdinfo@busy.html>
>         (i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@drm_fdinfo@busy.html>
>         +10 other tests pass
>  *
>
>     igt@gem_ccs@suspend-resume:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@gem_ccs@suspend-resume.html>
>         (i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@gem_ccs@suspend-resume.html>
>  *
>
>     igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html>
>         (i915#12392
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392>
>         / i915#13356
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html>
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-16/igt@gem_eio@kms.html>
>         (i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_eio@kms.html>
>  *
>
>     igt@gem_eio@reset-stress:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-19/igt@gem_eio@reset-stress.html>
>         (i915#12543
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12543>
>         / i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@gem_eio@reset-stress.html>
>  *
>
>     igt@gem_eio@unwedge-stress:
>
>       o shard-mtlp: ABORT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-7/igt@gem_eio@unwedge-stress.html>
>         (i915#13193
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@gem_eio@unwedge-stress.html>
>         +3 other tests pass
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-14/igt@gem_eio@unwedge-stress.html>
>         (i915#12714
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714>
>         / i915#5784
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_eio@unwedge-stress.html>
>  *
>
>     igt@gem_pxp@reject-modify-context-protection-on:
>
>       o shard-rkl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-on.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html>
>         +2 other tests pass
>  *
>
>     igt@i915_hangman@detector@vcs1:
>
>       o shard-mtlp: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-7/igt@i915_hangman@detector@vcs1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@i915_hangman@detector@vcs1.html>
>  *
>
>     igt@i915_pm_rps@reset:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-1/igt@i915_pm_rps@reset.html>
>         (i915#13598
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@i915_pm_rps@reset.html>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-14/igt@i915_pm_rps@reset.html>
>         (i915#13598
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@i915_pm_rps@reset.html>
>  *
>
>     igt@i915_power@sanity:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@i915_power@sanity.html>
>         (i915#7984
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@i915_power@sanity.html>
>  *
>
>     igt@i915_selftest@live@workarounds:
>
>       o shard-mtlp: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-5/igt@i915_selftest@live@workarounds.html>
>         (i915#12061
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@i915_selftest@live@workarounds.html>
>         +1 other test pass
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (i915#12518
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12518>
>         / i915#12766
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12766>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_async_flips@alternate-sync-async-flip.html>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         (i915#5956
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-tglu: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         +3 other tests pass
>  *
>
>     igt@kms_dither@fb-8bpc-vs-panel-8bpc:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>         (i915#11832
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832>
>         / i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html>
>         (i915#11832
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>         (i915#11832
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832>
>         / i915#13734
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html>
>  *
>
>     igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:
>
>       o shard-snb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>         (i915#1522
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html>
>         +1 other test pass
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html>
>         (i915#6880
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html>
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html>
>         (i915#3555
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555>
>         / i915#8228
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         (i915#9519
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html>
>         +1 other test pass
>  *
>
>     igt@kms_setmode@basic:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-5/igt@kms_setmode@basic.html>
>         (i915#5465
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_setmode@basic.html>
>  *
>
>     igt@kms_setmode@basic@pipe-b-edp-1:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         (i915#5465
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html>
>         +2 other tests pass
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-rpm:
>
>       o shard-rkl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html>
>  *
>
>     igt@perf_pmu@busy-double-start@vecs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html>
>         (i915#4349
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html>
>         +2 other tests pass
>  *
>
>     igt@perf_pmu@most-busy-check-all:
>
>       o shard-dg2: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-5/igt@perf_pmu@most-busy-check-all.html>
>         (i915#11943
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@perf_pmu@most-busy-check-all.html>
>         +1 other test pass
>       o shard-dg1: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-16/igt@perf_pmu@most-busy-check-all.html>
>         (i915#11943
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@perf_pmu@most-busy-check-all.html>
>         +1 other test pass
>  *
>
>     igt@perf_pmu@most-busy-check-all@bcs0:
>
>       o shard-mtlp: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@perf_pmu@most-busy-check-all@bcs0.html>
>         (i915#11943
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@perf_pmu@most-busy-check-all@bcs0.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-6/igt@kms_content_protection@atomic.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_content_protection@atomic.html>
>         (i915#7173
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-snb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_content_protection@atomic-dpms.html>
>         (i915#8816
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb7/igt@kms_content_protection@atomic-dpms.html>
>         +2 other tests skip
>  *
>
>     igt@kms_content_protection@type1:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#7162
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_content_protection@type1.html>
>         (i915#7118
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118>
>         / i915#9424
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424>)
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-64x21:
>
>       o shard-rkl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html>
>         (i915#13566
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566>)
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html>
>         (i915#12917
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917>
>         / i915#12964
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964>)
>  *
>
>     igt@kms_dirtyfb@psr-dirtyfb-ioctl:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9723
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html>
>         (i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html>
>         (i915#8708
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708>)
>         +1 other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:
>
>       o shard-dg2: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html>
>         (i915#10433
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433>
>         / i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html>
>         (i915#3458
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458>)
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-mtlp: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#1187
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187>
>         / i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html>
>         (i915#12713
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713>)
>  *
>
>     igt@kms_psr@pr-cursor-render:
>
>       o shard-dg1: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-15/igt@kms_psr@pr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_psr@pr-cursor-render.html>
>         (i915#1072
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072>
>         / i915#4423
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423>
>         / i915#9732
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732>)
>  *
>
>     igt@prime_mmap@test_aperture_limit:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@prime_mmap@test_aperture_limit.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>         -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html>
>         (i915#9351
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351>)
>  *
>
>     igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:
>
>       o shard-dg2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html>
>         (i915#5493
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493>)
>         -> CRASH
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html>
>         (i915#9351
>         <https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351>)
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8270 -> IGTPW_12741
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_16261: 003c44ec0b7d86569bd13d4a810ee24176c3d034 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_12741: 12741
> IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
-- 
-shekhar

--------------KAwjS0DAADsNIGf2lL6fjJZT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Failures unrelated.<br>
    </p>
    <div class="moz-cite-prefix">On 3/11/2025 12:52, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:174167776131.17064.16514652837640203023@18a75f3d1eae">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/kms_cursor_crc.: Test async cursor crc (rev2)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/146062/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/146062/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_16261_full -&gt;
        IGTPW_12741_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_12741_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_12741_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/index.html</a></p>
      <h2>Participating hosts (11 -&gt; 10)</h2>
      <p>Missing (1): pig-kbl-iris </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_12741_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@kms_draw_crc@draw-method-blt:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk3/igt@kms_draw_crc@draw-method-blt.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk3/igt@kms_draw_crc@draw-method-blt.html" moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check@a-vga1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb5/igt@kms_flip@plain-flip-ts-check@a-vga1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@plain-flip-ts-check@a-vga1.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_16261_full and
        IGTPW_12741_full:</p>
      <h3>New IGT tests (18)</h3>
      <ul>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change:</p>
          <ul>
            <li>Statuses : 6 pass(s)</li>
            <li>Exec time: [0.51, 1.85] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-edp-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.59] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 4 pass(s)</li>
            <li>Exec time: [0.27, 0.82] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-a-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.56] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.40] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.48] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-edp-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [1.26] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.24, 0.35] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-framebuffer-change@pipe-d-hdmi-a-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.34] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change:</p>
          <ul>
            <li>Statuses : 6 pass(s)</li>
            <li>Exec time: [0.52, 1.80] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-edp-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.58] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 3 pass(s)</li>
            <li>Exec time: [0.27, 0.89] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.47, 0.53] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-b-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.39] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.58] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-edp-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [1.22] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.24] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@async-cursor-crc-position-change@pipe-d-hdmi-a-3:</p>
          <ul>
            <li>Statuses : 2 pass(s)</li>
            <li>Exec time: [0.35] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_12741_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@api_intel_bb@blit-reloc-keep-cache:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@api_intel_bb@blit-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@api_intel_bb@blit-reloc-keep-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@crc32:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@api_intel_bb@crc32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6230" moz-do-not-send="true">i915#6230</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@api_intel_bb@object-reloc-purge-cache:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@api_intel_bb@object-reloc-purge-cache.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8411" moz-do-not-send="true">i915#8411</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@debugfs_test@basic-hwmon:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318" moz-do-not-send="true">i915#9318</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318" moz-do-not-send="true">i915#9318</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@debugfs_test@basic-hwmon.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318" moz-do-not-send="true">i915#9318</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-check-all@bcs0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@drm_fdinfo@busy-check-all@bcs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414" moz-do-not-send="true">i915#8414</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-check-all@ccs0:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@drm_fdinfo@busy-check-all@ccs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414" moz-do-not-send="true">i915#8414</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-check-all@vecs1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@drm_fdinfo@busy-check-all@vecs1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414" moz-do-not-send="true">i915#8414</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle-check-all@vcs0:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@drm_fdinfo@busy-idle-check-all@vcs0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11527" moz-do-not-send="true">i915#11527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414" moz-do-not-send="true">i915#8414</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@drm_fdinfo@busy-idle-check-all@vecs1:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@drm_fdinfo@busy-idle-check-all@vecs1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8414" moz-do-not-send="true">i915#8414</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-compressed:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_ccs@block-multicopy-compressed.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@block-multicopy-inplace:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_ccs@block-multicopy-inplace.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9323" moz-do-not-send="true">i915#9323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@hog-create:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-3/igt@gem_create@hog-create.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@gem_create@hog-create.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +23 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3@rcs0:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk6/igt@gem_ctx_isolation@preservation-s3@rcs0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@gem_ctx_isolation@preservation-s3@rcs0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12353" moz-do-not-send="true">i915#12353</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@engines-queued:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb6/igt@gem_ctx_persistence@engines-queued.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1099" moz-do-not-send="true">i915#1099</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@hang:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_ctx_persistence@hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@heartbeat-close:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@gem_ctx_persistence@heartbeat-close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@hibernate:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975" moz-do-not-send="true">i915#7975</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@gem_eio@hibernate.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7975" moz-do-not-send="true">i915#7975</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-internal-immediate:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@gem_eio@in-flight-internal-immediate.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193" moz-do-not-send="true">i915#13193</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk2/igt@gem_eio@in-flight-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13390" moz-do-not-send="true">i915#13390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@bonded-false-hang:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_exec_balancer@bonded-false-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@hog:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@gem_exec_balancer@hog.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@noheartbeat:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@gem_exec_balancer@noheartbeat.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8555" moz-do-not-send="true">i915#8555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-dmabuf-import-out-fence:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_exec_balancer@parallel-dmabuf-import-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-out-fence:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@gem_exec_balancer@parallel-out-fence.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4525" moz-do-not-send="true">i915#4525</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_big@single:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-8/igt@gem_exec_big@single.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gem_exec_big@single.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11713" moz-do-not-send="true">i915#11713</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fence@submit:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_exec_fence@submit.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-rw-default:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_exec_flush@basic-uc-rw-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-uc-set-default:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_exec_flush@basic-uc-set-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_exec_flush@basic-uc-set-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_flush@basic-wb-rw-before-default:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@gem_exec_flush@basic-wb-rw-before-default.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3539" moz-do-not-send="true">i915#3539</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4852" moz-do-not-send="true">i915#4852</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-gtt-cpu-noreloc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@gem_exec_reloc@basic-gtt-cpu-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-softpin:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@gem_exec_reloc@basic-softpin.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-wc-read-noreloc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@gem_exec_reloc@basic-wc-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +10 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@gem_exec_reloc@basic-wc-read-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_reloc@basic-write-wc-noreloc:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_exec_reloc@basic-write-wc-noreloc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3281" moz-do-not-send="true">i915#3281</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_schedule@semaphore-power:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7276" moz-do-not-send="true">i915#7276</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +2 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>) +1 other test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gem_exec_schedule@semaphore-power.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4537" moz-do-not-send="true">i915#4537</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4812" moz-do-not-send="true">i915#4812</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_suspend@basic-s4-devices:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk3/igt@gem_exec_suspend@basic-s4-devices.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13661" moz-do-not-send="true">i915#13661</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_whisper@basic-queues:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb5/igt@gem_exec_whisper@basic-queues.html" moz-do-not-send="true">SKIP</a> +73 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fence_thrash@bo-write-verify-y:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@gem_fence_thrash@bo-write-verify-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@gem_fence_thrash@bo-write-verify-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_fenced_exec_thrash@too-many-fences:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@gem_fenced_exec_thrash@too-many-fences.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4860" moz-do-not-send="true">i915#4860</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_huc_copy@huc-copy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_huc_copy@huc-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190" moz-do-not-send="true">i915#2190</a>)</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@gem_huc_copy@huc-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2190" moz-do-not-send="true">i915#2190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_evict@dontneed-evict-race:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gem_lmem_evict@dontneed-evict-race.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7582" moz-do-not-send="true">i915#7582</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-random:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@gem_lmem_swapping@heavy-random.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-multi-ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk2/igt@gem_lmem_swapping@heavy-verify-multi-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +7 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12193" moz-do-not-send="true">i915#12193</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@gem_lmem_swapping@parallel-random-verify-ccs@lmem0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4565" moz-do-not-send="true">i915#4565</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@smem-oom@lmem0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@gem_lmem_swapping@smem-oom@lmem0.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send="true">i915#5493</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@gem_lmem_swapping@verify-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4613" moz-do-not-send="true">i915#4613</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@verify-random:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-8/igt@gem_lmem_swapping@verify-random.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@gem_lmem_swapping@verify-random.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13465" moz-do-not-send="true">i915#13465</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13571" moz-do-not-send="true">i915#13571</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@basic-small-bo:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gem_mmap_gtt@basic-small-bo.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@cpuset-big-copy:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_mmap_gtt@cpuset-big-copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_gtt@medium-copy-odd:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@gem_mmap_gtt@medium-copy-odd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@copy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gem_mmap_wc@copy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@fault-concurrent:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_mmap_wc@fault-concurrent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-gtt-read-wc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@gem_mmap_wc@write-gtt-read-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_mmap_wc@write-read:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@gem_mmap_wc@write-read.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083" moz-do-not-send="true">i915#4083</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_partial_pwrite_pread@reads-uncached:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_partial_pwrite_pread@reads-uncached.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@exhaustion:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@gem_pread@exhaustion.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2658" moz-do-not-send="true">i915#2658</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@gem_pread@exhaustion.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@snoop:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_pread@snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_pread@snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +4 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_pread@snoop.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3282" moz-do-not-send="true">i915#3282</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@create-valid-protected-context:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@gem_pxp@create-valid-protected-context.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_pxp@create-valid-protected-context.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@hw-rejects-pxp-context:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_pxp@hw-rejects-pxp-context.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +3 other tests
              timeout</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gem_pxp@hw-rejects-pxp-context.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398" moz-do-not-send="true">i915#13398</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@gem_pxp@hw-rejects-pxp-context.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13398" moz-do-not-send="true">i915#13398</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@protected-raw-src-copy-not-readible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@gem_pxp@protected-raw-src-copy-not-readible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@regular-baseline-src-copy-readible:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-8/igt@gem_pxp@regular-baseline-src-copy-readible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_pxp@regular-baseline-src-copy-readible.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-off-3:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_pxp@reject-modify-context-protection-off-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4270" moz-do-not-send="true">i915#4270</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-yf-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@yf-tiled-to-vebox-y-tiled:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +4 other tests
              skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_render_copy@yf-tiled-to-vebox-y-tiled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8428" moz-do-not-send="true">i915#8428</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_tiled_blits@basic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@gem_render_tiled_blits@basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079" moz-do-not-send="true">i915#4079</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_tiled_partial_pwrite_pread@reads:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@gem_tiled_partial_pwrite_pread@reads.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@dmabuf-sync:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@gem_userptr_blits@dmabuf-sync.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3323" moz-do-not-send="true">i915#3323</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@sd-probe:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@gem_userptr_blits@sd-probe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958" moz-do-not-send="true">i915#4958</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@gem_userptr_blits@sd-probe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4958" moz-do-not-send="true">i915#4958</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@gem_userptr_blits@unsync-unmap-after-close.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@unsync-unmap-cycles:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>) +3 other tests
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@gem_userptr_blits@unsync-unmap-cycles.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3297" moz-do-not-send="true">i915#3297</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@reset-fd:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-6/igt@gem_workarounds@reset-fd.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@gem_workarounds@reset-fd.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193" moz-do-not-send="true">i915#13193</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen3_render_tiledx_blits:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@gen3_render_tiledx_blits.html" moz-do-not-send="true">SKIP</a> +13 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-single:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@gen9_exec_parse@allowed-single.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@batch-invalid-length:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@gen9_exec_parse@batch-invalid-length.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@batch-zero-length:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@gen9_exec_parse@batch-zero-length.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@bb-oversize:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@gen9_exec_parse@bb-oversize.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@cmd-crossing-page:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@gen9_exec_parse@cmd-crossing-page.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2527" moz-do-not-send="true">i915#2527</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@secure-batches:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@gen9_exec_parse@secure-batches.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@shadow-peek:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@gen9_exec_parse@shadow-peek.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2856" moz-do-not-send="true">i915#2856</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_fb_tiling@basic-x-tiling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@i915_fb_tiling@basic-x-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786" moz-do-not-send="true">i915#13786</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@i915_fb_tiling@basic-x-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786" moz-do-not-send="true">i915#13786</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@i915_fb_tiling@basic-x-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13786" moz-do-not-send="true">i915#13786</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-basic-api:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@i915_pm_freq_api@freq-basic-api.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-reset-multiple:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@i915_pm_freq_api@freq-reset-multiple.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8399" moz-do-not-send="true">i915#8399</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_api@freq-suspend@gt0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@i915_pm_freq_api@freq-suspend@gt0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12455" moz-do-not-send="true">i915#12455</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13820" moz-do-not-send="true">i915#13820</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590" moz-do-not-send="true">i915#6590</a>) +1 other test skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590" moz-do-not-send="true">i915#6590</a>) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@i915_pm_freq_mult@media-freq@gt0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590" moz-do-not-send="true">i915#6590</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_freq_mult@media-freq@gt1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@i915_pm_freq_mult@media-freq@gt1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6590" moz-do-not-send="true">i915#6590</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rpm@system-suspend-execbuf:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-16/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@i915_pm_rpm@system-suspend-execbuf.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@i915_pm_rps@reset.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8346" moz-do-not-send="true">i915#8346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@thresholds-idle:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@i915_pm_rps@thresholds-idle.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681" moz-do-not-send="true">i915#11681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_sseu@full-enable:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@i915_pm_sseu@full-enable.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4387" moz-do-not-send="true">i915#4387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@hwconfig_table:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@i915_query@hwconfig_table.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6245" moz-do-not-send="true">i915#6245</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_query@test-query-geometry-subslices:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@i915_query@test-query-geometry-subslices.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5723" moz-do-not-send="true">i915#5723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@mock:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311" moz-do-not-send="true">i915#9311</a>) +1 other test
              dmesg-warn</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@i915_selftest@mock.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9311" moz-do-not-send="true">i915#9311</a>) +1 other test
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@sysfs-reader:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@i915_suspend@sysfs-reader.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4817" moz-do-not-send="true">i915#4817</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@intel_hwmon@hwmon-write.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707" moz-do-not-send="true">i915#7707</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@basic-x-tiled-legacy:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_addfb_basic@basic-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_addfb_basic@basic-x-tiled-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@framebuffer-vs-set-tiling:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>) +1 other test skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212" moz-do-not-send="true">i915#4212</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12454" moz-do-not-send="true">i915#12454</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12712" moz-do-not-send="true">i915#12712</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-c-hdmi-a-1-4-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709" moz-do-not-send="true">i915#8709</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-2-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709" moz-do-not-send="true">i915#8709</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-4-y-rc-ccs-cc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709" moz-do-not-send="true">i915#8709</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-2-4-mc-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8709" moz-do-not-send="true">i915#8709</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_atomic_transition@plane-all-modeset-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1769" moz-do-not-send="true">i915#1769</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5286" moz-do-not-send="true">i915#5286</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5138" moz-do-not-send="true">i915#5138</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_big_fb@linear-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +29 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> +5 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +4 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3638" moz-do-not-send="true">i915#3638</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4538" moz-do-not-send="true">i915#4538</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12313" moz-do-not-send="true">i915#12313</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-b-hdmi-a-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +139 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_ccs@ccs-on-another-bo-y-tiled-ccs@pipe-b-dp-3.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +156 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_ccs@crc-primary-basic-y-tiled-ccs@pipe-c-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805" moz-do-not-send="true">i915#12805</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12805" moz-do-not-send="true">i915#12805</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +100 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +59 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-a-hdmi-a-2.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12796" moz-do-not-send="true">i915#12796</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +64 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-hdmi-a-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10307" moz-do-not-send="true">i915#10307</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10434" moz-do-not-send="true">i915#10434</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6095" moz-do-not-send="true">i915#6095</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13781" moz-do-not-send="true">i915#13781</a>) +4 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_cdclk@mode-transition.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3742" moz-do-not-send="true">i915#3742</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_audio@dp-audio:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_chamelium_audio@dp-audio.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not-send="true">SKIP</a> +28 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_chamelium_frames@hdmi-crc-fast.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_chamelium_hpd@dp-hpd.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11151" moz-do-not-send="true">i915#11151</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7828" moz-do-not-send="true">i915#7828</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) +1 other test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7116" moz-do-not-send="true">i915#7116</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_content_protection@atomic@pipe-a-dp-4.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_content_protection@content-type-change.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-type-0:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3116" moz-do-not-send="true">i915#3116</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@kms_content_protection@dp-mst-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3299" moz-do-not-send="true">i915#3299</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_content_protection@legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@lic-type-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_content_protection@lic-type-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_content_protection@srm.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@uevent:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6944" moz-do-not-send="true">i915#6944</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) +3 other tests
              skip</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_content_protection@uevent.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-64x21:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_cursor_crc@cursor-offscreen-64x21.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814" moz-do-not-send="true">i915#8814</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_cursor_crc@cursor-offscreen-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-7/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-4/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8814" moz-do-not-send="true">i915#8814</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_cursor_crc@cursor-onscreen-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-256x85:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_cursor_crc@cursor-random-256x85.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_cursor_crc@cursor-sliding-32x32.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13049" moz-do-not-send="true">i915#13049</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213" moz-do-not-send="true">i915#4213</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346" moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2346" moz-do-not-send="true">i915#2346</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">SKIP</a> +87 other tests skip</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9809" moz-do-not-send="true">i915#9809</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13046" moz-do-not-send="true">i915#13046</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9067" moz-do-not-send="true">i915#9067</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103" moz-do-not-send="true">i915#4103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833" moz-do-not-send="true">i915#9833</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9833" moz-do-not-send="true">i915#9833</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_display_modes@extended-mode-basic:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_display_modes@extended-mode-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13691" moz-do-not-send="true">i915#13691</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804" moz-do-not-send="true">i915#3804</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@non-uhbr-sst:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_dp_link_training@non-uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13749" moz-do-not-send="true">i915#13749</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_link_training@uhbr-sst:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_dp_link_training@uhbr-sst.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13748" moz-do-not-send="true">i915#13748</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_dp_linktrain_fallback@dp-fallback.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13707" moz-do-not-send="true">i915#13707</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>) +1 other test skip</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_dsc@dsc-with-output-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840" moz-do-not-send="true">i915#3840</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9053" moz-do-not-send="true">i915#9053</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13798" moz-do-not-send="true">i915#13798</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@psr-suspend:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_fbcon_fbt@psr-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3469" moz-do-not-send="true">i915#3469</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@chamelium:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-4/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2065" moz-do-not-send="true">i915#2065</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_feature_discovery@chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4854" moz-do-not-send="true">i915#4854</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_feature_discovery@psr1:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_feature_discovery@psr1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/658" moz-do-not-send="true">i915#658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fence_pin_leak:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_fence_pin_leak.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4881" moz-do-not-send="true">i915#4881</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_flip@2x-flip-vs-panning.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-nonexisting-fb:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@kms_flip@2x-nonexisting-fb.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +9 other tests
              skip</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_flip@2x-plain-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934" moz-do-not-send="true">i915#9934</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3637" moz-do-not-send="true">i915#3637</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@absolute-wf_vblank@b-hdmi-a1:</p>
          <ul>
            <li>shard-glk: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-glk2/igt@kms_flip@absolute-wf_vblank@b-hdmi-a1.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_flip@absolute-wf_vblank@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118" moz-do-not-send="true">i915#118</a>) +3 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>) +5 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a2.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-fences-interruptible:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_flip@flip-vs-fences-interruptible.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8381" moz-do-not-send="true">i915#8381</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@kms_flip@flip-vs-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4839" moz-do-not-send="true">i915#4839</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12745" moz-do-not-send="true">i915#12745</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb5/igt@kms_flip@plain-flip-ts-check.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@plain-flip-ts-check.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_flip@plain-flip-ts-check.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-3/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_flip@plain-flip-ts-check-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>) +1 other test fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk8/igt@kms_flip@wf_vblank-ts-check@b-hdmi-a1.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/118" moz-do-not-send="true">i915#118</a>) +5 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>) +4 other tests
              skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +5 other tests
              skip</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8813" moz-do-not-send="true">i915#8813</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling@pipe-a-valid-mode.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2587" moz-do-not-send="true">i915#2587</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2672" moz-do-not-send="true">i915#2672</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +34 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> +8 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5439" moz-do-not-send="true">i915#5439</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +12 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-indfb-fliptrack-mmap-gtt.html" moz-do-not-send="true">SKIP</a> +39 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html" moz-do-not-send="true">SKIP</a> +33 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1825" moz-do-not-send="true">i915#1825</a>) +52 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9766" moz-do-not-send="true">i915#9766</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-pwrite.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>) +10 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-modesetfrombusy:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3023" moz-do-not-send="true">i915#3023</a>) +30 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@kms_frontbuffer_tracking@psr-modesetfrombusy.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) +15 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_hdr@bpc-switch-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>) +1 other test
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_joiner@basic-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10656" moz-do-not-send="true">i915#10656</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-max-non-joiner:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_joiner@basic-max-non-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13688" moz-do-not-send="true">i915#13688</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13522" moz-do-not-send="true">i915#13522</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_panel_fitting@atomic-fastset.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6301" moz-do-not-send="true">i915#6301</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_pipe_crc_basic@suspend-read-crc.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +1 other test
              dmesg-fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk2/igt@kms_plane@plane-panning-bottom-right-suspend.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13026" moz-do-not-send="true">i915#13026</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@alpha-transparent-fb:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk5/igt@kms_plane_alpha_blend@alpha-transparent-fb.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12177" moz-do-not-send="true">i915#12177</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-max:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12169" moz-do-not-send="true">i915#12169</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@kms_plane_alpha_blend@constant-alpha-max@pipe-c-hdmi-a-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10647" moz-do-not-send="true">i915#10647</a>) +3 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-3/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-2-size-256.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) +12 other tests
              dmesg-warn</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-none:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_plane_lowres@tiling-none.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614" moz-do-not-send="true">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582" moz-do-not-send="true">i915#3582</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_plane_lowres@tiling-x@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10226" moz-do-not-send="true">i915#10226</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11614" moz-do-not-send="true">i915#11614</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3582" moz-do-not-send="true">i915#3582</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_plane_lowres@tiling-y.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8821" moz-do-not-send="true">i915#8821</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_plane_multiple@tiling-yf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@intel-max-src-size:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_plane_scaling@intel-max-src-size.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz-do-not-send="true">i915#9423</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +14 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +13 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_plane_scaling@plane-upscale-20x20-with-rotation@pipe-a.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6953" moz-do-not-send="true">i915#6953</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9423" moz-do-not-send="true">i915#9423</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-d.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12247" moz-do-not-send="true">i915#12247</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_pm_backlight@bad-brightness.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354" moz-do-not-send="true">i915#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@brightness-with-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_pm_backlight@brightness-with-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12343" moz-do-not-send="true">i915#12343</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc9-dpms:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_pm_dc@dc9-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4281" moz-do-not-send="true">i915#4281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@kms-lpsp:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-8/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9340" moz-do-not-send="true">i915#9340</a>)</li>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_pm_lpsp@kms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3828" moz-do-not-send="true">i915#3828</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_lpsp@screens-disabled:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430" moz-do-not-send="true">i915#8430</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_pm_lpsp@screens-disabled.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8430" moz-do-not-send="true">i915#8430</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-lpsp:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_pm_rpm@dpms-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-7/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_pm_rpm@modeset-lpsp.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_pm_rpm@modeset-non-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_prime@basic-crc-hybrid:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@kms_prime@basic-crc-hybrid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6524" moz-do-not-send="true">i915#6524</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb5/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12316" moz-do-not-send="true">i915#12316</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9808" moz-do-not-send="true">i915#9808</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +14 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk7/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11520" moz-do-not-send="true">i915#11520</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-p010:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-1/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-18/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-7/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9683" moz-do-not-send="true">i915#9683</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_psr2_su@page_flip-p010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4348" moz-do-not-send="true">i915#4348</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-render:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_psr@fbc-pr-primary-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-dpms:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_psr@fbc-psr-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_psr@fbc-psr-sprite-plane-move.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +22 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-mmap-cpu:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_psr@psr-cursor-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-mmap-cpu:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_psr@psr-sprite-mmap-cpu.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-sprite-mmap-gtt@edp-1:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_psr@psr-sprite-mmap-gtt@edp-1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077" moz-do-not-send="true">i915#4077</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9688" moz-do-not-send="true">i915#9688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk3/igt@kms_psr@psr2-sprite-plane-onoff.html" moz-do-not-send="true">SKIP</a> +669 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-suspend:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@kms_psr@psr2-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +26 other tests
              skip</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_psr@psr2-suspend.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) +16 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-10/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9685" moz-do-not-send="true">i915#9685</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_rotation_crc@primary-rotation-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190" moz-do-not-send="true">i915#5190</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5289" moz-do-not-send="true">i915#5289</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12755" moz-do-not-send="true">i915#12755</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full:</p>
          <ul>
            <li>shard-tglu-1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-1/igt@kms_scaling_modes@scaling-mode-full.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_selftest@drm_framebuffer:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-5/igt@kms_selftest@drm_framebuffer.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179" moz-do-not-send="true">i915#13179</a>) +1 other test
              abort</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk6/igt@kms_selftest@drm_framebuffer.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13179" moz-do-not-send="true">i915#13179</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_setmode@invalid-clone-single-crtc-stealing.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809" moz-do-not-send="true">i915#8809</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8623" moz-do-not-send="true">i915#8623</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@max-min:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-9/igt@kms_vrr@max-min.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-8/igt@kms_vrr@negative-basic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_vrr@seamless-rr-switch-virtual.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8808" moz-do-not-send="true">i915#8808</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9906" moz-do-not-send="true">i915#9906</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-check-output:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@kms_writeback@writeback-check-output.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_writeback@writeback-fb-id.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>) +1 other test skip</li>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@kms_writeback@writeback-fb-id-xrgb2101010.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9412" moz-do-not-send="true">i915#9412</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_writeback@writeback-invalid-parameters:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@kms_writeback@writeback-invalid-parameters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2437" moz-do-not-send="true">i915#2437</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@gen12-group-concurrent-oa-buffer-read:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-3/igt@perf@gen12-group-concurrent-oa-buffer-read.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-1/igt@perf@gen12-group-concurrent-oa-buffer-read.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10538" moz-do-not-send="true">i915#10538</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@global-sseu-config-invalid:</p>
          <ul>
            <li>shard-mtlp: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@perf@global-sseu-config-invalid.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7387" moz-do-not-send="true">i915#7387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@mi-rpc:</p>
          <ul>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@perf@mi-rpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2434" moz-do-not-send="true">i915#2434</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@per-context-mode-unprivileged:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-5/igt@perf@per-context-mode-unprivileged.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2435" moz-do-not-send="true">i915#2435</a>)</li>
            <li>shard-dg1: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@perf@per-context-mode-unprivileged.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send="true">i915#2433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf@unprivileged-single-ctx-counters:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-7/igt@perf@unprivileged-single-ctx-counters.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2433" moz-do-not-send="true">i915#2433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@invalid-init:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-3/igt@perf_pmu@invalid-init.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663" moz-do-not-send="true">i915#13663</a>)</li>
            <li>shard-glk: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-glk1/igt@perf_pmu@invalid-init.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663" moz-do-not-send="true">i915#13663</a>)</li>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@perf_pmu@invalid-init.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13663" moz-do-not-send="true">i915#13663</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@rc6@other-idle-gt0:</p>
          <ul>
            <li>shard-tglu: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-6/igt@perf_pmu@rc6@other-idle-gt0.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8516" moz-do-not-send="true">i915#8516</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@basic-fence-flip:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-3/igt@prime_vgem@basic-fence-flip.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_vgem@fence-read-hang:</p>
          <ul>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-1/igt@prime_vgem@fence-read-hang.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708" moz-do-not-send="true">i915#3708</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@bind-unbind-vf:</p>
          <ul>
            <li>shard-dg2: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
            <li>shard-rkl: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@sriov_basic@bind-unbind-vf.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-dg2-9: NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-9/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917" moz-do-not-send="true">i915#9917</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@drm_fdinfo@busy:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-7/igt@drm_fdinfo@busy.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@drm_fdinfo@busy.html" moz-do-not-send="true">PASS</a> +10 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@gem_ccs@suspend-resume.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12392" moz-do-not-send="true">i915#12392</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13356" moz-do-not-send="true">i915#13356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@gem_ccs@suspend-resume@linear-compressed-compfmt0-lmem0-lmem0.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-16/igt@gem_eio@kms.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784" moz-do-not-send="true">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_eio@kms.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@reset-stress:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-19/igt@gem_eio@reset-stress.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12543" moz-do-not-send="true">i915#12543</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784" moz-do-not-send="true">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-19/igt@gem_eio@reset-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@unwedge-stress:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-7/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13193" moz-do-not-send="true">i915#13193</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-14/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12714" moz-do-not-send="true">i915#12714</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5784" moz-do-not-send="true">i915#5784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@gem_eio@unwedge-stress.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pxp@reject-modify-context-protection-on:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-7/igt@gem_pxp@reject-modify-context-protection-on.html" moz-do-not-send="true">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-8/igt@gem_pxp@reject-modify-context-protection-on.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_hangman@detector@vcs1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-7/igt@i915_hangman@detector@vcs1.html" moz-do-not-send="true">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@i915_hangman@detector@vcs1.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_pm_rps@reset:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-1/igt@i915_pm_rps@reset.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598" moz-do-not-send="true">i915#13598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a></li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-14/igt@i915_pm_rps@reset.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13598" moz-do-not-send="true">i915#13598</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@i915_pm_rps@reset.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_power@sanity:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@i915_power@sanity.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7984" moz-do-not-send="true">i915#7984</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-7/igt@i915_power@sanity.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@workarounds:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-5/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061" moz-do-not-send="true">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-8/igt@i915_selftest@live@workarounds.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-13/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12518" moz-do-not-send="true">i915#12518</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12766" moz-do-not-send="true">i915#12766</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-16/igt@kms_async_flips@alternate-sync-async-flip.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5956" moz-do-not-send="true">i915#5956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-tglu: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-tglu-3/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-tglu-2/igt@kms_cursor_crc@cursor-sliding-64x21.html" moz-do-not-send="true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dither@fb-8bpc-vs-panel-8bpc:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-2/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_dither@fb-8bpc-vs-panel-8bpc.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832" moz-do-not-send="true">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832" moz-do-not-send="true">i915#11832</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb7/igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11832" moz-do-not-send="true">i915#11832</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13734" moz-do-not-send="true">i915#13734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb2/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1522" moz-do-not-send="true">i915#1522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb4/igt@kms_flip@2x-plain-flip-ts-check-interruptible@ab-vga1-hdmi-a1.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6880" moz-do-not-send="true">i915#6880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-8/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555" moz-do-not-send="true">i915#3555</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8228" moz-do-not-send="true">i915#8228</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_hdr@static-toggle-dpms.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-5/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9519" moz-do-not-send="true">i915#9519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-4/igt@kms_pm_rpm@modeset-lpsp-stress.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-5/igt@kms_setmode@basic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465" moz-do-not-send="true">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_setmode@basic.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5465" moz-do-not-send="true">i915#5465</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-5/igt@kms_setmode@basic@pipe-b-edp-1.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_vblank@ts-continuation-dpms-rpm.html" moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@busy-double-start@vecs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-7/igt@perf_pmu@busy-double-start@vecs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4349" moz-do-not-send="true">i915#4349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-6/igt@perf_pmu@busy-double-start@vecs0.html" moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-check-all:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-5/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943" moz-do-not-send="true">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-6/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-16/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943" moz-do-not-send="true">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-15/igt@perf_pmu@most-busy-check-all.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@perf_pmu@most-busy-check-all@bcs0:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-8/igt@perf_pmu@most-busy-check-all@bcs0.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11943" moz-do-not-send="true">i915#11943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-2/igt@perf_pmu@most-busy-check-all@bcs0.html" moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-6/igt@kms_content_protection@atomic.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-10/igt@kms_content_protection@atomic.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7173" moz-do-not-send="true">i915#7173</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-snb: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-snb4/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8816" moz-do-not-send="true">i915#8816</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-snb7/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send="true">SKIP</a> +2 other tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@type1:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7162" moz-do-not-send="true">i915#7162</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-7/igt@kms_content_protection@type1.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7118" moz-do-not-send="true">i915#7118</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9424" moz-do-not-send="true">i915#9424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
          <ul>
            <li>shard-rkl: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-rkl-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html" moz-do-not-send="true">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13566" moz-do-not-send="true">i915#13566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-rkl-4/igt@kms_cursor_crc@cursor-onscreen-64x21.html" moz-do-not-send="true">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12917" moz-do-not-send="true">i915#12917</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12964" moz-do-not-send="true">i915#12964</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-12/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9723" moz-do-not-send="true">i915#9723</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-12/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-14/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-blt.html" moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-farfromfence-mmap-gtt.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8708" moz-do-not-send="true">i915#8708</a>) +1 other test skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10433" moz-do-not-send="true">i915#10433</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-11/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3458" moz-do-not-send="true">i915#3458</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-mtlp-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1187" moz-do-not-send="true">i915#1187</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-mtlp-3/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12713" moz-do-not-send="true">i915#12713</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@pr-cursor-render:</p>
          <ul>
            <li>shard-dg1: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg1-15/igt@kms_psr@pr-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg1-17/igt@kms_psr@pr-cursor-render.html" moz-do-not-send="true">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072" moz-do-not-send="true">i915#1072</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4423" moz-do-not-send="true">i915#4423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732" moz-do-not-send="true">i915#9732</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_mmap@test_aperture_limit:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@prime_mmap@test_aperture_limit.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send="true">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@prime_mmap@test_aperture_limit.html" moz-do-not-send="true">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351" moz-do-not-send="true">i915#9351</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16261/shard-dg2-10/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html" moz-do-not-send="true">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5493" moz-do-not-send="true">i915#5493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12741/shard-dg2-5/igt@prime_mmap@test_aperture_limit@test_aperture_limit-smem.html" moz-do-not-send="true">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9351" moz-do-not-send="true">i915#9351</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_8270 -&gt; IGTPW_12741</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_16261: 003c44ec0b7d86569bd13d4a810ee24176c3d034 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_12741: 12741<br>
        IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
-shekhar</pre>
  </body>
</html>

--------------KAwjS0DAADsNIGf2lL6fjJZT--
