Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0729D29FB1
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCEA10E036;
	Thu,  4 Dec 2025 19:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HEZf0qWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D00310E036
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764875999; x=1796411999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bQG0pEn2mBWYYRnSFCINo1t2OFi7kvYRsR7IShDBQkA=;
 b=HEZf0qWsQ0+sbZkguHVnV9K/LmmT1UCil7jnUWxmLZ2c3xsP60Gy+qeP
 DRzzE1ogi0C6CZ1bZtNWF5M5mIeVW3wOEWRjk5odaVzfHEtOs9Er4MdKr
 A6TWt973+661CNBNuPjGmDjgtYv3ZUFsvFCFLmPuUT5M49LkHfa34aTHE
 1FAawe/XnPCJJS9dj3PF5EI1LLTqk9X/ONx+Es0ojpr3tW93IkGmMFRxg
 gyxUrhODQAw5JaHGSoKiipujvOzT5nYh07Yyf4arsUaF9oif7OAxalvnN
 6w85F+OAjmExkz1La/VQHmLFlyCL6X1rxX0L9AiX+GeUp6djfA6fNiCVD A==;
X-CSE-ConnectionGUID: fzeQ5F0pRme7qoLXQq64/A==
X-CSE-MsgGUID: us2oKMwyRu+v2kqPe5kzHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92386855"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="92386855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:19:57 -0800
X-CSE-ConnectionGUID: CacZG+VuQNGBCWmuC5BBlw==
X-CSE-MsgGUID: nwq41ifiTZC11iU05pCd8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194140904"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:19:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:19:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:19:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:19:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xR2FP5tsjhhciXxYiOiA1tSlfj0HCH/QoFbHkp0v36PJhJ71ohG1knv6a6Q3euggTVlFxAFDeMgCQmUwFdpGMjJ7J15lfb/ZEuTDNX1UhpOYuyicMZ3ty7hD5Qe5h2unQSMmuUTMpgk4F7fq6YkyYJkitL4T56fvJnaJ4E6ya98Ory4ORnxaSBn02U2DIoOekvUcdEd4irJ72kAs2L6UhVi9d1XCGyP6SW2w51DgYBGrCtt5Ajv/5vYwVg3lPILpknI4VmJKZF3UF0+MsrYo1UESoa7xNRqdN8uV4pRbQgNXzOgu74arC1RvfaqjRR/xAGlXvu7AMUHpHn5j66m6xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQG0pEn2mBWYYRnSFCINo1t2OFi7kvYRsR7IShDBQkA=;
 b=AcfxTPgKr0908tJZTCydqlIvQYLaWBr9JheXIMp41aj+pIE/Dn5+LDUMju2ebTjhAkx1vBPNVHfTTD5pYcgrNgGy1WoZbCQ0IliH4bhrmJSXD4MiSQ+R/HC/rwAEgnQq2c4zPS216yx/UsfRWmWrzEr9EEk4a0baXBBd4cfSWc5RgVBNkt3Yeq/BBf9z4Rph/i2BcDM/eW0tCeRUfpGWDYPcY53IZzsSxt8S5AxgYazEhHDSiWRcFT/7t/Phz+jaM/rsGY+uc3eYhxGuer0YsiPEa+qmBEr6NbkqM+3F7rP+bkOhgK6AA0sZzV1/TqiqIvRIQJWmIjOgqLzXMn78Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB7823.namprd11.prod.outlook.com (2603:10b6:208:3f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 19:19:47 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 19:19:47 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 01/19] drm-uapi/xe: Sync with Multi-Queue uapi
Thread-Topic: [PATCH v2 01/19] drm-uapi/xe: Sync with Multi-Queue uapi
Thread-Index: AQHcWpr8bqcjGLSikkauisj/PseKy7UR8LAA
Date: Thu, 4 Dec 2025 19:19:47 +0000
Message-ID: <a82e101a4dc3c5760195ce3b851c0fb82e24c3bd.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-22-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-22-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB7823:EE_
x-ms-office365-filtering-correlation-id: 10b55724-36a6-44ca-0b2a-08de336a16c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YXRjRnhyKzgrYVhnV3dHVnIwaGN6Y2dMaTZadjdWaEFJaWtMZ0hZQnJKSXky?=
 =?utf-8?B?T2FDRm9VTmNaNU5tUHcwbjR5dERpQ0MyYTNLYXpmaXljOWdqa3VKREU4bW9u?=
 =?utf-8?B?UlJuZjZhcmhYdmRtQWtzaWt0UndZd25odDVhNUVFYjA2V3R1SDdHRDZYc1Fr?=
 =?utf-8?B?VHZldWRRZFhlZ3BMamh0MlFzdDF2THlqYTB0c0hTMEI4TU1EQUtLZHZSQ0FK?=
 =?utf-8?B?TnlQT1lyWXV5dW9CeGs2akRKc21vcE16aW1tK3JMcHVjUzh1QUgrUkJYYjRz?=
 =?utf-8?B?OVR3aldINGdRdEM3Y05NeUIxYmJMcCtYcHMzYld6dzkwSGUvazNScFVFcERZ?=
 =?utf-8?B?Nk9MZkllSU9JM0JndUc4VHZzT3k3eUVNUVdDdjZWZ0lUMmI0K3Q3TmM5OS9Y?=
 =?utf-8?B?aE8ra0ttbVhMNm5LSitaQi83ZkNxaTE3VHpKLys5akdRWllDeFhzSEo3WGUv?=
 =?utf-8?B?UU1BUG1kYW4wNnVvTGx3eWNkOGlla0lRTHRDbjJUUFFnZUl1VXNmaElsVm5J?=
 =?utf-8?B?TnA0NDN3TVdlcHh3WmYzRE03bFRoSTk3NW14RHNtM2VySDJXTkVIcS8vQXBC?=
 =?utf-8?B?QnRhd2Z6cElPOVVNRjl6YXNFeHEyNjNMeUZ4dkxsRFZ3WW5ERmR2LzB0bTVK?=
 =?utf-8?B?S1hiSGRZNWY1SDFEVCtKUGNKTE16N2JDMHc3NkFKUE1SVzdTd3BZRVliWDFr?=
 =?utf-8?B?eWNyWXp1VUFHYVoyai9la05VSE5GcGZEQm8ya3V6SDlFdXE5RjhZQjdoUTVH?=
 =?utf-8?B?c09HRTYzeThIWFNRZ0VNWHZtWjd2WUQvT3ZxOFdsY3E2dXUwQllFMUZncTRU?=
 =?utf-8?B?S2xla1duNXpUQmh0dXFGYXE5MjdNNW42OTNrNkk5SWI0Z2J1cjhLMy9teGln?=
 =?utf-8?B?WElsWU9BT05CVmRXMnNJU0l1SFEzWXVuQ2JrdkhDa1VxSzFoWHlTVHB1M3lY?=
 =?utf-8?B?ZmpqN3JRQ20rcGtQamEvL2tFUC9ndmVadEJINy9aUTlrUDFVUzRTWVNqbkhU?=
 =?utf-8?B?Ums5SzRpcDR1ODlyMXZZdjhDVmVlWlNpangyczBlNWswN2FVUnFiNHg5aEUv?=
 =?utf-8?B?L0RadVd2ZWxpU0laQkVFdWJwS25vVDNuMkRad21JOGxPWUt6THN4VldUZkF4?=
 =?utf-8?B?ZTJtWmZVeVBKRHc2VlhVSHYrNy9FeWw0YTdSSHFheUN6Q1hoVTFuOTlJc2tl?=
 =?utf-8?B?OXpoZlNWMGhFVnJwUWhWcmQwS3o5WVBldmx5TFNiNXRKVENiU0EyRjYyMWd0?=
 =?utf-8?B?V1lrczVoZ2RxR2pzTWlCWjd1RTdOd1FUS0RwbVdxYks3b2NNQlNsMW1qNTI2?=
 =?utf-8?B?aEFYREV4cUxOVFFLUDhLaEc4M1d5QkI3L0tUS1hyYy9OQXRDTkxGbXkya0Ix?=
 =?utf-8?B?c25XTmwwM1I0QzZTNG5WcDBKN0ZXZWRRajFnb05udVptcFdlWDFwcFpCNXZx?=
 =?utf-8?B?V25vVExtZ0dxMGM5bEhzcUNKeTlKTXRVRmNYRnNKZVB4SXJ0V2xIVTFWVGk4?=
 =?utf-8?B?Z1lnVFgzZHRqOVJ0ZmJVSXpabXArdmJnQmk3ZU45YjZOelBLcmE2YklIcE55?=
 =?utf-8?B?UjliZHBvckRBQm9XK1RjY3hDVzlvdXFiWEcwcS9UZnUzMWFWTEN2RlFPVHlv?=
 =?utf-8?B?NkZwWjdSOUZ1QU45N05DNDI2dDh1dHhjenFEcCtJeEYrMjVteE1EenVPSU1y?=
 =?utf-8?B?ZE9wQWQ2MVFSTlYrZ3JNQnpZekRXRnlGbUhSTUI2REZwUDMrcFNBbTArOXhv?=
 =?utf-8?B?QlVjU0JieHBQb25CeFlHVndNWTMrNTlxQ2JSMFVlVXZLTFhTdmw2SnpSYmZC?=
 =?utf-8?B?TkcrTlJLR3ZPS083RzR2NTRpT2h2c0xPdEx2NmVCWXVzSFZIODd5YU44c2Vr?=
 =?utf-8?B?U0xZdy93VkRqbkg0eVRyKzdHKzFqVEJ4aktIOTRyZTNQSG04alZhY0VWZGJr?=
 =?utf-8?B?aDdWbEFGUjFJdkdvaER5eHE5TnhuSS90dWFnNWF2T3RCMFZRNDltK1FoYWtB?=
 =?utf-8?B?bTUxQmxVNnZiN1B2NnZ3ZlNPZDEyWkVOSXo0VGo1eFRsUnhvUHZYZGVWclR0?=
 =?utf-8?Q?WZ8tEK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eU5BMWhzUkFYSmZ4VTRVRlB2SytxM0IycHNTVU1IRTl4eVc3SFgzVjJRQ0Jy?=
 =?utf-8?B?MDhjUklnOE1aTEEreWkzN3pSOVplSmRTY2ZzVng1S0UrUVlkYjNHTjZYMkN6?=
 =?utf-8?B?UHFwckNaKzZQMWRnckdSSnVoVXUvWThuQUo1bEZJYVM0UmVPMnBuS2xQYVgv?=
 =?utf-8?B?QU84WlJCbUd0T2ZDYnVTN3VyK2haUEd6MXVGbnhCRE1ORmUxWC8zakdXdDVi?=
 =?utf-8?B?MUdpWFpGREhqRnZDa01QLzdpaW9BS3BWQWhtTHl6N0lrZUVjelZWb0FPdTF1?=
 =?utf-8?B?YzhuLzVNSXFEcGxQRnBRS2lHQmhJVis5b2NtU1RxN0ppMGRMZWZpNWV1TDVm?=
 =?utf-8?B?em4xMjZqZlVSN1pqZGx4b3AzRWxNOUtHdjBPRXVXelpEV0FCSGYwRzR1MThr?=
 =?utf-8?B?T3lHZ2p0Ukc5L1Z1by8rZTJhWHVMV0UvTUttalByS1JtdnR4cHZVOVliZm8r?=
 =?utf-8?B?dCtIMFdTcWc3N3VJS2hUenh1OGZEK2c1TVEvdXByY3BYZ1VLL3grMkJxamYr?=
 =?utf-8?B?RjlySWVwMS9YNVNNc2xCU0s1ZUxKZklKYS8wRXBGQ3BRMVV6V1NRSkJSemc0?=
 =?utf-8?B?T1EvNHFrWENNaHRZSnBrMlA3ZkNzanlmZGZocHJBWklDWjFtY09wT2JaamJV?=
 =?utf-8?B?bHZuc0ZqSEV2R21ERFRLY2x6Tk50V1RWbzh2KzFBUk16UUlKekdBOHQvNXB1?=
 =?utf-8?B?R2ZQWVlNdW0yTzVFQVE5S09acGxBT1M4ZmU0TVk1aGt3VU1yQnJUN0VhVlBW?=
 =?utf-8?B?UWpQVU85L0JYbjI3b09Rd1pMdUZvSE15alJGb1F3ZDlrOG5aSkVkTFR3YnJM?=
 =?utf-8?B?ZU9xOXJEVEJxeDFyb1dsYVl3b1lIWDVSVFFkMGtsb05FYkt3dHQyOWNTMnpX?=
 =?utf-8?B?NEJnYUFqbWtxd3lpWE1LQldwVFg4b0hieFFpMW9nVW50MUtHUGlENFY1MDNH?=
 =?utf-8?B?MjVKWS9BdGZ5VE5ESXFRTDZ0eVZOaFFKdmtCczlydUlaUVV1S1pFN1pmUmRB?=
 =?utf-8?B?MG9wODJ3dHpDeHVvcms3QTNZNFdZbllmNFdFVXVzNDlyWGowcW9NYU9Cd1Qx?=
 =?utf-8?B?c3RqdkVFbTdRdXVSRGp0c0RqMjFOckNQVkdSNnpHem16eGlDeU11TlFPOG16?=
 =?utf-8?B?ZURoVU5JR3pOQkErWW1ra0xwOFZOYkhXZVg3dWJqMkJZc0xaZmRNNTJTeWx4?=
 =?utf-8?B?Y2RVQ1VlbmRsMG1BcUpINEFIRUF5eE5wdTFTRUhqM1FseVlDaXZJMWpXVWFt?=
 =?utf-8?B?c3Z2dHc4UGJIOERvL0ZzVGdyT3RVd3djMmkwOGRyR2RsR1YreXUrVFRkS0gy?=
 =?utf-8?B?MEN6Y1IxSnNxR2gyaXNzc2FXTzNvcHhBTkNjUmE5b1BXT0E0UmIzT05ISHZY?=
 =?utf-8?B?d3MxNUVwNWRhbHdvb2pqUkQxT3QwZFhWMStzVkRLNHV0dGgvcjJEenNIdjRL?=
 =?utf-8?B?eUtWVHkvd0N4bW1GNnNST3Jra25GTjREem1vMTNMR203WUllZVNVUnA1R2Q3?=
 =?utf-8?B?MzNtOVB6cUNSU1ROUzlVa3FqV2pXdXM3OG5QL0dna1RXUVRtV3ljaTNCaWZo?=
 =?utf-8?B?THVhcXdSTlFTbVZyNFlWNE5ISWpPY1ZUZ01KTFExeFArN2thOE4zRlBQZnU4?=
 =?utf-8?B?NXhyTEZ6NjlNZ0Z3WUNIVTkxY2FIUVg4bk5HL2NBa2Q2dkh4ODhtajV3emky?=
 =?utf-8?B?VE5LbWFJeEExWUFDcVJHQytHQUVzM0FlcjdhSmpQTDJqTWdlWWY3VTVZZ3Fo?=
 =?utf-8?B?ZU5HdTdIbStvN2lGeUp4MExVT0ZvbmhQQ2tpd0FDLzVyUnhPOE8vVkdMcVcz?=
 =?utf-8?B?WmZDWVU0Qk9TcXUyckt3OTV2eUtqdE1zY2RoL2l2L3haWkdnWGZVK2xWZVRs?=
 =?utf-8?B?bS8yUWEwd0JUK0p1TC9NSXhHZTVOa0JrT251bVU0VmxzNHJIQmUwWE5sazBF?=
 =?utf-8?B?WDNyNXlBemFhS1g3ek85djFTc3NTNUZvWDgyOTVYcWxNVW8wdkNqcUkxdDZP?=
 =?utf-8?B?N1RuM2oxcVM1d1IzeWhWZ1lJbVNOOGQreEg2TVgvTVJvOXh4MXd3Z0hrRGZq?=
 =?utf-8?B?c0kvTkdYUy9pWjlvcnlUOEQ5dllkUXQ2RWNkTERyNVpwY1J0dmQ2V21TZHI3?=
 =?utf-8?B?TWxTbGFOTUMxSENOQ3F2bUR4eS9pMExlMGc0Z3RLQWdqUCt4a3lzQXVtdE9s?=
 =?utf-8?B?eEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FFBD2F978D67DC439BE22256DD542F18@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10b55724-36a6-44ca-0b2a-08de336a16c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:19:47.4078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UY81qX1YfY2YVy9Z8eC5mc67RJtJwdDzw8jJtwUFxfu2LlJrH31ulm6qpXHqeJQIu0xqVKycW8m5nh8RAgoSfQqjTVH8TXgX3VH4USvoeKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7823
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOg0KPiBTeW5jIGtlcm5lbCBoZWFkZXIgdG8gZ2V0IE11bHRpLVF1ZXVlIHVhcGkg
ZGVmaW5pdGlvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhDQo+IDxuaXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4NCj4gLS0tDQo+IMKg
aW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCB8IDQwDQo+ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0tdWFwaS94ZV9kcm0uaCBiL2luY2x1ZGUvZHJt
LXVhcGkveGVfZHJtLmgNCj4gaW5kZXggODlhYjU0OTM1Li5kMWNiMDhkYzcgMTAwNjQ0DQo+IC0t
LSBhL2luY2x1ZGUvZHJtLXVhcGkveGVfZHJtLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0tdWFwaS94
ZV9kcm0uaA0KPiBAQCAtMTA2LDYgKzEwNiw3IEBAIGV4dGVybiAiQyIgew0KPiDCoCNkZWZpbmUg
RFJNX1hFX09CU0VSVkFUSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDBiDQo+IMKgI2Rl
ZmluZSBEUk1fWEVfTUFEVklTRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAweDBj
DQo+IMKgI2RlZmluZSBEUk1fWEVfVk1fUVVFUllfTUVNX1JBTkdFX0FUVFJTwqDCoMKgwqDCoMKg
wqDCoDB4MGQNCj4gKyNkZWZpbmUgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZwqAweDBl
DQo+IMKgDQo+IMKgLyogTXVzdCBiZSBrZXB0IGNvbXBhY3QgLS0gbm8gaG9sZXMgKi8NCj4gwqAN
Cj4gQEAgLTEyMyw2ICsxMjQsNyBAQCBleHRlcm4gIkMiIHsNCj4gwqAjZGVmaW5lDQo+IERSTV9J
T0NUTF9YRV9PQlNFUlZBVElPTsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERSTV9JT1co
RFJNX0NPTU1BTkRfQkFTRSArDQo+IERSTV9YRV9PQlNFUlZBVElPTiwgc3RydWN0IGRybV94ZV9v
YnNlcnZhdGlvbl9wYXJhbSkNCj4gwqAjZGVmaW5lDQo+IERSTV9JT0NUTF9YRV9NQURWSVNFwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBEUk1fSU9XKERSTV9DT01NQU5EX0JB
U0UgKw0KPiBEUk1fWEVfTUFEVklTRSwgc3RydWN0IGRybV94ZV9tYWR2aXNlKQ0KPiDCoCNkZWZp
bmUNCj4gRFJNX0lPQ1RMX1hFX1ZNX1FVRVJZX01FTV9SQU5HRV9BVFRSU8KgwqBEUk1fSU9XUihE
Uk1fQ09NTUFORF9CQVNFICsNCj4gRFJNX1hFX1ZNX1FVRVJZX01FTV9SQU5HRV9BVFRSUywgc3Ry
dWN0DQo+IGRybV94ZV92bV9xdWVyeV9tZW1fcmFuZ2VfYXR0cikNCj4gKyNkZWZpbmUNCj4gRFJN
X0lPQ1RMX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZwqDCoMKgRFJNX0lPVyhEUk1fQ09NTUFO
RF9CQVNFICsNCj4gRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZLCBzdHJ1Y3QNCj4gZHJt
X3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5KQ0KPiDCoA0KPiDCoC8qKg0KPiDCoCAqIERPQzog
WGUgSU9DVEwgRXh0ZW5zaW9ucw0KPiBAQCAtMTIzMyw2ICsxMjM1LDE4IEBAIHN0cnVjdCBkcm1f
eGVfdm1fYmluZCB7DQo+IMKgICrCoMKgwqAgR2l2ZW4gdGhhdCBnb2luZyBpbnRvIGEgcG93ZXIt
c2F2aW5nIHN0YXRlIGtpbGxzIFBYUCBIV0RSTQ0KPiBzZXNzaW9ucywNCj4gwqAgKsKgwqDCoCBy
dW50aW1lIFBNIHdpbGwgYmUgYmxvY2tlZCB3aGlsZSBxdWV1ZXMgb2YgdGhpcyB0eXBlIGFyZQ0K
PiBhbGl2ZS4NCj4gwqAgKsKgwqDCoCBBbGwgUFhQIHF1ZXVlcyB3aWxsIGJlIGtpbGxlZCBpZiBh
IFBYUCBpbnZhbGlkYXRpb24gZXZlbnQNCj4gb2NjdXJzLg0KPiArICrCoCAtICVEUk1fWEVfRVhF
Q19RVUVVRV9TRVRfUFJPUEVSVFlfTVVMVElfR1JPVVAgLSBDcmVhdGUgYSBtdWx0aS0NCj4gcXVl
dWUgZ3JvdXANCj4gKyAqwqDCoMKgIG9yIGFkZCBzZWNvbmRhcnkgcXVldWVzIHRvIGEgbXVsdGkt
cXVldWUgZ3JvdXAuDQo+ICsgKsKgwqDCoCBJZiB0aGUgZXh0ZW5zaW9uJ3MgJ3ZhbHVlJyBmaWVs
ZCBoYXMNCj4gJURSTV9YRV9NVUxUSV9HUk9VUF9DUkVBVEUgZmxhZyBzZXQsDQo+ICsgKsKgwqDC
oCB0aGVuIGEgbmV3IG11bHRpLXF1ZXVlIGdyb3VwIGlzIGNyZWF0ZWQgd2l0aCB0aGlzIHF1ZXVl
IGFzIHRoZQ0KPiBwcmltYXJ5IHF1ZXVlDQo+ICsgKsKgwqDCoCAoUTApLiBPdGhlcndpc2UsIHRo
ZSBxdWV1ZSBnZXRzIGFkZGVkIHRvIHRoZSBtdWx0aS1xdWV1ZSBncm91cA0KPiB3aG9zZSBwcmlt
YXJ5DQo+ICsgKsKgwqDCoCBxdWV1ZSBpZCBpcyBzcGVjaWZpZWQgaW4gdGhlICd2YWx1ZScgZmll
bGQuDQoNCk1pc3NpbmcgZG9jdW1lbnRhdGlvbiwgYWx0aG91Z2ggY29tcGFyZWQgdG8gdGhlIG9u
ZXMgYmVsb3cgdGhpcyBpcyBtdWNoDQpsZXNzIGludGVyZXN0aW5nOg0KDQorICogICAgQWxsIHRo
ZSBvdGhlciBub24tcmVsZXZhbnQgYml0cyBvZiBleHRlbnNpb24ncyAndmFsdWUnIGZpZWxkDQp3
aGlsZSBhZGRpbmcgdGhlDQorICogICAgcHJpbWFyeSBvciB0aGUgc2Vjb25kYXJ5IHF1ZXVlcyBv
ZiB0aGUgZ3JvdXAgbXVzdCBiZSBzZXQgdG8gMC4NCg0KPiArICrCoMKgwqAgSWYgdGhlIGV4dGVu
c2lvbidzICd2YWx1ZScgZmllbGQgaGFzDQo+ICVEUk1fWEVfTVVMVElfR1JPVVBfS0VFUF9BQ1RJ
VkUgZmxhZw0KPiArICrCoMKgwqAgc2V0LCB0aGVuIHRoZSBtdWx0aS1xdWV1ZSBncm91cCBpcyBr
ZXB0IGFjdGl2ZSBhZnRlciB0aGUNCj4gcHJpbWFyeSBxdWV1ZSBpcw0KPiArICrCoMKgwqAgZGVz
dHJveWVkLg0KPiArICoNCj4gKyAqwqAgLSAlRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZ
X01VTFRJX1FVRVVFX1BSSU9SSVRZIC0gU2V0IHRoZQ0KPiBxdWV1ZQ0KPiArICrCoMKgwqAgcHJp
b3JpdHkgd2l0aGluIHRoZSBtdWx0aS1xdWV1ZSBncm91cC4NCg0KSSBzZWUgYSBsaXR0bGUgbW9y
ZSBkZXRhaWwgaW4gdGhlIGtlcm5lbCBwYXRjaCBoZXJlOg0KDQorICogICAgcHJpb3JpdHkgd2l0
aGluIHRoZSBtdWx0aS1xdWV1ZSBncm91cC4gQ3VycmVudCB2YWxpZCBwcmlvcml0eQ0KdmFsdWVz
IGFyZSAw4oCTMg0KKyAqICAgIChkZWZhdWx0IGlzIDEpLCB3aXRoIGhpZ2hlciB2YWx1ZXMgaW5k
aWNhdGluZyBoaWdoZXIgcHJpb3JpdHkuDQoNCldoeSBub3QgaW5jbHVkZSB0aGlzIGRvY3VtZW50
YXRpb24gaGVyZT8NCg0KPiDCoCAqDQo+IMKgICogVGhlIGV4YW1wbGUgYmVsb3cgc2hvd3MgaG93
IHRvIHVzZSBAZHJtX3hlX2V4ZWNfcXVldWVfY3JlYXRlIHRvDQo+IGNyZWF0ZQ0KPiDCoCAqIGEg
c2ltcGxlIGV4ZWNfcXVldWUgKG5vIHBhcmFsbGVsIHN1Ym1pc3Npb24pIG9mIGNsYXNzDQo+IEBA
IC0xMjczLDYgKzEyODcsMTAgQEAgc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX2NyZWF0ZSB7DQo+
IMKgI2RlZmluZcKgwqAgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX1BSSU9SSVRZwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDANCj4gwqAjZGVmaW5lwqDCoCBEUk1fWEVfRVhFQ19R
VUVVRV9TRVRfUFJPUEVSVFlfVElNRVNMSUNFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxDQo+
IMKgI2RlZmluZcKgwqAgRFJNX1hFX0VYRUNfUVVFVUVfU0VUX1BST1BFUlRZX1BYUF9UWVBFwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDINCj4gKyNkZWZpbmXCoMKgIERSTV9YRV9FWEVDX1FV
RVVFX1NFVF9QUk9QRVJUWV9NVUxUSV9HUk9VUMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAzDQo+ICsj
ZGVmaW5lwqDCoMKgwqAgRFJNX1hFX01VTFRJX0dST1VQX0NSRUFURcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMXVsbA0KPiA8PCA2MykNCj4gKyNk
ZWZpbmXCoMKgwqDCoCBEUk1fWEVfTVVMVElfR1JPVVBfS0VFUF9BQ1RJVkXCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMXVsbA0KPiA8PCA2MikNCj4gKyNkZWZpbmXC
oMKgIERSTV9YRV9FWEVDX1FVRVVFX1NFVF9QUk9QRVJUWV9NVUxUSV9RVUVVRV9QUklPUklUWcKg
wqA0DQo+IMKgwqDCoMKgwqDCoMKgwqAvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8gdGhlIGZp
cnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmDQo+IGFueSAqLw0KPiDCoMKgwqDCoMKgwqDCoMKgX191
NjQgZXh0ZW5zaW9uczsNCj4gwqANCj4gQEAgLTIyNTQsNiArMjI3MiwyOCBAQCBzdHJ1Y3QgZHJt
X3hlX3ZtX3F1ZXJ5X21lbV9yYW5nZV9hdHRyIHsNCj4gwqANCj4gwqB9Ow0KPiDCoA0KPiArLyoq
DQo+ICsgKiBzdHJ1Y3QgZHJtX3hlX2V4ZWNfcXVldWVfc2V0X3Byb3BlcnR5IC0gZXhlYyBxdWV1
ZSBzZXQgcHJvcGVydHkNCj4gKyAqDQo+ICsgKiBTZXRzIGV4ZWN1dGlvbiBxdWV1ZSBwcm9wZXJ0
aWVzIGR5bmFtaWNhbGx5Lg0KDQpXaHkgbm90IGluY2x1ZGUgdGhlIGJpdCBhYm91dCB0aGUgbXVs
dGkgcXVldWUgcHJvcGVydHkgYmVpbmcgdGhlIG9ubHkNCm9uZSBoZXJlPw0KDQorLyoqDQorICog
c3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX3NldF9wcm9wZXJ0eSAtIGV4ZWMgcXVldWUgc2V0IHBy
b3BlcnR5DQorICoNCisgKiBTZXRzIGV4ZWN1dGlvbiBxdWV1ZSBwcm9wZXJ0aWVzIGR5bmFtaWNh
bGx5Lg0KKyAqIEN1cnJlbnRseSBvbmx5ICVEUk1fWEVfRVhFQ19RVUVVRV9TRVRfUFJPUEVSVFlf
TVVMVElfUVVFVUVfUFJJT1JJVFkNCisgKiBwcm9wZXJ0eSBjYW4gYmUgZHluYW1pY2FsbHkgc2V0
Lg0KKyAqLw0KDQpBbnl3YXkgdGhlc2UgYXJlbid0IGZ1bmN0aW9uLiBGcm9tIG15IHBlcnNwZWN0
aXZlIGl0J3MgbW9yZSBuaWNlIHRvDQpoYXZlIHRvIGFsaWduIHdpdGggdGhlIGtlcm5lbC4gQW4g
SUdUIGRldmVsb3BlciAoYW5kIFVNRCBkZXYpIGNhbiBhbmQNCnNob3VsZCBsb29rIGF0IHRoZSBk
b2N1bWVudGF0aW9uIGluIHRoZSBrZXJuZWwgaXRzZWxmIGFueXdheS4gRm9yDQpjb25zaXN0ZW5j
eSB0aG91Z2ggaXQgd291bGQgYmUgbmljZSB0byBrZWVwIHRoaXMgdGhlIHNhbWUuDQoNClJldmll
d2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1bW1lcnNAaW50ZWwuY29tPg0KDQpUaGFu
a3MsDQpTdHVhcnQNCg0KDQo+ICsgKi8NCj4gK3N0cnVjdCBkcm1feGVfZXhlY19xdWV1ZV9zZXRf
cHJvcGVydHkgew0KPiArwqDCoMKgwqDCoMKgwqAvKiogQGV4dGVuc2lvbnM6IFBvaW50ZXIgdG8g
dGhlIGZpcnN0IGV4dGVuc2lvbiBzdHJ1Y3QsIGlmDQo+IGFueSAqLw0KPiArwqDCoMKgwqDCoMKg
wqBfX3U2NCBleHRlbnNpb25zOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAZXhlY19xdWV1
ZV9pZDogRXhlYyBxdWV1ZSBJRCAqLw0KPiArwqDCoMKgwqDCoMKgwqBfX3UzMiBleGVjX3F1ZXVl
X2lkOw0KPiArDQo+ICvCoMKgwqDCoMKgwqDCoC8qKiBAcHJvcGVydHk6IHByb3BlcnR5IHRvIHNl
dCAqLw0KPiArwqDCoMKgwqDCoMKgwqBfX3UzMiBwcm9wZXJ0eTsNCj4gKw0KPiArwqDCoMKgwqDC
oMKgwqAvKiogQHZhbHVlOiBwcm9wZXJ0eSB2YWx1ZSAqLw0KPiArwqDCoMKgwqDCoMKgwqBfX3U2
NCB2YWx1ZTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqAvKiogQHJlc2VydmVkOiBSZXNlcnZlZCAq
Lw0KPiArwqDCoMKgwqDCoMKgwqBfX3U2NCByZXNlcnZlZFsyXTsNCj4gK307DQo+ICsNCj4gwqAj
aWYgZGVmaW5lZChfX2NwbHVzcGx1cykNCj4gwqB9DQo+IMKgI2VuZGlmDQoNCg==
