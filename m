Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF2E7E0BB
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F3610E3C1;
	Mon,  9 Feb 2026 10:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0oDojav";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0FA10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770632865; x=1802168865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=YAbFnlAN+IImSjNEUdvHKAWKQRCabD8g3Ebv79Jze/U=;
 b=K0oDojavisSEhToBxUfOJQcJGTYH0ClrRRgANUtTXSjXCCbAimy1XLyW
 8m3iXxtP+4zGvvmlI/3O9+QRC7SpAJyiqv7UiZ1xJp9GkoPVCpt6vKpN7
 Zumb8D35wdQGP+lSlgmnn8gGQ7kjZL7dwnXGxbQZli+IFUaIxvS3gt4cF
 HEEnZ72uIOreVLF7yarrpNm0rnIA6Qb8s6PBxB4PGWNec5VPx0/lharY7
 YQgJjAdNRaF2ZwzjY9naUhAyWUI54rjHEgwsP3JgLUixpaTGscDOnMx4Y
 Zdj+NBwZbd5Iv4kS2OPBoJdCMrqCxR4bk5jYs33I2HxckNYbufjS5JKuQ A==;
X-CSE-ConnectionGUID: EUUJ+Tu1SfeoSlrhYWdsqw==
X-CSE-MsgGUID: wUpyhH+fQZ+ngKuoekM5Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82066760"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208,217";a="82066760"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:27:45 -0800
X-CSE-ConnectionGUID: BaPulIAZSgm4r6eyM/bK/w==
X-CSE-MsgGUID: p/RRfa/xTlGB3io1vauzrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
 d="scan'208,217";a="210732633"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:27:44 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:27:43 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 02:27:43 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 02:27:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTr8aVgCLSpER+ohhhTIQF/IpIWF7Ei/a1d/bz2ovPNQOnhzl5mD0d93L/I3rPuO0jBztGcS8URs9DXkvt437M0NZT7JZlqf7xo4VFFcRQ5qWQa1Y/kkvNzRm2UAPOgqrd1KigGLqgAgcx+4nfQAzkQn5L5gEeKLNSSb7lmRHfWXzeT/rqRe20LmUAhIDgsClIhtySSQw95J9rTJd1IQN8a8UnFv8tbPw+wef5b6j5+anAGqTg2hNqQUZTIhDO5O27BVBWoqtn2MjwHcIR8uHlQaBW4dRK4sg0NY5si1/pJYC4M67dZ3Yn4xg2SoR/2HxqJqYfX9o3NCVi1oBUI3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAbFnlAN+IImSjNEUdvHKAWKQRCabD8g3Ebv79Jze/U=;
 b=MqMTVLhMyV0GVxAaoLW9ows6PTKy0tnQiPwTWtsg2UfdamPYTTlotH0PfI2tfncr+QYcO6cuKXAn7vdZ/LpuUwGm2yBv9h8HOIOwMqlKuShG/YasKxfRXiGAsPQwVQNz0XhU9xVa2ooX1h+ViUinfbaEaH43geuELMoC1cQmCiK/7nrxSFzrckqkw9fA5J9ofs5yp7OZ7R87OL67gmtU6k0HHAgA40xvdPO34Fwij7UjBdp9A1JcpBZQKMswyybAgHuxCwTWQjOtiUA1ewLXWAHcfL8ox6PeHPq/afF+ZMJc2kx++ywtcl1M2KxI60gPFkTnB0E3QQzUQWioKtUBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by CY5PR11MB6186.namprd11.prod.outlook.com (2603:10b6:930:26::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 10:27:40 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9587.016; Mon, 9 Feb 2026
 10:27:40 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Karas,
 Krzysztof" <krzysztof.karas@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v7] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Topic: [PATCH i-g-t v7] tools/gputop: Add GPU frequencies to the client
 headers
Thread-Index: AQHclpHIrG+cRrDdT0WeYiBxW2s1krV0Y7KAgAXMNA4=
Date: Mon, 9 Feb 2026 10:27:40 +0000
Message-ID: <CH0PR11MB5427886B12F863B8D4275B159865A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20260205111211.3917326-1-s.sebinraj@intel.com>
 <20260205175405.w4cgw4bxsgoh7dvy@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260205175405.w4cgw4bxsgoh7dvy@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|CY5PR11MB6186:EE_
x-ms-office365-filtering-correlation-id: fbaa00a1-55fa-4d00-06bb-08de67c5da6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|8096899003|7053199007; 
x-microsoft-antispam-message-info: =?big5?B?UHpJbEx3SmpTUklNanFxRUtiNHVMc2s4MjFjWE5WM0RxN2kyUG1mZ3NZUS93bGxO?=
 =?big5?B?amdMcDMwOGZMRGErSWVXMjVNeXY0TUJmWEtYa2JtWWt3YnAzbU9QNGJFbHJGTjY3?=
 =?big5?B?d3B0K3VVL05vcTVKSE9sTUk5OEhGVkZBOG1jYUM5ZzE5U0VMUXF5ZElqQWZhU0Fx?=
 =?big5?B?enpibktRSnAwdHhQV1Z1eHlReldQaWMxVVZGUUdHbERlSGZWd3RUWWZSOFh1L3hU?=
 =?big5?B?ZW5Tc3VicWFyVEE3MWgvdHpOZ1RzWkE1WVpjUW10aVdPRG5EZ1RkU0lQc0JRUjhx?=
 =?big5?B?Z1M2T1Y4dkRjelJqWUZqaWg4WUxSOTBJZVRiYUdLbHZ3NGovRGNvMGY2cU5hak4x?=
 =?big5?B?ZG9VL3Z2WlIvRmhvOXd2UzBrRTR0Vk00K0c3b1J6VlBYcHEyd09HcC9POHovR29t?=
 =?big5?B?cVdIbmovVmo5WU5wVm5Cb0x2dXRVUXJ0MmRaMjkyRFZLQjdPV3M0YVhRSkRuNEk1?=
 =?big5?B?NGZKNytZNXErdzN4ejgzY3pxZER6UGFHSGVuTnEwWmRDbjhmTWZXZXhYbVNzS2Vp?=
 =?big5?B?Q0pKcVo3OW1kZWJmZ3I5NEN0c0tnbHlZcTVIaDRuVlhna29WVHhNTW1aUmV3a3VH?=
 =?big5?B?Z2tJd2wwdzFDODNUNjB0NmY3WmExUUxQYTdST0FCcWxmMkhiOSs1UzVrRE5wVGNz?=
 =?big5?B?MmRUaTFDdTNBeGdCb3FjbnZkclNuQ1dmTDM2N1F2YWEzVXNqTnRJdTBvTWp1aFNY?=
 =?big5?B?SkFsUWJvdzhtcGZDTHFoWkRKUjNvYmp1OW50ZDlMelBMYXRHb2ViMGJoTlR0Vm1C?=
 =?big5?B?TDFHWk9Zd2dVWThYaUZQZGVoZ0F0MjVtNHF1NlBQdHp5L29zMkVudzZPanlNQkNK?=
 =?big5?B?UHZyT0wvSzcwYzc0UEtReGpKaGZEazdJelZUWWx6S2ErWTlaSW5IeGwvMjJVckpV?=
 =?big5?B?d3BHRXM2Q1g1K213N253VmFLbGJlUm1GZno2S2owY2hTMXgxQWI2R0tIYlhKcVRw?=
 =?big5?B?Zjk3L09XbU1ZSWl4NDZLcEV5bWU3QnRNVG84eXYzb1VyeGtlODJXaTN1c1RCZkdH?=
 =?big5?B?QUVVS2M0aS9zdUZYdFVOSjl2UlVHaVp6UHdUckVOVFQwc2VNMHY3OVNVYng4Q01z?=
 =?big5?B?ZFpyQ1JZa3lFbzhyT3NDeGcxdi9DdWE5SnVmZ3lHTUYyYlp4WDViNWxzL1F2Rnpu?=
 =?big5?B?ZG9hMmgwNGVUZzlmc1lkK2dXanNxYW1teUgrdStZM3QrdTJXYmRsamZpRklSbDBO?=
 =?big5?B?WVg2Zk1POG92UVd2QjBPalI2NXYyeGUwTk9PUEJKNHJGYVc5SUhFeCs2QjVhSFU2?=
 =?big5?B?Y1lSWmlYM3hSb1pIV1BCbnVGSXBGMzZaelBIVTZ5TStxbndFTE4vdngvRjR0ZDFO?=
 =?big5?B?S0tTa0hlMDlRWnIwbDFOK3ZCQTIvWHlFMDVXVG9rWFVOUUpoTzNuS1Z1bG5nV3ZU?=
 =?big5?B?U094RFZyV3M4cDE2cnhJd2NzNDVlRTJ4SzVqaVh3cXV1VWp3SEtXZTZNTHRPVGZ4?=
 =?big5?B?Zis2YW1aTUxFczlzN2ZaVWZpQ2twMXpnZ1VLUEpaNEpGRUxkblozQnNNVkRmSWtC?=
 =?big5?B?K2dBYnY1ek9nVUk0S2c2V2NrSGt4WGVZdDUyZ2JTYW42SStXdUUyTFNQS2MwcFY2?=
 =?big5?B?U05hWU0zUUdDd3c5UXFuQWlGMFlQazhOdU51S0hSVzU3UkFPNXQ3U1E1YlpDVHpo?=
 =?big5?B?SGdqd1Z1ajlySWsxYitma1hGRWo5UlBjTlNYbnVLYWZISzhoYlg4cVdWd0l2ZjA0?=
 =?big5?B?eUdXcGZMb0ppVEFLL1VhRm0zYTNhdlMzM2VtRHVFSkduNFpreWNsTFZYdUVSYnJn?=
 =?big5?B?aVFFRk9WOG0zVVhWTlZGQnYzSVZKNGJGRkRLWHhtSE9adWhoUUpTMkNvajhuSVFK?=
 =?big5?B?WEpGUGlBYTZiUGJJa3o2QVZ0SzY1QVZXRzFwSG5pcVF0WjlPWFFORHB2a09DUHVW?=
 =?big5?B?TVNNWWpRSThUVFRyajR6MlhJTjArZExwMTcwdnViTGtTYUp6YlowRXZ3djA5RENC?=
 =?big5?B?TmhWeWtvVldtY2NocHRPalRpSEFhbHZEcXpWREU4QlQ5ZEZpdG9TT2U5RVVkNEg0?=
 =?big5?B?ZnNvZUZLVzQzWUxKS2NRYVFPYi9iaHllZGRpS3lka0RDczdPNkJxdytITWh2YVFG?=
 =?big5?Q?Qr3HVmwfajg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-tw; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:;
 CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?big5?B?Y3ZsRUVHeXZpWVVIV2JRL3BMVGwzeDJDZ3ZDbEs4Qmhxb0Z4Y21taU1tdk1IT0ty?=
 =?big5?B?OVh2bmd2VzNldFVtYzJrWlhpNXBpM0ZrbTkxMHB2OUFTRXNQTFVIaURDRThuYzdZ?=
 =?big5?B?OTJuYWRUVmNKQXR6Y3NIR3FYYi94eGRvbUFjQ05YNDVKbzFleXBBK2pzU1lpeFo2?=
 =?big5?B?bWNpR1BJUEg5VlVOcGl5aXhkYlpNZmE2YkR0OEpCbkVTbUZjUmpyNnVlZDdTa3FB?=
 =?big5?B?Y1VzTVpOcGQ3cnhwd2FrM2FkUWhtYzNMbmhvSngrVTBySTZMZ3dybFJpVzNMV3ZD?=
 =?big5?B?S1Bpb1ZIcmF0Z3dOZnpiNWh5YUhROU1FY2dGL2FUSFFGb1RMZUJScEFtOVRlMjVI?=
 =?big5?B?S2lUR3FyUm16dVhDZkI0K29EalppNGwwTDFJMkJLVEg2WWFDVnBIM0RiUmJLSCtt?=
 =?big5?B?WFlTU3FsT3U5N0QwcEp1SkkyKzd4VFc2RFNrcGtjTHBZbUR6WFpKRmVnYkJoR3ZG?=
 =?big5?B?MzFRa2prdjBlL1BKY3UvY1ozcHFmNUtBcE00SHBpZis1RzJVSEdpT0lLWEh6Z3RM?=
 =?big5?B?NWZXa3pFUi9RNUNFUWdaNld0R3NEQzQ2Nkx6ZGFpRktrclJOcjlCVHllOVJTTjQ3?=
 =?big5?B?c1JGRUFpTnRtcTBYQzJWNkV1a1pwM2Q0aEs1T1N3elNGaGh3Q20rQTVxU2JhVVZJ?=
 =?big5?B?dmRKWldueE1uQTBVK0JDS0RWTjZKQ3FZV3lhaHFxczRCcitKMVhMbHdJNzh5b2s3?=
 =?big5?B?ZDBaZWZjT1lmeTI0UzlhcjBsZTdUK0JkT1FaNzBmSEQ0MG04YzE0bkZVTVpQS3BS?=
 =?big5?B?MjBxeEZxdXJMQi92amMyOXFHeGpGb2gxWmY0YkNweGp4RmR4TVRpTlNnZktSTVhJ?=
 =?big5?B?M2twc2N6R042RjhpbUVQZ1N2c2RiZWhvdG5iTTQrZ3ZsYWdDVUJROFdWT1RLc3M0?=
 =?big5?B?VTkrVUJyQStIdHBtUzN2NW5kcXRHR0ZlVUg0R1ZTMWxvdHVFZytoVUFnVHovbFVK?=
 =?big5?B?RmJVYWdrRXUxMEFJK1RIME5waTExSThXUXNFMkpjYXdhbE9CNkFjRzEvK2JEM0JI?=
 =?big5?B?V3ZUdU9WczZvMnNPdFZEWjBSaGVlOUYwTVc5dTBtbUZreWlNY1doanJoTmp2bHFR?=
 =?big5?B?WGRTUFY0UXE5bEVMYUNFU3Z6amZZQktYY2tmMW9lNFc5Wk1DQnI3TU9CTkZTYUho?=
 =?big5?B?RXRiTElmRWtVd0lRdGUrRDZxTUE3ekJ0d1hLZ1U5Q2hhMW0vc1p2SzdoWUJyWlJO?=
 =?big5?B?bVlsbzVCc2VieUtialJWeHlzc2JuQkZnc3VUaklQM0JJTVNCVGVVc21COHJ5eWs2?=
 =?big5?B?d2U2OGpGbUlNS2djUWlNemlwRVhFd2pYeXdXY0FreWd0RDNpVnl2VDcyY2RncHc2?=
 =?big5?B?TTJPQTcwcUMrbWZudlRnSytDV1p3SEt1MlNYTnlJVlN5RTR4T1l1MWh3Z280ZDRS?=
 =?big5?B?U24zZVdkNC8vS0lYa0ViZjBnU1lwSGVORlM2QzRMc2NNZGFVNDlSZ3RHaEs1bkZE?=
 =?big5?B?Rm41cXZQWmgzSXlHQ0xlbjhUOWc1RXAyODlZejJhWkNzTUlhL0xnRi9QUDJLMm85?=
 =?big5?B?eE9tOWZXL1RvSDM2a2twWW9TMWxKS21qdSsxNi8rQ3ZYV2dnYmx1YjhiWDhMUC93?=
 =?big5?B?dEVtblNhTmEyRktPOUhDNjZmMzBnTlZRYURNOUtFaHpHU1ZFbzhhMkF0Q2NIOGRH?=
 =?big5?B?aFBHRHRVNEdqZi9vSHVXL1RMNEI3d2NscmViVDZHYlFRK1B3NHR5V3lSZktSWGxr?=
 =?big5?B?K3gxZzdNUVFadmpnb2xZVXFsNXlQMk1qRVZLZEt3TE9SZmY5ZjF3U1JOeHZtV0dH?=
 =?big5?B?WGNKY2d1SXAvT2l2RzgzNEdnT2t1bzAvSzZMNzdHM3cyODdQVUpmUXFGMCtUdFZk?=
 =?big5?B?SmNCamFwTHZUQ2l6K05oK2krck1INUZLdVVoVjVmSXVldlpZdlVaNi9sdEVBa0FE?=
 =?big5?B?YndnOUZlVGhqaGdrNnNZMWJUdFA5dm1XWjlXblJxWDhqMGk0cTlGZWd1cXFyS1Jm?=
 =?big5?B?bk1QOWpzMjRqOUV0WmVSdjY0dUtpUzVIZU51MXJOenhUd2NGWkE1SUx6K1dxMzh0?=
 =?big5?B?a1NuVkt0azEvWjd4UHJkK2JWWHJMR0xkTGFxbExHdTlSWlR3Mm1SSXU4WWtjYTJo?=
 =?big5?B?T3JNRndUL2c3RmZPc1h2djNHVVNrMkdLSDEyYnZpaXlCZkUxamRoSUtKaUtKV2dT?=
 =?big5?Q?15gZ1hxtkiBS8lpJZwdazO4o4rXFPmbPopOlIvF5qT1mvYGv?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB5427886B12F863B8D4275B159865ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbaa00a1-55fa-4d00-06bb-08de67c5da6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2026 10:27:40.3393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqU9aedygY5c4CCagQlH2lcLJ4jIFD8UpULx2+GemsowUSMz0rnuMFAv3bBfebjRQZYTfO3TyS03boATIPjZWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6186
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

--_000_CH0PR11MB5427886B12F863B8D4275B159865ACH0PR11MB5427namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

DQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IEthbWlsIEtvbmll
Y3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NClNlbnQ6IFRodXJzZGF5LCBG
ZWJydWFyeSA1LCAyMDI2IDExOjI0IFBNDQpUbzogU2ViaW5yYWosIFMgPHMuc2ViaW5yYWpAaW50
ZWwuY29tPg0KQ2M6IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxpZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz47IEthcmFzLCBLcnp5c3p0b2YgPGtyenlzenRvZi5rYXJhc0BpbnRl
bC5jb20+OyBLb25pZWN6bnksIEthbWlsIDxrYW1pbC5rb25pZWN6bnlAaW50ZWwuY29tPjsgS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBQdXJr
YWl0LCBTb2hhbSA8c29oYW0ucHVya2FpdEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENI
IGktZy10IHY3XSB0b29scy9ncHV0b3A6IEFkZCBHUFUgZnJlcXVlbmNpZXMgdG8gdGhlIGNsaWVu
dCBoZWFkZXJzDQoNCkhpIFMsDQpPbiAyMDI2LTAyLTA1IGF0IDE2OjQyOjExICswNTMwLCBTIFNl
YmlucmFqIHdyb3RlOg0KPiBFbmhhbmNlIGdwdXRvcCB0byBkaXNwbGF5IEdQVSBmcmVxdWVuY3kg
aW5mb3JtYXRpb24gKGN1cnJlbnQvYWN0dWFsKQ0KPiBmb3IgZWFjaCBHVCBpbiB0aGUgY2xpZW50
IGhlYWRlciBsaW5lIGFsb25nc2lkZSB0aGUgRFJNIG1pbm9yIG51bWJlci4NCj4NCj4gS2V5IGNo
YW5nZXM6DQo+IC0gQWRkIGdldF9ndF9mcmVxdWVuY2llcygpIGZ1bmN0aW9uIHRvIHJlYWQgR1Qg
ZnJlcXVlbmN5IHZhbHVlcw0KPiAtIFN1cHBvcnQgYm90aCBpOTE1IGFuZCBYZSBkcml2ZXJzIHVz
aW5nIGFwcHJvcHJpYXRlIHN5c2ZzIHBhdGhzDQo+IC0gRGlzcGxheSBmb3JtYXQ6ICJEUk0gbWlu
b3IgWCAgRnJlcShjdXIvYWN0KSBHVDAtZnJlcS9mcmVxIEdUMS1mcmVxL2ZyZXEiDQo+IC0gRHJp
dmVyLWFnbm9zdGljIHN5c2ZzIGFjY2Vzcw0KPg0KPiBUaGUgZnJlcXVlbmN5IGluZm9ybWF0aW9u
IGhlbHBzIHVzZXJzIG1vbml0b3IgR1BVIHBlcmZvcm1hbmNlIHN0YXRlcw0KPiBpbiByZWFsLXRp
bWUgd2hpbGUgb2JzZXJ2aW5nIGNsaWVudCB3b3JrbG9hZCB1dGlsaXphdGlvbi4NCj4NCj4gRXhh
bXBsZSBvdXRwdXQ6DQo+ICAgRFJNIG1pbm9yIDAgICBGcmVxdWVuY3kgR1QwLTE4MDAvMTgwMCBH
VDEtNDAwLzQwMA0KPiAgIERSTSBtaW5vciAxMjggICBGcmVxdWVuY3kgR1QwLTQwMC80MDAgR1Qx
LTQwMC80MDANCj4NCj4gdjI6DQo+IC0gVG8gdXNlIG1hY3JvIHRvIHN1ZmZpeCBzdHJpbmdzDQo+
IC0gVG8gc2tpcCBmYWlsdXJlIGxvb3BzDQo+DQo+IHYzOg0KPiAtIFRvIGtlZXAgZXJyb3IgbG9n
cw0KPg0KPiB2NDoNCj4gLSBSZW1vdmVkIFJGQyBmcm9tIFN1YmplY3QNCj4NCj4gdjU6DQo+IC0g
RmFsbGJhY2sgdG8gbm9ybWFsIHN5c2ZzIHJlYWQgaW5zdGVhZCBvZiB1c2luZyBsaWIgYXBpJ3MN
Cj4gICBhcyBpdCBpbmNyZWFzZWQgdGhlIGRlcGVuZGVuY2llcyBoaWdobHkNCj4NCj4gdjY6DQo+
IC0gUmVtb3ZlIGRyaXZlciBzcGVjaWZpYyBsb2dnaW5nDQo+IC0gQ2hhbmdlIGZ1bmN0aW9uIG5h
bWUgdG8gdGhpcyByZWdhcmQNCj4NCj4gdjc6DQo+IC0gTW92ZSBpbnRlbCBzcGVjaWZpYyBjb2Rl
IGF3YXkgZnJvbSBnZW5lcmljIGZ1bmNzDQo+IC0gQWRkIGZ1bmMgdG8gY2hlY2sgd2hpY2ggZHJp
dmVyIGlzIGJvdW5kDQo+IC0gU3BhY2UgY29ycmVjdGlvbiBpbiBzdHJpbmdzDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IFMgU2ViaW5yYWogPHMuc2ViaW5yYWpAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRv
b2xzL2dwdXRvcC5jIHwgMTg5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxODcgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2dwdXRvcC5jIGIvdG9vbHMvZ3B1dG9w
LmMNCj4gaW5kZXggZjU3N2ExNzUwLi4yMTZiMDMwYmUgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2dw
dXRvcC5jDQo+ICsrKyBiL3Rvb2xzL2dwdXRvcC5jDQo+IEBAIC0zMCwxMyArMzAsMjAgQEANCj4g
ICNpbmNsdWRlICJpZ3RfZHJtX2NsaWVudHMuaCINCj4gICNpbmNsdWRlICJpZ3RfZHJtX2ZkaW5m
by5oIg0KPiAgI2luY2x1ZGUgImlndF9wcm9maWxpbmcuaCINCj4gLSNpbmNsdWRlICJkcm10ZXN0
LmgiDQo+DQo+ICBlbnVtIHV0aWxpemF0aW9uX3R5cGUgew0KPiAgICAgICAgVVRJTElaQVRJT05f
VFlQRV9FTkdJTkVfVElNRSwNCj4gICAgICAgIFVUSUxJWkFUSU9OX1RZUEVfVE9UQUxfQ1lDTEVT
LA0KPiAgfTsNCj4NCj4gK2VudW0gaW50ZWxfZHJpdmVyX3R5cGUgew0KPiArICAgICBJTlRFTF9E
UklWRVJfSTkxNSwNCj4gKyAgICAgSU5URUxfRFJJVkVSX1hFLA0KPiArICAgICBJTlRFTF9EUklW
RVJfVU5LTk9XTiwNCj4gK307DQo+ICsNCj4gKyNkZWZpbmUgQVJSQVlfU0laRShhcnIpIChzaXpl
b2YoYXJyKSAvIHNpemVvZigoYXJyKVswXSkpDQo+ICsNCj4gIHN0YXRpYyBjb25zdCBjaGFyICpi
YXJzW10gPSB7ICIgIiwgIqJqIiwgIqJrIiwgIqJsIiwgIqJtIiwgIqJuIiwgIqJvIiwgIqJwIiwg
IqJpIiB9Ow0KPg0KPiAgI2RlZmluZSBBTlNJX0hFQURFUiAiXDAzM1s3bSINCj4gQEAgLTc2LDE3
ICs4MywxOTUgQEAgc3RhdGljIHZvaWQgcHJpbnRfcGVyY2VudGFnZV9iYXIoZG91YmxlIHBlcmNl
bnQsIGludCBtYXhfbGVuKQ0KPiAgICAgICAgcHV0Y2hhcignfCcpOw0KPiAgfQ0KPg0KPiArLyog
RGV0ZWN0IHdoaWNoIGRyaXZlciBpcyBib3VuZCB0byB0aGUgZGV2aWNlICovDQo+ICtzdGF0aWMg
Ym9vbCBpc19kcml2ZXIodW5zaWduZWQgaW50IGRybV9taW5vciwgY29uc3QgY2hhciAqZHJpdmVy
X25hbWUpDQo+ICt7DQo+ICsgICAgIGNoYXIgcGF0aFsyNTZdOw0KPiArICAgICBjaGFyIGxpbmtb
MjU2XTsNCj4gKyAgICAgY2hhciAqZHJpdmVyOw0KPiArICAgICBzc2l6ZV90IGxlbjsNCj4gKw0K
PiArICAgICAvKiBSZWFkIHRoZSBkcml2ZXIgc3ltbGluayAqLw0KPiArICAgICBzbnByaW50Zihw
YXRoLCBzaXplb2YocGF0aCksICIvc3lzL2NsYXNzL2RybS9jYXJkJXUvZGV2aWNlL2RyaXZlciIs
IGRybV9taW5vcik7DQoNCj4+Rm9yIGRybV9taW5vciA+PSAxMjggeW91IHNob3VsZCB1c2UgJ3Jl
bmRlckQnLCBub3QgJ2NhcmQnLg0KU2VlIGFsc28gbm90ZSBiZWxvdy4NCg0KT2theSBJJ2xsIGFk
ZCBhIGZ1bmN0aW9uIGFzIHBlciB0aGUgY29tbWVudHMNCg0KPiArICAgICBsZW4gPSByZWFkbGlu
ayhwYXRoLCBsaW5rLCBzaXplb2YobGluaykgLSAxKTsNCj4gKyAgICAgaWYgKGxlbiA9PSAtMSkN
Cj4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+ICsNCj4gKyAgICAgbGlua1tsZW5dID0g
J1wwJzsNCj4gKw0KPiArICAgICAvKiBFeHRyYWN0IGRyaXZlciBuYW1lIGZyb20gcGF0aCAoZS5n
LiwgImJ1cy9wY2kvZHJpdmVycy9pOTE1IiAtPiAiaTkxNSIpICovDQo+ICsgICAgIGRyaXZlciA9
IHN0cnJjaHIobGluaywgJy8nKTsNCj4gKyAgICAgaWYgKCFkcml2ZXIpDQo+ICsgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOw0KPiArDQo+ICsgICAgIGRyaXZlcisrOyAvKiBTa2lwIHRoZSAnLycg
Ki8NCg0KPj4gQWRkIG5ld2xpbmUuDQoNCk9rYXkgZ290IGl0Lg0KDQo+ICsgICAgIHJldHVybiBz
dHJjbXAoZHJpdmVyLCBkcml2ZXJfbmFtZSkgPT0gMDsNCj4gK30NCj4gKw0KPiArLyogRGV0ZWN0
IGlmIHRoaXMgaXMgYW4gSW50ZWwgZGV2aWNlIChpOTE1IG9yIFhlKSAqLw0KPiArc3RhdGljIGJv
b2wgaXNfaW50ZWxfZGV2aWNlKHVuc2lnbmVkIGludCBkcm1fbWlub3IpDQo+ICt7DQo+ICsgICAg
IHJldHVybiBpc19kcml2ZXIoZHJtX21pbm9yLCAiaTkxNSIpIHx8IGlzX2RyaXZlcihkcm1fbWlu
b3IsICJ4ZSIpOw0KPiArfQ0KPiArDQo+ICsvKiBEZXRlY3QgSW50ZWwgZHJpdmVyIHZhcmlhbnQg
Ki8NCj4gK3N0YXRpYyBlbnVtIGludGVsX2RyaXZlcl90eXBlIGRldGVjdF9pbnRlbF9kcml2ZXIo
dW5zaWduZWQgaW50IGRybV9taW5vcikNCj4gK3sNCj4gKyAgICAgaWYgKGlzX2RyaXZlcihkcm1f
bWlub3IsICJ4ZSIpKQ0KPiArICAgICAgICAgICAgIHJldHVybiBJTlRFTF9EUklWRVJfWEU7DQo+
ICsgICAgIGVsc2UgaWYgKGlzX2RyaXZlcihkcm1fbWlub3IsICJpOTE1IikpDQo+ICsgICAgICAg
ICAgICAgcmV0dXJuIElOVEVMX0RSSVZFUl9JOTE1Ow0KPiArDQo+ICsgICAgIHJldHVybiBJTlRF
TF9EUklWRVJfVU5LTk9XTjsNCj4gK30NCj4gKw0KPiArLyogQ291bnQgdGhlIG51bWJlciBvZiBH
VHMgYnkgY2hlY2tpbmcgd2hpY2ggZ3QqIGRpcmVjdG9yaWVzIGV4aXN0ICovDQo+ICtzdGF0aWMg
aW50IGdldF9udW1fZ3RzKHVuc2lnbmVkIGludCBkcm1fbWlub3IsIGVudW0gaW50ZWxfZHJpdmVy
X3R5cGUgZHJpdmVyX3R5cGUpDQo+ICt7DQo+ICsgICAgIGNoYXIgcGF0aFsyNTZdOw0KPiArICAg
ICBzdHJ1Y3Qgc3RhdCBzdDsNCj4gKyAgICAgaW50IGd0X2NvdW50ID0gMDsNCj4gKw0KPiArICAg
ICAvKiBDaGVjayBmb3IgZ3QwLCBndDEsIGd0MiwgZXRjLiB1cCB0byBhIHJlYXNvbmFibGUgbWF4
aW11bSAqLw0KPiArICAgICBmb3IgKGludCBpID0gMDsgaSA8IDg7IGkrKykgew0KPiArICAgICAg
ICAgICAgIGlmIChkcml2ZXJfdHlwZSA9PSBJTlRFTF9EUklWRVJfWEUpDQo+ICsgICAgICAgICAg
ICAgICAgICAgICAvKiBGb3IgWGUsIGFsbCBHVHMgYXJlIHVuZGVyIHRpbGUwICovDQo+ICsgICAg
ICAgICAgICAgICAgICAgICBzbnByaW50ZihwYXRoLCBzaXplb2YocGF0aCksICIvc3lzL2NsYXNz
L2RybS9jYXJkJXUvZGV2aWNlL3RpbGUwL2d0JWQiLA0KDQpIZXJlIHlvdSBhZ2FpbiB1c2UgJ2Nh
cmQnLCBtYXliZSBjcmVhdGUgbmV3IGZ1bmN0aW9uIGZvciB0aGlzIG5hbWUNCmFuZCB1c2UgaXQg
aW5zdGVhZCBoZXJlIGFuZCBpbiBvdGhlciBwbGFjZXM/IEZvciBleGFtcGxlOg0KDQpjaGFyICpn
ZXRfZHJtX25hbWUoaW50IG1pbm9yKQ0Kew0KICAgICAgICByZXR1cm4gbWlub3IgPj0gMTI4ID8g
InJlbmRlckQiIDogImNhcmQiOw0KfQ0KDQogICAgICAgIHNucHJpbnRmKHBhdGgsIHNpemVvZihw
YXRoKSwgIi9zeXMvY2xhc3MvZHJtLyVzJXUvZGV2aWNlL3RpbGUwL2d0JWQiLA0KICAgICAgICAg
ICAgICAgICBnZXRfZHJtX25hbWUoZHJtX21pbm9yKSwgLi4uLg0KDQpvciBldmVuIG1vcmUsIGxp
a2U6DQpjb25zdCBjaGFyICpnZXRfc3lzZnNfcHJlZml4KGludCBtaW5vcikNCnsNCiAgICAgICAg
cmV0dXJuIG1pbm9yID49IDEyOCA/ICIvc3lzL2NsYXNzL2RybS9yZW5kZXJEIiA6DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiL3N5cy9jbGFzcy9kcm0vY2FyZCI7DQp9DQoNClJlc3Qg
b2YgY29kZSBsb29rcyBnb29kLg0KDQpSZWdhcmRzLA0KS2FtaWwNCg0KPj4+Pg0KDQpTdXJlLCBJ
J2xsIGNvcnJlY3QgdGhlIGNvZGUgYW5kIHNlbmQgYSB1cGRhdGVkIHZlcnNpb24uDQoNCg0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZHJtX21pbm9yLCBpKTsNCj4gKyAgICAgICAg
ICAgICBlbHNlIC8qIGk5MTUgKi8NCj4gKyAgICAgICAgICAgICAgICAgICAgIHNucHJpbnRmKHBh
dGgsIHNpemVvZihwYXRoKSwgIi9zeXMvY2xhc3MvZHJtL2NhcmQldS9ndC9ndCVkIiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9taW5vciwgaSk7DQo+ICsNCj4gKyAgICAg
ICAgICAgICBpZiAoc3RhdChwYXRoLCAmc3QpID09IDAgJiYgU19JU0RJUihzdC5zdF9tb2RlKSkN
Cj4gKyAgICAgICAgICAgICAgICAgICAgIGd0X2NvdW50Kys7DQo+ICsgICAgICAgICAgICAgZWxz
ZQ0KPiArICAgICAgICAgICAgICAgICAgICAgYnJlYWs7ICAvKiBBc3N1bWUgR1RzIGFyZSBudW1i
ZXJlZCBzZXF1ZW50aWFsbHkgKi8NCj4gKyAgICAgfQ0KPiArDQo+ICsgICAgIHJldHVybiBndF9j
b3VudCA+IDAgPyBndF9jb3VudCA6IDE7ICAvKiBBdCBsZWFzdCAxIEdUIHNob3VsZCBleGlzdCAq
Lw0KPiArfQ0KPiArDQo+ICsvKiBSZWFkIGEgc2luZ2xlIGZyZXF1ZW5jeSB2YWx1ZSBmcm9tIHN5
c2ZzICovDQo+ICtzdGF0aWMgYm9vbCByZWFkX2ZyZXFfdmFsdWUoY29uc3QgY2hhciAqcGF0aCwg
dW5zaWduZWQgaW50ICpmcmVxKQ0KPiArew0KPiArICAgICBGSUxFICpmcDsNCj4gKyAgICAgY2hh
ciBidWZbMzJdOw0KPiArICAgICBib29sIHN1Y2Nlc3MgPSBmYWxzZTsNCj4gKw0KPiArICAgICBm
cCA9IGZvcGVuKHBhdGgsICJyIik7DQo+ICsgICAgIGlmIChmcCkgew0KPiArICAgICAgICAgICAg
IGlmIChmZ2V0cyhidWYsIHNpemVvZihidWYpLCBmcCkpIHsNCj4gKyAgICAgICAgICAgICAgICAg
ICAgICpmcmVxID0gYXRvaShidWYpOw0KPiArICAgICAgICAgICAgICAgICAgICAgc3VjY2VzcyA9
IHRydWU7DQo+ICsgICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgIGZjbG9zZShmcCk7DQo+
ICsgICAgIH0NCj4gKw0KPiArICAgICByZXR1cm4gc3VjY2VzczsNCj4gK30NCj4gKw0KPiArLyog
SW50ZWwtc3BlY2lmaWMgZnJlcXVlbmN5IHJlYWRpbmcgZm9yIGk5MTUvWGUgZHJpdmVycyAqLw0K
PiArc3RhdGljIGNoYXIgKmdldF9pbnRlbF9mcmVxdWVuY2llcyh1bnNpZ25lZCBpbnQgZHJtX21p
bm9yKQ0KPiArew0KPiArICAgICBjaGFyIGZyZXFfc3RyWzUxMl0gPSAiIjsNCj4gKyAgICAgY2hh
ciBndF9pbmZvWzY0XTsNCj4gKyAgICAgaW50IG51bV9ndHM7DQo+ICsgICAgIGludCBndDsNCj4g
KyAgICAgZW51bSBpbnRlbF9kcml2ZXJfdHlwZSBkcml2ZXJfdHlwZTsNCj4gKyAgICAgYm9vbCBm
aXJzdCA9IHRydWU7DQo+ICsNCj4gKyAgICAgLyogRGV0ZWN0IEludGVsIGRyaXZlciB2YXJpYW50
ICovDQo+ICsgICAgIGRyaXZlcl90eXBlID0gZGV0ZWN0X2ludGVsX2RyaXZlcihkcm1fbWlub3Ip
Ow0KPiArICAgICBpZiAoZHJpdmVyX3R5cGUgPT0gSU5URUxfRFJJVkVSX1VOS05PV04pDQo+ICsg
ICAgICAgICAgICAgcmV0dXJuIE5VTEw7DQo+ICsNCj4gKyAgICAgLyogR2V0IEdUIGNvdW50IGZy
b20gc3lzZnMgKi8NCj4gKyAgICAgbnVtX2d0cyA9IGdldF9udW1fZ3RzKGRybV9taW5vciwgZHJp
dmVyX3R5cGUpOw0KPiArICAgICBpZiAobnVtX2d0cyA8PSAwKQ0KPiArICAgICAgICAgICAgIHJl
dHVybiBOVUxMOw0KPiArDQo+ICsgICAgIC8qIFJlYWQgZnJlcXVlbmNpZXMgZm9yIGVhY2ggR1Qg
Ki8NCj4gKyAgICAgZm9yIChndCA9IDA7IGd0IDwgbnVtX2d0czsgZ3QrKykgew0KPiArICAgICAg
ICAgICAgIGNoYXIgZnJlcV9wYXRoWzI1Nl07DQo+ICsgICAgICAgICAgICAgdW5zaWduZWQgaW50
IGN1cl9mcmVxID0gMCwgYWN0X2ZyZXEgPSAwOw0KPiArICAgICAgICAgICAgIGJvb2wgaGFzX2N1
ciA9IGZhbHNlLCBoYXNfYWN0ID0gZmFsc2U7DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBSZWFk
IGN1cnJlbnQvcmVxdWVzdGVkIGZyZXF1ZW5jeSAqLw0KPiArICAgICAgICAgICAgIGlmIChkcml2
ZXJfdHlwZSA9PSBJTlRFTF9EUklWRVJfWEUpDQo+ICsgICAgICAgICAgICAgICAgICAgICBzbnBy
aW50ZihmcmVxX3BhdGgsIHNpemVvZihmcmVxX3BhdGgpLA0KPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIi9zeXMvY2xhc3MvZHJtL2NhcmQldS9kZXZpY2UvdGlsZTAvZ3QlZC9mcmVx
MC9jdXJfZnJlcSIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fbWlub3Is
IGd0KTsNCj4gKyAgICAgICAgICAgICBlbHNlIC8qIGk5MTUgKi8NCj4gKyAgICAgICAgICAgICAg
ICAgICAgIHNucHJpbnRmKGZyZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0aCksDQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAiL3N5cy9jbGFzcy9kcm0vY2FyZCV1L2d0L2d0JWQvcnBz
X2N1cl9mcmVxX21oeiIsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkcm1fbWlu
b3IsIGd0KTsNCj4gKw0KPiArICAgICAgICAgICAgIGhhc19jdXIgPSByZWFkX2ZyZXFfdmFsdWUo
ZnJlcV9wYXRoLCAmY3VyX2ZyZXEpOw0KPiArDQo+ICsgICAgICAgICAgICAgLyogUmVhZCBhY3R1
YWwgZnJlcXVlbmN5ICovDQo+ICsgICAgICAgICAgICAgaWYgKGRyaXZlcl90eXBlID09IElOVEVM
X0RSSVZFUl9YRSkNCj4gKyAgICAgICAgICAgICAgICAgICAgIHNucHJpbnRmKGZyZXFfcGF0aCwg
c2l6ZW9mKGZyZXFfcGF0aCksDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiL3N5
cy9jbGFzcy9kcm0vY2FyZCV1L2RldmljZS90aWxlMC9ndCVkL2ZyZXEwL2FjdF9mcmVxIiwNCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9taW5vciwgZ3QpOw0KPiArICAgICAg
ICAgICAgIGVsc2UgLyogaTkxNSAqLw0KPiArICAgICAgICAgICAgICAgICAgICAgc25wcmludGYo
ZnJlcV9wYXRoLCBzaXplb2YoZnJlcV9wYXRoKSwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICIvc3lzL2NsYXNzL2RybS9jYXJkJXUvZ3QvZ3QlZC9ycHNfYWN0X2ZyZXFfbWh6IiwN
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9taW5vciwgZ3QpOw0KPiArDQo+
ICsgICAgICAgICAgICAgaGFzX2FjdCA9IHJlYWRfZnJlcV92YWx1ZShmcmVxX3BhdGgsICZhY3Rf
ZnJlcSk7DQo+ICsNCj4gKyAgICAgICAgICAgICAvKiBTa2lwIHRoaXMgR1QgaWYgd2UgY291bGRu
J3QgcmVhZCBhbnkgZnJlcXVlbmN5ICovDQo+ICsgICAgICAgICAgICAgaWYgKCFoYXNfY3VyICYm
ICFoYXNfYWN0KQ0KPiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ICsNCj4gKyAg
ICAgICAgICAgICAvKiBBcHBlbmQgdG8gZnJlcXVlbmN5IHN0cmluZyAqLw0KPiArICAgICAgICAg
ICAgIGlmICghZmlyc3QpDQo+ICsgICAgICAgICAgICAgICAgICAgICBzdHJjYXQoZnJlcV9zdHIs
ICIgIik7DQo+ICsgICAgICAgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgICAgICAgICAgZmly
c3QgPSBmYWxzZTsNCj4gKw0KPiArICAgICAgICAgICAgIHNucHJpbnRmKGd0X2luZm8sIHNpemVv
ZihndF9pbmZvKSwgIkdUJWQtJXUvJXUiLCBndCwgY3VyX2ZyZXEsIGFjdF9mcmVxKTsNCj4gKyAg
ICAgICAgICAgICBzdHJjYXQoZnJlcV9zdHIsIGd0X2luZm8pOw0KPiArICAgICB9DQo+ICsNCj4g
KyAgICAgaWYgKHN0cmxlbihmcmVxX3N0cikgPiAwKQ0KPiArICAgICAgICAgICAgIHJldHVybiBz
dHJkdXAoZnJlcV9zdHIpOw0KPiArDQo+ICsgICAgIHJldHVybiBOVUxMOw0KPiArfQ0KPiArDQo+
ICsvKiBHZW5lcmljIHdyYXBwZXIgZm9yIGZyZXF1ZW5jeSByZWFkaW5nIC0gZGlzcGF0Y2hlcyB0
byB2ZW5kb3Itc3BlY2lmaWMgaW1wbGVtZW50YXRpb25zICovDQo+ICtzdGF0aWMgY2hhciAqZ2V0
X2ZyZXF1ZW5jaWVzKHVuc2lnbmVkIGludCBkcm1fbWlub3IpDQo+ICt7DQo+ICsgICAgIC8qIENo
ZWNrIGZvciBJbnRlbCBkZXZpY2VzIChpOTE1L1hlKSAqLw0KPiArICAgICBpZiAoaXNfaW50ZWxf
ZGV2aWNlKGRybV9taW5vcikpDQo+ICsgICAgICAgICAgICAgcmV0dXJuIGdldF9pbnRlbF9mcmVx
dWVuY2llcyhkcm1fbWlub3IpOw0KPiArDQo+ICsgICAgIHJldHVybiBOVUxMOw0KPiArfQ0KPiAr
DQo+ICBzdGF0aWMgaW50DQo+ICBwcmludF9jbGllbnRfaGVhZGVyKHN0cnVjdCBpZ3RfZHJtX2Ns
aWVudCAqYywgaW50IGxpbmVzLCBpbnQgY29uX3csIGludCBjb25faCwNCj4gICAgICAgICAgICAg
ICAgICAgIGludCAqZW5naW5lX3cpDQo+ICB7DQo+ICAgICAgICBpbnQgcmV0LCBsZW47DQo+ICsg
ICAgIGNoYXIgKmZyZXFfaW5mbyA9IE5VTEw7DQo+DQo+ICAgICAgICBpZiAobGluZXMrKyA+PSBj
b25faCkNCj4gICAgICAgICAgICAgICAgcmV0dXJuIGxpbmVzOw0KPg0KPiAgICAgICAgcHJpbnRm
KEFOU0lfSEVBREVSKTsNCj4gLSAgICAgcmV0ID0gcHJpbnRmKCJEUk0gbWlub3IgJXUiLCBjLT5k
cm1fbWlub3IpOw0KPiArDQo+ICsgICAgIC8qIEdldCBmcmVxdWVuY3kgaW5mb3JtYXRpb24gKi8N
Cj4gKyAgICAgZnJlcV9pbmZvID0gZ2V0X2ZyZXF1ZW5jaWVzKGMtPmRybV9taW5vcik7DQo+ICsN
Cj4gKyAgICAgaWYgKGZyZXFfaW5mbykgew0KPiArICAgICAgICAgICAgIHJldCA9IHByaW50Zigi
RFJNIG1pbm9yICV1ICAgRnJlcXVlbmN5KE1IeikgJXMiLCBjLT5kcm1fbWlub3IsIGZyZXFfaW5m
byk7DQo+ICsgICAgICAgICAgICAgZnJlZShmcmVxX2luZm8pOw0KPiArICAgICB9IGVsc2Ugew0K
PiArICAgICAgICAgICAgIHJldCA9IHByaW50ZigiRFJNIG1pbm9yICV1IiwgYy0+ZHJtX21pbm9y
KTsNCj4gKyAgICAgfQ0KPiArDQo+ICAgICAgICBuX3NwYWNlcyhjb25fdyAtIHJldCk7DQo+DQo+
ICAgICAgICBpZiAobGluZXMrKyA+PSBjb25faCkNCj4gLS0NCj4gMi40My4wDQo+DQo=

--_000_CH0PR11MB5427886B12F863B8D4275B159865ACH0PR11MB5427namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.intel.com&gt;<b=
r>
<b>Sent:</b>&nbsp;Thursday, February 5, 2026 11:24 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;; Konieczny, Ka=
mil &lt;kamil.konieczny@intel.com&gt;; Kempczynski, Zbigniew &lt;zbigniew.k=
empczynski@intel.com&gt;; Purkait, Soham &lt;soham.purkait@intel.com&gt;<br=
>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v7] tools/gputop: Add GPU frequencies=
 to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Hi S,<br>
On 2026-02-05 at 16:42:11 +0530, S Sebinraj wrote:<br>
&gt; Enhance gputop to display GPU frequency information (current/actual)<b=
r>
&gt; for each GT in the client header line alongside the DRM minor number.<=
br>
&gt;<br>
&gt; Key changes:<br>
&gt; - Add get_gt_frequencies() function to read GT frequency values<br>
&gt; - Support both i915 and Xe drivers using appropriate sysfs paths<br>
&gt; - Display format: &quot;DRM minor X&nbsp; Freq(cur/act) GT0-freq/freq =
GT1-freq/freq&quot;<br>
&gt; - Driver-agnostic sysfs access<br>
&gt;<br>
&gt; The frequency information helps users monitor GPU performance states<b=
r>
&gt; in real-time while observing client workload utilization.<br>
&gt;<br>
&gt; Example output:<br>
&gt;&nbsp;&nbsp; DRM minor 0&nbsp;&nbsp; Frequency GT0-1800/1800 GT1-400/40=
0<br>
&gt;&nbsp;&nbsp; DRM minor 128&nbsp;&nbsp; Frequency GT0-400/400 GT1-400/40=
0<br>
&gt;<br>
&gt; v2:<br>
&gt; - To use macro to suffix strings<br>
&gt; - To skip failure loops<br>
&gt;<br>
&gt; v3:<br>
&gt; - To keep error logs<br>
&gt;<br>
&gt; v4:<br>
&gt; - Removed RFC from Subject<br>
&gt;<br>
&gt; v5:<br>
&gt; - Fallback to normal sysfs read instead of using lib api's<br>
&gt;&nbsp;&nbsp; as it increased the dependencies highly<br>
&gt;<br>
&gt; v6:<br>
&gt; - Remove driver specific logging<br>
&gt; - Change function name to this regard<br>
&gt;<br>
&gt; v7:<br>
&gt; - Move intel specific code away from generic funcs<br>
&gt; - Add func to check which driver is bound<br>
&gt; - Space correction in strings<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; tools/gputop.c | 189 +++++++++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;&nbsp; 1 file changed, 187 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tools/gputop.c b/tools/gputop.c<br>
&gt; index f577a1750..216b030be 100644<br>
&gt; --- a/tools/gputop.c<br>
&gt; +++ b/tools/gputop.c<br>
&gt; @@ -30,13 +30,20 @@<br>
&gt;&nbsp; #include &quot;igt_drm_clients.h&quot;<br>
&gt;&nbsp; #include &quot;igt_drm_fdinfo.h&quot;<br>
&gt;&nbsp; #include &quot;igt_profiling.h&quot;<br>
&gt; -#include &quot;drmtest.h&quot;<br>
&gt;&nbsp;<br>
&gt;&nbsp; enum utilization_type {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_ENGINE_TIME=
,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UTILIZATION_TYPE_TOTAL_CYCLE=
S,<br>
&gt;&nbsp; };<br>
&gt;&nbsp;<br>
&gt; +enum intel_driver_type {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_DRIVER_I915,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_DRIVER_XE,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; INTEL_DRIVER_UNKNOWN,<br>
&gt; +};<br>
&gt; +<br>
&gt; +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))<br>
&gt; +<br>
&gt;&nbsp; static const char *bars[] =3D { &quot; &quot;, &quot;=A2j&quot;,=
 &quot;=A2k&quot;, &quot;=A2l&quot;, &quot;=A2m&quot;, &quot;=A2n&quot;, &q=
uot;=A2o&quot;, &quot;=A2p&quot;, &quot;=A2i&quot; };<br>
&gt;&nbsp;<br>
&gt;&nbsp; #define ANSI_HEADER &quot;\033[7m&quot;<br>
&gt; @@ -76,17 +83,195 @@ static void print_percentage_bar(double percent, =
int max_len)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; putchar('|');<br>
&gt;&nbsp; }<br>
&gt;&nbsp;<br>
&gt; +/* Detect which driver is bound to the device */<br>
&gt; +static bool is_driver(unsigned int drm_minor, const char *driver_name=
)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char link[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *driver;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ssize_t len;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read the driver symlink */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &quot;/sys/clas=
s/drm/card%u/device/driver&quot;, drm_minor);<br>
<br>
&gt;&gt;For drm_minor &gt;=3D 128 you should use 'renderD', not 'card'.<br>
See also note below.<br>
<br>
Okay I'll add a function as per the comments</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; len =3D readlink(path, link, sizeof(link) - =
1);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (len =3D=3D -1)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; link[len] =3D '\0';<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Extract driver name from path (e.g., &quo=
t;bus/pci/drivers/i915&quot; -&gt; &quot;i915&quot;) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver =3D strrchr(link, '/');<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!driver)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver++; /* Skip the '/' */<br>
<br>
&gt;&gt; Add newline.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Okay got it.<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return strcmp(driver, driver_name) =3D=3D 0;=
<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Detect if this is an Intel device (i915 or Xe) */<br>
&gt; +static bool is_intel_device(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return is_driver(drm_minor, &quot;i915&quot;=
) || is_driver(drm_minor, &quot;xe&quot;);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Detect Intel driver variant */<br>
&gt; +static enum intel_driver_type detect_intel_driver(unsigned int drm_mi=
nor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (is_driver(drm_minor, &quot;xe&quot;))<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return INTEL_DRIVER_XE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else if (is_driver(drm_minor, &quot;i915&quo=
t;))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return INTEL_DRIVER_I915;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return INTEL_DRIVER_UNKNOWN;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Count the number of GTs by checking which gt* directories exist */=
<br>
&gt; +static int get_num_gts(unsigned int drm_minor, enum intel_driver_type=
 driver_type)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct stat st;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt_count =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check for gt0, gt1, gt2, etc. up to a rea=
sonable maximum */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (int i =3D 0; i &lt; 8; i++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (driver_type =3D=3D INTEL_DRIVER_XE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For Xe, all GTs are =
under tile0 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;/sys/class/drm/card%u/device/tile0/gt%d&quot;,<br>
<br>
Here you again use 'card', maybe create new function for this name<br>
and use it instead here and in other places? For example:<br>
<br>
char *get_drm_name(int minor)<br>
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return minor &gt;=3D 128 ? &quot=
;renderD&quot; : &quot;card&quot;;<br>
}<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(path), &qu=
ot;/sys/class/drm/%s%u/device/tile0/gt%d&quot;,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; get_drm_name(drm_minor), ....<br>
<br>
or even more, like:<br>
const char *get_sysfs_prefix(int minor)<br>
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return minor &gt;=3D 128 ? &quot=
;/sys/class/drm/renderD&quot; :<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card&quot;;<br>
}<br>
<br>
Rest of code looks good.<br>
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Regards,<br>
Kamil<br>
<br>
&gt;&gt;&gt;&gt;</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Sure, I'll correct=
 the code and send a updated version.<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, i);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else /* i915 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(path, sizeof(p=
ath), &quot;/sys/class/drm/card%u/gt/gt%d&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, i);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (stat(path, &amp;st) =3D=3D 0 &amp;&amp; S_ISDIR(st.st_mode))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt_count++;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;&nbsp; /* Assume =
GTs are numbered sequentially */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return gt_count &gt; 0 ? gt_count : 1;&nbsp;=
 /* At least 1 GT should exist */<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Read a single frequency value from sysfs */<br>
&gt; +static bool read_freq_value(const char *path, unsigned int *freq)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; FILE *fp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char buf[32];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool success =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; fp =3D fopen(path, &quot;r&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (fp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fgets(buf, sizeof(buf), fp)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *freq =3D atoi(buf);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; success =3D true;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fclose(fp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return success;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Intel-specific frequency reading for i915/Xe drivers */<br>
&gt; +static char *get_intel_frequencies(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char freq_str[512] =3D &quot;&quot;;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char gt_info[64];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_gts;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int gt;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; enum intel_driver_type driver_type;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bool first =3D true;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Detect Intel driver variant */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; driver_type =3D detect_intel_driver(drm_mino=
r);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (driver_type =3D=3D INTEL_DRIVER_UNKNOWN)=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get GT count from sysfs */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; num_gts =3D get_num_gts(drm_minor, driver_ty=
pe);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_gts &lt;=3D 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return NULL;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Read frequencies for each GT */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; for (gt =3D 0; gt &lt; num_gts; gt++) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; char freq_path[256];<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; unsigned int cur_freq =3D 0, act_freq =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bool has_cur =3D false, has_act =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read current/requested frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (driver_type =3D=3D INTEL_DRIVER_XE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/device/tile0/gt%=
d/freq0/cur_freq&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else /* i915 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/gt/gt%d/rps_cur_=
freq_mhz&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; has_cur =3D read_freq_value(freq_path, &amp;cur_freq);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Read actual frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (driver_type =3D=3D INTEL_DRIVER_XE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/device/tile0/gt%=
d/freq0/act_freq&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else /* i915 */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; snprintf(freq_path, siz=
eof(freq_path),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;/sys/class/drm/card%u/gt/gt%d/rps_act_=
freq_mhz&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_minor, gt);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; has_act =3D read_freq_value(freq_path, &amp;act_freq);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Skip this GT if we couldn't read any frequency */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!has_cur &amp;&amp; !has_act)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Append to frequency string */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!first)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcat(freq_str, &quot;=
 &quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; first =3D false;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; snprintf(gt_info, sizeof(gt_info), &quot;GT%d-%u/%u&quot;, gt, cur_freq=
, act_freq);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; strcat(freq_str, gt_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (strlen(freq_str) &gt; 0)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return strdup(freq_str);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/* Generic wrapper for frequency reading - dispatches to vendor-speci=
fic implementations */<br>
&gt; +static char *get_frequencies(unsigned int drm_minor)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Check for Intel devices (i915/Xe) */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (is_intel_device(drm_minor))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return get_intel_frequencies(drm_minor);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt;&nbsp; static int<br>
&gt;&nbsp; print_client_header(struct igt_drm_client *c, int lines, int con=
_w, int con_h,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *engine_w)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, len;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; char *freq_info =3D NULL;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return lines;<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf(ANSI_HEADER);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ret =3D printf(&quot;DRM minor %u&quot;, c-&=
gt;drm_minor);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Get frequency information */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; freq_info =3D get_frequencies(c-&gt;drm_mino=
r);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (freq_info) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&nbsp;&nbsp; Frequency(MHz) %s&quot;, =
c-&gt;drm_minor, freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; free(freq_info);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D printf(&quot;DRM minor %u&quot;, c-&gt;drm_minor);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n_spaces(con_w - ret);<br>
&gt;&nbsp;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lines++ &gt;=3D con_h)<b=
r>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</div>
</body>
</html>

--_000_CH0PR11MB5427886B12F863B8D4275B159865ACH0PR11MB5427namp_--
