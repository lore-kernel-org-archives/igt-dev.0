Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F3AC02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 13:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B44E10E41B;
	Mon, 20 Jan 2025 13:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NgQ4GCRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5515F10E41B
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 13:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737380621; x=1768916621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mMPcSV01OpJe3n0uhafrnJtUstpt9GQIHAezd3IlDs4=;
 b=NgQ4GCRdu9y5lsS7rO1tnhwp29tkCPtRUfYCIwatnpRogXeO1UcCmx6k
 JLyMJmPiBplHxJxEcmMHT1Kl+NliM0Pz0lFkmzNUOm/BtPYQwB0Jg7mUU
 wif3X6h1/qLP/BQHGcqvqsppIEoFbWtiRAnduwewXJQ/+MDaYqBHeBMKT
 aSw86DjylqvWn228JLOJzOY0RcaghhBiz5Fgf3hwIoG1Ms/WL3taWO7xa
 ExJjBoS6O2rDrGQgXaXWkx0HOYMIiv9l0j+PDsNlIl3BZUi7uImqtH921
 ouShkWir+fX1VSKw9Z5Rd4aWp5RapOy2ZhxkzDtgMDoDDw8cpprH0p9JT w==;
X-CSE-ConnectionGUID: ONQ5H0OXQSmHWJrenQ03jA==
X-CSE-MsgGUID: UXHcyU8mS6CKJl9IpMRqLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48767053"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="48767053"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:43:41 -0800
X-CSE-ConnectionGUID: wWkO6H+dR86qrzLxoTBQyw==
X-CSE-MsgGUID: ATTGPYalRnyHYkkQR74TxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="106536009"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 05:43:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 05:43:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 05:43:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 05:43:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pjs+eFI0zd97q5oY/DMcaDAtA5ptYqfpoOjuZwfnyYyFkqE08Q0Od341OxB7JvGv5sBkTFcOnw+HizJBeRih+KSZcylg7iNfgS6aGF4o0hZNU5uE8QxOaR+JGKkCp28zZWjc7RawN1Dw6Q0AOA5Q7iuPOMLizBV/Y5F8W+PwlG6FyGqF1B/kEc+YHVZD/H9KFN/FJLxO4uV1mN8O55DIEt218Dg3bYvoJG9O11rLIJ2qt0PScuQTPmIktOQ7px/Kc4qlvnWPmwf0cI/A64NpmzbBXPcr3v9Asme22RolhTj1de8uwqKFTz/l9I+MI423k3H6hkTfOQ2re0JPn+yqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mMPcSV01OpJe3n0uhafrnJtUstpt9GQIHAezd3IlDs4=;
 b=nJwhLMGMp4epw8ewJSpJKVktpcmext7bv0ngNUD2H9AryFI45gG05Ra5EzP4O6JQddBWls9SnYtwzx2NmM/avgMaiFp+oKNap8WYOY25snZR6yHbIBK1x5WIEjx2BhmSbSIJ4ZRPqz8T6qKwvKxMlUBDTLxtJ1Ksr4hx6ibugAI/hFbsU8/e5z9/SKxCinB6s5Wv2qIoMYXTtV7ZZjbxjcJhmpRQYrGHvh5qdCfipmltWVlBX/eBYxkEOO6clCBAc4hPqseayX3RTU+0XIgZi0V/hg/IJM5T9crck5hXMZgdhKsMOsbEgGA6/Vq7fxv9fD+7eNkgG+zwcfWWBXfHBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Mon, 20 Jan
 2025 13:43:36 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%6]) with mapi id 15.20.8356.017; Mon, 20 Jan 2025
 13:43:35 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv
Thread-Topic: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv
Thread-Index: AQHbaxP8BHhnJUnc40i1kFy0wlTj+bMfq8AAgAAARtA=
Date: Mon, 20 Jan 2025 13:43:35 +0000
Message-ID: <LV3PR11MB86958911A485C2EBAE12E7D1F9E72@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250120083410.26904-1-satyanarayana.k.v.p@intel.com>
 <20250120083410.26904-3-satyanarayana.k.v.p@intel.com>
 <Z45SciO11d9-aaxV@fdugast-desk>
In-Reply-To: <Z45SciO11d9-aaxV@fdugast-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|DM4PR11MB6118:EE_
x-ms-office365-filtering-correlation-id: 311da008-111e-464b-f559-08dd39587036
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?a1lrSnNLUXpoUkVna0tnS0dUT0lEUThoU0ZDRXd0Uk5HVFdoVzg5L2poQzNN?=
 =?utf-8?B?UUVvUFZQSnRoVFJNc2hPeE1JMHFYNUlGVUxwMm1IbTkvK1Ntb3oza3JVV1h6?=
 =?utf-8?B?WDRrTWZEVTB2eGdsR0dibGZJbFErQ3FnS0wwdHB6ZVhEMUhpN0dzWXBncVZj?=
 =?utf-8?B?eUJZNFh5Mm5CeE1wWmh3bmhPNkQvRzVpOXV3aDVsc01xWTBudnlIZnpoR2xC?=
 =?utf-8?B?bmZwNXJMNmRlUHZhNUhqZmpQa1lqbDdNY0QwL3E1eFp1THo2MGFUMlk3OXkv?=
 =?utf-8?B?Qm5RNFNjdkowbHcxL2p5UkF2eWh0ak52M1RCdTM1RllMMGFHcS9EZ1FwOEZE?=
 =?utf-8?B?L1NFNXBITEFseUVXVVJOVEVpU0xpb1ROL0s1bG9XTzVrY0dXOEZlUDN6N09x?=
 =?utf-8?B?TVdiS1BuNy9nRW9EakNkdmlzbzc5UW1FWURnSzVCVkNJa0Y2dzZ2MlZjcnNh?=
 =?utf-8?B?NVJvaXZVVnEyNW9YVmhSa3ZlMG1RS1VSK01kLys2bmdXM2NmVUFoY29NUHBs?=
 =?utf-8?B?QXhWRkVmQlpOdDlQektIbzJNNVFJV2RMSnlkZzFyUWdXYjVCTmF5ZVYvRGg1?=
 =?utf-8?B?N2JVZ0hKQmtrQ1VuT0NUQkNyZ1JJR3E0dlVmTEY1Z3YxcnBXS245a21oK3lQ?=
 =?utf-8?B?SUsvY1hodGwvekZLSnpIbDA5UEE1TUMvcU9sQjZHeGUrY3NLSlhFMnVrMGxy?=
 =?utf-8?B?V29pYk4vWHlkNVZ3ZEFEMUhnM282cysrQlZMbS9Oei9HbzY0ZVpxVjk1RDRS?=
 =?utf-8?B?MEFCWGprU0dxRVNZVTJPQXlrMER1RG5Ud3FpRHRzSFdaMHlIYWFIWUE4Q2x5?=
 =?utf-8?B?RXFKdmw2Q0R2a3ZvVTR5NWhyY1U4R3FLYWZyRE9BSHN6R2VGdmZXTE0wd2dN?=
 =?utf-8?B?Q1kvK2hIL0g2NnQydVlWY0NtckYzbmg3dDlSRDF4U0h0OHVIVmJJSWFxMlph?=
 =?utf-8?B?TlZ3NXdlbU14REpQUVh4ejVwYnNNc0I3MVhYd2p4eUZrYm03ZVVYa3hzT0cv?=
 =?utf-8?B?KzdETks4WUx2TUFqV0RrdXZyQVZjS3VkVGxuNi8rVXNNejhxblNGeUtvOHhy?=
 =?utf-8?B?czRzUzFHZWdjVWxGeXF6VFcxNlhhYVV6VU1QT1JSamw5bURMNTNiZmtzYWpn?=
 =?utf-8?B?Y2l3eDhpRDdPeTBLb0IxL0g2T3ROQ2FNSEN3azB3YVlFcTlIQXY2RFRoZGFC?=
 =?utf-8?B?MnB6N2ZOZ09TSFpSclFoWUJISHZYWStBZERqZzJBVlpWUXo1N2FrM0VVMFMy?=
 =?utf-8?B?eld3VVRQdDZqckRSd2JmaVp4VVdxMmYyUDJkSHVaeDZHc01jb1FnbEtOeDlV?=
 =?utf-8?B?cko3NCtWM08yQnF5OHR3VkRZYmJuS2FvYVhLVVhYcnh0ZWhPTEI3QmVKd2FP?=
 =?utf-8?B?ZHQzS2ZpSXBvQUdDb3pJb0VDazNsR3QyWUlNeUVSTERjZEk5ajRNY29YRmQ1?=
 =?utf-8?B?cVNrdXBIMmY0dGlZdFBGNWRHbTcybWFYczczejFxQXZWWHJydEd6a3lQd1hN?=
 =?utf-8?B?S1BoOTNFd1BJQ1FYbDRGS2NlcnhSd0hwZ1RpdGpzMU9hYWw2QmNsZk9KSGhH?=
 =?utf-8?B?b2VaTDUwNkl1cmxnNm9yQUlpeENSMEN1RWFKZTl0ZkU2TTkyVjRuVHFmU1pC?=
 =?utf-8?B?QURLUWRtY2daejludlpuVmRSYjI2eGdVYmRrVFlZdVNmcHI4VkUwK1B2d0VF?=
 =?utf-8?B?VTdvYzEwcTJFWmdHS0xlVkpGcnZXU1o2eE4vNTd4Ykl5c3lZRUZrd2V6UTJO?=
 =?utf-8?B?SnZ5ZHUzQ0Y0N1VlcnZjY0hLY0xPbWtSMUNKZFhoRVk4WDlHU3FLMmxBbmJI?=
 =?utf-8?B?blBoL0Z6K0xYN2o1QXFIbHpQWDhjOWpkZW5hcW5hMFpVZVRTN2M1bzIrbGhv?=
 =?utf-8?B?RUF2Y0t6SlNPSUs3ekY4N2dVazJsR1BqVUJzZjZ3bzJTOVVmNG9RWGtuM3VR?=
 =?utf-8?Q?i9kKZN/rauVgkvK+KdKuSRjkode5UGmn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUI2ZGRQajBKYnlCem9VdHB0a1B1Qm5BWmlsYlFWY0tJV0lPUCtlMUxoaXZE?=
 =?utf-8?B?cWlFZW5wM0JkUzgyQnhRd2pzS2dvQzRTWFJlQ25NaEtjZVV4QjJmcWhkTmRS?=
 =?utf-8?B?ZDFzcHYxaDIwblBrSytFNU0raVp2NFMzRER0S05YaGt6SktQTXRnMmVwVjJL?=
 =?utf-8?B?TVhacFc2dzhlRXE4YmVEY2VHOHF6SGZCNTRHcEdvUC93OFZ2NVd5OVVrYll3?=
 =?utf-8?B?dXZKMlg1YjkwL0dMNGcrU0g1ZHJPbDNnTkNMdW5sdDZPUCtFcVZPck01dzdJ?=
 =?utf-8?B?ditMWG5rSDBXRkdRdFErNkloa00yWXRSQ2dzbUpobUFKdi9saWZSUVgxSjBS?=
 =?utf-8?B?T1BXa3VSWmR6dUlOQzE0bWVIQkp1Y3BTbXp3cjduTFVMOHcxbmdkS2hIbFor?=
 =?utf-8?B?eUxBditlOUlyWnRKeFlNQUhRN3h6Y1huQnlDSzZ3bXJRSXdPbWd1VDNDak43?=
 =?utf-8?B?L2hkM3hUcEw5cjFsL3pSZ0FiYmdCS0xkQWRGbGtFQ0FObHRYeGNPQlR3eVV3?=
 =?utf-8?B?c1lTWTRKOFgzYktZM2R3ZDRraWlEcUJzS2JIK2JYeG9wQVFtdk45Z0ZBck5n?=
 =?utf-8?B?dFFnWmwzT2QvQW4wLytha3hnQUVlNVIvbFJUK0lyayt4eVdwMUE2Y2d2MmlT?=
 =?utf-8?B?cXp6Zi9aN2VaUkM2cXdkQXdlNkowZE13Y1oxS3k5WXNiWFpkZE5peHpnU2th?=
 =?utf-8?B?L0RkRmdacS9xYzFtT3ZxWjJXQUdMUjJoWTcrdEdhVGs5UkVSOEw3dm1NS2Rw?=
 =?utf-8?B?L01rNUpyTWZ1R3hxZlRVMUp4TXVWV25naU4rWGJDQnI4ZmVKWFlxeDJ6YU1Y?=
 =?utf-8?B?TWp0YXdkcHBvOGozQ05lYzdXTmRib3dlUjR6RU9wSDdGRks5TVgybHFzaXhl?=
 =?utf-8?B?aUJVZXdwUS9yNzlkL1EycE5sRHlONXdNSndZL01ocjFOWmp2cXBtRkRXT0tH?=
 =?utf-8?B?Z3RTbTcwanFhL1gwVXgxKzBYQTdJbWdKbEloeUZiN0dUTmRhR2g1VTh5dmdh?=
 =?utf-8?B?V21PazZYQzQ1WkI0MU9aaXJEekhpQ0lZMGFuL3Z5c3J5M1ZpaDFaVjM4RUNY?=
 =?utf-8?B?NWc3VkRickYvYTlIRktXT0FaamJSMjR3bzYrZ1JxWEVUcUZhRUpEdDBxZDBL?=
 =?utf-8?B?dVR5YTdaUmwzNzJPSlhRK1FQODZELzZqbDNsRzNlM0p5Uml4cUZoclN2VXhV?=
 =?utf-8?B?ZzMwVGFaVEFVSVlzeVE2bkxiSnZ4OU5XUUVndTNsaHVMbDFUR1BCVmFGUnJP?=
 =?utf-8?B?TE8zYm1mSmdyRlVtRHhWQmI0UGNRVHBMMS9ST0VHSnluTU9BVEhVS2FtTkRW?=
 =?utf-8?B?VGFuZXlkUUxZOWJvY2NEZlUvZWF4SDZOQ3c4Y3ZzYWpJWHJPZTA2UEJIcFdO?=
 =?utf-8?B?UTFQWmgyTkFDaHI4Ym5uMzI3cHFkSVlXTkY3SjVud01WaWp3OE9nZkppME5C?=
 =?utf-8?B?eEFDZDRaQWRybmkrcWFSQjFzOW9qRy9Wdy91alE1bnRUVld1SFRwZk0rT01E?=
 =?utf-8?B?YkRnekhhSWt4SFRJL2txUE4rSFhIZVhQY3o0V09GcVpqN3ZlNnhNYitUakVF?=
 =?utf-8?B?bGROQVV4OHZiSUgwRmlvUFkvV0pjSUpGRG9odFdwMFc2REhZcEV6d1NXRlFj?=
 =?utf-8?B?Wk9UYnptN2U5aFlDTUtseFo2UXRTajR0NlBqVWRxUTNheGlOWnF4MUNyYXhr?=
 =?utf-8?B?eVFsZFJhbFlWeWdlbTZwdTdKbW1mQ2Y1V3ozcU40RHhVYjMwZWZIZnlUbzFo?=
 =?utf-8?B?eTVmK3FpNVlzc3JaY0RYblZjQ2lqbUhCY0c2eXJIOWozbHJrVVBRaE1JQjdt?=
 =?utf-8?B?UDJRUFNGQTNHdUhsMkJhOTNlclJURndHUmMvUmYvSUJpclIyZWdmdmpUcGQ4?=
 =?utf-8?B?bHd6NWdFWURCYlR1QjRCTitPOW93ZEZqemZtUUxkV3pmZ0JOY2J4aFdyUmdZ?=
 =?utf-8?B?bUZOeFBaTmxLdEtIYzdQWW1yaURaL2JocUI3OW9hMDB6SFBYTjF0UzhoaXI4?=
 =?utf-8?B?SzN4S29hOTRtbVpBUVFCMmpTUGt4Wno3bXhoeC9mU3FOMVdMMzlsUW9lYUhT?=
 =?utf-8?B?cWxVYzllMkxjTmtMc1QyOWdHZFlnaDg4RFdGSWZHa2wzRU5OT2lpWHBFS2NK?=
 =?utf-8?B?YnE2Wk1CbFdhcFBXVktZcVBaaytQY0I2VXJCeERUSVA1a0EwZG9IOE5OakFy?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 311da008-111e-464b-f559-08dd39587036
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 13:43:35.8733 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4OH5lam7TB1D2ZYD41R26oHyzueP0YBUvp9/bUGxruiG8DAoCgpXcc+kR8mPCuSM4tVALW0jdtCbNFhmWZoV59Iz/HJu1cR0LoG9QiZNlc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEdWdhc3QsIEZyYW5jb2lzIDxm
cmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIEphbnVhcnkgMjAsIDIw
MjUgNzoxMSBQTQ0KPiBUbzogSyBWIFAsIFNhdHlhbmFyYXlhbmEgPHNhdHlhbmFyYXlhbmEuay52
LnBAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEJyb3N0
LCBNYXR0aGV3DQo+IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IFdhamRlY3prbywgTWljaGFs
DQo+IDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBp
LWctdCB2MiAyLzJdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjogSW5qZWN0IGVycm9y
cw0KPiBkdXJpbmcgeGVfZ3VjX2N0X3NlbmRfcmVjdg0KPiANCj4gT24gTW9uLCBKYW4gMjAsIDIw
MjUgYXQgMDI6MDQ6MTBQTSArMDUzMCwgU2F0eWFuYXJheWFuYSBLIFYgUCB3cm90ZToNCj4gPiBV
c2UgdGhlIGtlcm5lbCBmYXVsdCBpbmplY3Rpb24gaW5mcmFzdHJ1Y3R1cmUgdG8gdGVzdCBlcnJv
ciBoYW5kbGluZw0KPiA+IG9mIHhlIGF0IGVuYWJsaW5nIG9mIFZGcyBzdGFnZSB3aGVuIGV4ZWN1
dGluZyB4ZV9ndWNfY3Rfc2VuZF9yZWN2KCkNCj4gPiBzbyB0aGF0IG1vcmUgY29kZSBwYXRocyBh
cmUgdGVzdGVkLCBzdWNoIGFzIGVycm9yIGhhbmRsaW5nIGFuZCB1bndpbmRpbmcuDQo+ID4NCj4g
PiBFcnJvciBjYW4gYmUgaW5qZWN0ZWQgdXNpbmc6DQo+ID4gaWd0QHhlX2ZhdWx0X2luamVjdGlv
bkBlbmFibGUtdmZzLWZhaWwteGVfZ3VjX2N0X3NlbmRfcmVjdg0KPiA+DQo+ID4gdjI6IFVwZGF0
ZWQgZ3VjX2ZhaWxfKiB0byBlbmFibGVfdmZzXyoNCj4gPiBBZGRlZCBpZ3Rfc2tpcF9vbighaWd0
X3NyaW92X2lzX3BmKGZkKSkgdG8gc2tpcCB0ZXN0IHdoZW4gcnVuIHdpdGhvdXQNCj4gPiBlbmFi
bGluZyBzcmlvdi4NCj4gPg0KPiA+IENjOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGlu
dGVsLmNvbT4NCj4gPiBDYzogTWljaGHFgiBXYWpkZWN6a28gPG1pY2hhbC53YWpkZWN6a29AaW50
ZWwuY29tPg0KPiA+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5jb2lzLmR1Z2FzdEBpbnRlbC5j
b20+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2F0eWFuYXJheWFuYSBLIFYgUCA8c2F0eWFuYXJheWFu
YS5rLnYucEBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2lu
amVjdGlvbi5jIHwgNjMNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyBiL3Rlc3RzL2ludGVsL3hlX2ZhdWx0X2lu
amVjdGlvbi5jDQo+ID4gaW5kZXggM2EwZTJhYTI5Li41NjYxNmVlMTcgMTAwNjQ0DQo+ID4gLS0t
IGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiArKysgYi90ZXN0cy9pbnRl
bC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IEBAIC0xOSwxMiArMTksMTQgQEANCj4gPiAgI2lu
Y2x1ZGUgImlndF9zeXNmcy5oIg0KPiA+ICAjaW5jbHVkZSAibGliL2lndF9zeW5jb2JqLmgiDQo+
ID4gICNpbmNsdWRlICJsaWIvaW50ZWxfcGF0LmgiDQo+ID4gKyNpbmNsdWRlICJsaWIvaWd0X3Ny
aW92X2RldmljZS5oIg0KPiA+ICAjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gPiAgI2luY2x1
ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4NCj4gPiAgI2RlZmluZSBJTkpFQ1RfRVJSTk8JLUVOT01F
TQ0KPiA+ICAjZGVmaW5lIEJPX0FERFIJCTB4MWEwMDAwDQo+ID4gICNkZWZpbmUgQk9fU0laRQkJ
KDEwMjQqMTAyNCkNCj4gPiArI2RlZmluZSBOVU1fVkZTCQkxDQo+ID4NCj4gPiAgZW51bSBpbmpl
Y3Rpb25fbGlzdF9hY3Rpb24gew0KPiA+ICAJSU5KRUNUSU9OX0xJU1RfQURELA0KPiA+IEBAIC0y
ODEsNiArMjgzLDU1IEBAIHZtX2JpbmRfZmFpbChpbnQgZmQsIGNvbnN0IGNoYXIgZnVuY3Rpb25f
bmFtZVtdKQ0KPiA+ICAJaWd0X2Fzc2VydF9lcShzaW1wbGVfdm1fYmluZChmZCwgdm0pLCAwKTsN
Cj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgc3Jpb3ZfZW5hYmxlX3ZmcyhpbnQgZmQsIGlu
dCBudW1fdmZzKQ0KPiA+ICt7DQo+ID4gKwlpbnQgc3lzZnM7DQo+ID4gKwlib29sIHJldDsNCj4g
PiArDQo+ID4gKwlzeXNmcyA9IGlndF9zeXNmc19vcGVuKGZkKTsNCj4gPiArCWlndF9hc3NlcnRf
ZmQoc3lzZnMpOw0KPiA+ICsNCj4gPiArCXJldCA9IF9faWd0X3N5c2ZzX3NldF91MzIoc3lzZnMs
ICJkZXZpY2Uvc3Jpb3ZfbnVtdmZzIiwgbnVtX3Zmcyk7DQo+ID4gKwljbG9zZShzeXNmcyk7DQo+
ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAq
IFNVQlRFU1Q6IGd1Yy1mYWlsLSVzDQo+IA0KPiBIaSwNCj4gDQo+IFRoZSB0ZXN0IG5hbWUgbXVz
dCBiZSB1cGRhdGVkIGluIHRoZSBkb2N1bWVudGF0aW9uIGFzIHdlbGw6DQo+IA0KPiAgICAgRVJS
T1I6IE1pc3NpbmcgZG9jdW1lbnRhdGlvbiBmb3IgaWd0QHhlX2ZhdWx0X2luamVjdGlvbkBlbmFi
bGUtdmZzLWZhaWwtDQo+IHhlX2d1Y19jdF9zZW5kX3JlY3YNCj4gICAgIEVSUk9SOiBVbm5lZWRl
ZCBkb2N1bWVudGF0aW9uIGZvciBpZ3RAeGVfZmF1bHRfaW5qZWN0aW9uQGd1Yy1mYWlsLQ0KPiB4
ZV9ndWNfY3Rfc2VuZF9yZWN2DQo+IA0KVXBkYXRlZCBhbmQgcHVzaGVkIFYzIHBhdGNoLg0KPiA+
ICsgKiBEZXNjcmlwdGlvbjogaW5qZWN0IGFuIGVycm9yIGluIGZ1bmN0aW9uICVhcmdbMV0gdXNl
ZCB3aGVuIHhlIGludGVyYWN0cw0KPiB3aXRoIGd1YyB0byBtYWtlIGl0IGZhaWwNCj4gPiArICog
RnVuY3Rpb25hbGl0eTogZmF1bHQNCj4gPiArICoNCj4gPiArICogYXJnWzFdOg0KPiA+ICsgKiBA
eGVfZ3VjX2N0X3NlbmRfcmVjdjogICAgICAgICAgICAgICB4ZV9ndWNfY3Rfc2VuZF9yZWN2DQo+
ID4gKyAqLw0KPiA+ICsNCj4gPiArc3RhdGljIHZvaWQNCj4gPiArZW5hYmxlX3Zmc19mYWlsKGlu
dCBmZCwgaW50IG51bV92ZnMsIGNvbnN0IGNoYXIgZnVuY3Rpb25fbmFtZVtdKQ0KPiA+ICt7DQo+
ID4gKwlib29sIGF1dG9wcm9iZV9lbiA9IDA7DQo+ID4gKw0KPiA+ICsJaWdub3JlX2ZhdWx0c19p
bl9kbWVzZyhmdW5jdGlvbl9uYW1lKTsNCj4gPiArCWluamVjdGlvbl9saXN0X2RvKElOSkVDVElP
Tl9MSVNUX0FERCwgZnVuY3Rpb25fbmFtZSk7DQo+ID4gKwlzZXRfcmV0dmFsKGZ1bmN0aW9uX25h
bWUsIElOSkVDVF9FUlJOTyk7DQo+ID4gKw0KPiA+ICsJYXV0b3Byb2JlX2VuID0gaWd0X3NyaW92
X2lzX2RyaXZlcl9hdXRvcHJvYmVfZW5hYmxlZChmZCk7DQo+ID4gKw0KPiA+ICsJaWYgKGF1dG9w
cm9iZV9lbikNCj4gPiArCQlpZ3Rfc3Jpb3ZfZGlzYWJsZV9kcml2ZXJfYXV0b3Byb2JlKGZkKTsN
Cj4gPiArDQo+ID4gKwkvKiBpZ3Rfc3Jpb3ZfZW5hYmxlX3ZmcyBjYW4ndCBiZSB1c2VkIGhlcmUg
YXMgaXQgaXMgY2F1c2luZyBhYm9ydCBvbiBhbnkNCj4gZXJyb3IuDQo+ID4gKwkgKiBTaW5jZSBl
cnJvciBpbiB0aGlzIHRlc3QgaXMgZXhwZWN0ZWQsIHdlIGhhdmUgd3JpdHRlbiBvdXIgb3duIHN0
YXRpYw0KPiBmdW5jdGlvbiBoZXJlLg0KPiA+ICsJICovDQo+ID4gKwlzcmlvdl9lbmFibGVfdmZz
KGZkLCBudW1fdmZzKTsNCj4gPiArDQo+ID4gKwlpZ3RfYXNzZXJ0X2VxKC1lcnJubywgSU5KRUNU
X0VSUk5PKTsNCj4gPiArCWluamVjdGlvbl9saXN0X2RvKElOSkVDVElPTl9MSVNUX1JFTU9WRSwg
ZnVuY3Rpb25fbmFtZSk7DQo+ID4gKw0KPiA+ICsJaWYgKGF1dG9wcm9iZV9lbikNCj4gPiArCQlp
Z3Rfc3Jpb3ZfZW5hYmxlX2RyaXZlcl9hdXRvcHJvYmUoZmQpOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICBpZ3RfbWFpbg0KPiA+ICB7DQo+ID4gIAlpbnQgZmQ7DQo+ID4gQEAgLTMxOSw2ICszNzAsMTAg
QEAgaWd0X21haW4NCj4gPiAgCQl7ICJ4ZV92bWFfb3BzX2FsbG9jIiB9LA0KPiA+ICAJCXsgfQ0K
PiA+ICAJfTsNCj4gPiArCWNvbnN0IHN0cnVjdCBzZWN0aW9uIGVuYWJsZV92ZnNfZmFpbF9mdW5j
dGlvbnNbXSA9IHsNCj4gPiArCQl7ICJ4ZV9ndWNfY3Rfc2VuZF9yZWN2IiB9LA0KPiA+ICsJCXsg
fQ0KPiA+ICsJfTsNCj4gPg0KPiA+ICAJaWd0X2ZpeHR1cmUgew0KPiA+ICAJCWlndF9yZXF1aXJl
KGZhaWxfZnVuY3Rpb25faW5qZWN0aW9uX2VuYWJsZWQoKSk7DQo+ID4gQEAgLTMzNSw2ICszOTAs
MTQgQEAgaWd0X21haW4NCj4gPiAgCQlpZ3Rfc3VidGVzdF9mKCJ2bS1iaW5kLWZhaWwtJXMiLCBz
LT5uYW1lKQ0KPiA+ICAJCQl2bV9iaW5kX2ZhaWwoZmQsIHMtPm5hbWUpOw0KPiA+DQo+ID4gKwlm
b3IgKGNvbnN0IHN0cnVjdCBzZWN0aW9uICpzID0gZW5hYmxlX3Zmc19mYWlsX2Z1bmN0aW9uczsg
cy0+bmFtZTsgcysrKQ0KPiA+ICsJCWlndF9zdWJ0ZXN0X2YoImVuYWJsZS12ZnMtZmFpbC0lcyIs
IHMtPm5hbWUpIHsNCj4gPiArCQkJLyogU2tpcCB0aGUgdGVzdCBpZiBub3QgcnVubmluZyB3aXRo
IFNSSU9WDQo+ID4gKwkJCSAqLw0KPiANCj4gSXMgdGhlcmUgYW4gYWNjaWRlbnRhbCBuZXdsaW5l
IGJldHdlZW4gdGhlIGV4dHJhIHdoaXRlIHNwYWNlIGFmdGVyICJTUklPViINCj4gYW5kICIqLyIg
b24gYSBuZXcgbGluZT8NCj4gDQpXYXMganVzdCB0cnlpbmcgdG8gZm9sbG93IHN5bnRheCBndWlk
ZWxpbmVzLiBJbnRlbnRpb25hbGx5IGFkZGVkICovIGluIHRoZSBuZXcgbGluZS4NCj4gPiArCQkJ
aWd0X3NraXBfb24oIWlndF9zcmlvdl9pc19wZihmZCkpOw0KPiA+ICsJCQllbmFibGVfdmZzX2Zh
aWwoZmQsIE5VTV9WRlMsIHMtPm5hbWUpOw0KPiA+ICsJCX0NCj4gPiArDQo+ID4gIAlpZ3RfZml4
dHVyZSB7DQo+ID4gIAkJeGVfc3lzZnNfZHJpdmVyX2RvKGZkLCBwY2lfc2xvdCwgWEVfU1lTRlNf
RFJJVkVSX1VOQklORCk7DQo+ID4gIAl9DQo+ID4gLS0NCj4gPiAyLjM1LjMNCj4gPg0K
