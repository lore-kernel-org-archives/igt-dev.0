Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51776C25B76
	for <igt-dev@archiver.kernel.org>; Wed,  5 Jun 2024 18:06:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B180510E314;
	Wed,  5 Jun 2024 18:06:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k1K9Q4tV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0336310E379
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2024 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717610765; x=1749146765;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FCqp98J/PLp5TRJvPtjTFr1GGl89j5BTBI7LBgDh2ZQ=;
 b=k1K9Q4tVAYPJnE/5mx4tE0WQyNkii2rql76ZvqBI3dHmKpkmjAJPh4Vc
 EocIpV0jtbiuovPmZP0qjcsmop8YYb2RsosNqDVfqYS2i+efLxOzdMpzX
 EFk3ClYSeAl6WnqEG+mOfJLoTJOIkWAyEtYacYDY9kLE+Gj9RiwOgsPIF
 IfxuGF/VexFwEozfqCkVzeJqQkAlJRz1LaJYvMEU+w2UONQkPX1st8TCx
 /AIE2S1wphzpGyIIs7y5tQX7uJarC+5dtSfuqlzxZRWY23Kgc+pCKK+N8
 PxaKMUjXAoCMEynzwPZV38lD85seGSnxka/3U+4IE+CBbcvnCpBPFE49O Q==;
X-CSE-ConnectionGUID: KAaUxjiZQ3yX2n15kjmNIw==
X-CSE-MsgGUID: mg9nxZHuRtCQ/FH4CGtusA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="13987307"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="13987307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 11:06:00 -0700
X-CSE-ConnectionGUID: UGCda66MSXib88nur96iuQ==
X-CSE-MsgGUID: hPdx/DiEQtK4wewQzVKlhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="42090732"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 11:05:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 11:05:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 11:05:56 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 11:05:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2XNSQ+Ge5s+QPENkVRGMcJFXqL8Rpo+K2PiFbVr6uN2Tyvbj9WLMLCS56a2d0if35Uxp27/6Fgc6Hll5dukU3TNG40HcCK5fONP4pB5ahHZZOjzCH0RGy54FPgGpKWVZY/r78oKm/bMxTUY1dBabE91LVgFqKPqWNwNC23gxolshjk96wqecgwUjHFnK9c6as1VqaAW37Q9IBjk74bF6RSlFaZTh8jm+onzTaOE90HKQ1WZ9n5I+mo7fbWuF4ly2BhrvwhzygD+93JXgVKu9SNdEVznCb0USXrw1F1jvclXx3zV1mfJFYEa8OyHD2KheCRzKtXhVexHAdG2V7VgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEoC1ihR5FMMpJWtQW1Aa3Jh9SFqfT3KcztNrmPo3K0=;
 b=fAR+SnrfofMa0smopyUbIfOOlwwYMdqGLGS3L5CM3dsatMR7A5oF+4txNEOFwtDx3sQy9HN21KQ2iu0ytXI8yKYcIltZOPD+flys1QCkdWC6bylGEPtEDqjdBnptldTC+B+bqj3c3kwHDFsssajtI0r8RgtzVRp+B5MgTk79dJaqP62HxBJJ7epiJrWaXJs16zVLnRVr/C0MsmXpPjoV7GtzDk4p1wPN+Vi/clvW2Yo1guqqlmaHYDjQSJ9WtrwzULrJzN7ozfbwxutcnPgMqzBh98FjmRuMhTeCoxTydMpbNdNxLvetTdAmLDmJFpu9usbqeMzefupUf7V2yfGoTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM4PR11MB6263.namprd11.prod.outlook.com (2603:10b6:8:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Wed, 5 Jun
 2024 18:05:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 18:05:45 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] lib/xe: Add sync and async xe_force_gt_reset
 options
Thread-Topic: [PATCH i-g-t v2 1/2] lib/xe: Add sync and async
 xe_force_gt_reset options
Thread-Index: AQHat2hMda85jsY9t0uilPcH9VpzXbG5ZjmAgAAQkQA=
Date: Wed, 5 Jun 2024 18:05:45 +0000
Message-ID: <CH0PR11MB54441C9E9F9FBF72C0CA1974E5F92@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240605163344.2747072-1-jonathan.cavitt@intel.com>
 <20240605163344.2747072-2-jonathan.cavitt@intel.com>
 <ZmCaxdc1soZzUKMz@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZmCaxdc1soZzUKMz@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM4PR11MB6263:EE_
x-ms-office365-filtering-correlation-id: f70ccd73-5b4c-462e-e425-08dc858a1f6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?UCJOWToXta2m9dxXmq0R69LcF+Tb0R4lkSmo/F9tAfgxntTw5XfsXH3W25Qf?=
 =?us-ascii?Q?24AK2e749m8kITZPj1Fp1xzjC0p59tRpAvZV249SOSgt0KWG++YUOwZAquCH?=
 =?us-ascii?Q?y4M9ZTrDfWQsSurjTYa6CAMrVdnqQQLtlFczy4Ni3O26iz81MbI51aMptdib?=
 =?us-ascii?Q?8PTz9lflX7S2mI2l0AWwLiFqqCnZwE4h9lyeD5XUgNd1gw7M7sHMQLKf4p6o?=
 =?us-ascii?Q?GCYrq9uo+rwzlDUuOYcV7vN4Cr11hJ+DM1Ofs21PAY3v2SczvHvUCjA94pGg?=
 =?us-ascii?Q?+GpkjW050Ay5N8lxFsCN4WoozWD/j6XLFoJgcbrI+sUFnPAgC+boDrBoKl9u?=
 =?us-ascii?Q?CPDiosfJkgDl6blQVuTeaZFGOr0omt+U+3sklfbNAhNezwzWmNW+re2zq/m4?=
 =?us-ascii?Q?qC0AzGVimytl4q6dPkPwKkioZrACjxqBxV8CqqUTTRRds+1wc516ZGvnQSsa?=
 =?us-ascii?Q?ZYVDtvmq8QiISkl1pq8xueIRuaRasiY2eyjeG6U1sOWEjOwM5jQMh2ewI1kx?=
 =?us-ascii?Q?r2mMFofLIDzl0gXKkbWxqfShvTXCtInhC/Lj3tjhVW/hVZF9q1gFDuESl+Zr?=
 =?us-ascii?Q?Klbbl6nXUC7eouwycAiioQow3iqairXPCtSWsBd+3eLNG/QC5iKIVw4sD+Ok?=
 =?us-ascii?Q?oWLYRpiFiTBzgO2oO+6YX5aTU33cy35MOHp8H4U/i/3JW2epmDo3wL7z7UXK?=
 =?us-ascii?Q?ezOppPpKO28eaOkK8xzIbSyT3pyjA1Z8rrpry5nz7/DpzS8D8t8CHf2wVza4?=
 =?us-ascii?Q?3FhVz5je4WVsy6079Gf/MemoSZCH7IYNBvUH04fwkG6BqfuMB2I7l8BlI79J?=
 =?us-ascii?Q?BcHFayXTkDdn33RLtRvSHWYXRQrwiAihhv3vcZ49ijJQue8TByq06jH2F5Od?=
 =?us-ascii?Q?GvgwB9Rt7PTJsfFvTfP+Dcw0kXaABNK6KrEQAy+1fEu6g00TstapjDLtGC2J?=
 =?us-ascii?Q?MpZjmm1OOEE4IVXV4N4/sJURnEWtregANuElN1g4n5kbTe0KFiNjRAbB43rJ?=
 =?us-ascii?Q?Z/ldYzwh0VRnnpzGJy+e1ek7LvR9nUkRtAR06j6u58QECFFZYNANwawWFWEe?=
 =?us-ascii?Q?GLOsi6Sn/UO11ghL8Kfb42nu2SrXyjU6uUg7F0Fwa5CMmToqwzoWfx/zBeDu?=
 =?us-ascii?Q?8w2BbU3dHqrhwCz8DLfu254FOQy5JLvM8yn3N36OqD5X4aOVC5HUTGsiMn3c?=
 =?us-ascii?Q?8X2L1XtIwpsQ+601kxurBWPjGM9gjkYoqoCIgWX3wzUNWAjZeGh+WLA4tVqP?=
 =?us-ascii?Q?W145p72HriQwFlqjv80ao9pwwk7xrOJOSj1TcIwpq4rJo06bCYRf0hXvaNHL?=
 =?us-ascii?Q?hfmN60LtOKYr7gaXIt8lXL90TGEOufzJT4ytCL3GLVBwng=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XO2sK0/8lDt6r8q4tv9m02fb0dZKBQ/wxTHQplusIwxymKT5iq26dwYotmVa?=
 =?us-ascii?Q?Dh7PxR/IYDwqKgKJI9LZnRBL3sjGzuQwWn+BpaEfX0r0PO7OEo5XSbbswHhz?=
 =?us-ascii?Q?DApw26D2pn0p9Z5h7t6ihgKMho/L0NYj4DdGhD9/ABrca3zldGT20eEnQ+c4?=
 =?us-ascii?Q?Vm+I8p8MJblrjzTradUmfFI36iFFqXP7hjiSQFxpw3W54u9AycTtTR6V+tQJ?=
 =?us-ascii?Q?s8SZ7P58MDNKo5BSBwBIJIEBGoWTGLXC+JshirlQ+nurKJ/Ew5EkGSApSfO+?=
 =?us-ascii?Q?m7Tgo3guqe0vyF4Yi5MOoxjjrGzYzhBxesa2leORUptycKxfXGTpCb0Dk88z?=
 =?us-ascii?Q?Qg1kWa3nu9mvK5+inmZoWgYSoQ7LL43m38a7CDxyTIlTdwCdXSr1yyJToS0+?=
 =?us-ascii?Q?PbE2FSHkUyIa5at+kpYvZ4KVA/E3dYousgU6TXcG3nCn2eNhuFMHzNH4Keeg?=
 =?us-ascii?Q?e0s4eBIFTC2gAd3ljapd5k73g+BNYYHNQ9ppCED1KELOCAvH6gJZwHZVJwEl?=
 =?us-ascii?Q?werUNIDWkIuiZUhKetWtpo6GLSi67TWzgLaaYD2hPhqRwXJgMBxu9ecpQeLr?=
 =?us-ascii?Q?a5HXdtCBOhZoJRGVCPFmYW1DmiXEoGymEeyAiWmL8CO0qjUaKxdvDBdCj62o?=
 =?us-ascii?Q?GULJNol5IJwae6gk5aMQcqHv4USfmudgwMmQzY42tbbg9uT2s7e6qnyi8tp2?=
 =?us-ascii?Q?/oHL6a7H8KajlfTZ6qw6ZXDJx5dGDchdNdQryDDj/mACfN0DACHPbK9ejpMj?=
 =?us-ascii?Q?q+tBZo+wu+eQBcn+0zRz8IfJhht6D0Xk/LPbMStcdecNOsVuXRYP0q3T6joW?=
 =?us-ascii?Q?PP+zvCD6CJX4in8zf7HY9VCXgXuINlqXp89tsVNFDyQVglVlAy4EkqVR+28G?=
 =?us-ascii?Q?Sgeoybzn3dM/P7eL/A48WFjjW+lpNeymm9GHOclg2syuHD/iQeFCCtB5NbDE?=
 =?us-ascii?Q?GbIcJEgkbjDbzsT39J5cnRcCgsprgCV5NUCJShuCSuqNm9vqJKzpZDRfrbwp?=
 =?us-ascii?Q?5jPCVmk7hDf6ojRTzvIrbZmoX0So7v3/ihT7lk4zmHYpYlIJ4jidn08tRAZ2?=
 =?us-ascii?Q?Cfyc2ZbBAa4FOPqRsDpcLwxqXpb2vqsWObzKAvGIq0KPH+Hc9Y+yvfRsiHf+?=
 =?us-ascii?Q?8ZdQyxJJKdPnTo8Hzt7A+/RsAb2t19tUJd4b9pf4eQwZwl/BMcULtLGREpNU?=
 =?us-ascii?Q?YqJlbj4I1bnW7BRTjuikQGQHrLiltqWMC/T5oanWGzWLDklgwJeW3vQHhc+T?=
 =?us-ascii?Q?IjJT7oyhRt32uOVr1ZRHsQEV2ErdbJd2UOOUOIXaTKD5qjG1WHCYt+ZgtDYT?=
 =?us-ascii?Q?XzXtl/Oiap0ieYi6ciPef3D+HXiwRRHED1wllRXi+ilw5/PuKNYhQS/vkK4x?=
 =?us-ascii?Q?6704p2+t0Kbg44G/nKHQJlgRQulkC16CW2sk2rMMz3ilCY4TOJpVT9zaBEc9?=
 =?us-ascii?Q?YNx3u6KXxDbf6UvrSIPaJgH7HFrCN2I/0Lf+O/HDWaEO15Hd7cDW3URas3z5?=
 =?us-ascii?Q?iYKomAIGBisOr/7CfbKd6Yym9uTXPB3tkgj+0fpYaTqZGHaVpte/hwjQ/UgD?=
 =?us-ascii?Q?W32CQdi6dnt5etQ+WLW6GU2entcyg79KwR65VCsK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f70ccd73-5b4c-462e-e425-08dc858a1f6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 18:05:45.8663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zkz18VoIfVa2ldqD2l4Rw/2D+3NpCtF8gBjMJDTDm9qmUYpM9YqLQTNZhoDYSvfDNCOGbtM+MVlTGMoEJbzFZKqVNnYaTqKPtFCLEMsUDPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6263
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Wednesday, June 5, 2024 10:05 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.co=
m>; Harrison, John C <john.c.harrison@intel.com>; Summers, Stuart <stuart.s=
ummers@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] lib/xe: Add sync and async xe_force_gt_re=
set options
>=20
> On Wed, Jun 05, 2024 at 09:33:43AM -0700, Jonathan Cavitt wrote:
> > Add a new xe_force_gt_reset function, xe_force_gt_reset_sync, renaming
> > the original xe_force_gt_reset to xe_force_gt_reset_async.  This allows
> > the user to decide whether or not they want to initiate a synchronous o=
r
> > asynchronous gt reset.  The asynchronous reset function was otherwise
> > unchanged, but the synchronous reset function operates by calling a new
> > debugfs function.
> >=20
> > For now, default to using the asynchronous version for all current use
> > cases.
> >=20
>=20
> Best practices are to add a change log to patches. So here is would be
> something like:
>=20
> v2:
>  - Add *async and *sync versions of xe_force_gt_reset (Matthew Brost)

I was under the impression that this was unnecessary because this is pretty=
 much
an entirely different patch from what was written for v1, but I'll add the =
missing
revision markers for v4.
-Jonathan Cavitt

>=20
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: John Harrison <john.c.harrison@intel.com>
> > CC: Stuart Summers <stuart.summers@intel.com>
> > ---
> >  lib/xe/xe_gt.c              |  2 +-
> >  lib/xe/xe_ioctl.c           | 15 ++++++++++++++-
> >  lib/xe/xe_ioctl.h           |  3 ++-
> >  tests/intel/xe_exec_reset.c |  8 ++++----
> >  tests/intel/xe_gt_freq.c    |  2 +-
> >  tests/intel/xe_wedged.c     |  2 +-
> >  6 files changed, 23 insertions(+), 9 deletions(-)
> >=20
> > diff --git a/lib/xe/xe_gt.c b/lib/xe/xe_gt.c
> > index 743d7a26ec..36e8fde363 100644
> > --- a/lib/xe/xe_gt.c
> > +++ b/lib/xe/xe_gt.c
> > @@ -69,7 +69,7 @@ void xe_force_gt_reset_all(int xe_fd)
> >  	int gt;
> > =20
> >  	xe_for_each_gt(xe_fd, gt)
> > -		xe_force_gt_reset(xe_fd, gt);
> > +		xe_force_gt_reset_async(xe_fd, gt);
> >  }
> > =20
> >  /**
> > diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> > index 934c877ebc..6e3234cd3d 100644
> > --- a/lib/xe/xe_ioctl.c
> > +++ b/lib/xe/xe_ioctl.c
> > @@ -529,7 +529,7 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint=
64_t value,
> >  	return timeout;
> >  }
> > =20
> > -void xe_force_gt_reset(int fd, int gt)
> > +void xe_force_gt_reset_async(int fd, int gt)
> >  {
> >  	char reset_string[128];
> >  	struct stat st;
> > @@ -541,3 +541,16 @@ void xe_force_gt_reset(int fd, int gt)
> >  		 minor(st.st_rdev), gt);
> >  	system(reset_string);
> >  }
> > +
> > +void xe_force_gt_reset_sync(int fd, int gt)
> > +{
> > +	char reset_string[128];
> > +	struct stat st;
> > +
> > +	igt_assert_eq(fstat(fd, &st), 0);
> > +
> > +	snprintf(reset_string, sizeof(reset_string),
> > +		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset_sync"
> > +		 minor(st.st_rdev), gt);
>=20
> Again another nit, we can have an internal (static) function which
> accepts the 'bool sync' argument. The xe_force_gt_reset_sync and
> xe_force_gt_reset_async would call with correct argument. This gives use
> a single implmentation but hides 'bool sync' argument from the IGT
> layers of the code. Make sense?
>=20
> Matt
>=20
> > +	system(reset_string);
> > +}
> > diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> > index 4d08402e0b..b27c0053f0 100644
> > --- a/lib/xe/xe_ioctl.h
> > +++ b/lib/xe/xe_ioctl.h
> > @@ -91,6 +91,7 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t=
 value,
> >  		     uint32_t exec_queue, int64_t *timeout);
> >  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> >  		       uint32_t exec_queue, int64_t timeout);
> > -void xe_force_gt_reset(int fd, int gt);
> > +void xe_force_gt_reset_async(int fd, int gt);
> > +void xe_force_gt_reset_sync(int fd, int gt);
> > =20
> >  #endif /* XE_IOCTL_H */
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index e47c3730dd..05d63c0ba5 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -239,7 +239,7 @@ test_balancer(int fd, int gt, int class, int n_exec=
_queues, int n_execs,
> >  	}
> > =20
> >  	if (flags & GT_RESET)
> > -		xe_force_gt_reset(fd, gt);
> > +		xe_force_gt_reset_async(fd, gt);
> > =20
> >  	if (flags & CLOSE_FD) {
> >  		if (flags & CLOSE_EXEC_QUEUES) {
> > @@ -383,7 +383,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class=
_instance *eci,
> >  	}
> > =20
> >  	if (flags & GT_RESET)
> > -		xe_force_gt_reset(fd, eci->gt_id);
> > +		xe_force_gt_reset_async(fd, eci->gt_id);
> > =20
> >  	if (flags & CLOSE_FD) {
> >  		if (flags & CLOSE_EXEC_QUEUES) {
> > @@ -530,7 +530,7 @@ test_compute_mode(int fd, struct drm_xe_engine_clas=
s_instance *eci,
> >  	}
> > =20
> >  	if (flags & GT_RESET)
> > -		xe_force_gt_reset(fd, eci->gt_id);
> > +		xe_force_gt_reset_async(fd, eci->gt_id);
> > =20
> >  	if (flags & CLOSE_FD) {
> >  		if (flags & CLOSE_EXEC_QUEUES) {
> > @@ -590,7 +590,7 @@ static void do_resets(struct gt_thread_data *t)
> >  	while (!*(t->exit)) {
> >  		usleep(250000);	/* 250 ms */
> >  		(*t->num_reset)++;
> > -		xe_force_gt_reset(t->fd, t->gt);
> > +		xe_force_gt_reset_async(t->fd, t->gt);
> >  	}
> >  }
> > =20
> > diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> > index ff99b46a08..d2e4d1a09c 100644
> > --- a/tests/intel/xe_gt_freq.c
> > +++ b/tests/intel/xe_gt_freq.c
> > @@ -324,7 +324,7 @@ static void test_reset(int fd, int gt_id, int cycle=
s)
> >  		igt_assert_f(get_freq(fd, gt_id, "cur") =3D=3D rpn,
> >  			     "Failed after %d good cycles\n", i);
> > =20
> > -		xe_force_gt_reset(fd, gt_id);
> > +		xe_force_gt_reset_async(fd, gt_id);
> > =20
> >  		igt_assert_f(get_freq(fd, gt_id, "min") =3D=3D rpn,
> >  			     "Failed after %d good cycles\n", i);
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index aa4a452bfc..a4fc53869e 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -31,7 +31,7 @@ static void force_wedged(int fd)
> >  	igt_debugfs_write(fd, "fail_gt_reset/probability", "100");
> >  	igt_debugfs_write(fd, "fail_gt_reset/times", "2");
> > =20
> > -	xe_force_gt_reset(fd, 0);
> > +	xe_force_gt_reset_async(fd, 0);
> >  	sleep(1);
> >  }
> > =20
> > --=20
> > 2.25.1
> >=20
>=20
