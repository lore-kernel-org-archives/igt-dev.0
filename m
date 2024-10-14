Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A03CF2590
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 05:41:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BB210E21C;
	Mon, 14 Oct 2024 05:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S5v67FDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909510E21C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 05:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728884500; x=1760420500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jTCxFUy2gLlXKDFFNU4YhfVS1dbhLA5kshhPYoUmSZ8=;
 b=S5v67FDmr9Enu/I89JgUPvB1sqDm3ZgD7jP3Mh66zFZ77/oXGGh5ehY2
 cMwulGg5g8CqCCtaB3uvR3zQTFUFFMbheAiBjn5zmpJJCxMlRcVitfPix
 zAcHC1Xmnlv2PgllsAK9FjlT/jLw3+0ZyKNtK0atkxHlhcLIddhCW3THe
 nfkhIpVxaySLciCfOpeTp2M7dU/D5RhyqupXqVU2eQIObb7JY/XM0dBY5
 4mLqdGTI6aYDQS4J20PNrrBOZG1TOeyzb84PeYYKUoSaWMO3synFRCtYB
 BIClacTugO9abcvGHJz0omDPVgz1ENi2BDPheBl5D8alfhbkD6zTGFN2C w==;
X-CSE-ConnectionGUID: bQ/H31tlR0WweFP2h1p/kg==
X-CSE-MsgGUID: fusBnXdmROSw0THqEJYTXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="53637579"
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="53637579"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2024 22:41:39 -0700
X-CSE-ConnectionGUID: mBAkI6ioR2yqAgAxElVq0Q==
X-CSE-MsgGUID: IQm+R0KtTqGBrqE8E93MHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,202,1725346800"; d="scan'208";a="77919045"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Oct 2024 22:41:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 13 Oct 2024 22:41:38 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 13 Oct 2024 22:41:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 13 Oct 2024 22:41:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvPjbNRuX6lkrjoZAE088QlkS9KgLpmKkUSurojKEhvXGKLde9t+uuA9O1RGjvbXLjPNFAkGNQuLqeGDSGe1l0JNere1CB7UDWVG1qONb92epD3hmwo8KJFqvk6Opz1jjqPWMJ2qsyOfhgVv/CcTFTtYRKY6iyiPHL8L7mlw4LvB3CwnO9wFFxsouDJJ33vCHnKaShNE2sPFYKFpK2ea0pQTMNxAhM5Mvx0cXxTe3nlKiwISNVy8NlUBr/A7CSeq3YGJdVGGUf/qi2SKmh3Lw5mtc8HhVeiynvxsJVUFtMBvpGriqwdt8FSthOk1Ui6dRLPdg7x6Q7VtF98qz85QTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDaShofFB56Vzgpxx6pP3pu6LTHLMf6ir6iR3eOKEYo=;
 b=DYw1hKS53QzHE+7wq+czxZfbd7z7yrjiaiS3g7C/Ie0NTeUvpGlZxCxUCNVB6m8sGq0YOMB5VZNpZRbcIXJFsIBitk2OOSLuG3AMcMSfzmiCSUsDFVyFDlR8VoSbhKJ5jLddo7q2S55wqTgwQU46I1NDRkk89OM8GCamftaDI2V9Kq35F+ZT5XUCNnfBeatQWrhkJpZ+c9iDP7ODx8YX07TV5e8kCT0f9Fknh8l3hbAzDYk7DvJ5fdL6PP6xxvSxbRhppuNYaTRqGUGxyP3Nl/8iuT1mKeyW4l+dEgf8MNPSZrraaSlItnzcCVOp7PodIgQ0LrEPIXefbKcOq5Af4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by IA1PR11MB6241.namprd11.prod.outlook.com (2603:10b6:208:3e9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 05:41:36 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%2]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 05:41:36 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Modem,
 Bhanuprakash" <bhanuprakash.modem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v1] tests/kms_flip: Assert with twice of frame time while
 waiting fro vblank
Thread-Topic: [PATCH v1] tests/kms_flip: Assert with twice of frame time while
 waiting fro vblank
Thread-Index: AQHbG6Wo6RYZmtw5vkWMr1nsp+we3rKBUEgAgARgjPA=
Date: Mon, 14 Oct 2024 05:41:35 +0000
Message-ID: <IA1PR11MB63481952BD972B3C2E4CBE08B2442@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20241011062147.1956995-1-mitulkumar.ajitkumar.golani@intel.com>
 <Zwj2NjaQ4N5zH-HU@intel.com>
In-Reply-To: <Zwj2NjaQ4N5zH-HU@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|IA1PR11MB6241:EE_
x-ms-office365-filtering-correlation-id: 4991ec20-507b-480c-0e97-08dcec12de21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ykTvXrdSViVguJvnNYwGoXcFQfQt7l16mBvVPfosvhdH3AoSzKd29XSxjh?=
 =?iso-8859-1?Q?v6sGZUZ+1ar/oGW66nVlq7k3oeMKfTYN8aPlQomOZk2LaWxHNSmgiybrBk?=
 =?iso-8859-1?Q?fudQWheCKRRUkepobA1Pa/uVJNEs7ngufdfEUy8b0lCyAMs7QNUa8qqWBu?=
 =?iso-8859-1?Q?FNYWFrQ6nmr9FgyOV5Jogt7geelIZIuMXyf04G5SWktE874oe8kIxiB0Hg?=
 =?iso-8859-1?Q?qn1Grlrz5vPmTmuyq4WxB3ywXX3ww6MIEhFtpByEFRRNpDyLAVvNdLpc/b?=
 =?iso-8859-1?Q?GoaTFIuQBwWMytrS+nphNJs3AoMlChSwPaB7gr2TZXxXWQJrPKMIO7gtvY?=
 =?iso-8859-1?Q?NYfNaAhOSgod1gkpsFnO0TUGlL6y/TAS6eU3YUuFTXCSORe4yJMjnYhj3m?=
 =?iso-8859-1?Q?Jl+O+WD/DUSqFeQpC3WPZyZIy3B4FMf/b0UI4SSVF5X3+tbRAHO29jHqFn?=
 =?iso-8859-1?Q?CL1EoSRv76lENfLFRKFPhMBvk4GImHiJRh/Db9utGnNCaOWZyO3DL7VfG0?=
 =?iso-8859-1?Q?v3/Ieekbh1nT7ycuxDi//IDWRi9XS37IQIhtaCbxJZjg8pedmnFF5MDdKb?=
 =?iso-8859-1?Q?Z83knw9689RyU3C3sxAb0Zu20KU93qK9KtET1nbVjxqNCa512iJ8BS5L5T?=
 =?iso-8859-1?Q?UXt+xgpxNtSjgqHH4UqerVBhG8BLHj0oIuiNf2mqJUhYfZAjAZt85tVKWg?=
 =?iso-8859-1?Q?36hN0CX5aS3SjiajcaeGrZQvTaDPI98mRA4h4y1Ki45kV2eTb5xoixUxl+?=
 =?iso-8859-1?Q?I8noOEIqp39qRynVVqToNOOEpedD7wIDxsRCvp51dZgj2ubrtUC/P8vGob?=
 =?iso-8859-1?Q?YIIU8dSGr2yHwaa0pxNytg/xWxJlbdtZQ4llByGYJPxlbxyCMqYoki0htG?=
 =?iso-8859-1?Q?/lz5amQyGLdTr2/usiJ+1+sM6ddKFgVlOoeDN2C0SfVuAi8Gz3dOcQw9xB?=
 =?iso-8859-1?Q?QWFHFaXkkX+HqXu9deHrKLEwNr1afNWkLxPY5AIOf03zOorrVqD2Nj9ez3?=
 =?iso-8859-1?Q?dNwPyV77OXgbO0vd/Mr1dpUarMlkNlRzwnn2TeduZ4QCLXGMuuR6m5X4yV?=
 =?iso-8859-1?Q?DUPVWcRURMPTMjK8tHPtKfV6lPo1ElEqgbJTpsua/sONxgvVNAMik1XuS7?=
 =?iso-8859-1?Q?rcidpfYlqoZGpF9yA9aISFGL92HI84ik8sFR9c72KFQUb/iabJX81RkQ8X?=
 =?iso-8859-1?Q?HjTOg5HGKyZBnv+Al5rNOT402axij+sXB1RnttPBw7cipcbZuZj/cDAJV+?=
 =?iso-8859-1?Q?Gyp7I95r0xsE6J766scWzuBOaaa50X4OhNsvorO+QX53raqdsG3A6a4Tdf?=
 =?iso-8859-1?Q?OhhkWntuJo18NZObbb8lE1T3coaYxxjvOn6Xspd3diGyIGkR2l/LA7QJu8?=
 =?iso-8859-1?Q?Z/INWJzA7rxszhnapgu3EA/9beSwaCwA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?86dxnFhaZ+xuov5ziKVg00CGCOB5GUNvH9uj+cJXR2dWt05twHUBDlRODJ?=
 =?iso-8859-1?Q?fXyIqJi52Q43wCIShO7yrwLfk4nWdf779P+CKxH4cKiwSOnKTwEiIOTO8Y?=
 =?iso-8859-1?Q?r7Lp6FSKzEUNVx2/dMTS6Fp3COOtm2jq+dgWFaJRfb3XH131PrEUj/7fBE?=
 =?iso-8859-1?Q?LCGpxU24oVkdMWd/IwKyGAPhqHIklH9gWsWB+DegBRiiDl3dp86i3OaOFn?=
 =?iso-8859-1?Q?vBS69q0+XpKVxpxJA7vjEI6IMOj4OVVTLlyDAxfV+pqnNoyPvs6X3+feAc?=
 =?iso-8859-1?Q?vTDqv8/AdhOokLh8FlUgeorTJEde1lwQejBA7Zmu32wVnlk9BHYcYmaVnB?=
 =?iso-8859-1?Q?ma8P6RJdSsrPI1rb7AOup6425UFiNFNW0SMmCBsZkdDLr+wQAUrT1VyQ+/?=
 =?iso-8859-1?Q?gJr0HO4keSqbj01sCR+vpZNFYSTzTKLO49f9o6ie7v/Jqd/n2yEl3ZoBwb?=
 =?iso-8859-1?Q?90rzkwS/69WX9SMwZ3YFSUw2jpy4Tj/RPS0bB4UUrAlCiIjxGJ1UrwfJYJ?=
 =?iso-8859-1?Q?nnWFAnxgH4sq7ZJxGN0Fw9ucgqUFwraBjxH47tYSibqaodY2VlQ3FQGsth?=
 =?iso-8859-1?Q?Qm2R5Nm1ijF6WKwWCyeHyXt/e3UkAqeosWO57kBnljrLBGWIiKw+SGBnOT?=
 =?iso-8859-1?Q?eGvWkz/Kp9mOSAyk/cZgiWYMCSs5EoMGOjVLgf7GqIFvvEgkPk7Fq+Tp+Y?=
 =?iso-8859-1?Q?0uF3wDqsLB9k1W1uqCfQuWZajQMAgVtVExraf29W81W6m88fQLvonqPzWc?=
 =?iso-8859-1?Q?OO5WaJbQZC4aTxE8FDFm8djyOXjSdZTk9q21XCic04DtHJDInMSVE5jHd2?=
 =?iso-8859-1?Q?51g0/VuiZoTpE3mZyRp2IQwvGWYt/ToYkdttGtYLL1KgIhumFGRQA3e5N0?=
 =?iso-8859-1?Q?xR4ylypDPgczT0SpfOiZw9BXsWbXXqAe1XcTWqBS2aGj1wXiElM2pVySFD?=
 =?iso-8859-1?Q?vFGNjZcNpDZbDYTZWuoZzkBwll+yWRYZ1ZqiMdqfA20cQ1vgfDvw7i2Taz?=
 =?iso-8859-1?Q?NbcR4Fu633Vx5wFeepZGj4ZkHleTGhnifqvyFqKmGyCA5s/kjsbLRoyXBs?=
 =?iso-8859-1?Q?+yg9Hv4w3lwGPuQ8cSUegWgu3vaLQfogrvEkqVLvRBVAiEYnWJOMWWb1UW?=
 =?iso-8859-1?Q?3f0j/TtA1cUkMXUnpGpom6niCLNZSIc4J0MDqX9yijIi1Wd71IAK5+ixVE?=
 =?iso-8859-1?Q?X0MqtABlxjKgK3eboAWv289oLyG/tDHkDRWRkCDZn3lZTkbsU2gXYEVWr9?=
 =?iso-8859-1?Q?mzQwYzHfY3bC6CHj8RpJSNg/gsMT8UuMiOLjHFDyatOFRQpzo8PCaufzgl?=
 =?iso-8859-1?Q?V0n6eytonABKt9Z2WaDVFlFA35v3CafR97kSrlmLa+OQQhkIFG0vIWXqb6?=
 =?iso-8859-1?Q?RACUxhcXpIGLcVh0SXRV2nSEq/Sp3o5uo2RX7+fUvIV9YvANak9n0ekEBt?=
 =?iso-8859-1?Q?6Lwn1YeSE9sO96VgcM699jNsB7pN9SYyrdPvewUIjFfInf8rm510KzhVci?=
 =?iso-8859-1?Q?Bc5OJt3x3uFvpvnvxeI+ea2dn5IO/ZOgxd93CYREa1FLDMVTG970eGhk+X?=
 =?iso-8859-1?Q?OI4G8JLXznzgjVKO71ObGXOKeU7Yj1ksGUkAQ2xosDNClIyy0ylIHlSWg4?=
 =?iso-8859-1?Q?zB9nikYNKUSY+u62jWYkJmTyLS80QKsGCr6dO6zvmZy7UybR8rBNn8/UdH?=
 =?iso-8859-1?Q?T2BtPBdl4ImjLjAesSQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4991ec20-507b-480c-0e97-08dcec12de21
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 05:41:35.9562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dr0dNjK09x/yxa0qnDr/iMtLIdW4cSMU05ZUwHsVchZSQggTnmygfzLyxJYuX1BRBWtv80ouwKeEgLm6TFGoXK2JL+cG1vRbEu4IwTBayRCuloUzAm6QCOXu2BdF/WUX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6241
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
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Friday, October 11, 2024 3:26 PM
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: Re: [PATCH v1] tests/kms_flip: Assert with twice of frame time w=
hile
> waiting fro vblank
>=20
> On Fri, Oct 11, 2024 at 11:51:46AM +0530, Mitul Golani wrote:
> > Instead of hardcoding to 500us, wait for twice of mode frame time
> > while waiting for vblank. Motivation of this change is to remove hard
> > coding of 500us, which comes out to be more stringent and ambiguous vs
> > changing modeline.
> >
> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> > ---
> >  tests/kms_flip.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_flip.c b/tests/kms_flip.c index
> > cbabbe74f..decffa961 100755
> > --- a/tests/kms_flip.c
> > +++ b/tests/kms_flip.c
> > @@ -921,7 +921,7 @@ static bool run_test_step(struct test_output *o,
> unsigned int *events)
> >  					    0, &reply));
> >  		end =3D gettime_us();
> >  		igt_debug("Vblank took %luus\n", end - start);
> > -		igt_assert(end - start < 500);
> > +		igt_assert(end - start < 2 * mode_frame_time(o));
>=20
> The test is literally called TEST_VBLANK_EXPIRED_SEQ, which tells us that=
 it's
> expecting the target vblank seq to have expired already, and thus the res=
ponse
> should be "immediate". It doesn't matter at all what kind of mode is in u=
se.
>=20

Hello Ville,

Thank for pointing this out, you are right I mistakenly overlooked the crit=
eria "!(o->pending_events & EVENT_VBLANK)"

In certain test failure cases, the assertion indicates that the vblank exce=
eded 500 usec. However, based on the drmWaitVblank event logs, the vblank i=
nterrupt occurs within the expected period of 16.666ms for a 60Hz panel. Th=
is suggests that the vblank is not actually delayed from driver. Do you rec=
ommend any changes in igt to address such delays?

Regards,
Mitul

> >  		if (reply.sequence !=3D exp_seq) {
> >  			igt_debug("unexpected vblank seq %u, should be
> %u\n",
> >  				  reply.sequence, exp_seq);
> > --
> > 2.46.0
>=20
> --
> Ville Syrj=E4l=E4
> Intel
