Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BA45E7718A
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 05:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC03610EECD;
	Fri, 20 Dec 2024 05:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZXvS4HAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08ABB10EECD
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 05:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734674309; x=1766210309;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uQtZQWVMXSMduIp94aiUxWl36ZklxyZ85KOO6oW+Ga0=;
 b=ZXvS4HApEY0ncG9VN44R6B7dlakEleZbvXuZIpbu1IFARmR+9c9EeykI
 HhxcMbhXIMJBxWB9veH43r4KFPnU7X0og3uxA/LHJTeKAl1LcwMn5OcfS
 MyA+1rL8tltdyFhcVgXYEh4mSg7DyKCvY8bqdNt2QXXpQWbW/fs5tXC8G
 8DdXES2BR8Dd0SI81aJfkiALUrk1OCdT+1fUIq/ZuUd9uuHA+urxQBKbV
 DeEYJoO9Ig/MccBhTAtaxnfwN86K3BLFQldIJbuC0qjn5gg/voP5ZGWv2
 8IYUlpd77dpaoBMpWTCChNPmzdoEHwK53LiLZ8ewuCXJEVVzaOACuuFhj Q==;
X-CSE-ConnectionGUID: 1mlQQajlSrKeqYYQUDI+Ag==
X-CSE-MsgGUID: wG2Fj/UdSgGnnsNJONG/sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34498682"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="34498682"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2024 21:58:28 -0800
X-CSE-ConnectionGUID: fuJb9ec9QSy0zqa36nL90A==
X-CSE-MsgGUID: Bmp+NxoCQyGPv04omhLxhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; d="scan'208";a="98939891"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2024 21:58:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Dec 2024 21:58:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 19 Dec 2024 21:58:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 19 Dec 2024 21:58:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDDraUBsxcdUIgbx1Kcn1moerePiyI33q9GdSpvU3ZlNVq8kIl5rjCjmA6wsQDqjKUq5ch5sBn1vAb31eLAjNyaG8nFT4QStDxpia0S/edul2uMnzyqo3KaJkc7/vGY9mUB4VlKehf7Sz3y7/UEdf1nZYcqbDK3dfxTLaq7+jPMcjEWyG6m+338c0G5DxAa9UyKCRHX6ALfd7I3c4Wa0KPFIjZEViyd4VBqTCbQnYYnQBl6UhXO4TZKULLdFAp0UlvwcXQDqSXSCapaQaYoFOOiQ5wZW0Ms5wchWnGb8DVUzB0QV2tLkvLEiv3xrhnLp6YO6KsZlKUQWvfnuzHOgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHmOgIpeuqJLDg29ISQM5f7h0Gh/141SQHeckVSWzJ4=;
 b=gerXfAgm+YhlQu8oEN6lKkREljCU+JOc9reJwlpsD9P975d75XXgOVotsEFSCm25g1TylL+yD+Vmkou/5K6fLAt0fgjpoBZ6x7H1P9TyEcgKW5P1U+JCjiP3+TtZ9m4AMojp9TdUi3KfNo3eICZ6HrMvVRl117bRgpBrNs+K7+Odgg6KLqRMf6sqg3ty6IBOEuM088fG4vZoGZn7NtkpHkOmCCMMSrbD2Rv1/inlher0Q/xoTAs1R9nBcv1/7IuALtGrNc3hZm58Dx0714izLvfE/tfRYv0iOum2x8pur2N3fONcInjbXCMd/5uAm4QPxNbf3NK+t+1wIoHl/35haA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB5173.namprd11.prod.outlook.com (2603:10b6:510:39::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8272.16; Fri, 20 Dec 2024 05:58:22 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 05:58:22 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after
 LIC failure
Thread-Topic: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry after
 LIC failure
Thread-Index: AQHbUS3Vq+AW+MWxZUKSb2ALmnj1ILLuo0cQgAACn2A=
Date: Fri, 20 Dec 2024 05:58:22 +0000
Message-ID: <DM4PR11MB6312F08220C0B4AF6D8903F090072@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20241218091826.3014999-1-suraj.kandpal@intel.com>
 <DM4PR11MB63122D7422D7617B9B3A3D2190072@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63122D7422D7617B9B3A3D2190072@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB5173:EE_
x-ms-office365-filtering-correlation-id: a48de282-a3a2-4e41-7a9a-08dd20bb4f99
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?bNLgFg8HQxetturi3lz50Vn1PrE8+0OiYEn5urqTOfN3p0O3RLG6IN0sfcB6?=
 =?us-ascii?Q?BuIcQs3u8e4c1NVBK7T4f0AT8H1Oxh/lPZjwhqroBdFvAwPqQntTn5tQ+gmu?=
 =?us-ascii?Q?DkO+tBnEQauA7IeUUZ8CLLWF0RcsZzL6TzbFZnNy0YOafi2pDzSomNrVmNgO?=
 =?us-ascii?Q?SFjECKsZxrlGLfhVmuv9FmkI7O4JjPEEZbxkAaZ9bnp2oOVb7s37Rnf99cg0?=
 =?us-ascii?Q?1Yyra5vRv/5v2M5TI4zrlige5OxZX61VNO3u3Cs/soorCMEY+HsTLfti3xM+?=
 =?us-ascii?Q?jKcA7WEK4ci6lrBZjNQYFSq81XnSxe0cJqw/RZgUIE+c2/3fGh/499eyCEMk?=
 =?us-ascii?Q?716fuvN7u2jtBAvHnEfi4WAeFl9J/BUq4ncAoIHhpNrrJ655kvSNEatdr+SP?=
 =?us-ascii?Q?eyxUF69+MgNljLK8KHsT3klBfOrLwvnlwp3MsKD512jSXEMQMfQ/pPfg8Wsq?=
 =?us-ascii?Q?CRmYLbv8naPZwNpDIR6NksSTZtOj8CmBe3PaWjAQNhF7rml9EQDg1AMrIYxR?=
 =?us-ascii?Q?s1YVQcMqLjBfXDPJaqngmJtF3O1cDff2SyvbH8MBrYMByQj6B7N93UVi0QMq?=
 =?us-ascii?Q?9My4PkvSQh+mMTbKa2CN7qwtTrnMb9asikITbNoqa5t+XOJPygEeIE3qahYe?=
 =?us-ascii?Q?/jWkaLEH1UYaXZg6tgGw620K+hnLAlZg1yWhW5/aKVtsyWLuX6O3NpGkmlj9?=
 =?us-ascii?Q?DEUjZmhHrTCBE0pzbz9/mTxFFjHcw3rN5t8AcW7CAUjnbDBTmEAolSBzq5Sw?=
 =?us-ascii?Q?+OIRpADy0TI6LNhiPTSWKUH8f+CdNvVJVcMPURgCA/haMFR7gFoAKo/MbY6e?=
 =?us-ascii?Q?YuUd0+OrTBtLRFFGoOdnEd9GbHVi2EyzbpdtFnwpoPAwa5OkG8RmFfKaoY5B?=
 =?us-ascii?Q?HA76BuVGxnMfmu2Abr199Y9n8ojmLplG9y1lyMnyX75uJwc0aHlZJT99SAKS?=
 =?us-ascii?Q?+a/ZDoQXmjfiXMT5mZ2D/VNuH4wEyw038Jbb/EOa4vMJYyZ1nePgWuTMsVVH?=
 =?us-ascii?Q?eqqtYpTW/EGh/iv8l89p8EPVKP+JX6X1zmKk44ZIUptJ2AHy9NXSEUaHT9p5?=
 =?us-ascii?Q?UMZI8emxnXn4RkQmqqu4MFKVclMfq3Xo8B49Lt3yWDh+mug7B5K6LBRkNuqc?=
 =?us-ascii?Q?CLn804/inO5FALMOg9NBSEs53V771pZG7A6AMgV676WYuO8XUcIRd9Oob+kt?=
 =?us-ascii?Q?rP5e0cOda8Lc/Qh9KNXuPfHImr01pPomO6IE7/3wvMMMUM6XugyqGz/HXpJO?=
 =?us-ascii?Q?lTb0dHQC1jQvwLV0WHenqEmTbIzT9yEdtw74sD9yXI/b/uUYTt/TK4VGzE+B?=
 =?us-ascii?Q?YgZlW3j2fGo7F2e0Nw6qygUT4oSsMIT4SGEV7iBYEzy2EQS52sjFDCbuQmRs?=
 =?us-ascii?Q?ZGHkKiJGaEx4J2fb5ZVlMWQLseoUjdYQEjwtfaSN5jQCjDtb/e0T1jmGj54B?=
 =?us-ascii?Q?0w5auqvCja8BPCQJT8z9UvlP8QkRxS21?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/tLXrauV+HOTCKIWh9qGfotLRMs4fQKfx+gdar00IZntbJVp7yagKlwx6jVy?=
 =?us-ascii?Q?FlQJSaq5RWkUnNmUl2hAjieK2KPmkRfCJVzZpZuqJRxYTGy5TdL99z7zqU9i?=
 =?us-ascii?Q?sU1bjopVI8k3N7JJ74lQ7r+bpDdChRfE8HhWO6/kIA3jXQIaCji/xHXD93c1?=
 =?us-ascii?Q?pdRPGm/qn7EQBbf/QiSuugDjRQ4DLfLWiUUpyjeC4uRSfwKN7aS47cOYWUiO?=
 =?us-ascii?Q?QF3J10fzDoanYPK2n86iHWVmaLo0/Kf3nCis8ZXb1EawIXfD7+3C7AWonuEP?=
 =?us-ascii?Q?JFP1pVYBhsCzTy2qlYDPdeJO2rA7dX6BP1qSIeKUbmSRn7lDe8tfHE63HwTr?=
 =?us-ascii?Q?zONNYdMETzLDv6CQmWK59zKfLWSOMMLi3w/sSXmpcNZL5ASBrXj14ljO/yMS?=
 =?us-ascii?Q?Ekfio+NDQzhBz17CEC4gD/CKpkCkvbUdtsFuIAMh+9/SFMT5sjLcP6tgeGA2?=
 =?us-ascii?Q?vdHJd5yAXzgeozyAsYk3nuMg50Td46lmGhq5pltOaDNeLaI/y49RlrEeuBsa?=
 =?us-ascii?Q?hS/CVyqNz7c+GMK+Vg5a1oF+PfDI7viRO0d/uM2VVt7TgAprKRMP1EN9hshd?=
 =?us-ascii?Q?aUfhX8P291v0CWersSMGH7mVepsxa6CUWv06F0nnUc/AmQPThUnrnERNEurL?=
 =?us-ascii?Q?NGhorxHzgEyisHiDDVoNJUmbQYKD5sS5QlMnWG+Z+3xLFEpshFwXesCPN2/1?=
 =?us-ascii?Q?sE5uzw6KFeKnb+nFWaZQAIqe2phOp9zKYnJ0jaXhztLrpiANKtIhSd5uEhNU?=
 =?us-ascii?Q?ln+GOtHRfDOY0Sn1LCpMXf3QFe7qllAyeYfonC0h6KLlrAa9RAe0p4EQTFAH?=
 =?us-ascii?Q?nVWb03gKlpdu5Et1uuBxhDc0Zdyth3Tyg8mwtva2V550+M8aexWoP/WJ6zt0?=
 =?us-ascii?Q?U/ePPU8JgufnwAj8ZH6E8yc64TfbHoqbRyNCQ1rS+op/BmO8omQ1tLU3lE7V?=
 =?us-ascii?Q?XRDdejnC+tmIkW0TfY4o0pu5B1NoHAjwcw593YvhtQoTUV228AEMzjUA/L2n?=
 =?us-ascii?Q?10pm9SaOuTNMuTDMyu0K/mEQZTJyzyJa0wpmqkyKkDwAyR5ZmWuIhTmm8jow?=
 =?us-ascii?Q?f9OdiPn3vZOdyzyRLeKtprcv7ij7OqZ3/zB8n7aFFLZoUZglVAxNTxTuAEhE?=
 =?us-ascii?Q?m672y5qqxlPn++UdepI/l607FYRD/1TAFN+GjrQm13xIwU2jlVceu1i7kJCF?=
 =?us-ascii?Q?K38VnYgifKMrta9YQbe+GxUUbfYi2vHMAnQG89iYW7nrY8rRP9WlkEferpqy?=
 =?us-ascii?Q?FOICxvcsfNUY1SehcC4wUHgSnVg7tXIiTs1BkHIwQiSDi3vToyr3dzyBgvIT?=
 =?us-ascii?Q?WJOwHMdAvejJ89ggt6GEaH48OEybAKY3Gs/xTv4BjggWbIQtm6MnU+fMZ7/J?=
 =?us-ascii?Q?a6AXEHCSC5AFNbtCvL1QGXZUy6Yk9tSw+20hX/trqjBeg2PF5AqiLEkUGpjH?=
 =?us-ascii?Q?RqNXf2DbFlSOLRIxqaWpr9H7qMSwharHrCHtdCmSixdchD/G8ajqa3H+jgQw?=
 =?us-ascii?Q?FucccZ1n8gF14d0WzWdsjdajJclQcj2lPA1l8jhx5gee79BSSXYl7uGck14d?=
 =?us-ascii?Q?bx4nprGXV6t/UbIoAY8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48de282-a3a2-4e41-7a9a-08dd20bb4f99
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:58:22.2450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NqkaOKzfeRC3f2AAiQQO/5A/SWSwxOhfYrZot8l7eeC+0KhtQMRuMZzmDkcBe/Hwp4QWhehxE9TWhPSRBmlKCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5173
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

There is incomplete in result please check.=20

igt@kms_content_protection@atomic@pipe-a-dp-4:

shard-dg2-set2: FAIL (Intel XE#1178) -> INCOMPLETE

> -----Original Message-----
> From: B, Jeevan
> Sent: Friday, December 20, 2024 11:27 AM
> To: 'Suraj Kandpal' <suraj.kandpal@intel.com>; igt-dev@lists.freedesktop.=
org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Kandpal,
> Suraj <suraj.kandpal@intel.com>
> Subject: RE: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry af=
ter
> LIC failure
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Suraj Kandpal
> > Sent: Wednesday, December 18, 2024 2:48 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>;
> > Kandpal, Suraj <suraj.kandpal@intel.com>
> > Subject: [PATCH i-g-t] test/kms_content_protection: Add HDCP retry
> > after LIC failure
> >
> > After LIC failure HDCP should be reenabled when retried in the
> > subsequent commits add function to re enable HDCP when LIC fails in IGT=
.
> >
> After LIC failure HDCP should be reenabled when retried in the subsequent
> Commits, add function to re-enable HDCP when LIC fails in IGT.
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  tests/kms_content_protection.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c
> > b/tests/kms_content_protection.c index 04dff7a05..5b3e8f00f 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -373,21 +373,22 @@ static bool igt_pipe_is_free(igt_display_t
> > *display, enum pipe pipe)
> >  	return true;
> >  }
> >
> > -static void test_cp_lic(igt_output_t *output)
> > +static void test_cp_lic(igt_output_t *output,
> > +			enum igt_commit_style commit_style,
> > +			int content_type)
> >  {
> >  	bool ret;
> > -	uint64_t val;
> >
> >  	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
> >  	ret =3D wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> > -	val =3D igt_output_get_prop(output,
> > -				  IGT_CONNECTOR_CONTENT_PROTECTION);
> > -	if (val =3D=3D CP_DESIRED) {
> > +	if (ret) {
> >  		igt_debug("Link Integrity Check failed, waiting for
> > reauthentication\n");
> Can we change igt_debug to igt_info.
> > -		ret =3D wait_for_prop_value(output, CP_DESIRED,
> > LIC_PERIOD_MSEC);
> > +		test_cp_enable_with_retry(output, commit_style, 3,
> > +					  content_type, false, false);
> > +	} else {
> > +		igt_assert_f(!ret, "Content Protection LIC Failed\n");
> >  	}
> We can rewrite a
> 	else
> 		igt_assert_f(!ret, "Content Protection LIC Failed\n"); Avoid {}
>=20
> Apart from these change it look good to me.
> >
> > -	igt_assert_f(!ret, "Content Protection LIC Failed\n");
> >  }
> >
> >  static bool write_srm_as_fw(const __u8 *srm, int len) @@ -452,7
> > +453,7 @@ static void test_content_protection_on_output(igt_output_t
> *output,
> >  	}
> >
> >  	if (data.cp_tests & CP_LIC)
> > -		test_cp_lic(output);
> > +		test_cp_lic(output, commit_style, content_type);
> >
> >  	if (data.cp_tests & CP_DPMS) {
> >  		igt_pipe_set_prop_value(display, pipe,
> > --
> > 2.34.1

