Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95BFCD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 08:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DCD10E2E2;
	Tue,  2 Jun 2026 08:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="flzsP4tm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603A10E0EB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780390254; x=1811926254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qfrTXxXmPzB66YpRY77BBGs0qIyJH39MKlzu05A3JJg=;
 b=flzsP4tmMUnqhg9RToAqpwSYPs0cLM5faTh86ZoiH7bHvCZA2KMQPy7I
 0BKzNpKgbTdVVDiL015sx2IjygjkSYNQ5yor0MdtWIGZcO/6EjDB+zDx/
 h2Qq26CQUAmlezHiCWPmdb0fO408gukPI6wy9xiuaQjAbKgyYg8sFGpLR
 FswA64tnjWulQoue/nTfn8DGpwu7pguCbNyJhsro2L24Wskz6t7npITt1
 P+CaNBxB9cJ94HmKCEq3vI9BGyl7uwf3yVPol/FK0EjvxEVUMs43zIws9
 APR4S/2GJ9Mkm57Itq5ZUYKSzZPWAZiArF2pp5dsDxVcW2Pri8m6VERfQ Q==;
X-CSE-ConnectionGUID: pw/AmytwSy60eT4PSkwR8w==
X-CSE-MsgGUID: O1iTmUp/T/OdCCY7z0G6Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81197796"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="81197796"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:50:54 -0700
X-CSE-ConnectionGUID: +Jo31gmBShm8BBOYZrsGwQ==
X-CSE-MsgGUID: +5e7rzjoQVynO0te016vow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; d="scan'208";a="245654594"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 01:50:53 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 01:50:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 2 Jun 2026 01:50:53 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 2 Jun 2026 01:50:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcwoRP16cdtI7r0o4jJ5phwIboXrq9R0C/MyEJ9DdJJbehTPJb+5zDYJmSGVKMR0RisMo8wZPmBXaBNQ2vEn0EaMMOovWGo0PvngjN8E28CxnBa4neVBFUGYv+s0xtOgAcY+Hy8aw5dv4W4KW4YBxyWeKKhwZRf1Uw3ab/KWUG4oUh598z7ZmfaXejVCbI3AeHyBhmM7QZ9cl/sJMnehPeGR8hD3xdA8orekPtcr+viD/Z5eXxAGOgnkBZO1D4oQhJBjDRZfpjOVL02lGKOO9aHZTWs5cG3GeGjukqc+C+O/2NXyY8EmK88j8rkQb3ZMrv6AXVd5riyg3Xwqjc2O5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qfrTXxXmPzB66YpRY77BBGs0qIyJH39MKlzu05A3JJg=;
 b=tCdzbo1r9z9eLtXkxbqIqX+JHF6jZq0SoBDLLuVqG6EtKMiJBMdAb9kd5BT4FWYxGmkr3MPiYtLNpwG2cDlLkk0aYug74U42rZKOIms6JeqM+wWKZaE88Nh42Cw4oV6GlXplxv9eNUwv+81QxeLtdYxhBskeVvwCQzlXraAYu5buHDUf71c6XKM2EvwsCdHAe8Gif8TRicjP/OqQ6CUujuwwqRwVBlvlZOd1JWUe3ylsj+RHGRJpLrhPxaohpjcpS7GB+uHQYWyjyDSeOIUoHlX4CQ2sbErTWfAqRn0mO98+7i4IPe0nG9Hqm82LCJr4EeW10hAfsIY8+whIgVOZSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by SA2PR11MB5148.namprd11.prod.outlook.com (2603:10b6:806:11e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 08:50:50 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 08:50:50 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
Thread-Topic: [PATCH i-g-t v1 3/3] tests/intel/kms_pipe_stress: use
 ARGB8888/LINEAR for cursor framebuffer
Thread-Index: AQHc7aYyfIUh5S+LRkCsediBseimlbYq6RoAgAAUnwA=
Date: Tue, 2 Jun 2026 08:50:50 +0000
Message-ID: <PH7PR11MB6796EFC6242DBB614136D304E5122@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260527071940.3285269-1-sowmiya.s@intel.com>
 <20260527071940.3285269-4-sowmiya.s@intel.com>
 <111a1f1e-7ccf-4ec3-8831-9cd860cd9b55@intel.com>
In-Reply-To: <111a1f1e-7ccf-4ec3-8831-9cd860cd9b55@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: chaitanya.kumar.borah@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|SA2PR11MB5148:EE_
x-ms-office365-filtering-correlation-id: 936854e9-9555-4355-c2c2-08dec0840c00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: WeiY0Qhw/X7NV7ixsrnluiFS5LrHPvMuM4Bt9IoydWRKDL+nlALk+DO5h7zFoX87cNJnQfYFWXU2gt1X6IqFqnojK1IncpkUflhlQWm7yZjQmYXcIUB5XMhh/uROXcP/GT0u5TEUuyQV/utQZKJSTwQSVcyVGvs45inDg/QTki0tuIktH75ynauJyxihf/4oPHJjCHCZTed0uGUJkNsL0nAUfKGUISfdE1+SlCLKvHfRR8eaLlhIjoO5wnke6+xAwObD3ooYQH0X0dC6rkglADOBjEFByaKb0TPZ0NUC/OR1mQLpAMn6R1t9WoYPG6J2CWbQyOoXfzO9k9BB0R1uTZJFATW6xfxaVfEWRIXBIStRVK7b8Lkljg5pTZICGUNnbF9vb/J10Hfz7VH0JtkZY2rrwk+eMLqVY+08cNUt9z7RWH+gjD6do3F/6Pl/mZ7Mjg2bLDizFaur7vohq7wV6psrNw/kpl8vFLiZvsC6wsFLzM+jHZkHmyqJ0J6f1LCcXfnePZc4qJBb5FCGrOlYNMpSiuUrWM+btfDCOCecGxhY+EG0iGQxw9JH6oHrceLk4Kg98aoEvYRoVTfplhkTjTEwUQ2ZC2lOMgpvkmXY+VqEIv97AMwUQ3jaeDKOSoCAkIqTFLZAgM3tLBrumdIvQRrvEjz2VmkG60Fhjy/XLz5tKKdWP2arYTgc/9yOstDjmHdJa/z27aeI3KpqXaXehzMlaOvvPt/D9lGgDhUIxyOVCU2zsdJvj/MeY1GOw+D6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WlVqWXRyVGxaQ3RMSkhaWlJrYVA3OVBOQmZCVnVJYlplMXZKeVhBbGhmWW9Q?=
 =?utf-8?B?VWRmZDhtNEtMcEt5VlBBeXhqdkVqek1EY000QlJMbnhxQjc1WU9ZNFRQakpC?=
 =?utf-8?B?S1lCdytoZkJNZVhQd1oyVmJqUHJCQjBNL1NuSXh2UWd5WHhudGVoeDVmQUF6?=
 =?utf-8?B?Tzg4VnJZVUdhNkhDdzhmak8vNnlnRlgwd3BKa1AzUjdnS3RXRDZocFQ0QXpn?=
 =?utf-8?B?OHJMOFpNNkx0SzVIdmhhZDNnTTRsaWk5YlV0SGhQY1hSamN0UWxFaXNqOVk1?=
 =?utf-8?B?Qllsb1BQRTYwQnhzZndqeU4yQ2EzclBGZVBZbzd1cmJDRlZla0QyblVvU1Jw?=
 =?utf-8?B?YXp2aW5mTWJNVXNGdHBVem5EQ0FRaWFhVXUySDhrL3Y3UURHaXFoWXRPbWlP?=
 =?utf-8?B?OXFBclRpeDdMcDd6MzNyM3JwYUhyejlPMi95eTYzM29rajJsWEhmSiszQWtU?=
 =?utf-8?B?MlVMSjkyL2hPaDZiNHloVU8vaGd3eVFobmNlSmNHQm04akpjQ015VjNjeEZB?=
 =?utf-8?B?NlhBNDNPWWs3czFEbDMxUC96aG9FeG5UckNVZmRPbmo5dTZYK3hBR3JsUCts?=
 =?utf-8?B?Z05KRXBGSUlWMk53d2FxSGFxSHE2Z2FzL0swS1dETWNtZkppeTM2am0zaURx?=
 =?utf-8?B?QVk4d1FtbFd6bllQZTkvV0dqS3VPVkhuWEVSbGc0SXhzaWJtYUl2enhtNXhr?=
 =?utf-8?B?N0VrSHJpeHRmQW1JZVJKOFl2REcvT3BIenljSDFxQmp2WUJXVStaSEFZMGEw?=
 =?utf-8?B?VTVkOXZnT1JtRnFRWUVWVldWKzJtQi9hVWtJeXRwSUlhenBFNWhOTGdtZmdK?=
 =?utf-8?B?Qmp5NHMxREhRVmtTdkZMOTA3VWFwYXpFSCtUOWFieEIwZ2RCaGlnTENpZ2pG?=
 =?utf-8?B?NkRNVVBwN0ZEZDRoWTdkeHRiOWpZT3BxU3hmcUkxRkFIU01FaUZqNmdsVE4y?=
 =?utf-8?B?b3JDb2xkRVg3UGYzeUovc0E5TTVFb28zK2VxOHpxWmJpTXVMVG1UdXhqUldO?=
 =?utf-8?B?bS9HckxnalBQVXVZelZ3NE9VVVA3WjVKUDc0cVlIVmFSWTc1alk2M1hCbXRC?=
 =?utf-8?B?b0xFMm1sRks4dUJXbVUveWZMVXhQZDBJaHJSOXJzNkFDYjZHL05iZC9mcXJC?=
 =?utf-8?B?QkxJaUY0ZWpzc0VGS0ZKY2hDeTA4Y2cwQXNGeGJIMWNvY3JDRFRWeFBNVldm?=
 =?utf-8?B?K0laV2IyZHNzMkhRNmxhNnFsK2UxcmZHbHFXUFIrZ2RaTjNOS0xEMUx1UVNr?=
 =?utf-8?B?cFJTMmNEL1hFODE0REs5Z1RtN3l2VlFEZXE1bVhmQTJlMVhvNnRFMmVRUzYx?=
 =?utf-8?B?RjhqWVJnZ3B4d1lKTEt0bWZkcmUyN2N2K3VqWDE2akU2YXNUMjliZzdwTGs4?=
 =?utf-8?B?MDRJTW83SmVWQlJJSHFDWmIwUUM0NHdIMHpNcmkySm92NzNIck9ubmhhNHVs?=
 =?utf-8?B?am5NSGpSb3R2M1VHMW9IWUtxQ2pHMGVZc0JhVmQzMnVlbHFTUmRLcm1EaFpo?=
 =?utf-8?B?aUQrYTZ3R1MrR1NyZ0hIRUhDNkVCWFJ4c2EvejlSZy9nTC9QN011MURSTTds?=
 =?utf-8?B?VVB4TUx1NnhVSzVkTHQydW92VkVhYXNlL3RHODNMaDNqanVjb1VTd3ZwdXBO?=
 =?utf-8?B?ZkFrYnBsR0wyZTk0eFd1YXA4Y0NpdkQ5WFhBaWQxb1IrN1dENWxWYnI2ZTFh?=
 =?utf-8?B?TVlaMmtETGFWUWVPQ3FGOHg1N3R2S2hPQlNWdHArRXFhOXJ1MVVpNkxGQ3Z1?=
 =?utf-8?B?cGszMzRNcXNKODhoMkJaODFzdGZ1eUhmb2ZQOS8vNG11RGxUWCtVM1ljUmhP?=
 =?utf-8?B?NGpyUFhiZU1od0pZdHUwcjBzSXNyNkplZXdiSGVycWQ2c2dHOFNxSGFMMi9Y?=
 =?utf-8?B?a0NkSTlXOTVlYlhnYU90TU9pOXM5dTNlR2ZsRGJPdjdGdklndVc4RHhJUGNI?=
 =?utf-8?B?NDV3MkFpRWl3YnRkMnpwZFk4KzlVUzVQVHNmSmRydGJUZTg0RWhzUHlxOHhx?=
 =?utf-8?B?TU9HaHdQL0pkd3VlMldjQVRPWEVLeGloRHcyREk2RlovUU1WdlNRcmxNcEp0?=
 =?utf-8?B?cWJQdEF2MWpJYTVKLzdXOGdXNUxYUlMwcHV5eUtvZUs3SXBLZmxqUHdxSDYw?=
 =?utf-8?B?M0tRVFVub2RKTkZZbWt0eG9GaWkzTHFDSDBqeHJxeC9EQnR2T1N4STJYYkpK?=
 =?utf-8?B?c0wxM29rWnFEajBmL1MxUkNyRjViRXpRUG1PT1dtQ1pQOVNESzJIRW1zZE0w?=
 =?utf-8?B?cFJiMCtiVW4xK09vdGpUNXc2U3ltSXFFVTVWaXlxckI2L2ZkS1NabFN5TTE2?=
 =?utf-8?Q?+WhIcDD56/dYV6ohhZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: sat7Y7Oby4C1rvtvsVoJ75FijdmrBnDf0zfZuECdINajj40tofnZQFGBiEIQhPQ5Wr75/erpbrF9mnMFppq64p+Buk0HO28fKCWZ5bdjrFS5Z3H9aiAc1hVeftl8Rnc3Wsz0ucRzHKru8dSjMsGzSLsCjZBXUJSYMaS4sNMhwtAvIKB8T/ow0t1yyhsfA5loQ/YsQ/VGsosww+Bfs8U/nVRETjTKD45YqAWc5OKFgZg3Rkpr9HDCOteZBqjDmGqt3kWKsYRYOW7ppUM8rTeR52tHo268JuN1oId7yiTbHCIWfg70Pwi3KyoOSk3D5LEqLtLcQ07n8vHsq2LuyPHQBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 936854e9-9555-4355-c2c2-08dec0840c00
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 08:50:50.2741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSm19EblrscCxNsbO5Dgsue+k+x596SLgcifllPL5QtAVFNtM3Ds30zzJsLj9vvtIdvoiKWc2gWzBOaPz105Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5148
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

SGkgQEJvcmFoLCBDaGFpdGFueWEgS3VtYXIsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFo
QGludGVsLmNvbT4NCj4gU2VudDogMDIgSnVuZSAyMDI2IDEzOjA0DQo+IFRvOiBTLCBTb3dtaXlh
IDxzb3dtaXlhLnNAaW50ZWwuY29tPjsgaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IEIgUywgS2FydGhpayA8a2FydGhpay5iLnNAaW50ZWwuY29tPjsgU2hhcm1hLCBTd2F0aTIN
Cj4gPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPjsgTmFsYWRhbGEsIFJhbWFuYWlkdQ0KPiA8cmFt
YW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2
MSAzLzNdIHRlc3RzL2ludGVsL2ttc19waXBlX3N0cmVzczogdXNlDQo+IEFSR0I4ODg4L0xJTkVB
UiBmb3IgY3Vyc29yIGZyYW1lYnVmZmVyDQo+IA0KPiANCj4gDQo+IE9uIDUvMjcvMjAyNiAxMjo0
OSBQTSwgU293bWl5YSBTIHdyb3RlOg0KPiA+IEN1cnNvciBwbGFuZXMgb24gSW50ZWwgaGFyZHdh
cmUgYWNjZXB0IG1vc3RseSBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gcmVnYXJkbGVzcyBv
ZiB0aGUgb3ZlcmxheQ0KPiANCj4gd2hhdCBkb2VzIG1vc3RseSBtZWFuIGhlcmU/IERvZXMgaXQg
c29tZXRpbWUgc3VwcG9ydCBvdGhlciBtb2RpZmllcnM/DQo+IA0KU29ycnkgZm9yIGNvbmZ1c2lv
biwgY3Vyc29yIHdpbGwgc3VwcG9ydCBvbmx5IGxpbmVhciBhcyBwZXIgYnNwZWMgaHR0cHM6Ly9n
ZnhzcGVjcy5pbnRlbC5jb20vUHJlZGF0b3IvSG9tZS9JbmRleC81MDM2OD9jdXN0RmlsdGVyPUlu
dGVybmFsJm1vZGU9RmlsdGVyDQpSZWdhcmRzLA0KU293bWl5YSBTLg0KDQo+ID4gZm9ybWF0IGFu
ZCBtb2RpZmllciB1c2VkIGJ5IHRoZSB0ZXN0IHZhcmlhbnQuIFVzaW5nDQo+ID4gZGF0YS0+bW9k
aWZpZXIgKGUuZy4gNC10aWxlZCkgY2F1c2VkIC1FSU5WQUwgb24gdGhlDQo+ID4gY3Vyc29yIGNv
bW1pdC4NCj4gPg0KPiANCj4gQ3Vyc29yIGFsc28gaGFzIElOX0ZPUk1BVFMgcHJvcGVydHkgc28g
YmV0dGVyIHRvIGJhc2UgaXQgb24gdGhhdC4NCj4gDQpUaGlzIHNlZW1zIHRvIGJlIGEgZ29vZCB3
YXkgdG8gaW1wbGVtZW50LiBJIHdpbGwgd29yayBvbiB0aGF0Lg0KUmVnYXJkcywNClNvd21peWEg
Uy4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTb3dtaXlhIFMgPHNvd21peWEuc0BpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC9rbXNfcGlwZV9zdHJlc3MuYyB8IDQgKystLQ0KPiA+
ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfcGlwZV9zdHJlc3MuYw0KPiA+IGIvdGVz
dHMvaW50ZWwva21zX3BpcGVfc3RyZXNzLmMgaW5kZXggYTg0NDMzYjlkLi41MzYyZmU5ZjMgMTAw
NjQ0DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwva21zX3BpcGVfc3RyZXNzLmMNCj4gPiArKysgYi90
ZXN0cy9pbnRlbC9rbXNfcGlwZV9zdHJlc3MuYw0KPiA+IEBAIC03MzYsOCArNzM2LDggQEAgc3Rh
dGljIHZvaWQgY3JlYXRlX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgZGF0YSAqZGF0YSkNCj4gPiAgIAkJ
aWYgKCFkYXRhLT5jdXJzb3JfZmJbaV0uZmJfaWQpIHsNCj4gPiAgIAkJCWlndF9jcmVhdGVfY29s
b3JfZmIoZGF0YS0+ZHJtX2ZkLA0KPiA+ICAgCQkJCQkgICAgY3Vyc29yX3dpZHRoLCBjdXJzb3Jf
aGVpZ2h0LA0KPiA+IC0JCQkJCSAgICBkYXRhLT5mb3JtYXQsDQo+ID4gLQkJCQkJICAgIGRhdGEt
Pm1vZGlmaWVyLA0KPiA+ICsJCQkJCSAgICBEUk1fRk9STUFUX0FSR0I4ODg4LA0KPiA+ICsJCQkJ
CSAgICBEUk1fRk9STUFUX01PRF9MSU5FQVIsDQo+ID4gICAJCQkJCSAgICAxLjAsIDAuMCwgMC4w
LA0KPiA+ICAgCQkJCQkgICAgJmRhdGEtPmN1cnNvcl9mYltpXSk7DQo+ID4gICAJCX0NCg0K
