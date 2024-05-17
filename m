Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E75F5C04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 04:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6602510E3A2;
	Fri, 17 May 2024 04:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1DhQKu1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DE2E10E3A2
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715919637; x=1747455637;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gMRUYk6XsnhXEngDYlTAJUZsUJJCArKg9aNYJyhNYI0=;
 b=Z1DhQKu1ySXG8wVWtLOTUYHFznQ3TF0hH4xSMU0pCAAwJEvMQprjOSgV
 Y1Pj0LcXAf6AZ3iFzGaIGWCanj1jshkzc4keo01CVAxfMucVvex60iecj
 aouZMsNlGC2FDZu75XN6nv12RRnwlyxC/oUIX3VKgUvao59wccNjlWZeU
 BNiWJL/cNAbrIjF7f+b9RdhpyHwHykbjO5eduJtO3j5o6uJXibuKqEq/s
 7OlFmNakINlfn9DmOQu+c8sMK8sZXKB1okWhpjay9lA7B0446HSYajwby
 JALJ39DB5KOkRTANZWH3UO7A8u4ebyZWOmR2VT35WYVXKSucoLvzaBUmR A==;
X-CSE-ConnectionGUID: 6eaebtMmQuO63v3nInaq4g==
X-CSE-MsgGUID: 9TlArtPVSqqv1+DBEkwYpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22680828"
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; d="scan'208";a="22680828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 21:20:36 -0700
X-CSE-ConnectionGUID: hy7HTVMsR5G2LecXcs4PSw==
X-CSE-MsgGUID: 77jTx8apRzq8aY9+TK0euQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,166,1712646000"; d="scan'208";a="31595554"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 21:20:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 21:20:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 21:20:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 21:20:35 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 21:20:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=noJGJRt58ZdLXN2Tq/3nm3zSirKBw5P1Z0+ZLc5LPnqa311s4zeLnwoFgTPtjoJiiZa+1nztLtAK3r2aFGvS7+klV3cYca9rbGcwCK57av7IV82+Ol1vRddv+UVPWpfReNmfhkrQPiH8cXBgz/rvbjRx+xmGrfnZchrs8nwOTM30ud4PyIIHmBPeeeCYxGOKpVrX+ayt0mTai32G79hYacwQYQK/HLl50OM7mGfDPSUJh8jWHQENwVn7CiyGQEqwpE+3xxXFp9Rkx0dV1bGc8aGDJY0PvQOtIA6tBgZFwR2yVwB5yAOD6UyMSUppDg0J1L2oySTBI5ih014lR5ncmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vODlrRVMfuYf7ro8Ju9miR2GWqKLAXA1T1IyeEokP8=;
 b=WJYnKkU3N8tgWXWm0/ybVwLlrXwQl80mTh5vUkUjExEGgsJnF2Pio3/4LZ+mtysWDoDiokVH9NDiRWmTopNEaoIlUN9EdyM8A/YrQ42Rjl3ECKIsn0NfkjEjS4O0EBb8HNtADzYtL0PsZtJ9UsAntAmuUjMOcBi0ZbzHO+mo63K6/sZQTolAWlA0+JvfRGFHkfItAn6P5su61fpucih/Z1sNZT+rQZVHreIm+W3o1iVGJr71dKAcra7pdJryZCnFFoecINHi9ttaCSPQUw+9meDk241Xgbd2F3udSG1hV1XkDFomWQ7JRXPtafO7Somz+UTtwAOjKa7Pe/Is1sIEZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by MW6PR11MB8309.namprd11.prod.outlook.com (2603:10b6:303:24c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 04:20:32 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 04:20:32 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rpm test
Thread-Topic: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rpm
 test
Thread-Index: AQHap34EHgQSHZbEoUCoM7X2ioQOEbGaC02AgAA1noCAAJL44A==
Date: Fri, 17 May 2024 04:20:32 +0000
Message-ID: <MW3PR11MB4748EB5359D81E8979D00482AEEE2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240516104513.2685597-1-janga.rahul.kumar@intel.com>
 <knii2c3mppj6gcz33qfvevgm7fe5x5563m56jg3bb2qsa7praa@gnjlqbfee7wn>
 <ZkZfk19wfBUFnu6d@intel.com>
In-Reply-To: <ZkZfk19wfBUFnu6d@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|MW6PR11MB8309:EE_
x-ms-office365-filtering-correlation-id: 48932f0f-7a07-4bfb-b63d-08dc7628b158
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?LuST3gfjkWbVVm7ESNRuywxxARnpNv4DlETepadqRc15owRFxk/9ZqsqR71E?=
 =?us-ascii?Q?f2F26zqHa/jFJwubq4G4Or1RINGzmVJWYG66iuuhOOCGM0PNjdMeGxvRyyZ3?=
 =?us-ascii?Q?Dx+kzZ9pswP1bXdVzIlvFfuEdwNF61RMBb8qmlwFgkWz7CAWrObTHMdOmNzl?=
 =?us-ascii?Q?PjLaN3xPetxVkwCVmSe6abN6udpYjX3R/qCbfAOPY0A4EK4CBQyfO2fKvdH1?=
 =?us-ascii?Q?q9pJGlWz5P2VQVwkjSsCZFgVe6cFulagjPwfH0Fze7c4XnucX2iGbmz7x+PF?=
 =?us-ascii?Q?um+gFE2w3OrTglg8vmq9pVKGu8DEzaSN+FBa68aGokIA3A0atFt+aS6w452U?=
 =?us-ascii?Q?84JCJrCuVY+vyJtpY3G7SuUI+4IwE6IL2f2g0+RDubtMPklnulTFcIjdwCU8?=
 =?us-ascii?Q?B3fgbM86q3W2rYbXJqe585iqjT6UgBZBNr8SShGGtr3XG1YUU6ak3ni8PuFK?=
 =?us-ascii?Q?hm+Qhd0z0GxPrkkFhqO2VuyfXujbNouPWEoCej9vCUrJlfmm438af3/wzo/p?=
 =?us-ascii?Q?KvsSueEoWmHH2gVdLViP4DvdQ1ryu7lsUHrdTo+ClY/xeI+oPOphJ++NXdRI?=
 =?us-ascii?Q?U4auSs0r7VkvQnhPqGalzh/eHBbuVOC81vubeu8CvPOgCEcabc3XFKhwHtAj?=
 =?us-ascii?Q?zBa1F3oOBW/epY0VB5tSYJaU5vJKPnNyRydFJv5YmOnPLXQxBCTSL5t/hdHp?=
 =?us-ascii?Q?uchBsOV109+4izQTiqXczAilBC9n75qIMFELYLJy9LkSkXZcH3kKCDTvATGE?=
 =?us-ascii?Q?bspIwUKKhLh0bg0U9B/jqBLY05tbd7lT8VBGokIEfDPK+sB5Z/tqLbe5qWS1?=
 =?us-ascii?Q?+VQdxYI8WuqadD0i1DOeknzAsTDNEovGUOEwbZ6j7ynQCpS8bPwub1hhtfVs?=
 =?us-ascii?Q?xnMNi9+rrnmc66rezY7tVgDGbbtaD02hhgopxT2CqjSabclp9aE+HV6JXknC?=
 =?us-ascii?Q?p5PI+tQTEz2diE6rEkqoB8nZJI7iE393715nkj6aoXCKH0bq/wg6I2Gy3rW7?=
 =?us-ascii?Q?BVFcugJXX9TIPQrLLtz1zKXn0DCPC9x+YRTwZHtV4eqtFQ36ZttCuEtM8Gd8?=
 =?us-ascii?Q?x6+41bKtiIVi5B3Llsoz6O+bCiNXs+R6CjavBEYvimIZCmPTHxX2LfHMqsn+?=
 =?us-ascii?Q?+/02D3l53H+YnA8KLvyDpLJEka+W2RhBmpcXfBNSx01DOyrMsylRqRW1breH?=
 =?us-ascii?Q?HpDmO4HnMgxLg7pDLVYQeWaYKIrgm1NVkM9tpQkQejwE+tJp6YOCjXPNoP90?=
 =?us-ascii?Q?MyLKs/PmXfcJ2/YUK8hhi28NYEjUqo/4ybFxwkrOqg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XL9nYe4Bl6R1ZRlRT3sT1WNGmaffIm76LmmL2khBqlZHZkkd2nmRjYDY58ge?=
 =?us-ascii?Q?M2/w0Pbz3sprqMS75/iMv9C0F8xUADJXliCyuZAvjZN4f3mf2GWkBFyJ4Qgh?=
 =?us-ascii?Q?1cJvtjGNFlhjJ2XVxfFmxtFGJcIGXMBCSNxM1U9jAIhkQ0db2YI/SP6OVATv?=
 =?us-ascii?Q?dIzotZ4UgrHOafiOQG0H+DDOQWkegloUuligbI1yj8kDMeSpB60vRtcCYyT8?=
 =?us-ascii?Q?jvALy4ms6Gn42LagYSc+fOswTJcyIflHp+IkXpSABH6jb0fpqUShSyzA8IEQ?=
 =?us-ascii?Q?7P/i26+EHKwEtgwKBhDsb59uz9oIr0MVTBIszXhvwYlYBwFUubyqOS4I7AWl?=
 =?us-ascii?Q?0AsVawts24LqCS91UlA8TZjOrB4kRUGeD675G0Lw6+Lc1oY/rYUOu3PiXIkg?=
 =?us-ascii?Q?Hn3WrQTjr+71Ejo2Vv+SbOYb8Q5bixB+Ng5pSj80/kaDv+/4VIiCBsY67Yee?=
 =?us-ascii?Q?c827NC5AAauHd8JJNYd9pDZPt7NYLBBtxCYZY7KOa/NZzbAiSpuwez60LRSD?=
 =?us-ascii?Q?LEt8sByizxnX/P0ER+a5tw28PLka55CHA+4hSzm4GrKmYBPlKQ/4+TkOIGhv?=
 =?us-ascii?Q?fTPvSuPfb5le6xhlqaH0sD46s9MKZWx8BeNtzGwtliWd6ayu6ooQBDOeoQ3m?=
 =?us-ascii?Q?42vu7pagWoN1uvQEej1ua+kose3bNlWjiBHk+NlSxaN3dIq7qVOTL04uS6+4?=
 =?us-ascii?Q?9bzZRU8c3LCB4n8f+Pv00X2zDUDYg6MG5bFLtcuPb+76Mv5KxHBKo2pbiBv0?=
 =?us-ascii?Q?tv/zCHTTxV15/NnM8goN/mNDm9f51xZg1seefF0L0vk3QWJZemwrtbMEfnUK?=
 =?us-ascii?Q?XrZzW32XECMQZVTEkqLZeJl/gcGcQ38ymAeKcOaIhcCBXJuaDNoKiTmK5UAL?=
 =?us-ascii?Q?EydjsOGrK5AEDvBwqewzBSHRKx99s0I+poch+dWCFGgB5cxmtLu/ET19h2IQ?=
 =?us-ascii?Q?ooYJXVO8qZiqBPu4zNsuOXtCDHAx/ZR9mBelvXVXI0iJlqTefb74UkjbyjYx?=
 =?us-ascii?Q?k6yC+y8a8HOBei5y8maxoyPosiZ1GKG1LQQhxS2DW9/RpIONz1/levPqiAu1?=
 =?us-ascii?Q?yqOhjkqSiKJ+TC56TBaoxryG1iZnvics3fhUIu0soMFhGPRRfKjLc00aZ8Bm?=
 =?us-ascii?Q?K8W0O1ja/pc8uCBfhXpVkVv//deBf2wlNwXWnCYF3XC7lRMNrKp8RZ9I3Wvb?=
 =?us-ascii?Q?UzTN30+puq7TXP80DF+a8i4Gr/Quqe1/cX+nLxoNrSuYnQe0s5wXC7ft0NCH?=
 =?us-ascii?Q?Aw0ftNFZ6rSPdMGqC65ueCmUq0zudqQIrGLq3vMRhqiPK5/a6pbLX4eLX4UX?=
 =?us-ascii?Q?0/9t6JuFSd8ih88iAbsOUrWHbdew+r/cQVjrbVa5W6wgiaTgEoocYIfVGEgD?=
 =?us-ascii?Q?7q+MeBDGGTcdF7DKCRlQYtBGdrfuPwYDOap0DaQD/bldATFQyVx5h5/ZtO85?=
 =?us-ascii?Q?SP6dCxcTmmVZTkr1Y0AmIhw6yqndvNU5CSuqcUOUfkYFK3D8tyVu1u+Bc1lJ?=
 =?us-ascii?Q?TgU4pYtkT1Xe8uYsAwvUqVrz9V8Iq6iPRUe1sIQ511vGdaMDCivzRqQwjtnW?=
 =?us-ascii?Q?rR3eaoofdcPSw8iil3eElkYYGnjksmI9r6YDPkiwH/CDEbl+xzGCVMMy2i0M?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48932f0f-7a07-4bfb-b63d-08dc7628b158
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2024 04:20:32.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R/rG+0no6TvR4260fKqUfJTf0OK8EgVWuuF7v6MWIyWl62YQeSnIzvwj455w04IbMxr+qaim+2z5Csg1eszpfDNeuy02kKW4NPle4DjG6QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8309
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Friday, May 17, 2024 1:04 AM
> To: De Marchi, Lucas <lucas.demarchi@intel.com>
> Cc: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.com>;
> Nilawar, Badal <badal.nilawar@intel.com>
> Subject: Re: [PATCH i-g-t] tests/intel/xe_pm: Disable display for mocs-rp=
m test
>=20
> On Thu, May 16, 2024 at 11:21:45AM -0500, Lucas De Marchi wrote:
> > On Thu, May 16, 2024 at 04:15:13PM GMT, janga.rahul.kumar@intel.com
> wrote:
> > > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > >
> > > If display is enabled, the always-on components will always keeps
> > > runtime pm references, unless you put DPMS_OFF.
> > >
> > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > I think this is
> >
> > 	Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1818
Yes

Janga Rahul Kumar
>=20
> very likely yes
>=20
> >
> > right?
> >
> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >
> > thanks
> > Lucas De Marchi
> >
> > > ---
> > > tests/intel/xe_pm.c | 5 ++++-
> > > 1 file changed, 4 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c index
> > > 9cb00c7f1..b4a8c4d15 100644
> > > --- a/tests/intel/xe_pm.c
> > > +++ b/tests/intel/xe_pm.c
> > > @@ -835,8 +835,11 @@ igt_main
> > > 			igt_pm_set_autosuspend_delay(device.pci_xe,
> delay_ms);
> > > 		}
> > >
> > > -		igt_subtest("mocs-rpm")
> > > +		igt_subtest("mocs-rpm") {
> > > +			dpms_on_off(device, DRM_MODE_DPMS_OFF);
> > > 			test_mocs_suspend_resume(device, NO_SUSPEND);
> > > +			dpms_on_off(device, DRM_MODE_DPMS_ON);
> > > +		}
> > > 	}
> > >
> > > 	igt_fixture {
> > > --
> > > 2.25.1
> > >
