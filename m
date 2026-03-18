Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EF3FCD0A7
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 04:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF34510E72B;
	Wed, 18 Mar 2026 04:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7Hkousj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C2EF10E72B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773808963; x=1805344963;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OIHfG9mYQfTiwY1DePqODfaQemTICX8sABnlmA5K1qI=;
 b=X7HkousjqqwBowXmylbbabyorSNfBAM8ocqBwAL6Wdkpg951mkcgr+Zp
 8Ssycb4XWS59P2pclvLEYYupXWk6tBwa7aFtynFZp8EkIU7c+4Gqho5m3
 RAt7KshiTloLqlLgCJNVJ3hbRanepqKSOcyCagvjwm5MlIz0mtaWMcBdu
 0UChcIeGphzj1QpE2oTVh5ST+DXmhxcTVQpO4YenTKyk/4s+ATT9aAlvY
 5U3I/VNPOKMFpgQlRfCoMDttiEUEc4hlfH6M2J3txcRH3mYnTFBChUHE6
 HawJ30Mutoy73/ttWjdgp3Vg7I47ZXfVnk2D1AZzoE596CzuxqhDRJS/v g==;
X-CSE-ConnectionGUID: MPdCELtIRXCW7t9hRsrB5w==
X-CSE-MsgGUID: WoeuTk2KSzqP15qMneAqxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="100316747"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="100316747"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 21:42:42 -0700
X-CSE-ConnectionGUID: TC7r7L59QquT6TRGcwjidw==
X-CSE-MsgGUID: /Z4FEDjvTOecCXBSAt5/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="221713913"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 21:42:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 21:42:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 17 Mar 2026 21:42:40 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.24) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 17 Mar 2026 21:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLZkB/KKMHaxQSe5gdmtVB8Gq0WrfcWr35cNeDBYuQBPGFSgGq2BRVeHssuIcrTfDUqQEinbxoI1xgkvl8Y3CZTeWP9ktLZyxRlV5PHI5WUKU6u0KIaa0gd/VAjrkc0WG5Yhd5MaFmG1qkAYxd7BlVAiHaEBlaAE52adjFScRUvp9xLAKPvgHu1x/q1fB8ZtN0bjj+28+awZHYntqhpspdGeVQw/MOQ2cZHL9BwCHUlZlhJudeNIwh0VQBwUEud3NHFBN5DVl1oWp8/wryBhav4PV1ahb30gClwXuZ6+Do1gLse7oneU6UrzektruKt9GmS+ypA7JUxML+0UsQQ3HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qoeH7hbY+A1qlCJT8EV/5wlH7sFOLmMWiyV6Be413xQ=;
 b=dgP0yxAyxm80vKemKpbl/kWsEVwgyvKq3Us1hV22TXHEic+PTsvEhZCMqk85P0vSIvmhGOfPtfUnWyc5bOmgYDaSx4DgcrYX+/h0Az7Z5Td5Oxqpu/JDJ/vHibhPDsR8tFVU8r76Cay0QlEGa2QasJNLABfYbEKSP+AtVnbiRZOnVpx01w7m8MNb8x707ygsNuHNPw1BVl/nL4We0eLhmgMq9X5U9f8zq8amCusvY9DHdUuOILb85vpdfRBrixJSru+yiA+zHOX5QTZXYmcxcdG0ZWmJFxcBnfSPpqQAKbM3V1ImgHtTa8B/AjeFoNKO/xMgJnFqjh7NtbRWMyedRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 MW3PR11MB4761.namprd11.prod.outlook.com (2603:10b6:303:53::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Wed, 18 Mar 2026 04:42:38 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 04:42:38 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Subject: RE: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported
 scaling scenarios
Thread-Index: AQHcteD/01Rt03qCCkO3ZHOMzG0pXrWzs8oAgAAB2xA=
Date: Wed, 18 Mar 2026 04:42:38 +0000
Message-ID: <DM4PR11MB63120BF6F248C08DEE528E13904EA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260311074036.219075-2-ramanaidu.naladala@intel.com>
 <20260317073842.713155-1-ramanaidu.naladala@intel.com>
 <PH7PR11MB6053B6D3D427BDD02B7556ECE74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB6053B6D3D427BDD02B7556ECE74EA@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|MW3PR11MB4761:EE_
x-ms-office365-filtering-correlation-id: 354a1b92-3e13-4efa-95c0-08de84a8c835
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|56012099003|18002099003|22082099003|7053199007;
x-microsoft-antispam-message-info: DkzO5HmyHeYeRyKj/Vh/bjZ2SgJ3TlzNptIO5zQOBthaMgPBGX+KwzUdT9fUIRagwlyWUdvZNrkNHmQBhxufAfXzqECqUGrnW1rKfvP7SjXu4kgg2GryowT5qjTBUtFnqHdnI85HAcOBZbmulkcI5q90wue5pLM8xvbscq+3BpU3wHEj0MHq1slxbmjpgDs2RYAIezAUTFt/Jfax96MjwGrmK87RnY4Zw9fj05+t0AM2mGv3bfnh7b9Q4pjLniYcYO5a9e5pJx/s5mxabr8vqD+lKn1vYQ1aYD+Dgs2iZRMgF/qyLPPwxUOQ32rw8py2HQ+46Oc3nGmqtjPakmjmwpKbFd7ebt0cYBK7aB2QPkhUmpx9et03B/f16SmnfpxTe+OUib+UBIAI835kdo0z4TezToVjAHuNqL8bDIjXm1YY8Y7zb74226RbE+O1T3NsXkePb5sNxxgFgCwXzR/785aXT24FaXzgbS2wnIg1rQC+zcRdCM1NiQOMSH1PAzVys/KXz/V7WZlovQrb7gCF6I80Cnjguf5sQJ2qwqpWxoO8xQ+q1lucmUX7etekpCM0DQnpy4X8LCOeUoafe9hEuH7pOgxMa8G+EO7j7J7HkWCnQaeTGJ5gYa/IhrFImaTm9oj1VAL3FH1NVihWWQWRnx+4utbIbFv1mCCMTP9BspoW09w/hxVUejJJUlIjBY+tmM55eD1/90dMQgEcR6UGTQA11jPwq4Had/mbusHDpayq8U8kw1Hp9fEEVmhJffGUNZB67DdpmxvTgo8CVHO6WAXkQaybaEYA0E6mfQs2bj4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hdY7AFvo3lfT7MwIwisUhbvuIrhxoKS25ed0ebFtR4xU4WX6Am0Ny7w8JcHx?=
 =?us-ascii?Q?2QOkB5D9/ZuJc4E84VfRp6is8ASJbQSPwknIWVqXoYPNGfMH+T1ZlbeLHDfx?=
 =?us-ascii?Q?/wv1T++DZeRMn+MaNB5b60VQJ3bkJBoCYVcujzaPfMPWxY983fRyUqn77z/8?=
 =?us-ascii?Q?69gQtU/YybyOJAeS7/eyn7aFk5CX9X4WcYZPxRlF3PgMEWrVfrhECeJpwQRE?=
 =?us-ascii?Q?2GtHDQZt78T3fEgEPmlU6asOkQS65TAZ9K4+4Gqh52amU2GuJh7LHVe7AZYm?=
 =?us-ascii?Q?fXRpa8LDRocqiFa0rxkzQSRr14GlQ5wHvFEkNzeo5MXIhP4E3LtC2jyC6NYw?=
 =?us-ascii?Q?/mcyA4ZaB2Y9/O3uYZ3w3+DCDJBDSOELdZuQpPTkSBNgi3+s5BafBIJ8kJ58?=
 =?us-ascii?Q?UVwF7b1U+76ZQj1zVvZlcVqI+FwMDuFuEXeyItuOL41RZu28R7r+Jg+5mlRN?=
 =?us-ascii?Q?UWhksnHOMfOd4aTHAj6bL6Cz43t7ejlxjt7V8hTdqOUaG0tfs45+8sSfG8kl?=
 =?us-ascii?Q?5FLV4UlE3XK8F3xtvzRhDwRtMe9ONKrDiYOa9UFx+A9ptr31YbEczHScsbUX?=
 =?us-ascii?Q?PhhQoIEgsUzc1k1FmALBnu+Hi2AoCyYtpQvckIaKlKQtBwFEc+C5QMOjIlhr?=
 =?us-ascii?Q?jFhjBBNn8ZzROKGRqtR+CW7vEPXl/2EggPPZbt0N8a/OJiAj2Hr/xgRTFTgO?=
 =?us-ascii?Q?qQk8koFz82hAF+nyvJY5j69J1+ACnNs102rZlTLU1z6OVwtp7mCWrKkqpKut?=
 =?us-ascii?Q?YMhJ7Fza8l+ueftWUnYVB2IUjQO/57sS3p0LUWdWSZ8nnO7aLrHDHtaQ7wYD?=
 =?us-ascii?Q?MSVeimH9xMFB7mcB8oSzTUk9uiT4iy+h0Xsz7tFEUMLc9w2igTbT+2YX1Wwh?=
 =?us-ascii?Q?kuVc3K6dMaxYfr7G8EgJlBSM/FrlIwQsCa7CgjbS3W7H/7yxE9EbKh9ki2qe?=
 =?us-ascii?Q?DberQNcOxt3q1GDFjUfkb4mq+QNfB9R2ptILubiyuvWP2yRgt+oTZyxMUWdY?=
 =?us-ascii?Q?WwbrGACRAqBPRCTc7FtN/FLykPs7SYq/eWDyyFjh0Hu0WVUomyJ2R684qMV4?=
 =?us-ascii?Q?UTtoRSEI2B+5pIj7mTCkAE3wjt1LUEXz0pVjuXymRXZiuRYJAFSPJFb07N62?=
 =?us-ascii?Q?waEP5qSq6LXRMO1zQAFX7Ug2YvL6b3vhp+TewtvBF5i6q6kMhO4cdX7f+SRH?=
 =?us-ascii?Q?P7ql1Cf7uVDQKl6dDYWaooEtSgVpbgHUKBoiHAD3xH3NUkURzjRv3h0R4pL/?=
 =?us-ascii?Q?LAGiJzvz/EOoal6rznnIOrUHbHFv0i+qm9rowvJkxp5xuUzXNaSmRWlTeywD?=
 =?us-ascii?Q?6mULFsUmFdcDA6CxJ2Yi3AgPEsJ60jw6SUYbRijc+84NNMDBNdevlyOrsPW4?=
 =?us-ascii?Q?/FsEdIT0Qc/iqjNxcyDGxDquY4XQrYbtBp+tWVgIy4LZPjKu8ga0Zo6EeEJk?=
 =?us-ascii?Q?mdxFkPS6DLbYgxevJMSD0WuV+SqAVOA0M4RaW0gUWNUDQiKPMKeCcg9BdZlB?=
 =?us-ascii?Q?YOqcBw0u22G9YuR4Gx1xK2vorJJLwMzQNf7GIApgRyxbIT7GEHvGNjGx0QwX?=
 =?us-ascii?Q?vvB3OwiMfGIPE3jekkZlun4wno9NeWm5bLKZFLNvtMBZMgUFIq10dBWr8Gah?=
 =?us-ascii?Q?kzpV/6OKGj92oegiyR+0Ioq5ogcI6KYN1qsp9nnOoQ5KQdiH/8opgGJPkODc?=
 =?us-ascii?Q?XSfHvPGNgwYLYXo8+wDx8EIiR5bJzOrplE+1gCUJ3z7QSRUq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: kuuQAWQzjZqhDxAtqFHWJ5R0FTJQUadmVWmu+EatS6GXSLiNRZ8p22Waj995DOpQMwtrpwuR9fgz3IaJMutuQcw7GZtNCtAWpN4Y+LuvPdVMgDAYiyFmidWTexas7qlvBCabxSV4pgYGvoaIg/zJWUOZSHWw2MhjgHfEgkLwFZ/8da/za8KL7yn5/7ImcTQ2B6kM9A1zg6JgF5kaLC+Mz7JOL6WIa3QlreSzTsHKUkopV+q7LJwPysX81M03hfn+R6rBNV+2UQ06KAOGjnfbD9Vt4cn2nUsMcjGpbn0+nRR4l/GoEYjXxXMzy+j0wGMbB2Nem2u6AQ+8HzX6Z3/cCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354a1b92-3e13-4efa-95c0-08de84a8c835
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2026 04:42:38.1384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gw+Fx8IzU0JGGejdnOwehwW/YP4zNIGRR7bW8mJZWONXRz4d2N7kQ8Nf8JGmmTSpO5zAbDM58lr0lPmUGbs/Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4761
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Wednesday, March 18, 2026 9:59 AM
> To: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> <ramanaidu.naladala@intel.com>
> Subject: RE: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported
> scaling scenarios
>=20
> Hi Ramanaidu,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Naladala Ramanaidu
> > Sent: Tuesday, March 17, 2026 1:09 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B, Jeevan <jeevan.b@intel.com>; Naladala, Ramanaidu
> > <ramanaidu.naladala@intel.com>
> > Subject: [PATCH i-g-t v2] tests/kms_plane_scaling: Skip unsupported
> > scaling scenarios
> >
> > Skip unsupported downscale tests on Intel platforms, aligning test
> > coverage with hardware limitations and reducing CI noise.
> >
> > v2: Convert helper to issue skips for unsupported downscale
> >     requirements. Address review comments. (Jeevan)
> >
> > Bspec: 50441
> >
> > Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> > ---
> >  tests/kms_plane_scaling.c | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >
> > diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> > index
> > ab619fb2b..3e25d9743 100644
> > --- a/tests/kms_plane_scaling.c
> > +++ b/tests/kms_plane_scaling.c
> > @@ -533,6 +533,22 @@ const struct {
> >  	},
> >  };
> >
> > +static void is_intel_downscale_supported(data_t *data, const char *
> > +const
> > name,
> > +					 const enum scaler_combo_test_type
> > test_type) {
> > +	if ((intel_display_ver(data->devid) >=3D 14) &&
> > +	    (test_type =3D=3D TEST_PLANES_DOWNSCALE))
> > +		igt_skip("Required downscale not supported on scalar 2.\n");
>=20
> Here instead of using if with igt_skip, this can be simplified by using
> igt_skip_on_f().
>=20
> > +
> > +	if ((intel_display_ver(data->devid) >=3D 14) &&
>=20
> Imho, to avoid repeated calls to intel_display_ver(), consider caching it=
s value
> in a variable during initial fixture and use it wherever needed.
>=20
> > +	    (test_type =3D=3D TEST_PLANES_UPSCALE_DOWNSCALE) &&
> > +	    strstr(name, "planes-upscale"))
> > +		igt_skip("Required downscale not supported on scalar 2.\n");
>=20
> Same as above.
>=20
> > +
> > +	if (strstr(name, "downscale-factor-0-25"))
> > +		igt_skip("Required downscale not supported.\n"); }
>=20
> Same as above.
>=20
> Regards,
> Pranay
>=20
> > +
> >  static int get_width(drmModeModeInfo *mode, double scaling_factor)  {
> >  	if (scaling_factor =3D=3D 0.0)
> > @@ -1373,6 +1389,10 @@ int igt_main_args("", long_opts, help_str,
> > opt_handler, &data)
> >  		for (int index =3D 0; index <
> > ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
> >
> > 	igt_describe(scaler_with_pixel_format_tests[index].describe);
> >
> > 	igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].na
> > me) {
> > +				if (is_intel_device(data.drm_fd))
> > +					is_intel_downscale_supported(&data,
> > +
> > 	scaler_with_pixel_format_tests[index].name,
> > +							0);
> >  				for_each_crtc(&data.display, crtc) {
> >  					igt_dynamic_f("pipe-%s",
> > igt_crtc_name(crtc)) {
> >
> > 	for_each_valid_output_on_crtc(&data.display,
> > @@ -1404,6 +1424,10 @@ int igt_main_args("", long_opts, help_str,
> > opt_handler, &data)
> >  		for (int index =3D 0; index <
> > ARRAY_SIZE(scaler_with_rotation_tests); index++) {
> >
> > 	igt_describe(scaler_with_rotation_tests[index].describe);
> >
> > 	igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
> > +				if (is_intel_device(data.drm_fd))
> > +					is_intel_downscale_supported(&data,
> > +
> > 	scaler_with_rotation_tests[index].name,
> > +=09
Can we get this is_intel_device check inside the function itself like :=20
is_intel_downscale_supported () {
	const bool is_gen14_plus =3D intel_display_ver(intel_get_drm_devid(fd)) >=
=3D 14;

	if (!is_intel_device(data->drm_fd))
		return;

	if (is_gen14_plus) {
		igt_skip_f() conditions=20
	}
=09
Igt_skip_f()=20
} =20

Thanks=20
Jeevan B 						0);
> >  				for_each_crtc(&data.display, crtc) {
> >  					igt_dynamic_f("pipe-%s",
> > igt_crtc_name(crtc)) {
> >
> > 	for_each_valid_output_on_crtc(&data.display,
> > @@ -1435,6 +1459,10 @@ int igt_main_args("", long_opts, help_str,
> > opt_handler, &data)
> >  		for (int index =3D 0; index <
> > ARRAY_SIZE(scaler_with_modifiers_tests); index++) {
> >
> > 	igt_describe(scaler_with_modifiers_tests[index].describe);
> >
> > 	igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name)
> > {
> > +				if (is_intel_device(data.drm_fd))
> > +					is_intel_downscale_supported(&data,
> > +
> > 	scaler_with_modifiers_tests[index].name,
> > +							0);
> >  				for_each_crtc(&data.display, crtc) {
> >  					igt_dynamic_f("pipe-%s",
> > igt_crtc_name(crtc)) {
> >
> > 	for_each_valid_output_on_crtc(&data.display,
> > @@ -1548,6 +1576,10 @@ int igt_main_args("", long_opts, help_str,
> > opt_handler, &data)
> >  		for (int index =3D 0; index <
> > ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
> >
> > 	igt_describe(scaler_with_2_planes_tests[index].describe);
> >
> > 	igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name)
> > {
> > +				if (is_intel_device(data.drm_fd))
> > +					is_intel_downscale_supported(&data,
> > +
> > 	scaler_with_2_planes_tests[index].name,
> > +
> > 	scaler_with_2_planes_tests[index].test_type);
> >  				for_each_crtc(&data.display, crtc) {
> >  					igt_dynamic_f("pipe-%s",
> > igt_crtc_name(crtc)) {
> >
> > 	for_each_valid_output_on_crtc(&data.display,
> > --
> > 2.43.0

