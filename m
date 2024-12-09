Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C94E7717D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 08:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A8B10E66F;
	Mon,  9 Dec 2024 08:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9I8aq1E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BB210E6A7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733734292; x=1765270292;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=3pZZyqYiKteCm+DFEwMG19WC7cKn11TxiPwuIkhf08g=;
 b=C9I8aq1ErWumRSHSoiZL80rVxenpYyjVQ5IM1SvS8hiwDUhNku1YPkrT
 aUX1Ykv8wYWSxnKH5h3YCSOWgHMwf97SsKVOxQ+QfEPyM3+SZYN/KBbZ/
 yadn36VMxwOjFVCY7SJMyRRLbFl/+Gy+MJf4pAaHRnTo4rzIBl6n4rFSr
 0bCuxmXKgT8806oRuvphrFOOwWOpkRC4bGuVus4UorSFr6T2ST+r8dxMV
 sRPtGgc46/oXYHfIBnwSR+42ID3QAaYrLw5vWwWQkFErtlEbwSIS0UKAJ
 FQDUABDha2qimSGG5jNYrAKBo4iBlTHdTLr3jHPlhBgzfYvuR9SaKubrN g==;
X-CSE-ConnectionGUID: 9rEBbnIVQWumDCBytPxxwg==
X-CSE-MsgGUID: cSQjAmg3SnuXNeS3gMLJhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="44490365"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208,217";a="44490365"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:51:31 -0800
X-CSE-ConnectionGUID: fQLSWndSTlGebK7cLfGj/Q==
X-CSE-MsgGUID: L/LCjW65TtmEhc16wj3K/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208,217";a="99464466"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Dec 2024 00:51:31 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Dec 2024 00:51:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 9 Dec 2024 00:51:30 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 9 Dec 2024 00:51:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkOhvOt+n0OB+BInQ0k+wkRpmPaUsTRsOFNwN8zzaplSFxvS3n6uqIDeM41wGZs8C9pgwoXOZbgomPMI7NLwpyFb1TzvTMO6SsItz2NXZav8JhXz9lbu+VN2h4riwtJmif9cfeeYO1yiXP35wVYx/lZ5WU9y2E32kaFcSeHFqIVrgCDTsBcR8xTUYn11VidV+n4wo6tnWQ4gemMK2WWiyFufbEC6n+OeTSVa1du+hfvPp2jLbPSI3x0xcFCMvI0KI296MDxY81EbS39FvK/TQagEAxOiKb6Rh4dDOcwpOgDaOivxpZj3xCvPGTpb8b3l5ZtB5UAiQQ1w4FpeEb8ACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHbV2PO56jloDzfQ+3mfiQ3GalJLc7IJPtryq+lq01g=;
 b=mN1kLRTsVXZgPnf3aNqm6HEhEytYJhpOxtVVu7s95Azk7ltw8yizhGpy3nbjlAPcFRxuwdPMA3tT9Wm9VdsO14wXOGMKcrzHl+jAuh4KuoiQChLl9+kxZVk43ex5xII6E8ah+emDKl+1quClj+GbVm/C7WgwYFRe4LDU5CtNE4Ob+ymgkvECJ+sCAUQBrb0v3YRPYStriuWxFIOAXJzsp9qLfhtN0PzY01zJWnni0nb/PfVNU++4iBP6eS/IHk9/w8ghIFgwJQ6kUGA9/A/wGts/kvuSkOMgpvDnTK+YdSbEAOVIl0zh1IerbVKccA1ODY2AcyzwdErMN4fu7VH79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CH3PR11MB7370.namprd11.prod.outlook.com (2603:10b6:610:14e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Mon, 9 Dec
 2024 08:51:27 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 08:51:27 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't unplug
 multiple times
Thread-Topic: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't
 unplug multiple times
Thread-Index: AQHbRvfDAB0wiBI6BkWQBm8Dqfi5obLYrPWwgATnbQCAAAyFEA==
Date: Mon, 9 Dec 2024 08:51:27 +0000
Message-ID: <DM4PR11MB6312F0A6B901999CD2B28545903C2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241205094052.1259373-1-kunal1.joshi@intel.com>
 <20241205094052.1259373-2-kunal1.joshi@intel.com>
 <DM4PR11MB631212A8CD3376CD2F3919D590312@DM4PR11MB6312.namprd11.prod.outlook.com>
 <CY8PR11MB6889E20F8A97489D943DCB37DA3C2@CY8PR11MB6889.namprd11.prod.outlook.com>
In-Reply-To: <CY8PR11MB6889E20F8A97489D943DCB37DA3C2@CY8PR11MB6889.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CH3PR11MB7370:EE_
x-ms-office365-filtering-correlation-id: 47adeb01-4a91-4a3b-3193-08dd182eab16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|8096899003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0YQCAdCB8Nuntabzf2Ob26l7fkwWXjt6kS3wubbtHnNqMa3qS6gzAcONlLws?=
 =?us-ascii?Q?vmVpU4f9htXVWiV01O1HeO//TVH2BwCITJVoKb0IpWqREJcl2FyGbytYD66Q?=
 =?us-ascii?Q?aFixikPozCNe/xerq6MnT1qv5p0q0GwXuM/tNwWdLiuARPQ9QtMs/PbMGDaj?=
 =?us-ascii?Q?EfNwOynxA4HhidKbwHziDNGfUVbxsTnxR/LxWC+jUfE9TG0SJkyi89rjBo+H?=
 =?us-ascii?Q?HknlEGnWyr4ypI7ZYT4TYZ/1loRSzXu7XA9l2cH7TfBtUr4yjnKdyA/R8qnU?=
 =?us-ascii?Q?dzdCmBR2mrG9UHM2iI3JkjgOrhtu7MwK54P2KBJIr8mlBYcv6vWHqF9sodwc?=
 =?us-ascii?Q?0SNIQjHIzduRQ2q/QT8DYLmWzVWkxljZkRn65Q5NdBgWYLIAmec9a731TC9L?=
 =?us-ascii?Q?VHMCRaHFe6CtjlIle0l+s58okKr8X8XKh28ZhwPh2rGxy7jeuyqND37HO9/1?=
 =?us-ascii?Q?1EJFQbS9vAWhD9aZS73QxG0t9k4GYcamStWW4fL1dAr0xJzBkBijlOAAaUSG?=
 =?us-ascii?Q?XivMGUVSK4KDgTEiBBy01ngZwMJ6R1cRNAy2SgltzmXjjFh1HCbh1eu18MK7?=
 =?us-ascii?Q?83ZSRpxYwVLTltvrLvngAvs06oLvzuE87uy+OwZ/bleDhBiUSRE8DtKR8znA?=
 =?us-ascii?Q?QSeGLRiP+z8FxbMAKWhtJ2WRv1UZXZOQJNT5X+ryrSRiZpqeJgQttPw0kDqd?=
 =?us-ascii?Q?oj6ID/kKO3wgZB94hSv0O8T80eedHl+YNUA8kTfWeZynoD/G6qEI4g56h/DZ?=
 =?us-ascii?Q?unsjdWZJAFO3+DP40gTCe2dTWRz0peqKVoVl7vd8eFqZlMyBsoiRhn0eGw9J?=
 =?us-ascii?Q?K63bPErY6bldM6K0rsjFD8vC1bOKxr3X31y+PocMPxEANS3sBLeS+yEIKuwx?=
 =?us-ascii?Q?ndLXWMl1suDgzuUJMny2SyMtCnZG5QnJSYxV+7FTktf2vY4eTkNmaMbPPKGF?=
 =?us-ascii?Q?DiCmL/ltq/GhtaID7rxscSUtBp9W1TDJj6zI2jY4JHaVIPRq1tNMI9KvXGnn?=
 =?us-ascii?Q?17VNtlq+uTmApcbTtHYEpW/94MD3S2zXckkR+RKfCQ1cjj/1DrqhGW2BCP1T?=
 =?us-ascii?Q?4ku4iVxomV2ndQ6FysLTVJN+d4wFmB9r0fjZc641Wgessz4aHv/pwdlU3gDZ?=
 =?us-ascii?Q?vhPzV8/VrH8EHB9eecKDL0p+L8EquE9f4szR91/vTkClyND+IMcPaWapMOYS?=
 =?us-ascii?Q?1hHlDegJrzXpiEPSwtncTlJ3cZeWgUrKZs8VBz2iPUq5jD29TT8aBQPTNmkX?=
 =?us-ascii?Q?EK7L2edzhH+Ep/gntJN31Xy9j7F2pE+MxVaEchfUCrJm1eioCTYG0xyq5QzV?=
 =?us-ascii?Q?Q986DiSPYeB/uAf2SOFuUhxuHIl/J2ShZSvdRK1aY2a3Rf+k7LJI54PYeGP4?=
 =?us-ascii?Q?u0K9gWQVxEctYv7DhAi2Y4Xh56eakpl/X5lwnouPVUtDuipfxQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iRJamEbJQGYSyoH1D7druAPZnrUCgAmA+zqKybUOo0JrxdC4oIorRRTMG5Rk?=
 =?us-ascii?Q?/ynNOinTVTWpYo2TXdOtYjzw5OJH33+8GTsWpQhrY/wuHYA6gmBPSYYqPrrg?=
 =?us-ascii?Q?eCUZwPmx0qPL/ZhYRAfsJFQWB0FbzGQrXzLuwEY5yRy0j4M487XhBnEDG3jw?=
 =?us-ascii?Q?Jrg8hX2B4Zq2S/LecidXr2R6TI7gudxKbn765ZCxbjrA8yLHnxcpi2CsgYNj?=
 =?us-ascii?Q?Jb7IinSiPbJGO1586ozkmLDem9sguoXEwc2sMOBF7pgBzifheQ0e8TAeZRu0?=
 =?us-ascii?Q?HBxSnEmaZmvfkpioVaMXsmMDwmnj1X04YRx7ekbVgKYg5Z2E5hudWLlJoQ8i?=
 =?us-ascii?Q?tAYUCU8UoaEkZ7/T+tmBBnl34FQC8YQHrHWcFyntLdkPwD6WkKtv0b4FMwYF?=
 =?us-ascii?Q?WAJUlZtJmxsKklP5OnYEA+5Txfmdu+GxFTBwuN/Y2eSgk8DzETxMswpSW6rV?=
 =?us-ascii?Q?fclku8R85mdtR9jkgF18HlSTgvpNhstLETA+4De5Y873WWSMN1E85YoqIgax?=
 =?us-ascii?Q?C8VlPB0kTGy9BvtpqO6zfIjcHC8RSAjj+/RuuEeauEllR2GkusU46ryDPIhj?=
 =?us-ascii?Q?S/RewnqO9UGHxFZP01TV6N0bPhlpw6yy5dlQa2RlNGAShEPNZvjX5i5mXx0C?=
 =?us-ascii?Q?QC4OgtMoUzIf8TkxzmuLao/ygoWX7GqFjv8tlozT8PiOuZ+DPtNtFAQHpmwv?=
 =?us-ascii?Q?9928d/VRho7ra/br6XELfthwuJP31MUUhjltxjpfxB09utKxnp2CFIt16JdT?=
 =?us-ascii?Q?q2wK9Muee0KH/OPBUdVnAPODW2lOFyJC0j3nv9QfkFYt4CYIxs2R8uC1fiJq?=
 =?us-ascii?Q?KevByk/u/o1mNeIcZMLrEfe33/6biCQ1NyGkHXIWYLSCcIQRCSSR2JLZn/Kw?=
 =?us-ascii?Q?cNuS0/iCx71fm2wVYDOrhr/hXGmMz03wOnHRfYPo+4xlDPiWXW2+PhODmaDA?=
 =?us-ascii?Q?2jCaDMw2YZj2oZgjjdDhJq2C4ny6uDECgw0dXlR140f6gRrWkiZxFTg4EkEF?=
 =?us-ascii?Q?wQEAXt+BDwkLVLDKnljgCgE428p3aO9bBJPH2BnewBq/FHRE5jeQaloHwcsA?=
 =?us-ascii?Q?dkcDVzyVCBMzztc1vT961TCe7GYVjixIBlY6nxz8XPYY7WXWyftRJUuvzNnb?=
 =?us-ascii?Q?P/sf9wYIVs8hec/wmHi4lqW5G0RVM4VnFmbH+kx5oYxdptrK6rl00hh+1HsP?=
 =?us-ascii?Q?o7yFbZA954lXf2IKeZbMQP5RTIebSUD80chbJMfkLqkUHL03jEStUZqqMdRX?=
 =?us-ascii?Q?j2XKFVkZyAzNHp1FhOW7fPIwY3eO+NpMSTzEVU/QolBp7puE0DXovS2yTZ28?=
 =?us-ascii?Q?BufHjsru8orS/VLPajYC1nKwP+Wqv8jtROWX84bysZ8SxQwAEZcJFY4UJi0H?=
 =?us-ascii?Q?XoCEb17b3LwnVRbCdb7UnICaIBYxPGiyXOYt64NasTcjdbeUdamR669bL6Ny?=
 =?us-ascii?Q?GTnynh2tR/kF+Xov8cF+XRliti8Fd6rh3aYBSNDwTOf52nJqPTYl7i/2/6pJ?=
 =?us-ascii?Q?Pe6r0hhULDHlv9wPdMa9ZXwEg9kLYFjRJSzVPetO5DqiGHjEe47nIar3uNJW?=
 =?us-ascii?Q?nyYZbWsfaYernTtHEhU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR11MB6312F0A6B901999CD2B28545903C2DM4PR11MB6312namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47adeb01-4a91-4a3b-3193-08dd182eab16
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:51:27.3820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8bplk6QTtgWHjG1igMO/eL20XBOm814SQHEcsb/i2EFVyUbdTkbxIPTAS2cYPYYocHj0C9tMOf0KlZYURuLt7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7370
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

--_000_DM4PR11MB6312F0A6B901999CD2B28545903C2DM4PR11MB6312namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Joshi, Kunal1 <kunal1.joshi@intel.com>
Sent: Monday, December 9, 2024 1:36 PM
To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't unp=
lug multiple times

Thanks Jeevan for taking a look,

Apart from this it looks good to me.
Reviewed-by: Jeevan B <jeevan.b@intel.com<mailto:jeevan.b@intel.com>>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org<mailto:igt-dev-bounc=
es@lists.freedesktop.org>> On Behalf Of Kunal
> Joshi
> Sent: Thursday, December 5, 2024 3:11 PM
> To: igt-dev@lists.freedesktop.org<mailto:igt-dev@lists.freedesktop.org>
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com<mailto:kunal1.joshi@intel.com>>
> Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't
> unplug multiple times
>
> chamelium_reset_state will unplug all the ports, prevent unplugging multi=
ple
> times
If this is fixing any issue ?? or Just a clean up ??
>
Yes  this should fix xe#3505,
Will add a Fixes tag, let me know if any other issues,
Will send all together in v2.

Thanks and Regards
Kunal Joshi
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com<mailto:kunal1.joshi@in=
tel.com>>
> ---
>  tests/chamelium/kms_chamelium_hpd.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_hpd.c
> b/tests/chamelium/kms_chamelium_hpd.c
> index 52e758087..76a691043 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -329,10 +329,6 @@ static void
> test_hotplug_for_each_pipe(chamelium_data_t *data,
>                              data->ports, data->port_count);
>
>        igt_hpd_storm_set_threshold(data->drm_fd, 0);
> -     /* Disconnect if any port got connected */
> -     chamelium_unplug(data->chamelium, port);
> -     chamelium_wait_for_connector_after_hotplug(data, mon, port,
> -
> DRM_MODE_DISCONNECTED);
>
>        for_each_pipe(&data->display, pipe) {
>                igt_modeset_disable_all_outputs(&data->display);
> --
> 2.25.1

--_000_DM4PR11MB6312F0A6B901999CD2B28545903C2DM4PR11MB6312namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> Joshi, Kunal1 &lt;kunal1.joshi=
@intel.com&gt;
<br>
<b>Sent:</b> Monday, December 9, 2024 1:36 PM<br>
<b>To:</b> B, Jeevan &lt;jeevan.b@intel.com&gt;; igt-dev@lists.freedesktop.=
org<br>
<b>Subject:</b> Re: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: do=
n't unplug multiple times<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif;color:black">Thanks Jeevan for taking a look,<o:p></=
o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Apart from this it =
looks good to me.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Reviewed-by: Jeevan=
 B &lt;<a href=3D"mailto:jeevan.b@intel.com">jeevan.b@intel.com</a>&gt;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
<div id=3D"divRplyFwdMsg">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; -----Original =
Message-----<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&gt; From: igt-dev =
&lt;<a href=3D"mailto:igt-dev-bounces@lists.freedesktop.org">igt-dev-bounce=
s@lists.freedesktop.org</a>&gt; On Behalf Of Kunal<br>
&gt; Joshi<br>
&gt; Sent: Thursday, December 5, 2024 3:11 PM<br>
&gt; To: <a href=3D"mailto:igt-dev@lists.freedesktop.org">igt-dev@lists.fre=
edesktop.org</a><br>
&gt; Cc: Joshi, Kunal1 &lt;<a href=3D"mailto:kunal1.joshi@intel.com">kunal1=
.joshi@intel.com</a>&gt;<br>
&gt; Subject: [PATCH i-g-t 1/2] tests/chamelium/kms_chamelium_hpd: don't<br=
>
&gt; unplug multiple times<br>
&gt;<br>
&gt; chamelium_reset_state will unplug all the ports, prevent unplugging mu=
ltiple<br>
&gt; times<br>
If this is fixing any issue ?? or Just a clean up ??<br>
&gt;<br>
<span style=3D"color:black">Yes&nbsp; this should fix xe#3505,<br>
Will add a Fixes tag, let me know if any other issues,<br>
Will send all together in v2.<br>
<br>
Thanks and Regards<br>
Kunal Joshi</span><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">&gt; Signed-off-by: Kunal Joshi &lt;<a href=3D"mailto:kunal1.jo=
shi@intel.com">kunal1.joshi@intel.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; tests/chamelium/kms_chamelium_hpd.c | 4 ----<br>
&gt;&nbsp; 1 file changed, 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; b/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; index 52e758087..76a691043 100644<br>
&gt; --- a/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; +++ b/tests/chamelium/kms_chamelium_hpd.c<br>
&gt; @@ -329,10 +329,6 @@ static void<br>
&gt; test_hotplug_for_each_pipe(chamelium_data_t *data,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;ports, data-&gt;port_count);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_hpd_storm_set_threshold(=
data-&gt;drm_fd, 0);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; /* Disconnect if any port got connected */<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; chamelium_unplug(data-&gt;chamelium, port);<=
br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; chamelium_wait_for_connector_after_hotplug(d=
ata, mon, port,<br>
&gt; -<br>
&gt; DRM_MODE_DISCONNECTED);<br>
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_pipe(&amp;data-&gt;=
display, pipe) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; igt_modeset_disable_all_outputs(&amp;data-&gt;display);=
<br>
&gt; --<br>
&gt; 2.25.1<o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_DM4PR11MB6312F0A6B901999CD2B28545903C2DM4PR11MB6312namp_--
