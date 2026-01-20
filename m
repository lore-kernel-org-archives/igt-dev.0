Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD1E9D2ECF9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E49710E183;
	Tue, 20 Jan 2026 04:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEpqXuWM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFA010E183
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768884511; x=1800420511;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IVXIgs0w2Yx4a9GuDvQ025FUiOhhYfVcKh+/e3lc8r4=;
 b=hEpqXuWMRQAW8/njojYhNz7ntmoXFzgVNKWCTDx9wMi/NkQhhsRPmyfE
 vzbiy4W8SJyVpA9ZwQYsRonHmy4pHiRVVfeqfa5Lk1Z0TkIDJOMw+TWtw
 L+DioBEfZrgXNlHsV2rVbeC+vSCsvkXFekBrfx6KREnLWQ2SB9Jis6Gnk
 0aLioG+YBnOGV/Me/l6f+PXhsPXtJNeQ5Zvmwg/7hiQQZvcj+oYIIAj4L
 3J+LGWCycwpXYzILmsfRgfTkF3OMj2vi/tR9/dtVM9eoQO476bdvNg8Al
 rZKJt3uMzceQuV/VXDDWyeFJAfY9mkWiCpZzNnVZHg3DrYgGB7h1f4cnC g==;
X-CSE-ConnectionGUID: KS+zb3h8Suu0CdyOachCWA==
X-CSE-MsgGUID: ExXr4pflQ6WJJppeI80ReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="57644253"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="57644253"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:48:30 -0800
X-CSE-ConnectionGUID: dCdFUDPLRbCwh6n93lbvmQ==
X-CSE-MsgGUID: IW7E6g84Tg2cmBxEW9LyCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205816122"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:48:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:48:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 19 Jan 2026 20:48:29 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.60) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 19 Jan 2026 20:48:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQm6YM9aUHw+glIPO11rvF4106jxSB/AVDvBy2jHSFQY1Wwxl1m12KNoHSfguH7OQSNqIkYjlPX2w1wOuAfUDwbIHqiITYx+i5rHMNYM4y/RNklZN/qEeAQSOECKxiD0k6HSKD/3UAn3tsThVFg66nCYl7DWP1JyEmWUtS6uRGe/mMD7lbdd22BYEDDXzxYeP9PwasxV5V97SGxU7mbpaFP6cXX+J3eYU878PjOLpGbuF72kz2NCB4s5rMOC8hE6VylH10zRCGkl/hmZXioDKD4WDYOzyH1Qkjrknkm7znBScpFe7CNPuv/xO0qBya31TyOYLuZXpvhSvQLrjuC9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlalDYfOUarjBce7KgIHyyg2qmV5IdEwJJ2uxgHvKUk=;
 b=OoLA5CkOoRtLK9aiSUH9oqbxeHH9OJ5MKUnDQfrJxx0A7PUEG46cJg7HB7PKnWI577bYZaMU87kU/1/AzgFuDhHD3of3DsfjNbe9LBHmUDCCtd03Me0lC7zZ2lHoIMNftVKfmjhk3Lx+ruoNMGjxrrvthI0ntt2jW3SNhR4f0l5aze4b5uUQQ5wJPOcy3Lagp92vrNGVqs6nBC1TZgA5zNdP8wcMMsLhXVf8Q/kSqHenlep688+Rr5+rhw8zw/cUMWkwzxsHpFPj50pxxFVvA13bXzhquAtPnoeEffl6gXL59zWIF4tddM9ksHH3ORovD3E3ajszKKm7IBNgAMTvDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB6998.namprd11.prod.outlook.com
 (2603:10b6:510:222::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 04:48:26 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 04:48:26 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: Alex Hung <alex.hung@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "aurabindo.pillai@amd.com" <aurabindo.pillai@amd.com>
Subject: RE: [PATCH 1/2][V2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Thread-Topic: [PATCH 1/2][V2] lib/igt_kms: Increase MAX_NUM_COLOROPS
Thread-Index: AQHcicfYtPhT+Id+e0Wv9cNUblNBHLVafE2Q
Date: Tue, 20 Jan 2026 04:48:26 +0000
Message-ID: <DM3PPF208195D8DE04C5EE1D9E0303449B5E389A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260120044646.589301-1-alex.hung@amd.com>
In-Reply-To: <20260120044646.589301-1-alex.hung@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB6998:EE_
x-ms-office365-filtering-correlation-id: a35c4fc8-b187-488d-b5da-08de57df262d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?nuHSbufeLncxSprNI2x+K/jrUvsM2HcJG5/ifePQ5r4fkI+EcEuxDxR6Ykb9?=
 =?us-ascii?Q?f4IW17D/I4WnUAbFqqEK1reN3pUxYu0J1ba6NH5/7m08PriktdYtTRVeesha?=
 =?us-ascii?Q?K+kDQTf7wuZHld8dOZ7o/R2vCJWuwc7zN2pvKiZFAXkXyCF39+wadoJ1uqol?=
 =?us-ascii?Q?2XavGYNwdmk4wa1cu05mSKAJHt7xZKpD+JLAKWffoQwNJGpAUUkQ3ws9taaF?=
 =?us-ascii?Q?Qdjr+UGG08/XEKJL4R+z3fv4WA+Pux10c6yehDkes9sedsrDRdlpFrPg6xD7?=
 =?us-ascii?Q?IgJJM2caoG1D2UpEECVFRe93q97zqDmPIKFKMoifjUR/1nK7+5QD/ZIP2EEk?=
 =?us-ascii?Q?QihJ7Tz/BlPro+ovQSYN9b0SmyAiJR1jw0RGyLv+DSJpj3sAJhPkn0Y5pBpe?=
 =?us-ascii?Q?efRsgrGs44J6E37XrE/bzl3CItnIUlvP+EmFVFhMnbJNsA6YOAYYErjeOGx3?=
 =?us-ascii?Q?wHT5eZ9pvJuKySW8fvK09jTRsakuxw0tj8ZtUjLQObT4Dw5Z3WUg6m61CPfp?=
 =?us-ascii?Q?4LfuWinHTLTIB/6Tpgs7IW0T0NZf0WtzDHn4SMQJeAD0meKHLAHAym3YryO8?=
 =?us-ascii?Q?sy0cmYzLHVjKQmykanO6rfI9EDvlwjiI5ko51g9FFf79YkNF189jbxsvD31/?=
 =?us-ascii?Q?F2RhgsEHsqjHfkZ3i6ofuDJKNyPF3B5IJnrB7VR7cdrTsKHnpv+LZSC4ZQ8I?=
 =?us-ascii?Q?u1oHjHbh5u5+praYMRSMfNLjEG0xZpZYCMhQdQv6F9PkX9/UxIAMkSZXhQ2l?=
 =?us-ascii?Q?kGkvAMhMhviyvCKKpfEmVVQbjz6n3GHfLNRxHjMn+8twbIR6Qeo+HuSKRd1y?=
 =?us-ascii?Q?OyrlR53058hSCcaV4zjPlS8QTuqJfrr4pCq6hbWDTm1h/3wB8PqmWkx3Mg0D?=
 =?us-ascii?Q?N0T8arMxLUTN5r5OqotYyUd7Vrmb4rRhr0/M57Hq8gXrdIkG69haQOyn7bGP?=
 =?us-ascii?Q?DYtttrM5jgGZpbb6alyZrw/J/TFOfyf0UI2A1W7mXcELitMR+3ou1HJzRzsN?=
 =?us-ascii?Q?I0iVg+rgd0Yr3kjatX7eJoN24k/O+x2w1eI8zoiXZd1JKpWQfY7YRxKL1CjU?=
 =?us-ascii?Q?8XaCc+mti0uIv75mtOdpDNnM3ts4J7lhViv/UI9GImXXDahz67pFyFDWa6i5?=
 =?us-ascii?Q?lobSwM7BP+uDvD5kSMuVfZMnTlfsDQrct1Xc9GjyGoE6qhnH8Db+ipkThTqh?=
 =?us-ascii?Q?cjlwtmRVvwyFzM2HZr42mpeygEXC9bMgyfqST497C8xWYVtFSXyjBfJNCWVO?=
 =?us-ascii?Q?U1NSr1bM4p7iI6tLhUMlwkodI8KcJbdvTMGycZ7KsOSZYku/RQvI5m7Y5eCE?=
 =?us-ascii?Q?NCNlWxjKoh+fNlz5eWiiy0z5DhaU1kaP6n8+YC1a1rY2Qh5g51G330YRkHii?=
 =?us-ascii?Q?COsWsUDadIAScLdMsXxlwzPVpQuCdChVSlyGHhfS4/27cdaZSabAu5P6g7BY?=
 =?us-ascii?Q?RsFIuxa62tRo/Az30cQ42/tr/ggo1RFJGFUZYwBUu+yBqB7zvGHQurfAuFXB?=
 =?us-ascii?Q?VCN9xngIBIxM0fWK35yxYhoeNRvQ7R1mGjMknB7DYxBln/+t+DXa0VcDWX7x?=
 =?us-ascii?Q?Q7qAEReL0GM2yl5pCNeJCpsmwcozXJmciMDbgv8qpWXSWbjghl1rqGxT6Qrb?=
 =?us-ascii?Q?SLuVxTxpOHuG97YbW+SllOE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kBPUXkzB78xQyI7eH4mrno423XGxWYNOTgFvEk1kA0pzDffZIm/6tHaHqJDw?=
 =?us-ascii?Q?ujbMHx5AaStHbLG6d/9BJYzGL6y42MojgUvz9NXi5ZXzShs9QQkTH0GdBsEB?=
 =?us-ascii?Q?1Eg79zHmBziAIdZ4SDlrLrMltx3p6XuLjzc17q0U5vXc0l+wq8lkKRX/TYwz?=
 =?us-ascii?Q?AXsLSr7lrEzSeqmLfSfnztm4rUI3eK85R8SabtqsY2RDPXicdmy/se1qcrs0?=
 =?us-ascii?Q?dP47MIgbYmNpsuCmXO1LxFJv2MLDTji9Ymg0ZTX336wUaPtjLX7Psb/6Gcuq?=
 =?us-ascii?Q?RjpYJwBRTvKE8LsFLkNjcyc/9afqicv8YUz1exuBQvNZkZKMzQoXqb6kYObh?=
 =?us-ascii?Q?4GO3oGjFlD6WjcRTh+abI950xmyXeQ3EUQMmKHQ6lsCZntOQQ/m0Il7JQ747?=
 =?us-ascii?Q?yI48qxp1Ig9GnB4hAN38hv9kUEy5t0m1CLzdyuudnMhj/ytCrSqjwYt2pXwP?=
 =?us-ascii?Q?jr1VugvDZ9xC3LJN+Vj4v1nT2Xj5ZOyxl23QTwHB3OeEg0aJ4fl+r/BGuVRD?=
 =?us-ascii?Q?VfElGOiieV91h6AXwnevktlDt6BXnD/yvWjPkp1z0135ptzQRchO8lKRkIGi?=
 =?us-ascii?Q?WhRDBzVPASWLnc1ylBqyMN7o/QuX/NjuA0pVFWatDtBcMtV9nGYc4WNxWWOP?=
 =?us-ascii?Q?TMJXuS7MhXpYhcN+2rEQAkCcG2QUx5GfK2Lp0A4jHJAZ/M2ejXu5i2vlJFpc?=
 =?us-ascii?Q?Pq40UH5lnujDndstj+IDqbGf3nxBIQZXmbwPSZa2rfSsXvDAda9DjjBFesnN?=
 =?us-ascii?Q?ucHjvV9+KYpeAIbCRVMx+RgFdhA6RhIrT/9VAa8Vv3mhli9VeXAbEOtkFeFz?=
 =?us-ascii?Q?vjeuy0Ic/BaFpGY3J1U7RNZDlS0NyFx5JhvBOPPxQYpymjDjJmoQTQL0G9LL?=
 =?us-ascii?Q?q6RnFRRLwTubNScMrWzIZxECHLgEDs9btdLkSWLueC5GHCmUaaGj5ZEs9yRD?=
 =?us-ascii?Q?PqME7G8l3o2n3tWMwdylVTVIY83fOfagq36Ni1JN5F/YnCtekwQAErs49uDi?=
 =?us-ascii?Q?CI90YP1HZwDzaUXhNL4t2h6jHWtzifjaQKqsMO8PHIQmPgFcvnZiYfAGGV67?=
 =?us-ascii?Q?Hb72EOqyP4fbCSpixR2qxuJfm8RPF2+FS0nIJBKPv15vcT+K+aBvHsbDyHA8?=
 =?us-ascii?Q?vo49Qa12Q0YFsh22VtNXJ8wPEoIkFa2OxUKm8D0PaozMgXEBTeuhQqZEzo1A?=
 =?us-ascii?Q?O+uzUwTfMzcODVJAhHtYEnXIANQY8DtjpoH+arYpac/LLWbvuSlJfWyTrE8n?=
 =?us-ascii?Q?f9G73QMD3MmUr4Pw8fkJoRnSDWPIL+IJoLFzNdMIr5Aw91vh5+aWz/cIUuuo?=
 =?us-ascii?Q?g50mmWIM7gcrupHndVMDJHfBL+5wMaSUkMBZIdz4QvLk+1V5RtY534+DHUF4?=
 =?us-ascii?Q?YdRutRd3EtUHQxy4hLSkEWVJDYRIiaPO5fkvjmN5s+ZxKaArbDeZRLxTDsAE?=
 =?us-ascii?Q?72dnKlehN8MoN07uCa0gYLK4LwaYmctS116ncU1UcCWAyUS8tg984eF1wsL6?=
 =?us-ascii?Q?pwXYnC8kqQer8hmluzaVq3gxIhkbsdj8d0khNhVNFjUu9QhXhbEKOi4VYSaq?=
 =?us-ascii?Q?Kh5NZdzzO/uScgSvzI/2TAjkAhQdj1fYdNgo3ud3cT+atK9iEsTgrCPjEliT?=
 =?us-ascii?Q?big5bo42pcACMlld3UEXyc7B7Inz4WC8QJaDvatStecWZFVavMlOq0XgOTN/?=
 =?us-ascii?Q?8MmxJGmDTsCPqRrnj4eA4KVIpIQIaW0EexmVewqrt2FNdt+6lqnMVTKo9qos?=
 =?us-ascii?Q?bTAmoEymow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35c4fc8-b187-488d-b5da-08de57df262d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2026 04:48:26.2866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZWdW3dSh1xBvHB4blQhoFoyyqpM4eJWfNekCoKokUq0lYiFnR9M8SNasuzdYrlRMbLrAPT8vMukrWzvR6WojHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6998
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
> From: Alex Hung <alex.hung@amd.com>
> Sent: Tuesday, January 20, 2026 10:17 AM
> To: igt-dev@lists.freedesktop.org
> Cc: harry.wentland@amd.com; aurabindo.pillai@amd.com; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Alex Hung <alex.hung@amd.com>
> Subject: [PATCH 1/2][V2] lib/igt_kms: Increase MAX_NUM_COLOROPS
>=20
> MAX_NUM_COLOROPS =3D 128 is too small for some hardware and it stops
> kms_colorop from running by the following assertion:
>=20
> (kms_colorop:3233) igt_kms-DEBUG: Test requirement passed: resources-
> >count_crtcs <=3D IGT_MAX_PIPES
> (kms_colorop:3233) igt_kms-CRITICAL: Test assertion failure function
> igt_fill_plane_color_pipelines, file ../lib/igt_kms.c:877:
> (kms_colorop:3233) igt_kms-CRITICAL: Failed assertion: display->n_colorop=
s <
> MAX_NUM_COLOROPS
> (kms_colorop:3233) igt_kms-CRITICAL: Last errno: 95, Operation not
> supported
>=20
> Double MAX_NUM_COLOROPS to 256 to avoid future frequent changes.
>=20
> Signed-off-by: Alex Hung <alex.hung@amd.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  lib/igt_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index 77b3ae2af..dfdebb83f 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -92,7 +92,7 @@
>  #define MAX_CONNECTORS 32
>  #define MAX_EDID 2
>  #define DISPLAY_TILE_BLOCK 0x12
> -#define MAX_NUM_COLOROPS 128
> +#define MAX_NUM_COLOROPS 256
>=20
>  typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const =
char
> *value);
>=20
> --
> 2.43.0

