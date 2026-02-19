Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C20E9A03B
	for <igt-dev@archiver.kernel.org>; Thu, 19 Feb 2026 05:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2783F10E130;
	Thu, 19 Feb 2026 05:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Su8THcIz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713710E130
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Feb 2026 05:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771478390; x=1803014390;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GMFYlaLV4MUpA6JTdT8iXu1rfUt0yeZEts065XvX8VQ=;
 b=Su8THcIzGPAfiWeE+ePdqPJmvPH67eU76w8pMsrcEvbl0vaEUr0r6j9h
 8hQaelcf/tymmkNvLoQdxT0a1fwUIN7lBFNZ7Q/smYcAn30Grwrql+dFO
 kuVxVEbI+eTQ3bvEdCGMRnKMpMOUJS2mjtwlFYi7IfxWeIzLCPq4C2Cyw
 1yZBQ6QR6ycO83q1QYguEX6Ija9RCiUCWpEExRLR6U3oVA6eknOovU8Om
 l+dlnUEE6hKoJ6+A6vVWDFr97GfI7/wsOluHJYqU8FSwcAsgTRrJIQUGh
 90NlIC1nAPOYg1M1SqVtyMQJbt5CQjhfTNygFoimfolwqJg2riqGmJOvv Q==;
X-CSE-ConnectionGUID: y4npQDZ7S36mXo08tCnzFw==
X-CSE-MsgGUID: wUXmFmdeT8O4KWvkRlBiEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83665426"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="83665426"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 21:19:50 -0800
X-CSE-ConnectionGUID: lfjZBxMlTtaJsDtNFD0QcQ==
X-CSE-MsgGUID: qfoW61eCTJiF+aS9LGqjmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; d="scan'208";a="237397942"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 21:19:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 21:19:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 21:19:49 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.66) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 21:19:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHVoVrA9waxyUs1JDoeeA9MPRzOPawIm+Qs5szdWVU5xlUF8h/YtaBNrtDCn+0M+z5Gf1ijgvAXrIjVyAVakprhR8RGhNQoGpvz0qM5yUkOPXpBQe88ezrotA/51yrbU4j/2niPmtYThDQfQNUQbqmZZEujqrOLt3hwjO+lEKCs+oFA48IBtbxEMTTgVYBp1P1c9NNNI0WMSJG0JANtSeOnoc0zTkdn5u+JeHrPTPpX10nkV2FWZCMF90QfWwt83hNKnku5rpooIOD5OVOiytgp3zjif5+s7Q4pnfb6rZpqUa1+jaIOEPMsg1c2VMrsoyj/efnBLUMXQif7uWXAHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GMFYlaLV4MUpA6JTdT8iXu1rfUt0yeZEts065XvX8VQ=;
 b=kLbRndxuDQebC2/eX9T0aFwpC+KKw60wgNIMnjfL8+rGBAZQ3Lm9aC7J2pIJ80MghPfGMf1VO3DIgvqNfBwvE2o+ZDSv7c8xRaW6QWL0q4AAUu4/tBdTtMUVWxXCgRbClQkION/zF6mWreBd8lPqgp4EgH84wLHhaFsTjHnFxUeBjEdrh562lRqPWks85dqnvGFmFouDhxAJsQXCMrIXqqu8FNp41jDD6VxHpYQoZQLKMpvz4g/3rOtxNShq2fkWzrwxZY7YJKJwn34o+qcsehSSq+OXHSTZE9NYb1m1QHiz7J+Lvge1fAhDMz+M2TBNRwFIcklCZ6cXG6LnkVVnOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA0PR11MB4544.namprd11.prod.outlook.com (2603:10b6:806:92::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Thu, 19 Feb
 2026 05:19:47 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 05:19:47 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Bilal, Mohammed" <mohammed.bilal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Brzezinka, Sebastian"
 <sebastian.brzezinka@intel.com>, "Bilal, Mohammed" <mohammed.bilal@intel.com>
Subject: RE: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Thread-Topic: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Thread-Index: AQHcoK38q5Uu51EXoUK0NqVXBSXMgbWJfQeQ
Date: Thu, 19 Feb 2026 05:19:47 +0000
Message-ID: <PH7PR11MB67969F516490F0C62C075016E56BA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
 <20260218080511.2534901-2-mohammed.bilal@intel.com>
In-Reply-To: <20260218080511.2534901-2-mohammed.bilal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA0PR11MB4544:EE_
x-ms-office365-filtering-correlation-id: c512195e-1923-4395-99e5-08de6f767fed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?cUN1UFAwbnNEQjltU1MvMnBtdlNqT1ZaV28wQzY3Z0tKUUlvc3NCL2drTEpm?=
 =?utf-8?B?RXBTR1JNMnB6SFYrT2FzS2h4a0pRb1dpNUs2Rk5KK0lQZkZ4clRtby9HYWdh?=
 =?utf-8?B?bnFGdFhLME43RjRFZkZKOVVYbTFQL1F2RlBQaXlLUzRvQitiTXlIRnlYcktu?=
 =?utf-8?B?MUk0YzFWS0QvMkhrTDQzd01OT1JBczA2M3BPdktxdjhEc3ZEWjIwbG51QUhH?=
 =?utf-8?B?ODNweC9OZWJFTWpqRSs4TVkwZ2VaSDQraTFxdXpseW4wVytMSlpVcTdjQllk?=
 =?utf-8?B?aGNlbU43YkdnSXlRa08zemdGQkZpb2s1VHR6a3MvaUI3K3hBRjRkaVJZakk0?=
 =?utf-8?B?T3pCY0FoeFR4ZlEvY3lBbmV4c1ByZ0dnTFRSR25aOEhLM2crc2lvZUxBUFdu?=
 =?utf-8?B?QWUyOEFjZG1ZRjc2cHpFVUdueE9ZZDVZNmdDeGRKUWh0dXp0Rkc3cHJ0Um1X?=
 =?utf-8?B?bXZQRjdIeisvTWdBNE5EZENwSFVULy9SSnhlRGhka3A4MkUzTytMdjA0dUpT?=
 =?utf-8?B?eUs1R2J6c3VmYnN6UjZBT1lFbkxYSFJSVEtQMmhJcTFmMCtVTmxsOVBhVzQ5?=
 =?utf-8?B?cjBFcmtxYm5vNnBNZzFtMWZaQzlZVnpCVVJaanRMZzZKMW01VmM2Tnl0bTdn?=
 =?utf-8?B?VDRtOHE2K3NWdWdyRzc5QlpQU0NMaVVqTTlnN2I1NENTQThVQjBTc0ZqZmtL?=
 =?utf-8?B?dXZUOTQyNUJCRFVwckR2UmNBUGxPR1dabWU3eDIrdGlWdDRqYXV2VnlsYUoz?=
 =?utf-8?B?L09MeXc1bXlFWVBWbzJHcGxlOGRRYURJUVN4NVhiMldoYmlIMlM5T0xHL2d5?=
 =?utf-8?B?N1BwQnU0S0Q0SHYrYlRGbVB0aStuMTdhL0N4MGptc05wb0doQnU0VzJPVUdm?=
 =?utf-8?B?Y2hzMEM4UlFmWVdxc0dvQklBdGFWaGxBWkc2bWw3RGFDNlFVelUrWDJ0YW9z?=
 =?utf-8?B?c2Z3SUhlcCtZdEQramJuNFFIVWtaRGg2YVVuK2tCZzdOV2s1TW11OWVicTVF?=
 =?utf-8?B?MUVNZS8rNFBlQlJydXZYZlpwMVk4WkhRUTBFTHNLb3lGZmoxTnJCbUxVQ0hG?=
 =?utf-8?B?QVhHR0NCekVZeVVaNEZjblhla0JhT0ZvaXo0TVc0WXRtZS9VYjNNOFV2Mmt2?=
 =?utf-8?B?ZlpLdW45bW0vc3lDZnlUY205Y3U4clRnNHg2UmkrbW40YmhEbXRLS2txR0Yz?=
 =?utf-8?B?ZzRsdTJTZ1o4MjZEVTdpOTRnN0N0QjF5RVJWdDgxaWVkL3VHR01IU1grc3Zt?=
 =?utf-8?B?Z2ttdHVSUmR1TVZYdG5CTlIvUlN2alVmUzEwN3dLbnd5M213VndTZ2QyMGdi?=
 =?utf-8?B?UjIwSTVhc2QzeDdsQlB2aG05Mm5lR0dPbFp2MTl0cERvVVF1UTRGY3lRWjZo?=
 =?utf-8?B?MXZ5OTBkUTRtS2RobmY4c0R3ZVRkaU81ZzVPYVRaNWxGQmJjMDBPSTREOEVF?=
 =?utf-8?B?eldzVjMwTFlLb0wzVEJMZXdhbHpzY2xLdVc2MkFRcTU3ZlVnRG1RQ3p1Mnov?=
 =?utf-8?B?NktQQU5qSWtIQ1BFUENFSWlLYVFKelRRZ243ckxkMjdEZEhIQWtncnhVcUlD?=
 =?utf-8?B?cll2YWgrTkIwa1VmK0RZaHRxVHpEM3pQWGtVOGVyUlhjZXhnOXdqU24zUkVl?=
 =?utf-8?B?N1VacVlkU0ZZUDhwaFZzNkJMbFFOdVRKeG56QVBSMUswSmpIWEFYN04xZHJl?=
 =?utf-8?B?cU9lNVJ2dnM5YjFmTFI0YUVPRVpteS9OZnl5azU0RmY3cXlHU0svc0d0UmNB?=
 =?utf-8?B?U1BlU3dvYXpBellhSHlXM2tseGlFV250TXIzTW05QTd6bGo5NDlKZ2I3NEUv?=
 =?utf-8?B?WkgycjVsbDQ2aUFLYk1rdGlCSEE4bmF0QzF1Q0JNME1NZ0p2TWdqQnlIWll4?=
 =?utf-8?B?UmVGZUhDbUlRVXk0SFZvUFNsY2o0QmkyWW5PMVdiY2YwbXhKenNROE1vS3o2?=
 =?utf-8?B?R09xTHlTdUtJR2VQMVNuQTFYd205a0lZcDdaMVVqWGxqVjk3MzE1L0U5Zmgy?=
 =?utf-8?B?STdTZi92bkZFZ3ZBOWkrdlhCM2NIZWlvWDNYajIxbWVvNXBNaVJTMUdIRTVI?=
 =?utf-8?B?ZCt6WVdIdjI1MVFPUWYrVHBaVWlQN2lqL25ycWtmdm1kZGFNVVEvcktJMkh6?=
 =?utf-8?B?TjBUcENZSW5XNnpiYW5IeFp4K0V3MkhRSmM0WnBTZHNRM05UTWtZZVl0UEVF?=
 =?utf-8?Q?GmpQg5xN+77OXPcpyINN+2k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RjQ5K3ZKaEEveEZWcjN0eVlqaFRZWmtFOC8vZnlLK2hJb29KSGhOK3JQa0Zi?=
 =?utf-8?B?cUtuOU00czlIVVVoQitVZ3dHYzl5S2lKNGxRSGdtUVdYaDFRYzFlUjVqUDN4?=
 =?utf-8?B?M1VOMnZOYmZFT1BHZG1aUDlrSUVSVlh6YWx3Z0x2WWRHM0YxWnVWU0YzUnRw?=
 =?utf-8?B?QjRoQnYwNkZ6TkgwaGJMS2xkNFo5UjVOdFpjNDZOZEUvVUlpaXhOajFWdUpM?=
 =?utf-8?B?YXZCN21RQWFZaU5OK2RlakFGR3RJazkzZ2RxdnlwYUczQmpkN2ZNTXFEcmVS?=
 =?utf-8?B?VVJQTFpyWnIyU3U5enZ6QWticnBzTEpMZ2FZVUw4M01IbFI3TWY2VkZWS0ZP?=
 =?utf-8?B?UVdReVdLRHNuSDg2MHAxTzNGTWtodmpjeklDL1dsWjRVVGl3ZUhSVTM4Tk5G?=
 =?utf-8?B?RmFyb2lUZjVJTzhrNXdFL294S3NQdXRvek11eG0vZDNHTTdOVWMxNlVmSzI0?=
 =?utf-8?B?bzFoaEpKY1kvNnBwdFUxV1Ivejk4TUJ5ZnY2b0srRDNWbi9hQkFRYTkwQjZt?=
 =?utf-8?B?cmlxZ1NaeHYxckFiL0dsVWtYaDN1R085S2Z3NGUzQzV2MTl3NnNUYURhRUEz?=
 =?utf-8?B?dmsxa25RQmxwUHNPN3ZBbzRqdEJxWUVFMlNVbUxkUEdIT0tVNUFhcVc3K2s4?=
 =?utf-8?B?Wjl0VzNpY3R5UkdxNFUva2w5aENlY0NwRU5pU1Y5M1FPRVV1Y1JyVTNXSUpk?=
 =?utf-8?B?a1cxQ2Y3Z0Z1bktHWERpR1BuRGE5YStYK0RjNTZFZlRUcSs3eTRBUlV4aSsr?=
 =?utf-8?B?MzZYSEN4T0o3MkpnaFNBeWh2K1ZuS29hRGk0WitFTWh2N0dMVngrQlI2R0l0?=
 =?utf-8?B?QnFIVisvQ053dkQrNmsvcXBIcHJoZTIxWk45SlhDOU5Vb2NqaWZ6UkR2aXIr?=
 =?utf-8?B?NHhXeTdoY0VuOUJ2QmNpaEg5cldPcDhkeUtOMnJGVFhSRHdmYmhYbTZpWjZX?=
 =?utf-8?B?dVdqRk1iK2lxNi85QmZ5SkRETTlWSVhUVVZyNjQ3cGxPVzlIRzJicmVkRWp6?=
 =?utf-8?B?T0ZFKzR6TDVDQWx5c0k4cmkrY3F3c093WXdsTzlXZVlXbjlKcFR4ZEplUWhx?=
 =?utf-8?B?VGhmV1ppU1RJZzI0VWI0TVBaWDJDa1dnSm9SL3E2UVZkcGJ0TUc4c3g2bFVG?=
 =?utf-8?B?b1JSMUczcGp3VlduMUdxckEzRVE4SUovb2ppUEpnS2tZNEdseUZzU1lPTElE?=
 =?utf-8?B?R0RHdENJR1Z4cEpYZlB5OWxDWkZER2dRTklPWTV0LytWb1hza3UrNW9hUUIy?=
 =?utf-8?B?eFlMeWdQS0hlMGI5NGxraUtkWk4rYlFhYmlWVTFhK3NQSzRHMW5nN1BBOVRP?=
 =?utf-8?B?LzFTbVRLWkJFbDBXSXBvekkvb3prU0Q5bUV0Z2J5RlVvTE55QnA1bXpkOVpJ?=
 =?utf-8?B?T2RnLzd4TWRuaEd5T0lnbXF6UlJOLzdFRWxzYXlBaXNyeEkzNjZSMzBNUnFU?=
 =?utf-8?B?Mi81LzBhQ1hHK1Vhb3FMRXMyTWNCbis1OVBTV0o4cUNyOFpscTdzeDY3ME5L?=
 =?utf-8?B?M1ZjQW16NGtWQktWa3daOCsyYkRoTG00ZjlvZVNLU1UxZTdGUHY5cGxhU1J2?=
 =?utf-8?B?anR4UHRHUVF2a2Q0T2ZNeCt6WlFJWXgwb3pmaC9lTkZudXpZVExlZTZjUyty?=
 =?utf-8?B?NU1ydW1FdmgxM3hpNitnbEhTNUJ1dFhyZ2tpU0YzdjgwWXp2c0J0N0R4cGdW?=
 =?utf-8?B?bllXT05BazhmR0Q2WWxBYzROTDlCU3pXNk1sMlBKSGdhTmJXQ2tPQ2NKR1lV?=
 =?utf-8?B?Qm9VUVZmeFd1cVJ0L0ViM3NHRTB3VFpsT1o3VFBtaFJVVFIxK0pMRmgwZVFu?=
 =?utf-8?B?YjV4K1NBYjVVMjdYS0xyRkcxVzlzU08yT1VubVpzTkV6dHZ2VjNwSjRmYmt0?=
 =?utf-8?B?UFNaM0lqWWYyQnpRUm0ycDNTZkw5OXhiN1V0M3FiSjU4Sjg2TnJPelozckJy?=
 =?utf-8?B?VkZjZjhKZVhDSHpXZ2xqOVhHU3JvUU1lMmpPdXNHQVhOWFlQY1U0RmxibzM2?=
 =?utf-8?B?YndjbGRYQmErcFhzMytwSmNJcFpmNExCY0JLSkt6VnJ2by9zOWZsQ3ljRVJh?=
 =?utf-8?B?ZjhnVEllTHI4dTVMWC9RWFNhTVZuYXdtdGN3WlJGZUdpYXp0aDNNU0NvVUJS?=
 =?utf-8?B?R0ovUVVvbW56TW9ZcFMxY1hvMlZzT0pNNVArZThwN21UT3ROY0xXVEFDM3FL?=
 =?utf-8?B?bFlDSGhvTlJUdzVDNWFZYkxDSjFLM2lMd0F4K1dPZzVoa01hSVVIbkRUVXdT?=
 =?utf-8?B?WjQ0ZnlSN0Q1cXZlcEJoZDFQL2poOXVRWTMvQnpMRUpMYjMzWVQyaG5yYzQ2?=
 =?utf-8?Q?7O3FsnE4GXP/TW8px6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c512195e-1923-4395-99e5-08de6f767fed
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2026 05:19:47.5901 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DJ1mqHVYxMRO+rLpe1f+8O3grDeo+EjXbcEDlcX5VnXK6n0V/ag8hlSS5adYV4T7OySoMaIFHd71iq5Wahw7ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4544
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

SGkgQmlsYWwsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRl
diA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+
IE1vaGFtbWVkIEJpbGFsDQo+IFNlbnQ6IDE4IEZlYnJ1YXJ5IDIwMjYgMTM6MzUNCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBCLCBKZWV2YW4gPGplZXZhbi5iQGlu
dGVsLmNvbT47IEpvc2hpLCBLdW5hbDEgPGt1bmFsMS5qb3NoaUBpbnRlbC5jb20+Ow0KPiBMYXR0
YW5uYXZhciwgU2FtZWVyIDxzYW1lZXIubGF0dGFubmF2YXJAaW50ZWwuY29tPjsgQnJ6ZXppbmth
LCBTZWJhc3RpYW4NCj4gPHNlYmFzdGlhbi5icnplemlua2FAaW50ZWwuY29tPjsgQmlsYWwsIE1v
aGFtbWVkDQo+IDxtb2hhbW1lZC5iaWxhbEBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2
MSAxLzJdIHRlc3RzL2ttc192cnI6IFNraXAgTE9CRiB0ZXN0IHdoZW4gYXV4LWxlc3MgQUxQTSBp
cw0KPiBub3QgZW5hYmxlZA0KPiANCj4gTE9CRiBjYW4gb3BlcmF0ZSBpbiBlaXRoZXIgQXV4LWxl
c3Mgb3IgQXV4LXdha2UgQUxQTSBtb2Rlcy4gSG93ZXZlciwgZHVlIHRvDQo+IHVuY2VydGFpbnR5
IGFyb3VuZCBlRFAgdmVyc2lvbiBkZXBlbmRlbmN5IGFuZCBpdHMgaW1wYWN0IG9uIExPQkYgZXhl
Y3V0aW9uLA0KPiB3ZSBjdXJyZW50bHkgcmVzdHJpY3QgdGhlIHRlc3QgdG8gcnVuIG9ubHkgd2hl
biBBdXgtbGVzcyBBTFBNIGlzIGVuYWJsZWQgdG8NCj4gYXZvaWQgdW5leHBlY3RlZCBmYWlsdXJl
cy4NCj4gDQo+IEFkZCBhIGhlbHBlciB0byByZWFkIHRoZSBBdXgtbGVzcyBBTFBNIHN0YXR1cyBm
cm9tIGRlYnVnZnMgYW5kIHNraXAgdGhlIExPQkYNCj4gc3VidGVzdCB3aGVuIEF1eC1sZXNzIEFM
UE0gaXMgbm90IGVuYWJsZWQgb24gdGhlIHBhbmVsLCBlbnN1cmluZyBwcm9wZXIgc2tpcA0KPiBi
ZWhhdmlvciBhbmQgcHJldmVudGluZyBmYWxzZSBuZWdhdGl2ZXMgb24gdW5zdXBwb3J0ZWQgY29u
ZmlndXJhdGlvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNb2hhbW1lZCBCaWxhbCA8bW9oYW1t
ZWQuYmlsYWxAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pZ3Rfa21zLmMgICB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGxpYi9pZ3Rfa21zLmggICB8ICAxICsNCj4gIHRl
c3RzL2ttc192cnIuYyB8ICA2ICsrKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMg
aW5kZXggNWM0ODc5NjA0Li40ODY4NGI0YjMgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3Rfa21zLmMN
Cj4gKysrIGIvbGliL2lndF9rbXMuYw0KPiBAQCAtNjU3OCw2ICs2NTc4LDM0IEBAIGJvb2wgaWd0
X2dldF9pOTE1X2VkcF9sb2JmX3N0YXR1cyhpbnQgZHJtZmQsIGNoYXINCj4gKmNvbm5lY3Rvcl9u
YW1lKQ0KPiAgCXJldHVybiBzdHJzdHIoYnVmLCAiTE9CRiBzdGF0dXM6IGVuYWJsZWQiKTsgIH0N
Cj4gDQo+ICsvKioNCj4gKyAqIGlndF9nZXRfYXV4X2xlc3NfYWxwbV9zdGF0dXMNCj4gKyAqIEBk
cm1mZDogQSBkcm0gZmlsZSBkZXNjcmlwdG9yDQo+ICsgKiBAY29ubmVjdG9yX25hbWU6IE5hbWUg
b2YgdGhlIGxpYmRybSBjb25uZWN0b3Igd2UncmUgZ29pbmcgdG8gdXNlDQo+ICsgKg0KPiArICog
Q2hlY2sgaWYgQXV4LWxlc3MgQUxQTSBtb2RlIGlzIGVuYWJsZWQgYnkgcmVhZGluZw0KPiArICog
dGhlIGk5MTVfZWRwX2xvYmZfaW5mbyBkZWJ1Z2ZzLg0KPiArICoNCj4gKyAqIFJldHVybjogVHJ1
ZSBpZiBhdXgtbGVzcyBBTFBNIGlzIGVuYWJsZWQuDQo+ICsgKi8NCj4gK2Jvb2wgaWd0X2dldF9h
dXhfbGVzc19hbHBtX3N0YXR1cyhpbnQgZHJtZmQsIGNoYXIgKmNvbm5lY3Rvcl9uYW1lKSB7DQo+
ICsJY2hhciBidWZbMjU2XTsNCj4gKwlpbnQgZmQsIHJlczsNCj4gKw0KQ29uc2lkZXIgYWRkaW5n
IGFuIGlndF9pbmZvKCkgbG9nIHdoZW4gaWd0X2RlYnVnZnNfc2ltcGxlX3JlYWQoKSByZXR1cm5z
IOKJpCAwLg0KUmlnaHQgbm93IHRoZSBoZWxwZXIganVzdCByZXR1cm5zIGZhbHNlLCBzbyBjYWxs
ZXJzIGNhbm5vdCBkaWZmZXJlbnRpYXRlIGJldHdlZW4g4oCYQUxQTSBkaXNhYmxlZOKAmSB2cyDi
gJhkZWJ1Z2ZzIG5vdCBhdmFpbGFibGXigJkuDQpCZWNhdXNlIHRoaXMgaXMgYSBsaWJyYXJ54oCR
bGV2ZWwgaGVscGVyLCBpbXByb3ZpbmcgbG9nZ2luZyBoZXJlIGJlbmVmaXRzIGFsbCB1c2VycyBv
ZiB0aGUgZnVuY3Rpb24uDQoNClJlZ2FyZHMsDQpTb3dtaXlhLg0KPiArCWZkID0gaWd0X2RlYnVn
ZnNfY29ubmVjdG9yX2Rpcihkcm1mZCwgY29ubmVjdG9yX25hbWUsIE9fUkRPTkxZKTsNCj4gKwlp
ZiAoZmQgPCAwKQ0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsNCj4gKwlyZXMgPSBpZ3RfZGVidWdm
c19zaW1wbGVfcmVhZChmZCwgImk5MTVfZWRwX2xvYmZfaW5mbyIsIGJ1ZiwNCj4gc2l6ZW9mKGJ1
ZikpOw0KPiArCWNsb3NlKGZkKTsNCj4gKw0KPiArCWlmIChyZXMgPD0gMCkNCj4gKwkJcmV0dXJu
IGZhbHNlOw0KPiArDQo+ICsJcmV0dXJuIHN0cnN0cihidWYsICJBdXgtbGVzcyBhbHBtIHN0YXR1
czogZW5hYmxlZCIpICE9IE5VTEw7IH0NCj4gKw0KPiAgLyoqDQo+ICAgKiBpZ3RfZ2V0X291dHB1
dF9tYXhfYnBjOg0KPiAgICogQGRybWZkOiBBIGRybSBmaWxlIGRlc2NyaXB0b3INCj4gZGlmZiAt
LWdpdCBhL2xpYi9pZ3Rfa21zLmggYi9saWIvaWd0X2ttcy5oIGluZGV4IGRlZGMzZjg4MC4uYTFm
NTJmNDUyIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2ttcy5oDQo+ICsrKyBiL2xpYi9pZ3Rfa21z
LmgNCj4gQEAgLTEyNTcsNiArMTI1Nyw3IEBAIGJvb2wNCj4gaWd0X292ZXJyaWRlX2FsbF9hY3Rp
dmVfb3V0cHV0X21vZGVzX3RvX2ZpdF9idyhpZ3RfZGlzcGxheV90ICpkaXNwbGF5KTsNCj4gYm9v
bCBpZ3RfZml0X21vZGVzX2luX2J3KGlndF9kaXNwbGF5X3QgKmRpc3BsYXkpOyAgYm9vbA0KPiBp
Z3RfaGFzX2xvYmZfZGVidWdmcyhpbnQgZHJtZmQsIGlndF9vdXRwdXRfdCAqb3V0cHV0KTsgIGJv
b2wNCj4gaWd0X2dldF9pOTE1X2VkcF9sb2JmX3N0YXR1cyhpbnQgZHJtZmQsIGNoYXIgKmNvbm5l
Y3Rvcl9uYW1lKTsNCj4gK2Jvb2wgaWd0X2dldF9hdXhfbGVzc19hbHBtX3N0YXR1cyhpbnQgZHJt
ZmQsIGNoYXIgKmNvbm5lY3Rvcl9uYW1lKTsNCj4gIHVuc2lnbmVkIGludCBpZ3RfZ2V0X291dHB1
dF9tYXhfYnBjKGludCBkcm1mZCwgY2hhciAqY29ubmVjdG9yX25hbWUpOw0KPiB1bnNpZ25lZCBp
bnQgaWd0X2dldF9waXBlX2N1cnJlbnRfYnBjKGludCBkcm1mZCwgZW51bSBwaXBlIHBpcGUpOyAg
dm9pZA0KPiBpZ3RfYXNzZXJ0X291dHB1dF9icGNfZXF1YWwoaW50IGRybWZkLCBlbnVtIHBpcGUg
cGlwZSwgZGlmZiAtLWdpdA0KPiBhL3Rlc3RzL2ttc192cnIuYyBiL3Rlc3RzL2ttc192cnIuYyBp
bmRleCA4MTE1OTZlYzIuLmU0NmU5ODcyNyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMva21zX3Zyci5j
DQo+ICsrKyBiL3Rlc3RzL2ttc192cnIuYw0KPiBAQCAtMTAxMyw2ICsxMDEzLDEyIEBAIHN0YXRp
YyBib29sIG91dHB1dF9jb25zdHJhaW50KGRhdGFfdCAqZGF0YSwNCj4gaWd0X291dHB1dF90ICpv
dXRwdXQsIHVpbnQzMl90IGZsYWdzDQo+ICAJCQlyZXR1cm4gZmFsc2U7DQo+ICAJCX0NCj4gDQo+
ICsJCWlmICghaWd0X2dldF9hdXhfbGVzc19hbHBtX3N0YXR1cyhkYXRhLT5kcm1fZmQsIG91dHB1
dC0NCj4gPm5hbWUpKSB7DQo+ICsJCQlpZ3RfaW5mbygiJXM6IEF1eC1sZXNzIEFMUE0gbm90IGVu
YWJsZWQsIExPQkYgbm90DQo+IHN1cHBvcnRlZC5cbiIsDQo+ICsJCQkJIGlndF9vdXRwdXRfbmFt
ZShvdXRwdXQpKTsNCj4gKwkJCXJldHVybiBmYWxzZTsNCj4gKwkJfQ0KPiArDQo+ICAJCWlmIChw
c3Jfc2lua19zdXBwb3J0KGRhdGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwNCj4gUFNSX01P
REVfMSwgTlVMTCkgfHwNCj4gIAkJICAgIHBzcl9zaW5rX3N1cHBvcnQoZGF0YS0+ZHJtX2ZkLCBk
YXRhLT5kZWJ1Z2ZzX2ZkLA0KPiBQUl9NT0RFLCBOVUxMKSkNCj4gIAkJCXBzcl9kaXNhYmxlKGRh
dGEtPmRybV9mZCwgZGF0YS0+ZGVidWdmc19mZCwgTlVMTCk7DQo+IC0tDQo+IDIuNDguMQ0KDQo=
