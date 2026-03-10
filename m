Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC00FCC9DE
	for <igt-dev@archiver.kernel.org>; Tue, 10 Mar 2026 08:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B7210E696;
	Tue, 10 Mar 2026 08:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dvbP0Ld1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 367E610E694
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Mar 2026 08:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773131702; x=1804667702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o4NoSLTV7JBqfP/Ap8g426wE85xTXGqcwhpJMS9NjIc=;
 b=dvbP0Ld1i/sbXs5BI/Gv3gsjYa3w/EtkABBraUAPbM5pMPDL1G3RNQpb
 6HyJ5OVcAJcmF2Vz6zmFHNTdyPMO5vRGxKM+nJjM9gAIY76Oa9riEt4ox
 QjpG3VOoTRf1eGPkwi4Z6GjFkF0X9tI0nRdTnY5qSd+DtBmVJ2tWmbcim
 iOJZ4FnT4zPUv8eENWXqV2THLKemHtBNLPrplKNqKhUBSlkAt7av8Xv3n
 71XISN2h9/S1ex79sP8f5j9KfXLykFbg5Ud9HFf4S0/nvzp4xXWHwxCyw
 s12hoV1uj26dsKSLIeuxiQDg0C9CvX/o8qo2c8oxGbPssdnTQI+2TjyR5 A==;
X-CSE-ConnectionGUID: axTH3IudRQCatl3Bumto6Q==
X-CSE-MsgGUID: QFl3xnjWTJavxXhyr8xXJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78048061"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="78048061"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:35:02 -0700
X-CSE-ConnectionGUID: zqMEAc3lSuC4uPAtX4QcuA==
X-CSE-MsgGUID: Z/yME6HjTiiec1fh9+VABg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="219289659"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2026 01:35:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 01:35:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 10 Mar 2026 01:35:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 10 Mar 2026 01:35:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQwUfwDmCtBdOQMuJ7L/jde80VPdtjlN5/mOc79GF2GSVAmZ2+Lgr+UlLdO2YDu821YQIaZVbsaNNqBPE8q9yK21XWmckR9e+c1rT1fezS91gFSqE1+DkBFPbDe6eM0ONFg57yMuoIvDYoMoxhfF9yKmA/dMrOq7k+30gTxprBTqOnCh0g67enEa1Q4bFWIdMjnFluxkZPwt8AzgfkXpiM+hyHpS25PxLAU5UD06JpAhRcUQuwCl7V9wP14dSjFsUJMFJ8HJNEDdkO20CqAZH1GPr/ai2WEHBmn3iZzJpWxPBfDMMddglGD+SksQoSN4ZdaRDya69Ud8DlwUQcOjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qk/xPiEy8bYIHoDLN+PqvhhPFUe7vNKaazJMtBfrUNg=;
 b=tcQXdHeCSPVUzeHUXZul4ieeRpTKxARmaredLBFPlGBKfRUDdkgnzfvKXdPpy38RTbXAM6cdoQIuUreuDRiavLgxAQqe4gEa2IBJJIOLXWJp00KiC2IoNSzeilfmsAsCmdxMmqgc6WHG1piJVsuxPxaf8UzOTxb8t6LOmhBWvpjWP6SVhkcA71fGiIwaM94haX4v/EynNdkywUrmXHuOWZnqkqhEAqEJ/YKQ3zUWR8U41RUy0R+RO6uKlc7GKW3otqAaz1VOYRJ7srCH/ffJPqphh3kS/f2Zx9BTpjmXMDBJmPQX/64fnmR0T2npDC1r9KYlB/+ypFipI2JqatQjzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6034.namprd11.prod.outlook.com (2603:10b6:208:375::17)
 by DS7PR11MB7952.namprd11.prod.outlook.com (2603:10b6:8:eb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Tue, 10 Mar 2026 08:34:52 +0000
Received: from MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73]) by MN0PR11MB6034.namprd11.prod.outlook.com
 ([fe80::eec5:c441:1afe:cb73%5]) with mapi id 15.20.9700.006; Tue, 10 Mar 2026
 08:34:52 +0000
From: "Bilal, Mohammed" <mohammed.bilal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Brzezinka, Sebastian" <sebastian.brzezinka@intel.com>
Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Topic: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
 assertion failure
Thread-Index: AQHcrIMfz/3MB6bA2EiTRrDZJ7K5FrWl86KAgAAF0ICAAT5QAIAAQDtQ
Date: Tue, 10 Mar 2026 08:34:52 +0000
Message-ID: <MN0PR11MB60342D4420795B2B7EACB7938146A@MN0PR11MB6034.namprd11.prod.outlook.com>
References: <20260305093025.3107101-1-mohammed.bilal@intel.com>
 <20260305093025.3107101-3-mohammed.bilal@intel.com>
 <DM4PR11MB6312FBDCA175D13650AD0EFC9079A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <MN0PR11MB60341CACB076517AC25B5E548179A@MN0PR11MB6034.namprd11.prod.outlook.com>
 <DM4PR11MB631239D62A96477BD1FCF6A39046A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB631239D62A96477BD1FCF6A39046A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6034:EE_|DS7PR11MB7952:EE_
x-ms-office365-filtering-correlation-id: d51718fe-e3b2-490d-e297-08de7e7fe695
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: MeqbHsx2xRWh2AK4BIOyvn+QBc+IEgRnvDZcGDw7FvVDmNyooxd39/iZhl2wGTFpuQpWTx7qWYOtlzaglQ21D8l9G1I2PMWhTXu2sowtf9XOWG42bOMgVv2jGOfux8+cT4udja88fCspOl+TtgyFHFM2g7dYV3m2cBTALD7J4Py5Z9XcM9I8nvEVYUDrn7PqrxiwrDrdT1H8oVUPgVrxxr1B/NnqC8NZYeSpi3F03BJIvTMd6zIY0T1YuDpEC8j2RDzundmTL3uoyTZBSwcpfNknCN5ii9GSMcNPZBMVbc40N7PAMiGM9j8Fq4cZCznJqIDtJUMTz17CQvNaTOFUbRTpmx1YfKYEZ0/CFCCwjaokWyEJBW5HYdYwdVQh6H+6mKOXcu430sp2e2GU7ODZ82Zcdk13qaJK+1DyamEpSccjoK/eR5kGWAzlB7L3kD2wftNqr60ekZGkA+ksx+8WFYHU4M20Igc8asG7afOCuur8st9xPlNZkq0pvYobAZpoLbKY89IJwMse8Eim2azhf8VfpRzqgKbkcfHq+k9iVZoJNJMqCXWXpNhdKFgcKS5kwUokOlD616GsU5vuy+xZggYZ06d+r7cmCJ/5FZXbMmUN+loZ0bN7pES2RNUM+Stt1+YMYO6bZ4kICnQI1ItoqGgGH75xe8gW7b0uUw6Xdw8dDh4DuLgt7byjSXzbpsfGKU2toBWIrA09Dtgcr78/llW0bLhhxB1FyLYmYpOE3j2c8L2a1uAgcLKSA9DAQZzIKG0TtQRheq76hD4jzPqcoWFxml6FUaWZeFL2whaKgro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6034.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VXWzrvaG9VlCLRpYyHWcq0fYOw3SW/uKkJlan7JC+MkaWFN0P4NS7Jd/S0bU?=
 =?us-ascii?Q?iEbPughXAG1WiHyYRRPxVkIERuLgPCl3jrc7YLp7nEugPzDEzqVAu/tglcNY?=
 =?us-ascii?Q?0x5ExeT9Xk8im+2hmVJ1vOF7lYE7Bf+EGLPEhY2NnuvzVeU2ITkRHaplNMVR?=
 =?us-ascii?Q?8jJTF4I3pbujMqXNOUQ84fkjA5srv11/lwfMuj0TtHMJVLuwIMxMou1ySmdB?=
 =?us-ascii?Q?WRl9Zyzg81juwkdKWBjm2oCwTGCVTKooVW5813tC7/U9sNeZBquwkhGbNqRq?=
 =?us-ascii?Q?jWn8olR1syC3hY1v6GEI0vpXFUwW3ZsG1SNiN+jJoTukxruCnHBQSc/FRFzb?=
 =?us-ascii?Q?0AMNgFIdFtfI8MYEUkUDMzbhCiPKDJwjGYfd4Bnw5JGyFazVHB8nKePPc8GK?=
 =?us-ascii?Q?Pip2eiRCiKAwgHZ51Vonz6J2PMgtit25J99l+GxU/OxVrvEuK1HnVdBqOrU7?=
 =?us-ascii?Q?WIzUjW3ho1kYPOyqG5oSKDiRwpNbUVvTeTfVzMtF7lUBpVSh91Um4MylSSp6?=
 =?us-ascii?Q?1T6BxxXLGkeezjkHMvbaOMEndc8X8mqg9iI7aK3F3zjhCt+S0VPTQuMlaGBP?=
 =?us-ascii?Q?/ydKo8q1fplx0ISQCcUjF2NXwP7cBMlZ7vxcQwR7Z/SLSxAvJ8fGbMp+wURB?=
 =?us-ascii?Q?4ZK6S/PiB6w2v4/Srm5hzhuINtEl9Ykq1nrvVfUAm4zJgGqlLZLFtwrNlTic?=
 =?us-ascii?Q?dqiO4SfM1ayQZiTGpJfVc+lpOH4/Q5MBBDkU1TkElPzPueOEPvICZ1W5c/Xg?=
 =?us-ascii?Q?zopfW2J7e1XrWccTzMCF9vtYAv17GDdwtfyiC6Em+w9oVXgw1i81UKSL+Axr?=
 =?us-ascii?Q?9m1KHuDr0Z6NddZqzu9wmxOMOpKzmhRJJuW7h3HJ2NkZ+JPLk5iV8zJ4CTSL?=
 =?us-ascii?Q?9BdZ6DBQGpN1JkbyK25hUb1BcK6MZrEuEVoZjiinra9L3ciDWUy+hBTO/XYg?=
 =?us-ascii?Q?zoJyMrml0FK+U3ZJcUQUaoL4GruCJUmdz+OEgcbBLYHGHelQtIX2vcxEK9Qm?=
 =?us-ascii?Q?vMh/Z+jsAaTro0YhMW7jmJIXUke4/7gBMQYGhhW5LjMtMc/qIBdkYfXeNv3j?=
 =?us-ascii?Q?f+wiXpKyvjFdZtp3bT4170Off0lFcXcxF7/7Di8WdxxoiHYctmseM7bsIuIK?=
 =?us-ascii?Q?cYp2EhCmhRfFFqM5IdjHG08faeWac9fv+EyieGzrimiyubb6ovNccAIunfds?=
 =?us-ascii?Q?U8OWqsOggb066UtywQza71iXzEtENacKwYR5yS8CIHY1BaiOEgC+FhiIFldD?=
 =?us-ascii?Q?rQ59/0PA9bWH9TEN1aUvWP2zFzN0uZOCKu4EzfAIW02ZFXQnxvvIVyLAF/fv?=
 =?us-ascii?Q?y/un+Ue4vPPhDvq1ABiE74syuaev+sjguXPnsxx1NHJUKn10AHzC0SHlgW+o?=
 =?us-ascii?Q?RqI6AMIs5va8J9tIwbde5M7V38e8uIY8t78KlP6DcTwD2HvbLaEtAvbpkVMS?=
 =?us-ascii?Q?7bofpbMo0sVndCTPN1NLYgzLbWs2TGAZS0HJiSa1bEBY50dG87fJSfLSDDvt?=
 =?us-ascii?Q?y2wdDKrpVwO6A3/m32vroD4SvKcFq/NrJLLbI9JLr4z9SSLxROCL355D1v1d?=
 =?us-ascii?Q?MXYUBFXjnyeZYqQrIJmoEGjXacE0c6KO722wXsAs/3mMt/g+U2g5zkltj2Ia?=
 =?us-ascii?Q?u9ZU1TihuYRRTYHqPUk6i3xbU2UgVhY4IutnRcmx7SZh5XVwQgFNVxIrECNy?=
 =?us-ascii?Q?PN3H/Zj6+PP7xEJbCg9XkvemwfAD7O1/RPSxfSdf3eHfDKZgCbn4Lu1JqOdT?=
 =?us-ascii?Q?Vl94BQ231Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: V7esQKSP1bWptnz9OolpuBTWf3871g/TxNHFS9mb9MXz1zmYrsnn5ACUS+m8jrkU5Bhv62tGj2rMaeZ8y/ZzmejvBuU0TuYV63ao7p303mDMzOJgRJWM0zf9ROK1NpajbCJeaN3iLxVQENtorx7j1sXG7t7+ABsPnu/uULzuV2AAD6XwX7HqW7JwDHYI9eKpDcVuurLKLVMatvQWoYVPDbKrVx0r1o1QP1JSHzZbUbVo8I9z/m7MYDtPStWLHcIB/EwbzPAZRmBkNB6dIMHKByT60yuc4AoZ8dezsyTGY8F0X0rPXDowPhdEdHBtLPz50q2wgFOqQO7+doxfc02vwA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6034.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51718fe-e3b2-490d-e297-08de7e7fe695
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2026 08:34:52.7093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XauDhnGHHqYUu4MleE7H+nMSTU2eVdsCtqfRsW/dm6Gg75p4RjZqaVPzlrtNONHTqDPZfOBXPGv4cLpkievJptFkdkn+BwU4wB1Xb8zaMpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7952
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
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: 10 March 2026 10:13
> To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks on
> assertion failure
>=20
> > -----Original Message-----
> > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > Sent: Monday, March 9, 2026 3:20 PM
> > To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> > Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks
> > on assertion failure
> >
> > Hi Jeevan ,
> >
> > > -----Original Message-----
> > > From: B, Jeevan <jeevan.b@intel.com>
> > > Sent: 09 March 2026 14:53
> > > To: Bilal, Mohammed <mohammed.bilal@intel.com>; igt-
> > > dev@lists.freedesktop.org
> > > Cc: Brzezinka, Sebastian <sebastian.brzezinka@intel.com>
> > > Subject: RE: [PATCH v2 2/2] tests/chamelium/audio: Fix resource
> > > leaks on assertion failure
> > >
> > > > -----Original Message-----
> > > > From: Bilal, Mohammed <mohammed.bilal@intel.com>
> > > > Sent: Thursday, March 5, 2026 3:00 PM
> > > > To: igt-dev@lists.freedesktop.org
> > > > Cc: B, Jeevan <jeevan.b@intel.com>; Brzezinka, Sebastian
> > > > <sebastian.brzezinka@intel.com>; Bilal, Mohammed
> > > > <mohammed.bilal@intel.com>
> > > > Subject: [PATCH v2 2/2] tests/chamelium/audio: Fix resource leaks
> > > > on assertion failure
> > > >
> > > > Fatal assertions can bypass cleanup paths, causing resources to
> > > > remain unreleased when failures occur during audio tests.
> > > >
> > > > Replace fatal assertions with non-fatal checks and route failures
> > > > through a common cleanup path to ensure proper cleanup.
> > > >
> > > > Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> > > > ---
> > > >  tests/chamelium/kms_chamelium_audio.c | 42
> > > > ++++++++++++++++++-------
> > > > --
> > > >  1 file changed, 28 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/tests/chamelium/kms_chamelium_audio.c
> > > > b/tests/chamelium/kms_chamelium_audio.c
> > > > index 2967e3c50..201be0ba2 100644
> > > > --- a/tests/chamelium/kms_chamelium_audio.c
> > > > +++ b/tests/chamelium/kms_chamelium_audio.c
> > > > @@ -389,11 +389,11 @@ static int
> > > > audio_output_frequencies_callback(void
> > > > *data, void *buffer,  static bool test_audio_frequencies(struct
> > > > audio_state
> > > > *state)  {
> > > >  	int freq, step;
> > > > -	int32_t *recv, *buf;
> > > > -	double *channel;
> > > > +	int32_t *recv =3D NULL, *buf =3D NULL;
> > > > +	double *channel =3D NULL;
> > > >  	size_t i, j, streak;
> > > > -	size_t recv_len, buf_len, buf_cap, channel_len;
> > > > -	bool success;
> > > > +	size_t recv_len =3D 0, buf_len, buf_cap, channel_len;
> > > > +	bool success =3D false;
> > > >  	int capture_chan;
> > > >
> > > >  	state->signal =3D audio_signal_init(state->playback.channels,
> > > > @@ -426,9 +426,12 @@ static bool test_audio_frequencies(struct
> > > > audio_state *state)
> > > >
> > > >  	audio_state_start(state, "frequencies");
> > > >
> > > > -	igt_assert_f(state->capture.rate =3D=3D state->playback.rate,
> > > > -		     "Capture rate (%dHz) doesn't match playback rate
> > > > (%dHz)\n",
> > > > -		     state->capture.rate, state->playback.rate);
> > > > +	if (state->capture.rate !=3D state->playback.rate) {
> > > > +		igt_critical("Capture rate (%dHz) doesn't match playback "
> > > > +			     "rate (%dHz)\n",
> > > > +			     state->capture.rate, state->playback.rate);
> > > > +		goto out;
> > >
> > > After goto, the stream will be stopped and the test will continue.
> > > The test should fail after cleanup.
> > > We can add a flag and assert after cleanup based on the status.
> > >
> > > Thanks
> > > Jeevan B
> >
> > Thanks for the review .
> > If you look at the code flow, the failure is already handled through
> > the existing success variable igt_assert(success);
>=20
> I think this assertion is triggered only after all cases are verified. If=
 the first case
> fails, there is no need to continue testing the remaining combinations. T=
he test
> should assert as soon as the first failure is detected.
> >
> > >
> > > > +	}
> > > >
> > > >  	/* Needs to be a multiple of 128, because that's the number of
> > > > samples
> > > >  	 * we get per channel each time we receive an audio page from
> > > > the @@
> > > > -447,10 +450,6 @@ static bool test_audio_frequencies(struct
> > > > audio_state *state)
> > > >  	buf =3D malloc(sizeof(int32_t) * buf_cap);
> > > >  	buf_len =3D 0;
> > > >
> > > > -	recv =3D NULL;
> > > > -	recv_len =3D 0;
> > > > -
> > > > -	success =3D false;
> > > >  	streak =3D 0;
> > > >  	while (!success && state->msec < AUDIO_TIMEOUT) {
> > > >  		audio_state_receive(state, &recv, &recv_len); @@ -460,13
> > > > +459,21 @@ static bool test_audio_frequencies(struct audio_state
> > > > +*state)
> > > >
> > > >  		if (buf_len < buf_cap)
> > > >  			continue;
> > > > -		igt_assert(buf_len =3D=3D buf_cap);
>=20
> The original assertion ensured buf_len =3D=3D buf_cap. With the new chang=
e, you only
> check for buf_len > buf_cap. Therefore, when buf_len =3D=3D buf_cap, the =
code will
> continue executing normally.

Both approaches only allow the processing code to execute when buf_len =3D=
=3D buf_cap.=20
The difference is that the new approach runs cleanup before failing, preven=
ting resource leaks.

Thanks,
Mohammed Bilal

>=20
> > > > +		if (buf_len > buf_cap) {
> > > > +			igt_critical("Buffer overflow: %zu > %zu\n",
> > > > +				     buf_len, buf_cap);
> > > > +			goto out;
> > > > +		}
> > > >
> > > >  		igt_debug("Detecting audio signal, t=3D%d msec\n", state-
> > > > >msec);
> > > >
> > > >  		for (j =3D 0; j < state->playback.channels; j++) {
> > > >  			capture_chan =3D state->channel_mapping[j];
> > > > -			igt_assert(capture_chan >=3D 0);
> > > > +			if (capture_chan < 0) {
> > > > +				igt_critical("Invalid channel mapping for "
> > > > +					     "channel %zu\n", j);
> > > > +				goto out;
> > > > +			}
> > > >  			igt_debug("Processing channel %zu (captured as "
> > > >  				  "channel %d)\n",
> > > >  				  j, capture_chan);
> > > > @@ -489,6 +496,7 @@ static bool test_audio_frequencies(struct
> > > > audio_state
> > > > *state)
> > > >  		success =3D streak =3D=3D MIN_STREAK * state->playback.channels;
> > > >  	}
> > > >
> > > > +out:
> > > >  	audio_state_stop(state, success);
> > > >
> > > >  	free(recv);
> > > > @@ -587,6 +595,7 @@ static bool test_audio_flatline(struct
> > > > audio_state
> > > > *state)
> > > >  	recv =3D NULL;
> > > >  	recv_len =3D 0;
> > > >  	amp_success =3D false;
> > > > +	align_success =3D false;
> > > >  	streak =3D 0;
> > > >  	while (!amp_success && state->msec < AUDIO_TIMEOUT) {
> > > >  		audio_state_receive(state, &recv, &recv_len); @@ -595,7
> > > > +604,11 @@ static bool test_audio_flatline(struct audio_state
> > > > +*state)
> > > >
> > > >  		for (i =3D 0; i < state->playback.channels; i++) {
> > > >  			capture_chan =3D state->channel_mapping[i];
> > > > -			igt_assert(capture_chan >=3D 0);
> > > > +			if (capture_chan < 0) {
> > > > +				igt_critical("Invalid channel mapping for "
> > > > +					     "channel %zu\n", i);
> > > > +				goto out;
> > > > +			}
> > > >  			igt_debug("Processing channel %zu (captured as "
> > > >  				  "channel %d)\n",
> > > >  				  i, capture_chan);
> > > > @@ -661,6 +674,7 @@ static bool test_audio_flatline(struct
> > > > audio_state
> > > > *state)
> > > >  		}
> > > >  	}
> > > >
> > > > +out:
> > > >  	success =3D amp_success && align_success;
> > > >  	audio_state_stop(state, success);
> > > >
> > > > --
> > > > 2.48.1

