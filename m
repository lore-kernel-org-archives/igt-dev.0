Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7A6E77184
	for <igt-dev@archiver.kernel.org>; Thu, 19 Dec 2024 13:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9510E02E;
	Thu, 19 Dec 2024 13:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F/IX+RJj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA06110E02E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Dec 2024 13:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734616075; x=1766152075;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RGJPrwBDpQwV/KilFWhD/xD1rVE9N9/FjBcI6sfZB0E=;
 b=F/IX+RJjoudwd9wTnlDJ782bWxAdeW8htmrRMcWwsNJUpa197KIWXLY2
 +rkHd5mEsyWER0egw8FEH7NtomBnF70j+SzMac3fXrqlSNnNjL+vyVK2g
 pelCMy1Vk7ihX2oGzeRKIM7MEgZ2KDTsndF5UZMKdEm3e+oNT06na5/jE
 UbCMSWCYr/y2GOc+hNi0ZpQ7r+hhax42dlcaewJo6maeqVcGbkANZd4+E
 j9065L6VCs+bOYIUj5lv1h866p7O/6i69LcNN6EiwbVdhlzForISbFq1f
 RzDjAGOvN7Qc0ATFgKeVbjEwreUJmxz/jC76dh5WZSSHAedF2FAp2Z9RJ g==;
X-CSE-ConnectionGUID: VUdzxUojQtGCEmO1gE1IZw==
X-CSE-MsgGUID: RJEC87mRSUex9itZfvo9TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="52651737"
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="52651737"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 05:47:54 -0800
X-CSE-ConnectionGUID: ARJkZ72JSUaizWLvLd3dkA==
X-CSE-MsgGUID: lwyMwr2LTqKKA/pxovhamw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,247,1728975600"; d="scan'208";a="98022251"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 05:47:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 05:47:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 05:47:54 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 05:47:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp/VHXVWdbJqUzpbjVlVvEERAjccPIg3RLR9NwwlCZoLH+yo/KLtwWyp9eri9fKetGkkXogUYoo8FxtZzhzoSyqB3DJK4uwk9gAimfNUdeyxuHZ33GZPK5ms8vPsutFw8RYHSIGSiidfAFRLiqOgYKKr6YR5kwihId1PXE3FZN/B1Mqz0aQp6XR5gvIkv9LXtUqCD9+MT0i7cCJA4uy4hxsZJKL4jxh6M+KlSSgE8ep7RxzmuOAPaYtH+Ggox+eABf0ROr3nhidBway0tcY7x33aA4xizXyLD7byUjBxbO+mhlMVbUuMDQ1WnOXrWk4/QiOnUUcH26Vux3WAnV/p1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGJPrwBDpQwV/KilFWhD/xD1rVE9N9/FjBcI6sfZB0E=;
 b=JSck7jWF8v2fPXSjUFthYSJ0NFCCrDTmF2MNmhExnyWnraBC/11AqEfhQU2Mlpzxt+/JlUt53OtFlHasxFECZQggzma1mWgKcCsY/ri7Jhe482YX4YsNIWC7yKeXyMvqvW1oxmhDFrPtcxWRiTUC55buxCXDfPPpDvRnuFh0SQW37vJ1M56sNLxwzr3ryuyhuqDdV7GLzDrCu+RE5wMc8srpX03Axo8tRopjt4qfjubhcu0Y/vPVgEl87Cq1gXN0V7iKFDQrJ5l9O48w0yWkUw1c7InPp0csIAd/MS7iykaRG+40Ueg3jK2iqzqgelxHf2uZ45FecwIveqD4HB0+2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.14; Thu, 19 Dec 2024 13:47:52 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 13:47:52 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Manszewski,
 Christoph" <christoph.manszewski@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_eudebug: add
 basic-vm-access-parameters-userptr
Thread-Topic: [PATCH i-g-t] tests/xe_eudebug: add
 basic-vm-access-parameters-userptr
Thread-Index: AQHbUhttXFQ9RR8biUyyA4jckmX8qLLtlCvg
Date: Thu, 19 Dec 2024 13:47:51 +0000
Message-ID: <DS0PR11MB72649D8252D90E4FD7339B50D9062@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241219133926.2334476-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20241219133926.2334476-1-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DS0PR11MB8050:EE_
x-ms-office365-filtering-correlation-id: 4b8024d4-de04-481c-f640-08dd2033bb9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SG9OS1lXZTFabWxwMVdOOTVIU2JnbUxrY2kvQVN5OFlzR3Yxb1FOWjVMVXg4?=
 =?utf-8?B?OU5nWmdPZncvcmNZMDl4UHg2SXhrS2t3dHNlY09leEw3Q2dhcHdpRmdXTU83?=
 =?utf-8?B?NFNFZEYramVJam1aS0ZwR2IyTzBpQ2R4NWJFWlAzMTJORHZaL201MWh0N1Yr?=
 =?utf-8?B?YjJrRXpMUXQxVk1UWThrWHZQNnQ4QzMwczVISlJIUjJnOHFxOUdsanVlTEVH?=
 =?utf-8?B?amRBbXB4T3B3azUwVldFNFVIQ2pRa3plajJVdk5rSC9kcnE0bC9zS1FDUGFD?=
 =?utf-8?B?R3lPWlVybVA4NjRScDY0UjZBQzFtTzVMSForZldoUm1TMm1OVVdNUTlQS3Ux?=
 =?utf-8?B?dkJvVkdBSHlFQjlpZUNKd2VZdFNRbWZ6MjM3K3oyUkJNWEN2empzUEs1SThH?=
 =?utf-8?B?U1Y5UjFodWtvZ2JkbW5BQ2xzODdsVHVMQm4vOXFIR3J4ci9DeDhzZUlDUTVD?=
 =?utf-8?B?VmhadG1zNWtNbTZ4SDdRQzZTbnFRS21ZNFNIenlGWWlJSFBtbThiUEZRWU1X?=
 =?utf-8?B?NHVCQU1MUG5uL3A3Qk9XQ2xiVU4zRkN4emZlMWVEQkFKTk9jYWZPVjZWVzdY?=
 =?utf-8?B?OXlMMTBIVTZRSFZqbWtROWQ0NEpBSlhnMTIxVWdIK2wvc0hOUWxWQVRTZm1j?=
 =?utf-8?B?WVpDZ1gxMnZsWmZiUEJrbUpjZzdzWnhzM1NkRnppaGR5cXd1M0doc010Q3Zy?=
 =?utf-8?B?QlJEWVh6eDV6UzRMdVNPWSt6V1ZONkwvV0xLOGFwdkRkUE1yU255V1B5QWxP?=
 =?utf-8?B?MHMvTW9iTjB4VXR2WVhleXNZMFVXUlpERVU0d0tiK0IyTmcwbUtHbXovb3dx?=
 =?utf-8?B?Z3oxa25ldGtmR2V0aU50WWZ4MFZXWHVoK0g2Qk1vdmV4dTBLcU91SjlxTEhG?=
 =?utf-8?B?dFBDWTRTSTh6RWdRUFVabEZpQUVhRHhWTk5Wc3JDSjN2MnVTRHlIa1E3OXAw?=
 =?utf-8?B?U2VUTkhlS3hmOTFLQVMyaUxZUFZidjhjcFNVT0kxajBMNzJTajVZd3k2dTZS?=
 =?utf-8?B?UCtkbG40ejlNMHhmN0ZBUHBQcGt3U1U0NjZEYUFrdHhYS1RhQm8xbkhjMnd6?=
 =?utf-8?B?aXcyRHMrOVVRMDBZSk9ic2RUUmZuUndxT21vNlhYS055M1Y4ang3bkQ2TlRa?=
 =?utf-8?B?cmNFVkdzQmhJallZT3FTM3JDaDRBL25QUTZTQ3kyVDZtNVlZY2FpNFo5R05E?=
 =?utf-8?B?dGdaSnlnSVVQMit2MzR0ZnZDZklyNDdweXRXcCs5QllFaEkvRVlPVUlkQ2pw?=
 =?utf-8?B?bWZIMklza3lVTlc1SVhXQzNmbUFKM1NLMXVCUXlic3BZV0ovMVlFSUFaN3ZB?=
 =?utf-8?B?dDJ2anhnR1RTNFlCd21HdEFVWVJsTXZlcVBzY1BVa214b2o5SklVcVc0NzJK?=
 =?utf-8?B?S3U0aGF2WjB6ZmpzMi9RNGdNV3lXYVpKRDRGdkM2SlBmeS9SUUcvYVczTVFy?=
 =?utf-8?B?WDRLUkxwMFlEU09sR1B1MU14T2ppUm80Z3l1V1RSYzJJRUJTTkFROERndzdP?=
 =?utf-8?B?d0d2bUp2c2ljcFRrZEYxZkxGaERSd2lPM1lDVUtIVWRta3FmSXlqSGdURnZj?=
 =?utf-8?B?eWtHblVPbU1EcnhDRWlmamIzTTcwQzd4YnN0Vjh2d09NRitJUmQ1R1Y0LzVG?=
 =?utf-8?B?RnVhOTlEQ3pFamRtSDdGbHpuTWNpNmh1a1JUL2UrNHdDTUhsWWdjYkxTQVcr?=
 =?utf-8?B?RXB0YWdSN25uRHZXRWdYTmo2ZVdJVHQ1eVV0aHVrdVUrb1F3bkRjTHY1M2Ry?=
 =?utf-8?B?YUh0RXNTYkdHVW5IU0p3dHlDZ25GZTFqYmZ0YVh6VG9vN05NeDdqRVU5TFdL?=
 =?utf-8?B?YmdseDdsZlptYjFrN0lVQjMrRC80d0hzTHFtSkVDTnBGY1FwOG91dlhvTTJh?=
 =?utf-8?B?UmVRVk42WlpVemdzRG9HYVY4YklTTk5ydmFqV2diSEpDb3VlaTFDRmhaTHQ3?=
 =?utf-8?Q?Ya72Hz5t8kkG6lII2If7WzEF8/XXQUEO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVlqbTZNVWxKamJDV1RtbTBwZ1FacHR3VTBVd1BXV0xoMmhXRkNBMzVuanNm?=
 =?utf-8?B?aElqSm5JazBLSFpDcis4RktvbjRyTFZ6cmhYV2Z5dzJVTFkxM3B5ZmRURXky?=
 =?utf-8?B?SnFGTmgzeFJ0ZXM5cWUydnJnSFlCL1pWRU1MbTZSdXdtU1gvTEJaWVlzUVph?=
 =?utf-8?B?NU9IKzRDbG5iTytmZHBVa1NTY25mOHI4TEpJSnhMYUwzb2p4TFczV1hieElm?=
 =?utf-8?B?SS93YWk0Y3hwQ1l1bjBkZnlhSTRlVS85UDdlaUxDMmUxVkpUc2x1V1EzWExu?=
 =?utf-8?B?MU5mTVVEOGUzR3JueC9KOXkrd0tjK2xUL0doK2M5blRMMm9CSmhVUkora2dR?=
 =?utf-8?B?Z0ptbGdwTHZVajBWSFFDdytzN0hNWVJTR1ZsaEZwZGNpTG80V3RETEw3Rnho?=
 =?utf-8?B?MEk0NFV4WWQ3b2VOK2h4Vlc0cjZSQld3bkN4STNrTUpvbHM1azBOeVRTa0pp?=
 =?utf-8?B?YS9WUjBOVW44OEpvRjlydDF1Q2ZFUHpERTFTUmFyTDZlNy9Ob2wyNjluWUFL?=
 =?utf-8?B?amR6K2ZJekp0RGZEZVJkampZSEIvTFpSYWF4bWJ0VnpmYTFqRXY5c211ZVdk?=
 =?utf-8?B?K0ZOOEpBNTlvVmkwMnlEU2FLWnBIOUhPZjBsejhaeXRKVjVHaStna0g2cUVk?=
 =?utf-8?B?VUxjN2NXcmZtN3hqRTdFTU9CWEJ0Q1N5VjZ3QVBsOTZiVGpnNzd1WDdiUzM4?=
 =?utf-8?B?Q1QrOVM1S0FQRVRtQUQzY05MKzYzVElma1F1cHJTOUZJT3F2dWVwendiNDdj?=
 =?utf-8?B?OXRRQ1hocnh3RTVydGh3UjhGR0RNTDlpQzdscUFIQmJRVXZINXRGWkNsdmxx?=
 =?utf-8?B?OXRwV2oxcVQrMFczOVQrbWEzc1NVR1VIVDIxN0JDb0FzZG1DUmJQOElYRlkx?=
 =?utf-8?B?S3ZNZUV3dlpYZVJYSWprRG1XMy80eGVxS2k3blVWVlhiY3pCK1YyZFVlMkI3?=
 =?utf-8?B?ZXhrTGxiMW9FcjViME90WGhkeGdTQVM4TnlUWno5RExiY2NxUDdtVVFVZkZC?=
 =?utf-8?B?QkJpcEpEK2FWTVU1enB5SWNSUkhmMnJPQ1N4eFN0OHF0Y1BQa0dGSmZNM24v?=
 =?utf-8?B?UXdUdXEzbG5XVXlSTjZ0NUZieFBYZm5zeXpmTmFFSjJuSXBvNVlwTFV6MVlk?=
 =?utf-8?B?V0JPMVFjZVI1RWJSdkVxRWdkUVlhZzRmK0p2VmJtLzZVTHpKL1NkZVJlZjZ4?=
 =?utf-8?B?VTg0Rzk1OU1JU0VLZzVSaGl1VkVrR2RIY2ZkajRGQTkxOVlDa3ZZMUZTUXFw?=
 =?utf-8?B?WGxYcXpXa2tLVzZvdXVJVVdEeXFVV1gvUm1kaGtCL1llYzg3Zm9lTGdVcmhC?=
 =?utf-8?B?R0h0SUxLajMxVXYwb1MyK3Q2dW1PY1g5MHNIL1R0Mk5WT3hjajAvSmxhYlhD?=
 =?utf-8?B?RjloeHlQaWJoUlJhN2tTa0ZPZkZCamZicU5LRHpyMzg0SUZEamRDcyt3NEda?=
 =?utf-8?B?cWxXbHNvS0pmQW9SdTBYT0paN2dzYkJPaldySTVHU1ZYUTNFc3lHU3lEUkQ3?=
 =?utf-8?B?bVlQd2NxdzExbkZwM1B4SXJNa0szanZiV0Jobm5qL3NkOVk2dFBBaWI1cGNn?=
 =?utf-8?B?WGd0ajIreFVyZW5saE8zN0VmRmZ2Sld1cndVNzAzYmhwQ3FVZzh2T1NwZ1hr?=
 =?utf-8?B?bXFCeXNLRi82VWZYZitDOFoxVXIzc1p1Q09YVWFEOC9iRXFacTdtcjdFcjNH?=
 =?utf-8?B?cVpkSmxwcUNMKzM3aEQ5UWo1azRoQS9oeW91VXYyWlZzc3NMUmtxT2l3bll1?=
 =?utf-8?B?cHBFR3hiaXFrMnZsbnZ1dk1ySEN0QWpTTkxsQzVzdStnNFF4RFpjelpKMFhB?=
 =?utf-8?B?aGhBOWY4aWZYOWhGZC9ncEs1V1ZrL0lPdm03RUh5SCtNNDlDQytONWoycTA5?=
 =?utf-8?B?RG1OK1JPRVFGZWFpMy9KVWdNVy9nSjdCbXZkRFA1RndFZXNIL3R4NGw1UGRQ?=
 =?utf-8?B?eVV4YW1mWmZRc3VkR2pYNXNsMnlGcUJpWU9NeUJyZTNnMW9qRzV2SXVQajMz?=
 =?utf-8?B?OFRZVmh2cThkL2w3RDdHS2VmYVpSVTh1d1ZiQTBBdTNKOXFjU21uTVFHZUNY?=
 =?utf-8?B?Y09jNzRjZ3oyMC9yaDZka0N2QkpQWDRxNUlVWFBlSnQwT0tsa2Q1UW1kNmFt?=
 =?utf-8?B?T2svSjFYZ0RsanJkQlp0V2RKcmdTVWhSRlU1WndHVnRmajNxSTVDbzBiL2N6?=
 =?utf-8?B?WkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b8024d4-de04-481c-f640-08dd2033bb9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 13:47:51.9391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z48I0u8vIzm1hpIuY4wHk3vMmn9AEEmSzkL9HC3NgZ9/kv4fAnLa34kW1o/57fmlkUmXJ+nZ5wxJGuvJVuHMiNYPv4u8dadVqxFFmbGHRQDQcYmcH1ic6/L7k/LI+W4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8050
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5pbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBEZWNlbWJlciAxOSwgMjAyNCAyOjM5IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51
eC5pbnRlbC5jb20+OyBHcnplZ29yemVrLCBEb21pbmlrDQo+IDxkb21pbmlrLmdyemVnb3J6ZWtA
aW50ZWwuY29tPjsgTWFuc3pld3NraSwgQ2hyaXN0b3BoDQo+IDxjaHJpc3RvcGgubWFuc3pld3Nr
aUBpbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplag0KPiA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+
OyBQaWF0a293c2tpLCBEb21pbmlrIEthcm9sDQo+IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lA
aW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRlc3RzL3hlX2V1ZGVidWc6IGFk
ZCBiYXNpYy12bS1hY2Nlc3MtcGFyYW1ldGVycy0NCj4gdXNlcnB0cg0KPiANCj4gVGhlcmUgaXMg
YW4gZWFzeSB3YXkgdG8gYWxzbyB1c2UgdGhlIGFjY2Vzcy1wYXJhbWV0ZXJzIHRlc3QgdG8gYmUg
YmFzZWQgb24NCj4gdXNlcnB0ciBiYWNraW5nIHN0b3JhZ2UuIE1ha2UgaXQgc28uDQo+IA0KPiBD
YzogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KPiBD
YzogQ2hyaXN0b3BoIE1hbnN6ZXdza2kgPGNocmlzdG9waC5tYW5zemV3c2tpQGludGVsLmNvbT4N
Cj4gQ2M6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBDYzogRG9t
aW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNv
bT4NCj4gU2lnbmVkLW9mZi1ieTogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBsaW51eC5p
bnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jIHwgMTEgKysrKysr
KysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jIGIvdGVzdHMvaW50
ZWwveGVfZXVkZWJ1Zy5jIGluZGV4DQo+IGQ5MjgxZjc4Zi4uZGM4ZTU4N2I3IDEwMDY0NA0KPiAt
LS0gYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXVk
ZWJ1Zy5jDQo+IEBAIC0xNzczLDcgKzE3NzMsMTMgQEAgc3RhdGljIHZvaWQgdm1fdHJpZ2dlcl9h
Y2Nlc3NfcGFyYW1ldGVycyhzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19kZWJ1Z2dlciAqZCwNCj4gIC8q
Kg0KPiAgICogU1VCVEVTVDogYmFzaWMtdm0tYWNjZXNzLXBhcmFtZXRlcnMNCj4gICAqIERlc2Ny
aXB0aW9uOg0KPiAtICogICAgICBDaGVjayBuZWdhdGl2ZSBzY2VuYXJpb3Mgb2YgVk1fT1BFTiBp
b2N0bCBhbmQgcHJlYWQvcHdyaXRlIHVzYWdlLg0KPiArICogICAgICBDaGVjayBuZWdhdGl2ZSBz
Y2VuYXJpb3Mgb2YgVk1fT1BFTiBpb2N0bCBhbmQgcHJlYWQvcHdyaXRlIHVzYWdlDQo+ICsgKiAg
ICAgIHdpdGggYm8gYmFja2luZyBzdG9yYWdlLg0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IGJhc2lj
LXZtLWFjY2Vzcy1wYXJhbWV0ZXJzLXVzZXJwdHINCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICog
ICAgICBDaGVjayBuZWdhdGl2ZSBzY2VuYXJpb3Mgb2YgVk1fT1BFTiBpb2N0bCBhbmQgcHJlYWQv
cHdyaXRlIHVzYWdlDQo+ICsgKiAgICAgIHdpdGggdXNlcnB0ciBiYWNraW5nIHN0b3JhZ2UuDQo+
ICAgKi8NCj4gIHN0YXRpYyB2b2lkIHRlc3Rfdm1fYWNjZXNzX3BhcmFtZXRlcnMoaW50IGZkLCB1
bnNpZ25lZCBpbnQgZmxhZ3MsIGludA0KPiBudW1fY2xpZW50cykgIHsgQEAgLTI4MzAsNiArMjgz
Niw5IEBAIGlndF9tYWluDQo+ICAJaWd0X3N1YnRlc3QoImJhc2ljLXZtLWFjY2Vzcy1wYXJhbWV0
ZXJzIikNCj4gIAkJdGVzdF92bV9hY2Nlc3NfcGFyYW1ldGVycyhmZCwgMCwgMSk7DQo+IA0KPiAr
CWlndF9zdWJ0ZXN0KCJiYXNpYy12bS1hY2Nlc3MtcGFyYW1ldGVycy11c2VycHRyIikNCj4gKwkJ
dGVzdF92bV9hY2Nlc3NfcGFyYW1ldGVycyhmZCwNCj4gVk1fQklORF9PUF9NQVBfVVNFUlBUUiwg
MSk7DQo+ICsNCj4gIAlpZ3Rfc3VidGVzdCgibXVsdGlwbGUtc2Vzc2lvbnMiKQ0KPiAgCQl0ZXN0
X2Jhc2ljX3Nlc3Npb25zKGZkLCBDUkVBVEVfVk1TIHwNCj4gQ1JFQVRFX0VYRUNfUVVFVUVTLCA0
LCB0cnVlKTsNCj4gDQo+IC0tDQo+IDIuNDMuMA0KDQo=
