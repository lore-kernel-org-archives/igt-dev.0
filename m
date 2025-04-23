Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A71C3DA4A
	for <igt-dev@archiver.kernel.org>; Wed, 23 Apr 2025 04:24:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F3310E1BC;
	Wed, 23 Apr 2025 04:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiZJbNOW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9DE10E16C
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Apr 2025 04:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745382233; x=1776918233;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GF/QCSU5EMq+5gCbzHAJ3LPG4clTeXXn/Lpsy0F68XQ=;
 b=YiZJbNOWL8EPaSWbHs7WuJdCsGQFS1b3r54xxbf6XoTKcI9Nn7kPJzpA
 D4whNXB2jAQ6C95jVJ+dYL6ftdWpqFUoupd++qoJDWoCfGbdfB7OvWrdx
 4gX/RrquASSoPdP67S9wjeO7BKmYLIzKfUy7izuDGfMlgXbXWWfTn42vU
 /TXJ0kyGLp77UmR9currVVeocFRk9gmCtRJEe9QGBmZhVxpH0ANzZw+gC
 NdfeOjp0vY3KuguFCLKmGXdssPrtoRavLicpiDyzN4ANobISSKZ8c8lJp
 mE5/H3eLZmT8e+zJlV4hIbbJG/EEGfS/WDQiC5IdckeNOK/qBeBu7cnv7 Q==;
X-CSE-ConnectionGUID: VAxCc10UTputg1jps91OWQ==
X-CSE-MsgGUID: abiIe+OgRdmnJMJ5adgC0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="72343178"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="72343178"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 21:23:48 -0700
X-CSE-ConnectionGUID: 0ct0wgUtQMGowm4jXNs/aA==
X-CSE-MsgGUID: x9TIHVAYSbGbjQbaXY+5+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="132048693"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 21:23:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 21:23:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 21:23:47 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 21:23:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7YmEwb/K0ZSt6HMfmq+gZ29VQLP8mC1wy8n1seOzNLn762cqqMvf5kNmJ3SlO4gWzqPn0kH2XMcYV8rTPkwtocTijLPluOEcIRgbdGwXRw26BRhMK8PR9ywKb5rQfadHVAGiXuKXZIbd/KlXlpalIE0Vaco1QCKPSluxVfboCGJbIxiA2xNbAyhHoJ5z4/l6i4VGHjQ8bQDHMSo3ZbH4T4fB1uYco42se/bQPTsqrGX/8SSNQTpVoemEYiX9jwlHFQhRIHbnax+R9UJhLNY98vh8EvG8fYUQA7G8l+dIB7kuyfUS2czTqTZsNpX7eupjxBXt0SoJUIi4ig3M4V6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF/QCSU5EMq+5gCbzHAJ3LPG4clTeXXn/Lpsy0F68XQ=;
 b=PA7Z15ecN06xYVUpwUov94ZrLIv8+jpaYgI8dWfGbd8Ojn3J7g6SZrBcEKOQNppz/TV6utGxxYGxBB6eQjtRk0AAsUqyTCq3GS6omxGlGq8XWUqr/G4HZArdpE3sD5YjfvT3nq91o1wwsJVrmhNNm31N6ub+78LyWoNC5ERVADG8gvW8HNuf+Vl/5Yw8T70mLFBXo+G8V56gKs6SRzerx6c93qyCGVXSlrURz8gGkD6o3C13CQlv4vp2tXLn1pHGGEJoVLffeUCf8UI22+UIscjYyerntqlPbDkcvrwbeM+3AHcdVP/exKtmUwYRCFasoOoNauSnysYlj1FnI9ukxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 04:23:44 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8678.021; Wed, 23 Apr 2025
 04:23:44 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] benchmark: Measure allocation time for objects
Thread-Topic: [PATCH] benchmark: Measure allocation time for objects
Thread-Index: AQHbs0oEB5dXAdH7ekGpciUkVpmykrOwp3dQ
Date: Wed, 23 Apr 2025 04:23:43 +0000
Message-ID: <CH3PR11MB84341238624FBE130D266BF08DBA2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250422055522.814722-1-pravalika.gurram@intel.com>
In-Reply-To: <20250422055522.814722-1-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ0PR11MB7155:EE_
x-ms-office365-filtering-correlation-id: 98494eb6-61cd-4931-6d17-08dd821ea241
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?djIxNVRUTHFaMnEwb3lDYXY0bDhHR3JKRXNZMmhqdGtHQi9UY1hndlIzL1E0?=
 =?utf-8?B?S3FLcWlTQjlNSklOa1dxNlp5cndDVHNRZHVGMUZYaW4rWno3aGp0dkJIaVJK?=
 =?utf-8?B?TitBb0JUb28zajFzTUNzWGVEK2EySXpOZXBBN0hXeU5WOGdrd1hqSnVxcmUx?=
 =?utf-8?B?YWVPenE5cGxlT1RUUzJNK3JYNWhmdlNCVXBZRHZxbE9kSDJ5SFhUampjUDZk?=
 =?utf-8?B?ODNrQzJLMGZSMms0R091NSttOHZnekdiRkJHYVM5aXgxYm41cUNrZUQxcnNa?=
 =?utf-8?B?QWlBckd4K2d5MnRScFpoWDFKZVhsR25CeE5NSVY0VjcvUDNaaHZ0UUZsN3V4?=
 =?utf-8?B?WUt1TXBtWGRQYk1KM052MmFSMDdOYUYvZG5BY1Y0YUlmenNkM1NvWVl6RUhY?=
 =?utf-8?B?ckJrbUVMZkFUZTBvQ3lKTU5iemJnWVlwUUVORWY5L0ZRRVdrWTg4TjBSc3Iw?=
 =?utf-8?B?S05FRW9zYkZDN24rS0JacEtTMjl2ei92VVdQOEs5bXc1cTdzL0lFaG5mU3V6?=
 =?utf-8?B?NEx6N3Q2Vm14YjVUSXNQVmE3cjZLVWdDMWFWdUZ1Sit3TUtwZCt5a2xSNVJ4?=
 =?utf-8?B?Qy9zTFI2UGN5YlBkcVlZakppQnREeDgwQkQrcnAxVm9DV2hpUzVONjdQRVFu?=
 =?utf-8?B?RXFkRHZWbWllWDZPVHRFbStQdGpiYTEyVTJpU2F1eWc4NVdBM0hma1Q2b0tX?=
 =?utf-8?B?U2lGU1NraU9odFZBQmlNTHVDMUNDdTk0cWI1aUdjWk9BWTNFb1YzNU10VDJQ?=
 =?utf-8?B?ODBJZ3Q4NytqRloyREplQmxPK2xVellYaVBBSVMwYkVXRmJWOFYwOFFvRnQw?=
 =?utf-8?B?MFNoRis4UjVzVlg1eGJ5a2RkV0M0NGZMajZEWjVHZU5HWS9rd1VQVlRSQSty?=
 =?utf-8?B?OEtOaGsrSWczU1NITEV5N2tVWU5Lc2NmUS9zR2JFUVhHVHZGVEYvNERXUHBx?=
 =?utf-8?B?NjBZTldGZHF6QUVZcUtMZERjZ0xHV1RIRExpZ1VFaXI3ZmQrRStMTkNodHFs?=
 =?utf-8?B?SWNwWG5PeTdsYU8vQ1pRKzhXY3lDQ3h6Sm9FM29NZVpDOFBaR1FtL2ROOHV4?=
 =?utf-8?B?cDB1NVlOWnhyS3R5RXluTGpvK2l5enVSeUNIREdrNlVRVGZLWXlyNm5RUEEx?=
 =?utf-8?B?azNxWk02endaenhHZTBvN2lubVM4S0sxQmF3Y0o3enNsQlRzSHplUWQvMUs2?=
 =?utf-8?B?ZzRzSUs4NnRVeGRVRkwrcVhaZ2RLMXZuN0hIK3g0U1BZQjV0c2xuU1pLYWwr?=
 =?utf-8?B?L2NXUkNxZFpxRWVNNzJkZUllY2dMUmExNThVcDhic0k1aFpCdERqUXRPOFZK?=
 =?utf-8?B?Qy9mWk0rWmNSenJialpLUitaaE5OUGh2SjdjVGtRV2NURGdyNS9xazVIZk9S?=
 =?utf-8?B?Qnl4T2JwOTl4RnZOSVM0bUlWeVM3RDFaYTk4b3R2R2E5N3o0NndYMFBBalQr?=
 =?utf-8?B?Uy80bDdKUm9Mdm1VSW5HZjhkOHd3bDh3MHg3R1lMcDV2UVYyRlRvMmJacDVM?=
 =?utf-8?B?ZmZQVWh3QXkzYlJHekZCWUY0cDJicmtWTTM5dDFCSncwU1BYN3Q4Q1VUYUQx?=
 =?utf-8?B?VTVySG9VTi9LM3M0SHV1dXJwR2NQZTg5S1Nia2ZyWTM0eXJRb0RJTmxRWjZp?=
 =?utf-8?B?VU94M2J5YmJzSjVmTGQwTTBUTEFrb3VXVENWSENRTzlNYUxaY0ZrdXRBRWdR?=
 =?utf-8?B?bVkzdzJ5UXViVXhsajdMV0JIRk1tTVJ4OXcyakg4R3pjWC8zTGZzUTlLZDZq?=
 =?utf-8?B?ZXNSOXVlR0txTG9KWkV3SDR5VTUrRWFUeHNjNDNlZGovZHJvakQ1SFZGODFY?=
 =?utf-8?B?MCs0OEMvbDZ6eUhmRUdXbEN4dFVVNjlUZ0ZZZ29TR0ZQS1BZN3JwSGUxZFA4?=
 =?utf-8?B?bjdHZzJKMXZwRXVGTTZzL3BweGRSZHRnSUdJbllIKzBmdHlvNVZ4SSt1N0g0?=
 =?utf-8?B?eC8yQXJveDVuTnhBamx0OWgxWTg1SjRWS1lyRWdoNDdIRFJ5bjRPc3cwYXRU?=
 =?utf-8?B?Ri9kYUtyTFNRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?THlUSFoyclgwcUxqWU9GOXRPbEdLa0pBRlZodXVJUEtsaHY1UEc3MUtPRGRT?=
 =?utf-8?B?WTdPUFNBU0dOVXJYb0xQVERZUXQ4SHZUaUZORWhTYUV3ZjQ0MUN5OEgrNWpQ?=
 =?utf-8?B?VHF6TFAvMTZlS0xodE5iZk9RRWRLa0tXUTVoZzNyWWxzd1ZNblhNOTB5WCtv?=
 =?utf-8?B?V3FpV0ZaL0VOTmx1UjZMTm1tSGlXOTFGOGo4RU9QSnhtS2sxMXpOMit1N2J4?=
 =?utf-8?B?Nm9JMHd1STBqVDZML2hGNnVyS3ExL0VwellkWU1qUmRpWjNwcEdiSkxnNFpF?=
 =?utf-8?B?czg4L2tnemROVk96NGcrcVJkczc1b2lYRDIrMTdQa1dQU3pOL01uVzY2SVVk?=
 =?utf-8?B?OTFPSXBTOEU3N0d2a2FzNktvcXFjQjFPbUdqL050bUZMdVhYNzVQbmNWWDRU?=
 =?utf-8?B?aHlHbUdJVkFTbXFJMkJWdmx4MUdpcXFnbEdydm9yL0JiS2VsS3hwb2p5K3I2?=
 =?utf-8?B?dXFFQUE0eW8yTWdFcHlKdDcwOE8xNW9OWWNUSWJhMXhoVnBLdEwyaHRnaHZo?=
 =?utf-8?B?dnB0Z3lBekN6azRsMzk4N3BYN2pwWC8rdlpiclBXbG0ycTdJSTZUazBwbTVM?=
 =?utf-8?B?RUxyK2pIR01DWitST0hCKzFHK1dZVU4vcUZUbUdEeXptSmRKSGlyOTZiZXpM?=
 =?utf-8?B?VWhyWlBna05qbEdrNW5GTmJVdjdGOWRMZXVPb2N6UnN3SVhaN0FEb0hQNlpl?=
 =?utf-8?B?YXNlazd6dWcxK3Z3OVo5eko3VlhGNlNMa1p1cUM3b3BYRkVXYzl5L0kvMHJj?=
 =?utf-8?B?ekJBYTdFU0NnVHBRcG9iaTE4aWlTSXdadUIydDlBV0gvTzZUdVA0bHFKZmdi?=
 =?utf-8?B?am1EWms0YXRWWjBaRUtQY3JlQUZKeDF2U0FweFE0WEdkNm5ad2dWT0gycHRT?=
 =?utf-8?B?RnhtTjBuclYwYTkvNmgxZ3UydXZyL3hoclhrOU5DWCtEdXUyYWJnN2YrVTlU?=
 =?utf-8?B?MUh2YVJ4MVUwVzBGamoxZ3dJeUlPQk5ac2lCcWswTUhEeHJhbE5xblp3eW5S?=
 =?utf-8?B?OEE4L0NRMmRjRVpKQWlEaUQ0YkJ2UlBkYnNiVEhoTzdSMlRSYU5kY2tVc2Ru?=
 =?utf-8?B?Nlc3a09RZFhWRDBmU3N5VUVISDVEZEpONEZ5dTVUL0RVdkJ0MEI3NXFLWWtR?=
 =?utf-8?B?azlPUk5tOXpteERZcE5pM2did1JFWW5SR1JVMEp6eWFWMEhxVkxKNkc1bkg2?=
 =?utf-8?B?ZHJXSWFNZkJQcU5TNzhEN2xNeXhvSFRLaVZyenRoU2JzM1dRNlIzeWhZeE13?=
 =?utf-8?B?WHJ2anlEdmxHU0JBY0hOdHhUYmR3THlISFE0MHRTam1rSkNLVlFpRmx5ckRt?=
 =?utf-8?B?ZW1PbXNDeXRVREVHcUFLLzdCS211NGY1RTYvUlZ4YUFlbVdpcTdvVW8vbzhU?=
 =?utf-8?B?eGt0REVZdmZaY25LcHFEOWVoK2hnbUpUbVlOR0MrVTh6anZ3TzJKdERYQ2tS?=
 =?utf-8?B?cEdvVmJoOTNvZ2swSm4xVmNCOWFZRUxlL2dES1N0SXhtN0FUb0RVaWJHUlpR?=
 =?utf-8?B?ZGk5MmR3Vm1jMjV5RVVSOUE1WEpWeGdhMXkrVDNJM1ljWnlsM2ZORWppKzRR?=
 =?utf-8?B?eUg1Y1VMVy8waWk2bFYvRGhKYXcrNXN6aWN2UzZ6ajVTZ1kyWWJpZUE4OUpt?=
 =?utf-8?B?ZDcxdzlVM1A5SGovbWNCVmcwZU1sL0FjLzhBK09ncHp0T1hpZ3dZMVpwR09p?=
 =?utf-8?B?bFVkQlAwYmFTejVrdHJNTHRqK05BYUozdWdiQnFYb0FneFROQTFVOFRWNGg2?=
 =?utf-8?B?SXVMdGQ3aURZK0VEaXhRSUVNczM0bWFXVWUwdDFIYVNQbkxsT0dtYlNmZlkr?=
 =?utf-8?B?b0VyNzBDQ1BBc1RQTDdISkQ5TG5BNzcwTzZPNGIvZGJHLzNwOTNBQk1DL3E1?=
 =?utf-8?B?VlloTmR6bGZxNEJJeVIrMXBNZGNWNGEzRHdOZWIwby90K0ZueWkwSTBKejJj?=
 =?utf-8?B?UVRVUFhDVy9yNnNZL1FzNTB6YWtjemVPRWVOQ0NaU3NPQ213dmVVZG5rTWhB?=
 =?utf-8?B?OG53Qk9OU1lxcTVPdEtmQ1pUUDk1ZE9MVXlXaHNWaENVWGxicFFpZmU5NFFx?=
 =?utf-8?B?ODBrendIWEQ1ckgvdnJOT21iUiszL3k3MUFBMDlMSkQ2d2ZhY1hVeFVENlFa?=
 =?utf-8?B?UFdyc2FsdFhHVE9mUG9BNFlpQlh0Y3pJRC90N3F0UjdGOVBjRW8xMHhyOUcr?=
 =?utf-8?B?LzdoWG0vZFFyTzhpdC9ycE45QVRZQnR5T1BEMi80dkh3ZXozeFJXSWFJa0U0?=
 =?utf-8?B?eUNsRTVJdjR2NHoxM0phU0pNam53PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98494eb6-61cd-4931-6d17-08dd821ea241
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2025 04:23:43.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Me5+L4cd37aLZ6N/9dRRpqgKlH2gG8xUJb5nuhSKqmdjPaqaPkpsM8J1UJI9nHj3fJnYq9i0ki9YippMpiq47lapMeudSGnBtw9KQwnEiHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7155
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VycmFtLCBQcmF2YWxp
a2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBTZW50OiAyMiBBcHJpbCAyMDI1IDEx
OjI1IEFNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGFuZGFt
dWRpLCBQcml5YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IEd1cnJhbSwNCj4g
UHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
XSBiZW5jaG1hcms6IE1lYXN1cmUgYWxsb2NhdGlvbiB0aW1lIGZvciBvYmplY3RzDQo+IA0KPiBB
IGJhc2ljIG1lYXN1cmVtZW50LCBob3cgZmFzdCBjYW4gd2UgY3JlYXRlIGFuZCBwb3B1bGF0ZSBh
biBvYmplY3Qgd2l0aA0KPiBiYWNraW5nIHN0b3JhZ2UNCj4gDQo+IHYxOiByZW1vdmUgdGhlIGhl
YWRlcnMgYW5kIHVudXNlZCB2YXJpYWJsZSB3aGljaCBhcmUgbm90IHJlcXVpcmVkDQpDaGFuZ2Ug
dGhlIHZlcnNpb24gZnJvbSB2MSB0byB2Mi4NCj4gW1ByaXlhbmthXQ0KPiAgICAgdXNlIFNQRFgg
W2thbWlsXQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogUHJhdmFsaWthIEd1cnJhbSA8cHJhdmFsaWth
Lmd1cnJhbUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgYmVuY2htYXJrcy9tZXNvbi5idWlsZCB8ICAg
MSArDQo+ICBiZW5jaG1hcmtzL3hlX2NyZWF0ZS5jIHwgMTU3DQo+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRp
b25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYmVuY2htYXJrcy94ZV9jcmVhdGUuYw0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2JlbmNobWFya3MvbWVzb24uYnVpbGQgYi9iZW5jaG1hcmtzL21lc29u
LmJ1aWxkIGluZGV4DQo+IDJjOWE4OGZkMy4uMGU0MWVlZDA2IDEwMDY0NA0KPiAtLS0gYS9iZW5j
aG1hcmtzL21lc29uLmJ1aWxkDQo+ICsrKyBiL2JlbmNobWFya3MvbWVzb24uYnVpbGQNCj4gQEAg
LTIxLDYgKzIxLDcgQEAgYmVuY2htYXJrX3Byb2dzID0gWw0KPiAgCSdrbXNfdmJsYW5rJywNCj4g
IAkncHJpbWVfbG9va3VwJywNCj4gIAkndmdlbV9tbWFwJywNCj4gKyAgICAgICAgJ3hlX2NyZWF0
ZScsDQo+ICBdDQo+IA0KPiAgYmVuY2htYXJrc2RpciA9IGpvaW5fcGF0aHMobGliZXhlY2Rpciwg
J2JlbmNobWFya3MnKSBkaWZmIC0tZ2l0DQo+IGEvYmVuY2htYXJrcy94ZV9jcmVhdGUuYyBiL2Jl
bmNobWFya3MveGVfY3JlYXRlLmMgbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAw
MDAwLi45Njc0YzkzNTkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9iZW5jaG1hcmtzL3hlX2Ny
ZWF0ZS5jDQo+IEBAIC0wLDAgKzEsMTU3IEBADQo+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24N
Cj4gKyAqLw0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5bmNv
YmouaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX3F1
ZXJ5LmgiDQo+ICsNCj4gKw0KPiArI2RlZmluZSBPQkpFQ1RfU0laRSAoMTw8MjMpDQo+ICsNCj4g
K3N0YXRpYyBkb3VibGUgZWxhcHNlZChjb25zdCBzdHJ1Y3QgdGltZXNwZWMgKnN0YXJ0LA0KPiAr
CQkJCWNvbnN0IHN0cnVjdCB0aW1lc3BlYyAqZW5kKQ0KPiArew0KPiArCXJldHVybiAoZW5kLT50
dl9zZWMgLSBzdGFydC0+dHZfc2VjKSArIDFlLTkqKGVuZC0+dHZfbnNlYyAtDQo+ICtzdGFydC0+
dHZfbnNlYyk7IH0NCj4gKw0KPiArc3RhdGljIHZvaWQgdGVzdF9leGVjKGludCBmZCwgaW50IGJ1
c3kpIHsNCj4gKwl1aW50MzJfdCB2bSwgYm8sICpiYXRjaDsNCj4gKwl1aW50NjRfdCBib19zaXpl
ID0geGVfYmJfc2l6ZShmZCwgU1pfNEspLCBhZGRyID0gMHgxYTAwMDA7DQo+ICsJdWludDMyX3Qg
ZXhlY19xdWV1ZV9pZDsNCj4gKwlpbnQgZXJyOw0KPiArDQo+ICsJc3RydWN0IGRybV94ZV9zeW5j
IHN5bmMgPSB7DQo+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JKLA0KPiArCQku
ZmxhZ3MgPSBEUk1fWEVfU1lOQ19GTEFHX1NJR05BTCwNCj4gKwkJLmhhbmRsZSA9IHN5bmNvYmpf
Y3JlYXRlKGZkLCAwKSwNCj4gKwl9Ow0KPiArCXN0cnVjdCBkcm1feGVfZXhlYyBleGVjID0gew0K
PiArCQkubnVtX3N5bmNzID0gMSwNCj4gKwkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKCZzeW5j
KSwNCj4gKwkJLmFkZHJlc3MgPSBhZGRyLA0KPiArCQkubnVtX2JhdGNoX2J1ZmZlciA9IDEsDQo+
ICsJfTsNCj4gKw0KTW92ZSBzeW5jLCBleGVjIGFuZCByZWxhdGVkIHZhcmlhYmxlcyB1bmRlciBi
dXN5IGNvbmRpdGlvbiBhcyB0aGVzZSBhcmUgbm90IHJlcXVpcmVkIGlmIGJ1c3kgY29uZGl0aW9u
IGlzIG5vdCBtZXQuDQo+ICsJdm0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPiArCWJvID0g
eGVfYm9fY3JlYXRlKGZkLCB2bSwgYm9fc2l6ZSwgc3lzdGVtX21lbW9yeShmZCksIDApOw0KPiAr
DQo+ICsJaWYgKGJ1c3kpIHsNCj4gKwkJYmF0Y2ggPSB4ZV9ib19tYXAoZmQsIGJvLCBib19zaXpl
KTsNCj4gKwkJKmJhdGNoID0gTUlfQkFUQ0hfQlVGRkVSX0VORDsNCj4gKwkJbXVubWFwKGJhdGNo
LCBib19zaXplKTsNCj4gKwkJeGVfdm1fYmluZF9zeW5jKGZkLCB2bSwgYm8sIDAsIGFkZHIsIGJv
X3NpemUpOw0KPiArDQo+ICsJCWVyciA9IF9feGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtLCAx
LCAxLCAmeGVfZW5naW5lKGZkLCAwKS0NCj4gPmluc3RhbmNlLCAwLA0KPiArCQkJCQkgICAgJmV4
ZWNfcXVldWVfaWQpOw0KPiArCQlpZ3RfYXNzZXJ0X2YoIWVyciwgIkZhaWxlZCB0byBjcmVhdGUg
ZXhlYyBxdWV1ZSAoJWQpXG4iLCBlcnIpOw0KPiArDQo+ICsJCWV4ZWMuZXhlY19xdWV1ZV9pZCA9
IGV4ZWNfcXVldWVfaWQ7DQo+ICsJCWVyciA9IF9feGVfZXhlYyhmZCwgJmV4ZWMpOw0KPiArCQlp
Z3RfYXNzZXJ0X2YoIWVyciwgIkZhaWxlZCB0byBleGVjdXRlIGJhdGNoICglZClcbiIsIGVycik7
DQo+ICsNCj4gKwkJZXJyID0gc3luY29ial93YWl0KGZkLCAmc3luYy5oYW5kbGUsIDEsIElOVDY0
X01BWCwgMCwgTlVMTCk7DQo+ICsJCWlndF9hc3NlcnRfZihlcnIsICJUaW1lb3V0IHdoaWxlIHdh
aXRpbmcgZm9yIHN5bmNvYmogc2lnbmFsDQo+ICglZClcbiIsDQo+ICtlcnIpOw0KPiArDQo+ICsJ
CXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1ZV9pZCk7DQo+ICsNCj4gKwl9DQo+
ICsNCj4gKwlnZW1fY2xvc2UoZmQsIGJvKTsNCj4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bSk7DQo+
ICsJc3luY29ial9kZXN0cm95KGZkLCBzeW5jLmhhbmRsZSk7DQpNb3ZlIHRoaXMgYWxzbyB1bmRl
ciBidXN5IGNvbmRpdGlvbi4NCj4gK30NCj4gKw0KPiAraW50IG1haW4oaW50IGFyZ2MsIGNoYXIg
Kiphcmd2KQ0KPiArew0KPiArCWludCBmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0K
PiArCWludCBzaXplID0gMDsNCj4gKwlpbnQgYnVzeSA9IDA7DQo+ICsJaW50IHJlcHMgPSAxMzsN
Cj4gKwlpbnQgbmNwdXMgPSAxOw0KPiArCWludCBjLCBuLCBzOw0KPiArDQo+ICsJd2hpbGUgKChj
ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJzOmI6cjpmIikpICE9IC0xKSB7DQo+ICsJCXN3aXRjaCAo
Yykgew0KPiArCQljYXNlICdzJzoNCj4gKwkJCXNpemUgPSBhdG9pKG9wdGFyZyk7DQo+ICsJCQli
cmVhazsNCj4gKw0KPiArCQljYXNlICdyJzoNCj4gKwkJCXJlcHMgPSBhdG9pKG9wdGFyZyk7DQo+
ICsJCQlpZiAocmVwcyA8IDEpDQo+ICsJCQkJcmVwcyA9IDE7DQo+ICsJCQlicmVhazsNCj4gKw0K
PiArCQljYXNlICdmJzoNCj4gKwkJCW5jcHVzID0gc3lzY29uZihfU0NfTlBST0NFU1NPUlNfT05M
Tik7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQljYXNlICdiJzoNCj4gKwkJCWJ1c3kgPSB0cnVl
Ow0KPiArCQkJYnJlYWs7DQo+ICsNCj4gKwkJZGVmYXVsdDoNCj4gKwkJCWJyZWFrOw0KPiArCQl9
DQo+ICsJfQ0KPiArDQo+ICsJaWYgKHNpemUgPT0gMCkgew0KPiArCQlmb3IgKHMgPSA0MDk2OyBz
IDw9ICBPQkpFQ1RfU0laRTsgcyA8PD0gMSkgew0KPiArCQkJaWd0X3N0YXRzX3Qgc3RhdHM7DQo+
ICsNCj4gKwkJCWlndF9zdGF0c19pbml0X3dpdGhfc2l6ZSgmc3RhdHMsIHJlcHMpOw0KPiArCQkJ
Zm9yIChuID0gMDsgbiA8IHJlcHM7IG4rKykgew0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFy
dCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dl
dHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9y
IChjID0gMDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJCXRlc3RfZXhlYyhmZCwgYnVzeSk7DQo+
ICsNCj4gKwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05P
VE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9z
ZWMgPCAyKTsNCj4gKw0KPiArCQkJCWlndF9zdGF0c19wdXNoX2Zsb2F0KCZzdGF0cywgY291bnQg
Lw0KPiBlbGFwc2VkKCZzdGFydCwgJmVuZCkpOw0KPiArCQkJfQ0KPiArCQkJcHJpbnRmKCIlZlxu
IiwgaWd0X3N0YXRzX2dldF90cmltZWFuKCZzdGF0cykpOw0KPiArCQkJaWd0X3N0YXRzX2Zpbmko
JnN0YXRzKTsNCj4gKwkJfQ0KPiArCX0gZWxzZSB7DQo+ICsJCWRvdWJsZSAqc2hhcmVkOw0KPiAr
DQo+ICsJCXNoYXJlZCA9IG1tYXAoMCwgNDA5NiwgUFJPVF9XUklURSwgTUFQX1NIQVJFRCB8DQo+
IE1BUF9BTk9OLCAtMSwgMCk7DQo+ICsJCWZvciAobiA9IDA7IG4gPCByZXBzOyBuKyspIHsNCj4g
KwkJCW1lbXNldChzaGFyZWQsIDAsIDQwOTYpOw0KPiArDQo+ICsJCQlpZ3RfZm9yayhjaGlsZCwg
bmNwdXMpIHsNCj4gKwkJCQlzdHJ1Y3QgdGltZXNwZWMgc3RhcnQsIGVuZDsNCj4gKwkJCQl1aW50
NjRfdCBjb3VudCA9IDA7DQo+ICsNCj4gKwkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05J
QywgJnN0YXJ0KTsNCj4gKwkJCQlkbyB7DQo+ICsJCQkJCWZvciAoYyA9IDA7IGMgPCAxMDAwOyBj
KyspDQo+ICsJCQkJCQl0ZXN0X2V4ZWMoZmQsIGJ1c3kpOw0KPiArDQo+ICsJCQkJCWNvdW50ICs9
IGM7DQo+ICsJCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLA0KPiAmZW5kKTsNCj4g
KwkJCQl9IHdoaWxlIChlbmQudHZfc2VjIC0gc3RhcnQudHZfc2VjIDwgMik7DQo+ICsNCj4gKwkJ
CQlzaGFyZWRbY2hpbGRdID0gY291bnQgLyBlbGFwc2VkKCZzdGFydCwgJmVuZCk7DQo+ICsJCQl9
DQo+ICsJCQlpZ3Rfd2FpdGNoaWxkcmVuKCk7DQo+ICsNCj4gKwkJCWZvciAoaW50IGNoaWxkID0g
MDsgY2hpbGQgPCBuY3B1czsgY2hpbGQrKykNCj4gKwkJCQlzaGFyZWRbbmNwdXNdICs9IHNoYXJl
ZFtjaGlsZF07DQo+ICsNCj4gKwkJCXByaW50ZigiJTcuM2ZcbiIsIHNoYXJlZFtuY3B1c10pOw0K
PiArCQl9DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+IC0tDQo+IDIuMzQuMQ0K
DQo=
