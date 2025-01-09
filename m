Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ABAE7719A
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 16:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA1310EE67;
	Thu,  9 Jan 2025 16:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zy37ebm9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4890210EE51
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736441965; x=1767977965;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=WYW9HPxyFj/PgY60qVYxrg5f62CXS0w85874SORHuxo=;
 b=Zy37ebm9aMUQamQR03OXkaDkliBXwaCUhrScnk29rDRG5jEDFvy47rqF
 Qzddc9JAsa7oqVMDR1gGSOGLQoBbzK1eFeFrjkuYSuTJ8yxwGYYIrT6zw
 jSwmFZ94oCL254ZFsks2iqM0xFOpi/6UZ4A6cVPhLMFP5zAN2Z3GVX1gb
 jGoxilfP3uvTpjkPUWOgLYa4cyi3ALqqvkJVj4gmEW/hcsc9kqXr98enn
 fV4PNmxFOmbRGLrol9QlAHCy29WDDq38Y8YrtLsobGJk148awVj+O+anv
 ElXgk+pwnNJ+Ya7fjT7sZBGR2Ezs8U73989LCGIFvKABqrIs0eBi9TvH7 w==;
X-CSE-ConnectionGUID: FrxPd0TaQ7ualzpwbdBBkA==
X-CSE-MsgGUID: jnOB+2hnS1et8gspgOv9rQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47291418"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208,217";a="47291418"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 08:59:25 -0800
X-CSE-ConnectionGUID: 9PHyVGIyQ4yxRJW754z+DA==
X-CSE-MsgGUID: L7jU7Vx9TNON8BHPg7XvOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
 d="scan'208,217";a="103268979"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 08:59:25 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 08:59:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 08:59:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 08:59:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdqErWL3tLfI9ovVeaJH9BMi4QG9qU7/fZ23UxC0IcYBBjWCWYMTBlgRCxB7azMI9iYHF+lySKwVSicGuhZFz4R5cfsmbRtwaHKtO1HnlQB8vfaTYIqSBERLOFJBw0jDyzSHzCSWXtWohe0sIED0OvyP8UyxIX+jMXJ1UcUmAZrZkjYGgnYpY/Qi1A/YozE9Z2706/0VnLPvHE2naDCdHE2Kxp8GKba82mn9Kea0TM/KAIUIpFL5CV3VeT3Z0PANw5muGBdGpCfWFiN6OGnkQa2hRXKX2+GYkMZGs610rxKvP9+zIHvPP7zmVUrepMAA4H0tN4JGNiWsYZTtt172fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiNzV/20L6tHSo8RrPNtCrqbUlIgfD8MiORm8c6fwVE=;
 b=zW8Lj6oTl5uLQDlwObG8ePOb2+HEF7/RS6acFPhFcWyPOK7CL1XVOOIx1Rq2tZ/+UbjHD9VzFj/Zi3XuBnlbbtIF0XP1DEhOSiDofq/wDzReYaFdbMnrmsa6h6xrlHdNkfQnZvsIwIwAqDFR7mqdlwS2kv3akA4LwFYceW66UgjbZZNGSPXtWIFEWtT56MNI/fSo8ohxK2Iy9cZUUT3CaktHPosn5cEKns/oxQQWs1/ujTc5xfjdePABolUldOX0152Pn7UONKwrzGFFPL5puR/Oh8RGI2vtVK6rNP3dBN5k63v3tlDH8cWd3bfci5gXswh9MIQQHKcAnDG+FBwZGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA0PR11MB8377.namprd11.prod.outlook.com (2603:10b6:208:487::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 16:59:06 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8314.019; Thu, 9 Jan 2025
 16:59:05 +0000
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to skips
Thread-Topic: [PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to skips
Thread-Index: AQHbYnE5YMzYrg27okitfkWS7naCkrMOqg3d
Date: Thu, 9 Jan 2025 16:59:05 +0000
Message-ID: <SN6PR11MB27047C2A43C1513897388E25DB132@SN6PR11MB2704.namprd11.prod.outlook.com>
References: <20250109083858.39089-1-pranay.samala@intel.com>
In-Reply-To: <20250109083858.39089-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB2704:EE_|IA0PR11MB8377:EE_
x-ms-office365-filtering-correlation-id: 34ba3151-5d9d-45fc-ab88-08dd30ceecd1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?oGQBMFT4+ZQYYncpgJ+0rD+xjZc96mScWJXvTvrypMTLG0cR+cJLYGuRXl?=
 =?iso-8859-1?Q?8drP0tYgsFWdNklQMFLqGWbe2H6LNnjzg46mi63qXSoQqvV3GfCy/DfHPT?=
 =?iso-8859-1?Q?7olif1BBzxl7pL3yEUhTkRJsMdpTGOeOFoLanBu9w/sBtHPi1S3HOh2oEs?=
 =?iso-8859-1?Q?5posveX0ujIuIElLgOo4mFiiegRcKmFdsP8oVYxulhAPahtdy8mBw4Wgfw?=
 =?iso-8859-1?Q?CNdHwUOkOGDFVWWNgp8DqerBXxAZIh/pmwZ2dKmZ4q/HJszT8QKXzpVfys?=
 =?iso-8859-1?Q?cnGgT9uDBeuqPUv/WVflI01KtYMn8/OVYAnQVaR9RYSLsNKtJy4RYrH7Jw?=
 =?iso-8859-1?Q?QQz7nMkvbWwkHYTehNZ1+6qDVJdzxkJoh32Z72M1ITk3EDokEQEcrUcxGc?=
 =?iso-8859-1?Q?EWYr9FrPyEjHvKyq2ePegHyHZmQKLH7vQ634D6hGN2x1rBh4jBSYKv8ijQ?=
 =?iso-8859-1?Q?0LTuHDClkGDRphvmjWG3XTv/lqSfgnO8e73+HNSM7KmH0fFHx7hDXvBVy6?=
 =?iso-8859-1?Q?ln5MIyoZEhsrOMB8Eb2r625fqMxyvJcbo+/n48k3s+Ri+gfI1Y0PNgcGP+?=
 =?iso-8859-1?Q?aDoMwm9NCI4EFGtr4HjlqWn6aeNJl6dD3gQdcITDqrn1na7uEjvrwg5Zew?=
 =?iso-8859-1?Q?tF6RE2ojCCcp9ceRSr53h8XfNlFahx0cPdE6EeW7NZa29GuwW9D+L4keRO?=
 =?iso-8859-1?Q?hZm8BIrYzw82tDrxN41PZaTLS89N8jiN2CNLb+6ktNs0NpgBUadK8J3t9R?=
 =?iso-8859-1?Q?Si90yLP/h35W/cPtY1Xct6jDDe3RhI+kjrILIgxnFbOjcBuaBy9y5ZLls3?=
 =?iso-8859-1?Q?Q6TOg99Y2hnLR/MpHYq9cA15jQ7OvBMTh2BxadvAVDkVdJ4aFvE23U55kd?=
 =?iso-8859-1?Q?AAeSTY0pFp5uLHw/MQ1Z+pQLYCGXA7Kw+6zIzJo82c8K54c8n5yVLaOfYJ?=
 =?iso-8859-1?Q?HWGE/XNPybuQ6tAlvoW4CwuS+sQ/xLs8PzLPI/7ihibP4oo40ITVp/+HGV?=
 =?iso-8859-1?Q?jm58tQtZEntPqaxO7NHtrPA1jsG/neXbRV4O90jMBCUIudnJMyRECT3CR5?=
 =?iso-8859-1?Q?PadC/8BStH3g+2hH3qxF0fFULU3e7h6q9Dv/q6KTMBTKlCaZeKuXhookHn?=
 =?iso-8859-1?Q?mZsRl/RSXUveTuXD53nhY7s+vKvY1gwTmyLuo7XZ49GNOhTYpKIyvCmLbp?=
 =?iso-8859-1?Q?ewHgIwN+qDX47cYuD747H95WNZ2zFQk1t2jdpoVPpNrahpMBQ8Co44DE2+?=
 =?iso-8859-1?Q?OdaouJmLrCd3rc0cDOxzwkv0MQdI9CvBr3NDMTDu1s3IPMdjARZ/Qsn8V3?=
 =?iso-8859-1?Q?7U4FASWUcVJ9+w2vGFlVWI/Cl31dJ6wWZK+56GfYMQIGKIB0bW8DjZNHz0?=
 =?iso-8859-1?Q?9R+b3ELyGSodaV+X0Wtr1R4HW2X8kP7qduQqx/qAleGHaJr1xjqLBnMlwp?=
 =?iso-8859-1?Q?TF5LfBloue+rs2I9qH1AV2FKKIi16QG8iUYSfRCYpluh864jFS/4n2zQZV?=
 =?iso-8859-1?Q?eDPcMzOjcpMwBJPqaDa8PU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?9G/JEabXswKHSd+z2wgHeDtEb52TDmtBZ+mdJPcbWEF0SQNdfW65nPtZXg?=
 =?iso-8859-1?Q?akDyLvSYjdgEYkFw4FN+2AOHYgAMzmsLCc5Qq4VvCd01JdJ2trnmBiar5Y?=
 =?iso-8859-1?Q?GAz4P/C3CavBDiyTbnyw0gGZxWmLQPVQbxoNfeLNrR1my+3J8Fx3bIwft6?=
 =?iso-8859-1?Q?3cNMQsDLy4xloGgGPagdY1dHdwGzpGuxFcEFMWeQSynBM0SkA6s/LlJYNT?=
 =?iso-8859-1?Q?1HXuDQpTfhklFaBpBz7s1WgsAlUwE1BOBSUxBi6i96c6ZCADnptWXnhA+S?=
 =?iso-8859-1?Q?3Fu6GVLSn0pFJ6shrwRbNO/CagciMOvAmaYC7gwy9gcRNFIDqr3Zem1rN+?=
 =?iso-8859-1?Q?t0SKnrrsxfJR1G6j1ir5HocRckEa+ZZBAbAQR72KHL/wFwL6TocYSy43Sp?=
 =?iso-8859-1?Q?MzJf1u+RPho1rOawMblj9cZZJUFW/faKUZLOzw0AkOg5crh4I2Q6FHm5kM?=
 =?iso-8859-1?Q?xkP1ONT66OlOdGfEQrflD4gg1V5a99GAud9JDmKZQgNgLqDTqd35KNjfKZ?=
 =?iso-8859-1?Q?EAmDBpV9KeuK26d5UyMP1xsWTJsvYpuVTJSsoABXKFsSWtrHLFQoDhw80p?=
 =?iso-8859-1?Q?POVvw6dAIqxR0qPfYY7t+YMCEQ+52yojgMqwmI1dPbrdBledSnPBvvpgff?=
 =?iso-8859-1?Q?6VxGI75V9SlfPMPXebBCIPelciyycl+PqzbxmeeNls1fQboIlOBFu+eQ+w?=
 =?iso-8859-1?Q?zmuAn+UgFq92ub3UZgyUyoTjNuyB9TA3RsgMXxn0wl3RmVbR4PqpmWWuT1?=
 =?iso-8859-1?Q?dXK68OknUyG0rI04fVUCGy8U5QhxZ4N5bxprZKLWb31YxEWRQTODvDsBf4?=
 =?iso-8859-1?Q?tUWR8jXJglVbylq51LslAteE7pTTMXhOWQ6dhzoiPU9VIP+cZl7WPkXqGh?=
 =?iso-8859-1?Q?s1VaFIv8Bq1c9chefHjtXuaVLmvv99lckXQ8DGhu6bP7IAAe27XKyuoKOT?=
 =?iso-8859-1?Q?qOZC8E9YnSLh7M4iV8eqg6FTyUUq/13EouC7L5nA2OdfvZA4ixYN2MU5G9?=
 =?iso-8859-1?Q?6mQdyzV1l+70pfzrAmaKebKAXsmUqWx9yZ/VKXhZqYe62rAJNuhbWPKOz/?=
 =?iso-8859-1?Q?SnBhWs+zBQj4ihD+KRM1OXZEA1u5u4ENeEKJLaLQaCbcO7XVfV93JjsJJy?=
 =?iso-8859-1?Q?kTG15ubcNJFalfM8uqxvhks8fwdCTVh6mgC02D8414Qm3+9e50Igsq290S?=
 =?iso-8859-1?Q?8E9XR0U+J/DRNVvTOvhqzWfoazoVR15Jb6BYv6YG4+bRlxq9CpL/HA/693?=
 =?iso-8859-1?Q?RY+msRkK7RhCBm0N+glEqdfqtiSJzOkjcU0Z0qzogEdKJXROahVC9j6FBz?=
 =?iso-8859-1?Q?zYqCoy+1lPztfT0HpHzfvbu58++G6wgojuMsvdoqNoZrqurIz1SFtVhdlC?=
 =?iso-8859-1?Q?HxHZwolwmQpmxCHREwuj2pNbgPkf6qKEYAevK47R+lloz/0kYTYqbpd5da?=
 =?iso-8859-1?Q?becKNhDwTWJ+58g7WKHyK0aa/H0Ly1Mi1353KPt/+qMiE7ac5yZ7S0/GdQ?=
 =?iso-8859-1?Q?S4ddT/c+cwGhzBj6FzxzNkWf1CWcS3VFjHW1F+DXZ5UqBXRH8VlTjWa8NR?=
 =?iso-8859-1?Q?+Q1nHGFeFSNCoiIxmVn6+ZqbcCn3/5wfA045mT8+3YO9uIO5WJkNNVY4mH?=
 =?iso-8859-1?Q?ArkFCc9mKCkeJIMBkl0vCgCjy4PTePoEHemCzrDc9iGPbrDrcUQ/cNOQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB27047C2A43C1513897388E25DB132SN6PR11MB2704namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ba3151-5d9d-45fc-ab88-08dd30ceecd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2025 16:59:05.0795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDPGKba4DjRLvWL3yTAv9cVp+n9Z1/wUghdttg7lc1bHpbtiq89bSCrrP+M91YLf+MvCqPJ1pA2Hzp36LuFtUYBvmag230mxpF7YponC5Gi5ymoLM7+gEn09i2XQaKwS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8377
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

--_000_SN6PR11MB27047C2A43C1513897388E25DB132SN6PR11MB2704namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Pranay,

________________________________
From: Samala, Pranay <pranay.samala@intel.com>
Sent: Thursday, January 9, 2025 2:08 PM
To: igt-dev@lists.freedesktop.org <igt-dev@lists.freedesktop.org>
Cc: B S, Karthik <karthik.b.s@intel.com>; Reddy Guddati, Santhosh <santhosh=
.reddy.guddati@intel.com>; Lattannavar, Sameer <sameer.lattannavar@intel.co=
m>; Samala, Pranay <pranay.samala@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to skips

Having some logs for test failures & skips would
make debugging much easier.

v2: Add output/pipe name for detailed message (Santhosh)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
LGTM
 Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

---
 tests/kms_plane_scaling.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c8c9aee31..43f578d55 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1577,6 +1577,12 @@ igt_main_args("", long_opts, help_str, opt_handler, =
&data)
                                                                        kms=
test_pipe_name(pipe), igt_output_name(output))
                                                                 intel_max_=
source_size_test(&data, pipe, output, mode,
                                                                           =
                 intel_paramtests[index].planesize);
+                                               } else {
+                                                       igt_info("Unable to=
 find the lowest " \
+                                                                "refresh r=
ate mode on output " \
+                                                                "%s pipe %=
s\n",
+                                                                igt_output=
_name(output),
+                                                                kmstest_pi=
pe_name(pipe));
                                                 }
                                                 continue;
                                         }
--
2.34.1


--_000_SN6PR11MB27047C2A43C1513897388E25DB132SN6PR11MB2704namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Pranay,</div>
<div id=3D"appendonsend"></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Samala=
, Pranay &lt;pranay.samala@intel.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, January 9, 2025 2:08 PM<br>
<b>To:</b>&nbsp;igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop=
.org&gt;<br>
<b>Cc:</b>&nbsp;B S, Karthik &lt;karthik.b.s@intel.com&gt;; Reddy Guddati, =
Santhosh &lt;santhosh.reddy.guddati@intel.com&gt;; Lattannavar, Sameer &lt;=
sameer.lattannavar@intel.com&gt;; Samala, Pranay &lt;pranay.samala@intel.co=
m&gt;<br>
<b>Subject:</b>&nbsp;[PATCH i-g-t v2] tests/kms_plane_scaling: Add logs to =
skips</span>
<div class=3D"elementToProof">&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">Having some logs f=
or test failures &amp; skips would<br>
make debugging much easier.<br>
<br>
v2: Add output/pipe name for detailed message (Santhosh)<br>
<br>
Signed-off-by: Pranay Samala &lt;pranay.samala@intel.com&gt;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">LGTM</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; c=
olor: rgb(0, 0, 0);">
&nbsp;Reviewed-by: Santhosh Reddy Guddati &lt;santhosh.reddy.guddati@intel.=
com&gt;</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
---<br>
&nbsp;tests/kms_plane_scaling.c | 6 ++++++<br>
&nbsp;1 file changed, 6 insertions(+)<br>
<br>
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c<br>
index c8c9aee31..43f578d55 100644<br>
--- a/tests/kms_plane_scaling.c<br>
+++ b/tests/kms_plane_scaling.c<br>
@@ -1577,6 +1577,12 @@ igt_main_args(&quot;&quot;, long_opts, help_str, opt=
_handler, &amp;data)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kmstest_pipe_name(pipe)=
, igt_output_name(output))<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; intel_max_source_size_test(&amp;data, pipe, output, mode,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; intel_paramtests[index].planesize);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; igt_info(&quot;Unable to find the lowest &quot; \=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;refresh rate mode on output &quot; \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;%s pipe %s\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; igt_output_name(output),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; kmstest_pipe_name(pipe));<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
--<br>
2.34.1<br>
<br>
</div>
</body>
</html>

--_000_SN6PR11MB27047C2A43C1513897388E25DB132SN6PR11MB2704namp_--
