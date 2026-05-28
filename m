Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316B6CD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 11:37:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A5D10F05F;
	Thu, 28 May 2026 11:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bo4+mnAB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6650910F05B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 May 2026 11:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779968243; x=1811504243;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=fEMFM8OOGh+z9hIdCKhjSpFVCzrbXXtVIWr+0eMb2uE=;
 b=Bo4+mnABbxhFaDFFwswK8HBNPqo5XRBTctHqnsL3B7pxCDHGhaUtO79q
 p5zkV7RDoZu+vWV/JG70oMh1WlUWTJZGfZ2p5aVgi5SaS8YCVlU1i60AJ
 0UCB1u5pTiczYT+I2DjeqHSHU1GYdnu7e5djF2iv9izqPTR3TKAClnkf0
 dTalOiZBveMkV/+1GZGClrSMxCWbTnopYcSYnTP34kjGtgpIpiIws3VWK
 n9YkBcq4xTvkyftf4KBVDFBUTe0QdwXiOMUwtjtjQRjp7AEgZ8hmy9Y8O
 JwmFbY4mj5sFHoveGQMo0OUJ1Q5bOu77PItZek26ahyq3GDHpvKUxOS4K A==;
X-CSE-ConnectionGUID: zdnj341UTfaoXZbZevDHhA==
X-CSE-MsgGUID: 3QWs/3MWQI6F1kJCG8pcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="103481417"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="103481417"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 04:37:22 -0700
X-CSE-ConnectionGUID: MiEwGJjgQAaq1XlD+MDQjg==
X-CSE-MsgGUID: V9+nJbmbRoqtFhNmYic91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="247608899"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 04:37:22 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 04:37:21 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 04:37:21 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 04:37:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzBDaKXUUeQOLE0rNrupnYtSXZkOOnz8GTpyOZeGf7O9a0K6f+2adZB9mZggdkT5Uh9zZ3lSAxz06t3KkI2KilBrUCFEBxns1FaWr4EYS45bmW5CFQBvfAcFf9NoLVlpT1k6IvklBAI0e08U6iadUgr5/f9D3SYYbfX+ZLbT8eGpxu0LgsediBeOQanJj9PGA4+T0UCGG7Lc04RF2fPs25AjlgNJZbtqEWIDi2N1PFuGu3bSIwMqSbeLA7LCF+8SINiNOjlUZEjf+k1SXOfvvoindu+2mQ8AKzE6Jf+gpxE2ItwM6iLWo+nF/bdZSTMA4ZQeyUAimWdAvSDSGyBdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fEMFM8OOGh+z9hIdCKhjSpFVCzrbXXtVIWr+0eMb2uE=;
 b=i4+fZTvbcsvE5l5rR56z4bw6JbtZ8ALlneg5pIcPBhVLmXX0drm4BvS0iUqMnDikXCtPIvtrji4E5ISnI/IaurquvT5bH4hCUOPE4s6KkzQtUHuOsIQ8OMt7drQUU+ggyHDxj9PnMfXUYfRmhuQCA7oRT/Yx2F4U7HQf/0oS8kmA4rNRUOM8XPdr2SWWWEAE6GnOO2bmxtr2oqx2B+Jkx39tgsAFuDocqs5WdfuNsj+4yMz3AFuxlpicVM/Se5oMJ3bIg94ClUPx+Bx/Wikzzffy2kQBjIMOd47KIZNfnwzY9HQqT7FVrM1DFknmtGB1PPUDWCEQaqfU474we6IezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by CH3PR11MB7915.namprd11.prod.outlook.com
 (2603:10b6:610:12f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.14; Thu, 28 May
 2026 11:37:18 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::88d6:ba41:128b:4081%6]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 11:37:18 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 9/9] tests/intel/kms_flip_scaled_crc: add 4tiled
 p010 to 4tiled p016 test
Thread-Topic: [PATCH i-g-t 9/9] tests/intel/kms_flip_scaled_crc: add 4tiled
 p010 to 4tiled p016 test
Thread-Index: AQHc7R+hG/nkzxLGP0u+2V94DpFvsLYjUk4g
Date: Thu, 28 May 2026 11:37:18 +0000
Message-ID: <DS4PPF69154114FD5FDC844293B5B23D159EF092@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
 <20260526144343.2531299-10-juhapekka.heikkila@gmail.com>
In-Reply-To: <20260526144343.2531299-10-juhapekka.heikkila@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|CH3PR11MB7915:EE_
x-ms-office365-filtering-correlation-id: 3e8abc3a-0aa0-4eda-e901-08debcad7982
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|22082099003|18002099003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 2Tx62/kiHOgkNBnut/5RzjczRdutSFD7GuK3qKMQ5NOCjTrccU/RYkT9rg3IlBpGTqY307yuWz+quWXS+kfyIvucgVKPzTB6w4BwLFbyooASh7DKfn5s6uV0WQz3D3DCfh0M8kTiNx3av5zrz4gTS1rH7ynEr80LtqjiaPgkihjWkSignymuNP8WmoDp0ohWgJiHlfYH2sMELJUEBwrnECgac6vXp/VZ0LvNfdeOYl1m3lCg11TfvANgu+5+9DEZrZdiI1YJGseLdK9Uhe5KhUNQWWk8JVu2wN2m8GxeV0wwyBxoVWW5wOmjL+sEXdGY2bNXZCQFxlXoMX4SAmOJ4mDnAQ5CpNpExPXCjBOwgUr46+0qw0ukPoNBbSclfEkDb8dZasioVKa5QeGZt+O8P9iVrparuLps+LrJm99Xu9pwoBqyaGcXAHFxPofhdDAYNjqRt0FaAT2+vW1OYMXl8qKiUVloNN5Pp2khFcc1zpkf0ndvWZzICDdPIVmcid8SM55s+c/07vXBigasz6wGkhcgvE69URi1dTvpzlTxRJiV+gUaf1L6K5goVBKtRyGYluqq7LPCo8Rq0jecuHwrEkbuPSG6nEc7i1cqXj2NB6tddYchH4zw0JD7R2fBujrOz6NrGbSblTvLcKunFYfUu87IEEaWbficB70dcIqy4IiKVmGEoRCyPglPz2z2QlNcCfU0Y+/Anjg3Ek0cDjlUJjvrwNHfV9wWCNheRRdAF0CcwUAr1e1IrYnl3zhfm0nm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTgzbmIrOG00MlYzV1lJYmFpN3BjbXNhUXFzMU42RWw1ajhNcGVDZWtQTjNY?=
 =?utf-8?B?bUFGVGVrbVJqQytFS1lrdFQyc1VMaHNFMmtPMGUyaDJsMFVVbk5pOE1Qdkh1?=
 =?utf-8?B?aTl4YlRsMWRtT1RENnA2T3JBMlFkSWxVbzBic3RVRHh0ZVN1WDhuN3dwb1I1?=
 =?utf-8?B?THFMQUhHR2VvVGJJSnZPdEFqY1V5Q0h6QnNvNVlwdG4zbitBYVhLdldmeVI4?=
 =?utf-8?B?QnJsUjNkLzhqMkZJNk9Yc21FMVFlcGNKakxuOG1SakFhSlV6MGx2anF5b3pU?=
 =?utf-8?B?NVMvdFh1SjB1ZzVHSzJZQ3hCMFB3WW01WFB4a21qeXhyNWptaDVTNXdNS2lv?=
 =?utf-8?B?YnBOaGZvOXZHdjhnV29HaERLZVpGaTlqdzBiOHdDOXBUcEJHaVkzRFFxdVFx?=
 =?utf-8?B?QmY2c2N6dWppWDN4bXdva0ltNkhwemhSVTI5SU9vYmxjQ1dneDBrbDJ6MCtD?=
 =?utf-8?B?ZkhWUUh4OGhnRXNMVVFPNGFaM1VUWkdyVlJpUmd5ZWRVeUdYTzV2aEpjQ2J3?=
 =?utf-8?B?enV3NWRaNGRvZkZWb0s0cU5uSFFRcm1wM0tCMHFQenNZbG91Q0dRNStmczdJ?=
 =?utf-8?B?czdTYWxtV29GNWdxWkxqT2tBYTFlS3h1L1dhMW5HRElDM2xsUTdWcXlzRXU5?=
 =?utf-8?B?UEhhTFhPTkhUNnk1SW1qeXcyaHlsRXhkQ3d0RTUxdWsxdUVmYlFSdXB6bVI4?=
 =?utf-8?B?QzBkdFErVjNKTUtrK3J0T0ErSU1mWllqbUFUN0hjM3hjRytTcm1ibmJGN0lV?=
 =?utf-8?B?N1ZwY0ZKTWZuMFNTNXl1bHl6QU5pQVpiVjNsMk5zVHF1Z0Jkd2hFaWxMMStj?=
 =?utf-8?B?bUhuaXJYcHUvV1VlY3BBM0tGOWorMXB1c0N4b3RqVm5mUzZMckIvR2Noc2Fr?=
 =?utf-8?B?UDZzTGM5ZWVTSjFyVnJRVnhRQUxMdU5nS1RKeDQwNEVwWDdoeGlLM2Z4cTdh?=
 =?utf-8?B?L2xIajJrRHovb1RBT2RNeThHcmVQQ2N5M21jL1o2eWJSeWZQeWNLYlJ1ZTVS?=
 =?utf-8?B?d3I4TXVLdXkraS9ocEVBRXh3djNoaCtjYnpxc3lKakZ2V3RIOXRCbG82dDBB?=
 =?utf-8?B?V1RMUlNSV3Y1dElkU2NYcXp2eWZTN213WkR3bDErYmpFTmRkcW5Sa2laUHlX?=
 =?utf-8?B?UDJDRm11aGlkY3d5Uno5alE2TDBoUDhXY05OZFh0eEgzL2NrbXE2RDYwZk5U?=
 =?utf-8?B?alJ5am8wWG9vUDZGdGVSVjVRc3ZsSjFwRmRrZ1NZSU1hYUFnK3ZtY1lrWFRj?=
 =?utf-8?B?eGc3UUFBS3UvWTRzcGJZVm15TDVGaXkrK3dFQnUycXpvVVk0Mm1IbFBOVXdN?=
 =?utf-8?B?dmNFTlRHeWtIUTBNOFYwTFJ3NFFPM0VINktXUVhKYXV5OW9pR3ZkTVp6YVNB?=
 =?utf-8?B?cjR3RHdaU3JmSkRMaGpISXhBNGlVTlEwOGFucGlROEdUQkM2a3M5YjFGdmlK?=
 =?utf-8?B?d3dQWG1ITDBwWHJHQjU1cHhCYWdGTnpIM3F3TlluWlViTCsvVGpkNTlXdUJ0?=
 =?utf-8?B?NjNKNThDby93bkY1QWdNQlNxUmc2WFZsUXhEMHBtdGdhdU95eTBVbXA2b2R6?=
 =?utf-8?B?ODcwQjN3Tzc5dmpLRWdjcmc4ZlVVOFFySW5oei8xYzRQQ0lrSldzQy9hZW5a?=
 =?utf-8?B?QVkrV1ZBRlNOQng5R1hUUWV1Y29LTTE2dkUzMmdlWUlSdE9jeWpDaUVBRzFl?=
 =?utf-8?B?bmZrK2dUdnhwV3lKUGFtNFJvSW1UWjJSRFprcWhFNVRIbnB1MXRCM0lhbk13?=
 =?utf-8?B?c0xkY1B4SHlpVnJ2S2FZUURNalBLMjl2bzNQekRNUEFNOTJidUN6ZENJYmQv?=
 =?utf-8?B?UVFmeHpMS3U4NjQ4dHN5YUhVSHdDZDdINkppY2pvODF1MVhERmJJNDU1UGpo?=
 =?utf-8?B?YzArMGNmSFkxN0tKQktrVHU5bDEvWTJCb1R1eG1WSWtIcDFiQkt0ajVnTUI2?=
 =?utf-8?B?TnNzcmNzQkNTbEJnbWFzTEVmQTZtc3JraXdVQ1dHZ1NoS0ozK0xrNS91WlNp?=
 =?utf-8?B?U2NaSXlIUWF2b3YzNkpXRTZYdlRSVkdqblA3T1V0V1pkc0tuMVFWT2xyeGpD?=
 =?utf-8?B?R1lvdzdPTXQ2dmFvTXI5ME50U1JuZ1NHUllWb0FkNzNRUE16dkVoa0ZvdFNo?=
 =?utf-8?B?NGhZVzJ1dVBVZmpuaXNaMXg2RnNtVjRHbFJ2SThTcjBpZmtGeXJLMWtESU1H?=
 =?utf-8?B?ZFp0cmlaM3BhS0V6ak5oSEt5dHR1ajdXY014cGJoU0Rzb1ZraWs3eWR0eTVJ?=
 =?utf-8?B?cHVTbFNkdERsSjBVYmRBcU1hMlJCN1VHWWFnZm9sQjZraU5CVi82VXpTYWRp?=
 =?utf-8?B?NlB4NHgxaUxNdkJrTVNYN0h1THpSN3hvWUhybktHWUpVYlU1TGlPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TR9KukP4sZBCleRLpTzO5lHzCbsrmxJruJ8W5MWqfhkxUjFAjR5dQ+qDQZFb8ipAiRBwGpTAR3UNvW+0uaZ3QT7OzEHGi0RJy8Z+3w7MJaGXTuMk3yJJ+CYLCCdWGmwS1wlCXCiPxwhgz+JolDc63PkLEvjzeti68h6a6VLjv0Jzq64xRms5HqUHvPmBsjsHH3Ss09bB/9m2c1ITM1JqF1w5jUlh1WN13ZDPGE/kKLjI0aQdqTzpzzKiU9XKkU1ZziTOht+ANLMWXW4RRQGKX3ldJxMTLSXyvnSyxhj/TItyY/BIicyoZSCSzBxL0U6uoviGVXNPmBPZbbZrQitA0w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8abc3a-0aa0-4eda-e901-08debcad7982
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2026 11:37:18.6594 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gSNDpInIRenigDW6nGkF4b2DsBpZWh4GuEKdeR0+MVYCW+j2fkNsE40qnRnIIRd8AUTUqOiPCibQ9ZZnLMKK0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7915
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
YS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCA5LzldIHRlc3Rz
L2ludGVsL2ttc19mbGlwX3NjYWxlZF9jcmM6IGFkZCA0dGlsZWQgcDAxMCB0byA0dGlsZWQgcDAx
NiB0ZXN0DQo+IA0KPiBhZGQgdGVzdCBmb3IgZmxpcHBpbmcgYmV0d2VlbiBwMHh4IGZvcm1hdHMs
IHRoaXMgaXMgdGFyZ2V0ZWQgdG8gdXRpbGl6ZSB2ZWJveCBlbmdpbmUgd2hpbGUgYWxzbyBkb2lu
ZyBmbGlwcGluZyB0ZXN0Lg0KPiANCg0KUmV2aWV3ZWQtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmth
aG9sYUBpbnRlbC5jb20+DQoNCj4gU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNf
ZmxpcF9zY2FsZWRfY3JjLmMgfCAxMyArKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MTMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19mbGlw
X3NjYWxlZF9jcmMuYyBiL3Rlc3RzL2ludGVsL2ttc19mbGlwX3NjYWxlZF9jcmMuYw0KPiBpbmRl
eCA5NDRkZmVlZGUuLmEyNTc4MWZiMiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX2Zs
aXBfc2NhbGVkX2NyYy5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL2ttc19mbGlwX3NjYWxlZF9jcmMu
Yw0KPiBAQCAtMTM1LDYgKzEzNSw5IEBADQo+ICAgKg0KPiAgICogU1VCVEVTVDogZmxpcC1QMDE2
LWxpbmVhci10by1QMDE2LWxpbmVhci1yZWZsZWN0LXgNCj4gICAqIERlc2NyaXB0aW9uOiBGbGlw
IGZyb20gUDAxNiBub24gc2NhbGVkIGZiIHRvIFAwMTYgbm9uIHNjYWxlZCB4IG1pcnJvcmVkIGZi
DQo+ICsgKg0KPiArICogU1VCVEVTVDogZmxpcC1QMDEwLTR0aWxlLXRvLVAwMTYtNHRpbGUNCj4g
KyAqIERlc2NyaXB0aW9uOiBGbGlwIGZyb20gUDAxMCBub24gc2NhbGVkIGZiIHRvIFAwMTYgbm9u
IHNjYWxlZA0KPiAgICovDQo+IA0KPiAgSUdUX1RFU1RfREVTQ1JJUFRJT04oIlRlc3QgZmxpcHBp
bmcgYmV0d2VlbiBzY2FsZWQvbm9uc2NhbGVkIGZyYW1lYnVmZmVycyIpOyBAQCAtNjY0LDYgKzY2
NywxNiBAQCBjb25zdCBzdHJ1Y3Qgew0KPiAgCQlJR1RfUk9UQVRJT05fMCwNCj4gIAkJSUdUX1JP
VEFUSU9OXzAgfCBJR1RfUkVGTEVDVF9YLA0KPiAgCX0sDQo+ICsJew0KPiArCQkiZmxpcC1QMDEw
LTR0aWxlLXRvLVAwMTYtNHRpbGUiLA0KPiArCQkiRmxpcCBmcm9tIFAwMTAgbm9uIHNjYWxlZCBm
YiB0byBQMDE2IG5vbiBzY2FsZWQiLA0KPiArCQlJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRCwgRFJN
X0ZPUk1BVF9QMDEwLA0KPiArCQlJOTE1X0ZPUk1BVF9NT0RfNF9USUxFRCwgRFJNX0ZPUk1BVF9Q
MDE2LA0KPiArCQkxLjAsDQo+ICsJCTEuMCwNCj4gKwkJSUdUX1JPVEFUSU9OXzAsDQo+ICsJCUlH
VF9ST1RBVElPTl8wLA0KPiArCX0sDQo+ICB9Ow0KPiANCj4gIHN0YXRpYyB2b2lkIHNldHVwX2Zi
KGRhdGFfdCAqZGF0YSwgc3RydWN0IGlndF9mYiAqbmV3ZmIsIHVpbnQzMl90IHdpZHRoLA0KPiAt
LQ0KPiAyLjQzLjANCg0K
