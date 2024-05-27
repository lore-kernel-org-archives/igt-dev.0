Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1A0C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 10:12:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1C210EE42;
	Mon, 27 May 2024 10:12:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Drnxjbmz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3265D10EE42
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 10:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716804741; x=1748340741;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Xa4XiL2LnCsCLtPKF5KBinbP8HXcwLJnc5jMQ/T7RE=;
 b=DrnxjbmztFcLjOFoaVd97AnVcz5G5xIn2R4kA0MHBl/M08lj1VadM5GU
 1x3qnUjMw+tkKasYjxmBQrqbzEI4An195gDLcT/oXKd6V759Gg1gzkxP9
 ksaHO64qm4GqWQFr9dj0zu/KbzQRl7H6fWBZnoJlvNihxA+OSjZStbbih
 cRYP7mWVeJGGJI2hmEfZNqgPCipBB+MZJ0S8XlvogyGBhho8xJWrgHy6B
 lnTFlCZYXyjZTD+kUDk1ANfl6iA4o5GeUMb/ysTcFFMQkWgDgGa4x5/R3
 NXh/ugLevTBRkN4iv8G0JgH/1Ut1TrqDHVqhNaPzWEgIIle7n45wF5Ocy Q==;
X-CSE-ConnectionGUID: QCes9EQJSJOgSi6qamXhdg==
X-CSE-MsgGUID: JeLHFo0KSrO6wY7GLydPTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="16903863"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="16903863"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 03:12:20 -0700
X-CSE-ConnectionGUID: PDjYVvRbT8mGL14tN896cQ==
X-CSE-MsgGUID: XjtMMRehQ3GeobyO1ahDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="39117238"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 03:12:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 03:12:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 03:12:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 03:12:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifSTMlKsluR6REcON/3ZDyjrdGpLNj/G3xbA7gMvXb55mbNY3AS9pAJN0Lpk7sy+QcnMk5qFV6g44Ve6CakhhRrLrSdJcwMpSnBLcLPQY70ZWnIb6jndV9ZnQAvargfT8d8zRUUfmLpcOiK9dnIHTSaFsueAMiyj4jCdMkSr8SudJl6C3i2TjYZX1IxLSL4EIMOTqRwR2t7nH1NhcpwRDWNKuIVe5nLXxxI39pgmEUh9Uhcb4e1J9vtPqqGaxturmz5/cqU0Ukxyph0iNvSAPyluhmI0WtGAx4WUE0uwdTvfaUVu/XRhLJ01lmavbMppnUcqCZQbHU89JtOn5dD7bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fR/lwJsfOJGcRQzAk7/dp5wKixh0MENlgnjp6l/xvk=;
 b=CX11QkWnuReDxtjiCVn2w+76nm4Qlmi+STXbnMrWarIlWZK+5+779jIjxEBVOxQGYTaeCJ1UGrUKZuNbQuUHZikXI/47d5uXP+i/PE1fB8uKlz0dq57j4hiSEEs7nwaFCUzQVvewYXNGUylQNzT/T8/JVqhHextkcKjHOaL3KnE/zXfmrDqnxGPvSil9IURVn4F+pR3LyrJB1+v4cazH9gEakf/Mw8EGVtKTbITRbHRg1AQLOX/e0g+W7P3OtGad/NwUFgZHGvWEz+k71maj46Jg1XhRJq3Hk/2fW+vaYQSAz+jDsrsXU6e25QBLQxs9QPjM0qSwDiYKoWrksHn7bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6884.namprd11.prod.outlook.com (2603:10b6:510:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Mon, 27 May
 2024 10:12:17 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7611.025; Mon, 27 May 2024
 10:12:17 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to validate
 the deep sleep state during extended vblank
Thread-Index: AQHar+wQPcsP8ojeE0arHVyT+hD6frGqhpCAgABWEHA=
Date: Mon, 27 May 2024 10:12:17 +0000
Message-ID: <DM4PR11MB6312933EBED4B00404A2E8A190F02@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240527041908.513920-1-jeevan.b@intel.com>
 <SN7PR11MB6750DBFDD724731BCC887A83E3F02@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB6750DBFDD724731BCC887A83E3F02@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6884:EE_
x-ms-office365-filtering-correlation-id: 5cf0f1cc-7a6f-455f-0dde-08dc7e357cf6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?nnBF3GsY+PUU1UGxJz/+eOqGxgjFdI91zc3jfB2COwQ8MlAfPxY8ZoEtZsOh?=
 =?us-ascii?Q?M0y4Ep4/LuvUCzp4ug9jBYj8dZaa5oZKFiQhGrEE8GU12ceNNJjDide6BRup?=
 =?us-ascii?Q?rFBJTlx14IDq43aEyh06AIjqEb2LPB64Mkeiv1LYdk21ZRLtHJG0hzOsncX/?=
 =?us-ascii?Q?05CF6ZTKLIz8K5ZXPnR9fwOwyagoigdcQU2ufMzFNnTfWwuAeYdH7tVrry28?=
 =?us-ascii?Q?xoiaIbs53YbmZQlzKfkl7C9XQaCJVyyIhHNQKDNdiyFeKVKGhwktjXkNhyj0?=
 =?us-ascii?Q?0qkEmhjs3TCt0yKjuf8yWojfa7oFEOwI0BUpMzCtyXQ+hjVbUW/WqxlalLhK?=
 =?us-ascii?Q?VTjpVIbe6YPr5+QC08K/pYdAok28VmVZZrzdJAphnM0BNcbo76ZZOSoAxkHg?=
 =?us-ascii?Q?SQgUOMHruDaDIESXnEpm1SIlHujnkltRqEX0JtnZiAE/uKN+ZhMpsIdJ4mYM?=
 =?us-ascii?Q?rVbsHB1w3i6T1NsKWzyWK8i0/c7ON0cyQc2us6Bv17Wjz6yA061wdpSKPdI2?=
 =?us-ascii?Q?kPK9umxSynrJYxc5Nw/m0Rx3nlItUvW3wiyTgdqVEe15CS4uYq2sKC45d6yc?=
 =?us-ascii?Q?p4fF1T+pXOyXQe6OC3TnoP7qYVGhqLaO6QnKs6RnGUUZot4fbg6LK5hvN+84?=
 =?us-ascii?Q?7OwMmNL+4+OhLUX/3sGl5EgMRoaIfhtXUuQVa7M3agLro86Ia971yBqrIBSV?=
 =?us-ascii?Q?Vd7v+OalPRnbON1tcURBAu+KKCiISGcFyAFSwdtFfhL961qd7zzUKR7//kBp?=
 =?us-ascii?Q?Fvs5fpeWsri5wUtBXoPJvNnMoUus/GTgulHEyzfKdTeQuf1daGPjuRAR0n+I?=
 =?us-ascii?Q?ozwxX7Bryu3s5S1Rn5Ztyxcyhi4NH4eQKh1b+0/3opfBgTG5ywCa74em8MNr?=
 =?us-ascii?Q?xhP9dbU+49coG+dABayjAVwpYvz+lBs4ERTOkv2sVMMoiCI+MpWOX34ZlN0t?=
 =?us-ascii?Q?8IgOn20QDywq7J8jFI1tm11RZgsFb230AE4wVXAbT1bv2zwEePZ72osEYJoJ?=
 =?us-ascii?Q?CWzH80dkGTqcvEDhBoAimoH6Sz6uDCpca8MysDjYWDppxTHk1nbO0oblIrkN?=
 =?us-ascii?Q?0yAQ1IHEiCPfVvrGduopZAyFV5TCK6Nj4UjM3TmyO//VJqSeUi6tlp1CgHel?=
 =?us-ascii?Q?RkGrXwSuCQZj/CQEw0BcmkMNoHKd5j9282Fwiqu2V4a0HtMdVGQRcI+/5yit?=
 =?us-ascii?Q?sgnirmuTcDIz6MqE0cY/oRl3UvPfo8GPrb+OxEfj836HCQcq4Evxtw3g1vCe?=
 =?us-ascii?Q?TDrv1KYnKwMi+5GAkO5IuUWkPWd1NjYmrxhZQVObS+VNRCr5Lg334yYl97Dg?=
 =?us-ascii?Q?ou9ZR6OuoDPG1eXWQ8dTnkDMWq5Ber54DXbLlriyrP0Zlg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XBFgX/SA0pJELp+PYf1EwSzrKTXePnX5ADHQ8HOLNPAPAJ/d27akwmhZ60uE?=
 =?us-ascii?Q?RhwS/s66CFmqvVIMH7ddyKZyWA5J4Oqlfa9d8VUyJE9sIkCNBnraxTZCwI/z?=
 =?us-ascii?Q?5nyKtkD7hYZwx6nfLSukpHVC18Yaceq9R70vPYqGuqsy8Zw5uupwYKe86RiJ?=
 =?us-ascii?Q?pN0jey5ewSt0eKvbNpbimLRXTh1tuh8JHP8mVFn0c9HBKhYSEDVwL91HUiYC?=
 =?us-ascii?Q?jTHEBZNSyv8KEg++s8HjGlpxWY5CQC83mPYZLlMCiRWaWPR6RIyuSAjjIIKZ?=
 =?us-ascii?Q?LOqE4cAZKRuMstKUeVee1dvPUidXKLAIipugHQG6cKIgae6pt2vf6/3krqco?=
 =?us-ascii?Q?IocyikUND3qXl63VlwzjQs1fgQVJM8pIxjHOqOe+TE6dSIl3rHnUjq6wddlz?=
 =?us-ascii?Q?NnVkseA0v4RQZb/tHwHhBYGlNzNda1Yrysw7uCJHklU4+/jRJRyIobzzGr37?=
 =?us-ascii?Q?/cOtciS4lGJjRpDS3MD/VUzAHB0ynS7sOtax3cse43duZoj4qFfAc24syDMV?=
 =?us-ascii?Q?xghEUUTbx00CBTw3arYqGjIdmLw/+kDbEam2Kiqf+Qm4T7T4741q6JQx8UD8?=
 =?us-ascii?Q?yhX04fNt/2O51YChMyFGjxJcKBwCjZkobYlB2LLieq6V6caazgnRVgz8Q1C2?=
 =?us-ascii?Q?hQJGyBV4uFn4jNm4kq1ELS41r4s5zb9l4fBcWD+/ScuQTG3bmVcdHa8hlwZu?=
 =?us-ascii?Q?UGUg2inDYoCyG+KXt58a0JWA6I+fX638BR2F9kIeVdzS3ed6bxdaYLJKpagk?=
 =?us-ascii?Q?DLwhJT5kBm9JgCGvrpnWjThUwwCgYAHXQHvco8P2+fZkt8/gIN0Yqta0eqYw?=
 =?us-ascii?Q?NOUQ9yibBNZHTkBsw0ApuVr6l3IrD4kWj53DvJBuW5tBNlF4BBmrYok/xX2e?=
 =?us-ascii?Q?b+jNN5ki8ItTzGaNTfu2hfGXBUWCY81Aa/qKQR4N4fbKBEz0jWCeEfF2xUpO?=
 =?us-ascii?Q?dK82ZYMf7UUHx1Wa9KGaSNHG5ziXytI+vEU17/Fog2wh6b5/GU2iCWrI76XU?=
 =?us-ascii?Q?/Pg5tspA/bw+62YMtmUkHObH1ZgE0JDQO9NLTJbMZj2TcDFizbP2pdg8v8LK?=
 =?us-ascii?Q?rIhO3djdS9Un57I3WYJ17QYWulYeZhUuASU6bzCJC7BE1Fxnrc4EROGwdydn?=
 =?us-ascii?Q?hUL9DndiSMgHEekYQjY8N02Q5wb1vItyGcmWYu6DD2/t/B5RAPj8IMY1VqK7?=
 =?us-ascii?Q?Wf0Cl6qSOqtQCPgD2hIYKnOofHdzS+TJSLcwO/4sH8KqoG8WgjKSokGV+Nad?=
 =?us-ascii?Q?ONNOidEVJBCV8fWuoVg48q9mD66d2re9TeqBbs1Ckzs74pIASc2jQikLRVfe?=
 =?us-ascii?Q?A8TeEaUBMyxnShyfHczWUUzwdDIhGigib4btihoqcbm172W0FqDwBYDdgvoq?=
 =?us-ascii?Q?J4d+TKaMWWQf+7rPep1mCrb7l7dnrDWU5qjxC5g4rTqpwt1azV56To5nCzPo?=
 =?us-ascii?Q?5XoHQYmdCGitbLOE4pS6Qu9mn0na6dbQecwp55nPhTHQsN/2/pWkT+k0z2hh?=
 =?us-ascii?Q?RBh4dj0LfW2k4tPUFMYURaD7jyz0K+TBhPIjmYX25/oHswKmI4x747xllkDT?=
 =?us-ascii?Q?ANcdwixi8NWQzcsALfQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cf0f1cc-7a6f-455f-0dde-08dc7e357cf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2024 10:12:17.4274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /TI6FXJ/Vc7pv0DGHlD4G115gFjPVsjwbvRB7G9kX0xY0MjCCo4RHyUFq7vlJmvlx6jAc9fwzmA/4Tz2eB7jeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6884
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
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, May 27, 2024 10:33 AM
> To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to valid=
ate
> the deep sleep state during extended vblank
>=20
> > Subject: [PATCH i-g-t] tests/intel/kms_pm_dc: Add a new test to
> > validate the deep sleep state during extended vblank
> >
> > Add a new test to validate deep sleep states during extended vblank
> > scenarios, where two frames are committed simultaneously for a give
> > time with reduced
>=20
> Typo here *given
>=20
> > refresh rate.
> > v2: dealy of one frame added to simulate extended vblank.
> >     remove vrr related debug checks.
> >
> > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > ---
> >  tests/intel/kms_pm_dc.c | 49
> > +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >
> > diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> > 7766d34d7..9f89e537d 100644
> > --- a/tests/intel/kms_pm_dc.c
> > +++ b/tests/intel/kms_pm_dc.c
> > @@ -584,6 +584,46 @@ static unsigned int read_pkgc_counter(int
> > debugfs_root_fd)
> >  	return get_dc_counter(str);
> >  }
> >
> > +static void test_deep_pkgc_state(data_t *data) {
> > +	unsigned int pre_val =3D 0, cur_val =3D 0;
> > +	time_t start =3D time(NULL), duration =3D 2, delay;
> > +	enum pipe pipe;
> > +	bool pkgc_flag;
> > +	igt_display_t *display =3D &data->display;
> > +	igt_plane_t *primary;
> > +	igt_output_t *output;
> > +
> > +	for_each_pipe_with_valid_output(display, pipe, output) {
> > +		igt_output_set_pipe(output, pipe);
> > +		data->output =3D output;
> > +		data->mode =3D igt_output_get_mode(output);
> > +		setup_videoplayback(data);
> > +		igt_require(igt_output_has_prop(output,
> > IGT_CONNECTOR_VRR_CAPABLE));
> > +		igt_require(igt_output_get_prop(output,
> > IGT_CONNECTOR_VRR_CAPABLE));
>=20
> Why are there two igt_require checking the same thing here?

To check VRR is supported and available.=20

BR, Jeevan B=20
>=20
> > +
> > +		primary =3D igt_output_get_plane_type(data->output,
> > +
> > DRM_PLANE_TYPE_PRIMARY);
> > +		pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> > +		delay =3D 1 * ((1000 * 1000) / data->mode->vrefresh);
>=20
> If 1000*1000 is constant why not use a #define would look cleaner
>=20
> > +		while (time(NULL) - start < duration) {
> > +			igt_plane_set_fb(primary, &data->fb_rgb);
> > +			igt_display_commit(&data->display);
> > +			usleep(delay);
> > +
> > +			igt_plane_set_fb(primary, &data->fb_rgr);
> > +			igt_display_commit(&data->display);
> > +			cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> > +			if (cur_val > pre_val) {
> > +				pkgc_flag =3D true;
> > +				continue;
> > +			}
> > +		}
> > +	}
> > +	cleanup_dc3co_fbs(data);
> > +	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n"); }
> > +
> >  static void test_pkgc_state_dpms(data_t *data)  {
> >  	unsigned int timeout_sec =3D 6;
> > @@ -687,6 +727,15 @@ igt_main
> >  			test_dc_state_psr(&data, CHECK_DC6);
> >  	}
> >
> > +	igt_describe("This test validates display engine entry to DC8 state "
> > +		     "while extended vblank");
>=20
> *during extended vblank
>=20
> Regards,
> Suraj Kandpal
> > +	igt_subtest("deep-pkgc") {
> > +
> > 	igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
> > +			      "PC8+ residencies not supported\n");
> > +		igt_require(intel_display_ver(data.devid) >=3D 20);
> > +		test_deep_pkgc_state(&data);
> > +	}
> > +
> >  	igt_describe("This test validates display engine entry to DC5 state "
> >  		     "while all connectors's DPMS property set to OFF");
> >  	igt_subtest("dc5-dpms") {
> > --
> > 2.25.1

