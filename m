Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34EE6E83831
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 03:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A3E210E115;
	Tue, 17 Feb 2026 03:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL1eTucw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EC410E115
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 03:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771297241; x=1802833241;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+4NCJrda+lL+6+IgY889e5ZR5KsiaHpy+VLarIQc5Pk=;
 b=FL1eTucwPSkgIVP+74iiYIqdMhdctniehCORgFnRbc79lqCAfCc86Lov
 tx5sMXsMs8RZ0oiaQDoI42N1IYL7sHT4P4M+PDtPONSR09XmkXNr1jFR9
 FGiSn/aSzeK95FJBsgnUyok/mtCV/xT26uhgH6BnJT4Iy+vEqVvIeohRr
 anV1BXwlX5HH5ZOSPKeXYmdFcxkyzsniYZdmTHSrbOLelGmcUQmZJPpAL
 dUi1q45ZNZrsI+m7neHqgnsWg2I6sPe0Fy0J4r6B6BalgVJWdfiOBERQ7
 wSFlxvj4Qagexd2Jc14iRHvXvM7zuyDjtASMviSOfUIINg5GLCEIi+UYR w==;
X-CSE-ConnectionGUID: bJVhDSpbQcGCJrY7+2PNqA==
X-CSE-MsgGUID: MWErjKkgRVCmEnKDsJ1NPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72411199"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72411199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 19:00:40 -0800
X-CSE-ConnectionGUID: +U9fmu41SNaOriUp9hw6gg==
X-CSE-MsgGUID: uiM0WwWARB6iyKVZ+n0khA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="213009994"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 19:00:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 19:00:39 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 19:00:39 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 19:00:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAi1DnSAMZoFazZMi7MBSPswuVd/VfnwQZq1Nfza+T1h+w/GZ9h8Rs8so0hrNFj7+m+eCrONbo3NdvADvcEfUGquDi6o8guFz04O9KuV7lCLC9dpBFyZG+EICWxuF5IBOnnNv/rooEzpMmP9wN2y/Zst0pgFDUVNNNuWNGlkYMMlknsdyXFXxNFzOULIc9Q4CKF9sLwcQZIgk96tjEXb3bLOUNpubC1Pcn1Avddd4gznz7ow6t84iI9MK8m9GWj2fexI9cB7jinioUxXPGfL9hmoh3B+UudwiXa18RjZ8VDOvFLx0eR3m5P2ASrZVp0F7IXCJAnOB7BQuOSFpn/euQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjsMx23JL7pYxL4aHMVotXc2M2jGtCtPzRloozrR4QQ=;
 b=n1vM9IEjGsJ3kAidc9lOHzIYOZLB6h5Llu3cTJ+QDjgHCPnjsrz73kaPdI4ffK4tHeeFpi4xP805sLtUIwMv0MxqZLdebxKlJPLi3IMf2LVn++umrHfwtwaMenEa2LrbbzRQj9fMx6aDsbWw674b0o1z4y8E7pcai9H6u6IdIDosUVNbzsvjWdGyL+hJSdEZq+olr8iflWaqNtnRE9XqyssGmZ3RbEoni7OKd8br9QdGpQywrpnb/M/KvudMxyS2qPX+Lx3eLr+0Cfo84Ai7+Y+4FdidQIC4WOCk3qaELQ1IKqJeBwTIEeQBXuSVK3n7vLlYgwp4Hb4YFmlyJ5E5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SN7PR11MB7439.namprd11.prod.outlook.com
 (2603:10b6:806:343::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 03:00:21 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9611.012; Tue, 17 Feb 2026
 03:00:21 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: John Harrison <John.Harrison@Igalia.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Thread-Topic: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Thread-Index: AQHcn3RDPbU8WrtKNU2V0s0GPHJf17WGMtHg
Date: Tue, 17 Feb 2026 03:00:21 +0000
Message-ID: <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
In-Reply-To: <20260216184341.437722-2-John.Harrison@Igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SN7PR11MB7439:EE_
x-ms-office365-filtering-correlation-id: 71004cc9-b7df-4724-614a-08de6dd0b04d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?fxJDbNGPI5bj84WQvIKKs4xSkUJLpr4x6Gb5LCtadZ3ZB9szwI1ByP2osYSz?=
 =?us-ascii?Q?tMdNTCa2Tz7pHXBp1By2AcMzarbRZqt2FU8WCIz5ouTHlDrdLIZt4lT335AE?=
 =?us-ascii?Q?z5GF5KJ9qcWCvnFdO7Bd/e9gCkwDV/3P524lS6dMeBY8IiciKGjd+0j18SsJ?=
 =?us-ascii?Q?DqbadX8gk8TLNPd266xFGzCXLLHJKsKAkVD/ShWnp8hmXRKDjFqd/02+Ro5t?=
 =?us-ascii?Q?duagOXYNpiPu5iRDbcMek6k+RVqLYqP3bzRxNGTjksjR01R6IEIT91mqUiJO?=
 =?us-ascii?Q?oyYn1mwKzDKTfSQ3Ee7JHzUaic+9wDROZYecOIbVF9n9ZvsKO5ha/8WQv6ca?=
 =?us-ascii?Q?GDDy4EKPY8c05bYJ4saOlFSU4qP98QnvL2nSFQy4b/qALsBkSjNtJ5GI6w+P?=
 =?us-ascii?Q?ghJDWv3Byc7y+wONaZAboCIgM+POHEtERpvJVehGiI9iO/Lirnm2j4nerm8c?=
 =?us-ascii?Q?0HaC7x5aL/e696KD5TN1q77p6KTlH84O7/DueX8P/+M84bnnZ8c+zXe54uaQ?=
 =?us-ascii?Q?zhylQ66u39YN9vD/gQuxGUy3+FmzxYP4+DlVy+ofYPu3uLK39MyF8yiP4rTB?=
 =?us-ascii?Q?2w9hvlTOCWPHsURWG3MsooRepqoSmj7qebW5DekSoMJDS4ujc/lLvdl2aX89?=
 =?us-ascii?Q?soWlafFKlVxzPgfEPK7fwaYr8IpKN4c/iqunhFXe+BUyLIL+HQNIp5hhbJnn?=
 =?us-ascii?Q?1yKtth6L7Z4W/TyzEn1hUsl69sXeNZli7e/xzGFdR1lwa8xFzPAc3xsbjHm9?=
 =?us-ascii?Q?Prx8GoZGSG11lth11Qj8jXVFSJSSwykr9jDal6v8p7O7HAO8a3Zw+hwDAiHf?=
 =?us-ascii?Q?8JyIlInVZj3ghcVUuaHv/YbqQtstELIS3L/CI9u3nIuYS8r32ZY/ZHiIwxhx?=
 =?us-ascii?Q?JnPjyWp5NEoGyX7g9LgyQ0+mp2HMBOFy2JDH/P/UN+4wsdhyCfASHWEO+dXB?=
 =?us-ascii?Q?TSWzt5AP8/pHl7JKcX4d7ugHpGrzowh5KQMZwlnAlSduOujgavunYTwTzXRB?=
 =?us-ascii?Q?UVZEYKqBtVr5ZbZkdRNFrdJsT+D8ZejHoB5gCgKmd4tnv1G0ROSAqhaER3w5?=
 =?us-ascii?Q?OqQ81pmxDo0tyTmKdIqNku1vavLRK8J3/E8W4oM+SkPsd6xDx6Nsb/2z+Cx3?=
 =?us-ascii?Q?vHDyhdr/QI5o3OH+FselC9xuWIcJ+AW6FvmvMue+fhytvd4/34I0Vse+em0U?=
 =?us-ascii?Q?ON7Xq398uTxceWJWrzQKXg3Ld5zsVx/S1Qj3Xd32xCgffu+WG23CMKE/Wet3?=
 =?us-ascii?Q?VgPoBYACvaxnF3O5i4TI5MoAOmtXty8gtzhM0xcueCQ++POQXIDsu51vRLWa?=
 =?us-ascii?Q?Nf5NP84QASdiiiSSonjX2HzkJASpMznpy5+9kcUQWyT/rLK7DFQG5ti1a8l8?=
 =?us-ascii?Q?jUs2IoZitSlGPsa9xIfOL+tcJKCQOuMXuvG3dTQf5Z11S2hfMstVaKOrL1e0?=
 =?us-ascii?Q?Y3L7qC9kIqWjmZI488I6dD6fKB2wAidIymcQcKXBI1jCgpGCFWw6gJr45DlH?=
 =?us-ascii?Q?lOnr+AWqT0gRdmdTCK69oysKRhq561A/w+4UnxiElT77uxPGPoqUYQRt0GGO?=
 =?us-ascii?Q?NJRHX/cRnHoodH/P/S6s/CO98AwN3nkkubB7rsYDOup2vrZhxmNTFaXX3L6G?=
 =?us-ascii?Q?Ri1krTLlXwFGovMjMHnyn0A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r2Y7fZyAPMwXBPbHNbXsoClC2DczKaZ6LegHgm/kYuN0BtwYIKc131L8dGYn?=
 =?us-ascii?Q?Mqyq5z8ZnPQdPhqiLsk75m4Sq/iiOapzxiHYq3yUR48mlD5O+xYDSJdfyR9f?=
 =?us-ascii?Q?x/salfhqnD03LySF5TWerChtjOhcyV3MfjWwn4Z+cHn4+kV1BCtE+webdrJc?=
 =?us-ascii?Q?GCISU7X8UgcJ0XEMCCj2JmhocyMmrzZDZXXBTXofUQFXBleThJfvb1o9+LFL?=
 =?us-ascii?Q?qzzUJdrhKKQPnJWhviDncCE1oRHFCK29OtEs9M1ccvvLW2lwEBV+y0g7VzpG?=
 =?us-ascii?Q?FxxJvxZectEfTnaaGxfzuCrNDPE8OwiOWuz6ry3kyAbq6thI3KuDuqUpybXh?=
 =?us-ascii?Q?FdTUwlDetsYZS1KMEpdN6DdKr2BNRVC2XzyBq1Q9F+gpSQHJnMe0WQy6erma?=
 =?us-ascii?Q?+yBRNfo3mpEPPp4uocZkpNmHq5podFup1OJ1ydZqLY+FkZmbt/0eAEvnnZQh?=
 =?us-ascii?Q?tCMOjkQJ20IMsyp/+I3YHLk5awHCSriNTxd5ZFKnikSMEdFM0okVHHNK2J8Y?=
 =?us-ascii?Q?/LQWyRVT5bqR1Qi/V+0B2fzpZdZTuJvu6qv3soh5mOxhIryG/1Zf0CisLXKg?=
 =?us-ascii?Q?MZEQTN1inUfgehuqQQWgFPd21tBpeyWjjF3F1YzYHGR/mQV5+ihnYB6h5e5l?=
 =?us-ascii?Q?4yDNonOp1XlPHqPI23MifyLbPtZXMyIb97obe9akqJXMV8J/jPsZhE5tjHBQ?=
 =?us-ascii?Q?DZrca/dT1VKqd8lrYF7f+aZaCw2WEE+NqNJu/qJaRLIdaxYnJ6ZOEwTvRfkD?=
 =?us-ascii?Q?Aik+wdI3LEEDeeiRYQNaOJ5esuknbqV36n9J9wIyjWuw4qDywhq8dLZv3mKo?=
 =?us-ascii?Q?EKqownMbNIuj/aGuvsjX+/G4ktIKZ/FAw819yjei93fu+5TB0LvuKGn6pcTr?=
 =?us-ascii?Q?e3L72kx68PDxzgLxZS9PBZE5NRwRFIoluFwjwBaseqbKiv+WyE8FAxpe0lg9?=
 =?us-ascii?Q?WIZUvmU0Pui7SJ4topcfVOpyMiNA2MpqTYwS4YZpRgvAI7VOxXlY/kAljDOR?=
 =?us-ascii?Q?/olSlj69X+J4v7AEVI7o2G/37N3+xHZfAge0QhZqYpLhiFnWstAoJ9Gx08kB?=
 =?us-ascii?Q?raBb26QoUBm93bb/Z2R4pcq6Y/XRSXuEE9hKo1j/HsUXO0BShIILhTNZl8Vw?=
 =?us-ascii?Q?gEIKVspguK9Shnag8IqhIUijiPiprDZ0fzeaHVgtI4CtbkfxVAW9pIRSaEtk?=
 =?us-ascii?Q?ZrDgsT+pGx5aL16af1JctyL3FKkQBkP4aGRk3PpLAJ8oBz1wdWPOlGtUo/bd?=
 =?us-ascii?Q?AqUAgjtr0EbxLXmaGbepQM30XzhUWj8f5VL8OqPY0Nz+ypZycS1FhoFFeA9M?=
 =?us-ascii?Q?yZ+mlM/tQuDVnh8vzNRerkufWry9r3MXF59Xj6q9rr0k0SKqxQ1qd7uDbdDD?=
 =?us-ascii?Q?hK9gOKzynXCYx+5Ze8S1BF57Kyb94QNi6W6RxN/6owjcPvsbK3l0sNYufvkm?=
 =?us-ascii?Q?aTWhCNn3tDcDa0UAhliWmQhdZk8hbODU1l4IMIhfXMd1GhCWoBJPzzvSVMvg?=
 =?us-ascii?Q?ctZHp+9UYdGsEYWG5aARKHYOSfSq54hhtbd71NVO2EobbBUAO5ewDY3DWKg5?=
 =?us-ascii?Q?8ljFtAsTOOhTBUa1fc39sVQaVP6GnubXKQY9a+EtayBNrHKTrnGz8LOBKO0Z?=
 =?us-ascii?Q?DE4mQVRR4EjPmoeCo2LLcoLio3YVW661NmtqSYnhw5fNZPCGjFoTwG5ef2fG?=
 =?us-ascii?Q?9b4DuMfyjGbijd7RICW2EURWJn2qBCf0aSes41DQlXz5tdLwkCay/KrcztV0?=
 =?us-ascii?Q?BJld8sj5zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71004cc9-b7df-4724-614a-08de6dd0b04d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 03:00:21.1384 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D11W7oRKK2J7yXGYElGkVQ8KYicEOuKth2qjvYGW2naW7BPMfnolRIFqrAV/vLfLNuF7mt5D3ikuhNiXlK+Pcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7439
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

> Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
>=20
> The 'video player' showed what the requested HDCP mode was but not the
> actual status. The menu system does redraw the screen with a special colo=
ur to
> denote the status, but that is immediately overwritten by the player thre=
ad. So
> all you get is a very brief full screen flicker (to be fixed in next patc=
h).

So we do not want to refer to the next "patch" just mention what this patch=
 is doing.
Also do not call it a "patch" since once it gets merged it becomes a commit=
.

>=20
> Instead, add the current HDCP status as an extra text line of the video p=
layer's
> output so it is permanently visible and clear.
>=20
> Also, move the enable of HDCP inside the mutex lock with the internal sta=
te
> change. That way, the newly added 'enabled/desired'
> line does not update in advance of the 'requested' line (due to the video=
 player
> thread being asynchronous and managing to turn HDCP on while the menu
> thread is waiting on the mutex lock).

>=20
> v2: Split into two patches (review feedback by Kamil)

You can just write (Kamil) here

>=20
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/intel_hdcp.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index cd5d2b6be..8e2=
9c5e32
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
>  	char timer_str[32];
>  	time_t current_time, elapsed;
>  	int minutes, seconds;
> +	const char *status =3D NULL;
>=20
>  	data =3D (data_t *)arg;
>  	cur_type =3D data->hdcp_type;
> @@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
>  			prev_type =3D cur_type;
>  		}
>=20
> +		status =3D get_hdcp_status(data, data->selected_connector);
> +
>  		switch (cur_type) {
>  		case HDCP_TYPE_1_4:
>  			bg_r =3D 0.0; bg_g =3D 0.7; bg_b =3D 0.0;
> @@ -544,10 +547,18 @@ static void *video_player_thread(void *arg)
>  		cairo_show_text(cr, timer_str);
>=20
>  		/* Draw HDCP status above timer */
> +		cairo_set_font_size(cr, font_size);
> +		cairo_text_extents(cr, status, &ext);
> +		x =3D data->width - ext.width - 20;
> +		y =3D data->height - ext.height - 20;
> +
> +		cairo_move_to(cr, x, y);
> +		cairo_show_text(cr, status);
> +
>  		cairo_set_font_size(cr, font_size);
>  		cairo_text_extents(cr, hdcp_str, &ext);
>  		x =3D data->width - ext.width - 20;
> -		y =3D data->height - ext.height - 60;
> +		y =3D data->height - ext.height - 120;
>=20
>  		cairo_move_to(cr, x, y);
>  		cairo_show_text(cr, hdcp_str);
> @@ -605,8 +616,8 @@ static void stop_video_player(data_t *data)
>=20
>  static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
> -		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);
>  		pthread_mutex_lock(&data->lock);
> +		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);

Move this change into its own patch logically a different change=20

Regards,
Suraj Kandpal

>  		data->hdcp_type =3D type;
>  		data->video_start_time =3D time(NULL);
>  		pthread_mutex_unlock(&data->lock);
> --
> 2.43.0

