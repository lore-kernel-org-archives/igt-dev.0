Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6BCA0EE4
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 17:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F5810E21A;
	Thu, 14 Aug 2025 17:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dhmZQaDk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741810E21A
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 17:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755193328; x=1786729328;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8/wXxc/avBIFSNicKnok4Fl5tF2bXg3HGBaHxUuy5fo=;
 b=dhmZQaDkP1dit6W7qW9la7lZSdXq271N1A0Ah/n2viTVNev81Zmb8QYN
 Yt/7/1P+fqGo5DlP3SzpSlHG/IPhNiUN3E5XdzHgO+0KqKEjkoIpR/OeC
 KbG7e0vCBVbMJGz76+VLxe5lmPVq1YmUaroPVe9Y5IEImP1m8jolfxkio
 OoLteRsZv6AzRl080jDHH8hDQ8ZB0bMMn85kqddoJlvyTed2mb0i7MhAg
 8hdPLgy/uykWzamuShCMDH+Nx823OTz4EEgIAiyzuYKCEIhzSvyE6GgBR
 6KUnBUDzDxgvhgyo5khGZrlTgbAesaxw5GKslquCgwa+od7wj96Sc9MhT g==;
X-CSE-ConnectionGUID: rqD4nUiVS4KSitJPFILA/g==
X-CSE-MsgGUID: jFAEcznQRhKwBDOCYdxqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68218104"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="68218104"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:42:08 -0700
X-CSE-ConnectionGUID: eDOVXq0nRpSR6eJQ5jtiQA==
X-CSE-MsgGUID: lfpHwnpSS6q3yW8MxFpv2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; d="scan'208";a="167631587"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 10:42:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 10:42:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 14 Aug 2025 10:42:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 14 Aug 2025 10:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/38nOk53oLbnqOm6cP6krkJ9lHiUh1UzfDbK9cmRUiZVukKnsIeJVM8MJRLV4aqcpiZuXlzbWmga5i9cLKTEBnblujjTyqNWXRM5HDVcTV+8oP1tsZ1vCsbh3mBl5Hki3xQlbCq5rLbx0kcPX2+W4qSnEijxQLU5f5hZgbxjmKR8rDGk4bp7uNFWSkROYLTtPlpaqrmiMUgIrEt6msPpjZhx0VAZookBE78xrWnAWeSelSNG330d/Rxvgg90Dl4UjsHAJLvATQ9mlZsg25N+2i1ncdtvvZI+o4WN5qumJCv4UIN0X4FBNOi1+PwN3wQdVSMHTb177hc5X0U3XA1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8/wXxc/avBIFSNicKnok4Fl5tF2bXg3HGBaHxUuy5fo=;
 b=bogiiQrfxY17mOXL0UierIXb42PT+/1owLpq7Uc0//sTsPoMOAQHUf5UUiFAwMpRQSQ+DI3RcQFMYi7eT4pihhjnMqOnMnJtdXknvliFm+lMqQuL0QpO+kUu4s3hQpxFitdf/A2wfXYYjiux8Au5JIfU4h/C/i2pkMxw/M8/vpIzGinMA1G9J61bsFLmpCQ6dVv1yThpweDZpZAbNoMJ6D7gQayqyQs4TQgBA0688zIO4jNH/T88pFizjt3jQYNLfC7XpcA93JBB3IdGg1DI3zcECnhT1y61R4SMGnDODl9yW8lWlLFbsbxMwkjl2A6veaA+YjdMKaxfMuB2NUejOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Thu, 14 Aug
 2025 17:42:04 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 17:42:04 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Thread-Topic: [PATCH] lib/xe/xe_spin: Add switch point for preemptible spinner
Thread-Index: AQHcDGtHgRaMvpdEL0uqbWYL3+a86rRg3PaAgAGKmoCAAATIcA==
Date: Thu, 14 Aug 2025 17:42:04 +0000
Message-ID: <CH0PR11MB5444F0D719771F0B5E3460F9E535A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250813155935.87329-2-jonathan.cavitt@intel.com>
 <buzrxspq2t2eoeeh2rverullk5o3qk6yfy4mgsrb6gmy52jf7r@z5h7ituni3hu>
 <aJ4bp3G6L1518vrr@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ4bp3G6L1518vrr@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7880:EE_
x-ms-office365-filtering-correlation-id: a27b917a-c02a-4137-b14d-08dddb59e20c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?SGdQWHBqR0hTTDVRcnhqQUViY3dpd1FDUUptYUZac3NNUWlHNUxmdk1qbXdu?=
 =?utf-8?B?eXZmUVB2RzAxR1lxUnJLMzZCUGVibU05OUxQaTdpcWhjbWpVTEp3OTZNNVpi?=
 =?utf-8?B?OXVhVzF3dXhZSFhDdy9rOGYyZ3AzRzZGRUZRRnpOSGVXMFR4djl6L1pjRi84?=
 =?utf-8?B?OFpBdVFnM3BJSGwwTHU5WE4xTnM1RWJnajhDeUplZ1c3M1hFMVhwRnpQN0F2?=
 =?utf-8?B?QWNkL0Rsb2R0bEZ6VjE0eXJnbjVwdno2Y0VHUHRlOXdkeWQ0cUYzZmJ2b3pE?=
 =?utf-8?B?Y2YzYUlmL0tjblFMVlYvWW01V2pCYk1LRHNuditWRWx4Uk5hM2RPNzhjVXh4?=
 =?utf-8?B?bGd6NTFKcExxOTZDaDNjWnBvaDgwWVM2bzBVRXpqRFpZUUtXYlBRMFhIOXVa?=
 =?utf-8?B?aFpjMWxOcnhSUTQwWGljbXlhTzMzN2pVb2FmME96Vk52UE1LeU41aG1PWTI4?=
 =?utf-8?B?U242SFNpT1UrZHRKS1ZZcyt1MlNLTC9BanZ4TmVIa1hJZUlHYmQwVGdGVVhp?=
 =?utf-8?B?a2E5SHk2czlvZHl4dWlaRkFoT01nRTZVQ0c0aVJLRExJN285Y1FLcnJmRHFl?=
 =?utf-8?B?dG5LRG9oeEhURzNBNGNpU0VHaWpLYmwvSlRUemNhUUIvYXIxN0VscEhIRUZ5?=
 =?utf-8?B?U3JMb2RobjdTTC9ocVhzc3U4YlFhNUtrUEI0dlMvSmcwV0FWajJoWnF2TzI3?=
 =?utf-8?B?NTFQR3F3NTV2R3Q2ZC9zTjNYTEVtWEFiOFdOQStZaTZQYml0SFVPMW0vVnhL?=
 =?utf-8?B?czV2cHRKS2tSakZrTnBReU90MFN3MWh4bzMxM0x3TkdLVTJFUDhReGhvZHp1?=
 =?utf-8?B?Z2tVeFNHMEl5K0dSTnQ4bzdLUHZYZXZERmpVZU42UDFnU1htUjBJV2k4WWt6?=
 =?utf-8?B?QVhnazM0aTVVMUNDc3ZtNGlFSitHSVNUazlmSnFMWUlYc2J2a09wK0UvbXAz?=
 =?utf-8?B?S0xoTm9PS21tclJtN2FzRDdxQ2tXZXFmdnN0cVV0S2x4VWNLT2wwVHYyeEw0?=
 =?utf-8?B?TExjU2x2aWowZ29abGd0L0Jod1FHOExvcTRwME5qTnJiaXpvd1l3c3gydno5?=
 =?utf-8?B?VnBsci9rYm0zT3U3Q2k1aHNOQ2JkVHBMNlJtTmUvandoNnQ3emFFelMyR0lK?=
 =?utf-8?B?Sk9BeUt1WmRrYmFYL3RrN3lpeldMWDV2Nk1BWFRwQmRTS0F5VCtreDFqSFV1?=
 =?utf-8?B?QzNIK3oxckd4b3hLNXkzWm01NDNtNVNnaVZSUFB0NS9pUDdHaFBzY0plTVdY?=
 =?utf-8?B?SzlqcUZhOHdNSWw4Zkx6TWJTYlg3KzF1SWhuenVqblNybHBoUFJnYjZxbFlR?=
 =?utf-8?B?MzVvblZQVUh4d3AzVTZzUFRGcUpSQXZoT1NxWmdRUTVCY05SMkxjOFNta1pF?=
 =?utf-8?B?TWVFbEY3OTIvT0VhNlQveXE4TmZKTVBLWTJoZFJJM0tTUGdENXdNVXorOG9j?=
 =?utf-8?B?QnQySkpobkJHNVBheHFSL0lMNmNYdjh6eTczeGwzQktZSy9jWjhoOE1mQ2lE?=
 =?utf-8?B?VEhEYWhEQjdjYXZKUzBRb3NhSUU0R1ZsS1lMUlZiMlkzUTgybXFBdC9vY1cy?=
 =?utf-8?B?aVhCMVVYbzhtU0lJRytIVGNPOEJXQk1jai9Lakp3eUoyUUE2OThQb2kzWjI0?=
 =?utf-8?B?VE1MZ0tpRGswcUJ2RHN3THNQSDVUdDQyWHY1YVM2Q3NOUDBJVXloS3ZBdnJp?=
 =?utf-8?B?Sm41KzVrNWxNcEpTUWVYUDY4NmRlczUwSmVNTU45b2EwNlAxSVhJRk5MYUhH?=
 =?utf-8?B?SzNDaXRFWlVCSXN1UzFENmd0cFRKK3RjWVE1OEs1RDdDZ1JRbkI0MnVlTjVn?=
 =?utf-8?B?MzVweElrQzRLOHljcVpLSmIrMXByVHNFY1FPK0FxK3VYOUZCeGVMRTFnOWp0?=
 =?utf-8?B?M3VUVFB1M3NDTE1CZmxQa1hITzdhSHVlSW9kMHc0bmpzY3NDUlFaV1ZlQ092?=
 =?utf-8?Q?ZsuqMcJfsTc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzhjcUVRendqZU4xc1ZVU0o3L0dCYndkd1VWeXhTUGhPeDhLQ2xqN01SbG5n?=
 =?utf-8?B?QWlqMnRPWXpjcUoyRFYzbFRXWHBBcWluaEtKUWVKMCt4NHE2b2NhUk9JekVX?=
 =?utf-8?B?dndFT2ZlekZrTjhSSnZia1AwNnlyek02aEIxemc1WGwzaGRKZ0NodGFRYWYx?=
 =?utf-8?B?UnpRY1dpNnF5U1VNQllMeDhRWjdDNlJRL3A4TW9sUFlFVVhSSllZbFVMWjFF?=
 =?utf-8?B?cE1lUVVIaFJ4cktQa284enJSaVd6N1k1US9zR05YOUY1RE5CZTE1MXdFUGcr?=
 =?utf-8?B?VWIwb0ZhMm9sa2F3aUJwaHNhMlRRRDc4ZVNocFBJczR3VjNzcmp1ZlJBcUUx?=
 =?utf-8?B?d09sN3VRelB6NWFYZU4vb1BPTFFya3N4a0l3VmJzbldtQ2F5QkE3V2NMbzZh?=
 =?utf-8?B?SWRPVzhrdGtHeklQcVFDdjFSaXNhWFhCOVRPRnpjOWdxNFhVb3VUM0pxWnVr?=
 =?utf-8?B?NXlhbGNKamw3R3dXSFpFeFNMRlZGMkVhQXN2cGkyVU9peTlETEZHbFZkSGJo?=
 =?utf-8?B?UHZhYjVtRCtFb3pVcHVYT0N2bTJmSE5xZUVwMHFoNnhLd1M4YTdiS0Q4N3Iy?=
 =?utf-8?B?RTRwWHNhUFl5WW4ydW9ReWJCRE9OVkd2dE8vZ1NHU09tSHVveHJoVmxZMGw0?=
 =?utf-8?B?Y1g3TjBVQ0pBbGZuUHdtcEFxdU5qS3ZYUGswSFE2ZW9nZWp1RXB2NmRRUEtr?=
 =?utf-8?B?dytFQmhvbUtzM0MvSUlYMEY4VFNrdmprZ29xbnRWdURrSkZHdWFRRUtqeUk3?=
 =?utf-8?B?bFNoMVh3NFJrQXhqMGJHVkN4Sk9yb3Ivb3JRbDN2dExaVENRZXcrWEFXczlO?=
 =?utf-8?B?Yy9OSWFBQWpkSktJQzBLYkJpMTFsMjFJanJwZHM1K0tTRC9RVE5yTUZHVmth?=
 =?utf-8?B?dHd3UW15b0k1eWRBUVFoRkZCMXFHaXcxT1RmR0VOZ1RZMEY4OUNzeHV0Nm5q?=
 =?utf-8?B?VXlucVpoV3pheEphUlpTN2VMMXhCU3Zsa1BwdUlRM09qVTVZb1Q2UkkrdUl5?=
 =?utf-8?B?KzFvYklEN2dyYUd3d1EwMU1kWjRZVmFHZkpoUlVNaDFyMktxR0R4YldLeHRT?=
 =?utf-8?B?QnVRWTNubzBGT3RjcmVtWGVlV3hWRlNJc3hqa003OFRxOVFBMnJoWStkclVn?=
 =?utf-8?B?bEcwMTYxcnkyclJNV210aVVQY3h5bGxXY1RtbmNkR1NXcksxbVhqcFpxMW9I?=
 =?utf-8?B?QW9jU2FOU0dsV2Z3cXM4MlcrcTJxYkxEM1JwblRyVnBaU0oza1J4K0wwL1M5?=
 =?utf-8?B?dGZ3ZzhmK1NJYjVLTnJyeWlhYUV5dmFpb3VpeklmWjJPSU1qOGs4STZqelZv?=
 =?utf-8?B?MUhyMlp5eEFZWWltTGwzcW12WWt1YjFSRjVPdUMzbnp4MG1ORmZnMm0xbVJj?=
 =?utf-8?B?TmRTamViQlpuZjA0WTJ2b0NwMmNCbG1VWkhGY040V3dnTVhtT24wdkVhRjlX?=
 =?utf-8?B?M2Q0aERPN1I1V0c3MENZOXhRSW4ydzczMUsrVXFja3poZ3daeHVlQ3RLQnYx?=
 =?utf-8?B?U1N1QXErbEVVdWJ2K3hFZXZTNkVNWGNhMzZOeDJFWWFqMkx6T05OWCtnNXl3?=
 =?utf-8?B?Mjd0N0FjTHdtQ0xsSi90RHJxWHk4dEJ6VldvQW16b1JWNTlOdmpMS1drc0FL?=
 =?utf-8?B?alpFUmgrK2gzRGExbmUrRFAzRHR6L0Vob0gvVjloR2NmZllUTk1XK0R6RTdw?=
 =?utf-8?B?dkZXN1FkZXMrMkQ2SEkyNmh4dG1FSkRLOE01V2NZQWo1MXgvWDJLSFpYQnoz?=
 =?utf-8?B?ZDhoNlBVOXR5dG9haGpXUFdFZnBTSVBGajAxYmhBSWxadFBYck9Cc1Y5RzIz?=
 =?utf-8?B?d1FKb1g5L1VmT1FGZnRsZytjY3d1YVMyZHJSc25NL0Z0M0ljblZXa1V1QkRN?=
 =?utf-8?B?dSsyTDRvRGxPRmZSYVFQTlFNM2xYajVEVHBOMEpkR1hIUUttZ3lKa1ZOaFgw?=
 =?utf-8?B?T1dCc3ZLMTlKN0RJMHlndGQrTWp6dDRFN3dkcndOR1B6Y3VyTFlMbTN4WElT?=
 =?utf-8?B?bm1oSGxPZzc5WHI3SldoTjhWM0JQK0lXWVRTZFRBN2FRVW00V3NpS3Exb1dK?=
 =?utf-8?B?blhkRUhLaHhHaHFKZ3VrRzRSVElKYnYrdFQ3eVdIRTNnYTM5bWtxVW9vSmZt?=
 =?utf-8?B?c3p5endzQVFKT09nVVNHT3Fia2pvb0JlTjBLZzFFRG1jeU1YMVhxWFhEb0hE?=
 =?utf-8?B?d2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27b917a-c02a-4137-b14d-08dddb59e20c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2025 17:42:04.7351 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jMbp+WTgtSp9ZJSGlR30IVFv8Peb9goAWxiZ0czIJecPx/8hqoGC7+SZq8YsUl7T/G1Oz+eiftcmtzaJabtId2H6LM2IzjGuxmP1FFPgoZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3
LmJyb3N0QGludGVsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDE0LCAyMDI1IDEwOjI0
IEFNDQpUbzogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQpDYzogQ2F2aXR0LCBKb25hdGhhbiA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT47
IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBHdXB0YSwgc2F1cmFiaGcgPHNhdXJhYmhn
Lmd1cHRhQGludGVsLmNvbT47IFp1bywgQWxleCA8YWxleC56dW9AaW50ZWwuY29tPjsgVmlzaHdh
bmF0aGFwdXJhLCBOaXJhbmphbmEgPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29t
Pg0KU3ViamVjdDogUmU6IFtQQVRDSF0gbGliL3hlL3hlX3NwaW46IEFkZCBzd2l0Y2ggcG9pbnQg
Zm9yIHByZWVtcHRpYmxlIHNwaW5uZXINCj4gDQo+IE9uIFdlZCwgQXVnIDEzLCAyMDI1IGF0IDA3
OjUxOjMxUE0gKzAyMDAsIFpiaWduaWV3IEtlbXBjennFhHNraSB3cm90ZToNCj4gPiBPbiBXZWQs
IEF1ZyAxMywgMjAyNSBhdCAwMzo1OTozNlBNICswMDAwLCBKb25hdGhhbiBDYXZpdHQgd3JvdGU6
DQo+ID4gPiBGcm9tOiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhIDxuaXJhbmphbmEudmlzaHdh
bmF0aGFwdXJhQGludGVsLmNvbT4NCj4gPiA+IA0KPiA+ID4gV2hlbiAncHJlZW1wdCcgb3B0aW9u
IGlzIHNwZWNpZmllZCwgaW5zZXJ0IGEgTUlfU0VNQVBIT1JFX1dBSVQNCj4gPiA+IGNvbW1hbmQg
aW4gdGhlIHNwaW5uZXIgYmF0Y2ggYnVmZmVyLiBUaGlzIHByb3ZpZGVzIHRoZSBzd2l0Y2gNCj4g
PiA+IHBvaW50IGZvciBwcmVlbXB0aW9uIHRvIGhhcHBlbiBpbiBtdWx0aSBxdWV1ZSBtb2RlLg0K
PiA+ID4gDQo+ID4gPiBBZGRpdGlvbmFsbHksIGFsbG93IHRoZSB1c2VyIHRvIGNvbnRyb2wgdGhl
IHByZWVtcHQgd2FpdCBjb25kaXRpb24uDQo+ID4gPiANCj4gPiA+IENsb3NlczogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNTc4Mw0KPiA+ID4g
U2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSA8bmlyYW5qYW5hLnZpc2h3
YW5hdGhhcHVyYUBpbnRlbC5jb20+DQo+ID4gPiBDYzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5i
cm9zdEBpbnRlbC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpv
bmF0aGFuLmNhdml0dEBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBpbmNsdWRlL2ludGVs
X2dwdV9jb21tYW5kcy5oIHwgIDEgKw0KPiA+ID4gIGxpYi94ZS94ZV9zcGluLmMgICAgICAgICAg
ICAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gPiA+ICBsaWIv
eGUveGVfc3Bpbi5oICAgICAgICAgICAgIHwgIDMgKysrDQo+ID4gPiAgMyBmaWxlcyBjaGFuZ2Vk
LCA0NSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2ludGVsX2dwdV9jb21tYW5kcy5oIGIvaW5jbHVkZS9pbnRlbF9ncHVfY29t
bWFuZHMuaA0KPiA+ID4gaW5kZXggY2QyODFiYTg5ZC4uNTE1OGJiMGVhMCAxMDA2NDQNCj4gPiA+
IC0tLSBhL2luY2x1ZGUvaW50ZWxfZ3B1X2NvbW1hbmRzLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUv
aW50ZWxfZ3B1X2NvbW1hbmRzLmgNCj4gPiA+IEBAIC0xMjMsNiArMTIzLDcgQEANCj4gPiA+ICAj
ZGVmaW5lIE1JX1NFTUFQSE9SRV9XQUlUCU1JX0lOU1RSKDB4MWMsIDIpIC8qIEdFTjgrICovDQo+
ID4gPiAgI2RlZmluZSBNSV9TRU1BUEhPUkVfV0FJVF9UT0tFTglNSV9JTlNUUigweDFjLCAzKSAv
KiBHRU4xMisgKi8NCj4gPiA+ICAjZGVmaW5lICAgTUlfU0VNQVBIT1JFX1BPTEwJCSgxIDw8IDE1
KQ0KPiA+ID4gKyNkZWZpbmUgICBNSV9TRU1BUEhPUkVfUVVFVUVfU1dJVENIX01PREUJKDEgPDwg
MTEpDQo+ID4gPiAgI2RlZmluZSAgIE1JX1NFTUFQSE9SRV9TQURfR1RfU0RECSgwIDw8IDEyKQ0K
PiA+ID4gICNkZWZpbmUgICBNSV9TRU1BUEhPUkVfU0FEX0dURV9TREQJKDEgPDwgMTIpDQo+ID4g
PiAgI2RlZmluZSAgIE1JX1NFTUFQSE9SRV9TQURfTFRfU0RECSgyIDw8IDEyKQ0KPiA+ID4gZGlm
ZiAtLWdpdCBhL2xpYi94ZS94ZV9zcGluLmMgYi9saWIveGUveGVfc3Bpbi5jDQo+ID4gPiBpbmRl
eCAyNWY3NTU1ZTI3Li5kNjI5NTJiNTM5IDEwMDY0NA0KPiA+ID4gLS0tIGEvbGliL3hlL3hlX3Nw
aW4uYw0KPiA+ID4gKysrIGIvbGliL3hlL3hlX3NwaW4uYw0KPiA+ID4gQEAgLTMwLDcgKzMwLDYg
QEANCj4gPiA+ICANCj4gPiA+ICBlbnVtIHsgU1RBUlRfVFMsIE5PV19UUyB9Ow0KPiA+ID4gIA0K
PiA+ID4gLQ0KPiA+ID4gIHVpbnQzMl90IHhlX3NwaW5fbnNlY190b190aWNrcyhpbnQgZmQsIGlu
dCBndF9pZCwgdWludDY0X3QgbnNlYykNCj4gPiA+ICB7DQo+ID4gPiAgCXVpbnQzMl90IHRpY2tz
ID0geGVfbnNlY190b190aWNrcyhmZCwgZ3RfaWQsIG5zZWMpOw0KPiA+ID4gQEAgLTU3LDYgKzU2
LDcgQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4sIHN0cnVjdCB4ZV9z
cGluX29wdHMgKm9wdHMpDQo+ID4gPiAgDQo+ID4gPiAgCXNwaW4tPnN0YXJ0ID0gMDsNCj4gPiA+
ICAJc3Bpbi0+ZW5kID0gMHhmZmZmZmZmZjsNCj4gPiA+ICsJc3Bpbi0+d2FpdF9jb25kID0gMDsN
Cj4gPiA+ICAJc3Bpbi0+dGlja3NfZGVsdGEgPSAwOw0KPiA+ID4gIA0KPiA+ID4gIAlpZiAob3B0
cy0+Y3R4X3RpY2tzKSB7DQo+ID4gPiBAQCAtMTY3LDYgKzE2NywyNCBAQCB2b2lkIHhlX3NwaW5f
aW5pdChzdHJ1Y3QgeGVfc3BpbiAqc3Bpbiwgc3RydWN0IHhlX3NwaW5fb3B0cyAqb3B0cykNCj4g
PiA+ICAJCQkJICAgb3B0cy0+bWVtX2NvcHktPmRzdC0+bW9jc19pbmRleDsNCj4gPiA+ICAJfQ0K
PiA+ID4gIA0KPiA+ID4gKwkvKg0KPiA+ID4gKwkgKiBJbnNlcnQgYSBNSV9TRU1BUEhPUkVfV0FJ
VF9DTUQgaW5zdHJ1Y3Rpb24gd2l0aCBjb25kaXRpb24gY29udHJvbGxlZA0KPiA+ID4gKwkgKiBi
eSB0aGUgdXNlci4gSXQgYWxzbyBhY3RzIGFzIGEgcXVldWUgc3dpdGNoIHBvaW50IGluIG11bHRp
IHF1ZXVlIG1vZGUuDQo+ID4gPiArCSAqLw0KPiA+ID4gKwlpZiAob3B0cy0+cHJlZW1wdCkgew0K
PiA+ID4gKwkJdWludDY0X3Qgd2FpdF9hZGRyID0gb3B0cy0+YWRkciArIG9mZnNldG9mKHN0cnVj
dCB4ZV9zcGluLCB3YWl0X2NvbmQpOw0KPiA+ID4gKw0KPiA+ID4gKwkJc3Bpbi0+YmF0Y2hbYisr
XSA9IE1JX1NFTUFQSE9SRV9XQUlUX0NNRCB8DQo+ID4gPiArCQkJCU1JX1NFTUFQSE9SRV9QT0xM
IHwNCj4gPiA+ICsJCQkJTUlfU0VNQVBIT1JFX1FVRVVFX1NXSVRDSF9NT0RFIHwNCj4gPiANCj4g
PiBUaGlzIGJpdCBpcyBub3QgZG9jdW1lbnRlZCBmb3IgcHJldmlvdXMgcGxhdGZvcm1zIHNvIGlz
IGl0IHNhZmUgdG8NCj4gPiBzZXQgaXQ/DQo+ID4gDQo+IA0KPiBZZXMsIEknbSBsb29raW5nIGF0
IGJzcGVjIDQ1NzQ5IGFuZCBub3Qgc2VlaW5nIGJpdCAxMQ0KPiAoTUlfU0VNQVBIT1JFX1FVRVVF
X1NXSVRDSF9NT0RFKSBkZWZpbmVkLiBBbHNvIEkgdGhvdWdoIFNFTUFQSE9SRXMgd2VyZQ0KPiBh
bHdheXMgcHJlZW1wdGFibGUgdG9vLiBHb3QgYSBic3BlYyBsaW5rIHRvIGV4YWN0bHkgd2hhdCB0
aGlzIG5ldyBiaXRzDQo+IGRvZXM/DQoNClRyeSBCc3BlYyA2MDI0NA0KLUpvbmF0aGFuIENhdml0
dA0KDQo+IA0KPiA+IEJUVyBzaW1pbGFyIGVmZmVjdCB3YXMgYWRkaW5nIE1JX0FSQl9DSEVDSyAo
aW4gdGVybSB0ZXN0IGlzIGFsc28NCj4gPiBwYXNzaW5nIGhlcmUpLg0KPiA+IA0KPiANCj4gWWVz
LCBhcmIgY2hlY2tzIGFyZSBhbHNvIHByZWVtcHQgcG9pbnRzIHRvby4NCj4gDQo+IEFsc28gaW4g
Z2VuZXJhbCBJJ20ganVzdCBjb25mdXNlZCBieSBob3cgeGVfc3Bpbl9wcmVlbXB0X3dhaXQgLyBu
b3dhaXQNCj4gZnVuY3Rpb25zIHdvdWxkIGJlIHVzZWQgaW4gSUdUcy4gQ2FuIHlvdSBleHBsYWlu
Pw0KPiANCj4gTWF0dA0KPiANCj4gPiBJZiBteSBuaXQgaXMgbm90IGFwcGx5aW5nIGhlcmUsIGNv
ZGUgbGd0bToNCj4gPiANCj4gPiBSZXZpZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6
Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+DQo+ID4gDQo+ID4gLS0NCj4gPiBaYmlnbmll
dw0KPiA+IA0KPiA+ID4gKwkJCQlNSV9TRU1BUEhPUkVfU0FEX0VRX1NERCB8DQo+ID4gPiArCQkJ
CTM7DQo+ID4gPiArCQlzcGluLT5iYXRjaFtiKytdID0gMDsNCj4gPiA+ICsJCXNwaW4tPmJhdGNo
W2IrK10gPSB3YWl0X2FkZHI7DQo+ID4gPiArCQlzcGluLT5iYXRjaFtiKytdID0gd2FpdF9hZGRy
ID4+IDMyOw0KPiA+ID4gKwkJc3Bpbi0+YmF0Y2hbYisrXSA9IDA7DQo+ID4gPiArCX0NCj4gPiA+
ICsNCj4gPiA+ICAJc3Bpbi0+YmF0Y2hbYisrXSA9IE1JX0NPTkRfQkFUQ0hfQlVGRkVSX0VORCB8
IE1JX0RPX0NPTVBBUkUgfCAyOw0KPiA+ID4gIAlzcGluLT5iYXRjaFtiKytdID0gMDsNCj4gPiA+
ICAJc3Bpbi0+YmF0Y2hbYisrXSA9IGVuZF9hZGRyOw0KPiA+ID4gQEAgLTIwNyw2ICsyMjUsMjgg
QEAgdm9pZCB4ZV9zcGluX2VuZChzdHJ1Y3QgeGVfc3BpbiAqc3BpbikNCj4gPiA+ICAJV1JJVEVf
T05DRShzcGluLT5lbmQsIDApOw0KPiA+ID4gIH0NCj4gPiA+ICANCj4gPiA+ICsvKioNCj4gPiA+
ICsgKiB4ZV9zcGluX3ByZWVtcHRfd2FpdDoNCj4gPiA+ICsgKiBAc3BpbjogcG9pbnRlciB0byBz
cGlubmVyIG1hcHBlZCBibw0KPiA+ID4gKyAqDQo+ID4gPiArICogTWFrZSB0aGUgc3Bpbm5lciB3
YWl0IG9uIHRoZSBwcmVlbXB0aW9uIHNlbWFwaG9yZS4NCj4gPiA+ICsgKi8NCj4gPiA+ICt2b2lk
IHhlX3NwaW5fcHJlZW1wdF93YWl0KHN0cnVjdCB4ZV9zcGluICpzcGluKQ0KPiA+ID4gK3sNCj4g
PiA+ICsJc3Bpbi0+d2FpdF9jb25kID0gMTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArLyoq
DQo+ID4gPiArICogeGVfc3Bpbl9wcmVlbXB0X25vd2FpdDoNCj4gPiA+ICsgKiBAc3BpbjogcG9p
bnRlciB0byBzcGlubmVyIG1hcHBlZCBibw0KPiA+ID4gKyAqDQo+ID4gPiArICogTWFrZSB0aGUg
c3Bpbm5lciBkbyBub3Qgd2FpdCBvbiB0aGUgcHJlZW1wdGlvbiBzZW1hcGhvcmUuDQo+ID4gPiAr
ICovDQo+ID4gPiArdm9pZCB4ZV9zcGluX3ByZWVtcHRfbm93YWl0KHN0cnVjdCB4ZV9zcGluICpz
cGluKQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3Bpbi0+d2FpdF9jb25kID0gMDsNCj4gPiA+ICt9DQo+
ID4gPiArDQo+ID4gPiAgLyoqDQo+ID4gPiAgICogeGVfc3Bpbl9jcmVhdGU6DQo+ID4gPiAgICog
QG9wdDogY29udHJvbGxpbmcgb3B0aW9ucyBzdWNoIGFzIGFsbG9jYXRvciBoYW5kbGUsIGV4ZWNf
cXVldWUsIHZtIGV0Yw0KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi94ZS94ZV9zcGluLmggYi9saWIv
eGUveGVfc3Bpbi5oDQo+ID4gPiBpbmRleCBjMjE5OWQwYWEyLi5lYWYyYTQwOWUwIDEwMDY0NA0K
PiA+ID4gLS0tIGEvbGliL3hlL3hlX3NwaW4uaA0KPiA+ID4gKysrIGIvbGliL3hlL3hlX3NwaW4u
aA0KPiA+ID4gQEAgLTY0LDYgKzY0LDcgQEAgc3RydWN0IHhlX3NwaW4gew0KPiA+ID4gIAl1aW50
NjRfdCBwYWQ7DQo+ID4gPiAgCXVpbnQzMl90IHN0YXJ0Ow0KPiA+ID4gIAl1aW50MzJfdCBlbmQ7
DQo+ID4gPiArCXVpbnQzMl90IHdhaXRfY29uZDsNCj4gPiA+ICAJdWludDMyX3QgdGlja3NfZGVs
dGE7DQo+ID4gPiAgCXVpbnQ2NF90IGV4ZWNfc3luYzsNCj4gPiA+ICAJdWludDMyX3QgdGltZXN0
YW1wOw0KPiA+ID4gQEAgLTc2LDYgKzc3LDggQEAgdm9pZCB4ZV9zcGluX2luaXQoc3RydWN0IHhl
X3NwaW4gKnNwaW4sIHN0cnVjdCB4ZV9zcGluX29wdHMgKm9wdHMpOw0KPiA+ID4gIGJvb2wgeGVf
c3Bpbl9zdGFydGVkKHN0cnVjdCB4ZV9zcGluICpzcGluKTsNCj4gPiA+ICB2b2lkIHhlX3NwaW5f
d2FpdF9zdGFydGVkKHN0cnVjdCB4ZV9zcGluICpzcGluKTsNCj4gPiA+ICB2b2lkIHhlX3NwaW5f
ZW5kKHN0cnVjdCB4ZV9zcGluICpzcGluKTsNCj4gPiA+ICt2b2lkIHhlX3NwaW5fcHJlZW1wdF93
YWl0KHN0cnVjdCB4ZV9zcGluICpzcGluKTsNCj4gPiA+ICt2b2lkIHhlX3NwaW5fcHJlZW1wdF9u
b3dhaXQoc3RydWN0IHhlX3NwaW4gKnNwaW4pOw0KPiA+ID4gIA0KPiA+ID4gIC8qDQo+ID4gPiAg
ICogeGVfY29yazogaGlnaGVyIGxldmVsIEFQSSB0aGF0IHNpbXBsaWZpZXMgZXhlYydpbmcgYW4g
eGVfc3BpbiBieSB0YWtpbmcgY2FyZQ0KPiA+ID4gLS0gDQo+ID4gPiAyLjQzLjANCj4gPiA+IA0K
PiANCg==
