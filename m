Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071E9C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 05:36:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC37B10E083;
	Thu, 17 Jul 2025 05:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5HWwjMt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 932A410E083;
 Thu, 17 Jul 2025 05:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752730577; x=1784266577;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9hrMYmmF+0PELAW3SpBMznAMxYn/qt59nmNwMm/LcnQ=;
 b=e5HWwjMtUXgkoLfy6eQJaLgjEaKCuh0FDSVHkiOJMVF2WSldUBhwfb3c
 fWpz5UU6t59XCdIlMV/28UCSFlNTXxetVip9Ra6BXq3Xv/WdW4b9J8mE+
 a8hn949uR69ohf4gtQA+zATJE2oBYSjGfu/3XVmwLvNUrnhahN5kQomyz
 uiEW6e0wUBnmRSWn+2xwEKhwFPAu+rDRI4vEnC6oUGppCOGFTAI+VzzZc
 9znFlduceWTmZ8N9K5rQXKLcc9aenxeJNb4bS50la9LNsMjmlNnM57bGS
 08ClRKo7F+0mS4V2wsH8DkumkjnbR3W+b8oIy7HTF19fH7vMazunHdXvc w==;
X-CSE-ConnectionGUID: ioRjx/FYRS+0i5U42RS8Kg==
X-CSE-MsgGUID: hmBZV4JtSNijU/VITgzD3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="72558410"
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="72558410"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 22:36:16 -0700
X-CSE-ConnectionGUID: Ig7QTXBuQ/iMqhfJVg7uZQ==
X-CSE-MsgGUID: b5Svh+fjQdeSjNPOm/tGYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,317,1744095600"; d="scan'208";a="157766482"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 22:36:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 22:36:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 16 Jul 2025 22:36:15 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.51)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 16 Jul 2025 22:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jCSJuMRQYIBl2HGcfCjnbd9K+UofaTXN41+sLuC+xdjSZRn5MdV9G9GkUgM2GJ3sDvJfibZnQjTHQG2YCLzPwy6H0hc9s1UovhiFsEpLEpr9UZc06DzEXDRpbu1cGWwAyHJ1t4jpYVBc2Xn6z3oQf9RMmwanBVBqI56LTesRWn9QCrItuiUApzb+pxOzUBAO5BlCqdJeqkgzWKeubiwTF46VvgH4wKuAjIdMBARYr4Vnrg9tfD+zrtP9WoAhvguJ0ASJEOcxqqV32PPVTGqu//XeTAPHPBQnbs3HKLYv1UZbYDrgjJmG8N/8fKjrzZhhBTVKmU7QPiSrCAO65NXTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hrMYmmF+0PELAW3SpBMznAMxYn/qt59nmNwMm/LcnQ=;
 b=m/IyCOqvBHtnKuaUV1Z0dt9oTjCdcYYjNHCTEq+c8uh/7JxCwBbAETG+kZ1jIu4zNVnl/8wQcYL6zKKEJBbSU06ZI+pa3HETMav+keuNfgdH3NbiCHm1S4bNPpEZxui8HcsMqCdyhihzovSO1vReRfZvyjQW90uZjWB330GEVM2FZpCYYRiKT1ThxdeORsaFSeMpgrZhG2wUzuIBFJsQocxoEKLZ8LLfrEN9NsAX2CkcItLQUHY014e61Hc7DGbh+Ep+vNDmvxElqwKW04MnrY3tWrzlLYiKfgD2SR2Lmrj0Gdyqc+0zL+FoXEyqmsCcgF2+vLw8lwNP/2vdYWgdZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 17 Jul
 2025 05:36:13 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%6]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 05:36:13 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkZ1bGw6IGZhaWx1cmUgZm9yIEFkZCBwb3N0LWtt?=
 =?utf-8?Q?od-unbind_igt=5Fhook?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVyZSBmb3IgQWRkIHBvc3Qta21vZC11?=
 =?utf-8?Q?nbind_igt=5Fhook?=
Thread-Index: AQHb9o8+qYbrg+Hyy06l75i0YZyT17Q1tfaw
Date: Thu, 17 Jul 2025 05:36:12 +0000
Message-ID: <CH0PR11MB5491B9E5D4A8FACDBDFC4D9CEF51A@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250715133722.32559-1-peter.senna@linux.intel.com>
 <175268461541.167482.17950571243637892673@1538d3639d33>
 <feb1eb77-3426-4773-b5e6-a775f6d8c04d@linux.intel.com>
In-Reply-To: <feb1eb77-3426-4773-b5e6-a775f6d8c04d@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|IA0PR11MB7816:EE_
x-ms-office365-filtering-correlation-id: c3131bc1-dc99-4635-5d04-08ddc4f3d7be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?YnVGRllmcE1LTHBySEhKcGtFRG9qTnVEZ0xGVkxHRGRYYzUxWkcvQXl3VXNw?=
 =?utf-8?B?NUJ2OWlnQjRucVpVVnVaWHRFTHIwNHQ5SlIxbkZRcjlHOVd3L3pCOWorY0k2?=
 =?utf-8?B?b1NkWEI5Wnl6T1lUa2JTTDgyMXB6aGFmSHQxdmVvdVZyNnpNczNYcGY0ZTM2?=
 =?utf-8?B?c3hJSm92NnZOdWRFZURtTmcvZVBFajY3VmVjb0UxWE0xWS9GRHN1d3FuUTF1?=
 =?utf-8?B?Qy9FMUo1aVIzSk1QUENYQUZiWVNwTHJCeWxaZkNjS3h1T3NvWUtyUHJUOXRm?=
 =?utf-8?B?ZUttcE91WEJDdkhCaEY5dW01REUwN0x6K1RSZUFRM052M2RHMmZaZTgweU1a?=
 =?utf-8?B?UFJZcGxpd1dKekh0MEdQcjhSQmp0SVVTYStLcS9aQ05xcGhqcmxHSEtUWFFW?=
 =?utf-8?B?VUh1L3o3L0ZaMWVHYkRHNjdkY09CSXlHK2g2SEFhNTdXTGlNZVBXYnJIcU1h?=
 =?utf-8?B?c3NZc2EvVUlsREpMcGxJbml6MFJJcUdNRFFXWkJxNTFuNWZKdUFyQ0pwbk8y?=
 =?utf-8?B?a0NvaWZRNUZJbXYraWs5S3hUOENZR0ZkS3VZUXVWdVBkMUE1VmZtTkZSTnIx?=
 =?utf-8?B?Z2NKQmdtUk56RzhneERMSWdndytZZzk0dk92Mm92dEZzSUdKWlFFTk5ReTBB?=
 =?utf-8?B?OGJORmV5VHZkY1dqdTBKT0NDak5XVlZieHc2cUttbFNaZFNWSzdtajA5eUpu?=
 =?utf-8?B?RjNJd1VTZUZTWm4xQUVXMEJlZnY3R0tqVWJneXV0SmxDS0ZOa1VDbitDdENT?=
 =?utf-8?B?SDhLc1FPN3NsMUZ1MFQwS0ZoUE5teW92TlI4RGxGMjd3amFJZkUxekt3c1cv?=
 =?utf-8?B?T3pvK0xUV0p5T0xXWk9BWWFIMWxyOFRJRExVVzVlRXpDQ0R1N01BSTFQWGY1?=
 =?utf-8?B?TWlxdVk3U3c2aG94UUxBcWlJZmVkbUo0TDMrbTd2clhSaURYd0JBeXYzNGp2?=
 =?utf-8?B?djRkNFR1RVNQMnVUQXIxOHJwNXI0aURvWi9HaTJScDRjNUhPQlZwU0ZTeHY1?=
 =?utf-8?B?NWY0WENrR1FHSFd2WGl3bkowR2k3VTNHK0tGMEtlQ090dHBkSmVJR1AyWGcx?=
 =?utf-8?B?d2h6MTFIZ2JRNkQ2VjVHbVhaRmMyZmZhemN3M3J5Y240NWZPT3A4aUhFN2F2?=
 =?utf-8?B?TTI3dlZFVWlxcityV2czWkUzQkFUSjROV3Q2cHBna3Q0UTRmREtNOEtSU1E4?=
 =?utf-8?B?emMzSS9tWWxTR2JyUVcrNUZGblNHNUZVbFZBVjYvUlJTdVhaeWhwZ0Z4NitL?=
 =?utf-8?B?TTlrclpMb3lSdDU4MHYyOHdkRFVMU3lRWDdGQ1VUT0RhS3YzSTEvaE4xbjhS?=
 =?utf-8?B?RVZiMkVZWWRJdm1vM0lhWEVqcjNaKzBSRUVTRmhiWXpTQ2JoUGc5VlVXZlR5?=
 =?utf-8?B?YjdGaWxrOHFuQkVnV2p2RFFmOUxUL1hBYnRFeGR2RVM1ZG5JYjFoTEw5WnM5?=
 =?utf-8?B?aXdESDhNVUdFNm13Z2UvUGxPdUxUcVFqWDcwNjE4YnJaeURVbGloZWRUNWZp?=
 =?utf-8?B?YXhVRjlyQURwMmt2OXEvbmtyS0tUQnQrS2FONml4UElzcnA1bnJiSUxlQ2NV?=
 =?utf-8?B?am5ZKzJHMlJsbE9aOUVRV2UxNWF4QzB1QTlpTUcwaitoVnZJSEZ6MVFpY2FR?=
 =?utf-8?B?c3ZWQ3VyWGI3d1VWN3dVQTYxclczZStqUHJqNVlCQ3FJdlRQQ0Q2TWYwMllC?=
 =?utf-8?B?UHVCUmN5enQra2xNOUxpa2tZSGdNVExROTFubW1aZzl4dmZ4UnczeCtPM1F5?=
 =?utf-8?B?WEtpZ1Jwbi9tOEVneXZMMGNlNEpDUXhCTVR5RENaSng3bmYxcm1BZHJKZERj?=
 =?utf-8?B?a21uaWgxcDJoaVZBWURnck5rTHRIQ2tYRFhTdHVheGtTMUFDRUwyM3Qra2VR?=
 =?utf-8?B?elNWaEZ6OVRDc0sxYmNqT2dCRStkUm9VVEJrYmZYZDMrVCsvWFpUeHpSNVNo?=
 =?utf-8?Q?wYPi3aJwgcA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018)(13003099007)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cU8zN3E4SG5xQktmNzkwcmdLcWVjeVNUK3d5L3V1N1gyNE1va0pEc1VTUis5?=
 =?utf-8?B?UWl1RlByZmMxWHdna1MrZkJxak85K0FDUTNJOFpFVk8xWUFPWmNaSlgySDFZ?=
 =?utf-8?B?ZFdzZFg3REMxakZhN2lKbmVSRzloR1lMaVFQUFZFK2YzRno0VWJielJmbFNy?=
 =?utf-8?B?ZlBkUDBGeDNQOFF3cG9nYjA2d2R3ZGhreGlnOExBTVFBRURxU3pzWURRVVhQ?=
 =?utf-8?B?VVFsUCtHa1Z1N0tVdWEwb2xyQkQwN3FRemgrUGJ6OXNLY04zL3cvcFJndzdL?=
 =?utf-8?B?R1piTW9ZY0wvQldZaUdnNldVNXcxdG5sWm9IMzByQlhYSERXck1KRTBySWk1?=
 =?utf-8?B?c1VZL3c3a3BoWVlNUGpFL2N6TVdGWENVYUNJTHNnWEw4R1Q5NE1tNGtNVmJK?=
 =?utf-8?B?VGRldGpVeERXTEdnelNWei9ranRtOTZkQUdCYlhHR0dVRU8rRHk0Wnk3ZVFt?=
 =?utf-8?B?RGVRdDBtb3hJNmwrMjk3eFNBeENtMncxK3VDZVZQQWpzRE9GNkdVZXhPYmhC?=
 =?utf-8?B?NzVlMGlvN3VzUWc2SThJVFVhQ2NneEVNbk9saXU4elNua2V3QzZJMi80V3Vj?=
 =?utf-8?B?SllrL0VlTDlQVC95YWxBZnVsR3hFZ2puRjYzekFNTVdya0xrK2N1TjA1dVB3?=
 =?utf-8?B?VG1iaGtSbFFhUTZ4dU44OUU1K3kxSDFmVkZVRlM3c25zNzNhZjQ0bHNFUnlR?=
 =?utf-8?B?a0sremJQblpQaWc4SU8vZkNUMms1MmhOakNzMU5QclZzS2RLZEpUQ2svRjlq?=
 =?utf-8?B?WTZBNjZNVFRRUy9XSVdsVFJVNkh1ZXlNZURhMDIySjJubDh4bXc5cFZDVzNY?=
 =?utf-8?B?cDBEV1FCUzZGWDRMK1g5MFdPeG0wejEwdGczRFY3aENsWXB6SmRBTnpVdTVq?=
 =?utf-8?B?RGhKeDd0UFhFR0dsYUZBYkFuVW92RkZLcEJQLzVHV0JvU2NFMWFjUVlnVUlB?=
 =?utf-8?B?SmRxWjNUT29DbGY4TTB6OC9DTkVBZEtHQW5vWkxvQ3dYY2czOHRTL0xNZFpJ?=
 =?utf-8?B?NUtBUVlsS0M2dmJ4UkJtdWxjc1JRMnF2aHh4TDZ1djBmSCtoSWxKbkd0UWdj?=
 =?utf-8?B?RlArcUw4ejlRVzJrM1hIUlZmbGJ4cjRkaGRvK0JOdUsrS095T3FGemsxTThE?=
 =?utf-8?B?Rk5pWlVBTlRhZkFkRXJjN0g5ejZJNWo0dXFVbldKejVEUDFsMWM0ZTMxRXpX?=
 =?utf-8?B?RmxaclRRcWY4MzdxVHh5Y0dTODh6cUhvdFR1YStRcTFzMDB5ODl6Q0NsV3pI?=
 =?utf-8?B?NEVVUjN6cTJmeWtHWjc1TzU0NHRTeDdHUTZkdDN5c2RmMGNpZnYveVhZRUZI?=
 =?utf-8?B?ZS82TjF0YTdQTWxUMVM4R1hxNWVkNnh3NzVvdVlML0lWNUxsR1BkTFdkZ0ZW?=
 =?utf-8?B?bzlMS2Rra21rZFFqL0xsVWpNQ3NIcjVmNS91cjBUK3ljZGZRQkovaHdaSy9z?=
 =?utf-8?B?cWhEd0RjczIyb3ppTkxLRlZ6WnlxKytxR1UwaHJNN2Q3Wkt1ZUtlbUFhdEFq?=
 =?utf-8?B?WXArVG0xWW5GVFJwWnllZmZ2OFFIMVFnMVJhTnNkN05oMlNOd3g3ZHlrMFk0?=
 =?utf-8?B?Nzk2VTMzN1BtWm5samU3SzB6MmcveDIyQkYrRTNRMU5CeEdyZXEzSlJoa3Vy?=
 =?utf-8?B?WmFuOFdnMll5SnpWUnp3V2tyVC84d2IzOFRldHhnaVF3L2orVTVVVWV0bWEz?=
 =?utf-8?B?Yk92VDA3STUzbHVqS0hOQ1pVL3pDWHJBUGJNcTVzYXh5UjIzUVV1Q3NsQmNj?=
 =?utf-8?B?c2xpS2VEcWhJTE5oL054dzc3SFRuZDFTSXIvbFV2SUZXRDFVOFNQcWpNSkFw?=
 =?utf-8?B?T3FkcGF6YS80N2k5WkRyeHRpU1FYSkhNaklqT216ZHoxTTNINFhRMDlrUmMx?=
 =?utf-8?B?cmU0R3VtVlZGU1BVWTFLMDlGUkdCSkllVk1wanlmcW9UZC9GcXg0UUhKeTlD?=
 =?utf-8?B?MG55dTJZSEJhWE5Rb3ZEQ2JLZFc1alVrY1B0dEhIaVlXUkhiRitBYjA2ekJZ?=
 =?utf-8?B?V1NKakFkWmFQbTQ4Uk9mK1AySjZNNWFIaGtEbFJBYmxTWVpjOVdkT09TZlpP?=
 =?utf-8?B?MTZxYlI5ME85M0FGK2YwYVlZNVJOWmpzNW1NWG15TEtSSGUvZWlFYWJ1cGxw?=
 =?utf-8?B?Smt3T25NK2ZmUHpFR2M1elJJYzJWdXA3cElhUnQrYlA0TTMvL2JHeWt0TC9T?=
 =?utf-8?Q?u7tvbgz8RLWO3dywdekruGi6Z0atRHMPOLm/9knXmKTl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3131bc1-dc99-4635-5d04-08ddc4f3d7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 05:36:13.1700 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ARrn09G1KbO52JTN/zeIzCaFijjOyTCB0eNZGgJ/C5LdP5Pf9id7ULeQXhLsr9kdk+g8Gz1UifqUJrPI9+JPcLzmnbAGyrlbhSZO1HtqVfU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTUxNjQyLy0g
UmUtcmVwb3J0ZWQuDQppOTE1LkNJLkZVTEwgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2
YWxpLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8
aTkxNS1jaS1pbmZyYS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IFBldGVyIFNlbm5hIFRzY2h1ZGluDQpTZW50OiAxNyBKdWx5IDIwMjUgMDE6NTENClRvOiBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNClN1YmplY3Q6IFJlOiDinJcgaTkxNS5DSS5GdWxsOiBmYWlsdXJlIGZvciBBZGQgcG9z
dC1rbW9kLXVuYmluZCBpZ3RfaG9vaw0KDQpEZWFyIGk5MTUsDQoNCk9uIDcvMTYvMjAyNSA2OjUw
IFBNLCBQYXRjaHdvcmsgd3JvdGU6DQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJp
ZXM6IEFkZCBwb3N0LWttb2QtdW5iaW5kIGlndF9ob29rDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTE2NDIvDQo+IFN0YXRlIDogZmFpbHVyZQ0K
PiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kgQnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1Rf
ODQ2MF9mdWxsIC0+IElHVFBXXzEzNDc0X2Z1bGwgDQo+ID09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0K
PiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21p
bmcgd2l0aCBJR1RQV18xMzQ3NF9mdWxsIGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiAgIHZlcmlm
aWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdl
cyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGludHJvZHVjZWQgaW4g
SUdUUFdfMTM0NzRfZnVsbCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLWlu
ZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRvIGRvY3VtZW50
IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVz
IGluIENJLg0KPiANCj4gICBFeHRlcm5hbCBVUkw6IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4w
MS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzNDc0L2luZGV4Lmh0bWwNCj4gDQo+IFBhcnRpY2lw
YXRpbmcgaG9zdHMgKDEyIC0+IDExKQ0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gDQo+ICAgTWlzc2luZyAgICAoMSk6IHNoYXJkLWdsazEwIA0KPiANCj4gUG9zc2libGUgbmV3
IGlzc3Vlcw0KPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJlIHRoZSB1bmtu
b3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4gSUdUUFdfMTM0NzRf
ZnVsbDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVn
cmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfZmxpcEBwbGFpbi1mbGlwLWZiLXJlY3Jl
YXRlOg0KPiAgICAgLSBzaGFyZC1ya2w6ICAgICAgICAgIFtQQVNTXVsxXSAtPiBbRkFJTF1bMl0N
Cj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVF84
NDYwL3NoYXJkLXJrbC04L2lndEBrbXNfZmxpcEBwbGFpbi1mbGlwLWZiLXJlY3JlYXRlLmh0bWwN
Cj4gICAgWzJdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RQV18xMzQ3NC9zaGFyZC1ya2wtMi9pZ3RAaw0KPiBtc19mbGlwQHBsYWluLWZsaXAtZmItcmVj
cmVhdGUuaHRtbA0KPiANCj4gICAqIGlndEBrbXNfZmxpcEBwbGFpbi1mbGlwLWZiLXJlY3JlYXRl
QGEtaGRtaS1hMToNCj4gICAgIC0gc2hhcmQtcmtsOiAgICAgICAgICBOT1RSVU4gLT4gW0ZBSUxd
WzNdDQo+ICAgIFszXTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUUFdfMTM0NzQvc2hhcmQtcmtsLTIvaWd0QGsNCj4gbXNfZmxpcEBwbGFpbi1mbGlwLWZi
LXJlY3JlYXRlQGEtaGRtaS1hMS5odG1sDQo+IA0KDQpVbnJhbHRlZCwgcGxlYXNlIGZpeCBhbmQg
cmVydW4uDQoNClRoYW5rIHlvdSENCg==
