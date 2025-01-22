Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1503CC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 13:12:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EBC10E0EE;
	Wed, 22 Jan 2025 13:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dTJ5YJJe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0CBB10E0EE
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 13:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737551572; x=1769087572;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=5bQ0CZ5Pbg5mtEcB7suCOyKzTtq+nDwlaAlyCSLUc1E=;
 b=dTJ5YJJexQBnnNGirMWkeDujVaS/hcgkcErptgFXM1hzDLqWAfVYXKJv
 vn5ThhuHYfquO4b5f9tMWX0/ln9Y0TI0KMlZ0McAuihSR8imoDitsxTF2
 kJGSWzEMPivkFClBiW/yGQfsiBC/dyg02mtHx9ThxS73mPv2hBWNX7EH+
 F2FAn2oSA80hBMnRk2qQCwT2cwIGWoWqON49aqCrnK9P/RuAJs/eEabd0
 saZx8whJP9m0YJ8o0WSUlvGCNFgScIp3ouNE46onalDbSDW3KCuhs90cr
 0NKBMbWaZLFsmartDi/M7+hzRxVRoNFBrIU4bcMa4lbU4ZuIjyAouQnH+ w==;
X-CSE-ConnectionGUID: KVTE6oriSOC/FBPJjmdJAA==
X-CSE-MsgGUID: wNfSim9sRmeIjlqoMN8T+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37273773"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="37273773"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 05:12:41 -0800
X-CSE-ConnectionGUID: +vrmzb7SQgSCBZdZBPJFvA==
X-CSE-MsgGUID: Mq4qn5PMQseezbw3yONgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; d="scan'208";a="106972592"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 05:12:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 05:12:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 05:12:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 05:12:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yX19U9gQhN6Q/P3mWGDpcl8mY6CLcOnEqds7lvv4uz4CBp0sNJh5z3fa+7uyhGYNkLPpSA//VT9G4jw6i1ZWOz9p1C8scfL9B/SCFmnszuh+6t4C87FHIaBsYUmzSYn0aAplej/2rzOsWtEu22c/Mze9FEQmt4jlzbr6CP/rxWs8rQ2k1hR47Ktv1JnW/Up2YDXfkjNkI70Ks3GA2FYZzmo4Md84kkXWT2pO0dLHMKb47zcZzUv8mTeJta4PigOUdCDQXPeJqQr2tlVsSSdH1QNqsyXjg3j/S51U0SudxuUnYHM1PVeH9Ht9O8roNt7CVgaOCSJbb4Oiugp8sYaA2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5bQ0CZ5Pbg5mtEcB7suCOyKzTtq+nDwlaAlyCSLUc1E=;
 b=C064Kds/beShwy4MKB7I/I+CHJObBLkxEqBDluYO+ekNEpF/VdXmJYpkA1IdgF3yqITgBeVf4XA1hdNHQ8xaQWTB7tKNaYVpLlXXUox3avlfxEFgpHXddE4Fke7U5k2eXC1u3c9sHdo7Uu1o8zuya8H3+bF/AS/iRWahrBVEmHMMig1FWbiqzHPnCNuLF54JgnUoozmGswA3ejq9pIzOZJrIykRcii5/toPZm+EJTHBhF6D+i5QzZLvA3XmSK+Q16QEwoQ3bAd/wscJNmZ8U7VuqWX43ecnmLX4/InoXNfCQXoLRVw85Ppn0y21ybyGcGwKHlxQstrw9fRUu8UT+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Wed, 22 Jan
 2025 13:11:54 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 13:11:53 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
CC: "Justen, Jordan L" <jordan.l.justen@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_eudebug_online: Fix 32b
 compilation warnings/errors
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_eudebug_online: Fix 32b
 compilation warnings/errors
Thread-Index: AQHbaz0u+bIUG0tUTkGsujMkdYZh3LMhaY6AgAFeXwA=
Date: Wed, 22 Jan 2025 13:11:53 +0000
Message-ID: <cead974864be2365a18305ba913cb7b7b2b7b5ce.camel@intel.com>
References: <20250120131338.131713-1-dominik.grzegorzek@intel.com>
 <20250120131338.131713-2-dominik.grzegorzek@intel.com>
 <20250121161751.aqotrwo6pzgyzl73@kamilkon-desk.igk.intel.com>
In-Reply-To: <20250121161751.aqotrwo6pzgyzl73@kamilkon-desk.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|MW4PR11MB6713:EE_
x-ms-office365-filtering-correlation-id: a1b59927-8e5d-46b3-188e-08dd3ae65763
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WmQ0QW9tckRpV0taWkQxZURvTUFKb0lUZnlPNjQzZEdSbklsVHhCVGNKdWNT?=
 =?utf-8?B?L1ArMzgyTU5OaUZEOGVPU3JFdXA0Q2pHVHhnb281aGJKVERmMnZrTjNXWWVy?=
 =?utf-8?B?bWJpYmlzUFZVSmdEN25MMThqZkUrKy9HR28xVnRHNkVWeW9OUEFHUE1VbVlI?=
 =?utf-8?B?dUJJZkpZN0pqSXVQT1lqWkg5VU9ld2NwdUt5cExGTHJ0bGp2QUtxMHZwc0dx?=
 =?utf-8?B?aGprOVRvYng0OC9JemVjMUowM3E0UGwvYzhFdzkyalYrcWtSOWsyeUg1N3hq?=
 =?utf-8?B?MENKb1cyUHlRd3pLS0RZcWhqeGpObVNJMFo0cmx4RS9WaWJKU1Nwb3JVblFC?=
 =?utf-8?B?WEtsbGZzQW02SFJMVjhXa0VaSTVzVmpvVE9NbE1TQWFES3BmdXM1eGdSaGlV?=
 =?utf-8?B?c0R5NjcrMjlyRlUvTzBMSEEvTHVUN2h6amswUDdTb0IyZUVEc0NYK1JmZmxk?=
 =?utf-8?B?SnUxbVdFSWlBSG1ic3dSMGJQSjlMMm1SUElGSEFRUFB0Qm8zUmorbFhxVGZj?=
 =?utf-8?B?NTNvc3Z1MjhMaWwwQlRtc0JFS2k5TE9TTkFERWsvc0JWb0FvRVV5amp4d0FQ?=
 =?utf-8?B?WVRoa3pha0FVVFpOYVlqb1BWeE5aWndYMDBqYWxGWUIxU2FyM285aVBnOVBz?=
 =?utf-8?B?eU9naHlUL2l1YlQ3STg0TTlFOGRQM2ZQcWVrd1BLMm9rVTBrQm5oem9aTHlv?=
 =?utf-8?B?a1dVMVkvNnBWL3B1M3pHbFVQM3cwSTBGRFZVaEI4Y2JjWXltRnNDYWxiK21B?=
 =?utf-8?B?aGlMcEs0RmJBWVRGaVhaV2pCYUJMZ2llY1liSjJBZmFkd0RXWXpLeEtacytv?=
 =?utf-8?B?VUdYNTdaVWdjMkFRM2dOTmR3amhLZlpQLzdEYytEWHkzOTJpbi8rRDRzamVR?=
 =?utf-8?B?Y0ZWKy9TUEpiSXo5R1BJeHFIUE04eC9NaUZUajQ2YVZjakpKa1dnajR0ZEJO?=
 =?utf-8?B?VnZxUDFwSGxvNEt2TEY1NS8zdjdESlJodS9OV1JSWjFjMFlnWGx6SHhpRm1W?=
 =?utf-8?B?cFE5blI5UnUvUElJUitiQzB1SmxkVlFkVE9ZQlJ6ZjhCb25ZSUJIQmJFVVBy?=
 =?utf-8?B?RFVGdjdhckFNZHp0dEhvYzFZcXY2dTZLU2FrOXBiekF6NnNCU0xtSTBkcmQw?=
 =?utf-8?B?SkRhR0F1aDVHLzdIN3YwYkpPMStYZlZLWnZFdkp1WnloWEtITk9TWDhRMk5J?=
 =?utf-8?B?eXpFVCtOenpDQmRtVXVOYU50M3JXelhsRnJkVUtJazZMTFF4T3UvYnFjd1cz?=
 =?utf-8?B?WGVxRDdzV3d4L3JLeXpPbG5idHlTUkZyWFFjWTZIaVdOaVh6L1hlSzc3UjJl?=
 =?utf-8?B?RTAvajg2NVQ5aDJ6bWovNXRmRSthOUtObjJCeDJBdkFjMzJWbHI4Mmw5Ri9t?=
 =?utf-8?B?MHc1Zy9lK2dRVzVoTkhyQXNhaHlmVHRXb2VNWC8xOU55M2NxVEg2SDR3dzJm?=
 =?utf-8?B?NUtxeXI0eFdVTllnMkJOaEVpTzR2UUE1VDdWRGNVZG1LeUNmTlJ3c21TdFU2?=
 =?utf-8?B?SUVCWGU3dW5uMnJ0UUNQdzRFVzVrV0hEYndhV3BpZGZ2QmlsU1htVS9yRGV3?=
 =?utf-8?B?ZGJPb3QwT3hDblgvdmc4OUFIbXhCZ1lhQWl3WUQ1ajd4RmlxUE05OGtNUGF6?=
 =?utf-8?B?YlR3ek9Pby9MVk9HbUZNYmg5ZXpFazJQQW03S1htUTc5QXB4bXN6OURtVjJH?=
 =?utf-8?B?cStHRndKNUVrV3ltdjJsSTRqSVNFN0p3OHhvVks2TEpEbGZPUWlURWtGbVdm?=
 =?utf-8?B?NDl1VmMvOHoram1mNEtXV2lIckRWUjEwSmJrd3gvNkNVbGN4UWNhRlE0NnFo?=
 =?utf-8?B?YWlKazdSY0tTbUdvQzFoNVN3bjJza0R4eXplOHdYa2EyR1R3R2tkOVJ2U0da?=
 =?utf-8?B?RlA1NzJWS05LelFXMHFIYmRRUGFVNDRxWHVxTFBKYlh4V3hJZEMwQjVXSDJ0?=
 =?utf-8?Q?YcFlgq40AyZE8vs55Xnyukp4rrAGL2xf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enlseFE5K3dqcTIwVDh5eUE5SnVDVksrODFCNDQ4WUNxMFBrV0ZHSnJGWUtF?=
 =?utf-8?B?bytYWXlzUGZ6Uk5PTENYKys2K0lST2VqNHVNaFZSVjVLS3lUZUt6M3lPTi9q?=
 =?utf-8?B?SVVjTnFjNFpON3p3Rlc4dU5LdWxXajF1ZENtNDlhb0o0a0NBQTYzVkdRV0pJ?=
 =?utf-8?B?THlMUkp4dlNtRjBtdk1ibzJhdFFXQkduRGMzQ0IrZEZTNWlEREZ4ZGdHQ3pM?=
 =?utf-8?B?aEJDUHNTN1dJV2NSaXBUVUpMcU03dGplaWtMOW1jeTNRUU9mQkZudDBic1o5?=
 =?utf-8?B?N2c1YnJGdzJCUWg5U3BlaDl1MEtVa2dDTzhYV0ZwZTFic256YklGVm9COWhp?=
 =?utf-8?B?L2E2aTRxQUZxMEVZSnl3WjlkNXlWKytPMjVTYlM5bGVSQUFrc0wwVms0ZWhz?=
 =?utf-8?B?U3dWZGJXeklLK1NXdTRTZ1JkZXN4OVk2VzBEQzVoWTRNM2xYbHRHbisvdXo4?=
 =?utf-8?B?emU4OGhsd1FqYnpYZEZ5TEFZYmhSL0JaSmUvcllDazZ4MHB0MTN2Sis1cWxI?=
 =?utf-8?B?WXprRGRSamRrV24wL0U3UU9qRm1ORDJJYzJKTmxxOTFCRndhWEZybDUyTmVp?=
 =?utf-8?B?MjR0YjRhNnVvQXYrVmFsYmRqVkxDRWUySTFlQUVGclRldXp0VXo3WGlsc2ZV?=
 =?utf-8?B?V3pjenZKSmwzNmJuVjZwTlhjTzJqOFlaRzRLQmRFTityS3o2WngrZ000SnYr?=
 =?utf-8?B?WjdseTRDTDU0V1lSYlE0WTFCTXBXWDJIZ0F2b21RNXNoMFVYYkUxS2J4L0RI?=
 =?utf-8?B?c2NWMlBINitYLzJRME00OVMwcEh2MTRUQkFZNGU3cnNLYUcxSTlSQnhYWUlP?=
 =?utf-8?B?Q1kwTGNDcjdQUllHYlptbWpuODdKQVd4Z3hnNndDZDg0OXppd2pFM2RNTkJq?=
 =?utf-8?B?dE0zYUIzRmROTHNqRFlVbUhpZFdHWTdBOGxJWlJvcm9HNGp4RkErby9EVnBO?=
 =?utf-8?B?dVpuV0NMR0c5YnRiMzJaaEM3UFVNVGtSbU9XVlNjUGNxSnRtUC8zNXd6MXZy?=
 =?utf-8?B?NUNyWExMeFEzZlpLbDI5TjFFMS9MSWpmcUdyU3hrdVk1am1qUjFENW9MUXJF?=
 =?utf-8?B?MXpNZ1ZncE1CUlJrbmtmTWNFVkN6ZnA2bFo1RkVnOGtUZDBMZU92U1NIYThr?=
 =?utf-8?B?cnJtOHZ6VFZrelR3dW90eWV3c0szUCtqbFF4RWVZcW5waEovbUNMMkFsdGJJ?=
 =?utf-8?B?dzFGWlc2N0hLRkZqWHo1ajA5TS9QY0hwNE1yY1lmVWVGditsZm1Hck5WdFF5?=
 =?utf-8?B?SWxHNU5NbjE4dEczVkdFcm1KZlRJMk40OVBveXZrR2VSZ3VqVDc5ZWtESjNG?=
 =?utf-8?B?eXduMk5mMXhaaU9xeTk5NHAvbGQwNzRTWkUzclQweWpRMWJ1VE9yVi9XdFpj?=
 =?utf-8?B?amp4eGwzcFE2RkYwSWtLS00vTkliTmN5a2Rla2k2TGJ0Tzl2UGZaVXdMaTBK?=
 =?utf-8?B?aXFaeHk4RjVDL2VrUmRDdk91M3lLcnFnRUtpK0l6bGF3S0U1Z3BNdllFZEVz?=
 =?utf-8?B?UWF2OWZxbWxnZXNrSFJZbkpOQUNsbGJodFVxOERmSjNSTnRNSXVZTGlMRkcx?=
 =?utf-8?B?UFppRTRCNDh3TWdvZW9vMG5WM2JSVVk5Wm5rZWl1Y21MMnJjcTBSelA4K0kw?=
 =?utf-8?B?b29GMmhUQ3lhNzBjeUM2b3JraEdyU0VCZDlqT3FvOWlXcStuMGozemRGOGxI?=
 =?utf-8?B?bWtOU0xKNnNFYVlUM2U5UDY5UlRsd0ZkZHQ4RUMrZ0FWWUFnWWZtd2doN2Fi?=
 =?utf-8?B?UnJ1US9tOVRhUHl3ZnFjUkMwc2o1N1NnYk1hWTNFcnBWbjdldWE1Q3VYUzZW?=
 =?utf-8?B?SkJISWJ1andqK0lCazZqT0NFRCtieVUzb2ZMUkplL1lIR01UTDlaQ25LRzFC?=
 =?utf-8?B?eitiZzRCQjVkTUM4clRZWFEwRDN1MDVUVFRXQ1E2U3luRi9Jdk5GRVJpTjgr?=
 =?utf-8?B?TnEvclFHNDkxNFZVenRuTWFjOHF5cnJZSmUrT0hDNnlJRnBvVTJZaUl6NlRJ?=
 =?utf-8?B?R05QQnFaSEVCUVlqTjBJaDNudy9NcDRvR3VNaUduWnVoMDZXdmhobm1HQ05K?=
 =?utf-8?B?QTNrdEpTbUhUYzNuYzIxcm16L01UcXJyVTRLQzIvSkRjMElvRWN5NzRoYTUw?=
 =?utf-8?B?SGhPb2s3Qm4xQXpwSVdpdGwvSWRUTnIwejdnS2NvYXNUWk15ckVzV3F6R1pU?=
 =?utf-8?Q?pouc6M4Ia6dGhkZQ7B6qhZs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E7A7A45389DA64C8C842E1C161DB024@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b59927-8e5d-46b3-188e-08dd3ae65763
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 13:11:53.8894 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ydG84Ooy7il4xG8qM6BSdRxZtHY97u7jxmsrg4mhkv6WUo3BzOQsST/XjEPB8h+h1n6SAztElyMyzKdWURA4PnPtlXFRKwByv2ADcWfjxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6713
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

T24gVHVlLCAyMDI1LTAxLTIxIGF0IDE3OjE3ICswMTAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIERvbWluaWssDQo+IE9uIDIwMjUtMDEtMjAgYXQgMTQ6MTM6MzggKzAxMDAsIERvbWlu
aWsgR3J6ZWdvcnplayB3cm90ZToNCj4gPiBGaXggbWV0YWRhdGEgYWxsb2NhdGlvbiBzbyBpdCBp
cyBwcm9wZXJseSBzaXplZCBvbiAzMmIgYW5kDQo+ID4gY29ycmVjdCBhbGwgZGVidWcgcHJpbnRz
IHdoaWNoIHdlcmUgY2F1c2luZyBjb21waWxhdGlvbiB3YXJuaW5ncy4NCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5j
b20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMgfCAxMCAr
KysrKy0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRp
b25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25s
aW5lLmMgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+ID4gaW5kZXggZjUzMjM4
N2FmLi40MWEwMWMwMmYgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19v
bmxpbmUuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWdfb25saW5lLmMNCj4gPiBA
QCAtNTY5LDcgKzU2OSw3IEBAIHN0YXRpYyB2b2lkIGdldF9haXBzX29mZnNldF90YWJsZShzdHJ1
Y3Qgb25saW5lX2RlYnVnX2RhdGEgKmRhdGEsIGludCB0aHJlYWRzKQ0KPiA+ICANCj4gPiAgCWln
dF9kZWJ1ZygiQUlQcyBvZmZzZXQgdGFibGU6XG4iKTsNCj4gPiAgCWZvciAoaW50IGkgPSAwOyBp
IDwgdGhyZWFkczsgaSsrKQ0KPiA+IC0JCWlndF9kZWJ1ZygiJWx4XG4iLCBkYXRhLT5haXBzX29m
ZnNldF90YWJsZVtpXSk7DQo+ID4gKwkJaWd0X2RlYnVnKCIlIiBQUkl4NjQgIlxuIiwgZGF0YS0+
YWlwc19vZmZzZXRfdGFibGVbaV0pOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICBzdGF0aWMgaW50IGdl
dF9zdGVwcGVkX3RocmVhZHNfY291bnQoc3RydWN0IG9ubGluZV9kZWJ1Z19kYXRhICpkYXRhLCBp
bnQgdGhyZWFkcykNCj4gPiBAQCAtMTA2Myw4ICsxMDYzLDggQEAgc3RhdGljIHZvaWQgcnVuX29u
bGluZV9jbGllbnQoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpjKQ0KPiA+ICAJdWludDMyX3Qg
KnB0cjsNCj4gPiAgCWludCBmZCwgdm1fZmxhZ3M7DQo+ID4gIA0KPiA+IC0JbWV0YWRhdGFbMF0g
PSBjYWxsb2MoMiwgc2l6ZW9mKCptZXRhZGF0YSkpOw0KPiA+IC0JbWV0YWRhdGFbMV0gPSBjYWxs
b2MoMiwgc2l6ZW9mKCptZXRhZGF0YSkpOw0KPiA+ICsJbWV0YWRhdGFbMF0gPSBjYWxsb2MoMiwg
c2l6ZW9mKCoqbWV0YWRhdGEpKTsNCj4gPiArCW1ldGFkYXRhWzFdID0gY2FsbG9jKDIsIHNpemVv
ZigqKm1ldGFkYXRhKSk7DQo+IA0KPiBUaGVyZSBhcmUgb3RoZXIgcGxhY2VzIHdpdGggc2ltaWxh
ciBwYXR0ZXJuICdzaXplb2YoKm1ldGFkYXRhKScNCj4gSWYgdGhleSBhcmUgYWxzbyBidWdzLCBp
bWhvIHRoaXMgcGF0Y2ggc2hvdWxkIGJlIHNwbGl0dGVkIGludG8NCj4gUFJJdTY0L290aGVyIHBy
aW50cyBhbmQgb3RoZXIgb25lIGZvciBmaXhpbmcgdGhvc2Ugc2l6ZW9mLg0KPiANCj4gUmVnYXJk
cywNCj4gS2FtaWwNCg0KR29vZCBjYXRjaCEgU3VyZSwgSSB3aWxsIHNlbmQgdjIuDQoNClJlZ2Fy
ZHMsDQpEb21pbmlrDQo+IA0KPiA+ICAJaWd0X2Fzc2VydChtZXRhZGF0YVswXSk7DQo+ID4gIAlp
Z3RfYXNzZXJ0KG1ldGFkYXRhWzFdKTsNCj4gPiAgDQo+ID4gQEAgLTIzMjgsMTEgKzIzMjgsMTEg
QEAgc3RhdGljIHZvaWQgdGVzdF9tYW55X3Nlc3Npb25zX29uX3RpbGVzKGludCBmZCwgYm9vbCBt
dWx0aV90aWxlKQ0KPiA+ICANCj4gPiAgCQlpZiAobXVsdGlfdGlsZSkNCj4gPiAgCQkJaWd0X2Fz
c2VydF9mKGRpZmYgPCBXT1JLTE9BRF9ERUxBWV9VUywNCj4gPiAtCQkJCSAgICAgIkV4cGVjdGVk
IHRvIGV4ZWN1dGUgd29ya2xvYWRzIGNvbmN1cnJlbnRseS4gQWN0dWFsIGRlbGF5OiAlbHUgbXNc
biIsDQo+ID4gKwkJCQkgICAgICJFeHBlY3RlZCB0byBleGVjdXRlIHdvcmtsb2FkcyBjb25jdXJy
ZW50bHkuIEFjdHVhbCBkZWxheTogJSIgUFJJdTY0ICIgbXNcbiIsDQo+ID4gIAkJCQkgICAgIGRp
ZmYpOw0KPiA+ICAJCWVsc2UNCj4gPiAgCQkJaWd0X2Fzc2VydF9mKGRpZmYgPj0gV09SS0xPQURf
REVMQVlfVVMsDQo+ID4gLQkJCQkgICAgICJFeHBlY3RlZCBhIHNlcmlhbGl6YXRpb24gb2Ygd29y
a2xvYWRzLiBBY3R1YWwgZGVsYXk6ICVsdSBtc1xuIiwNCj4gPiArCQkJCSAgICAgIkV4cGVjdGVk
IGEgc2VyaWFsaXphdGlvbiBvZiB3b3JrbG9hZHMuIEFjdHVhbCBkZWxheTogJSIgUFJJdTY0ICIg
bXNcbiIsDQo+ID4gIAkJCQkgICAgIGRpZmYpOw0KPiA+ICAJfQ0KPiA+ICANCj4gPiAtLSANCj4g
PiAyLjM0LjENCj4gPiANCg0K
