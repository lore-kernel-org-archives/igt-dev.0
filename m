Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9941D116F5
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 12:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5193510E3C5;
	Mon,  1 Dec 2025 12:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKDHVPCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8E110E3C5
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764591829; x=1796127829;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nVzG13SGnEc9cQ8nLJhnS8ENQRnyGSPom0LjTphXxKs=;
 b=MKDHVPCy2HwD+Nc+4GfJ759burBnHijvKc42PatWcBSjAS3gL+8hFb3B
 n+Wds0Xm0fDtyO6waTMIhwJ8VVLK2MVH/StVLZGFNEgxXhSqKs/hHDX5H
 4xk1JMpR1x4Q2j7TNXCAFaDeAD1YZ3KTG77Jl2OCbprk29qHbqbErTtBT
 bZQFvvcGZfaCgs0CI+dLNQ4nvpLnuHbYi1m83iOQSVk0rQwl3llg+m6ZH
 NHNHeehK6IcVfaGHj+6tjhpHRwyW7Denf/9ZcJ46tsIIh4qmEeqqRjDgE
 9yUzwrVY5Xj/cyHtuCyJFko52m1OYt9fsgpaDS/AymJ+JqwPnymttzHhw Q==;
X-CSE-ConnectionGUID: qHhcAUzHR2K80GflO/W1kQ==
X-CSE-MsgGUID: e1NDIAHlS/emOkrVAlkK8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66563644"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66563644"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 04:23:48 -0800
X-CSE-ConnectionGUID: Z71WL10rQumxiqSsN+WoYw==
X-CSE-MsgGUID: zIAL+B4XQtqV2RxtnNDFig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224752368"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 04:23:48 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 04:23:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 04:23:47 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 04:23:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5KqdLwBymJfB2XK2ysh8kkZeuxHrVAIv8iO2SbSH6l476Maj2d3ptrhMuiZOEty9ub9ekJMmu2qmrTcZlF9kOtlvg45vvC2F8FUQ9HTXEOvLhAPpOT/E0CKwPNHBjQl0EVjb6T57dMYaQdPfUztiIl6pnm08sRUncDYuhSC02hqTrt4LRr3Gds22792/VUq++2jm381PnxqnMBsW/y4jaZa5C2MlmWEC9eNz3ilQHYMMPchnZCW9knXhiwP2YMCyjfRwT3R0a8juIDlntc0B0qTO7y2cnrZTIEawiSctvkpcFaKAUFcIPCB5QaqwLkYJX0D4k+1a3Waks6/8C3OSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVzG13SGnEc9cQ8nLJhnS8ENQRnyGSPom0LjTphXxKs=;
 b=eC5OfKVHeQ8LJwnjy8llibx6yNFyZpP5AqcIzgNlRUK74xEemwz7xXfrJmRiHnC34Uv5lAmAKk/6n7s2UILHF0pD+Qc3EIpvZLwys1wAvDqzdHfLxUS/lyIHnulOahwvemtt6MuRESkcrLm0OpmdUCL/B4CyQgWeJ7OHP4/CWlL66tdHAUZSGMU/fWfENxebwH5WR6qszLSpQV+Aerln5hSoClsP2zBJ9l7IF0uXtG8q3z5KF+tc3zEsJSqsRTLZI9B6pMfLn6vQmWc8m2QCDBvdddhBLiJf2rg3yg1vAOcZwQ1rdl7tkU3KMlLcJiX8RO4Y3EELoqeeG4pE54IDKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9366.17; Mon, 1 Dec 2025 12:23:45 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:23:45 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Gurram,
 Pravalika" <pravalika.gurram@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_sriov*: Force disable EU debug
 before running SR-IOV test
Thread-Topic: [PATCH i-g-t] tests/intel/xe_sriov*: Force disable EU debug
 before running SR-IOV test
Thread-Index: AQHcYq4T6R0w5qmLCk+hNx6abceMlLUMl9cAgAAayQA=
Date: Mon, 1 Dec 2025 12:23:45 +0000
Message-ID: <DS0PR11MB72644B34209E233DEF965E8BD9DBA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20251201104303.2438191-1-pravalika.gurram@intel.com>
 <58708ef2-0b4d-48cd-ae92-a0e174ee3068@intel.com>
In-Reply-To: <58708ef2-0b4d-48cd-ae92-a0e174ee3068@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|DM4PR11MB6550:EE_
x-ms-office365-filtering-correlation-id: f13dfb86-70be-4956-b78b-08de30d478f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OXVFbWNLOVErZFB6L2hRdjFrT0pza3lXOWkyVENldlpaeE8wUXFORWc3V0Nq?=
 =?utf-8?B?dVBxaklNZnJtTlNqTzFLWmkrL2tJczl6QlU0TUZEWE8vekIvQ3pCU1prR1Bh?=
 =?utf-8?B?eEJwbzJCdzRCK1RpTXhrSFZRbys3OExHYnc0WnUrc01RT2dNNzlHd0Q1MXly?=
 =?utf-8?B?d0JTdlphOGhrK1FXZ0R2VzNwdE5IYTFZcEJoOE1rdWx4cmx6Ny9RMUFrd01I?=
 =?utf-8?B?cDFxbWY1UXVPRGFzUFR3S2xZVTM1T2NWQlA5aDJkNjhPQ1c2S0poRFJNSEdN?=
 =?utf-8?B?YWh3QXZPbzN6amx2Si94TXBFQkE5V1hnaWttZzhWUWtvSzhDZnljTHprblRt?=
 =?utf-8?B?QU9tSmw3R2xyWmRwQkp2VHpBVFdKcHhlQ1A1YTZEWmhOVDNKYmF1cmNiS2ZY?=
 =?utf-8?B?SGlEMnh0Qm1QWTRKY0NOcXlRQTVWMm5wYnkyQnBZVzBPM3Q2dmhUT3IzMWo5?=
 =?utf-8?B?NVhqNTZCdHltYTQvMkFOb1hOSmZvV2U4Q3RzNm85bU1mdGljajc5WUlJcXYr?=
 =?utf-8?B?RHU0MjZpbkxJeWxtSElYbXltOFYrNW5FWjVKUjNwRGtEcmxKVFJUTWVObTlM?=
 =?utf-8?B?Y0FKNVlFRDJjRkZZeUtwbmFWSHlxNG9tMWxRUG1uWkVYcWVrbmxhTURPcWdC?=
 =?utf-8?B?RjlybHcvc3hNeEFQcXExdzBsZDFrbnlsVEpHQnFtVjJ2allhNit5VU9PcXZl?=
 =?utf-8?B?MVVQTll5bTlxWlBMV1B5WlppSi9uZVlQaTRJRExUbENuQmJ0MmczcHdvTmkr?=
 =?utf-8?B?Q2ZNK1J3WmxUcld5YUVJQWhSaDMxcVk3ZzE4NHpNcXkvVGREZjhZZjFuT09y?=
 =?utf-8?B?U20zN2VPQ0QvaU5uODYrZ2VOU2lPV0hxS2xoZUoyZUw0RkcyNXU5eXJQeFNl?=
 =?utf-8?B?SnVoRWVCMHY2UjVjVFlBbW8xNk0zRlNkelhVYTlDemd5bW4wa2o5cGI1OTYy?=
 =?utf-8?B?WDFsUWdjMS85NzVLOXdETk9xeGtaN3FhZVZ0aDlzdXlvRFlyMC93bXZnVFN3?=
 =?utf-8?B?anNEZ09Vd0g1ZWNSbFZROVZ4anQvS0l0YzdLeTRxNVJaaXIvTWZpZ0JubGNz?=
 =?utf-8?B?VW4xQ2FmZEhHOHVjVnU1OVRMR2dqZWUzQjZKeHBCT3I3clZ3eTMyMFkxejdE?=
 =?utf-8?B?c1dMK2JJYzh3QXhzNlQwam5DTUpxMGJBdElRZUlsanZLRm5wby9yZEVRVDhE?=
 =?utf-8?B?ZU5mN3NkTmQ1MjFUQ1hrRUdCbVI2VWxFL0dJbWwzREdOS3dPam9OQ2YveDJh?=
 =?utf-8?B?Yi8wV24yM0ZXZVdkMzlJL0NUMkxCc09najhaeEZHT1RjUVdoK0JheUhOWDl3?=
 =?utf-8?B?NE9YL3o5WnlvOVRCR0E2Vk9ZYVdPYnB1cEV5QVFoMWI5YU50RFZTZWVjcjFm?=
 =?utf-8?B?VmFPS3g4M1Z4aVZxWk5qaXZoeFpjWkl3N3VqWFhiNERHeDREdm10UVRURmRT?=
 =?utf-8?B?djV4MUNwTjA1bWFPOFJ1SitJOHRQbUN0ZzlXemljdDE5NTVPWDY2Z2plSnFF?=
 =?utf-8?B?M0ZickI5Z0cxYXZCWS9QczZJS0pyeTZkUmpYWlYvMmUvRUpSWGc5L0FYWldI?=
 =?utf-8?B?RE9CVmxFSGJEaWVrLy9IZUZWVDVmZXNwaU05ZFJGTDNyamJFd0hhVEtnSGov?=
 =?utf-8?B?bUc2Qkt2REgwcFY2OWtaY1BCb3RlSzhtU1pUV3V5ZDJoVXJ3RmxwVTI4cE84?=
 =?utf-8?B?UGJPbGdRY0l6K2pNVEdCRUhla2E5d3VYZXhFVENudFlWT3BRKzltMEpSa3Ev?=
 =?utf-8?B?czgvUjlTUWdkRy9oZ3VUU0ZqK1F5cGhzZGZ3bWZVMGR6dFVqalBram1IZmc3?=
 =?utf-8?B?R0VjMjRvUURXQTBqQTY4ZU5HYWU1VGV3TVdYSm4wWGZEY1BFWmhid3lza1h3?=
 =?utf-8?B?dFloNytlOGFGem9tdUl3M3Q5N2U2MVEzN3dKazhiRVpUZERIN0FCTHZHbmM2?=
 =?utf-8?B?OWJvVFJVeXIvVFoxZ2FndG1PUGJ4R0xXd2JmQS9qQWlsNnRIb3ZJcGc4UEZL?=
 =?utf-8?B?dWpHRXZ4d3paTHRGcnVqSEI4bkRla3dlb2J6UitGSXFOUVhrR3BQcHNXRExE?=
 =?utf-8?Q?xaGigD?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2w1dTdWTXpROXpJTURoUXVoQ3h4WnlkeDlnRCt6eEo0SFpHUXZ4WDJ6L25E?=
 =?utf-8?B?V2k4WjV1MFlMYTNzZE82cE1oaGc2cEd6QTVoMEwyM1dMRGdaSEhHYmZjSWZi?=
 =?utf-8?B?WVcrTkpYNFpXaGpjbEsxWVV1bWFFZVdMWmgyY1l1c0VCcnJ0LzFOMzlpTjNM?=
 =?utf-8?B?ZFlCbXRQa01xUldXUzFJTDNpU2k3ZTdybHNEYjlsZjhYT0Q0WkVCK01jQmxT?=
 =?utf-8?B?bGRhcTB5eCtqa1ZsVHpnSlQzOVhQajBnV2NKTWVqamZJb0xtY3dxR2h6QTgw?=
 =?utf-8?B?Y3J0VUlHeTBZZGFUeTdVeXoxTTIrMUc2Z3RKa0lxeTI2T1NxSUpZaGpCeGxz?=
 =?utf-8?B?VzJscUJIR0Fzc21RQzB4cE9meXlKb0dQQkxCdHE4ZGFITVFSUDNjckhLc0VN?=
 =?utf-8?B?US8wcithOUtramEwTE5zZ25acW1YN3BCckd5RVdWL0F0Q3NEeVlOSTBOWG9z?=
 =?utf-8?B?MVNINHNjQUxwaHo2c3NFWHY1UVQ2TE5BdTdxOWszcXRQWE53M09pWnRWVWpX?=
 =?utf-8?B?OVJwTHFvMHdzbnNYd1dwVkM2SWwyditnUFVRbUViT3gvV0RIWVJRN0hMQkVB?=
 =?utf-8?B?MzluL0IxVm1HNWJmakNDUlNQdTR6d1M0eWd3b21zbk5YQzIzbSt6SC9lbm1H?=
 =?utf-8?B?SEIwSm1jak9WcHFYLzlOemFjNXpCTkZoNlJ2NDEyNUdleDYvOWo4bTAxVjhT?=
 =?utf-8?B?OCtWNkFva1ErWEdSUTJ1bnEzb1RpZWFJY1FyMysvaW1XNGU5UDRpd3hFRFRP?=
 =?utf-8?B?NHZJMlIyWnd4Uk5MTGw5cHhKSWZjbE9JR2I1R1l4aW9SYTFWWjVuTTNZMTlY?=
 =?utf-8?B?UWkyeU1ZeXJRc0FlZTRJajMwOHdLcGNpR0pkdW9OKzcrVE5Eb1k4amR3eHpi?=
 =?utf-8?B?d2VTblVkTlZWYTdlNkFmSEg2WEM5Qjl6OU1HNTVhZ2FuajNqejZtZXZLMXU3?=
 =?utf-8?B?UHlPbllpaS9rK200TWFqMDk3NTMvTTBWVWtCWVhCM2NJT0NyeXQ1bkw2aldu?=
 =?utf-8?B?ZzQwNXppZG9ZN3duRXFod3E1elU5QnF4eWNxZHlhaXJ2V010TWkzT2E1d0tw?=
 =?utf-8?B?aHN0YVBXZ2Z0c0p2MFEyMnBKYXQ2KzBwcm03TkV6d25qYzFORjVPU29adXcz?=
 =?utf-8?B?M1RqaWRGV0ZDSnYrZ1JseWNSb3pmVEw3UFlzamYwTGJRaU15b1I4ZFo5ZTJk?=
 =?utf-8?B?NDUxYXE4NFVwc05qTmlPMDhHM01mNCtaWEpieE0ycjRnMmtvaHZ2b2JoUVE2?=
 =?utf-8?B?T1FQOUNudjBZQ2pYNk5tQTFSTTJmREMxaEljSmdxZmU5cmowdTIwckdVdC9q?=
 =?utf-8?B?MW4vOFNqVjcxbnNIdW94UURlckhVYUp0R0RyNTFFdjAwRjRvTDY0ZlJORFRy?=
 =?utf-8?B?NmtRSGpqZFpBdGJ5Uzg1azdLN1QzZkl4K21tL2ZNNHRibmNaZFdDYkVvMlpJ?=
 =?utf-8?B?TmM3MDRTT1pRazJLcVRTdkVOMlllSjdmQXZHS1ltazZETFU5VkY0c0JSQndj?=
 =?utf-8?B?bFFnN2FZMnBBY055NnNQbkNteWV5bDNTVUZCSWZjZEQ5Wk5scGIzMjRzTWZr?=
 =?utf-8?B?Q3hSdlRRbTZMc0VvN1lpbEpNcm8wM21UUUo5cllBWmxvdUNhWWpaRnhBZW5W?=
 =?utf-8?B?a1c0TEtScEdOckEydmVPMjZYdk1IK2tGbFBsbThNcHUxVkxpbkRvbXhiV1lU?=
 =?utf-8?B?YWF6WXlobytVZkxNV0FKSk5uS01hMzhWQ2IrK05IRVZJYURyalRnbG1HcTJz?=
 =?utf-8?B?ZlRtbGhMbEsrZFhTS1F5d1A1QlV4V0YrMlZmeEFKbHFSOWYrWjBtcVNrTjda?=
 =?utf-8?B?VjZvdUdKUkljWTFXWWEyV2NZeS8wUmorYnFVKzVHRkFacDNFMERhaDdKUDdZ?=
 =?utf-8?B?Wi94djkvVGVlN1VJNUFYdUNMRGoyTzBIazhPYmhOdHdrVFh4UFNxWFdMb3A3?=
 =?utf-8?B?TmU2WkpveEYyMzFpVUtSMmo2QnNOMVp3dGlTR1UyREpleUEzRDUvbk5xemVp?=
 =?utf-8?B?c0JCMml3djZDZk1oVDRUdkFPVjlhdStzY3ZTVi9JZ2g1TXZXZEgzM2NvRkFQ?=
 =?utf-8?B?alNLYTdnM3h2SjVXcUpSaXJRMEVwWWNpK09QNVYzQ1BYcHR5NnJCZ2l4OEda?=
 =?utf-8?B?eDJtcWl2WERwV0ZZUEp5SU5USlk1by9lQXFVdUZtR3hUTVVjMnJOWUVtVGJB?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13dfb86-70be-4956-b78b-08de30d478f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 12:23:45.3486 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oaNNvMOuI0SWagnLBsxn1bhqgSO/J7G0TYwc0I4zH1s76AC6p2A9P5fZebcv+TvQ6woA7GrhW6zKUxkICVMybBRaYA/lumzXEXkDfUrOUf9TgeOUMmw//Hxoo1ifV4dr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0
LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEsgViBQLA0K
PiBTYXR5YW5hcmF5YW5hDQo+IFNlbnQ6IE1vbmRheSwgRGVjZW1iZXIgMSwgMjAyNSAxMTozOCBB
TQ0KPiBUbzogR3VycmFtLCBQcmF2YWxpa2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPjsg
aWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
aS1nLXRdIHRlc3RzL2ludGVsL3hlX3NyaW92KjogRm9yY2UgZGlzYWJsZSBFVSBkZWJ1ZyBiZWZv
cmUNCj4gcnVubmluZyBTUi1JT1YgdGVzdA0KPiANCj4gDQo+IE9uIDAxLURlYy0yNSA0OjEzIFBN
LCBQcmF2YWxpa2EgR3VycmFtIHdyb3RlOg0KPiA+IEVVIGRlYnVnIGFuZCBTUi1JT1YgY2Fubm90
IGJlIGVuYWJsZWQgdG9nZXRoZXIuDQo+ID4gRmFpbGVkIEVVIGRlYnVnIHRlc3RzIG1heSBsZWF2
ZSB0aGUgZmVhdHVyZSBlbmFibGVkLA0KPiA+IGJsb2NraW5nIFNSLUlPViB0ZXN0cy4gRXhwbGlj
aXRseSBkaXNhYmxlIEVVIGRlYnVnIHRvIGVuc3VyZQ0KPiA+IGNsZWFuIHN0YXRlIGJlZm9yZSBy
dW5uaW5nIFNSLUlPViB0ZXN0Lg0KPiANCj4gQ2FuIHdlIGltcHJvdmUgZXJyb3IgaGFuZGxpbmcg
aW4gRVUgZGVidWcgdGVzdHMgdGhhbiBkaXNhYmxpbmcgRVUgZGVidWcNCj4gaW4gU1JJT1YgdGVz
dHM/DQoNCkkgYW0gd29ya2luZyBvbiBpbXByb3ZpbmcgdGhlIGNsZWFudXAgb2YgRVVkZWJ1ZyB0
ZXN0cy4NCg0KUmVnYXJkaW5nIHRoaXMgc2VyaWVzIC0gaXQgY2FuIGJlIGltcHJvdmVkIGJ5IGRv
aW5nIHRoZSBzYXZlL3Jlc3RvcmUgcm91dGluZQ0Kc2ltaWxhciB0byBFVWRlYnVnIHRlc3RzLCBm
b3IgZXhhbXBsZSB4ZV9ldWRlYnVnX29ubGluZSwgYXMgSSBhbSBhZ2FpbnN0DQptb2RpZnlpbmcg
dGhlIGVudmlyb25tZW50IHdpdGhvdXQgaW50ZW50IHRvIHJlc3RvcmUgaXQgYmFjay4NCg0KVGhh
bmtzLA0KRG9taW5payBLYXJvbA0KDQo+IA0KPiAtU2F0eWEuDQo+IA0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiA+IC0t
LQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVfc3Jpb3ZfYXV0b19wcm92aXNpb25pbmcuYyB8IDIgKysN
Cj4gPiAgIHRlc3RzL2ludGVsL3hlX3NyaW92X2Zsci5jICAgICAgICAgICAgICAgfCAyICsrDQo+
ID4gICB0ZXN0cy9pbnRlbC94ZV9zcmlvdl9zY2hlZHVsaW5nLmMgICAgICAgIHwgMiArKw0KPiA+
ICAgdGVzdHMvaW50ZWwveGVfc3Jpb3ZfdnJhbS5jICAgICAgICAgICAgICB8IDIgKysNCj4gPiAg
IHRlc3RzL3NyaW92X2Jhc2ljLmMgICAgICAgICAgICAgICAgICAgICAgfCAyICsrDQo+ID4gICA1
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90
ZXN0cy9pbnRlbC94ZV9zcmlvdl9hdXRvX3Byb3Zpc2lvbmluZy5jDQo+IGIvdGVzdHMvaW50ZWwv
eGVfc3Jpb3ZfYXV0b19wcm92aXNpb25pbmcuYw0KPiA+IGluZGV4IDQ1MWMzYzVjYS4uYzBkMDM4
YWZhIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX3NyaW92X2F1dG9fcHJvdmlzaW9u
aW5nLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9zcmlvdl9hdXRvX3Byb3Zpc2lvbmluZy5j
DQo+ID4gQEAgLTEyLDYgKzEyLDcgQEANCj4gPiAgICNpbmNsdWRlICJ4ZS94ZV9zcmlvdl9kZWJ1
Z2ZzLmgiDQo+ID4gICAjaW5jbHVkZSAieGUveGVfc3Jpb3ZfcHJvdmlzaW9uaW5nLmgiDQo+ID4g
ICAjaW5jbHVkZSAieGUveGVfcXVlcnkuaCINCj4gPiArI2luY2x1ZGUgInhlL3hlX2V1ZGVidWcu
aCINCj4gPg0KPiA+ICAgLyoqDQo+ID4gICAgKiBURVNUOiB4ZV9zcmlvdl9hdXRvX3Byb3Zpc2lv
bmluZw0KPiA+IEBAIC0zMzMsNiArMzM0LDcgQEAgaWd0X21haW5fYXJncygiIiwgbG9uZ19vcHRz
LCBoZWxwX3N0ciwNCj4gb3B0c19oYW5kbGVyLCBOVUxMKQ0KPiA+ICAgCQlpbnQgcmV0Ow0KPiA+
DQo+ID4gICAJCXBmX2ZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gKwkJeGVf
ZXVkZWJ1Z19lbmFibGUocGZfZmQsIGZhbHNlKTsNCj4gPiAgIAkJaWd0X3JlcXVpcmUoaWd0X3Ny
aW92X2lzX3BmKHBmX2ZkKSk7DQo+ID4gICAJCWlndF9yZXF1aXJlKGlndF9zcmlvdl9nZXRfZW5h
YmxlZF92ZnMocGZfZmQpID09IDApOw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVs
L3hlX3NyaW92X2Zsci5jIGIvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfZmxyLmMNCj4gPiBpbmRleCAz
ZTU4MzU0ODcuLmQ3NGQyZTQ4NiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9zcmlv
dl9mbHIuYw0KPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX3NyaW92X2Zsci5jDQo+ID4gQEAgLTE3
LDYgKzE3LDcgQEANCj4gPiAgICNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiA+ICAgI2luY2x1
ZGUgInhlL3hlX3NyaW92X3Byb3Zpc2lvbmluZy5oIg0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3Ny
aW92X2RlYnVnZnMuaCINCj4gPiArI2luY2x1ZGUgInhlL3hlX2V1ZGVidWcuaCINCj4gPg0KPiA+
ICAgLyoqDQo+ID4gICAgKiBURVNUOiB4ZV9zcmlvdl9mbHINCj4gPiBAQCAtMTAzMCw2ICsxMDMx
LDcgQEAgaWd0X21haW4NCj4gPg0KPiA+ICAgCWlndF9maXh0dXJlIHsNCj4gPiAgIAkJcGZfZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPiArCQl4ZV9ldWRlYnVnX2VuYWJsZShw
Zl9mZCwgZmFsc2UpOw0KPiA+ICAgCQlpZ3RfcmVxdWlyZShpZ3Rfc3Jpb3ZfaXNfcGYocGZfZmQp
KTsNCj4gPiAgIAkJaWd0X3JlcXVpcmUoaWd0X3NyaW92X2dldF9lbmFibGVkX3ZmcyhwZl9mZCkg
PT0gMCk7DQo+ID4gICAJCWF1dG9wcm9iZSA9IGlndF9zcmlvdl9pc19kcml2ZXJfYXV0b3Byb2Jl
X2VuYWJsZWQocGZfZmQpOw0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9zcmlvdl9z
Y2hlZHVsaW5nLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9zcmlvdl9zY2hlZHVsaW5nLmMNCj4gPiBp
bmRleCA1ZThjODc3NTUuLmFiMjUzODNlMiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9pbnRlbC94
ZV9zcmlvdl9zY2hlZHVsaW5nLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9zcmlvdl9zY2hl
ZHVsaW5nLmMNCj4gPiBAQCAtMTAsNiArMTAsNyBAQA0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX2lv
Y3RsLmgiDQo+ID4gICAjaW5jbHVkZSAieGUveGVfc3Bpbi5oIg0KPiA+ICAgI2luY2x1ZGUgInhl
L3hlX3NyaW92X3Byb3Zpc2lvbmluZy5oIg0KPiA+ICsjaW5jbHVkZSAieGUveGVfZXVkZWJ1Zy5o
Ig0KPiA+DQo+ID4gICAvKioNCj4gPiAgICAqIFRFU1Q6IFRlc3RzIGZvciBTUi1JT1Ygc2NoZWR1
bGluZyBwYXJhbWV0ZXJzLg0KPiA+IEBAIC04OTEsNiArODkyLDcgQEAgaWd0X21haW5fYXJncygi
IiwgbG9uZ19vcHRzLCBoZWxwX3N0ciwNCj4gc3VibV9vcHRzX2hhbmRsZXIsIE5VTEwpDQo+ID4N
Cj4gPiAgIAlpZ3RfZml4dHVyZSB7DQo+ID4gICAJCXBmX2ZkID0gZHJtX29wZW5fZHJpdmVyKERS
SVZFUl9YRSk7DQo+ID4gKwkJeGVfZXVkZWJ1Z19lbmFibGUocGZfZmQsIGZhbHNlKTsNCj4gPiAg
IAkJaWd0X3JlcXVpcmUoaWd0X3NyaW92X2lzX3BmKHBmX2ZkKSk7DQo+ID4gICAJCWlndF9yZXF1
aXJlKGlndF9zcmlvdl9nZXRfZW5hYmxlZF92ZnMocGZfZmQpID09IDApOw0KPiA+ICAgCQlhdXRv
cHJvYmUgPSBpZ3Rfc3Jpb3ZfaXNfZHJpdmVyX2F1dG9wcm9iZV9lbmFibGVkKHBmX2ZkKTsNCj4g
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfdnJhbS5jIGIvdGVzdHMvaW50ZWwv
eGVfc3Jpb3ZfdnJhbS5jDQo+ID4gaW5kZXggNmMzYzhlMDMxLi44ZTFhYTJlMDQgMTAwNjQ0DQo+
ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfc3Jpb3ZfdnJhbS5jDQo+ID4gKysrIGIvdGVzdHMvaW50
ZWwveGVfc3Jpb3ZfdnJhbS5jDQo+ID4gQEAgLTksNiArOSw3IEBADQo+ID4gICAjaW5jbHVkZSAi
aW50ZWxfdnJhbS5oIg0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3NyaW92X3Byb3Zpc2lvbmluZy5o
Ig0KPiA+ICAgI2luY2x1ZGUgInhlL3hlX3F1ZXJ5LmgiDQo+ID4gKyNpbmNsdWRlICJ4ZS94ZV9l
dWRlYnVnLmgiDQo+ID4NCj4gPiAgIC8qKg0KPiA+ICAgICogVEVTVDogeGVfc3Jpb3ZfdnJhbQ0K
PiA+IEBAIC0zNDYsNiArMzQ3LDcgQEAgaWd0X21haW5fYXJncygiIiwgbG9uZ19vcHRzLCBoZWxw
X3N0ciwNCj4gb3B0c19oYW5kbGVyLCBOVUxMKQ0KPiA+DQo+ID4gICAJaWd0X2ZpeHR1cmUgew0K
PiA+ICAgCQlwZl9mZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfWEUpOw0KPiA+ICsJCXhlX2V1
ZGVidWdfZW5hYmxlKHBmX2ZkLCBmYWxzZSk7DQo+ID4gICAJCWlndF9yZXF1aXJlKHhlX2hhc192
cmFtKHBmX2ZkKSk7DQo+ID4gICAJCWlndF9yZXF1aXJlKGlndF9zcmlvdl9pc19wZihwZl9mZCkp
Ow0KPiA+ICAgCQlpZ3RfcmVxdWlyZShpZ3Rfc3Jpb3ZfZ2V0X2VuYWJsZWRfdmZzKHBmX2ZkKSA9
PSAwKTsNCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvc3Jpb3ZfYmFzaWMuYyBiL3Rlc3RzL3NyaW92
X2Jhc2ljLmMNCj4gPiBpbmRleCAzNmJjYTQxNDkuLjBhNDM4MTg5NiAxMDA2NDQNCj4gPiAtLS0g
YS90ZXN0cy9zcmlvdl9iYXNpYy5jDQo+ID4gKysrIGIvdGVzdHMvc3Jpb3ZfYmFzaWMuYw0KPiA+
IEBAIC02LDYgKzYsNyBAQA0KPiA+ICAgI2luY2x1ZGUgImRybXRlc3QuaCINCj4gPiAgICNpbmNs
dWRlICJpZ3RfY29yZS5oIg0KPiA+ICAgI2luY2x1ZGUgImlndF9zcmlvdl9kZXZpY2UuaCINCj4g
PiArI2luY2x1ZGUgInhlL3hlX2V1ZGVidWcuaCINCj4gPg0KPiA+ICAgSUdUX1RFU1RfREVTQ1JJ
UFRJT04oIkJhc2ljIHRlc3RzIGZvciBlbmFibGluZyBTUi1JT1YgVmlydHVhbA0KPiBGdW5jdGlv
bnMiKTsNCj4gPg0KPiA+IEBAIC0xMjUsNiArMTI2LDcgQEAgaWd0X21haW4NCj4gPg0KPiA+ICAg
CWlndF9maXh0dXJlIHsNCj4gPiAgIAkJcGZfZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0FO
WSk7DQo+ID4gKwkJeGVfZXVkZWJ1Z19lbmFibGUocGZfZmQsIGZhbHNlKTsNCj4gPiAgIAkJaWd0
X3JlcXVpcmUoaWd0X3NyaW92X2lzX3BmKHBmX2ZkKSk7DQo+ID4gICAJCWlndF9yZXF1aXJlKGln
dF9zcmlvdl92ZnNfc3VwcG9ydGVkKHBmX2ZkKSk7DQo+ID4gICAJCWlndF9yZXF1aXJlKGlndF9z
cmlvdl9nZXRfZW5hYmxlZF92ZnMocGZfZmQpID09IDApOw0K
