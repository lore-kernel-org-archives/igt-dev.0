Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38804C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 04:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E253310E258;
	Mon, 15 Jul 2024 04:52:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTqUIqi/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCB310E258
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 04:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721019124; x=1752555124;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=V6aJcR/es19uFqv1wm8nMTt4/1xiZmqS1ZTSkKc3yZY=;
 b=eTqUIqi/ISMrf/a0SV9lJ1MpKU2jhuB2MxsMpKVdVv1c23f9zt0lNvR1
 pgcdGAJ6eUYHBEc5Zx06kNky/gejFBAqPUINwkkKzijJtYYNBIRAGfu9d
 2q3g4aTaBuqIJZUQrDKGpzKUunfn59M+bjaRpTTWQHd/nOTTpU4e7Zm26
 24kiqteaiJpa8ejbduT3nyiM0W7EjlJ8/dmPkY3ZwKusdrps8A2SuTZEJ
 Cpzd74qgcQtYNwr1DAduIHMAG9DrCM2d3yltAc3GaF6QARzoN8Dqw614E
 YkPzpT/wkJ5JEhEeVeGl/waCsZWLZwnnboL3TJslkt1pi5c3QXGwjM7vz A==;
X-CSE-ConnectionGUID: bMQz462IQbW/WMQp80IU3Q==
X-CSE-MsgGUID: n/hotv3vQQy4YR22LVDrnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="35922091"
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="35922091"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2024 21:52:03 -0700
X-CSE-ConnectionGUID: Qi2enGbDSXadaK+mfBMc5A==
X-CSE-MsgGUID: u2TdVqiBT3ObQxrQbzKHzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,209,1716274800"; d="scan'208";a="87006516"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jul 2024 21:52:04 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:52:03 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 21:52:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 21:52:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 21:52:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f649KhyH4vlKlc/TXzJNI2oopQ5iaQDgPl+RKtUzcKXLATqgSywGOBvH8zl2NwKlfFEaM9lb9ktm+4e7ODSR56886dTuwKJEgachP5X787bElEj3EzNzuLDIPZcKC5Fr9FB+lOQqLP3LqJUTSLQV4Uq6nNhCjbYQuD32MBHWX96SaLxx0HavITKH9Uj6HtsRhrLRt9NDGeiqMyFCb3yKRijqG3c5kc6eNmpdjtjoyBlzH/nL4xzpxIy7iPh7tNzrtIHdpusy7WtvShsB3yL3SF+XGHpjIVsEDNiPY0zlrUhGThPR+HQkhJ+xyE2zPfG2bcqns5R9dw4Ejnbm3wLX7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pPt1e2hxrsT58y9QQZzfgYVay6E+sqVXaB+BCsHUeY=;
 b=eq+xi+iICCPRSWQTVqu8KCPVBbImxmWBl/J9UUJ+D3vIUFbWJgYGmJ2ImjTKS6pusU10Nt2t/6rQIsJur/93Cr128lx4lnEj0jFa9mEeGdYLrtXaFkgJoaNvfIfaog/ltT1UbCrxN99qLg9stcmEnhlCdnT8sqHkvmN6gdmUX2ic8MVtzDxw5DKCHPGeXmE0RC7Vi/k7s3s9l81kHmhO4Na1KSHPgFqMnOx5a7zX5POSFYI18mZ+n7y/Bj6fHAeAPsUMjkQGFWNCjigwjQiiWb+F4EwnbxMPWS/WR57bV41zREH1ZBAlRVAFZIv3JOiCIfvKKZfvIGWRzyUFahDvXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.28; Mon, 15 Jul 2024 04:52:00 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7762.024; Mon, 15 Jul 2024
 04:52:00 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "Naladala, Ramanaidu"
 <ramanaidu.naladala@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the deep-pkgc
Thread-Index: AQHa1PV39edj5hsR5U6ySbjqa86DiLH3OoaAgAAAdqA=
Date: Mon, 15 Jul 2024 04:52:00 +0000
Message-ID: <SN7PR11MB67506BB96D17FA388606BC93E3A12@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240713072646.551590-1-ramanaidu.naladala@intel.com>
 <20240713072646.551590-3-ramanaidu.naladala@intel.com>
 <DM4PR11MB63125E5C29432B41FF08FA6490A12@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63125E5C29432B41FF08FA6490A12@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|DS0PR11MB6472:EE_
x-ms-office365-filtering-correlation-id: 67806f6f-a3c5-4b0b-fe4b-08dca489dcfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?TAOSoiy2S0B7DB/A0/Hx2UtROwsHs565enrr8BMr5UypimPp+3rfEARr7w8N?=
 =?us-ascii?Q?LXXzncer5Yg14af8Lon0LOyIkjjXvTuI95ETzWdKyv9nvdZkq9WHynJvIqza?=
 =?us-ascii?Q?fBEUXTzh8a2v5nfmeYiOcjNM8HbOE1GKtJ1f4gMmtbHyvstqKUYMuZ0UBrEj?=
 =?us-ascii?Q?YDi81HqrvXJzAZFLdgqnMKroyEuffh6rA2P+N5okRmWluZXo2LXXAOPzN42l?=
 =?us-ascii?Q?7Qf58pkubKSQmGsYWWJHSu7vhIxirIw+E2+HhXWX1DH/f9hAT/cBY+0S91UG?=
 =?us-ascii?Q?IQmuti7dIFvNwIQ6Z2/jVnhHb4hhs7f/SUkbrfvfY0/hbxZ6QnDKbih4bX36?=
 =?us-ascii?Q?BNlMh+WbQs3/TS3PYanWRA/7xfTE+euBVaYwEyvxsOkTK5DbJ8qfey4rN14q?=
 =?us-ascii?Q?8NnRK0/AvNS7vY7M7HlFmwskyIPhz7FK4NHdH8zmdw/DIYi1Bb8xC5PJ264K?=
 =?us-ascii?Q?dwIP8nAhr4wXvSbPQVNYk8jwfoJcTCsa0QDZiSALhgGC2NAm8avV1i7pMMUv?=
 =?us-ascii?Q?HLBvVwJ8AwWUsWeNaDgQRXop8D7IEoCtEgQvWx8sVyQPV9+2fpEVdTbLmp8s?=
 =?us-ascii?Q?lgOBd4ISHu9m2d12pW3V0nGrTw3/kk5FoAeFocGxJOdStqi/pBtZGwRgwAAW?=
 =?us-ascii?Q?RhGT3kqbe5UXbculaWRmo+XLjb9HlHe++bkoJnTWq2o6Sl9J6dc6WSlZvQ55?=
 =?us-ascii?Q?E89yb8+Pn3UNrekzEWvAcZNtdkMxCYfoUpu+4wdcmADfSbLrkffiylYNaTAJ?=
 =?us-ascii?Q?Ps2ytcM8HD051RKneHinvSOqws93ChPcgKQJ4BPT1ppz9++29OM7oMdHFnoL?=
 =?us-ascii?Q?VKt4sb+ldzOBaHHyVic9CZbgS/yScbrDQDjASQr4VLvQK4dx0oNnN7Vsgcr5?=
 =?us-ascii?Q?EgYzvFGTgBFPTe/9JRlksY6gvZA6x1xnt7UhQ++3hL16PhJ+OQ4sTNh7c1O5?=
 =?us-ascii?Q?vzyjowzthZ6CPguE3zYMaQWlaE0p4Fs4X1rgOoDTcTpV+iLMsSXbn3pYnhVY?=
 =?us-ascii?Q?F328lQXr+gv4MMoAlF/zZFke5ZKlwWVJMyzVCX1bx/xipoGTwM+5OzJFGnDS?=
 =?us-ascii?Q?KEsTpXa9RP0hN3rWho1mOTdYOjwn1g9SOEFSGWaSVwRRSfgNg/fcAnoTeGAM?=
 =?us-ascii?Q?esaRtZy+xQNhiIEicBJm4gKeJc203ANoFfhiwGpueF7KD/WKQGvsrWMPOJYZ?=
 =?us-ascii?Q?3TwDbrWB4TTaRg1B7h2bP4raA2J3BLRsgFNda3tUz6rZfVr70/29JTOD6FN0?=
 =?us-ascii?Q?wtOb+i+eJKDnIfG9vke+ytgaPdOBCtP44BoOBnBcJ4sWvgbaYyEjRl/Of/nK?=
 =?us-ascii?Q?zjf7h9lGFZ7zZ1qEzDOn5p4mfSk0E9fgUNILqyWu6rjGLDZ73NCY8qrqy3bd?=
 =?us-ascii?Q?/coTqnpx2BcxyaZRVUIYlKcKBvkJlEbloHS4qppRD8sSTmADUQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gVEXZFwWrUgBzhz5fo6svGslGrE5/33lMMvVuRCtcOy828zZ8ohVKfIYRdyD?=
 =?us-ascii?Q?QaYw85j1ec64adbW1RUeQXMI8DRxXXEq3/9bWasAtkx7JzS5C8rUMup1dwAu?=
 =?us-ascii?Q?znry7noEoJJsVna3XBfbubSMaqvXo1y+Q/y4S+SOlgnVcZu4ktm+Xxp7E6G9?=
 =?us-ascii?Q?FuJ/m3HKrZBtuKkoyjQcAZoP46cSARqvtdx4d9dSaFEPfJ1omyypfy9GfH8K?=
 =?us-ascii?Q?9PkzVSdQghAkrkkutY836Iy2FHrxZuPAGi9/+++/J0ts9eZ9oEpnQuwv5/eq?=
 =?us-ascii?Q?lj7QGfhusAp7s8W2zSHBRQjzlNu0Jre15YMg0Kx2bZkcLKjRMSvaJnkx/qCj?=
 =?us-ascii?Q?R7THuKmu5gHcqKW0p32coYUFJiPWWVtQ8St0S+LaLfbgs7xeWH7EtfGv1qq3?=
 =?us-ascii?Q?FkQ0HAc9yOQiQUUlsHwPW4RlHyIcDBn3CCIvxeeQZ1NpQNyP7Z8mk6SoQDjY?=
 =?us-ascii?Q?S5C1WIS1cQl6lqs9bkpaKqmuR8ujTqkNNVYuCID85OxXOPDoH7fWUA3l4z/s?=
 =?us-ascii?Q?Y5QKC2BYcrGj9o55LdmDo5JovuUJ4GnVA4b/nsuDznI8oPcVZ0ureeJu6aSU?=
 =?us-ascii?Q?0MmPQEPgJG8agq+bDwuOXzkFdYchTmzbsijRcHolznW2WcLlRp/ZQIHtXZA/?=
 =?us-ascii?Q?eLux3q5yxQd8QUx3vFVXdfpmgCPVHsRu63b8TUQwd4UBpXHuBWL20KVsWkKH?=
 =?us-ascii?Q?0m0LA1np4lJ0f8FKBuT5LgqVqXnic3ALDMyewiPvp1nfPc6n/nj98VOd+n7N?=
 =?us-ascii?Q?6LQhFeN4/UD4FyPV+gfqW4UZ6/8BZzCc5/qWQPJvV8CzrtTb4lxIj319i4oI?=
 =?us-ascii?Q?OUdETmksz64aoa+bbWsz6T5LfqPHbpR3BpAcFOj4TI//3YvQKpyUKgW+4DhY?=
 =?us-ascii?Q?Ga/NIf3Oe2Ezn/bXwJKvvVJIpCCC4al0qHwZDG+m0MHpYptAK5X90sDrrii9?=
 =?us-ascii?Q?HnyrB5yWe5/j7Na4iVpzRDuuXdjP0w46/YdikFgdurUrb4oXxxRtiK+PLCBA?=
 =?us-ascii?Q?Moxn2ro1lXD5RjmJPGHFyGs3dnLr0l+3U7l5BnMYi2eiCX6wyrFYVDqxRAsU?=
 =?us-ascii?Q?GFjnm2Pb9I/OK8y3P66NUeptbimIl2W8e1li5SBbJ6LTDv0S1V2wTASWJVl4?=
 =?us-ascii?Q?oDZ8OK6sNe6LCCf2pD/Y1Pt+kPTAiMpm0ow1h+AQ/Wm/6M/VCjg11isE6tv7?=
 =?us-ascii?Q?2bRGBrCUY+JIKPuQN/NqkLEgrtV/YuC+CZKFtjKOxqYaX3qQvcU6146HetUw?=
 =?us-ascii?Q?8v5+i1VOijkrFMXB3/rSgZUrkZLvr9NyHFnpciU9r7nqKkXcBViisMs8Wfmi?=
 =?us-ascii?Q?UIMqGWwsfkvxv/8gHfKf0Lcl08wGLGnZ+fyoV7iWBvK8IHOwlthGIvgk/qT8?=
 =?us-ascii?Q?2v6FqPLGcq4xqeZazXcTGNyhA1LX95owqWrG2quEW6rMuFJ29OaG420F8qAF?=
 =?us-ascii?Q?BIuGydy0B1DQi2gxsb7Sf0Pn7HItA4ENgW2vWikM3ZWgIHj4Lztw5kDNWRo+?=
 =?us-ascii?Q?b3SnwdgxNdAhQJf14w4e9y3JT8Nzpjdqsym/NAqyw2pVW5ISOH9wgJF9JBLV?=
 =?us-ascii?Q?bH3HzBrTTMae/zJjAcO7tNaXl7Y6AulFPDdxlDPG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67806f6f-a3c5-4b0b-fe4b-08dca489dcfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2024 04:52:00.4196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3cMreeBvSZgrogdYqEs4/4IIJN4WNPtoXL8mO/q7fnzowpPhjb5esU7hoaGeXbKJ3rRSOl2o6yuwEJ5ufIrFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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

> > Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Improvise the
> > deep-pkgc

Improvise ?
Do you mean Improve either way the commit header does not match the
Description please reword it to say what the purpose of the patch is here
=20
> >
> > Add tuned delays to check deep-pkgc pkgc10 counters
> >
> > Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> > ---
> >  tests/intel/kms_pm_dc.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> > bca5bfa58..2155b4625 100644
> > --- a/tests/intel/kms_pm_dc.c
> > +++ b/tests/intel/kms_pm_dc.c
> > @@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int
> > debugfs_root_fd)  static void test_deep_pkgc_state(data_t *data)  {
> >  	unsigned int pre_val =3D 0, cur_val =3D 0;
> > -	time_t start =3D time(NULL), duration =3D 2, vb_delay, delay;
> > +	time_t start =3D time(NULL), duration =3D 4, vb_delay, delay;
> >  	enum pipe pipe;
> >  	bool pkgc_flag =3D false;
> >  	bool flip =3D true;
> > @@ -618,6 +618,7 @@ static void test_deep_pkgc_state(data_t *data)
> >  			igt_assert(igt_display_try_commit_atomic(display,
> >
> > 	DRM_MODE_ATOMIC_ALLOW_MODESET,
> >  						NULL) =3D=3D 0);
> > +			break;
> >  		}
> >  	}
> >
> > @@ -638,23 +639,26 @@ static void test_deep_pkgc_state(data_t *data)
> >  	setup_videoplayback(data);
> >
> >  	primary =3D igt_output_get_plane_type(data->output,
> > DRM_PLANE_TYPE_PRIMARY);
> > -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> > -	delay =3D 1 * (MSECS / (data->mode->vrefresh - 10));
> > -
> >  	igt_plane_set_fb(primary, &data->fb_rgb);
> >  	igt_display_commit(&data->display);
> > +	/* Waiting for the vblank to sync the frame time */
> > +	igt_wait_for_vblank_count(data->drm_fd, data-
> > >display.pipes[pipe].crtc_offset, 1);
> > +	/* measure delay for half frame */
> > +	delay =3D vb_delay*0.5;
> > +	usleep(delay);
> > +	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> >
> >  	while (time(NULL) - start < duration) {
> >  		flip =3D !flip;
> >  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
> >  		igt_display_commit(&data->display);
> > -
> > -		cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
> > +		/* For every 1ms polling for pkgc10 counter change till 1 frame
> > time */
> > +		igt_wait((cur_val =3D read_pkgc_counter(data->debugfs_root_fd))
> > > pre_val,
> > +				vb_delay*2, 5);
> >  		if (cur_val > pre_val) {
> >  			pkgc_flag =3D true;
> >  			break;
> >  		}
> > -		usleep(delay);
> >  	}
> >
> >  	cleanup_dc3co_fbs(data);
> > --
> Please merge the patches into one.

I think its better as two different patches as both are doing different thi=
ngs

Regards,
Suraj Kandpal
> > 2.43.0

