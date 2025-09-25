Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A9ECAC5A5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 09:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7988710E184;
	Thu, 25 Sep 2025 09:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVWcDdk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C8810E184
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758794379; x=1790330379;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=HpFw9WFPPhkPO31e7brV+L3BtvROKd/DhfrhrITpBnw=;
 b=ZVWcDdk+0kfSD3ZQtZkBPT1Oo5P+HukB/i66KUybQ4f+Wt6jymBA97d7
 fr8q5GixeB0jon7G7mtnK5mVnkjOLPBsiKOHWHuUM8iSE/uCGn+UhY7mG
 owKeePSJB+0j6h4b5JHZOOsfMOJiTerc7w2BMHh7YDUtbanxqUZmw3Ker
 SkYTytQWuALToZiNexOJtwmhyae8qxtCFOJd02Yph7ka8GkFQphoTv5ZD
 ZStO/jP1OJjixPt/Ay1tTZy+TGjsHvCtMDIGSM6cfdk8P3i+k86WignfA
 vKnFYf0vZ82RXDsBmINnBWKGbMlUsS7GYHgk9/fKbyT7IgwEEgBs0W+HF Q==;
X-CSE-ConnectionGUID: ZH/86o/PRPGT037q8HgLqw==
X-CSE-MsgGUID: /SRW7PVaSmq2oWcQGmVAOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="78543158"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="78543158"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:59:38 -0700
X-CSE-ConnectionGUID: saZXn19nQY+lhuQfxZqSWA==
X-CSE-MsgGUID: C4YD/XVXTqabQwlAVfDsRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="177351083"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 02:59:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 02:59:37 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 25 Sep 2025 02:59:37 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.40) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 25 Sep 2025 02:59:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKouiarOecE/Z129DT9+RiP4Hkb+uO+BOeJtgYjE2XIq3OxVdYcgtYpw0I6i0riKroP5Bm/qdZ7XWKoUi9+CJfybbvq3IenqU/5lQjOQJI2+M92+Z22VdQNIePVAjCCrTAyax69DohHf3RGvz42R+m4GZYlEDE68SEUwGhxbGkHJuAq02vSldhIAam8Z04Ce9XucpUyfjUFuk2XvjqVZTbiQRG2axY14QSqqJ89UZx7fF/eC1vtXC39Ndz5nwNG4ufUOi+ai4cYVdVgGZTY3+nifLcJMGfWHzcTRXCc1VkueNo4eep9aPyulyrzZxOITrUdNPDRZ0tWPXOJNvgtkQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HpFw9WFPPhkPO31e7brV+L3BtvROKd/DhfrhrITpBnw=;
 b=R7xBUM68L5f5BGjxBGxw7RJ9Re1R40CZGF8Y999qvnUxi2/9DwEEuSG1+ZQNYEUxlYOQnwqf7V7WEh3SeI7Zrrw+yvV+ZxxH0/JTrw7WvJCZ5ylSAUUFvseUMDc1K5ukKNqcSktDzhS81AwR+Z+YoBbMYb7RzBko2RSY49VeKuq+0LdyAKLvMKEw778WhDxtOzVqdx3nhe2YgfMxJ9qVeFBBalpMQuPzBu4Tk83UIpIfmnUn1phbTnQGRw2E3qSsqaY0Uop4N/RxLW7fEKzJKFHk+pezP4dyPtIYr6+IXDJsXB4C5GbiGXep/igLwuNx+Le0it7q0o+RclYi2zdUqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ5PPF2E3E6CCA8.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::81b)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Thu, 25 Sep
 2025 09:59:34 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 09:59:34 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Topic: [PATCH i-g-t] lib/igt_psr: Use 10x timeouts in simulation
 environment
Thread-Index: AQHcLdbAW4K9WEz0WUeUb5hvanK+FLSjptkAgAADqIA=
Date: Thu, 25 Sep 2025 09:59:34 +0000
Message-ID: <5f598f320619220a9244ba0bbeb9e2343391722f.camel@intel.com>
References: <20250925044136.3654614-1-jouni.hogander@intel.com>
 <20250925094628.s6bv5ld6bculj3ju@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250925094628.s6bv5ld6bculj3ju@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ5PPF2E3E6CCA8:EE_
x-ms-office365-filtering-correlation-id: a648c281-e036-4700-b3bc-08ddfc1a3ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?T0lrM3M1dVd3UXR4T3lzNExxcnBoWDQwYXRXVVJHOGo3bWJHcVJnaUMyLzdY?=
 =?utf-8?B?VS9oVjN0SEdQUkFocVZOUXh5eC9rbGRRd0dwTUlCR01RV2xuMDU0UDJueHdB?=
 =?utf-8?B?RHJOVlhIblIrWUlRTUE0VUQ3VEFPdjA4VytGZ1VobnNCQ0RuU0FVQXE0anZP?=
 =?utf-8?B?cGllTkM4V3YyM3RSL2xKZ012ZEFSTGlDd3kwSXJYM0dxUzZqVHZLbjNNL0JQ?=
 =?utf-8?B?ejlYaDR5VWJ5MldJSVpGU0NHcUJXemZZK25KWjM1dWdKWVBWTHlGQk5Mdnkv?=
 =?utf-8?B?Ty9Jdk1mYVFtbFZXY2FjZnE1c0hDZTJLZkpCYzBLYTBFY0JmZTNrNXVYT0Vh?=
 =?utf-8?B?T1RLRHU4WjVObzZxRDV5eU1UOHZ1Vzdod3l2b09zeDdxTGs1VmZJeTJ4Q2VU?=
 =?utf-8?B?dUhza2NIMEZIbDR2RjVEVGR2MG1HenlHSENmQ0ZpNTR4LzlJOWNud0Qyanhy?=
 =?utf-8?B?UEdEZEtWM3UwU3FFOWJWTGVPR3RDdEd2UmhVeDF1R3VMaFc2all4U21keWxo?=
 =?utf-8?B?Q3JpeEdhQU5PQktnUGhaemRSUC9YOGNjUitYTTlVZDVxcjFtV0xDcE5aQTJK?=
 =?utf-8?B?aTdMYUc3bi9LdTRSUzdUOG8yQTV2OUlPUTJqZGFwYS91SHhENTJqdi94M21H?=
 =?utf-8?B?K2hzYkdvU2s0UWlRWThveFg5TzJJNzRLT3pYRy83SmxBc3UyUEo2eldLWjRR?=
 =?utf-8?B?U0FDN3Y0eERaVFJLcFBnLzBwQzBlZGE3MHdqWHcvU3ZMdnNDem15Njc4UGlN?=
 =?utf-8?B?VE52Z09SSjZUUXhzcGJiTWwvZnpLQ3dGU0dvampDaGo0ZEVWQlptNDVTTzhw?=
 =?utf-8?B?eXdRMENmUHNyd2lBc1YzcThXaTJzK08yQlZwbUhNZVg0UmJCaFA3dG1HeWJx?=
 =?utf-8?B?QmVMcmVFcWFSYm5Rb1JBWUt4VDVxTUxuelgzZERpTm1LRnRFZ3Z5ZEloUjlv?=
 =?utf-8?B?N3NuV3BkbG53RnhvcUFLTDNpc1pNcGRFWFpwM09oK1U5SEFSbElEWXJ1RlNq?=
 =?utf-8?B?REdtWi8rSHVLTkpTM0hVWmRDNWEwYmdqL3ZFa3dTajJHclNrb3pjbGN3QkRN?=
 =?utf-8?B?dHZmd0g4Mk5xVXpBaWlnWmhiekNOQkJHZWhVVXp3VnpXWVRhcGhCdlRsTStV?=
 =?utf-8?B?TlorL3dtL215Y0swaWtVUUc4eFUxVjYrOUNXLzBaSXd6VkRBUHNDU1d0UnlM?=
 =?utf-8?B?dmx6ckFnTHZpR1RkL3EwUjMvY2FLQmkrejMzQjBYTHM3ZEJQajNCUFRPOHRP?=
 =?utf-8?B?ZTBQVXJwQjZPSVRndHlTZXI5dmVzWi9ndUVBY2FYbXF4VDNNY05tSlo2ZjY2?=
 =?utf-8?B?S09rOXUyQjJyL1lySDFMMGNhZ2U5U3cwZkZad3VReGhQMFJDd1pVUFdVWFh4?=
 =?utf-8?B?Y1dHaHZncnR0aXBMZUhTd1ZkLzBkVFYrV3MvOFhPWFA3UWVVM2JMMUdnK3N2?=
 =?utf-8?B?c3piT0QwV3pOTVFWMU9Td1pMcldNUHUyc1N1TkRIWHVUY3lBYkxyd25vOFNn?=
 =?utf-8?B?Z2kwOTZjeENNVXdjNE1qY0tQVS9qMkE5bEVsOFBXZE5vSWR4NkhrbnlRYVBP?=
 =?utf-8?B?NzZjVXErRHpKZnB3SjFKTnhzYU55RTB0UU4zRmxKYWFyemlnMFo1YUg5aGpF?=
 =?utf-8?B?K2dyY1A1dVliaTRoU2h4ZXdJbkhucHd0M2ZVSTNORDVHTWlEbDZBdnBVVndU?=
 =?utf-8?B?eVd5Qi9MS3FsNFlOTjFMOHZ4SWNSVlgvQnk3WGo5cUtVRWtubEJZTXJFSTc4?=
 =?utf-8?B?b2c3b3RmQ0VseXdTbkhYclAxRjFLODZnWjNxa2RQU0FGTFoxVFZzSk5CeTlp?=
 =?utf-8?B?bmZIckx0S1lXOEVZQkkxL2haK2lCVXByL05ubVhzUVFjK2FUbXE2aHA4NlZN?=
 =?utf-8?B?Rlh5OUdyd3l5V2JDamFCYm9KQ1M5YTZyZm1OMEUxZW42QitSTkpjUFN5RHZC?=
 =?utf-8?B?cnVVU0tsanIwK3pCRCttYXUwdXNGUU5BRW5rSXpDaWhGbXUxek4rc3JFN09H?=
 =?utf-8?Q?6Qklp+7MxyfqUUPYqv0Mq0KfYWG1Kw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajdhb1dZcXdlSm5zSDRNdGJMSUQwUTR6MlJ1dGxuUVVzckFWdmFwd3JkcGlN?=
 =?utf-8?B?bmxCOGYrZlBjcUc0Qjc0RGZmdlNqUGhzRi9GVnVJeHE5b1o3cUZKOFdYUk5Y?=
 =?utf-8?B?bGNDWXY3ZjJvbmlsWjVsZnl5RlAxcmEyWlV0b2NTNDhjd1ZlanFBL09ybEFH?=
 =?utf-8?B?enlpUmRTbE1hZHpzRGtPL3l1TnhpKzdnZWkyQnJIMCt6NVFVYXJwTnBJTVZq?=
 =?utf-8?B?MWtlS1ZvYXJBbzJVMmtVUjk0RjMrT3JzSkE1dWNhMWNxNEQ5KzZKZWY3R3l5?=
 =?utf-8?B?STBWWHlKdjFaaXZMYldFNW5WeXYrbTV6L0FFU1lqbTdvVzRPWnVJUGlvYkE1?=
 =?utf-8?B?ajNZQU80RTg5LzUrWlZMaFJPYTYvWmdrT21HODV2OTJEN2hmRVdGMk13TnpJ?=
 =?utf-8?B?S2k5N0FwQnN5Mi9ma1dVNkk1M05kRUFHYlpEL2gxbEw0TXZQK0pKNDM2VnU3?=
 =?utf-8?B?V2JLdGwrMVhqU3dXcUVTRjdkaTZNQ280S3hGVkxOUjA3bVhHRVRNM2JxUEF6?=
 =?utf-8?B?WHRFTlMzb3lBYmVDZDhtMFA4WFlFZ01OTURiTG82TW5hditEM3ZTWGxhVjRi?=
 =?utf-8?B?R0ZtVTB2SmNtN2xsOWJucWNBRElCQ2JnTGYrR1lmVDdObXBkWldtcHV4bS9h?=
 =?utf-8?B?RzdHcTh5YkJSRFMvcitxaDkyMjFpcVlSTXJURTUyOUhzcm1SQ29JbHY4Q2kv?=
 =?utf-8?B?T1FKd2J6ODU5UGljSmFvb2NhU0FjV0E3UUVNV2U4Z0tUUTJ6d05ZMkMvMVFu?=
 =?utf-8?B?MHRkdDE5L1UxU0VKaTdsbTBVZEFCTlVLQVlReGx6V0pGNWFIbGd3a2dBOHZW?=
 =?utf-8?B?cWZ3c0JCblBZUkJxSlUyNWRxV2YwOEQwdllxYk9BYUQ1SzUwWFRYRGsrTEhE?=
 =?utf-8?B?dHExNXAwTGdyYi9hWXRTTU1FOG5KbmdjYnFLQS8zM0ZqNDZUbi9NTXBDeHZJ?=
 =?utf-8?B?ejVIeTJPOVZCOXhaN005ay9hQkpERnhnck92MHcyMmhUdDNXUk50d3FDYnBx?=
 =?utf-8?B?Q3JCck43RXlOTFE5MWVFNDN4SHh5dEtSL1R5M0FTV0J1VmJmbmdiOGlFWC80?=
 =?utf-8?B?SU52ZmFvOE9CS0tKK1g2cjlVTzFZNmhJQTd2RE84WnArQjQrd1g3KzloZEli?=
 =?utf-8?B?Tm9HTVhBRjhjeFR1UldnK2g1UWRCem1LdFBCS1cwNmFZM3pOcXN2NHVicXBN?=
 =?utf-8?B?UFM4QWJpYzNLUWVBSWxNTXJEU2ZhRlVJWXcvNm4xREdCcjQ3TU5hNW1tRWpR?=
 =?utf-8?B?OVpNRkllYkdUQVRINnV5bjY5RGV6aHhOZ0JBQS94Rm9jbTdxblY3bmx0T1Uy?=
 =?utf-8?B?cG5qRkJoY1JxSEIrOStOdnJhZUt1YTczRUxKeXgybTJ3M21UZmtQc1ZkZzhV?=
 =?utf-8?B?NGlTQjVYKzRuRjk0a2dsS1cvRGxkc2RWRGlGaFVibjRqZ3htbmZpQTZQMk8z?=
 =?utf-8?B?aXRiSjlkTXRld0lxd3YvcHBFMVpCOHY1QzcrTDNMVno1TG5IQkpocGhua3VE?=
 =?utf-8?B?dk4weW5nUkE2cTBHTnR0bjMrdmJrR0F6NHZtZ1p6M2RBSDVzUkg0czhBb21E?=
 =?utf-8?B?eVhLL3BHaG9hYlVySXJtcDF5UDJSQWxHSFhNcHQzU29xSWp1SEFHNGNCZzZt?=
 =?utf-8?B?eXdPTk5LcmdJSkVjR2ZVTzVzekF5Q2I3MUZxOU82cmJrMGNqM2VxcG5WY0lT?=
 =?utf-8?B?QzM1VStLdTlLWit2akJ2ajZrL1VtWTlTMUJ3OGtMb1pMaDdsVUtUa0ovQkw5?=
 =?utf-8?B?KzNGc09MVHhscWQ2NUVNT3hrNjFaZjlYYy9IcHc2NzVwQVBLNWdGeG03d1NT?=
 =?utf-8?B?aUo3K1ZKay8rWXFZNE1qQ0p5a0RVUzJWanJGRkFueCtabXQ2bGNzeHhya25l?=
 =?utf-8?B?dGZQZXlZWVVWc3FZZkFEaEZuQ1FOdXRVS2h4eU5raElkUXBLR2J5dm92dE0r?=
 =?utf-8?B?czlsWlhhb3FFY0J6UDBVeG01QjgrdDQzT2loS0VIdmI5WmxqWnB1M1BNUlFM?=
 =?utf-8?B?WTdZeTFDQU9QR1cxVWxnYWVJOFN6QmNNVDA5dWZmLzcyWmhsNmdCWlZjaHVQ?=
 =?utf-8?B?MkI2NWV0d2RnSWZZK2JqbTFBZ2ZYdmlKQWpsQ0dzQ3JLdnJrK2RmTm8zb2xP?=
 =?utf-8?B?N2IzdytlYlAxNU5aa0l1cS94eXhEWG5MUGlSTnp4SjZod0d0NHB4SE4yM01N?=
 =?utf-8?B?U2hzcXlRVDN3NVVES0hGVVUwSWJtdjRiSGh0TTRHcVVVYTBWa1Vadyt5T3ln?=
 =?utf-8?B?d0JkNlZTaFQ4d0FINjk0VEFUdkxnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5DC7A9247AB1864EBF26C091AADA06E1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a648c281-e036-4700-b3bc-08ddfc1a3ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 09:59:34.3318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SgujYukM4+Olp59YPEm1KEyAYUsVkGhnBNMpVkOSfUS2p/sUkFe1o+ykO1iOATn/65dkzuYepd8pjmoBhz4dpmBlZQWqv6ejQ7m8C8DEzlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2E3E6CCA8
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

T24gVGh1LCAyMDI1LTA5LTI1IGF0IDExOjQ2ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIEpvdW5pLA0KPiBPbiAyMDI1LTA5LTI1IGF0IDA3OjQxOjM2ICswMzAwLCBKb3VuaSBI
w7ZnYW5kZXIgd3JvdGU6DQo+ID4gUFNSIHRlc3RzIGFyZSB0aW1lb3V0aW5nIGluIHNpbXVsYXRp
b24gZW52aXJvbm1lbnQuIFVzZSAxMCBhcyBhDQo+ID4gbXVsdGlwbGllcg0KPiA+IGZvciB0aW1l
b3V0cyBpbiBzaW11bGF0aW9uIGVudmlyb25tZW50Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
IMKgbGliL2lndF9wc3IuYyB8IDEyICsrKysrKystLS0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEv
bGliL2lndF9wc3IuYyBiL2xpYi9pZ3RfcHNyLmMNCj4gPiBpbmRleCBkNWI0MTk4YzMuLmMwMzA0
Mjg5OSAxMDA2NDQNCj4gPiAtLS0gYS9saWIvaWd0X3Bzci5jDQo+ID4gKysrIGIvbGliL2lndF9w
c3IuYw0KPiA+IEBAIC0xMzYsMTIgKzEzNiwxNCBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlX2No
ZWNrKGludCBkZWJ1Z2ZzX2ZkLA0KPiA+IGVudW0gcHNyX21vZGUgbW9kZSwgaWd0X291dHB1dF90
ICpvDQo+ID4gwqAJcmV0dXJuIGFjdGl2ZTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+ICsjZGVmaW5l
IFBTUl9USU1FT1VUKHRpbWVvdXQpCShpZ3RfcnVuX2luX3NpbXVsYXRpb24oKSA/IDEwIDogMQ0K
PiA+ICogKHRpbWVvdXQpKQ0KPiANCj4gWW91IG5lZWQgbW9yZSBicmFjZXMgaGVyZToNCj4gDQo+
ICNkZWZpbmUgUFNSX1RJTUVPVVQodGltZW91dCkJKChpZ3RfcnVuX2luX3NpbXVsYXRpb24oKSA/
IDEwIDogMSkNCj4gKiAodGltZW91dCkpDQoNClRoYW5rIHlvdSBLYW1pbCBmb3IgcG9pbnRpbmcg
dGhpcyBvdXQuIFBsZWFzZSBjaGVjayB1cGRhdGVkIHZlcnNpb24uDQoNCkJSLA0KDQpKb3VuaSBI
w7ZnYW5kZXINCg0KPiANCj4gUmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gKw0KPiA+IMKgLyoN
Cj4gPiDCoCAqIEZvciBQU1IxLCB3ZSB3YWl0IHVudGlsIFBTUiBpcyBhY3RpdmUuIFdlIHdhaXQg
dW50aWwgREVFUF9TTEVFUA0KPiA+IGZvciBQU1IyLg0KPiA+IMKgICovDQo+ID4gwqBib29sIHBz
cl93YWl0X2VudHJ5KGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUsDQo+ID4gaWd0
X291dHB1dF90ICpvdXRwdXQpDQo+ID4gwqB7DQo+ID4gLQlyZXR1cm4gaWd0X3dhaXQocHNyX2Fj
dGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiA+IG91dHB1dCksIDUwMCwgMjApOw0KPiA+
ICsJcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9kZSwNCj4g
PiBvdXRwdXQpLCBQU1JfVElNRU9VVCg1MDApLCAyMCk7DQo+ID4gwqB9DQo+ID4gwqANCj4gPiDC
oGJvb2wgcHNyX3dhaXRfdXBkYXRlKGludCBkZWJ1Z2ZzX2ZkLCBlbnVtIHBzcl9tb2RlIG1vZGUs
DQo+ID4gaWd0X291dHB1dF90ICpvdXRwdXQpDQo+ID4gQEAgLTE1Myw5ICsxNTUsOSBAQCBib29s
IHBzcl93YWl0X3VwZGF0ZShpbnQgZGVidWdmc19mZCwgZW51bQ0KPiA+IHBzcl9tb2RlIG1vZGUs
IGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiA+IMKgCSAqLw0KPiA+IMKgCWlmIChvdXRwdXQgIT0g
TlVMTCAmJg0KPiA+IMKgCcKgwqDCoCBvdXRwdXQtPmNvbmZpZy5jb25uZWN0b3ItPmNvbm5lY3Rv
cl90eXBlID09DQo+ID4gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0KQ0KPiA+IC0JCXJl
dHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsIG1vZGUsDQo+ID4gb3V0
cHV0KSwgNDAsIDEpOw0KPiA+ICsJCXJldHVybiBpZ3Rfd2FpdChwc3JfYWN0aXZlX2NoZWNrKGRl
YnVnZnNfZmQsIG1vZGUsDQo+ID4gb3V0cHV0KSwgUFNSX1RJTUVPVVQoNDApLCAxKTsNCj4gPiDC
oAllbHNlDQo+ID4gLQkJcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNf
ZmQsDQo+ID4gbW9kZSwgb3V0cHV0KSwgNDAsIDEpOw0KPiA+ICsJCXJldHVybiBpZ3Rfd2FpdCgh
cHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLA0KPiA+IG1vZGUsIG91dHB1dCksIFBTUl9USU1F
T1VUKDQwKSwgMSk7DQo+ID4gwqB9DQo+ID4gwqANCj4gPiDCoGJvb2wgcHNyX2xvbmdfd2FpdF91
cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0gcHNyX21vZGUgbW9kZSwNCj4gPiBpZ3Rfb3V0cHV0
X3QgKm91dHB1dCkNCj4gPiBAQCAtMTY3LDkgKzE2OSw5IEBAIGJvb2wgcHNyX2xvbmdfd2FpdF91
cGRhdGUoaW50IGRlYnVnZnNfZmQsIGVudW0NCj4gPiBwc3JfbW9kZSBtb2RlLCBpZ3Rfb3V0cHV0
X3QgKm91dHANCj4gPiDCoAkgKi8NCj4gPiDCoAlpZiAob3V0cHV0ICE9IE5VTEwgJiYNCj4gPiDC
oAnCoMKgwqAgb3V0cHV0LT5jb25maWcuY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PQ0KPiA+
IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydCkNCj4gPiAtCQlyZXR1cm4gaWd0X3dhaXQo
cHNyX2FjdGl2ZV9jaGVjayhkZWJ1Z2ZzX2ZkLCBtb2RlLA0KPiA+IG91dHB1dCksIDUwMCwgMSk7
DQo+ID4gKwkJcmV0dXJuIGlndF93YWl0KHBzcl9hY3RpdmVfY2hlY2soZGVidWdmc19mZCwgbW9k
ZSwNCj4gPiBvdXRwdXQpLCBQU1JfVElNRU9VVCg1MDApLCAxKTsNCj4gPiDCoAllbHNlDQo+ID4g
LQkJcmV0dXJuIGlndF93YWl0KCFwc3JfYWN0aXZlX2NoZWNrKGRlYnVnZnNfZmQsDQo+ID4gbW9k
ZSwgb3V0cHV0KSwgNTAwLCAxKTsNCj4gPiArCQlyZXR1cm4gaWd0X3dhaXQoIXBzcl9hY3RpdmVf
Y2hlY2soZGVidWdmc19mZCwNCj4gPiBtb2RlLCBvdXRwdXQpLCBQU1JfVElNRU9VVCg1MDApLCAx
KTsNCj4gPiDCoH0NCj4gPiDCoA0KPiA+IMKgc3RhdGljIHNzaXplX3QgcHNyX3dyaXRlKGludCBk
ZWJ1Z2ZzX2ZkLCBjb25zdCBjaGFyICpidWYsDQo+ID4gaWd0X291dHB1dF90ICpvdXRwdXQpDQo+
ID4gLS0gDQo+ID4gMi40My4wDQo+ID4gDQoNCg==
