Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E2E10F92EF
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 19:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDF710E9F2;
	Tue, 31 Mar 2026 19:02:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StUvF1GU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7798610E9F2
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 19:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774983733; x=1806519733;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TXUQDPlqKfVAW8JoPLrxIfzGrPyqwGQA0xkpTsxt6o8=;
 b=StUvF1GUq+azjqMFN2QFlpJmGWq+L5ZvsZqG6Y7KBhfCk/ZH/+6DytCE
 uAHaZk1Kawe9WxpIYCTTVktXPSVm7yUG2P3YnOZEVuyUpUN2CCtu8KUUz
 EOlJmqOWGV7LsxiiB9UmHmpTPcZmIBbySAolS7PBqi1/ULwWbOK4dy/Jc
 4NS0OXcm8CAQrqVFCr2Q/h2Auw7GEsoKvX5v9eURolgQkIXny1XjDboCN
 H5M/YG5GVQkaElhAN6jDTnPlYWYl28y7+LAduETrxnQuw0Lbd05DspJg4
 MALablLvEn0Sdk6tgozvpamO8PIgEFyKBTmBzsRGUzPjndySToT3/rHNT g==;
X-CSE-ConnectionGUID: y1ImXPF1SUqCfOCBCRBzZQ==
X-CSE-MsgGUID: NEZ56X8zRIeFFuEY0mLRSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86310449"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="86310449"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 12:02:12 -0700
X-CSE-ConnectionGUID: 7294E/ZZQF+ErBx3Yhfzlw==
X-CSE-MsgGUID: ohoOlkGJSYmhHRNg+Nu8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="222044980"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 12:02:11 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 12:02:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 12:02:10 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 12:01:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KwyoS1+y6jOv2UkFZVL1wk5bu1RAC23YzSLmEoGTvJlGDiinTs72MjVBECBMCdKeM6CQ7cTfxGDQOCf3Zc7Y6D3XN+AbhVa2LUTpC2IeWNOB/cEAbmj9md/jGyLiSIo46YinOzu4Cowrl68zOZDxPWZ9KJnFTCKJU0DHn6eRclpUB1OJQ4w6QNnW8I1QDTVQUlq5XSI9raXBhy9U38ZDdKISIgT5mFnfRdLs5WThy8prKe98LTLWhBmVh2C3R8PMb/qhcR1SFIvfjP+FnDzGlApxr53YCXoETH4wXBWC/o0qMOZtY/qhxkD+srs1PEm+VV9PJ0yk8Wb23qLCA0Tfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2hhwElGWxqLCcOxkwp+zVyb521q4RQTi+xc7XlIxdc=;
 b=F/8bybd6oC//LRzK0jGMJOEQeYAEybYwTvYDg/wAQjbuY1D8dynvPzFJ1XTUPKeG8a1RQl2Hrusm68G/WgBPORzvhmwYPXfYr6REqn9LSaQrM25J8YAA5BFECeQtclkPZ3q+gfUkPMMbHoLs48ZLHbhPeVANc5cs7wT8H53LK/SPahwKwP6nzVHFXZ0+4uOMs36AzftxJrhWTt5YDPh/mDkoNNc5fsulyXeBApSyWHXxztb+K5xN4UFe+shN2g4i+ckpDVDqaorsrBr0Le+1YY9y3iG3kBseP/rGPwPBykLZIFVphYsK2E7dfuFnLnnjajNGxqVX0YJwRFYpxpGEkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY8PR11MB7686.namprd11.prod.outlook.com (2603:10b6:930:70::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Tue, 31 Mar
 2026 19:01:37 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 19:01:36 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Zhang, Jianxun"
 <jianxun.zhang@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Lin, Shuicheng" <shuicheng.lin@intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>
Subject: RE: [PATCH v8 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
Thread-Topic: [PATCH v8 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
Thread-Index: AQHcwScNpIUsg7zmXEK0xB17HQJC4rXI/SAAgAABf7A=
Date: Tue, 31 Mar 2026 19:01:36 +0000
Message-ID: <CH0PR11MB5444E8E8E07CFB9060A19D56E553A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260331155700.7245-6-jonathan.cavitt@intel.com>
 <20260331155700.7245-7-jonathan.cavitt@intel.com>
 <20260331185352.yjwz2wm7jekxhqxs@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260331185352.yjwz2wm7jekxhqxs@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY8PR11MB7686:EE_
x-ms-office365-filtering-correlation-id: 5174b5a4-00bd-4ac1-e810-08de8f57eee5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 6LUxSutWMfRpEl2UMtGurS975dUfEVRVxkrwNp67I/ui5Kbi5fDNB//tXRL+mRt5ouF/K7VuXqDTkJShPi5Oy7WE/EqsAE8o2sc3E1O9QR5VJDYvLRr70eXatRQiBOKL+zeC6XrfQMBzU0xam14N2q/PXrl9LL3MAwdfonjIbgG+dMI+Bkb+VKI4HVr5UkowjwOLqRcmz438aTVuGOwKon1Or3R7lG0bdCpWw44y+FxbzhHO/IC12zVH3SzOfnDpJJr7OPSzmh9Z0Lg+DIuNLH1WSgZUfg5pMenGN7g9EXbYRuqOm6XjxWsr6CCoNUowJhytgbOCS3K+aikcZMyqrKVb6Gq8S9z1vA+GkcDrQOlvebq5si3cc2RmQ7uM0LdGmchnw0paEvSYtEWEB68jgXZbYG2B5xoB+E1VWw3AbdgguqBJn7r/GjS9qbjjVNLawMbYvEKTB4XNd45cTHyMbX9XBD/PljIfeAUbZEVcBmNRO11EQUMtEpOpma9Kqq26esmq7KtfC8bWbhGIKAHySKRSK2cUGkHnx5smLJ5jkf8mbGqwQUy8qq5dCTt6DwbszlZLmEyqD26/cgW/d3VX5cg9iFxcvqMt2s9cS7J5nvnFq5i5gvTgyCKhx0FfnSiW13hojpE3vBtjvjlGJEFOcWOUlLH2CBQwa7eVX8I9M76HXxMXDba3fEpSlipMrrNgI2q+HKXkBmVDZOrpsQ0Xmkqcs+l2VY2wnRziOdDF/4OmtxsmHLwtuX2sTR9xewKTP0mzJEG8jUWUERvKeV9k7TvrE0XFXb7q2oFf9WAnuaY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2rhss9mVnioSnp6mPbU7+k1dKu2DSiqNxjzPvtl5cgQjJGovOcqpD6CwPjNW?=
 =?us-ascii?Q?EFCbZbcDc6CDvJszi2Vo9FkqrZUBxtt39q+3py16gjfmfbzAWYzvkSK5Guaq?=
 =?us-ascii?Q?ied3gOxFwSmoxwbj4u+CSRXQq6Yrgr4Q5gwKtwjZGqyjiLQYeq886/smAnKb?=
 =?us-ascii?Q?OA1BOOOIrxbK6Qgs9DzKfHZVlpn+n83PskOuMWyaAj5X3xoECmjeOGe9I6gS?=
 =?us-ascii?Q?M36XkM7QSzWp016dZvZic4meoJXXUOac5xGyBp6ubio5OMorLX+RFhrqkpTA?=
 =?us-ascii?Q?idSqm1BsYlnWNsHB12A+Co1bCsFReUt7SmxFNS0oMDUlsz1kFacES7O3h8w0?=
 =?us-ascii?Q?2/68Jz6sGSc8J9ee4tdxnSgc1TFqI1V0BRLIkJyYZL+QPK8xmM51ZjdtKdDT?=
 =?us-ascii?Q?kA6UvgvLB+BnGMa8Osr2xh2YuKcVSRq5Bys7Bbs8TY7bYTptlCEW0dzJyh8h?=
 =?us-ascii?Q?GOA6SrmLQineSaRogpBnTMd+/XYGmYQiPqNbPgUCi+1m2oUUEEdOx71uzuGK?=
 =?us-ascii?Q?CjRTnIuylg3EhNjo/eizRWwiWva+K8THfZ7XmIMlroEaqDA54ssmdqQD4bdV?=
 =?us-ascii?Q?5M2iTPkiWyJ0vn3XTU1ezbnPs7MspUQ9VXoKeC7d7e7QX6l2gtdqgz6Aq2zY?=
 =?us-ascii?Q?PYOUWk4hfhJ30AFy3jqXbQdH5+ofC01B/sdtAnLGV2cEfDF2npYIw2m0KlMC?=
 =?us-ascii?Q?VNenFXKo+cPwAx1u0VnxwJXdiQLbE5kzIftdl+9+zPQmHU1nAp1e+7Lm4BgQ?=
 =?us-ascii?Q?l2IYta9z5D+Ie9UH0uIJrh34nlp0Ka821bWxiTrvPY8GG2j2xw2foQG0W9eg?=
 =?us-ascii?Q?84jGF7jESF33axZplq9HYF57gnY86dQC1iBeetE6FXjRjaaM+W+HjXCEU5lu?=
 =?us-ascii?Q?D0yl/iqd6oc8g/YhGto2wBbZgAlIayj46ljoN1lg3TdKuSxchk9DAkKNhBfS?=
 =?us-ascii?Q?s7Y2OAuD8fzNaONrsTu4kiVyRSIv+faG2RUfRj6BdUoUlA7ejCD9XTfblRvt?=
 =?us-ascii?Q?ecLxcgskRa3nw9ffyeSkSdw3V4Z3pfT4kGHrm6DLC7ReI2R1bhgNsFzZo8qY?=
 =?us-ascii?Q?4PMhs6TKSFFt5+JkOio7Pdc4I5plm6hyoDG39ve0cODt+YT26DqNljBhJsLT?=
 =?us-ascii?Q?NENxKquGh2cvUmUQb4CZhb27a4XsckFDRuAdSvuj1LARry9Gx+JLyNezWVut?=
 =?us-ascii?Q?r/d6HFp78PGgYGPHUAEsraD48COxO24tFvKZxd2SZAmYY12sWrA0W+4e3wPw?=
 =?us-ascii?Q?IzmKN7cfKrZOxGejENsuC4TO2m0JgtEvEj2qnOAfSEJB2TolAVHz4NwB0I/g?=
 =?us-ascii?Q?azge7FW6KrWjSPYea8DGQrs2fbSO2KMDMLGePh0vzg+cpa1rYV4z95dnPs4U?=
 =?us-ascii?Q?v6uPhpfvkOlQCvRIctSdbM71ejHAuLXG4M+OyEalP8/kJLvz3rmQzVLuCJMn?=
 =?us-ascii?Q?bW6Yrc9hNRj5UQhyPeox8wzO1JWyI1Ff+LSpb1QxJ3zLR9DZG5SOWCGGFJVb?=
 =?us-ascii?Q?oBpoUzmjeu+fku46riK+YmJDLPBGNAGiNGpS5qdAomSgndNJD5B4J8MWSXsk?=
 =?us-ascii?Q?MIdkjWito1rnZcx9cb+Wdv1cDzChhoH0P3GX0td3d5BIFWR4C0aDs7DMldf2?=
 =?us-ascii?Q?ehmAJm8vViJP0WrW6atl0JUMLbhBxa+nHAg22zv7FHGJE//ju2RGD5wwU4Kq?=
 =?us-ascii?Q?g06vcwRTl5hUM9G08w18HgSvH96iOoS2R/hd2nU5DTE0x5nHxp2FPeY0tZIB?=
 =?us-ascii?Q?jGtr4khfoM4XXxaiby2y/d1bVTWFzIy/r4BWBrpmovWHyJ7RnpqqtZJLyYjr?=
x-ms-exchange-antispam-messagedata-1: SnQr4atuVBZdSA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: q8Mqh7Brivs+l3WRXYdJYJf0HAqoEoX9ENffwvz2/NbELvMOZfnBBYHt7ageHi12L9qBFljdzfvjjgA9UYJbhG/uSGnq3d5whMRBBYCbbZJwnM5CuMVLG/sfHil0UL2imHfVavnK/q1r3XoyqKaLQ93ciZ5kP4ZCHnOQWf24hTGTx5QoNvN2vwA7nEWwXMEljqrmwsP9K/pgppGz7n3Bh2RR+qrXEfljto4dDB6/bj4dcV1hhKUQMCg0S1OesE7rwT5yxxcmvv8xCbt/w2j+t67cNxkaoZ1AVs58dI6rS5iRyFA11AFpjaKsdKbe0LLcHnxPngfR/FQ5K+syJrPkkw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5174b5a4-00bd-4ac1-e810-08de8f57eee5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2026 19:01:36.4991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6qIJfrwdYLHKqYnbympD71uDSB5tt2GspBkPzrsm+jhtym4/UqFZFD7qutK5kzZ5vH0lrAnw5BGfFzGVlTGoov5EdT6ZIjAbxZ1qlj/lqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7686
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

-----Original Message-----
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>=20
Sent: Tuesday, March 31, 2026 11:54 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.co=
m>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Brost,=
 Matthew <matthew.brost@intel.com>; Zhang, Jianxun <jianxun.zhang@intel.com=
>; Summers, Stuart <stuart.summers@intel.com>; Lin, Shuicheng <shuicheng.li=
n@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>; B S, Karthik <karth=
ik.b.s@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v8 1/4] drm-uapi/xe: Declare xe_vm_get_property_ioctl
>=20
> Hi Jonathan,
> On 2026-03-31 at 15:57:02 +0000, Jonathan Cavitt wrote:
> > Align with 20250403173614.67195-4-jonathan.cavitt@intel.com
>=20
> Please improve description here, it could be done at merge time.
>=20
> imho here write with what commit(s) in drm-next you align,
> for example look into igt commit 50c3688909636b48f037b7a3725026384d80d3ae
>=20
> drm-uapi/xe: Sync with madvise interface
>        =20
> Align with kernel commit dff547e137be2 ("drm/xe/uapi: Extend the madvise
> functionality"). This is to bring in madvise interface changes from KMD.
>=20
>=20
> In subject you could write commit SHA, something like:
>=20
> drm-uapi/xe: Sync with kernel SHA-here
>=20
> and then list all commit(s) with which you are syncing, for example:
>=20
> Align with kernel up to commit f99a05cc0b85
>=20
> f99a05cc0b85 ("drm/xe/uapi: Add UAPI support for purgeable buffer objects=
")
> sha-2nd ("drm/xe/uapi: ...2nd...")
> sha-3rd ("drm/xe/uapi: ...3rd...")
> ... up to your commit here...
>=20
> You could later give a link to lore.kernel.org, up to you.
>=20
> +cc Ashutosh and Karthik
>=20
> Regards,
> Kamil

The series needs to be updated anyways with support for exercising pad and =
extensions
MBZ assertions, which was accidentally left out of the original KMD update =
and is
implemented by drm/xe/vm: Add missing pad and extensions check.  So, in sho=
rt, I'll
fix this at the same time as adding the missing tests once the KMD is updat=
ed to
make them work.
-Jonathan Cavitt
>=20
> >=20
> > Add initial declarations for the xe_vm_get_property_ioctl call, includi=
ng
> > necessary structures and IOCTL macros.
> >=20
> > v2:
> > - Remove engine class and instance (Ivan)
> >=20
> > v3:
> > - Add declares for fault type, access type, and fault level (Matt Brost=
,
> >   Ivan)
> >=20
> > v4:
> > - Rebase (jcavitt)
> >=20
> > v5:
> > - Clarify canonicity of fault address
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > ---
> >  include/drm-uapi/xe_drm.h | 86 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> >=20
> > diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> > index 077e66a682..f5de148257 100644
> > --- a/include/drm-uapi/xe_drm.h
> > +++ b/include/drm-uapi/xe_drm.h
> > @@ -83,6 +83,7 @@ extern "C" {
> >   *  - &DRM_IOCTL_XE_OBSERVATION
> >   *  - &DRM_IOCTL_XE_MADVISE
> >   *  - &DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS
> > + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
> >   */
> > =20
> >  /*
> > @@ -107,6 +108,7 @@ extern "C" {
> >  #define DRM_XE_MADVISE			0x0c
> >  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
> >  #define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
> > +#define DRM_XE_VM_GET_PROPERTY		0x0f
> > =20
> >  /* Must be kept compact -- no holes */
> > =20
> > @@ -125,6 +127,7 @@ extern "C" {
> >  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVI=
SE, struct drm_xe_madvise)
> >  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BAS=
E + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
> >  #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE =
+ DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
> > +#define DRM_IOCTL_XE_VM_GET_PROPERTY		DRM_IOWR(DRM_COMMAND_BASE + DRM_=
XE_VM_GET_PROPERTY, struct drm_xe_vm_get_property)
> > =20
> >  /**
> >   * DOC: Xe IOCTL Extensions
> > @@ -1249,6 +1252,89 @@ struct drm_xe_vm_bind {
> >  	__u64 reserved[2];
> >  };
> > =20
> > +/** struct xe_vm_fault - Describes faults for %DRM_XE_VM_GET_PROPERTY_=
FAULTS */
> > +struct xe_vm_fault {
> > +	/** @address: Canonical address of the fault */
> > +	__u64 address;
> > +	/** @address_precision: Precision of faulted address */
> > +	__u32 address_precision;
> > +	/** @access_type: Type of address access that resulted in fault */
> > +#define FAULT_ACCESS_TYPE_READ		0
> > +#define FAULT_ACCESS_TYPE_WRITE		1
> > +#define FAULT_ACCESS_TYPE_ATOMIC	2
> > +	__u8 access_type;
> > +	/** @fault_type: Type of fault reported */
> > +#define FAULT_TYPE_NOT_PRESENT		0
> > +#define FAULT_TYPE_WRITE_ACCESS		1
> > +#define FAULT_TYPE_ATOMIC_ACCESS	2
> > +	__u8 fault_type;
> > +	/** @fault_level: fault level of the fault */
> > +#define FAULT_LEVEL_PTE		0
> > +#define FAULT_LEVEL_PDE		1
> > +#define FAULT_LEVEL_PDP		2
> > +#define FAULT_LEVEL_PML4	3
> > +#define FAULT_LEVEL_PML5	4
> > +	__u8 fault_level;
> > +	/** @pad: MBZ */
> > +	__u8 pad;
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[4];
> > +};
> > +
> > +/**
> > + * struct drm_xe_vm_get_property - Input of &DRM_IOCTL_XE_VM_GET_PROPE=
RTY
> > + *
> > + * The user provides a VM and a property to query among DRM_XE_VM_GET_=
PROPERTY_*,
> > + * and sets the values in the vm_id and property members, respectively=
.  This
> > + * determines both the VM to get the property of, as well as the prope=
rty to
> > + * report.
> > + *
> > + * If size is set to 0, the driver fills it with the required size for=
 the
> > + * requested property.  The user is expected here to allocate memory f=
or the
> > + * property structure and to provide a pointer to the allocated memory=
 using the
> > + * data member.  For some properties, this may be zero, in which case,=
 the
> > + * value of the property will be saved to the value member and size wi=
ll remain
> > + * zero on return.
> > + *
> > + * If size is not zero, then the IOCTL will attempt to copy the reques=
ted
> > + * property into the data member.
> > + *
> > + * The IOCTL will return -ENOENT if the VM could not be identified fro=
m the
> > + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason,=
 such as
> > + * providing an invalid size for the given property or if the property=
 data
> > + * could not be copied to the memory allocated to the data member.
> > + *
> > + * The property member can be:
> > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> > + */
> > +struct drm_xe_vm_get_property {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: The ID of the VM to query the properties of */
> > +	__u32 vm_id;
> > +
> > +#define DRM_XE_VM_GET_PROPERTY_FAULTS           0
> > +	/** @property: property to get */
> > +	__u32 property;
> > +
> > +	/** @size: Size to allocate for @data */
> > +	__u32 size;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	union {
> > +		/** @data: Pointer to user-defined array of flexible size and type *=
/
> > +		__u64 data;
> > +		/** @value: Return value for scalar queries */
> > +		__u64 value;
> > +	};
> > +
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[3];
> > +};
> > +
> >  /**
> >   * struct drm_xe_exec_queue_create - Input of &DRM_IOCTL_XE_EXEC_QUEUE=
_CREATE
> >   *
> > --=20
> > 2.43.0
> >=20
>=20
