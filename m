Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2711ACA5FA5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 08:04:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B496610F5B5;
	Thu,  1 Oct 2026 08:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZGDzP05Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDB610E443;
 Thu,  1 Oct 2026 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790841800; x=1822377800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tVo5dq4Xbxl43IiGNJdG/CL9RBLxkORjrERIYmhb9KQ=;
 b=ZGDzP05Z3RVnYPulWjCUTnxCNuHSdIB98jU6u9XnMJcF51bXu+BuiZO2
 KCTSRJkb4fOJ4ueigB63Yx25/t1FSLSuW3fKKEpQLiVfoZ61VDDlOGTjJ
 D1gEovGwXmkFjaZRfy1FpyjC4HUZhgC9vf57EqV/1p0/s+RELl4WBV6V+
 hfDy1DmZDiTa/aYzKIm3phCJPNDTTXWfdnWR9FtymoPHKpDLa8fr2IMc0
 SSZM+aUHNmu5BbIwQDAOuYkuluyUutI0c2PyUU8oksP1H1B3syYhHHMno
 fOLRJCkiFI5Ji49QK7TIZXbxjK2tEm8uBh9mvwX24hq6gXaQD22qwKZKr Q==;
X-CSE-ConnectionGUID: 6NFbH/iFR/upzyFAcucE5g==
X-CSE-MsgGUID: 7FxwSL9wRgCWTTR5WxJ4JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="100924477"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="100924477"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:03:20 -0700
X-CSE-ConnectionGUID: Khg1g+0KSE2Yf0tuUV641A==
X-CSE-MsgGUID: A/Ui0ga4TeCwvDmZSOSIXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="305436166"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 01:03:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:03:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 01:03:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 01:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h97A2yJimOPkYt3zJ+1NXDJrtT7jmk7NwK5PdgG2FybGb67hIIDVX6f8SaY3zTj3J5B3PKgQyOgEI06Alm2ek2gMuou6cjGOR0me29uIPAAtWCgttldl+4dBXgNNEbFyILCnBR4xM7d5Je+F2r4LNPGDfkNPb9jfInZNYdfxYb8Endhr3neIUfQRseKdL9F4X/5vUfTfgGlrimsrtz4ly2pAnTn8+srtSkISNqKHEJWnEWlFY5lgoqb+HJra8EfRFuD1WsHrvvWG6g0ARcPOr6RYcpGJM2OhFhnc035e1fDAZ1mIjI5sBSZpUNjGdEhlm7KlkaF8xUAmhbsBW4cMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVo5dq4Xbxl43IiGNJdG/CL9RBLxkORjrERIYmhb9KQ=;
 b=rlINZx02avp/GnVl/VXptLvysCX6Vcl5waYZzd63qLHal8imr0MFb4Vz7GnjRY5HueHCigjUhBYp0R7XFiUfAHWLXjuiD7m3+2feOBdj6N6Y2kSoDO3ZhpsEm9+of/NresrKUD0dmyYl42DMJv6wMIVLeEGKi9B0uucw80WzZNW2SDi4SM5m1Xjkr0evvQ7uIdFhWYWjAHdSIKB4IoP+1+tLap5a/WXf+ZEuBaTu35o+NpXk2V0xqqOxRpdcYRsUqsSzVNRApJ37+8mXaXw5ccjn7K6vELvxpQCFxdxUbXTBqI2PYWWRE0qrgDX31oN4I64tJ2EGZX56DjZwMUZdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 08:03:06 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 08:03:06 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgUHJlc2VydmUgY29u?=
 =?utf-8?Q?st_qualifiers_in_string_parsing_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciBQcmVzZXJ2ZSBjb25zdCBx?=
 =?utf-8?Q?ualifiers_in_string_parsing_(rev2)?=
Thread-Index: AQHdUOdjHfSqCe+4O0mQYuguPv0q07boQ6ig
Date: Thu, 1 Oct 2026 08:03:05 +0000
Message-ID: <CH0PR11MB549174793897690E621DFB4BEF8A2@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260929154950.838280-1-alex.hung@amd.com>
 <179070448303.220377.7903552641769054130@61270ab9df2a>
 <20260930142402.yu3drfevijqhgm22@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260930142402.yu3drfevijqhgm22@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|DS0PR11MB7357:EE_
x-ms-office365-filtering-correlation-id: f38a1c0b-bc68-4520-e055-08df1f926cbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10070799003|22082099003|18002099003|13003099007|38070700021|4143699003|6133799003|10067099003|5023799004|11063799006|56012099006;
x-microsoft-antispam-message-info: fG0wtdLN9zQ+ZUmbJOydpZIlO1FuPeFExiaX5o0OV9iQSkE6xXHaQXD1xzNm6ovWxbEpR9o8Ch9lxiacDc9RxjNZSRpfoMHNRK2a+5SXFj2IQDav+Qq9bYwOCKDpblwQdxNFzl5OzMO2J5SpzVuRJo9psgB8oPm7VBKyUShn/DSeURBOm7A/ABQpUX8H0HHrwAVLcJcYTbLgviU1qxnPb4tnrZtE6qzkR8v+/pfNKmWlCZiSB9QBx4gUNSSb1y1xsl92hbjWZu6g0njuQK8khbnDygja2ii94h/MGc/AvbuNiZq4GOpQVcoWEoSEvqr4b/MYE9TEPmVs7s4AMgds9qX3qAhXkbHy9UcV1Bh72WEGxWkMPlhjc6A+D4lqekf3ZNPQxRLaux/iIvZ4vWBerKsbohEgX9TbQnD4YWN9dONLYtD7K3/u+Y3Ec3id+CduwWa6cfB51CC44erRy6nJuSHtaQ4Uta6eKb7b+CdeQ9dB/gS+ynb2eD/pcdssiXppKYLaJrmWotQlkqVtnbUJaFdi2ynen0WVOGIgruDp6HasV/n4O3tExYPEmaLZwx4YgTC+yhww0IGP8eZlayKO/VZJ5eLBfkkYKLw2jc0dg9HMEaYfM2KSBkJdtJgaevCt4ik4ixv786Ty3jIK1Z8TqUIs7dZBEeaG7DWtW2L2FSo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10070799003)(22082099003)(18002099003)(13003099007)(38070700021)(4143699003)(6133799003)(10067099003)(5023799004)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2tHRnhmUndpbVRaMVgyNEMwajdWaG50ek0xL3ZxWGhXcTl0bWlHZHY4bXhz?=
 =?utf-8?B?SlBBeko3RmdNT1pTREphZmRiOXpoVzROUUM0V0dEVno0M21mUWwzdFBDNHZ5?=
 =?utf-8?B?bURFWnJOTG1VV21WUUxabTJoQml1dTBMWnBBb2Y0VnF0QmtaWUMwM1J3Qy9R?=
 =?utf-8?B?MlhUQnVNUU1NVU1CUVRDREs3Mk9hczVlRUdMRFBXT2pwd0JOQ3lxRTNCZStD?=
 =?utf-8?B?a25QS0J2d3Vqb1IybFhhMUJLSHhKcHRRT05pWWhyQWNjOHcya1pqTkhKVDJH?=
 =?utf-8?B?WGJBTXRPUzQ2dUQ1eldiNENpa1MwN2dZKzNxYTRsK3RFM0t1V0o1WmRSSmVV?=
 =?utf-8?B?WnJWYVFJVkU1VXB6Y2hGRS9OVlNXQXlpNVRSa1NMcHdWcEVwS0VndEVaSUNN?=
 =?utf-8?B?WmZKdHJkUjE4aVpNdUJiYlYxVEtaZjRsMzhtWUFsZDNVcEhjRWtmRVFTckxh?=
 =?utf-8?B?UFFtZ3hmZWJLWXVjS1ZEMWdHUml3Z2FOSVdFUTB1aU5MSDB2RGM3Y05DNHVL?=
 =?utf-8?B?ZGFvaXRLdWhmQWdQYnpsOUNRYWswU1FnWVNwRDA0R2Jland5V3hFSTZPYXlU?=
 =?utf-8?B?MkRXS2JVMk16Q2VMTzJJbmF2cjVQTDVVMmhhT3JTZUs2aW5iNlhKS3M5aC8w?=
 =?utf-8?B?SHNTT1R5MDlZNSs5Q21VdE5nc0lqR0ZVdnNCRWExMHJUcms2ZHRWT3I5bGdF?=
 =?utf-8?B?ZklDZDJ1ejdOWXl5UktlVk4zQnlXRmo4RHhZMWNjQjRWcmF3MFkwMFZjbjFQ?=
 =?utf-8?B?Tml5VGROWklQSWRGRCthbkRRL0doOHRjVm9JdXloR1BqVlJYUGdFSHNNYWpp?=
 =?utf-8?B?R2E2Qk93TURycU5qWjdqN0JyVDlMZHBwS1NxMkFtWEZxczlaTFV6TjYwYkF4?=
 =?utf-8?B?MWlpZitmUmk5M21Gek4xQ0lid1R6Rk1xS21rUWRBQncvbFBUc0dMWCs0NWww?=
 =?utf-8?B?V1VvbG1GamwxN2pXcmFRMXBKMk1XMFlNWFRPeDAycWV1TTJPbkV5K2VDRytF?=
 =?utf-8?B?c3VpTktrYU5SM1EwNUl6S3AwMXM0bE1uR1VSeWFrbDE5bHltdnIrdjc1Sjhy?=
 =?utf-8?B?N01ucGVVQXlvaEZWS3RrUFF3aGlpTllMc2NCVG0wZXhVdU9JaFNIU09CUi9P?=
 =?utf-8?B?R0hlZGlwc2dQVGRueVZoMy9DUUlZV0I5bE1lZUZ6NUQvVXhVMS9DUjNwS2VU?=
 =?utf-8?B?YUJkbEZQY2VTdTU3eHR4YndXeHNZYVhKdFZEK3M2NVQvUzk1bWVteC8wUTlT?=
 =?utf-8?B?Q0VsdXFvU3QvUkJ5S0VqeTRheDhHb01SZy81TXVHWFhzazZKc21KMzlTT3ZQ?=
 =?utf-8?B?eENUazlkRytwWUZ1ZUNlbG1PaU9meEo5eDd5cU91UTVDbzZSSG8zRmdEdFdk?=
 =?utf-8?B?ZzF6TDNTVUZpeXhlYnZSSEw2NDBxcHpOeU9GZDRLUTN1WENONnJmd0VsS3E5?=
 =?utf-8?B?RXQ2Vnp5SkV5UkxDWHRFeHYvVTZuUkp3SVNCcHZXNkxxbDJUZElBR3Y2c1VL?=
 =?utf-8?B?RHpxSHNXRXMzSk9YVVRCTU5hQnlmYWdWVDlJeU8ycEFmY09GeFlPVlVFM0hJ?=
 =?utf-8?B?QmVaQkVnTG5SdHFiZm15bmZLUkZ1YXJqUkFGaXFyMm1yNW5VMzRYaldHYWZa?=
 =?utf-8?B?VXdPdTBhZjYzNkRyZGRZeDhJVUZDZk5TMWJrR21oVjRxSnllS1Y0bURCU0JK?=
 =?utf-8?B?NlN5LzFQWXRvQ0YvQWdURTNBM2xUTDdrRUNna3czS1N3QkJ5SGJZeDVFQmk2?=
 =?utf-8?B?SzJidFdLWmluU3VidnBSQlptWGNMbTkyZEIybmdEeGtYMDI4dm1tQzN4citB?=
 =?utf-8?B?bFVYSTNFT2tPK0tzRkVSYmtRYnpmVzZOVmFlYWNIcjJUcU8zcDRTajd0K3pQ?=
 =?utf-8?B?SUd5eFNzUkFDM21EeSs1dEIwdUEvZkRYU2pDczM3SVRYSk5URXVjcm5uNTky?=
 =?utf-8?B?b1VmS2NkWFduV1dWbDQ2bHFSQ2dNVDZYTUo2cWg1Uks4b29JRkhLREpsdmxm?=
 =?utf-8?B?TDBkMlU0dkN1aVRLZklsS1hZZksvbWhsak9vRUsxZG52VjJ3WUNtSEZTSUVa?=
 =?utf-8?B?Y2JVd3VYbnBQUXEwNUdqcjZIcVU3M0tRclV5R0JMd25PcXJUTEwxbEVwV0Uy?=
 =?utf-8?B?V08vOFZ2QnEvMnlZMXlHNVVIaVA5dm5xSjF1eU52MExWQjJ1UUd0RUVhVloy?=
 =?utf-8?B?TDRKOXNQKzVnSXcxeExDeGVpOVgvL21wS1hHMG1WOEo5czFFV2RETFZmSzdP?=
 =?utf-8?B?YXNDWllPZ0g3L3RqUEJrZFRZaDZaNkkxclFZNkZkVnJWMDZtczFMN25GMW4y?=
 =?utf-8?B?SUt2U0MzVnI3TUFkcm5odEJCNUJmQUFGK2NXU1k1K1UzZHRFTkVnV0RBYVRR?=
 =?utf-8?Q?gbvIUsyuM+4al4Wij0sBPspKlFfCJ6y2YWwwjFOCMM3uz?=
x-ms-exchange-antispam-messagedata-1: 1gPEEkAk3Y4k8A==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TL2eP06QD71EvPHQ1zGtn2HZN3nWl4VO449+8JF/vsb9zkxpXUZ++JeClJyBOrufwDOOXI4SE0sFravKfrmwCIGevbsHr/B0MNaWik+kvQ0RvA08OO2zjoj6VkYMjGVXRLhnJdZguQQB61ieLVhoShjkAKZW5Femec4a9U8Cniz2X6MvIF8Q1kiwEpYEzZMnkRXWDVtWlsuUWzlSU6ZMVUzUecACQfVrnz9bCMpRiwQcxaOgmdSL04Gg5d4UjMqkvTLop/BU4qt2WSRtMu5aKetLdUlSBbNorV3g+f4JR+ue5+Qp0hHAffCWXYjMFgBtefsaPnEFi6Tqk+HYGvrc4A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f38a1c0b-bc68-4520-e055-08df1f926cbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 08:03:05.9669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iDnT4lXkjE9Jt9RPoWAflOv9Gpkkgz8BDL+2clqHctOa2LbMeWnMDAPDv/E+0sqtW9gRMy3i0RDWHjsHrGhzC9JuCTCRG9k0+ezPUbjn05U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTc1MDE5Lw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pu
eQ0KU2VudDogMzAgU2VwdGVtYmVyIDIwMjYgMTk6NTQNClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IEFsZXggSHVuZyA8YWxleC5odW5nQGFtZC5jb20+OyBJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDog
ZmFpbHVyZSBmb3IgUHJlc2VydmUgY29uc3QgcXVhbGlmaWVycyBpbiBzdHJpbmcgcGFyc2luZyAo
cmV2MikNCg0KSGkgaWd0LWRldiwNCk9uIDIwMjYtMDktMjkgYXQgMTc6NTQ6NDMgLTAwMDAsIFBh
dGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogUHJl
c2VydmUgY29uc3QgcXVhbGlmaWVycyBpbiBzdHJpbmcgcGFyc2luZyAocmV2MikNCj4gVVJMICAg
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3NTAxOS8NCj4gU3Rh
dGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hh
bmdlcyBmcm9tIElHVF85MTE2IC0+IElHVFBXXzE1OTE5IA0KPiA9PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+IA0KPiBTdW1tYXJ5DQo+IC0tLS0t
LS0NCj4gDQo+ICAgKipGQUlMVVJFKioNCj4gDQo+ICAgU2VyaW91cyB1bmtub3duIGNoYW5nZXMg
Y29taW5nIHdpdGggSUdUUFdfMTU5MTkgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+ICAgdmVyaWZp
ZWQgbWFudWFsbHkuDQo+ICAgDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2Vz
IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJ
R1RQV18xNTkxOSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50IHRoaXMg
bmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJ
Lg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tdGlwL0lHVFBXXzE1OTE5L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lwYXRpbmcg
aG9zdHMgKDM4IC0+IDM3KQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+
ICAgTWlzc2luZyAgICAoMSk6IGJhdC1kZzItMTMgDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVz
DQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hh
bmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xNTkxOToNCj4gDQo+
ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMj
Iw0KPiANCj4gICAqIGlndEBpOTE1X3BtX3JwbUBtb2R1bGUtcmVsb2FkOg0KPiAgICAgLSBiYXQt
YXJsaC0zOiAgICAgICAgIFtQQVNTXVsxXSAtPiBbSU5DT01QTEVURV1bMl0NCj4gICAgWzFdOiBo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF85MTE2L2JhdC1hcmxo
LTMvaWd0QGk5MTVfcG1fcnBtQG1vZHVsZS1yZWxvYWQuaHRtbA0KPiAgICBbMl06IA0KPiBodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzE1OTE5L2JhdC1hcmxo
LTMvaWd0QGk5DQo+IDE1X3BtX3JwbUBtb2R1bGUtcmVsb2FkLmh0bWwNCj4gDQoNClVucmVsYXRl
ZCwgcGxlYXNlIHJ1biBGVUxMIGk5MTUgdGVzdHMuDQoNCg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0K
PiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRo
ZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzE1OTE5IHRoYXQgY29tZSBmcm9tIGtub3duIGlzc3Vl
czoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgZml4ZXMg
IyMjIw0KPiANCj4gICAqIGlndEBrbXNfaGRtaV9pbmplY3RAaW5qZWN0LWF1ZGlvOg0KPiAgICAg
LSBmaS10Z2wtMTExNWc0OiAgICAgIFtGQUlMXVszXSAoW2k5MTUjMTY2NjRdKSAtPiBbUEFTU11b
NF0NCj4gICAgWzNdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lH
VF85MTE2L2ZpLXRnbC0xMTE1ZzQvaWd0QGttc19oZG1pX2luamVjdEBpbmplY3QtYXVkaW8uaHRt
bA0KPiAgICBbNF06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzE1OTE5L2ZpLXRnbC0xMTE1ZzQvaWd0DQo+IEBrbXNfaGRtaV9pbmplY3RAaW5qZWN0
LWF1ZGlvLmh0bWwNCj4gDQo+ICAgDQo+ICAgW2k5MTUjMTY2NjRdOiANCj4gaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xNjY2NA0KPiANCj4g
DQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0tLQ0KPiANCj4gICAqIENJOiBDSS0yMDE5
MDUyOSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF85MTE2IC0+IElHVFBXXzE1OTE5DQo+IA0KPiAg
IENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RSTV8xOTIzMzogZWNjNWE4NGJlODQ5YzQw
MGFmNjEwY2RjNjEzYTAyNzRlM2IxMDFiMiBAIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2dmeC1jaS9saW51eA0KPiAgIElHVFBXXzE1OTE5OiAxNTkxOQ0KPiAgIElHVF85MTE2OiA5ZDRi
NmVmNTEyYjRlMmU0ZDA1MTI5YzY1MTkzMTNmZDEzYTMwNmQyIEAgDQo+IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3MgPT0N
Cj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNTkxOS9pbmRleC5odG1sDQo=
