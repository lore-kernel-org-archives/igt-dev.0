Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC683C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 05:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 657F310E1A5;
	Mon, 19 Aug 2024 05:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN46Y1G+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB11E10E1A5
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 05:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724045815; x=1755581815;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cZN+DHDoFbK+nxLRUTU21fDF0xCo8fBDlKGf8FH3Beo=;
 b=BN46Y1G+6NhlJK9WRb9Msbe51EGGGgZ78H1kt1mtuHlI8bWblQUUdwQp
 5zqbWNLkq3TP/GfV+nqMK1Ox0W/iicWLN45Ggh31FYytnO4SIjk1fEIrj
 zFKXPO3vaqRNNZMWj6GolGjdo72I9sj31P0JmADSLcyhJI4YVlAtDUQyv
 GrnatVVy77yBlwMSYp1NABnhqYFyNDoGqTY/IwI2w3YjoIHdVaktujEGr
 OwmlrZ7EVamxGI2MerZoqfETyOnk9U2JND8f/E7QV5g3xPlXz79s3BmZq
 GsKS4RHT5gsgxN5NY1B4BVdUJMX25zSyr5iP4gHcfYKJuLXv/eRMEe1Lt A==;
X-CSE-ConnectionGUID: fMNHj/W/QN2u30CDIFFCZg==
X-CSE-MsgGUID: bz8nH+wRQhm6RbmOpS+6fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="26067200"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="26067200"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2024 22:35:05 -0700
X-CSE-ConnectionGUID: fHjGwI3/TUWguEBaUE009A==
X-CSE-MsgGUID: EUdnzt0GTsGgN/sAKkwsdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65141559"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Aug 2024 22:35:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 18 Aug 2024 22:34:51 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 18 Aug 2024 22:34:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 18 Aug 2024 22:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nw1V+B2F+RIxZyxRBhC8ZqJ5Sy5svG6/6G1aclXznz9zqYxL0ucmMCG3LzrqZi+ytyvoCdP+3sdf/PQJh+GpX4sCGcEc6dyDN7S7DC/v/0a5mYvhb0Jo4AfCuqoV7emksAI4I00+iscB7Cj3rj5F3cc+Z5KQoQv+SObNxgNW6hkdSu2la4V75Dv5zQqw5mxMSnMQaJOmZPlH16Y810zF5/O6i4S318ulHS+yVaurL6qyqg3eVtcz37wZqWVwJ74cY6sSrQJuJm5TofGn4hEgui9F6F4DSPo7rnHTYkhXAHePngL3UTFT3/KWfrhWuyjszYPtpttkLmvul9m7zvG+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jvA2lqZMPrJ8PXqg2nmXeLRWYB0G1cu+fHVVSk3aaw=;
 b=jd3XhFpeJ1npg7bYLy/9BlKfIYOLFAwCLpzyknFYoMTvy6y/qFJdYBV6/kyuXQ/rKhmtZxuLogKBgUTFDL0CokjGY+T9BIueRmO9hCPwgK6lsBNzXz14X4foRI7DxrrajEO1pEeg2SvOA3v7re1DWdmycEinq3MlHxsoGdXC1pr2ZqYktmHuKIhewd4zIuuG0yK60HjUWtrhpTDuj493YyQGc9449rRLTvKcJAJm09kZCvHQgTigMxjepTLHCpX+zYkuXo3nS9uAEzOXVJRz4pERcoNDFDUHt4KPyenWd40PbizXrFZINWD8bPvRnFiazxZfIIJRogkgvxiXgtWPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL2SPRMB0001.namprd11.prod.outlook.com (2603:10b6:208:412::10)
 by CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Mon, 19 Aug
 2024 05:34:34 +0000
Received: from BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7]) by BL2SPRMB0001.namprd11.prod.outlook.com
 ([fe80::ddfe:7efd:a50e:abb7%3]) with mapi id 15.20.7875.016; Mon, 19 Aug 2024
 05:34:33 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Samala, Pranay" <pranay.samala@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen
 red/green based on CP Status
Thread-Topic: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen
 red/green based on CP Status
Thread-Index: AQHa7ThlksAHS2bl20iF92kAqiUe8bIuFWkAgAACd3A=
Date: Mon, 19 Aug 2024 05:34:33 +0000
Message-ID: <BL2SPRMB00017CD9C4F9B28CA5E2337BE38C2@BL2SPRMB0001.namprd11.prod.outlook.com>
References: <20240813041936.4014668-1-suraj.kandpal@intel.com>
 <20240813041936.4014668-5-suraj.kandpal@intel.com>
 <DM4PR11MB6312F43FDCEB15884441594D908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312F43FDCEB15884441594D908C2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL2SPRMB0001:EE_|CY8PR11MB6889:EE_
x-ms-office365-filtering-correlation-id: 96137ecc-9de7-4290-c700-08dcc0109b63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?cb0MeHQl2ema1jZrlQ2Djl29UVfECZsHqPOFmKK4Ue0ERnzxKgyDwW7KDQJT?=
 =?us-ascii?Q?/0KHvLbZ0dDDXM3KzLjCKbMeqIogh+40/5fK5zn4qj2TAAA6iVV66S34ddS+?=
 =?us-ascii?Q?UjW6MAYsYroZhf79xuA/3MQ1Trvx908YC1Seiq1wfdit7lYZJREsEzIEsmqW?=
 =?us-ascii?Q?CQsQFd4yVRQkulhcYrhRGyQ8XQT9p3SqzKJqjCA2kj96eDh2s9B+d9VucbgU?=
 =?us-ascii?Q?YLcPWYtMjBr/y8EHSdVWmTGjbzCCeRwMADgifcm868jAX8EDDHP/Y1gyghXZ?=
 =?us-ascii?Q?oSEqSLhPlJRNz3BJfUYdYuS4JY4SPRUOUsF9AraopRlnV8sJoPzEzMhkfcE7?=
 =?us-ascii?Q?pRjM6uZA4DMDGjL/HtG5tqUU7XUPBeZRUtub/M7/KQEzfbb+f0+N46e3vyMA?=
 =?us-ascii?Q?gLG0mAApjZFCCYkbmM1xhKtU1ulSpHauhIinGaWlxpTh1wiE/rH6t3HlGjLU?=
 =?us-ascii?Q?ERnbczBNTjvfj3AlFoD/ZM4DNo3Kkitfcm+TvURjBcV5oxQhjkvbMpE6BVim?=
 =?us-ascii?Q?b/WUUYd70tARLJ/JGRfTEUl+LggYcadgeT4SaMhXsWEWdYiHgzc8Kb0WRS7L?=
 =?us-ascii?Q?QCoU0GT1Vx1Y/vpZrFQBObXA0OBQFVDZBHzo8km53s2pncf2uIc0BQ6Y5mjW?=
 =?us-ascii?Q?hwjpWtAUxnTpY/DW4zMf7R80Z5zASzIx+ZLWXWj3Y0A4HZhHEhAXKKpseAtR?=
 =?us-ascii?Q?GYeqCHG7GiDtTJCfpGdlKVq1BhYO5mqs0iA8XGxCXDuSToDbSeWPk/o+MDc3?=
 =?us-ascii?Q?IKB+PChxrvySjGgt1FcIrPEW9o5VxLeygV78q+EBIWMRctBjftElWd70IN77?=
 =?us-ascii?Q?hT2kEtmKkodgeSngUmJAd+r8A4Nyta/ogAGGT7siRnFNU6oRyfVUycOvhtB7?=
 =?us-ascii?Q?wXLiaBnLAbEA2+LHgShSwCE60qO/Zsniq5lzi6ZmLW505+NZOAfrYIUYoQNU?=
 =?us-ascii?Q?yJIVNZsf4SkkxqME8A7pBsarp9+ZV/U3kdfNWKIs+kbd9Lh/XIF3sWgSK6pe?=
 =?us-ascii?Q?q1j9tUxAAgK9VeL3hKwYXuv7JNYav8NzxAzDUfCEo9AJQy+BRH9R3L/2ow0T?=
 =?us-ascii?Q?tKz6U8A+taDIxvq1EKzOjHoBzeSRcbfGHKDMgEL5IMVus1+5xCQgMlFLuHii?=
 =?us-ascii?Q?Xc838tLBxs80ofL1xI8LkuBwaYf/azytNMkq9SCUsSfGAVA3e4VM/6cqsUdJ?=
 =?us-ascii?Q?zGZ8oV8WL0H3quFxPMEtonhEX+ZKzF94Rl/nh95kBB83cNk1+VFvlttxtipJ?=
 =?us-ascii?Q?1Pc/NXMfO8qDCu4o2/EVanLbMiqbsodYtdkQNrV0kTreTA2Gjqab9qSZndnV?=
 =?us-ascii?Q?BSOOWeU15ycMuTUBbdtT9kZXcsm0bnGdrAi8UgC8928a14g0jrZJuSX+a8TW?=
 =?us-ascii?Q?uAmGYAljKlzp960d4oNDDU/P1tsgMFi58iO2WdSkgrGztGzY3Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL2SPRMB0001.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5M8Jxn2OVovqkHBGH0YAmPDCCUO0TrhhsbRcSgrb6XL8zSWeWBA9ByjeLFcD?=
 =?us-ascii?Q?vm7fEs0RgvVB8+1mZ5vGjI+Nr9cjydhOhBY5aIJiX6aNEanC2ua2KTJnICne?=
 =?us-ascii?Q?51L6cxeQ3Ui3vwghxXi43+hbkp5ui7hIxniVZw9v5EBvC7zcFzJRm+UruNeV?=
 =?us-ascii?Q?vl/AtibYSsYzm0v+J06Xiz8pXBDgc1Sa0uWh7F9c8E/J6uBQPyOSK66ksZET?=
 =?us-ascii?Q?HGUsImL61/Ee2kRzYVxHVChU6HVyugERfW+pDsliQU5tj4BEvuQtBEavjWqq?=
 =?us-ascii?Q?xpnc2FGzwGsvL9LKZluOGY8sF2P5UvV+QbPGFdelWgzfKaH9YQ27IqYZpAbk?=
 =?us-ascii?Q?szsrH1h9NKEBukUeckiiTrAryU3wY9HqkikL4VU3BkSbr2tinV/n1xTNKJmP?=
 =?us-ascii?Q?lYSiAs+TwDXKEpAKaYJZvt0jZB3q3uRtxpCa0JApdMe8j2NpiC0m5pDTQGQ5?=
 =?us-ascii?Q?Hr2kdXShj86qDWeA1m+Uhw4rnBu2uueKJxxoHPA3r4HLY877kWaQF1kpAzMh?=
 =?us-ascii?Q?+cNjJBqtr7vuKwL1uSuIGK+mw8hafS5PZ28GO+i0lJEkxASQMMENXkOcJXkZ?=
 =?us-ascii?Q?echCxnKshjLmxPkcauM+mxdFFaa5hyuaFI0U2oCaRWcSQWz4C/1o2NAcdKT5?=
 =?us-ascii?Q?xm9gi+roRaRXRrECKvfAeflIKwX4aMZopA0zTQd2Y+C9BE2FmSogKcKMqwIg?=
 =?us-ascii?Q?pSfxJRr07XRtBrodNiW3NI0CTXyDWFIn7MAvvVNBB1BybYkOsvb92DX6xS5b?=
 =?us-ascii?Q?+Q8JXxXkfR5e0ImJCJFm2tm3e2dsVsXN+HJpFwnyLEHD9WgR3/AwYP9us42T?=
 =?us-ascii?Q?DOBRTBJ+xXz0NAc13tsuzmklo4a2n20RmvQXC1vgoH8Zw9NVZYOSAmn34BBh?=
 =?us-ascii?Q?rUyFIpGq7KqbLKPTL9NfvlYWNO6Chv+gOdzrsPlrYw8DUmlHmZ2ftJqexFhb?=
 =?us-ascii?Q?TKKzUTTCE4u8pxdH8KagiDVRv6GzIfiCHvWd1sf3hMmyIBKpqyW/MPQre9wY?=
 =?us-ascii?Q?2V6cHz8kFIQl+RiNPs9qzQjvkzKTBp4Af8bgoXhSdo/veG8vOoU8m2exSOV2?=
 =?us-ascii?Q?r1Xh9qaPFOoFSyEZMr8Ls+iWmeN9yJu8IgJseXLWfPiCvV1Hfs552rw5efnJ?=
 =?us-ascii?Q?ZxQVuyfQHIz5yp5xiyCqV3+IovypKzzE1JXHRaMxBSQfrSEgbIqt0AX5/ywc?=
 =?us-ascii?Q?UsNpTILafoAnkxY3LK+0TJ6fCcQi6vCIETXKkzjzd3NW+67zwnysBMPgzDlC?=
 =?us-ascii?Q?zJgCFkcpWozdO4SIRSTmfWDB9y2XRKXpIo46oI0lM28w4pDeV+uvM9I5DAqE?=
 =?us-ascii?Q?aDTcqPLTYH60p+6l7tCHazqHxYQi0xW3NNPrBtD3D4RwstBRCmCi+t9GaS4+?=
 =?us-ascii?Q?zb5O1bDf58ylnzeeIvs36f8THd2e8pQr8iW3hTh2MuhRGfZsd349VAJveEL2?=
 =?us-ascii?Q?lDRHKLU72xLOCzKW5QLpMv6psnyyl+dBK2v2/YSmfvQzeoaL7jc9L0ppQ8Ji?=
 =?us-ascii?Q?5A6a61nJDjcdXKP9rE3qu4SMXeK8QMbQDoRrpuFTdWH5JdBWDvYQc+1Wri4x?=
 =?us-ascii?Q?Q49nUFN0vXW+R45wl1pK461OVByO+STIa2TL20S+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL2SPRMB0001.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96137ecc-9de7-4290-c700-08dcc0109b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2024 05:34:33.8439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WbusFTPe+Am0SS0StM2BL9q+HeJ2kU5qyWyt2gd8JoiHLbnqkdJUmzVRWBFfGRkiU8Q9YntgAKE/A71wWPexVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6889
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
> Sent: Monday, August 19, 2024 10:54 AM
> To: Kandpal, Suraj <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen
> red/green based on CP Status
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Tuesday, August 13, 2024 9:50 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Samala, Pranay <pranay.samala@intel.com>; Nautiyal, Ankit K
> > <ankit.k.nautiyal@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Set screen
> > red/green based on CP Status
> >
> > Set fb as red when HDCP is disabled and green when HDCP is enabled
> > rather than randomly setting the color.
> >
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  tests/kms_content_protection.c | 18 ++++++++++++------
> >  1 file changed, 12 insertions(+), 6 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c
> > b/tests/kms_content_protection.c index 82a56167b..ea7f5b984 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -521,12 +521,11 @@ static bool sink_hdcp2_capable(igt_output_t
> > *output)
> >  	return strstr(buf, "HDCP2.2");
> >  }
> >
> > -static void prepare_modeset_on_mst_output(igt_output_t *output)
> > +static void prepare_modeset_on_mst_output(igt_output_t *output, bool
> > +is_enabled)
> >  {
> >  	drmModeModeInfo *mode;
> >  	igt_plane_t *primary;
> >  	int width, height;
> > -	enum pipe pipe =3D output->pending_pipe;
> >
> >  	mode =3D igt_output_get_mode(output);
> >
> > @@ -535,8 +534,8 @@ static void
> > prepare_modeset_on_mst_output(igt_output_t *output)
> >
> >  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> >  	igt_plane_set_fb(primary, NULL);
> > -	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
> > -	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width,
> > height);
> > +	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> > +	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary,
> > +width, height);
> >  	igt_plane_set_size(primary, width, height);  }
> >
> > @@ -733,7 +732,7 @@ test_content_protection_mst(int content_type)
> >  		igt_assert_f(pipe_found, "No valid pipe found for %s\n",
> > output->name);
> >
> >  		igt_output_set_pipe(output, pipe);
> > -		prepare_modeset_on_mst_output(output);
> > +		prepare_modeset_on_mst_output(output, false);
> >  		dp_mst_outputs++;
> >  		if (output_hdcp_capable(output, content_type))
> >  			hdcp_mst_output[valid_outputs++] =3D output; @@ -
> > 750,7 +749,7 @@ test_content_protection_mst(int content_type)
> >  		igt_require_f(found, "No valid mode combo found for MST
> > modeset\n");
> >
> >  		for (count =3D 0; count < valid_outputs; count++)
> > -
> > 	prepare_modeset_on_mst_output(hdcp_mst_output[count]);
> > +
> > 	prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
> >
> >  		ret =3D igt_display_try_commit2(display, COMMIT_ATOMIC);
> >  		igt_require_f(ret =3D=3D 0, "Commit failure during MST
> modeset\n"); @@
> > -760,6 +759,13 @@ test_content_protection_mst(int content_type)
> >
> >  	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output,
> valid_outputs,
> > 2, content_type);
> >
> > +	if (ret) {
> > +		for (i =3D 0; i < valid_outputs; i++)
> > +
> > 	prepare_modeset_on_mst_output(hdcp_mst_output[count], true);
> > +
> > +		igt_display_commit2(display, COMMIT_ATOMIC);
> > +	}
> > +
> This is unclear why its added, please describe in commit message.

I think its pretty clear in the commit message because we want to see a red=
 screen when HDCP is disabled and green screen when HDCP is enabled indicat=
ing HDCP status visually. This follows the same rule we have for in single =
output HDCP enablement. Not sure what more
Is required here.

Regards,
Suraj Kandpal

> >  	if (data.cp_tests & CP_LIC)
> >  		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
> >
> > --
> > 2.43.2

