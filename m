Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984ACC87FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 15:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440B710E0D3;
	Wed, 30 Jul 2025 15:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ER+VkO84";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35BB510E0D3
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 15:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753887839; x=1785423839;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=pw8U/j15/W2QQdHDDrAW/6L5qQQxPuOaknvvGUxDHRM=;
 b=ER+VkO84R6u0JJcYpzZyz4S1+ybXSf0OMTsLAYz/Kq172rBAQIcJYaWN
 x6RXzCVg811K8GC9bkBe5UxsBeHEzXky+Kwr7YCLuHSj52pK79jpAsmv0
 jn8N1i1sTNILu2l8bxnTeKDt3z8oo8B2irB4UfeeaQMeyFsk395zGDYgq
 8Qz4aYy4WA9E7Qry9f9RA+kqWZKrXt9Jrin5tSDiHQO331is91VwKvpgm
 PwdeNLf0qrfFuY+2BH0WTkQkNcU/dmRk3ifxJ65WHjhEognL0isCkrDpb
 gYAME/jwQyBlOQ7TDU2yBWlH9pw7IU8jvglHEkAMO+ZnMeqWRIlxXKGxz A==;
X-CSE-ConnectionGUID: nXFEacBTSW+DxQXP22EFZg==
X-CSE-MsgGUID: +bU4X+ecSdaGNs8v47ojtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="60008150"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="60008150"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 08:03:59 -0700
X-CSE-ConnectionGUID: C3QdFWoKTvaHLXx7jIHIEg==
X-CSE-MsgGUID: YsH4D33uSJuaI39Wrh6Cew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162272129"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 08:03:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 08:03:58 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 08:03:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.48)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 08:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjWp2QKAr2XnyKDkhPYOFIKQw5fifk1VR/BEsw7d34Nybe4bz7vd2l0rGeiXYN9xJQK8xkD0lDE3Gg6T9d/im+IJa5AIJnAxm7NHhXdlKDRe+RnX2U8pPd1Cnibz4z9Yjoi6pHLOAKvtQupUk9KDBjqbXh9KgD+BrjkGkGyADclu4yh19/R4ZroaBH6bvhV3fxCfrHXm7UhFDr8oEtOEEfnWefGFPMsFFP5qSuHjQ0KAr2h+RCbdllCatb6R6UjTaBZDAILifunJqcqOvzJDA3GkBV+AqlS4ONbBLTasXnt/eBf1jMUMs7MT5pD4mfvfxj9Zatrn4N/jOHx+prIknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw8U/j15/W2QQdHDDrAW/6L5qQQxPuOaknvvGUxDHRM=;
 b=p3UjT+K36PAzDpe61/aDiUJW9VZl+XnaR8+z8KtuCxIZamK2uWtWUnt9y6kTEV+0DNAL/DmdEhKqQn2W4X8ShzynZt7Hxnx3lJzQc9ntQwYvcFyNmkOdzM9X6fVyg83rQgozIDnHpDnelmUuaIBojwjYjaRs7KlO7PRBeuGtA4ABJfw0WooOE9GLBA/LRBU1sVv/wNz8vwJgpbMd97yEvrD5L1MFabeSRmf5T+jVKQgfxEGRwmBU/kfoR8sGUrgSkGr67Ny4LTVLGiQg859jIR6vU+0tQE3V2r8R+Ym6toYZDk56zl6wozujErZmJPSD1C9pxrsFq+ykOyfoeNCHAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB8802.namprd11.prod.outlook.com (2603:10b6:208:598::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Wed, 30 Jul
 2025 15:03:54 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8989.011; Wed, 30 Jul 2025
 15:03:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Topic: [PATCH i-g-t] tests/xe_vm: Report OOM for vm_bind ioctl under
 memory pressure
Thread-Index: AQHcAEfzc/sOaXxkM0eM6bCKnMcDn7RKdzQAgABOdJA=
Date: Wed, 30 Jul 2025 15:03:53 +0000
Message-ID: <CH3PR11MB84348FE1AA6CF5F592584F5E8D24A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250729051622.3322969-1-priyanka.dandamudi@intel.com>
 <0e7e0fea86eed522287724a4551bf533bcb7d184.camel@intel.com>
In-Reply-To: <0e7e0fea86eed522287724a4551bf533bcb7d184.camel@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB8802:EE_
x-ms-office365-filtering-correlation-id: 49a11c0b-d9b3-45e6-fb60-08ddcf7a4cdb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?T0s3eFllOEJMem1lbjhRclF0enJQMzlnNWtFY0lJVFlDaGNlMldudkJEMzlx?=
 =?utf-8?B?UXpjOXNrS1NRU2E5TDVKMTh0UXNGTjBSMndrNCtocm5JOGI5Q1NCZnQzbGVG?=
 =?utf-8?B?VzhlcWxRZWlybTVBYVkrdXJnRk5zMHV1R0N1VTZNZU5PTVJ5T1RVekJvQnhm?=
 =?utf-8?B?eDdkREQ5enl2L3RyRFBRdUZKcWgxeWZ2QUN0bzRTNnovTytHZWVGdytOK1Ay?=
 =?utf-8?B?bkxqU1VmSi8zTVVRZlpldXJSMFRZY2FNTUI2SFdNd3U2VldwQkIyeE5RczRJ?=
 =?utf-8?B?Yks2N0YyMml4dmJGTzIvMWVrMVIza0J6MHA5T1RTdE01NmMyVFlPUVRmMUtO?=
 =?utf-8?B?U1pHT0lpZWkvMzJGVjdzOW9icy95UGE3d0t3SWZjV0xoVTlLdGpMeFcweFk3?=
 =?utf-8?B?Ny9pRnRla3NyN3o0bm1ZUEt5Q3dmaTJjb3pFWG1oZE10UkZ1dmZtSkk0Slhp?=
 =?utf-8?B?Sk01Rzg3TG5na3I3RURnMlUyZFdPaHhKZUFMUDJTdExpQlBXR2FvemY2RzlM?=
 =?utf-8?B?WERkU2ttVHNhNFJNZWxFeUQva3YrUUg2VmdxYURGVDdjV2ZWR2V2ZnN0dlgv?=
 =?utf-8?B?SVhwRENwcHpINWVKK2tOSURxVzIzTHBSOU5LbE5OaFdoN2w5NU9KMEZVT3ND?=
 =?utf-8?B?bHhxQjY1dFN4UTdmaXA4WkdWUW0rNXE3ZU9LeU1iVVpEa0R0c092Yy9SaEpK?=
 =?utf-8?B?NFlvN2FRU1gzSmVqN3RNZ3RCdjhYTEF4ZGNxT3VnYzduOVBrK2JxQzZ4TkJz?=
 =?utf-8?B?czBjcmx3K2VJaDhrRktUWm1aemlWMlV1cjZUbmFLOXB6V1E5NlBVSTh5QUxm?=
 =?utf-8?B?OHY5VkhSbEZVQ1BrWkdyTlRjWEM4UUZNSkhPRXYySWg5N1VZdEFxMXNNUDh6?=
 =?utf-8?B?SCtNcXk1V2pPN0ZqbGg5a3FRc2k0Sk5KcHZmY0c3eVJ4bmMwaTEyMm1MQjQ2?=
 =?utf-8?B?M0EzL1pJeTVZU0dyOE9pWXFQUG9VNzg2Zy9nb0VzTy83UmxEZ2R6Rmc3cG55?=
 =?utf-8?B?QzMyNDc5QUZUNUR4SWUzR3FkNVFFVGwzZkZCWHJqQXdqeUtzeHRvTk9iVTBw?=
 =?utf-8?B?RjY5UTVkM2dlbUdrNkJ2YmoweTlGbWFidm00aGdDTzBubTRPUVBNSXhTSFpI?=
 =?utf-8?B?ZUZHQmViZG94dHZ3MzhGWlgxMFVkK0hoVklyRGh6a1BLalNCTlhwTXZCcVNJ?=
 =?utf-8?B?WmFoT21kTk8yc204eUVoZWhuYk9ia2svNEI1NkpLRWpXVUM3MXZyQStJRFht?=
 =?utf-8?B?TExEZ3ZDTzAweTFCOFJDNkkyb29PT0R5QnVTWXFPaDY4TlFDUy9CeDRraVl4?=
 =?utf-8?B?ZTFESC9YeVdEYTJ0TlFwTEdPYm5GTytpRHpsSC9PWG8vd2JBcU9qTFpuZzFh?=
 =?utf-8?B?VWpENklKQ3dWTW5iWllleFd2elE4RlNaYnRtcGYrRlcya2szenNxTWI3QW9C?=
 =?utf-8?B?V3IrblFJYzd5QUVZWVhzSEFBVmhjMGpSRS9obWNJbUhpRmR4MW1EbXNLWVlB?=
 =?utf-8?B?dHI1dWZyVVUvOVBwRG9wZnc3cXFaQ1NYNkRLSVExM3pPd0pjUERheWlnQTl4?=
 =?utf-8?B?QTZRTXdNZkNuc3VFbHA5eGZ6dFBFNDVsWkJBV1FWUXBIK1dQSHo1ckxXQ1Ra?=
 =?utf-8?B?K3VQQlBhQ0JoRzRESkYrcHZ5QVFTbEh6anVVdkNuNm9GQUErS2IvMW1PYW03?=
 =?utf-8?B?MjdmdzA5dWNHY3YrRUgwRmVNdFBFOS85ZUxxeE5IZnpZNUlSUURpdHpVVnhK?=
 =?utf-8?B?WVZ5bkhOaENubmhWeC9lcU9sUDhBUzhpOGF2R3FSQXQrYlpRcGw3cVF0ZDU0?=
 =?utf-8?B?THpuNGFwRm90T3RFYnBnRmJYR0FjMmtjT3VYM1V1Y0FuNnNMa3pTSnVqZ2RN?=
 =?utf-8?B?VG1hZXR2RUZjMmQ2TXg1NmRISzFLZ1R2RlRQVTBDayt1RlFrRE12UHNPUmFF?=
 =?utf-8?B?M09TSjJWcER3alJ0ODJMeUtjR2Z5V2V4Mm1uNmdOQ2tZM2NCSGVKK0VUV3dY?=
 =?utf-8?B?T1F0S1doSm1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmJJRmw2UkpOQ2ZCclZtelpjQzJObWx5Zy9rNzZGMEZHZWxKbTdIc29rTG9Z?=
 =?utf-8?B?UnZsckhWLzNzbXFNcU1GcUEwRnRUYXpaZjBjbzNYTVdNVXNqSnl0M1Vnc2lQ?=
 =?utf-8?B?aFBkTFZvV3JCRnNxWnhYbmFUU1dLbG1PeUU0UnZpR3Nsd0loS0JxQTdkOHlD?=
 =?utf-8?B?dzFoZGpGdVlUVFByRitsVDV3R2pQUExJaWE2QWRKVjExZE9jUTIyOXB5dUpD?=
 =?utf-8?B?OHNUTGp2ZmJXV2FVQUpaNjRzVEtpUHo1aC9RUzk5K3RyWHBkZ0dWU2IwbXpX?=
 =?utf-8?B?eEZtUzljdnlhMFVEdjV5clVENjRCamxENGZIOHl5UVl5cmVTSmIyQWhYd3gx?=
 =?utf-8?B?Q2NMZWpnT2xOTEc4Ykt4V1hFZVREWlBUYzgyMUNDbG1LRVFLY1FmTktxVG9C?=
 =?utf-8?B?T05oYldTUklmNThaTmpCOHNJZE9jam1xL3FqMTErNkVraFNCQUV4L0wvZTZV?=
 =?utf-8?B?U0VkVm9GZ05na2Y2UnMvZlVXSzBOTk1SeXNmK2dxNXVNT09wblVHUXpuSU9Y?=
 =?utf-8?B?OGRIK3RFaXRHamk0OCtFMDJWRHFnWGlXdVBrN0U0T0NxU2NJQWE1bEhPcVdr?=
 =?utf-8?B?dGVaZFlRRUprcy9nQlZ4cFZrOWNEYmVYQjdHZFZXZTZtdFVDUkY2YVFyMnNv?=
 =?utf-8?B?MVFDUlA5SHplb1hYL2dKaHlUWjcwMzRZUEpDLzlsL2tXUGdmREhHcmV1S09I?=
 =?utf-8?B?S01ja0hWTitGNUFXRnR4M1lQYzZlcFgvVUVUWHBrYmxHQngxcXZrV3VndjFI?=
 =?utf-8?B?ZnRaNUgyZWhNM2NzeWJiM2ZGWTEvVDZCcmpCQ1BkNFVMUU5FZk1HRGEyS1dp?=
 =?utf-8?B?SzVxeGk2VXlSbnFxUjJOS2RvclZjZWdIV0YvUDFXdzNVTEdJdGpWMWhGYlRF?=
 =?utf-8?B?eng0ZFAwcHN6UUNhdXZEVkdiUVZSbm1pNTdSUm43U1BIVEt1YlhBMENTSWdh?=
 =?utf-8?B?Q1VHSlZkbFNjcExlUzQ5aEs1dCtGVld2SEo4d3VsbVhsdDFCVmZmb1Uyd0sx?=
 =?utf-8?B?QytoMVlmVFVDMmppVFo2QXJnY2RKYnVyV1BvV1M4ODN1WDNhbzFGMnd2eEdo?=
 =?utf-8?B?UlkzTjdEdFVWR1lTUkc3RUMrM0FOQnhUejJaQzlXNzl4R2x0OTdFUHJOajF3?=
 =?utf-8?B?TkhRajJsVzFwQkJYL3ZxWEZwRWMvc09uQlRvUHhTWjQyOXRQbGlxRnIyYnl6?=
 =?utf-8?B?RzZxaHNTRjVlakZ0cjNOc2RwVnYyS0kvQ2N6RWZ4YWpadzNoUHMrL3ZTSXRo?=
 =?utf-8?B?YXVnSXRTb0l3V2o1VnJPUEw1VFdubGJYVzlNcFpicmFkaXRMZ25kK0JRQWtq?=
 =?utf-8?B?M3hoQ29lUGpGMFV2Z2Zaajk4dXA5MFczYkRaUWJROCs1V0t2b045L1BhWWR1?=
 =?utf-8?B?emlNaDJnT3VuY2lXdUpQeWtKZWdyL29oNzRvbEh2NmIwV2ZlVlltTWJWaUJH?=
 =?utf-8?B?THBNRVRhdDN3N05CWGlnVEh0bWJKaklKVUxZMTkva0tTTFVJbzFMaTNpeWJ2?=
 =?utf-8?B?a2liOE84R3pNU2hydEloM0J5SjhUeEwwSjFDOFd4ZVRuV2RKWnRFSjdjNFY0?=
 =?utf-8?B?MzM3Wm1CWm5KalE4ZitSOHpNcm1idC9ndWZGeEhQVWhFUmw2eFVrSkhaREVu?=
 =?utf-8?B?VCs4aE04MXdZMnRxdk1QWXlNUkZiNUtjNTNZVVhJN2o0dlNCb2kwRVA3U1Y5?=
 =?utf-8?B?WGJBQXhZWEt1OU83ZTUyd2x5ZkFtN2hXNGFrd3FNSUtuRk05UGs2VXhZUXBr?=
 =?utf-8?B?MlV0OVBrSWZwbUZTT21JWmlsYVZBNTYvZzhCMXhCS1g0QXMwcXBoMGxPVXBp?=
 =?utf-8?B?T1ZYS3JDVjU2NldwUXBTMSttQXJSL21QZjFwTzNJVGd0d1Q3dXUzOC9hNjJO?=
 =?utf-8?B?bmRUTUl0MVlTallrM20rT3dLSHBMdW55S1dNUFE5WGFZVkF0RUd3R0Y4OUww?=
 =?utf-8?B?a0RFWXFXY2UzZ3NvT0E5eG5pa3pYOU5MU1RPRGQxYmVUa3hyV01Ia0wyTGR2?=
 =?utf-8?B?SDhNMWRBenV2aDJ2dk9FSzl1eitjeC85VUMxUVBzd3ArRHE0VUZ4RTFWQjBC?=
 =?utf-8?B?dXR1SjdpOTl1K3lJNmhESXVMWENzTk1ZdlhMeDBxc1FGYktyZEthUzRVNWY0?=
 =?utf-8?B?enVnS3hUOTNocGFETU9YOFFMRGc3VDIraHJQL29OUmd1UGJRRUJoVnVWbHlv?=
 =?utf-8?B?R1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a11c0b-d9b3-45e6-fb60-08ddcf7a4cdb
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 15:03:53.8524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iSFqMCKoKmLPUVjM9YwjrXESq2XkCzcqv8ibKzq0ly3hx3TmCKPKhTp2QNtbPHUOn+/AE1NE4KuvpX1Pxx75Cl4xAkkPebhz/e6Gucry2ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8802
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGVsbHN0cm9tLCBUaG9t
YXMgPHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPg0KPiBTZW50OiAzMCBKdWx5IDIwMjUgMDM6
NTMgUE0NCj4gVG86IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBEYW5kYW11ZGksIFBy
aXlhbmthDQo+IDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIGktZy10XSB0ZXN0cy94ZV92bTogUmVwb3J0IE9PTSBmb3Igdm1fYmluZCBpb2N0bCB1
bmRlcg0KPiBtZW1vcnkgcHJlc3N1cmUNCj4gDQo+IE9uIFR1ZSwgMjAyNS0wNy0yOSBhdCAxMDo0
NiArMDUzMCwgcHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBQ
cml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+ID4NCj4g
PiBBZGQgYSB0ZXN0IHdoaWNoIGNyZWF0ZSBidWZmZXIgb2JqZWN0cyBvbiBhbiBMUiB2bSBhbmQg
dm1fYmluZGluZw0KPiA+IGJ1ZmZlciBvYmplY3RzIGluIGEgbG9vcCB1bnRpbCBpdCByZWFjaGVz
IE9PTS4NCj4gPiBUaGlzIGlzIHRvIGNoZWNrIHRoYXQgYnVmZmVyIG9iamVjdHMgb24gYSBzaW5n
bGUgdm0gZG9lc25vdCBnZXQNCj4gPiBldmljdGVkIGFuZCBpbnN0ZWFkIHJlcG9ydCB3aXRoIEVO
T01FTSBvciBFTk9TUEMgaW4gbm9uIGZhdWx0IG1vZGUuDQo+ID4NCj4gPiB2MjogV2hlbiB2bV9i
aW5kIGZhaWxzIHdpdGggb29tIGV2ZW4gYmVmb3JlIHRoZSBtZW1vcnkgYWxsb2NhdGlvbiBnb2Vz
DQo+ID4gYmV5b25kIHZpc2libGUgdnJhbSBzaXplLiBUZXN0IHNob3VsZCBzdGlsbCBwYXNzIHdo
ZW4gVlJBTSBpcyBzbWFsbGVyDQo+ID4gdGhhbiBleHBlY3RlZCBtYXkgYmUgZHVlIHRvIGxlYWtl
ZCBWUkFNIG1lbW9yeSB3aXRoIGEgd2FybmluZy4NCj4gPiBWTSBiaW5kIGVycm9yIGNvdWxkIGJl
IEVOT01FTSBvciBFTk9TUEMgZm9yIG9vbS4gVk0gYmluZCBzaG91bGQNCj4gaGFwcGVuDQo+ID4g
YXRsZWFzdCBvbmNlIGZvciBzYW5pdHkgY2hlY2sgcHVycG9zZS4gTW9kaWZpZWQgY29kZSB0byBo
YW5kbGUgdGhlc2UNCj4gPiBjaGFuZ2VzLg0KPiA+DQo+ID4gQ2M6IFRob21hcyBIZWxsc3Ryb20g
PHRob21hcy5oZWxsc3Ryb21AaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFByaXlhbmth
IERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT4NCj4gDQo+IEhpLCBQcml5
YW5rYSwNCj4gDQo+IEEgY291cGxlIG9mIHN0eWxlIGNvbW1lbnRzIGJlbG93Og0KPiANCj4gDQo+
ID4gLS0tDQo+ID4gwqB0ZXN0cy9pbnRlbC94ZV92bS5jIHwgODkNCj4gPiArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4
OSBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfdm0u
YyBiL3Rlc3RzL2ludGVsL3hlX3ZtLmMgaW5kZXgNCj4gPiBjMWFiYjA4YmIuLjAwMTEzNDM4NyAx
MDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV92bS5jDQo+ID4gKysrIGIvdGVzdHMvaW50
ZWwveGVfdm0uYw0KPiA+IEBAIC0yMzY4LDYgKzIzNjgsODkgQEAgc3RhdGljIHZvaWQgaW52YWxp
ZF92bV9pZChpbnQgZmQpDQo+ID4gwqAJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfVk1f
REVTVFJPWSwgJmRlc3Ryb3ksIEVOT0VOVCk7DQo+ID4gwqB9DQo+ID4NCj4gPiArLyoqDQo+ID4g
KyAqIFNVQlRFU1Q6IG91dC1vZi1tZW1vcnkNCj4gPiArICogRGVzY3JpcHRpb246IFRlc3QgaWYg
dm1fYmluZCBpb2N0bCByZXN1bHRzIGluIG9vbQ0KPiA+ICsgKiB3aGVuIGNyZWF0aW5nIGFuZCB2
bV9iaW5kaW5nIGJ1ZmZlciBvYmplY3RzIG9uIGFuIExSIHZtIGJleW9uZA0KPiA+IGF2YWlsYWJs
ZSB2aXNpYmxlIHZyYW0gc2l6ZS4NCj4gPiArICogRnVuY3Rpb25hbGl0eTogb29tDQo+ID4gKyAq
IFRlc3QgY2F0ZWdvcnk6IGZ1bmN0aW9uYWxpdHkgdGVzdA0KPiA+ICsgKi8NCj4gPiArc3RhdGlj
IHZvaWQgdGVzdF9vb20oaW50IGZkKQ0KPiA+ICt7DQo+ID4gKyNkZWZpbmUgVVNFUl9GRU5DRV9W
QUxVRSAweGRlYWRiZWVmZGVhZGJlZWZ1bGwgI2RlZmluZSBCT19TSVpFDQo+ID4gK3hlX2JiX3Np
emUoZmQsIFNaXzUxMk0pICNkZWZpbmUgTUFYX0JVRlMNCj4gPiArKGludCkoeGVfdmlzaWJsZV92
cmFtX3NpemUoZmQsIDApIC8gQk9fU0laRSkNCj4gPiArCXVpbnQ2NF90IGFkZHIgPSAweDFhMDAw
MDsNCj4gPiArCXVpbnQ2NF90IHZtX3N5bmM7DQo+ID4gKwl1aW50MzJfdCBib1tNQVhfQlVGUyAr
IDFdOw0KPiA+ICsJdWludDMyX3QgKmRhdGFbTUFYX0JVRlMgKyAxXTsNCj4gPiArCXVpbnQzMl90
IHZtOw0KPiA+ICsJc3RydWN0IGRybV94ZV9zeW5jIHN5bmNbMV0gPSB7DQo+ID4gKwkJeyAudHlw
ZSA9IERSTV9YRV9TWU5DX1RZUEVfVVNFUl9GRU5DRSwgLmZsYWdzID0NCj4gPiBEUk1fWEVfU1lO
Q19GTEFHX1NJR05BTCwNCj4gPiArCQnCoCAudGltZWxpbmVfdmFsdWUgPSBVU0VSX0ZFTkNFX1ZB
TFVFIH0sDQo+ID4gKwl9Ow0KPiA+ICsJc2l6ZV90IGJvX3NpemUgPSBCT19TSVpFOw0KPiA+ICsJ
aW50IHRvdGFsX2J1ZnMgPSBNQVhfQlVGUzsNCj4gPiArCWludCBiaW5kX3ZtID0gMDsNCj4gPiAr
CWJvb2wgb29tID0gZmFsc2U7DQo+ID4gKw0KPiA+ICsJdm0gPSB4ZV92bV9jcmVhdGUoZmQsIERS
TV9YRV9WTV9DUkVBVEVfRkxBR19MUl9NT0RFLCAwKTsNCj4gPiArCWZvciAoaW50IGl0ZXIgPSAw
OyBpdGVyIDw9IHRvdGFsX2J1ZnM7IGl0ZXIrKykgew0KPiA+ICsJCWludCBlcnIgPSAwOw0KPiA+
ICsJCWJvW2l0ZXJdID0geGVfYm9fY3JlYXRlKGZkLCAwLCBib19zaXplLA0KPiA+ICsJCQkJCXZy
YW1faWZfcG9zc2libGUoZmQsIDApLA0KPiA+ICsJCQkJCURSTV9YRV9HRU1fQ1JFQVRFX0ZMQUdf
REVGRVINCj4gPiBfQkFDS0lORyB8DQo+ID4gKwkJCQkJRFJNX1hFX0dFTV9DUkVBVEVfRkxBR19O
RUVEUw0KPiA+IF9WSVNJQkxFX1ZSQU0pOw0KPiA+ICsNCj4gPiArCQlzeW5jWzBdLmFkZHIgPSB0
b191c2VyX3BvaW50ZXIoJnZtX3N5bmMpOw0KPiA+ICsJCWVyciA9IF9feGVfdm1fYmluZChmZCwg
dm0sIDAsIGJvW2l0ZXJdLCAwLA0KPiA+ICsJCQkJwqDCoCBhZGRyICsgYm9fc2l6ZSAqIGl0ZXIs
IGJvX3NpemUsDQo+ID4gKwkJCQnCoMKgIERSTV9YRV9WTV9CSU5EX09QX01BUCwgMCwgc3luYywN
Cj4gPiArCQkJCcKgwqAgMSwgMCwgREVGQVVMVF9QQVRfSU5ERVgsIDApOw0KPiA+ICsNCj4gPiAr
CQlpZiAoZXJyKSB7DQo+ID4gKwkJCWlmIChlcnIgPT0gLUVOT01FTSB8fCBlcnIgPT0gLUVOT1NQ
Qykgew0KPiA+ICsJCQkJb29tID0gdHJ1ZTsNCj4gPiArCQkJCWJyZWFrOw0KPiA+ICsJCQl9DQo+
ID4gKwkJCWVsc2UNCj4gPiArCQkJCWlndF9hc3NlcnRfZihlcnIsICJVbmV4cGVjdGVkIGVycm9y
DQo+ID4gJWQgZm9yIHZtIGJpbmRcbiIsDQo+ID4gKwkJCQkJwqDCoMKgwqAgZXJyKTsNCj4gPiAr
CQl9DQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQliaW5kX3ZtID0gYmluZF92bSArIDE7DQo+IA0KPiBO
b3Qgc3VyZSBob3cgc3RyaWN0IGlndCBjb2Rpbmcgc3R5bGUgaXMgYnV0IGlmIGl0J3MgdGhlIHNh
bWUgYXMga2VybmVsIGNvZGluZyBzdHlsZSwNCj4gdGhlbiB0aGUgZWxzZSBzaG91bGQgYmUgYXQg
dGhlIHRoZSBzYW1lIGxpbmUgYXMgdGhlIGNsb3NpbmcgYnJhY2tldCwgYW5kIHRoZQ0KPiBlbHNl
IHBhdGggc2hvdWxkIGFsc28gYmUgaW5jbHVkZWQgaW4gYnJhY2tldHMuDQo+IA0KPiANCj4gPiAr
DQo+ID4gKwkJeGVfd2FpdF91ZmVuY2UoZmQsICZ2bV9zeW5jLCBVU0VSX0ZFTkNFX1ZBTFVFLCAw
LA0KPiA+IE5TRUNfUEVSX1NFQyk7DQo+ID4gKwkJdm1fc3luYyA9IDA7DQo+ID4gKwkJZGF0YVtp
dGVyXSA9IHhlX2JvX21hcChmZCwgYm9baXRlcl0sIGJvX3NpemUpOw0KPiA+ICsJCW1lbXNldChk
YXRhW2l0ZXJdLCAwLCBib19zaXplKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlpZ3RfYXNzZXJ0
X2Yob29tLCAiT09NIHNjZW5hcmlvIGlzIG5vdCB3b3JraW5nIGFzDQo+ID4gZXhwZWN0ZWRcbiIp
Ow0KPiA+ICsNCj4gPiArCWlmIChiaW5kX3ZtIDwgdG90YWxfYnVmcykgew0KPiA+ICsJCWZvciAo
aW50IGl0ZXIgPSAwOyBpdGVyIDwgYmluZF92bTsgaXRlcisrKSB7DQo+ID4gKwkJCXN5bmNbMF0u
YWRkciA9IHRvX3VzZXJfcG9pbnRlcigmdm1fc3luYyk7DQo+ID4gKwkJCXhlX3ZtX3VuYmluZF9h
c3luYyhmZCwgdm0sIDAsIDAsIGFkZHIgKw0KPiA+IGJvX3NpemUgKiBpdGVyLCBib19zaXplLA0K
PiA+ICsJCQkJCcKgwqAgc3luYywgMSk7DQo+ID4gKwkJCXhlX3dhaXRfdWZlbmNlKGZkLCAmdm1f
c3luYywNCj4gPiBVU0VSX0ZFTkNFX1ZBTFVFLCAwLCBOU0VDX1BFUl9TRUMpOw0KPiA+ICsJCQlt
dW5tYXAoZGF0YVtpdGVyXSwgYm9fc2l6ZSk7DQo+ID4gKwkJCWdlbV9jbG9zZShmZCwgYm9baXRl
cl0pOw0KPiA+ICsJCX0NCj4gPiArCQlpZ3Rfd2FybigiVlJBTSB3YXMgc21hbGxlciB0aGFuIGVz
dGltYXRlZCwgbWF5IGR1ZQ0KPiA+IHRvIGxlYWtlZCBWUkFNIG1lbW9yeVxuIik7DQo+IA0KPiBD
b3VsZG4ndCB0aGlzIGJlIHJlLWFycmFuZ2VkIGxpa2UNCj4gCWlmIChiaW5kX3ZtIDwgdG90YWxf
YnVmcykNCj4gCQlpZ3Rfd2FybigiVlJBTSB3YXMgc21hbGxlciB0aGFuIGVzdGltYXRlZCwgbWF5
IGR1ZSB0bw0KPiBsZWFrZWQgVlJBTSBtZW1vcnlcbik7DQo+IAlmb3IgKGludCBpdGVyID0gMDsg
aXRlciA8IGJpbmRfdm07IGl0ZXIrKykgey4uLg0KPiANCj4gDQo+IA0KPiA+ICsJfQ0KPiA+ICsJ
ZWxzZSB7DQo+IA0KPiAJU28gdGhhdCB0aGlzIGNvZGUtcGF0aCBpcyBub3QgbmVlZGVkOg0KPiAN
Cj4gVGhhbmtzLA0KPiBUaG9tYXMNCkFkZHJlc3NlZCBhbGwgdGhlIGNvbW1lbnRzIGluIHRoZSBu
ZXh0IHZlcnNpb24uDQo+IA0KPiANCj4gPiArCQlmb3IgKGludCBpdGVyID0gMDsgaXRlciA8IHRv
dGFsX2J1ZnM7IGl0ZXIrKykgew0KPiA+ICsJCQlzeW5jWzBdLmFkZHIgPSB0b191c2VyX3BvaW50
ZXIoJnZtX3N5bmMpOw0KPiA+ICsJCQl4ZV92bV91bmJpbmRfYXN5bmMoZmQsIHZtLCAwLCAwLCBh
ZGRyICsNCj4gPiBib19zaXplICogaXRlciwgYm9fc2l6ZSwNCj4gPiArCQkJCQnCoMKgIHN5bmMs
IDEpOw0KPiA+ICsJCQl4ZV93YWl0X3VmZW5jZShmZCwgJnZtX3N5bmMsDQo+ID4gVVNFUl9GRU5D
RV9WQUxVRSwgMCwgTlNFQ19QRVJfU0VDKTsNCj4gPiArCQkJbXVubWFwKGRhdGFbaXRlcl0sIGJv
X3NpemUpOw0KPiA+ICsJCQlnZW1fY2xvc2UoZmQsIGJvW2l0ZXJdKTsNCj4gPiArCQl9DQo+ID4g
Kwl9DQo+ID4gK30NCj4gPiArDQo+ID4gwqBpZ3RfbWFpbg0KPiA+IMKgew0KPiA+IMKgCXN0cnVj
dCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UsICpod2Vfbm9uX2NvcHkgPSBOVUxM
Ow0KPiBAQA0KPiA+IC0yNzU5LDYgKzI4NDIsMTIgQEAgaWd0X21haW4NCj4gPiDCoAlpZ3Rfc3Vi
dGVzdCgiaW52YWxpZC12bS1pZCIpDQo+ID4gwqAJCWludmFsaWRfdm1faWQoZmQpOw0KPiA+DQo+
ID4gKwlpZ3Rfc3VidGVzdCgib3V0LW9mLW1lbW9yeSIpIHsNCj4gPiArCQlpZ3RfcmVxdWlyZSh4
ZV9oYXNfdnJhbShmZCkpOw0KPiA+ICsJCWlndF9hc3NlcnQoeGVfdmlzaWJsZV92cmFtX3NpemUo
ZmQsIDApKTsNCj4gPiArCQl0ZXN0X29vbShmZCk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+IMKgCWln
dF9maXh0dXJlDQo+ID4gwqAJCWRybV9jbG9zZV9kcml2ZXIoZmQpOw0KPiA+IMKgfQ0KDQo=
