Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D434CCF9E5
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 05:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB7710E0A0;
	Mon, 27 Oct 2025 05:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DzhjcaLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D405A10E0A0
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 05:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761543483; x=1793079483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eO+1uOWGpDaiZcoZwnGvesGcjMqRCsfuusgtMsHZfe8=;
 b=DzhjcaLHeeTZ+eHACrP+HbQlC+sCRsCn/VbjAmcLHKYYftNsHusuPI9I
 NVSzkFE8utkXB6PpYf6ZF8YnERTo1h4qe9+P7KQ6P1CoL7VwPhFYHAtK8
 z2jqu1K0JQz4iRZqRpcc+JKxFz4b/biBUVInog3ve8zRsANbVxcEMCTTn
 dDP4NdJT/CBdM/R7yDKxuwey78cLfH/qyboozsP9DJ+KILN3N4zgFVPAN
 TLRukIRcVcAiGAKDK7rsQBzNa2hfvdPEIBnuIRuPIGoQMfyDjW6O343JW
 wG2jPpeYHM5QBolLbZtIOK4VlGLDmWoOFYDv+OT4AOxBHXMCuYnCqL5tM w==;
X-CSE-ConnectionGUID: 2fi+jUPsTmWZv+IH7j3sRA==
X-CSE-MsgGUID: Um6DiSCaRg6e0Ru6gpnPzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89088890"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="89088890"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:38:02 -0700
X-CSE-ConnectionGUID: KFNDHthXQGqwDCSbXK0rKA==
X-CSE-MsgGUID: fz9nvu2lRTqkxD+1szkDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184844214"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2025 22:38:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 22:38:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 26 Oct 2025 22:38:01 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 26 Oct 2025 22:38:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mSw0E998M2EVFRKJI/iR/klQ7M7uJNFcQSoS8KPT3thk5LGdm1GCvrrMHhLlHa0G3KQ+f196gxBnHafpSmHnBMj/rTgP6t0RtCgn7jZR+TmbjdaR0gSe5q3+jzhdUa4KgPkHyH+QI3isxR7RywmLZB6DXXkKX/o/xKDrO44XOH7K+osPkXR++6nvLMEEHW4RKR59Y9MR8545PRm9E3np/4zx2kFRCJh7iVHTouiqeuAkLOJ5CyXrx9eFMYoNVu2Kz5hLOaIQ1xWcyiCrTQaZ30cwWLhcw6NTc5nL/Jjlr8sWKZpPfmWT/PDUMCMsTp6VAKki5hieSmY20uSDNt2hPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z4OexcosdIaYenexSz9p/tgI3y4pnQ1+sF56WR4Z+4=;
 b=rs6u8+t20MJhO8M8l4lC9QSbfAgcUweoFJ/hl8KxGRLFHlPoJzg/468uI0jNP1A10xJzXO/8x51qOMkCVD6JQee3L+l9NSgdhO9KsRXEIA0U/gN3W9CH1Q7dUu9mFzNbveu8owLWRvfgGUVfjcsnG+HvdGueTG0Aak9WSvCnjDEcvf9x1DNCHEJpxOcx9jRxxcQ41tmuh5J1XzTw5qL7pJbpWAVwbqc9ROjploIGStL6NT7acjbpJdezvSPm+/++orSFMzQN55cHBxgLSiXcVjMBAXajIj4/WvwiqRuD8hJdBL1yKdr4CjbBGP50HF2ez2WeLf3c/cidqu78H0qKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ5PPFD56C4208E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::858)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.16; Mon, 27 Oct
 2025 05:37:59 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 05:37:59 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Samala, Pranay"
 <pranay.samala@intel.com>, "S, Sowmiya" <sowmiya.s@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Topic: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages
 for skipped subtest
Thread-Index: AQHcRvp91nhdKW/FIEObov6U+cXoDrTVeYBw
Date: Mon, 27 Oct 2025 05:37:58 +0000
Message-ID: <DM4PR11MB6312BF68DDD13E2ACF61C89B90FCA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251027044824.2995891-1-sowmiya.s@intel.com>
In-Reply-To: <20251027044824.2995891-1-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ5PPFD56C4208E:EE_
x-ms-office365-filtering-correlation-id: 1d144ee3-18a0-40ea-4676-08de151afd2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7+0CzKLozcHjjuWuq4A09vb29UNR9w78kl7xZG9esZ2l9XULTYV+gGXNmLsK?=
 =?us-ascii?Q?elOoKpQ5ygDLu8ICsd6acsP0vujkzJIcv/Pi4+uPTR/BKvC8Zcizb/Zw25PD?=
 =?us-ascii?Q?ylV7D3g3O0bYXkJiwB84280ZkvAJWStCh8Shtvsv3eI10nh9IRHnHjBKauLz?=
 =?us-ascii?Q?W8T0sytQIQQyoFdw46JwtSWmFPTEDCMtkJsTXHuPwoXh9jSpaLvrse08EMZD?=
 =?us-ascii?Q?AamTsL217jRnMvrmITQ33Nj7uEfPxE/cZRPv+JoChDoz/5XOGfORKIfN0rrN?=
 =?us-ascii?Q?lo76ogwObeekCv0jaMdLHQKvJgZoUVPvowdroBM+z0saDgXGaUFUjGyTHI7j?=
 =?us-ascii?Q?tdtkUeEKwMmXL5V+JWFB8VIyWctyen5YzkTEeAgYfZtZvdw3v31HzdWKNlOz?=
 =?us-ascii?Q?qJ14hFaawfhBLwfPxyo6IcwYspu9v1Tmnkx5EmBSChEirDZ92wYCFagMyrhd?=
 =?us-ascii?Q?76ZDRJsDBHMyDTMNpe94DOGg48cE5Ae7zZmf8p8m/fU03OF+KNA3XelXiN/D?=
 =?us-ascii?Q?vptMalsQDjHP3eV5bf3DlpdH68XfpT6KirS3wVNRXxR3Hj0Up2zoRz58v2Kp?=
 =?us-ascii?Q?7Tp3DpSaP+H3SDXQ/TR2jOHqt4NT3/c+pWfQoPg/QaUkF7Vf2yzDK2p4nS0l?=
 =?us-ascii?Q?gLAsozvBR+XSvG1AmN6FVpO1CYMb9pMYYGp+hYPSCsQOb1KvIZQq07nhgWvZ?=
 =?us-ascii?Q?a4fuej0EAU8WkLwhQYRy/4Y/glescq0hTFsCDjCqq849vlyS578/8W6aipPk?=
 =?us-ascii?Q?5sIvLfbE6hITeL/bvjfiMS+Ea0JbHKo6F8L+cO0NuKodNo+NuOSOvRuH4uui?=
 =?us-ascii?Q?JnrlnvJZdA1Wp6FLVeEoRFcyvTdhX1ac14rF8YyuqTaB2DgYi1Y942nSnVbP?=
 =?us-ascii?Q?f/NgT0P2r2iPaQfzMzLpGaLjRi0Fdex2WMCPwEB38IP3Z5Oy8K3PRLkFjDWx?=
 =?us-ascii?Q?lmERpeUK7nxYjXpg9b3mHCLu0QUBmmii1lMZeQyofzKxrchswenZn7cjQOp/?=
 =?us-ascii?Q?lclceogYw5BhdInjquP+bBOaE1Wos0TRbjqUJd8kpLyhLcNqE7DpOSuwSpOO?=
 =?us-ascii?Q?JpGAHnI1xzKdghEC8+bomgW4ZkKqMwHwbh9YRA6cylzEiFAZX5mlVrfWjFjb?=
 =?us-ascii?Q?FHVTFejbfrPhKFDjev7whvjkGTbtJn6jRLkGmM4O2BHSpTh1mrv3aGavpOwU?=
 =?us-ascii?Q?JZFzTYm5ZEEWOj7yGWIz2sERYRFwA9m1vsZU2yFNMRtv2eRVW2QhNgTgZKLC?=
 =?us-ascii?Q?J4XaATWCfYv4wTtzn/07L71exUdYBA+h6p5L+FfrKw7HJTt4tf+ui14UENlp?=
 =?us-ascii?Q?IOJVUAD96MFVE5Acimn17m0aqa8pE8HULlhJBqic3Xu5+qFp+qiNhheyl9Qd?=
 =?us-ascii?Q?o7Qaq45ZNnfqd/NLSYhKCk11d1syyv6HHBpxAax39QvB6KHccYESu0343UiO?=
 =?us-ascii?Q?E1ICXKrWfALWv2uWZ8iD4Dx7QK3iRoEXET8o0g1MzkXyPEKLdZDt5GKnaTIN?=
 =?us-ascii?Q?g3uVLc5QndCKlPBE9j7AZkZFrVLIJs1z/dy9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kDDDTKFKiyg0h5bB3Clc84wj7u1nD1nvKXOvGsPJ3reGd1qA2V+YiqIHbVDA?=
 =?us-ascii?Q?crcMc8JFIcVzgyMNNJvyMN0e7kJag4/jg10a9PL1TBAo2q74V5BlJ7idOlUi?=
 =?us-ascii?Q?Lxi/Yoi+VyIJZznZu2TuSipa+iUvK2v8T+satjvl8pHBMkIZAWHPqoE9MbRp?=
 =?us-ascii?Q?Lm075bLldo0kcuZ6Ud9eQDFAyQUHMYB39PeCYW/zrtZZbuJEyHpt34QJxuRR?=
 =?us-ascii?Q?aXPfO/m4Pi16dNWZBovsBbNu9Rc4qxAQsRF3GiHLGjZy/Cl+aM8hwMmcJYWI?=
 =?us-ascii?Q?yihVlkJB+SqvR7hrq1icOreaxdVEjBOjMJBRtwk75K94ekuSdI3wKtOHwG9q?=
 =?us-ascii?Q?VMxKn3mueZm02xb9GR/iazK/ovXeDlcWZZi5/yp8nvMhtr3iScvsg5rKBt+j?=
 =?us-ascii?Q?ljzoCptEFqZARTORNqowqfnQkjeye+hR/pkPZR6O7qyR1tdgrY8o8EKaUzN9?=
 =?us-ascii?Q?6plG2m0YPlkXu17mQkHkTVwH/W3U8Szy+pcobACkgNTqWcs2QlNKngf+VKHI?=
 =?us-ascii?Q?IAsIfuK4KFJ4sb4fdK22z9XP0ZjlVUe+yWtuDhh7J9jsZoKNkQPmEp+yiLVC?=
 =?us-ascii?Q?9I6nOcMx+Pe6J/ohGM1bU9C8odM/Kh6AhPYEOZM3aAY1rYuq66eTBc7vA5oQ?=
 =?us-ascii?Q?5qGDLFw0T1UFNnbMvxkYKiea0SaP9ZyyN3scZ94FvbOoUJMwOQVTWb+6cn/u?=
 =?us-ascii?Q?NePMPhRW9eVBxs5RCzk58QtHIlaMMz+zielvDRvWCTMZCXxtbwKqy62kEm3U?=
 =?us-ascii?Q?V/0WKdRHnLHiyG/lrmrEzIhoxLDS6n2KTs60N9ibfGnPN1vXlhJVX+QKc1dG?=
 =?us-ascii?Q?1/nGPhykZsjgzlRh82B+CYEX/9OL33bvBqUOMt7GiD5BFrPjUFLXYZlBhu4k?=
 =?us-ascii?Q?6UWQ9nCXr5tWOwcnLR7AhUIZNPy1hBh1qmzmcvt4aw0uozH6SZHaU15XVSFQ?=
 =?us-ascii?Q?DrLJZPQWwfg3Joo++LlHdpq+GrHN6jFRcQU2c1MvNkdVhdZczDBZC0LO0lGo?=
 =?us-ascii?Q?mubYLtQwhQrV8Sxn3g48vceozBpGOEYpKQ9y1NHcLq3D3nvdowSqqfANhZfd?=
 =?us-ascii?Q?BZiOhkGspsJ1V2JxK6cQVmG6e9OSY3EqSJK9FN3lFifktuLnJqK14AWi8df5?=
 =?us-ascii?Q?MNTxBdnEQ7gXfWVo7p6fJvwqiNmhuqSBDM4aXas+daCtjFvBaM3eoszzig+G?=
 =?us-ascii?Q?ww84HLNOcVr2RdQji3eDUpBPrMUm8q1b6heszKg6jlK5QlYJYchbw3AzGubf?=
 =?us-ascii?Q?c6OU8uBkEiVvIYy/5UNs20hheyLtvRzuWNzRFiRjAZbiv0rfm4s/dn+FegBQ?=
 =?us-ascii?Q?ANDl5WD2d/AYFyr98RHwc7vATsfZnqvQ+L3TQWoKdlnBiUOo7xa6f7wxpsxd?=
 =?us-ascii?Q?HhiTRgN2czCyO+Cq4jJZGBdc+s0q7y7lZ5ar5CUU3rG1RGV/owXA8mQ4rYK7?=
 =?us-ascii?Q?8bDn2m+hbWMAUvkQoHY7fcVd0XE36sp03woEtc8sSrdkGsIGlwF6Z6O603oD?=
 =?us-ascii?Q?/a2JUSo7lSJtoJJyfv5gyIfyO/DSawWSYZYGsuxwwoEU9WiYuOmqps0HFI+9?=
 =?us-ascii?Q?OjGsGYBcJYMY3bnVrnk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d144ee3-18a0-40ea-4676-08de151afd2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2025 05:37:58.9886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GR/1kij8P6fZAwxMRo7bBRUggyFb1Zb6QN1EF6MMKz4MbplT5PTTJXDl6KCvnCI3JnF5pPpvS26gvBp0tw+n7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56C4208E
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Sowmiy=
a S
> Sent: Monday, October 27, 2025 10:18 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v3] tests/kms_atomic_transition: Add info messages =
for
> skipped subtest
>=20
> From: sowmiya <sowmiya.s@intel.com>
Please fix the name.=20
>=20
> Add info messages for subtests that are skipped without having proper inf=
o
> messages. This provides clearer insight into the reason for skipping.
>=20
> v2: Add switch case instead of if conditions
>     Also changed the flag name.
> v3: Reframed the info message
>=20
> Signed-off-by: sowmiya <sowmiya.s@intel.com>
Same here.=20

> ---
>  tests/kms_atomic_transition.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.=
c index
> a13830965..3c54604c2 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1172,6 +1172,7 @@ igt_main_args("", long_opts, help_str, opt_handler,
> &data)
>  	};
>  	int i, j, count =3D 0;
>  	int pipe_count =3D 0;
> +	bool info_flag =3D false;
>=20
>  	igt_fixture {
>  		unsigned int debug_mask_if_ci =3D DRM_UT_KMS; @@ -1216,6
> +1217,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  		igt_describe(transition_tests[i].desc);
>  		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>  			pipe_count =3D 0;
> +			info_flag =3D false;
>=20
>  			for_each_pipe_with_valid_output(&data.display, pipe,
> output) {
>  				/*
> @@ -1224,12 +1226,16 @@ igt_main_args("", long_opts, help_str, opt_handle=
r,
> &data)
>  				 * panels with long power cycle delays.
>  				 */
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET) &&
> -				    output_is_internal_panel(output))
> +				    output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if ((transition_tests[i].type =3D=3D
> TRANSITION_MODESET_FAST) &&
> -				    !output_is_internal_panel(output))
> +				    !output_is_internal_panel(output)) {
> +					info_flag =3D true;
>  					continue;
> +				}
>=20
>  				if (pipe_count =3D=3D 2 * count && !data.extended)
>  					break;
> @@ -1249,6 +1255,18 @@ igt_main_args("", long_opts, help_str, opt_handler=
,
> &data)
>  				test_cleanup(&data, pipe, output,
>  					     transition_tests[i].fencing);
>  			}
> +			if (info_flag && !pipe_count) {
> +				switch (transition_tests[i].type) {
> +				case TRANSITION_MODESET:
> +					igt_info("Skipping test: invalid for
> internal panel\n");
> +					break;
> +				case TRANSITION_MODESET_FAST:
> +					igt_info("Skipping test: invalid for
> external panel\n");
> +					break;
> +				default:
> +					break;
> +				}
> +			}
>  		}
>  	}
>=20
> --
> 2.43.0

