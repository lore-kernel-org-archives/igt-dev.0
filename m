Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05A32E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 17:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B599010E764;
	Thu,  2 Jan 2025 17:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRkiPtHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CB710E764
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jan 2025 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735840793; x=1767376793;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nR8L+Tdl6BGDsG2mlKxOKrNtD/vMy8bks37KclbjSLo=;
 b=XRkiPtHl9Du6Ui7GmgUdcVhg+BSiwctLaEWCrQxxVCmXZCgjjaSogiYp
 ei7OdWJ8dqsqK8pS9OB5Y5EzrDP0Q0n5tsv6ERV7s96UZoDn3hhaFB0g/
 9Xvxw/5in5xiynaPCRPWzzcnkQRzqPLI4aR2zzAJF+zZ1uUBfNBfBGahK
 krmatDm9LW9txJqpM7vMQ6XuC5nFNYjf2LFhGC4ZQoI6bUbpAZnYARVA9
 EyH+Osc3BpqBHzfN8S6do5wcIfVJSucA4Eos6UdkcOYLZnEpvWyZhq8jX
 l4OtAH95wL5FdoVdysQ/pBrn3Jmeo7WlwgPsRTUrhIAIqwAbfqbXjWb8s A==;
X-CSE-ConnectionGUID: EQIU9RTZTzejdSYkWyivHA==
X-CSE-MsgGUID: Nt+6xITwTSq7z4vbLJ34sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36107837"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36107837"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2025 09:59:53 -0800
X-CSE-ConnectionGUID: OnVyg1myTwufuabe38uKKg==
X-CSE-MsgGUID: U66M8hY9TRe/YuX+zzENuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="106547917"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Jan 2025 09:59:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 2 Jan 2025 09:59:52 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 2 Jan 2025 09:59:52 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 2 Jan 2025 09:59:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MY8qUi81vWKkIz8yqlVibbpdUkFDJwjZ1o4gxK+VIIj+/SsQpVwcK1IkQq6ZfhvxM1X8WVIsmDgXu3VRvVXDES165/47bzD+i9seTjcA3q9G8/jnCdvErwew3QpDt3iDaXhi7YgLgxDHw7dVWBmXnxCA8mtVv2mlUSX/LkLV7G6zu8iqfvpBh+Fk8xATkr5HncSJHAMLw59PIVtFxyttJE8YWEFbIAJvcWKP7MTqPFwgGeMdqXp6PlAPpnmM76YEadQsyP28o6j33VHTOOiykEb62PVa5h8iXgcHNGawlbALnM541ltE9pG3qyiKHeYnHKv2cETp2iDRNeU7tq3ARg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nR8L+Tdl6BGDsG2mlKxOKrNtD/vMy8bks37KclbjSLo=;
 b=phqtnqFcPSsjVUxjwBx1SP+IKQ9AYvF2WdLudYfJgrX4p4rFXyb8W0Sa7kzy1uahwhFkvOnRkQAvqpP2l9W+uB8c+AIWIgoV+5hpnXzIMrhSOPFZ1Q+L/xZlvG7MVSHBVA5YQcw4SX+RyhHLAzcZXtNbYjxJ9IFjLs1fpj1W65QluXUwIWCneJmYmmPP1DcBmxM5eSuSOJksWMFdnG7E5nZmUGtqeZsUPuIEnE9SO+8r86DuuECJ85q78/ds0OyiwId1jCgNGmisOaDT/FPYEqbslxIWUtFKMruR/hLNNuiji+azk2ch7Ag08r46KDa0pLrru+rveBA/dmbcjm+zEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7998.namprd11.prod.outlook.com (2603:10b6:8:126::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Thu, 2 Jan
 2025 17:59:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.013; Thu, 2 Jan 2025
 17:59:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?B?eGVfZHJtX2ZkaW5mbzogRG8gbm90IGVuZCBOVUxMIHhlX2Nvcms=?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC94ZV9k?=
 =?utf-8?B?cm1fZmRpbmZvOiBEbyBub3QgZW5kIE5VTEwgeGVfY29yaw==?=
Thread-Index: AQHbXTnzY0CDoL4omEmJiDV2lWeR97MDxYhA
Date: Thu, 2 Jan 2025 17:59:46 +0000
Message-ID: <CH0PR11MB54448AC7FDD3B32AD1A6C08CE5142@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250102162540.81162-1-jonathan.cavitt@intel.com>
 <173583811259.2099751.3817956842785045081@b555e5b46a47>
In-Reply-To: <173583811259.2099751.3817956842785045081@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7998:EE_
x-ms-office365-filtering-correlation-id: d7e97a03-f115-4c9f-c7ce-08dd2b573e31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?OUhEUENBQ0JkREF2cWhhYit1NjJMUkhPMms0OFV4ejhaRWlhYmNHaXZIcUFV?=
 =?utf-8?B?UGk4R2Ewa2U5S2srY3p5SEp4K243VmdMV2xkRlV0QVVVeXFGZndHSDYxR1RN?=
 =?utf-8?B?dDRENHhwL1ZKRFhDOTUwejZHaDBkaUJIWXZIM0ZaaHh3SGNBcmdVajRaQ1V0?=
 =?utf-8?B?N2ZMaTMrY2k5anlXbFoyd0xhWHl4Y3BJRUM1d1cvTS9uWHEzSjY4Mk5wRTY4?=
 =?utf-8?B?V2NobllIY0JNVGJseWtYblQzZFk2L0ZXTE9FT3EzQW9HWXMzL3lWNlJPWkRl?=
 =?utf-8?B?Y0tjTTFObFo1MGRjWDlKbUt2MTZaNGd5UUgwRjFkTmltSjFWcEN1M0VBM0RS?=
 =?utf-8?B?V1lhck5Dd2FlSjFTdHoyaDFlbkZQcG9qQkZoN0ttZjNCeno1dnJiQngvV2J1?=
 =?utf-8?B?OWc1SzZLRTl0OXVHSnRGQkpZMjZFOUh3N0d6MWtWcUhaN0NLNFFOZmhRa0V5?=
 =?utf-8?B?S2NZQXpRb1JHZnFyN2EzTWpkVmwvZFA3VjRzTEcwcEk1Yzd1Z1FTRUNlRjNr?=
 =?utf-8?B?OHZOU0ZUUkVjZk0rQ09FSitGeDF3SUZBS1VrT0tMK3Zvd1NXclRVemYrU1lj?=
 =?utf-8?B?bW9SblVpRzM3Uk9rTlIzeWFCTVNNUnprTFJyMEVKaEhweUhGVys4MUtyRHdG?=
 =?utf-8?B?RXVMcHZIekdQbDAzcHI2TzN4QXY3d1VTd1ZBaS9OSHFFM2JqOFBUems2M3h3?=
 =?utf-8?B?ampTdzUzS0FkdVREV3VMU0dtZmhPUExMdU1GVnFzOGtCSzlPSWxEdTYwVDEr?=
 =?utf-8?B?WEU2QmFPTUpVL3UyREc3VGtlenYzL2Nva2hGV1MycUsreG4rN3d2ZXdsRGVJ?=
 =?utf-8?B?anRReHcwblJuRFNYNml5eDFsNEU4dHhFNUtXMENnRUxqeUNKTFI3Z2h3eDRO?=
 =?utf-8?B?a1EyS3U0UXlVbUE3NjkwVllMajhGRFVzTFBWdzkxWWQ2V1g3MVpGaGw0L3Nz?=
 =?utf-8?B?NW5XMWgxVDR3WlZiSFYzc2JGRkdlbDZ2dmN4a2F2M1ArVmpUaEdYUkh5V2tk?=
 =?utf-8?B?WXJOOWpLZkp6WjFBQXJTTC91WUdOQTU2RitCMUREajlpVFRWMGc4ZDlGM2dk?=
 =?utf-8?B?YXp4Rk9La2c2VGp3cHBPRlNRVHAxd0hiN2FBcUc4WEJIL3JvOWtYTzZXVUpC?=
 =?utf-8?B?K1RDR3VRdW9MVHNCazNNSzlJelJ0YzlzWUlYbUJhMkUxa1pyTWozbnk1bGlD?=
 =?utf-8?B?WG9HeEVaaGRsUGw1UllFdEVTVCtEM1FlQVNSQ0VRLzl0QXRTTXl2SnhyQ3l0?=
 =?utf-8?B?QkpObldya3MwRjFPUkd3S1gxSzhJMXUzNVFvN3JCSVNOcVprWGlPN1VKdTBk?=
 =?utf-8?B?SVN5VGtLdzR2VUhZbnBRd010SGgzL0I0NWh4MHNHK2JWTEgxbzgwejNySS9x?=
 =?utf-8?B?OUptR3gxdjBETk0xc09OYnd5cGdRRThBN0dHR0NsYmxjbDQwc25WMTA2WDNm?=
 =?utf-8?B?TjR2MTZpZ01EWmo2eFpjdENobXpETTVOZHpzSGMwdjRQRzFnYThoemU4OVR5?=
 =?utf-8?B?bjcyYnJ4OEZPclYrenFsOE84UWtlbDlEaHppRlMwT0VXWjE1S1Z5YmM1VUFz?=
 =?utf-8?B?eGVNNkJXU3BENzBlS2R2NUZZRC83QVVBOXlXLzJVM1pzbTBzdThIVWpBUHR4?=
 =?utf-8?B?aCtJOG5MTGlxdkJDWHJLQk91bWZYSFgweitOTDErb1BGeTVuRUl2dFZxWU1x?=
 =?utf-8?B?R3pFd3N0MzlCaUwwZGV3aDA5eEZISnVtZGYrdVJ4QUYyYW1VN1VTdFp3TXVP?=
 =?utf-8?B?dzNqNzNFRnRqclNqR1hZbVVpTXlBajNRTE1FLzFTWjY0Unp6ek4xQ1VxK0Zj?=
 =?utf-8?B?OURHNXgyb3dsa3FqZ3lGaVBFcGxjNlBNU0V1UDNPTlpHYUk3ZzhGdURVR3JI?=
 =?utf-8?B?MS9xZTVrYU5hcFd3bzZqZWF1WjNxWEhXUkduNTZoM1k0bEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aVVDVWVLdmV3S2U5VUpFVyt3ZXBVME1ueFNvaWJESkdIMEQzQ3NFUWFaajQv?=
 =?utf-8?B?U1d4R1F5WS9WMG1ONlZQb1RLT3JDMlBabGVFb3FWNnVLZFNSTmFUSDBsS1pu?=
 =?utf-8?B?ZDV2YUR3aXFBYVlUMXN4Ky9JekV6WkRBNkE5NURka2lZT21VV2tWNTZpUGlJ?=
 =?utf-8?B?SG1jY2gyNTlQYnp6WGlZcmhUS09uQzVZSys0aEF3aGxLekNTR2x0WTZYT05T?=
 =?utf-8?B?QkZLelJWbjdVa212c0hkS2F5T3ZMZmlwSUFVMTVaWmpGajVRN0wxWG8weDJz?=
 =?utf-8?B?cHBxbWNYWWk1bjA5VHhMZTJWYnVsY1QzVG9BUHg5SEluNXFRaXV4bk1JbHZ1?=
 =?utf-8?B?MUhZcDB5ODNudE11K0hPQmo3Z0lNb2ppeFdRMVVUcDZXazZ6SmErSUdidUc1?=
 =?utf-8?B?aE9zRG9UOTM4RHRXemVZekVzUHM1UkVUTVdUSHg5U3VlZUZaZUl3OE9xRDNs?=
 =?utf-8?B?RFlwUDAyOGNMeU1ZYmlNYjBkTXEvd1lVdDlCUk5iNENSZUg1YWJtMkQwQTFE?=
 =?utf-8?B?VjBtVTR6SEdMaWtIcTBoNk9CSjFaTWttVzlhNEhZTlJualRKVVJGcFVDc0py?=
 =?utf-8?B?NVlZY2UwL0NvdnlGMzN1UE5qNTdHRWlGcFUwZE0wcERaRTNPdHllL00wYnpz?=
 =?utf-8?B?Y3kzbGxkVmZ2Y2U5ZCtvK2d3VVBwT1lnNmVIRW8vU3dRZzZpTGRKVU1DbzFI?=
 =?utf-8?B?Vi9aM2RwSi85RHliK241YVloTHViMlF2VE90UmpTMnU5RXVyalRoSHNMZE9N?=
 =?utf-8?B?ZjZqWnBSdGxudEFsZDRXY29WeTNxZU42RkhvODNXVldueWVvb2ZNQk82YW5s?=
 =?utf-8?B?QmFiRk1DT2h0SXJ2VklHbUNMQTZDWStQMXRQczMwdS8ybElNcUJjM1FoZlla?=
 =?utf-8?B?ZDNiQnBZSTVXNnFiazlXU0IrdTI4RW9SM3IyYU53MFdaajBGU0NzcE83RmYz?=
 =?utf-8?B?SHkxUjE0Y3hTdE5IL1UvczdJNWhuVGozSU16V2hMd3ZVNUE1aytjS2dsc0F5?=
 =?utf-8?B?M3NraGtLbFpYSzJWWHE1bVdlOXF0MHE4dHFVZzZ0YmQ2TGhDOENrQTB1U3VV?=
 =?utf-8?B?QVZxR3prbkRERW4wSVh3VUgwVmhsTTJkaHhNaDY0WjFpUjMwSjBKelB0eHg3?=
 =?utf-8?B?cG9hR0RjengxRmlxeTBwU1JDSHV4QnQyVURsU0JVbGZDRWpKWFplcGdwdWJS?=
 =?utf-8?B?c2lZc2NwTllUeVUrQUQ5NXU1UVRBVEFWMG5IVGJZd2cxMUd5L2htbE1RUDRC?=
 =?utf-8?B?NlZaeTk2a3hGSDQyRVN4Q0t1SXhua0wwbmc3OHVtNUZ5V3FDaXdaUGEzdVhp?=
 =?utf-8?B?c25EeDBDK0QvVUtaNWM1QWcrUHI5MGFDSXdXZ3FSYU5MNCt5RnJ3VUk5MzhV?=
 =?utf-8?B?ajBzT255V2VkTmxWWm1sK2xJRW1aL0tUMGFXSW5BKy83VHNXZkhLOGFsbjFD?=
 =?utf-8?B?YXVIVDNrQTJlb0FFLy9PTjFDQlp5aWdGN1FsMEhVUXVyb0VLTkNhRVJmOHgx?=
 =?utf-8?B?OG1PUEJlVWZwTU1xajVaOEVjU0xoc3Y4d1RBNVJVVUlkWXAvWmNPWnBURnZw?=
 =?utf-8?B?ZmtzeWRlbGFTb0pHY3Z1bndqbk5LUW5sMWdXWStjc28rOW82U3k3Nkl0ZkFG?=
 =?utf-8?B?ZnJUbEZmY3IwUjVuNzRBa0x6TG15L2NVNXlWQVZ5a0dyR3VSeHVuRkk3U3hQ?=
 =?utf-8?B?blBWS0RmWFdSVXNMdmRnaVRzVXUyVWlkM1VuNEVhZWZVaENnQ0s1MFRBcCti?=
 =?utf-8?B?NVZlMTB3SjJvb1Bzb1c3b1plR3lBdisvRUF6bko5Unc2cjlFbldSSHRRS2xS?=
 =?utf-8?B?VlEzSkNobWJzWTB3OFVGTUQxVENXekxDQTlBQW9kQnJuNllLK3pERzBtekMr?=
 =?utf-8?B?MmdCd2RsTXlCQkR5eXdSTWYyVEQrSW5xaVpvVGg2Ukk0RlAwc1ZyaTNKTjln?=
 =?utf-8?B?QlNFR1NoTlBjNDQ4OEZ1cE9pSVdaTXUyeU43c0dVRkpoVG9ncEd5a09CZ2hN?=
 =?utf-8?B?cHZBV3BCSEN2YXJhYkV3c2l2eGVnbllmRloxY2k3bW1NNFpXZHNUaHR6cEhw?=
 =?utf-8?B?TXpBRjlEYzJISlNoMHFZbXZOVEFySS9LckUvbEhVeUZnOWp4TUhqRElIQldC?=
 =?utf-8?Q?3UBvFD/OnCCP29TDyUdWWdev6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e97a03-f115-4c9f-c7ce-08dd2b573e31
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2025 17:59:46.1657 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruT1Umxkr3l89FCVi6IA46iV9IHmi81d8wN+4bjm/aeSif/zcRC/M0+NZbw+z5M6tFqo/o+InWqhckojR77C48Oe2VduMhmLwPReFRfs1WE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7998
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBhdGNod29yayA8cGF0Y2h3b3JrQGVt
ZXJpbC5mcmVlZGVza3RvcC5vcmc+IA0KU2VudDogVGh1cnNkYXksIEphbnVhcnkgMiwgMjAyNSA5
OjE1IEFNDQpUbzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4N
CkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDog4pyXIGk5MTUuQ0ku
QkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC94ZV9kcm1fZmRpbmZvOiBEbyBub3QgZW5kIE5V
TEwgeGVfY29yaw0KPiANCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVz
dHMvaW50ZWwveGVfZHJtX2ZkaW5mbzogRG8gbm90IGVuZCBOVUxMIHhlX2NvcmsNCj4gVVJMICAg
OiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MzA2Ni8NCj4gU3Rh
dGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0gY2hh
bmdlcyBmcm9tIElHVF84MTc0IC0+IElHVFBXXzEyMzc3DQo+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0t
LQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBj
b21pbmcgd2l0aCBJR1RQV18xMjM3NyBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmll
ZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMg
aGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElH
VFBXXzEyMzc3LCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBu
ZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0ku
DQo+IA0KPiAgIEV4dGVybmFsIFVSTDogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUv
ZHJtLXRpcC9JR1RQV18xMjM3Ny9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0aW5nIGhvc3Rz
ICg0MCAtPiAzOSkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+IA0KPiAgIE1p
c3NpbmcgICAgKDEpOiBmaS1zbmItMjUyMG0gDQo+IA0KPiBQb3NzaWJsZSBuZXcgaXNzdWVzDQo+
IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdl
cyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQV18xMjM3NzoNCj4gDQo+ICMj
IyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVzc2lvbnMgIyMjIw0K
PiANCj4gICAqIGlndEBrbXNfcG1fcnBtQGJhc2ljLXJ0ZToNCj4gICAgIC0gYmF0LXJwbHMtNDog
ICAgICAgICBbUEFTU11bMV0gLT4gW0RNRVNHLVdBUk5dWzJdDQo+ICAgIFsxXTogaHR0cHM6Ly9p
bnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfODE3NC9iYXQtcnBscy00L2lndEBr
bXNfcG1fcnBtQGJhc2ljLXJ0ZS5odG1sDQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjM3Ny9iYXQtcnBscy00L2lndEBrbXNfcG1fcnBt
QGJhc2ljLXJ0ZS5odG1sDQo+IA0KDQpUaGlzIHRlc3QgaXMgdW5yZWxhdGVkIHRvIHRoZSB0YXJn
ZXQgY2hhbmdlIGFuZCB0aHVzIHRoaXMgaXMgbGlrZWx5IG5vdCBhIHJlZ3Jlc3Npb24uDQotSm9u
YXRoYW4gQ2F2aXR0DQoNCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0tLS0tLQ0KPiAN
Cj4gICBIZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xMjM3NyB0aGF0IGNvbWUg
ZnJvbSBrbm93biBpc3N1ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMj
IElzc3VlcyBoaXQgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfY2hhbWVsaXVtX2VkaWRAaGRtaS1l
ZGlkLXJlYWQ6DQo+ICAgICAtIGJhdC1kZzItMTM6ICAgICAgICAgW1BBU1NdWzNdIC0+IFtETUVT
Ry1XQVJOXVs0XSAoW2k5MTUjMTIyNTNdKQ0KPiAgICBbM106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNp
LjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxNzQvYmF0LWRnMi0xMy9pZ3RAa21zX2NoYW1lbGl1
bV9lZGlkQGhkbWktZWRpZC1yZWFkLmh0bWwNCj4gICAgWzRdOiBodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzc3L2JhdC1kZzItMTMvaWd0QGttc19jaGFt
ZWxpdW1fZWRpZEBoZG1pLWVkaWQtcmVhZC5odG1sDQo+IA0KPiAgICogaWd0QHJ1bm5lckBhYm9y
dGVkOg0KPiAgICAgLSBmaS1wbnYtZDUxMDogICAgICAgIE5PVFJVTiAtPiBbRkFJTF1bNV0gKFtp
OTE1IzEzMzUwXSkNCj4gICAgWzVdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9k
cm0tdGlwL0lHVFBXXzEyMzc3L2ZpLXBudi1kNTEwL2lndEBydW5uZXJAYWJvcnRlZC5odG1sDQo+
IA0KPiAgIA0KPiAjIyMjIFBvc3NpYmxlIGZpeGVzICMjIyMNCj4gDQo+ICAgKiBpZ3RAaTkxNV9z
ZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzOg0KPiAgICAgLSBiYXQtYXJsaC0yOiAgICAgICAgIFtE
TUVTRy1GQUlMXVs2XSAoW2k5MTUjMTMzOTNdKSAtPiBbUEFTU11bN10gKzEgb3RoZXIgdGVzdCBw
YXNzDQo+ICAgIFs2XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RfODE3NC9iYXQtYXJsaC0yL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRt
bA0KPiAgICBbN106IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdU
UFdfMTIzNzcvYmF0LWFybGgtMi9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0
bWwNCj4gICAgIC0gYmF0LW10bHAtNjogICAgICAgICBbRE1FU0ctRkFJTF1bOF0gKFtpOTE1IzEz
MzkzXSkgLT4gW1BBU1NdWzldICsxIG90aGVyIHRlc3QgcGFzcw0KPiAgICBbOF06IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxNzQvYmF0LW10bHAtNi9pZ3RA
aTkxNV9zZWxmdGVzdEBsaXZlQHdvcmthcm91bmRzLmh0bWwNCj4gICAgWzldOiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzc3L2JhdC1tdGxwLTYvaWd0
QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sDQo+IA0KPiAgIA0KPiAgIHtuYW1l
fTogVGhpcyBlbGVtZW50IGlzIHN1cHByZXNzZWQuIFRoaXMgbWVhbnMgaXQgaXMgaWdub3JlZCB3
aGVuIGNvbXB1dGluZw0KPiAgICAgICAgICAgdGhlIHN0YXR1cyBvZiB0aGUgZGlmZmVyZW5jZSAo
U1VDQ0VTUywgV0FSTklORywgb3IgRkFJTFVSRSkuDQo+IA0KPiAgIFtpOTE1IzExOTg5XTogaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMTk4
OQ0KPiAgIFtpOTE1IzEyMjUzXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9p
OTE1L2tlcm5lbC8tL2lzc3Vlcy8xMjI1Mw0KPiAgIFtpOTE1IzEzMzUwXTogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMzM1MA0KPiAgIFtp
OTE1IzEzMzkzXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pOTE1L2tlcm5l
bC8tL2lzc3Vlcy8xMzM5Mw0KPiANCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0t
LQ0KPiANCj4gICAqIENJOiBDSS0yMDE5MDUyOSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF84MTc0
IC0+IElHVFBXXzEyMzc3DQo+ICAgKiBMaW51eDogQ0lfRFJNXzE1ODkyIC0+IENJX0RSTV8xNTg5
Mw0KPiANCj4gICBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gICBDSV9EUk1fMTU4OTI6IDA4YmQ1
OTA5MzVhNTI1OGZmZDc5MzU1YzU5YWRmZmQ3MmZiMmM2NDIgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVk
ZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gICBDSV9EUk1fMTU4OTM6IDU5Yzg0NmMwMGRkYTcy
YWRmMWE2OGJmN2U3NmJkYzU3MDM5MzcxZTMgQCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9y
Zy9nZngtY2kvbGludXgNCj4gICBJR1RQV18xMjM3NzogMTIzNzcNCj4gICBJR1RfODE3NDogZDIw
MDRiMDYyM2RiY2NkMDg1MDI1MjU4NDliNGVlZjg4MWFhMTk5ZSBAIGh0dHBzOi8vZ2l0bGFiLmZy
ZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3MgPT0NCj4g
DQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVFBXXzEyMzc3L2luZGV4Lmh0bWwNCj4gDQo=
