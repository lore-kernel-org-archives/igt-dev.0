Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AA0C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 03:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F81010E2E5;
	Thu, 17 Jul 2025 03:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nEHIJoKo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D58610E2E5
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 03:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752724257; x=1784260257;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aJw3sNgZqBnuAaV6RSBVkGQwgEKzAi/YEZ36ry91DZ0=;
 b=nEHIJoKoDuZYCxEfIZOEYKYhA2E6dnOe6Oi0KnoW8lLBFRDDC2CeIJJO
 ELv5szcRAnmk2HER6p5497IM2+y5NBN6KnXngge1PaVTJK5iFnuA9MFPM
 4uWjn/ZPqErysfiKvKE3EZ4rNAdOTvmjkKuaCVhsup2K3ybSNog+AWkUf
 d3vCsAm7Ys2lZsYvtwi6T6MBgD6BHfZ3vLoZyqQFsHAoMe8pbI6k1upFX
 y0w+lHpvRBgFOo8YQkAjI88RJTdnyvFOdQWj9dfQhOqn+GQcLz4d7D/2d
 COpz0hIATqPHw0linG5L1tecue/O7YfxF2xRqpi7uGUIjshwIHkzX+VJp g==;
X-CSE-ConnectionGUID: 3w/yggMuQEOvb8SDd+a9qg==
X-CSE-MsgGUID: 8VQbaXhKRAauQEOdIEeOww==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="55135187"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="55135187"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 20:50:56 -0700
X-CSE-ConnectionGUID: QBWm6jf6T6mbDHjdyBXszg==
X-CSE-MsgGUID: Rkf4LdJsSoyS/gyahR21eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="158148656"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 20:50:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 20:50:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 20:50:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 20:50:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FURFGpTdDnTkbKNksPax2cpVfahbP2evk+YeBbNCoV5OsQCom8dGrpsSLo1FXRqnAYAKZhmiR0Zf8k8PGs/Zrt5yCnaV/vJygPJnnSVWakY67LVeVNahQeQYi2DWph6jAtEwlVQCGoS3WzJVBAczUaL9QExjb+zQlBtyVtjRWmI58mpjNd8yGuGKoKiT4zC3zcRSCl40P6pkDAy+jRJWyqxZO/DOaDdeOR9Bb9kw0D/T7gULwBxPgSiDVBOCPYTvBIDDXdGQh0H019Ha/9Q2AbY+DiIkYmjwQrJdetFKfcjYhNnGqkDpd688plsdIpeqKTlSzpeJvYZnKkfHhpYMBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Etc+rVIurCoiqx+FsTa4HaHJLii+9HHJ7GCUWYJlWlA=;
 b=q+la0/bXyfw9FFnHLgZiLqks5P9ChmFJggHB/UKU7YBonAoyvXd8yZBh8UakLptf766etRBEjBbAleMFWBwSLvP9pAc6N6+O+JhGIHXgj8VmYIb4N6zNaR49YHhrnYP+ix3DjofI/BwqIbcCAvxgU9Uy2mTSkIYNV6azfgw78pUa025y/4czzJ1J9ncD6W+eUlZwN4jBeyInu74M5oRz+bM0w4GsmwSJ7nmTvzBiPE5h68WPcCXWuqqqCF/NGY7AXIUxY/E2SZ1Z65y+uhlwmNOZuh2xY2NaBM4Wc8W1TEi3+lDPRUXVlW7ewmIBc2wbqvmNrWa6MQiLWOePp9MV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SN7PR11MB6774.namprd11.prod.outlook.com (2603:10b6:806:265::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 03:50:22 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 03:50:21 +0000
Message-ID: <444740c6-27f0-4906-a51a-5e0c8a0bb6b0@intel.com>
Date: Thu, 17 Jul 2025 09:20:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_debugfs: Add a commit after
 igt_fit_modes_in_bw
To: <igt-dev@lists.freedesktop.org>
References: <20250717032031.1065575-1-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250717032031.1065575-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SN7PR11MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 992b9bd1-f353-4e46-b774-08ddc4e50df3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzVEckg0cmRMOVZEYjlFT2sxUDlxbnZmdkRDSzFMbUErNjlNcmx6c0RGRUZx?=
 =?utf-8?B?bFRIbkNrd05LY2Fid2VZdFJqWE9tSmpKTnRFb2NQdGRDM2QrTTRjenJZVHZv?=
 =?utf-8?B?TlVnWjRiRHRWMXR0ME1RRDVuMnhzbFIwcEhuTGtuSVFIWmpSQTJyWVFrKzlC?=
 =?utf-8?B?V2NEcnVWWWtIRzhnR3czSmhuRGZGMDRFOWgwVWs2TG1TeTNlR210NGJDeTBQ?=
 =?utf-8?B?QlEwUG54VDI4bWJNNkQ1THNMWkRGTG5oZ0lwNHVJRnEwUUpnWkE3Tk5aMVJL?=
 =?utf-8?B?djJjQndWcHJZeHFuMWh5K3RIV25YdWNJMTB3QW1lY3ZWTDVEV2ZrOGtDSUxO?=
 =?utf-8?B?dW51ejFhU2dPbXE0bEdCM2hqZlVUbFJkZ0J3U0IzOEdmc2NpLzlsd29venR1?=
 =?utf-8?B?TzlOeExmYjBXVzBJZ3hKaW5sUURiRTBnMFgwQmMvcHdzWEdqd0s4ZlJIclRF?=
 =?utf-8?B?Nk9MVUlIbnhKcWpwWU1CRmtmWFFyMUkrcHRLR3VKV3E5RmZoUWxjZXE5b1NS?=
 =?utf-8?B?VUdnZ21MTWNOcUhhWHZDY2NTMllucWJYalRDZmtZMmhrRlZBS2xIcHgycU4w?=
 =?utf-8?B?K0ZXSVdIdHhFelVSdkhDYkFRLy9OMjhucnZYNnpTS2dUMmZxemVXWmxuRjVE?=
 =?utf-8?B?QXNPdTlNTW5TOHgzVXpWL2kxSFVHYVR0b1htalpqQW1td25pVnFCSmV6WnZy?=
 =?utf-8?B?d1lyZStZRm1JcFJFd1RBbzJCM0pxQWZQQVNmK1pXejZPeXNyVG92Z1FoTWxF?=
 =?utf-8?B?czFEckZML3ByQkZsMkdXNlo3bGpOdVBiQUZTRCtHUThGMXptTkdLU3k4UllY?=
 =?utf-8?B?TzhhK1VEZ0tGSjJGVVlPRXZJMzlJWWkvL0Q3MmxpSTdYVEpCS0RNb0c1QU5i?=
 =?utf-8?B?ckZYcGJYbG9hQUxtTWdwdnFJcjNxL0dKSmljR3UvZGtRRDRWMG8xMVFqK0No?=
 =?utf-8?B?K2tBMTE1ZmtCS0JTV0FFUENUbXQ3S1JmNm9lWTVZOW8zeU82VlJoRnNmc2lV?=
 =?utf-8?B?b045OTFmTUxaQVVaNkcxa0lLZFZJeHZCTXNhUUFOTmpiNDErS1FpRlZBL3lS?=
 =?utf-8?B?V1pMV1NtOXRjRk03cjFMQXdOUFhVRTRrS0RhWTYwMFh1S2xjQWR5cWEvS0VI?=
 =?utf-8?B?bmlmUGVVdk8vUDdvclpoYUFlYUdzVHg0K2RabXExdy9tbWd1NEZtUlhVdzdH?=
 =?utf-8?B?V0xiQmc4RUxXaEs3ZVdZbGtQclJUZDhRSVFqY1huSUIvcWpydU9hblVKZWN3?=
 =?utf-8?B?eGtIdmZVMVJ5eUFpREFCSFBxWXc2bDdoOGViUldoTFVLNXg1SWdtejlZT3Vt?=
 =?utf-8?B?MFZsZzdBU0lNVk5GVUFjK0wrVUhTbzZLWHZQUUNIUmdQZmpsR0NmWnZTYjl0?=
 =?utf-8?B?OXZ3VWJDOFJ2cnVnSmNUN3lrUGJmS29QTTNQQVFkbTBMRUpnTFhFdXNvS3hP?=
 =?utf-8?B?VWlwdDdhWTU1eHQzMnA5cFFabS9lTjlaem1DYlZPS2dxRU92UmgvdWFiSUFy?=
 =?utf-8?B?SjQxOWd0MXRNTTdVaDBpZmZTNE00RzUzNjU1QU5BUkFBRnU0MEdFcjdoZHdB?=
 =?utf-8?B?UHVURjlKOHlpU0NvNWROdUNCT01ja2REdERkMWR6RGVMdkZYS1l4d3U3KzNC?=
 =?utf-8?B?R1VDT0ZUZ1VUSXQ3YnIxSzF6MUhNbElvUXFDWW5VZkJoSE9IT01wcG51Q0Vv?=
 =?utf-8?B?MjhpQnNIVVdJaDA4cmhzWXVmNlI4aDhWRzgzRll4aElkVm8zbmpCYlZTQ3FQ?=
 =?utf-8?B?WC8rbm1tdy83Y1dKVjI5dXB6RjFZUkx5ODVhRVFhakRrcnhMZmxjK0JoNHlH?=
 =?utf-8?B?UFpTUEluYm96djdETTJjUElDTDVORmtVY3BXTXNrNTNFbndvWERZdXAwN0hx?=
 =?utf-8?B?cG5lWDZIalpKb2tBU3BSZTFuTUI2ejdLejVwZ2VQdUQ3N1ZyWGxzaUUzK3lD?=
 =?utf-8?Q?tz4STmRHbo4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWdXNlBURDdYOVdzUU8wMHZoRXR6ak5YYk9DNXRQSDJpb1ZMb2ltaTB0VmVm?=
 =?utf-8?B?c2laVnBUam1GT01lV0tTN0F2aWF1VTlnZmtoUkZobktFY2FvVFphR2hhSnkr?=
 =?utf-8?B?czhGVFVmUi9XbTJSSmVsdE5vUllxdVU2OUtBQk9iSk9SbERoUW1ibzRmaW52?=
 =?utf-8?B?R1g0dVB4d3JUNkxhNDMvUVN5b01kYnZVRTlmbWN5bEltU280WVl0OWRoK3pi?=
 =?utf-8?B?UnlsTnZtNTV6VndZRWluM1E0b2xKSVVNUjVQZ3MzNHlmUjBnZzdSKzFtRUdK?=
 =?utf-8?B?MTloL1pQTHBlMXlmd1ZSQ2RwY2RNUWs3Z1JwdnVFcVFVSFRzMk9JU0hyQkw4?=
 =?utf-8?B?KzE1dGczY3hBaE5WQWNGNVJrZXdGdWVnV3k1MG5za2g0UjkwanNqSWt5ZDV5?=
 =?utf-8?B?eVp6U1V3WStPOEtQdGFrLzhvb25XL3JwZjJXQzVXNmxsZitjTU9BMkxlTEcw?=
 =?utf-8?B?TGNUYzRDMzJSOUIzdHpEOUswamFRTURLZHNMK2lySXhwbm5lM0c2NStrMEtL?=
 =?utf-8?B?QkF2d0VNbFBmd3BvRUdPakdIcVZvRHNyWlFFM2phcnZLZjM0UVZrMjN0S0dK?=
 =?utf-8?B?aE1sUHR6N0U2emY5RXVzQ0xQcEFFNnYvVnVzR3VnQkQ4T0kvbWpQM2UyWDNG?=
 =?utf-8?B?MjFlakJKNmIrZ2tCQ0lSUnJXci84cTcxanhCbS93OGhWZzV3NElCbU84TWoz?=
 =?utf-8?B?czlGN3VJbkk0RnBqTlFLc2hIYzRQYnZsRmVtc3gzcHFxcUVqY3RuQytlWXkz?=
 =?utf-8?B?TEdwS1pxMlFSb0xjS2ZlRy9zcjhNY09yQWtvcjYwMXZheEt4aWZLNU13Mnc5?=
 =?utf-8?B?c3hlMzY4WFM0a3ZadzlBeG9EVExEZHc1WWE2RE5Rc2dDVFpGMEdpWVFldFJU?=
 =?utf-8?B?YkFFV1AycmdCVWprMTFyMWF2YXJhZTFENDZvbUZCOHRUbTVDYmdDWlZEemx4?=
 =?utf-8?B?R0ROOXlJWThaWVN2aXkwNlJkVjhWRHBIejNqd1Y2dENvNE93N2FhYW9mVFAv?=
 =?utf-8?B?RUorRnFZeXdOVXNlTzJDSTJkR2tHeXl5SGdWYXcrZWgydk5mMlU3MmFjWmVT?=
 =?utf-8?B?YzdlNWEvZ0ZiWmlnV05kV0dSOVpKQ0R2SSs2em1IOHdTZ1NGUDN2QzdMeGJM?=
 =?utf-8?B?Y1FOblNoZnZKNGpDOTJCQ0EyUlU1bUZJV1JnZHl1ZkJ4UGhmSHZXcjZ4NzFl?=
 =?utf-8?B?WDVEQ245VUtzSmFkaGczamNNekE0SVh0Rlk2RE10dEcrblFLaDlGSEZIVGlw?=
 =?utf-8?B?bThOY1psNFRPcXF1NzM4Q3l6cjBsN3pQQ3BZM1B1RW9GYzBLVUY1NVhHNW5P?=
 =?utf-8?B?VGVqMng3M0trR0diTHVMaXh1VHcrK2p5UTlvK0VDVlNkVUsvZmNncUVoemdC?=
 =?utf-8?B?c29WdnFmUjdVMlpiN2xkc2l5S2NQcVZyM2Q5SEU0VFR5OUhOMEVESzRTUXda?=
 =?utf-8?B?Z3pLQlMwd1I2WE5SR0RkZFplZGVyNEhuZWZNUE51M3JPT1ZkU3VXWXJoWnFT?=
 =?utf-8?B?NThveXoyd2F6MnNTWlB5MHltdkFOVmc5Q2ZQcGhwbUtPWjVtS0hySkEvNzZM?=
 =?utf-8?B?WktNbC93ZzVhSGtvRUw0VzU3MHd2YzRuOEZibDJySVNQRS9NZmw5YjlxaWRz?=
 =?utf-8?B?c3FNYWxGZk5JeGZuemJsNEhnbG9HVG1DbFNIdWk3Zy9zSzRROG9CaThGUW9m?=
 =?utf-8?B?R3phcnBVY2trMXdMVUUxV2c3eVpwdUJIT05udVQ1eVE5MjFMKzhQM0xJQnNY?=
 =?utf-8?B?M28wZVJDRTdsZ1YvOUdYOXVnUWkrdTlxMjFGTGxPL0Z3OFlYaDFFMUtjcEJ2?=
 =?utf-8?B?NVYxVERnQXBaMnNna2ZCdkcvS0RpT28zazJ6WVVWc1VQdXcza3hSekF2Q0Vl?=
 =?utf-8?B?QTZyUEJ0eDA1dXdPWWp4VGt3TCtYeVZXai8reUI0WjdPZE93VURyUXp0djNl?=
 =?utf-8?B?dXhaTHg2RGx4Q2FsdnJvSk5UUmdoc0dFNWxpWFpIdnFsQmd1MHJpSGowbTMv?=
 =?utf-8?B?M0tIT0cyUEpoeXVESzRPaElzNVNLRnl5U01rSGxVeXV6N2ppRlVCa3U1WmdZ?=
 =?utf-8?B?VzlaNmM2M2tLWTA3K3BNOXQrbzQwYnBLeTZId3doR05LVzRSTWswWEtuTjF5?=
 =?utf-8?B?V0Ywelo1VW5QZmdMRnp0WnhDM3VHU3lmZDlyRDdLWXpRT2IxaGlBYnpTb0ZQ?=
 =?utf-8?Q?sjLIXlcTAI9Rxsw4ycaCU0w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 992b9bd1-f353-4e46-b774-08ddc4e50df3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 03:50:21.8689 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /oRbbhHXdii4fAog6gGQ6zjt+ztvLZ0C4Dh6xVcazD1dhrCj4KGWYYIaAMLHRxLM4HAXtCMKw0kZY1MkiXLJHAWoniuHx5kVyfqkpfGqHyQos8PJk/xa0DpdwN+Rf8ek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6774
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



On 17-07-2025 08:50, Karthik B S wrote:
> A commit is required after igt_fit_modes_in_bw as this function only
> does a try commit.
> 
> Fixes: ebe65a923a2b ("tests: Add kms_debugfs")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> ---
>   tests/kms_debugfs.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
> index f8a3360e6..75ef15353 100644
> --- a/tests/kms_debugfs.c
> +++ b/tests/kms_debugfs.c
> @@ -66,6 +66,8 @@ static void igt_display_all_on(igt_display_t *display)
>   
>   	/* Skip if bandwidth is insufficient for all simultaneous displays */
>   	igt_require(igt_fit_modes_in_bw(display));
> +
> +	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   }
>   
>   /**

