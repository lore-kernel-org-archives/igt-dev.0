Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C56D2E9ED
	for <igt-dev@archiver.kernel.org>; Mon, 11 Nov 2024 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C56810E1F0;
	Mon, 11 Nov 2024 13:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPNMRwgD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE1510E19E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Nov 2024 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731331852; x=1762867852;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=czLrmYyvtHK+E51Jn4Lu+x8RYpcw8tnVAR4X3eXTsxI=;
 b=UPNMRwgD1P7R2iS7f1Uy0JV3BzYHRty0xGUl9x0WxYOTgSW5dco+bzzZ
 u45cOXGu1IoaLfwNkS+dXVmoJhXYJpW/BvxkIvwwBrwWqtAh6N6pTq2pM
 Y32AUrhCEkI9dfsAiJH8Y02xNtC8A0ToEqVNOxPem80I88vFUnXRMQ/ye
 5GwSkypWFyBb3jGeBID2aqc+DUAYQIIp4Z28OL9rmJKZ+QzQVJKHora+N
 3ny6oWavLZs2mDHUlkE+eLV5wjrRx5yZeAEZwEv833pSn4XifxWU819cm
 BSXsnbWa2rvhYhdtWHTyeyYxorAJgPN1TkMAJ71jApVdTMeJ/3TOJzTtz Q==;
X-CSE-ConnectionGUID: FoW6nBoPSoiYqN10DpWuGQ==
X-CSE-MsgGUID: RkeX7OQhRcOdCZ+mkKG6DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="41764793"
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="41764793"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 05:30:51 -0800
X-CSE-ConnectionGUID: mV4BqbwzSxGpVXq7ShUIfQ==
X-CSE-MsgGUID: LBWuEsQYSIGToQuk7Dw6mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,145,1728975600"; d="scan'208";a="86662575"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Nov 2024 05:30:51 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 11 Nov 2024 05:30:51 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 11 Nov 2024 05:30:51 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 11 Nov 2024 05:30:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fkVyXLlU25eMJIHGg7MbibNQnW8zVTFhyMB8a46dbIikpxrA3nFSG1L7E+ZCPl0kgFRn8SoQa4LNmSTTiKnF0aDZnM01Sd2yKshcuT+NpYQlr+zyiYzlR6OximQsKYWaIHPcZxeq4GLrTXWp82yE8IF0o12JHb+HftRM6STMRGGudHkR4zCEA+FwO40VLcSPXehkZAQfRYM3Bc7PsTEQZzhB2ijDp+heJwLg28tjmzCPU88dNwQpCFEDmJiNnfk3gQWQ6lj1Bm3N69aiSK7/bUDv+eF8UkWWvERnYlkycB/xqUsy7exddiWghaWakYUASfA+NGBRI4+rj+8siqahOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czLrmYyvtHK+E51Jn4Lu+x8RYpcw8tnVAR4X3eXTsxI=;
 b=MBwd7p9C7Qnxti7NqGEQGrjO07WG5YgEX0DtnRVbS8qqfMjPKrKOPB7wEELUQV2k0cyJl+p/EAVJfcFtq9h8pex1dmkp78Yb3DYli3ANfjHZrFLKjg3OAz3vzUzgVpHQrbe0MpgJyziD+DchPcYtiyX5W7PSsi2M8WUIKyhcDmFGo09YYpQxUNu3rswM4ey0Ook+g5BL6ILe5e+EFdTBYarIhEnQGSzy6E51eYzlDHCvDgeInl5o8CVwZahY+jdUmvxzfW/oV1qOcZt3w34K1r0GutmHpsdhPQQVKXCbFDCO1mLj3rt34F5VJsJu2CcTNLP8sWi0dQU2aECKHpPwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.28; Mon, 11 Nov 2024 13:30:48 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 13:30:47 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3] tests/intel/kms_ccs: add suspend tests
Thread-Topic: [PATCH i-g-t v3] tests/intel/kms_ccs: add suspend tests
Thread-Index: AQHbL3lfwWB0BFZQM0uYy6mDmh0p2bKyHFww
Date: Mon, 11 Nov 2024 13:30:47 +0000
Message-ID: <MW4PR11MB7054799C4F2F95F22BE9422DEF582@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20241105115708.682335-1-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|DM3PR11MB8669:EE_
x-ms-office365-filtering-correlation-id: 9aaa6a72-b710-4429-c063-08dd02550d85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eEJFNStCNk9DQnlXRWdyQzJiU3hrTVZQZ3ZNeGpIc2xubU84bnpUV1p5RjZH?=
 =?utf-8?B?ODhnenRKaFN3VE5OM2NSWjk4NmNrdXF6MWRldCtvUnJ1di81QW9nU2o2cG1S?=
 =?utf-8?B?WnRxalVwKzZmZGRvWWlvNlpCZFlzamFFYXRKeEIxb2FaN0RadDdHUTN6MW10?=
 =?utf-8?B?bHF1aUlWNzdzaktNOHkvUW9tYjF0TnUwNGV6S1RmT25xYm44Y0JJVGN3eXF6?=
 =?utf-8?B?dDZtblF2ZVNLM0N1VlA0TmJ4Q1IycnMwbXBiQTBYTElYaW03OGRqS1ZTZzZT?=
 =?utf-8?B?MVNqbVp0MjRKZ2MzUENON1RnTXgxYTI3MlhMWC95SjVJL00wZ0FnTitlZXZ1?=
 =?utf-8?B?TDhibFpDQ1BoNWFJbDloMjBXU25LS0E1NEhHeit4SFdxZjhoaU8rYkxpWmdy?=
 =?utf-8?B?akZMS3BSYkN6MC9rRGtJVEJJcXdqbkhkeHpxVmpMdHY4U3JVdURrV2d3QTF3?=
 =?utf-8?B?SXFUVzBIbjdFblhwZ1JTQlg5d0NFNGlGdmpXdkRJaWV3VGxQNDhuR1dQQUpr?=
 =?utf-8?B?Sm9TWmlndjZCVWdYZTVYYTNtRWU2ZkxFakdTSHFFZ1JKbFRQUllaMXJGWE1G?=
 =?utf-8?B?NnRRRTBxRkFxMnRjT1Rac1pxZ0F0SGxiRnBDT0FCYWRUd1ZYanNCNktrb000?=
 =?utf-8?B?Uy9NNmRzdUl1RVlHUlp4RnN5R3RMVWNkOU1FemIvZTNUbXdlN2wxSFpDWnp0?=
 =?utf-8?B?TEpRa1FHWjYrNmxHVTZIOVI1eGhic1ZGNDlVNlNFcHdxbVd1VUZBVWF0N1ly?=
 =?utf-8?B?L3NXNFFSTVJKVlFjTlFXVHZzNks1WUdjd0hBaWZ2bnZwUVIvOXJQbmFpVmxi?=
 =?utf-8?B?YXlxK3pTU1hVNTVOQ1ZtL1FLdFJ1TUpWdVdDTEZ3R0dCZkxDR3EwMEZJTGIx?=
 =?utf-8?B?SUwwb0lRV3ZoT3gxMjREU1hLN2ZkZFEzR0NmcjU5Q0FOdE5Cd29LZ0VHVHVu?=
 =?utf-8?B?dERBVlZsR0U1enVRS3NINkJiNHBmN2t4UkdXTnpoVHdzUUoxNlFKaUJRNXlh?=
 =?utf-8?B?MmVsbUZBYUxBUGpBNUxxMkVCQk1WUjZzQlBiUGNCVXhta1VPZzZZNzVEQndQ?=
 =?utf-8?B?VlpHRHFhVG4vODRNN3VWQ0NqSTByZFc0czk3UU5iREtnK25IMXUxSXRXelFE?=
 =?utf-8?B?S0E2YjQvVWVpQ2NkamY1dHFTZVJJSjBhcUI3YS9pVm9ERXhRUCsyMWVSTi9y?=
 =?utf-8?B?R0x1cVFEaUp5VmVCQjV3Qnl3eHZmQ01oRWpLdUkxRDQ0RlVtcEdmRWtYcUdm?=
 =?utf-8?B?OVJhRFhyaE1GSDhncVBKU0pHbFd5ZW1XVXBUREdsV3A2YVhaNU83U29BZU1L?=
 =?utf-8?B?aVlOSXIvamVucGFFOTZ0Q25JRVlUVHRwRmxRT3N3YTlWTFlkbXVueUZ1ODJ1?=
 =?utf-8?B?WU1lZzgrRTdaWTdOVFg1ZnlieCtsbHN3QXk0ZXNxellIZlRNMUx6b3JOUWh3?=
 =?utf-8?B?bStzMjlyRkptalRjU2tSZGFVejBOME1aSE9zRzc0R2RUWkVHS2FnY2FGYVVC?=
 =?utf-8?B?K1hmU1lKQVJCSHBGUU1weE5tU01ZSkRSM3dxbHI5TDFQcHlJOFZpSjkwYUQr?=
 =?utf-8?B?alFIZHFYa3JaT3lrajVldWxpc3JqU0k4Mk5WOVlTQlpVL0w5aUJjOHIvOFdv?=
 =?utf-8?B?RWVGN01qY3YzaHVnK3Rwd2ZvUENxc2hiYWFGY1NDb0Z4c1B2bDlLcFBIOWxU?=
 =?utf-8?B?bVpxS1dtaUZmM21oTSthNjBobW4wOXZCbWlWQXlQbWEwTzNPOElLdDVKRG5B?=
 =?utf-8?B?a1Y0cmlCQ0FvSlRyaVNtZU5NZ2N6TURwTDFpMFZwY29UOUJncVlXTlo2WnB6?=
 =?utf-8?Q?K222wnls+8nixRWtLpXxdi9DWixv5KbxM7d+8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm1sY2xneS9HNXNTRVY1S0hhREhQM2htOWIvYTQ2a2t1Z29XQ3BTeklJSGVs?=
 =?utf-8?B?L05iWjE2eVRhMUY0SkRPN29KUWc1UVJpa2x3RUhJdEJjR0FWdVhyK2ZwS2tK?=
 =?utf-8?B?c2JIZk14TlJLeFZvM285dVFVYUF6VXRqazlTZjhnU1huVC9kVVN4ZmF6N2xC?=
 =?utf-8?B?SER6b0lPMy9qMEtlY0ptcFlLYW5SRXFiL0ZETENvQkhYNFFuSE5pSmx0eitH?=
 =?utf-8?B?WVRvRStZd3p1OXkxMEhGTkhYK1l4dnVDK2lwVWU3MzJYQ21kdGRUS1l5b2JI?=
 =?utf-8?B?VTQ2Q3JnUEg0bklYWGNFcitqSzJTVWJZbkxuV29WSm90ZENDdlZWeGVjZEpv?=
 =?utf-8?B?WklaUGtuS1hvMTczbklMc2M3N2wwcXlkWXlVSzhvdWUwUkNXU3FaUk9rUFcr?=
 =?utf-8?B?LzEvWW1Udkp0bmRlSnNMTjNtWUFLZXBMY0s5dDhxWVB1YmhXRTlGU0N4K2t0?=
 =?utf-8?B?NURJMVBYQzVxQUJBOEtNR3RZR0graEJqcUl6bTZpTUlIaXlFTDVYSnNvRjZJ?=
 =?utf-8?B?YkdEaGF1VTlqL21uOFk1MU95ZFMvajByQUFVK1RQYjljUWlaWEdFZkVQbDFx?=
 =?utf-8?B?bGlmR2xWN2hwTkM4dnlPVzBFUmJQME8wTTVZeDNMUHlLMmJRQXpMczVxNHh3?=
 =?utf-8?B?ZVJENkl5Q3k3NTNyVFo5UGV6bHpGUnpkeWhQVE5wZVhwR200OCtTdVNnR2po?=
 =?utf-8?B?SXRpTHVRUWpGa1N2ZnFxWmxMdDdiaWQ3OGU1MVRoWmsweHk4TmZmYml5VW00?=
 =?utf-8?B?eWxuK3BkdU9ybys0TmpFMVQvY1YyTDN3S3VWbC9CUktXOFI5QW1FOFVJOXdx?=
 =?utf-8?B?Z2pUVDhvL1VHZ1FYaE0yNWtzM2xQU2JBVm01TzNZQjRrVnF1Zmw3d1A3YTJ3?=
 =?utf-8?B?YlVzOFhXTDI4SXMxbU1rbVUydFpZdVVCSkFHVGIwUzRBcnY0eldpMUdWNmVj?=
 =?utf-8?B?Rm1FQjBJcUI0cGRGbjh3cytvSjdwUEhUOUo1Y0hWd3B0dWJ2NmdWTlA2dXZW?=
 =?utf-8?B?YS9tM095Ujc1M1AyaG5obEhPczR3dDd1dnhqajNpTy9adDhwNnJ6Z1VUSFZa?=
 =?utf-8?B?Y0JtbW1haXJmK2hDMWN3YUcwSDE2WDlRZytKM00xQzBTdHZCRFVJbHZlRGgw?=
 =?utf-8?B?NlE0L2s4MGNQbXJRdTJvQTliQXA4L0w4ZCtjRDVaUWl3Sm5UVGdXQ0N4T2ZL?=
 =?utf-8?B?ZDhnVHd1UmNPZ2ZvazhDRTNrT3JFMzdhMkxsOVJmUWhoS1QySGdCbEI5WDJ4?=
 =?utf-8?B?VEwvUlJjNnBvVmVjRnB4MktqdlcvbE1aODVoOVlwbmNHS09Ibll5dlFpbnBo?=
 =?utf-8?B?aXhPQ0lGdW5Wc2pzRmQ2c05nRy9lRUxqMkdpemQrMng3bUQ5Q29TZGxia3ZB?=
 =?utf-8?B?N2VrQXRVTDE5Z04zUHp0NWpJWGFmKzVLbWMyNThqTmQ1MklhaHAzelltcEtr?=
 =?utf-8?B?aDFFQmhaY1dwRW0yNG9BbnhUS2I0MnRLZnpNSDZTd0tUOWtYVEhiNCtkd05k?=
 =?utf-8?B?S3VCMUY2RHIveGtsWVB6cW85c3k4anN4SnpXSmhBK3JNTGREUTV1SUt3M09B?=
 =?utf-8?B?NmcxUkllZG5sK0lnUGdCdkFoNVBPZXEyUUEyanRCQVkwWm5jdS9QSzZBejcy?=
 =?utf-8?B?bjV0aDBrVlZ0Yi9TTjU2azI5MWxNeVFNV1paWTh5LzJsb3ZrQnpYY3FRUlpC?=
 =?utf-8?B?TzdQYWxhVmN3d3pzTFhTRGYxRmtSSmlCbTFId0s4MkMrSEdoM05mVHNOQStL?=
 =?utf-8?B?aTkyODR4UkNlZ3RBajBWMlFpbENqOEJVN0NxWnlockZKZXd1cFNRbGpReFpj?=
 =?utf-8?B?SDZoSHRZK2JmZkVOSWhOTERPRjU4elYyWUZmOE05TXFtOVpRa25ObzY4VXZC?=
 =?utf-8?B?VnFRemdIYzhlVVE1cy9ZUnQ5N2ZtNDJTZFFvbGYrZ0RVVWU5ek93Qy9iKzBW?=
 =?utf-8?B?STFpbkk2YnE1SHVmM3FCY0xQQ2dBVC9OZFo1MGtPNDZtekhmVDdOMkhCd1h3?=
 =?utf-8?B?R2VDaDFHWk41bUhtUStReU81amtSTWZXeHJOdEVpdW1ZVzlSa3Z2RXEzSVl2?=
 =?utf-8?B?RmxwcGxMb0NWOGVlMjZlZUZiSVYrZTFQUTc1UHJ5RHBkN0VIelVMMjdzWGpI?=
 =?utf-8?Q?2QGkY6z9B2TJpUs5iUpeFkzB8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9aaa6a72-b710-4429-c063-08dd02550d85
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2024 13:30:47.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VYFK55DYo+oyxRsWwoqssBQn52VvQZzN/TCgJhTrf+THGwN3jptr6BEUkYioTL2KXvIOR2tGMF6gXQDZeEPCpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
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
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSnVoYS1QZWtrYQ0KPiBI
ZWlra2lsYQ0KPiBTZW50OiBUdWVzZGF5LCA1IE5vdmVtYmVyIDIwMjQgMTMuNTcNCj4gVG86IGln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxq
dWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjNd
IHRlc3RzL2ludGVsL2ttc19jY3M6IGFkZCBzdXNwZW5kIHRlc3RzDQo+IA0KPiBBZGQgY3JjIHRl
c3RpbmcgZm9yIHN1c3BlbmQvcmVzdW1lIHdoaWxlIGNvbXByZXNzZWQgZnJhbWVidWZmZXIgaXMg
b24gc2NyZWVuLg0KPiBUZXN0IHVzZSBvbmx5IFhSMjQgYW5kIFAwMTYgZm9ybWF0cyBmb3IgdGVz
dGluZy4gQWZ0ZXIgcmVzdW1lIGlzIGNoZWNrZWQNCj4gZnJhbWVidWZmZXIgZGlkIHN0YXkgY29t
cHJlc3NlZCB3aXRoIGV4Y2VwdGlvbiBvbiBibWcuDQo+IA0KDQpMb29rcyBvayB0byBtZS4NCg0K
UmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCj4gU2ln
bmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8anVoYXBla2thLmhlaWtraWxhQGdtYWls
LmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNfY2NzLmMgfCA0MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQwIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9r
bXNfY2NzLmMgYi90ZXN0cy9pbnRlbC9rbXNfY2NzLmMgaW5kZXgNCj4gYTVkM2ZmNWU2Li4zZTlh
NTc4NjMgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19jY3MuYw0KPiArKysgYi90ZXN0
cy9pbnRlbC9rbXNfY2NzLmMNCj4gQEAgLTk2LDYgKzk2LDcgQEANCj4gICAqIGFyZ1sxXToNCj4g
ICAqDQo+ICAgKiBAY3JjLXByaW1hcnktYmFzaWM6ICAgICAgICAgICBQcmltYXJ5IHBsYW5lIENS
QyBjb21wYXRpYmlsaXR5DQo+ICsgKiBAY3JjLXByaW1hcnktc3VzcGVuZDogICAgICAgICBQcmlt
YXJ5IHBsYW5lIENSQyBhZnRlciBzdXNwZW5kDQo+ICAgKiBAY3JjLXNwcml0ZS1wbGFuZXMtYmFz
aWM6ICAgICBTcHJpdGUgcGxhbmUgQ1JDIGNvbXBhdGFiaWxpdHkNCj4gICAqIEByYW5kb20tY2Nz
LWRhdGE6ICAgICAgICAgICAgIFJhbmRvbSBDQ1MgZGF0YQ0KPiAgICoNCj4gQEAgLTE1OSw2ICsx
NjAsNyBAQCBlbnVtIHRlc3RfZmxhZ3Mgew0KPiAgCVRFU1RfQkFEX0FVWF9TVFJJREUJCT0gMSA8
PCA3LA0KPiAgCVRFU1RfUkFORE9NCQkJPSAxIDw8IDgsDQo+ICAJVEVTVF9BTExfUExBTkVTCQkJ
PSAxIDw8IDksDQo+ICsJVEVTVF9TVVNQRU5ECQkJPSAxIDw8IDEwLA0KPiAgfTsNCj4gDQo+ICAj
ZGVmaW5lIFRFU1RfQkFEX0NDU19QTEFORQkoVEVTVF9OT19BVVhfQlVGRkVSIHwNCj4gVEVTVF9C
QURfQ0NTX0hBTkRMRSB8IFwNCj4gQEAgLTI1Miw2ICsyNTQsMTIgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCB7DQo+ICAJe1RFU1RfQkFEX0NDU19IQU5ETEUsICJjY3Mtb24tYW5vdGhlci1ibyIsICJU
ZXN0IENDUyB3aXRoIGRpZmZlcmVudA0KPiBCTyB3aXRoIGdpdmVuIG1vZGlmaWVyIn0sDQo+ICAJ
e1RFU1RfQkFEX0FVWF9TVFJJREUsICJiYWQtYXV4LXN0cmlkZSIsICJUZXN0IHdpdGggYmFkIEFV
WCBzdHJpZGUNCj4gd2l0aCBnaXZlbiBDQ1MgbW9kaWZpZXIifSwNCj4gIAl7VEVTVF9DUkMgfCBU
RVNUX0FMTF9QTEFORVMsICJjcmMtc3ByaXRlLXBsYW5lcy1iYXNpYyIsICJUZXN0IHNwcml0ZQ0K
PiBwbGFuZSBDUkMgY29tcGF0aWJpbGl0eSB3aXRoIGdpdmVuIENDUyBtb2RpZmllciJ9LA0KPiAr
DQo+ICsJLyoNCj4gKwkgKiBzdXNwZW5kIHRlc3QgaGFzIHRvIGJlIGtlcHQgbGFzdCBiZWNhdXNl
IGl0IHdpbGwgZGVjb21wcmVzcw0KPiArCSAqIGZyYW1lYnVmZmVycyB3aGVuIHJ1biBvbiBCTUcN
Cj4gKwkgKi8NCj4gKwl7VEVTVF9DUkMgfCBURVNUX1NVU1BFTkQsICJjcmMtcHJpbWFyeS1zdXNw
ZW5kIiwgIlRlc3QgcHJpbWFyeSBwbGFuZQ0KPiArQ1JDIHdpdGggc3VzcGVuZCBvbiBYUjI0IGFu
ZCBQMDE2IGZvcm1hdHMifSwNCj4gIH07DQo+IA0KPiAgLyoNCj4gQEAgLTY2Niw2ICs2NzQsMTgg
QEAgc3RhdGljIHN0cnVjdCBpZ3RfZmIgKmdldF9mYihkYXRhX3QgKmRhdGEsIHU2NCBtb2RpZmll
ciwNCj4gZG91YmxlIHIsIGRvdWJsZSBnLA0KPiAgCXJldHVybiAmZGF0YS0+ZmJfbGlzdFtkYXRh
LT5mYl9saXN0X2xlbmd0aCsrXS5mYjsNCj4gIH0NCj4gDQo+ICtzdGF0aWMgdm9pZCByZW1vdmVf
Y29tcHJlc3NlZF9ibWdfZmJzKGRhdGFfdCAqZGF0YSkgew0KPiArCS8qIGlmIHJ1bm5pbmcgb24g
Ym1nIGNjcyBiZWNvbWUgdW5jb21wcmVzc2VkIGF0IHN1c3BlbmQuIEhlcmUgbWFya2VkDQo+ICsJ
ICogYm1nIGNjcyBpbiBib29rIGtlZXBpbmcgYXMgbm90IHRoZXJlIGhlbmNlIGl0IHdpbGwgbm90
IG1hdGNoIHRvDQo+ICsJICogYW55dGhpbmcuIEhlcmUgY2Fubm90IHJlbW92ZSBmYiB5ZXQgc2lu
Y2UgaXQncyBvbiBzY3JlZW4uIFJlbW92ZQ0KPiArCSAqIHdpbGwgaGFwcGVuIGF0IGZpbmFsIGZp
eHR1cmUuDQo+ICsJICovDQo+ICsJZm9yIChpbnQgaSA9IDA7IGkgPCBkYXRhLT5mYl9saXN0X2xl
bmd0aDsgaSsrKSB7DQo+ICsJCWlmIChkYXRhLT5mYl9saXN0W2ldLm1vZGlmaWVyID09DQo+IEk5
MTVfRk9STUFUX01PRF80X1RJTEVEX0JNR19DQ1MpDQo+ICsJCQlkYXRhLT5mYl9saXN0W2ldLm1v
ZGlmaWVyID0gfjE7DQo+ICsJfQ0KPiArfQ0KPiArDQo+ICBzdGF0aWMgdm9pZCBnZW5lcmF0ZV9m
YihkYXRhX3QgKmRhdGEsIHN0cnVjdCBpZ3RfZmIgKmZiLA0KPiAgCQkJaW50IHdpZHRoLCBpbnQg
aGVpZ2h0LA0KPiAgCQkJZW51bSB0ZXN0X2ZiX2ZsYWdzIGZiX2ZsYWdzKQ0KPiBAQCAtODE3LDgg
KzgzNywyMiBAQCBzdGF0aWMgYm9vbCB0cnlfY29uZmlnKGRhdGFfdCAqZGF0YSwgZW51bSB0ZXN0
X2ZiX2ZsYWdzDQo+IGZiX2ZsYWdzLA0KPiANCj4gIAlyZXQgPSBpZ3RfZGlzcGxheV90cnlfY29t
bWl0MihkaXNwbGF5LCBkYXRhLT5jb21taXQpOw0KPiANCj4gLQlpZiAocmV0ID09IDAgJiYgIShm
Yl9mbGFncyAmIFRFU1RfQkFEX1JPVEFUSU9OXzkwKSAmJiBjcmMpDQo+ICsJaWYgKHJldCA9PSAw
ICYmICEoZmJfZmxhZ3MgJiBURVNUX0JBRF9ST1RBVElPTl85MCkgJiYgY3JjKSB7DQo+ICsJCWlm
IChkYXRhLT5mbGFncyAmIFRFU1RfU1VTUEVORCAmJiBmYl9mbGFncyAmDQo+IEZCX0NPTVBSRVNT
RUQpIHsNCj4gKw0KPiAJaWd0X3N5c3RlbV9zdXNwZW5kX2F1dG9yZXN1bWUoU1VTUEVORF9TVEFU
RV9NRU0sDQo+ICsJCQkJCQkgICAgICBTVVNQRU5EX1RFU1RfTk9ORSk7DQo+ICsNCj4gKwkJCS8q
IG9uIHJlc3VtZSBjaGVjayBmbGF0IGNjcyBpcyBzdGlsbCBjb21wcmVzc2VkICovDQo+ICsJCQlp
ZiAoaXNfeGVfZGV2aWNlKGRhdGEtPmRybV9mZCkgJiYNCj4gKwkJCSAgICBIQVNfRkxBVENDUyhp
bnRlbF9nZXRfZHJtX2RldmlkKGRhdGEtPmRybV9mZCkpKSB7DQo+ICsJCQkJaWYgKElTX0JBVFRM
RU1BR0UoaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLQ0KPiA+ZHJtX2ZkKSkpDQo+ICsJCQkJCXJl
bW92ZV9jb21wcmVzc2VkX2JtZ19mYnMoZGF0YSk7DQo+ICsJCQkJZWxzZQ0KPiArCQkJCQlhY2Nl
c3NfZmxhdF9jY3Nfc3VyZmFjZSgmZmIsIHRydWUpOw0KPiArCQkJfQ0KPiArCQl9DQo+ICAJCWln
dF9waXBlX2NyY19jb2xsZWN0X2NyYyhkYXRhLT5waXBlX2NyYywgY3JjKTsNCj4gKwl9DQo+IA0K
PiAgCWlndF9kZWJ1Z193YWl0X2Zvcl9rZXlwcmVzcygiY2NzIik7DQo+IA0KPiBAQCAtODQ2LDYg
Kzg4MCwxMSBAQCBzdGF0aWMgaW50IHRlc3RfY2NzKGRhdGFfdCAqZGF0YSkNCj4gIAlpZ3RfY3Jj
X3QgY3JjLCByZWZfY3JjOw0KPiAgCWVudW0gdGVzdF9mYl9mbGFncyBmYl9mbGFncyA9IDA7DQo+
IA0KPiArCWlmIChkYXRhLT5mbGFncyAmIFRFU1RfU1VTUEVORCAmJg0KPiArCSAgICAhKGRhdGEt
PmZvcm1hdCA9PSBEUk1fRk9STUFUX1hSR0I4ODg4IHx8DQo+ICsJICAgICAgZGF0YS0+Zm9ybWF0
ID09IERSTV9GT1JNQVRfUDAxNikpDQo+ICsJICAgICAgcmV0dXJuIDA7DQo+ICsNCj4gIAlpZ3Rf
aW5mbygiVGVzdGluZyBmb3JtYXQgIiBJR1RfRk9STUFUX0ZNVCAiIC8gbW9kaWZpZXIgIg0KPiBJ
R1RfTU9ESUZJRVJfRk1UICJcbiIsDQo+ICAJCSBJR1RfRk9STUFUX0FSR1MoZGF0YS0+Zm9ybWF0
KSwgSUdUX01PRElGSUVSX0FSR1MoZGF0YS0NCj4gPmNjc19tb2RpZmllcikpOw0KPiANCj4gLS0N
Cj4gMi40NS4yDQoNCg==
