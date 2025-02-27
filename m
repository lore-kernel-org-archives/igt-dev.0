Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62379C19F2E
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 08:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DE510E13E;
	Thu, 27 Feb 2025 08:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XeWdl25Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED1710E13E
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740644414; x=1772180414;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JZOFXjcq96UJMnsGwjI8j6CGJALWy2kn/lwTKhkoNys=;
 b=XeWdl25ZgWYENDOPyZdid00lAUueBQ1YdnPiGSbp+33NjrRRB2JLEqxn
 +tXj6mlXXvIQJoL08uNKSuUXNNLagwJbO8xvWuRo1PluN4Xv949RxVbDI
 UMU8j47r5buuEYM+qClUv/USrbz4uJfT/FXNwkRiQSfhf56rC812lI4LV
 Uy4Sws3yXZuvghKZ2r/08GQsmPQ9f6TGMkv3fVyt7NFBmTZej9Zh5PkxC
 cTKbaoWVLj4rL0G17Vh/T1K2wPLZeNabOkh2MzzpDzB38euFMSvXJRXFx
 FdZ/qGz9KiXUzsnazQuIzfo23WsnhnaXEK/KqW8iFif9rMg31g4mLjK16 Q==;
X-CSE-ConnectionGUID: xzcLUIc0S1+HWNUvHmePJQ==
X-CSE-MsgGUID: rt+mGbwUTsOynomUYlElDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="52161046"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="52161046"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 00:20:13 -0800
X-CSE-ConnectionGUID: B3EIYmpJQou1OFX4sIVZLg==
X-CSE-MsgGUID: Pvsbcv5cRw6Eq9RPTfks/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="121556248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2025 00:20:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 27 Feb 2025 00:20:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 27 Feb 2025 00:20:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Feb 2025 00:20:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7F6PsUkccMaf4J8LPbxYwddLFu4NJDWOEEzVKtI4wlG93rmLGOZC7g4WBtnwE4pT9LyHI9rN2glIGtS1bjub8ZJcMcfWgcVEF4eHMC5xljYHqsSGE8JBIA1oXH0HqQ/CA11TehhQQ/WeK+8wxuE7o0/sdB/GTQ8GiLWHCpo6cK7ghtvfSNxwI5h6miMEeHAgK0oJShB4cTOBXol7+WCa/Zr+OUsNbAuSLAFl3dJDCsv8DOXhAjJQWkXihywr3SuN/YorMlbQxrcc33xO2BeU3iVr2ZUj647VsT4youkKs98SqfdlVCjwJtCvkkYLz11SAMysbrZFb0xkIyV8R+ZJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KKDgCZr7/FrAo0INYrwOiHvTJhDOyiszgjgxl5Nu0k=;
 b=BRKagWgLSC6KmmVX/pGQiytQgoHl6eGDTrzm06cNkaAhjfaXvs/pPIUJnriL3FmAXXUH9STp/tUiWeIlDcZMgyvqFweOQlN5qtlzT68ZZMDGhpPIYGqh7BXZ2Cs7AF5Rx1+4ldQNrD+3dJ32IemmJ6jiiAXL/9GjUDUmEI7G5CzzviurDZ+uvEUiA/mCoRlSpfmnecEF2oNX/J0pTJSDqx3Q2JZQpJJOIAT9OlTHI8+BG4SI3hBglRn8X9EScPKZgrRzbzgpK4pleJNOo2xcGbCirr+89kvuX/21S+sA7TIwqUjp2jDbZWGJKpJhh4dBrxgbsQqlmb8mG0MQ7o4LaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Thu, 27 Feb
 2025 08:19:43 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8466.016; Thu, 27 Feb 2025
 08:19:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Dugast,
 Francois" <francois.dugast@intel.com>
Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Topic: [PATCH v3] tests/intel/xe_fault_injection: Inject errors during
 exec queue create IOCTL
Thread-Index: AQHbh1ZzdfnYtHgGbEGQ3Chy5QUVLbNaoQiQgAAFXoCAACt/8A==
Date: Thu, 27 Feb 2025 08:19:42 +0000
Message-ID: <CH3PR11MB8434581BD8A933721B0971898DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250225073404.252344-1-pravalika.gurram@intel.com>
 <CH3PR11MB8434BAAA2CE8B88FC97235FB8DCD2@CH3PR11MB8434.namprd11.prod.outlook.com>
 <BL1PR11MB552526A1E5734FC54C7E18C684CD2@BL1PR11MB5525.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB552526A1E5734FC54C7E18C684CD2@BL1PR11MB5525.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB7368:EE_
x-ms-office365-filtering-correlation-id: 4de16faa-b8c1-4e4b-8eac-08dd57077cda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FXq6aJAjpBxgCd26l38BVOOb8WfrofC1BNUyi/VkDNZWnQbt2GcngGsT00kD?=
 =?us-ascii?Q?TWNSZjHNusGx97Jh00B+n7OcMiK9yGaO+gbjE8zPyIi9mBsxSaE5rdpM7IG3?=
 =?us-ascii?Q?ecJydNHhqC22MLAqhTnkBk+0Y/GWVhMFzRa+bB63N80SIj1fZsOTIv476DTj?=
 =?us-ascii?Q?NDOHzX/hHcV8cjflu+7HRLgEfJFtKzxW41GdMomtA0YGgeJDRpR1tbVcYNpL?=
 =?us-ascii?Q?Wk8h13rC3HbcMIddTTwb6PT+qrkQ0n1K8YmaK8FjDSKyLU+ACEhJMGorDdkt?=
 =?us-ascii?Q?J1i/SNUJ/p9xtgBBdwXgPBRgblRKVCLd9fZi8Hcvz36+fkZWPPvCKS2F5zOS?=
 =?us-ascii?Q?PQPrCCc0T0Srr4Nd2CMGKFaXUByGiSjcpCN6J/ICdqNQL0/txTNUi+PEbo+J?=
 =?us-ascii?Q?rG8VxRdfNBbjKE5RSH8Z6BsP6c/yOijFCsx98c4C3uce+7jPinSb4O+JgD94?=
 =?us-ascii?Q?Naz+6a07iWFHCRImGF+EwExahMuwq2lsL0wd2WSJUZbzqT3VJcXilUkym2Sp?=
 =?us-ascii?Q?VDvKv4U1vS2x8vo9IM/iuc4ut5qLQSgesspuZkws2FYeZsXaeebjm0pdl+i8?=
 =?us-ascii?Q?vXZr8fES2eLLkgpLzGJ+QV5kJwT8NN1wPkwuBp8IXSCgbdxPbbKIy8LEhBQm?=
 =?us-ascii?Q?yk2d3/Ah5f+8Ck1MVvbyIxwVjHy/XtGYeb2HIOZtaV5e2mbQcrgLKnXxJroC?=
 =?us-ascii?Q?S7JjAoyFlEDliMGSLBFMFN/uEtud4orQU6/VrE8X0na+yHlPnAXe61xZsQDQ?=
 =?us-ascii?Q?y4/ZXNVy8ohkylgCdwSKQ5uYMtc2d5csi8hlEZQaYGY3/tBL+fz7FXzLCbyr?=
 =?us-ascii?Q?b4ukUgb3KdoSABZtGWk9PbITBh2KbeFmXF1I2Ip6r7D3HYbfGDkIOqn6hVb1?=
 =?us-ascii?Q?QOvS0xsBo/xb8HL8rszruZmiqkUoXa1fA4LNATLM55AB5XIqBNlE+LxPF8PV?=
 =?us-ascii?Q?UswUdf3DvkeJe5wmSEE2sZpgE4ZUQqATZ1jxLFen5+8cUpiLvjNr4lh4QWW6?=
 =?us-ascii?Q?WCcu2j7sO/RqgBaiuERLvqf7jhEr8Fjsk0qbZBeLSLNgcUgoDevVTAqhn+xg?=
 =?us-ascii?Q?eID7C/qInoJmVHnsYx00mOzCZ5eKboV22f+92HHZX9Uv5ESJEqQvuikZaMr5?=
 =?us-ascii?Q?vSVqBun7aKCbnzTXRRgbm/RnkCxHMv5vW8F8Ht6njzMryYUKquJxDpAlnekx?=
 =?us-ascii?Q?6+mkShcl3oM6JW29v3lqTC7w4gL0WSfQ1lzeFZkSr++BjbE0YpoRREnFiCCQ?=
 =?us-ascii?Q?HkCUASJoMnk3AbIB/RShFt3ryEPpqBgmTUIbFql2D2zH9BMFNjO/jlxpoDfA?=
 =?us-ascii?Q?qB7EygqfidtqAyf9tKGH0LLcSPZDeFRXgMTHX1rzQSQequZPifP1Go+oYIyo?=
 =?us-ascii?Q?sxv373Q0QIulBVYH1FP4lve2xYsEHixox0khrC8fPNki2jBGf2pTELUQORN3?=
 =?us-ascii?Q?ygf+s1/CF3eZFJXgIg5e3h9yk9upmjTL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+9COla2RsEvmORLC+xVGjYVzOSc6oErz2Cxv4YIr6CkQIHpFntP5edeecoVh?=
 =?us-ascii?Q?b8MdkJBH2rC4jrFZr0Io2anr/+SGzKM3A4IWnoAl/5bSzif9NwN9PZraxHIE?=
 =?us-ascii?Q?ZLWzPColTF38eE7lYT5NAHyoYH6N+iMajMO3jijVIQFpo+62yPaa98jw+fc9?=
 =?us-ascii?Q?QotKOO9Wvrqnq2mjO3GAUg7I6rBYwRUe0Ggi1udU8vNEpsiLEryQD6S4GPLs?=
 =?us-ascii?Q?p9/8IISNsl0xr+t9XPAJsZQA04zL8SlcEPfv/h5glQ+x9kl9xbgFcR08DvYn?=
 =?us-ascii?Q?nXcHxS7nrjMEEbq0HIl+It/+Nyvxp1gESyNVomD/c8kEyjsNn+OR3do8teTd?=
 =?us-ascii?Q?N3ykPUSJvKmhlhMl8swjYYVpyerFbCNnqTOq2v8vsKYosnzb/beV8KLMh6xF?=
 =?us-ascii?Q?63bY9NS6EbLCq6aSEBfOgbxhPknEJyxlW0UfR4qBFaJIjYZdaIOZMZICYh6w?=
 =?us-ascii?Q?tKEc4pIcaBBRpYIAreWNe41/MhaNEdC/lcNNBPWpxToZignaOKaFsvktV8bg?=
 =?us-ascii?Q?KOckbVazCZkMvbgTPE/MlTy1puoB3BpekLuUydfvOJpckhhXYH+SA6scvrQb?=
 =?us-ascii?Q?MscH8ZVOBdg67sormR+zegVM1t5f12+x2ZbCKTkEKwXRDoG8o8owdQjCVHAx?=
 =?us-ascii?Q?xqDKOQKqjaJT+l0AbRgw0zzvWaOVf/efVxdfnvtp7uHja3EDlbyvMrl9y6GA?=
 =?us-ascii?Q?bw7akE3/2CnUe5XEwRAynrYQLBRHp4dbsFIClYNYaElQ5K2wajcMipUuPX9E?=
 =?us-ascii?Q?YqTgaMVDu/vLKxC2ZPgc7nKUqeGL8nU5UAWeolvgBH4uvH1QSjne7kmAowa7?=
 =?us-ascii?Q?afWgdgZnB/BQGrNRBubbDgxVCbdUvh6q+v1vlDP7xlA2x+FcjlpCAH0rIYs4?=
 =?us-ascii?Q?LV7Qhb7gdO+3W+CofprsqHCUauhLZazVG5JmlkuLWN4CRfzSPz6dl9/Z62Rq?=
 =?us-ascii?Q?v+x3p8He/l+MROi0KHMUGwvlCC9AaL8VJpl9f7aR8nVoMJca+FzkFdB2J9kS?=
 =?us-ascii?Q?Bz/HcCTPhur8S0KsEP364hynmnjJX3YxBDC4pAdUn5mq1XBe0+HYPlC9T+/0?=
 =?us-ascii?Q?adFujU7r/M4VI3QmQpCn3T+Hl6x2vs7WREIeD1/pdLnux2h04mtBjBp+yf7n?=
 =?us-ascii?Q?09CgD9eDNU47a6MS03yJAYqSNtglFfyxmcARjf6BeSO4LnpIr7BOpkKQ7ZXb?=
 =?us-ascii?Q?wrjxUGv0EfavwbwSF3RIopIvH/sfmA1/pJL4+xaKKWzOwQ16NmzzEG63h2Wi?=
 =?us-ascii?Q?nABG0AeZoJ8WZVr9peFbthRhijh0Uq9y+/eKRYd9EqBZ4q37KpzMfF+5EhTM?=
 =?us-ascii?Q?+D/aCEyb6+cmKCFjrzLSdr6ngJaoEhgJuSesdbvKwl5gzN0ZszSssCTgFnfH?=
 =?us-ascii?Q?v8fAGAST+6+Lxq9wKauLHg0T0qFDufswIaNfD+YMNk9UUMbnNT9j4pI5wkRa?=
 =?us-ascii?Q?2drtgD7Mxm5ryHshYOh3V7khjvAxcHNIm0ThYy8nLaq4B0wJBti5iL4q61xr?=
 =?us-ascii?Q?Rk5l3k7v2poWx7XXv6BdnikMKOs2FhYmkNo66JtkHSMZX8gk8bCsH8MqcODA?=
 =?us-ascii?Q?RISRvAYcY7MqwM6TzqMWSwlYpx9X3E1DgervBsYHa3qTBgKqQfBtEscZhPWu?=
 =?us-ascii?Q?Xg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de16faa-b8c1-4e4b-8eac-08dd57077cda
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 08:19:42.7300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xOxV8g+nJ30aq5CITJbDDUGFQqbG8jVOGVIXQwGn/08sX4FwS2VW/vGuquUrBIUnvvzvffIdctjC09b56oorxZOK3kj1sLy8Hkgtolwj09E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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



> -----Original Message-----
> From: Gurram, Pravalika <pravalika.gurram@intel.com>
> Sent: 27 February 2025 11:14 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; igt-
> dev@lists.freedesktop.org; Dugast, Francois <francois.dugast@intel.com>
> Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors dur=
ing exec
> queue create IOCTL
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Sent: Thursday, February 27, 2025 10:59 AM
> > To: Gurram, Pravalika <pravalika.gurram@intel.com>; igt-
> > dev@lists.freedesktop.org; Dugast, Francois
> > <francois.dugast@intel.com>
> > Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> > Subject: RE: [PATCH v3] tests/intel/xe_fault_injection: Inject errors
> > during exec queue create IOCTL
> >
> >
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Pravalika Gurram
> > > Sent: 25 February 2025 01:04 PM
> > > To: igt-dev@lists.freedesktop.org; Dugast, Francois
> > > <francois.dugast@intel.com>
> > > Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
> > > Subject: [PATCH v3] tests/intel/xe_fault_injection: Inject errors
> > > during exec queue create IOCTL
> > >
> > > Use the fault injection infrastructure to make targeted internal KMD
> > > functions fail when executing xe_exec_queue_create_ioctl() so that
> > > more code paths are tested, such as error handling and unwinding.
> > > include xe_exec_queue_create_bind only for VM_BIND engine class.
> > > xe_exec_queue_destroy_ioctl() and
> > > xe_exec_queue_get_property_ioctl() are not considered as there is no
> > > unwinding code to test with fault injection.
> > >
> > > Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
> > > ---
> > >  tests/intel/xe_fault_injection.c | 50
> > > ++++++++++++++++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >
> > > diff --git a/tests/intel/xe_fault_injection.c
> > > b/tests/intel/xe_fault_injection.c
> > > index 7ae941367..f25ad9b27 100644
> > > --- a/tests/intel/xe_fault_injection.c
> > > +++ b/tests/intel/xe_fault_injection.c
> > > @@ -185,6 +185,37 @@ inject_fault_probe(int fd, char pci_slot[],
> > > const char
> > > function_name[])
> > >  	injection_list_do(INJECTION_LIST_REMOVE, function_name);  }
> > >
> > > +/**
> > > + * SUBTEST: exec-queue-create-fail-%s
> > > + * Description: inject an error in function %arg[1] used in exec
> > > +queue create IOCTL to make it fail
> > > + * Functionality: fault
> > > + *
> > > + * arg[1]:
> > > + * @xe_exec_queue_create:                 xe_exec_queue_create
> > > + * @xe_hw_engine_group_add_exec_queue:
> > > xe_hw_engine_group_add_exec_queue
> > > + * @xe_vm_add_compute_exec_queue:
> > > xe_vm_add_compute_exec_queue
> > > + * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> > > + */
> > > +static void
> > > +exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance
> > > *instance,
> > > +		const char function_name[], unsigned int flags) {
> > > +	uint32_t exec_queue_id;
> > > +	uint32_t vm =3D xe_vm_create(fd, flags, 0);
> > > +	/* sanity check */
> > > +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > > &exec_queue_id), 0);
> > > +	xe_exec_queue_destroy(fd, exec_queue_id);
> > > +
> > > +	ignore_faults_in_dmesg(function_name);
> > > +	injection_list_do(INJECTION_LIST_ADD, function_name);
> > > +	set_retval(function_name, INJECT_ERRNO);
> > > +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > > &exec_queue_id) !=3D 0);
> > > +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> > > +
> > > +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0,
> > > &exec_queue_id), 0);
> > > +	xe_exec_queue_destroy(fd, exec_queue_id); }
> > > +
> > >  static int
> > >  simple_vm_create(int fd, unsigned int flags)  { @@ -283,6 +314,7 @@
> > > vm_bind_fail(int fd, const char function_name[])  igt_main  {
> > >  	int fd;
> > > +	struct drm_xe_engine_class_instance *hwe;
> > >  	char pci_slot[NAME_MAX];
> > >  	const struct section {
> > >  		const char *name;
> > > @@ -318,6 +350,14 @@ igt_main
> > >  		{ }
> > >  	};
> > >
> > > +	const struct section exec_queue_create_fail_functions[] =3D {
> > > +		{ "xe_exec_queue_create", 0 },
> > > +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> > > +		{ "xe_vm_add_compute_exec_queue",
> > > DRM_XE_VM_CREATE_FLAG_LR_MODE },
> > > +		{ "xe_exec_queue_create_bind", 0 },
> > > +		{ }
> > > +	};
> > > +
> > >  	igt_fixture {
> > >  		igt_require(fail_function_injection_enabled());
> > >  		fd =3D drm_open_driver(DRIVER_XE);
> > > @@ -333,6 +373,16 @@ igt_main
> > >  		igt_subtest_f("vm-bind-fail-%s", s->name)
> > >  			vm_bind_fail(fd, s->name);
> > >
> > > +	for (const struct section *s =3D exec_queue_create_fail_functions;
> > > +s-
> > > >name; s++)
> > > +		igt_subtest_f("exec-queue-create-fail-%s", s->name)
> > > +			xe_for_each_engine(fd, hwe) {
> > > +				if (hwe->engine_class =3D=3D
> > > DRM_XE_ENGINE_CLASS_VM_BIND &&
> > > +						strcmp(s->name,
> > > "xe_exec_queue_create_bind"))
> > > +					exec_queue_create_fail(fd, hwe,
> > > s[3].name, s[3].flags);
> > > +				else if (strcmp(s->name,
> > > "xe_exec_queue_create_bind"))
> > > +					exec_queue_create_fail(fd, hwe, s-
> > > >name, s->flags);
> > In either if-else case you are trying to validate only for
> > xe_exec_queue_create_bind out of all the list, what about the others
> > {"xe_exec_queue_create", 0 },
> > +		{ "xe_hw_engine_group_add_exec_queue", 0 },
> > +		{ "xe_vm_add_compute_exec_queue",
> > DRM_XE_VM_CREATE_FLAG_LR_MODE },
> > these are not considered at all. Can you check this once.
> xe_exec_queue_create_bind is needed only for VM_BIND instance in kernel
> this is covered in if and else in kernel
>=20
> The remaining functions are needed for other engine instances. Hence
> excluding the VM_BIND instance for other functions
But both the if-else condition work for only xe_exec_queue_create_bind, oth=
ers are not covered.
> > > +
> > > +
> > >  	igt_fixture {
> > >  		xe_sysfs_driver_do(fd, pci_slot,
> > XE_SYSFS_DRIVER_UNBIND);
> > >  	}
> > > --
> > > 2.34.1

