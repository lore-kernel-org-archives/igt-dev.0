Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC55FCE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 15:51:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D30B10E3E6;
	Mon, 17 Nov 2025 15:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q34dhgFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47ABF10E3E6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763394662; x=1794930662;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6N457xgIBSGms45rbT0piBTDaFBk3dXndEF8HyKBGfo=;
 b=Q34dhgFAiE1yqknRonbr+qnX5aC3ZYE8NXe5GeiczsO+PDfw0gCX+1rJ
 P642XTUC6POP39GjowdiSHq0d7U3C5nQOSb7Duc7CefDUOYKmeXsF0B/S
 i2zNqTxqHVkqZfEgyQuac0xDImQsMKXcXKh4PYmzGzLedPiFC/OjNa0Tv
 gEfI7Me5PO3zAUL7ZK5pq6+zp0B15O17lc7T2XTykHMUPmkaYiEKhRL1y
 Zk7Vg4QqxowkXVNSi6E/i2olr9TgfUC7CU0DTKu4GcLvnI3orw3TzVK0O
 SAReXGUNc+blnjcdEfDzfwJyGGMyz99ScWdB+EOyVXQ5MZPGGak+2Z36z w==;
X-CSE-ConnectionGUID: Moo4KOqjQLi3Y/wmOQr9qQ==
X-CSE-MsgGUID: 3MhAMWEySiGc0CoYV/SgNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75999178"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="75999178"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:49:13 -0800
X-CSE-ConnectionGUID: r+aAi7CQT6SAsbiY/q3u4Q==
X-CSE-MsgGUID: 6o/1R5spSfyaziAy3ZofPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="221134962"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 07:49:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:49:12 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 07:49:12 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 07:49:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gTMPNSvapSmGS8eBnIc8exSIYmF46BlUOrn4kQOuzBXkpW81Q/dkOr//LhmFUYRfznqYEQrj5Vojqss4ZLv2TIPiyKVp9X6xbAsovYS+L2LI10htGT749sIZSahDnCnjLtrBpTIfmvMVE9VLTl4PYOu3sw5LO8mpkrXJKYReUQWvdbfsh7LyOhMDyE0WRAOiCU6cPiW696OqWumNa1eRlhMqzmuX0DjvWV7KMdzoLvneL8BtxFxwjMhX0+t28lI7Wln3W7ts8mc3AofvlP9xVKG8h14GJ7J926JE4wmKK+Vx/7an/obGQu6PPmU+gj8V/EzNlMOSJw/4yRvh8/FK7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JILJ3/V87Y9lPNXl7DUGKEt3y3WJ73uvW4ZknTxAJBM=;
 b=R29QCd4/2pqKm0e9xRf4KALz+RXAQQTWDDAoTfjyTEsMlzk9afg90odGS8BpN+0UG8QzueDhny4HEUS165KK08LzuMKk/nPbXwFigjH/zuriXem9foHZB3bcl6FzU1MIAfkEctzj4xmnbPFIIj66XZWNOev7q5N0oJNLW55GK65iwzTOKzNgWty9588XS+eolw/YxLAuBGatYMW+vXijW30GTrWQLjG5WfvPdj6gR+O6hEiMz0Ow3IHCMB0Y/FN6pkcKQtpyPl0KddmhW0GktxTM9Qiqhubp32Sb+pd3Z712mfKDIkrLjE8DtxTM7yRZYVFPZ8ZWCQvJ/tB/lARAaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 15:49:10 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 15:49:10 +0000
Message-ID: <3f2239f2-1608-4343-808e-3acd60cd7545@intel.com>
Date: Mon, 17 Nov 2025 21:19:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 03/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU cross-GPU memory access test
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-4-nishit.sharma@intel.com>
 <63c6659ae13e5d46c9ed65dbdc9cfbed1d26c363.camel@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <63c6659ae13e5d46c9ed65dbdc9cfbed1d26c363.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::13) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: df4c446e-508d-419b-213e-08de25f0d97d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnBHNEw1aHR1QlU5ME5KQ3o2VFRoQUxZK3EyTytVSmFuNmtML0w3VktQRGIw?=
 =?utf-8?B?bjdSWEdkOHNpTzQ4WGNHUTVaWXJxRXhtVGRlc3U2OEswSVBzSjM1dUFlY1BU?=
 =?utf-8?B?VUZCdGo1eHdyMDcxK2cyK1ltdU4yb1lpa09vdmgzeE5NcE0rTHgreDl3Zy82?=
 =?utf-8?B?eWtFakt3dFdqR0I4eDZaM1FaN1N4Q05YZFRGOFc1K1F6OXZXMWRFaDM1b3l3?=
 =?utf-8?B?bGh1VjA5MWlvTjlsWFE1YXZRSU1tdk1oejJLeU9waW5wY2ZUS2RUTlFBaG5y?=
 =?utf-8?B?Q0ZDMmIzRzVwenQzV3BjTjFHL3EveVFyRDdzOXUvWDBEbjVrWGI3dHRTeENN?=
 =?utf-8?B?eHJiV1lPMjdZNWFtRS9uUkFWOTFRR00waVlpNEIwNG94dk85QmlXWmpJYytv?=
 =?utf-8?B?a252MzZNK2RkU2JCQnNDUE5pb0V3dTV0bEh4MDNONkJOSjhRaVNFN0FWbXdW?=
 =?utf-8?B?aXJvVVliN2hBb0VOSUYyZVZlQnppTXdpRXRKNlI0KzdkS0tJay80cVhnSFFh?=
 =?utf-8?B?ZVo3djZmckdtdENOMGNwMVI1TDZQQ3lUbVN5TEwrcitsOTZkei81cU9WZnJw?=
 =?utf-8?B?eWpkbmpuUXRIOTBJcFUvTHByWjFHUHlSWFBTSE9WdGFFYzRFbUNHNUJtR2NZ?=
 =?utf-8?B?dGFZbTBMU2hwNGRteTZ2Q1VHMng5dWdsV2UyM2Z1RVZwWDg1RWZycEFhUldB?=
 =?utf-8?B?dkFaTWlsME5ZRFhWZGV5alQxQ3hKOGFseUhVV1M1ektlcCsyVWFJczM0OW9F?=
 =?utf-8?B?bE95dFdqZnpmemZoazJKRDZuNEJvTUVGRzNyb3BOcGtMZnRMTHVtMUs5YnlS?=
 =?utf-8?B?TTg4QTdnemkvb25UUkZqQlRjQXppc2RDbEhZclVhWlAzWFdlYi94Nkx3M3NI?=
 =?utf-8?B?TnJidkVpQmk3U1BqTDRTZXJPSGZ5ak1oTFF1LzhRcFYzdTZLanlHMGdiSENo?=
 =?utf-8?B?bE1pMWNOcFlTdWc2S210UHpHVk1xYWRwVCtDNW44Nk9UdEd0aFJqN3dNSnpH?=
 =?utf-8?B?MkM1TGEzTnVvcEQ3clIvZlExa2dlYUVUY1hYUEUvUGcyTW00bFJIdjNMdlZx?=
 =?utf-8?B?b2tmOGkyNnQ4ODkrNDNITlNUWHRoUFFLQnJhdE9Ic1ZKL3pYM08rQ1BGWUNW?=
 =?utf-8?B?OG9qQmw1TWVENWhySnV0dVNBSmpORXNGYzl4TmFoazBndFpiNVBTRmRUdmFE?=
 =?utf-8?B?azhNWk43Ump2QVNsYjl5SW1UN3plM1hQQnk1SVB0eU1IZXhFVUppdzhqNVYr?=
 =?utf-8?B?VHN0Tm84SXFqcVo5MVhNcWhHU2Z6NWJiRHo2aUJOempzYXhjVjBRMjNyTml5?=
 =?utf-8?B?U1FLRis0MEJOTFJWNGYwSXdRQml5blFSQWtuZ0JJdWRWOGhXMlRBL3p1Y3Iv?=
 =?utf-8?B?TGJjTWtwR280bHdJWkxqRkdHaHlubGNobG1xdUFGUmlWMndkTUN1dEtVT1NW?=
 =?utf-8?B?YnJpd1NkVU9OdmpGcWdrSlJvVWNyMDNjUkx6bEhTMzlGRmxNVU5uSVRuZmh1?=
 =?utf-8?B?Z1MzbXJ3UVJPamQrdG5DUDdGd2x0S29zb3F1WXJuTmczN1lGTmpVNkNXVkFC?=
 =?utf-8?B?dmxmMTNRY3dnMFpZdnVVSmdCOEg1MDBZd0w0Ty9MR2xvZzFSKzA0UlpJRHpK?=
 =?utf-8?B?SE5FbUQvZEJEdHl5ZGU1V0VtZDlvOW9rbmc1RnBkZzEvb1RQZFVOdWtEd3dB?=
 =?utf-8?B?MHdwRmh3MGtINzlxNTRyYXBxaDQwc0JwM2Q3d1k3NkY3TU9HTmlMUDlqUnRJ?=
 =?utf-8?B?WmJjRFFYNVV0cVNUSTd0dUw5Yjd3eVpRdTJ3bVppWW5Cc280QjJhelZlL0V6?=
 =?utf-8?B?Qk1lczRtZUtTcm5mcjFVbkJvczNaa0xSeFE1alkzREdDeDRScDNaMXNwdXhD?=
 =?utf-8?B?QjZqZ0wwZDBhQXN6REZFUjJqdm1FUERKZm05aG9qb2d1OFRkNmlQZ2c3clZz?=
 =?utf-8?Q?xi6uLZovAxCzx7SAXq3Pk5nQ3vT6gP5d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVZUMyt5Wm9qdlJFSHUvL24vdTd0aC9RbUxQbXdZbkw5OXYyY2VKMU5vbmJD?=
 =?utf-8?B?MEdrV3RrL3JZYmRHTnZob0RxN2JURkpzaFVNMTg3ODJkM3hkNFc3Qlk0RFJJ?=
 =?utf-8?B?MnFGWWlVK012YWQrU3MzZlNtODI3VHhycXdJaHFmWitwdlJUM2ovV3BlTUFW?=
 =?utf-8?B?eDMvN2xRUThZRTZvQ2dTeC9haHVibDlmTFN1VkY1TmdJVzl4cFNmSFFjb2JY?=
 =?utf-8?B?UzFUVHhSNUNrZUgxdzkxSTJMdGFNMFFmOFFmU0tHUFpEaUhXS2JyVTk3djcy?=
 =?utf-8?B?eUsvSk91cUg4cHcvUGY5VDJGTFBNUGpJWWNLRXZTSjZHYW9CNUFjZzNjWkND?=
 =?utf-8?B?eUN2T1FnYjBRMExGeUwzRk82SFk0TDlyRWZnaEZQelBZeUtzd2s2YzZMTnF2?=
 =?utf-8?B?QUZSc2tWQmhpK2JqZ05WY2ljRXN0YzRIdlQzUmlocnEza0UxbmVLZm9Rakhy?=
 =?utf-8?B?TjRpYnR2RWtoSEREUkoyUnhIaGRWSHo5cHZPWVZXZStNdHNEeWVtNmNwblF0?=
 =?utf-8?B?emR6QnlvZFlVODUzNVNBVXpza3lkYjE2bGlPN3JZZFRMOE1Jd3NLdlZNbFZY?=
 =?utf-8?B?ekQrWFFxY0ZyWWYyTmp1TFlmRnh3eS83Wmd2SlVqaUZIbjVYbHUvSEhML0dU?=
 =?utf-8?B?cmxmazhDclhSNFhmM2JqMXZmbUlkY2lTaGJTNVZKaDJCNUlQV2JEOTRGQkF1?=
 =?utf-8?B?bkUxdFV1c1RYMEhscW9nL05XcnlXa1lCY0htaCtSUnByVUh6dGhsS2xYYXVo?=
 =?utf-8?B?Nit3UTdKb3p0NFVHMmVzeEZZUEp2bXI3RkxDa0xTdm1iMDBxOFJZdHY1MlUz?=
 =?utf-8?B?NytsSEhYM3VUaTNIcmFkbi8wbXRnN2lvaFB6NEdhVHZpSWxEM1A2dWxyQ0hu?=
 =?utf-8?B?M1lXRzVqeFFUZWZPb2pTS2cxWEk0TnFhVXhmZ2MrTWV0M2k2cFpqYU1XR01j?=
 =?utf-8?B?WU9kVTBYWUtDYU4rUUtrWTcwUWloNGJhQ1MzREViYzZ4ODBMZXltOFJQWnk4?=
 =?utf-8?B?VmtHZW5xSDU4b1djYjdmbER1LzNpSFcrOXRWa0QvODlvYTArMUJSd0dtZkZp?=
 =?utf-8?B?SlBSaWdRSFNqQWdTZUNTdWhjQ3AyZDZOaXVtMmhSZlRLNFNVOFd4UmFUbE9C?=
 =?utf-8?B?Y1pJQ1EwK1hNQk9MSjIxUUxuc2FBbko5b1R1RmRkVkw1TlBwVk5JYmVWWUhu?=
 =?utf-8?B?cTBuMEVVK2ZVN2QyVkxkRzRCZ1NDZlRCbnluZlgzTDZVbjJhY3R2WEVIZjR0?=
 =?utf-8?B?c3Ava0lwSlprNGI1OThmaDduWk1tcHg5RmhEcTNSRGp6YVpSZVI5Y3lNbTVU?=
 =?utf-8?B?Q1p6ajI5QzJUajkrRjh3NFlncmh1RTV5aDFjOEV2WDBMNFdMb0RjTXBTL3ZS?=
 =?utf-8?B?YnZvWlNpZWhCTXFCWkdGM0JPUWg2UnBaR2JvUjg0WDJyaHU0R29pZ2R6L3dD?=
 =?utf-8?B?aEFFaG5XNVhRWjJFdTZMemoyM2lyVkw4WExhMzJXTnRBMXNuRXh3WTB5cXk0?=
 =?utf-8?B?TWVkM28vS2dsbC9OSFpWeWFBZkVrL2NSYndlRUhUbjBaVUs1NENzb2daMzBU?=
 =?utf-8?B?MGN5Qmxlc2wxT3ZyUUtuQjNtb0JpQ01TbmVLYnBKQjR4K3NGbmJDdllTYndZ?=
 =?utf-8?B?R0MxOHBFTVUzZlJ0REdLcUpGNEEvUjBZZnJ5MVBMMlVVcG1BQThML28xWmFj?=
 =?utf-8?B?MVF0OFF4d3ZKcFZqK1ZzU3FwaVAxZDY2SUM0c1ZKbVZCU01sMzUvSituRlI4?=
 =?utf-8?B?MlQ0SFcvRlBubDBDSDlJc2t5dlFxdldtSUR3S1FlTndNNW1EOWl2WkRBVmg0?=
 =?utf-8?B?bW1ZcHNnSnNMNVE3S1d4TFJWV3RyN1kweXZCd0R0NWtPaDFrQktCWHk5T2t0?=
 =?utf-8?B?SnErcnl1ZVpIZDJFOGg0VS9CR3dKeWIxVS9zemR6cmVxVjN5cUg1TTNoZmgx?=
 =?utf-8?B?dnlRdUdPdlhnSkNDMWhaenFhcmNFWGEyQkxpc095Uk04eXVXanVJSThDQ200?=
 =?utf-8?B?TUVMVlQwcE82RDJWUUJXMCtXRmFwcHh0UjZBcmpqNDlXZ25hUDhEWGFDSG1M?=
 =?utf-8?B?djAybW9aU1c1cmJ2WWxsTmt0ZVNBUWhrejVYQXk2aEZOS2VQMDB1dHMyd1Zr?=
 =?utf-8?B?OFdDa1hzTlhKdnFOYVhYczE3RWUzZ1BkbHhSd1hBcklTSXdRT2lDNEdOQjdm?=
 =?utf-8?B?Znc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df4c446e-508d-419b-213e-08de25f0d97d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 15:49:10.6311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G668eQPDBxA8yIkKMYPMFjb8pUsvgHCJ4w9DJzUOkK+Cjn8dRhlcdHeynaxW6fYnFZzycY4/9aMu4LvIGsUT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
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


On 11/17/2025 6:30 PM, Hellstrom, Thomas wrote:
> On Thu, 2025-11-13 at 16:33 +0000, nishit.sharma@intel.com wrote:
>> From: Nishit Sharma <nishit.sharma@intel.com>
>>
>> This test allocates a buffer in SVM, writes data to it from src GPU ,
>> and reads/verifies
>> the data from dst GPU. Optionally, the CPU also reads or modifies the
>> buffer and both
>> GPUs verify the results, ensuring correct cross-GPU and CPU memory
>> access in a
>> multi-GPU environment.
>>
>> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
>> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> ---
>>   tests/intel/xe_multi_gpusvm.c | 373
>> ++++++++++++++++++++++++++++++++++
>>   tests/meson.build             |   1 +
>>   2 files changed, 374 insertions(+)
>>   create mode 100644 tests/intel/xe_multi_gpusvm.c
>>
>> diff --git a/tests/intel/xe_multi_gpusvm.c
>> b/tests/intel/xe_multi_gpusvm.c
>> new file mode 100644
>> index 000000000..6614ea3d1
>> --- /dev/null
>> +++ b/tests/intel/xe_multi_gpusvm.c
>> @@ -0,0 +1,373 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#include <unistd.h>
>> +
>> +#include "drmtest.h"
>> +#include "igt.h"
>> +#include "igt_multigpu.h"
>> +
>> +#include "intel_blt.h"
>> +#include "intel_mocs.h"
>> +#include "intel_reg.h"
>> +
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +#include "xe/xe_util.h"
>> +
>> +/**
>> + * TEST: Basic multi-gpu SVM testing
>> + * Category: SVM
>> + * Mega feature: Compute
>> + * Sub-category: Compute tests
>> + * Functionality: SVM p2p access, madvise and prefetch.
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: cross-gpu-mem-access
>> + * Description:
>> + *      This test creates two malloced regions, places the
>> destination
>> + *      region both remotely and locally and copies to it. Reads
>> back to
>> + *      system memory and checks the result.
>> + *
>> + */
>> +
>> +#define MAX_XE_REGIONS	8
>> +#define MAX_XE_GPUS 8
>> +#define NUM_LOOPS 1
>> +#define BATCH_SIZE(_fd) ALIGN(SZ_8K, xe_get_default_alignment(_fd))
>> +#define BIND_SYNC_VAL 0x686868
>> +#define EXEC_SYNC_VAL 0x676767
>> +#define COPY_SIZE SZ_64M
>> +
>> +struct xe_svm_gpu_info {
>> +	bool supports_faults;
>> +	int vram_regions[MAX_XE_REGIONS];
>> +	unsigned int num_regions;
>> +	unsigned int va_bits;
>> +	int fd;
>> +};
>> +
>> +struct multigpu_ops_args {
>> +	bool prefetch_req;
>> +	bool op_mod;
>> +};
>> +
>> +typedef void (*gpu_pair_fn) (
>> +		struct xe_svm_gpu_info *src,
>> +		struct xe_svm_gpu_info *dst,
>> +		struct drm_xe_engine_class_instance *eci,
>> +		void *extra_args
>> +);
>> +
>> +static void for_each_gpu_pair(int num_gpus,
>> +			      struct xe_svm_gpu_info *gpus,
>> +			      struct drm_xe_engine_class_instance
>> *eci,
>> +			      gpu_pair_fn fn,
>> +			      void *extra_args);
>> +
>> +static void gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>> +				   struct xe_svm_gpu_info *dst,
>> +				   struct
>> drm_xe_engine_class_instance *eci,
>> +				   void *extra_args);
>> +
>> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
>> +
>> +static void
>> +create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct
>> drm_xe_engine_class_instance *eci,
>> +		    uint32_t *vm, uint32_t *exec_queue)
>> +{
>> +	*vm = xe_vm_create(gpu->fd,
>> +			   DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +	*exec_queue = xe_exec_queue_create(gpu->fd, *vm, eci, 0);
>> +	xe_vm_bind_lr_sync(gpu->fd, *vm, 0, 0, 0, 1ull << gpu-
>>> va_bits,
>> +			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
>> +}
>> +
>> +static void
>> +setup_sync(struct drm_xe_sync *sync, volatile uint64_t **sync_addr,
>> uint64_t timeline_value)
>> +{
>> +	*sync_addr = malloc(sizeof(**sync_addr));
>> +	igt_assert(*sync_addr);
>> +	sync->flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> +	sync->type = DRM_XE_SYNC_TYPE_USER_FENCE;
>> +	sync->addr = to_user_pointer((uint64_t *)*sync_addr);
>> +	sync->timeline_value = timeline_value;
>> +	**sync_addr = 0;
>> +}
>> +
>> +static void
>> +cleanup_vm_and_queue(struct xe_svm_gpu_info *gpu, uint32_t vm,
>> uint32_t exec_queue)
>> +{
>> +	xe_vm_unbind_lr_sync(gpu->fd, vm, 0, 0, 1ull << gpu-
>>> va_bits);
>> +	xe_exec_queue_destroy(gpu->fd, exec_queue);
>> +	xe_vm_destroy(gpu->fd, vm);
>> +}
>> +
>> +static void xe_multigpu_madvise(int src_fd, uint32_t vm, uint64_t
>> addr, uint64_t size,
>> +				uint64_t ext, uint32_t type, int
>> dst_fd, uint16_t policy,
>> +				uint16_t instance, uint32_t
>> exec_queue, int local_fd,
>> +				uint16_t local_vram)
>> +{
>> +	int ret;
>> +
>> +#define SYSTEM_MEMORY	0
> Please use DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM.
> A new define isn't necessary and it's also incorrect.
Sure, will use that at required places.
>
>> +	if (src_fd != dst_fd) {
>> +		ret = xe_vm_madvise(src_fd, vm, addr, size, ext,
>> type, dst_fd, policy, instance);
>> +		if (ret == -ENOLINK) {
>> +			igt_info("No fast interconnect between GPU0
>> and GPU1, falling back to local VRAM\n");
>> +			ret = xe_vm_madvise(src_fd, vm, addr, size,
>> ext, type, local_fd,
>> +					    policy, local_vram);
> Please use DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE
>
>
>> +			if (ret) {
>> +				igt_info("Local VRAM madvise failed,
>> falling back to system memory\n");
>> +				ret = xe_vm_madvise(src_fd, vm,
>> addr, size, ext, type,
>> +						    SYSTEM_MEMORY,
>> policy, SYSTEM_MEMORY);
>> +				igt_assert_eq(ret, 0);
>> +			}
>> +		} else {
>> +			igt_assert_eq(ret, 0);
>> +		}
>> +	} else {
>> +		ret = xe_vm_madvise(src_fd, vm, addr, size, ext,
>> type, dst_fd, policy, instance);
>> +		igt_assert_eq(ret, 0);
>> +
>> +	}
>> +
>> +}
>> +
>> +static void xe_multigpu_prefetch(int src_fd, uint32_t vm, uint64_t
>> addr, uint64_t size,
>> +				 struct drm_xe_sync *sync, volatile
>> uint64_t *sync_addr,
>> +				 uint32_t exec_queue, bool
>> prefetch_req)
>> +{
>> +	if (prefetch_req) {
>> +		xe_vm_prefetch_async(src_fd, vm, 0, 0, addr, size,
>> sync, 1,
>> +				
>> DRM_XE_CONSULT_MEM_ADVISE_PREF_LOC);
>> +		if (*sync_addr != sync->timeline_value)
>> +			xe_wait_ufence(src_fd, (uint64_t
>> *)sync_addr, sync->timeline_value,
>> +				       exec_queue, NSEC_PER_SEC *
>> 10);
>> +	}
>> +	free((void *)sync_addr);
>> +}
>> +
>> +static void for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info
>> *gpus,
>> +			      struct drm_xe_engine_class_instance
>> *eci,
>> +			      gpu_pair_fn fn, void *extra_args)
>> +{
>> +	for (int src = 0; src < num_gpus; src++) {
>> +		if(!gpus[src].supports_faults)
>> +			continue;
>> +
>> +		for (int dst = 0; dst < num_gpus; dst++) {
>> +			if (src == dst)
>> +				continue;
>> +			fn(&gpus[src], &gpus[dst], eci, extra_args);
>> +		}
>> +	}
>> +}
>> +
>> +static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>> +		       uint64_t dst_addr, uint64_t copy_size,
>> +		       uint32_t *bo, uint64_t *addr)
>> +{
>> +	uint32_t width = copy_size / 256;
>> +	uint32_t height = 1;
>> +	uint32_t batch_bo_size = BATCH_SIZE(fd);
>> +	uint32_t batch_bo;
>> +	uint64_t batch_addr;
>> +	void *batch;
>> +	uint32_t *cmd;
>> +	uint32_t mocs_index = intel_get_uc_mocs_index(fd);
>> +	int i = 0;
>> +
>> +	batch_bo = xe_bo_create(fd, vm, batch_bo_size,
>> vram_if_possible(fd, 0), 0);
>> +	batch = xe_bo_map(fd, batch_bo, batch_bo_size);
>> +	cmd = (uint32_t *) batch;
>> +	cmd[i++] = MEM_COPY_CMD | (1 << 19);
>> +	cmd[i++] = width - 1;
>> +	cmd[i++] = height - 1;
>> +	cmd[i++] = width - 1;
>> +	cmd[i++] = width - 1;
>> +	cmd[i++] = src_addr & ((1UL << 32) - 1);
>> +	cmd[i++] = src_addr >> 32;
>> +	cmd[i++] = dst_addr & ((1UL << 32) - 1);
>> +	cmd[i++] = dst_addr >> 32;
>> +	cmd[i++] = mocs_index << XE2_MEM_COPY_MOCS_SHIFT |
>> mocs_index;
>> +	cmd[i++] = MI_BATCH_BUFFER_END;
>> +	cmd[i++] = MI_BATCH_BUFFER_END;
>> +
>> +	batch_addr = to_user_pointer(batch);
>> +	/* Punch a gap in the SVM map where we map the batch_bo */
>> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
>> batch_bo_size, 0);
>> +	*bo = batch_bo;
>> +	*addr = batch_addr;
>> +}
>> +
>> +static void batch_fini(int fd, uint32_t vm, uint32_t bo, uint64_t
>> addr)
>> +{
>> +        /* Unmap the batch bo by re-instating the SVM binding. */
>> +        xe_vm_bind_lr_sync(fd, vm, 0, 0, addr, BATCH_SIZE(fd),
>> +                           DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
>> +        gem_close(fd, bo);
>> +}
>> +
>> +
>> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info)
>> +{
>> +	unsigned int count = 0;
>> +	uint64_t regions = all_memory_regions(fd);
>> +	uint32_t region;
>> +
>> +	xe_for_each_mem_region(fd, regions, region) {
>> +		if (XE_IS_VRAM_MEMORY_REGION(fd, region)) {
>> +			struct drm_xe_mem_region *mem_region =
>> +				xe_mem_region(fd, 1ull << (region -
>> 1));
>> +			igt_assert(count < MAX_XE_REGIONS);
>> +			info->vram_regions[count++] = mem_region-
>>> instance;
>> +		}
>> +	}
>> +
>> +	info->num_regions = count;
>> +}
>> +
>> +static int get_device_info(struct xe_svm_gpu_info gpus[], int
>> num_gpus)
>> +{
>> +	int cnt;
>> +	int xe;
>> +	int i;
>> +
>> +	for (i = 0, cnt = 0 && i < 128; cnt < num_gpus; i++) {
>> +		xe = __drm_open_driver_another(i, DRIVER_XE);
>> +		if (xe < 0)
>> +			break;
>> +
>> +		gpus[cnt].fd = xe;
>> +		cnt++;
>> +	}
>> +
>> +	return cnt;
>> +}
>> +
>> +static void
>> +copy_src_dst(struct xe_svm_gpu_info *gpu0,
>> +	     struct xe_svm_gpu_info *gpu1,
>> +	     struct drm_xe_engine_class_instance *eci,
>> +	     bool prefetch_req)
>> +{
>> +	uint32_t vm[1];
>> +	uint32_t exec_queue[2];
>> +	uint32_t batch_bo;
>> +	void *copy_src, *copy_dst;
>> +	uint64_t batch_addr;
>> +	struct drm_xe_sync sync = {};
>> +	volatile uint64_t *sync_addr;
>> +	int local_fd = gpu0->fd;
>> +	uint16_t local_vram = gpu0->vram_regions[0];
>> +
>> +	create_vm_and_queue(gpu0, eci, &vm[0], &exec_queue[0]);
>> +
>> +	/* Allocate source and destination buffers */
>> +	copy_src = aligned_alloc(xe_get_default_alignment(gpu0->fd),
>> SZ_64M);
>> +	igt_assert(copy_src);
>> +	copy_dst = aligned_alloc(xe_get_default_alignment(gpu1->fd),
>> SZ_64M);
>> +	igt_assert(copy_dst);
>> +
>> +	/*
>> +	 * Initialize, map and bind the batch bo. Note that Xe
>> doesn't seem to enjoy
>> +	 * batch buffer memory accessed over PCIe p2p.
>> +	 */
>> +	batch_init(gpu0->fd, vm[0], to_user_pointer(copy_src),
>> to_user_pointer(copy_dst),
>> +		   COPY_SIZE, &batch_bo, &batch_addr);
>> +
>> +	/* Fill the source with a pattern, clear the destination. */
>> +	memset(copy_src, 0x67, COPY_SIZE);
>> +	memset(copy_dst, 0x0, COPY_SIZE);
>> +
>> +	xe_multigpu_madvise(gpu0->fd, vm[0],
>> to_user_pointer(copy_dst), COPY_SIZE,
>> +			     0, DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>> +			     gpu1->fd, 0, gpu1->vram_regions[0],
>> exec_queue[0],
>> +			     local_fd, local_vram);
>> +
>> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
>> +	xe_multigpu_prefetch(gpu0->fd, vm[0],
>> to_user_pointer(copy_dst), COPY_SIZE, &sync,
>> +			     sync_addr, exec_queue[0],
>> prefetch_req);
>> +
>> +	sync_addr = (void *)((char *)batch_addr + SZ_4K);
>> +	sync.addr = to_user_pointer((uint64_t *)sync_addr);
>> +	sync.timeline_value = EXEC_SYNC_VAL;
>> +	*sync_addr = 0;
>> +
>> +	/* Execute a GPU copy. */
>> +	xe_exec_sync(gpu0->fd, exec_queue[0], batch_addr, &sync, 1);
>> +	if (*sync_addr != EXEC_SYNC_VAL)
>> +		xe_wait_ufence(gpu0->fd, (uint64_t *)sync_addr,
>> EXEC_SYNC_VAL, exec_queue[0],
>> +			       NSEC_PER_SEC * 10);
>> +
>> +	igt_assert(memcmp(copy_src, copy_dst, COPY_SIZE) == 0);
>> +
>> +	free(copy_dst);
>> +	free(copy_src);
>> +	munmap((void *)batch_addr, BATCH_SIZE(gpu0->fd));
>> +	batch_fini(gpu0->fd, vm[0], batch_bo, batch_addr);
>> +	cleanup_vm_and_queue(gpu0, vm[0], exec_queue[0]);
>> +}
>> +
>> +static void
>> +gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>> +		       struct xe_svm_gpu_info *dst,
>> +		       struct drm_xe_engine_class_instance *eci,
>> +		       void *extra_args)
>> +{
>> +	struct multigpu_ops_args *args = (struct multigpu_ops_args
>> *)extra_args;
>> +	igt_assert(src);
>> +	igt_assert(dst);
>> +
>> +	copy_src_dst(src, dst, eci, args->prefetch_req);
>> +}
>> +
>> +igt_main
>> +{
>> +	struct xe_svm_gpu_info gpus[MAX_XE_GPUS];
>> +	struct xe_device *xe;
>> +	int gpu, gpu_cnt;
>> +
>> +	struct drm_xe_engine_class_instance eci = {
>> +                .engine_class = DRM_XE_ENGINE_CLASS_COPY,
>> +        };
>> +
>> +	igt_fixture {
>> +		gpu_cnt = get_device_info(gpus, ARRAY_SIZE(gpus));
>> +		igt_skip_on(gpu_cnt < 2);
>> +
>> +		for (gpu = 0; gpu < gpu_cnt; ++gpu) {
>> +			igt_assert(gpu < MAX_XE_GPUS);
>> +
>> +			open_pagemaps(gpus[gpu].fd, &gpus[gpu]);
>> +			/* NOTE! inverted return value. */
>> +			gpus[gpu].supports_faults =
>> !xe_supports_faults(gpus[gpu].fd);
>> +			fprintf(stderr, "GPU %u has %u VRAM
>> regions%s, and %s SVM VMs.\n",
>> +				gpu, gpus[gpu].num_regions,
>> +				gpus[gpu].num_regions != 1 ? "s" :
>> "",
>> +				gpus[gpu].supports_faults ?
>> "supports" : "doesn't support");
>> +
>> +			xe = xe_device_get(gpus[gpu].fd);
>> +			gpus[gpu].va_bits = xe->va_bits;
>> +		}
>> +	}
>> +
>> +	igt_describe("gpu-gpu write-read");
>> +	igt_subtest("cross-gpu-mem-access") {
>> +		struct multigpu_ops_args op_args;
>> +		op_args.prefetch_req = 1;
>> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_mem_access_wrapper, &op_args);
>> +		op_args.prefetch_req = 0;
>> +		for_each_gpu_pair(gpu_cnt, gpus, &eci,
>> gpu_mem_access_wrapper, &op_args);
> Wouldn't a separate test make sense here, like many other tests defines
> a base test with variants that are indicated in an unsigned long flags?
>
> So we have cross-gpu-mem-access-%s where %s can take "basic" and
> "prefetch"?
Those already defined tests are part of struct section {}. Let me work 
on this and update.
>
>
>> +	}
>> +
>> +	igt_fixture {
>> +		int cnt;
>> +
>> +		for (cnt = 0; cnt < gpu_cnt; cnt++)
>> +			drm_close_driver(gpus[cnt].fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 9736f2338..1209f84a4 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -313,6 +313,7 @@ intel_xe_progs = [
>>   	'xe_media_fill',
>>   	'xe_mmap',
>>   	'xe_module_load',
>> +        'xe_multi_gpusvm',
>>   	'xe_noexec_ping_pong',
>>   	'xe_oa',
>>   	'xe_pat',
