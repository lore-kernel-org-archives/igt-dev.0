Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607D9CD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 11:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF8310F058;
	Thu, 28 May 2026 11:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CszET43g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04C110F055
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 11:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779968164; x=1811504164;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+OuL+hlFbmM4X8WOt5pQVAq4wPfyGSuSbY7LYzP9CfU=;
 b=CszET43g/ehlb3MqBGaEyOCrAW9D40QkMcne0VkXR1XQFV9CCaMZsbi/
 0K08Z1DGKhKDhEcEb6eYDvqQRsJxqMFRBL9HWISA8yxfoxHlCSoQQPNZg
 ncMzeFBLA/euey3U3jaVznb1c9G8BSFts/QbvT4QiJ33ZUvr6pnxsy4eC
 frG/wT4b/iDCwgjI0xCTOOQvcQKeISktBy/RO+UVjNwpR9LHPQ7KEATWj
 imGbf8dsHfQrp7cAX+aaTgTUbi2rRQ1HHlZ8iNLogDh75wVHM447iKE9J
 EY/Q4Y673vyUikyXRgRFJ8clNJMv3qJipKpr7QYh1XVlcct6STX0V8DqM Q==;
X-CSE-ConnectionGUID: /W/mmSDQSHuqljOKOr/gvw==
X-CSE-MsgGUID: qU+fYDZySt+sAVn56na+EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80922070"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80922070"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 04:36:03 -0700
X-CSE-ConnectionGUID: ilGEt1D4SheYA5T2sv0uag==
X-CSE-MsgGUID: nlNZtEcYRlSc/Q4hUFo9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="238106919"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 04:36:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 04:36:03 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 04:36:03 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 04:36:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpG8tco6eWzZDB4IkaqYve9y/nBHRKkKPpcDsBE5k0xtYbaksQ4ZII1W+xERPZjupwJ5FvQBMyd5OPABOim2pshVYorHBET3QC5WabrwdXhdpph1dfMnXDXF4tlEnkNQpNB0TkUCjFjWBc0VbNzP07c6q7RlnGLA96JjtR64npd+3WBAXXB4+fsagG8SJhj501GPgtuis1xIwlZkJF65Fis0yq7VKkWH4f64CNDeV6/rJvpMK79UR9FBXMRQm1/IyvnpW4DXh590cZ+oWAxW4sMdUx1TebwXUjEszugigE/LnsLQe8M0hw7IbqMzHz3wS+Vmcc5FfNksp/AYzfyvHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OuL+hlFbmM4X8WOt5pQVAq4wPfyGSuSbY7LYzP9CfU=;
 b=dxSk/BjfirhSPw7pi02gZd3bQv3E/ZGBPUPwD9gkTT7pyOPE5CVI3s2AGO3JIH0wFaxQfRjCqmvrvibvo3kw0KHGFXWhr0tXhKZoyoYdtUJvAV7wMTXHOsWYnBC4iCl9a1lwHc1g+y4bfjhq52fh6Tb5aAywHNilEgaleHOILpokZZ3QJiKT5h0siEQBU5j4LC8piPnPug4WOlBPF9q1A0KZ02MpJ35b5QoHqpD99PJTPReVbKqSRUXkgv9/a0aVrlwZa6ivJ29F4YNCgSqw+Z8uCduyowzMd07Xco3ZFlldnHKr4sCufGHltcY1NApKrUS+fY1nI7bHdx4SKIEr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MN0PR11MB6206.namprd11.prod.outlook.com
 (2603:10b6:208:3c6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 11:36:00 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 11:36:00 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 8/9] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Thread-Topic: [PATCH i-g-t 8/9] lib/igt_fb: on Intel Xe force Vebox copy on
 yuv formats
Thread-Index: AQHc7R+koK3iP28cQUessShcnbk+i7YjUfgg
Date: Thu, 28 May 2026 11:36:00 +0000
Message-ID: <DS4PPF69154114FC42F5DFD506612EDC97AEF092@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
 <20260526144343.2531299-9-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260526144343.2531299-9-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MN0PR11MB6206:EE_
x-ms-office365-filtering-correlation-id: b2804648-dc2f-4616-5391-08debcad4b00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: vC5dbrNsR52sqNKz7CU7fi8FniU9Fsa0WHuT0g47Q60K8iLYkMS5vHCP5YtrURmzDR46elrWJYHqK45ylsooVpgb+fjPLgRqNEIkpiyXgW4q8YjB/i5amWc1mwazlR9+aQFt3eqERHem5GR7D4rr9obcW1fu3qnndzGh5HyIjQt8Zoo0becYEbfeAyMdc3Xb0OpKZGD3O79Yf9ei3a9RaRdv/gbvwrgnCJez3k9GkehgxWeeEOcks6GEBjN4cLKd2BElM1+4JeAk14FzGWZlDvSRGLD2t1fvHEbxYAou/9k5he/pf4O9EVcvrWdCGOJT7W6bvipBtuA3Uk3JBNanEeNEpXabH4RpDgnGK66sKuIAWVaaysSUgalGdPr3gd76ozlaCqOIJkOxR2DPomx3vcjmd3F6zoJMDV00QcFzvq0k7xD+pzGX4jjTFlV/iF4rswQYLLTTvJsgp1AooM0+SVj544HoOxfd7DqvHU/GjafMX2KhcU9UMKaaCFCVVlf/bQ5t09DiNygXPJep/e0uEamQ4WHH4f5JmU9B6ApQiX/9r+AlUOIQeRg36wzKd6GVS0wJrullKSno6cs6RLiitTrqn/AdL4tzZRpWDkoTvEtsgvHbeOpHjfEkL8NQrYGxk1XMj1ydSt06UL1kDattRzmn1q7lPrtk93PVEIQHYi8tyEWGaTBvvISKObUpGNcQHjmPJ6RKpnvO0XjkbZdleJhb3WIoav34B82ShwmDGMhy2J7aRYpSlk7LSsDLn8GI
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEdOd2xHQks4NzMyQllzSWIwT3dWMXlJNnJYcWtpVm5aT3lEN1QwdXlPZW9L?=
 =?utf-8?B?UXpqQkh0dmFYNkp2ekUwcVNUcHorRUhWNk96NnlKelEzc1h3cjJHL2Z1d0hE?=
 =?utf-8?B?dVJQeUJJQ0F4aWFnS2hHcXlCN0lJZ3RLVFFxdXUwcmVPSUtPVG5IWTZHZFVq?=
 =?utf-8?B?RU5yVGFuODJhZGpyeWxESFIvTExlbHJVUkhyTDlaWEplMzMrcHQ3NktnaUxl?=
 =?utf-8?B?S3pQUDFSRzJvQ1d0T1Q4aTRpSHdhUU9pMWFZNERQeXJMeVoxODYxU2QrZUc3?=
 =?utf-8?B?RnpyQTRkSFVJNElhc1NxOGU4SXhNNndIWElsTTJ6WGxZWmRuUTAyUE5PSzdZ?=
 =?utf-8?B?RDMzK1lsZHlWNEhmZzVYc29tTVlnWmlTaDM3N2paLzVlYmRHbW1kOG00U1lZ?=
 =?utf-8?B?YndTUW5UQTZnbFBwajJKL2xwajkwMkxNbkthL1h2TDJrbFRhQzQ0bUM2Vis4?=
 =?utf-8?B?bGRTNmk1dWNaV3E4U3dITWV4ZkZiY2w4NTR1ZWZiQlVIUkNqVmNYZm5UR3VS?=
 =?utf-8?B?Q0dpaDRyM1RybmtpZDlLdFZsWkZkT2w3V1JVUUFmWTdlTXRRLzU0eXpYNEow?=
 =?utf-8?B?MEdqSlJXM1BGREV5akpwSm1xUXVXemwrSzc1ZkdJRm5qa1JudDRkTWxXL1ZR?=
 =?utf-8?B?bXRPRURSMHUvZ1kzM3MwVHJzNjRxS1pvelFlbUt4dzFpU1dYMithUThMcmZN?=
 =?utf-8?B?NzN0UjlXUWdrNUxjdkJvYjhnU2krVGJUT24zbTBGNDViY1pMNlg4aWFSY0gy?=
 =?utf-8?B?NnJGMFZ4V3ErUVNvb01BMUJlQVFDQXBFbVV6c01uMDYvUC9JTjRiU0xhSnRP?=
 =?utf-8?B?VlhLdzJQUms4UFVuR0xDb1pDZXN5R2ViWFFGaUMyYk4rVmdWV25DanBSNHFu?=
 =?utf-8?B?OWdWNktnUmREL0FtTzlNZEpjV1VNeFBXWlZoaENlOUluMUI4ZTZkRGdVNDRy?=
 =?utf-8?B?cWZNRnpwalZSLzZTeWxFNUxHZnB1cTZhVkpQUzVDOEMvTXhyZTY1LzFkd1p1?=
 =?utf-8?B?QmNVeFIvVm1kRDFPTjJwcWxndVUra0lEZkxhTkZuTFJqWEQyUENPR3NYNkFO?=
 =?utf-8?B?NlBTYkVXTTFhNlgyMHF0eERGWXNWb3lMYVNqK1BmU2wvb3lyb2pQWTU5M2ti?=
 =?utf-8?B?cDlYeFpmS1plQjNtdEhVTitiYlRkZGhJV2hYT0l1cDhxRnUxSWNpdWlmRzRR?=
 =?utf-8?B?Vm5HelFFZEVXMVozU0xOWlo0MFpOZlQ2TVJrbW1DVGYwdGxuTHVtbGZsQS9r?=
 =?utf-8?B?bFlkZi9lckQ3ZC80SjF3ZC9pdXViaHhqU1ArcWNrbVM3T0J4TWc2YUdQdm1E?=
 =?utf-8?B?Q3BZL1ZyK0paQTliV2dXd1AyZFJtMVk1MVhxTWxMR0lYRnlwSjFYOURNNnRY?=
 =?utf-8?B?WEtTaGlJS1FrS1Zaa09EbXJ3MkhmVXNoejMzaW1lczhzMzd5Z0lvK1ZJNmxx?=
 =?utf-8?B?OGxFY1haR1I3VlUwaXdqMTA3STRFWkZtMGRMdHdudENYT1o0SFp1R2cvV25h?=
 =?utf-8?B?V2luYVYyMjJsVHdCMDRrTUVOK3ZITzB2cjBFbnBkenRXS1NQZFczbEE3RUEw?=
 =?utf-8?B?NnBINzJ0YndwQWdjZHdabi96Y2EzTGtUNzJUQThMcUZMc1NXQzM5ME81OHlB?=
 =?utf-8?B?eEtvMTM4UTgvTDVIckVNUEVZVkF4bWo3UStQZitTZzJKWDBlSi9RcDAwZW1C?=
 =?utf-8?B?VjE3dEdXL0IxWWJUUGtBL0JQa1gvcmx2RmpOQWhVbWRpS2FUUmlsdVZENk9G?=
 =?utf-8?B?R2EvZGxYNVhBOWhEYWxkRlZvNGtMK0xKVHgzWkdTYlFENWtQZ2YxbEQwaStD?=
 =?utf-8?B?K3haL2l4bHF4ZlMyRExIczNjMExidWFJdEgvMFFLalMrOXdSZDI2L2hodVJB?=
 =?utf-8?B?dURsYnZnNXpMQi9JWWphMFZhb3hoTGRXcmpyeXEvTWgwL3dsKzR2UVlRak0w?=
 =?utf-8?B?bjlza1NVZFBJYUJ3THVwM0xLVVQ5WUJvSGUzUTBUUWVOeHNYOW5Sekw3SCtw?=
 =?utf-8?B?YjI4UHdXY0s2T2RCZ2pPT0s2MUdCNGswblFEaE5ocEtSMEdhUGprbTAwRDR1?=
 =?utf-8?B?dHJGUHFzMGxxM1EzNW0vM1pvYXVocGp3S3A1V1liQ2QyNFkwdkRNekh1SFYy?=
 =?utf-8?B?SVJqL1NxdjZ2ZDdLZkpzb1ZENnQrM0xhNzNlUmdIbE01ZjkvQU0vTVp3QTN1?=
 =?utf-8?B?T0ZydGdjNXpCYzV1Si9wYXVISWF2Z1EvbEpBYjlwdXUwamc4WURFSEovczZY?=
 =?utf-8?B?L3RVVFZMZTB6UDV0NHFtZGp0eE1oTS93alFzY1NScnc5UkdXbFZqK2E4T1Nt?=
 =?utf-8?B?V3V6VGtjRVpQU0Q0VUFTcUNpZFdEdkZlZ3JUZlBCLzU1d2J2VHcvdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: LN8tVR8F+ty6WMVT4xQKbbJqP04AkEYeYJ5rd9jlH2fOyW+CCxxD0J52WQV09SBYoqBuPhwDt4ADKu4IrNZfiBTZYTgu6OJjJ8KPy97C57vJnLgqSayHkpEM6C15t7F3jWAuF/aA0QUQGHWvX3+wRcfPO9/Hpf5phlnKZjTNEiyEeGL5NKCH56CQH/sJbVddlAGSpkt8Jk5V2V8Ri9nX0UYXKOBTRUj7JUsqKf2yVk0VyF2HuzqfDklalfVEAWQUdqcBG4tfzYjdLPyKIPLSJ65/PcR598sKVJ2lxoOK9TtaLSNqAMQVtllibIQ3xHh/e3cgcgHdXGGte/wjT5TYqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2804648-dc2f-4616-5391-08debcad4b00
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 11:36:00.6816 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q81hSXEFlNe3VvjNW5I6vifM5aJUjkK4hACXoT0KF1DtADyjFQq6sxPeHLyvqIHETFgcvqATb5vNjNpF0pfnmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6206
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYSBIZWlr
a2lsYQ0KPiBTZW50OiBUdWVzZGF5LCAyNiBNYXkgMjAyNiAxNy40NA0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtr
YS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCA4LzldIGxpYi9p
Z3RfZmI6IG9uIEludGVsIFhlIGZvcmNlIFZlYm94IGNvcHkgb24geXV2IGZvcm1hdHMNCj4gDQo+
IFRoaXMgaXMgdG8gdGVzdCBWZWJveCBlbmdpbmUgYWxvbmcgd2l0aCBvdGhlciBlbmdpbmVzLiBW
ZWJveCBpcyBmb3JjZWQgdG8gYmUgdXNlZCB3aGVuIHVzZSB0aWxlNCBuZWVkaW5nIHRpbGUgY29u
dmVydCBhbmQgcGl4ZWwNCj4gZm9ybWF0IGlzIHl1di4NCj4gDQoNClJldmlld2VkLWJ5OiBNaWth
IEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEp1aGEt
UGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IC0tLQ0KPiAg
bGliL2lndF9mYi5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbGliL2lndF9mYi5jIGIvbGliL2lndF9mYi5jIGluZGV4IDQ0ZDJmZjg5
ZS4uZTYyM2IyZjY0IDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X2ZiLmMNCj4gKysrIGIvbGliL2ln
dF9mYi5jDQo+IEBAIC0yNjMyLDYgKzI2MzIsMjQgQEAgc3RhdGljIGJvb2wgYmxvY2tfY29weV9v
ayhjb25zdCBzdHJ1Y3QgaWd0X2ZiICpmYikNCj4gIAkJCQkJICAgICAgIGZiX3RpbGVfdG9fYmx0
X3RpbGUoZmItPm1vZGlmaWVyKSk7DQo+ICB9DQo+IA0KPiArc3RhdGljIGJvb2wgdXNlX3ZlYm94
X2NvcHkoY29uc3Qgc3RydWN0IGlndF9mYiAqc3JjX2ZiLA0KPiArCQkJICAgY29uc3Qgc3RydWN0
IGlndF9mYiAqZHN0X2ZiKQ0KPiArew0KPiArCS8qIFRPRE86DQo+ICsJICogWC1UaWxlIHdpbGwg
bmVlZCB0byBiZSBmaXhlZCBmb3IgVmVib3ggZW5naW5lIG9uDQo+ICsJICogWGUyKyBkZXZpY2Vz
DQo+ICsJICovDQo+ICsJYm9vbCB2ZWJveF9maXggPSAoaXNfeGVfZGV2aWNlKHNyY19mYi0+ZmQp
ICYmDQo+ICsJCUhBU180VElMRShpbnRlbF9nZXRfZHJtX2RldmlkKHNyY19mYi0+ZmQpKSkgPw0K
PiArCQkoc3JjX2ZiLT5tb2RpZmllciA9PSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRCB8fA0KPiAr
CQkgZHN0X2ZiLT5tb2RpZmllciA9PSBJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRCkgOiB0cnVlOw0K
PiArDQo+ICsJcmV0dXJuIChpZ3RfZmJfaXNfZ2VuMTJfbWNfY2NzX21vZGlmaWVyKGRzdF9mYi0+
bW9kaWZpZXIpIHx8DQo+ICsJCWlndF9mb3JtYXRfaXNfeXV2KHNyY19mYi0+ZHJtX2Zvcm1hdCkg
fHwNCj4gKwkJaWd0X2Zvcm1hdF9pc195dXYoZHN0X2ZiLT5kcm1fZm9ybWF0KSkgJiYNCj4gKwkJ
dmVib3hfZml4Ow0KPiArfQ0KPiArDQo+ICBzdGF0aWMgYm9vbCBjY3NfbmVlZHNfZW5naW5lY29w
eShjb25zdCBzdHJ1Y3QgaWd0X2ZiICpmYikgIHsNCj4gIAlpZiAoaWd0X2ZiX2lzX2dlbjEyX3Jj
X2Njc19jY19tb2RpZmllcihmYi0+bW9kaWZpZXIpKQ0KPiBAQCAtMjY2MCw4ICsyNjc4LDkgQEAg
c3RhdGljIGJvb2wgYmxpdHRlcl9vayhjb25zdCBzdHJ1Y3QgaWd0X2ZiICpmYikNCj4gIAkgICAg
aXNfeGVfZGV2aWNlKGZiLT5mZCkpDQo+ICAJCXJldHVybiBmYWxzZTsNCj4gDQo+ICsJLyogdXNl
IGJsaXR0ZXIgb24geGUgZGV2aWNlIGV4Y2VwdCA0dGlsZSB5dXYgd2hlcmUgdXRpbGl6ZSB2ZWJv
eCAqLw0KPiAgCWlmIChpc194ZV9kZXZpY2UoZmItPmZkKSkNCj4gLQkJcmV0dXJuIHRydWU7DQo+
ICsJCXJldHVybiAhdXNlX3ZlYm94X2NvcHkoZmIsIGZiKTsNCj4gDQo+ICAJZm9yIChpbnQgaSA9
IDA7IGkgPCBmYi0+bnVtX3BsYW5lczsgaSsrKSB7DQo+ICAJCWludCB3aWR0aCA9IGZiLT5wbGFu
ZV93aWR0aFtpXTsNCj4gQEAgLTI3MDAsNiArMjcxOSwxMiBAQCBzdGF0aWMgYm9vbCB1c2VfZW5n
aW5lY29weShjb25zdCBzdHJ1Y3QgaWd0X2ZiICpmYikNCj4gIAlpZiAoY2NzX25lZWRzX2VuZ2lu
ZWNvcHkoZmIpKQ0KPiAgCQlyZXR1cm4gdHJ1ZTsNCj4gDQo+ICsJLyoNCj4gKwkgKiBUaGlzIGlz
IHRvIHV0aWxpemUgVmVib3ggZm9yIHRlc3RpbmcNCj4gKwkgKi8NCj4gKwlpZiAodXNlX3ZlYm94
X2NvcHkoZmIsIGZiKSkNCj4gKwkJcmV0dXJuIHRydWU7DQo+ICsNCj4gIAlyZXR1cm4gZmItPm1v
ZGlmaWVyID09IEk5MTVfRk9STUFUX01PRF9ZZl9USUxFRCB8fA0KPiAgCQlmYi0+bW9kaWZpZXIg
PT0gSTkxNV9GT1JNQVRfTU9EX1hfVElMRUQ7ICB9IEBAIC0yOTEwLDE1ICsyOTM1LDYgQEAgc3Rh
dGljIHZvaWQgZmluaV9idWYoc3RydWN0IGludGVsX2J1Zg0KPiAqYnVmKQ0KPiAgCWludGVsX2J1
Zl9kZXN0cm95KGJ1Zik7DQo+ICB9DQo+IA0KPiAtc3RhdGljIGJvb2wgdXNlX3ZlYm94X2NvcHko
Y29uc3Qgc3RydWN0IGlndF9mYiAqc3JjX2ZiLA0KPiAtCQkJICAgY29uc3Qgc3RydWN0IGlndF9m
YiAqZHN0X2ZiKQ0KPiAtew0KPiAtDQo+IC0JcmV0dXJuIGlndF9mYl9pc19nZW4xMl9tY19jY3Nf
bW9kaWZpZXIoZHN0X2ZiLT5tb2RpZmllcikgfHwNCj4gLQkgICAgICAgaWd0X2Zvcm1hdF9pc195
dXYoc3JjX2ZiLT5kcm1fZm9ybWF0KSB8fA0KPiAtCSAgICAgICBpZ3RfZm9ybWF0X2lzX3l1dihk
c3RfZmItPmRybV9mb3JtYXQpOw0KPiAtfQ0KPiAtDQo+ICAvKioNCj4gICAqIGNvcHlfd2l0aF9l
bmdpbmU6DQo+ICAgKiBAYmxpdDogY29udGV4dCBmb3IgdGhlIGNvcHkgb3BlcmF0aW9uDQo+IC0t
DQo+IDIuNDMuMA0KDQo=
