Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA70CC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 692FE10E530;
	Tue, 25 Mar 2025 09:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLUwkaDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F93E10E530
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742894984; x=1774430984;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+2KNtZ955ON1lNe/klQwcMfX87U2QVC9KIFWl3J+h2U=;
 b=bLUwkaDWqHKugBZfR22AXWsbUFbSUhbmryqGSyY2dfyUUhdyNd0Xo3kR
 LCsUj2cFs2Fwzu0L4cftHJIU4TlYVRiDN3rtxJom2rl+lRL95R5ml2qu0
 shaxhvj/5GcwqEyBivFXvBKLk2tSe2QZ9hKLBMIGQmQIlIgKXEtF04Zzy
 DtIMFP2qZkBDncu1w9CIUM7J2QvNi6JHsSTQFFaXPDS26bS45coXElbVz
 VzVkG5p81D5ctTtr0hPdiwZRC5YmBc3w84zJM0QT+tZw2tbJJEFebL979
 5zl+Zfbj2khLZnyIGylR7HOlxQivfpNuqjyUXOGzUW0YBO7MnHhDe6C4O g==;
X-CSE-ConnectionGUID: DqngrMD/Q5qkcq6RZ2WDfw==
X-CSE-MsgGUID: wjXkbSMDT8+noQAr0n6WGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43289335"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43289335"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:29:43 -0700
X-CSE-ConnectionGUID: q6kAY+9MQqS8gjeRntNV8Q==
X-CSE-MsgGUID: ZBYk7VMWTCOfe7QVUK+KMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124352163"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:29:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 02:29:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 02:29:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:29:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrL6E0mjsssO9WKed68yhjYqKYdvDW92YKwmtC1y2oGj1TB/ssQNLInk+S2HEVaZlOCon9rHp2gzxtJBgg8qGLPZbl3+pLf40jXXW4KvgTwyPzcRbRVJLZ1dpCMZQeEgSSaaP+wYCLDCDjh1msH8/DxXHANA7uElXS20YQB5yQhE3FfzW8EqDxl7/bvDi2ETyf4P/SW59y6/q+BxYbGEFIb+soGZLUmQUW2h7M5NZGWF1SVGx5NSgwPhod59NFLZ1v1WC0uZp4hvhixsyEriDgNmGj+IZecr4SUEuC/4v+PBetndLRGX9r5BgHfBkvnPFjhi1Pfta7ck356L9MkNfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjQQ18SjQ9P+Vthr/Q5MLNLFWrjp4JrmfJOQ9I2HsLU=;
 b=EIqisYzQEn9qmGji9iQSguP2z6IY3jfKvYkkgFxfStmOjYoqLUO7e5WKAUdF1gUksiTB2r0i5ICZWD95RIz8yc0ou6qGF+MAmBQ1CY2kMobqjG0e6vZSw02zxTIDXW02houyIxoFrPlHvIRvuOM4c5Vqa4207F/KTE6QhWTB58RNoXQMADqbJIzeK6Rji9jRoDwjqtOCAlZqyvmzWfWU4kbwr3ZJscJUPluPzwcDo6O3eMXGLi3V1TS6PlZ38Vev4smyUr/l+Mq7B0lSlAP0kSO9epVHa+TxH9DzDgptB6BknKR6CA8l1S2H2XU1U8KiXfgmVeV0U9R7jI80RdTuAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA3PR11MB8047.namprd11.prod.outlook.com (2603:10b6:806:2fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:29:26 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:29:26 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip subtest
Thread-Topic: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip
 subtest
Thread-Index: AQHbnNh7QnSI50/Eh0CSMEqfwzhtvrODMPeAgABl/HA=
Date: Tue, 25 Mar 2025 09:29:26 +0000
Message-ID: <SJ1PR11MB6129A763BD1721393C41389BB9A72@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250324161319.2691351-1-santhosh.reddy.guddati@intel.com>
 <PH7PR11MB60532D4CA3CB05146508C5DAE7A72@PH7PR11MB6053.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB60532D4CA3CB05146508C5DAE7A72@PH7PR11MB6053.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SA3PR11MB8047:EE_
x-ms-office365-filtering-correlation-id: d1fea93c-d26a-4f4e-22a3-08dd6b7f896a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?EyiUrEteNfYSyFsSJqDYvP4oqM6tqjL6HQt17xKA9FAY1XipMNPetIp+apo4?=
 =?us-ascii?Q?lCgi0eK/AvHQ3LMmy2dD6UrD0ygVbomc07MScydjDjqOOCa8jQSwP+VCKyag?=
 =?us-ascii?Q?mCf0h1/lw8zRNCsJMAkIo80Cu4EDq2AiM7ZyCIeESMC+zfNV1q6zwbzLpon7?=
 =?us-ascii?Q?0Xrdzt6CzH3/bmM6NHZANByOFpnwr9BOSeSlNSrEXFekKJOVPWRtp9fpezdM?=
 =?us-ascii?Q?g4bWczgpSh5w5UUKySKQwHMvfixby2PlULkXSool0kP6wDoqrrprIOGk3Ty6?=
 =?us-ascii?Q?5Kv294Siepn6e9AxG5N6WXzsL8xAnH57zVXuj78ZYHPSvO9DeTOokToMJvkk?=
 =?us-ascii?Q?tU3/Fa4DnAmShoLgfrtdLPihibzeNeDiiZ01MZuPbNN4ZssBcpGzrnqO6+FW?=
 =?us-ascii?Q?n35k0TRbxyyteaQa/g8cWSJvzbX//Xmz/cQuD7Ms3xiyz/Sa2aTzC3HFkvrd?=
 =?us-ascii?Q?JO3kri16ZxZfHHNIfzNeSrL5qTd6ZfNt/+pxyoruGpKsPSJrpnMWOdLgMnVR?=
 =?us-ascii?Q?V1gnNnykUv666QzRi0vbOeu4JKRRKMi0szssru1mVDE8reCQu/D+UZ66zx4u?=
 =?us-ascii?Q?JOFpSMQpAr6BpRqh1VIZ2aPbPK4RcouX0MemlqFSdY8KQxayP10PKupB6WNv?=
 =?us-ascii?Q?aUAoTjXZn5+z/scrG8IHCyefmL2K+kbD3Lhg7+8tm+XUghseneyThFsXI6eQ?=
 =?us-ascii?Q?Oy0CbrIsiN7tPLFmU/IjZlZXfW59VIwRcK8jK217VIbUYvcalUmqNzXpTL1Y?=
 =?us-ascii?Q?C0dX2dSUlUB4QdSxOzuW37/HeDXGAsfAZW8R32OaUIzt/QB02exjWw8nckEH?=
 =?us-ascii?Q?5BclAMqsDbOnWuYWWyDsrsViXcrAcKgfQ3lcPGkod8QE97w2iO9gaLcC78Gb?=
 =?us-ascii?Q?X8m10BtUVVYJeAwFFc8Vh8idxE7ELM5MKS++/xQ34IfqzEGvmNPMUX0u1dfR?=
 =?us-ascii?Q?312FhCV1CkbmdhO8RXbX5wCXSSO1ip4/hPphLEPnLRW7icq+YOOTMlm2LhLI?=
 =?us-ascii?Q?uehE26EuDNyI9N5YI3Gn+PMIIm+D0DQ3QBL4yh8JmDZBQ03tqdQj8iotgvwr?=
 =?us-ascii?Q?MHHYPkFCn1OGuLy4JMPxASaaGKXQQeYwlfWxVBxwAWDUW4ELRnXG70pL7VXM?=
 =?us-ascii?Q?I3GnreT0uQoTyFKHf5qOAl7Y+1DDeq2nosyhAI48tlAUZzKTayH8ck2eKm+M?=
 =?us-ascii?Q?YrOL7awiTxz4WyGNXJG6IhmaSrOG87c2tClelfyJbh2WXAq4RVak2A4bIUFW?=
 =?us-ascii?Q?QdaVdREkmDA+uYTxISNj6PyZsCgLzhMolcuoPLvpAEdwdeb4SDD/OyVoFk8e?=
 =?us-ascii?Q?urijEp3Pqhetiw1YGI0JamV9/K/tBqa+M8QDuE9hRsGTKnZrsGfVl5dGWAAi?=
 =?us-ascii?Q?GotNsb/IeXzcEm44kz9L/nEExRNx1LoIcyl22VEFja1Z3BCCCgXKTzaa1GqJ?=
 =?us-ascii?Q?rULNnrXdAq53ogGwasF15fxm/0wOg2Q4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?J6JmSAcAQC+SXyUKtEcPQjMtYnGcDP2LVBazJ4pUGhkT5/LP31X/6a+iKaso?=
 =?us-ascii?Q?d/Yx0Y+Q7wOPRWjWK8wIt3c9dpfLfo3M8KI3khTMHgoXyND6TRJESVDigKK/?=
 =?us-ascii?Q?KmR3PuS7UBj8k22NBHM2dHkr9z/+/jjsW8+ebIrD7rDLwacX3cZLLg7mZZB2?=
 =?us-ascii?Q?crDK4wnnJWXIEDR6Hhgkn3TPIo60loY1SSxKDQuXT993YHGNzlbFKAi+l/4/?=
 =?us-ascii?Q?D7ylg44IPCAS/xLgDPrPSSe2reYd+Yzkr6nFEpdrpmHWgYIKvV1HTjpiP+tQ?=
 =?us-ascii?Q?wpgNoyNCrIyZ6hyCjjIKT4rww3TyAIg+uQ9H6SVPxlzjRPj5nUt+IDtYxUxQ?=
 =?us-ascii?Q?uqjIauwFPFS5mfBzBaOipY4TIXwhnU/5MkzHikC9eytSn9mHwv78Yv0ABZhM?=
 =?us-ascii?Q?ZL1nbwwYbBgC8IDaUCNLc1sjarBMzmJRQQIGWG4kjz5dvYGXkVCp3v/Go74O?=
 =?us-ascii?Q?zUF+NOkzJyGHc5Z5E/6FUAUUNLU5AR/1HbOhsIi9QmSbm3C4HgLrVU5xyCTG?=
 =?us-ascii?Q?/z2CTvtHB1uejDvYKpjxsZ/sOTISzjHAEVeHNiWluPCRXij+Kcax9Y4dhYn+?=
 =?us-ascii?Q?4ROJclS5Wgv6kVZVszG/FHIcqp6Z+j+HaCjFN2+9koQuIKLIWrA6pJNG7HZb?=
 =?us-ascii?Q?u6U9td/aO21OUQfMFSm3Kn4dLBfF/crtUA43XAWHpdbc/FVx0gufIUvdZGQu?=
 =?us-ascii?Q?AUYpo+RSSu1elJ3apjmShJkG/8coS64QZZO0tufenWbaQ33OHjeloj5EMQ+u?=
 =?us-ascii?Q?TQdFLhUDOGRFmLP0r+bSEMYAcal/DMVXjMyMiG5Dn8PqqWYBopweUK2K4cEV?=
 =?us-ascii?Q?qLsPIcSQpvhAoE30z5thaOeffHEuCzyqZs1W2rr1hflpsB9WkMkr5XxHfeC2?=
 =?us-ascii?Q?9CHkQqGdWYihmrcb77KeYpfmueFT8YGYKdsFPZTSKHP/+xMWBRbtefuj8yuJ?=
 =?us-ascii?Q?obLvyjb7ySvQHzPjM5HtllQa+0RGJkw4WJTpQaZB7G6yzL4FnMhaMoJMLpTu?=
 =?us-ascii?Q?ZneEZ5PGDvETeYlVPUmJPv8w/BRt6Olaaqm8CptbU376HtDN+kOjcvpSM/19?=
 =?us-ascii?Q?JOplZlhx2AOucjixxGJjjBf6D9gFzB74IaNfa6VxrEWJw0wf8rqLEw5Efnaw?=
 =?us-ascii?Q?MJWrdwJ6ZQ+cRqFgDenLbfEfrhXAIO3iS85Pk4g2Wf21ssg+puYm92ABID9g?=
 =?us-ascii?Q?h9SsvGT7NFylVD/QjavLrPuKXzZqdQE12Y11hehCZUwBCUel2N6oQt0lIsh8?=
 =?us-ascii?Q?8xdoz50Sx3Cb/E6EQu4Is0PnEbQKc+WnKmeYAgUroTipTfQ50aU/L/J1bB5P?=
 =?us-ascii?Q?21eHpdbYvc59jltREW+LKa1x2HnQvx1JL6Bvzox1sD0xgi8xvksplaMIuAt8?=
 =?us-ascii?Q?kBcjVG8EJETfgJNSsPOgGOxFEp/w5bqDHjUpquxddZypC+O55f7f9435tT8u?=
 =?us-ascii?Q?H44rmGhPexWZHcgXrYi6022WgYpqoesasvCNNH7ApO4k/vgohwmLp0pZDjQa?=
 =?us-ascii?Q?V86CBdPK72J/EqqJYQOSCpQS00dE6XhfWbRawsnAeVbL5v5RlUurDn3QBgI+?=
 =?us-ascii?Q?rjptbe+iEA8oF0XIJrkrtiUCYSQj22ezc1RrtPsv0HXXCgbqdHHtg2O+p55t?=
 =?us-ascii?Q?XA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fea93c-d26a-4f4e-22a3-08dd6b7f896a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:29:26.6842 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1iKRqYw6KglTRbGsbNqlHBgcLGFsw/9d3O9RhFciHPcFDZyHXLtaJ7FZykS47T02UvOFbnRo7T67eAMtxZM0Fa0prBXWaYI414mygAhOYjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8047
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
> Sent: Tuesday, March 25, 2025 8:54 AM
> To: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: RE: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip s=
ubtest
>=20
> Hi Santhosh,
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Santhosh Reddy Guddati
> > Sent: Monday, March 24, 2025 9:43 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> > <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> > <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> > <santhosh.reddy.guddati@intel.com>
> > Subject: [PATCH i-g-t v1] tests/kms_async_flips: Add psr async flip
> > subtest
> >
> > Add a new subtest to verify async flips does not cause PSR exit.
> > Enable PSR and execute async flips to verify system remains in PSR
> > mode after async flips.
> >
> > Signed-off-by: Santhosh Reddy Guddati
> > <santhosh.reddy.guddati@intel.com>
> > ---
> >  tests/kms_async_flips.c | 38 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> > da426f753..cf6b63b3e 100644
> > --- a/tests/kms_async_flips.c
> > +++ b/tests/kms_async_flips.c
> > @@ -85,6 +85,9 @@
> >   *
> >   * SUBTEST: async-flip-suspend-resume
> >   * Description: Verify the async flip functionality with suspend and
> > resume cycle
> > + *
> > + * SUBTEST: psr-async-flip
> > + * Description: Verify that async flips do not cause PSR exit
> >   */
> >
> >  #define CURSOR_POS 128
> > @@ -102,6 +105,7 @@ IGT_TEST_DESCRIPTION("Test asynchronous page
> > flips.");
> >
> >  typedef struct {
> >  	int drm_fd;
> > +	int debugfs_fd;
> >  	uint32_t crtc_id;
> >  	uint32_t refresh_rate;
> >  	struct igt_fb bufs[NUM_FBS];
> > @@ -740,6 +744,33 @@ static void run_test_with_modifiers(data_t *data,
> > void (*test)(data_t *))
> >  	}
> >  }
> >
> > +static bool psr_wait_entry_if_enabled(data_t *data) {
> > +	igt_skip_on_f(!is_psr_enable_possible(data->drm_fd, PSR_MODE_1),
> > +		      "enable_psr modparam doesn't allow PSR mode 1\n");
> > +
> > +	return psr_wait_entry(data->debugfs_fd, PSR_MODE_1, data-
> >output); }
> > +
> > +static void test_psr_async_flip(data_t *data) {
> > +	if (!psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1,
> > data->output))
> > +		igt_skip("PSR mode 1 is not supported on this output\n");
> > +
> > +	psr_enable(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL);
> > +	igt_display_commit(&data->display);
> > +
> > +	/* Confirm PSR entry before starting async flips */
> > +	igt_assert_f(psr_wait_entry_if_enabled(data),
> > +			 "PSR is not enabled before async flip test\n");
> Alignment should match open parenthesis.
>=20
> > +
> > +	test_async_flip(data);
> > +
> > +	/* Confirm PSR is still active after async flips */
> > +	igt_assert_f(psr_wait_entry_if_enabled(data),
> > +			 "PSR is not enabled after async flip test\n"); }
> Alignment should match open parenthesis.
> > +
>=20
> Disable the PSR after verifying that async flips doesn't cause PSR exit.

Probably taken care by igt_install_exit_handler(restore_psr_debugfs) ?

>=20
> Regards,
> Pranay
>=20
> >  static data_t data;
> >
> >  igt_main
> > @@ -748,6 +779,7 @@ igt_main
> >
> >  	igt_fixture {
> >  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> > +		data.debugfs_fd =3D igt_debugfs_dir(data.drm_fd);
> >  		kmstest_set_vt_graphics_mode();
> >  		igt_display_require(&data.display, data.drm_fd);
> >  		igt_display_require_output(&data.display);
> > @@ -896,6 +928,12 @@ igt_main
> >  		run_test(&data, test_async_flip);
> >  	}
> >
> > +	igt_describe("Verify that async flips do not cause PSR exit");
> > +	igt_subtest_with_dynamic("psr-async-flip") {
> > +		data.atomic_path =3D false;
> > +		run_test(&data, test_psr_async_flip);
> > +	}
> > +
> >  	igt_fixture {
> >  		for (i =3D 0; i < NUM_FBS; i++)
> >  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> > --
> > 2.34.1

