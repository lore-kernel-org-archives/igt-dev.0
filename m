Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D82DC3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 12:01:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5206610E137;
	Wed, 31 Jul 2024 12:01:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QKmo53An";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688E10E137
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 12:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722427281; x=1753963281;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Tpdmh7GQ4Hwh/+D/v3CExQYhHqG8dc2Kmq2w1SyJ6ak=;
 b=QKmo53AnCCbKZS3qsDkKK5X+gnd+RfiGT8OMFaztkIa/7a3E2bubbPmU
 X18TWv26nhzr1ny7bISfmo7VBnck1AYQZywLj31PfUcqq0gFU9z9My/kZ
 cUb2FW+TYBomsAxE5LN1wZxwIa6FVxLnayVEx8cju1AZqSnc5IO9rVAlE
 zXv+7v7yLPxcXSNmgboL7JIwuZ5SzUDh1gerVHfkida9F+ZksBzI2e+jr
 seC6RCk2d33ULHC6hDeEjOZYArEa3ZnebFHVszCnHNRC/cagIJ0B1RL6u
 tO80buig+XelxQXJktdKQxtnKw7PJVaPXfYPYX1SCT/O2MNI92+Mnuw5d g==;
X-CSE-ConnectionGUID: 1Bcc50hDRlmDmF2eZmNR7w==
X-CSE-MsgGUID: FiWLQZoEQdK5owt7rH+SOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20438520"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="20438520"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 05:01:13 -0700
X-CSE-ConnectionGUID: +s6XD64PSZ6gf/CyfDmWRA==
X-CSE-MsgGUID: fD+ZxZOiSLi3VickXgD99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="55463456"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 05:01:12 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 05:01:11 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 05:01:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 05:01:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 05:01:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEiXN+nCQadnYNo5Bo5Zhj3p5t0Qq20Rw7YXXuKy6rFPKr1Q/MwCEQ2RZG2sB5tw8AuSSpC150J7uMPEnHVFy0E2kP4YdV3P1pyuVoy7BmpB+1Sw5Y5oweXI9jf8xBpTb3BoFGsUPwfV/T8KM6rMofiLeIF4hy07Mh8IwUTxKpSzq9Y59v8aBvTQPXnkD/oXKpC3QmllogMUiHhA97oEPPuhLTSr50FPFffLg7WzhrL57vIcYx1P+901TXIits7lrFm5t2HsXm47Ei0VQTUrQxiPxwnTHRmTFUhjW2DhcTMF5IAjhx3U+73fCVX3YBqlZge8sTtER2daLko+k4mA9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tpdmh7GQ4Hwh/+D/v3CExQYhHqG8dc2Kmq2w1SyJ6ak=;
 b=gX4xzn8zMQTme+TZPQYc7vpkMLFgfb8r8HRtOKW4eq4xufNBOiyR9+Cm4JOWQFgv0GIadL/z4fCD98wiYxehZ/frddtLWXhuK4KLh5eY/synXxaq4W6gwZErdIS9mu54Z7e0hgmaMBglDzWx4ojp2ELnMyjiN9d/XL3+FdSojzV4JcLgf3gC3Sp/VLFsv/ZRyg6AjGBImgXMhk4pdGRgD6prH2M4GWVY7KZG75l8UfR3odwVDBpzDosci9wc3hZUchHKwmUaygUZizQyrjkIBbgx+cwpqvFYIAOyHYTvdWAhrvlKJJeuBCsm1YKg+59exIpps+NzLOF5xXdb7SYE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by IA1PR11MB7246.namprd11.prod.outlook.com (2603:10b6:208:42e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Wed, 31 Jul
 2024 12:01:07 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%3]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:01:07 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Thread-Topic: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Thread-Index: AQHa40AOGevBhT6gyE6mOB8idZEZZLIQufDw
Date: Wed, 31 Jul 2024 12:01:06 +0000
Message-ID: <CY8PR11MB68894E3E845484405114DB06DAB12@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240731120215.2946412-1-jeevan.b@intel.com>
 <20240731120215.2946412-3-jeevan.b@intel.com>
In-Reply-To: <20240731120215.2946412-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|IA1PR11MB7246:EE_
x-ms-office365-filtering-correlation-id: b7d869fc-c026-4545-75d7-08dcb15875c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3NNCvIguQZJourblpneshOeMySwMeRePO2WOvOdSLL4P8Y9bV3vXHVVUMsdo?=
 =?us-ascii?Q?h1vuqqu0mUmcgNlTUG9vo1y0qNwj0KK5PdCN+FfFQkbYmiyEwGXIa8fvOvQ0?=
 =?us-ascii?Q?85WVbdOxHiMHu1pFHaPfavgxdlcZiMNL779Jd7lL+0yTdR/GyZF87f+fWRhA?=
 =?us-ascii?Q?fP244k3dNSr0Ec/c0wkclz74slB6zSEy3yapDuMHztHj0S5pu8OXImOR/OGS?=
 =?us-ascii?Q?f3iR3g5pETSl+2IuMPffGIJHAyDJYzfL64SvEZc8B0wwXUAx6tfuUBGxuAZc?=
 =?us-ascii?Q?bqh03kgMmOyksbgrAXo9ICtZZTW3/55dJxcADQoND4UAkY0D+POC9k5mr8np?=
 =?us-ascii?Q?0sYJJ5GJO9Pn5mY4AqNToJwgjcJg2ROpk7+bhZoITkQu79gIsDFv9Dx3cvBg?=
 =?us-ascii?Q?Jtz+vQlz8R4vJNMFa6+zFii1VveGDUQ14HU/Pg749IXjKM41+fgXz6cXPLHg?=
 =?us-ascii?Q?d2e1dqN2FoWb+Hy8O2WqQE6fqiQsE8tQgHcIna9flJzXJI0Dg5u95PvX1OaJ?=
 =?us-ascii?Q?KbM3VvYFwNfhtJ+YFBn1V+IRpg0m2yw9EHBf5SG6AW5VvBhSdnT9aS78yfLd?=
 =?us-ascii?Q?c7kny0t/nbdDMDikhcspBmkZx1oYFj4FBCjYrHdz1Ue9Ls+DC2dNGieATWP/?=
 =?us-ascii?Q?gChsp9oirSPnRyHiNgVj2imT7nIUBGc+Lb37TSi0Y21jSEBQM8WZC7Cx1Xkj?=
 =?us-ascii?Q?KWk6d/ievqGu4Magkm6UxDlT24jEzazPhmaj3w/awu9Xll+q3BBpsV2SVg4S?=
 =?us-ascii?Q?cSLGoBLNbxFK6Qtw5olUvmhI3J0oHO5Q/AVncozzxdHwKaZmXphfvT5efeAT?=
 =?us-ascii?Q?cTTUlNQIU3D5aQqgivGmk+9DDVSp4A45ST7WmpSnYHg3AATaepnG0mSVuetJ?=
 =?us-ascii?Q?uewPRL0wpK7lvr7DAYa4fW0gTKUuHopR/extFliQ45bSa0/lMVjtPNAcT3UT?=
 =?us-ascii?Q?vfl74MnKr0h+iL9aRwk1xhAYyu9UdEktkAwV0XWx4lNYcqMp9uAaeQTiyubf?=
 =?us-ascii?Q?YnQS0mwYKM1scPL39H2KsrLUkFHN0Euc+tpPn9g5Gsbu1EZXn3EzSkK7j39q?=
 =?us-ascii?Q?xn2x518S31BX+50+JkmP9v5QwYXmvWeEZBlp2HjSUBISM/lAIidTYQ9BE+qv?=
 =?us-ascii?Q?QBiTTblDCzJO253TmslvxmqX2a+0hvTQ2XtJSS8asvo1SctVdy+zdLBentE4?=
 =?us-ascii?Q?O4vp2kvxczM5j+oeK2iYFQ3pS2QIyJWoG8i3bH400APcaF4s/4ptKG6BSlzh?=
 =?us-ascii?Q?4etSxOiiFFPfWMcrNRVVHRonNJkiePJBHw1DjK9mDGZaD8RehZ+0OSiIQcfB?=
 =?us-ascii?Q?lfiW5+H00dthQ92yAFFnBSh9H35P9FKCuoxfID218XfCvrXYxAtuSpPCCWos?=
 =?us-ascii?Q?h+mWYAvMSHyo3xNP+YuB4ubr2yuVj5XVMZTNG8865nAy3QleuA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4BPrTX0X8P5xwql5lNd5kmb51ziB+edvygkJgQT64D3BtEDPlcJBHLy7I1Rk?=
 =?us-ascii?Q?88pyyFaVbFxj4sf3jj+pfCPk2SyXr6EZO10BHRjKO3mUQ6un0wxx4rxBZ/Pk?=
 =?us-ascii?Q?z7aHVRKTkmmI49Wm4m9u3OPkMR8Wc7h/WP7/mUNx3IgZHCz81eJ6qPyjVQNQ?=
 =?us-ascii?Q?4zJThto2ozh34w7fQig7LrJmgLDO2wyaS7rwNiiPt/r0rUXzFv7D9BfCzXDF?=
 =?us-ascii?Q?AOEF2zjBze0cfOFgfZv1rftRh5x4WwPoAQno9BRSoqf/sajQBGGcF1wkG43x?=
 =?us-ascii?Q?Ue/C88ixcNeRnuaxWDY6MWT9KtD4rn7qKWHDbdK2IqvYB1QGX+VYPIaL1SKU?=
 =?us-ascii?Q?sMU/L/XfbINABvNPDsiigzCJ85mz+jS5RZqPsxTYSQHRdXglIgcnOOUUntwI?=
 =?us-ascii?Q?Un6Ri0Xp5UCjP6OJ7P6jjhSJRKviDB9sxIw4TitJoYDt5omgnu86HsvV2kSF?=
 =?us-ascii?Q?6dJ/zW+ztZAzm0NmzwJfDh9I908NPBG+to9OpgpmoY/O98hOmNGuEks7etBv?=
 =?us-ascii?Q?2PB+590XlsiP5FSQr/vqMYeeEO32QcD5fZb0nPKq3MXf7u5a9TllNRYoPmKG?=
 =?us-ascii?Q?C0kX49gf9cQvkHEf+UEmhIuOLPHaogjvpo5mNevgt0gIHJXh2sV8ya9le2T+?=
 =?us-ascii?Q?uHf6v3fwdnj11mkXxSSa/xAVdWZi5LbFTC3NGIgjgcGem8QZ+ijxX3mdjx8Z?=
 =?us-ascii?Q?2LkLbnYqqvcObAwZqu/VbT6JjaGpXZK6kl2KtcPM0jFTTX0fKOay4S7yVatK?=
 =?us-ascii?Q?ip9k7g2piyx0c7ZFEXxUcVbEIOOwuRm5tCVIN/Jh7bxDwcnsZqrTkiUs6fu5?=
 =?us-ascii?Q?mLXe8bg/69QzMPhULGjT7IATEgS1/+xDrnGCfIEKFw0ekxW1Kqvi35a9OcAL?=
 =?us-ascii?Q?8nRPwKdFz0M7I55XCGPu9rQbc3HTrYytug3DZ2SvI0TXwc1Vz2gA5kF5ig74?=
 =?us-ascii?Q?TyAR5aV51cHNhv1yFSpWovdPsnj5M2+Yy0/P0IbnLGdhNcPO+hw/xFUN2wI9?=
 =?us-ascii?Q?VBeBoFcG5znjtwve29Ks3CcRIOrMof19GGBi1k6mQuN8OR3J0xekJK9Hsj3v?=
 =?us-ascii?Q?IChlihhEc+sJgzvh4uIZNpew5DBW/xHhM6RK2DP6FPgphgyukbC0fa2mStnV?=
 =?us-ascii?Q?8K78g+QrVbuEFvy9vjCBEkFWUklStGa3NQQ9m0gLODnKMwkO8yXDeMtPQQXA?=
 =?us-ascii?Q?QDgyMzMSX6nN3ci6xtN7Kx5SA/KK9CumeXpBSSQr6qKP9O20S1qwy53NO2PN?=
 =?us-ascii?Q?FE1BNfqAR4rXDObna74dtU1AEmIsK2kKL6OG8TnVCqKrn1lhsZg2ADMo0xuz?=
 =?us-ascii?Q?iMWIaWzxLQRht+aOod+a36EpveS7bHM6s39G1B8l//VEq8EubpNr8tK3zg0o?=
 =?us-ascii?Q?YCXN73PvKVzXGuQEzO7trgv9bzdINUyzWWVrbjVyyEMCdNbtFvBmqptg2wNH?=
 =?us-ascii?Q?R6BfhAXo4WJwHrY3g7wdVQ7+7sbt6hz0EV8QVybQk9Upuz7Ex6yeJNa3j2ui?=
 =?us-ascii?Q?1g5jTSUR1MITWugrSBw9s+7VheioZTEUcIaeM4aHkQo1M0OCyEFsEbmdWBya?=
 =?us-ascii?Q?+ht3dU7Egjm7096aqu/YH/rNGISojb77GmsQoLhv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d869fc-c026-4545-75d7-08dcb15875c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 12:01:07.0159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q5C3p9Pg+cClkeKbsHA5Ka1eYwxuC2/uNVrysReNmkwtsJ0668gPE3eZL1Nq0xd59HZuOwmqnspHTvTpoy4Jkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7246
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

Hello Jeevan,


Regarding one of the changes suggested

We got feedback from Animesh, for now you can add a fixme once we have kmd =
changes available
You can add this check.

From Animesh
"Lobf can be enabled when (Set Context Latency + Guardband) > (First SDP Po=
sition + Wake Time). I am not sure waketime and sdp position details are us=
ed by any other igt tests are not. If needed I can add part of lobf_info de=
bugfs entry from kernel."

LGTM=20
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>

can we have execution before merging with required kmd patches?




