Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B66FC36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 04:31:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E063210E1EB;
	Mon, 28 Apr 2025 04:31:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cj9AsM72";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D8310E1EB
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 04:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745814683; x=1777350683;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=sFyzRVcDFU/DC/Qj019HOL6+B6s0wHiYykd8ZjY9jlY=;
 b=Cj9AsM729Qy6+FlzkYylKZzvsO8JkMeGKtNFr/0zQBaWbHCcXJtb7u3N
 w6+Bjz+aBx+20gg+lIkNHRsniFjL1PZUDrfZpCSSG8DzYPcaeJTGP6Wdi
 V4xY+hsBTZDrzyvSOgB3yKxcDXfBstO7YtVDqA1x+T3Leyfr0orwVJDBV
 8PprX16/Qk/3pOzE4WNmUk/vg3y0MRfD5dBdgkLXSm2UwwWuUhO2oPLvS
 lTqp49NR38S55jDzuHOzhTM0x2MryA2/gNZqdLMoAniqPmtwMB/l3X7w9
 PDdWLoutThOx4L+0K876Gtg3qEkggiTG6iape7z24R3k3Z2GehaJU70eF w==;
X-CSE-ConnectionGUID: gmkBg6JRTNWFO/5v6yMX8w==
X-CSE-MsgGUID: hk3bZYH1Q068CYmg74vxeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47519927"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47519927"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:31:22 -0700
X-CSE-ConnectionGUID: v/VJlAEhRXinNaixDefJDw==
X-CSE-MsgGUID: dvqeRAwhQyKSnPtplS4t4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="134350850"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:31:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 21:31:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 21:31:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 21:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIAHKCNJY5QblZs1X3cZTaCFIz0R1/PGvWnHdYDew3XmGkwm0m1wj8GKPVIwDi8HPNhNkR7NrKn4YMcZI7oAkpwAVqKqjUpALad4AEj5/67OEwwVKmR+c55ZNl277fjmYwNzi2l5s74zKAFgGf8ivDYHC61ivSscU5Kqzm4n3e+l9p3vpqtdwqUjpSpA5eHEo2OS7c0PaqKvpRw205cnJWcTxqhSTJiweav00a8NzOYLdYnfOBR4IaYzbxRsWxGdLpwpIuqUsqS1R7iGLz8kpVG/BKPHn3w+VQfYal5KDdr9/10oRXcP5io8P90DUn0gMv3oQH1zQyB6ErIr0T249Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFyzRVcDFU/DC/Qj019HOL6+B6s0wHiYykd8ZjY9jlY=;
 b=cZfqvaIMx6duCybfrF772FuseG7BNvDgMLl7CK4mPiC3oCoRZaE+Gb1OZVbvScATVGt6B3VfAK/p29Rpfggsq/BMjnLTy0RAtE+DqkpJR7FhBTbjKEHuI4EqPOYc9nfxEkb/mc24AztVs6MyiiakBRFUGn00uYErdY6ehBLEnSOREHQskVV/f9DeCZHWeGSU74Vsgnb0QR+iFnPcP6o86thmhPjb/igHLWesJgt+yNyc1oWFwe47lgVSVl28q8yB9x4tYsg5yTOxepmB6c1k7m0SbmSkNK8OGIumV9Sd/IBJmxDFNakCvw8tL56tZ8B/pBdQ3pno7Ew4MTv7xVnIEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by BL1PR11MB5238.namprd11.prod.outlook.com (2603:10b6:208:313::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Mon, 28 Apr
 2025 04:31:18 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 04:31:18 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] benchmark: Measure allocation time for objects
Thread-Topic: [PATCH] benchmark: Measure allocation time for objects
Thread-Index: AQHbtPiAcl/9V9/7uUeJwTMDcw/Vp7O4grPA
Date: Mon, 28 Apr 2025 04:31:18 +0000
Message-ID: <CH3PR11MB8434DFFBAC4CD5822CF657D48D812@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250424091650.853598-1-pravalika.gurram@intel.com>
In-Reply-To: <20250424091650.853598-1-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|BL1PR11MB5238:EE_
x-ms-office365-filtering-correlation-id: ce00b13c-8add-4614-b72e-08dd860d8509
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QTVENHl6SVpGZTgzaDMrNitML1ltQzIrTU5uelZCb0RBaVZ5SExWR0NsaUU1?=
 =?utf-8?B?bXNwdDJYNVhQMFhLSkdZSzVmYXo4RUxFajEzZWE1YXZsN2NxcFZPSXgvbFRI?=
 =?utf-8?B?VGw5YTZZK2F3ancvSk15RFgwSWJQZ1pzak12OUw1OGZxVlQ3TUtXQVhKVEtC?=
 =?utf-8?B?dnlEZmpsTlVaMXRZdXN2Wk1aZmFldk92TldZa2YxM0ZHUjQzdnBZMlFySVFj?=
 =?utf-8?B?UWJrUk9rL2FDTFBDS25NZ1dkLzQzQk5UbzV4dXdjNmNCeUI4c05KY3RxZ0ZN?=
 =?utf-8?B?VEpEMmk0aGpJR0F3T0J4Z2orOXEvODRsS0ppNDNxRERBRFg1MzZlOThBWmlW?=
 =?utf-8?B?UFRjTGxUdzhZWTI0eTA5ejZzNzU5aFdhVHoybWJrd1JXZzc1aDY5RXQyMlgw?=
 =?utf-8?B?K1Y1R0NoTmh0OTRPS3BZbGs4aWVPZG9DWXovS3Q5aldlSmxkK01kVVYxNHU5?=
 =?utf-8?B?dlZ3ZWRHZkNaeHhGNVJ1SmRyMGVGYXZ5ejJXU1JkS1ZrbWppb0FBS2dEd2VJ?=
 =?utf-8?B?VXBHVzBZbEMySXEvZUVtS25QSGlhL0UzMnFMd21nZDNVQkI3NHh0d0JGZThp?=
 =?utf-8?B?djlQU21xNU5pdUVqUUw0ZEx2UjZIN2RtOXduVmNPU3JzaVk5NjNQMkJuVE4x?=
 =?utf-8?B?L05tSmViWkNPazFxMDBJQkdQMGZnQjdUSERPK0pEakhBNHBlUWdiK1VhU0Rj?=
 =?utf-8?B?OVBLUWNTTUN2K3lwZ2RHSGdjUnBRY1hnc3FBaGtEYXp6ekJTbVVoVVB3SzQ4?=
 =?utf-8?B?VUY3QXpLYXhUNkRnL1pyeU5Cb2lYYWtObFBqbUN3dnpTNklRNjZjVitYYVVz?=
 =?utf-8?B?a095dWlyU2R0RGt2d3hwcStPaEhvMDBHRDFnWTFHUjRGSmtweFpNT1o5V0o2?=
 =?utf-8?B?NWtkRWtrTnVueWxhQ0xaRmpWZnMxSHpDV1R2ZHJ5NFFtQk90MHBlNXRYTDU3?=
 =?utf-8?B?eWN0TENYYlU2YjRNdHgzc05HczZuT212NGZ4L2cvenNoRzBQaHJCMUNYQWNo?=
 =?utf-8?B?am1SWk9YNlpTcUtkVmNsK2t4SGtGR1h2cjZDTWZBcS96U2JORHJQWlB4aUwv?=
 =?utf-8?B?RzBKYldXNGpMSEcrTFZLcDRTVXhnUlcwcnVuVDl3eldvc1dVOUN5WEJ3MWJI?=
 =?utf-8?B?aHp3dkg3ay9mTU5YVHJCSVZxS2UvMzI0Y21qb0hFTklTUk1PdmdBQ3NNL3pl?=
 =?utf-8?B?K0J1bElrckt5L2ZKQXpldEpQRzdpcC9TN3NJbWhvcWt2N0J0ak16aFBOK0Yy?=
 =?utf-8?B?MjdiK1pXM294UXo2Ni9jU1oxUTQ1UlExUkRIYThzWm5qMGdjdG0yMW1XQUNU?=
 =?utf-8?B?UWRBSHNDYXpIZFJHUGR1TlFtR3hCTmc2TW95VHpPcklNWWdGWXZsT2dUc1pm?=
 =?utf-8?B?NEorK0ZsNW5IWXh3akg3eUZCbC9LQkdZWGRlYXVlSUZESUZYQ21BSGEzMnhD?=
 =?utf-8?B?aWhVUTY1dHh6Tm5obGJib0FiR3hLMUJNNTMxeEZIblY4VGVhUzZLYzg4RTB0?=
 =?utf-8?B?UVpMbjFjaDhpVGgrMmM0WmVsOGtKdGZ2N3I3S3BYK3hSVWQrbm1QdElsVlk3?=
 =?utf-8?B?ZlFqMHphVmMwOHo5MzFwVy9pUUtWdjBTSHpVUHNDQ3VBYUZCZnd1cGVWNDdj?=
 =?utf-8?B?Q1JzZ2tLOXZaeVp3UkM1VmEvRzIvalpUTHhiTVZ6RmR2N3pPM2VRTXQ1Tkxw?=
 =?utf-8?B?YnkwYUFFWGtSNDdKdm5sMXhTS2dxQ05IdTdkWThiNGprUjg2UTB0a0JVWmZL?=
 =?utf-8?B?R1g3dkZRdHk1NTA2Y1E2TzZGaWQwNlkrS3dRMVFFNkwvakNYYy9LaS85K2s3?=
 =?utf-8?B?WS9DTW0vaXJCWFVwUXNqcm1uYlRjQmh5MVVmVUI0bzVWc1hIN25DUHJWMVRs?=
 =?utf-8?B?Wmt3VC9aWXdaeEM1NzJ6aDBxU1dVNEdLZG52TUovQWlwZTg5dXF5anREbXpJ?=
 =?utf-8?B?U1gxN0hhUUJlanVQZDdWZGZ6aVAxMjgzemUrSXprTWg4bkgyTWgwb21rbFdx?=
 =?utf-8?Q?ZB2AyhZplPdp5Jn4Q0nX/JNRotfDpY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(376014)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUFmeTk3VnYwU2dhNHZyZkNpb2ZNS2ErQ3RkVXpxVUVYekR4bUZSVDNqYWZB?=
 =?utf-8?B?VkZjdjBoRUxHczVKd21Ka0hHV1VYL0FEMStYajVaSUtzeDJqeDd3cDVsV21V?=
 =?utf-8?B?N0NBSytVRWtWM2ZzVk4rN1VBaUhod3gxYng4c3dkSlYrcjY4a2kwQXNaR2hY?=
 =?utf-8?B?bWxzTW9nRFJVM1g3SXFKWVRxbldyQmczUk1DNXdOU2krQVk3VjB4V3pjRHFH?=
 =?utf-8?B?R3I3UGNWUXRPZis2amJzL3hRZmlhSFRCOG9jK2tLSE1NMFNYc1E2cndLQmlv?=
 =?utf-8?B?NlJURXVVY01ab09OcG9MYk5NeVh3cVFSQlczeXB3OXFmRkJuSTU5TXZvSzgv?=
 =?utf-8?B?S3U1SUV6ck13TTVtT21UbUUzS2JwaVZmcE9Qd2s1UThvekE2ZWlVUFk2alRU?=
 =?utf-8?B?UGp4STJ2RmpnMlVybVNrTTBpYUZ1Y1JWbnNJa3M1LzJ1bDFicWNsS1E2dTRH?=
 =?utf-8?B?UzFqaWNIYWhVb2J0aFo1MTVNa0ZEUTFoMHNkaHRuQTk0ZnlSUnk2aUdoNDVV?=
 =?utf-8?B?RGJ0MHA3VklJNXV6WjY4ZG53VDhoaC9BazMyKytCWVRvbm9GUWdqdHlyN0RY?=
 =?utf-8?B?czRwOHZaZm11MUhVdkxSam1mUE9aanVia05VWGJlVFNHT0s5L1lPclc2M1h4?=
 =?utf-8?B?MmRwaFZlOHdWRXdEQmVLTDhLZnlYSUp2V2pIeHVRQXFUczQyVkJxcTFwQ2V4?=
 =?utf-8?B?dUloMHBCeTZEdEZxc1ZVOVpqYVJWL3pkTGtac3JLNSs2NWI3b2NPUzQzWTBw?=
 =?utf-8?B?azBLTG1tbWlNOWpqS2tCQTlBdFdqdmVCVE03Tm4rbU9xdDhJeWJmTWtDeklO?=
 =?utf-8?B?Y0tKY0lCVENxL01HeEVRS0JvOTFDK0Nha2hURDBsVEltT1d0K1N3SWRtRTBZ?=
 =?utf-8?B?SkozYWpjd1l5NkxkNU9obmJuaGlqV2g4RGJ0NndJMlpSUHZ6NXNVZWd6WURG?=
 =?utf-8?B?OGUrVXVUaUV1TngzVy93L1ptQlVHQmNtNkNyb3Foemh3SVR0Z1dFVVdDU3J2?=
 =?utf-8?B?Q1hhT0F3bG9obnBJN0k1ODhST3NUbmllSWNCZEQyYVlxUkFWUDhFM1publZr?=
 =?utf-8?B?eFJVRmx6NnI1U084T3QzZHZEMTVOU1dYQWNPN01WRVpjYmFGZHo2aDFaeUdy?=
 =?utf-8?B?NnBXQm1zUlJnRWpWTzdZc2ttT1lROHkzZ25yeXZJRnR1dUg2QTc2TXlaZUh2?=
 =?utf-8?B?b0ZoaG80MkVBKzgwdC9qb0lWcVIyU0ttc1ZhRm9ndWhrR2hFRG1INlhFd09P?=
 =?utf-8?B?K1JMejlPL1RXMlI5ci8rMW9laW5BNklHNkFZNnBCZGVtTU9mU09FTjg1UVlJ?=
 =?utf-8?B?aEVJRWt2WHdSakhmYVJxcktQUnJwYURQQnMyT1pQb085NlhhaUpoNEdGYWpG?=
 =?utf-8?B?YVUrWHZhQWFRN1ZEcm4xRHJub1F6N3ppNFJ2OGtYMS8wcExwdlVyd2JEOEJX?=
 =?utf-8?B?M1JiSHVBZ2pYOUt3TUJFc2d4cVJHR3UrM0xwcldHSWM1L3R2ZTNqbHJjRjQr?=
 =?utf-8?B?RERoZkdnWmVmYVNrSTB5Q1dqV1Y4VmJpTlFXbWRmYWlzdjEvZkhrVTVNL2Fa?=
 =?utf-8?B?ZkJEdTVjYm5meTA3UTh1c0xlQkdZTFhhbGxOVlBZQlN2N0FrZDRoTFpaT0h3?=
 =?utf-8?B?VXNyRzRwdjh6dkduQkc2MktQb3F2NVJINGt0OWs0S0YxcnZDZWRNU0xQcUJL?=
 =?utf-8?B?ZDVYM2J0QnpYQUU4R214Z0FMVGFESkozaWNkUWFPVmpUbEQ3L2lEV1dqVkw5?=
 =?utf-8?B?YUZzUXdpYWhNOWhGY2J5bjNoM015aWZKWm9mNDJKaXlmQjlNZW9yTzRwYTdB?=
 =?utf-8?B?cDZDTDRjZDUrS283YXhKRUh0UHljZ081WUowZ1FNWTVpN2JXS2FYY29ReSs0?=
 =?utf-8?B?bG04Q2JNalRjdml4ZEI4U3hqVDJ5TGNWNTM4RkhLY2p2RkZvZmRVWWZiZkc0?=
 =?utf-8?B?ZFpnMVJGQ0VQR3VkTjIzWElrSmtQNWtwM3NCc3dFV0k0YlN2eTBQMU1sWGpj?=
 =?utf-8?B?aFdHQXhZZXBCUHlWYW9WMTF4MEc4eVJGaUFBdGl5VEZLOElrK0ZCOU9UUytt?=
 =?utf-8?B?eDQzUGs0WjJXelcvVlhmQ1JVemY4MGp6bWQ3ZHRMK0N3cTRjc1BrWGQ4MWZW?=
 =?utf-8?B?OGNCd05KSU5Gc1dsVFJsblg1MUFTNEEvU1RkdkdaRFZ4aTNFeGZUYnR2S0dJ?=
 =?utf-8?B?RFJRdmduaXJSQzRmakQxZEMwdXhDSWtWcTRkMXhGdE9qcXNSYTVvb0VsYWox?=
 =?utf-8?B?QmVrWVZRZDZRMkVuUHdGczdld3dBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce00b13c-8add-4614-b72e-08dd860d8509
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2025 04:31:18.0911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g7kx9HXTZw/yuoOmwACPI6Mo6ZMVr5oyLGGrXUNS140mETSS+mtmyajXRFqT8ARhsKucejrPVg3CIN8KIs5PUwq/3rIfnKKImPuGu3cfMio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5238
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

TEdUTSwNClJldmlld2VkLWJ5OiBQcml5YW5rYSBEYW5kYW11ZGkgPHByaXlhbmthLmRhbmRhbXVk
aUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3Vy
cmFtLCBQcmF2YWxpa2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBTZW50OiAyNCBB
cHJpbCAyMDI1IDAyOjQ3IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
PiBDYzogRGFuZGFtdWRpLCBQcml5YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47
IEd1cnJhbSwNCj4gUHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIXSBiZW5jaG1hcms6IE1lYXN1cmUgYWxsb2NhdGlvbiB0aW1lIGZvciBvYmpl
Y3RzDQo+IA0KPiBBIGJhc2ljIG1lYXN1cmVtZW50LCBob3cgZmFzdCBjYW4gd2UgY3JlYXRlIGFu
ZCBwb3B1bGF0ZSBhbiBvYmplY3Qgd2l0aA0KPiBiYWNraW5nIHN0b3JhZ2UNCj4gDQo+IHYyOiBy
ZW1vdmUgdGhlIGhlYWRlcnMgYW5kIHVudXNlZCB2YXJpYWJsZSB3aGljaCBhcmUgbm90IHJlcXVp
cmVkDQo+IFtQcml5YW5rYV0NCj4gICAgIHVzZSBTUERYIFtrYW1pbF0NCj4gdjM6IE1vdmUgc3lu
YyBhbmQgZXhlYyBmdW5jdGlvbnMgaW5zaWRlIGJ1c3kgY29uZGl0aW9uLiBbUHJpeWFua2FdDQo+
IHY0OiBNb3ZlIG90aGVyIHZhcmlhYmxlcyBpbnNpZGUgYnVzeSBjb25kaXRpb24uIFtQcml5YW5r
YV0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJy
YW1AaW50ZWwuY29tPg0KPiAtLS0NCj4gIGJlbmNobWFya3MvbWVzb24uYnVpbGQgfCAgIDEgKw0K
PiAgYmVuY2htYXJrcy94ZV9jcmVhdGUuYyB8IDE1Nw0KPiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTggaW5zZXJ0aW9ucygr
KQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJlbmNobWFya3MveGVfY3JlYXRlLmMNCj4gDQo+IGRp
ZmYgLS1naXQgYS9iZW5jaG1hcmtzL21lc29uLmJ1aWxkIGIvYmVuY2htYXJrcy9tZXNvbi5idWls
ZCBpbmRleA0KPiAyYzlhODhmZDMuLjBlNDFlZWQwNiAxMDA2NDQNCj4gLS0tIGEvYmVuY2htYXJr
cy9tZXNvbi5idWlsZA0KPiArKysgYi9iZW5jaG1hcmtzL21lc29uLmJ1aWxkDQo+IEBAIC0yMSw2
ICsyMSw3IEBAIGJlbmNobWFya19wcm9ncyA9IFsNCj4gIAkna21zX3ZibGFuaycsDQo+ICAJJ3By
aW1lX2xvb2t1cCcsDQo+ICAJJ3ZnZW1fbW1hcCcsDQo+ICsgICAgICAgICd4ZV9jcmVhdGUnLA0K
PiAgXQ0KPiANCj4gIGJlbmNobWFya3NkaXIgPSBqb2luX3BhdGhzKGxpYmV4ZWNkaXIsICdiZW5j
aG1hcmtzJykgZGlmZiAtLWdpdA0KPiBhL2JlbmNobWFya3MveGVfY3JlYXRlLmMgYi9iZW5jaG1h
cmtzL3hlX2NyZWF0ZS5jIG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4u
OWE3MzliMTliDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvYmVuY2htYXJrcy94ZV9jcmVhdGUu
Yw0KPiBAQCAtMCwwICsxLDE1NyBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1J
VA0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsg
Ki8NCj4gKw0KPiArI2luY2x1ZGUgImlndC5oIg0KPiArI2luY2x1ZGUgImlndF9zeW5jb2JqLmgi
DQo+ICsjaW5jbHVkZSAieGUveGVfaW9jdGwuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5o
Ig0KPiArDQo+ICsNCj4gKyNkZWZpbmUgT0JKRUNUX1NJWkUgKDE8PDIzKQ0KPiArDQo+ICtzdGF0
aWMgZG91YmxlIGVsYXBzZWQoY29uc3Qgc3RydWN0IHRpbWVzcGVjICpzdGFydCwNCj4gKwkJCQlj
b25zdCBzdHJ1Y3QgdGltZXNwZWMgKmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVuZC0+dHZfc2Vj
IC0gc3RhcnQtPnR2X3NlYykgKyAxZS05KihlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQtPnR2X25z
ZWMpOyB9DQo+ICsNCj4gK3N0YXRpYyB2b2lkIHRlc3RfZXhlYyhpbnQgZmQsIGludCBidXN5KSB7
DQo+ICsJdWludDMyX3Qgdm0sIGJvOw0KPiArCXVpbnQ2NF90IGJvX3NpemUgPSB4ZV9iYl9zaXpl
KGZkLCBTWl80Syk7DQo+ICsJaW50IGVycjsNCj4gKw0KPiArCXZtID0geGVfdm1fY3JlYXRlKGZk
LCAwLCAwKTsNCj4gKwlibyA9IHhlX2JvX2NyZWF0ZShmZCwgdm0sIGJvX3NpemUsIHN5c3RlbV9t
ZW1vcnkoZmQpLCAwKTsNCj4gKw0KPiArCWlmIChidXN5KSB7DQo+ICsJCXVpbnQzMl90ICpiYXRj
aCwgZXhlY19xdWV1ZV9pZDsNCj4gKwkJdWludDY0X3QgYWRkciA9IDB4MWEwMDAwOw0KPiArCQlz
dHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHsNCj4gKwkJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQ
RV9TWU5DT0JKLA0KPiArCQkJLmZsYWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+ICsJ
CQkuaGFuZGxlID0gc3luY29ial9jcmVhdGUoZmQsIDApLA0KPiArCQl9Ow0KPiArCQlzdHJ1Y3Qg
ZHJtX3hlX2V4ZWMgZXhlYyA9IHsNCj4gKwkJCS5udW1fc3luY3MgPSAxLA0KPiArCQkJLnN5bmNz
ID0gdG9fdXNlcl9wb2ludGVyKCZzeW5jKSwNCj4gKwkJCS5hZGRyZXNzID0gYWRkciwNCj4gKwkJ
CS5udW1fYmF0Y2hfYnVmZmVyID0gMSwNCj4gKwkJfTsNCj4gKw0KPiArCQliYXRjaCA9IHhlX2Jv
X21hcChmZCwgYm8sIGJvX3NpemUpOw0KPiArCQkqYmF0Y2ggPSBNSV9CQVRDSF9CVUZGRVJfRU5E
Ow0KPiArCQltdW5tYXAoYmF0Y2gsIGJvX3NpemUpOw0KPiArCQl4ZV92bV9iaW5kX3N5bmMoZmQs
IHZtLCBibywgMCwgYWRkciwgYm9fc2l6ZSk7DQo+ICsNCj4gKwkJZXJyID0gX194ZV9leGVjX3F1
ZXVlX2NyZWF0ZShmZCwgdm0sIDEsIDEsICZ4ZV9lbmdpbmUoZmQsIDApLQ0KPiA+aW5zdGFuY2Us
IDAsDQo+ICsJCQkJCSAgICAmZXhlY19xdWV1ZV9pZCk7DQo+ICsJCWlndF9hc3NlcnRfZighZXJy
LCAiRmFpbGVkIHRvIGNyZWF0ZSBleGVjIHF1ZXVlICglZClcbiIsIGVycik7DQo+ICsNCj4gKwkJ
ZXhlYy5leGVjX3F1ZXVlX2lkID0gZXhlY19xdWV1ZV9pZDsNCj4gKwkJZXJyID0gX194ZV9leGVj
KGZkLCAmZXhlYyk7DQo+ICsJCWlndF9hc3NlcnRfZighZXJyLCAiRmFpbGVkIHRvIGV4ZWN1dGUg
YmF0Y2ggKCVkKVxuIiwgZXJyKTsNCj4gKw0KPiArCQllcnIgPSBzeW5jb2JqX3dhaXQoZmQsICZz
eW5jLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKTsNCj4gKwkJaWd0X2Fzc2VydF9mKGVy
ciwgIlRpbWVvdXQgd2hpbGUgd2FpdGluZyBmb3Igc3luY29iaiBzaWduYWwNCj4gKCVkKVxuIiwN
Cj4gK2Vycik7DQo+ICsNCj4gKwkJeGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVl
X2lkKTsNCj4gKwkJc3luY29ial9kZXN0cm95KGZkLCBzeW5jLmhhbmRsZSk7DQo+ICsJfQ0KPiAr
DQo+ICsJZ2VtX2Nsb3NlKGZkLCBibyk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiAr
fQ0KPiArDQo+ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICt7DQo+ICsJaW50
IGZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ICsJaW50IHNpemUgPSAwOw0KPiAr
CWludCBidXN5ID0gMDsNCj4gKwlpbnQgcmVwcyA9IDEzOw0KPiArCWludCBuY3B1cyA9IDE7DQo+
ICsJaW50IGMsIG4sIHM7DQo+ICsNCj4gKwl3aGlsZSAoKGMgPSBnZXRvcHQoYXJnYywgYXJndiwg
InM6YjpyOmYiKSkgIT0gLTEpIHsNCj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2UgJ3MnOg0K
PiArCQkJc2l6ZSA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2Ug
J3InOg0KPiArCQkJcmVwcyA9IGF0b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwgMSkNCj4g
KwkJCQlyZXBzID0gMTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0KPiArCQkJ
bmNwdXMgPSBzeXNjb25mKF9TQ19OUFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFrOw0KPiAr
DQo+ICsJCWNhc2UgJ2InOg0KPiArCQkJYnVzeSA9IHRydWU7DQo+ICsJCQlicmVhazsNCj4gKw0K
PiArCQlkZWZhdWx0Og0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlpZiAo
c2l6ZSA9PSAwKSB7DQo+ICsJCWZvciAocyA9IDQwOTY7IHMgPD0gIE9CSkVDVF9TSVpFOyBzIDw8
PSAxKSB7DQo+ICsJCQlpZ3Rfc3RhdHNfdCBzdGF0czsNCj4gKw0KPiArCQkJaWd0X3N0YXRzX2lu
aXRfd2l0aF9zaXplKCZzdGF0cywgcmVwcyk7DQo+ICsJCQlmb3IgKG4gPSAwOyBuIDwgcmVwczsg
bisrKSB7DQo+ICsJCQkJc3RydWN0IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJdWludDY0
X3QgY291bnQgPSAwOw0KPiArDQo+ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMs
ICZzdGFydCk7DQo+ICsJCQkJZG8gew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAwMDsgYysr
KQ0KPiArCQkJCQkJdGVzdF9leGVjKGZkLCBidXN5KTsNCj4gKw0KPiArCQkJCQljb3VudCArPSBj
Ow0KPiArCQkJCQljbG9ja19nZXR0aW1lKENMT0NLX01PTk9UT05JQywNCj4gJmVuZCk7DQo+ICsJ
CQkJfSB3aGlsZSAoZW5kLnR2X3NlYyAtIHN0YXJ0LnR2X3NlYyA8IDIpOw0KPiArDQo+ICsJCQkJ
aWd0X3N0YXRzX3B1c2hfZmxvYXQoJnN0YXRzLCBjb3VudCAvDQo+IGVsYXBzZWQoJnN0YXJ0LCAm
ZW5kKSk7DQo+ICsJCQl9DQo+ICsJCQlwcmludGYoIiVmXG4iLCBpZ3Rfc3RhdHNfZ2V0X3RyaW1l
YW4oJnN0YXRzKSk7DQo+ICsJCQlpZ3Rfc3RhdHNfZmluaSgmc3RhdHMpOw0KPiArCQl9DQo+ICsJ
fSBlbHNlIHsNCj4gKwkJZG91YmxlICpzaGFyZWQ7DQo+ICsNCj4gKwkJc2hhcmVkID0gbW1hcCgw
LCA0MDk2LCBQUk9UX1dSSVRFLCBNQVBfU0hBUkVEIHwNCj4gTUFQX0FOT04sIC0xLCAwKTsNCj4g
KwkJZm9yIChuID0gMDsgbiA8IHJlcHM7IG4rKykgew0KPiArCQkJbWVtc2V0KHNoYXJlZCwgMCwg
NDA5Nik7DQo+ICsNCj4gKwkJCWlndF9mb3JrKGNoaWxkLCBuY3B1cykgew0KPiArCQkJCXN0cnVj
dCB0aW1lc3BlYyBzdGFydCwgZW5kOw0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0K
PiArCQkJCWNsb2NrX2dldHRpbWUoQ0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0KPiArCQkJCWRv
IHsNCj4gKwkJCQkJZm9yIChjID0gMDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJCXRlc3RfZXhl
YyhmZCwgYnVzeSk7DQo+ICsNCj4gKwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tfZ2V0
dGltZShDTE9DS19NT05PVE9OSUMsDQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50dl9z
ZWMgLSBzdGFydC50dl9zZWMgPCAyKTsNCj4gKw0KPiArCQkJCXNoYXJlZFtjaGlsZF0gPSBjb3Vu
dCAvIGVsYXBzZWQoJnN0YXJ0LCAmZW5kKTsNCj4gKwkJCX0NCj4gKwkJCWlndF93YWl0Y2hpbGRy
ZW4oKTsNCj4gKw0KPiArCQkJZm9yIChpbnQgY2hpbGQgPSAwOyBjaGlsZCA8IG5jcHVzOyBjaGls
ZCsrKQ0KPiArCQkJCXNoYXJlZFtuY3B1c10gKz0gc2hhcmVkW2NoaWxkXTsNCj4gKw0KPiArCQkJ
cHJpbnRmKCIlNy4zZlxuIiwgc2hhcmVkW25jcHVzXSk7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4g
KwlyZXR1cm4gMDsNCj4gK30NCj4gLS0NCj4gMi4zNC4xDQoNCg==
