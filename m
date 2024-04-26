Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8185EC4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 07:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 289F510EE4F;
	Fri, 26 Apr 2024 07:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQCr28VA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054D110EE4F
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714117720; x=1745653720;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hVAPIJHD7DV1RkSOQl7cOSjgs2znn1txVWBBhF4ndoo=;
 b=hQCr28VA3FG1ddCH+jMHyMXasH2OUD1puWpNIGC2IzTdPiEZnKIrYGeI
 Oeo/WbxvbChn47n7LW8c1QYa7V/ztyuzchYFKV1B4WUg0ieAt0O0pznYb
 bLPwo+GCxt6e0dv21YJ/OPfFXF7ti12suzr63EYvhnwW0tS36MbfxxVP1
 gHfDKliKgxczJ5TJB+VS2IgZQwrtCWAYzeKhPgyPR2bSgLe94S4b3GD98
 4t2bd1KNMA3lR396Msw8M70jGmbRwlzVtg3Mn7PFBHAlJgXxZYG1ogzQg
 tw506nFAYEKkNK4sJ4iXxzO1oJIuKZGtyWIZP5lTxCzXil3IXj0/GEMLe w==;
X-CSE-ConnectionGUID: iPAm8OoFSGmNfHZ4KnJbww==
X-CSE-MsgGUID: l8ooPcD7TDmgdNBxHdKoCA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21251459"
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="21251459"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 00:48:39 -0700
X-CSE-ConnectionGUID: okgmWfbVTyW/Vgapif8hHw==
X-CSE-MsgGUID: k7OS/hRxQoODYiosEvkc4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,231,1708416000"; d="scan'208";a="29986322"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Apr 2024 00:48:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 00:48:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Apr 2024 00:48:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Apr 2024 00:48:38 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Apr 2024 00:48:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jDXdhuFYhymiz9dXh1HadtpiQaWacoZInIhLDdAMzPMxw4tzm11002U76Y4hiYE6sP68Qp6jM42wp2dbw9gtInjdSeERUAlecfzwVpRVV8KfpMi2ito30fzQGaVqhFoZZBqmwbZprEEGIoGiBNGnQlwav1UupgyoldJzuF9SUvMzdV4UvYOr/OTWe9+lw4bGG7z31lWMvZNT1hVz075d88Q78VnsfTzNhwF4BPIUHGkc/XxCYO7AaQPKvZj/d5QEGnVsMURJigArxYYOYD44OT80dPIdmYNH7Et/GiH5jBzPcXj7fNPolobMxTtXAsF7zyvZYXarLPa2nEs9Soqteg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hVAPIJHD7DV1RkSOQl7cOSjgs2znn1txVWBBhF4ndoo=;
 b=LyMCFenHOHrQG+YzRnxjVb1FhDX1MmhAnvJajY/5HePWC7cdGp4DsxXgZWomdbjnPcCrP97Lb17LmAq9oDOLEZIycgFnPX1PWW3OSfcIsTc4DHJGQtjLg1tsaWvPHcmA7AS2HtwNihx48xG4u/LrZgzBCrS5IunqxJZG6NJbPPvsZWrK/l4jy7p6NWCqD351bmJzdBTcEIGWw61OIyMdSwKsHzJW6Pbg8rWmC/Dxuhb/chPfiRfjt6jZlADJ2hPnAA3XV5CqKzckCyTNyi+gtUHSPCHHEaH+DlwOM1gRkE27zG03n5Dz3azM8dH6Qu16byX0Ry7ipKFYQUcU7Rc98Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 CH0PR11MB8087.namprd11.prod.outlook.com (2603:10b6:610:187::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Fri, 26 Apr
 2024 07:48:36 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5afc:274:3b02:f45]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::5afc:274:3b02:f45%4]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 07:48:36 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, Manasi Navare
 <navaremanasi@chromium.org>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Drew
 Davenport" <ddavenport@chromium.org>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, Sean Paul <seanpaul@chromium.org>
Subject: RE: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
Thread-Topic: [PATCH v3 1/2] tests/kms_vrr: Add a subtest for seamless modeset
 to a virtual LRR mode
Thread-Index: AQHaloP2K8yy2wIZvUOn+U3OKqNmHLF4mkcAgACA/4CAAM+3AIAARCvg
Date: Fri, 26 Apr 2024 07:48:36 +0000
Message-ID: <DM8PR11MB565517E06CDBA9B389BA86BCE0162@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20240424201344.783935-1-navaremanasi@chromium.org>
 <64cef3df-1610-4d53-a44c-905220e09b76@intel.com>
 <CAE72mNmRsA-KcZ61F6d4Pg5_OQnpifO7AmivE2AkhN_0WT=eTw@mail.gmail.com>
 <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
In-Reply-To: <682dccc4-c788-4bfd-b8ef-b24d60b488d6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|CH0PR11MB8087:EE_
x-ms-office365-filtering-correlation-id: 7f641ffd-ebc7-4c69-65ea-08dc65c54766
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?N2xXSytiYVVVaU9ZNWVoSGp2dGxQQWhUZHFFTG0yeVpPd1VBWmNkTEt5dE1O?=
 =?utf-8?B?WUZaSU1wS1RkaXZZVTBWOTNtNUFYTDROS2h2cU1jQnBCWlJFMmVNZFhkald4?=
 =?utf-8?B?LzFZdC8vWHR1b3JSSWJOSmRabmR0aW1rMDVsWjd2dXNlK0ZqTTE3SHM2aGww?=
 =?utf-8?B?bjhmdW1OejRkNFhhRzZhNXYxdWxmWE1nRlF5VzZQR1d4TkJ2VC9pbWhEU2Vr?=
 =?utf-8?B?UG42M01sUVNoZlQ0cm9aT1VhcDR0RDE4SG5EcHkxMmJONUhuQ2VtcGlSQzVB?=
 =?utf-8?B?YVd0U1o1bmFPODdOTDBZMDdnSC9XY2o0UGFOU2hiTGI0VWp5T1VJVG1kdXRF?=
 =?utf-8?B?SFV5eDZjM0haWlFmNVozZDRTRnVVZXF4cXF5a0U5Zk9NT1pNZnJtWjc5RzJo?=
 =?utf-8?B?eThZSVZMRUl5NjYra3JPNVJMUFlHSDFudHhqUmlWSHZLODNSdnR6SXVJZVdk?=
 =?utf-8?B?VDNxbFBlUlpORDZIWTNrc1JsSGh6L1pINlJMOWsybC9PcTFRYm5ydEVnaWxZ?=
 =?utf-8?B?SDZXZGtxSVdiSUNHa1VxT3VOYlRCRmtJM05ESjBZTXhzUUpqU1hpSmtlM0JM?=
 =?utf-8?B?T3JDdkhyM2dlQ0tuTlRrK3UwT2Fpb1AwVVI4NWxMejNQOXRiY2Njbmd1WUVL?=
 =?utf-8?B?b2R4ejFEcCt1bTE0Q2lpOHhMSVFpT2drUUZFaVJIeTZyV3E3TCtVaTJJSU5s?=
 =?utf-8?B?VkRhaXNKTlVmQ0NmZWNsVG1XV2hIbkRHTVg4UGE5VlFlampTMk1GNTNJekx2?=
 =?utf-8?B?NkVtelpZWVVHZkZ5RWl4amNWZnNkY0FlZEl4VzlGU1Jxa3RRekRpOXIwY1VW?=
 =?utf-8?B?Y3RDcWsvb2ZEL3VOVHlFaU9ERW84Z2VzbGM5Z09xVzh2bVl5OXBwcTFJY2xr?=
 =?utf-8?B?QWxPbkVZRU5BbjVId0hZQjErYTBMVTR2dFE5Tjc0K2FYNU5nUko4Y0twQ2c1?=
 =?utf-8?B?NEFzM3YrRmdhOGFhNndYZ1lBTTRod1lmWXV3N2U1VUJ4ZHhGMmc1Qi9VZUFJ?=
 =?utf-8?B?RGlSUDM0MXpTYmhsN0RjSTkwc21KNmZEclRoc1VyVm1WNmdib3MwcVVnTzVn?=
 =?utf-8?B?WXBsZklIcktvSHc1QkU4Zm01SGsyd053SmU0M0ZramVkeS80b2FQVlUrenB0?=
 =?utf-8?B?ZkVKNUFlenBFV0F1dlhhMVpTVHNYbks3TEkzSGpaRi9sUlU2U2tOVTVzbm9h?=
 =?utf-8?B?SDhvOHV6VlgxRW9FTER3YUhacXpjUWpxcmVyYjJCcXhZQ0UzdkNIZW5iYzJy?=
 =?utf-8?B?SVhyam9XMC9tL2dldUJoNm1yMlIvRm9ydU9CQTdSSTJJdjNKVnNtVkNlM0JM?=
 =?utf-8?B?UkV5TW1raWJWN3YxcERZQWRwVVVRU1BKSFprcUQ1ZUE2WnpNTTZTRWhLdjlo?=
 =?utf-8?B?cWxRbE94b1BUbUxYd1ZRZkRHd1ArZjRwQ2RZa1pLeE5yUk5KcUV2TVZheHlv?=
 =?utf-8?B?MThuc2ppL0MrUHc2bEVyY3VRbXdRQTgwdDAveTBzWW5qMC9Yb0FVMFpZSFJm?=
 =?utf-8?B?dWpUSGJKSlY3MDhFWnVrMERManFFbDBRUUhmYk9LQUZKaVNRUnV6VUlMTEUy?=
 =?utf-8?B?Zmdyd2pGSDdpY2l5TzJEdU1TNEhCQmRwOXRuY1F2YTA3bEJDUlNwZTBxSUQ2?=
 =?utf-8?B?SUEzakdtQUVSVXl2RnhVRWxGME51bnprbjZMd3FrODg1bFpadDZCRkJuOUti?=
 =?utf-8?B?ajdkdjhIVWNCUVljNi9VL29oTW12UnIwck5iaWU1N2NYZTZvdG5zdmpnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NThMOVhGOGJhLy9jczNKMTRmenNFZ1NEQURSNDVLOEFrZjFXdWI4NitFMFRP?=
 =?utf-8?B?M0xlanRPMEpHbE13YU9KSDQ4RFdOdFB0QWxVbUZYR2h0QjY4UDk0RFBPYkVM?=
 =?utf-8?B?WVJnOHlLZWZ4TVRhd2ZTTkhGSGxxVkJ3OWRnR2gvdzhQSktMSW9CUFpkVm44?=
 =?utf-8?B?K0ZXZlcwUGFTc1I4ZTFwaFppNHY5a3RjQmlOUVFoUTIxSzU4UkZ6czdtWnl3?=
 =?utf-8?B?Z2o2ckhhUTNHQXJrNStxcXExcEFGbGh0Q1lSd3lUNCtaa2t1RTd5U1hMSGE1?=
 =?utf-8?B?ei9TUWhoWnYzY2NGaFEyZUY1Rm9rNVBjM0RXZ052aFljR2ZtL3BHV2p6c2lK?=
 =?utf-8?B?QTloVUFOMk55OGN4bWtwZWRrRFNUNUFaeVBRdlhMZ3dGMEJCSWZMNnh6em9m?=
 =?utf-8?B?RmVheFBpUnM5VWF2VnJ6NjlwQTVFNWNVRlJmcXdpWG1zc1BiRDBDT1Q2U2xk?=
 =?utf-8?B?WWZjWUcwaWVmVVQ3ZVBLZjM3dTVBTUVHY00xbXF0NnB0dzRSdFhra2RUajEw?=
 =?utf-8?B?OVA0MlhycGRXL0NpOXRwTXlCN3laMUs1eVp6VmlFNndXQlVRSk05d0Z5VVAv?=
 =?utf-8?B?N0F4cVZPRUt0aC84NFdJMjZqZ3d5d1FBZEJnNVlSUXJ6QTY4WUlhRHZhUTh1?=
 =?utf-8?B?ZEYvWXJyWUMrK0xlQ0kycEJuMUFJbFVITERvSTdpTERZeVY0K2pDMXk5SC9F?=
 =?utf-8?B?bWtqRnR6endOUTBWakRSMW5VSEFINVFUNWFadDFyNXlYUXc5U1BKU1Q5RkVE?=
 =?utf-8?B?VVhBcGNyeVorWTdHTUxIZVppaE1JQlMvREUyU0FmM0swUVBUbWpBT1hlT1hh?=
 =?utf-8?B?aytLZjZhWDl5VDR4VzVEcEMxckRDMGwrL0huTjJkd1RCM0tNVW9wVDMxQWt0?=
 =?utf-8?B?QmZTVTAraTUxc0k2alNORnZYcUordEhhY0RyWGhIMkhqT1JsV09Wd1BaVUJ4?=
 =?utf-8?B?ZjlZY0dIM01iZDdpdkUydVVwVXN3UVVycEVVV0VacFczRTdiTnFEQm1NWU1G?=
 =?utf-8?B?cThtME5GdU1XSmUyYWRBQnZEZElKL1JCSnZ1N3ZTVEEyNGI2TWQvQkE4MDZk?=
 =?utf-8?B?U2I0c0RVS2RKN25neVBsUTRCNnE5ZFpUUGhiakQ3djVYMEt0OE9BNzNTc1FX?=
 =?utf-8?B?UEx1SFBpSUlDYzNUQjVDcDhUWFBWZWt0UnhiRFo3RFA3WDdnV3FqWHVtS0Fj?=
 =?utf-8?B?QmI0WEI4RVFVNmE2THA3V0I0ajNGcU5wanU2ckVwd01Ddy9OWXlSL2M2T2xz?=
 =?utf-8?B?cUx3VDJ5U3FORDFLaGljYzBvZldnRWIxWUw3UXpZR2FDdm9ZTW8ySDdjQk5R?=
 =?utf-8?B?SzJESGdtRlRMRGlybThZZFZFbjRuNm1LaGRaRy9Tek5jb1cyU3Z5TzVrczVD?=
 =?utf-8?B?YVZLdi9HYzBYL0s3N2R3ckJKb3ZqS0ZUYU9McHFpTkpLR1lGSjEvbmNQank3?=
 =?utf-8?B?TUhyN2tRUXZwSmNQYjk3Z1UraWwrTUtEMWwxN1pqMkIvWVBrR1VhVmJPMFEw?=
 =?utf-8?B?OEw0MGd6b0dCVXM0RjFBMHE2M3ZXem82bzlibHFGNWI5SlhFc0dOcDFuRXVJ?=
 =?utf-8?B?ZlFzajlxd3FIcWRlSWxnMmxmK1VTbXFRakFwYUFqWHh6U1FHcEtyQ3BPYjhZ?=
 =?utf-8?B?TS9pbXpneUJxNzNiN1dyZGw4ektHNEQ1RzhBWVoycEVQYUpTd1Z5bDlHdkVP?=
 =?utf-8?B?ZzNuRVhTdml1djAxR1QvTkI3SXpxZDl4UnlNMEplL256M2phUjdBQzhOUWlF?=
 =?utf-8?B?NHppL1RKeVJGS0k1bFdsYllpNVFleHE5TFFtazVETThZV3BaY0J4YVk3Q3Rt?=
 =?utf-8?B?bFpTMWVFclVzVVFURGxwN1B4NFUvNWk3RFQ1QUEwcHhlWndrWjRFRjl0aGRQ?=
 =?utf-8?B?bkExZXlCdE0vL1l4ekRVU0ZJUHplWVZGNERkcjFMTkdNWGFKRThoQng1aWhE?=
 =?utf-8?B?V1FCTlArVmdJeG5tK1hTajA3bTB3U1F0OXZnNEkvRFFIN1lrRE5RWjVpUDJr?=
 =?utf-8?B?R2E1RWN6Q2QrUFlNVjZxa01QTVZvd3VYa0IvbGFYTmFmYVNFNG9EaytoejFV?=
 =?utf-8?B?VnhoY3dySDY5NmdGL1lkUjNwNTZKUmVvWVVTR01oRWswaGg2cGphSWoyM2hH?=
 =?utf-8?Q?YscUzf985GTkuJLCwY6sPUccE?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f641ffd-ebc7-4c69-65ea-08dc65c54766
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2024 07:48:36.0140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLOaXxTPICUn5SWEdjfx/wGHq4xH2nRXnByxcACBSV5bfZANE2BYWT6cW8+uTgT+kJroUhrM+Iedz1l0sxrB4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8087
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTW9kZW0sDQo+
IEJoYW51cHJha2FzaA0KPiBTZW50OiBGcmlkYXksIDI2IEFwcmlsIDIwMjQgNi40NA0KPiBUbzog
TWFuYXNpIE5hdmFyZSA8bmF2YXJlbWFuYXNpQGNocm9taXVtLm9yZz4NCj4gQ2M6IGlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEcmV3IERhdmVucG9ydA0KPiA8ZGRhdmVucG9ydEBjaHJv
bWl1bS5vcmc+OyBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PjsNCj4gU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS8yXSB0ZXN0cy9rbXNfdnJyOiBBZGQgYSBzdWJ0ZXN0IGZvciBzZWFtbGVzcw0K
PiBtb2Rlc2V0IHRvIGEgdmlydHVhbCBMUlIgbW9kZQ0KPiANCj4gSGkgTWFuYXNpLA0KPiANCj4g
T24gMjUtMDQtMjAyNCAwODo1MCBwbSwgTWFuYXNpIE5hdmFyZSB3cm90ZToNCj4gPiBIaSBCaGFu
dSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4NCj4gPiBUaGlzIGlzIG5vdCBzcGVj
aWZpYyB0byBlZHAsIGl0IGFwcGxpZXMgdG8gYWxsIGNvbm5lY3RvcnMuDQo+ID4NCj4gPiBJZiB0
aGUgQkFUIHJlc3VsdHMgbG9vayBva2F5IGFuZCBJIGhhdmUgeW91ciByLWIsIGNvdWxkIHdlIGdl
dCB0aGlzIG1lcmdlZD8NCkRpZCB5b3UgbG9vayB0aG9zZS4gDQoNCj4gDQo+IExvb2tzLCBCQVQg
cmVzdWx0cyBhcmUgbm90IE9LIHRvIG1lLg0KUmlnaHQuIFRvIG1lIGxvb2tzIHNvIHRvby4gDQoN
Cj4gDQo+IFRoZSBuZXdseSBhZGRlZCB0ZXN0IGlzIGdldHRpbmcgc2tpcCBvbiBWUlIgY29uZmln
czoNCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMTA2
NS9iYXQtDQo+IGFsbC5odG1sP3Rlc3RmaWx0ZXI9a21zX3ZyciZob3N0cz1iYXQtYWRscC02JTdD
YmF0LWFkbHAtOSU3Q2JhdC1ycGxzLQ0KPiA0JTdDYmF0LWFkbHMtNg0KPiANCj4gLSBCaGFudQ0K
PiANCj4gPg0KPiA+IFJlZ2FyZHMNCj4gPiBNYW5hc2kNCj4gPg0KPiA+IE9uIFRodSwgQXByIDI1
LCAyMDI0IGF0IDEyOjM54oCvQU0gTW9kZW0sIEJoYW51cHJha2FzaA0KPiA+IDxiaGFudXByYWth
c2gubW9kZW1AaW50ZWwuY29tPiB3cm90ZToNCj4gPj4NCj4gPj4gSGkgTWFuYXNpLA0KPiA+Pg0K
PiA+PiBPbiAyNS0wNC0yMDI0IDAxOjQzIGFtLCBNYW5hc2kgTmF2YXJlIHdyb3RlOg0KPiA+Pj4g
VGhpcyBzdWJ0ZXN0IHZhbGlkYXRlcyBMUlIgZmFzdHNldCBmdW5jdGlvbmFsaXR5IGJ5IHRlc3Rp
bmcgc2VhbWxlc3MNCj4gPj4+IHN3aXRjaGluZyB3aXRob3V0IGZ1bGwgbW9kZXNldCB0byBhbnkg
b2YgdGhlIHZpcnR1YWwgTFJSIG1vZGUgd2l0aGluIFZSUg0KPiByYW5nZS4NCj4gPj4+IEhlcmUg
d2Ugc3RhcnQgZnJvbSBoaWdoZXN0IHJlZnJlc2ggcmF0ZSBtb2RlIGFuZCB0aGVuIHN3aXRjaCB0
bw0KPiA+Pj4gdmlydHVhbCBMUlIgbW9kZXMgaW4gdGhlIHN0ZXBzIG9mIDEwSHogd2l0aGluIHRo
ZSBWUlIgcmFuZ2UuDQo+ID4+Pg0KPiA+Pj4gVGhpcyBpcyB1c2VkIHRvIHRlc3QgdGhlIExSUiBm
YXN0c2V0IGZ1bmN0aW9uYWxpdHkgb2YgdGhlIGRyaXZlci4NCj4gPj4+DQo+ID4+PiB2NToNCj4g
Pj4+IC0gUGFzcyBhIHJlZmVyZW5jZSB0byBmbGlwX2FuZF9tZWFzdXJlIChiaGFudSkNCj4gPj4+
IC0gQWRkIGEgbmV3IGxpbmUgYmV0d2VlbiBiZXR3ZWVuIGRlY2xhcmF0aW9uIGFuZCBjb2RlIGxv
Z2ljDQo+ID4+Pg0KPiA+Pj4gdjQ6DQo+ID4+PiAtIENoYW5nZSB0aGUgdGVzdCBuYW1lIHRvIGFs
aWduIHdpdGggZHJycy92cnIgdGVzdHMgKEJoYW51KQ0KPiA+Pj4gLSBGaXggc29tZSBidWlsZCB3
YXJuaW5ncyBkdWUgdG8gcmViYXNlDQo+ID4+PiAtIFVzZSBhIGxvY2FsIHZpcnR1YWxfbW9kZSB2
YXJpYWJsZQ0KPiA+Pj4NCj4gPj4+IHYzOg0KPiA+Pj4gLSBGaXggYnVpbGQgZXJyb3IgZHVlIHRv
IHJlYmFzZSAoTWFuYXNpKQ0KPiA+Pj4NCj4gPj4+IENjOiBEcmV3IERhdmVucG9ydCA8ZGRhdmVu
cG9ydEBjaHJvbWl1bS5vcmc+DQo+ID4+PiBDYzogQmhhbnVwcmFrYXNoIE1vZGVtIDxiaGFudXBy
YWthc2gubW9kZW1AaW50ZWwuY29tPg0KPiA+Pj4gQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4+PiBDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxuYXZhcmVt
YW5hc2lAY2hyb21pdW0ub3JnPg0KPiA+Pj4gLS0tDQo+ID4+PiAgICB0ZXN0cy9rbXNfdnJyLmMg
fCA3Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
DQo+ID4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Zyci5jIGIvdGVzdHMva21z
X3Zyci5jIGluZGV4DQo+ID4+PiAxNWM2MmIzNGIuLjdmNjRkNjgwNiAxMDA2NDQNCj4gPj4+IC0t
LSBhL3Rlc3RzL2ttc192cnIuYw0KPiA+Pj4gKysrIGIvdGVzdHMva21zX3Zyci5jDQo+ID4+PiBA
QCAtNjYsNiArNjYsMTEgQEANCj4gPj4+ICAgICAqIERlc2NyaXB0aW9uOiBUZXN0IHRvIHN3aXRj
aCBSUiBzZWFtbGVzc2x5IHdpdGhvdXQgbW9kZXNldC4NCj4gPj4+ICAgICAqIEZ1bmN0aW9uYWxp
dHk6IGFkYXB0aXZlX3N5bmMsIGRycnMNCj4gPj4+ICAgICAqDQo+ID4+PiArICogU1VCVEVTVDog
c2VhbWxlc3MtcnItc3dpdGNoLXZpcnR1YWwNCj4gPj4+ICsgKiBEZXNjcmlwdGlvbjogVGVzdCB0
byBjcmVhdGUgYSBWaXJ0dWFsIE1vZGUgaW4gVlJSIHJhbmdlIGFuZCBzd2l0Y2ggdG8NCj4gaXQN
Cj4gPj4+ICsgKiAgICAgICAgICAgd2l0aG91dCBhIGZ1bGwgbW9kZXNldC4NCj4gPj4+ICsgKiBG
dW5jdGlvbmFsaXR5OiBMUlINCj4gPj4+ICsgKg0KPiA+Pj4gICAgICogU1VCVEVTVDogbWF4LW1p
bg0KPiA+Pj4gICAgICogRGVzY3JpcHRpb246IE9zY2lsbGF0ZXMgYmV0d2VlbiBoaWdoZXN0IGFu
ZCBsb3dlc3QgcmVmcmVzaCBlYWNoDQo+IGZyYW1lIGZvcg0KPiA+Pj4gICAgICogICAgICAgICAg
ICAgIG1hbnVhbCBmbGlja2VyIHByb2ZpbGluZw0KPiA+Pj4gQEAgLTg5LDkgKzk0LDEwIEBAIGVu
dW0gew0KPiA+Pj4gICAgICAgIFRFU1RfRkxJUExJTkUgPSAxIDw8IDMsDQo+ID4+PiAgICAgICAg
VEVTVF9TRUFNTEVTU19WUlIgPSAxIDw8IDQsDQo+ID4+PiAgICAgICAgVEVTVF9TRUFNTEVTU19E
UlJTID0gMSA8PCA1LA0KPiA+Pj4gLSAgICAgVEVTVF9GQVNUU0VUID0gMSA8PCA2LA0KPiA+Pj4g
LSAgICAgVEVTVF9NQVhNSU4gPSAxIDw8IDcsDQo+ID4+PiAtICAgICBURVNUX05FR0FUSVZFID0g
MSA8PCA4LA0KPiA+Pj4gKyAgICAgVEVTVF9TRUFNTEVTU19WSVJUVUFMX1JSID0gMSA8PCA2LA0K
PiA+Pj4gKyAgICAgVEVTVF9GQVNUU0VUID0gMSA8PCA3LA0KPiA+Pj4gKyAgICAgVEVTVF9NQVhN
SU4gPSAxIDw8IDgsDQo+ID4+PiArICAgICBURVNUX05FR0FUSVZFID0gMSA8PCA5LA0KPiA+Pj4g
ICAgfTsNCj4gPj4+DQo+ID4+PiAgICBlbnVtIHsNCj4gPj4+IEBAIC0yMTQsNiArMjIwLDE4IEBA
IGxvd19ycl9tb2RlX3dpdGhfc2FtZV9yZXMoaWd0X291dHB1dF90DQo+ICpvdXRwdXQsIHVuc2ln
bmVkIGludCB2cnJfbWluKQ0KPiA+Pj4gICAgICAgIHJldHVybiBtb2RlOw0KPiA+Pj4gICAgfQ0K
PiA+Pj4NCj4gPj4+ICtzdGF0aWMgZHJtTW9kZU1vZGVJbmZvDQo+ID4+PiArdmlydHVhbF9ycl92
cnJfcmFuZ2VfbW9kZShpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgdW5zaWduZWQgaW50DQo+ID4+PiAr
dmlydHVhbF9yZWZyZXNoX3JhdGUpIHsNCj4gPj4+ICsgICAgIGRybU1vZGVNb2RlSW5mbyBtb2Rl
ID0gKmlndF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0KTsNCj4gPj4+ICsgICAgIHVpbnQ2NF90IGNs
b2NrX2h6ID0gbW9kZS5jbG9jayAqIDEwMDA7DQo+ID4+PiArDQo+ID4+PiArICAgICBtb2RlLnZ0
b3RhbCA9IGNsb2NrX2h6IC8gKG1vZGUuaHRvdGFsICogdmlydHVhbF9yZWZyZXNoX3JhdGUpOw0K
PiA+Pj4gKyAgICAgbW9kZS52cmVmcmVzaCA9IHZpcnR1YWxfcmVmcmVzaF9yYXRlOw0KPiA+Pj4g
Kw0KPiA+Pj4gKyAgICAgcmV0dXJuIG1vZGU7DQo+ID4+PiArfQ0KPiA+Pj4gKw0KPiA+Pj4gICAg
LyogUmVhZCBtaW4gYW5kIG1heCB2cnIgcmFuZ2UgZnJvbSB0aGUgY29ubmVjdG9yIGRlYnVnZnMu
ICovDQo+ID4+PiAgICBzdGF0aWMgcmFuZ2VfdA0KPiA+Pj4gICAgZ2V0X3Zycl9yYW5nZShkYXRh
X3QgKmRhdGEsIGlndF9vdXRwdXRfdCAqb3V0cHV0KSBAQCAtNjQxLDYNCj4gPj4+ICs2NTksNDkg
QEAgdGVzdF9zZWFtbGVzc19ycl9iYXNpYyhkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLA0K
PiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgdWludDMNCj4gPj4+ICAgICAgICAgICAgICAgICAgICAg
dnJyID8gIm9uIiA6ICJvZmYiLCB2cnIgPyAibm90IHJlYWNoZWQiIDogImV4Y2VlZGVkIiwgcmVz
dWx0KTsNCj4gPj4+ICAgIH0NCj4gPj4+DQo+ID4+PiArc3RhdGljIHZvaWQNCj4gPj4+ICt0ZXN0
X3NlYW1sZXNzX3ZpcnR1YWxfcnJfYmFzaWMoZGF0YV90ICpkYXRhLCBlbnVtIHBpcGUgcGlwZSwN
Cj4gPj4+ICtpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgdWludDMyX3QgZmxhZ3MpIHsNCj4gPj4+ICsg
ICAgIHVpbnQzMl90IHJlc3VsdDsNCj4gPj4+ICsgICAgIHVuc2lnbmVkIGludCB2cmVmcmVzaDsN
Cj4gPj4+ICsgICAgIHVpbnQ2NF90IHJhdGVbXSA9IHswfTsNCj4gPj4+ICsNCj4gPj4+ICsgICAg
IGlndF9pbmZvKCJVc2UgSElHSF9SUiBNb2RlIGFzIGRlZmF1bHRcbiIpOw0KPiA+Pj4gKyAgICAg
a21zdGVzdF9kdW1wX21vZGUoJmRhdGEtPnN3aXRjaF9tb2Rlc1tISUdIX1JSX01PREVdKTsNCj4g
Pj4+ICsNCj4gPj4+ICsgICAgIHByZXBhcmVfdGVzdChkYXRhLCBvdXRwdXQsIHBpcGUpOw0KPiA+
Pj4gKyAgICAgcmF0ZVswXSA9DQo+ID4+PiArIHJhdGVfZnJvbV9yZWZyZXNoKGRhdGEtPnN3aXRj
aF9tb2Rlc1tISUdIX1JSX01PREVdLnZyZWZyZXNoKTsNCj4gPj4+ICsNCj4gPj4+ICsgICAgIC8q
DQo+ID4+PiArICAgICAgKiBTaW5rIHdpdGggRFJSIGFuZCBWUlIgY2FuIGJlIGluIGRvd25jbG9j
ayBtb2RlIHNvDQo+ID4+PiArICAgICAgKiBzd2l0Y2ggdG8gaGlnaGVzdCByZWZyZXNoIHJhdGUg
bW9kZS4NCj4gPj4+ICsgICAgICAqLw0KPiA+Pj4gKyAgICAgaWd0X291dHB1dF9vdmVycmlkZV9t
b2RlKG91dHB1dCwgJmRhdGEtDQo+ID5zd2l0Y2hfbW9kZXNbSElHSF9SUl9NT0RFXSk7DQo+ID4+
PiArICAgICBpZ3RfYXNzZXJ0KGlndF9kaXNwbGF5X3RyeV9jb21taXRfYXRvbWljKCZkYXRhLT5k
aXNwbGF5LA0KPiA+Pj4gKyBEUk1fTU9ERV9QQUdFX0ZMSVBfRVZFTlQsIE5VTEwpID09IDApOw0K
PiA+Pj4gKw0KPiA+Pj4gKyAgICAgcmVzdWx0ID0gZmxpcF9hbmRfbWVhc3VyZShkYXRhLCBvdXRw
dXQsIHBpcGUsIHJhdGUsIDEsDQo+IFRFU1RfRFVSQVRJT05fTlMpOw0KPiA+Pj4gKyAgICAgaWd0
X2Fzc2VydF9mKHJlc3VsdCA+IDc1LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICJSZWZyZXNo
IHJhdGUgKCV1IEh6KSAlIlBSSXU2NCJuczogVGFyZ2V0IHRocmVzaG9sZCBub3QNCj4gcmVhY2hl
ZCwgcmVzdWx0IHdhcyAldSUlXG4iLA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgIGRhdGEtPnN3
aXRjaF9tb2Rlc1tISUdIX1JSX01PREVdLnZyZWZyZXNoLA0KPiA+Pj4gKyByYXRlWzBdLCByZXN1
bHQpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgLyogU3dpdGNoIHRvIFZpcnR1YWwgUlIgKi8NCj4g
Pj4+ICsgICAgIGZvciAodnJlZnJlc2ggPSBkYXRhLT5yYW5nZS5taW4gKyAxMDsgdnJlZnJlc2gg
PCBkYXRhLT5yYW5nZS5tYXg7DQo+IHZyZWZyZXNoICs9IDEwKSB7DQo+ID4+PiArICAgICAgICAg
ICAgIGRybU1vZGVNb2RlSW5mbyB2aXJ0dWFsX21vZGUgPQ0KPiA+Pj4gKyB2aXJ0dWFsX3JyX3Zy
cl9yYW5nZV9tb2RlKG91dHB1dCwgdnJlZnJlc2gpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAg
ICAgICBpZ3RfaW5mbygiUmVxdWVzdGluZyBWaXJ0dWFsIE1vZGUgd2l0aCBSZWZyZXNoIFJhdGUg
KCV1IEh6KTogXG4iLA0KPiB2cmVmcmVzaCk7DQo+ID4+PiArICAgICAgICAgICAgIGttc3Rlc3Rf
ZHVtcF9tb2RlKCZ2aXJ0dWFsX21vZGUpOw0KPiA+Pj4gKw0KPiA+Pj4gKyAgICAgICAgICAgICBp
Z3Rfb3V0cHV0X292ZXJyaWRlX21vZGUob3V0cHV0LCAmdmlydHVhbF9tb2RlKTsNCj4gPj4+ICsN
Cj4gPj4+ICsgaWd0X2Fzc2VydChpZ3RfZGlzcGxheV90cnlfY29tbWl0X2F0b21pYygmZGF0YS0+
ZGlzcGxheSwgMCwgTlVMTCkNCj4gPj4+ICsgPT0gMCk7DQo+ID4+PiArDQo+ID4+PiArICAgICAg
ICAgICAgIHJhdGVbMF0gPSByYXRlX2Zyb21fcmVmcmVzaCh2cmVmcmVzaCk7DQo+ID4+PiArICAg
ICAgICAgICAgIHJlc3VsdCA9IGZsaXBfYW5kX21lYXN1cmUoZGF0YSwgb3V0cHV0LCBwaXBlLCBy
YXRlLCAxLA0KPiBURVNUX0RVUkFUSU9OX05TKTsNCj4gPj4+ICsgICAgICAgICAgICAgaWd0X2Fz
c2VydF9mKHJlc3VsdCA+IDc1LA0KPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIlJl
ZnJlc2ggcmF0ZSAoJXUgSHopICUiUFJJdTY0Im5zOiBUYXJnZXQgdGhyZXNob2xkIG5vdA0KPiBy
ZWFjaGVkLCByZXN1bHQgd2FzICV1JSVcbiIsDQo+ID4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICB2cmVmcmVzaCwgcmF0ZVswXSwgcmVzdWx0KTsNCj4gPj4+ICsgICAgIH0NCj4gPj4+ICt9
DQo+ID4+PiArDQo+ID4+PiAgICBzdGF0aWMgdm9pZCB0ZXN0X2NsZWFudXAoZGF0YV90ICpkYXRh
LCBlbnVtIHBpcGUgcGlwZSwgaWd0X291dHB1dF90DQo+ICpvdXRwdXQpDQo+ID4+PiAgICB7DQo+
ID4+PiAgICAgICAgaWYgKHZycl9jYXBhYmxlKG91dHB1dCkpDQo+ID4+PiBAQCAtNjg2LDcgKzc0
Nyw3IEBAIHN0YXRpYyBib29sIG91dHB1dF9jb25zdHJhaW50KGRhdGFfdCAqZGF0YSwNCj4gaWd0
X291dHB1dF90ICpvdXRwdXQsIHVpbnQzMl90IGZsYWdzDQo+ID4+PiAgICAgICAgaWd0X291dHB1
dF9vdmVycmlkZV9tb2RlKG91dHB1dCwNCj4gPj4+ICZkYXRhLT5zd2l0Y2hfbW9kZXNbSElHSF9S
Ul9NT0RFXSk7DQo+ID4+Pg0KPiA+Pj4gICAgICAgIC8qIFNlYXJjaCBmb3IgYSBsb3cgcmVmcmVz
aCByYXRlIG1vZGUuICovDQo+ID4+PiAtICAgICBpZiAoIShmbGFncyAmIChURVNUX1NFQU1MRVNT
X1ZSUiB8IFRFU1RfU0VBTUxFU1NfRFJSUykpKQ0KPiA+Pj4gKyAgICAgaWYgKCEoZmxhZ3MgJiAo
VEVTVF9TRUFNTEVTU19WUlIgfCBURVNUX1NFQU1MRVNTX0RSUlMgfA0KPiA+Pj4gKyBURVNUX1NF
QU1MRVNTX1ZJUlRVQUxfUlIpKSkNCj4gPj4NCj4gPj4gRG9lcyB0aGlzIHZpcnR1YWwgUlIgYXBw
bGljYWJsZSB0byBlRFAgb25seSBvciBzdXBwb3J0cyBvdGhlcg0KPiA+PiBjb25uZWN0b3IgdHlw
ZXMgdG9vPyBJZiBpdCBpcyBlRFAgc3BlY2lmaWMgWypdLCB0aGVuIHdlIG11c3QgYWRkIGEgY2hl
Y2sgZm9yDQo+IHRoYXQuDQo+ID4+DQo+ID4+IFsqXToNCj4gPj4gaHR0cHM6Ly9jZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy90cmVlL3Rlc3RzL2ttc192cnIuYyNuDQo+ID4+
IDY2MA0KPiA+Pg0KPiA+PiBXaXRoIGFib3ZlIGNvbW1lbnQgYWRkcmVzc2VkLCB0aGlzIHBhdGNo
IGlzDQo+ID4+IFJldmlld2VkLWJ5OiBCaGFudXByYWthc2ggTW9kZW0gPGJoYW51cHJha2FzaC5t
b2RlbUBpbnRlbC5jb20+DQo+ID4+DQo+ID4+IC0gQmhhbnUNCj4gPj4NCj4gPj4+ICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOw0KPiA+Pj4NCj4gPj4+ICAgICAgICBkYXRhLT5zd2l0Y2hfbW9k
ZXNbTE9XX1JSX01PREVdID0NCj4gPj4+IGxvd19ycl9tb2RlX3dpdGhfc2FtZV9yZXMob3V0cHV0
LCBkYXRhLT5yYW5nZS5taW4pOyBAQCAtODQxLDYNCj4gKzkwMiwxMCBAQCBpZ3RfbWFpbl9hcmdz
KCJkcnM6IiwgbG9uZ19vcHRzLCBoZWxwX3N0ciwgb3B0X2hhbmRsZXIsICZkYXRhKQ0KPiA+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICJiZXR3ZWVuIGZsaXAgdGltZXN0YW1wcyBjb252
ZXJnZXMgdG8gdGhlIHJlcXVlc3RlZA0KPiByYXRlIik7DQo+ID4+PiAgICAgICAgICAgICAgICBp
Z3Rfc3VidGVzdF93aXRoX2R5bmFtaWMoImZsaXAtYmFzaWMtZmFzdHNldCIpDQo+ID4+PiAgICAg
ICAgICAgICAgICAgICAgICAgIHJ1bl92cnJfdGVzdCgmZGF0YSwgdGVzdF9iYXNpYywNCj4gPj4+
IFRFU1RfRkFTVFNFVCk7DQo+ID4+PiArDQo+ID4+PiArICAgICAgICAgICAgIGlndF9kZXNjcmli
ZSgiVGVzdCB0byBzd2l0Y2ggdG8gYW55IGN1c3RvbSB2aXJ0dWFsIG1vZGUgaW4gVlJSDQo+IHJh
bmdlIHdpdGhvdXQgbW9kZXNldC4iKTsNCj4gPj4+ICsgICAgICAgICAgICAgaWd0X3N1YnRlc3Rf
d2l0aF9keW5hbWljKCJzZWFtbGVzcy1yci1zd2l0Y2gtdmlydHVhbCIpDQo+ID4+PiArICAgICAg
ICAgICAgICAgICAgICAgcnVuX3Zycl90ZXN0KCZkYXRhLA0KPiA+Pj4gKyB0ZXN0X3NlYW1sZXNz
X3ZpcnR1YWxfcnJfYmFzaWMsIFRFU1RfU0VBTUxFU1NfVklSVFVBTF9SUik7DQo+ID4+PiAgICAg
ICAgfQ0KPiA+Pj4NCj4gPj4+ICAgICAgICBpZ3RfZml4dHVyZSB7DQo=
