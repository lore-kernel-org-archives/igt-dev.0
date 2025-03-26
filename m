Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFF2C28B30
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 03:54:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADA810E2AD;
	Wed, 26 Mar 2025 03:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TMMRlirh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE7F10E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 03:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742961258; x=1774497258;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xGwD/+yJ6+RXw7TIAHuQFJ4jpbWhP5C3fXxfBnjfCM4=;
 b=TMMRlirhJ1wNVHKz8a4HSpUPnJVFC/O5n15kBsWPDhQpTMK1TW5NkuCq
 GHFY4IFwDq/55jz+3PU9KkMjDxlV2pjOLxXUuP0b8iHT3R+lrtZTwSQNi
 CNgDptkgZKu+saGzSxHOP6QUUPbYY+8OX2R32DBsaXQJYh2cziz4fr+s6
 jE/9ivZNke9EVYwJuqht3sAe0mp5ujejaj6BxuKe1qnFFgfZk2G17Wd7R
 NBtl2p1uhDk5KdgZERT8zK0HXQMbtMQAnoYjcNpOdc8PsRM0oLCn9gtco
 2qZ/CXrk8FIIWTFCSCxLSx/0qFB1R92yHGVsgYzZ0iESxpe9zKLOVVTHK A==;
X-CSE-ConnectionGUID: 3mH9/v5ISK6NhyF3qhGTLw==
X-CSE-MsgGUID: Bl+N7g3DRdmlsHJYfBz8ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="66690855"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="66690855"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:54:18 -0700
X-CSE-ConnectionGUID: EEqxVWnHSwyBJT2rgqnBIA==
X-CSE-MsgGUID: OaR6EYu2TtaeFabrMYcoOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; d="scan'208";a="124418819"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 20:54:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 20:54:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 25 Mar 2025 20:54:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 20:54:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNfipOs2shNYTcxj3LYZbZWCL96YGIcIdYzp5aNgjE9nAYit2O9pbVsPwASvdx7awdOBKMcsMOQbIjaYiDKuh858zwqoRtCH92Vc5pXSDEiB4SL1MOsy1QVOKPtrWmaxTV6ju2PxT/Bo+q7+2uA3MFyso4j+ezozL8g/+Ekp19cDmCedEVkKjwlnjgSfv9ju9UVUAzWw93WGRnvbYkMd2bkrbcU4HIYxC5tcCYZBijcYhL6dWllQNU4s154LE/Rrop+Wj6QA6x+UugNU4u+RCNmMAH5PtWU6dQrnt6qd6hymNEK7u8emn0jFXp/g3Af/fM5mtD8f0gE7HWvEmh90ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGt65T7UiCHSslhdm/NOFSm6UNKBY9OoFsLDcg9loBg=;
 b=OdHtiCOxqul6A803r4z2wgJ9v/Cbo2Cy87QwEwCGkE35hm4tWqyi786AIBXQWIT9+EiFjFf8D4VbAAMG6RlQ5Kf/zzfxR9BZpLhxb1hDiWGEkUfAMlbnKQ4vgZYddz90ZdTw8DbKzQnLKRKAVT3/SfRs3NvflDC8EwKQN+UlQEvfpkmPIP+cM/NQykaVnFn7ySTdp+yqahFiTEb7utp8XpZWND5j+DCbaqpxjXbE3q7vBnJYFfTkbtfMTY8dgLMYNhbCKvBQamMurjThVwUlvcnakFyEKUQwYsKopaKMFkQ0eBA+SrbWgq+bQ6+kk4TJz24DAyRkpMUolhchiCVanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 03:53:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Wed, 26 Mar 2025
 03:53:54 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v7 3/4] tests/kms_async_flips: Add test for all
 async format modifiers
Thread-Topic: [PATCH i-g-t v7 3/4] tests/kms_async_flips: Add test for all
 async format modifiers
Thread-Index: AQHbnYCLE8olx2aj3UesK0WnbgeyZLOEyKcQ
Date: Wed, 26 Mar 2025 03:53:53 +0000
Message-ID: <SJ1PR11MB612913CC5231C0D030A9C631B9A62@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250325121625.2718374-1-santhosh.reddy.guddati@intel.com>
 <20250325121625.2718374-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250325121625.2718374-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB8151:EE_
x-ms-office365-filtering-correlation-id: 10a085ad-8a64-4ce4-c55e-08dd6c19d3d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Wk05gt7rdcoFGNpBLo8F8oGCG5CCgTSyIdq59LbrCm1o90KMWP8TEAPuyccT?=
 =?us-ascii?Q?rW/iQIcW7aGmNgtV9Vm3zJWxrA7UL1YWMToaZtdkRQba4waWf9jtsmboO6tb?=
 =?us-ascii?Q?weL1p/TkgIpgsc/CcRG2A/CU3b5hF68KPcEk3Sv5nySHQ+IkKsobpZOWODuE?=
 =?us-ascii?Q?xU6SRBNJyLmC81PQqUdSvkAp/fbthIHV30yfhlhIitfQy/JxwsYuL+E1gWv9?=
 =?us-ascii?Q?LepX1uLTzES8t/DyCZY57xcfP79o5VVQAIJ2Fp4l+CI+Z6sx3v9+iDxwOT1l?=
 =?us-ascii?Q?DCedufyUR21qRIGqkjfl7gQpTbJB5Z5rlaO3MxLxE3Z9VOsNa335NNJCirX7?=
 =?us-ascii?Q?HWFR8pUzVDVlDYsoU0xjYUjx3I11wr2jVSljYMARbOFz8pkZQ5xybXHcBT5q?=
 =?us-ascii?Q?e9jSdhvTW+3W+hcouH7rumZEi4go35n7n7XoIdKtPNOofnvrZw7qAbAybpRQ?=
 =?us-ascii?Q?OFfxi3KY89dXmgKxdCuovsjI3QIuQoqvD9XD8NYNy5Ggb5fsDLlQRRAd6n9h?=
 =?us-ascii?Q?yQ31qCrl9R0dxExLkzF2qwLLGwRiOARF2Etnthg/ELo9VWTE8jve8KakhETq?=
 =?us-ascii?Q?7Oh31p22t6m31rIVEZUR2RZPaGEHH7rB/MKbKg6Bd9yogZTGg3CdxoXDFZgm?=
 =?us-ascii?Q?enlGZvJtyUdpXUNwMJ3Q4Xy1a57uC91+8B62ryhznqHFg5L7O8SsaY6n4L4G?=
 =?us-ascii?Q?5dPMonDvxS7VKnli9t37EO9ucTgciBdJUZ9bhn3ycURLBNHAD7C5Qwik94O4?=
 =?us-ascii?Q?Oy7UNC/hrj80PZer5i01uqaaEgLzBIlMVIUEib3DCA2U/QzUJeQgPkwL35be?=
 =?us-ascii?Q?AvmwhxXz+7LdJjXSSHp1ZGypc8zFsa6QdOlx/aKgIzTHcowqhCOZMsesazCR?=
 =?us-ascii?Q?Q5cKZcJmdMX6vOzITpkmrLgwGdJhi6615cUHB9BVYD/48dUJ/QsOfiyPlKmV?=
 =?us-ascii?Q?CCUThhPgy7omuwWDF1lHha7ipwxtDIifdQvbtvGQhp92HTt9OGrwMqbAnTc7?=
 =?us-ascii?Q?oo7JYde0NS0vic6DTaPZ/HqkuGG2d/SyOi7dqUA5NdxbziPu3PJ1O4JnlJPT?=
 =?us-ascii?Q?ZtUc/m7fClhy0PfMA6Bh5n2lS8WEMqHz2Uy5m5m7sszLa9w3JmWMFjhkmflq?=
 =?us-ascii?Q?sNqcRcoJjFJOOXatkoIQJ/8g9BA74G9cDsYk3vc7yXLLLHgD7hw+BXUGhL3K?=
 =?us-ascii?Q?Z6lS1mfTMIcsekla3XRN8CwYVZTS6fY12fRnLz2AwbbV0pYba96u3jbeXHK1?=
 =?us-ascii?Q?gh6dxnhQSusvEY2T/uacjiFF3nCbw89VVUNf0Gf5mtKfE8C1aKRCCWOyL+at?=
 =?us-ascii?Q?XV4lpS4PHXebJOP1B9uMsZ8hjkeQaeMDve5fgXuVILoGceRROj/MlS5biv++?=
 =?us-ascii?Q?Tl2wxgRzIKqNt33jUEZn2Kx+TP9N9XAAXcGS2Qc6B0WMdl+Ej30MWkb0WPPk?=
 =?us-ascii?Q?a/hNjd6z+Mz9Sq3TD6y5nAijUQorgbYB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7PN5LE/H18CSIw8SXZAZkhI2L9gKLcudjfYTGyFzILGHXqxSJJvUfILCVrWq?=
 =?us-ascii?Q?25IZ1KiAizQ7jrg8llTqVirRc1aq8oF5EiFQFEi0HTF7XQK8ZUy8VkMGT5QJ?=
 =?us-ascii?Q?Yt/ujWLpREPPaYCXB5ylVBpzqiaiZ8aL/7Tnrw7k6+pzHyfQ9wTvB5kSy1Rn?=
 =?us-ascii?Q?p+RNZbIMB2E7f6LdhagP3sBnsoDrazS5Ufx5dUhoIlJkSgH+xGkGKd2Qvp+7?=
 =?us-ascii?Q?REbREovSngz4eO7HujBX4/CS8J52PkraFQNkzRJPofA802VnnsZAuHAAb0nV?=
 =?us-ascii?Q?tRONZ7LUh/UOOi+BJmh1TGTFFeIoh+l1UWzk+t+123guVbOHl1OinRhDa3Zq?=
 =?us-ascii?Q?JZhCnnuKZmtAb1wRzrjhhuHdyTrrO7gNxyQ6Y/DWssQH/nbKw6Z7T+Fxe+6F?=
 =?us-ascii?Q?AF0G1XiLGqWsHUKEXGDwoE2L9+dI3sBlKSudvtyTqoQUCUdk4h/E9BgJjUYS?=
 =?us-ascii?Q?X/4AF53XQay1LOfpf1wPYqiYdWdqstVv1vTGrlV+74mdJdTLglqhE/RQJ3a+?=
 =?us-ascii?Q?KnSeSTkqnye6WvhvxAYfsMi1LONwDkW+pHnEPX3WuDfxcHzT2qmr7zmtGTae?=
 =?us-ascii?Q?+HIqz0jGbUDOb9QP0ZMDxhw4HRA1Y985Vv3rpMD+5LJM1mBizTktXjuvUb4s?=
 =?us-ascii?Q?lvRaKI5rfWPaWkPlXnjk65+Z7h7TogAf3eTfRqzPyN5jHqEMXi5lrS4/kW3D?=
 =?us-ascii?Q?dkRssrGTkHR5u/yTNOHvXLjb+Kats6DNTaWjYmD5cYesoDIyqCsu/sTERdTu?=
 =?us-ascii?Q?LqiQZnMJJOlIzwj+z8u3XMEbrRpVp7Z8JifMiy3o+H4Jd0vvkTR5yxQyOnXH?=
 =?us-ascii?Q?sAMGALp3WvPpSxV5wPOxPVRmhnzJaNrquO5DTCvksOtYAKDaJW6RkQS6xGvZ?=
 =?us-ascii?Q?CtA2ss2bTAbDA86DLgcPrETvJlX+haMV8FmKamyHdxMfv84bHTGlgcCLliDC?=
 =?us-ascii?Q?otCSO0cbv9t5Ht4SGdr0ENLV3UaRz7Oeq7jLksDzGkHdDLllTcV4zWXgtZQL?=
 =?us-ascii?Q?SgPgUE9ZE3iFu6vbWk3J+QrteThSDAQInx3FJUgNZzzyBLY9b5+MYhAI6gqd?=
 =?us-ascii?Q?UbEU7sppEIYjTXkeyVflqyCcwHIH1h5bKS//wBtFXXAjZ3/WYIVahZ8iyQgN?=
 =?us-ascii?Q?rzk1RJDIhob1ewqRhTIXzGB/FcWFjVk9KJAKjTK40r1Pg0qBPoW9M668fduT?=
 =?us-ascii?Q?fXa3Ma8qhIRz0rgrCh1wsT/4Bsy/fbCTwuYsXa0NvIFd1oPvNmzARJZY+su1?=
 =?us-ascii?Q?aOfRo7CyUHAvBaJ8EHW9y4O92id+0kEglzyGVIe5V597sOEd//7jqafJRoxf?=
 =?us-ascii?Q?y7jgRPidMnIy8oHdMacR6LakQjax6jfLtOF4QOCJMfJtlN9vzSG+DLghE/mg?=
 =?us-ascii?Q?zNFaRQd8j8kCAjpWKePM7XJiwut1T6bTUWHhfswawud624UuGJoauAY2Z35q?=
 =?us-ascii?Q?RYHbd1Rf2/SSzWgeRm2/GJBvzqYGZGBm3NfjkcsE7S8XI8SnHcVFYvBEJjIt?=
 =?us-ascii?Q?FK/WrkPqk2cNQMjJuJbaGUnNK/SDo1nR1rdJi11gf2N7pzSzMj1QRlzsq6oV?=
 =?us-ascii?Q?UhaU/rcZfIC7Hb9JsY00XAofpkktq5A5GOD2GT+TR/yVwp8KUcWIVdvyvo4x?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a085ad-8a64-4ce4-c55e-08dd6c19d3d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2025 03:53:53.9923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nyWuZCLlPPglZ4OPDyQvq4X4+vmEInpi+wH3B+2/q+Lqqg7lVQuNkl6Vzd7UuR1aI91dqotOZsbIeNI9Io7uMLPeEBdMy5GWnfoDQpcBn3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, March 25, 2025 5:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v7 3/4] tests/kms_async_flips: Add test for all asy=
nc
> format modifiers
>=20
> Add a new subtest to iterate through all the supported async format modif=
ier
> pair and perform async flips.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 90
> ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 88 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 369318368..1fdd13b99 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -316,7 +316,7 @@ static void test_async_flip(data_t *data)
>  	do {
>  		int flags =3D DRM_MODE_PAGE_FLIP_ASYNC |
> DRM_MODE_PAGE_FLIP_EVENT;
>=20
> -		if (data->alternate_sync_async) {
> +		if (data->alternate_sync_async || data->async_mod_formats)


Looks like I made some wrong assumptions here in my last comment.

This will lead to

SYNC flip - > ASYNC flip (converted internally to SYNC) -> ASYNC flip

I guess it still works but if you want to avoid the first SYNC flip (which =
has no significance for the test) I would suggest having a different code b=
lock.

              if (data->async_mod_formats) {
                        if (async_flip_needs_extra_frame(data)) {

                                ret =3D perform_flip(data, frame, flags);
                                igt_assert_eq(ret, 0);

                                wait_flip_event(data);
                        }
                }

Before the final perform_flip in the loop.

Regards

Chaitanya


> {
>  			flags &=3D ~DRM_MODE_PAGE_FLIP_ASYNC;
>=20
>  			ret =3D perform_flip(data, frame, flags); @@ -360,7
> +360,7 @@ static void test_async_flip(data_t *data)
>=20
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
>  		}
>=20
> -		/* Reduce test execution for all formats and modifiers. One flip
> should suffice */
> +		/* Reduce test execution for all formats and modifiers.*/
>  		if (data->async_mod_formats) {
>  			igt_assert_f(ret =3D=3D 0, "Async flip failed with %s
> modifier and %s format",
>  				     igt_fb_modifier_name(data->modifier),
> @@ -730,6 +730,87 @@ static void run_test(data_t *data, void
> (*test)(data_t *))
>  	}
>  }
>=20
> +static bool skip_async_format_mod(data_t *data,
> +			    uint32_t format, uint64_t modifier,
> +			    struct igt_vec *tested_formats)
> +{
> +	/* igt doesn't know how to sw generate UBWC: */
> +	if (is_msm_device(data->drm_fd) &&
> +	    modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return true;
> +
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
> +	    igt_reduce_format(format) =3D=3D DRM_FORMAT_XRGB2101010)
> +		return true;
> +
> +	/* test each format "class" only once in non-extended tests */
> +	struct format_mod rf =3D {
> +		.format =3D igt_reduce_format(format),
> +		.modifier =3D modifier,
> +	};
> +
> +	if (igt_vec_index(tested_formats, &rf) >=3D 0)
> +		return true;
> +
> +	igt_vec_push(tested_formats, &rf);
> +
> +	return false;
> +}
> +
> +static void run_test_with_async_format_modifiers(data_t *data, void
> +(*test)(data_t *)) {
> +	struct igt_vec tested_formats;
> +
> +	igt_vec_init(&tested_formats, sizeof(struct format_mod));
> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		test_init(data);
> +
> +		igt_assert_f(data->plane->async_format_mod_count > 0,
> +			     "No async format/modifier supported\n");
> +
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			struct format_mod f =3D {
> +				.format =3D data->plane->async_formats[i],
> +				.modifier =3D data->plane->async_modifiers[i],
> +			};
> +
> +			if (skip_async_format_mod(data, f.format, f.modifier,
> &tested_formats)) {
> +				igt_debug("Skipping format "
> IGT_FORMAT_FMT " / modifier "
> +					   IGT_MODIFIER_FMT " on %s.%u\n",
> +					   IGT_FORMAT_ARGS(f.format),
> +					   IGT_MODIFIER_ARGS(f.modifier),
> +					   kmstest_pipe_name(data->pipe),
> +					   data->plane->index);
> +				continue;
> +			}
> +
> +			data->modifier =3D f.modifier;
> +			data->plane_format =3D f.format;
> +			data->async_mod_formats =3D true;
> +
> +			igt_dynamic_f("pipe-%s-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
> +				      data->output->name,
> +				      igt_fb_modifier_name(data->modifier),
> +				      igt_format_str(data->plane_format)) {
> +				      /*
> +				       * FIXME: joiner+async flip is busted
> currently in KMD.
> +				       * Remove this check once the issues are
> fixed in KMD.
> +				       */
> +				      igt_skip_on_f(is_joiner_mode(data-
> >drm_fd,
> +								   data-
> >output),
> +						    "Skipping, async flip not
> supported "
> +						    "on joiner mode\n");
> +				      test_init_fbs(data);
> +				      test(data);
> +			}
> +		}
> +	}
> +
> +	igt_vec_fini(&tested_formats);
> +}
> +
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *)=
)  {
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) { @@ -919,6 +1000,11 @@ igt_main
>  		run_test(&data, test_async_flip);
>  	}
>=20
> +	igt_describe("Verify async flip with all supported modifier and format
> combinations");
> +	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
> +		run_test_with_async_format_modifiers(&data,
> test_async_flip);
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++)
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> --
> 2.34.1

