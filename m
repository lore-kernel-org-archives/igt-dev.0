Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E428CAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:38:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B68D10E1BC;
	Wed, 24 Sep 2025 12:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhl1sRwe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ED810E1BC
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717530; x=1790253530;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+heht+dXhCKUs+DBDXBELlSo/b+mH/4rIWxYCniRmUM=;
 b=mhl1sRweLJUrzek28LiCgIi0+jMSyq3zKONAanDn3q/LifUXLgs+fbSe
 o+dz0yH3Cu/5y7jUT828T0HUXedmRlYHwRDw1IN5A9zoLlfBHxxbnHjKx
 kimiNUmlAlueiQROHS84NzB0Q72sZc0qvt/4nV7bs1X7QpfZdItr3ug3q
 w4ivMrQvniDaxbIiK8mzfdPqxgr8kp/GTTqbx5usBtwKGpepcRWwKP8WB
 OgSnb2DyxI7/Nl5TV/wRSh2Go/PVDg+Yiacym/9TAXwtrdeSawIMwUcGi
 HZzZlZrPrct/ZoRA9YJAQ1/bXMVkZQL5rYkh2P/uyJVAzw/B6uSw4v4Bu w==;
X-CSE-ConnectionGUID: aRSj5BhfSEGpr9iLsIrrZQ==
X-CSE-MsgGUID: hj0LR5d2SKW6DBmqBNJ7/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83615341"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="83615341"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:38:50 -0700
X-CSE-ConnectionGUID: n5XMQ2ZmQoSnq5vujFi7lQ==
X-CSE-MsgGUID: P6nACdB/SvWzOTq+u84MRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="207764298"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:38:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 05:38:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 05:38:48 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.14) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 05:38:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lM+kbwg8gLS4KnwUZo5C2L4SUywmWBiZ7VBmlO0eDi+57LNEDaIyD4olQaYxf0poit16iM+zQxiB6i36CdP3KlswkGA1Xe7tNlpIzO1lcMdQiZXUhliPepJbHY5RwzldMta+0DPnLIetKWwKZJiqYE9Tx6QAJ9eJEcgBzlcbWKCeNzUHMKseP9wzUwIB8dcSfec14K58uDzzKt9xeyP/z9vZgKxH/1arzPwvmN1Ke2LeNGTelcmsYRKwFUZg4X0aOBvkA7GBxwM7ixwipz/2OF8vHHy2m+gUO7hkjOUgKkZ1gmt2sbbnelg8H9g18ft3nr+Xrgn4YYY374lD7pBPlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+heht+dXhCKUs+DBDXBELlSo/b+mH/4rIWxYCniRmUM=;
 b=k+Ngwdyi6gq3DHDF8PbKBsZHLy0mz9aLlMa26t823cGUCbaycIboROLEfxg5GbLV8i9Z9ls/uXQjH4xjXb5pSVg3Q56sZ1cGwmcDIrLMpg/GZ8lGDYsKUnqa2Bk8qDO9BI7hloQICQ0hf8Le7FadmxbCUlGFA8SBRC+yp6Q/5Y6Uo2nQhRd34XxZHsnHi4EGgH+3QHae/fLTBKNlpeS2vUMATEYPbjdlYBNSoXMQ0ijIjlQSMX9RnbmOafNkQDIZeWKzeTAzb9b1Wu+2rn1BSN3Z1KD8cYhWGdyOaLD70Y5ctb8elmJICzrahqcXnQjypSADAbEKZnj+UtltxO5t9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.20; Wed, 24 Sep 2025 12:38:44 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 12:38:43 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Mika
 Kuoppala" <mika.kuoppala@linux.intel.com>
Subject: RE: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Thread-Topic: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Thread-Index: AQHcLItvYfuCcpqc+EKFz3IHwUZm77Sh4CyAgABfApA=
Date: Wed, 24 Sep 2025 12:38:43 +0000
Message-ID: <DS0PR11MB7264E5392AD6D99328215034D91CA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
 <nuhmzvakmfdvuo3rz6wdbzmb3d2hilmydbq7ibht7lodkvgctg@rz3aarf724hb>
In-Reply-To: <nuhmzvakmfdvuo3rz6wdbzmb3d2hilmydbq7ibht7lodkvgctg@rz3aarf724hb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB6120:EE_
x-ms-office365-filtering-correlation-id: 98552a20-20ac-4358-19f2-08ddfb674c62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?clpqNU5GUDRiU0MvdGd0MTRQMk5tWDcvd2FFRDBLZXFKOFo0UE90cWxsaGxx?=
 =?utf-8?B?alVtQml6c3U4MURzV2kzbmhpNEM2K09XZEFRMmg5ZmxBVjIyQTJyUEFYZnRS?=
 =?utf-8?B?WXExenJmQTVpRDdDSTk2anJHOWpGdlJOd1FkYWJ1d3FxcFhnNFhKSWwyV25P?=
 =?utf-8?B?REk1RDZnbEI3QmptY0hxQVFrVUhEOHl6N2JOVjhOT3BMOHJHK2FwMkMyNm1O?=
 =?utf-8?B?K2VVZkpiakM4SnVKbDY2cEozcWZXVVhZaDFoL3k3QkxaK1lORW8wOWpjYlh1?=
 =?utf-8?B?QmJoK1dka1pOaHNyZ0Jrdkhsa0RjSlpYanYvSnAvZUZmUFJIQkd4SFhzQ2lw?=
 =?utf-8?B?ZGRUQVRmdkROZERldE5hWkMzNU1PaC9HWmJBL1VmUitHQWVuZWR2SnBZWDdZ?=
 =?utf-8?B?cjRoYmFxQ2ZDWkE4R2d5NU5GRTZUMWNCRTROMU9pTEQ0aDNkZ3p3b1dwQ0oz?=
 =?utf-8?B?VHB4YlpwWlB1UFNXSTFXOHVYVGlta3lIb3ZoWnNSRCs4SEVCbDQ3cC9DVCtJ?=
 =?utf-8?B?eERUTjZIU3NtNFZKUmtDRFpsNjBsK0MxNjZsOVRBMHZKZ05qa091bkF2KzZC?=
 =?utf-8?B?RCs1SFNuVFI1bjd1dEUvTm9VTUpRNG1BNStRNVhKT2Y4bmlYVXdRUFdZSGlU?=
 =?utf-8?B?dXBlaGwwc1gvR293c2p5NlNvMlZjUUFHaGRwVUVoWTg0MlVOaEhtRldjeDZD?=
 =?utf-8?B?MTJnTlhUb2V0QmJ3MTY5bGx6U09EY0NSWjArYkplWlMyZm85alpFMldkUEJn?=
 =?utf-8?B?ckJ3NWhmMGZlaVVlNzJqdnNWeDJXQUpibEJTL0RtaDhmNm9ZUTVHQkJLZjh2?=
 =?utf-8?B?cWFFT1RYWThXVDdOTk1Db3dGUS9UVVlFRS92Z0lJVHYzKzlvY3pkbDlXSzhv?=
 =?utf-8?B?cDdlMWxPZ1RtM3owMkcwdUtPODc5dmdNRnRUOFRHOXpVY2NERjhzelliN2NG?=
 =?utf-8?B?ZE1WNzJSYkNNM2x3RXhqUW9RTnZxSkpiN0xaUm1rbDFGUXFmOWpYOWdXZ2xC?=
 =?utf-8?B?YU9XaVVOa0s2QnhmdStad0twOVBtbzE3UWhlZG1iRUliczBycmRqbUxhdmgr?=
 =?utf-8?B?MENlb0lCaXFEdVpTTTM4RU1oYWR6bVF4b2RwdXZrbkhmeTNlSlZqakN1S3RL?=
 =?utf-8?B?dGZhM0VqNGRJaGdkcDl6VU8zQXZvc1B5MlY2TnVqQ0gyaytxRFFIS29qNVRk?=
 =?utf-8?B?YmQ4Q3lvYzBmRHhPUElBdlNyejRQdmhzekhTSW0wZ0M0UkpRSTVGcWpWeHly?=
 =?utf-8?B?bHNaM3BNYmI3Rm1RWjZLMythRGFQdzhyalRFdFBRWnNxQ1BtakV0bGR0RFlR?=
 =?utf-8?B?QnFsOFpZa2daRSt4QWdtTHBlSlZianFEdm9USjl4QzZDRyt1VSt1UmQ5VjZq?=
 =?utf-8?B?MFlyNUNYclJWc29pcWpneURxV3p1UGcybXNVSmF3RERnOHhCZDN2K1JiT0sx?=
 =?utf-8?B?eEJXZkpsaktBcEZkaTNsWlRBdk4zOTVKdGx5SjRNdkhiRk1xOWhmanFiMWhW?=
 =?utf-8?B?VmFGZEFLdllRbElyTkkyZzZCbFJyekczcVJzcmNiRnI4MGRCQnMvTGx4YmRk?=
 =?utf-8?B?eWhsN3F6c011OTl3QnViOHg3QXZQVzBkdnhGbitJbU5Fcjg4bUgzdmVHL2ZC?=
 =?utf-8?B?Qm9laXlGWGZkSTI1VTBXcXJkOS9FOFBNSWZvSVJpSFBDSFhrQWRsblR3Sk1k?=
 =?utf-8?B?N2xQTG1lQzliOXpNZm9Mc21mc2RhSlZtdG91cFRhNWhqT01maGlZaTZXWlNN?=
 =?utf-8?B?a0hwbzBKTk9wMU92eFVOanh3Z09zemlScGVtY0ZOeHBpcnA3YVgrTFI5NkFm?=
 =?utf-8?B?WnNNNG1mUnc5WVBIMWRwNllzV0trcXh4cHhMTnNEcGxCVmsxTStpNDBPd2pC?=
 =?utf-8?B?b056L2htMUJWTjNlK0NXbHRndjNtT2thTU83S1lITlJIa0hwcWdRblY0VFdw?=
 =?utf-8?B?Y3J2TGVUNUpmdkVMRnRmNkVKVGp3NXA0VDNVMDhMQVI0ZG9WQjNEOHBWdWFh?=
 =?utf-8?B?RWFPVnBwTEF3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUU5YVdGd3NZaklIWUV2YXBYdFAxa1gxd2s2UXlocytFTnlrT3Y0ZEpUK0lq?=
 =?utf-8?B?ZU5UVEdnM05zUWlwNVVCenhkcEM0UWRJOVkwRzVKMWRhRENzdkovVzJEUWF4?=
 =?utf-8?B?dWtOUkJrOE5Pakx1T0l6MnRWTE9ETVBvVnkwTXZJY1hyeWs1RFNaYlNCZVNr?=
 =?utf-8?B?SUh4Ulp1VFNiZC9Wc1pWWU9aKzducnRmNzcwZU9GeDFXZGZUOFNLTTVUMU90?=
 =?utf-8?B?S2d1UUNscHpmUVM1eWpOMFBwdTlyZzU0SEJNbXN0cFFVR1p2TzJvN2JKL2to?=
 =?utf-8?B?WThsL0RBTUFCQVkrdUpxd24vSTRINVAxOE1Nay9DakpSZFRtNHZMQ3RmcTZX?=
 =?utf-8?B?U1BFMjFuQklYaWNERUNNL0xENWNHQkxqbnF1MFdqRUlwS29DMkV2Z2FMV1kz?=
 =?utf-8?B?TVlVZGZVQlNiTHdlMnR0eGJhcTNHL2RDaWo5MlpKL0k1eExidXdGWWV4dGJX?=
 =?utf-8?B?YlMzcVRlemMrV28zWUNPTm9MZG1LQUtaSitsNTZGNGxJNjFHU2tJRmJ2UkVD?=
 =?utf-8?B?MzVIVWpXbVNqd2MyQ1Rxem95MFU0N3FFd1l4NUQrZ2pBMWwzUFN3bm5aQ0VI?=
 =?utf-8?B?MWFVK1VteGxrTGNKTUJRdm96OE1NWG5NVWJKQ2F3bzNNUmE1aGlOT0dZVWxy?=
 =?utf-8?B?L2VXbWRsOU9uRWFqZVoycUNsNjB5OWlHVkJpcmEwNEVmRmF0YytLV0VncUNk?=
 =?utf-8?B?Z0V4Ly9FYVVZTHBVMk0zcEsvSk8vYmVpTTBHSG8zeC9mYWhGUUlmWVpYQm5I?=
 =?utf-8?B?c0hGeExXYXYzQ255ZnVleHROQnpHYytVTzZRQ2dZMEhVWTlDa0FpNjdFazgz?=
 =?utf-8?B?ZC9SM3p5TmkreWtPUmJpU0F1UHQzY2RxcFNTVFRXOVhzTDd5T0txRXBLdGZh?=
 =?utf-8?B?dWQ4c1UvZjFNMDVIY3JMeWY1NmNwaW5wbnhTemVOcXFnMUFlWDBOUWdCdmxl?=
 =?utf-8?B?Sk05R09MbU9sY0lzRzh2ZW00TVJ1azNKZ0Qya0I4YzQrblFXUU1hcVQwYUt3?=
 =?utf-8?B?bFMzdzB6T3lSZ21MNytMeHlKR3BFM2JvY09mc2phcS9iL0hGaDdXTE9pWEo1?=
 =?utf-8?B?SEM5S0h4UHFOQ2h0N1NIb0xvMHRlblA2dXRWNDFJUzEzZFNRR0tIQ1Z6cmVM?=
 =?utf-8?B?QjZNS2hNUFpZcHYwYmE5M1pqMFptajZyWktBcDVqLzlzajBuOG1vM1pjWVlM?=
 =?utf-8?B?ZU5hYTVINWZBZ2NpVHBqdFZhbWFMSldsNmJPQ0FoN3ZhWnU4bEFSZktXTUd2?=
 =?utf-8?B?OEJyTHZWYUdjS09BQ1ZLcm14c3ZVUm5JMGR6ekRoL3diVjhEREFlSFVjNUQ5?=
 =?utf-8?B?bU5kOEd0VlRad2JRejUvaDltZTE3enhrRmdOa2Z2RGwyb2N5eXh1WmJKSGRi?=
 =?utf-8?B?NTlXRkk4UU9JQkNMQkJ0SGlrOVlZUEpRUzNha0dIY1JaT3AwRzM3QlFXM1la?=
 =?utf-8?B?dmtYZ1g2V2xvMGVlSTBxSlc4OHBDUDkvaWR1MlFndXJjRjRXblNNbXdtMHIw?=
 =?utf-8?B?bkNkNjUwMzk1bGdRWFFVeEVyUEUyamttTGhxQXUzQzkxcVoyK25Gb2VPZjdj?=
 =?utf-8?B?UHhTcVd2NzF4eE53VUhrTXZONUtpTXdmWmk3NCt2ZmNpTk1ubzRHMEVQWXg0?=
 =?utf-8?B?WmNNdE5MQW1ScUpGcHFpSjNkaDAvUEhOL3c2aHdFSktrQnVaQ0E5VGtMQkxL?=
 =?utf-8?B?dENYYXVMR2h2cDNyUk9VTWo4L2xwTzhsZEFOWkl1Q2IvdjNkQTJGVi9DaTdw?=
 =?utf-8?B?RENtK3RXNGxIQXlPWXlHaGRUTFlMTS9OS2NtWlJuMFA3bTJaMU9VeitEOTEy?=
 =?utf-8?B?Y0V6SFVTaHE4T29iRk91MU9hWHRKQ1hCakxqUzlLZFl2RFFhUjh6SlhyTHdP?=
 =?utf-8?B?ejVpc252Zm4za0FQeFhwemViQWs3YjM2WkpQV24xaGNoaHlXY1U1NmxweFUy?=
 =?utf-8?B?SWtacUhqeTFDaWdPLy9zUy82dHlZYUhxVzlBUWJTYmMrSEpzM2FDK01xWEJF?=
 =?utf-8?B?NnpKNEJZREo4YjZ2N0I3SVAzanI1SGsyRkpxVVJFVEZsK1VMWkphRW0veDFs?=
 =?utf-8?B?MXdTbGEyOFBITEVOWGovOU94dmUyQTFPNTN0VjlQY1VpRzd4M1lYY1RTWFZv?=
 =?utf-8?B?Tk1jWVZmQTJSL2o5UWVsbGptck1pZXU2VXZMWnZUUzh2LzM3QWNEaHNDeUxT?=
 =?utf-8?B?L0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98552a20-20ac-4358-19f2-08ddfb674c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 12:38:43.7581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuR+moCbIgbL2uMcvu7wPZGtZhKvw0I7S5z7H1Mut+UcpNzxCojvxvb1hcHzyraSCS2CqXbtPu1IWgKC2CETyLa/3cWW84iS/4q6BnAW4dYYYebhF4IoBJNyKVs2IuwG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
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

SGkgWmJpZ25pZXcsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+IFNl
bnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDI0LCAyMDI1IDg6MzAgQU0NCj4gVG86IFBpYXRrb3dz
a2ksIERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+
IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTWlrYSBLdW9wcGFsYQ0KPiA8bWlr
YS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgaS1n
LXQgNC82XSBsaWIveGVfZXVkZWJ1ZzogSW1wcm92ZSBTSUdJTlQgaGFuZGxpbmcNCj4gDQo+IE9u
IFR1ZSwgU2VwIDIzLCAyMDI1IGF0IDAzOjEwOjAwUE0gKzAyMDAsIERvbWluaWsgS2Fyb2wgUGnE
hXRrb3dza2kgd3JvdGU6DQo+ID4gUmV3cml0ZSBTSUdJTlQgc2lnbmFsIGhhbmRsZXIgdG8gdG9n
Z2xlIGEgdmFyaWFibGUgaW5zdGVhZCBvZiBjYWxsaW5nDQo+ID4gcHRocmVhZF9leGl0IGluc3Rh
bnRseSwgYXMgdGhlIHRocmVhZCBjb3VsZCBiZSBpbiBjcml0aWNhbCBzZWN0aW9uLA0KPiA+IGNh
dXNpbmcgYSBkZWFkbG9jayBvbiB0aGUgYXR0ZW1wdCBvZiBuZXh0IGVudHJ5IGludG8gdGhhdCBj
cml0aWNhbA0KPiA+IHNlY3Rpb24uDQo+ID4NCj4gPiBJbnRyb2R1Y2UgcmVjZWl2ZWRfc2lnbmFs
LCByZWNlaXZlZF9zaWdpbnQgYW5kIGhhbmRsZWRfc2lnaW50IHZhcmlhYmxlcw0KPiA+IHRvIGhl
bHAgd2l0aCBjb29yZGluYXRpb24gb2YgaGFuZGxpbmcgU0lHSU5UIGFuZCBvdGhlciBzaWduYWxz
Lg0KPiA+DQo+ID4gVXNlIHRoZSByZWNlaXZlZF9zaWdpbnQgdmFyaWFibGUgaW4gZGVidWdnZXJf
d29ya2VyX2xvb3AgdG8gc2FmZWx5IGtpbGwNCj4gPiB0aGUgdGhyZWFkLCBzZXQgaGFuZGxlZF9z
aWdpbnQgdG8gaGVscCB3aXRoIGNvb3JkaW5hdGlvbiBvdXRzaWRlIHRoZQ0KPiA+IGRlYnVnZ2Vy
IGxvb3AuDQo+ID4NCj4gPiBSZW5hbWUgdGVybWluYXRlX2RlYnVnZ2VyIHRvIGRlYnVnZ2VyX3Np
Z25hbF9oYW5kbGVyIHRvIGRlc2NyaWJlIGl0cw0KPiA+IG5ldyBmdW5jdGlvbiBiZXR0ZXIuIEFk
ZCBTSUdURVJNIHRvIHNpZ25hbHMgdGhhdCBhcmUgaGFuZGxlZCBieQ0KPiA+IGRlYnVnZ2VyX3Np
Z25hbF9oYW5kbGVyLg0KPiA+DQo+ID4gRG9uJ3Qga2lsbCBkZWJ1Z2dlciB0aHJlYWQgb24gbm9u
LVNJR0lOVCBzaWduYWxzLiBEb24ndCBicmVhayBvbiBwb2xsDQo+ID4gZmFpbHVyZSBpZiBzaWdu
YWwgd2FzIHJlY2VpdmVkLg0KPiANCj4gSXNuJ3QgdGhpcyB0cnVlIG9ubHkgZm9yIFNJR1RFUk0g
YW5kIG90aGVyIHNpZ25hbHMgcHJldmlvdXNseSBjb25maWd1cmVkDQo+IGR1cmluZyBpZ3RfbWFp
bigpPw0KDQpSaWdodCwgZ29vZCBjYXRjaC4NCg0KPiANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kNCj4gPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBp
bnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGxpYi94ZS94ZV9ldWRlYnVnLmMgfCAyNiArKysrKysr
KysrKysrKysrKysrKysrLS0tLQ0KPiA+ICBsaWIveGUveGVfZXVkZWJ1Zy5oIHwgIDQgKysrKw0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2V1ZGVidWcuYyBiL2xpYi94ZS94ZV9ldWRl
YnVnLmMNCj4gPiBpbmRleCBkZWFlYTI1Y2QuLjY0N2RhN2IzMiAxMDA2NDQNCj4gPiAtLS0gYS9s
aWIveGUveGVfZXVkZWJ1Zy5jDQo+ID4gKysrIGIvbGliL3hlL3hlX2V1ZGVidWcuYw0KPiA+IEBA
IC0xMDcyLDkgKzEwNzIsMTQgQEAgeGVfZXVkZWJ1Z19yZWFkX2V2ZW50KGludCBmZCwgc3RydWN0
DQo+IGRybV94ZV9ldWRlYnVnX2V2ZW50ICpldmVudCkNCj4gPiAgCXJldHVybiByZXQ7DQo+ID4g
IH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCB0ZXJtaW5hdGVfZGVidWdnZXIoaW50IHNpZykNCj4g
PiArc3RhdGljIHZvaWQgZGVidWdnZXJfc2lnbmFsX2hhbmRsZXIoaW50IHNpZywgc2lnaW5mb190
ICppbmZvLCB2b2lkICpjb250ZXh0KQ0KPiA+ICB7DQo+ID4gLQlwdGhyZWFkX2V4aXQoTlVMTCk7
DQo+ID4gKwlzdHJ1Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCA9IGluZm8tPnNpX3B0cjsNCj4g
PiArDQo+ID4gKwlkLT5yZWNlaXZlZF9zaWduYWwgPSB0cnVlOw0KPiA+ICsNCj4gPiArCWlmIChz
aWcgPT0gU0lHSU5UKQ0KPiA+ICsJCWQtPnJlY2VpdmVkX3NpZ2ludCA9IHRydWU7DQo+ID4gIH0N
Cj4gPg0KPiA+ICBzdGF0aWMgdm9pZCAqZGVidWdnZXJfd29ya2VyX2xvb3Aodm9pZCAqZGF0YSkN
Cj4gPiBAQCAtMTA5MiwxNCArMTA5NywyNCBAQCBzdGF0aWMgdm9pZCAqZGVidWdnZXJfd29ya2Vy
X2xvb3Aodm9pZA0KPiAqZGF0YSkNCj4gPiAgCWlndF9hc3NlcnQoZC0+bWFzdGVyX2ZkID49IDAp
Ow0KPiA+DQo+ID4gIAlpZ3RfYXNzZXJ0X2VxKHNpZ2FjdGlvbihTSUdJTlQsIE5VTEwsICZzYSks
IDApOw0KPiA+IC0Jc2Euc2FfaGFuZGxlciA9IHRlcm1pbmF0ZV9kZWJ1Z2dlcjsNCj4gPiArCXNh
LnNhX3NpZ2FjdGlvbiA9IGRlYnVnZ2VyX3NpZ25hbF9oYW5kbGVyOw0KPiA+ICsJc2Euc2FfZmxh
Z3MgfD0gU0FfU0lHSU5GTzsNCj4gPiAgCWlndF9hc3NlcnRfZXEoc2lnYWN0aW9uKFNJR0lOVCwg
JnNhLCBOVUxMKSwgMCk7DQo+ID4NCj4gPiArCWlndF9hc3NlcnRfZXEoc2lnYWN0aW9uKFNJR1RF
Uk0sIE5VTEwsICZzYSksIDApOw0KPiA+ICsJc2Euc2Ffc2lnYWN0aW9uID0gZGVidWdnZXJfc2ln
bmFsX2hhbmRsZXI7DQo+ID4gKwlzYS5zYV9mbGFncyB8PSBTQV9TSUdJTkZPOw0KPiA+ICsJaWd0
X2Fzc2VydF9lcShzaWdhY3Rpb24oU0lHVEVSTSwgJnNhLCBOVUxMKSwgMCk7DQo+ID4gKw0KPiA+
ICAJZG8gew0KPiA+ICAJCXAuZmQgPSBkLT5mZDsNCj4gPiAgCQlyZXQgPSBwb2xsKCZwLCAxLCB0
aW1lb3V0X21zKTsNCj4gPiArCQlpZiAoZC0+cmVjZWl2ZWRfc2lnaW50KSB7DQo+ID4gKwkJCWQt
PmhhbmRsZWRfc2lnaW50ID0gdHJ1ZTsNCj4gPiArCQkJcHRocmVhZF9leGl0KE5VTEwpOw0KPiA+
ICsJCX0NCj4gPg0KPiA+IC0JCWlmIChyZXQgPT0gLTEpIHsNCj4gPiArCQlpZiAoIWQtPnJlY2Vp
dmVkX3NpZ25hbCAmJiByZXQgPT0gLTEpIHsNCj4gPiAgCQkJaWd0X2luZm8oInBvbGwgZmFpbGVk
IHdpdGggZXJybm8gJWRcbiIsIGVycm5vKTsNCj4gPiAgCQkJYnJlYWs7DQo+ID4gIAkJfQ0KPiAN
Cj4gSSBkb24ndCBnZXQgdGhpcy4gSWYgU0lHVEVSTSB3aWxsIGJlIHJlY2VpdmVkLCB3ZSdsbCBu
ZXZlciBwcm9jZXNzDQo+IG5lZ2F0aXZlIHJldHVybiBmcm9tIHBvbGwoKS4gU2hvdWxkbid0IHRo
aXMgbG9va3MgbGlrZToNCj4gDQo+IGlmIChkLT5yZWNlaXZlZF9zaWduYWwgJiYgcmV0ID09IC0x
KSB7DQo+IAlkLT5yZWNlaXZlZF9zaWduYWwgPSBmYWxzZTsNCj4gDQo+IAlpZiAoZXJybm8gPT0g
PykNCj4gCQljb250aW51ZTsNCj4gCWVsc2UNCj4gCQlicmVhazsNCj4gfQ0KDQpJdCBzb3VuZHMg
bGlrZSBhIGJldHRlciBpZGVhLCB0aGFua3MuDQoNCkRvbWluaWsgS2Fyb2wNCg0KPiANCj4gLS0N
Cj4gWmJpZ25pZXcNCj4gDQo+ID4gQEAgLTExNjgsNiArMTE4Myw5IEBAIHhlX2V1ZGVidWdfZGVi
dWdnZXJfY3JlYXRlKGludCBtYXN0ZXJfZmQsDQo+IHVpbnQ2NF90IGZsYWdzLCB2b2lkICpkYXRh
KQ0KPiA+ICAJZC0+ZmQgPSAtMTsNCj4gPiAgCWQtPm1hc3Rlcl9mZCA9IG1hc3Rlcl9mZDsNCj4g
PiAgCWQtPnB0ciA9IGRhdGE7DQo+ID4gKwlkLT5yZWNlaXZlZF9zaWduYWwgPSBmYWxzZTsNCj4g
PiArCWQtPnJlY2VpdmVkX3NpZ2ludCA9IGZhbHNlOw0KPiA+ICsJZC0+aGFuZGxlZF9zaWdpbnQg
PSBmYWxzZTsNCj4gPg0KPiA+ICAJcmV0dXJuIGQ7DQo+ID4gIH0NCj4gPiBkaWZmIC0tZ2l0IGEv
bGliL3hlL3hlX2V1ZGVidWcuaCBiL2xpYi94ZS94ZV9ldWRlYnVnLmgNCj4gPiBpbmRleCA4Zjdm
NjYyMjAuLjQ2Y2QzNDYzZSAxMDA2NDQNCj4gPiAtLS0gYS9saWIveGUveGVfZXVkZWJ1Zy5oDQo+
ID4gKysrIGIvbGliL3hlL3hlX2V1ZGVidWcuaA0KPiA+IEBAIC00NCw2ICs0NCwxMCBAQCBzdHJ1
Y3QgeGVfZXVkZWJ1Z19kZWJ1Z2dlciB7DQo+ID4gIAlwdGhyZWFkX3Qgd29ya2VyX3RocmVhZDsN
Cj4gPiAgCWVudW0geGVfZXVkZWJ1Z19kZWJ1Z2dlcl93b3JrZXJfc3RhdGUgd29ya2VyX3N0YXRl
Ow0KPiA+DQo+ID4gKwlib29sIHJlY2VpdmVkX3NpZ25hbDsNCj4gPiArCWJvb2wgcmVjZWl2ZWRf
c2lnaW50Ow0KPiA+ICsJYm9vbCBoYW5kbGVkX3NpZ2ludDsNCj4gPiArDQo+ID4gIAlpbnQgcF9j
bGllbnRbMl07DQo+ID4gIH07DQo+ID4NCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiA+DQo=
