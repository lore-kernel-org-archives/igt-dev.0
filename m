Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021B2C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A2D1113D87;
	Wed, 24 Apr 2024 20:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KCKdNPvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1174113D89
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713990108; x=1745526108;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Fg47Tupy21nePF/7Lxjv3+S+tQkHRvfRSUaGUwuvzhg=;
 b=KCKdNPvBkYd2hTxlx3P8JcIKGYoD/y3Xvhw2HlIBTiR6GbtpGbFF5rFU
 S1WO1AEwwmFEVS/r5/IpLU0vb5GaE4XlT1+EhQoJMNlt23I5RIfTrO4kV
 UMTqkvrdmWM3y9CKHGdry5NcKlS9tR7tAlS5n6XEwsg0cdAHoAkqLFJhf
 xu48mOdjGoIom9qDmHszbbkks+QHo9MAfsNaR3Q5VxjfN01XphR9PaAbm
 2vgIY6CGh22tayNdw0uaoqgUIXeP2JmPGXJ6NAbQR+6wWL9bRzjQSmD/a
 ukOUEiRQvD6ZFWG513A/nwn63kbOC0z37jGZBcF6GMz7udxk0NjsyMd6Q Q==;
X-CSE-ConnectionGUID: cIm2HLcsQmKQ0jxDbLnpig==
X-CSE-MsgGUID: xBHfmrELSQSyTQ7Akz5gjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="10180568"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="10180568"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:21:38 -0700
X-CSE-ConnectionGUID: Xaj69fQrSfSZhYnGniVADQ==
X-CSE-MsgGUID: Jwuhy3YuThePLlB6EC53bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="29462376"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 13:21:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:21:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 13:21:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 13:21:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QeCQCe3WG3TnHUg3DqjAkFYo5XwYgq94wR370k21EXZQRtGgUNVA/Wtt6kpJXZk1K2pKkUQ/JmxgIDU8Sh3rqPI1kBryxtSNCSwNPgoHGvfGym8mG756eezMSXp8NvH8RMG4JoDkR+q524el626HKYS0rfJMbPwOu64YP3PdJW9btjyAU2AntDSLQaJKVYzSj54UgFm7r4IL3+fc+aAHft19ZaSq7x4PtPeHxbWsyw2qjsI0U+7YLv+WzWyBA1K82DPMhZcjsZq4zrQqA/eakpIm0720H6m8nwC0IjpF4vLSVR0thOKfDeWqVhQzfvU0/GyvT4TjwnpeijggTxkAKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQ/tWAa02c8650uSSXqqJ/H5pld7Jf1AFaBn5Lv7gvo=;
 b=eBTAAlJSqAIC5INYrSGNn1tfoSmrOGv+PnpSEX64MqNATyScx7/kEtx7+auj4eVip2dhBPIbZcfCj553MiMe0kZOBpNg32guC2lbjASpcQuwT2mcaULS82Ih17cj54m7yY09xm4RQ/iP2LIEk4GCU04TssYAYIxsVmwM0v8JSprW/OBDHoQklYtj4ksPltcx3Gy8nZzSIa1lQFtjhfZ5UMa0G7ctyS6QxXpn2gzOLER8K1U0YVZ/B8Ve8HcR4w6g9xPU4MBa7P2c7btL1/wHC5EHT+SzR6M4zb0FYGPBU4gzvlg1za/KUh8lPXXi365SqHSCey1y0lNxTuE3s1IIiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 20:21:35 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7519.023; Wed, 24 Apr 2024
 20:21:35 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add mocs suspend resume test
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add mocs suspend resume test
Thread-Index: AQHae6H/R54hx7fdYkaAXS1YXnd5nrFER5sAgDPKuZA=
Date: Wed, 24 Apr 2024 20:21:35 +0000
Message-ID: <MW3PR11MB4748F2E0614AA89AB07F1BD1AE102@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
 <20240321151637.3320911-3-janga.rahul.kumar@intel.com>
 <20240322212518.GV718896@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240322212518.GV718896@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA1PR11MB5897:EE_
x-ms-office365-filtering-correlation-id: 6aee40f1-a3ec-443c-3158-08dc649c239a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?XzLu9O/gGOCSyCQKTTtnTZvpFyGSDBH8OMJ9IZdNNvzqw18OduNvDbqu/nMz?=
 =?us-ascii?Q?71tBgaGsETZyYWh1IStnd8dLW6qhiTSaqMEjY21km2mbC3Od9hcsw8Pwnq6Q?=
 =?us-ascii?Q?FNDizlt/F67miNySRiqqocGRrItWK513JTm6+6cVyPuYL4+icQNEuKtXt280?=
 =?us-ascii?Q?fZPmoxFZnHd7Mv7edLURZeNlf1y8lSMwrEZi4o2LKs2TOWclHoUer3hvmLAK?=
 =?us-ascii?Q?mL5HDOO3XlseLfvm86z1CsC+nnNmYLWFK548HhYobln0BcvrsM5sMKl+uKx/?=
 =?us-ascii?Q?v5hRRfy2o5y2bUgbIgmfGrO48MevFetYGm53/bjIYpOUGHRs/CgdVB86jec2?=
 =?us-ascii?Q?ib/zgHe4pECwBvj3r4V4zbekGIuFYQ95jVGNV0oB6MCpMzmRnOOjmfUrAQlo?=
 =?us-ascii?Q?tTm67rRtR4A+n7UQkZYAj4Cj6N0xuKgvJWy1w1BJsbbM3dhYxZprhTZFJVXL?=
 =?us-ascii?Q?t6CjlC4gX4m6zyFuwpXDkSZpOPSdKHukmx1DAgAhGeonyj05RfCb9v/bLsDS?=
 =?us-ascii?Q?UebSkASY0sSTLAeui2fjwHqPEB4lRR8lSFPysY7CgY9hX5BPW/H4MWcHYkfV?=
 =?us-ascii?Q?S4Eu7eL0r7NXEL+rvK7E9CG1DtBIMdKC3XumlxsnjIbQ1G/8uEIQQuTOTQZc?=
 =?us-ascii?Q?OwBlhbU6XxBLA07OGVoUo9EY+PfIiIAkCq9R1RMvLP13X8N4tGx++hOia62p?=
 =?us-ascii?Q?xWCCMfh6ltvG1FF97WoFoO+PC+eK8HA3dIt7gmfX3K/Zn4szRbvNN39PERCI?=
 =?us-ascii?Q?ljvGALpiVU93MU+CK6PHIEDcMle2itNKm5pXgP3pflt0Zpxx0GB5MyGjilzQ?=
 =?us-ascii?Q?u2803vihhIsfKyh3WDOxRF58ZGEXiFGMLe1CxF7a4+TEXptNPdpgO7O5tJIu?=
 =?us-ascii?Q?HJzXPCZYErEPDGsKt/me1FTrFQeC0X+0h7EnsvckJXNPZS2TEgzh8egc4evU?=
 =?us-ascii?Q?ewSJe/v5BSexum4TA1DIBzcdWpNVkGHf4WE2UZAiH8D+3Phb/KY2otqZaJnx?=
 =?us-ascii?Q?wacSffHdBtpkIGeMaUrhkj1ECFrMkHm6iI7A+Tb4WWaTqF5+NjZs/bNKBo4T?=
 =?us-ascii?Q?H95VeN0lDz808OhhVlAr5y7LjBKI5DtaGeSP3ZPfMevZKNUyjSB/GnnoR22q?=
 =?us-ascii?Q?bdfZ4hfklXab0U9jhB6Qk1euF6zHL++uUtMT+pkW8mANnNEM9Ls+0221pHiu?=
 =?us-ascii?Q?tovJNwuZccVbE9Zg6FjNxzEDcqcbp+WbJyujDKRqcUiInnzXAK7UA2/UR+zr?=
 =?us-ascii?Q?SuR57ofBtsg/ZSPaTFsC5pPlnk7GxVPw6/xsW8bWvbS+oDU89On63XAltt7I?=
 =?us-ascii?Q?M4k/K5+xmEVcFOs+N+TRNb9lL/LnZhm8IFI+g3ljvjFwgA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I0e+sLEOGrzAZMvfdGWLw2QEMlGA7oExb4k0dpo975oHpxo08S4Rta8L31Zk?=
 =?us-ascii?Q?anUgjlI6metpqJOzbFLVK5Duu0KIq642onwjGd+CjnLxf7J3dRcvIGvCJ+2n?=
 =?us-ascii?Q?BMoumDWKAjp0dqxypxdHG+WIClCoo4xSAZiZ2d02NtLnI8gd3tkOLwLgp52k?=
 =?us-ascii?Q?ETetYgPinV0NS5KsMrdxsie6E7lFZ1kpRuocWp+doAq0IQVkwu7QXhDUs/jk?=
 =?us-ascii?Q?srjmerI+w8QduJNs4H47CArXirbB++8ozU9mTJ/GzmeVqM3AhmBKCaGDXYUQ?=
 =?us-ascii?Q?RCGOjhPL5IfmvUMIL9c7e1Y1vZ8Mshhc2xYJ0CmuUNtN1vCsUhLylbwNB9iF?=
 =?us-ascii?Q?M4sTNj5zCyZ6YXurNTaAzh5UdXigDWEE7491dNec9RnypHq8/WAKCcjmmjx7?=
 =?us-ascii?Q?O6q5lKxbaqVeOM1ieCK9OwNPvhM/YbrV+/Lk0lymS2u1OfPrDlXPIX8NSkKY?=
 =?us-ascii?Q?oL72Lj3QbatraVqzfmRa9iAPqbDa4oepHaSdclGHTAzLwaaYH22UwVWanGnt?=
 =?us-ascii?Q?sHf+E6TXh0Q4Uf0NbuGfoT7ZZCdpiKOJLeMzcbUCCWDIzd4G9CKNyF0oEeCe?=
 =?us-ascii?Q?jMOFJ5kl25pydkZQX9b69ilPsEJIkrBB3E0irPqcjaBQrATKViVW4gi+G/8i?=
 =?us-ascii?Q?HjaodeWd3iKzCVCrHukjokaT3d6E4HNGmFFNFV/UK4/dGWTuymN0wGxRE2HY?=
 =?us-ascii?Q?+kleaDyGPlUtXkkPSFNFvuhVL+jcwSwwn4IpTYJn3Fn47AzppEYsJPNcTiZG?=
 =?us-ascii?Q?7tfEfplvrQzKhCgSck4aW4/R3JTWAcra1g4VJA6J6OOZiNTF4FVY3Z1UV/8K?=
 =?us-ascii?Q?E6Tltpj74SYr5WZP8ELSn97hDKvQJsidrmiNEl0IaoIvTuuatTawBmTdBRfI?=
 =?us-ascii?Q?/lMWouk++IuTCbjez40qRBtG/+InjIUQTXV4M/qaCzyxOEj8sNmyi/2QrDj8?=
 =?us-ascii?Q?++M5LMJFHTzuL8PuDL73+kk2jb86snHrdWXXdYhTxVxB95IXPwV8oGK/10w8?=
 =?us-ascii?Q?JdwRWR5kzIGTde4HsqcXJF0CyUMU+2UTmVlHlpF0eLpzfNXqnvpvHuTChAe6?=
 =?us-ascii?Q?4qZ2mCQnrFnpdxxv76a12rydvaXd6SbVRS9NQxbcnkdPo+vlGJ297/iv20OG?=
 =?us-ascii?Q?VeMKDllDiwvz9HUBwGpIuUH7cbHy6XRiu1cKCbAl/+ZjE25moz2UED5BVoD+?=
 =?us-ascii?Q?ei1Aq61myEuklAG+PGL7b0lwYfFtppfzjcQiaIJ71dLaU1sUWAw45IMBzvjy?=
 =?us-ascii?Q?/7AlXuVOqXcQubOZgNGCK2pTJmHIQyxfLmHeJlT00Or/rbf1KNd6Vkdh0UGo?=
 =?us-ascii?Q?THZX+mVd2inCqogJKrHcwq4G4P1IdUQQVZe+lm1JybsNhbkug/zxXcD3ROxM?=
 =?us-ascii?Q?SUkVQwwuNP/NjR4lUS9xzZNVgU7iq7KQtlKwIauEXOlfvBGhZCMF0c7weKvB?=
 =?us-ascii?Q?93UWJoIu3dJiP53hSNgMwkZ8u/6IpC0sHTN2llJdm+E3Lp0c2/dpstR7XgLa?=
 =?us-ascii?Q?F2NWZ2WUMYYVq7uTt3zdyokU7Pd1uiqXiH6rMNL/aps56hgPTJ4zig9qQ0uf?=
 =?us-ascii?Q?ZV4XehQcMgHsxMbxQEcC2OztStnnACiH1LTE0UhH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aee40f1-a3ec-443c-3158-08dc649c239a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 20:21:35.4476 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XugwHQW4dZqAlC8G3P+XvCn6M/2vi2eDDLt7kErsCD+U98OXhk5bDap+QaYZU1aKRwkU03IKZffzmDKroaHNr1saIxkdHy6X1m1pHMW4+Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Saturday, March 23, 2024 2:55 AM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add mocs suspend resume=
 test
>=20
> On Thu, Mar 21, 2024 at 08:46:37PM +0530, janga.rahul.kumar@intel.com
> wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > Add test to check mocs values are retained over suspend/resume.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  tests/intel/xe_pm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> > fcbed6249..0761d59c4 100644
> > --- a/tests/intel/xe_pm.c
> > +++ b/tests/intel/xe_pm.c
> > @@ -560,6 +560,45 @@ static void test_mmap(device_t device, uint32_t
> placement, uint32_t flags)
> >  	close(fw_handle);
> >  }
> >
> > +/**
> > + * SUBTEST: mocs_suspend_resume
> > + * Description:
> > + *     Validate mocs register contents over suspend resume
> > + *
> > + * Functionality: mocs
> > + * Run type: FULL
> > + */
> > +static void test_mocs_suspend_resume(device_t device) {
> > +	int gt;
> > +
> > +	xe_for_each_gt(device.fd_xe, gt) {
> > +		char path[256];
> > +
> > +		// Mocs debugfs contents before and after suspend-resume
> > +		char mocs_content_pre[4096], mocs_contents_post[4096];
> > +
> > +		sprintf(path, "gt%d/mocs", gt);
> > +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> > +		igt_debugfs_dump(device.fd_xe, path);
> > +		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
> > +
> > +		fw_handle =3D igt_debugfs_open(device.fd_xe, "forcewake_all",
> O_RDONLY);
> > +		igt_assert(fw_handle >=3D 0);
> > +		igt_assert(igt_get_runtime_pm_status() =3D=3D
> > +IGT_RUNTIME_PM_STATUS_ACTIVE);
> > +
> > +		/* Runtime suspend  */
> > +		close(fw_handle);
> > +
> >
> +igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> > +
> > +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> > +		igt_debugfs_dump(device.fd_xe, path);
> > +		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
> > +
> > +		igt_assert(strcmp(mocs_content_pre, mocs_contents_post) =3D=3D
> 0);
> > +	}
> > +}
>=20
> Assuming xe_pm has already ensured that anything else that might have blo=
cked
> runtime PM is out of the way, looks good to me.  But should we also test =
S3 and
> S4 as well rather than just runtime suspend?  Those follow different driv=
er flows,
> and it's possible a driver bug could cause of to fail to reprogram MOCS o=
n an
> S3/S4 resume, even though runtime PM resume works okay.
Sent v2 with S3/S4 s/r state.

>=20
> It would also be good to extend this same pattern to other kinds of non-P=
M
> MOCS tests as well.  E.g., for reset IGTs it would be valuable to have su=
btests
Will send a separate series targeting reset and engine hang/reset.

Thanks,
Rahul
> like:
>=20
>         a =3D capture
>         trigger engine hang & reset
>         b =3D capture
>         fail if a !=3D b
>=20
> and
>=20
>         a =3D capture
>         trigger full GT reset
>         b =3D capture
>         fail if a !=3D b
>=20
>=20
> Matt
>=20
> > +
> >  igt_main
> >  {
> >  	struct drm_xe_engine_class_instance *hwe; @@ -701,6 +740,10 @@
> > igt_main
> >  			dpms_on_off(device, DRM_MODE_DPMS_ON);
> >  			igt_pm_set_autosuspend_delay(device.pci_xe,
> delay_ms);
> >  		}
> > +
> > +		igt_subtest("mocs_suspend_resume")
> > +			test_mocs_suspend_resume(device);
> > +
> >  	}
> >
> >  	igt_fixture {
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
