Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A82CEF4ECA
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 10:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F0F10E13B;
	Mon,  6 Apr 2026 10:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mJTFkM6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6651610E13B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775470692; x=1807006692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TjGe16cQ2tEjDELIta17LqhCdsVS4srbnpbEpzOKjvE=;
 b=mJTFkM6qmCfGfmX21GMGx0Mk7Wdj5mg3ZMf77auH0yLypvjaViKVZaCP
 bfhSKFYDsfb3aD0g1TxRg2AAO1bGdu9jpLCn98xdev6ES72raYRA+poeZ
 QKobiNguU679sxajKJ2lwlo8GpjnnZmImzzUc1qmd8x+2OxwU6S9l5jku
 78VYZLxVPedTc52kQ1gTTSiKXK+UqU2CuZh6TE++AdUflq6JZQFWkPRNU
 v25cSjwFHYQ1cwo47AWisHMcbBCKiSS+GMU8e1J5v5dDmR9f+mH2Js1Y8
 Pc06zZqeNWcP6XtwjTla5NFK+u/pTyAl/EFGld/fA8gqLovi8KAm/WgX0 Q==;
X-CSE-ConnectionGUID: ktScRNTqQHqMqLxfett+7w==
X-CSE-MsgGUID: VCkWnwy1RXaVCS5xpq9j7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76487067"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76487067"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 03:18:12 -0700
X-CSE-ConnectionGUID: 5Ei00p9QTFaC2aqLG+4E1w==
X-CSE-MsgGUID: 6bqUYt3JRG68zrkIttgbhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="227014238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 03:18:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 03:18:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 03:18:11 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 03:18:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnX645nmmA2s4ejHOWmN3NT9AWgS3TlYVqWQQhDNrODu+FgY5zMTzTrsvgt6vXw4WOO3fNFIMPpmDwD9Wjp6afZkVKCn0Hzesl0FkPmDayKIPiqHGLhRDKC5SGCLH3xMq6bnlIqV2vCIPRFinYf9Tx9Arft7vRRQ55C+lGKnajI3UOZjkUnKODS1FT9OAPaN62jAZq78Xcz1JhCSN97Sqi8CMqLBf71gQO061htpTAYW+gcmzbIrRFifRmVYCitJ6kDpYttHs3rDYauW7wO560mix5T2IDJvsLLlYS2DrogKO1/ryMFhUx1MWNvUg7A/SNO7WzccqJATKkyDUoO16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WJp4ccMSr6cuISd/0X768EfnCVEGWGuiyY6JxvfU3zY=;
 b=QBiB64Cenit2IMxRz9DkaPPboJ1/TAy2QLsmN1Qx/HAo9MVnZKDjo8oc0lugvrfBVp0on3B9PsexBHuFdLdTDha9mYN822PanE7j9mkgVht98Cha/RLv8Olv4usziGnikE05gg4zYjaB3mH/4esyzS+Ex6nk4zZ54TviGiYxQi9ptJ79VUVAv+FW2Q9ra19w1ad/EDzN7WSX0UFnZqI1QYKW+sVUEmVR7gQ6uDyWe68Vr2NHA1IJB2V+d6ipnoPhzBUL9xYpcQjQe4+O9ulLgHnOT/LE/CUGQTe+b8vu7ofacEWpJ9J5BZsllUGSbirLa2ioLh2juXGb5iRfUvOFEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by DS0PR11MB7902.namprd11.prod.outlook.com (2603:10b6:8:f6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.19; Mon, 6 Apr 2026 10:18:08 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9769.015; Mon, 6 Apr 2026
 10:18:08 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B S,
 Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/intel/kms_frontbuffer_tracking: Improve
 skip message
Thread-Topic: [PATCH i-g-t v1] tests/intel/kms_frontbuffer_tracking: Improve
 skip message
Thread-Index: AQHcwldvS7AneRr0ekm58mGDl3/0MLXLjtuAgAY/YjA=
Date: Mon, 6 Apr 2026 10:18:08 +0000
Message-ID: <PH7PR11MB67963F8140D604E8291B77B4E55DA@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260402043702.914845-1-sowmiya.s@intel.com>
 <ac5B_Qg-DRA5Q9P8@intel.com>
In-Reply-To: <ac5B_Qg-DRA5Q9P8@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: ville.syrjala@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|DS0PR11MB7902:EE_
x-ms-office365-filtering-correlation-id: 49af7b95-d3d9-4d1b-2d59-08de93c5ccb0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: DD7gGhtlCdg9LqIDaxu6t2PwCPrARwLKsFTLtOWAFWtWHaAW36yjENczX0jWSOUUf9Nd1rwbx5Bhu2DUkkQOb7e2pQOkoYAnwKZTJuYiWeh5UDwwk0JtATXO1JaalmfL+U1RCe0sdT/eqDsrJa0bE+n+caywXe1y4ap40Imnc+9UaTfd2SgJP22D+JlQXoGwDJHpG38iF/WIRAcaCHyFehf0eW4Ss/2HlAFkLGOyYjIGBs1exJz4UwFZnnsEd17pNdbqxnZlSSncHhf3ouRD6rsp3WlpmXc5PHL2wHzGi5ZVTtq+xseJyoTpFu86gf6pmRPPs6W3q1k5U48aIPX+VxH9HazdBziSenRBm24kqlzVfu/o2818xW1ttgmwiRuREmu7qqqMUpKe1t1B6vzdZiIkamii0QI5VbmnpknCXs317m7gn9DvqjCy6v7asMO+kdMz4O/ccVLT3Dk4RPFyVPXQQ4Yku760ITiz0wNFU8TWUX1XYyP988t/1T+w+npWq0saLhQzA9Dazp/dj5atgNFLSYb3F0MEPIigZs7JxxcT+wz5MOHF+vEPVdh+avs5r7/Nr+Ny4doq4o5rXLd4OBwCPeNcqCcMHfqGzoDwyT0scd6hOV2tgVdK451NG0gT1P1/YaG/VpAgQ8Z5ikgv5JSDcYyM0gvfCj7RH1XZKV4MQWipng+UUFG4ZiedeRsd85rJXfHJBHCmV3z6oI3igaGgwX/W2VgjVN4Jj8Zn3DVQGmt9F/sILvG90bfHqLjt9uzmWS/HNSDMm4KNswRwMtPBHQUWo2Qqy7YiMbxJVas=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VJcprvcuMP4dzWPa9WGSW8zPrAmRbXGpZg95HNrj0j05ivYZPiISsSDh6s?=
 =?iso-8859-1?Q?MRK4GUJSVNqw2y3PX/PCAI+JgM2D+YKZxyosA7z0Smt6cBqQ8FRb+RhPvw?=
 =?iso-8859-1?Q?OTpS4g3yAEj9fu6XoNgnlTH6J6ebpQuWkNpBcA2AQjBZT+wxPOBS9n0kfx?=
 =?iso-8859-1?Q?gAtx6lHzOA+Ji0MB3ID4aWMH/npdRy0DXe0EGzCty0FbbVi39hG4o4waR0?=
 =?iso-8859-1?Q?ElnVWUHlK5k2rv6Jqrmm/b9Y19wYeI3KqyG0YJ78PnpyptQuSjUkQC8LLe?=
 =?iso-8859-1?Q?YvRoC0hgws+dcJc9xj37uqfKOCxYdSCB2Z3a/1g5+C7spx9PatCaEc3OrV?=
 =?iso-8859-1?Q?YGDtOTQ6hG2N2IXUQBe+nQ6aAfCC2c0vY8T9CoYli7H2TZUMI1+JJH/t/g?=
 =?iso-8859-1?Q?OrW6DJaSNb3jOBb61YYlAc7W2IqyV5tuBOj+evQkCTM4HKAsyKBlRYWHcK?=
 =?iso-8859-1?Q?gD1Od+uenzgHZtautV2RWjHc3XxDZLat0tH5oXudeg52Y6wWf5xjw3FyH4?=
 =?iso-8859-1?Q?m3v8ExATacVtuEFtcgBNbrvT2fv1NSkhnK5E6dgZMNZnFQ9vEun6acuvLA?=
 =?iso-8859-1?Q?86I/rx0x+XBWbpgmQqyw90kFRg9D0+XUNMdWBr+HCxncpKpvG17uhysd+V?=
 =?iso-8859-1?Q?etnS4mvGs3sYtc0FwC35GWRAyqyqoM90EsGEq76CiN/GjKTiSfyqujBUNk?=
 =?iso-8859-1?Q?/okJh3E5CCRr1i7SFPIOrigO0S8Cu+nAfodjpR1WnaY0q+QSDQyA48XMa4?=
 =?iso-8859-1?Q?Dsjg08uo8OBmBKPO3qQXzbYByqaqUdMvAfGruxagf3EbG/25vXYugAJ0bE?=
 =?iso-8859-1?Q?n5+7cLHAnWaIKCIOJJioeNDLOuatiL1Ip5koR4hBZhLZT59rlfTNgfjL+H?=
 =?iso-8859-1?Q?Ukl0PT11LUhOSRPHVvCumEdCC7ON9GKb1Ba156FG1+cIhX0a+sopAd32Jz?=
 =?iso-8859-1?Q?Qtk2A6fLO8zXJMopBhUm4ux9Z3V6TN+5ZXOFTS7nJDMb35d/AM5quWNkz3?=
 =?iso-8859-1?Q?ppM1F5KDFxyH9BHNxzkO6RUeAYNfATE2r8hEX4x0gz2ZpqoBRBwITIIEdw?=
 =?iso-8859-1?Q?uYXfW4e0B4JjsHetMBxMT0KyfaoE2Aog4EOo9t7becQLOz48P8aNMp8llt?=
 =?iso-8859-1?Q?+B+hTGBdnk0+PMMRMRTs6m4nbZTSIGo7uLjrDrlkjMIha/ih/draot7lir?=
 =?iso-8859-1?Q?d0ZMS/Q5/v4NwFIKwwe00Mn3voHhXy8PFX4SvdiA5UB5GwibiCRdn8ZtFD?=
 =?iso-8859-1?Q?iM9ZgfmZNf1S9RFsbexw0B/D2fMcuhOHL/nVVbIqLCwoAejBbkr28Nvoob?=
 =?iso-8859-1?Q?YfrR9t9LgkKb4+btGqrNy2LyOrA3slp5KuYQ2dOoXRsG+jFgZ8RBV3yvpQ?=
 =?iso-8859-1?Q?z9Bao/pv3vzkIEh7SVxkw1RqtV03eX5sz6oWNOI/LPqYNoDH33P3D5MrUP?=
 =?iso-8859-1?Q?f1XEDQ6ztKgq8UdBsYcMwzBeSWVHI2qnFL3AZXZ3K1gqgFa+JQMONtLOTY?=
 =?iso-8859-1?Q?6tyckuuAe9otNpiWayIRX2kvU+1qCGD8tPi8UJNP0XH5O8XIF8tY0Igf3/?=
 =?iso-8859-1?Q?l7K4r6uSRE4oK0dlAEXBtEtKak9HFpoV08gug635kN7eS/lkNpHG4vvwJv?=
 =?iso-8859-1?Q?Y3FmfISC3SnXyxWNdxB9Tc6tcusR1wMJGO/QYrmnWJye/zPM19greyzmUi?=
 =?iso-8859-1?Q?AHUE6oqwrsfsdGLnFNO9JdbjS5W9jG3isCL4C54ksbnH+oTjMfjv+KS+st?=
 =?iso-8859-1?Q?8Ul8EE++aUISnQ7xFii6Nsok6RUYzBFKdx6UbAe/Emtgk4gMKKZ3yiNV17?=
 =?iso-8859-1?Q?OgJz6ufCJ0WGvaEUC9a6z1DX7c4yVI5TEoRpLWD9pgbwRoOM9BZZomJUCd?=
 =?iso-8859-1?Q?qI?=
x-ms-exchange-antispam-messagedata-1: RGOpqxYxJ+vH9w==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qSv3f4sYFc6IxYYmIItaCfi2e67OmZfQ0ArjMpO2CtcqVRwYyQ7dTL+Aj1fWjNAPkUR//Gqtu88cQAX2/EorWXG/RJ1inTk6XUiiM5TprwSqXNSahjea6sFSe10tpCa+znFknAGzv+EJXncommVRhmwBsQZefTIGm2/QhIp6gqeqx/p734gLIKYc9WHUN/7WBqJrOoy5DCzwuhfm5H7FT697pi23CMELtNveQiUFs+CNTqUzo/+E9iHI1cGokgvo14tL0EbAAIz8OxVVuGIZtDQy54CPDVAS5PAASxefKVR4DKtojb55U1NjDwJJYhXJxMpKxMnR8a1PuMVCJbdm4g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49af7b95-d3d9-4d1b-2d59-08de93c5ccb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2026 10:18:08.4899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xbiy2sKSh707Lw8NIvUEkLTyPcyQTy7HV+Gwx7OL8ZiB4UzsubzllHbqcb5uzFItPnGheREo1aDRta7n85jFmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7902
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

Hi @Ville Syrj=E4l=E4,

> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: 02 April 2026 15:46
> To: S, Sowmiya <sowmiya.s@intel.com>
> Cc: igt-dev@lists.freedesktop.org; B S, Karthik <karthik.b.s@intel.com>;
> Sharma, Swati2 <swati2.sharma@intel.com>
> Subject: Re: [PATCH i-g-t v1] tests/intel/kms_frontbuffer_tracking: Impro=
ve skip
> message
>=20
> On Thu, Apr 02, 2026 at 10:07:02AM +0530, Sowmiya S wrote:
> > Replace vague or negative skip messages with standardized, explicit
> > descriptions that clearly state why a test is being skipped.
> >
> > Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> > ---
> >  tests/intel/kms_frontbuffer_tracking.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/intel/kms_frontbuffer_tracking.c
> > b/tests/intel/kms_frontbuffer_tracking.c
> > index c16f63199..6a7017256 100644
> > --- a/tests/intel/kms_frontbuffer_tracking.c
> > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > @@ -2548,20 +2548,20 @@ static void check_test_requirements(const
> > struct test_mode *t)  {
> >  	if (t->pipes =3D=3D PIPE_DUAL)
> >  		igt_require_f(scnd_mode_params.output,

The below change was the intended one to improve.
> > -			    "Can't test dual pipes with the current outputs\n");
> > +			      "no valid secondary output available for dual-pipe
> > +tests\n");
> >
The remaining changes I have in mind are aimed at introducing a unified ski=
p message across all tests, and I thought it would be best to start with th=
is part first.
Regards,
Sowmiya
> >  	if (t->feature & FEATURE_FBC)
> >  		igt_require_f(fbc.can_test,
> > -			      "Can't test FBC with this chipset\n");
> > +			      "feature not supported (feature: fbc)\n");
> >
> >  	if (t->feature & FEATURE_PSR) {
> >  		igt_require_f(psr.can_test,
> > -			      "Can't test PSR with the current outputs\n");
> > +			      "feature not supported (feature: psr)\n");
> >  	}
> >
> >  	if (t->feature & FEATURE_DRRS)
> >  		igt_require_f(drrs.can_test,
> > -			      "Can't test DRRS with the current outputs\n");
> > +			      "feature not supported (feature: drrs)\n");
> >
> >  	/*
> >  	 * In kernel, When PSR is enabled, DRRS will be disabled. So If a
> > test @@ -2569,7 +2569,7 @@ static void check_test_requirements(const
> struct test_mode *t)
> >  	 */
> >  	igt_require_f(!((t->feature & FEATURE_PSR) &&
> >  		      (t->feature & FEATURE_DRRS)),
> > -		      "Can't test PSR and DRRS together\n");
> > +		      "incompatible features (feature: psr & drrs)\n");
>=20
> This doesn't look like an improvement to me. The old one clearly says wha=
t
> happened, this new one form looks like something meant to confuses humans
> and be parsed by some machine.
>=20
> >
> >  	if (opt.only_pipes !=3D PIPE_COUNT)
> >  		igt_require(t->pipes =3D=3D opt.only_pipes);
> > --
> > 2.43.0
>=20
> --
> Ville Syrj=E4l=E4
> Intel
