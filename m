Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D854CC02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 14:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4F810E0F4;
	Fri, 24 Jan 2025 14:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QMCxf9T9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DBF10E0F4
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 14:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737728459; x=1769264459;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=y5gYrzbJt8Tzhxr8IIVf/mNF1xmWgmMashMKF8G/+9g=;
 b=QMCxf9T9qJ6B9S3CZ2K3QEbTLm47T9a+ND1mLGvr92FiodCHhx8909sk
 W8r4yeKhljnFs8YQacK3kaH/iA4lnDFdv/t8uOmLjRk+cddVoc5X+6lLm
 guF7i1FhNTs4OeOK9kx5annGuhshMsoBUftyDs/UEqEA+dkKRL4rCp26l
 4n4rL1p2Bq+mwLZWKbjjIzkmotA0CUwNpX5v8spJMORlObVSuTFRMfDv5
 dr0wBfmwWjCPa9V6B7OFZGiQAiNiwySKN4H3pW2HMgxlOHeTxYrlT6CZw
 64tHd9TL7ZOpSxumB6n+chUvJL/F7Je9MgWhnIyp7ugTXbwmzLav3IJOe w==;
X-CSE-ConnectionGUID: yNxoJfNqQHGE9Q4/ogppaQ==
X-CSE-MsgGUID: sJGM0YdUTkiZDrCPx70qfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="37961645"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="37961645"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 06:20:58 -0800
X-CSE-ConnectionGUID: mXcfeyQaTvWOotDZQNOyRw==
X-CSE-MsgGUID: FyAYK3+gSQmH2nCjPZl3Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="131079123"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2025 06:20:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 24 Jan 2025 06:20:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 24 Jan 2025 06:20:57 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 24 Jan 2025 06:20:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qATaiV9Bp3yed8+OQYP4hieBGIdGv2wsARs+mHlEdBqtFh+7pMzEg46XCXH++GtexLRUVgb7Se+hfn6RaAOj/PwCV+nJQkRydn6Yzqo+YicHQv94+7aqOiG42TR9ZGnKsT2/it3+2mJxq8+9lQ6If3kIl9Qp8B8B7SKlgId4gV2JAl/C9fcanOqjis4aMHrKPJ6w0yvnV0/yTLpGsG4Fa/t72mTYk5MeJP/wI/vTi6jStSzu+rupdJ2iAj3d+HnVYS92j9lxBXZ8BRrzrDJW5KLxt8WS6nW1XPp5XAk+CHBXgK3t9Dz6H0PbD9glHpSmA7q31evQwaHsrRa3rAzPEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5gYrzbJt8Tzhxr8IIVf/mNF1xmWgmMashMKF8G/+9g=;
 b=U9I5mLp0QzGPR71RTmslBRr6XtkTzBLUJBTmaUWCswJ9Z6o0Hm2VimggEQF8JKY6f/D4SFA3gNWBcmX+NpbspDWuVsdd/8EmuRWaRuF6bgr9BGcjOAJ6DMw5BtSAtSDo8Wlf1RPz3hZQjoLJ6K35BYFYqy5zkx6MmCTxjFeuzFHRphYLNly9XqH5k9ykJSqxt9Bpsf6XVCAF/R1RRVs2Gi5d03X+cSrthRP2SKwHmbfh2DrKvP2pjf7pQhf2DOdjA2TwpQUSGlQ0/A3ngLW6Uk5zLUl+6zs5UnQpVsO+APfY/UHziSofeVDhBjQnFfic0bkOP58nl3Sh4nnLqXRmmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW5PR11MB5857.namprd11.prod.outlook.com (2603:10b6:303:19d::17)
 by SN7PR11MB6752.namprd11.prod.outlook.com (2603:10b6:806:264::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 14:20:41 +0000
Received: from MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::a942:e985:4705:e118]) by MW5PR11MB5857.namprd11.prod.outlook.com
 ([fe80::a942:e985:4705:e118%4]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 14:20:41 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "peter.senna@linux.intel.com" <peter.senna@linux.intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 7/7] runner/resultgen: Add cmdline to results.json
Thread-Topic: [PATCH i-g-t v2 7/7] runner/resultgen: Add cmdline to
 results.json
Thread-Index: AQHbbFft9BI2Ds5kjk68aE10fgfA17MiwBUAgAEtXgCAAhAnAA==
Date: Fri, 24 Jan 2025 14:20:41 +0000
Message-ID: <9f140fe0b463598af0af6cac95c613fa267fe225.camel@intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-8-lucas.demarchi@intel.com>
 <173755030291.5500.6239544066129101929@intel.com>
 <omwtasmowswuhnn4l65qmvq5zscdjury2ezkmlw4mp7twbu26t@m4sxloefokeu>
In-Reply-To: <omwtasmowswuhnn4l65qmvq5zscdjury2ezkmlw4mp7twbu26t@m4sxloefokeu>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR11MB5857:EE_|SN7PR11MB6752:EE_
x-ms-office365-filtering-correlation-id: d79685f8-3423-4ebb-32d6-08dd3c824848
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Zm9kYWRPNXRmS0VGbG1FK1BXd3dQbW1pTDdvODlZQnlXbVZYNTJHUzZwMWV0?=
 =?utf-8?B?aVF1dG1zb3Z2bmx1N3c4V2dNY3pMWFI4VHBlbjM0VFdneHZUYURERFNhaEdj?=
 =?utf-8?B?dExtSjlzQklOWUFPbSsweFdSRFdhRk9tb014aXZQaG9IZGZjNmxxd05CWENy?=
 =?utf-8?B?UmFCbG5kNkRMeTZTS2FYYnZiNk5Db2FqV0MyZTRtakRkYUM5UUhWYzhxcitD?=
 =?utf-8?B?K3BBK01nYmhXRnhzU0hFMi9tTmRUcUNaT09MbWprTnFGZ25RbGhUUUxla0NT?=
 =?utf-8?B?WnFvaVhBcjlSUWVJdHk2U1F2NkRKQW41TDhLUHZpK0pYM2ZKd0xxL2hpRmcy?=
 =?utf-8?B?UjVGcVFvSng3VWVSekJocHFSZnRWMkpMUFFKRC9DaUFtUEwzTHRDMzZJSXJ3?=
 =?utf-8?B?KzMzNkNLSUp0QmxCQU16aHVqVURXZmhrZFdEZE8xWHBiSjZnempheU5IV3N4?=
 =?utf-8?B?a082Ti93RFcySUZoRS9JKzIyMHUyUVVLQ2hIeFFRNWk2ZEp5RUg0RVluKzdG?=
 =?utf-8?B?MFZPK1hlU3djUHlYQVhIUU9xN1RtNkwwVStUbEZxbHRvcnVsalhUUlYxQ3Nn?=
 =?utf-8?B?VDZGVGtzZDNOaE9ETkZaK0d1ajVFK1JPd3JNdkd6OCtxeko4SXZhZkU0RnE3?=
 =?utf-8?B?a0tGOFZQV2dCY3JhWW8yQ3p2aXJ3M0FEdVY1UXN1QVp0RklET0tlL2dvU3RX?=
 =?utf-8?B?MDBGMWNROEpvd2hhZnJCYzI5clIzZUE4YnJHaUt5OUs3YjdSdmVCYkwvRjAv?=
 =?utf-8?B?QmV3Tit1RXhxUzhSYXJUa1AxR2dRemQ5djVtVGdwV1ZxNXN3cmJlSUVmNEZW?=
 =?utf-8?B?UVhVRERyL21zdy8zV09jUUtXQXloMG1YemJvQjFiQWhyRjVxSE1vMDhTVjN1?=
 =?utf-8?B?ekprM0hIT0hqWUN5aC9hWmlGcHNLeEtRaDZDOEY2QVZ1VG9OWGJGZnlOOVdX?=
 =?utf-8?B?SkNiR0wvZTVPb0tMWUsyTjNsejFkRHhpMTlkRjNCdkdYWDNQcFNGUGdSMVpw?=
 =?utf-8?B?QUlOYk9OTGJvc2RDNytacFNrVWNYNmlIRlgzUVBWYnA3aXdkNS9ITUJSWFhB?=
 =?utf-8?B?ZVZPWG1nQ2VxWWQ3NzU0QklheU5uMXpEL0pUSjdPaFVpY3dTZHliNVBpSHFw?=
 =?utf-8?B?VHFDbkMydERPakdUcXdzK1BCNXNpVW1VQWRqaSs1VG9aT0d6NnAxV3o2ZzZG?=
 =?utf-8?B?VTNCay8ySW5Fa0czdHZVS0d1eUcvblRPRFR6WVZqVkxpVUxGT1IreWdDSG5m?=
 =?utf-8?B?eTRGTllJai8wb3RhZkkrYnNLdDFkNUpwL0c5d2hWNStTU3Jka3JRbzlIWDNx?=
 =?utf-8?B?M25xajJIYXVwZTRkT0lMcElyeHM5dnV2MmlvVkUwb3ZPMkc4cXlENlZvSStF?=
 =?utf-8?B?WUdPWThYdlplaE1yMHJxSlFNWmJocFNGZ0U3cDIxcUthSWJvclE5bE5WV2Qv?=
 =?utf-8?B?ZTRNdngyZUJiN05HZTFZR2lCWGpqcGdBQXRwRFFBdll1L2pVTzdZTmJRMkZ3?=
 =?utf-8?B?bytjYzhibkl2d3gzVFpqOE1SRlpSSnkvaU1nQkJnckR1a1Yrc3pmQUg4L0Nz?=
 =?utf-8?B?UFdDUWtRTkZJYjFHeXJzNWZMNU5UN1Z6N3dBSGVWbkRFUHNadWsxa1JrRnpO?=
 =?utf-8?B?ZzFKWk9VRDhIWm9FZDM0TzU4SUdpdVlyRkZmOE55SUtlTmNxTjFDZVM3aTFy?=
 =?utf-8?B?cHJvR0FabWJNVDNkL3dGRU1naFRsVlVwRCtYYXNBQjFMWDdpbk52NzVTMk9C?=
 =?utf-8?B?NCtYVVlpWkU2d2FlT0tFSWVIUU1DVlVjNi9ickNreDZONWkzYWJCUzgwZklI?=
 =?utf-8?B?eWhRUGs4d1A4WXRKY2VlMjhZTlJaeGFIdmpWMTJNN3VNOU1vMjFkNDlSZEEr?=
 =?utf-8?B?bEpiaGYwemZKWGIrOXM2WjhBK0Z4WTBQSVBVa3Bvb1NGUzZkaGJMOFUwQXRR?=
 =?utf-8?Q?3zx6pjdQDrKuZ/7KP+x6xIl6aTKwicgw?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW5PR11MB5857.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmlGbitOY0ZLN0pyeUdjKzJ1WWYzRzQxUk1xZ2hMb3h5Qmt3NHN4ZXZ1MU5w?=
 =?utf-8?B?YkFvWDZiU25GOGU2c3NqT2wxaEgrM0hvTEs1YkF6Q3ZlZFMyQVZNWE9GS3o5?=
 =?utf-8?B?SEFLOHg3TmZpN2VIOWRsSG1yMGtSV0k4L3pYNVEyN21VMlprdStUL1NnVVB0?=
 =?utf-8?B?dldDWVN2cHhKZXhkTEw3SEtzYUo0N2MxYlNHWmpiSmd5SmQ5WkhsZk1uR3U2?=
 =?utf-8?B?L25SeW5ZbWJZbHJFNVBGTmJFcDVKK1pJd2RoT3dCSmxEclJGS01GV3FkRTFs?=
 =?utf-8?B?VGZFZjNZbWY1SzZGeXNXM1dqN3NsTHh2NzIxRkppYjhlVEZOa2VYZVBvUktO?=
 =?utf-8?B?Y2V3Wmx0YzFkT2JMNjE4N1VST3pwNlJRbFdTRUoxNXBrVVZobTBsNlJzSzlT?=
 =?utf-8?B?N1ZxUjFsWTVlUzMyK2x0MW40SEdEQmE3MmlxTUhLNFdHUFAyMlQ4SmNJSmg5?=
 =?utf-8?B?TFBmRlIva2piMnJ3dEc4eThNK0wvZ2pmQzNjaWV4aW51RGdpeEN2SHp4d1Zq?=
 =?utf-8?B?NVNiODJvMmRCaGxWbFVRaTBTbDdJOEhVWHNDNnF1Ykg3TVZpbk9vc0dSY0J2?=
 =?utf-8?B?U3ZMSVFKaGNwR3F5Y3F4REd6M3daYklmQ1U0cGZWV3A1aVZJb2wvVThQOWVP?=
 =?utf-8?B?L0ZjdFkxVzFlWVRpblVTZ2ZKOE9tUUVuNmt5Q1ZqRmhzOUVuYzA4VU1EdEo2?=
 =?utf-8?B?ZGd1ZzRvRSswWnYzS1BDK2dYbkprbDErc3orQXZ0M1JnRU11VGNRMmp2OExt?=
 =?utf-8?B?YmhKS1JlYWRhWkN1eWpCMjlyYVgySVFVOElvanRnM1ZZNkVhdzN0N0Q5RTRR?=
 =?utf-8?B?WE8wLzhQK1J2a09mZi9KUE81YnllY1JxNy9nZ2Z3Tk8vS3Z4eWxEZkZPbkIy?=
 =?utf-8?B?bTI1UUtFMEQwL2kvUXRMZWkrbUhtaCs3S3JrWUQzclZGbGZPT0liY2F3Z1RY?=
 =?utf-8?B?Zks0azFxOEJ4dEhPRjZjRGNOcUFXYzFHcUxIalBPbnlIaWZmSFBEVXR1MmNs?=
 =?utf-8?B?UTh1SkU4T0xMcVkreDhyWjRMVmE5QXU0VzRNUFpLMXlxUlluWHlvbmtQZzI3?=
 =?utf-8?B?Y0MwRVJ4MmVjQ2JHaHEzZEVMUUZYWGlxYU4zZ01uU1h3ZFA0Y2JaUzdiMTFr?=
 =?utf-8?B?MTJ5QjhBT1RuZFc3STJOazFUczUrNHVuWEpkaXFWRHNmU3NzVkh5OUdSdUs3?=
 =?utf-8?B?N2Vmais2NzhoWWpIQU1wS3dOL2hrbHh6TzU5Qi94aUJDUHJhQ0FFZUhod0Jv?=
 =?utf-8?B?cHhZQVhZVDlsS094YitkZm1SYXF4QTJKM3NHWGd5ak44VlpkMVBLUkUzY2NQ?=
 =?utf-8?B?UC9yNFVuSXhmK2ZSaHdWTjBCbGpJclF1Y2IzbWJZTU16YkdXNVdKNVhqOEY5?=
 =?utf-8?B?WHRTeVNIb05ldi91NXpYcEpqd0hjNytLVzhVZE9SNkx1QjJDTitibDdZd1Fw?=
 =?utf-8?B?bmlFRTIvMHVRcjMxR0hodTNHUjJ1dTNodEo2WW1VYWVIV2FEcUl3V0xiWm8y?=
 =?utf-8?B?NUVEWlUzMjc3bCtMM0FKL0lVVHNVNHl2djhxVE43NjZXVHJOMjd1REdxRTlG?=
 =?utf-8?B?UE5iY1IyU3hKQTdKL1BmajQ4ank5all0ajJuMFZqUzZhQ1lucEFPdUNrZTFD?=
 =?utf-8?B?dkFJNGcxdHNaTG4xQ2g3dzVQWEd4OEZsd2hKZjZmYk5YWlRZUWFBZDdYUmNZ?=
 =?utf-8?B?VzBQRjY3UkZoajJnTzRHbmdOMHlOZHBvU3IxT2ZjdWpCUHZyRzBpWC9Na2g5?=
 =?utf-8?B?VHROZXZPMjJ0L2xvSG8vVE1HTHZqbng0VEFaSHpZRFlEYjdJbDBQUC90NHBM?=
 =?utf-8?B?UkNYY0VPMktLYmJiWERVejFpcjBqVWtrUy8rankwYktldDJnQ0JseGpheExD?=
 =?utf-8?B?eDBiZHNWNEJSVkc0VDJ4TnZjaFJCc2l3NnEzQ1U0SnBTR3JrQ2NQUTRCdUpu?=
 =?utf-8?B?UmJoS3dwTXVnYTVzbmFoNGJqbVVFbVhzT1ZIQ1hZMVJ6ZXllMmh0cUZ4a1BO?=
 =?utf-8?B?cGdwdnlGTkV4aDYyZkNjbEVSWWdoOXA2Q3IvOVQ4dTlwZzFvTFVCMjI2K2VF?=
 =?utf-8?B?MUtxbDNCNHp2bjAyN1kyRnpjSURzeTdiWHNHQzJpK0ZrRDRqZXRtQ2NmSVNI?=
 =?utf-8?B?cE5NZ284em9jcGdsekxTODYzMVNtMnVFTFhqR2tqUDN4ZVMvaTVhbE54RzR4?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C6F08F3BAFD864E814DB5E1F5349739@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5857.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d79685f8-3423-4ebb-32d6-08dd3c824848
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2025 14:20:41.2031 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FmCj5vE7H7uq6B2GE8M5ilEMnUhwSnD/frv2ng8YUgHatG7uqayqvTXkEP0ITSh9wzKM0leEl+5GiybnAP/gaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6752
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

T24gVGh1LCAyMDI1LTAxLTIzIGF0IDAwOjUwIC0wNjAwLCBMdWNhcyBEZSBNYXJjaGkgd3JvdGU6
DQo+IE9uIFdlZCwgSmFuIDIyLCAyMDI1IGF0IDA5OjUxOjQyQU0gLTAzMDAsIEd1c3Rhdm8gU291
c2Egd3JvdGU6DQo+ID4gUXVvdGluZyBMdWNhcyBEZSBNYXJjaGkgKDIwMjUtMDEtMjEgMTk6NTc6
MzMtMDM6MDApDQo+ID4gPiBGb3IgZWFzaWVyIHJlcHJvIHNjZW5hcmlvcywgYWRkIHRoZSBjbWRs
aW5lIHRvIHRoZSBqc29uOiBvbmUgY2FuIHNlZSB0aGUNCj4gPiA+IGV4YWN0IGNvbW1hbmQgZXhl
Y3V0ZWQgdG8gdHJ5IHRvIHJlcHJvZHVjZSBhIENJIGZhaWx1cmUgd2l0aG91dCBuZWVkaW5nDQo+
ID4gPiBleHRyYSBmaWxlcy4NCj4gPiA+IA0KPiA+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUg
TWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHJ1bm5l
ci9qc29uX3Rlc3RzX2RhdGEvYWJvcnRlZC1hZnRlci1hLXRlc3QvcmVmZXJlbmNlLmpzb24gfCAx
ICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvYWJvcnRlZC1vbi1ib290L3JlZmVyZW5j
ZS5qc29uICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvZG1lc2ctZXNj
YXBlcy9yZWZlcmVuY2UuanNvbiAgICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3Rz
X2RhdGEvZG1lc2ctcmVzdWx0cy9yZWZlcmVuY2UuanNvbiAgICAgICAgfCAxICsNCj4gPiA+IC4u
Li9kbWVzZy13YXJuLWxldmVsLW9uZS1waWdsaXQtc3R5bGUvcmVmZXJlbmNlLmpzb24gICAgICAg
fCAxICsNCj4gPiA+IC4uLi9kbWVzZy13YXJuLWxldmVsLXBpZ2xpdC1zdHlsZS9yZWZlcmVuY2Uu
anNvbiAgICAgICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvZG1lc2ct
d2Fybi1sZXZlbC9yZWZlcmVuY2UuanNvbiAgICAgfCAxICsNCj4gPiA+IC4uLi9yZWZlcmVuY2Uu
anNvbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxICsNCj4gPiA+
IC4uLi9keW5hbWljLXN1YnRlc3RzLWtlZXAtYWxsL3JlZmVyZW5jZS5qc29uICAgICAgICAgICAg
ICAgfCAzICsrLQ0KPiA+ID4gLi4uL2R5bmFtaWMtc3VidGVzdHMta2VlcC1keW5hbWljL3JlZmVy
ZW5jZS5qc29uICAgICAgICAgICB8IDEgKw0KPiA+ID4gLi4uL2R5bmFtaWMtc3VidGVzdHMta2Vl
cC1yZXF1ZXN0ZWQvcmVmZXJlbmNlLmpzb24gICAgICAgICB8IDMgKystDQo+ID4gPiAuLi4vZHlu
YW1pYy1zdWJ0ZXN0cy1rZWVwLXN1YnRlc3RzL3JlZmVyZW5jZS5qc29uICAgICAgICAgIHwgMyAr
Ky0NCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvZW1wdHktcmVzdWx0LWZpbGVzL3JlZmVy
ZW5jZS5qc29uICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvZ3JhY2VmdWwt
bm90cnVuL3JlZmVyZW5jZS5qc29uICAgICAgfCAxICsNCj4gPiA+IC4uLi9pbmNvbXBsZXRlLWJl
Zm9yZS1hbnktc3VidGVzdHMvcmVmZXJlbmNlLmpzb24gICAgICAgICAgfCAxICsNCj4gPiA+IHJ1
bm5lci9qc29uX3Rlc3RzX2RhdGEvbm9ybWFsLXJ1bi9yZWZlcmVuY2UuanNvbiAgICAgICAgICAg
fCAxICsNCj4gPiA+IC4uLi9ub3RydW4tcmVzdWx0cy1tdWx0aXBsZS1tb2RlL3JlZmVyZW5jZS5q
c29uICAgICAgICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvbm90cnVu
LXJlc3VsdHMvcmVmZXJlbmNlLmpzb24gICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rl
c3RzX2RhdGEvcGlnbGl0LXN0eWxlLWRtZXNnL3JlZmVyZW5jZS5qc29uICAgfCAxICsNCj4gPiA+
IC4uLi9qc29uX3Rlc3RzX2RhdGEvdW5wcmludGFibGUtY2hhcmFjdGVycy9yZWZlcmVuY2UuanNv
biAgfCAxICsNCj4gPiA+IC4uLi93YXJuaW5ncy13aXRoLWRtZXNnLXdhcm5zL3JlZmVyZW5jZS5q
c29uICAgICAgICAgICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9qc29uX3Rlc3RzX2RhdGEvd2Fy
bmluZ3MvcmVmZXJlbmNlLmpzb24gICAgICAgICAgICAgfCAxICsNCj4gPiA+IHJ1bm5lci9yZXN1
bHRnZW4uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA3ICsrKysr
Ky0NCj4gPiA+IDIzIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9ydW5uZXIvanNvbl90ZXN0c19kYXRhL2Fi
b3J0ZWQtYWZ0ZXItYS10ZXN0L3JlZmVyZW5jZS5qc29uIGIvcnVubmVyL2pzb25fdGVzdHNfZGF0
YS9hYm9ydGVkLWFmdGVyLWEtdGVzdC9yZWZlcmVuY2UuanNvbg0KPiA+ID4gaW5kZXggMDc3NmY3
NTgyLi41MGJhOWU2ZTEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9ydW5uZXIvanNvbl90ZXN0c19kYXRh
L2Fib3J0ZWQtYWZ0ZXItYS10ZXN0L3JlZmVyZW5jZS5qc29uDQo+ID4gPiArKysgYi9ydW5uZXIv
anNvbl90ZXN0c19kYXRhL2Fib3J0ZWQtYWZ0ZXItYS10ZXN0L3JlZmVyZW5jZS5qc29uDQo+ID4g
PiBAQCAtMyw2ICszLDcgQEANCj4gPiA+ICAgInJlc3VsdHNfdmVyc2lvbiI6MTAsDQo+ID4gPiAg
ICJuYW1lIjoibm9ybWFsLXJ1biIsDQo+ID4gPiAgICJ1bmFtZSI6IkxpbnV4IGhvc3RuYW1lIDQu
MTguMC0xLWFtZDY0ICMxIFNNUCBEZWJpYW4gNC4xOC42LTEgKDIwMTgtMDktMDYpIHg4Nl82NCIs
DQo+ID4gPiArICAiY21kbGluZSI6W10sDQo+ID4gPiAgICJ0aW1lX2VsYXBzZWQiOnsNCj4gPiA+
ICAgICAiX190eXBlX18iOiJUaW1lQXR0cmlidXRlIiwNCj4gPiA+ICAgICAic3RhcnQiOjE1Mzk5
NTM3MzUuMTExMDM4OSwNCj4gPiA+IGRpZmYgLS1naXQgYS9ydW5uZXIvanNvbl90ZXN0c19kYXRh
L2Fib3J0ZWQtb24tYm9vdC9yZWZlcmVuY2UuanNvbiBiL3J1bm5lci9qc29uX3Rlc3RzX2RhdGEv
YWJvcnRlZC1vbi1ib290L3JlZmVyZW5jZS5qc29uDQo+ID4gPiBpbmRleCA3NWYxOTQ2NjAuLjIz
OGVjNmZmZiAxMDA2NDQNCj4gPiA+IC0tLSBhL3J1bm5lci9qc29uX3Rlc3RzX2RhdGEvYWJvcnRl
ZC1vbi1ib290L3JlZmVyZW5jZS5qc29uDQo+ID4gPiArKysgYi9ydW5uZXIvanNvbl90ZXN0c19k
YXRhL2Fib3J0ZWQtb24tYm9vdC9yZWZlcmVuY2UuanNvbg0KPiA+ID4gQEAgLTMsNiArMyw3IEBA
DQo+ID4gPiAgICJyZXN1bHRzX3ZlcnNpb24iOjEwLA0KPiA+ID4gICAibmFtZSI6Im5vcm1hbC1y
dW4iLA0KPiA+ID4gICAidW5hbWUiOiJMaW51eCBob3N0bmFtZSA0LjE4LjAtMS1hbWQ2NCAjMSBT
TVAgRGViaWFuIDQuMTguNi0xICgyMDE4LTA5LTA2KSB4ODZfNjQiLA0KPiA+ID4gKyAgImNtZGxp
bmUiOltdLA0KPiA+ID4gICAidGltZV9lbGFwc2VkIjp7DQo+ID4gPiAgICAgIl9fdHlwZV9fIjoi
VGltZUF0dHJpYnV0ZSIsDQo+ID4gPiAgICAgInN0YXJ0IjoxNTM5OTUzNzM1LjExMTAzODksDQo+
ID4gPiBkaWZmIC0tZ2l0IGEvcnVubmVyL2pzb25fdGVzdHNfZGF0YS9kbWVzZy1lc2NhcGVzL3Jl
ZmVyZW5jZS5qc29uIGIvcnVubmVyL2pzb25fdGVzdHNfZGF0YS9kbWVzZy1lc2NhcGVzL3JlZmVy
ZW5jZS5qc29uDQo+ID4gPiBpbmRleCA5MWM1NzMxMDYuLmU3NGRjODllNCAxMDA2NDQNCj4gPiA+
IC0tLSBhL3J1bm5lci9qc29uX3Rlc3RzX2RhdGEvZG1lc2ctZXNjYXBlcy9yZWZlcmVuY2UuanNv
bg0KPiA+ID4gKysrIGIvcnVubmVyL2pzb25fdGVzdHNfZGF0YS9kbWVzZy1lc2NhcGVzL3JlZmVy
ZW5jZS5qc29uDQo+ID4gPiBAQCAtMyw2ICszLDcgQEANCj4gPiA+ICAgInJlc3VsdHNfdmVyc2lv
biI6MTAsDQo+ID4gPiAgICJuYW1lIjoibm9ybWFsLXJ1biIsDQo+ID4gPiAgICJ1bmFtZSI6Ikxp
bnV4IGhvc3RuYW1lIDQuMTguMC0xLWFtZDY0ICMxIFNNUCBEZWJpYW4gNC4xOC42LTEgKDIwMTgt
MDktMDYpIHg4Nl82NCIsDQo+ID4gPiArICAiY21kbGluZSI6W10sDQo+ID4gPiAgICJ0aW1lX2Vs
YXBzZWQiOnsNCj4gPiA+ICAgICAiX190eXBlX18iOiJUaW1lQXR0cmlidXRlIiwNCj4gPiA+ICAg
ICAic3RhcnQiOjE1Mzk5NTM3MzUuMTExMDM4OSwNCj4gPiA+IGRpZmYgLS1naXQgYS9ydW5uZXIv
anNvbl90ZXN0c19kYXRhL2RtZXNnLXJlc3VsdHMvcmVmZXJlbmNlLmpzb24gYi9ydW5uZXIvanNv
bl90ZXN0c19kYXRhL2RtZXNnLXJlc3VsdHMvcmVmZXJlbmNlLmpzb24NCj4gPiA+IGluZGV4IGU5
ZTAxMTg1My4uODE4OTBmN2QyIDEwMDY0NA0KPiA+ID4gLS0tIGEvcnVubmVyL2pzb25fdGVzdHNf
ZGF0YS9kbWVzZy1yZXN1bHRzL3JlZmVyZW5jZS5qc29uDQo+ID4gPiArKysgYi9ydW5uZXIvanNv
bl90ZXN0c19kYXRhL2RtZXNnLXJlc3VsdHMvcmVmZXJlbmNlLmpzb24NCj4gPiA+IEBAIC0zLDYg
KzMsNyBAQA0KPiA+ID4gICAicmVzdWx0c192ZXJzaW9uIjoxMCwNCj4gPiA+ICAgIm5hbWUiOiJu
b3JtYWwtcnVuIiwNCj4gPiA+ICAgInVuYW1lIjoiTGludXggaG9zdG5hbWUgNC4xOC4wLTEtYW1k
NjQgIzEgU01QIERlYmlhbiA0LjE4LjYtMSAoMjAxOC0wOS0wNikgeDg2XzY0IiwNCj4gPiA+ICsg
ICJjbWRsaW5lIjpbXSwNCj4gPiA+ICAgInRpbWVfZWxhcHNlZCI6ew0KPiA+ID4gICAgICJfX3R5
cGVfXyI6IlRpbWVBdHRyaWJ1dGUiLA0KPiA+ID4gICAgICJzdGFydCI6MTUzOTk1MzczNS4xMTEw
Mzg5LA0KPiA+ID4gZGlmZiAtLWdpdCBhL3J1bm5lci9qc29uX3Rlc3RzX2RhdGEvZG1lc2ctd2Fy
bi1sZXZlbC1vbmUtcGlnbGl0LXN0eWxlL3JlZmVyZW5jZS5qc29uIGIvcnVubmVyL2pzb25fdGVz
dHNfZGF0YS9kbWVzZy13YXJuLWxldmVsLW9uZS1waWdsaXQtc3R5bGUvcmVmZXJlbmNlLmpzb24N
Cj4gPiA+IGluZGV4IDhkMjY2Y2RmYS4uMTZjOTdkM2ExIDEwMDY0NA0KPiA+ID4gLS0tIGEvcnVu
bmVyL2pzb25fdGVzdHNfZGF0YS9kbWVzZy13YXJuLWxldmVsLW9uZS1waWdsaXQtc3R5bGUvcmVm
ZXJlbmNlLmpzb24NCj4gPiA+ICsrKyBiL3J1bm5lci9qc29uX3Rlc3RzX2RhdGEvZG1lc2ctd2Fy
bi1sZXZlbC1vbmUtcGlnbGl0LXN0eWxlL3JlZmVyZW5jZS5qc29uDQo+ID4gPiBAQCAtMyw2ICsz
LDcgQEANCj4gPiA+ICAgInJlc3VsdHNfdmVyc2lvbiI6MTAsDQo+ID4gDQo+ID4gSG0uLi4gQXJl
IHdlIGdvaW5nIHRvIGNvbnRpbnVlIHdpdGggMTAgYXMgdGhlIHZlcnNpb24gYWZ0ZXIgaW5jbHVk
aW5nDQo+ID4gYW5vdGhlciBmaWVsZD8gQXJlIHRoZXJlIGd1aWRlbGluZXMgb24gaG93IHJlc3Vs
dHNfdmVyc2lvbiBzaG91bGQgYmUNCj4gPiBoYW5kbGVkPw0KPiANCj4gZ29vZCBxdWVzdGlvbi4u
Li4gbGFzdCB0aW1lIGl0IHdhcyB1cGRhdGVkIHdhcyBpbiAyMDE4LCB0byBiZSBjb21wYXRpYmxl
DQo+IHdpdGggcGlnbGl0Lg0KPiANCj4gY29tbWl0IDJjNzkzNjY2ZDhjODMyODczM2Y1NzY5YjE2
YWU1ODU4ZmVlOTdmM2YNCj4gQXV0aG9yOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGlu
dGVsLmNvbT4NCj4gRGF0ZTogICBXZWQgRGVjIDUgMTQ6NTM6NDMgMjAxOCArMDIwMA0KPiANCj4g
ICAgICBydW5uZXI6IFByb2R1Y2UganNvbiB3aXRoIHJlc3VsdHNfdmVyc2lvbj0xMA0KPiAgICAg
IA0KPiAgICAgIE5ldyBwaWdsaXQgYnVtcGVkIGl0cyByZXN1bHRzX3ZlcnNpb24gdG8gMTAsIG1h
a2luZyBnbHhpbmZvIGFuZCBwYWxzDQo+ICAgICAgb3B0aW9uYWwgaW4gcHJhY3RpY2UsIG5vdCBq
dXN0IGJ5IGFjY2lkZW50LiBVbmZvcnR1bmF0ZWx5IHJlYWRpbmcNCj4gICAgICByZXN1bHRzIHdp
dGggbmV3ZXIgcGlnbGl0IGF0dGVtcHRzIHRvIGNvbnZlcnQgdGhlIHJlc3VsdHMgdG8gdmVyc2lv
bg0KPiAgICAgIDEwLCByZWFkaW5nIGdseGluZm8gYW5kIHBhbHMsIGFuZCB0aHVzIGZhaWxzLiBJ
biBhIGhpbGFyaW91cyBzdW1tYXJ5Og0KPiAgICAgIEEgY29tbWl0IHRvIHBpZ2xpdCBtYWtpbmcg
Z2x4aW5mbyBvcHRpb25hbCBtYWtlcyBpdCBtYW5kYXRvcnkgZm9yIHVzLg0KPiAgICAgIA0KPiAg
ICAgIHYyOiBqc29uIHVuaXQgdGVzdHMgY29uZmlybWVkIHRvIGJlIHdvcmtpbmcuLi4NCj4gICAg
ICANCj4gICAgICBSZXBvcnRlZC1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+
DQo+ICAgICAgU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRl
bC5jb20+DQo+ICAgICAgQ2M6IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVs
LmNvbT4NCj4gICAgICBDYzogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+DQo+ICAg
ICAgVGVzdGVkLWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4NCj4gICAgICBS
ZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPg0K
PiANCj4gRG9lcyB0aGlzIHN0aWxsIHdvcmsgd2l0aCBwaWdsaXQ/ICBzb21ldGhpbmcgSSBkaWRu
J3QgdGVzdCB5ZXQuDQo+IFRoYW5rcyBmb3Igbm90aWNpbmcNCg0KSW4gdGhlIHBhc3QsIHRoZXJl
IHdlcmUgc29tZSB0b29scyBhbmQgQ0kgcnVucyB0aGF0IHVzZWQgcGlnbGl0LCBidXQNCnRoZXkg
YXJlIG5vIGxvbmdlciBhcm91bmQgZm9yIGF0IGxlYXN0IDMrIHllYXJzLiBNZXNhIHRlYW0gd29y
a3Mgd2l0aA0KdGhvc2Ugbm93LCB3ZSBkb24ndCBoYXZlIGEgaGFybmVzcyBvciBwYXJzaW5nIHV0
aWxpdGllcyB0aGF0IHdvcmsgd2l0aA0KcGlnbGl0IGV0IGFsLiBJZiBpdCdzIHN0aWxsIGNvbXBh
dGlibGUsIGl0J3Mgb25seSBieSBhY2NpZGVudCwNCmNvbnNpZGVyaW5nIHRoYXQgZGVxcC1ydW5u
ZXIgZXQgYWwgaXMgdW5kZXIgZmFpcmx5IGFjdGl2ZSBkZXZlbG9wbWVudC4NCg0KPiANCj4gPiAN
Cj4gPiA+ICAgIm5hbWUiOiJub3JtYWwtcnVuIiwNCj4gPiA+ICAgInVuYW1lIjoiTGludXggaG9z
dG5hbWUgNC4xOC4wLTEtYW1kNjQgIzEgU01QIERlYmlhbiA0LjE4LjYtMSAoMjAxOC0wOS0wNikg
eDg2XzY0IiwNCj4gPiA+ICsgICJjbWRsaW5lIjpbXSwNCj4gPiANCj4gPiBXZWxsLCBjbWRsaW5l
IGlzIG5vdCBzdXBwb3NlZCB0byBiZSBlbXB0eS4gU2hvdWxkbid0IHdlIGhhdmUgYXQgbGVhc3Qg
YQ0KPiA+IGZha2UgY29tbWFuZCBoZXJlPyBFLmcuIFsiaWd0X3J1bm5lciJdIG9yIGV2ZW4gd2l0
aCBzb21lIGNvbW1vbg0KPiA+IGFyZ3VtZW50cy4uLg0KPiANCj4gaWYgSSByZW1lbWJlciB3ZWxs
LCBJIHRyaWVkIHRoYXQsIGJ1dCB0aGVuIGl0IHRyaWVzIHRvIG1hdGNoIHRoZSBudW1iZXINCj4g
b2YgbWVtYmVycyBpbiB0aGUgYXJyYXkgLSBpdCB3b24ndCBtYXRjaCBzaW5jZSBpZ3RfcnVubmVy
IG1heSBiZQ0KPiBjYWxsZWQgaW4gZGlmZmVyZW50IHdheXMuIE1heWJlIHRoZXJlJ3MgYSB3YXkg
dG8gdGVsbCB0aGUgdGVzdCBzdWl0ZSB0bw0KPiBpZ25vcmUgdGhlIGVsZW1lbnRzIG9mIHRoZSBh
cnJheS4gSSB3aWxsIGNoZWNrLg0KPiANCj4gTHVjYXMgRGUgTWFyY2hpDQo+IA0KPiA+IA0KPiA+
IC0tDQo+ID4gR3VzdGF2byBTb3VzYQ0KDQo=
