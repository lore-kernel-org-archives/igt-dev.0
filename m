Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CBECEBF9B
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 11:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2437E10E1FE;
	Fri, 27 Sep 2024 11:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KX4XeoWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2566110E1FE
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727437111; x=1758973111;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3cEccqeOfgQ4IwlsuLZJNpjwU5czVGwg9ZVCYX8cOGw=;
 b=KX4XeoWPaNvXcykAQILF7I+8oXGZ64t9rZjyZeHha78y/JHqlrMDAZgm
 TY2zv6rx40IqNl7exC1biplaE5/AeBq46tDNjetzZiK3s9hfxbbI0PTkH
 JznjEzGOlvnqY43GkqQnZCwzVz1ZyQi97UNoldVDn5Ir/YuIJfOp2JshP
 7+S71tZ+7BxivAhuCyR6nrE9o4t8ky3qzn13PhZW+QNh98djNWLaFCOR0
 GD723mQzR5DBm2J/U8S2MRrCjgdB/cO2n4d1s+bwGNZdJsfzvsCCjP0fR
 k3VCkUmt8FDELq6ejUCK4tVMvGP7Jd7CCnNhUuraD0W7JnCTFSBGV8j1m Q==;
X-CSE-ConnectionGUID: Ctokfwt5TqaPeNDgYNsoAw==
X-CSE-MsgGUID: 5LvaFzTzR4uwx8MheRO+pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37716083"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="37716083"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 04:38:30 -0700
X-CSE-ConnectionGUID: V9lTa//SQyai3VlY/ePR+g==
X-CSE-MsgGUID: OWKDROAIRQq9P5vH2NNQ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77019677"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 04:38:29 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 04:38:29 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 04:38:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 04:38:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lp2Cj04u13V1CJoWe3p1qNPjWpNFQ5q8P7RwD5gS/SeQssD4xLwsgFsOzDwBpWz4YPH/fQd56CnUwJ2ngvBp6oDE4BEADMQt1C7bDFcpgc9/7DQqUi1XrD7LwfGqXQel+Wzub6yFLV1Sq0eSe5Vt5rSqN8Xo/NfffcOtd8J+0//0nkCMDeknMWXUzQDByu7A2uDbk95j/n6I7H9MyVy3ogCGKu7c4Rlv3OyFS0se1k1R5ttC1Cpo8JxaSG575Vf8Xa7WtODUTsPasTW9O//lwsnrWYmSJxW7i8+EYD05Bk2zD5/w9aw65SOSgnrjmGJLwzgAAAh8+KRJ+Y11BtVxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cEccqeOfgQ4IwlsuLZJNpjwU5czVGwg9ZVCYX8cOGw=;
 b=NitcyWB67mN3JLsFAP2d6/U1bgomyXExTDfnC5dp/T+E8y7rrlANOMU8YiCLCMX/GngbPyQxyWFByeC19/yTrhkwELCksVfyldtDbusiK7+qfAqoA+oalQcFwXFS9+cORZ59bCmCVY/mb1OOWVF9dMXtxTAJng5g5YwgvVgLuHuAW3r9lMYhU5+B13LMvfK0gpL5o5n4dZroz/IwF720DWsZtB0EOorOgA1Ulj4YD5U6AIGmiA7kBovNXdEdYghBTDY/6C9iGOj9/kCPmDCjyTI0ifb+nSpMGBlLyOlETwRpmzzrQS/zSqrH0/JmRX5U0jxyzfpslsr+a9vXw50ndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Fri, 27 Sep
 2024 11:38:26 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%7]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 11:38:25 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2] tests/intel/xe_sysfs_timeslice_duration: Add test to
 validate timeslice duration
Thread-Topic: [PATCH v2] tests/intel/xe_sysfs_timeslice_duration: Add test to
 validate timeslice duration
Thread-Index: AQHbEKcZZVdrCWT/q0+0/jYekhZJe7JrgjPA
Date: Fri, 27 Sep 2024 11:38:25 +0000
Message-ID: <MW3PR11MB47485F5F05716D076D4EA870AE6B2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240927064041.1813376-1-sai.gowtham.ch@intel.com>
In-Reply-To: <20240927064041.1813376-1-sai.gowtham.ch@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SJ0PR11MB6693:EE_
x-ms-office365-filtering-correlation-id: cde63eab-a128-4950-36fa-08dcdee8e643
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eG0vSFN6OW8xUm9HZ2dvcU5lZ0gxT3RtSG96TzJydndtTUFvT2R2WUI3ZXdY?=
 =?utf-8?B?YVl0cVQyenYrQTMvWjdSUy9XN1hTcUpHUmJidk4vY00rTGhaKyt6UU85ZEdC?=
 =?utf-8?B?QXhCLzdSMDlDczFPZ3pOaDBkRENvbkM1RXU1b0g2Wm83SFQyK1hET0syc2Zx?=
 =?utf-8?B?UnhoL3FkQ0FsWWlWczFSbXRrc1R5a3FaY0tkYnozSlRjZ3FqOTJrQmh3TWta?=
 =?utf-8?B?aXk3ZjY0NFpNYmpVSFcrbWFIc0VZZ3BLT1lzWFNZenl6Q3ZWNWhraDV0aURO?=
 =?utf-8?B?NUJuOGJFWkU3WG82QlFnR2dPQllqMVZKKy9MNlhXd1R0UlREWU1PVWtkRndz?=
 =?utf-8?B?dXhVU2lqa29ySko5NXAyT1hwem0zSnBJVEd2UXBIajF1TTBRNmZJbi9iVlZ1?=
 =?utf-8?B?WWtLalE2UVFOTHI5cFZ4WHQ1ZmpDOHFXQVJyendLS3hpTzFWazUybERtcVJQ?=
 =?utf-8?B?cnBDRC9CV2djN1ZNSTZUVitpQ2NXQzFXZXArV1BFVzFSQXVsa0p4aWkzWG8y?=
 =?utf-8?B?L2E3VmJEMlJ1d0tWRGlHWlYvUXdEMlJEZEVvNjl4ZDA0NzZNeU5KekZFOHdk?=
 =?utf-8?B?VXdKVk9BTVpaeUJVa2NkSjNBVG5pZE1vcGxWME81alMyKy9IYnYzUC9PRFJU?=
 =?utf-8?B?WHhpdDZ6RXk1MkY4Z2x2cFJjaFFXdUk2MjZZRjgzQUhZT1BRNXVRYm5kcjQ0?=
 =?utf-8?B?YUZUeHRWZkJmYzRQd0gvVkcrUnFYZG5LM3Y0NTVKVXQvMEVNRE5pWGhEVTZJ?=
 =?utf-8?B?SXRHa1lwcFgxb0J5cklXcnREek1JZkgxdEh0R01SS2syTTJOSnZPVTlRbVgv?=
 =?utf-8?B?dk5YM0hGZ20xU1VTOTQ2c2FHc1JnSlJZUkZtaTViZnBaZUprbGZkOTN3VTJy?=
 =?utf-8?B?dnB1T3VJa1FXc3Y5cGNEOGgyZngranlNOW45V3BUUEticHR4SHUxM3EwYXBX?=
 =?utf-8?B?T0xDQWIyalFDTHdTekwyMXZ1MC94SzlBNkMwQWZPMUo1TlVmTzlRMWpvNjJt?=
 =?utf-8?B?ZXZ5VzhwdSs5QmNmV2NQQnBQOUlhUjNYMUVpeXhFaGY3RlFUQXNpaE5Qbi9T?=
 =?utf-8?B?YmNvYldCU2ZlaXk1bDRUTFdTMHZDeWw1eXNzRlRCbGtFSnpyQTlRQjdIQ1hT?=
 =?utf-8?B?ZHdwaCtBUGlFY0NqejVZYW1mRy9sZU1id2tWWi9ncWZFSFdCZ1hhTmUydXhW?=
 =?utf-8?B?bEIzSDB4anNPR1RIZTZGUDZwY3VoR29CeERER3VFMEE0TWJKTDNNNXkyQ0Zx?=
 =?utf-8?B?bGdWcDE5T2ZrOVdlQ1g5cUs3emNDakpYems0R056VktjVXIrcTNyR2lwWTla?=
 =?utf-8?B?REhKM3NhNkhsRy8xMnk3K3NWZDdnSmNubDRVK3RhQUhPNW56K1h6NHp5c2ZU?=
 =?utf-8?B?ZFB4VTlUR29ZT21neERjMmVETEl3eW13dThRbmdFcEs3TCtKSWFKRWIrc1Yy?=
 =?utf-8?B?WE92Zi94cSt5bEo4Z1hTaklra0RmMFJyRjBzRy94YUtyVzluc0tFTEw2aHlV?=
 =?utf-8?B?OXJsaVRZQmRKZGg1b3lJRk43REFtSncwUzRCZ3RBeUlnRExueUNqeTg3eVBK?=
 =?utf-8?B?WW43UlF3VmhHOE9nNU1lL2VSaUxnZGlxc2hpaVhEbFBrcU5rQnVsemlHTmZC?=
 =?utf-8?B?TkJQZXZKelpYQnBEcGova05tbys5OTU2dEZXWVVBZVV5MlJWVDR2T0NVNDk1?=
 =?utf-8?B?RStFYjE4VVpCK1lEbStxWmhlMzVSYnZCNjJ3OThLWjlNN2ozbHhOaG9SODNp?=
 =?utf-8?B?VWRBb0dPRTdXcG1oMkdQTGhLa1U3eHVXQUFHZUNMeVliWXVvaTB0RTc4MUFP?=
 =?utf-8?B?NFhUbVVPYW55OFV1RkRmdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VU14c054cXpaQXZVVmhJQzd6ZEt4d3VwVnpPdUR1Q2k0bHlxeWpGRGZoclc0?=
 =?utf-8?B?U0MyS3pJcmk2dGhBN1czcG56L1JYaHlhaGczSjdERUVvQ3B5RlpsTkxRTERN?=
 =?utf-8?B?ZFQ4UVJGZ1NKcHFIRm9DZEN0dXY2NGp2bU92R1F3VkRtcmNha21IbHZVLzZj?=
 =?utf-8?B?VGNvWUVucnRSQ0FXUmFXQkt0MUlNQzEweUR0d09RVE80ZzlaVDlwSzdKNlRz?=
 =?utf-8?B?UW5ETDluUnEwNG14K2x2V2dWV1pDSE9kMXZqZlZ3QlN5Skw3TjNUa1JxdUs0?=
 =?utf-8?B?TFFITCs3R05QNFJtRUpUVHN6ZlZsTlI2YlBpeW11M0l1ak5DNXhxYXVHTGNp?=
 =?utf-8?B?YWZ3d0Z4bFdKclhsNFYwend4T2J2UnhnRFlFa3lGSWh5eUF4RnMremRtMXM3?=
 =?utf-8?B?YVZqUSt3dXR1OFZ4YkdoUDlvbDBoWWFTYXVId2RNODlZWjMzQ29yTEZqUHYr?=
 =?utf-8?B?d2RKTFdVWTBDN0lzREZmTDE2KzlxNE4xcm1Pay9XaG93UkluUVR3NXNLMUc5?=
 =?utf-8?B?bHJNYUNYd0ttSk1RQWpkaDQ2VWYxUnZwV1dzSk5za3RyaUYwNG1pbUNtcjJS?=
 =?utf-8?B?WjNDdUUyc2YxcEU3QzcrL0VSRVpRU3NwR1RFdGRYaGs3M3J6aUV1TVVlUTN3?=
 =?utf-8?B?Z0JzQldlZ1VGemh5aWN6UTk1MTJYUzMvOFNWREhyaHJwckZxcnNxdGhnSmdq?=
 =?utf-8?B?QWs3WHdpY0Q0WHFjV1loZ2I4UUtuc0pXUDJIY0I0aXdJTDlVZlFnNFB4c2tm?=
 =?utf-8?B?UFRoN0MwQ2pyVWI5QU5Xcnh1KzF2czl1YzIyb2xBYjBtUmQwLzVKdGR4L21M?=
 =?utf-8?B?c25qZW8vUTdSV3A4RGltMWVET2NpNXF3UVBuTEFES2JkNGFjSWs3Y2k3WmFK?=
 =?utf-8?B?emRHQnJiRk9LS1RhbkxYM0xxM0VpSkt6K3l4SWF6ZUFHMWZhc2txTThwNkwv?=
 =?utf-8?B?bDk4TlpaTSszV1VQSlZQSzYyZWhuanJhUDNYTWttSitOTFVwa2tWRzExSHoz?=
 =?utf-8?B?aXRIZ1VRQkZYbDN0bHBTYUdiSG9BSmJPR1hoSE9pTlBXTWd1ZmNoODEvODZ4?=
 =?utf-8?B?NytsUGxtUlBuNzJxK1ExcjNMWXNLUi9Qb2NyTTFyNGtzbEIya0dacVFKcTFK?=
 =?utf-8?B?dlhOZDRUSGlXTEk4ZTJxS1djTTJYNGlVNE1mQndZMkhhcFRHeS82R3VHT3BS?=
 =?utf-8?B?WnQrL1NhNFRsMzltN2orOXFLZUpudUlQSk8wUU1jYUN2QnZ6WndMWHErQnJB?=
 =?utf-8?B?Sm9kNkpvZDJPVFNoNVB6Mm40R3l1S05iWFlGaXN4VXFjU0IwNGlvSUZmT2dh?=
 =?utf-8?B?L3ZFMk9nWm05YVA1Q1NBbU9sZS9oNXZQci9CNkxmS0sxK2ZmcWVrT21BTlh3?=
 =?utf-8?B?cXVZZU5oSHRidUJ2QWdEMWtBUlZnL05oSFJLczJzU1dSZWY3dmpYU0JuZWM3?=
 =?utf-8?B?UHRxS3ozdmlYbndtcUQrVDY0TGlQMHdFcngyQ0pWbGxkOFlYaU1xOXNIV2xn?=
 =?utf-8?B?cHp6NjRpdDNNNE12U1JRZkZvdlhxSm9yRVcwb3ozcWg5aDNZeFlSVkIzS1BM?=
 =?utf-8?B?ZVVvblpPZzI1bkJqdWwzREI0Y0tPdWlDWDdVdjdVN0Z1WmtSZ3JlT29vdjNs?=
 =?utf-8?B?TFlKc0YxSWJ2MURUTys1TmMzSHBGUkFTMTZsNjV0dUZscmprbUxlWmR1OGtI?=
 =?utf-8?B?cGd3dlhBNjZIaEdPeHVYWHRXTjdxVWN3SGZQeU9hZWM5Nk16RkhGeVlOLzY0?=
 =?utf-8?B?Y1ZmZnFPWGJlWEVsakd6R08zUVFFZjRneDRpRDJLbG41ODB3UnZqZHFZY0Qz?=
 =?utf-8?B?MmN0QWw3bXpCcS9uZmRCRE5TNW1SS09zV3Z1SXk2dGZ2NHhRMkp3K091VlRO?=
 =?utf-8?B?Z0kzbVpJWm9KYlB6SFhPUU9MVzhla285UmttSmdNMVUzRHAvYktod0VQeUor?=
 =?utf-8?B?OGc2MytUNmgxUVdCN1c3ZkNHK2Rld0JxVkhHRzZhZC9BMjM4anJ6M1BJbzVx?=
 =?utf-8?B?TW9rV2Z1R3hGOHhGeGtId21LQzIwMWFkcE56bUZXMk15T2NSY0pVUThBZHo1?=
 =?utf-8?B?MW1hR3Q3ZFpHc2pGVE4vV1J4UiswRjZobUp0WFdWY29UbkJScm1zck9rdTZD?=
 =?utf-8?B?NHBpNzByTXhyN1dJQ3MxMUhtM0hIeENiaURjYlViV1BERDRCTE1YK09UdW96?=
 =?utf-8?B?T1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cde63eab-a128-4950-36fa-08dcdee8e643
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Sep 2024 11:38:25.6248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YHgjzx4/GjP1HvZoUqqjCHzk80Ebu2nNbwF07cbQZTW1Uwy44oySTpSoo1oMM/B+dRzB6CQOD6uDGVJaBqBiF+UbThqdHosNufeFzSeQntI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
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

TEdUTQ0KUmV2aWV3ZWQtYnk6IEphbmdhIFJhaHVsIEt1bWFyIDxqYW5nYS5yYWh1bC5rdW1hckBp
bnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2gsIFNh
aSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgU2Vw
dGVtYmVyIDI3LCAyMDI0IDEyOjExIFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZzsgQ2gsIFNhaSBHb3d0aGFtDQo+IDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+OyBLdW1h
ciwgSmFuZ2EgUmFodWwNCj4gPGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT4NCj4gU3ViamVj
dDogW1BBVENIIHYyXSB0ZXN0cy9pbnRlbC94ZV9zeXNmc190aW1lc2xpY2VfZHVyYXRpb246IEFk
ZCB0ZXN0IHRvIHZhbGlkYXRlDQo+IHRpbWVzbGljZSBkdXJhdGlvbg0KPiANCj4gRnJvbTogU2Fp
IEdvd3RoYW0gQ2ggPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4NCj4gDQo+IFRlc3Qgc3VibWl0
cyB0d28gY3R4IGFuZCB3aXRoIGRpZmZlcmVudCB0aW1lc2xpY2UgZHVyYXRpb24gdmFsdWVzLCBh
bmQgY2hlY2tzIGlmDQo+IGN0eHMgZ2V0cyBwcmVlbXB0ZWQgd2l0aGluIGdpdmVuIHRpbWVzbGlj
ZSBkdXJhdGlvbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhaSBHb3d0aGFtIENoIDxzYWkuZ293
dGhhbS5jaEBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfc3lzZnNfdGltZXNs
aWNlX2R1cmF0aW9uLmMgfCAxODcgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgdGVzdHMvbWVz
b24uYnVpbGQgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAxODggaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2ludGVs
L3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwveGVfc3lzZnNfdGltZXNsaWNlX2R1cmF0aW9uLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9z
eXNmc190aW1lc2xpY2VfZHVyYXRpb24uYw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRl
eCAwMDAwMDAwMDAuLjcyZWMyZDI3Mw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbi5jDQo+IEBAIC0wLDAgKzEsMTg3IEBADQo+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ICsvKg0KPiArICogQ29weXJpZ2h0
IMKpIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsvKioNCj4gKyAqIFRF
U1Q6IHN5c2ZzIHRpbWVzbGljZSBkdXJhdGlvbg0KPiArICogQ2F0ZWdvcnk6IENvcmUNCj4gKyAq
IE1lZ2EgZmVhdHVyZTogU3lzTWFuDQo+ICsgKiBTdWItY2F0ZWdvcnk6IFN5c01hbiB0ZXN0cw0K
PiArICogRnVuY3Rpb25hbGl0eTogc3lzZnMgdGltc2xpY2UgZHVyYXRpb24NCj4gKyAqIEZlYXR1
cmU6IFNNSSwgY29udGV4dA0KPiArICogVGVzdCBjYXRlZ29yeTogU3lzTWFuDQo+ICsgKg0KPiAr
ICogU1VCVEVTVDogdGltZXNsaWNlX2R1cmF0aW9uX3VzLXRpbWVvdXQNCj4gKyAqIERlc2NyaXB0
aW9uOiBUZXN0IHRvIGNoZWNrIGlmIHRoZSBleGVjdXRpb24gdGltZSBvZiBhIGN0eCBpcw0KPiAr
ICoJCXdpdGhpbiB0aGUgZ2l2ZW4gdGltc2xpY2UgZHVyYXRpb24uDQo+ICsgKiBUZXN0IGNhdGVn
b3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QNCj4gKyAqDQo+ICsgKi8NCj4gKyNpbmNsdWRlIDxmY250
bC5oPg0KPiArDQo+ICsjaW5jbHVkZSAiaWd0LmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5bmNvYmou
aCINCj4gKyNpbmNsdWRlICJpZ3Rfc3lzZnMuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9pb2N0bC5o
Ig0KPiArI2luY2x1ZGUgInhlL3hlX3NwaW4uaCINCj4gKw0KPiArI2RlZmluZSBBVFRSICJ0aW1l
c2xpY2VfZHVyYXRpb25fdXMiDQo+ICsNCj4gK3N0YXRpYyB2b2lkIHNldF90aW1lc2xpY2VfZHVy
YXRpb24oaW50IGVuZ2luZSwgdW5zaWduZWQgaW50IHZhbHVlKSB7DQo+ICsJdW5zaWduZWQgaW50
IGRlbGF5Ow0KPiArDQo+ICsJaWd0X2Fzc2VydF9sdGUoMCwgaWd0X3N5c2ZzX3ByaW50Zihlbmdp
bmUsIEFUVFIsICIldSIsIHZhbHVlKSk7DQo+ICsJaWd0X3N5c2ZzX3NjYW5mKGVuZ2luZSwgQVRU
UiwgIiV1IiwgJmRlbGF5KTsNCj4gKwlpZ3RfYXNzZXJ0X2VxKGRlbGF5LCB2YWx1ZSk7DQo+ICt9
DQo+ICsNCj4gK3N0YXRpYyB1aW50NjRfdCBfX3Rlc3RfdGltZW91dChpbnQgZmQsIGludCBlbmdp
bmUsIHVuc2lnbmVkIGludA0KPiArdGltZW91dCwgdWludDE2X3QgZ3QsIGludCBjbGFzcykgew0K
PiArCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jID0gew0KPiArCQkuaGFuZGxlID0gc3luY29ial9j
cmVhdGUoZmQsIDApLA0KPiArCQkudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfU1lOQ09CSiwNCj4g
KwkJLmZsYWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+ICsJfTsNCj4gKw0KPiArCXN0
cnVjdCBkcm1feGVfZXhlYyBleGVjID0gew0KPiArCQkubnVtX2JhdGNoX2J1ZmZlciA9IDEsDQo+
ICsJCS5udW1fc3luY3MgPSAxLA0KPiArCQkuc3luY3MgPSB0b191c2VyX3BvaW50ZXIoJnN5bmMp
LA0KPiArCX07DQo+ICsJc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSA9
IE5VTEwsICpfaHdlOw0KPiArCXVpbnQzMl90IGV4ZWNfcXVldWVzWzJdOw0KPiArCXVpbnQzMl90
IHZtWzJdOw0KPiArCXVpbnQzMl90IGJvWzJdOw0KPiArCXNpemVfdCBib19zaXplOw0KPiArCXN0
cnVjdCB4ZV9zcGluICpzcGluWzJdOw0KPiArCXN0cnVjdCB0aW1lc3BlYyB0cyA9IHt9Ow0KPiAr
CXVpbnQ2NF90IGVsYXBzZWQ7DQo+ICsJdWludDY0X3QgYWRkcjEgPSAweDFhMDAwMCwgYWRkcjIg
PSAweDEwMDAwMDsNCj4gKw0KPiArCXhlX2Zvcl9lYWNoX2VuZ2luZShmZCwgX2h3ZSkNCj4gKwkJ
aWYgKF9od2UtPmVuZ2luZV9jbGFzcyA9PSBjbGFzcyAmJiBfaHdlLT5ndF9pZCA9PSBndCkNCj4g
KwkJCWh3ZSA9IF9od2U7DQo+ICsJaWYgKCFod2UpDQo+ICsJCXJldHVybiAtMTsNCj4gKw0KPiAr
CS8qIHNldCB0aW1lc2xpY2UgZHVyYXRpb24qLw0KPiArCXNldF90aW1lc2xpY2VfZHVyYXRpb24o
ZW5naW5lLCB0aW1lb3V0KTsNCj4gKwl2bVswXSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7DQo+
ICsJdm1bMV0gPSB4ZV92bV9jcmVhdGUoZmQsIDAsIDApOw0KPiArCWV4ZWNfcXVldWVzWzBdID0g
eGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtWzBdLCBod2UsIDApOw0KPiArCWV4ZWNfcXVldWVz
WzFdID0geGVfZXhlY19xdWV1ZV9jcmVhdGUoZmQsIHZtWzFdLCBod2UsIDApOw0KPiArCWJvX3Np
emUgPSB4ZV9iYl9zaXplKGZkLCBzaXplb2YoKnNwaW4pKTsNCj4gKwlib1swXSA9IHhlX2JvX2Ny
ZWF0ZShmZCwgdm1bMF0sIGJvX3NpemUsIHZyYW1faWZfcG9zc2libGUoZmQsIDApLCAwKTsNCj4g
KwlzcGluWzBdID0geGVfYm9fbWFwKGZkLCBib1swXSwgYm9fc2l6ZSk7DQo+ICsJeGVfdm1fYmlu
ZF9hc3luYyhmZCwgdm1bMF0sIDAsIGJvWzBdLCAwLCBhZGRyMSwgYm9fc2l6ZSwgJnN5bmMsIDEp
Ow0KPiArCXhlX3NwaW5faW5pdF9vcHRzKHNwaW5bMF0sIC5hZGRyID0gYWRkcjEsIC5wcmVlbXB0
ID0gZmFsc2UpOw0KPiArCWV4ZWMuYWRkcmVzcyA9IGFkZHIxOw0KPiArCWV4ZWMuZXhlY19xdWV1
ZV9pZCA9IGV4ZWNfcXVldWVzWzBdOw0KPiArCXhlX2V4ZWMoZmQsICZleGVjKTsNCj4gKwl4ZV9z
cGluX3dhaXRfc3RhcnRlZChzcGluWzBdKTsNCj4gKw0KPiArCWJvWzFdID0geGVfYm9fY3JlYXRl
KGZkLCB2bVsxXSwgYm9fc2l6ZSwgdnJhbV9pZl9wb3NzaWJsZShmZCwgMCksIDApOw0KPiArCXNw
aW5bMV0gPSB4ZV9ib19tYXAoZmQsIGJvWzFdLCBib19zaXplKTsNCj4gKwl4ZV92bV9iaW5kX3N5
bmMoZmQsIHZtWzFdLCBib1sxXSwgMCwgYWRkcjIsIGJvX3NpemUpOw0KPiArCXhlX3NwaW5faW5p
dF9vcHRzKHNwaW5bMV0sIC5hZGRyID0gYWRkcjIpOw0KPiArCWV4ZWMuYWRkcmVzcyA9IGFkZHIy
Ow0KPiArCWV4ZWMuZXhlY19xdWV1ZV9pZCA9IGV4ZWNfcXVldWVzWzFdOw0KPiArCWlndF9uc2Vj
X2VsYXBzZWQoJnRzKTsNCj4gKwl4ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsJeGVfc3Bpbl93YWl0
X3N0YXJ0ZWQoc3BpblsxXSk7DQo+ICsJZWxhcHNlZCA9IGlndF9uc2VjX2VsYXBzZWQoJnRzKTsN
Cj4gKwl4ZV9zcGluX2VuZChzcGluWzFdKTsNCj4gKw0KPiArCXhlX3ZtX3VuYmluZF9hc3luYyhm
ZCwgdm1bMF0sIDAsIDAsIGFkZHIxLCBib19zaXplLCAmc3luYywgMSk7DQo+ICsJaWd0X2Fzc2Vy
dChzeW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwgSU5UNjRfTUFYLCAwLCBOVUxMKSk7
DQo+ICsNCj4gKwl4ZV9zcGluX2VuZChzcGluWzBdKTsNCj4gKwl4ZV92bV91bmJpbmRfc3luYyhm
ZCwgdm1bMV0sIDAsIGFkZHIyLCBib19zaXplKTsNCj4gKwlzeW5jb2JqX2Rlc3Ryb3koZmQsIHN5
bmMuaGFuZGxlKTsNCj4gKw0KPiArCXhlX2V4ZWNfcXVldWVfZGVzdHJveShmZCwgZXhlY19xdWV1
ZXNbMF0pOw0KPiArCXhlX3ZtX2Rlc3Ryb3koZmQsIHZtWzBdKTsNCj4gKwl4ZV9leGVjX3F1ZXVl
X2Rlc3Ryb3koZmQsIGV4ZWNfcXVldWVzWzFdKTsNCj4gKwl4ZV92bV9kZXN0cm95KGZkLCB2bVsx
XSk7DQo+ICsNCj4gKwlyZXR1cm4gZWxhcHNlZDsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQg
dGVzdF90aW1lb3V0KGludCBmZCwgaW50IGVuZ2luZSwgY29uc3QgY2hhciAqKnByb3BlcnR5LA0K
PiArdWludDE2X3QgY2xhc3MsIGludCBndCkgew0KPiArCXVpbnQ2NF90IGRlbGF5c1tdID0geyAx
MDAwLCA1MDAwMCwgMTAwMDAwLCA1MDAwMDAgfTsNCj4gKwl1bnNpZ25lZCBpbnQgc2F2ZWQ7DQo+
ICsJdWludDY0X3QgZWxhcHNlZDsNCj4gKwl1aW50NjRfdCBlcHNpbG9uOw0KPiArDQo+ICsJaWd0
X3JlcXVpcmUoaWd0X3N5c2ZzX3ByaW50ZihlbmdpbmUsICJwcmVlbXB0X3RpbWVvdXRfdXMiLCAi
JXUiLCAxKSA9PQ0KPiAxKTsNCj4gKwlpZ3RfYXNzZXJ0KGlndF9zeXNmc19zY2FuZihlbmdpbmUs
IHByb3BlcnR5WzBdLCAiJXUiLCAmc2F2ZWQpID09IDEpOw0KPiArCWlndF9kZWJ1ZygiSW5pdGlh
bCAlczoldVxuIiwgcHJvcGVydHlbMF0sIHNhdmVkKTsNCj4gKw0KPiArCWVsYXBzZWQgPSBfX3Rl
c3RfdGltZW91dChmZCwgZW5naW5lLCAxMDAwLCBndCwgY2xhc3MpOw0KPiArCWVwc2lsb24gPSAy
ICogZWxhcHNlZCAvIDEwMDA7DQo+ICsJaWYgKGVwc2lsb24gPCA1MDAwMCkNCj4gKwkJZXBzaWxv
biA9IDUwMDAwOw0KPiArCWlndF9pbmZvKCJNaW5pbXVtIHRpbWVvdXQgbWVhc3VyZWQgYXMgJS4z
ZnVzOyBzZXR0aW5nIGVycm9yIHRocmVzaG9sZA0KPiB0byAlIiBQUklkNjQgInVzXG4iLA0KPiAr
DQo+IAllbGFwc2VkICogMWUtMywgZXBzaWxvbik7DQo+ICsJaWd0X3JlcXVpcmUoZXBzaWxvbiA8
IDEwMDAwMDAwKTsNCj4gKw0KPiArCWZvciAoaW50IGkgPSAwOyBpIDwgQVJSQVlfU0laRShkZWxh
eXMpOyBpKyspIHsNCj4gKwkJZWxhcHNlZCA9IF9fdGVzdF90aW1lb3V0KGZkLCBlbmdpbmUsIGRl
bGF5c1tpXSwgZ3QsIGNsYXNzKTsNCj4gKwkJaWd0X2luZm8oIiVzOiVsZCwgZWxhcHNlZD0lLjNm
dXNcbiIsDQo+ICsJCQkJcHJvcGVydHlbMF0sIGRlbGF5c1tpXSwgZWxhcHNlZCAqIDFlLTMpOw0K
PiArCQlpZ3RfYXNzZXJ0X2YoZWxhcHNlZCAvIDEwMDAgIDwgZGVsYXlzW2ldICsgZXBzaWxvbiwN
Cj4gKwkJCQkiVGltZXNsaWNlIGV4Y2VlZGVkIHJlcXVlc3QhIVxuIik7DQo+ICsJfQ0KPiArDQo+
ICsJc2V0X3RpbWVzbGljZV9kdXJhdGlvbihlbmdpbmUsIHNhdmVkKTsgfQ0KPiArDQo+ICtpZ3Rf
bWFpbg0KPiArew0KPiArCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgew0KPiArCQljb25zdCBjaGFyICpu
YW1lOw0KPiArCQl2b2lkICgqZm4pKGludCwgaW50LCBjb25zdCBjaGFyICoqLCB1aW50MTZfdCwg
aW50KTsNCj4gKwl9IHRlc3RzW10gPSB7DQo+ICsJCXsgInRpbWVvdXQiLCB0ZXN0X3RpbWVvdXQg
fSwNCj4gKwkJeyB9DQo+ICsJfTsNCj4gKwljb25zdCBjaGFyICpwcm9wZXJ0eVtdWzNdID0geyB7
InRpbWVzbGljZV9kdXJhdGlvbl91cyIsDQo+ICsJCQkJICAgICAgICJ0aW1lc2xpY2VfZHVyYXRp
b25fbWluIiwNCj4gKwkJCQkgICAgICAgInRpbWVzbGljZV9kdXJhdGlvbl9tYXgifSwgfTsNCj4g
KwlpbnQgY291bnQgPSBzaXplb2YocHJvcGVydHkpIC8gc2l6ZW9mKHByb3BlcnR5WzBdKTsNCj4g
KwlpbnQgZmQgPSAtMSwgc3lzX2ZkLCBndDsNCj4gKwlpbnQgZW5naW5lc19mZCA9IC0xLCBndF9m
ZCA9IC0xOw0KPiArDQo+ICsJaWd0X2ZpeHR1cmUgew0KPiArCQlmZCA9IGRybV9vcGVuX2RyaXZl
cihEUklWRVJfWEUpOw0KPiArDQo+ICsJCXN5c19mZCA9IGlndF9zeXNmc19vcGVuKGZkKTsNCj4g
KwkJaWd0X3JlcXVpcmUoc3lzX2ZkICE9IC0xKTsNCj4gKwkJY2xvc2Uoc3lzX2ZkKTsNCj4gKwl9
DQo+ICsNCj4gKwlmb3IgKGludCBpID0gMDsgaSA8IGNvdW50OyBpKyspIHsNCj4gKwkJZm9yICh0
eXBlb2YoKnRlc3RzKSAqdCA9IHRlc3RzOyB0LT5uYW1lOyB0KyspIHsNCj4gKwkJCWlndF9zdWJ0
ZXN0X3dpdGhfZHluYW1pY19mKCIlcy0lcyIsIHByb3BlcnR5W2ldWzBdLCB0LQ0KPiA+bmFtZSkg
ew0KPiArCQkJCXhlX2Zvcl9lYWNoX2d0KGZkLCBndCkgew0KPiArCQkJCQlndF9mZCA9IHhlX3N5
c2ZzX2d0X29wZW4oZmQsIGd0KTsNCj4gKwkJCQkJaWd0X3JlcXVpcmUoZ3RfZmQgIT0gLTEpOw0K
PiArCQkJCQllbmdpbmVzX2ZkID0gb3BlbmF0KGd0X2ZkLCAiZW5naW5lcyIsDQo+IE9fUkRPTkxZ
KTsNCj4gKwkJCQkJaWd0X3JlcXVpcmUoZW5naW5lc19mZCAhPSAtMSk7DQo+ICsJCQkJCWlndF9z
eXNmc19lbmdpbmVzKGZkLCBlbmdpbmVzX2ZkLCBndCwgMSwNCj4gcHJvcGVydHlbaV0sDQo+ICsN
Cj4gCSB0LT5mbik7DQo+ICsJCQkJCWNsb3NlKGVuZ2luZXNfZmQpOw0KPiArCQkJCQljbG9zZShn
dF9mZCk7DQo+ICsJCQkJfQ0KPiArCQkJfQ0KPiArCQl9DQo+ICsJfQ0KPiArCWlndF9maXh0dXJl
IHsNCj4gKwkJZHJtX2Nsb3NlX2RyaXZlcihmZCk7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICsNCj4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQgaW5kZXgg
ZTVkODg1MmYzLi42MmJkZTM1M2INCj4gMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL21lc29uLmJ1aWxk
DQo+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+IEBAIC0zMTYsNiArMzE2LDcgQEAgaW50ZWxf
eGVfcHJvZ3MgPSBbDQo+ICAJJ3hlX3N5c2ZzX2RlZmF1bHRzJywNCj4gIAkneGVfc3lzZnNfcHJl
ZW1wdF90aW1lb3V0JywNCj4gIAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCj4gKyAgICAgICAgJ3hl
X3N5c2ZzX3RpbWVzbGljZV9kdXJhdGlvbicsDQo+ICBdDQo+IA0KPiAgaW50ZWxfeGVfZXVkZWJ1
Z19wcm9ncyA9IFsNCj4gLS0NCj4gMi4yNS4xDQoNCg==
