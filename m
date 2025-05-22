Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3303C54756
	for <igt-dev@archiver.kernel.org>; Thu, 22 May 2025 05:14:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733C79B35F;
	Thu, 22 May 2025 05:14:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQuMn9oD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEA09B2BA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 May 2025 05:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747890848; x=1779426848;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RAamkaumwZHpjrqp1UPB0W1CmFZHMI/3qzm9Y4JpQOQ=;
 b=gQuMn9oDJjxLZD+E/VcY8xl+r96T3TYZFs8JFx+VyFPU3lmH59Dr+Rjh
 wgCFW84S2mjYWt7W9JqG/O4Im1HW8UfEm5yx+G6yDI6F4ajnszMW7SnN+
 kGUpfwWcHky7wK0wU3tEAz8rvNV9+U1iUYNlEUj63VHHevF5vM0E31TTy
 NI3pdnLKAzZ6ZXk87g98nFc1/clcvofi5pH/63J4GHC3+QMoiJ9GEnp79
 UxeNDqxrGCOlhqsRka/1UH1N/GtxTGVTyRq5WcYB49zzcXuFjew56jwak
 /tSsyN6BHevInehyF4KEWeaEXAq8dLpOsGdJgA8S+kvZK0yMFwKKIRb3r g==;
X-CSE-ConnectionGUID: zlUIal0BTaKbTDUdgJfy6Q==
X-CSE-MsgGUID: 9ZKR9gFpRoe8kY19A8PC/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72423361"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="72423361"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 22:14:08 -0700
X-CSE-ConnectionGUID: PdrBofPRQRSUpt/MsWxnTA==
X-CSE-MsgGUID: 0DMlfbIySHeN4eQyM5OeUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140307255"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 22:14:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 22:14:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 22:14:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 22:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yGmfVMOY8lPXyNiEntD+tECphf/3bUfB8r3skopLxlEaGl7AfgabKDmZH3V+WUGV3jwG+naXv144XW2a9i1fCVEwTCQU4ncQjmE5rnugKX6t8SN3m5x70r2ILJnoe9gg8WFMczvs0yQVlb/rHVkUctRldxFuUOENd8amzefoSWS9uCAZumYiiPC0qo1cLOanTAHGwRk1N/frnt322xvTBOytIsiKtu53S3ypy0ro1zZ5CgN9yCTBV6Do03xV8a2E+KMJMYagpdDlqK0VZJ0Z+MhgrTBOcW9B+jjP1qmrUvv92zgfR6nhFsv5rzsOKOty5cbT/w0vx/3mlWe+6Hm/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QfMzaDmBkOMsP34wm2KC+fejRUh9iK9P+yvs9+vqQKY=;
 b=OCQJ6UAdXo22OH0mznIrRe5bdnSkQoZorcAZxlW+KiLY9wFUq4VUwjbln4pL7rhYnbqIasd5NXbInqozW+pdSoz4BK83LhObpVifK0+JjyqelZKB0vBl2v6JftsBM0iTbPcWBJB8scm7vfhNx+zed2aNEArbSTBX4aB5J4af0MaxJtygHKwJ1smdm9bn9CxEyfh1ax+SUI/XiohRh8JYfx+cMsk0M69PRp0EVaEhcButwxtbRX/BGBG3bk9Vh2Fkudzsrt/gsfox0M7OixHl0U8kCNwhDN8mKbq2w8bogWankR7Y87guT7oLyyvnN0McK7ao1aSvcFKg9gjUPYvFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 22 May
 2025 05:14:04 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8722.027; Thu, 22 May 2025
 05:14:04 +0000
Message-ID: <066dc0f4-9c58-48ca-90fc-f93531839518@intel.com>
Date: Thu, 22 May 2025 10:43:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Check timing twice before
 asserting igt@kms_setmode@basic
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <swati2.sharma@intel.com>, <uma.shankar@intel.com>
References: <20250509064634.809197-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250509064634.809197-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: ca96cfdb-2da5-47c7-14f2-08dd98ef7859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFpUVktGRE40YS9CbzFPdnN6Y2lTeUJOMTVFM29QZFp3eTZva1l0YktpdDJT?=
 =?utf-8?B?Zk1PVDUvQWtyVlQ0TkM3YVk2K2o2ZE9WcmNhOGxZNHY4R1lzWERIWmhNMlZr?=
 =?utf-8?B?QnJUOVcyY3V6akNqcmVpbENoaGxlQ3VBaEM4Zm9sQUVyOTRLUXg0dVJhS3Q0?=
 =?utf-8?B?cm5yWEFMS3M4OXJiK3ZWek1iYktlTnZtSytpNkIxU2ZNdnlPMUdtTGRNR0Zv?=
 =?utf-8?B?NzhTYnoybEdrOGo1c25BQjA1ckdXMlNHbnNmcFRZalpSdDJPZTcxL2RnY1Nm?=
 =?utf-8?B?VEpoeXNGZWF2TkFTcWdZOHNnNm1ZUjZGWWZPSVF6S01ZbFpXNkRIZldFdkJo?=
 =?utf-8?B?WWI1T0FicXViVS9hUVgrdDkrMFFOT3dBbzVwemppZzVlOFJnbW5wdXNtSlhq?=
 =?utf-8?B?enM5b3NCR3dkd0h1SWdOZmRzc3JwdFZtd3NFdDNGZ29tV281T2hPUEdsNGgy?=
 =?utf-8?B?USt1aFZHa3NDbXI1RjlMSDJQeGJ5aVAwbTJQbFYwQ3pVVW93bW1ZZjNWVUlY?=
 =?utf-8?B?a3RBQ3FQUGJuajJjZWRia0RUaGxNYUYxdktBUVBXMnpBUXdjVC9aWmhmM3VK?=
 =?utf-8?B?d25kOVpQbWdwQ3JEdTZMdGlZVklvZW4vTDhyYWN0U2V5ekY0am1qanl6YWE4?=
 =?utf-8?B?ZDNudGZzWEtiTWNzRkYxQzVXSTZ5VHFXVXBPN3JFclZGREk1T1JoRlNnNVk0?=
 =?utf-8?B?aXBCOXllV25hVW96RHV4b3JmL2RXU0NhT2k5Tk9CWVJOMFJTOVRyUDErUTZE?=
 =?utf-8?B?eFhvK0grTjV2MGZSZytJcG42Vi9aUGtzZGxkU2lod3ZNalNraXhnNUFmRjRp?=
 =?utf-8?B?ZFljK2k1M1J5eXVQZTRGcEhybEdpNjlseFYrcVFLVHMxb3lNU0c3anJGWE9Q?=
 =?utf-8?B?bEZPT0hIdU9FYTJ0SEtuZGFORTlLbndBY1hRcnU0bEM4SzVheVFpNzRybElH?=
 =?utf-8?B?YTJ0TXZrUU0wUHBQc3dydjhuZW43ZFVOU3dDcFdIMGw4WlFta1JiczlLQkl1?=
 =?utf-8?B?S24yNkNEN0dyeldLeWxsbGJ4UVpsTmJJNlNBUFNxRDBqSVN4RWkyOWl0a1o3?=
 =?utf-8?B?aC9TVU5CVHE5NkdTbStrWXpmeGkyWWxsL0drWTNBK0hUOTVNZ212ZXB0UUFX?=
 =?utf-8?B?UnNCMlpvbU84NG9WaW85Uk1WNlRtQ01LQi8xYmZZWU9RUnBwbTRvTGpqOWRn?=
 =?utf-8?B?bGlIMVl6SXdid0lCam04Tm1JUXI0blhWM1Z6QVFuYU9VbkJ5ajFIQmJyblRU?=
 =?utf-8?B?T3JhMjIzK05DQ2pkQmc2VEoxUGVaK3d3VFdyT3RYcG1JMUVtU1FoSHdjRDBC?=
 =?utf-8?B?ZTJnTlhHOWp4NkdjOXlNbDhSMVVjRDh1Z0lnNEh4STJwaDgrcnVuQlozQmhP?=
 =?utf-8?B?RHpjUlNEZVVZUVhYUW5PZHNLb24wTEdoMmd2ZWI4Y0c4a20rR2J6VkVWOEp4?=
 =?utf-8?B?cTQrWmFGSGkxWUM1Y2xDdDB6eHloZVUwcGUxd3IvZ1JId042SzhMNk5jeCtQ?=
 =?utf-8?B?bVJscmFVNWQxekNIY05lRXNEYXhmc0c5UWx2TnduR0duWFJVa2w2SzQ1a1F5?=
 =?utf-8?B?djIxKzJ5dXBpMWFidk9rQ2FXMnQ3bFpFMGVDTFA4ejQrSU13d0llMVZsbk9D?=
 =?utf-8?B?c3cwbjEva2l4KzhkRWhtam9CbWd5SnorM1FxMTA5M09TdVorL3V2WnZPWUk3?=
 =?utf-8?B?WFY5c1hTM29GYURLL1BJTGM1dnJVNTJXdnlLMkMvayt3djh0Mi9Ec3hEWVZN?=
 =?utf-8?B?THlDQlVkeUxOVnczeDFyM1dkWXNsajBwTjVYVUFuZ1hiMkh1Ri92eFV0WGlB?=
 =?utf-8?Q?Dv9sbEm6Okoc4i3CrcK+/1SOebDtltOVKM2jE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktsUTdDdkxqcjZGbVpoa2YybW1hUGJqdHBsYnBOTlZXY3IxQTd6ZUc0cld4?=
 =?utf-8?B?T3lpQUxYL0dzRm55UWRkZVZqRUNOUURNNVFkbktVTGNZdEp2MUFsS1czYUsv?=
 =?utf-8?B?TTkvRkxQeGNCTy9nY0ZJNjNhaFllWFcyS1V2NWluWEFMVTBPV0pObDhYQmlT?=
 =?utf-8?B?ZjFsZnZHMTFoL3FaK2JMZlcxak4zUFdyRWFxY2ViR251MGVEMGlXMFcwZ2g5?=
 =?utf-8?B?VmNYTDhxU0swUnJVa2dYLzA2VVpuY1I2ZEdKSFBmeGIxWXoxbVdkQTlEWWNM?=
 =?utf-8?B?Y045RHBhS3F5UFJYWm9yR1BEMlQ2cUw3TnE4Q25sVWFIMDVzUkd0bTFuSXo0?=
 =?utf-8?B?T1Rhb01vTDJyMGlTR2s0V20yRTcwcTFUVW11S3gycWZaNEtoaXh0ME9yVVla?=
 =?utf-8?B?UGNNdnQ1dGZwaDl3ZkhPblQ0TmdQdXFCZzQ2UjlBWkMraUdIdzVpSkQ1eVRv?=
 =?utf-8?B?dnNjS0tXNytlTHVHVUpkOWM4SzYzMEVQWGMwejluZ25vcUFZYklLMGlPSW12?=
 =?utf-8?B?eEgvQlFiUTM5cUZyZFBFVXZhNmdEV3ZHTzBJazh5S1pkbi9kbDFmQXNzQkFy?=
 =?utf-8?B?WjZQb1VZcUZwaUlxWCtiR252bS9YQlExc1dDSENYTFhnV0o1YWZUQ3dNc09a?=
 =?utf-8?B?SWE5cGFVZEFwakFXN0lvU25OOXI5Y0NIa1JGdGMzNU84TENkMWp2OGxYMXRn?=
 =?utf-8?B?R2tWemZmTHM5OUhUTk12VkhaNE5YSFhnNnNlRWdsaWhGcGIycS9hc3IyYWM2?=
 =?utf-8?B?OUpkZ0tzTzd5ZGQyK21CWnZoei9tdk9qK2NBL3hOc1B6Y0tRSTFNdExtdmRY?=
 =?utf-8?B?aUlnNWdQdHRhdmlNTm5GNmpueGNIcHpSSmczeEVXYUJqYUNCZEpzME5COTBp?=
 =?utf-8?B?ZWtQL25BNWZsZU9uclFOeXh5RGlYMlZlVVNtN2J4bk1reXZXdWxMMGFHeHdx?=
 =?utf-8?B?QVpUY1NMRGlDWjFIcFNZMTVaZHR6MjNuRDMyQjNJL0dQU2UyWkJvdkZKWmQ1?=
 =?utf-8?B?WCtQakV1UThyREQyZE9ZaExDVm0xSmFudmtBUGp1QUhhYW5ZN1VKQU9hd1l2?=
 =?utf-8?B?OVZGUGZyQS9JUnBPK0x1ejU1SVdCWjVaWGJqRkdxbFJMdTFSMEEvVnhEc0xW?=
 =?utf-8?B?UzE1TFNxSWVGVG9pYWpNeDJhaWIwcGxWdUtwcTQwa0tYVCt6UDgyUHJhYk1Q?=
 =?utf-8?B?T3dsQ2sveDExSGVyajhzMk4xZGQ4S0FsendwdURaUDRWUXZDWGVXdnFYWXlU?=
 =?utf-8?B?WWswNkhJRkFsNGxJbHFQN1QzdFFQdXZNTzhBMDY0WnoxSTNncWdZWGFDRE9R?=
 =?utf-8?B?Z05PQlhPY2hVQkM5NVpYYVp3QkUrZEZiZ0hwOCtpT2tzSWU0R2xhREtYc0lt?=
 =?utf-8?B?UUl5cE5yVzBqYy91MUJhTDkyVW16TnJ0REF5aUxOOHF0RS8ybXBaRXlTUEpP?=
 =?utf-8?B?dTJwL3BXT25wSmRwTVd5N1RkTW5HZ2VjajNaK2dSN1BpdFp1cG5wRWdCUDAv?=
 =?utf-8?B?QmRFMkJCdXBPUU5aamwzWUVNMC9vTjJYQUZTYXQ5YjU3UXZGNGRHSDNNRHNr?=
 =?utf-8?B?SDNJbjlhQ3U5ckg4dGdUcFpGd0s5eS82TEgyaE5rUnZVRTFjb1NEZG1NMmhU?=
 =?utf-8?B?a1JRZjVlc1BycjY0dTBnaHhvNVhZOXpoU3ZxRFN0V0k1L3ZlN1RNSkJ3SzNi?=
 =?utf-8?B?SzJLRmxDWCtoQktaazBpNTNyN05VLzJNbmJ6M1hpQTA5YmlnU2x3L1E0dG1w?=
 =?utf-8?B?b2hjVjMzd1M4emVWZ0p0cTFvbjBxTGZTbUtQMW5YUDUyN0NpVXB4dTRBeWNi?=
 =?utf-8?B?QmRDUXlzUExWQ2c0Z01vdVd3ZFcrb3hIMnZqZnRSQjhBMmJMU0NyYUVlcDRr?=
 =?utf-8?B?OVV5V3pFRmM3a3dWSXQvdTlYQTNieGZzRU5WWW9SUlFUM01oYi9ZZ3pZNVFy?=
 =?utf-8?B?WEpOTDFxaUYraFFlWXY1dHBWMXprRk5BVUxnNTFsb1oyK0xJUVprRXN5NGQw?=
 =?utf-8?B?b1ZlQ2JFaEZ5citUNEp4ZWEwOUxYVFZSZWpYRFZVd1NPS09XLzBxWDEvVW5w?=
 =?utf-8?B?dFBHbm5CK1BNMGQrMWNSTU5UTmFQZFdMNTFGT211czNCeGR3YU9yY1VHeTdV?=
 =?utf-8?B?YTQrOVdmc0NtS3FjcitoOXFTMUd5dERZT1RPV0c4Sld3YitjMFJoYW5zOURw?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca96cfdb-2da5-47c7-14f2-08dd98ef7859
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 05:14:04.4676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9g0UVJf1E8OvTf8LZFHmXQNGa8UM1SkqiGVmLv4Y5HAOQglr6jfnwjsy80Q5fcYBnqiTWp6pOLVmSzBuG4xAvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
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

Hi Jeevan,

Please update the subject line. Do not include "igt@kms_setmode@basic".

On 5/9/2025 12:16 PM, Jeevan B wrote:
> The check_timings() function used to fail tests if vblank accuracy was slightly
> off, which was too strict for High Refresh Rate (HRR) displays. HRR modes, are
> more sensitive to small timing variations due to their shorter frame and
> scanline times.
We are mentioning HRR displays, but we do not have any HRR specific 
checks in the code. Do we need them? If not, then please remove this 
from the commit message.
>
> This change adjusts the accuracy check to allow retries and provides more
> flexibility for minor timing differences, which is important for HRR tests.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_setmode.c | 42 ++++++++++++++++++++++++++++++------------
>   1 file changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..f58f05ff1 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -461,7 +461,7 @@ static int test_stealing(int fd, struct crtc_config *crtc, uint32_t *ids)
>   #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
>   #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
>   
> -static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
> +static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   {
>   #define CALIBRATE_TS_STEPS 120 /* ~2s has to be less than 128! */
>   	drmVBlank wait;
> @@ -540,9 +540,12 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   		 100 * accuracy / mean, accuracy / line_time(kmode));
>   
>   	/* 99.7% samples within one scanline on each side of mean */
> -	igt_assert_f(accuracy < line_time(kmode),
> -		     "vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
> -		     accuracy, 100 * accuracy / mean, line_time(kmode));
> +	if (accuracy >= line_time(kmode)) {
> +		igt_info("vblank accuracy (%.3fus, %.1f%%) worse than a scanline (%.3fus)\n",
> +			  accuracy, 100 * accuracy / mean, line_time(kmode));
> +
> +		return false;
> +	}
>   
>   	/* At least 90% of frame times fall within the one scanline on each
>   	 * side of expected mean.
> @@ -565,12 +568,18 @@ static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>   	 * See:
>   	 * https://en.wikipedia.org/wiki/Standard_deviation#Rules_for_normally_distributed_data
>   	 */
> -	igt_assert_f(fabs(mean - expected) < max(line_time(kmode), 1.718 * stddev),
> -		     "vblank interval differs from modeline! expected %.1fus, measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> -		     expected, mean, stddev,
> -		     fabs(mean - expected),
> -		     fabs(mean - expected) / stddev,
> -		     fabs(mean - expected) / line_time(kmode));
> +	if (fabs(mean - expected) >= max(line_time(kmode), 1.718 * stddev)) {
> +		igt_info("vblank interval differs from modeline! expected %.1fus, "
> +			 "measured %1.fus +- %.3fus, difference %.1fus (%.1f sigma, %.1f scanlines)\n",
> +			  expected, mean, stddev,
> +			  fabs(mean - expected),
> +			  fabs(mean - expected) / stddev,
> +			  fabs(mean - expected) / line_time(kmode));
> +
> +		return false;
> +	}
> +
> +	return true;
>   }
>   
>   static void test_crtc_config(const struct test_config *tconf,
> @@ -654,8 +663,17 @@ retry:
>   
>   	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
>   
> -	if (ret == 0 && tconf->flags & TEST_TIMINGS)
> -		check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
> +	if (ret == 0 && tconf->flags & TEST_TIMINGS) {
> +		bool status = false;
> +
> +		for (int attempt = 1; attempt <= 2; attempt++) {
> +			status = check_timings(crtcs[0].crtc_idx, &crtcs[0].mode);
> +			if (status)
> +				break;

We could add an igt_info here saying we're going for a retry. The above 
info during a return of false shows the test failed in the first 
attempt, but just to make it clear in the test logs.

Thanks,
Karthik.B.S
> +		}
> +
> +		igt_assert_f(status, "VBlank timing test failed after 2 attempt(s)\n");
> +	}
>   
>   	return;
>   }
