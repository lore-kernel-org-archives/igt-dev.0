Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F72C3ABA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 20:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319CF10E127;
	Tue, 29 Apr 2025 20:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ui6bISdq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BD710E096
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 20:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745959582; x=1777495582;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VEXnNLFjgWbB2/0JO18/FQb8mhtGte90Glq0JUigFGI=;
 b=Ui6bISdqDCjgK9CDTUkyrRGBbzfI93AuThajQzXGYqfVpbAa/FkRqBUp
 LDQ2UpN8ntklumIMY1jXl2NtHeI7ac3JyEsZDkmFI9RhW0r0/6jDRux74
 cbg+yjRUgdK5FTdjgTz0x6ube96LKc0dyEmgPBbxFZ5t+baM2nEiEAoU4
 hWu8430V2MLObqg+DLkQbW3Nuj/V9j0RFQMWBPeUDqXhO5yoN2R/h8q48
 anbagHr+W+Irg35bsHYn0wSugnUDsUZmEXnGWkInKTL6wqDo6Nj9Xqmkn
 S0iZ6WTQQ7CMNPRjpfLUrMGlii+/5ExMyD9Z49quxUeftxqhEQ90iaDt7 Q==;
X-CSE-ConnectionGUID: u8Kre5biRgqRNAcfZWd4Kw==
X-CSE-MsgGUID: 0QByj6aqQySkqIa5WWCLlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58965953"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="58965953"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:46:19 -0700
X-CSE-ConnectionGUID: rio5yAS4Q7yxFf+1LFS94w==
X-CSE-MsgGUID: nHhSB4xTRS6NFn9lMW944Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; d="scan'208";a="133840859"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 13:46:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 13:46:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 29 Apr 2025 13:46:18 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 29 Apr 2025 13:46:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0PV7vFMkvieG3gQm5FUojOsGUVO408hEjlYtNA59P6MSuH6b0JD0LXzGAOoN4XsHZfInc+6ZVuqRrs2XywwqTH/iPo65ssxi4+5bnvZILStLiuqzl/9lJL+It2x+NlJaRMCdxJmp2UlelgwP/QXB8GWRACs7/rQP4SvY/z4/gO37F5/7A5p0L6qpB1O01zdldk5c1/t0MC03k9N+x42sQvyroqZD1uzIfcLF7sO4KyymehxKC37TtV+/jXSdZ5+D5+6YMZtZUxOjemXy2S4y9YsdmjXZpXCXpj5lkxZaXoRwa1XJBtRIdbQtsVv56XN3lnfmNrfwmFXUX10lM5bqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VEXnNLFjgWbB2/0JO18/FQb8mhtGte90Glq0JUigFGI=;
 b=GeQAyS70b6FE7Tzx+Kx3k/tkkxCfhyeAPhgoqlJbW/9auzyqDfzh9IldB4114obXHQRGTHU3H+sU20EpgnPMntkQw+StGICWZzvx0rIt4AE/0S3EVDZq9B/nvgkY3DE+iN+1ll6dFcqPMM3VY7wkJUrDANEIwLH1yErDw3YFiikG53n54nzRBTFyuRQ4n0r0SpvAx+/gJtEF2YCmMH/lGtzcUk/jtzUmOaj6pNue70Tn4QKzZvyprWcoUt1oxf5owf9vs9/kvvdJQ6UIBh4Bd0ZaFMis+MJD7yyWu6JcO2LwoDRlECllC4VZX4PQd5+FtFdo3NJp/bfYNbLVD+tLBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA1PR11MB6567.namprd11.prod.outlook.com (2603:10b6:806:252::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Tue, 29 Apr
 2025 20:45:48 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 20:45:48 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] xe_exec_system_allocator: Require huge pages reserved
 for huge page tests
Thread-Topic: [PATCH 2/2] xe_exec_system_allocator: Require huge pages
 reserved for huge page tests
Thread-Index: AQHbuT0eHM365RIMm06NnNguTns3DbO7GmeAgAAB1GA=
Date: Tue, 29 Apr 2025 20:45:48 +0000
Message-ID: <CH0PR11MB5444BD6B45596B9D77BB8020E5802@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250429192956.275280-1-jonathan.cavitt@intel.com>
 <20250429192956.275280-3-jonathan.cavitt@intel.com>
 <20250429203653.ncjhw6xz5uccydoq@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250429203653.ncjhw6xz5uccydoq@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA1PR11MB6567:EE_
x-ms-office365-filtering-correlation-id: 3fddf6b8-d106-456d-bb97-08dd875ed272
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZEl4WXVhM3owQ0pQbDlldDZqelUvcWV3WWVMNjJlUXhxN1lDcGh0T1dleEto?=
 =?utf-8?B?YmJLOXhad1h0MDNTbXIwY0JKRUppaXdZb3czK1BoTzZ3enBFK1VUY200WmxZ?=
 =?utf-8?B?bkE4bU5GOUdsL1FvRHltc3JXMlJFb1NRM2hsQVNSTUljKysxeTIrOXhZZktk?=
 =?utf-8?B?WGt3eDVoT1R6U2NpV29ObnZMR29TYXBVeGdZbC9KYzB4MGRRSHFBcUV1U09u?=
 =?utf-8?B?MDVVdTZPYUVUNXcrMWNwWElzVzJrbFg3QWN0MUJmKzg2YUtZQmVsZXE0ZExv?=
 =?utf-8?B?cW1VTllQTkdOTis5VkUrR3NSRDdCMCs4KzcvQncyNnZPay9kdnFJM1VibHNY?=
 =?utf-8?B?cExuV1ZaWG1lcUNhaGtxRUJxaDVEYnlybFB5Z3ppTHg1L0M5MjNBNFUwM2Fv?=
 =?utf-8?B?cFJOMkhtMGJQOVQxK3dMTFRKTFJqak5sZ2hsQVM0RGtrN2dxcGYwZDI0S2xO?=
 =?utf-8?B?SjFwLzhpTTBNako4K2FmdGVpYkRmNUl6ZXA4dkF2bHdHQ1ZQY2xTbUZzQkxP?=
 =?utf-8?B?aTNJNDJKZnRpNTRYU0lrY2syUXVROUZYTllwaW5kRVVJT21PTU5uNFNyQ3Qr?=
 =?utf-8?B?aUNLMzVKc3JRckprNkY2ZllFcUN5eWFNSVY1RDFHWGtnZXZyYjh2RmtsWU90?=
 =?utf-8?B?Tm1KV2ZRQTRXR0g3MmdIQ1JJNzg4T0VLMks0K0xUZjJzVnp2ZndndkF4cmdX?=
 =?utf-8?B?OVJhakpFZTNlNjZUSGo0cUdvTW9weDNlL2pvZXNacWsrYUV2M2lsSU9rL1Ax?=
 =?utf-8?B?U2xoczZWY2UxemRQa09nUHRkWlpobU05bnV2TG1WTUQ4cXZZZm8xUTVpK1do?=
 =?utf-8?B?RWZLRmFpZ2t3K1UwVlQzOE5haGwrWHcxUDVlNXBTcVlNcWF5UnBUWlI4U3Jm?=
 =?utf-8?B?TVplR3E1Y0hvUFh5THVQNENRL1NVMU9qbGlBTGFzMUNBS2kwTHZJcVlWWmNu?=
 =?utf-8?B?S0JLc1pQVHQvSGNtakFDTVRUQlJZemFUMGhHVS9WVVJTbmlGVjVzVGdHUlhE?=
 =?utf-8?B?OGVZRXF0RzU3WUVvL21nQUtQYjRWUXZ1enJKYVZBWGpYcjNHMGRxWU1tbkMw?=
 =?utf-8?B?ejJXZFlxMTRSblZML20rS083Mk1GeGI5WTNxMHlEREJJa2JUc1ZINEh6R0Nn?=
 =?utf-8?B?aW0xckhxakxzN2xsdHBFT1FaSGV3QjRFQTBSRzJ2WENOS3E0Q1hST1VYTkcx?=
 =?utf-8?B?ZnA4dm41VXUvd0RvaWdRalNnQXFSYjlHUGRtTkxoNkhBTDJ2NHVwKzAyTXF3?=
 =?utf-8?B?ekFucW44TkQyaTVFTEJ5VFJuNnpScjhTVmQyMFExU29ta1FFT1ByRmdrS0FU?=
 =?utf-8?B?UGVvMm9LV2tBcnQxNnQxVU5ldHd5YzJrYjVVVWpkcUt6TC9yMzU1RmEyUUkw?=
 =?utf-8?B?eG1FVDZHRFJuK2NYUXphVE53OTVHTTFNWTQzRFJTVlZ2Q3hacndXcGNwL0xs?=
 =?utf-8?B?azlxVGZYTUw1SURNQXhSM1h5Wnpaa3NQL2FKamUxWmMyQTlsUzF0cjlkcG1E?=
 =?utf-8?B?UEhBZHExb3B5aHZmWEhGSU8yTVppNXFkSmQ0K2JKcUV2MUVhbUNmWE9FRmRB?=
 =?utf-8?B?bEE0d1ljV09UVVVrRW52U1IzNWRjd2JaSk5iSS9TeUM2eXZoelBsUDBwMXkz?=
 =?utf-8?B?cWF3QVBVb1ltayt3R0drMEFpeHhuS0VBQVVCeG9YRjNzVjc1S0wzM2ljYlhV?=
 =?utf-8?B?S1IwcFF0eVFVS2hYZTJ1aW5XVFlicVc0RW50eUREWHBhazl0dkR2UmFaN0Zn?=
 =?utf-8?B?amd5REQvTXlyc3ROOW1aRGo3b3gxNzdXTWxqR3RFc29TOTY0alRrTmRKNDAw?=
 =?utf-8?B?aTdyMU91T25jRTR5bkdsRzRlbHdRNnBQK0NXWEZ3QmtuOVZ3SXJIbDNNQTlv?=
 =?utf-8?B?c3ZETytSVlZpWUhhdVdJa1JoRHdkRXVaVTIxYmRLNVRFOGNMRFJOYWxBSzRq?=
 =?utf-8?B?R1hYM1JITzZHeFBEK2Vtb1lyV1IvbE9BVW1XN090cE53NVZmY05KaU1CZGFw?=
 =?utf-8?Q?gWWDBki9GlZC4TWD1vEHRXBaBsVOGc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akpSYnhyV0haTzBOSzNGdCsvT0JKK2NGR2oxZ3I2WUw4NTUzTzg1bjFnTysw?=
 =?utf-8?B?SWNDeGpwRnFtTFdWWW5WRGN1SDh6S0FBUFNKTFFwWFlWc1ZRc0I3NHRMQ0lY?=
 =?utf-8?B?R1FPT3ArbExXSjN0ZzZISG1WL3d6R256T3AvYnVHZzJuVjMyRmo5T0RvZXlK?=
 =?utf-8?B?c2tMRmRFQ0IzUTVKM244SXJXd1N1NEhBSDc0L09HYWkycWw1K1QwUmZzMnV1?=
 =?utf-8?B?VHIwRk1ZcitsVzdrZ1hzZzVXalNyd1RjTzZUN2Raem82NVMwNURLVERrTWFU?=
 =?utf-8?B?cnkwWHNLSzEvN0hxcUVFYzE2Nk55Ri9DNEFNTE9wc0YxUnlwWkZZVGRmZ21W?=
 =?utf-8?B?RUhtMDFVbDdXU0hiRzR1OTlrdXRROGliUlVBSjNHVVpjbHhZSDRJRXVncklv?=
 =?utf-8?B?dktSYjlmNEJ0V1ovUURDSU1DM3l2SWQ3RXZLNWR0Z2J6aGQyV0JtaVRUZm9r?=
 =?utf-8?B?bHl3TThHMmdKMVNQZllzNzExbHBtYURtV0JWYWtkQ052TzNobE84RzNaQ21R?=
 =?utf-8?B?Z1lFVmcrT0tXbjdYVmprc1dpSmFMRDBuN200Tmh2STlaZkFOTFZRdHNMUGR3?=
 =?utf-8?B?RTBlcnh3WEc1a3hsV3Yzci9KcUQwdE1MSGxjNkdUeE45RS9FTXl2NW9nVHpR?=
 =?utf-8?B?eGhUUHdjQzdkZVZXV3lkWS9vL1k3UmxReU9DcFl0alk0djQrN0drK2tpTHJt?=
 =?utf-8?B?ajgwbXZXU0Fnek9NU0F5RUkrSTY5ZWx5ZEhCNDh0QWp5aVo3b1ByV1NTNDN3?=
 =?utf-8?B?NDZ3UzB5Q1R1TFZsZTR4Tm5TeGtDYW02OWpRMGNOallqNDkzSks5RUROYnB6?=
 =?utf-8?B?VEpqa1NvK05tcWhxYjY1eUo1MVIxM0NHbnV3bXVWTDdQUGJTRU1WZGsyK2tV?=
 =?utf-8?B?enZWR21TVjF2Y25kMFVrRS9aTWgvMFpUUy9NUjRwdGVkdVNJRjc3VDI5NUVl?=
 =?utf-8?B?NXNxQ0Z0eWh2MkljdCt0YjhpZC82SlUvODdoRWwvcVUxdmdkb25GTjFVS1JG?=
 =?utf-8?B?MnBzTFJqL0pkR0JRdVVJTXZ0Wngzb2lPMGppZnBlVWs4S21ucXliS0gwaHJF?=
 =?utf-8?B?TjFQQlN4ME9qSExjK09TREsrTlc4WXhwZmFYWVlpTlNMS2thMFNDclNJWG5H?=
 =?utf-8?B?aXVialFTd2FKS05XaUlycnFidHNsdkFSTnYxTDc1Q3BEajhQOXhxUCtHU3li?=
 =?utf-8?B?b1ZoK1JHaGs3U3ZMQkd4UTRUaVhDWnZrTTUxemx5M1BMWmZ5dlkzM21PQVpI?=
 =?utf-8?B?OFR4MGg2WGpER2I0VEtOdUIrazZnOWsydHlMbEJxY3ZYNlRTd0VEa0pDdVU4?=
 =?utf-8?B?SFJiMFJGZ0hackNFY2lVVkNkbDVpUyswcHB5MjMwOXREK2I3M3dSbDFlTFVS?=
 =?utf-8?B?M2NicW03eWR4T3hLZlVYNGxrV25FMG5yb1N4S3o1d29Qb0s4bFY1aGhhL0VB?=
 =?utf-8?B?YzZXRzYyemFQZ1kvd1R5cG1nYlNTZHNNcDZkSXZRWU1oUlJ4RWJ1aGV6Zk5Z?=
 =?utf-8?B?aHFpWjRtdWRIT3NZd2huNmN3S3BWUG50VjZsWG1NQnptcWtPVkp6NzgydzFr?=
 =?utf-8?B?THBFdHZqYVR0aytlSkVMZk9RdWNvdDNFcHJQK2VhdXg2anNURVIwaHAyN1I3?=
 =?utf-8?B?UjJWTTY4VWVuN3ZmK3l5RnpKNGZ1b3dKQ3dSLzNNWDg3bHVVa1BvakorR1hw?=
 =?utf-8?B?WC9Jd3puWU9hbVlzK3VqUU9XR25LS0FLdi9sUkFheHFuYTc2bjlXOVhOa1RZ?=
 =?utf-8?B?cTlGVmFOZFdSQU9oZUdCMmpKbFVpVjVvZ0VlR1hjSVd0bFNjM1liclpDSEY3?=
 =?utf-8?B?Vk8rdXIxZm95SllSejYwRjlqbTludHpvNWpoclJrTFk3c1JRVlBxdk1rdkIw?=
 =?utf-8?B?OVAvd2UrUGM4b3h1Q3owV05OcjRmeUJuclZwZVhpY1hRWkd1ekowalphZlBj?=
 =?utf-8?B?a29CVFF2M08rWVlZUkx2U2M2bkoxcEVQRWR1U081ZE5ZYklEa1FlRDU3N1Fw?=
 =?utf-8?B?dzVWRWlhNG5QTC9SSmszL1dYcTd4S3JaUWY4Vkl3aHV0Tkk0OVh1aTZNNDZF?=
 =?utf-8?B?Rkk3czNsM1BpYzIxNE8ybzdPdTZHWXplbk5ITHYzWWpwd253dUgxbGxFMVUw?=
 =?utf-8?Q?jKkSuLgcdwQJ0tqzswN6ARuFN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fddf6b8-d106-456d-bb97-08dd875ed272
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 20:45:48.3341 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6fWBEp9MaGB8cnGjChrU3Afm/Lluyes254MKU85vssOTQfMWtyEXEHkbmQkDeX9HbsFeHX3mgiadmBxi8ILF/i2A0ErbYQDrpHCqnllrjnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6567
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
a29uaWVjem55QGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBBcHJpbCAyOSwgMjAy
NSAxOjM3IFBNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNv
bT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgR3VwdGEsIHNhdXJhYmhnIDxz
YXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47
IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBb
UEFUQ0ggMi8yXSB4ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3I6IFJlcXVpcmUgaHVnZSBwYWdlcyBy
ZXNlcnZlZCBmb3IgaHVnZSBwYWdlIHRlc3RzDQo+IA0KPiBIaSBKb25hdGhhbiwNCj4gT24gMjAy
NS0wNC0yOSBhdCAxOToyOTo1NiArMDAwMCwgSm9uYXRoYW4gQ2F2aXR0IHdyb3RlOg0KPiANCj4g
c21hbGwgbml0IGFib3V0IHN1YmplY3Q6IHVzZSBwcmVmaXgsIGFsc28gYXZvaWQgcmVwZXRpdGlv
biwNCj4gc28gaW5zdGVhZCBvZg0KPiANCj4gW1BBVENIIDIvMl0geGVfZXhlY19zeXN0ZW1fYWxs
b2NhdG9yOiBSZXF1aXJlIGh1Z2UgcGFnZXMgcmVzZXJ2ZWQgZm9yIGh1Z2UgcGFnZSB0ZXN0cw0K
PiANCj4gd3JpdGUgZm9yIGV4YW1wbGU6DQo+IA0KPiBbUEFUQ0ggMi8yXSB0ZXN0cy9pbnRlbC94
ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3I6IENoZWNrIGZvciBodWdlIHBhZ2VzIGJlZm9yZSB0aHAg
dGVzdHMNCg0KRmFpciBlbm91Z2guICBJIHdvdWxkJ3ZlIGRvbmUgc29tZXRoaW5nIGxpa2UgdGhh
dCwgYnV0IGR1cmluZyBteSBpbml0aWFsIGF0dGVtcHRzIHRvIHdyaXRlDQp0aGUgc3ViamVjdCBs
aW5lIGZvciB0aGlzIHBhdGNoLCBJIHdhc24ndCBhYmxlIHRvIGZpbmQgdGhpcyB3b3JkaW5nLCBz
byBteSBhdHRlbXB0cyBhbHdheXMNCmV4Y2VlZGVkIHRoZSBzb2Z0IDc1LWNoYXJhY3RlciBsaW1p
dCBwZXIgbGluZSB0aGF0IHdlIHRyeSB0byBhdm9pZC4gIFNvLCB0aGFuayB5b3UgZm9yDQpmaW5k
aW5nIHRoaXMgd29yZGluZy4NCi1Kb25hdGhhbiBDYXZpdHQNCg0KPiANCj4gQnR3IHRoaXMgY291
bGQgYmUgZG9uZSBhdCBtZXJnZS4NCj4gDQo+IFJlZ2FyZHMsDQo+IEthbWlsDQo+IA0KPiA+IFZh
cmlvdXMgc3VidGVzdHMgaW4geGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yIGF0dGVtcHQgdG8gdXNl
IHRoZQ0KPiA+IE1BUF9IVUdFVExCIGZsYWcgZm9yIG1tYXAuICBEb2luZyBzbyB3aWxsIHJlc3Vs
dCBpbiBhbiBFTk9NRU0gZXJyb3IgaWYNCj4gPiB0aGVyZSBhcmUgbm8gYXZhaWxhYmxlIGh1Z2Ug
cGFnZXMsIHdoaWNoIGNhbiBvY2N1ciBpZiBub25lIGFyZSByZXNlcnZlZA0KPiA+IGJlZm9yZSBi
b290IHRpbWUuICBTbywgc2tpcCB0aGUgdGVzdHMgaWYgbm8gaHVnZSBwYWdlcyBoYXZlIGJlZW4N
Cj4gPiByZXNlcnZlZCBieSB0aGUga2VybmVsLg0KPiA+IA0KPiA+IEZpeGVzOiA0MWVlNGQ2OThm
ZDggKCJ0ZXN0cy94ZTogQWRkIHN5c3RlbV9hbGxvY2F0b3IgdGVzdCIpDQo+ID4gU2lnbmVkLW9m
Zi1ieTogSm9uYXRoYW4gQ2F2aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KPiA+IENj
OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
dGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMgfCAxNSArKysrKysrKysrKysr
KysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxsb2NhdG9yLmMgYi90ZXN0cy9p
bnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiA+IGluZGV4IGUxMTIxYTg2MjcuLjhh
NTVlMGZmNjQgMTAwNjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXhlY19zeXN0ZW1fYWxs
b2NhdG9yLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3Iu
Yw0KPiA+IEBAIC05NjQsNiArOTY0LDEyIEBAIHN0cnVjdCB0ZXN0X2V4ZWNfZGF0YSB7DQo+ID4g
IAl1aW50MzJfdCBleHBlY3RlZF9kYXRhOw0KPiA+ICB9Ow0KPiA+ICANCj4gPiArc3RhdGljIHZv
aWQgaWd0X3JlcXVpcmVfaHVnZXBhZ2VzKHZvaWQpDQo+ID4gK3sNCj4gPiArCWlndF9za2lwX29u
X2YoIWlndF9nZXRfbWVtaW5mbygiSHVnZVBhZ2VzX1RvdGFsIiksDQo+ID4gKwkJICAgICAgIkh1
Z2UgcGFnZXMgbm90IHJlc2VydmVkIGJ5IHRoZSBrZXJuZWwhXG4iKTsNCj4gPiArfQ0KPiA+ICsN
Cj4gPiAgc3RhdGljIHZvaWQNCj4gPiAgdGVzdF9leGVjKGludCBmZCwgc3RydWN0IGRybV94ZV9l
bmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4gPiAgCSAgaW50IG5fZXhlY19xdWV1ZXMsIGlu
dCBuX2V4ZWNzLCBzaXplX3QgYm9fc2l6ZSwNCj4gPiBAQCAtMTAwNSw2ICsxMDExLDkgQEAgdGVz
dF9leGVjKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwN
Cj4gPiAgCWlmIChmbGFncyAmIEVWRVJZX09USEVSX0NIRUNLICYmIG9kZChuX2V4ZWNzKSkNCj4g
PiAgCQlyZXR1cm47DQo+ID4gIA0KPiA+ICsJaWYgKGZsYWdzICYgSFVHRV9QQUdFKQ0KPiA+ICsJ
CWlndF9yZXF1aXJlX2h1Z2VwYWdlcygpOw0KPiA+ICsNCj4gPiAgCWlmIChmbGFncyAmIEVWRVJZ
X09USEVSX0NIRUNLKQ0KPiA+ICAJCWlndF9hc3NlcnQoZmxhZ3MgJiBNUkVNQVApOw0KPiA+ICAN
Cj4gPiBAQCAtMTQzOSw2ICsxNDQ4LDkgQEAgdGhyZWFkcyhpbnQgZmQsIGludCBuX2V4ZWNfcXVl
dWVzLCBpbnQgbl9leGVjcywgc2l6ZV90IGJvX3NpemUsDQo+ID4gIAlpZiAoKEZJTEVfQkFDS0VE
IHwgRk9SS19SRUFEKSAmIGZsYWdzKQ0KPiA+ICAJCXJldHVybjsNCj4gPiAgDQo+ID4gKwlpZiAo
ZmxhZ3MgJiBIVUdFX1BBR0UpDQo+ID4gKwkJaWd0X3JlcXVpcmVfaHVnZXBhZ2VzKCk7DQo+ID4g
Kw0KPiA+ICAJeGVfZm9yX2VhY2hfZW5naW5lKGZkLCBod2UpDQo+ID4gIAkJKytuX2VuZ2luZXM7
DQo+ID4gIA0KPiA+IEBAIC0xNTUwLDYgKzE1NjIsOSBAQCBwcm9jZXNzZXMoaW50IGZkLCBpbnQg
bl9leGVjX3F1ZXVlcywgaW50IG5fZXhlY3MsIHNpemVfdCBib19zaXplLA0KPiA+ICAJaWYgKGZs
YWdzICYgRk9SS19SRUFEKQ0KPiA+ICAJCXJldHVybjsNCj4gPiAgDQo+ID4gKwlpZiAoZmxhZ3Mg
JiBIVUdFX1BBR0UpDQo+ID4gKwkJaWd0X3JlcXVpcmVfaHVnZXBhZ2VzKCk7DQo+ID4gKw0KPiA+
ICAJbWFwX2ZkID0gb3BlbihzeW5jX2ZpbGUsIE9fUkRXUiB8IE9fQ1JFQVQsIDB4NjY2KTsNCj4g
PiAgCXBvc2l4X2ZhbGxvY2F0ZShtYXBfZmQsIDAsIHNpemVvZigqcGRhdGEpKTsNCj4gPiAgCXBk
YXRhID0gbW1hcChOVUxMLCBzaXplb2YoKnBkYXRhKSwgUFJPVF9SRUFEIHwNCj4gPiAtLSANCj4g
PiAyLjQzLjANCj4gPiANCj4gDQo=
