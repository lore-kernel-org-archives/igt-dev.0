Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24493D5A6FD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 08:34:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8C810E7EB;
	Tue, 26 Nov 2024 08:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bqq6jcLL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EEE10E7EB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 08:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732610080; x=1764146080;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dktLXdlxchbjOHWPp7P4PugVWg1oSWtozR5krrMa6zU=;
 b=Bqq6jcLLnR/QA/5H0Bl5LHjN6R2R3jxRVopB4m6+xPrEVSwqFznQwWDH
 zcfy+2C5gpKBVULVEQuKG0l0tWrPIoUpRFSUu+UDxoQc8koRpyFsJ07TC
 1pyxeOtJjS9juaC7t1kwV7ifIjEi98+TCVBtGRIpnUrWc1xyBI0wRb589
 0v0IE1LVWyGwQ9y5FPgdgXvR8vJ19cK6qOyBnrxUKrTIBdgwsvRZ5KXFS
 Ff3ZPrlAlTlJBp4LdY1lneZQLCwzGLjCIHC6vIK+Fi5MmpZprQPA1TuCs
 VXFc4Dgdia8rtKQfxDDeYAd53TtkFTl58AyzCArX/pO/TLralySOfzML4 w==;
X-CSE-ConnectionGUID: dlKT1M/mQOayFgsjy3IQZg==
X-CSE-MsgGUID: 7epyqoEvQ6yUxW6TDIAP+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="58162766"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="58162766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 00:34:39 -0800
X-CSE-ConnectionGUID: AJqfqRt7RDGtUh4pXtm1Kw==
X-CSE-MsgGUID: 2o/99zi1SV+S0iUPt/AoUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91714680"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2024 00:34:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 26 Nov 2024 00:34:39 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 26 Nov 2024 00:34:39 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 26 Nov 2024 00:34:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPm39l3EnhSzed8QS9dtPbRSiZxOGHzGwxCugnKJeN0WIufJEaND1tjXYBWDn25a5/0ieGopTMNg472PY/AFL6wHhjEQGPRbSPRYRIl/uj+MTRryodirtB16RdijVWRpzvbOymNFF9tR4DskyC0pVraTBaSetj9BtgJgn3gKrFxfULVieADzAJQ8JcBjinxRR/ylNZG1jFpeii1ds4ts1h5z9Mfl4RHpbMUVPNvUXtS/h/hDCH/u4Fynjei9eol9G0d6hQe21bKKDijVfiUaZoQ7fMyrtBTbOarlX/5ivwSjmd/Csm4rSUkKso8vyvZDXL6u5f9+zhkw2NYcrsQ+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dktLXdlxchbjOHWPp7P4PugVWg1oSWtozR5krrMa6zU=;
 b=ezUTPhmJn2Rd/T3EC9lMKaRoj/14203Jtqp45qhGJyXOFnc41kqxAbFUX57I/P2LpDCIG381R3gW2tMne1eS5WG6vhszsd8bV3MEfp7qnmGcqXGpfmYciuXWNCYtnVvI+yigF/t6V3qNSHRYVnesr5xYiHYIGr3Yb0y+ThNNwxK4pScz7yKS0jZ7u7bfEnBTcAvr01kNHHREue/60DtV1lC3K4LRh/2o67GU6Xwg5YHLSY/PGZ5xoMPtQTwMsygoBqwVbX58duX3aNvNqNsXv9RM5X6VZcep0aJZZ9xHG9teCMFG7m9Z9LIiw9bM45XYe3b/kBtZdihV31+n8d8vZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by MW4PR11MB7030.namprd11.prod.outlook.com (2603:10b6:303:22f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Tue, 26 Nov
 2024 08:34:36 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:34:35 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Maslak, 
 Jan" <jan.maslak@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 1/3] lib/xe_query: add hwconfig to xe_device
Thread-Topic: [PATCH 1/3] lib/xe_query: add hwconfig to xe_device
Thread-Index: AQHbO5ulhv5/fvwLikGFfKxGsEbhWrLJRNGA
Date: Tue, 26 Nov 2024 08:34:35 +0000
Message-ID: <be99473afab487a66f1581fa680cc244839fd7f7.camel@intel.com>
References: <20241120222850.1497784-1-jan.maslak@intel.com>
 <20241120222850.1497784-2-jan.maslak@intel.com>
In-Reply-To: <20241120222850.1497784-2-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|MW4PR11MB7030:EE_
x-ms-office365-filtering-correlation-id: 1c2ed23c-f58b-4859-8c19-08dd0df528d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZXZxYW10d0lHcEwzVVZQYko4SHNxclNrbHREWnZMNkQyUlJXbnl6VDdTYkpC?=
 =?utf-8?B?b0pEak9DVjBDNVJ3aE5SelBidkhVZUVia0MrcGJ4SEx4d05JZDllOStCclZh?=
 =?utf-8?B?SDdFVDFKTUphcFhtbGxCYTVxdFVzKzlOb2Nyb0gwVGZ1azVlRnNacG9zNGU5?=
 =?utf-8?B?RFJpQ3lWME9oZ0NaWUZDSW9wWmlZdkpFTWFPY29kVG9rWHUvNTBjZHVSRXRn?=
 =?utf-8?B?bm5mdTl6NUdYaHdJNnoyMmFJK3ROWEJ5WXdYZENxakMrdWw5U1ptSTZzaEdI?=
 =?utf-8?B?a3kvN0RubUJGeXh0ZnFGMityOGFpUTZScHpQZDdSR2k0M0d3QVZyKzVPdnNO?=
 =?utf-8?B?ZkRjYXhoZlpmczV1YURYTjYzcFhIYXlqQ2JGWjJDdWZRVUNoclhSZE1ucSt1?=
 =?utf-8?B?cm82NWlRRVk5OGhZQlkwYzZOTmFCdTIrS0h6eHZndFFMU3doZEM1M243eXMy?=
 =?utf-8?B?Y0ZMNEdyVHpXb0dOdkdTVUJ3T1hDa3E0ZW5sZ3Q4bHBoREgzQ091NisyWHZu?=
 =?utf-8?B?UXd4SjZ3dW9CcW1mZ3JpaU5BSythV0toTHB1clhKNDBPcDFIWHF3K3k4VXU4?=
 =?utf-8?B?MGVTekVhLyt5MG9MOVpaZW1aMVpTZTA2bTdOVFNRRUhmMndPczB3eXJZOGh2?=
 =?utf-8?B?WDFDbmNnMHJIaW5ieFRuMEpkRlluZzNXejNHc0VnV0NPME5wYUZHM1JmZWZl?=
 =?utf-8?B?amsvbE5hT2F3RFg2MVdEcWN6R01sSk5OdmdZRlJHTU5aNm1Id1NPQVhCdUhr?=
 =?utf-8?B?OHZMdWlDcFBqNUE1cVdQeHFGdzMyK3R5Zlp3VmRuSFhqUnlNNVNkTFQ1L2dF?=
 =?utf-8?B?d0hraTU3ZE9RY2FoRDJRaDhKQy9HMW50N0dUaWlzRksyaTlBMzRLQjlxZDhH?=
 =?utf-8?B?ZEVoclZ5MThXK1VBRlp2UnBoYlBTWDlwQ3BvcTc3NDhmTEZyalFjWUg3WHg0?=
 =?utf-8?B?WjFNMVdRMFU4TlRZMWZuL0hKaE5SZ1lRVHZXSkdNYlFCcVZBSVIwQ3pJSW02?=
 =?utf-8?B?Q0srVWYvOVJITmRCcngvRWVTRFpoWVVXUytpY2JkMEJWbytDRWQ5RmZGMG52?=
 =?utf-8?B?N0h3SDZiUG9LeFVEMTB3OVE4aWJzWG53SmlPSmVjNjJrRTZodzB2RHBaN0J0?=
 =?utf-8?B?TElWbm9DTWpSYXBCV2U1clNMTGJFVEZwcFV4WmErNFMvVno1eUlJcFl3TmN5?=
 =?utf-8?B?U1NkRktIRER2SVdXdlZOY1JVNEx2TGRkOXpzTUJ3VjZzcGdqQmpUcEZOOFV2?=
 =?utf-8?B?bUJzSWpkb3ZaQi91bG4wSXR0OWhadFdXaDNkem5VSVlNOXQyaHk4T2loY28y?=
 =?utf-8?B?N29xVngwRVdJdnAzWFR2TzJMV0dQQzc1Lzl5UCtiQzgybDRXRzRlcXhjUG1w?=
 =?utf-8?B?MG51WVJ6bUhzZXloK1ZVdmtqRk9lOTBHSlYvQnNtOHdrOXVuNDQwcEhGZFpE?=
 =?utf-8?B?akp1YVEzNjg5UDRVQ3FYVnNuWWZjRjg5SUhwQ1U3cVJGWnlxUG1tbW9xV2ZM?=
 =?utf-8?B?QTFoeG9YdUFJeGhlWDFPZlVoa2M1QXVJNXJDNVhJclh1Sm43TEtOTU5hV3U3?=
 =?utf-8?B?b2Zoemp0ZmZhNUl3NVVrb011Z0NLQWROUDVqK0FoVE9sR2gzT29mQ3NLajg0?=
 =?utf-8?B?TXZ0eDI4UFQxN3Z1elVHdEFmZHoxMFJwK1lhT09zQjhleURrY0RxZzZPREda?=
 =?utf-8?B?SjlQOGd3dFpLTnZlS0hTcDZiTmp0bkJhbnozMkhyWkVDOHkwQjFlS3VBOEZj?=
 =?utf-8?B?R1dmS0JUN1BKNG8xL25pZGZsa2RrR1hKTC9FbHNEdjlmMkV5TFAybzZzU0NK?=
 =?utf-8?B?YTBDVnppRlpUcm9seUV4c2tCVCtPUHdHY253MXY5dG1aZm5UYzhTYmQ1bmtO?=
 =?utf-8?B?clRCeXAzeFRrSFBRMGFERHhaSVpSNG0waTdpT0lDdjE2NGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFZ3cnRmbmxEeGVTcnhDMTlZcHMremN1M3ZEUXFobjhHejNybnFid3RwL0Q3?=
 =?utf-8?B?Vit2VU5jV29CTkZHZ1Q0TGlocWs3YUdYR2l3V2pESDUwdjJNUlpnQTE2bmxa?=
 =?utf-8?B?b0NCNnBQYTZGbVFuaC95WlBMeERGcG9tVGxhdW1vVERqcDBSN2twbmFrM1li?=
 =?utf-8?B?RkdpWFVVdmRneUU0MUZXK0lqbzkwaU5xU0xuWEZXMWxTMXNkd3ZDaDJ6UUJR?=
 =?utf-8?B?bFFGdmM2OEhZVlhDdzRhbEFhNlZzY3hpVFkyajRoZVlNdzVKVi9jU0tvZmJn?=
 =?utf-8?B?c1lhdHhvUG1weWw2UzFSWWN5ZmlveUVRWVhGcGM4N1BtOGlJU3F3UktOYUh1?=
 =?utf-8?B?Q2JQSEVhVUEvN01iRjJTU2JJUFlzOXRuQVQvS3VidHgrN09paHAxZFNVSlJJ?=
 =?utf-8?B?Nkk0dDFFeS91cGx0c1NRQ2dXcjJ0QmovaHpyWUkwYW5rRjJoTmR4TzMrOFA3?=
 =?utf-8?B?OVFkWXBNYk9QVWdidExjdXVvOUFyN3kvcUpJY1ZjYnpXZzJRODc2MWtvY2h0?=
 =?utf-8?B?WUo4d21CS1BOV0hBZnhTdFloWGdOazFlUUx2Mm9jNHdGS1RmejhjaVU0WFMz?=
 =?utf-8?B?a3BSTWs4dnA3ZmtLWVlTbEhQNE9lTGxhWTluWERuWEZNeGZOaFd6eGI0UVFV?=
 =?utf-8?B?aTlYUGxPUU56UkJQejlEZFdSU2l4dTlTaDFWTkt6alJuZWpGb2h4aU9XTFpP?=
 =?utf-8?B?OGxIUXRwYjM1ZTIrRjRGZFBwVEwwZzVUUnpHc0dDZE9pczk1MXlwdzNHdDVJ?=
 =?utf-8?B?TzVhQThiT2ZJQS9XWWRPK0RlWFhicHhaWGEwTGVKcUh2OVJpQXZHRFhTelpk?=
 =?utf-8?B?ZTZtcEY2SE1DWnV2MHpiU2FrSlR1ZytvSEZjT05UV2JPOXpUNG5SWml0Yk9E?=
 =?utf-8?B?WTVOMXFsMGs0cE9WQ1dRLzlCc2t6TUZXM2lOSkEwTWtkdVRBekwzVGUvbThG?=
 =?utf-8?B?eTVxdXVDaTVvWkwxMW1OTUFWWXZEcjdLZHgxckU5VkFvRHVHMVVCUXZEVlRM?=
 =?utf-8?B?c1VuS05YMWJWcWxjQkVpRW1JMkt3RU0xblVGT2NmWEpVWG1yWjFFMjdvRU9C?=
 =?utf-8?B?ckF4WU5vT0lWbHoxQkRkdkljRGdNNHphUGYwZGJKUDAxV2h2Z0NlNDcwQzZZ?=
 =?utf-8?B?RFBqSmNqNWoyY09mbk5jTDE5UVpSUFFuZUwyMWkrcjBERG9pM2twWVcraGRw?=
 =?utf-8?B?TTZYSEcxbGJnY1c1cTlKYVBHdlZtMFlFdmNyQWJmdjlPaG5ZaEpNaXo3VEFP?=
 =?utf-8?B?bWJHUGs1cml3bitxRVBQK0EvNHdESjJnSFRnMzZxNTlZT3NZTlNnK3NSZXFC?=
 =?utf-8?B?dnRwS0Nsbk9sVGUrRWkrNEhiL3lMRjl5Und5alE5NmpFMkRxSzdGZzJ1YnZP?=
 =?utf-8?B?bDNTWWVSZGprdVpSTVdEVVVCYy9WWGczdS96dHBuYW11Y1Z4VEVwT0tyaEx3?=
 =?utf-8?B?TDhjdnhsUWpQek1WYW1ZL1VGSWJXbDd2alhjZXdjNmZmVUdqSlJGdHl1S3VR?=
 =?utf-8?B?dWo0OTQyZXhyWlpWS0R3blg5Umx4bmp4M0FNcXhUeXFxaDE5Z0VDOUdaaGhy?=
 =?utf-8?B?ekJGYXBpN25maFgzdGV3TVdJNXB4NGM0TWNyMXpmWTlIQmplSGJNNVpWTVVC?=
 =?utf-8?B?RktzcnZSeHljVlM1ZGpDTnFJU1Y3SHBWTGFRblpZZjFmdCtpdVpVamx4K1BD?=
 =?utf-8?B?L2VVT3UxQUdzQU0ra2Y5bkpWQldkM3VJK2ZXMnNBRGlqaHJMb1haa3dQYWMx?=
 =?utf-8?B?OTJMbnBpUy9OZzdualJaMG05NSt2b1BiV0ZxRVBDdGx4SGtqQVVDYnYxeGJH?=
 =?utf-8?B?OGVpa0xRUVBEb1pZNXBrMHp1TkVxZjY4UFpvWXBONU1ubkI5M3dOKzBwVUV4?=
 =?utf-8?B?elJEWjk5SEJyQUdCNXlpOVJFZ3Nra1JJNDRSckRPNWJxT3hHR0hLUWhDU0pL?=
 =?utf-8?B?bUVBRUh3emFIMXRQU1FxZ2ZhczRRNkl3V0o3aVZQWktUZ2czd1ZGN2pRRTRa?=
 =?utf-8?B?Q2QzSUlGN05GT2pZTGNJaXRrQTh1OHFlWFdJYmpwUmlRTDYrWHVKUXlJdEdS?=
 =?utf-8?B?b0hhUE93NHFNZWZoVjUrdlFKZ1ArMXRTRzdIdzVodzJvcGJaWG51ekFFWUln?=
 =?utf-8?B?WDNVcFVMbFlSdTlIK29iWDNGL1RoRGJxNSsyWXZoWXFINXNhTEtTYnFYd0o0?=
 =?utf-8?Q?Z7bZb5DRwKAvSrCK9Eyssfg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2936F89C73BC674E8E7C9B1F6386AFB0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c2ed23c-f58b-4859-8c19-08dd0df528d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 08:34:35.9007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JLEkO8aa19YbFufl2DM4uFapp5FJBg6LCZ/v1LPcMg+0Ps0xqwJt3b06n2uVT8Co+JceJH/PWmn7pe8S2eejcIdgyju35aqw2vbl0WxuM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7030
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

T24gV2VkLCAyMDI0LTExLTIwIGF0IDIyOjI4ICswMDAwLCBKYW4gTWFzbGFrIHdyb3RlOg0KPiBB
ZGQgaHdjb25maWcgYW5kIGh3Y29uZmlnX3NpemUgdG8geGVfZGV2aWNlLCBzbyB0aGF0IGl0IGNh
biBiZSBhY2Nlc3NlZA0KPiBlYXNpZXIgYnkgdGhlIHRlc3RzLg0KPiBUaGFua3MgdG8gdGhpcywg
aHdjb25maWcgZGF0YSB3aWxsIG9ubHkgYmUgcXVlcmllZCBvbmNlIGFuZCBjYWNoZWQuDQo+IA0K
PiBTaWduZWQtb2ZmLWJ5OiBKYW4gTWFzbGFrIDxqYW4ubWFzbGFrQGludGVsLmNvbT4NCj4gLS0t
DQo+ICBsaWIveGUveGVfcXVlcnkuYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gIGxpYi94ZS94ZV9xdWVyeS5oIHwgIDYgKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM0
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xp
Yi94ZS94ZV9xdWVyeS5jDQo+IGluZGV4IDBjOWNmZjA2Ni4uNDliZWQwMzNiIDEwMDY0NA0KPiAt
LS0gYS9saWIveGUveGVfcXVlcnkuYw0KPiArKysgYi9saWIveGUveGVfcXVlcnkuYw0KPiBAQCAt
MzksNiArMzksMzIgQEAgc3RhdGljIHN0cnVjdCBkcm1feGVfcXVlcnlfY29uZmlnICp4ZV9xdWVy
eV9jb25maWdfbmV3KGludCBmZCkNCj4gIAlyZXR1cm4gY29uZmlnOw0KPiAgfQ0KPiAgDQo+ICtz
dGF0aWMgdWludDMyX3QgKnhlX3F1ZXJ5X2h3Y29uZmlnX25ldyhpbnQgZmQsIHVpbnQzMl90ICpo
d2NvbmZpZ19zaXplKQ0KPiArew0KPiArCXVpbnQzMl90ICpod2NvbmZpZzsNCj4gKwlzdHJ1Y3Qg
ZHJtX3hlX2RldmljZV9xdWVyeSBxdWVyeSA9IHsNCj4gKwkJLmV4dGVuc2lvbnMgPSAwLA0KPiAr
CQkucXVlcnkgPSBEUk1fWEVfREVWSUNFX1FVRVJZX0hXQ09ORklHLA0KPiArCQkuc2l6ZSA9IDAs
DQo+ICsJCS5kYXRhID0gMCwNCj4gKwl9Ow0KPiArDQo+ICsJLyogUGVyZm9ybSB0aGUgaW5pdGlh
bCBxdWVyeSB0byBnZXQgdGhlIHNpemUgKi8NCj4gKwlpZ3RfYXNzZXJ0X2VxKGlndF9pb2N0bChm
ZCwgRFJNX0lPQ1RMX1hFX0RFVklDRV9RVUVSWSwgJnF1ZXJ5KSwgMCk7DQo+ICsJaWd0X2Fzc2Vy
dF9uZXEocXVlcnkuc2l6ZSwgMCk7DQo+ICsNCj4gKwlod2NvbmZpZyA9IG1hbGxvYyhxdWVyeS5z
aXplKTsNCj4gKwlpZ3RfYXNzZXJ0KGh3Y29uZmlnKTsNCj4gKw0KPiArCXF1ZXJ5LmRhdGEgPSB0
b191c2VyX3BvaW50ZXIoaHdjb25maWcpOw0KPiArDQo+ICsJLyogUGVyZm9ybSB0aGUgcXVlcnkg
dG8gZ2V0IHRoZSBhY3R1YWwgZGF0YSAqLw0KPiArCWlndF9hc3NlcnRfZXEoaWd0X2lvY3RsKGZk
LCBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZLCAmcXVlcnkpLCAwKTsNCj4gKw0KPiArCSpod2Nv
bmZpZ19zaXplID0gcXVlcnkuc2l6ZTsNCj4gKwlyZXR1cm4gaHdjb25maWc7DQo+ICt9DQo+ICsN
Cj4gIHN0YXRpYyBzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0X2xpc3QgKnhlX3F1ZXJ5X2d0X2xpc3Rf
bmV3KGludCBmZCkNCj4gIHsNCj4gIAlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X2d0X2xpc3QgKmd0X2xp
c3Q7DQo+IEBAIC0yMzksNiArMjY1LDcgQEAgc3RhdGljIHN0cnVjdCB4ZV9kZXZpY2UgKmZpbmRf
aW5fY2FjaGUoaW50IGZkKQ0KPiAgc3RhdGljIHZvaWQgeGVfZGV2aWNlX2ZyZWUoc3RydWN0IHhl
X2RldmljZSAqeGVfZGV2KQ0KPiAgew0KPiAgCWZyZWUoeGVfZGV2LT5jb25maWcpOw0KPiArCWZy
ZWUoeGVfZGV2LT5od2NvbmZpZyk7DQo+ICAJZnJlZSh4ZV9kZXYtPmd0X2xpc3QpOw0KPiAgCWZy
ZWUoeGVfZGV2LT5lbmdpbmVzKTsNCj4gIAlmcmVlKHhlX2Rldi0+bWVtX3JlZ2lvbnMpOw0KPiBA
QCAtMjY4LDYgKzI5NSw3IEBAIHN0cnVjdCB4ZV9kZXZpY2UgKnhlX2RldmljZV9nZXQoaW50IGZk
KQ0KPiAgDQo+ICAJeGVfZGV2LT5mZCA9IGZkOw0KPiAgCXhlX2Rldi0+Y29uZmlnID0geGVfcXVl
cnlfY29uZmlnX25ldyhmZCk7DQo+ICsJeGVfZGV2LT5od2NvbmZpZyA9IHhlX3F1ZXJ5X2h3Y29u
ZmlnX25ldyhmZCwgJnhlX2Rldi0+aHdjb25maWdfc2l6ZSk7DQo+ICAJeGVfZGV2LT52YV9iaXRz
ID0geGVfZGV2LT5jb25maWctPmluZm9bRFJNX1hFX1FVRVJZX0NPTkZJR19WQV9CSVRTXTsNCj4g
IAl4ZV9kZXYtPmRldl9pZCA9IHhlX2Rldi0+Y29uZmlnLT5pbmZvW0RSTV9YRV9RVUVSWV9DT05G
SUdfUkVWX0FORF9ERVZJQ0VfSURdICYgMHhmZmZmOw0KPiAgCXhlX2Rldi0+Z3RfbGlzdCA9IHhl
X3F1ZXJ5X2d0X2xpc3RfbmV3KGZkKTsNCj4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9xdWVyeS5o
IGIvbGliL3hlL3hlX3F1ZXJ5LmgNCj4gaW5kZXggY2FiYjgwNzhjLi5mODgzNjU3OGUgMTAwNjQ0
DQo+IC0tLSBhL2xpYi94ZS94ZV9xdWVyeS5oDQo+ICsrKyBiL2xpYi94ZS94ZV9xdWVyeS5oDQo+
IEBAIC0yNiw2ICsyNiwxMiBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsNCj4gIAkvKiogQGNvbmZpZzog
eGUgY29uZmlndXJhdGlvbiAqLw0KPiAgCXN0cnVjdCBkcm1feGVfcXVlcnlfY29uZmlnICpjb25m
aWc7DQo+ICANCj4gKwkvKiogQGh3Y29uZmlnOiB4ZSBod2NvbmZpZyB0YWJsZSBkYXRhICovDQo+
ICsJdWludDMyX3QgKmh3Y29uZmlnOw0KPiArDQo+ICsJLyoqIEBod2NvbmZpZ19zaXplOiBzaXpl
IG9mIGh3Y29uZmlnIGluIGJ5dGVzICovDQo+ICsJdWludDMyX3QgaHdjb25maWdfc2l6ZTsNCj4g
Kw0KPiAgCS8qKiBAZ3RfbGlzdDogZ3QgaW5mbyAqLw0KPiAgCXN0cnVjdCBkcm1feGVfcXVlcnlf
Z3RfbGlzdCAqZ3RfbGlzdDsNCj4gDQpUaGlzIHBhdGNoIG1hdGNoZXMgdGhlIGNvbnZlbnRpb24g
d2UgYWxyZWFkeSBoYXZlIGluIHhlIGFuZCBJIGRpZCBub3Qgc3BvdCBhbnl0aGluZyBzdXNwaWNp
b3VzLg0KSXQgaXM6DQoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+DQo=
