Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA32DCCD19A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 05:57:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4769A10E094;
	Tue, 18 Nov 2025 05:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iSdGPn2f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3A10E094
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 05:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763445435; x=1794981435;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=5kMT2VKO9SpScbJBpxv0RxB9UXGULVNvIIzL4CWeJXk=;
 b=iSdGPn2fi9KddHB5zHDHQ6z6dSdG4rSZ52jD+tsoAHPbst+KRKcPwRR/
 +CncfB/uaFQJQZvWuTeol2w7K6R/mEb1wm0v7srtlaPn4Q8EriDeJ2Y+W
 f1zUAp0SYy/NDfts+4Wj5P+n8l2HuevN1zUZpdJjNf/OaezQn+vFrPR17
 TNkvIz4Lnch8boEwdQ1X1uLRMLaAyZnT25yVOE0oxynMOy3hvidvSb900
 3Bkva/U2+vqkOCnE9nlNSjI8tZUZ3wyNgBRFDCCrkzCCQovUJiY94yEc3
 V5AZi7sP7zpOZ92jEWho9ROb69qjqR2o/anaQqY+qunHH0Qma0IPStMPx g==;
X-CSE-ConnectionGUID: McD84omTS12+HSmJIYI9ng==
X-CSE-MsgGUID: WBYfvgYXQjarCxt1A7zNkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65613345"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208,217";a="65613345"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:57:14 -0800
X-CSE-ConnectionGUID: oR6ezKluQGSqmiI52uZG3g==
X-CSE-MsgGUID: m/QZCC3vTT24pJX6B+KfdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
 d="scan'208,217";a="191105819"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:57:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:57:13 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 21:57:13 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.57) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:57:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puu5ddFgzLRetv+3Hzin8/KP0tq9KftIQf2WrCO2KREN8X0PkYyM3avGq+kgjJn1NqTHrsvGjJ0jIIs4K5/5klT0wqur+x1uFvvELKYcyicJ7/+qg16tbiTDUMXd17cZg/uNdeeAT71v1ypvY9kDZjNCfUeX8sXfGcDXIdX9P6/fhwhvtpGm8K5HFv7n9c/ehdJyu+8I7RZjwDYkQebr9MrZnAVwLYCtcwfWDtwXSoxnrMIeCGK6ym2+GX2C0pTZE23UJFIUNKDvhd/dJS3xYQyO8UGi2hZ3hf3zCNIni3Nlql5NvTH7xv5ToIWXdkzMjbILKj1Z0f/yUtbP9stdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p0rYTSHbnF2yv64ubG7dd8E8HezKLClfc1N6WHfDZ0=;
 b=GhuQzgzgiKic4+E+BE1JSeFPWngox8E9hB4Q0grmWPpqphkB8vthYydwyZ22GgiVB39ZH473vB2T7sSvGoEPPpPBcCinoSiyileY/8vTfnMrMQNVR799bn3G6we+RFVOwVS5UysVG/VrO+HFIwV6/bFsJ6N8QmbGkpkmuPjVMCJHVS+hU/Kf7xV5D8o9DkpKS3XJZ9xkU26ikzzyKKZMrPagwNet1I6ka3vksLE7lFdqFA/O5oLrBmnzY7xMtKNlZ0frkdF+nJleKJfqZTGK7fn9aovPn7VXQzvu7OcE3Jy4jd8hc4EzsERLTsf/jdv/eGg4jXk1uJMGN2flSXkZlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DS0PR11MB7999.namprd11.prod.outlook.com (2603:10b6:8:123::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 05:57:11 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 05:57:11 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Thread-Topic: [PATCH i-g-t v2] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Thread-Index: AQHcSJdOIOsYw1k3t0KmwLprP7mnAbTYvxEAgB9NXII=
Date: Tue, 18 Nov 2025 05:57:11 +0000
Message-ID: <CH0PR11MB54272DF9616AA37306FFC67498D6A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251029053141.3619261-1-s.sebinraj@intel.com>
 <gkajd5vcaterajo4c56nszm2qgf74rwkv2ukarzgexytwxzvhk@i4ja3ydlwxil>
In-Reply-To: <gkajd5vcaterajo4c56nszm2qgf74rwkv2ukarzgexytwxzvhk@i4ja3ydlwxil>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DS0PR11MB7999:EE_
x-ms-office365-filtering-correlation-id: 34e16bf4-8e8a-40d6-3bac-08de266750f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700021|8096899003; 
x-microsoft-antispam-message-info: =?koi8-r?Q?bJfwTiOQxtRu/gigUil0koTc9DnvdaYLEDrX9I0wczsBLiV8u38+sZ4e25o164?=
 =?koi8-r?Q?FdK8qdt5NAY4eHy2KYN3JYaRlMgqqDDVDGuwMor4v4/ZWH277ImuQrqiUt+iHS?=
 =?koi8-r?Q?b3cEG/F9fKfn/aP+5HbnlpxbujTTBP8dDv8B5tGtRv6z4LsfobhJx0tbVEs5nM?=
 =?koi8-r?Q?mSgbE34mHvxHzaHhHo0LR7walyF6M1uIZOcNvKd498egMngQB7ndmasi57A7Ut?=
 =?koi8-r?Q?z2mL6lhYh/WoRphZmINDJKV5CfCCnnLYWMY39VPJwCg+1Yc+Lop7cDdLQc34wC?=
 =?koi8-r?Q?5tmebKzezEYt8sJ/nC2SaTOSbxYQFvfejalf0e/27veoyslGp36OFABPFYfPyF?=
 =?koi8-r?Q?Vl0tYu7jncEWePQVww5pTUN6tOlDhtDWs5utFTbva6QUTeIbfbzMwnYk+n2FIP?=
 =?koi8-r?Q?4j5ZzLeltanmppDPnZ/r5sQ7ybsLoFxZfQq5aJ4kqDxftLFiHxvHsaTXs5bQxn?=
 =?koi8-r?Q?CR1h6HW9bc9WGYNTpxtUDaWV3KuEhleEWRGpJczSv7KDXF1bB4x7n/TO0RfCvx?=
 =?koi8-r?Q?4wopACfqCgtMKkXqubg0I5DWfQP6dMszrfDdzmy08HaDPqSuZ/R7XRXvgYF5w9?=
 =?koi8-r?Q?5x6R+tch2z2JaD8yCaoYMVF+jajdlbJnr5G+8mS2GlzMuvAKvfJrYp6sKbY7SO?=
 =?koi8-r?Q?HtsIJuoKYD8B5hrdimPSpxSCrAscTdAivOn8EbxbqXRrpO8DvSRtenrcJr+J8m?=
 =?koi8-r?Q?Mm8E6tIIp4m8QBtveE3x1GgJmsKnz/3BZq8u7xQwHzlkcowee8+Z/HwnNioSNu?=
 =?koi8-r?Q?ILlEsDXygluadkYK3LXbq0rFagOTyBXqk7dt1r03kwSgjLiCub15VBwdpF/lxW?=
 =?koi8-r?Q?UfcqIpSgJKeylSDLWQI5g1TenIzFuLkhMDSdC9X3NNiWQ0VGVYuVJUPR/CmT4c?=
 =?koi8-r?Q?nKkee/a67mLVQ2kufMsHnsoAERAQeVz2HSzN876NUWrlQ2JLs6AxTsPSLi52uT?=
 =?koi8-r?Q?vchIc1DYgw53wG/oE9Z1NkzDz2EWKHUlEIMAshjvMKn1uWrMTtJP9yPhSkrQl/?=
 =?koi8-r?Q?7H4k/76kYp0GALCi76OD+S/0y9gmwQuhqOunHiyjalFWI+XBXYQt01zHcTJF6+?=
 =?koi8-r?Q?Yr9cdZiHqsGp+ES1tn6KNj7avRSnI92qK749IfR5W1saseCvqejWSyCQcwmloa?=
 =?koi8-r?Q?pMyZCLmrIkAq7DTckoPZPeyX2+uMVQLzvz4mq0xfFnsYr4rOaVYGGtSjESvQDq?=
 =?koi8-r?Q?pwcJ1WVFQFu1QAEvNbxz7VSq/0tSQPNNO6Wi9WcMDVDr6dOdebUsqP5TCu9SzO?=
 =?koi8-r?Q?oc2sBNOZm6LnlzvxW/G9iAuQapHPeXBVmNHDzuZxdAQTJyik8WN5Ftmgjm1kUj?=
 =?koi8-r?Q?emvNiWKOdTKFlH0wNTBPs1Ff/Xtx76TQoYjNviSct5Ba84U1+gnN/AmBgn5GeM?=
 =?koi8-r?Q?IyoplKepGILhL/Jzduz1VisAvTcbnRPHVvSLNl0J3fr2bA6RUjiTeoXzqUlT2O?=
 =?koi8-r?Q?N/mZx8wAgapjYT8f0iCquw+tKnu2yVvN9fe8V7h0fCKiMO46?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700021)(8096899003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?cLpu0+n9WMrGPWrZr6Hm3KrgHXlBzGY0Yxc7qcyIcZFsrARSQVHvz9qqKZLOOq?=
 =?koi8-r?Q?bljL96VXLVdzx6TKJ7/r7NhnyREyUviIhw0Q98jmFARjJssfia5fuSLEARaehK?=
 =?koi8-r?Q?wZBqCsmQogdKXTiwW1ZlEnlmQJJ4+8MlWp1bOLRuWTpUJnyG3/nYMCvzks0tQh?=
 =?koi8-r?Q?TPmGYMJtgb2EcegyOFFqXNHESNles5re2SetipNfiDPFEXTktXWry8kHVX5PUA?=
 =?koi8-r?Q?dYTCd37qSY2Dg2RW9/+TcJiw+533hMHLTbanVeh3qh+IOCuftXb1+jX/YyTYqY?=
 =?koi8-r?Q?JRZykfF4f5xuy2tBy8I7cLhjYM2uTTYTlmmA+v5ncvzree8vzrq2Bnxrh3a45G?=
 =?koi8-r?Q?1VGn0IoxCWKVDQdLuI++N0yy1uAEMUiRt9YuV7/nR4FP2Bd8QxcDdQ2yUvVfvw?=
 =?koi8-r?Q?npg1RWzOk6KSZSFjC1pHiIgNJozlgZc5esYBTgjZGLpRf6R/gLtEE4iR9C7b4G?=
 =?koi8-r?Q?EUGS3cD1CZcTddV8y47u8uh4SQkpRIuCMNMKOWZaYq3qeEWvjWDpTutmqMh44C?=
 =?koi8-r?Q?WOOGfWcSdLgoDQaRgCv/12OMZYbIr37Y7SXoptAP/SetLw/nlsl4e/I9cXP+5/?=
 =?koi8-r?Q?mbcML1GCPHuGxMeU0x1T25GOQvJAX0EB/n2nq6fHL8bUAlWBGvuHgqsSN0N9rj?=
 =?koi8-r?Q?EYSzMKsdYo1DOAqCA3uuYqfydYNuNggTGyBXuD0KdfOyBpnRldcq1fJHEauPsA?=
 =?koi8-r?Q?4y2AxBIUfuBvNNch8a5oX4BV4e0eJqSR//IarF16o4ocW4phxEicNFqTsGQ+8I?=
 =?koi8-r?Q?ZijLssETZgJUxODlgHq3weYAe454FIsRvce2pFFDGGfr3sT3NQ8yNNOzv64wKA?=
 =?koi8-r?Q?hlASB0DMZrdOSXLCRX6URe4NZ6RgjF/dn9jK/wvOQtnFuhYl8U/sXwZRL02uke?=
 =?koi8-r?Q?aqlS2uBdLhoqcWsXC+KdCy7cTErM8GCmICtd1NK6E3s6+TsHXLxnn1o3GKu2m7?=
 =?koi8-r?Q?1doWTnNS7ZQn8hX0g8MwnWC4aj5Xtombkmq6srHb5N92+aj3U0/fNj3Vx79LLV?=
 =?koi8-r?Q?iJLMjTNRqu1JoeaxPAwQAY8Z5H9ZcvqLG8XAAWgmeNOiEdDjJprV8L4sgObyoH?=
 =?koi8-r?Q?iV3JzeHBABuspHx4AL9xr2+CEqfQej9+l8SGNB5kEny2K6FXfSfswHZcd02mf4?=
 =?koi8-r?Q?ohepfPgfEfmb9B2PsywyC9z5QEdHAcrssh02zU97aaX5x0yVoGCFFVAC14I1QQ?=
 =?koi8-r?Q?Ke6lEaCRgUNEcBhNlLHtfysC5EaP/HayA90IQrApaHrq1NmqR0USwsz9+OVV9O?=
 =?koi8-r?Q?DWMY890XGke0U+rVfhfE+yI/PNxom/1vD7GMIqbMg4C5L+1B84z26QsudZ0bsN?=
 =?koi8-r?Q?Yf/aMtEJjLmxnHZ9vmcpMtZDRtWDEmVrBD3Jq/k9sb+3Jfq3JiGjQtnYygRa4T?=
 =?koi8-r?Q?2/myTz2+jTDlGdf+f4w1/DqX2vcE4A6mG4PQiFPwuuzRC1VebHSeyPgxMt1+Yr?=
 =?koi8-r?Q?BG4J10Jg2o0Gr2iChiLjKncm1RGIy7wwzfR13f4oemhE7wzxFus+iW3toaOAZk?=
 =?koi8-r?Q?Ibrvu3EPUtO/tBh/8s9VTV0HJRleo=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR11MB54272DF9616AA37306FFC67498D6ACH0PR11MB5427namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e16bf4-8e8a-40d6-3bac-08de266750f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 05:57:11.4384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlAANCySctVXM06AXE6jdKCbpUMjVxBo6xRA3jEWd8FOdyNuyLJnOfIATTXIfUIp4de4G1bvo9pNdKtHwEHStA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7999
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

--_000_CH0PR11MB54272DF9616AA37306FFC67498D6ACH0PR11MB5427namp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable




________________________________
From: Karas, Krzysztof <krzysztof.karas@intel.com>
Sent: Wednesday, October 29, 2025 1:16 PM
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>; Badrappa=
n, Jeevaka <jeevaka.badrappan@intel.com>; Kempczynski, Zbigniew <zbigniew.k=
empczynski@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2] RFC: tools/gputop: Add GPU frequencies to the=
 client headers

> Hi S Sebinraj,
> It is usually good to wait a bit after getting review comments,
> so people may discuss or respond to how you interpret their
> suggestions. Since you sent v2 already, I'll continue here,
> because I feel like some clarification is needed to my comments
> to v1:

=81> +             fp =3D fopen(freq_path, "r");
=81> +             if (fp) {
=81> +                     if (fgets(freq_buf, sizeof(freq_buf), fp))
=81> +                             cur_freq =3D atoi(freq_buf);
=81> +                     fclose(fp);
=81> +             } else {
=81> +                     fprintf(stderr, "Failed to open %s\n", freq_path=
);
=81> I think failures could skip this iteration of the loop,
   unless you are adamant on writing empty strings.
=81> You could also write ERR or N/A to the cur_freq/act_freq as
   direct notification to the user that something went wrong.

> I wanted to convey that these "else" blocks are an error path,
> which, if ever executed, would mean we'd be printing incomplete
> information about frequency. I thought that instead of doing
> that we could wait for another call to the function reading the
> data from opened files, so that we leave the most recent (albeit
> outdated by one cycle) frequency printed on screen (with your
> change the fields for which fopen() failed would be emptied).

> I believe the error prints were useful and should have stayed.

Okay got it, I'll bring back the prints as it is a way of conveying an erro=
r to
the user. But for this comment from you
"so that we leave the most recent (albeit outdated by one cycle) frequency =
printed on screen" ,
I think of skipping the empty frequency each time there is a failure,
so that only the last successful one remains on screen, rather than a empty=
 one.

I'll share a v3 with the same, Please have a look at it (v3) once I share i=
t and if you think
that's not the correct way, I'll change accordingly.

With Regards,
S Sebinraj

> Enhance gputop to display GPU frequency information (current/actual)
> for each GT in the client header line alongside the DRM minor number.
>
> Key changes:
> - Add get_gt_frequencies() function to read GT frequency values
> - Support both i915 and Xe drivers using appropriate sysfs paths
> - Display format: "DRM minor X  Freq(cur/act) GT0-freq/freq GT1-freq/freq=
"
> - Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for
>   driver-agnostic sysfs access
>
> The frequency information helps users monitor GPU performance states
> in real-time while observing client workload utilization.
>
> Example output:
>   DRM minor 0          Freq(cur/act) GT0-1800/1800 GT1-400/400
>   DRM minor 128        Freq(cur/act) GT0-400/400 GT1-400/400
>
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>

[...]

> +
> +             fp =3D fopen(freq_path, "r");
> +             if (fp) {
> +                     if (fgets(freq_buf, sizeof(freq_buf), fp))
> +                             cur_freq =3D atoi(freq_buf);
> +                     fclose(fp);
> +             }
> As I mentioned above, these error paths were useful in letting
> users know that something went wrong.

>[...]

>--
>Best Regards,
>Krzysztof

--_000_CH0PR11MB54272DF9616AA37306FFC67498D6ACH0PR11MB5427namp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
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
<b>From:</b>&nbsp;Karas, Krzysztof &lt;krzysztof.karas@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Wednesday, October 29, 2025 1:16 PM<br>
<b>To:</b>&nbsp;Sebinraj, S &lt;s.sebinraj@intel.com&gt;<br>
<b>Cc:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;; Badrappan, Jeevaka &lt;jeevaka.badrappan@intel.com&gt;; Kempczyns=
ki, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt;; Konieczny, Kamil &lt;k=
amil.konieczny@intel.com&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v2] RFC: tools/gputop: Add GPU freque=
ncies to the client headers
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">&gt; Hi S Sebinraj=
,<br>
&gt; It is usually good to wait a bit after getting review comments,<br>
&gt; so people may discuss or respond to how you interpret their<br>
&gt; suggestions. Since you sent v2 already, I'll continue here,<br>
&gt; because I feel like some clarification is needed to my comments<br>
&gt; to v1:<br>
<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; fp =3D fopen(freq_path, &quot;r&quot;);<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; if (fp) {<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fgets(freq_buf, =
sizeof(freq_buf), fp))<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; cur_freq =3D atoi(freq_buf);<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(fp);<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; } else {<br>
=81&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fprintf(stderr, &quo=
t;Failed to open %s\n&quot;, freq_path);<br>
=81&gt; I think failures could skip this iteration of the loop,<br>
&nbsp;&nbsp; unless you are adamant on writing empty strings.<br>
=81&gt; You could also write ERR or N/A to the cur_freq/act_freq as<br>
&nbsp;&nbsp; direct notification to the user that something went wrong.<br>
<br>
&gt; I wanted to convey that these &quot;else&quot; blocks are an error pat=
h,<br>
&gt; which, if ever executed, would mean we'd be printing incomplete<br>
&gt; information about frequency. I thought that instead of doing<br>
&gt; that we could wait for another call to the function reading the<br>
&gt; data from opened files, so that we leave the most recent (albeit<br>
&gt; outdated by one cycle) frequency printed on screen (with your<br>
&gt; change the fields for which fopen() failed would be emptied).<br>
<br>
&gt; I believe the error prints were useful and should have stayed.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">Okay got it, I'll =
bring back the prints as it is a way of conveying an error to&nbsp;</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">the user. But for =
this comment from you</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">&quot;<span style=
=3D"color: rgb(0, 0, 0);"><i>so that we leave the most recent (albeit outda=
ted by one cycle) frequency printed on screen</i>&quot; ,</span></div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">I think of skipping the empty frequency each time there is a failure,&nb=
sp;</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">so that only the last successful one remains on screen, rather than a em=
pty one.</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f"><br>
</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">I'll share a v3 with the same, Please have a look at it (v3) once I shar=
e it and if you think</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);" class=3D"elementToProo=
f">that's not the correct way, I'll change accordingly.</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof"><br>
</div>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">With Regards,</div=
>
<div style=3D"font-size: 11pt;" class=3D"elementToProof">S Sebinraj<br>
<br>
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
&gt; - Use IGT API functions (xe_sysfs_gt_path, igt_sysfs_gt_path) for<br>
&gt;&nbsp;&nbsp; driver-agnostic sysfs access<br>
&gt;<br>
&gt; The frequency information helps users monitor GPU performance states<b=
r>
&gt; in real-time while observing client workload utilization.<br>
&gt;<br>
&gt; Example output:<br>
&gt;&nbsp;&nbsp; DRM minor 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; Freq(cur/act) GT0-1800/1800 GT1-400/400<br>
&gt;&nbsp;&nbsp; DRM minor 128&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fr=
eq(cur/act) GT0-400/400 GT1-400/400<br>
&gt;<br>
&gt; Signed-off-by: S Sebinraj &lt;s.sebinraj@intel.com&gt;<br>
<br>
[...]<br>
<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; fp =3D fopen(freq_path, &quot;r&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (fp) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (fgets(freq_buf, siz=
eof(freq_buf), fp))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; cur_freq =3D atoi(freq_buf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fclose(fp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }<br>
&gt; As I mentioned above, these error paths were useful in letting<br>
&gt; users know that something went wrong.<br>
<br>
&gt;[...]<br>
<br>
&gt;--<br>
&gt;Best Regards,<br>
&gt;Krzysztof<br>
</div>
</body>
</html>

--_000_CH0PR11MB54272DF9616AA37306FFC67498D6ACH0PR11MB5427namp_--
