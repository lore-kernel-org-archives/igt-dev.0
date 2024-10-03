Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9216CF34AD
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 13:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B8C10E844;
	Thu,  3 Oct 2024 13:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FqcXJYsa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381210E844
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727963378; x=1759499378;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=4H2FVRE/8F9P0uH4UEuHe1fgpWjT0kbmYfMzEMHcd24=;
 b=FqcXJYsa8+KpnJgASitNY6gfwLJp0qNkDHu6vefvHeveGF/wkD0uOCcW
 GQOlAQGOPQQlDnOlEeEvVVsqEMinl7RWT6QWFZw7jTlvkHvcrbb9ZTbd7
 xNQ+D1sqzBjo3+CggdplOHn4OZbKVOIZDNhJjzbibdK27Xq7dupJjzRmq
 WzHiFdtQlEiZOZ1jxxYtU/oCke8pIUmqcxdY88X2LJ9NWwy9/vIfd0rcv
 vw9eSQ2v0opxLwtvWThYRJvmuAvzdPK2d+3oYKLajcqtTofpBq9o1RSIH
 qrD4rst8+5deTl5MpBnHVSkKiijf5Qfv0KCiEegl44In6Lx9OEGjFdltW A==;
X-CSE-ConnectionGUID: a9GorsjWTLmFjhmIjexetA==
X-CSE-MsgGUID: eGdS7zD5Q6CoanJ5jg85GQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37750814"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="37750814"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 06:49:38 -0700
X-CSE-ConnectionGUID: ktfQOvZVRxSob6XFndmUiQ==
X-CSE-MsgGUID: kcGWLuzsQVazl0TygSnA+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="79113620"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 06:49:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 06:49:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 06:49:36 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 06:49:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 06:49:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pov7SlsYBrGOxgktvEIb1wWE+kZnZzxR2tg1Tv9X2Hq6N53cgKx2cedDax+6WNSPQGFXmd0480PoTKbsKYVi42rv2j8NfAz5WL4WKfkw+qoKST9YCsRzWtZt6lZMVO5ZvHWPBe0Rd03KbMW3/pWrZZN/ZK2hFtqAH/jJP3AYU7mJK/KCT9+cmaKoBU5hSf3o+zTARYEfHTW54FK2HN8aa8Olyxf8ltgPR74xPq063QHVMy+dzd9h95YHbN6OdD1JvNNLIa87FjPk5AXjGfb87u6cU/H6jNiOhC7iAn+VmsUnwNTuqbyVM62Pn8SFfYXBX8dwXMScFT+Qk8YvL5s5Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H2FVRE/8F9P0uH4UEuHe1fgpWjT0kbmYfMzEMHcd24=;
 b=udr0WgrP0WaUS/2U/GT/fB54Unh6Osgaew5pjR32t5i/8yt9BVSPFYEYsOxPrtOB+LmkUIf9ee5GqdX0kOGTP/m0wwOMxLVb73gzAnQ2Z9ChaWgzjNzI3yZ9Xv0V4tXidkmY/j8yIIThEqT1/sF6h0kAZae7ZWWDU3uGkT9hxKzeujpfSaN0U1EEYb7dZa0uA5FeovQA77q7SfYJQiTM6ON6UWRUWAgyaovo6IO6iDsEqJX35jscV4b0fUSWAZhDtxych9i3Cv2QO2iiWW4gMBaYsstlQJhxlUmw3BERrRdi+eRhk7wU7/mHjewXPtHnGtjFnxh0jmhdrwf3POFIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Thu, 3 Oct
 2024 13:49:28 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 13:49:27 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 i-g-t 2/2] tests/xe_eudebug_online: Adjust
 interrupt-other test
Thread-Topic: [PATCH v2 i-g-t 2/2] tests/xe_eudebug_online: Adjust
 interrupt-other test
Thread-Index: AQHbFL5k0/ggXTbU5EqRnwO/RRnR1LJ1DKOA
Date: Thu, 3 Oct 2024 13:49:27 +0000
Message-ID: <cc11d8b61760737467dc16e79de686616cf85ff5.camel@intel.com>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
 <20241002112914.5556-3-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241002112914.5556-3-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|IA1PR11MB7890:EE_
x-ms-office365-filtering-correlation-id: c28d3337-ae72-40bc-a0c2-08dce3b232fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NURCZTJ2Q0Uza0ZXQU0wRGczMXVMUkw1bWtUN2NSaU9xYllmRUFEMm1XRjM2?=
 =?utf-8?B?UnE0bUZjYTFGS1dRNncvTVFQRnVmNWpHTFdld2NhazF5enQza0ZGckUvRVdh?=
 =?utf-8?B?VzUyNmVwTXc4ZHNtc1o4MG5Xdzg2eW9jNGRnYWJQUkwvQi8zSlF4a0Z2WFhI?=
 =?utf-8?B?VFR6L0F6OGRwWk9hRUdHRXBxaWJQZjdXb1Nyb3pwUlQvS2FTM2M4ZVc5aEYz?=
 =?utf-8?B?TEI2TklMRk9VcVhxNm8xSlVsL0loY2tLVTF3R0ZMaktJSldqT0E1RGltR05W?=
 =?utf-8?B?YzRJeWZRZzBISlcxWUMyZE1ENEV6bThDZm43TFR6T3R4NHFUc3cwSWYrTFdF?=
 =?utf-8?B?Zm9aYnhRRnhBRjJVRTFxRW4zT1ZOVlBiMGFrY01oczBpWEd4ZVdQMFpOeWFM?=
 =?utf-8?B?ZnViVSttUGNaSkNCS25RUEREQXFuREE5WDBMQVBKNUJnUTY5NWRCZmJteFVz?=
 =?utf-8?B?TWlIVkNyWUhka0pVbm5Rd0ZUNWEzQlVvMUxUYmlTZG1wRWdTTStOSFBYMWov?=
 =?utf-8?B?U0Z6Rkg1QkpTdFd4Y0tWUjl0MDZaSjkrbUVTN1FwQ0x5Q1k4ai9RalhVVFJa?=
 =?utf-8?B?ZWtEcnZZTlpmQmlUNWpkR1MrOTlQUks5ellQR05KN084TnNiUEJSaVRUaWpz?=
 =?utf-8?B?MFd2RUtVdEQ3T3FlSnc4WGcrWmRCdjc4a2NNbVBLeGsyT3RiSWhhWWFPYnBk?=
 =?utf-8?B?enJnUHZKa1ZLWjZkM0QzUU1vOUxxN2h6Vy8rMzJzUThtWWphYTFhaDc5TlA3?=
 =?utf-8?B?MjY0MWdydnB4cmNnM0NGT0xnelUyTFZSTDZXcjQvbkdwOUkwTjR4eElOWDdn?=
 =?utf-8?B?R1RJN2FBMXdyREtqWWRhL3hGS0dhSnFjR0JFMlpRa1Brd3hyWk9TbjhxWWJj?=
 =?utf-8?B?NFVOM0lWaXpVYnhuRFJiVjV0My9udmIzTVd5WE9KMi9ENkl0bEJBWGZYdUhU?=
 =?utf-8?B?ZGkvOUtMWmJjeVd6NGFoS2dzSWpXMk5yL3hlSlRGMXJRT0k3S0pxOUQ1cjBH?=
 =?utf-8?B?NDk2T3FmS0JMc01LdzAwVnVIWEcxK1VGdU5LZ05US0J1bVRsSUh6WWpVYW9h?=
 =?utf-8?B?ZzViUTNxOUlGM1FnMEZGc0krUWs1UElGRm10N1laQWV1dTR3V3FEQjVZakQr?=
 =?utf-8?B?ZlI3R1BRdjNDdEVIODZRUUwzTnBxcjREL28xR0VkVU1rUGlmWngwTDl3Q0VM?=
 =?utf-8?B?ZWVNbWlRbjJUcm1Hb09JcWdReGFBdXZCSFVKdm12MTRqQ3M3Q0FPOGk5TEZY?=
 =?utf-8?B?RmVlaDNla0o0TFkrL01odXZRQkZjMENJTE9BajREVmIyWFo3eVRVTkxaZHRt?=
 =?utf-8?B?T2V2Lzl0WWg3KzR2Um5yN1JCSTVQdlN6YUFlRHhOdzFuZGVxeGN3K0xYYkVx?=
 =?utf-8?B?RHJXcWZmb1hsWDhyVjhJMGVmcGJCbUhPazFyVUpBZU9jTDZyRGJnd3RMQ0o4?=
 =?utf-8?B?a1pCOXFSMXlxeGhoeHFUekFFZUVidTNlZWRscnB1bUs2aXlVaFQxUEQwSmJO?=
 =?utf-8?B?MHdYM0loUi9XZjRqMTNObXVPRWd1UHZXWFd5aHpNQWtKRHQ1YUx1SGlFNzZi?=
 =?utf-8?B?SGpFUm1KTk5jSEg3QjgwZmFoa0ZGanJDM1ZvYnlvV0pRVWZvRDZna0xuL3px?=
 =?utf-8?B?UXRTaWJ0STgyWTNqTmZPa21lMmgzeHlJb3FDMCtxNE0xYUVHcmw0RWJkbHlF?=
 =?utf-8?B?eW9sUDdmM2xiWFY5dzk5K2daS0dTUVh4dktyQXN4Y1dXWEN4Qk1TWkR0Wi94?=
 =?utf-8?B?THUvY0FYeFVXTHUwazQrZVEreC9yTituaUdrSTRCZWIrdTR5SVdIVkRVdmhh?=
 =?utf-8?B?cFpsYmIzMDIyYVptb2tkQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXoxQ2RxZEMvL0traFJwZk1CWWoyeUE4dXcrdFc2Titzc3AvVFkxenhYNUhF?=
 =?utf-8?B?ckVoWFdTd3NDa1g4V213alROcVVVY1RIVDdnbHFmaWNmcGdrTWYxTkV1Ujlw?=
 =?utf-8?B?c00ybE9QeGx5andTNU9BN2VYZHBzUUpxUmxmMzg5VGtOWTdZNjU4V2pKaHVw?=
 =?utf-8?B?TTdSWVQyYnBCT3pWWDl1Ni9xQjdCbmFoT3o1ZFVSemtiUUI4RXUzc3B5RVAw?=
 =?utf-8?B?UDJJY0JDRC80TkFYc1N6V3dGMWhBYUJiR2J1K1VrU2F1OEl5aU0yVnNXUG9T?=
 =?utf-8?B?M3RTeEhMMHFNUG4weDlYU3pvRTJodVczQ3UwTUVDbXplckV4K2JHWG5xNGpl?=
 =?utf-8?B?SkJUbzRwdjRyVDMxRlp4YUJOODhzT3RYbHFyaGhkQ2RSN1c1TTVKdDFvNTlw?=
 =?utf-8?B?WU1OUVBPbDRlMGk4bVQxajlBSEZPVU41WTF3UUFXZkVLdDhMUDg0M0VrenZa?=
 =?utf-8?B?WEsvTjFNQkVMV3ZEUFFPNWV0VGFXNVRiK1MvWHdza0NhaHMxM0hVenNjdW4y?=
 =?utf-8?B?dUx3VEZ6eS9BS2hESDVsbDBnTEY3UGZKQlFUb0V1WFFiT3BQZ25DRDhjdDls?=
 =?utf-8?B?SzdaQlhqdEJDWFRXUHBNeFJkTG5PS2EyQWwzRmhlbVI1Qm92bkFHbU1HQXJa?=
 =?utf-8?B?MHRRUWR0MU5zTVB1bGlqNHcyVFE1VG1pR1pndjkyYUx1WkpSeUYzMVlybVkr?=
 =?utf-8?B?Qjc5TnU0M3hwRjB3R1dneUFUQi96Q3NkOTI1andacUhBMG4waitKUXZlRSt4?=
 =?utf-8?B?SDRkNWVyaG1YZHhkSGJ3T3ZHOXZwUzlPTDhuY1hCK3Z0NUREMGMzSzRHK1dy?=
 =?utf-8?B?YW5zUDNrbGxIU3g5ZFFXcUJKbVhPcDRWdE9mMGF2eHZmZWhnblN6azNXb1Y4?=
 =?utf-8?B?dllSYjM3SXpRdStNV05IYmF6Y2lwQmVHZU5pNi90Q0FPczE0dGk0UkdNRlBw?=
 =?utf-8?B?UC9jUWlBUTNVMEVhSm5xck4zSEpSUFphN1FLbWx4UzdMRjVvYjRnbnladThS?=
 =?utf-8?B?ckROWVh1c2U3M3E1R0g1L0dTSVgzTyt2TlQxcTEyYU52enBvUU5iRTkwM2VS?=
 =?utf-8?B?VFdKTHNzaFpzVE1rYlpQdHRqdkNmRVMzd0VtS0lXME9hMTAvOUJCeHZJM2tG?=
 =?utf-8?B?ZUlaSkluODZQRmQrQ25qMU1UYk5reDM2QkV5a1RQREdQYWs1b2pYSDMvVHp1?=
 =?utf-8?B?OXQ1MHBjL1FkQkw5YU4wZDNvOGtiWmpSWHNmSktIU0RlYTRoSGdTdnFNeUlQ?=
 =?utf-8?B?UDlCa1g5TXYxR3hYODdHMkV0ZmhQa0ZJd3RMWElHYlR0Y2xWbEE0VHJRdFdt?=
 =?utf-8?B?VTNFTHFWRk1JYUZpVkdZYjBYakZiWUdDWW9oTFc3WHQrM29Kdm51b01pRjFQ?=
 =?utf-8?B?TjZMbmJHcTQ0M1N1bDVjZjFnU3BsQWhyRncwSUFIdE54SlZxSXdsYlZKeEYw?=
 =?utf-8?B?MStvbUhiOEtLSjlGekxkeXQ1L1h2TDl6dlQ2OUFDV3B4WEZKMkZNNnFSY2hM?=
 =?utf-8?B?UlJnaE8rUEpHQWlsb3piWFg0aGZ1NFFKYm5GVjNOeFZxZ1dTNG5pVVdCN01y?=
 =?utf-8?B?bkwyYjZEV1VRb3paT0QxNUl6Q3g3N25LSkhtOXcyaGlSTloyZ0I5S1lycThQ?=
 =?utf-8?B?TlFlSWVweWczWmx4T3RBZTBBcmdTRHpPZ1NHaUc0emprekc4bFlpOGN2VG54?=
 =?utf-8?B?a0I3QnBjT1ZzNUxnSm8wdFpiTnpaQTlWdmhMYytDUjYrSTBvQ0plTlFPd2Fm?=
 =?utf-8?B?RWhiYTloanlBcXFZbzFlNzBkaERMK2ZnYXVDZGdVUXg0UzRKV01TbmlxNHBu?=
 =?utf-8?B?azZUcE1oWEhNOXpNSk81ZWhORUE3Q2NGNlJVL1IvSUVza1ErUTl4UTVCSFor?=
 =?utf-8?B?c01PVGpMZzAwemRISUNqVGZZWHdoRGxUbktFbzZmZGVKaTZhREdsUEZFa3RK?=
 =?utf-8?B?RVNlclcrTmxZUklJZVdXakxwZ2JjNmdWQk94YXJLSzBtN0dlRTA3SVZ4MUxl?=
 =?utf-8?B?Q25vTnhsM3ZRVkVKOFZnYVdSUkJpUHR0Mm40aE41Ums4L2F6T3dpZVhnUXYw?=
 =?utf-8?B?V3UwNTNlL1VpcFd3UnduZFN1V1BXM21Tdm80VnlxcnFDM25hMG1aQm9uUmtV?=
 =?utf-8?B?a0pjNjAxcVUvTWJKYVJNMVovSDlrbjZ6blJMSTE2RERXMEYvaEd3T1ByeVgx?=
 =?utf-8?Q?YPyD6YsoUBUrYM+EbM3cxes=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C84BF1A7CF4453429C53B7DB604FE325@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28d3337-ae72-40bc-a0c2-08dce3b232fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 13:49:27.8669 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 57dUsNTm5/Kj4RKURZSZ6veZTEeumia0JI36mU2UI/Xnutf/nNXppQJD0eRzCKBVcDS4p6WHxp76FlDiyZsIMsN0XVAwWdX3hC2+cOi/H/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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

SGkgRG9taW5payENCg0KT24gV2VkLCAyMDI0LTEwLTAyIGF0IDEzOjI5ICswMjAwLCBEb21pbmlr
IEthcm9sIFBpxIV0a293c2tpIHdyb3RlOg0KPiBUaGlzIHRlc3QgZmFpbHMgZHVlIHRvIHByZWVt
cHRpb24gaW50ZXJmZXJpbmcgd2l0aCBpdC4NCj4gDQo+IEluIG9yZGVyIHRvIGZpeCBpdCwgc2V0
IHRoZSBwcmVlbXB0X3RpbWVvdXRfdXMgZm9yIGVuZ2luZV9jbGFzcyB1c2VkIGluDQo+IHRoaXMg
dGVzdCB0byBtYXhpbXVtIGZvciB0aGUgZHVyYXRpb24gb2YgdGhlIHRlc3QuDQo+IA0KPiBJdCBp
cyBzZXQgdG8gbWF4aW11bSBpbnNpZGUgdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZS4gSWYgc2V0
IGJlZm9yZSwNCj4gd2Ugd291bGQgbGFjayBlbmdpbmVfY2xhc3MgaW5mby4gSWYgc2V0IGluc2lk
ZSB0aGUgdGVzdCBmdW5jdGlvbiwgd2UNCj4gd291bGQgbmVlZCB0byBwYXNzIG9yaWdpbmFsIHBy
ZWVtcHRfdGltZW91dF91cyB2YWx1ZSBmcm9tIHRoZXJlLA0KPiB1bm5lY2Vzc2FyaWx5IGNvbXBs
aWNhdGluZyB0aGUgZGVjbGFyYXRpb24gb2YgdGVzdCBmdW5jdGlvbi4NCj4gDQo+IEl0IGlzIHJl
c3RvcmVkIGluIHN1YnNlcXVlbnQgaWd0X2ZpeHR1cmUuIFRoaXMgd2F5LCBhIHByb3BlciBjbGVh
bnVwDQo+IGNhbiBiZSBhc3N1cmVkLiBJZiByZXN0b3JlZCBpbnNpZGUgdGhlIHRlc3QgZnVuY3Rp
b24gb3IgZXZlbg0KPiB0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlIHNlY3Rpb24sIGFueSBmYWls
ZWQgYXNzZXJ0IHByZWNlZGluZyBjbGVhbnVwDQo+IGluc2lkZSB0ZXN0IGZ1bmN0aW9uIHdvdWxk
IHByZXZlbnQgY2xlYW51cCBmcm9tIGhhcHBlbmluZy4gV2UgY2Fubm90DQo+IGFsbG93IHRoYXQu
DQo+IA0KPiBJbiBvcmRlciB0byB1bmRlcmxpbmUgdGhhdCB0aGUgc3Vic2VxdWVudCBpZ3RfZml4
dHVyZSBpcyByZWxhdGVkIHRvDQo+IHRoaXMgdGVzdCwgYm90aCB0ZXN0X2d0X3JlbmRlcl9vcl9j
b21wdXRlIGFuZCBpZ3RfZml4dHVyZSBzZWN0aW9ucw0KPiB3ZXJlIHB1dCBpbnNpZGUgaWd0X3N1
YnRlc3RfZ3JvdXAsIGhvcGVmdWxseSBpbmNyZWFzaW5nIHJlYWRhYmlsaXR5Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0
a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGlu
ZS5jIHwgNDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgNDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1
Z19vbmxpbmUuYw0KPiBpbmRleCA2OGQxYjc4NmYuLjg0NzM2MTkyZiAxMDA2NDQNCj4gLS0tIGEv
dGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9l
dWRlYnVnX29ubGluZS5jDQo+IEBAIC0xNiw2ICsxNiw3IEBADQo+ICAjaW5jbHVkZSAieGUveGVf
aW9jdGwuaCINCj4gICNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiAgI2luY2x1ZGUgImlndC5o
Ig0KPiArI2luY2x1ZGUgImlndF9zeXNmcy5oIg0KPiAgI2luY2x1ZGUgImludGVsX3BhdC5oIg0K
PiAgI2luY2x1ZGUgImludGVsX21vY3MuaCINCj4gICNpbmNsdWRlICJncGdwdV9zaGFkZXIuaCIN
Cj4gQEAgLTIyMDEsNiArMjIwMiwzMCBAQCBzdGF0aWMgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xh
c3NfaW5zdGFuY2UgKnBpY2tfY29tcHV0ZShpbnQgZmQsIGludCBndCkNCj4gIAlyZXR1cm4gTlVM
TDsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGJvb2wgc2V0X3ByZWVtcHRfdGltZW91dF90b19tYXgo
aW50IGZkLCB1aW50MTZfdCBlbmdpbmVfY2xhc3MsIHVpbnQzMl90ICpwcmVlbXB0X3RpbWVvdXQp
DQo+ICt7DQo+ICsJdWludDMyX3QgcHJlZW1wdF90aW1lb3V0X21heDsNCj4gKw0KPiArCWlmICgh
eGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9wcm9wZXJ0eShmZCwgMCwgZW5naW5lX2NsYXNzLCAi
cHJlZW1wdF90aW1lb3V0X21heCIsDQo+ICsJCQkJCQkmcHJlZW1wdF90aW1lb3V0X21heCkpDQo+
ICsJCXJldHVybiBmYWxzZTsNCj4gKw0KPiArCWlmICgheGVfc3lzZnNfZW5naW5lX2NsYXNzX3Nl
dF9wcm9wZXJ0eShmZCwgMCwgZW5naW5lX2NsYXNzLCAicHJlZW1wdF90aW1lb3V0X3VzIiwNCj4g
KwkJCQkJCXByZWVtcHRfdGltZW91dF9tYXgsIHByZWVtcHRfdGltZW91dCkpDQo+ICsJCXJldHVy
biBmYWxzZTsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KTWlub3Igbml0LCB5b3UgY291bGQgb21t
aXQgc2Vjb25kIGlmOg0KCXJldHVybiB4ZV9zeXNmc19lbmdpbmVfY2xhc3Nfc2V0X3Byb3BlcnR5
KGZkLCAwLCBlbmdpbmVfY2xhc3MsICJwcmVlbXB0X3RpbWVvdXRfdXMiLA0KKwkJCQkJCXByZWVt
cHRfdGltZW91dF9tYXgsIHByZWVtcHRfdGltZW91dCkpDQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBi
b29sIHJlc3RvcmVfcHJlZW1wdF90aW1lb3V0KGludCBmZCwgdWludDE2X3QgZW5naW5lX2NsYXNz
LCB1aW50MzJfdCBwcmVlbXB0X3RpbWVvdXQpDQo+ICt7DQo+ICsJaWYgKCF4ZV9zeXNmc19lbmdp
bmVfY2xhc3Nfc2V0X3Byb3BlcnR5KGZkLCAwLCBlbmdpbmVfY2xhc3MsICJwcmVlbXB0X3RpbWVv
dXRfdXMiLA0KPiArCQkJCQkJcHJlZW1wdF90aW1lb3V0LCBOVUxMKSkNCj4gKwkJcmV0dXJuIGZh
bHNlOw0KPiArDQo+ICsJcmV0dXJuIHRydWU7DQpzYW1lIGFzIGFib3ZlLg0KPiArfQ0KPiArDQo+
ICAjZGVmaW5lIHRlc3RfZ3RfcmVuZGVyX29yX2NvbXB1dGUodCwgZmQsIF9faHdlKSBcDQo+ICAJ
aWd0X3N1YnRlc3Rfd2l0aF9keW5hbWljKHQpIFwNCj4gIAkJZm9yIChpbnQgZ3QgPSAwOyAoX19o
d2UgPSBwaWNrX2NvbXB1dGUoZmQsIGd0KSk7IGd0KyspIFwNCj4gQEAgLTIyMTIsNiArMjIzNyw4
IEBAIGlndF9tYWluDQo+ICAJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3
ZTsNCj4gIAlib29sIHdhc19lbmFibGVkOw0KPiAgCWludCBmZDsNCj4gKwl1aW50MTZfdCBlbmdp
bmVfY2xhc3MgPSAweEZGRkY7DQo+ICsJdWludDMyX3QgcHJlZW1wdF90aW1lb3V0ID0gMHhGRkZG
RkZGRjsNCj4gIA0KPiAgCWlndF9maXh0dXJlIHsNCj4gIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIo
RFJJVkVSX1hFKTsNCj4gQEAgLTIyNDcsOCArMjI3NCwyMiBAQCBpZ3RfbWFpbg0KPiAgCXRlc3Rf
Z3RfcmVuZGVyX29yX2NvbXB1dGUoImludGVycnVwdC1vdGhlci1kZWJ1Z2dhYmxlIiwgZmQsIGh3
ZSkNCj4gIAkJdGVzdF9pbnRlcnJ1cHRfb3RoZXIoZmQsIGh3ZSwgU0hBREVSX0xPT1ApOw0KPiAg
DQo+IC0JdGVzdF9ndF9yZW5kZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0LW90aGVyIiwgZmQsIGh3
ZSkNCj4gLQkJdGVzdF9pbnRlcnJ1cHRfb3RoZXIoZmQsIGh3ZSwgU0hBREVSX0xPT1AgfCBESVNB
QkxFX0RFQlVHX01PREUpOw0KPiArCWlndF9zdWJ0ZXN0X2dyb3VwIHsNCj4gKwkJdGVzdF9ndF9y
ZW5kZXJfb3JfY29tcHV0ZSgiaW50ZXJydXB0LW90aGVyIiwgZmQsIGh3ZSkgew0KPiArCQkJZW5n
aW5lX2NsYXNzID0gaHdlLT5lbmdpbmVfY2xhc3M7DQo+ICsNCj4gKwkJCWlndF9za2lwX29uKCFz
ZXRfcHJlZW1wdF90aW1lb3V0X3RvX21heChmZCwgZW5naW5lX2NsYXNzLA0KPiArCQkJCQkJCQkm
cHJlZW1wdF90aW1lb3V0KSk7DQo+ICsNCj4gKwkJCXRlc3RfaW50ZXJydXB0X290aGVyKGZkLCBo
d2UsIFNIQURFUl9MT09QIHwgRElTQUJMRV9ERUJVR19NT0RFKTsNCj4gKwkJfQ0KPiArDQo+ICsJ
CWlndF9maXh0dXJlIHsNCj4gKwkJCWlmICgodWludDE2X3QpfmVuZ2luZV9jbGFzcyAmJiB+cHJl
ZW1wdF90aW1lb3V0KQ0KTWF5YmUgSSdtIG5vdCBzZWVpbmcgc3RoIGJ1dCB3aHkgZG8gd2UgbmVl
ZCB0byBjYXN0IGl0IHRvIHVpbnQxNiwgaXNuJ3QgaXQgYWxyZWFkeSB0aGF0IHR5cGU/DQoNCk90
aGVyIHRoYW4gdGhhdCBpdCBpczoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRv
bWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+ICsJCQkJaWYgKCFyZXN0b3JlX3ByZWVtcHRf
dGltZW91dChmZCwgZW5naW5lX2NsYXNzLCBwcmVlbXB0X3RpbWVvdXQpKQ0KPiArCQkJCQlpZ3Rf
d2FybigiQ2xlYW51cCBvZiBwcmVlbXB0X3RpbWVvdXQgZmFpbGVkIVxuIik7DQo+ICsJCX0NCj4g
Kwl9DQo+ICANCj4gIAl0ZXN0X2d0X3JlbmRlcl9vcl9jb21wdXRlKCJpbnRlcnJ1cHQtYWxsLXNl
dC1icmVha3BvaW50IiwgZmQsIGh3ZSkNCj4gIAkJdGVzdF9pbnRlcnJ1cHRfYWxsKGZkLCBod2Us
IFNIQURFUl9MT09QIHwgVFJJR0dFUl9SRVNVTUVfU0VUX0JQKTsNCg0K
