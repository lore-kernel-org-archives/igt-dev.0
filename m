Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871EECCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 10:11:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EDA10E298;
	Mon, 10 Nov 2025 10:11:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nfK8YA4Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876C710E298
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762769497; x=1794305497;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=VAMJeidkmKbrP/RzCl31n9K/3+BJcWcQ9vzDRQ/SLMQ=;
 b=nfK8YA4YksLyPdscGSLHG7KJk18/JQD7naYDhG9vtRWjFhNz4ruWCQxB
 825odEYqxSTYjEYsTK3DEE6VdtxvAFQBpWnrkzBjnRiGmV2lgXmWfQruG
 4RJKhazPyBxXNnFKFWeK0hXxmIYwMdtuEEvDLSiYGZH24kn6Q+xtefaAl
 tArac46bBy9ct2a5JzocgzzHRFt1N2XtymRA/5QhYu9JYxkOyaVwV8Sqm
 iGMqw82ax729RIDzG6yRhRz4q9dkR3lPNlJNr+ZhTMrd9F7aBs+6PqwUH
 gdqx9Evuwk7eKZL5rhhaybcP6cDkfnM1e8h686J7bfuGBHT1zfLzTVqjp g==;
X-CSE-ConnectionGUID: vpMTJgMQSIS4eVtDZauV5g==
X-CSE-MsgGUID: 8rTn/B+FSRafzZ7+Un6apw==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64972994"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64972994"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 02:11:36 -0800
X-CSE-ConnectionGUID: 72M22StRSdibgAUFr6yeqA==
X-CSE-MsgGUID: jvRksSUDT6G498SOhXsgbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="212033362"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 02:11:34 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 02:11:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 02:11:34 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 02:11:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOF7LyQ183g+9bo68ZuMw0/HQ4uai7dunXX7z30Ruvr5kUG4ebrNMdejiC25q1tZYvu+qh9ZxbOer4SkAy8++SG305J1MRQoF4owJ+YnZuB62SbMb6dXY/d3XkDtkMInVh07d0T7aQmpfqsgfYVKaAzVJzzWDVwQc/q6SFnNCQaYkipbZCZeygry56R7HWp6UHQy+I3Aw1ITC6zwRw2OrNuiRcrdStLwVcJgkUYOwvU1MzKGe9PWV/ip1+zuzjYQZScvfh1k1fZCuzihBYyEmRfw0D3hh+aOlej4RWhePh02J+brdEl0dIkRBLsgrxoskztnanzjhYoF45RhQeb6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAMJeidkmKbrP/RzCl31n9K/3+BJcWcQ9vzDRQ/SLMQ=;
 b=OfozyOFP5zDARY+vMiYub3Lbow22SWCWmXOEIcYVxtD+oQYAlL6hjwzTyDlg0e7lPb0CmwxBqeuMdK+MpdK9FD51emvS6Hh4UYWWBRCgdhxQFtNf0cf0b5GQJgv2HDkEFJf+2fVu/rZy1n9flookXdtwpwjOpQrjQ7Mf4Fiqus7u4OYI8PrGWmJxSZVQHoMGs9C2llfP28C4FL8/XJq1bigt8t67/XKgwvCP1O0vMNa+yr9vz06bAygQbZcQI7aklarzx+mwnM1FUnUGW9Fu1xBAbj8yv6UaVNIItoaADMe/bnG4scovn/spKoi5BtC+C4vSSi1ZfwW3Vmn/9+FW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS0PR11MB7650.namprd11.prod.outlook.com (2603:10b6:8:151::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 10:11:30 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 10:11:30 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v4] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Topic: [PATCH i-g-t v4] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Index: AQHcTwCDIDws4uVI6US+cqWMVPOEY7TrY9eAgABSMzA=
Date: Mon, 10 Nov 2025 10:11:30 +0000
Message-ID: <PH7PR11MB67962DD4971E75DCCBC49753E5CEA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20251027061057.2996401-1-sowmiya.s@intel.com>
 <20251106095208.3051901-1-sowmiya.s@intel.com>
 <7ff2e650-032b-41af-8206-008f48061dbb@intel.com>
In-Reply-To: <7ff2e650-032b-41af-8206-008f48061dbb@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS0PR11MB7650:EE_
x-ms-office365-filtering-correlation-id: 387ed546-b1cc-40b3-147d-08de204184aa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?MmwwZElwWGZGc3ZLTXdrbWdzRU9Fa0UvYnI5OXVlM29lQW9OL2oyQ2kxQ2JK?=
 =?utf-8?B?T0VYVW14NmhOckZtRERTZnVmNUlueGRtbElmMHduSXpRSHV3ektJYkVCZE94?=
 =?utf-8?B?bUFvMXgzSlNSMm9VRTRHU2ZzZlo4MHNud1U4ZHZVRWxGZU9jTStUbWo4R2tn?=
 =?utf-8?B?SWtwa1N3eVlFSGxkUEFra0dnK2ZtRVdneStMMFFadmpHSXZZRTNHb3RwbFFW?=
 =?utf-8?B?M00yeXAwM3RxR1Q0QWhEdFV4UXhKMUNYdGdkU2RsSGFwVW5hOVBvNW9lb2lX?=
 =?utf-8?B?OUEyUU81U3RvRzVlaTVNMHVsYlFPdFhFYUxJeGl6OWN4dHpBMk9nKzdiOG1y?=
 =?utf-8?B?enRaL25nUm02WTR6emo0T0NDSzNSWDZyOVVKaFFaOHdoM1ZJSCtJRFBvMnpT?=
 =?utf-8?B?SVFMRzRoRjc4NVJ3RmluVDlwcFFqY1A5Y1pJSEZ5UFd2WGFPYVR4ZFcxeVJl?=
 =?utf-8?B?OWNjZ1BXZkdxcU94SVJjbGsvRG54bFA5dC9QWmFkYk5uQ0Q2UzdLbFYreXdm?=
 =?utf-8?B?M0wxTHk5TEJ1WmpDQzFaSk1SZ3IzTzZIUnpPMURmeWlrdzNnNHZxUHBTR0pM?=
 =?utf-8?B?MTNKNHlNbmlPQklVYWsxR0ZKL2ZUeEsvckJvYTZtRFlGNWw2WHdGeWxVZWl3?=
 =?utf-8?B?QVlRVExkcFZOVm9TbVBleWE1M0FGaFMwdngrVmlZeS9pOElLSlUvSnY3eGdO?=
 =?utf-8?B?eHl5UHZUdVJ6ZzNuaXpBakpPSTV3NytMQmRzUE5QK3dxYWVpWjJ0SW4ya2RU?=
 =?utf-8?B?cXNPNURyUTgzNVZEQlJQdTU0RE82ZmlTNGt3T0xOT0RSK1RWMDVzQ0VOUmtE?=
 =?utf-8?B?SFVOendnT1RPUDlSbjdsM2h1RjZndHF1eGdaZmZRUDVkd1VoRnJCU0JkZkxD?=
 =?utf-8?B?LzA3RkFHUGF1eGpiM3ZHV3lFSnVqdmt2R2wraGlaRGk2cWZFRDZRRUtobW1G?=
 =?utf-8?B?cEF5VFloaUZUZUdqcDk3N0RzNktKQ1FEQjR1MW5tY2ZMbE5wM0YrWlBVeVow?=
 =?utf-8?B?a1JJV2djZGZkOFMzcGs4OGxkVkRBOVdObEcxU0tWSnNaNG5tNUdjNy9tUHZj?=
 =?utf-8?B?aUhPbEVndUVUNW5mT1NQOEExdjBDa0pTVVVPbmZVbkkvVUxMWFROWS9SWDVz?=
 =?utf-8?B?QzZWR3RYNEc4SmR2OEp4aW9qck9mbzVSblI2M1g0K0tDRXkwSVJsUzErVjBi?=
 =?utf-8?B?L3pwVis4UUZaZzhnMGUyS1BoYU5mWklZeHZxK2hTdlQ4bC9TSHdXY3JXWko5?=
 =?utf-8?B?TFRheTU5bWFJdDJ3cE1sakFLQ29qVFJFUGMxSXBuWGZwSkUzMzJuWTVLcUMw?=
 =?utf-8?B?Y3VERkRpSksxOFRTbCsvek5Hdzl1MjNROHI5Nlk0TERQejYzSkdqdkRKc1Zh?=
 =?utf-8?B?U1NYQllOdEwrS1FoSVFHeFdBMjhHdzNkUEhpbWx4REFLWHJNMVFjTWplZHgr?=
 =?utf-8?B?Y2xpT1JiTGNFN29WWXZxTDhlM3o4MTU0VmE0bFRmYUtPSVgyckE4L2hCZ252?=
 =?utf-8?B?Rkx6bGtOdmJ5WHF5MGR2YkM3VUlydzZGVHFlT3JtVnF3WTJrVC9zRUVqUmRZ?=
 =?utf-8?B?ZnpxalQvb3NZNkpTdHNEQlk5WEpsaWFTM3FxdUNQR3hWaU80RXRCdHl4bklX?=
 =?utf-8?B?bi9yb3lpWVZwdlVZTU1NYnF6L1NDKzhFU2lGY2ZWRktFVXZUTTNQQTNEUEU3?=
 =?utf-8?B?a1lVdFI1UFg3Zmx4L1ZzUXZndDZTNmJlYWNaTHlSVzVxY2hIYmFTSkFlRzdS?=
 =?utf-8?B?V2Y1dDZma3hldTBQTEVVU0pTeEwybmZFRHdacVRmUGV2dVVaSUxZdEg2T2pX?=
 =?utf-8?B?SjkxZlN2aGN6Q0xPM3F6dEFtdVlrUXU3eXlkQXY4VnpOcTZYY0hiMTFUbG5D?=
 =?utf-8?B?Vmd4UkY1VkFOTzEyZ2docll5cHVhOC9hY1JMcmtVS1ZBUFU0TlBmbXgwaWZR?=
 =?utf-8?B?R21jRUM4b1pDL2VGVXAxcGlhbzJpUXgzOGlWd3B5THFLZGNRYktqdlAxL2kx?=
 =?utf-8?B?eE5ZZ1MzUFBMS0lvMHBoTVhJcFJZdk1uRDRLRHM1T1pOZWNZcTR6ZkVENC9B?=
 =?utf-8?Q?BOEbMG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzErWWp2SHZocVRndWladnEvL0ZvRHBLRmxYNERyMnFPNW9sMWVhNS9lbHFJ?=
 =?utf-8?B?ZmdoRWlscVZIRlJxTnpXWDdCTHBiR2JiRGJkRDlLWTlYOEJjRUt4WmdYUDVL?=
 =?utf-8?B?dFV0bVhIc2NJTnBoOGw2TVNMT3NWdE5YSmxUMTRrOFREdE0zK05TU25kMEZM?=
 =?utf-8?B?RVlEcElhaUZIRDdiSHhHbXBvRWpsQW53anl6TFh3TFAxRUVkZFZVN1dYWGlP?=
 =?utf-8?B?dmhvRlh2dTZtT091c1EraE45TWt6d0hadnZXbkY3N095NlRKOVd4bDZHZjhD?=
 =?utf-8?B?Y0xHZ0Jab0JKV3RrVS8yQ1NOQ2F6ZG1zRGNJWEZsWnRtcDhXRXVOakNLZ2lZ?=
 =?utf-8?B?UVFoZnBKUnF3SUVpQlk2NGNoVHVZVWh6SU9GZjhYSmhHTFh0ems3ekh6Sm9D?=
 =?utf-8?B?S0dCOUxrZnZHb3BwOGJ6RzhMa2s3aTQxNnFxWlorbkdkYlBwY3JCTGpwdncz?=
 =?utf-8?B?L2pHWWU2V2xQV09Rb2RkUGZTdHB0QXBGbGRrZTN1S0dndkxzendYTEs0M0pq?=
 =?utf-8?B?NGppSTJSY3hjdTVja2graUw0WWJDMWZ6d1dMQzJjMFJZeU1BTFY3WWZVYVA2?=
 =?utf-8?B?YUJGM1FPd0xjUTRMQjZmZC9lbEhFQnpjRmZkZ0lDc04rWk40UHltNUVVWEQr?=
 =?utf-8?B?TUgyR1JzS0s0NTVSc1pPanNOdDBJWHZOM0xkRWU0QW84SDRVZG9DSCs2VHdR?=
 =?utf-8?B?Sm5ZWDNBZGlJc3lpemtUOUhycVo2MndDWGFXR2czZ1pnTHJ4MllSZTcyV1Zr?=
 =?utf-8?B?M2Z1NDVXSEdWR2VSMWRwV1lsdDVxTXcyMkk1TnQyUGp5c1lrYU1UQmY0c2Iz?=
 =?utf-8?B?aDg5WVpzRS9Ha0p0TjJUMDdMRGRPa0l6ZnlDSmJkYVM5ckwrcE1tU3dhODhx?=
 =?utf-8?B?QlUyV1BJUGRMVU5oQ2tUU3plSUdGSVhidzN2TldZeG90NVplRzEyRDlXZ1ox?=
 =?utf-8?B?K3NhU2hTWk1ZU041bW1BcFA5bk4zVy9Bb0dCRDdtTjY4RUx2YW8xdFpyb3Nm?=
 =?utf-8?B?aWNUN3IxdTl1Tmk5SWZST3ltTFZsdUFLdmp1cm10WHNVdmo3WXVHSmc5c0Ix?=
 =?utf-8?B?Um9IZFZWUWluK1U2UGtjS2J1Y0VsWXdmUGJWNjFzcCs4K25QS3FJaTUzbFBi?=
 =?utf-8?B?VVZZa2xkYTU0YnBWT09pZi9OdFN4K1l4ZDl4L0ZKNXRNQXNhRVBUUGVleVpH?=
 =?utf-8?B?TzVvd2RnNmE4RExzWVpvMTJRM1VOSUFvcFExVVdjSXVDMVJxbTIycit3NitR?=
 =?utf-8?B?T3hYcVg4Q1FucFRwNlNTNHNtVlZOZkw1Yk8vQmQ2VldETU1JRWMyQ1lJWnNz?=
 =?utf-8?B?VEpOSzgrSXAxYmxtRCt3VDNOVWVKbGk4SWxvcEN3YnErbTBucUFteFExNjZ1?=
 =?utf-8?B?akQxeTRCdTVaTWx5NWxZc1JpeGNNcS9xZkhlZ0s3VTQyc0dLN3N0YzBsb0Nk?=
 =?utf-8?B?SFhFY1pJOU1tRmFaZmlPS214bnNZTVlhaFlUaU9PMU5ZWUpXZU1KUnZtbTFX?=
 =?utf-8?B?Z3gzUUhHenhHTnJQMTQ1T05MbTVYTmpDOWk3THh5T1VRbExOcXhaZWlBN1hn?=
 =?utf-8?B?NGk0T0Z3djR2K1FkbjBYRVM5SzZWN3MreGpGeVJBTzM3RVRqN0lwRWU2L0dn?=
 =?utf-8?B?UW1jYUlYcnpJLys3MkZRVkN4V2Z2RE4rQjVEYmNxZWc4UEhGTHJDZHM4RGFP?=
 =?utf-8?B?M1hzQmVodTlKUFRrRDlqeGJKRy84eFFLQ0dNdWZGZVBmZ1RkbEthTlBubEpq?=
 =?utf-8?B?MFluY3ZzYThmV1FIZGhFaFBVMm9YUEpXZkZxNE5hMG91S1lFZWxJNEVvS29z?=
 =?utf-8?B?NU9ONTR3MVZVTmFKMFFmaUVnQU1SNXZRMmVJY0xRTUt2TWJUUG5FSWYzRlU2?=
 =?utf-8?B?SlllcXpWbEIvS0MyVTNFUnE4eWNQWTVUdXJSeTdIalV0RzFHcjkweWVNRlda?=
 =?utf-8?B?aWNRYW9PcnZ6cGZCcWd5Q2VhTnExcnIvVUpyOGdoMEhqNThRa2gvZ1lEdkZx?=
 =?utf-8?B?eFlVMVBTMksvUDVndWw2bkV5K3RWcGV6dER6NTA0QWhyQXB0TE94WnNFckJO?=
 =?utf-8?B?ZFY5Vjd4am95V2Z0aTJySXhJbzVxREd6RWw5ZGQ0bjQxNkQ2YUozeUNidmtr?=
 =?utf-8?Q?GnQVJFam5qnPi0OdHOmjfiOws?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387ed546-b1cc-40b3-147d-08de204184aa
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 10:11:30.3320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JygDns3Ml95y9rtJr4IfqpOPxMuIXTdlEJriWsYW08TCHu1arvncSgJaOZyH7SjbgEaA/4AnsTLVEF6LsKoIJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7650
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE5hbGFkYWxhLA0K
PiBSYW1hbmFpZHUNCj4gU2VudDogMTAgTm92ZW1iZXIgMjAyNSAxMDo0NQ0KPiBUbzogaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCB2NF0g
dGVzdHMva21zX2F0b21pY190cmFuc2l0aW9uOiBBZGQgaW5mbyBtZXNzYWdlcyBmb3INCj4gc2tp
cHBlZCBzdWJ0ZXN0DQo+IA0KPiBIaSBTb3dtaXlhLA0KPiANCj4gT24gMTEvNi8yMDI1IDM6MjIg
UE0sIFNvd21peWEgUyB3cm90ZToNCj4gPiBBZGQgaW5mbyBtZXNzYWdlcyBmb3Igc3VidGVzdHMg
dGhhdCBhcmUgc2tpcHBlZCB3aXRob3V0IGhhdmluZyBwcm9wZXINCj4gPiBpbmZvIG1lc3NhZ2Vz
LiBUaGlzIHByb3ZpZGVzIGNsZWFyZXIgaW5zaWdodCBpbnRvIHRoZSByZWFzb24gZm9yDQo+ID4g
c2tpcHBpbmcuDQo+ID4NCj4gPiB2MjogQWRkIHN3aXRjaCBjYXNlIGluc3RlYWQgb2YgaWYgY29u
ZGl0aW9ucw0KPiA+ICAgICAgQWxzbyBjaGFuZ2VkIHRoZSBmbGFnIG5hbWUuDQo+ID4gdjM6IFJl
ZnJhbWVkIHRoZSBpbmZvIG1lc3NhZ2UNCj4gPiAgICAgIGNvcnJlY3RlZCBhdXRob3IgbmFtZQ0K
PiA+IHY0OiBkZWNsYXJlIGFuZCBpbml0aWFsaXplIGZsYWcgaW5zaWRlDQo+ID4gICAgICBzdWJ0
ZXN0IChwcmFuYXkpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTb3dtaXlhIFMgPHNvd21peWEu
c0BpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IFByYW5heSBTYW1hbGEgPHByYW5heS5zYW1h
bGFAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMva21zX2F0b21pY190cmFuc2l0aW9u
LmMgfCAyMSArKysrKysrKysrKysrKysrKysrLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19hdG9taWNfdHJhbnNpdGlvbi5jDQo+ID4gYi90ZXN0cy9rbXNfYXRvbWljX3RyYW5zaXRp
b24uYyBpbmRleCA0MTlhZmU0ZGQuLjlhNzRiNDI5NyAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9r
bXNfYXRvbWljX3RyYW5zaXRpb24uYw0KPiA+ICsrKyBiL3Rlc3RzL2ttc19hdG9taWNfdHJhbnNp
dGlvbi5jDQo+ID4gQEAgLTEyMTYsNiArMTIxNiw3IEBAIGlndF9tYWluX2FyZ3MoIiIsIGxvbmdf
b3B0cywgaGVscF9zdHIsDQo+ID4gb3B0X2hhbmRsZXIsICZkYXRhKQ0KPiA+DQo+ID4gICAJCWln
dF9kZXNjcmliZSh0cmFuc2l0aW9uX3Rlc3RzW2ldLmRlc2MpOw0KPiA+ICAgCQlpZ3Rfc3VidGVz
dF93aXRoX2R5bmFtaWNfZigiJXMiLCB0cmFuc2l0aW9uX3Rlc3RzW2ldLm5hbWUpIHsNCj4gPiAr
CQkJYm9vbCBpbmZvX2ZsYWcgPSBmYWxzZTsNCj4gPiAgIAkJCXBpcGVfY291bnQgPSAwOw0KPiA+
DQo+ID4gICAJCQlmb3JfZWFjaF9waXBlX3dpdGhfdmFsaWRfb3V0cHV0KCZkYXRhLmRpc3BsYXks
IHBpcGUsDQo+IG91dHB1dCkgeyBAQA0KPiA+IC0xMjI1LDEyICsxMjI2LDE2IEBAIGlndF9tYWlu
X2FyZ3MoIiIsIGxvbmdfb3B0cywgaGVscF9zdHIsIG9wdF9oYW5kbGVyLA0KPiAmZGF0YSkNCj4g
PiAgIAkJCQkgKiBwYW5lbHMgd2l0aCBsb25nIHBvd2VyIGN5Y2xlIGRlbGF5cy4NCj4gPiAgIAkJ
CQkgKi8NCj4gPiAgIAkJCQlpZiAoKHRyYW5zaXRpb25fdGVzdHNbaV0udHlwZSA9PQ0KPiBUUkFO
U0lUSU9OX01PREVTRVQpICYmDQo+ID4gLQkJCQkgICAgb3V0cHV0X2lzX2ludGVybmFsX3BhbmVs
KG91dHB1dCkpDQo+ID4gKwkJCQkgICAgb3V0cHV0X2lzX2ludGVybmFsX3BhbmVsKG91dHB1dCkp
IHsNCj4gPiArCQkJCQlpbmZvX2ZsYWcgPSB0cnVlOw0KPiA+ICAgCQkJCQljb250aW51ZTsNCj4g
PiArCQkJCX0NCj4gPg0KPiA+ICAgCQkJCWlmICgodHJhbnNpdGlvbl90ZXN0c1tpXS50eXBlID09
DQo+IFRSQU5TSVRJT05fTU9ERVNFVF9GQVNUKSAmJg0KPiA+IC0JCQkJICAgICFvdXRwdXRfaXNf
aW50ZXJuYWxfcGFuZWwob3V0cHV0KSkNCj4gPiArCQkJCSAgICAhb3V0cHV0X2lzX2ludGVybmFs
X3BhbmVsKG91dHB1dCkpIHsNCj4gPiArCQkJCQlpbmZvX2ZsYWcgPSB0cnVlOw0KPiA+ICAgCQkJ
CQljb250aW51ZTsNCj4gPiArCQkJCX0NCj4gPg0KPiA+ICAgCQkJCWlmIChwaXBlX2NvdW50ID09
IDIgKiBjb3VudCAmJiAhZGF0YS5leHRlbmRlZCkNCj4gPiAgIAkJCQkJYnJlYWs7DQo+ID4gQEAg
LTEyNTAsNiArMTI1NSwxOCBAQCBpZ3RfbWFpbl9hcmdzKCIiLCBsb25nX29wdHMsIGhlbHBfc3Ry
LA0KPiBvcHRfaGFuZGxlciwgJmRhdGEpDQo+ID4gICAJCQkJdGVzdF9jbGVhbnVwKCZkYXRhLCBw
aXBlLCBvdXRwdXQsDQo+ID4gICAJCQkJCSAgICAgdHJhbnNpdGlvbl90ZXN0c1tpXS5mZW5jaW5n
KTsNCj4gPiAgIAkJCX0NCj4gPiArCQkJaWYgKGluZm9fZmxhZyAmJiAhcGlwZV9jb3VudCkgew0K
PiA+ICsJCQkJc3dpdGNoICh0cmFuc2l0aW9uX3Rlc3RzW2ldLnR5cGUpIHsNCj4gPiArCQkJCWNh
c2UgVFJBTlNJVElPTl9NT0RFU0VUOg0KPiA+ICsJCQkJCWlndF9pbmZvKCJTa2lwcGluZyB0ZXN0
OiBpbnZhbGlkIGZvcg0KPiBpbnRlcm5hbCBwYW5lbFxuIik7DQo+ID4gKwkJCQkJYnJlYWs7DQo+
ID4gKwkJCQljYXNlIFRSQU5TSVRJT05fTU9ERVNFVF9GQVNUOg0KPiA+ICsJCQkJCWlndF9pbmZv
KCJTa2lwcGluZyB0ZXN0OiBpbnZhbGlkIGZvcg0KPiBleHRlcm5hbCBwYW5lbFxuIik7DQo+ID4g
KwkJCQkJYnJlYWs7DQo+ID4gKwkJCQlkZWZhdWx0Og0KPiA+ICsJCQkJCWJyZWFrOw0KPiA+ICsJ
CQkJfQ0KPiBUaGlzIGxvZ2ljIHdvbid0IHdvcmsgZm9yIG11bHRpIGRpc3BsYXkgY29uZmlnLiBD
aGVjayBhbmQgdXBkYXRlIHRoZSBsb2dpYy4NCg0KSSBkb24ndCBzZWUgYW55IGlzc3VlcyB3aXRo
IHRoZSBjdXJyZW50IGxvZ2ljLg0KRm9yIG11bHRpLWRpc3BsYXkgc2V0dXBzLCBhcyBsb25nIGFz
IGF0IGxlYXN0IG9uZSB2YWxpZCBwaXBlK291dHB1dCBjb21iaW5hdGlvbiBleGlzdHPigJR3aGV0
aGVyIGZvciBpbnRlcm5hbCBvciBleHRlcm5hbCB0ZXN0c+KAlHdlIHN1cHByZXNzIHRoZSBpbmZv
IG1lc3NhZ2UuDQpJZiBubyB2YWxpZCBjb21iaW5hdGlvbnMgYXJlIGZvdW5kLCB0aGUgcGlwZSBj
b3VudCByZW1haW5zIHplcm8gYW5kIHRoZSBmbGFnIGlzIHNldCBhY2NvcmRpbmdseS4NCkkndmUg
dmVyaWZpZWQgdGhpcyBiZWhhdmlvciB3aXRoIGludGVybmFsLCBleHRlcm5hbCwgYW5kIGNvbWJp
bmVkIGludGVybmFsK2V4dGVybmFsIHBhbmVsIGNvbmZpZ3VyYXRpb25zLg0KDQpSZWdhcmRzLA0K
U293bWl5YQ0KPiA+ICsJCQl9DQo+ID4gICAJCX0NCj4gPiAgIAl9DQo+ID4NCg==
