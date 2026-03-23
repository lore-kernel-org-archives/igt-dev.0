Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC67F46124
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:02:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE1710E4D4;
	Mon, 23 Mar 2026 14:02:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S631WkBQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C3B110E122
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774274554; x=1805810554;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RV4xz7++xOgpyqwu4Wjt4iL1ukDrxcSkCDi38+3aNto=;
 b=S631WkBQSHAAqyy6pDe+13cl2spvh9bgHwWmakJImD1gpy4frZGNBvSH
 sunb/uJPT3JIbXMAIeLB6ucn9EY2ChEF0CiTx+Yellg9KsjT3W8W6JnCp
 YzF+bDL9yhc4gjePHy2sNp40d8Fwk/dz+xiJQONKY9k+sd1JZC+KCoEz9
 oIp94I9AtoFj/VH+2ErEkQq2aFfxnnOmY99FNUZlz6HDdkbyT/vEG3T8m
 5mUawDzMVn11St5Irda6N18+1+bbTJB3iDUuRDeiEVDWZTU/Ie160ZBcK
 eZ8Fv0NF7r9aBupMxxEz0EvDr1JbbfWKeZHLThXj7dBnxaDtth6N3OKSw w==;
X-CSE-ConnectionGUID: 4nuhr+H/T8GUQYKQ/AI/hQ==
X-CSE-MsgGUID: P24U40v1SHKfMmUYWUgMGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79177650"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79177650"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:02:34 -0700
X-CSE-ConnectionGUID: lyufBBySSy6tdGof2lVekA==
X-CSE-MsgGUID: 2aBb8KGYSLa6ezfA2BTOwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="225741054"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:02:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:02:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 07:02:33 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:02:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSaH/+nR+JMRQ/DBSHtMA6znI4kPWOQiPRQ1yiCK9AHWigULHf+7mN0UOUr6yFf3eAa+OWWe/sG0KcXOBjIvfvX9n0p+hq3fpXnoXK5jM5acIq6lg/vvhfiEhf4S0GLZ0ilEgARfNURxerkjiYlXNdbJZeWpFQxOdETO0LzWILiF0Gryyfwz6kDBx5tknJQTKMr8+Vw9nOiV21wugKoccsU8g7B5K4IMy/fv0e/ynTEnfQaiBwsBLMcmoJ2waoWL/G/sYkD40u7CQ+CnU+G4ojSFs9i86TCQQHASdyUW9D6SSAt1CDpF+FKMKp7pEwFY1LHlSaOa5SooDAPx1BtwCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RV4xz7++xOgpyqwu4Wjt4iL1ukDrxcSkCDi38+3aNto=;
 b=BK40CDSaQTYVwmnB8Od8tC/gFgJgbwTnOUBa+AFw0lRaUP9PrG0lgAuwdeFpcxXNgLuA6YVDtWW5PIGyHabWqx7nVHFVQHgh/T6FqbGW20bKsqz6uqxru27hWCzAUgP4hwI+lhXVSuHWsQsv5+wrQ6qtUM+PvK237HHckIFDzfIgyXmugxTPIKJw+14vLo2df7Y6P5veWuLXsUEzswNEMfnVFtiY20wmzn/FF0DQMl1IAOw/8arLKPMRH5n70ckSPUabcTwai1Ph3c5NwAPSYJ6Lk4N6Bf/i3GMdzmb/ljeTtpevjmUVUBTkp8pOL6pslDzzqKO8Gyhc81OpEKocyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 (2603:10b6:518:1::d41) by DM3PPFAB6A6CF3C.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:02:29 +0000
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::df01:30b2:d465:e136]) by PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::df01:30b2:d465:e136%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 14:02:29 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Grzelak, Michal" <michal.grzelak@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Vehmanen,
 Kai" <kai.vehmanen@intel.com>
CC: "Grzelak, Michal" <michal.grzelak@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as well
Thread-Topic: [PATCH i-g-t 2/2] tests/device_reset: unload audio on xe as well
Thread-Index: AQHctBQp/PbgnN+Cskyyf4jLLC8K0LW8Mx1g
Date: Mon, 23 Mar 2026 14:02:29 +0000
Message-ID: <PH3PPFAB4263235A4D6B17EBEF53B3C9DC4E04BA@PH3PPFAB4263235.namprd11.prod.outlook.com>
References: <20260315003826.3785048-1-michal.grzelak@intel.com>
 <20260315003826.3785048-2-michal.grzelak@intel.com>
In-Reply-To: <20260315003826.3785048-2-michal.grzelak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFAB4263235:EE_|DM3PPFAB6A6CF3C:EE_
x-ms-office365-filtering-correlation-id: be255c77-dfba-4d6f-ac1e-08de88e4d279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|18002099003|22082099003|7053199007|56012099003;
x-microsoft-antispam-message-info: Ps2mgYnCBuXKQlVwht9jG59o2ifMlsleO7X0K+SliKguSsRaR/ZAeSqsGcXJkCmwyItaQZr4bdqiqt3oZAOvktWW2PKfEV0v5s1NABIfPvffJeoi+cy13ezTgCwxcemeRAeqR1FWcxwAe3qra/TrVI5RarccOOH/MHaBcpskFEcdqGQ5F2B279FplNE698J88LEy2uPHF197iGvRwikNaZlLi8pDNrrcuvrS6DS1hsf0T+f39C4iCjtlhoFo4EEbu9T88nbAL+KqKpi5KyNLTFq2KjNgbBsBeWCOkbR0ePeaEaZXer9ZBN6O2C92EB+1QW9fdtb6Xx+6Y3snflfEympmaRekDkrqw9+bDEbTnT1b/09qMWvn9wXqx3nxQiTFGyhOQOjzEYHKiM8c3mIjcAC9d1hYGTNS7I/TCfg/QY/1iCL4eYVPCyfkpefIPaSw8xNZpuUpnHEvhZ+2Je1u+EjaAzhRq/EwvS5y0DtjWgFaA1utN+HhXejBo8BR7zl9F8qX+phnbbxX0yoz6EpmVYDb1KTOPmYmpllzsHdtVrE+KDQrbgWfEub3OB6BoIFizQX8m7YgJe5u5zvXpoDLw3wfSrkZjzyVTzM/8BVjEBSmiNq8U2GEqGr+BKsvGvRVJRM9FQi7DwypY4T42BwyTD078DFw2hJjYFIbZT/CKO3qvM9Bw4bq2k4bH9Bgtn6ly0RT7Czn9ckuqdhucRNkHWKgPWDTm+wxqiRtSk0OS8K4o1881AWrFmhjNZeaAo1lsCFGTrZbCQP2j+JkinF5kTOtJ7JOmypkL7ueRRputG4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFAB4263235.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(22082099003)(7053199007)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2NyT3RwQ2lIa1ozcmpJWVBVb2hSc001YmIzTktSK050VFBCakh1cjBsRm5L?=
 =?utf-8?B?UDFMQXhSZHB0TGs5WnJzelNTMFc2R0x1TkRaaDdDRjh6eWNkQUIyb2NqSHpO?=
 =?utf-8?B?b245dUdKV3pyTHVNLzA1dERpUWNaN2RyYXgxdFdReTZsbXZvYWEyVUo2cHdH?=
 =?utf-8?B?Qk9nQVY1UEtWZlZtZ1lBT0Y4TEk4cFBnL0ZYUVc4MWRKUUNQQmxIQ0NPMzU2?=
 =?utf-8?B?TFY3eVV5MnVwQ2g3cGVsUHYxcFZpYVBhSUdVRlpobUlOekpYL2dqNGhtWXds?=
 =?utf-8?B?b2hxV2Z6NnIvNTNwYTBwb2RFVHlxVGRIdGZTRzlqcDZjY01Ld3BWZVdaQXd0?=
 =?utf-8?B?aDNOK0VBU3IwU1pFWTlnT0xQRDMweGtmTDJrUERyeWdjUUk0NGJpM1hqL0VO?=
 =?utf-8?B?dmhZWDZmbEpNQXZTN0Y3Sk54bTY2S1lEVzU4M0RabDlwSWdTbEYyMHZ4ZXJt?=
 =?utf-8?B?d2tXTkFkTDI4c2JUY2Exa09WRmVyR1ZRODI3YUJUUGFleEZvZVpiakpzVlRK?=
 =?utf-8?B?YVJUdVpEcmlYVUFCNEpUMUR4Tk9yNVN6Uzh4K3M0L1lCaUdsN2RYSklTc3BQ?=
 =?utf-8?B?RXAzRnBWdC9SME5GdFhHYlAyRmVLSzNFUVhrRHEzMTNyVmpyWmhiR0RnYzEv?=
 =?utf-8?B?RlF3b2dDWDI3WnYzd1R0TUFvWmRVd1R0aEtwaEUvb0RMaUVIVzJNNjYxSDZ2?=
 =?utf-8?B?cXFXSnhlR3pCbUR5U3JWMDVwK2hVeE1iWkhsWWF2MkxTL20xbEszUU8wclJ1?=
 =?utf-8?B?MmNzQWRlaEZxb2N2TnZTbVBwNEZoRkNQY1JVdnRvc2QrNTQvWS91OU5zMlBa?=
 =?utf-8?B?RnJqYzV4d2laOXl1ZkNUc2FUVFB4T29NemYreFRGMnVQbFJhbCtZSDlld0V2?=
 =?utf-8?B?MXVHQkhzRndtUlc2cW5TZmYweXg5aXVaOVJ4eUhyUHMyNVdPbFhDTlhXa0VL?=
 =?utf-8?B?ZzEyZlQ4QmV5ZzNmcTdxTUI0QmxBTzkwMlF0d0FCWklyaExtZHIxa20wa093?=
 =?utf-8?B?eGRxand3U3cxS2RycU5IenArbXE3bnFsL3pqZkJWOW9jMi9LcjRHRksvN3NM?=
 =?utf-8?B?bVFHS1BhaW95U0p2TFMya0ZCY1FVeUJzaVRkd240YjFmU1d5YllzQitGcjdv?=
 =?utf-8?B?bzVETVpDUHpJdldYYXZRTDBnYlZFUm9sWEQrbjdYU1l1SE1CeDZ5dlIxc2Zl?=
 =?utf-8?B?NUp1MzdiVHhNTEp4VmNnbnZmYk5kcXg5WElIamhSRXVMUUhXOERlNk4zanBF?=
 =?utf-8?B?WFRwWGF2a0V4VUNPbElzc3hzZWFENDZ0S1FiNk01bXdJUDNXRTlOZHIvL2tw?=
 =?utf-8?B?MmNBL1BEZkdOK2FhWFhhVTMvQVUzVVdwZ2JqQm02ZGFCNms1M0JEY3JXY2NX?=
 =?utf-8?B?U3QxVytINElpMmd5ekFwbXRPeU5zbjl1azZmMlIzbnR0dlIrQW15NVlIS0t5?=
 =?utf-8?B?QktOek9RQVhORmRtRkhTVzYwMHhxNUtLVFl5WFhhRXRIR0F3NDJURnJhckRm?=
 =?utf-8?B?TVBKdG9yVElaNjBzanB4czdCcjc1UVQ2V3h2Nzg2T3RmUUtES3ltT29nRTVu?=
 =?utf-8?B?aDYwcVpsYjl4WVp0eFJFalVwTnVralQwOVM1Z3B0QjZPaUtqcHN3aWo0MnJ4?=
 =?utf-8?B?MTF1bWVjSXdkbE1GRjR2VzNvQU5YQnlKYUtIdTNubkFtZUExUzNxclpSOE4z?=
 =?utf-8?B?YzhCV3EvbE9PZ3F4M1RZd3IrVGQ0VTJ0VnZLS3BWUnhDYWtza2lERnJyM3NC?=
 =?utf-8?B?ek0vTWJSM1NEQ0psYWptWkJlTnJ5blZsem40WHF0RTQ0N21XSVZlT1JoVEVh?=
 =?utf-8?B?M0RJL2lRL3NuZGlVMDcraVQvWHJTR1JkRFJNN0lMbHovaUN3cUFQZG1lbm1Q?=
 =?utf-8?B?S3pLM0YxZTA4YkJVUjdFWnhWdkJ1SkxqK3E0ZlVoRU15TUhLR0sxMjNReHZm?=
 =?utf-8?B?VUVVTGlpUmNsNDFrcTNzcHlkWEVzOFMwNmZWU0MvZjIwS3Q2Q3pGL0RYZ0Rh?=
 =?utf-8?B?RDlFT1BYeHRORDMwaXM4SDNYa3N3Z3RxVEdXUklFTHd0OHltNTJHemxiUi9E?=
 =?utf-8?B?c2hHN2NjQjNkYThKOUR5OVZiVUc0YURMc21OcTI4YlFnTlpJaHFaelRDSGg3?=
 =?utf-8?B?YmdpNGdUaVFBUTl0aHJuMGFRUnhaMm0yZ1hkNURnVy9kNzk3dFdtcHVEa0g3?=
 =?utf-8?B?YWdLeWI5YUloTTUyT3VjV2s0V2pKL3JUK21EWEdJWjdsazNSK09VVXR5dlZQ?=
 =?utf-8?B?eElkT2VPdHZaR0RwbUIyN0RoMllTY1F4YzZxcVcyb2ZhTzB6TGRyVUJ4a0Zj?=
 =?utf-8?B?Z29aSDBHcHhSTDV0NXBieEkvUU5ycXNFZm5mVXdRWVliY1Y4eU1PZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: hlnVumUcOeuFB4NkGxjv4xxiwbo1zl+j7z3SB7VUQkhXoh1zTeujF9aI3gT9+mLP1jwQB6uiJFUpFI0/pprdh/8EvdObQ+69suhwNOYeNknLVvBQ+EJlbRpeCoJKO6rAD20fLgwUFGh1Nih8YPDB2u5hOAcPRkR08Xh4QMhhEtHCHzq/qAUEtngR+RO1sKa1xmcS8Huo+WjPPAEylsUdgh8HYYdOx2uSiurhH1RrAO7i1IVOGs0kbeK3JqcGWCtI8Qngy3ClyqVZcAq8gFEiMBJtVo0kp5olBHSdJY4jHuUiHYPDjJflkK7m/J228nzvaeYJNBosIoUemkILrZqECw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFAB4263235.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be255c77-dfba-4d6f-ac1e-08de88e4d279
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 14:02:29.7863 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fzjMi07WrT4Qux5Oqqp9kO/Z5xEReEjeNQwIaGd9AKJcYmyPm5TqVpG+evDYPjIqY6S9LhIKqsI5BEIcoyA5lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB6A6CF3C
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

SGksIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgTWljaGHFgg0K
PiBHcnplbGFrDQo+IFNlbnQ6IFN1bmRheSwgMTUgTWFyY2ggMjAyNiAyLjM4DQo+IFRvOiBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogR3J6ZWxhaywgTWljaGFsIDxtaWNoYWwu
Z3J6ZWxha0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCAyLzJdIHRlc3RzL2Rl
dmljZV9yZXNldDogdW5sb2FkIGF1ZGlvIG9uIHhlIGFzIHdlbGwNCj4gDQo+IFRoZXJlIGhhcyBi
ZWVuIG9ic2VydmVkIGVycm9ycyBjYXVzZWQgYnkgYXVkaW8gbm90IGJlaW5nIHVubG9hZGVkIGJl
Zm9yZSB4ZSBpcw0KPiB1bmJvdW5kOg0KPiANCj4gPDM+IFszMzkuMTc4NTk4XSB4ZSAwMDAwOjAw
OjAyLjA6IFtkcm1dICpFUlJPUiogYXVkaW8gcG93ZXIgcmVmY291bnQgMSBhZnRlcg0KPiB1bmJp
bmQNCj4gDQo+IFRoaXMgaXMgZHVlIGF1ZGlvIGlzIGJlaW5nIHVubG9hZGVkIG9ubHkgd2hlbiBp
OTE1IGhhcyBiZWVuIGxvYWRlZC4NCj4gQ2hhbmdlIHRoaXMgYmVoYXZpb3IgdG8gdW5sb2FkIGF1
ZGlvIHdpdGggYW55IEludGVsIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIg
R3J6ZWxhayA8bWljaGFsLmdyemVsYWtAaW50ZWwuY29tPg0KKyBLYWkNCg0KPiAtLS0NCj4gIHRl
c3RzL2RldmljZV9yZXNldC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZGV2aWNlX3Jlc2V0
LmMgYi90ZXN0cy9kZXZpY2VfcmVzZXQuYyBpbmRleA0KPiBiOTMxZGZmN2EwLi5iMjgxZjRlY2Vi
IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9kZXZpY2VfcmVzZXQuYw0KPiArKysgYi90ZXN0cy9kZXZp
Y2VfcmVzZXQuYw0KPiBAQCAtNDI2LDcgKzQyNiw3IEBAIHN0YXRpYyB2b2lkIHNldF9kZXZpY2Vf
ZmlsdGVyKGNvbnN0IGNoYXIqIGRldl9wYXRoKQ0KPiANCj4gIHN0YXRpYyB2b2lkIHVuYmluZF9y
ZXNldF9yZWJpbmQoc3RydWN0IGRldmljZV9mZHMgKmRldiwgZW51bSByZXNldCB0eXBlKSAgew0K
PiAtCWlmIChpc19pOTE1X2RldmljZShkZXYtPmZkcy5kZXYpKSB7DQo+ICsJaWYgKGlzX2ludGVs
X2RldmljZShkZXYtPmZkcy5kZXYpKSB7DQo+ICAJCWlndF9hdWRpb19kcml2ZXJfdW5sb2FkKCZk
ZXYtPnNuZF9kcml2ZXIpOw0KPiAgCX0NCj4gDQo+IC0tDQo+IDIuNDUuMg0KDQo=
